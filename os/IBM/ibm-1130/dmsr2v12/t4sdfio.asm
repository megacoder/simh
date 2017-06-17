                          HDNG    LIBF SDFIO   FORTRAN DISK FILE RD/WRT T4A00010
                    *************************************************** T4A00020
                    *STATUS-VERSION 2, MODIFICATION 7                 * T4A00030
                    *                                                 * T4A00040
                    *FUNCTION/OPERATION-                              * T4A00050
                    *   * SERVICES THE DISK I/O STATEMENTS            * T4A00060
                    *   * SUPPORTED BOTH STANDARD AND EXTENDED PREC   * T4A00070
                    *   * ROUTINE REWRITTEN IN MOD 7                    T4A00080
                    *                                                 * T4A00090
                    *ENTRY POINTS-                                    * T4A00100
                    *   LIBF      SDFIO      CALL TO INITIALIZE       * T4A00110
                    *   DC        PRECISION                           * T4A00120
                    *                                                 * T4A00130
                    *   LIBF      SDRED      CALL TO READ             * T4A00140
                    *   DC        ADDR1      ADDR OF FILE NO.         * T4A00150
                    *   DC        ADDR2      ADDR OF RCD NO.          * T4A00160
                    *                                                 * T4A00170
                    *   LIBF      SDWRT      CALL TO WRITE            * T4A00180
                    *   DC        ADDR1      ADDR OF FILE NO.         * T4A00190
                    *   DC        ADDR2      ADDR OF RCD NO.          * T4A00200
                    *                                                 * T4A00210
                    *   LIBF      SDI        CALL FOR NON-SUBSC INTGER* T4A00220
                    *   DC        ADDR       ADDRESS OF VARIABLE      * T4A00230
                    *                                                 * T4A00240
                    *   LIBF      SDF        CALL FOR NON-SUBSC REAL  * T4A00250
                    *   DC        ADDR       ADDR OF VARIABLE         * T4A00260
                    *                                                 * T4A00270
                    *   LIBF      SDIX       CALL FOR SUBSC INTEGER   * T4A00280
                    *   DC        ADDR       ADDR OF BASE VARIABLE    * T4A00290
                    *                        XR1 CONTAINS SUBSCRIPT   * T4A00300
                    *                                                 * T4A00310
                    *   LIBF      SDFX       CALL FOR SUBSC REAL      * T4A00320
                    *   DC        ADDR       ADDR OF BASE VARIABLE    * T4A00330
                    *                        XR1 CONTAINS SUBSCRIPT   * T4A00340
                    *                                                 * T4A00350
                    *   LIBF      SDAI       CALL FOR INTEGER ARRAY   * T4A00360
                    *   DC        ADDR       ADDR FIRST ELT OF ARRAY  * T4A00370
                    *   DC        COUNT      COUNT OF ELT IN ARRAY    * T4A00380
                    *                                                 * T4A00390
                    *   LIBF      SDAF       CALL FOR REAL ARRAY      * T4A00400
                    *   DC        ADDR       ADDR FIRST ELT OF ARRAY  * T4A00410
                    *   DC        COUNT      COUNT OF ELT IN ARRAY    * T4A00420
                    *                                                 * T4A00430
                    *   LIBF      SDCOM      CALL FOR I/O COMPLETE    * T4A00440
                    *                                                 * T4A00450
                    *INPUT-N/A                                        * T4A00460
                    *                                                 * T4A00470
                    *OUTPUT-N/A                                       * T4A00480
                    *                                                 * T4A00490
                    *EXTERNAL REFERENCES                              * T4A00500
                    *   SUBROUTINES                                   * T4A00510
                    *      * DZ000                                    * T4A00520
                    *      * PAUSE                                      T4A00530
                    *   COMMA/DCOM-                                   * T4A00540
                    *      * $EXIT                                    * T4A00550
                    *      * $PRET                                    * T4A00560
                    *      * $FPAD                                    * T4A00570
                    *      * $WRD1                                    * T4A00580
                    *      * $DBSY                                    * T4A00590
                    *                                                 * T4A00600
                    *EXITS-                                           * T4A00610
                    *   NORMAL-                                       * T4A00620
                    *       *RETURN TO LAST CALL PARAMETER + 1        * T4A00630
                    *   ERROR-                                        * T4A00640
                    *       *CALL EXIT IF FILE NOT FOUND              * T4A00650
                    *                                                 * T4A00660
                    *TABLES-                                          * T4A00670
                    *       DEFINE FILE ENTRY TABLE ENTRIES (7 WORDS  * T4A00680
                    *       PER FILE) IMMEDIATELY FOLLOWS CORE IMAGE  * T4A00690
                    *       HEADER.  IT IS CREATED BY THE COMPILER OR * T4A00700
                    *       ASSEMBLER AS PART OF THE MAINLINE PROGRAM.* T4A00710
                    *       IT IS MODIFIED BY THE CORE LOAD BUILDER.  * T4A00720
                    *       IT IS USED TO CONNECT LOGICAL FILE NUMBER * T4A00730
                    *       REFERENCES TO FILE LOCATIONS ON DISK.     * T4A00740
                    *                                                 * T4A00750
                    *WORK AREAS-                                      * T4A00760
                    *       29TH WORD OF CORE IMAGE HEADER IS CHECKSUM* T4A00770
                    *       OF CORE IMAGE HEADER AND FILE ENTRY TABLE.* T4A00780
                    *                                                 * T4A00790
                    *   ATTRIBUTES-N/A                                * T4A00800
                    *                                                 * T4A00810
                    *   NOTES-N/A                                     * T4A00820
                    *                                                 * T4A00830
                    *************************************************** T4A00840
                    *     EJCT        BLK REMOVED                       T4A00850
                          LIBR                                          T4A00860
                          ENT     SDFIO      INITIALIZATION             T4A00870
                          ENT     SDAF       REAL ARRAY                 T4A00880
                          ENT     SDAI       INTEGER ARRAY              T4A00890
                          ENT     SDCOM      READ/WRITE COMPLETE        T4A00900
                          ENT     SDF        UNSUBSCRIPTED REAL         T4A00910
                          ENT     SDFX       SUBSCRIPTED REAL           T4A00920
                          ENT     SDI        UNSUBSCRIPTED INTEGER      T4A00930
                          ENT     SDIX       SUBSCRIPTED INTEGER        T4A00940
                          ENT     SDRED      READ                       T4A00950
                          ENT     SDWRT      WRITE                      T4A00960
                    *                                                   T4A00970
                    $PRET EQU     /0028      TRAP FOR PREOPERATIVE I/O  T4A00980
                    *                        ERRORS                     T4A00990
                    $EXIT EQU     /0038      ENTRY PT FOR EXIT/CALL     T4A01000
                    *                        EXIT STMNT                 T4A01010
                    $WRD1 EQU     /007B      ADDR OF CORE IMAGE HEADER  T4A01020
                    $FPAD EQU     /0095      ADDR OF FILES TABLE        T4A01030
                    $DBSY EQU     /00EE      NON-ZERO IF DISKZ IS BUSY  T4A01040
                    DZ000 EQU     /00F2      DISK I/O ROUTINE           T4A01050
                    *                                                   T4A01060
                    *             CALCULATE, CHECK CHECK-SUM OF         T4A01070
                    *             CI HEADER AND DEFINE FILE TABLES.     T4A01080
                    *                                                   T4A01090
                    SI000 DC      *-*        LINK                       T4A01100
                          STX   2 SI040+1    SAVE XR2                   T4A01110
                          LDX  I2 $WRD1      SET CI HEADER POINTER      T4A01120
                          LD    2 3          FILE COUNT                 T4A01130
                          M       SI091      MULTIPLY BY 7              T4A01140
                          SLT     16                                    T4A01150
                          A     2 4          ADD CI HEADER LENGTH       T4A01160
                          STO     SI092      SAVE IN COUNTER            T4A01170
                    SI010 A     2 0          ADD WORD                   T4A01180
                          BSC     C          SKIP IF NO CARRY           T4A01190
                          A       SI900+1    ADD 1                      T4A01200
                          MDX   2 1          INCREMENT TO NEXT WORD     T4A01210
                          MDX  L  SI092,-1   SKIP IF THROUGH            T4A01220
                          MDX     SI010      CONTINUE CHECK-SUMMING     T4A01230
                    *                                                   T4A01240
                          MDX  L  SI933,0    SKIP IF INITIAL CALL       T4A01250
                          MDX     SI050      BRANCH IF CHECK            T4A01260
                    *                                                   T4A01270
                    *             INITIALIZE CHECK-SUM                  T4A01280
                    *                                                   T4A01290
                          LDX  I2 $WRD1                                 T4A01300
                          EOR     SI093      COMPLIMENT CHECK-SUM       T4A01310
                          STO   2 28         STORE IN HEADER            T4A01320
                    *                                                   T4A01330
                    SI040 LDX  L2 *-*        RESTORE XR2                T4A01340
                          BSC  I  SI000      RETURN                     T4A01350
                    *                                                   T4A01360
                    *             CHECK CHECK-SUM                       T4A01370
                    *                                                   T4A01380
                    SI050 A       SI900+1    ADD 1 TO CHECK SUM         T4A01390
                          BSC  L  SI040,+-   RETURN IF SUM IS ZERO      T4A01400
                    *                                                   T4A01410
                          LD      SI094      INDICATE ERROR F10A        T4A01420
                          MDX     SI121      GO DISPLAY ERROR           T4A01430
                    *                                                   T4A01440
                    *                                                   T4A01450
                          BSS  E  0                                     T4A01460
                    SI900 DC      0          DOUBLE WORD            (E) T4A01470
                          DC      1          *ONE                   (O) T4A01480
                    SI091 DC      7          USEFUL CONSTANT            T4A01490
                    SI092 DC      *-*        COUNTER FOR CHECK-SUM      T4A01500
                    SI093 DC      /FFFF      USEFUL CONSTANT            T4A01510
                    SI094 DC      /F10A      BAD CHECK-SUM ERROR CODE   T4A01520
                    SI095 DC      /F103      NOT INITIALIZED ERROR CODE T4A01530
                    SI910 DC      *-*        NUMBER OF FILES            T4A01540
                    SI911 DC      /7FFF      MASK TO CLEAR SIGN BIT     T4A01550
                    SI926 DC      $FPAD      ADDR OF LOGICAL DRIVE ADDR T4A01560
                    SI937 DC      SI934      BASE ADDR OF PREC TABLE    T4A01570
                    *                                                   T4A01580
                    SDF   LDS     0          REAL VARIABLE              T4A01590
                          LDX  I2 *-*        ENTRY POINT                T4A01600
                          MDX     SI060      GO TO GET COUNT            T4A01610
                    *                                                   T4A01620
                    SDAF  LDS     0          REAL ARRAY                 T4A01630
                          LDX  I2 *-*        ENTRY POINT                T4A01640
                          MDX     SI064      GO TO INTEGER ARRAY        T4A01650
                    *                                                   T4A01660
                    SDI   LDS     2          INTEGER VARIABLE           T4A01670
                          LDX  I2 *-*        ENTRY POINT                T4A01680
                    SI060 LDD     SI900      PUT ONE IN EXTENSION       T4A01690
                          MDX     SI072      GO TO COMMON ROUTINE       T4A01700
                    *                                                   T4A01710
                    SDAI  LDS     2          INTEGER ARRAY              T4A01720
                          LDX  I2 *-*        ENTRY POINT                T4A01730
                    SI064 LD    2 1          GET COUNT OF ELEMENTS IN   T4A01740
                          RTE     16         *ARRAY INTO EXTENSION      T4A01750
                    SI902 EQU     *-1        INSTRUCTION CONSTANT       T4A01760
                          LD    2 0          LOAD ADDR OF 1ST ELT       T4A01770
                          MDX   2 1          UP XR2 FOR EXIT ADDR       T4A01780
                          STS     SI932      SAVE STATUS (REAL/INTEGER) T4A01790
                          MDX     SI074      GO TO COMMON ROUTINE       T4A01800
                    *                                                   T4A01810
                    SDFX  LDS     0          REAL SUBSCRIPTED VARIABLE  T4A01820
                          LDX  I2 *-*        ENTRY POINT                T4A01830
                          MDX     SI070      GO TO INTEGER SUBSCRIPTED  T4A01840
                    *                                                   T4A01850
                    SDIX  LDS     2          INTEGER SUBSCRIPTED VAR    T4A01860
                          LDX  I2 *-*        ENTRY POINT                T4A01870
                    SI070 STX   1 SI930      GET DISPLACEMENT FROM BASE T4A01880
                          LDD     SI930      ADDR (CONTENTS OF XR1)     T4A01890
                    SI072 STS     SI932      SAVE REAL/INTEGER INDR     T4A01900
                          A     2 0          ADD BASE ADDR TO GET       T4A01910
                    SI074 STD     SI961      ADDR OF ELEMENT            T4A01920
                          LD      SI932      CALCULATE ADDR             T4A01930
                          A       SI937      *OF PRECISION              T4A01940
                          STO     *+1        *CONSTANT                  T4A01950
                          LD   L  *-*        GET PRECISION              T4A01960
                          STO  L  SI325+1    SAVE PRECISION             T4A01970
                          A       SI961      INCREMENT USER VARIABLE    T4A01980
                          S       SI900+1    *ADDR BY                   T4A01990
                          STO     SI961      *PRECISION - 1             T4A02000
                          MDX   2 1          UP XR2 FOR RETURN          T4A02010
                          BSC  L  SI200      GET SET UP FOR RETURN      T4A02020
                    *                                                   T4A02030
                    SDRED LDS     3          SET INDR TO READ           T4A02040
                          LDX  I2 *-*        ENTRY POINT                T4A02050
                          LD      SI902      GET RTE 16 INSTRUCTION     T4A02060
                          MDX     SI080      GO TO COMMON ROUTINE       T4A02070
                    *                                                   T4A02080
                    SDWRT LDS     1          SET DISK WRITE INDICATOR   T4A02090
                          LDX  I2 *-*        SET PT AT PARAMATERS       T4A02100
                          LD      SI920      GET NOP INSTRUCTION        T4A02110
                    SI080 STO  L  SI310      MODIFY INSTRUCTION         T4A02120
                          STO  L  SI352      MODIFY INSTRUCTION         T4A02130
                          STS     SI933      SAVE INDR                  T4A02140
                          STX   2 SI100+1    SAVE XR2                   T4A02150
                          STX   1 SI220+1    SAVE XR1                   T4A02160
                    *                                                   T4A02170
                          SLA     16        CLEAR SWITCH FOR            T4A02180
                          STO     SI099     *RCD TOO SMALL              T4A02190
                          LD      SDFIO      HAS SDFIO BEEN INITIALIZED T4A02200
                          BSC  L  SI100,+-   BRANCH IF YES              T4A02210
                    *                                                   T4A02220
                          LD      SDFIO+2    IS SDFIO REFERENCED BY A   T4A02230
                          BSC  L  SI090,+-   LIBF, BR IF NOT            T4A02240
                    *                                                   T4A02250
                          LD   I  SDFIO+2    WAS IT EVER INITIALIZED    T4A02260
                          BSC  L  SDFIO,Z    IF YES, INITIALIZE AGAIN   T4A02270
                    *                                                   T4A02280
                    SI090 LD      SI095      LOAD ERROR CODE F103       T4A02290
                          MDX     SI150      GO TO ERROR ROUTINE        T4A02300
                    *                                                   T4A02310
                    SI100 LDX  L2 *-*        RESTORE XR2                T4A02320
                          LDX   1 0          SET COUNT                  T4A02330
                          STX   1 SI962      TO ZERO                    T4A02340
                    *                                                   T4A02350
                          BSI     SI000      CHECK CHECK-SUM            T4A02360
                    *                                                   T4A02370
                          LDX  I1 $WRD1      SET HEADER POINTER         T4A02380
                          LD    1 3          LOAD FILE COUNT            T4A02390
                          STO     SI910      SAVE CNT                   T4A02400
                          BSC  L  SI120,+    ERROR IF CNT NOT POS       T4A02410
                          LD    1 4          GET CORE-IMAGE HDR LENGTH  T4A02420
                          STO     *+1                                   T4A02430
                          MDX  L1 *-*        INCREMENT PAST HEADER      T4A02440
                    *                                                   T4A02450
                    SI110 LD   I2 0          GET FILE NO. FROM LIBF     T4A02460
                          EOR   1 0          IS IT FILE AT PT           T4A02470
                    SI096 EQU     *-1        FILE NOT DEFINED ERR F100  T4A02480
                          BSC  L  SI130,+-   BRANCH IF YES              T4A02490
                          MDX   1 7          MOVE PT TO NEXT TBL ENTRY  T4A02500
                          MDX  L  SI910,-1   DECREMENT FILE COUNT       T4A02510
                          MDX     SI110      CONTINUE CHECK             T4A02520
                    SI120 LD      SI096      LOAD ERROR CODE F100       T4A02530
                    SI121 MDX     SI150      GO TO ERROR ROUTINE        T4A02540
                    *                                                   T4A02550
                    SI130 MDX   2 2          SET XR2 FOR RETURN         T4A02560
                          STX   2 SI220+3    TO MAINLINE PROGRAM        T4A02570
                          LD    1 4          GET SECTOR START ADDR      T4A02580
                          BSC  L  SI140,-    IS FILE IN WORKING STORAGE T4A02590
                          AND     SI911      YES, CLEAR SIGN BIT        T4A02600
                          STO     SI923      SAVE ADDR                  T4A02610
                          SRA     12         GET PROPER FILE PROTECT    T4A02620
                          A       SI926      ADDR BY ADDING IDX (FROM   T4A02630
                          STO     *+1        SRA INSTR) TO ADDR OF 1ST  T4A02640
                          LD   L  *-*        ITEM IN $FPAD              T4A02650
                          AND     SI925      GET ADDR OF RCD BY ADDING  T4A02660
                          A       SI923      FILE PROTECT ADDR TO       T4A02670
                    SI140 STO  L  SI952      SECTOR START ADDR          T4A02680
                          LD   I2 -1         GET RECORD NO. FROM LIBF   T4A02690
                          BSC  L  SI149,+    BRANCH IF NO. INVALID      T4A02700
                          S     1 1          SUBTRACT NO. RCDS IN FILE  T4A02710
                          BSC  L  SI225,+    BRANCH IF VALID            T4A02720
                    SI149 LD      SI097      LOAD ERROR CODE F101       T4A02730
                    SI150 STO     SI923     STORE TEMPORARY             T4A02740
                          LIBF    PAUSE     GO DISPLAY                  T4A02750
                          DC      SI923     *ERROR CODE                 T4A02760
                          LDX     $EXIT      TERMINATE EXECUTION        T4A02770
                    SI155 LD      SI098     SET UP ERROR /F107          T4A02780
                          MDX     SI150     GO DISPLAY                  T4A02790
                    SI156 LD      SI928     LD /F105                    T4A02800
                          MDX     SI150     BR TO DISP ERROR            T4A02810
                    *                                                   T4A02820
                    SI098 DC      /F107     ERROR CODE                  T4A02830
                    SI097 DC      /F101      INVALID RCD NO. ERROR CODE T4A02840
                    SI920 NOP                INSTRUCTION CONSTANT       T4A02850
                          BSS  E  0                                     T4A02860
                    SI930 DC      *-*        USED FOR SAVING ADDR   (E) T4A02870
                          DC      1          *OF ELEMENT IN ARRAY   (O) T4A02880
                    SI932 DC      *-*        REAL/INTEGER INDICATOR     T4A02890
                    SI933 DC      *-*        READ/WRITE INDICATOR       T4A02900
                    SI934 DC      *-*        REAL PRECISION             T4A02910
                    SI923 DC      *-*        SECTOR START ADDR          T4A02920
                          DC      *-*        INTEGER PREC (SI934+2)     T4A02930
                    SI925 DC      /0FFF      MASK FOR BUFFER ADDR       T4A02940
                    *                                                   T4A02950
                    SDFIO SLT     32         INITIAL CALL TO FIO        T4A02960
                          LDX  I2 *-*        ENTRY POINT                T4A02970
                    SI961 EQU     SDFIO+4    ADDRESS OF ITEM FOR I/O(E) T4A02980
                    SI962 EQU     SDFIO+5    NO. OF ITEMS FOR I/O   (O) T4A02990
                    SI963 EQU     SDFIO+16   READ NEEDED INDICATOR      T4A03000
                          STO     SDFIO      INDICATE SDFIO INITIALIZED T4A03010
                          MDX   2 1          MOVE XR2 TO PT AT CALLS    T4A03020
                          LD    2 -1         LOAD PRECISION WORD        T4A03030
                          SLA     11         PUT IN PRECISION (STANDARD T4A03040
                          SRT     12         OR EXTENDED) FOR           T4A03050
                          STO     SI934      REAL NUMBERS AND           T4A03060
                          STO     SI934+2    INTEGERS                   T4A03070
                          SLT     1          ONE WORD INTEGERS CALLED   T4A03080
                          BSC     E          SKIP IF YES                T4A03090
                          MDX     *+2        KEEP SAME PRECISION IF NOT T4A03100
                          LD      SI930+1    SET PRECISION FOR INTEGERS T4A03110
                          STO     SI934+2    *TO ONE WORD               T4A03120
                          LD      SI929      SET UP RESTART             T4A03130
                          STO   2 -2         PROCEDURE                  T4A03140
                          LD      SI933      HAS RD/WRT INDR BEEN SET   T4A03150
                          BSC  L  SI100,Z    RETURN TO SDRED IF RE-INIT T4A03160
                    *                                                   T4A03170
                          BSI  L  SI000      CALCULATE CHECK-SUM        T4A03180
                    *                                                   T4A03190
                          BSC  L2 0          RETURN TO MAINLINE         T4A03200
                    *                                                   T4A03210
                    SDCOM STX   1 SI220+1    WRITE COMPLETE             T4A03220
                          LDX  I2 *-*        ENTRY POINT                T4A03230
                          STX   2 SI220+3    SET XR2 FOR RETURN         T4A03240
                          MDX     SI355      CHECK IF DISK WRITE NEEDED T4A03250
                    *                                                   T4A03260
                    SI927 DC      1600      SECTOR COUNT OF DISK        T4A03270
                    SI928 DC      /F105     ERROR CODE FOR PREC         T4A03280
                    *                       *EXCEEDS RECORD             T4A03290
                    SI929 DC      /7001                                 T4A03300
                    SI099 DC      *-*       SW FOR RCD TOO SMALL        T4A03310
                    SI200 STX   1 SI220+1    SAVE XR1 FOR RETURN        T4A03320
                          STX   2 SI220+3    SAVE XR2 FOR RETURN        T4A03330
                    SI210 LD      SI962      TEST ARRAY COUNT           T4A03340
                          BSC  L  SI300,Z    CONTINUE IF NON-ZERO       T4A03350
                    SI220 LDX  L1 *-*        RETURN TO MAINLINE IF ZERO T4A03360
                          BSC  L  *-*        (ALL ELTS PROCESSED)       T4A03370
                    *                                                   T4A03380
                    SI225 A     1 1          RESTORE RECORD NO.         T4A03390
                          A    L  SI945      INCREASE NO. BY ONE        T4A03400
                          STO  I1 3          STORE IN ASSOCIATED VAR    T4A03410
                          S       SI945      RESTORE RECORD NO.         T4A03420
                          S       SI945      SUBTRACT 1 MORE            T4A03430
                          SRT     16         DIVIDE RECORD NUMBER-1 BY  T4A03440
                          D     1 5          *RECORDS PER SECTOR        T4A03450
                          A    L  SI952      INCREMENT SECTOR ADDR IN   T4A03460
                          STO  L  SI952      *I/O BUFFER BY QUOTIENT    T4A03470
                          RTE     16         MULTIPLY REMAINDER BY      T4A03480
                          M     1 2          *NUMBER OF WORDS PER RCD   T4A03490
                          RTE     16         MOVE INTO ACCUMULATOR      T4A03500
                          A     1 2          ADD WORDS/RECORD           T4A03510
                          STO     SI942      DISP FROM END OF BUFFER    T4A03520
                          STX   1 SI350+1    SAVE FILE TABLE POINTER    T4A03530
                          LD      SI922      LOAD END OF BUFFER ADDR    T4A03540
                          S       SI942      SUBTRACT DISPLACEMENT      T4A03550
                    SI240 STO     SI942      TO GET BUFFER BASE POINTER T4A03560
                          LD    1 2          LOAD RECORD LENGTH         T4A03570
                          STO     SI315+1    SAVE                       T4A03580
                    DIO   SLA     16         CLEAR                      T4A03590
                          STO     SI963      *READ NEEDED INDICATOR     T4A03600
                    *                                                   T4A03610
                          LD      SI952      IS THIS THE SAME SECTOR    T4A03620
                          S       SI948      *USED ON PREVIOUS RD/WRT   T4A03630
                          BSC  L  SI252,+-   BRANCH IF YES              T4A03640
                    *                                                   T4A03650
                          SRA     16         SET PARAMETER FOR READ     T4A03660
                    SI250 STO     SI940      SAVE READ/WRITE PARAMETER  T4A03670
                          LD      SI952     LD SCTR ADDR                T4A03680
                          AND     SI925     REMOVE DR CODE              T4A03690
                          S       SI927     COMPARE WITH FULL DISK      T4A03700
                          BSC  L  SI155,-   ERROR F107 IF NOT LESS      T4A03710
                          LDD     SI940      LOAD DISK I/O PARAMETERS   T4A03720
                          BSI  L  DZ000      GO TO DISK READ/WRITE      T4A03730
                          MDX  L  $DBSY,0    SKIP IF DISK READY         T4A03740
                          MDX     *-3        LOOP IF DISK BUSY          T4A03750
                    SI252 LD      SI952      SAVE CURRENT SECTOR FOR    T4A03760
                          STO     SI948      *NEXT SECTOR COMPARE       T4A03770
                    *                                                   T4A03780
                    SI255 LD      SI963      TEST READ NEEDED INDICATOR T4A03790
                          BSC  L  SI210,+-   BRANCH IF OFF              T4A03800
                          MDX  L  SI952,1    INCREMENT SECTOR ADDR      T4A03810
                    SI964 EQU     *-1        ADDR OF SCTR ADDR OF BFR   T4A03820
                          MDX     SI360      GO CHECK RECORD NO.        T4A03830
                    *                                                   T4A03840
                    SI300 LD      SI944      GET MDX 2 0 CONSTANT       T4A03850
                          S       SI325+1    SUBTRACT PRECISION         T4A03860
                          STO     SI320      STORE AS MDX 1 -PRECISION  T4A03870
                    *                                                   T4A03880
                          LD      SI961      GET HIGH ADDR USER'S ITEM  T4A03890
                          RTE     16         *IN EXT                    T4A03900
                          LD      SI942      GET I/O BUFFER BASE POINTR T4A03910
                          A       SI315+1    ADD RCD LENGTH LEFT        T4A03920
                    SI310 RTE     16         RTE 16 / NOP   IF RD/WRT   T4A03930
                          STD     SI946      SAVE AS 'TO' AND 'FROM'    T4A03940
                    *                                                   T4A03950
                    SI315 LDX  L1 *-*        LOAD XR1 RCD LENGTH LEFT   T4A03960
                          MDX   1 1          INCREMENT BY 1             T4A03970
                    *                                                   T4A03980
                    SI320 MDX   1 *-*        -1,-2, OR -3 (-PRECISION)  T4A03990
                    *                        *SKIP IF WON'T FIT IN RCD  T4A04000
                          MDX     SI325      BR RECORD NOT FULL         T4A04010
                          LD      SI099     TEST FOR RCD LESS           T4A04020
                          BSC     Z         *PRECISION                  T4A04030
                          MDX     SI156     BR TO DISP ERROR            T4A04040
                          LD      SI945     MAKE SW SI099               T4A04050
                          STO     SI099     *NON-ZERO                   T4A04060
                          MDX     SI350      BR RECORD FULL             T4A04070
                    *                                                   T4A04080
                    SI325 LDX  L2 *-*        LOAD XR2 WITH PRECISION    T4A04090
                    *                                                   T4A04100
                    SI330 LD   I  SI947      GET 'FROM' WORD            T4A04110
                    *                                                   T4A04120
                          STO  I  SI946      STORE IN 'TO' WORD         T4A04130
                    *                                                   T4A04140
                          SLA     16        CLEAR SWITCH FOR            T4A04150
                          STO     SI099     *RCD TOO SMALL              T4A04160
                          LDD     SI946      DECREMENT 'FROM' AND       T4A04170
                          SD      SI945      *'TO' ADDRESSES            T4A04180
                          STD     SI946      *BY 1                      T4A04190
                    *                                                   T4A04200
                          MDX   2 -1         DECR ELEMENT PREC COUNT    T4A04210
                          MDX     SI330      BR, LOOP FOR WORDS/ELEMENT T4A04220
                    *                                                   T4A04230
                          MDX  L0 SI962,-1   DECR VARIABLE COUNT BY 1   T4A04240
                          MDX     SI320      BR, LOOP FOR VARIABLES     T4A04250
                    *                                                   T4A04260
                          MDX   1 -1         ADJUST RECORD LENGTH LEFT  T4A04270
                          NOP                MAY SKIP                   T4A04280
                    *                                                   T4A04290
                          STX   1 SI315+1    SAVE NEW RCD LENGTH LEFT   T4A04300
                          MDX     SI220      RETURN FROM THIS LIBF      T4A04310
                    *                                                   T4A04320
                    SI350 LDX  L1 *-*        RESTORE XR1 FILE TABLE PTR T4A04330
                          LDD     SI946      GET NEXT USER ADDRESS      T4A04340
                    SI352 RTE     16         RTE 16 / NOP   IF RD/WRT   T4A04350
                          RTE     16         EXCHANGE ACC & EXT         T4A04360
                          STO  L  SI961      SAVE NEXT USER ADDRESS     T4A04370
                          LD    1 2          SET NO. WORDS REMAINING    T4A04380
                          STO     SI315+1    *TO WORDS/RECORD           T4A04390
                          LD      SI942      DECREMENT I/O BUFFER       T4A04400
                          S     1 2          *BASE ADDR OF RECORD       T4A04410
                          STO     SI942      *BY WORDS/RECORD           T4A04420
                          S       SI964      BR IF ROOM IN BUFFER       T4A04430
                          BSC  L  SI360,-    *FOR ANOTHER RECORD        T4A04440
                          STX  L0 SI963      SET READ NEEDED INDR ON    T4A04450
                    *                                                   T4A04460
                    SI355 LDX  I2 SI933      LOAD XR2 WITH RD/WRT INDR  T4A04470
                          MDX   2 -2         SKIP IF WRITE              T4A04480
                          MDX     SI255      DISK OP NOT NEEDED FOR RD  T4A04490
                          LD      SI945      LOAD WRITE PARAMETER       T4A04500
                          MDX     SI250      GO WRITE UPDATED BUFFER    T4A04510
                    *                                                   T4A04520
                    SI360 LD   I1 3          LOAD NO. OF RCD IN FILE    T4A04530
                          S     1 1          SUBTRACT MAX NO. OF RECDS  T4A04540
                          BSC  L  SI149,-Z   ERROR IF ATTEMPT TO USE    T4A04550
                    *                        MORE RCDS THAN SPECIFIED   T4A04560
                          A     1 1          RESTORE REC NO.            T4A04570
                          A       SI945      ADD ONE                    T4A04580
                          STO  I1 3          STORE ASSOCIATED VARIABLE  T4A04590
                    *                                                   T4A04600
                          LD   L  SI963     IS READ NEEDED INDR ON      T4A04610
                          BSC  L  SI300,+-   BR TO DO NEXT RCD IF OFF   T4A04620
                    *                                                   T4A04630
                          LD      SI922      SET BASE ADDR TO FIRST     T4A04640
                          S     1 2          *RECORD IN BUFFER          T4A04650
                          MDX     SI240      BR TO READ NEXT SECTOR     T4A04660
                    *                                                   T4A04670
                          BSS  E  0                                     T4A04680
                    SI945 DC      1          ONE                    (E) T4A04690
                          DC      1          ONE                    (O) T4A04700
                    SI940 DC      *-*        READ/WRITE CODE FOR I/O(E) T4A04710
                          DC      SI952-1    BUFFER ADDR WORD       (O) T4A04720
                    SI942 DC      *-*        BUFFER BASE ADDR OF RCD    T4A04730
                    SI922 DC      SI952+320  LAST WORD OF I/O BUFFER    T4A04740
                    SI946 DC      *-*        'TO' ADDRESS           (E) T4A04750
                    SI947 DC      *-*        'FROM' ADDRESS         (O) T4A04760
                    SI944 MDX   2 0          CONSTANT, BORROW DURING    T4A04770
                    *                        *SUBTRACT CHANGES XR2 TO   T4A04780
                    *                        *XR1                       T4A04790
                    *                                                   T4A04800
                    SI948 DC      *-*        PREVIOUS SECTOR USED       T4A04810
                          DC      320        BUFFER WD COUNT FOR I/O(E) T4A04820
                    SI952 DC      *-*        DISK ADDR FOR I/O      (O) T4A04830
                          BSS     320        BUFFER FOR I/O             T4A04840
                          END                                           T4A04850
