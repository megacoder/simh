                          HDNG    TYPEZ                                 T5K00010
                          LIBR                                          T5K00020
                          ISS  02 TYPEZ     4                           T5K00030
                    *************************************************** T5K00040
                    *                                                 * T5K00050
                    *STATUS- VERSION 2, MODIFICATION 10               * T5K00060
                    *                                                 * T5K00070
                    *FUNCTION/OPERATION-                              * T5K00080
                    *   TYPEZ IS A SUBROUTINE TO READ KEYBOARD INPUT  * T5K00090
                    *   AND TYPE IT BACK OUT TO THE OPERATOR ALONE OR * T5K00100
                    *   TO TYPE DATA FROM CORE ON THE TYPEWRITER.     * T5K00110
                    *   TYPEZ IS CALLED FROM FORTRAN VIA THE SFIO     * T5K00120
                    *   SUBROUTINE AND IS A SELF CONTAINED PROGRAM TO * T5K00130
                    *   READ OR TYPE UP TO 80 CHARACTERS OF           * T5K00140
                    *   INFORMATION.                                  * T5K00150
                    *                                                 * T5K00160
                    *ENTRY POINTS-                                    * T5K00170
                    *   * TYPEZ-ENTERED FROM SFIO BY A LIBF    TYPEZ  * T5K00180
                    *   * KZ100-INTERRUPT PROCESSING FROM THE ILS.    * T5K00190
                    *                                                 * T5K00200
                    *INPUT-                                           * T5K00210
                    *   * XR1 CONTAINS THE I/O BUFFER ADDRESS         * T5K00220
                    *   * XR2 CONTAINS THE CHARACTER COUNT            * T5K00230
                    *   * ACC CONTAINS 0 FOR READ, 2 FOR WRITE        * T5K00240
                    *                                                 * T5K00250
                    *OUTPUT-                                          * T5K00260
                    *   * TYPEWRITER PRINT LINE                       * T5K00270
                    *   * BUFFER FULL OF DATA IN EBC IF READING       * T5K00280
                    *                                                 * T5K00290
                    *EXTERNAL REFERENCES-                             * T5K00300
                    *   * $PRET                                       * T5K00310
                    *   * GETAD                                       * T5K00320
                    *   * HOLEZ                                       * T5K00330
                    *                                                 * T5K00340
                    *EXITS-                                           * T5K00350
                    *   NORMAL-                                       * T5K00360
                    *      * CALL PORTION-TYPEZ+1, BACK TO SFIO       * T5K00370
                    *      * INTERRUPT PORTION-KZ100, BACK TO ILS     * T5K00380
                    *                                                 * T5K00390
                    *   ERROR-                                        * T5K00400
                    *      * $PRET-MONITOR PRE OPERATIVE ERROR TRAP   * T5K00410
                    *                                                 * T5K00420
                    *TABLES/WORK AREAS-EBCTB                          * T5K00430
                    *                                                 * T5K00440
                    *ATTRIBUTES-RELOCATABLE                           * T5K00450
                    *                                                 * T5K00460
                    *NOTES-REGISTERS NOT SAVED                        * T5K00470
                    *                                                 * T5K00480
                    *************************************************** T5K00490
                          HDNG    TYPEZ                                 T5K00500
                    *                                                   T5K00510
                    *             SYSTEM COMMUNICATION WORD             T5K00520
                    *                                                   T5K00530
                    $PRET EQU     /28        SYSTEM PRE-OP ERROR TRAP   T5K00540
                    $IOCT EQU     /32                               2-3 T5K00541
                    *                                                   T5K00550
                    *             PROGRAM ENTRY POINT                   T5K00560
                    *                                                   T5K00570
                    TYPEZ MDX     KZ200      BRANCH TO ENTRY POINT      T5K00580
                          BSC  I  *-*        RETURN TO CALLING PROGRAM  T5K00590
                    KZ010 DC      0          INTERRUPT INDR SWITCH      T5K00600
                    *                                                   T5K00610
                    *             INTERRUPT ENTRY AND PROCESSING PROG   T5K00620
                    *             ENTERED FROM ILS                      T5K00630
                    *                                                   T5K00640
                    KZ100 DC      *-*        RETURN ADDR                T5K00650
                          XIO     KZ904      SENSE WITH RESET           T5K00670
                          STO     KZ913      SAVE DSW                   T5K00680
                          SLA     2          TEST FOR INT REQ      2-10 T5K00682
                          BSC     -          SKIP IF INT REQ       2-10 T5K00684
                          STX     KZ010      SET SW FOR INTERRUPT  2-10 T5K00686
                          BSC  I  KZ100      RETURN TO ILS              T5K00690
                    *                                                   T5K00700
                    *             MAINLINE PORTION OF PROGRAM           T5K00710
                    *             INITIALIZATION PHASE                  T5K00720
                    *                                                   T5K00730
                    KZ200 BSC     +-         SKIP IF TYPING (ACC = 2)   T5K00740
                          LDX   2 80         SET I/P BUFR SIZE =80-READ T5K00750
                          MDX   2 1          INCR SIZE FOR CARR RETURN  T5K00760
                          STX   2 KZ911      SAVE BUFR CNT FOR RESTART  T5K00770
                          STX   1 KZ210+1    SAVE BUFR ADDR FOR RESTART T5K00780
                          STO     KZ910      SAVE RD-WRITE INDICATOR    T5K00790
                          SLA     16         CLEAR                 2-10 T5K00795
                          STO     KZ010      *INTERRUPT INDR SW    2-10 T5K00797
                    *                                                   T5K00810
                    *             RESTART ENTRY POINT IF READ ERROR     T5K00820
                    *                                                   T5K00830
                    *                                                   T5K00840
                    KZ210 LDX  L1 *-*        SET BUFFER ADDRESS         T5K00850
                          LD      KZ911      LOAD WD CNT FR TEMP STO    T5K00860
                          STO     KZ912      SAVE IN COUNT              T5K00870
                          LD      KZ902      LOAD CARR RETURN CHAR      T5K00880
                          MDX     KZ260      BR TO O/P CARR RETURN      T5K00890
                    *                                                   T5K00900
                    *             RESTART PROCEDURE COMPLETE, START     T5K00910
                    *             PROCESSING DATA                       T5K00920
                    *                                                   T5K00930
                    KZ220 LD      KZ910      LOAD RD/WRITE OPTION       T5K00940
                          BSC  L  KZ400,+-   BRANCH IF READ             T5K00950
                    *                                                   T5K00960
                    *             CONVERT DATA FROM EBC TO TYPEWRITER   T5K00970
                    *             CODE FOR TYPING                       T5K00980
                    *                                                   T5K00990
                          MDX   1 1          INCR BUFFER ADDRESS        T5K01000
                    KZ230 LD      KZ908      LOAD A LIBF    EBC         T5K01010
                          LIBF    GETAD      GET ADDRESS OF EBC TABLE   T5K01020
                          STO     KZ240+1    SAVE TABLE ADDRESS         T5K01030
                          LDX   2 -59        LD TABLE SIZE FOR SCAN     T5K01040
                          SLT     16         CLEAR EXTENSION            T5K01050
                    KZ240 LD   L2 *-*        GET EBC CHAR FROM TABLE    T5K01060
                          RTE     8          SAVE TW CHAR IN EXTENSION  T5K01070
                          EOR   1 -1         COMPARE EBC CHAR W/ BUFR   T5K01080
                          BSC  L  KZ250,+-   BR IF EQUAL                T5K01090
                          MDX   2 1          INCR TABLE COUNT           T5K01100
                          MDX     KZ240-1    CHK NXT CHAR IN TBL IF ANY T5K01110
                          LDD     KZ909      NO MATCH, LD BLANKS        T5K01120
                    KZ250 RTE     16         SHIFT TW CHAR FR EXTENSION T5K01130
                    KZ260 STO     KZ914      SAVE IN O/P BUFR WORD      T5K01140
                    KZ261 XIO     KZ904      GET SENSE DSW          2-3 T5K01142
                          SLA     5          SHIFT READY IND TO SIGN2-3 T5K01143
                          BSC  L  KZ262,-    RETURN IF READY        2-3 T5K01144
                          LD      KZ915      LOAD ERROR INDICATOR   2-3 T5K01145
                          BSI  L  $PRET      BR TO SYSTEM PRE-OP    2-3 T5K01146
                          MDX     KZ261      BR TO TRY AGAIN        2-3 T5K01147
                    KZ262 XIO     KZ906      TYPE CHARACTER             T5K01150
                    *                                                   T5K01160
                    *             INTERRUPT WAIT ROUTINE. WAIT HERE     T5K01170
                    *             UNTIL INTERRUPT OCCURS AND PROCESS IT T5K01180
                    *                                                   T5K01190
                    KZ300 LD      KZ010      LOAD INTERRUPT INDR SW     T5K01200
                          BSC  L  KZ300,+-   BR IF NO INTERRUPT OCCURES T5K01210
                    KZ302 SLA     16         CLEAR ACC                  T5K01220
                          STO     KZ010      SET SW TO WAIT FOR NXT ONE T5K01230
                          LD      KZ913      LOAD DSW SAVED             T5K01240
                          BSC  L  KZ500,+Z   BRANCH IF TYPE             T5K01250
                          XIO     KZ900      READ CHARACTER             T5K01260
                          LD    1 0          CHK IF DATA OR CONTROL     T5K01270
                          SLA     12                                    T5K01280
                          LDX   2 1          SET CHAR CNT TO 1 FOR      T5K01290
                    *                        *HOLEZ CONVERSION          T5K01300
                    *                        *SUBROUTINE                T5K01310
                    *                                                   T5K01320
                          BSC  L  KZ210,Z-   ERROR RESTART              T5K01330
                          BSC  L  KZ320,-    BRANCH IF DATA             T5K01340
                    *                                                   T5K01350
                          LD      KZ890                                 T5K01360
                          STO   1 0          STORE BLANK INTO BUFFER    T5K01370
                          MDX     TYPEZ+1    RETURN TO USER             T5K01380
                    *                                                   T5K01390
                    KZ890 DC      /0040      BLANK                      T5K01400
                    *                                                   T5K01410
                    *             CONVERT KEYBOARD CODE TO EBC          T5K01420
                    *                                                   T5K01430
                    KZ320 LIBF    HOLEZ      CONVERT CODE               T5K01440
                          MDX     KZ230      THEN, BR TO TYPE CHAR      T5K01450
                    *                                                   T5K01460
                    *             READ CHAR FROM KEYBOARD               T5K01470
                    *                                                   T5K01480
                    KZ400 XIO     KZ902      SELECT KEYBOARD            T5K01490
                    KZ401 LD      KZ916      LOAD ERROR INDICATOR   2-3 T5K01492
                          BSI  L  $PRET      BR TO PRE-OP ERROR TRAP2-3 T5K01493
                          LD      KZ010      LOAD INT IND SWITCH    2-3 T5K01494
                          BSC  L  KZ401,+-   BR IF NO INT           2-3 T5K01495
                          MDX     KZ302      BR TO WAIT FOR INT     2-3 T5K01500
                    *                                                   T5K01510
                    *             TYPE CHARACTERS                       T5K01520
                    *                                                   T5K01530
                    KZ500 STX   1 KZ900      SAVE I/O BUFR ADDR FOR NXT T5K01540
                    *                        *READ                      T5K01550
                          MDX  L  KZ912,-1   DECR CHAR CNT              T5K01570
                          MDX     KZ220      CHECK RD/WR IF MORE CHARS  T5K01580
                          MDX     TYPEZ+1    RETURN FROM SUBROUTINE     T5K01590
                    *                                                   T5K01600
                    *             CONSTANTS AND WORK AREAS              T5K01610
                    *                                                   T5K01620
                          BSS  E  0                                     T5K01630
                    KZ900 DC      0          READ IOCC                  T5K01640
                          DC      /0A00                                 T5K01650
                    KZ902 DC      /8100      SELECT KEYBOARD IOCC       T5K01660
                          DC      /0C00                                 T5K01670
                    KZ904 DC      /2000      SENSE IOCC & EQUATE        T5K01680
                          DC      /0F01                                 T5K01690
                    KZ906 DC      KZ914      TYPE IOCC                  T5K01700
                          DC      /0900                                 T5K01710
                    KZ908 LIBF    EBCTB      EBC TBL USED TO GET ADDR   T5K01720
                    KZ909 DC      /2100      BLANK IN TW CODE (ODD LOC) T5K01730
                    KZ910 DC      0          READ/WRITE INDICATOR       T5K01740
                    KZ911 DC      0          INITIAL CHAR COUNT         T5K01750
                    KZ912 DC      0          ACTUAL CHAR COUNT          T5K01760
                    KZ913 DC      0          DSW WORD                   T5K01770
                    KZ914 DC      0          READ/WRITE CHARACTER       T5K01780
                    KZ915 EQU     KZ904      ERROR INDICATED PRE-OP     T5K01790
                    KZ916 DC      /2002                             2-3 T5K01791
                    *             READY TEST SUBR MOVED INLINE      2-3 T5K01800
                          END                                           T5K01810
