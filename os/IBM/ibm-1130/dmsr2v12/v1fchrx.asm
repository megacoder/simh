                    *************************************************** V1G00010
                    *                                                 * V1G00020
                    * STATUS - VERSION 2, MODIFICATION 8                V1G00030
                    *   SUBROUTINE NAME-                              * V1G00040
                    *      FULL NAME- STANDARD PRECISION ANNOTATION   * V1G00050
                    *         SUBROUTINE.                             * V1G00060
                    *      CODE NAME- FCHRX                           * V1G00070
                    *   PURPOSE- FORMS THE CHARACTERS SPECIFIED BY    * V1G00080
                    *      COMPUTER OUTPUT DATA USING PARAMETERS FROM * V1G00090
                    *      THE CHARACTER SUBROUTINE (FCHAR).          * V1G00100
                    *   METHOD- N/A                                   * V1G00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1G00120
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1G00130
                    *      (FORM C26-3755).                           * V1G00140
                    *   SPECIAL FEATURES- N/A                         * V1G00150
                    *   ADDITIONAL INFORMATION- N/A                   * V1G00160
                    *                                                 * V1G00170
                    *************************************************** V1G00180
                    *                                                   V1G00190
                    *             THE CALL TO THE FCHRX ROUTINE         V1G00200
                    *             IS AS FOLLOWS                         V1G00210
                    *                                                   V1G00220
                    *             LIBF FCHRI                            V1G00230
                    *             DC   0                                V1G00240
                    *             DC   BUFFER OF CHARACTERS TO PLOT     V1G00250
                    *             DC   0                                V1G00260
                    *                                                   V1G00270
                    *             LIBF WCHRI                            V1G00280
                    *                  XR1 = BUFFER ADDRESS         2-8 V1G00290
                    *                  XR2 = CHAR COUNT             2-8 V1G00300
                    *                                                   V1G00310
                    *             LIBF FCHRX                            V1G00320
                    *                  XR1 = XS+8                       V1G00330
                    *                  .                                V1G00340
                    *                  .                                V1G00350
                    *                  .                                V1G00360
                    *                  .                                V1G00370
                    *      XS     DEC  X-SCALE (REAL)                   V1G00380
                    *             DEC  Y-SCALE (REAL)                   V1G00390
                    *             DEC  COS(THETA)                       V1G00400
                    *             DEC  SIN(THETA)                       V1G00410
                    *                                                   V1G00420
                          SPR                                           V1G00430
                          LIBR                                          V1G00440
                          ENT     FCHRX     ENTRY FROM FCHAR CALL       V1G00450
                          ENT     FCHRI     ENTRY FROM FIO WRITE STMNT  V1G00460
                          ENT     WCHRI     ENTRY FROM FIO WRITE STMNT  V1G00470
                    WCHRI STX   2 CNT       SET CHARACTER COUNT         V1G00480
                          LDX  I2 *-*       SET EXIT                    V1G00490
                          STX   2 EXIT                                  V1G00500
                          STX   1 SV1       SAVE XR1                    V1G00510
                          STX   2 SV2       SAVE XR2                    V1G00520
                          LDX  L2 V         SET XR2 WITH V              V1G00530
                          LD      AN0       SET 1 CHARACTER/WORD SWITCH V1G00540
                          STO     AN1                                   V1G00550
                          STX  L1 ADD       SET BUFFER ADDRESS          V1G00560
                          MDX     AN                                    V1G00570
                    CNT   DC      *-*       CHARACTER COUNT             V1G00580
                    XOX   MDX  L  NLET,10    MAKE TEN MORE          2-8 V1G00590
                          LD    2 NLET-V     GET NUMBER OF LETTERS  2-8 V1G00600
                          MDX  L  SW3,1      TURN ON CNTRL SW       2-8 V1G00610
                          MDX     MB1        CALCULATE COORDINATES  2-8 V1G00620
                    XOX1  MDX  L  CNT,-1     SKIP IF BUFFER OUTPUTED    V1G00630
                          MDX     AN0                                   V1G00640
                    RTN   LDX  L1 *-*       RESTORE XR1 AND XR2         V1G00650
                    SV1   EQU     *-1                                   V1G00660
                          LDX  L2 *-*                                   V1G00670
                    SV2   EQU     *-1                                   V1G00680
                          BSC  L  *-*       EXIT                        V1G00690
                    EXIT  EQU     *-1       RETURN                      V1G00700
                    FCHRI STX   1 SV1       SAVE XR1                    V1G00710
                          LDX  I1 *-*                                   V1G00720
                          STX   2 SV2       SAVE XR2                    V1G00730
                          LDX  L2 V         SET XR2 WITH V              V1G00740
                          LD    1 1         GET ADDRESS OF BUFFER       V1G00750
                          A     2 H0002-V                               V1G00760
                          STO   2 ADD-V                                 V1G00770
                          S     2 H0002-V   GET COUNT                   V1G00780
                          STO     *+1                                   V1G00790
                          LD   L  *-*       LOAD COUNT                  V1G00800
                          S     2 H0001-V                               V1G00810
                          SLA     1                                     V1G00820
                          STO     CNT       CHARACTER COUNT             V1G00830
                          MDX   1 2                                     V1G00840
                          STX   1 EXIT      SET EXIT IF TEST FUNCTION   V1G00850
                          LD    1 -2                                    V1G00860
                          BSC  L  RTN,+-    BRANCH IF FIO TEST FUNCTION V1G00870
                          MDX   1 1                                     V1G00880
                          STX   1 EXIT      SET FOR NORMAL RETURN       V1G00890
                          LD      CN1       SET FOR MULTIPLE FIO        V1G00900
                          STO     AN1       MODIFY INST TO SLA 16       V1G00910
                          SLA     16        NORMALIZE SW1               V1G00920
                    AN    STO   2 SW1-V                                 V1G00930
                          SLT     32                                2-8 V1G00940
                          STO   2 NLET-V     CLEAR                  2-8 V1G00950
                          STD   2 XLAST-V    CLEAR XLAST,YLAST      2-8 V1G00960
                          LD      CNT       CHECK FOR ZERO COUNT        V1G00970
                          BSC  L  RTN,+-    BRANCH IF NO BUFFER         V1G00980
                    AN0   LD    2 SW1-V     SW1 NORMAL                  V1G00990
                          BSC  L  AN1,Z     BRANCH IF N0                V1G01000
                          STX  L0 SW1       TAG SW1                     V1G01010
                          LD   I  ADD       GET LEFT CHARACTER          V1G01020
                          SRA     8                                     V1G01030
                          MDX     AN2                                   V1G01040
                    AN1   SLA     16  -*-   NORMALIZE SW1               V1G01050
                          STO   2 SW1-V                                 V1G01060
                          LD   I  ADD       GET RIGHT CHARACTER         V1G01070
                          AND   2 H00FF-V                               V1G01080
                          MDX  L  ADD,1     INCREMENT ADD               V1G01090
                    *     STATEMENT REMOVED                         2-8 V1G01100
                    AN2   STO   2 SVCH-V    SAVE CHARACTER              V1G01110
                          LDX  L1 TABLE     POINT XR1 TO CHAR TABLE     V1G01120
                    AN3   LD    1 0         FETCH A CHARACTER           V1G01130
                          BSC  L  AN4,+-    BR IF END OF TABLE          V1G01140
                          SRT     8                                     V1G01150
                          AND   2 H00FF-V   COMPARE RIGHT 8 BITS WITH   V1G01160
                          EOR   2 SVCH-V    *SAVED CHARACTER            V1G01170
                          BSC  L  AN5,+-    BRANCH IF MATCH             V1G01180
                          SRA     8                                     V1G01190
                          SLT     8                                     V1G01200
                          STO     *+1                                   V1G01210
                          MDX  L1 *-*                                   V1G01220
                    *     STATEMENT REMOVED                         2-8 V1G01230
                          MDX     AN3       TRY NEXT CHARACTER          V1G01240
                    AN4   LDX  L1 LBLK-1    NOT IN TABLE, SUPPLY BLANK  V1G01250
                    AN5   MDX   1 1                                     V1G01260
                          STX   1 STRNG                                 V1G01270
                          SLA     16        NORMALIZE SW2               V1G01280
                          STO     SW2                                   V1G01290
                          STO     XN        XN = 0                      V1G01300
                          STO     YN        YN = 0                      V1G01310
                    CNO   LD      SW2       SW2 NORMAL                  V1G01320
                          BSC  L  CN1,Z     BRANCH IF NO                V1G01330
                          STX   0 SW2       TAG SW2                     V1G01340
                          LD   I  STRNG     GET LEFT COORDINATE         V1G01350
                          SRA     8                                     V1G01360
                          MDX     CN2                                   V1G01370
                    CN1   SLA     16        NORMALIZE SW2               V1G01380
                          STO     SW2                                   V1G01390
                          LD   I  STRNG     GET RIGHT COORDINATE        V1G01400
                          AND   2 H00FF-V                           2-8 V1G01410
                          MDX  L  STRNG,1   INCREMENT STRNG             V1G01420
                    *     STATEMENT REMOVD                          2-8 V1G01430
                    CN2   SRT     4         SET UP XN+1,YN+1            V1G01440
                          BSC  L  CNTL,+-   IS CORDINATE A CONTROL      V1G01450
                          S       H0001                                 V1G01460
                          STO     XN+1                                  V1G01470
                          SRA     4                                     V1G01480
                          SLT     4                                     V1G01490
                          S       H0001                                 V1G01500
                          STO     YN+1                                  V1G01510
                          LD      XN+1      CALCULATE DELTA X =         V1G01520
                    MB1   LIBF    FLOAT      (XN+1)*SIZEX           2-8 V1G01530
                          LIBF    FMPY                                  V1G01540
                          DC      XC                                    V1G01550
                          LIBF    FMPY      MULTIPLY C/FAC BY CONSTANT  V1G01560
                          DC      C10       *IN C10                     V1G01570
                          LIBF    FADD      ADD TO C/ADDR IN CP5        V1G01580
                          DC      CP5                                   V1G01590
                          LIBF    IFIX      CONVERT TO FIXED POINT NO.  V1G01600
                          STO     DELTX                                 V1G01610
                          LD      SW3        GET CNTRL SW           2-8 V1G01620
                          BSC  L  MOD2,Z     CONTINUE IF NOT ON     2-8 V1G01630
                          LD      YN+1      CALCULATE DELTA Y =         V1G01640
                          LIBF    FLOAT     (YN+1)*SIZEY                V1G01650
                          LIBF    FMPY      MULTIPLY C/FAC BY C/YC      V1G01660
                          DC      YC                                    V1G01670
                          LIBF    FMPY      MULTIPLY C/FAC BY           V1G01680
                          DC      C10       *CONSTANT 10                V1G01690
                          LIBF    FADD                                  V1G01700
                          DC      CP5                                   V1G01710
                          LIBF    IFIX      CONVERT C/FAC TO INTEGER    V1G01720
                    MB2   STO     DELTY      *AND PACK UP IN ACC    2-8 V1G01730
                    *     STATEMENTS REMOVED                        2-8 V1G01740
                          M       SINT                                  V1G01750
                          STD     TEMP      DOUBLE STORE                V1G01760
                          LD      DELTX                                 V1G01770
                          M       COST                                  V1G01780
                          SD      TEMP                                  V1G01790
                          AD      ROUND                                 V1G01800
                          SLT     1                                     V1G01810
                          STO     X1         COMPUTED X1            2-8 V1G01820
                    *     STATEMENTS REMOVED                        2-8 V1G01830
                          LD      DELTY     COMPUTE Y1 AND PYN          V1G01840
                          M       COST                                  V1G01850
                          STD     TEMP                                  V1G01860
                          LD      DELTX                                 V1G01870
                          M       SINT      MULTIPLY BY INTEGER         V1G01880
                          AD      TEMP                                  V1G01890
                          AD      ROUND                                 V1G01900
                          SLT     1                                     V1G01910
                          STO     Y1         COMPUTED Y1            2-8 V1G01920
                          LD      SW3        TEST IF CNTRL SW ON    2-8 V1G01930
                          BSC  L  MOD3,Z     BRANCH IF ON           2-8 V1G01940
                          LD      X1                                2-8 V1G01950
                          S       XN                                2-8 V1G01960
                          STO     X1                                2-8 V1G01970
                          A       XN                                2-8 V1G01980
                          STO     XN                                2-8 V1G01990
                          LD      Y1                                2-8 V1G02000
                          S       YN                                    V1G02010
                          STO     Y1        COMPUTED Y1                 V1G02020
                          A       YN                                    V1G02030
                          STO     YN                                    V1G02040
                          LIBF    FINC      UPDATE SYSTEM X,Y           V1G02050
                          DC      X1                                    V1G02060
                          DC      Y1                                    V1G02070
                          LIBF    XYPLT     MOVE THE PEN                V1G02080
                          DC      X1                                    V1G02090
                          DC      Y1                                    V1G02100
                          LD      XINC                              2-8 V1G02110
                          A       X1                                2-8 V1G02120
                          STO     XINC       ACCUMULATE X INCR      2-8 V1G02130
                          LD      YINC                              2-8 V1G02140
                          A       Y1                                2-8 V1G02150
                          STO     YINC       ACCUMULATE Y INCR      2-8 V1G02160
                          MDX     CNO       BRANCH TO TEST SW2          V1G02170
                    CNTL  SRA     4         STOP CONTROL                V1G02180
                          SLT     4                                     V1G02190
                          STO     CNTLX     SET CONTROL PARAMETER       V1G02200
                          S       H0001      IS IT END OF STRING        V1G02210
                          BSC  L  XOX,+-    BRANCH IF YES               V1G02220
                          LIBF    PLOTI     PLOT CONTROL                V1G02230
                    CNTLX DC      *-*       CONTROL PARAMETER           V1G02240
                          MDX     CNO       BRANCH TO TEST SW2          V1G02250
                    *                                               2-8 V1G02260
                    MOD2  SLA     16                                2-8 V1G02270
                          MDX     MB2        CONTINUE               2-8 V1G02280
                    *                                                   V1G02290
                    *                       PROGRAM CONSTANTS           V1G02300
                    *                                                   V1G02310
                    V     EQU     *+128                                 V1G02320
                    ADD   DC      *-*       ARRAY (ONE WORD INTEGER)    V1G02330
                    SW1   DC      *-*        LEFT/RIGHT EBCDIC CHAR     V1G02340
                    SW2   DC      *-*        LEFT/RIGHT VALUE IN TABLE  V1G02350
                    SW3   DC      *-*        CONTROL SWITCH         2-8 V1G02360
                    SVCH  DC      *-*       SAVED CHARACTER             V1G02370
                    STRNG DC      *-*       COORDINATES, LEFT & RIGHT   V1G02380
                    SINT  DC      *-*       SAVED INTEGER               V1G02390
                    COST  DC      /7FFF                                 V1G02400
                    XN    DC      *-*                                   V1G02410
                          DC      *-*                                   V1G02420
                    YN    DC      *-*                                   V1G02430
                          DC      *-*                                   V1G02440
                    DELTX DC      *-*                                   V1G02450
                    DELTY DC      *-*                                   V1G02460
                          BSS  E  0                                 2-8 V1G02470
                    X1    DC      *-*                                   V1G02480
                    Y1    DC      *-*                                   V1G02490
                    C10   DEC     10.                                   V1G02500
                    C32K  DEC     32767.    CONSTANT                    V1G02510
                    XC    DEC     .1         CHAR SIZE X                V1G02520
                    YC    DEC     .1         CHAR SIZE Y                V1G02530
                    CCOS  DEC     0.                                    V1G02540
                    CSIN  DEC     1.                                    V1G02550
                    CP5   DEC     .5                                    V1G02560
                    TEMP  DC      0                                     V1G02570
                          DC      0                                     V1G02580
                    ROUND DC      /0000     EVEN ADDRESS                V1G02590
                          DC      /4000     CONSTANT                    V1G02600
                    H00FF DC      /00FF      MASK TO REMOVE LAST BITS   V1G02610
                    H0001 DC      /1        CONSTANT                    V1G02620
                    H0002 DC      /2        CONSTANT                    V1G02630
                    NLET  DC      *-*        NUMBER OF LETTERS      2-8 V1G02640
                          BSS  E  0                                 2-8 V1G02650
                    XINC  DC      *-*        INCREMENT STORAGE      2-8 V1G02660
                    YINC  DC      *-*        INCREMENT STORAGE      2-8 V1G02670
                    XLAST DC      *-*        LAST X COORDINATE      2-8 V1G02680
                    YLAST DC      *-*        LAST Y COORDINATE      2-8 V1G02690
                    *                                               2-8 V1G02700
                    MOD3  LD      X1         GET COORDINATE         2-8 V1G02710
                          S       XLAST      SUBTRACT LAST COORD    2-8 V1G02720
                          S       XINC       SUBTRACT COMPUTED COOR 2-8 V1G02730
                          STO     XINC       DIFFERENCE IN XINC     2-8 V1G02740
                          LD      Y1         DO SAME FOR Y          2-8 V1G02750
                          S       YLAST                             2-8 V1G02760
                          S       YINC                              2-8 V1G02770
                          STO     YINC                              2-8 V1G02780
                          LIBF    FINC       UPDATE SYSTEM (X,Y)    2-8 V1G02790
                          DC      XINC                              2-8 V1G02800
                          DC      YINC                              2-8 V1G02810
                          LIBF    XYPLT      MOVE PEN               2-8 V1G02820
                          DC      XINC                              2-8 V1G02830
                          DC      YINC                              2-8 V1G02840
                          LDD     X1                                2-8 V1G02850
                          STD     XLAST      UPDATE XLAST,YLAST     2-8 V1G02860
                          SLT     32                                2-8 V1G02870
                          STO     SW3        TURN OFF CNTRL SW      2-8 V1G02880
                          STD     XINC       CLEAR XINC,YINC        2-8 V1G02890
                          BSC  L  XOX1       RETURN                 2-8 V1G02900
                    *                                                   V1G02910
                    FCHRX MDX     *+2                                   V1G02920
                          BSC  I  *-*       RETURN                      V1G02930
                          STX   1 YLP+1                                 V1G02940
                          LDX   1 -8        GET XC,YC,CCOS,CSIN         V1G02950
                    YLP   LIBF    FLDX                                  V1G02960
                          DC      *-*                                   V1G02970
                          LIBF    FSTOX                                 V1G02980
                          DC      XC+8                                  V1G02990
                          MDX   1 2                                     V1G03000
                          MDX     YLP                                   V1G03010
                          LIBF    FLD       SINT=SIN(ANGLE)*32768.      V1G03020
                          DC      CSIN                                  V1G03030
                          LIBF    FMPY      MULTIPLY C/FAC              V1G03040
                          DC      C32K      *BY 32,767.                 V1G03050
                          LIBF    IFIX      CONVERT TO INTEGER          V1G03060
                          STO     SINT      SAVE INTEGER                V1G03070
                          LIBF    FLD       COST=COS(ANGLE)*32768.      V1G03080
                          DC      CCOS                                  V1G03090
                          LIBF    FMPY      MULTIPLY BY 32,767          V1G03100
                          DC      C32K                                  V1G03110
                          LIBF    IFIX      CONVERT TO INTEGER          V1G03120
                          STO     COST      *AND STORE                  V1G03130
                          MDX     FCHRX+1                               V1G03140
                    *                                                   V1G03150
                    *                       CHARACTER TABLE             V1G03160
                    *                                                   V1G03170
                    TABLE DC      256*.A+LB-*                           V1G03180
                    LA    DC      /2100      2,1      P.D.              V1G03190
                          DC      /466B      4,6      6,11              V1G03200
                          DC      /8646      8,6      4,6               V1G03210
                          DC      /86A1      8,6     10,1               V1G03220
                          DC      /09B1      P.U.    11,1               V1G03230
                          DC      /0100      STOP                       V1G03240
                          DC      256*.B+LC-*                           V1G03250
                    LB    DC      /2100      2,1      P.D.              V1G03260
                          DC      /262B      2,6      2,11              V1G03270
                          DC      /9BAA      9,11    10,10              V1G03280
                          DC      /A796     10,7      9,6               V1G03290
                          DC      /2696      2,6      9,6               V1G03300
                          DC      /A5A2     10,5     10,2               V1G03310
                          DC      /9121      9,1      2,1               V1G03320
                          DC      /09B1      P.U.     11,1              V1G03330
                          DC      /0100      STOP                       V1G03340
                          DC      256*.C+LD-*                           V1G03350
                    LC    DC      /AA00     10,10     P.D.              V1G03360
                          DC      /9B3B      9,11     3,11              V1G03370
                          DC      /2A22      2,10     2,2               V1G03380
                          DC      /3191      3,1      9,1               V1G03390
                          DC      /A209     10,2      P.U.              V1G03400
                          DC      /B101     11,1      STOP              V1G03410
                          DC      256*.D+LE-*                           V1G03420
                    LD    DC      /2100      2,1      P.D.              V1G03430
                          DC      /2B9B      2,11                       V1G03440
                          DC      /AAA2     10,10    10,2               V1G03450
                          DC      /9121      9,1      2,1               V1G03460
                          DC      /09B1      P.U.    11,1               V1G03470
                          DC      /0100      STOP                       V1G03480
                          DC      256*.E+LF-*                           V1G03490
                    LE    DC      /AB00     10,11     P.D.              V1G03500
                          DC      /2B26      2,11     2,6               V1G03510
                          DC      /7626      7,6    2,6                 V1G03520
                          DC      /21A1      2,1     10,1               V1G03530
                          DC      /09B1      P.U.    11,1               V1G03540
                          DC      /0100      STOP                       V1G03550
                          DC      256*.F+LG-*                           V1G03560
                    LF    DC      /2100      2,1      P.D.              V1G03570
                          DC      /2676      2,6      7,6               V1G03580
                          DC      /262B      2,6      2,11              V1G03590
                          DC      /AB09     10,11     P.U.              V1G03600
                          DC      /B101     11,1                        V1G03610
                          DC      256*.G+LH-*                           V1G03620
                    LG    DC      /AA00     10,10     P.D.              V1G03630
                          DC      /9B3B      9,11     3,11              V1G03640
                          DC      /2A22      2,10     2,2               V1G03650
                          DC      /3191      3,1      9,1               V1G03660
                          DC      /A2A6     10,2      10,6              V1G03670
                          DC      /7609      7,6      P.U.              V1G03680
                          DC      /B101     11,1      STOP              V1G03690
                          DC      256*.H+LI-*                           V1G03700
                    LH    DC      /2100      2,1      P.D.              V1G03710
                          DC      /262B      2,6      2,11              V1G03720
                          DC      /26A6      2,6     10,6               V1G03730
                          DC      /ABA6     10,11    10,6               V1G03740
                          DC      /A109     10,1      P.U.              V1G03750
                          DC      /B101     11,1      STOP              V1G03760
                          DC      256*.I+LJ-*                           V1G03770
                    LI    DC      /3100      3,1      P.D.              V1G03780
                          DC      /6191      6,1      9,1               V1G03790
                          DC      /616B     6,1       6,11              V1G03800
                          DC      /3B6B      3,11                       V1G03810
                          DC      /9B09      9,11     P.U.              V1G03820
                          DC      /B101     11,1      STOP              V1G03830
                          DC      256*.J+LK-*                           V1G03840
                    LJ    DC      /2300      2,3      P.D.              V1G03850
                          DC      /2231      2,2      3,1               V1G03860
                          DC      /91A2      9,1     10,2               V1G03870
                          DC      /AB09     10,11     P.U.              V1G03880
                          DC      /B101     11,1      STOP              V1G03890
                          DC      256*.K+LL-*                           V1G03900
                    LK    DC      /2100      2,1      P.D.              V1G03910
                          DC      /252B      2,5      2,11              V1G03920
                          DC      /2558      2,5      5,8               V1G03930
                          DC      /8B58      8,11     5,8               V1G03940
                          DC      /A109     10,1      P.U.              V1G03950
                          DC      /B101     11,1      STOP              V1G03960
                          DC      256*.L+LM-*                           V1G03970
                    LL    DC      /2B00      2,11     P.D.              V1G03980
                          DC      /21A1      2,1     10,1               V1G03990
                          DC      /09B1      P.U.    11,1               V1G04000
                          DC      /0100      STOP                       V1G04010
                          DC      256*.M+LN-*                           V1G04020
                    LM    DC      /2100      2,1      P.D.              V1G04030
                          DC      /2B61      2,11     6,1               V1G04040
                          DC      /ABA1     10,11    10,1               V1G04050
                          DC      /09B1      P.U.    11,1               V1G04060
                          DC      /0100      STOP                       V1G04070
                          DC      256*.N+LO-*                           V1G04080
                    LN    DC      /2100      2,1      P.D.              V1G04090
                          DC      /2BA1      2,11    10,1               V1G04100
                          DC      /AB09     10,11     P.U.              V1G04110
                          DC      /B101     11,1      STOP              V1G04120
                          DC      256*.O+LP-*                           V1G04130
                    LO    DC      /2200      2,2      P.D.              V1G04140
                          DC      /2A3B      2,10     3,11              V1G04150
                          DC      /9BAA      9,11    10,10              V1G04160
                          DC      /A291     10,2      9,1               V1G04170
                          DC      /3122      3,1      2,2               V1G04180
                          DC      /09B1      P.U.    11,1               V1G04190
                          DC      /0100      STOP                       V1G04200
                          DC      256*.P+LQ-*                           V1G04210
                    LP    DC      /2100      2,1      P.D.              V1G04220
                          DC      /262B      2,6      2,11              V1G04230
                          DC      /9BAA      9,11    10,10              V1G04240
                          DC      /A796     10,7      9,6               V1G04250
                          DC      /2609      2,6      P.U.              V1G04260
                          DC      /B101     11,1      STOP              V1G04270
                          DC      256*.Q+LR-*                           V1G04280
                    LQ    DC      /8300      8,3      P.D.              V1G04290
                          DC      /92A4      9,2     10,4               V1G04300
                          DC      /A89A     10,8      9,10              V1G04310
                          DC      /7B5B      7,11     5,11              V1G04320
                          DC      /3A28      3,10     2,8               V1G04330
                          DC      /2432      2,4      3,2               V1G04340
                          DC      /5171      5,1      7,1               V1G04350
                          DC      /92A1      9,2     10,1               V1G04360
                          DC      /09B1      P.U.    11,1               V1G04370
                          DC      /0100      STOP                       V1G04380
                          DC      256*.R+LS-*                           V1G04390
                    LR    DC      /2100      2,1      P.D.              V1G04400
                          DC      /262B      2,6      2,11              V1G04410
                          DC      /9BAA      9,11    10,10              V1G04420
                          DC      /A796     10,7      9,6               V1G04430
                          DC      /5626      5,6      2,6               V1G04440
                          DC      /56A1      5,6     10,1               V1G04450
                          DC      /09B1      P.U.    11,1               V1G04460
                          DC      /0100      STOP                       V1G04470
                          DC      256*.S+LT-*                           V1G04480
                    LS    DC      /2200      2,2      P.D.              V1G04490
                          DC      /3191      3,1      9,1               V1G04500
                          DC      /A2A5     10,2     10,5               V1G04510
                          DC      /9636      9,6      3,6               V1G04520
                          DC      /272A      2,7      2,10              V1G04530
                          DC      /3B9B      3,11     9,11              V1G04540
                          DC      /AA09     10,10     P.U.              V1G04550
                          DC      /B101     11,1      STOP              V1G04560
                          DC      256*.T+LU-*                           V1G04570
                    LT    DC      /6100      6,1      P.D.              V1G04580
                          DC      /6B2B      6,11     2,11              V1G04590
                          DC      /6BAB      6,11    10,11              V1G04600
                          DC      /09B1      P.U.    11,1               V1G04610
                          DC      /0100      STOP                       V1G04620
                          DC      256*.U+LV-*                           V1G04630
                    LU    DC      /2B00      2,11     P.D.              V1G04640
                          DC      /2231      2,2      3,1               V1G04650
                          DC      /91A2      9,1     10,2               V1G04660
                          DC      /AB09     10,11     P.U.              V1G04670
                          DC      /B101     11,1      STOP              V1G04680
                          DC      256*.V+LW-*                           V1G04690
                    LV    DC      /2B00      2,11     P.D.              V1G04700
                          DC      /61AB      6,1     10,11              V1G04710
                          DC      /09B1      P.U.    11,1               V1G04720
                          DC      /0100      STOP                       V1G04730
                          DC      256*.W+LX-*                           V1G04740
                    LW    DC      /2B00      2,11     P.D.              V1G04750
                          DC      /416B      4,1      6,11              V1G04760
                          DC      /81AB      8,1     10,11              V1G04770
                          DC      /09B1      P.U.    11,1               V1G04780
                          DC      /0100      STOP                       V1G04790
                          DC      256*.X+LY-*                           V1G04800
                    LX    DC      /2100      2,1      P.D.              V1G04810
                          DC      /66AB      6,6     10,11              V1G04820
                          DC      /662B      6,6      2,11              V1G04830
                          DC      /66A1      6,6     10,1               V1G04840
                          DC      /09B1      P.U.    11,1               V1G04850
                          DC      /0100      STOP                       V1G04860
                          DC      256*.Y+LZ-*                           V1G04870
                    LY    DC      /2B00      2,11     P.D.              V1G04880
                          DC      /66AB      6,6     10,11              V1G04890
                          DC      /6661      6,6      6,1               V1G04900
                          DC      /09B1      P.U.    11,1               V1G04910
                          DC      /0100      STOP                       V1G04920
                          DC      256*.Z+L0-*                           V1G04930
                    LZ    DC      /2B00      2,11     P.D.              V1G04940
                          DC      /AB21     10,11     2,1               V1G04950
                          DC      /A109     10,1      P.U.              V1G04960
                          DC      /B101     11,1      STOP              V1G04970
                          DC      256*.0+L1-*                           V1G04980
                    L0    DC      /3200      3,2      P.D.              V1G04990
                          DC      /2428      2,4      2,8               V1G05000
                          DC      /3A5B      3,10     5,11              V1G05010
                          DC      /7B9A      7,11     9,10              V1G05020
                          DC      /A8A4     10,8     10,4               V1G05030
                          DC      /9271      9,2      7,1               V1G05040
                          DC      /5132      5,1      3,2               V1G05050
                          DC      /09B1      P.U.    11,1               V1G05060
                          DC      /0100      STOP                       V1G05070
                          DC      256*.1+L2-*                           V1G05080
                    L1    DC      /3800      3,8      P.D.              V1G05090
                          DC      /6B61      6,11     6,1               V1G05100
                          DC      /2161      2,1      6,1               V1G05110
                          DC      /A109     10,1      P.U.              V1G05120
                          DC      /B101     11,1      STOP              V1G05130
                          DC      256*.2+L3-*                           V1G05140
                    L2    DC      /2A00      2,10     P.D.              V1G05150
                          DC      /3B9B      3,11     9,11              V1G05160
                          DC      /AAA7     10,10    10,7               V1G05170
                          DC      /9636      9,6      3,6               V1G05180
                          DC      /2521      2,5      2,1               V1G05190
                          DC      /A109     10,1      P.U.              V1G05200
                          DC      /B101     11,1      STOP              V1G05210
                          DC      256*.3+L4-*                           V1G05220
                    L3    DC      /2A00      2,10     P.D.              V1G05230
                          DC      /3B9B      3,11     9,11              V1G05240
                          DC      /AAA7     10,10    10,7               V1G05250
                          DC      /9646      9,6      4,6               V1G05260
                          DC      /96A5      9,6     10,5               V1G05270
                          DC      /A291     10,2      9,1               V1G05280
                          DC      /3122      3,1      2,2               V1G05290
                          DC      /09B1      P.U.    11,1               V1G05300
                          DC      /0100      STOP                       V1G05310
                          DC      256*.4+L5-*                           V1G05320
                    L4    DC      /A400     10,4      P.D.              V1G05330
                          DC      /249B      2,4      9,11              V1G05340
                          DC      /9109      9,1      P.U.              V1G05350
                          DC      /B101     11,1      STOP              V1G05360
                          DC      256*.5+L6-*                           V1G05370
                    L5    DC      /2200      2,2      P.D.              V1G05380
                          DC      /3191      3,1      9,1               V1G05390
                          DC      /A2A6     10,2     10,6               V1G05400
                          DC      /9727      9,7      2,7               V1G05410
                          DC      /2BAB      2,11    10,11              V1G05420
                          DC      /09B1      P.U.    11,1               V1G05430
                          DC      /0100      STOP                       V1G05440
                          DC      256*.6+L7-*                           V1G05450
                    L6    DC      /2500      2,5      P.D.              V1G05460
                          DC      /3696      3,6      9,6               V1G05470
                          DC      /A5A2     10,5     10,2               V1G05480
                          DC      /9131      9,1      3,1               V1G05490
                          DC      /2225      2,2      2,5               V1G05500
                          DC      /2A3B      2,10     3,11              V1G05510
                          DC      /9BAA      9,11    10,10              V1G05520
                          DC      /09B1      P.U.    11,1               V1G05530
                          DC      /0100      STOP                       V1G05540
                          DC      256*.7+L8-*                           V1G05550
                    L7    DC      /2B00      2,11     P.D.              V1G05560
                          DC      /AB21     10,11     2,1               V1G05570
                          DC      /09B1      P.U.    11,1               V1G05580
                          DC      /0100      STOP                       V1G05590
                          DC      256*.8+L9-*                           V1G05600
                    L8    DC      /3100      3,1      P.D.              V1G05610
                          DC      /2225      2,2      2,5               V1G05620
                          DC      /3696      3,6      9,6               V1G05630
                          DC      /3627      3,6      2,7               V1G05640
                          DC      /2A3B      2,10     3,11              V1G05650
                          DC      /9BAA      9,11    10,10              V1G05660
                          DC      /A796     10,7      9,6               V1G05670
                          DC      /A5A2     10,5     10,2               V1G05680
                          DC      /9131      9,1      3,1               V1G05690
                          DC      /09B1      P.U.    11,1               V1G05700
                          DC      /0100      STOP                       V1G05710
                          DC      256*.9+LBLK-*                         V1G05720
                    L9    DC      /2200      2,2      P.D.              V1G05730
                          DC      /3191      3,1      9,1               V1G05740
                          DC      /A2A7     10,2     10,7               V1G05750
                          DC      /AA9B     10,10     9,11              V1G05760
                          DC      /3B2A      3,11     2,10              V1G05770
                          DC      /2736      2,7      3,6               V1G05780
                          DC      /96A7      9,6     10,7               V1G05790
                          DC      /09B1      P.U.    11,1               V1G05800
                          DC      /0100      STOP                       V1G05810
                          DC      256*. +LMIN-*                         V1G05820
                    LBLK  DC      /B101     11,1      STOP              V1G05830
                          DC      256*.-+LPLS-*                         V1G05840
                    LMIN  DC      /3600      3,6      P.D.              V1G05850
                          DC      /9609      9,6                        V1G05860
                          DC      /B101     11,1      STOP              V1G05870
                          DC      256*/4E+LDEC-*                        V1G05880
                    LPLS  DC      /3600      3,6      P.D.              V1G05890
                          DC      /9666      9,6      6,6               V1G05900
                          DC      /6966      6,9      6,6               V1G05910
                          DC      /6309      6,3      P.U.              V1G05920
                          DC      /B101     11,1      STOP              V1G05930
                          DC      256*..+LCOM-*                         V1G05940
                    LDEC  DC      /5400      5,4      P.D.              V1G05950
                          DC      /5676      5,6      7,6               V1G05960
                          DC      /7454      7,4      5,4               V1G05970
                          DC      /09B1      P.U.    11,1               V1G05980
                          DC      /0100      STOP                       V1G05990
                          DC      256*.,+LASK-*                         V1G06000
                    LCOM  DC      /5100      5,1      P.D.              V1G06010
                          DC      /7374      7,3      7,4               V1G06020
                          DC      /7656      7,6      5,6               V1G06030
                          DC      /5474      5,4      7,4               V1G06040
                          DC      /09B1      P.U.    11,1               V1G06050
                          DC      /0100      STOP                       V1G06060
                          DC      256*.*+LSLA-*                         V1G06070
                    LASK  DC      /4400      4,4      P.D.              V1G06080
                          DC      /6688      6,6      8,8               V1G06090
                          DC      /6648      6,6      4,8               V1G06100
                          DC      /6684      6,6      8,4               V1G06110
                          DC      /6636      6,6      3,6               V1G06120
                          DC      /6696      6,6      9,6               V1G06130
                          DC      /09B1      P.U.    11,1               V1G06140
                          DC      /0100      STOP                       V1G06150
                          DC      256*./+LEQU-*                         V1G06160
                    LSLA  DC      /2200      2,2      P.D.              V1G06170
                          DC      /AA09     10,10     P.U.              V1G06180
                          DC      /B101     11,1      STOP              V1G06190
                          DC      256*/7E+LRPN-*                        V1G06200
                    LEQU  DC      /3400      3,4      P.D.              V1G06210
                          DC      /9409      9,4      P.U.              V1G06220
                          DC      /3800      3,8      P.D.              V1G06230
                          DC      /9809      9,8      P.U.              V1G06240
                          DC      /B101     11,1      STOP              V1G06250
                          DC      256*.<+LLPN-*                         V1G06260
                    LRPN  DC      /4100      4,1      P.D.              V1G06270
                          DC      /6369      6,3      6,9               V1G06280
                          DC      /4B09      4,11     P.U.              V1G06290
                          DC      /B101     11,1      STOP              V1G06300
                          DC      256*.%+LDOL-*                         V1G06310
                    LLPN  DC      /8B00      8,11     P.D.              V1G06320
                          DC      /6963      6,9      6,3               V1G06330
                          DC      /8109      8,1      P.U.              V1G06340
                          DC      /B101     11,1      STOP              V1G06350
                          DC      256*.$+LQUO-*                         V1G06360
                    LDOL  DC      /3300      3,3      P.D.              V1G06370
                          DC      /4282      4,2      8,2               V1G06380
                          DC      /9395      9,3      9,5               V1G06390
                          DC      /8646      8,6      4,6               V1G06400
                          DC      /3739      3,7      3,9               V1G06410
                          DC      /4A6A      4,10     6,10              V1G06420
                          DC      /8A99      8,10     9,9               V1G06430
                          DC      /8A6A      8,10     6,10              V1G06440
                          DC      /6B61      6,11     6,1               V1G06450
                          DC      /09B1      P.U.    11,1               V1G06460
                          DC      /0100      STOP                       V1G06470
                          DC      256*/7D+TABEN-*+1                     V1G06480
                    LQUO  DC      /6700     6,7       P.D.              V1G06490
                          DC      /695A     6,9       5,10              V1G06500
                          DC      /6B7A     6,11      7,10              V1G06510
                          DC      /6909     6,9       P.U.              V1G06520
                          DC      /B101     11,1      STOP              V1G06530
                    TABEN DC      0                                     V1G06540
                          END                                           V1G06550
