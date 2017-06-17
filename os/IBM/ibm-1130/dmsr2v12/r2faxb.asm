                    *************************************************** R2C00010
                    *                                                 * R2C00020
                    *   SUBROUTINE NAME-                              * R2C00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2C00040
                    *         POINT A**B FUNCTION.                    * R2C00050
                    *      CODE NAME- FAXB/FAXBX                      * R2C00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES A STANDARD  * R2C00070
                    *      PRECISION FLOATING POINT NUMBER TAKEN TO A * R2C00080
                    *      STANDARD PRECISION FLOATING POINT EXPONENT.* R2C00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2C00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2C00120
                    *   SPECIAL FEATURES- N/A                         * R2C00130
                    *   ADDITIONAL INFORMATION-                       * R2C00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2C00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2C00160
                    *                                                 * R2C00170
                    *************************************************** R2C00180
                          HDNG    CALL FAXB  -V1.                       R2C00190
                          SPR                                           R2C00200
                          ENT     FAXB                                  R2C00210
                          ENT     FAXBX                                 R2C00220
                    FAXBX DC      *-*       CALL+1                      R2C00230
                          STX   1 EXIT+1    SAVE XR1                    R2C00240
                          LD   L  FAXBX     CALL+1 TO ACCUMULATOR       R2C00250
                          MDX     COM                                   R2C00260
                    FAXB  DC      *-*       CALL+1                      R2C00270
                          STX   1 EXIT+1    SAVE XR1                    R2C00280
                          LD   L  FAXB      CALL+1 TO ACCUMULATOR       R2C00290
                          LDX   1 0         XR1=ZERO                    R2C00300
                    COM   STO     *+3                                   R2C00310
                          A       ONE       BUILD EXIT                  R2C00320
                          STO     EXIT+3                                R2C00330
                          MDX  I1 *-*       OPND ADDRESS INTO XR1       R2C00340
                          NOP               IF MDX CAUSES BR,SKIP NOP   R2C00350
                          LD    3 126       SIGN OF A TO ACCUMULATOR    R2C00360
                          BSC  L  TEST,+-   BR TO TEST IF A=0           R2C00370
                          LD    1 0         SIGN OF B TO ACCUMULATOR    R2C00380
                          BSC  L  SPEC,+-   BR TO SPEC IF A NOT 0, B=0  R2C00390
                    *                                                   R2C00400
                    *IF A NOT ZERO AND B NOT ZERO,CALC A**B             R2C00410
                    *                                                   R2C00420
                          CALL    FLN       NATURAL LOG OF A            R2C00430
                          LIBF    FMPYX     B*LNA                       R2C00440
                          DC      0         EFFECTIVE ADDRESS OF B      R2C00450
                          CALL    FXPN      E**B*LNA=A**B               R2C00460
                    EXIT  LDX  L1 *-*       RESTORE XR1                 R2C00470
                          BSC  L  *-*       EXIT                        R2C00480
                    *                                                   R2C00490
                    *IF A=O,B NOT NEG,SET A**B=O                        R2C00500
                    *                                                   R2C00510
                    TEST  LD    1 0         SIGN OF B TO ACCUMULATOR    R2C00520
                          BSC  L  FERR,+    BR TO FERR IF B NOT PLUS    R2C00530
                          SLT     32        CLEAR ACC AND EXT           R2C00540
                          STO   3 125       A**B=ZERO                   R2C00550
                          STD   3 126                                   R2C00560
                          MDX     EXIT                                  R2C00570
                    *                                                   R2C00580
                    *IF A NOT ZERO AND B=O,SET A**B=+1                  R2C00590
                    *                                                   R2C00600
                    SPEC  LD      FONE+1    LD FAC WITH EXPONENT OF +1  R2C00610
                          STO   3 125                                   R2C00620
                          SLT     16        CLEAR EXTENSION             R2C00630
                          LD      FONE                                  R2C00640
                          STD   3 126       LD +1 INTO MANTISSA OF FAC  R2C00650
                          MDX     EXIT                                  R2C00660
                    *                                                   R2C00670
                    *IF A=0 AND B NOT PTV,SET ERROR INDR                R2C00680
                    *                                                   R2C00690
                    FERR  LD      ERRB      SET ERROR INDICATOR ON      R2C00700
                          OR    3 124       BIT 9 OF (XR3)+124          R2C00710
                          STO   3 124                                   R2C00720
                          MDX     EXIT                                  R2C00730
                    *                                                   R2C00740
                    *CONSTANTS AREA                                     R2C00750
                    *                                                   R2C00760
                    ERRB  DC      /40       BIT 9                       R2C00770
                    ONE   DC      1         SINGLE WORD ONE             R2C00780
                    FONE  DEC     1.0       FLT PT ONE                  R2C00790
                          END                                           R2C00800
