                          HDNG    LIBF SFIO                             T4C00010
                    *************************************************** T4C00020
                    *STATUS - VERSION 2  MODIFICATION 10              * T4C00030
                    *                                                 * T4C00040
                    *FUNCTION/OPERATION-                              * T4C00050
                    *   * SERVICES A NON-DISK I/O DEVICE              * T4C00060
                    *   * SUPPORTS BOTH STANDARD AND EXTENDED PREC    * T4C00070
                    *                                                 * T4C00080
                    *ENTRY POINTS-                                    * T4C00090
                    *   LIBF      SFIO       CALL TO INITIALIZE       * T4C00100
                    *   DC        PREC       PRECISION                * T4C00110
                    *   DC        NUMBER     2*NO. OF UNITS(DM1)      * T4C00120
                    *                        2*NO. OF UNITS+2 (DM2)     T4C00125
                    *                                                 * T4C00130
                    *   LIBF      SRED       CALL TO READ             * T4C00140
                    *   DC        ADDR1      ADDR OF UNIT NO.         * T4C00150
                    *   DC        ADDR2      ADDR OF FORMAT           * T4C00160
                    *                                                 * T4C00170
                    *   LIBF      SWRT       CALL TO WRITE            * T4C00180
                    *   DC        ADDR1      ADDR OF UNIT NO.         * T4C00190
                    *   DC        ADDR2      ADDR OF FORMAT           * T4C00200
                    *                                                 * T4C00210
                    *   LIBF      SIOI       CALL FOR NON-SUBSC INTGER* T4C00220
                    *   DC        ADDR       ADDRESS OF VARIABLE      * T4C00230
                    *                                                 * T4C00240
                    *   LIBF      SIOF       CALL FOR NON-SUBSC REAL  * T4C00250
                    *   DC        ADDR       ADDR OF VARIABLE         * T4C00260
                    *                                                 * T4C00270
                    *   LIBF      SIOIX      CALL FOR SUBSC INTEGER   * T4C00280
                    *   DC        ADDR       ADDR OF BASE VARIABLE    * T4C00290
                    *                        XR1 CONTAINS SUBSCRIPT   * T4C00300
                    *                                                 * T4C00310
                    *   LIBF      SIOFX      CALL FOR SUBSC REAL      * T4C00320
                    *   DC        ADDR       ADDR OF BASE VARIABLE    * T4C00330
                    *                        XR1 CONTAINS SUBSCRIPT   * T4C00340
                    *                                                 * T4C00350
                    *   LIBF      SIOAI      CALL FOR INTEGER ARRAY   * T4C00360
                    *   DC        ADDR       ADDR FIRST ELT OF ARRAY  * T4C00370
                    *   DC        COUNT      COUNT OF ELT IN ARRAY    * T4C00380
                    *                                                 * T4C00390
                    *   LIBF      SIOAF      CALL FOR REAL ARRAY      * T4C00400
                    *   DC        ADDR       ADDR FIRST ELT OF ARRAY  * T4C00410
                    *   DC        COUNT      COUNT OF ELT IN ARRAY    * T4C00420
                    *                                                 * T4C00430
                    *   LIBF      SCOMP      CALL FOR I/O COMPLETE    * T4C00440
                    *                                                 * T4C00450
                    *INPUT-N/A                                        * T4C00460
                    *                                                 * T4C00470
                    *OUTPUT-N/A                                       * T4C00480
                    *                                                 * T4C00490
                    *EXTERNAL REFERENCES-                             * T4C00500
                    *   SUBROUTINES-N/A                               * T4C00510
                    *   COMMA/DCOM                                    * T4C00520
                    *       * $EXIT                                   * T4C00530
                    *       * $PRET                                   * T4C00540
                    *       * $RWCZ                                   * T4C00550
                    *                                                 * T4C00560
                    *EXITS-                                           * T4C00570
                    *   NORMAL-                                       * T4C00580
                    *       *RETURN TO LAST CALL PARAMETER + 1        * T4C00590
                    *   ERROR-                                        * T4C00600
                    *       *CALL EXIT IF BUFFER OVERFLOWS            * T4C00610
                    *                                                 * T4C00620
                    *TABLES/WORK AREAS-N/A                            * T4C00630
                    *                                                 * T4C00640
                    *                                                 * T4C00650
                    *ATTRIBUTES-N/A                                   * T4C00660
                    *                                                 * T4C00670
                    *NOTES-N/A                                        * T4C00680
                    *                                                 * T4C00690
                    *************************************************** T4C00700
                    *                                                   T4C00710
                    *             1130 FORTRAN I/O MONITER              T4C00720
                          LIBR                                          T4C00730
                          ENT     SFIO       INITIALIZATION             T4C00740
                          ENT     SIOI       UNSUBSCRIPTED INTEGER      T4C00750
                          ENT     SIOAI      INTEGER ARRAY              T4C00760
                          ENT     SIOF       UNSUBSCRIPTED REAL         T4C00770
                          ENT     SIOAF      REAL ARRAY                 T4C00780
                          ENT     SIOFX      REAL SUBSCRIPTED ELEMENT   T4C00790
                          ENT     SCOMP      COMPLETION OF I/O          T4C00800
                          ENT     SWRT       WRITE                      T4C00810
                          ENT     SRED       READ                       T4C00820
                          ENT     SIOIX      INTEGER SUBSCRIPTED ELT    T4C00830
                    *                                                   T4C00840
                    *                                                   T4C00850
                    $EXIT EQU     /0038      ERROR ROUTINE              T4C00860
                    *                        EXIT STMNT                 T4C00870
                    $PRET EQU     /0028      TRAP FOR PREOPERATIVE I/O  T4C00880
                    *                        ERRORS                     T4C00890
                    *                                                   T4C00900
                    $RWCZ EQU     /F1        LAST I/O TYPE INDR         T4C00910
                    *                                                   T4C00920
                    *************************************************** T4C00930
                    *             LIBF SWRT   ENTRY POINT             * T4C00940
                    *************************************************** T4C00950
                    SWRT  LDS     2          STATUS FOR WRITE           T4C00960
                          LDX  I2 *-*        ENTRY POINT FOR WRITE      T4C00970
                    SF005 MDX     SRED+3     GO TO COMMON ROUTINE       T4C00980
                    *                                                   T4C00990
                          DC      1          STATUS STORAGE WORD        T4C01000
                    *                                                   T4C01010
                    *************************************************** T4C01020
                    *             LIBF SRED   ENTRY POINT             * T4C01030
                    *************************************************** T4C01040
                    SRED  LDS     0          STATUS FOR READ            T4C01050
                          LDX  I2 *-*        ENTRY POINT FOR READ       T4C01060
                    *                                                   T4C01070
                          STS     SF005+1    SET READ WRITE INDICATOR   T4C01080
                          STX   2 SF010+1    SAVE XR2                   T4C01090
                          LDX   2 0          LOAD POSS. ERROR IND.      T4C01100
                          STX   2 SF915      CLEAR ERROR F001 SWITCH    T4C01110
                    *                                                   T4C01120
                          LD   L  SFIO+2     WAS SFIO INITIALIZED       T4C01130
                          BSC  L  SF385+2,+- IF NO, EXIT TO USER        T4C01140
                    *                                                   T4C01150
                          LD      SF912      IS THIS NEW OVERLAY        T4C01160
                          SRA     14         IS THIS NEW OVERLAY        T4C01170
                          BSC  L  SFIO,Z     BRANCH IF YES              T4C01180
                    *                                                   T4C01190
                    SF010 LDX  L2 *-*        RESTORE XR2                T4C01200
                          STX  L1 SF105+1    SAVE XR1                   T4C01210
                          SLT     32                                    T4C01220
                          STD  L  SF997-3    CLEAR AREA                 T4C01230
                          STO  L  SF994      INITIALIZE COUNT           T4C01240
                    *                                                   T4C01250
                          LD    2 1          GET ADDR OF FORMAT         T4C01260
                          STO  L  SF995      STRING INTO ROUTINE        T4C01270
                    *                                                   T4C01280
                          LD    2 0          GET ADDR OF I/O UNIT NO.   T4C01290
                    *                                                   T4C01300
                          BSC  L  SF075,+-   IF ADDR 0, GET TRACE DEVC  T4C01310
                    *                                                   T4C01320
                          LD   I2 0          GET I/O UNIT NUMBER        T4C01330
                    *                                                   T4C01340
                    SF015 MDX   2 2          MOVE XR2 UP FOR EXIT       T4C01350
                          STX  L2 SF110+1    STORE IN EXIT BRANCH INST  T4C01360
                    *                                                   T4C01370
                          STO     SF050      SAVE I/O UNIT NO.          T4C01380
                    *                                                   T4C01390
                          BSC  L  SF090,+    ERROR IF LESS THAN ONE 2-7 T4C01400
                    *                                                   T4C01410
                          S       SF903      IS IT GT. OR EQ. TO TEN    T4C01420
                          BSC  L  SF090,-    BRANCH TO ERROR IF YES     T4C01430
                    *                                                   T4C01440
                          MDX  L  SF005+1,0  SKIP IF THIS IS READ       T4C01450
                          MDX     SF080      BRANCH IF WRITE            T4C01460
                    *                                                   T4C01470
                          BSC  L  SF085,E    IS IT VALID READ DEVICE    T4C01480
                    *                        BRANCH IF NOT              T4C01490
                    *                                                   T4C01500
                    SF020 LD      SF050      GET I/O UNIT NUMBER        T4C01510
                          S       SF910+1    GET TABLE INCREMENT        T4C01520
                          STO     SF025+1    STORE DEVICE TBL INCR      T4C01530
                          SLA     1          GET DEVICE RTN INCR        T4C01540
                          STO     SF030+1    STORE                      T4C01550
                    *                                                   T4C01560
                    SF025 LDX  L2 *-*                                   T4C01570
                          LD   L2 SF998      GET BUFFER SIZE FOR DEVICE T4C01580
                          STO     SF901                                 T4C01590
                          STO     SF913                                 T4C01600
                    *                                                   T4C01610
                    SF030 LDX  L2 *-*        LOAD PROPER DEVICE RTN IDX T4C01620
                    *                                                   T4C01630
                    *                                                   T4C01640
                    SF035 LD   L2 *-*        GET CALL TO I/O ROUTINE    T4C01650
                          STO     SF050      STORE FOR ONE WORD CALL    T4C01660
                    *                                                   T4C01670
                          LDX   2 1          SET XR2 FOR ERROR          T4C01680
                          BSC  L  SF385,+    ERROR IF NO CALL TO I/O    T4C01690
                    *                                                   T4C01700
                          BSI     SF070      GO CLEAR BUFFER            T4C01710
                    *                                                   T4C01720
                          MDX  L  SF005+1    SKIP IF READ               T4C01730
                          MDX     SF060+2    BRANCH IF WRITE            T4C01740
                    *                                                   T4C01750
                          LDX  L2 SF060+2    SET EXIT AFTER I/O EXECUTE T4C01760
                    SF040 STX   2 SF060+1    STORE EXIT                 T4C01770
                    *                                                   T4C01780
                    SF045 LD      SF914      IS T-FORMAT SW POS     2-2 T4C01790
                          BSC  L  SF048,-Z   *BR IF YES             2-2 T4C01800
                          S       SF913      IS MAX WC GT LAST WC   2-2 T4C01810
                          BSC  L  SF047,+    *BR IF NO              2-2 T4C01820
                          LD      SF914      PUT MAX WC IN          2-2 T4C01830
                          STO     SF913      *LAST WC               2-2 T4C01840
                    SF047 LD      SF910+1    RESTORE T-FORMAT SW    2-2 T4C01850
                          STO     SF914      *TO NO T-FORMAT        2-2 T4C01860
                    SF048 SRA     16         GET COUNT OF CHARACTERS    T4C01870
                          S       SF901      TO READ OR WRITE           T4C01880
                          A       SF913      INTO XR2                   T4C01890
                          STO  L  2          CORE REFLECTION OF XR2     T4C01900
                    *                                                   T4C01910
                          LD      SF915      WAS THERE F001 ERROR       T4C01920
                          BSC  L  SF055,Z    GET OUT IF YES             T4C01930
                    *                                                   T4C01940
                          LD      SF005+1    CHECK READ/WRITE INDR      T4C01950
                          BSC     +-         SKIP IF WRITE              T4C01960
                    *                                                   T4C01970
                          BSI     SF070      GO CLEAR BFR IF READ       T4C01980
                    *                                                   T4C01990
                          LDX  L1 SF970      INITIALIZE POINTER         T4C02000
                    *                                                   T4C02010
                          LD      SF005+1    GET READ/WRITE INDICATOR   T4C02020
                    *                                                   T4C02030
                    SF050 DC      *-*        GO EXECUTE I/O OPERATION   T4C02040
                    *                                                   T4C02050
                          MDX  L  SF005+1,0  SKIP IF READ               T4C02060
                          BSI     SF070      GO CLEAR BUFFER IF WRITE   T4C02070
                    *                                                   T4C02080
                    SF055 LDX  L1 *-*        RESTORE XR1                T4C02090
                    *                                                   T4C02100
                    SF060 BSC  L  *-*        EXIT IF COMPLETE           T4C02110
                    *                                                   T4C02120
                          SLA     16                                    T4C02130
                          STO  L  SF926      RESET REDO INDICATOR       T4C02140
                    *                                                   T4C02150
                          LD      SF901      RESET BUFFER FULL COUNTER  T4C02160
                          STO     SF913                                 T4C02170
                    *                                                   T4C02180
                    SF065 LDX  L2 SF970      SET POINTER TO             T4C02190
                          STX  L2 SF996      START OF BUFFER            T4C02200
                    *                                                   T4C02210
                          MDX     SF100      GO SCAN FORMAT             T4C02220
                    *                                                   T4C02230
                    *                                                   T4C02240
                    *              CONSTANTS                            T4C02250
                    *                                                   T4C02260
                    SF912 MDX     *+22       BRANCH OVER SFIO PARAMS    T4C02270
                    SF915 DC      0          ERROR F001 SWITCH          T4C02280
                    *                                                   T4C02290
                    *                                                   T4C02300
                    *             BUFFER CLEAR SUBROUTINE               T4C02310
                    *                                                   T4C02320
                    SF070 DC      0          ENTRY POINT                T4C02330
                          LDX   2 -121       CLEAR I/O BUFFER           T4C02340
                          LD   L  SF952      TO EBC BLANKS              T4C02350
                          STO  L2 SF970+121                             T4C02360
                          MDX   2 1          SKIP IF BUFFER CLEARED     T4C02370
                          MDX     SF070+4    CONTINUE                   T4C02380
                          BSC  I  SF070      RETURN                     T4C02390
                    *                                                   T4C02400
                    *              CONSTANTS                            T4C02410
                    *                                                   T4C02420
                    SF901 DC      0          HOLDS BUFFER SIZE          T4C02430
                    SF902 DC      7          SEVEN                      T4C02440
                    SF903 DC      10         TEN                        T4C02450
                    SF904 DC      2          TWO                        T4C02460
                    *                                                   T4C02470
                    *                                                   T4C02480
                    SF075 LD      SF912      LOAD TRACE DEVICE UNIT NO. T4C02490
                          MDX     SF015      RETURN                     T4C02500
                    *                                                   T4C02510
                    *                                                   T4C02520
                    *              CONSTANTS                            T4C02530
                    *                                                   T4C02540
                          BSS  E  0                                     T4C02550
                    SF910 DC      0          TWO-WORD CONSTANT          T4C02560
                          DC      1          OF ONE                     T4C02570
                    SF913 DC      0          BUFFER SIZE                T4C02580
                    SF914 DC      1          POS,NO T-FORMAT. ZERO+ 2-2 T4C02590
                    *                        *NEG,MAX WC LEFT IN BUF2-2 T4C02600
                    *                                                   T4C02610
                    *                                                   T4C02620
                    *             TEST FOR VALID O/P DEVICES            T4C02630
                    *                                                   T4C02640
                    SF080 A       SF904      IS DEVICE 2501 CARD READER T4C02650
                          BSC     Z          ERROR IF YES               T4C02660
                    *                                                   T4C02670
                          A       SF904      IS DEVICE KEYBOARD         T4C02680
                          BSC  L  SF020,Z    BRANCH IF NOT              T4C02690
                    *                                                   T4C02700
                    SF085 LDX   2 8          LOAD ERROR NO.             T4C02710
                          MDX     SF120      GO TO ERROR ROUTINE        T4C02720
                    *                                                   T4C02730
                    SF090 LDX   2 1          LOAD ERROR NUMBER          T4C02740
                          MDX     SF085+1    GO TO ERROR ROUTINE        T4C02750
                    *                                                   T4C02760
                    *                                                   T4C02770
                    *                                                   T4C02780
                    *************************************************** T4C02790
                    *             LIBF SIOIX  ENTRY POINT             * T4C02800
                    *************************************************** T4C02810
                    SIOIX LDS     2          INTEGER SUBSCRIPTED VAR    T4C02820
                          LDX  I2 *-*        ENTRY POINT                T4C02830
                          STX   1 SF916      STORE DISPLACEMENT FROM    T4C02840
                          LDD     SF916      BASE ADDR                  T4C02850
                          STS  L  SF920      SAVE REAL/INTEGER INDR     T4C02860
                          A     2 0          ADD BASE ADDR              T4C02870
                          STD  L  SF993      STORE ADDR OF ELEMENT  2-9 T4C02880
                          MDX   2 1          MOVE XR2 UP FOR EXIT       T4C02890
                          STX   2 SF110+1    STORE IN EXIT BRANCH       T4C02900
                          STX   1 SF105+1    SAVE XR1                   T4C02910
                          LD      SF915      WAS THERE F001 ERROR  2-10 T4C02914
                          BSC  L  SF110,Z    GET OUT IF YES        2-10 T4C02915
                    *                                                   T4C02920
                    *                                                   T4C02930
                    *             FORMAT SCAN                           T4C02940
                    *                                                   T4C02950
                    SF100 MDX  L  SF926,0    IS REDO INDICATOR ZERO     T4C02960
                          MDX     SF040-2    IF NO, GO START I/O OP     T4C02970
                    *                                                   T4C02980
                          LD   L  SF976      SAVE PREVIOUS              T4C02990
                          STO     SF997-4    FORMAT TYPE                T4C03000
                    *                                                   T4C03010
                          SLT     32         CLEAR ACC AND EXTENSION    T4C03020
                          LDX   1 -20                                   T4C03030
                          STO  L1 SF985      CLEAR OUT WORK AREA        T4C03040
                          MDX   1 1          SKIP IF FINISHED           T4C03050
                          MDX     *-4        CONTINUE                   T4C03060
                    *                                                   T4C03070
                          S       SF916+1    SET UP CONSTANT            T4C03080
                          STO  L  SF985      OF -1                      T4C03090
                          STO     SF997                                 T4C03100
                    *                                                   T4C03110
                          LD   I  SF995      GET WD FROM FORMAT STRING  T4C03120
                    *                                                   T4C03130
                          RTE     12         GET TYPE INTO ACC          T4C03140
                    *                                                   T4C03150
                          STO     SF976      SET XR2 AS INDEX           T4C03160
                          LDX  I2 SF976      WITH TYPE                  T4C03170
                    *                                                   T4C03180
                          SRA     2          IS IT E, F, OR I FORMAT    T4C03190
                          BSC     +          SKIP IF NOT                T4C03200
                    *                                                   T4C03210
                          A       SF994      CHECK ARRAY COUNT          T4C03220
                    *                                                   T4C03230
                    SF105 LDX  L1 *-*        RESTORE XR1                T4C03240
                    *                                                   T4C03250
                          BSC  L  SF650      BRANCH TO CHECK R/W SW 2-9 T4C03255
                    SF110 BSC  L  *-*        EXIT IF COUNT ZERO     2-9 T4C03260
                    *                                                   T4C03270
                    SF112 LD   L2 SF928      GET COUNT OF 2,3 OR 7  2-9 T4C03280
                    *                                                   T4C03290
                          LDX  L1 X          INITIALIZE TRANSFER VECTOR T4C03300
                    *                                                   T4C03310
                          STO   1 SF983-X    STORE COUNT                T4C03320
                    *                                                   T4C03330
                          SRA     16         CLEAR ACCUMULATOR          T4C03340
                    *                                                   T4C03350
                          MDX   2 -1         IS TYPE E OR F - SKIP YES  T4C03360
                          MDX     SF115      BRANCH IF I TYPE           T4C03370
                    *                                                   T4C03380
                          SLT     5          GET DECIMAL WIDTH          T4C03390
                          STO   1 SF982-X    PUT INTO WORK AREA         T4C03400
                    *                                                   T4C03410
                          SRA     16         CLEAR ACCUMULATOR          T4C03420
                    *                                                   T4C03430
                          SRT     5          RESTORE EXTENSION          T4C03440
                          LDX   2 0          SET XR2 TO ZERO FOR E-F    T4C03450
                    *                                                   T4C03460
                    SF115 SLT     12         GET TOTAL FIELD WIDTH      T4C03470
                          STO   1 SF981-X    PUT INTO WORK AREA         T4C03480
                    *                                                   T4C03490
                          MDX   2 -4         IS IT E,F,I,A, OR X TYPE   T4C03500
                          MDX     SF150      BRANCH IF NOT              T4C03510
                    *                                                   T4C03520
                          A       SF913      GET SIZE OF BUFFER NOT     T4C03530
                          STO     SF913      YET FILLED                 T4C03540
                    *                                                   T4C03550
                          BSC  L  SF145,+    BRANCH IF NO ERROR         T4C03560
                    *                                                   T4C03570
                          SLA     16         ZERO THE BUFFER        2-2 T4C03580
                          STO     SF913      *SIZE                      T4C03590
                    *                                                   T4C03600
                          LDX   2 2          SET UP ERROR               T4C03610
                    SF120 BSC  L  SF385      GO TO ERROR ROUTINE        T4C03620
                    *                                                   T4C03630
                    *************************************************** T4C03640
                    *             LIBF SIOF   ENTRY POINT             * T4C03650
                    *************************************************** T4C03660
                    SIOF  LDS     0          REAL VARIABLE STATUS WORD  T4C03670
                          LDX  I2 *-*        ENTRY POINT                T4C03680
                          MDX     SIOI+3     GO TO GET COUNT            T4C03690
                    *                                                   T4C03700
                    *************************************************** T4C03710
                    *             LIBF SCOMP  ENTRY POINT             * T4C03720
                    *************************************************** T4C03730
                    SCOMP STX   1 SF055+1    WRITE COMPLETE             T4C03740
                          LDX  I2 *-*        ENTRY POINT                T4C03750
                          LD      SF926      IS REDO INDICATOR ON       T4C03760
                          BSC  L  SF040,Z    IF YES, GO EXECUTE I/O     T4C03770
                    *                                                   T4C03780
                          LD      SF997-4    LOAD LAST FORMAT TYPE      T4C03790
                          S       SF902      WAS IT SLASH (/)           T4C03800
                          BSC  L  SF040,Z    IF NO, GO EXECUTE I/O      T4C03810
                    *                                                   T4C03820
                          STX  L2 SF060+1    SET XR2 FOR EXIT      2-10 T4C03830
                          BSC  L  SF060      RETURN                 2-9 T4C03840
                    *                                                   T4C03850
                    *             T FORMAT                              T4C03860
                    *                                                   T4C03870
                    SF122 RTE     16         SAVE ACC               2-2 T4C03880
                          LD      SF914      FIRST TIME T-FORMAT    2-2 T4C03890
                          BSC  L  SF123,-Z   *BR IF YES             2-2 T4C03900
                          S       SF913      IS MAX WC GT LAST WC   2-2 T4C03910
                          BSC  L  SF124,-Z   *BR IF YES             2-2 T4C03920
                    SF123 LD      SF913      PUT LAST WC            2-2 T4C03930
                          STO     SF914      *IN MAX WC             2-2 T4C03940
                    SF124 RTE     16         RESTORE ACC            2-2 T4C03950
                          A       SF901      ADJUST CHARACTER COUNT     T4C03960
                          S       SF916+1    *TO MAX CHAR LEFT      2-1 T4C03970
                          STO     SF913       *                         T4C03980
                          LD    1 SF981-X     SET UP BUFFER POINTER     T4C03990
                          A       SF919       *                         T4C04000
                          MDX     SF125+1     GO STORE POINTER          T4C04010
                    *                                                   T4C04020
                    *              CONSTANTS                            T4C04030
                    *                                                   T4C04040
                          BSS  E  0                                     T4C04050
                    SF916 DC      0          STORAGE                    T4C04060
                          DC      1          ONE                        T4C04070
                    *                                                   T4C04080
                    *************************************************** T4C04090
                    *             LIBF SIOAF  ENTRY POINT             * T4C04100
                    *************************************************** T4C04110
                    SIOAF LDS     0          REAL ARRAY STATUS WORD     T4C04120
                          LDX  I2 *-*        ENTRY POINT                T4C04130
                          MDX     SIOAI+3    GO TO COMMON ROUTINE       T4C04140
                    *                                                   T4C04150
                    *************************************************** T4C04160
                    *             LIBF SIOFX  ENTRY POINT             * T4C04170
                    *************************************************** T4C04180
                    SIOFX LDS     0          REAL SUBSC VAR STATUS WORD T4C04190
                          LDX  I2 *-*        ENTRY POINT                T4C04200
                          MDX     SIOIX+3    GO TO COMMON ROUTINE       T4C04210
                    *                                                   T4C04220
                    *************************************************** T4C04230
                    *             LIBF SIOI   ENTRY POINT             * T4C04240
                    *************************************************** T4C04250
                    SIOI  LDS     2          INTEGER VAR STATUS WORD    T4C04260
                          LDX  I2 *-*        ENTRY POINT                T4C04270
                          LDD  L  SF910      GET COUNT OF ONE IN EXT2-9 T4C04280
                          MDX     SIOIX+5    GO TO COMMON ROUTINE       T4C04290
                    *                                                   T4C04300
                    *************************************************** T4C04310
                    *             LIBF SIOAI  ENTRY POINT             * T4C04320
                    *************************************************** T4C04330
                    SIOAI LDS     2          INTEGER ARRAY STATUS WORD  T4C04340
                          LDX  I2 *-*        ENTRY POINT                T4C04350
                          LD    2 1          LD CT OF ELEMENTS IN ARRAY T4C04360
                          SRT     16         PUT IN EXTENSION           T4C04370
                    *                                                   T4C04380
                          LD    2 0          LOAD ADDR OF 1ST ELEMENT   T4C04390
                          MDX   2 1          SET UP XR2 FOR EXIT        T4C04400
                          STS     SF920      STORE STATUS               T4C04410
                          MDX     SIOIX+8    GO TO COMMON ROUTINE       T4C04420
                    *                                                   T4C04430
                    SF145 LD    1 SF981-X    GET TOTAL FIELD WIDTH      T4C04440
                    *                                                   T4C04450
                    *                                               2-2 T4C04460
                    *     BRANCH BY TYPE CODE                       2-2 T4C04470
                    *                                               2-2 T4C04480
                    SF150 BSC  L2 SF155                             2-2 T4C04490
                    *                                                   T4C04500
                    *              CONSTANTS                            T4C04510
                    *                                                   T4C04520
                    H0016 DC      /0016      VERSION 2 INDICATOR    2-2 T4C04530
                          BSS  E  0                                     T4C04540
                    SF918 DC      /00C5      E                          T4C04550
                    *                                                   T4C04560
                    *************************************************** T4C04570
                    *             LIBF SFIO   ENTRY POINT             * T4C04580
                    *************************************************** T4C04590
                    SFIO  LD      H0016      LOAD V2 INDICATOR      2-2 T4C04600
                    VSWIT LDX  I2 *-*        ENTRY POINT            2-2 T4C04610
                          S     2 1          SUBTRACT SECOND PARAM  2-2 T4C04620
                          STO     VSWIT      STORE ZERO IF V2       2-2 T4C04630
                          MDX   2 2          STORE ADDRESS OF       2-2 T4C04640
                          STX  L2 SF035+1    * CALLS                2-2 T4C04650
                          LD    2 -2         GET PRECISION-TRACE WD 2-2 T4C04660
                          SRT     5          SAVE PRECISION IN Q    2-2 T4C04670
                          MDX  L  VSWIT,0    SKIP IF V2             2-2 T4C04680
                          MDX     V1         BRANCH IF V1           2-2 T4C04690
                          MDX  L  UINIT,4    MAKE BRANCH FOR V2     2-2 T4C04700
                          SLA     1          SHUFFLE TRACE DEVICE   2-2 T4C04710
                          S       SF931      SUBTRACT 1             2-2 T4C04720
                    V1    STO  L  SF912      SAVE TRACE UNIT NUMBER 2-2 T4C04730
                          SLT     17         GET REAL PRECISION     2-2 T4C04740
                          SRT     13         *                      2-2 T4C04750
                          STO     SF922      STORE REAL PRECISION   2-2 T4C04760
                          SLT     17         GET INTEGER INDICATOR  2-2 T4C04770
                          LD      SF922      GET REAL PRECISION     2-2 T4C04780
                          BSC     C          SKIP IF ONE-WD-INTEGER 2-2 T4C04790
                          STO     SF922+2    SET INTEGER EQ. REAL   2-2 T4C04800
                          STD     SF993      ZERO COUNT FIELD       2-2 T4C04810
                          LD      UINIT      GET BRANCH AROUND      2-2 T4C04820
                          STO   2 -3         SET UP FOR RESTART     2-2 T4C04830
                          MDX   2 20         SET EXIT FOR V2        2-2 T4C04840
                          MDX  L  VSWIT,0    SKIP IF V2             2-2 T4C04850
                          MDX   2 -4         REDUCE EXIT TO V1      2-2 T4C04860
                          LD    2 -2         PICK UP CALLS TO       2-2 T4C04870
                          STO  L  SF435      * FLOATING LOAD        2-2 T4C04880
                          LD    2 -1         * AND                  2-2 T4C04890
                          STO  L  SF335      * FLOATING STORE       2-2 T4C04900
                          LD   L  SF005+1    IS THIS FIRST CALL TO  2-2 T4C04910
                          BSC  L  *+2,E      *SFIO, BRANCH IF YES   2-2 T4C04920
                    *                                               2-2 T4C04930
                          BSC  L  SF010      GO TO READ ROUTINE     2-2 T4C04940
                          SLA     16         CLEAR ACCUMULATOR      2-2 T4C04950
                          STO  L  $RWCZ      SET I/O TYPE           2-2 T4C04960
                          BSC  L2 0          EXIT                   2-2 T4C04970
                    *                                               2-2 T4C04980
                    UINIT MDX     *+18       V1 BRANCH AROUND FIO   2-2 T4C04990
                    *                                                   T4C05000
                    *             X FORMAT                              T4C05010
                    *                                                   T4C05020
                    SF125 A       SF996      UP I/O BUFFER POINTER BY   T4C05030
                          STO     SF996      COUNT SPECIFIED            T4C05040
                    SF130 BSC  L  SF345      GO UP FORMAT POINTER       T4C05050
                    *                                                   T4C05060
                    *              CONSTANTS                            T4C05070
                    *                                                   T4C05080
                    SF919 DC      SF970-1    START OF BUFFER ADDRESS-1  T4C05090
                    *                                                   T4C05100
                    *             H FORMAT                              T4C05110
                    *                                                   T4C05120
                    SF140 LDX  I2 SF995      SET ADDR OF FORMAT PTS     T4C05130
                          MDX   2 1          MOVE TO NEXT WROD OF FMT   T4C05140
                          MDX     SF185-2    GO PROCESS H TYPE          T4C05150
                    *                                                   T4C05160
                    *              CONSTANTS                            T4C05170
                    *                                                   T4C05180
                    SF920 DC      0          REAL/INTEGER SWITCH        T4C05190
                          BSS  E  0                                     T4C05200
                    SF922 DC      3          REAL PRECISION             T4C05210
                          DC      1          *                          T4C05220
                          DC      1          INTEGER PRECISION          T4C05230
                          DC      1          *                          T4C05240
                    SF926 DC      0          REDO SWITCH                T4C05250
                    SF928 DC      7          COUNT OF NUMBER            T4C05270
                          DC      3          OF NON DIGITS CHARS        T4C05280
                          DC      2          IN NUMBER                  T4C05290
                    SF931 EQU     SF922+1    ONE                        T4C05300
                    *                                                   T4C05310
                    *                                                   T4C05320
                          MDX     SF210      TYPE E OR F                T4C05330
                          MDX     SF205      TYPE I                     T4C05340
                          MDX     SF180      TYPE A                     T4C05350
                          MDX     SF125      TYPE X                     T4C05360
                    SF155 MDX     SF140      TYPE H                     T4C05370
                          MDX     SF122      T FORMAT                   T4C05380
                          MDX     SF160      SLASH                      T4C05390
                          MDX     SF170      GROUP REPEAT               T4C05400
                          MDX     SF175      FIELD REPEAT               T4C05410
                    SF927 DC      /FF00      RIGHT HALF OF WD MASK  2-4 T4C05420
                    *                                                   T4C05430
                    *             REDO FORMAT                           T4C05440
                    *                                                   T4C05450
                          LD      SF995      REDO CODE                  T4C05460
                          S     1 SF981-X    RESET FORMAT POINTER BY    T4C05470
                          STO     SF995      AMOUNT IN STRING           T4C05480
                          STX   1 SF926      SET REDO INDICATOR         T4C05490
                          LD      SF994      IS ARRAY COUNT EXHAUSTED   T4C05500
                          BSC  L  SF105,+    IF YES8 RETURN TO USER     T4C05510
                    *                                                   T4C05520
                          MDX     SF165      NO, GO SCAN NEXT FORMAT    T4C05530
                    *                                                   T4C05540
                    *                                                   T4C05550
                    *             SLASH FORMAT                          T4C05560
                    *                                                   T4C05570
                    SF160 STX   1 SF926      SET REDO INDICATOR         T4C05580
                          MDX  L  SF995,1    MOVE FORMAT POINTER        T4C05590
                    SF165 BSC  L  SF065      GO SCAN NEXT FORMAT        T4C05600
                    *                                                   T4C05610
                    *             GROUP REPEAT FORMAT                   T4C05620
                    *                                                   T4C05630
                    SF170 MDX  L  SF995,+1   MOVE FORMAT POINTER        T4C05640
                    *                                                   T4C05650
                    *             FIELD REPEAT FORMAT                   T4C05660
                    *                                                   T4C05670
                    SF175 MDX  L2 SF997-6    GET REPEAT COUNTER         T4C05680
                          LD    2 0          LOAD REPEAT COUNTER        T4C05690
                          S     1 SF985-X    INCREASE BY ONE            T4C05700
                          STO   2 0          PUT BACK IN STORAGE        T4C05710
                    *                                                   T4C05720
                          S     1 SF981-X    ARE ALL REPEATS DONE       T4C05730
                          BSC  L  *+2,Z      BRANCH IF NOT              T4C05740
                    *                                                   T4C05750
                          STO   2 0          IF YES, RESET REPEAT CTR   T4C05760
                          MDX     SF130      GO MOVE FORMAT POINTER     T4C05770
                    *                                                   T4C05780
                          LD   I  SF995      LOAD GROUP REPEAT COUNT    T4C05790
                          STO     SF997-1    STORE IN M1-1 (XR2+2)      T4C05800
                    *                                                   T4C05810
                          LD      SF995      LOAD CURRENT FORMAT ADDR   T4C05820
                          A     2 2          BACKSPACE FMT PT BY 1 OR   T4C05830
                          STO     SF995      STORE NEW FORMAT ADDR      T4C05840
                          BSC  L  SF100      GO RESUME FORMAT SCAN      T4C05850
                    *                                                   T4C05860
                    *                                                   T4C05870
                    *             A FORMAT                              T4C05880
                    *                                                   T4C05890
                    SF180 LD      SF920      GET REAL OR INTEGER        T4C05900
                    *                                                   T4C05910
                          SRA     1          INDICATOR                  T4C05920
                    *                        GET SIZE OF ITEM           T4C05930
                    *                        SET XR2                    T4C05940
                          STO  L  2          CORE REFLECTION OF XR2     T4C05950
                    *                                                   T4C05960
                          LD   L2 SF922      LOAD SIZE OF ITEM          T4C05970
                          SLA     1          DOUBLE TO GET COUNT        T4C05980
                          STO   1 SF982-X    STORE TEMPORARILY          T4C05990
                    *                                                   T4C06000
                          LD    1 SF981-X    GET A TYPE WIDTH     SPEC. T4C06010
                          S     1 SF982-X    CMP WITH MAX SIZE POSSIBL  T4C06020
                          LDX  I2 SF993      GET ADDR OF VARIABLE       T4C06030
                          BSC  L  SF230,+Z   BRANCH IF SIZE OK          T4C06040
                    *                                                   T4C06050
                          A       SF996      BYPASS CHARACTERS IF GT    T4C06060
                          STO     SF996      NUMBER POSSIBLE            T4C06070
                          LD    1 SF982-X    AND SET WIDTH TO MAXIMUM   T4C06080
                          STO   1 SF981-X    SIZE POSSIBLE              T4C06090
                    *                                                   T4C06100
                          SLA     16         SET LEFT/RIGHT INDICATOR   T4C06110
                          STO   1 SF987-X    TO LEFT                    T4C06120
                    *                                                   T4C06130
                    SF185 MDX  L  SF005+1,0  SKIP IF READ               T4C06140
                          MDX     SF220      BRANCH IF WRITE            T4C06150
                    *                                                   T4C06160
                          LD   I  SF996      GET CHAR FROM BUFFER       T4C06170
                          MDX  L  SF987,0    SKIP IF LEFT CHAR          T4C06180
                          MDX     SF190      BRANCH IF RIGHT CHAR       T4C06190
                    *                                                   T4C06200
                          SLA     8          SHIFT TO STORE IN          T4C06210
                          OR   L  SF952      LEFT HALF OF               T4C06220
                          STO   2 0          VARIABLE WORD              T4C06230
                    *                                                   T4C06240
                          MDX     SF195      GO REVERSE LEFT/RT INDR    T4C06250
                    *                                                   T4C06260
                    SF190 LD    2 0          LOAD LIST WORD             T4C06270
                          AND     SF927      CLEAR RIGHT HALF OF WORD   T4C06280
                          OR   I  SF996      COMBINE WITH CHAR FROM BFR T4C06290
                          STO   2 0          PUT BACK ON LIST           T4C06300
                    *                                                   T4C06310
                          MDX   2 1          MOVE LIST ADDR             T4C06320
                    *                                                   T4C06330
                    SF195 LD    1 SF987-X    LOAD LEFT/RT INDR          T4C06340
                          EOR     SF931      REVERSE INDICATOR          T4C06350
                          STO   1 SF987-X    PUT BACK INDICATOR         T4C06360
                    *                                                   T4C06370
                          MDX  L  SF996,+1   MOVE BUFFER ADDRESS        T4C06380
                    *                                                   T4C06390
                          MDX  L  SF981,-1   DECREMENT WIDTH CT BY ONE  T4C06400
                    SF200 MDX     SF185      BRANCH BACK IF NOT DONE    T4C06410
                    *                                                   T4C06420
                          BSC     Z          CHECK TO SEE IF UPDATE     T4C06430
                    *                                                   T4C06440
                          MDX   2 1          MOVE BFR PT                T4C06450
                    *                                                   T4C06460
                          LD    1 SF976-X    GET FORMAT TYPE            T4C06470
                          SRA     2          IS IT H FORMAT             T4C06480
                          BSC  L  SF340,+-   BRANCH IF A FORMAT         T4C06490
                    *                                                   T4C06500
                          STX  L2 SF995      H FORMAT - STORE NEW FMT   T4C06510
                          MDX     SF180-2    ADDR - RESUME FMT SCAN     T4C06520
                    *                                                   T4C06530
                    *                                                   T4C06540
                    *             I FORMAT                              T4C06550
                    *                                                   T4C06560
                    SF205 LD    1 SF985-X    I TYPE                     T4C06570
                          MDX  L  SF005+1    IS IT READ                 T4C06580
                          MDX     *+1        IF NO, GO STORE DD         T4C06590
                    *                                                   T4C06600
                          SLA     16         IF YES, LEAVE DD AS ZERO   T4C06610
                          STO   1 SF982-X    STORE DECIMAL WIDTH        T4C06620
                    *                                                   T4C06630
                          LD      SF920      IS IT INTEGER              T4C06640
                          BSC  L  SF360,Z    BRANCH IF YES              T4C06650
                    *                                                   T4C06660
                          LDX   2 9          IF NO, INVALID REQUEST     T4C06670
                          MDX     SF280      GO TO ERROR ROUTINE        T4C06680
                    *                                                   T4C06690
                    *                                                   T4C06700
                    *             E OR F FORMAT                         T4C06710
                    *                                                   T4C06720
                    SF210 LD      SF920      IS IT REAL VARIABLE        T4C06730
                          BSC  L  SF360,+-   BRANCH IF YES              T4C06740
                          MDX     SF210-2    IF NOT, GO TO ERROR RTN    T4C06750
                    *                                                   T4C06760
                    SF215 SLA     8          GET RIGHT HAND CHAR        T4C06770
                          MDX   2 1          MOVE LIST ADDR BY ONE      T4C06780
                          NOP                MAY SKIP               2-3 T4C06785
                          MDX     SF225      GO STORE IN BUFFER         T4C06790
                    *                                                   T4C06800
                    SF220 LD    2 0          GET CHAR FROM LIST         T4C06810
                          MDX  L  SF987,0    SKIP IF LEFT CHAR          T4C06820
                          MDX     SF215      GO GET RIGHT HAND CHAR     T4C06830
                    *                                                   T4C06840
                    SF225 SRA     8          RIGHT JUSTIFY CHAR         T4C06850
                          STO  I  SF996      STORE IN BUFFER            T4C06860
                    *                                                   T4C06870
                          MDX     SF195      GO REVERSE LEFT/RT INDR    T4C06880
                    *                                                   T4C06890
                    SF230 MDX  L  SF005+1,0  SKIP IF READ               T4C06900
                          MDX     SF200      BRANCH IF WRITE            T4C06910
                    *                                                   T4C06920
                          LD      SF935      LOAD BLANK                 T4C06930
                          STO   2 0          PUT IN LIST ADDR           T4C06940
                    *                                                   T4C06950
                          MDX  L  SF982,-2   DECREMENT COUNT            T4C06960
                          MDX     *+1        SKIP IF I-WD INTEGER       T4C06970
                    *                                                   T4C06980
                          MDX     SF200      CHECK FOR STANDARD PREC    T4C06990
                    *                                                   T4C07000
                          STO   2 1          PUT IN SECOND WORD         T4C07010
                    *                                                   T4C07020
                          MDX  L  SF982,-2   SKIP IF STANDARD PRECISION T4C07030
                          STO   2 2          BLANK THIRD WORD           T4C07040
                    *                                                   T4C07050
                          MDX     SF200      GO PROCESS A TYPE          T4C07060
                    *                                                   T4C07070
                    *                                                   T4C07080
                    *              CONSTANTS                            T4C07090
                    *                                                   T4C07100
                    SF935 DC      /4040      BLANKS                     T4C07110
                    *                                                   T4C07120
                    *                                                   T4C07130
                    SF235 MDX  L  SF979,+1   UP COUNT OF DIGITS         T4C07140
                    *                                                   T4C07150
                          MDX  L  SF971      HAS E BEEN ENCOUNTERED     T4C07160
                          MDX     SF270      IF YES, GO BUILD EXPONENT  T4C07170
                    *                                                   T4C07180
                          BSI  L  SF570      NO, GO BUILD MANTISSA      T4C07190
                    *                                                   T4C07200
                    SF240 LD    1 SF986-X    INCREMENT COUNT OF DIGIST  T4C07210
                          S     1 SF973-X    FOLLOWING DECIMAL POINT    T4C07220
                          STO   1 SF986-X    DIVCT ZERO IF NO DECML PT  T4C07230
                          MDX     SF285      GO CHECK IF WIDTH DONE     T4C07240
                    *                                                   T4C07250
                    SF245 STO   1 SF974-X    STORE SIGN TO EXPONENT     T4C07260
                          STX  L  SF984      SET SIGN ENCOUNTERED SW    T4C07270
                          MDX     SF250+2    GO CHECK WIDTH DONE        T4C07280
                    *                                                   T4C07290
                    *                                                   T4C07300
                    SF250 SLA     16         E ENCOUNTERED              T4C07310
                          STO   1 SF984-X    CLEAR SIGN INDICATOR       T4C07320
                    *                                                   T4C07330
                          LDD   1 SF971-X    HAS E BEEN PREVIOUSLY      T4C07340
                          LDX   2 5          ENCOUNTERED                T4C07350
                          BSC  L  SF385,Z    ERROR BRANCH IF YES        T4C07360
                    *                                                   T4C07370
                          STD   1 SF979-X    CLEAR DIGIT COUNT          T4C07380
                    *                                                   T4C07390
                          LD    1 SF985-X    SET E ENCOUNTERED INDR,    T4C07400
                          STO   1 SF971-X    ALSO USED AS ADDR INDEX    T4C07410
                    *                                                   T4C07420
                          MDX     SF285+2    GO CHECK WIDTH DONE        T4C07430
                    *                                                   T4C07440
                    *                                                   T4C07450
                    SF255 LD    1 SF985-X    SET MINUS INDICATOR        T4C07460
                    *                                                   T4C07470
                    SF260 LDX   2 6          SET UP FOR ERROR           T4C07480
                    *                                                   T4C07490
                          MDX  L  SF980      VALID DIGIT ENCOUNTERED    T4C07500
                          MDX     SF245      BRANCH IF YES              T4C07510
                    *                                                   T4C07520
                          MDX  L  SF984,0    PREVIOUS SIGN ENCOUNTERED  T4C07530
                          MDX     SF280      ERROR IF YES               T4C07540
                    *                                                   T4C07550
                          STX  L2 SF984      SET SIGN INDICATOR         T4C07560
                          LDX  I2 SF971      SET EXPONENT/MANTISSA IDX  T4C07570
                    *                                                   T4C07580
                          STO  L2 SF975      PUT SIGN IN NUMBER         T4C07590
                          MDX     SF285+2    GO CHECK IF WIDTH DONE 2-2 T4C07600
                    *                                                   T4C07610
                    *                                                   T4C07620
                    SF265 MDX  L  SF979,0    WAS NON-ZERO DIGIT FOUND   T4C07630
                          MDX     SF235      IF YES, HANDLE AS DIGIT    T4C07640
                    *                                                   T4C07650
                          MDX  L  SF971,0    WAS E ENCOUNTERED          T4C07660
                          MDX     SF285+2    IF YES, CHECK WIDTH DONE   T4C07670
                    *                                                   T4C07680
                          MDX  L  SF973,0    WAS DECIMAL PT FOUND       T4C07690
                          MDX     SF240      YES, GO PROCESS            T4C07700
                    *                                                   T4C07710
                          MDX     SF285      NO, CHECK WIDTH DONE       T4C07720
                    *                                                   T4C07730
                    *                                                   T4C07740
                    SF270 STO   1 SF978+1-X  BUILD BINARY EXPONENT      T4C07750
                    *                                                   T4C07760
                          LD    1 SF972-X    MULTIPLY CONVERTED PART OF T4C07770
                          M       SF942      NUMBER BY TEN              T4C07780
                          SLT     16                                    T4C07790
                          A     1 SF978+1-X  ADD THIS PART OF NUMBER    T4C07800
                          STO   1 SF972-X    STORE CONVERTED NUMBER     T4C07810
                          S       SF941      CHECK AGAINST 192      2-2 T4C07820
                          BSC  L  SF285,+    BRANCH NOT TOO LARGE   2-2 T4C07830
                          LD      SF942      SET DEFAULT TO TEN     2-2 T4C07840
                          STO   1 SF999-X    SET TOO LARGE INDIC.   2-2 T4C07850
                          STO   1 SF972-X    DEFAULT                2-2 T4C07860
                          MDX     SF285      CHECK WIDTH DONE           T4C07870
                    *                                                   T4C07880
                    *                                                   T4C07890
                    *                                                   T4C07900
                    *              CONSTANTS                            T4C07910
                    *                                                   T4C07920
                    SF941 DC      192        USEFUL CONSTANT            T4C07930
                    SF942 DC      10         TEN                        T4C07940
                    *                                                   T4C07950
                    *                                                   T4C07960
                    SF275 LDX   2 7          SET UP FOR DECML PT ERROR  T4C07970
                    *                                                   T4C07980
                          MDX  L  SF973,-1   CHK FOR PREVIOUS DECML PT  T4C07990
                          MDX     SF280      ERROR IF FOUND             T4C08000
                    *                                                   T4C08010
                          MDX  L  SF971,0    WAS E ENCOUNTERED          T4C08020
                    SF280 MDX     SF385      YES, GO TO ERROR ROUTINE   T4C08030
                    *                                                   T4C08040
                    SF285 MDX  L  SF980,+1   INCR CNT OF VALID DIGITS   T4C08050
                    *                                                   T4C08060
                          MDX  L  SF981,-1   DECR WIDTH OF FIELD        T4C08070
                          MDX     SF365      BRANCH IF NOT COMPLETE     T4C08080
                    *                                                   T4C08090
                          LDX   2 5          LOAD COUNTER               T4C08100
                    *                                                   T4C08110
                    SF290 LD   L2 SF977-5    LOAD WORD IN FIELD         T4C08120
                          BSC     Z          SKIP IF ZERO               T4C08130
                          MDX     SF295      GO PROCESS IF NOT          T4C08140
                    *                                                   T4C08150
                          MDX   2 -1         SKIP IF ALL FIELD ZERO     T4C08160
                          MDX     SF290      GO CHECK NEXT WORD         T4C08170
                    *                                                   T4C08180
                          MDX     SF320      GO STORE ZEROES            T4C08190
                    *                                                   T4C08200
                    *                                                   T4C08210
                    SF295 LD      SF941      LOAD EXPONENT              T4C08220
                          STO   3 125        TO NORMALIZE               T4C08230
                    *                                                   T4C08240
                          LD    1 SF986-X    GET CNT OF DIGITS          T4C08250
                    *                                                   T4C08260
                          MDX  L  SF976,-1   SKIP IF E OR F FORMAT      T4C08270
                          MDX     SF300      BRANCH IF I FORMAT         T4C08280
                    *                                                   T4C08290
                          MDX  L  SF973,+1   WAS DECML PT FOUND         T4C08300
                          LD    1 SF982-X    NO, SET DECIMAL WIDTH      T4C08310
                    *                                                   T4C08320
                    SF300 MDX  L  SF971,+1   WAS E ENCOUNTERED          T4C08330
                          MDX     SF305      NO, GO NORMALIZE           T4C08340
                    *                                                   T4C08350
                          A     1 SF972-X    YES, ADD EXPONENT VALUE    T4C08360
                    *                                                   T4C08370
                          MDX  L  SF974,0    IS EXPONENT POSITIVE       T4C08380
                          MDX     SF305      NO, GO NORMALIZE           T4C08390
                    *                                                   T4C08400
                          S     1 SF972-X    YES, SUBTRACT EXPONENT     T4C08410
                          S     1 SF972-X    FROM DIGITS FOLLOWING      T4C08420
                    SF305 STO   1 SF986-X    DECIMAL POINT              T4C08430
                    *                                                   T4C08440
                    SF310 BSI  L  SF600      GO NORMALIZE NUMBER        T4C08450
                    *                                                   T4C08460
                          LD    1 SF986-X    IS COUNT MUNUS             T4C08470
                          BSC  L  SF555,+Z   BRANCH IF YES              T4C08480
                    *                                                   T4C08490
                          BSC  L  SF560,Z    BRANCH IF PLUS             T4C08500
                    *                                                   T4C08510
                          LDD   1 SF977-3-X  LOAD NAME                  T4C08520
                          SRT     1          UNNORMALIZE NUMBER ONE     T4C08530
                          SLA     1          POSITION TO CLEAR SIGN     T4C08540
                          SRA     1          AND STORE IN               T4C08550
                          STD   3 126        FLOATING POINT ACCUMULATOR T4C08560
                    *                                                   T4C08570
                          MDX  L  SF975,+1   IS MANTISSA NEGATIVE       T4C08580
                          MDX     *+3        BRANCH IF NOT              T4C08590
                    *                                                   T4C08600
                          SLT     32         COMPLEMENT NUMBER AND      T4C08610
                          SD    3 126        PUT BACK IN                T4C08620
                    SF320 STD   3 126        FLOATING PT ACCUMULATOR    T4C08630
                          LD    1 SF999-X    GET TOO LARGE INDIC.   2-2 T4C08640
                          BSC     Z          SKIP IF O-K            2-2 T4C08650
                          MDX     *+2        BRANCH IF TOO LARGE    2-2 T4C08660
                    *                                                   T4C08670
                          LD    3 125        IS EXPONENT GREATER        T4C08680
                          SRT     8          THAN 256 OR LESS           T4C08690
                          LDX   2 4          THAN ZERO                  T4C08700
                          BSC  L  SF385,Z    ERRO IF YES                T4C08710
                    *                                                   T4C08720
                    SF330 MDX  L  SF920,0    IS DATA REAL               T4C08730
                          MDX     SF350      BRANCH IF NOT              T4C08740
                    *                                                   T4C08750
                    SF335 DC      *-*        FLOATING STORE             T4C08760
                          DC      *-*        *                          T4C08770
                    *                                                   T4C08780
                    SF340 LDX  I2 SF920      DECREMENT LIST ADDRESS     T4C08790
                          LDD   1 SF993-X    BY AMOUNT REQUIRED         T4C08800
                          SD   L2 SF922      BY TYPE OF DATA            T4C08810
                          STD   1 SF993-X    AND LOWER COUNT BY ONE     T4C08820
                    *                                                   T4C08830
                    SF345 MDX  L  SF995,+1   MOVE FORMAT POINTER        T4C08840
                          BSC  L  SF100      RESUME FORMAT SCAN         T4C08850
                    *                                                   T4C08860
                    SF350 LIBF    IFIX       MAKE NUMBER FIXED POINT    T4C08870
                    *                                                   T4C08880
                          STO  I  SF993      STORE IN LIST              T4C08890
                          MDX     SF340      DECR LIST ADDR AND CNT     T4C08900
                    *                                                   T4C08910
                    *                                                   T4C08920
                    SF355 LD   I  SF993      LOAD NUMBER                T4C08930
                          LIBF    FLOAT      MAKE NUMBER FLOATING PT    T4C08940
                          MDX     SF440      CONVERT TO DECIMAL         T4C08950
                    *                                                   T4C08960
                    *                                                   T4C08970
                    SF360 LD    1 SF993-X    SET UP CALLS TO            T4C08980
                          STO     SF335+1    FLOATING STORE AND         T4C08990
                          STO     SF435+1    FLOATING LOAD              T4C09000
                    *                                                   T4C09010
                          MDX  L  SF005+1,0  SKIP IF READ               T4C09020
                          MDX     SF430      BRANCH IF WRITE            T4C09030
                    *                                                   T4C09040
                          SLA     16         SET EXPONENT               T4C09050
                          STO   3 125        TO ZERO                    T4C09060
                          STO   1 SF999-X    INITIALIZE TOO LARGE SW2-2 T4C09070
                    *                                                   T4C09080
                    SF365 LD   I  SF996      GET CHAR FROM BUFFER       T4C09090
                    *                                                   T4C09100
                          MDX  L  SF996,+1   INCR BUFFER POINTER        T4C09110
                    *                                                   T4C09120
                          A       SF951      IS CHAR ZERO               T4C09130
                          BSC  L  SF265,+-   BRANCH IF YES              T4C09140
                    *                                                   T4C09150
                          BSC  L  SF235,C    BRANCH IF 1-9              T4C09160
                    *                                                   T4C09170
                          A       SF950      IS IT E                    T4C09180
                          BSC  L  SF250,+-   BRANCH IF YES              T4C09190
                    *                                                   T4C09200
                          A       SF949      IS IT MINUS                T4C09210
                          BSC  L  SF255,+-   BRANCH IF YES              T4C09220
                    *                                                   T4C09230
                          A       SF948      IS IT AMPERSAND            T4C09240
                          BSC     Z          SKIP IF YES                T4C09250
                    *                                                   T4C09260
                          A       SF947      IS IT PLUS                 T4C09270
                          BSC  L  SF260,+-   BRANCH IF YES              T4C09280
                    *                                                   T4C09290
                          A       SF946      IS IT DECIMAL POINT        T4C09300
                          BSC  L  SF275,+-   BRANCH IF YES              T4C09310
                    *                                                   T4C09320
                          BSC  L  SF380,-    BRANCH IF INVALID CHAR     T4C09330
                    *                                                   T4C09340
                          LD    1 SF980-X    WAS A VALID CHAR FOUND     T4C09350
                          BSC  L  SF285+2,+  BRANCH IF NOT              T4C09360
                    *                                                   T4C09370
                    SF370 SLA     16         BLANK CHARACTER            T4C09380
                          MDX     SF365+5    TREAT AS ZERO              T4C09390
                    *                                                   T4C09400
                    *                                                   T4C09410
                    SF375 DC      *-*       STORE DISPLAY CODE HERE 2-6 T4C09415
                    *                                                   T4C09420
                    SF380 LDX   2 3          LOAD XR2 WITH F003         T4C09430
                    *                                                   T4C09440
                    *                                                   T4C09450
                    *     ERROR HANDLING ROUTINE                        T4C09460
                    *                                                   T4C09470
                    SF385 LD   L  2          SET UP ERROR DISPLAY XR2   T4C09480
                          OR      SF945      OF F00N                    T4C09490
                          STO     SF375     STORE TEMPORARY         2-6 T4C09495
                    *                                                   T4C09500
                          LIBF    PAUSE     HALT WITH               2-6 T4C09510
                          DC      SF375     *ERROR DISPLAY          2-6 T4C09515
                    *                                                   T4C09520
                    *                                                   T4C09530
                          BSC  I2 ETAB       BR TO ERROR ROUTINE        T4C09540
                    *                                                   T4C09550
                    *             ERROR ROUTINE TABLE                   T4C09560
                    *                                                   T4C09570
                    ETAB  DC      $EXIT      ERROR F000                 T4C09580
                          DC      SF390      ERROR F001                 T4C09590
                          DC      SF395      ERROR F002                 T4C09600
                          DC      SF410      ERROR F003                 T4C09610
                          DC      SF415      ERROR F004                 T4C09620
                          DC      SF410      ERROR F005                 T4C09630
                          DC      SF410      ERROR F006                 T4C09640
                          DC      SF410      ERROR F007                 T4C09650
                          DC      SF390      ERROR F008                 T4C09660
                          DC      SF360      ERROR F009                 T4C09670
                    *                                                   T4C09680
                    SF390 MDX  L  SF915,1    SET F001 SWITCH            T4C09690
                    *                                                   T4C09700
                          LD   L  SF005+1    IS IT READ                 T4C09710
                          BSI  L  SF070,+-   YES, CLEAR BUFFER          T4C09720
                    *                                                   T4C09730
                          BSC  I  SF110+1    NO, EXIT TO CALLER         T4C09740
                    *                                                   T4C09750
                    *                                                   T4C09760
                    SF395 LD    1 SF976-X    YES, IS IT FORMAT          T4C09770
                          S       SF946      TYPE I, E, F OR A          T4C09780
                          BSC  L  SF340,+    IF YES, BRANCH TO UPDATE   T4C09790
                    *                                                   T4C09800
                          S       SF947      NO, IS FORMAT H TYPE       T4C09810
                    SF400 BSC  L  SF345,Z    IF NO, BRANCH TO UPDATE    T4C09820
                    *                                                   T4C09830
                          LD    1 SF981-X    YES, INCREMENT FIELD       T4C09840
                          S     1 SF985-X    WIDTH BY ONE               T4C09850
                          SRT     1          DIVIDE BY TWO              T4C09860
                          A     1 SF995-X    ADD FORMAT POINTER         T4C09870
                          STO   1 SF995-X    STORE UPDATED FORMAT PT    T4C09880
                          MDX     SF400      BR TO UPDATE FMT PT        T4C09890
                    *                                                   T4C09900
                    SF410 MDX  L  SF981,-1   DECREASE FIELD             T4C09910
                          MDX     *+1        WIDTH BY ONE               T4C09920
                          MDX     SF415      BR IF WIDTH EXHAUSTED      T4C09930
                    *                                                   T4C09940
                          LD    1 SF996-X    UPDATE BUFFER POINTER      T4C09950
                          A     1 SF981-X    BY WW CHARACTERS           T4C09960
                          STO   1 SF996-X    FOR NEXT FORMAT            T4C09970
                    *                                                   T4C09980
                    SF415 SLT     32         CLEAR ACC AND EXTENSION    T4C09990
                          STO   3 125        ZERO FAC EXPONENT          T4C10000
                          STO   1 SF999-X    INITIALIZE TOO LARGE SW2-2 T4C10010
                          MDX     SF320      GO STORE ZERO IN MANTISSA  T4C10020
                    *                                                   T4C10030
                    *                                                   T4C10040
                    SF430 MDX  L  SF920,0    SKIP IF REAL               T4C10050
                          MDX     SF355      BRANCH IF INTEGER          T4C10060
                    *                                                   T4C10070
                    SF435 DC      *-*        FLOATING LOAD              T4C10080
                          DC      *-*        *                          T4C10090
                    *                                                   T4C10100
                    SF440 LD    1 SF981-X    LOAD TOTAL FIELD WIDTH     T4C10110
                          S     1 SF983-X    SUBTRACT CTR               T4C10120
                          S     1 SF982-X    SUBTRACT DECIMAL WIDTH     T4C10130
                          STO   1 SF983-X    SAVE WIDTH                 T4C10140
                    *                                                   T4C10150
                          LDX  I2 SF922      LOAD XR2 WITH PRECISION    T4C10160
                    *                                                   T4C10170
                          LD    3 125        CLEAR EBC BLANKS           T4C10180
                          AND     SF958      TO AVOID LONG          2-4 T4C10190
                    *                        NORMALIZING LOOP       2-4 T4C10200
                          STO   3 125        ON TRACE OF A TYPE         T4C10210
                    *                                                   T4C10220
                          LD      SF952      SET MANTISSA AND           T4C10230
                          STO   1 SF990-X    EXPONENT TO                T4C10240
                          STO   1 SF975-X    POSITIVE                   T4C10250
                    *                                                   T4C10260
                          SLT     32                                    T4C10270
                          STD   1 SF977-1-X  ZERO CONVERT FIELD         T4C10280
                    *                                                   T4C10290
                          LDD   3 126        LOAD FAC                   T4C10300
                          BSC  L  SF455,-Z   BRANCH IF POSITIVE         T4C10310
                    *                                                   T4C10320
                          BSC  L  SF450,Z    BRANCH IF NEGATIVE         T4C10330
                    *                                                   T4C10340
                          STO   1 SF973-X    CLEAR DECIMAL PT SW        T4C10350
                    *                                                   T4C10360
                          LDD     SF956      ZERO OUT EXPONENT          T4C10370
                          STD   1 SF991-X    IF MANTISSA IS ZERO        T4C10380
                    *                                                   T4C10390
                          MDX     SF490      GO OUTPUT                  T4C10400
                    *                                                   T4C10410
                    *                                                   T4C10420
                    *              CONSTANTS                            T4C10430
                    SF945 DC      /F000      ERROR WORD                 T4C10440
                    SF946 DC      /0003      DECIMAL POINT              T4C10450
                    SF947 DC      2          USEFUL CONSTANT            T4C10460
                    SF948 DC      /0010      PLUS                       T4C10470
                    SF949 DC      /0065      MINUS                      T4C10480
                    SF950 DC      /002B      E                          T4C10490
                    SF951 DC      /FF10      USED FOR NUMERIC           T4C10500
                          BSS  E  0          TO MAKE SURE THAT THE  2-4 T4C10502
                    *        SECOND CONST AFTER THIS COMES ON ODD   2-4 T4C10504
                    SF952 DC      /0040      BLANK                      T4C10510
                    SF956 DC      /00F0      CONST FOR EBC NUM      2-4 T4C10512
                    *                        (MUST BE AT ODD LOC)   2-4 T4C10514
                    SF957 EQU     SF956      SAME AS ABOVE          2-4 T4C10516
                    SF958 DC      /00FF      MASK FOR LEFT HALF     2-4 T4C10518
                    *                                                   T4C10520
                    *                                                   T4C10530
                    SF450 SLT     32         CLEAR ACC AND EXTENSION    T4C10540
                          SD    3 126        SET NEGATIVE FAC POSITIVE  T4C10550
                    *                                                   T4C10560
                          MDX  L  SF975,+32  SET MANTISSA SIGN NEGATIVE T4C10570
                    *                                                   T4C10580
                    SF455 SLT     1          LEFT JUSTIFY NUMBER        T4C10590
                          STD   1 SF977-3-X  AND STORE IN WORK AREA     T4C10600
                    *                                                   T4C10610
                          MDX  L  SF920,0    SKIP IF REAL               T4C10620
                          MDX     SF465      BRANCH IF INTEGER          T4C10630
                    *                                                   T4C10640
                          LD   L2 SF962-2    LOAD NUMBER                T4C10650
                          SRT     15         SHIFT RIGHT                T4C10660
                    *                                                   T4C10670
                          AD    1 SF977-3-X  ADD CONVERSION NUMBER      T4C10680
                          BSC     C          SKIP IF NO CARRY           T4C10690
                          MDX     *+3        BRANCH IF CARRY            T4C10700
                    SF460 STD   1 SF977-3-X  STORE NUMBER               T4C10710
                    *                                                   T4C10720
                    SF465 LD    3 125        LOAD EXPONENT              T4C10730
                          MDX     SF466      GO STORE NUMBER            T4C10740
                    *                                                   T4C10750
                          SRT     1          SHIFT DATA RIGHT           T4C10760
                          OR   L  SF968      STORE NUMBER               T4C10770
                          STD   1 SF977-3-X  LOAD EXPONENT              T4C10780
                    *                                                   T4C10790
                          LD    3 125                                   T4C10800
                          S     1 SF985-X    INCREMENT BY ONE           T4C10810
                          STO   3 125        STORE EXPONENT             T4C10820
                    *                                                   T4C10830
                    SF466 S       SF960      FIND TYPE OF DATA          T4C10840
                          BSC  L  SF550,+Z   BRANCH IF FRACTION         T4C10850
                    *                                                   T4C10860
                          BSC  L  SF475,+    BRANCH IF PART INTEGER     T4C10870
                    *                                                   T4C10880
                    SF470 BSI  L  SF580      GO DIVIDE BY TEN           T4C10890
                    *                                                   T4C10900
                          BSI  L  SF600      GO NORMALIZE NUMBER        T4C10910
                    *                                                   T4C10920
                          MDX  L  SF973,1    UP COUNT OF DIVIDES        T4C10930
                          NOP                                           T4C10940
                    *                                                   T4C10950
                          LD    3 125        CHECK EXPONENT AND         T4C10960
                          S       SF960      LOOP UNTIL IT GETS         T4C10970
                          MDX     SF470-2    TO 128                     T4C10980
                    *                                                   T4C10990
                    SF475 MDX  L  SF976,0    IS IT TYPE E               T4C11000
                          MDX     SF485      BRANCH IF NOT              T4C11010
                    *                                                   T4C11020
                          LD    1 SF973-X    LOAD COUNT OF DIVIDES      T4C11030
                          BSC  L  SF480,-    BRANCH IF POSITIVE         T4C11040
                    *                                                   T4C11050
                          MDX  L  SF990,+32  PUT OUT MINUS SIGN         T4C11060
                    *                                                   T4C11070
                          SLA     16         GET COMPLEMENT             T4C11080
                          S     1 SF973-X    OF DIVIDE COUNT (EXPONENT) T4C11090
                    *                                                   T4C11100
                    SF480 RTE     16         POSITION COUNT             T4C11110
                          SLA     16         FOR DIVIDE                 T4C11120
                    *                                                   T4C11130
                          STO   1 SF973-X    CLEAR DIVIDE COUNT         T4C11140
                    *                                                   T4C11150
                          D       SF966      CONVERT TO TWO             T4C11160
                          AD      SF956      DIGIT EBC NUMBER           T4C11170
                    *                                                   T4C11180
                          STD   1 SF991-X    STORE EBC NUMBER           T4C11190
                    *                                                   T4C11200
                    SF485 LDS     3          SET SWITCH FOR RETURN      T4C11210
                    *                                                   T4C11220
                          LD    3 125        LOAD EXPONENT              T4C11230
                          S       SF960      DETERMINE TYPE NORMALIZE   T4C11240
                          BSC  L  SF605,+Z   BRANCH IF RIGHT NORMALIZE  T4C11250
                    *                                                   T4C11260
                          BSC  L  SF625,Z    BRANCH IF LEFT NORMALIZE   T4C11270
                    *                                                   T4C11280
                    SF490 LD    1 SF973-X    IS NUMBER A ZERO           T4C11290
                          BSC  L  SF635,+    BRANCH IF YES              T4C11300
                    *                                                   T4C11310
                          LD    1 SF976-X    LOAD TYPE                  T4C11320
                          S       SF963      IS THIS F TYPE             T4C11330
                          BSC     Z          SKIP IF YES                T4C11340
                          MDX     SF495      BRANCH IF NOT              T4C11350
                    *                                                   T4C11360
                          MDX  L  SF983,1    OUTPUT ONE MORE CHAR       T4C11370
                          NOP                                           T4C11380
                    *                                                   T4C11390
                    SF495 LD    1 SF983-X    AR NUMBER OF DIGITS        T4C11400
                          S     1 SF973-X    GREATER THAN NO. ALLOWED   T4C11410
                          BSC  L  SF590,+Z   BRANCH TO ERROR IF YES     T4C11420
                    *                                                   T4C11430
                          A     1 SF996-X    INCREMENT BUFFER ADDR BY   T4C11440
                          STO   1 SF996-X    APPROPRIATE NO. OF WORDS   T4C11450
                    *                                                   T4C11460
                    SF500 LD    1 SF975-X    LOAD SIGN OF MANTISSA      T4C11470
                    *                                                   T4C11480
                          BSI     SF545      OUTPUT SIGN                T4C11490
                    *                                                   T4C11500
                          LD    1 SF920-X    LOAD REAL/INTEGER SW       T4C11510
                          BSC  L  SF505,+-   BRANCH IF REAL             T4C11520
                    *                                                   T4C11530
                          LD    1 SF985-X                               T4C11540
                          STO   1 SF977-X                               T4C11550
                    *                                                   T4C11560
                    SF505 LD    1 SF973-X    BRANCH IF DIVIDE           T4C11570
                          BSC  L  SF540,+    COUNT IS ZERO              T4C11580
                    *                                                   T4C11590
                    SF510 SLA     16         ZERO OUT FIFTH WORD        T4C11600
                          STO   1 SF977-4-X  OF WORK AREA               T4C11610
                    *                                                   T4C11620
                          BSI     SF570      GO MULTIPLY BY TEN AND     T4C11630
                    *                                                   T4C11640
                          OR      SF957      CONVERT OT EBC CHARACTER   T4C11650
                    *                                                   T4C11660
                          BSI     SF545      OUTPUT DIGIT               T4C11670
                    *                                                   T4C11680
                          MDX  L  SF973,-1   STAY IN LOOP UNTIL ALL     T4C11690
                          MDX     SF510      CHARACTERS OUTPUTTED       T4C11700
                    *                                                   T4C11710
                    SF515 LD    1 SF982-X    LOAD DECIMAL WIDTH         T4C11720
                          BSC     +Z         SKIP IF E OR F TYPE        T4C11730
                          MDX     SF525      EXIT IF I TYPE             T4C11740
                    *                                                   T4C11750
                          LD      SF961      LOAD DECIMAL POINT         T4C11760
                    *                                                   T4C11770
                          BSI     SF545      OUTPUT CHARACTER           T4C11780
                    *                                                   T4C11790
                          LD    1 SF982-X    IS DECIMAL WIDTH ZERO      T4C11800
                          BSC  L  SF525,+    BRANCH IF YES              T4C11810
                    *                                                   T4C11820
                    SF520 STO   1 SF973-X    SET UP TO OUTPUT FRACTION  T4C11830
                    *                                                   T4C11840
                          LD    1 SF985-X    FORCE EXIT                 T4C11850
                          STO   1 SF982-X    AT BIN23                   T4C11860
                          MDX     SF510      GO OUTPUT CHARACTERS       T4C11870
                    *                                                   T4C11880
                    *                                                   T4C11890
                    *                                                   T4C11960
                    SF525 MDX  L  SF976,0    SKIP IF TYPE E             T4C11970
                          MDX     SF535      EXIT IF OTHER              T4C11980
                    *                                                   T4C11990
                          LDX   2 -4         SET COUNTER TO             T4C12000
                    SF530 LD   L2 SF918+4    OUTPUT E, SIGN, AND        T4C12010
                          BSI     SF545      TWO DIGIT EXPONENT         T4C12020
                    *                                                   T4C12030
                          MDX   2 1          CONTINUE UNTIL             T4C12040
                          MDX     SF530      ALL OUTPUTTED              T4C12050
                    *                                                   T4C12060
                    SF535 BSC  L  SF340      GET NEXT CHAR              T4C12070
                    *                                                   T4C12080
                    *                                                   T4C12090
                    SF540 LD      SF957      LOAD EBC ZERO              T4C12100
                          BSI     SF545      OUTPUT CHARACTER           T4C12110
                          MDX     SF515      CONTINUE CHECK             T4C12120
                    *                                                   T4C12130
                    *                                                   T4C12140
                    *             OUTPUT STORE SUBROUTINE               T4C12150
                    *                                                   T4C12160
                    SF545 DC      *-*        ENTRY POINT                T4C12170
                    *                                                   T4C12180
                          STO  I  SF996      STORE CHAR IN BUFFER       T4C12190
                    *                                                   T4C12200
                          MDX  L  SF996,+1   INCR BUFFER ADDR BY ONE    T4C12210
                    *                                                   T4C12220
                          BSC  I  SF545      RETURN                     T4C12230
                    *                                                   T4C12240
                    *                                                   T4C12250
                    SF550 MDX  L  SF976,0    SKIP IF E TYPE             T4C12260
                          MDX     SF485      GO NORMALIZE IF OTHER TYPE T4C12270
                    *                                                   T4C12280
                          BSI     SF570      GO MULTIPLY BY TEN         T4C12290
                          BSI     SF600      THEN GO NORMALIZE          T4C12300
                    *                                                   T4C12310
                          MDX  L  SF973,-1   REDUCE DIVIDE              T4C12320
                          MDX     SF465      COUNT BY ONE               T4C12330
                    *                                                   T4C12340
                          MDX     SF465      FIND TYPE OF NEXT DIGIT    T4C12350
                    *                                                   T4C12360
                    *              CONSTANTS                            T4C12370
                    *                                                   T4C12380
                    SF960 DC      128        USEFUL CONSTANT            T4C12390
                    SF961 DC      /004B      DECIMAL POINT              T4C12400
                    SF962 DC      259        USEFUL CONSTANT            T4C12410
                          DC      1          USEFUL CONSTANT            T4C12420
                    *                                                   T4C12430
                    SF555 S     1 SF985-X    ADD ONE TO                 T4C12440
                          STO   1 SF986-X    FOLDP                      T4C12450
                    *                                                   T4C12460
                          SLA     16         CLEAR ACCUMULATOR          T4C12470
                    *                                                   T4C12480
                          BSI     SF570      MULTIPLY NUMBER BY TEN     T4C12490
                          MDX     *+3        GO NORMALIZE               T4C12500
                    *                                                   T4C12510
                    SF560 A     1 SF985-X    SUBTRACT ONE               T4C12520
                          STO   1 SF986-X    FROM FOLDP                 T4C12530
                    *                                                   T4C12540
                          BSI     SF580      DIVIDE NUMBER BY TEN       T4C12550
                    *                                                   T4C12560
                          BSC  L  SF310      GO NORMALIZE               T4C12570
                    *                                                   T4C12580
                    *                                                   T4C12590
                    *              CONSTANTS                            T4C12600
                    *                                                   T4C12610
                    SF963 DC      1          ONE                        T4C12620
                    SF966 DC      10         TEN                        T4C12630
                    SF967 DC      5          FIVE                       T4C12640
                    *                                                   T4C12650
                    *                                                   T4C12660
                    *             MULTIPLY BY 10 SUBROUTINE             T4C12670
                    *                                                   T4C12680
                    SF570 DC      *-*        ENTRY POINT                T4C12690
                    *                                                   T4C12700
                          STO   1 SF978+1-X  SAVE NUMBER                T4C12710
                          LDX   2 5          LOAD COUNTER               T4C12720
                    *                                                   T4C12730
                    SF575 LD   L2 SF977-5    LOAD ALREADY CONVERTED NO. T4C12740
                          M       SF966      MULTIPLY BY TEN            T4C12750
                          BSC     +Z         SKIP IF NEGATIVE           T4C12760
                    *                                                   T4C12770
                          A       SF966      ADD TEN                    T4C12780
                    *                                                   T4C12790
                          AD    1 SF978-X    ADD PRESENT DIGIT          T4C12800
                          STO   1 SF978+1-X  CLEAR WORD                 T4C12810
                    *                                                   T4C12820
                          SLT     16         CLEAR ACC                  T4C12830
                          STO  L2 SF977-5    SAVE CONVERTED WORD        T4C12840
                    *                                                   T4C12850
                          MDX   2 -1         DECREMENT COUNTER          T4C12860
                          MDX     SF575      CONTINUE CONVERSION        T4C12870
                    *                                                   T4C12880
                          BSC  I  SF570      RETURN                     T4C12890
                    *                                                   T4C12900
                    *                                                   T4C12910
                    *             DIVIDE BY 10 SUBROUTINE               T4C12920
                    *                                                   T4C12930
                    SF580 DC      *-*        ENTRY POINT                T4C12940
                    *                                                   T4C12950
                          LDX   2 -4         LOAD COUNTER               T4C12960
                    *                                                   T4C12970
                          SLT     32         CLEAR ACC AND EXTENSION    T4C12980
                    *                                                   T4C12990
                    SF585 LD   L2 SF977+1    LOAD NUMBER                T4C13000
                          RTE     16         PUT IN EXTENSION           T4C13010
                    *                                                   T4C13020
                          LDX   1 1          INITIALIZE SWITCH          T4C13030
                    *                                                   T4C13040
                          S       SF967      SUBTRACT FIVE              T4C13050
                          BSC     -          SKIP IF NEGATIVE           T4C13060
                    *                                                   T4C13070
                          MDX   1 -2         TEST SWITCH                T4C13080
                    *                                                   T4C13090
                          A       SF967      RESTORE NUMBER             T4C13100
                    *                                                   T4C13110
                          D       SF966      DIVIDE BY TEN              T4C13120
                    *                                                   T4C13130
                          MDX   1 -2         TEST SWITCH                T4C13140
                    *                                                   T4C13150
                          A       SF968      SET BIT                    T4C13160
                    *                                                   T4C13170
                          STO  L2 SF977+1    STORE NUMBER               T4C13180
                    *                                                   T4C13190
                          MDX   2 1          MODIFY COUNTER             T4C13200
                          MDX     SF585      CONTINUE LOOP              T4C13210
                    *                                                   T4C13220
                          LDX  L1 X          RESET TRANSFER VECTOR      T4C13230
                          S     1 SF985-X    ADD ONE                2-4 T4C13232
                          STO   1 SF977-X    STORE BACK             2-4 T4C13234
                          BSC  I  SF580      RETURN                     T4C13240
                    *                                                   T4C13250
                    *                                                   T4C13260
                    SF590 MDX  L  SF975,-64  IS SIGN PLUS               T4C13270
                          MDX     SF595      BRANCH IF NO               T4C13280
                          S     1 SF985-X    CHECK IF WIDTH OK IF NO    T4C13290
                          BSC  L  SF500+2,+- IF YES, OUTPUT NUMBER      T4C13300
                    *                                                   T4C13310
                    SF595 LD      SF969      LOAD ASTERISK              T4C13320
                    *                                                   T4C13330
                          BSI     SF545      OUTPUT ASTERISKS           T4C13340
                          MDX  L  SF981,-1   UNTIL FIELD WIDTH          T4C13350
                          MDX     SF595      EXHAUSTED                  T4C13360
                    *                                                   T4C13370
                          MDX     SF535      RETURN                     T4C13380
                    *                                                   T4C13390
                    *                                                   T4C13400
                    *             NORMALIZE SUBROUTINE                  T4C13410
                    *                                                   T4C13420
                    SF600 DC      *-*        ENTRY POINT                T4C13430
                    *                                                   T4C13440
                          LDS     0          SET STATUS FOR RETURN      T4C13450
                    *                                                   T4C13460
                          LD    1 SF977-4-X  IS LEFT MOST WORD ZERO     T4C13470
                          BSC  L  SF620,+-   BRANCH IF YES              T4C13480
                    *                                                   T4C13490
                    SF605 LDX   2 -5         NORMALIZE RIGHT            T4C13500
                    *                                                   T4C13510
                          SLT     32         CLEAR ACC AND EXTENSION    T4C13520
                    SF610 LD   L2 SF977+1    LOAD WORD                  T4C13530
                          RTE     1          SHIFT CHARACTERS RIGHT ONE T4C13540
                          STO  L2 SF977+1    POSITION AND STORE         T4C13550
                    *                                                   T4C13560
                          RTE     15         GET ENTIRE WD IN EXTENSION T4C13570
                    *                                                   T4C13580
                          MDX   2 1          INCREMENT COUNTER          T4C13590
                          MDX     SF610      CONTINUE NORMALIZATION     T4C13600
                    *                                                   T4C13610
                          LD      SF963      LOAD ONE                   T4C13620
                    SF615 A     3 125        ADD TO EXPONENT            T4C13630
                          STO   3 125        STORE                      T4C13640
                    *                                                   T4C13650
                          BSC  L  SF485,O    RETURN IF OUTPUT           T4C13660
                    *                                                   T4C13670
                          MDX     SF600+1    GO NORMALIZE AGAIN         T4C13680
                    *                                                   T4C13690
                    SF620 LD    1 SF977-3-X  WAS NO. ALREADY NORMALIZED T4C13700
                          BSC  I  SF600,+Z   RETURN IF YES              T4C13710
                    *                                                   T4C13720
                          BSC     Z          SKIP IF ZERO               T4C13730
                          MDX     SF625      BRANCH IF NOT ALL ZEROS    T4C13740
                    *                                                   T4C13750
                          LD    1 SF977-2-X  MOVE CONVERT AREA LEFT     T4C13760
                          STO   1 SF977-3-X  *BY WORDS                  T4C13770
                          LD    1 SF977-1-X  *                          T4C13780
                          STO   1 SF977-2-X  *                          T4C13790
                          LD    1 SF977-X    *                          T4C13800
                          STO   1 SF977-1-X  *                          T4C13810
                          SLA     16         *                          T4C13820
                          STO   1 SF977-X    *                          T4C13830
                    *                                                   T4C13840
                          LD    3 125        DECR EXPONENT BY 16        T4C13850
                          S       SF988      *                          T4C13860
                          STO   3 125        *                          T4C13870
                    *                                                   T4C13880
                          MDX     SF620      CONTINUE                   T4C13890
                    *                                                   T4C13900
                    SF625 LDX   2 5          LOAD COUNTER               T4C13910
                    *                                                   T4C13920
                          SLT     32         CLEAR ACC AND EXTENSION    T4C13930
                    SF630 LD   L2 SF977-5    LOAD WORD                  T4C13940
                    *                                                   T4C13950
                          RTE     31         SHIFT LEFT ONE POSITION    T4C13960
                          STO  L2 SF977-5    AND STORE                  T4C13970
                    *                                                   T4C13980
                          SLT     15         SAVE RIGHT MOST BIT        T4C13990
                    *                                                   T4C14000
                          MDX   2 -1         DECREMENT COUNTER          T4C14010
                          MDX     SF630      CONTINUE LOOP              T4C14020
                    *                                                   T4C14030
                          LD    1 SF985-X    SET UP TO REDUCE           T4C14040
                          MDX     SF615      EXPONENT BY ONE            T4C14050
                    *                                                   T4C14060
                    *                                                   T4C14070
                    *              CONSTANTS                            T4C14080
                    *                                                   T4C14090
                    SF968 DC      /8000      USEFUL CONSTANT            T4C14100
                    SF969 DC      /005C      ASTERISK                   T4C14110
                    SF988 DC      16         USEFUL CONSTANT            T4C14120
                    *                                                   T4C14130
                    *                                                   T4C14140
                    SF635 LD    1 SF982-X    IS THIS I TYPE             T4C14150
                    SF640 BSC  L  SF495,-    BRANCH IF NO               T4C14160
                    *                                                   T4C14170
                          BSI     SF580      SET UP TO OUTPUT           T4C14180
                          LD      SF963      ONE ZERO                   T4C14190
                          STO   1 SF973-X                               T4C14200
                          MDX     SF640      GO OUTPUT ZERO             T4C14210
                    *                                                   T4C14220
                    SF650 BSC  L  SF112,-Z   NO EXIT IF COUNT POS   2-9 T4C14221
                          LD   L  SF005+1    CHECK READ/WRITE IND   2-9 T4C14222
                          BSC  L  SF110,Z    BRANCH OUT IF WRITE    2-9 T4C14223
                          LD   L  SF910+1    RESET                  2-9 T4C14224
                          STO  L  SF914      *T-FORMAT SWITCH       2-9 T4C14225
                          BSC  L  SF110      *AND BRANCH OUT        2-9 T4C14226
                    *                                                   T4C14230
                    *             BUFFER SIZE TABLE                     T4C14240
                    *                                                   T4C14250
                    SF998 DC      -120       TYPEWRITER                 T4C14260
                          DC      -80        1442 CARD READ/PUNCH       T4C14270
                          DC      -121       1132 PRINTER               T4C14280
                          DC      -120       PAPER TAPE                 T4C14290
                          DC      -121       1403 PRINTER               T4C14300
                          DC      -80        KEYBOARD                   T4C14310
                          DC      -121       PLOTTER                    T4C14320
                          DC      -80        2501 CARD READER           T4C14330
                          DC      -80        1442 PUNCH ONLY            T4C14340
                    *                                                   T4C14350
                    *                                                   T4C14360
                    *                                                   T4C14370
                          BSS     1          WD CNT FOR 2501            T4C14380
                    *                                                   T4C14390
                    SF970 BSS  E  121        I/O BUFFER                 T4C14400
                    *                                                   T4C14410
                    *                                                   T4C14420
                    *             SFIO OVERLAY EQUATES                  T4C14430
                    *                                                   T4C14440
                    X     EQU     SFIO+15    TRANSFER VECTOR            T4C14450
                    SF971 EQU     X+1        E ENCOUNTERED SWITCH       T4C14460
                    SF972 EQU     X+2        EXPONENT                   T4C14470
                    SF973 EQU     X+3        NUMBER OF DIVIDES          T4C14480
                    SF974 EQU     X+4        EXPONENT SIGN              T4C14490
                    SF975 EQU     X+5        MANTISSA SIGN              T4C14500
                    SF976 EQU     X+6        FORMAT TYPE                T4C14510
                    SF977 EQU     X+11       CONVERT WORK FIELD         T4C14520
                    SF978 EQU     X+12       DIGIT WORK FIELD           T4C14530
                    SF979 EQU     X+14       NUMBER OF DIGITS           T4C14540
                    SF980 EQU     X+15       NUMBER OF VALID CHARS      T4C14550
                    SF981 EQU     X+16       TOTAL FIELD WIDTH          T4C14560
                    SF982 EQU     X+17       DECIMAL FIELD WIDTH        T4C14570
                    SF983 EQU     X+18       TEMPORARY STORAGE          T4C14580
                    SF984 EQU     X+19       SIGN OF NUMBER             T4C14590
                    SF985 EQU     X+20       MINUS ONE                  T4C14600
                    SF999 EQU     X+21       EXPONENT TOO LARGE SW  2-2 T4C14610
                    SF986 EQU     X          DIGITS AFTER DECIMAL PT    T4C14620
                    SF987 EQU     SF980      LEFT/RIGHT HALF SWITCH     T4C14630
                    SF990 EQU     SFIO       SIGN OF NUMBER             T4C14640
                    SF991 EQU     SFIO+1     EXPONENT                   T4C14650
                    SF993 EQU     SFIO+3     ADDRESS OF ELEMENT         T4C14660
                    SF994 EQU     SFIO+4     ITEM COUNTER               T4C14670
                    SF995 EQU     SFIO+5     FORMAT POINTER             T4C14680
                    SF996 EQU     SFIO+6     BUFFER POINTER             T4C14690
                    SF997 EQU     SFIO+14    MINUS ONE                  T4C14700
                    *                                                   T4C14710
                          END                                   SFIO758 T4C14720
