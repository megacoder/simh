                          HDNG    ADRWS-MAINLINE                        U6A00010
                    *************************************************** U6A00020
                    *STATUS-VERSION 2, MODIFICATION 0                 * U6A00030
                    *                                                 * U6A00040
                    *FUNCTION/OPERATION-                              * U6A00050
                    *   * WRITES SECTOR ADDRESSES ON EACH WORKING     * U6A00060
                    *     STORAGE SECTOR.                             * U6A00070
                    *   * PUTS KNOWN DATA IN WORKING STORAGE.         * U6A00080
                    *                                                 * U6A00090
                    *ENTRY POINTS-                                    * U6A00100
                    *   WA000-EXECUTION OF ADRWS BEGINS HERE AS A     * U6A00110
                    *         RESULT OF A CALL LINK FROM DUP.         * U6A00120
                    *                                                 * U6A00130
                    *INPUT-                                           * U6A00140
                    *   * DRIVE CODE OF WORKING STORAGE TO BE         * U6A00150
                    *     ALTERED IS CONTAINED IN #TODR (DCOM OF      * U6A00160
                    *     MASTER CARTRIDGE).                          * U6A00170
                    *   * STARTING SECTOR ADDRESS OF WORKING STORAGE  * U6A00180
                    *     TO BE ALTERED IS CONTAINED IN THE $FPAD     * U6A00190
                    *     QUINTUPLE IN COMMA.                         * U6A00200
                    *                                                 * U6A00210
                    *OUTPUT-                                          * U6A00220
                    *   * SECTOR ADDRESS IS WRITTEN ON EACH SECTOR    * U6A00230
                    *     OF WORKING STORAGE.                         * U6A00240
                    *   * THE SECTOR ADDRESS (INCLUDING LOGICAL       * U6A00250
                    *     DRIVE NO.) IS RECORDED IN THE FIRST         * U6A00260
                    *     240 DATA WORDS OF EACH SECTOR. THE          * U6A00270
                    *     REMAINING EIGHTY DATA WORDS CONTAIN ZEROS.  * U6A00280
                    *                                                 * U6A00290
                    *EXTERNAL REFERENCES-                             * U6A00300
                    *   SUBROUTINES-                                  * U6A00310
                    *      * DISKN                                    * U6A00320
                    *      * FSLEN                                    * U6A00330
                    *      * FSYSU                                    * U6A00340
                    *      * SYSTEM PRINTER DEVICE SUBROUTINE         * U6A00350
                    *   COMMA/DCOM                                    * U6A00360
                    *      * $CTSW                                    * U6A00370
                    *      * $FPAD                                    * U6A00380
                    *      * #CIDN                                    * U6A00390
                    *      * #DCSW                                    * U6A00400
                    *      * #TODR                                    * U6A00410
                    *                                                 * U6A00420
                    *EXITS-                                           * U6A00430
                    *   NORMAL-                                       * U6A00440
                    *      * CALL EXIT TO RETURN TO SUPERVISOR        * U6A00450
                    *        CONTROL IF ADRWS WAS NOT ENTERED         * U6A00460
                    *        AS A CALL LINK FROM DUP.                 * U6A00470
                    *      * MOVE A DUP MONITOR CONTROL RECORD TO     * U6A00480
                    *        THE SUPERVISOR CONTROL RECORD BUFFER     * U6A00490
                    *        AND SET $CTSW NEGATIVE BEFORE CALL EXIT  * U6A00500
                    *        IF ADRWS WAS ENTERED FROM DUP.           * U6A00510
                    *   ERROR-N/A                                     * U6A00520
                    *                                                 * U6A00530
                    *TABLES/WORK AREAS-                               * U6A00540
                    *   * DCAR2 IS A 60 WORD DISK BUFFER INTO WHICH   * U6A00550
                    *     THE FIRST 60 WORDS OF DCOM FROM THE MASTER  * U6A00560
                    *     CARTRIDGE ARE READ.                         * U6A00570
                    *   * IOAR1 IS A 4 SECTOR BUFFER USED TO WRITE    * U6A00580
                    *     THE WORKING STORAGE SECTORS ON THE DRIVE    * U6A00590
                    *     TO BE ALTERED.                              * U6A00600
                    *   * MESAG IS A 20 WORD PRINT BUFFER WHICH       * U6A00610
                    *     CONTAINS THE ADRWS TERMINATION MESSAGE.     * U6A00620
                    *   * SRBUF IS THE 80 WORD SUPERVISOR BUFFER      * U6A00630
                    *     TO WHICH A DUP MONITOR CONTROL RECORD IS    * U6A00640
                    *     MOVED BEFORE RETURNING TO DUP BY MEANS      * U6A00650
                    *     OF A CALL EXIT.                             * U6A00660
                    *                                                 * U6A00670
                    *ATTRIBUTES-N/A                                   * U6A00680
                    *                                                 * U6A00690
                    *NOTES-                                           * U6A00700
                    *   * ADRWS MAY BE EXECUTED BY THE USER BY A      * U6A00710
                    *     CALL LINK, OR A // XEQ ADRWS AS LONG AS     * U6A00720
                    *     THE DRIVE CODE OF THE DRIVE TO BE ALTERED   * U6A00730
                    *     IS CONTAINED IN #TODR OF DCOM ON THE        * U6A00740
                    *     MASTER CARTRIDGE (#TODR MUST BE 0000-0004). * U6A00750
                    *     NOTE HOWEVER, THAT ADRWS REQUIRES DISKN.    * U6A00760
                    *   * A TERMINATION MESSAGE IS PRINTED BY ADRWS   * U6A00770
                    *     WHICH IS-                                   * U6A00780
                    *                                                 * U6A00790
                    *         CART ID XXXX  DB ADDR XXXX  DB CNT XXXX * U6A00800
                    *************************************************** U6A00810
                          HDNG    ADRWS-MAINLINE                        U6A00820
                    $PST2 EQU     /85                                   U6A00830
                    DKERR EQU     $PST2                                 U6A00840
                    *                                                   U6A00850
                    *   READ THE DCOM SECTOR FROM DISK                  U6A00860
                    *                                                   U6A00870
                    WA000 LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A00880
                          DC      /1000     READ FUNCTION               U6A00890
                          DC      DCAR2     ADDRESS OF IOAR HEADER      U6A00900
                          DC      DKERR     ADDRESS OF ERROR ROUTINE    U6A00910
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A00920
                          DC      /0000     TEST FUNCTION               U6A00930
                          DC      DCAR2     ADDRESS OF IOAR HEADER      U6A00940
                          MDX     *-4       LOOP IF READ NOT COMPLETE   U6A00950
                    *                                                   U6A00960
                    *   INITIALIZE PROGRAM                              U6A00970
                    *                                                   U6A00980
                          LDX  L2 X         LOAD VECTOR POINTER         U6A00990
                    *                                                   U6A01000
                    *   FIND SECTOR ADDRESS BEFORE WORKING STORAGE      U6A01010
                    *                                                   U6A01020
                          LD    2 #TODR-X                               U6A01030
                          BSC  L  WA050,-Z  BRANCH IF 'TO' DRIVE 1-4    U6A01040
                          LDX   1 0         XR1 = 0 FOR DRIVE 0         U6A01050
                          MDX     WA060     BRANCH AROUND LDX INST      U6A01060
                    WA050 LDX  I1 #TODR     XR1 = DRIVE CODE, 1-4       U6A01070
                    WA060 LD   L1 $FPAD     'TO' DR FILE PROTECT ADDR   U6A01080
                          S     2 H0001-X   DECREMENT ADDRESS BY 1      U6A01090
                          STO  L  IOAR1+1   STORE WS - 1 ADDRESS        U6A01100
                          STX  L1 IOAR1     STORE DRIVE CODE            U6A01110
                          LD   L  IOAR1     DRIVE CODE (000D)           U6A01120
                          SLA     8         (0D00)                      U6A01130
                          AND   2 H0F00-X                               U6A01140
                          STO     WA065                                 U6A01150
                          STO     WA088                                 U6A01160
                          STO     WA170     INITIALIZE TEST FUNCTIONS   U6A01170
                          LDX  L1 320       LOAD 1 SECTOR WORD COUNT    U6A01180
                          STX  L1 IOAR1     PLACE WORD COUNT            U6A01190
                    *                                                   U6A01200
                    *   READ THE SECTOR BEFORE THE FIRST SECTOR OF      U6A01210
                    *   WORKING STORAGE                                 U6A01220
                    *                                                   U6A01230
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A01240
                          DC      /1000     READ FUNCTION               U6A01250
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A01260
                          DC      DKERR     ADDRESS OF ERROR ROUTINE    U6A01270
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A01280
                    WA065 DC      /0000     TEST FUNCTION               U6A01290
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A01300
                          MDX     *-4       BRANCH IF NOT DONE          U6A01310
                          HDNG    ADRWS-MAINLINE                        U6A01320
                    *                                                   U6A01330
                    *   INCREMENT SECTOR NUMBER TO FIRST ONE OF         U6A01340
                    *   WORKING STORAGE                                 U6A01350
                    *                                                   U6A01360
                          MDX  L  IOAR1+1,1 ADD 1 TO SECTOR NUMBER      U6A01370
                    *                                                   U6A01380
                    *   ARE WE AT THE BEGINNING OF A SECTOR             U6A01390
                    *                                                   U6A01400
                    WA080 LD   L  IOAR1+1   LOAD SECTOR NUMBER          U6A01410
                          SLA     13        SAVE SECTOR NUMBER ON TRACK U6A01420
                          BSC  L  WA090,Z   BRANCH IF NOT NEW CYLINDER  U6A01430
                    *                                                   U6A01440
                    *   SEEK ONE CYLINDER TOWARDS THE CENTER OF THE     U6A01450
                    *   DISK                                            U6A01460
                    *                                                   U6A01470
                    WA085 LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A01480
                          DC      /5010     SEEK 1 CYLINDER FUNCTION    U6A01490
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A01500
                          DC      DKERR     ADDRESS OF ERROR ROUTINE    U6A01510
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A01520
                    WA088 DC      /0000     TEST FUNCTION               U6A01530
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A01540
                          MDX     *-4       BRANCH IF NOT DONE          U6A01550
                    *                                                   U6A01560
                    *   CALCULATE THE PARAMETERS NEEDED TO FORMAT THE   U6A01570
                    *   AREA TO BE WRITTEN                              U6A01580
                    *                                                   U6A01590
                    WA090 SLA     16        CLEAR ACCUMULATOR           U6A01600
                          S    L  IOAR1+1                               U6A01610
                          AND   2 H0003-X   SAVE NUMBER OF SECTORS      U6A01620
                          BSC     +-        SKIP IF NOT ZERO            U6A01630
                          LD    2 H0004-X   SET HALF TRACK              U6A01640
                          STO   2 NOSC1-X   SAVE NUMBER OF SECTORS      U6A01650
                    *                                                   U6A01660
                          M     2 H0140-X   CALCULATE WORD COUNT        U6A01670
                          RTE     16                                    U6A01680
                          STO  L  IOAR1     STORE WORD COUNT            U6A01690
                    *                                                   U6A01700
                    *   CLEAR THE AREA TO ZERO                          U6A01710
                    *                                                   U6A01720
                          LDX  I1 IOAR1     LOAD WORD COUNT             U6A01730
                          SLA     16        CLEAR ACCUMULATOR           U6A01740
                          STO  L1 IOAR1+1   STORE A ZERO                U6A01750
                          MDX   1 -1        DECREMENT WORD COUNT        U6A01760
                          MDX     *-4       BRANCH IF WORD COUNT NOT 0  U6A01770
                    *                                                   U6A01780
                    *   FORMAT THE AREA TO BE WRITTEN ON THE DISK       U6A01790
                    *                                                   U6A01800
                          LD   L  IOAR1+1                               U6A01810
                          STO   2 SCNN1-X   SAVE NUMBER FOR SECTOR      U6A01820
                          LD    2 SVAD1-X                               U6A01830
                          STO     WA150+1   INITIALIZE STORE ADDRESS    U6A01840
                    WA120 LD      WA150+1                               U6A01850
                          A     2 H0140-X                               U6A01860
                          STO     WA150+1   INCREMENT STORE ADDRESS     U6A01870
                          LD    2 SCNN1-X                               U6A01880
                          LDX  L1 240       LOAD ENTRIES PER SECTOR     U6A01890
                    WA150 STO  L1 *-*       STORE AN ENTRY              U6A01900
                          MDX   1 -1        DECREMENT NUMBER OF ENTRIES U6A01910
                          MDX     *-4       BRANCH IF NOT ZERO          U6A01920
                          A     2 H0001-X   INCREMENT STORE VALUE       U6A01930
                          STO   2 SCNN1-X   SAVE OLD SECTOR NUMBER      U6A01940
                          MDX  L  NOSC1,-1  DECREMENT NUMBER OF SECTORS U6A01950
                          MDX     WA120     BRANCH IF NOT ZERO          U6A01960
                    *                                                   U6A01970
                    *   WRITE OUT THE AREA ON THE DISK                  U6A01980
                    *                                                   U6A01990
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A02000
                          DC      /4000     WRITE IMMEDIATE             U6A02010
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A02020
                          LIBF    DISKN     BRANCH TO EXECUTE DISKN     U6A02030
                    WA170 DC      /0000     TEST FUNCTION               U6A02040
                          DC      IOAR1     ADDRESS OF IOAR HEADER      U6A02050
                          MDX     *-4       BRANCH IF NOT DONE          U6A02060
                    *                                                   U6A02070
                    *   TEST FOR LAST SECTOR                            U6A02080
                    *                                                   U6A02090
                          LD   L  IOAR1+1                               U6A02100
                          AND   2 H0FFF-X   MASK OUT DRIVE CODE         U6A02110
                          S     2 ENADR-X                               U6A02120
                          A     2 H0004-X                               U6A02130
                          BSC  L  WA200,+-  BRANCH IF SECTORS WRITTEN   U6A02140
                    *                                                   U6A02150
                    *   INCREMENT SECTOR TO NEXT CYLINDER               U6A02160
                    *                                                   U6A02170
                          LD   L  IOAR1+1   LOAD SECTOR NUMBER          U6A02180
                          A     2 H0004-X   INCREMENT TO NEXT HALF      U6A02190
                          AND   2 HFFFC-X   REMOVE ODD SECTORS          U6A02200
                          STO  L  IOAR1+1   STORE NEW SECTOR ADDRESS    U6A02210
                          MDX     WA080     BRANCH TO CONTINUE          U6A02220
                    *                                                   U6A02230
                    *   FORMAT THE EXITING MESSAGE                      U6A02240
                    *                                                   U6A02250
                    WA200 LD    2 #TODR-X                               U6A02260
                          BSC  L  WA205,-Z  BR IF 'TO' DR SPECIFIED     U6A02270
                    *                                                 * U6A02280
                    *   USE DRIVE ZERO AS DEFAULT CONDITION           * U6A02290
                    *                                                 * U6A02300
                          LDX   1 0         DRIVE CODE = ZERO           U6A02310
                          MDX     WA210     BRANCH AROUND LDX INST      U6A02320
                    *                                                 * U6A02330
                    WA205 LDX  I1 #TODR     XR1 = DRIVE CODE            U6A02340
                    WA210 LD   L1 #CIDN     LOAD CARTRIDGE ID           U6A02350
                          BSI     BINEB     FORMAT CART ID NUMBER       U6A02360
                          STD     MESAG+5   PLACE CART ID               U6A02370
                          LD   L1 $FPAD     LOAD FILE PROTECT ADDRESS   U6A02380
                          SLA     4         CONVERT TO DB               U6A02390
                          BSI     BINEB     FORMAT DB ADDRESS           U6A02400
                          STO     MESAG+12  PLACE DB ADDRESS            U6A02410
                          RTE     16                                    U6A02420
                          STO     MESAG+13                              U6A02430
                          LD    2 ENADR-X                               U6A02440
                          S    L1 $FPAD     CALCULATE NUMBER OF SECTORS U6A02450
                          SLA     4         CONVERT TO DB               U6A02460
                          BSI     BINEB     FORMAT DB COUNT             U6A02470
                          STD     MESAG+19  PLACE DB COUNT              U6A02480
                    *                                                   U6A02490
                    *   FETCH THE PRINT ROUTINE AND PRINT THE EXITING   U6A02500
                    *   MESSAGE                                         U6A02510
                    *                                                   U6A02520
                          CALL    FSLEN     LINK TO SEARCH SLET         U6A02530
                          DC      RTPRT     SYSTEM PRINTER SUBR SLET ID U6A02540
                          CALL    FSYSU     LINK TO LOAD PRINT ROUTINE  U6A02550
                          STO     GOTOP+1   SAVE ENTRY ADDRESS          U6A02560
                          LDX  L2 X         LOAD VECTOR POINTER         U6A02570
                          LDD   2 AANDQ-X   LOAD FUNCTION AND ADDRESS   U6A02580
                    GOTOP BSI  L  *-*       LINK TO PRINT MESSAGE       U6A02590
                          MDX  L  $PBSY,0   CHECK PRINTER BUSY          U6A02600
                          MDX     *-3       BRANCH IF YES               U6A02610
                    *                                                   U6A02620
                    *   CHECK TO SEE IF RETURN IS TO DUP OR SUP         U6A02630
                    *                                                   U6A02640
                          LD    2 #DCSW-X                               U6A02650
                          BSC  L  $EXIT,+-  RETURN TO SUPERVISOR        U6A02660
                    *                                                   U6A02670
                    *   SIMULATE A // DUP CONTROL RECORD                U6A02680
                    *                                                   U6A02690
                          LDX   1 -1                                    U6A02700
                          STX  L1 $CTSW     SET TRAPPED SWITCH          U6A02710
                          LDX   1 80        LOAD WORD COUNT             U6A02720
                          SLA     16                                    U6A02730
                          STO  L1 SRBUF     STORE ZERO IN BUFFER        U6A02740
                          MDX   1 -1        DECREMENT WORD COUNT        U6A02750
                          MDX     *-4       BRANCH TO CONT              U6A02760
                          LDD   2 SLHDP-X                               U6A02770
                          STD  L  SRBUF     PLACE // D                  U6A02780
                          LDD   2 SLHDP+2-X                             U6A02790
                          STD  L  SRBUF+2   PLACE UP                    U6A02800
                          LDD   2 SLHDP+4-X                             U6A02810
                          STD  L  SRBUF+4                               U6A02820
                          LDX   0 $EXIT     RETURN TO SUP               U6A02830
                          HDNG    ADRWS-CONVERT BINARY TO EBCDIC        U6A02840
                    *                                                   U6A02850
                    *   BINARY TO EBCDIC                                U6A02860
                    *                                                   U6A02870
                    BINEB DC      *-*       ENTRY POINT                 U6A02880
                          STX   1 RXR1+1    SAVE XR1                    U6A02890
                          RTE     32-4      (BCD0/000A)                 U6A02900
                          SRA     4         (0BCD/000A)                 U6A02910
                          RTE     32-12     (D000/A0BC)                 U6A02920
                          SRA     4         (0D00/A0BC)                 U6A02930
                          RTE     4         (C0D0/0A0B)                 U6A02940
                          SRA     4         (0C0D/0A0B)                 U6A02950
                          RTE     16        (0A0B/0C0D)                 U6A02960
                    *                                                   U6A02970
                    *   CONVERT TO EBCDIC                               U6A02980
                    *                                                   U6A02990
                          LDX   1 4         SET XR1                     U6A03000
                    NEXT1 AND   2 H0FFF-X   MASK TO REMOVE BITS 0-3     U6A03010
                          S     2 H0A00-X   CHECK RANGE                 U6A03020
                          BSC     -         SKIP IF 0 THROUGH 9         U6A03030
                          A     2 HC700-X   MAKE CHARACTER A THROUGH F  U6A03040
                          A     2 HFA00-X   ADD IN TEST PLUS 0          U6A03050
                          RTE     32-8      MOVE TO NEXT CHARACTER      U6A03060
                          MDX   1 -1        SKIP IF COMPLETED           U6A03070
                          MDX     NEXT1     BRANCH TO CONVERT NEXT ONE  U6A03080
                    RXR1  LDX  L1 *-*       RESTORE XR1                 U6A03090
                          BSC  I  BINEB     RETURN                      U6A03100
                          HDNG    ADRWS-CONSTANTS,DCOM AND EQUATES      U6A03110
                    *                                                   U6A03120
                    *   CONSTANTS                                       U6A03130
                    *                                                   U6A03140
                    X     EQU     *+128     VECTOR POINTER              U6A03150
                    H0003 DC      /0003     SECTOR NO. MASK (0-3)       U6A03160
                    H0004 DC      /0004     TRACK NO. 1, SCTR 0 OF CYL  U6A03170
                    H0140 DC      /0140     WORDS PER SECTOR            U6A03180
                    SVAD1 DC      IOAR1-319 ADDR CON TO INITLZ WA150+1  U6A03190
                    H0001 DC      /0001     CONSTANT VALUE OF 1         U6A03200
                    HFFFC DC      /FFFC     MASK TO REMOVE ODD SCTR NO. U6A03210
                    H0FFF DC      /0FFF     MASK TO REMOVE BITS 0-3     U6A03220
                    H0F00 DC      /0F00     MASK TO LEAVE BITS 4-7 ONLY U6A03230
                    H0A00 DC      /0A00     EBCDIC RANGE CHECK          U6A03240
                    HC700 DC      /C700     FORCE CHAR TO EBCDIC A-F    U6A03250
                    HFA00 DC      /FA00     EBCDIC HEX CHAR GENERATION  U6A03260
                    ENADR DC      1600      UPPER SCTR ADDRESS LIMIT    U6A03270
                          BSS  E  0         MAKE LOCATION EVEN          U6A03280
                    SLHDP DC      ./        EBCDIC SLASH                U6A03290
                          DC      ./        EBCDIC SLASH                U6A03300
                          DC      .         EBCDIC BLANK                U6A03310
                          DC      .D        EBCDIC D                    U6A03320
                          DC      .U        EBCDIC U                    U6A03330
                          DC      .P        EBCDIC P                    U6A03340
                          BSS  E  0         MAKE LOCATION EVEN          U6A03350
                    AANDQ DC      /7001     FUNCTION PRINT A LINE       U6A03360
                          DC      MESAG     EXIT MESSAGE ADDRESS        U6A03370
                    *                                                   U6A03380
                    *   EXIT MESSAGE                                    U6A03390
                    *                                                   U6A03400
                          BSS  E  1         MAKE NEXT LOCATION ODD      U6A03410
                    MESAG DC      PRINX-*   WORD COUNT                  U6A03420
                          EBC     .CART ID XXXX  DB ADDR XXXX   DB CN.  U6A03430
                          EBC     .T XXXX.                              U6A03440
                    PRINX EQU     *                                     U6A03450
                    *                                                   U6A03460
                    *   WORKING STORAGE                                 U6A03470
                    *                                                   U6A03480
                    SCNN1 DC      *-*       SECTOR NUMBER               U6A03490
                    NOSC1 DC      *-*       NUMBER OF SECTORS           U6A03500
                    *                                                   U6A03510
                    *   DCOM SECTOR IS PLACED HERE                      U6A03520
                    *                                                   U6A03530
                    DCAR2 DC      DCOME-*-1 WORD COUNT                  U6A03540
                          DC      @DCOM     SECTOR ADDRESS              U6A03550
                          BSS     18        DCOM WORDS 0-17             U6A03560
                    #TODR BSS     1         DR CODE OF 'TO' DRIVE       U6A03570
                          BSS     5         DCOM WORDS 19-23            U6A03580
                    #DCSW BSS     1         RETURN TO DUP SWITCH        U6A03590
                          BSS     30        DCOM WORDS 25-54            U6A03600
                    #CIDN BSS     5         CART ID TABLE               U6A03610
                    DCOME EQU     *                                     U6A03620
                    *                                                   U6A03630
                    *   COMMON EQUATES                                  U6A03640
                    *                                                   U6A03650
                    SRBUF EQU     /FB0      SUP CONTROL RECORD BUFFER   U6A03660
                    $CTSW EQU     /F        CONTROL RECORD TRAP SW      U6A03670
                    @DCOM EQU     1         DCOM SECTOR ADDRESS         U6A03680
                    RTPRT EQU     /99       SYSTEM PRINT SUBR SLET NO.  U6A03690
                    $WSDR EQU     /7A       WORKING STORAGE DRIVE       U6A03700
                    $FPAD EQU     /95       FILE PROTECT ADDR TABLE     U6A03710
                    $PBSY EQU     /36       PRINCIPAL PRINTER BUSY      U6A03720
                    $EXIT EQU     /38       ADDRESS OF CALL EXIT        U6A03730
                    *                                                   U6A03740
                    *   I/O AREA FOR DISK FUNCTIONS                     U6A03750
                    *                                                   U6A03760
                    IOAR1 BSS     2+4*320   4 SECTOR BUFFER             U6A03770
                          END     WA000                                 U6A03780
