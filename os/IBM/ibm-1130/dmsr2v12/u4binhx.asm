                          HDNG    BINARY TO HEXADECIMAL CONVERSION      U4C00010
                    ***   HDNG    LIBF BINHX-V1.                        U4C00020
                    *************************************************** U4C00030
                    *                                                 * U4C00040
                    *   SUBROUTINE NAME-                              * U4C00050
                    *      FULL NAME- BINARY TO HEXADECIMAL CONVERSION* U4C00060
                    *         SUBPROGRAM.                             * U4C00070
                    *      CODE NAME-BINHX                            * U4C00080
                    *   PURPOSE- THIS SUBPROGRAM CONVERTS A SINGLE    * U4C00090
                    *      WORD BINARY CONFIGURATION TO ITS 4-CHAR    * U4C00100
                    *      HEXADECIMAL EQUIVALENT.                    * U4C00110
                    *   METHOD- THE INPUT WORD IS PUT IN THE EXTENSION* U4C00120
                    *      AND SHIFTED 4 BITS AT A TIME INTO THE ACC. * U4C00130
                    *      BINARY 9 IS SUBTRACTED FROM THE 4 BITS TO  * U4C00140
                    *      DETERMINE IF IT IS NUMERIC OR ALPHA. A     * U4C00150
                    *      SHIFT IS GENERATED IN EITHER CASE TO       * U4C00160
                    *      CONSTRUCT THE HOLLERITH EQUIVALENT.        * U4C00170
                    *   CAPABILITIES AND LIMITATIONS- INPUT CAN BE ANY* U4C00180
                    *      SINGLE BINARY WORD.                        * U4C00190
                    *   SPECIAL FEATURES- N/A                         * U4C00200
                    *   ADDITIONAL INFORMATION-                       * U4C00210
                    *      ESTIMATED EXECUTION TIME-                  * U4C00220
                    *************************************************** U4C00230
                          HDNG    BINARY TO HEXADECIMAL CONVERSION      U4C00240
                          LIBR                                          U4C00250
                          ENT     BINHX                                 U4C00260
                    *                                                   U4C00270
                    BINHX STX   1 B33+1     CALL ENTRY POINT            U4C00280
                    LINK  LDX  I1 *-*       TV LINK WORD                U4C00290
                          STD     TEMPA     SAVE ACC AND EXT            U4C00300
                          STS     B35       SAVE STATUS                 U4C00310
                          LD    1 0         XR1= ADDR OUTPUT PARAM      U4C00320
                          STO     B26+1     ST OUTPUT ADDR              U4C00330
                          MDX   1 +1        OBTAIN RET ADDR AND         U4C00340
                          STX   1 B37+1     SET UP RET                  U4C00350
                          LDX   1 +4        SET XR1 TO COUNT 4 DIGITS   U4C00360
                    *                                                   U4C00370
                    *LOOP TO GET HEXADECIMAL DIGIT                      U4C00380
                    *                                                   U4C00390
                          LD      TEMPA     PUT VALUE IN EXTENSION      U4C00400
                          RTE     16                                    U4C00410
                    B20   SRA     16        CLEAR ACCUMULATOR           U4C00420
                          SLT     4         4-BIT CHARACTER             U4C00430
                          S       D0009     IS DIGIT ALPHABETIC         U4C00440
                          BSC  L  B40,Z-    YES, GO SET OVERFLOW INDR   U4C00450
                          A       D0009     NO,RESTORE 9 TO NUMERIC     U4C00460
                    B22   A       SHIFT     SET UP SHIFT INSTRUCTION    U4C00470
                          STO     B24                                   U4C00480
                          LD      H2000     ROW 0 BIT SET               U4C00490
                    B24   SRA     0         SET ROW BIT FOR DIGIT       U4C00500
                          BSC     O         IS CHAR ALPHA               U4C00510
                          A       H8000     YES, ADD ROW 12 BIT         U4C00520
                    B26   STO  L  0         STORE CHAR IN OUTPUT AREA   U4C00530
                          MDX  L  B26+1,+1  SET FOR NEXT OUTPUT WORD    U4C00540
                    B30   MDX   1 -1        ARE 4 DIGITS DONE YET       U4C00550
                          MDX     B20       NO, GET NEXT CHAR           U4C00560
                    B33   LDX  L1 *-*       YES, RESTORE XR1 AND XR2    U4C00570
                    B35   LDS     *-*       RESTORE STATUS              U4C00580
                          LDD     TEMPA     RESTORE ACC AND EXTENSION   U4C00590
                    B37   BSC  L  0         EXIT                        U4C00600
                    B40   LDS     1         SET OVERFLOW INDR IF        U4C00610
                          MDX     B22       THE CHAR IS ALPHA           U4C00620
                    *                                                   U4C00630
                    *CONSTANTS AND BUFFER AREA                          U4C00640
                    *                                                   U4C00650
                    D0009 DC      +9        DECIMAL 9                   U4C00660
                    H8000 DC      /8000     ROW 12 BIT                  U4C00670
                    H2000 DC      /2000     ROW 0 BIT                   U4C00680
                    SHIFT SRA     0         SHIFT CONSTANT              U4C00690
                    TEMPA BSS  E  2         ACC AND EXT TEMPORARY       U4C00700
                          END                                           U4C00710
