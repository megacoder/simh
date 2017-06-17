                          HDNG    PTTC/8 TO CP, CP TO PTTC/8 CONVERSION U3G00010
                    **************************************************  U3G00020
                    *                                                 * U3G00030
                    *   SUBROUTINE NAME-                              * U3G00040
                    *      FULL NAME- PTTC/8 SUBSET TO 1053 OR 1403   * U3G00050
                    *         CONSOLE PRINTER CODE                    * U3G00060
                    *      CODE NAME- PAPPR                           * U3G00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS PTTC/8      * U3G00080
                    *      SUBSET TO 1053 OR 1403 PRINTER CODE.       * U3G00090
                    *   METHOD-                                       * U3G00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3G00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U3G00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3G00130
                    *   SPECIAL FEATURES- N/A                         * U3G00140
                    *   ADDITIONAL INFORMATION-                       * U3G00150
                    *      ESTIMATED EXECUTION TIME-                  * U3G00160
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3G00170
                    *                                                   U3G00180
                    *************************************************** U3G00190
                          HDNG    PTTC/8 TO CP, CP TO PTTC/8 CONVERSION U3G00200
                          LIBR                                          U3G00210
                          ENT     PAPPR                                 U3G00220
                    PAPPR STX   1 SAV1+1    CALL ENTRY POINT            U3G00230
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3G00240
                          STX   2 SAV2+1    SAVE XR2                    U3G00250
                          STS     SAVST     SAVE STATUS                 U3G00260
                          STD     SAVAQ     SAVE ACC AND EXT            U3G00270
                          LD    1 1         XR1 = ADDR OF CALL+1        U3G00280
                          STO     INPUT+1   = INPUT PARAMETER           U3G00290
                          LD    1 2                                     U3G00300
                          STO     OUTPT+1   = OUTPUTPARAMETER           U3G00310
                          LD    1 3                                     U3G00320
                          STO     COUNT     = NO. OF CHARS TO CONVERT   U3G00330
                          LD      CALL1                                 U3G00340
                          BSI     SBRTA                                 U3G00350
                          STO     TLU12+1   OBTAIN EBPA ADDRESS         U3G00360
                          LD      CALL2                                 U3G00370
                          BSI     SBRTA                                 U3G00380
                          STO     TLU14+1   OBTAIN PRTY ADDRESS         U3G00390
                          SRA     16        SET OUTPUT CONTROL FOR      U3G00400
                          STO     CNTRL     LEFT CHARACTER              U3G00410
                          LD    1 0         = CONTROL PARAMETER         U3G00420
                          SRT     4                                     U3G00430
                          BSC     +-        IS CASE MODE SET            U3G00440
                          STO     CASE      YES, INITIALIZE CASE        U3G00450
                          SRA     16                                    U3G00460
                          SLT     4         OBTAIN CODE CONTROL         U3G00470
                          STO     CODE                                  U3G00480
                          LD      HFFFF     INITLZ OUTPUT BUFFER        U3G00490
                          STO     TEMP                                  U3G00500
                          MDX   1 +4                                    U3G00510
                          STX   1 EXIT+1    SET EXIT TO CALL+5          U3G00520
                    INPUT LDX  L1 0         XR1=INPUT ADDRESS           U3G00530
                    OUTPT LDX  L2 0         XR2=OUTPUT ADDRESS          U3G00540
                    *                                                   U3G00550
                    *THIS SECTION SETS UP THE CONVERSION AND STORING    U3G00560
                    *OF THE REQUIRED NUMBER OF CHARACTERS.              U3G00570
                    *                                                   U3G00580
                    PAP22 LD    1 0                                     U3G00590
                          SRA     8                                     U3G00600
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3G00610
                          MDX     PAP24     YES, CHK NEXT CHARACTER     U3G00620
                          BSI     TLU       CONVERT LEFT PTTC/8 CHAR    U3G00630
                          BSI     STORE     STORE CONVERTED CHAR        U3G00640
                    PAP24 MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3G00650
                          MDX     PAP26     YES                         U3G00660
                          MDX     PAP30     NO                          U3G00670
                    PAP26 LD    1 0                                     U3G00680
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3G00690
                          MDX     PAP28     YES, CHECK NEXT CHAR        U3G00700
                          BSI     TLU       CONVERT RIGHT PTTC/8 CHAR   U3G00710
                          BSI     STORE     STORE CONVERTED CHAR        U3G00720
                    PAP28 MDX   1 +1        SET FOR NEXT INPUT WORD     U3G00730
                          MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3G00740
                          MDX     PAP22     YES                         U3G00750
                    PAP30 LD      TEMP      NO, ANY CHAR LEFT TO        U3G00760
                          A       D0001     STORE                       U3G00770
                          BSC  L  SAV1,+-                               U3G00780
                          S       D0001                                 U3G00790
                          MDX  L  CODE,0    YES, WHAT OUTPUT CODE       U3G00800
                          MDX     PAP32     1443 CODE                   U3G00810
                          A       H0021     1053 CODE                   U3G00820
                    PAP32 STO   2 0         STORE CHAR AND BLANK        U3G00830
                    SAV1  LDX  L1 *-*       RESTORE XR1                 U3G00840
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U3G00850
                    SAVST LDS     *-*       RESTORE STATUS              U3G00860
                          LDD     SAVAQ     RESTORE ACC AND EXTENSION   U3G00870
                    EXIT  BSC  L  0         EXIT                        U3G00880
                    *                                                   U3G00890
                    *THIS SECTION GETS THE LOAD ADDRESS OF EITHER EBPA  U3G00900
                    *OR PRTY TABLE SUBROUTINES.                         U3G00910
                    *                                                   U3G00920
                    SBRTA DC      0                                     U3G00930
                          SLA     8         GET TV ENTRY DISPLACEMENT   U3G00940
                          SRT     8                                     U3G00950
                          STX   3 SBA12+1                               U3G00960
                          A       SBA12+1   ADD IN TV TABLE ADDR        U3G00970
                          A       D0002     REF THIRD WD OF TV ENTRY    U3G00980
                          STO     SBA12+1   GET LOAD ADDRESS            U3G00990
                    SBA12 LD   L  0                                     U3G01000
                          A       D0003     AVOID STORED LINK WORD      U3G01010
                          BSC  I  SBRTA     RETURN                      U3G01020
                    *                                                   U3G01030
                    *CONSTANTS AND BUFFER AREA                          U3G01040
                    *                                                   U3G01050
                    *                                                   U3G01060
                    SAVAQ BSS  E  2         SAVE ACC AND EXTENSION      U3G01070
                    CALL1 LIBF    EBPA      USED TO GET EBPA ADDR       U3G01080
                    CALL2 LIBF    PRTY      USED TO GET PRTY ADDR       U3G01090
                    CASE  DC      0         CASE INDR(0=LOWER,1=UPPER)  U3G01100
                    CNTRL DC      0         OUTPUT CONTROL (0= LEFT )   U3G01110
                    CODE  DC      0         OUTPUT CODE (0=1053,1=1403) U3G01120
                    COUNT DC      0         CHAR COUNT                  U3G01130
                    D0002 DC      +2        DECIMAL 2                   U3G01140
                    D0003 DC      +3        DECIMAL 3                   U3G01150
                    HFFFF DC      /FFFF     INITLZ O/P BUFFER           U3G01160
                    HFF00 DC      /FF00     LOW BIT MASK                U3G01170
                    H00FF DC      /00FF     HIGH BIT MASK               U3G01180
                    H0021 DC      /0021     1053 BLANK                  U3G01190
                    LOWER DC      /6E00     PTTC/8 LOWER CASE INDR CHAR U3G01200
                    UPPER DC      /0E00     PTTC/8 UPPER CASE INDR CHAR U3G01210
                    TEMP  DC      /FFFF     TEMPORARY STG BUFFER        U3G01220
                    *                                                   U3G01230
                    *THIS SECTION DOES A TABLE LOOKUP CONVERSION        U3G01240
                    *                                                   U3G01250
                    TLU   NOP               SAVE RETURN ADDRESS         U3G01260
                          STO     CHAR      SAVE INPUT CHAR             U3G01270
                          STX   1 TLU16+1   SAVE XR1                    U3G01280
                          LDX   1 +75       XR1= LENGTH OF EBPA TABLE   U3G01290
                    TLU12 EOR  L1 0                                     U3G01300
                          SLA     8         LEFT JUSTIFY PTTC/8 CHAR    U3G01310
                          BSC  L  TLU14,+-  HAS CHARACTER BEEN FOUND    U3G01320
                          LD      CHAR                                  U3G01330
                          MDX   1 -1        NO, ANY MORE TO CHECK       U3G01340
                          MDX     TLU12     YES                         U3G01350
                          LD      H2001     NO, TURN ON OVFLO           U3G01360
                          STO     SAVST                                 U3G01370
                    TLU14 LD   L1 0                                     U3G01380
                          MDX  L  CODE,0    IS OUTPUT FOR 1053          U3G01390
                          SLA     8         NO, FOR 1403                U3G01400
                    TLU16 LDX  L1 *-*       RESTORE XR1                 U3G01410
                          BSC  I  TLU       RETURN                      U3G01420
                    *                                                   U3G01430
                    *CONSTANTS AND BUFFER AREA                          U3G01440
                    *                                                   U3G01450
                    CHAR  DC      0         CHAR TO BE CONVERTED        U3G01460
                    NEWLN DC      /DD00     PTTC/8 NEW LINE CHAR        U3G01470
                    H000C DC      /000C     CHK FOR CONTROL CHAR        U3G01480
                    H0010 DC      /0010     CHK FOR PTTC/8 BLANK        U3G01490
                    H2001 DC      /2001     SET OVERFLOW                U3G01500
                    D0001 DC      +1        DECIMAL ONE                 U3G01510
                    *                                                   U3G01520
                    *THIS SECTION STORES THE CONVERTED CHARS 2 PER WORD U3G01530
                    *                                                   U3G01540
                    *                                                   U3G01550
                    STORE NOP                                           U3G01560
                          MDX  L  CNTRL,0   IS O/P FOR LEFT HALF (=0)   U3G01570
                          MDX     STR16                                 U3G01580
                          AND     HFF00     YES, STORE IN TEMP          U3G01590
                          STO     TEMP      SET CNTRL FOR RIGHT         U3G01600
                          LD      D0001     HALF AND RETURN.            U3G01610
                    STR12 STO     CNTRL                                 U3G01620
                          BSC  I  STORE                                 U3G01630
                    STR16 SRA     8         NO, ADD IN TEMP AND STORE   U3G01640
                          A       TEMP      CHARS IN OUTPUT AREA        U3G01650
                          STO   2 0                                     U3G01660
                          LD      HFFFF                                 U3G01670
                          STO     TEMP      CLEAR CHAR STORAGE          U3G01680
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3G01690
                          SRA     16                                    U3G01700
                          MDX     STR12                                 U3G01710
                    *                                                   U3G01720
                    *THIS SECTION CHECKS THE PTTC/8 CHAR TO SEE IF IT   U3G01730
                    *IS A CASE SHIFT, A NEW LINE, BLANK OR ILLEGAL CHAR U3G01740
                    *                                                   U3G01750
                    SHIFT NOP               SAVE RETURN ADDRESS         U3G01760
                          AND     H00FF                                 U3G01770
                          STO     CHAR      SAVE CHARACTER              U3G01780
                          AND     H000C                                 U3G01790
                          EOR     H000C     IS CHAR = CONTROL           U3G01800
                          BSC  L  SFT20,Z   NO                          U3G01810
                          LD      CHAR                                  U3G01820
                          SLA     8                                     U3G01830
                          EOR     LOWER     IS CHAR = LOWER CASE        U3G01840
                          BSC  L  SFT18,+-  YES                         U3G01850
                          EOR     LOWER                                 U3G01860
                          EOR     UPPER     IS CHAR = UPPER CASE        U3G01870
                          BSC  L  SFT16,+-  YES                         U3G01880
                          EOR     UPPER                                 U3G01890
                          EOR     NEWLN     IS CHAR = NEW LINE          U3G01900
                          BSC     +-                                    U3G01910
                          STO     COUNT     YES                         U3G01920
                    SFT12 LD      CHAR                                  U3G01930
                    SFT13 MDX  L  SHIFT,+1  NO, SET TO SKIP ONE WORD    U3G01940
                    SFT14 BSC  I  SHIFT                                 U3G01950
                    SFT16 LD      D0001                                 U3G01960
                    SFT18 STO     CASE      SET CASE ACCORDINGLY        U3G01970
                          MDX     SFT14                                 U3G01980
                    SFT20 LD      CHAR      IS CHAR = BLANK             U3G01990
                          S       H0010                                 U3G02000
                          BSC  L  SFT12,+-  YES, DON'T CHECK CASE       U3G02010
                          A       H0010                                 U3G02020
                          SRT     7         IS CHAR ILLEGAL             U3G02030
                          BSC  L  SFT22,E                               U3G02040
                          LD      CASE      NO, ADD CASE INTO           U3G02050
                          SLT     7         CHAR VALUE.                 U3G02060
                          MDX     SFT13                                 U3G02070
                    SFT22 LD      H2001     YES, SET OVERFLOW ON        U3G02080
                          STO     SAVST     AND LOAD BLANK AS           U3G02090
                          LD      H0010     CHARACTER                   U3G02100
                          MDX     SFT13                                 U3G02110
                          END                                           U3G02120
