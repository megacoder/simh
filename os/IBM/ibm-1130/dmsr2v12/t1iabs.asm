                    *************************************************** T1B00010
                    *                                                 * T1B00020
                    *   SUBROUTINE NAME-                              * T1B00030
                    *      FULL NAME- INTEGER ABSOLUTE VALUE FUNCTION * T1B00040
                    *      CODE NAME- IABS                            * T1B00050
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE ABSOLUTE* T1B00060
                    *      VALUE OF A ONE-WORD INTEGER.               * T1B00070
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* T1B00080
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * T1B00090
                    *      SUBROUTINE LIBRARY MANUAL.                 * T1B00100
                    *   SPECIAL FEATURES- N/A                         * T1B00110
                    *   ADDITIONAL INFORMATION-                       * T1B00120
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * T1B00130
                    *         SUBROUTINE LIBRARY MANUAL               * T1B00140
                    *                                                 * T1B00150
                    *************************************************** T1B00160
                          HDNG    CALL IABS  -V1.                       T1B00170
                          ENT     IABS      STANDARD FORTRAN NAME       T1B00180
                    IABS  DC      0         FORTRAN ENTRY               T1B00190
                          LD      IABS      GET OPERAND ADDRESS         T1B00200
                          STO     *+3       AND ST TO GET OPND          T1B00210
                          A       ONE       BUILD EXIT                  T1B00220
                          STO     IABS                                  T1B00230
                          LD   I  *-*       GET OPND                    T1B00240
                          BSC  I  IABS,-    BR OUT IF NOT NEG           T1B00250
                          EOR     ONES      IF NEG,CHANGE FROM TWOS     T1B00260
                          A       ONE       COMPLEMENT FORM TO REVERSE  T1B00270
                          BSC  I  IABS      THE SIGN AND RETURN.        T1B00280
                    ONE   DC      1         SINGLE WORD ONE             T1B00290
                    ONES  DC      /FFFF     ALL-BIT MASK                T1B00300
                          END                                           T1B00310
