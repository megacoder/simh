                          HDNG    PRNZ                                  T5I00010
                          LIBR                                          T5I00020
                          ISS  09 PRNZ      4                           T5I00030
                    *************************************************** T5I00040
                    *                                                 * T5I00050
                    *STATUS - VERSION 2, MODIFICATION 12              * T5I00060
                    *                                                 * T5I00070
                    *FUNCTION/OPERATION-                              * T5I00080
                    *   PRNZ IS AN ISS SUBROUTINE CALLED BY FORTRAN   * T5I00090
                    *   SFIO TO PRINT A LINE OF OUTPUT ON THE 1403    * T5I00100
                    *   PRINTER. A CARRIAGE CONTROL OPERATION IS      * T5I00110
                    *   PERFORMED PRIOR TO PRINTING A LINE. THE       * T5I00120
                    *   CARRIAGE CONTROL CHARS ARE BASED ON THE       * T5I00130
                    *   FIRST CHARACTER OF THE PRINT BUFFER.          * T5I00140
                    *   THE FIRST CHARACTER CAN BE AS FOLLOWS-        * T5I00150
                    *      * 00F1 - SKIP TO CHANNEL 1 BEFORE PRINTING * T5I00160
                    *   * XR2 CONTAINS THE NUMBER OF CHARACTERS TO    * T5I00170
                    *     BE PRINTED                                  * T5I00180
                    *                                                 * T5I00190
                    *OUTPUT-                                          * T5I00200
                    *   * A LINE OF PRINT ON THE 1403, SPACED         * T5I00210
                    *     ACCORDING TO THE CARRIAGE CONTROL CHARACTER * T5I00220
                    *                                                 * T5I00230
                    *EXTERNAL REFERENCES-                             * T5I00240
                    *   * $1403                                       * T5I00250
                    *   * $PRET                                       * T5I00260
                    *   * $IOCT                                    2-3* T5I00270
                    *   * $PST4                                    2-3* T5I00280
                    *   * $LEV4                                    2-3* T5I00290
                    *                                                 * T5I00300
                    *EXITS-                                           * T5I00310
                    *   NORMAL-                                       * T5I00320
                    *      * CALL PORTION-PRNZ+1, BACK TO SFIO        * T5I00330
                    *      * INTERRUPT PORTION-WZ100 BACK TO THE ILS  * T5I00340
                    *                                                 * T5I00350
                    *   ERROR-                                        * T5I00360
                    *      * $PRET-MONITOR PRE-OPERATIVE ERROR TRAP   * T5I00370
                    *        WHEN 1403 NOT IN READY STATUS            * T5I00380
                    *      * $PST4 IF ERROR DETECTED WHEN          2-3* T5I00390
                    *        PROCESSING AN INTERRUPT               2-3* T5I00400
                    *                                                 * T5I00410
                    *TABLES/WORK AREAS-                               * T5I00420
                    *   SELF CONTAINED EBC-1403 CODE TABLE CONTAINING * T5I00430
                    *   EBC CHARACTERS IN FIRST 8 BITS, 1403 CODE IN  * T5I00440
                    *   NEXT 8 BITS. TABLE CONTAINS 36 ALPHA AND      * T5I00450
                    *   NUMERIC CHARACTERS AND 13 SPECIAL CHARACTERS. * T5I00460
                    *                                                 * T5I00470
                    *ATTRIBUTES-RELOCATABLE                           * T5I00480
                    *                                                 * T5I00490
                    *NOTES-NO REGISTERS SAVED                         * T5I00500
                    *                                                 * T5I00510
                    *************************************************** T5I00520
                          HDNG    PRNZ                                  T5I00530
                    *                                                   T5I00540
                    *             SYSTEM CONSTANT AREAS                 T5I00550
                    *                                                   T5I00560
                    $1403 EQU     /80        1403 CHAN 12 INDICATOR WD  T5I00570
                    $PRET EQU     /28        PRE-OPERATIVE ERROR TRAP   T5I00580
                    $IOCT EQU     /32        PENDING INTRPT CNT     2-3 T5I00590
                    $PST4 EQU     /8D        POST OPERATIV          2-3 T5I00600
                    $LEV4 EQU     /C         LEVEL 4 INTRPT ADDR    2-3 T5I00610
                    *                                                   T5I00620
                    *             PROGRAM ENTRY POINT                   T5I00630
                    *                                                   T5I00640
                    PRNZ  MDX     WZ200      BR TO IN LINE CODING       T5I00650
                          BSC  I  *-*        EXIT FROM SUBROUTINE-SFIO  T5I00660
                    WZ010 DC      /9000      ERROR INDICATOR WORD       T5I00670
                    *                                                   T5I00680
                    *                                                   T5I00690
                    *                                                   T5I00700
                    WZ100 DC      *-*        INTERRUPT ENTRY            T5I00710
                          XIO     WZ906      SENSE W/ RESET             T5I00720
                          STO     WZ943      SAVE NEW DSW           2-3 T5I00730
                          OR      WZ935      COMBINE WITH OLD DSW   2-3 T5I00740
                          STO     WZ935      *AND SAVE FOR ERR CHECK2-3 T5I00750
                          LD      WZ943      GET NEW DSW            2-3 T5I00760
                          SLA     2          CHK FOR PRINT COMPLETE 2-3 T5I00770
                    *                        *INTERRUPT                 T5I00780
                          BSC  L  WZ110,-    BR IF CARRIAGE OR TR   2-3 T5I00790
                    *                                               2-3 T5I00800
                    *             CHECK IF ANY ERROR BITS SET       2-3 T5I00810
                    *             IF SO BR TO $PST4                 2-3 T5I00820
                    *                                               2-3 T5I00830
                          LD      WZ935      GET SAVED DSW          2-3 T5I00840
                          AND     WZ936      ANY ERRORS             2-3 T5I00850
                          BSC  L  WZ120,+-   *BR IF NO              2-5 T5I00860
                          SLA     16         CLEAR                  2-3 T5I00890
                          STO     WZ935      *SAVED DSW             2-3 T5I00900
                          LD      WZ937      GET PRINT CHECK CODE   2-5 T5I00910
                          BSI  L  $PST4      BR TO POST OF ERR TRAP 2-3 T5I00920
                          MDX     WZ120                             2-5 T5I00925
                    *                                                   T5I00930
                    *             SET CHANNEL 12 INDR IN COMMA          T5I00940
                    *                                                   T5I00950
                    WZ110 BSC  L  WZ130,C    BR ON TRANSFER COMPLETE2-5 T5I00955
                          SLA     10         CHECK DSW FOR CHANNEL 12   T5I00960
                          SRA     15         SHIFT BIT TO POSITION 15   T5I00970
                    *                                                   T5I00980
                          MDX  L  WZ940,0    SKIP IF NOT CHANNEL 1      T5I00990
                          MDX     WZ115      BRANCH IF CHANNEL 1        T5I01000
                    *                                                   T5I01010
                          OR   L  $1403      OR BIT TO SYSTEM WORD IF   T5I01020
                          STO  L  $1403      * CHANNEL 12 FOUND         T5I01030
                    *                                                   T5I01040
                    WZ115 SLA     16                                    T5I01050
                          STO     WZ940      CLEAR CHANNEL 1 SWITCH     T5I01060
                    *                                                   T5I01070
                    WZ120 MDX  L  $IOCT,-1   DECR PENDING INTRPT CNT    T5I01080
                          NOP                IN CASE CTR = 0            T5I01090
                          BSC  I  WZ100      RETURN TO ILS              T5I01100
                    *                                                   T5I01110
                    *             TRANSFER COMPLETE                     T5I01120
                    *                                                   T5I01130
                    WZ130 SLA     16         CLEAR                  2-5 T5I01135
                          STO     WZ934      *TRANSFER COPLETE          T5I01140
                          MDX     WZ120      *SWITCH                    T5I01150
                    *                                                   T5I01160
                    *             CONSTANTS AND WORK AREAS              T5I01170
                    *                                                   T5I01180
                          BSS  E  0                                     T5I01190
                    WZ900 DC      WZ902      SPACE IOCC ADDR AND        T5I01200
                          DC      /A900      *SKIP IOCC WORD            T5I01210
                    WZ902 DC      /0800      SPACE IOCC                 T5I01220
                          DC      /AC00                                 T5I01230
                    WZ904 DC      *-*        PRINT BUFFER ADDR AND      T5I01240
                          DC      /AD00      *PRINT IOCC                T5I01250
                    WZ906 DC      /003F      6 BIT MASK FOR EBCDIC  2-3 T5I01260
                          DC      /AF01      *AND SENSE IOCC WITH RESET T5I01270
                    WZ935 DC      *-*        CELL WHERE DSW SAVED   2-3 T5I01280
                    WZ936 DC      /8600      ERROR MASK             2-3 T5I01290
                    WZ908 DC      0          CHARACTER COUNT AND        T5I01300
                          DC      /AF00      *SENSE IOCC WITHOUT RESET  T5I01310
                    WZ910 DC      60         CONSTANT = MAX O/P WD CNT  T5I01320
                    WZ920 EQU     WZ908      CHAR COUNT                 T5I01330
                    WZ921 EQU     WZ906      6 BIT MASK FOR EBCDIC  2-3 T5I01340
                    WZ930 DC      /00F1      SKIP TO CHANNEL 1 TEST     T5I01350
                    WZ931 DC      /00A3      SUPPRESS SPACE TEST CODE   T5I01360
                    WZ932 DC      /00A2      DOUBLE SPACE TEST          T5I01370
                    WZ933 DC      0          TEMPORARY CHAR STORAGE WD  T5I01380
                    WZ934 DC      0          TRANS COMPLETE EWITCH  2-3 T5I01390
                    WZ937 DC      /9002      PRINT CHECK ERROR CODE 2-5 T5I01415
                    WZ940 DC      0          NON-ZERO IF CHANNEL 1      T5I01420
                    WZ941 DC      WZ990      TABLE ADDRESS          2-3 T5I01434
                    WZ942 DC      /FF00      1403 TABLE MASK        2-3 T5I01436
                    WZ943 DC      *-*       STORAGE FOR DSW         2-9 T5I01438
                    *                                                   T5I01440
                    *             MAINLINE AND INITIALIZATION           T5I01450
                    *                                                   T5I01460
                    WZ200 STX   1 WZ320+1    SAVE BUFFER ADDRESS        T5I01470
                          STX   1 WZ904      SAVE BUFFER ADDRESS        T5I01480
                    *                                                   T5I01490
                    *             TEST FOR CARRIAGE CONTROL             T5I01500
                    *                                                   T5I01510
                          LD    1 0          LOAD CARRIAGE CONTROL CHAR T5I01520
                          S       WZ930      SUBTRACT CHANNEL 1 SKIP    T5I01530
                          BSC     Z         A PAGE EJECT IS REQ'D? 2-12 T5I01540
                          MDX     *+4       NO, CONTINUE CHECKING  2-12 T5I01542
                          MDX  L  WZ940,0   CHECK CHANNEL 1 INDR   2-12 T5I01544
                          MDX     WZ300     IT'S SET, NO EJECT     2-12 T5I01546
                          MDX     WZ370     NOT SET, DO EJECT      2-12 T5I01548
                          A       WZ931      ADD SPACE SUPPRESS CON     T5I01550
                          BSC  L  WZ300,+-   BR TO CONVERT BUFR IF =    T5I01560
                          MDX  L  $1403,0    TEST FOR CHANNEL 12        T5I01570
                          MDX     WZ370     BR TO PAGE EJECT        212 T5I01580
                          S       WZ932      TEST FOR DOUBLE SPACE      T5I01590
                          BSC  L  WZ220,Z    *BR IF YES             2-3 T5I01600
                    *                                                   T5I01610
                    *             DOUBLE AND SINGLE SPACE ROUTINES      T5I01620
                    *                                                   T5I01630
                          BSI     WZ380      GO CHECK FOR CARRIAGE BUSY T5I01640
                          XIO     WZ902      MOVE CARRIAGE ONE SPACE    T5I01650
                    *                                                   T5I01660
                    *                        SPACE ONCE AGAIN           T5I01670
                    *                                                   T5I01680
                    WZ220 BSI     WZ380      GO CHECK FOR CARRIAGE BUSY T5I01690
                          XIO     WZ902      MOVE CARRIAGE ONE SPACE    T5I01700
                    *                                                   T5I01710
                    *             CONVERT THE EBC CHARACTER TO 1403     T5I01720
                    *             CODE                                  T5I01730
                    *                                                   T5I01740
                    WZ300 MDX   2 -1         SKIP IF CHAR CNT .EQ. 1    T5I01750
                          MDX     WZ305      BRANCH IF CNT .GT. 1       T5I01760
                          MDX     PRNZ+1     EXIT                       T5I01770
                    *                                                   T5I01780
                    WZ305 LDX   2 60                                    T5I01790
                          STX   2 WZ920      SET WD CNT .EQ. 60         T5I01800
                    *                                                   T5I01810
                    *             GET 1403 CHARS AND PACK TWO TO A WORD T5I01820
                    *                                                   T5I01830
                    WZ310 LD    1 1          GET CHARACTER              T5I01840
                          BSI     WZ400      DO TABLE SEARCH TO FIND IT T5I01850
                          STO     WZ933      SAVE IN TEMPORARY STORAGE  T5I01860
                          LD    1 2          GET NEXT EBC CHARACTER     T5I01870
                          BSI     WZ400      CONVERT TO 1403 CODE       T5I01880
                          SRA     8          PUT CHAR IN RIGHT 8 BITS   T5I01890
                          OR      WZ933      PACK WITH LEFT 8 BITS      T5I01900
                    WZ320 STO  L  *-*        STORE BACK IN BUFFER       T5I01910
                          MDX  L  WZ320+1,1  INCR O/P ADDR BY 1         T5I01920
                          MDX   1 2          INCR I/P BUFFER ADDR BY 2  T5I01930
                          MDX  L  WZ920,-1   TEST TO SEE IF CONVERSION  T5I01940
                    *                        *DONE                      T5I01950
                          MDX     WZ310      GET NEXT CHAR IF NOT       T5I01960
                    *                                                   T5I01970
                          STX     WZ934      YES,TURN ON TRANSFER       T5I01980
                    *                        *COMPLETE SWITCH           T5I01990
                    *                                                   T5I02000
                    *             PRINTER BUSY TEST AND PRINT           T5I02010
                    *                                                   T5I02020
                    WZ350 BSI     WZ380                                 T5I02030
                          BSI     WZ380                                 T5I02040
                          XIO     WZ904      PRINT A LINE               T5I02050
                    WZ355 BSI     WZ375      TEST FOR PRINTER READY 2-3 T5I02060
                          MDX  L  WZ934,0    TEST FOR PRINT COMPLETE2-3 T5I02070
                    *                        *INTERRUPT                 T5I02080
                          MDX     WZ355      NO INTRPT TRY AGAIN    2-3 T5I02090
                    WZ360 MDX     PRNZ+1     EXIT BACK TO SFIO          T5I02100
                    *                                                   T5I02110
                    *             SKIP TO CHANNEL 1, NEW PAGE           T5I02120
                    *                                                   T5I02130
                    WZ370 BSI     WZ380     CHECK FOR CARRIAGE BUSY 212 T5I02140
                          SLA     16        CLEAR CHANNEL 12 SWITCH 212 T5I02150
                          STO  L  $1403     SAVE IN COMMA WORD      212 T5I02160
                          STX     WZ940     SET CHANNEL 1 IN SWITCH 212 T5I02170
                          XIO     WZ900      SKIP TO CHANNEL 1          T5I02180
                          MDX     WZ300      GO CONVERT MESSAGE TO 1403 T5I02190
                    *                                               2-3 T5I02200
                    *             TEST FOR PRINTER READY            2-3 T5I02210
                    *             IF NO-BR TO PRE-OP ERR TRAP       2-3 T5I02220
                    *                                               2-3 T5I02230
                    WZ375 DC      *-*        ENTRY POINT            2-3 T5I02240
                    WZ376 XIO     WZ908      SENSE W/O RESET            T5I02250
                          BSC  L  WZ377,E    BR IF NOT READY        2-3 T5I02260
                          BSC  I  WZ375      RETURN                 2-3 T5I02270
                    *                                                   T5I02275
                    WZ377 LD   L  WZ010     LOAD ERROR FLAG        2-12 T5I02280
                          BSI  L  $PRET      BR TO TRAP                 T5I02290
                          MDX     WZ376      TEST READY AGAIN       2-3 T5I02300
                    WZ380 DC      *-*        BSI ENTRY POINT            T5I02310
                    WZ381 BSI     WZ375      TEST PRINTER READY     2-3 T5I02320
                          SLA     13         TEST ON CARR. OR PRINTER   T5I02330
                          BSC  L  WZ381,Z    *BUSY, BR IF YES           T5I02340
                          MDX  L  $IOCT,1    INCR INTRPT PENDING CNT2-3 T5I02350
                          NOP               IN CASE OF SKIP         212 T5I02355
                          BSC  I  WZ380      RETURN                     T5I02360
                    *                                                   T5I02440
                    *             TABLE SEARCH SUBROUTINE TO FIND 1403  T5I02450
                    *             CHARACTER CORRESPONDING TO EBC        T5I02460
                    *                                                   T5I02470
                          BSC  L  *-*        RETURN                     T5I02480
                    WZ400 EQU     *-1        BSI ENTRY POINT            T5I02490
                          AND     WZ921      REMOVE 2 HIGH BITS     2-3 T5I02500
                          SRT     1          SAVE LOW BIT IN Q      2-3 T5I02510
                          A       WZ941      CONSTRUCT TABLE ADDRESS2-3 T5I02520
                          STO     WZ410+1    PUT IN LOAD INSTRUCTION2-3 T5I02530
                          SLT     17         SET CARRY WITH LOW BIT 2-3 T5I02540
                    WZ410 LD   L  *-*        GET 1403 CHAR FROM TBL 2-3 T5I02550
                          BSC     C          SKIP IF NO CARRY       2-3 T5I02560
                          SLA     8                                 2-3 T5I02570
                          AND     WZ942      MASK OUT RIGHT 8 BITS  2-3 T5I02580
                    *                                               2-3 T5I02590
                          MDX     WZ400-1    EXIT FROM THIS SUBROUTINE  T5I02620
                          HDNG    PRNZ                                  T5I02630
                    *                                                   T5I02640
                    *   1403 CODE TABLE - EBCDIC USED               2-3 T5I02650
                    *   TO GENERATE TABLE ACCESS ADDRESS            2-3 T5I02660
                    *                                                   T5I02670
                    WZ990 DC      /7F64      BLANK/A                2-3 T5I02680
                          DC      /2526      B/C                    2-3 T5I02690
                          DC      /6768      D/E                    2-3 T5I02700
                          DC      /292A      F/G                    2-3 T5I02710
                          DC      /6B2C      H/I                    2-3 T5I02720
                          DC      /7F6E      BLANK/PERIOD           2-3 T5I02730
                          DC      /7F57      BLANK/LEFT PAREN       2-3 T5I02740
                          DC      /6D7F      PLUS/BLANK             2-3 T5I02750
                          DC      /1558      AMPERSAND/J            2-3 T5I02760
                          DC      /191A      K/L                    2-3 T5I02770
                          DC      /5B1C      M/N                    2-3 T5I02780
                          DC      /5D5E      O/P                    2-3 T5I02790
                          DC      /1F20      Q/R                    2-3 T5I02800
                          DC      /7F62      BLANK/DOLLAR           2-3 T5I02810
                          DC      /232F      ASTERISK/RIGHT PAREN   2-3 T5I02820
                          DC      /7F7F      BLANK/BLANK            2-3 T5I02830
                          DC      /614C      MINUS/SLASH            2-3 T5I02840
                          DC      /0D0E      S/T                    2-3 T5I02850
                          DC      /4F10      U/V                    2-3 T5I02860
                          DC      /5152      W/X                    2-3 T5I02870
                          DC      /1354      Y/Z                    2-3 T5I02880
                          DC      /7F16      BLANK/COMMA            2-3 T5I02890
                          DC      /7F7F      BLANK/BLANK            2-3 T5I02900
                          DC      /7F7F      BLANK/BLANK            2-3 T5I02910
                          DC      /4940      0/1                    2-3 T5I02920
                          DC      /0102      2/3                    2-3 T5I02930
                          DC      /4304      4/5                    2-3 T5I02940
                          DC      /4546      6/7                    2-3 T5I02950
                          DC      /0708      8/9                    2-3 T5I02960
                          DC      /7F7F      BLANK/BLANK            2-3 T5I02970
                          DC      /7F0B      BLANK/APOSTROPHE       2-3 T5I02980
                          DC      /4A7F      EQUAL/BLANK            2-3 T5I02990
                          END                                           T5I03000
