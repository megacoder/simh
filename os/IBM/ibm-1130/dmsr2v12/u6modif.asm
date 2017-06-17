                          HDNG    MODIF                                 U6H00010
                    *************************************************** U6H00020
                    *STATUS-VERSION 2, MODIFICATION LEVEL 12          * U6H00030
                    *                                                 * U6H00040
                    *FUNCTION/OPERATION-                              * U6H00050
                    *     *MODIF CAN PUT PATCHES IN SYSTEM PROGRAMS   * U6H00060
                    *     (MON-CONTROL RECORD) AND BY PASSING CONTROL * U6H00070
                    *     TO DUP PERFORM DELETES AND STORES IN SYSTEM * U6H00080
                    *     LIBRARY (  SUB-CONTROL RECORD). THE MAINLINE* U6H00090
                    *     WITH THE LOGICAL FLOW OF A MODIFICATION IS  * U6H00100
                    *     THE SUBROUTINE MO000, FROM THERE BRANCHES IS* U6H00110
                    *     MADE TO OTHER SUBROUTINS. THE INITIATION    * U6H00120
                    *     PART IS FROM MO000 TO MO500. MODIF USES     * U6H00130
                    *     DISKZ AND PRINCIPAL READER/PRINTER ACCORDING* U6H00140
                    *     TO SLET.                                    * U6H00150
                    *     * MON-CONTROL RECORDS. UP TO 7FFF CARDS OF  * U6H00160
                    *       THIS KIND CAN BE PROCESSED IN A MODIF-JOB.* U6H00170
                    *       MODIF REMAINS IN CORE.                    * U6H00180
                    *     * SUB-CONTROL RECORDS. ONLY 1 CARD OF THIS  * U6H00190
                    *       KIND IS PERMITTED AND MUST BE THE LAST CON* U6H00200
                    *       TROL CARD IN A MODIF JOB. AFTER READING A * U6H00210
                    *       SUB-CARD   EXTRACTING THE INFORMATION,    * U6H00220
                    *       MODIF WRITES SUBROUTINES RY000,EO010,EO110* U6H00230
                    *       RF000,PB000 AND PU000 ON THE DISKSCTR WITH* U6H00240
                    *       SLET ID HEX 12. THEN PHASE 0 OF DUP IS    * U6H00250
                    *       FETCHED AND CONTROL PASSED OVER TO DUP.   * U6H00260
                    *       DUP READS AND PROCESSES DELETES AND STORES* U6H00270
                    *       AND ALSO READS THE //  DEND-CARD AND PUTS * U6H00280
                    *       IT IN CARD BUFFER BEGINNING AT 4096-80.   * U6H00290
                    *       THEN THAT PART OF MODIF PREVIOUSLY WRITTEN* U6H00300
                    *       TO DISK IS FETCHED AND A BRANCH IS MADE TO* U6H00310
                    *       THE FIRST WORD IN THIS PART.              * U6H00320
                    *                                                 * U6H00330
                    *ENTRY POINTS-                                    * U6H00340
                    *   * MO000-FOR EVERY NEW MODIF JOB.              * U6H00350
                    *             BSC  L  MO000                       * U6H00360
                    *   * RY000-REENTRY FROM DUP FOR TERMINATING      * U6H00370
                    *             BSC  L  RY000                       * U6H00380
                    *                                                 * U6H00390
                    *INPUT-                                           * U6H00400
                    *   * A STREAM OF PATCH CONTROL- AND DATA CARDS   * U6H00410
                    *   * #SYSC HAS THE CURRENT VERSION-MODIFICATION  * U6H00420
                    *   * #MDF2=XXYY WHEN REENTRIED FROM DUP XX=NUMBER* U6H00430
                    *     OF PROCESSED DELETE/STORE-RECORDS, YY=NUMBER* U6H00440
                    *     OF ERRORS OCCURED                           * U6H00450
                    *     #MDF2=O NO ERRORS.ALL DCR,S PROCESSED       * U6H00460
                    *                                                 * U6H00470
                    *OUTPUT-                                          * U6H00480
                    *   * PATCHED SYSTEM PROGRAMS AND SYSTEM LIBRARY  * U6H00490
                    *   * #SYSC UPDATED TO NEW VERSION/MOD-LEVEL      * U6H00500
                    *   * #MDF1 OUTPUTS MODIF REENTRY ADRESS WHEN EXIT* U6H00510
                    *     TO DUP                                      * U6H00520
                    *   * PATCH INFORMATION IS PRINTED ON THE      2-12 U6H00522
                    *     PRINCIPLE PRINTER IF SW 1 IS OFF.        2-12 U6H00524
                    *                                                 * U6H00530
                    *EXTERNAL REFERENCES-                             * U6H00540
                    *   * SUBROUTINES-                                * U6H00550
                    *     * DISKZ                                     * U6H00560
                    *     * PRINCIPAL I/O                             * U6H00570
                    *   * COMMA/DCOM-                                 * U6H00580
                    *     * $CH12                                     * U6H00590
                    *     * $CTSW                                     * U6H00600
                    *     * $DBSY                                     * U6H00610
                    *     * $IBSY                                     * U6H00620
                    *     * $LAST                                     * U6H00630
                    *     * $PRET                                  2-12 U6H00632
                    *     * $FPAD                                  2-12 U6H00634
                    *     * $NDUP                                     * U6H00640
                    *     * $NXEQ                                     * U6H00650
                    *     * $PBSY                                     * U6H00660
                    *     * #MDF1                                     * U6H00670
                    *     * #MDF2                                     * U6H00680
                    *     * #PIOD                                     * U6H00690
                    *     * #PPTR                                     * U6H00700
                    *     * #SYSC                                     * U6H00710
                    *EXITS-                                           * U6H00720
                    *   * NORMAL-                                     * U6H00730
                    *     * TO SUPERVISOR AFTER TERMINATION           * U6H00740
                    *     * TO DUP DURING   SUB-CARD PROCESSING       * U6H00750
                    *   * ERROR-                                      * U6H00760
                    *     * TO SUPERVISOR IF CONSOLE SWITCH 0 IS ON   * U6H00770
                    *   * * TO $PRET IF A DRIVE IS INDICATED THAT  2-12 U6H00772
                    *       HAS NOT BEEN SPECIFIED ON A JOB CARD   2-12 U6H00774
                    *                                                 * U6H00780
                    *TABLES/WORK AREAS-N/A                            * U6H00790
                    *                                                 * U6H00800
                    *ATTRIBUTES-                                      * U6H00810
                    *   * RELOCATABLE                                 * U6H00820
                    *                                                 * U6H00830
                    *NOTES-N/A                                        * U6H00840
                    *************************************************** U6H00850
                          HDNG    INITIALIZATION                        U6H00860
                    *                                                   U6H00870
                    *             EQUATES                               U6H00880
                    *                                                   U6H00890
                    $XR1  EQU     1                                2-12 U6H00895
                    $CH12 EQU     6                                     U6H00900
                    LEVL0 EQU     /8                                    U6H00910
                    $LEV4 EQU     /C                                2-2 U6H00930
                    $CTSW EQU     /F                                    U6H00940
                    $IBSY EQU     /13                                   U6H00950
                    $PRET EQU     /28                              2-12 U6H00955
                    $LAST EQU     /33                                   U6H00960
                    $NDUP EQU     /34                                   U6H00970
                    $NXEQ EQU     /35                                   U6H00980
                    $PBSY EQU     /36                                   U6H00990
                    $FPAD EQU     /95                              2-12 U6H00995
                    $I400 EQU     /C4                               2-2 U6H01000
                    $DBSY EQU     /EE                                   U6H01010
                    IBT40 EQU     /D4                                   U6H01020
                    DISKZ EQU     /F2        DISKZ ENTRY ADDRESS        U6H01030
                    *             CONSTANTS                             U6H01040
                    *                                                   U6H01050
                    GETIO DC      /7000      DISKZ READ FUNCTION        U6H01060
                          DC      CDPTR-2    WORD COUNT ADDR.           U6H01070
                    GETCV DC      /7000      DISKZ READ FUNCTION        U6H01080
                          DC      CONVR-2    WORD COUNT ADDR.           U6H01090
                    ID8F0 DC      /8F        2501 SLET ID               U6H01110
                    ID910 DC      /91        1134 SLET ID               U6H01120
                    ID990 DC      /8E       CONS. PTR. SLET ID      212 U6H01130
                    ID9A0 DC      /9A        PRINC. I/O SLET ID         U6H01140
                    ID9B0 DC      /9C        PRINC. CONV. SLET ID       U6H01150
                    *                                                   U6H01160
                    *             ROUTINE TO CLEAR LOW CORE BUFFERS     U6H01170
                    *                                                   U6H01180
                    MO000 NOP                                           U6H01190
                          NOP                                           U6H01200
                          LDX  L1 1346       GET BUFFER WORD COUNT      U6H01210
                          SLT     32         CLEAR A/Q                  U6H01220
                    MO010 STD  L1 PRNTR-4    CLEAR INPUT BUFFERS        U6H01230
                          MDX   1 -2         REDUCE COUNT               U6H01240
                          MDX     MO010      BACK TO CLEAR              U6H01250
                    *                                                   U6H01260
                    *             GET PRINCIPAL PRINT AND I/O ROUTINES  U6H01270
                    *                                                   U6H01280
                    MO030 LD      ID990                                 U6H01360
                          BSI  L  SH000      GET PRINC. PRNT. ENTRY     U6H01370
                          BSC     Z          SKIP IF FOUND              U6H01380
                          MDX     MO040      NO HIT DURING SEARCH       U6H01390
                          LDD   2 2          GET WD. CNT. AND SECTOR    U6H01400
                          STD  L  PRNTR-2    STORE AHEAD OF BUFFER      U6H01410
                          STD  L  PRENT      SAVE FOR DUP RE-ENTRY      U6H01420
                          LDD  L  DISKR      GET DISKZ PARAMETERS       U6H01430
                          BSI  L  DISKZ      READ IN PRINT ROUTINE      U6H01440
                          LD   L  $DBSY                                 U6H01450
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H01460
                    *                                                   U6H01470
                          LD      ID9A0                                 U6H01480
                          BSI  L  SH000      GET PRINC. I/O ENTRY       U6H01490
                          BSC     Z          SKIP IF FOUND              U6H01500
                          MDX     MO040      NO HIT DURING SEARCH       U6H01510
                          LDD   2 2          GET WD. CNT. AND SECTOR    U6H01520
                          STD  L  CDPTR-2    STORE AHEAD OF BUFFER      U6H01530
                          LDD     GETIO      GET DISKZ PARAMETERS       U6H01540
                          BSI  L  DISKZ      READ IN I/O ROUTINE        U6H01550
                          LD   L  $DBSY                                 U6H01560
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H01570
                    *                                                   U6H01580
                    *             ROUTINE TO SET PAPER TAPE INDICATOR   U6H01590
                    *             AND SKIP READING IN CONVERSION RTNS.  U6H01600
                    *             IF NOT NEEDED                         U6H01610
                    *                                                   U6H01620
                    MO035 LD      ID910                                 U6H01630
                          BSI  L  SH000      GET 1134 ENTRY             U6H01640
                          BSC     Z          SKIP IF FOUND              U6H01650
                          MDX     MO040      NO HIT DURING SEARCH       U6H01660
                          LD    2 3          GET SECTOR ADDRESS         U6H01670
                          EOR  L  CDPTR-1    COMPARE TO I/O IN CORE     U6H01680
                          BSC  L  MO050,Z    NO BRANCH IF PT            U6H01690
                          LD      GETIO      GET HEX CONSTANT           U6H01700
                          SLA     3          SHIFT TO /8000             U6H01710
                          STO  L  PTIND      SET INDICATOR NEGATIVE     U6H01720
                          MDX     MO080                             212 U6H01730
                    MO040 BSI  L  EO070      GO TO ERROR 7 ROUTINE      U6H01740
                    *                                                   U6H01750
                    *             GET CONVERSION ROUTINE                U6H01760
                    *                                                   U6H01770
                    MO050 LD      ID9B0                                 U6H01780
                          BSI  L  SH000      GET CONVERSION ENTRY       U6H01790
                          BSC     Z          SKIP IF FOUND              U6H01800
                          MDX     MO040      NO HIT DURING SEARCH       U6H01810
                          LDD   2 2          GET WD. CNT. AND SECTOR    U6H01820
                          STD  L  CONVR-2    STORE AHEAD OF BUFFER      U6H01830
                          LDD     GETCV      GET DISKZ PARAMETERS       U6H01840
                          BSI  L  DISKZ      READ IN CONVERSION RTN.    U6H01850
                          LD   L  $DBSY                                 U6H01860
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H01870
                    *                                                   U6H01880
                    *             ROUTINE TO SET 2501 INDICATOR AND     U6H01890
                    *             COL. INTERRUPT ADDRESS                U6H01900
                    *                                                   U6H01910
                    MO060 LD   L  COLNT      GET COL. INT. ADDR.        U6H01920
                          STO  L  LEVL0      STORE IN INT. TV           U6H01930
                          LD      ID8F0                                 U6H01940
                          BSI  L  SH000      GET 2501 ENTRY             U6H01950
                          BSC     Z          SKIP IF FOUND              U6H01960
                          MDX     MO040      NO HIT DURING SEARCH       U6H01970
                          LD    2 3          GET SECTOR ADDRESS         U6H01980
                          EOR  L  CDPTR-1    COMPARE TO I/O IN CORE     U6H01990
                    *   N BSC  L  MO080,Z   NO BRANCH IF 2501       212 U6H02000
                          BSC  L  MO080,Z   NO BRANCH IF 2501       212 BLKMODIF
                          LD      GETIO      GET HEX CONSTANT           U6H02010
                          SRA     14         SHIFT TO /0001             U6H02020
                          STO  L  CDIND      SET 2501 INDICATOR ODD     U6H02030
                    *                                                   U6H02040
                    MO080 LD   L  IBTNT      GET IBT-1 ADDRESS          U6H02200
                          STO  L  IBT40      STORE IN ILS04             U6H02210
                          LDX  L3 $I400      FORCES MODIF TO USE    2-2 U6H02220
                          STX  L3 $LEV4      *ILS04 IN RES. MONITOR 2-2 U6H02230
                          MDX   3 -17       FORCES MODIF TO USE    2-12 U6H02234
                          STX  L3 /A        *ILS02 IN RES. MON     2-12 U6H02236
                    MO090 LDX  L1 640        GET WORD COUNT             U6H02330
                          LDX   2 0          GET SECTOR ADDRESS         U6H02340
                          LD   L  GET00      GET READ FUNCTION          U6H02350
                          BSI  L  R4000      READ CARID AND DCOM        U6H02360
                          LD   L  #SYSC      GET VER. AND MOD.          U6H02370
                          STO  L  VMODH      SAVE                       U6H02380
                          BSI  L  PB000      CONVERT TO EBCDIC          U6H02390
                          STD  L  VMNOP      SAVE                       U6H02400
                          STD  L  RY920      STORE IN EXIT MSG.         U6H02410
                          LD   L  #PIOD      GET PRINC. I/O IND.        U6H02420
                          STO  L  PIODR      SAVE                       U6H02430
                          LDX  L2 MSG1R      GET SIGN-ON MSG. ADDR.     U6H02460
                          LDX   1 10         GET WORD COUNT             U6H02470
                          BSI  L  PU000      PRINT SIGN-ON MSG.         U6H02480
                    MO100 LD   L  PIODR      GET PRINC. I/O IND.        U6H02490
                          BSC     +Z         NO SKIP IF PT              U6H02500
                          MDX     MO110      GO TO CHECK PTIND          U6H02510
                          BSC     Z          SKIP IF 1442               U6H02520
                          MDX     MO120      GO TO CHECK PRIND          U6H02530
                          LD   L  CDIND      GET CDIND                  U6H02540
                          BSC     Z          SKIP IF 1442               U6H02550
                          MDX     MO140      TO IND. ERROR WAIT         U6H02560
                          MDX     MO500     CONTINUE                212 U6H02570
                    MO110 LD   L  PTIND      GET PTIND                  U6H02580
                          BSC     -          SKIP IF PT                 U6H02590
                          MDX     MO140      TO IND. ERROR WAIT         U6H02600
                          MDX     MO500     CONTINUE                212 U6H02610
                    MO120 LD   L  CDIND      GET CDIND                  U6H02620
                          BSC     -Z        SKIP IF NOT 2501        212 U6H02630
                          MDX     MO500     CONTINUE                212 U6H02640
                    MO140 BSI  L  EO070      INDICATOR ERROR            U6H02720
                          MDX     MO500                                 U6H02730
                          HDNG    CONSTANTS/TABLES/MESSAGES             U6H02740
                    *                                                   U6H02750
                    *             CONSTANTS AND TABLES                  U6H02760
                    *                                                   U6H02770
                    COLNT DC      CDPTR+7    COL. INT. ADDR. FOR 1442   U6H02780
                    IBTNT DC      IBTWD-1    IBT ADDRESS                U6H02800
                    CDIND DC      0          ODD IF 2501 I/O            U6H02810
                    PTIND DC      0          NEGATIVE IF PT I/O         U6H02820
                    PIODR DC      0                                     U6H02840
                    PPTRR DC      0                                     U6H02850
                    PCHCT DC      0          TOTAL PATCH HEADERS        U6H02860
                    PCHES DC      0          PATCH DATA RECORDS         U6H02870
                    ABSXX DC      0          SET NON-ZERO FOR ABS CARD  U6H02880
                    SUBXX DC      0          SET NON-ZERO FOR SUB CARD  U6H02890
                    BHIND DC      0          SET ZERO FOR HEX           U6H02900
                    DEC01 DC      1                                     U6H02910
                    DEC04 DC      4                                     U6H02920
                    DEC05 DC      5                                     U6H02930
                    H0040 DC      /0040                                 U6H02940
                    H0A00 DC      /0A00                                 U6H02950
                    H0F00 DC      /0F00                                 U6H02960
                    H5001 DC      /5001     ILLEGAL DISK OP CODE   2-12 U6H02965
                    CTR04 DC      0          WORD TO COUNT 4            U6H02970
                    GET00 DC      /7000                                 U6H02980
                    DVDND DC      0          TEMP STORAGE FOR CARD COL. U6H02990
                    SLTID DC      0          SAVE SLET ID               U6H03000
                    CBUFA DC      CDBUF      CARD BUFFER ADDR.          U6H03010
                    SNTRY BSS  E  4          BUFFER FOR SLET ENTRY      U6H03020
                    BHXXX EBC     .BH.                                  U6H03030
                    *                                                   U6H03040
                    *             MESSAGES                              U6H03050
                    *                                                   U6H03060
                          BSS  E  0                                     U6H03070
                    MSG1R EBC     .MODIF EXECUTION .                    U6H03080
                    VMNOP BSS     2                                     U6H03090
                    MSG06 EBC     .JOB ABORTED .                   2-12 U6H03096
                          HDNG    MAINLINE CODE                         U6H03100
                    *                                                   U6H03110
                    MO500 NOP                                           U6H03120
                          LD      MO500      GET NOP INSTRUCTION        U6H03130
                          STO  L  MO600      RESET DISK PATCH SWITCH    U6H03140
                          BSI  L  R2000      READ A RECORD              U6H03150
                          BSI  L  R5000      PRINT IT               2-2 U6H03160
                          BSI  L  CH000      CHECK IT                   U6H03170
                          LDX   1 26         CARD COL. 26 IN IR-1       U6H03180
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03190
                          BSI  L  C1000      CONVERT TO BINARY          U6H03200
                          STO  L  PCHCT      STORE PATCH COUNT          U6H03210
                    MO510 LDX   1 9          CARD COL. 9 IN IR-1        U6H03220
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03230
                          BSI  L  CH100      CHECK IF TEMPORY FIX   2-2 U6H03240
                    *                        *AND SET TPFIX         2-2 U6H03250
                          BSI  L  C1000      CONVERT TO BINARY          U6H03260
                          SRA     4                                     U6H03270
                          STO  L  CHGLV      STORE CARD CHANGE LEV.     U6H03280
                          LD   L  TPFIX      GET TRMP FIX INDICATOR 2-2 U6H03290
                          BZ      MO518      BR IF SYSTEM UPDATE    2-2 U6H03300
                          BOD     MO516      BR IF RESTRICTED FIX   2-2 U6H03310
                          LD   L  CHGLV      GET MOD LEVEL FOM CD   2-2 U6H03320
                          S    L  VMODH      CHECK WITH SYST LEVEL  2-2 U6H03330
                          BZ      MO520      BR IF THE SAME         2-2 U6H03340
                          A    L  DEC01      IS IT 1 HIGHER         2-2 U6H03350
                          BSI  L  EO120,Z    *BR IF NO              2-2 U6H03360
                          B       MO520      *BR IF YES             2-2 U6H03370
                    MO516 LD   L  CHGLV      GET MOD LEVEL FROM CD  2-2 U6H03380
                          S    L  VMODH      IS EQUAL TO SUSTEM     2-2 U6H03390
                          BSI  L  EO130,Z    *BR IF NO              2-2 U6H03400
                          B       MO520      *BR IF YES             2-2 U6H03410
                    MO518 LD   L  CHGLV      GET MOD LEVEL FROM CD  2-2 U6H03420
                          S    L  VMODH      SUBTRACT DISK VER/MOD IND. U6H03430
                          BSC  L  MO520,+-   BRANCH IF CHGLV=VMNO       U6H03440
                          S    L  DEC01      SUBTRACT 1                 U6H03450
                          BSI  L  EO050,Z+   BRANCH IF CHGLV TO LESS    U6H03460
                          BSI  L  EO040,Z    BRANCH IF CHGLV TO HIGH    U6H03470
                    MO520 LD   L  SUBXX      GET SUB INDICATOR          U6H03480
                          BSC  L  SR000,Z    BRANCH ON SUB CARD         U6H03490
                    * 1 INSTRUCTION REMOVED                        2-12 U6H03500
                    MO530 LDX   1 14         CARD COL. 14 IN IR-1       U6H03510
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03520
                          BSI  L  C1000      CONVERT TO BINARY          U6H03530
                          STO  L  SLTID      SAVE SLET ID               U6H03540
                          BSC  L  MO550,+-   BRANCH IF ABSOLUTE PATCH   U6H03550
                          SLA     16         CLEAR ACCUMULATOR          U6H03560
                          STO  L  ABSXX      CLEAR ABS INDICATOR        U6H03570
                          LD   L  SLTID      GET SLET ID FOR SEARCH     U6H03580
                          BSI  L  SH000      LOOK FOR SLET ENTRY        U6H03590
                          BSI  L  EO090,Z    BRANCH IF NO HIT           U6H03600
                          LDD   2 0          GET ID AND CORE ADDR.      U6H03610
                          RTE     16         SWAP A AND Q               U6H03620
                          A    L  R3910      ADD 2                      U6H03630
                    MO540 RTE     16                                    U6H03640
                          STD  L  SNTRY      SAVE                       U6H03650
                          LDD   2 2          GET WD. CNT. AND SECTOR    U6H03660
                          STD  L  SNTRY+2    SAVE                       U6H03670
                          MDX     MO560                                 U6H03680
                    MO550 LD      *          GET NON-ZERO               U6H03690
                          STO  L  ABSXX      SET ABS INDICATOR          U6H03700
                          LDX   1 31         CARD COL. 31 IN IR-1       U6H03710
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03720
                          BSI  L  C1000      CONVERT TO BINARY          U6H03730
                          STO  L  SNTRY+3    SAVE SECTOR ADDR.          U6H03740
                          SRA     12        ISOLATE DRIVE CODE     2-12 U6H03741
                          STO  L  $XR1       *AND SAVE IN IR-1     2-12 U6H03742
                          LD   L1 $FPAD     GET FILE PROTECT ADDR  2-12 U6H03745
                          BSC  L  MO555,Z   *AND BR IF PRESENT     2-12 U6H03746
                          LD   L  H5001     GET ILLEGAL CALL INDR  2-12 U6H03747
                          BSI  L  $PRET     *AND BR TO DISPLAY     2-12 U6H03748
                          MDX     MO640     EXIT TO SUPERVISOR     2-12 U6H03749
                    MO555 LDX   1 36        CD COL. 36 IN IR-1     2-12 U6H03750
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03760
                          BSI  L  C1000      CONVERT TO BINARY          U6H03770
                          STO  L  SNTRY+1    SAVE CORE ADDR.            U6H03780
                          LD   L  CL950      GET FULL SECTOR COUNT      U6H03790
                          STO  L  SNTRY+2    STORE                      U6H03800
                    MO560 LDX   1 19         CARD COL. 19 IN IR-1       U6H03810
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H03820
                          BSI  L  C1000      CONVERT TO BINARY          U6H03830
                          STO  L  PCHES      STORE NO. OF PCH. RECORDS  U6H03840
                          LD   L  CE920      SET RECORD CNT TO FIRST2-2 U6H03850
                          STO  L  CE910      STORE IN CKSUM ROUTINE     U6H03860
                          LD   L  BHXXX      GET B AND H CONSTANT       U6H03870
                          SLA     8          REMOVE B                   U6H03880
                          SRA     8          SHIFT H                    U6H03910
                          EOR  L  CDBUF+20   COMPARE TO CARD COL. 21    U6H03920
                    MO568 BSC  L  MO580,Z    NO BRANCH ON H             U6H03930
                          STO  L  BHIND      SET BIN/HEX IND. ZERO      U6H03940
                    MO570 BSI  L  R2000      READ HEX DATA RECORD       U6H03950
                          BSI  L  C2000      TEST VALIDITY AND CONVERT  U6H03960
                          MDX     MO600                                 U6H03970
                    MO580 LD   L  BHXXX      GET B AND H CONSTANT       U6H03980
                          SRA     8          SHIFT B                    U6H03990
                          EOR  L  CDBUF+20   COMPARE TO CARD COL. 21    U6H04000
                          BSI  L  EO010,Z    NO BRANCH ON B             U6H04010
                          LD      *          GET NON-ZERO               U6H04020
                          STO  L  BHIND      SET BIN/HEX IND.           U6H04030
                    MO590 BSI  L  R3000      READ BINARY RECORD         U6H04040
                          BSI  L  CE000      CHECK SUM                  U6H04050
                    MO600 NOP                NOP OR MDX   MO610         U6H04060
                          BSI  L  CL000      COMPUTE PATCH PARAMETERS   U6H04070
                          LDX  I1 CL900      GET DISKZ WD. CNT.         U6H04080
                          LDX  I2 CL900+1    GET DISKZ SECT. ADDR.      U6H04090
                          LD   L  GET00      GET DISKZ READ FUNCT.      U6H04100
                          BSI  L  R4000      READ SECTOR TO PATCH       U6H04110
                          BSI  L  CL500      PUT PATCH IN DISK BUFF.    U6H04140
                    *                        *PRINT PATCH INFO     2-12 U6H04142
                    *                        *EXIT ON USER REQUEST 2-12 U6H04144
                          LDX  I1 CL900      GET DISKZ WD. CNT.         U6H04170
                          LDX  I2 CL900+1    GET DISKZ SECT. ADDR.      U6H04180
                          LD   L  PU030      GET DISKZ WRITE FUNCTION   U6H04190
                          BSI  L  R4000      PCH. SECTOR TO PATCH       U6H04200
                    MO610 MDX  L  PCHES,-1   REDUCE PATCH COUNT         U6H04210
                          MDX     MO620      SKIP THIS INST. IF PCHES=0 U6H04220
                          LD   L  PCHCT      GET PCH HEADER COUNT       U6H04230
                          S    L  DEC01      REDUCE BY 1                U6H04240
                          STO  L  PCHCT      SAVE                   2-1 U6H04250
                          BSC  L  MO630,+-   BRANCH IF ZERO             U6H04260
                    MO615 BSI  L  R2000      READ A RECORD              U6H04270
                          BSI  L  R5000      PRINT IT               2-2 U6H04280
                          BSI  L  CH000      CHECK IT                   U6H04290
                          LD   L  MO500      LOAD ACC. WITH NOP         U6H04300
                          STO     MO600      SET PATCH SWITCH YES       U6H04310
                          BSC  L  MO510                                 U6H04320
                    MO620 LD   L  BHIND      GET B/H IND.               U6H04330
                          BSC     Z          SKIP ON HEX                U6H04340
                          MDX     MO590                                 U6H04350
                          MDX     MO570                                 U6H04360
                    MO630 BSI  L  R2000      READ // DEND CARD          U6H04370
                          LDX  L1 /7000      GET READ FUNCTION          U6H04380
                          BSI  L  R4500      READ DCOM TO DISK BUFFER   U6H04390
                          BSC  L  RY100      TEST FOR // DEND. EXIT     U6H04400
                    MO640 LDX   1 6          GET MESSAGE WD CNT    2-12 U6H04402
                          LDX  L2 MSG06      GET MESSAGE ADDR      2-12 U6H04404
                          BSI  L  PU000      PRINT MESSAGE         2-12 U6H04406
                          EXIT               EXIT TO SUPERVISOR    2-12 U6H04408
                          HDNG    *SUB CARD PROCESSING                  U6H04410
                    *                                                   U6H04420
                    *             CODE TO STORE RE-ENTRY PHASE OF       U6H04430
                    *             MODIF (PER SLET 18) ON DISK, SET      U6H04440
                    *             UP DCOM, AND CALL DUP                 U6H04450
                    *                                                   U6H04460
                    SR000 LDX   1 19         CARD COL. 19 IN IR-1       U6H04470
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H04480
                          BSI  L  C1000      CONVERT TO BINARY          U6H04490
                          BSI  L  EO010,+-   BRANCH IF ZERO             U6H04500
                          STO  L  MDF10      SAVE DCR COUNT             U6H04510
                    SR010 LDX  L1 /7000      GET READ FUNCTION          U6H04520
                          BSI  L  R4500      READ DCOM                  U6H04530
                          LD   L  MDF10      GET DCR COUNT              U6H04540
                          STO  L  #MDF1      UPDATE DCOM                U6H04550
                          LD      SR940      LOAD DUP-REENTRY ADDRESS   U6H04560
                          STO  L  #MDF2      SET MODIF RETURN FLAG      U6H04570
                          LDX  L1 /7001      GET WRITE FUNCTION         U6H04580
                          BSI  L  R4500      WRITE DCOM                 U6H04590
                    *                                                   U6H04600
                    SR020 LDD     SR920                                 U6H04610
                          BSI     SR040      WRITE MODIF TO DISK        U6H04620
                          LDD     SR930                                 U6H04630
                          BSI     SR040      READ DUP FROM DISK         U6H04640
                          MDX  L  SR910,2    ADD 2 TO SLET CORE ADDR.   U6H04650
                    SR030 NOP                                           U6H04660
                          NOP                                           U6H04670
                          BSC  I  SR910      TRANSFER TO DUP            U6H04680
                    *                                                   U6H04690
                    *             SUBROUTINE TO READ OR WRITE DISK      U6H04700
                    *             PER SLET ENTRY.  DISKZ RD/WR FUNCT.   U6H04710
                    *             IN A AND SLET ID IN Q.                U6H04720
                    *                                                   U6H04730
                    SR040 DC      0          ENTRY LINK                 U6H04740
                          STD     SR900      SAVE FUNCTION AND ID       U6H04750
                    * 1 INSTRUCTION REMOVED                        2-12 U6H04760
                          LD      SR910      GET SLET ID                U6H04770
                          BSI  L  SH000      SEARCH FOR SLET ENTRY      U6H04780
                          BSC     Z          SKIP ON HIT                U6H04790
                          WAIT               ERROR - NO ENTRY FOUND     U6H04800
                          LD      SR910      REFRESH SLET ID            U6H04810
                          EOR     SR930+1    COMPARE TO DUP SLET ID     U6H04820
                          BSC  L  SR050,Z    BRANCH IF MODIF ID         U6H04830
                          LD    2 1          GET CORE ADDRESS           U6H04840
                          STO     SR070+1                               U6H04850
                          STO     SR910      PUT DISKZ PARAMETER        U6H04860
                          MDX     SR060                                 U6H04870
                    SR050 LD      SR940                                 U6H04880
                          STO     SR910                                 U6H04890
                    SR060 LDD   2 2          GET WORD CNT. AND SECTOR   U6H04900
                    SR070 STD  L  RY000-2    STORE WORD COUNT SCTR ADDR U6H04910
                          LDD     SR900      GET DISKZ FUNCTION         U6H04920
                          BSI  L  DISKZ                                 U6H04930
                          LD   L  $DBSY                                 U6H04940
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H04950
                          BSC  I  SR040      RETURN TO MAINLINE         U6H04960
                          BSS  E  0                                     U6H04970
                    SR900 DC      *-*                                   U6H04980
                    SR910 DC      RY000-2                               U6H04990
                    SR920 DC      /7001                                 U6H05000
                          DC      /12                                   U6H05010
                    SR930 DC      /7000                                 U6H05020
                          DC      1                                     U6H05030
                    SR940 DC      RY000-2                               U6H05040
                          HDNG    I/O AND BUFFERS                       U6H05050
                    *                                                   U6H05060
                    *             SYSTEM I/O AND CONVERSION ROUTINE     U6H05070
                    *             AREAS AND BUFFERS.                    U6H05080
                    *                                                   U6H05090
                          BSS  E  2          WORD COUNT AND SECT. ADR.  U6H05100
                    PRNTR BSS     300        AREA FOR PRINT ROUTINE     U6H05110
                    *                                                   U6H05120
                          BSS  E  2          WORD COUNT AND SECT. ADR.  U6H05130
                    CDPTR BSS     400        AREA FOR I/O-CONVERSION    U6H05140
                    *                                                   U6H05150
                          BSS  E  2                                     U6H05160
                    DSKIN BSS     640        DISK INPUT BUFFER     2-12 U6H05170
                    PRBUF DC      *-*        WD CNT FOR PR BUFFER  2-12 U6H05172
                          BSS     132        PRINT BUFFER          2-12 U6H05174
                    BINBF BSS     108                                   U6H05180
                    *                                                   U6H05190
                    *             EQUATES                               U6H05200
                    *                                                   U6H05210
                    SLET0 EQU     DSKIN-4                               U6H05220
                    #SYSC EQU     DSKIN+320+8                           U6H05230
                    #MDF1 EQU     DSKIN+320+13                          U6H05240
                    #MDF2 EQU     DSKIN+320+14                          U6H05250
                    #PIOD EQU     DSKIN+320+25                          U6H05260
                    CONVR EQU     CDPTR+174                         2-5 U6H05280
                    *                                                   U6H05290
                          HDNG    READ/SEARCH-SLET                      U6H05300
                    *                                                   U6H05310
                    *             SUBROUTINE TO READ SLET INTO          U6H05320
                    *             THE DISK BUFFER                       U6H05330
                    *                                                   U6H05340
                    R1000 DC      0          ENTRY LINK                 U6H05350
                          LDX  L1 640        GET WORD COUNT        2-12 U6H05360
                          STX  L1 DSKIN-2    STORE                      U6H05370
                    R1050 LDX  L1 *-*        GET SECTOR ADDR       2-12 U6H05380
                          STX  L1 DSKIN-1    STORE                      U6H05390
                          LDD  L  R4950      GET DISKZ PARAMETERS       U6H05400
                          BSI  L  DISKZ      READ SLET IN               U6H05410
                          LD   L  $DBSY                                 U6H05420
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H05430
                          BSC  I  R1000      RETURN TO MAINLINE         U6H05440
                    *                                                   U6H05450
                    *             SUBROUTINE TO SEARCH SLET FOR ID SET  U6H05460
                    *             IN ACCUMULATOR. IF ID IS FOUND, THE   U6H05470
                    *             CORE ADDRESS OF THE SLET ENTRY IS     U6H05480
                    *             SET IN INDEX REG. 2 AND THE ACCUM.    U6H05490
                    *             IS ZEROED OUT. IF THERE IS NO HIT     U6H05500
                    *             THE ACCUM. RETAINS THE ID.            U6H05510
                    *                                                   U6H05520
                    SH000 DC      0          ENTRY LINK                 U6H05530
                          LDX  L2 320        SET POINTER           2-12 U6H05540
                          STO     SH900      SAVE ID                    U6H05550
                          BSC     +-         SKIP ON NON-ZERO           U6H05560
                          WAIT              ERROR - (ZERO ID)           U6H05570
                          LDX   1 3          SETUP 1ST SECTOR ADDR 2-12 U6H05572
                          STX   1 R1050+1    *OF SLET IN R1000     2-12 U6H05574
                    SH005 BSI     R1000      READ A SLET SECTOR    2-12 U6H05576
                          LD      SH900      GET PHASE ID          2-12 U6H05578
                    SH010 EOR  L2 SLET0      COMPARE SLET TO ID         U6H05580
                          BSC  L  SH030,+-   BRANCH ON HIT              U6H05590
                          LD      SH900      REFRESH ID                 U6H05600
                          MDX   2 -4         DECREMENT POINTER          U6H05610
                          MDX     SH010      BACK TO SEARCH SOME MORE   U6H05620
                          LD      R1050+1    DETERMINE IF ALL SLET 2-12 U6H05622
                          S       SH905      *SECTORS SEARCHED     2-12 U6H05624
                          BSC  L  SH025,Z+   BR IF NOT             2-12 U6H05625
                          LD      SH900      NO HIT - GET ID            U6H05630
                    SH020 BSC  I  SH000      RETURN TO MAINLINE         U6H05640
                    SH025 MDX  L  R1050+1,1  INCR SLET SECTOR ADDR 2-12 U6H05642
                          NOP                IN CASE OF SKIP       2-12 U6H05644
                          LDX  L2 320        RESET POINTER         2-12 U6H05645
                          MDX     SH005      BR TO CONTINUE SEARCH 2-12 U6H05646
                    SH030 STX   2 SH040+1    STORE IR-2                 U6H05650
                          LD      SH010+1    GET SLET BASE ADDRESS      U6H05660
                          A       SH040+1    ADD POINTER                U6H05670
                          STO     SH040+1    STORE CORE ADDR. OF ENTRY  U6H05680
                    SH040 LDX  L2 *-*        LOAD IR-2 WITH ENTRY ADR.  U6H05690
                          SLA     16         CLEAR ACCUMULATOR          U6H05700
                          MDX     SH020                                 U6H05710
                    SH900 DC      0          ID SAVE WORD               U6H05720
                    SH905 DC      5          LAST SECTOR OF SLET   2-12 U6H05724
                          HDNG    READ                                  U6H05730
                    *                                                   U6H05740
                    *             SUBROUTINE TO READ NON-BINARY         U6H05750
                    *             RECORDS (CARD OR PAPER TAPE) AND      U6H05760
                    *             CONVERT TO UNPACKED EBCDIC IN         U6H05770
                    *             THE MCRA BUFFER (CDBUF).              U6H05780
                    *                                                   U6H05790
                    R2000 DC      0          ENTRY LINK                 U6H05800
                          LD      R2920      GET WORD COUNT             U6H05810
                          STO  L  CDBUF-1    STORE                      U6H05820
                          LD   L  $LAST      GET LAST CD. IND.          U6H05830
                          BSC  L  R2010,+-   NO BRANCH IF ON            U6H05840
                          LDD     R2910      GET FEED PARAMETERS        U6H05850
                          BSI  L  CDPTR+1    FEED RECORD                U6H05860
                    R2010 LDD     R2900      GET READ PARAMETERS        U6H05870
                          BSI  L  CDPTR+1    READ RECORD                U6H05880
                          LD   L  $IBSY      GET BUSY INDICATOR         U6H05890
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H05900
                          LD   L  PTIND      GET PT INDICATOR           U6H05910
                          BSC  L  R2020,+Z   BRANCH IF PAPER TAPE       U6H05920
                          LD      R2900+1    GET CONVERSION PARAM.      U6H05930
                          BSI  L  CONVR+1    CONVERT CARD INPUT         U6H05940
                    R2020 BSC  I  R2000      RETURN TO MAINLINE         U6H05950
                          BSS  E  0                                     U6H05960
                    R2900 DC      /7002                                 U6H05970
                          DC      CDBUF-1                               U6H05980
                    R2910 DC      /7003                                 U6H05990
                    R2920 DC      80                                    U6H06000
                          HDNG    PRINT A *MON OR *SUB RECORD           U6H06010
                    *             SUBROUTINE TO PRINT THE CONTENTS  2-2 U6H06020
                    *             OF MCRA BUFFER.                   2-2 U6H06030
                    *                                               2-2 U6H06040
                    R5000 DC      *-*        ENTRY POINT            2-2 U6H06050
                          LD      R5970      GET WORD COUNT         2-2 U6H06060
                          STO  L  PRBUF      *AND STORE             2-2 U6H06070
                          LDX   2 0          SET POINTER            2-2 U6H06080
                          LDX   1 -80        SET POINTER            2-2 U6H06090
                    R5010 LD   L1 CDBUF+80   GET FIRST OF TWO       2-2 U6H06100
                          SLA     8          MOVE LEFT TO GET       2-2 U6H06110
                          OR   L1 CDBUF+81   *TWO EBCDIC PER WORD   2-2 U6H06120
                          STO  L2 PRBUF+1    STORE IN PRINT BUFFER  2-2 U6H06130
                          MDX   2 1          INCREMENT POINTER      2-2 U6H06140
                          MDX   1 2          INCREMENT POINTER      2-2 U6H06150
                          MDX     R5010      CONTINUE PACKING       2-2 U6H06160
                    *                                               2-2 U6H06170
                          LD   I  $CH12      IS CHANNEL 12 SENSED   2-2 U6H06180
                          BNZ     R5030      *BR IF YES             2-2 U6H06190
                    R5020 LD      R5960      GET SPACE ONE LINE     2-2 U6H06200
                          BSI  L  PRNTR+1    *CODE, AND SPACE       2-2 U6H06210
                          LDD     R5910      GET PRINT FUNCTION     2-2 U6H06220
                          BSI  L  PRNTR+1    PRINT ONE LINE         2-2 U6H06230
                          MDX  L  $PBSY,0    PRINTER BUSY           2-2 U6H06240
                          MDX     *-3        *YES GO BACK AND TEST  2-2 U6H06250
                          BSC  I  R5000      *NO, RETURN            2-2 U6H06260
                    *                                               2-2 U6H06270
                    R5030 LD      R5950      GET HDNG SCTR ADDR     2-2 U6H06280
                          STO     R5931      PUT IN HDNG I/O AREA   2-2 U6H06290
                          LDD     R5920      GET READ FUNCTION      2-2 U6H06300
                          BSI  L  DISKZ      READ HDNG SCTR         2-2 U6H06310
                          MDX  L  $DBSY,0    READ COMPLETE          2-2 U6H06320
                          MDX     *-3        *NO, GET BACK AND TEST 2-2 U6H06330
                    *                                               2-2 U6H06340
                          LD      R5930      *YES, PUT WC OF HDNG   2-2 U6H06350
                          STO     R5931      *BUFF IN HDNG I/O AREA 2-2 U6H06360
                          LDD     R5940      GET SKIP FUNCTION      2-2 U6H06370
                          BSI  L  PRNTR+1    RESTORE                2-2 U6H06380
                          BSI  L  PRNTR+1    PRINT HDNG             2-2 U6H06390
                          MDX  L  $PBSY,0    PRINTER BUSY           2-2 U6H06400
                          MDX     *-3        *YES ,GO BACK AND TEST 2-2 U6H06410
                          LD      R5960      GET SPACE ONE LINE     2-2 U6H06420
                          BSI  L  PRNTR+1    *FUNCTION AND PERFORM  2-2 U6H06430
                          B       R5020      GO TO PRINT A LINE     2-2 U6H06440
                          BSS  E                                    2-2 U6H06450
                    R5910 DC      /7001      PRINT FUNCTION         2-2 U6H06460
                          DC      PRBUF      BUFFER ADDR            2-2 U6H06470
                    R5920 DC      /7000      READ DISK FUNCTION     2-2 U6H06480
                          DC      R5930      ADDR OF WC             2-2 U6H06490
                    R5930 DC      10         WC OF HDNG BUFFER      2-2 U6H06500
                    R5931 DC      *-*        SCTR ADDR OR WC        2-2 U6H06510
                          BSS     10         HDNG BUFFER            2-2 U6H06520
                    R5940 DC      /7000      RESTORE FUNCTION       2-2 U6H06530
                          DC      R5931      ADDR OF WC FOR HDNG BUF2-2 U6H06540
                    R5950 DC      7          HDNG SCTR ADDR         2-2 U6H06550
                    R5960 DC      /7002      SPACE ONE LINE FUNCTION2-2 U6H06560
                    R5970 DC      40         PRINT BUFFER WORD CNT  2-2 U6H06570
                          HDNG    CONTROL-RECORD-CHECK                  U6H06580
                    *                                                   U6H06590
                    *             SUBROUTINE TO CHECK RECORD IN         U6H06600
                    *             MCRA BUFFER FOR VALIDITY              U6H06610
                    *                                                   U6H06620
                    CH000 DC      0          ENTRY LINK                 U6H06630
                          LD   L  $CTSW      GET MCR SWITCH             U6H06640
                          BSI  L  EO060,Z    BRANCH IF MCR WAS READ     U6H06650
                          LDD  L  CDBUF      GET FIRST 2 CHARACTERS     U6H06660
                          SLT     8                                     U6H06670
                          SRA     8          PACK                       U6H06680
                          SLT     8                                     U6H06690
                          EOR  L  CH910      COMPARE TO *M              U6H06700
                          BSC     Z          SKIP IF OK                 U6H06710
                          MDX     CH010                                 U6H06720
                          LDD  L  CDBUF+2    GET NEXT 2 CHARS.          U6H06730
                          SLT     8                                     U6H06740
                          SRA     8          PACK                       U6H06750
                          SLT     8                                     U6H06760
                          EOR  L  CH910+1    COMPARE TO ON              U6H06770
                          BSC     Z          SKIP IF OK                 U6H06780
                          MDX     CH020                                 U6H06790
                          BSC  I  CH000      RETURN TO MAINLINE         U6H06800
                    CH010 LDD  L  CDBUF      GET FIRST 2 CHARS.         U6H06810
                          SLT     8                                     U6H06820
                          SRA     8          PACK                       U6H06830
                          SLT     8                                     U6H06840
                          EOR  L  CH900      COMPARE TO *S              U6H06850
                          BSC     Z          SKIP IF OK                 U6H06860
                          MDX     CH020                                 U6H06870
                          LDD  L  CDBUF+2    GET NEXT 2 CHARS.          U6H06880
                          SLT     8                                     U6H06890
                          SRA     8          PACK                       U6H06900
                          SLT     8                                     U6H06910
                          EOR  L  CH900+1    COMPARE TO UB              U6H06920
                          BSC     Z          SKIP IF OK                 U6H06930
                          MDX     CH020                                 U6H06940
                          LD      *          GET NON-ZERO               U6H06950
                          STO  L  SUBXX      SET SUB INDICATOR          U6H06960
                          MDX     CH010-2    EXIT                       U6H06970
                    CH020 BSI  L  EO010      INVALID HEADER             U6H06980
                    *                                               2-2 U6H06990
                    *             CONSTANTS                         2-2 U6H07000
                    *                                               2-2 U6H07010
                    CH900 EBC     .*SUB.                                U6H07020
                    CH910 EBC     .*MON.                                U6H07030
                    CH920 BSS  E  2          SAVE OF A AND Q REG    2-2 U6H07040
                    CH930 DC      /C700      G IN EBCDIC            2-2 U6H07050
                    CH940 DC      /D900      R IN EBCDIC            2-2 U6H07060
                    CH945 DC      /F000      0 IN EBCDIC            2-2 U6H07070
                    CH950 DC      *-*        TYPE PRESSENTLY PROC   2-2 U6H07080
                    CH960 DC      /00F0      CONST FOR MASK IN ZERO 2-2 U6H07090
                    CH970 DC      2          GENERAL TEMP FIX       2-2 U6H07100
                    CH980 DC      1          RESTRICTED TEMP FIX    2-2 U6H07110
                    *                                               2-2 U6H07120
                    *             THIS SUBROUTINE WILL CHECK        2-2 U6H07130
                    *             THE TYPE OF THE FIX.              2-2 U6H07140
                    *             IT WILL SET TPFIX=0 IF SYSTEM UPD 2-2 U6H07150
                    *                              =1 IF RESTRICTED 2-2 U6H07160
                    *                              =2 IF GENERAL.   2-2 U6H07170
                    *             IT ALSO CHECKS FOR CONSISTENCY    2-2 U6H07180
                    *             OF TYPE IN A JOB.                 2-2 U6H07190
                    *                                               2-2 U6H07200
                    CH100 DC      *-*                               2-2 U6H07210
                          STO     CH920      SAVE A                 2-2 U6H07220
                          SLT     8          SEPARATE TEMP FIX AND  2-2 U6H07230
                          SLA     8          *AND MOD LEVEL         2-2 U6H07240
                          OR      CH960      GET ZERO  AT THE END   2-2 U6H07250
                          STO     CH920+1                           2-2 U6H07260
                          XCH                GET TEMP FIX INDIC     2-2 U6H07270
                          STO     CH950      *AND SANE              2-2 U6H07280
                          S       CH930      IS IT GENERAL TEMP FIX 2-2 U6H07290
                          BZ      CH160      *BR IF YES             2-2 U6H07300
                          LD      CH950      GET TEMP FIX INDIC     2-2 U6H07310
                          S       CH940      IS IT RESTRICTED FIX   2-2 U6H07320
                          BZ      CH170      *BR IF YES             2-2 U6H07330
                          LD      CH950      GET TEMP FIX           2-2 U6H07340
                          S       CH945      IS IT SYSTEM UPDATE    2-2 U6H07350
                          BSI  L  EO010,Z    *BR IF NOT             2-2 U6H07360
                    *                                               2-2 U6H07370
                    *             SYSTEM UPDATE PROCESSING          2-2 U6H07380
                    *                                               2-2 U6H07390
                          A    L  TPFIX      IS IT SAME TYPE        2-2 U6H07400
                          BSI  L  EO140,-Z   BR IF NO               2-2 U6H07410
                          SLA     16         GET SYSTEM UPDATE TYPE 2-2 U6H07420
                    *                                               2-2 U6H07430
                    *             COMMON EXIT PROCESSING            2-2 U6H07440
                    *                                               2-2 U6H07450
                    CH150 STO  L  TPFIX      SET FIX TYPE           2-2 U6H07460
                          LDD     CH920      RESTORE A AND Q        2-2 U6H07470
                          BSC  I  CH100      RETURN                 2-2 U6H07480
                    *                                               2-2 U6H07490
                    *             GENERAL FIX PROCESSING            2-2 U6H07500
                    *                                               2-2 U6H07510
                    CH160 LD   L  TPFIX      GET PREVIOUS FIX INDIC 2-2 U6H07520
                          BSI  L  EO140,+-   BR IF INCONSISTENT TYPE2-2 U6H07530
                          LD      CH970      GET GENERAL FIX TYPE   2-2 U6H07540
                          B       CH150                             2-2 U6H07550
                    *                                               2-2 U6H07560
                    *             RESTRICTED FIX PROCESSING         2-2 U6H07570
                    *                                               2-2 U6H07580
                    CH170 LD   L  TPFIX      GET PREVIOUS FIX INDIC 2-2 U6H07590
                          BSI  L  EO140,+-   BR IF INCONSISTENT TYPE2-2 U6H07600
                          LD      CH980      GET RESTRICTED FIX TYPE2-2 U6H07610
                          B       CH150                             2-2 U6H07620
                          HDNG    BINARY-READ                           U6H07630
                    *                                                   U6H07640
                    *             SUBROUTINE TO READ BINARY RECORDS     U6H07650
                    *             (CARDS OR PAPER TAPE) AND PACK        U6H07660
                    *             INTO BINBF.                           U6H07670
                    *                                                   U6H07680
                    R3000 DC      0          ENTRY LINK                 U6H07690
                          LD   L  PTIND      GET PT INDICATOR           U6H07700
                          BSC  L  R3030,+Z   BRANCH IF PAPER TAPE       U6H07710
                          LD      *-1        GET NEG. VALUE             U6H07720
                          STO  L  PTIND      SET IND. TO SUPRESS CONV.  U6H07730
                          BSI  L  R2000      READ A CARD                U6H07740
                          SLA     16         CLEAR ACCUMULATOR          U6H07750
                          STO  L  PTIND      RESET PT INDICATOR         U6H07760
                    *                                                   U6H07770
                    *             FOLLOWING CODE PACKS 72 CARD          U6H07780
                    *             COLUMNS IN CDBUF TO 54 WORDS IN       U6H07790
                    *             BINBF.                                U6H07800
                    *                                                   U6H07810
                          LDX   1 2          A AND Q CONTENTS           U6H07820
                          LDX   2 -54                                   U6H07830
                    R3010 LDD  L1 CDBUF       223X  333X                U6H07840
                          SRA     4           X223  333X                U6H07850
                          RTE     20          3333  XX22                U6H07860
                          STO  L2 BINBF+56                              U6H07870
                          SLT     8           33XX  22XX                U6H07880
                          LD   L1 CDBUF-1     122X  22XX                U6H07890
                          SRA     4           X122  22XX                U6H07900
                          RTE     24          2222  XXX1                U6H07910
                          STO  L2 BINBF+55                              U6H07920
                          SLT     12          2XXX  1XXX                U6H07930
                          LD   L1 CDBUF-2     111X  1XXX                U6H07940
                          SRA     4           X111  1XXX                U6H07950
                          RTE     28          1111  XXXX                U6H07960
                          STO  L2 BINBF+54                              U6H07970
                          MDX   1 4                                     U6H07980
                          MDX   2 3                                     U6H07990
                          MDX     R3010                                 U6H08000
                    *                                                   U6H08010
                    R3020 BSC  I  R3000      RETURN TO MAINLINE         U6H08020
                    R3030 LD   L  DEC01      GET DECIMAL 1              U6H08030
                          STO  L  BINBF-1    STORE FRAME COUNT          U6H08040
                    R3040 LDD     R3900      GET READ PARAMETERS        U6H08050
                          BSI  L  CDPTR+1    READ 1 FRAME               U6H08060
                          LD   L  $IBSY      GET BUSY INDICATOR         U6H08070
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H08080
                          LD   L  BINBF      GET WORD COUNT             U6H08090
                          SRA     7          DUBBLE WC AND SHIFT RIGHT  U6H08100
                          S       R3920      SUBTRACT MAX. COUNT        U6H08110
                          BSC  L  R3040,Z-   BRANCH IF COUNT TOO HIGH   U6H08120
                          A       R3920      RESTORE WC                 U6H08130
                          STO  L  BINBF-1    STORE FRAME COUNT          U6H08140
                    *                                                   U6H08150
                          LDX   1 108                                   U6H08160
                          SLT     32                                    U6H08170
                    R3050 STD  L1 BINBF-2    CLEAR BUFFER               U6H08180
                          MDX   1 -2                                    U6H08190
                          MDX     R3050                                 U6H08200
                    *                                                   U6H08210
                          LDD     R3900      GET READ PARAMETERS        U6H08220
                          BSI  L  CDPTR+1    READ RECORD                U6H08230
                          LD   L  $IBSY      GET BUSY INDICATOR         U6H08240
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H08250
                          LDX   1 0                                     U6H08260
                          LDX   2 -54                                   U6H08270
                    R3060 LDD  L1 BINBF      GET UNPACKED FRAMES        U6H08280
                          SRA     8          PACK                       U6H08290
                          SLT     8          SHIFT                      U6H08300
                          STO  L2 BINBF+54   STORE PACKED FRAMES        U6H08310
                          MDX   1 2                                     U6H08320
                          MDX   2 1                                     U6H08330
                          MDX     R3060                                 U6H08340
                          MDX     R3020      EXIT                       U6H08350
                          BSS  E  0                                     U6H08360
                    R3900 DC      /7000                                 U6H08370
                          DC      BINBF-1                               U6H08380
                    R3910 DC      2                                     U6H08390
                    R3920 DC      108                                   U6H08400
                          HDNG    CHECKSUM                              U6H08410
                    *                                                   U6H08420
                    *             SUBROUTINE TO EVALUATE CHECK SUM      U6H08430
                    *             AND RECORD TYPE VALIDITY.  RECORD     U6H08440
                    *     COUNT FOR THE FIRST RECORD IS COMPUTED        U6H08450
                    *     AS THE RESIDUE IN THE FIRST COMPUTED          U6H08460
                    *     CHECKSUM.                                     U6H08470
                    *                                                   U6H08480
                    CE000 DC      0          ENTRY LINK                 U6H08490
                          LD   L  H0F00      GET TYPE MASK              U6H08500
                          AND  L  BINBF+2    GET TYPE                   U6H08510
                          EOR  L  H0A00      COMPARE                    U6H08520
                          BSI  L  EO020,Z    BRANCH IF NOT TYPE A       U6H08530
                          LD   L  BINBF+1    GET CHECK SUM              U6H08540
                          BSC     +-         SKIP IF NON-ZERO           U6H08550
                          MDX     CE020                                 U6H08560
                    *                                                   U6H08570
                    *             ROUTINE TO COMPUTE CHECK SUM          U6H08580
                    *                                                   U6H08590
                          LDX   1 -54                                   U6H08600
                          SLA     16         CLEAR A                    U6H08610
                    CE010 A    L1 BINBF+54   ADD BINARY WORD            U6H08620
                          BSC     C          SKIP ON NO CARRY           U6H08630
                          A       CE900      ADD ONE                    U6H08640
                          MDX   1 1          INCREMENT IR-1             U6H08650
                          MDX     CE010      CONTINUE FOR 54 WORDS      U6H08660
                          MDX  L  CE910,1    ADD 1 TO REC. COUNT        U6H08670
                          MDX     CE030      NOT FIRST CARD         2-2 U6H08680
                          EOR     CE920      CONVERT TO POSITIV     2-2 U6H08690
                          A       CE900      *NUMBER                2-2 U6H08700
                          STO     CE910      FIRST CARD SET REC CNT 2-2 U6H08710
                          STO     CE930      SAVE FIRST RECORD NUMB 2-2 U6H08720
                    CE020 BSC  I  CE000      RETURN TO MAINLINE         U6H08730
                    CE030 A       CE910      ADD RECORD COUNT           U6H08740
                          BSI  L  EO020,Z    BRANCH ON NON-ZERO         U6H08750
                          MDX     CE020      BR TO RETURN           2-2 U6H08760
                    CE900 DC      1                                     U6H08770
                    CE910 DC      -1         RECORD COUNT NEG FIRST 2-2 U6H08780
                    CE920 DC      /FFFF      MASK                   2-2 U6H08790
                    CE930 DC      *-*        NUMBER OF FIRST RECORD 2-2 U6H08800
                          HDNG    SUBROUTINES MOVED                     U6H08810
                    ***********************************************2-12 U6H08820
                    * SUBROUTINES CL000 AND CL500 MOVED            2-12 U6H08830
                    ***********************************************2-12 U6H08840
                    *                                              2-12 U6H08850
                          HDNG    EBCDIC-BINARY-CONVERSION              U6H09570
                    *                                                   U6H09580
                    *             SUBROUTINE TO CONVERT 4 PACKED        U6H09590
                    *             EBCDIC CHARACTERS IN A AND Q TO       U6H09600
                    *             A BINARY WORD IN THE ACCUMULATER.     U6H09610
                    *                                                   U6H09620
                    C1000 DC      0          ENTRY LINK                 U6H09630
                          STX   1 C1050+1    SAVE IR-1                  U6H09640
                          STX   2 C1060+1    SAVE IR-2                  U6H09650
                          STO  L  PB901      SAVE 2 LEFT DIGITS         U6H09660
                          SLT     8          SHIFT AND SPLIT DIGITS     U6H09670
                          SLA     8                                     U6H09680
                          STD  L  PB901+2    SAVE 2 RIGHT DIGITS        U6H09690
                          LD   L  PB901      PICK UP 2 LEFT DIGITS      U6H09700
                          SRT     16         SHIFT AND SPLIT DIGITS     U6H09710
                          SLT     8                                     U6H09720
                          SLA     8                                     U6H09730
                          STD  L  PB901      SAVE 2 LEFT DIGITS         U6H09740
                          LDX   2 4                                     U6H09750
                    C1010 LDX   1 17                                    U6H09760
                    C1020 LD   L1 PB900-2    GET TABLE VALUE            U6H09770
                          SRA     8                                     U6H09780
                          SLA     8                                     U6H09790
                          EOR  L2 PB901-1    COMPARE TO BUFFER          U6H09800
                          BSC  L  C1030,+-   BRANCH ON HIT              U6H09810
                          MDX   1 -1                                    U6H09820
                          MDX     C1020      CONTINUE SCAN              U6H09830
                          MDX     C1070      CHARACTER NOT FOUND        U6H09840
                    C1030 LD   L1 PB900-2    GET TABLE VALUE            U6H09850
                          SLA     8          REMOVE EBCDIC              U6H09860
                          SRA     8                                     U6H09870
                          STO  L2 PB901-1    STORE DEC. EQUIV.          U6H09880
                          MDX   2 -1                                    U6H09890
                          MDX     C1010                                 U6H09900
                          LDX   2 4          INITIALIZE IR-1            U6H09910
                    C1040 SRT     4          SHIFT DIGITS TO RIGHT      U6H09920
                          LD   L2 PB901-1    GET DECIMAL DIGITS         U6H09930
                          MDX   2 -1                                    U6H09940
                          MDX     C1040                                 U6H09950
                          SLT     12         POSITION DECIMAL VALUE     U6H09960
                    C1050 LDX  L1 *-*        RESTORE IR-1               U6H09970
                    C1060 LDX  L2 *-*        RESTORE IR-2               U6H09980
                          BSC  I  C1000      RETURN TO MAINLINE         U6H09990
                    C1070 BSI  L  EO010      INVALID EBCDIC CHAR.       U6H10000
                          HDNG    PACKR                                 U6H10010
                          MDX     C1050      EXIT                       U6H10020
                    *                                                   U6H10030
                    *             SUBROUTINE TO GET 4 UNPACKED EBCDIC   U6H10040
                    *             CHARACTERS FROM THE MCRA BUFFER       U6H10050
                    *             AND PACK THEM IN A AND Q.  IR-1       U6H10060
                    *             MUST CONTAIN THE CARD COLUMN OF       U6H10070
                    *             THE LOW ORDER DIGIT.                  U6H10080
                    *                                                   U6H10090
                    PK000 DC      0          ENTRY LINK                 U6H10100
                          LD   L1 CDBUF-2    GET EBCDIC CHAR. 2         U6H10110
                          SLA     8                                     U6H10120
                          OR   L1 CDBUF-1    GET EBCDIC CHAR. 1         U6H10130
                          RTE     16         PUT 2 CHARS. IN Q          U6H10140
                          LD   L1 CDBUF-4    GET EBCDIC CHAR. 4         U6H10150
                          SLA     8                                     U6H10160
                          OR   L1 CDBUF-3    GET EBCDIC CHAR. 3         U6H10170
                          BSC  I  PK000      RETURN TO MAINLINE         U6H10180
                          HDNG    HEXDATA-BINARY-CONVERSION             U6H10190
                    *                                                   U6H10200
                    *             SUBROUTINE TO CONVERT HEX DATA CARD   U6H10210
                    *             IN CDBUF TO BINARY RECORD IN BINBF    U6H10220
                    *             AND CHECK ITS VALIDITY                U6H10230
                    *                                                   U6H10240
                    C2000 DC      0          ENTRY LINK                 U6H10250
                    *                                                   U6H10260
                    *             FOLLOWING CODE SCANS FROM TOP OF      U6H10270
                    *             MCRA BACK TO FIRST NON-BLANK CHAR.    U6H10280
                    *                                                   U6H10290
                          LDX   1 72         INITIALIZE IR-1        2-1 U6H10300
                    C2010 LD   L  H0040      GET BLANK CHAR.            U6H10310
                          EOR  L1 CDBUF-1    COMPARE TO INPUT BUFFER    U6H10320
                          BSC  L  C2020,Z    BRANCH IF NOT BLANK        U6H10330
                          MDX   1 -1                                    U6H10340
                          MDX     C2010                                 U6H10350
                    C2020 STX  L1 DVDND      SAVE CARD COL.             U6H10360
                    *                                                   U6H10370
                          BSI  L  TE000      TEST VALIDITY OF DATA      U6H10380
                    C2030 LDX   1 4          CARD COL. 4 IN IR-1        U6H10390
                          BSI  L  PK000      GET EBCDIC IN A AND Q      U6H10400
                          BSI  L  C1000      CONVERT TO BINARY          U6H10410
                          STO  L  BINBF      STORE ADDRESS              U6H10420
                          SLA     16         CLEAR ACCUMULATOR          U6H10430
                          LDX   1 8                                     U6H10440
                    C2040 STO  L1 BINBF      ZERO WORDS 2-9             U6H10450
                          MDX   1 -1                                    U6H10460
                          MDX     C2040                                 U6H10470
                    C2050 LD   L  DVDND      GET LAST DATA CARD COL.    U6H10480
                          A    L  DEC01      ADD ONE                    U6H10490
                          SRT     16         POSITION DIVIDEND          U6H10500
                          D    L  DEC05      DIVIDE BY 5                U6H10510
                          S    L  DEC01      SUBTRACT 1                 U6H10520
                          OR   L  H0A00      ADD TYPE CODE              U6H10530
                          STO  L  BINBF+2    STORE TYPE AND COUNT       U6H10540
                          LDX   2 13         MAX NUMBER HEX WORD    2-1 U6H10550
                          LDX   1 69         LAST ALLOWED COLUMN    2-1 U6H10560
                    C2060 BSI  L  PK000      GET EBCDIC IN A AND Q      U6H10570
                          BSI  L  C1000      CONVERT TO BINARY          U6H10580
                          STO  L2 BINBF+8    STORE IN BIN BUFFER        U6H10590
                          MDX   1 -5                                    U6H10600
                          MDX   2 -1                                    U6H10610
                          MDX     C2060                                 U6H10620
                          BSC  I  C2000      RETURN TO MAINLINE         U6H10630
                          HDNG    HEXDATACARD-TEST                      U6H10640
                    *                                                   U6H10650
                    *             SUBROUTINE TO TEST HEX DATA CARD      U6H10660
                    *             VALIDITY. 4 HEX FOLLOWED BY BLANK     U6H10670
                    *             AND SO ON. IR-1 MUST CONTAIN          U6H10680
                    *             THE CARD COL. OF LOW ORDER DIGIT.     U6H10690
                    *                                                   U6H10700
                    TE000 DC      0           ENTRY LINK                U6H10710
                    TE010 LDX   2 4                                     U6H10720
                          STX  L2 CTR04      SET TO COUNT 4 DIGITS      U6H10730
                    TE020 LDX   2 16         SET IR-2 WITH TABLE COUNT  U6H10740
                    TE030 LD   L2 PB900-1    GET TABLE CHARACTER        U6H10750
                          SRA     8                                     U6H10760
                    TE040 EOR  L1 CDBUF-1    COMPARE TO INPUT DIGIT     U6H10770
                          BSC  L  TE050,+-   BRANCH ON HIT              U6H10780
                          MDX   2 -1         DECR.  TABLE POINTER       U6H10790
                          MDX     TE030                                 U6H10800
                          BSI  L  EO030      BRANCH IF NOT IN TABLE     U6H10810
                    TE050 MDX   1 -1         MOVE ONE CARD  COL.        U6H10820
                          MDX     TE060                                 U6H10830
                          MDX  L  CTR04,-1   LAST HEX CHAR. OF 4    2-1 U6H10840
                          MDX     TE070      NO                         U6H10850
                          BSC  I  TE000      YES, BACK TO HXB00         U6H10860
                    TE060 MDX  L  CTR04,-1   SKIP ON 4 TH REDUCTION     U6H10870
                          MDX     TE020                                 U6H10880
                          LD   L  H0040      GET HEX BLANK CHAR.        U6H10890
                          EOR  L1 CDBUF-1    COMPARE TO CARD COL.       U6H10900
                          BSI  L  EO030,Z    BRANCH ON NON BLANK        U6H10910
                          MDX   1 -1         MOVE ONE CARD COL.         U6H10920
                          MDX     TE010                                 U6H10930
                    TE070 BSI  L  EO030      FIRST CHAR. A BLANK        U6H10940
                          HDNG    ERROR ROUTINES                        U6H10950
                    *                                                   U6H10960
                    *             ERROR ROUTINES                        U6H10970
                    *                                                   U6H10980
                    EO010 DC      0          ENTRY LINK ERROR 1         U6H10990
                          SLT     32         CLEAR A AND Q              U6H11000
                          LDX   1 1          GET ERROR NUMBER           U6H11010
                          BSI     EO005      PRINT ERROR MSG.           U6H11020
                          WAIT                                          U6H11030
                          BSI     EO000      GET BIT SWITCH READING     U6H11040
                          BSC     -          SKIP IF SWITCH 0 ON        U6H11050
                          MDX     EO011                                 U6H11060
                          MDX     EO003      EXIT TO SUP                U6H11070
                    EO011 BSC  L  MO615      GO TO READ NEW HEADER      U6H11080
                    *                                                   U6H11090
                    EO020 DC      0          ENTRY LINK ERROR 2         U6H11100
                          RTE     16         SAVE CKSUM DIFFERENCE      U6H11110
                          LD   L  CE910      GET RECORD COUNT +1        U6H11120
                          S    L  CE930      COMPUTE NUMBER OF      2-2 U6H11130
                          A    L  CE900      *PROCESSED RECORDS     2-2 U6H11140
                          RTE     16         SWAP A AND Q               U6H11150
                          LDX   1 2          GET ERROR NUMBER           U6H11160
                          BSI     EO005      PRINT ERROR MSG.           U6H11170
                          WAIT                                          U6H11180
                          BSI     EO000      GET BIT SWITCH READING     U6H11190
                          BSC     E          NO SKIP IF 15 ON           U6H11200
                          MDX     EO021                                 U6H11210
                          BSC     -          SKIP IF SWITCH 0 ON        U6H11220
                          MDX     EO022                                 U6H11230
                          MDX     EO003      EXIT TO SUP                U6H11240
                    EO021 LD   L  CE910                             2-7 U6H11242
                          S    L  CE900                             2-7 U6H11244
                          STO  L  CE910     RESET RECORD COUNT      2-7 U6H11246
                          BSC  L  MO590     REREAD BINARY RECORD    2-7 U6H11250
                    EO022 BSC  L  MO615      GO TO READ NEW HEADER      U6H11260
                    *                                                   U6H11270
                    EO030 DC      0          ENTRY LINK ERROR 3         U6H11280
                          SLT     32         CLEAR A AND Q              U6H11290
                          LDX   1 3          GET ERROR NUMBER           U6H11300
                          BSI     EO005      PRINT ERROR MSG.           U6H11310
                          WAIT                                          U6H11320
                          BSI     EO000      GET BIT SWITCH READING     U6H11330
                          BSC     E          NO SKIP IF 15 ON           U6H11340
                          MDX     EO031                                 U6H11350
                          BSC     -          SKIP IF SWITCH 0 ON        U6H11360
                          MDX     EO032                                 U6H11370
                          MDX     EO003      EXIT TO SUP                U6H11380
                    EO031 BSC  L  MO570      RE-READ HEX RECORD         U6H11390
                    EO032 BSC  L  MO615      GO TO READ NEW HEADER      U6H11400
                    *                                                   U6H11410
                    EO040 DC      0          ENTRY LINK ERROR 4         U6H11420
                          LDD  L  CHGLV      GET CARD AND DISK LEVELS   U6H11430
                          RTE     16         SWAP A AND Q               U6H11440
                          LDX   1 4          GET ERROR NUMBER           U6H11450
                          BSI     EO005      PRINT ERROR MSG.           U6H11460
                          WAIT                                          U6H11470
                          BSI     EO000      GET BIT SWITCH READING     U6H11480
                          BSC     -          SKIP IF SWITCH 0 ON        U6H11490
                          MDX     EO041                                 U6H11500
                          EXIT               EXIT TO SUP                U6H11510
                    EO041 BSC  L  MO615      GO READ NEW HEADER         U6H11520
                    *                                                   U6H11530
                    *             SUBROUTINE TO READ BIT SWITCHES       U6H11540
                    *             AND LOAD ACCUMULATOR WITH READING.    U6H11550
                    *                                                   U6H11560
                    EO000 DC      0          ENTRY LINK                 U6H11570
                          XIO     EO907      READ SWITCHES              U6H11580
                          LD      EO002      GET READING                U6H11590
                          BSC  I  EO000      RETURN                     U6H11600
                          BSS  E  0                                     U6H11610
                    EO002 DC      *-*        BIT READING                U6H11620
                    *                                                   U6H11630
                    *             SET $NDUP AND $NXEQ SWITCHES - EXIT   U6H11640
                    *                                                   U6H11650
                    EO003 LD      *-1        GET NON-ZERO               U6H11660
                          STO  L  $NDUP      SET NO DUP SW.             U6H11670
                          STO  L  $NXEQ      SET NO XEQ. SW.            U6H11680
                          EXIT               EXIT TO SUP                U6H11690
                    *                                                   U6H11700
                    *                                                   U6H11710
                    *             SET NO READ SWITCH AND EXIT           U6H11720
                    *                                                   U6H11730
                    EO004 LD      *-1        GET NON-ZERO               U6H11740
                          STO  L  $CTSW      SET SWITCH                 U6H11750
                          EXIT               EXIT TO SUP                U6H11760
                    *             SUBROUTINE TO PRINT ERROR MESSAGES.   U6H11770
                    *             ERROR FLAGS ARE IN A AND Q.  ERROR    U6H11780
                    *             NUMBER IS IN IR-1.                    U6H11790
                    *                                                   U6H11800
                    EO005 DC      0          ENTRY LINK                 U6H11810
                          STX   1 EO902      SAVE ERROR NUMBER          U6H11820
                          STD     EO904      SAVE ERROR FLAGS           U6H11830
                          BSI  L  PB000      CONVERT FLAG 1             U6H11840
                          STD     EO903      STORE EBCDIC               U6H11850
                          LD      EO904+1    GET FLAG 2                 U6H11860
                          BSI  L  PB000      CONVERT                    U6H11870
                          STD     EO904      STORE EBCDIC               U6H11880
                          LD      EO902      GET ERROR NUMBER           U6H11890
                          SLA     12         MOVE BITS TO LEFT OF A     U6H11900
                          BSI  L  PB000      CONVERT                    U6H11910
                          RTE     24         SAVE VALUE                 U6H11920
                          LD      EO900      GET BLANK                  U6H11930
                          RTE     8          POSITION VALUE             U6H11940
                          STO     EO902      STORE EBCDIC               U6H11950
                          LDX  L2 EO901      GET ERROR MSG. ADDRESS     U6H11960
                          LDX   1 12         GET WORD COUNT             U6H11970
                          BSI  L  PU000                                 U6H11980
                          BSC  I  EO005      RETURN TO MAINLINE         U6H11990
                    EO900 DC      /4000                                 U6H12000
                          BSS  E  0                                     U6H12010
                    EO901 EBC     .ERROR .                              U6H12020
                    EO902 DC      *-*        ERROR NUMBER               U6H12030
                          EBC     .    .     BLANKS                     U6H12040
                    EO903 BSS     2          ERROR FLAG 1               U6H12050
                          EBC     .    .                                U6H12060
                    EO904 BSS     2          ERROR FLAG 2               U6H12070
                          BSS  E  1                                     U6H12080
                    EO905 DC      0          PRINT WORD COUNT           U6H12090
                    EO906 BSS     28         PRINT BUFFER               U6H12100
                    EO907 DC      EO002      IOCC TO READ SWITCHES      U6H12110
                          DC      /3A00                                 U6H12120
                    EO908 MDX  X  MO610-MO600-1  NO PATCH SWITCH        U6H12130
                    *                                                   U6H12140
                    EO050 DC      0          ENTRY LINK ERROR 5         U6H12150
                          LDD  L  CHGLV      GET CARD AND DISK LEVELS   U6H12160
                          RTE     16         SWAP A AND Q               U6H12170
                          LDX   1 5          GET ERROR NUMBER           U6H12180
                          BSI     EO005      PRINT ERROR MSG.           U6H12190
                          WAIT                                          U6H12200
                          BSI     EO000      GET BIT SWITCH READING     U6H12210
                          BSC     +Z         SKIP IF SWITCH 0 OFF   2-7 U6H12220
                          MDX     EO051                                 U6H12230
                          BSC     E          SKIP IF 15 OFF             U6H12240
                          MDX     EO052                                 U6H12250
                          BSC  L  MO615      GO READ NEW HEADER         U6H12260
                    EO051 EXIT               EXIT TO SUP                U6H12270
                    EO052 BSC  L  MO520      CONTINUE EXECUTION         U6H12280
                    *                                                   U6H12290
                    EO060 DC      0          ENTRY LINK ERROR 6         U6H12300
                          SLT     16         CLEAR Q                    U6H12310
                          LD   L  PCHCT      GET PCH. HEADER COUNT  2-1 U6H12320
                          LDX   1 6          GET ERROR NUMBER           U6H12330
                          BSI     EO005      PRINT ERROR MSG.           U6H12340
                          WAIT                                          U6H12350
                          BSI     EO000      GET BIT SWITCH READING     U6H12360
                          BSC     -          SKIP IF SWITCH 0 ON        U6H12370
                          MDX     EO061                                 U6H12380
                          MDX     EO004      EXIT TO SUP                U6H12390
                    EO061 SLA     16        RESET $CTSW             2-7 U6H12396
                          STO  L  $CTSW     *INDICATOR              2-7 U6H12398
                          BSC  L  MO615      GO READ NEW HEADER         U6H12400
                    *                                                   U6H12410
                    EO070 DC      0          ENTRY LINK ERROR 7         U6H12420
                          RTE     16         SAVE A                     U6H12430
                          LD      EO070      GET RETURN ADDRESS         U6H12440
                          RTE     16         SWAP A AND Q               U6H12450
                          LDX   1 7          GET ERROR NUMBER           U6H12460
                          BSI     EO005      PRINT ERROR MSG.           U6H12470
                          WAIT                                          U6H12480
                    *                      REDUNDANT CODING REMOVED 2-7 U6H12490
                          MDX     EO003      EXIT TO SUP                U6H12520
                    *                                                   U6H12540
                    EO090 DC      0          ENTRY LINK ERROR 9         U6H12550
                          RTE     16         SAVE SLET ID               U6H12560
                          SLA     16         CLEAR A                    U6H12570
                          RTE     16         SWAP A AND Q               U6H12580
                          LDX   1 9          GET ERROR NUMBER           U6H12590
                          BSI     EO005      PRINT ERROR MSG.           U6H12600
                          WAIT                                          U6H12610
                          LD      EO908      GET DISK SWITCH PATCH      U6H12620
                          STO  L  MO600      SET NO PATCH SWITCH        U6H12630
                          BSC  I  EO090      RETURN TO MAINLINE         U6H12640
                    *                                                   U6H12650
                    EO100 DC      0          ENTRY LINK ERROR A         U6H12660
                          A    L  CL920      CALC. HI CORE SLET ADDR.   U6H12670
                          RTE     16         SAVE IN Q                  U6H12680
                          LD   L  CL920      GET HI CORE PATCH ADDR.    U6H12690
                          LDX   1 /A         GET ERROR NUMBER           U6H12700
                          BSI  L  EO005      PRINT ERROR MSG.           U6H12710
                          WAIT                                          U6H12720
                          LD      EO908      GET DISK SWITCH PATCH      U6H12730
                          STO  L  MO600      SET NO PATCH SWITCH        U6H12740
                          BSC  L  MO610      RETURN TO MAINLINE         U6H12750
                    *                                               2-2 U6H12760
                    EO120 DC      *-*        ENTRY POINT ERROR C    2-2 U6H12770
                          LDD  L  CHGLV      GET CARD AND DISK LEV  2-2 U6H12780
                          XCH                SWAP A AND Q           2-2 U6H12790
                          LDX   1 12         GET ERROR NUMBER       2-2 U6H12800
                          BSI  L  EO005      PRINT ERROR MESSAGE    2-2 U6H12810
                          WAIT                                      2-2 U6H12820
                          EXIT               TERMINATE MODIF JOB    2-2 U6H12830
                    *                                               2-2 U6H12840
                    EO130 DC      *-*        ENTRY POINT ERROR D    2-2 U6H12850
                          LDD  L  CHGLV      GET CARD AND DISK LEV  2-2 U6H12860
                          XCH                SWAP A AND Q           2-2 U6H12870
                          LDX   1 13         GET ERROR NUMBER       2-2 U6H12880
                          BSI  L  EO005      PRINT ERROR MESSAGE    2-2 U6H12890
                          WAIT                                      2-2 U6H12900
                          EXIT               TERMINATE MODIF        2-2 U6H12910
                    *                                               2-2 U6H12920
                    EO140 DC      *-*        ENTRY POINT ERROR E    2-2 U6H12930
                          SLT     32         CLEAR A AND Q          2-2 U6H12940
                          LDX   1 14         GET ERROR NUMBER       2-2 U6H12950
                          BSI  L  EO005      PRINT ERROR MESSAGE    2-2 U6H12960
                          WAIT                                      2-2 U6H12970
                          EXIT               TERMINATE MODIF        2-2 U6H12980
                          HDNG    DUP RE-ENTRY                          U6H12990
                    *                                                   U6H13000
                    *             THE CODE BEYOND THIS POINT OCCUPIES   U6H13010
                    *             640 WORDS (2 SECTORS) AND IS LOCATED  U6H13020
                    *             JUST BELOW THE MCRA BUFFER.  DUP      U6H13030
                    *             WILL RELOAD THIS SECTION OF MODIF     U6H13040
                    *             INTO CORE BEFORE TRANSFERRING         U6H13050
                    *             CONTROL TO THE FIRST INSTRUCTION      U6H13060
                    *             BEYOND THIS POINT.                    U6H13070
                    *                                                   U6H13080
                    *                                                   U6H13090
                          BSS  E  0                                     U6H13100
                    RY000 LDD     PRENT      GET WD. CNT. AND SECT. AD. U6H13110
                          STD  L  PRNTR-2    STORE                      U6H13120
                          LDD     DISKR      GET DISKZ PARAMETERS       U6H13130
                          BSI  L  DISKZ      GET PRINC. PRINT ROUTINE   U6H13140
                          LDX  L1 IBTWD-1    GET IBT ADDRESS            U6H13170
                          STX  L1 IBT40      STORE                      U6H13180
                          LDX  L1 /7000      GET READ FUNCTION          U6H13190
                          BSI  L  R4500      READ IN DCOM               U6H13200
                          LD   L  #MDF2      GET DCOM MDF2 IND.         U6H13210
                          BSC     Z          TEST FOR ZERO              U6H13220
                          WAIT               ERROR - DUP SHOULD CLEAR   U6H13230
                          LD   L  #MDF1      GET DCOM MDF1 IND.         U6H13240
                          SLA     8         CHECK IF RIGHT HALF     2-7 U6H13241
                          BSC  L  RY050,-   *OF MDF1 NEG. BRANCH    2-7 U6H13242
                          SRA     15        *IF NO.                 2-7 U6H13243
                          SLA     8         IF YES, ADD ONE TO      2-7 U6H13244
                          A    L  #MDF1     *LEFT HALF OF MDF1.     2-7 U6H13245
                          MDX     *+2                               2-7 U6H13246
                    RY050 LD   L  #MDF1                             2-7 U6H13247
                          STO     MDF20      SAVE                       U6H13250
                          BSI  L  EO080,Z    BRANCH ON NON-ZERO         U6H13260
                    *                                                   U6H13270
                    *                                                   U6H13280
                    *                                                   U6H13290
                    *             EXIT ROUTINE                          U6H13300
                    *                                                   U6H13310
                    *             ROUTINE TO TEST FOR A // DEND CARD    U6H13320
                    *                                                   U6H13330
                    RY100 LDX   1 7                                     U6H13340
                    RY110 LD   L1 CDBUF-1    GET CARD CHARACTER         U6H13350
                          EOR  L1 RY900-1    COMPARE TO TABLE           U6H13360
                          BSI  L  EO110,Z    BRANCH IF NON-ZERO         U6H13370
                          MDX   1 -1                                    U6H13380
                          MDX     RY110                                 U6H13390
                          LD      TPFIX      GET TEMP FIX INDIC     2-2 U6H13400
                          BZ      RY120      BR IF SYSTEM UPDATE    2-2 U6H13410
                          LD   L  #SYSC      OTHERWISE DO NOT UPDATE2-2 U6H13420
                          B       RY125      *DCOM                  2-2 U6H13430
                    RY120 LD      CHGLV      GET NEW CHANGE LEVEL       U6H13440
                          STO  L  #SYSC      UPDATE DCOM                U6H13450
                    RY125 BSI  L  PB000      CONVERT TO EBCDIC      2-2 U6H13460
                          STD     RY920      STORE IN EXIT MSG.         U6H13470
                          SLA     16         CLEAR A                    U6H13480
                          STO  L  $CTSW      RESET SUP NO READ SW.      U6H13490
                    RY130 SLA     16         CLEAR MODIF INDICATORS     U6H13500
                          STO  L  #MDF1                                 U6H13510
                          STO  L  #MDF2                                 U6H13520
                          LDX  L1 /7001      GET WRITE FUNCTION         U6H13530
                          BSI  L  R4500      WRITE DCOM ON DISK         U6H13540
                          LDX  L2 RY910      GET EXIT MSG. ADDRESS      U6H13550
                          LDX   1 12         GET WORD COUNT             U6H13560
                          BSI  L  PU000                                 U6H13570
                          NOP                                           U6H13580
                          NOP                END OF MODIF EXECUTION     U6H13590
                          EXIT               RETURN CONTROL TO SUP      U6H13600
                    *                                                   U6H13610
                    *             CONSTANTS AND MESSAGES                U6H13620
                    *                                                   U6H13630
                    PRENT BSS  E  2          PRINC PRNT SLET ENTRY      U6H13640
                    DISKR DC      /7000      DISKZ READ FUNCTION        U6H13650
                          DC      PRNTR-2    WORD COUNT ADDR.           U6H13660
                    CHGLV DC      0          CHANGE LEVEL (IN CARD)     U6H13670
                    VMODH DC      0          VERSION MOD NUMBER IN HEX  U6H13680
                    MDF10 DC      0          NUMBER DCRS FROM *SUB-CARD U6H13690
                    MDF20 DC      0         LEFT HALF, ERROR COUNT  2-7 U6H13700
                    *                       RIGHT HALF, DCRS NOT    2-7 U6H13705
                    *                       *PROCESSED BY DUP       2-7 U6H13710
                    TPFIX DC      -1         TEMP FIX INDICATOR     2-2 U6H13720
                    *                        *NEG=NOT YET SET       2-2 U6H13730
                    *                        *ZERO=SYSTEM UPDATE    2-2 U6H13740
                    *                        *ONE=RESTRICTED TEMP FI2-2 U6H13750
                    *                        *TWO=GENERAL TEMP FIX  2-2 U6H13760
                    IBTWD BSS  E  3                                     U6H13770
                          DC      0          1231 INT ENTRY             U6H13780
                          DC      PRNTR+4    1403 INT ENTRY             U6H13790
                          DC      CDPTR+4    2501 INT ENTRY             U6H13800
                          DC      CDPTR+4    1442 INT ENTRY             U6H13810
                          DC      0          KB/CP INT ENTRY            U6H13820
                          DC      CDPTR+4    1134/1055 INT ENTRY        U6H13830
                    RY900 DC      /61        /                          U6H13840
                          DC      /61        /                          U6H13850
                          DC      /40        BLANK                      U6H13860
                          DC      /C4        D                          U6H13870
                          DC      /C5        E                          U6H13880
                          DC      /D5        N                          U6H13890
                          DC      /C4        D                          U6H13900
                    *                                                   U6H13910
                    *             MESSAGES                              U6H13920
                    *                                                   U6H13930
                          BSS  E  0                                     U6H13940
                    RY910 EBC     .MODIF COMPLETED     .           2-12 U6H13950
                    RY920 BSS  E  2                                     U6H13960
                    RY930 EBC     .ERROR 8     .                        U6H13970
                    RY940 BSS  E  2                                     U6H13980
                          EBC     .    .                                U6H13990
                    RY950 BSS     2                                     U6H14000
                    RY960 EBC     .ERROR B .                            U6H14010
                    *                                                   U6H14020
                    *             ERROR SUBROUTINES                     U6H14030
                    *                                                   U6H14040
                    EO080 DC      0          ENTRY LINK ERROR 8         U6H14050
                          LD      MDF10      GET DCR COUNT              U6H14060
                          BSI     PB000      CONVERT TO EBCDIC          U6H14070
                          STD     RY950      SET UP FOR ERROR MSG.      U6H14080
                          LD      MDF20      GET DUP ERROR IND.         U6H14090
                          BSI     PB000      CONVERT TO EBCDIC          U6H14100
                          STD     RY940      SET UP FOR ERROR MSG.      U6H14110
                          LDX  L2 RY930      GET ERROR MSG. ADDRESS     U6H14120
                          LDX   1 12         GET WORD COUNT             U6H14130
                          BSI  L  PU000                                 U6H14140
                          WAIT                                          U6H14150
                          BSC  I  EO080      RETURN                     U6H14160
                    *                                                   U6H14170
                    EO110 DC      0          ENTRY LINK ERROR B         U6H14180
                          LDX  L2 RY960      GET ERROR MSG. ADDR.       U6H14190
                          LDX   1 4          GET WORD COUNT             U6H14200
                          BSI  L  PU000                                 U6H14210
                          WAIT                                          U6H14220
                          LD      *-1        GET NON- ZERO              U6H14230
                          STO  L  $NDUP      SET NO DUP SW.             U6H14240
                          STO  L  $NXEQ      SET NO XEQ. SW.            U6H14250
                          BSC  L  RY130      TO EXIT ROUTINE            U6H14260
                          HDNG    GET/PUT                               U6H14270
                    *                                                   U6H14280
                    *             SUBROUTINE TO READ OR WRITE FROM      U6H14290
                    *             THE DISK BUFFER (UP TO 2 SECTORS).    U6H14300
                    *             DISKZ FUNCTION (READ OR WRITE) MUST   U6H14310
                    *             BE IN ACCUMULATOR, WORD COUNT IN      U6H14320
                    *             IR-1, AND SECTOR ADDRESS IN IR-2.     U6H14330
                    *                                                   U6H14340
                    R4000 DC      0          ENTRY LINK                 U6H14350
                          STX  L1 DSKIN-2    STORE WORD COUNT           U6H14360
                          STX  L2 DSKIN-1    STORE SECTOR ADDRESS       U6H14370
                          RTE     16         SAVE ACCUM.                U6H14380
                          LD      R4950+1    GET ADDRESS OF WORD COUNT  U6H14390
                          RTE     16         BUILD DISKZ PARAMETERS     U6H14400
                    R4010 BSI  L  DISKZ      GET OR PUT                 U6H14410
                          LD   L  $DBSY                                 U6H14420
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H14430
                    R4020 XIO     R4940      READ BIT SWITCHES          U6H14440
                          LD      R4930      GET BIT SWITCH KEY         U6H14450
                          NOP                EOR      R4920   TO PRINT  U6H14460
                          BSC     Z          SKIP IF EQUAL              U6H14470
                          MDX     R4040                                 U6H14480
                    R4030 PDMP    DSKIN-16,DSKIN+639,0                  U6H14490
                          NOP                                           U6H14500
                          WAIT                                          U6H14510
                    R4040 BSC  I  R4000      RETURN TO MAINLINE         U6H14520
                    *                                                   U6H14530
                    *             SPECIAL ENTRY TO READ OR WRITE DCOM.  U6H14540
                    *             DISKZ RD/WR FUNCTION MUST BE IN IR-1  U6H14550
                    *                                                   U6H14560
                    R4500 DC      0          ENTRY LINK                 U6H14570
                          STX   1 R4900      STORE DISKZ FUNCTION       U6H14580
                          LD      R4500      GET RETURN ADDRESS         U6H14590
                          STO     R4000      STORE FOR EXIT             U6H14600
                          LDD     R4910      GET DCOM PARAMETERS        U6H14610
                          STD  L  DSKIN+318  STORE IN DISK BUFFER       U6H14620
                          LDD     R4900      GET DISKZ FUNCTION         U6H14630
                          MDX     R4010                                 U6H14640
                    R4900 BSS  E  1          DISKZ FUNCTION             U6H14650
                          DC      DSKIN+318                             U6H14660
                    R4910 DC      320        DCOM WORD COUNT            U6H14670
                          DC      1          DCOM SECTOR ADDR.          U6H14680
                    R4920 BSS  E  1          STORAGE FOR SWITCH READING U6H14690
                    R4930 DC      /AAAA      KEY TO ALLOW PRINTING      U6H14700
                    R4940 DC      R4920      IOCC FOR BIT SWITCHES      U6H14710
                          DC      /3A00                                 U6H14720
                    R4950 DC      /7000      DISKZ READ FUNCTION        U6H14730
                          DC      DSKIN-2    ADDRESS OF WORD COUNT      U6H14740
                          HDNG    HEX-EBCDIC-CONVERSION                 U6H14750
                    *                                                   U6H14760
                    *             SUBROUTINE TO CONVERT WORD IN         U6H14770
                    *             ACCUMULATOR INTO 4 PACKED EBCDIC      U6H14780
                    *             CHARACTERS IN A AND Q.                U6H14790
                    *                                                   U6H14800
                    PB000 DC      0          LINK ADDRESS               U6H14810
                          STX   1 PB050+1    SAVE IR-1             2-12 U6H14812
                          STX   2 PB060+1    SAVE IR-2             2-12 U6H14814
                          RTE     16                                    U6H14820
                          LDX   1 4          SET XR-1 TO COUNT 4        U6H14830
                    *                                                   U6H14840
                    PB010 RTE     4          HEX DIGIT IN HI 4 BITS     U6H14850
                          AND     PB902      MASK OUT LOW 12 BITS       U6H14860
                          STO  L1 PB901-1    STORE IN 4 WORD BUFFER     U6H14870
                          MDX   1 -1         DECREMENT XR-1             U6H14880
                          MDX     PB010                                 U6H14890
                    *                                                   U6H14900
                          LDX   1 4          SET XR-1 TO COUNT 4        U6H14910
                    PB020 LDX   2 16         SET XR-2 TO COUNT 16       U6H14920
                    PB030 LD   L2 PB900-1    GET TABLE WORD             U6H14930
                          SLA     12                                    U6H14940
                          EOR  L1 PB901-1    COMPARE TO BUFFER          U6H14950
                          BSC  L  PB040,+-   TEST FOR EQUAL             U6H14960
                          MDX   2 -1         DECREMENT XR-2             U6H14970
                          MDX     PB030      BACK TO LOOP2              U6H14980
                          WAIT               ERROR                      U6H14990
                    PB040 LD   L2 PB900-1    MATCH-GET TABLE WORD       U6H15000
                          STO  L1 PB901-1    STORE IN BUFFER            U6H15010
                          MDX   1 -1         DECREMENT XR-1             U6H15020
                          MDX     PB020      BACK TO LOOP3              U6H15030
                    *                                                   U6H15040
                    *             FOLLOWING CODE PUTS BUFFER            U6H15050
                    *             INTO A AND Q REGISTERS.               U6H15060
                    *                                                   U6H15070
                          LD      PB901+1                               U6H15080
                          RTE     16                                    U6H15090
                          LD      PB901                                 U6H15100
                          SRA     8                                     U6H15110
                          SLT     8                                     U6H15120
                          STO     PB901                                 U6H15130
                          LD      PB901+3                               U6H15140
                          RTE     16                                    U6H15150
                          LD      PB901+2                               U6H15160
                          SRA     8                                     U6H15170
                          RTE     8                                     U6H15180
                          LD      PB901                                 U6H15190
                    *                                                   U6H15200
                    PB050 LDX  L1 *-*        RESTORE IR-1          2-12 U6H15202
                    PB060 LDX  L2 *-*        RESTORE IR-2          2-12 U6H15204
                          BSC  I  PB000      RETURN VIA LINK WORD       U6H15210
                    *                                                   U6H15220
                    *      TABLE EBCDIC (LEFT HALF)    HEX (RIGHT HALF) U6H15230
                    *                                                   U6H15240
                          DC      /4000      BLANK                      U6H15250
                    PB900 DC      /F000      0                          U6H15260
                          DC      /F101      1                          U6H15270
                          DC      /F202      2                          U6H15280
                          DC      /F303      3                          U6H15290
                          DC      /F404      4                          U6H15300
                          DC      /F505      5                          U6H15310
                          DC      /F606      6                          U6H15320
                          DC      /F707      7                          U6H15330
                          DC      /F808      8                          U6H15340
                          DC      /F909      9                          U6H15350
                          DC      /C10A      A                          U6H15360
                          DC      /C20B      B                          U6H15370
                          DC      /C30C      C                          U6H15380
                          DC      /C40D      D                          U6H15390
                          DC      /C50E      E                          U6H15400
                          DC      /C60F      F                          U6H15410
                    PB901 BSS  E  4          OUTPUT BUFFER              U6H15420
                    PB902 DC      /F000      MASK WORD                  U6H15430
                          HDNG    PRINT                                 U6H15440
                    *                                                   U6H15450
                    *             SUBROUTINE TO PRINT MESSAGES.         U6H15460
                    *             WORD COUNT MUST BE IN IR-1 AND CORE   U6H15470
                    *             ADDRESS OF MESSAGE IN IR-2.  MESSAGE  U6H15480
                    *             IS IN PACKED EBCDIC AND CONTAINS AN   U6H15490
                    *             EVEN NUMBER OF CHARACTERS.            U6H15500
                    *                                                   U6H15510
                    PU000 DC      0          ENTRY LINK                 U6H15520
                          STX  L1 EO905      STORE WORD COUNT           U6H15530
                          MDX   2 -1         SUBT. 1 FROM MESSAGE ADDR. U6H15540
                          NOP                                           U6H15550
                          STX   2 PU010+1    SET UP TRANSMIT ADDRESS    U6H15560
                    PU010 LD   L1 *-*        GET CHARACTERS             U6H15570
                          STO  L1 EO906-1    STORE IN PRINT BUFFER      U6H15580
                          MDX   1 -1         DECREMENT COUNT            U6H15590
                          MDX     PU010                                 U6H15600
                          LDD     PU020      GET SKIP FUNCTION          U6H15610
                          LD   L  PU030      GET PRINT FUNCTION         U6H15620
                          BSI  L  PRNTR+1    TO PRINT ROUTINE           U6H15630
                          LD   L  $PBSY      TEST PRINTER BUSY          U6H15640
                          BSC  L  *-4,Z      BRANCH IF BUSY             U6H15650
                          BSC  I  PU000      RETURN TO MAINLINE         U6H15660
                          BSS  E  0                                     U6H15670
                    PU020 DC      /7000      SKIP FUNCTION              U6H15680
                          DC      EO905      ADDRESS OF WORD COUNT      U6H15690
                    PU030 DC      /7001                                 U6H15700
                          HDNG    CALCULATE/PERFORM-PATCHING/PRINT      U6H15710
                    *                                              2-12 U6H15720
                    *             SUBROUTINE TO CALCULATE SECTOR   2-12 U6H15730
                    *             PATCHING PARAMETERS,SETUP DISKZ  2-12 U6H15740
                    *             PARAMETERS, AND PUT PATCH IN THE 2-12 U6H15750
                    *             DISK BUFFER.  THE TWO ENTRIES ARE2-12 U6H15760
                    *             CL000 AND CL500                  2-12 U6H15770
                    *             ** CODE MOVED AND MODIFIED IN    2-12 U6H15772
                    *             ** VERSION 2, MODIFICATION 12    2-12 U6H15774
                    *                                              2-12 U6H15780
                    CL000 DC      0          ENTRY LINK            2-12 U6H15790
                          LD   L  BINBF+2    GET WD CNT & TYPE     2-12 U6H15800
                          EOR  L  H0A00      REMOVE TYPE CODE      2-12 U6H15810
                          STO     CL910      STORE PATCH WD CNT    2-12 U6H15820
                          A    L  BINBF      ADD PATCH CORE ADDR   2-12 U6H15830
                          S    L  DEC01                            2-12 U6H15840
                          STO     CL920      SAVE HI PATCH ADDR    2-12 U6H15850
                    *                                              2-12 U6H15860
                    *             FOLLOWING CODE ROUNDS WORD COUNT 2-12 U6H15870
                    *             OF SLET ENTRY TO FULL SECTORS.   2-12 U6H15880
                    *                                              2-12 U6H15885
                    CL010 SLT     16         CLEAR Q               2-12 U6H15900
                          LD   L  SNTRY+2    GET WORD COUNT        2-12 U6H15910
                          RTE     16         SAVE TOTAL WD CNT     2-12 U6H15920
                          LD   L  SNTRY+3    GET SECTOR ADDR       2-12 U6H15930
                          SLA     1          SHIFT OUT BIT 0 INDR  2-12 U6H15940
                          SRA     1          *DEVICE NOT ON SYSTEM 2-12 U6H15950
                          RTE     16         SWAP A & Q            2-12 U6H15960
                          STD     CL900      SAVE DISKZ PARAMS     2-12 U6H15970
                    *                                              2-12 U6H15980
                          A    L  SNTRY+1    ADD SLET CORE ADDR    2-12 U6H15990
                          S       CL920      CHECK PATCH LIMIT     2-12 U6H16000
                          BSI  L  EO100,+Z                         2-12 U6H16010
                          LD   L  BINBF      GET PATCH CORE ADDR   2-12 U6H16020
                          STO  L  CL983                            2-12 U6H16025
                          S    L  SNTRY+1    SUBT. SLET CORE ADDR  2-12 U6H16030
                          STO     CL930      SAVE ADDR DIFF        2-12 U6H16040
                    CL020 S       CL950      SUBT. A FULL SECTOR   2-12 U6H16050
                          BSC     +Z         NO SKIP-PATCH IN SECTO2-12 U6H16060
                          MDX     CL030                            2-12 U6H16070
                          MDX  L  CL900+1,1  RAISE SECTOR ADDRESS  2-12 U6H16080
                          MDX     CL020      TEST AGAIN            2-12 U6H16090
                    CL030 A       CL950      CORRECT ADJ. ADDR     2-12 U6H16100
                          STO     CL940      SAVE ADJUSTED ADDR.   2-12 U6H16110
                    *                                              2-12 U6H16120
                    *             FOLLOWING CODE CHECKS IF PATCH   2-12 U6H16130
                    *             OVERLAPS INTO NEXT SECTOR.       2-12 U6H16140
                    *                                              2-12 U6H16150
                          S       CL950                            2-12 U6H16160
                          A       CL910      ADD PATCH WORD COUNT  2-12 U6H16170
                          BSC  L  CL050,+    BRANCH FOR 1 SECTOR   2-12 U6H16180
                    *                                              2-12 U6H16190
                          LD      CL950      GET 2 SECTOR WD CNT   2-12 U6H16200
                          SLA     1          DOUBLE WD CNT         2-12 U6H16210
                    CL040 STO     CL900      STORE PARAMETER       2-12 U6H16220
                          BSC  I  CL000      RETURN TO MAINLINE    2-12 U6H16230
                    CL050 LD      CL950      GET 1 SECT.WD CNT     2-12 U6H16240
                          MDX     CL040      EXIT                  2-12 U6H16250
                          NOP                                      2-12 U6H16260
                          NOP                                      2-12 U6H16270
                    *                                              2-12 U6H16280
                    CL900 BSS  E  2          STORE DISKZ PARAMS    2-12 U6H16290
                    CL910 DC      0          PATCH WD CNT          2-12 U6H16300
                    CL920 DC      0          HI PATCH CNT          2-12 U6H16310
                    CL930 DC      0          ADDR. DIFF.           2-12 U6H16320
                    CL940 DC      0          HOLDS ADJ. CORE ADDR  2-12 U6H16330
                    CL950 DC      320                              2-12 U6H16340
                    CL960 DC      DSKIN      DISK BUFFER ADDR      2-12 U6H16350
                    *                                              2-12 U6H16360
                    *             ENTRY TO PRINT PATCH INFORMATION 2-12 U6H16370
                    *             ON THE CONSOLE PRINTER AND PUT    212 U6H16380
                    *             PATCH INTO BUFFER                2-12 U6H16390
                    *                                              2-12 U6H16400
                    *             DATA ENTRY SWITCH SETTINGS       2-12 U6H16410
                    *             INDICATE THE FOLLOWING-          2-12 U6H16420
                    *             1. DURING EXECUTION OF CL500-    2-12 U6H16430
                    *                SW 1 ON = NO PRINT            2-12 U6H16440
                    *                SW 1 OFF= PRINT PATCH INFO    2-12 U6H16450
                    *             2. AFTER THE PRINTING OF A       2-12 U6H16460
                    *                MESSAGE AND DURING A WAIT-    2-12 U6H16470
                    *                SW 0 OFF= EXECUTE PATCH       2-12 U6H16480
                    *                SW 0 ON = ABORT MODIF JOB     2-12 U6H16490
                    *                                              2-12 U6H16500
                    CL500 DC      *-*        ENTRY LINK            2-12 U6H16510
                    *                                              2-12 U6H16520
                    *             FOLLOWING CODE SETS UP PATCH     2-12 U6H16530
                    *             INFORMATION WORDS AND CHECKS     2-12 U6H16540
                    *             OPERATOR INDICATION (SW 1) OF    2-12 U6H16550
                    *             WHETHER OR NOT PATCH INFO        2-12 U6H16560
                    *             IS TO BE PRINTED.                2-12 U6H16570
                    *                                              2-12 U6H16580
                          XIO     CL970      READ DATA SWITCHES    2-12 U6H16590
                          LD      CL980      GET VALUE IN SW'S     2-12 U6H16600
                          SLA     1                                2-12 U6H16610
                          BSC  L  CL505,Z+   NO PRINT IF SW 1 ON   2-12 U6H16620
                          LDX   1 18         GET MESSAGE WORD CNT  2-12 U6H16630
                          LDX  L2 MSG01      GET MESSAGE ADDR      2-12 U6H16640
                          BSI  L  PU000      PRINT PATCH HEADER    2-12 U6H16650
                    CL505 LD      CL900+1    GET DISK ADDR         2-12 U6H16660
                          STO     CL981                            2-12 U6H16670
                          LD      CL940      GET REL DISP IN SECTOR2-12 U6H16680
                          STO     CL982                            2-12 U6H16690
                          LDX   1 0          SET DISP INTO PATCH   2-12 U6H16700
                          LDX  I2 CL910      GET PATCH WD CNT      2-12 U6H16710
                          LD      CL940      GET REL PATCH ADDR    2-12 U6H16720
                          A       CL960      ADD DISK BUFF ADDR    2-12 U6H16730
                          STO     CL510+1                          2-12 U6H16740
                          STO     CL520+1                          2-12 U6H16750
                    *                                              2-12 U6H16760
                    *             FOLLOWING CODE PLACES PATCH IN   2-12 U6H16770
                    *             DISK BUFFER,CONVERTS PATCH INFO  2-12 U6H16780
                    *             WORDS TO PACKED EBCDIC, PLACES   2-12 U6H16790
                    *             THE PATCH INFO IN THE PRINT      2-12 U6H16800
                    *             BUFFER (MSG03), CHECKS OPERATOR  2-12 U6H16810
                    *             INDICATION (SW 1) OF WHETHER OR  2-12 U6H16820
                    *             NOT PATCH INFO IS TO PRINTED,    2-12 U6H16830
                    *             AND PRINTS PATCH INFORMATION.    2-12 U6H16840
                    *                                              2-12 U6H16850
                    CL510 LD   L1 *-*        GET OLD DATA          2-12 U6H16860
                          BSI  L  PB000      CONVERT TO PACKED EBC 2-12 U6H16870
                          STO     MSG03+13   SAVE IN PR BUFFER     2-12 U6H16880
                          RTE     16                               2-12 U6H16890
                          STO     MSG03+14                         2-12 U6H16900
                          LD   L1 BINBF+9    GET PATCH DATA        2-12 U6H16910
                    CL520 STO  L1 *-*        STORE IN DISK BUFFER  2-12 U6H16920
                          BSI  L  PB000      CONVERT TO PACKED EBC 2-12 U6H16930
                          STD     MSG03+16   SAVE IN PR BUFFER     2-12 U6H16940
                          STX   1 CL530+1    SAVE DISP INTO PATCH  2-12 U6H16950
                          STX   2 CL540+1    SAVE PATCH WD CNT     2-12 U6H16960
                          LD      CL981      GET DISK ADDR OF PATCH2-12 U6H16970
                          BSI  L  PB000      CONVERT TO PACKED EBC 2-12 U6H16980
                          STD     MSG03+4    *+ SAVE IN PR BUFFER  2-12 U6H16990
                          LD      CL982      GET REL. DISP OF PATCH2-12 U6H17000
                          BSI  L  PB000      CONVERT TO PACKED EBC 2-12 U6H17010
                          STO     MSG03+7    SAVE IN PR BUFFER     2-12 U6H17020
                          RTE     16                               2-12 U6H17030
                          STO     MSG03+8                          2-12 U6H17040
                          LD      CL983      GET CORE ADDR OF PATCH2-12 U6H17050
                          BSI  L  PB000      CONVERT TO PACKED EBC 2-12 U6H17060
                          STD     MSG03+10   SAVE IN PR BUFFER     2-12 U6H17070
                          XIO     CL970      READ DATA SWITCHES    2-12 U6H17080
                          LD      CL980      GET VALUE IN SW'S     2-12 U6H17090
                          SLA     1                                2-12 U6H17100
                          BSC  L  CL525,Z+   NO PRINT IF SW 1 ON   2-12 U6H17110
                          LDX   1 18         GET MESSAGE WD CNT    2-12 U6H17120
                          LDX  L2 MSG03      GET MESSAGE ADDR      2-12 U6H17130
                          BSI  L  PU000      PRINT PATCH INFO      2-12 U6H17140
                    CL525 MDX  L  CL983,+1   INCR PATCH CORE ADDR  2-12 U6H17150
                          NOP                IN CASE OF SKIP       2-12 U6H17160
                          LD      CL982      GET REL DISP          2-12 U6H17170
                          A       CL990      INCR BY +1            2-12 U6H17180
                          STO     CL982                            2-12 U6H17190
                          S       CL950      DETERMINE IF PATCH IN 2-12 U6H17200
                          BSC  L  CL530,+Z   *NEXT SECTOR-BR IF NO 2-12 U6H17210
                          SLA     16         SET REL DISP = 0      2-12 U6H17220
                          STO     CL982                            2-12 U6H17230
                          LD      CL981      GET DISK ADDR         2-12 U6H17240
                          A       CL990      INCR BY +1            2-12 U6H17250
                          STO     CL981                            2-12 U6H17260
                    CL530 LDX  L1 *-*        RESTORE PATCH DISP    2-12 U6H17270
                    CL540 LDX  L2 *-*        RESTORE PATCH WD CNT  2-12 U6H17280
                          MDX   1 +1         INCR DISP INTO PATCH  2-12 U6H17290
                          NOP                IN CASE OF SKIP       2-12 U6H17300
                          MDX   2 -1         DECR PATCH WD CNT     2-12 U6H17310
                          MDX     CL510      CONTINUE MAKING PATCH 2-12 U6H17320
                          LD      CL980      GET VALUE IN SW'S     2-12 U6H17330
                          SLA     1                                2-12 U6H17340
                          BSC  L  CL560,Z+   BR TO EXIT IF SW 1 ON 2-12 U6H17350
                    *                                              2-12 U6H17360
                    *             FOLLOWING CODE PRINTS MESSAGE TO 2-12 U6H17370
                    *             OPERATOR, AND SKIPS 2 LINES ON   2-12 U6H17380
                    *             THE PRINCIPLE PRINTER.           2-12 U6H17390
                    *                                              2-12 U6H17400
                          LDX   1 10         GET MESSAGE WD CNT    2-12 U6H17410
                          LDX  L2 MSG04      GET MESSAGE ADDR      2-12 U6H17420
                          BSI  L  PU000      PRINT MESSAGE         2-12 U6H17430
                          LDX   1 10         GET MESSAGE WD CNT    2-12 U6H17440
                          LDX  L2 MSG05      GET MESSAGE ADDR      2-12 U6H17450
                          BSI  L  PU000      PRINT MESSAGE         2-12 U6H17460
                          LDX   1 2          GET LOOP COUNT        2-12 U6H17465
                    CL550 LD      CL995      GET SKIP PARAM        2-12 U6H17470
                          BSI  L  PRNTR+1    SKIP A LINE           2-12 U6H17480
                          MDX  L  $PBSY,0    PRINTER BUSY          2-12 U6H17490
                          MDX     *-3        *YES-GO BACK AND TEST 2-12 U6H17500
                          MDX   1 -1         DECR LOOP COUNT       2-12 U6H17510
                          MDX     CL550      BR TO SKIP A LINE     2-12 U6H17520
                    *                                              2-12 U6H17550
                    *             FOLLOWING CODE CHECKS OPERATOR   2-12 U6H17560
                    *             INDICATION (SW 0) OF WHETHER OR  2-12 U6H17570
                    *             NOT PATCH SHOULD BE EXECUTED.    2-12 U6H17580
                    *                                              2-12 U6H17590
                          SLA     16         CLEAR ACC             2-12 U6H17600
                          WAIT               WAIT FOR OPERATOR     2-12 U6H17610
                          XIO     CL970      READ DATA SWITCHES    2-12 U6H17620
                          LD      CL980      GET DATA SW VALUE     2-12 U6H17630
                          BSC  L  MO610,+Z  BR TO NEXT PATCH CARD   212 U6H17640
                    *                       IF SWITCH 0 IS ON       212 U6H17645
                    CL560 BSC  I  CL500      RETURN TO MAINLINE    2-12 U6H17650
                    *                                              2-12 U6H17660
                          BSS  E  0                                2-12 U6H17670
                    CL970 DC      CL980      IOCC TO READ DATA     2-12 U6H17680
                          DC      /3A00      *SWITCHES             2-12 U6H17690
                    CL980 DC      *-*        VALUE IN DATA SW'S    2-12 U6H17700
                    CL981 DC      *-*        DISK ADDR OF PATCH    2-12 U6H17710
                    CL982 DC      *-*        REL. DISP OF PATCH    2-12 U6H17720
                    CL983 DC      *-*        CORE ADDR OF PATCH    2-12 U6H17730
                    CL990 DC      1          USED TO INCR BY +1    2-12 U6H17740
                    CL995 DC      /7002      SKIP PARAMETER        2-12 U6H17750
                          BSS  E  0                                2-12 U6H17770
                    MSG03 EBC     .                                   . U6H17780
                    MSG04 EBC     .      SW 0 OFF=PATCH.           2-12 U6H17790
                    MSG05 EBC     .      SW 0 ON =ABORT.           2-12 U6H17800
                    MSG01 EBC     .        DAAA REL-WD ADDR  OLD   NEW. U6H17805
                    *                                              2-12 U6H17810
                    *                                              2-12 U6H17840
                    *             THE CARD INPUT BUFFER OCCUPIES   2-12 U6H17850
                    *             LOCATIONS /0FB0 TO /0FFF         2-12 U6H17860
                    *                                              2-12 U6H17870
                    CDBUF EQU     4096-80    CARD BUFFER ADDR      2-12 U6H17880
                          END     MO000      END OF MODIF          2-12 U6H17890
