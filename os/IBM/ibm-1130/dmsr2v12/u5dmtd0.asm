                          HDNG    CALL DMTD0                            U5B00010
                    *************************************************** U5B00020
                    *                                                 * U5B00030
                    *   SUBROUTINE NAME-                              * U5B00040
                    *      FULL NAME- SELECTIVE DUMP ON TYPEWRITER    * U5B00050
                    *      CODE NAME- DMTD0                           * U5B00060
                    *               - DMTX0                           * U5B00070
                    *   PURPOSE-                                      * U5B00080
                    *      THIS 1130 SUBROUTINE DUMPS SELECTED AREAS  * U5B00090
                    *      OF MEMORY IN HEXIDECIMAL OR DECIMAL ALONG  * U5B00100
                    *      WITH STATUS IN FORMATION CONCERNING THE    * U5B00110
                    *      ACCUM.,EXTENSION,INDEX REGISTERS AND       * U5B00120
                    *      OVERFLOW AND CARRY INDICATORS.THE TYPE OF  * U5B00130
                    *      DUMP,HEX OR DECIMAL IS SPECIFIED BY THE    * U5B00140
                    *      CALL, DMTX0 FOR HEX AND DMTD0  DECIMAL.    * U5B00150
                    *      THE LINKAGE TO THE SUBROUTINE IS-          * U5B00160
                    *             CALL    DMTX0(DMTD0)                * U5B00170
                    *             DC      START                       * U5B00180
                    *             DC      END                         * U5B00190
                    *      WHERE .START. AND .END. ARE THE STARTING   * U5B00200
                    *      AND ENDING PARAMETERS OF THE DUMP.         * U5B00210
                    *   METHOD- N/A                                   * U5B00220
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U5B00230
                    *                                                 * U5B00240
                    *************************************************** U5B00250
                          ENT     DMTD0                                 U5B00260
                          ENT     DMTX0                                 U5B00270
                    *  SELECTIVE DUMP 1053 TYPEWRITER                   U5B00280
                    *                                                   U5B00290
                    *                                                   U5B00300
                    *                                                   U5B00310
                    *    SELECTIVE DUMP ROUTINE FOR 1053 TYPEWRITER     U5B00320
                    * THIS IS A LIBRARY SUBROUTINE DESIGNED TO DUMP     U5B00330
                    * SELECTED AREAS OF MEMORY WHILE EXECUTING AN       U5B00340
                    * OBJECT PROGRAM WITH A RETURN TO THE MAINLINE      U5B00350
                    * PROGRAM.                                          U5B00360
                    * DMTX0 IS THE HEXADECIMAL ENTRY TO THIS SUBROUTINE U5B00370
                    * DMTD0 IS THE DECIMAL ENTRY                        U5B00380
                    * LINKAGES TO THE SUBROUTINE ARE                    U5B00390
                    *     CALL    DMTX0 (DMTD0)                         U5B00400
                    *     DC      A (STARTING ADDRESS)                  U5B00410
                    *     DC      B (ENDING ADDRESS)                    U5B00420
                    * A AND B ARE SYMBOLIC OR ACTUAL OPERANDS           U5B00430
                    * REPRESENTING THE STARTING AND ENDING ADDRESSES    U5B00440
                    * OF THE DUMP                                       U5B00450
                    *                                                   U5B00460
                    *                                                   U5B00470
                    *                                                   U5B00480
                    *                                                   U5B00490
                    DMTD0 NOP                                           U5B00500
                          STD     AREG       SAVE ACC AND EXT           U5B00510
                          LD      DMTYD      LOAD LINK                  U5B00520
                          STO     DMTYX      STORE                      U5B00530
                          LD      DCIND      DECIMAL INDICATOR          U5B00540
                          STO     MODE       STORE IN MODE              U5B00550
                          MDX     STORE      GO SAVE CONDITIONS         U5B00560
                    *                                                   U5B00570
                    *                                                   U5B00580
                    *     THE FOLLOWING REGISTERS ARE STORED SO THAT    U5B00590
                    *     THEIR STATUS UPON ENTRY INTO THIS ROUTINE     U5B00600
                    *     WILL NOT BE DISTROYED BUT WILL BE LISTED AS   U5B00610
                    *     THE FIRST LINE OF THE DUMP. UPON THE          U5B00620
                    *     COMPLETION OF THE DUMP, THE REGISTERS WILL    U5B00630
                    *     BE RESET UPON EXIT FROM THE DUMP ROUTINE.     U5B00640
                    *                                                   U5B00650
                    *                                                   U5B00660
                          BSS  E  0          SET NEXT ADDRESS EVEN      U5B00670
                    AREG  DC      0          ACCUMULATOR                U5B00680
                    QREG  DC      0          Q REGISTER                 U5B00690
                    IRONE DC      0          INDEX REGISTER ONE         U5B00700
                    IRTWO DC      0          INDEX REGISTER TWO         U5B00710
                    IRTHR DC      0          INDEX REGISTER THREE       U5B00720
                    *                                                   U5B00730
                    *                                                   U5B00740
                    *     CONSTANTS FOR ADDRESSING ERROR BY USER        U5B00750
                    *                                                   U5B00760
                    *                                                   U5B00770
                    ERROR DC      9          NUMBER OF WORDS TO BE PRNT U5B00780
                          DC      /8121      CARRIER RETURN AND SPACE   U5B00790
                          DC      /3662      LETTERS .E. AND .R.        U5B00800
                          DC      /6252      LETTERS .R. AND .O.        U5B00810
                          DC      /6221      LETTERS .R. AND SPACE      U5B00820
                          DC      /2276      LETTERS .I. AND .N.        U5B00830
                          DC      /213E      LETTERS SPACE AND .A.      U5B00840
                          DC      /3232      LETTERS .D. AND .D.        U5B00850
                          DC      /6236      LETTERS .R. AND .E.        U5B00860
                          DC      /9A9A      LETTERS .S. AND .S.        U5B00870
                    D21   DC      DECBU      DECIMAL BFR FOR 1ST LINE   U5B00880
                    D22   DC      DEBUF      DECIMAL BFR FOR 2ND LINE   U5B00890
                    D23   DC      HEXBU      HEX BUFFER FOR 2ND LINE    U5B00900
                    D24   DC      HEBUF      HEX BUFFER FOR 1ST LINE    U5B00910
                    MODE  DC      0          TYPE OF DUMP               U5B00920
                    DCIND DC      1          DECIMAL DUMP INDICATOR     U5B00930
                    HXIND DC      0          HEXADECIMAL DUMP INDICATOR U5B00940
                    OFCON DC      2          WORD-COUNT OF MESSAGE      U5B00950
                          DC      /5212      LETTERS .OF.               U5B00960
                          DC      /1221      LETTERS .F SPACE.          U5B00970
                    ONCON DC      2          WORD-COUNT OF MESSAGE      U5B00980
                          DC      /5276      LETTERS .ON.               U5B00990
                          DC      /2121      TWO SPACES                 U5B01000
                    OFF   DC      OFCON      STATUS                     U5B01010
                    ON    DC      ONCON      STATUS                     U5B01020
                    TYPE0 DC      3          TYPE HEXADECIMALLY         U5B01030
                    HEXBU DC      0          OUTPUT BUFFER FOR          U5B01040
                          DC      0          *HEX.WORDS(2ND LINE)       U5B01050
                          DC      /2121      DOUBLE SPACE               U5B01060
                    TYPE1 DC      6          TYPE DECIMALLY             U5B01070
                          DC      /21FE      SPACE AND START. PARENT. ( U5B01080
                    DECBU DC      0          OUTPUT BUFFER              U5B01090
                          DC      0          *FOR                       U5B01100
                          DC      0          *DECIMAL WORDS(1ST LINE)   U5B01110
                          DC      /F621      END PARENT. AND SPACE      U5B01120
                          DC      /2121      DOUBLE SPACE               U5B01130
                    TYPE2 DC      4                                     U5B01140
                    DEBUF DC      0          OUTPUT BUFFER              U5B01150
                          DC      0          *FOR                       U5B01160
                          DC      0          *DECIMAL WORDS(2ND LINE)   U5B01170
                          DC      /2121      DOUBLE SPACE               U5B01180
                    TYPE3 DC      2                                     U5B01190
                    HEBUF DC      0          OUTPUT BUFFER FOR          U5B01200
                          DC      0          *HEX.WORDS(1ST LINE)       U5B01210
                    TY0   DC      TYPE0      HEXADECIMAL                U5B01220
                    TY1   DC      TYPE1      DECIMAL                    U5B01230
                    TY2   DC      TYPE2                                 U5B01240
                    TY3   DC      TYPE3                                 U5B01250
                    ACCUM DC      AREG                                  U5B01260
                    SEREG DC      AREG       RESETS ACCUM CONSTANT      U5B01270
                    DW    DC      DECWD                                 U5B01280
                    HW    DC      HEXWD                                 U5B01290
                    DECWD DC      0                                     U5B01300
                    HEXWD DC      0                                     U5B01310
                    DAD   DC      DECAD                                 U5B01320
                    HAD   DC      HEXAD                                 U5B01330
                    ENDAD DC      0          ENDING ADDRESS             U5B01340
                    BEGAD DC      0          BEGINNING ADDRESS          U5B01350
                    *                                                   U5B01360
                    *                                                   U5B01370
                    *     CARRIER RETURN ROUTINE AND PARAMETERS         U5B01380
                    *                                                   U5B01390
                    *                                                   U5B01400
                    CRRET NOP                                           U5B01410
                          LIBF    WRTY0      CALL TYPEWRITER SUBROUTINE U5B01420
                          DC      /2001      CARRIER RETURN             U5B01430
                          DC      CARET                                 U5B01440
                          BSC  I  CRRET      EXIT                       U5B01450
                    CARET DC      1          WORD COUNT                 U5B01460
                          DC      /8121      CARRIER RETURN AND SPACE   U5B01470
                    *                                                   U5B01480
                    *                                                   U5B01490
                    *     THIS ROUTINE WILL CONVERT THE ADDRESS AND THE U5B01500
                    *     CONTENTS OF THE ADDRESS TO HEXADECIMAL        U5B01510
                    *                                                   U5B01520
                    *                                                   U5B01530
                    HEXAD NOP                                           U5B01540
                          LD      HEXWD      WORD TO BE CONVERTED       U5B01550
                          LDX  L2 0          STORAGE LOCATIONS          U5B01560
                          BSI  L  BINHX      CONVERSION ROUTINE         U5B01570
                          BSI     BUSY       TEST 1053 TYPWTR. FOR BUSY U5B01580
                          BSI     PRIND      TYPE HEXADECIMALLY         U5B01590
                          BSI     BUSY       TEST 1053 BUSY             U5B01600
                          BSC  I  HEXAD      EXIT                       U5B01610
                    *                                                   U5B01620
                    *                                                   U5B01630
                    BUSY  NOP                                           U5B01640
                          LIBF    WRTY0      TEST TYPEWRITER            U5B01650
                          DC      0          BUSY                       U5B01660
                          MDX     BUSY+1     LOOP IF BUSY               U5B01670
                          BSC  I  BUSY       EXIT IF NOT BUSY           U5B01680
                    *                                                   U5B01690
                    *                                                   U5B01700
                    *     THIS ROUTINE WILL CONVERT THE ADDRESS TO      U5B01710
                    *     DECIMAL ONLY                                  U5B01720
                    *                                                   U5B01730
                    *                                                   U5B01740
                    DECAD NOP                                           U5B01750
                          LD      DECWD      WORD TO BE CONVERTED       U5B01760
                          LDX  L2 0          STORAGE LOCATIONS          U5B01770
                          BSI  L  BINDC      CONVERSION ROUTINE         U5B01780
                          BSI     BUSY       TEST 1053 TYPWTR. FOR BUSY U5B01790
                          BSI     PRIND      PRINT DECIMALLY            U5B01800
                          BSI     BUSY       TEST 1053 BUSY             U5B01810
                          BSC  I  DECAD      EXIT                       U5B01820
                    *                                                   U5B01830
                    *                                                   U5B01840
                    *     PRINT STATUS OF INDICATORS                    U5B01850
                    *                                                   U5B01860
                    *                                                   U5B01870
                    PRIND NOP                                           U5B01880
                          LIBF    WRTY0      CALL TYPEWRITER SUBROUTINE U5B01890
                          DC      /2001                                 U5B01900
                          DC      *-*        TYPE STATUS                U5B01910
                          BSC  I  PRIND                                 U5B01920
                    *                                                   U5B01930
                    *     HEXADECIMAL ENTRY TO DUMP SUBROUTINE          U5B01940
                    *                                                   U5B01950
                    *                                                   U5B01960
                    DMTX0 NOP                                           U5B01970
                          STD     AREG       SAVE ACC AND EXT           U5B01980
                          LD      HXIND      HEXADECIMAL INDICATOR      U5B01990
                          STO     MODE       STORE IN MODE              U5B02000
                    STORE STX   1 IRONE      SAVE XR1                   U5B02010
                          STX   2 IRTWO      SAVE XR2                   U5B02020
                          STX   3 IRTHR      SAVE XR3                   U5B02030
                          STS  L  STOC       OVERFLOW AND CARRY STORED  U5B02040
                    *                                                   U5B02050
                    *                                                   U5B02060
                    *     SETUP START, END AND RETURN ADDRESSES         U5B02070
                    *                                                   U5B02080
                    *                                                   U5B02090
                          LD   I  DMTYX                                 U5B02100
                          STO     BEGAD      STARTING ADDRESS           U5B02110
                          MDX  L  DMTYX,1    INCREMENT BY 1             U5B02120
                          LD   I  DMTYX                                 U5B02130
                          STO     ENDAD      ENDING ADDRESS             U5B02140
                          MDX  L  DMTYX,1    INCREMENT BY 1 (RET. ADDR) U5B02150
                          BSI     BUSY       TEST 1053 BUSY             U5B02160
                          BSI     CRRET      CARRIER RETURN             U5B02170
                    *                                                   U5B02180
                    *     INVALID ADDRESS TEST.                         U5B02190
                    *                                                   U5B02200
                    *                                                   U5B02210
                          LD      ENDAD                                 U5B02220
                          S       BEGAD                                 U5B02230
                          BSC  L  TSOFL,-    BR IF ADDRESSES OK         U5B02240
                          LIBF    WRTY0      CALL TYPEWRITER            U5B02250
                          DC      /2001      TYPE ERROR MESSAGE         U5B02260
                          DC      ERROR                                 U5B02270
                          BSC  L  FINSH      GO EXIT                    U5B02280
                    *                                                   U5B02290
                    *                                                   U5B02300
                    *     TEST OVERFLOW AND CARRY INDICATORS            U5B02310
                    *                                                   U5B02320
                    *                                                   U5B02330
                    TSOFL LD   L  STOC       LOAD INDICATOR (OVERFLOW)  U5B02340
                          SLA     15                                2-6 U5B02350
                          BSC  L  OVON,+Z    BRANCH IF ON               U5B02360
                          BSI     BUSY       TEST FOR BUSY              U5B02370
                          LD      OFF        STATUS OF OVERFLOW         U5B02380
                          STO     PRIND+3                               U5B02390
                          BSI     PRIND      PRINT STATUS               U5B02400
                    TSCAR BSI     BUSY       TEST 1053 BUSY             U5B02410
                          LD   L  STOC       LOAD CARRY INDICATOR       U5B02420
                          SLA     14                                2-6 U5B02430
                          BSC  L  CAON,+Z    BRANCH IF ON               U5B02440
                          BSI     BUSY       TEST BUSY                  U5B02450
                          LD      OFF        SET TO PRINT               U5B02460
                          STO     PRIND+3    LETTER .OFF.               U5B02470
                          BSI     BUSY       TEST BUSY                  U5B02480
                          BSI     PRIND      GO PRINT A WORD            U5B02490
                          MDX     REGTR      GO DO REGISTERS            U5B02500
                    OVON  BSI     BUSY       TEST BUSY                  U5B02510
                          LD   L  ON         SET UP TO                  U5B02520
                          STO     PRIND+3    *PRINT LETTER .ON.         U5B02530
                          BSI     PRIND      GO TO PRINT SUBR           U5B02540
                          MDX     TSCAR      GO TEST CARRY INDICATOR    U5B02550
                    CAON  BSI     BUSY       CHECK TYPEWRITER BUSY      U5B02560
                          LD   L  ON         SET UP TO                  U5B02570
                          STO     PRIND+3    *PRINT .ON.                U5B02580
                          BSI     PRIND      GO PRINT                   U5B02590
                          BSI     BUSY       TEST TYPEWRITER BUSY       U5B02600
                    *                                                   U5B02610
                    *                                                   U5B02620
                    *     CONVERT ACC,EXT,XR1,XR2,XR3, TO               U5B02630
                    *     HEXADECIMAL AND DECIMAL FORM FOR FIRST LINE.  U5B02640
                    *                                                   U5B02650
                    REGTR BSI  L  BUSY       TEST 1053 BUSY             U5B02660
                          LDX   1 5          5 REGISTERS TO PRINT       U5B02670
                    REGIS BSI  L  BUSY       TEST 1053 BUSY             U5B02680
                          LD   I  ACCUM      1ST WORD OF ADDRESS        U5B02690
                          STO     HEXWD      AREG TO HEXADECIMAL        U5B02700
                          STO     DECWD      AREG TO DECIMAL            U5B02710
                          LD   L  TY3                                   U5B02720
                          STO     PRIND+3                               U5B02730
                          LD   L  D24                                   U5B02740
                          STO  L  HEXAD+3                               U5B02750
                          BSI     HEXAD      CONVERT TO HEX             U5B02760
                          BSI     BUSY       TEST 1053 BUSY             U5B02770
                          LD   L  TY1                                   U5B02780
                          STO     PRIND+3    SET UP PRINT BUFFER        U5B02790
                          LD   L  D21                                   U5B02800
                          STO  L  DECAD+3                               U5B02810
                          BSI     DECAD      CONVERT TO DECIMAL         U5B02820
                          MDX  L  ACCUM,1    NEXT REGISTER              U5B02830
                          MDX   1 -1         ARE WE FINISHED, YES SKIP  U5B02840
                          MDX     REGIS      NO,DO NEXT                 U5B02850
                          BSI  L  CRRET      CARRIER RETURN             U5B02860
                          BSI  L  CRRET      CARRIER RETURN             U5B02870
                          LD   L  SEREG      RESET ACCUM CONSTANT       U5B02880
                          STO  L  ACCUM      STORAGE                    U5B02890
                    *                                                   U5B02900
                    *                                                   U5B02910
                    * LINE ADDRESS ALWAYS HEXADECIMAL.                  U5B02920
                    *                                                   U5B02930
                    *                                                   U5B02940
                          BSI     BUSY       CHECK BUSY                 U5B02950
                    ADCON LD   L  BEGAD      ADDRESS OF WORD            U5B02960
                          STO  L  HEXWD                                 U5B02970
                          BSI  L  BUSY       TEST 1053 BUSY             U5B02980
                          LD   L  TY0        SET UP TO                  U5B02990
                          STO     PRIND+3    *PRINT                     U5B03000
                          LD   L  D23        *HEXADECIMAL               U5B03010
                          STO  L  HEXAD+3    ADDRESS OF LINE            U5B03020
                          BSI  L  HEXAD      GO CONVERT AND PRINT       U5B03030
                    *                                                   U5B03040
                    *                                                   U5B03050
                    *     TEST FOR THE TYPE OF DUMP THAT HAS BEEN       U5B03060
                    *     REQUESTED BY THE USER FROM MAINLINE PROGRAM.  U5B03070
                    *                                                   U5B03080
                    *                                                   U5B03090
                          LD   L  MODE       TYPE OF DUMP               U5B03100
                          BSC  L  DESML,Z    DECIMAL IF NOT ZERO        U5B03110
                    NEWLN LDX   1 8          8 WORDS PER LINE           U5B03120
                    NEXT  LD   I  BEGAD      GET CONTENTS OF ADDRESS    U5B03130
                          STO  L  HEXWD                                 U5B03140
                          BSI  L  BUSY       TEST 1053 BUSY             U5B03150
                          LD   L  TY0        SET UP                     U5B03160
                          STO  L  PRIND+3    *HEX BUFFER                U5B03170
                          LD   L  D23        *TO PRINT                  U5B03180
                          STO  L  HEXAD+3    ONE HEX WORD               U5B03190
                          BSI  L  HEXAD      GO CONVERT AND PRINT       U5B03200
                          MDX  L  BEGAD,1    NEXT WORD                  U5B03210
                          MDX   1 -1         DECREMENT LINE COUNT       U5B03220
                          MDX     NEXT       NEXT WORD IF NOT DONE      U5B03230
                    *                                                   U5B03240
                    *                                                   U5B03250
                    *     TEST FOR END OF DUMP                          U5B03260
                    *                                                   U5B03270
                    *                                                   U5B03280
                    ADTES LD   L  ENDAD                                 U5B03290
                          S    L  BEGAD                                 U5B03300
                          BSC  L  INCPL,-    BR IF NOT DONE             U5B03310
                    FINSH LDD  L  AREG       RESTORE ACC AND EXT        U5B03320
                          LDX  I1 IRONE      RESTORE XR1                U5B03330
                          LDX  I2 IRTWO      RESTORE  XR2               U5B03340
                    STOC  LDS     0          RESTORE STATUS             U5B03350
                          BSI  L  CRRET      CARRIER RETURN             U5B03360
                          BSI  L  BUSY       TEST 1053 BUSY             U5B03370
                          BSC  I  DMTYX      EXIT TO MAINLINE           U5B03380
                    INCPL BSI  L  CRRET      CARRIER RETURN             U5B03390
                          MDX     ADCON      NEXT LINE                  U5B03400
                    DESML LDX   1 8          8 WORDS PER LINE           U5B03410
                    MORI  LD   I  BEGAD      GET WORD TO BE DUMPED      U5B03420
                          STO  L  DECWD      STORE IN DECIMAL BUFFER    U5B03430
                          BSI  L  BUSY       BUSY TEST                  U5B03440
                          LD   L  TY2        SET UP TO                  U5B03450
                          STO  L  PRIND+3    *PRINT                     U5B03460
                          LD   L  D22        *DECIMAL                   U5B03470
                          STO  L  DECAD+3    *WORD                      U5B03480
                          BSI  L  DECAD      GO CONVERT AND PRINT       U5B03490
                          MDX  L  BEGAD,1    NEXT WORD TO DUMP          U5B03500
                          MDX   1 -1         SKIP IF 8 WORDS DONE       U5B03510
                          MDX     MORI       DO NEXT WORD               U5B03520
                          MDX     ADTES      GO DO NEXT LINE            U5B03530
                    *                                                   U5B03540
                    *     BINARY TO HEXIDECIMAL CONVERSION SUBR         U5B03550
                    *                                                   U5B03560
                    BINHX BSS     1          RESERVE ONE WORD           U5B03570
                          RTE     16         ROTATE A+Q, A STORED IN Q  U5B03580
                          LD      D192       NO. FOR HEX CHAR. COUNT    U5B03590
                          STO     COUNT      COUNT = 192                U5B03600
                          LD      D9         FOR EVEN OR ODD TEST       U5B03610
                          STO     PART       PART = 9                   U5B03620
                          LD      ZERO                                  U5B03630
                          STO   2 0          CLEAR HEX BUF. 1           U5B03640
                          STO   2 1          CLEAR HEX BUF. 2           U5B03650
                    A     LD      ZERO                                  U5B03660
                          SLT     4          SHIFT 1ST 4 BITS IN ACCUM. U5B03670
                          A       ADDR       MODIFY FOR TABLE LOOKUP    U5B03680
                          STO     *+1                                   U5B03690
                          LD   L  0          GET CHARACTER              U5B03700
                          STO     TEMP                                  U5B03710
                          MDX  L  PART,1     WHICH PART OF PART         U5B03720
                          LD      PART                                  U5B03730
                          BSC  L  B,E        BR IF RIGHT HALF           U5B03740
                          MDX   2 1          MOVE POINTER               U5B03750
                          LD      TEMP                                  U5B03760
                          SLA     8          SHIFT IN 1ST PART          U5B03770
                          MDX     C                                     U5B03780
                    B     LD      TEMP                                  U5B03790
                    C     A     2 -1         COMBINE 2 CHARACTERS       U5B03800
                          STO   2 -1         STORE IN OUTPUT BUFFER     U5B03810
                          MDX  L  COUNT,-48  DECR CHARACTER COUNT BY 1  U5B03820
                          MDX     A          RETURN TO A FOR NEXT CHAR  U5B03830
                          BSC  I  BINHX      EXIT                       U5B03840
                    ZERO  DC      0          CONST ZERO                 U5B03850
                    D9    DC      9          RIGHT-LEFT INDR  INIT      U5B03860
                    D192  DC      192        CHAR COUNT--4*48           U5B03870
                    PART  DC      0          RIGHT/LEFT INDR            U5B03880
                    COUNT DC      0          WORD TO STORE CHAR COUNT   U5B03890
                    TEMP  DC      0          TEMP BUFFER FOR 2 CHARS    U5B03900
                    ADDR  DC      TYTAB      TABLES                     U5B03910
                    TYTAB DC      196        = 0                        U5B03920
                          DC      252        = 1                        U5B03930
                          DC      216        = 2                        U5B03940
                          DC      220        = 3                        U5B03950
                          DC      240        = 4                        U5B03960
                          DC      244        = 5                        U5B03970
                          DC      208        = 6                        U5B03980
                          DC      212        = 7                        U5B03990
                          DC      228        = 8                        U5B04000
                          DC      224        = 9                        U5B04010
                          DC      62         =A                         U5B04020
                          DC      26         =B                         U5B04030
                          DC      30         =C                         U5B04040
                          DC      50         =D                         U5B04050
                          DC      54         =E                         U5B04060
                          DC      18         =F                         U5B04070
                    BINDC BSS     1          BIN TO DECIMAL CONVERSION  U5B04080
                          STO     TEMP       STORE BINARY VALUE         U5B04090
                          LD      D10                                   U5B04100
                          STO     COUNT      COUNT = 10                 U5B04110
                          LD      D9         INITIALIZE                 U5B04120
                          STO     PART       *RIGHT-LEFT HALF INDR      U5B04130
                          SRA     16                                    U5B04140
                    CLEAR STO   2 0          CLEAR DECIMALS BUFFERS     U5B04150
                          STO   2 1                                     U5B04160
                          STO   2 2                                     U5B04170
                          LD      TEMP                                  U5B04180
                          BSC  L  G,+Z       BR IF NUMBER IS NEG        U5B04190
                          LD      PLUS       IS POSITIVE,STORE          U5B04200
                          STO   2 0          *PLUS SIGN IN BUFFER       U5B04210
                          MDX     H          GO CONVERT                 U5B04220
                    G     LD      MINUS      NUMBER IS NEG,STORE        U5B04230
                          STO   2 0          *MINUS SIGN IN BUFFER      U5B04240
                          SRA     16         INVERT                     U5B04250
                          S       TEMP       *NUMBER                    U5B04260
                          BSC     +          OK IF POSITIVE             U5B04270
                          LD      H7FFF      SET NUMBER TO 32767        U5B04280
                          STO     TEMP                                  U5B04290
                    H     LD      TEMP       SHIFT BINARY VALUE         U5B04300
                          SRT     16         *TO EXTENSION              U5B04310
                          D       D10        DIVIDE BY 10               U5B04320
                          STO     TEMP       STORE QUOTIENT             U5B04330
                          RTE     16         REMAINDER TO ACCUM         U5B04340
                          BSC     O                                     U5B04350
                          A       D1                                    U5B04360
                          A       ADDR       GET ADDR OF CHAR IN TABLE  U5B04370
                          STO     *+1                                   U5B04380
                          LD   L  0          LOAD CHARACTER             U5B04390
                          RTE     16         SAVE IN EXT                U5B04400
                          LD      PART       RIGHT OR LEFT SIDE         U5B04410
                          BSC     E          SKIP IF LEFT               U5B04420
                          RTE     8          NO SKIP IF RIGHT           U5B04430
                          RTE     8                                     U5B04440
                          A     2 2          COMBINE CHARACTER          U5B04450
                          STO   2 2          STORE IN BUFFER            U5B04460
                          MDX  L  PART,1     STEP  INDICATOR            U5B04470
                          LD      PART                                  U5B04480
                          BSC     E                                     U5B04490
                          MDX   2 -1         STEP BUFFER POINTER IF ODD U5B04500
                          MDX  L  COUNT,-2   DECR COUNT,SKIP IF 5 CHARS U5B04510
                          MDX     H          *DONE,IF NOT,DO NXT CHAR   U5B04520
                          BSC  I  BINDC      EXIT                       U5B04530
                    H7FFF DC      /7FFF      CONST TO TEST -32768       U5B04540
                    D1    DC      1          CONST 1                    U5B04550
                    D10   DC      10         CONST FOR BIN/DEC CONV     U5B04560
                    PLUS  DC      /DA00      PLUS SIGN                  U5B04570
                    MINUS DC      /8400      MINUS SIGN                 U5B04580
                    DMTYX EQU     DMTX0                                 U5B04590
                    DMTYD EQU     DMTD0                                 U5B04600
                          END     DMTD0                                 U5B04610
