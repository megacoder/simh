                          HDNG    CALL DMPD1                            U5C00010
                    *************************************************** U5C00020
                    *                                                 * U5C00030
                    *   SUBROUTINE NAME-                              * U5C00040
                    *      FULL NAME- SELECTIVE DUMP ON 1132 PRINTER  * U5C00050
                    *      CODE NAME- DMPD1                           * U5C00060
                    *               - DMPX1                           * U5C00070
                    *   PURPOSE-                                      * U5C00080
                    *      THIS 1130 SUBROUTINE DUMPS SELECTED AREAS  * U5C00090
                    *      OF MEMORY IN HEXIDECIMAL OR DECIMAL ALONG  * U5C00100
                    *      WITH STATUS IN FORMATION CONCERNING THE    * U5C00110
                    *      ACCUM.,EXTENSION,INDEX REGISTERS AND       * U5C00120
                    *      OVERFLOW AND CARRY INDICATORS.THE TYPE OF  * U5C00130
                    *      DUMP,HEX OR DECIMAL IS SPECIFIED BY THE    * U5C00140
                    *      CALL, DMPX1 FOR HEX AND DMPD1  DECIMAL.    * U5C00150
                    *      THE LINKAGE TO THE SUBROUTINE IS-          * U5C00160
                    *             CALL    DMPX1(DMPD1)                * U5C00170
                    *             DC      START                       * U5C00180
                    *             DC      END                         * U5C00190
                    *      WHERE .START. AND .END. ARE THE STARTING   * U5C00200
                    *      AND ENDING PARAMETERS OF THE DUMP.         * U5C00210
                    *   METHOD- N/A                                   * U5C00220
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U5C00230
                    *                                                 * U5C00240
                    *************************************************** U5C00250
                          ENT     DMPD1                                 U5C00260
                          ENT     DMPX1                                 U5C00270
                    * SELECTIVE DUMP 1132 PRINTER                       U5C00280
                    * THIS IS A LIBRARY SUBROUTINE DESIGNED TO DUMP     U5C00290
                    * AREAS OF MEMORY WHILE EXECUTING AN OBJECT PROGRAM U5C00300
                    * WITH A RETURN TO THE MAINLINE PROGRAM. ENTRY TO   U5C00310
                    * THIS ROUTINE FOR HEXADECIMAL OUTPUT IS DMPX1,     U5C00320
                    * FOR DECIMAL OUTPUT, THE ENTRY IS DMPD1. LINKAGES  U5C00330
                    * TO THE SUBROUTINES ARE .                          U5C00340
                    *     CALL    DMPX1 (DMPD1)                         U5C00350
                    *     DC      A     STARTING ADDRESS                U5C00360
                    *     DC      B     ENDING ADDRESS                  U5C00370
                    * WHERE A AND B ARE SYMBOLIC OR ACTUAL OPERANDS.    U5C00380
                    *                                                   U5C00390
                    *                                                   U5C00400
                    DMPD1 NOP                                           U5C00410
                          STD  L  AREG       STORE ACC AND EXT          U5C00420
                          LD      DMPRD      LOAD LINK                  U5C00430
                          STO     DMPRX      STORE                      U5C00440
                          LD      DCIND      DECIMAL INDICATOR          U5C00450
                          STO  L  MODE       STORE IN MODE              U5C00460
                          MDX     STORY      GO SAVE INDEX REGISTERS    U5C00470
                    *                                                   U5C00480
                    *                                                   U5C00490
                    * DUMP INDICATOR CONSTANTS                          U5C00500
                    *                                                   U5C00510
                    HXIND DC      0          HEXADECIMAL DUMP INDICATOR U5C00520
                    DCIND DC      1          DECIMAL DUMP INDICATOR     U5C00530
                    *                                                   U5C00540
                    *                                                   U5C00550
                    * HEXADECIMAL ENTRY TO DUMP SUBROUTINE              U5C00560
                    *                                                   U5C00570
                    *                                                   U5C00580
                    DMPX1 NOP                                           U5C00590
                          STD  L  AREG       A AND Q CONTENTS STORED    U5C00600
                          LD      HXIND      HEXADECIMAL INDICATOR      U5C00610
                          STO  L  MODE       STORE IN MODE              U5C00620
                    STORY STX  L1 IRONE      SAVE XR1                   U5C00630
                          STX  L2 IRTWO      SAVE XR2                   U5C00640
                          STX  L3 IRTHR      SAVE XR3                   U5C00650
                          STS  L  STOC       OVERFLOW AND CARRY STORED  U5C00660
                    *                                                   U5C00670
                    *                                                   U5C00680
                    * SETUP START, END AND RETURN ADDRESSES.            U5C00690
                    *                                                   U5C00700
                          LD   I  DMPRX      OBTAIN                     U5C00710
                          STO  L  BEGAD      *STARTING ADDRESS          U5C00720
                          MDX  L  DMPRX,1    NEXT WORD OF CALL          U5C00730
                          LD   I  DMPRX      *PARAMETER TO GET          U5C00740
                          STO  L  ENDAD      *ENDING ADDRESS            U5C00750
                          MDX  L  DMPRX,1    RETURN TO USER ADDRESS     U5C00760
                    *                                                   U5C00770
                    * INVALID ADDRESS TEST                              U5C00780
                    *                                                   U5C00790
                          BSI  L  SKIP       SKIP TO CHANNEL 1          U5C00800
                          BSI  L  BUSY      TEST THE 1132 FOR BUSY      U5C00810
                          BSI  L  CLBUF     CLEAR BUFFER                U5C00820
                          LD   L  ENDAD     ENDING ADDRESS              U5C00830
                          S    L  BEGAD     STARTING ADDRESS            U5C00840
                          BSC  L  TSOFL,-   ADDRESSES VALID             U5C00850
                          LDX  L1 PRINT     SETUP BUFFER ADDR. IN IR1   U5C00860
                          LD      ERROR     NO, INVALID                 U5C00870
                          STO  L  PCTR      SET COUNT OF 9 WORDS        U5C00880
                          STO  L  PRINT     WORD COUNT                  U5C00890
                          LD      ERMES     ERROR MESSAGE               U5C00900
                          STO  L  STWRD     WORD TO BE STORED           U5C00910
                          BSI  L  STORE     STORING ROUTINE             U5C00920
                          LIBF    PRNT1     TO  PRINT SUBROUTINE        U5C00930
                          DC      /2000     * TO PRINT A LINE           U5C00940
                          DC      PRINT     PRINTING AREA               U5C00950
                          DC      MSTKE     ERROR ADDRESS               U5C00960
                          BSI  L  BUSY      TEST 1132 PRINTER FOR BUSY  U5C00970
                          BSC  L  FINSH     EXIT TO USER MAINLINE       U5C00980
                    MSTKE NOP               PRINTER  ERROR ROUTINE      U5C00990
                          BSC  I  MSTKE     *RETURN W/ ACC NONZERO      U5C01000
                    *                                                   U5C01010
                    * CONSTANTS FOR ERROR MESSAGE                       U5C01020
                    *                                                   U5C01030
                    ERROR DC      9         WORD COUNT                  U5C01040
                          DC      /C5D9     LETTERS   E   AND   R       U5C01050
                          DC      /D9D6     LETTERS   R   AND   O       U5C01060
                          DC      /D940     LETTERS   R   AND SPACE     U5C01070
                          DC      /C9D5     LETTERS   I   AND   N       U5C01080
                          DC      /40C1     LETTERS SPACE AND   A       U5C01090
                          DC      /C4C4     LETTERS   D   AND   D       U5C01100
                          DC      /D9C5     LETTERS   R   AND   E       U5C01110
                          DC      /E2E2     LETTERS   S   AND   S       U5C01120
                          DC      /4040     DOUBLE SPACE                U5C01130
                    ERMES DC      ERROR+1   ERROR MESSAGE               U5C01140
                    *                                                   U5C01150
                    * TEST OVERFLOW AND CARRY INDICATORS                U5C01160
                    *                                                   U5C01170
                    TSOFL LDX  L1 PRINT     PRINT BUFFER IN IR1         U5C01180
                          LD   L  STOC      OVERFLOW INDICATOR          U5C01190
                          SLA     15                                2-6 U5C01200
                          BSC  L  OVON,+Z   OVERFLOW ON                 U5C01210
                          LD      D2        NO, OVERFLOW OFF            U5C01220
                          STO  L  PCTR      WORD COUNT                  U5C01230
                          LD      OFF       OFF INDICATOR FORMAT        U5C01240
                          STO  L  STWRD     WORDS TO BE STORED          U5C01250
                          BSI  L  STORE     STORING ROUTINE             U5C01260
                    TSCAR LD   L  STOC      CARRY INDICATOR             U5C01270
                          SLA     14                                2-6 U5C01280
                          BSC  L  CAON,+Z   CARRY ON                    U5C01290
                          LD      D2        NO, CARRY OFF               U5C01300
                          STO  L  PCTR      WORD COUNT                  U5C01310
                          LD      OFF       OFF INDICATOR FORMAT        U5C01320
                          STO  L  STWRD     WORDS TO BE STORED          U5C01330
                          BSI  L  STORE     STORING ROUTINE             U5C01340
                          MDX     AQIRS     GO TO REGISTERS             U5C01350
                    OVON  LD      D2        OVERFLOW ON                 U5C01360
                          STO  L  PCTR      WORD COUNT                  U5C01370
                          LD      ON        ON INDICATOR FORMAT         U5C01380
                          STO  L  STWRD     WORDS TO BE STORED          U5C01390
                          BSI  L  STORE     STORING ROUTINE             U5C01400
                          MDX     TSCAR     TEST CARRY INDICATOR        U5C01410
                    CAON  LD      D2        CARRY ON                    U5C01420
                          STO  L  PCTR      WORD COUNT                  U5C01430
                          LD      ON        ON INDICATOR FORMAT         U5C01440
                          STO  L  STWRD     WORDS TO BE STORED          U5C01450
                          BSI     STORE     STORING ROUTINE             U5C01460
                          MDX     AQIRS     GO PROCESS REGISTERS        U5C01470
                    *                                                   U5C01480
                    * OVERFLOW AND CARRY INDICATORS CONSTANTS           U5C01490
                    *                                                   U5C01500
                    D2    DC      2         WORD COUNT                  U5C01510
                    *                                                   U5C01520
                    * INDICATOR OFF FORMAT                              U5C01530
                    *                                                   U5C01540
                    OFF   DC      OFCON     *ADDR OF LETTERS O-F-F-     U5C01550
                    OFCON DC      /D6C6     LETTERS   O   AND   F       U5C01560
                          DC      /C640     LETTERS   F   AND SPACE     U5C01570
                    *                                                   U5C01580
                    * INDICATOR ON FORMAT                               U5C01590
                    *                                                   U5C01600
                    ON    DC      ONCON     *ADDRESS OF LETTERS O-N-    U5C01610
                    ONCON DC      /D6D5     LETTERS   O   AND   N       U5C01620
                          DC      /4040     DOUBLE SPACE                U5C01630
                    *                                                   U5C01640
                    *                                                   U5C01650
                    * REGISTERS OUTPUT FORMAT                           U5C01660
                    *  XXXXBB(+ OR - XXXXX)BBB                          U5C01670
                    *                                                   U5C01680
                    *                                                   U5C01690
                    * ROUTINE TO CHANGE THE REGISTERS TO                U5C01700
                    * HEXADECIMAL AND DECIMAL FORMAT                    U5C01710
                    *                                                   U5C01720
                    *                                                   U5C01730
                    AQIRS LD      D44       LENGTH OF REGISTER BUFFER   U5C01740
                          STO  L  PRINT     WORD COUNT                  U5C01750
                          LD      D5        DO 5 REGISTERS              U5C01760
                          STO     REGCR     SET COUNTER TO 5            U5C01770
                    HERE  LD   I  AR        FIRST REGISTER              U5C01780
                          STO     HEXWD     SET HEX CONVERSION          U5C01790
                          STO     DECWD     SET DEC CONVERSION          U5C01800
                          LDX  L2 HEXAW     SET IR2 FOR BINHX ROUTINE   U5C01810
                          BSI  L  BINHX     CONVERT WORD TO HEX         U5C01820
                          LD      D3        WORD COUNT OF 3             U5C01830
                          STO     PCTR      WORD COUNTER                U5C01840
                          LD      EXAW      HEX FORMAT                  U5C01850
                          STO     STWRD     WORD TO STORED              U5C01860
                          BSI     STORE     STORING ROUTINE             U5C01870
                          LDX  L2 DECAW     SET IR2 FOR BINDC ROUTINE   U5C01880
                          BSI  L  BINDC     CONVERT WORD TO DECIMAL     U5C01890
                          LD      D5        WORD COUNT OF 5             U5C01900
                          STO     PCTR      WORD COUNTER                U5C01910
                          LD      ECAW      DECIMAL FORMAT              U5C01920
                          STO     STWRD     WORDS TO BE STORED          U5C01930
                          BSI     STORE     STORING ROUTINE             U5C01940
                          MDX  L  AR,1      PICKUP NEXT REGISTER        U5C01950
                          MDX  L  REGCR,-1  DECREMENT REGISTER COUNTER  U5C01960
                          MDX     HERE      LOOP                        U5C01970
                          LIBF    PRNT1     TO  PRINTER SUBR TO         U5C01980
                          DC      /2000     **PRINT A LINE              U5C01990
                          DC      PRINT     PRINTING AREA               U5C02000
                          DC      MSTKE     ERROR ADDRESS               U5C02010
                          BSI  L  BUSY      BUSY ROUTINE                U5C02020
                          LD      ARRST     RESET POINTER               U5C02030
                          STO     AR        STORE                       U5C02040
                          BSI  L  CLBUF     CLEAR BUFFER                U5C02050
                          LIBF    PRNT1     *TO PRINTER SUBR FOR        U5C02060
                          DC      /3D00     * ONE EXTRA LINE SPACE      U5C02070
                          BSI  L  BUSY      *CHECK PRINTER BUSY         U5C02080
                          MDX     LNAD      GO PROCESS LINE ADDRESS     U5C02090
                    *                                                   U5C02100
                    * CONSTANTS FOR REGISTERS FORMAT                    U5C02110
                    *                                                   U5C02120
                    *                                                   U5C02130
                          BSS  E  0                                     U5C02140
                    AREG  DC      0         *ACCUMULATOR                U5C02150
                    QREG  DC      0         *Q REGISTER STORED          U5C02160
                    IRONE DC      0         XR1         STORED          U5C02170
                    IRTWO DC      0         XR2         STORED          U5C02180
                    IRTHR DC      0         XR3         STORED          U5C02190
                    BEGAD DC      0         *STARTING ADDRESS           U5C02200
                    ENDAD DC      0         *ENDING   ADDRESS           U5C02210
                    D44   DC      44        REGISTER BUFFER LENGTH      U5C02220
                    D5    DC      5         DECIMAL 5                   U5C02230
                    REGCR DC      0         REGISTER COUNTER            U5C02240
                    AR    DC      AREG      FIRST WORD                  U5C02250
                    HEXWD DC      0         TEMP HEX STORAGE            U5C02260
                    DECWD DC      0         TEMP DEC STORAGE            U5C02270
                    D3    DC      3         DECIMAL 3                   U5C02280
                    EXAW  DC      HEXAW     CONSTANT FOR HEX FORMAT     U5C02290
                    HEXAW DC      0         FIRST SET OF HEX CHARACTERS U5C02300
                          DC      0         SECONDSET OF HEX CHARACTERS U5C02310
                          DC      /404D     BLANK & LEFT PAREN          U5C02320
                    ECAW  DC      DECAW     CONSTANT FOR DEC FORMAT     U5C02330
                    DECAW DC      0         FIRST SET OF DEC CHARACTERS U5C02340
                          DC      0         SECONDSET OF DEC CHARACTERS U5C02350
                          DC      0         THIRD SET OF DEC CHARACTERS U5C02360
                          DC      /5D40     END PARENTHESIS AND SPACE   U5C02370
                          DC      /4040     DOUBLE SPACE                U5C02380
                    ARRST DC      AREG      ADDRESS WHERE ACC STORED    U5C02390
                    *                                                   U5C02400
                    * CLEAR BUFFER ROUTINE                              U5C02410
                    *                                                   U5C02420
                    CLBUF NOP                                           U5C02430
                          LDX  L1 PRINT-1   SETUP BUFFER ADDRESS        U5C02440
                          LD      CLCNT     LOAD COUNT                  U5C02450
                          STO     CLCTR     WORDS TO BE CLEARED         U5C02460
                    CLEAN LD      D0        LOAD ZERO                   U5C02470
                          STO   1 1         STORE ZERO VIA IR1          U5C02480
                          MDX   1 1         INCREMENT IR1               U5C02490
                          MDX  L  CLCTR,-1  DECREMENT COUNTER           U5C02500
                          MDX     CLEAN     LOOP                        U5C02510
                          BSC  I  CLBUF     EXIT                        U5C02520
                    *                                                   U5C02530
                    * CLEAR BUFFER CONSTANTS                            U5C02540
                    *                                                   U5C02550
                    CLCNT DC      45        CLEAR 45 WORDS TO BLANKS    U5C02560
                    CLCTR DC      0         COUNTER                     U5C02570
                    D0    DC      /4040     BLANKS                      U5C02580
                    *                                                   U5C02590
                    * HEXADECIMAL LINE ADDRESS                          U5C02600
                    *                                                   U5C02610
                    LNAD  LD      BEGAD     OBTAIN LINE ADDRESS         U5C02620
                          STO     HEXWD     STORE                       U5C02630
                          LDX  L1 PRINT     SETUP BUFFER IN IX1         U5C02640
                          LDX  L2 HEXBU     SET IR2                     U5C02650
                          BSI  L  BINHX     HEX CONVERSION ROUTINE      U5C02660
                          LD      D3        WORD COUNT                  U5C02670
                          STO     PCTR      WORD COUNTER                U5C02680
                          LD      EXBU      HEX FORMAT                  U5C02690
                          STO     STWRD     WORDS TO BE STORED          U5C02700
                          BSI     STORE     STORING ROUTINE             U5C02710
                          MDX     MOD       GO SEE MODE OF DUMP         U5C02720
                    *                                                   U5C02730
                    * LINE ADDRESS CONSTANTS                            U5C02740
                    *                                                   U5C02750
                    HEXBU DC      0         FIRST SET OF HEX CHARACTERS U5C02760
                          DC      0         SECONDSET OF HEX CHARACTERS U5C02770
                          DC      /4040     DOUBLE SPACE                U5C02780
                    EXBU  DC      HEXBU     HEX CONSTANT                U5C02790
                    *                                                   U5C02800
                    * TEST FOR MODE OF DUMP                             U5C02810
                    *                                                   U5C02820
                    MOD   LD      MODE      DUMP INDICATOR              U5C02830
                          BSC  L  DESML,Z   TEST INDICATOR              U5C02840
                          MDX     ADLN      GO DUMP IN HEX              U5C02850
                    *                                                   U5C02860
                    * DUMP INDICATOR                                    U5C02870
                    *                                                   U5C02880
                    MODE  DC      0                                     U5C02890
                    *                                                   U5C02900
                    *                                                   U5C02910
                    STORE NOP                                           U5C02920
                          LD      PCTR      STORING COUNT               U5C02930
                          STO     STCTR     STORING COUNTER             U5C02940
                    RESWD LD   I  STWRD     WORD TO BE STORED           U5C02950
                          STO   1 1         STORE VIA IR1               U5C02960
                          MDX  L  STWRD,1   PICKUP NEXT WORD            U5C02970
                          MDX   1 1         INCREMENT IR1               U5C02980
                          MDX  L  STCTR,-1  DECREMENT COUNTER           U5C02990
                          MDX     RESWD     LOOP                        U5C03000
                          BSC  I  STORE     EXIT                        U5C03010
                    *                                                   U5C03020
                    * STORING ROUTINE CONSTANTS                         U5C03030
                    *                                                   U5C03040
                    PCTR  DC      0         COUNT                       U5C03050
                    STCTR DC      0         COUNTER                     U5C03060
                    STWRD DC      0         WORD TO BE STORED           U5C03070
                    *                                                   U5C03080
                    * THIS IS A HEXADECIMAL DUMP                        U5C03090
                    *                                                   U5C03100
                    ADLN  LD      D8        NUMBER OF WORDS PER LINE    U5C03110
                          STO     REGCR     COUNTER OF WORDS PER LINE   U5C03120
                          LD      D27       DECIMAL 27  WORD COUNT      U5C03130
                          STO  L  PRINT     STORED IN PRINT BUFFER      U5C03140
                    FAST  LD   I  BEGAD     START ADDRESS               U5C03150
                          STO     HEXWD     TEMP HEX STORAGE            U5C03160
                          LDX  L2 HEXBU     SET IR2                     U5C03170
                          BSI     BINHX     HEX CONVERSION ROUTINE      U5C03180
                          LD      D3        DECIMAL 3                   U5C03190
                          STO     PCTR      WORD COUNT                  U5C03200
                          LD      EXBU      HEX FORMAT                  U5C03210
                          STO     STWRD     WORDS TO STORED             U5C03220
                          BSI     STORE     STORING ROUNTINE            U5C03230
                          MDX  L  BEGAD,1   INCREMENT FOR NEXT WORD     U5C03240
                          MDX  L  REGCR,-1  DECREMENT COUNTER           U5C03250
                          MDX     FAST      LOOP                        U5C03260
                          LIBF    PRNT1     PRINT A LINE                U5C03270
                          DC      /2000     CALL PRINT FUNCTION         U5C03280
                          DC      PRINT     PRINTING AREA               U5C03290
                          DC      MSTKE     ERROR ADDRESS               U5C03300
                          BSI  L  BUSY      BUSY ROUTINE                U5C03310
                          BSI  L  CLBUF     CLEAR BUFFER                U5C03320
                          MDX     EODT      END OF DUMP TEST            U5C03330
                    *                                                   U5C03340
                    * HEXADECIMAL DUMP CONSTANTS                        U5C03350
                    *                                                   U5C03360
                    D8    DC      8         DECIMAL 8 WDS PER LINE      U5C03370
                    D27   DC      27        DECIMAL 27,HEX WORD COUNT   U5C03380
                    *                                                   U5C03390
                    * END OF DUMP TEST                                  U5C03400
                    *                                                   U5C03410
                    EODT  LD      ENDAD     ENDING ADDRESS              U5C03420
                          S       BEGAD     BEGIN  ADDRESS              U5C03430
                          BSC  L  LNAD,-    BR IF NOT FINISHED          U5C03440
                    FINSH LDD  L  AREG      AREG AND QREG RESTORED      U5C03450
                          LDX  I1 IRONE     IR1 RESTORED                U5C03460
                          LDX  I2 IRTWO     IR2 RSETORED                U5C03470
                    STOC  LDS     0         RESTORE OVFL. AND CARRY     U5C03480
                          BSC  I  DMPRX     EXIT                        U5C03490
                    *                                                   U5C03500
                    * THIS DUMP IS DECIMAL                              U5C03510
                    *                                                   U5C03520
                    DESML LD      D8        WORD PER LINE COUNT         U5C03530
                          STO     REGCR     WORD PER LINE COUNTER       U5C03540
                          LD      D35       DECIMAL 35                  U5C03550
                          STO  L  PRINT     WORD COUNT                  U5C03560
                    SLOW  LD   I  BEGAD     START ADDRESS               U5C03570
                          STO     DECWD     DEC TEMP STORAGE            U5C03580
                          LDX  L2 DECBU     SET IR2                     U5C03590
                          BSI     BINDC     DEC CONVERSION ROUTINE      U5C03600
                          LD      D4        DECIMAL 4                   U5C03610
                          STO     PCTR      WORD COUNT                  U5C03620
                          LD      ECBU      DEC FORMAT                  U5C03630
                          STO     STWRD     WORDS TO BE STORED          U5C03640
                          BSI     STORE     STORING ROUTINE             U5C03650
                          MDX  L  BEGAD,1   INCREMENT FOR NEXT WORD     U5C03660
                          MDX  L  REGCR,-1  DECREMENT COUNTER           U5C03670
                          MDX     SLOW      LOOP                        U5C03680
                          LIBF    PRNT1     TO PRINTER SUBR TO          U5C03690
                          DC      /2000     PRINT A LINE                U5C03700
                          DC      PRINT     PRINTING AREA               U5C03710
                          DC      MSTKE     ERROR ADDRESS               U5C03720
                          BSI  L  BUSY      BUSY ROUTINE                U5C03730
                          BSI  L  CLBUF     CLEAR BUFFER                U5C03740
                          MDX     EODT      END OF DUMP TEST            U5C03750
                    *                                                   U5C03760
                    * DECIMAL DUMP CONSTANTS                            U5C03770
                    *                                                   U5C03780
                    DECBU DC      0         BUFFER                      U5C03790
                          DC      0         *FOR DECIMAL                U5C03800
                          DC      0         *OUTPUT                     U5C03810
                          DC      /4040     DOUBLE SPACE                U5C03820
                    ECBU  DC      DECBU     DECIMAL BUFFER ADDRESS      U5C03830
                    D35   DC      35        WORD COUNT FOR PRINTING     U5C03840
                    D4    DC      4         DECIMAL J                   U5C03850
                    *                                                   U5C03860
                    * TEST 1132 PRINTER FOR BUSY                        U5C03870
                    *                                                   U5C03880
                    *                                                   U5C03890
                    BUSY  NOP                                           U5C03900
                          LIBF    PRNT1     CALL PRINT SUBR             U5C03910
                          DC      /0000     BUSY TEST                   U5C03920
                          MDX     BUSY+1    LOOP IF BUSY                U5C03930
                          BSC  I  BUSY      RETURN WHEN NOT BUSY        U5C03940
                    *                                                   U5C03950
                    *                                                   U5C03960
                    * SKIP TO CHANNEL ONE ROUTINE                       U5C03970
                    *                                                   U5C03980
                    SKIP  NOP                                           U5C03990
                          LIBF    PRNT1     CALL VIP ROUTINE            U5C04000
                          DC      /3100     SKIP TO CHANNEL 1           U5C04010
                          BSC  I  SKIP      EXIT                        U5C04020
                    *                                                   U5C04030
                    *                                                   U5C04040
                    * BINARY TO HEXADECIMAL CONVERSION ROUTINE          U5C04050
                    *                                                   U5C04060
                    BINHX BSS     1                                     U5C04070
                          LD   L  HEXWD     TEMP STORAGE                U5C04080
                          RTE     16        ROTATE  A+Q, A STORED IN Q  U5C04090
                          LD      D192      NO.  FOR HEX CHAR. COUNT    U5C04100
                          STO     COUNT     COUNT  = 192                U5C04110
                          LD      D9        *FOR EVEN OR ODD TEST       U5C04120
                          STO     PART      *PART = 9                   U5C04130
                          LD      ZERO                                  U5C04140
                          STO   2 0         CLEAR  HEX BUF. 1           U5C04150
                          STO   2 1         CLEAR  HEX BUF. 2           U5C04160
                    A1    LD   L  ZERO      CLEAR ACC                   U5C04170
                          SLT     4         SHIFT  1ST 4 BITS IN ACCUM. U5C04180
                          A       ADDR      *MODIFY FOR TABLE LOOKUP    U5C04190
                          STO     *+1                                   U5C04200
                          LD   L  0         GET CHARACTER FROM TABLE    U5C04210
                          STO     TEMPO                                 U5C04220
                          MDX  L  PART,1    CHECK IF RIGHT OR LEFT      U5C04230
                          LD      PART                                  U5C04240
                          BSC  L  B1,E      BR IF 2 CHARS TO BE PACKED  U5C04250
                          MDX   2 1         STEP OUTPUT POINTER         U5C04260
                          LD      TEMPO                                 U5C04270
                          SLA     8         SHIFT  IN 1ST PART          U5C04280
                          MDX     C1        GO COMBINE CHARACTERS       U5C04290
                    B1    LD      TEMPO                                 U5C04300
                    C1    A     2 -1        COMBINE 2 CHARACTERS        U5C04310
                          STO   2 -1        STORE IN HEX BUFFER         U5C04320
                          MDX  L  COUNT,-48 DECR COUNT,SKIP IF 4 DONE   U5C04330
                          MDX     A1        GET NEXT CHARACTER          U5C04340
                          BSC  I  BINHX     EXIT                        U5C04350
                    ZERO  DC      0         ZERO CONSTANT               U5C04360
                    D9    DC      9         INIT VALUE,LEFT/RIGHT INDR  U5C04370
                    D192  DC      192       COUNT FOR 4 HEX CHARS 48X4  U5C04380
                    TEMPO DC      0         TEMP STORAGE                U5C04390
                    PART  DC      0         RIGHT/LEFT INDICATOR        U5C04400
                    COUNT DC      0         CHARACTER COUNTER           U5C04410
                    ADDR  DC      TYTAB     *TABLES                     U5C04420
                    TYTAB DC      0240      NUMBER    =         0       U5C04430
                          DC      0241      NUMBER    =         1       U5C04440
                          DC      0242      NUMBER    =         2       U5C04450
                          DC      0243      NUMBER    =         3       U5C04460
                          DC      0244      NUMBER    =         4       U5C04470
                          DC      0245      NUMBER    =         5       U5C04480
                          DC      0246      NUMBER    =         6       U5C04490
                          DC      0247      NUMBER    =         7       U5C04500
                          DC      0248      NUMBER    =         8       U5C04510
                          DC      0249      NUMBER    =         9       U5C04520
                          DC      0193      NUMBER    =         A       U5C04530
                          DC      0194      NUMBER    =         B       U5C04540
                          DC      0195      NUMBER    =         C       U5C04550
                          DC      0196      NUMBER    =         D       U5C04560
                          DC      0197      NUMBER    =         E       U5C04570
                          DC      0198      NUMBER    =         F       U5C04580
                    *                                                   U5C04590
                    * BINARY TO DECIMAL CONVERSION ROUTINE              U5C04600
                    *                                                   U5C04610
                    BINDC BSS     1                                     U5C04620
                          LD   L  DECWD     TEMP STORAGE                U5C04630
                          STO     TEMPO     *OF DECIMAL VALUE           U5C04640
                          LD      D10       SET COUNT TO                U5C04650
                          STO     COUNT     *PROCESS 10 CHARACTERS      U5C04660
                          LD      D9        INITIALIZE                  U5C04670
                          STO     PART      RIGHT/LEFT INDICATOR        U5C04680
                          SRA     16                                    U5C04690
                    CLEAR STO   2 0         CLEAR                       U5C04700
                          STO   2 1         *DECIMAL                    U5C04710
                          STO   2 2         *BUFFER                     U5C04720
                          LD      TEMPO                                 U5C04730
                          BSC  L  G1,+Z     BR IF NUMBER IS NEG         U5C04740
                          LD      PLUS      ITS POSITIVE                U5C04750
                          STO   2 0         STORE PLUS SIGN IN BUFFER   U5C04760
                          MDX     H1        GO START CONVERSION         U5C04770
                    G1    LD      MINUS     PLACE MINUS                 U5C04780
                          STO   2 0         SIGN IN BUFFER              U5C04790
                          SRA     16        SPECIAL                     U5C04800
                          S       TEMPO     *TREATMENT                  U5C04810
                          BSC     +         *FOR                        U5C04820
                          LD      H7FFF     *ORIGINAL  VALUE            U5C04830
                          STO     TEMPO     *OF -32768                  U5C04840
                    H1    LD      TEMPO     PLACE NUMBER IN             U5C04850
                          SRT     16        EXTENSION                   U5C04860
                          D       D10       DIVIDE BY 10                U5C04870
                          STO     TEMPO     SAVE QUOTIENT               U5C04880
                          RTE     16        GET REMAINDER               U5C04890
                          BSC     O         ADD ONE IF OVERFLOW         U5C04900
                          A       D1                                    U5C04910
                          A       ADDR      COMPUTE ADDRESS OF          U5C04920
                          STO     *+1       *CHARACTER IN TABLE         U5C04930
                          LD   L  0         PICK UP REQUIRED CHAR       U5C04940
                          RTE     16        MOVE IT TO EXT              U5C04950
                          LD      PART      RIGHT OR LEFT PLACEMENT     U5C04960
                          BSC     E         SKIP IF LEFT  HALF          U5C04970
                          RTE     8         NO SKIP IF RIGHT            U5C04980
                          RTE     8                                     U5C04990
                          A     2 2         COMBINE 2 CHARACTERS        U5C05000
                          STO   2 2         STORE IN BUFFER             U5C05010
                          MDX  L  PART,1    INCREMENT RIGHT/LEFT INDR   U5C05020
                          LD      PART                                  U5C05030
                          BSC     E                                     U5C05040
                          MDX   2 -1        STEP OUTPUT POINTER         U5C05050
                          MDX  L  COUNT,-2  DECR COUNT,SKIP IF 5 DONE   U5C05060
                          MDX     H1        DO NEXT CHARACTER           U5C05070
                          BSC  I  BINDC     EXIT                        U5C05080
                    H7FFF DC      /7FFF     CONST FOR -32768            U5C05090
                    D1    DC      1         CONST 1                     U5C05100
                    D10   DC      10        CONST FOR NO OF CHARS TO DO U5C05110
                    PLUS  DC      /4E00     PLUS SIGN                   U5C05120
                    MINUS DC      /6000     MINUS SIGN                  U5C05130
                    PRINT BSS     45        PRINTING BUFFER             U5C05140
                    DMPRD EQU     DMPD1                                 U5C05150
                    DMPRX EQU     DMPX1                                 U5C05160
                          END     DMPD1     BRANCH TO START OF PROG.    U5C05170
