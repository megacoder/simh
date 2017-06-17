                          HDNG    DUMP SYST LOCATION EQUIVALENCE TABLE  U6E00010
                    *************************************************** U6E00020
                    *   STATUS - VERSION 2, MODIFICATION 11           * U6E00025
                    *                                                 * U6E00030
                    *   PROGRAM NAME- DUMP SYSTEM LOCATION EQUIVALENCE* U6E00040
                    *      TABLE                                      * U6E00050
                    *      CODE NAME- DSLET                           * U6E00060
                    *   FUNCTION/OPERATION                            * U6E00070
                    *      THIS PROGRAM DUMPS SLET TO THE PRINCIPAL   * U6E00080
                    *      PRINT DEVICE.  EACH ENTRY CONSISTS OF A    * U6E00090
                    *      SYMBOLIC NAME, PHASE ID, CORE ADDRESS, WORD* U6E00100
                    *      COUNT, AND DISK SECTOR ADDRESS.  UP TO 40  * U6E00110
                    *      LINES OF FOUR ENTRIES EACH ARE PRINTED.    * U6E00120
                    *   ENTRY POINTS-                                 * U6E00130
                    *      DSLET HAS ONLY ONE ENTRY POINT. THE PROGRAM* U6E00140
                    *      IS ENTERED AS FOLLOWS--                    * U6E00150
                    *             // XEQ DSLET                        * U6E00160
                    *   INPUT- NONE.                                  * U6E00170
                    *   OUPUT- A ONE PAGE LISTING OF THE CONTENTS OF  * U6E00180
                    *      THE SYSTEM LOCATION EQUIVALENCE TABLE.     * U6E00190
                    *   EXTERNAL REFERENCES-                          * U6E00200
                    *      DZ000 -- ENTRY POINT FOR THE SYSTEM DISK   * U6E00210
                    *               I/O SUBROUTINE.                   * U6E00220
                    *      $PBSY -- PRINCIPAL PRINTER BUSY INDICATOR  * U6E00230
                    *      $DBSY -- DISK BUSY INDICATOR               * U6E00240
                    *      $EXIT -- ADDRESS OF CALL EXIT ENTRY POINT  * U6E00250
                    *      @SLET -- SECTOR ADDR OF SLET               * U6E00260
                    *      @HDNG -- SECTOR CONTAINING PAGE HEADING    * U6E00270
                    *   EXITS-                                        * U6E00280
                    *      NORMAL-                                    * U6E00290
                    *         BR TO CALL EXIT ENTRY POINT             * U6E00300
                    *      ERROR-                                     * U6E00310
                    *         NOT APPLICABLE                          * U6E00320
                    *   TABLES/WORK AREAS-                            * U6E00330
                    *      COMMA AND SLET                             * U6E00340
                    *   ATTRIBUTES-                                   * U6E00350
                    *      NONE                                       * U6E00360
                    *   NOTES-                                        * U6E00370
                    *      THIS SUBROUTINE HAS BEEN LARGELY REWRITTEN * U6E00380
                    *      AT MOD 9 AND IS SIGNIFICANTLY EXPANDED TO  * U6E00381
                    *      INCLUDE THE SLET INFORMATION FOR COBOL COM-* U6E00382
                    *      PILER PHASES AND AN ADDITIONAL 320 WORD    * U6E00383
                    *      BUFFER TO ACCOMMODATE A 3-SECTOR SLET TABLE* U6E00384
                    *                                                 * U6E00390
                    *************************************************** U6E00400
                          HDNG    DUMP SYST LOCATION EQUIVALENCE TABLE  U6E00410
                    *                                                   U6E00420
                    *             SYSTEM EQUATE STMNTS                  U6E00430
                    *                                                   U6E00440
                    $DBSY EQU     /EE                                   U6E00450
                    $PBSY EQU     /36                                   U6E00460
                    $EXIT EQU     /38                                   U6E00470
                    DZ000 EQU     /F2                                   U6E00480
                    *                                                   U6E00490
                    *             READ SLET IOCC                        U6E00500
                    *                                                   U6E00510
                          BSS  E  0         MAKE ADDRESS EVEN           U6E00520
                    DS900 DC      /7000     DISK READ FUNCTION          U6E00530
                          DC      DS990     SLET BUFFER ADDRESS         U6E00540
                    *                                                   U6E00550
                    *             READ HEADER RECORD IOCC               U6E00560
                    *                                                   U6E00570
                    DS901 DC      /7000     DISK READ FUNCTION          U6E00580
                          DC      DS950-2   HEADER BUFFER ADDR          U6E00590
                    *                                                   U6E00600
                    *             FIRST HEADER LINE IOCC                U6E00610
                    *                                                   U6E00620
                    DS902 DC      /7000     SKIP TO CHANNEL 1 FUNC CODE U6E00630
                          DC      DS950-1   WORD COUNT ADDRESS          U6E00640
                    *                                                   U6E00650
                    *             SUBHEADING IOCC                       U6E00660
                    *                                                   U6E00670
                    DS903 DC      /7001     PRINT FUNCTION CODE         U6E00680
                          DC      *-*       WORD COUNT ADDRESS          U6E00690
                    *                                                   U6E00700
                    *             READ SLET FROM MASTER CARTRIDGE       U6E00710
                    *                                                   U6E00720
                    DS000 LDD     DS900     READ FUNC AND BUFFER ADDR   U6E00730
                          BSI  L  DZ000     READ SLET                   U6E00740
                    *                                                   U6E00750
                    *             GET PRINCIPAL PRINT ROUTINE           U6E00760
                    *                                                   U6E00770
                          CALL    FSLEN                                 U6E00780
                          DC      153       PHASE ID OF PRINCIPAL PRINT U6E00790
                          CALL    FSYSU                                 U6E00800
                          STO  L  DS920     ADDR OF PRINCIPAL PRINT     U6E00810
                    *                                                   U6E00820
                    *             CHECK FOR DISK READ COMPLETE          U6E00830
                    *                                                   U6E00840
                          LD   L  $DBSY     DISK BUSY INDR              U6E00850
                          BSC     Z         SKIP NEXT IF READ COMPLETED U6E00860
                          MDX     *-4       LOOP ON BUSY                U6E00870
                    *                                                   U6E00880
                    *             READ HEADER RECORD FROM DISK          U6E00890
                    *                                                   U6E00900
                          LDD     DS901     READ FUNC AND BUFFER ADDR   U6E00910
                          BSI  L  DZ000     READ HEADER RECORD          U6E00920
                    *                                                   U6E00930
                    *             CHECK FOR DISK READ COMPLETE          U6E00940
                    *                                                   U6E00950
                          LD   L  $DBSY DISK BUSY INDR                  U6E00960
                          BSC     Z         SKIP NEXT IF READ COMPLETED U6E00970
                          MDX     *-4       LOOP ON BUSY                U6E00980
                    *                                                   U6E00990
                    *             PRINT FIRST HEADER LINE               U6E01000
                    *                                                   U6E01010
                          LD      DS911     HEADER PRINT WORD COUNT     U6E01020
                          STO  L  DS950-1   SET UP WORD COUNT FOR PRINT U6E01030
                          LDD     DS902     FUNC CODE AND WORD CNT ADDR U6E01040
                          BSI  I  DS920     BR TO SKIP TO NEW PAGE      U6E01050
                          BSI  I  DS920     BR TO PRINT FIRST HEADER    U6E01060
                    *                                                   U6E01070
                    *             TWO VERTICAL SPACES                   U6E01080
                    *                                                   U6E01090
                          LD      DS910     /7002 - SPACE FUNC CODE     U6E01100
                          BSI  I  DS920     BR TO PRINT ROUTINE         U6E01110
                          LD      DS910     SECOND SPACE                U6E01120
                          BSI  I  DS920     BR TO PRINT A BLANK LINE    U6E01130
                    *                                                   U6E01140
                    *             PRINT SUBHEADING                      U6E01150
                    *                                                   U6E01160
                          LDX  L1 DS960-1                               U6E01170
                          STX  L1 DS903+1   FIRST LINE BUFFER ADDRESS   U6E01180
                          LDD     DS903     FUNC CODE AND WD CNT ADDR   U6E01190
                          BSI  I  DS920     PRINT FIRST LINE            U6E01200
                          LDX  L1 DS970-1                               U6E01210
                          STX   1 DS903+1   SECOND LINE BUFFER ADDRESS  U6E01220
                          LDD     DS903     FUNC CODE AND WD CNT ADDR   U6E01230
                          BSI  I  DS920     PRINT SECOND LINE           U6E01240
                          LDX  L1 DS980-1                               U6E01250
                          STX   1 DS903+1   THIRD LINE BUFFER ADDRESS   U6E01260
                          LDD     DS903     FUNC CODE AND WD CNT ADDR   U6E01270
                          BSI  I  DS920     PRINT THIRD LINE            U6E01280
                    *                                                   U6E01290
                    *             ONE VERTICAL SPACE                    U6E01300
                    *                                                   U6E01310
                          LD      DS910     /7002 - SPACE FUNC CODE     U6E01320
                          BSI  I  DS920     BR TO PRINT ROUTINE         U6E01330
                    *                                                   U6E01340
                    *             INITIALIZE POINTERS TO SLET AND       U6E01350
                    *             NAME TABLE                            U6E01360
                    *                                                   U6E01370
                          LDX  L2 DS990+2   ADDR CORE SLET TABLE    2-8 U6E01380
                          LDX  L1 DS800-DS810  NEG LENGTH NAME TABLE2-8 U6E01390
                    *                                                   U6E01400
                    *             PREPARE FOR PRINTING FIRST LINE       U6E01410
                    *                                                   U6E01420
                          BSI  L  DS250     CLEAR PRINT/RESET TAB   2-8 U6E01430
                    *                                                   U6E01440
                    *             PROCESS CURRENT PHASE ID FROM SLET    U6E01450
                    *                                                   U6E01460
                    DS100 LD    2 0         ACC=PHASE ID IN SLET    2-8 U6E01470
                          S       DS922     CHECK FOR MUP PHASE ID  2-9 U6E01471
                          BSC     +-        SKIP IF NOT             2-9 U6E01472
                          STX   0 DS923     SET REACHED MUP SW      2-9 U6E01473
                    *                                               2-9 U6E01474
                          LD    2 0         RESTORE PHASE ID TO ACC 2-9 U6E01475
                          BSC  L  DS105,Z   GO PROCESS ID IF NZ     2-9 U6E01476
                    *                                               2-9 U6E01477
                          MDX   1 +4        INCR TO NEXT NAME       2-9 U6E01478
                          LD      DS923     REACHED MUP SW          2-9 U6E01479
                          BSC  L  DS350,Z   ALL ZEROES LEFT, EXIT   2-9 U6E01480
                          MDX     DS180     GO INCR SLET PTR        2-9 U6E01481
                    *                                               2-9 U6E01482
                    DS105 BSI     DS200     CNV PHID TO UNPACKED EBC2-9 U6E01490
                          DC      3         *ARG 1--LENGTH         2-11 U6E01500
                          DC      8         *ARG 2--DISPLACEMENT    2-8 U6E01510
                    *                                                   U6E01520
                    *             PROCESS LOAD ADDR OF CURRENT PHASE    U6E01530
                    *                                                   U6E01540
                          LD    2 1         ACC=LOAD ADDRESS        2-8 U6E01550
                          BSI     DS200     CNV ADDR TO UNPACKED EBC2-8 U6E01560
                          DC      4         *ARG 1--LENGTH          2-8 U6E01570
                          DC      14        *ARG 2--DISPLACEMENT    2-8 U6E01580
                    *                                                   U6E01590
                    *             PROCESS WORD COUNT OF CURRENT PHASE   U6E01600
                    *                                                   U6E01610
                          LD    2 2         ACC=WORD COUNT          2-8 U6E01620
                          BSI     DS200     CNV WDCT TO UNPACKED EBC2-8 U6E01630
                          DC      4         *ARG 1--LENGTH          2-8 U6E01640
                          DC      20        *ARG 2--DISPLACEMENT    2-8 U6E01650
                    *                                                   U6E01660
                    *             PROCESS SCTR ADDR OF CURRENT PHASE    U6E01670
                    *                                                   U6E01680
                          LD    2 3         ACC=SECTOR ADDRESS      2-8 U6E01690
                          BSI     DS200     CNV ADDR TO UNPACKED EBC2-8 U6E01700
                          DC      4         *ARG 1--LENGTH          2-8 U6E01710
                          DC      26        *ARG 2--DISPLACEMENT    2-8 U6E01720
                    *                                                   U6E01730
                    *             DETERMINE IF NAME EXISTS FOR          U6E01740
                    *               THIS PHASE                          U6E01750
                    *                                                   U6E01760
                    DS120 MDX     *         SWITCH--BR TO DS150 WHEN2-8 U6E01770
                    *                       *PHID GT HIGHEST NAME   2-8 U6E01780
                    DS125 LD    2 0         ACC=PHID AGAIN          2-8 U6E01790
                          S    L1 DS810     COMPARE ID CURRENT NAME 2-8 U6E01800
                          BSC  L  DS150,+Z  BR IF SLET ID LOW       2-8 U6E01810
                          BSC  L  DS130,+   BR IF SLET ID MATCHES   2-8 U6E01820
                    *                                                   U6E01830
                          MDX   1 +4        INCR NAME TABLE PTR     2-8 U6E01840
                          MDX     DS125     BR IF MORE NAMES TO TRY 2-8 U6E01850
                          MDX     DS140     BR TO BYPASS IF NO MORE 2-8 U6E01860
                    *                                                   U6E01870
                    *             NAME EXISTS.  INSERT IT.              U6E01880
                    *                                                   U6E01890
                    DS130 LDX  I3 DS290     XR3=ADDR OF HORIZ TAB   2-8 U6E01900
                          SLT     16        CLEAR EXT               2-8 U6E01910
                          LD   L1 DS810+1   ACC=CHARS 1,2 OF NAME   2-8 U6E01920
                          RTE     8         ACC=/00XX, 1ST CHAR     2-8 U6E01930
                          EOR     DS919     IS IT 'AT SIGN'         2-8 U6E01940
                          BSC     +-        SKIP IF IT IS *NOT*     2-8 U6E01950
                          LD      DS912     MAKE 'APOSTROPHE'       2-8 U6E01960
                          EOR     DS919     RESTORE CHARACTER       2-8 U6E01970
                          STO   3 0         STORE 1ST CHAR TO PRINT 2-8 U6E01980
                          SLA     16        CLEAR ACC               2-8 U6E01990
                          SLT     8         ACC=2ND CHAR            2-8 U6E02000
                          STO   3 1         STORE 2ND CHAR TO PRINT 2-8 U6E02010
                          SLT     16        CLEAR EXT               2-8 U6E02020
                          LD   L1 DS810+2   ACC=CHARS 3,4 OF NAME   2-8 U6E02030
                          RTE     8         ACC=3RD CHAR            2-8 U6E02040
                          STO   3 2         STORE 3RD CHAR TO PRINT 2-8 U6E02050
                          SLA     16        CLEAR ACC               2-8 U6E02060
                          SLT     8         ACC=4TH CHAR            2-8 U6E02070
                          STO   3 3         STORE 4TH CHAR TO RPINT 2-8 U6E02080
                          LD   L1 DS810+3   ACC=4TH CHAR (/XX40)    2-8 U6E02090
                          SRA     8         RIGHT-ADJUST CHAR       2-8 U6E02100
                          STO   3 4         STORE 5TH CHAR TO PRINT 2-8 U6E02110
                    *                                                   U6E02120
                    *             INCREMENT NAME TABLE POINTER          U6E02130
                    *                                                   U6E02140
                          MDX   1 +4        INCR TO NEXT NAME       2-8 U6E02150
                          MDX     DS150     BR IF MORE ENTRIES      2-8 U6E02160
                    *                                                   U6E02170
                    *             NO MORE ENTRIES IN NAME TABLE.        U6E02180
                    *               SET BYPASS-COMPARE SWITCH.          U6E02190
                    *                                                   U6E02200
                    DS140 MDX  L  DS120,DS150-DS120-1  SET BYPASS SW2-8 U6E02210
                    *                                                   U6E02220
                    *             SLET ENTRY COLLECTED IN PRINT LINE.   U6E02230
                    *               INCREMENT HORIZONTAL TAB POINTER.   U6E02240
                    *               TEST IF LINE NOW FULL.              U6E02250
                    *                                                   U6E02260
                    DS150 MDX  L  DS290,+31  INCR HORIZ TAB POINTER 2-8 U6E02270
                          MDX  L  DS295,-1  DECREMENT TAB COUNT     2-8 U6E02280
                          MDX     DS180     BR IF LINE *NOT* FULL   2-8 U6E02290
                    *                                                   U6E02300
                    *             LINE IS FULL.  PRINT THE LINE.        U6E02310
                    *                                                   U6E02320
                          BSI     DS220     PRINT, CLEAR, RESET TAB 2-8 U6E02330
                    *                                                   U6E02340
                    *             FINISHED WITH ONE ENTRY.  UPDATE      U6E02350
                    *               POINTER TO SLET.                    U6E02360
                    DS180 MDX   2 +4        INCR SLET PTR           2-8 U6E02370
                          MDX  L  DS298,-1  DECR SLET ENTRY COUNT   2-8 U6E02380
                          MDX     DS100     BR IF SLET NOT EXHAUSTED2-8 U6E02390
                    *                                                   U6E02400
                    *             EXHAUSTED SLET ITEMS.  PRINT PENDING  U6E02410
                    *               LINE (MAY BE BLANK).                U6E02420
                    *                                                   U6E02430
                    DS350 BSI     DS220     PRINT THE LINE          2-8 U6E02440
                    *                                                   U6E02450
                    *             E X I T     F R O M     D S L E T     U6E02460
                    *                                                   U6E02470
                          EXIT                                      2-8 U6E02480
                          EJCT                                          U6E02490
                    *                                                   U6E02500
                    *             CONSTANTS AND WORK AREA               U6E02510
                    *                                                   U6E02520
                          BSS  E  0         ASSURE EVEN BOUNDARY    2-8 U6E02530
                    DS910 DC      /7002     VERTICAL SPACE FUNC CODE    U6E02540
                    DS911 DC      DS955-DS950  HEADER PRINT WORD COUNT  U6E02550
                    DS912 DC      /0001     MASK FOR APOSTROPHE     2-8 U6E02560
                    DS913 DC      9         DECIMAL NINE CONSTANT       U6E02570
                    DS914 DC      /F9-/C0   CONVERSION CONSTANT         U6E02580
                    DS915 DC      /C0       CONVERSION CONSTANT         U6E02590
                    DS919 DC      /007C     EBCDIC AT SIGN              U6E02600
                    DS920 DC      *-*       ADDR OF PRINCIPAL PRINT     U6E02610
                    DS921 DC      /0040     BLANK FOR CLEARING LINE 2-8 U6E02620
                    DS922 DC      /CE       MUP PHASE ID            2-9 U6E02621
                    DS923 DC      *-*       MUP REACHED SWITCH      2-9 U6E02622
                    *                                                   U6E02630
                    *             SERVICE ROUTINE TO PACK A LINE,       U6E02640
                    *               PRINT IT, CAUSE IT TO BE CLEARED    U6E02650
                    *               AND HORIZONTAL TAB POINTER RESET.   U6E02660
                    *                                                   U6E02670
                    DS220 DC      *-*       ENTRY POINT             2-8 U6E02680
                          STX   2 DS240+1   SAVE XR2                2-8 U6E02690
                          LDX  L2 DS930     XR2=ADDR PACKED LINE    2-8 U6E02700
                          LDX   3 -120      XR3=NEG WORD COUNT UNPKD2-8 U6E02710
                    *                                               2-8 U6E02720
                    DS230 LDD  L3 DS930+120 TWO WORDS UNPACKED      2-8 U6E02730
                          SLT     8         PACK TWO CHARS          2-8 U6E02740
                          SRA     8         *INTO                   2-8 U6E02750
                          SLT     8         *ONE WORD               2-8 U6E02760
                          STO   2 0         STORE INTO PACKED LINE  2-8 U6E02770
                          MDX   2 +1        INCR PTR TO PACKED LINE 2-8 U6E02780
                          MDX   3 +2        INCR PTR TO UNPKD LINE  2-8 U6E02790
                          MDX     DS230     BR IF LINE NOT FINISHED 2-8 U6E02800
                    *                                               2-8 U6E02810
                          LDX  L3 DS930-1   PRINT BUFFER ADDRESS    2-8 U6E02820
                          STX  L3 DS903+1   *                       2-8 U6E02830
                          LDD  L  DS903     FUNC CODE AND ADDRESS   2-8 U6E02840
                          BSI  I  DS920     INVOKE DEVICE ROUTINE   2-8 U6E02850
                          LD   L  $PBSY     PRINT BUSY INDICATOR    2-8 U6E02860
                          BSC     -Z        SKIP IF BUFFER FREE     2-8 U6E02870
                          MDX     *-4       BR IF NOT YET FREE      2-8 U6E02880
                    *                                               2-8 U6E02890
                          BSI     DS250     BR TO CLEAR AND RESET   2-8 U6E02900
                    *                                               2-8 U6E02910
                    DS240 LDX  L2 *-*       RESTORE XR2             2-8 U6E02920
                          BSC  I  DS220     RETURN TO CALLER        2-8 U6E02930
                    *                                                   U6E02940
                    *             INNER SERVICE ROUTINE TO CLEAR        U6E02950
                    *               BUFFER AND RESET HORIZONTAL TAB     U6E02960
                    *                                                   U6E02970
                    DS250 DC      *-*       ENTRY POINT             2-8 U6E02980
                          LDX   3 -120      POINTER/COUNTER         2-8 U6E02990
                          LD      DS921     ACC=/0040               2-8 U6E03000
                    *                                               2-8 U6E03010
                    DS260 STO  L3 DS930+120  CLEAR PRINT            2-8 U6E03020
                          MDX   3 +1        *AREA TO                2-8 U6E03030
                          MDX     DS260     *ALL BLANKS             2-8 U6E03040
                    *                                               2-8 U6E03050
                          LDX   3 4         SET NO. ENTRIES/LINE    2-8 U6E03060
                          STX   3 DS295     *INTO COUNTER           2-8 U6E03070
                          LDX  L3 DS930     XR3=PTR TO TAB STOP 1   2-8 U6E03080
                          STX   3 DS290     TAB PTR NOW RESET       2-8 U6E03090
                    *                                               2-8 U6E03100
                          BSC  I  DS250     RETURN TO CALLER        2-8 U6E03110
                    *                                                   U6E03120
                    *             CONSTANT AND WORK AREAS               U6E03130
                    *                                                   U6E03140
                    DS290 DC      *-*       HORIZ TAB POINTER       2-8 U6E03150
                    DS295 DC      *-*       NO. TABS REMAINING      2-8 U6E03160
                    DS298 DC      240       MAX NO. SLET ENTRIES    2-8 U6E03170
                          EJCT                                          U6E03180
                    *                                                   U6E03190
                    *             SERVICE ROUTINE TO CONVERT BINARY IN  U6E03200
                    *               ACC TO UNPACKED EBCDIC REPRESEN-    U6E03210
                    *               TATION OF HEX DIGITS                U6E03220
                    *                                                   U6E03230
                    DS200 DC      *-*       ENTRY POINT             2-8 U6E03240
                          SRT     16        BINARY VALUE TO EXT     2-8 U6E03250
                          LDX  I3 DS200     XR3=ADDR OF ARG LIST    2-8 U6E03260
                          LD    3 0         ACC=NO. DIGITS          2-8 U6E03270
                          STO     DS215     SAVE NO. DIGITS         2-8 U6E03280
                          LD    3 1         ACC=DISPLACEMENT        2-8 U6E03290
                          A       DS290     ADD TAB POINTER         2-8 U6E03300
                          STO     *+1       SET XR3 TO              2-8 U6E03310
                          LDX  L3 *-*       *RIGHT END ADDRESS      2-8 U6E03320
                          MDX  L  DS200,+2  PREPARE RETURN ADDRESS  2-8 U6E03330
                    *                                               2-8 U6E03340
                    DS210 SLA     16        CLEAR ACC               2-8 U6E03350
                          RTE     4         ACC(BITS 0-3)=HEX DIGIT 2-8 U6E03360
                          SRA     12        ACC=/000X               2-8 U6E03370
                          S       DS913     SUBTRACT 9              2-8 U6E03380
                          BSC     +         SKIP IF WAS /A-/F       2-8 U6E03390
                          A       DS914     ADD /39 IF WAS /0-/9    2-8 U6E03400
                          A       DS915     ALWAYS ADD /C0          2-8 U6E03410
                          STO   3 0         STORE UNPACKED EBC CHAR 2-8 U6E03420
                          MDX   3 -1        DECR POINTER TO LINE    2-8 U6E03430
                          MDX  L  DS215,-1  DECR COUNT              2-8 U6E03440
                          MDX     DS210     BR IF MORE TO CONVERT   2-8 U6E03450
                    *                                               2-8 U6E03460
                          BSC  I  DS200     RETURN TO CALLER        2-8 U6E03470
                    *                                               2-8 U6E03480
                    DS215 DC      *-*       SAVE NO. DIGITS         2-8 U6E03490
                    *                                                   U6E03500
                    *             BUFFERS AND TABLES                    U6E03510
                    *                                                   U6E03520
                    *                       *CODING REMOVED*        2-8 U6E03530
                    *                                                   U6E03540
                    *             UNPACKED/PACKED ENTRY LINE BUFFER     U6E03550
                    *                                                   U6E03560
                          BSS  E  1                                 2-8 U6E03570
                          DC      60        WORD COUNT FOR PRINT    2-8 U6E03580
                    DS930 BSS     120       PACKED/UNPACKED LINE    2-8 U6E03590
                    *                                                   U6E03600
                    *             FIRST HEADER LINE BUFFER              U6E03610
                    *                                                   U6E03620
                          BSS  E  0         MAKE ADDRESS EVEN           U6E03630
                          DC      15        WORD COUNT FOR DISK READ    U6E03640
                          DC      /0007     SECTOR ADDR OF HEADER       U6E03650
                    DS950 EBC     .                    .  40            U6E03660
                          EBC     .                    .  *BLANKS       U6E03670
                          EBC     .SYSTEM LOCATION EQUIVALENCE TABLE .  U6E03680
                          EBC     .(SLET).                              U6E03690
                    DS955 EQU     *         END OF BUFFER               U6E03700
                    *                                                   U6E03710
                    *             FIRST LINE OF SUBHEADING              U6E03720
                    *                                                   U6E03730
                          BSS  E  1                                     U6E03740
                          DC      DS965-DS960  WORD COUNT               U6E03750
                    DS960 EBC     .SYMBOL PH  CORE  WORD  SCTR .        U6E03760
                          EBC     .   SYMBOL PH  CORE  WORD  SCTR    .  U6E03770
                          EBC     .SYMBOL PH  CORE  WORD  SCTR .        U6E03780
                          EBC     .   SYMBOL PH  CORE  WORD  SCTR.      U6E03790
                    DS965 EQU     *         END OF BUFFER               U6E03800
                    *                                                   U6E03810
                    *             SECOND LINE OF SUBHEADING             U6E03820
                    *                                                   U6E03830
                          BSS  E  1                                     U6E03840
                          DC      DS975-DS970                           U6E03850
                    DS970 EBC     .       ID  ADDR  COUNT ADDR .        U6E03860
                          EBC     .          ID  ADDR  COUNT ADDR    .  U6E03870
                          EBC     .       ID  ADDR  COUNT ADDR .        U6E03880
                          EBC     .          ID  ADDR  COUNT ADDR.      U6E03890
                    DS975 EQU     *                                     U6E03900
                    *                                                   U6E03910
                    *             THIRD LINE OF SUBHEADING              U6E03920
                    *                                                   U6E03930
                          BSS  E  1                                     U6E03940
                          DC      DS985-DS980                           U6E03950
                    DS980 EBC     .*****  **  ****  ****  **** .        U6E03960
                          EBC     .   *****  **  ****  ****  ****    .  U6E03970
                          EBC     .*****  **  ****  ****  **** .        U6E03980
                          EBC     .   *****  **  ****  ****  ****.      U6E03990
                    DS985 EQU     *                                     U6E04000
                    *                                                   U6E04010
                    *             SLET BUFFER                           U6E04020
                    *                                                   U6E04030
                          BSS  E  0                                     U6E04040
                    DS990 DC      960       BUFFER WORD COUNT       2-8 U6E04050
                          DC      /0003     SLET SECTOR ADDRESS         U6E04060
                          BSS     960       RESERVE 960 WORDS       2-8 U6E04070
                    *                                                   U6E04080
                    *             SLET MNEMONIC NAME TABLE              U6E04090
                    *                                                   U6E04100
                    *             DISK UTILITY PROGRAM - PART I     2-8 U6E04110
                    *                                                   U6E04120
                    DS800 DC      /01       PHASE ID                    U6E04130
                          EBC     .@DDUP .  DUPCO                       U6E04140
                          DC      /02       PHASE ID                    U6E04150
                          EBC     .@DCTL .  DUP CONTROL - PART 1    2-8 U6E04160
                          DC      /03       PHASE ID                    U6E04170
                          EBC     .@STOR .  STORE                       U6E04180
                          DC      /04       PHASE ID                    U6E04190
                          EBC     .@FILQ .  FILE EQUATE                 U6E04200
                          DC      /05       PHASE ID                    U6E04210
                          EBC     .@DUMP .  DUMP                        U6E04220
                          DC      /06       PHASE ID                    U6E04230
                          EBC     .@DL/F .  DUMP LET/FLET               U6E04240
                          DC      /07       PHASE ID                    U6E04250
                          EBC     .@DLTE .  DELETE                      U6E04260
                          DC      /08       PHASE ID                    U6E04270
                          EBC     .@DFNE .  DEFINE                      U6E04280
                          DC      /09       PHASE ID                    U6E04290
                          EBC     .@EXIT .  DEXIT                       U6E04300
                          DC      /0A       PHASE ID                    U6E04310
                          EBC     .@CFCE .  CARD INTERFACE              U6E04320
                          DC      /0B       PHASE ID                    U6E04330
                          EBC     .@DU11 .  KEYBOARD INTERFACE          U6E04340
                          DC      /0C       PHASE ID                    U6E04350
                          EBC     .@DU12 .  PAPER TAPE INTERFACE        U6E04360
                          DC      /0D       PHASE ID                    U6E04370
                          EBC     .@DU13 .  DUP UPCOR                   U6E04380
                          DC      /0E       PHASE ID                    U6E04390
                          EBC     .@DU14 .  DUP PRINCIPAL I/O           U6E04400
                          DC      /0F       PHASE ID                    U6E04410
                          EBC     .@DU15 .  DUP PRINCIPAL I/O SANS KB   U6E04420
                          DC      /10       PHASE ID                    U6E04430
                          EBC     .@DU16 .  DUP PAPER TAPE I/O          U6E04440
                          DC      /11       PHASE ID                    U6E04450
                          EBC     .@PRCI .  PRE CORE IMAGE              U6E04460
                          DC      /12       PHASE ID                    U6E04470
                          EBC     .@DU18 .  DUP RESERVED                U6E04480
                    *                                                   U6E04490
                    *             FORTRAN COMPILER                      U6E04500
                    *                                                   U6E04510
                          DC      /1F       PHASE ID                    U6E04520
                          EBC     .@FR01 .  INPUT                       U6E04530
                          DC      /20       PHASE ID                    U6E04540
                          EBC     .@FR02 .  CLASSIFIER                  U6E04550
                          DC      /21       PHASE ID                    U6E04560
                          EBC     .@FR03 .  CHECK ORDER/STMNT NUMBER    U6E04570
                          DC      /22       PHASE ID                    U6E04580
                          EBC     .@FR04 .  COMMON/SUBROUTINE OR FUNC   U6E04590
                          DC      /23       PHASE ID                    U6E04600
                          EBC     .@FR05 .  DIM/REAL, INTEGER, EXTERNAL U6E04610
                          DC      /24       PHASE ID                    U6E04620
                          EBC     .@FR06 .  REAL CONSTANTS              U6E04630
                          DC      /25       PHASE ID                    U6E04640
                          EBC     .@FR07 .  DEFN FILE, CALL LINK/EXIT   U6E04650
                          DC      /26       PHASE ID                    U6E04660
                          EBC     .@FR08 .  VARIABLES AND STMNT FUNC    U6E04670
                          DC      /27       PHASE ID                    U6E04680
                          EBC     .@FR09 .  DATA STATEMENT              U6E04690
                          DC      /28       PHASE ID                    U6E04700
                          EBC     .@FR10 .  FORMAT                      U6E04710
                          DC      /29       PHASE ID                    U6E04720
                          EBC     .@FR11 .  SUBSCRIPT DECOMPOSITION     U6E04730
                          DC      /2A       PHASE ID                    U6E04740
                          EBC     .@FR12 .  ASCAN I                     U6E04750
                          DC      /2B       PHASE ID                    U6E04760
                          EBC     .@FR13 .  ASCAN II                    U6E04770
                          DC      /2C       PHASE ID                    U6E04780
                          EBC     .@FR14 .  DO, CONTINUE, ETC           U6E04790
                          DC      /2D       PHASE ID                    U6E04800
                          EBC     .@FR15 .  SUBSCRIPT OPTIMIZE          U6E04810
                          DC      /2E       PHASE ID                    U6E04820
                          EBC     .@FR16 .  SCAN                        U6E04830
                          DC      /2F       PHASE ID                    U6E04840
                          EBC     .@FR17 .  EXPANDER I                  U6E04850
                          DC      /30       PHASE ID                    U6E04860
                          EBC     .@FR18 .  EXPANDER II                 U6E04870
                          DC      /31       PHASE ID                    U6E04880
                          EBC     .@FR19 .  DATA ALLOCATION             U6E04890
                          DC      /32       PHASE ID                    U6E04900
                          EBC     .@FR20 .  COMPILATION ERRORS          U6E04910
                          DC      /33       PHASE ID                    U6E04920
                          EBC     .@FR21 .  STATEMENT ALLOCATION        U6E04930
                          DC      /34       PHASE ID                    U6E04940
                          EBC     .@FR22 .  LIST STATEMENT ALLOCATION   U6E04950
                          DC      /35       PHASE ID                    U6E04960
                          EBC     .@FR23 .  LIST SYMBOLS                U6E04970
                          DC      /36       PHASE ID                    U6E04980
                          EBC     .@FR24 .  LIST CONSTANTS              U6E04990
                          DC      /37       PHASE ID                    U6E05000
                          EBC     .@FR25 .  OUTPUT I                    U6E05010
                          DC      /38       PHASE ID                    U6E05020
                          EBC     .@FR26 .  OUTPUT II                   U6E05030
                          DC      /39       PHASE ID                    U6E05040
                          EBC     .@FR27 .  RECOVERY                    U6E05050
                          DC      /3A       PHASE ID                    U6E05060
                          EBC     .DUMMY .  DUMMY NAME                  U6E05070
                          DC      /3B       PHASE ID                    U6E05080
                          EBC     .DUMMY .  DUMMY NAME                  U6E05090
                          DC      /3C       PHASE ID                    U6E05100
                          EBC     .DUMMY .  DUMMY NAME                  U6E05110
                    *                                               2-9 U6E05120
                    *             COBOL COMPILER                    2-9 U6E05130
                    *                                               2-9 U6E05140
                          DC      /51       PHASE ID                2-9 U6E05150
                          EBC     .@QCTL .  PROCESS CTL CDS         2-9 U6E05160
                          DC      /52       PHASE ID                2-9 U6E05170
                          EBC     .@QTXT .  SOURCE TEXT REDUCTION   2-9 U6E05180
                          DC      /53       PHASE ID                2-9 U6E05190
                          EBC     .@QLIT .  LITERAL ALLOCATION      2-9 U6E05200
                          DC      /54       PHASE ID                2-9 U6E05210
                          EBC     .@QDTA .  DATA DIVISION PROCESSING2-9 U6E05220
                          DC      /55       PHASE ID                2-9 U6E05230
                          EBC     .@QPRO .  PROCEDURE DIV SCAN      2-9 U6E05240
                          DC      /56       PHASE ID                2-9 U6E05250
                          EBC     .@QGEN .  GENERATE INST STRINGS   2-9 U6E05260
                          DC      /57       PHASE ID                2-9 U6E05270
                          EBC     .@QOBJ .  PRODUCE DSF-MODULE      2-9 U6E05280
                          DC      /58       PHASE ID                2-9 U6E05290
                          EBC     .@QERR .  MAP/DIAGNOSTIC OUTPUT   2-9 U6E05300
                          DC      /59       PHASE ID                2-9 U6E05310
                          EBC     .@QEND .  COMPILE TERMINATION     2-9 U6E05320
                          DC      /5A       PHASE ID                2-9 U6E05330
                          EBC     .@QSER .  PRODUCE SERVICEABILITY  2-9 U6E05340
                          DC      /5B                              2-11 U6E05342
                          EBC     .@QXR1 .                         2-11 U6E05344
                          DC      /5C                              2-11 U6E05346
                          EBC     .@QXR2 .                         2-11 U6E05348
                    *                                                   U6E05350
                    *             SUPERVISOR                            U6E05360
                    *                                                   U6E05370
                          DC      /6E       PHASE ID                    U6E05380
                          EBC     .@SUP1 .  MONITOR CTRL RCD ANALYZER   U6E05390
                          DC      /6F       PHASE ID                    U6E05400
                          EBC     .@SUP2 .  JOB RECORD PROCESSING   2-4 U6E05410
                          DC      /70       PHASE ID                    U6E05420
                          EBC     .@SUP3 .  DELETE TEMPOTARY LET    2-4 U6E05430
                          DC      /71       PHASE ID                    U6E05440
                          EBC     .@SUP4 .  XEQ RECORD PROCESSING   2-4 U6E05450
                          DC      /72                               2-2 U6E05460
                          EBC     .@SUP5 .  SCR PROCESSING          2-4 U6E05470
                          DC      /73                               2-4 U6E05480
                          EBC     .@SUP6 .  SYSTEM DUMP PROGRAM     2-4 U6E05490
                          DC      /74                               2-4 U6E05500
                          EBC     .@SUP7 .  AUXILIARY SUPERVISOR    2-4 U6E05510
                    *                                                   U6E05520
                    *             CORE LOAD BUILDER                     U6E05530
                    *                                                   U6E05540
                          DC      /78       PHASE ID                    U6E05550
                          EBC     .@CLB1 .  PHASE 1                     U6E05560
                          DC      /79       PHASE ID                    U6E05570
                          EBC     .@CLB2 .  PHASE 2                     U6E05580
                          DC      /7A       PHASE ID                    U6E05590
                          EBC     .@CLB3 .  PHASE 3                     U6E05600
                          DC      /7B       PHASE ID                    U6E05610
                          EBC     .@CLB4 .  PHASE 4                     U6E05620
                          DC      /7C       PHASE ID                    U6E05630
                          EBC     .@CLB5 .  PHASE 5                     U6E05640
                          DC      /7D       PHASE ID                    U6E05650
                          EBC     .@CLB6 .  PHASE 6                     U6E05660
                          DC      /7E       PHASE ID                    U6E05670
                          EBC     .@CLB7 .  PHASE 7                     U6E05680
                          DC      /7F       PHASE ID                    U6E05690
                          EBC     .@CLB8 .  PHASE 8                     U6E05700
                          DC      /80       PHASE ID                    U6E05710
                          EBC     .@CLB9 .  PHASE 9                     U6E05720
                          DC      /81       PHASE ID                    U6E05730
                          EBC     .@CLBA .  PHASE 10                    U6E05740
                          DC      /82       PHASE ID                    U6E05750
                          EBC     .@CLBB .  PHASE 11                    U6E05760
                          DC      /83       PHASE ID                    U6E05770
                          EBC     .@CLBC .  PHASE 12                    U6E05780
                          DC      /84                               2-2 U6E05790
                          EBC     .@CLBD .  PHASE 13 (GRAPHICS)     2-2 U6E05800
                    *                                                   U6E05810
                    *             SYSTEM DEVICE SUBROUTINES             U6E05820
                    *                                                   U6E05830
                          DC      /8C       PHASE ID                    U6E05840
                          EBC     .@1403 .  1403 SUBR                   U6E05850
                          DC      /8D       PHASE ID                    U6E05860
                          EBC     .@1132 .  1132 SUBR                   U6E05870
                          DC      /8E       PHASE ID                    U6E05880
                          EBC     .@CPTR .  CONSOLE PRINTER SUBR        U6E05890
                          DC      /8F       PHASE ID                    U6E05900
                          EBC     .@2501 .  2501 SUBR                   U6E05910
                          DC      /90       PHASE ID                    U6E05920
                          EBC     .@1442 .  1442 SUBR                   U6E05930
                          DC      /91       PHASE ID                    U6E05940
                          EBC     .@1134 .  1134 SUBR                   U6E05950
                          DC      /92       PHASE ID                    U6E05960
                          EBC     .@KBCP .  KB/CONSOLE PRINTER SUBR     U6E05970
                          DC      /93       PHASE ID                    U6E05980
                          EBC     .@CDCV .  2501/1442 CONVERSION SUBR   U6E05990
                          DC      /94       PHASE ID                    U6E06000
                          EBC     .@PTCV .  1134 CONVERSION SUBR        U6E06010
                          DC      /95       PHASE ID                    U6E06020
                          EBC     .@KBCV .  KB/CP CONVERSION SUBR       U6E06030
                          DC      /96       PHASE ID                    U6E06040
                          EBC     .@DZID .  DISKZ                       U6E06050
                          DC      /97       PHASE ID                    U6E06060
                          EBC     .@D1ID .  DISK1                       U6E06070
                          DC      /98       PHASE ID                    U6E06080
                          EBC     .@DNID .  DISKN                       U6E06090
                          DC      /99       PHASE ID                    U6E06100
                          EBC     .@PPRT .  PRINCIPAL PRINT SUBROUTINE  U6E06110
                          DC      /9A       PHASE ID                    U6E06120
                          EBC     .@PIWK .  PRINCIPAL INPUT SUBROUTINE  U6E06130
                          DC      /9B       PHASE ID                    U6E06140
                          EBC     .@PIXK .  PRINCIPAL INPUT W/O KB      U6E06150
                          DC      /9C       PHASE ID                    U6E06160
                          EBC     .@PCWK .  PRINCIPAL CONV W/ KEYBOARD  U6E06170
                          DC      /9D       PHASE ID                    U6E06180
                          EBC     .@PCXK .  PRINCIPAL CONV W/O KEYBOARD U6E06190
                    *                                                   U6E06200
                    *             CORE IMAGE LOADER                     U6E06210
                    *                                                   U6E06220
                          DC      /A0       PHASE ID                    U6E06230
                          EBC     .@CIL1 .  PHASE 1                     U6E06240
                          DC      /A1       PHASE ID                    U6E06250
                          EBC     .@CIL2 .  PHASE 2                     U6E06260
                    *                                               2-5 U6E06270
                    *     REPORT PROGRAM GENERATOR                  2-5 U6E06280
                    *                                               2-5 U6E06290
                          DC      /B0       PHASE ID                2-5 U6E06300
                          EBC     .@RG00 .  PHASE 0                 2-5 U6E06310
                          DC      /B1       PHASE ID                2-5 U6E06320
                          EBC     .@RG02 .  PHASE 2                 2-5 U6E06330
                          DC      /B2       PHASE ID                2-5 U6E06340
                          EBC     .@RG04 .  PHASE 4                 2-5 U6E06350
                          DC      /B3       PHASE ID                2-5 U6E06360
                          EBC     .@RG06 .  PHASE 6                 2-5 U6E06370
                          DC      /B4       PHASE ID                2-5 U6E06380
                          EBC     .@RG08 .  PHASE 8                 2-5 U6E06390
                          DC      /B5       PHASE ID                2-5 U6E06400
                          EBC     .@RG10 .  PHASE 10                2-5 U6E06410
                          DC      /B6       PHASE ID                2-5 U6E06420
                          EBC     .@RG12 .  PHASE 12                2-5 U6E06430
                          DC      /B7       PHASE ID                2-5 U6E06440
                          EBC     .@RG14 .  PHASE 14                2-5 U6E06450
                          DC      /B8       PHASE ID                2-5 U6E06460
                          EBC     .@RG16 .  PHASE 16                2-5 U6E06470
                          DC      /B9       PHASE ID                2-5 U6E06480
                          EBC     .@RG17 .  PHASE 17                2-5 U6E06490
                          DC      /BA       PHASE ID                2-5 U6E06500
                          EBC     .@RG19 .  PHASE 19                2-5 U6E06510
                          DC      /BB       PHASE ID                2-5 U6E06520
                          EBC     .@RG20 .  PHASE 20                2-5 U6E06530
                          DC      /BC       PHASE ID                2-5 U6E06540
                          EBC     .@RG21 .  PHASE 21                2-5 U6E06550
                          DC      /BD       PHASE ID                2-5 U6E06560
                          EBC     .@RG22 .  PHASE 22                2-5 U6E06570
                          DC      /BE       PHASE ID                2-5 U6E06580
                          EBC     .@RG24 .  PHASE 24                2-5 U6E06590
                          DC      /BF       PHASE ID                2-5 U6E06600
                          EBC     .@RG26 .  PHASE 26                2-5 U6E06610
                          DC      /C0       PHASE ID                2-5 U6E06620
                          EBC     .@RG28 .  PHASE 28                2-5 U6E06630
                          DC      /C1       PHASE ID                2-5 U6E06640
                          EBC     .@RG32 .  PHASE 32                2-5 U6E06650
                          DC      /C2       PHASE ID                2-5 U6E06660
                          EBC     .@RG34 .  PHASE 34                2-5 U6E06670
                          DC      /C3       PHASE ID                2-5 U6E06680
                          EBC     .@RG36 .  PHASE 36                2-5 U6E06690
                          DC      /C4       PHASE ID                2-5 U6E06700
                          EBC     .@RG38 .  PHASE 38                2-5 U6E06710
                          DC      /C5       PHASE ID                2-5 U6E06720
                          EBC     .@RG40 .  PHASE 40                2-5 U6E06730
                          DC      /C6       PHASE ID                2-5 U6E06740
                          EBC     .@RG42 .  PHASE 42                2-5 U6E06750
                          DC      /C7       PHASE ID                2-5 U6E06760
                          EBC     .@RG44 .  PHASE 44                2-5 U6E06770
                          DC      /C8       PHASE ID                2-5 U6E06780
                          EBC     .@RG46 .  PHASE 46                2-5 U6E06790
                          DC      /C9       PHASE ID                2-5 U6E06800
                          EBC     .@RG52 .  PHASE 52                2-5 U6E06810
                          DC      /CA       PHASE ID                2-5 U6E06820
                          EBC     .@RG54 .  PHASE 54                2-5 U6E06830
                          DC      /CB       PHASE ID                2-5 U6E06840
                          EBC     .@RG58 .  PHASE 58                2-5 U6E06850
                          DC      /CC       PHASE ID                2-5 U6E06860
                          EBC     .@RG60 .  PHASE 60                2-5 U6E06870
                    *                                               2-8 U6E06880
                    *             DISK UTILITY PROGRAM - PART II    2-8 U6E06890
                    *                                               2-8 U6E06900
                          DC      /CD       PHASE ID                2-8 U6E06910
                          EBC     .@DCL2 .  DUP CONTROL - PART 2    2-8 U6E06920
                          DC      /CE       PHASE ID                2-8 U6E06930
                          EBC     .@DMUP .  MACRO UPDATE PROGRAM    2-8 U6E06940
                    *                                               2-8 U6E06950
                    *             ASSEMBLER                         2-8 U6E06960
                    *                                               2-8 U6E06970
                          DC      /CF       PHASE ID                2-8 U6E06980
                          EBC     .@AS00 .  PHASE 0                 2-8 U6E06990
                          DC      /D0       PHASE ID                2-8 U6E07000
                          EBC     .@ACNV .  CARD CONVERSION         2-8 U6E07010
                          DC      /D1       PHASE ID                2-8 U6E07020
                          EBC     .@AS10 .  PHASE 10                2-8 U6E07030
                          DC      /D2       PHASE ID                2-8 U6E07040
                          EBC     .@AS11 .  PHASE 11                2-8 U6E07050
                          DC      /D3       PHASE ID                2-8 U6E07060
                          EBC     .@AS12 .  PHASE 12                2-8 U6E07070
                          DC      /D4       PHASE ID                2-8 U6E07080
                          EBC     .@AERM .  ERROR MESSAGES          2-8 U6E07090
                          DC      /D5       PHASE ID                2-8 U6E07100
                          EBC     .@AS01 .  PHASE 1                 2-8 U6E07110
                          DC      /D6       PHASE ID                2-8 U6E07120
                          EBC     .@AS1A .  PHASE 1A                2-8 U6E07130
                          DC      /D7       PHASE ID                2-8 U6E07140
                          EBC     .@ASYM .  SYSTEM SYMBOL TABLE     2-8 U6E07150
                          DC      /D8       PHASE ID                2-8 U6E07160
                          EBC     .@AS03 .  PHASE 3                 2-8 U6E07170
                          DC      /D9       PHASE ID                2-8 U6E07180
                          EBC     .@AS04 .  PHASE 4                 2-8 U6E07190
                          DC      /DA       PHASE ID                2-8 U6E07200
                          EBC     .@AS02 .  PHASE 2                 2-8 U6E07210
                          DC      /DB       PHASE ID                2-8 U6E07220
                          EBC     .@AS2A .  PHASE 2A                2-8 U6E07230
                          DC      /DC       PHASE ID                2-8 U6E07240
                          EBC     .@AS09 .  PHASE 9                 2-8 U6E07250
                          DC      /DD       PHASE ID                2-8 U6E07260
                          EBC     .@AS05 .  PHASE 5                 2-8 U6E07270
                          DC      /DE       PHASE ID                2-8 U6E07280
                          EBC     .@AS06 .  PHASE 6                 2-8 U6E07290
                          DC      /DF       PHASE ID                2-8 U6E07300
                          EBC     .@AS07 .  PHASE 7                 2-8 U6E07310
                          DC      /E0       PHASE ID                2-8 U6E07320
                          EBC     .@AS7A .  PHASE 7A                2-8 U6E07330
                          DC      /E1       PHASE ID                2-8 U6E07340
                          EBC     .@AS08 .  PHASE 8                 2-8 U6E07350
                          DC      /E2       PHASE ID                2-8 U6E07360
                          EBC     .@AS8A .  PHASE 8A                2-8 U6E07370
                          DC      /E3       PHASE ID                2-8 U6E07380
                          EBC     .@APCV .  CARD PUNCH CONVERSION   2-8 U6E07390
                          DC      /E4       PHASE ID                2-8 U6E07400
                          EBC     .@AINT .  INTERMEDIATE DISK OUTPT 2-8 U6E07410
                          DC      /E5       PHASE ID                2-8 U6E07420
                          EBC     .@ASAA .  PHASE 10A               2-8 U6E07430
                          DC      /E6       PHASE ID                2-8 U6E07440
                          EBC     .@ASGR .  PHASE 13 GRAPHICS       2-8 U6E07450
                          DC      /E7       PHASE ID                2-8 U6E07460
                          EBC     .@ADIV .  DIVISION OPERATOR       2-8 U6E07470
                          DC      /E8       PHASE ID                2-8 U6E07480
                          EBC     .@AMCC .  MACRO CONTROL CARDS III 2-8 U6E07490
                          DC      /E9       PHASE ID                2-8 U6E07500
                          EBC     .@AM01 .  MACRO PHASE 1           2-8 U6E07510
                          DC      /EA       PHASE ID                2-8 U6E07520
                          EBC     .@AM1A .  MACRO PHASE 1A          2-8 U6E07530
                          DC      /EB       PHASE ID                2-8 U6E07540
                          EBC     .@AM1B .  MACRO PHASE 1B          2-8 U6E07550
                          DC      /EC       PHASE ID                2-8 U6E07560
                          EBC     .@AM02 .  MACRO PHASE 2           2-8 U6E07570
                          DC      /ED       PHASE ID                2-8 U6E07580
                          EBC     .@AM2A .  MACRO PHASE 2A          2-8 U6E07590
                          DC      /EE       PHASE ID                2-8 U6E07600
                          EBC     .@AM2B .  MACRO PHASE 2B          2-8 U6E07610
                          DC      /EF       PHASE ID                2-8 U6E07620
                          EBC     .@AM03 .  MACRO PHASE 3           2-8 U6E07630
                          DC      /F0       PHASE ID                2-8 U6E07640
                          EBC     .@AM3A .  MACRO PHASE 3A          2-8 U6E07650
                          DC      /F1       PHASE ID                2-8 U6E07660
                          EBC     .@AM3B .  MACRO PHASE 3B          2-8 U6E07670
                          DC      /F2       PHASE ID                2-8 U6E07680
                          EBC     .@AX01 .  CROSS REF - PART 1      2-8 U6E07690
                          DC      /F3       PHASE ID                2-8 U6E07700
                          EBC     .@AX2A .  CROSS REF - PART 2A     2-8 U6E07710
                          DC      /F4       PHASE ID                2-8 U6E07720
                          EBC     .@AX2B .  CROSS REF - PART 2B     2-8 U6E07730
                          DC      /F5       PHASE ID                2-8 U6E07740
                          EBC     .@AX2C .  CROSS REF - PART 2C     2-8 U6E07750
                          DC      /F6       PHASE ID                2-8 U6E07760
                          EBC     .@AX03 .  CROSS REF - PART 3      2-8 U6E07770
                    *                                              2-11 U6E07780
                    *        MSP7 ASSEMBLER PHASE ID TABLE         2-11 U6E07790
                    *                                              2-11 U6E07800
                          DC      /100                             2-11 U6E07810
                          EBC     .@AS00 .                         2-11 U6E07820
                          DC      /101                             2-11 U6E07830
                          EBC     .@ACNV .                         2-11 U6E07840
                          DC      /102                             2-11 U6E07850
                          EBC     .@AS10 .                         2-11 U6E07860
                          DC      /103                             2-11 U6E07870
                          EBC     .@AS11 .                         2-11 U6E07880
                          DC      /104                             2-11 U6E07890
                          EBC     .@AS12 .                         2-11 U6E07900
                          DC      /105                             2-11 U6E07910
                          EBC     .@AERM .                         2-11 U6E07920
                          DC      /106                             2-11 U6E07930
                          EBC     .@AS01 .                         2-11 U6E07940
                          DC      /107                             2-11 U6E07950
                          EBC     .@AS1A .                         2-11 U6E07960
                          DC      /108                             2-11 U6E07970
                          EBC     .@ASYM .                         2-11 U6E07980
                          DC      /109                             2-11 U6E07990
                          EBC     .@AS03 .                         2-11 U6E08000
                          DC      /10A                             2-11 U6E08010
                          EBC     .@AS04 .                         2-11 U6E08020
                          DC      /10B                             2-11 U6E08030
                          EBC     .@AS02 .                         2-11 U6E08040
                          DC      /10C                             2-11 U6E08050
                          EBC     .@AS2A .                         2-11 U6E08060
                          DC      /10D                             2-11 U6E08070
                          EBC     .@AS09 .                         2-11 U6E08080
                          DC      /10E                             2-11 U6E08090
                          EBC     .@AS05 .                         2-11 U6E08100
                          DC      /10F                             2-11 U6E08110
                          EBC     .@AS06 .                         2-11 U6E08120
                          DC      /110                             2-11 U6E08130
                          EBC     .@AS07 .                         2-11 U6E08140
                          DC      /111                             2-11 U6E08150
                          EBC     .@AS7A .                         2-11 U6E08160
                          DC      /112                             2-11 U6E08170
                          EBC     .@AS08 .                         2-11 U6E08180
                          DC      /113                             2-11 U6E08190
                          EBC     .@AS8A .                         2-11 U6E08200
                          DC      /114                             2-11 U6E08210
                          EBC     .@APCV .                         2-11 U6E08220
                          DC      /115                             2-11 U6E08230
                          EBC     .@AINT .                         2-11 U6E08240
                          DC      /116                             2-11 U6E08250
                          EBC     .@ASAA .                         2-11 U6E08260
                          DC      /117                             2-11 U6E08270
                          EBC     .@ASGR .                         2-11 U6E08280
                          DC      /118                             2-11 U6E08290
                          EBC     .@ADIV .                         2-11 U6E08300
                          DC      /119                             2-11 U6E08310
                          EBC     .@AMCC .                         2-11 U6E08320
                          DC      /11A                             2-11 U6E08330
                          EBC     .@AM01 .                         2-11 U6E08340
                          DC      /11B                             2-11 U6E08350
                          EBC     .@AM1A .                         2-11 U6E08360
                          DC      /11C                             2-11 U6E08370
                          EBC     .@AM1B .                         2-11 U6E08380
                          DC      /11D                             2-11 U6E08390
                          EBC     .@AM02 .                         2-11 U6E08400
                          DC      /11E                             2-11 U6E08410
                          EBC     .@AM2A .                         2-11 U6E08420
                          DC      /11F                             2-11 U6E08430
                          EBC     .@AM2B .                         2-11 U6E08440
                          DC      /120                             2-11 U6E08450
                          EBC     .@AM03 .                         2-11 U6E08460
                          DC      /121                             2-11 U6E08470
                          EBC     .@AM3A .                         2-11 U6E08480
                          DC      /122                             2-11 U6E08490
                          EBC     .@AM3B .                         2-11 U6E08500
                          DC      /123                             2-11 U6E08510
                          EBC     .@AX01 .                         2-11 U6E08520
                          DC      /124                             2-11 U6E08530
                          EBC     .@AX2A .                         2-11 U6E08540
                          DC      /125                             2-11 U6E08550
                          EBC     .@AX2B .                         2-11 U6E08560
                          DC      /126                             2-11 U6E08570
                          EBC     .@AX2C .                         2-11 U6E08580
                          DC      /127                             2-11 U6E08590
                          EBC     .@AX03 .                         2-11 U6E08600
                          DC      /128                             2-11 U6E08610
                          EBC     .@ASP7 .                         2-11 U6E08620
                    *                                              2-11 U6E08630
                    *     BLANK ENTRY                              2-11 U6E08640
                    *                                              2-11 U6E08650
                    DS810 DC      0                                2-11 U6E08660
                          EBC     .      .                         2-11 U6E08670
                          END     DS000                            2-11 U6E08680
