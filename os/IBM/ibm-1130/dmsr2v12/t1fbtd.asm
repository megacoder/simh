                    *************************************************** T1A00010
                    *                                                 * T1A00014
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * T1A00015
                    *                                                 * T1A00020
                    *   SUBROUTINE NAME-                              * T1A00030
                    *      FULL NAME-FLOATING POINT BINARY TO DECIMAL * T1A00040
                    *         AND DECIMAL TO BINARY CONVERSION.       * T1A00050
                    *      CODE NAME- FBTD/FDTB                       * T1A00060
                    *   PURPOSE- THIS SUBPROGRAM CONVERTS A FLOATING- * T1A00070
                    *      POINT BINARY NUMBER TO A DECIMAL FLOATING- * T1A00080
                    *      POINT NUMBER, OR VICE VERSA.               * T1A00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* T1A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * T1A00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * T1A00120
                    *   SPECIAL FEATURES- N/A                         * T1A00130
                    *   ADDITIONAL INFORMATION-                       * T1A00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * T1A00150
                    *         SUBROUTINE LIBRARY MANUAL               * T1A00160
                    *                                                 * T1A00170
                    *************************************************** T1A00180
                          HDNG    CALL FBTD/FDTB                        T1A00190
                          ENT     FBTD      BINARY-TO-DECIMAL           T1A00200
                          ENT     FDTB      DECIMAL-TO-BINARY.          T1A00210
                    D     EQU     9         NO. OF SIGNIFICANT DIGITS   T1A00220
                    FDTB  DC      0         FLOAT DECIMAL TO BINARY     T1A00230
                          STX   1 FDX1+1    SAVE INDEX REGISTERS        T1A00240
                          STX   2 FDX2+1                                T1A00250
                          STX   3 FDX3+1                                T1A00260
                          LD   I  FDTB      ADDR OF 1ST WD OF INPUT     T1A00270
                          STO     *+1                                   T1A00280
                          LDX  L1 *-*       PUT ARGUMENT ADDR IN XR1    T1A00290
                          MDX  L  FDTB,1    SET UP RETURN               T1A00300
                          BSI  L  FLOTD     CALL FOR CONVERSION.        T1A00310
                    FDX3  LDX  L3 *-*       RESTORE XR3                 T1A00320
                          SLT     32                                    T1A00330
                          SD    2 FLBMN-F                               T1A00340
                          BSC     Z                                 2-4 T1A00345
                          MDX     FD01      NON-ZERO, DO 'EOR'      212 T1A00346
                          RTE     16        LOOK AT Q REG           212 T1A00348
                          BSC     Z         SKIP IF ALSO ZERO       212 T1A00350
                          MDX     FD00      GO DO ROTATE & EOR      212 T1A00352
                          RTE     16        RETURN A+Q TO NORMAL    212 T1A00354
                          MDX     FD02      GO CONVERT MAGNITUDE    212 T1A00355
                    FD00  RTE     16        RETURN A+Q REGS         212 T1A00356
                    FD01  EOR     FBCN+6    =/8000                  212 T1A00358
                    FD02  BSC     -         CONVERT MAGNITUDE & SIGN212 T1A00360
                          LDD   2 FLBMN-F   TO TWOS COMPLEMENT FORM.    T1A00370
                          STD   3 126       STORE RESULT MANTISSA       T1A00380
                          LD    2 FLBCH-F                               T1A00390
                          STO   3 125       STORE RESULT CHARACTERISTIC T1A00400
                    FDX1  LDX  L1 *-*       RESTORE XR1 AND XR2         T1A00410
                    FDX2  LDX  L2 *-*                                   T1A00420
                          BSC  I  FDTB      EXIT.                       T1A00430
                    FBTD  DC      0         FLOAT BINARY TO DECIMAL     T1A00440
                          STX  L1 FBX1+1                                T1A00450
                          STX  L2 FBX2+1                                T1A00460
                          LD   I  FBTD      GET OUTPUT ADDR             T1A00470
                          MDX  L  FBTD,1    SET UP RETURN.              T1A00480
                          STO     FPLC+1                                T1A00490
                          LD    3 125       SCALE THE EXPONENT          T1A00500
                          S       FBCN+7    =127                        T1A00510
                          STO  L  FLBCH     SAVE SCALED EXPONENT        T1A00520
                          SLT     32        CLEAR ACC AND EXT TO        T1A00530
                          STD  L  MCAR      INITIALIZE STG AREAS        T1A00540
                          LDX   2 -5        LOOP TO CLEAR BUF5          T1A00550
                          STO  L2 BUF5+5    CLEAR BUF5.                 T1A00560
                          MDX   2 +1                                    T1A00570
                          MDX     *-4                                   T1A00580
                          STO  L  FLE10     CLEAR CTR                   T1A00590
                          LDD   3 126       GET THE MANTISSA OF THE     T1A00600
                          STD  L  BUF5+1    ARGUMENT                    T1A00610
                          BSC  L  FBNX,+-   BR TO OUTPUT ZERO IF ZERO.  T1A00620
                          BSC  L  *+4,-     OTHERWISE,GET THE ABSOLUTE  T1A00630
                          SLT     32        VALUE OF THE MANTISSA       T1A00640
                          SD    3 126                                   T1A00650
                          STD  L  BUF5+1                                T1A00660
                          MDX     FBTN2     BR TO GET PROPER FORM       T1A00670
                    *                                                   T1A00680
                    *THIS SECTION SCALES THE MANTISSA SO THAT THE       T1A00690
                    *BINARY PT IS BETWEEN WDS 1 AND 2 OF BUF5. THE      T1A00700
                    *MANTISSA IS KEPT CENTERED BY MULTIPLYING.          T1A00710
                    *                                                   T1A00720
                    FBTN  LD   L  FLBCH     GET SCALED EXPONENT         T1A00730
                          BSC  L  FBNX,+-   GO TO OUTPUT IF ZERO.       T1A00740
                          BSC  L  FBNM,+Z   DO A SHIFT RT IF NEG.       T1A00750
                          BSI  L  SLT       OTHERWISE SHIFT LEFT AND    T1A00760
                          MDX  L  FLBCH,-1  DECR FLBCH                  T1A00770
                          NOP               IF MDX CAUSES BR,SKIP NOP   T1A00780
                          MDX     FBTN2     GO TO GENERATE FRACTION     T1A00790
                    *                       DIGITS.                     T1A00800
                    FBNM  BSI  L  SRT       BRANCH TO SHIFT RIGHT SUBR  T1A00810
                          MDX  L  FLBCH,+1  ALTER EXPONENT TO MATCH     T1A00820
                          NOP               IF MDX CAUSES BR,SKIP NOP   T1A00830
                    *                                                   T1A00840
                    *THIS SECTION CALLS THE MPY BY 10 RTN TO GET        T1A00850
                    *AN INTEGER DIGIT FOR SCIENTIFIC FORMAT OUTPUT.     T1A00860
                    *                                                   T1A00870
                    FBTN2 LD   L  BUF5      GET THE CARRY WORD          T1A00880
                          BSC  L  FBTN1,Z   BR TO DIVIDE BY 10 IF NON-  T1A00890
                          BSI  L  MPY       ZERO.IF ZERO,GO TO MPY BY   T1A00900
                          MDX  L  FLE10,-1  10,AND KEEP TRACK W/CTR     T1A00910
                          NOP               IF MDX CAUSES BR,SKIP NOP   T1A00920
                          MDX     FBTN2     REPEAT                      T1A00930
                    BLANK DC      /0040      BLANK                  2-4 T1A00935
                    *                                                   T1A00940
                    *CONSTANTS TABLE FOR FBTD                           T1A00950
                    *                                                   T1A00960
                    FBCN  DC      /004E     PLUS                        T1A00970
                          DC      .-        1  MINUS                    T1A00980
                          DC      .0        2  ZERO                     T1A00990
                          DC      ..        3  PERIOD                   T1A01000
                          DC      .E        4  LETTER E                 T1A01010
                          DC      10        5  SINGLE WD 10             T1A01020
                          DC      /8000     6  SIGN BIT MASK            T1A01030
                          DC      127       7  SCALE EXPONENT           T1A01040
                    *                                                   T1A01050
                    *THIS SECTION CALLS THE DIVIDE BY 10 RTN TO GET     T1A01060
                    *AN INTEGER FOR SCIENTIFIC FORMAT OUTPUT.           T1A01070
                    *                                                   T1A01080
                    FBTN1 LD   L  BUF5      CHECK CARRY AGAINST 10      T1A01090
                          S       FBCN+5    =10                         T1A01100
                          BSC  L  FBTN,+Z   LT 10,GO SCALE MANTISSA     T1A01110
                          BSI  L  DIV       GT 10, BR TO DIVIDE SUBR    T1A01120
                          MDX  L  FLE10,+1  KEEP TRACK OF POWERS OF 10  T1A01130
                          NOP               IF MDX CAUSES BR,SKIP NOP   T1A01140
                          MDX     FBTN1     RETURN                      T1A01141
                    *                                               2-9 T1A01142
                    *THIS SECTION TAKES CARE OF POSSIBLE ERRORS     2-9 T1A01143
                    *ENCOUNTERED DURING EARLIER TRUNCATIONS.        2-9 T1A01144
                    *MAX ADD THAT WILL NOT EFFECT RESULT INCORRECTLY2-9 T1A01145
                    *IS  0.5*10**(-8) = /0. 0000 0015 798E          2-9 T1A01146
                    *                                               2-9 T1A01147
                    ONE   DC      1         DECIMAL ONE             2-9 T1A01148
                    *                                               2-9 T1A01149
                    FBNX  LDX   1 4                                 2-9 T1A01150
                    FLOOP SRA     16        CLEAR ACC,SAVE CARRY    2-9 T1A01151
                          BSC     C         CARRY ON LAST ADD       2-9 T1A01152
                          LD      ONE       YES,ADD ONE             2-9 T1A01153
                          A    L1 FEL2-4    ADD MAX ERROR           2-9 T1A01154
                          A    L1 BUF5-1                            2-9 T1A01155
                          STO  L1 BUF5-1                            2-9 T1A01156
                          MDX   1 -1                                2-9 T1A01157
                          MDX     FLOOP     TAKE NEXT WORD IN BUF5  2-9 T1A01158
                    *                                               2-9 T1A01159
                          S    L  FLCN+16   SUBTRACT TEN            2-9 T1A01160
                          BSC  L  FBNX1,Z+  BR IF BUF5 NE TO 10     2-9 T1A01161
                          MDX  L  BUF5,-9   NO,MAKE BUF5 = 1        2-9 T1A01162
                          MDX  L  FLE10,1   INCR 10TH EXPONENT      2-9 T1A01163
                          NOP                                       2-9 T1A01164
                    *                                                   T1A01169
                    *THIS SECTION ORGANIZES AND OUTPUTS A STRING OF     T1A01170
                    *EBCDIC-CODED CHARS REPRESENTING THE FLTING PT      T1A01180
                    *DECIMAL EQUIVALENT OF THE INPUT BINARY NO.         T1A01190
                    *                                                   T1A01200
                    FBNX1 LDX  I1 FPLC+1    OUTPUT ADDR IN XR1          T1A01210
                          LD      FBCN      =.+                         T1A01220
                          STO   1 0         SET THE ALGEBRAIC SIGN TO   T1A01230
                          LD    3 126       CORRESPOND TO THAT OF THE   T1A01240
                          BSC  L  *+2,-     INPUT BINARY NO.            T1A01250
                          LD      FBCN+1    =.-                         T1A01260
                          STO   1 0                                     T1A01270
                          LD   L  BUF5      GET INTEGER DIGIT           T1A01280
                          A       FBCN+2    =.0  SET TO EBCDIC CODE     T1A01290
                          STO   1 1         AND OUTPUT                  T1A01300
                          LD      FBCN+3    =..  SET DECIMAL POINT      T1A01310
                          STO   1 2                                     T1A01320
                          MDX   1 D+2       MODIFY XR1 ACCORDING TO     T1A01330
                          STX   1 FPLC+1    NO. OF SIGNIFICANT DIGITS   T1A01340
                          LDX   1 -D+1      FOR NEXT PART OF OUTPUT     T1A01350
                    *                                                   T1A01360
                    *GENERATE THE FRACTIONAL DIGITS                     T1A01370
                    *                                                   T1A01380
                    FBNX2 SLA     16        CLEAR THE CARRY WD OF BUF5  T1A01390
                          STO  L  BUF5      GENERATE 10 FRACTION DIGITS T1A01400
                          BSI  L  MPY       BR TO MULTIPLY BY 10 SUBR   T1A01410
                          LD   L  BUF5      GET THE RESULTING DIGIT     T1A01420
                          A       FBCN+2    =.0 EBCDIC FOR OUTPUT       T1A01430
                    FPLC  STO  L1 *-*       OUTPUT FRACTIONAL DIGIT     T1A01440
                          MDX   1 +1        MODIFY CTR FOR RETURN       T1A01450
                          MDX     FBNX2     GO TO CALC NEXT DIGIT       T1A01460
                    *                                                   T1A01470
                    *GENERATE THE EXPONENT OF TEN                       T1A01480
                    *                                                   T1A01490
                          LDX  I1 FPLC+1    GET NEXT OUTPUT ADDR        T1A01500
                          LD      BLANK     .BLANK.                 2-4 T1A01501
                          STO   1 4         SET .BLANK.             2-4 T1A01502
                          LD      FBCN+4    =.E                         T1A01510
                          STO   1 0         SET .E.                     T1A01520
                          LD      FBCN      =.+  GET PLUS AND STORE     T1A01530
                          STO   1 1                                     T1A01540
                          SLA     16        GET OPPOSITE SIGN OF FLE10  T1A01550
                          S       FLE10                             2-4 T1A01560
                          BSC  L  FGENT,+   BR IF NOT PTV           2-4 T1A01570
                          STO     FLE10     ELSE REVERSE SIGN IN    2-4 T1A01580
                          LD      FBCN+1    FLET0,AND REPLACE THE       T1A01590
                          STO   1 1         STORED PLUS WITH MINUS.     T1A01600
                    FGENT LD      FLE10     GET ABS VALUE OF EXP.   2-4 T1A01610
                          SRT     16        SHIFT TO EXTENSION AND      T1A01620
                          D       FBCN+5    DIVIDE BY 10.               T1A01630
                          A       FBCN+2    =.0. EBCDIC OF QUOTIENT     T1A01640
                          STO   1 2         STORED IN TENS POSITION     T1A01650
                          RTE     16        GET REMAINDER INTO A REG    T1A01660
                          A       FBCN+2    =.0. EBCDIC OF REMAINDER    T1A01670
                          STO   1 3         STORED IN UNITS POSITION    T1A01680
                    FBX1  LDX  L1 *-*       RESTORE XR1                 T1A01690
                    FBX2  LDX  L2 *-*       RESTORE XR2                 T1A01700
                          BSC  I  FBTD      RETURN TO CALLER            T1A01710
                    *                                                   T1A01720
                    *THIS SECTION IS THE BASIC DECIMAL TO BINARY CON-   T1A01730
                    *VERSION ROUTINE. XR1 POINTS TO THE INPUT STRING.   T1A01740
                    *IT RETURNS A NORMAL MANTISSA (MAGNITUDE+SIGN) IN   T1A01750
                    *FLBMN. IT RETURNS A BINARY EXPONENT IN EXCESS 128  T1A01760
                    *CODE IN FLBCH.                                     T1A01770
                    *                                                   T1A01780
                    *IF B VALUE SPECIFIED,ANSWER IS RETURNED IN FLB2    T1A01790
                    *AND FLBSW SET NON-ZERO. IF DECIMAL POINT OR E      T1A01800
                    *SPECIFIED,OR B SPECIFIED, FLNIS SET NON-ZERO.      T1A01810
                    *                                                   T1A01820
                    FLOTD DC      0         ENTRY--LINK WORD            T1A01830
                          SLT     32        CLEAR ACC AND EXT           T1A01840
                          LDX   2 FLE10-BUF5-5                          T1A01850
                          STO  L2 BUF5+5    RESET SWITCHES AND          T1A01860
                          MDX   2 1         BUFFERS TO ZERO.            T1A01870
                          MDX     *-4                                   T1A01880
                          LD      FLCN      =SLT 0. SET FLLP2 TO SHIFT  T1A01890
                          STO     FLLP2     LEFT ZERO (INITIALIZED)     T1A01900
                          LD    1 0         ANALYZE SIGN                T1A01910
                          S       FLCN+1    =.PLUS(12-8-6)              T1A01920
                          BSC  L  FL1,+-    IF PLUS,BR TO FL1           T1A01930
                          S       FLCN+2    =AMPERSAND(12)-PLUS         T1A01940
                          BSC  L  FL1,+-    IF AMPERSAND,BR TO FL1      T1A01950
                          S       FLCN+3    .- MINUS .AMPERSAND         T1A01960
                          BSC  L  *+3,Z     IF NOT MINUS,BR TO FL1+1    T1A01970
                          LD      FLCN+4    =/8000                      T1A01980
                          STO     FLSGN     IF MINUS,ST - BIT IN FLSGN  T1A01990
                    FL1   MDX   1 +1        INCR XR1 TO READ NEXT CHAR  T1A02000
                          LDX   3 0         RESET DECML PT CNT          T1A02010
                    FLLP  LD    1 0         GET A MANTISSA DIGIT        T1A02020
                          MDX   1 +1        INCR XR1 TO READ NEXT CHAR  T1A02030
                          S       FLCN+5    =.0. FROM EBCDIC TO BINARY  T1A02040
                          BSC  L  FLSSC,+Z  BR IF SPECIAL CHAR          T1A02050
                    FLLP2 SLT     0         CHANGED TO MDX 3 -1 IF      T1A02060
                          SLT     0         CHAR IS PERIOD MAY SKIP.    T1A02070
                          STO     MCAR+1    ST CHAR                     T1A02080
                          BSI  L  MPY       COMPUTE BINARY MANTISSA     T1A02090
                          BSC  L  FLERR,Z   CHK MCAR+1.ERROR IF NOT 0   T1A02100
                          MDX     FLLP      IF 0,READ NEXT CHAR         T1A02110
                    *                                                   T1A02120
                    *ANALYZE SPECIAL CHARACTER                          T1A02130
                    *                                                   T1A02140
                    FLSSC S       FLCN+6    =.E-.0 CHECK FOR E          T1A02150
                          BSC  L  FLESC,+-  IF E,BR TO SCAN SPECS       T1A02160
                          S       FLCN+8    =..-.E CHK FOR PERIOD       T1A02170
                          BSC  L  *+4,Z     IF NOT .,BR TO CHK BLANK    T1A02180
                          LD      FLCN+9    IF PERIOD,PUT MDX 3 -1 IN   T1A02190
                          STO     FLLP2     FLLP2 AND IN FLNIS TO CNT   T1A02200
                          STO     FLNIS     NO. OF DECML PLACES         T1A02210
                          MDX     FLLP      RETURN TO READ NEXT CHAR    T1A02220
                          S       FLCN+10   =. -.. CHK FOR BLANK        T1A02230
                          BSC  L  FLERR,Z   IF NOT BLANK,SET ERROR      T1A02240
                          MDX     FLFIN     INDR.IF BLANK,END SCAN.     T1A02250
                    *                                                   T1A02260
                    *SCAN FOR E AND B SPECIFICATIONS                    T1A02270
                    *                                                   T1A02280
                    FLESC LD      FLCN+11   ST FLE10 ADDR IN FL3+1 AND  T1A02290
                          STO     FL3+1     FLNIS                       T1A02300
                          STO     FLNIS                                 T1A02310
                          LD      FLCN+19   =A  FLEBF-FL4-1             T1A02320
                          STO     FL4                                   T1A02330
                          LD    1 0         GET SIGN OF EXPONENT        T1A02340
                          S       FLCN+1    =.PLUS(12-6-8)              T1A02350
                          BSC  L  FL2,+-    BR TO GET EXPONENT IF PTV   T1A02360
                          S       FLCN+2    =.AMPERSAND(12)-.PLUS       T1A02370
                          BSC  L  FL2,+-    BR TO GET EXPONENT IF PTV   T1A02380
                          S       FLCN+3    .- MINUS .AMPERSAND         T1A02390
                          BSC  L  *+3,Z     BR IF NOT MINUS             T1A02400
                          LD      FLCN+12   IF MINUS,PUT S FLEBF-FL4-1  T1A02410
                          STO     FL4       IN FL4                      T1A02420
                    FL2   MDX   1 1         INCR XR1 TO READ NEXT CHAR  T1A02430
                          LD    1 0         GET A DIGIT OF EXPONENT     T1A02440
                          MDX   1 1         INCR XR1 TO READ NEXT CHAR  T1A02450
                          S       FLCN+5    =.0. FROM EBCDIC TO BINARY  T1A02460
                          BSC  L  FLSSC,+Z  BR TO SPECIAL CHAR IF NEG   T1A02470
                          STO     FLEBF     OTHERWISE,STORE DIGIT       T1A02480
                    FL3   LD   L  *-*       GET PREVIOUS EXPONENT RSLT  T1A02490
                          M       FLCN+16   MPY BY 10                   T1A02500
                          SLT     16        MOVE TO A REGISTER          T1A02510
                    FL4   A       FLEBF     ADD DIGIT JUST READ         T1A02520
                          STO  I  FL3+1     KEEP RESULT TO ADD TO NEXT  T1A02530
                          MDX     FL2+1     DIGIT READ                  T1A02540
                    *                                                   T1A02550
                    *CONSTANTS TABLE FOR FBTD                           T1A02560
                    *                                                   T1A02570
                    FLEBF DC      0         TEMP STG                    T1A02580
                    FLCN  SLT     0                                     T1A02590
                          DC      /4E       (PLUS)                      T1A02600
                          DC      /50-/4E   (AMPERSAND-PLUS)            T1A02610
                          DC      +.--/50   (MINUS-AMPERSAND)           T1A02620
                          DC      /8000     SIGN BIT MASK            4  T1A02630
                          DC      .0        EBCDIC ZERO              5  T1A02640
                          DC      .E-.0     TEST FOR E               6  T1A02650
                          DC      .B-.E     TEST FOR B               7  T1A02660
                          DC      ..-.E     TEST FOR PERIOD          8  T1A02670
                          MDX   3 -1        USED TO CNT DECML PLACES 9  T1A02680
                          DC      . -..     TEST FOR BLANK          10  T1A02690
                          DC      FLE10     FLE10 ADDRESS           11  T1A02700
                          S    X  FLEBF-FL4-1  SUB CON FOR NEG EXPON-   T1A02710
                          DC      0         SINGLE WORD ZERO.      ENT  T1A02720
                          DC      1         SINGLE WORD ONE         14  T1A02730
                          DC      256       4-BIT ON                15  T1A02740
                          DC      10        SINGLE WORD TEN         16  T1A02750
                          DC      5         SINGLE WORD FIVE        17  T1A02760
                          DC      .S        EBCDIC S                18  T1A02770
                          A    X  FLEBF-FL4-1  ADD CON FOR PTV     19   T1A02780
                          DC      /7FFF     SGN BIT MASK.  /EXPONENT20  T1A02790
                          DC      -5        SINGLE WORD -5          21  T1A02800
                    FLE10 BSS     1         EXPONENT OF 10 CTR          T1A02810
                    FLSGN BSS     1         TEMP SGN STG                T1A02820
                    FLBCH BSS     1         STG FOR BINARY EXPONENT     T1A02830
                    FLBMN BSS  E  2         STG FOR BINARY MANTISSA     T1A02840
                    MCAR  BSS  E  2         TWO WORD CARRY BUFFER       T1A02850
                    FLNIS BSS     1         INDR OF INPUT FORMAT        T1A02860
                    BUF5  BSS     5         5-WD WORKING BUFFER         T1A02870
                    FLONE DC      0         TWO WORD ONE                T1A02880
                          DC      1                                     T1A02890
                    **** ERROR VECTOR ****                          2-9 T1A02891
                          DC      0      *                          2-9 T1A02892
                          DC      0      *                          2-9 T1A02893
                          DC      /0015  *  0.5 * 10 ** (-8)        2-9 T1A02894
                    FEL2  DC      /798D  *                          2-9 T1A02895
                    *********************                           2-9 T1A02896
                    *                                                   T1A02900
                    *POST-SCAN PROCESSING                               T1A02910
                    *                                                   T1A02920
                    FLFIN MDX  I3 FLE10     COMPUTE POWER OF 10         T1A02930
                          SLT     0         MAY SKIP                    T1A02940
                          STX   3 FLE10     ST NEW POWER OF 10          T1A02950
                          LDX  L3 64+128    INITIAL BINARY EXPONENT     T1A02960
                          LDX   2 -5        SET CTR TO CHK FOR ZERO     T1A02970
                    GETZ  LD   L2 BUF5+5                                T1A02980
                          BSC  L  *+3,Z     IF NOT ZERO,GO TO POSITION  T1A02990
                          MDX   2 +1                                    T1A03000
                          MDX     GETZ      REPEAT LOOP                 T1A03010
                          MDX     FLZER     FLOATING ZERO SPECIFIED     T1A03020
                    FLFNL LD      BUF5      SHIFT MANTISSA RT UNTIL     T1A03030
                          BSC  L  *+4,+-    THE LEFT WORD IS ZERO.      T1A03040
                          BSI     SRT                                   T1A03050
                          MDX   3 +1        UPDATE BINARY EXPONENT      T1A03060
                          SLT     0         MAY SKIP                    T1A03070
                          MDX     FLFNL     REPEAT LOOP                 T1A03080
                    FLFNX LD      BUF5+1    SHIFT LEFT(NORMALIZE)       T1A03090
                          BSC  L  *+4,+Z    MANTISSA                    T1A03100
                          BSI     SLT                                   T1A03110
                          MDX   3 -1        UPDATE BINARY EXPONENT      T1A03120
                          SLT     0         MAY SKIP                    T1A03130
                          MDX     FLFNX     REPEAT LOOP                 T1A03140
                    *                                                   T1A03150
                    *ADJUST MANTISSA AND EXPONENT BY POWER OF 10 MOD.   T1A03160
                    *                                                   T1A03170
                          LD      FLE10     GET EXPONENT OF 10          T1A03180
                          BSC  L  *+4,+     BR IF NOT PTV               T1A03190
                          S       FLCN+14   =1. DECR EXPONENT           T1A03200
                          STO     FLE10                                 T1A03210
                          BSI     MPY       MPY IF EXPONENT OF 10 IS    T1A03220
                          MDX     FLFNL     PTV                         T1A03230
                          BSC  L  FLFEX,-   EXIT IF ZERO                T1A03240
                          A       FLCN+14   =1. IF EXPONENT OF 10 IS    T1A03250
                          STO     FLE10     NEG,TNCR EXPONENT           T1A03260
                          BSI     DIV       AND DIVIDE BY 10            T1A03270
                          MDX     FLFNL     GO TO SHIFT RIGHT           T1A03280
                    *                                                   T1A03290
                    *ASSEMBLE SIGNED MANTISSA AND BINARY                T1A03300
                    *CHARACTERISTIC FOR TRANSMISSION                    T1A03310
                    *                                                   T1A03320
                    FLFEX LDD     BUF5+1    GET MANTISSA AND STORE      T1A03330
                          STX   3 FLBCH                                 T1A03340
                          SRT     1         LEAVE SIGN BIT              T1A03350
                          AND     FLCN+20   =/7FFF TURN OFF SIGN BIT    T1A03360
                          OR      FLSGN     GET PROPER SIGN             T1A03370
                          STD     FLBMN     STORE SIGNED MANTISSA       T1A03380
                          LD      FLBCH     GET CHARACTERISTIC          T1A03390
                          BSC  L  FLERR,+Z        CHECK FOR EXPONENT    T1A03400
                          S       FLCN+15   =256  OVERFLOW AND          T1A03410
                          BSC  L  FLERR,-         UNDERFLOW             T1A03420
                    FLXXX LDX  L2 F         XR2=MANTISSA ADDR           T1A03430
                    F     EQU     FLBMN     DEFINE MANITISSA ADDR       T1A03440
                          BSC  I  FLOTD     RETURN TO OUTPUT            T1A03450
                    *                                                   T1A03460
                    *SUBROUTINE TO DIVIDE 5-PRECISION NUMBER IN         T1A03470
                    *BUF5 BY 10                                         T1A03480
                    *                                                   T1A03490
                    DIV   DC      0         ENTRY                       T1A03500
                          SLT     32        CLEAR ACC AND EXT           T1A03510
                          LDX   2 -5        SET COUNTER                 T1A03520
                    DIVL  LD   L2 BUF5+5    GET NEXT WORD               T1A03530
                          RTE     16        SUBTRACT 5 FROM EXTENSION   T1A03540
                          S       FLCN+17   =5                          T1A03550
                          LDS     2               TURNS ON CARRY        T1A03560
                          BSC     +Z        BR IF GT 5                  T1A03570
                          S       FLCN+21   IF LT 5,RESTORE 5           T1A03580
                          STS     DIVC      AND TURN OFF CARRY          T1A03590
                          D       FLCN+16   =10.PERFORM DIVISION BY 10  T1A03600
                    DIVC  LDS     *-*       GET STATUS                  T1A03610
                          BSC     C         IF LT 5,BR TO ST QUOTIENT   T1A03620
                          A       FLCN+4    IF GT 5,ADD /8000           T1A03630
                          STO  L2 BUF5+5    STORE QUOTIENT              T1A03640
                          MDX   2 +1        DECR CTR FOR RET            T1A03650
                          MDX     DIVL      REPEAT LOOP                 T1A03660
                          BSC  I  DIV       RETURN                      T1A03670
                    *                                                   T1A03680
                    *SUBROUTINE TO MPY 5-PRECISION NUMBER IN BUF5       T1A03690
                    *BY 10. CONTENTS OF MCAR+1 ARE ADDED TO RESULT.     T1A03700
                    *                                                   T1A03710
                    MPY   DC      0         ENTRY                       T1A03720
                          LDX   2 +5        SET COUNTER                 T1A03730
                    MPYL  LD   L2 BUF5-1    GET A WORD OF BUF5          T1A03740
                          M       FLCN+16   =10. MPY BY 10              T1A03750
                          BSC     +Z        BR IF PTV                   T1A03760
                          A       FLCN+16   IF NEG, ADD 10              T1A03770
                          AD      MCAR      ADD PREVIOUS EXCESS         T1A03780
                          STO     MCAR+1    STORE PRESENT EXCESS        T1A03790
                          SLT     16        FETCH EXT--PRODUCT          T1A03800
                          STO  L2 BUF5-1    PUT PRODUCT BACK IN BUF5    T1A03810
                          MDX   2 -1        DECR CTR FOR RET            T1A03820
                          MDX     MPYL      REPEAT LOOP                 T1A03830
                          LD      MCAR+1    STORE LAST EXCESS IN ACC    T1A03840
                          BSC  I  MPY       RETURN                      T1A03850
                    *                                                   T1A03860
                    *DECIMAL DATA ERROR ROUTINE                         T1A03870
                    *                                                   T1A03880
                    FLERR LDS     3         TURN ON OVFLO IF ERROR      T1A03890
                    FLZER SLT     32        CLEAR ACC AND EXT           T1A03900
                          STO     FLBCH     ZERO CHARACTERISTIC AND     T1A03910
                          STD     FLBMN     MANTISSA                    T1A03920
                          LD      *-1       SET FLNIS TO NON-ZERO       T1A03930
                          STO     FLNIS                                 T1A03940
                          MDX     FLXXX     GO TO EXIT                  T1A03950
                    *                                                   T1A03960
                    *THIS ROUTINE DOES A SHIFT RIGHT ONE BIT(THROUGH    T1A03970
                    *WORD BOUNDARIES)OF BUF5 THROUGH BUF5+4.            T1A03980
                    *                                                   T1A03990
                    SRT   DC      0         ENTRY                       T1A04000
                          LDX   2 -5        SET COUNTER                 T1A04010
                          SLT     32        CLEAR ACC AND EXT           T1A04020
                    SRTL  LD   L2 BUF5+5    GET A WORD                  T1A04030
                          RTE     1         SHIFT LAST BIT OF ACC TO    T1A04040
                          STO  L2 BUF5+5    FIRST OF EXT AND VICE VERSA T1A04050
                          RTE     15        POSITION EXTENSION BIT      T1A04060
                          MDX   2 +1        DECR CTR FOR RET            T1A04070
                          MDX     SRTL      REPEAT LOOP                 T1A04080
                          BSC  I  SRT       RETURN                      T1A04090
                    *                                                   T1A04100
                    *THIS ROUTINE DOES A SHIFT LEFT ONE BIT(THROUGH     T1A04110
                    *WORD BOUNDARIES)OF BUF5 THROUGH BUF5+4.            T1A04120
                    *                                                   T1A04130
                    SLT   DC      0         ENTRY                       T1A04140
                          LDX   2 +5        SET COUNTER                 T1A04150
                          SLT     32        CLEAR ACC AND EXT           T1A04160
                    SLTL  LD   L2 BUF5-1    GET A WORD                  T1A04170
                          RTE     31        EFFECTIVE ROTATE LEFT ONE   T1A04180
                          STO  L2 BUF5-1    REPLACE SHIFTED WORD        T1A04190
                          SLT     15        POSITION EXTENSION          T1A04200
                          MDX   2 -1        DECR CTR FOR RET            T1A04210
                          MDX     SLTL      REPEAT LOOP                 T1A04220
                          BSC  I  SLT       RETURN                      T1A04230
                          END                                           T1A04240
