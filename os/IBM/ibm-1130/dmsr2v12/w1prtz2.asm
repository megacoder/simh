                          HDNG    PRTZ2                                 W1K00010
                          LIBR                                          W1K00020
                          ENT     PRTZ2                                 W1K00030
                    *************************************************** W1K00040
                    *                                                 * W1K00050
                    *STATUS- VERSION 2, MODIFICATION 4                * W1K00060
                    *                                                 * W1K00070
                    *FUNCTION/OPERATION-                              * W1K00080
                    *   THIS SUBROUTINE IS TO REPLACE PRNTZ IN CORE   * W1K00090
                    *   LOADS BY MEANS OF THE CONTROL RECORD *EQUAT   * W1K00100
                    *   IT CONVERTS A CALLING SEQUENCE FOR PRNTZ INTO * W1K00110
                    *   A CALLING SEQUENCE FOR PRNT2. THEREFORE IT HAS* W1K00120
                    *   TO BE USED WHEN THE SCA IS IN OPERATION.      * W1K00130
                    *                                                 * W1K00140
                    *ENTRY POINTS-                                    * W1K00150
                    *   * PRTZ2-CALL PORTION FROM FORTRAN SFIO PROGRAM* W1K00160
                    *   * AP500-ERROR ROUTINE                         * W1K00170
                    *   THE SUBROUTINE IS ENTERED BY A LIBF TO PRTZ2  * W1K00180
                    *                                                 * W1K00190
                    *INPUT-                                           * W1K00200
                    *   * XR1 CONTAINS THE OUTPUT BUFFER ADDRESS      * W1K00210
                    *   * XR2 CONTAINS THE WORD COUNT                 * W1K00220
                    *                                                 * W1K00230
                    *OUTPUT-                                          * W1K00240
                    *   * A CALLING SEQUENCE FOR PRNT2 TO PERFORM     * W1K00250
                    *     SPACING AND PRINTING ON THE 1132            * W1K00260
                    *                                                 * W1K00270
                    *EXTERNAL REFERENCES-                             * W1K00280
                    *   * $1132                                       * W1K00290
                    *                                                 * W1K00300
                    *EXITS-                                           * W1K00310
                    *   NORMAL-                                       * W1K00320
                    *      * AP000, BACK TO SFIO                      * W1K00330
                    *                                                 * W1K00340
                    *   ERROR-                                        * W1K00350
                    *      * NONE                                     * W1K00360
                    *                                                 * W1K00370
                    *TABLE/WORK AREAS-N/A                             * W1K00380
                    *                                                 * W1K00390
                    *ATTRIBUTES-RELOCATABLE                           * W1K00400
                    *                                                 * W1K00410
                    *NOTES-REGISTERS NOT SAVED                        * W1K00420
                    *                                                 * W1K00430
                    *************************************************** W1K00440
                          HDNG    PRTZ2                                 W1K00450
                    $1132 EQU     /7F       CH 12 INDICATOR FOR 1132    W1K00460
                    *                                                   W1K00470
                    PRTZ2 MDX     AP010     BRANCH PAST ENTRY POINT     W1K00480
                    AP000 BSC  I  *-*       LIBF ENTRY POINT            W1K00490
                    *                                                   W1K00500
                    AP010 LD    1 0         GET LINE CONTROL CHARACTER  W1K00510
                          STO     AP900     *FROM BUFFER                W1K00520
                          STX   2 AP901     STORE CHARACTER COUNT       W1K00530
                          LD      AP901     EVENIZE                     W1K00540
                          BSC     E         *THE CHARACTER              W1K00550
                          S       AP902     *COUNT                      W1K00560
                          SRA     1         CONVERT TO WORD COUNT AND   W1K00570
                          STO   1 0         PLACE IN FRONT OF BUFFER    W1K00580
                          STX   1 AP060     SET I/O AREA ADDRESS        W1K00590
                    *                                                   W1K00600
                          BZ      AP040     SKIP PACKING IF WC IS ZERO  W1K00610
                          MDX  L  AP901,-1  SET CHARACTER COUNT         W1K00620
                    *                                                   W1K00630
                          LDX  I2 AP060     SET XR2 TO OUTPUT POINTER   W1K00640
                          MDX   2 1         *FOR PACKING BUFFER         W1K00650
                    *                                                   W1K00660
                    AP020 MDX   1 1         INCREMENT INPUT POINTER     W1K00670
                          LD    2 0         LOAD ONE WORD               W1K00680
                          SLA     8         SHIFT LEFT                  W1K00690
                          MDX  L  AP901,-1  SKIP IF THRU                W1K00700
                          MDX     AP030     BRANCH TO CONTINUE PACKING  W1K00710
                    *                                                   W1K00720
                          OR      AP906     BLANK IN SEC HALF OF WORD   W1K00730
                          STO   1 0         STORE BACK IN BUFFER        W1K00740
                          MDX     AP040     BRANCH TO CONTINUE          W1K00750
                    *                                                   W1K00760
                    AP030 OR    2 1         OR IN SECOND HALF OF WORD   W1K00770
                          STO   1 0         STORE BACK IN BUFFER        W1K00780
                          MDX   2 2         INCREMENT INPUT POINTER     W1K00790
                          MDX  L  AP901,-1  SKIP IF THRU                W1K00800
                          MDX     AP020     GO INCREMENT INPUT POINTER  W1K00810
                    *                                                   W1K00820
                    AP040 LD      AP900     CHECK LINE CONTROL CHAR     W1K00830
                          S       AP903     *FOR '1'                    W1K00840
                          BZ      AP100     BR IF ZERO FOR SKIP TO CH1  W1K00850
                    *                                                   W1K00860
                          S       AP904     CHECK FOR '+'               W1K00870
                          BZ      AP050     YES - PRINT SPACE SUPPRESS  W1K00880
                    *                                                   W1K00890
                          LD   L  $1132     CHECK CHAN 12 INDICATOR     W1K00900
                          BNZ     AP100     BR IF ON TO SKIP TO CHAN 1  W1K00910
                    *                                                   W1K00920
                    AP045 LIBF    PRNT2     CALL PRNT2                  W1K00930
                          DC      /3D00     *FUNCTION SPACE ONE         W1K00940
                    *                                                   W1K00970
                          LD      AP900     CHECK LINE CONTROL CHAR     W1K00980
                          S       AP905     *FOR '0'                    W1K00990
                          BNZ     AP050     BR IF NOT TO PRINT LINE     W1K01000
                          STO     AP900     RESET LINE CONTROL          W1K01010
                          B       AP045     PERFORM ANOTHER SPACE       W1K01020
                    *                                                   W1K01030
                    AP050 LD   I  AP060     LOAD WORD COUNT             W1K01040
                          BZ      AP070     EXIT IF ZERO                W1K01050
                    *                                                   W1K01060
                          LIBF    PRNT2     CALL PRNT2                  W1K01070
                          DC      /2010     *FUNCTION PRINT             W1K01080
                    AP060 DC      *-*       *I/O AREA ADDRESS           W1K01090
                          DC      AP500     *ADDRESS OF ERROR ROUTINE   W1K01100
                    *                                                   W1K01110
                    AP070 LIBF    PRNT2     CALL PRNT2                  W1K01120
                          DC      /0000     *FUNCTION TEST FOR BUSY     W1K01130
                          B       AP070     BRANCH IF BUSY              W1K01140
                          B       AP000     BRANCH TO EXIT              W1K01150
                    *                                                   W1K01160
                    AP100 LIBF    PRNT2     CALL PRNT2                  W1K01170
                          DC      /3100     FUNCTION SKIP TO CHAN 1     W1K01180
                          B       AP050     RETURN TO PRNT2             W1K01210
                    *                                                   W1K01220
                    AP500 DC      *-*       PRTZ2 ERROR ROUTINE         W1K01230
                          SLA     16        CLEAR ACCUMULATOR           W1K01240
                          BSC  I  AP500     RETURN                      W1K01270
                    *                                                   W1K01280
                    *                                                   W1K01310
                    *                                                   W1K01320
                    AP900 DC      *-*       LINE CONTROL CHARACTER      W1K01330
                    AP901 DC      *-*       CHARACTER COUNT             W1K01340
                    AP902 DC      1         CONSTANT                    W1K01350
                    AP903 DC      .1        SKIP TO CHAN 1 CODE         W1K01360
                    AP904 DC      .+-.1     SPACE SUPPRESS CODE         W1K01370
                    AP905 DC      .0        DOUBLE SPACE   CODE         W1K01380
                    AP906 DC      .         BLANK                       W1K01390
                    *                                                   W1K01400
                          END                                           W1K01410
