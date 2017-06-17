                          HDNG    TWO-WORD DECIMAL TO BINARY CONVERSION U4H00010
                    *************************************************** U4H00020
                    *                                                 * U4H00030
                    * STATUS - VERSION 2, MODIFICATION 8                U4H00035
                    *   SUBROUTINE NAME-                              * U4H00040
                    *      FULL NAME- DECIMAL TO BINARY TWO-WORD      * U4H00050
                    *         INTEGER CONVERSION ROUTINE.             * U4H00060
                    *      CODE NAME- DECBI                           * U4H00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A DECIMAL   * U4H00080
                    *      INTEGER EXPRESSED AS ONE TO TEN DIGITS     * U4H00090
                    *      PLUS A SIGN IN UNPACKED HOLLERITH,TO A TWO-* U4H00100
                    *      WORD BINARY INTEGER.                       * U4H00110
                    *   METHOD-                                       * U4H00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4H00130
                    *   CAPABILITIES AND LIMITATIONS-                 * U4H00140
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4H00150
                    *   SPECIAL FEATURES-N/A                          * U4H00160
                    *   ADDITIONAL INFORMATION-                       * U4H00170
                    *      ESTIMATED EXECUTION TIME-                  * U4H00180
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4H00190
                    *                                                 * U4H00200
                    *************************************************** U4H00210
                          HDNG    TWO-WORD DECIMAL TO BINARY CONVERSION U4H00220
                          LIBR                                          U4H00230
                          ENT     DECBI                                 U4H00240
                    DECBI STX   1 SAV1+1     SAVE XR1                   U4H00250
                          LDX  I1 *-*        RECORD ENTRY               U4H00260
                          STS     DB055      SAVE AND RESET STATUS      U4H00270
                          STX   2 SAV2+1     SAVE XR2                   U4H00280
                    *                                                   U4H00290
                          LD    1 0                                     U4H00300
                          STO     DB000+1    SET UP ADDR OF SIGN        U4H00310
                          A       ONE               AND                 U4H00320
                          STO     DB030+1    SET UP INPUT BUFFER ADDR   U4H00330
                    *                                                   U4H00340
                          MDX   1 +1                                    U4H00350
                          LD   I1 0          FETCH WORD CNT             U4H00360
                          SLA     1          DOUBLE WORD COUNT          U4H00370
                          STO     DB020+1    SET UP WORD COUNT          U4H00380
                          MDX   1 1                                 2-8 U4H00381
                          STX   1 DB060+1    SET UP FOR EXIT        2-8 U4H00382
                    *                                                   U4H00390
                    DB000 LD   L  *-*        FETCH SIGN                 U4H00400
                          STO     SIGN       INITIAL TO NEG             U4H00410
                    *                                                   U4H00420
                          BSC  L  DB010,+-   GO TO SET PLUS ON ZERO     U4H00430
                    *                                                   U4H00440
                          S       H4000                                 U4H00450
                          BSC  L  DB010+2,+-  GO TO CONT ON MINUS       U4H00460
                    *                                                   U4H00470
                          S       H4000                                 U4H00480
                          BSC  L  DB010,+-   GO SET PLUS ON AMPERSAND   U4H00490
                    *                                                   U4H00500
                          S       H00A0                                 U4H00510
                          BSC  L  DB070,Z    GO TO ERROR - INVALID SIGN U4H00520
                    *                                                   U4H00530
                    DB010 SLA     16         SET SIGN                   U4H00540
                          STO     SIGN       TO PLUS.                   U4H00550
                    *                                                   U4H00560
                    *                                                   U4H00570
                    *     STATEMENTS REMOVED                        2-8 U4H00590
                    *                                                   U4H00600
                          SLT     32                                    U4H00610
                          STD     BIBFR      INITIAL BINARY BFR, WD SW  U4H00620
                          LDS     0          CLEAR OVERFLOW,CARRY   2-8 U4H00621
                    *                                                   U4H00630
                    DB020 LDX  L1 *-*        INITIAL FOR ADD LOOP AND   U4H00640
                          LDX   2 +12        SHIFTS.                    U4H00650
                    *                                                   U4H00660
                    DB030 LD   L  *-*        FETCH WORD                 U4H00670
                    *                                                   U4H00680
                          SRT     14         CHECK ZONE BITS            U4H00690
                          BSC  L  DB070,Z    GO TO ERROR IF NON-ZERO    U4H00700
                          SLT     14         RESTORE WORD               U4H00710
                          MDX  L  DB030+1,+1 INCRE INPUT ADDR           U4H00720
                          BSC  L  DB040,+-   BR IF CHAR IS BLANK        U4H00730
                    *                                                   U4H00740
                          SLCA  2 0          BIT POSITION TO XR2        U4H00750
                          SLA     1          SHIFT OUT BIT              U4H00760
                          BSC  L  DB070,Z    BR TO ERROR IF MULTI-BITS  U4H00770
                          MDX   2 -10        SUB 9 TO GET NEG BIN VALUE U4H00780
                          NOP                                           U4H00790
                    *                                                   U4H00800
                          STX   2 TEMP       SET TO TAKE THE            U4H00810
                          SLA     16         COMPLEMENT OF NEG TO GET   U4H00820
                          S       TEMP       ACTUAL BINARY VALUE        U4H00830
                          STO     TEMP                                  U4H00840
                    *                                                   U4H00850
                          LDX  I2 TEMP       ACTUAL BIN VALUE TO XR2    U4H00860
                    *                                                   U4H00870
                          MDX   2 0          IS ACTUAL VALUE ZERO       U4H00880
                          MDX     DB045      NO, GO TO CONTINUE         U4H00890
                    *                                                   U4H00900
                    DB040 MDX   1 -2         YES, DECR WORD COUNT       U4H00910
                          MDX     DB030-1    GO TO LOAD NEXT WRD        U4H00920
                          MDX     DB050      WD  CNT ZERO - GO TO EXIT  U4H00930
                    *                                                   U4H00940
                    DB045 LDD     BIBFR      FETCH BINARY BUFFER        U4H00950
                          AD   L1 TABLE-2    ADD APPROP POWER OF TEN    U4H00960
                          MDX   2 -1         DECR BINARY NUMBER         U4H00970
                          MDX     DB045+1    LOOP TIL NUMBER = ZERO     U4H00980
                    *                                                   U4H00990
                          STD     BIBFR      RESULT TO BUFFER           U4H01000
                          MDX     DB040      GO TO CHK WORD COUNT       U4H01010
                    *                                                   U4H01020
                    DB050 BSC     O          CHECK OVERFLOW             U4H01030
                          MDX     DB065      POSSIBLE ERROR IF ON       U4H01040
                    *                                                   U4H01050
                          LD      SIGN                                  U4H01060
                          BSC     +-         SKIP ON NON-ZERO           U4H01070
                    *                                                   U4H01080
                          MDX     DB055      BR ON POSITIVE             U4H01090
                    *                                                   U4H01100
                          SLT     32         CLEAR ACC AND EXT          U4H01110
                          SD      BIBFR      TAKE 2'S COMPLEMENT        U4H01120
                          MDX     SAV1       SKIP TO EXIT               U4H01130
                    *                                                   U4H01140
                    DB055 LDS     *-*        RESTORE STATUS             U4H01150
                          LDD     BIBFR      RESTORE ACC AND EXT        U4H01160
                    *                                                 * U4H01170
                    SAV1  LDX  L1 *-*        RESTORE XR1                U4H01180
                    SAV2  LDX  L2 *-*        RESTORE XR2                U4H01190
                    *                                                   U4H01200
                    *                                                   U4H01210
                    DB060 BSC  L  *-*        RETURN TO CALLER           U4H01220
                    *                                                   U4H01230
                    DB065 EOR     MAXNG      CHECK FOR MAX NEG VALUE    U4H01240
                          BSC  L  DB070,Z    GO TO ERROR ON NOT MAX NEG U4H01250
                          MDX     DB050+2    OVERFLOW OK, GO TO EXIT    U4H01260
                    *                                                 * U4H01270
                    *  ERROR TRAP                                     * U4H01280
                    DB070 LDS     1          SET OVFLO ON, CARRY OFF    U4H01290
                          MDX     DB055+1    GO TO EXIT                 U4H01300
                    *                                                   U4H01310
                    *                                                   U4H01320
                    H4000 DC      /4000      MINUS                      U4H01330
                    H00A0 DC      /00A0      RT HALF OF PLUS            U4H01340
                    *                                                   U4H01350
                    BIBFR DEC     0          WORKING BFR FOR BINARY NO. U4H01360
                    MAXNG DC      /8000      MAXIMUM NEGATIVE           U4H01370
                          DC      0          VALUE                      U4H01380
                    *                                                   U4H01390
                    ONE   DC      1                                     U4H01400
                    TEMP  DC      0          STORAGE FOR NEG BIN VALUE  U4H01410
                    SIGN  DC      0          STORAGE FOR SIGN           U4H01420
                    *                                                   U4H01430
                    *  FOLLOWING IS A BINARY TABLE OF THE             * U4H01440
                    *  POWERS OF 10 FROM 0 TO 9.                      * U4H01450
                    TABLE DEC     1.0B31                                U4H01460
                          DEC     10.0B31                               U4H01470
                          DEC     100.0B31                              U4H01480
                          DEC     1000.0B31                             U4H01490
                          DEC     10000.0B31                            U4H01500
                          DEC     100000.0B31                           U4H01510
                          DEC     1000000.0B31                          U4H01520
                          DEC     10000000.0B31                         U4H01530
                          DEC     100000000.0B31                        U4H01540
                          DEC     1000000000.0B31                       U4H01550
                          END                                           U4H01560
