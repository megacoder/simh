                          HDNG    4 OF 8 CODE TO 0-63 CONVERSION        W1D00010
                    *************************************************** W1D00020
                    * TITLE - HXCV                                    * W1D00030
                    * STATUS - CHANGE LEVEL 0                         * W1D00040
                    * FUNCTION/OPERATION - HXCV CONVERTS A 4-OF-8     * W1D00050
                    *  CHARACTER TO AN ACTUAL VALUE BETWEEN ZERO AND  * W1D00060
                    *  63.                                            * W1D00070
                    * ENTRY POINTS - .HXCV. CALL ENTRANCE, LIBF HXCV  * W1D00080
                    * INPUT - 4-OF-8 CHARACTER IS IN THE ACCUMULATOR, * W1D00090
                    *  LEFT-JUSTIFIED.                                * W1D00100
                    * OUTPUT - THE VALUE BETWEEN 0 AND 63 IS IN THE   * W1D00110
                    *  ACCUMULATOR, RIGHT-JUSTIFIED                   * W1D00120
                    * EXTERNAL ROUTINES - NONE                        * W1D00130
                    * EXITS-NORMAL - .LEAVE. RETURN TO LIBF+1         * W1D00140
                    *      -ERROR - NONE                              * W1D00150
                    * TABLES/WORK AREAS - .RELTB. IS A TABLE OF       * W1D00160
                    *  VALUES WHICH ARE USED TO CALCULATE THE ACTUAL  * W1D00170
                    *  0 TO 63 VALUE OF THE 4-OF-8 CHARACTER.         * W1D00180
                    * ATTRIBUTES - REUSABLE                           * W1D00190
                    * NOTES - THE VALUE CALCULATED BY .HXCV. IS USED  * W1D00200
                    *  AS A DISPLACEMENT TO LOCATE AN ENTRY IN THE    * W1D00210
                    *  .HOLCA. TABLE OR THE .STRTB. TABLE.            * W1D00220
                    *************************************************** W1D00230
                          HDNG    4 OF 8 CODE TO 0-63 CONVERSION        W1D00240
                          LIBR                                          W1D00250
                          ENT     HXCV                                  W1D00260
                    HXCV  MDX     *+2                                   W1D00270
                    LEAVE BSC  I  *-*                                   W1D00280
                    CNVRT STO     SV1       SAVE 4 OF 8 CHAR            W1D00290
                          LDX   2 -16       SET TO GO THRU LOOP TWICE   W1D00300
                    LOOP2 SRA     12        ISOLATE SINGLE HEX CHAR     W1D00310
                          SRT     1         SAVE EVEN ODD INDICATOR     W1D00320
                          A       BASE      GET ACTUAL TABLE ADDRESS    W1D00330
                          STO     *+1                                   W1D00340
                          LD   L2 *-*       GET WORD CONTAINING REL     W1D00350
                          RTE     16        ADDRS IN HOLL TABLE         W1D00360
                          BSC     +Z        IF SKP- REL ADR IS LFT 8    W1D00370
                          SLT     8         REL ADDR IS IN RIGHT 8 BIT  W1D00380
                          RTE     16                                    W1D00390
                          SRA     8                                     W1D00400
                          MDX   2 8                                     W1D00410
                          MDX     SAVIT     BR TO SAVE FIRST HEX CHAR   W1D00420
                          A       SV2       COMPUTE ACTUAL ADDRESS      W1D00430
                          MDX     LEAVE                                 W1D00440
                    SAVIT STO     SV2       HOLD TEMPORARILY            W1D00450
                          LD      SV1       GET SECOND HEX CHAR FOR     W1D00460
                          SLA     4         REL ADDRESS                 W1D00470
                          MDX     LOOP2     BR TO GET SECOND HEX CHAR   W1D00480
                    SV1   DC                TEMP FOR 4-OF-8 CHARACTER   W1D00490
                    SV2   DC                TABLE POINTER TEMPORARY     W1D00500
                    BASE  DC      RELTB+16  BASE ADDRESS OF TABLE END   W1D00510
                    RELTB DC      /0304     A                           W1D00520
                          DC      /080C     *D                          W1D00530
                          DC      /1216     * D     C                   W1D00540
                          DC      /1C22     *  R     A                  W1D00550
                          DC      /262A     *   E     L                 W1D00560
                          DC      /3036     *    S     C                W1D00570
                          DC      /3A40     *     S     U               W1D00580
                          DC      /4448     *            L              W1D00590
                          DC      /0000     *             A             W1D00600
                          DC      /0100     *              T            W1D00610
                          DC      /0201     *               I           W1D00620
                          DC      /0200     *                O    T     W1D00630
                          DC      /0303     *                 N    A    W1D00640
                          DC      /0401     *                       B   W1D00650
                          DC      /0502     *                        L  W1D00660
                          DC      /0300     *                         E W1D00670
                          END                                           W1D00680
