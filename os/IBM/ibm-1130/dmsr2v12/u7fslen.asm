                          HDNG    FSLEN- FETCH PHASE IDS FROM SLET      U7B00010
                          ENT     FSLEN                                 U7B00020
                          ENT     FSYSU                                 U7B00030
                    *************************************************** U7B00040
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U7B00050
                    *                                                 * U7B00060
                    * FUNCTION/OPERATION-                             * U7B00070
                    *    THIS SUBROUTINE READ SLET ON THE SYSTEMS CART* U7B00080
                    *    SEARCHING FOR A REQUESTED PHASE ID ENTRY.    * U7B00090
                    *    THE WORD CNT AND SECTOR ADDRESS OF THE ENTRY * U7B00100
                    *    IS RETURNED TO THE CALLING RTN IN THE ACCUM  * U7B00110
                    *   AND EXT. IF THE PHASE ID IS NOT IN SLET       * U7B00120
                    *    THE ACCUM IS SET TO ZERO BEFORE RETURNING TO * U7B00130
                    *    THE CALLING RTN.                             * U7B00140
                    *                                                 * U7B00150
                    *                                                 * U7B00160
                    *    FSYSU PART OF THE SUBR FETCHS THE REQUESTED  * U7B00170
                    *    SUBROUTINE IN TO MEMORY. THE WORD COUNT AND  * U7B00180
                    *    SYSTEM SUBR IN TO MEMORY. THE WORD COUNT AND * U7B00190
                    *    SECTOR ADDRESS IS LOADED INTO THE ACC AND EXT* U7B00200
                    *    REGISTER PRIOR TO THE CALL.  THE USER ENTRY  * U7B00210
                    *    POINT IS RETURNED IN THE A REGISTER.         * U7B00220
                    *                                                 * U7B00230
                    * ENTRY POINTS-                                   * U7B00240
                    *    FSLEN-                                       * U7B00250
                    *       CALLING SEQUENCE IS                       * U7B00260
                    *             CALL    FSLEN                       * U7B00270
                    *             DC      A                           * U7B00280
                    *       WHERE A IS THE PHASE ID BEING REQUESTED   * U7B00290
                    *    FSYSU-                                       * U7B00300
                    *       CALLING SEQUENCE IS                       * U7B00310
                    *             CALL   FSYSU                        * U7B00320
                    *                                                 * U7B00330
                    * INPUT-SLET OF THE SYSTEMS CARTRIDGE             * U7B00340
                    *    *FSYSU-USER ENTRY                            * U7B00350
                    *    * SUBROUTINE FROM SYSTEM CARTRIDGE           * U7B00360
                    *                                                 * U7B00370
                    * OUTPUT-N/A                                      * U7B00380
                    *                                                 * U7B00390
                    * EXTERNAL REFERENCES-                            * U7B00400
                    *    SUBROUTINES-                                 * U7B00410
                    *      DZ000 DISK READ                              U7B00420
                    *                                                 * U7B00430
                    * EXITS-                                          * U7B00440
                    *    NORMAL-FS090                                 * U7B00450
                    *          FY250                                  * U7B00460
                    *                                                 * U7B00470
                    * TABLES/WORK AREAS                               * U7B00480
                    *    *FS900                                       * U7B00490
                    *    *FS901                                       * U7B00500
                    *    *FS902                                       * U7B00510
                    *    *FS990                                       * U7B00520
                    *                                                 * U7B00530
                    * ATTRIBUTES-NATURALLY RELOCATABLE                * U7B00540
                    *                                                 * U7B00550
                    * NOTES -N/A                                      * U7B00560
                    *                                                 * U7B00570
                    *                                                 * U7B00580
                    *************************************************** U7B00590
                    $PST4 EQU     /8D   ADDR POSTOP ERROR TRAP LEVEL 4  U7B00600
                    LVL4  EQU     /000C     LEVEL 4 INT.BRANCH ADR.2-11 U7B00605
                    $I405 EQU     /D3                                   U7B00610
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       U7B00620
                    $DBSY EQU     /EE  DISK BUSY INDR( NON-ZERO=DK BUSY U7B00630
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                U7B00640
                          HDNG    FSLEN-FETCH PHASE IDS FROM SLET       U7B00650
                    *                                                   U7B00660
                    FS000 DC      *-*       PHASE ID STORAGE            U7B00670
                    FSLEN DC      *-*       ENTRY                       U7B00680
                          STX   1 FS088+1   SAVE XR1                    U7B00690
                          STX   2 FS089+1   SAVE XR2                    U7B00700
                          LDD     FS798                                 U7B00710
                          STD     FS990                                 U7B00720
                          LD      FSLEN     SETUP ID                    U7B00730
                          STO     *+1                                   U7B00740
                          LD   L  *-*       FETCH PHASE IF HDR          U7B00750
                          STO     FS000                                 U7B00760
                          LD      FS800     FETCH SECTOR ADDRESS        U7B00770
                          STO     FS991                                 U7B00780
                          LD      FS807     CLEAR FOUND FLAG            U7B00790
                          STO     FS900                                 U7B00800
                          LD      FSLEN     FETCH RETURN ADDRESS        U7B00810
                          A       FS812     ADD ONE                     U7B00820
                          STO     FS090+1   STORE IN RETURN             U7B00830
                    *                                                   U7B00840
                    *                                                   U7B00850
                    *                                                   U7B00860
                          STX   0 FS010+1   COMPUTE DISK READ ADDRESS   U7B00870
                    FS005 LD      FS010+1                               U7B00880
                          A       FS803                                 U7B00890
                          STO     FS010+1                               U7B00900
                    FS010 BSI  L  *-*       TO DISK READ                U7B00910
                    *                                                   U7B00920
                          STX   0 FS020+1   COMPUTE SEARCH RTN ENTRY    U7B00930
                    FS015 LD      FS020+1                               U7B00940
                          A       FS804                                 U7B00950
                          STO     FS020+1                               U7B00960
                    FS020 BSI  L  *-*       TO SEARCH                   U7B00970
                    *                                                   U7B00980
                    *************************************************** U7B00990
                    * TEST FOUND FLAG TO SEE IF  REQUESTED ID FOUND   * U7B01000
                    *************************************************** U7B01010
                    *                                                   U7B01020
                          LD      FS900     FETCH FLAG                  U7B01030
                          BSC     E         ODD IF FOUND                U7B01040
                          MDX     FS080     PROCESS SECOND SECTOR       U7B01050
                    *                                                   U7B01060
                    *                                                   U7B01070
                    FS023 LD      FS991     INCR SECTOR ADDRESS         U7B01080
                          A       FS801                                 U7B01090
                          STO     FS991                                 U7B01100
                          S       FS902     SECTOR 5 FOUND          212 U7B01102
                          BSC     Z-        NOT YET                 212 U7B01104
                          MDX     FS088     YES, FOUND AND SEARCHED 212 U7B01106
                          STX   0 FS030+1   COMPUTE DISK READ ENTRY     U7B01110
                    FS024 LD      FS030+1                               U7B01120
                          A       FS810                                 U7B01130
                          STO     FS030+1                               U7B01140
                    FS030 BSI  L  *-*       READ SLET                   U7B01150
                    *                                                   U7B01160
                          STX   0 FS040+1   COMPUTE SEARCH ENTRY        U7B01170
                    FS035 LD      FS040+1                               U7B01180
                          A       FS811                                 U7B01190
                          STO     FS040+1                               U7B01200
                    FS040 BSI  L  *-*       SEARCH SLET FOR ID          U7B01210
                    *                                                   U7B01220
                          LD      FS900     LD FOUND FLAG               U7B01230
                          BSC     E         SKIP IF NOT FOUND           U7B01240
                          MDX     FS080     TO LD ACCUM WITH HDRS.      U7B01250
                          LD      FS807     ZERO ACCUM                  U7B01260
                          MDX     FS023                             212 U7B01270
                    FS080 MDX   2 2         INCR TO WD CNT & SCTR ADDR  U7B01280
                          LDD   2           FETCH WD CNT AND SCTR ADDR  U7B01290
                    FS088 LDX  L1 *-*       RESTORE XR1                 U7B01300
                    FS089 LDX  L2 *-*       RESTORE XR2                 U7B01310
                    FS090 BSC  L  *-*       RETURN                      U7B01320
                    *                                                   U7B01330
                    *************************************************** U7B01340
                    * DISK READ                                       * U7B01350
                    *************************************************** U7B01360
                    FS100 DC      *-*       ENTRY-EXIT                  U7B01370
                          LD      FS813     FETCH I/O ADDRESS           U7B01380
                          SRT     16                                    U7B01390
                          LD      FS814     FETCH READ FUNCTION CODE    U7B01400
                          BSI  L  DZ000     TO DISK READ                U7B01410
                    FS101 MDX  L  $DBSY,0                               U7B01420
                          MDX     FS101     READ NOT COMPLETE           U7B01430
                    *                                                   U7B01440
                          STX   0 FS125+1   COMPUTE ENTRY/EXIT          U7B01450
                    FS105 LD      FS125+1                               U7B01460
                          S       FS808                                 U7B01470
                          STO     FS125+1                               U7B01480
                    FS125 BSC  I  *-*       RETURN                      U7B01490
                    *                                                   U7B01500
                    *************************************************** U7B01510
                    * SEARCH SLET FOR THE REQUESTED PHASE ID HDR      * U7B01520
                    *************************************************** U7B01530
                    *                                                   U7B01540
                    FS200 DC      *-*       ENTRY/EXIT                  U7B01550
                          LDX   1 80                                    U7B01560
                          LDX  L2 FS991+1                               U7B01570
                    FS202 LD      FS000     LD REQUESTED ID             U7B01580
                          S     2 0         SUB ID OF SLET              U7B01590
                          BSC     Z         BE IF FOUND IN SLET         U7B01600
                          MDX     FS203                                 U7B01610
                    *                                                   U7B01620
                          MDX     FS215     SET-UP FOR RETURN           U7B01630
                    FS203 MDX   2 4                                     U7B01640
                          MDX   1 -1        SKIP IF 80 PROCESSED        U7B01650
                          MDX     FS202                                 U7B01660
                    FS204 STX   0 FS210+1   COMPUTE ENTRY/EXIT          U7B01670
                    FS205 LD      FS210+1                               U7B01680
                          S       FS805                                 U7B01690
                          STO     FS210+1                               U7B01700
                    FS210 BSC  I  *-*       RETURN                      U7B01710
                    *                                                   U7B01720
                    FS215 LD      FS806     SET FOUND FLAG              U7B01730
                          STO     FS900                                 U7B01740
                          MDX     FS204     RETURN                      U7B01750
                    *                                                   U7B01760
                    *************************************************** U7B01770
                    * CONSTANTS                                       * U7B01780
                    *************************************************** U7B01790
                          BSS  E  0                                     U7B01800
                    FS798 DC      320                                   U7B01810
                    FS799 DC      *-*                                   U7B01820
                    FS800 DC      /0003     SECTOR ADDRESS              U7B01830
                    FS801 DC      /0001     INCR SECTOR ADD.            U7B01840
                    FS803 DC      FS100-FS005 ADDRESS OF DISK READ      U7B01850
                    FS804 DC      FS200-FS015 ADDRESS OF SEARCH         U7B01860
                    FS805 DC      FS205-FS200                           U7B01870
                    FS806 DC      /0001     USED WHEN ID FOUND          U7B01880
                    FS807 DC      /0000     ZERO                        U7B01890
                    FS808 DC      FS105-FS100                           U7B01900
                    FS810 DC      FS100-FS024                           U7B01910
                    FS811 DC      FS200-FS035                           U7B01920
                    FS812 DC      1         ONE                         U7B01930
                    FS813 DC      FS990     I/O ADDRESS                 U7B01940
                    FS814 DC      /7000     READ DISK FUNCTION CODE     U7B01950
                    *                                                   U7B01960
                    $I400 DC      /00C4     ADDR OF LEVEL 4 INT.RTN2-11 U7B01970
                          BSS  E  0                                     U7B01980
                    FS900 DC      *-*       EQUALS 1 WHEN IDS MATCH     U7B01990
                    FS901 DC      *-*       SAVE XR 1                   U7B02000
                    FS902 DC      /0005                                 U7B02010
                    *************************************************** U7B02020
                    * INPUT AREAS                                     * U7B02030
                    *************************************************** U7B02040
                          BSS  E  0                                     U7B02050
                    FS990 DC      320                                   U7B02060
                    FS991 DC      *-*                                   U7B02070
                          BSS     372                               2-5 U7B02080
                          DC      *-*                                   U7B02090
                    *                                                 * U7B02100
                    *                                                 * U7B02110
                    *************************************************** U7B02120
                    *                                                   U7B02130
                    FY950 EQU     FS990                                 U7B02140
                    FY951 EQU     FS991                                 U7B02150
                    FYY08 EQU     8                                     U7B02160
                    FYY09 EQU     9                                     U7B02170
                          HDNG    FETCH SYSTEM SUBROUTINE-FSYSU         U7B02180
                    *************************************************** U7B02190
                    *                                                   U7B02200
                    FSYSU DC      *-*       ENTRY-EXIT                  U7B02210
                          STD  L  FY950                                 U7B02220
                          LD      FY800     FETCH I/P ADDRESS           U7B02230
                          SRT     16                                    U7B02240
                          LD      FY801     FETCH FUNCTION CODE         U7B02250
                          BSI  L  DZ000     GO TO DISK READ             U7B02260
                    FY010 MDX  L  $DBSY,0   SKIP IF READ COMPLETE       U7B02270
                          MDX     FY010                                 U7B02280
                          LD      FY806     FETCH ADDRESS OF IBT        U7B02290
                          STO  L  $IBT4                                 U7B02300
                          LD      FY805     FETCH COLUMN INTRPT ENTRY   U7B02310
                          STO  L  FYY08                                 U7B02320
                          LD      FY804                                 U7B02330
                          STO  L  FYY09                                 U7B02340
                          LD   L  $I400     LOAD ADR. LEVEL4 RTN.  2-11 U7B02345
                          STO  L  LVL4      STORE IN INT TRANS.VECT2-11 U7B02347
                          LD      FY802                                 U7B02350
                    FY250 BSC  I  FSYSU     RETURN                      U7B02360
                          HDNG    FSYSU     CONSTANTS                   U7B02370
                    *************************************************** U7B02380
                    *                                                   U7B02390
                          BSS  E  0                                     U7B02400
                    FY800 DC      FY950                                 U7B02410
                    FY801 DC      /7000                                 U7B02420
                    FY802 DC      FY950+3   USER ENTRY POINT            U7B02430
                    *                                                   U7B02440
                    * IBT                                               U7B02450
                    *                                                   U7B02460
                    FY803 DC      $PST4                                 U7B02470
                          DC      $PST4     RESERVED                    U7B02480
                          DC      $PST4     RESERVED                    U7B02490
                          DC      $PST4     RESERVED                    U7B02500
                          DC      FY951+5   1231                        U7B02510
                          DC      FY951+5   1403                        U7B02520
                    FY804 DC      FY951+5   2501                        U7B02530
                          DC      FY951+5   1442                        U7B02540
                          DC      FY951+5   KB/CP                       U7B02550
                          DC      FY951+5   1134/1055                   U7B02560
                    FY805 DC      FY951+8   COLUMN INTERRUPT ENTRY      U7B02570
                    FY806 DC      FY803     ADDRESS OF IBT              U7B02580
                          DC      *-*                                   U7B02590
                          END                                           U7B02600
