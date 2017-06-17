                    *             JULY 6,1967                           T5L00010
                          HDNG    WRTYZ                                 T5L00020
                          LIBR                                          T5L00030
                          ISS  02 WRTYZ     4                           T5L00040
                    *************************************************** T5L00050
                    *STATUS-VERSION 2,MODIFICATION 9                  * T5L00060
                    *                                                 * T5L00070
                    *FUNCTION/OPERATION-                              * T5L00080
                    *   THIS SUBROUTINE IS USED BY FORTRAN PROGRAMS TO* T5L00090
                    *   WRITE ON THE TYPEWRITER WHEN NO KEYBOARD INPUT* T5L00100
                    *   IS REQUESTED. IF KEYBOARD INPUT IS REQUESTED  * T5L00110
                    *   SUBROUTINE TYPEZ IS USED FOR BOTH INPUT AND   * T5L00120
                    *   OUTPUT.                                       * T5L00130
                    *                                                 * T5L00140
                    *                                                 * T5L00150
                    *ENTRY POINTS-                                    * T5L00160
                    *   * WRTYZ-CALL PORTION OF ROUTINE FROM FORTRAN  * T5L00170
                    *     SFIO PROGRAM                                * T5L00180
                    *   * TZ100-INTERRUPT ENTRY FROM ILS SUBROUTINE   * T5L00190
                    *   THE SUBROUTINE IS ENTERED BY A LIBF    WRTYZ  * T5L00200
                    *                                                 * T5L00210
                    *INPUT-                                           * T5L00220
                    *   * XR1 CONTAINS THE I/O BUFFER ADDRESS         * T5L00230
                    *   * XR2 CONTAINS THE CHARACTER COUNT            * T5L00240
                    *                                                 * T5L00250
                    *OUTPUT-                                          * T5L00260
                    *                                                 * T5L00270
                    *   A MAXIMUM OF 120 CHARACTERS ON THE TYPEWRITER * T5L00280
                    *   INCLUDING SPECIAL TYPEWRITER CONTROLS (IE TAB)* T5L00290
                    *                                                 * T5L00300
                    *EXTERNAL REFERENCES-                             * T5L00310
                    *   * $PRET-SYSTEM PRE-OPERATIVE ERROR TRAP       * T5L00320
                    *   * GETAD-A SUBROUTINE TO GET EFFECTIVE ADDRESS * T5L00330
                    *     OF CONVERSION TABLE                         * T5L00340
                    *   * EBCTB-CONVERSION TABLE                      * T5L00350
                    *                                                 * T5L00360
                    *EXITS-                                           * T5L00370
                    *   NORMAL-                                       * T5L00380
                    *      * CALL PORTION-WRTYZ+1 BACK TO SFIO        * T5L00390
                    *      * INTERRUPT PORTION-TZ100 BACK TO ILS PROG * T5L00400
                    *   ERROR-                                        * T5L00410
                    *      * $PRET-SYSTEM PREOPERATIVE ERROR TRAP     * T5L00420
                    *                                                 * T5L00430
                    *TABLES/WORK AREAS-N/A                            * T5L00440
                    *                                                 * T5L00450
                    *ATTRIBUTES-RELOCATABLE                           * T5L00460
                    *NOTES-REGISTERS NOT SAVED                        * T5L00470
                    *                                                 * T5L00480
                    *************************************************** T5L00490
                          HDNG    WRTYZ                                 T5L00500
                    *                                                   T5L00510
                    *             SYSTEM COMMUNICATION WORD             T5L00520
                    *                                                   T5L00530
                    $PRET EQU     /28        SYSTEM PRE-OP ERR TRAP     T5L00540
                    *                                                   T5L00550
                    *             PROGRAM ENTRY POINT                   T5L00560
                    *                                                   T5L00570
                    WRTYZ MDX     TZ200      PROGRAM ENTRY, BR TO START T5L00580
                          BSC  I  *-*        RETURN FROM PROGRAM        T5L00590
                    TZ010 DC      0          INTERRUPT WAIT INDICATOR   T5L00600
                    *                                                   T5L00610
                    *             INTERRUPT ENTRY- $ILS4 BRANCHES HERE  T5L00620
                    *             WHEN INTERRUPT OCCURS. THIS PORTION   T5L00630
                    *             PROCESSES INTERRUPTS AND RETURNS TO   T5L00640
                    *             THE POINT WHERE THE INTERRUPT OCCURED T5L00650
                    *             THROUGH THE $ILS4 SUBROUTINE.         T5L00660
                    *                                                   T5L00670
                    TZ100 DC      *-*        INTERRUPT ENTRY            T5L00680
                          XIO     TZ900      SENSE AND RESET            T5L00690
                          STX     TZ010      SET FLAG TO IND INTERRUPT  T5L00700
                          BSC  I  TZ100      RETURN TO $ILS4            T5L00710
                    *                                                   T5L00720
                    *             WRTYZ MAINLINE PORTION                T5L00730
                    *             INITIALIZE SUBROUTINE                 T5L00740
                    *                                                   T5L00750
                    TZ200 MDX   2 1          INCR CHAR CNT FOR CARR RET T5L00760
                          BSI     TZ400      BR TO SEE IF TW READY      T5L00770
                          STX   2 TZ907      SAVE CHARACTER COUNT       T5L00780
                          LD      TZ904      LOAD CARR RETURN CHAR      T5L00790
                          MDX     TZ330      BR TO STO CHAR & RET CARR  T5L00800
                    *                                                   T5L00810
                    *             MAIN LOOP, LOOPS THROUGH CHARACTERS,  T5L00820
                    *             CONVERTS THEM TO TYPEWRITER CODE      T5L00830
                    *             AND TYPES THEM OUT                    T5L00840
                    *                                                   T5L00850
                    TZ300 MDX   1 1                                     T5L00860
                          LD      TZ906      LOAD CONVERSION TABLE LIBF T5L00870
                          LIBF    GETAD      BR TO GET EFFECTIVE ADDR   T5L00880
                          STO     TZ310+1    SAVE EFFECTIVE ADDR OF TBL T5L00890
                          LDX   2 -59        GET CHAR CNT OF TABLE      T5L00900
                          SLT     16         CLEAR EXTENSION            T5L00910
                    TZ310 LD   L2 *-*        GET EBC CHAR FROM TABLE    T5L00920
                          RTE     8          SHIFT TW CHAR TO EXTENSION T5L00930
                          EOR   1 -1         COMPARE EBC CHAR WITH BUFR T5L00940
                          SLA     8         IGNORE LEFT HALF-WORD   2-9 T5L00945
                          BSC  L  TZ320,+-   BR IF CHARS EQUAL          T5L00950
                          MDX   2 1          INCR TABLE ADDRESS         T5L00960
                          MDX     TZ310-1    CHK NXT CHAR IN TBL IF ANY T5L00970
                          LDD     TZ905      NO MATCH, INSERT BLANKS    T5L00980
                    *                                                   T5L00990
                    *             CHARACTER MATCHES TABLE. REPLACE WITH T5L01000
                    *             TYPEWRITER CHARACTER FROM EXTENSION   T5L01010
                    *                                                   T5L01020
                    TZ320 RTE     16         SHIFT CHAR FROM EXTENSION  T5L01030
                    TZ330 STO     TZ908      STORE IN OUTPUT BUFFER WD  T5L01040
                          XIO     TZ902      TYPE CHARACTER             T5L01050
                    *                                                   T5L01060
                    *             WAIT UNTIL INTERRUPT OCCURS           T5L01070
                    *                                                   T5L01080
                    TZ340 LD      TZ010      LOAD INTERRUPT INDICATOR   T5L01090
                          BSC  L  TZ340,+-   LOOP IF INDR = 0           T5L01100
                          SLA     16         CLEAR INDICATOR FOR        T5L01110
                          STO     TZ010      *NEXT INTERRUPT            T5L01120
                    *             READY TEST TO SEE IF FORMS CHECK      T5L01130
                          BSI     TZ400      BR TO TEST IF TW READY     T5L01140
                          MDX  L  TZ907,-1   DECR CHARACTER COUNT       T5L01150
                          MDX     TZ300      GO TO TYPE NEXT CHARACTER  T5L01160
                          MDX     WRTYZ+1    RETURN TO SFIO PROGRAM     T5L01170
                    *                                                   T5L01180
                    *             CONSTANTS AND WORK AREAS              T5L01190
                    *                                                   T5L01200
                          BSS  E  0                                     T5L01210
                    TZ900 DC      /2000      SENSE IOCC AND ERR INDR    T5L01220
                          DC      /0F01                                 T5L01230
                    TZ902 DC      TZ908      PRINT IOCC                 T5L01240
                          DC      /0900                                 T5L01250
                    TZ904 DC      /8100      CARRIAGE RETURN CONSTANT   T5L01260
                    TZ905 DC      /2100      BLANK IN TW CODE (ODD LOC) T5L01270
                    TZ906 LIBF    EBCTB      CALL TO EBC CONV           T5L01280
                    TZ907 DC      0          CHARACTER COUNT            T5L01290
                    TZ908 DC      0          CHAR PRINT BUFFER          T5L01300
                    TZ909 EQU     TZ900      ERROR INDICATOR            T5L01310
                    *                                                   T5L01320
                    *             THE FOLLOWING CODING CHECKS TO SEE    T5L01330
                    *             IF THE TYPEWRITER IS IN READY STATUS. T5L01340
                    *             IF NOT, AN ERROR CODE IS LOADED INTO  T5L01350
                    *             THE ACC AND THE PROGRAM BRANCHES TO   T5L01360
                    *             THE SYSTEM PRE OPERATIVE ERROR TRAP   T5L01370
                    *                                                 * T5L01380
                    TZ400 DC      *-*        BSI ENTRY POINT            T5L01390
                          XIO     TZ900      SENSE TO GET DSW           T5L01400
                          SLA     5          SHIFT TW BUSY BIT TO SIGN  T5L01410
                          BSC  I  TZ400,-    RETURN UNLESS BUSY         T5L01420
                          LD      TZ909      LOAD ERROR INDR (/200)     T5L01430
                          BSI  L  $PRET      BR TO PRE-OP ERR TRAP      T5L01440
                          MDX     TZ400+1    BR TO TRY AGAIN            T5L01450
                          END                                           T5L01460
