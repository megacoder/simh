                    *************************************************** V1B00010
                    *                                                 * V1B00020
                    * STATUS - VERSION 2, MODIFICATION 8                V1B00030
                    *   SUBROUTINE NAME-                              * V1B00040
                    *      FULL NAME- EXTENDED PRECISION ANNOTATION   * V1B00050
                    *         SUBROUTINE.                             * V1B00060
                    *      CODE NAME- ECHRX                           * V1B00070
                    *   PURPOSE- FORMS THE CHARACTERS SPECIFIED BY    * V1B00080
                    *      COMPUTER OUTPUT DATA USING PARAMETERS FROM * V1B00090
                    *      THE CHARACTER SUBROUTINE (ECHAR).          * V1B00100
                    *   METHOD- N/A                                   * V1B00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1B00120
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1B00130
                    *      (FORM C26-3755).                           * V1B00140
                    *   SPECIAL FEATURES- N/A                         * V1B00150
                    *   ADDITIONAL INFORMATION- N/A                   * V1B00160
                    *                                                 * V1B00170
                    *************************************************** V1B00180
                    *                                                   V1B00190
                    *             THE CALL TO THE ECHRX ROUTINE         V1B00200
                    *             IS AS FOLLOWS                         V1B00210
                    *                                                   V1B00220
                    *             LIBF ECHRI                            V1B00230
                    *             DC   0                                V1B00240
                    *             DC   BUFFER OF CHARACTERS TO PLOT     V1B00250
                    *             DC   0                                V1B00260
                    *                                                   V1B00270
                    *             LIBF VCHRI                            V1B00280
                    *                  XR1 = BUFFER ADDRESS         2-8 V1B00290
                    *                  XR2 = CHAR COUNT             2-8 V1B00300
                    *                                                   V1B00310
                    *             LIBF ECHRX                            V1B00320
                    *                  XR1 = XS+12                      V1B00330
                    *                  .                                V1B00340
                    *                  .                                V1B00350
                    *                  .                                V1B00360
                    *                  .                                V1B00370
                    *      XS     XFLC X-SCALE (REAL)                   V1B00380
                    *             XFLC Y-SCALE (REAL)                   V1B00390
                    *             XFLC COS(THETA)                       V1B00400
                    *             XFLC SIN(THETA)                       V1B00410
                    *                                                   V1B00420
                          EPR                                           V1B00430
                          LIBR                                          V1B00440
                          ENT     ECHRX     ENTRY FROM ECHAR CALL       V1B00450
                          ENT     ECHRI     ENTRY FROM FIO WRITE STMNT  V1B00460
                          ENT     VCHRI     ENTRY FROM FIO WRITE STMNT  V1B00470
                    VCHRI STX   2 CNT       SET CHARACTER COUNT         V1B00480
                          LDX  I2 *-*       SET EXIT                    V1B00490
                          STX   2 EXIT                                  V1B00500
                          STX   1 SV1       SAVE XR1                    V1B00510
                          STX   2 SV2       SAVE XR2                    V1B00520
                          LDX  L2 V         SET XR2 WITH V              V1B00530
                          LD      AN0       SET 1 CHARACTER/WORD SWITCH V1B00540
                          STO     AN1                                   V1B00550
                          STX  L1 ADD       SET BUFFER ADDRESS          V1B00560
                          MDX     AN                                    V1B00570
                    CNT   DC      *-*       CHARACTER COUNT             V1B00580
                    XOX   MDX  L  NLET,10    MAKE TEN MORE          2-8 V1B00590
                          LD    2 NLET-V     GET NUMBER OF LETTERS  2-8 V1B00600
                          MDX  L  SW3,1      TURN ON CNTRL SW       2-8 V1B00610
                          MDX     MB1        CALCULATE COORDINATES  2-8 V1B00620
                    XOX1  MDX  L  CNT,-1     SKIP IF BUFFER OUTPUTED    V1B00630
                          MDX     AN0                                   V1B00640
                    RTN   LDX  L1 *-*       RESTORE XR1 AND XR2         V1B00650
                    SV1   EQU     *-1                                   V1B00660
                          LDX  L2 *-*                                   V1B00670
                    SV2   EQU     *-1                                   V1B00680
                          BSC  L  *-*       EXIT                        V1B00690
                    EXIT  EQU     *-1       RETURN                      V1B00700
                    ECHRI STX   1 SV1       SAVE XR1                    V1B00710
                          LDX  I1 *-*                                   V1B00720
                          STX   2 SV2       SAVE XR2                    V1B00730
                          LDX  L2 V         SET XR2 WITH V              V1B00740
                          LD    1 1         GET ADDRESS OF BUFFER       V1B00750
                          A     2 H0002-V                               V1B00760
                          STO   2 ADD-V                                 V1B00770
                          S     2 H0002-V   GET COUNT                   V1B00780
                          STO     *+1                                   V1B00790
                          LD   L  *-*       LOAD COUNT                  V1B00800
                          S     2 H0001-V                               V1B00810
                          SLA     1                                     V1B00820
                          STO     CNT       CHARACTER COUNT             V1B00830
                          MDX   1 2                                     V1B00840
                          STX   1 EXIT      SET EXIT IF TEST FUNCTION   V1B00850
                          LD    1 -2                                    V1B00860
                          BSC  L  RTN,+-    BRANCH IF FIO TEST FUNCTION V1B00870
                          MDX   1 1                                     V1B00880
                          STX   1 EXIT      SET FOR NORMAL RETURN       V1B00890
                          LD      CN1       SET FOR MULTIPLE FIO        V1B00900
                          STO     AN1       MODIFY INST TO SLA 16       V1B00910
                          SLA     16        NORMALIZE SW1               V1B00920
                    AN    STO   2 SW1-V                                 V1B00930
                          SLT     32                                2-8 V1B00940
                          STO   2 NLET-V     CLEAR                  2-8 V1B00950
                          STD   2 XLAST-V    CLEAR XLAST,YLAST      2-8 V1B00960
                          LD      CNT       CHECK FOR ZERO COUNT        V1B00970
                          BSC  L  RTN,+-    BRANCH IF NO BUFFER         V1B00980
                    AN0   LD    2 SW1-V     SW1 NORMAL                  V1B00990
                          BSC  L  AN1,Z     BRANCH IF N0                V1B01000
                          STX  L0 SW1       TAG SW1                     V1B01010
                          LD   I  ADD       GET LEFT CHARACTER          V1B01020
                          SRA     8                                     V1B01030
                          MDX     AN2                                   V1B01040
                    AN1   SLA     16  -*-   NORMALIZE SW1               V1B01050
                          STO   2 SW1-V                                 V1B01060
                          LD   I  ADD       GET RIGHT CHARACTER         V1B01070
                          AND   2 H00FF-V                               V1B01080
                          MDX  L  ADD,1     INCREMENT ADD               V1B01090
                    *     STATEMENT REMOVED                         2-8 V1B01100
                    AN2   STO   2 SVCH-V    SAVE CHARACTER              V1B01110
                          LDX  L1 TABLE     POINT XR1 TO CHAR TABLE     V1B01120
                    AN3   LD    1 0         FETCH A CHARACTER           V1B01130
                          BSC  L  AN4,+-    BR IF END OF TABLE          V1B01140
                          SRT     8                                     V1B01150
                          AND   2 H00FF-V   COMPARE RIGHT 8 BITS WITH   V1B01160
                          EOR   2 SVCH-V    *SAVED CHARACTER            V1B01170
                          BSC  L  AN5,+-    BRANCH IF MATCH             V1B01180
                          SRA     8                                     V1B01190
                          SLT     8                                     V1B01200
                          STO     *+1                                   V1B01210
                          MDX  L1 *-*                                   V1B01220
                    *     STATEMENT REMOVED                         2-8 V1B01230
                          MDX     AN3       TRY NEXT CHARACTER          V1B01240
                    AN4   LDX  L1 LBLK-1    NOT IN TABLE, SUPPLY BLANK  V1B01250
                    AN5   MDX   1 1                                     V1B01260
                          STX   1 STRNG                                 V1B01270
                          SLA     16        NORMALIZE SW2               V1B01280
                          STO     SW2                                   V1B01290
                          STO     XN        XN = 0                      V1B01300
                          STO     YN        YN = 0                      V1B01310
                    CNO   LD      SW2       SW2 NORMAL                  V1B01320
                          BSC  L  CN1,Z     BRANCH IF NO                V1B01330
                          STX   0 SW2       TAG SW2                     V1B01340
                          LD   I  STRNG     GET LEFT COORDINATE         V1B01350
                          SRA     8                                     V1B01360
                          MDX     CN2                                   V1B01370
                    CN1   SLA     16        NORMALIZE SW2               V1B01380
                          STO     SW2                                   V1B01390
                          LD   I  STRNG     GET RIGHT COORDINATE        V1B01400
                          AND   2 H00FF-V                           2-8 V1B01410
                          MDX  L  STRNG,1   INCREMENT STRNG             V1B01420
                    *     STATEMENT REMOVD                          2-8 V1B01430
                    CN2   SRT     4         SET UP XN+1,YN+1            V1B01440
                          BSC  L  CNTL,+-   IS CORDINATE A CONTROL      V1B01450
                          S       H0001                                 V1B01460
                          STO     XN+1                                  V1B01470
                          SRA     4                                     V1B01480
                          SLT     4                                     V1B01490
                          S       H0001                                 V1B01500
                          STO     YN+1                                  V1B01510
                          LD      XN+1      CALCULATE DELTA X =         V1B01520
                    MB1   LIBF    FLOAT      (XN+1)*SIZEX           2-8 V1B01530
                          LIBF    EMPY                                  V1B01540
                          DC      XC                                    V1B01550
                          LIBF    EMPY      MULTIPLY C/FAC BY CONSTANT  V1B01560
                          DC      C10       *IN C10                     V1B01570
                          LIBF    EADD      ADD TO C/ADDR IN CP5        V1B01580
                          DC      CP5                                   V1B01590
                          LIBF    IFIX      CONVERT TO FIXED POINT NO.  V1B01600
                          STO     DELTX                                 V1B01610
                          LD      SW3        GET CNTRL SW           2-8 V1B01620
                          BSC  L  MOD2,Z     CONTINUE IF NOT ON     2-8 V1B01630
                          LD      YN+1      CALCULATE DELTA Y =         V1B01640
                          LIBF    FLOAT     (YN+1)*SIZEY                V1B01650
                          LIBF    EMPY      EXTENDED MULTIPLY           V1B01660
                          DC      YC                                    V1B01670
                          LIBF    EMPY      MULTIPLY C/FAC BY           V1B01680
                          DC      C10       *CONSTANT 10                V1B01690
                          LIBF    EADD                                  V1B01700
                          DC      CP5                                   V1B01710
                          LIBF    IFIX      CONVERT C/FAC TO INTEGER    V1B01720
                    MB2   STO     DELTY      *AND PACK UP IN ACC    2-8 V1B01730
                    *     STATEMENTS REMOVED                        2-8 V1B01740
                          M       SINT                                  V1B01750
                          STD     TEMP      DOUBLE STORE                V1B01760
                          LD      DELTX                                 V1B01770
                          M       COST                                  V1B01780
                          SD      TEMP                                  V1B01790
                          AD      ROUND                                 V1B01800
                          SLT     1                                     V1B01810
                          STO     X1         COMPUTED X1            2-8 V1B01820
                    *     STATEMENTS REMOVED                        2-8 V1B01830
                          LD      DELTY     COMPUTE Y1 AND PYN          V1B01840
                          M       COST                                  V1B01850
                          STD     TEMP                                  V1B01860
                          LD      DELTX                                 V1B01870
                          M       SINT      MULTIPLY BY INTEGER         V1B01880
                          AD      TEMP                                  V1B01890
                          AD      ROUND                                 V1B01900
                          SLT     1                                     V1B01910
                          STO     Y1         COMPUTED Y1            2-8 V1B01920
                          LD      SW3        TEST IF CNTRL SW ON    2-8 V1B01930
                          BSC  L  MOD3,Z     BRANCH IF ON           2-8 V1B01940
                          LD      X1                                2-8 V1B01950
                          S       XN                                2-8 V1B01960
                          STO     X1                                2-8 V1B01970
                          A       XN                                2-8 V1B01980
                          STO     XN                                2-8 V1B01990
                          LD      Y1                                2-8 V1B02000
                          S       YN                                    V1B02010
                          STO     Y1        COMPUTED Y1                 V1B02020
                          A       YN                                    V1B02030
                          STO     YN                                    V1B02040
                          LIBF    EINC      UPDATE SYSTEM X,Y           V1B02050
                          DC      X1                                    V1B02060
                          DC      Y1                                    V1B02070
                          LIBF    XYPLT     MOVE THE PEN                V1B02080
                          DC      X1                                    V1B02090
                          DC      Y1                                    V1B02100
                          LD      XINC                              2-8 V1B02110
                          A       X1                                2-8 V1B02120
                          STO     XINC       ACCUMULATE X INCR      2-8 V1B02130
                          LD      YINC                              2-8 V1B02140
                          A       Y1                                2-8 V1B02150
                          STO     YINC       ACCUMULATE Y INCR      2-8 V1B02160
                          MDX     CNO       BRANCH TO TEST SW2          V1B02170
                    CNTL  SRA     4         STOP CONTROL                V1B02180
                          SLT     4                                     V1B02190
                          STO     CNTLX     SET CONTROL PARAMETER       V1B02200
                          S       H0001      IS IT END OF STRING        V1B02210
                          BSC  L  XOX,+-    BRANCH IF YES               V1B02220
                          LIBF    PLOTI     PLOT CONTROL                V1B02230
                    CNTLX DC      *-*       CONTROL PARAMETER           V1B02240
                          MDX     CNO       BRANCH TO TEST SW2          V1B02250
                    *                                               2-8 V1B02260
                    MOD2  SLA     16                                2-8 V1B02270
                          MDX     MB2        CONTINUE               2-8 V1B02280
                    *                                                   V1B02290
                    *                       PROGRAM CONSTANTS           V1B02300
                    *                                                   V1B02310
                    V     EQU     *+128                                 V1B02320
                    ADD   DC      *-*       ARRAY (ONE WORD INTEGER)    V1B02330
                    SW1   DC      *-*        LEFT/RIGHT EBCDIC CHAR     V1B02340
                    SW2   DC      *-*        LEFT/RIGHT VALUE IN TABLE  V1B02350
                    SW3   DC      *-*        CONTROL SWITCH         2-8 V1B02360
                    SVCH  DC      *-*       SAVED CHARACTER             V1B02370
                    STRNG DC      *-*       COORDINATES, LEFT & RIGHT   V1B02380
                    SINT  DC      *-*       SAVED INTEGER               V1B02390
                    COST  DC      /7FFF                                 V1B02400
                    XN    DC      *-*                                   V1B02410
                          DC      *-*                                   V1B02420
                    YN    DC      *-*                                   V1B02430
                          DC      *-*                                   V1B02440
                    DELTX DC      *-*                                   V1B02450
                    DELTY DC      *-*                                   V1B02460
                          BSS  E  0                                 2-8 V1B02470
                    X1    DC      *-*                                   V1B02480
                    Y1    DC      *-*                                   V1B02490
                    C10   XFLC    10.                                   V1B02500
                    C32K  XFLC    32767.    CONSTANT                    V1B02510
                    XC    XFLC    .1         CHAR SIZE X                V1B02520
                    YC    XFLC    .1         CHAR SIZE Y                V1B02530
                    CCOS  XFLC    0.                                    V1B02540
                    CSIN  XFLC    1.                                    V1B02550
                    CP5   XFLC    .5                                    V1B02560
                          BSS  E  0                                     V1B02570
                    TEMP  DC      0                                     V1B02580
                          DC      0                                     V1B02590
                    ROUND DC      /0000     EVEN ADDRESS                V1B02600
                          DC      /4000     CONSTANT                    V1B02610
                    H00FF DC      /00FF      MASK TO REMOVE LAST BITS   V1B02620
                    H0001 DC      /1        CONSTANT                    V1B02630
                    H0002 DC      /2        CONSTANT                    V1B02640
                    NLET  DC      *-*        NUMBER OF LETTERS      2-8 V1B02650
                          BSS  E  0                                 2-8 V1B02660
                    XINC  DC      *-*        INCREMENT STORAGE      2-8 V1B02670
                    YINC  DC      *-*        INCREMENT STORAGE      2-8 V1B02680
                    XLAST DC      *-*        LAST X COORDINATE      2-8 V1B02690
                    YLAST DC      *-*        LAST Y COORDINATE      2-8 V1B02700
                    *                                               2-8 V1B02710
                    MOD3  LD      X1         GET COORDINATE         2-8 V1B02720
                          S       XLAST      SUBTRACT LAST COORD    2-8 V1B02730
                          S       XINC       SUBTRACT COMPUTED COOR 2-8 V1B02740
                          STO     XINC       DIFFERENCE IN XINC     2-8 V1B02750
                          LD      Y1         DO SAME FOR Y          2-8 V1B02760
                          S       YLAST                             2-8 V1B02770
                          S       YINC                              2-8 V1B02780
                          STO     YINC                              2-8 V1B02790
                          LIBF    EINC       UPDATE SYSTEM  X,Y     2-8 V1B02800
                          DC      XINC                              2-8 V1B02810
                          DC      YINC                              2-8 V1B02820
                          LIBF    XYPLT      MOVE PEN               2-8 V1B02830
                          DC      XINC                              2-8 V1B02840
                          DC      YINC                              2-8 V1B02850
                          LDD     X1                                2-8 V1B02860
                          STD     XLAST      UPDATE XLAST,YLAST     2-8 V1B02870
                          SLT     32                                2-8 V1B02880
                          STO     SW3        TURN OFF CNTRL SW      2-8 V1B02890
                          STD     XINC       CLEAR XINC,YINC        2-8 V1B02900
                          BSC  L  XOX1       RETURN                 2-8 V1B02910
                    *                                                   V1B02920
                    ECHRX MDX     *+2                                   V1B02930
                          BSC  I  *-*       RETURN                      V1B02940
                          STX   1 YLP+1                                 V1B02950
                          LDX   1 -12       GET XC,YC,CCOS,CSIN         V1B02960
                    YLP   LIBF    ELDX                                  V1B02970
                          DC      *-*                                   V1B02980
                          LIBF    ESTOX                                 V1B02990
                          DC      XC+12                                 V1B03000
                          MDX   1 3                                     V1B03010
                          MDX     YLP                                   V1B03020
                          LIBF    ELD       SINT=SIN(ANGLE)*32768.      V1B03030
                          DC      CSIN                                  V1B03040
                          LIBF    EMPY      EXTENDED MULTIPLY           V1B03050
                          DC      C32K      *BY 32,767.                 V1B03060
                          LIBF    IFIX      CONVERT TO INTEGER          V1B03070
                          STO     SINT      SAVE INTEGER                V1B03080
                          LIBF    ELD       COST=COS(ANGLE)*32768.      V1B03090
                          DC      CCOS                                  V1B03100
                          LIBF    EMPY      EXTENDED MULTIPLY           V1B03110
                          DC      C32K      *BY 32,767.                 V1B03120
                          LIBF    IFIX      CONVERT TO INTEGER          V1B03130
                          STO     COST      *AND STORE                  V1B03140
                          MDX     ECHRX+1                               V1B03150
                    *                                                   V1B03160
                    *                       CHARACTER TABLE             V1B03170
                    *                                                   V1B03180
                    TABLE DC      256*.A+LB-*                           V1B03190
                    LA    DC      /2100      2,1      P.D.              V1B03200
                          DC      /466B      4,6      6,11              V1B03210
                          DC      /8646      8,6      4,6               V1B03220
                          DC      /86A1      8,6     10,1               V1B03230
                          DC      /09B1      P.U.    11,1               V1B03240
                          DC      /0100      STOP                       V1B03250
                          DC      256*.B+LC-*                           V1B03260
                    LB    DC      /2100      2,1      P.D.              V1B03270
                          DC      /262B      2,6      2,11              V1B03280
                          DC      /9BAA      9,11    10,10              V1B03290
                          DC      /A796     10,7      9,6               V1B03300
                          DC      /2696      2,6      9,6               V1B03310
                          DC      /A5A2     10,5     10,2               V1B03320
                          DC      /9121      9,1      2,1               V1B03330
                          DC      /09B1      P.U.     11,1              V1B03340
                          DC      /0100      STOP                       V1B03350
                          DC      256*.C+LD-*                           V1B03360
                    LC    DC      /AA00     10,10     P.D.              V1B03370
                          DC      /9B3B      9,11     3,11              V1B03380
                          DC      /2A22      2,10     2,2               V1B03390
                          DC      /3191      3,1      9,1               V1B03400
                          DC      /A209     10,2      P.U.              V1B03410
                          DC      /B101     11,1      STOP              V1B03420
                          DC      256*.D+LE-*                           V1B03430
                    LD    DC      /2100      2,1      P.D.              V1B03440
                          DC      /2B9B      2,11                       V1B03450
                          DC      /AAA2     10,10    10,2               V1B03460
                          DC      /9121      9,1      2,1               V1B03470
                          DC      /09B1      P.U.    11,1               V1B03480
                          DC      /0100      STOP                       V1B03490
                          DC      256*.E+LF-*                           V1B03500
                    LE    DC      /AB00     10,11     P.D.              V1B03510
                          DC      /2B26      2,11     2,6               V1B03520
                          DC      /7626      7,6    2,6                 V1B03530
                          DC      /21A1      2,1     10,1               V1B03540
                          DC      /09B1      P.U.    11,1               V1B03550
                          DC      /0100      STOP                       V1B03560
                          DC      256*.F+LG-*                           V1B03570
                    LF    DC      /2100      2,1      P.D.              V1B03580
                          DC      /2676      2,6      7,6               V1B03590
                          DC      /262B      2,6      2,11              V1B03600
                          DC      /AB09     10,11     P.U.              V1B03610
                          DC      /B101     11,1                        V1B03620
                          DC      256*.G+LH-*                           V1B03630
                    LG    DC      /AA00     10,10     P.D.              V1B03640
                          DC      /9B3B      9,11     3,11              V1B03650
                          DC      /2A22      2,10     2,2               V1B03660
                          DC      /3191      3,1      9,1               V1B03670
                          DC      /A2A6     10,2      10,6              V1B03680
                          DC      /7609      7,6      P.U.              V1B03690
                          DC      /B101     11,1      STOP              V1B03700
                          DC      256*.H+LI-*                           V1B03710
                    LH    DC      /2100      2,1      P.D.              V1B03720
                          DC      /262B      2,6      2,11              V1B03730
                          DC      /26A6      2,6     10,6               V1B03740
                          DC      /ABA6     10,11    10,6               V1B03750
                          DC      /A109     10,1      P.U.              V1B03760
                          DC      /B101     11,1      STOP              V1B03770
                          DC      256*.I+LJ-*                           V1B03780
                    LI    DC      /3100      3,1      P.D.              V1B03790
                          DC      /6191      6,1      9,1               V1B03800
                          DC      /616B     6,1       6,11              V1B03810
                          DC      /3B6B      3,11                       V1B03820
                          DC      /9B09      9,11     P.U.              V1B03830
                          DC      /B101     11,1      STOP              V1B03840
                          DC      256*.J+LK-*                           V1B03850
                    LJ    DC      /2300      2,3      P.D.              V1B03860
                          DC      /2231      2,2      3,1               V1B03870
                          DC      /91A2      9,1     10,2               V1B03880
                          DC      /AB09     10,11     P.U.              V1B03890
                          DC      /B101     11,1      STOP              V1B03900
                          DC      256*.K+LL-*                           V1B03910
                    LK    DC      /2100      2,1      P.D.              V1B03920
                          DC      /252B      2,5      2,11              V1B03930
                          DC      /2558      2,5      5,8               V1B03940
                          DC      /8B58      8,11     5,8               V1B03950
                          DC      /A109     10,1      P.U.              V1B03960
                          DC      /B101     11,1      STOP              V1B03970
                          DC      256*.L+LM-*                           V1B03980
                    LL    DC      /2B00      2,11     P.D.              V1B03990
                          DC      /21A1      2,1     10,1               V1B04000
                          DC      /09B1      P.U.    11,1               V1B04010
                          DC      /0100      STOP                       V1B04020
                          DC      256*.M+LN-*                           V1B04030
                    LM    DC      /2100      2,1      P.D.              V1B04040
                          DC      /2B61      2,11     6,1               V1B04050
                          DC      /ABA1     10,11    10,1               V1B04060
                          DC      /09B1      P.U.    11,1               V1B04070
                          DC      /0100      STOP                       V1B04080
                          DC      256*.N+LO-*                           V1B04090
                    LN    DC      /2100      2,1      P.D.              V1B04100
                          DC      /2BA1      2,11    10,1               V1B04110
                          DC      /AB09     10,11     P.U.              V1B04120
                          DC      /B101     11,1      STOP              V1B04130
                          DC      256*.O+LP-*                           V1B04140
                    LO    DC      /2200      2,2      P.D.              V1B04150
                          DC      /2A3B      2,10     3,11              V1B04160
                          DC      /9BAA      9,11    10,10              V1B04170
                          DC      /A291     10,2      9,1               V1B04180
                          DC      /3122      3,1      2,2               V1B04190
                          DC      /09B1      P.U.    11,1               V1B04200
                          DC      /0100      STOP                       V1B04210
                          DC      256*.P+LQ-*                           V1B04220
                    LP    DC      /2100      2,1      P.D.              V1B04230
                          DC      /262B      2,6      2,11              V1B04240
                          DC      /9BAA      9,11    10,10              V1B04250
                          DC      /A796     10,7      9,6               V1B04260
                          DC      /2609      2,6      P.U.              V1B04270
                          DC      /B101     11,1      STOP              V1B04280
                          DC      256*.Q+LR-*                           V1B04290
                    LQ    DC      /8300      8,3      P.D.              V1B04300
                          DC      /92A4      9,2     10,4               V1B04310
                          DC      /A89A     10,8      9,10              V1B04320
                          DC      /7B5B      7,11     5,11              V1B04330
                          DC      /3A28      3,10     2,8               V1B04340
                          DC      /2432      2,4      3,2               V1B04350
                          DC      /5171      5,1      7,1               V1B04360
                          DC      /92A1      9,2     10,1               V1B04370
                          DC      /09B1      P.U.    11,1               V1B04380
                          DC      /0100      STOP                       V1B04390
                          DC      256*.R+LS-*                           V1B04400
                    LR    DC      /2100      2,1      P.D.              V1B04410
                          DC      /262B      2,6      2,11              V1B04420
                          DC      /9BAA      9,11    10,10              V1B04430
                          DC      /A796     10,7      9,6               V1B04440
                          DC      /5626      5,6      2,6               V1B04450
                          DC      /56A1      5,6     10,1               V1B04460
                          DC      /09B1      P.U.    11,1               V1B04470
                          DC      /0100      STOP                       V1B04480
                          DC      256*.S+LT-*                           V1B04490
                    LS    DC      /2200      2,2      P.D.              V1B04500
                          DC      /3191      3,1      9,1               V1B04510
                          DC      /A2A5     10,2     10,5               V1B04520
                          DC      /9636      9,6      3,6               V1B04530
                          DC      /272A      2,7      2,10              V1B04540
                          DC      /3B9B      3,11     9,11              V1B04550
                          DC      /AA09     10,10     P.U.              V1B04560
                          DC      /B101     11,1      STOP              V1B04570
                          DC      256*.T+LU-*                           V1B04580
                    LT    DC      /6100      6,1      P.D.              V1B04590
                          DC      /6B2B      6,11     2,11              V1B04600
                          DC      /6BAB      6,11    10,11              V1B04610
                          DC      /09B1      P.U.    11,1               V1B04620
                          DC      /0100      STOP                       V1B04630
                          DC      256*.U+LV-*                           V1B04640
                    LU    DC      /2B00      2,11     P.D.              V1B04650
                          DC      /2231      2,2      3,1               V1B04660
                          DC      /91A2      9,1     10,2               V1B04670
                          DC      /AB09     10,11     P.U.              V1B04680
                          DC      /B101     11,1      STOP              V1B04690
                          DC      256*.V+LW-*                           V1B04700
                    LV    DC      /2B00      2,11     P.D.              V1B04710
                          DC      /61AB      6,1     10,11              V1B04720
                          DC      /09B1      P.U.    11,1               V1B04730
                          DC      /0100      STOP                       V1B04740
                          DC      256*.W+LX-*                           V1B04750
                    LW    DC      /2B00      2,11     P.D.              V1B04760
                          DC      /416B      4,1      6,11              V1B04770
                          DC      /81AB      8,1     10,11              V1B04780
                          DC      /09B1      P.U.    11,1               V1B04790
                          DC      /0100      STOP                       V1B04800
                          DC      256*.X+LY-*                           V1B04810
                    LX    DC      /2100      2,1      P.D.              V1B04820
                          DC      /66AB      6,6     10,11              V1B04830
                          DC      /662B      6,6      2,11              V1B04840
                          DC      /66A1      6,6     10,1               V1B04850
                          DC      /09B1      P.U.    11,1               V1B04860
                          DC      /0100      STOP                       V1B04870
                          DC      256*.Y+LZ-*                           V1B04880
                    LY    DC      /2B00      2,11     P.D.              V1B04890
                          DC      /66AB      6,6     10,11              V1B04900
                          DC      /6661      6,6      6,1               V1B04910
                          DC      /09B1      P.U.    11,1               V1B04920
                          DC      /0100      STOP                       V1B04930
                          DC      256*.Z+L0-*                           V1B04940
                    LZ    DC      /2B00      2,11     P.D.              V1B04950
                          DC      /AB21     10,11     2,1               V1B04960
                          DC      /A109     10,1      P.U.              V1B04970
                          DC      /B101     11,1      STOP              V1B04980
                          DC      256*.0+L1-*                           V1B04990
                    L0    DC      /3200      3,2      P.D.              V1B05000
                          DC      /2428      2,4      2,8               V1B05010
                          DC      /3A5B      3,10     5,11              V1B05020
                          DC      /7B9A      7,11     9,10              V1B05030
                          DC      /A8A4     10,8     10,4               V1B05040
                          DC      /9271      9,2      7,1               V1B05050
                          DC      /5132      5,1      3,2               V1B05060
                          DC      /09B1      P.U.    11,1               V1B05070
                          DC      /0100      STOP                       V1B05080
                          DC      256*.1+L2-*                           V1B05090
                    L1    DC      /3800      3,8      P.D.              V1B05100
                          DC      /6B61      6,11     6,1               V1B05110
                          DC      /2161      2,1      6,1               V1B05120
                          DC      /A109     10,1      P.U.              V1B05130
                          DC      /B101     11,1      STOP              V1B05140
                          DC      256*.2+L3-*                           V1B05150
                    L2    DC      /2A00      2,10     P.D.              V1B05160
                          DC      /3B9B      3,11     9,11              V1B05170
                          DC      /AAA7     10,10    10,7               V1B05180
                          DC      /9636      9,6      3,6               V1B05190
                          DC      /2521      2,5      2,1               V1B05200
                          DC      /A109     10,1      P.U.              V1B05210
                          DC      /B101     11,1      STOP              V1B05220
                          DC      256*.3+L4-*                           V1B05230
                    L3    DC      /2A00      2,10     P.D.              V1B05240
                          DC      /3B9B      3,11     9,11              V1B05250
                          DC      /AAA7     10,10    10,7               V1B05260
                          DC      /9646      9,6      4,6               V1B05270
                          DC      /96A5      9,6     10,5               V1B05280
                          DC      /A291     10,2      9,1               V1B05290
                          DC      /3122      3,1      2,2               V1B05300
                          DC      /09B1      P.U.    11,1               V1B05310
                          DC      /0100      STOP                       V1B05320
                          DC      256*.4+L5-*                           V1B05330
                    L4    DC      /A400     10,4      P.D.              V1B05340
                          DC      /249B      2,4      9,11              V1B05350
                          DC      /9109      9,1      P.U.              V1B05360
                          DC      /B101     11,1      STOP              V1B05370
                          DC      256*.5+L6-*                           V1B05380
                    L5    DC      /2200      2,2      P.D.              V1B05390
                          DC      /3191      3,1      9,1               V1B05400
                          DC      /A2A6     10,2     10,6               V1B05410
                          DC      /9727      9,7      2,7               V1B05420
                          DC      /2BAB      2,11    10,11              V1B05430
                          DC      /09B1      P.U.    11,1               V1B05440
                          DC      /0100      STOP                       V1B05450
                          DC      256*.6+L7-*                           V1B05460
                    L6    DC      /2500      2,5      P.D.              V1B05470
                          DC      /3696      3,6      9,6               V1B05480
                          DC      /A5A2     10,5     10,2               V1B05490
                          DC      /9131      9,1      3,1               V1B05500
                          DC      /2225      2,2      2,5               V1B05510
                          DC      /2A3B      2,10     3,11              V1B05520
                          DC      /9BAA      9,11    10,10              V1B05530
                          DC      /09B1      P.U.    11,1               V1B05540
                          DC      /0100      STOP                       V1B05550
                          DC      256*.7+L8-*                           V1B05560
                    L7    DC      /2B00      2,11     P.D.              V1B05570
                          DC      /AB21     10,11     2,1               V1B05580
                          DC      /09B1      P.U.    11,1               V1B05590
                          DC      /0100      STOP                       V1B05600
                          DC      256*.8+L9-*                           V1B05610
                    L8    DC      /3100      3,1      P.D.              V1B05620
                          DC      /2225      2,2      2,5               V1B05630
                          DC      /3696      3,6      9,6               V1B05640
                          DC      /3627      3,6      2,7               V1B05650
                          DC      /2A3B      2,10     3,11              V1B05660
                          DC      /9BAA      9,11    10,10              V1B05670
                          DC      /A796     10,7      9,6               V1B05680
                          DC      /A5A2     10,5     10,2               V1B05690
                          DC      /9131      9,1      3,1               V1B05700
                          DC      /09B1      P.U.    11,1               V1B05710
                          DC      /0100      STOP                       V1B05720
                          DC      256*.9+LBLK-*                         V1B05730
                    L9    DC      /2200      2,2      P.D.              V1B05740
                          DC      /3191      3,1      9,1               V1B05750
                          DC      /A2A7     10,2     10,7               V1B05760
                          DC      /AA9B     10,10     9,11              V1B05770
                          DC      /3B2A      3,11     2,10              V1B05780
                          DC      /2736      2,7      3,6               V1B05790
                          DC      /96A7      9,6     10,7               V1B05800
                          DC      /09B1      P.U.    11,1               V1B05810
                          DC      /0100      STOP                       V1B05820
                          DC      256*. +LMIN-*                         V1B05830
                    LBLK  DC      /B101     11,1      STOP              V1B05840
                          DC      256*.-+LPLS-*                         V1B05850
                    LMIN  DC      /3600      3,6      P.D.              V1B05860
                          DC      /9609      9,6                        V1B05870
                          DC      /B101     11,1      STOP              V1B05880
                          DC      256*/4E+LDEC-*                        V1B05890
                    LPLS  DC      /3600      3,6      P.D.              V1B05900
                          DC      /9666      9,6      6,6               V1B05910
                          DC      /6966      6,9      6,6               V1B05920
                          DC      /6309      6,3      P.U.              V1B05930
                          DC      /B101     11,1      STOP              V1B05940
                          DC      256*..+LCOM-*                         V1B05950
                    LDEC  DC      /5400      5,4      P.D.              V1B05960
                          DC      /5676      5,6      7,6               V1B05970
                          DC      /7454      7,4      5,4               V1B05980
                          DC      /09B1      P.U.    11,1               V1B05990
                          DC      /0100      STOP                       V1B06000
                          DC      256*.,+LASK-*                         V1B06010
                    LCOM  DC      /5100      5,1      P.D.              V1B06020
                          DC      /7374      7,3      7,4               V1B06030
                          DC      /7656      7,6      5,6               V1B06040
                          DC      /5474      5,4      7,4               V1B06050
                          DC      /09B1      P.U.    11,1               V1B06060
                          DC      /0100      STOP                       V1B06070
                          DC      256*.*+LSLA-*                         V1B06080
                    LASK  DC      /4400      4,4      P.D.              V1B06090
                          DC      /6688      6,6      8,8               V1B06100
                          DC      /6648      6,6      4,8               V1B06110
                          DC      /6684      6,6      8,4               V1B06120
                          DC      /6636      6,6      3,6               V1B06130
                          DC      /6696      6,6      9,6               V1B06140
                          DC      /09B1      P.U.    11,1               V1B06150
                          DC      /0100      STOP                       V1B06160
                          DC      256*./+LEQU-*                         V1B06170
                    LSLA  DC      /2200      2,2      P.D.              V1B06180
                          DC      /AA09     10,10     P.U.              V1B06190
                          DC      /B101     11,1      STOP              V1B06200
                          DC      256*/7E+LRPN-*                        V1B06210
                    LEQU  DC      /3400      3,4      P.D.              V1B06220
                          DC      /9409      9,4      P.U.              V1B06230
                          DC      /3800      3,8      P.D.              V1B06240
                          DC      /9809      9,8      P.U.              V1B06250
                          DC      /B101     11,1      STOP              V1B06260
                          DC      256*.<+LLPN-*                         V1B06270
                    LRPN  DC      /4100      4,1      P.D.              V1B06280
                          DC      /6369      6,3      6,9               V1B06290
                          DC      /4B09      4,11     P.U.              V1B06300
                          DC      /B101     11,1      STOP              V1B06310
                          DC      256*.%+LDOL-*                         V1B06320
                    LLPN  DC      /8B00      8,11     P.D.              V1B06330
                          DC      /6963      6,9      6,3               V1B06340
                          DC      /8109      8,1      P.U.              V1B06350
                          DC      /B101     11,1      STOP              V1B06360
                          DC      256*.$+LQUO-*                         V1B06370
                    LDOL  DC      /3300      3,3      P.D.              V1B06380
                          DC      /4282      4,2      8,2               V1B06390
                          DC      /9395      9,3      9,5               V1B06400
                          DC      /8646      8,6      4,6               V1B06410
                          DC      /3739      3,7      3,9               V1B06420
                          DC      /4A6A      4,10     6,10              V1B06430
                          DC      /8A99      8,10     9,9               V1B06440
                          DC      /8A6A      8,10     6,10              V1B06450
                          DC      /6B61      6,11     6,1               V1B06460
                          DC      /09B1      P.U.    11,1               V1B06470
                          DC      /0100      STOP                       V1B06480
                          DC      256*/7D+TABEN-*+1                     V1B06490
                    LQUO  DC      /6700     6,7       P.D.              V1B06500
                          DC      /695A     6,9       5,10              V1B06510
                          DC      /6B7A     6,11      7,10              V1B06520
                          DC      /6909     6,9       P.U.              V1B06530
                          DC      /B101     11,1      STOP              V1B06540
                    TABEN DC      0                                     V1B06550
                          END                                           V1B06560
