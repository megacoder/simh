                    *************************************************** S3A00010
                    *                                                 * S3A00020
                    *   SUBROUTINE NAME-                              * S3A00030
                    *      FULL NAME- FLOATING ACCUMULATOR RANGE CHECK* S3A00040
                    *         SUBPROGRAM.                             * S3A00050
                    *      CODE NAME- FARC                            * S3A00060
                    *   PURPOSE- THIS SUBROUTINE CHECKS THE VALUE IN  * S3A00070
                    *      FAC AND SETS OVERFLOW AND UNDERFLOW        * S3A00080
                    *      INDICATORS.  IF FAC IS TOO LARGE OR TOO    * S3A00090
                    *      SMALL, THE MAXIMUM POSITIVE OR NEGATIVE    * S3A00100
                    *      NUMBER RESPECTIVELY, IS RETURNED IN FAC.   * S3A00110
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3A00120
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3A00130
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3A00140
                    *   SPECIAL FEATURES- N/A                         * S3A00150
                    *   ADDITIONAL INFORMATION-                       * S3A00160
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3A00170
                    *         SUBROUTINE LIBRARY MANUAL               * S3A00180
                    *                                                 * S3A00190
                    *************************************************** S3A00200
                          HDNG    LIBF FARC  -V1.                       S3A00210
                          LIBR                                          S3A00220
                          ENT     FARC                                  S3A00230
                    FARC  MDX     *+2                                   S3A00240
                          BSC  I  *-*       LOADER INSERT.              S3A00250
                          LD    3 125       CHECK FAC EXPONENT.         S3A00260
                          BSC  L  UNDER,+Z  UNDERFLOW IF NEGATIVE.      S3A00270
                          SRA     8         OVERFLOW IF GREATER         S3A00280
                          BSC  L  OVER,Z    THAN 255.                   S3A00290
                          MDX     FARC+1    RETURN IF FAC IS OK.        S3A00300
                    UNDER SLT     32        UNDERFLOW PROCESS.          S3A00310
                          STO   3 125       SET FAC TO 0.0.             S3A00320
                          STD   3 126                                   S3A00330
                          LD      UNDCD     SET PROGRAM INDICATOR       S3A00340
                          MDX     XY        TO UNDERFLOW CONDITION.     S3A00350
                    OVER  LD      MAXXP     OVERFLOW PROCESS            S3A00360
                          STO   3 125       SET FAC EXPONENT TO 255     S3A00370
                          LD    3 126       GET MANTISSA FROM FAC       S3A00380
                          BSC     +Z        BR IF NON-NEG               S3A00390
                          LDD     MAXN      IF FAC NEG,GET MAX NEG NO.  S3A00400
                          BSC     -         BR IF NEG                   S3A00410
                    PLUS  LDD     MAXP      IF FAC PTV,GET MAX PTV NO.  S3A00420
                          STD   3 126       STORE IN FAC                S3A00430
                          LD      OVRCD     SET PROGRAM INDICATOR TO    S3A00440
                    XY    STO   3 122       OVERFLOW CONDITION.         S3A00450
                          MDX     FARC+1    RETURN.                     S3A00460
                    *                                                   S3A00470
                    *CONSTANTS AREA                                     S3A00480
                    *                                                   S3A00490
                          BSS  E  0                                     S3A00500
                    MAXP  DC      /7FFF     MAX + MANTISSA.             S3A00510
                          DC      /FFFF                                 S3A00520
                    MAXN  DC      /8000     MAX - MANTISSA.             S3A00530
                          DC      /0001                                 S3A00540
                    MAXXP DC      255       MAXIMUM LEGAL EXPONENT      S3A00550
                    UNDCD DC      3         UNDERFLOW CODE.             S3A00560
                    OVRCD DC      1         OVERFLOW CODE.              S3A00570
                          END                                           S3A00580
