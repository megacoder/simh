                          HDNG    INITIAL LD UTILITY CARTRIDGE BUILDER  ZUC00010
                    *************************************************** ZUC00020
                    *                                                 * ZUC00030
                    *   PROGRAM NAME- INITIAL LOAD UTILITY CARTRIDGE  * ZUC00040
                    *      BUILDER.                                   * ZUC00050
                    *      CODE NAME- UCART                           * ZUC00060
                    *   FUNCTION/OPERATION-                           * ZUC00070
                    *      THE PURPOSE OF THIS PROGRAM IS TO STORE A  * ZUC00080
                    *      DISK MONITOR SYSTEM INITIAL LOAD DECK ON A * ZUC00090
                    *      DISK CARTRIDGE.  THIS CARTRIDGE MAY THEN BE* ZUC00100
                    *      USED TO TRANSPORT THE SYSTEM DECK TO A     * ZUC00110
                    *      USER.  THE USER PERFORMS A COLD START WITH * ZUC00120
                    *      THIS CARTRIDGE USING A SYSTEM COLD START   * ZUC00130
                    *      CARD CAUSING THE CARD DECK PREVIOUSLY      * ZUC00140
                    *      STORED TO BE PUNCHED.                      * ZUC00150
                    *                                                 * ZUC00160
                    *      UCART READS CARDS FROM A 1442 MODEL 6 CARD * ZUC00170
                    *      READER.  THE CARD IMAGES ARE STORED IN     * ZUC00180
                    *      SUCCESSIVE DISK SECTORS, 4 CARDS PER SCTR, * ZUC00190
                    *      BEGINNING WITH SCTR 8 OF LOGICAL DRIVE 1.  * ZUC00200
                    *      A PROGRAM TO DUMP THE CARDS SO STORED,     * ZUC00210
                    *      ALONG WITH THE NECESSARY PUNCH SUBROUTINE, * ZUC00220
                    *      COLD START PROGRAM, AND THE RESIDENT CORE  * ZUC00230
                    *      IMAGE, IS STORED ON CYLINDER 0 OF THE DISK.* ZUC00240
                    *   ENTRY POINTS-                                 * ZUC00250
                    *      UCART HAS ONLY ONE ENTRY POINT. THE PROGRAM* ZUC00260
                    *      IS ENTERED AS FOLLOWS--                    * ZUC00270
                    *             // JOB    XXXX YYYY                 * ZUC00280
                    *             // XEQ UCART                        * ZUC00290
                    *                                                 * ZUC00300
                    *      WHERE XXXX IS THE LABEL OF THE MASTER CART * ZUC00310
                    *      AND YYYY IS THE LABEL OF THE CART ON       * ZUC00320
                    *      WHICH THE CARDS ARE TO BE STORED.          * ZUC00330
                    *   INPUT- CARDS.  THE 80-80 IMAGE TO BE STORED ON* ZUC00340
                    *      DISC.                                      * ZUC00350
                    *   OUTPUT-  A DISK CARTRIDGE CONTAINING CARD     * ZUC00360
                    *      IMAGES IS GENERATED.                       * ZUC00370
                    *   EXTERNAL REFERENCES-                          * ZUC00380
                    *      $CIBA  ADDR OF CIB ON MASTER CARTRIDGE     * ZUC00390
                    *      $CH12  CHANNEL 12 INDICATOR                * ZUC00400
                    *      $IBSY  PRINCIPAL I/O BUSY INDICATOR        * ZUC00410
                    *      $IOCT  IOCS CTR                            * ZUC00420
                    *      $LAST  LAST CARD INDICATOR                 * ZUC00430
                    *      $EXIT  ADDR CALL EXIT ENTRY POINT          * ZUC00440
                    *      $PST4  ADDR OF POST-OPERATIVE ERROR TRAP   * ZUC00450
                    *      $CYLN  LOGICAL 0 ARM POSITION              * ZUC00460
                    *      $ACDE  AREA CODE FOR LOGICAL DRIVE 0       * ZUC00470
                    *      $DCYL  1ST DEFECTIVE CYL ADDR, LOGICAL DR 0* ZUC00480
                    *      $I405  ILS04 ENTRY POINT                   * ZUC00490
                    *      $IBT4  INTERRUPT BRANCH TABLE ADDR- LEVEL 4* ZUC00500
                    *      $DBSY  DISK BUSY INDICATOR                 * ZUC00510
                    *      DZ000  DISKZ ENTRY POINT                   * ZUC00520
                    *      $ZEND  LAST WORD OF DISKZ+1                * ZUC00530
                    *      @RIAD  SECTOR CONTAINING RESIDENT IMAGE    * ZUC00540
                    *   EXITS-                                        * ZUC00550
                    *      NORMAL-                                    * ZUC00560
                    *         BR TO CALL EXIT ENTRY POINT             * ZUC00570
                    *      ERROR-                                     * ZUC00580
                    *         NOT APPLICABLE                          * ZUC00590
                    *   TABLES/WORK AREAS-                            * ZUC00600
                    *      NONE                                       * ZUC00610
                    *   ATTRIBUTES-                                   * ZUC00620
                    *      NONE                                       * ZUC00630
                    *   NOTES-                                        * ZUC00640
                    *      PROGRAM REVISED IN MOD 2                  *  ZUC00650
                    *                                                 * ZUC00660
                    *************************************************** ZUC00670
                          HDNG    INITIAL LD UTILITY CARTRIDGE BUILDER  ZUC00680
                    *                                                   ZUC00690
                    *             SYSTEM EQUATE STATEMENTS              ZUC00700
                    *                                                   ZUC00710
                    $CIBA EQU     /5                                    ZUC00720
                    $CH12 EQU     /6                                    ZUC00730
                    $IBSY EQU     /13                                   ZUC00740
                    $IOCT EQU     /32                                   ZUC00750
                    $LAST EQU     /33                                   ZUC00760
                    $EXIT EQU     /38                                   ZUC00770
                    $PST4 EQU     /8D                                   ZUC00780
                    $CYLN EQU     /9A                                   ZUC00790
                    $ACDE EQU     /9F                                   ZUC00800
                    $DCYL EQU     /A4                                   ZUC00810
                    $I405 EQU     /D3                                   ZUC00820
                    $IBT4 EQU     $I405+1                               ZUC00830
                    $DBSY EQU     /EE                                   ZUC00840
                    DZ000 EQU     /F2                                   ZUC00850
                    $ZEND EQU     /1E0                                  ZUC00860
                    @RIAD EQU     2                                     ZUC00870
                    *                                                   ZUC00880
                    *             MISCELLANEOUS EQUATE STATEMENTS       ZUC00890
                    *                                                   ZUC00900
                    ZBADR EQU     /250                                  ZUC00910
                    A     EQU     ZBADR+320 START OF DUMP ROUTINE       ZUC00920
                    Y     EQU     /7F                                   ZUC00930
                    *                                                   ZUC00940
                    *             GET PRINCIPAL I/O ROUTINE             ZUC00950
                    *                                                   ZUC00960
                    ZC000 LD   L  $IBT4     SAVE BRANCH TABLE POINTER   ZUC00970
                          STO     ZC920                                 ZUC00980
                          LDD  L  8         INTERRUPT BR ADDRESSES      ZUC00990
                          STD     ZC921     TEMPORARY STORAGE           ZUC01000
                          CALL    FSLEN                                 ZUC01010
                          DC      /90       PHASE ID OF 1442 ROUTINE    ZUC01020
                          CALL    FSYSU                                 ZUC01030
                          S       ZC911     THREE                       ZUC01040
                          STO     *+1       ADDR OF WORD COUNT          ZUC01050
                    ZC010 LDX  L1 *-*                                   ZUC01060
                    *                                                   ZUC01070
                    *             STORE 1442 ROUTINE TO SECTOR 3        ZUC01080
                    *                                                   ZUC01090
                          RTE     16        SHIFT ADDR TO EXTENSION     ZUC01100
                          LD      ZC910     SCTR ADDR /1003             ZUC01110
                          STO   1 1                                     ZUC01120
                          LD      ZC912     /7001 WRITE FUNC CODE       ZUC01130
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01140
                    *                                                   ZUC01150
                    *             READ SECTOR 0 FROM MASTER CARTRIDGE   ZUC01160
                    *                                                   ZUC01170
                          LD      ZC914     1 SCTR WORD COUNT           ZUC01180
                          STO   1 0                                     ZUC01190
                          LD      ZC010+1   ADDR OF BUFFER WORD COUNT   ZUC01200
                          SRT     16        SHIFT TO EXTENSION, ACC=0   ZUC01210
                          STO   1 1         ADDR SCTR 0 OF MASTER       ZUC01220
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01230
                    *                                                   ZUC01240
                    *             BUILD SECTOR 0 FOR SPECIAL DUMP CART  ZUC01250
                    *                                                   ZUC01260
                          LDD     ZC913     WD COUNT AND SCTR ADDR      ZUC01270
                          STD   1 0         WD CNT=4, SCTR ADDR=1000    ZUC01280
                          LD      ZC010+1   ADDR OF BUFFER WORD COUNT   ZUC01290
                          SRT     16        SHIFT TO EXTENSION, ACC=0   ZUC01300
                    *                                                   ZUC01310
                    *             OVERLAY DEFECTIVE CYL TABLE AND CART  ZUC01320
                    *             ID FROM LOGICAL 1 CARTRIDGE           ZUC01330
                    *                                                   ZUC01340
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01350
                    *                                                   ZUC01360
                    *             MOVE SPECIAL COLD START TO BUFFER     ZUC01370
                    *                                                   ZUC01380
                          LD      ZC911     SET STATUS                  ZUC01384
                          STO   1 9         *WORD (WORD 7 = +3)         ZUC01386
                          STX   1 ZC050+1   SET UP BUFFER ADDR TO MOVE  ZUC01390
                          LD      ZC050+1   *SPECIAL COLD START TO END  ZUC01400
                          A       ZC914     *OF SCTR 0 BUFFER           ZUC01410
                          A       ZC915                                 ZUC01420
                          STO     ZC050+1                               ZUC01430
                          LDX   2 ZB800-ZB830  MOVE WORD COUNT          ZUC01440
                          LD   L2 ZB830     NEXT WORD TO MOVE           ZUC01450
                    ZC050 STO  L2 *-*       MOVE SPECIAL COLD START     ZUC01460
                          MDX   2 1         INCR MOVE COUNTER           ZUC01470
                          MDX     ZC050-2   BR TO MOVE NEXT WORD        ZUC01480
                    *                                                   ZUC01490
                    *             WRITE SCTR 0 TO SPECIAL DUMP CART     ZUC01500
                    *                                                   ZUC01510
                          LD      ZC914     1 SCTR WORD COUNT (320)     ZUC01520
                          STO   1 0                                     ZUC01530
                          LD      ZC010+1   WD COUNT ADDRESS            ZUC01540
                          RTE     16        SHIFT INTO EXTENSION        ZUC01550
                          LD      ZC912     WRITE FUNC CODE             ZUC01560
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01570
                    *                                                   ZUC01580
                    *             GET RESIDENT IMAGE FROM MASTER CART   ZUC01590
                    *             AND STORE ON SPECIAL DUMP CARTRIDGE   ZUC01600
                    *                                                   ZUC01610
                          LD      ZC915     SCTR ADDR /0002 OF RESIDENT ZUC01620
                          STO   1 1                                     ZUC01630
                          LD      ZC010+1   ADDR OF BUFFER WORD COUNT   ZUC01640
                          SRT     16        SHIFT TO EXTENSION, ACC=0   ZUC01650
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01660
                          LD      ZC915+1   SCTR ADDR /1002             ZUC01670
                          STO   1 1                                     ZUC01680
                          LD      ZC010+1   ADDR OF BUFFER WORD COUNT   ZUC01690
                          RTE     16        SHIFT TO EXTENSION          ZUC01700
                          LD      ZC912     WRITE FUNC CODE             ZUC01710
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01720
                    *                                                   ZUC01730
                    *             STORE DISK TO CARD DUMP ON SCTR 4     ZUC01740
                    *                                                   ZUC01750
                          LD      ZC916     ADDR OF BUFFER WORD COUNT   ZUC01760
                          RTE     16                                    ZUC01770
                          LD      ZC912     WRITE FUNC CODE             ZUC01780
                          BSI     ZC100     BR TO DO DISK OPERATION     ZUC01790
                          LD      ZC920                                 ZUC01800
                          STO  L  $IBT4     RESTORE BRANCH TBL POINTER  ZUC01810
                          LDD     ZC921     RESTORE INTERRUPT           ZUC01820
                          STD  L  8         *BRANCH ADDRESSES           ZUC01830
                          MDX     ZA000     BR TO READ CARDS            ZUC01840
                    *                                                   ZUC01850
                    *             CONSTANTS                             ZUC01860
                    *                                                   ZUC01870
                    ZC910 DC      /1003     SCTR ADDR OF 1442 ROUTINE   ZUC01880
                    ZC911 DC      3         DECIMAL THREE               ZUC01890
                    ZC912 DC      /7001     WRITE FUNCTION CODE         ZUC01900
                          BSS  E  0         MAKE ADDRESS EVEN           ZUC01910
                    ZC913 DC      4         WORD COUNT-DEF CYL TBL      ZUC01920
                          DC      /1000     SCTR ZERO ADDR LOGICAL 1    ZUC01930
                    ZC914 DC      320       1 SECTOR WORD COUNT         ZUC01940
                    ZC915 DC      /0002     SCTR ADDR OF RESIDENT-LOG 0 ZUC01950
                          DC      /1002     SCTR ADDR OF RESIDENT-LOG 1 ZUC01960
                    ZC916 DC      ZB000-2   ADDR OF WORD COUNT          ZUC01970
                    ZC920 DC      *-*       TEMP FOR IBT POINTER        ZUC01980
                          BSS  E  0         MAKE ADDR EVEN              ZUC01990
                    ZC921 DC      *-*       TEMPORARY FOR               ZUC02000
                          DC      *-*       *INTERRUPT BR ADDRESSES     ZUC02010
                    *                                                   ZUC02020
                    *             CALL DISK ROUTINE AND WAIT FOR        ZUC02030
                    *             COMPLETION.                           ZUC02040
                    *                                                   ZUC02050
                    ZC100 DC      *-*       RETURN ADDRESS              ZUC02060
                          BSI  L  DZ000     BR TO DISK ROUTINE          ZUC02070
                          LD   L  $DBSY     DISK BUSY INDR              ZUC02080
                          BSC     Z         SKIP NEXT IF DONE           ZUC02090
                          MDX     *-4                                   ZUC02100
                          BSC  I  ZC100     EXIT                        ZUC02110
                          HDNG    CARD IMAGE TO DISK ROUTINE            ZUC02120
                    *                                                   ZUC02130
                    *             INITIALIZE                            ZUC02140
                    *                                                   ZUC02150
                    ZA000 LDX   2 -32       CARD READ COUNTER           ZUC02160
                          LDX  L1 ZA990     BUFFER WORD COUNT ADDRESS   ZUC02170
                    *                                                   ZUC02180
                    *             READ 32 CARDS INTO BUFFER             ZUC02190
                    *                                                   ZUC02200
                    ZA010 STX   1 ZA020     SET UP BUFFER ADDR FOR CALL ZUC02210
                          LD    1 0         COLUMN 80 PREVIOUS CARD     ZUC02220
                          STO     ZA920     SAVE COLUMN 80              ZUC02230
                          LD      ZA911     WORD COUNT (80)             ZUC02240
                          STO   1 0         SET UP WD CNT FOR CARD READ ZUC02250
                          LIBF    CARD1     READ A CARD                 ZUC02260
                          DC      /1000     FUNCTION CODE               ZUC02270
                    ZA020 DC      *-*       ADDR OF BUFFER WD COUNT     ZUC02280
                          DC      ZA200     ERROR SUBROUTINE ADDRESS    ZUC02290
                    *                                                   ZUC02300
                    *             CHECK FOR READER BUSY                 ZUC02310
                    *                                                   ZUC02320
                    ZA030 LIBF    CARD1                                 ZUC02330
                          DC      0         TEST FUNCTION CODE          ZUC02340
                          MDX     *-3       LOOP ON BUSY                ZUC02350
                    *                                                   ZUC02360
                    *             CHECK FOR LAST CARD READ              ZUC02370
                    *                                                   ZUC02380
                          LD      ZA921     LAST CARD INDICATOR         ZUC02390
                          BSC  L  ZA040,+-  BR IF NOT LAST CARD         ZUC02400
                          LD    1 80        LAST COLUMN - LAST CARD     ZUC02410
                          OR      ZA910     BIT 15                      ZUC02420
                          STO   1 80                                    ZUC02430
                          LDX   2 -1        SET XR2 TO TERMINATE READ   ZUC02440
                    *                                                   ZUC02450
                    *             TEST FOR 32 CARDS READ IN             ZUC02460
                    *                                                   ZUC02470
                    ZA040 LD      ZA920     LAST CARD - COLUMN 80       ZUC02480
                          STO   1 0         RESTORE                     ZUC02490
                          MDX   1 80        INCR BUFFER POINTER         ZUC02500
                          MDX   2 1         INCR READ COUNTER           ZUC02510
                          MDX     ZA010     BR TO READ ANOTHER CARD     ZUC02520
                    *                                                   ZUC02530
                    *             DUMP TO DISK                          ZUC02540
                    *                                                   ZUC02550
                          LDD     ZA900     DISK WRITE IOCC             ZUC02560
                          BSI  L  DZ000     WRITE ONE CYLINDER          ZUC02570
                    *                                                   ZUC02580
                    *             CHECK FOR WRITE COMPLETE              ZUC02590
                    *                                                   ZUC02600
                          LD   L  $DBSY     DISK BUSY INDR              ZUC02610
                          BSC     Z         SKIP IF WRITE COMPLETE      ZUC02620
                          MDX     *-4       LOOP ON BUSY                ZUC02630
                    *                                                   ZUC02640
                    *             TEST FOR LAST CARD FOUND OR           ZUC02650
                    *             *DISK CARTRIDGE FILLED.               ZUC02660
                    *                                                   ZUC02670
                          MDX  L  ZA990,8   INCR DISK ADDR TO NEXT CYL  ZUC02680
                          MDX  L  ZA921,0   SKIP NEXT IF NOT LAST CARD  ZUC02690
                          MDX     ZA100     BR TO FEED OUT LAST CARD    ZUC02700
                          LD      ZA990     CURRENT DISK ADDRESS        ZUC02710
                          S       ZA913     END CONSTANT (1640)         ZUC02720
                          BSC  L  ZA000,Z   BR TO READ MORE CARDS       ZUC02730
                    *                                                   ZUC02740
                    *             EXIT                                  ZUC02750
                    *                                                   ZUC02760
                    ZA050 BSC  L  $EXIT     EXIT TO SUPERVISOR          ZUC02770
                    *                                                   ZUC02780
                    *             FEED OUT LAST CARD                    ZUC02790
                    *                                                   ZUC02800
                    ZA100 LIBF    CARD1     FEED A CARD                 ZUC02810
                          DC      /3000     FUNCTION CODE               ZUC02820
                          DC      ZA200     ERROR SUBROUTINE ADDRESS    ZUC02830
                          MDX     ZA050     BR TO END                   ZUC02840
                    *                                                   ZUC02850
                    *             CARD ERROR SUBROUTINE                 ZUC02860
                    *                                                   ZUC02870
                    ZA200 DC      *-*       ENTRY POINT                 ZUC02880
                          BSC     +-        SKIP IF READ OR FEED CHECK  ZUC02890
                          STX     ZA921     SET LAST CARD INDICATOR     ZUC02900
                          BSC  I  ZA200     EXIT                        ZUC02910
                    *                                                   ZUC02920
                    *             CONSTANTS AND WORK AREA               ZUC02930
                    *                                                   ZUC02940
                    ZA910 DC      1         DECIMAL ONE CONSTANT        ZUC02950
                    ZA911 DC      80        CARD WORD COUNT             ZUC02960
                    ZA913 DC      /1640     DISK END CONSTANT           ZUC02970
                    ZA920 DC      *-*       COLUMN 80 TEMPORARY         ZUC02980
                    ZA921 DC      *-*       LAST CARD INDICATOR         ZUC02990
                    *                                                   ZUC03000
                    *             DISK WRITE IOCC                       ZUC03010
                    *                                                   ZUC03020
                          BSS  E  0         MAKE ADDR EVEN              ZUC03030
                    ZA900 DC      /7001     WRITE FUNCTION CODE         ZUC03040
                          DC      ZA990-1   ADDR OF DISK WD COUNT       ZUC03050
                    *                                                   ZUC03060
                    *             CARD TO DISK BUFFER - 1 CYLINDER LONG ZUC03070
                    *                                                   ZUC03080
                          DC      2560      WORD COUNT                  ZUC03090
                    ZA990 DC      /1008     SCTR ADDRESS                ZUC03100
                          BSS     2560      RESERVE 2560 WORDS          ZUC03110
                          ORG     *-/1D0                                ZUC03120
                          HDNG    DISK- CD DUMP AND SPECIAL COLD START ZZUC03130
                    *                                                   ZUC03140
                    *             DISK TO CARD DUMP ROUTINE - THIS      ZUC03150
                    *             *ROUTINE IS STORED IN SCTR 4 OF THE   ZUC03160
                    *             *SPECIAL DUMP CARTRIDGE.  WHEN A COLD ZUC03170
                    *             *START IS PERFORMED, THIS PROGRAM IS  ZUC03180
                    *             *READ INTO CORE AND EXECUTED CAUSING  ZUC03190
                    *             *AN INITIAL SYSTEM LOAD DECK TO BE    ZUC03200
                    *             *PUNCHED.                             ZUC03210
                    *                                                   ZUC03220
                    *                                                   ZUC03230
                    *             SET UP COLUMN INTERRUPT AND ADDR OF   ZUC03240
                    *             LEVEL 4 INTERRUPT BRANCH TABLE        ZUC03250
                    *                                                   ZUC03260
                          DC      ZB500-ZB000  WORD COUNT               ZUC03270
                          DC      /1004     SECTOR ADDRESS              ZUC03280
                    ZB000 LD      ZB903                                 ZUC03290
                          STO  L  $IBT4     ADDR OF IBT                 ZUC03300
                          LD      ZB902                                 ZUC03310
                          STO  L  8         COLUMN INTERRUPT ENTRY PT   ZUC03320
                    *                                                   ZUC03330
                    *             PUNCH FIRST CARD AS BLANK             ZUC03340
                    *                                                   ZUC03350
                          SLA     16        CLEAR ACCUMULATOR           ZUC03360
                          LDX   1 -80       XR1= CLEAR BUFFER COUNTER   ZUC03370
                    ZB002 STO  L1 ZB990-ZB000+A+81  CLEAR 1ST CD BUFFER ZUC03380
                          MDX   1 1         INCR CLEAR COUNTER          ZUC03390
                          MDX     ZB002     BR TO CONTINUE CLEARING     ZUC03400
                          LDX   2 -1        SET TO PUNCH ONE CARD ONLY  ZUC03410
                          MDX     ZB009     BR TO PUNCH ONE CARD        ZUC03420
                    *                                                   ZUC03430
                    *             READ A CYLINDER FROM DISK             ZUC03440
                    *                                                   ZUC03450
                    ZB005 LDD     ZB905     FUNC CODE AND WD CNT ADDR   ZUC03460
                          BSI  L  DZ000     BR TO READ FROM DISK        ZUC03470
                          LD   L  $DBSY                                 ZUC03480
                          BSC     Z                                     ZUC03490
                          MDX     *-4                                   ZUC03500
                    *                                                   ZUC03510
                    *             PUNCH 32 CARDS                        ZUC03520
                    *                                                   ZUC03530
                          LDX   2 -32       CARD PUNCH COUNTER          ZUC03540
                    ZB009 LDX  L1 ZB990-ZB000+A  BUFFER WD CNT ADDRESS  ZUC03550
                    ZB010 STX   1 ZB906+1                               ZUC03560
                          LD      ZB911     PUNCH STOP BIT              ZUC03570
                          OR    1 80                                    ZUC03580
                          STO   1 80        PUNCH ALL 80 COLUMNS        ZUC03590
                          LDD     ZB906     FUNC CODE AND WD COUNT      ZUC03600
                          BSI  L  ZBADR+1   BR TO PUNCH A CARD          ZUC03610
                    *                                                   ZUC03620
                    *             TEST FOR LAST CARD PUNCHED            ZUC03630
                    *                                                   ZUC03640
                          LD    1 80        COLUMN 80                   ZUC03650
                          BSC     E         SKIP NEXT IF NOT LAST CARD  ZUC03660
                          MDX     ZB200     BR IF LAST CARD             ZUC03670
                    *                                                   ZUC03680
                    *             TEST FOR PUNCH COMPLETE               ZUC03690
                    *                                                   ZUC03700
                    ZB020 LD   L  $IBSY     I/O BUSY INDICATOR          ZUC03710
                          BSC     Z         SKIP IF DONE                ZUC03720
                          MDX     *-4       LOOP ON BUSY                ZUC03730
                    *                                                   ZUC03740
                    *             CHK FOR LAST CARD IN FEED PATH        ZUC03750
                    *                                                   ZUC03760
                          LD   L  $LAST     LAST CARD INDICATOR         ZUC03770
                          BSC  L  ZB030-ZB000+A,+-  BR NOT LAST CARD    ZUC03780
                          LD      ZB907     FEED FUNC CODE              ZUC03790
                          BSI  L  ZBADR+1   BR TO FEED A CARD           ZUC03800
                    *                                                   ZUC03810
                    *             TEST FOR 32 CARDS PUNCHED             ZUC03820
                    *                                                   ZUC03830
                    ZB030 MDX   1 80        INCR BUFFER POINTER         ZUC03840
                          MDX   2 1         INCR PUNCH COUNTER          ZUC03850
                          MDX     ZB010     BR TO PUNCH ANOTHER CARD    ZUC03860
                    *                                                   ZUC03870
                    *             TEST FOR LAST CARD FOUND OR LAST      ZUC03880
                    *             *DISK CYLINDER READ.                  ZUC03890
                    *                                                   ZUC03900
                          MDX  L  ZB990-ZB000+A,8  INCR DISK ADDRESS    ZUC03910
                          LD      ZB922     LAST CARD INDICATOR         ZUC03920
                          BSC     Z         SKIP NEXT IF NOT LAST CARD  ZUC03930
                          MDX     ZB100     BR TO END                   ZUC03940
                          LD      ZB990     CURRENT DISK ADDR           ZUC03950
                          S       ZB914     END CONSTANT (/0640)        ZUC03960
                          BSC  L  ZB005-ZB000+A,Z  BR TO READ NEXT CYL  ZUC03970
                    ZB100 WAIT              FINISHED                    ZUC03980
                          MDX     ZB100     HARD WAIT                   ZUC03990
                    *                                                   ZUC04000
                    *             SET LAST CARD INDICATOR               ZUC04010
                    *                                                   ZUC04020
                    ZB200 STX     ZB922     SET LAST CARD INDICATOR     ZUC04030
                          LDX   2 -1        SET XR2 TO TERMINATE PUNCH  ZUC04040
                          MDX     ZB020     BR TO TEST FOR PUNCH DONE   ZUC04050
                    *                                                   ZUC04060
                    *             INTERRUPT BRANCH TABLE                ZUC04070
                    *                                                   ZUC04080
                    ZB900 DC      $PST4                                 ZUC04090
                          DC      $PST4     RESERVED                    ZUC04100
                          DC      $PST4     RESERVED                    ZUC04110
                          DC      $PST4     RESERVED                    ZUC04120
                          DC      ZBADR+4   1231                        ZUC04130
                          DC      ZBADR+4   1403                        ZUC04140
                          DC      ZBADR+4   2501                        ZUC04150
                          DC      ZBADR+4   1442                        ZUC04160
                          DC      ZBADR+4   KB/CP                       ZUC04170
                          DC      ZBADR+4   1134/1055                   ZUC04180
                    ZB902 DC      ZBADR+7   COLUMN INTERRUPT ENTRY      ZUC04190
                    ZB903 DC      ZB900-ZB000+A  ADDR OF IBT            ZUC04200
                    *                                                   ZUC04210
                    *             DISK READ FUNC CODE AND WORD CNT ADDR ZUC04220
                    *                                                   ZUC04230
                          BSS  E  0                                     ZUC04240
                    ZB905 DC      /7000     READ FUNCTION CODE          ZUC04250
                          DC      ZB990-1-ZB000+A  BUFFER WD CNT ADDR   ZUC04260
                    *                                                   ZUC04270
                    *             PUNCH FUNCTION CODE AND WORD CNT ADDR ZUC04280
                    *                                                   ZUC04290
                    ZB906 DC      /7001     PUNCH FUNC CODE             ZUC04300
                          DC      *-*       ADDR OF BUFFER WORD COUNT   ZUC04310
                    ZB907 DC      /7003     FEED FUNC CODE              ZUC04320
                    *                                                   ZUC04330
                    *             CONSTANTS AND WORK AREA               ZUC04340
                    *                                                   ZUC04350
                    ZB911 DC      /8        PUNCH STOP BIT              ZUC04360
                    ZB914 DC      /0640     END CONSTANT - DISK         ZUC04370
                    ZB922 DC      *-*       LAST CARD INDICATOR         ZUC04380
                    *                                                   ZUC04390
                    *             DISK TO CARD BUFFER - 1 CYLINDER LONG ZUC04400
                    *                                                   ZUC04410
                          BSS  E  0                                     ZUC04420
                          DC      2560      WORD COUNT                  ZUC04430
                    ZB990 DC      0         SECTOR ADDRESS              ZUC04440
                    ZB500 EQU     *                                     ZUC04450
                    *                                                   ZUC04460
                    *             SPECIAL COLD START PROGRAM            ZUC04470
                    *                                                   ZUC04480
                    ZB800 LDX   1 Y         MAX POSITIVE DISPLACEMENT   ZUC04490
                          LDD     ZB820     SET UP WORD COUNT AND SCTR  ZUC04500
                    ZB810 STD  L  $CIBA-1   *ADDR OF RESIDENT IMAGE     ZUC04510
                          STO   1 $DCYL-Y   INITIALIZE DEF CYL NO. 1    ZUC04520
                          LD    1 3-Y       FETCH LOG DRIVE 0 AREA CODE ZUC04530
                          STO   1 $ACDE-Y   *AND STORE IT IN COMMA      ZUC04540
                          STO     ZB820+1   SAVE THE AREA CODE          ZUC04550
                          LDD   1 /D2-Y     SAVE DEFECTIVE CYLINDER     ZUC04560
                          STD     ZB820+4   *ADDRESSES AND CARTRIDGE    ZUC04570
                          LDD   1 /D4-Y     *LABEL.                     ZUC04580
                          STD     ZB820+6                               ZUC04590
                          LD      ZB810+1   FETCH CORE ADDR OF RESIDENT ZUC04600
                          SRT     16        *IMAGE AND PUT IN EXTENSION ZUC04610
                          STO   1 $DBSY-Y   CLEAR DISK BUSY INDICATOR   ZUC04620
                          STO   1 $CYLN-Y   INITIALIZE ARM POSITION     ZUC04630
                          BSI   1 DZ000-Y   FETCH RESIDENT IMAGE        ZUC04640
                          WAIT              WAIT OUT THE INTERRUPT      ZUC04650
                          LDD     ZB820+2   SET UP WORD COUNT AND SCTR  ZUC04660
                    ZB815 STD  L  ZBADR-2   *ADDR OF DISK DUMP PROGRAM  ZUC04670
                          LD      ZB820+1                               ZUC04680
                          STO   1 $ACDE-Y   RESET AREA CODE             ZUC04690
                    *                                                   ZUC04700
                    *             SET UP TO READ DUMP PROGRAM INTO CORE ZUC04710
                    *                                                   ZUC04720
                          LD      ZB815+1   FETCH CORE ADDR OF DUMP AND ZUC04730
                          SRT     16        *SHIFT INTO EXTENSION       ZUC04740
                          STO   1 $IOCT-Y   CLEAR IOCS COUNTER          ZUC04750
                          BSI   1 DZ000-Y   FETCH DISK DUMP PROGRAM     ZUC04760
                          LD    1 $DBSY-Y   DISK BUSY INDICATOR         ZUC04770
                          BSC  L  ZBADR+320,+-  BR IF READ COMPLETE     ZUC04780
                          MDX     *-4       LOOP ON DISK BUSY           ZUC04790
                          BSS     11        PATCH AREA                  ZUC04800
                    ZB820 DC      $DBSY-$CH12  WD CNT AND SCTR ADDRESS  ZUC04810
                          DC      @RIAD     *OF RESIDENT IMAGE          ZUC04820
                          DC      ZB500-ZB000+320  WD CNT AND SCTR ADR  ZUC04830
                          DC      /0003        *OF DISK DUMP PROGRAM    ZUC04840
                          BSS     3         DEFECTIVE CYLINDER ADDR TBL ZUC04850
                          BSS     1         CARTRIDGE LABEL             ZUC04860
                    ZB830 EQU     *                                     ZUC04870
                    *                                                   ZUC04880
                    *                                                   ZUC04890
                          BSS     50        PATCH AREA                  ZUC04900
                    *                                                   ZUC04910
                    *                                                   ZUC04920
                          END     ZC000     UCART ENTRY POINT           ZUC04930
