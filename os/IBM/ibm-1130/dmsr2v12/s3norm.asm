                    *************************************************** S3E00010
                    *                                                 * S3E00020
                    *   SUBROUTINE NAME-                              * S3E00030
                    *      FULL NAME- NORMALIZING SUBROUTINE          * S3E00040
                    *      CODE NAME- NORM                            * S3E00050
                    *   PURPOSE- THIS SUBROUTINE NORMALIZES A FLOATING* S3E00060
                    *      POINT NUMBER.                              * S3E00070
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3E00080
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3E00090
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3E00100
                    *   SPECIAL FEATURES- N/A                         * S3E00110
                    *   ADDITIONAL INFORMATION-                       * S3E00120
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3E00130
                    *         SUBROUTINE LIBRARY MANUAL               * S3E00140
                    *                                                 * S3E00150
                    *************************************************** S3E00160
                          HDNG    LIBF NORM  -V1.                       S3E00170
                          LIBR                                          S3E00180
                          ENT     NORM                                  S3E00190
                    NORM  MDX     *+2                                   S3E00200
                          BSC  I  *-*       LOADER INSERT               S3E00210
                          SLT     32        CLEAR ACC AND EXT           S3E00220
                          SD    3 126       GET THE ABS VALUE           S3E00230
                          BSC     +Z                                    S3E00240
                          LDD   3 126                                   S3E00250
                          BSC  L  EXC,+Z    IF THE NO. IS NOT /8000     S3E00260
                          SLT     1         SHIFT 1 BIT INTO SIGN BIT   S3E00270
                          BSC  L  NORM+1,+Z BR OUT IF ALREADY NORMALIZE S3E00280
                          STX   1 SAVE+1    OTHERWISE,SAVE XR1,AND SET  S3E00290
                          LDX   1 31        XR1 FOR SHIFT COUNT         S3E00300
                          SLC   1           SHIFT UNTIL 1 IS IN 0 BIT O S3E00310
                          STX   1 T2        SHIFT IS 32,THEN SAVE XR1.  S3E00320
                          LD      EK31      CALCULATE THE SHIFT AND     S3E00330
                          S       T2        STORE TO PUT IN XR1.        S3E00340
                          STO     SLTK+1                                S3E00350
                    SLTK  LDX  L1 *-*                                   S3E00360
                          LD    3 125       GET EXPONENT AND DECREMENT  S3E00370
                          S       SLTK+1    THE AMOUNT OF THE SHIFT.    S3E00380
                          STO   3 125                                   S3E00390
                          LDD   3 126       GET MANTISSA AND PERFORM    S3E00400
                          SLT   1           SHIFT.                      S3E00410
                          BSC     +-        BR IF NOT ZERO              S3E00420
                          STO   3 125       IF ZERO, SET EXPONENT ZERO  S3E00430
                          STD   3 126       RESTORE NORMALIZED MANTISSA S3E00440
                    SAVE  LDX  L1 *-*       RESTORE XR1                 S3E00450
                          MDX     NORM+1    RETURN TO MAIN PROG         S3E00460
                    EXC   SRT     1         INPUT NO. WAS /8000         S3E00470
                          STD   3 126       DO A SHIFT RIGHT OF 1       S3E00480
                          LD    3 125       INCREMENT EXPONENT TO       S3E00490
                          A       ONE       CORRESPOND.                 S3E00500
                          STO   3 125                                   S3E00510
                          MDX     NORM+1    BR TO PREPARE FOR EXIT  2-3 S3E00520
                    *                                                   S3E00530
                    *CONSTANTS AREA                                     S3E00540
                    *                                                   S3E00550
                    ONE   DC      1         SINGLE WORD ONE             S3E00560
                    T2    DC      0         SHIFT COUNT                 S3E00570
                    EK31  DC      /1F       MAXIMUM SHIFT CONSTANT      S3E00580
                          END                                           S3E00590
