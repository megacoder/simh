                    *************************************************** S1E00010
                    *                                                 * S1E00020
                    *   SUBROUTINE NAME-                              * S1E00030
                    *      FULL NAME- EXTENDED PRECISION GET PARAMETER* S1E00040
                    *         SUBROUTINE.                             * S1E00050
                    *      CODE NAME- EGETP                           * S1E00060
                    *   PURPOSE- THIS SUBROUTINE LOADS THE CONTENTS OF* S1E00070
                    *      THE ARGUMENT FOLLOWING THE CALL INTO FAC,  * S1E00080
                    *      AND SETS UP IN THE SUBROUTINE WHICH CALLED * S1E00090
                    *      EGETP THE RETURN ADDRESS TO THE MAIN PROG. * S1E00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1E00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1E00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1E00130
                    *   SPECIAL FEATURES- N/A                         * S1E00140
                    *   ADDITIONAL INFORMATION-                       * S1E00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1E00160
                    *         SUBROUTINE LIBRARY MANUAL               * S1E00170
                    *                                                 * S1E00180
                    *************************************************** S1E00190
                          HDNG    LIBF EGETP  -V1.                      S1E00200
                          LIBR                                          S1E00210
                          EPR                                           S1E00220
                          ENT     EGETP                                 S1E00230
                    EGETP NOP               RET ADDR LD AT EGETP+1      S1E00240
                          LD   L  *-*       CALL+1                      S1E00250
                          STO     EXIT+1    BUILD EXIT                  S1E00260
                          S       TWO       LOC OF OPND ADDR IN         S1E00270
                          STO     *+1       MAIN PROG                   S1E00280
                    FGT1  LD   I  *-*       FETCH OPND ADDRESS          S1E00290
                          STO     *+1                                   S1E00300
                          LIBF    ELD       FETCH OPND INTO FAC         S1E00310
                          DC      *-*       OPND ADDR                   S1E00320
                          LD   I  FGT1+1    FETCH OPND ADDRESS          S1E00330
                          A       ONE       INCR BY 1                   S1E00340
                          STO  I  EXIT+1    STORE IN LIBF+1             S1E00350
                          MDX  L  EXIT+1,1  INCR EXIT TO LIBF+2         S1E00360
                    EXIT  BSC  L  *-*       BR TO CALL+1                S1E00370
                    *                                                   S1E00380
                    *CONSTANTS AREA                                     S1E00390
                    *                                                   S1E00400
                    ONE   DC      1         SINGLE WORD ONE             S1E00410
                    TWO   DC      2         SINGLE WORD TWO             S1E00420
                          END                                           S1E00430
