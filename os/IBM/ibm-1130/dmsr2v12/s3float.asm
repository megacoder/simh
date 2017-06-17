                    *************************************************** S3C00010
                    *                                                 * S3C00020
                    *   SUBROUTINE NAME-                              * S3C00030
                    *      FULL NAME- INTEGER TO FLOATING-POINT       * S3C00040
                    *         CONVERSION SUBROUTINE.                  * S3C00050
                    *      CODE NAME- FLOAT                           * S3C00060
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A ONE-WORD  * S3C00070
                    *      INTEGER TO A FLOATING-POINT NUMBER IN FAC. * S3C00080
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3C00090
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3C00100
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3C00110
                    *   SPECIAL FEATURES- N/A                         * S3C00120
                    *   ADDITIONAL INFORMATION-                       * S3C00130
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3C00140
                    *         SUBROUTINE LIBRARY MANUAL               * S3C00150
                    *                                                 * S3C00160
                    *************************************************** S3C00170
                          HDNG    LIBF FLOAT  -V1.                      S3C00180
                          LIBR                                          S3C00190
                          ENT     FLOAT                               * S3C00200
                    FLOAT MDX     *+2                                   S3C00210
                          BSC  I  *-*       CALL+1                      S3C00220
                          SRT     16        SHIFT INTEGER TO EXTENSION  S3C00230
                          STD   3 126       STORE IN FAC                S3C00240
                          LD      EXK       GET CORRECT EXPONENT        S3C00250
                          STO   3 125       PUT EXPONENT IN FAC         S3C00260
                          LIBF    NORM      NORMALIZE                   S3C00270
                          MDX     FLOAT+1   RETURN TO CALL+1            S3C00280
                    EXK   DC      128+31                                S3C00290
                          END                                           S3C00300
