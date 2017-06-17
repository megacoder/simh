                          HDNG    EBCDIC TO IBM CARD CODE OR VICE VERSA U3H00010
                    *************************************************** U3H00020
                    *                                                 * U3H00030
                    *   SUBROUTINE NAME-                              * U3H00040
                    *      FULL NAME- EBCDIC TO IBM CARD CODE OR IBM  * U3H00050
                    *         CARD CODE TO EBCDIC CONVERSION ROUTINE  * U3H00060
                    *      CODE NAME- SPEED                           * U3H00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS ALL 256     * U3H00080
                    *      CHARS IN EBCDIC TO HOLLERITH, AND CONVERTS * U3H00090
                    *      ALL 256 CHARS IN HOLLERITH TO EBCDIC.      * U3H00100
                    *   METHOD-                                       * U3H00110
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3H00120
                    *   CAPABILITIES AND LIMITATIONS-                 * U3H00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3H00140
                    *   SPECIAL FEATURES- N/A                         * U3H00150
                    *   ADDITIONAL INFORMATION-                       * U3H00160
                    *      ESTIMATED EXECUTION TIME-                  * U3H00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3H00180
                    *                                                 * U3H00190
                    *************************************************** U3H00200
                          HDNG    EBCDIC TO IBM CARD CODE OR VICE VERSA U3H00210
                          LIBR                                          U3H00220
                          ENT     SPEED                                 U3H00230
                    SPEED STX   1 SAV1+1    CALL ENTRY POINT            U3H00240
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3H00250
                          STX   2 SAV2+1    SAVE XR2                    U3H00260
                          STS     SAVST     SAVE STATUS                 U3H00270
                          STD     SAVAQ     SAVE ACC AND EXT            U3H00280
                          LD    1 0         GET CONTROL PARAM           U3H00290
                          SRT     4                                     U3H00300
                          STO     CTRL      SAVE NO-PACKING INDR        U3H00310
                          LD    1 1                                     U3H00320
                          STO     INPUT+1   SAVE INPUT ADDRESS          U3H00330
                          LD    1 2                                     U3H00340
                          STO     OUTPT+1   SAVE OUTPUT ADDRESS         U3H00350
                          LD    1 3                                     U3H00360
                          STO     COUNT     SAVE CHAR COUNT             U3H00370
                          MDX   1 +4                                    U3H00380
                          STX   1 EXIT+1    SET EXIT TO SKIP 4 PARAMS   U3H00390
                    INPUT LDX  L1 0         XR1=INPUT ADDR              U3H00400
                    OUTPT LDX  L2 0         XR2=OUTPUT ADDR             U3H00410
                          SRA     16        WHAT IS INPUT CODE          U3H00420
                          SLT     4                                     U3H00430
                          BSC  L  BACK,Z    BR IF INPUT IS EBCDIC       U3H00440
                          LD      CTRL      IS PACKING REQUESTED        U3H00450
                          BSC  L  ONCE,Z    NO, DO NOT PACK EBCDIC      U3H00460
                    *                                                   U3H00470
                    *THIS SECTION SETS UP THE CONVERSION FROM HOLLERITH U3H00480
                    *TO EBCDIC                                          U3H00490
                    *                                                   U3H00500
                    LEFT  LD    1 0         IS LEFT CHAR READ IN YET    U3H00510
                          BSC  L  LEFT,E    NO, WAIT                    U3H00520
                          BSI     TLU       YES, CONVERT TO EBCDIC      U3H00530
                          STO     TEMP                                  U3H00540
                          MDX  L  COUNT,-1  ANY MORE CHARS              U3H00550
                          MDX     RIGHT     YES, GO CONVERT RT CHAR     U3H00560
                          LD    2 0         NO, STORE CHAR IN           U3H00570
                          AND     MASKL     OUTPUT BUT DO NOT           U3H00580
                          A       TEMP      CHANGE RIGHT 8 BITS         U3H00590
                          STO   2 0         OF OUTPUT.                  U3H00600
                          MDX     SAVST                                 U3H00610
                    RIGHT LD    1 1         IS RIGHT CHAR READ IN YET   U3H00620
                          BSC  L  RIGHT,E   NO, WAIT                    U3H00630
                          BSI     TLU          YES, CONVERT TO EBCDIC   U3H00640
                          SRA     8                                     U3H00650
                          A       TEMP      ADD LEFT CHARACTER          U3H00660
                          STO   2 0         STORE BOTH IN OUTPUT        U3H00670
                          MDX   2 +1        SET XR2 FOR NEXT OUTPUT     U3H00680
                          MDX   1 +2        SET XR1 FOR NEXT INPUT      U3H00690
                          NOP               IN CASE OF SKIP         2-6 U3H00692
                          MDX  L  COUNT,-1  ANY MORE CHARS              U3H00700
                          MDX     LEFT      YES, REPEAT LOOP            U3H00710
                          MDX     SAVST     NO, EXIT                    U3H00720
                    ONCE  LD    1 0         IS CHAR READ IN YET         U3H00730
                          BSC  L  ONCE,E    NO, WAIT                    U3H00740
                          BSI     TLU       YES, CONVERT TO EBCDIC      U3H00750
                          STO   2 0         STORE CHAR IN OUTPUT        U3H00760
                          MDX   2 +1        SET XR2 FOR NEXT OUTPUT     U3H00770
                          MDX   1 +1        SET XR1 FOR NEXT INPUT      U3H00780
                          NOP               IN CASE OF SKIP         2-6 U3H00782
                          MDX  L  COUNT,-1  ANY MORE CHARS              U3H00790
                          MDX     ONCE      YES, GO CHK FOR READ IN     U3H00800
                    SAVST LDS     0                                     U3H00810
                    SAV1  LDX  L1 0         RESTORE STATUS              U3H00820
                    SAV2  LDX  L2 0                                     U3H00830
                          LDD     SAVAQ                                 U3H00840
                    EXIT  BSC  L  0         RETURN TO USER              U3H00850
                    *                                                   U3H00860
                    *THIS SECTION SETS UP THE CONVERSION FROM EBCDIC    U3H00870
                    *TO HOLLERITH.                                      U3H00880
                    *                                                   U3H00890
                    BACK  LD    1 0                                     U3H00900
                          BSI     TLU20     CONVERT LEFT CHAR           U3H00910
                          STO   2 0                                     U3H00920
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3H00930
                          LD      CTRL      IS EBCDIC PACKED            U3H00940
                          BSC  L  BACK6,Z   NO, GET NEXT INPUT WORD     U3H00950
                          MDX  L  COUNT,-1  ANY MORE CHARS TO CONVERT   U3H00960
                          MDX     BACK4                                 U3H00970
                          MDX     SAVST     NO, EXIT                    U3H00980
                    BACK4 LD    1 0         CONVERT RIGHT CHAR          U3H00990
                          SLA     8                                     U3H01000
                          BSI     TLU20                                 U3H01010
                          STO   2 0                                     U3H01020
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3H01030
                    BACK6 MDX   1 +1        SET FOR NEXT INPUT WORD     U3H01040
                          NOP               IN CASE OF SKIP         2-6 U3H01042
                          MDX  L  COUNT,-1  ANY MORE CHARS TO CONVERT   U3H01050
                          MDX     BACK      YES, REPEAT LOOP            U3H01060
                          MDX     SAVST     NO, EXIT                    U3H01070
                    *                                                   U3H01080
                    *CONSTANTS AND BUFFER AREA                          U3H01090
                    *                                                   U3H01100
                    BLANK DC      /4000     EBCDIC BLANK CHARACTER      U3H01110
                    CTRL  DC      0         SAVE PACKING INDR           U3H01120
                    COUNT DC      0         SAVE NO, CHARS TO CONVERT   U3H01130
                    D0001 DC      +1        DECIMAL CONSTANT            U3H01140
                    D0006 DC      +6        DECIMAL CONSTANT            U3H01150
                    D0007 DC      +7        DECIMAL CONSTANT            U3H01160
                    FLAG  DC      0         ERROR INDICATOR             U3H01170
                    H0010 DC      /0010     HOLLERITH                   U3H01180
                    H006A DC      /006A     CONSTANTS                   U3H01190
                    H0200 DC      /0200     AND MASKS.                  U3H01200
                    H1FC0 DC      /1FC0     MASK FOR 1-7 ROWS           U3H01210
                    H2001 DC      /2001     SET OVERFLOW INDR           U3H01220
                    MASKL DC      /00FF     CLEAR BITS 0-7              U3H01230
                    MASKR DC      /FF00     CLEAR BITS 8-15             U3H01240
                    SAVA  DC      0         SAVE ACCUMULATOR            U3H01250
                    SAVAQ BSS  E  2         SAVE ACC AND EXTENSION      U3H01260
                    TEMP  DC      0         TEMP FOR PACKING            U3H01270
                    *                                                   U3H01280
                    TLU   DC      0         SAVE RETURN ADDRESS         U3H01290
                    *                                                   U3H01300
                    *THIS SECTION DOES A TABLE LOOKUP CONVERSION        U3H01310
                    *                                                   U3H01320
                          STO     SAVA      SAVE INPUT CHAR             U3H01330
                          SRT     6         PACK 12,11,0 ROWS NEXT TO   U3H01340
                          SRA     7         8,9 ROWS AND STORE          U3H01350
                          SRT     3         IN EXTENSION.               U3H01360
                          LD      SAVA      DETERMINE WHICH ONE OF      U3H01370
                          STX   1 OUT+1     ROW 1-7 PUNCHED.            U3H01380
                          LDX   1 10                                    U3H01390
                          AND     H1FC0                                 U3H01400
                          SLCA  1 0                                     U3H01410
                          SLA     1         IS MULTIPLE PUNCH IN 1-7    U3H01420
                          BSC  L  OK,+-     NO                          U3H01430
                          LD      H2001                                 U3H01440
                          STO     SAVST                                 U3H01450
                          LD      BLANK     YES, SET ERROR FLAG PLUS    U3H01460
                          MDX     OUT                                   U3H01470
                    OK    STX   1 SAVA      XR1= 0 IF NO 1-7 PUNCH,     U3H01480
                          LD      SAVA      =1 IF 7 PUNCH, ...          U3H01490
                          S       D0001     =7 IF 1 PUNCH.              U3H01500
                          AND     D0007                                 U3H01510
                          SLT     4                                     U3H01520
                          STO     ROW+1     ADD 12, 11, 0, AND 8 ROWS   U3H01530
                          SLT     17        STORE 9 ROW IN CARRY        U3H01540
                    ROW   LDX  L1 0         XR1= TABLE LOOK-UP VALUE    U3H01550
                          LD   L1 TABLE     OBTAIN EBCDIC CHARS         U3H01560
                          BSC     C         IS CARRY SET (9 ROW)        U3H01570
                          SLA     8         YES, USE RIGHT CHAR         U3H01580
                          AND     MASKR     NO, USE LEFT CHAR           U3H01590
                    OUT   LDX  L1 0         RESTORE XR1                 U3H01600
                          BSC  I  TLU       EXIT                        U3H01610
                    TLU20 NOP               SAVE RETURN ADDRESS         U3H01620
                          SRA     8                                     U3H01630
                          STO     TLU30+1   RIGHT 3 BITS TELL WHICH     U3H01640
                          S       H006A     IS CHAR = 6A                U3H01650
                          BSC     Z         YES, CORRECT FOR BLOCK 7    U3H01660
                          A       H006A     NO, DETERMINE BLOCK         U3H01670
                          AND     D0007     16-BIT BLOCK OF TABLE       U3H01680
                          EOR     D0007     (0 OR 1 = BLOCK 7, 2 =      U3H01690
                          S       D0006     BLOCK 6, ..., 7 =           U3H01700
                          BSC     +-        BLOCK 0)                    U3H01710
                          A       D0001                                 U3H01720
                          A       D0007                                 U3H01730
                          SLA     4                                     U3H01740
                          STO     TLU22+1                               U3H01750
                          STX   1 TLU32+1                               U3H01760
                    TLU22 LDX  L1 0         XR1=END OF PERTINENT BLOCK  U3H01770
                    TLU24 LD      TLU30+1                               U3H01780
                          SLA     8         DOES INPUT MATCH TABLE      U3H01790
                          A       TLU30+1                               U3H01800
                          EOR  L1 TABLE-1                               U3H01810
                          SRT     8                                     U3H01820
                          BSC  L  TLU28,+-  YES, WITH LEFT CHAR         U3H01830
                          SRA     16                                    U3H01840
                          SLT     8                                     U3H01850
                          BSC  L  TLU26,+-  YES, WITH RIGHT CHAR        U3H01860
                          MDX   1 -1        NO, TRY NEXT TABLE WORD     U3H01870
                          MDX     TLU24                                 U3H01880
                    TLU26 LD      H0010     ADD 9-ROW BIT IF RIGHT      U3H01890
                    TLU28 STO     TLU22+1   CHAR MATCHED.               U3H01900
                          MDX   1 -1                                    U3H01910
                          NOP                                           U3H01920
                          STX   1 TLU30+1   XR1= PACKED HOLLERITH VALUE U3H01930
                          LD      TLU30+1                               U3H01940
                          SRT     4         SAVE 12,11,0,8 IN EXTENSION U3H01950
                          STO     TLU30+1                               U3H01960
                    TLU30 LDX  L1 0         XR1=COMPLEMENT OF 1-7       U3H01970
                          LD      H0200     (0 IF 7 ROW, 6 IF 1 ROW,    U3H01980
                          SLA   1 0         7 IF NO ROW)                U3H01990
                          SRA     3                                     U3H02000
                          A       TLU22+1   SAVE UNPACKED 1-7 AND 9     U3H02010
                          STO     TLU22+1   ROWS.                       U3H02020
                          SLT     3         SEPARATE 12,11,0 FROM       U3H02030
                          SLA     7         8 ROW AS BRING ROWS         U3H02040
                          SLT     1         IN FROM EXTENSION.          U3H02050
                          SLA     5                                     U3H02060
                          A       TLU22+1   = UNPACKED HOLLERITH CHAR   U3H02070
                    TLU32 LDX  L1 0                                     U3H02080
                          BSC  I  TLU20     EXIT                        U3H02090
                    *                                                   U3H02100
                    *             EBCDIC CHARACTER TABLE - BASED ON     U3H02110
                    *             PACKED HOLLERITH(1-7 ROW CMPL-1,12,   U3H02120
                    *             11,0,8 ROWS...RT CHAR IF 9 ROW).      U3H02130
                    *                                                   U3H02140
                    *             EBCDIC,HOLLERITH ROW PUNCHES,LEFT,RT. U3H02150
                    *                                                   U3H02160
                    *             NOTE:  BLANK COMMENTS FIELDS INDICATE U3H02170
                    *                    AN UNUSED CONFIGURATION IN THE U3H02180
                    *                    TABLE.  SINCE THE TABLE VALUES U3H02190
                    *                    ARE FOUND BY A COMPUTED  ADDR, U3H02200
                    *                    ALL BIT COMBINATIONS,INCLUDING U3H02210
                    *                    THOSE WHICH DO NOT REPRESENT A U3H02220
                    *                    VALID CHAR,MUST BE INCLUDED.   U3H02230
                    *                                                   U3H02240
                    TABLE DC      /F737  7,(9)              7      EOT  U3H02250
                          DC      /7F3F  7,8,(9)                        U3H02260
                          DC      /E727  7,0,(9)            X      PRE  U3H02270
                          DC      /6F2F  7,0,8,(9)                      U3H02280
                          DC      /D717  7,11,(9)           P      IDL  U3H02290
                          DC      /5F1F  7,11,8,(9)                     U3H02300
                          DC      /A767  7,11,0,(9)                     U3H02310
                          DC      /AFEF  7,11,0,8,(9)                   U3H02320
                          DC      /C707  7,12,(9)           G      DEL  U3H02330
                          DC      /4F0F  7,12,8,(9)                     U3H02340
                          DC      /8747  7,12,0,(9)                     U3H02350
                          DC      /8FCF  7,12,0,8,(9)                   U3H02360
                          DC      /9757  7,12,11,(9)                    U3H02370
                          DC      /9FDF  7,12,11,8,(9)                  U3H02380
                          DC      /B777  7,12,11,0,(9)                  U3H02390
                          DC      /BFFF  7,12,11,0,8,(9)                U3H02400
                    *                                                   U3H02410
                          DC      /F636  6,(9)              6      UC   U3H02420
                          DC      /7E3E  6,8,(9)            EQUAL       U3H02430
                          DC      /E626  6,0,(9)            W      EOB  U3H02440
                          DC      /6E2E  6,0,8,(9)                      U3H02450
                          DC      /D616  6,11,(9)           O      BS   U3H02460
                          DC      /5E1E  6,11,8,(9)                     U3H02470
                          DC      /A666  6,11,0,(9)                     U3H02480
                          DC      /AEEE  6,11,0,8,(9)                   U3H02490
                          DC      /C606  6,12,(9)           F      LC   U3H02500
                          DC      /4E0E  6,12,8,(9)         PLUS        U3H02510
                          DC      /8646  6,12,0,(9)                     U3H02520
                          DC      /8ECE  6,12,0,8,(9)                   U3H02530
                          DC      /9656  6,12,11,(9)                    U3H02540
                          DC      /9EDE  6,12,11,8,(9)                  U3H02550
                          DC      /B676  6,12,11,0,(9)                  U3H02560
                          DC      /BEFE  6,12,11,0,8,(9)                U3H02570
                    *                                                   U3H02580
                          DC      /F535  5,(9)              5      RS   U3H02590
                          DC      /7D3D  5,8,(9)                        U3H02600
                          DC      /E525  5,0,(9)            V      LF   U3H02610
                          DC      /6D2D  5,0,8,(9)                      U3H02620
                          DC      /D515  5,11,(9)           N      NL   U3H02630
                          DC      /5D1D  5,11,8,(9)         )           U3H02640
                          DC      /A565  5,11,0,(9)                     U3H02650
                          DC      /ADED  5,11,0,8,(9)                   U3H02660
                          DC      /C505  5,12,(9)           E      HT   U3H02670
                          DC      /4D0D  5,12,8,(9)         (           U3H02680
                          DC      /8545  5,12,0,(9)                     U3H02690
                          DC      /8DCD  5,12,0,8,(9)                   U3H02700
                          DC      /9555  5,12,11,(9)                    U3H02710
                          DC      /9DDD  5,12,11,8,(9)                  U3H02720
                          DC      /B575  5,12,11,0,(9)                  U3H02730
                          DC      /BDFD  5,12,11,0,8,(9)                U3H02740
                    *                                                   U3H02750
                          DC      /F434  4,(9)              4      PN   U3H02760
                          DC      /7C3C  4,8,(9)                        U3H02770
                          DC      /E424  4,0,(9)            U      BYP  U3H02780
                          DC      /6C2C  4,0,8,(9)                      U3H02790
                          DC      /D414  4,11,(9)           M      RES  U3H02800
                          DC      /5C1C  4,11,8,(9)         *           U3H02810
                          DC      /A464  4,11,0,(9)                     U3H02820
                          DC      /ACEC  4,11,0,8,(9)                   U3H02830
                          DC      /C404  4,12,(9)           D      PF   U3H02840
                          DC      /4C0C  4,12,8,(9)                     U3H02850
                          DC      /8444  4,12,0,(9)                     U3H02860
                          DC      /8CCC  4,12,0,8,(9)                   U3H02870
                          DC      /9454  4,12,11,(9)                    U3H02880
                          DC      /9CDC  4,12,11,8,(9)                  U3H02890
                          DC      /B474  4,12,11,0,(9)                  U3H02900
                          DC      /BCFC  4,12,11,0,8,(9)                U3H02910
                    *                                                   U3H02920
                          DC      /F333  3,(9)              3           U3H02930
                          DC      /7B3B  3,8,(9)                        U3H02940
                          DC      /E323  3,0,(9)            T           U3H02950
                          DC      /6B2B  3,0,8,(9)          COMMA       U3H02960
                          DC      /D313  3,11,(9)           L           U3H02970
                          DC      /5B1B  3,11,8,(9)         $           U3H02980
                          DC      /A363  3,11,0,(9)                     U3H02990
                          DC      /ABEB  3,11,0,8,(9)                   U3H03000
                          DC      /C303  3,12,(9)           C           U3H03010
                          DC      /4B0B  3,12,8,(9)         .           U3H03020
                          DC      /8343  3,12,0,(9)                     U3H03030
                          DC      /8BCB  3,12,0,8,(9)                   U3H03040
                          DC      /9353  3,12,11,(9)                    U3H03050
                          DC      /9BDB  3,12,11,8,(9)                  U3H03060
                          DC      /B373  3,12,11,0,(9)                  U3H03070
                          DC      /BBFB  3,12,11,0,8,(9)                U3H03080
                    *                                                   U3H03090
                          DC      /F232  2,(9)              2           U3H03100
                          DC      /7A3A  2,8,(9)                        U3H03110
                          DC      /E222  2,0,(9)            S           U3H03120
                          DC      /E02A  2,0,8,(9)                      U3H03130
                          DC      /D212  2,11,(9)           K           U3H03140
                          DC      /5A1A  2,11,8,(9)                     U3H03150
                          DC      /A262  2,11,0,(9)                     U3H03160
                          DC      /AAEA  2,11,0,8,(9)                   U3H03170
                          DC      /C202  2,12,(9)           B           U3H03180
                          DC      /4A0A  2,12,8,(9)                     U3H03190
                          DC      /8242  2,12,0,(9)                     U3H03200
                          DC      /8ACA  2,12,0,8,(9)                   U3H03210
                          DC      /9252  2,12,11,(9)                    U3H03220
                          DC      /9ADA  2,12,11,8,(9)                  U3H03230
                          DC      /B272  2,12,11,0,(9)                  U3H03240
                          DC      /BAFA  2,12,11,0,8,(9)                U3H03250
                    *                                                   U3H03260
                          DC      /F131  1,(9)              1           U3H03270
                          DC      /7939  1,8,(9)                        U3H03280
                          DC      /6121  1,0,(9)            SLASH       U3H03290
                          DC      /6929  1,0,8,(9)                      U3H03300
                          DC      /D111  1,11,(9)           J           U3H03310
                          DC      /5919  1,11,8,(9)                     U3H03320
                          DC      /A1E1  1,11,0,(9)                     U3H03330
                          DC      /A020  1,11,0,8,(9)                   U3H03340
                          DC      /C101  1,12,(9)           A           U3H03350
                          DC      /4909  1,12,8,(9)                     U3H03360
                          DC      /8141  1,12,0,(9)                     U3H03370
                          DC      /8000  1,12,0,8,(9)              NUL  U3H03380
                          DC      /9151  1,12,11,(9)                    U3H03390
                          DC      /9010  1,12,11,8,(9)                  U3H03400
                          DC      /B171  1,12,11,0,(9)                  U3H03410
                          DC      /B030  1,12,11,0,8,(9)                U3H03420
                    *                                                   U3H03430
                          DC      /40F9  BLANK,(9)          BLNK   9    U3H03440
                          DC      /F838  8,(9)              8           U3H03450
                          DC      /F0E9  0,(9)              ZERO   Z    U3H03460
                          DC      /E828  0,8,(9)            Y           U3H03470
                          DC      /60D9  11,(9)             DASH   R    U3H03480
                          DC      /D818  11,8,(9)           Q           U3H03490
                          DC      /D0A9  11,0,(9)                       U3H03500
                          DC      /A868  11,0,8,(9)                     U3H03510
                          DC      /50C9  12,(9)                    I    U3H03520
                          DC      /C808  12,8,(9)           H           U3H03530
                          DC      /C089  12,0,(9)                       U3H03540
                          DC      /8848  12,0,8,(9)                     U3H03550
                          DC      /6A99  12,11,(9)                      U3H03560
                          DC      /9858  12,11,8,(9)                    U3H03570
                          DC      /70B9  12,11,0,(9)                    U3H03580
                          DC      /B878  12,11,0,8,(9)                  U3H03590
                          END                                           U3H03600
