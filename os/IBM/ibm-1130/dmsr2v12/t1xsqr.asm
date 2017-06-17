                    *************************************************** T1C00010
                    *                                                 * T1C00020
                    *   SUBROUTINE NAME-                              * T1C00030
                    *      FULL NAME- FIXED-POINT (FRACTIONAL) SQUARE * T1C00040
                    *         ROOT FUNCTION                           * T1C00050
                    *      CODE NAME- XSQR                            * T1C00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE SQUARE  * T1C00070
                    *      ROOT OF A FIXED POINT ONE-WORD FRACTIONAL  * T1C00080
                    *      NUMBER.                                    * T1C00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* T1C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * T1C00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * T1C00120
                    *   SPECIAL FEATURES- N/A                         * T1C00130
                    *   ADDITIONAL INFORMATION-                       * T1C00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * T1C00150
                    *         SUBROUTINE LIBRARY MANUAL               * T1C00160
                    *                                                 * T1C00170
                    *************************************************** T1C00180
                          HDNG    CALL XSQR  -V1.                       T1C00190
                          ENT     XSQR                                  T1C00200
                    XSQR  DC      *-*       ENTRY/RETURN ADDRESS        T1C00210
                          STO     A         SAVE ARGUMENT (BINARY POINT T1C00220
                          BSC  L  OK,-      BETWEEN SIGN AND ONE BIT)   T1C00230
                          SLA     16        IF ARGUMENT IS NEGATIVE,    T1C00240
                          S       A         USE MAGNITUDE AND TURN ON   T1C00250
                          STO     A         OVERFLOW INDICATOR.         T1C00260
                          LDS     3                                     T1C00270
                    OK    BSC  L  XSQX,+    SHORT CUT FOR 0.0 AND -1.0  T1C00280
                          STX   1 EXIT+1    SAVE XR1                    T1C00290
                          LDX   1 15        SET CTR FOR TABLE REF.      T1C00300
                          LD      A         INITIAL APPROXIMATION       T1C00310
                          SLCA  1           IS A FUNCTION OF            T1C00320
                          LD   L1 TABLE     LEADING ZERO BITS.          T1C00330
                    LOOP  STO     FN        SAVE APPROXIMATION          T1C00340
                          M       FN        CALC AN EXPRESSION CALLED   T1C00350
                          SLT     1         ERROR.                      T1C00360
                          S       A         ERROR=FN*FN-A               T1C00370
                          SRT     2         DIV BY 2,ADJUST BINARY PT.  T1C00380
                          D       FN        DELTA=0.5*ERROR/FN          T1C00390
                          BSC  L  EXIT,+    EXIT WHEN DELTA=0.0         T1C00400
                          STO     DELTA     OTHERWISE SAVE DELTA        T1C00410
                          LD      FN        MODIFY THE APPROXIMATION    T1C00420
                          S       DELTA     BY DELTA.FN=FN-DELTA.       T1C00430
                          MDX     LOOP      REPEAT LOOP                 T1C00440
                    EXIT  LDX  L1 *-*       RESTORE XR1                 T1C00450
                          LD      FN        PUT RESULT IN ACC           T1C00460
                    XSQX  BSC  I  XSQR      RETURN TO MAIN PROG         T1C00470
                    *                                                   T1C00480
                    *CONSTANTS AREA                                     T1C00490
                    *                                                   T1C00500
                          BSS  E  0                                     T1C00510
                    DELTA DC      0         MODIFICATION BUFFER         T1C00520
                    FN    DC      0         APPROXIMATION BUFFER        T1C00530
                    A     DC      0         SAVE INPUT MAGNITUDE        T1C00540
                    TABLE DC      /00B6     0   TABLE OF INITIAL APPROX T1C00550
                          DC      /013A     1   IMATIONS BASED ON THE   T1C00560
                          DC      /01DF     2   NUMBER OF INITIAL ZEROS T1C00570
                          DC      /02BE     3   IN THE INPUT ARGUMENT.  T1C00580
                          DC      /03F0     4                           T1C00590
                          DC      /059D     5                           T1C00600
                          DC      /07F8     6                           T1C00610
                          DC      /0B4B     7                           T1C00620
                          DC      /0FFC     8                           T1C00630
                          DC      /169E     9                           T1C00640
                          DC      /1FFE     10                          T1C00650
                          DC      /2D40     11                          T1C00660
                          DC      /3FFF     12                          T1C00670
                          DC      /5A82     13                          T1C00680
                          DC      /7FFF     14                          T1C00690
                          END                                           T1C00700
