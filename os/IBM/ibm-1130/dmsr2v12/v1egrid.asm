                          HDNG    CALL EGRID                            V1C00010
                    *************************************************** V1C00020
                    *                                                 * V1C00030
                    *   SUBROUTINE NAME-                              * V1C00040
                    *      FULL NAME- EXTENDED PRECISION GRID LINE    * V1C00050
                    *         FUNCTION.                               * V1C00060
                    *      CODE NAME- EGRID                           * V1C00070
                    *   PURPOSE- DRAWS A GRID LINE (WITH TICK MARKS)  * V1C00080
                    *      PARALLEL TO THE X AXIS OR THE Y AXIS.      * V1C00090
                    *   METHOD- N/A                                   * V1C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1C00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1C00120
                    *      (FORM C26-3755).                           * V1C00130
                    *   SPECIAL FEATURES- N/A                         * V1C00140
                    *   ADDITIONAL INFORMATION- N/A                   * V1C00150
                    *                                                 * V1C00160
                    *************************************************** V1C00170
                          HDNG    CALL EGRID                            V1C00180
                    *                                                   V1C00190
                    *             THE CALL TO THE EGRID SUBROUTINE      V1C00200
                    *             IS AS FOLLOWS                         V1C00210
                    *                                                   V1C00220
                    *             CALL EGRID                            V1C00230
                    *             DC   CONTROL (INTEGER)                V1C00240
                    *             DC   X (REAL)                         V1C00250
                    *             DC   Y (REAL)                         V1C00260
                    *             DC   DELTA (REAL)                     V1C00270
                    *             DC   NUMBER (INTEGER)                 V1C00280
                    *                                                   V1C00290
                          EPR                                           V1C00300
                          ENT     EGRID                                 V1C00310
                    INC   XFLC    .0        TICK MARK INCREMENT (REAL)  V1C00320
                    Y     XFLC    .0        X AXIS POSITION (REAL)      V1C00330
                    X     XFLC    .0        Y AXIS POSITION (REAL)      V1C00340
                    *                                                   V1C00350
                    *   THE FOLLOWING 5 WORDS ARE SET-UP TO CONTAIN THE V1C00360
                    *   ADDRESSES OF THE REQUIRED PARAMETERS            V1C00370
                    *                                                   V1C00380
                    CNTL  DC      *-*                                   V1C00390
                          DC      *-*       X (REAL)                    V1C00400
                          DC      *-*       Y (REAL)                    V1C00410
                          DC      *-*       DELTA (REAL)                V1C00420
                          DC      *-*       NUMBER (INTEGER)            V1C00430
                    YADD  DC      Y         ADDRESS OF Y AXIS ARGUMENT  V1C00440
                    XADD  DC      X         ADDRESS OF X AXIS ARGUMENT  V1C00450
                    PENUP DC      1         PEN UP CONTROL              V1C00460
                    PENDN DC      2         PEN DOWN CONTROL            V1C00470
                    NOMOV DC      0         PEN NO MOVE CONTROL         V1C00480
                    PLUS  EQU     NOMOV     ADDRESS OF ZERO VALUE       V1C00490
                    NO    DC      *-*       NO. OF TICK MARKS           V1C00500
                    H0001 EQU     PENUP     ADDRESS OF VALUE OF ONE     V1C00510
                    H0003 DC      3         MASK TO REMOVE BITS 0-13    V1C00520
                    EGRID DC      *-*       ENTRY POINT TO EGRID        V1C00530
                          STX   1 EXIT+1    SAVE XR1 AND XR2            V1C00540
                          STX   2 EXIT+3                                V1C00550
                          LDX  I1 EGRID     GET ADDRESSES OF PARAMETERS V1C00560
                          LDX   2 -5        XR2 IS LOOP COUNTER         V1C00570
                    GD1   LD    1 0                                     V1C00580
                          MDX   1 1                                     V1C00590
                          STO  L2 CNTL+5    PLACE PARAMETER ADDR IN TBL V1C00600
                          MDX   2 1         DECREMENT LOOP COUNTER      V1C00610
                          MDX     GD1       LOOP TILL 5TH ADDR MOVED    V1C00620
                          STX   1 EXIT+5    SAVE EXIT ADDRESS           V1C00630
                          LD      CNTL+3                                V1C00640
                          STO     *+1       ADDR OF INCREMENT PARAMETER V1C00650
                          LIBF    ELD       LOAD INCR TO REAL NO. ACC   V1C00660
                          DC      *-*       DELTA                       V1C00670
                          LD   I  CNTL                                  V1C00680
                          AND     H0003                                 V1C00690
                          STO     EGRID     GRID DIRECTION, BITS 14-15  V1C00700
                          S       H0001                                 V1C00710
                          BSC     Z-        SKIP IF GRID DIRECTION NEG  V1C00720
                          LIBF    SNR       REVERSE SIGN OF INCREMENT   V1C00730
                          LIBF    ESTO      STORE INCR FROM REAL ACC    V1C00740
                          DC      INC       GRID LINE INCREMENT         V1C00750
                          LD      EGRID     DETERMINE AXIS OF GRID LINE V1C00760
                          SLA     16                                    V1C00770
                          LD      XADD                                  V1C00780
                          BSC     C         SKIP IF ON X DIRECTION      V1C00790
                          LD      YADD                                  V1C00800
                          STO     DELTA     INITLZ PEN MOVEMENT WITH    V1C00810
                          STO     DELTA+4   ADDR OF X OR Y PARAMETER    V1C00820
                          LD   I  CNTL+4    GET NO,X AND Y              V1C00830
                          STO     NO        LENGTH OF GRID LINE         V1C00840
                          LD      CNTL+1                                V1C00850
                          STO     *+1                                   V1C00860
                          LIBF    ELD       X VALUE TO REAL NO. ACC     V1C00870
                          DC      *-*       ADDR OF X VALUE             V1C00880
                          LIBF    ESTO      REAL ACC TO WORK AREA       V1C00890
                          DC      X         X VALUE WORK AREA           V1C00900
                          LD      CNTL+2                                V1C00910
                          STO     *+1                                   V1C00920
                          LIBF    ELD       Y VALUE TO REAL NO. ACC     V1C00930
                          DC      *-*       ADDR OF Y VALUE             V1C00940
                          LIBF    ESTO      REAL ACC TO WORK AREA       V1C00950
                          DC      Y         Y VALUE WORK AREA           V1C00960
                          CALL    EPLOT     RAISE PEN AND MOVE TO X,Y   V1C00970
                          DC      PENUP     RAISE PEN CONTROL           V1C00980
                          DC      X         X POSITION                  V1C00990
                          DC      Y         Y POSITION                  V1C01000
                          CALL    EPLOT     LOWER PEN                   V1C01010
                          DC      PENDN     LOWER PEN CONTROL           V1C01020
                          DC      X         X POSITION                  V1C01030
                          DC      Y         Y POSITION                  V1C01040
                          CALL    POINT     DRAW TICK MARK              V1C01050
                          DC      PLUS      'PLUS' TICK MARK CONTROL    V1C01060
                    LOOP  LIBF    ELD       COMPUTE MOVEMENT            V1C01070
                    DELTA DC      *-*       X OR Y POSITION TO REAL ACC V1C01080
                          LIBF    EADD      ADD GRID LINE INCREMENT     V1C01090
                          DC      INC       INCREMENT ARGUMENT ADDRESS  V1C01100
                          LIBF    ESTO      EXECUTE EXTENDED PREC STORE V1C01110
                          DC      *-*       NEW X OR Y POSITION         V1C01120
                          CALL    EPLOT     MOVE PEN ALONG AXIS         V1C01130
                          DC      NOMOV     LEAVE PEN IN DOWN POSITION  V1C01140
                          DC      X         X POSITION                  V1C01150
                          DC      Y         Y POSITION                  V1C01160
                          CALL    POINT     DRAW TICK MARK              V1C01170
                          DC      PLUS      'PLUS' TICK MARK CONTROL    V1C01180
                          MDX  L  NO,-1     DECREMENT TICK MARK COUNTER V1C01190
                          MDX     LOOP      CONT TILL GRID LINE DONE    V1C01200
                          CALL    EPLOT     RAISE PEN                   V1C01210
                          DC      PENUP     RAISE PEN CONTROL           V1C01220
                          DC      X         X POSITION                  V1C01230
                          DC      Y         Y POSITION                  V1C01240
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1C01250
                          LDX  L2 *-*                                   V1C01260
                          BSC  L  *-*       RETURN TO CALLING PROGRAM   V1C01270
                          END                                           V1C01280
