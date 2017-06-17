                          HDNG    PTTC/8- EBC OR EBC- PTTC/8 CONVERSION U3E00010
                    *************************************************** U3E00020
                    *                                                 * U3E00030
                    *   SUBROUTINE NAME-                              * U3E00040
                    *      FULL NAME- PTTC/8 TO EBCDIC OR EBCDIC TO   * U3E00050
                    *         PTTC/8 CONVERSION SUBROUTINE.           * U3E00060
                    *      CODE NAME- PAPEB                           * U3E00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS EBCDIC      * U3E00080
                    *      SUBSET TO PTTC/8 SUBSET, OR PTTC/8         * U3E00090
                    *      SUBSET TO EBCDIC SUBSET. SUBSET CONSISTS   * U3E00100
                    *      ONLY OF THOSE CHARACTERS WITH AN ASTERISK  * U3E00110
                    *      IN APPENDIX D OF THE IBM 1130 SUBROUTINE   * U3E00120
                    *      LIBRARY MANUAL.                            * U3E00130
                    *   METHOD-                                       * U3E00140
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3E00150
                    *   CAPABILITIES AND LIMITATIONS-                 * U3E00160
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3E00170
                    *   SPECIAL FEATURES- N/A                         * U3E00180
                    *   ADDITIONAL INFORMATION-                       * U3E00190
                    *      ESTIMATED EXECUTION TIME-                  * U3E00200
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3E00210
                    *                                                 * U3E00220
                    *************************************************** U3E00230
                          HDNG    PTTC/8- EBC OR EBC- PTTC/8 CONVERSION U3E00240
                          LIBR                                          U3E00250
                          ENT     PAPEB                                 U3E00260
                    PAPEB STX   1 SAV1+1    CALL ENTRY POINT            U3E00270
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3E00280
                          STX   2 SAV2+1    SAVE XR2                    U3E00290
                          STS     SAVST     SAVE STATUS                 U3E00300
                          STD     SAVAQ     SAVE ACC AND EXT            U3E00310
                          LD    1 1         XR1= ADDR OF CALL+1         U3E00320
                          STO     INPUT+1   INPUT PARAMETER             U3E00330
                          LD    1 2                                     U3E00340
                          STO     OUTPT+1   OUTPUT PARAMETER            U3E00350
                          LD    1 3                                     U3E00360
                          STO  L  COUNT     CHAR COUNT                  U3E00370
                    *                                                   U3E00380
                    *OBTAIN ADDR OF EBPA TABLE                          U3E00390
                    *                                                   U3E00400
                          LD      CALL1     GET TV DISPLACEMENT         U3E00410
                          SLA     8         PROPAGATE SIGN BIT THROUGH  U3E00420
                          SRT     8         FIRST 8 BITS                U3E00430
                          STX   3 TEMP      GET TV TABLE ADDR           U3E00440
                          A       TEMP      COMPUTE ADDR OF THIRD WD OF U3E00450
                          A       D0002     TV                          U3E00460
                          STO     PAP14+1                               U3E00470
                    PAP14 LD   L  0         GET EBPA ENTRY ADDR         U3E00480
                          A       D0003     AVOID STORED LINK WORD      U3E00490
                          STO  L  TLU12+1   ST EBPA TABLE ADDR          U3E00500
                          STO  L  TLU14+1                               U3E00510
                          SRA     16        SET OUTPUT CONTROL FOR      U3E00520
                          STO     CNTRL     LEFT CHARACTER.             U3E00530
                          LD    1 0         GET CONTROL PARAM           U3E00540
                          EOR  L  H0010     SET CARRY INDR ON IF        U3E00550
                          SLA     12        INITLZ CASE REQUESTED       U3E00560
                          STO     CODE      SAVE OUTPUT CODE INDR       U3E00570
                          MDX   1 +4                                    U3E00580
                          STX   1 EXIT+1    SET EXIT FOR CALL+5         U3E00590
                    INPUT LDX  L1 0         XR1= INPUT ADDR             U3E00600
                    OUTPT LDX  L2 0         XR2= OUTPUT ADDR            U3E00610
                          BSC  L  PAPIN,+-  BR IF PTTC/8 TO EBCDIC      U3E00620
                    *                                                   U3E00630
                    *THIS SECTION SETS UP THE CONVERSION FROM EBCDIC    U3E00640
                    *TO PTTC/8, AND STORES THE OUTPUT                   U3E00650
                    *                                                   U3E00660
                    EBCIN LD      HFF00                                 U3E00670
                          STO  L  MASK      SET UP TABLE LOOKUP MASK    U3E00680
                          BSC     C                                     U3E00690
                          STO     CASE      SET UP CASE CHANGE INDR     U3E00700
                    EBC12 LD    1 0                                     U3E00710
                          BSI     TLU       CONVERT LEFT EBCDIC CHAR    U3E00720
                    EBC13 BSI     CHECK     CHECK CASE AND STORE CHAR   U3E00730
                          MDX  L  COUNT,-1  ANY MORE EBCDIC CHARS       U3E00740
                          MDX     EBC14     YES,GO CONVERT RT CHAR      U3E00750
                          MDX     EBC18     NO,GO TERMINATE O/P         U3E00760
                    EBC14 LD    1 0                                     U3E00770
                          SLA     8                                     U3E00780
                          BSI     TLU       CONVERT RT EBCDIC CHAR      U3E00790
                          BSI     CHECK     CHECK CASE AND ST CHAR      U3E00800
                          MDX   1 +1        SET FOR NEXT INPUT WORD     U3E00810
                          MDX  L  COUNT,-1  ANY MORE EBCDIC CHARS       U3E00820
                          MDX     EBC12     YES,REPEAT LOOP FOR NEXT WD U3E00830
                    EBC18 LD      TEMP      NO, ANY CHAR LEFT TO        U3E00840
                          BSC  L  SAV1,+-   STORE.                      U3E00850
                          MDX  L  CODE,0    YES, WHAT CODE OUT          U3E00860
                          A       H003F     PTTC/8 DELETE               U3E00870
                          A       H0040     EBCDIC SPACE                U3E00880
                          STO   2 0         STORE LAST CHAR             U3E00890
                    SAV1  LDX  L1 *-*       RESTORE XR1                 U3E00900
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U3E00910
                    SAVST LDS     *-*       RESTORE STATUS              U3E00920
                          LDD     SAVAQ     RESTORE ACC AND EXT         U3E00930
                    EXIT  BSC  L  0         EXIT                        U3E00940
                    *                                                   U3E00950
                    *CONSTANTS AND BUFFER AREA                          U3E00960
                    *                                                   U3E00970
                    SAVAQ BSS  E  2         SAVE ACC AND EXTENSION      U3E00980
                    CALL1 LIBF    EBPA      USED TO GET EBPA TBL ADDR   U3E00990
                    CODE  DC      0         O/P CODE INDR(0 IF EBCDIC)  U3E01000
                    TEMP  DC      0         WORKING STORAGE             U3E01010
                    D0002 DC      +2        DECIMAL CONSTANT            U3E01020
                    D0003 DC      +3        DECIMAL CONSTANT            U3E01030
                    CNTRL DC      0         O/P CONTROL(0=LEFT)         U3E01040
                    HFF00 DC      /FF00     HIGH AND                    U3E01050
                    H00FF DC      /00FF     LOW BIT MASKS               U3E01060
                    H003F DC      /003F     3F+40=PTTC/8 DELETE         U3E01070
                    H0040 DC      /0040     EBCDIC BLANK                U3E01080
                    *                                                   U3E01090
                    *THIS SECTION SETS UP THE PTTC/8 TO EBCDIC CON-     U3E01100
                    *VERSION AND OUTPUT OF EBCDIC                       U3E01110
                    *                                                   U3E01120
                    PAPIN BSC     C         CHK FOR INITLZ CASE REQUEST U3E01130
                          STO     CASE      NONE, ZERO CASE             U3E01140
                          LD      H00FF                                 U3E01150
                          STO     MASK      SET UP TABLE LOOK-UP MASK   U3E01160
                    PAP22 LD    1 0         GET A PTTC/8 CHAR           U3E01170
                          SRA     8                                     U3E01180
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3E01190
                          MDX     PAP24     YES, CHECK NEXT CHAR        U3E01200
                          BSI     TLU       CONVERT LEFT PTTC/8 CHAR    U3E01210
                          BSI     STORE     STORE CONVERTED CHAR        U3E01220
                    PAP24 MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3E01230
                          MDX     PAP26     YES, GO CONVERT RT CHAR     U3E01240
                          MDX     EBC18     NO, GO EXIT                 U3E01250
                    PAP26 LD    1 0                                     U3E01260
                          BSI     SHIFT     IS CHAR = CASE SHIFT        U3E01270
                          MDX     PAP28     YES, CHK NEXT CHAR          U3E01280
                          BSI     TLU       CONVERT RT PTTC/8 CHAR      U3E01290
                          BSI     STORE     STORE CONVERTED CHAR        U3E01300
                    PAP28 MDX   1 +1        SET FOR NEXT INPUT WORD     U3E01310
                          MDX  L  COUNT,-1  ANY MORE PTTC/8 CHARS       U3E01320
                          MDX     PAP22     YES, REPEAT LOOP            U3E01330
                          MDX     EBC18     NO, GO PREPARE FOR EXIT     U3E01340
                    *                                                   U3E01350
                    *THIS SECTION CHECKS THE CASE AND STORES THE CHAR   U3E01360
                    *                                                   U3E01370
                    CHECK NOP               STORE RETURN ADDRESS        U3E01380
                          AND     H00FF     GET CORRECT PTTC/8 CHAR     U3E01390
                          S       H0010     IS CHAR = BLANK             U3E01400
                          BSC  L  CHK18,+-  YES, GO STORE BLANK         U3E01410
                          A       H0010     NO,RESTORE CHAR             U3E01420
                          SRT     2         IS CHAR = CONTROL           U3E01430
                          BSC     E         (BITS 12-13 = 11)           U3E01440
                          MDX     CHK10                                 U3E01450
                          MDX     CHK12                                 U3E01460
                    CHK10 SRT     1                                     U3E01470
                          BSC  L  CHK16,E   YES, NO CASE CHECK          U3E01480
                          SLT     1                                     U3E01490
                    CHK12 SRT     5         NO, SAVE CHAR IN EXTENSION  U3E01500
                          EOR     CASE                                  U3E01510
                          BSC  L  CHK14,+-  IS CASE CHANGE NEEDED       U3E01520
                          EOR     CASE                                  U3E01530
                          STO     CASE                                  U3E01540
                          SLA     16        YES, WHICH CASE             U3E01550
                          LD      LOWER     = LOWER CASE CHAR           U3E01560
                          BSC     C                                     U3E01570
                          LD      UPPER     = UPPER CASE CHAR           U3E01580
                          BSI     STORE     STORE CASE CHAR             U3E01590
                          SLA     1                                     U3E01600
                    CHK14 SLT     7                                     U3E01610
                    CHK15 SLA     8                                     U3E01620
                          BSI     STORE     STORE PAPER TAPE CHAR       U3E01630
                          BSC  I  CHECK                                 U3E01640
                    CHK16 SRT     4         IS CONTROL CHAR = NL        U3E01650
                          BSC     E                                     U3E01660
                          STO     COUNT     YES,SET LAST CHAR INDR      U3E01670
                    *                                                   U3E01680
                    *CONSTANTS                                          U3E01690
                    *                                                   U3E01700
                          MDX     CHK14                                 U3E01710
                    CHK18 LD      H0010     CHAR = SPACE                U3E01720
                          MDX     CHK15                                 U3E01730
                    CASE  DC      0         CASE INDR(0=LOWER,1=UPPER)  U3E01740
                    COUNT DC      0         CHAR COUNT                  U3E01750
                    LOWER DC      /6E00     LOWER CASE PTTC/8 CONTROL   U3E01760
                    UPPER DC      /0E00     UPPER CASE PTTC-8 CONTROL   U3E01770
                    H0010 DC      /0010     PTTC/8 BLANK                U3E01780
                    *                                                   U3E01790
                    *THIS SECTION DOES A TABLE LOOKUP CONVERSION OF     U3E01800
                    *PTTC/8 TO EBCDIC OR EBCDIC TO PTTC/8.              U3E01810
                    *                                                   U3E01820
                    TLU   NOP               SAVE RETURN ADDRESS         U3E01830
                          STO     CHAR      SAVE INPUT                  U3E01840
                          STX   1 TLU16+1   SAVE XR1                    U3E01850
                          LDX   1 +75       XR1=LENGTH OF EBPA TABLE    U3E01860
                    TLU12 EOR  L1 0         CHK AGAINST EBPA ENTRY      U3E01870
                          AND     MASK      IF CHKS,MAKE ZERO           U3E01880
                          BSC  L  TLU14,+-  HAS CHAR BEEN FOUND         U3E01890
                          LD      CHAR      NO,RESTORE CHAR             U3E01900
                          MDX   1 -1        ANY MORE TABLE REMAINING    U3E01910
                          MDX     TLU12     YES, REPEAT LOOP            U3E01920
                          LD      H2001     NO, TURN OVFLO ON           U3E01930
                          STO     SAVST                                 U3E01940
                    TLU14 LD   L1 0         CHAR FOUND,PUT EBPA WD INTO U3E01950
                    TLU16 LDX  L1 0         ACC AND RESTORE XR1         U3E01960
                          BSC  I  TLU       RETURN                      U3E01970
                    *                                                   U3E01980
                    *CONSTANTS AND BUFFER AREA                          U3E01990
                    *                                                   U3E02000
                    CHAR  DC      0         CHAR TO BE CONVERTED        U3E02010
                    MASK  DC      0         MASK FOR INPUT CODE         U3E02020
                    NEWLN DC      /DD00     NEW LINE PTTC/8 CONTROL     U3E02030
                    H000C DC      /000C     CHECK FOR CONTROL CHAR      U3E02040
                    H2001 DC      /2001     CON TO SET OVRFLO ON        U3E02050
                    D0001 DC      +1        DECIMAL 1                   U3E02060
                    *                                                   U3E02070
                    *THIS SECTION STORES CONVERTED CHARS IN THE         U3E02080
                    *    OUTPUT AREA.                                   U3E02090
                    *                                                   U3E02100
                    STORE NOP               SAVE RETURN ADDR            U3E02110
                          MDX  L  CNTRL,0   IS OUTPUT FOR LEFT WORD(=0) U3E02120
                          MDX     STR16                                 U3E02130
                          AND     HFF00     YES, STORE IN TEMP          U3E02140
                          STO     TEMP                                  U3E02150
                          LD      D0001     SET CONTROL FOR RT HALF     U3E02160
                    STR12 STO     CNTRL                                 U3E02170
                          BSC  I  STORE                                 U3E02180
                    STR16 SRA     8         NO, ADD IN TEMP AND STORE   U3E02190
                          A       TEMP      CHARS IN O/P AREA           U3E02200
                          STO   2 0                                     U3E02210
                          SRA     16                                    U3E02220
                          STO     TEMP      CLEAR CHAR STORAGE          U3E02230
                          MDX   2 +1        SET FOR NEXT O/P WORD       U3E02240
                          SRA     16        SET CONTROL FOR LEFT HALF   U3E02250
                          MDX     STR12                                 U3E02260
                    *                                                   U3E02270
                    *THIS SECTION CHECKS IF THE CHAR IS A CONTROL CHAR, U3E02280
                    *WHETHER IT IS LEGAL OR NOT,WHETHER IT IS A CASE    U3E02290
                    *SHIFT OR NEW LINE CHAR.                            U3E02300
                    *                                                   U3E02310
                    SHIFT NOP               SAVE RETURN ADDRESS         U3E02320
                          AND     H00FF                                 U3E02330
                          STO     CHAR      SAVE CHARACTER              U3E02340
                          AND     H000C                                 U3E02350
                          EOR     H000C     IS CHAR = CONTROL           U3E02360
                          BSC  L  SFT20,Z   NO                          U3E02370
                          LD      CHAR                                  U3E02380
                          SLA     8                                     U3E02390
                          EOR     LOWER     IS CHAR = LOWER CASE        U3E02400
                          BSC  L  SFT18,+-  YES                         U3E02410
                          EOR     LOWER                                 U3E02420
                          EOR     UPPER     IS CHAR = UPPER CASE        U3E02430
                          BSC  L  SFT16,+-  YES                         U3E02440
                          EOR     UPPER                                 U3E02450
                          EOR     NEWLN     IS CHAR = NEW LINE          U3E02460
                          BSC     +-                                    U3E02470
                          STO     COUNT     YES                         U3E02480
                    SFT12 LD      CHAR                                  U3E02490
                    SFT13 MDX  L  SHIFT,+1  NO, SHIFT TO SKIP ONE WORD  U3E02500
                    SFT14 BSC  I  SHIFT                                 U3E02510
                    SFT16 LD      D0001                                 U3E02520
                    SFT18 STO     CASE      SET CASE ACCORDINGLY        U3E02530
                          MDX     SFT14                                 U3E02540
                    SFT20 LD      CHAR      IS CASE = BLANK             U3E02550
                          S       H0010                                 U3E02560
                          BSC  L  SFT12,+-  YES, DON'T CHECK CASE       U3E02570
                          A       H0010                                 U3E02580
                          SRT     7         IS CHAR ILLEGAL             U3E02590
                          BSC  L  SFT22,E                               U3E02600
                          LD      CASE      NO, ADD CASE INTO           U3E02610
                          SLT     7         CHAR VALUE.                 U3E02620
                          MDX     SFT13                                 U3E02630
                    SFT22 LD      H2001     YES, SET OVFLO ON           U3E02640
                          STO  L  SAVST     AND LOAD BLANK AS           U3E02650
                          LD   L  H0010     CHARACTER.                  U3E02660
                          MDX     SFT13                                 U3E02670
                          END                                           U3E02680
