                          HDNG    LIBF CARD1                            U2B00010
                    *************************************************** U2B00020
                    *                                                 * U2B00030
                    *   SUBROUTINE NAME-                              * U2B00040
                    *      FULL NAME- N/A                             * U2B00050
                    *      CODE NAME- CARD1                           * U2B00060
                    *   PURPOSE-                                      * U2B00070
                    *     THIS 1130 SUBROUTINE OPERATES THE 1442 CARD * U2B00080
                    *     READER PUNCH. IT INITIATES REQUESTED OPERA- * U2B00090
                    *     TIONS, PROCESSES ANY COLUMN OR OPERATION    * U2B00100
                    *     COMPLETE INTERRUPTS, AND, IF REQUESTED,     * U2B00110
                    *     INITIATES ERROR RECOVERY PROCEDURES.        * U2B00120
                    *   METHOD-                                       * U2B00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2B00140
                    *   CAPABILITIES AND LIMITATIONS-                 * U2B00150
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2B00160
                    *   SPECIAL FEATURES- THIS SUBROUTINE USES A USER-* U2B00170
                    *      WRITTEN ERROR RECOVERY SUBROUTINE.         * U2B00180
                    *   ADDITIONAL INFORMATION-                       * U2B00190
                    *      ESTIMATED EXECUTION TIME-                  * U2B00200
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2B00210
                    *                                                 * U2B00220
                    *************************************************** U2B00230
                          LIBR                                          U2B00240
                    1130  ISS  01 CARD1     0    4                      U2B00250
                    *************************************************** U2B00260
                    *             LOADER DEFINED LOCATIONS            * U2B00270
                    *************************************************** U2B00280
                    CARD1 STX   1 CR42+1    LIBF ENTRANCE          (+0) U2B00290
                    LINK  LDX  I1 0         LOADER STORES TV ADDR  (+2) U2B00300
                          MDX     CR10                                  U2B00310
                    INT1  DC      0         COLUMN INTERRUPT       (+4) U2B00320
                          BSC  L  CR50                                  U2B00330
                    INT2  DC      0         OP COMPLETE INTERRUPT (+7)  U2B00340
                          BSC  L  CR60                                  U2B00350
                    *************************************************** U2B00360
                    *             LIBF PROCESSING                     * U2B00370
                    *************************************************** U2B00380
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2B00390
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2B00400
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2B00410
                    *     NOT READY 1442 CAUSES AN ERROR EXIT TO      * U2B00420
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2B00430
                    *     INTERRUPTS, THE ROUTINE IS SET BUSY AND THE * U2B00440
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2B00450
                    *     INTERRUPT(S) PENDING.                       * U2B00460
                    *************************************************** U2B00470
                    CR10  STX   2 CR44+1    SAVE XR2                    U2B00480
                          STS     CR46      SAVE STATUS                 U2B00490
                          STO     TEMP      SAVE A REG                  U2B00500
                          LD    1 0         XR1= ADDR OF CONTROL PARAM  U2B00510
                          SRA     12        IS  FUNCTION TEST           U2B00520
                          BSC  L  CR12,Z    NO,BRANCH                   U2B00530
                          LD      RESTR+2   YES,IS PROGRAM BUSY         U2B00540
                          BSC     +-        YES,EXIT TO CALL+2          U2B00550
                          MDX   1 +1        NO,EXIT TO CALL+3           U2B00560
                          MDX     CR38      GO EXIT                     U2B00570
                    CR12  STO     CR24+1                                U2B00580
                          S       D0004     IS  FUNCTION LEGAL          U2B00590
                          BSC  L  CR16,Z-   NO,ERROR                    U2B00600
                    CR14  LD      RESTR+2   IS  ROUTINE BUSY            U2B00610
                          BSC  L  CR14,Z    YES,WAIT TILL NOT           U2B00620
                    CR15  LD    1 0         NO,SET UP FOR FUNCTION      U2B00630
                          SLA     12        IS  DEVICE 0                U2B00640
                          BSC  L  CR22,+-   YES                         U2B00650
                    CR16  LD      H1001     NO,LOAD ERROR CODE          U2B00660
                    CR18  MDX   1 -1                                    U2B00670
                          STX  L1 $PRET     STORE CALL ADDR IN $PRET    U2B00680
                          LDX   1 $PRET+1                               U2B00690
                          MDX     CR40      SET EXIT FOR $PRET+1        U2B00700
                    CR22  LD      FEED      SET UP IOCC FOR FUNC        U2B00710
                    CR24  LDX  L2 0         XR2  = FUNCTION CODE        U2B00720
                          A    L2 SETUP-1                               U2B00730
                          STO     INIT                                  U2B00740
                          S    L2 SETUP+3                               U2B00750
                          STO     COLM+1                                U2B00760
                    CR26  XIO     SENSE-1   IS  DEVICE READY            U2B00770
                          BSC  L  CR30,E    NO                          U2B00780
                    CR28  BSC  L2 CR28+1    YES,INITIATE FUNCTION       U2B00790
                          MDX     CR32                 = GET            U2B00800
                          MDX     CR32                 = PUT            U2B00810
                          MDX     CR33A                = FEED           U2B00820
                          MDX     CR36                 = STK            U2B00830
                    CR30  SRA     1         IS  DEVICE BUSY             U2B00840
                          BSC  L  CR26,E    YES,WAIT                    U2B00850
                          SLA     3         NO,IS ERROR BIT ON          U2B00860
                          BSC  L  CR31,-    NO                          U2B00870
                          LD      CR24+1    YES,IS FUNCT GET/FEED       U2B00880
                          BSC     E         NO                          U2B00890
                          STO     ERROR     YES,SET SKIP CARD INDR      U2B00900
                    CR31  LD      H1000     LOAD NOT READY CODE         U2B00910
                          MDX     CR18      EXIT                        U2B00920
                    CR32  LD   I1 1         INITIATE  FUNCTION          U2B00930
                          BSC  L  CR16,+    ERROR    IF COUNT NEG OR 0  U2B00940
                          STO     COUNT                                 U2B00950
                          STO     RESTR     SAVE    WORD COUNT          U2B00960
                          S       D0080     IS WORD COUNT OVER +80      U2B00970
                          BSC  L  CR16,Z-   YES,GO TO ERROR EXIT        U2B00980
                          LD    1 1         NO                          U2B00990
                          STO     COLM      SAVE ADDR OF I/O AREA       U2B01000
                          STO     RESTR+1                               U2B01010
                          STO     CR33+1                                U2B01020
                          MDX   1 +1        SET XR1 TO SKIP THIRD PARAM U2B01030
                          MDX   2 -1        IS  FUNCTION =GET           U2B01040
                          MDX     CR34      NO                          U2B01050
                    CR32A LDX  I2 COUNT                                 U2B01060
                          LD      D0001     STORE +1 IN DATA AREA       U2B01070
                    CR33  STO  L2 0         (NOT READ INDICATOR)        U2B01080
                          MDX   2 -1        NEXT WORD                   U2B01090
                          MDX     CR33      LOOP                        U2B01100
                          LD      COUNT     GET WORD COUNT              U2B01110
                          A       D0001     INCREASE WORD COUNT BY      U2B01120
                          STO     COUNT     *+1 SO PROCESS LAST         U2B01130
                          STO     RESTR     COLUMN                      U2B01140
                    CR33A XIO     SENSE-1   YES,IS LAST CD INDR ON      U2B01150
                          SLA     3                                     U2B01160
                          BSC  L  CR34,-    NO                          U2B01170
                          XIO     FEED-1    EJECT CARD                  U2B01180
                          MDX   2 0         IS FUNCTION GET             U2B01190
                          MDX     CR31      NO                          U2B01200
                          MDX   1 -1        YES,SET XR1=LIBF+1          U2B01210
                          MDX     CR31                                  U2B01220
                    CR34  XIO     SENSE-1   IS DEVICE READY         2-7 U2B01230
                          BSC  L  CR47,E    BRANCH IF NOT READY     2-7 U2B01240
                          LD    1 1         SAVE USER RESTART SUBR      U2B01250
                          STO     RESTR+2   *ADDRESS                    U2B01260
                          MDX   1 +1        SET XR1 TO SKIP 2ND PARAM   U2B01270
                          MDX  L  50,+1     INCREMENT IOCS COUNTER      U2B01280
                          NOP                                           U2B01290
                    CR36  LD      ERROR     IS SKIP CD INDR ON          U2B01300
                          BSC  L  CR37,+-                               U2B01310
                          XIO     FEED-1    YES,    FEED 1 CARD         U2B01320
                          MDX     CR38                                  U2B01330
                    CR37  XIO     INIT-1    NO,    INITIATE FUNCTION    U2B01340
                    CR38  MDX   1 +1        SET XR1 TO SKIP FIRST PARAM U2B01350
                          LD      TEMP      RESTORE A REG               U2B01360
                    CR40  STX   1 EXIT+1    SET UP EXIT                 U2B01370
                    CR42  LDX  L1 *-*       RESTORE XR1                 U2B01380
                    CR44  LDX  L2 *-*       RESTORE XR2                 U2B01390
                    CR46  LDS     *-*       RESTORE STATUS              U2B01400
                    EXIT  BSC  L  *-*       RETURN TO USER              U2B01410
                    *************************************************** U2B01420
                    *             CONSTANTS                           * U2B01430
                    *************************************************** U2B01440
                          BSS  E  0                                     U2B01450
                    SENSR DC      0                                     U2B01460
                          DC      /1702     SENSE-RESET,LEVEL 4         U2B01470
                    TEMP  DC      0         SAVE ACCUM                  U2B01480
                    CHAR  DC      /1701     TEMP REG FOR INTERPTS (ODD) U2B01490
                    COLM  DC      0         IOCC  FOR COLUMN I/O (EVEN) U2B01500
                          DC      0                              (ODD)  U2B01510
                    COUNT DC      0         NO. OF WDS TO TR            U2B01520
                    INIT  DC      0         IOCC  TO INITIATE I/O (ODD) U2B01530
                    RESTR DC      0         RESTART  INFO - COUNT       U2B01540
                          DC      0                       - IOAR        U2B01550
                          DC      0                       - ERROR ADDR  U2B01560
                    SENSE DC      /1700     IOCC  TO SENSE DEVICE (ODD) U2B01570
                    ADDR  DC      CHAR-1    ADDR  TO REPLACE I/O AREA   U2B01580
                    FEED  DC      /1402     IOCC  TO FEED CARD    (ODD) U2B01590
                    ERROR EQU     SENSR     SKIP CARD INDR              U2B01600
                    INDIC DC      0         FEED CHK (RD STATION) INDR  U2B01610
                    SETUP DC      /0002     INITIATE  READ START        U2B01620
                          DC      /FFFF               PUNCH START       U2B01630
                          DC      /0000               FEED CYCLE        U2B01640
                          DC      /007E               STACKER SELECT    U2B01650
                          DC      /0204     INITIATE  READ COLUMN       U2B01660
                          DC      /0301               PUNCH COLUMN      U2B01670
                    D0001 DC      +1        DECIMAL CONSTANTS           U2B01680
                    D0004 DC      +4        CONST TO CHECK FUNCTION     U2B01690
                    D0008 DC      8         CONST FOR PUNCH STOP BIT    U2B01700
                    D0080 DC      +80       CONST TO CHECK WD COUNT     U2B01710
                    H000F DC      /000F     MASKS AND HEXADECIMAL CONS  U2B01720
                    H0100 DC      /0100     MASK CONST                  U2B01730
                    H02FE DC      /02FE     MASK CONST                  U2B01740
                    H1000 DC      /1000     NOT READY ERROR CODE        U2B01750
                    H1001 DC      /1001     ILLEGAL CALL ERROR CODE     U2B01760
                    SDSW  DC      /1701     SENSE DSW  AREA CODE    2-2 U2B01770
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2B01780
                    $PRET EQU     /28                                   U2B01790
                    *                                                   U2B01800
                    CR47  LD      CR24+1    IS XR1                  2-7 U2B01810
                          S       SETUP     INCREASED               2-7 U2B01820
                          BSC     +         *                       2-7 U2B01830
                          MDX   1 -1        YES                     2-7 U2B01840
                          MDX     CR30      *                       2-7 U2B01850
                    *************************************************** U2B01860
                    *             COLUMN INTERRUPT PROCESSING         * U2B01870
                    *************************************************** U2B01880
                    *     THIS PORTION IS ENTERED FROM INTERPT LEVEL  * U2B01890
                    *     SUBROUTINE 00. AFTER THE REQUESTED NO. OF   * U2B01900
                    *     COLUMNS HAS BEEN READ, THE REMAINING COLUMN * U2B01910
                    *     INTERRUPTS ARE MERELY TURNED OFF AS THEY    * U2B01920
                    *     OCCUR. WHEN THE LAST COLUMN REQUESTED IS    * U2B01930
                    *     PUNCHED, AN INDICATION IS GIVEN TO THE 1442 * U2B01940
                    *     TO INITIATE AN OP COMPLETE INTERRUPT.       * U2B01950
                    *************************************************** U2B01960
                    CR50  LD      SDSW                              2-2 U2B01970
                          STO     CHAR      RESTORE SENSE IOCC          U2B01980
                          XIO     CHAR-1    SENSE DEVICE STATUS WORD    U2B01990
                          MDX  L  COUNT,-1  ANY MORE COLUMNS            U2B02000
                          MDX     CR54      YES                         U2B02010
                          BSC  L  CR52,-    IS READ CC INTERPT          U2B02020
                          MDX  L  COUNT,+1  YES,SET COUNT TO SKIP       U2B02030
                          MDX     CR56      *NEXT CC                    U2B02040
                    CR52  MDX  L  COLM,+1   NO,SET FOR NEXT WORD        U2B02050
                          LD   I  COLM      STORE STOP PUNCH            U2B02060
                          OR      D0008     *      BIT (BIT 12) IN      U2B02070
                          STO     CHAR      *      WORD & PUNCH FROM    U2B02080
                          LD      ADDR      *      TEMPORARY ADDRESS    U2B02090
                          STO     COLM                                  U2B02100
                    CR54  MDX  L  COLM,+1   SET FOR NEXT I/O WORD       U2B02110
                          XIO     COLM      EXECUTE COLUMN I/O          U2B02120
                    CR56  BSC  I  INT1      RETURN TO INTERPT LEVEL     U2B02130
                    *************************************************** U2B02140
                    *             OP COMPLETE INTERRUPT PROCESSING    * U2B02150
                    *************************************************** U2B02160
                    *     THIS PORTION IS ENTERED FROM INTERPT LEVEL  * U2B02170
                    *     SUBROUTINE 04. IF AN ERROR IS DETECTED,     * U2B02180
                    *     THE SUBROUTINE EXITS TO THE USERS ERROR     * U2B02190
                    *     ROUTINE VIA THE ERROR PARAMETER, AND        * U2B02200
                    *     GIVES THE USER THE OPTION OF TERMINATING    * U2B02210
                    *     OR RETRYING THE OPERATION. IF TERMINATION   * U2B02220
                    *     IS SELECTED OR IF NO ERROR IS DETECTED, THE * U2B02230
                    *     ROUTINE IS SET NOT BUSY AND THE IOCS        * U2B02240
                    *     COUNTER IS DECREMENTED TO INDICATE INTERPT  * U2B02250
                    *     PROCESSING COMPLETED. OTHERWISE THE SUBRT   * U2B02260
                    *     WAITS AT THE POST-OPERATIVE ERROR TRAP        U2B02270
                    *     UNTIL THE 1442 IS READY AND THE OPERATOR   *  U2B02280
                    *     PUSHES START,AT WHICH TIME THE CARDS ARE   *  U2B02290
                    *     POSITIONED AND THE I/O OP IS RE-INITIATED.  * U2B02300
                    *************************************************** U2B02310
                    CR60  XIO     SENSR     OP COMPLETE, SENSE W/RESET  U2B02320
                          SLA     3         IS OPERATION OK             U2B02330
                          BSC  L  CR70,C    NO,ERROR                    U2B02340
                    CR61  BSC  L  CR62,-    YES                         U2B02350
                          SRA     16                                    U2B02360
                          BSI  I  RESTR+2   NO,LAST CARD                U2B02370
                          LD      ADDR                                  U2B02380
                          A       D0001                                 U2B02390
                          EOR     COLM      IS FUNCTION PUT             U2B02400
                          BSC  L  CR62,Z    NO                          U2B02410
                          MDX  L  INIT,+1                               U2B02420
                          XIO     INIT-1    YES,EJECT LAST CARD         U2B02430
                    CR62  LD      ERROR     WAS  THIS A SKIP OPERATION  U2B02440
                          NOP                                       2-3 U2B02450
                          SLA     16                                2-3 U2B02460
                          STO     ERROR                                 U2B02470
                          BSC  L  CR72,C    YES,    INITIATE FUNCTION   U2B02480
                    CR64  STO     RESTR+2   CLEAR   ROUTINE BUSY INDR   U2B02490
                          MDX  L  50,-1     DECREMENT IOCS COUNTER      U2B02500
                          NOP                                           U2B02510
                    CR66  BSC  I  INT2      RETURN  TO INTERRUPT LEVEL  U2B02520
                    CR70  STO     INDIC     SAVE FEED CHECK (READ STA-  U2B02530
                          LD      D0001     TION) INDR.                 U2B02540
                          BSI  I  RESTR+2                               U2B02550
                          BSC  L  CR64,+-   RESTART NOT REQUESTED       U2B02560
                          LD      INIT      IS FUNCTION PUNCH           U2B02570
                          BSC  L  CR72,E    YES,DONT SKIP               U2B02580
                          SRA     1         IS FUNCTION FEED            U2B02590
                          BSC  L  CR73B,E   YES                         U2B02600
                          LD      RESTR+1   FUNCTION IS GET             U2B02610
                          EOR     COLM      WAS FIRST CC READ           U2B02620
                          BSC  L  CR73E,+-  NO,SKIP ONE CARD            U2B02630
                    CR72  XIO     SENSE-1   IS DEVICE READY             U2B02640
                          BSC  L  CR75,E    NO,GO TO ERROR TRAP         U2B02650
                          LD      ERROR     IS  CARD SKIP NECESSARY     U2B02660
                          BSC  L  CR73,+-   NO                          U2B02670
                          XIO     FEED-1    SKIP FIRST CARD             U2B02680
                          MDX     CR66                                  U2B02690
                    CR73  LD      RESTR     REINITIATE I/O              U2B02700
                          STO     COUNT     *OPERATION FROM             U2B02710
                          LD      RESTR+1   *SAVED INFORMATION          U2B02720
                          STO     COLM                                  U2B02730
                          XIO     INIT-1                                U2B02740
                          MDX     CR66      RETURN                      U2B02750
                    CR73B LD      INDIC     WAS ERROR FEED CHK(READ     U2B02760
                          SLA     4         *STATION)                   U2B02770
                          BSC  L  CR72,Z+   YES,DONT SKIP               U2B02780
                    CR73E LD      D0001                             2-3 U2B02790
                          STO     ERROR     SET BIT 1 OF INDR           U2B02800
                          MDX     CR72      GO SENSE DEVICE READY       U2B02810
                    *                                                   U2B02820
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   U2B02830
                    *ERROR CODE IN THE ACCUMULATOR.                     U2B02840
                    *                                                   U2B02850
                    CR75  LD      H1000     ERROR CODE INTO A REG       U2B02860
                          BSI  L  $PST4                                 U2B02870
                          MDX     CR72      TRY AGAIN                   U2B02880
                          END                                           U2B02890
