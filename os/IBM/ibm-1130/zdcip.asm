                          ABS                                           ZDR00005
                    *************************************************** ZDR00010
                    *                                                 * ZDR00020
                    *STATUS- VERSION 2, MODIFICATION 12               * ZDR00030
                    *                                                 * ZDR00040
                    *FUNCTION/OPERATION- DCIP PERFORMS SIX FUNCTIONS  * ZDR00050
                    *   * DISK INITIALIZATION                         * ZDR00060
                    *      * SECTOR ADDRESSES ARE WRITTEN.            * ZDR00070
                    *      * THREE TEST PATTERNS ARE WRITTEN TO THE   * ZDR00080
                    *        DISK, READ BACK, AND COMPARED WORD BY    * ZDR00090
                    *        WORD.                                    * ZDR00100
                    *      * A TABLE OF DEFECTIVE CYLINDERS, IF ANY,  * ZDR00110
                    *        IS PRINTED.                              * ZDR00120
                    *   * DISK COPY                                   * ZDR00130
                    *      * DMV2 CARTRIDGES ARE DUPLICATED EXCEPTING * ZDR00140
                    *        THE CARTRIDGE ID IN SECTORS 'IDAD AND    * ZDR00150
                    *        'DCOM, AND THE DEFECTIVE CYLINDER TABLE  * ZDR00160
                    *        IN SECTOR 'IDAD.  THE DMV2 RESIDENT IMAGE* ZDR00170
                    *        SECTOR OF THE OBJECT CARTRIDGE IS CHANGED* ZDR00180
                    *        TO REFLECT THE DEFECTIVE CYLINDER TABLE  * ZDR00190
                    *        STORED IN SECTOR 'IDAD OF THE OBJECT     * ZDR00200
                    *        CARTRIDGE.                               * ZDR00210
                    *   * DISK DUMP                                   * ZDR00220
                    *      * SELECTED SECTORS MAY BE DUMPED           * ZDR00230
                    *      * THE OUTPUT DEVICE WILL BE SELECTED IN    * ZDR00240
                    *        THE ORDER- 1403 PRINTER, 1132 PRINTER,   * ZDR00250
                    *        CONSOLE PRINTER- WHICHEVER BEING BOTH    * ZDR00260
                    *        AVAILABLE AND READY                      * ZDR00270
                    *   * DISK PATCH                                  * ZDR00280
                    *      * ANY NUMBER OF WORDS (INCLUDING THE SECTOR* ZDR00290
                    *        ADDRESS) OF A SECTOR MAY BE CHANGED.     * ZDR00300
                    *      * THE CONTENTS OF THE SECTOR IS DUMPED BOTH* ZDR00310
                    *        BEFORE AND AFTER CHANGES ARE MADE.       * ZDR00320
                    *   * DISK ANALYSIS                               * ZDR00330
                    *      * EACH SECTOR OF THE CARTRIDGE IS READ 16  * ZDR00340
                    *        TIMES.  IF A READ ERROR OCCURS A MESSAGE * ZDR00350
                    *        IS PRINTED.  THE SECTOR IN ERROR MAY BE  * ZDR00360
                    *        DUMPED AT THE USER'S OPTION.             * ZDR00370
                    *      * EACH SECTOR ADDRESS IS CHECKED.  IF AN   * ZDR00380
                    *        ERRONEOUS SECTOR ADDRESS IS FOUND A MSG  * ZDR00390
                    *        IS PRINTED AND THE CORRECT ADDRESS IS    * ZDR00400
                    *        WRITTEN.                                 * ZDR00410
                    *   * DISK COMPARE                                * ZDR00420
                    *      * READS CORRESPONDING SECTORS OF TWO CAR-  * ZDR00430
                    *        TRIDGES AND COMPARES THE CONTENTS WORD BY* ZDR00440
                    *        WORD.  A MESSAGE IS PRINTED IF ALL SECTOR* ZDR00450
                    *        WORDS DO NOT COMPARE.                    * ZDR00460
                    *ENTRY POINTS-                                    * ZDR00470
                    *   * START IS THE ENTRY POINT FROM THE CORE-IMAGE* ZDR00480
                    *     LOADER                                      * ZDR00490
                    *   * DX030 IS THE LEVEL 2 INTERRUPT ENTRY        * ZDR00500
                    *INPUT-                                           * ZDR00510
                    *   * N/A. OPERATIONALLY, ALL PARAMETERS ARE ENT- * ZDR00520
                    *     ERED THROUGH THE CONSOLE ENTRY SWITCHES     * ZDR00530
                    *   * PATCH DATA ARE ENTERED THROUGH THE KEYBOARD * ZDR00540
                    *OUTPUT-                                          * ZDR00550
                    *   * N/A. OPERATIONALLY, ALL PARAMETERS ENTERED  * ZDR00560
                    *     THROUGH THE CONSLOE ENTRY SWITCHES ARE RE-  * ZDR00570
                    *     CORDED ON THE CONSOLE PRINTER               * ZDR00580
                    *EXTERNAL REFERENCES-                               ZDR00590
                    *   * NONE IN THE USUAL SENSE.  ALL REQUIRED SUB- * ZDR00600
                    *     ROUTINES ARE ASSEMBLED INTO THE MAINLINE.   * ZDR00610
                    *     REFERENCES TO DMV2 TABLES, ETC. ARE HANDLED * ZDR00620
                    *     BY A LIST OF EQUATE STATEMENTS.             * ZDR00630
                    *EXITS-                                           * ZDR00640
                    *   * NORMAL-                                     * ZDR00650
                    *      * UPON COMPLETION OF AN OPERATION, DCIP    * ZDR00660
                    *        RETURNS TO THE BEGINNING OF THE PROGRAM  * ZDR00670
                    *        AND ASKS FOR ANOTHER OPERATION           * ZDR00680
                    *   * ERROR-                                      * ZDR00690
                    *      * IF AN ERROR IS DETECTED IN AN INPUT PAR- * ZDR00700
                    *        AMETER, THE OPERATOR IS ASKED TO RE-     * ZDR00710
                    *        ENTER THE PARAMETER                      * ZDR00720
                    *                                                 * ZDR00730
                    *TABLES/WORK AREAS-                               * ZDR00740
                    *      * MSSG(X) ARE INSTRUCTION AND ERROR        * ZDR00750
                    *        MESSAGES PRINTED TO THE CONSOLE PRINTER  * ZDR00760
                    *      * TABLE IS A TABLE OF HEX TO PRINTER CODES * ZDR00770
                    *        FOR THE 1403, 1132 AND CONSOLE PRINTERS  * ZDR00780
                    *ATTRIBUTES-                                      * ZDR00790
                    *      * REUSABLE                                 * ZDR00800
                    *NOTES-                                           * ZDR00810
                    *   * TYPE0 AS INCORPORATED IN DCIP HAS BEEN MODI-* ZDR00820
                    *     FIED SO THAT THE CONTROL PARAMETER'S RIGHT- * ZDR00830
                    *     MOST HEX CHARACTER, WHICH IS NORMALLY NOT   * ZDR00840
                    *     USED, HAS THE FOLLOWING MEANING:  IF THE    * ZDR00850
                    *     RIGHTMOST CHARACTER IS 1 THEN THE BACKSPACE * ZDR00860
                    *     AND ERASE FIELD CHARACTERS ARE NOT RECOG-   * ZDR00870
                    *     NIZED.  THIS CHANGE WAS REQUIRED FOR THE    * ZDR00880
                    *     DISK PATCH SUBROUTINE WHICH ACCEPTS KEYBOARD* ZDR00890
                    *     INPUT ON A CHARACTER BY CHARACTER BASIS.    * ZDR00900
                    *     ERRORS ARE CORRECTED BY REENTERING THE DATA.* ZDR00910
                    *     IF THE RIGHTMOST CHARACTER OF THE TYPE0     * ZDR00920
                    *     CONTROL PARAMETER IS 2 THEN CHARACTERS READ * ZDR00930
                    *     FROM THE KEYBOARD ARE CONVERTED TO EBCDIC   * ZDR00940
                    *     BEFORE STORING THEM IN THE USER'S BUFFER.   * ZDR00950
                    *     THEY ARE STORED IN THE LEFT HALF OF ODD     * ZDR00960
                    *     BUFFER WORDS AND THE RIGHT HALF OF EVEN     * ZDR00970
                    *     BUFFER WORDS TO FACILITATE PACKING TWO PER  * ZDR00980
                    *     WORD.                                       * ZDR00990
                    *   * THE 60 WORD BUFFER (W3840) IN PRNT3 USED FOR* ZDR01000
                    *     OUTPUT HAS BEEN EQUATED TO AN ADDRESS WHICH * ZDR01010
                    *     FALLS WITHIN PRNT1.  WHEN THE 1403 PRINTER  * ZDR01020
                    *     IS BEING USED PRNT1, WHICH IS NOT IN USE, IS* ZDR01030
                    *     OVERLAYED BY THIS PRNT3 BUFFER AND THE DISK * ZDR01040
                    *     ROUTINE'S 320 WORD SECTOR BUFFER.           * ZDR01050
                    *************************************************** ZDR01060
                          HDNG    EQUIVALENCES                          ZDR01070
                    *                                                   ZDR01080
                    *                                                   ZDR01090
                    *                                                   ZDR01100
                    #ANDU EQU     35    1+BLK ADDR OF END OF UA (ADJ)   ZDR01110
                    #BNDU EQU     40    1+BLK ADDR OF END OF UA (BASE)  ZDR01120
                    #FPAD EQU     45    FILE PROTECT ADDRESS            ZDR01130
                    #CIDN EQU     55    CARTRIDGE ID                    ZDR01140
                    #CIBA EQU     60    SECTOR ADDR OF CIB              ZDR01150
                    #ULET EQU     80    SECTOR ADDR OF LET              ZDR01160
                    *                                                   ZDR01170
                    * LET/FLET PARAMETERS                               ZDR01180
                    *                                                   ZDR01190
                    'FPAD EQU     /18       INITIAL WORK STORAGE ADDR   ZDR01200
                    'LFHD EQU     5         WD CNT OF LET/FLET HEADER   ZDR01210
                    'LFEN EQU     3         WD CNT OF LET/FLET ENTRY    ZDR01220
                    *                                                   ZDR01230
                    * INITIALIZATION PARAMETERS                         ZDR01240
                    *                                                   ZDR01250
                    'NPTN EQU     3         NO. INITIALIZATION PATTERNS ZDR01260
                    'TEST EQU     50        NO. INITIALIZATION RETRIES  ZDR01270
                    'PTN1 EQU     /AAAA     TEST PATTERN 1              ZDR01280
                    'PTN2 EQU     /5555     TEST PATTERN 2              ZDR01290
                    'PTN3 EQU     /0000     TEST PATTERN 3              ZDR01300
                    *                                                   ZDR01310
                    * DISK PARAMETERS                                   ZDR01320
                    *                                                   ZDR01330
                    'DBSC EQU     16        NO. DISK BLOCKS PER SECTOR  ZDR01340
                    'SCNT EQU     320       NO. WORDS PER SECTOR        ZDR01350
                    'CCNT EQU     8         NO. SECTORS PER CYLINDER    ZDR01360
                    'NDCY EQU     3         NO. DEFECTIVE CYLS ALLOWED  ZDR01370
                    'NDSC EQU     'NDCY*'CCNT  NO. OF DEF SCTRS ALLOWED ZDR01380
                    'TCNT EQU     16        NO. RETRIES AFTER AN ERROR  ZDR01390
                    'MXDR EQU     11        NO. DRIVES SUPPORTED   I-11 ZDR01400
                    'MSCT EQU     /658      MAXIMUM SCTR ADDR + 1       ZDR01410
                    'LSCT EQU     'MSCT-'NDSC  NO. USABLE SCTRS/CART    ZDR01420
                    'MCYL EQU     203       MAXIMUM CYLINDER ADDR       ZDR01430
                    *                                                   ZDR01440
                    * IOCCS                                             ZDR01450
                    *                                                   ZDR01460
                    'I206 EQU     /0F01                                 ZDR01470
                    'I208 EQU     /0900                                 ZDR01480
                    'D501 EQU     /5000     DISK NOT-READY ERR DISPLAY  ZDR01490
                    'I515 EQU     /2701     SENSE IOCC, DRIVE 0         ZDR01500
                    'I516 EQU     /8F01     SENSE IOCC, D9IVE 1         ZDR01510
                    'I517 EQU     /9701     SENSE IOCC, DRIVE 2         ZDR01520
                    'I518 EQU     /9F01     SENSE IOCC, DRIVE 3         ZDR01530
                    'I519 EQU     /A701     SENSE IOCC, DRIVE 4         ZDR01540
                    'I520 EQU     /B701     SENSE IOCC, DRIVE 5    2-11 ZDR01541
                    'I521 EQU     /BF01     SENSE IOCC, DRIVE 6    2-11 ZDR01542
                    'I522 EQU     /BF11     SENSE IOCC, DRIVE 7    2-11 ZDR01543
                    'I523 EQU     /BF21     SENSE IOCC, DRIVE 8    2-11 ZDR01544
                    'I524 EQU     /BF31     SENSE IOCC, DRIVE 9    2-11 ZDR01545
                    'I525 EQU     /BF41     SENSE IOCC, DRIVE 10   2-11 ZDR01546
                    'I000 EQU     /3A00     READ DATA SWITCHES IOCC     ZDR01550
                    'I006 EQU     /0300     SENSE ILSW IOCC             ZDR01560
                    'I609 EQU     /3701     SENSE IOCC, 1132 (W/ RESET) ZDR01570
                    'I906 EQU     /AF01     SENSE IOCC, 1403 (W/ RESET) ZDR01580
                    *                                                   ZDR01590
                    * DISK ADDRESSES                                    ZDR01600
                    *                                                   ZDR01610
                    'IDAD EQU     0         ADDR OF SCTR WITH CID,ETC.  ZDR01620
                    'DCOM EQU     1         ADDR OF SCTR WITH DCOM      ZDR01630
                    'RIAD EQU     2         ADDR OF SCTR WITH RES IMAGE ZDR01640
                    'ULET EQU     2         ADDR LET ON NON-SYS CART    ZDR01650
                    'CIBA EQU     8         ADDR CIB ON NON-SYS CART  E ZDR01660
                    *                                                   ZDR01670
                    * MISCELLANEOUS                                     ZDR01680
                    *                                                   ZDR01690
                    'DM2I EQU     -2        SETTING FOR DM2 INIT CART   ZDR01720
                    'CSTR EQU     /D0                                   ZDR01730
                    'PRWC EQU     60        BUFFER LENGTH FOR 1132, 1403ZDR01740
                    'COPY EQU     5         RLTV ADDR COPY INDICATOR    ZDR01750
                    'DTYP EQU     8         RLTV ADDR DISK TYPE INDR    ZDR01760
                    'DCTB EQU     1         RLTV ADDR DEFECTIVE CYL TBL ZDR01770
                    'CIDN EQU     4         RLTV ADDR CARTRIDGE ID      ZDR01780
                    'WDCT EQU     0         RLTV ADDR WD CNT IN BFR     ZDR01790
                    'SADR EQU     1         RLTV ADDR SCTR ADDR IN BFR  ZDR01800
                    'DMCT EQU     3         NO. WDS PRINTOUT/HEX WORD   ZDR01810
                    'WPLN EQU     16        NO. WDS PER LINE PRINTOUT   ZDR01820
                    'HEXA EQU     16        NO. MARKS IN HEX SYSTEM     ZDR01830
                    *                                                   ZDR01840
                    * IOCS CALLING SEQUENCE PARAMETERS                  ZDR01850
                    *                                                   ZDR01860
                    'FUNC EQU     0         RLTV ADDR FUNCTION CODE     ZDR01870
                    'IOAR EQU     1         RLTV ADDR I/O AREA          ZDR01880
                    'NRTN EQU     2         RLTV ADDR NORMAL RETURN     ZDR01890
                    *                                                   ZDR01900
                    * RESIDENT MONITOR                                  ZDR01910
                    *                                                   ZDR01920
                    $CH12 EQU     /6        ADDR OF CHANNEL 12 INDR     ZDR01930
                    $LEV1 EQU     /9        ADDR LEVEL 1 ENTRY IN ITV   ZDR01940
                    $LEV2 EQU     /A        ADDR DISK ENTRY IN ITV      ZDR01950
                    $LEV4 EQU     /C        ADDR LEVEL 4 ENTRY IN ITV   ZDR01960
                    $LEV5 EQU     /D        ADDR LEVEL 5 ENTRY IN ITV   ZDR01970
                    $SCAN EQU     /20       ADDR OF 1132 SCAN AREA      ZDR01980
                    $PRET EQU     /28       ADDR PREOPERATIVE ERR TRAP  ZDR01990
                    $IREQ EQU     /2C       ADDR OF INT REQ SUBROUTINE  ZDR02000
                    $IOCT EQU     /32       ADDR OF IOCS BUSY INDR      ZDR02010
                    $PST1 EQU     /81       LEVEL 1 POSTOP ERROR TRAP   ZDR02020
                    $PST4 EQU     /8D       LEVEL 4 POSTOP ERROR TRAP   ZDR02030
                    $STOP EQU     /91       ADDR OF PROG STOP KEY TRAP  ZDR02040
                    $DCYL EQU     /A4       RLTV ADDR OF DEF CYL TB     ZDR02050
                    $I200 EQU     /B3       ADDR OF ILS FOR LEVEL 2     ZDR02060
                    $I400 EQU     /C4       ADDR OF ILS FOR LEVEL 4     ZDR02070
                    $I405 EQU     /D3                                   ZDR02080
                    $IBT4 EQU     $I405+1   ADDR OF IBT FOR LEVEL 4     ZDR02090
                    $DDSW EQU     /DD       CURRENT DISK DSW            ZDR02100
                    $I403 EQU     /D0                                   ZDR02110
                    $ZEND EQU     /1E0      ADDR OF END OF DISKZ        ZDR02120
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR02130
                          ORG     /100                                  ZDR02150
                    *                                                   ZDR02160
                    *************************************************** ZDR02170
                    * THIS SUBR CONTROLS ALL DCIP OPERATIONS          * ZDR02180
                    *************************************************** ZDR02190
                    *                                                   ZDR02200
                    START BSI  L  BEGIN     OUT TO INITIALIZE DCIP      ZDR02210
                    CM050 BSI     CPOUT     BR TO INITIALIZE PRINT 2-11 ZDR02220
                          SRA     16                                    ZDR02230
                          STO  L  SW005     CLEAR INITIALIZE OPTION SW  ZDR02240
                          STO  L  SW006     CLEAR PATCH OPTION SWITCH   ZDR02250
                          STO  L  IT950     CLEAR INIT VIRGIN SW   2-12 ZDR02255
                          LD      CM905                                 ZDR02260
                          STO   3 'WDCT     INITIALIZE WD CT IN DISK BF ZDR02270
                          LDX  L1 MSSG1     POINT TO MESSAGE 1          ZDR02280
                    CM100 BSI     INSTR     PRINT MESSAGE 1        2-11 ZDR02290
                    *                                                   ZDR02300
                    **************************************************  ZDR02310
                    * ACC CONTAINS REPLY.   BIT 0 SET TO INITIALIZE     ZDR02320
                    *                       BIT 1 SET TO COPY           ZDR02330
                    *                       BIT 2 SET TO DUMP           ZDR02340
                    *                       BIT 3 SET TO PATCH          ZDR02350
                    *                       BIT 4 TO ANALYZE            ZDR02360
                    *                       BIT 5 TO COMPARE            ZDR02370
                    **************************************************  ZDR02380
                    *                                                   ZDR02390
                    *                                                   ZDR02400
                    * CHECK FOR COMPARE OPTION SWITCH ON                ZDR02410
                    *                                                   ZDR02420
                          MDX  L  SW008,0                               ZDR02430
                          MDX     CM500     BR TO CHECK FOR COMPARE     ZDR02440
                          BSC  L  INITL,Z+  BR IF INITIALIZE       2-11 ZDR02450
                          SLA     1                                     ZDR02460
                          BSC  L  DUPLC,Z+  BR IF COPY             2-11 ZDR02470
                          SLA     1                                     ZDR02480
                          BSC  L  CM250,Z+  BR FOR DISK DUMP            ZDR02490
                          SLA     1                                     ZDR02500
                          BSC  L  PATCH,Z+  BR IF PATCH            2-11 ZDR02510
                          SLA     1                                     ZDR02520
                          BSC  L  ANLYZ,Z+  BR IF ANALYZE          2-11 ZDR02530
                          SLA     1                                     ZDR02540
                          BSC  L  COMPR,Z+  BR IF COMPARE          2-11 ZDR02550
                          SLA     1                                2-12 ZDR02552
                          BSC  L  INITV,Z+   BR TO INIT VIRGIN PACK2-12 ZDR02554
                          LDX  L1 MSSG5     PREPARE TO PRINT            ZDR02560
                          MDX     CM100     *MESSAGE 5                  ZDR02570
                    CM250 BSI  L  DUMPZ     OUT TO PERFORM DUMP         ZDR02620
                          MDX     CM050     BACK FOR NEXT OPTION        ZDR02630
                    *                                                   ZDR02700
                    * PRINT ERROR MESSAGE IF OPTION IS NOT COMPARE      ZDR02710
                    *                                                   ZDR02720
                    CM500 SLA     5         COMPARE BIT TO SIGN    2-11 ZDR02730
                          BSC  L  COMPR,Z+  BR IF COMPARE          2-11 ZDR02740
                          LDX  L1 MSSG7     PREPARE TO PRINT MESSAGE 7  ZDR02750
                          BSI     MSOUT     BR TO PRINT            2-11 ZDR02760
                          WAIT              WAIT FOR OPERATOR ACTION    ZDR02770
                          MDX     CM050     BR BACK FOR NEXT OPTION     ZDR02780
                    *                                                   ZDR02790
                    * CONSTANTS AND WORK AREAS                          ZDR02800
                    *                                                   ZDR02810
                    CM905 DC      'SCNT+1   WDS PER SCTR,COUNTING ADDR  ZDR02830
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR02840
                    *                                                   ZDR02850
                    *************************************************** ZDR02860
                    * INITIALIZE TO PRINT ON CONSOLE PRINTER            ZDR02870
                    *************************************************** ZDR02880
                    *                                                   ZDR02890
                    CPOUT DC      *-*       ENTRY POINT                 ZDR02900
                          SRA     16        INITIALIZE PRINT SWITCH TO  ZDR02910
                          STO  L  SW003     *USE CONSOLE PRINTER        ZDR02920
                          LDX  L1 ENDTB     SET POINTER IN CONVERSION   ZDR02930
                          STX  L1 SERCH     *SUBR TO CONSOLE PTR TABLE  ZDR02940
                          LDD     CP900     CONSOLE PRINTER SPACES      ZDR02950
                          STD  L  BLANK                                 ZDR02960
                          BSC  I  CPOUT     BR TO EXIT                  ZDR02970
                    *                                                   ZDR02980
                    * CONSTANTS AND WORK AREAS                          ZDR02990
                    *                                                   ZDR03000
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR03010
                    CP900 DMES    'S'R'S'R'E                            ZDR03020
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR03030
                    **************************************************  ZDR03040
                    *    SUBROUTINE TO TYPE-OUT MESSAGE AND ACCEPT      ZDR03050
                    *    INPUT THROUGH THE CONSOLE ENTRY SWITCHES       ZDR03060
                    **************************************************  ZDR03070
                    *                                                   ZDR03080
                    INSTR DC      *-*       SUBROUTINE ENTRY POINT      ZDR03090
                          STX   1 IB050     ADDR OF MESSAGE TO BE TYPED ZDR03100
                          BSI  L  WRTY0     TYPE                        ZDR03110
                          DC      /2000     * OUT                       ZDR03120
                    IB050 DC      *-*       *  MESSAGE                  ZDR03130
                    IB100 BSI  L  WRTY0     TEST TO SEE IF MESSAGE IS   ZDR03140
                          DC      /0000     *COMPLETELY TYPED-OUT       ZDR03150
                          MDX     IB100     BRANCH IF NOT YET FINISHED  ZDR03160
                          WAIT              WAIT FOR OPTR TO PUSH START ZDR03170
                          XIO     IB900     READ DATA SWITCHES          ZDR03180
                          LDX  L1 INFOR-1   POINT TO DATA INPUTED       ZDR03190
                          BSI  L  CNPNT     PRINT BIT SWITCH DATA       ZDR03200
                          LD   L  INFOR     LOAD BIT SWITCH DATA        ZDR03210
                          BSC  I  INSTR     BRANCH BACK TO MAINLINE     ZDR03220
                    *                                                   ZDR03230
                    * CONSTANTS AND WORK AREAS                          ZDR03240
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       ZDR03250
                    *                                                   ZDR03260
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR03270
                    IB900 DC      INFOR     IOCC FOR READING THE        ZDR03280
                          DC      'I000     *CONSOLE ENTRY SWITCHES     ZDR03290
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR03300
                    *                                                   ZDR03310
                    *************************************************** ZDR03320
                    * SUBROUTINE TO TYPE-OUT A MESSAGE                  ZDR03330
                    *************************************************** ZDR03340
                    *                                                   ZDR03350
                    MSOUT DC      *-*       SUBROUTINE ENTRY POINT      ZDR03360
                          STX   1 TC040     ADDR OF MESSAGE TO BE TYPED ZDR03370
                          BSI  L  WRTY0     TYPE                        ZDR03380
                          DC      /2000     *OUT                        ZDR03390
                    TC040 DC      *-*       * MESSAGE                   ZDR03400
                    TC080 BSI  L  WRTY0     TEST TO SEE IF MESSAGE IS   ZDR03410
                          DC      0         *COMPLETELY TYPED-OUT       ZDR03420
                          MDX     TC080     BR IF NOT FINISHED          ZDR03430
                          BSC  I  MSOUT     EXIT TO MAINLINE            ZDR03440
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR03450
                    *************************************************** ZDR03460
                    * SUBROUTINE TO CONVERT DATA TO DUMP FORMAT         ZDR03470
                    * AND PRINT IT ON THE PRINCIPAL PRINT DEVICE        ZDR03480
                    *************************************************** ZDR03490
                    *                                                   ZDR03500
                    CNPNT DC      *-*       ENTRY POINT                 ZDR03510
                          LDD  L  BLANK                                 ZDR03520
                          STD     CN900+'DMCT+1                         ZDR03530
                          MDX   1 1         SAVE ADDR OF 1ST WD         ZDR03540
                          STX   1 CN925     *TO BE CONVERTED            ZDR03550
                          MDX   1 -1        RESTORE XR1                 ZDR03560
                          LD    1 'WDCT     FETCH NO. WDS TO CONVERT    ZDR03570
                    *                                                   ZDR03580
                    * CONVERT FOR A LINE OF PRINTOUT                    ZDR03590
                    *                                                   ZDR03600
                    CN050 S       CN920     DECREMENT NO. WDS TO CON-   ZDR03610
                          STO     CN905     *VERT BY NO. WDS PER LINE   ZDR03620
                          BSC     Z-        SKIP IF LAST LINE           ZDR03630
                          SRA     16        CLEAR ACC                   ZDR03640
                          A       CN920     RESTORE WORD COUNT          ZDR03650
                          STO     CN910                                 ZDR03660
                          M       CN915     COMPUTE NO. CHARACTERS      ZDR03670
                          RTE     16        *TO PRINT                   ZDR03680
                          LDX  L1 PRBUF+1   ADDR FIRST  DATA WD OF      ZDR03690
                          STX   1 CN400+1   *PRINTER BUFFER TO XR1      ZDR03700
                          STO   1 -1        CHARACTER COUNT TO BUFFER   ZDR03710
                    *                                                   ZDR03720
                    * CONVERT 0-9,A-F FROM BINARY TO PRINCIPAL PTR CODE ZDR03730
                    *                                                   ZDR03740
                    CN100 LDX   1 4         NO. HEX CHARS PER WD TO XR1 ZDR03750
                          LD   I  CN925     FETCH A WD FOR CONVERSION   ZDR03760
                          SRT     16        PUT WD IN EXT               ZDR03770
                    CN150 SLA     16        CLEAR ACC                   ZDR03780
                          RTE     4         RT HALF OF WD TO BITS 0-3   ZDR03790
                          SRA     12        RIGHT JUSTIFY 0-F CHAR      ZDR03800
                          A    L  SERCH     CALCULATE TABLE ADDR        ZDR03810
                          S       CN930     ADJUST FOR TABLE END        ZDR03820
                          STO     CN300+1   ADDR OF CHARACTER           ZDR03830
                    *                                                   ZDR03840
                    * SAVE A CONVERTED CHARACTER                        ZDR03850
                    *                                                   ZDR03860
                    CN300 LD   L  *-*       FETCH CONVERSION TBL ENTRY, ZDR03870
                          STO  L1 CN900-1   *STORE IN TEMPORARY BUFFER  ZDR03880
                          MDX   1 -1        SKIP AFTER 4 CHARACTERS CON ZDR03890
                          MDX     CN150     *VERTED, BR OTHERWISE       ZDR03900
                    *                                                   ZDR03910
                    * PUT 4 CHARACTERS JUST CONVERTED PLUS 2 SPACE      ZDR03920
                    * CHARACTERS IN PRINTER BUFFER                      ZDR03930
                    *                                                   ZDR03940
                          LDX   1 -2*'DMCT  NO. PRINT CHARS/HEX WORD    ZDR03950
                    CN350 LDD  L1 CN900+2*'DMCT  FETCH 2 WDS FROM TEMP- ZDR03960
                          SRA     8         *ORARY BUFFER AND PACK THE  ZDR03970
                          SLT     8         *8 HIGH-ORDER BITS OF EACH  ZDR03980
                    CN400 STO  L  *-*       *INTO 1 WD OF PRINTER BFR   ZDR03990
                          MDX  L  CN400+1,1                             ZDR04000
                    *                                                   ZDR04010
                    *                                                   ZDR04020
                    *                                                   ZDR04030
                          MDX   1 2         SKIP AFTER ALL PRINTOUT WDS ZDR04040
                          MDX     CN350     *MOVED, BR OTHERWISE        ZDR04050
                    *                                                   ZDR04060
                    *                                                   ZDR04070
                    *                                                   ZDR04080
                          MDX  L  CN925,1   PT TO NEXT WD TO CONVERT    ZDR04090
                          MDX  L  CN910,-1  SKIP IF ENTIRE LINE         ZDR04100
                          MDX     CN100     *CONVERTED, BR OTHERWISE    ZDR04110
                    *                                                   ZDR04120
                    * PRINT A LINE AND CHECK FOR MORE PRINTING          ZDR04130
                    *                                                   ZDR04140
                          BSI  L  PRINT     PRINT A LINE                ZDR04150
                          LD      CN905                                 ZDR04160
                          BSC  L  CN050,Z-  BR IF WORD COUNT EXHAUSTED  ZDR04170
                          BSC  I  CNPNT     RETURN                      ZDR04180
                    *                                                   ZDR04190
                    * CONSTANTS AND WORK AREAS                          ZDR04200
                    *                                                   ZDR04210
                    CN900 BSS  E  2*'DMCT   TEMPORARY PRINTER BUFFER    ZDR04220
                    CN905 DC      *-*       LINE INDR--Z-=NONE LEFT     ZDR04230
                    CN910 DC      *-*       NO. WDS LEFT TO CONVERT     ZDR04240
                    CN915 DC      'DMCT     NO. WDS PRINTOUT/HEX WORD   ZDR04250
                    CN920 DC      'WPLN     NO. WDS PER PRINTOUT LINE   ZDR04260
                    CN925 DC      *-*       ADDR WD TO BE CONVERTED     ZDR04270
                    CN930 DC      'HEXA-1   TABLE ADDR ADJUST CONSTANT  ZDR04280
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR04290
                    *************************************************** ZDR04300
                    *             INTERRUPT REQUEST - WAIT OUT ALL      ZDR04310
                    *                INTERRUPTS AND GO TO START         ZDR04320
                    *************************************************** ZDR04330
                    *                                                   ZDR04340
                    INTRQ DC      *-*       ENTRY POINT                 ZDR04350
                          XIO     IQ905     RESET INT REQ           2-9 ZDR04360
                          BOSC    +-Z       TURN OFF LEVEL              ZDR04370
                          NOP                                           ZDR04380
                    *                                                   ZDR04390
                    * TURN OFF KEYBOARD SELECT                          ZDR04400
                    *                                                   ZDR04410
                          XIO     IQ902                                 ZDR04420
                    *                                                   ZDR04430
                    * 2 SECOND TIMING LOOP TO WAIT OUT I/O              ZDR04440
                    *                                                   ZDR04450
                          LDX  L1 -9650*2   TWO SECOND LOOP CONSTANT    ZDR04460
                    IQ050 LDD     IQ900                                 ZDR04470
                          D       IQ905                                 ZDR04480
                          MDX   1 1                                     ZDR04490
                          MDX     IQ050                                 ZDR04500
                          SLA     16                                    ZDR04510
                          STO  L  $IOCT     CLEAR IOCS COUNTER          ZDR04520
                          STO  L  T0240     TYPE0 BUSY INDICATOR        ZDR04530
                          STO  L  W3935     TURN OFF PRNT3 BUSY INDR    ZDR04540
                    *                       1 INSTRUCTION REMOVED  2-10 ZDR04550
                    IQ150 STO  L  DX970     CLEAR DISK BUSY INDR   2-10 ZDR04560
                          BSC  L  CM050     BR TO BEGIN AGAIN           ZDR04580
                    *                                                   ZDR04590
                    * CONSTANTS                                         ZDR04600
                    *                                                   ZDR04610
                          BSS  E  0         EVEN ADDRESS BOUNDARY       ZDR04620
                    IQ900 DC      /3AAA     TWO WORD DIVIDEND FOR TWO   ZDR04630
                          DC      /AAAA     *SECOND TIMING LOOP.        ZDR04640
                    IQ902 DC      W3935     IOCC TO TURN OFF KEYBOARD   ZDR04650
                          DC      /0A00     *SELECT.                    ZDR04660
                    IQ905 DC      /5555     DIVISOR FOR TIMING LOOP     ZDR04670
                          DC      /0F01     SENSE KB DSW W RESET    2-9 ZDR04680
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR04690
                    *                                                   ZDR04700
                    *************************************************** ZDR04710
                    * ADJUST DISK ADDRESS FOR DEFECTIVE CYLINDERS       ZDR04720
                    *************************************************** ZDR04730
                    *                                                   ZDR04740
                    DC000 DC      *-*       ENTRY POINT                 ZDR04750
                          LDX   2 'NDCY     NO. OF DEF CYLS             ZDR04760
                    DC050 S     1 0         NO SKIP IF CURRENT SECTOR   ZDR04770
                          BSC     +-        *MATCHES DEF SCTR ADDRESS.  ZDR04780
                          A       DC900     ALLOW FOR DEFECTIVE CYL     ZDR04790
                          A     1 0         RESTORE CURRENT SCTR ADDR   ZDR04800
                          MDX   1 1         POINT TO NEXT DEF CYL ENTRY ZDR04810
                          MDX   2 -1        SKIP AFTER ALL CHECKED      ZDR04820
                          MDX     DC050     BR TO CHECK NEXT DEF SCTR   ZDR04830
                          BSC  I  DC000     EXIT                        ZDR04840
                    *                                                   ZDR04850
                    * CONSTANT                                          ZDR04860
                    *                                                   ZDR04870
                    DC900 DC      'CCNT     NO. OF SCTRS PER CYLINDER   ZDR04880
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR04890
                    *                                                   ZDR04900
                    *************************************************** ZDR04910
                    * FETCH SOURCE AND OBJECT DR NOS., CHECK VALIDITY   ZDR04920
                    *************************************************** ZDR04930
                    *                                                   ZDR04940
                    GETDR DC      0         ENTRY POINT                 ZDR04950
                          LDX  L1 MSG13                                 ZDR04960
                    GD020 BSI  L  INSTR     PRINT MESSAGE, FETCH REPLY  ZDR04970
                          LDX  L1 MSSG5     PREPARE TO PRINT ERROR MSG  ZDR04980
                          RTE     16                                    ZDR04990
                          SLT     12        LEFT JUSTIFY OBJ IN EXT     ZDR05000
                          SLA     4         LEFT JUSTIFY SOURCE IN ACC  ZDR05010
                          STD     GD901     SAVE ACC AND EXT       2-11 ZDR05020
                          RTE     28        RT JUSTIFY OBJECT IN   2-11 ZDR05030
                    *                       *ACC, AND SOURCE IN EXT2-11 ZDR05040
                          SD      GD900     MAX DRIVE NOS.              ZDR05050
                          BSC     +Z        SKIP IF OBJECT TOO LARGE    ZDR05060
                          RTE     16        SOURCE TO ACC               ZDR05070
                          BSC  L  GD020,-   BR IF EITHER TOO LARGE      ZDR05080
                          LD      GD901     LOAD SOURCE DR         2-11 ZDR05090
                    *                                              2-11 ZDR05100
                    *                       3 INSTRUCTIONS REMOVED 2-11 ZDR05110
                    *                                              2-11 ZDR05120
                          BSI     PRSNT     CHECK FOR DEV. PRESENT 2-11 ZDR05130
                          LD      GD902                             2-3 ZDR05140
                          BSI     PRSNT     CHECK FOR DEV. PRESENT 2-11 ZDR05150
                          LDD     GD901                             2-3 ZDR05160
                          BSC  I  GETDR     *ACC, OBJECT DR NO. TO EXT  ZDR05170
                    *                                                   ZDR05180
                    * CONSTANT                                          ZDR05190
                    *                                                   ZDR05200
                          BSS  E  0         MAKE ADDR EVEN              ZDR05210
                    GD900 DC      'MXDR     NO. DRIVES             2-11 ZDR05220
                          DC      'MXDR     NO. DRIVES             2-11 ZDR05230
                    GD901 DC      0                                 2-3 ZDR05240
                    GD902 DC      0                                 2-3 ZDR05250
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR05260
                    *************************************************** ZDR05270
                    * SUBROUTINE TO WRITE ONE SECTOR AND WAIT FOR       ZDR05280
                    * OPERATION COMPLETE                                ZDR05290
                    *************************************************** ZDR05300
                    *                                                   ZDR05310
                    WRIT1 DC      *-*       ENTRY POINT                 ZDR05320
                          STO   3 'SADR     SET SECTOR ADDR IN I/O AREA ZDR05330
                          STO  L  SECT1                                 ZDR05340
                          STX   3 WR050                                 ZDR05350
                          BSI  L  DX000     WRITE TO DISK               ZDR05360
                          DC      /0200     WRITE FUNCTION CODE         ZDR05370
                    WR050 DC      *-*       ADDR OF BUFFER              ZDR05380
                          A       WR900     INCRE SCTR ADDR BY ONE      ZDR05390
                    WR060 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR05400
                          MDX     WR060     LOOP ON DISK BUSY      2-11 ZDR05410
                    *           .                                  2-11 ZDR05420
                          BSC  I  WRIT1     EXIT                        ZDR05430
                    *                                                   ZDR05440
                    * CONSTANTS AND WORK AREAS                          ZDR05450
                    *                                                   ZDR05460
                    WR900 DC      1         GENERAL PURPOSE CONSTANT    ZDR05470
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR05480
                    *************************************************** ZDR05490
                    * SUBROUTINE TO READ ONE SECTOR AND WAIT FOR        ZDR05500
                    * OPERATION COMPLETE                                ZDR05510
                    *************************************************** ZDR05520
                    *                                                   ZDR05530
                    READ1 DC      *-*       ENTRY                       ZDR05540
                          STO   3 'SADR     SET SECTOR ADDR IN I/O AREA ZDR05550
                          STO  L  SECT1                                 ZDR05560
                          STX   3 RE050                                 ZDR05570
                          BSI  L  DX000     READ ONE SECTOR             ZDR05580
                          DC      /0100     READ FUNCTION CODE          ZDR05590
                    RE050 DC      *-*       ADDR OF BUFFER              ZDR05600
                    *           .                                  2-11 ZDR05610
                    RE060 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR05620
                          MDX     RE060     LOOP ON DISK BUSY      2-11 ZDR05630
                          BSC  I  READ1     EXIT                        ZDR05640
                          HDNG    INITIALIZATION,COMMON SUBROUTINES     ZDR05650
                    *************************************************** ZDR05660
                    *SUBROUTINE TO CHECK FOR DISK DRIVE PRESENT       * ZDR05670
                    *                                                 * ZDR05680
                    *INPUT-                                           * ZDR05690
                    *   *THE NUMBER OF THE PHYSICAL DRIVE TO BE       * ZDR05700
                    *    CHECKED--LEFT JUSTIFIED IN ACC               * ZDR05710
                    *                                                 * ZDR05720
                    *OUTPUT-N/A                                       * ZDR05730
                    *                                                 * ZDR05740
                    *NOTES-                                           * ZDR05750
                    *   *XR1 AND THE ACC ARE USED, BUT ARE NOT SAVED  * ZDR05760
                    *    AND RESTORED                                 * ZDR05770
                    *************************************************** ZDR05780
                    PRSNT DC      *-*       ENTRY POINT            2-11 ZDR05785
                          SRA     11        TWICE DR NO TO ACC     2-11 ZDR05790
                          STO     PRS05+1   SAVE TO LOAD TO XR1    2-11 ZDR05800
                    PRS01 BSI  L  WRTY0     TEST FOR CONSOLE       2-11 ZDR05810
                          DC      /0000     *PRINTING FINISHED,    2-11 ZDR05820
                          MDX     PRS01     *AND LOOP IF BUSY      2-11 ZDR05830
                    PRS05 LDX  L1 *-*       TWICE DR NO. TO XR1    2-11 ZDR05840
                          LD   L1 DX913     LD SENSE W/RESET IOCC  2-11 ZDR05850
                          AND     PRS80     CHANGE TO A READ IOCC  2-11 ZDR05860
                          STO  L1 DX960+1   SAVE AS CURRENT IOCC   2-11 ZDR05870
                          STO     PRS40+1   SAVE FOR DEV PRSNT CHK 2-11 ZDR05880
                          LD   L  IT950     GET VIRGIN PACK INDR   2-12 ZDR05881
                          BSC  L  PRS10,-   *AND BR IF NOT VIRGIN  2-12 ZDR05882
                          XIO  L1 DX913-1   SENSE DSW              2-12 ZDR05883
                          BSC  I  PRSNT,Z   RETURN IF DRIVE ON SYS 2-12 ZDR05884
                          MDX     PRS20     BR IF NOT ON SYSTEM    2-12 ZDR05885
                    PRS10 XIO     PRS40     INITIATE READ 1 WORD   2-12 ZDR05890
                          XIO  L1 DX913-1   SENSE THE DSW          2-11 ZDR05900
                          BSC  L  PRS70,Z   BR IF DR ON SYSTEM     2-11 ZDR05920
                    PRS20 LD      PRS90                            2-12 ZDR05960
                          BSI  L  $PRET                             2-3 ZDR05970
                          BSC  L  CM050                             2-3 ZDR05980
                    PRS70 LD      PRS05+1   LD 2 * DR. NO.         2-11 ZDR05984
                          SLA     3         PUT DR CODE IN DGT 2   2-11 ZDR05986
                          OR   L  DX955     OR IN NOT READY CODE   2-11 ZDR05988
                          WAIT              WAIT FOR INTERRUPT     2-11 ZDR05990
                          BSC  I  PRSNT     RETURN TO MAINLINE     2-11 ZDR06000
                          BSS  E  0                                 2-3 ZDR06020
                    PRS40 DC      PRS60     DISK READ IOCC         2-11 ZDR06030
                          DC      *-*       *FOR DEV PRESENT CHK   2-11 ZDR06040
                    PRS60 DC      1         WORD COUNT FOR DISK RD 2-11 ZDR06050
                          DC      *-*       I/O AREA FOR DISK READ 2-11 ZDR06060
                    *                                              2-11 ZDR06070
                    PRS80 DC      /FEFF     MASK FOR CONVERTING    2-11 ZDR06080
                    *                       *SENSE W/RESET IOCC TO 2-11 ZDR06090
                    *                       *READ IOCC             2-11 ZDR06100
                    PRS90 DC      /5001                             2-3 ZDR06110
                          HDNG    INITIALIZATION,COMMON SUBROUTINES     ZDR06120
                    *                                                   ZDR06130
                    *************************************************** ZDR06140
                    * SUBROUTINE TO READ SECTOR ZERO                    ZDR06150
                    **************************************************  ZDR06160
                    *                                                   ZDR06170
                    HOMEX DC      *-*       ENTRY                       ZDR06180
                          LD      SECT1     FETCH DR CD+SECT ADDR  2-11 ZDR06190
                          AND     HM900     AND OUT ALL BUT DRIVE CODE  ZDR06200
                          STO   3 'SADR                                 ZDR06210
                          STX   3 HM050                                 ZDR06220
                          BSI  L  DX000     SEEK HOME POSITION          ZDR06230
                          DC      /0300     SEEK FUNCTION CODE          ZDR06240
                    HM050 DC      *-*       ADDR OF BUFFER              ZDR06250
                          STX   3 HM100                                 ZDR06260
                          BSI  L  DX000     READ SECTOR 'IDAD           ZDR06270
                          DC      /0100     READ FUNCTION CODE          ZDR06280
                    HM100 DC      *-*       ADDR OF BUFFE9              ZDR06290
                    *           .                                  2-11 ZDR06300
                    HM120 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR06310
                          MDX     HM120     LOOP ON DISK BUSY      2-11 ZDR06320
                          BSC  I  HOMEX     EXIT                        ZDR06330
                    *                                                   ZDR06340
                    * CONSTANTS AND WORK AREAS                          ZDR06350
                    *                                                   ZDR06360
                    HM900 DC      /F000     MASK                   2-11 ZDR06370
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR06380
                    **************************************************  ZDR06390
                    * SUBROUTINE TO PRINT A LINE ON THE PRINCIPAL       ZDR06400
                    * PRINT DEVICE                                      ZDR06410
                    **************************************************  ZDR06420
                    *                                                   ZDR06430
                    PRINT DC      *-*       ENTRY POINT                 ZDR06440
                          MDX  L  SW003,0   SKIP IF CONSOLE PTR DESIRED ZDR06450
                          MDX     PP100     BR IF 1403 OR 1132  DESIRED ZDR06460
                          BSI  L  WRTY0     PRINT A                     ZDR06470
                          DC      /2000     * LINE ON THE               ZDR06480
                          DC      PRBUF     *   CONSOLE PRINTER         ZDR06490
                          BSI  L  WRTY0     DO A CARRIAGE               ZDR06500
                          DC      /2000     * RETURN ON THE             ZDR06510
                          DC      PR900     *CONSOLE PRINTER            ZDR06520
                          BSI  L  WRTY0     DWELL HERE UNTIL       2-11 ZDR06522
                          DC      /0000     *TYPEWRITER I/O        2-11 ZDR06524
                          MDX     *-4       *IS COMPLETED          2-11 ZDR06526
                          MDX     PP150     BRANCH TO RETURN            ZDR06530
                    PP100 BSI  I  CALLP     CALL PRNT1 OR PRNT3         ZDR06540
                          DC      /2010     PRINT A LINE                ZDR06550
                          DC      PRBUF     * ON THE 1132 OR 1403       ZDR06560
                          DC      PRERR     *   WITH SPACE SUPPRESS     ZDR06570
                          BSI  I  CALLP     TEST PRNT1 OR PRNT3         ZDR06580
                          DC      /3D00     SPACE ONE LINE              ZDR06590
                    PP150 BSC  I  PRINT     RETURN                      ZDR06600
                    *                                                   ZDR06610
                    * CONSTANTS AND WORK AREAS                          ZDR06620
                    *                                                   ZDR06630
                    PR900 DC      1         BUFFER FOR EXECUTING A CAR- ZDR06640
                          DMES    'S'R'E    *RIAGE RETURN ON CONSOLE    ZDR06650
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR06660
                    *************************************************** ZDR06670
                    * SUBROUTINE TO SPACE A LINE ON THE PRINTER         ZDR06680
                    *************************************************** ZDR06690
                    *                                                   ZDR06700
                    SPACE DC      *-*       SUBROUTINE ENTRY POINT      ZDR06710
                          LD      SP900     PUT WD CNT OF 1             ZDR06720
                          STO     PRBUF     *IN PRINT BUFFER       2-11 ZDR06730
                          LD      SP905     SET UP A BLANK WORD         ZDR06740
                          STO     PRBUF+1                          2-11 ZDR06750
                          BSI     PRINT     BR TO PRINT SUBROUTINE 2-11 ZDR06760
                          BSC  I  SPACE     BRANCH TO MAINLINE          ZDR06770
                    *                                                   ZDR06780
                    * CONSTANTS AND WORK AREAS                          ZDR06790
                    *                                                   ZDR06800
                    SP900 DC      1         WD CNT FOR TYPING A BLANK   ZDR06810
                    SP905 DMES  1 'S'S'E                                ZDR06820
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR06830
                    *************************************************** ZDR06840
                    * PRINTER ERROR SUBROUTINE                          ZDR06850
                    *************************************************** ZDR06860
                    *                                                   ZDR06870
                    PRERR DC      *-*       SUBROUTINE ENTRY POINT      ZDR06880
                          SRA     2                                     ZDR06890
                          BSC  I  PRERR     BRANCH BACK TO MAINLINE     ZDR06900
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR06910
                    *                                                   ZDR06920
                    * CONSTANTS AND WORK AREAS SHARED BY AT LEAST       ZDR06930
                    * TWO SUBROUTINES                                   ZDR06940
                    *                                                   ZDR06950
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR06960
                    NOPTN DC      *-*       CURRENT REPETITION COUNT    ZDR06970
                    BUFF3 DC      YYYYY-*   DUMP HEADER WORD COUNT      ZDR06980
                    YYYYY BES     3         DUMP HEADER BUFFER          ZDR06990
                    PRBUF DC      *-*       WORD COUNT FOR PRINT CALL   ZDR07000
                          BSS  E  'DMCT*'WPLN  PRINT BUFFER             ZDR07010
                    BLANK BSS  E  2         SPACE CHARACTERS FOR DUMP   ZDR07020
                          DC      1         WD CNT FOR CP MESSAGE       ZDR07030
                    INFOR DC      *-*       WORD FOR DATA FROM BIT SWS. ZDR07040
                    XXXXX DC      *-*       DISK IDENTIFICATION         ZDR07050
                    SECT1 DC      *-*       SCTR NO. CURRENTLY TESTING  ZDR07060
                    SW001 DC      *-*       READ-CHECK ERROR SWITCH     ZDR07070
                    SW002 DC      *-*       PRINTER SWITCH              ZDR07080
                    SW003 DC      *-*       PRINTER SWITCH              ZDR07090
                    SW004 DC      *-*       ERROR SWITCH                ZDR07100
                    SW005 DC      *-*       INITIALIZE OPTION SWITCH    ZDR07110
                    SW006 DC      *-*       DISK PATCH SWITCH           ZDR07120
                    SW007 DC      *-*       DISK ANALYSIS OPTION SWITCH ZDR07130
                    SW008 DC      *-*       COMPARE OPTION SWITCH       ZDR07140
                    BADFL DC      *-*       DEF CARTRIDGE FLAG          ZDR07150
                    BADAD DC      *-*       DEF SCTR ADDR FLAG          ZDR07160
                    LINKA DC      PA300+2   ADDR OF LINK FROM PA300     ZDR07170
                    SERCH DC      *-*       ADDR OF PRINCIPAL CONV TBL  ZDR07180
                    ADDRX DC      *-*       ADDR 1132/1403 CONV TABLE   ZDR07190
                    BFRAD DC      *-*       ADDR OF DISK BUFFER         ZDR07200
                    CALLP DC      *-*       ADDR OF PRINCIPAL PRINT     ZDR07210
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR07220
                    *                                                   ZDR07230
                    *************************************************** ZDR07240
                    * LEVEL 4 INTERRUPT BRANCH TABLE                  * ZDR07250
                    *************************************************** ZDR07260
                    *                                                   ZDR07270
                          DC      W3010     ADDR OF ENT TO PRNT3        ZDR07280
                          BSS     2         SPACE FILLER                ZDR07290
                    IBT04 DC      T0020     ADDR INT ENTRY TO TYPE0     ZDR07300
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR07310
                    **************************************************  ZDR07320
                    *             STORAGE FOR MESSAGES                  ZDR07330
                    **************************************************  ZDR07340
                    *                                                   ZDR07350
                    **************************************************  ZDR07360
                    * MESSAGE 1  TURN ON SW 0 TO INITIALIZE             ZDR07370
                    *                    SW 1 TO COPY                   ZDR07380
                    *                    SW 2 TO DUMP                   ZDR07390
                    *                    SW 3 TO PATCH                  ZDR07400
                    *                    SW 4 TO ANALYZE                ZDR07410
                    *************************************************** ZDR07420
                    *                                                   ZDR07430
                    MSSG1 DC      MSSG2-*   MESSAGE CHARACTER COUNT     ZDR07440
                          DMES    'RTURN ON:'RSW 0 TO INITLZ'RSW 1 TO ' ZDR07450
                          DMES    COPY'RSW 2 TO DUMP'RSW 3 TO PATCH'RS' ZDR07460
                          DMES    W 4 TO ANALYZE'RSW 5 TO CMP'RSW 6 T'  ZDR07470
                          DMES    O INITLZ NEW DISK'R'E             212 ZDR07475
                    *                                                   ZDR07480
                    **************************************************  ZDR07490
                    * MESSAGE 2 ENTER PHYS. DR. NO. (BITS 0-3)          ZDR07500
                    *            SECTOR ADDRESS (BITS 4-15)             ZDR07510
                    **************************************************  ZDR07520
                    *                                                   ZDR07530
                    MSSG2 DC      MSSG3-*   MESSAGE CHARACTER COUNT     ZDR07540
                          DMES    'RENTER:'RPHYS DR NO. (BITS 0-3)'RSC' ZDR07550
                          DMES    TR ADDR (BITS 4-15)'R'E               ZDR07560
                    *                                                   ZDR07570
                    **************************************************  ZDR07580
                    * MESSAGE 3  ENTER NO. OF SCTRS. TO DUMP            ZDR07590
                    **************************************************  ZDR07600
                    *                                                   ZDR07610
                    MSSG3 DC      MSSG4-*   MESSAGE CHARACTER COUNT     ZDR07620
                          DMES    ENTER NO. OF SCTRS TO DUMP'R'E        ZDR07630
                    *                                                   ZDR07640
                    **************************************************  ZDR07650
                    * MESSAGE 4  TURN ON SW 0 FOR ADDITIONAL TESTING    ZDR07660
                    **************************************************  ZDR07670
                    *                                                   ZDR07680
                    MSSG4 DC      MSSG5-*   MESSAGE CHARACTER COUNT     ZDR07690
                          DMES    TURN ON SW 0 FOR MORE TESTING'R'E     ZDR07700
                    *                                                   ZDR07710
                    **************************************************  ZDR07720
                    * MESSAGE 5  ENTRY ERROR...RETRY                    ZDR07730
                    **************************************************  ZDR07740
                    *                                                   ZDR07750
                    MSSG5 DC      MSSG6-*   MESSAGE CHARACTER COUNT     ZDR07760
                          DMES    ENTRY ERR...RETRY'R'E                 ZDR07770
                    *                                                   ZDR07780
                    **************************************************  ZDR07790
                    * MESSAGE 6  ENTER DR. NO. IN BITS 12-15            ZDR07800
                    **************************************************  ZDR07810
                    *                                                   ZDR07820
                    MSSG6 DC      MSSG7-*   MESSAGE CHARACTER COUNT     ZDR07830
                          DMES    'RENTER DR NO. (BITS 12-15)'R'E       ZDR07840
                    *                                                   ZDR07850
                    *************************************************** ZDR07860
                    * MESSAGE 7  COMPARE OPTION USED...RELOAD DCIP      ZDR07870
                    *************************************************** ZDR07880
                    *                                                   ZDR07890
                    MSSG7 DC      MSSG9-*   MESSAGE CHARACTER COUNT     ZDR07900
                          DMES    'RCMP OPTION USED...RELOAD DCIP'E     ZDR07910
                    *                                               2-6 ZDR07920
                    ************************************************2-6 ZDR07930
                    * MESSAGE 8 IS REMOVED AS IT WAS A DUPLICATE OF 2-8 ZDR07940
                    * MESSAGE 6                                     2-8 ZDR07950
                    **************************************************  ZDR07960
                    * MESSAGE 9  NO DEFECTIVE CYLS                      ZDR07970
                    **************************************************  ZDR07980
                    *                                                   ZDR07990
                    MSSG9 DC      MSG10-*   MESSAGE CHARACTER COUNT     ZDR08000
                          DMES    'RNO DEF CYLS'R'E                     ZDR08010
                    *                                                   ZDR08020
                    **************************************************  ZDR08030
                    * MESSAGE 10 DEFECTIVE CYLS FOLLOW                  ZDR08040
                    **************************************************  ZDR08050
                    *                                                   ZDR08060
                    MSG10 DC      MSG11-*   MESSAGE CHARACTER COUNT     ZDR08070
                          DMES    'RDEF CYLS:'R'E                       ZDR08080
                    *                                                   ZDR08090
                    **************************************************  ZDR08100
                    * MESSAGE 11 ENTER CARTRIDGE ID.                    ZDR08110
                    **************************************************  ZDR08120
                    *                                                   ZDR08130
                    MSG11 DC      MSG12-*   MESSAGE CHARACTER COUNT     ZDR08140
                          DMES    ENTER CART ID'R'E                     ZDR08150
                    *                                                   ZDR08160
                    **************************************************  ZDR08170
                    * MESSAGE 12 DISK ERROR... TURN ON SW 0 TO RETRY.   ZDR08180
                    **************************************************  ZDR08190
                    *                                                   ZDR08200
                    MSG12 DC      MSG13-*   MESSAGE CHARACTER COUNT     ZDR08210
                          DMES    DISK ERR...TURN ON SW 0 TO RETRY'R'E  ZDR08220
                    *                                                   ZDR08230
                    **************************************************  ZDR08240
                    * MESSAGE 13 ENTER SOURCE DR. BITS 0-3              ZDR08250
                    *            OBJECT DR. BITS 12-15                  ZDR08260
                    **************************************************  ZDR08270
                    *                                                   ZDR08280
                    MSG13 DC      MSG14-*   MESSAGE CHARACTER COUNT     ZDR08290
                          DMES    'RENTER:'RSOURCE DR (BITS 0-3)'ROBJE' ZDR08300
                          DMES    CT DR (BITS 12-15)'R'E                ZDR08310
                    *                                                   ZDR08320
                    *************************************************** ZDR08330
                    * MESSAGE 14 ENTER REPETITION COUNT IN BITS 11-15   ZDR08340
                    *************************************************** ZDR08350
                    *                                                   ZDR08360
                    MSG14 DC      MSG15-*   MESSAGE CHARACTER COUNT     ZDR08370
                          DMES    ENTER REPEAT CNT (BITS 11-15)'R'E     ZDR08380
                    *                                                   ZDR08390
                    **************************************************  ZDR08400
                    * MESSAGE 15  CARTRIDGE IS DEFECTIVE                ZDR08410
                    **************************************************  ZDR08420
                    *                                                   ZDR08430
                    MSG15 DC      MSG16-*   MESSAGE CHARACTER COUNT     ZDR08440
                          DMES    DEF CART'R'E                          ZDR08450
                    *                                                   ZDR08460
                    **************************************************  ZDR08470
                    * MESSAGE 16 OBJECT                                 ZDR08480
                    **************************************************  ZDR08490
                    *                                                   ZDR08500
                    MSG16 DC      MSG17-*   MESSAGE CHARACTER COUNT     ZDR08510
                          DMES    OBJECT'E                              ZDR08520
                    *                                                   ZDR08530
                    **************************************************  ZDR08540
                    * MESSAGE 17 SOURCE                                 ZDR08550
                    **************************************************  ZDR08560
                    *                                                   ZDR08570
                    MSG17 DC      MSG18-*   MESSAGE CHARACTER COUNT     ZDR08580
                          DMES    SOURCE'E                              ZDR08590
                    *                                                   ZDR08600
                    **************************************************  ZDR08610
                    * MESSAGE 18 CARTRIDGE NOT INITIALIZED              ZDR08620
                    **************************************************  ZDR08630
                    *                                                   ZDR08640
                    MSG18 DC      MSG19-*   MESSAGE CHARACTER COUNT     ZDR08650
                          DMES     CART NOT INITLZED'R'E                ZDR08660
                    *                                                   ZDR08670
                    *************************************************** ZDR08680
                    * MESSAGE 19 ENTER RELATIVE ADDR OF SCTR WORD       ZDR08690
                    *            TO CHANGE                              ZDR08700
                    *************************************************** ZDR08710
                    *                                                   ZDR08720
                    MSG19 DC      MSG20-*   MESSAGE CHARACTER COUNT     ZDR08730
                          DMES    'RENTER RLTV ADDR OF SCTR WD TO CHAN' ZDR08740
                          DMES    GE 'E                                 ZDR08750
                    *                                                   ZDR08760
                    *************************************************** ZDR08770
                    * MESSAGE 20 ADDRESS ERROR ON SECTOR ....           ZDR08780
                    *************************************************** ZDR08790
                    *                                                   ZDR08800
                    MSG20 DC      MSG21-*   MESSAGE CHARACTER COUNT     ZDR08810
                          DMES    'RADDR ERR ON SCTR 'E                 ZDR08820
                    *                                                   ZDR08830
                    *************************************************** ZDR08840
                    * MESSAGE 21 ERRONEOUS SCTR ADDR WAS ....           ZDR08850
                    *************************************************** ZDR08860
                    *                                                   ZDR08870
                    MSG21 DC      MSG22-*   MESSAGE CHARACTER COUNT     ZDR08880
                          DMES    BAD SCTR ADDR WAS 'E                  ZDR08890
                    *                                                   ZDR08900
                    *************************************************** ZDR08910
                    * MESSAGE 22 DISK READ ERROR ON SECTOR ....         ZDR08920
                    *************************************************** ZDR08930
                    *                                                   ZDR08940
                    MSG22 DC      MSG23-*   MESSAGE CHARACTER COUNT     ZDR08950
                          DMES    'RDISK READ ERR ON SCTR 'E            ZDR08960
                    *                                                   ZDR08970
                    *************************************************** ZDR08980
                    * MESSAGE 23 TURN ON BIT SW 0 TO DUMP               ZDR08990
                    *************************************************** ZDR09000
                    *                                                   ZDR09010
                    MSG23 DC      MSG24-*   MESSAGE CHARACTER COUNT     ZDR09020
                          DMES    TURN ON SW 0 TO DUMP 'E               ZDR09030
                    *                                                   ZDR09040
                    *************************************************** ZDR09050
                    * MESSAGE 24  COMPARE ERRORS ON SECTORS .... ....   ZDR09060
                    *************************************************** ZDR09070
                    *                                                   ZDR09080
                    MSG24 DC      MSG26-*   MSG CHAR COUNT              ZDR09090
                          DMES    'RCMP ERR ON SCTRS 'E                 ZDR09100
                    *                                                   ZDR09110
                    *************************************************** ZDR09120
                    * MSG26  OBJ CART IS UCART MSTR                     ZDR09130
                    *************************************************** ZDR09140
                    *                                                   ZDR09150
                    MSG26 DC      MSG27-*   MSG CHAR COUNT              ZDR09160
                          DMES    'ROBJ CART IS UCART MSTR'E            ZDR09170
                    *                                                   ZDR09180
                    *************************************************** ZDR09190
                    * MSG27  OBJ CART ID INVALID                        ZDR09200
                    *************************************************** ZDR09210
                    *                                                   ZDR09220
                    MSG27 DC      MSG28-*   MSG CHAR COUNT              ZDR09230
                          DMES    'ROBJ CART ID INVALID'E               ZDR09240
                    *                                                   ZDR09250
                    *************************************************** ZDR09260
                    * MSG28  OBJ NOT FRESHLY INITLZED                   ZDR09270
                    *************************************************** ZDR09280
                    *                                                   ZDR09290
                    MSG28 DC      MSG29-*   WORD COUNT OF MESSAGE   212 ZDR09300
                          DMES    'ROBJ CART NOT FRESHLY INITLZED'E     ZDR09310
                    MSG29 DC      MSG30-*   WORD COUNT OF MESSAGE   212 ZDR09312
                          DMES    'RSRC ID = 'E                     212 ZDR09313
                    MSG30 DC      TABLE-*   WORD COUNT OF MESSAGE   212 ZDR09314
                          DMES    'ROBJ ID = 'E                     212 ZDR09315
                    *                                               212 ZDR09316
                    *                                                   ZDR09320
                    *************************************************** ZDR09330
                    * PRINTER TABLES -                                * ZDR09340
                    *    LEFT 8 BITS ARE PRINTER CODE.  RIGHT 8 BITS  * ZDR09350
                    *    OF 1403 PRINTER TABLE IS USED BY THE PATCH   * ZDR09360
                    *    SUBROUTINE TO CONVERT FROM KEYBOARD TO HEXA- * ZDR09370
                    *    DECIMAL.  THE RIGHT HALF OF THE CONSOLE      * ZDR09380
                    *    PRINTER TABLE IS USED BY TYPE0 FOR EBCDIC    * ZDR09390
                    *    OUTPUT AS REQUIRED FOR THE DM1 LABEL.        * ZDR09400
                    *************************************************** ZDR09410
                    *                                                   ZDR09420
                    *     1403 PRINTER TABLE                            ZDR09430
                    *                                                   ZDR09440
                    TABLE DC      /4900     0                           ZDR09450
                          DC      /4001     1                           ZDR09460
                          DC      /0102     2                           ZDR09470
                          DC      /0203     3                           ZDR09480
                          DC      /4304     4                           ZDR09490
                          DC      /0405     5                           ZDR09500
                          DC      /4506     6                           ZDR09510
                          DC      /4607     7                           ZDR09520
                          DC      /0708     8                           ZDR09530
                          DC      /0809     9                           ZDR09540
                          DC      /640A     A                           ZDR09550
                          DC      /250B     B                           ZDR09560
                          DC      /260C     C                           ZDR09570
                          DC      /670D     D                           ZDR09580
                          DC      /680E     E                           ZDR09590
                          DC      /290F     F                           ZDR09600
                    *                                                   ZDR09610
                    *     1132 PRINTER TABLE                            ZDR09620
                    *                                                   ZDR09630
                          DC      /F000     0                           ZDR09640
                          DC      /F100     1                           ZDR09650
                          DC      /F200     2                           ZDR09660
                          DC      /F300     3                           ZDR09670
                          DC      /F400     4                           ZDR09680
                          DC      /F500     5                           ZDR09690
                          DC      /F600     6                           ZDR09700
                          DC      /F700     7                           ZDR09710
                          DC      /F800     8                           ZDR09720
                          DC      /F900     9                           ZDR09730
                          DC      /C100     A                           ZDR09740
                          DC      /C200     B                           ZDR09750
                          DC      /C300     C                           ZDR09760
                          DC      /C400     D                           ZDR09770
                          DC      /C500     E                           ZDR09780
                          DC      /C600     F                           ZDR09790
                    *                                                   ZDR09800
                    *     CONSOLE PRINTER / EBCDIC TABLE                ZDR09810
                    *                                                   ZDR09820
                    CPTBL DC      /C4F0     0                           ZDR09830
                          DC      /FCF1     1                           ZDR09840
                          DC      /D8F2     2                           ZDR09850
                          DC      /DCF3     3                           ZDR09860
                          DC      /F0F4     4                           ZDR09870
                          DC      /F4F5     5                           ZDR09880
                          DC      /D0F6     6                           ZDR09890
                          DC      /D4F7     7                           ZDR09900
                          DC      /E4F8     8                           ZDR09910
                          DC      /E0F9     9                           ZDR09920
                          DC      /3CC1     A                           ZDR09930
                          DC      /18C2     B                           ZDR09940
                          DC      /1CC3     C                           ZDR09950
                          DC      /30C4     D                           ZDR09960
                          DC      /34C5     E                           ZDR09970
                    ENDTB DC      /10C6     F                           ZDR09980
                          DC      /14C7     G                           ZDR09990
                          DC      /24C8     H                           ZDR10000
                          DC      /20C9     I                           ZDR10010
                          DC      /7CD1     J                           ZDR10020
                          DC      /58D2     K                           ZDR10030
                          DC      /5CD3     L                           ZDR10040
                          DC      /70D4     M                           ZDR10050
                          DC      /74D5     N                           ZDR10060
                          DC      /50D6     O                           ZDR10070
                          DC      /54D7     P                           ZDR10080
                          DC      /64D8     Q                           ZDR10090
                          DC      /60D9     R                           ZDR10100
                          DC      /98E2     S                           ZDR10110
                          DC      /9CE3     T                           ZDR10120
                          DC      /B0E4     U                           ZDR10130
                          DC      /B4E5     V                           ZDR10140
                          DC      /90E6     W                           ZDR10150
                          DC      /94E7     X                           ZDR10160
                          DC      /A4E8     Y                           ZDR10170
                          DC      /A0E9     Z                           ZDR10180
                          DC      /405B     DOLLAR SIGN                 ZDR10190
                          DC      /C07B     POUND SIGN                  ZDR10200
                          DC      /047C     AT                          ZDR10210
                          DC      /4600     GREATER THAN                ZDR10220
                          DC      /DE00     LESS THAN                   ZDR10230
                          DC      /D600     *                           ZDR10240
                          DC      /0000     .                           ZDR10250
                    *                                                   ZDR10260
                    *     CONSOLE KEYBOARD TABLE                        ZDR10270
                    *                                                   ZDR10280
                    KBTBL DC      /2000     ZERO                        ZDR10290
                          DC      /1000     1                           ZDR10300
                          DC      /0800     2                           ZDR10310
                          DC      /0400     3                           ZDR10320
                          DC      /0200     4                           ZDR10330
                          DC      /0100     5                           ZDR10340
                          DC      /0080     6                           ZDR10350
                          DC      /0040     7                           ZDR10360
                          DC      /0020     8                           ZDR10370
                          DC      /0010     9                           ZDR10380
                          DC      /9000     A                           ZDR10390
                          DC      /8800     B                           ZDR10400
                          DC      /8400     C                           ZDR10410
                          DC      /8200     D                           ZDR10420
                          DC      /8100     E                           ZDR10430
                    KBHXE DC      /8080     F                           ZDR10440
                          DC      /8040     G                           ZDR10450
                          DC      /8020     H                           ZDR10460
                          DC      /8010     I                           ZDR10470
                          DC      /5000     J                           ZDR10480
                          DC      /4800     K                           ZDR10490
                          DC      /4400     L                           ZDR10500
                          DC      /4200     M                           ZDR10510
                          DC      /4100     N                           ZDR10520
                          DC      /4080     O                           ZDR10530
                          DC      /4040     P                           ZDR10540
                          DC      /4020     Q                           ZDR10550
                          DC      /4010     R                           ZDR10560
                          DC      /2800     S                           ZDR10570
                          DC      /2400     T                           ZDR10580
                          DC      /2200     U                           ZDR10590
                          DC      /2100     V                           ZDR10600
                          DC      /2080     W                           ZDR10610
                          DC      /2040     X                           ZDR10620
                          DC      /2020     Y                           ZDR10630
                          DC      /2010     Z                           ZDR10640
                          DC      /4420     DOLLAR SIGN                 ZDR10650
                          DC      /0420     POUND SIGN                  ZDR10660
                          DC      /0220     AT                          ZDR10670
                          DC      /20A0     GREATER THAN                ZDR10680
                          DC      /8220     LESS THAN                   ZDR10690
                          DC      /4220     *                           ZDR10700
                    KBTBE DC      /8420     .                           ZDR10710
                          HDNG    INITIALIZE OPTION                     ZDR10720
                    *************************************************** ZDR10721
                    * THE FOLLOWING SECTION PREPARES TO INITIALIZE A    ZDR10722
                    * VIRGIN PACK                                       ZDR10723
                    *************************************************** ZDR10724
                    *                                                   ZDR10725
                    INITV EQU     *                                2-12 ZDR10726
                          STO     IT950     SET VIRGIN PACK INDR   2-12 ZDR10727
                          SPAC    3                                     ZDR10730
                    *************************************************** ZDR10735
                    * THE FOLLOWING SECTION HANDLES DISK INITIALIZATION ZDR10740
                    *************************************************** ZDR10750
                    *                                                   ZDR10760
                    INITL EQU     *                                2-11 ZDR10770
                          LDX  L1 MSSG6                                 ZDR10780
                    IT040 BSI  L  INSTR     FETCH DRIVE CODE            ZDR10790
                          S       IT920     SUB MAX DR NO. +1      2-11 ZDR10802
                          LDX  L1 MSSG5                            2-11 ZDR10804
                          BSC  L  IT040,-   BR IF ILLEGAL DR NO9   2-11 ZDR10806
                          A       IT920     RESTORE DR NO.         2-11 ZDR10808
                          SLA     12                                    ZDR10810
                          STO  L  SECT1     FIRST SCTR TO BE INITLZED   ZDR10820
                          STO     IT945                                 ZDR10830
                          BSI  L  PRSNT     BR TO CHECK DEVC ON SYS 2-3 ZDR10900
                          LD      IT950     IF VIRGIN PACK, DO NOT 2-12 ZDR10910
                          BSC  L  IT060,Z+  *SEEK HOME             2-12 ZDR10920
                          BSI  L  HOMEX     BR TO SEEK HOME        2-11 ZDR10940
                    IT060 LDX  L1 MSG11                            2-12 ZDR10980
                    IT080 BSI  L  INSTR     FETCH CARTRIDGE ID          ZDR10990
                          LDX  L1 MSSG5                                 ZDR11000
                          BSC  L  IT080,+   BR IF CARTRIDGE ID ILLEGAL  ZDR11010
                          WAIT              WAIT FOR OPERATOR TO   2-11 ZDR11012
                    *                       *VERIFY DR NO. AND     2-11 ZDR11014
                    *                       *CARTRIDGE ID ENTERED  2-11 ZDR11016
                    IT090 STO  L  XXXXX                                 ZDR11020
                          LD      IT930                                 ZDR11030
                          STO  L  SW005     SET TEST PATTERN FLAG       ZDR11040
                    IT100 STO  L  NOPTN     SET REPEAT CNT FLAG TO MIN  ZDR11050
                          SRA     16                                    ZDR11060
                          STO  L  BADCS     CLEAR BAD CYLINDER COUNT    ZDR11070
                    *                                                   ZDR11080
                    * PREPARE THE DEFECTIVE CYLINDER TABLE              ZDR11090
                    *                                                   ZDR11100
                          LDX   1 -'NDCY                                ZDR11110
                          LD      IT925     PREPARE DEFECTIVE CYLINDER  ZDR11120
                    IT120 STO  L1 BADCS+'DCTB+'NDCY  *TBL IN BUFFER     ZDR11130
                          MDX   1 1         SKIP WHEN DONE              ZDR11140
                          MDX     IT120     BR TO STORE ANOTHER ENTRY   ZDR11150
                    *                                                   ZDR11160
                    * WRITE TEST PATTERNS ON DISK TO FIND DEF CYLINDERS ZDR11170
                    *                                                   ZDR11180
                          BSI     PA000     WR PATTERNS ON DISK    2-11 ZDR11190
                          MDX  L  BADCS,0   SKIP IF NO DEFECTIVE        ZDR11200
                          MDX     IT320     *CYLINDERS, BR OTHERWISE    ZDR11210
                          BSI  L  WRTY0     PRINT NO DEF CYL MESSAGE    ZDR11220
                          DC      /2000     PRINT FUNCTION CODE         ZDR11230
                          DC      MSSG9     ADDR OF MESSAGE             ZDR11240
                    IT140 BSI  L  FI000     WRITE 'IDAD, 'DCOM, LET     ZDR11250
                          LDX  L1 MSSG4                                 ZDR11260
                          BSI  L  INSTR     ASK ABOUT ADDITIONAL TEST   ZDR11270
                          BSC  L  IT300,-   EXIT IF NO MORE DESIRED     ZDR11280
                    *                                                   ZDR11290
                    * CHECK FOR ADDITIONAL TESTING                      ZDR11300
                    *                                                   ZDR11310
                          LD      IT945     RESET THE INITIAL           ZDR11320
                          STO  L  SECT1     *SECTOR ADDRESS             ZDR11330
                          LDX  L1 MSG14                                 ZDR11340
                    IT150 BSI  L  INSTR     ASK FOR REPETITION COUNT    ZDR11350
                          LDX  L1 MSSG5                                 ZDR11360
                          BSC  L  IT150,+   BR IF DATA SW ENTRY ERROR   ZDR11370
                          SLA     11        TRUNCATE TO                 ZDR11380
                          SRA     11        *MODULO 32                  ZDR11390
                          BSC  L  IT150,+-  BR IF REPEAT IS ZERO        ZDR11400
                          MDX     IT100     BR TO REPEAT INITIALIZATION ZDR11410
                    *                                                   ZDR11420
                    * CONSTANTS AND WORK AREAS                          ZDR11430
                    *                                                   ZDR11440
                    IT920 DC      'MXDR     NO. OF DRIVES          2-11 ZDR11460
                    IT925 DC      'MSCT     1+MAXIMUM SCTR ADDR         ZDR11470
                    IT930 DC      1         NORMAL REPETITION COUNT     ZDR11480
                    IT945 DC      *-*       INITIAL SCTR ADDR           ZDR11490
                    IT950 DC      *-*       VIRGIN PACK INDR       2-12 ZDR11495
                    *                                                   ZDR11500
                    *                                                   ZDR11530
                    * DEFECTIVE CARTRIDGE                               ZDR11540
                    *                                                   ZDR11550
                    IT280 BSI  L  WRTY0     PRINT DEFECTIVE CART MSSGE  ZDR11560
                          DC      /2000     PRINT FUNCTION CODE         ZDR11570
                          DC      MSG15     ADDR OF MESSAGE             ZDR11580
                    IT300 BSC  L  CM050     RETURN FOR NEXT OPTION 2-11 ZDR11590
                    *                                                   ZDR11600
                    * REPORT DEFECTIVE CYLINDERS TO USER                ZDR11610
                    *                                                   ZDR11620
                    IT320 BSI  L  WRTY0     PRINT DEF CYLINDER MESSAGE  ZDR11630
                          DC      /2000     PRINT FUNCTION CODE         ZDR11640
                          DC      MSG10     ADDR OF MESSAGE             ZDR11650
                          LDX  L1 BADCS     DEF CYL COUNT TO XR1        ZDR11660
                          BSI  L  CNPNT     PRINT DEF CYLINDER LIST     ZDR11670
                          MDX  L  BADCS,-'NDCY  SKIP IF NOT TOO MANY    ZDR11680
                          MDX     IT280     *DEF CYLS, BR OTHERWISE     ZDR11690
                          MDX  L  BADFL,0   SKIP IF CYL ZERO GOOD AND   ZDR11700
                          MDX     IT280     *ALL ADDRESSES ARE GOOD     ZDR11710
                          MDX     IT140     BR TO WRITE CYLINDER ZERO   ZDR11720
                          HDNG    INITIALIZE OPTION                     ZDR11760
                    *                                                   ZDR11770
                    *************************************************** ZDR11780
                    * WRITE TEST PATTERNS ON ALL CYLINDERS              ZDR11790
                    *************************************************** ZDR11800
                    *                                                   ZDR11810
                    PA000 DC      *-*       ENTRY POINT                 ZDR11820
                          LDX  L1 'MCYL     INITIALIZE NO. CYLINDERS    ZDR11830
                          STX   1 PA935     *TO TEST                    ZDR11840
                    PA040 LD   L  NOPTN     INITIALIZE NO. TIMES TO     ZDR11850
                          STO     PA910     *WRITE THE TEST PATTERNS    ZDR11860
                    PA080 LDX   2 'NPTN     INITIALIZE NO. PATTERNS     ZDR11870
                          STX   2 PA915     *TO WRITE                   ZDR11880
                          LDX  L1 PA990                                 ZDR11890
                          STX   1 PA160+1                               ZDR11900
                    PA120 LDX  L2 ENDXX-PRNT3-'SADR  BFR LENGTH TO XR1  ZDR11910
                          STX   3 PA200+1   INITIALIZE WITH BUFFER ADDR ZDR11920
                    PA160 LD   L  *-*       FETCH CURRENT TEST PATTERN  ZDR11930
                          RTE     16                                    ZDR11940
                          LD   I  PA160+1   SAVE CURRENT                ZDR11950
                          STD     PA900     *TEST PATTERN               ZDR11960
                    PA200 STD  L2 *-*       STORE PATTERN IN DISK BFR   ZDR11970
                          MDX   2 -2        SKIP WHEN BUFFER FULL       ZDR11980
                          MDX     PA200     BR TO STORE ANOTHER PAIR    ZDR11990
                    *                                                   ZDR12000
                    * WRITE CURRENT PATTERN ON CURRENT CYLINDER         ZDR12010
                    *                                                   ZDR12020
                          LDX   2 'CCNT     NO. CYLINDERS ON DISK TO X2 ZDR12030
                          LD   L  SECT1     FETCH INITIAL SCTR ADDR     ZDR12040
                    PA240 BSI  L  WRIT1     WRITE TEST PATTERN ON DISK  ZDR12050
                          MDX  L  SECT1,1   POINT TO NEXT SECTOR        ZDR12060
                          MDX   2 -1        SKIP AFTER ENTIRE CYLINDER  ZDR12070
                          MDX     PA240     *WRITTEN, BR OTHERWISE      ZDR12080
                    *                                                   ZDR12090
                    * COMPARE DESIRED SCTR ADDR WITH WHAT WAS WRITTEN   ZDR12100
                    *                                                   ZDR12110
                          LDX   2 'CCNT     NO. SCTRS PER CYL TO XR2    ZDR12120
                    PA280 LDX   1 1                                     ZDR12130
                          STX   1 PA940     READ/CMP REPEAT COUNT       ZDR12140
                          SRA     16                                    ZDR12150
                          STO  L  SW004     CLEAR ERROR SWITCH          ZDR12160
                          STO  L  BADAD     CLEAR SCTR ADDR ERR SWITCH  ZDR12170
                          MDX  L  SECT1,-1  PREPARE TO READ SECTORS IN  ZDR12180
                          NOP               *REVERSE ORDER FROM WRITE   ZDR12190
                    PA290 LD   L  SECT1                                 ZDR12200
                          BSI  L  READ1     READ TEST PATTERN FROM DISK ZDR12210
                          AND     PA905     COMP SCTR ADDR W/O DR CODE  ZDR12220
                          S     3 'SADR     *SCTR ADDR READ FROM DISK   ZDR12230
                          BSC  L  PA360,+-  BR IF THEY MATCH            ZDR12240
                    PA300 BSI  L  MKERR     BR TO RECORD THE ERROR      ZDR12250
                          MDX     PA420     BR TO TEST READ/CMP DONE    ZDR12260
                    *                                                   ZDR12270
                    * CONSTANTS AND WORK AREAS                          ZDR12280
                    *                                                   ZDR12290
                    PA900 BSS  E  2         CURRENT TEST PATTERN        ZDR12300
                    PA905 DC      /0FFF     MASK                        ZDR12310
                    PA910 DC      *-*       NO. TIMES TO TRY TEST PTRNS ZDR12320
                    PA915 DC      *-*       PATTERN COUNTER/POINTER     ZDR12330
                    PA920 DC      'TEST     NO. RETRIES AFTER TEST ERR  ZDR12340
                    PA935 DC      *-*       NO. CYLINDERS TO BE TESTED  ZDR12350
                    PA940 DC      *-*       READ/COMPARE REPEAT COUNT   ZDR12360
                    PA990 DC      'PTN1     1ST TEST PATTERN            ZDR12370
                          DC      'PTN2     2ND TEST PATTERN            ZDR12380
                          DC      'PTN3     3RD TEST PATTERN            ZDR12390
                    *                                                   ZDR12400
                    * RECORD AN ERROR                                   ZDR12410
                    *                                                   ZDR12420
                    PA340 BSI  L  MKERR     BR TO RECORD THE ERROR      ZDR12430
                          MDX     PA420     BR TO TEST READ/CMP DONE    ZDR12440
                    *                                                   ZDR12450
                    * COMPARE WHAT HAS BEEN WRITTEN, WORD FOR WORD,     ZDR12460
                    * WITH THE CURRENT TEST PATTERN                     ZDR12470
                    *                                                   ZDR12480
                    PA360 LDX  L1 ENDXX-PRNT3-'SADR  BFR LENGTH TO XR1  ZDR12490
                          STX   3 PA400+1                               ZDR12500
                    PA380 LDD     PA900     COMPARE 2 WORDS FROM DISK   ZDR12510
                    PA400 SD   L1 *-*       *WITH 2 PATTERN WORDS       ZDR12520
                          BSC     +-        SKIP IF 1ST WORDS UNEQUAL   ZDR12530
                          RTE     16        CHECK 2ND WORDS             ZDR12540
                          BSC  L  PA340,Z   BR IF UNEQUAL               ZDR12550
                          MDX   1 -2        SKIP AFTER ALL WORDS        ZDR12560
                          MDX     PA380     *COMPARED, BR OTHERWISE     ZDR12570
                    *                                                   ZDR12580
                    * CHECK TO SEE IF RETRY READ/COMPARE REQUIRED       ZDR12590
                    *                                                   ZDR12600
                    PA420 MDX  L  PA940,-1  DECR READ/CMP COUNTER       ZDR12610
                          MDX     PA290     BR TO READ/CMP SECTOR AGAIN ZDR12620
                    *                                                   ZDR12630
                    * CHECK IF CURRENT PATTERN CHECKED ON EACH SECTOR   ZDR12640
                    *                                                   ZDR12650
                          MDX   2 -1        SKIP AFTER ENTIRE CYLINDER  ZDR12660
                          MDX     PA280     *CHECKED, BR OTHERWISE      ZDR12670
                    *                                                   ZDR12680
                    * CHECK TO SEE THAT ONE PATTERN COMPLETED           ZDR12690
                    *                                                   ZDR12700
                          MDX  L  PA160+1,1 POINT TO NEXT TEST PATTERN  ZDR12710
                          MDX  L  PA915,-1  SKIP AFTER ALL PATTERNS OK  ZDR12720
                          MDX     PA120     BR TO TEST NEXT PATTERN     ZDR12730
                    *                                                   ZDR12740
                    * CHECK TO SEE IF PATTERNS SHOULD BE REPEATED       ZDR12750
                    *                                                   ZDR12760
                          MDX  L  PA910,-1  SKIP IF CYL TEST DONE       ZDR12770
                          MDX     PA080     BR TO WRITE PATTERNS AGAIN  ZDR12780
                    *                                                   ZDR12790
                    * CHECK TO SEE THAT ALL CYLINDERS DONE              ZDR12800
                    *                                                   ZDR12810
                          MDX  L  SECT1,'CCNT SPOINT TO NEXT CYLINDER   ZDR12820
                          MDX  L  PA935,-1  SKIP UNLESS ALL CYLS TESTED ZDR12830
                          MDX     PA040     BR TO TEST NEXT CYLINDER    ZDR12840
                          BSC  I  PA000     RETURN                      ZDR12850
                          HDNG    INITIALIZE OPTION                     ZDR12860
                    *                                                   ZDR12870
                    *************************************************** ZDR12880
                    * WRITE SECTORS 'IDAD, 'DCOM, AND LET               ZDR12890
                    *************************************************** ZDR12900
                    *                                                   ZDR12910
                    FI000 DC      *-*       ENTRY POINT                 ZDR12920
                          BSI  L  CB000     CLEAR DISK BUFFER           ZDR12930
                    *                                                   ZDR12940
                    * CREATE SCTR 'IDAD IN BUFFER                       ZDR12950
                    *                                                   ZDR12960
                          LD   L  BFRAD                                 ZDR12970
                          A       FI910     COMPUTE AND STORE IN BFR    ZDR12980
                          STO     FI120+1   *THE WD CNT OF SCTR 'IDAD   ZDR12990
                          LD   L  XXXXX     FETCH CARTRIDGE ID AND      ZDR13000
                          STO   3 'SADR+'CIDN  *STORE IN DISK BUFFER    ZDR13010
                    *                                                   ZDR13020
                    * MOVE DEFECTIVE CYLINDER TABLE TO BUFFER           ZDR13030
                    *                                                   ZDR13040
                          STX   3 FI070+1                               ZDR13050
                          MDX  L  FI070+1,'SADR+'NDCY+1                 ZDR13060
                          LDX   2 -'NDCY    NO. DEF CYLS TO XR2         ZDR13070
                    FI050 LD   L2 BADCS+'DCTB+'NDCY                     ZDR13080
                    FI070 STO  L2 *-*       STORE A DEF CYL ADDR        ZDR13090
                          MDX   2 1         SKIP AFTER TABLE MOVED      ZDR13100
                          MDX     FI050     BR TO MOVE ANOTHER ENTRY    ZDR13110
                          SRA     16                                    ZDR13150
                          STO   3 'SADR+'COPY  ZERO TO COPY CODE        ZDR13160
                          LD      FI905     SET DISK TYPE INDR TO INDI- ZDR13170
                    FI090 STO   3 'SADR+'DTYP  *CATE DM2 NON-SYS CART   ZDR13180
                    *                                                   ZDR13190
                    * MOVE COLD START ERROR MESSAGE TO BUFFER           ZDR13200
                    *                                                   ZDR13210
                          LDX  L2 FI994-FI970                           ZDR13220
                    FI100 LD   L2 FI970-1                               ZDR13230
                    FI120 STO  L2 *-*                                   ZDR13240
                          MDX   2 -1        SKIP AFTER MESSAGE MOVED    ZDR13250
                          MDX     FI100     BR TO MOVE ANOTHER WORD     ZDR13260
                    *                                                   ZDR13270
                    * WRITE SCTR 'IDAD ON DISK                          ZDR13280
                    *                                                   ZDR13290
                          LD   L  SECT1                                 ZDR13300
                          AND     FI945                                 ZDR13310
                          OR      FI900     STORE SCTR ADDR OF SCTR     ZDR13320
                          BSI  L  WRIT1     WRITE SCTR 'IDAD ON DISK    ZDR13330
                          MDX     FI200     BR TO WRITE 'DCOM           ZDR13340
                    *                                                   ZDR13380
                    * CONSTANTS AND WORK AREAS                          ZDR13390
                    *                                                   ZDR13400
                    FI900 DC      'IDAD     ADDR OF SCTR W/ CID, ETC.   ZDR13410
                    FI905 DC      'DM2I     FLAG FOR DM2 NON-SYS CART   ZDR13420
                    * HERE ONE CONSTANT IS REMOVED                  2-8 ZDR13430
                    FI910 DC      $ZEND-'CSTR-1 ADDR LAST WD ERR MSGE   ZDR13440
                    FI920 DC      'DCOM     SCTR ADDR OF DCOM           ZDR13450
                    FI925 DC      'FPAD*'DBSC  DB ADDR OF WORK STORAGE  ZDR13460
                    FI930 DC      'FPAD     INITIAL VALUE FOR WD ADDR   ZDR13470
                    FI935 DC      'CIBA     CIB SCTR ADDR,NON-SYS CART  ZDR13480
                    FI940 DC      'ULET     LET SCTR ADDR,NON-SYS CART  ZDR13490
                    FI945 DC      /F000     MASK                        ZDR13500
                    * INITIALIZATION VALUES FOR LET                     ZDR13510
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR13520
                    FI950 DC      FI965-*+1 WD CNT LET HDR AND 1 ENTRY  ZDR13530
                          DC      *-*       SPACE FOR SCTR ADDR         ZDR13540
                          DC      0         1ST LET SCTR NO.            ZDR13550
                          DC      'FPAD     SCTR ADDR OF USER AREA      ZDR13560
                          DC      0         RESERVED                    ZDR13570
                          DC      'SCNT-'LFHD-'LFEN  WORDS AVAILABLE    ZDR13580
                          DC      0         CHAIN ADDRESS               ZDR13590
                          DC      /7112     1DUMY IN                    ZDR13600
                          DC      /4528     *NAME CODE                  ZDR13610
                    FI965 DC      'MSCT*'DBSC-'NDSC*'DBSC-'FPAD*'DBSC   ZDR13620
                    * ERROR MESSAGE PROGRAM FOR NON-SYSTEM CARTRIDGES.* ZDR13630
                    * THIS PROGRAM IS SUBSTITUTED FOR THE COLD START  * ZDR13640
                    * PROGRAM ON NON-SYSTEM CARTRIDGES.               * ZDR13650
                    FI970 LD      FI991                                 ZDR13660
                          STO  L  $LEV4     INITIALIZE ITV              ZDR13670
                          LDX   1 FI992-FI993 MSG LENGTH TO XR1         ZDR13680
                    FI975 LD   L1 $ZEND+FI993-FI970  FETCH CHAR TO PRNT ZDR13690
                          STO     FI993                                 ZDR13700
                          XIO     FI990     PRINT THE CHARACTER         ZDR13710
                          WAIT              WAIT FOR INTERRUPT          ZDR13720
                          LD   L1 $ZEND+FI993-FI970  FETCH CHAR TO PRNT ZDR13730
                          SLA     8         GET CHAR IN BITS 0-7        ZDR13740
                          STO     FI993                                 ZDR13750
                          XIO     FI990                                 ZDR13760
                          WAIT              WAIT FOR INTERRUPT          ZDR13770
                          MDX   1 1         INCR WORD COUNT             ZDR13780
                          MDX     FI975     BR TO TYPE ANOTHER CHAR     ZDR13790
                    FI980 WAIT              END OF PROGRAM              ZDR13800
                          MDX     FI980     GO BACK TO WAIT             ZDR13810
                          BOSC L  *-*       RETURN TO INTERRUPT POINT   ZDR13820
                    FI985 EQU     *-1       INTERRUPT ENTRY POINT       ZDR13830
                          XIO     FI991     SENSE AND RESET             ZDR13840
                          MDX     FI985-1                               ZDR13850
                    *                                                   ZDR13860
                    * IOCC WORDS TO PRINT MESSAGE                       ZDR13870
                    *                                                   ZDR13880
                          BSS  E  0         MAKE ADDRESS EVEN           ZDR13890
                    FI990 DC      $ZEND+FI993-FI970  ADDR CHAR TO PRINT ZDR13900
                          DC      'I208     WRITE IOCC (2ND WORD)       ZDR13910
                    FI991 DC      $ZEND+FI985-FI970  ADDR INTERRUPT ENT ZDR13920
                          DC      'I206     SENSE IOCC (2ND WORD)       ZDR13930
                    *                                                   ZDR13940
                    *             MESSAGE CHARACTERS - CONSOLE PRINTER  ZDR13950
                    *                                                   ZDR13960
                    FI992 DMES    'RTHIS IS A NON-SYSTEM CARTRIDGE.'E   ZDR13970
                    FI993 DC      *-*       CHAR TO BE PRINTED          ZDR13980
                    * PATCH AREA                                        ZDR13990
                    FI994 BES     'SCNT-$ZEND+'CSTR+1-FI993+FI970+1     ZDR14000
                    *                                                   ZDR14010
                    * CREATE DCOM IN BUFFER                             ZDR14020
                    *                                                   ZDR14030
                    FI200 BSI  L  CB000     CLEAR DISK BUFFER           ZDR14040
                          LD   L  XXXXX                                 ZDR14050
                          STO   3 'SADR+1+#CIDN  INITIALIZE #CIDN       ZDR14060
                          LD      FI925                                 ZDR14070
                          STO   3 'SADR+1+#ANDU  INITIALIZE #ANDU       ZDR14080
                          STO   3 'SADR+1+#BNDU  INITIALIZE #BNDU       ZDR14090
                          LD      FI930                                 ZDR14100
                          STO   3 'SADR+1+#FPAD  INITIALIZE #FPAD       ZDR14110
                          LD      FI935                                 ZDR14120
                          STO   3 'SADR+1+#CIBA  INITIALIZE #CIBA       ZDR14130
                          LD      FI940                                 ZDR14140
                          STO   3 'SADR+1+#ULET  INITIALIZE #ULET       ZDR14150
                          LD   L  SECT1                                 ZDR14160
                          AND     FI945                                 ZDR14170
                          OR      FI920     PUT SCTR ADDR OF DCOM       ZDR14180
                          STO  L  SECT1                                 ZDR14190
                    *                                                   ZDR14200
                    * WRITE DCOM ON DISK                                ZDR14210
                    *                                                   ZDR14220
                          BSI  L  WRIT1     WRITE DCOM ON DISK          ZDR14230
                    *                                                   ZDR14240
                    * WRITE LET ON DISK                                 ZDR14250
                    *                                                   ZDR14260
                          LD   L  SECT1                                 ZDR14270
                          AND     FI945                                 ZDR14280
                          OR      FI940     PUT SCTR ADDR OF LET        ZDR14290
                          STO     FI950+'SADR  *IN DISK BUFFER     2-11 ZDR14300
                          STO  L  SECT1                                 ZDR14310
                          BSI  L  DX000     WRITE LET ON DISK           ZDR14320
                          DC      /0200     WRITE FUNCTION CODE         ZDR14330
                          DC      FI950     ADDR OF BUFFER              ZDR14340
                    *           .                                  2-11 ZDR14350
                    FI210 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR14360
                          MDX     FI210     LOOP ON DISK BUSY      2-11 ZDR14370
                          BSC  I  FI000     RETURN                      ZDR14380
                          HDNG    INITIALIZE OPTION                     ZDR14390
                    *                                                   ZDR14400
                    *************************************************** ZDR14410
                    * RECORD AN ERROR ON A CYLINDER                     ZDR14420
                    *************************************************** ZDR14430
                    *                                                   ZDR14440
                    MKERR DC      *-*       ENTRY POINT                 ZDR14450
                          STX   1 MK100+1   SAVE XR1                    ZDR14460
                          LD      MKERR                                 ZDR14470
                          S    L  LINKA     BR UNLESS SECTOR ADDR DOES  ZDR14480
                          BSC  L  MK050,Z   *NOT CHECK                  ZDR14490
                          STX  L0 BADAD     SET DEF SCTR ADDR FLAG      ZDR14500
                    *                                                   ZDR14510
                    *                                                   ZDR14520
                    *                                                   ZDR14530
                    MK050 MDX  L  SW004,0   SKIP IF THIS IS 1ST ERROR   ZDR14540
                          MDX     MK150     *IN SECTOR,BR OTHERWISE     ZDR14550
                          STX  L0 SW004     SET 1ST ERROR SWITCH        ZDR14560
                          LD   L  PA920     FETCH RETRY COUNTER         ZDR14570
                          STO  L  PA940     READ/CMP REPEAT COUNT       ZDR14580
                    MK100 LDX  L1 *-*       RESTORE XR1                 ZDR14590
                          BSC  I  MKERR     RETURN                      ZDR14600
                    *                                                   ZDR14610
                    * RECORD A DEFECTIVE CYLINDER                       ZDR14620
                    *                                                   ZDR14630
                    MK150 LD   L  BADAD                                 ZDR14640
                          BSC  L  MK200,+-  BR IF SCTR ADDR OK          ZDR14650
                          STX  L0 BADFL     SET DEFECTIVE CART INDR     ZDR14660
                    MK200 LDX   2 1         SET UP TO TERMINATE READ/   ZDR14670
                          STX  L2 PA940     *COMPARE ON THIS CYLINDER.  ZDR14680
                          STX  L2 PA910                                 ZDR14690
                          LDX  L1 BADCS     ADDR OF DEF CYL TBL TO XR1  ZDR14700
                          MDX  I1 BADCS     INCR XR1 BY NO. DEF CYLS    ZDR14710
                          LD   L  SECT1                                 ZDR14720
                          AND     MK905     CYL BOUNDARY MASK           ZDR14730
                          STO  L  SECT1     RESET TO 1ST SCTR OF CYL    ZDR14740
                          AND     MK900     BR IF NOT CYL ZERO WHICH    ZDR14750
                          BSC  L  MK250,Z   *IS DEFECTIVE.              ZDR14760
                          STX  L0 BADFL     SET DEFECTIVE CART INDR     ZDR14770
                    MK250 EOR   1 0         COMPARE WITH ADDR LAST DEF  ZDR14780
                          BSC  L  MK300,Z   *CYL, BR IF NOT SAME.       ZDR14790
                          MDX  L  BADCS,0   SKIP IF IT IS CYLINDER ZERO ZDR14800
                          MDX     MK100     *BR OTHERWISE               ZDR14810
                    MK300 EOR   1 0         RESTORE CURRENT CYL TO ACC  ZDR14820
                          STO   1 1         STORE IN DEF CYL TABLE      ZDR14830
                          MDX  L  BADCS,1   INCR DEFECTIVE CYLINDER CT  ZDR14840
                          MDX     MK100     TO EXIT                     ZDR14850
                    *                                                   ZDR14860
                    * CONSTANTS AND WORK AREAS                          ZDR14870
                    *                                                   ZDR14880
                    MK900 DC      /0FF8     MASK                        ZDR14890
                    MK905 DC      /FFF8     CYL BOUNDARY ADDR MASK      ZDR14900
                          HDNG    INITIALIZE OPTION                     ZDR14910
                    *                                                   ZDR14920
                    *************************************************** ZDR14930
                    * CLEAR DISK BUFFER                               * ZDR14940
                    *************************************************** ZDR14950
                    *                                                   ZDR14960
                    CB000 DC      *-*       ENTRY POINT                 ZDR14970
                          LDX  L2 'SCNT     WD CNT OF BUFFER TO XR2     ZDR14980
                          STX   3 CB030+1                               ZDR14990
                          SLT     32        CLEAR REMAINDER OF          ZDR15000
                    CB030 STD  L2 *-*       *BUFFER TO ZERO             ZDR15010
                          MDX   2 -2        SKIP AFTER BUFFER CLEARED   ZDR15020
                          MDX     CB030     BR TO CLEAR ANOTHER WORD    ZDR15030
                          BSC  I  CB000     RETURN                      ZDR15040
                          HDNG    COPY OPTION                           ZDR15050
                    *************************************************** ZDR15060
                    * THE FOLLOWING SECTION DUPLICATES DISKS            ZDR15070
                    *************************************************** ZDR15080
                    *                                                   ZDR15090
                    DUPLC EQU     *                                2-11 ZDR15100
                    *                                                   ZDR15110
                    * FETCH SOURCE AND OBJECT DRIVE NOS.,CHECK VALIDITY ZDR15120
                    *                                                   ZDR15130
                          BSI  L  GETDR     GET SOURCE AND OBJECT DRS.  ZDR15140
                          LDX  L1 CO900                             2-4 ZDR15160
                          LDX  L2 CO990                                 ZDR15170
                          STX   2 CO120+1                               ZDR15180
                          MDX   2 'NDCY-1                               ZDR15190
                          STX   2 CO140+1                               ZDR15200
                          LDX   2 -1          SET UP FOR A SOURCE PASS  ZDR15240
                          STD   1 CO940-CO900  SAVE ADDR OF 'IDAD  2-11 ZDR15250
                    *                                                   ZDR15260
                    * SEEK HOME,FETCH SCTR 'IDAD,SAVE SOME OF CONTENTS  ZDR15270
                    *                                                   ZDR15280
                    CO100 STO  L  SECT1     INITIALIZE TO SCTR ZERO     ZDR15290
                          STO   1 CO920-CO900 SAVE DRIVE CODE       2-4 ZDR15300
                          OR    1 CO900-CO900 DR CODE+MAX SCTR ADR      ZDR15310
                          STO   1 CO922-CO900 *TO CHECK DEF CYLS        ZDR15320
                          BSI  L  HOMEX     SEEK HOME,READ SCTR 'IDAD   ZDR15330
                          LD    3 'SADR+'DTYP                           ZDR15340
                          STO  L2 CO950+1   SAVE CARTRIDGE TYPE INDR    ZDR15350
                          LD    3 'SADR+'COPY                           ZDR15360
                          STO  L2 CO965+1   SAVE COPY CODE              ZDR15370
                          LD    3 'SADR+'CIDN                           ZDR15380
                          STO  L2 CO960+1   SAVE CARTRIDGE ID           ZDR15390
                          LD    3 'SADR+'DCTB+1                         ZDR15400
                          OR   L  CO920     DRIVE CODE                  ZDR15410
                          RTE     16                                    ZDR15420
                          LD    3 'SADR+'DCTB  FETCH 1ST DEF CYL ENTRY  ZDR15430
                          BSC  L  CO630,Z+  BR IF NEGATIVE         2-11 ZDR15435
                          OR   L  CO920     DRIVE CODE                  ZDR15440
                    CO120 STD  L  *-*                                   ZDR15450
                          S    L  CO922     BR IF GREATER THAN MAXIMUM  ZDR15470
                          BSC  L  CO630,Z-  *ALLOWABLE ADDR             ZDR15480
                          LD    3 'SADR+'DCTB    COMPARE ENTRIES 1 AND  ZDR15490
                          S     3 'SADR+'DCTB+1 *TWO                    ZDR15500
                          BSC  L  CO630,Z-  BR IF 1ST GT 2ND            ZDR15510
                          BSC  L  CO130,Z   BR IF 1ST LT 2ND            ZDR15520
                          LD    3 'SADR+'DCTB+1                         ZDR15530
                          S       CO900     BR UNLESS BOTH WERE EQUAL   ZDR15540
                          BSC  L  CO630,Z   *TO MAX ALLOWABLE NO.       ZDR15550
                    CO130 LD    3 'SADR+'DCTB+2  FETCH LAST DEF CYL2-11 ZDR15560
                          BSC  L  CO630,Z+  *AND BR IF NEGATIVE    2-11 ZDR15570
                          OR      CO920     OR IN DR NUMBER        2-11 ZDR15580
                    CO140 STO  L  *-*       *AND SAVE              2-11 ZDR15590
                          S       CO922     BR IF LARGER THAN MAX AL-   ZDR15600
                          BSC  L  CO630,Z-  *LOWABLE NO.                ZDR15610
                    *                                                   ZDR15620
                    * GET WD CNT TO READ ONLY DEF CYL TABLE AND CART-   ZDR15630
                    * RIDGE  ID FROM OBJECT CARTRIDGE INTO BUFFER       ZDR15640
                    *                                                   ZDR15650
                          LDX   1 'SADR+'DTYP                           ZDR15660
                          STX  I1 BFRAD     WD COUNT FOR READING OBJECT ZDR15670
                          MDX   2 1         SKIP AFTER SOURCE CART DONE ZDR15680
                          MDX     CO240     BR TO COPY SCTR 'IDAD       ZDR15690
                    *                                                   ZDR15700
                    * PREPARE TO SAVE OBJECT DEF CYL TABLE              ZDR15710
                    *                                                   ZDR15720
                          LDX  L1 CO994                                 ZDR15730
                          STX   1 CO120+1                               ZDR15740
                          MDX   1 'NDCY-1                               ZDR15750
                          STX   1 CO140+1                               ZDR15760
                          LDX  L1 CO900     RESTORE XR1             2-4 ZDR15770
                          LD      CO945     FETCH OBJ SCTR ADDR         ZDR15780
                          MDX     CO100     BR TO SAVE OBJ DEF CYL TBL  ZDR15790
                    *                                                   ZDR15800
                    * WRITE SCTR 'IDAD ONTO OBJECT CARTRIDGE            ZDR15810
                    *                                                   ZDR15820
                    CO240 LDX  L1 MSG29     WRITE SOURCE CARTRIDGE  212 ZDR15821
                          BSI  L  MSOUT     *MESSAGE                212 ZDR15822
                          LD      CO960     PICK UP SOURCE ID       212 ZDR15823
                          STO  L  INFOR     *AND                    212 ZDR15824
                          LDX  L1 INFOR-1   * PRINT                 212 ZDR15825
                          BSI  L  CNPNT     *  ON CONSOLE           212 ZDR15826
                          LDX  L1 MSG30     WRITE OBJECT CARTRIDGE  212 ZDR15827
                          BSI  L  MSOUT     *MESSAGE                212 ZDR15828
                          LD      CO960+1   PICK UP OBJECT ID       212 ZDR15829
                          STO  L  INFOR     *AND                    212 ZDR15830
                          LDX  L1 INFOR-1   * PRINT                 212 ZDR15831
                          BSI  L  CNPNT     *  ON CONSOLE           212 ZDR15832
                          WAIT              WAIT FOR OPERATOR ACTION212 ZDR15833
                          LD      CO910     SET UP WD CNT TO WRITE A212 ZDR15834
                          STO   3 'WDCT     *FULL SECTOR                ZDR15840
                          LD      CO950                                 ZDR15850
                          STO     CO965+1                           2-4 ZDR15860
                          STO   3 'SADR+'DTYP  SOURCE CART TYPE INDR    ZDR15870
                    *                                               2-8 ZDR15880
                    * TEST IF SOURCE CART TYPE IS VALID             2-8 ZDR15890
                    *                                               2-8 ZDR15900
                          BSC  L  CO250,+-  BR IF S IS NON-SYST M0,12-8 ZDR15910
                          S       CO927     SUBTR THREE             2-8 ZDR15920
                          BSC  L  CO245,+-  BR IF S IS UCART MASTER 2-8 ZDR15930
                          LD      CO950     S CART TYPE INDR        2-8 ZDR15940
                          S       CO926     SUBTR TWO               2-8 ZDR15950
                          BSC  L  CO250,+-  BR IF S IS SYST CART    2-8 ZDR15960
                          LD      CO950     S CART TYPE INDR        2-8 ZDR15970
                          A       CO926     ADD TWO                 2-8 ZDR15980
                          BSC  L  CO250,+-  BR IF S IS NON-SYST CART2-8 ZDR15990
                          MDX     CO336     BR TO PR ER MSG 17,18   2-8 ZDR16000
                    *                                                   ZDR16010
                    * SEE IF OBJECT IS FRESHLY INITIALIZED DM2 CART     ZDR16020
                    *                                                   ZDR16030
                    CO245 LD      CO950+1   OBJECT CART TYPE CODE   2-3 ZDR16040
                          A       CO926     TWO                         ZDR16050
                          BSC  L  CO660,Z   BR IF NOT FRESHLY INIT DM2  ZDR16060
                    *                                                   ZDR16070
                    * CHECK OBJECT LABEL VALID                          ZDR16080
                    *                                                   ZDR16090
                    CO250 LD      CO960+1   OBJECT CART ID              ZDR16100
                          BSC  L  CO650,+   BR IF OBJ CART LABEL BAD    ZDR16110
                          LD      CO965     SOURCE COPY CODE            ZDR16120
                          A       CO925                                 ZDR16130
                          STO   3 'SADR+'COPY  INCR COPY CODE BY 1      ZDR16140
                    *                                                   ZDR16150
                    * TEST OBJECT CART FOR SYSTEM CART OR UCART MASTER  ZDR16160
                    *                                                   ZDR16170
                    CO270 LD      CO950+1   OBJ CART TYPE INDICATOR     ZDR16180
                          A       CO926     ADD TWO                 2-8 ZDR16190
                          BSC  L  CO280,+-  BR IF OBJ NONSYST CART  2-8 ZDR16200
                          LD      CO950+1   TEST FOR AND BR TO PRINT2-8 ZDR16210
                          S       CO927     *ERROR MSG IF OBJ CART  2-8 ZDR16220
                          BSC  L  CO640,+-  *IS UCART MASTER,EXIT   2-8 ZDR16230
                          A       CO925     BR TO PRINT ERROR MSG IF2-8 ZDR16240
                          BSC  L  CO629,Z   *OBJ TYPE INDR INVALID  2-8 ZDR16250
                          LDX  L1 MSG28                                 ZDR16260
                          BSI  L  MSOUT     MSG- OBJ CART NOT INITLZED  ZDR16270
                    CO275 WAIT              OPERATOR MUST INTERVENE     ZDR16280
                    CO280 LD      CO945     PUT SCTR ADDR (WITH DRIVE   ZDR16290
                          STO   3 'SADR     *CODE) IN BUFFER            ZDR16300
                          BSI  L  WRIT1     WRITE SCTR 'IDAD ON OBJECT  ZDR16310
                          STO     CO945     SAVE ADDR NEXT SCTR (OBJ)   ZDR16320
                    *                                                   ZDR16330
                    * FETCH NEXT SECTOR (ASSUMED SCTR 'DCOM FOR DM2)    ZDR16340
                    *                                                   ZDR16350
                          LD      CO940                                 ZDR16360
                          A       CO925     COMPUTE ADDR OF DCOM        ZDR16370
                          BSI  L  READ1     FETCH NEXT SCTR             ZDR16380
                    *                                                   ZDR16390
                    * FOR DM2 CARTRIDGES, PUT OBJ CARTRIDGE ID IN 'DCOM ZDR16400
                    *                                                   ZDR16410
                          LDX  I1 BFRAD                                 ZDR16440
                          MDX   1 #CIDN+'SADR+1+5                  2-11 ZDR16450
                          STX   1 CO330+1                               ZDR16460
                          STX   1 CO380+1                               ZDR16470
                          STX   1 CO335+1                           2-4 ZDR16480
                          LDX   1 -5        MINUS DR TBL LENGTH    2-11 ZDR16490
                    CO330 LD   L1 *-*       FETCH A CARTRIDGE ID AND    ZDR16500
                          S       CO960     *COMPARE WITH SOURCE ID     ZDR16510
                          BSC  L  CO360,+-  BR IF THEY MATCH            ZDR16520
                          SLA     16                                2-4 ZDR16530
                    CO335 STO  L1 *-*                               2-4 ZDR16540
                          MDX   1 1         SKIP IF NONE MATCH (DEF PK) ZDR16550
                          MDX     CO330     BR TO CHECK NEXT ID         ZDR16560
                    CO336 LDX   2 -1        SOURCE INDR TO XR2          ZDR16570
                          MDX     CO630     BR TO PRNT ERROR MSG   2-11 ZDR16580
                    *                                                   ZDR16590
                    * CONSTANTS AND WORK AREAS                          ZDR16600
                    *                                                   ZDR16610
                    CO900 DC      'MSCT     1+MAXIMUM SCTR ADDR         ZDR16620
                    CO910 DC      'SCNT+1   NO. WDS/SCTR,INCLUDING ADDR ZDR16630
                    CO920 DC      *-*       DR CODE / SCTRS LEFT TO CPY ZDR16650
                    CO922 DC      *-*       MAX SCTR ADDR / DEF CYL PTR ZDR16660
                    CO925 DC      1         GENERAL PURPOSE CONSTANT    ZDR16670
                    CO926 DC      2         GENERAL PURPOSE CONSTANT    ZDR16680
                    CO927 DC      3                                 2-8 ZDR16690
                          BSS  E  0                                 2-4 ZDR16700
                    CO940 DC      *-*       ADDR OF SCTR 'IDAD (SOURCE) ZDR16710
                    CO945 DC      *-*       ADDR OF SCTR 'IDAD (OBJECT) ZDR16720
                    CO950 DC      *-*       CART TYPE INDR (SOURCE)     ZDR16730
                          DC      *-*       CART TYPE INDR (OBJECT)     ZDR16740
                    CO960 DC      *-*       CARTRIDGE ID (SOURCE)       ZDR16750
                          DC      *-*       CARTRIDGE ID (OBJECT)       ZDR16760
                    CO965 DC      *-*       SOURCE CART COPY CODE       ZDR16770
                          DC      *-*       OBJECT CART COPY CODE       ZDR16780
                    CO990 BSS  E  'NDCY     DEFECTIVE CYL TABLE (SOURCE ZDR16790
                    CO980 DC      /0FFF     DRIVE CODE EXTRACT MASK     ZDR16800
                    CO994 BSS  E  'NDCY     DEFECTIVE CYL TABLE (OBJ)   ZDR16810
                    *                                                   ZDR16840
                    * STORE OBJECT CART ID IN 'DCOM                     ZDR16850
                    *                                                   ZDR16860
                    CO360 LD      CO960+1   STORE OBJECT CART ID IN     ZDR16870
                    CO380 STO  L1 *-*       *DCOM FROM SOURCE CART      ZDR16880
                    CO400 LD      CO945                                 ZDR16890
                          BSI  L  WRIT1     WRITE SCTR 'DCOM ON OBJECT  ZDR16900
                          STO     CO945     SAVE ADDR NEXT SCTR (SOURCE ZDR16910
                    *                                                   ZDR16920
                    * FETCH NEXT SECTOR (ASSUMED SCTR 'RIAD FOR DM2)    ZDR16930
                    *                                                   ZDR16940
                          LD      CO940                                 ZDR16950
                          A       CO926     COMPUTE ADDR OF RES IMAGE   ZDR16960
                          BSI  L  READ1     FETCH NEXT SCTR             ZDR16970
                          A       CO925                                 ZDR16980
                          STO     CO940     SAVE ADDR NEXT SCTR (SOURCE ZDR16990
                          LD      CO965+1                           2-4 ZDR17050
                          A       CO926                             2-3 ZDR17060
                          BSC  L  CO430,+-  BR IF SOURCE NON-SYST   2-3 ZDR17070
                    *                                                   ZDR17080
                    * PUT DEFECTIVE CYLINDER TABLE (OBJ) IN SCTR 'RIAD  ZDR17090
                    *                                                   ZDR17100
                          LDX  I2 BFRAD                                 ZDR17110
                          MDX  L2 2+$DCYL+'NDCY-$CH12              2-10 ZDR17120
                          BSI     CO700     BR TO SUBSTITUTE DEF TABLE  ZDR17130
                    *                                                   ZDR17140
                    * WRITE NEXT SECTOR ('RIAD FOR DM2) ON OBJECT CART  ZDR17150
                    *                                                   ZDR17160
                    CO430 LD      CO945                                 ZDR17170
                          BSI  L  WRIT1     WRITE 'RIAD ON OBJECT CART  ZDR17180
                          STO     CO945     SAVE NEXT SCTR ADDR (OBJ)   ZDR17190
                    *                                                   ZDR17200
                    * COPY REST OF SECTORS                              ZDR17210
                    *                                                   ZDR17220
                          LDX  L2 'MSCT-1-'NDCY*'CCNT-'RIAD  SAVE NO.   ZDR17230
                          STX  L2 CO920     *SCTRS LEFT TO COPY         ZDR17240
                    CO460 LD      CO940                                 ZDR17250
                          LDX  L1 CO990                                 ZDR17260
                          BSI  L  DC000     CHECK FOR DEF CYLINDER (S)  ZDR17270
                          STO     CO940                                 ZDR17280
                          BSI  L  READ1     READ  A SECTOR              ZDR17290
                          MDX  L  CO940,1   COMPUTE ADDR OF NEXT SCTR   ZDR17300
                    CO500 LD      CO945                                 ZDR17340
                          LDX  L1 CO994                                 ZDR17350
                          BSI  L  DC000     CHECK FOR DEF CYLINDER (O)  ZDR17360
                          STO     CO945                                 ZDR17370
                    CO510 LD      CO945                                 ZDR17380
                          BSI  L  WRIT1     WRITE A SECTOR ON OBJECT    ZDR17390
                          STX   3 CO530                                 ZDR17400
                          SRA     16                                    ZDR17410
                          STO  L  SW001     CLEAR READ-CHECK ERROR SW   ZDR17420
                          LD   L  SECT1                                 ZDR17430
                          STO   3 'SADR                                 ZDR17440
                          BSI  L  DX000     PERFORM A READ CHECK        ZDR17450
                          DC      /0180     READ-CHECK FUNCTION CODE    ZDR17460
                    CO530 DC      *-*       ADDR OF DISK BUFFER         ZDR17470
                    *           .                                  2-11 ZDR17480
                    CO540 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR17490
                          MDX     CO540     LOOP ON DISK BUSY      2-11 ZDR17500
                          MDX  L  SW001,0   SKIP IF NO READ-CHECK       ZDR17510
                          MDX     CO510     *ERROR,BR OTHERWISE         ZDR17520
                          LD      CO945                                 ZDR17530
                          A       CO925     INCR OBJ SCTR               ZDR17540
                          STO     CO945     *ADDR BY 1                  ZDR17550
                          MDX  L  CO920,-1  SKIP WHEN ALL SCTRS COPIED  ZDR17560
                          MDX     CO460     BR TO COPY MORE             ZDR17570
                    CO550 BSC  L  CM050     RETURN FOR NEXT OPTION 2-11 ZDR17580
                    *                                                   ZDR17680
                    * OBJECT CART IS UCART MASTER                       ZDR17690
                    *                                                   ZDR17700
                    CO640 LDX  L1 MSG26     ERROR MESSAGE ADDR          ZDR17710
                    CO645 BSI  L  MSOUT     BR TO PRINT                 ZDR17720
                          MDX     CO550     EXIT                        ZDR17730
                    *                                                   ZDR17740
                    * ERROR MSG -  OBJ CART ID INVALID                  ZDR17750
                    *                                                   ZDR17760
                    CO650 LDX  L1 MSG27     ERROR MSG ADDR              ZDR17770
                          MDX     CO645     BR TO PRINT AND EXIT        ZDR17780
                    *                                                   ZDR17790
                    * ERROR MSG - OBJ CART NOT FRESHLY INITIALIZED      ZDR17800
                    *                                                   ZDR17810
                    CO660 LDX  L1 MSG28     ERROR MSG ADDR              ZDR17820
                          MDX     CO645     BR TO PRINT AND EXIT        ZDR17830
                          HDNG    COPY OPTION                           ZDR17840
                    *                                                   ZDR17850
                    *************************************************** ZDR17860
                    * SUBSTITUTE OBJECT DEFECTIVE CYLINDER TABLE        ZDR17870
                    *************************************************** ZDR17880
                    *                                                   ZDR17890
                    CO700 DC      *-*       ENTRY POINT                 ZDR17900
                          STX   2 CO720+1   DEF CYL TBL ADDR IN BUFFER  ZDR17910
                          LDX   2 -'NDCY    MINUS NO. DEF CYLS          ZDR17920
                    CO710 LD   L2 CO994+'NDCY  FETCH A DEF CYL TABLE    ZDR17930
                          AND     CO980     REMOVE DRIVE CODE      2-11 ZDR17940
                    CO720 STO  L2 *-*       *ENTRY MOVE TO BUFFER   2-4 ZDR17950
                          MDX   2 1         INCR POINTER/COUNTER        ZDR17960
                          MDX     CO710     MOVE NEXT TABLE ENTRY       ZDR17970
                          BSC  I  CO700     EXIT                        ZDR17980
                          HDNG    COPY OPTION                           ZDR17990
                    *************************************************** ZDR18000
                    * SOURCE OR OBJECT CARTRIDGE HAS NOT BEEN           ZDR18010
                    * INITIALIZED                                       ZDR18020
                    **************************************************  ZDR18030
                    *                                                   ZDR18040
                    CO630 EQU     *                                2-11 ZDR18050
                          MDX   2 1         SKIP IF SOURCE DRIVE        ZDR18060
                          MDX     NT050     *BRANCH OTHERWISE           ZDR18070
                          BSI  L  WRTY0     PRINT -SOURCE-              ZDR18080
                          DC      /2000     PRINT FUNCTION CODE         ZDR18090
                          DC      MSG17     ADDR OF MESSAGE             ZDR18100
                          MDX     NT100     BR TO FINISH MESSAGE        ZDR18110
                    CO629 EQU     *                                2-11 ZDR18115
                    NT050 BSI  L  WRTY0     PRINT -OBJECT-              ZDR18120
                          DC      /2000     PRINT FUNCTION CODE         ZDR18130
                          DC      MSG16     ADDR OF MESSAGE             ZDR18140
                    NT100 BSI  L  WRTY0     PRINT -CARTRIDGE NOT        ZDR18150
                          DC      /2000     *INITIALIZED-               ZDR18160
                          DC      MSG18     ADDR OF MESSAGE             ZDR18170
                          MDX     CO550     BR TO EXIT FROM COPY   2-11 ZDR18180
                          HDNG    DUMP OPTION                           ZDR18190
                    *                                                   ZDR18200
                    **************************************************  ZDR18210
                    * THE FOLLOWING SECTION HANDLES DISK DUMPING        ZDR18220
                    **************************************************  ZDR18230
                    *                                                   ZDR18240
                    DUMPZ DC      *-*       ENTRY POINT                 ZDR18250
                    *                                                   ZDR18260
                    * SKIP TO PRINT CONTENTS OF DISK BUFFER IF SW006    ZDR18270
                    * IS ODD INDICATING ENTRY FROM PATCH SUBROUTINE.    ZDR18280
                    *                                                   ZDR18290
                          LD   L  SW006     PATCH SUBROUTINE SWITCH     ZDR18300
                          BSC  L  DP090,E   BR TO READ SECTOR           ZDR18310
                    *                                                   ZDR18320
                    * FETCH DESIRED SCTR ADDR, INCLUDING DRIVE CODE     ZDR18330
                    *                                                   ZDR18340
                    DP040 LDX  L1 MSSG2     PREPARE TO PRINT MESSAGE 2  ZDR18350
                    DP042 BSI  L  INSTR     FETCH SCTR ADDR             ZDR18360
                          STO  L  SECT1     SAVE SCTR ADDR              ZDR18370
                          SRA     12        RT JUSTIFY DR NO.      2-11 ZDR18390
                          S       DP920     BR IF DRIVE CODE            ZDR18400
                    DP043 LDX  L1 MSSG5     PREPARE TO PRNT MSG 5  2-11 ZDR18405
                          BSC  L  DP042,-   *IS ILLEGAL                 ZDR18410
                          A       DP920     RESTORE DR NO.         2-11 ZDR18412
                          SLA     12        LEFT JUSTIFY DR NO.    2-11 ZDR18413
                          BSI  L  PRSNT     BR TO CHK FOR DR PRESNT2-11 ZDR18414
                          LD   L  SECT1     FETCH SECTOR ADDR      2-11 ZDR18415
                          AND     DP925                                 ZDR18420
                          S       DP905     BR IF SECTOR ADDR           ZDR18430
                          BSC  L  DP043,-   *IS ILLEGAL            2-11 ZDR18440
                          STO     DP910                                 ZDR18450
                    *                                                   ZDR18500
                    * SET NO. SECTORS TO BE DUMPED TO ONE IF DUMPZ WAS  ZDR18510
                    * ENTERED FROM DISK PATCH SUBROUTINE.               ZDR18520
                    *                                                   ZDR18530
                          LD   L  SW006     DISK PATCH SUBR SWITCH      ZDR18540
                          BSC  L  DP070,+-  BR IF NOT ENTERED FR PATCH  ZDR18550
                          LDX   1 1                                     ZDR18560
                          STX   1 DP915     SET TO DUMP ONE SECTOR ONLY ZDR18570
                          MDX     DP100     BR TO SEEK HOME             ZDR18580
                    *                                                   ZDR18590
                    * FETCH NO. SECTORS TO BE DUMPED                    ZDR18600
                    *                                                   ZDR18610
                    DP070 LDX  L1 MSSG3                                 ZDR18620
                    DP080 BSI  L  INSTR     FETCH NO. SCTRS DISIRED     ZDR18630
                          STO     DP915                                 ZDR18640
                          LDX  L1 MSSG5                                 ZDR18650
                          BSC  L  DP080,+   BR IF NO.NOT GT ZERO    2-4 ZDR18660
                          A       DP910     BR IF TERMINAL SECTOR       ZDR18670
                          BSC  L  DP080,Z-  *ADDR GTE 'MSCT             ZDR18680
                    TEST  BSI  L  WRTY0     TEST TO SEE IF          2-9 ZDR18690
                          DC      /0000     *CARRIAGE RETURN OPERAT 2-9 ZDR18700
                          MDX     TEST      *COMPLETE               2-9 ZDR18710
                          MDX     DP100     BR TO SEEK HOME             ZDR18720
                    *                                                   ZDR18730
                    * SET PAGE SWITCH ODD TO AVOID SKIP TO NEW PAGE     ZDR18740
                    *                                                   ZDR18750
                    DP090 BSC  L  DP095,-   BR IF SKIP REQUIRED         ZDR18760
                          LDX   1 1                                     ZDR18770
                          STX   1 DP915     SET TO DUMP ONE SECTOR      ZDR18780
                          LD   L  SECT1     ENTRY WAS FROM ANLYZ        ZDR18790
                          MDX     DP130     BR TO DUMP BUFFER ONLY      ZDR18800
                    DP095 MDX  L  DP930,1   SET PAGE SWITCH ODD         ZDR18810
                    *                                                   ZDR18820
                    * SEEK HOME                                         ZDR18830
                    *                                                   ZDR18840
                    DP100 BSI  L  HOMEX     SEEK HOME                   ZDR18850
                    *                                                   ZDR18860
                    * SAVE DEFECTIVE CYLINDER TABLE                     ZDR18870
                    *                                                   ZDR18880
                          LDX  I2 BFRAD     ADDR IN DISK BFR OF DEF CYL ZDR18890
                          MDX   2 'DCTB+'NDCY+'SADR  *TABLE TO XR2      ZDR18900
                          STX   2 DP110+1                               ZDR18910
                          LDX   2 -'NDCY    MINUS NO. DEF CYLS TO XR2   ZDR18920
                    DP110 LD   L2 *-*                                   ZDR18930
                          STO  L2 BADCS+'DCTB+'NDCY  DEF CYL TBL        ZDR18940
                          MDX   2 1         INCR TABLE POINTER          ZDR18950
                          MDX     DP110     BR TO CONTINUE MOVE         ZDR18960
                    *                                                   ZDR18970
                    * READ A SECTOR AND SET UP SECTOR HEADER            ZDR18980
                    *                                                   ZDR18990
                    DP120 LD   L  SECT1                                 ZDR19000
                          BSI  L  READ1     READ A SECTOR               ZDR19010
                    DP130 STO  L  BUFF3+1                               ZDR19020
                          AND     DP925                                 ZDR19030
                          STO  L  BUFF3+3                               ZDR19040
                    *                                                   ZDR19050
                    * CHECK TO SEE IF ON A DEFECTIVE CYLINDER           ZDR19060
                    *                                                   ZDR19070
                          AND     DP945                                 ZDR19080
                          LDX   2 -'NDCY    MINUS NO. DEF CYLS TO XR2   ZDR19090
                    DP160 S    L2 BADCS+'DCTB+'NDCY  COMPARE W/ DEF CYL ZDR19100
                          BSC  L  DP400,+-  BR IF NOW ON DEFECTIVE CYL  ZDR19110
                          A    L2 BADCS+'DCTB+'NDCY  RESTORE SCTR ADDR  ZDR19120
                          BSC  L  DP240,C   BR IF BELOW DEF CYL ADDR    ZDR19130
                          MDX  L  BUFF3+3,-'CCNT DECR LOGICAL SCTR ADDR ZDR19140
                          MDX   2 1         SKIP AFTER DEF CYLS CHECKED ZDR19150
                          MDX     DP160     BR TO CHECK NEXT DEF CYL    ZDR19160
                          MDX     DP240     BR AROUND CONSTANTS         ZDR19170
                    *                                                   ZDR19180
                    * CONSTANTS AND WORK AREAS                          ZDR19190
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       ZDR19200
                    *                                                   ZDR19210
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR19220
                    DP900 DMES  1 'X'X'X'X'E                            ZDR19230
                    DP902 DMES    '4S'E     CONSOLE PRINTER SPACES      ZDR19240
                    DP905 DC      'MSCT     1+MAXIMUM SCTR HDDR         ZDR19250
                    DP910 DC      *-*       INITIAL SCTR ADDR W/O DR NO ZDR19260
                    DP915 DC      *-*       NO. SECTORS REQUESTED       ZDR19270
                    DP920 DC      'MXDR     MAX NO. OF DRIVES      2-11 ZDR19280
                    DP925 DC      /0FFF     MASK                        ZDR19290
                    DP930 DC      *-*       PAGE SWITCH                 ZDR19300
                    DP935 DC      'SCNT     NO. WORDS PER SECTOR        ZDR19310
                    DP940 DC      /DEFC     DEFECTIVE CYLINDER FLAG     ZDR19320
                    DP945 DC      /FFF8     MASK                        ZDR19330
                    *                                                   ZDR19340
                    * INITIALIZE TO PRINT ON FASTEST PRINTER            ZDR19350
                    *                                                   ZDR19360
                    DP240 LDD     DP902     CONSOLE PRINTER SPACES      ZDR19370
                          MDX  L  SW002,0   SKIP IF CONSOLE PRINTER     ZDR19380
                          LDD     DP900                                 ZDR19390
                          STD  L  BLANK                                 ZDR19400
                          LD   L  SW002     SET SWITCH TO USE           ZDR19410
                          STO  L  SW003     *PRINCIPAL PRINTER          ZDR19420
                          LD   L  ADDRX     POINT TO CONVERSION TABLE   ZDR19430
                          STO  L  SERCH     *FOR PRINCIPAL PRINTER      ZDR19440
                    *                                                   ZDR19450
                    * PRINT HEADER AND CONTENTS OF SECTOR               ZDR19460
                    *                                                   ZDR19470
                          LD    3 'SADR     FETCH PHYSICAL SCTR ADDR    ZDR19480
                          STO  L  BUFF3+2                               ZDR19490
                          LD      DP930                                 ZDR19500
                          BSC  L  DP320,E   BR IF PAGE SWITCH IS ODD    ZDR19510
                          LD   L  SW003     BR IF CONSOLE               ZDR19520
                          BSC  L  DP320,+-  *PRINTER BEING USED         ZDR19530
                          BSI  I  CALLP     CALL TO  PRINCIPAL PRINTER  ZDR19540
                          DC      /3100     SKIP-TO-CHANNEL-1 FUNC CODE ZDR19550
                    DP320 MDX  L  DP930,1   MAKE PAGE SWITCH ODD        ZDR19560
                          LDX  L1 BUFF3                                 ZDR19570
                          BSI  L  CNPNT     PRINT THE HEADER            ZDR19580
                          BSI  L  SPACE     SKIP A LINE                 ZDR19590
                          LDX  I1 BFRAD     ADDR OF SCTR                ZDR19600
                          MDX   1 'SADR     *ADDR TO XR1                ZDR19610
                          LD      DP935                                 ZDR19620
                          STO   3 'SADR                                 ZDR19630
                          BSI  L  CNPNT     PRINT CONTENTS OF SECTOR    ZDR19640
                          LD   L  BUFF3+2                               ZDR19650
                          STO   3 'SADR     RESTORE SECTOR ADDRESS      ZDR19660
                          LDX   2 3                                     ZDR19670
                    DP360 BSI  L  SPACE     SKIP A LINE                 ZDR19680
                          MDX   2 -1        SKIP AFTER SKIPPING 3 LINES ZDR19690
                          MDX     DP360     BR TO SKIP ANOTHER LINE     ZDR19700
                    *                                                   ZDR19710
                    * CHECK TO SEE IF DONE                              ZDR19720
                    *                                                   ZDR19730
                          MDX  L  SECT1,1   POINT TO NEXT SECTOR        ZDR19740
                          MDX  L  DP915,-1  SKIP IF ALL SCTRS DUMPED    ZDR19750
                          MDX     DP120     BR TO DUMP NEXT SECTOR      ZDR19760
                    *                                                   ZDR19770
                    * RETURN                                            ZDR19780
                    *                                                   ZDR19790
                          SRA     16        MAKE PAGE                   ZDR19800
                          STO     DP930     *SWITCH EVEN                ZDR19810
                          BSC  I  DUMPZ     RETURN                      ZDR19820
                    *                                                   ZDR19830
                    * ALLOW FOR A DEFECTIVE CYLINDER                    ZDR19840
                    *                                                   ZDR19850
                    DP400 LD      DP940                                 ZDR19860
                          STO  L  BUFF3+3   PUT A FLAG IN THE HEADER    ZDR19870
                          MDX     DP240     BR TO CHECK NEXT DEF CYL    ZDR19880
                          HDNG    DISK PATCH OPTION                     ZDR19890
                    *                                                   ZDR19900
                    *************************************************** ZDR19910
                    * THE FOLLOWING SECTION HANDLES DISK PATCHING       ZDR19920
                    *************************************************** ZDR19930
                    *                                                   ZDR19940
                    PATCH EQU     *                                2-11 ZDR19950
                    *                                                   ZDR19960
                    * BR TO DUMPZ WITH SW006 SET TO DUMP ONE SECTOR TO  ZDR19970
                    * BE PATCHED.                                       ZDR19980
                    *                                                   ZDR19990
                          LDX   1 2                                     ZDR20000
                          STX  L1 SW006     SET TO DUMP ONE SECTOR      ZDR20010
                          BSI  L  DUMPZ     BR TO DUMP                  ZDR20020
                    *                                                   ZDR20030
                    * INITIALIZATION                                    ZDR20040
                    *                                                   ZDR20050
                          BSI  L  CPOUT     PRINT ON CONSOLE PRINTER    ZDR20060
                          SLA     16                                    ZDR20070
                          STO     PD920     CLEAR STORE-WORD BUFFER     ZDR20080
                          STO     PD935     CLEAR FILL TO END FLAG      ZDR20090
                    *                                                   ZDR20100
                    * READ RELATIVE ADDR OF WORD TO PATCH FROM BIT-SW.  ZDR20110
                    * FFFF (SECTOR ADDR) TO 013F (+319) ALLOWABLE.      ZDR20120
                    *                                                   ZDR20130
                          LDX  L1 MSG19     PREPARE TO PRINT MESSAGE 19 ZDR20140
                    PD040 BSI  L  INSTR     FETCH RELATIVE SCTR WORD    ZDR20150
                          LDX  L1 MSSG5     PREPARE TO PRINT MESSAGE 5  ZDR20160
                          STO     PD900     REL SCTR WORD TO PATCH      ZDR20170
                          S       PD905     WDS/SCTR (140)              ZDR20180
                          BSC  L  PD040,-   BR IF /140 OR GREATER-ERROR ZDR20190
                          A       PD910     WDS/SCTR+1 (141)            ZDR20200
                          BSC  L  PD080,-   BR NOT LESS THAN /FFFF - OK ZDR20210
                          MDX     PD040     BR TO PRINT ERROR...RETRY   ZDR20220
                    *                                                   ZDR20230
                    * GO TO WRTY0 TO INPUT ONE CHARACTER FROM KEYBOARD  ZDR20240
                    *                                                   ZDR20250
                    PD080 MDX  L  PD935,0   SKIP NEXT IF NOT FILL SCTR  ZDR20260
                          MDX     PD240     BR TO FILL SECTOR           ZDR20270
                          BSI  L  WRTY0     BR TO GET ONE CHARACTER     ZDR20280
                          DC      /1001     READ/PRINT CONTROL PARAM    ZDR20290
                          DC      PD990     I/O AREA                    ZDR20300
                          LD      PD900     DISPLAY RELATIVE SCTR WORD  ZDR20310
                          RTE     16        *IN THE EXTENSION.          ZDR20320
                          WAIT                                          ZDR20330
                    PD120 BSI  L  WRTY0     WAIT FOR CHARACTER INPUT    ZDR20340
                          DC      0         TEST CONTROL PARAMETER      ZDR20350
                          MDX     PD120     BR TO WAIT FOR OP COMPLETE  ZDR20360
                    *                                                   ZDR20370
                    * TEST FOR SPECIAL CHARACTERS                       ZDR20380
                    *                                                   ZDR20390
                          LD      PD990+1   CHARACTER INPUT             ZDR20400
                          S       PD915     HOLLERITH NEW LINE          ZDR20410
                          BSC  L  PD240,+-  BR IF EOF                   ZDR20420
                          S       PD980     INCR POINTER CHAR CONSTANT  ZDR20430
                          BSC  L  PD280,+-  BR TO INCR REL ADDR POINTER ZDR20440
                          S       PD982     DECR POINTER CHAR CONSTANT  ZDR20450
                          BSC  L  PD320,+-  BR TO DECR REL ADDR POINTER ZDR20460
                          S       PD984     TERMINATE CHAR CONSTANT     ZDR20470
                          BSC  L  PD400,+-  BR TO DUMP SCTR AND STORE   ZDR20480
                          S       PD986     FILL AND TERMINATE CONSTANT ZDR20490
                          BSC  L  PD360,+-  BR TO FILL OUT SCTR AND END ZDR20500
                          S       PD988     REENTER POINTER CONSTANT    ZDR20510
                          BSC  L  PD040-2,+-  BR TO REENTER SCTR PTR    ZDR20520
                    *                                                   ZDR20530
                    * LOOK FOR CHARACTER IN HEXIDECIMAL (0-F) TABLE     ZDR20540
                    *                                                   ZDR20550
                          LDX   2 -'HEXA    INITIALIZE TABLE POINTER    ZDR20560
                    PD160 LD      PD990+1   CURRENT INPUT CHARACTER     ZDR20570
                          S    L2 KBHXE+1   HEX CHAR FROM KEYBOARD TBL  ZDR20580
                          BSC  L  PD200,+-  BR IF FOUND                 ZDR20590
                          MDX   2 1         INCR TABLE POINTER          ZDR20600
                          MDX     PD160     BR TO COMPARE WITH NEXT     ZDR20610
                    *                                                   ZDR20620
                    * KEYBOARD INPUT IS INVALID                         ZDR20630
                    *                                                   ZDR20640
                          BSI  L  MSOUT     BR TO PRINT ERROR...RETRY   ZDR20650
                          MDX     PD080     BR TO INPUT NEXT CHARACTER  ZDR20660
                    *                                                   ZDR20670
                    * CONSTANTS AND WORK AREA                           ZDR20680
                    *                                                   ZDR20690
                    PD900 DC      *-*       REL ADDR OF WORD TO PATCH   ZDR20700
                    PD905 DC      'SCNT     WDS/SCTR                    ZDR20710
                    PD910 DC      'SCNT+1   WDS/SCTR+1                  ZDR20720
                    PD915 DC      /4110     HOLLERITH NEW LINE CHAR     ZDR20730
                    PD920 DC      *-*       STORE-WORD BUFFER           ZDR20740
                    PD925 DC      'SCNT-1   WDS/SCTR-1                  ZDR20750
                    PD930 DC      1         ADDRESS MODIFICATION CON    ZDR20760
                    PD935 DC      *-*       FILL SECTOR SWITCH          ZDR20770
                    *                                                   ZDR20780
                    * HOLLERITH CONSTANT TABLE                          ZDR20790
                    *                                                   ZDR20800
                    PD980 DC      /20A0-/4110  GREATER THAN - NEW LINE  ZDR20810
                    PD982 DC      /8220-/20A0  LESS THAN - GREATER THAN ZDR20820
                    PD984 DC      /4220-/8220  ASTERISK - LESS THAN     ZDR20830
                    PD986 DC      /8420-/4220  PERIOD - ASTERISK        ZDR20840
                    PD988 DC      /4010-/8420  REENTER (R) - PERIOD     ZDR20850
                    *                                                   ZDR20860
                    * KEYBOARD INPUT BUFFER                             ZDR20870
                    *                                                   ZDR20880
                          BSS  E  0                                     ZDR20890
                    PD990 DC      1         WORD COUNT                  ZDR20900
                          DC      *-*       CHARACTER BUFFER            ZDR20910
                    *                                                   ZDR20920
                    * CONSOLE PRINTER PRINT BUFFER                      ZDR20930
                    *                                                   ZDR20940
                    PD992 DC      1         WORD COUNT                  ZDR20950
                          DC      /8021     COMMA-SPACE FOR CONSOLE PR  ZDR20960
                    *                                                   ZDR20970
                    * ROTATE VALID CHARACTER INTO STORE-WORD BUFFER     ZDR20980
                    *                                                   ZDR20990
                    PD200 LD   L2 TABLE+'HEXA  BITS 12-15 = HEX CHAR    ZDR21000
                          SRT     4         SAVE IN EXTENSION           ZDR21010
                          LD      PD920     STORE-WORD BUFFER           ZDR21020
                          SLT     4         SHIFT IN NEW CHARACTER      ZDR21030
                          STO     PD920                                 ZDR21040
                          MDX     PD080     BR TO INPUT NEXT CHARACTER  ZDR21050
                    *                                                   ZDR21060
                    * STORE-WORD BUFFER TO SCTR BUFFER                  ZDR21070
                    *                                                   ZDR21080
                    PD240 LD      PD900     RELATIVE SCTR POINTER       ZDR21090
                          STO     PD250+1                               ZDR21100
                          MDX  L  PD250+1,2 ADJUST FOR WD CNT SCTR ADDR ZDR21110
                          NOP               MAY SKIP                    ZDR21120
                          LD      PD920     PATCH WORD                  ZDR21130
                    PD250 STO  L3 *-*       STORE INTO SCTR BUFFER      ZDR21140
                          MDX  L  PD935,0   BR TO AVOID PRINTING COMMA- ZDR21150
                          MDX     PD280     *SPACE IF FILL FLAG IS ON.  ZDR21160
                          BSI  L  WRTY0     BR TO PRINT COMMA AND SPACE ZDR21170
                          DC      /2000     PRINT CONTROL PARAMETER     ZDR21180
                          DC      PD992     ADDR OF PRINT BUFFER        ZDR21190
                    *                                                   ZDR21200
                    * INCREMENT RELATIVE SCTR POINTER                   ZDR21210
                    *                                                   ZDR21220
                    PD280 LD      PD900                                 ZDR21230
                          S       PD925     CHECK FOR MAX VALUE (/13F)  ZDR21240
                          BSC  L  PD400,-   BR IF /13F TO TERMINATE     ZDR21250
                          A       PD905     /140 - RESTORE AND ADD 1    ZDR21260
                          STO     PD900                                 ZDR21270
                          MDX     PD080     BR TO READ NEXT CHARACTER   ZDR21280
                    *                                                   ZDR21290
                    * DECREMENT RELATIVE SCTR POINTER                   ZDR21300
                    *                                                   ZDR21310
                    PD320 LD      PD900                                 ZDR21320
                          BSC     -Z        SKIP IF AT MINIMUM VALUE    ZDR21330
                          S       PD930     DECR BY 1                   ZDR21340
                          STO     PD900                                 ZDR21350
                          MDX     PD080     BR TO READ NEXT CHARACTER   ZDR21360
                    *                                                   ZDR21370
                    * FILL OUT SECTOR WITH CONTENTS OF STORE-WORD AND   ZDR21380
                    * TERMINATE.                                        ZDR21390
                    *                                                   ZDR21400
                    PD360 MDX  L  PD935,1   SET SWITCH TO FILL OUT SCTR ZDR21410
                          MDX     PD240     BR TO FILL SCTR BUFFER      ZDR21420
                    *                                                   ZDR21430
                    * PRINT SECTOR BUFFER AND RESTORE TO DISK           ZDR21440
                    *                                                   ZDR21450
                    PD400 LDX   1 1                                     ZDR21460
                          STX  L1 SW006     SET TO PRINT TERMINAL DUMP  ZDR21470
                          MDX  L  SECT1,-1  ADJUST FOR DUMPZ INCR       ZDR21480
                          NOP               MAY SKIP                    ZDR21490
                    PD420 LD   L  SECT1     ADDR OF SCTR TO WRITE ON    ZDR21500
                          STX   3 PD440     DISK BUFFER ADDRESS         ZDR21510
                          BSI  L  DX000     BR TO WRITE SECTOR          ZDR21520
                          DC      /0200     WRITE CONTROL PARAMETER     ZDR21530
                    PD440 DC      *-*       BUFFER ADDRESS              ZDR21540
                          STX   3 PD480     DISK BUFFER ADDRESS         ZDR21550
                          BSI  L  DX000     BR TO DISK ROUTINE          ZDR21560
                          DC      /180      READ-BACK CHECK PARAMETER   ZDR21570
                    PD480 DC      *-*       BUFFER ADDRESS              ZDR21580
                    *           .                                  2-11 ZDR21590
                          MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR21600
                          MDX     PD480+1   LOOP ON DISK BUSY      2-11 ZDR21610
                          LD   L  SW001     READ-CHK SWITCH             ZDR21620
                          BSC  L  PD490,+-  BR IF NO ERROR              ZDR21630
                          SLA     16                                    ZDR21640
                          STO  L  SW001     CLEAR READ-CHK SWITCH       ZDR21650
                          MDX     PD420     BR TO WRITE AGAIN           ZDR21660
                    PD490 BSI  L  DUMPZ     BR TO DUMP SUBROUTINE       ZDR21670
                          BSC  L  CM050     RETURN FOR NEXT OPTION 2-11 ZDR21680
                          HDNG    DISK ANALYSIS OPTION                  ZDR21690
                    *                                                   ZDR21700
                    *************************************************** ZDR21710
                    * THE FOLLOWING SECTION HANDLES DISK ANALYSIS       ZDR21720
                    *************************************************** ZDR21730
                    *                                                   ZDR21740
                    ANLYZ EQU     *                                2-11 ZDR21750
                    *                                                   ZDR21760
                    * INITIALIZATION                                    ZDR21770
                    *                                                   ZDR21780
                          LDX  L1 'LSCT     SECTORS/CYLINDER CONSTANT   ZDR21790
                          STX   1 DA900     SET UP SECTOR COUNTER       ZDR21800
                    *                                                   ZDR21810
                    * GET DRIVE CODE FROM BIT SWITCHES                  ZDR21820
                    *                                                   ZDR21830
                          LDX  L1 MSSG6     SET TO PRINT MESSAGE 8  2-6 ZDR21840
                    DA040 BSI  L  INSTR     BR TO PRINT AND READ BIT SW ZDR21850
                          S       DA935     SUB MAX NO. OF DRIVES  2-11 ZDR21852
                          LDX  L1 MSSG5     POINT XR1 TO ERROR MSG 2-11 ZDR21854
                          BSC  L  DA040,-   BR IF DR NO. ILLEGAL   2-11 ZDR21856
                          A       DA935     RESTORE DR NO.         2-11 ZDR21858
                          SLA     12        LEFT JUSTIFY                ZDR21860
                          STO  L  SECT1     DRIVE CODE, SECTOR ZERO     ZDR21870
                          STO     DA930     SAVE DRIVE CODE             ZDR21880
                          BSI  L  PRSNT     BR TO CHECK DEVC ON SYS 2-3 ZDR21930
                          LD      DA930                             2-3 ZDR21940
                    *                                                   ZDR21950
                    * SEEK HOME AND READ SECTOR 0                       ZDR21960
                    *                                                   ZDR21970
                          BSI  L  HOMEX                                 ZDR21980
                    *                                                   ZDR21990
                    * SAVE DEFECTIVE CYLINDER TABLE                     ZDR22000
                    *                                                   ZDR22010
                          LDX  I2 BFRAD     ADDR IN DISK BFR OF DEF CYL ZDR22020
                          MDX   2 'DCTB+'NDCY+'SADR  *TABLE TO XR2      ZDR22030
                          STX   2 DA120+1                               ZDR22040
                          LDX   2 -'NDCY    MINUS NO. DEF CYLS          ZDR22050
                    DA120 LD   L2 *-*                                   ZDR22060
                          OR   L  SECT1     DRIVE CODE                  ZDR22070
                          STO  L2 BADCS+'DCTB+'NDCY  DEF CYL TABLE      ZDR22080
                          MDX   2 1         INCR TABLE POINTER          ZDR22090
                          MDX     DA120     BR TO CONTINUE MOVE         ZDR22100
                    *                                                   ZDR22110
                    * READ EACH CYLINDER SECTOR BY SECTOR 16 TIMES      ZDR22120
                    *                                                   ZDR22130
                    DA150 LDX   2 -16                                   ZDR22140
                          STX   2 DA940     CYLINDER READ COUNTER       ZDR22150
                    *                                                   ZDR22160
                    * CHECK FOR DEFECTIVE CYLINDER                      ZDR22170
                    *                                                   ZDR22180
                          LD   L  SECT1     SECTOR ADDRESS              ZDR22190
                          LDX  L1 BADCS+1   ADDR DEF CYL TABLE          ZDR22200
                          BSI  L  DC000     CHK FOR DEF CYLS            ZDR22210
                          STO  L  SECT1     SAVE SECTOR ADDRESS         ZDR22220
                    *                                                   ZDR22230
                    * SET UP TO READ 8 SECTORS                          ZDR22240
                    *                                                   ZDR22250
                    DA155 LDX   2 -'CCNT    SECTORS/CYLINDER            ZDR22260
                          STX   2 DA945     SECTOR READ COUNTER         ZDR22270
                          MDX  L  SECT1,7   READ SECTORS BACKWARD       ZDR22280
                    DA160 BSI     DA800     BR TO READ A SECTOR         ZDR22290
                    *                                                   ZDR22300
                    * CHECK FOR DISK DATA ERROR                         ZDR22310
                    *                                                   ZDR22320
                          LD   L  SW007     NON-ZERO IF DISK ERROR      ZDR22330
                          TRAP
                          BSI  L  DA700,Z   BR IF DATA ERROR            ZDR22340
                    *                                                   ZDR22350
                    * CHECK FOR SECTOR ADDR ERROR                       ZDR22360
                    *                                                   ZDR22370
                          LD      DA920     SECTOR ADDRESS W/O DR CODE  ZDR22380
                          EOR   3 'SADR     SECTOR ADDR FROM BUFFER     ZDR22390
                          BSI  L  DA600,Z   BR IF SECTOR ADDR ERROR     ZDR22400
                    *                                                   ZDR22410
                    * CHECK IF ALL SECTORS READ                         ZDR22420
                    *                                                   ZDR22430
                          MDX  L  DA945,1   INCR SECTOR READ COUNTER    ZDR22440
                          MDX     DA190     BR TO DECR SECTOR POINTER   ZDR22450
                    *                                                   ZDR22460
                    * CHECK TO SEE IF CYLINDER READ 16 TIMES            ZDR22470
                    *                                                   ZDR22480
                          MDX  L  DA940,1   INCR CYLINDER READ COUNTER  ZDR22490
                          MDX     DA155     BR TO READ CYLINDER AGAIN   ZDR22500
                    *                                                   ZDR22510
                    * CHECK TO SEE IF DONE                              ZDR22520
                    *                                                   ZDR22530
                          MDX  L  SECT1,8   SCTR POINTER TO NEXT CYL    ZDR22540
                          MDX  L  DA900,-8  DECR SECTORS TO READ COUNT  ZDR22550
                          MDX     DA150     BR TO READ NEXT CYLINDER    ZDR22560
                    *                                                   ZDR22570
                    * RETURN                                            ZDR22580
                    *                                                   ZDR22590
                          BSC  L  CM050     RETURN FOR NEXT OPTION 2-11 ZDR22600
                    *                                                   ZDR22610
                    * DECREMENT SECTOR POINTER                          ZDR22620
                    *                                                   ZDR22630
                    DA190 MDX  L  SECT1,-1  DECR TO READ SCTRS BACKWARD ZDR22640
                          NOP               MAY SKIP                    ZDR22650
                          MDX     DA160     BR TO READ NEXT SECTOR      ZDR22660
                    *                                                   ZDR22670
                    * CONSTANTS AND WORK AREAS                          ZDR22680
                    *                                                   ZDR22690
                    DA900 DC      *-*       SECTOR READ COUNTER         ZDR22700
                    DA905 DC      /0FFF     SECTOR ADDR MASK            ZDR22710
                    DA910 DC      /8001     DUMP SWITCH                 ZDR22720
                    DA920 DC      *-*       PHYSICAL SCTR ADDRESS       ZDR22730
                    DA930 DC      *-*       DRIVE CODE                  ZDR22740
                    DA935 DC      'MXDR     MAX NO. OF DRIVES      2-11 ZDR22750
                    DA940 DC      *-*       CYLINDER READ COUNTER       ZDR22760
                    DA945 DC      *-*       SECTOR READ COUNTER         ZDR22770
                          HDNG    DISK ANALYSIS OPTION                  ZDR22780
                    *                                                   ZDR22790
                    *************************************************** ZDR22800
                    * SECTOR ADDRESS ERROR HANDLING SUBROUTINE          ZDR22810
                    *************************************************** ZDR22820
                    *                                                   ZDR22830
                    DA600 DC      *-*       ENTRY POINT                 ZDR22840
                    *                                                   ZDR22850
                    * PRINT MESSAGE- ADDRESS ERROR ON SECTOR ....       ZDR22860
                    *                                                   ZDR22870
                          BSI  L  CPOUT     BR TO INITIALIZE PRINT      ZDR22880
                          LDX  L1 MSG20     ADDRESS ERROR ON SECTOR MSG ZDR22890
                          BSI  L  MSOUT     BR TO PRINT MESSAGE         ZDR22900
                          LD      DA920     PHYSICAL SCTR ADDR          ZDR22910
                          STO  L  INFOR     *TO PRINT.                  ZDR22920
                          LDX  L1 INFOR-1                               ZDR22930
                          BSI  L  CNPNT     PRINT SECTOR ADDRESS        ZDR22940
                    *                                                   ZDR22950
                    * PRINT MESSAGE- ERRONEOUS SCTR ADDR WAS ....       ZDR22960
                    *                                                   ZDR22970
                          LDX  L1 MSG21     ERRONEOUS SCTR ADDR WAS MSG ZDR22980
                          BSI  L  MSOUT     BR TO PRINT                 ZDR22990
                          LD    3 'SADR     ERRONEOUS SECTOR ADDR       ZDR23000
                          STO  L  INFOR     STORE TO PRINT              ZDR23010
                          LDX  L1 INFOR-1                               ZDR23020
                          BSI  L  CNPNT     PRINT BAD ADDRESS           ZDR23030
                    *                                                   ZDR23040
                    * WRITE CORRECT ADDR ON SECTOR                      ZDR23050
                    *                                                   ZDR23060
                          LD   L  SECT1     PHYSICAL SECTOR ADDRESS     ZDR23070
                          BSI  L  WRIT1     WRITE CORRECT ADDRESS       ZDR23080
                          BSC  I  DA600     EXIT                        ZDR23090
                          HDNG    DISK ANALYSIS OPTION                  ZDR23100
                    *                                                   ZDR23110
                    *************************************************** ZDR23120
                    * DISK DATA ERROR HANDLING SUBROUTINE               ZDR23130
                    *************************************************** ZDR23140
                    *                                                   ZDR23150
                    DA700 DC      *-*       ENTRY POINT                 ZDR23160
                    *                                                   ZDR23170
                    * PRINT MESSAGE- DISK READ ERROR ON SECTOR ....     ZDR23180
                    *                                                   ZDR23190
                          BSI  L  CPOUT     BR TO INITIALIZE PRINT      ZDR23200
                          LDX  L1 MSG22     DISK DATA ERROR MESSAGE     ZDR23210
                          BSI  L  MSOUT     BR TO PRINT MESSAGE         ZDR23220
                          LD      DA920     PHYSICAL SECTOR ADDRESS     ZDR23230
                          STO  L  INFOR     *TO PRINT.                  ZDR23240
                          LDX  L1 INFOR-1                               ZDR23250
                          BSI  L  CNPNT     PRINT SECTOR ADDRESS        ZDR23260
                    *                                                   ZDR23270
                    * PRINT MESSAGE- TURN ON BIT SW 0 TO DUMP           ZDR23280
                    *                                                   ZDR23290
                          LDX  L1 MSG23     TURN ON BIT SW 0 TO DUMP    ZDR23300
                          BSI  L  INSTR     BR TO PRINT AND READ BIT SW ZDR23310
                          LD   L  INFOR                                 ZDR23320
                          BSC  I  DA700,-   BR IF NO DUMP               ZDR23330
                    *                                                   ZDR23340
                    * DUMP SECTOR IN ERROR TO PRINTER                   ZDR23350
                    *                                                   ZDR23360
                          LD      DA910     DUMP SWITCH                 ZDR23370
                          STO  L  SW006                                 ZDR23380
                          BSI  L  DUMPZ     DUMP SECTOR                 ZDR23390
                          MDX  L  SECT1,-1  ADJUST FOR DUMPZ INCREMENT  ZDR23400
                          NOP               MAY SKIP                    ZDR23410
                          SLA     16        CLEAR ACCUMULATOR      2-10 ZDR23420
                          STO  L  SW006     ZERO SWITCH            2-10 ZDR23430
                          BSC  I  DA700     EXIT                        ZDR23440
                          HDNG    DISK ANALYSIS OPTION                  ZDR23450
                    *                                                   ZDR23460
                    *************************************************** ZDR23470
                    * READ A SECTOR SUBROUTINE                          ZDR23480
                    *************************************************** ZDR23490
                    *                                                   ZDR23500
                    DA800 DC      *-*       ENTRY POINT                 ZDR23510
                          LDX   1 2         SET SW005 TO ALLOW DISK RTN ZDR23520
                          STX  L1 SW005     *TO SET SW007 IF DISK ERROR ZDR23530
                          SLA     16                                    ZDR23540
                          STO  L  SW007     CLEAR DATA ERROR SWITCH     ZDR23550
                    *                                                   ZDR23560
                    * READ NEXT SECTOR                                  ZDR23570
                    *                                                   ZDR23580
                          LD   L  SECT1     SECTOR ADDRESS              ZDR23590
                          BSI  L  READ1     READ A SECTOR               ZDR23600
                          AND     DA905     MASK OUT DRIVE CODE         ZDR23610
                          STO     DA920     SAVE PHYSICAL SCTR ADDRESS  ZDR23620
                          SLA     16        RESET SW005 TO REVERT TO    ZDR23630
                          STO  L  SW005     *NORMAL DISK ERROR HANDLING ZDR23640
                          BSC  I  DA800     RETURN                      ZDR23650
                          HDNG    COMPARE OPTION                        ZDR23660
                    *                                                   ZDR23670
                    *************************************************** ZDR23680
                    * THE FOLLOWING SECTION HANDLES DISK COMPARE        ZDR23690
                    *************************************************** ZDR23700
                    *                                                   ZDR23710
                    COMPR EQU     *                                2-11 ZDR23720
                    *                                                   ZDR23730
                    * INITIALIZATION                                    ZDR23740
                    *                                                   ZDR23750
                          STX  L0 SW008     COMPARE OPTION SWITCH ON    ZDR23760
                          LD      CR930     1 SECTOR WORD COUNT         ZDR23770
                          STO  L  CR990     WD COUNT TO SOURCE BUFFER   ZDR23780
                          STO  L  CR992     WD COUNT TO OBJECT BUFFER   ZDR23790
                    *                                                   ZDR23800
                    * FETCH SOURCE AND OBJECT DRIVE NOS., CHK VALIDITY  ZDR23810
                    *                                                   ZDR23820
                          BSI  L  GETDR     FETCH SOURCE AND OBJECT DRS ZDR23830
                          STD     CR910     ADDR OF SCTR 'IDAD          ZDR23840
                    *                                                   ZDR23850
                    * SEEK HOME AND READ SECTOR 'IDAD                   ZDR23860
                    *                                                   ZDR23870
                          LDX  L3 CR990     SOURCE BUFFER ADDRESS       ZDR23880
                          LD      CR910     SCTR 'IDAD ADDRESS          ZDR23890
                          STO  L  SECT1                                 ZDR23900
                          BSI  L  HOMEX     SEEK HOME AND READ          ZDR23910
                          LDX  L3 CR992     OBJECT BUFFER ADDRESS       ZDR23920
                          LD      CR915     SCTR 'IDAD ADDRESS          ZDR23930
                          STO  L  SECT1                                 ZDR23940
                          BSI  L  HOMEX     SEEK HOME AND READ          ZDR23950
                    *                                                   ZDR23960
                    * SAVE DEFECTIVE CYLINDER TABLES                    ZDR23970
                    *                                                   ZDR23980
                          LDX   1 -'NDCY    INITIALIZE POINTER          ZDR23990
                    CR060 LD   L1 CR990+2+'NDCY  MOVE SOURCE DEFECTIVE  ZDR24000
                          OR      CR910     *CYLINDER TABLE.            ZDR24010
                          STO  L1 CR980+'NDCY                           ZDR24020
                          LD   L1 CR992+2+'NDCY  MOVE OBJECT DEFECTIVE  ZDR24030
                          OR      CR915     *CYLINDER TABLE.            ZDR24040
                          STO  L1 CR985+'NDCY                           ZDR24050
                          MDX   1 1         INCR POINTER TO NEXT ENTRY  ZDR24060
                          MDX     CR060     BR TO CONTINUE MOVE         ZDR24070
                    *                                                   ZDR24080
                    * FIRST 7 WDS WILL NOT COMPARE - MAKE THEM EQUAL    ZDR24090
                    *                                                   ZDR24100
                          LDX   1 -7        INITIALIZE POINTER          ZDR24110
                    CR100 LD   L1 CR990+2+7  MAKE FIRST 7 WORDS OF BOTH ZDR24120
                          STO  L1 CR992+2+7  *BUFFERS EQUAL FOR COMPARE ZDR24130
                          MDX   1 1         INCR POINTER                ZDR24140
                          MDX     CR100                                 ZDR24150
                    *                                                   ZDR24160
                    * COMPARE SECTOR 'IDAD                              ZDR24170
                    *                                                   ZDR24180
                          BSI     CR800     BR TO COMPARE               ZDR24190
                    *                                                   ZDR24200
                    * READ AND COMPARE SECTOR 'DCOM                     ZDR24210
                    *                                                   ZDR24220
                          MDX  L  CR910,1   INCR SOURCE SCTR ADDR       ZDR24230
                          MDX  L  CR915,1   INCR OBJECT SCTR ADDR       ZDR24240
                          BSI     CR700     READ BOTH 'DCOM SECTORS     ZDR24250
                    *                                                   ZDR24260
                    * #CIDN TABLES WILL NOT COMPARE - MAKE EQUAL        ZDR24270
                    *                                                   ZDR24280
                          LDX   1 -5        DR TBL LENGTH IN DCOM  2-11 ZDR24290
                    CR140 LD   L1 CR990+2+#CIDN+5   MOVE SOURCE    2-11 ZDR24300
                          STO  L1 CR992+2+#CIDN+5   *TO OBJ #CIDN  2-11 ZDR24310
                          MDX   1 1         INCR POINTER                ZDR24320
                          MDX     CR140     BR TO MOVE NEXT TABLE ENTRY ZDR24330
                    *                                                   ZDR24340
                    * COMPARE SECTOR 'DCOM                              ZDR24350
                    *                                                   ZDR24360
                          BSI     CR800     BR TO COMPARE               ZDR24370
                    *                                                   ZDR24380
                    * READ AND COMPARE SECTOR 'RIAD                     ZDR24390
                    *                                                   ZDR24400
                          MDX  L  CR910,1   INCR SOURCE SCTR ADDR       ZDR24410
                          MDX  L  CR915,1   INCR OBJECT SCTR ADDR       ZDR24420
                          BSI     CR700     READ BOTH SECTORS           ZDR24430
                    *                                                   ZDR24440
                    * DEFECTIVE CYL TABLES WILL NOT COMPARE -MAKE EQUAL ZDR24450
                    *                                                   ZDR24460
                          LDX   1 -'NDCY*5  MOVE POINTER           2-11 ZDR24470
                    CR180 LD   L1 CR990+2+$DCYL+'NDCY*5-$CH12      2-11 ZDR24480
                          STO  L1 CR992+2+$DCYL+'NDCY*5-$CH12      2-11 ZDR24490
                          MDX   1 1         INCR POINTER                ZDR24500
                          MDX     CR180                                 ZDR24510
                    *                                                   ZDR24520
                    * COMPARE SECTOR 'RIAD                              ZDR24530
                    *                                                   ZDR24540
                          BSI     CR800                                 ZDR24550
                    *                                                   ZDR24560
                    * COMPARE REST OF SECTORS                           ZDR24570
                    *                                                   ZDR24580
                          LDX  L2 'MSCT-1-'NDCY*'CCNT-'RIAD  SAVE NO.   ZDR24590
                          STX   2 CR905     *SECTORS LEFT TO COPY.      ZDR24600
                    CR220 MDX  L  CR910,1   INCR SOURCE SCTR ADDR       ZDR24610
                          MDX  L  CR915,1   INCR OBJECT SCTR ADDR       ZDR24620
                          BSI     CR700     READ NEXT SECTORS           ZDR24630
                          BSI     CR800     COMPARE                     ZDR24640
                          MDX  L  CR905,-1  DECR SCTRS TO COMPARE COUNT ZDR24650
                          MDX     CR220     BR TO CONTINUE COMPARE      ZDR24660
                          BSC  L  CM050     RETURN FOR NEXT OPTION 2-11 ZDR24670
                    *                                                   ZDR24680
                    * CONSTANTS AND WORK AREAS                          ZDR24690
                    *                                                   ZDR24700
                    CR900 DC      *-*       COMPARE ERROR FLAG          ZDR24710
                    CR905 DC      *-*       NO. SCTRS LEFT TO COPY      ZDR24720
                          BSS  E  0         MAKE ADDRESS EVEN           ZDR24730
                    CR910 DC      *-*       ADDR OF NEXT SCTR  (SOURCE) ZDR24740
                    CR915 DC      *-*       ADDR OF NEXT SCTR  (OBJECT) ZDR24750
                    CR930 DC      'SCNT+1   NO. OF WORDS PER SECTOR+1   ZDR24760
                    CR980 BSS     3         SOURCE DEF CYL TABLE        ZDR24770
                    CR985 BSS     3         OBJECT DEF CYL TABLE        ZDR24780
                    *CR990 EQU     PRNT1    SOURCE SECTOR BUFFER        ZDR24790
                    *CR992 EQU     PRNT3    OBJECT SECTOR BUFFER        ZDR24800
                    *                                                   ZDR24810
                    * PRINT SECTOR ADDRESSES BUFFER                     ZDR24820
                    *                                                   ZDR24830
                    CR994 DC      2         WORD COUNT                  ZDR24840
                          BSS     2         RESERVE TWO WORDS           ZDR24850
                          HDNG    COMPARE OPTION                        ZDR24860
                    *                                                   ZDR24870
                    *************************************************** ZDR24880
                    * READ NEXT TWO SECTORS FOR COMPARE                 ZDR24890
                    *************************************************** ZDR24900
                    *                                                   ZDR24910
                    CR700 DC      *-*       ENTRY POINT                 ZDR24920
                    *                                                   ZDR24930
                    * READ SOURCE DRIVE                                 ZDR24940
                    *                                                   ZDR24950
                          LDX  L3 CR990     SOURCE BUFFER ADDRESS       ZDR24960
                          LD      CR910     SECTOR ADDRESS              ZDR24970
                          LDX  L1 CR980     DEF CYL TABLE ADDR (SOURCE) ZDR24980
                          BSI  L  DC000     CHECK FOR DEFECTIVE CYL     ZDR24990
                          STO     CR910                                 ZDR25000
                          BSI  L  READ1     BR TO READ                  ZDR25010
                    *                                                   ZDR25020
                    * READ OBJECT DRIVE                                 ZDR25030
                    *                                                   ZDR25040
                          LDX  L3 CR992     OBJECT BUFFER ADDRESS       ZDR25050
                          LD      CR915     SECTOR ADDRESS              ZDR25060
                          LDX  L1 CR985     DEF CYL TABLE ADDR (OBJECT) ZDR25070
                          BSI  L  DC000     CHECK FOR DEFECTIVE CYL     ZDR25080
                          STO     CR915                                 ZDR25090
                          BSI  L  READ1     BR TO READ                  ZDR25100
                          BSC  I  CR700     RETURN                      ZDR25110
                          HDNG    COMPARE OPTION                        ZDR25120
                    *                                                   ZDR25130
                    *************************************************** ZDR25140
                    * COMPARE A SECTOR SUBROUTINE                       ZDR25150
                    *************************************************** ZDR25160
                    *                                                   ZDR25170
                    CR800 DC      *-*       ENTRY POINT                 ZDR25180
                          SLA     16                                    ZDR25190
                          STO     CR900     CLEAR ERROR FLAG            ZDR25200
                          LDX  L1 -'SCNT    NO. OF WDS PER SECTOR       ZDR25210
                    CR820 LDD  L1 CR990+2+'SCNT  SOURCE SECTOR WORDS    ZDR25220
                          SD   L1 CR992+2+'SCNT  OBJECT SECTOR WORDS    ZDR25230
                          BSC     +-        SKIP IF NOT SAME            ZDR25240
                          RTE     16        CHECK SECOND WORDS          ZDR25250
                          BSC     Z         SKIP IF COMPARE OK          ZDR25260
                          STO     CR900     SET ERROR FLAG ON           ZDR25270
                          MDX   1 1         INCR BUFFER POINTER         ZDR25280
                          MDX     CR820     BR TO CONTINUE COMPARE      ZDR25290
                    *                                                   ZDR25300
                    * PRINT MESSAGE IF ERROR FLAGGED                    ZDR25310
                    *                                                   ZDR25320
                          LD      CR900     ERROR FLAG                  ZDR25330
                          BSC  L  CR840,+-  EXIT IF NO ERROR            ZDR25340
                          BSI  L  CPOUT     INITIALIZE TO PRINT         ZDR25350
                          LDX  L1 MSG24     DISK DATA ERROR MESSAGE     ZDR25360
                          BSI  L  MSOUT     BR TO PRINT MESSAGE         ZDR25370
                          LD      CR910     SOURCE SECTOR ADDRESS       ZDR25380
                          STO     CR994+1   PRINT BUFFER                ZDR25390
                          LD      CR915     OBJECT SECTOR ADDRESS       ZDR25400
                          STO     CR994+2   PRINT BUFFER                ZDR25410
                          LDX  L1 CR994                                 ZDR25420
                          BSI  L  CNPNT     PRINT SECTOR ADDRESSES      ZDR25430
                    *                                                   ZDR25440
                    * RETURN                                            ZDR25450
                    *                                                   ZDR25460
                    CR840 BSC  I  CR800     EXIT                        ZDR25470
                          HDNG    DISK I/O SUBROUTINE                   ZDR25480
                    *************************************************** ZDR25490
                    *STATUS-VERSION 2, MODIFICATION 2                 * ZDR25500
                    *                                                 * ZDR25510
                    *FUNCTION/OPERATION-                              * ZDR25520
                    *   THIS SUBROUTINE PERFORMS ALL DISK OPERATIONS  * ZDR25530
                    *   FOR ALL PORTIONS OF DCIP. IT PERFORMS THE     * ZDR25540
                    *   FOLLOWING FUNCTIONS                           * ZDR25550
                    *      * TEST                                     * ZDR25560
                    *      * READ CHECK                               * ZDR25570
                    *      * READ (WITH AUTOMATIC SEEK)               * ZDR25580
                    *      * WRITE (WITH AUTOMATIC SEEK)              * ZDR25590
                    *      * SEEK                                     * ZDR25600
                    *      * SEEK HOME                                * ZDR25610
                    *                                                 * ZDR25620
                    *ENTRY POINTS-                                    * ZDR25630
                    *   * DX000 (CALL)                                * ZDR25640
                    *   * DX030 (INTERRUPT)                           * ZDR25650
                    *                                                 * ZDR25660
                    *INPUT-                                           * ZDR25670
                    *   * WORD COUNT IN 1ST WD OF I/O AREA            * ZDR25680
                    *   * SCTR ADDR/DRIVE CODE IN 2ND WD OF I/O AREA  * ZDR25690
                    *                                                 * ZDR25700
                    *OUTPUT-FROM I/O BFR OR TO I/O BFR                * ZDR25710
                    *                                                 * ZDR25720
                    *EXTERNAL SUBROUTINES-N/A                         * ZDR25730
                    *                                                 * ZDR25740
                    *EXITS-                                           * ZDR25750
                    *   * NORMAL-DX390                                * ZDR25760
                    *   * INTERRUPT-DX130                             * ZDR25770
                    *   * ERROR-DX130                                 * ZDR25780
                    *                                                 * ZDR25790
                    *TABLES/WORK AREAS-N/A                            * ZDR25800
                    *                                                 * ZDR25810
                    *ATTRIBUTES-SERIALLY REUSABLE                     * ZDR25820
                    *                                                 * ZDR25830
                    *NOTES-                                           * ZDR25840
                    *   * THE DRIVE CODE IN THE I/O AREA IS LOST.     * ZDR25850
                    *   * ERRORS DETECTED DURING INITIALIZING OF A    * ZDR25860
                    *     CARTRIDGE AND DISK ANALYSIS ARE NOT         * ZDR25870
                    *     AUTOMATICALLY RETRIED AS ARE OTHER ERRORS.  * ZDR25880
                    *   * IGNORING AN ERROR AFTER 'TCNT RETRIES IS    * ZDR25890
                    *     AT OPTION OF USER.                          * ZDR25900
                    *   * I/O BUFFER MUST START ON AN EVEN BOUNDARY.  * ZDR25910
                    *************************************************** ZDR25920
                          HDNG    DISK I/O SUBROUTINE                   ZDR25930
                    *************************************************** ZDR25940
                    * DISK I/O SUBROUTINE                             * ZDR25950
                    *************************************************** ZDR25960
                    *                                                   ZDR25970
                    * CALL ENTRY POINT                                  ZDR25980
                    *                                                   ZDR25990
                    DX000 DC      *-*       ENTRY POINT                 ZDR26000
                          STD  L  DX980     SAVE ACC & EXT         2-10 ZDR26010
                          BSC  L  DX240     BR TO CALL PROCESSING       ZDR26020
                    *                                                   ZDR26030
                    * INTERRUPT ENTRY POINT                             ZDR26040
                    *                                                   ZDR26050
                    DX030 DC      *-*       INTERRUPT ENTRY POINT       ZDR26060
                    *                                                   ZDR26070
                    * COMPUTE TWICE THE PHYSICAL DRIVE CODE             ZDR26080
                    *                                                   ZDR26090
                          SRA     16        INITIALIZE PHYSICAL DRIVE   ZDR26100
                          STO     DX050+1   *CODE ACCUMULATOR TO ZERO   ZDR26110
                          XIO  L  DX994     SENSE LVL 4 ILSW       2-10 ZDR26120
                    DX040 SLA     1                                     ZDR26140
                          BSC  L  DX050,+-  BR IF DR CODE ACCUMULATED   ZDR26150
                          MDX  L  DX050+1,2 ACCUMULATE 2*DRIVE CODE     ZDR26160
                          MDX     DX040     BR TO CHECK FOR ZERO        ZDR26170
                    DX050 LDX  L1 *-*       TWICE DRIVE CODE TO XR1     ZDR26180
                          XIO  L1 DX913-1   SENSE DISK DSW/RESET   2-11 ZDR26190
                          STO  L  $DDSW     SAVE THE DSW                ZDR26200
                          BSC  L  DX150,-   BR IF NO DISK ERROR         ZDR26210
                          LD   L1 DX960+1   CHECK FOR READ BEFORE  2-10 ZDR26220
                          SLA     6         *SEEK                  2-10 ZDR26230
                          SRA     14                               2-10 ZDR26240
                          BSC  L  DX150,+-  BR TO CONTINUE IF RD/SK2-10 ZDR26250
                    *                                                   ZDR26260
                    * PROCESS DISK ERRORS (2ND WD IOCC IN EXT)          ZDR26270
                    *                                                   ZDR26280
                    DX055 LD   L  SW005     BR IF INITIALIZING     2-10 ZDR26290
                          BSC  L  DX120,E   *A CARTRIDGE           2-10 ZDR26300
                          BSC  L  DX080,Z   BR IF DISK ANALYSIS         ZDR26310
                    *                                                   ZDR26320
                    * RETRY OPERATION UP TO 16 TIMES                    ZDR26330
                    *                                                   ZDR26340
                          BOSC    +-Z       TURN OFF INTERRUPT          ZDR26350
                          NOP               MAY SKIP                    ZDR26360
                          MDX  L  DX970,-1  DECREMENT RETRY COUNTER2-11 ZDR26370
                    *                       *AND SKIP IF 16 RETRIES2-11 ZDR26380
                    *                       *HAVE BEEN MADE        2-11 ZDR26390
                          MDX     DX065     OTHERWISE, BR TO RETRY 2-11 ZDR26400
                          BSI  L  WRTY0     PRINT DISK ERROR MESSAGE    ZDR26460
                          DC      /2000                                 ZDR26470
                          DC      MSG12                                 ZDR26480
                    DX060 BSI  L  WRTY0     WAIT FOR OPERATION COMPLETE ZDR26490
                          DC      /0000                                 ZDR26500
                          MDX     DX060     BR TO TEST BUSY AGAIN       ZDR26510
                          LD   L  SECT1     FETCH CURRENT SCTR ADDR2-11 ZDR26511
                          RTE     11        LEFT JUSTIFY IN EXR    2-11 ZDR26512
                          LD      DX050+1   LOAD 2*DR CODE         2-11 ZDR26513
                          RTE     5         EXT = DR CD & SCTR ADDR2-11 ZDR26514
                          LD      DX998     LD /5002, AND CONVRT   2-11 ZDR26515
                          A       DX915     *TO /5003 ERROR WAIT   2-11 ZDR26516
                          WAIT              WAIT FOR OPERATOR ACTION    ZDR26520
                          XIO     DX992     READ DATA SWITCHES          ZDR26530
                          LD   L  INFOR     FETCH READING               ZDR26540
                          BSC  L  DX120,-   BR TO IGNORE ERROR     2-10 ZDR26550
                          LD      DX907     RESET FOR 16 MORE ATTEMPTS  ZDR26560
                          STO     DX970                            2-10 ZDR26570
                    DX065 LD   L1 DX960+1   FETCH 2ND WD OF IOCC        ZDR26580
                          AND     DX935     'AND' WITH READ CHK FUNC CDEZDR26590
                          EOR     DX935     COMPARE WITH READ CHK CODE  ZDR26600
                          BSC  L  DX090,Z   BR UNLESS READ CHECK        ZDR26610
                    *                                                   ZDR26620
                    * RETURN AFTER A READ CHECK ERROR                   ZDR26630
                    *                                                   ZDR26640
                          STO     DX970     CLEAR BURY INDR        2-10 ZDR26650
                          MDX  L  SECT1,-1                              ZDR26660
                          LD      DX915                                 ZDR26670
                          STO  L  SW001     SET READ CHECK ERROR SW     ZDR26680
                          MDX     DX130     RETURN TO CALLER            ZDR26690
                    *                                                   ZDR26700
                    * OUT TO TAG A DEFECTIVE CYLINDER                   ZDR26710
                    *                                                   ZDR26720
                    *                                                   ZDR26730
                    * SET ERROR FLAG FOR DISK ANALYSIS                  ZDR26740
                    *                                                   ZDR26750
                    DX080 STX  L0 SW007                                 ZDR26760
                          MDX     DX120     BR TO EXIT             2-10 ZDR26770
                    *                                                   ZDR26780
                    * PROCESS ALL BUT READ CHECK ERRORS                 ZDR26790
                    *                                                   ZDR26800
                    DX090 EQU     *                                2-11 ZDR26810
                          BSI  L  DX600     OUT TO RETRY THE OPERATION  ZDR26820
                          XIO  L1 DX960     RETRY OPERATION        2-10 ZDR26830
                          MDX     DX130     BR TO RETURN           2-11 ZDR26850
                    DX120 SRA     16        CLEAR BUSY INDR        2-10 ZDR26860
                          STO     DX970                            2-10 ZDR26870
                    DX130 BSC  I  DX030     RETURN TO INTERRUPT POINT   ZDR26880
                    *                                                   ZDR26890
                    * CONSTANTS AND WORK AREAS                          ZDR26900
                    *                                                   ZDR26910
                    DX901 DC      /001F     MASK FOR TWICE DR NO.  2-11 ZDR26920
                    DX900 BSS  E  2         SEEK IOCC                   ZDR26930
                    DX906 DC      *-*       WASTEBASKET                 ZDR26940
                    DX907 DC      'TCNT     RETRY COUNT                 ZDR26950
                    DX902 DC      *-*       READ BEFORE SEEK INDR  2-10 ZDR26960
                          DC      *-*       READ BEFORE SEEK IOCC+12-10 ZDR26970
                    DX911 DC      DX912     ADDR OF I/O AREA       2-10 ZDR26980
                    DX912 DC      /0001     WD CNT FOR READ CHECK  2-10 ZDR26990
                    DX910 DC      *-*       ARM POSITION,DR  0     2-11 ZDR27000
                    DX913 DC      'I515     SENSE W/RESET IOCC DR0 2-11 ZDR27001
                          DC      *-*       ARM POSITION,DR  1     2-11 ZDR27002
                          DC      'I516     SENSE W/RESET IOCC DR1 2-11 ZDR27003
                          DC      *-*       ARM POSITION,DR  2     2-11 ZDR27004
                          DC      'I517     SENSE W/RESET IOCC DR2 2-11 ZDR27005
                          DC      *-*       ARM POSITION,DR  3     2-11 ZDR27006
                          DC      'I518     SENSE W/RESET IOCC DR3 2-11 ZDR27007
                          DC      *-*       ARM POSITION,DR  4     2-11 ZDR27008
                          DC      'I519     SENSE W/RESET IOCC DR4 2-11 ZDR27009
                          DC      *-*       ARM POSITION,DR  5     2-11 ZDR27010
                          DC      'I520     SENSE W/RESET IOCC DR5 2-11 ZDR27011
                          DC      *-*       ARM POSITION,DR  6     2-11 ZDR27012
                          DC      'I521     SENSE W/RESET IOCC DR6 2-11 ZDR27013
                          DC      *-*       ARM POSITION,DR  7     2-11 ZDR27014
                          DC      'I522     SENSE W/RESET IOCC DR7 2-11 ZDR27015
                          DC      *-*       ARM POSITION,DR  8     2-11 ZDR27016
                          DC      'I523     SENSE W/RESET IOCC DR8 2-11 ZDR27017
                          DC      *-*       ARM POSITION,DR  9     2-11 ZDR27018
                          DC      'I524     SENSE W/RESET IOCC DR9 2-11 ZDR27019
                          DC      *-*       ARM POSITION,DR 10     2-11 ZDR27020
                          DC      'I525     SENSE W/RESET IOCC DR102-11 ZDR27021
                    DX915 DC      1         GENERAL PURPOSE CONST  2-11 ZDR27022
                    DX925 DC      *-*       SCTR ADDR FROM USER BUFFER  ZDR27030
                    DX935 DC      /0180     READ CHECK FUNCTION CODE    ZDR27050
                    DX945 DC      -1        MASK FOR COMPLEMENTING      ZDR27070
                    DX955 DC      'D501     DISK NOT-READY ERROR CODE   ZDR27090
                    DX960 BSS  E  'MXDR*2   WORK AREA FOR IOCCS         ZDR27100
                    DX970 DC      *-*       BUSY INDICATOR         2-10 ZDR27110
                    DX996 DC      *-*       CYLINDER ADDR          2-10 ZDR27140
                    DX997 DC      /0300     SEEK FUNCTION CODE     2-10 ZDR27170
                    DX998 DC      /5002     WR SEL/PWR UNS ER CODE 2-10 ZDR27200
                    DX999 DC      /0100     USED TO SET RD CHK INDR2-10 ZDR27230
                    DX980 BSS  E  2         STORAGE FOR ACC AND EXT     ZDR27250
                    DX990 BSS  E  2         ORIGINAL WD CNT, SCTR ADDR  ZDR27260
                    DX992 DC      INFOR     IOCC FOR READING THE        ZDR27270
                          DC      'I000     *CONSOLE ENTRY SWITCHES     ZDR27280
                    DX994 DC      'I006     SENSE ILSW IOCC             ZDR27290
                    DX995 DC      /0301     MASK FOR BITS 6,7,15        ZDR27300
                    *                                                   ZDR27310
                    * DETERMINE THE TYPE OF OPERATION PERFORMED, I.E.,  ZDR27320
                    * REQUESTED SEEK, AUTOMATIC SEEK, OR READ/WRITE/CHK ZDR27330
                    *                                                   ZDR27340
                    DX150 LD   L1 DX960+1   FETCH 2ND WD OF CURR IOCC   ZDR27350
                          AND     DX997     'AND' WITH SEEK FUNC CODE   ZDR27360
                          BSC  L  DX120,Z   BR IF REQUESTED SEEK   2-10 ZDR27370
                    *                                                   ZDR27390
                    * CONTINUE SEEKING UNTIL ARM IS IN HOME POSITION    ZDR27400
                    *                                                   ZDR27410
                    DX210 LD   L  $DDSW     FETCH THE DSW               ZDR27420
                          SLA     4                                     ZDR27430
                          BSC  L  DX120,Z+  BR IF ARM HOME         2-10 ZDR27440
                          LD      DX902+1   SET READ BEFORE SEEK   2-11 ZDR27450
                          EOR     DX915     *TO INDICATE IF READ   2-11 ZDR27460
                          STO     DX902+1   *OR SEEK OP REQUIRED   2-11 ZDR27470
                          BOSC L  DX535     BR TO SEEK             2-10 ZDR27490
                    *                                                   ZDR27500
                    * CALL PROCESSING                                   ZDR27510
                    *                                                   ZDR27520
                    DX240 STX   1 DX380+1   SAVE XR1                    ZDR27530
                          STX   2 DX390+1   SAVE XR2                    ZDR27540
                          LDX  I2 DX000     ADDR CALL+1 TO XR2          ZDR27550
                          RTE     16        SCTR ADDR TO EXTENSION      ZDR27560
                          LD   I2 'IOAR     ORIGINAL WORD COUNT         ZDR27570
                          STD     DX990     SAVE ORIGINAL WD CNT, SCTR  ZDR27580
                          SLT     5         TWICE DR NO. TO ACC    2-11 ZDR27590
                          AND     DX901     SAVE ONLY TWICE DR NO. 2-11 ZDR27610
                          STO     DX270+1                               ZDR27620
                          SLA     5         CLEAR DR CODE FROM SCTR ADR ZDR27630
                          SRT     5                                     ZDR27640
                    DX270 LDX  L1 *-*                                   ZDR27650
                    DX280 LD      DX970     FETCH BUSY INDR        2-10 ZDR27660
                          BSC  L  DX280,Z   LOOP IF DRIVE IS BUSY       ZDR27670
                          LD    2 'FUNC     FETCH FUNCTION CODE         ZDR27680
                          BSC  L  DX470,Z   BR UNLESS TEST FUNCTION     ZDR27690
                    *                                                   ZDR27700
                    * RETURN TO CALLER                                  ZDR27710
                    *                                                   ZDR27720
                    DX330 LDD     DX980                                 ZDR27730
                    DX380 LDX  L1 *-*       RESTORE XR1                 ZDR27740
                    DX390 LDX  L2 *-*       RESTORE XR2                 ZDR27750
                          MDX  L  DX000,'NRTN  INCR LINK WORD AND       ZDR27760
                          BSC  I  DX000     *RETURN TO CALLER           ZDR27770
                    *                                                   ZDR27780
                    * CONTINUE CALL PROCESSING (SCTR ADDR, LESS DRIVE   ZDR27790
                    * CODE, IS IN THE EXTENSION)                        ZDR27800
                    *                                                   ZDR27810
                    DX470 A       DX999     SET READ BEFORE SEEK   2-10 ZDR27820
                          SRA     10        *INDR                  2-10 ZDR27830
                          STO     DX902                            2-10 ZDR27840
                          LD    2 'IOAR     SAVE ADDR OF USER      2-10 ZDR27850
                          STO  L1 DX960     *I/O AREA                   ZDR27860
                          LD   L  SW006     PATCH OPTION SWITCH         ZDR27870
                          BSC  L  DX480,E   BR IF CALL FROM PATCH       ZDR27880
                          LD   I2 'IOAR     WD CNT,SCTR ADDR TO         ZDR27890
                          STD  I2 'IOAR     *USER I/O AREA              ZDR27900
                    DX480 LD      DX990+1   SECTOR ADDR TO ACC     2-10 ZDR27910
                          SLA     13        ISOLATE THE SCTR            ZDR27920
                          SRA     13        *NO.,I.E.,RIGHTMOST 3 BITS  ZDR27930
                          OR    2 'FUNC     'OR' IN FUNCTION CODE       ZDR27940
                          EOR  L1 DX913     EOR IN AREA CODE, PUT  2-11 ZDR27950
                          EOR     DX915     *BACK BIT 15 IF NECESSARY   ZDR27960
                          STO  L1 DX960+1   STORE 2ND WD OF IOCC        ZDR27970
                          AND     DX997     'AND' ALL BUT BITS 6, 7     ZDR27980
                          BSC  L  DX500,Z   BR UNLESS SEEK REQUESTED    ZDR27990
                          LD      DX915                                 ZDR28000
                          STO  L1 DX910     SET ARM POSITION TO CYL 1   ZDR28010
                          LDD     DX990     RESTORE WD CNT AND          ZDR28020
                          STD  I2 'IOAR     *SCTR ADDR                  ZDR28030
                          LD      DX935     BUILD READ CHECK IOCC  2-11 ZDR28040
                          EOR  L1 DX913     EOR IN AREA CODE       2-11 ZDR28050
                          STO  L  DX902+1   *AND SAVE IT           2-11 ZDR28060
                          LD   L  DX911     SAVE ADDR OF I/O AREA  2-11 ZDR28070
                          STO  L  DX902     *IN READ CHECK IOCC    2-10 ZDR28080
                    *                                                   ZDR28090
                    * CHECK TO SEE IF AUTOMATIC SEEK IS NECESSARY       ZDR28100
                    *                                                   ZDR28110
                    DX500 LD      DX990+1   FETCH SECTOR ADDR      2-10 ZDR28120
                          SLA     4         CLEAR OUT DRIVE CODE AND    ZDR28130
                          SRA     7         *CONVERT TO A CYLINDER ADDR ZDR28140
                          STO     DX996     SAVE ADDR CYLINDER SOUGHT   ZDR28150
                          S    L1 DX910     COMPARE WITH CURR CYL ADDR  ZDR28160
                          BSC  L  DX550,+-  BR IF SEEK NOT NECESSARY    ZDR28170
                    *                                                   ZDR28180
                    * AUTOMATIC SEEK PREPARATION                        ZDR28190
                    *                                                   ZDR28200
                          SRT     16        PUT NO. CYLINDERS IN EXT    ZDR28210
                          SRA     15        + OR - SIGN TO BIT 15       ZDR28220
                          SLA     2         DIRECTION INDR TO BIT 13,   ZDR28230
                          OR   L1 DX913     *'OR' AGAINST SENSEIOCC2-11 ZDR28240
                          EOR     DX995     *MASK BITS 6,7,AND 15 OUT   ZDR28250
                          RTE     16                                    ZDR28260
                          BSC  L  DX520,-   BR IF SEEK TOWARD CENTER    ZDR28270
                          EOR  L  DX945     COMPLEMENT NO. CYLINDERS    ZDR28280
                          A    L  DX915     *SOUGHT TO GET POSITIVE NO. ZDR28290
                    DX520 STD  L  DX900     SAVE SEEK IOCC              ZDR28300
                    DX530 LD      DX996     RESET ARM POSITION TO  2-11 ZDR28320
                          STO  L1 DX910     *ADDR OF CYLINDER SOUGHT    ZDR28330
                          LD   L  DX907     SET BUSY INDICATOR     2-10 ZDR28340
                          STO  L  DX970     *TO INDICATE SEEK      2-10 ZDR28350
                    DX535 BSI     DX600     BR TO CHK FOR DISK REDY2-11 ZDR28370
                          LD   L  DX902     GET READ BEFORE SEEK   2-10 ZDR28380
                          BSC  L  DX536,+-  *INDR & BR IF OFF      2-10 ZDR28390
                          LD   L  DX902+1   GET RD BEFORE SEEK IOCC2-10 ZDR28400
                    DX536 BSC  L  DX537,E   *AND BR IF OP NOT SEEK 2-10 ZDR28410
                          XIO  L  DX900     XEQ SEEK               2-10 ZDR28420
                          MDX     DX540     SKIP NEXT XIO          2-10 ZDR28430
                    DX537 XIO  L  DX902     XEQ OP OTHER THAN SEEK 2-10 ZDR28440
                    DX540 MDX  L  DX970,0   SKIP IF DISK NOT BUSY  2-11 ZDR28450
                          MDX     DX540     *OTHERWISE, LOOP       2-11 ZDR28460
                          LD   L1 DX960+1   FETCH 2ND WD CURRENT IOCC   ZDR28470
                          AND  L  DX994     'AND' ALL BUT BITS 6, 7     ZDR28480
                          BSC  L  DX330,+-  BR IF SEEK REQUESTED        ZDR28490
                    *                                                   ZDR28500
                    * READ/WRITE/READ CHECK PREPARATION                 ZDR28510
                    *                                                   ZDR28520
                    DX550 LD   L  DX907     FETCH NO. RETRIES           ZDR28530
                          STO  L  DX970     SET BUSY INDR          2-10 ZDR28540
                          BSI     DX600     OUT TO READ/WRITE/READ CHK  ZDR28560
                          XIO  L1 DX960     RETRY OPERATION        2-10 ZDR28570
                          MDX     DX330     BR TO EXIT                  ZDR28580
                    *                                                   ZDR28590
                    * TEST FOR NOT-READY, INITIATE ALL DISK OPERATIONS  ZDR28600
                    *                                                   ZDR28610
                    DX600 DC      *-*       ENTRY POINT                 ZDR28620
                    DX630 XIO  L1 DX913-1   SENSE DISK DSW/RESET   2-11 ZDR28640
                          STO  L  $DDSW     SAVE THE DSW                ZDR28650
                          BSC  L  DX640,+Z  TEST FOR DATA ERROR     2-9 ZDR28660
                          SLA     2                                     ZDR28670
                          BSC  I  DX600,-   BR IF DR READY         2-11 ZDR28680
                          LD   L  DX270+1   GET TWICE DR CODE      2-10 ZDR28690
                          SLA     3         PUT DR CODE IN DIGIT 2 2-10 ZDR28700
                          OR   L  DX955     OR IN ERROR CODE       2-10 ZDR28710
                    DX635 BSI  L  $PRET     BR TO PREOPERATIVE ERR TRAP ZDR28720
                          MDX     DX630     BR TO TEST FOR READY        ZDR28730
                    *                                               2-9 ZDR28740
                    DX640 SLA     2         CHECK IF WR SEL/PWR UNS 2-9 ZDR28750
                          BSC  I  DX600,-   BR IF DATA ERROR       2-11 ZDR28760
                          LD   L  DX998     LD WR SEL/PWR UNS CODE  2-9 ZDR28770
                          MDX     DX635     BR TO DISP ERROR        2-9 ZDR28780
                          HDNG    TYPE0                                 ZDR28850
                    *************************************************** ZDR28860
                    *                                                 * ZDR28870
                    *STATUS- VERSION 2, MODIFICATION LEVEL 0          * ZDR28880
                    *                                                 * ZDR28890
                    *FUNCTION/OPERATION-                              * ZDR28900
                    *    THIS 1130/18OO SUBROUTINE OPERATES THE PRIME * ZDR28910
                    *    KEYBOARD/PRINTER (1816/1053). IT INITIATES   * ZDR28920
                    *    REQUESTED OPERATIONS AND PROCESSES ANY       * ZDR28930
                    *    KEYBOARD, PRINTER, OR OPERATOR REQUEST       * ZDR28940
                    *    INTERRUPTS. IT IGNORES ANY KEYBOARD/PRINTER  * ZDR28950
                    *    ERRORS.                                      * ZDR28960
                    *                                                 * ZDR28970
                    *ENTRY POINTS-                                    * ZDR28980
                    *   * TYPE0-CALL ENTRANCE FOR READ, WRITE, OR     * ZDR28990
                    *           TEST OPERATIONS.                      * ZDR29000
                    *                                                 * ZDR29010
                    *   * INT1- ENTRY POINT FOR KEYBOARD, CONSOLE     * ZDR29020
                    *           PRINTER, OR INTERRUPT REQUEST         * ZDR29030
                    *          PKEY INTERRUPTS                        * ZDR29040
                    *                                                 * ZDR29050
                    *INPUT- FROM KEYBOARD OR LIBF PARAMETERS          * ZDR29060
                    *                                                 * ZDR29070
                    *OUTPUT- PRINTED                                  * ZDR29080
                    *                                                 * ZDR29090
                    *EXTERNAL SUBROUTINES-                            * ZDR29100
                    *   * HOLL                                        * ZDR29110
                    *   *PRTY                                         * ZDR29120
                    *                                                 * ZDR29130
                    *EXITS-                                           * ZDR29140
                    *   NORMAL-                                       * ZDR29150
                    *      * CALL PORTION-EXIT BACK TO USER PROGRAM.  * ZDR29160
                    *      * INTERRUPT PORTION-BACK TO ILS04          * ZDR29170
                    *   * ERROR-                                      * ZDR29180
                    *      * CALL PORTION-TO $PRET                    * ZDR29190
                    *      * INTERRUPT PORTION-TO $PST4               * ZDR29200
                    *                                                 * ZDR29210
                    *TABLES/WORK AREAS- LIBF TO HOLL TABLE SUBROUTINE * ZDR29220
                    *                                                 * ZDR29230
                    *ATTRIBUTES- REUSABLE                             * ZDR29240
                    *                                                 * ZDR29250
                    *NOTES--N/A                                       * ZDR29260
                    *                                                 * ZDR29270
                    *************************************************** ZDR29280
                          HDNG    TYPE0                                 ZDR29290
                    WRTY0 DC      0         ENTRY POINT                 ZDR29300
                          STX   1 T0100+1    LIBF  ENTRANCE         (+0 ZDR29310
                          LDX  I1 WRTY0                                 ZDR29320
                          MDX     T0070      BR TO PROCESS THE CALL     ZDR29330
                    T0020 DC      0         INTERRUPT  ENTRANCE    (+4) ZDR29340
                          BSC  L  T0320      BR TO PROCESS INTERRUPT    ZDR29350
                    *************************************************** ZDR29360
                    *             LIBF PROCESSING                     * ZDR29370
                    *************************************************** ZDR29380
                    *    THIS PORTION STORES CALLING SEQUENCE INFO    * ZDR29390
                    *    AND CHECKS THE DEVICE STATUS BEFORE ANY I/O  * ZDR29400
                    *    OPERATION IS INITIATED.  A CALLING ERROR     * ZDR29410
                    *    CAUSES AN ERROR EXIT TO LOC 41.  NOT READY   * ZDR29420
                    *    1053 CAUSES ERROR EXIT TO LOC /8D.  OTHERWISE* ZDR29430
                    *    THE ROUTINE IS SET BUSY AND IOCS CTR INCREMEN* ZDR29440
                    *    TED TO INDICATE INTERRUPT(S) PENDING.        * ZDR29450
                    *************************************************** ZDR29460
                    T0030 DC      +2        DECIMAL TWO                 ZDR29470
                    T0040 DC      /2000     DEVICE NOT READY CODE       ZDR29480
                    T0050 DC      /2001     ILLEGAL CALL ERROR CODE     ZDR29490
                    T0060 MDX     *+1       TO SET UP JUMP TABLE        ZDR29500
                    *                                                   ZDR29510
                    *                                                   ZDR29520
                    T0070 STX   2 T0110+1    SAVE XR2                   ZDR29530
                          STS     T0120     SAVE STATUS                 ZDR29540
                          STD     T0230     SAVE ACC AND EXT            ZDR29550
                          LD    1 0         GET THE CONTROL PARAMETER   ZDR29560
                          SRA     12        IS  FUNCTION TEST           ZDR29570
                          BSC  L  T0140,Z    *  NO                      ZDR29580
                          LD      T0240      *  YES, IS SUBR BUSY       ZDR29590
                          BSC     +-        IF                          ZDR29600
                    T0080 MDX   1 +1        *    NO, EXIT TO CALL+3     ZDR29610
                          LDD     T0230                                 ZDR29620
                    T0090 MDX   1 +1        IF YES,   EXIT TO CALL+2    ZDR29630
                          STX   1 T0130+1    SET UP EXIT                ZDR29640
                    T0100 LDX  L1 *-*       RESTORE XR1                 ZDR29650
                    T0110 LDX  L2 *-*       RESTORE XR2                 ZDR29660
                    T0120 LDS     *-*       RESTORE STATUS              ZDR29670
                    T0130 BSC  L  *-*       EXIT                        ZDR29680
                    T0140 LD      T0240      IS SUBROUTINE BUSY         ZDR29690
                          BSC  L  T0140,Z    *  YES, WAIT               ZDR29700
                          LD    1 0                                     ZDR29710
                          STO  L  T0455     PATCH CALL FLAG             ZDR29720
                          SRA     12                                    ZDR29730
                          S       T0030     IS  FUNCTION LEGAL          ZDR29740
                          BSC  L  T0190,Z-   *  NO, ERROR               ZDR29750
                          A       T0060     *YES, SET UP JUMP TABLE     ZDR29760
                          STO     T0180                                 ZDR29770
                    T0170 XIO     T0250-1   IS THE DEVICE READY         ZDR29780
                          SLA     5                                     ZDR29790
                          BSC  L  T0200,Z+   NO,LOOP UNTIL READY        ZDR29800
                          SRA     16        READY, CLEAR STORAGE AREAS, ZDR29810
                          STO     T0440     * RESTART INDR              ZDR29820
                          STO     T0400      * BACKSPACE INDR           ZDR29830
                          STO     T0450     * SLASH INDR                ZDR29840
                          STO     T0430     * SET INDR FOR RIGHT CHAR   ZDR29850
                          LD    1 1         GET DATA ADDR               ZDR29860
                          A       T0260     AVOID STORED WD CNT         ZDR29870
                          STO     T0390      SAVE I/O AREA ADDR         ZDR29880
                          STO     T0440+1                               ZDR29890
                          LD   I1 1         SAVE    WORD COUNT          ZDR29900
                          BSC  L  T0190,+    ERROR IF ZERO OR NEGATIVE  ZDR29910
                    T0180 MDX     T0180+1    INITIATE  FUNCTION         ZDR29920
                          MDX     T0280      *          = GET           ZDR29930
                          MDX     T0310      *          = PUT           ZDR29940
                    T0190 LD      T0050     ERROR  HANDLING             ZDR29950
                          MDX     T0220      *  = ILLEGAL CALL          ZDR29960
                    T0200 BSC  L  T0170,C    *  = NOT READY & BUSY      ZDR29970
                    T0210 LD      T0040     * = NOT READY & NOT BUSY    ZDR29980
                    T0220 MDX   1 -1                                    ZDR29990
                          STX  L1 $PRET     STORE LIBF ADDR             ZDR30000
                          LDX   1 $PRET                                 ZDR30010
                          MDX     T0090                                 ZDR30020
                    T0230 BSS  E  2         SAVE ACC AND EXT            ZDR30030
                    T0240 DC      0         SUBR    BUSY INDR           ZDR30040
                    T0250 DC      /0F00     IOCC TO SENSE DSW           ZDR30050
                    T0260 DC      +1        DECIMAL ONE                 ZDR30060
                    T0270 DC      /0F01     SENSE DSW IOCC (RESET)      ZDR30070
                    *************************************************** ZDR30080
                    *             TYPE0 FUNCTION INITIATION             ZDR30090
                    *************************************************** ZDR30100
                    T0280 STO     T0410     READ  FUNCTION INITIATION   ZDR30110
                          STO     T0440+2   SAVE WD CNT FOR RESTART     ZDR30120
                          XIO     T0250-1                               ZDR30130
                          SLA     6         IS    KEYBOARD READY        ZDR30140
                          BSC  L  T0210,Z+   *    NO, ERROR             ZDR30150
                          BSC  L  T0730     SET UP CONVERSION TBL ADDR  ZDR30160
                    T0290 STO     T0240      SET SUBROUTINE BUSY        ZDR30170
                          MDX  L  $IOCT,+1  INCR IOCS CTR               ZDR30180
                          NOP               AVOID SKIP PROBLEM          ZDR30190
                          XIO     T0370-1    RELEASE    KEYBOARD        ZDR30200
                          MDX     T0080      GO TO EXIT                 ZDR30210
                    T0310 SLA     1         PUT  FUNCTION INITIATION    ZDR30220
                          STO     T0410     SAVE    WORD COUNT *2       ZDR30230
                          STO     T0240      SET SUBROUTINE BUSY        ZDR30240
                          MDX  L  $IOCT,+1  INCR IOCS CTR               ZDR30250
                          NOP               AVOID SKIP PROBLEM          ZDR30260
                          LD   I  T0390      GET 1ST O/P CHAR           ZDR30270
                          STO     T0360     STORE THECHAR IN TEMP AREA  ZDR30280
                          XIO     T0380     PRINT ONE  CHARACTER        ZDR30290
                          MDX     T0080      GO TO EXIT                 ZDR30300
                    *************************************************** ZDR30310
                    *             GENERAL INTERRUPT PROCESSING        * ZDR30320
                    *************************************************** ZDR30330
                    *    THIS PORTION IS ENTERED FROM AN INTERRUPT    * ZDR30340
                    *    LEVEL SUBROUTINE (04 IN 1130). IT DETERMINES * ZDR30350
                    *    THE CAUSE OF THE INTERRUPT. IF THE REQUESTED * ZDR30360
                    *    NUMBER OF CHARACTERS HAS BEEN READ AND/OR    * ZDR30370
                    *    PRINTED, THE ROUTINE IS SET NOT BUSY AND THE * ZDR30380
                    *    IOCS COUNTER DECREMENTED TO INDICATE INTERR  * ZDR30390
                    *    PROCESSING COMPLETED. IF AN OPERATOR REQUEST * ZDR30400
                    *    INTERRUPT IS DETECTED, THE SUBROUTINE EXITS, * ZDR30410
                    *    VIA THE ADDRESS IN LOCN $IREQ , TO THE USER  * ZDR30420
                    *    BEFORE RETURNING CONTROL TO  THE INTERRUPT   * ZDR30430
                    *    LEVEL SUBROUTINE.                            * ZDR30440
                    *************************************************** ZDR30450
                    T0320 XIO     T0270-1   WHAT  CAUSED INTERRUPT      ZDR30460
                          STO     T0420                                 ZDR30470
                          SLA     1                                     ZDR30480
                          BSC  L  T0520,Z+   KEYBOARD SERVICE REQUEST   ZDR30490
                          BSC     C                                     ZDR30500
                          MDX     T0330      PRINTER SERVICE REQUEST    ZDR30510
                          MDX     T0350      IF NOT THESE,CONT CHK      ZDR30520
                    T0330 LD      T0440     WAS      RE-ENTRY LAST READ ZDR30530
                          BSC  L  T0630,Z    *      YES                 ZDR30540
                          LD      T0400      WAS    BACKSPACE  LAST REA ZDR30550
                          BSC  L  T0590,Z    *      YES                 ZDR30560
                          LD      T0180      IS THEFUNCTION = PUT       ZDR30570
                          BSC     E         *    NO                     ZDR30580
                          MDX     T0460      *    YES                   ZDR30590
                          MDX  L  T0410,0   ANY   MORE CHARS TO PRINT   ZDR30600
                          MDX     T0350      *      YES                 ZDR30610
                    T0340 SRA     16        CLEAR SUBROUTINE BUSY INDR  ZDR30620
                          STO     T0240                                 ZDR30630
                          MDX  L  $IOCT,-1       DECREMENT IOCS COUNTER ZDR30640
                          NOP                                           ZDR30650
                    T0350 LD      T0420                                 ZDR30660
                          SLA     2                                     ZDR30670
                          BSI  I  $IREQ,Z+  BR IF INTERRUPT REQUEST     ZDR30680
                          BSC  I  T0020      EXIT TO ILS 04             ZDR30690
                    *                                                   ZDR30700
                    *CONSTANTS AND BUFFER AREA                          ZDR30710
                    *                                                   ZDR30720
                    T0360 BSS  E  1         TEMPORARY  STORAGE          ZDR30730
                    T0370 DC      /0C00     IOCC  TO READY KEYBOARD   O ZDR30740
                    T0380 DC      T0360     IOCC  TO PRINT 1 CHAR     E ZDR30750
                          DC      /0900                                 ZDR30760
                    T0390 DC      0         IOCC  TO READ 1 CHAR      E ZDR30770
                          DC      /0A00                               O ZDR30780
                    T0400 DC      0         BACKSPACE INDR              ZDR30790
                    T0410 DC      0         LENGTH  OF I/O AREA         ZDR30800
                    T0420 DC      0         DEVICE  STATUS WORD         ZDR30810
                    T0430 DC      0         CHAR INDR (0 IF RIGHT)      ZDR30820
                    T0440 DC      0         RE-ENTRY  INFO - INDICATOR  ZDR30830
                          DC      0                          IOAR ADDR  ZDR30840
                          DC      0                          WORD COUNT ZDR30850
                    T0450 DC      0         SLASH CHAR INDR             ZDR30860
                    T0455 DC      0         PATCH CALL FLAG             ZDR30870
                    T0456 DC      /00FF     PRINTER CODE EXTRACT MASK   ZDR30880
                    *************************************************** ZDR30890
                    *             T0380 FUNCTION INTERRUPT PROCESSING * ZDR30900
                    *************************************************** ZDR30910
                    *    DATA IS PRINTED FROM A TEMPORARY REGISTER AS * ZDR30920
                    *    THE DATA AREA IS UNPACKED, ONE CHARACTER     * ZDR30930
                    *    AT A TIME.                                   * ZDR30940
                    *************************************************** ZDR30950
                    T0460 MDX  L  T0410,-1  ANY  MORE CHARS TO PRINT    ZDR30960
                          MDX     T0470      *  YES                     ZDR30970
                          MDX     T0340      *  NO, EXIT                ZDR30980
                    T0470 LD      T0430     IS    THIS RIGHT CHAR       ZDR30990
                          BSC  L  T0480,+-   *   YES,GO TO PRINT        ZDR31000
                          SRA     16        *    NO, IS LEFT CHAR       ZDR31010
                          STO     T0430     ZERO RIGHT HAND CHAR INDR   ZDR31020
                          MDX  L  T0390,+1   INCR I/O AREA ADDR         ZDR31030
                          LD   I  T0390      GET NEXT O/P WD            ZDR31040
                          MDX     T0490      GO PRINT LEFT CHAR         ZDR31050
                    T0480 LD      T0640        IF RIGHT CHAR,SET INDR F ZDR31060
                          STO     T0430     NEXT CHAR TO BE LEFT CHAR.  ZDR31070
                          LD   I  T0390      GET RIGHT CHAR,LEFT JUSTIF ZDR31080
                          SLA     8                                     ZDR31090
                    T0490 STO     T0360     STO CHAR IN O/P BUFFER      ZDR31100
                    T0500 XIO     T0250-1   IS THE DEVICE READY         ZDR31110
                          SLA     5                                     ZDR31120
                          BSC  L  T0510,Z+  NO,  GO TO ERROR TRAP       ZDR31130
                          XIO     T0250-1   DEVICE STILL READY          ZDR31140
                          SLA     5                                     ZDR31150
                          BSC  L  T0510,Z+  NO,  WAS CONTACT BOUNCE     ZDR31160
                          XIO     T0380     PRINT 1 CHARACTER*****      ZDR31170
                          MDX     T0350      CHK INTERRUPT REQUEST      ZDR31180
                    *                                                   ZDR31190
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   ZDR31200
                    *ERROR CODE IN THE ACCUMULATOR.                     ZDR31210
                    *                                                   ZDR31220
                    T0510 LD   L  T0040     ERROR CODE INTO ACC         ZDR31230
                          BSI  L  $PST4     EXIT TO ERROR TRAP          ZDR31240
                          MDX     T0500      TRY AGAIN                  ZDR31250
                    *************************************************** ZDR31260
                    *             KEYBOARD INTERRUPT PROCESSING       * ZDR31270
                    *************************************************** ZDR31280
                    *    THE INPUT CHARACTER IS READ, ANALYZED, AND   * ZDR31290
                    *    PROCESSED. IF A GRAPHIC, IT IS PRINTED AND,  * ZDR31300
                    *    IF THE REQUESTED NO. OF CHARACTERS HAS NOT   * ZDR31310
                    *    BEEN READ, THE KEYBOARD IS RELEASED FOR THE  * ZDR31320
                    *    NEXT ENTRY.                                  * ZDR31330
                    *************************************************** ZDR31340
                    T0520 XIO     T0390      READ 1 CHAR FROM KEYBOARD  ZDR31350
                          LD   I  T0390                                 ZDR31360
                          SLA     13        WHAT IS CHAR JUST READ      ZDR31370
                          BSC  L  T0560,C    *    CHAR = END MESSAGE    ZDR31380
                          RTE     16        SAVE ACCUMULATOR            ZDR31390
                          LD      T0455                                 ZDR31400
                          BSC  L  T0525,E   BR IF PATCH CALL            ZDR31410
                          RTE     16        RESTORE ACCUMULATOR         ZDR31420
                          BSC  L  T0570,Z-   *    CHAR = RE-ENTRY       ZDR31430
                          BSC  L  T0580,Z    *    CHAR = BACKSPACE      ZDR31440
                    T0525 LDX   1 +T0770-T0760 LENGTH OF CONVERSION TBL ZDR31450
                    *                       FOR CONVERSION              ZDR31460
                          LD      T0455     CHK FOR BIT 14 ON IN CALL   ZDR31470
                          SRA     1         *FUNCTION WORD.             ZDR31480
                          BSC     E         SKIP IF NOT DM1 LABEL CALL  ZDR31490
                          MDX   1 -4        EXCLUDE SPECIAL CHARS       ZDR31500
                    T0530 LD   I  T0390                                 ZDR31510
                    T0540 EOR  L1 *-*       CHK W/HOLL TBL ENTRY        ZDR31520
                          BSC  L  T0550,+-   MATCH ,GET PRTY TBL ENTRY  ZDR31530
                          MDX   1 -1        IF NOT,CHK NEXT TBL ENTRY   ZDR31540
                          MDX     T0530                                 ZDR31550
                    T0550 LD   L1 *-*       GET PRTY CHAR               ZDR31560
                          STO     T0360     PUT IN O/P BUFFER           ZDR31570
                          AND     T0456     /00FF - REMOVE PRINTER HALF ZDR31580
                          RTE     16        SAVE CHARACTER IN EXTENSION ZDR31590
                          LD      T0455     CHK FOR BIT 14 ON IN CALL   ZDR31600
                          SRA     1         *FUNCTION WORD.             ZDR31610
                          BSC  L  T0555,E   BR IF VERSION 1 LABEL CALL  ZDR31620
                    T0551 MDX  L  T0390,1   GET SET TO READ NEXT CHAR   ZDR31630
                          MDX  L  T0410,-1  ANY MORE CHARACTERS         ZDR31640
                          XIO     T0370-1    * YES,ENABLE THE KEYBOARD  ZDR31650
                          MDX     T0500      PRINT THE  CHAR JUST READ  ZDR31660
                    T0555 LD      T0410     CHARACTER COUNT             ZDR31670
                          BSC     E         SKIP IF NO SHIFT REQUIRED   ZDR31680
                          SLT     8         *FOR PACKING                ZDR31690
                          RTE     16        CHAR TO ACC                 ZDR31700
                          STO  I  T0390     EBC TO BUFFER               ZDR31710
                          MDX     T0551     BR TO READ NEXT CHAR        ZDR31720
                    *************************************************** ZDR31730
                    *             SPECIAL CHARACTER SETUP/PROCESSING  * ZDR31740
                    *************************************************** ZDR31750
                    *    IF A RE-ENTRY CHARACTER IS READ, TWO SLASHES * ZDR31760
                    *    ARE PRINTED, THE CARRIER RESTORED, AND THE   * ZDR31770
                    *    KEYBOARD RELEASED FOR THE NEXT (FIRST)       * ZDR31780
                    *    ENTRY. IF A BACKSPACE CHARACTER IS READ, A   * ZDR31790
                    *    BACKSPACE IS EXECUTED, A SLASH PRINTED, AND  * ZDR31800
                    *    THE KEYBOAD RELEASED FOR THE NEXT (PREVIOUS) * ZDR31810
                    *    ENTRY.                                       * ZDR31820
                    *************************************************** ZDR31830
                    T0560 LD      T0680     END OF FIELD CHAR INPUT     ZDR31840
                          STO  I  T0390      STORE A    NEW LINE CHAR   ZDR31850
                          MDX     T0340      GO TO EXIT                 ZDR31860
                    T0570 STO     T0440                                 ZDR31870
                          LD      T0440+1   CHARACTER = RE-ENTRY        ZDR31880
                          STO     T0390                                 ZDR31890
                          LD      T0440+2   RESTORE ADDRESS & COUNT   T ZDR31900
                          STO     T0410                                 ZDR31910
                          LD      T0700     CHAR   = SLASH              ZDR31920
                          MDX     T0490      GO TO PRINT SLASH          ZDR31930
                    T0580 STO     T0400      SET BACKSPACE INDR NON-ZER ZDR31940
                          MDX  L  T0390,-1   REFERENCE PREVIOUS WORD    ZDR31950
                          MDX  L  T0410,+1  INCR THE WD CNT             ZDR31960
                          LD      T0670     CHAR   = BACKSPACE          ZDR31970
                          MDX     T0490      EXECUTE A BACKSPACE        ZDR31980
                    T0590 LD      T0450     BKSP INDR SET,IS SLASH INDR ZDR31990
                          BSC  L  T0610,Z    * YES,ENABLE KB AND EXIT   ZDR32000
                    T0600 LD      T0640        * NO,SET SLASH INDR      ZDR32010
                          STO     T0450                                 ZDR32020
                          LD      T0700     CHAR = SLASH                ZDR32030
                          MDX     T0490      GO TO PRINT SLASH          ZDR32040
                    T0610 SRA     16        CLEAR INDICATORS         &  ZDR32050
                          STO     T0400      RELEASE THE KEYBOARD       ZDR32060
                          STO     T0450                                 ZDR32070
                          STO     T0440                                 ZDR32080
                          XIO  L  T0370-1                               ZDR32090
                          BSC  L  T0350                                 ZDR32100
                    T0630 LD      T0450     RESTART INDR SET,IS SLASH   ZDR32110
                          BSC  L  T0600,+-   *  NO, SET & PRINT SLASH   ZDR32120
                          LD   L  T0400      * YES,IS BKSP INDR SET     ZDR32130
                          BSC  L  T0610,Z    CLEAR ALL INDICATORS       ZDR32140
                          LD      T0640        *   NO,SET BKSP INDR = 0 ZDR32150
                          STO  L  T0400                                 ZDR32160
                          LD      T0690     =CARRIAGE RET (NEW LINE)    ZDR32170
                          MDX     T0490      GO TO SPACE CARRIAGE       ZDR32180
                    *                                                   ZDR32190
                    *CONSTANTS AREA                                     ZDR32200
                    *                                                   ZDR32210
                    T0640 DC      +1        DECIMAL CONSTANT            ZDR32220
                    T0670 DC      /1100     BACKSPACE (CONSOLE PTR)     ZDR32230
                    T0680 DC      /4110     HOLLERITH NEW LINE CHAR     ZDR32240
                    T0690 DC      /8100     NEW LINE (CONSOLE PTR)      ZDR32250
                    T0700 DC      /BC00     SLASH (CONSOLE PTR)         ZDR32260
                    *************************************************** ZDR32270
                    *             T0730- STORE CONVERSION TBL ADDRS   * ZDR32280
                    *************************************************** ZDR32290
                    T0730 LD      T0740     GET LIBF HOLL WD            ZDR32300
                          STO     T0540+1    SETUP ADDR FOR CONVERSIONS ZDR32310
                          LD      T0750     GET LIBF PRTY WD            ZDR32320
                          STO     T0550+1    SETUP ADDR FOR CONVERSIONS ZDR32330
                          BSC  L  T0290      RET TO CALL SERVICE PORTIO ZDR32340
                    T0740 DC      T0760     ADDR OF IBM CARD CODE TABLE ZDR32350
                    T0750 DC      CPTBL     ADDR OF CONSOLE PTR CODE TB ZDR32360
                    T0760 EQU     KBTBL                                 ZDR32370
                    T0770 EQU     KBTBE                                 ZDR32380
                          HDNG    PRNT1                                 ZDR32390
                    *************************************************** ZDR32400
                    *                                                 * ZDR32410
                    * STATUS - CHANGE LEVEL 0                         * ZDR32420
                    *                                                 * ZDR32430
                    * FUNCTION/OPERATION - PRNT1 CAN PERFORM THE      * ZDR32440
                    *   FOLLOWING FUNCTIONS                           * ZDR32450
                    *      1. TEST                                    * ZDR32460
                    *      2. PRINT                                   * ZDR32470
                    *      3. CONTROL CARRIAGE                        * ZDR32480
                    *      4. PRINT NUMERICAL                         * ZDR32490
                    *                                                 * ZDR32500
                    * ENTRY POINTS -                                  * ZDR32510
                    *      1. PRNT1  CALL ENTRANCE, LIBF PRNT1        * ZDR32520
                    *      2. INT1   INTERRUPT ENTRANCE FROM ILS01    * ZDR32530
                    *                                                 * ZDR32540
                    * INPUT - THE I/O AREA CONTAINS EBCDIC CHARACTERS * ZDR32550
                    *   PACKED TWO PER WORD                           * ZDR32560
                    *                                                 * ZDR32570
                    * OUTPUT - PRINTED ON 1132 PRINTER                * ZDR32580
                    *                                                 * ZDR32590
                    * EXTERNAL SUBROUTINES - NONE                     * ZDR32600
                    *                                                 * ZDR32610
                    * EXITS -                                         * ZDR32620
                    *   NORMAL                                        * ZDR32630
                    *      1. CALL PORTION - FC58, BACK TO USER.      * ZDR32640
                    *      2. INTERRUPT PORTION - OUT, BACK TO ILS01  * ZDR32650
                    *   ERROR                                         * ZDR32660
                    *      1. CALL PORTION - IF PRE-OP ERROR IS DETECT* ZDR32670
                    *         *ED, SUBROUTINE BRANCHES TO $PRET AND   * ZDR32680
                    *         DISPLAYS 6000 OR 6001 IN ACCUMULATOR.   * ZDR32690
                    *      2. INTERRUPT PORTION - IF CARRIAGE CHANNEL * ZDR32700
                    *         9 OR 12 IS DETECTED, SUBROUTINE PERFORMS* ZDR32710
                    *         BSI TO USER'S ERROR SUBROUTINE WITH 0003* ZDR32720
                    *         OR 0004 RESPECTIVELY IN ACCUMULATOR.    * ZDR32730
                    *                                                 * ZDR32740
                    * TABLES/WORK AREAS - NONE                        * ZDR32750
                    *                                                 * ZDR32760
                    * ATTRIBUTES - REUSABLE                           * ZDR32770
                    *                                                 * ZDR32780
                    * NOTES - EBCDIC CHARACTERS NOT INCLUDED IN 1132  * ZDR32790
                    *   CHARACTER SET ARE PRINTED AS BLANKS.          * ZDR32800
                    *                                                 * ZDR32810
                    *************************************************** ZDR32820
                          HDNG    PRNT1                                 ZDR32830
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR32840
                    PRNT1 DC      0         ENTRY POINT                 ZDR32850
                          STX  L1 P1370+1    CALL ENTRANCE          (+0 ZDR32860
                          LDX  I1 PRNT1     ADDR OF 1ST PARAM      +2   ZDR32870
                          MDX     P1350      TO PROCESS CALL            ZDR32880
                    *                                              2-11 ZDR32890
                    *                       2 INSTRUCTIONS MOVED   2-11 ZDR32900
                    *                                                   ZDR32910
                    *CONSTANTS AND BUFFER AREA                          ZDR32920
                    *                                                   ZDR32930
                    P1020 DC      *-*       STORAGE FOR WHEEL CHAR      ZDR32940
                          BSS  E  0                                     ZDR32950
                    P1030 DC      *-*       SAVE ACC AND EXT            ZDR32960
                          DC      *-*                                 * ZDR32970
                    P1040 DC      /6001     ERROR CODE                  ZDR32980
                    *                                                   ZDR32990
                    *THIS SECTION DOES THE SHIFT TO POSITION SCAN BITS, ZDR33000
                    *STORES THEM IN THE SCAN FIELD AND KEEPS TRACK OF   ZDR33010
                    *THE WORD COUNT.                                    ZDR33020
                    *                                                   ZDR33030
                    P1050 SLT     2         POSITION FOR 2 MORE BITS    ZDR33040
                          MDX  L  P1180,-4  IF A WD IS DONE,BR          ZDR33050
                          MDX     P1220      *ELSE RET TO GET 2 BITS    ZDR33060
                          SLT     14        WHEN EXT FULL, MOVE TO ACC  ZDR33070
                          MDX  L  P1180,32  RESET FOR NEXT WD           ZDR33080
                          MDX  L  P1320,8   MODIFY WD CNT               ZDR33090
                    P1070 STO  L  $SCAN     STORE 1 WD IN SCAN FIELD    ZDR33100
                          MDX  L  P1070+1,1 INCR SCAN FIELD ADDR        ZDR33110
                          MDX     P1220      RET TO SET UP NEXT WD      ZDR33120
                    P1080 MDX  L  $SCAN+7,1 SCAN COMPLETE INDR SET      ZDR33130
                    *                       ACC IS NON-0 AT THIS TIME   ZDR33140
                          MDX     P1200      EXIT TO ILS(IF ACC NOT 0)  ZDR33150
                    *                                                   ZDR33160
                    *END OF FORMS ERROR EXIT                            ZDR33170
                    *                                                   ZDR33180
                    P1090 LD      P1270     GET ERROR CODE              ZDR33190
                          MDX     P1100+1   EXIT TO CORE LOC 41         ZDR33200
                    *                                                   ZDR33210
                    *ERROR EXIT TO CORE LOC 41 W/CALL ADDR IN LOC 40    ZDR33220
                    *                                                   ZDR33230
                    P1100 LD      P1040     GET ERROR CODE              ZDR33240
                          LDX  L1 *-*       GET CALL ADDR AND STORE IN  ZDR33250
                          MDX   1 -2        CORE LOC 40                 ZDR33260
                          STX  L1 40                                    ZDR33270
                          LDX   1 41        SET TO EXIT TO CORE LOC 41  ZDR33280
                          MDX     P1360                                 ZDR33290
                    *                                                   ZDR33300
                    *CONSTANTS AND BUFFER AREA                          ZDR33310
                    *                                                   ZDR33320
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR33330
                    P1110 DC      P1020                               * ZDR33340
                          DC      /3200     READ EMITTER IOCC WDS       ZDR33350
                    P1120 DC      /FF00     SETS CARRY IF NOT CMP       ZDR33360
                    P1130 DC      2         SET 1ST CHAR CMP BIT        ZDR33370
                    P1140 DC      22        CTR IF NUMERIC MODE         ZDR33380
                    P1150 DC      1         SET 2ND CHAR CMP BIT        ZDR33390
                    P1160 DC      *-*       PTV=NUMERIC,NEG=ALPHA       ZDR33400
                    P1170 DC      /F100     1ST NUMERIC CHAR ON WHEEL   ZDR33410
                    P1180 DC      32        16 BITS CTR FOR SCAN ST     ZDR33420
                    *                                                   ZDR33430
                    *THIS SECTION SETS UP THE BITS FOR THE SCAN FIELD   ZDR33440
                    *                                                   ZDR33450
                    *                                                   ZDR33460
                    P1190 XIO     P1110     WHEEL CHAR TO EMITTER       ZDR33470
                          LD      P1160       IS NUMERIC INDR ON        ZDR33480
                          BSC  L  P1210,+    NO,GO START SCAN SETUP     ZDR33490
                          LD      P1140       YES, SET CTR48 TO 22      ZDR33500
                          STO     P1330                                 ZDR33510
                          LD      P1020     GET PRESENT WHEEL CHAR      ZDR33520
                          EOR     P1170      CMP W/1ST NUMERIC CHAR     ZDR33530
                    P1200 BSC  L  P1650,Z     DONT CMP,EXIT TO WAIT FOR ZDR33540
                    *                       * INTRPT ON NEXT WHEEL CHAR ZDR33550
                          STO     P1160       DO CMP,ZERO NUMERIC INDR  ZDR33560
                    P1210 LD      P1020     FETCH 8-BIT CHAR & ZEROS    ZDR33570
                          SRA     8         MOVE CHAR TO RT SIDE ACC    ZDR33580
                          OR      P1020     OR CHAR INTO LEFT SIDE      ZDR33590
                          STO     P1020     2 CHARS NOW AT WHEEL        ZDR33600
                          BSI  L  P1860     CLEAR PRINT MASK  (32-39)   ZDR33610
                          LDX  I2 P1310     NEG WD CNT TO XR2           ZDR33620
                    P1220 LD   L2 *-*       GET NEXT WD TO BE O/P       ZDR33630
                          EOR     P1020     CMP W/PRESENT WHEEL CHAR    ZDR33640
                          A       P1120        DID LEFT CHAR CMP        ZDR33650
                          BSC  L  P1230,C   NO,BR                       ZDR33660
                          AD      P1130-1    YES,SET 2 BIT IN Q REG     ZDR33670
                    P1230 SLA     8         DID RT CHAR CMP             ZDR33680
                          BSC     +-        NO,BR                       ZDR33690
                          AD      P1150-1    YES,SET 1 BIT IN Q REG     ZDR33700
                          MDX   2 1         DECR WD CNT                 ZDR33710
                          MDX     P1050     IF NOT ZERO,GO DO SHIFT     ZDR33720
                    *                                                   ZDR33730
                    *WD CNT ZERO, DO FINAL SHIFT AND STORE              ZDR33740
                    *                                                   ZDR33750
                          LD      P1260       RESET CTR THAT TESTS      ZDR33760
                          STO     P1180     *FOR Q REG FULL             ZDR33770
                          A       P1320     ADD MODIFIED WD CNT         ZDR33780
                          A       P1320     *TWICE TO SET Q SHIFT       ZDR33790
                          STO     P1250+1   *LEFT-JUSTIFIED             ZDR33800
                    P1250 LDX  L2 *-*       SET UP XR2 FOR SLC          ZDR33810
                          SRA     16        CLEAR ACC BEFORE SHIFT      ZDR33820
                          SLC   2 0         COUNT XR2                   ZDR33830
                          STO  I  P1070+1   STORE FINAL PART OF SCAN    ZDR33840
                          LD      P1330                                 ZDR33850
                          S       P1150      DECR CTR48                 ZDR33860
                          STO     P1330                                 ZDR33870
                          LD      P1260                                 ZDR33880
                          STO     P1070+1   RESET SCAN FIELD ADDR       ZDR33890
                          LD      P1310     RESET MODIFIED WD CNT TO    ZDR33900
                          STO     P1320     *STARTING VALUE             ZDR33910
                          MDX     P1080      GO SET SCAN COMPLETE INDR  ZDR33920
                    *                                                   ZDR33930
                    *CONSTANTS AND BUFFER AREA                          ZDR33940
                    *                                                   ZDR33950
                    P1260 DC      32        Q REG FULL CON              ZDR33960
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR33970
                    P1270 DC      /6000     END OF FORMS ERROR CODE     ZDR33980
                          DC      /3480     START PRINTER IOCC WD       ZDR33990
                    P1280 DC      48        CON TO SET 48 PR CYCLES     ZDR34000
                    *                       OR 16 IDLE CYCLES.          ZDR34010
                    P1290 DC      12        CON TO SET 2         CYCLES ZDR34020
                    P1300 DC      -'PRWC    WD CNT ERROR CHK CON        ZDR34030
                    P1310 DC      *-*       SOURCE FOR NEG USER WD CNT  ZDR34040
                    P1320 DC      *-*       WD CNT BUFFER USED BY SCAN  ZDR34050
                    P1330 DC      *-*       PTR SCAN COUNT BUFFER       ZDR34060
                    *************************************************** ZDR34070
                    *                                                 * ZDR34080
                    *THIS PORTION SERVICES A CALL ENTRANCE            * ZDR34090
                    *                                                 * ZDR34100
                    *************************************************** ZDR34110
                    P1340 DC      *-*       SAVE CONTROL PARAM          ZDR34120
                    P1350 STX   1 P1100+2   ADDR OF CALL+1 STORED       ZDR34130
                          STX   2 P1370+3    SAVE XR2                   ZDR34140
                          STS     P1370+4    SAVE STATUS                ZDR34150
                          STD     P1030        SAVE A AND Q REGS        ZDR34160
                          XIO     P1520     SENSE PRINTER               ZDR34170
                          SLA     5         END OF FORMS TEST           ZDR34180
                          BSC  L  P1090,+Z  IF END, TAKE ERROR EXIT     ZDR34190
                          LD   I  P1100+2   FETCH 1ST PARAMETER         ZDR34200
                          SRT     12        WHAT IS THE FUNCTION        ZDR34210
                          BSC     Z         BR IF TEST FUNC             ZDR34220
                          MDX     P1390      NOT TEST,GO CHK PR OF CTRL ZDR34230
                          XIO     P1520     CHK FOR PTR OR CARRIAGE     ZDR34240
                          SRA     8         BUSY.                       ZDR34250
                          BSC     +-                                    ZDR34260
                          MDX   1 1         NOT BUSY,EXIT AT CALL+3     ZDR34270
                          MDX   1 1         BUSY, EXIT AT CALL+2        ZDR34280
                          LDD     P1030        RESTORE A AND Q REGS     ZDR34290
                    P1360 STX   1 P1380+1    SET UP EXIT                ZDR34300
                    P1370 LDX  L1 *-*       RESTORE XR1                 ZDR34310
                          LDX  L2 *-*       RESTORE XR2                 ZDR34320
                          LDS     *-*       RESTORE STATUS              ZDR34330
                    P1380 BSC  L  *-*       EXIT TO MAINLINE            ZDR34340
                    *                                                   ZDR34350
                    *NOT TEST FUNCTION,CHECK PRINT OR CARRIAGE CONTROL  ZDR34360
                    *                                                   ZDR34370
                    P1390 RTE     20        RESTORE CTRL WD TO A REG    ZDR34380
                          STO     P1340      SAVE CTRL WD               ZDR34390
                          SRT     12        GET FUNC DIGIT              ZDR34400
                          S       P1150      IS IT LEGAL                ZDR34410
                          BSC  L  P1100,+   NO,BR                       ZDR34420
                          S       P1130      TEST IF CONTROL            ZDR34430
                          BSC     +-        NOT,SKIP                    ZDR34440
                          MDX     P1460      IS, TO CTRL PROCESSING     ZDR34450
                          STO     P1580     SAVE TO SET NUMERIC INDR    ZDR34460
                          SLT     32        CLEAR Q REG                 ZDR34470
                    *                                                   ZDR34480
                    *THIS SECTION SETS UP THE ROUTINE TO PRINT          ZDR34490
                    *                                                   ZDR34500
                    P1400 XIO     P1520     ANY RESPONSE,BUSY,OR ERROR  ZDR34510
                          SRA     8         BITS ON.                    ZDR34520
                          BSC  L  P1400,Z   YES,SENSE PTR AGAIN         ZDR34530
                          LD      P1580     IF PREVIOUS LINE NUMERIC    ZDR34540
                          STO     P1160       THE INDR WAS SET OFF WHEN ZDR34550
                    *                       1ST NUMERIC CHAR FOUND      ZDR34560
                          MDX   1 1         INCR XR1 TO CALL+2 ADDR     ZDR34570
                          STX   1 P1420+1    ST CALL+2 ADDR             ZDR34580
                          MDX   1 1                                     ZDR34590
                          STX  L1 P1770+2   ST CALL+3 ADDR              ZDR34600
                          LD      P1340      GET CTRL PARAM             ZDR34610
                          STO     P1520     SAVE                        ZDR34620
                          SRT     12        GET FUNC DIGIT              ZDR34630
                          S       P1600        SUB 1                    ZDR34640
                          SRA     2         IF ANY BIT REMAINS, PARAM   ZDR34650
                    P1410 BSC  L  P1100,Z   WAS OVER 4.TAKE ERROR EXIT  ZDR34660
                    P1420 S    I  *-*       SUB WD CNT FROM ZERO        ZDR34670
                          BSC  L  P1100,-   RESULT SHOULD BE NEG        ZDR34680
                          STO     P1310     SAVE MINUS WD CNT           ZDR34690
                          STO     P1320                                 ZDR34700
                          S       P1300     CHECK RANGE AND DISPLAY     ZDR34710
                          BSC  L  P1100,+Z  *6001 IF ERROR              ZDR34720
                          LD   I  P1420+1    LD ADDR OF I/O AREA        ZDR34730
                          A       P1600        AVOID STORED WD CNT      ZDR34740
                          S       P1310     SUB NEG WD CNT (PT TO END)  ZDR34750
                          STO     P1220+1    SAVE IN SCAN RTN           ZDR34760
                          LDD     P1280       SET CTRS 48, 16, & 2      ZDR34770
                          STO     P1330     *FOR A TOTAL OF 66 CYCLES   ZDR34780
                          STD     P1500                                 ZDR34790
                          BSI  L  P1860     CLEAR SCAN FIELD (32-39)    ZDR34800
                          MDX  L  $SCAN+7,1 SET SCAN COMPLETE INDR      ZDR34810
                          XIO     P1270     START THE PRINTER           ZDR34820
                    P1450 MDX  L  $IOCT,1   INCR ISS CTR (I/O OP CTR)   ZDR34830
                          NOP               MAY SKIP                    ZDR34840
                          MDX     P1360-2   EXIT TO CALLING PROG        ZDR34850
                    *                                                   ZDR34860
                    *THIS SECTION DOES THE CARRIAGE CONTROL FUNCTION    ZDR34870
                    * PROCESSING                                        ZDR34880
                    *                                                   ZDR34890
                    P1460 LD      P1500     WAIT FOR 16 IDLE SCANS      ZDR34900
                          BSC     Z-                                    ZDR34910
                          MDX     P1460                                 ZDR34920
                    P1470 XIO     P1520                                 ZDR34930
                          SRA     12        IS THE CARRIAGE BUSY        ZDR34940
                          BSC  L  P1470,Z   YES,SENSE PTR AGAIN         ZDR34950
                          LD      P1290       NO, SET 6-CTR FOR CHAN CH ZDR34960
                          STO     P1690                                 ZDR34970
                          SRA     16        CLEAR ACC                   ZDR34980
                          SLT     4         GET 2ND HEX DIGIT FROM Q    ZDR34990
                          STO     P1570     NOT ZERO--IMMEDIATE CTRL    ZDR35000
                    *                       ZERO--CTRL AFTER PRINT      ZDR35010
                          BSC  L  P1480,Z    IS IT ZERO                 ZDR35020
                          SLT     4         YES,TRY 3RD HEX DIGIT       ZDR35030
                          BSC  L  P1100,+-  IS IT ZERO ALSO,ERROR EXIT  ZDR35040
                    P1480 S       P1290       NO,SUB 12                 ZDR35050
                          BSC  L  P1540,-Z   IS THIS A SKIP             ZDR35060
                          LDX   2 0         YES                         ZDR35070
                          BSC  L  P1530,-    IS IT A SKIP TO CHAN 12    ZDR35080
                          A       P1550        NO                       ZDR35090
                          LDX   2 1         SET XR2 FOR SHIFT & COUNT   ZDR35100
                          BSC  L  P1530,+-   IS IT CHAN 9               ZDR35110
                          A       P1550        NO, INCR XR2             ZDR35120
                          MDX   2 1                                     ZDR35130
                    P1490 BSC  L  P1530,+-   TEST FOR NEXT CHANNEL      ZDR35140
                          A       P1600        NO, LOOP & TRY FOR 5,4,3 ZDR35150
                          MDX   2 1         *2,1                        ZDR35160
                          MDX  L  P1690,-1  CTR TO LIMIT LOOPS          ZDR35170
                          MDX     P1490      RET TO CHK CHAN            ZDR35180
                          MDX     P1410     ILLEGAL CALL-TAKE ERROR     ZDR35190
                    *                       EXIT.(ACC NEG BY NOW)       ZDR35200
                    *                                                   ZDR35210
                    *CONSTANTS AND BUFFER AREA                          ZDR35220
                    *                                                   ZDR35230
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR35240
                    P1500 DC      *-*       CTR FOR 16 IDLE SCANS (48)  ZDR35250
                    P1510 DC      *-*       CTR FOR 2 IDLE SCANS  (12)  ZDR35260
                    P1520 DC      *-*       STORAGE FOR CALL+1 PARAM    ZDR35270
                          DC      /3700     SENSE THE PRINTER IOCC WD   ZDR35280
                    *                                                   ZDR35290
                    *SET UP SKIP MASK,AND EXECUTE SKIP OR EXIT          ZDR35300
                    *                                                   ZDR35310
                    P1530 LD      P1600        SET UP BIT FOR SKIP MASK ZDR35320
                          SLCA  2 0                                     ZDR35330
                          OR      P1670     SET SIGN BIT ON             ZDR35340
                    P1540 STO     P1590      PTV=SPACE, NEG= SKIP       ZDR35350
                          LD      P1570     SHOULD EXECUTION WAIT       ZDR35360
                          BSC  L  P1360-2,+- GO TO EXIT IF YES,ELSE     ZDR35370
                          LD      P1590      DETERMINE IF SKIP OR SPACE ZDR35380
                          BSC  L  P1560,-   IS IT A SKIP                ZDR35390
                          XIO     P1580     YES,START CARRIAGE          ZDR35400
                          MDX     P1450     GO INCR ISS CTR, RET        ZDR35410
                    P1550 DC      3         CON OF 3                    ZDR35420
                    *                                                   ZDR35430
                    *SPACE CARRIAGE CONTROL PROCESSING                  ZDR35440
                    *                                                   ZDR35450
                    P1560 XIO     P1680     START SPACES THAT INTRPT    ZDR35460
                    *                       *SERVICE PART WILL FINISH   ZDR35470
                          MDX     P1450     INCR ISS CTR, RET TO USER   ZDR35480
                    *                                                   ZDR35490
                    *CONSTANTS AND BUFFER AREA                          ZDR35500
                    *                                                   ZDR35510
                    P1570 DC      *-*       CTRL BEFORE OR AFTER PR     ZDR35520
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR35530
                    P1580 DC      *-*       SAVE NUMERIC INDR           ZDR35540
                          DC      /3404     START CARRIAGE              ZDR35550
                    P1590 DC      *-*       SKIP OR SPACE INDR          ZDR35560
                    P1600 DC      1         CON OF 1                    ZDR35570
                    *************************************************** ZDR35580
                    *                                                 * ZDR35590
                    * THIS SECTION SERVICES THE INTERRUPTS WHICH      * ZDR35600
                    * OCCUR ON INTERRUPT LEVEL 01, THAT COME FROM     * ZDR35610
                    * THE 1132 PRINTER.                               * ZDR35620
                    *                                                 * ZDR35630
                    *************************************************** ZDR35640
                    P1010 DC      *-*       INTERRUPT ENTRY POINT  2-11 ZDR35650
                          XIO     P1830-1   SENSE AND RESET             ZDR35660
                          STO     P1800       HOLD DSW                  ZDR35670
                          SLA     1         IS IT A SKIP REQUEST        ZDR35680
                          BSC  L  P1630,-    NO,BR TO CONT CHK          ZDR35690
                          SLA     7         YES,GET CARRIAGE CHAN NO.   ZDR35700
                          SRA     8         RIGHT JUSTIFY               ZDR35710
                          OR      P1670     SET UP DSW FOR COMPARE      ZDR35720
                          EOR     P1590      CMP W/COMMAND              ZDR35730
                          BSC     Z         DO THEY MATCH               ZDR35740
                          MDX     P1640      NO,GO CONT CHK             ZDR35750
                          STO     P1850      YES,CLEAR PASS             ZDR35760
                          STO     P1590      CLEAR MASK                 ZDR35770
                          XIO     P1690     STOP CARRIAGE               ZDR35780
                    P1620 MDX  L  $IOCT,-1  DECR ISS CTR                ZDR35790
                          NOP               MAY SKIP                    ZDR35800
                          MDX     P1640      CONTINUE                   ZDR35810
                    *                                                   ZDR35820
                    *THIS SECTION SERVICES CARRIAGE RESPONSE REQUEST    ZDR35830
                    *                                                   ZDR35840
                    P1630 SLA     1         IS IT A SPACE REQUES        ZDR35850
                          BSC     -         IS CARR SPACE DONE          ZDR35860
                          MDX     P1640      NO                         ZDR35870
                          LD      P1800       YES,GET DSW               ZDR35880
                          OR      P1850      SAVE INFO IN PASS          ZDR35890
                          STO     P1850                                 ZDR35900
                          LD      P1590                                 ZDR35910
                          S       P1600        DECR SPACE CNT           ZDR35920
                          STO     P1590      STORE BACK NEW CNT         ZDR35930
                          BSC  L  P1620,+    DECR ISS CTR+EXIT IF ZERO, ZDR35940
                          XIO     P1680     *ELSE KEEP SPACING          ZDR35950
                    *                                                   ZDR35960
                    *CONTINUE CHK IF NOT SKIP OR SPACE REQUEST          ZDR35970
                    *                                                   ZDR35980
                    P1640 LD      P1800       PUT DSW IN PASS           ZDR35990
                          OR      P1850                                 ZDR36000
                          STO     P1850                                 ZDR36010
                          BSC  L  P1650,-     IS 11.2 MS PTR INTPRT BIT ZDR36020
                          LD      P1840     YES,CHK IF DOING 47 IDLES   ZDR36030
                          BSC  L  P1660,Z    YES,GO DECR CNT AND EXIT   ZDR36040
                          LD      P1800       NO                        ZDR36050
                          SLA     4         DID PRESENT SCAN FINISH     ZDR36060
                          BSC  L  P1700,-    YES,BR                     ZDR36070
                          LD      P1820       NO, SET UP FOR IDLES      ZDR36080
                          STO     P1840                                 ZDR36090
                          BSI     P1860                                 ZDR36100
                          MDX  L  $SCAN+7,1 SET SCAN COMPLETE INDR      ZDR36110
                    P1650 EQU     *                                2-11 ZDR36120
                          BSC  I  P1010      TO USER VIA ILS SUBR       ZDR36130
                    *                                                   ZDR36140
                    *IF INCOMPLETE SCAN OCCURRED, DO 47 IDLES TO GET    ZDR36150
                    *THE PRINT WHEEL BACK TO TRY SAME CHAR AGAIN.       ZDR36160
                    *                                                   ZDR36170
                    P1660 S       P1600        DECR CTR46               ZDR36180
                          STO     P1840                                 ZDR36190
                          MDX     P1650       EXIT VIA ILS 01.          ZDR36200
                    *                                                   ZDR36210
                    *CONSTANTS AND BUFFER AREA                          ZDR36220
                    *                                                   ZDR36230
                    P1670 DC      /8000     SIGN BIT                    ZDR36240
                          BSS  E  0                                     ZDR36250
                    P1680 DC      /8080     STG FOR CHAN 1 MASK CON     ZDR36260
                          DC      /3401     CARRIAGE SPACE IOCC         ZDR36270
                    P1690 DC      *-*       CTR TO LIMIT LOOPS-CHAN CHK ZDR36280
                          DC      /3402     STOP CARRIAGE IOCC          ZDR36290
                    *                                                   ZDR36300
                    *BEGIN PRINT MASK SET UP                            ZDR36310
                    *                                                   ZDR36320
                    P1700 LD   L  P1330     IS FORMAL PR FINISHED       ZDR36330
                          BSC  L  P1190,Z    NO,GO READ EMITTER AND SET ZDR36340
                    *                       UP SCAN FIELD FOR NEXT CHAR ZDR36350
                          BSI     P1860     YES,CLEAR SCAN FIELD        ZDR36360
                          MDX  L  $SCAN+7,1 SET SCAN COMPLETE INDR      ZDR36370
                          LD      P1500     ARE IDLE CYCLES DONE        ZDR36380
                          BSC  L  P1710,Z    NO,GO DECR IDLE CNT        ZDR36390
                          STO     P1850      YES,CLEAR PASS             ZDR36400
                          MDX  L  P1510,-6   DECR 2-CTR                 ZDR36410
                          MDX     P1650       TO USER IF NOT ZERO YET   ZDR36420
                          XIO     P1810     IF ZERO,CUT OFF INTRPTS     ZDR36430
                          MDX  L  $IOCT,-1  DECREMENT IOCS COUNTER      ZDR36440
                          MDX     P1650       TO USER                   ZDR36450
                          MDX     P1650       TO USER IF SKIP           ZDR36460
                    *                                                   ZDR36470
                    *TAKE CARE OF 16 IDLES CNT AFTER PRINT COMPLETE     ZDR36480
                    *                                                   ZDR36490
                    P1710 MDX  L  P1500,-3  DECR IDLE CNT FOR 1 IDLE    ZDR36500
                          MDX     P1650       EXIT IF NOT DONE          ZDR36510
                          LD      P1590      DONE,GET SPACE/SKIP INDR   ZDR36520
                          BSC  L  P1730,Z    IS POST-PR SPACE/SKIP ASKE ZDR36530
                          LD   L  P1520     NO,GET THE CONTROL WD       ZDR36540
                          SLA     11        ALL ZERO IF SPACE 1 LINE    ZDR36550
                          SRA     15        ALL ONES IF SUPPRESS SPACE  ZDR36560
                          EOR     P1600        CHANGE 0 TO 1, -1 TO -2  ZDR36570
                          STO     P1590      PTV--SET SPACE.NEG--INHIBI ZDR36580
                    *                                                   ZDR36590
                    *THIS SECTION SETS UP THE SPACE OR SKIP AFTER PRINT ZDR36600
                    *                                                   ZDR36610
                    P1730 STO     P1570     SET INDR OFF (+ OR -)       ZDR36620
                          LD      P1850      GET CHANNEL INDR           ZDR36630
                          BSC  L  P1760,E   IF ODD,CHAN 12 WAS PASSED   ZDR36640
                          SRA     1                                     ZDR36650
                          BSC  L  P1770,E   IF ODD,CHAN 9 WAS PASSED    ZDR36660
                    P1740 LD      P1590      IF 9/12 NOT PASSED,START   ZDR36670
                          BSC     +-        AFTER SPACE/SKIP IF PRESENT ZDR36680
                          MDX     P1650       TO USER IF NO SPACE/SKIP  ZDR36690
                          BSC  L  P1790,+Z   IS A SPACE CALLED FOR      ZDR36700
                          XIO     P1680     YES,START THE CARRIAGE      ZDR36710
                    P1750 MDX  L  $IOCT,1   INCR THE ISS CTR            ZDR36720
                          NOP               MAY SKIP                    ZDR36730
                          MDX     P1650       EXIT TO USER              ZDR36740
                    *                                                   ZDR36750
                    P1760 LD      P1810     LD ACC W/A CON OF 4         ZDR36760
                          MDX     P1770+1   GO TO USER ERROR RTN        ZDR36770
                    P1770 LD      P1550        LD ACC W/A CON OF 3      ZDR36780
                          BSI  I  *-*       GO TO USER ERROR RTN        ZDR36790
                          BSC  L  P1740,+-   TAKE NO ACTION IF CLEARED, ZDR36800
                          LD      P1680     ELSE SET UP SKIP TO CHAN 1  ZDR36810
                          STO     P1590                                 ZDR36820
                    P1790 XIO     P1580     A SKIP ASKED.START CARRIAGE ZDR36830
                          MDX     P1750       GO INCR ISS CTR,EXIT      ZDR36840
                    *                                                   ZDR36850
                    *CONSTANTS AND BUFFER AREA                          ZDR36860
                    *                                                   ZDR36870
                    P1800 DC      *-*       DVC STATUS WD STG           ZDR36880
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR36890
                    P1810 DC      4         ERROR CODE FOR CHAN 12 PASS ZDR36900
                          DC      /3440     STOP PRINTER IOCC           ZDR36910
                    P1820 DC      46        CTR CON FOR 47 IDLES        ZDR36920
                    P1830 DC      /3701     SENSE W/RESET IOCC          ZDR36930
                    P1840 DC      *-*       CTR FOR IDLES               ZDR36940
                    P1850 DC      *-*       STG FOR CARRIAGE STATUS     ZDR36950
                    *                                                   ZDR36960
                    *THIS SECTION CLEARS THE PRINT SCAN FIELD   (32-39) ZDR36970
                    *                                                   ZDR36980
                    P1860 DC      *-*       SAVE RET ADDR               ZDR36990
                          SLT     32        CLEAR A AND Q REGS          ZDR37000
                          LDX   2 -8        SET CTR FOR 4 PASSES        ZDR37010
                    P1870 STD  L2 $SCAN+8   CLEAR 2 WDS                 ZDR37020
                          MDX   2 2         DECR XR2 BY 2               ZDR37030
                          MDX     P1870       RET IF NOT ZERO           ZDR37040
                          BSC  I  P1860     RET                         ZDR37050
                          HDNG    PRNT3,LIBRARY SUBR FOR 1403 PRINTER   ZDR37070
                    *************************************************** ZDR37080
                    *STATUS-VERSION 2,MODIFICATION 5                  * ZDR37090
                    *FUNCTION/OPERATION- THIS IS A LIBRARY SUBROUTINE * ZDR37100
                    *FOR THE 1130 DISK MONITOR VERSION 2.THIS SUBR.   * ZDR37110
                    *SUPPORTS THE 1403 PRINTER. ALL 1403 PRINTER      * ZDR37120
                    *FUNCTION SUCH AS PRINTING,SPACING AND SKIPPING   * ZDR37130
                    *INTERRUPT SERVICE SUBROUTINE(ISS) AND IS         * ZDR37140
                    *ORGANIZED IN TWO SECTIONS-- A CALL PORTION AND AN* ZDR37150
                    *INTERRUPT PORTION.IN THE CALL PORTION THE FUNC-  * ZDR37160
                    *TION IS ANALYZED AND THE REQUIRED OPERATION(S)   * ZDR37170
                    *INITIATED.THE INTERRUPT PORTION THE THREE 1403   * ZDR37180
                    *INTERRUPTS,TRANSFER COMPLETE,PRINT COMPLETE AND  * ZDR37190
                    *CARRIAGE,ARE SERVICED                            * ZDR37200
                    *                                                 * ZDR37210
                    *ENTRY POINTS-                                    * ZDR37220
                    *     *PRNT3,THIS IS THE ENTRY FOR THE CALL       * ZDR37230
                    *      PORTION,THE CALLING SEQUENCE USED BY THE   * ZDR37240
                    *      USER IS THE STANDARD ISS LIBF STATEMENT.FOR* ZDR37250
                    *      A PRINT FUNCTION THE CALLING SEQUENCE IS-  * ZDR37260
                    *          *LIBF    PRNT3                         * ZDR37270
                    *           DC      /2000 (CONTROL PARAMETER)     * ZDR37280
                    *           DC      /AREA (ADDRESS OF I/O AREA)   * ZDR37290
                    *           DC      ERROR (ADDRESS OF ERROR SUBR) * ZDR37300
                    *     *W3020--THIS IS THE INTERRUPT ENTRANCE FROM * ZDR37310
                    *      THE SYSTEM ILS SUBROUTINE.                 * ZDR37320
                    *                                                 * ZDR37330
                    *INPUT-A WORD-COUNT PRECEDING DATA TO BE PRINTED  * ZDR37340
                    *ARRANGED IN 1403 PRINTER CODE.                   * ZDR37350
                    *                                                 * ZDR37360
                    *OUTPUT-A PRINTED LINE AND ONE SPACE(PRINT FUNC)  * ZDR37370
                    *                                                 * ZDR37380
                    *EXTERNAL REFERENCES-THE FOLLOWING WORDS IN COMMA * ZDR37390
                    *ARE REFERENCED--                                 * ZDR37400
                    *     $PRET   PRE-OPERATIVE ERROR TRAP            * ZDR37410
                    *     $IOCT   IOCS COUNTER                        * ZDR37420
                    *     $PST4   LEVEL 4 POST-OPERATIVE ERROR TRAP   * ZDR37430
                    *                                                 * ZDR37440
                    *EXITS- NORMAL                                    * ZDR37450
                    *     *CALL PORTION-- W3160 RETURN TO USER PROGRAM* ZDR37460
                    *     *INTERRUPT PORTION--W3800 RETURN TO ILS     * ZDR37470
                    *     - ERROR                                     * ZDR37480
                    *     *CALL PORTION--W3420 AND W3440 PRE-OPERATIVE* ZDR37490
                    *      ERROR EXITS TO $PRET.                      * ZDR37500
                    *     *INTERRUPT PORTION--W3780,TO USER ERROR SUBR* ZDR37510
                    *                                                 * ZDR37520
                    *TABLES,WORK AREAS- W3920,A 60-WORD OUTPUT BUFFER * ZDR37530
                    *INTO WHICH THE USERS MESSAGE IS TRANSFERRED.     * ZDR37540
                    *ALL PRINTING IS DONE FROM THIS OUTPUT BUFFER.    * ZDR37550
                    *                                                 * ZDR37560
                    *ATTRIBUTES-REUSABLE                              * ZDR37570
                    *                                                 * ZDR37580
                    *NOTES--SINCE THE 1403 ALWAYS PRINTS A FULL LINE  * ZDR37590
                    *OF 120 CHARACTERS,THIS SUBROUTINE STORES THE     * ZDR37600
                    *USERS MESSAGE INTO ITS OWN BUFFER TO THE LIMIT   * ZDR37610
                    *OF THE USERS WORD-COUNT,THE REMAINDER OF THE     * ZDR37620
                    *BUFFER IS PADDED WITH 1403 BLANK CHARACTERS.     * ZDR37630
                    *                                                 * ZDR37640
                    *************************************************** ZDR37650
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR37660
                    PRNT3 DC      *-*       ENTRY POINT                 ZDR37670
                          STX   1 W3060+1   SAVE CONTENTS OF XR1        ZDR37680
                          LDX  I1 PRNT3                                 ZDR37690
                          MDX     W3020     BRANCH TO CALL PROCESSING.  ZDR37700
                    W3010 DC      *-*       INTERRUPT ENTRANCE.         ZDR37710
                          BSC  L  W3500     BR. TO INTRPT PROCESSING.   ZDR37720
                    *************************************************** ZDR37730
                    *                                                 * ZDR37740
                    *     PRINT3 CALL PROCESSING.                     * ZDR37750
                    *                                                 * ZDR37760
                    *************************************************** ZDR37770
                    W3020 STX   2 W3050+1   SAVE CONTENTS OF XR2.       ZDR37780
                          STS     W3070     SAVE STATUS OF INDICATORS.  ZDR37790
                          STD     W3905     SAVE CONTENTS OF ACC/EXT.   ZDR37800
                    **                                              2-4 ZDR37810
                    * CHECK PRINTER READY                           2-4 ZDR37820
                    **                                              2-4 ZDR37830
                          XIO     W3920     SENSE DSW WITHOUT RESET 2-4 ZDR37840
                          BSC  L  W3210,E   BR IF NOT READY         2-4 ZDR37850
                    **                                                  ZDR37860
                    * CHECK TO SEE IF FUNCTION IS TEST.                 ZDR37870
                    **                                                  ZDR37880
                          LD    1 0         LOAD CONTROL PARAMETER.     ZDR37890
                          SRT     12        EXAMINE FUNCTION CODE.      ZDR37900
                          BSC  L  W3090,Z   BR IF FUNCTION IS NOT TEST. ZDR37910
                          MDX  L  W3935,0   SKIP IF ROUTINE IS NOT BUSY ZDR37920
                    W3030 MDX   1 -1                                    ZDR37930
                          MDX   1 2                                     ZDR37940
                    **                                                  ZDR37950
                    * THE FOLLOWING INSTRUCTIONS RESET THE REGISTERS    ZDR37960
                    * PRIOR TO RETURNING TO THE USERS MAINLINE.         ZDR37970
                    **                                                  ZDR37980
                          LDD     W3905     RESTORE ACCUMULATOR AND EXT ZDR37990
                    W3040 STX   1 W3080+1   STORE RETURN ADDRESS.       ZDR38000
                    W3050 LDX  L2 *-*       RESET XR2 TO ORIG CONTENTS. ZDR38010
                    W3060 LDX  L1 *-*       RESET XR1 TO ORIG CONTENTS. ZDR38020
                    W3070 LDS     *-*       RESTORE OVERFLOW AND CARRY. ZDR38030
                    W3080 BSC  L  *-*       RETURN TO USER.             ZDR38040
                    **                                              2-3 ZDR38050
                    * CHECK PRINTER READY AND ROUTINE BUSY          2-3 ZDR38060
                    **                                              2-3 ZDR38070
                    W3085 DC      *-*                               2-3 ZDR38080
                    W3087 XIO     W3920     SENSE THE DSW           2-3 ZDR38090
                          BSC  L  W3210,E   BR IF PRINTER NOT READY 2-3 ZDR38100
                          MDX  L  W3935,0   SKIP IF RTN IS NOT BUSY 2-3 ZDR38110
                          MDX     W3087     RTN BUSY GO CHECK READY 2-3 ZDR38120
                          BSC  I  W3085     RETURN                  2-3 ZDR38130
                    **                                                  ZDR38140
                    * CHECK TO SEE IF FUNCTION IS LEGAL.                ZDR38150
                    **                                                  ZDR38160
                    W3090 LDX   2 16                                    ZDR38170
                          SLCA  2                                       ZDR38180
                          MDX   2 -1        SKIP IF FUNCTION CODE IS 1. ZDR38190
                          MDX   2 -1        SKIP IF FUNCTION CODE LEGAL ZDR38200
                          MDX     W3200     BRANCH TO PRE-OP ERROR EXIT ZDR38210
                    *                       CHECK ROUTINE BUSY MOVED2-3 ZDR38220
                          SLA     2                                     ZDR38230
                          BSI     W3085     CHECK RDY AND RTN BUSY  2-3 ZDR38240
                          BSC     C         SKIP IF FUNCTION IS PRINT.  ZDR38250
                          MDX     W3190     BR TO CONTROL PROCESSING.   ZDR38260
                    **                                                  ZDR38270
                    * SET UP AND INITIATE THE PRINT OPERATION.          ZDR38280
                    **                                                  ZDR38290
                          LD    1 1         LOAD ADDR OF USERS I/O AREA ZDR38300
                          STO     W3130+1                               ZDR38310
                          STO     W3120+1                               ZDR38320
                          RTE     12        ISOLATE AND SAVE            ZDR38330
                    W3100 SRA     12        * THIRD DIGIT OF            ZDR38340
                          STO     W3920     *   CONTROL PARAMETER.      ZDR38350
                          SRA     1         SHIFT OUT LOW ORDER BIT.    ZDR38360
                          BSC  L  W3200,Z   BR IF ILLEGAL CHARACTER.    ZDR38370
                          LDX   2 60        LOAD XR2 WITH BUFFER WD CNT ZDR38380
                          LDD     W3915     FILL                        ZDR38390
                    W3110 STD  L2 W3990-2   * OUTPUT                    ZDR38400
                          MDX   2 -2        *   BUFFER                  ZDR38410
                          MDX     W3110     *     WITH SPACES.          ZDR38420
                    **                                                  ZDR38430
                    * CHECK USERS WORD COUNT                            ZDR38440
                    **                                                  ZDR38450
                    W3120 LDX  I2 *-*       LOAD XR2 WITH WORD COUNT.   ZDR38460
                          MDX   2 0         SKIP IF WORD COUNT IS ZERO. ZDR38470
                          MDX   2 -60       SKIP IF WORD COUNT IS LEGAL ZDR38480
                          MDX     W3200     BRANCH TO PRE-OP ERROR EXIT ZDR38490
                          MDX   2 60        RESTORE XR2 TO WORD COUNT.  ZDR38500
                          NOP               IN CASE OF SKIP.            ZDR38510
                    *     *                                             ZDR38520
                    W3130 LD   L2 *-*       MOVE USERS                  ZDR38530
                          STO  L2 W3990-1   * MESSAGE                   ZDR38540
                          MDX   2 -1        *   TO OUTPUT               ZDR38550
                          MDX     W3130     *     BUFFER.               ZDR38560
                    *     *                                             ZDR38570
                          LD    1 2         STORE ADDR OF USERS ERR RTN ZDR38580
                          STO  L  W3580+1   *IN INTRPT PROCESSING AREA. ZDR38590
                          BSI     W3085     CHK RDY AND RTN BSY     2-4 ZDR38600
                          BSI     W3300     BR TO INCR BUSY/IOCT CNT2-3 ZDR38610
                          XIO     W3940     INITIATE PRINT OPERATION.   ZDR38620
                          MDX   1 2         SET TO EXIT AT LIBF +4      ZDR38630
                          LD      W3930     IS THERE CONTROL AFTER PRNT ZDR38640
                    W3140 BSC  L  W3030,+-  BR IF NO CONTROL AFTER PRNT ZDR38650
                          LD      W3930     THIRD DIGIT TO ACC      2-4 ZDR38660
                    **                                                  ZDR38670
                    * SET UP THE CARRIAGE CONTROL FUNCTION REQUESTED BY ZDR38680
                    * THE USER IN THE CARRIAGE CONTROL IOCC WORD - THEN ZDR38690
                    * EXECUTE THE CONTROL FUNCTION.                     ZDR38700
                    **                                                  ZDR38710
                    W3150 A       W3985     SET UP FOR POSSIBLE         ZDR38720
                          STO     W3160     *CARRIAGE SKIP.             ZDR38730
                          S       W3100                                 ZDR38740
                          BSC  L  W3170,Z-  BR IF CONTROL IS SPACING.   ZDR38750
                          LD      W3980     SET UP                      ZDR38760
                    W3160 SRA     *-*       * IOCC WORD                 ZDR38770
                          STO     W3950     *   FOR SKIP.           2-2 ZDR38780
                          S       W3925     SET                     2-5 ZDR38790
                          BSC     +-        *SWITCH IF              2-5 ZDR38800
                          STX     W3979     *SKIP TO CHANNEL 1      2-5 ZDR38810
                          LDX   2 -2        SKIP OVER NEXT WORD.        ZDR38820
                          LD      W3900     SET CARRIAGE CONTROL        ZDR38830
                    W3170 STO     W3930     *COUNTER TO ONE.            ZDR38840
                    * PREPARE RETURN FROM $PRET IF PRINTER NOT READY    ZDR38850
                    W3180 STX   1 W3184+1   SAVE XR1                2-4 ZDR38860
                          STX     W3182+1   SET RETURN ADDR IF      2-4 ZDR38870
                    W3182 LDX  L1 *-*       *PRINTER NOT READY      2-4 ZDR38880
                          MDX   1 5                                 2-5 ZDR38890
                          STX   2 W3185+1   SAVE XR2                2-5 ZDR38900
                          BSI     W3085     CHECK RDY AND RTN BUSY  2-4 ZDR38910
                    W3184 LDX  L1 *-*       RESTORE XR1             2-4 ZDR38920
                    W3185 LDX  L2 *-*       RESTORE XR2             2-5 ZDR38930
                    *     *                                             ZDR38940
                          BSI     W3300     BR TO INCR BUSY/IOCT CNT2-2 ZDR38950
                          XIO  L2 W3950     INITIATE THE CONTROL FUNC.  ZDR38960
                          MDX  L  W3930,-1  SKIP IF NO MORE CONTROL.    ZDR38970
                          MDX     W3180     BRANCH FOR MORE CONTROL.    ZDR38980
                          MDX     W3030     BRANCH TO RETURN TO USER    ZDR38990
                    *     *                                             ZDR39000
                    W3190 SLA     16         CLEAR ACC              2-3 ZDR39010
                          SLT     4                                     ZDR39020
                          BSC  L  W3150,Z   BR IF CONTROL IS IMMEDIATE. ZDR39030
                          SLT     4         MOVE IN AND SAVE THIRD      ZDR39040
                          STO     W3930     *DIGIT OF CONTROL PARAMETER ZDR39050
                          MDX     W3030     BRANCH TO RETURN TO USER.   ZDR39060
                    **                                                  ZDR39070
                    * SET UP FOR PRE-OPERATIVE ERROR EXIT.              ZDR39080
                    **                                                  ZDR39090
                    W3200 LD      W3955     LOAD BAD CALL ERROR CODE.   ZDR39100
                          MDX     *+1       SKIP OVER NEXT INSTRUCTION. ZDR39110
                    W3210 LD      W3960     LOAD NOT READY ERROR CODE.  ZDR39120
                          MDX   1 -2        PUT ADDRESS OF CALL IN XR1. ZDR39130
                          STX  L1 $PRET     STORE CALL ADDR AT $PRET.   ZDR39140
                          LDX   1 $PRET+1   SET UP EXIT TO $PRET+1.     ZDR39150
                          MDX     W3040     BRANCH TO EXIT TO $PRET.    ZDR39160
                    *     *                                             ZDR39170
                    W3905 BSS  E  2         WORDS FOR SAVING ACC/EXT.   ZDR39180
                    W3920 DC      *-*       SENSE                       ZDR39190
                          DC      /AF00     *IOCC.                      ZDR39200
                    W3910 DC      /8600     POSSIBLE PRINT ERROR BITS.  ZDR39210
                    W3915 DC      /7F7F     SPACE - 1403 CODE.          ZDR39220
                    W3925 DC      /0800     SKIP TO CH 1 CONTROL WORD.  ZDR39230
                          DC      /AF01     WRD 2 OF SENSE W/RESET IOCC ZDR39240
                    W3930 DC      *-*       AFTER PRINT CONTROL FLAG.   ZDR39250
                    W3935 DC      *-*       ROUTINE BUSY INDICATOR.     ZDR39260
                    W3940 DC      W3990     PRINT                       ZDR39270
                          DC      /AD00     *IOCC.                      ZDR39280
                    W3945 DC      W3950     CARRIAGE                    ZDR39290
                          DC      /A900     *SKIP IOCC.                 ZDR39300
                    W3950 DC      *-*       CARRIAGE                    ZDR39310
                          DC      /AC00     *SPACE IOCC.                ZDR39320
                    W3900 DC      1         CONSTANT OF DECIMAL ONE     ZDR39330
                    W3955 DC      /9001     BAD CALL ERROR CODE.        ZDR39340
                    W3960 DC      /9000     PRINTER NOT RDY ERROR CODE. ZDR39350
                    W3965 DC      *-*       CHANNEL 9/12 INDICATOR  2-2 ZDR39360
                    W3970 DC      *-*       DSW TO CHECK AN INTRPT  2-3 ZDR39370
                    W3975 DC      *-*       DSW SAVED FOR ERR CHECK 2-2 ZDR39380
                    W3979 DC      *-*       CHANNEL 1 SWITCH        2-5 ZDR39390
                    *                                               2-2 ZDR39400
                    * SUBROUTINE FOR INCREMENTING BUSY AND IOCT CNTR2-2 ZDR39410
                    *                                               2-2 ZDR39420
                    W3300 DC      *-*       ENTRY POINT             2-2 ZDR39430
                          MDX  L  W3935,1   INCREMENT RTN BUSY COUNTER. ZDR39440
                          MDX  L  $IOCT,1   INCREMENT SYS I/O COUNTER.  ZDR39450
                          BSC  I  W3300     RETURN                  2-2 ZDR39460
                    *************************************************** ZDR39470
                    *                                                 * ZDR39480
                    *     PRNT3 INTERRUPT PROCESSING.                 * ZDR39490
                    *                                                 * ZDR39500
                    *************************************************** ZDR39510
                    W3500 XIO     W3920     SENSE WITHOUT RESET     2-3 ZDR39520
                          OR      W3975     COMBINE AND SAVE DSW    2-2 ZDR39530
                          STO     W3975     *FOR ERR CHECKING       2-2 ZDR39540
                          XIO     W3925     SENSE WITH RESET        2-3 ZDR39550
                          STO     W3970     SAVE CURRENT DSW        2-3 ZDR39560
                    *                                               2-2 ZDR39570
                    * TRANSFER COMPLETE INTERRUPT                   2-2 ZDR39580
                    *                                               2-2 ZDR39590
                          SLA     1         CHECK IF TRANS COMP INTRPT. ZDR39600
                          BSC  L  W3510,-   BR IF NOT TRANS COMP INTRPT ZDR39610
                          LDX   2 1                                 2-2 ZDR39620
                          LD      W3965     GET CHAN 9/12 INDICATOR 2-2 ZDR39630
                          BSC  L  W3580,Z   *BR IF SENSED IN PREV OP2-2 ZDR39640
                    W3505 LD      W3930     SEE IF USER WANTED TO       ZDR39650
                          OR      W3920     *PRINT WITH SPACE SUPPRESS. ZDR39660
                          BSC  L  W3510,Z   BR IF SPACE SUPPRESSED  2-2 ZDR39670
                          LDX   2 3                                 2-2 ZDR39680
                          MDX     W3590     BRANCH TO SPACE         2-2 ZDR39690
                    *                                               2-2 ZDR39700
                    * PRINT COMPLETE INTERRUPT                      2-2 ZDR39710
                    *                                               2-2 ZDR39720
                    W3510 LD      W3970     CHECK IF PR COMP INTRPT 2-3 ZDR39730
                          SLA     2                                     ZDR39740
                          BSC  L  W3550,-   BR IF NOT PRINT COMP INTRPT ZDR39750
                          LDX   2 -1                                2-2 ZDR39760
                          LD      W3975     GET THE DSW             2-2 ZDR39770
                          AND     W3910     CHECK FOR ANY ERRORS.       ZDR39780
                          BSC  L  W3570,Z   BR IF THERE WAS AN ERROR.   ZDR39790
                    *                                                   ZDR39800
                    W3520 MDX  L  W3935,-1  DECREMENT RTN BUSY COUNTER. ZDR39810
                    W3980 NOP               IN CASE OF SKIP.            ZDR39820
                          MDX  L  $IOCT,-1  DECREMENT SYS I/O COUNTER.  ZDR39830
                    W3985 SRA     0         NOP - IN CASE OF SKIP.      ZDR39840
                    *     *                                             ZDR39850
                    *                                               2-2 ZDR39860
                    * CARRAGE COMPLETE INTERRUPT                    2-2 ZDR39870
                    *                                               2-2 ZDR39880
                    W3550 LD      W3970     GET CURRENT DSW         2-3 ZDR39890
                          SLA     3         CHECK IF CARRIAGE INT       ZDR39900
                          BSC  I  W3010,-   BR IF NO CARRIAGE INT   2-2 ZDR39910
                          LDX   2 3                                     ZDR39920
                          STX   2 W3970     CLEAR CURRENT DSW       2-3 ZDR39930
                          SLA     9         CHECK IF CH 9 OR 12 FOUND.  ZDR39940
                          BSC  L  W3560,C   BRANCH IF CHANNEL 9 FOUND.  ZDR39950
                          BSC  L  W3565,-   BR IF CHANNEL 12 NOT FOUND. ZDR39960
                          MDX   2 1         SET W3965 WITH 3 IF CHAN2-2 ZDR39970
                    W3560 STX   2 W3965     *9, WITH 4 IF CHAN 12   2-2 ZDR39980
                    W3565 LD      W3979                             2-5 ZDR39990
                          BSC  L  W3520,+-                          2-5 ZDR40000
                          SLA     16        IF SKIP TO CHANNEL 1 WAS2-5 ZDR40010
                          STO     W3979     *THE LAST CARRIAGE OP   2-5 ZDR40020
                          STO     W3965     *THEN RESET CH 1 ,CH12  2-5 ZDR40030
                          MDX     W3520     RETURN                      ZDR40040
                    *                                               2-2 ZDR40050
                    * SET UP ACK WITH  ERROR CODE AND BRANCH TO USER2-2 ZDR40060
                    * ERROR ROUTINE.                                2-2 ZDR40070
                    *                                               2-2 ZDR40080
                    W3570 EOR     W3975     CLEAR THE ERROR BITS    2-2 ZDR40090
                          STO     W3975     *AND SAVE THE DSW       2-2 ZDR40100
                          LD      W3900     GET ERROR CODE          2-2 ZDR40110
                    W3580 BSI  L  *-*       BR TO USERS ERROR ROUTINE.  ZDR40120
                          BSC  L  W3600,+-  BRANCH IF IGNORE ERROR.     ZDR40130
                    W3590 XIO     W3920     SENSE THE PRINTER.          ZDR40140
                          BSC  L  W3610,E   BRANCH IF PRINTER NOT READY ZDR40150
                          SRA     2         CHECK IF CARRIAGE BUSY  2-2 ZDR40160
                          BSC  L  W3590,E    *BR IF YES             2-2 ZDR40170
                          LD      W3925     LOAD SKIP TO CH 1 CNTRL WRD ZDR40180
                          STO     W3950     *AND STORE IN CNTRL IOCC.   ZDR40190
                    *                                               2-2 ZDR40200
                    * EXECUTE A SKIP IF XR2=1, SPACE IF XR2=2,      2-2 ZDR40210
                    * PRINT IF XR2=-1                               2-2 ZDR40220
                    *                                               2-2 ZDR40230
                          BSI     W3300     BR TO INCT BUSY/IOCT CNT2-3 ZDR40240
                          XIO  L2 W3945-1   INITIATE SKIP OR PRINT.     ZDR40250
                    *                                                   ZDR40260
                          MDX   2 -1        IF A SKIP TO CHAN 1 WAS 2-2 ZDR40270
                          MDX     W3510     *EXEC ABOVE, RESET      2-2 ZDR40280
                          STX   2 W3965     *CHAN 9/12 INDICATOR    2-2 ZDR40290
                          MDX     W3510     *TO ZERO                2-2 ZDR40300
                    *                                                   ZDR40310
                    W3600 MDX   2 -1        DID USER SUPPRESS SKIP  2-3 ZDR40320
                          MDX     W3510     *BR IF NO               2-3 ZDR40330
                          STX   2 W3965     *RESET CH 9/12 SWITCH   2-3 ZDR40340
                          MDX     W3505     GO TEST IF SPACE AFTER P2-3 ZDR40350
                    *                                                   ZDR40360
                    W3610 LD      W3960     LOAD NOT READY ERROR CODE.  ZDR40370
                          BSI  L  $PST4     BR TO POST-OP NT RDY WAIT.  ZDR40380
                          MDX     W3590     BRANCH TO SENSE PRINTER.    ZDR40390
                    *     *                                             ZDR40400
                    *     *                                             ZDR40410
                    W3990 EQU     PRNT1+'SCNT+2    OUTPUT BUFFER   2-10 ZDR40420
                    ENDXX EQU     'SCNT+1+PRNT3    BUFFER END ADDR 2-10 ZDR40430
                          HDNG    INITIALIZATION, COMMON SUBROUTINES    ZDR40440
                    BADCS EQU     ENDXX+1                               ZDR40450
                    CR990 EQU     PRNT1     SOURCE SECTOR BUFFER        ZDR40460
                    CR992 EQU     PRNT3     OBJECT SECTOR BUFFER        ZDR40470
                    *                                                   ZDR40480
                    * INITIALIZATION. THIS CODE IS EXECUTED ONLY ONCE   ZDR40490
                    * AFTER DCIP IS LOADED INTO CORE. NOTE THAT IT      ZDR40500
                    * RESIDES IN ONE OF THE DISK BUFFERS AND IS CON-    ZDR40510
                    * SEQUENTLY OVERLAID DURING DISK OPERATIONS.        ZDR40520
                    *                                                   ZDR40530
                    BEGIN DC      *-*       ENTRY POINT                 ZDR40540
                          LDX  L1 IX000     SET UP ITV ENTRY FOR LEVEL  ZDR40550
                          STX  L1 $LEV1     *1 TO GO TO ILS FOR LEVEL 1 ZDR40560
                          LDX  L1 $I200     SET UP ITV ENTRY FOR LEVEL  ZDR40570
                          STX  L1 $LEV2     *2 TO GO TO ECS FOR LEVEL 2 ZDR40580
                          LDX  L1 $I400     SET UP ITV ENTRY FOR LEVEL  ZDR40590
                          STX  L1 $LEV4     *4 TO GO TO ILS FOR LEVEL 4 ZDR40600
                          LDX  L1 $STOP     SET UP ITV ENTRY FOR LEVEL  ZDR40610
                          STX  L1 $LEV5     *5 TO GO TO PROG STOP TRAP  ZDR40620
                          LDX  L1 INTRQ     INITIALIZE ADDR OF INT REQ  ZDR40630
                          STX  L1 $IREQ     *SUBROUTINE                 ZDR40640
                          SRA     16        INITIALIZE                  ZDR40650
                          STO  L  $IOCT     *IOCS COUNTER TO ZERO       ZDR40660
                    *                                                   ZDR40670
                    * MOVE TRAPS TO THEIR DISK MONITOR LOCATIONS        ZDR40680
                    *                                                   ZDR40690
                    *                                                   ZDR40700
                          LDX   1 -BE940+BE935-1                        ZDR40710
                    BE050 LD   L1 BE935+4   MOVE PREOPERATIVE,          ZDR40720
                          STO  L1 $PRET+4   *POSTOPERATIVE, AND         ZDR40730
                          LD   L1 BE940+4   *PROGRAM STOP KEY           ZDR40740
                          STO  L1 $PST1+4   *TRAPS TO THE SAME          ZDR40750
                          LD   L1 BE945+4   *LOCATIONS THEY OCCUPY      ZDR40760
                          STO  L1 $PST4+4   *WHEN DISK MONITOR          ZDR40770
                          LD   L1 BE950+4   *SYSTEM IS IN CONTROL       ZDR40780
                          STO  L1 $STOP+4                               ZDR40790
                          MDX   1 1         SKIP AFTER ALL TRAPS        ZDR40800
                          MDX     BE050     *MOVED, BRANCH OTHERWISE    ZDR40810
                    *                                                   ZDR40820
                    * MOVE ILS02 AND ILS04 TO DISK MONITOR LOCATIONS    ZDR40830
                    *                                                   ZDR40840
                          LDX   1 BE955-BE998                           ZDR40850
                    BE100 LD   L1 BE955-BE955+BE998                     ZDR40860
                          STO  L1 $I200-BE955+BE998                     ZDR40870
                          MDX   1 1         SKIP AFTER ILS02 AND ILS04  ZDR40880
                          MDX     BE100     *MOVED, BR OTHERWISE        ZDR40890
                          LD   L  BE998                                 ZDR40900
                          STO  L  $IBT4     SET UP ADDR OF IBT FOR LEV4 ZDR40910
                    *                                                   ZDR40920
                    * DETERMINE THE FASTEST PRINTER THAT IS PRESENT.    ZDR40930
                    * (READY IS EQUIVALENT TO PRESENT IN THIS CONTEXT.) ZDR40940
                    * INITIALIZE TO DO ANY DUMPING THAT MIGHT BE        ZDR40950
                    * REQUESTED ON THAT PRINTER. THE AREA ACCUPIED BY   ZDR40960
                    * THE 1132 SUBROUTINE WILL BE USED AS A DISK BUFFER ZDR40970
                    * IF THERE IS NO 1132 AND NO 1403, IF THERE IS      ZDR40980
                    * NO 1132 AND THERE IS A 1403, OR IF THERE IS BOTH  ZDR40990
                    * AN 1132 AND A 1403. THE 1403 SUBROUTINE AREA BE-  ZDR41000
                    * COMES THE DISK BUFFER IF THERE IS AN 1132 AND     ZDR41010
                    * NO 1403.                                          ZDR41020
                    *                                                   ZDR41030
                          LDX  L1 ENDTB     ADDR OF END OF CP CONV TBL  ZDR41040
                          STX  L1 ADDRX                                 ZDR41050
                          SRA     16        INITIALIZE PRINTER SW TO    ZDR41060
                          STO  L  SW002     *CONSOLE PRINTER SETTING    ZDR41070
                          XIO     BE900     SENSE 1403                  ZDR41080
                          BSC  L  BE150,E   *AND BRANCH IF NOT READY    ZDR41090
                          BSI  L  PRNT3     TRY TO SPACE 1 LINE ON 1403 ZDR41100
                          DC      /3D00     SKIP-A-LINE FUNCTION CODE   ZDR41110
                          XIO     BE900     SENSE TO DETERMINE IF 1403  ZDR41120
                          BSC  L  BE250,Z   *EXISTS. BRANCH IF IT DOES  ZDR41130
                    BE150 XIO     BE910     SENSE THE 1132              ZDR41140
                          SLA     5         TEST FORMS CHECK AND        ZDR41150
                          BSC  L  BE160,Z+  *BRANCH IF IT IS ON         ZDR41160
                          BSI  L  PRNT1     TRY TO SPACE ONE LINE ON    ZDR41170
                          DC      /3D00     *THE 1132                   ZDR41180
                          XIO     BE910     SENSE TO DETERMINE IF 1132  ZDR41190
                          BSC  L  BE200,Z   *EXISTS. BRANCH IF IT DOES  ZDR41200
                    BE160 LDX  L3 PRNT1     ADDR OF DISK BUFFER TO XR3  ZDR41210
                          MDX     BE350     OUTPUT TO CP. BR TO CONT.   ZDR41220
                    BE200 MDX  L  ADDRX,'HEXA                           ZDR41230
                          LDX  L3 PRNT3     ADDR OF DISK BUFFER TO XR3  ZDR41240
                          LD      BE920     FETCH ADDR OF PRNT1 ENTRY   ZDR41250
                          MDX     BE300     BR TO PRESET CALLS TO PRNT1 ZDR41260
                    BE250 LD      BE925     FETCH ADDR PRNT3 ENTRY      ZDR41270
                          LDX  L3 PRNT1     ADDR OF DISK BUFFER TO XR3  ZDR41280
                    BE300 STO  L  CALLP     SET APPROPRIATE CALL IN     ZDR41290
                          MDX  L  ADDRX,-2*'HEXA                        ZDR41300
                          STX  L0 SW002     *USE THE 1132 OR 1403       ZDR41310
                    BE350 STX  L3 BFRAD                                 ZDR41320
                          BSC  I  BEGIN     RETURN                      ZDR41330
                    *                                                   ZDR41340
                    * CONSTANTS AND WORK AREAS                          ZDR41350
                    *                                                   ZDR41360
                    BE920 DC      PRNT1     ADDR ENTRY POINT TO PRNT1   ZDR41370
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR41380
                    BE900 DC      *-*       1403 SENSE                  ZDR41390
                          DC      'I906     *DEVICE IOCC                ZDR41400
                    BE910 DC      *-*       1132 SENSE                  ZDR41410
                          DC      'I609     *DEVICE IOCC                ZDR41420
                    BE925 DC      PRNT3     ADDR ENTRY POINT TO PRNT3   ZDR41430
                    *                                                   ZDR41440
                    * TRAPS FOR USE OF DCIP. THESE TRAPS ARE IDENTICAL  ZDR41450
                    * TO AND OCCUPY SAME LOCATIONS AS THEIR DISK        ZDR41460
                    * MONITOR SYSTEM COUNTERPARTS.                      ZDR41470
                    *                                                   ZDR41480
                    BE935 DC      *-*       TRAP FOR                    ZDR41490
                          WAIT              *PREOPERATIVE               ZDR41500
                          BSC  I  $PRET     *I/O ERRORS                 ZDR41510
                    BE940 DC      *-*       TRAP FOR                    ZDR41520
                          WAIT              *POSTOPERATIVE I/O          ZDR41530
                          BSC  I  $PST1     *ERRORS ON LEVEL 1          ZDR41540
                    BE945 DC      *-*       TRAP FOR                    ZDR41550
                          WAIT              *POSTOPERATIVE I/O          ZDR41560
                          BSC  I  $PST4     *ERRORS ON LEVEL 4          ZDR41570
                    BE950 DC      *-*       PROGRAM                     ZDR41580
                          WAIT              *STOP KEY                   ZDR41590
                          BOSC I  $STOP     *TRAP                       ZDR41600
                    *                                                   ZDR41610
                    * INTERRUPT LEVEL SUBROUTINES FOR LEVELS 2 AND 4.   ZDR41620
                    * THESE SUBROUTINES ARE IDENTICAL TO AND OCCUPY THE ZDR41630
                    * SAME LOCATIONS AS THEIR DISK MONITOR SYSTEM       ZDR41640
                    * COUNTERPARTS.                                     ZDR41650
                    *                                                   ZDR41660
                    BE955 DC      *-*       ENTRY POINT                 ZDR41670
                          STX   1 BE960+1   SAVE XR1                    ZDR41680
                          STX   2 BE965+1   SAVE XR2                    ZDR41690
                          STS     BE970     SAVE STATUS                 ZDR41700
                          STD     BE975     SAVE ACC, EXT               ZDR41710
                          BSI  L  DX030     BR TO SERVICE THE INTERRUPT ZDR41720
                    BE960 LDX  L1 *-*       RESTORE XR1                 ZDR41730
                    BE965 LDX  L2 *-*       RESTORE XR2                 ZDR41740
                    BE970 LDS     0         RESTORE STATUS              ZDR41750
                          LDD     BE975     RESTORE ACC,EXT         2-8 ZDR41760
                          BOSC I  $I200     RETURN TO INTERRUPT POINT   ZDR41770
                    BE975 DC      *-*       CONTENTS OF ACCUMULATOR     ZDR41780
                          DC      *-*       CONTENTS OF EXTENSION       ZDR41790
                          DC      *-*       ENTRY POINT                 ZDR41800
                          STD     BE995     SAVE ACC, EXT               ZDR41810
                          STS     BE980     SAVE STATUS                 ZDR41820
                          STX   1 BE985+1   SAVE XR1                    ZDR41830
                          STX   2 BE990+1   SAVE XR2                    ZDR41840
                          XIO     BE996     SENSE KB/CP DSW             ZDR41850
                          SLA     2                                     ZDR41860
                          BSC  L  $I403,-   BR UNLESS INT REQ KEY       ZDR41870
                          BSI  I  $IREQ     BR TO INT REQ SUBR          ZDR41880
                          DC      -2        FOR MONITOR USE ONLY        ZDR41890
                          LDX   1 9                                     ZDR41900
                          XIO     BE997     SENSE ILSW04                ZDR41910
                          SLCA  1 0                                     ZDR41920
                          BSI  I1 *-*       BR TO SERVICE INTERRUPT     ZDR41930
                    BE980 LDS     0         RESTORE STATUS              ZDR41940
                    BE985 LDX  L1 *-*       RESTORE XR1                 ZDR41950
                    BE990 LDX  L2 *-*       RESTORE XR2                 ZDR41960
                          LDD     BE995     RESTORE ACC, EXT            ZDR41970
                          BOSC I  $I400     RETURN TO INTERRUPT POINT   ZDR41980
                          DC      *-*       CURRENT READING OF DISK DSW ZDR41990
                    BE995 DC      *-*       CONTENTS OF ACCUMULATOR     ZDR42000
                          DC      *-*       CONTENTS OF EXTENSION       ZDR42010
                    BE996 DC      *-*       IOCC FOR SENSING            ZDR42020
                          DC      /0F00     *THE KB/CP DSW          2-9 ZDR42030
                    BE997 DC      *-*       IOCC FOR SENSING            ZDR42040
                          DC      'I006     *THE ILSW                   ZDR42050
                    BE998 DC      IBT04-8   POINTER FOR LEVEL 4 IBT     ZDR42060
                          HDNG    INTERRUPT LEVEL 1 SUBROUTINE          ZDR42070
                    *                                                   ZDR42080
                    *************************************************** ZDR42090
                    * ILS FOR INTERRUPT LEVEL 1                         ZDR42100
                    *************************************************** ZDR42110
                    *                                                   ZDR42120
                    IX000 DC      *-*       ENTRY POINT                 ZDR42130
                          STX   1 IX210+1   SAVE XR1                    ZDR42140
                          STX   2 IX211+1   SAVE XR2                    ZDR42150
                          STS     IX212     SAVE STATUS                 ZDR42160
                          STD     IX213     SAVE ACC, EXT               ZDR42170
                          BSI  L  P1010     BR TO SERVICE THE INTERRUPT ZDR42180
                    IX210 LDX  L1 *-*       RESTORE XR1                 ZDR42190
                    IX211 LDX  L2 *-*       RESTORE XR2                 ZDR42200
                    IX212 LDS     0         RESTORE STATUS              ZDR42210
                          LDD     IX213     RESTORE ACC, EXT            ZDR42220
                          BOSC I  IX000     RETURN TO INTERRUPT POINT   ZDR42230
                    *                                                   ZDR42240
                    * CONSTANTS AND WORK AREAS                          ZDR42250
                    *                                                   ZDR42260
                          BSS  E  0         CREATE EVEN BOUNDARY        ZDR42270
                    IX213 DC      *-*       CONTENTS OF ACCUMULATOR     ZDR42280
                          DC      *-*       CONTENTS OF EXTENSION       ZDR42290
                          HDNG    PATCH AREA                            ZDR42300
                          BSS     4096-*    PATCH AREA                  ZDR42310
                          END     START                                 ZDR42320
