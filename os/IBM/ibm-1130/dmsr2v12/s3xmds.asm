                    *************************************************** S3I00010
                    *                                                 * S3I00020
                    *   SUBROUTINE NAME-                              * S3I00030
                    *      FULL NAME- STANDARD PRECISION FIXED-POINT  * S3I00040
                    *         (FRACTIONAL) DOUBLE-WORD MULTIPLY       * S3I00050
                    *         FUNCTION.                               * S3I00060
                    *      CODE NAME- XMDS                            * S3I00070
                    *   PURPOSE- THIS FUNCTION PERFORMS A FIXED-POINT * S3I00080
                    *      MULTIPLY OF TWO FIXED-POINT DOUBLE-WORD    * S3I00090
                    *      FRACTIONS GIVING A 24-BIT RESULT           * S3I00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3I00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3I00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3I00130
                    *   SPECIAL FEATURES- N/A                         * S3I00140
                    *   ADDITIONAL INFORMATION-                       * S3I00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3I00160
                    *         SUBROUTINE LIBRARY MANUAL               * S3I00170
                    *                                                 * S3I00180
                    *************************************************** S3I00190
                          HDNG    LIBF XMDS  -V1.                       S3I00200
                          LIBR                                          S3I00210
                          SPR                                           S3I00220
                          ENT     XMDS                                  S3I00230
                    XMDS  MDX     *+2       ENTRY POINT                 S3I00240
                          BSC  I  *-*       LOADER INSERT               S3I00250
                          STD     MPYER     SAVE MULTIPLIER             S3I00260
                          M     3 126       GET MOST SIGNIFICANT        S3I00270
                          STD     PROD      PRODUCT AND STORE           S3I00280
                          LD      MPYER+1   GET SECOND HALF OF MPYER    S3I00290
                          BSC  L  BY1,+-    AND BR IF ZERO              S3I00300
                          SRA     1         IF NOT ZERO,POSITION AND    S3I00310
                          M     3 126       MPY.                        S3I00320
                          SRT     15        SCALE RESULT AND ADD TO     S3I00330
                          AD      PROD      PREVIOUS PRODUCT.           S3I00340
                          STD     PROD                                  S3I00350
                    BY1   LDD   3 127       GET SECOND HALF OF MULTI-   S3I00360
                          BSC  L  BY2,+-    PLICAND, BR IF ZERO.        S3I00370
                          SRA     1         IF NOT ZERO,POSITION AND    S3I00380
                          M       MPYER     MPY.                        S3I00390
                          SRT     15        SCALE RESULT AND ADD TO     S3I00400
                    BY2   AD      PROD      PREVIOUS PRODUCT.           S3I00410
                          SLT     1         PLACE BINARY POINT FOR RET  S3I00420
                          MDX     XMDS+1    RETURN TO MAIN PROG         S3I00430
                    MPYER DEC     0.0       STORE MULTIPLIER            S3I00440
                    PROD  DEC     0.0       PRODUCT BUFFER              S3I00450
                          END                                           S3I00460
