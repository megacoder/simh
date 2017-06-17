                    *************************************************** S3F00010
                    *                                                 * S3F00020
                    *   SUBROUTINE NAME-                              * S3F00030
                    *      FULL NAME- FLOATING-POINT SIGN REVERSAL    * S3F00040
                    *         FUNCTION                                * S3F00050
                    *      CODE NAME- SNR                             * S3F00060
                    *   PURPOSE- THIS SUBPROGRAM REVERSES THE SIGN OF * S3F00070
                    *      A FLOATING-POINT EXTENDED PRECISION NUMBER.* S3F00080
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3F00090
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3F00100
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3F00110
                    *   SPECIAL FEATURES- N/A                         * S3F00120
                    *   ADDITIONAL INFORMATION-                       * S3F00130
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3F00140
                    *         SUBROUTINE LIBRARY MANUAL               * S3F00150
                    *                                                 * S3F00160
                    *************************************************** S3F00170
                          HDNG    LIBF SNR  -V1.                        S3F00180
                          LIBR                                          S3F00190
                          ENT     SNR                                   S3F00200
                    SNR   MDX     *+2                                   S3F00210
                          BSC  I  *-*       LOADER INSERT               S3F00220
                          SLT     32        CLEAR ACC AND EXT           S3F00230
                          SD    3 126       REVERSE SIGN                S3F00240
                          STD   3 126       PUT BACK IN FAC             S3F00250
                          MDX     SNR+1     BRANCH TO RETURN            S3F00260
                          END                                           S3F00270
