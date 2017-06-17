                    *************************************************** R1D00010
                    *                                                 * R1D00020
                    *   SUBROUTINE NAME-                              * R1D00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1D00040
                    *         POINT DIVIDE REVERSE FUNCTION.          * R1D00050
                    *      CODE NAME- FDVR/FDVRX                      * R1D00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES, IN REVERSE * R1D00070
                    *      ORDER OF INPUT, THE QUOTIENT OF TWO STAND- * R1D00080
                    *      ARD PRECISION FLOATING-POINT NUMBERS       * R1D00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1D00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1D00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1D00120
                    *   SPECIAL FEATURES- N/A                         * R1D00130
                    *   ADDITIONAL INFORMATION-                       * R1D00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1D00150
                    *         SUBROUTINE LIBRARY MANUAL               * R1D00160
                    *                                                 * R1D00170
                    *************************************************** R1D00180
                          HDNG    LIBF FDVR  -V1.                       R1D00190
                          LIBR                                          R1D00200
                          SPR                                           R1D00210
                          ENT     FDVR                                  R1D00220
                          ENT     FDVRX                                 R1D00230
                    TFAC  DEC     0         STORE CONTENTS OF FAC       R1D00240
                    FDVRX STX   1 SAVE+1    SAVE XR1                    R1D00250
                          LD   L  *-*       CALL+1                      R1D00260
                          MDX     COM                                   R1D00270
                    FDVR  STX   1 SAVE+1    SAVE XR1                    R1D00280
                          LD   L  *-*       CALL+1                      R1D00290
                          LDX   1 0         XR1=ZERO                    R1D00300
                    COM   STO     *+3                                   R1D00310
                          A       ONE       BUILD EXIT                  R1D00320
                          STO     EXIT+1                                R1D00330
                          MDX  I1 *-*       MODIFY X1 BY OP ADDRESS     R1D00340
                          NOP               IF MDX CAUSES BR,SKIP NOP   R1D00350
                          LIBF    FSTO      STORE FAC INTO TFAC         R1D00360
                          DC      TFAC      INTO TFAC                   R1D00370
                          LIBF    FLDX      LOAD DIVIDEND INTO FAC      R1D00380
                          DC      0         INTO PSEUDO-ACCUMULATOR     R1D00390
                          LIBF    FDIV      PERFORM REVERSE DIVISION    R1D00400
                          DC      TFAC                                  R1D00410
                    SAVE  LDX  L1 *-*       RESTORE  XR1                R1D00420
                    EXIT  BSC  L  *-*       BR OUT                      R1D00430
                    ONE   DC      1         SINGLE WORD ONE             R1D00440
                          END                                           R1D00450
