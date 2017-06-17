                          HDNG    LIBF  XYPLT                           V1P00010
                    *************************************************** V1P00020
                    *   SUBROUTINE NAME-                              * V1P00030
                    *      FULL NAME- N/A                             * V1P00040
                    *      CODE NAME- XYPLT.                          * V1P00050
                    *   PURPOSE- THIS SUBROUTINE CALCULATES THE       * V1P00060
                    *      OPTIMUM PEN MOVEMENT AND CALLS PLOTI TO    * V1P00070
                    *      MOVE THE PEN.                              * V1P00080
                    *   METHOD-N/A                                    * V1P00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * V1P00100
                    *   SPECIAL FEATURES- N/A                         * V1P00110
                    *   ADDITIONAL INFORMATION-                       * V1P00120
                    *      CALLING SEQUENCE                           * V1P00130
                    *         LIBF    XYPLT                           * V1P00140
                    *         DC      X (INTEGER)                     * V1P00150
                    *         DC      Y (INTEGER)                     * V1P00160
                    *************************************************** V1P00170
                          HDNG    LIBF XYPLT                            V1P00180
                          LIBR                                          V1P00190
                          ENT     XYPLT                                 V1P00200
                    XYPLT STX   1 RTN+1     GET PARAMETERS              V1P00210
                          LDX  I1 *-*                                   V1P00220
                          LD   I1 0                                     V1P00230
                          STO     X                                     V1P00240
                          LD   I1 1                                     V1P00250
                          STO     Y                                     V1P00260
                          MDX   1 2                                     V1P00270
                          STX   1 RTN+3     SAVE RETURN ADDRESS         V1P00280
                          OR      X                                     V1P00290
                          BSC  L  RTN,+-    X .OR. Y = 0, YES BRANCH    V1P00300
                          LD      TABLE                                 V1P00310
                          STO     T         T = TABLE(0)                V1P00320
                          LD      X                                     V1P00330
                          BSC  L  *+2,+Z    X .LT. 0, YES BRANCH        V1P00340
                          MDX  L  T,1       T = T + 1                   V1P00350
                          BSI     IABS                                  V1P00360
                          STO     X         X = IABS(X)                 V1P00370
                          LD      Y                                     V1P00380
                          BSC  L  *+2,+Z    Y .LT. 0, YES BRANCH        V1P00390
                          MDX  L  T,2       T = T + 2                   V1P00400
                          BSI     IABS                                  V1P00410
                          STO     Y         Y = IABS(Y)                 V1P00420
                          S       X                                     V1P00430
                          BSC  L  S10,+     X .GE. Y, YES BRANCH        V1P00440
                          MDX  L  T,4       T = T + 4                   V1P00450
                          LD      X                                 2-7 V1P00460
                          SRT     16                                2-7 V1P00470
                          LD      Y                                 2-7 V1P00480
                          STO     X                                 2-7 V1P00481
                          SLT     16                                2-7 V1P00482
                          STO     Y          Y = X AND X = Y        2-7 V1P00483
                    S10   LD      X                                     V1P00490
                          STO     COUNT     COUNT = X                   V1P00500
                          SRT     16                                2-7 V1P00510
                          STD     X          MAKE X DOUBLE WORD     2-7 V1P00520
                          LD      Y                                 2-7 V1P00530
                          A       Y                                 2-7 V1P00531
                          SRT     16         MAKE Y DOUBLE WORD     2-7 V1P00532
                          STD     Y          Y = Y + !              2-7 V1P00533
                          SD      X                                 2-7 V1P00540
                    S20   STD     DELTA      DELTA = Y - X          2-7 V1P00550
                          LDX   1 0         XR1 = 0                     V1P00560
                          BSC  L  S50,+Z                                V1P00570
                          LDX   1 8         XR1 = 8                     V1P00580
                          LDD     DELTA                             2-7 V1P00590
                          SD      X                                 2-7 V1P00600
                          SD      X                                 2-7 V1P00610
                          STD     DELTA      DELTA DELTA - X - X    2-7 V1P00620
                    S50   LD   L1 *-*       GET PLOTI PARAMETER         V1P00630
                    T     EQU     *-1                                   V1P00640
                          STO     *+1                                   V1P00650
                          LIBF    PLOTI     MOVE PEN                    V1P00660
                          DC      *-*                                   V1P00670
                          LD      DELTA                             2-7 V1P00680
                          AD      Y          DELTA = DELTA + Y + Y  2-7 V1P00690
                          MDX  L  COUNT,-1  COUNT PEN MOVEMENTS         V1P00700
                          MDX     S20                                   V1P00710
                    RTN   LDX  L1 *-*       RESTORE XR1                 V1P00720
                          BSC  L  *-*       RETURN                      V1P00730
                    COUNT EQU     *                                     V1P00740
                    IABS  DC      *-*                                   V1P00750
                          BSC  I  IABS,-    RETURN IF POSITIVE          V1P00760
                          STO     DELTA                                 V1P00770
                          SLA     16                                    V1P00780
                          S       DELTA                                 V1P00790
                          MDX     IABS+1                                V1P00800
                    *                                                   V1P00810
                    *                       CONSTANTS AND WORK AREA     V1P00820
                    *                                                   V1P00830
                          BSS  E  0                                     V1P00840
                    X     DC      *-*                                   V1P00850
                          DC      *-*                               2-7 V1P00855
                    Y     DC      *-*                                   V1P00860
                          DC      *-*                               2-7 V1P00865
                    DELTA DC      *-*                                   V1P00870
                          DC      *-*                               2-7 V1P00875
                    TABLE DC      *                                     V1P00880
                          DC      7                                     V1P00890
                          DC      3                                     V1P00900
                          DC      7                                     V1P00910
                          DC      3                                     V1P00920
                          DC      5                                     V1P00930
                          DC      5                                     V1P00940
                          DC      1                                     V1P00950
                          DC      1                                     V1P00960
                          DC      6                                     V1P00970
                          DC      4                                     V1P00980
                          DC      8                                     V1P00990
                          DC      2                                     V1P01000
                          DC      6                                     V1P01010
                          DC      4                                     V1P01020
                          DC      8                                     V1P01030
                          DC      2                                     V1P01040
                          END                                           V1P01050
