                          HDNG    DFCNV-DISK FILE CONVERSION PROGRAM    W1L00010
                    *************************************************** W1L00020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * W1L00030
                    *                                                 * W1L00040
                    *FUNCTION/OPERATION -                             * W1L00050
                    *   * THE PROGRAM CONVERTS ONE AND ONLY ONE 1130  * W1L00060
                    *     FORTRAN AND/OR COMMERCIAL SUBROUTINE        * W1L00070
                    *     PACKAGE(CSP) DISK DATA FILE TO ONE          * W1L00080
                    *     AND ONLY ONE 1130 RPG DISK DATA FILE.       * W1L00090
                    *     FORTRAN FILES CREATED USING LOGICAL UNIT    * W1L00100
                    *     NO. 10 CANNOT BE CONVERTED BY DFCNV.        * W1L00110
                    *     CONVERTED FILES CANNOT BE PROCESSED AS ISAM * W1L00120
                    *     FILES.                                      * W1L00130
                    *   * THE PROGRAM CAN OPERATE IN A STACKED JOB    * W1L00140
                    *     ENVIRONMENT.                                * W1L00150
                    *   * THE BASIC OPERATION OF THE PROGRAM IS AS    * W1L00160
                    *     FOLLOWS -                                   * W1L00170
                    *     A PARTIAL SLET SEARCH IS PERFORMED AND THE  * W1L00180
                    *     SYSTEM DEVICE SUBROUTINES FOR THE PRINCIPAL * W1L00190
                    *     INPUT AND PRINT DEVICES ARE LOADED. THE     * W1L00200
                    *     PERTINENT INTERRUPT POINTERS ARE SET. THE   * W1L00210
                    *     DFCNV CONTROL CARDS ARE READ,PRINTED AND    * W1L00220
                    *     DIAGNOSED FOR ERRORS. A COMPRESSION OF      * W1L00230
                    *     FIELD SPECIFICATIONS IS BUILT AS THE        * W1L00240
                    *     CONTROL CARDS ARE PROCESSED. FOLLOWING      * W1L00250
                    *     SUCCESSFUL PROCESSING OF DFCNV CONTROL      * W1L00260
                    *     CARDS,CONVERSION IS INITIATED. DATA TO BE   * W1L00270
                    *     CONVERTED IS READ INTO CORE AS IT IS NEEDED,* W1L00280
                    *     320 WORDS AT A TIME-EACH FIELD IS CONVERTED,* W1L00290
                    *     TEMPORARILY,SAVED IN A WORK AREA,THEN       * W1L00300
                    *     INSERTED INTO THE RPG OUTPUT BUFFER AS      * W1L00310
                    *     SPECIFIED.THE OUTPUT BUFFER IS TRANSFERRED  * W1L00320
                    *     TO DISK AS IT IS FILLED.FOLLOWING COMPLETE  * W1L00330
                    *     CONVERSION,A COMPLETION MESSAGE IS PRINTED  * W1L00340
                    *     AND CONTROL IS RETURNED TO THE SUPERVISOR   * W1L00350
                    *     VIA AN EXIT STATEMENT.                      * W1L00360
                    *ENTRY POINTS -                                   * W1L00370
                    *   * PROGRAM START - FC000                       * W1L00380
                    *INPUT -                                          * W1L00390
                    *   * DFCNV CONTROL CARDS -                       * W1L00400
                    *     ONE AND ONLY ONE FILE DESCRIPTION CARD      * W1L00410
                    *     WHICH MUST BE THE FIRST RECOGNIZABLE DFCNV  * W1L00420
                    *     CONTROL FOLLOWING THE // XEQ DFCNV CARD.    * W1L00430
                    *     THE CARD FORMAT IS DESCRIBED IN FORM        * W1L00440
                    *     C26-3717.                                   * W1L00450
                    *     ONE OR MORE FIELD SPECIFICATIONS CARDS.THE  * W1L00460
                    *     CARD FORMAT IS DESCRIBED IN FORM C26-3717.  * W1L00470
                    *     ONE CSP A3 TRANSLATION TABLE WHICH MUST     * W1L00480
                    *     BE PRESENT IF CSP-A3 FIELDS ARE TO BE       * W1L00490
                    *     CONVERTED.THE CARD FORMAT IS DESCRIBED      * W1L00500
                    *     IN FORM C26-3717.                           * W1L00510
                    *     /* CARD FOLLOWING LAST LAST DFCNV CONTROL   * W1L00520
                    *     CARD.                                       * W1L00530
                    *   * THE INPUT DISK DATA FILE OR THE CORRESPOND- * W1L00540
                    *     ING CARDS PRODUCED BY A DUP DUMPDATA OPERA- * W1L00550
                    *     TION. CARD INPUT DECK MUST IMMEDIATELY      * W1L00560
                    *     FOLLOW THE /* CARD. ACCEPTABLE INPUT DATA   * W1L00570
                    *     FORMATS ARE ALL FORTRAN AND CSP DISK DATA   * W1L00580
                    *     FORMATS AND TWO WORD INTEGERS.              * W1L00590
                    *OUTPUT -                                         * W1L00600
                    *   * THE DFCNV CONTROL CARDS,ANY DIAGNOSTIC      * W1L00610
                    *     MESSAGES,AND THE COMPLETION MESSAGE ARE     * W1L00620
                    *     PRINTED ON THE PRINCIPAL PRINT DEVICE.      * W1L00630
                    *   * THE CONVERTED RPG DISK DATA FILE IN         * W1L00640
                    *     ACCEPTABLE RPG DISK DATA FORMAT IS THE      * W1L00650
                    *     PRINCIPAL OUTPUT OF THE PROGRAM.            * W1L00660
                    *EXTERNAL REFERENCES                              * W1L00670
                    *   * SUBROUTINES -                               * W1L00680
                    *     * DISK1      DISK SUBROUTINE                * W1L00690
                    *     * FLD        SUBROUTINE TO LOAD STANDARD    * W1L00700
                    *                  PRECISION FLOATNG POINT NO.    * W1L00710
                    *                  INTO FAC.                      * W1L00720
                    *     * ELD        SUBROUTINE TO LOAD EXTENDED    * W1L00730
                    *                  PRECISION FLOATING POINT NO.   * W1L00740
                    *                  INTO FAC.                      * W1L00750
                    *     * NORM       SUBROUTINE TO NORMALIZE NO.    * W1L00760
                    *                  IN FAC.                        * W1L00770
                    *   * COMMUNICATIONS AREA -                       * W1L00780
                    *     THE FOLLOWING COMMA WORDS ARE               * W1L00790
                    *     REFERENCED -                                * W1L00800
                    *     $KCSW        KB,CONSOLE PTR SWITCH          * W1L00810
                    *     $PST4        LVL 4 I/O ERROR TRAP ADDR      * W1L00820
                    *     $LEV4        LVL 4 INTERRUPT BRANCH ADDRESS * W1L00825
                    *     $IBT4        LVL 4 INTERRUPT BRANCH TABLE   * W1L00830
                    *     $IBSY        INPUT DEVC BUSY INDR           * W1L00840
                    *     $LAST        LAST CARD SWITCH               * W1L00850
                    *     $LEV0        INTERRUPT BRANCH WORD-LVL 0    * W1L00860
                    *     $LEV0+1      INTERRUPT BRANCH WORD-LVL 1    * W1L00870
                    *     $CTSW        CONTROL CARD SWITCH            * W1L00880
                    *     $PBSY        PRINCIPAL PRINT DEVC BUSY INDR * W1L00890
                    *     $I410        ADDR OF ILS04 RESTORE SUBR     * W1L00900
                    *     $IREQ        INTERRUPT REQUEST ADDR         * W1L00910
                    *     $FPAD-$FPAD+4 FILE PROT ADDR TABLE          * W1L00920
                    *     $ULET-$ULET+4 LET ADDR TABLE                * W1L00930
                    *     FAC          FLOATING ACCUMULATOR           * W1L00940
                    *EXITS -                                          * W1L00950
                    *   * NORMAL - SEE NOTES                          * W1L00960
                    *   * ABNORMAL - SEE NOTES                        * W1L00970
                    *TABLES/WORK AREAS -                              * W1L00980
                    *   THE FOLLOWING ARE IMPORTANT INTERNAL TABLES - * W1L00990
                    *     * A3TAB    40 CHAR CSP A3 TRANSLATION TABLE * W1L01000
                    *     * COMPR    FLD SPEC COMPRESSION AREA        * W1L01010
                    *     * LOG      I/O SYST DEVC SUBR PHASE ID TABLE* W1L01020
                    *     * FC006    LVL 4 ERROR BRANCH ADDR TABLE    * W1L01030
                    *     * TABLJ    2 WD ITG ADJUSTMENT VALUE TABLE  * W1L01040
                    *     * TABL5    2 WD ITG READJUSTMENT VALUE TABLE* W1L01050
                    *   THE FOLLOWING ARE IMPORTANT INTERNAL BUFFER - * W1L01060
                    *     * BUF00    LOAD AREA FOR I/P DEVC SUBR      * W1L01070
                    *     * BUF01    LOAD AREA FOR I/P CONVERSION SUBR* W1L01080
                    *     * BUF02    LOAD AREA FOR O/P DEVC SUBR      * W1L01090
                    *     * BUF03    CARD INPUT AREA                  * W1L01100
                    *     * BUF04    CARD PRINT AREA                  * W1L01110
                    *     * BUF05    O/P DATA CONVERSION AREA         * W1L01120
                    *     * BUF06    I/P DATA CONVERSION AREA         * W1L01130
                    *   THE FOLLOWING ARE IMPORTANT INTERNAL WORK     * W1L01140
                    *   AREAS -                                       * W1L01150
                    *     * WORK1    31 WORD WORK AREA                * W1L01160
                    *     * WORK2    200 WORD WORK AREA               * W1L01170
                    *INTERNAL REFERNCES -                               W1L01180
                    *   THE FOLLOWING LABELS REFER TO MAJOR PORTIONS    W1L01190
                    *   OF PROGRAM CODE -                               W1L01200
                    *     * FC015    READ (AND PRINT) A CARD            W1L01210
                    *       FC026    PERFORM FINAL DIAGNOSTIC CHECKS    W1L01220
                    *       FC360    ACTUAL DATA CONVERSION INITIATED   W1L01230
                    *       CDDSK    CARD CODE FMT CONVERT TO DISK      W1L01240
                    *                 DATA FMT                        * W1L01250
                    *     * FILEC     FILE DESCRIPTION CARD CONVERTED * W1L01260
                    *                 AND DIAGNOSED                   * W1L01270
                    *     * SEARC     LET/FLET SEARCH SUBR            * W1L01280
                    *     * CONVT     VAR LNG DECML FLD CONVERTED TO  * W1L01290
                    *                 BINARY NO.                      * W1L01300
                    *     * FC016     FIELD SPEC CARD CONVERTED AND   * W1L01310
                    *                 DIAGNOSED                       * W1L01320
                    *     * BFLD      COMPRESSION SUBR FOR B-FLD TYPE * W1L01330
                    *     * CFLD      COMPRESSION SUBR FOR C-FLD TYPE * W1L01340
                    *     * DFLD      COMPRESSION SUBR FOR D-FLD TYPE * W1L01350
                    *     * EFLD      COMPRESSION SUBR FOR E-FLD TYPE * W1L01360
                    *     * FFLD      COMPRESSION SUBR FOR F-FLD TYPE * W1L01370
                    *     * IFLD      COMPRESSION SUBR FOR I-FLD TYPE * W1L01380
                    *     * JFLD      COMPRESSION SUBR FOR J-FLD TYPE * W1L01390
                    *     * RFLD      COMPRESSION SUBR FOR R-FLD TYPE * W1L01400
                    *     * XFLD      COMPRESSION SUBR FOR X-FLD TYPE * W1L01410
                    *     * BCNVT     CONVERSION SUBR FOR B-FLD TYPE  * W1L01420
                    *     * CCNVT     CONVERSION SUBR FOR C-FLD TYPE  * W1L01430
                    *     * DCNVT     CONVERSION SUBR FOR D-FLD TYPE  * W1L01440
                    *     * ECNVT     CONVERSION SUBR FOR E-FLD TYPE  * W1L01450
                    *     * FCNVT     CONVERSION SUBR FOR F-FLD TYPE  * W1L01460
                    *     * ICNVT     CONVERSION SUBR FOR I-FLD TYPE  * W1L01470
                    *     * JCNVT     CONVERSION SUBR FOR J-FLD TYPE  * W1L01480
                    *     * RCNVT     CONVERSION SUBR FOR R-FLD TYPE  * W1L01490
                    *     * XCNVT     CONVERSION SUBR FOR X-FLD TYPE  * W1L01500
                    *     * INSRT     SUBR TO INSERT CONVERTED FLD    * W1L01510
                    *                 INTO O/P BUFFER                 * W1L01520
                    *ATTRIBUTES -                                     * W1L01530
                    *   * RELOCATABLE                                 * W1L01540
                    *NOTES -                                          * W1L01550
                    *   * ERROR PROCEDURES -                          * W1L01560
                    *     * ALL DIAGNOSED ERRORS CAUSE PROGRAM        * W1L01570
                    *       TERMINATION PRIOR TO DATA FILE CONVERSION.* W1L01580
                    *       ANY FILE DESCRIPTION CARD ERROR CAUSES    * W1L01590
                    *       IMMEDIATE TERMINATION - NO OTHER DFCNV    * W1L01600
                    *       CARDS ARE ANALYZED. A FEW DIAGNOSED       * W1L01610
                    *       ERRORS ARE WARNING CONDITIONS ONLY - NO   * W1L01620
                    *       TERMINATION RESULTS. SEE FORM C26-3717    * W1L01630
                    *       FOR A MORE COMPLETE DESCRIPTION OF DFCNV/ * W1L01640
                    *       DIAGNOSTIC CAPABILITIES.                  * W1L01650
                    *     * FILE PROTECTION ADDRESS DELIMITERS $FPAD- * W1L01660
                    *       $FPAD+4 OF COMMA ARE TEMPORARILY MODIFIED * W1L01670
                    *       DURING THE CONVERSION PORTION OF DFCNV    * W1L01680
                    *       AS IS $IREQ. IF UNFORSEEN ERROR OCCUR     * W1L01690
                    *       DURING ACTUAL FILE CONVERSION,THESE WORDS * W1L01700
                    *       MUST BE RESTORED OR A COLD START PERFORM- * W1L01710
                    *       ED. RESTORE THE FILE PROTECTION ADDR SAVED* W1L01720
                    *       AT FC311+1 WITH CONTENTS OF FC311+2,$IREQ * W1L01730
                    *       WITH CONTENTS OF FC364.                   * W1L01740
                    *                                                 * W1L01750
**********************************************************************  W1L01760
                    *************************************************** W1L01770
                    *                                                 * W1L01780
                    *             ERROR MESSAGES                      * W1L01790
                    *                                                 * W1L01800
                    *************************************************** W1L01810
                    MESS0 DC      20                                    W1L01820
                          DMES  2     DISK DATA FILE CONVERSION COMPLE' W1L01830
                          DMES  2 TED 'E                                W1L01840
                    MESS2 DC      16                                    W1L01850
                          DMES  2 F02  FILE NAME NOT IN LET/FLET-I'E    W1L01860
                    MESS3 DC      12                                    W1L01870
                          DMES  2 F03  FILE SIZE INVALID-I'E            W1L01880
                    MESS4 DC      24                                    W1L01890
                          DMES  2 F04  INVALID FIELD SPECIFICATION SYN' W1L01900
                          DMES  2 TAX -COL.   'E                        W1L01910
                    MESS5 DC      13                                    W1L01920
                          DMES  2 F05  CSP A3 TABLE MISSING 'E          W1L01930
                    MESS6 DC      13                                    W1L01940
                          DMES  2 F06  INVALID CARD SEQUENCE'E          W1L01950
                    MESS8 DC      12                                    W1L01960
                          DMES  2 F08  CARD INPUT INVALID 'E            W1L01970
                    MESS9 DC      17                                    W1L01980
                          DMES  2 F09  OUTPUT RECORD LENGTH INVALID 'E  W1L01990
                    *                                                   W1L02000
                    *************************************************** W1L02010
                    *                                                 * W1L02020
                    *             I/O BUFFERS                         * W1L02030
                    *                                                 * W1L02040
                    *************************************************** W1L02050
                          BSS  E  0                                     W1L02060
                    BUF05 DC      320                                 E W1L02070
                          BSS     321       OUTPUT BUFFER               W1L02080
                    BUF06 DC      320                                 E W1L02090
                          BSS     375       INPUT BUFFER                W1L02100
                    BUF00 DC      640       DISK BUFFER 1         E 2-8 W1L02110
                          DC      /0003                             2-8 W1L02120
                          BSS     372                                 E W1L02130
                    BUF01 BSS     /BE       DISK BUFFER  2            E W1L02140
                    BUF02 BSS     /133      DISK BUFFER  3            E W1L02150
                          DC      80        CARD BUFFER  1              W1L02160
                    BUF03 BSS     80                                  E W1L02170
                    *                                                   W1L02180
                    *************************************************** W1L02190
                    *                                                 * W1L02200
                    *             A3 TABLE CARD PROCESSED             * W1L02210
                    *                                                 * W1L02220
                    *************************************************** W1L02230
                    A3FLD LD      A3SW                                  W1L02240
                          BSC  L  FC015,Z   BR- A-CARD IGNORED          W1L02250
                          STX     A3SW      SET A-CARD SWITCH           W1L02260
                    *                                                   W1L02270
                    *             FILL A3 CONVERSION TABLE              W1L02280
                    *                                                   W1L02290
                    FC021 LDX   1 40        SET CHAR CNT                W1L02300
                          LD   L1 BUF03-1   RETRIEVE CHAR               W1L02310
                          SLA     8         LEFT-JUSTIFY                W1L02320
                          STO  L1 A3TAB-40  SAVE CHAR                   W1L02330
                    FC821 EQU     *-1                                   W1L02340
                          MDX  L  FC821,2                               W1L02350
                          MDX   1 -1                                    W1L02360
                          MDX     FC021+1   CONT FILL                   W1L02370
                          BSC  L  FC015     READ NEXT CARD              W1L02380
                    *                                                   W1L02390
                    *************************************************** W1L02400
                    *                                                 * W1L02410
                    *             CONSTANTS AND SAVE AREAS            * W1L02420
                    *                                                 * W1L02430
                    *************************************************** W1L02440
                    A3SW  DC      *-*       CSP A3 FMT SW               W1L02450
                    A3TAB BSS     40        A3 CONVERSION TABLE         W1L02460
                    *                                                   W1L02470
                    COMPR BSS     1280      COMPRESSION AREA            W1L02480
                    *                                                   W1L02490
                          BSS  E  0                                     W1L02500
                    $KCSW EQU     /7C                                   W1L02510
                    LOG   DC      /008F     2501 SYST DEVC SUBR PH ID E W1L02520
                          DC      *-*       NOT USED                    W1L02530
                          BSS     2                                     W1L02540
                          DC      /0090     1442 SYST DEVC SUBR PH ID   W1L02550
                          DC      *-*       NOT USED                    W1L02560
                          BSS     2                                     W1L02570
                          DC      /0092     KEYB SYST DEVC SUBR PH ID   W1L02580
                    SW001 DC      *-*       PRINCIPAL INPUT DEVC SW     W1L02590
                          BSS     2                                     W1L02600
                          DC      /0093     CDCV SUBR PH ID             W1L02610
                          DC      *-*       NOT USED                    W1L02620
                          BSS     2                                     W1L02630
                          DC      /0095     KBCV SUBR PH ID             W1L02640
                    SW003 DC      /8000     1ST(15),SPECIAL(0) CD SW    W1L02650
                          BSS     2                                     W1L02660
                          DC      /008C     1403 SYST DEVC SUBR PH ID   W1L02670
                    SW002 DC      *-*       PRINCIPAL OUTPUT DEVC SW    W1L02680
                          BSS     2                                     W1L02690
                          DC      /008D     1132 SYST DEVC SUBR PH ID   W1L02700
                          DC      *-*       NOT USED                    W1L02710
                          BSS     2                                     W1L02720
                          DC      /008E     CPTR SYST DEVC SUBR PH ID   W1L02730
                          DC      *-*       NOT USED                    W1L02740
                          BSS     1                                     W1L02750
                    FC921 EQU     *                                     W1L02760
                          BSS     1                                     W1L02770
                          BSS     2                                     W1L02780
                    *                                                   W1L02790
                    *                                                   W1L02800
                    FC005 DC      BUF00+9   BR ADDR-I/P DEVC          E W1L02810
                          DC      BUF02+6   BR ADDR-O/P DEVC            W1L02820
                    FC006 DC      $PST4     INTRPT BRANCH TABLE (IBT)   W1L02830
                          DC      $PST4                                 W1L02840
                          DC      $PST4                                 W1L02850
                          DC      $PST4                                 W1L02860
                          DC      0         NOT USED                    W1L02870
                          DC      BUF02+6   1403                        W1L02880
                          DC      BUF00+6   2501                        W1L02890
                          DC      BUF00+6   1442                        W1L02900
                          DC      BUF00+6   KB/CP                       W1L02910
                          DC      0         NOT USED                    W1L02920
                    *                                                   W1L02930
                    *                                                   W1L02940
                    $PST4 EQU     /8D       IBT ADDR PARAM              W1L02950
                    $IBT4 EQU     /D4       IBT ADDR PARAM FOR ILS04    W1L02960
                    CDCV  EQU     BUF01+3   ENTRY TO CD CONVERT SUBR    W1L02970
                    $IBSY EQU     /13       2501 OR 1442 BUSY INDR      W1L02980
                    $LAST EQU     /33       LAST CD SW                  W1L02990
                    RDCD  EQU     BUF00+3   ENTRY ADDR FOR CD READ SUBR W1L03000
                    ILS04 DC      /C4       SYSTEM ILS04 ADDRESS    212 W1L03005
                    *                                                   W1L03010
                    *************************************************** W1L03020
                    *                                                 * W1L03030
                    *             DISK READ AND BUSY TEST             * W1L03040
                    *                                                 * W1L03050
                    *************************************************** W1L03060
                    RDDSK DC      *-*       ENTRY-SAVED RETURN ADDR     W1L03070
                          LIBF    DISK1     REQUEST DISK READ           W1L03080
                          DC      /1000                                 W1L03090
                          DC      BUF00     VAR PARAM - I/P ADDR        W1L03100
                          DC      ERR01                                 W1L03110
                          LIBF    DISK1     BUSY TEST ON DISK READ      W1L03120
                          DC      0                                     W1L03130
                    SW010 DC      BUF00     VAR PARAM-I/P ADDR          W1L03140
                          MDX     *-4       CONTINUE TESTING-DEVC BUSY  W1L03150
                          BSC  I  RDDSK     RETURN TO CALLER            W1L03160
                    *                                                   W1L03170
                    *             ERROR RECOVERY SUBR                   W1L03180
                    *                                                   W1L03190
                    ERR01 DC      *-*       ENTRY-SAVED RETURN ADDR     W1L03200
                          BSC  I  ERR01     RETURN TO CALLER            W1L03210
                    *                                                   W1L03220
                    *************************************************** W1L03230
                    *                                                 * W1L03240
                    *             MAINLINE CODE-PROGRAM ENTRY         * W1L03250
                    *                                                 * W1L03260
                    *************************************************** W1L03270
                    *                                                   W1L03280
                    FC000 BSI     RDDSK     RD BOTH SCTRS OF SLET   2-8 W1L03290
                    *                                                   W1L03300
                    *     SLET SEARCH FOR SYST DEVC SUBR ENTRIES        W1L03310
                    *                                                   W1L03320
                          STX   3 RXR3+1    SAVE REG 3                  W1L03330
                          LDX  L3 LOG       INITIALIZE REGS FOR         W1L03340
                          LDX   2 8         *PHASE ID COMPARE LOOP      W1L03350
                          LDX   1 0                                     W1L03360
                    *                                                   W1L03370
                    FC002 LD    3 0         GET PHASE ID                W1L03380
                          S    L1 BUF00+2   COMPARE PHASE IDS           W1L03390
                          BSC  L  FC001,+-  BR-SLET ENTRY FOUND         W1L03400
                          MDX   1 4         INCR PT                     W1L03410
                          MDX     FC002     CONT PH ID COMPARE LOOP     W1L03420
                    *                                                   W1L03430
                    *     FILL PHASE LOG                                W1L03440
                    *                                                   W1L03450
                    FC001 LDD  L1 BUF00+4   SAVE WORD CNT AND SECTOR    W1L03460
                          STD   3 2         *ADDR FROM SLET ENTRY       W1L03470
                          MDX   3 4         PT TO NEXT LOG ENTRY        W1L03480
                          MDX   2 -1        DECR ENTRY CTR              W1L03490
                          MDX     FC002-1   CONTINUE TO FILL PHASE LOG  W1L03500
                    RXR3  LDX  L3 *-*       RESTORE REG 3               W1L03510
                          LDD  L  SW001+1   SET WD CNT,SCTR ADDR FOR    W1L03520
                          STD  L  BUF00     *KB AS INPUT                W1L03530
                          LD   L  $KCSW                                 W1L03540
                          BSC  L  FC919,+-  BR-KB NOT INPUT DEVC        W1L03550
                          BSC  L  FC920,-   BR-KB IS INPUT DEVC         W1L03560
                          LD   L  FC921-8                               W1L03570
                          BSC  L  FC920,-   BR-KB IS INPUT              W1L03580
                          LD   L  FC921-4                               W1L03590
                          BSC  L  FC920,-   BR-KB IS INPUT              W1L03600
                    FC919 EQU     *                                     W1L03610
                    *                                                   W1L03620
                    *************************************************** W1L03630
                    *                                                 * W1L03640
                    *             DETERMINE PRINCIPAL INPUT DEVICE    * W1L03650
                    *                                                 * W1L03660
                    *************************************************** W1L03670
                          LDX  L1 LOG+3     SET REGS FOR DEVICE         W1L03680
                          LDX   2 3         *DETERMINATION TEST         W1L03690
                    FC004 LD    1 0         GET SCTR ADDR               W1L03700
                          BSC  L  FC003,-   BR-PRINCIPAL INPUT FOUND    W1L03710
                          MDX   2 -1        DECR DEVC CTR               W1L03720
                          MDX   1 4         PT TO NEXT LOG ENTRY        W1L03730
                          MDX     FC004     CONTINUE DEVC LOG SEARCH    W1L03740
                    *                                                   W1L03750
                    *************************************************** W1L03760
                    *                                                 * W1L03770
                    *             CONSTANTS AND SAVE AREAS            * W1L03780
                    *                                                 * W1L03790
                    *************************************************** W1L03800
                          BSS  E  0                                     W1L03810
                          DC      /7002     READ/CONVERT PARAMETER    E W1L03820
                    SW004 DC      BUF03-1   BUFFER ADDR                 W1L03830
                    $LEV0 EQU     8         INTRPT LVL 0 BR ADDR        W1L03840
                    $LEV4 EQU     /C        INTRPT LVL 4 BR ADDR    212 W1L03845
                    $CTSW EQU     /F        CONTROL CD SW ADDR          W1L03850
                    $PBSY EQU     /36       PTR BUSY SW ADDR            W1L03860
                    *                                                   W1L03870
                    *     READ PRINCIPAL INPUT SUBR INTO CORE           W1L03880
                    *                                                   W1L03890
                    FC003 MDX   2 -1                                    W1L03900
                          NOP                                           W1L03910
                          STX   2 SW001     SET PRINCIPAL INPUT DEVC SW W1L03920
                    *             SW001=2   2501-PRINCIPAL INPUT DEVC   W1L03930
                    *             SW001=1   1442                        W1L03940
                    *             SW001=0   KEYB                        W1L03950
                          LDD   1 -1        SET WD CNT AND SCTR         W1L03960
                          STD  L  BUF00     *ADDR FOR DISK READ         W1L03970
                    FC920 EQU     *                                     W1L03980
                    *                       LOAD SYST DEVC SUBR FOR     W1L03990
                          BSI     RDDSK     *PRINCIPAL INPUT DEVC       W1L04000
                    *                                                   W1L04010
                    *                                                   W1L04020
                    *     SET INTERRUPT LINKAGE WDS IN RESIDENT         W1L04030
                    *     *MONITOR FOR SYST DEVICE INPUT SUBR           W1L04040
                    *                                                   W1L04050
                          LD      FC005     SET BR WDS $LEV0            W1L04060
                          STO  L  $LEV0                                 W1L04070
                          LD      ILS04     SET INTRPT LVL 4 BR ADDR212 W1L04073
                          STO  L  $LEV4     *TO SYSTEM ILS04        212 W1L04076
                          LDX  L1 FC006     SET IBT FOR ILS04           W1L04080
                          STX  L1 $IBT4                                 W1L04090
                    *                                                   W1L04100
                    *     LOAD SYST CONVERSION SUBR                     W1L04110
                    *                                                   W1L04120
                          MDX  L  SW001,0   TEST SW001 FOR 0            W1L04130
                          MDX     *+2                                   W1L04140
                          LDD     SW003+1   GET WD CNT,SCTR ADDR        W1L04150
                          MDX     *+1       *FOR KBCV                   W1L04160
                          LDD     SW003-3   *FOR CDCV                   W1L04170
                          STD  L  BUF01     SET WD CNT,SECTOR ADDR      W1L04180
                          LDX  L1 BUF01     SET BUFFER ADDR             W1L04190
                          STX   1 RDDSK+3   *FOR DISK READ              W1L04200
                          STX   1 SW010     *AND BUSY TEST              W1L04210
                    *                       LOAD SYST CONVERSION SUBR   W1L04220
                          BSI     RDDSK     *FOR PRINCIPAL INPUT DEVC   W1L04230
                    *                                                   W1L04240
                    *************************************************** W1L04250
                    *                                                 * W1L04260
                    *             DETERMINE PRINCIPAL PTR             * W1L04270
                    *                                                 * W1L04280
                    *************************************************** W1L04290
                          LDX  L1 SW002+2   REG 1 POINTS TO LOG ENTRIES W1L04300
                          STX     FC004+2   INITIALIZE DEVICE DETER-    W1L04310
                          MDX  L  FC004+2,3 *MINATION LOOP FOR O/P      W1L04320
                          MDX     FC004-1   GO TO DETERMINATION LOOP    W1L04330
                    *                                                   W1L04340
                    *     READ PRINCIPAL OUTPUT SUBR INTO CORE          W1L04350
                    *                                                   W1L04360
                          MDX   2 -1                                    W1L04370
                          NOP                                           W1L04380
                          STX  L2 SW002     SET PRINCIPAL PTR SW    212 W1L04390
                    *             SW002=2   1403-PRINCIPAL PTR          W1L04400
                    *             SW002=1   1132-PRINCIPAL PTR          W1L04410
                    *             SW002=0   CPTR-PRINCIPAL PTR          W1L04420
                          LDD   1 -1        SET WD CNT AND SCTR ADDR    W1L04430
                          STD  L  BUF02     *FOR DISK READ              W1L04440
                          LDX  L1 BUF02     SET BUFFER ADDR             W1L04450
                          STX   1 RDDSK+3   *FOR DISK READ              W1L04460
                          STX   1 SW010     *AND BUSY TEST              W1L04470
                    *                       LOAD SYST DEVC SUBR FOR     W1L04480
                          BSI     RDDSK     *PRINCIPAL OUTPUT DEVC      W1L04490
                    *                                                   W1L04500
                    *                                                   W1L04510
                    *     SET INTERRUPT LINKAGE WDS IN RESIDENT         W1L04520
                    *     MONITOR FOR SYST DEVC OUTPUT SUBR             W1L04530
                    *                                                   W1L04540
                          LD      FC005+1   SET INTERRUPT BRANCH WD 9   W1L04550
                          STO  L  $LEV0+1                               W1L04560
                    *                                                   W1L04570
                    *************************************************** W1L04580
                    *                                                 * W1L04590
                    *             READ ONE CARD INTO CORE             * W1L04600
                    *             *WHEN I/P DEVC NOT BUSY             * W1L04610
                    *                                                 * W1L04620
                    *************************************************** W1L04630
                    FC015 EQU     *                                     W1L04640
                    FC008 LD   L  $IBSY     TEST I/P DEVC BUSY          W1L04650
                          BSC  L  FC008,Z   BR-I/P DEVC BUSY            W1L04660
                    *                                                   W1L04670
                    *     TEST JOB CONTROL AND LAST CARD SWITCHES       W1L04680
                    *                                                   W1L04690
                          LD   L  $CTSW                                 W1L04700
                          BSC  L  EXIT,Z    BR-CONTROL CARD READ        W1L04710
                          LD   L  $LAST                                 W1L04720
                          BSC  L  EXIT,Z    BR-LAST CD SW ON            W1L04730
                          LD   L  $PBSY     TEST FOR PTR BUSY           W1L04740
                          BSC     Z         SKIP-PTR READY              W1L04750
                          MDX     *-4       CONT BUSY TEST FOR PTR      W1L04760
                          LDD     SW004-1   LOAD PARAM FOR CD READ      W1L04770
                    *                                                   W1L04780
                    *     READ CARD                                     W1L04790
                    *                                                   W1L04800
                          BSI  L  RDCD      READ CARD INTO CORE         W1L04810
                          MDX  L  $IBSY,0   TEST INPUT SUBR BUSY        W1L04820
                          MDX     *-3       CONTINUE TEST-SUBR BUSY     W1L04830
                    *                       IF SPECIAL SW ON-SPECS ARE  W1L04840
                          LD   L  SW003     *PRINTED                    W1L04850
                          BSC  L  FC070,-   BR-SPECIAL SW IS OFF        W1L04860
                    *                                                   W1L04870
                    *                                                   W1L04880
                    *             CARD IS PRINTED                       W1L04890
                    *                                                   W1L04900
                          LD      SW004     LOAD PARAM FOR CD CVRT      W1L04910
                          BSI  L  CDCV      CONVERT CD JUST READ        W1L04920
                          LD   L  SW001     IF KB IS I/P DEVC           W1L04930
                          BSC  L  *+4,Z     *DO NOT BRANCH              W1L04940
                          LD   L  SW002                                 W1L04950
                          BSC  L  FC080,+-  BR-O/P DEVC CONSOLE PTR     W1L04960
                    *                                                   W1L04970
                    *     PACK CARD CODE FOR PRINT OPERATION            W1L04980
                    *     *AND PRINT SPECIFICATIONS                     W1L04990
                    *                                                   W1L05000
                          LDX  L2 BUF04+39  REG 2=ADDR OF OUTPUT BUFFER W1L05010
                          LDX   1 80        REG 1=CHAR CNT              W1L05020
                    FC050 LD   L1 BUF03-2   GET LEFTHAND CHAR           W1L05030
                          SLA     8         SHIFT TO LEFT               W1L05040
                          STO   2 0         SAVE CHAR IN OUTPUT BUFFER  W1L05050
                          LD   L1 BUF03-1   GET RIGHTHAND CHAR          W1L05060
                          OR    2 0         SAVE CHAR IN OUTPUT BUFFER  W1L05070
                          STO   2 0                                     W1L05080
                          MDX   2 -1        DECR O/P PT                 W1L05090
                          MDX   1 -2        DECREMENT CHAR CNT          W1L05100
                          MDX     FC050     CONTINUE PACK               W1L05110
                    *                                                   W1L05120
                          BSI  L  PRINT     PRINT SPECS                 W1L05130
                    *                                                   W1L05140
                    *************************************************** W1L05150
                    *                                                 * W1L05160
                    *             CONTROL CARD TYPE DETERMINATION     * W1L05170
                    *                                                 * W1L05180
                    *************************************************** W1L05190
                    FC080 EQU     *                                     W1L05200
                          LDX  L2 MESS6     SET ERROR MESSAGE ADDR      W1L05210
                          LD   L  SW003     GET 1ST CD SW               W1L05220
                          SLA     1         SHIFT OFF SPECIAL SW        W1L05230
                          BSC  L  FC100,Z   BR-1ST CD HAS BEEN READ     W1L05240
                    *                                                   W1L05250
                    *     TEST FOR D-CARD                               W1L05260
                    *                                                   W1L05270
                          LD   L  BUF03+71  FETCH CD COL 72             W1L05280
                          S       D         SUB EBC D                   W1L05290
                          BSC  L  FILEC,+-  BR-1ST CD IS A D-CARD       W1L05300
                          BSC  L  PRIN1+2   1ST CARD NOT D-CARD         W1L05310
                    FC100 LD   L  BUF03+71  FETCH CD COL 72             W1L05320
                          S       D         SUB EBC D                   W1L05330
                          BSC  L  FC110,Z   SKIP-NO D-CARD DETECTED     W1L05340
                    *                       MORE THAN ONE D-CARD        W1L05350
                          BSC  L  PRIN1+2   *DETECTED-PRINT DIAGNOSTIC  W1L05360
                    *                                                   W1L05370
                    *     TEST FOR A- OR S- CARD                        W1L05380
                    *                                                   W1L05390
                    FC110 EQU     *                                     W1L05400
                          A    L  D3        SUB EBC A FROM CD COL 72    W1L05410
                          BSC  L  A3FLD,+-  BR- A-CARD DETECTED         W1L05420
                          S       S         SUB EBC S FROM CD COL 72    W1L05430
                          BSC  L  FC016,+-  BR- SPEC CARD DETECTED      W1L05440
                    *                                                   W1L05450
                    *     TEST FOR /* CARD                              W1L05460
                    *                                                   W1L05470
                          LDD  L  BUF03     FETCH CD COLS 1 AND 2       W1L05480
                          SD      FC009     SUB EBC /*                  W1L05490
                          BSC  L  *+3,Z     BR- / NOT IN 1ST COL        W1L05500
                          SLT     16                                    W1L05510
                          BSC  L  FC026,+-  BR- /* CARD DETECTED        W1L05520
                          BSI  L  PRINT     PRINT DIAGNOSTIC            W1L05530
                          MDX     FC015     READ NEXT CARD              W1L05540
                    *                                                   W1L05550
                    *************************************************** W1L05560
                    *                                                 * W1L05570
                    *             CONSTANTS AND SAVE AREAS            * W1L05580
                    *                                                 * W1L05590
                    *************************************************** W1L05600
                    $I410 EQU     /D5                                   W1L05610
                    $IREQ EQU     /2C                                   W1L05620
                    S     DC      .S-.A     S-A                         W1L05630
                    D     DC      .D        D                           W1L05640
                          DC      40        PRINT BUFFER                W1L05650
                    BUF04 BSS     40                                    W1L05660
                          BSS  E  0                                     W1L05670
                    FC009 DC      /61       /                         E W1L05680
                          DC      /5C       *                           W1L05690
                    HFFF  DC      /FFFF     END OF RCD INDR             W1L05700
                    CNT1  BSS     1         NO. I/P RCDS/SCTR           W1L05710
                    CNT2  BSS     1         NO. O/P RCDS/SCTR           W1L05720
                    DIAGS DC      0         DIAGNOSTIC SW               W1L05730
                    CARDS DC      0         CARD FILE SW                W1L05740
                    FC996 DC      *-*       START ADDR OF I/P RCD       W1L05750
                    FC365 DC      *-*       DUMMY KB REQUEST ENTRY      W1L05760
                          XIO     FC366     RESET KB/CP SWITCH          W1L05770
                          BSC  L  $I410     RETURN TO ILS04  H          W1L05780
                          BSS  E  0                                     W1L05790
                    FC366 DC      34                                  E W1L05800
                          DC      /0F01                                 W1L05810
                    FC364 DC      *-*                                   W1L05820
                    *                                                   W1L05830
                    *************************************************** W1L05840
                    *                                                 * W1L05850
                    *             MAINLINE CODE FOR DATA CONVERSION   * W1L05860
                    *                                                 * W1L05870
                    *************************************************** W1L05880
                    *                                                   W1L05890
                    *     TEST FOR ERROR CONDITIONS                     W1L05900
                    *                                                   W1L05910
                    FC026 EQU     *                                     W1L05920
                          MDX  L  T0002,18  SET UP MSG BUILD SUBR       W1L05930
                          MDX  L  T0002+3,18 *FOR SAVING RCD COL IN     W1L05940
                          MDX  L  T0002+4,18 *RANGE WARNING MSG         W1L05950
                          MDX  L  T0002+7,18                            W1L05960
                          MDX  L  T0002+12,18                           W1L05970
                          MDX  L  SSW,0     TEST S SW                   W1L05980
                          MDX     FC500     BR-S-CARD READ              W1L05990
                          BSC  L  PRIN1+2   PRINT DIAGNOSTIC AND EXIT   W1L06000
                    *                                                   W1L06010
                    FC500 EQU     *                                     W1L06020
                          LDX  I2 SSXR2+1   RESTORE REG 2               W1L06030
                          LD      HFFF      PUT END OF RCD INDR IN      W1L06040
                          STO   2 0         *COMPRESSION                W1L06050
                    *                                                   W1L06060
                    *     TEST TOTAL FIELD LENGTH                       W1L06070
                    *                                                   W1L06080
                          LD   L  TOTFL     GET TOTAL FLD LNG           W1L06090
                          S    L  RCDSZ+1   SUB O/P RCD SIZE IN CHARS   W1L06100
                          BSC  L  FC300,+   BR-TOTAL FLD LNG VALID      W1L06110
                          LDX  L2 MESS9     PRINT DIAGNOSTIC-TOTAL FLD  W1L06120
                          BSI  L  PRINT     *LNG INVALID                W1L06130
                          STX     DIAGS     SET DIAGNOSTIC SW           W1L06140
                    *                                                   W1L06150
                    *     TEST FOR A3 CARD PRESENT IF NECESSARY         W1L06160
                    *                                                   W1L06170
                    FC300 EQU     *                                     W1L06180
                          LD   L  FSW                                   W1L06190
                          BSC  L  FC310,+-  BR- F-SW OFF                W1L06200
                          LD   L  A3SW                                  W1L06210
                          BSC  L  FC310,Z   BR-A3 TABLE HAS BEEN READ   W1L06220
                          LDX  L2 MESS5     F-TYPE SPECIFIED BUT NO     W1L06230
                          BSI  L  PRINT     *A3 CARD READ-PRINT DIAGNOS W1L06240
                          STX     DIAGS     *TIC AND SET DIAGNOSTIC SW  W1L06250
                    *                                                   W1L06260
                    *     CHECK DIAGNOSTIC SWITCH                       W1L06270
                    *                                                   W1L06280
                    FC310 EQU     *                                     W1L06290
                          LD      DIAGS     TEST DIAGNOSTIC SW          W1L06300
                          BSC  L  EXIT,Z    BR-ABNORMAL EXIT            W1L06310
                          STO  L  SW003     TURN OFF SPECIAL SW         W1L06320
                          LDX  L1 320       SET LOOP CONTROL            W1L06330
                          LD      H4040     ACC=DOUBLE BLANKS           W1L06340
                          STO  L1 BUF05+1   SET O/P AREA TO BLANKS      W1L06350
                          MDX   1 -1        DECR LOOP CTR               W1L06360
                          MDX     *-4       CONT TO FILL O/P AREA       W1L06370
                    *                                                   W1L06380
                          LDX  L1 BUF06     SET CONTROL PARAMETERS FOR  W1L06390
                          STX  L1 RDDSK+3   *DISK READ AND TEST         W1L06400
                          STX  L1 SW010                                 W1L06410
                          LD   L  BUF05+1   FETCH DRIVE CODE            W1L06420
                          SRA     12                                    W1L06430
                          A       FC311     ADD COMMA ADDR OF FILE PRO- W1L06440
                          STO     FC311+1   *TECT TABLE AND SAVE        W1L06450
                          LD   I  FC311+1   FETCH AND SAVE OLD FILE     W1L06460
                          STO     FC311+2   *PROTECT ADDR               W1L06470
                          LD   L  BUF05+1   SET FILE PROTECT ADDR TO    W1L06480
                          STO  I  FC311+1   *DATA FILE ADDR             W1L06490
                          LD   L  $IREQ     SAVE INTERRUPT REQUEST ADDR W1L06500
                          STO     FC364                                 W1L06510
                          LDX  L1 FC365     SET ENTRY PT FOR KB         W1L06520
                          STX  L1 $IREQ     *REQUEST TO DUMMY           W1L06530
                          SLA     16                                    W1L06540
                          STO     FC365     ZREO ENTRY PT AND SWITCH    W1L06550
                    *                                                   W1L06560
                    *     TEST INPUT TYPE AND INPUT DATA                W1L06570
                    *                                                   W1L06580
                    FC360 EQU     *                                     W1L06590
                          LD      CARDS                                 W1L06600
                          BSC  L  CDDSK,Z   BR-CARD INPUT SPECIFIED     W1L06610
                          BSI  L  RDDSK     READ SCTR OF I/P DATA       W1L06620
                          MDX  L  BUF06+1,1 INCREMENT SCTR ADDR BY 1    W1L06630
                    *                                                   W1L06640
                    *     INITIALIZE INDEX REGS AND COUNTERS            W1L06650
                    *                                                   W1L06660
                    FC363 EQU     *                                     W1L06670
                          LD   L  RCSZS     SET I/P RCDS/SCTR CNT       W1L06680
                          STO     CNT1                                  W1L06690
                    FC361 LDX  L3 BUF05+2   REG 3= O/P AREA ADDR        W1L06700
                          LDX  L1 BUF06+322 REG 1= I/P AREA ADDR        W1L06710
                          STX   1 FC996     SAVE I/P RCD START ADDR     W1L06720
                          LDX  L2 COMPR     REG 2=COMPRESSION ADDR      W1L06730
                    *                                                   W1L06740
                    *     BRANCH TO CONVERSION                          W1L06750
                    *                                                   W1L06760
                    FC320 EQU     *                                     W1L06770
                          BSI  I2 0         BR TO CONVERSION SUBR       W1L06780
                          LD    2 0         GET COMPRESSION WD          W1L06790
                          S       HFFF      SUB END OF RCD MARK         W1L06800
                          BSC  L  FC320,Z   BR-COMPLETE RCD CONVERSION  W1L06810
                    *                                                   W1L06820
                          LD   L  XR3       ADD OUTPUT RCD LNG TO REG 3 W1L06830
                          A    L  WDRCD+1   ADD RCD LNG IN WDS          W1L06840
                          STO  L  XR3                                   W1L06850
                    *                                                   W1L06860
                    *     WRITE 1 SECTOR OF OUTPUT ON DISK              W1L06870
                    *     *AND FILL OUTPUT BUFFER WITH BLANKS           W1L06880
                    *                                                   W1L06890
                          MDX  L  CNT2,-1   DECR O/P RCDS/SCTR CNT      W1L06900
                          MDX     FC330     BR-O/P SCTR NOT YET FILLED  W1L06910
                          BSI     WRITE     WRITE O/P DATA TO DISK      W1L06920
                    *                                                   W1L06930
                          LDX  L3 320       SET LOOP CONTROL            W1L06940
                          LD      H4040     ACC=DOUBLE BLANKS           W1L06950
                          STO  L3 BUF05+1   SET O/P AREA TO BLANKS      W1L06960
                          MDX   3 -1        DECR LOOP CTR               W1L06970
                          MDX     *-4       CONT TO FILL O/P AREA       W1L06980
                    *                                                   W1L06990
                    FC362 EQU     *                                     W1L07000
                          LD   L  RCSZS+1                               W1L07010
                          STO  L  CNT2      SET  O/P RCD CNT            W1L07020
                          LDX  L3 BUF05+2   REG 3= O/P AREA ADDR        W1L07030
                          MDX  L  BUF05+1,1 INCREMENT O/P ADDR          W1L07040
                    *                                                   W1L07050
                    *     TEST FOR COMPLETE CONVERSION                  W1L07060
                    *                                                   W1L07070
                    FC330 EQU     *                                     W1L07080
                          LD   L  FC996     SUB I/P RCD LNG TO START    W1L07090
                          S    L  RCDSZ     *ADDR OF LAST RCD TO GET    W1L07100
                          STO  L  XR1       *START ADDR OF NEW RCD      W1L07110
                          MDX  L  RCDCT,-1  DECR RCD CNT                W1L07120
                    *                       BR-FILE CONVERSION NOT      W1L07130
                          MDX     FC350     *COMPLETE                   W1L07140
                    *                                                   W1L07150
                          LD      H615C     SET /* RCD INTO FILE        W1L07160
                          STO   3 0                                     W1L07170
                    *                                                   W1L07180
                          BSI     WRITE     WRITE O/P DATA TO DISK      W1L07190
                    *                                                   W1L07200
                          LDX  L2 MESS0     PRINT END OF JOB MESSAGE    W1L07210
                          BSI  L  PRINT                                 W1L07220
                          LD      FC311+2   RESTORE FILE PROTECT ADDR   W1L07230
                          STO  I  FC311+1   *IN COMMA                   W1L07240
                          LD   L  FC364     RESTORE KB REQUEST ENTRY PT W1L07250
                          STO  L  $IREQ                                 W1L07260
                          LD   L  FC365     TEST KB REQUEST SWITCH      W1L07270
                          BSI  I  $IREQ,Z   BR-KB REQUEST OCCURRED      W1L07280
                    EXIT  EXIT              END OF JOB                  W1L07290
                    *                                                   W1L07300
                    *                                                   W1L07310
                    *     CONSTANTS                                     W1L07320
                    *                                                   W1L07330
                    $FPAD EQU     /95                                   W1L07340
                    FC311 DC      $FPAD                                 W1L07350
                          BSS     2                                     W1L07360
                    H615C DC      /615C     /* RCD                      W1L07370
                    H4040 DC      /4040     DOUBLE BLANKS               W1L07380
                    *                                                   W1L07390
                    *                                                   W1L07400
                    FC350 EQU     *                                     W1L07410
                          MDX  L  CNT1,-1   DECR I/P RCDS/SCTR CNT      W1L07420
                          MDX     FC320-3   BR-I/P SCTR NOT COMPLETED   W1L07430
                          STX   3 FC361+1   SAVE REG 3                  W1L07440
                          LDX  I3 RXR3+1    RESTORE REG 3 TO TV         W1L07450
                          MDX     FC360     GO READ MORE I/P DATA       W1L07460
                    *                                                   W1L07470
                    *************************************************** W1L07480
                    *                                                 * W1L07490
                    *             WRITE PORTION OF OUTPUT ON DISK     * W1L07500
                    *                                                 * W1L07510
                    *************************************************** W1L07520
                    WRITE DC      *-*       ENTRY PT                    W1L07530
                          LDX  I3 RXR3+1    RESTORE REG 3 TO TV         W1L07540
                          LIBF    DISK1     WRITE SCTR TO DISK          W1L07550
                          DC      /3000                                 W1L07560
                          DC      BUF05                                 W1L07570
                          DC      ERR01                                 W1L07580
                          LIBF    DISK1     TEST FOR WRITE              W1L07590
                          DC      0         *COMPLETE                   W1L07600
                          DC      BUF05                                 W1L07610
                          MDX     *-4       BR-OPERATION NOT COMPLETE   W1L07620
                          BSC  I  WRITE     RETURN TO CALLER            W1L07630
                    *                                                   W1L07640
                    *************************************************** W1L07650
                    *                                                 * W1L07660
                    *             READ DATA FROM CARD                 * W1L07670
                    *             *AND CONVERT TO DISK DATA FORMAT,   * W1L07680
                    *             *ADJUSTING FOR EXTRA DATA WORDS     * W1L07690
                    *                                                 * W1L07700
                    *************************************************** W1L07710
                    *                                                   W1L07720
                    CDDSK EQU     *                                     W1L07730
                          LDX  I1 EXTRA     REG 1=EXTRA PT              W1L07740
                    *                                                   W1L07750
                    *     ADJUST BUFFER FOR EXTRA DATA WORDS            W1L07760
                    *                                                   W1L07770
                    FC370 MDX   1 0                                     W1L07780
                          MDX     *+1       SKIP-EXTRA PT NONZERO       W1L07790
                          MDX     FC340     BR-EXTRA PT ZERO            W1L07800
                    *                                                   W1L07810
                          LD   L1 BUF06+321 MOVE DATA WORD TO           W1L07820
                          STO  L1 BUF06+1   *FRONT OF I/P BUFFER        W1L07830
                          MDX   1 -1        DECR EXTRA PT               W1L07840
                          MDX     FC370     CONT TO MOVE EXTRA WDS      W1L07850
                    *                                                   W1L07860
                    FC340 STX   1 CDCOL     SET CD COL CNT TO ZERO      W1L07870
                          BSC  L  FC015     READ DATA CARD              W1L07880
                    *                                                   W1L07890
                    *     CONVERT DATA TO DISK DATA FORMAT              W1L07900
                    *                                                   W1L07910
                    FC070 EQU     *                                     W1L07920
                          LD      D54       INITIALIZE NO. WDS TO       W1L07930
                          STO     CNT3      *PACK                       W1L07940
                    *                                                   W1L07950
                          LD      ADDR2                                 W1L07960
                          A       CDCOL                                 W1L07970
                          A       EXTRA     REG 2 POINTS TO AREA WHERE  W1L07980
                          STO  L  XR2       *54 DATA WDS ARE TO BE PUT  W1L07990
                          LDX  L1 BUF03-1   REG 1 PTS TO CARD I/P AREA  W1L08000
                    *                                                   W1L08010
                    *     CONVERT 4 CD COLUMNS TO 3 DATA WDS AND STORE  W1L08020
                    *                                                   W1L08030
                    FC380 LD    1 1         01 02 03 XX XX XX XX XX     W1L08040
                          SRT     20        XX XX XX XX XX 01 02 03     W1L08050
                          LD    1 2         04 05 06 XX XX 01 02 03     W1L08060
                          RTE     12        01 02 03 04 05 06 XX XX     W1L08070
                          STO   2 0                                     W1L08080
                          SRT     8         XX XX 01 02 03 04 05 06     W1L08090
                          LD    1 3         07 08 09 XX 03 04 05 06     W1L08100
                          RTE     8         05 06 07 08 09 XX 03 04     W1L08110
                          STO   2 1                                     W1L08120
                          SRT     12        XX XX XX 05 06 07 08 09     W1L08130
                          LD    1 4         10 11 12 XX 06 07 08 09     W1L08140
                          RTE     4         09 10 11 12 XX 06 07 08     W1L08150
                          STO   2 2                                     W1L08160
                          MDX   1 4         SKIP 4 CD COLUMNS           W1L08170
                          MDX   2 3         SKIP 3 DATA WORDS           W1L08180
                          MDX  L  CNT3,-3   DECREMENT WD CNT            W1L08190
                          MDX     FC380     BR-COMPLETE CONVERSION      W1L08200
                    *                                                   W1L08210
                          MDX  L  CDCOL,54  INCREMENT COL CNT           W1L08220
                          LD      CDCOL     TEST FOR I/P AREA FILLED    W1L08230
                          A       EXTRA                                 W1L08240
                          S    L  D320+1                                W1L08250
                          BSC  L  FC015,+Z  BR-CONT TO COLLECT I/P DATA W1L08260
                    *                                                   W1L08270
                          MDX  L  EXTRA,4   INCREMENT EXTRA PT          W1L08280
                          LD      EXTRA                                 W1L08290
                          S       D54                                   W1L08300
                          BSC  L  FC363,Z+  BR-EXTRA PT NOT 54          W1L08310
                          STO     EXTRA     REINITIALIZE EXTRA PT       W1L08320
                          BSC  L  FC363     CONT CONVERSION             W1L08330
                    *                                                   W1L08340
                    *     CONSTANTS                                     W1L08350
                    *                                                   W1L08360
                    D54   DC      54        54                          W1L08370
                    EXTRA DC      *-*       EXTRA POINTER               W1L08380
                    CDCOL DC      *-*       CARD COL CNT                W1L08390
                    ADDR2 DC      BUF06+2   I/P BUFFER ADDR             W1L08400
                    CNT3  DC      *-*       CD COL CNT FOR PACK         W1L08410
                    D640  DC      640       640                         W1L08420
                    *************************************************** W1L08430
                    *                                                 * W1L08440
                    *             PRINT DIAGNOSTIC MSG AND EXIT       * W1L08450
                    *                                                 * W1L08460
                    *************************************************** W1L08470
                    *                                                   W1L08480
                    PRIN1 EQU     *                                     W1L08490
                          LDX  L2 MESS1     REG 2 PTS TO ERROR MESSAGE  W1L08500
                          BSI  L  PRINT     PRINT DIAGNOSTIC            W1L08510
                          BSC  L  EXIT      ABNORMAL EXIT               W1L08520
                    *                                                   W1L08530
                    *************************************************** W1L08540
                    *                                                 * W1L08550
                    *             CONVERT FILE DESCRIPTION CARD       * W1L08560
                    *                                                 * W1L08570
                    *************************************************** W1L08580
                    FILEC MDX  L  SW003,1   TURN 1ST CD SW ON           W1L08590
                          MDX  L  SW00C,1   SET D-CARD SWITCH           W1L08600
                          LDX  L1 BUF03+11  XR=I/O AREA ADDR+11         W1L08610
                    *                                                   W1L08620
                    *     CONVERT RECORD COUNT AND CHECK IT             W1L08630
                    *                                                   W1L08640
                          LDX   2 5         SET FLD LNG INDR            W1L08650
                          BSI  L  CONVT     CONVERT RECORD CNT FLD      W1L08660
                          BSC  L  PRIN1,+   BR-RCD CNT INVALID          W1L08670
                          STO  L  RCDCT     SAVE RECORD CNT             W1L08680
                          STO  L  WORK3-1                               W1L08690
                          STO  L  SW00E                                 W1L08700
                          LD   L  CV000     TEST FOR OVERFLOW           W1L08710
                          BSC  L  PRIN1,Z   BR-OVERFLOW OCCURS          W1L08720
                    *                                                   W1L08730
                    *     CONVERT INPUT RECORD SIZE AND CHECK IT        W1L08740
                    *                                                   W1L08750
                          LDX   2 3         SET FLD LNG INDR            W1L08760
                          MDX  L  MESS1+22,6 ADJUST ERROR MSG           W1L08770
                          BSI  L  CONVT     CONVERT I/P FILE RCD SIZE   W1L08780
                          BSC  L  PRIN1,+   BR-I/P RCD SIZE INVALID     W1L08790
                          STO  L  RCDSZ     SAVE INPUT FILE RCD SIZE    W1L08800
                          S    L  D320+1                                W1L08810
                          BSC     -Z        SKIP-INPUT RCD SIZE VALID   W1L08820
                    *                       BR- I/P RCD SIZE INVALID-   W1L08830
                          MDX     PRIN1     *PRINT DIAGNOSTIC           W1L08840
                    *                                                   W1L08850
                    *     CONVERT OUTPUT RECORD SIZE AND CHECK IT       W1L08860
                    *                                                   W1L08870
                          LDX   2 3         SET FLD LNG INDR            W1L08880
                          LD      HF2F3     SET COL INDR IN ERROR       W1L08890
                          STO     MESS1+22  *MESSAGE                    W1L08900
                          BSI  L  CONVT     CONVERT RPG FILE RCD SIZE   W1L08910
                          BSC  L  PRIN1,+   BR-O/P RCD SIZE INVALID     W1L08920
                          STO  L  RCDSZ+1   SAVE RPG FILE RCD SIZE      W1L08930
                          S       D640                                  W1L08940
                          BSC  L  PRIN1,-Z  BR-RPG RCD SIZE INVALID     W1L08950
                    *                                                   W1L08960
                    *     TEST CARD COL 27 FOR E OR S                   W1L08970
                    *                                                   W1L08980
                          LD    1 1         TEST REAL NUM FMT FLD       W1L08990
                          S       E                                     W1L09000
                          MDX  L  MESS1+22,4 ADJUST ERROR MSG           W1L09010
                          BSC  L  *+3,Z     SKIP-EXTENDED PREC NOT SPEC W1L09020
                          STX  L  EPREC     SET EXTENDED PREC SW        W1L09030
                          MDX     *+3                                   W1L09040
                          S       H1D                                   W1L09050
                          BSC  L  PRIN1,Z   BR-COL 27 INVALID           W1L09060
                    *                                                   W1L09070
                    *     TEST CARD COL 29 FOR 1 OR BLANK               W1L09080
                    *                                                   W1L09090
                          LD    1 3         TEST INTEGER FMT FLD        W1L09100
                          S       HF1                                   W1L09110
                          MDX  L  MESS1+22,2 ADJUST ERROR MSG           W1L09120
                          BSC  L  *+3,Z     SKIP-ONE WD ITG NOT SPEC    W1L09130
                          STX  L  INTSW     SET ONE WD ITG SW           W1L09140
                          MDX     FC140                                 W1L09150
                          LD    1 3                                     W1L09160
                          S    L  H0040     TEST COL FOR BLANK          W1L09170
                          BSC  L  PRIN1,Z   BR- COL 29 INVALID          W1L09180
                    *                                                   W1L09190
                    *     TEST CARD COL 31 FOR C OR BLANK               W1L09200
                    *                                                   W1L09210
                    FC140 EQU     *                                     W1L09220
                          LD      HF3F1     SET COL INDR IN ERROR       W1L09230
                          STO     MESS1+22  *MESSAGE                    W1L09240
                          LD    1 5         TEST CARD FILE FLD          W1L09250
                          S       HC3                                   W1L09260
                          BSC  L  FC160,Z   SKIP-CD I/P NOT SPECIFIED   W1L09270
                          STX  L  CARDS     SET CARD INPUT SW           W1L09280
                          MDX  L  SW001,0   SKIP-KEYBOARD INPUT         W1L09290
                          BSC  L  FC150                                 W1L09300
                    *                                                   W1L09310
                          LDX  L2 MESS8     SET ERROR MSG ADDR          W1L09320
                          MDX     PRIN1+2   PRINT DIAGNOSTIC            W1L09330
                    *                                                   W1L09340
                    FC160 EQU     *                                     W1L09350
                          LD    1 5                                     W1L09360
                          S    L  H0040     TEST COL FOR BLANK          W1L09370
                          BSC  L  FC150,+-  BR-COL 31 VALID             W1L09380
                          MDX     PRIN1     PRINT DIAGNOSTIC            W1L09390
                    *                                                   W1L09400
                    *************************************************** W1L09410
                    *                                                 * W1L09420
                    *             CONSTANTS AND SAVE AREAS            * W1L09430
                    *                                                 * W1L09440
                    *************************************************** W1L09450
                    MESS1 DC      22                                    W1L09460
                          DMES  2 F01 INVALID DESCRIPTION CARD FIELD -' W1L09470
                          DMES  2  COL  13'E                            W1L09480
                    HF3F1 DC      /F3F1     EBC 31                      W1L09490
                    HC3   DC      /C3       EBC C                       W1L09500
                    HF1   DC      /F1       EBC 1                       W1L09510
                    H1D   DC      /1D       S-E                         W1L09520
                    E     DC      /C5       EBC E                       W1L09530
                    HF2F3 DC      /F2F3     EBC 23                      W1L09540
                    SW00D DC      RCSZS     PT TO RCD SIZE              W1L09550
                    *                                                   W1L09560
                    @BLCT EQU     2         DISP TO BLK CNT             W1L09570
                    @LFNM EQU     0         DISP TO NAME                W1L09580
                    @LFEN EQU     3         LNG OF LET/FLET ENT         W1L09590
                    @NEXT EQU     4         DISP TO NEXT SCTR ADDR      W1L09600
                    SR901 DC      .$-.      $                           W1L09610
                          DC      .$-.$                                 W1L09620
                          DC      .A-.$     A-I                         W1L09630
                          DC      .I-.A                                 W1L09640
                          DC      .J-.I     J-R                         W1L09650
                          DC      .R-.J                                 W1L09660
                          DC      .S-.R     S-Z                         W1L09670
                          DC      .Z-.S                                 W1L09680
                          DC      .0-.Z     0-9                         W1L09690
                          DC      .9-.0                                 W1L09700
                          DC      /3FFF-.9  (FORCE END CHECK LOOP)      W1L09710
                    SR910 DC      *-*       BLK CNT OF CURR LET ENT     W1L09720
                    SR900 DC      .0        EBC 0                       W1L09730
                    SR902 DC      .         EBC BLANK                   W1L09740
                    SR903 DC      /3F       USED TO SAVE BITS 10-15     W1L09750
                    SR904 DC      /C000     DISK DATA FMT INDR          W1L09760
                    SR908 BSS  E  2         SAVE ADDR FOR PACKED NAME E W1L09770
                    $ULET EQU     /2D       ADDR OF LET SCTR ADDR TABLE W1L09780
                    @MXDR EQU     5         MAX NO. OF DISK DRIVES      W1L09790
                    SR905 DC      *-*       CURRENT BLOCK ADDR          W1L09800
                    @SCTN EQU     0         DISP TO SCTR NO.            W1L09810
                    SR909 DC      *-*       NO. WDS LEFT FOR COMPARISON W1L09820
                    @WDSA EQU     3         DISP TO NO. WDS OF SCTR     W1L09830
                    @LFHD EQU     5         LNG OF SCTR HEADER          W1L09840
                    SR907 DC      320-@LFHD NO. WDS PER LET/FLET SCTR   W1L09850
                    @UAFX EQU     1         DISP TO SCTR ADDR,USER AREA W1L09860
                    SR906 DC      16        NO. OF 1ST SCTR IN FLET     W1L09870
                    *                                                   W1L09880
                    *************************************************** W1L09890
                    *                                                 * W1L09900
                    *             LET/FLET SEARCHES FOR FILES         * W1L09910
                    *                                                 * W1L09920
                    *************************************************** W1L09930
                    *                                                   W1L09940
                    *                                                   W1L09950
                    *             CHECK FILE NAME FOR VALIDITY          W1L09960
                    *                                                   W1L09970
                    SEARC DC      *-*       ENTRY PT                    W1L09980
                    *                                                   W1L09990
                          LD    1 0         FIRST CHAR MUST BE          W1L10000
                          S       SR900     *NONNUMERIC                 W1L10010
                          BSC  L  SR010,-   BR-FIRST CHAR IS NUMERIC    W1L10020
                    *                                                   W1L10030
                          LDX   3 -5        SET CHAR CNT                W1L10040
                    SR050 LDX  L2 SR901     SET TABLE ADDR              W1L10050
                    *                                                   W1L10060
                          LD    1 0         CHECK FOR BLANK COL         W1L10070
                          S       SR902                                 W1L10080
                          BSC  L  SR020,+-  BR-COL IS BLANK             W1L10090
                    *                                                   W1L10100
                    SR040 S     2 0         CHECK FOR VALID 8-BIT CHAR  W1L10110
                          BSC  L  SR010,+Z  BR-NOT IN CHAR RANGE        W1L10120
                          S     2 1                                     W1L10130
                          BSC  L  SR030,+   BR-CHAR IS VALID            W1L10140
                          MDX   2 2                                     W1L10150
                          MDX     SR040     CONT CHAR CHECK             W1L10160
                    *                                                   W1L10170
                    SR030 MDX   1 1         INCR I/P PT                 W1L10180
                          MDX   3 1         INCR CHAR CNT               W1L10190
                          MDX     SR050     CONT NAME CHECK-NEXT CHAR   W1L10200
                          MDX     SR060     LABEL VALID-GO PACK,SEARCH  W1L10210
                    *                                                   W1L10220
                    SR010 LDX  L2 MESS2     SET ERROR MSG ADDR          W1L10230
                          LDX  I3 RXR3+1    RESTORE TV TO REG 3         W1L10240
                          BSC  L  PRIN1+2   PRINT MSG AND EXIT          W1L10250
                    *                                                   W1L10260
                    SR020 LD    1 0         CHECK FOR EMBEDDED BLANKS   W1L10270
                          S       SR902                                 W1L10280
                          BSC  L  SR010,Z   BR-EMBEDDED BLANK ERROR     W1L10290
                          MDX   1 1                                     W1L10300
                          MDX   3 1         INCR CHAR CNT               W1L10310
                          MDX     SR020     CONT BLANK CHECK            W1L10320
                    *                                                   W1L10330
                          LD    1 -5        CHECK FOR BLANK NAME FIELD  W1L10340
                          S       SR902                                 W1L10350
                          BSC  L  SR010,+-  BR-FILE NAME BLANK          W1L10360
                    *                                                   W1L10370
                    *************************************************** W1L10380
                    *                                                 * W1L10390
                    *             PACK FILE NAME                      * W1L10400
                    *                                                 * W1L10410
                    *************************************************** W1L10420
                    SR060 MDX   1 -5        NAME IS VALID               W1L10430
                          LDX   3 -5        PACK NAME                   W1L10440
                          SLT     32        CLEAR REGISTERS             W1L10450
                    *                                                   W1L10460
                    SR070 STD     SR908     CLEAR NAME SAVE AREA        W1L10470
                          LD    1 0         RETRIEVE CHAR               W1L10480
                          AND     SR903     PREPARE 6 BITS FOR PACK     W1L10490
                          SLA     10                                    W1L10500
                          OR      SR908     ADD 6 BIT CHAR TO PACK NAME W1L10510
                          RTE     32-6                                  W1L10520
                          MDX   1 1         INCR I/O PT                 W1L10530
                          MDX   3 1         INCR CHAR CNT               W1L10540
                          MDX     SR070     CONT NAME PACK              W1L10550
                    *                                                   W1L10560
                          OR      SR904     OR ON DDF INDR TO NAME      W1L10570
                          STD     SR908     SAVE FILE NAME              W1L10580
                    *                                                   W1L10590
                    *************************************************** W1L10600
                    *                                                 * W1L10610
                    *             PERFORM LET/FLET SEARCH             * W1L10620
                    *                                                 * W1L10630
                    *************************************************** W1L10640
                          LDX  I3 RXR3+1    RESTORE REG 3 TO TV         W1L10650
                          LDX  L2 BUF05     SET PT TO DISK BUFFER       W1L10660
                          STX  L2 RDDSK+3   SET UP DISK READ            W1L10670
                          STX  L2 SW010     *CALLING SEQUENCE           W1L10680
                          MDX   2 2         REG 2 PT TO I/O AREA        W1L10690
                    *                                                   W1L10700
                    SR090 LDX   1 -@MXDR-1  SET REG 1 TO MAX DR CNT     W1L10710
                          LD   L1 $ULET+@MXDR+1 FETCH ADDR OF LET       W1L10720
                          MDX   1 1         SKIP IF ALL DRIVES SEARCHED W1L10730
                          MDX     *+1       *BRANCH OTHERWISE           W1L10740
                    *                                                   W1L10750
                    *     PRINT ERROR MSG AND EXIT                      W1L10760
                    *                                                   W1L10770
                    SR080 MDX     SR010                                 W1L10780
                    *                                                   W1L10790
                          BSC     +-        SKIP IF DR BEING USED,      W1L10800
                          MDX     SR010     *BRANCH OTHERWISE           W1L10810
                    SR140 STO   2 -1        SAVE SCTR ADDR FOR READ     W1L10820
                    *                                                   W1L10830
                          BSI  L  RDDSK     FETCH 1 SCTR LET/FLET       W1L10840
                    *                                                   W1L10850
                          LD    2 @SCTN     FETCH LET/FLET SCTR NO.     W1L10860
                          BSC     +-        SKIP,NOT FIRST LET SCTR     W1L10870
                          MDX     SR100     *BRANCH OTHERWISE           W1L10880
                    *                                                   W1L10890
                          S       SR906                                 W1L10900
                          BSC     Z         SKIP IF 1ST SCTR FLET       W1L10910
                          MDX     SR110     BR,NOT 1ST SCTR LET FLET    W1L10920
                    *                                                   W1L10930
                    SR100 LD    2 @UAFX     INITIALIZE BLK ADDR ACC     W1L10940
                          SLA     4         *TO ADDR 1ST PROGRAM        W1L10950
                          STO     SR905     *STORED IN LET/FLET         W1L10960
                    *                                                   W1L10970
                    SR110 LD      SR907     COMPUTE NO. WDS IN CURRENT  W1L10980
                          S     2 @WDSA     *LET/FLET SECTOR            W1L10990
                          STO     SR909                                 W1L11000
                    *                                                   W1L11010
                    SR130 LD    2 @BLCT+@LFHD SAVE BLK CNT OF CURRENT   W1L11020
                          STO     SR910     *LET/FLET ENTRY             W1L11030
                    *                                                   W1L11040
                    *     COMPARE FILE NAME TO ENTRY NAME               W1L11050
                    *                                                   W1L11060
                    *                       FETCH NAME OF CURRENT       W1L11070
                          LD    2 @LFNM+@LFHD *LET/FLET ENTRY           W1L11080
                          S       SR908     COMPARE WITH NAME SOUGHT    W1L11090
                          BSC     Z         SKIP IF 1ST WDS MATCH,      W1L11100
                          MDX     SR120     *BRANCH OTHERWISE           W1L11110
                    *                                                   W1L11120
                          LD    2 @LFNM+1+@LFHD FETCH 2ND WD-ENT NAME   W1L11130
                          S       SR908+1                               W1L11140
                          BSC     Z         SKIP IF NAMES MATCH,        W1L11150
                          MDX     SR120     *BRANCH OTHERWISE           W1L11160
                    *                                                   W1L11170
                    *     RETURN SCTR ADDR AND BLK CNT FOR FILE         W1L11180
                    *                                                   W1L11190
                          LD    2 @LFNM+2+@LFHD FETCH BLK CNT OF FILE   W1L11200
                          SRT     16        *AND PUT IN EXTENSION REG   W1L11210
                    *                                                   W1L11220
                          LD      SR905     FETCH BLK ADDR OF FILE      W1L11230
                          SRA     4         CONVERT TO SCTR ADDR        W1L11240
                          STO     SR905     SAVE SCTR ADDR              W1L11250
                          LD   L  BUF05+1   FETCH CURR DR CODE          W1L11260
                          AND     SR912                                 W1L11270
                          OR      SR905     ADD SECTOR ADDR             W1L11280
                          BSC  I  SEARC     RETURN TO CALLER            W1L11290
                    *                                                   W1L11300
                    *     CONTINUE SEARCH,NO MATCH FOUND                W1L11310
                    *                                                   W1L11320
                    SR912 DC      /F000                                 W1L11330
                    SR120 LD      SR905     COMPUTE ACCUMULATED BLK     W1L11340
                          A       SR910     *ADDR AND                   W1L11350
                          STO     SR905     *SAVE                       W1L11360
                    *                                                   W1L11370
                          MDX   2 @LFEN     PT TO NEXT LET/FLET ENTRY   W1L11380
                          LD      SR909                                 W1L11390
                          S    L  D3        DECREMENT LET/FLET COUNT    W1L11400
                          STO     SR909                                 W1L11410
                          BSC     Z         SKIP WHEN SCTR SEARCHED,    W1L11420
                          MDX     SR130     *BRANCH OTHERWISE           W1L11430
                    *                                                   W1L11440
                    *     PREPARE TO READ DOWN A NEW LET/FLET SCTR      W1L11450
                    *                                                   W1L11460
                          LDX  L2 BUF05+2   ADDR OF BUFFER TO REG 1     W1L11470
                          LD    2 @NEXT                                 W1L11480
                          BSC     +-        SKIP UNLESS LAST LET/FLET   W1L11490
                          MDX     SR090+1   BR TO INITIALIZE NEW DR     W1L11500
                    *                                                   W1L11510
                          LD    2 -1        FETCH CURR SCTR ADDR        W1L11520
                          AND     SR912     AND OUT SCTR ADDR           W1L11530
                          OR    2 @NEXT     OR IN NEW SCTR ADDR         W1L11540
                          MDX     SR140     BRANCH TO CONTINUE          W1L11550
                    *                                                   W1L11560
                    *     CONSTANTS                                     W1L11570
                    *                                                   W1L11580
                    IFILE BSS     2         SCTR ADDRS OF FILES         W1L11590
                    RCSZS BSS     2         RCD CNT/SCTR                W1L11600
                    SW00E DC      *-*       RCD CNT                     W1L11610
                    TEMP  BSS     1         TEMP SAVE AREA              W1L11620
                    RWD   BSS     1         WD CNT OF LAST O/P SCTR     W1L11630
                    D320  DEC     320       320                         W1L11640
                    WDRCD BSS  E  0                                     W1L11650
                          DC      *-*       NO. WDS/RCD-O/P           E W1L11660
                          DC      *-*                                   W1L11670
                    FC997 DC      .W-.      EBC W-BLANK                 W1L11680
                    FC999 DC      .W        EBC W                       W1L11690
                    *                                                   W1L11700
                    FC150 EQU     *                                     W1L11710
                    *                                                   W1L11720
                    *     TEST COL 33 FOR W OR BLANK                    W1L11730
                    *                                                   W1L11740
                          MDX  L  MESS1+22,2 ADJUST ERROR MSG           W1L11750
                          LD    1 7         FETCH CD COL                W1L11760
                          S       FC999     SUB EBC W                   W1L11770
                          BSC  L  *+3,Z     BR-COL 33 NOT W             W1L11780
                          STX  L  FC998     TURN ON WARNING SW          W1L11790
                          MDX     *+3       CONT PROCESS D-CARD         W1L11800
                          A       FC997     TEST FOR BLANK              W1L11810
                          BSC  L  PRIN1,Z   BR-COL 33 INVALID           W1L11820
                          LDX  L1 BUF03     REG 1=I/O AREA ADDR         W1L11830
                          MDX  L  CARDS,0                               W1L11840
                          MDX     FC014     BR-CARD INPUT SPECIFIED     W1L11850
                    *                                                   W1L11860
                    *     DO LET/FLET SEARCH FOR INPUT FILE NAME        W1L11870
                    *                                                   W1L11880
                          BSI  L  SEARC     SEARCH LET/FLET             W1L11890
                          STO  L  BUF06+1   SET SCTR ADDR OF INPUT FILE W1L11900
                          SLT     16                                    W1L11910
                          STO     IFILE     SET DISK BLOCK COUNT        W1L11920
                    *                                                   W1L11930
                    *     COMPUTE INPUT RCD CNT/SCTR                    W1L11940
                    *                                                   W1L11950
                    FC014 LDD     D320      LOAD 320                    W1L11960
                          D    L  RCDSZ     DIVIDE BY I/P RCD SIZE      W1L11970
                          STO     RCSZS     SAVE RCD CNT/SCTR,INPUT     W1L11980
                    *                                                   W1L11990
                    *     DO LET/FLET SEARCH FOR OUTPUT FILE NAME       W1L12000
                    *                                                   W1L12010
                          LDX  L1 BUF03+6   REG 1 PT TO RPG FILE NAME   W1L12020
                          MDX  L  MESS2+16,13 ADJUST ERROR MSG          W1L12030
                          BSI  L  SEARC     SEARCH LET/FLET             W1L12040
                          STO  L  BUF05+1   SAVE SCTR ADDR OF RPG FILE  W1L12050
                          SLT     16                                    W1L12060
                          STO     IFILE+1   SET DISK BLOCK CNT          W1L12070
                    *                                                   W1L12080
                          LD   L  RCDSZ+1   COMPUTE NO. OF WDS PER      W1L12090
                          SRT     1         *RPG RCD                    W1L12100
                          STO  L  TOTAL     SAVE (RPG RCD SIZE)/2       W1L12110
                          SLT     16                                    W1L12120
                          BSC  L  *+2,-     BR-RPG RCD SIZE IS EVEN     W1L12130
                          MDX  L  TOTAL,1   INCR NO. WDS/RCD BY 1       W1L12140
                          LD   L  TOTAL                                 W1L12150
                          STO     WDRCD+1   SAVE WD/RCD-OUTPUT          W1L12160
                    *                                                   W1L12170
                    *     COMPUTE OUTPUT RCD CNT/SCTR                   W1L12180
                    *                                                   W1L12190
                          LDD     D320                                  W1L12200
                          D       TOTAL                                 W1L12210
                          STO     RCSZS+1   SAVE RCD CNT/SCTR,OUTPUT    W1L12220
                          STO  L  CNT2      SET O/P RCD CNT             W1L12230
                    *************************************************** W1L12240
                    *                                                 * W1L12250
                    *             DETERMINE WHETHER OR NOT FILE SIZES * W1L12260
                    *             *ARE ADEQUATE FOR CONVERSION        * W1L12270
                    *                                                 * W1L12280
                    *************************************************** W1L12290
                          MDX  L  CARDS,0                               W1L12300
                          MDX     *+3       BR-CARD INPUT SPECIFIED     W1L12310
                          LD      IFILE     ACC=DISK BLK CNT            W1L12320
                          BSI     SCTRA     COMPUTE SCTRS AVAILABLE     W1L12330
                          BSI     CHECK     CHECK FILE SIZE-I/P         W1L12340
                    *                                                   W1L12350
                          MDX  L  MESS3+12,13 ADJUST ERROR MSG          W1L12360
                          LD      IFILE+1   ACC=DISK BLOCK CNT          W1L12370
                          BSI     SCTRA     COMPUTE SCTRS AVAILABLE     W1L12380
                          MDX  L  SW00D,1   INCR RCD SIZE PT            W1L12390
                          MDX  L  SW00E,1   ACCT FOR EOF RCD IN RCD CNT W1L12400
                          BSI     CHECK     CHECK FILE SIZE-O/P         W1L12410
                    *                                                   W1L12420
                          SLA     16                                    W1L12430
                          STO     SW00C     TURN OFF D-CARD SW          W1L12440
                          BSC  L  FC015     READ THE NEXT CARD          W1L12450
                    *                                                   W1L12460
                    *     CHECK FILE SIZE                               W1L12470
                    *                                                   W1L12480
                    CHECK DC      *-*       ENTRY POINT                 W1L12490
                          LD      SW00E     GET RCD CNT                 W1L12500
                          SRT     16        SHIFT FOR DIVIDE            W1L12510
                          D    I  SW00D     DIVIDE BY NO. RCDS/SCTR     W1L12520
                          STO     TEMP                                  W1L12530
                          SLT     16        CHECK FOR REMAINDER         W1L12540
                          BSC  L  *+2,+-    BR-NO REMAINDER             W1L12550
                          MDX  L  TEMP,1    TEMP=SCTRS NEEDED           W1L12560
                          LD      TEMP      ACC=NO. SCTRS NEEDED        W1L12570
                          S       TOTAL     SUB NO. SCTRS AVAILABLE     W1L12580
                          BSC  I  CHECK,+   BR-FILE SIZE ADEQUATE       W1L12590
                    *                                                   W1L12600
                          LDX  L2 MESS3     SET ERROR MSG ADDR          W1L12610
                          BSC  L  PRIN1+2   PRINT DIAGNOSTIC AND EXIT   W1L12620
                    *                                                   W1L12630
                    *     COMPUTE SCTR CNT FROM DISK BLK CNT            W1L12640
                    *                                                   W1L12650
                    SCTRA DC      *-*       ENTRY POINT                 W1L12660
                          SRT     4         DIVIDE BY 16                W1L12670
                          STO     TOTAL     SAVE NO. SCTRS              W1L12680
                          SLA     16        CLEAR ACC                   W1L12690
                          SLT     4         ACC=REMAINDER FROM DIVIDE   W1L12700
                          BSC  I  SCTRA,+-  BR-REMAINDER ZERO           W1L12710
                          MDX  L  TOTAL,1   ACCT FOR REMAINDER          W1L12720
                          BSC  I  SCTRA     RETURN                      W1L12730
                    *                                                   W1L12740
                    *                                                   W1L12750
                    *     DIAGNOSTIC MESSAGE PRINT                      W1L12760
                    *                                                   W1L12770
                          BSS  E  0                                     W1L12780
                    SW000 DC      /7001     PRINT PARAM               E W1L12790
                          DC      BUF04-1                               W1L12800
                    PRINT DC      *-*       ENTRY-SAVED RETURN ADDR     W1L12810
                          STX   2 SW000+1   SET OUTPUT BUFFER ADDR      W1L12820
                          LDD     SW000     LOAD OUTPUT AREA ADDR       W1L12830
                          BSI  L  BUF02+3   PRINT DIAGNOSTIC MESSAGE    W1L12840
                          BSC  I  PRINT     RETURN                      W1L12850
                    *                                                   W1L12860
                    *************************************************** W1L12870
                    *                                                 * W1L12880
                    *             CONVT-SUBR WHICH CONVERTS ITG FLD OF* W1L12890
                    *             *UNPACKED(1 CHAR PER WD) RIGHT-     * W1L12900
                    *             *JUSTIFIED EBCDIC CHAR TO BINARY NO.* W1L12910
                    *                                                 * W1L12920
                    *             XR1= FIELD-1 ON ENTRY               * W1L12930
                    *             TOTAL=RESULTANT FIELD               * W1L12940
                    *                                                 * W1L12950
                    *************************************************** W1L12960
                    *                                                   W1L12970
                    SW00C DC      0         D-CARD SW                   W1L12980
                          DC      CV005     RESTORE WD                  W1L12990
                    *                                                   W1L13000
                    CONVT DC      *-*       ENTRY PT                    W1L13010
                          SLA     16        ZERO RESULTANT FLD          W1L13020
                          STO     TOTAL                                 W1L13030
                    *                                                   W1L13040
                          LD      SW00C     LOAD D-CARD SW              W1L13050
                          BSC  L  CV002,+-  BR-  S-CARD CALCULATION     W1L13060
                          LD      CV006     SET SWITCHES FOR ABNORMAL   W1L13070
                          STO     SW00A     *EXIT ON ALPHABETIC CHAR    W1L13080
                          STO     SW00B     *DETECTION                  W1L13090
                          LD      CV008     SET SW FOR SUBR RESTORE     W1L13100
                          STO     CV007     *ON EXIT                    W1L13110
                    *                                                   W1L13120
                    CV004 MDX   1 1         INCR CD COL PT              W1L13130
                          LD    1 0         TEST FOR LEADING BLANK      W1L13140
                          S    L  H0040                                 W1L13150
                          BSC  L  CV003,+-  BR-LEADING BLANK FOUND      W1L13160
                          MDX     *+1       SKIP OTHERWISE              W1L13170
                    *                                                   W1L13180
                    CV002 MDX   1 1         INCR CD COL PT              W1L13190
                          LD    1 0         FETCH CD COL                W1L13200
                          S       H00F0     TEST FOR NUMERIC DIGIT      W1L13210
                          BSC  L  CV005,+Z  BR-DGT BELOW NUM RANGE      W1L13220
                    SW00A EQU     *-1                                   W1L13230
                          S       H9        CONT TEST                   W1L13240
                          BSC  L  CV005,Z-  BR- DGT ABOVE NUM RANGE     W1L13250
                    SW00B EQU     *-1                                   W1L13260
                    *                                                   W1L13270
                          A       H9        NUM DGT-GET VALUE           W1L13280
                          STO     CV001     SAVE NEW DIGIT VALUE        W1L13290
                    *                                                   W1L13300
                          LD      TOTAL     GET PARTIAL SUM             W1L13310
                          M       C10       MPY TOTAL FLD BY 10         W1L13320
                          STO     CV000     SAVE OVERFLOW               W1L13330
                          SLT     16        SHIFT RSLT TO ACC           W1L13340
                          A       CV001     ADD NEW RIGHTHAND DIGIT     W1L13350
                          STO     TOTAL     SAVE RESULT                 W1L13360
                    *                                                   W1L13370
                          MDX   2 -1        SKIP-COMPLETE FIELD TESTED  W1L13380
                          MDX     CV002     CONT FLD TEST               W1L13390
                          BSC  L  CV005-1   FETCH RESULT                W1L13400
                    CV007 EQU     *-1                                   W1L13410
                    *                                                   W1L13420
                    CV003 MDX   2 -1        SKIP-COMPLETE FLD TESTS     W1L13430
                          MDX     CV004     CONTINUE TESTING FLD        W1L13440
                    *                                                   W1L13450
                          LD      CONVT-1   RESET SWITCHES              W1L13460
                          STO     SW00A                                 W1L13470
                          STO     SW00B                                 W1L13480
                          LD      CV009                                 W1L13490
                          STO     CV007                                 W1L13500
                    *                                                   W1L13510
                          MDX   1 1         INCR CD COL PT              W1L13520
                    CV005 LD      TOTAL     FETCH RESULT                W1L13530
                          BSC  I  CONVT     RETURN                      W1L13540
                    *                                                   W1L13550
                    CV006 DC      *                                     W1L13560
                          BSC  L  PRIN1     PRINT DIAGNOSTIC AND EXIT   W1L13570
                    *                                                   W1L13580
                    *                                                   W1L13590
                    *     CONSTANTS                                     W1L13600
                    *                                                   W1L13610
                    CV008 DC      CV003+2                               W1L13620
                    CV009 DC      CV005-1                               W1L13630
                    C10   DC      10        10                          W1L13640
                    CV001 BSS     1         DGT SAVE AREA               W1L13650
                    CV000 DC      *-*                                   W1L13660
                    TOTAL BSS     1         RESULTANT SAVE AREA         W1L13670
                    SSW   DC      *-*       S-CARD SW                   W1L13680
                    *                                                   W1L13690
                    *************************************************** W1L13700
                    *                                                 * W1L13710
                    *             PRINT SYNTAX DIAGNOSTIC IF NECESSARY* W1L13720
                    *                                                 * W1L13730
                    *************************************************** W1L13740
                    *                                                   W1L13750
                    ADDR5 DC      BUF03    CD BUFFER ADDR               W1L13760
                    PRIN2 DC      *-*       ENTRY PT                    W1L13770
                          MDX  L  SESW,0                                W1L13780
                          MDX     SXR2+2    SKIP-MSG ALREADY PRINTED    W1L13790
                          STX     SESW      SET SYNTAX ERROR SW         W1L13800
                    *                                                   W1L13810
                          MDX  L  COLMN,1   COMPUTE COL NO.             W1L13820
                          LD      COLMN     AND CONVERT TO EBCDIC       W1L13830
                          S       ADDR5                                 W1L13840
                          A       ONE       ADD 1 TO COL NO.            W1L13850
                    *                                                   W1L13860
                          SRT     16                                    W1L13870
                          D    L  D10                                   W1L13880
                          OR      H00F0     RETRIEVE LEFTHAND DGT       W1L13890
                          SLA     8                                     W1L13900
                          STO  L  MESS4+24  SAVE LEFTHAND DGT           W1L13910
                    *                                                   W1L13920
                          SLT     16                                    W1L13930
                          OR      H00F0     RETRIEVE RIGHTHAND DGT      W1L13940
                          OR   L  MESS4+24                              W1L13950
                          STO  L  MESS4+24  SAVE RIGHTHAND DGT          W1L13960
                    *                                                   W1L13970
                          STX   2 SXR2+1    SAVE REG 2                  W1L13980
                          LDX  L2 MESS4     SET MESSAGE PT              W1L13990
                          BSI     PRINT     PRINT DIAGNOSTIC            W1L14000
                          STX  L  DIAGS     SET DIAGNOSTIC SW           W1L14010
                    *                                                   W1L14020
                    SXR2  LDX  L2 *-*       RESTORE REG 2               W1L14030
                          BSC  I  PRIN2     RETURN                      W1L14040
                    *                                                   W1L14050
                    *************************************************** W1L14060
                    *                                                 * W1L14070
                    *             CONVERT FIELD SPECIFICATIONS RECORDS* W1L14080
                    *                                                 * W1L14090
                    *************************************************** W1L14100
                    *                                                   W1L14110
                          DC      0         FIELD SPECIFICATION SW      W1L14120
                    *                                                   W1L14130
                    FC016 EQU     *                                     W1L14140
                          MDX  L  MESS4,-4  ADJUST ERROR MSG            W1L14150
                          STX     SSW       TURN ON S-CARD SW           W1L14160
                    *                                                   W1L14170
                    *     TEST CARD FOR EMBEDDED BLANKS                 W1L14180
                    *                                                   W1L14190
                          LDX   1 71        SET LOOP CONTROL CNT        W1L14200
                    FC600 EQU     *                                     W1L14210
                          LD   L1 BUF03-1   FETCH CD COL                W1L14220
                          S       H0040     SUB EBC BLANK               W1L14230
                          BSC  L  FC130+5,Z BR-1ST NONBLANK COL DETECTEDW1L14240
                          MDX   1 -1        CONTINUE SEARCH FOR 1ST     W1L14250
                          MDX     FC600     *NONBLANK COL               W1L14260
                          BSC  L  FC015     READ NEXT CARD              W1L14270
                    *                                                   W1L14280
                    FC130 LD   L1 BUF03-1   TEST FOR EMBEDDED BLANKS    W1L14290
                          S       H0040                                 W1L14300
                          BSI  L  PRIN2,+-  BR- BLANK COL FOUND         W1L14310
                          MDX   1 -1        CONTINUE TESTING FOR EM-    W1L14320
                          MDX     FC130     *EMBEDDED BLANKS            W1L14330
                    *                                                   W1L14340
                    *     INITIALIZE REGISTERS AND COUNTERS             W1L14350
                    *                                                   W1L14360
                    FC120 EQU     *                                     W1L14370
                          MDX  L  MESS4,4   ADJUST ERROR MSG            W1L14380
                          LDX  L1 BUF03-1   REG 1=I/O AREA ADDR-1       W1L14390
                          MDX  L  FC016-1,0 TEST FLD SPEC SW            W1L14400
                          MDX     FC610     SKIP-ONE FLD SPEC CD READ   W1L14410
                          STX     FC016-1   SET FLD SPEC SW ON          W1L14420
                          LDX  L2 COMPR     REG 2=COMPRESSION ADDR      W1L14430
                          BSC  L  FC200     TEST FOR FLD TYPE           W1L14440
                    *                                                   W1L14450
                    FC610 EQU     *                                     W1L14460
                    SSXR2 LDX  L2 *-*       RESTORE REG 2               W1L14470
                          BSC  L  FC200     SKIP-ONE FLD SPEC CD READ   W1L14480
                    *                                                   W1L14490
                    *                                                   W1L14500
                    *     CONVERT 3 CD COL FLD TO BINARY NO.            W1L14510
                    *     *PRINT DIAGNOSTIC IF NO. ZERO                 W1L14520
                    *                                                   W1L14530
                    CONV1 DC      *-*       ENTRY PT                    W1L14540
                          STX   2 C1XR2+1   SAVE REG 2                  W1L14550
                          LDX   2 3         SET FIELD LNG PT            W1L14560
                          BSI  L  CONVT     CONVERT FIELD TO BINARY     W1L14570
                          BSI  L  PRIN2,+   BR-SYNTAX INVALID           W1L14580
                          LD      TOTAL     RESTORE ACC TO COLUMN       W1L14590
                    C1XR2 LDX  L2 *-*       RESTORE REG 2               W1L14600
                          BSC  I  CONV1     RETURN                      W1L14610
                    *                                                   W1L14620
                    *     CONVERT 2 CD COL FLD TO BINARY NO.            W1L14630
                    *     *PRINT DIAGNOSTIC IF NO. ZERO OR              W1L14640
                    *     *IF NO. EXCEEDS 14                            W1L14650
                    *                                                   W1L14660
                    *                                                   W1L14670
                    H00F0 DC      /00F0     CONSTANT /00F0              W1L14680
                    H9    DC      9         9                           W1L14690
                    *                                                   W1L14700
                    CONV2 DC      *-*       ENTRY PT                    W1L14710
                          STX   2 C2XR2+1   SAVE REG 2                  W1L14720
                          LDX   2 2         SET FIELD LNG PT            W1L14730
                          BSI  L  CONVT     CONVERT FIELD TO BINARY     W1L14740
                          BSI  L  PRIN2,+   BR-SYNTAX INVALID           W1L14750
                          S    L  D14       TEST FOR VALIDITY           W1L14760
                          BSI  L  PRIN2,-Z  BR-INVALID FLD LNG          W1L14770
                    *                                                   W1L14780
                    *                                                   W1L14790
                          LD      TOTAL                                 W1L14800
                    C2XR2 LDX  L2 *-*       RESTORE REG 2               W1L14810
                          SLA     8         SAVE FLD LNG IN BITS 0-7 OF W1L14820
                          STO   2 2         *3RD WD OF COMPRESSION      W1L14830
                          BSC  I  CONV2     RETURN                      W1L14840
                    *                                                   W1L14850
                    *                                                   W1L14860
                    *     CONSTANTS                                     W1L14870
                    *                                                   W1L14880
                    SESW  DC      *-*       SYNTAX ERROR SW             W1L14890
                    COLMN BSS     1         COL ADDR SAVE AREA          W1L14900
                    H0040 DC      /0040     EBCDIC BLANK                W1L14910
                    TOTFL DC      0         TOTAL FLD LENGTH            W1L14920
                    RCDCT BSS     1         RECORD CNT                  W1L14930
                    ADDR1 DC      BUF03+70  MAX CD COL ADDR             W1L14940
                    RSW   DC      *-*       R-TYPE INDR                 W1L14950
                    *                                                   W1L14960
                    *                                                   W1L14970
                    *     TEST FOR R- OR J-FLD                          W1L14980
                    *                                                   W1L14990
                          DC      8         R-J                         W1L15000
                          DC      /10       R-I                         W1L15010
                    FC022 S       *-2                                   W1L15020
                          BSC     Z         BR- R-FLD DETECTED          W1L15030
                          MDX     FC570     BR OTHERWISE                W1L15040
                    *************************************************** W1L15050
                    *                                                 * W1L15060
                    *             COMPRESSION FOR R-FLD               * W1L15070
                    *                                                 * W1L15080
                    *************************************************** W1L15090
                          LD   L  TABL1+2   SET ADDR OF RCNVT IN        W1L15100
                          STO   2 0         *COMPRESSION                W1L15110
                          STX     RSW       SET R-TYPE INDR             W1L15120
                          LD   L  D2        ACC= FLD LNG IN WDS         W1L15130
                          MDX     FC560     GO BUILD COMPRESSION        W1L15140
                    *                                                   W1L15150
                    *     TEST FOR J-FLD                                W1L15160
                    *                                                   W1L15170
                    FC570 EQU     *                                     W1L15180
                          A       FC022-2                               W1L15190
                          BSC  L  JFLD,+-   BR-  J-FLD                  W1L15200
                    FC220 EQU     *                                     W1L15210
                          BSI     PRIN2     PRINT DIAGNOSTIC            W1L15220
                          MDX     FC210     CONT TO CONVERT CARD        W1L15230
                    *                                                   W1L15240
                    *                                                   W1L15250
                    *     TEST FOR I/P FLD POSITION VALIDITY            W1L15260
                    *                                                   W1L15270
                    IPPOS DC      *-*                                   W1L15280
                    IPPVL DC      *-*       ENTRY PT                    W1L15290
                          A       IPPOS     ADD FLD LNG TO POS CNT      W1L15300
                          STO     IPPOS                                 W1L15310
                          S    L  RCDSZ                                 W1L15320
                    *                       BR- ADDITION OF FLD LNG     W1L15330
                          BSI  L  PRIN2,-Z  *EXCEEDS RCD LNG            W1L15340
                          BSC  I  IPPVL     RETURN TO CALLER            W1L15350
                    *                                                   W1L15360
                    *************************************************** W1L15370
                    *                                                 * W1L15380
                    *             COMPRESSION FOR I-FLD               * W1L15390
                    *                                                 * W1L15400
                    *************************************************** W1L15410
                    ONE   DC      1         1                           W1L15420
                    *                                                   W1L15430
                    IFLD  LD   L  TABL1+1   SET ADDR OF ICNVT IN        W1L15440
                          STO   2 0         *COMPRESSION                W1L15450
                    *                                                   W1L15460
                    *     ACC= FLD LNG IN WORDS                         W1L15470
                    *                                                   W1L15480
                          LD      ONE                                   W1L15490
                          MDX  L  INTSW,0   SKIP-NO 1 WD ITGS           W1L15500
                          MDX     FC550                                 W1L15510
                          A       ONE                                   W1L15520
                    FC560 MDX  L  EPREC,0   SKIP-STD PREC SPECIFIED     W1L15530
                          A       ONE                                   W1L15540
                    *                                                   W1L15550
                    FC550 BSI     IPPVL     TEST FLD LNG FOR VALIDITY   W1L15560
                    *                                                   W1L15570
                          BSI     CONV2     CONVERT FLD LNG             W1L15580
                    *                                                   W1L15590
                          BSI     OPPVL     CHECK O/P FLD LNG           W1L15600
                    *                                                   W1L15610
                          BSI  L  SCALE     COMPUTE SCALE               W1L15620
                    *                                                   W1L15630
                          LD   L  TOTAL     CALCULATE NO. NON-DECML POS W1L15640
                          S     1 1                                     W1L15650
                          A       H00F0                                 W1L15660
                          BSI  L  PRIN2,+Z  BR-FLD LNG LT SCALE,INVALID W1L15670
                          MDX  L  RSW,0     SKIP TRUNCATION CHECK IF    W1L15680
                          MDX     FC030     *R-TYPE INDR SET            W1L15690
                          S    L  D5        TEST FOR TRUNCATION         W1L15700
                          BSI  L  TRUNK,+Z  BR-TRUNCATION OCCURS        W1L15710
                    *                                                   W1L15720
                    FC030 EQU     *                                     W1L15730
                          SLA     16        RESET R-TYPE INDR           W1L15740
                          STO     RSW                                   W1L15750
                          MDX   1 2         INCR CD COL PT              W1L15760
                          LD    1 1         TEST FOR PACK OPTION        W1L15770
                          S    L  P                                     W1L15780
                          BSC  L  FC018,Z   BR-PACK OPTION OFF          W1L15790
                    *                                                   W1L15800
                          LD   L  PO        OR PACK OPTION INTO         W1L15810
                          OR    2 2         *COMPRESSION                W1L15820
                          STO   2 2                                     W1L15830
                          MDX   1 3         ADJUST I/O AREA PT          W1L15840
                          MDX     FC018     TEST NEXT FLD               W1L15850
                    *                                                   W1L15860
                    *************************************************** W1L15870
                    *                                                 * W1L15880
                    *             COMPRESSION FOR J-FLD               * W1L15890
                    *                                                 * W1L15900
                    *************************************************** W1L15910
                    *                                                   W1L15920
                    JFLD  LD   L  TABL1+7   SAVE ADDR OF JCNVT IN       W1L15930
                          STO   2 0         *COMPRESSION                W1L15940
                          LD   L  EPREC                                 W1L15950
                    *                       BR-EXTENDED PREC SPECIFIED  W1L15960
                          BSI  L  PRIN2,Z   *WITH J-FLD TYPE--INVALID   W1L15970
                    *                                                   W1L15980
                          LD   L  D2                                    W1L15990
                          BSI     IPPVL     TEST FLD LNG FPR VALIDITY   W1L16000
                    *                                                   W1L16010
                          BSI     CONV2     CONVERT FLD LNG             W1L16020
                    *                                                   W1L16030
                          BSI     OPPVL     CHECK O/P FLD LNG           W1L16040
                    *                                                   W1L16050
                          BSI     SCALE     COMPUTE SCALE               W1L16060
                          LD   L  TOTAL                                 W1L16070
                          S     1 1         TEST FOR TRUNCATION         W1L16080
                          A       H00F0                                 W1L16090
                          BSI  L  PRIN2,+Z  BR-FLD LNG LT SCALE,INVALID W1L16100
                          S    L  D10                                   W1L16110
                          BSI  L  TRUNK,+Z  BR-TRUNCATION OCCURS        W1L16120
                          MDX     FC030     CONT COMPRESSION            W1L16130
                    *                                                   W1L16140
                    *                                                   W1L16150
                    FC630 EQU     *                                     W1L16160
                          SLA     16                                    W1L16170
                          STO     SESW      RESET SYNTAX ERROR SW       W1L16180
                          STX  L2 SSXR2+1   SAVE REG 2                  W1L16190
                          BSC  L  FC015     READ NEXT CARD              W1L16200
                    *                                                   W1L16210
                    *     TEST FOR O/P FLD POSITION VALIDITY            W1L16220
                    *                                                   W1L16230
                    *                                                   W1L16240
                    COMMA DC      /6B       EBC COMMA                   W1L16250
                    OPPVL DC      *-*       ENTRY PT                    W1L16260
                          LD    2 2                                     W1L16270
                          SRA     8         ACC=O/P FLD LNG             W1L16280
                          STO     FC992     SAVE O/P PREC,UNPACKED      W1L16290
                          LD    1 3         TEST FOR PACK OPTION        W1L16300
                          S       P         TEST FOR PACK OPTION        W1L16310
                          BSC  L  *+4,Z     BR-NO PACKING               W1L16320
                          LD      FC992     GET O/P PREC                W1L16330
                          SRA     1         DIVIDE BY 2 FOR PACK        W1L16340
                          A       ONE       ADD ONE FOR REMAINDER       W1L16350
                          STO     FC992     SAVE NEW O/P PREC           W1L16360
                          LD      FC992                                 W1L16370
                          A       TOTFL                                 W1L16380
                          STO     TOTFL     ADJUST TOTAL FLD LNG        W1L16390
                          LD      FC992     FETCH O/P PREC              W1L16400
                          A     2 1         ADD O/P COL -1              W1L16410
                          S       RCDSZ+1   ACC=COL NO. OF LAST CHAR    W1L16420
                          BSI  L  PRIN2,Z-  BR-FLD EXCEEDS RCD BOUNDARY W1L16430
                          BSC  I  OPPVL     RETURN TO CALLER            W1L16440
                    *                                                   W1L16450
                    *                                                   W1L16460
                    *     TEST FOR NEXT CARD READ                       W1L16470
                    *                                                   W1L16480
                    FC018 EQU     *                                     W1L16490
                    *                       INCR COMPRESSION FLD TO     W1L16500
                          MDX   2 3         *POINT TO NEXT ENTRY        W1L16510
                    FC210 EQU     *                                     W1L16520
                          LD    1 0         TEST COL FOR R SPECIFYING   W1L16530
                          S       FC995     *REPEAT SPECIFICATION       W1L16540
                          BSC  L  FC211,Z   BR-REPEAT SPEC NOT GIVEN    W1L16550
                    *                                                   W1L16560
                          LD      FC994     LOAD REPEAT COUNTER         W1L16570
                          BSC  L  FC212,Z   BR-REPEAT CTR ALREADY SET   W1L16580
                    *                                                   W1L16590
                          SLA     16        INITIALIZE ADJUSTMENT       W1L16600
                          STO     FC993     *VALUE FOR COL ENTRY        W1L16610
                    *                                                   W1L16620
                          BSI  L  CONV1     FETCH REPEAT CTR            W1L16630
                          STX   1 FC214+1   SAVE REG 1                  W1L16640
                    FC212 S       ONE       SUB 1 FROM CTR              W1L16650
                          STO     FC994     *AND SAVE CTR               W1L16660
                    FC214 LDX  L1 *-*       RESTORE REG 1               W1L16670
                    *                                                   W1L16680
                          BSC  L  FC211,+   BR-REPEAT COUNTER TP ZERO   W1L16690
                    *                                                   W1L16700
                          LD      FC993     ADJUST COL ENT MODIFIER     W1L16710
                          A       FC992     *BY OUTPUT PRECISION LNG    W1L16720
                          STO     FC993                                 W1L16730
                    *                                                   W1L16740
                          LDX  I1 COLMN     REG 1 PT TO REPEATED SPEC   W1L16750
                          MDX     FC213     GO BUILD COMPRESSION        W1L16760
                    *                                                   W1L16770
                    FC211 EQU     *                                     W1L16780
                          LD   L  XR1       TEST INPUT PT               W1L16790
                          S    L  ADDR1                                 W1L16800
                          BSC  L  FC630,-   BR-INPUT PT COL 71 OR BEYONDW1L16810
                    *                                                   W1L16820
                          LD    1 0         TEST COL FOR BLANK          W1L16830
                          S    L  H0040                                 W1L16840
                          BSC  L  FC630,+-  BR-COL BLANK, READ NEXT CD  W1L16850
                    *                                                   W1L16860
                          LD    1 0         TEST COL FOR COMMA          W1L16870
                          S       COMMA                                 W1L16880
                          BSC  L  FC200,+-  BR-COMMA DETECTED           W1L16890
                          BSI  L  PRIN2     PRINT DIAGNOSTIC            W1L16900
                          MDX   1 1         CONTINUE TESTING FOR        W1L16910
                          MDX     FC211     *COMMA                      W1L16920
                    FC992 DC      *-*       SAVED O/P PREC              W1L16930
                    FC993 DC      *-*       TEMP SAVE AREA              W1L16940
                    FC994 DC      *-*       REPEAT COUNTER              W1L16950
                    FC995 DC      .R        EBC R                       W1L16960
                    *                                                   W1L16970
                    *                                                   W1L16980
                    FC200 EQU     *                                     W1L16990
                          STX   2 FC993     SAVE REG 2                  W1L17000
                          MDX  L  FC993,2   PT TO O/P PREC              W1L17010
                          STX  L1 COLMN     SAVE COL NO.                W1L17020
                          SLA     16                                    W1L17030
                          STO  L  SESW      TURN OFF SYNTAX ERROR SW    W1L17040
                    FC213 EQU     *                                     W1L17050
                          LD    1 1                                     W1L17060
                          S    L  H0040                                 W1L17070
                          BSC  L  FC630,+-  BR-CD COL BLANK             W1L17080
                    *                                                   W1L17090
                    *     TEST FOR X-FLD                                W1L17100
                    *                                                   W1L17110
                    FC019 LD    1 1                                     W1L17120
                          S       X         TEST FOR X-FLD              W1L17130
                          BSC  L  FC017,Z   BR-NOT X-FLD                W1L17140
                    *                                                   W1L17150
                    *************************************************** W1L17160
                    *                                                 * W1L17170
                    *             COMPRESSION FOR X-FLD               * W1L17180
                    *                                                 * W1L17190
                    *************************************************** W1L17200
                          MDX   1 1         INCR CD COL PT              W1L17210
                          LD      TABL1     SAVE ADDR OF XCNVT IN       W1L17220
                          STO   2 0         *COMPRESSION                W1L17230
                          BSI  L  CONV1     CONVERT BYPASS WD CNT       W1L17240
                          STO   2 1         SAVE WD CNT IN COMPRESSION  W1L17250
                          BSI  L  IPPVL     TEST WD CNT FOR VALIDITY    W1L17260
                          MDX   2 2         TEST NEXT FLD               W1L17270
                          MDX     FC211                                 W1L17280
                    *                                                   W1L17290
                    HF9   DC      /F9       EBC 9                       W1L17300
                    D14   DC      14        14                          W1L17310
                    *                                                   W1L17320
                    *     FETCH FIELD SCALE AND SAVE                    W1L17330
                    *                                                   W1L17340
                    SCALE DC      *-*       ENTRY PT                    W1L17350
                          LD    1 1         COMPARE CD COL TO           W1L17360
                          S    L  H00F0     *EBC 0                      W1L17370
                          BSI  L  PRIN2,+Z  BR-NONNUMERIC DGT FOUND     W1L17380
                          LD    1 1         COMPARE CD COL TO           W1L17390
                          S       HF9       *EBC 9                      W1L17400
                          BSI  L  PRIN2,-Z  BR-NONNUMERIC DGT FOUND     W1L17410
                          A    L  H9        COMPUTE SCALE               W1L17420
                          OR    2 2         SAVE SCALE IN COMPRESSION   W1L17430
                          STO   2 2                                     W1L17440
                          BSC  I  SCALE     RETURN                      W1L17450
                    *                                                   W1L17460
                    *                                                   W1L17470
                    *     CONSTANTS                                     W1L17480
                    *                                                   W1L17490
                    I     DC      /00C9     EBCDIC I                    W1L17500
                    X     DC      /00E7     EBCDIC X                    W1L17510
                    D5    DC      5         5                           W1L17520
                    P     DC      /00D7     EBCDIC P                    W1L17530
                    PO    DC      /0080     PACK OPTION BIT             W1L17540
                    RCDSZ BSS     2         FILE RCD SIZES              W1L17550
                    *                                                   W1L17560
                    *************************************************** W1L17570
                    *                                                 * W1L17580
                    *             CONVERT RCD COL FLD FOR NON X-FLD   * W1L17590
                    *                                                 * W1L17600
                    *************************************************** W1L17610
                    *                                                   W1L17620
                          MDX     *                                     W1L17630
                    FC017 BSI  L  CONV1     CONVERT RCD COL FLD         W1L17640
                          S       D1                                    W1L17650
                    *                                                   W1L17660
                          MDX  L  FC994,0   SKIP-NOT REPEATED SPEC      W1L17670
                          A       FC993     ADD O/P PREC FOR REPEAT     W1L17680
                    *                                                   W1L17690
                          STO   2 1         SAVE COL-1 IN COMPRESSION   W1L17700
                          LD   L  TOTAL                                 W1L17710
                          S       RCDSZ+1   TEST COL NO. FOR VALIDITY   W1L17720
                          BSI  L  PRIN2,-Z  BR-COL NO. INVALID          W1L17730
                          MDX   1 1         INCR CD COL PT              W1L17740
                    *                                                   W1L17750
                    *************************************************** W1L17760
                    *                                                 * W1L17770
                    *             FIELD TYPE DETERMINATION            * W1L17780
                    *                                                 * W1L17790
                    *************************************************** W1L17800
                    *                                                   W1L17810
                          LD      FC017-1   INITIALIZE MULTI-BR INST    W1L17820
                          STO     FC020                                 W1L17830
                          LD    1 0         TEST FOR I-FLD              W1L17840
                          S       I                                     W1L17850
                          BSC  L  IFLD,+-   BR- I FLD                   W1L17860
                          BSC  L  FC022,-   BR- TEST FOR R- OR J-FLD    W1L17870
                          A       D2                                    W1L17880
                          BSC  L  FC220,-   BR-FLD NOT RECOGNIZABLE     W1L17890
                          A       D5                                    W1L17900
                          BSC  L  FC220,Z+  BR-FLD NOT RECOGNIZABLE     W1L17910
                          A       *+1                                   W1L17920
                          STO     *                                     W1L17930
                    FC020 MDX     *         MULTI-BR INST               W1L17940
                          MDX     BFLD      BR- B-FLD                   W1L17950
                          MDX     CFLD      BR- C-FLD                   W1L17960
                          MDX     INTRM     BR- D-FLD                   W1L17970
                          MDX     INTR      BR- E-FLD                   W1L17980
                    *                                                   W1L17990
                    *************************************************** W1L18000
                    *                                                 * W1L18010
                    *             COMPRESSION FOR F-FLD               * W1L18020
                    *                                                 * W1L18030
                    *************************************************** W1L18040
                    *                                                   W1L18050
                    FFLD  LD      TABL1+6   SET ADDR OF FCNVT IN        W1L18060
                          STO   2 0         *COMPRESSION                W1L18070
                          STX     FSW       SET F-SW                    W1L18080
                          BSI  L  CONV1     CONVERT FLD LNG IN CHARS    W1L18090
                          STO   2 3         SAVE CHAR CNT               W1L18100
                    *                                                   W1L18110
                          A     2 1         ACC=COL NO. OF LAST CHAR    W1L18120
                          S       RCDSZ+1                               W1L18130
                          BSI  L  PRIN2,Z-  BR-FLD EXCEEDS RCD BOUNDARY W1L18140
                          LD    2 3         ADJUST TOTAL FLD LNG INDR   W1L18150
                          A    L  TOTFL                                 W1L18160
                          STO  L  TOTFL                                 W1L18170
                    *                                                   W1L18180
                          LD    2 3         DIVIDE FLD LNG IN CHARS     W1L18190
                          SRT     16        *BY 3 TO GET FLD LNG IN WDS W1L18200
                          D       D3                                    W1L18210
                          STO     TABL3                                 W1L18220
                    *                                                   W1L18230
                          SLT     16        DETERMINE WD CNT OF CSP FLD W1L18240
                          BSC     Z                                     W1L18250
                          LD      D1        ADJUST WD CNT OF CSP FLD    W1L18260
                          A       TABL3     *FOR REMAINDER              W1L18270
                    *                                                   W1L18280
                          BSI  L  IPPVL     TEST WD CNT FOR VALIDITY    W1L18290
                          LD      H0341     SAVE /0341 IN COMPRESSION   W1L18300
                          STO   2 2                                     W1L18310
                          MDX   2 4         INCR COMPRESSION PT         W1L18320
                          BSC  L  FC210     TEST NEXT FLD               W1L18330
                    *                                                   W1L18340
                    *     CONSTANTS                                     W1L18350
                    *                                                   W1L18360
                    H0341 DC      /0341     /0341                       W1L18370
                    FSW   DC      *-*       F-FLD TYPE SW               W1L18380
                    TABL1 DC      XCNVT     ADDR OF X-FLD CONVERT SUBR  W1L18390
                          DC      ICNVT     ADDR OF I-FLD CONVERT SUBR  W1L18400
                          DC      RCNVT     ADDR OF R-FLD CONVERT SUBR  W1L18410
                          DC      BCNVT     ADDR OF B-FLD CONVERT SUBR  W1L18420
                          DC      DCNVT     ADDR OF D-FLD CONVERT SUBR  W1L18430
                          DC      ECNVT     ADDR OF E-FLD CONVERT SUBR  W1L18440
                          DC      FCNVT     ADDR OF F-FLD CONVERT SUBR  W1L18450
                          DC      JCNVT     ADDR OF J-FLD CONVERT SUBR  W1L18460
                    TABL3 BSS     3         TEMP SAVE AREA              W1L18470
                    INTRM MDX     DFLD      BR - D-FLD                  W1L18480
                    INTR  MDX     EFLD      BR - E-FLD                  W1L18490
                    *                                                   W1L18500
                    *************************************************** W1L18510
                    *                                                 * W1L18520
                    *             COMPRESSION FOR B-FLD               * W1L18530
                    *                                                 * W1L18540
                    *************************************************** W1L18550
                    *                                                   W1L18560
                    D1    DC      1         1                           W1L18570
                    D2    DC      2         2                           W1L18580
                    D3    DC      3         3                           W1L18590
                    TEMP2 BSS     3         TEMP SAVE AREA              W1L18600
                    BFLD  LD      TABL1+3   SET ADDR OF RCNVT IN        W1L18610
                          STO   2 0         *COMPRESSION                W1L18620
                    *                                                   W1L18630
                          LD   L  INTSW     TEST 1 WD ITG SW            W1L18640
                          BSC  L  *+2,+-    BR-NO 1 WD ITG              W1L18650
                          LD      D1        ACC=1                       W1L18660
                          MDX     FC023                                 W1L18670
                    FC024 LD   L  EPREC     TEST FOR EXTENDED PREC      W1L18680
                          BSC  L  *+2,+-    BR-STD PREC SPECIFIED       W1L18690
                          LD      D3        ACC=3                       W1L18700
                          MDX     *+1                                   W1L18710
                          LD      D2        ACC=2                       W1L18720
                    *                                                   W1L18730
                    FC023 EQU     *                                     W1L18740
                          STO     TABL3     SAVE NO. WD/ENT             W1L18750
                          SLA     6         SAVE NO. WD/ENT             W1L18760
                          STO   2 2         *IN COMPRESSION             W1L18770
                    *                                                   W1L18780
                          BSI  L  CONV1     CONVERT CHAR CNT            W1L18790
                          STO     TABL3+1   SAVE CHAR CNT               W1L18800
                          SRT     8                                     W1L18810
                          BSI  L  PRIN2,Z   BR-PRECISION INVALID        W1L18820
                          SLT     16                                    W1L18830
                          OR    2 2         SAVE CHAR CNT IN            W1L18840
                          STO   2 2         *COMPRESSION                W1L18850
                    *                                                   W1L18860
                          BSI  L  OPPVL     CHECK O/P FLD LNG           W1L18870
                    *                                                   W1L18880
                    *                                                   W1L18890
                          BSI  L  SCALE     RETRIEVE CHAR CNT/WD        W1L18900
                          LD    2 2                                     W1L18910
                          AND  L  HF                                    W1L18920
                          STO     TABL3+2   SAVE CHAR/ENT               W1L18930
                          BSI  L  PRIN2,+   BR-SYNTAX INVALID           W1L18940
                    *                                                   W1L18950
                          LD      TABL3+1   ACC=CHAR CNT                W1L18960
                          SRT     16                                    W1L18970
                          D       TABL3+2   ACC=CHAR CNT/(CHAR/ENT)     W1L18980
                          STO     TABL3+2                               W1L18990
                          SLT     16                                    W1L19000
                          BSC  L  *+2,+-    BR-REMAINDER =0             W1L19010
                          MDX  L  TABL3+2,1                             W1L19020
                    *                                                   W1L19030
                          LD      TABL3+2   ACC=NO. ENT                 W1L19040
                          M       TABL3                                 W1L19050
                          SLT     16        ACC=FLD LNG IN WD           W1L19060
                          BSI  L  IPPVL     TEST WD CNT FOR VALIDITY    W1L19070
                    *                                                   W1L19080
                          LD    2 2         FETCH CHARS/ENT             W1L19090
                          AND  L  HF                                    W1L19100
                          MDX   1 2         ADJUST I/O AREA ADDR        W1L19110
                          MDX  L  CSW,0     SKIP- B-FLD TYPE            W1L19120
                          MDX     C1        CONT CHAR CNT/WD CHECK      W1L19130
                          S       D2                                    W1L19140
                          BSI  L  PRIN2,-Z  BR- CHAR CNT/WD INVALID     W1L19150
                          BSC  L  FC018     TEST NEXT FLD TYPE          W1L19160
                    *                                                   W1L19170
                    *************************************************** W1L19180
                    *                                                 * W1L19190
                    *             COMPRESSION FOR C-FLD               * W1L19200
                    *                                                 * W1L19210
                    *************************************************** W1L19220
                    *                                                   W1L19230
                    CSW   DC      *-*       C-TYPE SW                   W1L19240
                    CFLD  LD      TABL1+3   SET ADDR OF BCNVT IN        W1L19250
                          STO   2 0         *COMPRESSION                W1L19260
                          STX     CSW       SET C-TYPE SW               W1L19270
                          MDX     FC024     COMPLETE COMPRESSION        W1L19280
                    *                                                   W1L19290
                    C1    S    L  D4        TEST VALIDITY,CHAR CNT/WD   W1L19300
                          MDX  L  EPREC,0   SKIP-STD PREC SPECIFIED     W1L19310
                          S       D2                                    W1L19320
                          BSI  L  PRIN2,-Z  BR-CHAR CNT/WD INVALID      W1L19330
                          SLA     16                                    W1L19340
                          STO     CSW       TURN OFF C-TYPE SW          W1L19350
                          BSC  L  FC018     TEST NEXT FLD TYPE          W1L19360
                    *                                                   W1L19370
                    *************************************************** W1L19380
                    *                                                 * W1L19390
                    *             COMPRESSION FOR E-FLD               * W1L19400
                    *                                                 * W1L19410
                    *************************************************** W1L19420
                    EFLD  LD      TABL1+5   SET ADDR OF ECNVT IN        W1L19430
                          STO   2 0         *COMPRESSION                W1L19440
                          BSI  L  CONV1     CONVERT CSP FLD LNG         W1L19450
                          STO     TABL2+1   SAVE CSP FLD LNG            W1L19460
                          A       D6        COMPUTE INPUT FLD LNG IN    W1L19470
                          SRT     16                                    W1L19480
                          D    L  D4        *WORDS                      W1L19490
                          MDX     FC580     CONT COMPRESSION            W1L19500
                    *                                                   W1L19510
                    *************************************************** W1L19520
                    *                                                 * W1L19530
                    *             COMPRESSION FOR D-FLD               * W1L19540
                    *                                                 * W1L19550
                    *************************************************** W1L19560
                    D6    DC      6         6                           W1L19570
                    DFLD  LD      TABL1+4   SET ADDR OF DCNVT IN        W1L19580
                          STO   2 0         *COMPRESSION                W1L19590
                    *                                                   W1L19600
                          BSI  L  CONV1     CONVERT CSP FLD LNG         W1L19610
                          STO     TABL2+1   SAVE CSP FLD LNG            W1L19620
                    *                                                   W1L19630
                    FC580 EQU     *                                     W1L19640
                          BSI  L  IPPVL     TEST FLD LNG FOR VALIDITY   W1L19650
                          MDX   2 1         INCR COMPRESSION PT TEMP    W1L19660
                          SLA     16        CLEAR COMPRESSION WORD      W1L19670
                          STO   2 2                                     W1L19680
                    *                                                   W1L19690
                          BSI  L  SCALE     RETRIEVE CSP SCALE          W1L19700
                          LD    2 2                                     W1L19710
                          STO     TABL2     SAVE CSP SCALE IN TABL2     W1L19720
                    *                                                   W1L19730
                          LD      TABL2+1                               W1L19740
                          SRT     8                                     W1L19750
                          BSI  L  PRIN2,Z   BR-CSP FLD LNG INVALID      W1L19760
                          SLT     16                                    W1L19770
                          OR    2 2         SAVE CSP FLD LNG IN         W1L19780
                          STO   2 2         *COMPRESSION                W1L19790
                    *                                                   W1L19800
                          LD      TABL2+1   COMPUTE NO. NON-DECML       W1L19810
                          S       TABL2     *POS.-I/P                   W1L19820
                          STO     TABL2     SAVE L1-J                   W1L19830
                          BSI  L  PRIN2,Z+  BR-FLD LNG LT SCALE,INVALID W1L19840
                          MDX   2 -1        RESTORE COMPRESSION PT      W1L19850
                    *                                                   W1L19860
                          LD    1 2         TEST FOR =                  W1L19870
                          S       EQ                                    W1L19880
                          BSI  L  PRIN2,Z   BR-SYNTAX INVALID           W1L19890
                    *                                                   W1L19900
                          MDX   1 2         INCR CD COL PT              W1L19910
                          BSI  L  CONV2     CONVERT RPG FLD LNG         W1L19920
                          BSI  L  OPPVL     CHECK O/P FLD LNG           W1L19930
                    *                                                   W1L19940
                          BSI  L  SCALE     CONVERT RPG SCALE           W1L19950
                    *                                                   W1L19960
                          LD   L  TOTAL                                 W1L19970
                          S     1 1         COMPUTE L2-K                W1L19980
                          A       F0                                    W1L19990
                          STO     TABL2+1   SAVE L2-K                   W1L20000
                          BSI  L  PRIN2,+Z  BR-K GT L2,INVALID          W1L20010
                    *                                                   W1L20020
                          LD      TABL2     COMPUTE L1-J-(L2-K)         W1L20030
                          S       TABL2+1                               W1L20040
                          BSI  L  TRUNK,Z-  BR-K GT J,TRUNCATION        W1L20050
                    *                                                   W1L20060
                          MDX   2 4         INCR COMPRESSION PT         W1L20070
                          MDX   1 2         ADJUST I/O AREA PT          W1L20080
                          LD    1 1         TEST FOR PACK OPTION        W1L20090
                          S    L  P                                     W1L20100
                          BSC  L  FC210,Z   BR-PACK OPTION OFF          W1L20110
                          LD   L  PO        OR PACK OPTION INTO         W1L20120
                          OR    2 -2        *COMPRESSION                W1L20130
                          STO   2 -2                                    W1L20140
                          MDX   1 3         ADJUST I/O AREA PT          W1L20150
                          BSC  L  FC210     TEST NEXT FLD               W1L20160
                    *                                                   W1L20170
                    INTSW DC      0         ONE WD INTEGER SW           W1L20180
                    EPREC DC      0         EXTENDED PREC SW            W1L20190
                    F0    DC      /F0       EBC 0                       W1L20200
                    *                                                   W1L20210
                    *************************************************** W1L20220
                    *                                                 * W1L20230
                    *             TRUNCATION OCCURS-PRINT DIAGNOSTIC  * W1L20240
                    *                                                 * W1L20250
                    *************************************************** W1L20260
                    TRUNK DC      *-*       ENTRY PT                    W1L20270
                          LD    2 1         LOAD COL NO.-1              W1L20280
                          A    L  D1        CALCULATE COL NO.           W1L20290
                          STX   1 TXR1+1    SAVE REG 1                  W1L20300
                    *                                                   W1L20310
                    *     CONVERT COL NO. TO PACKED EBCDIC              W1L20320
                    *     *AND STORE IN TRUNCATION ERROR MSG            W1L20330
                    *                                                   W1L20340
                          LDX   1 2         REG 1 = LOOP CONTROL        W1L20350
                          SRT     16        COL NO. IN EXTENSION REG    W1L20360
                    T1    D    L  D10       CALCULATE DECML DGT         W1L20370
                          RTE     16        DECML DGT IN ACC            W1L20380
                          OR      F0        OR ON ZONE                  W1L20390
                          STO  L1 TABL2-1   SAVE TEMPORARILY            W1L20400
                          SLA     16        CLEAR ACC FOR DIVIDE        W1L20410
                          MDX   1 -1                                    W1L20420
                          MDX     T1        CONT LOOP                   W1L20430
                    *                                                   W1L20440
                          SLT     16        GET HIGH ORDER DGT          W1L20450
                          OR      F0        OR ON ZONE                  W1L20460
                          SLA     8         PACK FOR MESSAGE            W1L20470
                          OR      TABL2     GET SECOND DGT              W1L20480
                    T0002 EQU     *                                     W1L20490
                          STO     MESS7+16  SAVE COL NO. IN MESSAGE     W1L20500
                          LD      TABL2+1   GET LAST DGT                W1L20510
                          SLA     8                                     W1L20520
                          OR      MESS7+17                              W1L20530
                          STO     MESS7+17  SAVE IN MESSAGE             W1L20540
                    *                                                   W1L20550
                          STX   2 TXR2+1    SAVE REG 2                  W1L20560
                          LDX  L2 MESS7     SET ERROR MSG ADDR SW       W1L20570
                          BSI  L  PRINT     PRINT DIAGNOSTIC            W1L20580
                          LD   L  H4040     RESTORE TRUNCATION MSG FOR  W1L20590
                          STO     MESS7+17  *FUTURE USE                 W1L20600
                          STO     MESSA+23                              W1L20610
                    TXR1  LDX  L1 *-*       RESTORE REG 1               W1L20620
                    TXR2  LDX  L2 *-*       RESTORE REG 2               W1L20630
                          BSC  I  TRUNK     RETURN TO CALLER            W1L20640
                    *                                                   W1L20650
                    *     CONSTANTS                                     W1L20660
                    *                                                   W1L20670
                    HF    DC      /F        CONSTANT /F                 W1L20680
                    TABL2 BSS     3         TEMP SAVE AREA              W1L20690
                    EQ    DC      /7E       EBC =                       W1L20700
                    MESS7 DC      17                                    W1L20710
                          DMES  2 F07 TRUNCATION OCCURS AT COL.     'E  W1L20720
                    MESSA DC      25                                    W1L20730
                          DMES  2 F10 FIELD OUT OF RANGE AT COL     OF' W1L20740
                          DMES  2  RECORD       'E                      W1L20750
                    *                                                   W1L20760
                    *************************************************** W1L20770
                    *                                                 * W1L20780
                    *             B(C)-CONVERSION SUBR                * W1L20790
                    *                                                 * W1L20800
                    *************************************************** W1L20810
                    *                                                   W1L20820
                    BCNVT DC      *-*       ENTRY PT                    W1L20830
                          STX     ALPHA     TURN ON ALPHA SW            W1L20840
                          LD    2 2                                     W1L20850
                          SRA     6                                     W1L20860
                          AND  L  D3        FIND NO. WDS PER ENTRY      W1L20870
                          STO     WORK1                                 W1L20880
                          LD   L  XR1       SUBTRACT NO. WDS PER        W1L20890
                          S       WORK1     *ENTRY FROM REG 1           W1L20900
                          STO  L  XR1                                   W1L20910
                          BSI  L  INSRT     PUT FLD INTO O/P RCD        W1L20920
                          MDX   2 3         UPDATE COMPRESSION PT       W1L20930
                          BSC  I  BCNVT     RETURN TO CALLER            W1L20940
                    ALPHA DC      0         ALPHA SW                    W1L20950
                    *                                                   W1L20960
                    *************************************************** W1L20970
                    *                                                 * W1L20980
                    *             X-CONVERSION SUBR                   * W1L20990
                    *                                                 * W1L21000
                    *************************************************** W1L21010
                    *                                                   W1L21020
                    XCNVT DC      *-*       ENTRY PT                    W1L21030
                          LD   L  XR1       ADJUST INPUT FLD PT FOR     W1L21040
                          S     2 1         *NO. WDS TO BE BYPASSED     W1L21050
                          STO  L  XR1                                   W1L21060
                          MDX   2 2         UPDATE COMPRESSION PT       W1L21070
                          BSC  I  XCNVT     RETURN TO CALLER            W1L21080
                    *                                                   W1L21090
                    *************************************************** W1L21100
                    *                                                 * W1L21110
                    *             I-CONVERSION SUBR                   * W1L21120
                    *                                                 * W1L21130
                    *************************************************** W1L21140
                    *                                                   W1L21150
                    ICNVT DC      *-*       ENTRY POINT                 W1L21160
                          MDX   1 -1        DECREMENT INPUT PT          W1L21170
                          MDX  L  INTSW,0   TEST FOR ONE WORD INTEGERS  W1L21180
                          MDX     *+4       BR-ONE WD INTEGERS SPECIFIEDW1L21190
                    *                       AT LEAST 2 WDS ALLOCATED-   W1L21200
                          MDX   1 -1        *DECREMENT INPUT PT         W1L21210
                          MDX  L  EPREC,0   TEST FOR EXTENDED PRECISION W1L21220
                    *                       EXTENDED PREC SPECIFIED-    W1L21230
                          MDX   1 -1        *DECREMENT INPUT PT         W1L21240
                    *                                                   W1L21250
                          STX   1 IXR1+1    SAVE REG 1                  W1L21260
                          LD    1 0         LOAD BINARY INTEGER         W1L21270
                          SRT     16        SAVE IN EXTENSION REG       W1L21280
                    *                                                   W1L21290
                          LD      HF0       LOAD POSITIVE ZONE          W1L21300
                          LDX   1 /1F       REG 1 = 31,LOOP CONTROL     W1L21310
                          STO  L1 WORK1-1   SET WORK AREA TO ZONE       W1L21320
                          MDX   1 -1        DECREMENT LOOP CONTROL      W1L21330
                          MDX     *-4       CONTINUE LOOP               W1L21340
                    *                                                   W1L21350
                          SLT     16        SHIFT BINARY INTEGER TO ACC W1L21360
                          BSC  L  I1,-      BR-INTEGER IS POSITIVE      W1L21370
                          STX     NEGSW     TURN ON NEGATIVE INDICATOR  W1L21380
                          EOR     HFFFF     TAKE 2'S COMPLEMENT         W1L21390
                          A       H1                                    W1L21400
                    *                                                   W1L21410
                    I1    LDX   1 5         DGT CNT=5                   W1L21420
                          SRT     16        SHIFT TO EXTENSION REG      W1L21430
                          MDX  L  SWJ,-1                                W1L21440
                          BSI  L  DGT       CONVERT 5 DGTS              W1L21450
                          MDX  L  SWJ,1                                 W1L21460
                    FC700 EQU     *                                     W1L21470
                          BSI  L  INSRT     PUT CNVTED FLD IN O/P RCD   W1L21480
                          MDX   2 3         UPDATE COMPRESSION PT       W1L21490
                    IXR1  LDX  L1 *-*       RESTORE REG 1               W1L21500
                          BSC  I  ICNVT     RETURN TO CALLER            W1L21510
                    *                                                   W1L21520
                    *************************************************** W1L21530
                    *                                                 * W1L21540
                    *             J-CONVERSION SUBR                   * W1L21550
                    *                                                 * W1L21560
                    *************************************************** W1L21570
                    *                                                   W1L21580
                    JCNVT DC      *-*       ENTRY PT                    W1L21590
                          LD      JCNVT     SAVE RETURN ADDR            W1L21600
                          STO     ICNVT                                 W1L21610
                          MDX   1 -2        DECREMENT INPUT PT          W1L21620
                          STX   1 IXR1+1    SAVE REG 1                  W1L21630
                    *                                                   W1L21640
                          LD      HF0       LOAD POSITIVE ZONE          W1L21650
                          LDX   1 /1F       REG 1=31,LOOP CONTROL       W1L21660
                          STO  L1 WORK1-1   SET WORK AREA TO ZONE       W1L21670
                          MDX   1 -1        DECREMENT LOOP CONTROL      W1L21680
                          MDX     *-4       CONT INITIALIZING WORK AREA W1L21690
                    *                                                   W1L21700
                          LDX  I1 IXR1+1    RESTORE REG 1               W1L21710
                          LD    1 1         LOAD 2-WD INTEGER INTO      W1L21720
                          SRT     16        *ACC AND EXTENSION REGS     W1L21730
                          LD    1 0                                     W1L21740
                          STD     TABLJ     SAVE ITG                    W1L21750
                          BSC  L  J1,-      BR-ITG IS POSITIVE          W1L21760
                          STX     NEGSW     SET NEGATIVE INDR           W1L21770
                          SLT     32                                    W1L21780
                          SD      TABLJ     TAKE TWO'S COMPLEMENT       W1L21790
                    J1    EQU     *                                     W1L21800
                          LDX   1 0         SET ADJUSTMENT TABLE PT     W1L21810
                          STD     TABLJ     SAVE ABSOLUTE VALUE OF ITG  W1L21820
                    J3    SD   L1 TABLJ+2   SUB TABLE VALUE             W1L21830
                          BSC  L  J2,-      BR-REMAINDER NON-NEGATIVE   W1L21840
                          MDX   1 2         INCR TABLE PT               W1L21850
                          LDD     TABLJ     LOAD ABSOLUTE VALUE OF ITG  W1L21860
                          MDX     J3        CONT                        W1L21870
                    J2    EQU     *                                     W1L21880
                          D       D0000     FETCH LOW ORDER 7 DECML DGT W1L21890
                          STO     TABLJ-1   SAVE 3 OF LOW ORDER DGTS    W1L21900
                          LD   L  XR1       DIVIDE REG 1 BY 2           W1L21910
                          SRA     1                                     W1L21920
                          STO     J4        SAVE PT                     W1L21930
                          LDX   1 4         SET DGT CNT                 W1L21940
                          BSI     DGT       FETCH LOW ORDER 4 DECML DGT W1L21950
                          LD      TABLJ-1   FETCH BINARY REPRESEN-      W1L21960
                          SRT     16        *TATION OF NEXT 3 DECML DGT W1L21970
                          MDX  L  SWJ,-3    ADJUST DGT PT               W1L21980
                          LDX   1 3         SET DGT CNT                 W1L21990
                          BSI     DGT       RETRIEVE AND SAVE DGTS      W1L22000
                          LDX  L1 *-*       RESTORE PT                  W1L22010
                    J4    EQU     *-1                                   W1L22020
                          SLT     16        RETRIEVE HIGH ORDER 3       W1L22030
                          A    L1 TABL5     DECIMAL DGTS                W1L22040
                          SRT     16                                    W1L22050
                          LDX   1 3         SET DGT CNT                 W1L22060
                          MDX  L  SWJ,-3    ADJUST DGT PT               W1L22070
                          BSI     DGT       RETRIEVE AND SAVE DGTS      W1L22080
                          MDX  L  SWJ,6     RESTORE DGT PT              W1L22090
                          MDX     FC700                                 W1L22100
                    *                                                   W1L22110
                    *                                                   W1L22120
                    *     CONSTANTS                                     W1L22130
                    *                                                   W1L22140
                    HF0   DC      /F0       CONSTANT /F0                W1L22150
                    D10   DC      10        CONSTANT 10                 W1L22160
                    NEGSW DC      0         NEGATIVE INDR               W1L22170
                    HFFFF DC      /FFFF     CONSTANT /FFFF              W1L22180
                    WORK1 BSS     31        WORK AREA-31 WORDS          W1L22190
                          BSS  E  0                                     W1L22200
                    DD1   DC      0         DOUBLE WD 1               E W1L22210
                    H1    DC      1                                     W1L22220
                          BSS     1                                     W1L22230
                    TABLJ BSS  E  2         TEMP SAVE AREA            E W1L22240
                          DEC     2000000000 TABLE OF ADJUSTMENT        W1L22250
                          DEC     1900000000 *VALUES                    W1L22260
                          DEC     1600000000                            W1L22270
                          DEC     1300000000                            W1L22280
                          DEC     1000000000                            W1L22290
                          DEC     700000000                             W1L22300
                          DEC     580000000                             W1L22310
                          DEC     260000000                             W1L22320
                          DC      0                                   E W1L22330
                          DC      0                                     W1L22340
                    TABL5 DC      200       TABLE OF 1 WORD ADJUSTMENT  W1L22350
                          DC      190       *VALUES                     W1L22360
                          DC      160                                   W1L22370
                          DC      130                                   W1L22380
                          DC      100                                   W1L22390
                          DC      70                                    W1L22400
                          DC      58                                    W1L22410
                          DC      26                                    W1L22420
                          DC      0                                     W1L22430
                    D0000 DC      10000     10000                       W1L22440
                    *                                                   W1L22450
                    *     CONVERT BINARY ITG TO DECML DGTS              W1L22460
                    *                                                   W1L22470
                    DGT   DC      *-*       ENTRY PT                    W1L22480
                          SLA     16                                    W1L22490
                          D       D10       RETRIEVE DGT                W1L22500
                          RTE     16        DECML DGT IN ACC            W1L22510
                          OR      HF0       OR ZONE                     W1L22520
                          STO  L1 WORK1+9   SAVE DGT                    W1L22530
                    SWJ   EQU     *-1                                   W1L22540
                          MDX   1 -1        DECREMENT DGT CNT           W1L22550
                          MDX     DGT+1     CONT DGT FIND               W1L22560
                          BSC  I  DGT       RETURN                      W1L22570
                    *                                                   W1L22580
                    *************************************************** W1L22590
                    *                                                 * W1L22600
                    *             D-CONVERSION SUBR                   * W1L22610
                    *                                                 * W1L22620
                    *************************************************** W1L22630
                    *                                                   W1L22640
                    DCNVT DC      *-*       ENTRY POINT                 W1L22650
                          STX   3 DXR3+1    SAVE REG 3                  W1L22660
                          LD    2 3                                     W1L22670
                          SRT     8                                     W1L22680
                          STO     IPREC     SAVE INPUT PREC             W1L22690
                    *                                                   W1L22700
                          SLA     16        CLEAR ACC                   W1L22710
                          SLT     8         RETRIEVE INPUT SCALE        W1L22720
                          STO     ISCAL     SAVE AS INPUT SCALE         W1L22730
                          STO     DECPO     SAVE AS NO. DECML POS       W1L22740
                    *                                                   W1L22750
                          LD      IPREC     CALCULATE NO. NON-DECML POS W1L22760
                          S       ISCAL                                 W1L22770
                          STO     DECPO+1   SAVE NO. NON-DECML POS      W1L22780
                          S       HE                                    W1L22790
                          BSC  L  *+2,+     BR-NO. NONDECML POS INVALID W1L22800
                          LD      HE        SET MAX NO. NONDECML POS    W1L22810
                          STO     DECPO+1                               W1L22820
                    *                                                   W1L22830
                          LD      DECPO+1                               W1L22840
                          A       DECPO     SET FLD LNG                 W1L22850
                          STO     FLDLG                                 W1L22860
                    XR1   EQU     1                                     W1L22870
                    *                                                   W1L22880
                          LD   L  XR1       ACC POINTS TO START OF      W1L22890
                          S       IPREC     *INPUT FLD                  W1L22900
                    *                                                   W1L22910
                          MDX  L  ESW,0     TEST E-CONVERSION SW        W1L22920
                          MDX     *+1       SKIP- E-CONVERSION SW ON    W1L22930
                          STO     INPT      SET INPUT PT                W1L22940
                          STO     ADDR      SET ADDR SW                 W1L22950
                          A       ISCAL     ADD INPUT SCALE             W1L22960
                          A       DECPO+1   ADD NO. NON-DECML POS.-1    W1L22970
                          S       H1                                    W1L22980
                          STO  L  XR1       REG 1 PTS TO LAST WD OF FLD W1L22990
                    *                                                   W1L23000
                          LD   L  *-*       TEST FOR NEGATIVE FLD       W1L23010
                    ADDR  EQU     *-1                                   W1L23020
                          BSC  L  *+4,-     BR-FLD POSITIVE             W1L23030
                          STX     NEGSW     FLD NEG,TURN ON NEG INDR    W1L23040
                          EOR     HFFFF     TAKE ONE'S COMPLEMENT       W1L23050
                          STO  I  ADDR      RESTORE LAST WD-NOW POSITIVEW1L23060
                    *                                                   W1L23070
                          LDX   3 /17       REG1=23,LOOP CONTROL        W1L23080
                          LD      HF0       LOAD POSITIVE ZONE          W1L23090
                          STO  L3 WORK1-1   SET WORK AREA TO ZONE       W1L23100
                          MDX   3 -1        DECREMENT LOOP CONTROL      W1L23110
                          MDX     *-4       CONT LOOP                   W1L23120
                    *                                                   W1L23130
                          LD      WKADR     REG3 PTS TO LAST WD OF WORK W1L23140
                          S       DECPO+1   AREA RESERVED FOR FRACTION- W1L23150
                          STO  L  XR3       *AL DGT                     W1L23160
                    XR3   EQU     3                                     W1L23170
                    *                                                   W1L23180
                    DCV1  LD    1 0         RETRIEVE DIGIT              W1L23190
                          OR   L  HF0       OR ON POSITIVE SCALE        W1L23200
                          STO   3 0         SAVE DGT IN WORK AREA       W1L23210
                          MDX   1 -1        ADJUST INPUT PT             W1L23220
                          MDX   3 1         ADJUST WORK AREA PT         W1L23230
                          MDX  L  FLDLG,-1  DECREMENT FLD LNG           W1L23240
                          MDX     DCV1      CONT CONVERSION             W1L23250
                    DXR3  LDX  L3 *-*       RESTORE REG 3               W1L23260
                          BSI  L  INSRT     PUT CNVTED FLD IN O/P RCD   W1L23270
                    *                                                   W1L23280
                          LDX  L1 *-*       REG1 =NEW INPUT PT          W1L23290
                    INPT  EQU     *-1       INPUT PT                    W1L23300
                          SLA     16        TURN OFF E-CONVERSION SW    W1L23310
                          STO     ESW                                   W1L23320
                          MDX   2 4         UPDATE COMPRESSION PT       W1L23330
                          BSC  I  DCNVT     RETURN TO CALLER            W1L23340
                    *                                                   W1L23350
                    *     CONSTANTS                                     W1L23360
                    *                                                   W1L23370
                    WKADR DC      WORK1+14  WORK ADDR-1ST DECML DGT     W1L23380
                    D9    DC      9         CONSTANT 9                  W1L23390
                    DECPO BSS     2         TEMP SAVE AREA              W1L23400
                    HE    DC      /E        CONSTANT 14                 W1L23410
                    ISCAL BSS     1         INPUT SCALE INDR            W1L23420
                    IPREC BSS     1         INPUT PREC INDR             W1L23430
                    FLDLG BSS     1         FLD LNG INDR                W1L23440
                    ESW   DC      0         E-CONVERSION SW             W1L23450
                    *                                                   W1L23460
                    *************************************************** W1L23470
                    *                                                 * W1L23480
                    *             E-CONVERSION SUBR                   * W1L23490
                    *                                                 * W1L23500
                    *************************************************** W1L23510
                    *                                                   W1L23520
                    ECNVT DC      *-*       ENTRY POINT                 W1L23530
                          LD      ECNVT     SAVE RETURN ADDR IN D-CON-  W1L23540
                          STO     DCNVT     *VERSION ENTRY PT           W1L23550
                          STX     ESW       TURN ON E-SW                W1L23560
                    *                                                   W1L23570
                          LD    2 3                                     W1L23580
                          SRT     8                                     W1L23590
                          S    L  H1                                    W1L23600
                          STO     IPREC     SAVE INPUT PREC-1           W1L23610
                          STO     FLDLG     SAVE FLD LNG IN WDS         W1L23620
                    *                                                   W1L23630
                          STX   3 DXR3+1    SAVE REG 3                  W1L23640
                          MDX   1 -1                                    W1L23650
                    *                                                   W1L23660
                          LD   L  XR1       REG 3 PTS TO LAST WD OF     W1L23670
                          STO  L  XR3       *INPUT FLD                  W1L23680
                    *                       REG 2 PTS TO LAST WD OF     W1L23690
                          LDX  L1 WORK2+199 *WORK AREA                  W1L23700
                    *                                                   W1L23710
                          LD      IPREC                                 W1L23720
                          BSC  L  E1,+      BR-INPUT PREC=1             W1L23730
                          SLT     32        CLEAR ACC & EXTENSION REG   W1L23740
                    *                                                   W1L23750
                    E4    LD      D4        SET CNT INDR TO 4           W1L23760
                          STO     DECPO                                 W1L23770
                          LD    3 0         LOAD INPUT WD - D4 FORMAT   W1L23780
                          RTE     12        SAVE ONE DIGIT              W1L23790
                    E5    STO   1 0         STORE IN D1 FORMAT          W1L23800
                          MDX  L  IPREC,-1  DECREMENT PREC              W1L23810
                          MDX     E3        BR-PREC NONZERO             W1L23820
                    *                                                   W1L23830
                    *                       PREC HAS REACHED ZERO       W1L23840
                          MDX   3 -1        *ADJUST INPUT PT            W1L23850
                          LD    3 0         SAVE LAST DGT AS D1 FORMAT  W1L23860
                          STO   1 -1                                    W1L23870
                          MDX  I1 FLDLG     INCR REG 1 BY CSP FLD LNG-1 W1L23880
                    *                                                   W1L23890
                    E2    STX   3 INPT      SAVE REG3 AS NEW INPUT PT   W1L23900
                          MDX     DCNVT+2   PERFORM D1 CONVERSION       W1L23910
                    *                                                   W1L23920
                    *                                                   W1L23930
                    E1    LD    3 0         SAVE ONE DIGIT IN D1        W1L23940
                          STO   1 0         *FORMAT                     W1L23950
                          MDX   1 1         ADJUST NEW INPUT FLD PT     W1L23960
                          MDX     E2        CONTINUE CONVERSION         W1L23970
                    *                                                   W1L23980
                    E3    MDX   1 -1        UPDATE WORK AREA PT         W1L23990
                          MDX  L  DECPO,-1  DECREMENT COUNT INDR        W1L24000
                          MDX     *+2       BR-COUNT NONZERO            W1L24010
                          MDX   3 -1        COUNT=0,ADJUST INPUT PT     W1L24020
                          MDX     E4        CONT CONVERSION TO D1       W1L24030
                    *                                                   W1L24040
                          SLA     16        CLEAR ACC                   W1L24050
                          SLT     4         SHIFT FOR NEW DIGIT         W1L24060
                          MDX     E5        BR TO SAVE IN D1 AREA       W1L24070
                    *                                                   W1L24080
                    *     CONSTANTS                                     W1L24090
                    *                                                   W1L24100
                    D4    DC      4         CONSTANT 4                  W1L24110
                    *                                                   W1L24120
                    *************************************************** W1L24130
                    *                                                 * W1L24140
                    *             F-CONVERSION SUBR                   * W1L24150
                    *                                                 * W1L24160
                    *************************************************** W1L24170
                    *                                                   W1L24180
                    H0041 DC      /41                                   W1L24190
                    FCNVT DC      *-*       ENTRY PT                    W1L24200
                          LD    2 1         SAVE COLUMN PARAMETER OF    W1L24210
                          STO     COL       *COMPRESSION                W1L24220
                          LD    2 3         SAVE CHAR CNT               W1L24230
                          STO     WDCT                                  W1L24240
                    *                                                   W1L24250
                    F3    S    L  D3                                    W1L24260
                          STX  L  ALPHA     TURN ON ALPHA SW            W1L24270
                          BSC  L  F4,-      BR-CHAR CNT GT OR EQ 3      W1L24280
                          LD      WDCT      SET COMPRESSION TO CONVERT  W1L24290
                          SLA     8         *LESS THAN 3 CHARACTERS     W1L24300
                          OR      H0041                                 W1L24310
                          STO   2 2                                     W1L24320
                    F4    EQU     *                                     W1L24330
                    *                                                   W1L24340
                          MDX   1 -1        ADJUST INPUT FLD PT         W1L24350
                          LD    1 0         LOAD A3 INTEGER             W1L24360
                          STX   1 FXR1+1    SAVE INPUT FLD PT           W1L24370
                          LDX  L1 A3TAB     REG1 POINTS TO A3 TABLE     W1L24380
                          BSC  L  F1,-      BR-A3 INTEGER POSITIVE      W1L24390
                    *                                                   W1L24400
                    *                       A3 INTEGER NEGATIVE         W1L24410
                          SRT     16        *SHIFT ITG TO EXTENSION REG W1L24420
                          AD      D32K      CALCULATE FIRST A3 TABLE    W1L24430
                          D       D1600     *DISPLACEMENT               W1L24440
                          MDX     F2        CONTINUE CONVERSION         W1L24450
                    *                                                   W1L24460
                    F1    SRT     16        SHIFT ITG TO EXTENSION REG  W1L24470
                          D       D1600     CALCULATE FIRST A3 TABLE    W1L24480
                          A       D20       *DISPLACEMENT               W1L24490
                    *                                                   W1L24500
                    F2    STO     *+1       SET UP TABLE LOAD           W1L24510
                          LD   L1 *-*       LOAD CHARACTER FROM TABLE   W1L24520
                          STO     WORK2+2   SAVE CHAR                   W1L24530
                    *                                                   W1L24540
                          SLA     16        CALCULATE 2ND DISPLACEMENT  W1L24550
                          D       D40                                   W1L24560
                          STO     *+1       SET UP TABLE LOAD           W1L24570
                          LD   L1 *-*       LOAD CHAR                   W1L24580
                          STO     WORK2+1   SAVE 2ND CHAR               W1L24590
                    *                                                   W1L24600
                          SLT     16        CALCULATE 3RD DISPLACEMENT  W1L24610
                          STO     *+1       SET UP TABLE LOAD           W1L24620
                          LD   L1 *-*       LOAD CHAR                   W1L24630
                          STO     WORK2     SAVE 3RD CHAR               W1L24640
                    *                                                   W1L24650
                          LDX  L1 WORK2+2   REG1 PTS TO WORK AREA       W1L24660
                          BSI  L  INSRT     PUT CNVTED FLD IN O/P RCD   W1L24670
                    *                                                   W1L24680
                    FXR1  LDX  L1 *-*       RESTORE REG 1               W1L24690
                          MDX  L  WDCT,-3   DECR CHAR CNT               W1L24700
                          MDX     F5        CONT CONVERSION             W1L24710
                          LD   L  H0341     RESTORE COMPRESSION WORD    W1L24720
                          STO   2 2                                     W1L24730
                    *                                                   W1L24740
                          LD      COL       RESTORE COLUMN IN           W1L24750
                          STO   2 1         *COMPRESSION                W1L24760
                          MDX   2 4         UPDATE COMPRESSION PT       W1L24770
                          BSC  I  FCNVT     RETURN TO CALLER            W1L24780
                    *                                                   W1L24790
                    F5    EQU     *                                     W1L24800
                          LD    2 1         ADD 3 TO COLUMN POSITION    W1L24810
                          A    L  D3        *IN COMPRESSION             W1L24820
                          STO   2 1                                     W1L24830
                          LD      WDCT      GET CHAR CNT                W1L24840
                          MDX     F3        CONVERT NEXT A3 INTEGER     W1L24850
                    *                                                   W1L24860
                    *************************************************** W1L24870
                    *                                                 * W1L24880
                    *             CONSTANTS AND SAVE AREAS            * W1L24890
                    *                                                 * W1L24900
                    *************************************************** W1L24910
                    *                                                   W1L24920
                    D32K  DEC     32000     CONSTANT 32000            E W1L24930
                    D1600 DC      1600      CONSTANT 1600               W1L24940
                    COL   BSS     1         COLUMN PARAMETER            W1L24950
                    WDCT  BSS     1         NO. WDS PER ENTRY           W1L24960
                    D40   DC      40        CONSTANT 40                 W1L24970
                    D20   DC      20        CONSTANT 20                 W1L24980
                    WORK2 BSS     200       WORK AREA-200 WDS           W1L24990
                    H3    DC      3         CONSTANT 3                  W1L25000
                    ADDR3 DC      WORK1+14  WORK ADDR-1ST DECML DGT     W1L25010
                    XR2   EQU     2                                     W1L25020
                    H003F DC      /003F     USED TO SAVE BITS 10-15     W1L25030
                    *                                                   W1L25040
                    *************************************************** W1L25050
                    *                                                 * W1L25060
                    *             INSRT SUBROUTINE                    * W1L25070
                    *                                                 * W1L25080
                    *************************************************** W1L25090
                    *                                                   W1L25100
                    IN130 EQU     *                                     W1L25110
                          LD    2 2         RETRIEVE WD/ENT             W1L25120
                          SRA     6                                     W1L25130
                          AND     H3                                    W1L25140
                          STO  L  WORK1     SAVE WD/ENT                 W1L25150
                    *                                                   W1L25160
                          LD      H2                                    W1L25170
                          STO     SWH05     SET MAX NO. CHAR/WD         W1L25180
                    *                                                   W1L25190
                          LD    2 2         SET CHARS PER ENTRY SW      W1L25200
                          AND     H003F                                 W1L25210
                          STO     CHRCT                                 W1L25220
                          STO     CHRCT+1                               W1L25230
                          MDX     IN020-3   CONT                        W1L25240
                    *                                                   W1L25250
                    IN010 EQU     *                                     W1L25260
                          STX     SWH01     SET SW 1 ON                 W1L25270
                          MDX     IN020                                 W1L25280
                    *                                                   W1L25290
                    *                                                   W1L25300
                    INSRT DC      *-*       ENTRY PT                    W1L25310
                          STX   1 INXR1+1   SAVE REG 1                  W1L25320
                          STX   2 INXR2+1   SAVE REG 2                  W1L25330
                          STX   3 INXR3+1   SAVE REG 3                  W1L25340
                    *                                                   W1L25350
                          LD    2 2         FETCH O/P PREC              W1L25360
                          SRA     8                                     W1L25370
                          STO  L  XR3       REG3= PRECISION             W1L25380
                    *                                                   W1L25390
                          BSC  L  *+1,E     BR-PRECISION ODD            W1L25400
                          STX     SWH03     SET SW 3,PRECISION EVEN     W1L25410
                          MDX  L  ALPHA,0   SKIP-ALPHA SW OFF           W1L25420
                          MDX     IN130     BR-ALPHA SW ON              W1L25430
                    *                                                   W1L25440
                          LD    2 2                                     W1L25450
                          SLA     8                                     W1L25460
                          BSC     +Z        SKIP-PACK OPTION OFF        W1L25470
                          STX     SWH02     PACKED FLD,SET SW 2         W1L25480
                    *                                                   W1L25490
                          SLA     1         LOAD OUTPUT SCALE           W1L25500
                          SRA     9                                     W1L25510
                          A       ADDR3     ADD START ADDR OF WORK +14  W1L25520
                          STO     ADDR4     SET ADDR FOR PACK ZONE SET  W1L25530
                          S    L  XR3       SUBTRACT PRECISION          W1L25540
                          STO  L  XR1       REG 1=START ADDR OF I/P FLD W1L25550
                    *                                                   W1L25560
                          LD   L  HF        SET ZONE FOR PACK           W1L25570
                          STO  L  *-*                                   W1L25580
                    ADDR4 EQU     *-1                                   W1L25590
                    *                                                   W1L25600
                          LD    2 1                                     W1L25610
                          BSC  L  IN010,E   BR-DISPLACEMENT ODD         W1L25620
                    IN020 SRA     1         DIVIDE BY 2                 W1L25630
                          A       INXR3+1   ADD START ADDR O/P AREA     W1L25640
                    *                       REG 2 SET TO 1ST WORD IN    W1L25650
                          STO  L  XR2       *OUTPUT RCD USED            W1L25660
                    *                                                   W1L25670
                    IN031 LD      SWH02                                 W1L25680
                          BSC  L  *+2,+-    BR-SW 2 OFF                 W1L25690
                          LD    1 1         GET SECOND CHAR FOR PACK    W1L25700
                          SRT     4         SHIFT INTO EXTENSION REG    W1L25710
                    *                                                   W1L25720
                          LD    1 0         GET FIRST CHAR              W1L25730
                          MDX   3 0                                     W1L25740
                          MDX     IN030     BR-PREC NOT YET ZERO        W1L25750
                    *                                                   W1L25760
                    IN040 SRT     8         PREC ZERO                   W1L25770
                          MDX  L  ALPHA,0                               W1L25780
                          MDX     *+1       SKIP-ALPHA SW ON            W1L25790
                          MDX     IN050     BR-ALPHA SW OFF             W1L25800
                          MDX  L  SWH04,0   SKIP- SW 4 OFF              W1L25810
                          MDX     *+1                                   W1L25820
                          SRT     8                                     W1L25830
                    *                                                   W1L25840
                    IN050 MDX  L  SWH01,0  SKIP-SW 1 OFF                W1L25850
                          MDX     IN060    BR-SW 1 ON                   W1L25860
                          SRT     8         PLACE LEFTHAND CHAR         W1L25870
                          LD    2 0         *IN OUTPUT AREA             W1L25880
                          SLA     8                                     W1L25890
                          RTE     8                                     W1L25900
                          STO   2 0                                     W1L25910
                          STX     SWH01     TURN ON SW 1                W1L25920
                    *                                                   W1L25930
                    IN051 SLA     16                                    W1L25940
                          STO     SWH03     TURN OFF SW 3               W1L25950
                          MDX   3 -1        DECREMENT REG 3             W1L25960
                          MDX     IN070     BR-REG 3 GT 0               W1L25970
                    *                                                   W1L25980
                          MDX  L  SWH01,0   SKIP-SW1 OFF                W1L25990
                          MDX   2 1                                     W1L26000
                    *                                                   W1L26010
                          LD   L  NEGSW                                 W1L26020
                          BSC  L  IN080,+-  BR-NEGATIVE INDR OFF        W1L26030
                          LD    2 -1                                    W1L26040
                          MDX  L  SWH01,0   SKIP-SW1 OFF                W1L26050
                          SRT     8                                     W1L26060
                          MDX  L  SWH02,0   SKIP-SW2 OFF                W1L26070
                          MDX     IN090     BR-SW2 ON                   W1L26080
                    *                                                   W1L26090
                          AND     HFFDF     TURN ON NEGATIVE ZONE       W1L26100
                    IN071 MDX  L  SWH01,0   SKIP-SW1 OFF                W1L26110
                          SLT     8                                     W1L26120
                          STO   2 -1        STORE LAST DATA WORD        W1L26130
                    *                                                   W1L26140
                    IN080 SLA     16                                    W1L26150
                          STO     SWH01     TURN OFF SW 1               W1L26160
                          STO     SWH02     TURN OFF SW 2               W1L26170
                          STO     SWH03     TURN OFF SW 3               W1L26180
                          STO     SWH04     TURN OFF SW 4               W1L26190
                          STO  L  ALPHA     TURN OFF ALPHA SW           W1L26200
                          STO  L  NEGSW     TURN OFF NEGATIVE INDR      W1L26210
                    *                                                   W1L26220
                    INXR1 LDX  L1 *-*       RESTORE REG 1               W1L26230
                    INXR2 LDX  L2 *-*       RESTORE REG 2               W1L26240
                    INXR3 LDX  L3 *-*       RESTORE REG 3               W1L26250
                          BSC  I  INSRT     RETURN TO CALLER            W1L26260
                    *                                                   W1L26270
                    *************************************************** W1L26280
                    *                                                 * W1L26290
                    *             CONSTANTS AND SAVE AREAS            * W1L26300
                    *                                                 * W1L26310
                    *************************************************** W1L26320
                    *                                                   W1L26330
                    H2    DC      2         CONSTANT 2                  W1L26340
                    SWH01 DC      *-*       COL SW-COL ODD=ON           W1L26350
                    SWH02 DC      *-*       PACK SW-PACK=ON             W1L26360
                    SWH03 DC      *-*       PREC SW-EVEN=ON             W1L26370
                    SWH04 DC      *-*       ON=RIGHTHAND I/P CHAR       W1L26380
                    SWH05 DC      *-*       NO. CHAR LEFT IN WORD       W1L26390
                    CHRCT BSS     2         TEMP SAVE AREA              W1L26400
                    *                                                   W1L26410
                    *                                                   W1L26420
                    IN090 AND     HFFFD     TURN ON NEGATIVE ZONE       W1L26430
                          MDX     IN071                                 W1L26440
                    *                                                   W1L26450
                    IN070 MDX  L  ALPHA,0                               W1L26460
                          MDX     IN100     BR-ALPHA SW ON              W1L26470
                          MDX   1 1         INCREMENT REG 1             W1L26480
                          MDX     IN031     CONT INSERT                 W1L26490
                    *                                                   W1L26500
                    IN030 MDX  L  SWH02,0                               W1L26510
                          MDX     *+1       SKIP-SW 2 ON                W1L26520
                          MDX     IN040    BR-SW 2 OFF                  W1L26530
                          MDX  L  SWH03,0                               W1L26540
                          MDX     *+1       SKIP-SW 3 ON                W1L26550
                          MDX     *+3       SKIP-SW 3 OFF               W1L26560
                          AND  L  HF        KEEP RIGHTHAND DGT          W1L26570
                          MDX     IN040     CONT INSERT                 W1L26580
                          SRT     4         SHIFT FOR DGT               W1L26590
                          MDX   1 1         INCR INPUT PT               W1L26600
                          MDX   3 -1        DECR LOOP CONTROL           W1L26610
                          MDX     IN050     CONT INSERT                 W1L26620
                          MDX     IN050                                 W1L26630
                    *                                                   W1L26640
                    *                                                   W1L26650
                    IN060 SLA     16                                    W1L26660
                          STO     SWH01     TURN OFF SW 1               W1L26670
                          LD    2 0                                     W1L26680
                          SRA     8         PLACE RIGHTHAND CHAR        W1L26690
                          SLT     8         *IN OUTPUT AREA             W1L26700
                          STO   2 0                                     W1L26710
                          MDX   2 1         INCREMENT REG 2             W1L26720
                          MDX     IN051     TEST FOR MORE CHARACTERS    W1L26730
                    *                                                   W1L26740
                    *     CONSTANTS                                     W1L26750
                    *                                                   W1L26760
                    HFFDF DC      /FFDF                                 W1L26770
                    *                                                   W1L26780
                    IN100 EQU     *                                     W1L26790
                          MDX  L  SWH05,-1  DECREMENT NO. CHAR/WD       W1L26800
                          MDX     *+1       SKIP                        W1L26810
                          MDX     IN150     NO. CHAR/WD EXHAUSTED       W1L26820
                    *                                                   W1L26830
                    IN160 EQU     *                                     W1L26840
                          MDX  L  CHRCT,-1  DECREMENT WD/ENT            W1L26850
                          MDX     IN110     BR-WD/ENT NONZERO           W1L26860
                    *                                                   W1L26870
                          LD   L  INXR1+1   ADJUST REG 1 TO PT TO NEXT  W1L26880
                          S    L  WORK1     *ENTRY                      W1L26890
                          STO  L  XR1                                   W1L26900
                          STO     INXR1+1                               W1L26910
                    *                                                   W1L26920
                          LD      CHRCT+1   RESTORE WD/ENT              W1L26930
                          STO     CHRCT                                 W1L26940
                    *                                                   W1L26950
                          SLA     16                                    W1L26960
                          STO     SWH04     TURN OFF SW 4               W1L26970
                          LD      H2                                    W1L26980
                          STO     SWH05     RESTORE MAX NO. CHAR/WD     W1L26990
                          MDX     IN031     CONT INSERT                 W1L27000
                    *                                                   W1L27010
                    IN110 EQU     *                                     W1L27020
                          LD      SWH04     TEST SW 4                   W1L27030
                          BSC  L  IN120,Z   BR-SW 4 ON                  W1L27040
                          STX     SWH04     SET SW 4                    W1L27050
                          BSC  L  IN031     CONT INSERT                 W1L27060
                    *                                                   W1L27070
                    IN120 EQU     *                                     W1L27080
                          SLA     16        TURN OFF SW 4               W1L27090
                          STO     SWH04                                 W1L27100
                          BSC  L  IN031     CONT INSERT                 W1L27110
                    *                                                   W1L27120
                    IN150 MDX   1 1         INCREMENT REG 1             W1L27130
                          LD      H2        SET MAX NO. CHAR/WD         W1L27140
                          STO     SWH05                                 W1L27150
                          MDX     IN160     CONT INSERT                 W1L27160
                    *                                                   W1L27170
                    *     CONSTANTS                                     W1L27180
                    *                                                   W1L27190
                    HFFFD DC      /FFFD                                 W1L27200
                    *************************************************** W1L27210
                    *                                                 * W1L27220
                    *             R-CONVERSION SUBR                   * W1L27230
                    *                                                 * W1L27240
                    *************************************************** W1L27250
                    RCNVT DC      *-*       ENTRY PT                    W1L27260
                          STX  L2 R0010+1   SAVE REG 2                  W1L27270
                          STX  L3 R0020+1   SAVE REG 3                  W1L27280
                          LDX  I3 RXR3+1    REG 3 PTS TO TV             W1L27290
                    *                                                   W1L27300
                          LD   L  EPREC                                 W1L27310
                          BSC  L  R0030,+-  BR-STD PREC SPECIFIED       W1L27320
                          MDX   1 -3        DECR I/P FLD PT             W1L27330
                    *                                                   W1L27340
                          STX   1 *+1       SET ELD CALLING SEQ         W1L27350
                          LIBF    ELD       LOAD FAC WITH NO.           W1L27360
                          DC      *-*                                   W1L27370
                          MDX     R0040     CONT CONVERSION             W1L27380
                    *                                                   W1L27390
                    R0030 EQU     *                                     W1L27400
                          MDX   1 -2        DECR I/P FLD PT             W1L27410
                          LD    1 1         FETCH REAL NO.              W1L27420
                          SRT     16                                    W1L27430
                          LD    1 0                                     W1L27440
                          STD     R0906     SAVE REAL NO.               W1L27450
                          LIBF    FLD       LOAD FAC WITH NO.           W1L27460
                          DC      R0906                                 W1L27470
                    *                                                   W1L27480
                    R0040 EQU     *                                     W1L27490
                          STX  L1 R0050+1   SAVE REG 1                  W1L27500
                          LIBF    NORM      NORMALIZE NO. IN FAC        W1L27510
                    *                                                   W1L27520
                          LD    3 R0900     RETRIEVE EXPONENT           W1L27530
                          S       R0901     SUBTRACT 127                W1L27540
                          STO     WORK3     SAVE EXPONENT               W1L27550
                    *                                                   W1L27560
                          LD    2 2         RETRIEVE O/P PRECISION      W1L27570
                          SRT     8                                     W1L27580
                          STO     WORK3+1   SAVE O/P PRECISION          W1L27590
                    *                                                   W1L27600
                          RTE     15        RETRIEVE O/P SCALE          W1L27610
                          SRA     9                                     W1L27620
                          STO     WORK3+2   SAVE O/P SCALE              W1L27630
                    *                                                   W1L27640
                          LD      WORK3+1   COMPUTE NO. NONDECIMAL      W1L27650
                          S       WORK3+2   *POSITIONS                  W1L27660
                          STO     WORK3+3   SAVE NO. NONDECIMAL POS.    W1L27670
                    *                                                   W1L27680
                          LDX   1 /17       REG 1 = LOOP CONTROL        W1L27690
                          LD   L  HF0       LOAD ZERO                   W1L27700
                    R0041 STO  L1 WORK1-1   FILL WORK WITH ZERO         W1L27710
                          MDX   1 -1        DECR LOOP CNT               W1L27720
                          MDX     R0041     CONT FILLING WORK           W1L27730
                    *                                                   W1L27740
                          LDX   2 -8        REG 2=LOOP CNT              W1L27750
                          SLA     16        ZERO ACC                    W1L27760
                    R0042 STO  L2 R0903+8   ZERO BUFFER                 W1L27770
                          MDX   2 1         DECR LOOP CNT               W1L27780
                          MDX     R0042     CONT FILLING BUFFER         W1L27790
                    *                                                   W1L27800
                          LDD   3 R0902     LOAD MANTISSA               W1L27810
                          BSC  L  R0050,+-  BR-MANTISSA ZERO            W1L27820
                    *                                                   W1L27830
                          BSC  L  R0060,-   BR-MANTISSA POSITIVE        W1L27840
                    *                                                   W1L27850
                          STX  L  NEGSW     SET NEGATIVE SW             W1L27860
                          SLT     32        COMPUTE ABS VAL OF MANTISSA W1L27870
                          SD    3 R0902                                 W1L27880
                    R0060 STD     R0904+1   SAVE MANTISSA-ABS VAL       W1L27890
                          LDD     R0907     GET STD PREC ROUND BITS     W1L27900
                          MDX  L  EPREC,0   SKIP-STD PREC SPECIFIED     W1L27910
                          LDD     R0907+2   GET EXTENDED PREC ROUND BIT W1L27920
                          SRT     15                                    W1L27930
                          AD      R0904+1   ADD CONVERSION NO.          W1L27940
                          BSC     +Z        SKIP IF NO OVERFLOW         W1L27950
                          MDX     *+2       BR-OVERFLOW OCCURS          W1L27960
                          STD     R0904+1   SAVE NO.-NO OVERFLOW        W1L27970
                          MDX     R0067     CONT WITH CONVERSION        W1L27980
                          SRT     1                                     W1L27990
                          EOR     R0907+3   TURN OFF SIGN BIT           W1L28000
                          STD     R0904+1   SAVE ROUNDED DATA           W1L28010
                          LD    3 R0900     ADD ONE TO EXPONENT         W1L28020
                          A    L  D1                                    W1L28030
                          STO   3 R0900                                 W1L28040
                    R0067 EQU     *                                     W1L28050
                          MDX     FBTN2     BR TO GET PROPER FORM       W1L28060
                    *                                                   W1L28070
                    *     THIS SECT SCALES MANTISSA SO THAT BINARY PT   W1L28080
                    *     *IS BETWEEN WDS 1 AND 2 OF R0904 BUFFER. MAN- W1L28090
                    *     *TISSA IS KEPT CENTERED BY MULTIPLYING.       W1L28100
                    *                                                   W1L28110
                    FBTN0 LD      WORK3     GET SCALED EXPONENT         W1L28120
                          BSC  L  FBNX0,+-  GO TO OUTPUT IF ZERO        W1L28130
                          BSC  L  FBNM0,+Z  DO SHIFT RT IF NEG          W1L28140
                          BSI  L  SLT00     OTHERWISE SHIFT LEFT        W1L28150
                          MDX  L  WORK3,-1  DECR EXPONENT               W1L28160
                          NOP                                           W1L28170
                          MDX     FBTN2                                 W1L28180
                    *                                                   W1L28190
                    FBNM0 BSI  L  SRT00     BR TO SHIFT RT SUBR         W1L28200
                          MDX  L  WORK3,1   INCR EXPONENT FOR SHIFT RT  W1L28210
                          NOP                                           W1L28220
                    *                                                   W1L28230
                    *     THIS SECTION CALLS THE MPY BY 10 SUBR TO GET  W1L28240
                    *     *1 ITG DGT AND PROPER EXPONENT                W1L28250
                    *                                                   W1L28260
                    FBTN2 LD      R0904     GET THE CARRY WORD          W1L28270
                          BSC  L  FBTN1,Z   BR TO DIVIDE BY 10-NONZERO  W1L28280
                          BSI  L  MPY00     MULTIPLY BY 10 AND CNT      W1L28290
                          MDX  L  R0905,-1                              W1L28300
                          NOP                                           W1L28310
                          MDX     FBTN2     REPEAT                      W1L28320
                    *************************************************** W1L28330
                    *                                                 * W1L28340
                    *             CONSTANTS AND SAVE AREAS            * W1L28350
                    *                                                 * W1L28360
                    *************************************************** W1L28370
                          BSS  E  0         FORCE EVEN ADDR             W1L28380
                    R0907 DC      /0081     ROUND CONSTANT            E W1L28390
                          DC      /8000                                 W1L28400
                          DC      0         ROUND CONSTANT            E W1L28410
                          DC      /8000                                 W1L28420
                    R0900 EQU     125       DISP TO EXPONENT            W1L28430
                    R0901 DC      /7F                                   W1L28440
                    R0902 EQU     126       DISP TO MANTISSA            W1L28450
                          BSS  E  0                                     W1L28460
                          DC      *-*       NOT USED                    W1L28470
                    WORK3 BSS     14                                  O W1L28480
                    R0903 EQU     WORK3+5                               W1L28490
                    R0904 EQU     WORK3+8                               W1L28500
                    R0905 EQU     WORK3+7                               W1L28510
                    R0906 BSS  E  2                                     W1L28520
                    *                                                   W1L28530
                    *     CONSTANTS FOR FBTN2                           W1L28540
                    *                                                   W1L28550
                    FBCN0 DC      10                                    W1L28560
                          DC      *-*                                   W1L28570
                          DC      .9                                    W1L28580
                          DC      WORK1+13                              W1L28590
                          DC      .0                                    W1L28600
                    *                                                   W1L28610
                    *     THIS SECT CALLS DIVIDE BY 10 SUBR TO GET      W1L28620
                    *     *1 ITG DGT AND PROPER EXPONENT                W1L28630
                    *                                                   W1L28640
                    FBTN1 LD      R0904     CHECK CARRY AGAINST 10      W1L28650
                          S       FBCN0                                 W1L28660
                          BSC  L  FBTN0,+Z  LT 10,GO SCALE MANTISSA     W1L28670
                          BSI     DIV00     GT 10,BR TO DIVIDE SUBR     W1L28680
                          MDX  L  R0905,1   KEEP TRACK OF POWERS OF 10  W1L28690
                          NOP                                           W1L28700
                          MDX     FBTN1     REPEAT                      W1L28710
                    *                                                   W1L28720
                    *     THIS SECTION CHECK FOR VALID EXPONENT AND     W1L28730
                    *     *FILLS WORK AREA IF NECESSARY                 W1L28740
                    *                                                   W1L28750
                    FBNX0 LD      R0905     TEST FOR PROPER EXPONENT    W1L28760
                          A    L  D1                                    W1L28770
                          S       WORK3+3                               W1L28780
                          BSC  L  R0070,+   BR-EXPONENT VALID           W1L28790
                    *                                                   W1L28800
                          LDX   1 /17       SET LOOP CONTROL CTR        W1L28810
                          LD      FBCN0+2                               W1L28820
                    R0061 STO  L1 WORK1-1   FILL WORK WITH NINE         W1L28830
                          MDX   1 -1        DECR LOOP CONTROL CTR       W1L28840
                          MDX     R0061     CONT TO FILL WORK           W1L28850
                    *                                                   W1L28860
                    R0062 EQU     *                                     W1L28870
                          LD      FC998     LOAD RANGE MSG SW           W1L28880
                          BSC  L  R0050,+-  BR-MSG BYPASSED             W1L28890
                          MDX     R0063     FILL RCD CNT INTO ERROR MSG W1L28900
                    R0066 LDX  I2 R0010+1   RESTORE REG 2               W1L28910
                          BSI  L  TRUNK     BUILD AND PRINT MSG         W1L28920
                    R0050 LDX  L1 *-*       RESTORE REG 1               W1L28930
                    R0010 LDX  L2 *-*       RESTORE REG 2               W1L28940
                    R0020 LDX  L3 *-*       RESTORE REG 3               W1L28950
                          BSI  L  INSRT                                 W1L28960
                    *                                                   W1L28970
                    *                                                   W1L28980
                    *                                                   W1L28990
                          MDX   2 3         ADJUST COMPRESSION PT       W1L29000
                          BSC  I  RCNVT     RETURN TO CALLER            W1L29010
                    FBCN1 DC      10                                    W1L29020
                    R0063 EQU     *                                     W1L29030
                          LDX   2 4         REG 2=CHAR CNT IN TOT       W1L29040
                          LD      WORK3-1                               W1L29050
                          S    L  RCDCT                                 W1L29060
                          A    L  D1                                    W1L29070
                          SRT     16                                    W1L29080
                    R0064 SLA     16                                    W1L29090
                          D       FBCN0     RETRIEVE DECML DGT          W1L29100
                          RTE     16                                    W1L29110
                          OR      FBCN0+4   ADD ZONE TO DECML DGT       W1L29120
                          STO  L2 WORK3     SAVE DECML DGT IN WORK      W1L29130
                          MDX   2 -1                                    W1L29140
                          MDX     R0064                                 W1L29150
                          SLT     16        PLACE DECML DGTS IN         W1L29160
                          OR      FBCN0+4   *WARNING MSG                W1L29170
                          LDX  L1 MESSA+23  FETCH AND SAVE HIGH ORDER   W1L29180
                          OR    1 0         *DGT IN ERROR MSG           W1L29190
                          STO   1 0                                     W1L29200
                          LDX   2 3                                     W1L29210
                    R0065 LD   L2 WORK3     FETCH AND SAVE REMAINING    W1L29220
                          SLA     8         *DGTS TWO AT A TIME         W1L29230
                          OR   L2 WORK3+1                               W1L29240
                          STO   1 2                                     W1L29250
                          MDX   1 -1        ADJUST STORE ADDR FOR FILL  W1L29260
                          MDX   2 -2        DECR LOOP CONTROL FOR FILL  W1L29270
                          MDX     R0065     CONT FILL LOOP              W1L29280
                          MDX     R0066     GO PRINT ERROR MSG          W1L29290
                    FC998 DC      *-*       RANGE MSG SW                W1L29300
                    *                                                   W1L29310
                    *     THIS SECT CONTINUES CHECK ON DECML EXPONENT   W1L29320
                    *     *AND RETRIEVES 1ST DGT IF EXPONENT IS VALID   W1L29330
                    *                                                   W1L29340
                    R0070 EQU     *                                     W1L29350
                          LD      R0905     TEST DECML EXPONENT         W1L29360
                          A       FBCN0                                 W1L29370
                          BSC  L  R0062,+   BR-EXPONENT INVALID         W1L29380
                    *                                                   W1L29390
                    *     CALCULATE WORK AREA ADDR                      W1L29400
                    *                                                   W1L29410
                          LD      FBCN0+3   CALCULATE WORK ADDR AT      W1L29420
                          S       R0905     *WHICH FILL BEGINS          W1L29430
                          STO     R0080+1   SAVE STARTING WORK ADDR     W1L29440
                    *                                                   W1L29450
                          LD      R0904     GET 1ST DGT                 W1L29460
                          A       FBCN0+4   ADD ZONE TO DGT             W1L29470
                          STO  I  R0080+1   SAVE 1ST DGT                W1L29480
                          MDX  L  R0080+1,10                            W1L29490
                          LDX   1 -9                                    W1L29500
                    *                                                   W1L29510
                    *     GENERATE AND SAVE FRACTIONAL DGTS             W1L29520
                    *                                                   W1L29530
                    FBNX2 SLA     16        CLEAR CARRY WD OF R0904     W1L29540
                          STO     R0904     *BUFFER                     W1L29550
                          BSI     MPY00     BR TO MPY BY 10 SUBR        W1L29560
                          LD      R0904     GET RESULTING DGT           W1L29570
                          A       FBCN0+4   ADD ZONE TO DGT             W1L29580
                    R0080 STO  L1 *-*       OUTPUT FRACTIONAL DGT       W1L29590
                          MDX   1 1         MODIFY CTR FOR RETURN       W1L29600
                          MDX     FBNX2     GO CALC NEXT DGT            W1L29610
                          MDX     R0050     INSERT FLD INTO RPG RCD     W1L29620
                    *                                                   W1L29630
                    *     SUBR TO DIVIDE 5-PRECISION NO. IN R0904       W1L29640
                    *     *BUFFER BY 10                                 W1L29650
                    *                                                   W1L29660
                    DIV00 DC      *-*       ENTRY PT                    W1L29670
                          SLT     32        CLEAR ACC AND EXTENSION     W1L29680
                          LDX   2 -5        SET CTR                     W1L29690
                    DIV01 LD   L2 R0904+5   GET NEXT WD                 W1L29700
                          RTE     16        SUBTRACT 5 FROM EXTENSION   W1L29710
                          S       FLCN0                                 W1L29720
                          LDS     2         TURN ON CARRY               W1L29730
                          BSC     +Z        BR IF GT 5                  W1L29740
                          S       FLCN0+1   IF LT 5,RESTORE 5           W1L29750
                          STS     DIV02     *AND TURN OFF CARRY         W1L29760
                          D       FBCN0     DIVIDE BY 10                W1L29770
                    DIV02 LDS     *-*       GET STATUS                  W1L29780
                          BSC     C         IF LT 5,BR TO ST QUOTIENT   W1L29790
                          A       FLCN0+2   IF GT 5,ADD /8000           W1L29800
                          STO  L2 R0904+5   STORE QUOTIENT              W1L29810
                          MDX   2 1         DECR CTR FOR RET            W1L29820
                          MDX     DIV01     REPEAT LOOP                 W1L29830
                          BSC  I  DIV00     RETURN                      W1L29840
                    *                                                   W1L29850
                    *     SUBR TO MPY 5-PREC NO. IN R0904 BUFFER BY 10. W1L29860
                    *                                                   W1L29870
                    *     *CONTENTS OF R0903+1 ARE ADDED TO RESULT.     W1L29880
                    MPY00 DC      *-*       ENTRY PT                    W1L29890
                          LDX   2 5         SET CTR                     W1L29900
                    MPY01 LD   L2 R0904-1   GET A WORD OF R0904 BUFFER  W1L29910
                          M    L  FBCN0     MPY BY 10                   W1L29920
                          BSC     +Z        BR IF PTV,ZERO              W1L29930
                          A       FBCN1     IF NEG,ADD10                W1L29940
                          AD   L  R0903     ADD PREVIOUS EXCESS         W1L29950
                          STO  L  R0903+1   STORE PRESENT EXCESS        W1L29960
                          SLT     16        FETCH EXTENSION-PRODUCT     W1L29970
                          STO  L2 R0904-1   PUT PRODUCT BACK IN R0904   W1L29980
                          MDX   2 -1        DECR CTR FOR RET            W1L29990
                          MDX     MPY01     REPEAT LOOP                 W1L30000
                          LD   L  R0903+1   STORE LAST EXCESS IN ACC    W1L30010
                          BSC  I  MPY00     RETURN                      W1L30020
                    *                                                   W1L30030
                    *     SUBR TO SHIFT RIGHT ONE BIT(THROUGH WORD      W1L30040
                    *     *BOUNDARIES) OF R0904 BUFFER.                 W1L30050
                    *                                                   W1L30060
                    SRT00 DC      *-*       ENTRY PT                    W1L30070
                          LDX   2 -5        SET CTR                     W1L30080
                          SLT     32        CLEAR ACC AND EXTENSION     W1L30090
                    SRT01 LD   L2 R0904+5   GET A WORD                  W1L30100
                          RTE     1         SHIFT LAST BIT OF ACC TO    W1L30110
                          STO  L2 R0904+5   *FIRST OF EXT AND VICE VERSAW1L30120
                          RTE     15        POS EXTENSION BIT           W1L30130
                          MDX   2 1         DECR CTR FOR RET            W1L30140
                          MDX     SRT01     REPEAT LOOP                 W1L30150
                          BSC  I  SRT00     RETURN                      W1L30160
                    *                                                   W1L30170
                    *     SUBR TO SHIFT LEFT ONE BIT(THROUGH WORD       W1L30180
                    *     *BOUNDARIES) OF R0904 BUFFER.                 W1L30190
                    *                                                   W1L30200
                    SLT00 DC      *-*       ENTRY PT                    W1L30210
                          LDX   2 5         SET CTR                     W1L30220
                          SLT     32        CLEAR ACC AND EXTENSION     W1L30230
                    SLT01 LD   L2 R0904-1   GET A WORD                  W1L30240
                          RTE     31        EFFECTIVE ROTATE LEFT ONE   W1L30250
                          STO  L2 R0904-1   REPLACE SHIFTED WORD        W1L30260
                          SLT     15        POSITION EXTENSION          W1L30270
                          MDX   2 -1        DECR CTR FOR RETURN         W1L30280
                          MDX     SLT01     REPEAT LOOP                 W1L30290
                          BSC  I  SLT00     RETURN                      W1L30300
                    *                                                   W1L30310
                    *     CONSTANTS                                     W1L30320
                    *                                                   W1L30330
                    FLCN0 DC      5                                     W1L30340
                          DC      -5                                    W1L30350
                          DC      /8000                                 W1L30360
                          BSS     299       PATCH AREA                  W1L30370
                          DC      0                                     W1L30380
                          END     FC000                                 W1L30390
