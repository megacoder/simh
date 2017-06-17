                    *************************************************** R2A00010
                    *                                                 * R2A00020
                    *   SUBROUTINE NAME-                              * R2A00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2A00040
                    *         POINT ABSOLUTE VALUE FUNCTION.          * R2A00050
                    *      CODE NAME- FAVL/FABS                       * R2A00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE ABSOLUTE* R2A00070
                    *      VALUE OF A STANDARD PRECISION FLOATING-    * R2A00080
                    *      POINT NUMBER.                              * R2A00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2A00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2A00120
                    *   SPECIAL FEATURES- N/A                         * R2A00130
                    *   ADDITIONAL INFORMATION-                       * R2A00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2A00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2A00160
                    *                                                 * R2A00170
                    *************************************************** R2A00180
                          HDNG    CALL FABS  -V1.                       R2A00190
                          SPR                                           R2A00200
                          ENT     FABS      STANDARD FORTRAN NAME       R2A00210
                          ENT     FAVL      USERS NAME                  R2A00220
                    FABS  DC      0         FORTRAN ENTRY               R2A00230
                          LIBF    FGETP     GET PARAMETER               R2A00240
                    EXIT  DC      0         STORE RET ADDR              R2A00250
                          LD    3 126       GET SIGN                    R2A00260
                          BSC  I  EXIT,-    BR OUT IF NON-NEG           R2A00270
                          SLT     32        IF NEG,CLEAR ACC            R2A00280
                          SD    3 126       AND REVERSE SIGN OF         R2A00290
                          STD   3 126       MANTISSA,RET TO FAC         R2A00300
                          BSC  I  EXIT      BR TO CALLING PROG          R2A00310
                    FAVL  EQU     EXIT      DEFN USERS ENTRY            R2A00320
                          END                                           R2A00330
