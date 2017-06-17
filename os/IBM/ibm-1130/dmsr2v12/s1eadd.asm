                    *************************************************** S1A00010
                    *                                                 * S1A00020
                    *   SUBROUTINE NAME-                              * S1A00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1A00040
                    *         POINT ADD OR SUBTRACT SUBROUTINE.       * S1A00050
                    *      CODE NAME- EADD/EADDX/ESUB/ESUBX           * S1A00060
                    *   PURPOSE- THIS SUBPROGRAM PERFORMS A FLOATING- * S1A00070
                    *      POINT ADD OR SUBTRACT OF TWO EXTENDED      * S1A00080
                    *      PRECISION NUMBERS.                         * S1A00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1A00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1A00120
                    *   SPECIAL FEATURES- N/A                         * S1A00130
                    *   ADDITIONAL INFORMATION-                       * S1A00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1A00150
                    *         SUBROUTINE LIBRARY MANUAL               * S1A00160
                    *                                                 * S1A00170
                    *************************************************** S1A00180
                          HDNG    LIBF EADD  -V1.                       S1A00190
                          LIBR                                          S1A00200
                          EPR                                           S1A00210
                          ENT     EADD                                  S1A00220
                          ENT     ESUB                                  S1A00230
                          ENT     EADDX                                 S1A00240
                          ENT     ESUBX                                 S1A00250
                    *                                                   S1A00260
                    *SUBTRACT ENTRIES                                   S1A00270
                    *                                                   S1A00280
                    ESUB  STX   1 SAVE+1    SAVE XR1                    S1A00290
                          LD   L  *-*       LOADER INSERT               S1A00300
                          LDX   1 0         XR1 NOT USED,SET TO ZERO    S1A00310
                          MDX     ES1                                   S1A00320
                    ESUBX STX   1 SAVE+1                                S1A00330
                          LD   L  *-*       LOADER INSERT               S1A00340
                    ES1   STS     STAT                                  S1A00350
                          LDS     1         SUBTRACT ENTRY, OVERFLOW ON S1A00360
                          MDX     COMM                                  S1A00370
                    *                                                   S1A00380
                    *ADD ENTRIES                                        S1A00390
                    *                                                   S1A00400
                    EADD  STX   1 SAVE+1    SAVE XR1                    S1A00410
                          LD   L  *-*       LOADER INSERT               S1A00420
                          LDX   1 0         XR1 NOT USED,SET TO ZERO    S1A00430
                          STS     STAT                                  S1A00440
                          MDX     COMM                                  S1A00450
                    EADDX STX   1 SAVE+1    SAVE XR1                    S1A00460
                          LD   L  *-*       LOADER INSERT               S1A00470
                          STS     STAT                                  S1A00480
                    *                                                   S1A00490
                    *GET RETURN ADDRESS,AND LOAD ADDEND                 S1A00500
                    *                                                   S1A00510
                    COMM  STO     *+3                                   S1A00520
                          A       ONE                                   S1A00530
                          STO     EXIT+1    BUILD EXIT                  S1A00540
                          MDX  I1 *-*       MODIFY XR1 BY OPND ADDR     S1A00550
                          NOP               MAY SKIP                    S1A00560
                          LD    1 2         GET THE TWO WORD ADDEND     S1A00570
                          RTE     16        MANTISSA TO ACC AND EXT     S1A00580
                          LD    1 1                                     S1A00590
                          BSC  L  SARG,O    IF SUB ENTRY,BR TO REVERSE  S1A00600
                    *                       SIGN OF SUBTRAHEND          S1A00610
                    *COMPUTE AND PERFORM SHIFT ON ADDEND,PERFORM ADD    S1A00620
                    *                                                   S1A00630
                    STB   STD     BARG      SAVE ADDEND (OR SUBTRAHEND) S1A00640
                          LD    1 0         GET ADDEND EXPONENT,SAVE    S1A00650
                          STO     TEMP                                  S1A00660
                          S     3 125       SUB AUGEND EXPONENT         S1A00670
                          BSC  L  FLIP,-Z   BR TO FLIP IF ADDEND LARGER S1A00680
                          EOR     ALL1      MAKE SHIFT CONSTANT OF TWOS S1A00690
                          A       SRT1      COMPLEMENT OF DIFFERENCE    S1A00700
                          STO     RTS                                   S1A00710
                          S       RANGK     CHECK RANGE OF SHIFT        S1A00720
                          BSC  L  NORM+1,-Z IF GT 31,GO RET ONLY (FAC)  S1A00730
                          LD      BARG      GET ADDEND                  S1A00740
                          BSC     +Z        IF NEG,SUB ONE FOR 2S COMP- S1A00750
                          SD      D1        LEMENT ADJUSTMENT.          S1A00760
                    RTS   SRT     *-*       SCALE TO MATCH AUGEND       S1A00770
                          BSC     +Z        IF NEG,RESTORE ONE          S1A00780
                          AD      D1                                    S1A00790
                          AD    3 126       PERFORM ADDITION/SUB        S1A00800
                    *                                                   S1A00810
                    *PREPARE TO EXIT                                    S1A00820
                    *                                                   S1A00830
                    NORM  STD   3 126       SAVE SUM IN FAC             S1A00840
                          BSC  L  OFLW,O    IF OVFLO,BR TO SHIFT RT     S1A00850
                          LIBF    NORM      NORMALIZE RSLT              S1A00860
                    OFT   LIBF    FARC      SET ERROR CONDITIONS        S1A00870
                    STAT  LDS     *-*       RESTORE STATUS              S1A00880
                    SAVE  LDX  L1 *-*       RESTORE XR1                 S1A00890
                    EXIT  BSC  L  *-*       RET TO MAIN PROG            S1A00900
                    *                                                   S1A00910
                    *REVERSE THE ROLE OF ADDEND AND AUGEND              S1A00920
                    *                                                   S1A00930
                    FLIP  A       SRTO      SHIFT RT 0 CONSTANT         S1A00940
                          STO     RTSF      SAVE SCALE SHIFT            S1A00950
                          S       RANGK     CHECK RANGE OF SHIFT        S1A00960
                          BSC  L  *+2,+     IF OUT OF RANGE,SET         S1A00970
                          LD      RANGK     SCALE SHIFT TO 31.          S1A00980
                          STO     RTSF                                  S1A00990
                          LD      TEMP      GET ADDEND EXPONENT AND     S1A01000
                          STO   3 125       PUT IN FAC                  S1A01010
                          LDD   3 126       GET AUGEND                  S1A01020
                          BSC     +Z        IF NEG,SUB ONE FOR 2S COMP- S1A01030
                          SD      D1        LEMENT ADJUSTMENT.          S1A01040
                    RTSF  SRT     *-*       SCALE SHIFT                 S1A01050
                          BSC     +Z        IF NEG,RESTORE ONE          S1A01060
                          AD      D1                                    S1A01070
                          AD      BARG      PERFORM ADD/SUB             S1A01080
                          MDX     NORM      RET TO NORMALIZE RSLT       S1A01090
                    *                                                   S1A01100
                    *IF SUBTRACT ENTRY USED,REVERSE SIGN OF SUBTRAHEND  S1A01110
                    *                                                   S1A01120
                    SARG  STD     BARG      SAVE ADDEND                 S1A01130
                          SLT     32        REVERSE SIGN, RESULT        S1A01140
                          SD      BARG      IN ACC AND EXT.             S1A01150
                          MDX     STB       GO TO COMPUTE SUM           S1A01160
                    *                                                   S1A01170
                    *CONSTANTS AND BUFFER AREA                          S1A01180
                    *                                                   S1A01190
                    BARG  DEC     0.0       ADDEND MANTISSA BUFFER      S1A01200
                    TEMP  DC      /0        ADDEND EXPONENT STG         S1A01210
                    ALL1  DC      /FFFF     TWOS COMPLEMENT MASK        S1A01220
                    SRTO  SRT     0         SHIFT CONSTANT              S1A01230
                    RANGK SRT     31        SHIFT RANGE CONSTANT        S1A01240
                    D1    DEC     1         TWO WORD ONE                S1A01250
                    SINK  DC      /8000     SIGN BIT MASK               S1A01260
                    *                                                   S1A01270
                    *SHIFT RSLT RT ONE TO COMPENSATE FOR OVERFLOW.      S1A01280
                    *                                                   S1A01290
                    OFLW  SRT     1         PERFORM SHIFT AND           S1A01300
                          EOR     SINK      CORRECT SIGN BIT.           S1A01310
                          STD   3 126                                   S1A01320
                          LD    3 125       INCREMENT RSLT EXPONENT     S1A01330
                          A       ONE       BY ONE TO COMPENSATE FOR    S1A01340
                          STO   3 125       SHIFT.                      S1A01350
                          MDX     OFT       GO TO EXIT                  S1A01360
                    SRT1  EQU     OFLW      DEFINE SHIFT RT 1 CON       S1A01370
                    ONE   EQU     D1+1      DEFINE SINGLE WORD ONE      S1A01380
                          END                                           S1A01390
