                    *************************************************** R1A00010
                    *                                                 * R1A00020
                    *   SUBROUTINE NAME-                              * R1A00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1A00040
                    *         POINT ADD-SUBTRACT SUBPROGRAM.          * R1A00050
                    *      CODE NAME- FADD/FADDX/FSUB/FSUBX           * R1A00060
                    *   PURPOSE- THIS SUBPROGRAM ADDS OR SUBTRACTS    * R1A00070
                    *      TWO STANDARD PRECISION FLOATING POINT      * R1A00080
                    *      NUMBERS.                                   * R1A00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1A00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1A00120
                    *   SPECIAL FEATURES- N/A                         * R1A00130
                    *   ADDITIONAL INFORMATION-                       * R1A00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1A00150
                    *         SUBROUTINE LIBRARY MANUAL               * R1A00160
                    *                                                 * R1A00170
                    *************************************************** R1A00180
                          HDNG    LIBF FADD  -V1.                       R1A00190
                          LIBR                                          R1A00200
                          SPR                                           R1A00210
                          ENT     FADD                                  R1A00220
                          ENT     FSUB                                  R1A00230
                          ENT     FADDX                                 R1A00240
                          ENT     FSUBX                                 R1A00250
                    FSUB  STX   1 SAVE+1    SAVE XR1                    R1A00260
                          LD   L  *-*       CALL+1                      R1A00270
                          LDX   1 0         XR1=ZERO                    R1A00280
                          MDX     FS1                                   R1A00290
                    FSUBX STX   1 SAVE+1    SAVE XR1                    R1A00300
                          LD   L  *-*       CALL+1                      R1A00310
                    FS1   STS     STAT      SAVE STATUS                 R1A00320
                          LDS     1         SINCE SUB ENTRY IS USED PUT R1A00330
                          MDX     COMM      OVERFLOW INDICATOR ON       R1A00340
                    FADD  STX   1 SAVE+1    SAVE XR1                    R1A00350
                          LD   L  *-*       CALL+1                      R1A00360
                          LDX   1 0         XR1=ZERO                    R1A00370
                          STS     STAT      SAVE STATUS                 R1A00380
                          MDX     COMM                                  R1A00390
                    FADDX STX   1 SAVE+1    SAVE XR1                    R1A00400
                          LD   L  *-*       CALL+1                      R1A00410
                          STS     STAT      SAVE STATUS                 R1A00420
                    COMM  STO     *+3       ST LOC OF OPND ADDR         R1A00430
                          A       ONE                                   R1A00440
                          STO     EXIT+1    BUILD EXIT                  R1A00450
                          MDX  I1 *-*       MODIFY XR1 BY OPND ADDR     R1A00460
                          NOP               IF MDX CAUSES BR,SKIP NOP   R1A00470
                    *                                                   R1A00480
                    *SAVE ADDEND MANTISSA AND EXPONENT                  R1A00490
                    *                                                   R1A00500
                          LDD   1 0         LOAD OPERAND                R1A00510
                          STD     BARG      ST OPND IN BARG             R1A00520
                          RTE     16        SECOND WORD OF OPND IN ACC  R1A00530
                          STS     *+2       STATUS INDRS SET TO ZERO    R1A00540
                          STS     BARG+1    STRIP OFF EXPONENT          R1A00550
                          EOR     BARG+1    EXPONENT ONLY IN ACC        R1A00560
                          LDS     *-*       RESTORE STATUS              R1A00570
                          STO     BEX       STORE EXPONENT IN BEX       R1A00580
                          BSC  L  SARG,O    BRANCH ON OVERFLOW TO SUBR  R1A00590
                    *                                                   R1A00600
                    *DO REQUIRED ADDITION OR SUBTRACTION                R1A00610
                    *                                                   R1A00620
                    CALS  S     3 125       SUB FAC EXPONENT FROM BEX   R1A00630
                          BSC  L  FLIP,-Z   BR ON PTV                   R1A00640
                          EOR     ALL1      IF NEG OR ZERO,2'S CMPL     R1A00650
                          A       SRT1      STORE SHIFT                 R1A00660
                          STO     RTS                                   R1A00670
                          S       RANGK     SRT31 TO CHK RANGE          R1A00680
                          BSC  L  NORM+1,-Z BR IF OUT OF RANGE          R1A00690
                          LDD     BARG      IN RANGE,GET ADDEND         R1A00700
                          BSC     +Z        SKIP IF NON-NEG             R1A00710
                          SD      D1        IF NEG,SUB 1                R1A00720
                    RTS   SRT     *-*       CORR FOR EXPONENT SHIFT     R1A00730
                          BSC     +Z        SKIP IF NON-NEG             R1A00740
                          AD      D1        IF NEG,ADD 1                R1A00750
                          AD    3 126       ADD FAC MANTISSA            R1A00760
                    NORM  STD   3 126       STORE IN FAC                R1A00770
                          BSC  L  OFLW,O    BR IF OVERFLOW INDR ON      R1A00780
                          LIBF    NORM      OTHERWISE NORMALIZE         R1A00790
                    OFT   LIBF    FARC      CALL CHKING SUBR            R1A00800
                    STAT  LDS     *-*       RESTORE STATUS              R1A00810
                    SAVE  LDX  L1 *-*       RESTORE XR1                 R1A00820
                    EXIT  BSC  L  *-*       BR OUT                      R1A00830
                    *                                                   R1A00840
                    *CALCULATE AND ALLOW FOR RSLT EXPONENT SHIFT        R1A00850
                    *                                                   R1A00860
                    FLIP  A       SRTO                                  R1A00870
                          STO     RTSF      CONSTRUCT EXPONENT SHIFT    R1A00880
                          S       RANGK     SUB SRT31 TO CHECK RANGE    R1A00890
                          BSC  L  *+2,+     BR IF IN RANGE              R1A00900
                          LD      RANGK     OUT OF RANGE,SET UP SRT31   R1A00910
                          STO     RTSF      GET ADDEND EXPONENT         R1A00920
                          LD      BEX                                   R1A00930
                          STO   3 125       AND PUT IN FAC              R1A00940
                          LDD   3 126       GET FAC MANTISSA            R1A00950
                          BSC     +Z        SKIP IF NON-NEG             R1A00960
                          SD      D1        IF NEG SUB 1                R1A00970
                    RTSF  SRT     *-*       SHIFT TO ALLOW FOR EXPONENT R1A00980
                          BSC     +Z        SKIP IF NON-NEG             R1A00990
                          AD      D1        IF NEG ADD 1                R1A01000
                          AD      BARG      ADD THE TWO MANTISSAS       R1A01010
                          MDX     NORM      GO TO NORMALIZE             R1A01020
                    *                                                   R1A01030
                    *MODIFY SIGN FOR SUBTRACT ROUTINES                  R1A01040
                    *                                                   R1A01050
                    SARG  SLT     32        CLEAR ACC AND EXT           R1A01060
                          SD      BARG      REVERSE SIGN OF ADDEND      R1A01070
                          STD     BARG                                  R1A01080
                          LD      BEX       GET EXPONENT OF ADDEND      R1A01090
                          MDX     CALS                                  R1A01100
                    *                                                   R1A01110
                    *CONSTANTS TABLE                                    R1A01120
                    *                                                   R1A01130
                    BARG  DEC     0.0       STORE ADDEND                R1A01140
                    BEX   DC      0         STORE ADDEND EXPONENT       R1A01150
                    ALL1  DC      /FFFF     ONE'S CMPL MASK             R1A01160
                    SRTO  SRT     0         SHIFT CONSTANT              R1A01170
                    RANGK SRT     31        RANGE CHECK CONSTANT        R1A01180
                    D1    DEC     1         FLT PT ONE                  R1A01190
                    SINK  DC      /8000     SIGN BIT MASK               R1A01200
                    *                                                   R1A01210
                    *DO SHIFT TO ALLOW FOR OVERFLOW                     R1A01220
                    *                                                   R1A01230
                    OFLW  SRT     1         SHIFT RESULT RIGHT          R1A01240
                          EOR     SINK      AND REVERSE SIGN BIT        R1A01250
                          STD   3 126       STORE IN FAC                R1A01260
                          LD    3 125       COMPENSATE BY INCRING       R1A01270
                          A       ONE       EXPONENT BY 1               R1A01280
                          STO   3 125                                   R1A01290
                          MDX     OFT                                   R1A01300
                    *                                                   R1A01310
                    *EQUATE STATEMENTS                                  R1A01320
                    *                                                   R1A01330
                    SRT1  EQU     OFLW      DEFINE CONSTANT SRT1        R1A01340
                    ONE   EQU     D1+1      DEFINE SINGLE WORD ONE      R1A01350
                          END                                           R1A01360
