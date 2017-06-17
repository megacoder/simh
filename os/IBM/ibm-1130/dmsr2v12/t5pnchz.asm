                          HDNG    PNCHZ                                 T5G00010
                          LIBR                                          T5G00020
                          ISS  01 PNCHZ     0    4                      T5G00030
                    *************************************************** T5G00040
                    *STATUS-VERSION 2 MODIFICATION 6                  * T5G00050
                    *                                                 * T5G00060
                    *FUNCTION/OPERATION-                              * T5G00070
                    *   THIS ROUTINE IS USED BY FORTRAN PROGRAMS TO   * T5G00080
                    *   OPERATE THE 1442 PUNCH ONLY.  IT INITIATES BY * T5G00090
                    *   A PUNCH REQUEST AND PUNCHES A FULL CARD OF    * T5G00100
                    *   INFORMATION AFTER CONVERTING THE DATA FROM    * T5G00110
                    *   EBC TO HOLLERITH                              * T5G00120
                    *                                                 * T5G00130
                    *ENTRY POINTS-                                    * T5G00140
                    *   * PNCHZ-CALL PORTION FROM FORTRAN SFIO PROGRAM* T5G00150
                    *   * PZ060-COLUMN INTERRUPT                      * T5G00160
                    *   THE SUBROUTINE IS ENTERED BY A LIBF    PNCHZ  * T5G00170
                    *                                                 * T5G00180
                    *INPUT-                                           * T5G00190
                    *   * XR1  CONTAINS THE I/O BUFFER ADDRESS        * T5G00200
                    *   * XR2  CONTAINS THE CHARACTER COUNT OF 80     * T5G00210
                    *   * THE  ACC CONTAINS A 2 TO INDICATE PUNCHING  * T5G00220
                    *                                                 * T5G00230
                    *OUTPUT-                                          * T5G00240
                    *   * A PUNCHED CARD IN HOLLERITH                 * T5G00250
                    *                                                 * T5G00260
                    *EXTERNAL REFERENCES-                             * T5G00270
                    *   * HOLEZ                                       * T5G00280
                    *   * $PRET                                       * T5G00290
                    *   * $PST4                                       * T5G00300
                    *   * $LAST                                         T5G00310
                    *                                                 * T5G00320
                    *EXITS-                                           * T5G00330
                    *   NORMAL                                        * T5G00340
                    *      * CALL PORTION -PNCHZ+1,BACK TO SFIO PROG  * T5G00350
                    *      * INTERRUPT PORTION- PZ060, BACK TO ILS04  * T5G00360
                    *   ERROR-                                        * T5G00370
                    *      * $PRET-SYSTEM PREOPERATIVE ERROR TRAP     * T5G00380
                    *        WHEN NOT READY                           * T5G00390
                    *      * $PST4-SYSTEM POSTOPERATIVE ERROR TRAP    * T5G00400
                    *        WHEN ERROR OR FEED CHECK                 * T5G00410
                    *                                                 * T5G00420
                    *TABLES/WORK AREAS-N/A                            * T5G00430
                    *                                                 * T5G00440
                    *ATTRIBUTES-RELOCATABLE                           * T5G00450
                    *                                                 * T5G00460
                    *NOTES-REGISTERS NOT SAVED                        * T5G00470
                    *                                                 * T5G00480
                    *************************************************** T5G00490
                          HDNG    PNCHZ                                 T5G00500
                    *                                                   T5G00510
                    *             SYSTEM LOCATIONS                      T5G00520
                    *                                                   T5G00530
                    $PRET EQU     /28       ADDR PRE-OP ERROR TRAP      T5G00540
                    $PST4 EQU     /8D       ADDR  POST-OP ERROR TRAP    T5G00550
                    $LAST EQU     /33        SYSTEM LAST CARD INDICATOR T5G00560
                    *                                                   T5G00570
                    *************************************************** T5G00580
                    *                                                 * T5G00590
                    *NOTE-COMMENTS START IN COL. 45 OF THIS PROGRAM   * T5G00600
                    *                                                 * T5G00610
                    *************************************************** T5G00620
                    *                                                   T5G00630
                    *             LIBF ENTRY POINT FROM SFIO            T5G00640
                    *                                                   T5G00650
                    PNCHZ MDX     PZ100     BRANCH AROUND ENTRY POINTS. T5G00660
                    PZ020 BSC  I  *-*       LOADER STORES TV ADDRESS.   T5G00670
                    PZ040 DC      *-*       ROUTINE BUSY INDICATOR.     T5G00680
                    *                                                   T5G00690
                    *             COLUMN INTERRUPT ENTRY POINT          T5G00700
                    *                                                   T5G00710
                    PZ060 DC      *-*       COLUMN INTERRUPT ENTRANCE.  T5G00720
                          XIO     PZ320     SENSE WITH RESET.           T5G00730
                          MDX     PZ200     BR TO SERVICE COLUMN INTRPT T5G00740
                    *                                                   T5G00750
                    *             OPERATION COMPLETE ENTRY POINT        T5G00760
                    *                                                   T5G00770
                    PZ080 DC      *-*       OP COMPLETE INTRPT ENTRANCE T5G00780
                          XIO     PZ320     SENSE  WITH RESET           T5G00790
                          SLA     3          ERROR-C, LAST CD-SIGN      T5G00800
                          BSC  L  PZ090,C    BRANCH IF ERROR            T5G00810
                          SLA     4          SHIFT FEED CHECK BIT       T5G00840
                          BSC  L  PZ090,+Z  BR ON FEED CHECK ERROR      T5G00850
                          SLA     16        CLEAR ROUTINE               T5G00860
                          STO     PZ040     *BUSY INDICATOR.            T5G00870
                    PZ085 BSC  I  PZ080     RETURN  TO INTERRUPT LEVEL4 T5G00880
                    PZ090 LD      PZ320     SET UP NEW ENTRY POINT FOR  T5G00890
                          STO  I  12        *RETRY OF OPERATION.        T5G00900
                          LD      PZ400     POST-OP ERROR INDICATOR     T5G00910
                          BSI  L  $PST4     BR TO POST-OP ERR TRAP      T5G00920
                          MDX     PZ085     BR OUT OF INTERRUPT         T5G00930
                    *                                                   T5G00940
                    *             MAINLINE INITIALIZATION AND PROCESS   T5G00950
                    *                                                   T5G00960
                    PZ100 STX   1 PZ120+1   SAVE BUFR ADDR FOR RECOVERY T5G00970
                          LIBF    HOLEZ     CONVERT BUFFER TO HOLLERITH T5G00980
                    PZ120 LDX  L1 *-*       LOAD STARTING BUFR ADDR     T5G00990
                          STX   1 PZ340     SET PUNCH WD W/ BUFR ADDR   T5G01000
                          MDX  L  PZ040,1   SET ROUTINE BUSY INDICATOR  T5G01010
                    *                                                   T5G01020
                          XIO     PZ320                             2-6 T5G01040
                          SLA     3         TEST FOR LAST CARD          T5G01050
                          BSC     +Z        SKIP IF NOT LAST CARD       T5G01060
                    *                                                   T5G01070
                          XIO     PZ400     FEED LAST CARD              T5G01080
                    *                                                   T5G01090
                          NOP                                           T5G01100
                          XIO     PZ320     SENSE WITH RESET            T5G01110
                    *                                                   T5G01120
                          BSC     E         SKIP IF 1442 IS READY       T5G01130
                    *                                                   T5G01140
                          MDX     PZ290     GO TO PRE-OP ERR TRAP EXIT  T5G01150
                          XIO     PZ360     INITIATE PUNCH OPERATION.   T5G01160
                          MDX  L  PZ040,0   LOOP UNITL INTERRUPTION OR  T5G01170
                          MDX     *-3       *ROUTINE BUSY INDR = 0.     T5G01180
                    *                                                   T5G01190
                          MDX     PZ020     BRANCH TO RETURN TO USER    T5G01200
                    *                                                   T5G01210
                    *             COLUMN INTERRUPT ENTRANCE             T5G01220
                    *                                                   T5G01230
                    PZ200 XIO     PZ340     PUNCH A COLUMN.             T5G01240
                          MDX  L  PZ340,1   INCR 1ST WORD OF PUNCH IOCC T5G01250
                          BSC  I  PZ060     RETURN TO INTERRUPT LEVEL 0 T5G01260
                    *                                                   T5G01270
                    *             PRE-OPERATIVE ERROR-1442 NOT READY    T5G01280
                    *                                                   T5G01290
                    PZ290 LD      PZ400     PRE-OP ERR INDICATOR        T5G01300
                          BSI  L  $PRET     BR TO PRE-OP ERR TRAP       T5G01310
                          MDX     PZ120     BR TO CONTINUE PROCESSING   T5G01320
                    *                                                   T5G01330
                    *             CONSTANTS AND STORAGE AREAS           T5G01340
                    *                                                   T5G01350
                    PZ300 DEC     0         WORDS FOR SAVING ACC/EXT.   T5G01360
                    PZ320 DC      PZ120     ADDR OF ERROR REENTRY POINT T5G01370
                          DC      /1703     WRD 2 OF SENSE W/RESET IOCC T5G01380
                    PZ340 DC      *-*       PUNCH                       T5G01390
                          DC      /1100     *IOCC.                      T5G01400
                    PZ360 DC      *-*       INITIALIZE WRITE            T5G01410
                          DC      /1401     *IOCC.                      T5G01420
                    PZ400 DC      /1000     ERROR INDICATOR TO DISPLAY  T5G01430
                          DC      /1402     FEED IOCC                   T5G01440
                          END                                           T5G01450
