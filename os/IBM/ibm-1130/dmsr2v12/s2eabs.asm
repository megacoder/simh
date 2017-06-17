                    *************************************************** S2A00010
                    *                                                 * S2A00020
                    *   SUBROUTINE NAME-                              * S2A00030
                    *      FULL NAME-EXTENDED PRECISION ABSOLUTE VALUE* S2A00040
                    *         FUNCTION.                               * S2A00050
                    *      CODE NAME-EAVL/EABS                        * S2A00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE ABSOLUTE* S2A00070
                    *      VALUE OF AN EXTENDED PRECISION FLOATING-   * S2A00080
                    *      POINT NUMBER.                              * S2A00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2A00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2A00120
                    *   SPECIAL FEATURES- N/A                         * S2A00130
                    *   ADDITIONAL INFORMATION-                       * S2A00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2A00150
                    *         SUBROUTINE LIBRARY MAMUAL               * S2A00160
                    *                                                 * S2A00170
                    *************************************************** S2A00180
                    *                                                 * S2A00190
                          EPR                                           S2A00200
                          ENT     EABS      STANDARD FORTRAN NAME       S2A00210
                          ENT     EAVL                                  S2A00220
                    EABS  DC      0         FORTRAN ENTRY               S2A00230
                          LIBF    EGETP     GET PARAMETER               S2A00240
                    EXIT  DC      0         RETURN ADDRESS              S2A00250
                          LD    3 126       GET SIGN OF NUMBER          S2A00260
                          BSC  I  EXIT,-    IF NON-NEG,EXIT             S2A00270
                          SLT     32        IF NEG.,CLEAR ACC           S2A00280
                          SD    3 126       REVERSE SIGN OF NUMBER      S2A00290
                          STD   3 126       RET NO. TO FLT ACC          S2A00300
                          BSC  I  EXIT      EXIT                        S2A00310
                    EAVL  EQU     EXIT      DEFINE EAVL ENTRY POINT     S2A00320
                          END                                           S2A00330
