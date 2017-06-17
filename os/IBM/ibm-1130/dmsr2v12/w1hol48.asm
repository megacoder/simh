                          HDNG    HOLL-4OF8 AND 4OF8-HOLL CONVERSION    W1B00010
                    *************************************************** W1B00020
                    * TITLE - HOL48                                   * W1B00030
                    * STATUS - CHANGE LEVEL 0                         * W1B00040
                    * FUNCTION/OPERATION - .HOL48. CONVERTS 4-OF-8    * W1B00050
                    *  CHARACTERS TO IBM CARD CODE OR IBM CARD CODE   * W1B00060
                    *  TO 4-OF-8 CHARACTERS, DEPENDING ON THE VALUE   * W1B00070
                    *  OF THE CONTROL PARAMETER                       * W1B00080
                    * ENTRY POINTS - .HOL48. CALL ENTRANCE LIBF HOL48 * W1B00090
                    * INPUT - UNPACKED, LEFT-JUSTIFIED 4-OF-8 CODE    * W1B00100
                    *  CHARACTERS OR IBM CARD CODE CHARACTERS         * W1B00110
                    * OUTPUT - IBM CARD CODE CHARACTERS OR UNPACKED,  * W1B00120
                    *  LEFT-JUSTIFIED 4-OF-8 CODE CHARACTERS.         * W1B00130
                    * EXTERNAL ROUTINES - .HOLCA. TABLE OF IBM CARD   * W1B00140
                    *  CODE CHARACTERS, .STRTB. TABLE OF 4-OF-8 CODE  * W1B00150
                    *  AND EBCDIC CHARACTERS, .HXCV. ROUTINE TO       * W1B00160
                    *  CONVERT 4-OF-8 CODE CHARACTER TO VALUE BETWEEN * W1B00170
                    *  ZERO AND 63.                                   * W1B00180
                    * EXITS-NORMAL - RETURN TO MAINLINE AT LIBF+5     * W1B00190
                    *      -ERROR - INVALID IBM CARD CODE CHARACTER   * W1B00200
                    *  ON INPUT, EXIT TO LIBF+5 AFTER CONVERSION IS   * W1B00210
                    *  COMPLETE WITH CARRY OFF AND OVERFLOW ON.       * W1B00220
                    * TABLES/WORK AREAS - NONE                        * W1B00230
                    * ATTRIBUTES - REUSABLE                           * W1B00240
                    * NOTES - THE CALLING SEQUENCE IS                 * W1B00250
                    *               LIBF  HOL48                       * W1B00260
                    *               DC    /000X   CONTROL PARAMETER   * W1B00270
                    *               DC    INPUT   INPUT AREA ADDRS    * W1B00280
                    *               DC    OTPUT   OUTPUT AREA ADDRS   * W1B00290
                    *               DC    NNNN    CHARACTER COUNT     * W1B00300
                    *************************************************** W1B00310
                          HDNG    HOLL-4OF8 AND 4OF8-HOLL CONVERSION    W1B00320
                          LIBR                                          W1B00330
                          ENT     HOL48                                 W1B00340
                    HOL48 STX   1 SAV1+1    SAVE USER'S XR1             W1B00350
                          LDX  I1 *-*       GET ADDR OF PARAM LIST      W1B00360
                          STX   1 MDX1+1    DIRECTION OF CONVERSION     W1B00370
                          STD     AQ        SAVE ALL AND EXTENSION      W1B00380
                          STS     LDS       SAVE CARRY AND OVFLO STATUS W1B00390
                          LD    1 1         STORE INPUT BUFFER ADDRESS  W1B00400
                          STO     INPUT+1                               W1B00410
                          LD    1 2         STORE OUTPUT BUFFER ADDRESS W1B00420
                          STO     OUTPT+1                               W1B00430
                          LD    1 3         SAVE CHARS TO CONVERT COUNT W1B00440
                          STO     CT                                    W1B00450
                          MDX   1 4         SET RETURN ADDR TO USER'S   W1B00460
                          STX   1 XIT+1     PROGRAM.                    W1B00470
                          STX   2 SAV2+1    SAVE USERS XR2              W1B00480
                          LDX   1 -2        CONVERT BOTH CODE TABLE     W1B00490
                    LOOP  LD   L1 LIBF+2    LIBFS INTO ACTUAL ADDRS     W1B00500
                          SLT     8         FOR USE BY THIS             W1B00510
                          SRT     8         SUBROUTINE.                 W1B00520
                          A       K2                                    W1B00530
                          STO     LD+1                                  W1B00540
                    LD    LD   L3 *-*       GET ADDR OF 1ST WD OF TBL   W1B00550
                          STO  L1 ADDRS+2                               W1B00560
                          MDX   1 1                                     W1B00570
                          MDX     LOOP      GO GET OTHER TABLE ADDRESS  W1B00580
                    INPUT LD   L1 *-*       GET INPUT CHARACTER         W1B00590
                    MDX1  MDX  L  *-*,0     CHK DIRECTION OF CONVERSION W1B00600
                          MDX     CNVRT     4 OF 8 INTO HOLLERITH CODE  W1B00610
                          LDX   2 3         CONVERT HOLL CODE TO RLTV   W1B00620
                          SRT     13        0-63.  ISOLATE ROWS 12-0    W1B00630
                          SLA     13        AND SAVE 1-9 IN EXTENSION.  W1B00640
                          SLCA  2                                       W1B00650
                          STX   2 SV1       SAVE MULTIPLE OF 16         W1B00660
                          SLA     1                                     W1B00670
                          BSC  L  ERR,Z     MULTIPLE ZONES-ERROR        W1B00680
                          SLT     7         ROWS 1-7 INTO ACCUMULATOR   W1B00690
                          LDX   2 16                                    W1B00700
                          SLCA  2                                       W1B00710
                          STX   2 LD+1      SAVE ROW 1-7 PUNCH          W1B00720
                          SLA     1                                     W1B00730
                          BSC  L  ERR,Z     CHK MULTIPLE ROWS IN 1-7    W1B00740
                          SLT     2                                     W1B00750
                          BSC  L  CK17,E    BR IF 9 ROW                 W1B00760
                          BSC  L  CK1,Z     BR IF 8 ROW -60 CHK 1 ROW   W1B00770
                          LDX   2 3         M/ 8-9 ROWS-INVERT 1-7 ROWS W1B00780
                    ENTR1 LD      K8        AND GATHER TOGETHER THE     W1B00790
                          S       LD+1      RELATIVE ADDRESS            W1B00800
                          SRT     3                                     W1B00810
                          A       K3                                    W1B00820
                          S       SV1                                   W1B00830
                          AND     MFFFB                                 W1B00840
                          SLA     1                                     W1B00850
                          SLT     3                                     W1B00860
                    ENTR  A       ADDRS+1   ADD START ADDR OF STRTB TBL W1B00870
                          STO     GET+1                                 W1B00880
                    GET   LD   L2 *-*       GET 4 OF 8 CHAR (BITS 0-7)  W1B00890
                          AND     MASK2     ELIMINATE EBC PART          W1B00900
                          MDX     OUTPT     GO STORE CONVERTED CHAR     W1B00910
                    ERR   SLA     16        SET TO STORE BLANK          W1B00920
                          LDS     1         SET INVALID CHAR SWITCH     W1B00930
                          STS     LDS                                   W1B00940
                          LDX   2 3                                     W1B00950
                          MDX     ENTR                                  W1B00960
                    CK1   MDX   2 -6        CHK INVALID COMBINATION OF  W1B00970
                          MDX     ERR       1 ROW & 8 ROW-INVALID-SKIP  W1B00980
                          LDX   2 11        OK                          W1B00990
                          LD      LD+1                                  W1B01000
                          BSC  L  ENTR1,Z                               W1B01010
                          LD      K8                                    W1B01020
                          STO     LD+1                                  W1B01030
                          MDX     ENTR1                                 W1B01040
                    CK17  SRA     1         NINE ROW -CHK FOR INVALID   W1B01050
                          A       LD+1      1-8 ROW PRESENT.            W1B01060
                          BSC  L  ERR,Z     BR IF ROWS 1-8 ...INVALID   W1B01070
                          LDX   2 12                                    W1B01080
                          MDX     ENTR1+2                               W1B01090
                    CNVRT LIBF    HXCV                                  W1B01100
                          A       ADDRS     BASE ADDR OF HOLL TABLE     W1B01110
                          STO     *+1                                   W1B01120
                          LD   L  *-*       GET HOLLERITH CHAR          W1B01130
                    OUTPT STO  L1 *-*       STORE TO USER OUTPUT BUFFER W1B01140
                          MDX   1 1         INCREMENT BUFFER POINTER    W1B01150
                          MDX  L  CT,-1     DECR CHAR COUNT BY 1        W1B01160
                          MDX     INPUT     GO CONVERT NEXT CHARACTER   W1B01170
                    SAV1  LDX  L1 *-*       RESTORE USERS XR1           W1B01180
                    LDS   LDS     0                                     W1B01190
                    SAV2  LDX  L2 *-*       RESTORE USERS XR2           W1B01200
                          LDD     AQ                                    W1B01210
                    XIT   BSC  L  *-*       RETURN TO USER              W1B01220
                    LIBF  LIBF    HOLCA     CALL HOLCA (1 WORD CALL)    W1B01230
                          LIBF    STRTB     CALL STRTB (1 WORD CALL)    W1B01240
                    CT    DC                NO. OF CHARS TO CONVERT     W1B01250
                    K2    DC      2                                     W1B01260
                    K3    DC      /0003     ADDR MODIFICATION CONSTANT  W1B01270
                    MFFFB DC      /FFFB     ADDR MODIFICATION CONSTANT  W1B01280
                    ADDRS DC                ADDR OF HOLLERITH TABLE     W1B01290
                          DC                ADDR OF 4-OF-8 TABLE        W1B01300
                    MASK2 DC      /FF00     LEFT DIGIT EXTRACT MASK     W1B01310
                    K8    DC      8         VALIDITY CHECK CONSTANT     W1B01320
                    SV1   DC                MULTIPLE OF 16 TEMPORARY    W1B01330
                    AQ    BSS  E  2         ACC AND EXT TEMPORARY       W1B01340
                          END                                           W1B01350
