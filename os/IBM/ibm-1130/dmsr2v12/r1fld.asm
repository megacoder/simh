                    *************************************************** R1F00010
                    *                                                 * R1F00020
                    *   SUBROUTINE NAME-                              * R1F00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1F00040
                    *         POINT LOAD-STORE SUBROUTINE.            * R1F00050
                    *      CODE NAME- FLD/FLDX/FSTO/FSTOX             * R1F00060
                    *   PURPOSE- THIS SUBROUTINE LOADS A SPECIFIED    * R1F00070
                    *      STANDARD PRECISION FLOATING-POINT NUMBER   * R1F00080
                    *      INTO FAC, OR STORES THE CONTENTS OF FAC IN * R1F00090
                    *      A SPECIFIED LOCATION.                      * R1F00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1F00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1F00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1F00130
                    *   SPECIAL FEATURES- N/A                         * R1F00140
                    *   ADDITIONAL INFORMATION-                       * R1F00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1F00160
                    *         SUBROUTINE LIBRARY MANUAL               * R1F00170
                    *                                                 * R1F00180
                    *************************************************** R1F00190
                          HDNG    LIBF FLD  -V1.                        R1F00200
                          LIBR                                          R1F00210
                          SPR                                           R1F00220
                          ENT     FLD                                   R1F00230
                          ENT     FLDX                                  R1F00240
                          ENT     FSTO                                  R1F00250
                          ENT     FSTOX                                 R1F00260
                    *                                                   R1F00270
                    *SUBROUTINES TO STORE (FAC) IN ARG                  R1F00280
                    *                                                   R1F00290
                    FSTOX STX   1 SAVE+1    SAVE XR1                    R1F00300
                          LD   L  *-*       CALL+1                      R1F00310
                          MDX     COM                                   R1F00320
                    FSTO  STX   1 SAVE+1    SAVE XR1                    R1F00330
                          LD   L  *-*       CALL+1                      R1F00340
                          LDX   1 0         X1= ZERO                    R1F00350
                    COM   STO     *+3       SAVE OPND ADDR              R1F00360
                          A       ONE       BUILD EXIT                  R1F00370
                          STO     EXIT+1                                R1F00380
                          MDX  I1 *-*       MODIFY X1 BY OP ADDRESS     R1F00390
                          NOP               IF MDX CAUSES BR,SKIP NOP   R1F00400
                          LDD   3 126       GET MANTISSA                R1F00410
                          BSC     +Z        ADD 000000FF TO NEGATIVE    R1F00420
                          AD      ALLX      MANTISSA SO TRUNCATION OF   R1F00430
                          RTE     16        + AND - NO.S IS IDENTICAL.  R1F00440
                          AND     MASK      MASK OUT EXPONENT FIELD     R1F00450
                          OR    3 125       PUT IN EXPONENT             R1F00460
                          RTE     16        RESTORE PROPER ORDER        R1F00470
                          STD   1 0         STORE IN OPND               R1F00480
                          MDX     SAVE                                  R1F00490
                    ALLX  DEC     255       ADD CON FOR NEG NO.S        R1F00500
                    MASK  DC      /FF00     MASK OUT EXPONENT FIELD     R1F00510
                    ONE   DC      /1        SINGLE WORD ONE             R1F00520
                    *                                                   R1F00530
                    *SUBROUTINES TO LOAD (ARG) INTO FAC                 R1F00540
                    *                                                   R1F00550
                    FLDX  STX   1 SAVE+1    SAVE XR1                    R1F00560
                          LD   L  *-*       CALL+1                      R1F00570
                          MDX     COMM                                  R1F00580
                    FLD   STX   1 SAVE+1    SAVE XR1                    R1F00590
                          LD   L  *-*       CALL+1                      R1F00600
                          LDX   1 0         X1= ZERO                    R1F00610
                    COMM  STO     *+3                                   R1F00620
                          A       ONE       BUILD EXIT                  R1F00630
                          STO     EXIT+1                                R1F00640
                          MDX  I1 *-*       MODIFY X1 BY OP ADDRESS     R1F00650
                          NOP                                           R1F00660
                          STS     STAT      SAVE STATUS                 R1F00670
                          LDD   1 0         LOAD OPERAND                R1F00680
                          STD   3 126       STORE OPERAND IN FAC        R1F00690
                          STS   3 127       STRIP OFF EXPONENT          R1F00700
                          RTE     16                                    R1F00710
                          EOR   3 127       EXPONENT ONLY IN ACC        R1F00720
                          STO   3 125       STORE EXPONENT IN FAC       R1F00730
                    STAT  LDS     *-*       STORE STATUS                R1F00740
                    SAVE  LDX  L1 *-*       STORE XR1                   R1F00750
                    EXIT  BSC  L  *-*       RET TO CALL+2               R1F00760
                          END                                           R1F00770
