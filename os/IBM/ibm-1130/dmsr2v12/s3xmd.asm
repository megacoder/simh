                    *************************************************** S3H00010
                    *                                                 * S3H00020
                    *   SUBROUTINE NAME-                              * S3H00030
                    *      FULL NAME- FIXED-POINT (FRACTIONAL) DOUBLE-* S3H00040
                    *         WORD MULTIPLY FUNCTION.                 * S3H00050
                    *      CODE NAME- XMD                             * S3H00060
                    *   PURPOSE- THIS FUNCTION PERFORMS A FIXED-POINT * S3H00070
                    *      MULTIPLY OF TWO FIXED-POINT DOUBLE-WORD    * S3H00080
                    *      FRACTIONS GIVING A DOUBLE WORD RESULT.     * S3H00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3H00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3H00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3H00120
                    *   SPECIAL FEATURES- N/A                         * S3H00130
                    *   ADDITIONAL INFORMATION-                       * S3H00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3H00150
                    *         SUBROUTINE LIBRARY MANUAL               * S3H00160
                    *                                                 * S3H00170
                    *************************************************** S3H00180
                          HDNG    LIBF XMD  -V1.                        S3H00190
                          LIBR                                          S3H00200
                          ENT     XMD                                   S3H00210
                    XMD   MDX     *+2                                   S3H00220
                    XMDX  BSC  I  *-*       LOADER INSERT.              S3H00230
                          STD     P         SAVE MULTIPLICAND           S3H00240
                          EOR   3 126       COMPUTE AND STORE           S3H00250
                          STO     PSGN      PRODUCT SIGN.               S3H00260
                          SLT     32        CLEAR ACC AND EXT           S3H00270
                          SD    3 126       GET THE ABS VALUE OF THE    S3H00280
                          BSC     +Z        MULTIPLIER AND STORE IN EXT S3H00290
                          LDD   3 126                                   S3H00300
                          STD     Q                                     S3H00310
                          SLT     32        CLEAR ACC AND EXT           S3H00320
                          SD      P         GET THE ABSOLUTE VALUE OF   S3H00330
                          BSC     -         THE MULTIPLICAND AND STORE  S3H00340
                          STD     P         IN P                        S3H00350
                          LD      P                                     S3H00360
                          M       Q         MPY MOST SIGNIFICANT HALVES S3H00370
                          SLT     1         SCALE PRODUCT               S3H00380
                          STD     PS        STORE PARTIAL PRODUCT       S3H00390
                          LD      P+1       SECOND HALF OF MULTIPLICAND S3H00400
                          M       Q         TIMES FIRST HALF OF MPYER   S3H00410
                          BSC     +Z        BR IF PTV. OTHERWISE        S3H00420
                          A       Q         ADD TO CORRECT SIGN         S3H00430
                          SRT     1         SCALE PRODUCT               S3H00440
                          STD     PS1       ST PARTIAL CROSS-PRODUCT    S3H00450
                          LD      Q+1       LEAST HALF MULTIPLIER       S3H00460
                          M       P         FIRST HALF MULTIPLICAND     S3H00470
                          BSC     +Z        BR IF PTV.OTHERWISE         S3H00480
                          A       P         ADD TO CORRECT SIGN         S3H00490
                          SRT     1         SCALE PRODUCT,ADD PREVIOUS  S3H00500
                          AD      PS1       PARTIAL CROSS-PRODUCT       S3H00510
                          STD     PS1                                   S3H00520
                          LD      Q+1       LEAST HALF OF MPYER SCALED  S3H00530
                          SRA     1         FOR MULTIPLICATION.         S3H00540
                          STO     PS3                                   S3H00550
                          LD      P+1       MPY BY LEAST HALF OF MULTI- S3H00560
                          M       PS3       PLICAND.                    S3H00570
                          BSC     +Z        BR IF PTV. OTHERWISE        S3H00580
                          A       PS3       ADD TO CORRECT SIGN         S3H00590
                          SRT     16        ALIGN W/CROSS-PRODUCTS      S3H00600
                          AD      PS1       AND ADD.                    S3H00610
                          AD      ROUND     HALF-ADJUST RESULT.         S3H00620
                          SRT     14        ALIGN W/PARTIAL PRODUCT     S3H00630
                          AD      PS        ADD FIRST PARTIAL PRODUCT   S3H00640
                          STD     PS        AND STORE FINAL PRODUCT     S3H00650
                          LD      PSGN      RESTORE CORRECT SIGN TO     S3H00660
                          BSC  L  *+3,-     THE RESULT.                 S3H00670
                          SLT     32                                    S3H00680
                          SD      PS        PUT RESULT IN THE ACC AND   S3H00690
                          MDX     XMDX      EXTENSION FOR RETURN.       S3H00700
                          LD      PS                                    S3H00710
                          MDX     XMDX                                  S3H00720
                    *                                                   S3H00730
                    *CONSTANTS AND BUFFER AREA                          S3H00740
                    *                                                   S3H00750
                    PS3   DC      0         STORE LEAST HALF OF MPYER.  S3H00760
                    PSGN  DC      0         BIT 0 IS PRODUCT SIGN.      S3H00770
                    ROUND DEC     8192      CONSTANT FOR ROUNDING OFF.  S3H00780
                    P     BSS  E  2         MULTIPLICAND BUFFER         S3H00790
                    Q     BSS  E  2         MULTIPLIER BUFFER           S3H00800
                    PS    BSS  E  2         PARTIAL PRODUCT             S3H00810
                    PS1   BSS  E  2         PARTIAL CROSS-PRODUCT       S3H00820
                          END                                           S3H00830
