                    *************************************************** S2C00010
                    *                                                 * S2C00020
                    *   SUBROUTINE NAME-                              * S2C00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S2C00040
                    *         POINT A**B FUNCTION.                    * S2C00050
                    *      CODE NAME-EAXB/EAXBX                       * S2C00060
                    *   PURPOSE- THIS SUBROUTINE COMPUTES AND EXTENDED* S2C00070
                    *      PRECISION FLOATING-POINT NUMBER TAKEN TO AN* S2C00080
                    *      EXTENDED PRECISION FLOATING-POINT EXPONENT.* S2C00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2C00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2C00120
                    *   SPECIAL FEATURES- N/A                         * S2C00130
                    *   ADDITIONAL INFORMATION-                       * S2C00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2C00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2C00160
                    *                                                 * S2C00170
                    *************************************************** S2C00180
                          HDNG    CALL EAXB  -V1.                       S2C00190
                          EPR                                           S2C00200
                          ENT     EAXB                                  S2C00210
                          ENT     EAXBX                                 S2C00220
                    EAXBX DC      *-*       CALL+1                      S2C00230
                          STX   1 EXIT+1    SAVE XR1                    S2C00240
                          LD   L  EAXBX     CALL+1 INTO ACCUMULATOR     S2C00250
                          MDX     COM                                   S2C00260
                    EAXB  DC      *-*       CALL+1                      S2C00270
                          STX   1 EXIT+1    SAVE XR1                    S2C00280
                          LD   L  EAXB      CALL+1 INTO ACCUMULATOR     S2C00290
                          LDX   1 0         X1=ZERO                     S2C00300
                    COM   STO     *+3                                   S2C00310
                          A       ONE       BUILD EXIT                  S2C00320
                          STO     EXIT+3                                S2C00330
                          MDX  I1 *-*       OPND ADDRESS INTO XR1       S2C00340
                          NOP                                           S2C00350
                          LD    3 126       SIGN OF A INTO ACCUMULATOR  S2C00360
                          BSC  L  TEST,+-   BR TO TEST IF A=0           S2C00370
                          LD    1 1         SIGN OF B INTO ACCUMULATOR  S2C00380
                          BSC  L  SPEC,+-   BR TO SPEC IF A NOT 0, B=0  S2C00390
                    *                                                   S2C00400
                    *IF A NOT ZERO AND B NOT ZERO,CALC A**B             S2C00410
                    *                                                   S2C00420
                          CALL    ELN       NATURAL LOG OF A            S2C00430
                          LIBF    EMPYX     B*LNA                       S2C00440
                          DC      0         EFFECTIVE ADDRESS OF B      S2C00450
                          CALL    EXPN      E**B*LNA=A**B               S2C00460
                    EXIT  LDX  L1 *-*       RESTORE XR1                 S2C00470
                          BSC  L  *-*       EXIT                        S2C00480
                    *                                                   S2C00490
                    *IF A=O,B NOT NEG,SET A**B=O                        S2C00500
                    *                                                   S2C00510
                    TEST  LD    1 1         SIGN OF B INTO ACCUMULATOR  S2C00520
                          BSC  L  FERR,+    BR TO FERR IF B NOT PLUS    S2C00530
                          SLT     32        CLEAR ACC AND EXT           S2C00540
                          STO   3 125       A**B=ZERO                   S2C00550
                          STD   3 126                                   S2C00560
                          MDX     EXIT                                  S2C00570
                    *                                                   S2C00580
                    *IF A NOT ZERO AND B=O,SET A**B=1                   S2C00590
                    *                                                   S2C00600
                    SPEC  LD      FONE      LD FAC WITH EXPONENT OF +1  S2C00610
                          STO   3 125                                   S2C00620
                          LDD     FONE+1    LD FAC WITH MANTISSA OF +1  S2C00630
                          STD   3 126                                   S2C00640
                          MDX     EXIT                                  S2C00650
                    *                                                   S2C00660
                    *IF A=O AND B NOT PTV,SET ERROR INDR                S2C00670
                    *                                                   S2C00680
                    FERR  LD      ERRB      GET BIT 9 WORD              S2C00690
                          OR    3 124       BIT 9 OF (XR3)+124          S2C00700
                          STO   3 124                                   S2C00710
                          MDX     EXIT                                  S2C00720
                    *                                                   S2C00730
                    *CONSTANTS AREA                                     S2C00740
                    *                                                   S2C00750
                    ERRB  DC      /40       BIT 9                       S2C00760
                          BSS  E  0                                     S2C00770
                    ONE   DC      1         SINGLE WORD ONE             S2C00780
                    FONE  XFLC    1.0       EXTENDED PREC FLT PT ONE    S2C00790
                          END                                           S2C00800
