                          HDNG    LIBF ERULE-PROLOGUE                   V1E00010
                    *************************************************** V1E00020
                    *                                                 * V1E00030
                    *   SUBROUTINE NAME-                              * V1E00040
                    *      FULL NAME- EXTENDED RULE.                  * V1E00050
                    *      CODE NAME- ERULE                           * V1E00060
                    *   PURPOSE- THIS SUBROUTINE SERVES AS A INTERFACE* V1E00070
                    *      FOR THE SCALE SUBROUTINES. THE INITIAL     * V1E00080
                    *      COORDINATE IS COMPUTED AND STORED. COMPUTE * V1E00090
                    *      DELTA (X AND Y) AND INCREMENT THE INITIAL  * V1E00100
                    *      COORDINATE BY DELTA (X AND Y) FOR THE NEW  * V1E00110
                    *      COORDINATE OF PEN                          * V1E00120
                    *   METHOD-N/A                                    * V1E00130
                    *   CAPABILITIES AND LIMITATIONS- N/A             * V1E00140
                    *   SPECIAL FEATURES- N/A                         * V1E00150
                    *   ADDITIONAL INFORMATION-                       * V1E00160
                    *      CALLING SEQUENCE-                          * V1E00170
                    *         LIBF    ERULE                           * V1E00180
                    *                 ACCUMULATOR= Y                  * V1E00190
                    *                  .                              * V1E00200
                    *                  .                              * V1E00210
                    *   Y     DC      X-SCALE (REAL)                  * V1E00220
                    *         DC      Y-SCALE(REAL)                   * V1E00230
                    *         DC      X(0) (REAL)                     * V1E00240
                    *         DC      Y(0) (REAL)                     * V1E00250
                    *                                                 * V1E00260
                    *         LIBF    EMOVE                           * V1E00270
                    *         DC      X (REAL)                        * V1E00280
                    *         DC      Y (REAL)                        * V1E00290
                    *                                                 * V1E00300
                    *         LIBF                                    * V1E00310
                    *         DC      DELTA X (INTEGER)               * V1E00320
                    *         DC      DELTA Y (INTEGER)               * V1E00330
                    *************************************************** V1E00340
                    *             DC   Y-SCALE (REAL)                   V1E00350
                          HDNG    LIBF ERULE                            V1E00360
                          LIBR                                          V1E00370
                          EPR                                           V1E00380
                          ENT     ERULE                                 V1E00390
                          ENT     EMOVE                                 V1E00400
                          ENT     EINC                                  V1E00410
                    *                                                   V1E00420
                    *                       CONSTANTS                   V1E00430
                    *                                                   V1E00440
                    XS    XFLC    1.        X-SCALE                     V1E00450
                    YS    XFLC    1.        Y-SCALE                     V1E00460
                    X0    XFLC    .0        X                           V1E00470
                    Y0    XFLC    .0        Y                           V1E00480
                    XNMX  DC      *-*                                   V1E00490
                    ADR   DC      XS+12                                 V1E00500
                          DC      *-*                                   V1E00510
                    XNMY  DC      *-*                                   V1E00520
                    ADF   DC      XN+6                                  V1E00530
                    ADS   DC      XNMY                                  V1E00540
                    DX    DC      *-*       DELTA-X                     V1E00550
                    IXZ   DC      *-*       INCREMENT X                 V1E00560
                          DC      *-*                                   V1E00570
                    DY    DC      *-*       DELTA-Y                     V1E00580
                    IYZ   DC      *-*       INCREMENT Y                 V1E00590
                    XN    XFLC    .0        NEW X                       V1E00600
                    YN    XFLC    .0        NEW Y                       V1E00610
                    C100  XFLC    100.                                  V1E00620
                    CP5   XFLC    .5        ROUNDING FACTOR             V1E00630
                    *                                                   V1E00640
                    ERULE STO     XR2+1     SAVE PARAMETER ADDRESS      V1E00650
                          MDX     *+1                                   V1E00660
                          DC      *-*                                   V1E00670
                          STX   1 EXIT+1    SAVE XR1 AND XR2            V1E00680
                          STX   2 EXIT+3                                V1E00690
                    XR2   LDX  L2 *-*       SET FOR GET ROUTINE         V1E00700
                          LDX   1 -12                                   V1E00710
                          LD      ADR       ADDR OF XNMX                V1E00720
                          BSI     GET                                   V1E00730
                          STX   1 IXZ       SET UP INITIAL POINT        V1E00740
                          STX   1 IYZ                                   V1E00750
                          LIBF    ELD       SET PEN POSITION            V1E00760
                          DC      X0                                    V1E00770
                          LIBF    ESTO                                  V1E00780
                          DC      XN                                    V1E00790
                          LIBF    ELD                                   V1E00800
                          DC      Y0                                    V1E00810
                          LIBF    ESTO                                  V1E00820
                          DC      YN                                    V1E00830
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1E00840
                          LDX  L2 *-*                                   V1E00850
                          BSC  L  *-*       RETURN                      V1E00860
                    GET   DC      *-*       SUBROUTINE TO PICK UP PARAM V1E00870
                          STO     GET2                                  V1E00880
                    GET0  LD    2 0                                     V1E00890
                          STO     GET1                                  V1E00900
                          STO  L1 XNMX+6                                V1E00910
                          LIBF    ELD                                   V1E00920
                    GET1  DC      *-*                                   V1E00930
                          LIBF    ESTOX                                 V1E00940
                    GET2  DC      *-*                                   V1E00950
                          MDX   2 1         NEXT PARAMETER              V1E00960
                          MDX   1 3                                     V1E00970
                          MDX     GET0                                  V1E00980
                          STX   2 EXIT+5    SET EXIT ADDRESS            V1E00990
                          BSC  I  GET       RETURN                      V1E01000
                          HDNG    LIBF ERULE- EMOVE                     V1E01010
                    * COMPUTE AND ROUND DELTA X AND Y                   V1E01020
                    EMOVE STX   2 EXIT+3    SAVE XR2                    V1E01030
                          LDX  I2 *-*                                   V1E01040
                          STX   1 EXIT+1    SAVE XR1                    V1E01050
                          LDX   1 -6        GET PARAMETERS              V1E01060
                          LD      ADF                                   V1E01070
                          BSI     GET                                   V1E01080
                          LDX   1 6         COMPUTE DELTA (X AND Y)     V1E01090
                          LD      ADS                                   V1E01100
                          STO     FM2+1                                 V1E01110
                    FM1   LIBF    ELDX                                  V1E01120
                          DC      XN-3                                  V1E01130
                          LIBF    ESUBX                                 V1E01140
                          DC      X0-3                                  V1E01150
                          LIBF    EMPYX                                 V1E01160
                          DC      XS-3                                  V1E01170
                          LIBF    EMPY                                  V1E01180
                          DC      C100                                  V1E01190
                          LD    3 126                                   V1E01200
                          BSC  L  ROUND,+Z                              V1E01210
                          LIBF    EADD                                  V1E01220
                          DC      CP5                                   V1E01230
                          MDX     *+2                                   V1E01240
                    ROUND LIBF    ESUB                                  V1E01250
                          DC      CP5                                   V1E01260
                          LIBF    IFIX      REAL TO INTEGER CONVERSION  V1E01270
                          S    L1 IXZ-3                                 V1E01280
                          STO  L1 DX-3                                  V1E01290
                    FM2   STO  I  *-*                                   V1E01300
                          MDX  L  FM2+1,-3                              V1E01310
                          NOP                                           V1E01320
                          MDX   1 -3                                    V1E01330
                          MDX     FM1                                   V1E01340
                          MDX     ADV                                   V1E01350
                          HDNG    LIBF ERULE- EINC                      V1E01360
                    EINC  STX   1 EXIT+1    SAVE XR1                    V1E01370
                          LDX  I1 *-*                                   V1E01380
                          STX   2 EXIT+3    SAVE XR2                    V1E01390
                          LD   I1 0         GET PARAMETERS              V1E01400
                          STO     DX                                    V1E01410
                          LD   I1 1                                     V1E01420
                          STO     DY                                    V1E01430
                          MDX   1 2         INCREMENT FOR RETURN ADDR   V1E01440
                          STX   1 EXIT+5    SAVE EXIT                   V1E01450
                    ADV   LD      IXZ       INCREMENT IXZ AND IYZ       V1E01460
                          A       DX                                    V1E01470
                          STO     IXZ                                   V1E01480
                          LD      IYZ                                   V1E01490
                          A       DY                                    V1E01500
                          STO     IYZ                                   V1E01510
                          MDX     EXIT      TO RETURN                   V1E01520
                          END                                           V1E01530
