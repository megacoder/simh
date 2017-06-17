                    *************************************************** R2B00010
                    *                                                 * R2B00020
                    * VERSION 2 MODIFICATION LEVEL 10                 * R2B00025
                    *   SUBROUTINE NAME-                              * R2B00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2B00040
                    *         POINT ARCTANGENT FUNCTION.              * R2B00050
                    *      CODE NAME- FATN/FATAN                      * R2B00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE ARCTAN- * R2B00070
                    *      GENT OF A STANDARD PRECISION FLOATING-POINT* R2B00080
                    *      NUMBER.                                    * R2B00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2B00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2B00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2B00120
                    *   SPECIAL FEATURES- N/A                         * R2B00130
                    *   ADDITIONAL INFORMATION-                       * R2B00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2B00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2B00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* R2B00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* R2B00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * R2B00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* R2B00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * R2B00210
                    *         INPUT ARGUMENT.                         * R2B00220
                    *                                                 * R2B00230
                    *************************************************** R2B00240
                          HDNG    CALL FATN  -V1.                       R2B00250
                          SPR                                           R2B00260
                          ENT     FATN                                  R2B00270
                          ENT     FATAN     STANDARD FORTRAN NAME       R2B00280
                    FATAN DC      0         FORTRAN ENTRY               R2B00290
                          LIBF    FGETP     GET PARAMETER               R2B00300
                    FATN  DC      0         USER ENTRY                  R2B00310
                          LD    3 126                                   R2B00320
                          STO     SIGN      SAVE SIGN OF ARGUMENT       R2B00330
                          SLT     32        CLEAR ACC AND EXT           R2B00340
                          SD    3 126       NEGATE ARGUMENT             R2B00350
                          BSC     +Z        AND CHK IF PTV              R2B00360
                          LDD   3 126       IF NOT LD ARGUMENT          R2B00370
                          STD     XABS      STORE ABSOLUTE VALUE        R2B00380
                          STD   3 126                                   R2B00390
                          RTE     16        SIGNIFICANT PART TO EXT     R2B00400
                          LD    3 125       SAVE EXPONENT IN T2         R2B00410
                          STO     T2                                    R2B00420
                          STX   1 SAVE+1    SAVE XR1                    R2B00430
                    *                                                   R2B00440
                    *FIND THE RANGE OF THE ARGUMENT                     R2B00450
                    *                                                   R2B00460
                          LDX   1 18        SET TABLE REFERENCE INDR    R2B00470
                    ETN1  SD   L1 KTAB-6    IS IT IN THIS RANGE         R2B00480
                          BSC  L  KEQX1,-   IF LARGER,BR TO GET INPUT   R2B00490
                    *                       POLYNOMIAL. K IN XR1        R2B00500
                          AD   L1 KTAB-6    OTHERWISE RESTORE VALUE     R2B00510
                          MDX   1 -6        AND TRY NEXT RANGE          R2B00520
                          MDX     ETN1                                  R2B00530
                    *                                                   R2B00540
                    *IS EXPONENT INSIDE RANGE OF POLYNOMIAL             R2B00550
                    *                                                   R2B00560
                    POLY  LD      PC1       GET EXPONENT SHIFT CONSTANT R2B00570
                          S     3 125       LET C=THE EXPONENT OF THE   R2B00580
                    *                       ARGUMENT.  ACC = 2+/1880.   R2B00590
                          STO     SRTN      KEEP EXPONENT SHIFT         R2B00600
                          S       PC2       =15+/1880           -C-17   R2B00610
                          BSC  L  *+1,+     BR IF IN RANGE              R2B00620
                          MDX     POLY1     AS POLYNOMIAL OUTPUT        R2B00640
                          LDD   3 126       IN RANGE,GET ARGUMENT.B0+C  R2B00650
                          STD     XABS      SAVE ARGUMENT        .B0+C  R2B00660
                          BSC     +Z        BR IF NON-NEG               R2B00670
                          SD      XONE      OTHERWISE,SUB ONE           R2B00680
                    SRTN  SRT     *-*       ALLOW FOR EXPONENT SHIFT    R2B00690
                          BSC     +Z        BR IF NON-NEG         .B-2  R2B00700
                          AD      XONE      OTHERWISE,RESTORE ONE       R2B00710
                          STD   3 126       PUT BACK IN FAC       .B-2  R2B00720
                    *                                                   R2B00730
                    *CALCULATE THE POLYNOMIAL APPROXIMATION             R2B00740
                    *                                                   R2B00750
                          LIBF    XMDS      GET Z**2              .B-4  R2B00760
                          STD   3 126       AND SAVE IN FAC       .B-4  R2B00770
                          LDD     A3        MPY BY A3             .B13  R2B00780
                          LIBF    XMDS      B9                          R2B00790
                          AD      A2        ADD A2                .B9   R2B00800
                          LIBF    XMDS      MPY BY Z**2           .B5   R2B00810
                          AD      A1        ADD A1                .B5   R2B00820
                          LIBF    XMDS      MPY BY Z**2           .B1   R2B00830
                          A       A0        ADD LAST TERM         .B1   R2B00840
                          RTE     16                                    R2B00850
                          SRA     8         STRIP OFF OLD EXPONENT      R2B00860
                          SLA     8                                     R2B00870
                          OR      X1        PUT IN EXPONENT OF ONE      R2B00880
                          RTE     16        RESTORE ORDER               R2B00890
                          STD     ARG       AND SAVE RESULT IN ARG      R2B00900
                          LDD     XABS      GET ABS VALUE OF Z          R2B00910
                          STD   3 126                                   R2B00920
                          LIBF    FMPY      MPY POLYNOMIAL BY Z         R2B00930
                          DC      ARG                                   R2B00940
                    POLY1 LIBF    NORM      TO NORMALIZING SUBR         R2B00950
                          MDX   1 0         GO GET ABS VALUE IF XR1=0   R2B00960
                          MDX     AK        OTHERWISE,GO GET OFFSET     R2B00970
                    SGN   LD      SIGN      GET SIGN OF ARGUMENT        R2B00980
                          BSC  L  SAVE,-    BR TO EXIT IF PTV           R2B00990
                          SLT     32        CLEAR ACC AND EXT           R2B01000
                          SD    3 126       NEGATE ARCTANGENT           R2B01010
                          STD   3 126       STORE ABSOLUTE VALUE RSLT   R2B01020
                    SAVE  LDX  L1 *-*       RESTORE XR1                 R2B01030
                          BSC  I  FATN      RETURN TO MAIN PROGRAM      R2B01040
                    AK    LIBF    FADDX     ADD PROPER OFFSET           R2B01050
                          DC      KTAB-4    ACCORDING TO VALUE IN XR1   R2B01060
                          MDX     SGN       GO BACK TO SET SIGN         R2B01070
                    *                                                   R2B01080
                    *CALCULATE INPUT TO POLYNOMIAL                      R2B01090
                    *                                                   R2B01100
                    KEQX1 LDD     XABS      PUT ABS VALUE OF ARGUMENT   R2B01110
                          STD   3 126       IN FAC                      R2B01120
                          LIBF    FMPYX     MPY ABS VALUE TIME KTAB-2   R2B01130
                          DC      KTAB-2                                R2B01140
                          LIBF    FADD      ADD ONE AND SAVE IN T1      R2B01150
                          DC      ONE                                   R2B01160
                          LIBF    FSTO                                  R2B01170
                          DC      T1                                    R2B01180
                          LD      T2        GET Z EXPONENT AND Z AND    R2B01190
                          STO   3 125       PUT IN FAC                  R2B01200
                          LDD     XABS      GET ABS VALUE OF MANTISSA   R2B01210
                          STD   3 126                                   R2B01220
                          LIBF    FSUBX     SUB OFFSET FACTOR           R2B01230
                          DC      KTAB-2                                R2B01240
                          LIBF    FDIV      AND DIVIDE BY PREVIOUS NO.  R2B01250
                          DC      T1                                    R2B01260
                          MDX     POLY                                  R2B01270
                    *                                                   R2B01280
                    *CONSTANTS AREA                                     R2B01290
                    *                                                   R2B01300
                    T2    DC      0         ST EXPONENT                 R2B01310
                    PC1   DC      128-2+/1880   SHIFT CONSTANTS FOR     R2B01320
                    PC2   DC      15+/1880     EXPONENT ALLOWANCE       R2B01330
                    X1    DC      /81          EXPONENT OF ONE          R2B01340
                    SIGN  DC      0            SAVE SIGN                R2B01350
                    XONE  DEC     1            DOUBLE WORD ONE          R2B01360
                    ONE   DEC     1.0          FLT PT ONE               R2B01370
                    XABS  DEC     0            SAVE ABS VALUE           R2B01380
                    ARG   DEC     0            SAVE ARGUMENT            R2B01390
                    A0    DEC     1.0B1            CONSTANTS            R2B01400
                    A1    DEC     -0.333329573B5   FOR                  R2B01410
                    A2    DEC     +0.199641035B9   POLYNOMIAL           R2B01420
                    A3    DEC     -0.131779888B13                       R2B01430
                          BSS  E  0                                     R2B01440
                    KTAB  XFLC    2.282434743901500E-01 L1=TAN(PI/14)   R2B01450
                          ORG     *-1                                   R2B01460
                          DEC     4.487989506128276E-01 A1=PI/7         R2B01470
                          DEC     4.815746188075286E-01 B1=TAN(PI/7)    R2B01480
                          XFLC    7.974733888824038E-01 L2=TAN(3PI/14)  R2B01490
                          ORG     *-1                                   R2B01500
                          DEC     8.975979011256552E-01 A2=2PI/7        R2B01510
                          DEC     1.253960337662704E0   B2=TAN(2PI/7)   R2B01520
                          XFLC    2.076521396572337E0   L3=TAN(5PI/14)  R2B01530
                          ORG     *-1                                   R2B01540
                          DEC     1.346396851538483E0   A3=3PI/7        R2B01550
                          DEC     4.381286267534823E0   B3=TAN(3PI/7)   R2B01560
                    T1    EQU     ARG                                   R2B01570
                          END                                           R2B01580
