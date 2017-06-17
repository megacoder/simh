                          HDNG    1130 PAPER TAPE UTILITY ROUTINE       U6J00010
                    *************************************************** U6J00020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U6J00030
                    *FUNCTION/OPERATION-THIS IS A MAINLINE SUBROUTINE * U6J00040
                    *STORED IN THE SUBROUTINE LIBRARY FOR THE         * U6J00050
                    *CONVENIENCE OF THE PAPER-TAPE USER. THE PROGRAM  * U6J00060
                    *ACCEPTS INPUT FROM THE KEYBOARD OR THE 1134 PAPER* U6J00070
                    *TAPE READER AND PROVIDES OUTPUT ON THE CONSOLE   * U6J00080
                    *PRINTER AND/OR THE 1055 PAPER-TAPE PUNCH. THIS   * U6J00090
                    *SUBROUTINE ALLOWS CHANGES AND/OR ADDITIONS TO    * U6J00100
                    *FORTRAN AND ASSEMBLER LANGUAGE SOURCE RECORDS AS * U6J00110
                    *WELL AS MONITOR CONTROL RECORDS. THE CALLING     * U6J00120
                    *SEQUENCE FOR PTUTL IS-                           * U6J00130
                    *             // XEQ PTUTL                        * U6J00140
                    *THE FUNCTIONS TO BE PERFORMED ARE COMMUNICATED TO* U6J00150
                    *THE SUBROUTINE BY MEANS OF THE CONSOLE ENTRY     * U6J00160
                    *SWITCHES AS INDICATED BELOW-                     * U6J00170
                    *     BIT SWITCH ON    OPTION                     * U6J00180
                    *           0          PRINT RECORD AFTER READING * U6J00190
                    *           1          READ PAPERTAPE RECORDS-1134* U6J00200
                    *           2          ACCEPT KEYBOARD INPUT      * U6J00210
                    *           3          PUNCH PAPERTAPE RECORDS    * U6J00220
                    *          14          WAIT AFTER PUNCHING        * U6J00230
                    *          15          WAIT AFTER PRINTING        * U6J00240
                    *                                                 * U6J00250
                    *                                                 * U6J00260
                    *ENTRY POINTS-                                    * U6J00270
                    *     *START- THIS IS THE ONLY ENTRY TO THE       * U6J00280
                    *     PROGRAM. UPON ENTRY, THE PROGRAM WAITS WITH * U6J00290
                    *     /1111 IN THE ACCUM,WAITING FOR THE USER TO  * U6J00300
                    *     SELECT HIS OPTIONS VIA THE CONSOLE ENTRY    * U6J00310
                    *     SWITCHES.                                   * U6J00320
                    *INPUT- INPUT IS PROVIDED TO THE PROGRAM VIA THE  * U6J00330
                    *PAPER-TAPE READER AND/OR THE KEYBOARD.           * U6J00340
                    *                                                 * U6J00350
                    *OUTPUT- PUNCHED OUTPUT ON PAPERTAPE PUNCH AND/OR * U6J00360
                    *1053 CONSOLE PRINTER.                            * U6J00370
                    *                                                 * U6J00380
                    *EXTERNAL REFERENCES- THE FOLLOWING SUBROUTINES   * U6J00390
                    *FROM THE SUBROUTINE LIBRARY ARE CALLED-          * U6J00400
                    *           PAPHL                                 * U6J00410
                    *           PAPPR                                 * U6J00420
                    *           PAPT1                                 * U6J00430
                    *           TYPE0                                 * U6J00440
                    *IN ADDITION, THE ABOVE SUBROUTINES CALL THE      * U6J00450
                    *FOLLOWING SUBROUTINES                            * U6J00460
                    *           EBPA                                  * U6J00470
                    *           PRTY                                  * U6J00480
                    *           HOLL                                  * U6J00490
                    *           ILS04                                 * U6J00500
                    *                                                 * U6J00510
                    *EXITS-NORMAL  -OUT- IF ALL CONSOLE ENTRY SWITCHES* U6J00520
                    *ARE OFF THE PROGRAM BRANCHES TO -OUT- WHICH      * U6J00530
                    *PERFORMS A CALL EXIT BACK TO THE SUPERVISOR.     * U6J00540
                    *EXITS-ERROR- NONE.                               * U6J00550
                    *                                                 * U6J00560
                    *TABLES,WORK AREAS- -PBUF- -PAPERTAPE I/O AREA    * U6J00570
                    *                   -TYBUF- -TYPEWRITER I/O AREA  * U6J00580
                    *ATTRIBUTES- REUSABLE                             * U6J00590
                    *                                                 * U6J00600
                    *NOTES- THE KEYBOARD INPUT OPTION USES TYPE0.     * U6J00610
                    *THEREFORE ALL FEATURES OF THAT SUBROUTINE APPLY  * U6J00620
                    *TO PTUTL                                         * U6J00630
                    *     *MAXIMUM INPUT RECORD--80 CHARACTERS        * U6J00640
                    *     *PRESSING BACKSPACE KEY CANCELS LAST        * U6J00650
                    *      CHARACTER ENTERED.                         * U6J00660
                    *     *PRESSING THE ERASE FIELD KEY CANCELS THE   * U6J00670
                    *      ENTIRE RECORD AND ALLOWS USER RESTART.     * U6J00680
                    *     *PRESSING THE EOF KEY INDICATES THE RECORD  * U6J00690
                    *      IS COMPLETE. THE KEYBOARD IS RELEASED AND  * U6J00700
                    *      THE PROGRAM CONTINUES.                     * U6J00710
                    *                                                 * U6J00720
                    *************************************************** U6J00730
                          ABS                                           U6J00740
                          ORG     /400                                  U6J00750
                    PTBUF DC      81         WORDCOUNT (MAXIMUM)    2-9 U6J00760
                          BSS     81         PAPER TAPE I/O AREA    2-9 U6J00770
                    TYBUF DC      80         WORD COUNT (MAXIMUM)       U6J00780
                          BSS     80         TYPEWRITER I/O AREA        U6J00790
                          DC      /4110     CONSTANT FOR NEW LINE   2-4 U6J00800
                          BSS  E  0                                 2-4 U6J00810
                    BITSW DC      BITS       IOCC TO READ SWITCHES      U6J00820
                          DC      /3A00                                 U6J00830
                    H1111 DC      /1111  DISPLAY CODE FOR INITIAL WAIT  U6J00840
                    H2222 DC      /2222  DISPLAY CODE,WAIT-AFTER-PUNCH  U6J00850
                    H3333 DC      /3333  DISPLAY CODE,WAIT-AFTER-PRINT  U6J00860
                    H3000 DC      /3000  NOT READY ERROR CODE           U6J00870
                    *                                                   U6J00880
                    BITS  DC      0          BIT SWITCH BUFFER          U6J00890
                    ERROR DC      0          I/O ERROR ENTRY            U6J00900
                          OR      H3000                                 U6J00910
                          STO     NORDY      STORE ERROR FLAG           U6J00920
                          SLA     16         CLEAR ACCUMULATOR          U6J00930
                          BSC  I  ERROR      RETURN TO PAPT1            U6J00940
                    NORDY DC      0          NOT READY INDICATOR        U6J00950
                    CARET DC      1                                 2-9 U6J00960
                    H2181 DC      /2181      SPACE AND CARRIER RETURN   U6J00970
                    NL    DC      /0081      NEW LINE CHARACTER         U6J00980
                    $I400 DC      /C4       ILS04 ADDR IN RES MON   212 U6J00983
                    $LEV4 EQU     /C        LEVEL 4 BRANCH WORD     212 U6J00986
                    *                                                   U6J00990
                    *     STOP AFTER PRINT OUT                          U6J01000
                    *                                                   U6J01010
                    WAP   LD      H2222      DISPLAY CODE               U6J01020
                          WAIT               STOP AFTER PRINTING        U6J01030
                          MDX     SW2        GO ACCEPT CONSOLE INPUT    U6J01040
                    *                                                   U6J01050
                    START LD      H1111                                 U6J01060
                          WAIT               PAPER TAPE NOT READY       U6J01070
                          SLA     16         CLEAR ACCUMULATOR          U6J01080
                          STO     NORDY      CLEAR ERROR FLAG           U6J01090
                          LD      $I400     SET INTRPT LEVEL 4 BR   212 U6J01093
                          STO  L  $LEV4     *ADDR = SYSTEM ILS04    212 U6J01096
                    *                                                   U6J01100
                    *     TEST FOR EXIT                                 U6J01110
                    *                                                   U6J01120
                    SW1   XIO     BITSW      READ SWITCHES              U6J01130
                          LD      BITS       GET SWITCH READING         U6J01140
                          BSC  L  OUT,+-     BRANCH IF ALL SWITCHES OFF U6J01150
                          SLA     1                                     U6J01160
                          BSC  L  SW2,-      NO BRANCH IF SW. 1 ON      U6J01170
                    *                                                   U6J01180
                    *     READ PAPER TAPE                               U6J01190
                    *                                                   U6J01200
                          LIBF    PAPT1      READ PAPER TAPE RECORD     U6J01210
                          DC      /1000                                 U6J01220
                          DC      PTBUF                                 U6J01230
                          DC      ERROR                                 U6J01240
                          LIBF    PAPT1      TEST FOR OP COMPLETE       U6J01250
                          DC      0                                     U6J01260
                          MDX     *-3                                   U6J01270
                          LD      NORDY      GET NOT RDY. INDICATOR     U6J01280
                          BSC  L  START,Z    BRANCH ON PT NOT RDY.      U6J01290
                    *                                                   U6J01300
                    *     CONVERT FOR PRINT OUT                         U6J01310
                    *                                                   U6J01320
                    SW0   XIO     BITSW      READ SWITCHES              U6J01330
                          LD      BITS       GET SWITCH READING         U6J01340
                          BSC  L  SW3,-      NO BRANCH IF SW. 0 ON      U6J01350
                          LIBF    PAPPR      CONVERT PTTC/8 TO TYPWR.   U6J01360
                          DC      /0000                                 U6J01370
                          DC      PTBUF+1                               U6J01380
                          DC      TYBUF+1                               U6J01390
                          DC      161                               2-9 U6J01400
                    *                                                   U6J01410
                    *     COUNT CHARACTERS TO PRINT OUT                 U6J01420
                    *                                                   U6J01430
                          LDX   1 1          INITIALIZE COUNTER         U6J01440
                          SLT     32         CLEAR A AND Q              U6J01450
                    LOOP  LD   L1 TYBUF      GET BUFFER WORD            U6J01460
                          RTE     8                                     U6J01470
                          EOR     NL         CHECK FOR NL               U6J01480
                          BSC  L  INVRT,+-   BRANCH IF NL               U6J01490
                          SLT     16                                    U6J01500
                          SRA     8                                     U6J01510
                          EOR     NL         CHECK FOR NL               U6J01520
                          BSC  L  PT2PR,+-   BRANCH IF NL               U6J01530
                          MDX   1 1          ADD 1 TO COUNTER           U6J01540
                          MDX     LOOP                                  U6J01550
                    INVRT LD      H2181                                 U6J01560
                          STO  L1 TYBUF                                 U6J01570
                    PT2PR STX  L1 TYBUF      STORE WORD COUNT           U6J01580
                    *                                                   U6J01590
                    *     PRINT ON TYPEWRITER                           U6J01600
                    *                                                   U6J01610
                          LIBF    TYPE0      PRINT RECORD               U6J01620
                          DC      /2000                                 U6J01630
                          DC      TYBUF                                 U6J01640
                          LIBF    TYPE0      TEST FOR OP COMPLETE       U6J01650
                          DC      0                                     U6J01660
                          MDX     *-3                                   U6J01670
                    *                                                   U6J01680
                    *     STOP AFTER PRINT OUT                          U6J01690
                    *                                                   U6J01700
                    SW15  XIO     BITSW      READ SWITCHES              U6J01710
                          LD      BITS       GET SWITCH READING         U6J01720
                          BSC  L  WAP,E      CHK SW 15 FOR WAIT-AFTER   U6J01730
                    *                                                   U6J01740
                    *     ACCEPT CONSOLE INPUT                          U6J01750
                    *                                                   U6J01760
                    SW2   XIO     BITSW      READ SWITCHES              U6J01770
                          LD      BITS       GET SWITCH READING         U6J01780
                          SLA     2                                     U6J01790
                          BSC  L  SW3,-      NO BRANCH IF SW. 2 ON      U6J01800
                          LDX   1 80                                    U6J01810
                          STX  L1 TYBUF      SET KEYBOARD WORD COUNT    U6J01820
                          LIBF    TYPE0      ACCEPT TYPWR. INPUT        U6J01830
                          DC      /1000                                 U6J01840
                          DC      TYBUF                                 U6J01850
                          LIBF    TYPE0                             2-9 U6J01860
                          DC      /2000                             2-9 U6J01870
                          DC      CARET      CARRIAGE RETURN        2-9 U6J01880
                          LIBF    TYPE0      TEST FOR OP COMPLETE       U6J01890
                          DC      0                                     U6J01900
                          MDX     *-3                                   U6J01910
                    *                                                   U6J01920
                    *     CONVERT FOR PUNCH OUT                         U6J01930
                    *                                                   U6J01940
                          LIBF    PAPHL      CONVERT TYPWR. TO PTTC/8   U6J01950
                          DC      /0001                                 U6J01960
                          DC      TYBUF+1                               U6J01970
                          DC      PTBUF+1                               U6J01980
                          DC      81                                2-4 U6J01990
                    *                                                   U6J02000
                    *     PUNCH PAPER TAPE                              U6J02010
                    *                                                   U6J02020
                    SW3   XIO     BITSW      READ SWITCHES              U6J02030
                          LD      BITS       GET SWITCH READING         U6J02040
                          SLA     3                                     U6J02050
                          BSC  L  SW14,-     NO BRANCH IF SW. 3 ON      U6J02060
                          LIBF    PAPT1      PUNCH PAPER TAPE RECORD    U6J02070
                          DC      /2000                                 U6J02080
                          DC      PTBUF                                 U6J02090
                          DC      ERROR                                 U6J02100
                          LIBF    PAPT1      TEST FOR OP COMPLETE       U6J02110
                          DC      0                                     U6J02120
                          MDX     *-3                                   U6J02130
                          LD   L  NORDY      GET NOT RDY. INDICATOR     U6J02140
                          BSC  L  START,Z    BRANCH ON PT NOT RDY.      U6J02150
                    *                                                   U6J02160
                    *     STOP AFTER PUNCH OUT                          U6J02170
                    *                                                   U6J02180
                    SW14  XIO     BITSW      READ SWITCHES              U6J02190
                          LD      BITS       GET SWITCH READING         U6J02200
                          SLA     14                                    U6J02210
                          BSC  L  SW1,-      NO BRANCH IF SW. 14 ON     U6J02220
                          LD      H3333      CODE FOR WAIT-AFTER-PUNCH  U6J02230
                          MDX     START+1                               U6J02240
                    *                                                   U6J02250
                    OUT   LDX   0 /38        EXIT TO SUP                U6J02260
                          END     START                                 U6J02270
