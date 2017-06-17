                          HDNG    CALPR -CALL SYSTEM PRINT SUBR         U7A00010
                    *             JUNE 20,1967                          U7A00020
                          ENT     CALPR                                 U7A00030
                    *************************************************** U7A00040
                    * STATUS- VERSION 1                               * U7A00050
                    *                                                 * U7A00060
                    * FUNCTION/OPERATION-                             * U7A00070
                    *    *CALPR CALLS IN THE SYSTEM PRINT SUBROUTINE. * U7A00080
                    *     A VARIABLE NUMBER OF LINES MAY BE PRINTED   * U7A00090
                    *     WITH ONE CALL IF THEY ARE SETUP IN MEMORY.  * U7A00100
                    *     ALL LINES OF PRINT MUST BE PRECEDED BY A    * U7A00110
                    *     WORD COUNT. THE WORD COUNT ADDRESS MUST BE  * U7A00120
                    *     ODD SO THE PRINT LINE CAN BEGIN WITH AN EVEN* U7A00130
                    *     ADDRESS. SKIP TO A NEW PAGE AND PRINT A HDNG* U7A00140
                    *     IS ALSO DONE.                               * U7A00150
                    *                                                 * U7A00160
                    * ENTRY POINTS-                                   * U7A00170
                    *    *CALPR-  CALLING SEQUENCE IS                 * U7A00180
                    *     CALL    CALPR                               * U7A00190
                    *     DC      ADDRESS   ADDRESS OF O/P LINE       * U7A00200
                    *     DC      N         NO OF LINE TO BE PRINTED  * U7A00210
                    *                                                 * U7A00220
                    * INPUT-N/A                                       * U7A00230
                    *                                                 * U7A00240
                    * OUTPUT-                                         * U7A00250
                    *    * LINES OF PRINT ON PRINCIPAL PRINT DEVICE   * U7A00260
                    *                                                 * U7A00270
                    *                                                 * U7A00280
                    * EXTERNAL REFERENCES-                            * U7A00290
                    *    SUBROUTINES-                                 * U7A00300
                    *       * FSLEN                                   * U7A00310
                    *       * FSYSU                                   * U7A00320
                    *    COMMA/DCOM-                                  * U7A00330
                    *       * $PBSY                                   * U7A00340
                    *                                                 * U7A00350
                    * EXITS                                           * U7A00360
                    *    NORMAL- CA590                                * U7A00370
                    *                                                 * U7A00380
                    * TABLES/WORK AREAS-                              * U7A00390
                    *    * CA900                                      * U7A00400
                    *      CA901                                      * U7A00410
                    *      CA902                                      * U7A00420
                    *      CA903                                      * U7A00430
                    *                                                 * U7A00440
                    * ATTRIBUTES-                                     * U7A00450
                    *    * RELOCATABLE                                * U7A00460
                    *                                                 * U7A00470
                    * NOTES-                                          * U7A00480
                    *    N/A                                          * U7A00490
                    *                                                 * U7A00500
                    *                                                 * U7A00510
                    *                                                 * U7A00520
                    *                                                 * U7A00530
                    *                                                 * U7A00540
                    *************************************************** U7A00550
                          HDNG    CALPR- CALL SYSTEM PRINT SUBR         U7A00560
                    *************************************************** U7A00570
                    *************************************************** U7A00580
                    *                                                   U7A00590
                    CALPR DC      *-*                                   U7A00600
                          STX  L1 CA580+1   SAVE INDEX REGISTER         U7A00610
                          STX  L2 CA582+1                               U7A00620
                          LDX  L2 CX                                    U7A00630
                          LD      CALPR     GET PARAMETERS              U7A00640
                          STO     CA015+1                               U7A00650
                          A       CA801     COMPUTE LINE CNT ADDRESS    U7A00660
                          STO     CA020+1                               U7A00670
                          A       CA801     COMPUTE RETURN ADDRESS      U7A00680
                          STO   2 CA900-CX                              U7A00690
                          LD    2 CA901-CX  FETCH ADDRESS OF PTR SUBR   U7A00700
                          BSC     Z         SKIP IF NOT IN MEMORY       U7A00710
                          MDX     CA015                                 U7A00720
                    *                                                   U7A00730
                          BSI  L  CA300     FETCH PTR SUBR              U7A00740
                    *                                                   U7A00750
                    CA015 LD   L  *-*       FETCH O/P ADDRESS           U7A00760
                          STO   2 CA902-CX                              U7A00770
                    CA020 LD   L  *-*       FETCH LINE CNT              U7A00780
                          STO   2 CA903-CX                              U7A00790
                          BSC     +-                                    U7A00800
                          MDX     CA200     GO TO HDNG PRINT            U7A00810
                    *************************************************** U7A00820
                    * PRINT THE NUMBER OF LINES REQUESTED             * U7A00830
                    *************************************************** U7A00840
                    CA100 LD    2 CA902-CX  LD WD CNT OF PRT LINE       U7A00850
                          SRT     16                                    U7A00860
                          LD    2 CA811-CX  FETCH FUNCTION CODE         U7A00870
                          BSI  I2 CA901-CX  TO PRINT                    U7A00880
                          MDX  L  $PBSY,0                               U7A00890
                          MDX     *-3                                   U7A00900
                    *************************************************** U7A00910
                    * INCR. O/P ADDRESS FOR THE NEXT LINE             * U7A00920
                    * TEST FOR LAST LINE PRINTED                      * U7A00930
                    *************************************************** U7A00940
                    *                                                   U7A00950
                          LD   I2 CA902-CX  COMPUTE ADDRESS OF          U7A00960
                          A     2 CA902-CX  *NEXT LINE                  U7A00970
                          A     2 CA801-CX                              U7A00980
                          STO   2 CA902-CX                              U7A00990
                    *                                                   U7A01000
                          MDX  L  CA903,-1  SKIP AFTER LINE             U7A01010
                          MDX     CA100     PRINT NEXT LINE             U7A01020
                    *                                                   U7A01030
                          BSC  L  CA580     GO TO RETURN                U7A01040
                          HDNG    CALPR- PRINT HEADING                  U7A01050
                    *************************************************** U7A01060
                    CA200 LD    2 CA902-CX  FETCH O/P ADDRESS           U7A01070
                          SRT     16                                    U7A01080
                          LD      CA810     FETCH FUNCTION CODE         U7A01090
                          BSI  I2 CA901-CX  SKIP TO CHAN 1              U7A01100
                          MDX  L  $PBSY,0                               U7A01110
                          MDX     *-3                                   U7A01120
                          BSI  I2 CA901-CX  PRINT HDNG                  U7A01130
                          MDX  L  $PBSY,0                               U7A01140
                          MDX     *-3                                   U7A01150
                          LD    2 CA902-CX                              U7A01160
                          SRT     16                                    U7A01170
                          LD    2 CA812-CX                              U7A01180
                          BSI  I2 CA901-CX  SPACE 1 LINE                U7A01190
                          MDX  L  $PBSY,0                               U7A01200
                          MDX     *-3                                   U7A01210
                    *                                                   U7A01220
                    *                                                   U7A01230
                    *                                                   U7A01240
                    *                                                   U7A01250
                          BSC  L  CA580     GO TO RETURN                U7A01260
                    *                                                   U7A01270
                          HDNG    CALPR- FETCH SYSTEM PRINT SUBR        U7A01280
                    *************************************************** U7A01290
                    * CALL FSLEN TO GET WD CNT AND SCTR ADDR OF SUBR  * U7A01300
                    *************************************************** U7A01310
                    *                                                   U7A01320
                    CA300 DC      *-*       ENTRY-EXIT                  U7A01330
                          STX  L2 CA319+1                               U7A01340
                    CA302 CALL    FSLEN                                 U7A01350
                          DC      153       PHASE ID                    U7A01360
                          BSC     +-        SKIP IF FOUND               U7A01370
                          MDX     CA302     TRY AGAIN                   U7A01380
                    *                                                   U7A01390
                    *************************************************** U7A01400
                    * CALL IN SYSTEM PRINT SUBROUTINE                 * U7A01410
                    *************************************************** U7A01420
                    *                                                   U7A01430
                          CALL    FSYSU                                 U7A01440
                    CA319 LDX  L2 *-*                                   U7A01450
                          STO   2 CA901-CX  STORE ENTRY ADDRESS         U7A01460
                          BSC  I  CA300                                 U7A01470
                    *                                                   U7A01480
                          HDNG    CALPR  ENDING                         U7A01490
                    *************************************************** U7A01500
                    * RESTORE INDEX REGISTERS AND RETURN TO USER      * U7A01510
                    *                                                 * U7A01520
                    *************************************************** U7A01530
                    *                                                   U7A01540
                    CA580 LDX  L1 *-*               XR 1                U7A01550
                    CA582 LDX  L2 *-*               XR 2                U7A01560
                    CA590 BSC  I  CA900     RETURN                      U7A01570
                    *                                                   U7A01580
                          HDNG    CALPR-CONSTANTS                       U7A01590
                    *************************************************** U7A01600
                    CX    DC        *-*     DUMMY                       U7A01610
                    *                                                   U7A01620
                    CA800 DC      0                                     U7A01630
                    CA801 DC      1                                     U7A01640
                    CA810 DC      /7000     FUNCTION CODES              U7A01650
                    CA811 DC      /7001                                 U7A01660
                    CA812 DC      /7002                                 U7A01670
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY U7A01680
                          HDNG    CALPR- WORKING STORAGE                U7A01690
                    *************************************************** U7A01700
                          BSS  E  0                                     U7A01710
                    CA900 DC      *-*       CALLER RETURN ADDRESS       U7A01720
                    CA901 DC      *-*       ADDR OF SYS PTR RTN         U7A01730
                    CA902 DC      *-*       ADDR OF FIRST LN OF PRT     U7A01740
                    CA903 DC      *-*       LINE CNT                    U7A01750
                    *                                                   U7A01760
                          END                                           U7A01770
