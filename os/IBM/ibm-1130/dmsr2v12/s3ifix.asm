                    *************************************************** S3D00010
                    *                                                 * S3D00020
                    *   SUBROUTINE NAME-                              * S3D00030
                    *      FULL NAME- FLOATING-POINT TO INTEGER       * S3D00040
                    *          CONVERSION SUBROUTINE.                 * S3D00050
                    *      CODE NAME- IFIX                            * S3D00060
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A FLOATING- * S3D00070
                    *      POINT NUMBER TO AN INTEGER, DROPPING ANY   * S3D00080
                    *      FRACTIONAL EXCESS.                         * S3D00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3D00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3D00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3D00120
                    *   SPECIAL FEATURES- N/A                         * S3D00130
                    *   ADDITIONAL INFORMATION-                       * S3D00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3D00150
                    *         SUBROUTINE LIBRARY MANUAL               * S3D00160
                    *                                                 * S3D00170
                    *************************************************** S3D00180
                          HDNG    LIBF IFIX  -V1.                       S3D00190
                          LIBR                                          S3D00200
                          ENT     IFIX                                  S3D00210
                    IFIX  MDX     *+2                                   S3D00220
                          BSC  I  *-*                                   S3D00230
                          LD      K128      CALCULATE SHIFT VARIABLE    S3D00240
                          S     3 125       GET NEG OF TRUE EXPONENT    S3D00250
                          BSC  L  FZER,-    IF RSLT WILL BE FRACTIONAL, S3D00260
                    *                       BR TO SET FAC=0.            S3D00270
                          A       SRT15     OTHERWISE,GENERATE SHIFT    S3D00280
                          STO     FSHFT     CONSTANT AND STORE.         S3D00290
                          S       FSHFZ     CONSTANT TO CHK RANGE       S3D00300
                          BSC  L  OK,-      GO TO DO SHIFT IF IN RANGE  S3D00310
                          LD      FLAG      INTEGER TOO LARGE           S3D00320
                          OR    3 124       SET IFIX ERROR INDICATOR    S3D00330
                          STO   3 124                                   S3D00340
                          LD    3 126       TEST SIGN                   S3D00350
                          BSC     -         IF NEG,SKIP TO RET NEG NO.  S3D00360
                          LD      MAXI      RET LARGEST PTV INTEGER     S3D00370
                          BSC     +Z        IF PTV,SKIP TO BR OUT       S3D00380
                          LD      MINI      RET LARGEST NEGATIVE NO.    S3D00390
                          MDX     IFIX+1    EXIT                        S3D00400
                    FZER  SLA     16        RETURN ZERO                 S3D00410
                          MDX     IFIX+1    EXIT                        S3D00420
                    OK    SLT     32        INTEGER IS IN RANGE-PROCEED S3D00430
                          SD    3 126       GET ABS VALUE OF MANTISSA   S3D00440
                          BSC     Z+                                    S3D00450
                          LD    3 126                                   S3D00460
                    FSHFT SRT     *-*       PERFORM REQUIRED SHIFT      S3D00470
                          STO     TEMP      KEEP RSLT INTEGER           S3D00480
                          LD    3 126       GET SIGN OF MANTISSA        S3D00490
                          BSC  L  NEG,+Z    BR IF NEG                   S3D00500
                          LD      TEMP      IF PTV,RET PTV INTEGER      S3D00510
                          MDX     IFIX+1    EXIT                        S3D00520
                    NEG   SLA     16        IF NEG,NEGATE INTEGER       S3D00530
                          S       TEMP                                  S3D00540
                          MDX     IFIX+1    EXIT                        S3D00550
                    *                                                   S3D00560
                    *CONSTANTS TABLE AND BUFFER AREA                    S3D00570
                    *                                                   S3D00580
                    K128  DC      128       SCALE EXPONENT CONSTANT     S3D00590
                    FLAG  DC      /8        ERROR FLAG CONSTANT         S3D00600
                    MAXI  DC      /7FFF     MAXIMUM PTV INTEGER         S3D00610
                    MINI  DC      /8000     MINIMUM NEG INTEGER         S3D00620
                    SRT15 SRT     15        SHIFT CONSTANT              S3D00630
                    TEMP  DC      0         BUFFER FOR INTEGER          S3D00640
                    FSHFZ SRT     0         SHIFT CONSTANT              S3D00650
                          END                                           S3D00660
