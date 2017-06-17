                    *************************************************** R1E00010
                    *                                                 * R1E00020
                    *   SUBROUTINE NAME-                              * R1E00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1E00040
                    *         POINT GET PARAMETER SUBROUTINE.         * R1E00050
                    *      CODE NAME- FGETP                           * R1E00060
                    *   PURPOSE- THIS SUBROUTINE LOADS A STANDARD     * R1E00070
                    *      PRECISION FLOATING POINT ARGUMENT INTO FAC,* R1E00080
                    *      AND SETS UP IN THE SUBROUTINE WHICH CALLED * R1E00090
                    *      FGETP THE RETURN ADDRESS TO THE MAIN PROG. * R1E00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1E00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1E00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1E00130
                    *   SPECIAL FEATURES- N/A                         * R1E00140
                    *   ADDITIONAL INFORMATION-                       * R1E00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1E00160
                    *         SUBROUTINE LIBRARY MANUAL               * R1E00170
                    *                                                 * R1E00180
                    *************************************************** R1E00190
                          HDNG    LIBF FGETP  -V1.                      R1E00200
                          LIBR                                          R1E00210
                          SPR                                           R1E00220
                          ENT     FGETP                                 R1E00230
                    FGETP NOP               RET ADDR LD AT FGETP+1      R1E00240
                          LD   L  *-*       (FGET CALL ADDR)+1          R1E00250
                          STO     EXIT+1    BUILD EXIT                  R1E00260
                          S       TWO       LOC OF OPERAND ADDR IN      R1E00270
                          STO     *+1       MAIN PROG                   R1E00280
                    FGT1  LD   I  *-*       LD OPERAND ADDR             R1E00290
                          STO     *+1                                   R1E00300
                          LIBF    FLD       LD OPERAND INTO FAC         R1E00310
                          DC      *-*       OPERAND ADDRESS             R1E00320
                          LD   I  FGT1+1    LD OPERAND ADDR             R1E00330
                          A       ONE       INCR BY 1                   R1E00340
                          STO  I  EXIT+1    STORE IN LIBF+1             R1E00350
                          MDX  L  EXIT+1,1  INCR EXIT TO LIBF+2         R1E00360
                    EXIT  BSC  L  *-*       BR TO CALL+1                R1E00370
                    *                                                   R1E00380
                    *CONSTANTS AREA                                     R1E00390
                    *                                                   R1E00400
                    ONE   DC      1         SINGLE WORD ONE             R1E00410
                    TWO   DC      2         SINGLE WORD TWO             R1E00420
                          END                                           R1E00430
