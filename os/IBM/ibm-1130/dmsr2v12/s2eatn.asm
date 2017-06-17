                    *************************************************** S2B00010
                    *                                                 * S2B00020
                    * VERSION 2 MODIFICATION LEVEL 10                 * S2B00025
                    *   SUBROUTINE NAME-                              * S2B00030
                    *      FULL NAME-EXTENDED PRECISION FLOATING-POINT* S2B00040
                    *         ARCTANGENT FUNCTION.                    * S2B00050
                    *      CODE NAME-EATN/EATAN.                      * S2B00060
                    *   PURPOSE-THIS SUBPROGRAM COMPUTES THE ARCTAN-  * S2B00070
                    *      GENT OF AN EXTENDED PRECISION FLOATING-    * S2B00080
                    *      POINT NUMBER.  INPUT IS IN RADIANS.        * S2B00090
                    *   METHOD- SEE IBM 1130 SUBROUTINE LIBRARY MANUAL* S2B00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2B00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2B00120
                    *   SPECIAL FEATURES-N/A                          * S2B00130
                    *   ADDITIONAL INFORMATION-                       * S2B00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2B00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2B00160
                    *                                                 * S2B00170
                    *************************************************** S2B00180
                          HDNG    CALL EATN  -V1.                       S2B00190
                          EPR                                           S2B00200
                          ENT     EATN                                  S2B00210
                          ENT     EATAN     STANDARD FORTRAN NAME       S2B00220
                    EATAN DC      0         FORTRAN ENTRY               S2B00230
                          LIBF    EGETP     GET PARAMETER               S2B00240
                    EATN  DC      0         USER ENTRY                  S2B00250
                          LD    3 126                                   S2B00260
                          STO     SIGN      SAVE SIGN OF ARGUMENT       S2B00270
                          SLT     32                                    S2B00280
                          SD    3 126       CHANGE SIGN OF ARGUMENT     S2B00290
                          BSC     +Z        IS IT POSITIVE              S2B00300
                          LDD   3 126       NO,GET ORIGINAL ARGUMENT    S2B00310
                          STD     XABS                                  S2B00320
                          STD   3 126       PUT ABSOLUTE VALUE IN FAC   S2B00330
                          RTE     16        SIGNIFICANT PART IN EXT     S2B00340
                          LD    3 125       PUT EXPONENT IN ACC         S2B00350
                          STO     T2        STORE EXPONENT              S2B00360
                          STX   1 SAVE+1    SAVE INDEX REGISTER 1       S2B00370
                    *                                                   S2B00380
                    *FIND THE RANGE OF THE ARGUMENT                     S2B00390
                    *                                                   S2B00400
                          LDX   1 24        LD FOR REF TO CON TBL       S2B00410
                    ETN1  SD   L1 KTAB-8    IS IT IN THIS RANGE         S2B00420
                          BSC  L  KEQX1,-   IF LARGER,GO TO KEQX1 TO    S2B00430
                    *                       GET INPUT TO POLYNOMIAL     S2B00440
                          AD   L1 KTAB-8    OTHERWISE RESTORE VALUE     S2B00450
                          MDX   1 -8        AND TRY NEXT RANGE          S2B00460
                          MDX     ETN1                                  S2B00470
                    *                                                   S2B00480
                    *IS EXPONENT INSIDE RANGE OF THE POLYNOMIAL         S2B00490
                    *                                                   S2B00500
                    POLY  LD      PC1                                   S2B00510
                          S     3 125       LET C=THE EXPONENT OF THE   S2B00520
                    *                       ARGUMENT.ACC=-C-2+/1880     S2B00530
                          STO     SRTN      KEEP EXPONENT SHIFT         S2B00540
                          S       PC2       =15+/1880  ACC=-C-17        S2B00550
                          BSC  L  *+2,+     BR IF IN RANGE         2-11 S2B00560
                          LDD     ONE+1     OUT OF RANGE,GET ONE   2-11 S2B00570
                          MDX     POLY1     AS POLYNOMIAL OUTPUT        S2B00580
                          LDD   3 126       IN RANGE,GET ARGUMENT.B0+C  S2B00590
                          STD     XABS      SAVE ARGUMENT        .B0+C  S2B00600
                          BSC     +Z        BRANCH IF NON-NEG           S2B00610
                          SD      XONE      OTHERWISE SUBTRACT ONE      S2B00620
                    SRTN  SRT     *-*       ALLOW FOR EXPONENT SHIFT    S2B00630
                          BSC     +Z        BRANCH IF NON-NEG    .B-2   S2B00640
                          AD      XONE      OTHERWISE RESTORE ONE       S2B00650
                          STD   3 126       PUT BACK IN FLT ACC  .B-2   S2B00660
                    *                                                   S2B00670
                    *CALCULATE THE POLYNOMIAL APPROXIMATION             S2B00680
                    *                                                   S2B00690
                          LIBF    XMD       GET Z**2            .B-4    S2B00700
                          STD   3 126       PUT IN FAC           .B-4   S2B00710
                          LDD     A4        MPY BY A4                   S2B00720
                          LIBF    XMD                            .B-7   S2B00730
                          SRT     5         SHIFT TO SUB A3      .B-2   S2B00740
                          SD      A3                             .B-2   S2B00750
                          LIBF    XMD       MPY BY Z**2          .B-6   S2B00760
                          AD      S4                                    S2B00770
                          SRT     4         SHIFT TO ADD A2      .B-2   S2B00780
                          AD      A2                              .B-2  S2B00790
                          LIBF    XMD       MPY BY Z**2           .B-6  S2B00800
                          SRT     5         SHIFT TO SUB A1       .B-1  S2B00810
                          SD      A1                              .B-1  S2B00820
                          LIBF    XMD       MPY BY Z**2           .B-5  S2B00830
                          AD      S6                                    S2B00840
                          SRT     6         SHIFT TO ADD ONE      .B+1  S2B00850
                          AD      ONE+1     ADD ONE               .B+1  S2B00860
                          STD     ARG       SAVE POLYNOMIAL RSLT        S2B00870
                          LD      X1        129                         S2B00880
                          STO     ARG-1     SET EXPONENT                S2B00890
                          LDD     XABS      PUT ABS VALUE OF ARGUMENT   S2B00900
                          STD   3 126       BACK IN FAC                 S2B00910
                          LIBF    EMPY      MPY Z*(POLYNOMIAL RSLT)     S2B00920
                          DC      ARG-1                                 S2B00930
                    POLY1 LIBF    NORM      NORMALIZE                   S2B00940
                          MDX   1 0         GO GET ABS VALUE IF XR1=0   S2B00950
                          MDX     AK        OTHERWISE,ADD OFFSET NO.    S2B00960
                    SGN   LD      SIGN      GET SIGN OF ARGUMENT        S2B00970
                          BSC  L  SAVE,-    BR TO EXIT IF PTV           S2B00980
                          SLT     32        CLEAR ACC AND EXT           S2B00990
                          SD    3 126       NEGATE ARCTANGENT           S2B01000
                          STD   3 126                                   S2B01010
                    SAVE  LDX  L1 *-*                                   S2B01020
                          BSC  I  EATN      RET TO MAIN PROG            S2B01030
                    AK    LIBF    EADDX     IF K NOT ZERO,ADD APPRO-    S2B01040
                          DC      KTAB-6    PRIATE OFFSET TO RSLT       S2B01050
                          MDX     SGN       RET TO SET SIGN             S2B01060
                    *                                                   S2B01070
                    *CALCULATE INPUT TO POLYNOMIAL                      S2B01080
                    *                                                   S2B01090
                    KEQX1 LDD     XABS      PUT ABS VALUE OF ARGUMENT   S2B01100
                          STD   3 126       IN FAC                      S2B01110
                          LIBF    EMPYX                                 S2B01120
                          DC      KTAB-3    MPY ABS VALUE TIMES KTAB-3  S2B01130
                          LIBF    EADD                                  S2B01140
                          DC      ONE       ADD EXTENDED PRECISION 1    S2B01150
                          LD    3 125       GET EXPONENT                S2B01160
                          STO     T1-1      AND STORE IN ARG-1          S2B01170
                          LDD   3 126       GET ARGUMENT AND            S2B01180
                          STD     T1        STORE IN ARG                S2B01190
                          LD      T2        GET ORIGINAL EXPONENT       S2B01200
                          STO   3 125       AND PUT IN FAC              S2B01210
                          LDD     XABS      GET ABS VALUE MANTISSA      S2B01220
                          STD   3 126       AND PUT IN FAC              S2B01230
                          LIBF    ESUBX     SUBTRACT KTAB-3 FROM XABS   S2B01240
                          DC      KTAB-3                                S2B01250
                          LIBF    EDIV      DIVIDE BY ORIGINAL          S2B01260
                          DC      T1-1      EXPONENT                    S2B01270
                          MDX     POLY      RETURN TO POLY              S2B01280
                    T2    DC      0         USED TO ST EXPONENT         S2B01290
                    PC1   DC      128-2+/1880   CONSTANTS TO            S2B01300
                    PC2   DC      15+/1880             SCALE ARGUMENT   S2B01310
                    X1    DC      /81       EXPONENT OF ONE             S2B01320
                    ONE   XFLC    1.0       EXTENDED PREC FLT PT ONE    S2B01330
                    S4    DEC     15        CORRECTIONS FOR NEG SHIFT   S2B01340
                    S6    DEC     63                                    S2B01350
                    XONE  DEC     1         EXTENDED PREC ONE           S2B01360
                    XABS  DEC     0         STORE ABS VALUE             S2B01370
                    SIGN  BSS     1         KEEP SGN OF ARGUMENT        S2B01380
                          BSS     1         ST EXPONENT OF ARG          S2B01390
                    ARG   DEC     0         ST RSLT                     S2B01400
                    A1    DEC     0.33333327142E0B-1  CONSTANTS         S2B01410
                    A2    DEC     0.19999056792E0B-2  FOR               S2B01420
                    A3    DEC     0.14235177463E0B-2  POLYNOMIAL        S2B01430
                    A4    DEC     0.09992331248E0B-3                    S2B01440
                          BSS  E  0                                     S2B01450
                    KTAB  XFLC    2.282434743901500E-01 L1=TAN(PI/14)   S2B01460
                          ORG     *-1                                   S2B01470
                          XFLC    4.487989506128276E-01 A1=PI/7         S2B01480
                          XFLC    4.815746188075286E-01 B1=TAN(PI/7)    S2B01490
                          XFLC    7.974733888824038E-01 L2=TAN(3PI/14)  S2B01500
                          ORG     *-1                                   S2B01510
                          XFLC    8.975979011256552E-01 A2=2PI/7        S2B01520
                          XFLC    1.253960337662704E0   B2=TAN(2PI/7)   S2B01530
                          XFLC    2.076521396572337E0   L3=TAN(5PI/14)  S2B01540
                          ORG     *-1                                   S2B01550
                          XFLC    1.346396851538483E0   A3=3PI/7        S2B01560
                          XFLC    4.381286267534823E0   B3=TAN(3PI/7)   S2B01570
                    T1    EQU     ARG                                   S2B01580
                          END                                           S2B01590
