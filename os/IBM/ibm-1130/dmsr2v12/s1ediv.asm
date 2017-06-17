                    *************************************************** S1C00010
                    *                                                 * S1C00020
                    *   SUBROUTINE NAME                               * S1C00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1C00040
                    *         POINT DIVIDE FUNCTION.                  * S1C00050
                    *   CODE NAME- EDIV/EDIVX                         * S1C00060
                    *   PURPOSE- THIS FUNCTION COMPUTES THE QUOTIENT  * S1C00070
                    *      OF TWO EXTENDED PRECISION FLOATING-POINT   * S1C00080
                    *      NUMBERS.                                   * S1C00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1C00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1C00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1C00120
                    *   SPECIAL FEATURES- N/A                         * S1C00130
                    *   ADDITIONAL INFORMATION-                       * S1C00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1C00150
                    *         SUBROUTINE LIBRARY MANUAL               * S1C00160
                    *                                                 * S1C00170
                    *************************************************** S1C00180
                          HDNG    LIBF EDIV  -V1.                       S1C00190
                          LIBR                                          S1C00200
                          EPR                                           S1C00210
                          ENT     EDIV                                  S1C00220
                          ENT     EDIVX                                 S1C00230
                    EDIVX STX   1 EDX1+1    SAVE XR1                    S1C00240
                          LD   L  *-*       LOADER INSERT.              S1C00250
                          MDX     EDC                                   S1C00260
                    EDIV  STX   1 EDX1+1    SAVE XR1.                   S1C00270
                          LD   L  *-*       LOADER INSERT.              S1C00280
                          LDX   1 0         NO INDEXING.                S1C00290
                    EDC   STO     *+3                                   S1C00300
                          A       ONE+1     =1   SET UP EXIT.           S1C00310
                          STO     EDX1+3                                S1C00320
                          MDX  I1 *-*       OPND ADDRESS INTO XR1.      S1C00330
                          NOP               IF MDX CAUSES BR,SKIP NOP   S1C00340
                          LD    1 2         GET SECOND HALF OF DIVISOR  S1C00350
                          RTE     16        SHIFT TO EXTENSION          S1C00360
                          LD    1 1         GET FIRST HALF OF DIVISOR   S1C00370
                          BSC  L  DOVL,+-   BR IF DIVISOR ZERO          S1C00380
                          STD     DVR       IF NOT,STORE DIVISOR        S1C00390
                          LD    3 126       GET FIRST HALF OF DIVIDEND  S1C00400
                          BSC  L  EDX1,+-   IF ZERO,BR OUT              S1C00410
                          EOR   1 1         IF NOT,GET QUOTIENT SIGN    S1C00420
                          AND     EDCN      WIPE OUT ALL BUT SIGN BIT   S1C00430
                          STO     QSGN      SAVE SIGN OF QUOTIENT       S1C00440
                          BSC  L  *+3,+Z    BR IF SIGN NEG              S1C00450
                          LDD   3 126       SUBTRACT MAG. OF DIVISOR    S1C00460
                          SD      DVR       FROM DIVIDEND MAGNITUDE,    S1C00470
                          MDX     *+2       TO ENSURE DIVIDEND SMALLER  S1C00480
                          LDD   3 126       THAN DIVISOR.               S1C00490
                          AD      DVR                                   S1C00500
                          STD   3 126       DIVIDEND MINUS DIVISOR      S1C00510
                          BSC     +-        BRANCH IF ACC NON-ZERO      S1C00520
                          RTE     16        IF ACC ZERO, FETCH EXT      S1C00530
                          BSC  L  *+3,Z     BRANCH IF EXT NON-ZERO      S1C00540
                          LDD     DF1       IF ZERO,PUT A PROPERLY      S1C00550
                          OR      QSGN      SIGNED ONE IN FAC           S1C00560
                          MDX     X                                     S1C00570
                    *                                                   S1C00580
                    *DO COMPUTATION FOR MANTISSA AND EXPONENT           S1C00590
                    *                                                   S1C00600
                          LDD     DVR       IF NOT ZERO,PERFORM         S1C00610
                          LIBF    XDD       DIVISION                    S1C00620
                          EOR     EDCN      CHANGE THE SIGN             S1C00630
                          STD   3 126       STORE W/OPPOSITE SIGN       S1C00640
                          EOR     QSGN      PROPER SIGN ON QUOTIENT     S1C00650
                          BSC  L  CEXP,-    BR TO COMPUTE EXPONENT IF   S1C00660
                          EOR     QSGN      NOT NEG. IF NEG,CHANGE      S1C00670
                          BSC     -         SIGN. BR IF NOT ZERO.       S1C00680
                          AD      ONE       IF ZERO,ADD ONE             S1C00690
                          SRT     1                                     S1C00700
                          EOR     EDCN      RESTORE SIGN                S1C00710
                    X     STD   3 126       STORE COMPUTED QUOTIENT     S1C00720
                          EOR     QSGN      GET PROPER SIGN             S1C00730
                          BSC     +Z        BR IF NOT NEG               S1C00740
                          STO   3 126       IF NEG,STORE                S1C00750
                          LD    3 125       OTHERWISE,LEAVE FAC AS IS   S1C00760
                          A       ONE+1     INCR EXPONENT BY ONE        S1C00770
                          STO   3 125                                   S1C00780
                    CEXP  LD    3 125       COMPUTE QUOTIENT EXPONENT.  S1C00790
                          S     1 0                                     S1C00800
                          A       EDCN+1    =128                        S1C00810
                          STO   3 125                                   S1C00820
                          LIBF    FARC      CHK                         S1C00830
                    EDX1  LDX  L1 *-*       RESTORE XR1.                S1C00840
                          BSC  L  *-*       EXIT.                       S1C00850
                    DOVL  LD      ONE+1     TURN ON PROGRAM DIVIDE      S1C00860
                          STO   3 123       CHECK INDICATOR.            S1C00870
                          MDX     EDX1                                  S1C00880
                    *                                                   S1C00890
                    *CONSTANTS AREA                                     S1C00900
                    *                                                   S1C00910
                    QSGN  DC      0         STORE QUOTIENT SIGN         S1C00920
                    ONE   DEC     1         EXTENDED PREC ONE           S1C00930
                    DVR   DEC     0         DIVISOR BUFFER.             S1C00940
                    DF1   DEC     1.0B1     FLT PT ONE                  S1C00950
                    EDCN  DC      /8000     SIGN BIT MASK               S1C00960
                          DC      128       EXPONENT CON                S1C00970
                          END                                           S1C00980
