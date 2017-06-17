                          HDNG    OMPR1,LIBRARY SUBROUTINE FOR 1231     U2C00010
                    *************************************************** U2C00020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U2C00030
                    *                                                 * U2C00040
                    *TITLE-OMPR1,LIBRARY SUBROUTINE FOR 1231 OPTICAL  * U2C00050
                    *      MARK PAGE READER                           * U2C00060
                    *                                                 * U2C00070
                    *FUNCTION/OPERATION-                              * U2C00080
                    *  THIS IS A SUBROUTINE FOR THE 1130 DISK         * U2C00090
                    *MONITOR SUBROUTINE LIBRARY.THIS SUBROUTINE       * U2C00100
                    *SUPPORTS THE 1231 OPTICAL MARK PAGE READER.IT    * U2C00110
                    *HANDLES THE READING OF 8 1/2 X 11 PAPER DOCUMENTS* U2C00120
                    *BY THE 1231. FUNCTIONS PERFORMED ARE-TEST FOR    * U2C00130
                    *ROUTINE BUSY,READ,FEED,STACKER SELECT AND        * U2C00140
                    *DISCONNECT.IN GENERAL THIS SUBR.CONSISTS OF      * U2C00150
                    *TWO SECTIONS- A CALL PORTION AND AN INTERRUPT    * U2C00160
                    *PORTION. IN THE CALL PORTION THE FUNCTION IS     * U2C00170
                    *ANALYZED AND THE APPROPRIATE OPERATION(S)        * U2C00180
                    *INITIATED. IN THE INTERRUPT PORTION THE VARIOUS  * U2C00190
                    *INTERRUPTS ARE ANALYZED AND SERVICED.            * U2C00200
                    *                                                 * U2C00210
                    *ENTRY POINTS-                                    * U2C00220
                    *                                                 * U2C00230
                    *     1.OMPR1,THIS IS ENTRY FOR CALL PORTION,     * U2C00240
                    *       CALLING SEQUENCE IS THE STANDARD 1130 SUBR* U2C00250
                    *       LIBRARY LIBF STATEMENT.FOR A READ FUNCTION* U2C00260
                    *       IT IS-                                    * U2C00270
                    *     LIBF    OMPR1                               * U2C00280
                    *     DC      /1000  (CONTROL PARAMETER)          * U2C00290
                    *     DC      AREA   (ADDRESS OF I/O AREA)        * U2C00300
                    *     DC      ERROR  (ADDR.OF USERS ERROR ROUTINE)* U2C00310
                    *                                                 * U2C00320
                    *     2.INT1,THIS IS THE INTERRUPT ENTRANCE FROM  * U2C00330
                    *     THE SYSTEM  ILS04 ROUTINE                   * U2C00340
                    *                                                 * U2C00350
                    *INPUT- NOT APPLICABLE                            * U2C00360
                    *                                                 * U2C00370
                    *OUTPUT- THE SUBROUTINE READS WORDS FROM A PAPER  * U2C00380
                    *     DOCUMENT AND PLACES AN IMAGE OF EACH SEGMENT* U2C00390
                    *     (OR TWO SEGMENTS)INTO CONTIGUOUS MEMORY     * U2C00400
                    *     LOCATIONS STARTING AT THE ADDRESS SPECIFIED * U2C00410
                    *     BY THE USERS I/O AREA PARAMETER             * U2C00420
                    *                                                 * U2C00430
                    *EXTERNAL ROUTINES-NONE                           * U2C00440
                    *                                                 * U2C00450
                    *EXITS- NORMAL                                    * U2C00460
                    *     1.CALL PORTION--MPR59,BACK TO USER PROGRAM  * U2C00470
                    *                                                 * U2C00480
                    *     2.INTERRUPT PORTION-- EXIT,BACK TO ILS SUBR * U2C00490
                    *                                                 * U2C00500
                    *     - ERROR                                     * U2C00510
                    *     1.CALL PORTION--1.MPR70,2.MPR72.PREOPERATIVE* U2C00520
                    *                  ERROR EXITS TO $PRET           * U2C00530
                    *     2.INTRPT PORTION--MPR84,TO USERS ERROR SUBR * U2C00540
                    *                  $PST4,POST-OPERATIVE ERROR TRAP* U2C00550
                    *TABLES,WORK AREAS-NONE                           * U2C00560
                    *ATTRIBUTES-REUSABLE                              * U2C00570
                    *NOTES-                                           * U2C00580
                    *************************************************** U2C00590
                          LIBR                                          U2C00600
                    1130  ISS  10 OMPR1     4                           U2C00610
                    *                                                   U2C00620
                    *             LOADER REQUIRED INSTRUCTIONS          U2C00630
                    *                                                   U2C00640
                    OMPR1 STX   1 SAVX1      WORD TO SAVE XR1           U2C00650
                          LDX  I1 0          LOADER STORES TV ADDRESS   U2C00660
                          MDX     MPR10      GO START CALL PROCESSING   U2C00670
                    *                                                   U2C00680
                    INT1  DC      0          INTERRUPT ENTRANCE         U2C00690
                          BSC  L  MPR80      TO INTERRUPT SERVICE SUBR  U2C00700
                    *                                                   U2C00710
                    SAVX1 DC      *-*        WORD TO SAVE XR1           U2C00720
                    SAVAQ DEC     0          2 WORDS FOR ACC AND EXT    U2C00730
                    *                                                   U2C00740
                    *        HERE STARTS CALL PORTION OF OMPR1          U2C00750
                    *                                                   U2C00760
                    MPR10 STX  L2 MPR56+1    SAVE XR2                   U2C00770
                          LDX  L2 Z          SET TRANSFER VECTOR    2-3 U2C00780
                          STS   2 MPR58-Z    SAVE STATUS                U2C00790
                          STD     SAVAQ      SAVE ACC AND EXTENSION     U2C00800
                    *                                                   U2C00810
                    *        CHECK IF IT IS A TEST FUNCTION             U2C00820
                    *                                                   U2C00830
                    MPR12 LD    1 0          LOAD CONTROL PARAMETER     U2C00840
                          BSC  L  MPR15,+-   BR IF TEST FUNCTION        U2C00850
                    *                                                   U2C00860
                          S     2 D1-Z       CHECK IF IT IS A TIMING    U2C00870
                          BSC  L  MPR20,Z    *MARK TEST FUNC, NO, GO    U2C00880
                    *                                                   U2C00890
                    *        TIMING MARK TEST FUNCTION                  U2C00900
                    *                                                   U2C00910
                          MDX  L  BUSY,0     IS ROUTINE BUSY        2-6 U2C00920
                          MDX     PLUS2      YES - EXIT TO LIBF+2   2-6 U2C00930
                          XIO   2 SENSE-Z    SENSE DSW              2-3 U2C00940
                          SLA     8          IS TIMING MRK CHCK BSY 2-3 U2C00950
                          BSC     +Z         NO,EXIT TO LIBF+3          U2C00960
                    *                                                   U2C00970
                    PLUS2 MDX   1 -1         YES,EXIT TO LIBF+2         U2C00980
                    PLUS3 MDX   1 -1         SET UP FOR LIBF+3          U2C00990
                          BSC  L  MPR50      WRAP-UP PRIOR TO EXIT      U2C01000
                    *                                                   U2C01010
                    *        TEST FUNCTION                              U2C01020
                    *                                                   U2C01030
                    MPR15 MDX  L  BUSY,0     IS ROUTINE BUSY            U2C01040
                          MDX     PLUS2      YES,LIBF+2                 U2C01050
                          MDX     PLUS3      NO,LIBF+3                  U2C01060
                    *                                                   U2C01070
                    *        DETERMINE IF FUNCTION IS LEGAL             U2C01080
                    *                                                   U2C01090
                    MPR20 LD    1 0          LOAD CONTROL PARAMETER     U2C01100
                          SRT     12         RT-JUSTIFY FUNCTION CODE   U2C01110
                          BSC  L  MPR70,+Z   BRANCH IF DIGIT IS 8-F     U2C01120
                          S     2 D2-Z       ERROR IF FUNCTION          U2C01130
                          BSC  L  MPR70,+-   *CODE IS 2                 U2C01140
                          S     2 D1-Z                                  U2C01150
                          STO   2 MPR62-Z    SAVE FUNCTION              U2C01160
                          BSC  L  MPR30,+    BRANCH IF FEED OR READ     U2C01170
                          S     2 D1-Z       CHK IF FUNC IS DISCONNECT  U2C01180
                          BSC  L  MPR35,Z    NO,GO CHK STKR SEL FUNC    U2C01190
                          BSI     MPR25      YES,DISCONNECT         2-3 U2C01200
                          MDX     PLUS2      EXIT TO LIBF+2             U2C01210
                    *                                                   U2C01220
                    *        DISCONNECT SUBROUTINE                      U2C01230
                    *                                                   U2C01240
                    MPR25 DC      *-*        ENTRY                  2-3 U2C01250
                          BSI   2 MPR48-Z    LOOP ON FEED BUSY      2-6 U2C01260
                          XIO     DSCNT      DISCONNECT             2-6 U2C01270
                          LD    2 IOCT-Z     IS IOCT SWITCH SET     2-6 U2C01280
                          BSC  L  MPR29,+-   BRANCH IF NO           2-6 U2C01290
                          MDX  L  $IOCT,-1   DECREMENT $IOCT        2-6 U2C01300
                          NOP                                       2-6 U2C01310
                          SLA     16         CLEAR                  2-6 U2C01320
                    MPR29 STO   2 BUSY-Z     *BUSY INDICATOR        2-6 U2C01330
                          STO   2 MPR67-Z    *INTERRUPT SWITCH      2-6 U2C01340
                          STO   2 MPR68-Z    *FEED INDICATOR        2-6 U2C01350
                          STO   2 IOCT-Z     *IOCT SWITCH           2-6 U2C01360
                          BSC  I  MPR25      RETURN                 2-3 U2C01370
                    *                                                   U2C01380
                    *        READ OR FEED FUNCTION                      U2C01390
                    *                                                   U2C01400
                    MPR30 BSC     -          SKIP IF READ FUNCTION      U2C01410
                          MDX     MPR40      GO HANDLE FEED FUNCTION    U2C01420
                    *                                                   U2C01430
                    *CHECK IF A FEED HAS ALREADY BEEN PERFORMED FOR     U2C01440
                    *THIS DOCUMENT,SIGNIFIED BY MPR68=1,IF MPR68=0,IT   U2C01450
                    *MEANS A FEED HAS NOT YET BEEN INITIATED FOR THIS   U2C01460
                    *READ FUNCTION.                                     U2C01470
                    *                                                   U2C01480
                          MDX  L  MPR68,0    IS FEED IND. SET           U2C01490
                          MDX     MPR31      YES - BRANCH               U2C01500
                          MDX  L  BUSY,0     NO - LOOP ON               U2C01510
                          MDX     *-3        ROUTINE BUSY               U2C01520
                          LD    1 +1         STORE ADDR.OF I/O          U2C01530
                          STO     READ       AREA IN READ IOCC          U2C01540
                          STO     MPR60      SAVE I/O AREA ADDR         U2C01550
                          MDX     MPR42      GO CHECK DEVICE READY      U2C01560
                    *                                                   U2C01570
                    MPR31 LD      MPR64      LOOP TILL THE FIRST CHAR.  U2C01580
                          BSC  L  *-3,+-     INTRPT IS RECEIVED     2-3 U2C01590
                          SRA     16         CLEAR FEED                 U2C01600
                          STO     MPR68      INDICATOR                  U2C01610
                          LD      MPR67      EXIT IF AN ERROR       2-8 U2C01620
                          BSC  L  MPR50,+-   *HAS OCCURRED          2-8 U2C01630
                    *                                                   U2C01640
                          LD      MPR66      IS THIS A MASTER MARK      U2C01650
                          BSC  L  MPR32,Z    DOCUMENT,YES,GOTO MPR32    U2C01660
                          LD    1 +1         NO,STORE USERS I/O AREA    U2C01670
                          STO     READ       IN READ IOCC.              U2C01680
                          STO     MPR60      SAVE I/O AREA ADDR.    2-3 U2C01690
                    MPR32 STX     IOCT      SET IOCT SWITCH        2-10 U2C01693
                          MDX  L  $IOCT,1   INCREMENT $IOCT        2-10 U2C01696
                          XIO     READ       READ THE FIRST CHARACTER   U2C01700
                          LD      READ       UPDATE I/O ADDRESS         U2C01710
                          A       D1         FOR NEXT                   U2C01720
                          STO     READ       CHARACTER                  U2C01730
                          MDX     MPR44      GO CHK FOR STACKER SELECT  U2C01760
                    *                                                   U2C01770
                    *USER HAS GIVEN 2 FEEDS WITHOUT AN INTERVENING      U2C01780
                    *READ FUNCTION--RUN OUT THE                         U2C01790
                    *CURRENT DOCUMENT,DO AN I/O DISCONNECT              U2C01800
                    *                                                   U2C01810
                    MPR33 BSI     MPR25      DISCONNECT             2-3 U2C01820
                          MDX     MPR41      BRANCH TO START FEED   2-6 U2C01830
                    *                                                   U2C01840
                    *        CHECK IF STACKER SELECT FUNCTION           U2C01850
                    *                                                   U2C01860
                    MPR35 S       D1         IS FUNC STK SEL            U2C01870
                          BSC  L  MPR70,Z    ILLEGAL FUNC.              U2C01880
                          BSI     MPR36      YES - STK SEL          2-3 U2C01890
                          MDX     PLUS2      EXIT                       U2C01900
                    *                                                   U2C01910
                    *        STACKER SELECT SUBROUTINE                  U2C01920
                    *                                                   U2C01930
                    MPR36 DC      *-*        ENTRY                  2-3 U2C01940
                          LD    2 MPR69-Z    IS DOC ALREADY SEL     2-3 U2C01950
                          BSC  L  MPR39,Z    YES - RETURN           2-3 U2C01960
                          BSI   2 MPR48-Z    LOOP ON FEED BUSY      2-3 U2C01970
                          XIO   2 SENSE-Z    SENSE DSW              2-3 U2C01980
                          SLA     5          IS IT OK TO SEL        2-3 U2C01990
                          BSC     +Z         NO - SKIP              2-3 U2C02000
                          XIO   2 STKSL-Z    YES - STK SEL          2-3 U2C02010
                          STX     MPR69      SET SELECT SWITCH      2-3 U2C02020
                    MPR39 BSC  I  MPR36      RETURN                 2-3 U2C02030
                    *                                                   U2C02040
                    *        FEED FUNCTION                              U2C02050
                    *                                                   U2C02060
                    *************************************************** U2C02070
                    *CHECK IF FEED FLAG IS ALREADY SET,IF SO,IT MEANS * U2C02080
                    *WE HAVE 2 FEED CALLS WITHOUT AN INTERVENING READ.* U2C02090
                    *IN A CASE LIKE THIS,WE RUN-OUT THE FIRST DOCUMENT* U2C02100
                    *BY MEANS OF AN I/O DISCONNECT                    * U2C02110
                    *************************************************** U2C02120
                    MPR40 LD      MPR68      IF FEED IND IS ON - GO     U2C02130
                          BSC  L  MPR33,Z    *DISCONNECT CURRENT DOC    U2C02140
                    *                                                   U2C02150
                          MDX  L  BUSY,0     LOOP ON PROGRAM BUSY       U2C02160
                          MDX     *-3        *INDICATOR                 U2C02170
                    *                                                   U2C02180
                    MPR41 STX     MPR68      SET FEED INDICATOR         U2C02190
                    MPR42 LD      MPR62      IS FUNCTION FEED(MPR62=0)  U2C02200
                          STO     MPR64      RESET FIRST-CHAR-INTRPT SW U2C02210
                    MPR43 XIO   2 SENSE-Z    SENSE DSW AND EXIT TO  2-7 U2C02220
                          BSC  L  MPR72,E    *$PRET IF NOT READY    2-7 U2C02230
                          STX     BUSY       SET BUSY INDICATOR     2-7 U2C02240
                          STX     IOCT       SET IOCT SWITCH        2-7 U2C02250
                          MDX  L  $IOCT,1    INCREMENT IOCS COUNTER 2-7 U2C02260
                          XIO     CNTRL      INITIATE A FEED            U2C02270
                          SRA     16                                2-3 U2C02280
                          STO   2 MPR69-Z    CLEAR SELECT SW.       2-3 U2C02290
                          LD      MPR62      IS FUNCTION FEED           U2C02300
                          BSC  L  PLUS2,+-   YES - SET UP FOR LIBF+2    U2C02310
                    MPR44 LD    1 +2         STORE ERROR PARAMETER IN   U2C02320
                          STO   2 MPR84+2-Z  ERROR EXIT INSTRUCTION     U2C02330
                          SRA     16         CLEAR ACC                  U2C02340
                          SLT     4          MOVE IN STACKER SEL DIGIT  U2C02350
                          BSC     Z          SKIP IF NO SEL REQ.    2-3 U2C02360
                          BSI     MPR36      SEL DOCUMENT           2-3 U2C02370
                    *                                                   U2C02380
                    *             RESET REGISTERS PRIOR TO EXIT         U2C02390
                    *                                                   U2C02400
                    MPR50 MDX   1 +3         XR1 CONTAINS RETURN ADDR   U2C02410
                          LDD  L  SAVAQ      RESTORE ACC AND EXT        U2C02420
                          STX   1 MPR59+1    STORE RETURN ADDRESS       U2C02430
                          LDX  I1 SAVX1      RESTORE XR1                U2C02440
                    MPR56 LDX  L2 *-*        RESTORE XR2                U2C02450
                    MPR58 LDS     0          RESTORE OVERFLOW AND CARRY U2C02460
                    MPR59 BSC  L  *-*        RETURN TO MAINLINE         U2C02470
                    *                                                   U2C02480
                    *        LOOP ON FEED BUSY SUBROUTINE               U2C02490
                    *                                                   U2C02500
                    MPR48 DC      *-*        ENTRY                  2-3 U2C02510
                          LD      MPR65      HAS JAM OCURRED        2-3 U2C02520
                          BSC  L  MPR49,Z    YES - RETURN           2-3 U2C02530
                          XIO     SENSE      SENSE DSW              2-3 U2C02540
                          SLA     6          IS FEED BUSY           2-3 U2C02550
                          BSC  L  MPR48+1,+Z YES - LOOP             2-3 U2C02560
                    MPR49 SRA     16                                2-3 U2C02570
                          STO   2 MPR65-Z    RESTORE JAMSWITCH      2-3 U2C02580
                          BSC  I  MPR48      RETURN                 2-3 U2C02590
                    *                                                   U2C02600
                    *             CONSTANTS AND WORK AREAS              U2C02610
                    *                                                   U2C02620
                    MPR60 DC      *-*        WD TO SAVE I/O AREA ADDR   U2C02630
                          BSS  E  0                                     U2C02640
                    CNTRL DC      1          CONSTANT ONE               U2C02650
                          DC      /4404      START FEED IOCC            U2C02660
                    READ  DC      *-*        I/O AREA ADDRESS           U2C02670
                          DC      /4200      READ IOCC                  U2C02680
                    DSCNT DC      0          SAVE FUNCTION CODE HERE    U2C02690
                          DC      /4402      DISCONNECT IOCC            U2C02700
                    SENSE DC      0          BUSY INDICATOR             U2C02710
                          DC      /4700      SENSE WITHOUT RESET IOCC   U2C02720
                    STKSL DC      2          CONSTANT TWO               U2C02730
                          DC      /4480      STACKER SELECT IOCC        U2C02740
                    SENSR DC      0          FIRST-CHAR-INTRPT IND      U2C02750
                          DC      /4701      SENSE WITH RESET IOCC      U2C02760
                    BUSY  EQU     SENSE      BUSY INDICATOR             U2C02770
                    MPR62 EQU     DSCNT      FUNCTION CODE              U2C02780
                    MPR63 DC      *-*        TEMP STORAGE FOR DSW   2-6 U2C02790
                    MPR64 EQU     SENSR      FIRST-CHAR-INTRPT IND      U2C02800
                    MPR65 DC      *-*        JAM SWITCH             2-3 U2C02810
                    Z     EQU     *          TV VALUE               2-3 U2C02820
                    HA000 DC      /A000      NOT READY ERROR CODE       U2C02830
                    HA001 DC      /A001      BAD CALL ERROR CODE        U2C02840
                    HA002 DC      /A002      FEED CHECK ERR CODE    2-3 U2C02850
                    HA003 DC      /A003      FEED CHECK ERR CODE    2-3 U2C02860
                    H0069 DC      /0069      MASK FOR DSW               U2C02870
                    MPR66 DC      0          MASTER MARK INDICATOR      U2C02880
                    MPR67 DC      *-*        INTERRUPT SWITCH       2-3 U2C02890
                    MPR68 DC      0          FEED FUNCTION INDICATOR    U2C02900
                    MPR69 DC      *-*        STACKER SELECT SWITCH  2-3 U2C02910
                    IOCT  DC      *-*        IOCT SWITCH            2-6 U2C02920
                    $PRET EQU     /28        PRE-OPER ERROR TRAP    2-3 U2C02930
                    $IOCT EQU     /32        IOCS COUNTER           2-3 U2C02940
                    $PST4 EQU     /8D        LVL 4 POST-OPER ERROR TRAP U2C02950
                    D1    EQU     CNTRL      CONSTANT ONE               U2C02960
                    D2    EQU     STKSL      CONSTANT TWO               U2C02970
                    D3    DC      3          CONSTANT THREE             U2C02980
                    *                                                   U2C02990
                    *        EXIT TO $PRET IF BAD CALL                  U2C03000
                    *                                                   U2C03010
                    MPR70 LD      HA001      LOAD ILLEGAL CALL CODE 2-3 U2C03020
                          BSI  L  $PRET      EXIT TO $PRET          2-3 U2C03030
                          BSC  L  MPR12      RETRY MPR12            2-3 U2C03040
                    *                                                   U2C03050
                    *                                                   U2C03060
                    *     EXIT TO $PRET WITH AN ERROR CODE              U2C03070
                    *          FOR NOT READY DEVICE                     U2C03080
                    *                                                   U2C03090
                    MPR72 LD    2 HA000-Z    LD NOT READY ERR CODE  2-3 U2C03100
                          BSI  L  $PRET      EXIT TO $PRET          2-3 U2C03110
                          MDX     MPR43      RETRY SENSE            2-3 U2C03120
                    *                                                   U2C03130
                    *                                                   U2C03140
                    *      INTERRUPT HANDLING PART OF OMPR1             U2C03150
                    *                                                   U2C03160
                    *      INTERUPTS ARE CAUSED FOR FOUR REASONS        U2C03170
                    *      1. DATA TRANSFER......                       U2C03180
                    *      2. OP COMPLETE.......                        U2C03190
                    *      3. TIMING MARK ERROR.....                    U2C03200
                    *      4. JAM STOP.....                             U2C03210
                    *                                                   U2C03220
                    MPR80 XIO     SENSE      SENSE THE DSW          2-6 U2C03230
                          STO     MPR63      SAVE TEMPORARY         2-6 U2C03240
                          XIO     SENSR      RESET DSW INDICATORS   2-6 U2C03250
                          LD      MPR63      LOAD THE DSW           2-6 U2C03260
                          SRT     5          IS IT FEED CHECK       2-3 U2C03270
                          BSC  L  MPR85,E    YES - BRANCH           2-3 U2C03280
                          BSC  L  MPR90,-    BRANCH IF OP COMPLETE      U2C03290
                          STX     MPR67      SET INTERRUPT SWITCH   2-3 U2C03300
                          SLA     8          IS IT MASTER MARK          U2C03310
                          BSC  L  MPR81,-    BRANCH IF NO               U2C03320
                          LD      MPR66      SEE IF MASTER MARK SWITCH  U2C03330
                          BSC  L  MPR83,+-   IS SET. NO,GOTO MARK       U2C03340
                    *                                                   U2C03350
                    *CHECK TO SEE IF THIS IS THE FIRST CHARACTER        U2C03360
                    *INTERRUPT IN RESPONSE TO A FEED FUNCTION,THIS IS   U2C03370
                    *DETECTED BY SEEING IF THE 1ST CHAR INTRP INDICATOR U2C03380
                    *MPR64 IS ZERO. IF MPR64 IS ZERO AND WE HAVE        U2C03390
                    *RECEIVED A CHARACTER INTERRUPT,THIS CAN ONLY MEAN  U2C03400
                    *THAT THE INTERRUPT CAME IN RESPONSE TO A FEED      U2C03410
                    *FUNCTION                                           U2C03420
                    *                                                   U2C03430
                    MPR81 LD      MPR64      LOAD INDICATOR             U2C03440
                          BSC  L  MPR82,Z    IS MPR64 ZERO, NO GO READ  U2C03450
                          STO     IOCT       RESET IOCT SWITCH      2-6 U2C03460
                          STX     MPR64      YES,MAKE MPR64 NONZERO AND U2C03470
                          MDX  L  $IOCT,-1   DECREMENT $IOCT        2-6 U2C03480
                          NOP                                       2-6 U2C03490
                          MDX     EXIT       RETURN WITHOUT READING     U2C03500
                    *                                                   U2C03510
                    MPR82 XIO     READ       READ A CHARACTER           U2C03520
                          LD      READ       UPDATE I/O AREA ADDRESS    U2C03530
                          A       D1         FOR NEXT                   U2C03540
                          STO     READ       CHARACTER                  U2C03550
                          MDX     EXIT       RETURN                     U2C03560
                    *                                                   U2C03570
                    MPR83 LD      D1         LOAD MASTER MARK CODE      U2C03580
                          BSI     MPR84      TO USERS ERROR ROUTINE     U2C03590
                          BSC  L  MPR81,+-   IF A=0,GOTO FIRST,IF NOT   U2C03600
                          STO     READ       USER HAS PUT NEW I/O AREA  U2C03610
                          STO     MPR60      IN ACC - STORE IT      2-3 U2C03620
                          STX     MPR66                                 U2C03630
                          MDX     MPR81      SET MASTER MARK            U2C03640
                    *                        AND GO CHECK 1ST.CHAR.INTR U2C03650
                    *                                                   U2C03660
                    * EXIT TO USERS ERROR PARAMETER                     U2C03670
                    *                                                   U2C03680
                    MPR84 NOP                ENTRY                      U2C03690
                          BSI  L  *-*        EXIT TO USER               U2C03700
                          BSC  I  MPR84      RETURN                     U2C03710
                    *                                                   U2C03720
                    MPR85 STX     MPR64      SET FIRST-CHAR SWITCH  2-6 U2C03730
                          LD      BUSY       IS PROGRAM BUSY        2-3 U2C03740
                          BSC  L  MPR86,+-   BRANCH IF NO           2-3 U2C03750
                    * 2 INSTRUCTIONS REMOVED                        212 U2C03760
                          XIO     DSCNT      DISCONNECT             2-3 U2C03780
                          LD      HA003      EXIT TO POSTOPERATIVE  2-3 U2C03790
                          BSI  L  $PST4      ERROR TRAP             2-3 U2C03800
                          XIO     SENSE      IS DEVICE READY        2-3 U2C03810
                          BSC  L  *-6,E      BRANCH BACK IF NO      2-3 U2C03820
                          XIO     DSCNT     DISCONNECT              212 U2C03825
                          MDX     MPR93      BRANCH TO INITIATE FEED2-3 U2C03830
                    *                                                   U2C03840
                    MPR86 LD      HA002      EXIT TO POSTOPERATIVE  2-3 U2C03850
                          BSI  L  $PST4      ERROR TRAP             2-3 U2C03860
                          XIO     SENSE      IS DEVICE READY        2-3 U2C03870
                          BSC  L  *-6,E      BRANCH BACK IF NO      2-3 U2C03880
                          STX     MPR65      SET JAMSWITCH          2-3 U2C03890
                          MDX     EXIT       EXIT                   2-3 U2C03900
                    *                                                   U2C03910
                    *OP COMPLETE INTERRUPT PROCESSING                   U2C03920
                    *                                                   U2C03930
                    MPR90 STX     MPR64      SET FIRST-CHAR SWITCH  2-6 U2C03940
                          SRT     3          RIGHT-JUSTIFY DOC.SELECTED U2C03950
                          AND     H0069      BIT,IS BIT PRESENT         U2C03960
                          BSC  L  MPR98,E    YES,GO HANDLE DOC.SELECTED U2C03970
                          SRT     3          NO,CHK OP COMPLETE         U2C03980
                          BSC     E          SKIP IF NOT OP COMPLETE    U2C03990
                          MDX     *+1        OP COMPLETE INTRP,SKIP     U2C04000
                          MDX     EXIT       NOT OP COMPLETE,EXIT       U2C04010
                          SRT     1          MOVE OUT OP COMPLETE BIT   U2C04020
                          BSC  L  MPR94,+    BRANCH IF NO MORE BIT      U2C04030
                    *                                                   U2C04040
                    *        READ OR TIMING MARK ERROR                  U2C04050
                    *                                                   U2C04060
                          STX     BUSY      SET BUSY INDICATOR      2-6 U2C04070
                          LD      IOCT      IF IOCT SWITCH IS       2-6 U2C04080
                          BSC  L  MPR91,Z   *ZERO - SET IT          2-6 U2C04090
                          STX     IOCT      *NON-ZERO AND           2-6 U2C04100
                          MDX  L  $IOCT,1    INCR $IOCT             2-3 U2C04110
                    MPR91 LD      D2         TIMING MARK ERROR,LOAD     U2C04120
                    MPR92 BSI     MPR84     ERROR CODE AND EXIT TO USER U2C04130
                          BSC  L  MPR95,+-  IF RETURN WITH A=0,GOTO CLR U2C04140
                    MPR99 XIO     SENSE     ROUTINE BUSY INDR.,IF A IS  U2C04150
                          BSC  L  MPR96,E   NONZERO,CHK.DEV.READY       U2C04160
                          XIO     DSCNT     DISCONNECT LAST DOCUMNT 2-6 U2C04170
                    MPR93 LD   L  MPR60     RESTORE I/O                 U2C04180
                          STO     READ       AREA ADDRESS               U2C04190
                          SRA     16                                2-3 U2C04200
                          STO     MPR69      RESET STK SEL SW.      2-3 U2C04210
                          XIO  L  CNTRL     INITIATE FEED               U2C04220
                          MDX     EXIT      BACK TO ILS                 U2C04230
                    *                                                   U2C04240
                    MPR94 SLT     6         CHECK FOR HOPPER EMPTY      U2C04250
                          BSC  L  MPR97,E   YES GOTO HOPPR,NO MEANS END U2C04260
                    MPR95 SRA     16        OF TRANSMISSION,CLEAR       U2C04270
                          STO  L  BUSY      ROUTINE BUSY INDICATOR AND  U2C04280
                          STO     MPR66     MASTER MARK FLAG            U2C04290
                          STO     MPR67      RESET INTERRUPT SWITCH 2-3 U2C04300
                          STO     IOCT      RESET IOCT SWITCH       2-6 U2C04310
                          MDX  L  $IOCT,-1   DECREMENT IOCS COUNTER 2-3 U2C04320
                          NOP                                           U2C04330
                    EXIT  BSC  I  INT1      RETURN TO ILS.              U2C04340
                    *                                                   U2C04350
                    *        EXIT TO $PST4 IF NOT READY                 U2C04360
                    *                                                   U2C04370
                    MPR96 LD   L  HA000     TO POST-OPER ERROR TRAP     U2C04380
                          BSI  L  $PST4     WITH OMPR ERROR CODE        U2C04390
                          MDX     MPR99     RETRY                       U2C04400
                    *                                                   U2C04410
                    *HOPPER EMPTY,LOAD APPROPRIATE CODE AND EXIT TO     U2C04420
                    *USERS ERROR ROUTINE                                U2C04430
                    *                                                   U2C04440
                    MPR97 LD   L  D3        HOPPER EMPTY ERROR CODE     U2C04450
                          BSI     MPR84     EXIT TO USER                U2C04460
                          MDX     MPR95     UPON REENTRY GO CLEAR BUSY  U2C04470
                    *                                                   U2C04480
                    * DOCUMENT SELECTED,LOAD APPROPRIATE ERROR CODE AND U2C04490
                    *EXIT TO USERS ERROR PARAMETER                      U2C04500
                    *                                                   U2C04510
                    MPR98 SLT     1         LOAD 4 OR 5             2-6 U2C04520
                          LD   L  D2        *RESPECTIVELY           2-6 U2C04530
                          SLT     1         *AND EXIT TO            2-6 U2C04540
                          MDX     MPR92     *USER ERROR ROUTINE     2-6 U2C04550
                    *                                                   U2C04560
                          END                                           U2C04570
