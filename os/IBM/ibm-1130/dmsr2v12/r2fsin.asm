                          HDNG    CALL FSIN                             R2G00001
                    *************************************************** R2G00005
                    *                                                 * R2G00010
                    *   SUBROUTINE NAME-                              * R2G00020
                    *      FULL NAME- STANDARD PRECISION FLOATING     * R2G00030
                    *         POINT SINE AND COSINE FUNCTION.         * R2G00040
                    *      CODE NAME- FSIN/FSIN/FCOSN/FCOS            * R2G00050
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES EITHER THE  * R2G00060
                    *      SINE OR THE COSINE OF A STANDARD PRECISION * R2G00070
                    *      FLOATING-POINT NUMBER.                     * R2G00080
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2G00090
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2G00100
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2G00110
                    *   SPECIAL FEATURES- N/A                         * R2G00120
                    *   ADDITIONAL INFORMATION-                       * R2G00130
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2G00140
                    *         SUBROUTINE LIBRARY MANUAL               * R2G00150
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* R2G00160
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* R2G00170
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * R2G00180
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* R2G00190
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * R2G00200
                    *         INPUT ARGUMENT.                         * R2G00210
                    *                                                 * R2G00220
                    *************************************************** R2G00230
                          HDNG    CALL FSIN                             R2G00240
                          SPR                                           R2G00250
                          ENT     FSIN      STANDARD FORTRAN NAME       R2G00260
                          ENT     FSINE                                 R2G00270
                          ENT     FCOS      STANDARD FORTRAN NAME       R2G00280
                          ENT     FCOSN                                 R2G00290
                    FCOS  DC      0         FORTRAN ENTRY               R2G00300
                          LIBF    FGETP     GET PARAMETER               R2G00310
                    FCOSN DC      0         USER ENTRY                  R2G00320
                          LD      FCOSN     GET RETURN ADDRESS          R2G00330
                          STO     FSINE     AND PUT IN FSINE FOR RET.   R2G00340
                          LIBF    FADD      SINCE COS ENTRY, ADD PI/2   R2G00350
                          DC      HPI       TO THE ARGUMENT. COS(X)=    R2G00360
                          MDX     FSINE+1   SIN(X+PI/2).                R2G00370
                    FSIN  DC      0         FORTRAN ENTRY               R2G00380
                          LIBF    FGETP     GET PARAMETER               R2G00390
                    FSINE DC      0         USER ENTRY                  R2G00400
                          LD    3 125       GET EXPONENT TO CHK ARGU-   R2G00410
                          S       Q         MENT RANGE.IF X LT 2**-17,  R2G00420
                          BSC  I  FSINE,+Z  SIN(X)=.RET X.              R2G00430
                          S       Q+1       IF X GT 24,LOSS OF SIGNI-   R2G00440
                          BSC  L  OVFL,-    FICANCE--GO SET ERROR INDR  R2G00450
                    *                                                   R2G00460
                    *COMPUTE Y =FRACTIONAL REMAINDER ON DIVISION BY 2PI R2G00470
                    *                                                   R2G00480
                          LDD     R2PI      =1/(2PI).                   R2G00490
                          LIBF    XMDS      CALC Y=X*(1/2PI)            R2G00500
                          STD   3 126       SAVE Y MANTISSA      .B-2+C R2G00510
                          LD    3 125                            .C+128 R2G00520
                          S       Q+2       =129                 .C-1   R2G00530
                          BSC  L  SIN1,+Z   IF Y EXPONENT LT 1, OMIT    R2G00540
                          A       Q+5       SHIFT. OTHERWISE, CONSTRUCT R2G00550
                          STO     SLT       A SHIFT LEFT.        .C-1   R2G00560
                          LDD   3 126       GET MANTISSA AND DO SHIFT   R2G00570
                    SLT   SLT     *-*       TO DISCARD INTEGER PART.B-1 R2G00580
                          STD   3 126       SAVE FRACTIONAL PART        R2G00590
                    *                                                   R2G00600
                    *COMPUTE Z= INPUT TO APPROXIMATING POLYNOMIAL       R2G00610
                    *                                                   R2G00620
                          SLT     1         IF FRACTION GT .25 AND      R2G00630
                          EOR   3 126       LT 0.75. NO, THEN BR        R2G00640
                          BSC  L  *+3,-     TO LEAVE MANTISSA ALONE.    R2G00650
                          LDD     HALF      YES, THEN SET Z=.5-Y.       R2G00660
                          SD    3 126                                   R2G00670
                          STD   3 126       STORE Z AS MANTISSA         R2G00680
                          SLA     16        SET EXPONENT TO -1          R2G00690
                    SIN1  A       Q+6       SCALE EXPONENT              R2G00700
                          STO   3 125       STORE CORRECT EXPONENT      R2G00710
                          LIBF    NORM      NORMALIZE POLYNOMIAL INPUT  R2G00720
                    *                                                   R2G00730
                    *SHIFT Z MANTISSA ACCORDING TO EXPONENT             R2G00740
                    *                                                   R2G00750
                          LIBF    FSTO      SAVE INPUT TO POLYNOMIAL    R2G00760
                          DC      Z                                     R2G00770
                          LD      Q+4       GET A SHIFT RT CON          R2G00780
                          S     3 125       SUB C TO SET SHIFT FOR      R2G00790
                          STO     SRT       MANTISSA. -C-2+/1880        R2G00800
                          LDD   3 126       GET AMNTISSA        .B0+C   R2G00810
                          BSC     +Z        IF NEG,SUB ONE TO CORRECT   R2G00820
                          SD      ONE       TWOS COMPLEMENT FOR SHIFT   R2G00830
                    SRT   SRT     *-*       PERFORM SHIFT        .B-2   R2G00840
                          BSC     +Z        RESTORE TWOS COMPLEMENT ONE R2G00850
                          AD      ONE       IF NEG                      R2G00860
                    *                                                   R2G00870
                    *COMPUTE POLYNOMIAL APPROXIMATION                   R2G00880
                    *                                                   R2G00890
                          STD   3 126       SAVE POLYNOMIAL INPUT=Z     R2G00900
                          LIBF    XMDS      COMPUTE Z**2                R2G00910
                          STD   3 126       AND PUT IN FAC      .B-4    R2G00920
                          LDD     A5        GET AS AND          .B19    R2G00930
                          LIBF    XMDS      MPY BY Z**2         .B15    R2G00940
                          AD      A4        ADD A4              .B15    R2G00950
                          LIBF    XMDS      MPY BY Z**2         .B11    R2G00960
                          AD      A3        ADD A3              .B11    R2G00970
                          LIBF    XMDS      MPY BY Z**2         .B7     R2G00980
                          AD      A2        ADD A2              .B7     R2G00990
                          LIBF    XMDS      MPY BY Z**2         .B3     R2G01000
                          AD      A1        ADD A1              .B3     R2G01010
                          STD   3 126       SAVE INTERMEDIATE           R2G01020
                          LD      Q+3       RESULT AND SET EXPONENT=3.  R2G01030
                          STO   3 125                                   R2G01040
                          LIBF    FMPY      MPY BY Z TO GET FINAL       R2G01050
                          DC      Z         POLYNOMIAL OUTPUT.          R2G01060
                          LD    3 125        COMPARE EXPON. WITH        R2G01070
                          S       Q+2        129 TO CHECK FOR GR. 1     R2G01080
                          BSC  I  FSINE,+Z   IF NEG., EXIT              R2G01090
                          LD    3 126        MOVE SIGN OF FAC           R2G01100
                          SLT     1            TO CARR IND.             R2G01110
                          LDD     HALF       GET SIGNIFICANT BIT TO     R2G01120
                          SRA     1          A AND Q AND SHIFT          R2G01130
                          BSC     C          IS CARRY OFF               R2G01140
                          OR      HALF       NO, GET SIGN BIT SET       R2G01150
                          STD   3 126       STORE INTO FAC              R2G01160
                          BSC  I  FSINE     RET TO MAIN PROGRAM         R2G01170
                    *                                                   R2G01180
                    *CONSTANTS AND BUFFER AREA                          R2G01190
                    *                                                   R2G01200
                    A1    DEC     +6.2831853B3   COEFFICIENTS           R2G01210
                    A2    DEC     -41.341681B7   FOR                    R2G01220
                    A3    DEC     +81.602481B11  APPROXIMATING          R2G01230
                    A4    DEC     -76.581285B15  POLYNOMIAL             R2G01240
                    A5    DEC     +39.760722B19                         R2G01250
                    ONE   DEC     1              FIXED PT TWO WD ONE    R2G01260
                    R2PI  DEC     1.591549430918954E-1B-2  1/2*PI       R2G01270
                    HALF  DC      /8000     0.5B-2                      R2G01280
                          DC      /0000     SECOND WORD OF HALF         R2G01290
                    HPI   DEC     1.57079632679            PI/2         R2G01300
                    Z     DEC     0.0       POLYNOMIAL INPUT STG        R2G01310
                    Q     DC      128-16    0    CONSTANTS TO SCALE     R2G01320
                          DC      24+16     1    EXPONENTS AND CHK      R2G01330
                          DC      129       2    RANGES.                R2G01340
                          DC      128+3     3                           R2G01350
                          DC      126+/1880 4                           R2G01360
                          SLT     0         5    SHIFT LEFT CONSTANT    R2G01370
                          DC      127       6                           R2G01380
                    *                                                   R2G01390
                    *SET ERROR INDR AND RET ZERO IF ARGUMENT GT 2**24   R2G01400
                    *                                                   R2G01410
                    OVFL  SLT     32        CLEAR ACC AND EXT           R2G01420
                          STO   3 125       RETURN ZERO IN FAC          R2G01430
                          STD   3 126       SIN(X)=0                    R2G01440
                          LD      SINEB     TURN ON SINE PROGRAM        R2G01450
                          OR    3 124       ERROR INDICATOR.            R2G01460
                          STO   3 124                                   R2G01470
                          BSC  I  FSINE     RET TO MAIN PROGRAM         R2G01480
                    SINEB DC      /2        BIT 14--SIN ERROR BIT.      R2G01490
                          END                                           R2G01500
