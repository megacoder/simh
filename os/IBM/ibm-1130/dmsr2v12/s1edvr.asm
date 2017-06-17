                    *************************************************** S1D00010
                    *                                                 * S1D00020
                    *   SUBROUTINE NAME-                              * S1D00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1D00040
                    *         POINT DIVIDE REVERSE FUNCTION.          * S1D00050
                    *         DIVIDE REVERSE FUNCTION.                * S1D00060
                    *      CODE NAME- EDVR/EDVRX                      * S1D00070
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE QUOTIENT* S1D00080
                    *      OF TWO EXTENDED PRECISION FLOATING-POINT   * S1D00090
                    *      NUMBERS,REVERSING THE NORMAL ORDER OF      * S1D00100
                    *      DIVISION.                                  * S1D00110
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1D00120
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1D00130
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1D00140
                    *   SPECIAL FEATURES- N/A                         * S1D00150
                    *   ADDITIONAL INFORMATION-                       * S1D00160
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1D00170
                    *         SUBROUTINE LIBRARY MANUAL               * S1D00180
                    *                                                 * S1D00190
                    *************************************************** S1D00200
                          HDNG    LIBF EDVR  -V1.                       S1D00210
                          LIBR                                          S1D00220
                          EPR                                           S1D00230
                          ENT     EDVR                                  S1D00240
                          ENT     EDVRX                                 S1D00250
                          BSS  E  0                                     S1D00260
                    ONE   DC      1         SINGLE WORD ONE             S1D00270
                          DC      0         STORE EXPONENT OF TFAC      S1D00280
                    TFAC  DEC     0         FLT PT ZERO                 S1D00290
                    EDVRX STX   1 SAVE+1    SAVE XR1                    S1D00300
                          LD   L  *-*       CALL+1                      S1D00310
                          MDX     COM                                   S1D00320
                    EDVR  STX   1 SAVE+1    SAVE XR1                    S1D00330
                          LD   L  *-*       CALL+1                      S1D00340
                          LDX   1 0         SUPPRESS INDEXING           S1D00350
                    COM   STO     *+3       STORE LOC OF OPND ADDR      S1D00360
                          A       ONE       BUILD EXIT                  S1D00370
                          STO     EXIT+1                                S1D00380
                          MDX  I1 *-*       MODIFY XR1 BY OPND ADDR     S1D00390
                          NOP               IF MAX CAUSES BR,SKIP NOP   S1D00400
                          LIBF    ESTO      STORE PSEUDO-ACCUMULATOR    S1D00410
                          DC      TFAC-1    INTO TFAC                   S1D00420
                          LIBF    ELDX      LOAD DIVIDEND               S1D00430
                          DC      0         INTO PSEUDO-ACCUMULATOR     S1D00440
                          LIBF    EDIV      PERFORM DIVISION            S1D00450
                          DC      TFAC-1                                S1D00460
                    SAVE  LDX  L1 *-*       RESTORE XR1                 S1D00470
                    EXIT  BSC  L  *-*       BR TO CALL+1                S1D00480
                          END                                           S1D00490
