                    *             JULY 6,1967                           T3F00010
                          HDNG    PDUMP                                 T3F00020
                    *************************************************** T3F00030
                    *STATUS-VERSION 2, MODIFICATION 0                 * T3F00040
                    *                                                 * T3F00050
                    *FUNCTION/OPERATION                               * T3F00060
                    *   * DUMPS THE CONTENTS OF CORE BETWEEN SPECIFIED* T3F00070
                    *     LIMITS. DUMP MAY BE REAL, INTEGER OR        * T3F00080
                    *     HEXADECIMAL. THE FORMATS OF THE DUMPS ARE   * T3F00090
                    *     AS FOLLOWS-                                 * T3F00100
                    *       * DEXIDECIMAL - SYSTEM DUMP FORMAT        * T3F00110
                    *       * INTEGER     - 12I/O                     * T3F00120
                    *       * REAL-                                   * T3F00130
                    *           * STANDARD - 6E20.6                   * T3F00140
                    *           * EXTENDED - 6E20.9                   * T3F00150
                    *                                                 * T3F00160
                    *ENTRY POINTS-                                    * T3F00170
                    *   * CALL    PDUMP      CALL TO PDUMP            * T3F00180
                    *     DC      ADDR1      LIMITS OF                * T3F00190
                    *     DC      ADDR2      *DUMP                    * T3F00200
                    *     DC      TYPE       TYPE OF DUMP REQUESTED   * T3F00210
                    *                        * 0 - HEXADECIMAL        * T3F00220
                    *                        * 4 - INTEGER            * T3F00230
                    *                        * 5 - REAL               * T3F00240
                    *     .                                           * T3F00250
                    *     .                                           * T3F00260
                    *     .                                           * T3F00270
                    *     DC      ADDRM                               * T3F00280
                    *     DC      ADDRN                               * T3F00290
                    *     DC      TYPEN                               * T3F00300
                    *     DC      0          TERMINATOR               * T3F00310
                    *                                                 * T3F00320
                    *                                                 * T3F00330
                    *                                                 * T3F00340
                    *EXTERNAL REFERENCES-                             * T3F00350
                    *   * SFIO                                        * T3F00360
                    *   * SIOAI                                       * T3F00370
                    *   * SIOAF                                       * T3F00380
                    *   * SWRT                                        * T3F00390
                    *   * SCOMP                                       * T3F00400
                    *                                                 * T3F00410
                    *COMMA/DCOM-                                      * T3F00420
                    *   * $DUMP                                       * T3F00430
                    *                                                 * T3F00440
                    *EXITS-                                           * T3F00450
                    *   NORMAL-                                       * T3F00460
                    *       PROGRAM RETURNS CONTROL TO ZERO PARAMETER * T3F00470
                    *       PLUS 1                                    * T3F00480
                    *   ERROR-                                        * T3F00490
                    *       N/A                                       * T3F00500
                    *                                                 * T3F00510
                    *TABLES/WORK AREAS - N/A                          * T3F00520
                    *                                                 * T3F00530
                    *ATTRIBUTES - N/A                                 * T3F00540
                    *                                                 * T3F00550
                    *NOTES- N/A                                       * T3F00560
                    *                                                 * T3F00570
                    *************************************************** T3F00580
                          HDNG    PDUMP                                 T3F00590
                    *                                                   T3F00600
                          ENT     PDUMP                                 T3F00610
                    *                                                   T3F00620
                    *                                                   T3F00630
                    *                                                   T3F00640
                    PDUMP DC      *-*        FIRST PARAMETER            T3F00650
                    *                                                   T3F00660
                          STX   1 PD090+1    SAVE XR1                   T3F00670
                          LDX  I1 PDUMP      INITIALIZE PARAMETER PT    T3F00680
                    *                                                   T3F00690
                    PD010 STX   3 PD020+1    STORE TV POINTER           T3F00700
                          LD      PD901      LOAD LIBF SFIO             T3F00710
                          SLA     8          GET DISPLACEMENT           T3F00720
                          SRT     8          *IN ORDER TO GET           T3F00730
                          A       PD020+1    *PRECISION PARAMETER       T3F00740
                          STO     PD020+1    *WORD                      T3F00750
                    *                                                   T3F00760
                    PD020 LD   I  *-*        LOAD PRECISION             T3F00770
                          AND     PD902      CLEAR ALL BUT PRECISION    T3F00780
                          SRT     1          MOVE ONE WORD INTEGER BIT  T3F00790
                          STO     PD903      STORE REAL PRECISION       T3F00800
                          STO     PD904      STORE INTEGER PRECISION    T3F00810
                          S       PD911      IS IT EXTENDED PRECISION   T3F00820
                          BSC  L  PD030,+-   BRANCH IF YES              T3F00830
                          LD      PD912      LOAD STANDARD PREC ADDR    T3F00840
                          MDX     PD040      GO PUT INTO LIBF           T3F00850
                    *                                                   T3F00860
                    PD030 LD      PD913      LOAD EXTENDED PREC ADDR    T3F00870
                    *                                                   T3F00880
                    PD040 STO     PD930      PUT INTO LIBF              T3F00890
                          SLA     16                                    T3F00900
                          SLT     1          GET ONE WORD INTEGER BIT   T3F00910
                          EOR     PD905      REVERSE BIT                T3F00920
                          BSC     Z          SKIP IF NOT ONE-WD-INTEGER T3F00930
                          STO     PD904      SET INTEGER PRECISION = 1  T3F00940
                    *                                                   T3F00950
                          LD      PD907      SET UP TO BRANCH AROUND    T3F00960
                          STO     PD010      *INITIALIZATION SECTION    T3F00970
                    *                                                   T3F00980
                    *                                                   T3F00990
                    PD050 LD    1 0          LOAD DUMP ADDRESS          T3F01000
                          BSC  L  PD080,+-   EXIT IF ZERO               T3F01010
                          STO     PD808      STORE AS LOWER LIMIT       T3F01020
                          MDX   1 1          MOVE POINTER               T3F01030
                          LD    1 0          LOAD NEXT DUMP ADDRESS     T3F01040
                          BSC  L  PD080,+-   EXIT IF ZERO               T3F01050
                          STO     PD809      STORE AS UPPER LIMIT       T3F01060
                          MDX   1 1          MOVE POINTER               T3F01070
                          LD    1 0          LOAD FORMAT ADDRESS        T3F01080
                          BSC  L  PD080,+-   EXIT IF ZERO               T3F01090
                          MDX   1 1          MOVE POINTER               T3F01100
                    *                                                   T3F01110
                          LD      PD809      LOAD UPPER LIMIT           T3F01120
                          S       PD808      IS UPPER .GT. LOWER        T3F01130
                          BSC  L  PD070,-    BRANCH IF YES              T3F01140
                    *                                                   T3F01150
                    *             EXCHANGE UPPER AND LOWER LIMITS       T3F01160
                    *                                                   T3F01170
                    PD060 LD    1 -3         LOAD FIRST ADDRESS         T3F01180
                          STO     PD809      STORE AS UPPER LIMIT       T3F01190
                          LD    1 -2         LOAD SECOND ADDRESS        T3F01200
                          STO     PD808      STORE AS LOWER LIMIT       T3F01210
                    *                                                   T3F01220
                    PD070 LD   I1 -1         LOAD FORMAT WORD           T3F01230
                          S       PD910      IS IT AN INTEGER DUMP      T3F01240
                          BSC  L  PD100,+-   BRANCH IF YES              T3F01250
                    *                                                   T3F01260
                          S       PD905      IS IT A REAL DUMP          T3F01270
                          BSC  L  PD110,+-   BRANCH IF YES              T3F01280
                    *                                                   T3F01290
                    *             ASSUME HEXADECIMAL DUMP               T3F01300
                    *                                                   T3F01310
                          BSI  L  $DUMP      BRANCH TO SYSTEM DUMP SUBR T3F01320
                          DC      0          HEX FORMAT                 T3F01330
                    PD808 DC      *-*        LOW LIMIT                  T3F01340
                    PD809 DC      *-*        HIGH LIMIT                 T3F01350
                    *                                                   T3F01360
                          MDX     PD050      GET NEXT SET OF PARAMETERS T3F01370
                    *                                                   T3F01380
                    *                                                   T3F01390
                    *             FORMAT STATEMENTS                     T3F01400
                    *                                                   T3F01410
                    *             INTEGER FORMAT  12I10                 T3F01420
                    *                                                   T3F01430
                    PD810 DC      /200A      I10                        T3F01440
                          DC      /900C      12 TIMES                   T3F01450
                          DC      /B002      RE-DO                      T3F01460
                    *                                                   T3F01470
                    *             STANDARD PRECISION FORMAT 6E20.6      T3F01480
                    *                                                   T3F01490
                    PD820 DC      /0314      E20.6                      T3F01500
                          DC      /9006      6 TIMES                    T3F01510
                          DC      /B002      RE-DO                      T3F01520
                    *                                                   T3F01530
                    *             EXTENDED PRECISION FORMAT 6E20.9      T3F01540
                    *                                                   T3F01550
                    PD830 DC      /0494      E20.9                      T3F01560
                          DC      /9006      6 TIMES                    T3F01570
                          DC      /B002      RE-DO                      T3F01580
                    *                                                   T3F01590
                    *             SUBROUTINE EXIT                       T3F01600
                    *                                                   T3F01610
                    PD080 MDX   1 1          MOVE PT TO RETURN ADDRESS  T3F01620
                          STX   1 PD090+3    STORE EXIT ADDRESS         T3F01630
                    PD090 LDX  L1 *-*        RESTORE XR1                T3F01640
                          BSC  L  *-*        RETURN TO CALLING PROGRAM  T3F01650
                    *                                                   T3F01660
                    *                                                   T3F01670
                    *             CONSTANTS                             T3F01680
                    *                                                   T3F01690
                    PD901 LIBF    SFIO       DUMMY LIBF SFIO            T3F01700
                    PD902 DC      /0007      PRECISION MASK             T3F01710
                    PD903 EQU     PD010+2    REAL PRECISION             T3F01720
                    PD904 EQU     PD010+3    INTEGER PRECISION          T3F01730
                    PD905 DC      1          CONSTANT                   T3F01740
                    PD907 MDX     *+25       INSTRUCTION TO SKIP INIT   T3F01750
                    PD908 EQU     PD808      ADDR OF LOWER LIMIT        T3F01760
                    PD909 EQU     PD809      ADDR OF UPPER LIMIT        T3F01770
                    PD910 DC      4          CONSTANT                   T3F01780
                    $DUMP EQU     /3F        SYSTEM DUMP ENTRY POINT    T3F01790
                    PD911 DC      3          CONSTANT                   T3F01800
                    PD912 DC      PD820      ADDR OF STANDARD FORMAT    T3F01810
                    PD913 DC      PD830      ADDR OF EXTENDED FORMAT    T3F01820
                    PD914 EQU     PD010+4    PRECISION WIDTH            T3F01830
                    *                                                   T3F01840
                    *             INTEGER FORMAT DUMP                   T3F01850
                    *                                                   T3F01860
                    PD100 LD      PD904      LOAD INTEGER PRECISION     T3F01870
                          STO     PD914      STORE IN PRECISION WIDTH   T3F01880
                    *                                                   T3F01890
                          BSI     PD120      SPACE PRINTER, GET COUNT   T3F01900
                    *                                                   T3F01910
                          STO     PD921      STORE COUNT INTO LIBF      T3F01920
                          LD      PD909      PUT ADDR OF FIRST ELEMENT  T3F01930
                          STO     PD920      *OF ARRAY INTO LIBF        T3F01940
                    *                                                   T3F01950
                          LIBF    SWRT       INITIALIZE WRITE           T3F01960
                          DC      0          TRACE DEVICE               T3F01970
                          DC      PD810      INTEGER FORMAT             T3F01980
                    *                                                   T3F01990
                          LIBF    SIOAI      WRITE INTEGER ARRAY        T3F02000
                    PD920 DC      *-*        ARRAY ADDRESS              T3F02010
                    PD921 DC      *-*        ELEMENT COUNT              T3F02020
                    *                                                   T3F02030
                    PD105 LIBF    SCOMP      WRITE COMPLETE             T3F02040
                    *                                                   T3F02050
                          MDX     PD050      GET NEXT SET OF PARAMETERS T3F02060
                    *                                                   T3F02070
                    *                                                   T3F02080
                    *             REAL FORMAT DUMP                      T3F02090
                    *                                                   T3F02100
                    PD110 LD      PD903      LOAD REAL PRECISION        T3F02110
                          STO     PD914      PUT INTO PRECISION WIDTH   T3F02120
                    *                                                   T3F02130
                          BSI     PD120      SPACE PRINTER, GET COUNT   T3F02140
                    *                                                   T3F02150
                          STO     PD932      STORE COUNT IN LIBF        T3F02160
                          LD      PD909      PUT ADDR OF FIRST ELEMENT  T3F02170
                          STO     PD931      *OF ARRAY INTO LIBF        T3F02180
                    *                                                   T3F02190
                          LIBF    SWRT       INITIALIZE WRITE           T3F02200
                          DC      0          TRACE DEVICE               T3F02210
                    PD930 DC      *-*        FORMAT ADDRESS             T3F02220
                    *                                                   T3F02230
                          LIBF    SIOAF      WRITE REAL ARRAY           T3F02240
                    PD931 DC      *-*        ARRAY ADDRESS              T3F02250
                    PD932 DC      *-*        ELEMENT COUNT              T3F02260
                    *                                                   T3F02270
                          MDX     PD105      GO TO WRITE COMPLETE       T3F02280
                    *                                                   T3F02290
                    *                                                   T3F02300
                    *             SPACE PRINTER AND CALCULATE ELEMENT   T3F02310
                    *             COUNT.                                T3F02320
                    *                                                   T3F02330
                    PD120 DC      *-*        LINK ADDRESS               T3F02340
                    *                                                   T3F02350
                          LIBF    SWRT       INITIALIZE WRITE           T3F02360
                          DC      0          TRACE DEVICE               T3F02370
                          DC      PD840      SPACE FORMAT               T3F02380
                    *                                                   T3F02390
                          LIBF    SCOMP      COMPLETE SPACE             T3F02400
                    *                                                   T3F02410
                          LD      PD809      GET NUMBER OF ELEMENTS     T3F02420
                          S       PD808      *IN ARRAY BY DIVIDING      T3F02430
                          SRT     16         *ARRAY SIZE BY ELEMENT     T3F02440
                          D       PD914      *SIZE.                     T3F02450
                          A       PD905      ADD 1                      T3F02460
                          BSC  I  PD120      RETURN                     T3F02470
                    *                                                   T3F02480
                    *                                                   T3F02490
                    *             SPACE FORMAT                          T3F02500
                    *                                                   T3F02510
                    PD840 DC      /7000      SLASH                      T3F02520
                          DC      /B001      RE-DO                      T3F02530
                    *                                                   T3F02540
                    *                                                   T3F02550
                          END                                           T3F02560
