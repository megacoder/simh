                    *             JULY 6,1967                           T5J00010
                          HDNG    READZ                                 T5J00020
                          LIBR                                          T5J00030
                          ISS  04 READZ     4                           T5J00040
                    *************************************************** T5J00050
                    *                                                 * T5J00060
                    *STATUS-VERSION 2, MODIFICATION 5                 * T5J00070
                    *                                                 * T5J00080
                    *FUNCTION/OPERATION-                              * T5J00090
                    *   READZ IS CALLED BY FORTRAN PROGRAMS TO READ   * T5J00100
                    *   CARDS FROM THE 2501 CARD READER.              * T5J00110
                    *                                                 * T5J00120
                    *ENTRY POINTS-                                    * T5J00130
                    *   * READZ-CALL PORTION-ENTERED FROM SFIO        * T5J00140
                    *   * RZ060-INTERRUPT PORTION-ENTERED FROM THE ILS* T5J00150
                    *                                                 * T5J00160
                    *INPUT-                                           * T5J00170
                    *   * XR1 CONTAINS THE I/O BUFFER ADDRESS         * T5J00180
                    *                                                 * T5J00190
                    *OUTPUT-                                          * T5J00200
                    *   * A BUFFER OF DATA IN EBC CODE                * T5J00210
                    *                                                 * T5J00220
                    *EXTERNAL REFERENCES-                             * T5J00230
                    *   * $PRET                                       * T5J00240
                    *   * $PST4                                       * T5J00250
                    *   * $EXIT                                       * T5J00260
                    *   * HOLEZ                                       * T5J00270
                    *                                                 * T5J00280
                    *EXITS-                                           * T5J00290
                    *   NORMAL-                                       * T5J00300
                    *      * CALL PORTION-RZ040,   BACK TO SFIO       * T5J00310
                    *      * INTERRUPT PORTION-RZ060, BACK TO ILS     * T5J00320
                    *      * $EXIT WHEN // CARD ENCOUNTERED           * T5J00330
                    *                                                 * T5J00340
                    *   ERROR-                                        * T5J00350
                    *      * $PRET-PRE-OPERATIVE ERROR TRAP WHEN      * T5J00360
                    *        DEVICE NOT READY                         * T5J00370
                    *      * $PST4-POST OPERATIVE ERROR TRAP WHEN     * T5J00380
                    *        ERROR CONDITION                          * T5J00390
                    *                                                 * T5J00400
                    *TABLES/WORK AREAS-N/A                            * T5J00410
                    *                                                 * T5J00420
                    *ATTRIBUTES-RELOCATABLE                           * T5J00430
                    *                                                 * T5J00440
                    *NOTES-REGISTERS NOT SAVED                        * T5J00450
                    *                                                 * T5J00460
                    *************************************************** T5J00470
                    *************************************************** T5J00480
                          HDNG    READZ                                 T5J00490
                    *                                                 * T5J00500
                    *             NOTE-COMMENTS START IN COL 45 FOR   * T5J00510
                    *             FUTURE CHANGES                      * T5J00520
                    *                                                 * T5J00530
                    *************************************************** T5J00540
                    *                                                   T5J00550
                    *             WORDS FROM COMMA                      T5J00560
                    *                                                   T5J00570
                    $PRET EQU     /28       PRE-OPERATIVE ERROR TRAP    T5J00580
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   T5J00590
                    $EXIT EQU     /38       SYSTEM EXIT ADDR            T5J00600
                    *                                                   T5J00610
                    *             PROGRAM ENTRY FROM SFIO               T5J00620
                    *                                                   T5J00630
                    READZ MDX     RZ100     BRANCH TO CALL PROCESSING   T5J00640
                    RZ020 BSC  I  *-*       LOADER STORES TV ADDRESS.   T5J00650
                    RZ040 DC      /3000     CONSTANT - HOLLERITH /.     T5J00660
                    *                       MUST BE ODD ADDR FOR SD     T5J00670
                    RZ060 DC      *-*       INTERRUPT ENTRANCE.         T5J00680
                    *                                                   T5J00690
                    *             INTERRUPT PROCESSING                  T5J00700
                    *                                                   T5J00710
                          XIO     RZ340     SENSE WITH RESET.           T5J00740
                          SLA     2         TEST FOR ERROR.             T5J00750
                          BSC  L  RZ080,Z+  BR IF THERE WAS AN ERROR    T5J00760
                          SLA     16        CLEAR ACC               2-5 T5J00762
                          STO     RZ380     RESET INT SWITCH        2-5 T5J00764
                    RZ070 BSC  I  RZ060     RETURN TO ILS               T5J00770
                    RZ080 LD      RZ340     SET UP NEW ENTRY POINT      T5J00780
                          STO  I  12        *FOR RETRY OF OPERATION.    T5J00790
                    *                                                   T5J00800
                    *             POST OPERATIVE ERROR TRAP             T5J00810
                    *                                                   T5J00820
                          LD      RZ370     LOAD ERROR INDICATOR WORD   T5J00830
                          BSI  L  $PST4     BR TO POST-OP ERROR         T5J00840
                          MDX     RZ070     BR TO INTERRUPT EXIT        T5J00850
                    *                                                   T5J00860
                    *             PRE-OPERATIVE ERROR                   T5J00870
                    *                                                   T5J00880
                    RZ090 LD      RZ370     GET ERR DISPLAY CONSTANT    T5J00890
                          BSI  L  $PRET     BR TO PRE-OPERATIVE ERROR   T5J00900
                    *                                                   T5J00910
                    *             CALL PROCESSING                       T5J00920
                    *                                                   T5J00930
                    RZ100 XIO     RZ340     SENSE WITH RESET.           T5J00940
                          BSC     E         SKIP IF 2501 IS READY.      T5J00950
                          MDX     RZ090     BR TO PRE-OP ERROR TRAP     T5J00960
                    *                                                   T5J00970
                          LD      RZ390      SET WORD COUNT INTO READ   T5J00980
                          STO   1 -1         *BUFFER                    T5J00990
                    *                                                   T5J01000
                          STX   1 RZ360     SAVE ADDR I/O BUFFER        T5J01010
                          MDX  L  RZ360,-1   POINT AT WD CNT            T5J01020
                          XIO     RZ360     READ A CARD.                T5J01030
                    *                                                   T5J01040
                    *             WAIT FOR INTERRUPT                    T5J01050
                    *                                                   T5J01060
                    RZ110 MDX  L  RZ380,0   TEST INTERRUPT SW           T5J01070
                          MDX     RZ110     SWITCH NOT SET, WAIT        T5J01080
                    *                                                   T5J01090
                          STX     RZ380     SET SW FOR NEXT INTERRUPT   T5J01100
                    *                                                   T5J01110
                    *             TEST FOR // CONTROL RECORD            T5J01120
                    *                                                   T5J01130
                          LDD   1 0         LOAD 1ST 2 WORDS OF BUFFER. T5J01140
                          SD      RZ040     SUBTR DOUBLE HEX 3000 3000. T5J01150
                          BSC  L  RZ130,Z   BR IF WORD WAS NOT A SLASH  T5J01160
                          SLT     16        SHIFT IN 2ND WORD OF BUFFER T5J01170
                          BSC  L  RZ130,Z   BR IF WORD WAS NOT A SLASH  T5J01180
                          LD    1 2         LOAD 3RD WORD OF BUFFER.    T5J01190
                          BSC     +-        SKIP IF WORD NOT A BLANK    T5J01200
                          LDX     $EXIT     EXIT TO MONITOR CONTROL     T5J01210
                    RZ130 LDX   2 80        PUT CNT OF CHARS TO CONVERT T5J01220
                          SLA     16        CLEAR ACCUMULATOR.          T5J01230
                          LIBF    HOLEZ     CONVERT BUFFER TO EBCDIC.   T5J01240
                          MDX     RZ020     BRANCH TO RETURN TO USER.   T5J01250
                          BSS  E  0                                     T5J01260
                    RZ340 DC      RZ100     ERROR RETRY ENTRY POINT.    T5J01270
                          DC      /4F01     WRD 2 OF SENSE W/RESET IOCC T5J01280
                    RZ360 DC      *-*       READ                        T5J01290
                          DC      /4E00     *IOCC.                      T5J01300
                    RZ370 DC      /4000     ERROR ID                    T5J01310
                    RZ380 DC      *         INTERRUPT SW. SET NON ZERO  T5J01320
                    RZ390 DC      80         COUNT OF CHARACTERS TO RD  T5J01330
                          END                                           T5J01340
