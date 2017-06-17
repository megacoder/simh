                    *************************************************** S3G00010
                    *                                                 * S3G00020
                    *   SUBROUTINE NAME-                              * S3G00030
                    *      FULL NAME- FIXED-POINT (FRACTIONAL) DOUBLE-* S3G00040
                    *         WORD DIVIDE FUNCTION.                   * S3G00050
                    *      CODE NAME- XDD                             * S3G00060
                    *   PURPOSE- THIS FUNCTION PERFORMS A FIXED-POINT * S3G00070
                    *      DIVIDE ON TWO FIXED-POINT DOUBLE-WORD      * S3G00080
                    *      FRACTIONS.                                 * S3G00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3G00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3G00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3G00120
                    *   SPECIAL FEATURES- N/A                         * S3G00130
                    *   ADDITIONAL INFORMATION-                       * S3G00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3G00150
                    *         SUBROUTINE LIBRARY MANUAL               * S3G00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* S3G00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* S3G00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * S3G00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* S3G00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * S3G00210
                    *         INPUT ARGUMENT.                         * S3G00220
                    *                                                 * S3G00230
                    *************************************************** S3G00240
                          HDNG    LIBF XDD  -V1.                        S3G00250
                          LIBR                                          S3G00260
                          ENT     XDD                                   S3G00270
                    XDD   MDX     *+2                                   S3G00280
                    XDDX  BSC  I  *-*       LOADER INSERT.              S3G00290
                          STS     XDSS      SAVE STATUS                 S3G00300
                          STD     DVR       STORE DIVISOR               S3G00310
                          BSC     -         IF PTV, EXT NON-ZERO CAUSES S3G00320
                          AD      B16       CARRY INTO ACC.  SAVE ONE   S3G00330
                          STO     DVR1      WD APPROXIMATE DIVISOR.     S3G00340
                          LDD   3 126       STORE DIVIDEND.             S3G00350
                          STD     DIVND                                 S3G00360
                          SLT     32                                    S3G00370
                          STD   3 126       CLEAR INITIAL QUOTIENT.     S3G00380
                          LD      DIVNP     RESET TO NORMAL PROCESS.    S3G00390
                          STO     DIV2                                  S3G00400
                          BSC  L  DIVOP,O   OVFL MEANS DVR1=+1.0        S3G00410
                    *                       SO BRANCH TO SIMULATE       S3G00420
                    *                       DIVISION BY ONE.            S3G00430
                          LDD     DIVND     GET DIVIDEND                S3G00440
                          BSC     +Z        SKIP IF NOT NEG             S3G00450
                          AD      ONED      IF NEG,SCALE BY ONE         S3G00460
                          SRT     1         SHIFT FOR DIVISION.         S3G00470
                    *                                                   S3G00480
                    *COMPUTE PARTIAL QUOTIENTS                          S3G00490
                    *                                                   S3G00500
                          D       DVR1      PERFORM FIRST DIVISION      S3G00510
                          STO   3 126       SAVE Q1=DVD/DVR1  .B0       S3G00520
                          SLT     32        CLEAR ACC AND EXT           S3G00530
                          SD      DVR       COMPUTE AN ERROR TO GET     S3G00540
                          LIBF    XMD       Q2. ERROR1=DVD-Q1*DVR  .B0  S3G00550
                          AD      DIVND                            .B0  S3G00560
                          SLT     12        SCALE ERROR1 FOR      .B-12 S3G00570
                          D       DVR1      DIVISION BY DVR1      .B-13 S3G00580
                          SRT     16        MOVE RESULTANT CORRECTION   S3G00590
                          SLT     3         FOR FIRST QUOTIENT TO       S3G00600
                    DIV16 AD    3 126       PROPER POSITION,TRUNCATING. S3G00610
                          STD   3 126       ST Q2=Q1+ERROR1/DVR1        S3G00620
                          SLT     32        CLEAR ACC AND EXT TO        S3G00630
                          SD      DVR       GET NEXT PARTIAL QUOTIENT   S3G00640
                          LIBF    XMD       COMPUTE -Q2*DVR             S3G00650
                          AD      DIVND     ERROR2=DVD-Q2*DVR     .B0   S3G00660
                    DIV2  MDX  X  *-*       NOP OR BR TO DIV15          S3G00670
                    DIV1  SLT     18        SCALE TO PERFORM     .B-18  S3G00680
                          D       DVR1      DIVISION BY DVR1     .B-19  S3G00690
                          BSC     +Z        IF NEG ROUND OFF QUOTIENT   S3G00700
                          A       DIV7      TO 4TH BIT                  S3G00710
                          SRT     19        POSITION PARTIAL QUOTIENT   S3G00720
                    DIVX  AD    3 126       AND ADD TO PREVIOUS CALC.B0 S3G00730
                    *                                                   S3G00740
                    *SET OVERFLOW INDR FOR RETURN                       S3G00750
                    *                                                   S3G00760
                          BSC  L  *+2,O     IF OVERFLO ON WHEN ENTERED  S3G00770
                    XDSS  LDS     *-*       OR TURNED ON BY IMPROPER    S3G00780
                          MDX     XDDX      DIVIDE,TURN ON OVERFLOW     S3G00790
                          LDS     3         INDR. RET TO MAIN PROG      S3G00800
                          MDX     XDDX                                  S3G00810
                    *                                                   S3G00820
                    *SECTION TO SIMULATE DIVISION BY ONE IF THE INITIAL S3G00830
                    *APPROXIMATE DIVISOR IS ONE.                        S3G00840
                    *                                                   S3G00850
                    DIVOP LD      DIVXP     BRANCH TO DIV15 AT DIV2     S3G00860
                          STO     DIV2      TO SIMULATE DIV BY +1.0     S3G00870
                          LD      THREE     ITERATION COUNT.            S3G00880
                          STO     DIVCT                                 S3G00890
                          LDD     DIVND     INITIAL QUOTIENT IS         S3G00900
                          MDX     DIV16     DIVIDEND ITSELF.            S3G00910
                    DIV15 MDX  L  DIVCT,-1  DECR DIVIDE CTR             S3G00920
                          MDX     DIV16     IF NOT ZERO,RET TO DIVIDE   S3G00930
                          MDX     DIVX      IF ZERO,GO PREPARE EXIT     S3G00940
                    *                                                   S3G00950
                    *CONSTANTS AND BUFFER AREA                          S3G00960
                    *                                                   S3G00970
                    DVR1  DC      0         ONE-WD APPROXIMATE DIVISOR  S3G00980
                    DIVCT DC      0         DIVIDE ITERATION COUNT.     S3G00990
                    DIVNP NOP               INST FOR NORMAL PROCESS     S3G01000
                    THREE DC      3         DIVIDE COUNT CON            S3G01010
                    DIVXP MDX  X  DIV15-DIV2-1   INST USED WHEN DVR1=1  S3G01020
                    ONED  DEC     1         TWO WORD ONE                S3G01030
                    DVR   DEC     0         ROUND OFF CON               S3G01040
                    DIVND DEC     0         DIVIDEND BUFFER             S3G01050
                    B16   DEC     65535     (/FFFF)                     S3G01060
                    DIV7  DC      7                                     S3G01070
                          END                                           S3G01080
