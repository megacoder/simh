                          HDNG    INTEGER BINARY TO DECIMAL CONVERSION  U4B00010
                    *************************************************** U4B00020
                    *                                                 * U4B00030
                          HDNG    INTEGER BINARY TO DECIMAL CONVERSION  U4B00040
                    *   SUBROUTINE NAME-                              * U4B00050
                    *      FULL NAME- INTEGER BINARY TO DECIMAL CON-  * U4B00060
                    *         VERSION SUBPROGRAM.                     * U4B00070
                    *      CODE NAME- BINDC                           * U4B00080
                    *   PURPOSE- THIS SUBPROGRAM CONVERTS A ONE-WORD  * U4B00090
                    *      BINARY INTEGER TO A STRING OF EBCDIC       * U4B00100
                    *      CHARACTERS REPRESENTING THE CORRESPONDING  * U4B00110
                    *      DECIMAL VALUE.                             * U4B00120
                    *   METHOD-                                       * U4B00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4B00140
                    *   CAPABILITIES AND LIMITATIONS-                 * U4B00150
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4B00160
                    *   SPECIAL FEATURES- N/A                         * U4B00170
                    *   ADDITIONAL INFORMATION-                       * U4B00180
                    *      ESTIMATED EXECUTION TIME-                  * U4B00190
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4B00200
                    *                                                 * U4B00210
                    *************************************************** U4B00220
                    ***   HDNG    LIBF BINDC-V1.                        U4B00230
                          LIBR                                          U4B00240
                          ENT     BINDC                                 U4B00250
                    *                                                   U4B00260
                    BINDC STX   1 BC20+1    CALL ENTRY POINT       (+0) U4B00270
                    LINK  LDX  I1 0         LOADER STORES TV ADDR  (+2) U4B00280
                          STS     BC22      SAVE STATUS                 U4B00290
                          STD     SAVE      SAVE ACC AND EXT            U4B00300
                          STO     VALUE     SAVE VALUE TO BE CONVERTED  U4B00310
                          LD    1 0         XR1= ADDR OF OUTPUT PARAM   U4B00320
                          STO     BC16+1    SET UP OUTPUT ADDR          U4B00330
                          MDX   1 +1        XR1= RETURN ADDR            U4B00340
                          STX   1 BC26+1    SET UP RETURN ADDR          U4B00350
                          LDX   1 +5        XR1= COUNT FOR 5 DIGITS     U4B00360
                          LD      VALUE     GET BINARY NO. INPUT        U4B00370
                          BSC  L  BC30,Z+   IF NEG, GO TO SET SIGN      U4B00380
                          LD      H80A0     IF POS, GET CARD CODE &     U4B00390
                    BC06  STO  I  BC16+1    ST SIGN IN OUTPUT AREA      U4B00400
                    *                                                   U4B00410
                    *LOOP TO COMPUTE DECIMAL DIGITS                     U4B00420
                    *                                                   U4B00430
                    BC10  LD      VALUE     GET INPUT VALUE=N           U4B00440
                          M       H1999     MPY BY ONE-TENTH            U4B00450
                          STO     TEMP      ST TRUNCATED TENTH OF N     U4B00460
                          M       N0010     MPY BY -10 TO GET -N PLUS   U4B00470
                          SLT     16        PUT PRODUCT IN ACC          U4B00480
                          BSC     O         IS DIGIT FIRST OF -32768    U4B00490
                          A       D0001     YES, INCR 32767 TO 32768    U4B00500
                          A       VALUE     GET ONLY LAST DIGIT AND PUT U4B00510
                          A       SHIFT     *INTO SHIFT RT INSTRUCTION  U4B00520
                          STO     BC14      *TO SHIFT HOLLERITH CHAR    U4B00530
                          S       H180A     IF DIGIT GT 9, APPROXIMATED U4B00540
                          BSC  L  BC34,-    *TENTH GAVE ERROR- SUBTRACT U4B00550
                    BC12  LD      TEMP      OTHERWISE, SET VALUE TO ONE U4B00560
                          STO     VALUE     *TENTH OF N FOR NEXT DIGIT  U4B00570
                          LD      H2000     =HOLLERITH ZERO. SHIFTING   U4B00580
                    BC14  SRA     0         *GIVES RT HOLL DIGIT        U4B00590
                    BC16  STO  L1 0         ST IN OUTPUT AREA           U4B00600
                          MDX   1 -1        ARE FIVE DIGITS DONE        U4B00610
                          MDX     BC10      IF NOT, REPEAT LOOP         U4B00620
                    BC20  LDX  L1 *-*       YES, RESTORE XR1            U4B00630
                    BC22  LDS     *-*       RESTORE STATUS              U4B00640
                          LDD     SAVE      RESTORE ACC AND EXT         U4B00650
                    BC26  BSC  L  0         EXIT                        U4B00660
                    *                                                   U4B00670
                    *SECTION TO TREAT NEGATIVE NUMBERS INPUT            U4B00680
                    *                                                   U4B00690
                    BC30  SRA     16        CLEAR ACCUMULATOR           U4B00700
                          S       VALUE     GET COMPLEMENT OF N, WHICH  U4B00710
                          BSC     +         *IS NEG ONLY IF N = -32768  U4B00720
                          LD      H7FFF     IF NEG, USE N=+32767        U4B00730
                          STO     VALUE     ST ABS VALUE                U4B00740
                          LD      H4000     GET A HOLLERITH MINUS AND   U4B00750
                          MDX     BC06         STORE - AS SIGN          U4B00760
                    *                                                   U4B00770
                    *ERROR CORRECTION PROCEDURE IF DIGIT IS GT 9        U4B00780
                    *                                                   U4B00790
                    BC34  A       SHIFT     RESTORE SHIFT PART OF CON   U4B00800
                          STO     BC14      DECR DIGIT VALUE BY 10      U4B00810
                          MDX  L  TEMP,+1   CORRECT TEMP TO CORRESPOND  U4B00820
                          MDX     BC12      RETURN.                     U4B00830
                    *                                                   U4B00840
                    *CONSTANTS AND BUFFER AREA                          U4B00850
                    *                                                   U4B00860
                    D0001 DC      +1        DECIMAL +1                  U4B00870
                    H180A DC      /180A     HOLLERITH ZERO.             U4B00880
                    H1999 DC      /1999     = .1 SCALED ** -16          U4B00890
                    H2000 DC      /2000     HOLLERITH ZERO.             U4B00900
                    H4000 DC      /4000     HOLLERITH MINUS.            U4B00910
                    H7FFF DC      /7FFF     +32767                      U4B00920
                    H80A0 DC      /80A0     HOLLERITH +                 U4B00930
                    HA000 DC      /A000     =-10 SCALED **-16           U4B00940
                    N0010 DC      -10       DECIMAL -10                 U4B00950
                    SAVE  BSS  E  2         ACC AND EXT TEMPORARY       U4B00960
                    SHIFT SRA     0         SHIFT HOLLERITH ZERO AMOUNT U4B00970
                    TEMP  DC      0         ST ONE TENTH OF VALUE       U4B00980
                    VALUE DC      0         VALUE TO BE CONVERTED       U4B00990
                          END                                           U4B01000
