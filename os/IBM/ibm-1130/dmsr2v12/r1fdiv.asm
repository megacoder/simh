                    *************************************************** R1C00010
                    *                                                 * R1C00020
                    *   SUBROUTINE NAME-                              * R1C00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1C00040
                    *         POINT DIVIDE FUNCTION.                  * R1C00050
                    *      CODE NAME- FDIV/FDIVX                      * R1C00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE QUOTIENT* R1C00070
                    *      OF TWO STANDARD PRECISION FLOATING-POINT   * R1C00080
                    *      NUMBERS.                                   * R1C00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1C00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1C00120
                    *   SPECIAL FEATURES- N/A                         * R1C00130
                    *   ADDITIONAL INFORMATION-                       * R1C00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1C00150
                    *         SUBROUTINE LIBRARY MANUAL               * R1C00160
                    *                                                 * R1C00170
                    *   VERSION 2  MODIFICATION 10                      R1C00175
                    *************************************************** R1C00180
                          HDNG    LIBF FDIV  -V1.                       R1C00190
                          LIBR                                          R1C00200
                          SPR                                           R1C00210
                          ENT     FDIV                                  R1C00220
                          ENT     FDIVX                                 R1C00230
                    FDIVX STX   1 SAVE+1    SAVE XR1                    R1C00240
                          LD   L  *-*       CALL+1                      R1C00250
                          MDX     COM                                   R1C00260
                    FDIV  STX   1 SAVE+1    SAVE XR1                    R1C00270
                          LD   L  *-*       CALL+1                      R1C00280
                          LDX   1 0         XR1=ZERO                    R1C00290
                    COM   STO     *+4                                   R1C00300
                          STS     STAT                                  R1C00310
                          A       ONE       BUILD EXIT                  R1C00320
                          STO     EXIT+1                                R1C00330
                          MDX  I1 *-*       EFFECTIVE OPND ADDR IN XR1  R1C00340
                          NOP               IF MDX CAUSES BR, SKIP NOP  R1C00350
                    *                                                   R1C00360
                    *DO TESTS ON DIVISOR AND COMPUTE EXPONENT OF RESULT R1C00370
                    *                                                   R1C00380
                          LDD   1 0         LOAD DIVISOR                R1C00390
                          BSC  L  DIVCK,+-  GO SET ERROR IF DIVISOR=0   R1C00400
                          STD     BARG      OTHERWISE SAVE DIVISOR      R1C00410
                          RTE     16        GET SECOND WD OF DIVISOR    R1C00420
                          STS     BARG+1    STRIP OFF EXPONENT FIELD    R1C00430
                          EOR     BARG+1    EXPONENT ONLY IN ACC        R1C00440
                          EOR     ALL1      ONES COMPLIMENT             R1C00450
                          A       K1        TWOS COMPLIMENT + 128       R1C00460
                          A     3 125       MODIFY DIVIDEND EXPONENT    R1C00470
                          STO   3 125       STORE NEW EXPONENT          R1C00480
                          LDD     BARG      GET LEAST SIGNIFICANT       R1C00490
                          RTE     16        OF DIVISOR                  R1C00500
                          BSC  L  SKIP,+-   BR IF ZERO                  R1C00510
                          SRA     2         SHIFT FOR EXPONENT          R1C00520
                          M     3 126       TIMES SIGNIFICANT FAC       R1C00530
                          D       BARG      MOST SIGNIFICANT PART OF    R1C00540
                          EOR     ALL1      DIVISOR. CHANGE TO 2'S      R1C00550
                          A       ONE       COMPLEMENT AND SHIFT FOR    R1C00560
                          SRT     14        CORRECT POSITION. SUBTRACT  R1C00570
                          AD    3 126       FROM DIVIDEND.              R1C00580
                          STD   3 126       SAVE ACC. & EXT.            R1C00585
                    *                                                   R1C00590
                    *PERFORM DIVISION ON THE MANTISSA                   R1C00600
                    *                                                   R1C00605
                    DIV   EOR     DMASK     CHECK FOR /8000             R1C00610
                          BSC  L  DIVD,Z    BRANCH NOT /8000            R1C00611
                          RTE     16        ROTATE BOTH 16              R1C00612
                          AND     DDMSK     CHECK FOR /FFFC             R1C00613
                          BSC  L  DIVD,Z    BRANCH NOT ZERO             R1C00614
                          LDD     DMASK     SET ACC.+EXT.= /80000004    R1C00615
                          MDX     DIVDE     GO TO DIVIDE                R1C00616
                    DIVD  LDD   3 126     RESTORE ACC.+EXT. TO ORIGNL   R1C00617
                    DIVDE SRT     2         SHIFT BOTH RIGHT            R1C00620
                          BSC     O         WAS THERE OVERFLOW          R1C00630
                          EOR     K2        YES, RESTORE SIGN           R1C00640
                          D       BARG      AND DIVIDE                  R1C00650
                          STO     Q1        SAVE 1ST HALF OF QUOTIENT   R1C00660
                          SLT     16        BRING IN REMAINDER          R1C00670
                          BSC  L  NOR,+-    BR ON NO REMAINDER          R1C00680
                          SRT     1         IF THERE IS A REMAINDER     R1C00690
                          D       BARG      DIVIDE IT AND POSITION      R1C00700
                          SRT     15        FOR PROPER SIGNIFICANCE     R1C00710
                          A       Q1        ADD 1ST HALF OF QUOTIENT    R1C00720
                    *                                                   R1C00730
                    *NORMALIZE THE QUOTIENT                             R1C00740
                    *                                                   R1C00750
                    NORM  STD   3 126       STORE IN FAC                R1C00760
                          BSC  L  *+2,-     BR IF NON-NEG               R1C00770
                          SLT     32        IF NEG REVERSE SIGN         R1C00780
                          SD    3 126                                   R1C00790
                          SLT     1         CHECK BIT SIGNIFICANCE      R1C00800
                          BSC  L  NTPTV,+   BRANCH IF SIGNIFICANT       R1C00810
                          LD    3 125       IF NOT SIGNIFICANT,GET      R1C00820
                          S       ONE       EXPONENT AND SUB 1          R1C00830
                          STO   3 125       RESTORE ALTERED EXPONENT    R1C00840
                          LDD   3 126       GET MANTISSA, ALTER IT TO   R1C00850
                          SLT     1         MATCH EXPONENT AND          R1C00860
                          STD   3 126       RESTORE MANTISSA            R1C00870
                    NTPTV BSC     +-        BR IF NON-ZERO              R1C00880
                          STO   3 125       IF ZERO,MAKE EXPONENT ZERO  R1C00890
                          LIBF    FARC      CHECK OVERFLOW/UNDERFLOW    R1C00900
                    STAT  LDS     *-*       RESTORE STATUS              R1C00910
                    SAVE  LDX  L1 *-*       RESTORE XR1                 R1C00920
                    EXIT  BSC  L  *-*       RET TO CALL+2               R1C00930
                    SKIP  LDD   3 126       2ND TERM NOT SIGNIFICANT-   R1C00940
                          MDX     DIV       GET MANTISSA,RET TO DIV     R1C00950
                    NOR   LD      Q1        IF NO REMAINDER, GET        R1C00960
                          MDX     NORM      QUOTIENT AND RET TO NORM    R1C00970
                    DIVCK LD      ONE                                   R1C00980
                          STO   3 123       STORE DIVIDE CHECK          R1C00990
                          MDX     STAT                                  R1C01000
                    *                                                   R1C01010
                    *CONSTANTS AREA                                     R1C01020
                    *                                                   R1C01030
                    ONE   DC      1         SINGLE WORD ONE             R1C01040
                    ALL1  DC      /FFFF     USED TO GET 1'S COMPLEMENT  R1C01050
                    K1    DC      /82       CORR FACTOR FOR EXPONENT    R1C01060
                    K2    DC      /C000     RESET SIGN CONSTANT         R1C01070
                    Q1    DC      /0        STORE 1ST QUOTIENT          R1C01080
                          BSS  E  0                                     R1C01090
                    BARG  DC      /0        STORE DIVISOR               R1C01100
                          DC      /0                                    R1C01110
                    DMASK DC      /8000     NEGATIVE MASK               R1C01112
                          DC      /0004     AND FORCED DIVIDEND         R1C01113
                    DDMSK DC      /FFFC     MASK /0003                  R1C01114
                          END                                           R1C01124
