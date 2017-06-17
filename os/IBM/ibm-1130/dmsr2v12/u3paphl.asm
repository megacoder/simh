                          HDNG    PTTC/8-HOLL OR HOLL-PTTC/8 CONVERSION U3F00010
                    *************************************************** U3F00020
                    *                                                 * U3F00030
                    *   SUBROUTINE NAME-                              * U3F00040
                    *      FULL NAME- PTTC/8 TO HOLLERITH OR HOLLERITH* U3F00050
                    *         TO PTTC/8 CONVERSION SUBROUTINE.        * U3F00060
                    *      CODE NAME- PAPHL                           * U3F00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS PTTC/8      * U3F00080
                    *      SUBSET TO HOLLERITH SUBSET,OR HOLLERITH    * U3F00090
                    *      SUBSET TO PTTC/8 SUBSET. SUBSET CONSISTS   * U3F00100
                    *      OF THOSE CHARS ASTERISKED IN APPENDIX D    * U3F00110
                    *      OF THE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3F00120
                    *   METHOD-                                       * U3F00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3F00140
                    *   CAPABILITIES AND LIMITATIONS-                 * U3F00150
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3F00160
                    *   SPECIAL FEATURES- N/A                         * U3F00170
                    *   ADDITIONAL INFORMATION-                       * U3F00180
                    *      ESTIMATED EXECUTION TIME-                  * U3F00190
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3F00200
                    *                                                 * U3F00210
                    *************************************************** U3F00220
                          HDNG    PTTC/8-HOLL OR HOLL-PTTC/8 CONVERSION U3F00230
                          LIBR                                          U3F00240
                          ENT     PAPHL                                 U3F00250
                    PAPHL STX   1 SAV1+1    CALL ENTRY POINT            U3F00260
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3F00270
                          STX   2 SAV2+1    SAVE XR2                    U3F00280
                          STS     SAVST     SAVE STATUS                 U3F00290
                          STD     SAVAQ     SAVE ACC AND EXTENSION      U3F00300
                          LD    1 1         XR1= ADDR OF CALL+1         U3F00310
                          STO     INPUT+1   = INPUT PARAMETER           U3F00320
                          LD    1 2                                     U3F00330
                          STO     OUTPT+1   = OUTPUT PARAMETER          U3F00340
                          LD    1 3                                     U3F00350
                          STO  L  COUNT     = NO. OF CHARS TO CONVERT   U3F00360
                          SRA     16        SET OUTPUT CONTROL FOR      U3F00370
                          STO     CNTRL     LEFT CHARACTER.             U3F00380
                          LD    1 0         = CONTROL PARAMETER         U3F00390
                          EOR     H0010     SET CARRY ON IF INITLZ CASE U3F00400
                          SLA     12        REQUESTED                   U3F00410
                          MDX   1 +4                                    U3F00420
                          STX   1 EXIT+1    SET EXIT TO CALL+5          U3F00430
                    INPUT LDX  L1 0         XR1= INPUT ADDRESS          U3F00440
                    OUTPT LDX  L2 0         XR2= OUTPUT ADDRESS         U3F00450
                          BSC  L  PAPIN,+-                              U3F00460
                    *HOLLERITH = INPUT CODE                             U3F00470
                    HOLIN LD      HFFF0                                 U3F00480
                          STO  L  MASK      SET UP TABLE LOOK-UP MASK   U3F00490
                          BSC     C                                     U3F00500
                          STO     CASE      SET UP CASE CHANGE INDR     U3F00510
                          LD      CALL2     OBTAIN HOLL TABLE ADDR      U3F00520
                          BSI     SBRTA                                 U3F00530
                          STO  L  TLU12+1                               U3F00540
                          LD      CALL1     OBTAIN EBPA TABLE ADDR      U3F00550
                          BSI     SBRTA                                 U3F00560
                          STO  L  TLU14+1                               U3F00570
                    HOL12 LD    1 0                                     U3F00580
                          BSI     TLU       CONVERT HOLLERITH CHAR      U3F00590
                          AND     H00FF                                 U3F00600
                          S       H0010     IS CHAR = BLANK             U3F00610
                          BSC  L  CHK18,+-  YES, OUTPUT PTTC/8 BLANK    U3F00620
                          A       H0010     NO, RESTORE HOLLERITH       U3F00630
                          SRT     2         IS CHAR = CONTROL           U3F00640
                          BSC     E         (BITS 12-13 = 11)           U3F00650
                          MDX     CHK10                                 U3F00660
                          MDX     CHK12                                 U3F00670
                    CHK10 SRT     1                                     U3F00680
                          BSC  L  CHK16,E   YES, NO CASE CHECK          U3F00690
                          SLT     1                                     U3F00700
                    CHK12 SRT     5         SAVE CHAR IN EXTENSION      U3F00710
                          EOR     CASE                                  U3F00720
                          BSC  L  CHK14,+-  IS CASE CHANGE NEEDED       U3F00730
                          EOR     CASE                                  U3F00740
                          STO     CASE                                  U3F00750
                          SLA     16        YES, WHICH CASE             U3F00760
                          LD      LOWER     =LOWER CASE CHAR            U3F00770
                          BSC     C                                     U3F00780
                          LD      UPPER     =UPPER CASE CHAR            U3F00790
                          BSI     STORE     STORE CASE CHAR             U3F00800
                          SLA     1                                     U3F00810
                    CHK14 SLT     7                                     U3F00820
                    CHK15 SLA     8                                     U3F00830
                          BSI     STORE     STORE PAPER TAPE CHAR       U3F00840
                          MDX   1 +1        SET FOR NEXT INPUT WORD     U3F00850
                          MDX  L  COUNT,-1  ANY MORE EBCDIC CHARS       U3F00860
                          MDX     HOL12     YES, REPEAT LOOP            U3F00870
                          LD      TEMP      NO, ANY CHAR LEFT TO        U3F00880
                          BSC  L  SAV1,+-   STORE.                      U3F00890
                          A       H007F     YES, ADD DELETE             U3F00900
                          STO   2 0                                     U3F00910
                    SAV1  LDX  L1 *-*       NO,RESTORE XR1              U3F00920
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U3F00930
                    SAVST LDS     *-*       RESTORE STATUS              U3F00940
                          LDD     SAVAQ     RESTORE ACC AND EXT         U3F00950
                    EXIT  BSC  L  0         EXIT                        U3F00960
                    CHK16 SRT     4         IS CONTROL CHAR= NEW LINE   U3F00970
                          BSC     E                                     U3F00980
                          STO     COUNT     YES, SET LAST CHAR INDR     U3F00990
                          MDX     CHK14                                 U3F01000
                    CHK18 LD      H0010     CHAR = SPACE                U3F01010
                          MDX     CHK15                                 U3F01020
                    *                                                   U3F01030
                    *CONSTANTS AND BUFFER AREA                          U3F01040
                    *                                                   U3F01050
                    SAVAQ BSS  E  2         SAVE ACC AND EXT            U3F01060
                    CALL1 LIBF    EBPA      USED TO GET EBPA LOAD ADDR  U3F01070
                    CALL2 LIBF    HOLL      USED TO GET HOLL LOAD ADDR  U3F01080
                    CASE  DC      0         CASE INDR(O=LOWER,1=UPPER)  U3F01090
                    CNTRL DC      0         OUTPUT CONTROL (0= LEFT)    U3F01100
                    COUNT DC      0         CHAR COUNT                  U3F01110
                    D0002 DC      +2        DECIMAL CONSTANT            U3F01120
                    D0003 DC      +3        DECIMAL CONSTANT            U3F01130
                    H0010 DC      /0010     PTTC/8 BLANK                U3F01140
                    H007F DC      /007F     PTTC/8 DELETE               U3F01150
                    H00FF DC      /00FF     LOW BIT MASK                U3F01160
                    HFFF0 DC      /FFF0     HOLLERITH CHAR MASK         U3F01170
                    LOWER DC      /6E00     PTTC/8 LOWER CASE CHAR INDR U3F01180
                    TEMP  DC      0         WORKING STORAGE             U3F01190
                    UPPER DC      /0E00     PTTC/8 UPPER CASE CHAR INDR U3F01200
                    *                                                   U3F01210
                    *THIS SECTION SETS UP THE CONVERSION FROM PTTC/8    U3F01220
                    *TO HOLLERITH AND STORES THE CONVERTED CHARS IN     U3F01230
                    *THE OUTPUT AREA.                                   U3F01240
                    *                                                   U3F01250
                    PAPIN BSC     C         IF NO CASE CHANGE,          U3F01260
                          STO     CASE      ZERO THE INDICATOR.         U3F01270
                          LD      H00FF                                 U3F01280
                          STO     MASK      SET UP TABLE LOOK-UP MASK   U3F01290
                          LD      CALL1                                 U3F01300
                          BSI     SBRTA     OBTAIN EBPA TABLE ADDR      U3F01310
                          STO     TLU12+1                               U3F01320
                          LD      CALL2                                 U3F01330
                          BSI     SBRTA     OBTAIN HOLL TABLE ADDR      U3F01340
                          STO     TLU14+1                               U3F01350
                    PAP22 LD    1 0                                     U3F01360
                          SRA     8                                     U3F01370
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3F01380
                          MDX     PAP24     YES, CHECK NEXT CHAR        U3F01390
                          BSI     TLU       CONVERT LEFT PTTC/8 CHAR    U3F01400
                          STO   2 0         STORE CONVERTED CHAR        U3F01410
                          MDX   2 +1        SET FOR NEXT OUTPUT WD      U3F01420
                    PAP24 MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3F01430
                          MDX     PAP26     YES                         U3F01440
                          MDX     SAV1      NO                          U3F01450
                    PAP26 LD    1 0                                     U3F01460
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3F01470
                          MDX     PAP28     YES, CHECK NEXT CHAR        U3F01480
                          BSI     TLU       CONVERT RIGHT PTTC/8 CHAR   U3F01490
                          STO   2 0         STORE CONVERTED CHAR        U3F01500
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3F01510
                    PAP28 MDX   1 +1        SET FOR NEXT INPUT WORD     U3F01520
                          MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3F01530
                          MDX     PAP22     YES                         U3F01540
                          MDX     SAV1      NO,EXIT                     U3F01550
                    *                                                   U3F01560
                    *THIS SECTION OBTAINS THE LOAD ADDR OF EBPA AND     U3F01570
                    *HOLL TABLES.                                       U3F01580
                    *                                                   U3F01590
                    SBRTA NOP                                           U3F01600
                          SLA     8                                     U3F01610
                          SRT     8         DUPLICATE SIGN BIT          U3F01620
                          STX   3 SBA12+1                               U3F01630
                          A       SBA12+1   ADD TV ADDR                 U3F01640
                          A       D2        REF THIRD WD OF TV TBL      U3F01650
                          STO     SBA12+1   ENTRY.                      U3F01660
                    SBA12 LD   L  0         OBTAIN SUBROUTINE ADDR      U3F01670
                          A       D3        SKIP FIRST THREE WORDS      U3F01680
                          BSC  I  SBRTA                                 U3F01690
                    D2    DC      +2                                    U3F01700
                    D3    DC      +3                                    U3F01710
                    *                                                   U3F01720
                    *THIS SECTION DOES A TABLE LOOKUP CONVERSION OF     U3F01730
                    *PTTC/8 TO HOLLERITH OR HOLLERITH TO PTTC/8.        U3F01740
                    *                                                   U3F01750
                    TLU   NOP               STORE RETURN ADDR           U3F01760
                          STO     CHAR                                  U3F01770
                          STX   1 TLU16+1                               U3F01780
                          LDX   1 +75       XR1= LENGTH OF TABLES       U3F01790
                    TLU12 EOR  L1 0                                     U3F01800
                          AND     MASK                                  U3F01810
                          BSC  L  TLU14,+-  HAS CHAR BEEN FOUND         U3F01820
                          LD      CHAR                                  U3F01830
                          MDX   1 -1        NO, ANY MORE TO CHECK       U3F01840
                          MDX     TLU12     YES                         U3F01850
                          LD      H2001     NO, TURN OVERFLOW ON        U3F01860
                          STO     SAVST                                 U3F01870
                    TLU14 LD   L1 0         YES, PUT EBPA WORD INTO     U3F01880
                    TLU16 LDX  L1 0         ACCUMULATOR.                U3F01890
                          BSC  I  TLU       RETURN                      U3F01900
                    *                                                   U3F01910
                    *CONSTANTS AND BUFFER AREA                          U3F01920
                    *                                                   U3F01930
                    CHAR  DC      0         CHAR TO BE CONVERTED        U3F01940
                    MASK  DC      0         MASK FOR INPUT CODE         U3F01950
                    NEWLN DC      /DD00     PTTC/8 NEW LINE             U3F01960
                    H000C DC      /000C     CHK FOR PTTC/8 CONTROL CHAR U3F01970
                    H2001 DC      /2001     SET OVERFLOW                U3F01980
                    D0001 DC      +1        DECIMAL 1                   U3F01990
                    X0010 DC      /0010     PTTC/8 BLANK                U3F02000
                    *                                                   U3F02010
                    *THIS SECTION STORES THE OUTPUT CHARS               U3F02020
                    *                                                   U3F02030
                    STORE NOP               SAVE RETURN ADDR            U3F02040
                          MDX  L  CNTRL,0   IS O/P FOR LEFT HALF OF WD  U3F02050
                          MDX     STR16     YES, SAVE IN TEMP           U3F02060
                          STO     TEMP                                  U3F02070
                          LD      D0001                                 U3F02080
                    STR12 STO     CNTRL                                 U3F02090
                          BSC  I  STORE                                 U3F02100
                    STR16 SRA     8         NO, ADD IN TEMP AND STORE   U3F02110
                          A       TEMP      CHARS IN OUTPUT AREA.       U3F02120
                          STO   2 0                                     U3F02130
                          SRA     16                                    U3F02140
                          STO     TEMP      CLEAR CHAR STORAGE          U3F02150
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3F02160
                          SRA     16                                    U3F02170
                          MDX     STR12                                 U3F02180
                    *                                                   U3F02190
                    *THIS SECTION CHECKS FOR A CASE SHIFT OR NEW LINE   U3F02200
                    *CHARACTER IN PTTC/8 TO HOLLERITH CONVERSION.       U3F02210
                    *                                                   U3F02220
                    SHIFT NOP               CHK CHAR FOR FOR CASE SHIFT U3F02230
                          AND     H00FF                                 U3F02240
                          STO     CHAR      SAVE CHARACTER              U3F02250
                          AND     H000C                                 U3F02260
                          EOR     H000C     IS CHAR = CONTROL           U3F02270
                          BSC  L  SFT20,Z   NO                          U3F02280
                          LD      CHAR                                  U3F02290
                          SLA     8                                     U3F02300
                          EOR     LOWER     IS CHAR = LOWER CASE        U3F02310
                          BSC  L  SFT18,+-  YES                         U3F02320
                          EOR     LOWER                                 U3F02330
                          EOR     UPPER     IS CHAR = UPPER CASE        U3F02340
                          BSC  L  SFT16,+-  YES                         U3F02350
                          EOR     UPPER                                 U3F02360
                          EOR     NEWLN     IS CHAR = NEW LINE          U3F02370
                          BSC     +-                                    U3F02380
                          STO     COUNT     YES                         U3F02390
                    SFT12 LD      CHAR                                  U3F02400
                    SFT13 MDX  L  SHIFT,+1  NO, SET TO SKIP ONE WORD    U3F02410
                    SFT14 BSC  I  SHIFT                                 U3F02420
                    SFT16 LD      D0001                                 U3F02430
                    SFT18 STO  L  CASE      SET CASE ACCORDINGLY        U3F02440
                          MDX     SFT14                                 U3F02450
                    SFT20 LD      CHAR      IS CHAR = BLANK             U3F02460
                          S       X0010                                 U3F02470
                          BSC  L  SFT12,+-  YES, DON'T CHECK CASE       U3F02480
                          A       X0010                                 U3F02490
                          SRT     7         IS CHAR ILLEGAL             U3F02500
                          BSC  L  SFT22,E                               U3F02510
                          LD   L  CASE      NO, ADD CASE INTO           U3F02520
                          SLT     7         CHAR VALUE.                 U3F02530
                          MDX     SFT13                                 U3F02540
                    SFT22 LD      H2001     YES, SET OVERFLOW ON AND    U3F02550
                          STO  L  SAVST     LOAD BLANK AS               U3F02560
                          LD      X0010     CHARACTER                   U3F02570
                          MDX     SFT13                                 U3F02580
                          END                                           U3F02590
