                          HDNG    4OF8 - EBC AND EBC - 4OF8 CONVERSION  W1A00010
                    *************************************************** W1A00020
                    * TITLE - EBC48                                   * W1A00030
                    * STATUS - CHANGE LEVEL 3                         * W1A00040
                    * FUNCTION/OPERATION - .EBC48. CONVERTS 4-OF-8    * W1A00050
                    *  CHARACTERS TO EBCDIC OR EBCDIC TO 4-OF-8 CODE, * W1A00060
                    *  DEPENDING ON THE VALUE OF THE CONTROL PARAMETER* W1A00070
                    * ENTRY POINTS - .EBC48. CALL ENTRANCE LIBF EBC48 * W1A00080
                    * INPUT - UNPACKED, LEFT-JUSTIFIED 4-OF-8 CODE    * W1A00090
                    *  CHARACTERS OR PACKED EBCDIC CHARACTERS         * W1A00100
                    * OUTPUT - PACKED EBCDIC CHARACTERS OR UNPACKED,  * W1A00110
                    *  LEFT-JUSTIFIED 4-OF-8 CODE CHARACTERS          * W1A00120
                    * EXTERNAL ROUTINES - .STRTB. TABLE OF 4-OF-8 CODE* W1A00130
                    *  AND EBCDIC CHARACTERS, .HXCV. ROUTINE TO       * W1A00140
                    *  CONVERT 4-OF-8 CODE CHARACTER TO VALUE BETWEEN * W1A00150
                    *  ZERO AND 63.                                   * W1A00160
                    * EXITS-NORMAL - RETURN TO MAINLINE AT LIBF+5     * W1A00170
                    *      -ERROR - INVALID EBCDIC CHARACTER ON INPUT,* W1A00180
                    *  EXIT TO LIBF+5 AFTER CONVERSION IS COMPLETE    * W1A00190
                    *  WITH CARRY OFF AND OVERFLOW ON.                * W1A00200
                    * TABLES/WORK AREAS - NONE                        * W1A00210
                    * ATTRIBUTES - REUSABLE                           * W1A00220
                    * NOTES - THE CALLING SEQUENCE IS                 * W1A00230
                    *               LIBF  EBC48                       * W1A00240
                    *               DC    /000X   CONTROL PARAMETER   * W1A00250
                    *               DC    INPUT   INPUT AREA ADDRS    * W1A00260
                    *               DC    OTPUT   OUTPUT AREA ADDRS   * W1A00270
                    *               DC    NNNN    CHARACTER COUNT     * W1A00280
                    *************************************************** W1A00290
                          HDNG    4OF8 - EBC AND EBC - 4OF8 CONVERSION  W1A00300
                          LIBR                                          W1A00310
                          ENT     EBC48                                 W1A00320
                    EBC48 STX   1 SAV1+1    SAVE INDEX REGISTER 1       W1A00330
                          LDX  I1 *-*       ADDR FIRST PARAMETER        W1A00340
                          STD     AQ        SAVE ACC AND EXTENSION      W1A00350
                          STS     LDS       SAVE STATUS                 W1A00360
                          STX   1 MDX1+1    SAVE ADDR 1ST PARAMETER     W1A00370
                          LD    1 1         STORE INPUT BUFFER ADDRESS  W1A00380
                          STO     INPUT+1                               W1A00390
                          LD    1 2         STORE OUTPUT BFR ADDRESS    W1A00400
                          STO     OUTPT+1                               W1A00410
                          LD    1 3                                     W1A00420
                          STO     CT        CNT OF CHARS TO CONVERT     W1A00430
                          MDX   1 4         SET RETURN ADDR TO USER     W1A00440
                          STX   1 XIT+1     PROGRAM.                    W1A00450
                          STX   2 SAV2+1    SAVE USERS XR2              W1A00460
                          LD      LIBF      CONVERT LIBF STRTB INTO ACT W1A00470
                          SLT     8         ADDR OF TABLE.              W1A00480
                          SRT     8                                     W1A00490
                          A       K2                                    W1A00500
                          STO     LD+1                                  W1A00510
                    LD    LD   L3 *-*                                   W1A00520
                          A       K3        CONVERTED ADDRESS           W1A00530
                          STO     ADDRS                                 W1A00540
                          LDX   1 0                                     W1A00550
                          LDX   2 -2                                    W1A00560
                    INPUT LD   L1 *-*       FETCH TWO INPUT CHARS       W1A00570
                    MDX1  MDX  L  *-*,0     CHK DIRECTION OF CONVERSION W1A00580
                          MDX     CNVRT     4 OF 8 TO EBCDIC            W1A00590
                          RTE     16        SEPARATE AND STORE          W1A00600
                          SLT     8                                     W1A00610
                          SLA     8                                     W1A00620
                          STD     BUKT                                  W1A00630
                    LOOP  EOR     RCDMK     CHK FOR RECORD MARK         W1A00640
                          BSC     +-        SKIP IF NOT                 W1A00650
                          LD      K8A01    CNVRT E0 TO 6A,PASS TEST 2-3 W1A00660
                          EOR     RCDMK     RESTORE CHAR TO ORIGINAL    W1A00670
                          STX   1 N2+1                              2-3 W1A00680
                          LDX   1 -7       THIS PART OF THE         2-3 W1A00681
                    N1    S    L1 N3+7     *PROGRAM TESTS FOR       2-3 W1A00682
                          BSC  L  N2,+-    *CERTAIN INVALID         2-3 W1A00683
                          A    L1 N3+7     *EBC-CHARACTERS IN ORDER 2-3 W1A00684
                          MDX   1 1        *TO CONVERT THEM TO      2-3 W1A00685
                          MDX     N1       *BLANK 4 OF 8 CODE       2-3 W1A00686
                    N2    LDX  L1 *-*                               2-3 W1A00687
                          BSC  L  ERR,+-                            2-3 W1A00688
                          STO  L2 BUKT+2                                W1A00689
                          SLA     2         MODULO 64                   W1A00690
                          BSC  L  OK2,C     OK ONLY IF 4 BIT PRESENT    W1A00700
                    ERR   SLA     16        NO 4 BIT ERROR              W1A00710
                          LDS     1                                     W1A00720
                          STS     LDS                                   W1A00730
                    OK2   STO     HOLD+1    CONTINUE VALIDITY CHECK     W1A00740
                          SLA     2                                     W1A00750
                          SRA     1                                     W1A00760
                          S       K9                                    W1A00770
                          BSC  L  CONTU,+                               W1A00780
                          LD   L2 BUKT+2                                W1A00790
                          BSC  L  ERR,+     ERROR IF A-F                W1A00800
                    GATHR LD      HOLD+1    BUILD ADDRESS IN STRTB TO   W1A00810
                          SRA     10        FIND 4 OF 8 CHARACTER.      W1A00820
                          A       ADDRS                                 W1A00830
                          STO     HOLD+1                                W1A00840
                    HOLD  LD   L  *-*       FETCH CHAR                  W1A00850
                          AND     MASK2     ELIMINATE EBC BITS (8-15)   W1A00860
                          STO  L2 BUKT+2    SAVE CONVERTED CHARACTER    W1A00870
                          LD   L2 BUKT+3    FETCH NEXT CHARACTER        W1A00880
                          MDX   2 1                                     W1A00890
                          MDX     LOOP      GO CONVERT SECOND OF TWO    W1A00900
                          LD      OUTPT+1   SET TO STORE 1ST 4 OF 8     W1A00910
                          STO     PUT+1     CHARACTER.                  W1A00920
                          LD      BUKT      GET 1ST CONVERTED CHARACTER W1A00930
                    PUT   STO  L1 *-*       AND STORE TO OUTPUT BUFFER. W1A00940
                          MDX  L  OUTPT+1,1 TO STORE 2ND CONVERTED CHAR W1A00950
                          MDX  L  CT,-1     DECR CHAR COUNT             W1A00960
                          MDX     *+1                                   W1A00970
                          MDX     SAV1      EXIT ON ZERO CHAR COUNT     W1A00980
                          LD      BUKT+1                                W1A00990
                    OUTPT STO  L1 *-*       ST TO USER'S OUTPUT BUFFER  W1A01000
                          MDX   1 1         INCREMENT BUFFER POINTER    W1A01010
                          MDX  L  CT,-1     DECR CHAR COUNT             W1A01020
                          MDX     INPUT-1   GO CONVERT NEXT TWO CHARS   W1A01030
                    SAV1  LDX  L1 *-*       RESTORE USERS XR1           W1A01040
                    SAV2  LDX  L2 *-*       RESTORE USERS XR2           W1A01050
                    LDS   LDS     0                                     W1A01060
                          LDD     AQ                                    W1A01070
                    XIT   BSC  L  *-*       RETURN TO USER              W1A01080
                    AQ    BSS  E  2        ACC AND EXT TEMP.            W1A01081
                    CT    DC               CHAR COUNT TEMP.             W1A01082
                    LIBF  LIBF    STRTB    CALL STRTB,1 WORD CALL       W1A01083
                    CONTU A       K7                                    W1A01090
                          BSC  L  GATHR,Z+  NO CHK IF RT HEX IS 0 OR 1  W1A01100
                          LD   L2 BUKT+2    ENSURE LFT HEX IS C THRU F  W1A01110
                          BSC  L  ERR,-                                 W1A01120
                          MDX     GATHR     OK - GO CONVERT             W1A01130
                    CNVRT STX   2 SVX2+1    SET TO PROCESS 2 CHARACTERS W1A01140
                          LIBF    HXCV      CONVERT 4OF8 TO 0-63 RLTV   W1A01150
                    SVX2  LDX  L2 *-*                                   W1A01160
                          A       ADDRS     ADD BASE ADDR OF STRTB      W1A01170
                          S       K3        ADJUST                      W1A01180
                          STO     *+1                                   W1A01190
                          LD   L  *-*       FETCH EBCDIC CHAR           W1A01200
                          SLA     8         ELIMINATE 4 OF 8 BITS       W1A01210
                          STO  L2 BUKT+2                                W1A01220
                          MDX   2 1                                     W1A01230
                          MDX     JUMP      GO PROCESS NEXT CHARACTER   W1A01240
                          SRA     8         CHARS INTO ONE WORD         W1A01250
                          OR      BUKT                                  W1A01260
                          MDX     OUTPT     GO STORE 2 CHARS IN OUTPUT  W1A01270
                    JUMP  MDX  L  INPUT+1,1 POINT TO NEXT INPUT CHAR    W1A01280
                          MDX  L  CT,-1     DECR CHAR COUNT             W1A01290
                          MDX     INPUT     GO FETCH NEXT INPUT CHAR    W1A01300
                          MDX     OUTPT     GO STORE LAST CHARACTER     W1A01310
                    K2    DC      2         ADDR MODIFICATION CONSTANT  W1A01350
                    K3    DC      3         ADDR MODIFICATION CONSTANT  W1A01360
                    RCDMK DC      /E000     RECORD MARK CONSTANT        W1A01370
                    K9    DC      /4800     VALIDITY CHECK CONSTANT     W1A01380
                    ADDRS DC                BASE ADDR OF STRTB TABLE    W1A01390
                    MASK2 DC      /FF00     LEFT DIGIT EXTRACT MASK     W1A01400
                    K8A01 DC      /8A01    RECORD MARK CONST.       2-3 W1A01410
                    K7    DC      /3800     VALIDITY CHK CONSTANT       W1A01420
                    N3    DC      /4100    INVALID EBC-CHAR         2-3 W1A01421
                          DC      /5100    INVALID EBC-CHAR         2-3 W1A01422
                          DC      /6A00    INVALID EBC-CHAR         2-3 W1A01423
                          DC      /7000    INVALID EBC-CHAR         2-3 W1A01424
                          DC      /7100    INVALID EBC-CHAR         2-3 W1A01425
                          DC      /D000    INVALID EBC-CHAR         2-3 W1A01426
                          DC      /E100    INVALID EBC-CHAR         2-3 W1A01427
                    BUKT  BSS  E  2         CONVERTED CHAR TEMPORARY    W1A01430
                          END                                           W1A01440
