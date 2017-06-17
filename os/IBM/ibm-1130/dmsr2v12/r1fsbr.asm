                    *************************************************** R1H00010
                    *                                                 * R1H00020
                    *   SUBROUTINE NAME-                              * R1H00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1H00040
                    *         POINT SUBTRACT REVERSE NUMBERS.         * R1H00050
                    *      CODE NAME- FSBR/FSBRX                      * R1H00060
                    *   PURPOSE- THIS FUNCTION COMPUTES, IN REVERSE   * R1H00070
                    *      ORDER FROM INPUT, THE DIFFERENCE BETWEEN   * R1H00080
                    *      TWO STANDARD PRECISION FLOATING-POINT      * R1H00090
                    *      NUMBERS.                                   * R1H00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1H00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1H00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1H00130
                    *   SPECIAL FEATURES- N/A                         * R1H00140
                    *   ADDITIONAL INFORMATION-                       * R1H00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1H00160
                    *         SUBROUTINE LIBRARY MANUAL               * R1H00170
                    *                                                 * R1H00180
                    *************************************************** R1H00190
                          HDNG    LIBF FSBR  -V1.                       R1H00200
                          LIBR                                          R1H00210
                          SPR                                           R1H00220
                          ENT     FSBR                                  R1H00230
                          ENT     FSBRX                                 R1H00240
                    FSBRX STX   1 SAVE+1    SAVE XR1                    R1H00250
                          LD   L  *-*       CALL+1                      R1H00260
                          MDX     COM                                   R1H00270
                    FSBR  STX   1 SAVE+1                                R1H00280
                          LD   L  *-*       CALL+1                      R1H00290
                          LDX   1 0         X1= ZERO                    R1H00300
                    COM   STO     *+3       STORE ADDR OF MINUEND       R1H00310
                          A       ONE       INCR ADDR FOR RET           R1H00320
                          STO     EXIT+1    BUILD EXIT                  R1H00330
                          MDX  I1 *-*       INCR (XR1) BY (CALL+1)      R1H00340
                          NOP               IF MDX CAUSES BR,SKIP NOP   R1H00350
                          SLT     32        CLEAR ACCUMULATOR           R1H00360
                          SD    3 126       REVERSE SIGN OF (FAC)       R1H00370
                          STD   3 126                                   R1H00380
                          LIBF    FADDX     REQUIRED SUBTRACTION        R1H00390
                          DC      0         ADDR ADDED TO XR1-GET OPND  R1H00400
                    SAVE  LDX  L1 *-*       RESTORE XR1                 R1H00410
                    EXIT  BSC  L  *-*       RET TO CALL+2               R1H00420
                    ONE   DC      1         SINGLE WORD ONE             R1H00430
                          END                                           R1H00440
