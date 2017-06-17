                    *************************************************** S1H00010
                    *                                                 * S1H00020
                    *   SUBROUTINE NAME-                              * S1H00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1H00040
                    *         POINT SUBTRACT REVERSE SUBPROGRAM.      * S1H00050
                    *      CODE NAME- ESBR/ESBRX                      * S1H00060
                    *   PURPOSE- THIS SUBPROGRAM SUBTRACTS ONE EXTEND-* S1H00070
                    *      ED PRECISION FLOATING-POINT NUMBER FROM    * S1H00080
                    *      ANOTHER IN REVERSE ORDER.                  * S1H00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1H00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1H00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1H00120
                    *   SPECIAL FEATURES- N/A                         * S1H00130
                    *   ADDITIONAL INFORMATION-                       * S1H00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1H00150
                    *         SUBROUTINE LIBRARY MANUAL               * S1H00160
                    *                                                 * S1H00170
                    *************************************************** S1H00180
                          HDNG    LIBF ESBR  -V1.                       S1H00190
                          LIBR                                          S1H00200
                          EPR                                           S1H00210
                          ENT     ESBR                                  S1H00220
                          ENT     ESBRX                                 S1H00230
                    ESBRX STX   1 SAVE+1    SAVE XR1                    S1H00240
                          LD   L  *-*       CALL+1                      S1H00250
                          MDX     COM                                   S1H00260
                    ESBR  STX   1 SAVE+1    SAVE XR1                    S1H00270
                          LD   L  *-*       CALL+1                      S1H00280
                          LDX   1 0         NON-INDEXED                 S1H00290
                    COM   STO     *+3       STORE ADDR OF MINUEND       S1H00300
                          A       ONE       INCR ADDR FOR RET           S1H00310
                          STO     EXIT+1    BUILD EXIT                  S1H00320
                          MDX  I1 *-*       INCR (XR1) BY (CALL+1)      S1H00330
                          NOP               IF MDX CAUSES BR,SKIP NOP   S1H00340
                          SLT     32        CLEAR ACC AND EXT           S1H00350
                          SD    3 126       REVERSE SIGN OF (FAC)       S1H00360
                          STD   3 126                                   S1H00370
                          LIBF    EADDX     REQUIRED SUBTRACTION        S1H00380
                          DC      0         ADDR ADDED TO XR1-GET OPND  S1H00390
                    SAVE  LDX  L1 *-*       RESTORE XR1                 S1H00400
                    EXIT  BSC  L  *-*       RET TO CALL+2               S1H00410
                    ONE   DC      1         SINGLE WORD ONE             S1H00420
                          END                                           S1H00430
