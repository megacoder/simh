                          HDNG    CALL FGRID                            V1H00010
                    *************************************************** V1H00020
                    *                                                 * V1H00030
                    *   SUBROUTINE NAME-                              * V1H00040
                    *      FULL NAME- STANDARD PRECISION GRID LINE    * V1H00050
                    *         FUNCTION.                               * V1H00060
                    *      CODE NAME- FGRID                           * V1H00070
                    *   PURPOSE- DRAWS A GRID LINE (WITH TICK MARKS)  * V1H00080
                    *      PARALLEL TO THE X AXIS OR THE Y AXIS.      * V1H00090
                    *   METHOD- N/A                                   * V1H00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1H00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1H00120
                    *      (FORM C26-3755).                           * V1H00130
                    *   SPECIAL FEATURES- N/A                         * V1H00140
                    *   ADDITIONAL INFORMATION- N/A                   * V1H00150
                    *                                                 * V1H00160
                    *************************************************** V1H00170
                          HDNG    CALL FGRID                            V1H00180
                    *                                                   V1H00190
                    *             THE CALL TO THE FGRID SUBROUTINE      V1H00200
                    *             IS AS FOLLOWS                         V1H00210
                    *                                                   V1H00220
                    *             CALL FGRID                            V1H00230
                    *             DC   CONTROL (INTEGER)                V1H00240
                    *             DC   X (REAL)                         V1H00250
                    *             DC   Y (REAL)                         V1H00260
                    *             DC   DELTA (REAL)                     V1H00270
                    *             DC   NUMBER (INTEGER)                 V1H00280
                    *                                                   V1H00290
                          SPR                                           V1H00300
                          ENT     FGRID                                 V1H00310
                    INC   DEC     .0        TICK MARK INCREMENT (REAL)  V1H00320
                    Y     DEC     .0        X AXIS POSITION (REAL)      V1H00330
                    X     DEC     .0        Y AXIS POSITION (REAL)      V1H00340
                    *                                                   V1H00350
                    *   THE FOLLOWING 5 WORDS ARE SET-UP TO CONTAIN THE V1H00360
                    *   ADDRESSES OF THE REQUIRED PARAMETERS            V1H00370
                    *                                                   V1H00380
                    CNTL  DC      *-*                                   V1H00390
                          DC      *-*       X (REAL)                    V1H00400
                          DC      *-*       Y (REAL)                    V1H00410
                          DC      *-*       DELTA (REAL)                V1H00420
                          DC      *-*       NUMBER (INTEGER)            V1H00430
                    YADD  DC      Y         ADDRESS OF Y AXIS ARGUMENT  V1H00440
                    XADD  DC      X         ADDRESS OF X AXIS ARGUMENT  V1H00450
                    PENUP DC      1         PEN UP CONTROL              V1H00460
                    PENDN DC      2         PEN DOWN CONTROL            V1H00470
                    NOMOV DC      0         PEN NO MOVE CONTROL         V1H00480
                    PLUS  EQU     NOMOV     ADDRESS OF ZERO VALUE       V1H00490
                    NO    DC      *-*       NO. OF TICK MARKS           V1H00500
                    H0001 EQU     PENUP     ADDRESS OF VALUE OF ONE     V1H00510
                    H0003 DC      3         MASK TO REMOVE BITS 0-13    V1H00520
                    FGRID DC      *-*       ENTRY POINT TO EGRID        V1H00530
                          STX   1 EXIT+1    SAVE XR1 AND XR2            V1H00540
                          STX   2 EXIT+3                                V1H00550
                          LDX  I1 FGRID     GET ADDRESSES OF PARAMETERS V1H00560
                          LDX   2 -5        XR2 IS LOOP COUNTER         V1H00570
                    GD1   LD    1 0                                     V1H00580
                          MDX   1 1                                     V1H00590
                          STO  L2 CNTL+5    PLACE PARAMETER ADDR IN TBL V1H00600
                          MDX   2 1         DECREMENT LOOP COUNTER      V1H00610
                          MDX     GD1       LOOP TILL 5TH ADDR MOVED    V1H00620
                          STX   1 EXIT+5    SAVE EXIT ADDRESS           V1H00630
                          LD      CNTL+3                                V1H00640
                          STO     *+1       ADDR OF INCREMENT PARAMETER V1H00650
                          LIBF    FLD       LOAD INCR TO REAL NO. ACC   V1H00660
                          DC      *-*       DELTA                       V1H00670
                          LD   I  CNTL                                  V1H00680
                          AND     H0003                                 V1H00690
                          STO     FGRID     GRID DIRECTION, BITS 14-15  V1H00700
                          S       H0001                                 V1H00710
                          BSC     Z-        SKIP IF GRID DIRECTION NEG  V1H00720
                          LIBF    SNR       REVERSE SIGN OF INCREMENT   V1H00730
                          LIBF    FSTO      STORE INCR FROM REAL ACC    V1H00740
                          DC      INC       GRID LINE INCREMENT         V1H00750
                          LD      FGRID     DETERMINE AXIS OF GRID LINE V1H00760
                          SLA     16                                    V1H00770
                          LD      XADD                                  V1H00780
                          BSC     C         SKIP IF ON X DIRECTION      V1H00790
                          LD      YADD                                  V1H00800
                          STO     DELTA     INITLZ PEN MOVEMENT WITH    V1H00810
                          STO     DELTA+4   ADDR OF X OR Y PARAMETER    V1H00820
                          LD   I  CNTL+4    GET NO,X AND Y              V1H00830
                          STO     NO        LENGTH OF GRID LINE         V1H00840
                          LDD  I  CNTL+1                                V1H00850
                          STD     X         INITIAL X POSITION          V1H00860
                          LDD  I  CNTL+2                                V1H00870
                          STD     Y         INITIAL Y POSITION          V1H00880
                          CALL    FPLOT     RAISE PEN AND MOVE TO X,Y   V1H00890
                          DC      PENUP     RAISE PEN CONTROL           V1H00900
                          DC      X         X POSITION                  V1H00910
                          DC      Y         Y POSITION                  V1H00920
                          CALL    FPLOT     LOWER PEN                   V1H00930
                          DC      PENDN     LOWER PEN CONTROL           V1H00940
                          DC      X         X POSITION                  V1H00950
                          DC      Y         Y POSITION                  V1H00960
                          CALL    POINT     DRAW TICK MARK              V1H00970
                          DC      PLUS      'PLUS' TICK MARK CONTROL    V1H00980
                    LOOP  LIBF    FLD       COMPUTE MOVEMENT            V1H00990
                    DELTA DC      *-*       X OR Y POSITION TO REAL ACC V1H01000
                          LIBF    FADD      ADD GRID LINE INCREMENT     V1H01010
                          DC      INC       INCREMENT ARGUMENT ADDRESS  V1H01020
                          LIBF    FSTO      EXECUTE EXTENDED PREC STORE V1H01030
                          DC      *-*       NEW X OR Y POSITION         V1H01040
                          CALL    FPLOT     MOVE PEN ALONG AXIS         V1H01050
                          DC      NOMOV     LEAVE PEN IN DOWN POSITION  V1H01060
                          DC      X         X POSITION                  V1H01070
                          DC      Y         Y POSITION                  V1H01080
                          CALL    POINT     DRAW TICK MARK              V1H01090
                          DC      PLUS      'PLUS' TICK MARK CONTROL    V1H01100
                          MDX  L  NO,-1     DECREMENT TICK MARK COUNTER V1H01110
                          MDX     LOOP      CONT TILL GRID LINE DONE    V1H01120
                          CALL    FPLOT     RAISE PEN                   V1H01130
                          DC      PENUP     RAISE PEN CONTROL           V1H01140
                          DC      X         X POSITION                  V1H01150
                          DC      Y         Y POSITION                  V1H01160
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1H01170
                          LDX  L2 *-*                                   V1H01180
                          BSC  L  *-*       RETURN TO CALLING PROGRAM   V1H01190
                          END                                           V1H01200
