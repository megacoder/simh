                          HDNG    LIBF FRULE- PROLOGUE                  V1J00010
                    *************************************************** V1J00020
                    *                                                 * V1J00030
                    *   SUBROUTINE NAME-                              * V1J00040
                    *      FULL NAME- STANDARD PRECISION RULE         * V1J00050
                    *      CODE NAME- FRULE                           * V1J00060
                    *   PURPOSE- THIS SUBROUTINE SERVES AS INTERFACE  * V1J00070
                    *      FOR THE SCALE SUBROUTINES. THE INITIAL PEN * V1J00080
                    *      COORDINATE IS COMPUTED AND STORED. COMPUTE * V1J00090
                    *      DELTA(X AND Y) AND INCREMENT THE INITIAL   * V1J00100
                    *      COORDINATE BY DELTA (X AND Y) TO GET THE   * V1J00110
                    *      NEW COORDINATE.                            * V1J00120
                    *   METHOD- N/A                                   * V1J00130
                    *   CAPABILITIES AND LIMITATIONS- N/A             * V1J00140
                    *   SPECIAL FEATURES- N/A                         * V1J00150
                    *   ADDITIONAL INFORMATION-                       * V1J00160
                    *      CALLING SEQUENCE-                          * V1J00170
                    *         LIBF    FRULE                           * V1J00180
                    *                 ACCUMULATOR=Y                   * V1J00190
                    *                 .                               * V1J00200
                    *                 .                               * V1J00210
                    *   Y     DC      X-SCALE (REAL)                  * V1J00220
                    *         DC      Y-SCALE (REAL)                  * V1J00230
                    *         DC      X (REAL)                        * V1J00240
                    *                 Y (REAL)                        * V1J00250
                    *                                                 * V1J00260
                    *         6IBF    FMOVE                           * V1J00270
                    *         DC      X (REAL)                        * V1J00280
                    *         DC      Y (REAL)                        * V1J00290
                    *                                                 * V1J00300
                    *         LIBF    FINC                            * V1J00310
                    *         DC      DELTA X (INTEGER)               * V1J00320
                    *         DC      DELTA Y (INTEGER)               * V1J00330
                    *************************************************** V1J00340
                          HDNG    LIBF FRULE                            V1J00350
                          LIBR                                          V1J00360
                          SPR                                           V1J00370
                          ENT     FRULE                                 V1J00380
                          ENT     FMOVE                                 V1J00390
                          ENT     FINC                                  V1J00400
                    *                                                   V1J00410
                    *                       CONSTANTS                   V1J00420
                    *                                                   V1J00430
                    XS    DEC     1.        X-SCALE                     V1J00440
                    YS    DEC     1.        Y-SCALE                     V1J00450
                    X0    DEC     .0        X                           V1J00460
                    Y0    DEC     .0        Y                           V1J00470
                    XNMX  DC      *-*                                   V1J00480
                    ADR   DC      XS+8                                  V1J00490
                    XNMY  DC      *-*                                   V1J00500
                    ADF   DC      XN+4                                  V1J00510
                    DX    DC      *-*       DELTA X                     V1J00520
                    IXZ   DC      *-*       INCREMENT X                 V1J00530
                    DY    DC      *-*       DELTA Y                     V1J00540
                    IYZ   DC      *-*       INCREMENT Y                 V1J00550
                    XN    DEC     .0        NEW X                       V1J00560
                    YN    DEC     .0        NEW Y                       V1J00570
                    C100  DEC     100.                                  V1J00580
                    CP5   DEC     .5        ROUNDING FACTOR             V1J00590
                    ADS   DC      XNMY                                  V1J00600
                    *                                                   V1J00610
                    FRULE STO     XR2+1     SAVE PARAMETER ADDRESS      V1J00620
                          MDX     *+1                                   V1J00630
                          DC      *-*                                   V1J00640
                          STX   1 EXIT+1    SAVE XR1 AND XR2            V1J00650
                          STX   2 EXIT+3                                V1J00660
                    XR2   LDX  L2 *-*       SET FOR GET SUBROUTINE      V1J00670
                          LDX   1 -8                                    V1J00680
                          LD      ADR       ADDRESS OF XNMX             V1J00690
                          BSI     GET       FETCH PARAMETERS            V1J00700
                    *                                                 * V1J00710
                          STX   1 IXZ       SET UP INITIAL POINT        V1J00720
                          STX   1 IYZ                                   V1J00730
                          LDD     X0        SET PEN POSITION            V1J00740
                          STD     XN                                    V1J00750
                          LDD     Y0                                    V1J00760
                          STD     YN                                    V1J00770
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1J00780
                          LDX  L2 *-*                                   V1J00790
                          BSC  L  *-*       RETURN                      V1J00800
                    *     SUBROUTINE TO PICKUP PARAMETERS             * V1J00810
                    *                                                 * V1J00820
                    GET   DC      *-*       ENTRY                       V1J00830
                          STO     GET2                                  V1J00840
                    GET0  LD    2 0                                     V1J00850
                          STO     GET1                                  V1J00860
                          STO  L1 XNMX+4    STORE PARAMETER             V1J00870
                          LIBF    FLD                                   V1J00880
                    GET1  DC      *-*                                   V1J00890
                          LIBF    FSTOX                                 V1J00900
                    GET2  DC      *-*                                   V1J00910
                          MDX   2 1         SET FOR NEXT PARAMETER      V1J00920
                          MDX   1 2                                     V1J00930
                          MDX     GET0      GET NEXT PARAMETER          V1J00940
                          STX   2 EXIT+5    SET EXIT ADDRESS            V1J00950
                          BSC  I  GET       RETURN                      V1J00960
                          HDNG    LIBF FRULE- FMOVE                     V1J00970
                    * COMPUTE AND ROUND DELTA (X AND Y)               * V1J00980
                    *                                                 * V1J00990
                    FMOVE STX   2 EXIT+3    SAVE XR2                    V1J01000
                          LDX  I2 *-*                                   V1J01010
                          STX   1 EXIT+1    SAVE XR1                    V1J01020
                          LDX   1 -4        GET PARAMETERS              V1J01030
                          LD      ADF                                   V1J01040
                          BSI     GET                                   V1J01050
                          LDX   1 4         COMPUTE DELTA (X AND Y)     V1J01060
                          LD      ADS                                   V1J01070
                          STO     FM2+1                                 V1J01080
                    FM1   LIBF    FLDX                                  V1J01090
                          DC      XN-2                                  V1J01100
                          LIBF    FSUBX                                 V1J01110
                          DC      X0-2                                  V1J01120
                          LIBF    FMPYX                                 V1J01130
                          DC      XS-2                                  V1J01140
                          LIBF    FMPY                                  V1J01150
                          DC      C100                                  V1J01160
                          LD    3 126                                   V1J01170
                          BSC  L  ROUND,+Z                              V1J01180
                          LIBF    FADD                                  V1J01190
                          DC      CP5                                   V1J01200
                          MDX     *+2                                   V1J01210
                    ROUND LIBF    FSUB                                  V1J01220
                          DC      CP5                                   V1J01230
                          LIBF    IFIX      REAL TO INTEGER CONVERSION  V1J01240
                          S    L1 IXZ-2                                 V1J01250
                          STO  L1 DX-2                                  V1J01260
                    FM2   STO  I  *-*                                   V1J01270
                          MDX  L  FM2+1,-2                              V1J01280
                          NOP                                           V1J01290
                          MDX   1 -2                                    V1J01300
                          MDX     FM1                                   V1J01310
                          MDX     ADV                                   V1J01320
                          HDNG    LIBF FRULE- FINC                      V1J01330
                    FINC  STX   1 EXIT+1    SAVE XR1                    V1J01340
                          LDX  I1 *-*                                   V1J01350
                          STX   2 EXIT+3    SAVE XR2                    V1J01360
                          LD   I1 0         GET PARAMETERS              V1J01370
                          STO     DX                                    V1J01380
                          LD   I1 1                                     V1J01390
                          STO     DY                                    V1J01400
                          MDX   1 2         INCREMENT FOR RETURN ADDR   V1J01410
                          STX   1 EXIT+5    SAVE EXIT                   V1J01420
                    ADV   LD      IXZ       INCREMENT IXZ AND IYZ       V1J01430
                          A       DX                                    V1J01440
                          STO     IXZ                                   V1J01450
                          LD      IYZ                                   V1J01460
                          A       DY                                    V1J01470
                          STO     IYZ                                   V1J01480
                          MDX     EXIT      TO RETURN                   V1J01490
                          END                                           V1J01500
