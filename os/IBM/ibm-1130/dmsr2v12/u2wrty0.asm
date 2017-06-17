                    *************************************************** U2O00010
                    *                                                 * U2O00020
                    *TITLE- WRTY0                                     * U2O00030
                    *STATUS- CHANGE LEVEL 7                           * U2O00040
                    *FUNCTION/OPERATION-                              * U2O00050
                    *    THIS 1130/1800 SUBROUTINE OPERATES THE PRIME * U2O00060
                    *    CONSOLE PRINTER (1053). IT INITIATES REQSTD  * U2O00070
                    *    PRINT OPERATIONS AND PROCESSES ANY PRINTER   * U2O00080
                    *    OR OPERATOR REQUEST INTERRUPTS. IT IGNORES   * U2O00090
                    *    ANY PRINTER ERRORS OR KEYBOARD INTERRUPTS.   * U2O00100
                    *ENTRY POINTS-                                    * U2O00110
                    *     1. WRTY0  CALL ENTRANCE FOR TEST OR WRITE   * U2O00120
                    *               OPERATIONS.  E.G.  LIBF    WRTY0  * U2O00130
                    *                                  DC      /2000  * U2O00140
                    *                                  DC      IOBUF  * U2O00150
                    *     2. INT1   OPERATION COMPLETE INTERRUPT ENTRY* U2O00160
                    *               POINT.                            * U2O00170
                    *INPUT- NONE OTHER THAN FROM LIBF PARAMETERS      * U2O00180
                    *OUTPUT- PRINTED.                                 * U2O00190
                    *EXTERNAL SUBROUTINES- NONE.                      * U2O00200
                    *EXITS-                                           * U2O00210
                    *  NORMAL-                                        * U2O00220
                    *     1. CALL PORTION- WR36, BACK TO USER PROGRAM * U2O00230
                    *     2. INTERRUPT PORTION- WR66, BACK TO ILS04   * U2O00240
                    *  ERROR-                                         * U2O00250
                    *     1. CALL PORTION- WR44, PRE-OPERATIVE ERROR  * U2O00260
                    *                      EXIT TO IOCS TRAP.         * U2O00270
                    *     2. INTERRUPT PORTION- WR66A, EXIT TO POST-  * U2O00280
                    *                      OPERATIVE ERROR TRAP.      * U2O00290
                    *TABLES/WORK AREAS- NONE.                         * U2O00300
                    *ATTRIBUTES- REUSABLE                             * U2O00310
                    *NOTES-                                           * U2O00320
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2O00330
                    *                                                 * U2O00340
                    *************************************************** U2O00350
                    ***   HDNG    LIBF WRTY0-V1.                        U2O00360
                          LIBR                                          U2O00370
                          ISS  02 WRTY0     4                           U2O00380
                    *************************************************** U2O00390
                    *             EDIT/LOADER DEFINED LOCATIONS       * U2O00400
                    *************************************************** U2O00410
                    WRTY0 STX   1 WR30+1    LIBF ENTRANCE          (+0) U2O00420
                    LINK  LDX  I1 0         LOADER STORES TV ADDR  (+2) U2O00430
                          MDX     WR10                                  U2O00440
                    INT1  DC      0         INTERRUPT ENTRANCE     (+4) U2O00450
                          BSC  L  WR50                                  U2O00460
                    AREA  DC      /0803     EDIT SETUP FOR GRP 0   (+7) U2O00470
                          DC      0         EDIT SETUP FOR GRP 1   (+8) U2O00480
                    *************************************************** U2O00490
                    *             LIBF PROCESSING                     * U2O00500
                    *************************************************** U2O00510
                    WR10  STX   2 WR32+1    SAVE XR2                    U2O00520
                          STS     WR34      SAVE STATUS                 U2O00530
                          STO     SAVA      SAVE A REG                  U2O00540
                          LD    1 0         GET THE CONTROL PARAM       U2O00550
                          SRA     12        IS FUNCTION TEST            U2O00560
                          BSC  L  WR12,Z    NO                          U2O00570
                          LD      COUNT     YES, IS BUSY INDR ON        U2O00580
                          BSC     Z                                     U2O00590
                          MDX   1 -1        YES, EXIT TO CALL+2         U2O00600
                          MDX     WR26      NO, EXIT TO CALL+3          U2O00610
                    WR12  S       D0002     IS FUNCTION PUT             U2O00620
                          BSC  L  WR40,Z    NO, ERROR                   U2O00630
                    WR13  LD      COUNT     IS BUSY INDR ON             U2O00640
                          BSC  L  WR13,Z    YES, LOOP                   U2O00650
                    WR14  XIO     SENSE-1   IS DEVICE READY             U2O00660
                          SLA     5                                     U2O00670
                          BSC  L  WR42,Z+   NO, ERROR                   U2O00680
                    WR20  LD   I1 1         SAVE WORD COUNT + 2         U2O00690
                          SLA     1                                     U2O00700
                          BSC  L  WR40,+    ERROR IF ZERO OR NEG        U2O00710
                          STO     COUNT     SAVE TWICE THE WD CNT       U2O00720
                          LD    1 1         GET DATA AREA ADDR          U2O00730
                          A       D0001     AVOID STORED WD CNT         U2O00740
                          STO     IOAR      SAVE I/O AREA ADDR          U2O00750
                          SRA     16        SET INDR FOR RT-HAND CHAR   U2O00760
                          STO     RIGHT                                 U2O00770
                          LD   I  IOAR      STORE CHAR INTO TEMP AREA   U2O00780
                          STO     TEMP1                                 U2O00790
                          MDX  L  50,+1     INCR ISS CTR                U2O00800
                          NOP               MAY SKIP                    U2O00810
                          XIO     PRINT     PRINT 1ST CHAR              U2O00820
                    WR26  MDX   1 +2        SET EXIT FOR CALL+3         U2O00830
                          LD      SAVA      RESTORE ACC                 U2O00840
                    WR28  STX   1 WR36+1    SET UP EXIT                 U2O00850
                    WR30  LDX  L1 *-*       RESTORE XR1                 U2O00860
                    WR32  LDX  L2 *-*       RESTORE XR2                 U2O00870
                    WR34  LDS     *-*       RESTORE STATUS              U2O00880
                    WR36  BSC  L  *-*       EXIT TO USER                U2O00890
                    *                                                   U2O00900
                    *SET UP ERROR EXITS                                 U2O00910
                    *                                                   U2O00920
                    WR40  LD      H2001     ERROR CODE - ILLEGAL CALL   U2O00930
                          MDX     WR44                                  U2O00940
                    WR42  LD      H2000     ERROR CODE - DEVC NOT READY U2O00950
                    WR44  MDX   1 -1        GET LIBF ADDR AND PUT IN    U2O00960
                          STX  L1 40        *$PRET                      U2O00970
                          LDX   1 41        SET XR1 TO EXIT TO LOC 41   U2O00980
                          MDX     WR28                                  U2O00990
                    *************************************************** U2O01000
                    *             CONSTANTS                           * U2O01010
                    *************************************************** U2O01020
                          BSS  E  0                                     U2O01030
                    PRINT DC      TEMP1     IOCC TO PRINT 1 CHAR        U2O01040
                          DC      /0902                               O U2O01050
                    COUNT DC      0         LENGTH OF I/O AREA        E U2O01060
                    SENSE DC      /0F02     IOCC TO SENSE DSW         O U2O01070
                    IOAR  DC      0         ADDR OF THE I/O AREA        U2O01080
                    SENS1 DC      /0F01     IOCC TO SENSE W/RESET       U2O01090
                    D0001 DC      +1        DECIMAL CONS                U2O01100
                    D0002 DC      +2                                    U2O01110
                    H2001 DC      /2001     ERROR CODE FOR ILLEGAL CALL U2O01120
                    H2000 DC      /2000     ERROR CODE--DVC NOT READY   U2O01130
                    SAVA  DC      0         SAVE ACC                    U2O01140
                    TEMP  DC      0         TEMPORARY STG FOR DSW       U2O01150
                    TEMP1 DC      0         CHAR TO BE PRINTED          U2O01160
                    RIGHT DC      0         CHAR INDR--0 IF RIGHT       U2O01170
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2O01180
                    *************************************************** U2O01190
                    *             INTERRUPT PROCESSING                * U2O01200
                    *************************************************** U2O01210
                    *    THIS PORTION IS ENTERED FROM AN INTERRUPT    * U2O01220
                    *    LEVEL SUBROUTINE (04 IN 1130). THE DATA AREA * U2O01230
                    *    IS UNPACKED, ONE CHARACTER AT A TIME. AFTER  * U2O01240
                    *    THE REQUESTED NUMBER OF CHARACTERS HAS BEEN  * U2O01250
                    *    PRINTED, THE ROUTINE IS SET NOT BUSY AND THE * U2O01260
                    *    IOCS COUNTER DECREMENTED TO INDICATE INTERR  * U2O01270
                    *    PROCESSING COMPLETED. IF AN OPERATOR REQUEST * U2O01280
                    *    INTERRUPT IS DETECTED, THE SUBROUTINE EXITS, * U2O01290
                    *    VIA THE ADDRESS IN LOCATION 44, TO THE USER  * U2O01300
                    *    BEFORE RETURNING CONTROL TO  THE INTERRUPT   * U2O01310
                    *    LEVEL SUBROUTINE.                            * U2O01320
                    *************************************************** U2O01330
                    WR50  XIO     SENS1-1   SENSE DVC                   U2O01340
                          STO     TEMP      IS INTRPT A PRINT REQUEST   U2O01350
                          BSC  L  WR66,-    NO,GO CHK OPERATOR REQUEST  U2O01360
                          MDX  L  COUNT,-1  YES,ANY MORE CHARS TO PRINT U2O01370
                          MDX     WR60      YES, GO PRINT NEXT          U2O01380
                          MDX  L  50,-1     NO, DECR ISS COUNTER        U2O01390
                          NOP               MAY SKIP                    U2O01400
                          MDX     WR65      GO CHK OPERATOR REQ         U2O01410
                    WR60  LD      RIGHT     WAS LAST CHAR LEFT          U2O01420
                          BSC  L  WR62,+-   BR IF YES                   U2O01430
                          MDX  L  IOAR,+1   SET FOR NEXT I/O AREA CHAR  U2O01440
                          SRA     16        LAST CHAR WAS RIGHT         U2O01450
                          STO     RIGHT     CLEAR INDR                  U2O01460
                          LD   I  IOAR      STORE CHAR IN TEMP1         U2O01470
                          MDX     WR64                                  U2O01480
                    WR62  LD      D0001                                 U2O01490
                          STO     RIGHT     SET INDR                    U2O01500
                          LD   I  IOAR                                  U2O01510
                          SLA     8         STORE CHAR IN TEMP1         U2O01520
                    WR64  STO     TEMP1     *(BITS 0-7)                 U2O01530
                    WR64A XIO     SENSE-1   IS 1053 READY               U2O01540
                          SLA     5                                     U2O01550
                          BSC  L  WR66A,Z+  NO, GO TO ERROR TRAP        U2O01560
                          XIO     SENSE-1   IS 1053 STILL READY         U2O01570
                          SLA     5                                     U2O01580
                          BSC  L  WR66A,Z+  NO,WAS CONTACT BOUNCE       U2O01590
                          XIO     PRINT     PRINT 1 CHAR                U2O01600
                    WR65  LD      TEMP                                  U2O01610
                    WR66  BSC  I  INT1      EXIT TO INTRPT LEVEL SUBR   U2O01640
                    *                                                   U2O01650
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   U2O01660
                    *ERROR CODE IN THE ACCUMULATOR.                     U2O01670
                    *                                                   U2O01680
                    WR66A LD      H2000     ERROR CODE INTO ACC         U2O01690
                          BSI  L  $PST4                                 U2O01700
                          MDX     WR64A     TRY AGAIN                   U2O01710
                          END                                           U2O01720
