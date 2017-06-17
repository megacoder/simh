                          HDNG    PROGRAM TO MODIFY DSF-PROGRAMS IN UA  U6I00010
                    *************************************************** U6I00020
                    *  MODSF  *  PROGRAM TO MODIFY DSF-PROGRAMS IN UA * U6I00030
                    *************************************************** U6I00040
                    *                                                 * U6I00050
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U6I00060
                    *                                                 * U6I00070
                    *FUNCTION --                                      * U6I00080
                    *   * PERMITS THE MODIFICATION OF A DSF-PROGRAM   * U6I00090
                    *     IN USER-AREA OF ANY ON-LINE CARTRIDGE.      * U6I00100
                    *   * MODIFICATION MAY BE REPLACEMENT OF EXISTING * U6I00110
                    *     CODE, OR ADDITION OF CODE AT END OF PROGRAM.* U6I00120
                    *   * LOCATION OF CODE TO BE PATCHED MAY BE SPECI-* U6I00130
                    *     FIED EITHER IN TERMS OF RELATIVE PROGRAM    * U6I00140
                    *     ADDRESS, OR PHYSICAL DISPLACEMENT BEYOND    * U6I00150
                    *     BEGINNING OF DSF-TEXT.                      * U6I00160
                    *   * MULTIPLE PROGRAMS WITH CODE *REPLACEMENT*   * U6I00170
                    *     ONLY MAY BE MODIFIED DURING A SINGLE 'MODSF'* U6I00180
                    *     RUN, BUT ANY PROGRAM TO WHICH CODING IS TO  * U6I00190
                    *     BE ADDED MUST BE THE LAST PROGRAM AFFECTED  * U6I00200
                    *     IN THE RUN.                                 * U6I00210
                    *   * PROGRAMS WITH CODE REPLACEMENT ONLY ARE     * U6I00220
                    *     MODIFIED IN PLACE IN USER AREA.  A PROGRAM  * U6I00230
                    *     TO WHICH CODE IS TO BE ADDED IS MOVED TO    * U6I00240
                    *     WORKING-STORAGE--THE USER MUST PROVIDE THE  * U6I00250
                    *     // DUP, *DELETE, AND *STORE CARDS HIMSELF IN* U6I00260
                    *     ORDER TO PLACE IT BACK INTO USER-AREA.      * U6I00270
                    *                                                 * U6I00280
                    *ENTRY POINT --                                   * U6I00290
                    *   THIS PROGRAM IS INVOKED BY A                  * U6I00300
                    *     // XEQ MODSF                                * U6I00310
                    *     MONITOR CONTROL RECORD.                     * U6I00320
                    *                                                 * U6I00330
                    *INPUT --                                         * U6I00340
                    *   * PATCH CONTROL RECORDS, OF WHICH COLUMNS 1-4 * U6I00350
                    *     CONTAIN THE CHARACTERS '*PRO', AND WHICH    * U6I00360
                    *     SPECIFY ALL NECESSARY FACTS ABOUT THE       * U6I00370
                    *     PROGRAM TO BE MODIFIED.                     * U6I00380
                    *   * PATCH DATA RECORDS, WHICH SPECIFY WITHIN    * U6I00390
                    *     A PROGRAM THE LOCATION(S) TO BE MODIFIED,   * U6I00400
                    *     AND THE CONTENT TO BE INSERTED INTO THOSE   * U6I00410
                    *     LOCATIONS.                                  * U6I00420
                    *   * THE TERMINATION CONTROL RECORD '*END'.      * U6I00430
                    *                                                 * U6I00440
                    *OUTPUT --                                        * U6I00450
                    *   * LISTING ON PRINCIPAL PRINTER, RECORDING     * U6I00460
                    *     INPUT REQUESTS, REPORTING ACTIONS TAKEN, AND* U6I00470
                    *     INDICATING ANY ERROR COMMITTED.             * U6I00480
                    *   * DSF-TEXT -- IN PLACE -- FOR ANY PROGRAM FOR * U6I00490
                    *     WHICH CODING WAS REPLACED ONLY.             * U6I00500
                    *   * DSF-TEXT -- IN WORKING-STORAGE -- FOR ANY   * U6I00510
                    *     PROGRAM TO WHICH CODING HAS BEEN ADDED.     * U6I00520
                    *                                                 * U6I00530
                    *EXTERNAL REFERENCES --                           * U6I00540
                    *   * IN DCOM                                     * U6I00550
                    *        #JBSW, #SYSC, #CIDN(5), #ULET(5),        * U6I00560
                    *        #DBCT, #FMAT, #NAME, #ENTY               * U6I00570
                    *   * IN SLET                                     * U6I00580
                    *        EXTRACTS FOR PRINCIPAL PRINT ROUTINE AND * U6I00590
                    *        PRINCIPAL INPUT ROUTINE                  * U6I00600
                    *   * IN PAGE HEADING SECTOR                      * U6I00610
                    *        JOB-NAME                                 * U6I00620
                    *   * PRINCIPAL PRINTER DEVICE SUBROUTINE         * U6I00630
                    *   * PRINCIPAL INPUT DEVICE SUBROUTINE           * U6I00640
                    *   * DISKZ (VIA ENTRY POINT DZ000)               * U6I00650
                    *   * IN COMMA                                    * U6I00660
                    *        $LEV0, $LEV1, $IREQ                      * U6I00670
                    *        $IBSY, $PBSY, $DBSY, $CH12, $CTSW, $LAST * U6I00680
                    *        $WSDR, $FPAD, $CORE, $FLSH               * U6I00690
                    *                                                 * U6I00700
                    *EXIT, NORMAL --                                  * U6I00710
                    *   * TO MONITOR, VIA $EXIT                       * U6I00720
                    *                                                 * U6I00730
                    *EXIT, ERROR --                                   * U6I00740
                    *   * TO MONITOR, VIA $EXIT, AFTER APPROPRIATE    * U6I00750
                    *     ERROR MESSAGE                               * U6I00760
                    *                                                 * U6I00770
                    *TABLES/WORKAREAS --                              * U6I00780
                    *   * COMRG (COMMUNICATION REGION) CONTAINS ALL   * U6I00790
                    *     POINTERS AND SWITCHES USED BY THE PROGRAM.  * U6I00800
                    *   * DAREA IS A DISK BUFFER USED FOR ALL DISK    * U6I00810
                    *     OPERATIONS.                                 * U6I00820
                    *                                                 * U6I00830
                    *ATTRIBUTES --                                    * U6I00840
                    *   * N/A                                         * U6I00850
                    *                                                 * U6I00860
                    *NOTES --                                         * U6I00870
                    *   * MUST NOT BE USED IN TEMPORARY JOB MODE,     * U6I00880
                    *     NOR IF $NDUP IS SET NON-ZERO.               * U6I00890
                    *                                                 * U6I00900
                    *************************************************** U6I00910
                          EJCT                                          U6I00920
                    *************************************************** U6I00930
                    *   S  Y  S  T  E  M     E  Q  U  A  T  E  S      * U6I00940
                    *************************************************** U6I00950
                          SPAC    2                                     U6I00960
                    * DCOM EQUATES                                      U6I00970
                          SPAC    1                                     U6I00980
                    #NAME EQU     4         PROGRAM NAME IN NAMECODE    U6I00990
                    #DBCT EQU     6         DISK BLOCK COUNT OF PROGRAM U6I01000
                    #SYSC EQU     8          VERSION/MODLEVEL VVMM      U6I01010
                    #JBSW EQU     9         NON-ZERO=TEMPORARY JOB MODE U6I01020
                    #ENTY EQU     16        RELATIVE ENTRY POINT        U6I01030
                    #PIOD EQU     25        PRIN I/O DEVICE INDIC       U6I01040
                    #CIDN EQU     55         CART ID BY LOG DRIVE       U6I01050
                    #FMAT EQU     70        FORMAT PROG IN WS, LOGDR 0  U6I01060
                    #ULET EQU     80         LET SAD BY LOG DRIVE       U6I01070
                    #WSCT EQU     85        DISK BLOCK COUNT            U6I01080
                          SPAC    1                                     U6I01090
                    * PHASE ID EQUATES                                  U6I01100
                          SPAC    1                                     U6I01110
                    @PPTR EQU     /99        PRINCIPAL PRINTER          U6I01120
                    @PIWK EQU     /9A        PRINCIPAL READER           U6I01130
                          SPAC    1                                     U6I01140
                    * SECTOR EQUATES                                    U6I01150
                          SPAC    1                                     U6I01160
                    @DCOM EQU     /0001      ADDR OF DCOM               U6I01170
                    @SLET EQU     /0003      ADDR OF SLET               U6I01180
                    @HDNG EQU     /0007      ADDR OF HEADING SECTOR     U6I01190
                          SPAC    1                                     U6I01200
                    * EQUATES IN COMMA AND SKELETON SUPERVISOR          U6I01210
                          SPAC    1                                     U6I01220
                    $CIBA EQU     /5         SAD OF CORE-IMAGE BUFFER   U6I01230
                    $CH12 EQU     /6         POINTER TO CH12 INDIC      U6I01240
                    $LEV0 EQU     /8         LEVEL 0 BRANCH WORD        U6I01250
                    $LEV1 EQU     /9         LEVEL 1 BRANCH WORD        U6I01260
                    $CORE EQU     /E         SIZE OF MAIN STORAGE IN WD U6I01270
                    $CTSW EQU     /F         MCR TRAP SW                U6I01280
                    $IBSY EQU     /13        INPUT-BUSY SW              U6I01290
                    $IREQ EQU     /2C        INT REQ BRANCH WORD        U6I01300
                    $IOCT EQU     /32        MASTER I/O COUNT           U6I01310
                    $LAST EQU     /33        INPUT LAST CARD SW         U6I01320
                    $NDUP EQU     /34       SUPPRESS-DUP IF NON-ZERO    U6I01330
                    $PBSY EQU     /36        PRINTER BUSY INDICATOR     U6I01340
                    $DUMP EQU     /3F       DUMP ENTRY POINT            U6I01350
                    $FLSH EQU     /71     FLUSH-TO-NEXT-JOB SW          U6I01360
                    $DZ1N EQU     /76        DISKZ= -1                  U6I01370
                    $WRD1 EQU     /7B       ADDR OF CI-HEADER           U6I01380
                    $KCSW EQU     /7C        KEYBOARD+CONSPRTR=1        U6I01390
                    $WSDR EQU     /7A        WS DRIVE CODE              U6I01400
                    $FPAD EQU     /95        BEGIN OF WS FOR 5 DRIVES   U6I01410
                    $DBSY EQU     /EE        DISK BUSY INDIC            U6I01420
                    DZ000 EQU     /F2        DISKZ ENTRY POINT          U6I01430
                          SPAC    1                                     U6I01440
                    * MISCELLANEOUS EQUATES                             U6I01450
                          SPAC    1                                     U6I01460
                    ORGIN EQU     /1FE       INITIAL LOAD ADDR          U6I01470
                    IBT4  EQU     ORGIN-5    ADDR RIGHTMOST IBT ENTRY   U6I01480
                    I1134 EQU     0                                     U6I01490
                    IKBCP EQU     1                                     U6I01500
                    I1442 EQU     2                                     U6I01510
                    I2501 EQU     3                                     U6I01520
                    I1403 EQU     4                                     U6I01530
                          EJCT                                          U6I01540
                    *************************************************** U6I01550
                    *  C O M M U N I C A T I O N   A R E A            * U6I01560
                    *************************************************** U6I01570
                          SPAC    1                                     U6I01580
                    COMRG EQU     *                                     U6I01590
                          SPAC    1                                     U6I01600
                    * SLET EXTRACTS                                     U6I01610
                          SPAC    1                                     U6I01620
                    SLETX DC      @PPTR     PHASE ID OF PRIN PRINT ROUT U6I01630
                          DC      *-*       FILLED IN BY XSLET          U6I01640
                          DC      *-*       FILLED IN BY XSLET          U6I01650
                          DC      *-*       FILLED IN BY XSLET          U6I01660
                          SPAC    1                                     U6I01670
                          DC      @PIWK     PHASE ID OF PRIN INPUT ROUT U6I01680
                          DC      *-*       FILLED IN BY XSLET          U6I01690
                          DC      *-*       FILLED IN BY XSLET          U6I01700
                          DC      *-*       FILLED IN BY XSLET          U6I01710
                          SPAC    1                                     U6I01720
                    * DCOM INFORMATION                                  U6I01730
                          SPAC    1                                     U6I01740
                    JBSW  DC      *-*       FROM #JBSW                  U6I01750
                    VMOD  DC      *-*       FROM #SYSC (VVMM)           U6I01760
                    PIODV DC      *-*       PRIN I/O DEVICE (NEG=PAPT)  U6I01770
                    CIDN5 BSS     5         FROM #CIDN(5)               U6I01780
                    ULET5 BSS     5         FROM #ULET(5)               U6I01790
                          SPAC    1                                     U6I01800
                    * INFORMATION RELATING TO CURRENT PROGRAM           U6I01810
                          SPAC    1                                     U6I01820
                    CID   DC      *-*       CURRENT CARTRIDGE ID        U6I01830
                    PNAME BSS     5         PROG NAME IN EBCDIC         U6I01840
                    PNAMC DEC     0         PROG NAME IN NAMECODE       U6I01850
                    COUNT DC      *-*       NO. PATCH DATA RECORDS      U6I01860
                    EXPSW DC      *-*        EXPAND ENCOUNTERED SW      U6I01870
                    MODE  DC      *-*        CURRENT ADDRESSING MODE    U6I01880
                    DRCOD DC      *-*       DRIVE CODE                  U6I01890
                    ADLET DC      *-*       LET ADDRESS ON DESIRED CART U6I01900
                          BSS  E  0                                     U6I01910
                    DBCNT DC      *-*       DISK BLOCK COUNT            U6I01920
                    DBADR DC      *-*       DISK BLOCK ADDRESS          U6I01930
                    STPTR DC      *-*       POINTER TO ADDR/RC/VALUES   U6I01940
                          SPAC    1                                     U6I01950
                    * MISCELLANEOUS GLOBAL ITEMS                        U6I01960
                          SPAC    1                                     U6I01970
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6I01980
                    KPRO  EBC     .*PRO.    COMPARAND FOR CARD TYPE     U6I01990
                    KEND  EBC     .*END.    COMPARAND TO CARD TYPE      U6I02000
                    DZCON BSS  E  0       DISKZ CONTROLS                U6I02010
                          DC      640     WORD COUNT                    U6I02020
                          DC      *-*     SECTOR ADDRESS                U6I02030
                    LIBSW DC      *-*       LAST WAS LIBF SWITCH        U6I02040
                    PADDR DC      *-*       CURRENT PATCH ADDRESS       U6I02050
                          EJCT                                          U6I02060
                    *************************************************** U6I02070
                    *     T R A N S F E R         V E C T O R         * U6I02080
                    *************************************************** U6I02090
                          SPAC    1                                     U6I02100
                    INSTV EQU     *                                     U6I02110
                          SPAC    1                                     U6I02120
                    DREAD DC      *-*       ENTRY FOR DISK READ         U6I02130
                          BSC  L  DR001                                 U6I02140
                          SPAC    1                                     U6I02150
                    DWRIT DC      *-*        ENTRY FOR DISK WRITE       U6I02160
                          BSC  L  DW001                                 U6I02170
                          SPAC    1                                     U6I02180
                    PRINT DC      *-*       ENTRY POINT                 U6I02190
                          BSC  L  PR001     BR TO PRINT ROUTINE         U6I02200
                          SPAC    1                                     U6I02210
                    SPACE DC      *-*       ENTRY POINT                 U6I02220
                          BSC  L  SP001     BR TO SPACE ROUTINE         U6I02230
                          SPAC    1                                     U6I02240
                    PKPRT DC      *-*       ENTRY POINT                 U6I02250
                          BSC  L  PP001     BR TO PACK AND PRINT        U6I02260
                          SPAC    1                                     U6I02270
                    ERROR DC      *-*       ENTRY POINT                 U6I02280
                          BSC  L  ER001     BR TO ERROR ROUIINE         U6I02290
                          SPAC    1                                     U6I02300
                    PACK4 DC      *-*       ENTRY POINT                 U6I02310
                          BSC  L  P4001     BR TO PACK 4 CHARS IN A/E   U6I02320
                          SPAC    1                                     U6I02330
                    GTREC DC      *-*       ENTRY POINT                 U6I02340
                          BSC  L  GR001     BR TO GET INPUT RECORD      U6I02350
                          SPAC    1                                     U6I02360
                    CVXB4 DC      *-*       ENTRY POINT                 U6I02370
                          BSC  L  CI001     BR TO CONVERT HEX TO BINARY U6I02380
                          SPAC    1                                     U6I02390
                    TSTBL DC      *-*       ENTRY POINT                 U6I02400
                          BSC  L  TB001     BR TO TEST BLANK            U6I02410
                          SPAC    3                                     U6I02420
                    *************************************************** U6I02430
                    *  DEFINITION OF CARD AND PRINT AREAS             * U6I02440
                    *************************************************** U6I02450
                          SPAC    1                                     U6I02460
                          BSS  E  1                                     U6I02470
                    CAREA EQU     *+1       CAREA IS THE CARD AREA      U6I02480
                          SPAC    1                                     U6I02490
                    PRBUF EQU     CAREA+82  THE PRINTER BUFFER          U6I02500
                          EJCT                                          U6I02510
                    XSLET DC      *-*        ENTRY POINT                U6I02520
                          SPAC    1                                     U6I02530
                    *************************************************** U6I02540
                    *  XSLET  *  FILL IN SLET EXTRACTS                * U6I02550
                    *************************************************** U6I02560
                    *                                                 * U6I02570
                    *INPUT -- ARG 0 = NUMBER OF PHASE IDS,            * U6I02580
                    *         ARG 1 = ADDR(FIRST WORD OF SLET EXTRACT)* U6I02590
                    *         ARG 2 = ADDR OF 322-WORD BUFFER AREA    * U6I02600
                    *                                                 * U6I02610
                    *OUTPUT -- LOAD ADDRESSES, WORDCOUNTS, AND SADS IN* U6I02620
                    *          ALL EXTRACTS FOR WHICH SLET ENTRY FOUND* U6I02630
                    *                                                 * U6I02640
                    *EXTERNAL REFERENCES -- DZ000 AND $DBSY           * U6I02650
                    *                                                 * U6I02660
                    *ERRORS -- NONE DETECTED                          * U6I02670
                    *                                                 * U6I02680
                    *RETURN -- ALWAYS TO BSI + 4                      * U6I02690
                    *                                                 * U6I02700
                    *NOTES -- SLET EXTRACTS AND BUFFER ADDR MUST BE   * U6I02710
                    *         ON EVEN BOUNDARIES.                     * U6I02720
                    *         X1 AND X2 ARE SAVED/RESTORED            * U6I02730
                    *         X3 IS NOT USED                          * U6I02740
                    *         ACC/EXT/STAT ARE NOT SAVED/RESTORED     * U6I02750
                    *                                                 * U6I02760
                    *************************************************** U6I02770
                          SPAC    1                                     U6I02780
                    * INITIALIZATION                                    U6I02790
                          SPAC    1                                     U6I02800
                    XS001 STX   1 XS091+1    SAVE INDEX 1               U6I02810
                          STX   2 XS092+1    SAVE INDEX 2               U6I02820
                          LDX  I1 XSLET      INDEX 1 = ADDR(ARGLIST)    U6I02830
                          LD    1 1          ACC=ADDR(SLET EXTRACTS)    U6I02840
                          STO     XS060+1    SET INTO INSTR             U6I02850
                          LD    1 2          ACC=ADDR(BUFFER AREA)      U6I02860
                          STO     XS020+1    SET INTO INSTR             U6I02870
                          MDX   1 +3         SET INDEX FOR RETURN       U6I02880
                          STX   1 XS099+1    SET EXIT ADDR IN INSTR     U6I02890
                    XS020 LDX  L1 *-*        XR1=ADDR(BUFFER)           U6I02900
                          LDD     XS320      ACC=320, EXT=3 (=SAD(SLET) U6I02910
                          STD   1 0          SET INTO DISK CTL WORDS    U6I02920
                          SPAC    1                                     U6I02930
                    * OUTER LOOP -- PER DISK SECTOR OF SLET             U6I02940
                          SPAC    1                                     U6I02950
                    XS030 LD      XS020+1    ACC=ADDR(DCTL)             U6I02960
                          SRT     16                                    U6I02970
                          BSI  L  DZ000      TELL DISKZ TO READ         U6I02980
                          MDX  L  $DBSY,0                               U6I02990
                          MDX     *-3        WAIT FOR READ COMPLETE     U6I03000
                          LDX   2 80         XR2=LIMIT FOR SLET ENTRIES U6I03010
                          STX   2 XS111      STORE LIMIT COUNT          U6I03020
                          SPAC    1                                     U6I03030
                    * MIDDLE LOOP -- PER ENTRY IN SLET                  U6I03040
                          SPAC    1                                     U6I03050
                    XS050 LD   I  XSLET      ACC=NUMBER OF EXTRACTS     U6I03060
                          STO     XS110      STORE THE COUNT            U6I03070
                    XS060 LDX  L2 *-*        XR2=ADDR(SLET EXTRACTS)    U6I03080
                          SPAC    1                                     U6I03090
                    * INNER LOOP -- PER INDIVIDUAL SLET EXTRACT         U6I03100
                          SPAC    1                                     U6I03110
                    XS070 LD    1 2          ACC=PHID FROM SLET         U6I03120
                          EOR   2 0          COMPARE PHID IN EXTRACT    U6I03130
                          BSC     Z          SKIP IF EQUAL              U6I03140
                          MDX     XS082      NOT EQ--GO MODIFY EXTR PTR U6I03150
                          SPAC    1                                     U6I03160
                    * AN EXTRACT IS MATCHED--ENTER INFO INTO EXTRACT    U6I03170
                          SPAC    1                                     U6I03180
                          LD    1 3          ACC=LOAD ADDRESS FOR M SLE U6I03190
                          STO   2 1          LOAD ADDR TO EXTRACT       U6I03200
                          LDD   1 4          WORDCOUNT/SAD FROM SLET    U6I03210
                          STD   2 2          WORDCOUNT/SAD TO EXTRACT   U6I03220
                          MDX     XS081      GO TO NEW SLET ENTRY       U6I03230
                          SPAC    1                                     U6I03240
                    XS082 MDX   2 +4         UPDATE EXTRACT POINTER     U6I03250
                          MDX  L  XS110,-1   DECREMENT COUNT OF EXTRS   U6I03260
                          MDX     XS070      BR IF NOT ALL              U6I03270
                          SPAC    1                                     U6I03280
                    XS081 MDX   1 +4         UPDATE SLET ENTRY POINTER  U6I03290
                          MDX  L  XS111,-1   DECREMENT LIMIT COUNT      U6I03300
                          MDX     XS050      BR IF NOT END-OF-SECTOR    U6I03310
                          SPAC    1                                     U6I03320
                          LDX  I1 XS020+1    RESET INDEX 1              U6I03330
                          LD    1 1          GET SECTOR ADDRESS         U6I03340
                          A       XS101      ADD 1                      U6I03350
                          STO   1 1          SET SAD FOR SECOND SCTR    U6I03360
                          BSC     E          SKIP IF NOW 4              U6I03370
                          MDX     *+1        BR IF NOW FIVE             U6I03380
                          MDX     XS030      BR TO PROCESS NEW SECTOR   U6I03390
                          SPAC    1                                     U6I03400
                    * RESTORE AND RETURN                                U6I03410
                          SPAC    1                                     U6I03420
                    XS091 LDX  L1 *-*        RESTORE INDEX 1            U6I03430
                    XS092 LDX  L2 *-*        RESTORE INDEX 2            U6I03440
                    XS099 BSC  L  *-*        RETURN TO CALLER           U6I03450
                          SPAC    1                                     U6I03460
                    * CONSTANTS AND WORKSPACES                          U6I03470
                          SPAC    1                                     U6I03480
                          BSS  E  0                                     U6I03490
                    XS320 DC      320        WORDCOUNT                  U6I03500
                          DC      3          SAD OF SLET                U6I03510
                    XS101 DC      1          CONSTANT--INCREMENT        U6I03520
                    XS110 DC      *-*        HOLD NO. SLET EXTRACTS     U6I03530
                    XS111 DC      *-*        HOLD NO. ENTRIES IN SLET   U6I03540
                          EJCT                                          U6I03550
                    *************************************************** U6I03560
                    * I N I T I A L I Z A T I O N   R O U T I N E     * U6I03570
                    *************************************************** U6I03580
                    *                                                 * U6I03590
                    * THE FOLLOWING AREA CONTAINS THE INITIALIZATION  * U6I03600
                    *   CODE FOR THIS PROGRAM, AND IS OVERLAID BY THE * U6I03610
                    *   CARD AND PRINT AREAS AFTER INITIALIZATION.    * U6I03620
                    *                                                 * U6I03630
                    * THE FUNCTIONS OF INITIALIZATION ARE AS FOLLOWS--* U6I03640
                    *   * ESTABLISH ADDRESSABILITY OF THE COMMUNI-    * U6I03650
                    *     CATION REGION AND INTERNAL TRANSFER VECTOR. * U6I03660
                    *   * READ DCOM, CAPTURING AND STORING #JBSW,     * U6I03670
                    *     #SYSC, #CIDN QUINTUPLE, AND #ULET QUINTUPLE * U6I03680
                    *   * READ THE HEADING SECTOR, CAPTURING THE JOB  * U6I03690
                    *     NAME.                                       * U6I03700
                    *   * SEARCH SLET (USING SUBROUTINE XSLET) FOR    * U6I03710
                    *     ENTRIES FOR PRINCIPAL PRINTER AND PRINCIPAL * U6I03720
                    *     INPUT DEVICE SUBROUTINES.                   * U6I03730
                    *   * LOAD THE TWO DEVICE SUBROUTINES AND PLUG    * U6I03740
                    *     APPROPRIATE INTERRUPT LOCATIONS.            * U6I03750
                    *   * PRINT THE PAGE HEADING FOR THE FIRST TIME.  * U6I03760
                    *   * TEST #JBSW FOR TEMPORARY MODE--ABORT WITH   * U6I03770
                    *     MESSAGE IF TEMPORARY MODE.                  * U6I03780
                    *   * TEST THE $NDUP SWITCH FOR SUPPRESS-DUP.     * U6I03790
                    *     ABORT WITH MESSAGE IF DUP SUPPRESSED.       * U6I03800
                    *   * READ THE FIRST OF ALL INPUT CARDS.  IF NOT  * U6I03810
                    *     *PRO, ABORT WITH MESSAGE.                   * U6I03820
                    *   * TRANSFER CONTROL TO THE MAIN ROUTINE OF     * U6I03830
                    *     MODSF.                                      * U6I03840
                    *                                                 * U6I03850
                    *************************************************** U6I03860
                          SPAC    2                                     U6I03870
                    * ESTABLISH ADDRESSABILITY OF COMMUNICATION         U6I03880
                    *   REGION AND INTERNAL TRANSFER VECTOR.            U6I03890
                          SPAC    1                                     U6I03900
                    BEGIN EQU     *                                     U6I03910
                          LDX  I3 $WRD1     XR3=ADDR(CORE-IMAGE HEADER) U6I03920
                          MDX   3 +127      XR3=ADDR(CI-HDR + 127)      U6I03930
                    X3    EQU     COMRG-30+127  ESTABLISH BASE SYMBOL   U6I03940
                    $LEV4 EQU     /C        LEVEL 4 BR ADDR        2-11 U6I03945
                          SPAC    1                                     U6I03950
                    * READ DCOM, CAPTURING #JBSW, #SYSC, #CIDK(5),      U6I03960
                    *   AND #ULET(5)                                    U6I03970
                          SPAC    1                                     U6I03980
                          LDX  L2 DAREA-2   XR2=ADDR(DISK BUF)          U6I03990
                          LDD  L  DCLST     ACC/EXT=WD CNT/SAD     2-11 U6I04000
                          BSI   3 DREAD-X3  GO READ DCOM SECTOR         U6I04010
                          LD   L  DAREA+#SYSC  GET VERSION/MOD          U6I04020
                          STO   3 VMOD-X3   SAVE IN COMMUNICATION REGN  U6I04030
                          LD   L  DAREA+#JBSW  GET TEMP MODE INDIC      U6I04040
                          STO   3 JBSW-X3   SAVE IN COMMUNICATION REGN  U6I04050
                          LD   L  DAREA+#PIOD  GET PRIN I/O DEV INDIC   U6I04060
                          STO   3 PIODV-X3  SAVE IT                     U6I04070
                          LDX   1 -5        SET DISPL/COUNT FOR QUINT   U6I04080
                    DCLUP LD   L1 DAREA+#CIDN+5  GET CARTRIDGE ID       U6I04090
                          STO  L1 CIDN5+5   STORE IN COMMUNICATION REGN U6I04100
                          LD   L1 DAREA+#ULET+5  GET ADDR OF LET        U6I04110
                          STO  L1 ULET5+5   STORE IN COMMUNICATION REGN U6I04120
                          MDX   1 +1        INCREMENT INDEX             U6I04130
                          MDX     DCLUP     BR IF NOT YET 5             U6I04140
                          SPAC    1                                     U6I04150
                    * IF // TYP IN FORCE, SUBSTITUTE ITS DEVICE SUBR    U6I04160
                    *   PHASE ID FOR THAT OF PRINCIPAL INPUT            U6I04170
                          SPAC    1                                     U6I04180
                          LD   L  $KCSW     NON-ZERO SAYS TYP IN FORCE  U6I04190
                          BSC  L  *+4,+-    BR IF NOT // TYP MODE   212 U6I04200
                          LD      *-1       FORCE NEGATIVE NUMBER   212 U6I04205
                          STO   3 PIODV-X3  SET FOR NO CONVERSION       U6I04210
                          MDX  L  SLETX+4,-8     CHANGE PHASE ID TO /92 U6I04220
                          SPAC    1                                     U6I04230
                    * NOW SEARCH SLET FOR I/O SUBROUTINES               U6I04240
                          SPAC    1                                     U6I04250
                          BSI     XSLET     INVOKE SUBROUTINE           U6I04260
                          DC      2         *ARG 1--NO. ENTRIES         U6I04270
                          DC      SLETX     *ARG 2--ADDR OF EXTRACT     U6I04280
                          DC      DAREA     *ARG 3--ADDR OF DISK BUFFER U6I04290
                          SPAC    1                                     U6I04300
                    * READ IN FIRST 10 WORDS OF HEADING SECTOR,         U6I04310
                    *   CAPTURING JOB-NAME                              U6I04320
                          SPAC    1                                     U6I04330
                          LDX  L2 HEADR-2   XR2=ADDR(INPUT AREA)        U6I04340
                          LDD     HDLST     ACC/EXT=WORDCOUNT/SAD       U6I04350
                          BSI   3 DREAD-X3  READ THE SECTOR             U6I04360
                          SPAC    1                                     U6I04370
                    *************************************************** U6I04372
                    *  INDEX REGISTER 1 IS USED THROUGHOUT THE LOGIC  * U6I04373
                    *  THAT LOADS THE PRINCIPLE INPUT/OUTPUT          * U6I04374
                    *  ROUTINES.  IT SHOULD NOT BE ALTERED.           * U6I04375
                    *************************************************** U6I04376
                    *                                                   U6I04377
                    * READ IN THE PRINTER ROUTINE FROM SYSTEM AREA      U6I04380
                    *   AND PLUG INTERRUPT POINTERS                     U6I04390
                          SPAC    1                                     U6I04400
                          LDX  L2 PR000-2   XR2=ADDR(PRINTER ROUTINE)   U6I04410
                          LDD   3 SLETX+2-X3  WORDCOUNT/SAD             U6I04420
                          BSI   3 DREAD-X3  READ IN THE ROUTINE         U6I04430
                          SPAC    1                                     U6I04440
                          MDX   2 +2+4      XR2=PR000+4--LEV 4 INT ENTR U6I04450
                          STX  L2 IBT4-I1403  IN CASE THIS IS 1403      U6I04460
                    *  14 INSTRUCTIONS REMOVED                     2-12 U6I04461
                    DC300 STX  L2 $LEV1     IN CASE THIS IS 1132   2-11 U6I04475
                          SPAC    1                                     U6I04480
                    * READ IN THE INPUT ROUTINE AND PLUG INTERRUPT      U6I04490
                    *   POINTERS                                        U6I04500
                          SPAC    1                                     U6I04510
                          LDX  L2 CD000-2   XR2=ADDR(INPUT ROUTINE)     U6I04520
                          LDD   3 SLETX+6-X3 ACC/EXT=WORDCOUNT/SAD      U6I04530
                          BSI   3 DREAD-X3  READ IN THE ROUTINE         U6I04540
                          SPAC    1                                     U6I04550
                          MDX   2 +2+4      XR2=CD000+4--LEV 4 INT ENTR U6I04560
                    *  9 INSTRUCTIONS REMOVED                      2-12 U6I04562
                    NUP20 STX  L2 IBT4-I1442  IN CASE THIS IS 1442 2-11 U6I04578
                          STX  L2 IBT4-I2501  IN CASE THIS IS 2501      U6I04580
                          STX  L2 IBT4-I1134  IN CASE THIS IS 1134      U6I04590
                          STX  L2 IBT4-IKBCP  IN CASE OF KEYBOARD       U6I04600
                          SPAC    1                                     U6I04610
                          MDX   2 +3        XR2=CD000+7--LEV 0 INT ENTR U6I04620
                          STX  L2 $LEV0     IN CASE THIS IS 1442        U6I04630
                          SPAC    1                                2-12 U6I04632
                    * FORCE MODSF TO USE THE SYSTEM ILS04          2-12 U6I04634
                          SPAC    1                                2-12 U6I04636
                          LD      HD0C4     PLACE ADDR OF RES MON  2-12 U6I04638
                          STO  L  $LEV4     *ILS04 IN INT BR ADDR  2-12 U6I04639
                          SPAC    1                                     U6I04640
                    * PRINT THE PAGE HEADING FOR THE FIRST TIME         U6I04650
                          SPAC    1                                2-12 U6I04662
                          SPAC    1                                2-12 U6I04666
                          LDD     HDXXX     ARGUMENT LIST               U6I04670
                          BSI  L  PR000+1   INVOKE PRINTER ROUTINE      U6I04680
                          BSI  L  PR000+1   INVOKE AGAIN TO PRINT IT    U6I04690
                          MDX  L  $PBSY,0   WAIT FOR COMPLETE           U6I04700
                          MDX     *-3                                   U6I04710
                          SPAC    1                                     U6I04720
                    * IF IN TEMPORARY MODE, ABORT WITH ERROR 01         U6I04730
                          SPAC    1                                     U6I04740
                          LD    3 JBSW-X3   GET SWITCH                  U6I04750
                          BSC  L  *+2,+-    BR IF *NOT* TEMP MODE       U6I04760
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I04770
                          EBC     .01.      *ARGUMENT FOR ERROR 01      U6I04780
                          SPAC    1                                     U6I04790
                    * IF SUPPRESS-DUP IS IN FORCE, ABORT WITH           U6I04800
                    *   ERROR 02                                        U6I04810
                          SPAC    1                                     U6I04820
                          LD   L  $NDUP     GET SWITCH                  U6I04830
                          BSC  L  *+2,+-    BR IF *NOT* ON              U6I04840
                          BSI   3 ERROR-X3  INVOKE ERROR ROUTINE        U6I04850
                          EBC     .02.      *ARGUMENT FOR ERROR 02      U6I04860
                          SPAC    1                                     U6I04870
                    * ESTABLISH WORDCOUNTS IN THE CARD AND PRINT AREAS  U6I04880
                          SPAC    1                                     U6I04890
                          LDX   2 80        WORDCOUNT OF 80             U6I04900
                          STX  L2 CAREA-1   * FOR THE CARD AREA         U6I04910
                          LDX   2 40        WORDCOUNT OF 40             U6I04920
                          STX  L2 PRBUF-1   * FOR THE PRINT AREA        U6I04930
                          SPAC    1                                     U6I04940
                    * NOW READ THE FIRST CARD                           U6I04950
                          SPAC    1                                     U6I04960
                          BSI   3 GTREC-X3  INVOKE CARD READ ROUTINE    U6I04970
                          BSI   3 PACK4-X3  INVOKE PACK ROUTINE         U6I04980
                          DC      CAREA     *ARGUMENT--ADDR OF EBCDIC   U6I04990
                          SD    3 KPRO-X3   SUBTRACT '*PRO'             U6I05000
                          BSC     +-        SKIP UNLESS ACC = ZERO      U6I05010
                          SLT     16        EXT TO ACC IF ACC WAS ZERO  U6I05020
                          BSC  L  *+2,+-    BR IF COLS. 1-4=*PRO        U6I05030
                          BSI   3 ERROR-X3  ELSE INVOKE ERROR           U6I05040
                          EBC     .03.      ARGUMENT FOR ERROR 03       U6I05050
                          SPAC    1                                     U6I05060
                    * INITIALIZATION NOW COMLETE--BEGIN NORMAL          U6I05070
                    *   EXECUTION                                       U6I05080
                          SPAC    1                                     U6I05090
                          BSC  L  NUPRO     GO PROCESS PROGRAM          U6I05100
                          SPAC    1                                     U6I05110
                    * CONSTANTS                                         U6I05120
                          SPAC    1                                     U6I05130
                          BSS  E  0                                     U6I05140
                    DCLST DC      320       ARGUMENT LIST FOR           U6I05150
                          DC      @DCOM     * DCOM                      U6I05160
                    HDLST DC      10        ARGUMENT LIST FOR           U6I05170
                          DC      @HDNG     * HEADING SECTOR            U6I05180
                    HDXXX DC      /7000     ARGUMENT LIST FOR           U6I05190
                          DC      HEADR-1   * PRINTING HEADER AFTER EJ  U6I05200
                    HD0C4 DC      /C4       ADDR OF SYSTEM ILS04   2-11 U6I05203
                    HD091 DC      /91       INDICATES ISS          2-11 U6I05205
                    * 1 CONSTANT REMOVED                           2-12 U6I05207
                          EJCT                                          U6I05210
                    *************************************************** U6I05220
                    *  NUPRO  *  BEGIN TO PROCESS NEW PROGRAM         * U6I05230
                    *************************************************** U6I05240
                    NUPRO EQU     *                                     U6I05250
                          SPAC    1                                     U6I05260
                    * FIRST, PACK THE CURRENT RECORD INTO PRINT AREA    U6I05270
                    *   AND PRINT IT AFTER A SPACE                      U6I05280
                          SPAC    1                                     U6I05290
                          BSI   3 SPACE-X3  SINGLE SPACE                U6I05300
                          BSI   3 PKPRT-X3  PACK AND PRINT THE RECORD   U6I05310
                          SPAC    1                                     U6I05320
                    * NOW SEE WHICH KIND OF RECORD IT IS                U6I05330
                          SPAC    1                                     U6I05340
                          BSI   3 PACK4-X3  INVOKE CONVERSION ROUTINE   U6I05350
                          DC      CAREA     VALUE IN ACC/EXT            U6I05360
                          SD    3 KPRO-X3   COMPARE TO '*PRO'           U6I05370
                          BSC     +-        SKIP IF NOT ACC ZERO        U6I05380
                          SLT     16        SHIFT IF ACC WAS ZERO       U6I05390
                          BSC  L  DOPRO,+-  BR TO PROCESS *PRO IF IT IS U6I05400
                          SPAC    1                                     U6I05410
                          BSI   3 PACK4-X3  INVOKE PACK ROUTINE AGAIN   U6I05420
                          DC      CAREA     VALUE INTO ACC/EXT          U6I05430
                          SD    3 KEND-X3   COMPARE TO '*END'           U6I05440
                          BSC  L  *+2,+-    BR IF IT IS *END            U6I05450
                          SPAC    1                                     U6I05460
                    * INVALID PATCH CONTROL RECORD--ERROR 06            U6I05470
                          SPAC    1                                     U6I05480
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I05490
                          EBC     .06.      ARGUMENT FOR ERROR 06       U6I05500
                          SPAC    3                                     U6I05510
                    *************************************************** U6I05520
                    *  NORMAL TERMINATION WITH REPLACEMENT ONLY       * U6I05530
                    *************************************************** U6I05540
                          SPAC    1                                     U6I05550
                    FINSH EQU     *                                     U6I05560
                          BSI   3 SPACE-X3  SINGLE SPACE                U6I05570
                          BSI   3 PRINT-X3  INVOKE PRINT RUUTINE        U6I05580
                          DC      BYMSG-1   *TO PRINT NORMAL SIGNOFF    U6I05590
                          SPAC    1                                     U6I05600
                          EXIT              RETURN TO MONITOR           U6I05610
                          SPAC    1                                     U6I05620
                    * SIGNOFF MESSAGE                                   U6I05630
                          SPAC    1                                     U6I05640
                          BSS  E  1         ASSURE ODD BOUNDARY         U6I05650
                          DC      BYMSX-*                               U6I05660
                    BYMSG EBC     .SUCCESSFUL COMPLETION .              U6I05670
                    BYMSX EQU     *                                     U6I05680
                          EJCT                                          U6I05690
                    *************************************************** U6I05700
                    *  DOPRO  *  PROCESSING OF THE '*PRO' CONTROL REC * U6I05710
                    *************************************************** U6I05720
                          SPAC    2                                     U6I05730
                    DOPRO EQU     *                                     U6I05740
                          SPAC    1                                     U6I05750
                    * CHECK THAT THE PREVIOUS PROGRAM WAS NOT EXPANDED  U6I05760
                          SPAC    1                                     U6I05770
                          LD    3 EXPSW-X3  GET THE SWITCH              U6I05780
                          BSC  L  *+2,+-    BR IF WAS *NOT* EXPANDED    U6I05790
                          SPAC    1                                     U6I05800
                    * IT WAS EXPANDED--ERROR 31                         U6I05810
                          SPAC    1                                     U6I05820
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I05830
                          EBC     .31.      NO *END AFTER EXPANSION     U6I05840
                          SPAC    1                                     U6I05850
                    * NOW CLEAR THE STRING AREA                         U6I05860
                          SPAC    1                                     U6I05870
                          LDX   1 -105      FOR 35 SLOTS                U6I05880
                          LD      PRO80     /8000 (NULL INDICATOR)      U6I05890
                    PRO81 STO  L1 STRNG+105 STORE NULL INDIC            U6I05900
                          MDX   1 +1        MODIFY POINTER              U6I05910
                          MDX     PRO81     BR IF NOT EXHAUSTED         U6I05920
                          SLA     16        SET STOPPER                 U6I05930
                          STO  L  STRNG+105 STORE STOPPER               U6I05940
                          SPAC    1                                     U6I05950
                    * FIRST, TEST THE REQUIRED BLANK COLUMNS--ERROR 07  U6I05960
                          SPAC    1                                     U6I05970
                          LDX   2 -14       SET FOR 14 LOOKS            U6I05980
                    PRO01 LD   L2 BLLST+14  ACC=ADDR TO FIND BLANK      U6I05990
                          STO     *+1       SET NEXT INSTR              U6I06000
                          LD   L  *-*       GET COLUMN                  U6I06010
                          EOR     PROBL     COMPARE TO BLANK            U6I06020
                          BSC  L  PRO07,Z   BR IF *NOT* BLANK           U6I06030
                          MDX   2 +1        UPDATE POINTER              U6I06040
                          MDX     PRO01     BR IF NOT TEST ALL 14       U6I06050
                          MDX     PRO02     ALL TESTED--GO ON TO NEXT   U6I06060
                          SPAC    1                                     U6I06070
                    * ERROR 07--COLUMN IS NOT BLANK                     U6I06080
                          SPAC    1                                     U6I06090
                    PRO07 BSI   3 ERROR-X3  INVOKE ERROR                U6I06100
                          EBC     .07.      ARGUMENT FOR ERROR 7        U6I06110
                          SPAC    1                                     U6I06120
                    * LIST OF POSITIONS TO BE BLANK                     U6I06130
                          SPAC    1                                     U6I06140
                    BLLST EQU     *                                     U6I06150
                          DC      CAREA+5-1 COL 5                       U6I06160
                          DC      CAREA+9-1  COL 9                      U6I06170
                          DC      CAREA+15-1  COL 15                    U6I06180
                          DC      CAREA+20-1  COL 20                    U6I06190
                          DC      CAREA+22-1  COL 22                    U6I06200
                          DC      CAREA+27-1  COL 27                    U6I06210
                          DC      CAREA+32-1  COL 32                    U6I06220
                          DC      CAREA+37-1  COL 37                    U6I06230
                          DC      CAREA+42-1  COL 42                    U6I06240
                          DC      CAREA+47-1  COL 47                    U6I06250
                          DC      CAREA+52-1  COL 52                    U6I06260
                          DC      CAREA+57-1  COL 57                    U6I06270
                          DC      CAREA+62-1  COL 62                    U6I06280
                          DC      CAREA+67-1  COL 67                    U6I06290
                          SPAC    1                                     U6I06300
                    * CONSTANTS                                         U6I06310
                          SPAC    1                                     U6I06320
                    PROF0 DC      /00F0     CONSTANT EBCDIC ZERO        U6I06330
                    PROBL DC      /0040     CONSTANT BLANK              U6I06340
                    PROKP DC      .P        CONSTANT 'P'                U6I06350
                    PROKD DC      .D        CONSTANT 'D'                U6I06360
                    PRO80 DC      /8000     NULL INDICATOR FOR STRING   U6I06370
                          SPAC    1                                     U6I06380
                    * NOW CK THE VERSION AND MOD LEVEL                  U6I06390
                          SPAC    1                                     U6I06400
                    PRO02 EQU     *                                     U6I06410
                          LD      PROF0     ACC=/00F0                   U6I06420
                          STO  L  CAREA+5-1  SET ZERO IN COL 5          U6I06430
                          BSI   3 CVXB4-X3  INVOKE CONVERSION ROUTINE   U6I06440
                          DC      CAREA+5-1  COLS 5-8 FOR 0VMM          U6I06450
                          MDX     *+2       BR IF VALID FORMAT FOR V/M  U6I06460
                          SPAC    1                                     U6I06470
                    * VERSION/MOD INVALIDLY SPECIFIED--ERROR 08         U6I06480
                          SPAC    1                                     U6I06490
                          BSI   3 ERROR-X3  INVOKE ERROR ROUTINE        U6I06500
                          EBC     .08.      ARGUMENT FOR ERROR 8        U6I06510
                          SPAC    1                                     U6I06520
                    * IF NOT EQUAL TO TRUE VER/MOD, ERROR 09            U6I06530
                          SPAC    1                                     U6I06540
                          S     3 VMOD-X3   COMPARE TO TRUE VER/MOD     U6I06550
                          BSC  L  *+2,+-  BR IF CORRECT VERSION/MOD     U6I06560
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I06570
                          EBC     .09.      ARGUMENT FOR ERROR 09       U6I06580
                          SPAC    1                                     U6I06590
                    * NOW CONVERT TO NAMECODE--IF INVALID, ERROR 10     U6I06600
                          SPAC    1                                     U6I06610
                          SPAC    1                                     U6I06620
                          BSI  L  CVEBN     INVOKE NAMECODE CONVERSION  U6I06630
                    PRO10 DC      5       NAME LENGTH                   U6I06640
                          DC      CAREA+10-1  ADDR OF LEFTMOST CHAR     U6I06650
                          MDX     *+2     BR IF VALID NAME              U6I06660
                    ERR10 BSI   3 ERROR-X3  INVOKE ERROR                U6I06670
                          EBC     .10.      ARGUMENT FOR ERROR 10       U6I06680
                          STD   3 PNAMC-X3  SAVE NAMECODE IN COMRG      U6I06690
                          SPAC    1                                     U6I06700
                    * NOW GET NUMBER OF RECORDS IN HEX--INVALID, ERR 11 U6I06710
                          SPAC    1                                     U6I06720
                          BSI   3 CVXB4-X3  INVOKE CONVERSION           U6I06730
                          DC      CAREA+16-1  ADDR OF LEFTMOST CHAR     U6I06740
                          MDX     *+2       BR IF VALID HEX             U6I06750
                          SPAC    1                                     U6I06760
                    ERR11 BSI   3 ERROR-X3  INVOKE ERROR                U6I06770
                          EBC     .11.      ARGUMENT FOR ERROR 11       U6I06780
                          SPAC    1                                     U6I06790
                          BSC  L  ERR11,+   BR IF NUMBER NOT POSITIVE   U6I06800
                          STO   3 COUNT-X3  STORE COUNT IN COMRG        U6I06810
                          SRA     5         STRIP RIGHT 5 BITS          U6I06820
                          BSC  L  ERR11,Z   BR IF GT 31 RECS SPECIFIED  U6I06830
                          SPAC    1                                     U6I06840
                    * GET ADDRESSING MODE--IF NOT D OR P, ERROR 18      U6I06850
                          SPAC    1                                     U6I06860
                          LD   L  CAREA+21-1  GET COLUMN 21             U6I06870
                          EOR     PROKP     COMPARE TO 'P'              U6I06880
                          BSC  L  *+2,Z     BR IF *NOT* 'P'             U6I06890
                          SPAC    1                                     U6I06900
                          STO   3 MODE-X3   SET MODE = ZERO--P-ADDRESS  U6I06910
                          MDX     MODOK     BR TO NEXT CHECK            U6I06920
                          SPAC    1                                     U6I06930
                          EOR     PROKP     RESTORE CHAR                U6I06940
                          EOR     PROKD     COMPARE TO 'D'              U6I06950
                          BSC  L  *+2,+-    BR IF IT WAS 'D'            U6I06960
                          SPAC    1                                     U6I06970
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I06980
                          EBC     .18.      ARGUMENT FOR ERROR 18       U6I06990
                          SPAC    1                                     U6I07000
                          LDS     1         SET FOR D-ADDRESS           U6I07010
                          STS   3 MODE-X3   SET D-ADDRESS INTO MODE SW  U6I07020
                    MODOK EQU     *                                     U6I07030
                          SPAC    1                                     U6I07040
                    * SEE IF A CARTRIDGE ID IS PRESENT                  U6I07050
                          SPAC    1                                     U6I07060
                          LDX   1 -4        SET LENGTH ARGUMENT         U6I07070
                          BSI   3 TSTBL-X3  INVOKE TEST-FOR-BLANK ROUT  U6I07080
                          DC      CAREA+23+3   ADDR OF FIRST COL BEYOND U6I07090
                          MDX     NOCID     BR IF ALL BLANK             U6I07100
                          SPAC    1                                     U6I07110
                          BSI   3 CVXB4-X3  INVOKE CONVERSION           U6I07120
                          DC      CAREA+23-1  ADDR OF LEFTMOST CHAR     U6I07130
                          MDX     *+2       BR IF VALID HEX             U6I07140
                          SPAC    1                                     U6I07150
                    ERR12 BSI   3 ERROR-X3  INVOKE ERROR                U6I07160
                          EBC     .12.      ARGUMENT FOR ERROR 12       U6I07170
                          SPAC    1                                     U6I07180
                          BSC  L  ERR12,+   BR IF ID NOT POSITIVE       U6I07190
                          MDX     CIDOK     BR TO STORE CID             U6I07200
                          SPAC    1                                     U6I07210
                    NOCID LD    3 CIDN5-X3  GET LOGICAL 0 CID           U6I07220
                          SPAC    1                                     U6I07230
                    CIDOK STO   3 CID-X3    STORE DESIRED CID IN COMRG  U6I07240
                          SPAC    1                                     U6I07250
                    * NOW SEE IF THE CARTRIDGE IS ON LINE--IF NOT,      U6I07260
                    *   ERROR 13                                        U6I07270
                          SPAC    1                                     U6I07280
                          LDX   2 -5                                    U6I07290
                          SLA     16        MAKE A ZERO                 U6I07300
                          STO   3 DRCOD-X3  SET DRIVE CODE = ZERO       U6I07310
                    CID01 LD   L2 CIDN5+5   GET AN ON-LINE ID           U6I07320
                          EOR   3 CID-X3    COMPARE TO REQUESTED ID     U6I07330
                          BSC  L  CID00,+-  BR IF EQUAL                 U6I07340
                          MDX  L  DRCOD,+1  INCR DRIVE CODE             U6I07350
                          MDX   2 +1        INCREMENT POINTER           U6I07360
                          MDX     CID01                                 U6I07370
                          SPAC    1                                     U6I07380
                          BSI   3 ERROR-X3  CARTRIDGE NOT ONLINE        U6I07390
                          EBC     .13.      ARGUMENT FOR ERROR 13       U6I07400
                          SPAC    1                                     U6I07410
                    CID00 LD    3 DRCOD-X3  GET THE DRIVE CODE          U6I07420
                          SLA     12        PUT INTO BITS 0-3           U6I07430
                          OR   L2 ULET5+5   OR IN ADDR OF LET           U6I07440
                          STO   3 ADLET-X3                              U6I07450
                          SPAC    1                                     U6I07460
                    * NOW FIND THE PROGRAM                              U6I07470
                          SPAC    1                                     U6I07480
                          LDD   3 PNAMC-X3  ACC/EXT=NAMECODE            U6I07490
                          LDX  L1 ADLET     XR1=ADDR(DRCOD/SAD)         U6I07500
                          BSI  L  LETSR     INVOKE LET SEARCH ROUT      U6I07510
                          DC      DAREA-2   ADDR OF BUFFER TO USE       U6I07520
                          STS     *         SET STATUS IN INSTR         U6I07530
                          LDX   2 *-*       XR2=STATUS RETURNED         U6I07540
                          BSC  I2 *         BR ACC TO FOLLOWING TABLE   U6I07550
                          SPAC    1                                     U6I07560
                          DC      ISDSF     00--DSF OR NOT FOUND        U6I07570
                          DC      ERR15     01--SECONDARY ENTRY POINT   U6I07580
                          DC      ERR16     10--CORE-IMAGE PROGRAM      U6I07590
                          DC      ERR17     11--DATA FILE               U6I07600
                          SPAC    1                                     U6I07610
                    ERR15 BSI   3 ERROR-X3  INVOKE ERROR                U6I07620
                          EBC     .15.      SECONDARY ENTRY POINT       U6I07630
                          SPAC    1                                     U6I07640
                    ERR16 BSI   3 ERROR-X3  INVOKE ERROR                U6I07650
                          EBC     .16.      CORE-IMAGE PROGRAM          U6I07660
                          SPAC    1                                     U6I07670
                    ERR17 BSI   3 ERROR-X3  INVOKE ERROR                U6I07680
                          EBC     .17.      DATA-FILE                   U6I07690
                          SPAC    1                                     U6I07700
                    ISDSF BSC  L  *+2,Z     BR IF PROGRAM FOUND         U6I07710
                          SPAC    1                                     U6I07720
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I07730
                          EBC     .14.      PROGRAM NOT FOUND           U6I07740
                          STD   3 DBCNT-X3  SAVE COUNT/SAD              U6I07750
                          SPAC    1                                     U6I07760
                    * NOW COLLECT THE VERIFICATION PARAMETERS IF        U6I07770
                    *   PRESENT                                         U6I07780
                          SPAC    1                                     U6I07790
                          LDX   1 -40       SET FOR 40 COLUMNS          U6I07800
                          LDX   2 -105      SET FOR BEGIN OF STRING     U6I07810
                    VER00 EQU     *                                     U6I07820
                          BSI   3 TSTBL-X3  TEST FOR ALL BLANK          U6I07830
                    VER01 DC      CAREA+67  1 BEYOND LAST COLUMN        U6I07840
                          MDX     VER99     BR IF ALL BLANK             U6I07850
                          SPAC    1                                     U6I07860
                          STX   1 VER10     STORE -40,-30,-20,-10       U6I07870
                          LD      VER10     * AND PLACE IN ACC          U6I07880
                          A       VER01     ADD ADDR FIRST COL BEYOND   U6I07890
                          STO     VER10     SET ARGUMENT                U6I07900
                          STO     VER20     SET SECOND ARGUMENT         U6I07910
                          MDX  L  VER20,+5  * AS FIVE BEYOND FIRST      U6I07920
                          BSI   3 CVXB4-X3  INVOKE HEX CONVERSION       U6I07930
                    VER10 DC      *-*       ARGUMENT -- ADDRESS         U6I07940
                          MDX     *+2       BR IF VALID HEX             U6I07950
                          SPAC    1                                     U6I07960
                    ERR19 BSI   3 ERROR-X3  INVOKE ERROR                U6I07970
                          EBC     .19.      INVALID VERIFY ADDRESS      U6I07980
                          SPAC    1                                     U6I07990
                          BSC  L  ERR19,+Z  BR IF ADDRESS NEGATIVE      U6I08000
                          STO  L2 STRNG+105 STORE THE ADDRESS           U6I08010
                          SPAC    1                                     U6I08020
                          BSI   3 CVXB4-X3  INVOKE CONVERSION OF VALUE  U6I08030
                    VER20 DC      *-*       ADDR OF VALUE               U6I08040
                          MDX     *+2       BR IF VALID HEX             U6I08050
                          SPAC    1                                     U6I08060
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I08070
                          EBC     .20.      INVALID VALUE               U6I08080
                          SPAC    1                                     U6I08090
                          STO  L2 STRNG+105+2  STORE THE VALUE          U6I08100
                          SPAC    1                                     U6I08110
                          MDX   2 +3        INCR TO NEXTSTRING SLOT     U6I08120
                          MDX   1 +10       MODIFY COLUMN POINTER       U6I08130
                          MDX     VER00     BR IF NOT DONE 4            U6I08140
                    VER99 STX  L2 STPTR     SET STRING POINTER          U6I08150
                          EJCT                                          U6I08160
                    *************************************************** U6I08170
                    *  PATCH  *  ROUTINE TO READ PATCH DATA RECORDS   * U6I08180
                    *************************************************** U6I08190
                          SPAC    2                                     U6I08200
                    * GET NEXT RECORD--IF * RECORD, HIS COUNT WAS WRONG U6I08210
                          SPAC    1                                     U6I08220
                    PATCH BSI   3 GTREC-X3  GET THE RECORD              U6I08230
                          LD   L  CAREA     GET COLUMN 1                U6I08240
                          EOR     PHAST     COMPARE TO ASTERISK         U6I08250
                          BSC  L  *+2,Z     BR IF NOT ASTERISK          U6I08260
                          SPAC    1                                     U6I08270
                    ERR22 BSI   3 ERROR-X3  INVOKE ERROR                U6I08280
                          EBC     .22.      ERRONEOUS COUNT--DATA RECS  U6I08290
                          SPAC    1                                     U6I08300
                          BSI   3 PKPRT-X3  PACK AND PRINT THE RECORD   U6I08310
                          SPAC    1                                     U6I08320
                    * NOW INITIALIZE INDEX FOR STRING POINTER AND       U6I08330
                    *   CONVERT THE PATCH ADDRESS                       U6I08340
                          SPAC    1                                     U6I08350
                          BSI   3 CVXB4-X3  CONVERT ADDRESS             U6I08360
                          DC      CAREA     ADDRESS OF HEX FORM         U6I08370
                          MDX     *+2       BR IF IT WAS VALID HEX      U6I08380
                          SPAC    1                                     U6I08390
                    ERR23 BSI   3 ERROR-X3  INVOKE ERROR                U6I08400
                          EBC     .23.      INVALID PATCH ADDRESS       U6I08410
                          SPAC    1                                     U6I08420
                          BSC  L  ERR23,+Z  BR IF ADDR NEGATIVE--ERROR  U6I08430
                          LDX  I2 STPTR     INIT INDEX 2 WITH CUR POS   U6I08440
                          STO   3 PADDR-X3  STORE PATCH ADDRESS         U6I08450
                          SPAC    1                                     U6I08460
                    * NOW BRANCH IF IN D-MODE--CONTINUE IF IN PMODE     U6I08470
                          SPAC    1                                     U6I08480
                          LD    3 MODE-X3   GET THE MODE (0=P, 1=D)     U6I08490
                          BSC  L  MODEP,Z   BR IF IN D-MODE             U6I08500
                          LDX   1 -63       SET INDEX 1 FOR MAX COLUMNS U6I08510
                          SPAC    1                                     U6I08520
                    * TEST FOR BLANK IN COLUMN 5 AND ALL SUCH POSITIONS U6I08530
                          SPAC    1                                     U6I08540
                    VALUP EQU     *                                     U6I08550
                          LD    3 PADDR-X3  GET CURRENT PATCH ADDR      U6I08560
                          STO  L2 STRNG+105+0  STORE ADDRESS IN STRING  U6I08570
                          LD   L1 CAREA+67+0  GET THE CHARACTER         U6I08580
                          EOR     PH040     COMPARE TO BLANK            U6I08590
                          BSC  L  *+2,+-    BR IF IT WAS BLANK          U6I08600
                          SPAC    1                                     U6I08610
                    ERR24 BSI   3 ERROR-X3  INVOKE ERROR                U6I08620
                          EBC     .24.      ERRONEOUSLY NON-BLANK       U6I08630
                          SPAC    1                                     U6I08640
                    * NOW FIND THE RELOCATION MODE OF THE PATCH         U6I08650
                          SPAC    1                                     U6I08660
                          STX   2 RSTX2+1   SAVE INDEX 2 FOR NOW        U6I08670
                          LDX   2 -4        SET FOR FOUR LOOKS          U6I08680
                    RCLUP LD   L1 CAREA+67+1  GET MODE CHARACTER        U6I08690
                          EOR  L2 RELOA+4   COMPARE TO VALID CHAR       U6I08700
                          BSC  L  RCFND,+-  BR IF FOUND                 U6I08710
                          MDX   2 +1        MODIFY LIST POINTER         U6I08720
                          MDX     RCLUP     BR IF NOT EXHAUSTED         U6I08730
                          SPAC    1                                     U6I08740
                          BSI   3 ERROR-X3  INVOKE ERROR                U6I08750
                          EBC     .25.      INVALID RELOC CODE          U6I08760
                          SPAC    1                                     U6I08770
                    RCFND EQU     *                                     U6I08780
                          STX   2 TEMP1     GET INDEX 2 VALUE           U6I08790
                          LD      TEMP1     ELSE GET INDEX VALUE        U6I08800
                          A       CON4      ADD CONSTANT 4              U6I08810
                    RSTX2 LDX  L2 *-*       RESTORE INDEX 2 VALUE       U6I08820
                          STO  L2 STRNG+105+1  STORE RELOC CODE         U6I08830
                          SPAC    1                                     U6I08840
                    * IF IT WAS A LIBF, SET LIBSW.  IF IT WAS 'A',      U6I08850
                    *  AND AFTER A LIBF, SET RELOC CODE=4               U6I08860
                          SPAC    1                                     U6I08870
                          BSC  L  NOTL2,Z   BR IF NOT 'A'               U6I08880
                          LD    3 LIBSW-X3  GET THE LIBF SWITCH         U6I08890
                          BSC  L  NOTL2,+-  BR IF SWITCH NOT ON         U6I08900
                          LD      CON4      'A' AFTER 'L'--SET RC=4     U6I08910
                          STO  L2 STRNG+105+1  STORE THE RELOC CODE     U6I08920
                          SLA     16        MAKE A ZERO                 U6I08930
                          STO   3 LIBSW-X3  CLEAR THE LIBF SWITCH       U6I08940
                    NOTL2 S       CON2      TEST FOR 'L'                U6I08950
                          BSC  L  NOTL1,Z   BR IF THIS NOT 'L'          U6I08960
                          MDX  L  LIBSW,+1  IT IS 'L'--TURN LIBF SW ON  U6I08970
                          MDX   1 +7        SKIP IF AT END OF CARD      U6I08980
                          MDX     *+2       NO SKIP--NOT END OF CARD    U6I08990
                    ERR29 BSI   3 ERROR-X3  INVOKE ERROR                U6I09000
                          EBC     .29.      ITEM AFTER LIBF NOT 'A'     U6I09010
                          LD   L1 CAREA+67+1  GET NEXT RELOC CODE       U6I09020
                          EOR     RELOA     COMPARE TO 'A'              U6I09030
                          BSC  L  ERR29,Z   BR IF NEXT CODE NOT 'A'     U6I09040
                          MDX   1 -7        RESTORE INDEX VALUE         U6I09050
                          MDX     *+2       SKIP OVER NEXT INSTR        U6I09060
                    NOTL1 MDX  L  PADDR,+1  UPDATE PATCH ADDR           U6I09070
                          SPAC    1                                     U6I09080
                    * NOW CHECK THE POSN AFTER RELOC CODE FOR BLANK     U6I09090
                          SPAC    1                                     U6I09100
                          LD   L1 CAREA+67+2  GET COLUMN                U6I09110
                          EOR     PH040     COMPARE TO BLANK            U6I09120
                          BSC  L  ERR24,Z   BR IF NOT BLANK--ERROR      U6I09130
                          SPAC    1                                     U6I09140
                    * NOW GATHER A VALUE FROM THE RECORD                U6I09150
                          SPAC    1                                     U6I09160
                          LD      CONVL     GET BASE ADDRESS            U6I09170
                          STX   1 VLARG     GET THE CURRENT INDEX VALUE U6I09180
                          A       VLARG     ADD THAT VALUE TO BASE      U6I09190
                          STO     VLARG     SET UP ARG FOR CONVERT      U6I09200
                          BSI   3 CVXB4-X3  CONVERT VALUE               U6I09210
                    VLARG DC      *-*       ADDR OF THAT TO CONVERT     U6I09220
                          MDX     *+2       BR IF VALID HEX             U6I09230
                          SPAC    1                                     U6I09240
                    ERR26 BSI   3 ERROR-X3  INVOKE ERROR IF INVALID     U6I09250
                          EBC     .26.      INVALID HEX VALUE TO PATCH  U6I09260
                          SPAC    1                                     U6I09270
                          STO  L2 STRNG+105+2  STORE VALUE INTO         U6I09280
                    *                       *SPECIFICATION STRING       U6I09285
                          MDX   2 +3        INCR STRING PTR             U6I09290
                          MDX     *+2       BR IF NOT EXHAUSTED         U6I09300
                    ERR32 BSI   3 ERROR-X3  INVOKE ERROR                U6I09310
                          EBC     .32.      TOO MANY SPECIFICATIONS     U6I09320
                          MDX   1 +7        UP COLUMN INDEX TO NEXT     U6I09330
                          MDX     PHBLK     BR IF MORE COLUMNS          U6I09340
                    PATCX STX  L2 STPTR     SAVE STRING POINTER         U6I09350
                          MDX  L  COUNT,-1  REDUCE COUNT                U6I09360
                          MDX     PATCH     BR IF MORE PATCH RECS       U6I09370
                          BSI   3 GTREC-X3  NO MORE PATCH--SHOULD BE *  U6I09380
                          LD   L  CAREA     GET COLUMN 1                U6I09390
                          EOR     PHAST     COMPARE TO ASTERISK         U6I09400
                          BSC  L  ERR22,Z   BR IF NOT * -- COUNT ERROR  U6I09410
                          MDX     DOIT      IF WAS *, GO DO PATCHING    U6I09420
                    PHBLK BSI   3 TSTBL-X3  TEST REMAINING COLS FOR BLK U6I09430
                          DC      CAREA+67  BASE ADDRESS FOR TEST       U6I09440
                          MDX     PATCX     BR IF IT WAS BLANK          U6I09450
                          MDX     VALUP     BR IF MORE ON RECORD        U6I09460
                          SPAC    1                                     U6I09470
                    * CONSTANTS AND WORKSPACES                          U6I09480
                          SPAC    1                                     U6I09490
                    PHAST DC      .*        CONSTANT ASTERISK           U6I09500
                    PH040 DC      /0040     CONSTANT BLANK              U6I09510
                    RELOA DC      .A        ABSOLUTE RELOC CODE         U6I09520
                          DC      .R        RELOCATABLE RELOC CODE      U6I09530
                          DC      .L        LIBF RELOC CODE             U6I09540
                          DC      .C        CALL RELOC CODE             U6I09550
                    TEMP1 DC      *-*       WORKSPACE                   U6I09560
                    CON4  DC      4         CONSTANT 4                  U6I09570
                    CONVL DC      CAREA+67+3  BASE ADDR FOR CONVERT     U6I09580
                    CON2  DC      2         CONSTANT 2                  U6I09590
                    PHVL2 DC      CAREA+69+1                            U6I09600
                          SPAC    2                                     U6I09610
                    * MODE IS 'D'--PROCESS THE PATCH CARD               U6I09620
                          SPAC    1                                     U6I09630
                    MODEP LDX   1 -65       SET INITIAL INDEX VALUE     U6I09640
                          SPAC    1                                     U6I09650
                    * TEST FOR SEPARATOR BLANK                          U6I09660
                          SPAC    1                                     U6I09670
                    VALU2 EQU     *                                     U6I09680
                          LD    3 PADDR-X3  GET CURRENT PATCH ADDR      U6I09690
                          STO  L2 STRNG+105+0  STORE ADDR IN STRING     U6I09700
                          MDX  L  PADDR,+1   INCR PATCH ADDR            U6I09710
                          LD   L1 CAREA+69+0  GET BLANK POSN            U6I09720
                          EOR     PH040     COMPARE TO BLANK            U6I09730
                          BSC  L  ERR24,Z   BR IF NOT BLANK             U6I09740
                          SPAC    1                                     U6I09750
                    * NOW CONVERT AND STORE THE VALUE                   U6I09760
                          SPAC    1                                     U6I09770
                          LD      PHVL2     BASE ADDRESS                U6I09780
                          STX   1 V2ARG     GET INDEX VALUE             U6I09790
                          A       V2ARG     ADD INDEX VALUE             U6I09800
                          STO     V2ARG     SET ARGUMENT FOR CONVERT    U6I09810
                          BSI   3 CVXB4-X3  DO THE CONVERSION           U6I09820
                    V2ARG DC      *-*       ADDR OF HEX ITEM            U6I09830
                          MDX     *+2       BR IF WAS GOOD HEX          U6I09840
                          BSC  L  ERR26     BR IF BAD HEX               U6I09850
                          STO  L2 STRNG+105+2  STORE THE VALUE          U6I09860
                          SLA     16        MAKE A ZERO                 U6I09870
                          STO  L2 STRNG+105+1  STORE ZERO RELOC CODE    U6I09880
                          MDX   2 +3                                    U6I09890
                          MDX     *+2       BR IF NOT OUT OF SPEC SPACE U6I09900
                          BSC  L  ERR32     BR IF TOO MANY SPECS        U6I09910
                          MDX   1 +5        SET INDEX TO NEXT SLOT      U6I09920
                          MDX     P2BLK     BR IF NOT END OF CARD       U6I09930
                          MDX     PATCX     BR IF END OF CARD           U6I09940
                    P2BLK BSI   3 TSTBL-X3  TEST REST COLS BLANK        U6I09950
                          DC      CAREA+69  BASE ADDR FOR TEST          U6I09960
                          MDX     PATCX     BR IF REST BLANK            U6I09970
                          MDX     VALU2     ELSE BR TO GET NEXT VALUE   U6I09980
                    *************************************************** U6I09990
                    *  DO THE PATCHING AND REPORT TO USER RESULTS     * U6I10000
                    *************************************************** U6I10010
                          SPAC    2                                     U6I10020
                    DOIT  EQU     *                                     U6I10030
                          BSI  L  VRMOD     GO VERIFY/MODIFY            U6I10040
                          BSI   3 PRINT-X3  PRINT 'MODIFICATIONS        U6I10050
                          DC      MSGQ-1      MADE'  MESSAGE            U6I10060
                          LD    3 EXPSW-X3  SEE IF PROGRAM EXPANDED     U6I10070
                          BSC  L  NUPRO,+-  BR IF NO EXPANSION          U6I10080
                          BSI   3 PRINT-X3  PRINT '--IN WORKING-STORAGE U6I10090
                          DC      MSGW-1      MESSAGE                   U6I10100
                          BSI   3 PACK4-X3  PACK COLS 1-4 OF            U6I10110
                          DC      CAREA       NEXT CARD                 U6I10120
                          SD    3 KEND-X3   COMPARE TO *END             U6I10130
                          BSC     +-                                    U6I10140
                          SLT     16                                    U6I10150
                          BSC  L  *+2,+-    BR IF NEXT IS *END          U6I10160
                          SPAC    1                                     U6I10170
                          BSI   3 ERROR-X3  INVOKE ERROR IF NEXT        U6I10180
                          EBC     .31.        RECORD NOT *END           U6I10190
                          BSI   3 SPACE-X3                              U6I10200
                          BSI   3 PKPRT-X3  PACK END CARD TO PRINT      U6I10210
                          BSI   3 PRINT-X3  PRINT *STORE/*DELETE MSG    U6I10220
                          DC      MSGD-1                                U6I10230
                          SPAC    1                                     U6I10240
                    * FOR THE EXPANDED PROGRAM, POST NECESSARY          U6I10250
                    *   FACTS TO DCOM                                   U6I10260
                          SPAC    1                                     U6I10270
                          LD   L  $WSDR     GET W-S DRIVE CODE          U6I10280
                          STO     *+1                                   U6I10300
                          LDX  L1 *-*       X1=DRIVE CODE FOR WS        U6I10310
                          LD   L1 $FPAD     GET APPROP W-S SAD          U6I10320
                          SRT     16                                    U6I10340
                          LD      K320                                  U6I10350
                          LDX  L2 DAREA-2   PREPARE TO READ FIRST SCTR  U6I10360
                          BSI   3 DREAD-X3  FIRST SECTOR READ IN        U6I10370
                          LDD     DCID      GET DCOM ARGS               U6I10380
                          LDX  L2 DAREA+320-2                           U6I10390
                          BSI   3 DREAD-X3  DCOM READ IN                U6I10400
                          LD   L  DAREA+12  GET PROG NAME 1ST WORD      U6I10410
                          STO  L  DAREA+320+#NAME  INTO DCOM            U6I10420
                          LD   L  DAREA+13  GET 2ND WORD PF PROG NAME   U6I10430
                          STO  L  DAREA+321+#NAME  INTO DCOM            U6I10440
                          LD   L  DAREA+14  GET ENTRY ADDR              U6I10450
                          STO  L  DAREA+320+#ENTY  INTO DCOM            U6I10460
                          SLA     16        MAKE A ZERO FOR DSF FORMAT  U6I10470
                          STO  L1 DAREA+320+#FMAT  SET FORMAT IN DCOM   U6I10480
                          LD   L  DAREA+7   GET DISK BLOCK COUNT        U6I10490
                          STO  L1 DAREA+320+#WSCT  SET BLK CNT IN DCOM  U6I10500
                          LDX  L2 DAREA+320-2                           U6I10510
                          LDD     DCID        WRITE OF DCOM             U6I10520
                          BSI   3 DWRIT-X3  WRITE DCOM                  U6I10530
                          SPAC    1                                     U6I10540
                    * NOW INVOKE DUP VIA AUX SUPERVISOR                 U6I10550
                          SPAC    1                                     U6I10560
                          BSI  L  $DUMP                                 U6I10570
                          DC      -5                                    U6I10580
                          SPAC    2                                     U6I10590
                    * CONSTANTS AND MESSAGES                            U6I10600
                    DISPF DC      $FPAD     A($FPAD)               2-12 U6I10605
                          SPAC    1                                     U6I10610
                          BSS  E  0                                     U6I10620
                    DCID  EQU     *                                     U6I10630
                    K320  DC      320       BLOCK LENGTH                U6I10640
                          DC      /0001     SAD OF DCOM                 U6I10650
                          SPAC    1                                     U6I10660
                          BSS  E  1                                     U6I10670
                          DC      MSGQX-*                               U6I10680
                    MSGQ  EBC     .--MODIFICATIONS MADE--.              U6I10690
                    MSGQX EQU     *                                     U6I10700
                          SPAC    1                                     U6I10710
                          BSS  E  1                                     U6I10720
                          DC      MSGWX-*                               U6I10730
                    MSGW  EBC     .--IN WORKING-STORAGE--.              U6I10740
                    MSGWX EQU     *                                     U6I10750
                          SPAC    1                                     U6I10760
                          BSS  E  1                                     U6I10770
                          DC      MSGDX-*                               U6I10780
                    MSGD  EBC     .(*DELETE/*STORE MUST FOLLOW).        U6I10790
                    MSGDX EQU     *                                     U6I10800
                          EJCT                                          U6I10810
                    *************************************************** U6I10820
                    *  VRMOD  *  VERIFY AND MODIFY ON DISK            * U6I10830
                    *************************************************** U6I10840
                          SPAC    1                                     U6I10850
                    VRMOD DC      *-*     ENTRY TO VERIFY AND MODIFY    U6I10860
                          SPAC    1                                     U6I10870
                    *SETS UP 1ST SECTOR ADDR IN DZCON+1                 U6I10880
                    *READS 1ST SECTOR INTO BUFFER                       U6I10890
                    *GETS WDS BEYOND BEGINNING OF SECTOR THAT PROG      U6I10900
                    *STARTS IN ZH01                                     U6I10910
                          SPAC    1                                     U6I10920
                          LDX  L2 DAREA-2                               U6I10930
                          LD   L  DBADR   LOAD DISK BLK ADR OF PROG     U6I10940
                          SRT     16      MOVE TO EXT                   U6I10950
                          LD    3 DRCOD-X3 LOAD DISK DRIVE CODE         U6I10960
                          SLT     12                                    U6I10970
                          STO   3 DZCON+1-X3                            U6I10980
                          STO     DZHLD                                 U6I10990
                          SLA     16        CLEAR ACC                   U6I11000
                          SLT     6                                     U6I11010
                          STO     ZH01                                  U6I11020
                          SLT     2                                     U6I11030
                          A       ZH01    MULT BY 16                    U6I11040
                          STO     ZH01      SAVE ADDR OF 1ST WD         U6I11050
                    YM01  LDX  L1 STRNG   SET X1                        U6I11060
                    YM02  LDD   3 DZCON-X3                              U6I11070
                          BSI   3 DREAD-X3                              U6I11080
                          LD    3 MODE-X3  GET MODE                     U6I11090
                          BSI  L  YFIND,+- PROCESS IF P NODE            U6I11100
                          LD    3 MODE-X3                               U6I11110
                          BSI  L  ZADDR,Z PROCESS IF D MODE             U6I11120
                          LD      DZHLD                                 U6I11130
                          STO   3 DZCON+1-X3 RESET SECTOR ADDR          U6I11140
                          MDX   1 3       STEP TO NEXT STRING ELEMENT   U6I11150
                          LD    1 0                                     U6I11160
                          BNN     YM02    LOOP BACK UNTIL END           U6I11170
                          MDX  L  VPSW,0  SKIP IF VERIFY PASS           U6I11180
                          B       YM06    BRANCH IF MODIFY PASS         U6I11190
                          STX   1 VPSW    SET MODIFY PASS               U6I11200
                          LD   L  EXPSW   GET EXPAND SWITCH             U6I11210
                          BZ      YM01    BRANCH IF NO EXPANSION NEEDED U6I11220
                          LD      ZH01      DISPLACEMENT BEYOND         U6I11230
                          A       ZBUF      *START OF BUFFER            U6I11240
                          STO     YM03+1  'FROM' POINTER                U6I11250
                          LD      DZHLD   'FROM' SECTOR ADDR            U6I11260
                          STO   3 DZCON+1-X3                            U6I11270
                          LD   L  $WSDR   SYSTEM DRIVE NUMBER           U6I11280
                          A       DISPF     *CALC ADDR OF $FPAD    2-12 U6I11286
                          STO     YM025+1   *ENTRY FOR WS DRIVE    2-12 U6I11288
                    YM025 LD   L  *-*       GET FILE PROTECT ADDR  2-12 U6I11290
                          STO     YMCON+1 'TO' SECTOR ADDRESS           U6I11300
                          STO     DZHLD   NEW PROGRAM ADDRESS           U6I11310
                          STX   3 YM05+1  SAVE X3                       U6I11320
                          LD   L  DBCNT   GET DISK BLOCK COUNT          U6I11330
                          SRT     4       CONVERT TO SECTORS            U6I11340
                          STO     YMLP      SAVE FOR LOOP CONTROL       U6I11350
                          SLA     12      CLEAR ACC                     U6I11360
                          SLT     4       BRING OVER REMAINDER          U6I11370
                          BZ      *+2     SKIP IF FULL SECTOR           U6I11380
                          MDX  L  YMLP,1  STEP TO MOVE PARTIAL SECTOR   U6I11390
                          SRA     4       CLEAR ACC                     U6I11400
                          STO     ZH01    NEW PROGRAM STARTS ON SECTOR  U6I11410
                    *                     BOUNDARY                      U6I11420
                    YM03  LDX  L1 *-*     SET 'FROM'                    U6I11430
                          LDD   3 DZCON-X3 SET FOR READ                 U6I11440
                          BSI   3 DREAD-X3 READ IN SECTORS              U6I11450
                          MDX  L  DZCON+1,1  STEP SECTOR ADDRESS        U6I11460
                          LDX  L3 320     LOOP CONTROL FOR SHIFTING IN  U6I11470
                    YM04  LDD   1 0       MOVE TWO WORDS                U6I11480
                          STD   2 2                                     U6I11490
                          MDX   1 2                                     U6I11500
                          MDX   2 2                                     U6I11510
                          MDX   3 -2                                    U6I11520
                          B       YM04                                  U6I11530
                    YM05  LDX  L3 *-*     RESTORE X3                    U6I11540
                          LDX  L2 DAREA-2 RESET X2                      U6I11550
                          LDD     YMCON   SET FOR WRITE                 U6I11560
                          BSI   3 DWRIT-X3 WRITE OUT SECTOR             U6I11570
                          MDX  L  YMCON+1,1 STEP SECTOR ADDRESS         U6I11580
                          LD      YMCON+1 CHECK FOR ROOM LEFT           U6I11590
                          SLA     4                                2-12 U6I11600
                          S       X6000                            2-12 U6I11605
                          BN      YM055   BRANCH OK                     U6I11610
                          BSI   3 ERROR-X3                              U6I11620
                          EBC     .33.    NOT ENOUGH WORKING STORAGE    U6I11630
                    YM055 MDX  L  YMLP,-1 DECREMENT COUNT OF SECTORS    U6I11640
                          B       YM03    LOOP BACK                     U6I11650
                          LD      DZHLD   GET NEW PROGRAM ADDR (WS)     U6I11660
                          STO   3 DZCON+1-X3 SET CONTROL TO POINT TO NE U6I11670
                          B       YM01      RESET BUFR AND BEGIN MODIFY U6I11680
                    YM06  LD    3 MODE-X3   GET MODE                    U6I11690
                          BNZ  I  VRMOD     RETURN IF D MODE            U6I11700
                          LDD   3 DZCON-X3 SET FOR READ                 U6I11710
                          BSI   3 DREAD-X3 BRING IN 1ST SECTOR          U6I11720
                          LD      YPLEN   GET NEW PROG LENGTH SWITCH    U6I11730
                          BSC     Z       SKIP IF NOT SET               U6I11740
                          STO   2 5       STORE NEW PROGRAM LENGTH      U6I11750
                          LD      ZBUF    ADDR OF BUFFER                U6I11760
                          A       ZH01    DISPL FROM BEG OF SCTR        U6I11761
                          A       X7      DB CNT = 8TH WD OF HDR        U6I11762
                          STO     ZH02                                  U6I11763
                          LD    3 DBCNT-X3  GET DISK BLOCK COUNT        U6I11764
                          STO  I  ZH02    UPDATE DISK BLOCK COUNT       U6I11770
                    YM07  LDD   3 DZCON-X3  HAVE TO REPLACE 1ST SECTOR  U6I11780
                          BSI   3 DWRIT-X3  *IN CASE IT WAS UPDATED     U6I11790
                          SLA     16                                    U6I11800
                          STO     YPLEN   CLEAR PROG LENGTH SWITCH      U6I11810
                          STO     VPSW    SWT VERIFY SWITCH             U6I11820
                          B    I  VRMOD   RETURN                        U6I11830
                          SPAC    1                                     U6I11840
                          SPAC    1                                     U6I11850
                    YMLP  DC      *-*     LOOP CONTROL                  U6I11860
                    YPLEN DC      *-*     NEW PROGRAM LENGTH            U6I11870
                    VPSW  DC      *-*     VERIFY PASS SWITCH. 0=VERIFY  U6I11880
                    YMCON BSS  E  0       DISK CONTROLS FOR WRITE       U6I11890
                          DC      320       *DURING MOVE FOR EXPANSION  U6I11900
                          DC      *-*                                   U6I11910
                    ZH01  DC      *-*     ADDR OF 1ST WORD              U6I11920
                    ZH02  DC      *-*     ADDR OF UPDATED DB COUNT      U6I11925
                    DZHLD DC      *-*     1ST SECTOR ADDR(DZCON+1)      U6I11930
                    ZBUF  DC      DAREA                                 U6I11940
                          SPAC    1                                     U6I11950
                    * TEST TO SEE IF WITHIN RANGE                       U6I11960
                    *IF NOT MUST NOT BE VERIFY                          U6I11970
                    *IF RANGE OK - VERIFY ON PASS 1, MODIFY PASS 2      U6I11980
                          SPAC    1                                     U6I11990
                    ZADDR DC      *-*                                   U6I12000
                          LD      ZH01    WDS FROM BEGIN OF SECTOR      U6I12010
                          A       X7                                    U6I12020
                          A       ZBUF                                  U6I12030
                          STO     *+1                                   U6I12040
                          LD   L  *-*     ACC=DISK BLK CT-TOTAL         U6I12050
                          M       Z20                                   U6I12060
                          SLT     16                                    U6I12070
                          S     1 0       SUBTRACT WDS IN PROG          U6I12080
                          BNN     ZA020   IF NON-NEG--WITHIN RANGE      U6I12090
                          STX  L1 EXPSW   TURN ON EXPAND SWITCH         U6I12100
                          LD    1 1       IS IT VERIFY                  U6I12110
                          BNN     ZA030     BR IF NOT VERIFY            U6I12120
                          BSI   3 ERROR-X3                              U6I12130
                          EBC     .34.    VERIFY BEYOND END OF PROGRAM  U6I12140
                    ZA020 EQU     *                                     U6I12150
                          LD    1 1         IS IT VERIFY                U6I12160
                          BNN     ZA030   BR IF NOT VERIFY              U6I12170
                          LD      VPSW    IS IT PASS 1                  U6I12180
                          BNZ     ZA100   NOT PASS 1                    U6I12190
                          BSI     ZAGET   GET SECTOR AND ADDR IN BUF    U6I12200
                          STO     *+1                                   U6I12210
                          LD   L  *-*     LOAD VALUE IN BUF             U6I12220
                          S     1 2         SUB VERIFICATION VALUE      U6I12230
                          BZ      ZA100   VER OK                        U6I12240
                          BSI   3 ERROR-X3                              U6I12250
                          EBC     .21.                                  U6I12260
                    ZA030 EQU     *                                     U6I12270
                          LD      VPSW    IS IT PASS 2                  U6I12280
                          BZ      ZA100   NO                            U6I12290
                          BSI     ZAGET   YES SO MODIFY                 U6I12300
                          STO     ZA040+1                               U6I12310
                          LD    1 2       LOAD NEW AVALUE               U6I12320
                    ZA040 STO  L  *-*     PUT IN BUF                    U6I12330
                          LDD   3 DZCON-X3                              U6I12340
                          BSI   3 DWRIT-X3                              U6I12350
                    ZA100 BSC  I  ZADDR                                 U6I12360
                          SPAC    1                                     U6I12370
                    Z20   DC      20                                    U6I12380
                    X7    DC      7                                     U6I12390
                          SPAC    1                                     U6I12400
                    *THIS ROUTINE READS SECTOR INTO BUFFER AND RETURNS  U6I12410
                    *CORE ADDR IN BUFFER OF WORD TO BE OPERATED ON      U6I12420
                    *VALUE IS RETURNED IN ACC                           U6I12430
                          SPAC    1                                     U6I12440
                    ZAGET DC      *-*                                   U6I12450
                          LD      ZH01      WDS BEYOND BEGIN OF SECTOR  U6I12460
                    *                     THAT PROGRAM STARTS           U6I12470
                          A     1 0       ADD ADDR IN PROG              U6I12480
                          SRT     16                                    U6I12490
                          D       YMCON   DIVIDE BY 320                 U6I12500
                          BZ      SKIP1   IF 0 READ NOT NEEDED          U6I12510
                          A     3 DZCON+1-X3 ADD 1ST SECTOR CT          U6I12520
                          STO   3 DZCON+1-X3                            U6I12530
                          SLT     16                                    U6I12540
                          STO     ZHOLD                                 U6I12550
                          LDD   3 DZCON-X3                              U6I12560
                          BSI   3 DREAD-X3                              U6I12570
                          LD      ZHOLD                                 U6I12580
                          B       SKIP2                                 U6I12590
                    SKIP1 SLT     16                                    U6I12600
                    SKIP2 A       ZBUF                                  U6I12610
                          BSC  I  ZAGET                                 U6I12620
                          SPAC    1                                     U6I12630
                    ZHOLD DC      *-*                                   U6I12640
                    LAC   DC      *-*     LOCATION ASIGNMENT COUNTER    U6I12650
                    YDLUP DC      *-*     LOOP CONTROL                  U6I12660
                    X6000 DC      /6000                            2-12 U6I12670
                          SPAC    1                                     U6I12680
                    YFIND DC      *-*     ENTRY FOR P MODE SEARCH       U6I12690
                          LD      ZH01    PICK UP DISPLACEMENT IN BUFFE U6I12700
                          A       ZBUF    ADD START ADDRESS OF BUFFER   U6I12710
                          STO  L  YGPT    PLACE IN GET POINTER          U6I12720
                          MDX  L  YGPT,2    IGNORE 1ST 3 WDS OF HEADER  U6I12730
                          BSI  L  YGET    GET WORD 3 (NEXT AVAIL ADDR)  U6I12740
                          S     1 0       COMPARE TO DESIRED ADDESS     U6I12750
                          BP      YF005   BRANCH IF IN RANGE            U6I12760
                          LD    1 1                                     U6I12770
                          BN      YF00      BRANCH IF VERIFY            U6I12780
                          MDX  L  VPSW,0  SKIP IF VERIFY PASS           U6I12790
                          B       YF01                                  U6I12800
                          STX  L1 EXPSW   TURN ON EXPAND SWITCH         U6I12810
                          B    I  YFIND   RETURN                        U6I12820
                    YF00  BSI   3 ERROR-X3                              U6I12830
                          EBC     .34.    VERIFY IN BSS OR ORG GAP, OR  U6I12840
                    *                     BEYOND END OF PROGRAM         U6I12850
                    YF005 MDX  L  VPSW,0  SKIP IF VERIFY PASS           U6I12860
                          B       YF01    BRANCH IF MODIFY PASS         U6I12870
                          LD    1 1                                     U6I12880
                          BNN  I  YFIND   RETURN IF NOT VERIFY          U6I12890
                    YF01  MDX  L  YGPT,1  PASS WORD 4                   U6I12900
                          BSI     YGET    GET WORD 5 (LENGTH OF HEADER) U6I12910
                          A       X0003   ADD 3                         U6I12920
                          A       YGPT    ADD TO POINTER TO PASS        U6I12930
                          STO     YGPT      *REST OF PROG HEADER        U6I12940
                          SPAC    1                                     U6I12950
                    * GET DATA HEADER                                   U6I12960
                          SPAC    1                                     U6I12970
                    YF02  BSI     YGET    GET STARTING LOAD ADDRESS     U6I12980
                          STO     LAC     PLACE IN LOC ASIGNMENT COUNTE U6I12990
                          S     1 0       COMPARE TO REQUESTED ADDRESS  U6I13000
                          BNP     YF03    BRANCH IF NOT PAST IT         U6I13010
                          LD    1 1       CHECK FOR VERIFY              U6I13020
                          BN      YF00    BRANCH IF VERIFY              U6I13030
                          BSI   3 ERROR-X3                              U6I13040
                          EBC     .27.    PATCH IN BSS OR ORG GAP       U6I13050
                    YF03  BSI     YGET    GET LENGTH                    U6I13060
                          BZ      YF13    BRANCH IF END                 U6I13070
                          S       YD2     ALLOW FOR DATA HEADER         U6I13080
                          BZ      YF02      BR IF HEADER FOLLOWS   2-12 U6I13082
                          STO     YDLUP   SET LOOP COUNT                U6I13090
                    YF04  BSI     YGET    GET NEXT RELOC WORD           U6I13100
                          STO     YRLOC+1 SAVE RELOC WORD               U6I13110
                          MDX  L  YDLUP,-1 DECREMENT COUNT TO NEXT HEAD U6I13120
                          LD      YGPT                                  U6I13130
                          STO     YPT     SAVE RELOC POINTER            U6I13140
                          LDX   2 16      WORD GROUP COUNT (TIMES 2)    U6I13150
                          SPAC    1                                     U6I13160
                    * SCAN 8 WORD GROUP                                 U6I13170
                          SPAC    1                                     U6I13180
                    YF05  LD      LAC                                   U6I13190
                          S     1 0       COMPARE TO ADDRESS REQUESTED  U6I13200
                          BZ      YF06    BRANCH ON MATCH               U6I13210
                          LDD     YRLOC   GET RELOC BITS                U6I13220
                          SLT     2       BRING OVER NEXT 2             U6I13230
                          STD     YRLOC   REPLACE                       U6I13240
                          AND     X0003   REMOVE ALL BUT 2 WANTED       U6I13250
                          EOR     YD2     COMPARE TO 2                  U6I13260
                          BNZ     *+2     BRANCH IF NOT LIBF            U6I13270
                          MDX  L  LAC,-1  BACK UP LAC IF LIBF           U6I13280
                          NOP                                           U6I13285
                          MDX  L  YGPT,1  PASS NEXT WORD OF TEXT        U6I13290
                          MDX  L  YDLUP,-1                              U6I13300
                          B       *+1     BRANCH IF MORE                U6I13310
                          B       YF02    GET NEXT SECTOR HEXDER        U6I13320
                          MDX  L  LAC,1   STEP LAC                      U6I13330
                          NOP                                           U6I13335
                          MDX   2 -2        DECR COUNT OF WDS IN GROUP  U6I13340
                          B       YF05    EXAMINE NEXT UNTIL OUT        U6I13350
                          B       YF04    GET NEXT RELOC WORD           U6I13360
                          SPAC    1                                     U6I13370
                    YRLOC BSS  E  2       HOLDS RELOCATABILITY WORD     U6I13380
                    X0003 DC      /0003                                 U6I13390
                          SPAC    1                                     U6I13400
                          SPAC    1                                     U6I13430
                    YF06  STX   2 YF11+1  SAVE X2                       U6I13440
                          LDX  L2 DAREA-2 SET X2 FOR READ AND WRITE     U6I13450
                          BSI     YGET GET WORD LOOKED FOR              U6I13460
                          LDD     YRLOC   GET RELOC BITS                U6I13470
                          SLT     2       BRING OVER BITS WANTED        U6I13480
                          STD     YRLOC   REPLACE                       U6I13490
                          AND     X0003   REMOVE UNWANTED BITS          U6I13500
                          EOR     YD2     CHECK FOR LIBF                U6I13510
                          BZ      YF08    BRANCH IF LIBF                U6I13520
                          LD    1 1       GET REQUESTED RELOC           U6I13530
                          AND     X000F   REMOVE VERIFY BIT             U6I13540
                          BZ      YF09    BRANCH IF ABSOLUTE            U6I13550
                          BOD     YF09    BRANCH IF RELOCATABLE OR CALL U6I13560
                          BSI   3 ERROR-X3  ERROR                       U6I13570
                          EBC     .30.    ATTEMPT TO ADD LIBF           U6I13580
                    YF07  BSI   3 ERROR-X3                              U6I13590
                          EBC     .28. ATTEMPT TO CHANGE LIBF           U6I13600
                    YRFBF LD      YGPT    BACK UP  POINTER TO RESET     U6I13610
                          S     3 DZCON-X3  *TO PROPER POSITION IN NEW  U6I13620
                          STO     YGPT      *BUFFER FULL                U6I13630
                          LDX  L2 DAREA-2 SET X2 FOR READ               U6I13640
                          MDX  L  YPRSW,0 SKIP IF PRE WRITE REQUIRED    U6I13650
                          B       YG015   BRANCH IF NOT                 U6I13660
                          LDD   3 DZCON-X3                              U6I13670
                          BSI   3 DWRIT-X3 WRITE OUT OLD SECTOR         U6I13680
                    YG015 MDX  L  DZCON+1,2 STEP SECTOR ADDRESS         U6I13690
                          LDD   3 DZCON-X3 SET FOR READ                 U6I13700
                          BSI   3 DREAD-X3 READ NEXT 2 SECTORS          U6I13710
                          B       YG01    RETURN                        U6I13720
                          SPAC    1                                     U6I13730
                    YGET  DC      *-*     ENTRY TO GET NEXT WORD        U6I13740
                          LD      YGPT    GET POINTER                   U6I13750
                          A       YD1     STEP POINTER                  U6I13760
                          STO     YGPT    REPLACE POINTER               U6I13770
                          S       DENDA   COMPARE TO END OF BUFFER      U6I13780
                          BP      YRFBF     BR AND REFILL IF OUT OF BFR U6I13790
                    YG01  LD   L  *-*     GET WORD                      U6I13800
                    YGPT  EQU     *-1     POINTER                       U6I13810
                          B    I  YGET    RETURN                        U6I13820
                          SPAC    1                                     U6I13830
                    * CHECK FOR 2ND WORD OF LIBF AND EITHER BOTH LIBF   U6I13835
                    * OR NEITHER LIBF                                   U6I13836
                    YF08  LD    1 1       GET RELOC REQUEST             U6I13840
                          BN      YF092     BR IF VERIFY                U6I13850
                          BZ      YF07      BR IF ABSOLUTE              U6I13860
                          BOD     YF07    BRANCH IF RELOC OR CALL       U6I13870
                          SLA     13      CHECK FOR 2ND WORD LIBF       U6I13880
                          BNN     YF09    BRANCH IF NOT 2ND WORD LIBF   U6I13890
                    YF085 BSI     YGET    GET 2ND WORD LIBF             U6I13900
                          LD      YF11+1    LOAD SHIFT COUNT AND   2-10 U6I13902
                          EOR     YD3       *CHECK FOR LIBF SPLIT  2-10 U6I13904
                    *                       *OVER INDICATOR WORD   2-10 U6I13906
                          BZ      YF087     BRANCH IF TRUE.        2-10 U6I13908
                          LDD     YRLOC   GET RELOC BITS                U6I13910
                          SLT     2       BRING OVER NEXT 2             U6I13920
                          STD     YRLOC   REPLACE                       U6I13930
                    YF087 MDX  L  YF11+1,-2 DECREMENT SHIFT COUNT. 2-10 U6I13931
                          B       YF09    BR IF IN SAME GROUP           U6I13932
                          STO     YRLOC+1 HOLD NEW RELOC WORD           U6I13933
                          MDX  L  YF11+1,18  RESET SHIFT COUNT          U6I13934
                          B       YF085   GO GET NEXT WORD              U6I13935
                    YF09  LD    1 1                                     U6I13940
                          BNN     YF10    BRANCH IF NOT VERIFY          U6I13950
                    YF092 LD   I  YGPT    GET WORD FOUND                U6I13960
                          EOR   1 2       COMPARE TO DESIRED            U6I13970
                          BZ   I  YFIND   LEAVE IF MATCH                U6I13980
                    YF095 BSI   3 ERROR-X3  ERROR                       U6I13990
                          EBC     .21.                                  U6I14000
                          SPAC    1                                     U6I14010
                    DENDA DC      DAREA+639 END OF DAREA                U6I14020
                    YD1   DC      1       CONSTANT                      U6I14030
                    X000F DC      /000F                                 U6I14040
                    XFFFC DC      /FFFC                                 U6I14050
                    YD2   DC      2       CONSTANT 2                    U6I14060
                    YD3   DC      /0012     USE WITH SPLIT LIBF CK 2-10 U6I14065
                    YPT   DC      *-*     RELOC POINTER                 U6I14070
                          SPAC    1                                     U6I14080
                    YF10  LD    1 2       GET NEW WORD                  U6I14090
                          STO  I  YGPT    PLACE IN BUFFER               U6I14100
                          LD      YGPT    BUFFER ADDR OF DATA WORD      U6I14110
                          S       YPT     BUFFER ADDR OF RELOC WORD     U6I14120
                          BP      YF11    BRANCH IF BOTH IN SAME        U6I14130
                          LDD   3 DZCON-X3 SET FOR WRITE                U6I14140
                          BSI   3 DWRIT-X3 WRITE OUT BUFFER             U6I14150
                          MDX  L  DZCON+1,-2 BACK UP TO PREVIOUS SECTOR U6I14160
                          LDD   3 DZCON-X3 SET FOR READ                 U6I14170
                          BSI   3 DREAD-X3 BRING IN PREVIOUS BUFFER     U6I14180
                    YF11  LDX  L2 *-*     RESTORE X2                    U6I14190
                          LD    1 1       GET REQUESTED RELOC           U6I14200
                          AND     X0003   REMOVE ALL BUT NEW RELOC BITS U6I14210
                          STO   1 1       REPLACE                       U6I14220
                          LDD     YRLOC   GET OLD RELOC                 U6I14230
                          AND     XFFFC   REMOVE BITS BEING REPLACED    U6I14240
                          OR    1 1       ADD NEW BITS                  U6I14250
                          MDX   2 -2                                    U6I14260
                          SLT   2 0       REPOSITION IN ACC             U6I14270
                          STO  I  YPT     PLACE IN BUFFER               U6I14280
                    YF12  LDX  L2 DAREA-2 SET X2 FOR WRITE              U6I14290
                          LDD   3 DZCON-X3  SET FOR WRITE               U6I14300
                          BSI   3 DWRIT-X3 WRITE OUT BUFFER             U6I14310
                          B    I  YFIND                                 U6I14320
                          SPAC    1                                     U6I14330
                    * FOR EXPANSION                                     U6I14340
                          SPAC    1                                     U6I14350
                    YF13  STO     YPRSW   SET FORCE REWRITE SWITCH ON   U6I14360
                          LD      YGPT      CALCULATE PROGRAM WORDS     U6I14370
                          S    L  ZBUF      *IN BUFFER                  U6I14380
                          SRT     16      POSITION FOR DIVIDE           U6I14390
                          D    L  Z20     DIVIDE BY WORDS PER BLOCK     U6I14400
                          SLT     16      BRING OVER                    U6I14410
                          S       YD16    COMPARE TO 16                 U6I14420
                          BNP     *+2     BRANCH IF ENOUGH ROOM IN LAST U6I14430
                          MDX  L  DBCNT,1   STEP DISK BLOCK COUNT       U6I14440
                          MDX  L  YGPT,-1 BACK UP POINTER               U6I14450
                          LD      YGPT    NEED TO BACK UP ONE WORD,     U6I14460
                          S    L  ZBUF      *MAKE SURE IT IS IN BUFFER  U6I14470
                          BNN     YF14    BRANCH OK                     U6I14480
                          MDX  L  DZCON+1,-2 BACK UP SECTOR ADDRESS     U6I14490
                          LDX  L2 DAREA-2 SET FOR READ                  U6I14500
                          LDD   3 DZCON-X3                              U6I14510
                          BSI   3 DREAD-X3 READ IN OLD SECTORS          U6I14520
                          LD      DENDA   SET TO END                    U6I14530
                          STO     YGPT      *OF BUFFER                  U6I14540
                    YF14  LD    1 0       GET REQUESTED ADDRESS         U6I14550
                          STO  I  YGPT    STORE IT IN DATA HEADER       U6I14560
                          BSI     YGET    SET TO NEXT WORD              U6I14570
                          LD      YD1                                   U6I14580
                          S     1 1       NEGATIVE IF CALL OR LIBF      U6I14590
                          SLA     1         TURN ON CARRY IF CALL/LIBF  U6I14600
                          LD      YD4     GET WORD COUNT                U6I14610
                          BSC     C                                     U6I14620
                          A       YD1     INCREASE BY 1 IF LIBF OR CALL U6I14630
                          STO  I  YGPT    STORE IT IN DATA HEADER       U6I14640
                          BSI     YGET    SET TO NEXT WORD              U6I14650
                          LD      YD1                                   U6I14660
                          S     1 1       NEGATIVE IF LIBF OR CALL      U6I14670
                          BN      YF17    BRANCH IF LIBF OR CALL        U6I14680
                          LD    1 1       GET RELOCATABILITY            U6I14690
                          SLA     14      POSITION IT                   U6I14700
                          STO  I  YGPT    STORE IT                      U6I14710
                          BSI  L  YGET    SET TO NEXT                   U6I14720
                    YF15  LD    1 2       GET DATA WORD                 U6I14730
                    YF16  STO  I  YGPT    STORE IT                      U6I14740
                          BSI  L  YGET    SET TO NEXT WORD              U6I14750
                          LD    1 0       GET ADDRESS                   U6I14760
                          A       YD1     STEP BY ONE                   U6I14770
                          STO  I  YGPT    STORE IT                      U6I14780
                          STO  L  YPLEN   SAVE FOR NEW PROGRAM LENGTH   U6I14790
                          BSI  L  YGET    SET TO NEXT                   U6I14800
                          SLA     16      CLEAR ACC                     U6I14810
                          STO  I  YGPT    SET END DATA HEADER           U6I14820
                          STX   1 YPRSW   SET SWITCH OFF                U6I14830
                    * CALCULATE NEW DISK BLOCK COUNT                    U6I14840
                          LD    3 DZCON+1-X3  START WITH PRESENT SECTOR U6I14850
                          S    L  DZHLD     *ADDRESS, SUBTRACT PROGRAM  U6I14860
                    *                       *STARTING SECTOR ADDRESS    U6I14870
                          M       YD320     BY WORDS PER SECTOR         U6I14880
                          SLT     16        BRING THEM OVER             U6I14890
                          A    L  YGPT      ADD PRESENT POINTER         U6I14900
                          S    L  ZBUF      SUBTRACT BUFFER ADDRESS     U6I14910
                    *                       NOW HAVE TOTAL WORDS        U6I14920
                          SRT     16        POSITION FOR DIVIDE         U6I14930
                          D       YD20      CONVERT TO SECTOR BLOCKS    U6I14940
                          A       YD1                                   U6I14945
                          STO   3 DBCNT-X3  UPDATE SECTOR BLOCK COUNT   U6I14950
                          B       YF12    WRITE AND RETURN              U6I14960
                          SPAC    1                                     U6I14970
                    YD16  DC      16      CONSTANT                      U6I14980
                    YD18  DC      18                                    U6I14990
                    YD20  DC      20                                    U6I15000
                    YD320 DC      320                                   U6I15010
                    YD4   DC      4       CONSTANT                      U6I15020
                    YPRSW DC      1       FORCE WRITE BEFORE READ IF 0  U6I15030
                    YF17  LD    1 1       GET RELOCATABILITY            U6I15040
                          SRT     16      PLACE 1ST RELOC IN EXT        U6I15050
                          LD    1 4       GET 2ND                       U6I15060
                          AND  L  X0003   REMOVE BIT 13 IN CASE 2ND IN  U6I15070
                          S       YD2       *LIBF                       U6I15080
                          STO     YHOLD   SAVE FOR LATER BRANCHES       U6I15090
                          BSC     +Z      SKIP IF 2ND RELOC IS 2 OR 3   U6I15100
                          LD    1 4       GET 2ND RELOC                 U6I15110
                          SLA     14      POSITION 2ND RELOC OR 0 IF    U6I15120
                    *                     INVALID                       U6I15130
                          RTE     2       BRING OVER 1ST                U6I15140
                          STO  I  YGPT    STORE RELOC                   U6I15150
                          BSI  L  YGET    MAKE SURE NEXT WORD IS IN BUF U6I15160
                          LD    1 2       GET 1ST WORD TO MODIFY        U6I15170
                          STO  I  YGPT    STORE 1ST WORD                U6I15180
                          BSI  L  YGET    MAKE SURE NEXT WORD IS IN BUF U6I15190
                          LD      YHOLD   NEGATIVE IF VALID             U6I15200
                          SRA     1       ZERO IF 2ND RELOC INVALID     U6I15210
                          BZ      YF16    BRANCH IF 2ND RELOC INVALID   U6I15220
                          MDX   1 3       POINT TO NEXT STRING ITEM     U6I15230
                          B       YF15                                  U6I15240
                    YHOLD DC      *-*     NON-NEGATIVE IF 2ND RELOC INV U6I15250
                          EJCT                                          U6I15260
                    *************************************************** U6I15270
                    *  CVXB4  *  CONVERT UNPACKED-EBCDIC TO BINARY    * U6I15280
                    *************************************************** U6I15290
                    *                                                 * U6I15300
                    *INPUT -- ARGUMENT=ADDR(LEFTMOST OF 4 EBCDIC CHARS* U6I15310
                    *                                                 * U6I15320
                    *OUTPUT -- 16-BIT BINARY IN ACC                   * U6I15330
                    *                                                 * U6I15340
                    *EXTERNAL REFERENCES -- NONE                      * U6I15350
                    *                                                 * U6I15360
                    *ERRORS -- EBCDIC CHAR NOT IN SET (0-9 A-F)       * U6I15370
                    *                                                 * U6I15380
                    *RETURN -- 1. TO BSI+2 IF VALID                   * U6I15390
                    *          2. TO BSI+3 IF ERROR                   * U6I15400
                    *                                                 * U6I15410
                    *NOTES -- X2 IS SAVED/RESTORED                    * U6I15420
                    *         X1 AND X3 ARE NOT USED                  * U6I15430
                    *         ACC/EXT/STATUS ARE NOT SAVED RESTORED   * U6I15440
                    *                                                 * U6I15450
                    *************************************************** U6I15460
                          SPAC    2                                     U6I15470
                    * INITIALIZATION                                    U6I15480
                          SPAC    1                                     U6I15490
                    CI001 STX   2 CI092+1   SAVE INDEX 2                U6I15500
                          LD   I  CVXB4     ACC=ADDR(EBCDIC FIELD)      U6I15510
                          S       CI101     SUBTRACT 1                  U6I15520
                          STO     CI003+1   SET INTO LOAD INSTR         U6I15530
                          LDX   2 +4        XR2=LENGTH OF EBCDIC        U6I15540
                          MDX  L  CVXB4,+1  SET RETURN ADDRESS          U6I15550
                          SPAC    1                                     U6I15560
                    * CONVERSION LOOP--PER INPUT CHARACTER              U6I15570
                          SPAC    1                                     U6I15580
                    CI003 LD   L2 *-*       GET INPUT CHAR (R TO L)     U6I15590
                          A       CI100     ADD /FF10                   U6I15600
                          BSC  L  CI010,C   BR IF CARRY--F0-FF          U6I15610
                          A       CI12F     ADD /002F--SHOULD CARRY     U6I15620
                          BSC  L  *+3,C     BR IF CARRY--C1-EF          U6I15630
                          SPAC    1                                     U6I15640
                    * ERROR--SET RETURN ADDR FOR ERROR RETURN           U6I15650
                          SPAC    1                                     U6I15660
                    CI095 MDX  L  CVXB4,+1  SET FOR ERROR RETURN        U6I15670
                          MDX     CI092     GO START THE RETURN         U6I15680
                          SPAC    1                                     U6I15690
                    * CONTINUE NORMAL PROCESSING                        U6I15700
                          SPAC    1                                     U6I15710
                          A       CI110     ADD /000A                   U6I15720
                          STO     CI200     SAVE CUR REPRESENTATION     U6I15730
                          S       CI115     SUBTRACT /000F              U6I15740
                          BSC  L  CI095,-Z  BR TO ERR IF NOT C1-C6      U6I15750
                          MDX     CI020     IS C1-C6--GO TO COMN ROUT   U6I15760
                          SPAC    1                                     U6I15770
                    CI010 STO     CI200     SAVE CUR REPRESENTATION     U6I15780
                          S       CI110     SUBTRACT /000A              U6I15790
                          BSC  L  CI095,-   BR TO ERR IF NOT F0-F9      U6I15800
                          SPAC    1                                     U6I15810
                    CI020 LD      CI200     RETRIEVE REPRESENTATION     U6I15820
                          SRT     4         SHIFT TO EXTENSION          U6I15830
                          MDX   2 -1        DECR POINTER/COUNT          U6I15840
                          MDX     CI003     BR IF NOT EXHAUSTED         U6I15850
                          SPAC    1                                     U6I15860
                    * RETURN                                            U6I15870
                          SPAC    1                                     U6I15880
                          SLT     16        PUT INTO ACC                U6I15890
                    CI092 LDX  L2 *-*       RESTORE XR2                 U6I15900
                          BSC  I  CVXB4     RETURN TO CALLER            U6I15910
                          SPAC    1                                     U6I15920
                    * CONSTANTS AND WORKSPACE                           U6I15930
                          SPAC    1                                     U6I15940
                    CI100 DC      /FF10     TO FORCE F-ZONE TO CARRY    U6I15950
                    CI101 DC      1         CONSTANT 1                  U6I15960
                    CI12F DC      /002F     FORCE C-ZONE TO CARRY       U6I15970
                    CI110 DC      /000A     CONSTANT 10                 U6I15980
                    CI115 DC      /000F     CONSTANT 15                 U6I15990
                    CI200 DC      *-*       HOLD CUR REPRESENTATION     U6I16000
                          EJCT                                          U6I16010
                    *************************************************** U6I16020
                    *  TSTBL  *  TEST A FIELD FOR ALL BLANKS          * U6I16030
                    *************************************************** U6I16040
                    *                                                 * U6I16050
                    *INPUT -- XR1=NEG WORD COUNT, ARG=ADDR RIGHT+1    * U6I16060
                    *                                                 * U6I16070
                    *OUTPUT -- NONE                                   * U6I16080
                    *                                                 * U6I16090
                    *EXTERNAL REFERENCES -- NONE                      * U6I16100
                    *                                                 * U6I16110
                    *RETURN -- 1. TO BSI+2 IF ALL BLANK               * U6I16120
                    *          2. TO BSI+3 IF NOT ALL BLANK           * U6I16130
                    *                                                 * U6I16140
                    *ERRORS -- NONE                                   * U6I16150
                    *                                                 * U6I16160
                    *NOTES -- X1 IS SAVED/RESTORED                    * U6I16170
                    *         X2 AND X3 ARE NOT USED                  * U6I16180
                    *         ACC/EXT/STATUS ARE NOT SAVED/RESTORED   * U6I16190
                    *                                                 * U6I16200
                    *************************************************** U6I16210
                          SPAC    1                                     U6I16220
                    * INITIALIZATION                                    U6I16230
                          SPAC    1                                     U6I16240
                    TB001 STX   1 TB091+1   SAVE INDEX 1                U6I16250
                          LD   I  TSTBL     ACC=ADDR(RIGHTMOST+1)       U6I16260
                          STO     TB010+1   SET LOAD INSTR              U6I16270
                          MDX  L  TSTBL,+1  SET NORMAL RETURN           U6I16280
                          SPAC    1                                     U6I16290
                    * LOOP--ONCE PER CHARACTER                          U6I16300
                          SPAC    1                                     U6I16310
                    TB010 LD   L1 *-*       GET CHARACTER               U6I16320
                          EOR     TB140     COMPARE TO BLANK            U6I16330
                          BSC  L  TB050,Z   BR IF *NOT* BLANK           U6I16340
                          MDX   1 +1        INCREMENT INDEX POINTER     U6I16350
                          MDX     TB010     BR IF NOT EXHAUSTED         U6I16360
                          SPAC    1                                     U6I16370
                    * RETURN                                            U6I16380
                          SPAC    1                                     U6I16390
                    TB091 LDX  L1 *-*       RESTORE INDEX 1             U6I16400
                          BSC  I  TSTBL     RETURN TO CALLER            U6I16410
                          SPAC    1                                     U6I16420
                    * NON-BLANK CHAR ENCOUNTERED                        U6I16430
                          SPAC    1                                     U6I16440
                    TB050 MDX  L  TSTBL,+1  SET FOR NON-BLANK RETURN    U6I16450
                          MDX     TB091     START THE RETURN            U6I16460
                          SPAC    1                                     U6I16470
                    * CONSTANT                                          U6I16480
                          SPAC    1                                     U6I16490
                    TB140 DC      /0040     CONSTANT BLANK              U6I16500
                          EJCT                                          U6I16510
                    *************************************************** U6I16520
                    *  GTREC ROUTINE -- READ INPUT RECORD FROM PRDR   * U6I16530
                    *************************************************** U6I16540
                          SPAC    1                                     U6I16550
                    * READ AND DO STRICT CONVERSION                     U6I16560
                          SPAC    1                                     U6I16570
                    GR001 EQU     *                                     U6I16580
                          MDX  L  $KCSW,0   TEST IF TYP IN FORCE        U6I16590
                          MDX     *+6       SKIP LAST CARD TEST IF TYP  U6I16600
                          LD   L  $LAST     GET LAST CD INDIC           U6I16610
                          BSC  L  *+2,+-    BR IF NOT EOF               U6I16620
                          BSI   3 ERROR-X3  EOF--INVOKE ERROR           U6I16630
                          EBC     .04.      ERROR 4                     U6I16640
                          LDD     GR100      INPUT LIST OF ARGS         U6I16650
                          BSI  L  CD000+1    INVOKE INPUT ROUTINE       U6I16660
                          MDX  L  $IBSY,0    WAIT FOR                   U6I16670
                          MDX     *-3       *COMPLETION                 U6I16680
                          LD   L  PIODV     BR IF I/O FROM              U6I16690
                          BN      GR005     *P/T OR TYP                 U6I16700
                          LD      GR100+1   POINTER TO CARD AREA        U6I16710
                          BSI  L  CVHEB   CONVERT TO EBC IF FROM CARD   U6I16720
                    GR005 MDX  L  $CTSW,0   SKIP IF NOT MCR             U6I16730
                          MDX     GR009      MCR ENCOUNTERED--ERROR     U6I16740
                          BSC  I  GTREC      RETURN TO CALLER           U6I16750
                          SPAC    1                                     U6I16760
                    * MONITOR CONTROL REC ENCOUNTERED                   U6I16770
                          SPAC    1                                     U6I16780
                    GR009 BSI   3 ERROR-X3   INVOKE ERROR               U6I16790
                          EBC     .05.      ARGUMENT FOR ERROR 5        U6I16800
                          SPAC    1                                     U6I16810
                    * ARGUMENT LIST                                     U6I16820
                          BSS  E  0                                     U6I16830
                    GR100 DC      /7002     READ (WITH CONVERSION)      U6I16840
                          DC      CAREA-1                               U6I16850
                          EJCT                                          U6I16860
                    LETSR DC      *-*       ENTRY POINT                 U6I16870
                          SPAC    1                                     U6I16880
                    *************************************************** U6I16890
                    *  LETSR  *  SEARCH LET/FLET FOR PROGRAM/FILE     * U6I16900
                    *************************************************** U6I16910
                    *                                                 * U6I16920
                    *INPUT --  X1=ADDR(SAD OF LET--WITH DRIVE CODE)   * U6I16930
                    *          ACC/EXT=NAMECODE ITEM (BITS0-1=00)     * U6I16940
                    *          IN-LINE ARG=ADDR OF 322-WORD AREA ON   * U6I16950
                    *             EVEN BOUNDARY TO USE AS BUFFER      * U6I16960
                    *                                                 * U6I16970
                    *OUTPUT -- ACC=ZERO IF ITEM NOT FOUND, OR         * U6I16980
                    *             DISK-BLOCK COUNT IF ITEM WAS FOUND  * U6I16990
                    *          EXT=DISK-BLOCK ADDR OF FOUND ITEM      * U6I17000
                    *          STATUS=00 FOR DSF OR NOT-FOUND         * U6I17010
                    *                 01 FOR SECONDARY ENTRY POINT    * U6I17020
                    *                 10 FOR CORE-IMAGE PROGRAM       * U6I17030
                    *                 11 FOR DATA-FILE                * U6I17040
                    *                                                 * U6I17050
                    *EXTERNAL REFERENCES--                            * U6I17060
                    *          DZ000 -- ENTRY FOR DISKZ               * U6I17070
                    *          $DBSY -- DISK-BUSY INDICATOR           * U6I17080
                    *                                                 * U6I17090
                    *RETURN -- ALWAYS TO ARGUMENT+1                   * U6I17100
                    *                                                 * U6I17110
                    *NOTES --  X1/X2 ARE SAVED/RESTORED               * U6I17120
                    *          X3 IS NOT USED                         * U6I17130
                    *          ACC/EXT/STATUS ARE SET BY THE ROUTINE  * U6I17140
                    *                                                 * U6I17150
                    *************************************************** U6I17160
                          SPAC    1                                     U6I17170
                    * INITIALIZATION                                    U6I17180
                          SPAC    1                                     U6I17190
                    LS001 STD     LS500      SAVE THE NAMECODE          U6I17200
                          STX   1 LS091+1    SAVE INDEX 1               U6I17210
                          STX   2 LS092+1    SAVE INDEX 2               U6I17220
                          LD    1 0          ACC=DRIVECODE/SAD          U6I17230
                          SRT     12         ACC=DRCODE, EXT=SAD        U6I17240
                          SLA     12         DRCODE IN BITS 0-4         U6I17250
                          STO     LS104      SAVE DRIVECODE             U6I17260
                          SRA     12         DRCODE ADJACENT TO SAD     U6I17270
                          SRT     4          EXT=DRCODE/SAD             U6I17280
                          LD   I  LETSR      ACC=ADDR(BUFFER)           U6I17290
                          MDX  L  LETSR,+1   UPDATE FOR RETURN          U6I17300
                          STO     LS200+1    ADDR(BUFFER) TO RDLIST     U6I17310
                          LDX  I1 LS200+1    SET X1 NOW=ADDR(BUF)       U6I17320
                          LD      LS320      CONSTANT 320               U6I17330
                          STD   1 0          SET UP DCTL FIELD          U6I17340
                          BSI     LS900      DO UNOVERLAPPED READ       U6I17350
                          LD    1 3          ACC=SAD(UA)                U6I17360
                          SLA     4          MAKE INTO DISK BLK ADDR    U6I17370
                          STO     LS658      INITIALIZE DBADR           U6I17380
                          MDX     *+1        SKIP TO PROCESS FIRST SECT U6I17390
                          SPAC    1                                     U6I17400
                    * SEARCH A SECTOR OF LET/FLET                       U6I17410
                          SPAC    1                                     U6I17420
                    LS010 BSI     LS900      DO UNOVERLAPPED READ       U6I17430
                          LDX   2 105        X2=NUMBER OF ENTRIES/SECTR U6I17440
                    LS020 LD    1 8          SECOND WORD OF NAME        U6I17450
                          SRT     16         PUT INTO EXT               U6I17460
                          LD    1 7          FIRST WORD OF NAME         U6I17470
                          SD      LS500      SUBTRACT DESIRED NAME      U6I17480
                          SLA     2         REMOVE TYPE-BITS            U6I17490
                          BSC     +-                                    U6I17500
                          SLT     16                                    U6I17510
                          BSC  L  LS077,+-   BR IF EQUAL                U6I17520
                          LD      LS658      GET CURRENT DBADR          U6I17530
                          A     1 9          ADD NEW DBCNT              U6I17540
                          STO     LS658      UPDATED DBADR              U6I17550
                          MDX   1 +3         UPDATE LET POINTER         U6I17560
                          MDX   2 -1         REDUCE COUNT               U6I17570
                          MDX     LS020     BR IF IN SAME SECTOR        U6I17580
                          SPAC    1                                     U6I17590
                    * MUST GO TO A NEW SECTOR                           U6I17600
                          SPAC    1                                     U6I17610
                    LS015 LDX  I1 LS200+1    X1=ADDR(BUFFER)            U6I17620
                          LD    1 6          ACC=SAD(NEXT LET SECTOR)   U6I17630
                          OR      LS104      OR IN THE DRIVE CODE       U6I17640
                          STO   1 1          STORE INTO DCTL            U6I17650
                          SLA     4          GET RID OF DRIVE CODE      U6I17660
                          BSC     Z          SKIP IF *NO* NEXT SECTOR   U6I17670
                          MDX     LS010      BR TO PROCESS NEW SECTOR   U6I17680
                          SPAC    1                                     U6I17690
                    * FILE/PROGRAM WAS NOT FOUND AT ALL                 U6I17700
                          SPAC    1                                     U6I17710
                          SLT     32         CLEAR ACC/EXT              U6I17720
                    LS202 LDS     0          SET STATUS = ZERO          U6I17730
                          MDX     LS091      GO START THE RETURN        U6I17740
                          SPAC    1                                     U6I17750
                    * FILE/PROGRAM WAS FOUND                            U6I17760
                          SPAC    1                                     U6I17770
                    LS077 LD    1 7          FIRST WORD OF NAME AGAIN   U6I17780
                          SRA     14         PREFIX TO ACC BITS 14-15   U6I17790
                          OR      LS202      MAKE AN LDS INSTR          U6I17800
                          STO     LS090      STORE IN INSRT SEQ         U6I17810
                          LD      LS658      GET THE DB ADR             U6I17820
                          SRT     16         EXT=DBADR                  U6I17830
                          LD    1 9          ACC=DBCNT                  U6I17840
                          LDS     1         SET FOR SECONDARY ENTRY PT  U6I17850
                          BSC     Z         SKIP IF *YES* SEC ENTRY PT  U6I17860
                    LS090 LDS     0          MODIFIED AS APPROP         U6I17870
                    LS091 LDX  L1 *-*        RESTORE X1                 U6I17880
                    LS092 LDX  L2 *-*        RESTORE INDEX  2           U6I17890
                    LS099 BSC  I  LETSR      RETURN TO CALLER           U6I17900
                          SPAC    1                                     U6I17910
                    * CONSTANTS AND WORKSPACE                           U6I17920
                          SPAC    1                                     U6I17930
                          BSS  E  0                                     U6I17940
                    LS500 BSS     2          HOLD NAMECDE ITEM          U6I17950
                    LS200 DC      0          INDICATE READ              U6I17960
                          DC      *-*        SECOND HALF OF RDLIST      U6I17970
                    LS104 DC      *-*        HOLD DRIVE CODE            U6I17980
                    LS320 DC      320        CONSTANT 320               U6I17990
                    LS658 DC      *-*        HOLD RUNNING DBADR         U6I18000
                          SPAC    1                                     U6I18010
                    * UNOVERLAPPED DISK READ SERVICE ROUTINE            U6I18020
                          SPAC    1                                     U6I18030
                    LS900 DC      *-*        ENTRY                      U6I18040
                          LDD     LS200      READLIST                   U6I18050
                          BSI  L  DZ000      INVOKE DISKZ TO READ       U6I18060
                          MDX  L  $DBSY,0    DWELL UNTIL                U6I18070
                          MDX     *-3       *READ COMPLETE              U6I18080
                          BSC  I  LS900      RETURN TO CALLER           U6I18090
                          SPAC    1                                     U6I18100
                          EJCT                                          U6I18110
                    CVEBN DC      *-*       ENTRY POINT                 U6I18120
                          SPAC    1                                     U6I18130
                    *************************************************** U6I18140
                    *  CVEBN  *  CONVERT SINGLE-EBCDIC TO NAMECODE    * U6I18150
                    *************************************************** U6I18160
                    *                                                 * U6I18170
                    *INPUT -- ARG 0 = LENGTH, ARG 1 = ADDR(EBCDIC)    * U6I18180
                    *                                                 * U6I18190
                    *OUTPUT -- NAMECODE ITEM (PREFIX 00) IN ACC/EXT   * U6I18200
                    *                                                 * U6I18210
                    *EXTERNAL REFERENCES -- NONE                      * U6I18220
                    *                                                 * U6I18230
                    *ERRORS -- 1. LENGTH LT 1 OR GT 5                 * U6I18240
                    *          2. ANY CHAR NOT OF SET (A-Z $ # @ 0-9) * U6I18250
                    *          3. FIRST CHAR NOT OF SET (A-Z $ # @)   * U6I18260
                    *                                                 * U6I18270
                    *RETURN -- 1. TO BSI+3 IF VALID                   * U6I18280
                    *          2. TO BSI+4 IF ERROR                   * U6I18290
                    *                                                 * U6I18300
                    *NOTES --  X1 AND X2 ARE SAVED/RESTORED           * U6I18310
                    *          X3 IS NOT USED                         * U6I18320
                    *          ACC/EXT/STAT ARE NOT SAVED/RESTORED    * U6I18330
                    *                                                 * U6I18340
                    *************************************************** U6I18350
                          SPAC    1                                     U6I18360
                    * INITIALIZATION                                    U6I18370
                          SPAC    1                                     U6I18380
                    CN001 STX   1 CN091+1    SAVE INDEX 1               U6I18390
                          STX   2 CN092+1    SAVE INDEX 2               U6I18400
                          LDX  I1 CVEBN      X1=ADDR(ARGLIST)           U6I18410
                          LD    1 1          ADDR(EBCDIC)               U6I18420
                          S       CN101      ADDR(EBCDIC)-1             U6I18430
                          STO     CN003+1    SET INTO LOAD INSTR        U6I18440
                          LD    1 0          ACC=LENGTH                 U6I18450
                          STO     *+1                                   U6I18460
                          LDX  L2 *-*        X2=LENGTH                  U6I18470
                          MDX   1 +2         X1=ADDR(NORMAL RETURN)     U6I18480
                          STX   1 CN099+1    SET RETURN INSTR           U6I18490
                          BSC  L  CN095,+    BR TO ERR IF LENGTH LT 1   U6I18500
                          S       CN105      LENGTH - 5                 U6I18510
                          BSC  L  CN095,-Z   BR TO ERR IF LENGTH GT 5   U6I18520
                          SLT     32         ACC/EXT = 0                U6I18530
                          SPAC    1                                     U6I18540
                    * CONVERSION LOOP -- PER INPUT CHARACTER            U6I18550
                          SPAC    1                                     U6I18560
                    CN002 SRT     6          SHIFT CUR NAMECODE VALUE   U6I18570
                          STD     CN205     *AND SAVE IT                U6I18580
                          SLT     16         ASSURE EXT = 0             U6I18590
                    CN003 LD   L2 *-*        GET INPUT CHARACTER        U6I18600
                          SLA     9          EBCDIC BIT 0 TO CARRY      U6I18610
                          BSC  L  CN095,-    BR TO ERR IF 00-3F, 80-BF  U6I18620
                          STO     CN110      SAVE 7-BIT CHAR            U6I18630
                          BSC  L  CN050,C    BR IF CARRY--C0-FF         U6I18640
                          SPAC    1                                     U6I18650
                    * CHAR IS IN RANGE 40-7F                            U6I18660
                          SPAC    1                                     U6I18670
                          SLA     1          RETAIN 6 BITS ONLY         U6I18680
                          BSC     +-         SKIP UNLESS BLANK          U6I18690
                          OR      CN205      BLANK--OR PREV CHARS       U6I18700
                          BSC     Z          SKIP IF NO PREV--ELSE ERR  U6I18710
                          EOR     CN15B      IS IT DOLLAR               U6I18720
                          BSC     Z          SKIP IF MATCH              U6I18730
                          EOR     CN17B      IS IT POUND SIGN           U6I18740
                          BSC     Z          SKIP IF MATCH              U6I18750
                          EOR     CN17C      IS IT AT-SIGN              U6I18760
                          BSC  L  CN095,Z    BR TO ERR IF NONE OF ABOVE U6I18770
                          MDX     CN080      FOUND--GO TO COMMON ROUT   U6I18780
                          SPAC    1                                     U6I18790
                    * CHAR IS IN THE RANGE C0-FF                        U6I18800
                          SPAC    1                                     U6I18810
                    CN050 SLA     2          RETAIN 5 BITS AND CARRY    U6I18820
                          BSC  L  CN055,C    BR IF IN RANGE E0-FF       U6I18830
                    CN060 SLA     1          RANGE C0-DF--RETAIN DIGIT  U6I18840
                          BSC  L  CN095,+-   BR TO ERR IF DIGIT ZERO    U6I18850
                    CN070 A       CN160     ADD /6000--SHOULD NOT CARE  U6I18860
                          BSC  L  CN095,C    BR TO ERR IF DIGIT A-F     U6I18870
                          SPAC    1                                     U6I18880
                    * COMMON COMPLETION OF CONVERSION OF AN INPUT CHAR  U6I18890
                          SPAC    1                                     U6I18900
                    CN080 LD      CN110      GET OLD 7-BIT CHAR         U6I18910
                          SLA     1          GET RID OF TOP BIT         U6I18920
                          SRA     2          BITS 0-1=0, BITS 2-7=CHAR  U6I18930
                          AD      CN205      ADD PREV NAMECODE VALUE    U6I18940
                          MDX   2 -1         DECR LOOP COUNTER          U6I18950
                          MDX     CN002      BR BACK IF NOT EXHAUSTED   U6I18960
                          BSC  L  CN095,+-  BRANCH IF BLANK NAME        U6I18965
                          SPAC    1                                     U6I18970
                    * RETURN                                            U6I18980
                          SPAC    1                                     U6I18990
                    CN091 LDX  L1 *-*        RESTORE INDEX 1            U6I19000
                    CN092 LDX  L2 *-*        RESTORE INDEX 2            U6I19010
                    CN099 BSC  L  *-*        RETURN TO CALLER           U6I19020
                          SPAC    1                                     U6I19030
                    * SPECIAL HANDLING FOR CHAR IN RANGE E0-FF          U6I19040
                          SPAC    1                                     U6I19050
                    CN055 EOR     CN1E1      IS IT THE INVALID E1       U6I19060
                          BSC  L  CN095,+-   BR TO ERR IF IT IS         U6I19070
                          EOR     CN1E1      RESTORE PREV CONTENT       U6I19080
                          BSC  L  CN060,-    BR IF E0, E2-EF            U6I19090
                          SPAC    1                                     U6I19100
                    * SPECIAL HANDLING FOR F0-FF                        U6I19110
                          SPAC    1                                     U6I19120
                          MDX   2 -1         SKIP IF FIRST CHAR         U6I19130
                          MDX     *+1        BR IF NOT FIRST CHAR       U6I19140
                          MDX     CN095      BR TO ERR--FIRST CHAR NUM  U6I19150
                          MDX   2 +1         RETURN X2 TO PREV VALUE    U6I19160
                          SLA     1          RETAIN DIGIT ONLY          U6I19170
                          MDX     CN070      BR TO TEST DIGIT GT 9      U6I19180
                          SPAC    1                                     U6I19190
                    * SET ERROR RETURN                                  U6I19200
                          SPAC    1                                     U6I19210
                    CN095 MDX  L  CN099+1,+1 SET ERR RETURN ADDR        U6I19220
                          MDX     CN091      GO TO RETURN               U6I19230
                          SPAC    1                                     U6I19240
                    * CONSTANTS AND WORKSPACE                           U6I19250
                    CN101 DC      1          CONSTANT 1                 U6I19260
                    CN205 DEC     0          HOLD CUR NAMECODE VALUE    U6I19270
                    CN110 DC      *-*        HOLD CUR 7-BIT CHAR        U6I19280
                    CN15B DC      /6C00      TO COMPARE /5B ($)         U6I19290
                    CN17B DC      /8000      TO COMPARE /7B (#)         U6I19300
                    CN17C DC      /1C00      TO COMPARE /7C (@)         U6I19310
                    CN160 DC      /6000      TO TEST DIGIT GT 9         U6I19320
                    CN1E1 DC      /0800      TO TEST FOR /E1            U6I19330
                    CN105 DC      5          CONSTANT 5                 U6I19340
                          EJCT                                          U6I19350
                    *************************************************** U6I19360
                    *   P  R  I  N  T     R  O  U  T  I  N  E         * U6I19370
                    *************************************************** U6I19380
                          SPAC    1                                     U6I19390
                    PR001 LD   I  $CH12      GET APPROP OFLO INDIC      U6I19400
                          BSC  L  PR010,+-   BR IF *NO* OVERFLOW        U6I19410
                          SPAC    1                                     U6I19420
                    * CARRIAGE OVERFLOW--DO HEADING AFTER SKIP TO 1     U6I19430
                          SPAC    1                                     U6I19440
                          LDD     PR101      SKIP-TO-1 ARGLIST          U6I19450
                          BSI  L  PR000+1    INVOKE DEVICE SUBROUTINE   U6I19460
                          BSI  L  PR000+1    INVOKE DEVICE SUB -- HEAD  U6I19470
                          LD      PR102      SPACE IMMED OPERATION ARG  U6I19480
                          BSI  L  PR000+1    LEAVE TWO BLANK LINES      U6I19490
                          LD      PR102     *AFTER                      U6I19500
                          BSI  L  PR000+1   *HEADING                    U6I19510
                          SPAC    1                                     U6I19520
                    * NORMAL PRINT ACTION                               U6I19530
                          SPAC    1                                     U6I19540
                    PR010 LD   I  PRINT      GET LOCN ARG               U6I19550
                          SRT     16                                    U6I19560
                          LD      PR100      MAKE ACC=PRINT OPERATION   U6I19570
                          BSI  L  PR000+1    INVOKE DEVICE ROUTINE      U6I19580
                          MDX  L  $PBSY,0                               U6I19590
                          MDX     *-3        WAIT UNTIL PRINT COMPLETE  U6I19600
                          MDX  L  PRINT,+1   PREPARE RETURN             U6I19610
                          BSC  I  PRINT      RETURN TO CALLER           U6I19620
                          SPAC    1                                     U6I19630
                    * ARGUMENT LISTS                                    U6I19640
                          SPAC    1                                     U6I19650
                          BSS  E  0                                     U6I19660
                    PR101 DC      /7000      SKIP TO 1 ARGLIST          U6I19670
                          DC      HEADR-1    ADDR OF HEADER LINE - 1    U6I19680
                    PR100 DC      /7001      PRINT AND SPACE 1 OP       U6I19690
                    PR102 DC      /7002      SPACE 1 OP                 U6I19700
                          SPAC    2                                     U6I19710
                    *************************************************** U6I19720
                    *   P R I N T E R   S P A C E   R O U T I N E     * U6I19730
                    *************************************************** U6I19740
                          SPAC    1                                     U6I19750
                    SP001 LD      PR102      SPACE 1 IMMED OPCODE       U6I19760
                          BSI  L  PR000+1    START AND DON'T WAIT       U6I19770
                          BSC  I  SPACE      RETURN TO CALLER           U6I19780
                          SPAC    5                                     U6I19790
                    *************************************************** U6I19800
                    *  PKPRT  *  PACK AND PRINT SERVICE ROUTINE       * U6I19810
                    *************************************************** U6I19820
                          SPAC    1                                     U6I19830
                    PP001 EQU     *                                     U6I19840
                          LDX   1 -40       XR1=NEG LEN PRINT BUFFER    U6I19850
                          LDX  L2 CAREA     XR2=ADDR(INPUT AREA)        U6I19860
                    NUP02 LD    2 0         GET INPUT WORD              U6I19870
                          SLA     8         INTO BITS 0-7               U6I19880
                          OR    2 1         OR IN ODD WORD              U6I19890
                          STO  L1 PRBUF+40  STORE TO PRINT BUFFER       U6I19900
                          MDX   2 +2        UPDATE INPUT POINTER        U6I19910
                          MDX   1 +1        UPDATE PRINT POINTER        U6I19920
                          MDX     NUP02     BR IF NOT FINISHED          U6I19930
                          BSI   3 PRINT-X3  INVOKE PRINT ROUTINE        U6I19940
                          DC      PRBUF-1   ARGUMENT--ADDR OF BUFFER    U6I19950
                          BSC  I  PKPRT     RETURN TO CALLER            U6I19960
                          EJCT                                          U6I19970
                    *************************************************** U6I19980
                    *   PACK4  *  PACK 4 EBCDIC CHARS INTO ACC/EXT    * U6I19990
                    *************************************************** U6I20000
                          SPAC    1                                     U6I20010
                    P4001 STX   2 P4092+1   SAVE INDEX 2                U6I20020
                          LD   I  PACK4     ACC=ADDR(FIRST CHAR)        U6I20030
                          STO     *+1                                   U6I20040
                          LDX  L2 *-*       XR2=ADDR(FIRST CHAR)        U6I20050
                          LD    2 2         ACC=THIRD CHAR              U6I20060
                          SLA     8         ACC=XX00                    U6I20070
                          OR    2 3         OR IN FOURTH CHAR           U6I20080
                          SRT     16        EXT=XXYY--XX=3RD, YY=4TH    U6I20090
                          LD    2 0         ACC=1ST CHAR                U6I20100
                          SLA     8         ACC=AA00                    U6I20110
                          OR    2 1         OR IN 2ND CHAR              U6I20120
                    P4092 LDX  L2 *-*       RESTORE XR2                 U6I20130
                          MDX  L  PACK4,+1  PREPARE RETURN ADDRESS      U6I20140
                          BSC  I  PACK4     RETURN TO CALLER            U6I20150
                          EJCT                                          U6I20160
                    *************************************************** U6I20170
                    * D I S K   R E A D / W R I T E   R O U T I N E S * U6I20180
                    *************************************************** U6I20190
                          SPAC    1                                     U6I20200
                    DR001 BSI     DRW01      GO TO COMMON ROUT WITH     U6I20210
                          DC      0            ARG=0                    U6I20220
                          BSC  I  DREAD      RETURN TO CALLER WHEN DONE U6I20230
                          SPAC    1                                     U6I20240
                    DW001 BSI     DRW01      GO TO COMMON ROUT WITH     U6I20250
                          DC      1             ARG=1                   U6I20260
                          BSC  I  DWRIT      RETURN TO CALLER WHEN DONE U6I20270
                          SPAC    1                                     U6I20280
                    * COMMON DISK READ/WRITE CODING                     U6I20290
                          SPAC    1                                     U6I20300
                    DRW01 DC      *-*        COMMON ENTRY POINT         U6I20310
                          STX   2 DRW02      STORE ADDR OF DCTL FLD     U6I20320
                          STD     DRW03      SAVE COUNT/SAD             U6I20330
                          LDD   2 0          GET CURRENT CONTENT OF DCT U6I20340
                          STD     DRW04      SAVE FOR LATER RESTORE     U6I20350
                          LDD     DRW03      GET OUR COUNT/SAD          U6I20360
                          STD   2 0          PLACE INTO DCTL FLD        U6I20370
                          LD      DRW02      ACC=ADDR OF DCTL           U6I20380
                          SRT     16         PUT INTO EXT               U6I20390
                          LD   I  DRW01      GET 0/1 ARGUMENT           U6I20400
                          BSI  L  DZ000      INVOKE DISKZ               U6I20410
                          MDX  L  $DBSY,0    WAIT FOR                   U6I20420
                          MDX     *-3       *COMPLETION                 U6I20430
                          LDD     DRW04      GET OLD CONTENT OF DCTL    U6I20440
                          STD   2 0          RESTORE THAT CONTENT       U6I20450
                          MDX  L  DRW01,+1  SET RETURN ADDRESS          U6I20460
                          BSC  I  DRW01      RETURN TO SPECIFIC ROUTINE U6I20470
                          SPAC    1                                     U6I20480
                    * WORKSPACES                                        U6I20490
                          SPAC    1                                     U6I20500
                    DRW02 DC      *-*        HOLD ADDR OF DCTL          U6I20510
                    DRW03 DEC     0          HOLD NEW DCTL CONTENT      U6I20520
                    DRW04 DEC     0          HOLD OLD DCTL CONTENT      U6I20530
                          EJCT                                          U6I20540
                    *************************************************** U6I20550
                    *  ERROR  * PRINT ERROR AND ABORT SUBROUTINE      * U6I20560
                    *************************************************** U6I20570
                          SPAC    2                                     U6I20580
                    * INITIALIZATION                                    U6I20590
                          SPAC    1                                     U6I20600
                    ER001 LD   I  ERROR     ACC=ERROR CODE IN EBCDIC    U6I20610
                          STX  L  $NDUP     SET NO DUP SWITCH           U6I20615
                          STO     ER100+4   STORE INTO MESSAGE          U6I20620
                          SPAC    1                                     U6I20630
                    * PRINT '**ERROR XX**' AFTER SINGLE SPACE           U6I20640
                          SPAC    1                                     U6I20650
                          BSI   3 SPACE-X3  INVOKE SPACE ROUTINE        U6I20660
                          BSI   3 PRINT-X3  INVOKE PRINT ROUTINE        U6I20670
                          DC      ER100-1   BUFFER ADDRESS              U6I20680
                          SPAC    1                                     U6I20690
                    * PRINT 'PROGRAM HAS NOT BEEN MODIFIED' AFTER SPACE U6I20700
                          SPAC    1                                     U6I20710
                          BSI   3 PRINT-X3  INVOKE PRINT ROUTINE        U6I20720
                          DC      ER110-1   ADDR OF BUFFER              U6I20730
                          SPAC    1                                     U6I20740
                    * NOW EXIT TO THE MONITOR                           U6I20750
                          SPAC    1                                     U6I20760
                          EXIT                                          U6I20770
                          SPAC    1                                     U6I20780
                    * ERROR MESSAGES                                    U6I20790
                          SPAC    1                                     U6I20800
                          BSS  E  1         ASSURE ODD BOUNDARY         U6I20810
                          DC      6         LENGTH OF MESSAGE           U6I20820
                    ER100 EBC     .**ERROR   **.                        U6I20830
                          SPAC    1                                     U6I20840
                          DC      12        LENGTH OF MESSAGE           U6I20850
                    ER110 EBC     .PROGRAM WAS NOT MODIFIED.            U6I20860
                          EJCT                                          U6I20870
                    *************************************************** U6I20880
                    *  PR0000  *  PRINCIPAL PRINTER ROUTINE           * U6I20890
                    *************************************************** U6I20900
                          SPAC    1                                     U6I20910
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6I20920
                    PR000 BSS     /140      AREA FOR PRIN PRINTER ROUT  U6I20930
                          SPAC    3                                     U6I20940
                    *************************************************** U6I20950
                    *  CD000  *  PRINCIPAL INPUT DEVICE ROUTINE       * U6I20960
                    *************************************************** U6I20970
                          SPAC    1                                     U6I20980
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6I20990
                    CD000 BSS     /110      SPACE FOR PRIN INPUT ROUTIN U6I21000
                          EJCT                                          U6I21010
                    *************************************************** U6I21020
                    *  CVHEB  *  CONVERT EXT HOLLERITH TO EBCDIC      * U6I21030
                    *************************************************** U6I21040
                          SPAC    1                                     U6I21050
                    CVHEB DC      *-*       ENTRY POINT                 U6I21060
                          LDX  L2 CAREA     XR2=ADDR(COL 1 IN BUFFER)   U6I21070
                          STX   2 CH010+1   SET GET INSTRUCTION         U6I21080
                          LDX   2 -80       XR2=NEG LEN IN WORDS        U6I21090
                          SPAC    1                                     U6I21100
                    * LOOP FOR EACH CHARACTER--EXTENDS TO  MDX  CH010   U6I21110
                          SPAC    1                                     U6I21120
                    CH010 LD   L  *-*     GET BLOCK CHARACTER           U6I21130
                          MDX  L  CH010+1,+1  UPDATE BLOCK POINTER      U6I21140
                          SPAC    1                                     U6I21150
                          SRA     4       ACC=0XXX -- AVOID PROPAGATION U6I21160
                          SRT     9       ACC=12,11,0 EXT=1-9           U6I21170
                          STO     CH020+1 STORE ZONE CONFIG AS 0-7      U6I21180
                          SLA     2       MULTIPLY BY 4                 U6I21190
                          STO     CH110+1  STORE ZONE CONFIG AS 0-28    U6I21200
                    CH020 LDX  L1 *-*     X1=0--7, ACC TO ZONE CONFIG   U6I21210
                          LD      CH960   ACC=BIT 2/3 VALUES, AND S/M   U6I21220
                          LDS     0       ASSURE CARRY OFF, OFLO OFF    U6I21230
                          SLA   1         SHIFT ACC TO ZONE CONFIG      U6I21240
                          STS     CH900   MULT ZONE GIVES '2', ELSE '0' U6I21250
                          SLA     7       ACC BITS 0,1 = EBC BITS 2,3   U6I21260
                          SRA     14      ACC BITS 14,15 = EBC BITS 2,3 U6I21270
                          STO     CH910   SAVE EBC BITS 2,3             U6I21280
                          SPAC    1                                     U6I21290
                          SLT     16      ACC=1,2,3,4,5,6,7,8,9,....... U6I21300
                          LDX   1 8       SET X1=8 FOR SHIFT COUNT      U6I21310
                          SLCA  1         X1=(N=0,1=8,2=7,...,7=2,8=1)  U6I21320
                          STX   1 CH920   SAVE AS BITS 4,5,6,7 FOR NOW  U6I21330
                          BSC     C       SKIP ONLY IF NO PCHS 1--8     U6I21340
                          EOR     CH940   IF ANY PCHS, CLEAR FIRST      U6I21350
                          SLCA  1        X1=(IF 8-PCH=1, IF NO 8-PCH=0) U6I21360
                          BSC     C       SKIP IF NO PCHS OR NO 8-PCH   U6I21370
                          SLA     1       GET RID OF 8-PCH. 9 IN BIT 0  U6I21380
                          A       CH940   OFLO=(IF 9-PCH=ON, ELSE=OFF)  U6I21390
                          SPAC    1                                     U6I21400
                          MDX   1 -1      SKIP  IF VALID CHAR           U6I21410
                          MDX     CH200   GO SET CHARACTER = AMPERSAND  U6I21420
                          SPAC    1                                     U6I21430
                          SLA     16      ASSURE ACC=0                  U6I21440
                          S       CH920   NEGATIVE OF FIRST COUNT IN X1 U6I21450
                          BSC  L  CH100,-  IF ALREADY 0, NONE 1-8       U6I21460
                          MDX   1 0       SKIP IF DIGIT *NOT* LOW       U6I21470
                          MDX     CH120   BR IF DIGIT IS LOW            U6I21480
                          SPAC    1                                     U6I21490
                          A       CH950   IF ZERO, PCHS 1,8             U6I21500
                          BSC  L  CH030,Z BR IF PUNCHES 2,8 THRU 7,8    U6I21510
                          MDX  L  CH900,0 SKIP IF *NOT* MULTIPLE ZONES  U6I21520
                          MDX     CH140   BR IF *MULTIPLE* ZONES        U6I21530
                          SPAC    1                                     U6I21540
                    CH030 EQU     *       FOR 2,8 THRU 7,8 & 1,8 NO M/Z U6I21550
                          A       CH990   ADJUST DIGIT FOR HIGH         U6I21560
                          STO     CH920   SET THE DIGIT                 U6I21570
                          LD      CH900   0=SINGLE ZONE, 2=MULTIPLE     U6I21580
                          BSC     O       SKIP IF *NO* 9-PUNCH          U6I21590
                          EOR     CH930   INVERT ACC IF *9-PUNCH*       U6I21600
                          BSC     Z       SKIP IF MULTZ=9-PUNCH         U6I21610
                          MDX     CH050   BR IF MULTZ *NOT* = 9-PUNCH   U6I21620
                    CH040 MDX  L  CH900,+1  SET BIT 1 *ON*              U6I21630
                    CH050 LD      CH900                                 U6I21640
                          SLA     2       ACC BITS 12,13=EBC BITS 0,1   U6I21650
                          OR      CH910   ACC BITS 12-15=EBC BITS 0-3   U6I21660
                    CH060 SLA     4       ACC BITS 8-11=EBC ZONE        U6I21670
                          OR      CH920   OR IN EBC DIGIT               U6I21680
                          STO     CH920   SAVE THE WHOLE EBC CHAR       U6I21690
                          LDX   1 -4      SET FOR HANDLING EXCEPTIONS   U6I21700
                          SPAC    1                                     U6I21710
                    CH070 SLA     8       ACC BITS 0-7 = EBC CHAR       U6I21720
                          EOR  L1 CH970+4  EXCL OR BOTH CHARS           U6I21730
                          SRT     8       ACC=0 IF FIRST CHAR MATCH     U6I21740
                          BSC  L  CH080,Z  BR IF NOT A MATCH            U6I21750
                          SLT     8       *MATCH* -- GET REPLACEMENT    U6I21760
                          MDX     CH090     AND GO STORE THE CHARACTER  U6I21770
                    CH080 LD      CH920   RELOAD WHOLE SAVED CHARACTER  U6I21780
                          MDX   1 +1      SET TO LOOK MORE              U6I21790
                          MDX     CH070     IF NOT ALL, LOOK AGAIN      U6I21800
                          SPAC    1                                     U6I21810
                    CH090 STO  L2 CAREA+80        STORE THE CHARACTER   U6I21820
                          MDX   2 +1      SET FOR NEXT CHARACTER        U6I21830
                          MDX     CH010   IF NOT ALL, GO CONV NEXT CHAR U6I21840
                          SPAC    1                                     U6I21850
                          BSC  I  CVHEB     AND RETURN TO CALLER        U6I21860
                          SPAC    1                                     U6I21870
                    CH100 BSC     O       SKIP IF *NO* 9-PUNCH          U6I21880
                          MDX     CH120 9-PCH. NOTE 9-PCH-INDIC SET OFF U6I21890
                    CH110 LDX  L1 *-*     *NO* 9-PCH. SET SPCL CASE     U6I21900
                          LDD     CH980   SPCL CASE ZONES. WILL SHIFT.  U6I21910
                          SLT   1         SHIFT ACC TO HOL ZONE CONFIG  U6I21920
                          SRA     12      SET ZONE IN ACC BITS 12-15    U6I21930
                          MDX     CH060     AND PROCEED TO INSERT DIG 0 U6I21940
                          SPAC    1                                     U6I21950
                    CH120 A       CH990                                 U6I21960
                          STO     CH920                                 U6I21970
                          LD      CH900   0=SINGLE ZONE, 2=MULTIPLE     U6I21980
                          BSC     O       SKIP IF *NO* 9-PUNCH          U6I21990
                          EOR     CH930   INVERT IF*9-PUNCH*            U6I22000
                          BSC     Z       SKIP IF MULTZ = 9-PUNCH       U6I22010
                          MDX     CH050   BR IF MULTZ *NOT* = 9-PUNCH   U6I22020
                    CH130 LD      CH900   0=SINGLE, 2=MULTIPLE          U6I22030
                          EOR     CH930   INVERT FOR REAL IF MZ=9       U6I22040
                          STO     CH900     AND STORE INVERTED BIT 0    U6I22050
                          MDX     CH040   GO TURN BIT 1 ON              U6I22060
                          SPAC    1                                     U6I22070
                    CH140 STO     CH920   SET DIGIT = 0                 U6I22080
                          BSC     O       SKIP IF *NO* 9-PUNCH          U6I22090
                          STO     CH900   IF *9-PUNCH*, SET BIT 0 OFF   U6I22100
                          MDX     CH050     THEN CONTINUE NORMALLY      U6I22110
                          SPAC    1                                     U6I22120
                    * CONSTANTS AND WORKSPACE                           U6I22130
                          SPAC    1                                     U6I22140
                    CH900 DC      *-*     FOR EBC BITS 0,1              U6I22150
                    CH910 DC      *-*     FOR EBC BITS 2,3              U6I22160
                    CH920 DC      *-*     FOR EBC DIGIT (AND CHAR SAVE) U6I22170
                    CH930 DC      /0002   EXCL OR CONSTANT              U6I22180
                    CH940 DC      /8000   FOR AFFECTING ACC BIT 0       U6I22190
                    CH950 DC      8         INCREMENT--CONSTANT 8       U6I22200
                    CH960 DC      /2FA3   BIT23 & SINGLE/MULT STAT      U6I22210
                    CH970 DC      /61E1     LIST                        U6I22220
                          DC      /E161     * OF                        U6I22230
                          DC      /6AE0     *  EXCEPTION                U6I22240
                          DC      /E06A     *   CHARACTERS              U6I22250
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6I22260
                    CH980 DC      /4F6D   FOR HOL N,0,11,11-0           U6I22270
                          DC      /5CE7   FOR HOL 12,12-0,12-11,12-11-0 U6I22280
                    CH990 DC      9         CONSTANT 9--INCREMENT       U6I22290
                          SPAC    1                                     U6I22300
                    * VALIDITY ERROR--MAKE CHARACTER AMPERSAND          U6I22310
                          SPAC    1                                     U6I22320
                    CH200 LD      CH999     LOAD AMPERSAND              U6I22330
                          MDX     CH090     GO PUT THE CHARACTER        U6I22340
                          SPAC    1                                     U6I22350
                    CH999 DC      /0050     AMPERSAND                   U6I22360
                          SPAC    3                                     U6I22370
                    *************************************************** U6I22380
                    *  HEADR  *  PRINT HEADER AREA                    * U6I22390
                    *************************************************** U6I22400
                          SPAC    1                                     U6I22410
                          BSS  E  1         ASSURE ODD BOUNDARY         U6I22420
                          DC      HEDRX-*   WORDCOUNT FOR HEADING       U6I22430
                    HEADR BSS     10        FOR 'PAGEXXXX    JOB-NAME'  U6I22440
                          EBC     .  MODIFY DSF-PROGRAM(S) IN USER AR.  U6I22450
                          EBC     .EA.                                  U6I22460
                    HEDRX EQU     *                                     U6I22470
                          SPAC    3                                     U6I22480
                    *************************************************** U6I22490
                    *  DAREA  *  DISK BUFFER AREA                     * U6I22500
                    *************************************************** U6I22510
                          SPAC    1                                     U6I22520
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6I22530
                          BSS     2         DISK CONTROL FIELD          U6I22540
                    DAREA BSS     640       RESERVE TWO SECTOR BUFFER   U6I22550
                    STRNG BSS     106       FOR SPECIFICATION STRING    U6I22560
                          END     BEGIN                                 U6I22570
