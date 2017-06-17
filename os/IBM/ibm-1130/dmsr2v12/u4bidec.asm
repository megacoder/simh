                          HDNG    TWO-WORD BINARY TO DECIMAL CONVERSION U4A00010
                    *************************************************** U4A00020
                    *                                                 * U4A00030
                    *   SUBROUTINE NAME-                              * U4A00040
                    *      FULL NAME- BINARY TO DECIMAL TWO-WORD      * U4A00050
                    *         INTEGER CONVERSION ROUTINE.             * U4A00060
                    *      CODE NAME- BIDEC                           * U4A00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A TWO- WORD * U4A00080
                    *      BINARY INTEGER TO A DECIMAL VALUE EXPRESSED* U4A00090
                    *      IN 11 WORDS CONTAINING 11 UNPACKED HOLL-   * U4A00100
                    *      ERITH CHARS.                               * U4A00110
                    *   METHOD-                                       * U4A00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4A00130
                    *   CAPABILITIES AND LIMITATIONS-                 * U4A00140
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4A00150
                    *   SPECIAL FEATURES- N/A                         * U4A00160
                    *   ADDITIONAL INFORMATION-                       * U4A00170
                    *      ESTIMATED EXECUTION TIME-                  * U4A00180
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4A00190
                    *                                                 * U4A00200
                    *************************************************** U4A00210
                          HDNG    TWO-WORD BINARY TO DECIMAL CONVERSION U4A00220
                          LIBR                                          U4A00230
                          ENT     BIDEC                                 U4A00240
                    BIDEC STX   1 SAV1+1     SAVE XR1                   U4A00250
                          LDX  I1 *-*        RECORD ENTRY               U4A00260
                          STD     SAVAQ      SAVE BINARY DATA AND       U4A00270
                          STS     SAVST      STATUS                     U4A00280
                    *                                                   U4A00290
                          STX   1 *+3        SAVE PARAMETER ADDR        U4A00300
                          MDX   1 +1         INCRE FOR RET              U4A00310
                          STX   1 BD060+1    SET UP TO RET              U4A00320
                    *                                                   U4A00330
                          LDX  I1 *-*        OUT ADDR TO XR1            U4A00340
                          MDX   1 -1                                    U4A00350
                          STX   1 BD040+1    SET UP OUTPUT ADDR         U4A00360
                          STX   2 SAV2+1     SAVE XR2                   U4A00370
                          LDD     SAVAQ                                 U4A00380
                          BSC  L  BD050,-    BR ON POSITIVE             U4A00390
                    *                                                   U4A00400
                          LD      H4000      SET SIGN OF NEG AND SET    U4A00410
                          STO     SIGN       TO STORE INTO BUFFER       U4A00420
                    *                                                   U4A00430
                    *                                                   U4A00440
                          SLT     32                                    U4A00450
                          SD      SAVAQ      TAKE COMPLEMENT TO CHK FOR U4A00460
                          BSC     -          LARGEST NEG NUMBER         U4A00470
                          STD     SAVAQ                                 U4A00480
                          MDX     BD010      GO TO HANDLE ON POSITIVE   U4A00490
                    *                                                   U4A00500
                          SRA     12         IF NEG, SET TO RETURN      U4A00510
                          STO  L1 11         DECIMAL VALUE OF LARGEST   U4A00520
                          LDX   1 10         NEGATIVE NUMBER.           U4A00530
                          LDD     DUMMY      FETCH MOD                  U4A00540
                          MDX     BD010+2    GO TO CONVERT              U4A00550
                    BD010 LDX   1 11         INITIAL XR1 FOR OUTPUTING  U4A00560
                          LDD     SAVAQ      FETCH BIN                  U4A00570
                          STO     HIHAF+1    SET UP HIGH ORDER HALF     U4A00580
                          SLT     16         AND                        U4A00590
                          STO     LOHAF+1    LOW ORDER HALF FOR CONVERT U4A00600
                    *                                                   U4A00610
                    *                                                   U4A00620
                    BD020 LDD     HIHAF                                 U4A00630
                          D       TEN        DIVIDE OUT TENS            U4A00640
                          STO     HIHAF+1    RE-STORE RESULT            U4A00650
                    *                                                   U4A00660
                          SLT     16         ADD REMAINDER              U4A00670
                          AD      LOHAF      TO LOW ORDER HALF          U4A00680
                          D       TEN        AND DIVIDE OUT TENS.       U4A00690
                          STO     LOHAF+1    RE-STORE RESULT            U4A00700
                    *                                                   U4A00710
                          RTE     16         SET TO SHIFT               U4A00720
                          OR      SHIFT      BY VALUE OF PREVIOUSLY     U4A00730
                          STO     BD030      SET UP SHIFT INSTRUCTION.  U4A00740
                    *                                                   U4A00750
                          LD      H2000      HOLL ZERO (TWO BIT ON)     U4A00760
                    BD030 SRA     *-*        SHIFT INTO POSITION        U4A00770
                    BD040 STO  L1 *-*        ST INTO OUTPUT BUFFER      U4A00780
                          MDX   1 -1         DECR XR1                   U4A00790
                          MDX     BD020      GO TO CONVERT NEXT CHAR    U4A00800
                    *                                                   U4A00810
                          LD      SIGN                                  U4A00820
                          MDX  L  BD040+1,+1  INCR OUTPUT ADDR          U4A00830
                          STO  I  BD040+1    SET SIGN INTO BUFFER       U4A00840
                    SAV1  LDX  L1 *-*        RESTORE XR1                U4A00850
                    SAV2  LDX  L2 *-*        RESTORE XR2                U4A00860
                    SAVST LDS     0          RESTORE STATUS             U4A00870
                          LDD     SAVAQ      STORE INTO OUTPUT BUFFER   U4A00880
                    BD060 BSC  L  *-*        RETURN TO CALLER           U4A00890
                    *                                                   U4A00900
                    BD050 LD      H80A0      SET SIGN                   U4A00910
                          STO     SIGN       TO POSITIVE.               U4A00920
                          MDX     BD010      GO TO CONVERT BINARY       U4A00930
                    *                                                   U4A00940
                    ONE   DC      1          CONSTANT ONE               U4A00950
                    TEN   DC      10         CONSTANT TEN               U4A00960
                    H80A0 DC      /80A0      HOLL  PLUS                 U4A00970
                    H4000 DC      /4000      HOLL  MINUS                U4A00980
                    H2000 DC      /2000      HOLL  ZERO                 U4A00990
                    SIGN  DC      0          TEMP STG FOR SIGN          U4A01000
                    SHIFT SRA     *-*        MOVE BIT TO POSITION       U4A01010
                    *                                                   U4A01020
                    DUMMY DEC     214748364.B31   2**30 -8              U4A01030
                    SAVAQ DEC     0          TEMP BINARY BUFFER         U4A01040
                    LOHAF DEC     0          TEMP FOR LOW ORDER         U4A01050
                    HIHAF DEC     0          TEMP FOR HIGH ORDER        U4A01060
                          END                                           U4A01070
