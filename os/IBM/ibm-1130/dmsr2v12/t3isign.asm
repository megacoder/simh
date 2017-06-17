                          HDNG    CALL ISIGN                            T3D00010
                    *************************************************** T3D00020
                    *                                                 * T3D00030
                    *   SUBROUTINE NAME-                              * T3D00040
                    *      FULL NAME-INTEGER TRANSFER OF SIGN         * T3D00050
                    *      CODE NAME-ISIGN                            * T3D00060
                    *   PURPOSE-                                   2-12 T3D00070
                    *      PROVIDE FORTRAN SIGN CHANGE FUNCTION    2-12 T3D00072
                    *   METHOD-                                    2-12 T3D00074
                    *      COMPLIMENT ARG1 IF THE SIGNS OF ARG1    2-12 T3D00076
                    *      AND ARG2 ARE DIFFERANT. IF THE SIGNS    2-12 T3D00078
                    *      ARE THE SAME, NO SIGN CHANGE OCCURS.    2-12 T3D00080
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3D00100
                    *   SPECIAL FEATURES-N/A                          * T3D00110
                    *   ADDITIONAL INFORMATION-                       * T3D00120
                    *      ESTIMATED EXECUTION TIME-N/A               * T3D00130
                    *                                                 * T3D00140
                    *************************************************** T3D00150
                    *                                                 * T3D00160
                          ENT     ISIGN                                 T3D00170
                    ISIGN DC      *-*        LOADER STORE 1ST DC ADDR   T3D00180
                          STX   2 SAVE+1     SAVE XR2                   T3D00190
                          LDX  I2 ISIGN      LOAD XR2 WITH 1ST ARG ADDR T3D00200
                          LD   I2 0          LOAD FIRST ARGUMENT        T3D00210
                          STO     SAVE+3     SAVE FIRST ARGUMENT        T3D00220
                          BSC  L  GOOUT,+-   NO CHANGE IF ZERO          T3D00230
                          EOR  I2 1          EOR SECOND ARGUMENT        T3D00240
                          BSC  L  RELDA,-    BRANCH IF NO CHANGE        T3D00250
                          SLA     16         CLEAR ACC TO CHANGE        T3D00260
                          S       SAVE+3     SUBT FIRST ARGUMENT TO     T3D00270
                          MDX     GOOUT      *REVERSE SIGN. GO OUT      T3D00280
                    RELDA LD      SAVE+3     RELOAD FIRST ARGUMENT      T3D00290
                    GOOUT MDX   2 2          SET UP EXIT ADDRESS AND    T3D00300
                          STX   2 SAVE+3     *STORE FOR RETURN          T3D00310
                    SAVE  LDX  L2 *-*        RESTORE XR2 AND THEN       T3D00320
                          BSC  L  *-*        *BRANCH TO MAINLINE        T3D00330
                          END                                           T3D00340
