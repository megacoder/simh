                          HDNG    CORE IMAGE LOADER FOR 2501 OR 1442    DCL00010
                    *************************************************** DCL00020
                    *                                                 * DCL00030
                    *FUNCTION-                                        * DCL00040
                    *   *THIS CARD CORE IMAGE LOADER READS CARDS FROM * DCL00050
                    *    ETHER THE 2501 OR 1442 AND LOADES THEM INTO  * DCL00060
                    *    CORE. THE DECK TO BE LOADED MUST BE CORE     * DCL00070
                    *    IMAGE CONVERTED ON THE PRESENT CORE IMAGE    * DCL00080
                    *    CONVERTER.                                   * DCL00090
                    *                                                 * DCL00100
                    *ENTRY POINTS-                                    * DCL00110
                    *   *CL320-THE BOOTSTRAP LOADER WILL BRANCH THERE * DCL00120
                    *    AFTER IT HAS LOADED THE CORE IMAGE LOADER    * DCL00130
                    *    INTO CORE.                                   * DCL00140
                    *                                                 * DCL00150
                    *INPUT-                                           * DCL00160
                    *   *THE CORE IMAGE DECK TO BE LOADED IS PLACED   * DCL00170
                    *    BEHIND THE CORE IMAGE LOADER AND IS LOADED   * DCL00180
                    *    FROM THE SAME DEVICE THAT INITIAL PROGRAM    * DCL00190
                    *    LOAD (IPL) IS DONE FROM.                     * DCL00200
                    *                                                 * DCL00210
                    *OUTPUT-                                          * DCL00220
                    *   *N/A                                          * DCL00230
                    *                                                 * DCL00240
                    *EXTERNAL REFERANCES-                             * DCL00250
                    *   *CORE LOCATION /29 IN THE BOOTSTRAP (LINK WORD* DCL00260
                    *    FOR COLUMN INTERUPT) IS LOOKED AT TO SEE IF  * DCL00270
                    *    THE READING IS FROM THE 1442 OR 2501. THIS   * DCL00280
                    *    WORD DIRECTS THE INITIALIZATION OF THE CARD  * DCL00290
                    *    ROUTINE IN THE CORE IMAGE LOADER.            * DCL00300
                    *                                                 * DCL00310
                    *EXITS-                                           * DCL00320
                    *   *NORMAL-                                      * DCL00330
                    *       *THE NORMAL EXIT IS TO THE WORD SPECIFIED * DCL00340
                    *        IN THE 54TH WORD IN THE END CARD.        * DCL00350
                    *                                                 * DCL00360
                    *   *ERROR-                                       * DCL00370
                    *       *N/A                                      * DCL00380
                    *                                                 * DCL00390
                    *TABLES/WORK AREAS-                               * DCL00400
                    *   *CL050-THIS WORD INDICATES WHEN A CARD        * DCL00410
                    *    READER IS BEING USED.                        * DCL00420
                    *       0 = NOT IN USE                            * DCL00430
                    *       NOT 0 = IN USE                            * DCL00440
                    *                                                 * DCL00450
                    *   *CL060-THIS WORD CONTAINS THE COUNT USED IN   * DCL00460
                    *    THE NEXT NON-ZERO CHECK SUM.                 * DCL00470
                    *                                                 * DCL00480
                    *   *CL110-THIS WORD IS USED TO HOLD THE A        * DCL00490
                    *    REGISTER WHEN INTERUPTS ARE BEING HANDLED.   * DCL00500
                    *                                                 * DCL00510
                    *   *CL270-THIS IS AN 81 WORD BUFFER USED TO READ * DCL00520
                    *    THE CARDS INTO WHILE LOADING THE PROGRAM.    * DCL00530
                    *                                                 * DCL00540
                    *NOTES-                                           * DCL00550
                    *   *ON ANY KIND OF AN ERROR (CARD READER OR CHECK* DCL00560
                    *    SUM) THE MACHINE WILL COME TO A WAIT WITH THE* DCL00570
                    *    CARD NUMBER (BINARY) TO BE LOADED DISPLAYED  * DCL00580
                    *    IN THE A REGISTER. IF ANY NON-CHECK SUMED    * DCL00590
                    *    CARDS PRECEDE THE CARD NUMBER INDICATED THEY * DCL00600
                    *    SHOULD BE LOADED ALSO.                       * DCL00610
                    *                                                 * DCL00620
                    *   *THE CORE IMAGE LOADER IS LOADED ABOVE /74    * DCL00630
                    *    AND IS MOVED TO THE ASSEMBLED LOCATIONS      * DCL00640
                    *    BEFORE EXECUTION.                            * DCL00650
                    *                                                 * DCL00660
                    *   *THE LOADER (LABEL CL275) CAN NOT BE LONGER   * DCL00670
                    *    THAN /D6 SO AS TO CONFORM TO THE OLD         * DCL00680
                    *    SPECIFICATIONS OF LENGTH.                    * DCL00690
                    *                                                 * DCL00700
                    *************************************************** DCL00710
                    *                                                   DCL00720
                    *   IOCCS                                           DCL00730
                    *                                                   DCL00740
                          ABS                                           DCL00750
                          ORG     4                                     DCL00760
                    CL010 EQU     *                                     DCL00770
                          DC      CL270     BUFFER ADDRESS OF IOCC      DCL00780
                    CL020 DC      /4E00     START FUNCTION OF IOCC      DCL00790
                          DC      *-*       BUFFER ADDRESS OF IOCC      DCL00800
                    CL030 DC      /1204     READ 1442 FUNCTION OF IOCC  DCL00810
                          DC      CL070     COLUMN INTERUPT ADDRESS     DCL00820
                    CL040 DC      /4F01     TEST FUNCTION OF IOCC       DCL00830
                    CL050 DC      *-*       CARD BUSY INDICATOP         DCL00840
                    CL060 DC      1         CARD COUNT                  DCL00850
                          DC      CL090     OP COMPLETE INTERUPT ADR    DCL00860
                    *                                                   DCL00870
                    *   HANDLE THE COLUMN INTERUPT                      DCL00880
                    *                                                   DCL00890
                    CL070 DC      *-*       LINK WORD                   DCL00900
                          STO     CL110     SAVE A REGISTER             DCL00910
                          MDX  L  CL030-1,1 INCREMENT READ              DCL00920
                          XIO     CL030-1   READ COLUMN                 DCL00930
                          XIO     CL040-1   SENSE 1442 DSW              DCL00940
                          LD      CL110     RESTORE A REGISTER          DCL00950
                          BOSC I  CL070     RETURN                      DCL00960
                    *                                                   DCL00970
                    *   HANDLE THE OPERATION COMPLETE INTERUPT          DCL00980
                    *                                                   DCL00990
                    CL080 LD      CL110     RESTORE A REGISTER          DCL01000
                          BOSC L  *-*       RETURN                      DCL01010
                          ORG     *-1                                   DCL01020
                    CL090 DC      *-*       LINK WORD                   DCL01030
                          STO     CL110     SAVE A REGISTER             DCL01040
                          XIO     CL040-1   SENSE DSW                   DCL01050
                          AND     CL120     CHECK FOR ERROR             DCL01060
                          STO     CL050     CLEAR IBUSY                 DCL01070
                          BSC  L  CL080,+-  BRANCH ON NO ERROR          DCL01080
                    CL100 LD      CL060     PUT CARD COUNT IN A REGISTR DCL01090
                          WAIT              WAIT TILL ERROR IS FIXED    DCL01100
                          BOSC L  CL140     BRANCH TO READ NEXT CARD    DCL01110
                    *                                                   DCL01120
                    *   CONSTANTS AND WORKING STORAGE                   DCL01130
                    *                                                   DCL01140
                    CL110 EQU     0         SAVE AREA 1                 DCL01150
                    CL120 DC      /2000     CONSTANT                    DCL01160
                    CL130 DC      1         CONSTANT                    DCL01170
                    *                                                   DCL01180
                    *   CLEAR CARD READ AREA                            DCL01190
                    *                                                   DCL01200
                    CL140 LDX   1 72        LOAD WORD COUNT             DCL01210
                          LD      CL130     LOAD INDICATOR BIT          DCL01220
                          STO  L1 CL270     STORE IN A WORD OF BUFFER   DCL01230
                          MDX   1 -1        DECREMENT WORD COUNT        DCL01240
                          MDX     *-4       BRANCH IF NOT ZERO          DCL01250
                    *                                                   DCL01260
                    *   START THE CARD READER                           DCL01270
                    *                                                   DCL01280
                    CL150 XIO     CL040-1   TEST 2501 DSW               DCL01290
                          BSC  L  CL150,E   BRANCH IF NOT READY         DCL01300
                          XIO     CL020-1   START 2501                  DCL01310
                          STX   0 CL050     SET CL050 ON                DCL01320
                    *                                                   DCL01330
                    *   INITIALIZE TO PACK UP THE INPUT AREA            DCL01340
                    *                                                   DCL01350
                          LD      CL020-1                               DCL01360
                          STO     CL030-1   INITIALIZE IOCC ADDRESS     DCL01370
                          LDX  L1 CL270+1   LOAD BUFFER ADDRESS         DCL01380
                          LDX  L2 CL270+1   LOAD BUFFER ADDRESS         DCL01390
                          LDX   3 72        LOAD COLUMN COUNT           DCL01400
                    *                                                   DCL01410
                    *   PACK THE INPUT AREA                             DCL01420
                    *                                                   DCL01430
                    CL160 LD    2 0         TEST IF COLUMN IN CORE      DCL01440
                          BSC  L  *-3,E     BRANCH IF NOT               DCL01450
                          LD    1 -1        LOAD LAST WORD              DCL01460
                    CL170 RTE     16        PLACE IN Q REGISTER         DCL01470
                          LD    2 0         LOAD NEW WORD               DCL01480
                    CL180 RTE     16        PLACE ON WORD BOUNDARY      DCL01490
                          STO   1 -1        STORE A REGISTER            DCL01500
                    RTEX3 RTE     16                                    DCL01510
                          STO   1 0         STORE Q REGISTER            DCL01520
                          MDX  L  CL180,-4  ALTER ROTATE INSTRUCTION    DCL01530
                          LD      CL180     TEST FOR END OF FOUR        DCL01540
                          SLA     12        ISOLATE SHIFT COUNT         DCL01550
                          BSC  L  CL200,Z   BRANCH IF NOT NEW SET       DCL01560
                          LD      RTEX3     INITIALIZE ROTATE           DCL01570
                          STO     CL180       INSTRUCTIONS              DCL01580
                          STO     CL170                                 DCL01590
                          MDX     CL210     BRANCH                      DCL01600
                    CL200 MDX   1 1         INCREMENT TO NEXT WORD      DCL01610
                          MDX  L  CL170,4   ALTER ROTATE INSTRUCTION    DCL01620
                    CL210 MDX   2 1         INCREMENT TO NEXT COLUMN    DCL01630
                          MDX   3 -1        DECREMENT COLUMN COUNT      DCL01640
                          MDX     CL160     BRANCH IF NOT ZERO          DCL01650
                    *                                                   DCL01660
                    *   CHECK SUM THE CARD FOR POSSIBLE ERRORS          DCL01670
                    *                                                   DCL01680
                          LD      CL270+2   LOAD CHECK SUM              DCL01690
                          BSC  L  CL230,+-  BRANCH IF ZERO              DCL01700
                          LDX   2 54        LOAD WORD COUNT             DCL01710
                          LD      CL060     LOAD CARD NUMBER            DCL01720
                    CL220 A    L2 CL270     ADD A WORD                  DCL01730
                          BSC     C         BRANCH NO CARRY             DCL01740
                          A       CL130     ADD 1 FOR CARRY             DCL01750
                          MDX   2 -1        DECREMENT WORD COUNT        DCL01760
                          MDX     CL220     BRANCH IF NOT ZERO          DCL01770
                          SRA     1         IS CHECK SUM 1              DCL01780
                          BSC  L  CL240,+-  BRANCH IF YES               DCL01790
                          LD      CL050     LOAD BUSY INDICATOR         DCL01800
                          BSC  L  *-3,Z     BRANCH IF CARD BUSY         DCL01810
                          MDX     CL100     BRANCH                      DCL01820
                    *                                                   DCL01830
                    *   CHECK TO SEE IF CARD IS DONE                    DCL01840
                    *                                                   DCL01850
                    CL230 MDX  L  CL060,-1  DECREMENT CARD COUNT BY 1   DCL01860
                          NOP               SKIPS ON CARD NUMBER 1      DCL01870
                    CL240 LD      CL270+3   LOAD CARD TYPE              DCL01880
                          BSC  L  CL250,-   BRANCH IF NOT LAST CARD     DCL01890
                          LD      CL050     LOAD BUSY INDICATOR         DCL01900
                          BSC  L  *-3,Z     BRANCH IF CARD BUSY         DCL01910
                    *                                                   DCL01920
                    *   MOVE  THE CARD TO THE CORRECT AREA              DCL01930
                    *                                                   DCL01940
                    CL250 LDX  L1 CL270+4   POINT AT FIRST WORD         DCL01950
                          LD    1 -1        SEPARATE WORD COUNT         DCL01960
                          SLA     1         (0000000XXXXXXXX0)          DCL01970
                          SRA     1         (00000000XXXXXXXX)          DCL01980
                          STO     *+1                                   DCL01990
                          LDX  L2 *-*       LOAD WORD COUNT             DCL02000
                          LDX  I3 CL270+1   POINT WERE DATA IS PLACED   DCL02010
                    CL260 LD    1 0                                     DCL02020
                          STO   3 0         MOVE  ONE WORD              DCL02030
                          MDX   1 1         INCREMENT POINTER           DCL02040
                          MDX   3 1         INCREMENT POINTER           DCL02050
                          MDX   2 -1        DECREMENT WORD COUNT        DCL02060
                          MDX     CL260     BRANCH IF NOT ZERO          DCL02070
                          MDX  L  CL060,1   INCREMENT CARD NUMBER       DCL02080
                    *                                                   DCL02090
                    *   CHECK LAST CARD OF DECK                         DCL02100
                    *                                                   DCL02110
                          LD      CL270+3   LOAD CARD TYPE              DCL02120
                          BSC  L  CL140,-   BRANCH IF NOT LAST CARD     DCL02130
                    *                                                   DCL02140
                    *   READY EXECUTION                                 DCL02150
                    *                                                   DCL02160
                          LDX  I3 CL270+53  LOAD INDEX REGISTER 3       DCL02170
                          BSC  I  CL270+54  BRANCH TO ROUTINE           DCL02180
                    *                                                   DCL02190
                    *   I/O BUFFER                                      DCL02200
                    *                                                   DCL02210
                    CL270 DC      80        WORD COUNT                  DCL02220
                    CL275 EQU     *+80      START OR CORE LOAD OF USER  DCL02230
                          HDNG    INITIALIZE AND MOVE  CIL              DCL02240
                    *                                                   DCL02250
                    *   THIS ROUTINE ADJUSTS THE CARD ROUTINE           DCL02260
                    *                                                   DCL02270
                    CL280 EQU     /73            LOADED ADDRESS         DCL02280
                    CL290 EQU     /3             EXECUTED ADDRESS       DCL02290
                    CL300 EQU     CL280-CL290    OFFSET PROGRAM IS MOVE DCL02300
                    CL310 EQU     CL270+1-CL010  SIZE OF AREA TO MOVE   DCL02310
                    CL320 EQU     *+CL300        ENTRY POINT            DCL02320
                          LD   L  /29                                   DCL02330
                          SRA     8                                     DCL02340
                          BSC  L  CL350+CL300,Z   BRANCH IF 2501        DCL02350
                    *                                                   DCL02360
                    *   READY FOR 1442                                  DCL02370
                    *                                                   DCL02380
                          LD      CL330                                 DCL02390
                          STO  L  CL020+CL300    INITIALIZE IOCC        DCL02400
                          LD      CL340                                 DCL02410
                          STO  L  CL040+CL300    INITIALIZE IOCC        DCL02420
                          MDX     CL350                                 DCL02430
                    CL330 DC      /1404          START 1442 IOCC FUNCT. DCL02440
                    CL340 DC      /1703          TEST 1442 IOCC FUNCT.  DCL02450
                    *                                                   DCL02460
                    *   THIS ROUTINE MOVES THE CORE IMAGE LOADER        DCL02470
                    *   FROM THE PLACE THAT IT IS LOADED TO LOW CORE    DCL02480
                    *                                                   DCL02490
                    CL350 LDX  L1 -CL310         LOAD WORD COUNT        DCL02500
                          LD   L1 CL280+CL310+1  MOVE A WORD            DCL02510
                          STO  L1 CL290+CL310+1                         DCL02520
                          MDX   1 1              DECREMENT WORD COUNT   DCL02530
                          MDX     *-6            BRANCH IF NOT ZERO     DCL02540
                          BSC  L  CL140     ENTER CORE IMAGE LOADER     DCL02550
                          END     CL320                                 DCL02560
