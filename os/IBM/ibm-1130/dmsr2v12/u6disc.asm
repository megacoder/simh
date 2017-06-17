                          HDNG    NON-SYST DISK CART INITIALIZATION     U6C00010
                    *************************************************** U6C00020
                    *                                                 * U6C00030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U6C00040
                    *   PROGRAM NAME- NON-SYSTEM DISK CARTRIDGE       * U6C00050
                    *      INITIALIZATION                             * U6C00060
                    *      CODE NAME- DISC                            * U6C00070
                    *   FUNCTION/OPERATION-                           * U6C00080
                    *      THIS PROGRAM INITIALIZES UP TO FOUR SATEL- * U6C00090
                    *      LITE CARTRIDGES -- ALL BUT THE MASTER CAR- * U6C00100
                    *      TRIDGE ON LOGICAL DRIVE 0.  IT WRITES THE  * U6C00110
                    *      SECTOR ADDRESSES, DEFECTIVE CYLINDER AD-   * U6C00120
                    *      DRESSES, CARTRIDGE ID, A LET, A DCOM, AND A* U6C00130
                    *      CIB ON EACH CARTRIDGE INITIALIZED. THE     * U6C00140
                    *      SYSUP SUBROUTINE IS CALLED TO UPDATE THE   * U6C00150
                    *      MASTER CARTRIDGE WITH THE LABELS AND DCOM  * U6C00160
                    *      INFORMATION FROM ALL SATELLITE CARTRIDGES  * U6C00170
                    *      SUCCESSFULLY INITIALIZED BY DISC.          * U6C00180
                    *   ENTRY POINTS-                                 * U6C00190
                    *      DISC HAS ONLY ONE ENTRY POINT.  THE PROGRAM* U6C00200
                    *      IS ENTERED AS FOLLOWS--                    * U6C00210
                    *             // XEQ DISC                         * U6C00220
                    *             *IDXXX1,YYY1,XXX2,YYY2,...,XXX4,YYY4* U6C00230
                    *      WHERE XXXN IS THE CURRENT CARTRIDGE LABEL  * U6C00240
                    *      AND YYYN IS THE DESIRED LABEL.             * U6C00250
                    *   INPUT- AN *ID RECORD AS SPECIFIED UNDER ENTRY * U6C00260
                    *      POINTS.                                    * U6C00270
                    *   OUTPUT- A LIST OF CARTRIDGES ON THE SYSTEM AND* U6C00280
                    *      THEIR LOGICAL AND PHYSICAL SEQUENCE AFTER  * U6C00290
                    *      THE EXECUTION OF DISC IS PRINTED ON THE    * U6C00300
                    *      PRINCIPAL PRINT DEVICE.  A SIGN-OFF MESSAGE* U6C00310
                    *      IS ALSO PRINTED CONTAINING ONE LINE FOR    * U6C00320
                    *      EACH PAIR OF FROM-TO CARTRIDGE LABELS AND  * U6C00330
                    *      THE WORDS NOT DONE OR COMPLETE.  ANY ONE OF* U6C00340
                    *      FOUR ERROR MESSAGES MAY ALSO BE PRINTED AS * U6C00350
                    *      FOLLOWS--                                  * U6C00360
                    *         CARTRIDGE XXXN IS DEFECTIVE             * U6C00370
                    *         CARTRIDGE XXXN IS NOT AVAILABLE         * U6C00380
                    *         CARTRIDGE XXXN INVALID...LOGICAL 0 ID   * U6C00390
                    *         CARTRIDGE XXXN NEW LABEL IS INVALID     * U6C00400
                    *   EXTERNAL REFERENCES-                          * U6C00410
                    *      DZ000 -- ENTRY POINT FOR THE SYSTEM DISK   * U6C00420
                    *               I/O SUBROUTINE.                   * U6C00430
                    *      $PBSY -- PRINCIPAL PRINTER BUSY INDICATOR  * U6C00440
                    *      $EXIT -- ADDRESS OF CALL EXIT ENTRY POINT  * U6C00450
                    *      $DUMP -- ADDRESS OF CALL DUMP ENTRY POINT  * U6C00460
                    *      $CYLN -- ARM POSITION FOR LOGICAL DRIVE 0  * U6C00470
                    *      $ACDE -- AREA CODE FOR LOGICAL DRIVE 0     * U6C00480
                    *      $DCYL -- 1ST DEF CYL ADDR, LOGICAL DRIVE 0 * U6C00490
                    *      $DBSY -- DISK BUSY INDICATOR               * U6C00500
                    *      $IBT2 -- ADDR OF IBT FOR LEVEL 2           * U6C00510
                    *      $IREQ -- ADDR OF INTRPT REQUEST SUBROUTINE * U6C00520
                    *      $I410 -- ILS04 ENTRY POINT                 * U6C00530
                    *      $ZEND -- ADDR LAST WORD OF DISKZ +1        * U6C00540
                    *      #ACIN -- AVAILABLE CARTRIDGES INDICATOR    * U6C00550
                    *      #ANDU -- BLK ADDR END UA+1 (ADJ), LOG DR 0 * U6C00560
                    *      #BNDU -- BLD ADDR END UA+1 (BASE), LOG DR 0* U6C00570
                    *      #FPAD -- FILE PROTET ADDR (BASE), LOG DR 0 * U6C00580
                    *      #PCID -- CARTRIDGE ID, PHYSICAL DRIVE 0    * U6C00590
                    *      #CIDN -- CARTRIDGE ID, LOGICAL DRIVE 0     * U6C00600
                    *      #CIBA -- ADDR OF CORE IMAGE BUFFER LOG DR 0* U6C00610
                    *      #ULET -- ADDR OF LET, LOGICAL DRIVE 0      * U6C00620
                    *   EXITS-                                        * U6C00630
                    *      NORMAL-                                    * U6C00640
                    *         BR TO CALL EXIT ENTRY POINT             * U6C00650
                    *      ERROR-                                     * U6C00660
                    *         NOT APPLICABLE                          * U6C00670
                    *   TABLES/WORK AREAS-                            * U6C00680
                    *      COMMA AND DCOM AS SHOWN UNDER EXTERNAL REF-* U6C00690
                    *      ERENCES.                                   * U6C00700
                    *   ATTRIBUTES-                                   * U6C00710
                    *      NONE                                       * U6C00720
                    *   NOTES-                                        * U6C00730
                    *      PROGRAM REVISED IN MOD 2                  *  U6C00740
                    *                                                 * U6C00750
                    *************************************************** U6C00760
                          HDNG    NON-SYST DISK CART INITIALIZATION     U6C00770
                    *                                                   U6C00780
                    *             RELATIVE DCOM LOCATION EQUATE STMNTS  U6C00790
                    *                                                   U6C00800
                    #ACIN EQU     28                                    U6C00810
                    #ANDU EQU     35                                    U6C00820
                    #BNDU EQU     40                                    U6C00830
                    #FPAD EQU     45                                    U6C00840
                    #PCID EQU     50                                    U6C00850
                    #CIDN EQU     55                                    U6C00860
                    #CIBA EQU     60                                    U6C00870
                    #ULET EQU     80                                    U6C00880
                    #IDAD EQU     /0000                            2-11 U6C00890
                    *                                                   U6C00900
                    *             RESIDENT MONITOR EQUATE STMNTS        U6C00910
                    *                                                   U6C00920
                    $PBSY EQU     /36                                   U6C00930
                    $EXIT EQU     /38                                   U6C00940
                    $DUMP EQU     /3F                                   U6C00950
                    $CYLN EQU     /9A                                   U6C00960
                    $ACDE EQU     /9F                                   U6C00970
                    $DCYL EQU     /A4                                   U6C00980
                    $DBSY EQU     /EE                                   U6C00990
                    $IBT2 EQU     /B9                                   U6C01000
                    $LEV2 EQU     /A                               2-11 U6C01010
                    $IREQ EQU     /2C                                   U6C01020
                    $I410 EQU     /D5                                   U6C01030
                    $ZEND EQU     /1E0                                  U6C01040
                    DZ000 EQU     /F2                                   U6C01050
                    CLDST EQU     /D0                                   U6C01060
                    *                                                   U6C01070
                    *             READ AN *ID RECORD, PRINT THE RECORD  U6C01080
                    *             ON THE PRINCIPAL OUTPUT DEVICE, CON-  U6C01090
                    *             VERT AND STORE RECORD INFORMATION IN  U6C01100
                    *             A FROM-TO TABLE AND A PACKED EBC      U6C01110
                    *             TABLE FOR OUTPUT OF SIGN-OFF MESSAGE. U6C01120
                    *                                                   U6C01130
                    IC000 LD   L  IC920     ADDR OF FROM-TO BUFFER      U6C01140
                          CALL    RDREC     READ ID RECORD              U6C01150
                          STO  L  IC922     ADDR PRINCIPAL OUTPUT SUBR  U6C01160
                    *                                              2-11 U6C01170
                    *             GO BUILD AVAILABLE CART LIST     2-11 U6C01180
                    *                                              2-11 U6C01190
                          BSI  L  IT200                            2-11 U6C01200
                    *                                                   U6C01210
                    *             READ DCOM FROM MASTER CARTRIDGE       U6C01220
                    *                                                   U6C01230
                          LDD  L  IC900     READ FUNC AND BUFFER ADDR   U6C01240
                          BSI  L  DZ000     READ DCOM                   U6C01250
                    *                                                   U6C01260
                    *             CHECK FOR DISK READ COMPLETE          U6C01270
                    *                                                   U6C01280
                    IC010 MDX  L  $DBSY,0   SKIP IF DISK NOT BUSY  2-11 U6C01290
                          MDX     IC010     LOOP ON BUSY           2-11 U6C01300
                    *                                              2-11 U6C01310
                    *                                                   U6C01320
                    *             INITIALIZE                            U6C01330
                    *                                                   U6C01340
                    * ONE INSTRUCTION REMOVED                      2-11 U6C01350
                          SLA     16        ZERO ACC               2-11 U6C01360
                          S    L  IC980+1   NEGATE CART INITIALIZE CTR  U6C01370
                          STO     IC065+1   SET UP SIGN-OFF LINE COUNT  U6C01380
                          MDX  L  IC980+1,1  CART INIT COUNTER          U6C01390
                          LDX   1 0         INIT FROM-TO TABLE POINTER  U6C01400
                          STX  L1 IC931     FROM-TO TABLE POINTER       U6C01410
                          LD   L  IC992+2+#ACIN                         U6C01420
                          STO  L  IC936     AVAILABLE CART INDR WORD    U6C01430
                    *                                                   U6C01440
                    *             SAVE $IREQ -POINT TO INTRPT REQUEST   U6C01450
                    *                                                   U6C01460
                          LD   L  $IREQ                                 U6C01470
                          STO  L  IC932     SAVE $IREQ                  U6C01480
                          LDX  L2 IC380     ADDR OF KB ROUTINE          U6C01490
                          STX  L2 $IREQ     SET UP KEYBOARD REQUEST KEY U6C01500
                    *                                                   U6C01510
                    *             SAVE $IBT2 -POINT TO DIO ERROR SEQ    U6C01520
                    *                                                   U6C01530
                          LD   L  $IBT2                                 U6C01540
                          STO  L  IC928     TEMPORARY                   U6C01550
                          LDX  L2 DIO-3     DISK INTERRUPT ADDR         U6C01560
                          STX  L2 $IBT2     SET UP INTERRUPT ADDRESS    U6C01570
                    *                                               212 U6C01571
                    *             SAVE $LEV2 - POINT TO $I200       212 U6C01572
                    *                                               212 U6C01573
                          LD   L  $LEV2     SAVE $LEV2 TEMPORARILY  212 U6C01574
                          STO  L  IC937                             212 U6C01575
                          LD   L  IC938     SET $LEV2 = $I200       212 U6C01576
                          STO  L  $LEV2                             212 U6C01577
                    *                                                   U6C01580
                    *             TEST FOR LAST CARTRIDGE INITIALIZED   U6C01590
                    *                                                   U6C01600
                    IC050 MDX  L  IC980+1,-1  SKIP NEXT IF DONE         U6C01610
                          MDX     IC200     BR TO PROCESS NEXT CART     U6C01620
                    *                                                   U6C01630
                    *             RESTORE LEVEL 2 INTERRUPT             U6C01640
                    *                                                   U6C01650
                    IC060 LD   L  IC928                                 U6C01660
                          STO  L  $IBT2                                 U6C01670
                          LD   L  IC937                             212 U6C01673
                          STO  L  $LEV2                             212 U6C01676
                    *                                                   U6C01680
                    *             CALL SYSUP                            U6C01690
                    *                                                   U6C01700
                          CALL    SYSUP                                 U6C01710
                          DC      IC992+2+#CIDN  CART ID TABLE          U6C01720
                    *                                                   U6C01730
                    *             PRINT SIGN-OFF MESSAGE                U6C01740
                    *                                                   U6C01750
                    IC065 LDX  L2 *-*       SET UP LINE COUNT           U6C01760
                          LDX  L3 IC980+11  ADDR OF FIRST LINE WD COUNT U6C01770
                    IC070 STX  L3 IC950+1                               U6C01780
                          LDD  L  IC950     FUNC CODE AND WD CNT ADDR   U6C01790
                          BSI  I  IC922     BR TO PRINT ROUTINE         U6C01800
                          MDX  L  $PBSY,0   SKIP IF PRNTR NOT BUSY 2-11 U6C01810
                          MDX     *-3       LOOP ON BUSY           2-11 U6C01820
                    * ONE INSTRUCTION REMOVED                      2-11 U6C01830
                          MDX   3 16        INCR TO NEXT LINE WD COUNT  U6C01840
                          MDX   2 1         INCR LINE COUNT             U6C01850
                          MDX     IC070     BR TO PRINT ANOTHER LINE    U6C01860
                    *                                                   U6C01870
                    *             RESTORE INTERRUPT REQUEST ADDRESS     U6C01880
                    *                                                   U6C01890
                          LD   L  IC932                                 U6C01900
                          STO  L  $IREQ     POINT TO ILS ROUTINE        U6C01910
                    *                                                   U6C01920
                    *             EXIT TO MONITOR OR KEYBOARD REQUEST   U6C01930
                    *                                                   U6C01940
                          MDX  L  IC380,0   SKIP IF NO KEYBOARD REQUEST U6C01950
                          MDX     IC100     BR IF KEYBOARD REQUEST      U6C01960
                          EXIT              EXIT TO MONITOR        2-11 U6C01970
                    IC100 BSI  L  $DUMP     EXIT VIA KEYBOARD REQUEST   U6C01980
                          DC      -2                                    U6C01990
                    *                                                   U6C02000
                    *             ERROR IF LABEL IS MASTER CARTRIDGE    U6C02010
                    *                                                   U6C02020
                    IC200 LD   L1 IC980+2   CURRENT CART LABEL          U6C02030
                          BSC  L  IC226,+   BR IF CUR ID INVALID   2-11 U6C02032
                          S    L  IC992+2+#CIDN                    2-11 U6C02034
                          BSC  L  IC205,+-  BR IF MASTER CARTRIDGE 2-11 U6C02036
                          LD   L1 IC980+2   LOAD CURRENT ID        2-11 U6C02038
                          STO     IC905     *AND SAVE FOR SEARCH   2-11 U6C02040
                          LDX   3 -5        INITIALIZE POINTER     2-11 U6C02042
                    IC201 LD   L3 IC992+2+#CIDN+5  FETCH ID FROM   2-11 U6C02044
                          S       IC905     *DCOM                  2-11 U6C02046
                          BSC  L  IC208,+-  BR IF MATCH OCCURS     2-11 U6C02048
                          MDX   3 1         INCRE POINTER-SKIP ON 02-11 U6C02050
                          MDX     IC201     BR TO CONTINUE         2-11 U6C02052
                          LD      IC905     BR IF SEARCHING FOR AN 2-11 U6C02054
                          BSC  L  IC226,+-  *AVAILABLE ENTRY       2-11 U6C02056
                          SLA     16        SET ID TO ZERO AND GO  2-11 U6C02058
                          STO     IC905     *SEARCH FOR AN EMPTY   2-11 U6C02060
                          MDX     IC201-1   *ENTRY IN DCOM         2-11 U6C02062
                    *                                              2-11 U6C02064
                    IC905 DC      *-*       CURRENT ID SAVE AREA   2-11 U6C02066
                    *                                              2-11 U6C02068
                    *             PRINT ERROR MSG -INVALID-SYST CART ID U6C02070
                    *                                                   U6C02080
                    IC205 LDX  L3 IC943     SUB-MSG ADDR           2-11 U6C02090
                          BSI  L  IC400     BR TO PRINT                 U6C02100
                    *                                                   U6C02110
                    *             INITIALIZE SECTOR 0 - CARTRIDGE ID    U6C02120
                    *                                                   U6C02130
                    IC208 LD   L  IC910     SET DM2 INITIALIZED    2-11 U6C02140
                          STO  L  IC970+9   *STATUS WORD  (WORD 7 = -2) U6C02150
                          LD   L1 IC980+3                               U6C02160
                          STO  L  IC970+5   NEW CARTRIDGE LABEL         U6C02170
                          BSC  L  IC220-1,-Z  INVALID LABEL IF NOT PLUS U6C02180
                    *                                                   U6C02190
                    *             PRINT ERROR MSG -NEW LABEL IS INVALID U6C02200
                    *                                                   U6C02210
                          LDX  L3 IC944     SUB-MSG ADDRESS             U6C02220
                          BSI  L  IC400     BR TO PRINT                 U6C02230
                    *                                                   U6C02240
                    *             FIND PHYSICAL DRIVE NUMBER            U6C02250
                    *                                                   U6C02260
                          LDX   3 -11       INITIALIZE POINTER     2-11 U6C02270
                    IC220 LD   L3 IT904+11  FETCH ID FROM ID LIST  2-11 U6C02280
                          S    L1 IC980+2   CURRENT CART LABEL          U6C02290
                          BSC  L  IC230,+-  BR IF LABEL FOUND           U6C02300
                    IC225 MDX   3 1         INCR POINTER- SKIP IF END   U6C02310
                          MDX     IC220                                 U6C02320
                    *                                                   U6C02330
                    *             PRINT ERROR MSG -IS NOT AVAILABLE     U6C02340
                    *                                                   U6C02350
                    IC226 LDX  L3 IC942     SUB-MSG ADDR           2-11 U6C02360
                          BSI  L  IC400     BR TO PRINT                 U6C02370
                          MDX     IC236     BR TO CHK FOR ERROR         U6C02380
                    *                                                   U6C02390
                    *             CHECK DRIVE READY INDICATOR           U6C02400
                    *                                                   U6C02410
                    IC230 MDX   3 11        CNVRT PNTR TO DR NO    2-11 U6C02420
                          NOP               MAY SKIP                    U6C02430
                          LD   L  IC936     DRIVE READY INDR WORD       U6C02440
                          SLA   3           SHIFT READY INDR INTO SIGN  U6C02450
                          BSC     -         SKIP NEXT IF READY          U6C02460
                          MDX     IC232     BR TO GET NEXT PCID ENTRY   U6C02470
                    *                                                   U6C02480
                    *             CHK FOR DRIVE PREVIOUSLY INITIALIZED  U6C02490
                    *                                                   U6C02500
                          LD   L  IC935     DRIVE INIT INDR             U6C02510
                          SLA   3           SHIFT TO SIGN               U6C02520
                          BSC  L  IC234,-   BR IF DRIVE NOT INITIALIZED U6C02530
                    *                                                   U6C02540
                    *             RESTORE XR3 AND GET NEXT PCID ENTRY   U6C02550
                    *                                                   U6C02560
                    IC232 MDX   3 -11       SET TO NEXT AVAIL ID   2-11 U6C02570
                          NOP               MAY SKIP                    U6C02580
                          MDX     IC225     BR TO CONTINUE PCID SEARCH  U6C02590
                    *                                                   U6C02600
                    *             SET DRIVE INITIALIZED INDR BIT ON     U6C02610
                    *                                                   U6C02620
                    IC234 LD   L  IC912     SIGN BIT                    U6C02630
                          SRA   3           SHIFT TO RELATIVE DRIVE BIT U6C02640
                          OR   L  IC935     *(0-4) AND STORE AS DRIVE   U6C02650
                          STO  L  IC935     *INITIALIZED INDICATOR.     U6C02660
                    *                                                   U6C02670
                    *             GET NEXT CART ID IF ANY ERROR         U6C02680
                    *                                                   U6C02690
                    IC236 LD   L  IC933     ERROR INDR                  U6C02700
                          BSC  L  IC370,Z   BR IF ANY ERROR             U6C02710
                    *                                                   U6C02720
                    *             SAVE PHYSICAL DRIVE NUMBER            U6C02730
                    *                                                   U6C02740
                          STX  L3 IC934     PHYSICAL DRIVE INDEX VALUE  U6C02750
                          LD   L  IC934                                 U6C02760
                          SLA     12        SHIFT TO DRIVE NO. POSITION U6C02770
                          STO     IC923     SAVE                        U6C02780
                          STO  L  IC990+1                               U6C02790
                    *                                                   U6C02800
                    *             SEEK HOME CURRENT CARTRIDGE           U6C02810
                    *                                                   U6C02820
                          BSI  L  DIO-1     CALL DISK ROUTINE           U6C02830
                          DC      /0300     SEEK HOME FUNCTION          U6C02840
                          DC      IC990                                 U6C02850
                    *                                                   U6C02860
                    *             INITIALIZE DEFECTIVE CYLINDER TABLE   U6C02870
                    *                                                   U6C02880
                          LDX   2 -3        LOOP COUNT - 3 WORDS        U6C02890
                          STX   2 IC924     INITIALIZE DEF CYL COUNT    U6C02900
                          LD      IC913     INITIALIZE VALUE            U6C02910
                    IC210 STO  L2 IC970+2+3 DEF CYL TBL                 U6C02920
                          MDX   2 1         INCR COUNT                  U6C02930
                          MDX     IC210     REPEAT                      U6C02940
                    *                                                   U6C02950
                    *             WRITE PATTERN TO ONE CARTRIDGE        U6C02960
                    *                                                   U6C02970
                          STX   2 IC925     INITIALIZE SECTOR ADDRESS   U6C02980
                    IC235 LDX   3 -6        PATTERN INDEX VALUE         U6C02990
                    IC240 STX   2 IC929     INIT RETRY COUNTER          U6C03000
                          LD      IC901     NEGATIVE VALUE              U6C03010
                          STO     IC927     INIT BAD CYLINDER INDR      U6C03020
                    *                                                   U6C03030
                    *             FILL BUFFER WITH PATTERN              U6C03040
                    *                                                   U6C03050
                          LDX  L2 -320      BUFFER FILL COUNTER         U6C03060
                          LDD  L3 IC901+6   PATTERN TO WRITE            U6C03070
                    IC245 STD  L2 IC990+322  FILL BUFFER WITH PATTERN   U6C03080
                          MDX   2 2         INCR COUNTER- SKIP IF ZERO  U6C03090
                          MDX     IC245                                 U6C03100
                    *                                                   U6C03110
                    *             SET UP SECTOR ADDRESS                 U6C03120
                    *                                                   U6C03130
                          LD      IC925     SECTOR 0 ADDR FOR THIS CYL  U6C03140
                          OR      IC923     DRIVE NO. FOR THIS CART     U6C03150
                          STO     IC926     SCTR ADDR TEMP              U6C03160
                    *                                                   U6C03170
                    *             WRITE PATTERN TO EIGHT SECTORS        U6C03180
                    *                                                   U6C03190
                          LDX   2 8         INIT SCTR WRITE COUNT       U6C03200
                    IC250 STO  L  IC990+1   BUFFER SCTR ADDR            U6C03210
                          BSI  L  DIO-1     CALL DISK ROUTINE           U6C03220
                          DC      /0200     WRITE FUNCTION              U6C03230
                          DC      IC990     BUFFER WD CNT ADDR          U6C03240
                          BSI  L  DIO-1     TEST FOR BUSY               U6C03250
                          DC      /0000     SENSE FUNCTION CODE         U6C03260
                          DC      IC926-1                               U6C03270
                          MDX  L  IC929,0   SKIP NEXT IF NO RETRY       U6C03280
                          MDX     IC280     BR IF RETRY                 U6C03290
                    IC255 A       IC911     DECR SECTOR ADDR            U6C03300
                          MDX   2 -1        DECR SCTR WRITE CTR         U6C03310
                          MDX     IC250     BR TO WRITE A SECTOR        U6C03320
                    *                                                   U6C03330
                    *             READ BACK AND COMPARE EIGHT SECTORS   U6C03340
                    *                                                   U6C03350
                          STX   2 IC921     CLEAR COMPARE ERROR INDR    U6C03360
                          STX   2 IC930     CLEAR SCTR ADDR ERROR INDR  U6C03370
                          LDX   2 8         INIT SCTR READ COUNT        U6C03380
                          MDX  L  IC926,7   POINT TO SECTOR 7           U6C03390
                    IC260 LD      IC926     ADDR OF SCTR TO READ        U6C03400
                          STO  L  IC990+1   BUFFER SCTR ADDR            U6C03410
                          BSI  L  DIO-1     CALL DISK ROUTINE           U6C03420
                          DC      /0100     READ FUNCTION               U6C03430
                          DC      IC990     BUFFER WD CNT ADDR          U6C03440
                          BSI  L  DIO-1     TEST FOR BUSY               U6C03450
                          DC      /0000     SENSE FUNCTION CODE         U6C03460
                          DC      IC926-1                               U6C03470
                          MDX  L  IC929,0   SKIP NEXT IF NO RETRY       U6C03480
                          MDX     IC285     BR IF RETRY                 U6C03490
                    *                                                   U6C03500
                    *             COMPARE SECTOR ADDR                   U6C03510
                    *                                                   U6C03520
                    IC265 AND     IC916     EXTRACT SCTR ADDR           U6C03530
                          EOR  L  IC990+1   COMPARE W/ BUFFER SCTR ADDR U6C03540
                          BSC  L  IC300,Z   BR IF SCTR ADDR ERROR       U6C03550
                    *                                                   U6C03560
                    *             COMPARE BUFFER CONTENTS WITH PATTERN  U6C03570
                    *                                                   U6C03580
                          LDX  L1 320       INITIALIZE BUFFER POINTER   U6C03590
                    IC270 LDD  L1 IC990     TWO WDS OF BUFFER           U6C03600
                          SD   L3 IC901+6   COMPARE W/ PATTERN WRITTEN  U6C03610
                          BSC     +-        SKIP IF NOT SAME            U6C03620
                          RTE     16        FLIP SECOND WORD INTO ACC   U6C03630
                          BSC  L  IC301,Z   BR IF NOT SAME              U6C03640
                          MDX   1 -2        DECR BUFFER POINTER         U6C03650
                          MDX     IC270     BR TO COMPARE TWO MORE WDS  U6C03660
                          SLA     16        CLEAR ACC                   U6C03670
                    IC271 STO     IC921     CLEAR COMPARE ERROR FLAG    U6C03680
                          MDX  L  IC926,-1  DECR SCTR ADDR              U6C03690
                          NOP               MAY SKIP                    U6C03700
                          MDX   2 -1        DECR SCTR READ COUNT        U6C03710
                          MDX     IC260     BR TO READ A SECTOR         U6C03720
                    *                                                   U6C03730
                    *             NEXT PATTERN                          U6C03740
                    *                                                   U6C03750
                          MDX   3 2         INCR PATTERN POINTER        U6C03760
                          MDX     IC240     BR TO WRITE NEXT PATTERN    U6C03770
                    *                                                   U6C03780
                    *             CHECK FOR BAD CYLINDER                U6C03790
                    *                                                   U6C03800
                          LD      IC927     BAD CYLINDER INDR           U6C03810
                          BSC  L  IC310,Z-  BR IF BAD CYLINDER          U6C03820
                          BSC  L  IC315,-   BR IF CYL ZERO DEFECTIVE    U6C03830
                          MDX     IC275     BR TO INCR SCTR POINTER     U6C03840
                    *                                                   U6C03850
                    *             CONSTANTS AND WORK AREA               U6C03860
                    *                                                   U6C03870
                          BSS  E  0         MAKE ADDR EVEN              U6C03880
                    IC900 DC      /7000     DISK READ FUNCTION          U6C03890
                          DC      IC992     DCOM BUFFER ADDR            U6C03900
                    IC901 DC      /AAAA     FIRST PATTERN               U6C03910
                          DC      /AAAA                                 U6C03920
                          DC      /5555     SECOND PATTERN              U6C03930
                          DC      /5555                                 U6C03940
                          DC      0         THIRD PATTERN               U6C03950
                          DC      0                                     U6C03960
                    IC910 DC      -2        DM2 INITIALIZED STATUS WORD U6C03970
                    IC911 DC      1         DECIMAL ONE CONSTANT        U6C03980
                    IC912 DC      /8000     SIGN BIT CONSTANT           U6C03990
                    IC913 DC      /0658     INITIAL VALUE DEF CYL TBL   U6C04000
                    IC916 DC      /0FFF     SECTOR ADDR EXTRACT MASK    U6C04010
                    IC917 EQU     IC913     NO. OF SCTRS/CART CONSTANT  U6C04020
                    IC918 DC      /0180     DCOM INITIALIZE CONSTANT    U6C04030
                          DC      /0008     DCOM INITIALIZE CONSTANT    U6C04040
                    IC919 EBC     .COMPLETE.                            U6C04050
                    IC920 DC      IC980     ADDR OF FROM-TO TABLE       U6C04060
                    IC921 DC      *-*       COMPARE ERROR INDR          U6C04070
                    IC922 DC      *-*       ADDR PRINCIPAL OUTPUT SUBR  U6C04080
                    IC923 DC      *-*       PHYSICAL DR NUMBER          U6C04090
                    IC924 DC      *-*       DEFECTIVE CYLINDER COUNTER  U6C04100
                          BSS  E  0         IC926-1 MUST BE EVEN        U6C04110
                    IC925 DC      *-*       SECTOR ZERO ADDRESS TEMP    U6C04120
                    IC926 DC      *-*       SECTOR ADDR TEMPORARY       U6C04130
                    IC927 DC      *-*       BAD CYLINDER INDR           U6C04140
                    IC928 DC      *-*       TEMPORARY FOR $IBT2         U6C04150
                    IC929 DC      *-*       RETRY COUNTER               U6C04160
                    IC930 DC      *-*       SCTR ADDR ERROR INDR        U6C04170
                    IC931 DC      *-*       FROM-TO TABLE POINTER       U6C04180
                    IC932 DC      *-*       TEMPORARY FOR $IREQ         U6C04190
                    IC933 DC      *-*       ID RECORD ERROR INDR        U6C04200
                    IC934 DC      *-*       PHYSICAL DRIVE INDEX VALUE  U6C04210
                    IC935 DC      *-*       DRIVE INITIALIZED INDR      U6C04220
                    IC936 DC      *-*       DRIVE READY INDR WORD       U6C04230
                    IC937 DC      *-*       TEMP STORAGE FOR $LEV2  212 U6C04235
                    IC938 DC      /B3       $I200 LOCATION          212 U6C04238
                    *                                                   U6C04240
                    *             INCR TO CHECK NEXT CYLINDER           U6C04250
                    *                                                   U6C04260
                    IC275 MDX  L  IC925,8   POINT SCTR ADDR TO NEXT CYL U6C04270
                          LD      IC925                                 U6C04280
                          S       IC917     END CONSTANT                U6C04290
                          BSC  L  IC330,+-  BR IF ALL CYLINDERS TESTED  U6C04300
                          MDX     IC235     BR TO INIT TO FIRST PATTERN U6C04310
                    *                                                   U6C04320
                    *             RETRY WRITE                           U6C04330
                    *                                                   U6C04340
                    IC280 MDX  L  IC929,-1  DECR RETRY CTR              U6C04350
                          MDX     IC250     BR TO RETRY                 U6C04360
                          MDX     IC255     BR TO DECR SCTR ADDR        U6C04370
                    *                                                   U6C04380
                    *             RETRY READ                            U6C04390
                    *                                                   U6C04400
                    IC285 MDX  L  IC929,-1  DECR RETRY COUNTER          U6C04410
                          MDX     IC260     BR TO RETRY                 U6C04420
                          MDX     IC265     BR TO COMPARE               U6C04430
                    *                                                   U6C04440
                    *             SECTOR ADDRESS ERROR                  U6C04450
                    *                                                   U6C04460
                    IC300 LD      IC925     SECTOR 0 ADDR FOR THIS CYL  U6C04470
                          EOR  L  IC990+1   CURRENT SCTR ADDR FR BUFFER U6C04480
                          BSC  L  IC301,Z   BR IF NOT SECTOR ZERO       U6C04490
                          MDX  L  IC930,0   SKIP IF FIRST SCTR ZERO ERR U6C04500
                          MDX     IC315     BR IF DEFECTIVE CARTRIDGE   U6C04510
                          STX     IC930     SET SCTR ADDR ERROR INDR ON U6C04520
                    *                                                   U6C04530
                    *             COMPARE ERROR                         U6C04540
                    *                                                   U6C04550
                    IC301 MDX  L  IC921,0   CHK FOR PREVIOUS CMP ERROR  U6C04560
                          MDX     IC305     BR IF SECOND COMPARE ERROR  U6C04570
                          STX     IC921     SET COMPARE ERROR INDR ON   U6C04580
                          MDX  L  IC929,0   SKIP NEXT IF NO RETRY SET   U6C04590
                          MDX     IC260     BR TO RETRY                 U6C04600
                          MDX  L  IC929,50  INCR TO RETRY 50 TIMES      U6C04610
                          MDX     IC260     BR TO RETRY                 U6C04620
                    IC305 LD      IC925     CURRENT CYL SCTR 0 ADDR     U6C04630
                          STO     IC927     SET BAD CYL INDR ON         U6C04640
                          SLA     16        CLEAR ACC                   U6C04650
                          STO     IC929     RESET RETRY COUNTER         U6C04660
                          MDX     IC271     BR TO TEST NEXT SECTOR      U6C04670
                    *                                                   U6C04680
                    *             CHECK DEFECTIVE CYLINDER COUNT        U6C04690
                    *                                                   U6C04700
                    IC310 LDX  I3 IC924     DEFECTIVE CYLINDER COUNT    U6C04710
                          MDX   3 0         SKIP IF MORE THAN 3 BAD CYL U6C04720
                          MDX     IC316                                 U6C04730
                    *                                                   U6C04740
                    *             DEFECTIVE CARTRIDGE                   U6C04750
                    *                                                   U6C04760
                    IC315 LDX  L3 IC941     SUB-MSG ADDRESS             U6C04770
                          BSI  L  IC400     BR TO PRINT                 U6C04780
                          BSC  L  IC370     BR TO GET NEXT CART ID      U6C04790
                    *                                                   U6C04800
                    *             PUT DEFECTIVE CYL ADDR INTO TABLE     U6C04810
                    *                                                   U6C04820
                    IC316 STO  L3 IC970+2+3 DEFECTIVE CYL TABLE         U6C04830
                          MDX  L  IC924,1   INCR DEFECTIVE CYL COUNT    U6C04840
                          NOP               MAY SKIP                    U6C04850
                          MDX     IC275     BR TO CHECK NEXT CYLINDER   U6C04860
                    *                                                   U6C04870
                    *             INITIALIZE SECTOR 1 - DCOM            U6C04880
                    *                                                   U6C04890
                    IC330 LDX  I1 IC931     FROM-TO TABLE POINTER       U6C04900
                          LDX   3 -5        INITIALIZE TABLE POINTER    U6C04910
                    IC340 LD   L3 IC992+2+#CIDN+5  NEXT LABEL IN #CIDN  U6C04920
                          S    L1 IC980+2                               U6C04930
                          BSC  L  IC350,+-  BR IF LABEL FOUND           U6C04940
                          MDX   3 1         INCR POINTER- SKIP IF END   U6C04950
                          MDX     IC340     BR TO GET NEXT TBL ENTRY    U6C04960
                          SLA     16                                    U6C04970
                          STO  L1 IC980+2   SET UP TO LOOK FOR 1ST ZERO U6C04980
                          MDX     IC340-1   BR TO SEARCH AGAIN          U6C04990
                    IC350 LDX   2 -81       CLEAR BUFFER COUNT          U6C05000
                          STO  L2 IC993+2+81  CLEAR SCTR 1 BUFFER       U6C05010
                          MDX   2 1         DECR COUNTER                U6C05020
                          MDX     IC350+1   BR TO CONTINUE CLEARING     U6C05030
                          LD   L  IC970+5   NEW CARTRIDGE LABEL         U6C05040
                          STO  L3 IC992+2+#CIDN+5  MASTER DCOM          U6C05050
                          STO  L  IC993+2+#CIDN  SATELLITE DCOM         U6C05060
                          LD      IC918     HEX VALUE 0180              U6C05070
                          STO  L  IC993+2+#ANDU  INIT #ANDU             U6C05080
                          STO  L  IC993+2+#BNDU  INIT #BNDU             U6C05090
                          SRA     4         = HEX VALUE 0018            U6C05100
                          STO  L  IC993+2+#FPAD  INIT #FPAD             U6C05110
                          LD      IC918+1   HEX VALUE 0008              U6C05120
                          STO  L  IC993+2+#CIBA  INIT #CIBA             U6C05130
                          SRA     2         = HEX VALUE 0002            U6C05140
                          STO  L  IC993+2+#ULET                         U6C05150
                    *                                                   U6C05160
                    *             SET UP AREA CODE FOR DZ000            U6C05170
                    *                                                   U6C05180
                          LDX  I2 IC934     PHYSICAL DRIVE INDEX VALUE  U6C05190
                          LD   L2 IC960     AREA CODE - CURRENT CART    U6C05200
                          STO  L3 $ACDE+5                               U6C05210
                    *                                                   U6C05220
                    *             SET UP CURRENT ARM POSITION           U6C05230
                    *                                                   U6C05240
                          MDX  L  IC925,-8  CURRENT ARM POSITION        U6C05250
                          LD   L  IC925                                 U6C05260
                          STO  L3 $CYLN+5   CURRENT ARM POSITION-DZ000  U6C05270
                    *                                                   U6C05280
                    *             SET UP DRIVE CODE FOR DISK WRITE      U6C05290
                    *                                                   U6C05300
                          MDX   3 5         LOGICAL DRIVE NUMBER IN XR3 U6C05310
                          NOP               MAY SKIP                    U6C05320
                          STX  L3 IC970+1   TEMPORARY                   U6C05330
                          LD   L  IC970+1                               U6C05340
                          SLA     12        SHIFT TO DRIVE CODE POSITN  U6C05350
                          STO  L  IC970+1   SET UP SECTOR 0 ADDR        U6C05360
                          A    L  IC911     ONE                         U6C05370
                          STO  L  IC993+1   SET UP SECTOR 1 ADDR        U6C05380
                          A    L  IC911     ONE                         U6C05390
                          STO  L  IC978+1   SET UP SECTOR 2 ADDR        U6C05400
                    *                                                   U6C05410
                    *             SET UP DEFECTIVE CYLINDER TABLE       U6C05420
                    *                                                   U6C05430
                          SRA     11        LOG DR NO. X2 RT JUSTIFIED  U6C05440
                          STO     IC351-2   TEMPORARY                   U6C05450
                          SRA     1         LOG DR NO. RIGHT JUSTIFIED  U6C05460
                          A       IC351-2   LOG DR NO. TIMES 3          U6C05470
                          STO     IC351-2   STORE TO LOAD XR3           U6C05480
                          LDX  L3 *-*       XR3 = LOG DR NO. TIMES 3    U6C05490
                          LDX   2 -3        NEW DEFECTIVE CYL POINTER   U6C05500
                    IC351 LD   L2 IC970+2+3 NEXT ENTRY OF NEW TABLE     U6C05510
                          STO  L3 $DCYL     SET UP DEFECTIVE CYL TABLE  U6C05520
                          MDX   3 1         INCR DEFECTIVE CYL TBL PT   U6C05530
                          MDX   2 1         INCR NEW TABLE POINTER      U6C05540
                          MDX     IC351     BR TO MOVE NEXT WD OF TBL   U6C05550
                    *                                                   U6C05560
                    *             WRITE SECTORS 0,1, AND 2 TO SATELLITE U6C05570
                    *                                                   U6C05580
                          LD   L  IC928                                 U6C05590
                          STO  L  $IBT2     RESTORE INTERRUPT ADDR      U6C05600
                          LDX  L2 IC970     ADDR OF SECTOR 0 BUFFER     U6C05610
                          BSI     IC355     BR TO WRITE ONE SCTR        U6C05620
                          LDX  L2 IC993     SECTOR 1 BUFFER ADDR        U6C05630
                          BSI     IC355     BR TO WRITE ONE SCTR        U6C05640
                          LDX  L2 IC978     SECTOR 2 BUFFER ADDR        U6C05650
                          BSI     IC355     BR TO WRITE ONE SCTR        U6C05660
                          LDX  L2 DIO-3     SET DISK INTERRUPT BACK TO  U6C05670
                          STX  L2 $IBT2     *DIO INTERNAL ROUTINE       U6C05680
                    *                                                   U6C05690
                    *             STORE COMPLETE IN SIGN-OFF MESSAGE    U6C05700
                    *                                                   U6C05710
                          LDX   2 -4        INITIALIZE EBC COMPLETE PT  U6C05720
                          LD   L  IC931     FROM-TO TABLE POINTER       U6C05730
                          SLA     3         MPY BY  8                   U6C05740
                          STO     *+1                                   U6C05750
                          LDX  L3 *-*       SIGN-OFF MESSAGE POINTER    U6C05760
                    IC360 LD   L2 IC919+4   EBC COMPLETE                U6C05770
                          STO  L3 IC980+22  ST COMPLETE OVER NOT DONE   U6C05780
                          MDX   3 1         INCR MESSAGE POINTER        U6C05790
                          MDX   2 1         INCR EBC COMPLETE POINTER   U6C05800
                          MDX     IC360     BR TO MOVE TWO MORE CHARS   U6C05810
                    *                                                   U6C05820
                    *             CHECK FOR KEYBOARD INTERRUPT          U6C05830
                    *                                                   U6C05840
                    IC370 MDX  L  IC380,0   SKIP IF NO INTERRUPT        U6C05850
                          MDX     IC375     BR TO END SEQUENCE          U6C05860
                    *                                                   U6C05870
                    *             INCR FROM-TO TABLE POINTER            U6C05880
                    *                                                   U6C05890
                          SLA     16                                    U6C05900
                          STO  L  IC933     CLEAR ID ERROR              U6C05910
                          MDX  L  IC931,2   INCR FROM-TO POINTER        U6C05920
                          LDX  I1 IC931     FROM-TO TABLE POINTER       U6C05930
                          BSC  L  IC050     BR TO TEST FOR LAST CART    U6C05940
                    IC375 BSC  L  IC060     BR TO END SEQUENCE          U6C05950
                    *                                                   U6C05960
                    *             KEYBOARD INTERRUPT MAKES IC380 NON-0  U6C05970
                    *                                                   U6C05980
                    IC380 DC      *-*       ENTRY PT AND INTERRUPT INDR U6C05990
                          XIO     IC939     RESET INTERRUPT             U6C06000
                          BSC  L  $I410     BR TO ILS04                 U6C06010
                    *                                                   U6C06020
                    *             IOCC TO RESET KEYBOARD INTERRUPT      U6C06030
                    *                                                   U6C06040
                    IC939 BSS  E  1         EVEN BOUNDARY FOR IOCC      U6C06050
                          DC      /0F01     SENSE WITH RESET FUNCTION   U6C06060
                    *                                                   U6C06070
                    *             WRITE ONE SECTOR SUBROUTINE           U6C06080
                    *                                                   U6C06090
                    IC355 DC      *-*       RETURN ADDRESS              U6C06100
                          STX   2 IC950+1   SET UP ADDR IN DISC IOCC    U6C06110
                          LDD     IC950     WRITE FUNC AND BUFFER ADDR  U6C06120
                          BSI  L  DZ000     WRITE A SECTOR              U6C06130
                    IC356 MDX  L  $DBSY,0   SKIP IF DISK NOT BUSY  2-11 U6C06140
                          MDX     IC356     LOOP ON BUSY           2-11 U6C06150
                    *                                              2-11 U6C06160
                          BSC  I  IC355     EXIT                        U6C06170
                    *                                                   U6C06180
                    *             PRINT ERROR MESSAGE SUBROUTINE        U6C06190
                    *                                                   U6C06200
                    IC400 DC      *-*       RETURN ADDRESS              U6C06210
                          STX  L  IC933     SET ID RECORD ERROR ON      U6C06220
                          LD   L  IC931     FROM-TO TABLE POINTER       U6C06230
                          SLA     3         MULTIPLY BY 8               U6C06240
                          STO     *+1                                   U6C06250
                          LDX  L2 *-*       SIGN-OFF MESSAGE POINTER    U6C06260
                          LDD  L2 IC980+12  EBC CART ID                 U6C06270
                          STD     IC940+6                               U6C06280
                          LDX   2 -11       INIT MESSAGE POINTER        U6C06290
                    IC410 LD    3 0         FIRST WORD OF MESSAGE TYPE  U6C06300
                          STO  L2 IC940+20  STORE IN ERROR MESSAGE      U6C06310
                          MDX   3 1         INCR TO NEXT WORD           U6C06320
                          MDX   2 1         INCR POINTER                U6C06330
                          MDX     IC410     BR TO MOVE ANOTHER WORD     U6C06340
                          LDD     IC940-4   FUNC CODE AND WORD CNT ADDR U6C06350
                          BSI  I  IC922     BR TO PRINT ROUTINE         U6C06360
                          LD   L  $PBSY     PRINCIPAL PR BUSY INDR      U6C06370
                          BSC     Z         SKIP NEXT IF NOT BUSY       U6C06380
                          MDX     *-4       LOOP ON BUSY                U6C06390
                          BSC  I  IC400     EXIT                        U6C06400
                    *                                                   U6C06410
                    *             ERROR MESSAGE BUFFER                  U6C06420
                    *                                                   U6C06430
                          BSS  E  0         MAKE ADDR EVEN              U6C06440
                          DC      /7001     WRITE FUNCTION CODE         U6C06450
                          DC      IC940-1   BUFFER WORD COUNT ADDR      U6C06460
                          DC      0         BLANK SPACER WORD           U6C06470
                          DC      IC941-IC940  WORD COUNT               U6C06480
                    IC940 EBC     .  CARTRIDGE .                        U6C06490
                          EBC     .      .  CART ID FOLLOWED BY 2 SPACE U6C06500
                          EBC     .                      .  22 BLANKS   U6C06510
                    IC941 EBC     .IS DEFECTIVE          .              U6C06520
                    IC942 EBC     .IS NOT AVAILABLE      .              U6C06530
                    IC943 EBC     .INVALID...LOGICAL 0 ID.              U6C06540
                    IC944 EBC     .NEW LABEL IS INVALID  .              U6C06550
                    *                                                   U6C06560
                    *             DISK WRITE IOCC                       U6C06570
                    *                                                   U6C06580
                          BSS  E  0         MAKE ADDRESS EVEN           U6C06590
                    IC950 DC      /7001     DISK WRITE FUNCTION         U6C06600
                          DC      *-*       ADDR OF BUFFER TO WRITE     U6C06610
                    *                                                   U6C06620
                    *             AREA CODE TABLE                       U6C06630
                    *                                                   U6C06640
                    IC960 DC      /2000     DRIVE 0                     U6C06650
                          DC      /8800     DRIVE 1                     U6C06660
                          DC      /9000     DRIVE 2                     U6C06670
                          DC      /9800     DRIVE 3                     U6C06680
                          DC      /A000     DRIVE 4                     U6C06690
                          DC      /B000     DRIVE  5               2-11 U6C06700
                          DC      /B800     DRIVE  6               2-11 U6C06710
                          DC      /B810     DRIVE  7               2-11 U6C06720
                          DC      /B820     DRIVE  8               2-11 U6C06730
                          DC      /B830     DRIVE  9               2-11 U6C06740
                          DC      /B840     DRIVE 10               2-11 U6C06750
                    *                                                   U6C06760
                    *             SATELLITE SECTOR 0 BUFFER             U6C06770
                    *                                                   U6C06780
                          BSS  E  0         MAKE ADDRESS EVEN           U6C06790
                    IC970 DC      IC977-IC970-1  WORD COUNT             U6C06800
                          DC      0         SECTOR ADDR                 U6C06810
                          BSS     3         DEFECTIVE CYLINDER TABLE    U6C06820
                          BSS     1         CARTRIDGE LABEL             U6C06830
                          BSS     $ZEND-CLDST-6  RESERVED FOR SYSTEM    U6C06840
                    *                                                   U6C06850
                    *             CONSOLE PRINTER PRINT ROUTINE         U6C06860
                    *                                                   U6C06870
                    A     EQU     $ZEND     COLD START RELATIVE ADDRESS U6C06880
                    IC971 LDX  L1 IC973-IC971+A  XR1 TO INTRPT BR ADDR  U6C06890
                          STX  L1 12        SET UP LOC 12 FOR INTERRUPT U6C06900
                          LDX   1 IC977-IC976+1  CHARACTER COUNT        U6C06910
                    IC972 XIO     IC974     TYPE A CHARACTER            U6C06920
                          MDX  L  IC974-IC971+A,1  PT I0CC TO NEXT CHAR U6C06930
                          WAIT              WAIT FOR INTERRUPT          U6C06940
                          MDX   1 -1        DECR CHAR COUNT             U6C06950
                          MDX     IC972     BR TO TYPE ANOTHER CHAR     U6C06960
                          WAIT              HARD WAIT                   U6C06970
                          MDX     *-2       GO BACK TO WAIT             U6C06980
                    IC973 DC      *-*       INTERRUPT ENTRY POINT       U6C06990
                          XIO     IC975     SENSE AND RESET             U6C07000
                          BOSC I  IC973-IC971+A  RETURN                 U6C07010
                    *                                                   U6C07020
                    *             IOCC WORDS TO PRINT MESSAGE           U6C07030
                    *                                                   U6C07040
                          BSS  E  0         MAKE ADDRESS EVEN           U6C07050
                    IC974 DC      IC976-IC971+A  ADDR OF MESSAGE BUFFER U6C07060
                          DC      /0900     WRITE FUNCTION CODE         U6C07070
                    IC975 DC      0         BLANK WORD FOR SENSE IOCC   U6C07080
                          DC      /0F01     SENSE AND RESET FUNCTION    U6C07090
                    *                                                   U6C07100
                    *             MESSAGE CHARACTERS - CONSOLE PRINTER  U6C07110
                    *                                                   U6C07120
                    IC976 DC      /8100     CARRIER RETURN              U6C07130
                          DC      /7400     N                           U6C07140
                          DC      /5000     O                           U6C07150
                          DC      /7400     N                           U6C07160
                          DC      /8400     HYPHEN                      U6C07170
                          DC      /9800     S                           U6C07180
                          DC      /A400     Y                           U6C07190
                          DC      /9800     S                           U6C07200
                          DC      /9C00     T                           U6C07210
                          DC      /2100     SPACE                       U6C07220
                          DC      /1C00     C                           U6C07230
                          DC      /3C00     A                           U6C07240
                          DC      /6000     R                           U6C07250
                          DC      /9C00     T                           U6C07260
                          DC      /2100     SPACE                       U6C07270
                          DC      /3400     E                           U6C07280
                          DC      /6000     R                           U6C07290
                          DC      /6000     R                           U6C07300
                          DC      /5000     O                           U6C07310
                    IC977 DC      /6000     R                           U6C07320
                    *                                                   U6C07330
                    *             SATELLITE SECTOR 2 BUFFER- LET HEADER U6C07340
                    *                                                   U6C07350
                          BSS  E  0         MAKE ADDR EVEN              U6C07360
                    IC978 DC      IC979-IC978-1  BUFFER WORD COUNT      U6C07370
                          DC      /0002     SECTOR ADDR OF LET          U6C07380
                          DC      /0000     RELATIVE LET SCTR NUMBER    U6C07390
                          DC      /0018     USER AREA SCTR ADDRESS      U6C07400
                          DC      /0000     LET HEADER RESERVED WORD    U6C07410
                          DC      /0138     WDS AVAILABLE THIS LET SCTR U6C07420
                          DC      /0000     LET SCTR CHAIN ADDRESS      U6C07430
                          DC      /7112     1DUMY IN NAME CODE WITH     U6C07440
                          DC      /4528     * 01 AS FIRST TWO BITS.     U6C07450
                    IC979 DC      /6280     DB SIZE OF WORKING STORAGE  U6C07460
                    *                                                   U6C07470
                    *             FROM-TO CARTRIDGE ID TABLE AND SIGN-  U6C07480
                    *             OFF MESSAGE PASSED FROM RDREC FUNC    U6C07490
                    *                                                   U6C07500
                    IC980 BSS  E  1         MAKE NEXT ADDR ODD          U6C07510
                          BSS     1         FROM-TO ELEMENT COUNT       U6C07520
                          BSS     8         4 PAIRS FROM-TO CART IDS    U6C07530
                    *                                                   U6C07540
                    *             SIGN-OFF MESSAGE                      U6C07550
                    *                                                   U6C07560
                          BSS  E  1         BLANK SPACER WORD           U6C07570
                    IC981 DC      IC982-IC981-1  WORD COUNT             U6C07580
                          EBC     .    .    FROM                        U6C07590
                          EBC     .      .  SPACES                      U6C07600
                          EBC     .    .    TO                          U6C07610
                          EBC     .      .  SPACES                      U6C07620
                          EBC     .NOT DONE.                            U6C07630
                          EBC     .  .                                  U6C07640
                    IC982 DC      IC983-IC982-1  WD COUNT               U6C07650
                          EBC     .    .    FROM                        U6C07660
                          EBC     .      .  SPACES                      U6C07670
                          EBC     .    .    TO                          U6C07680
                          EBC     .      .  SPACES                      U6C07690
                          EBC     .NOT DONE.                            U6C07700
                          EBC     .  .                                  U6C07710
                    IC983 DC      IC984-IC983-1  WD COUNT               U6C07720
                          EBC     .    .    FROM                        U6C07730
                          EBC     .      .  SPACES                      U6C07740
                          EBC     .    .    TO                          U6C07750
                          EBC     .      .  SPACES                      U6C07760
                          EBC     .NOT DONE.                            U6C07770
                          EBC     .  .                                  U6C07780
                    IC984 DC      IC985-IC984-1  WD COUNT               U6C07790
                          EBC     .    .    FROM                        U6C07800
                          EBC     .      .  SPACES                      U6C07810
                          EBC     .    .    TO                          U6C07820
                          EBC     .      .  SPACES                      U6C07830
                          EBC     .NOT DONE.                            U6C07840
                          EBC     .  .                                  U6C07850
                    IC985 EQU     *                                     U6C07860
                    *                                                   U6C07870
                    *             SATELLITE DCOM BUFFER                 U6C07880
                    *                                                   U6C07890
                          BSS  E  0         MAKE ADDR EVEN              U6C07900
                    IC993 DC      81        WORD COUNT                  U6C07910
                          DC      /0001     SECTOR ADDR OF DCOM         U6C07920
                          BSS     81-52     RESERVE 81 WORDS            U6C07930
                    *                                                   U6C07940
                    *             MASTER DCOM BUFFER                    U6C07950
                    *                                                   U6C07960
                          BSS  E  0         MAKE ADDR EVEN              U6C07970
                    IC992 DC      60        WORD COUNT                  U6C07980
                          DC      /0001     SECTOR ADDRESS OF DCOM      U6C07990
                          BSS     60        RESERVE 60 WORDS            U6C08000
                          ORG     *-60      BEGIN FOLLOWING SUBR.  2-11 U6C08010
                    *                       *IN DCOM DISK BUFFER   2-11 U6C08020
                    *                       *TO ALLOW IT TO BE     2-11 U6C08030
                    *                       *OVERLAYED AFTER IT IS 2-11 U6C08040
                    *                       *USED                  2-11 U6C08050
                    *************************************************** U6C08060
                    * THIS SUBROUTINE DETERMINES WHICH DRIVES HAVE    * U6C08070
                    * CARTRIDGES MOUNTED AND READY.  IT ALSO SAVES THE* U6C08080
                    * IDS IN PHYSICAL DRIVE ORDER.IF A DRIVE DOES NOT * U6C08090
                    * HAVE A CARTRIDGE MOUNTED AND READY, ITS ENTRY   * U6C08100
                    * IN THE PHYSICAL DRIVE LIST IS SET TO ZERO       * U6C08110
                    *************************************************** U6C08120
                          SPAC    1                                     U6C08130
                    IT200 DC      *-*       ENTRY/RETURN ADDRESS   2-11 U6C08140
                          SPAC    1                                     U6C08150
                    * SAVE VALUES OF $ACDE IN COMMA                     U6C08160
                          SPAC    1                                     U6C08170
                          LDX   2 -5        XR1 = $ACDE TABLE SIZE 2-11 U6C08180
                    IT205 LD   L2 $ACDE+5   LOAD FIRST ENTRY       2-11 U6C08190
                          STO  L2 IT926+5   *AND SAVE              2-11 U6C08200
                          MDX   2 1         SKIP IF FINISHED       2-11 U6C08210
                          MDX     IT205     *OTHERWISE, CONTINUE   2-11 U6C08220
                          SPAC    1                                     U6C08230
                          LDX   1 -11       DRIVE COUNT TO XR1     2-11 U6C08240
                          LD   L  $LEV2     SAVE CONTENTS          2-11 U6C08250
                          STO     IT923     *OF LOCATION 10        2-11 U6C08260
                          SPAC    1                                     U6C08270
                    IT210 LD      IT922     RESET INTERRUPT        2-11 U6C08280
                          STO  L  $LEV2     *BRANCH ADDRESS        2-11 U6C08290
                          LD   L1 IC960+11  FETCH AREA CODE        2-11 U6C08300
                          STO  L  $ACDE     STORE TO COMMA         2-11 U6C08310
                          OR      IT918     OR IN READ FUNC CODE   2-11 U6C08320
                          STO     IT911+1   STO TO 2ND WD OF IOCC  2-11 U6C08330
                          OR      IT921     OR IN SENSE FUNC CODE  2-11 U6C08340
                          STO     IT912+1   STO TO 2ND WD OF IOCC  2-11 U6C08350
                          XIO     IT911     INITIATE DISK READ     2-11 U6C08360
                          XIO     IT912     SENSE DISK             2-11 U6C08370
                          SLA     3         SHIFT BUSY BIT TO SIGN 2-11 U6C08380
                          BSC  L  IT230,+Z  BR IF DISK BUSY        2-11 U6C08390
                          SPAC    1                                     U6C08400
                    * DISK NOT BUSY, NO CARTRIDGE AVAILABLE             U6C08410
                          SPAC    1                                     U6C08420
                          SLA     16        SET PHY DR LIST ENTRY  2-11 U6C08430
                          STO  L1 IT904+11  *TO ZERO               2-11 U6C08440
                          MDX     IT240     BR TO INCRE DR POINTER 2-11 U6C08450
                          SPAC    1                                     U6C08460
                    * OPERATION COMPLETE INTERRUPT PROCESSING           U6C08470
                          SPAC    1                                     U6C08480
                    IT220 DC      *-*       INT ENTRY POINT        2-11 U6C08490
                          XIO     IT912     SENSE WITH RESET       2-11 U6C08500
                          BOSC I  IT220     CONTINUE               2-11 U6C08510
                    IT918 DC      /0600     READ FUNC CODE         2-11 U6C08520
                          SPAC    1                                     U6C08530
                    * CARTRIDGE AVAILABLE, FETCH CARTRIDGE ID AND       U6C08540
                    * DEFECTIVE CYLINDER ADDRESS                        U6C08550
                          SPAC    1                                     U6C08560
                    IT230 LD      IT220     CHECK INT ENTRY POINT  2-11 U6C08570
                          BSC     +-        *FOR NON-ZERO, AND LOOP2-11 U6C08580
                          MDX     IT230     *UNTIL INTERRUPT OCCURS2-11 U6C08590
                          SLA     16        RESET INT ENTRY POINT  2-11 U6C08600
                          STO     IT220     *TO ZERO               2-11 U6C08610
                          LD      IT923     RESTORE CONTENTS       2-11 U6C08620
                          STO  L  $LEV2     *OF LOCATION 10        2-11 U6C08630
                          LD      IT915+1   SET ARM POSITION TO    2-11 U6C08640
                          STO  L  $CYLN     *SECTOR ADDR JUST READ 2-11 U6C08650
                          LD      IT917     FETCH ADDR OF I/O AREA 2-11 U6C08660
                          SRT     16        SHIFT TO EXT, ACC = 0  2-11 U6C08670
                          BSI  L  DZ000     BRANCH TO DISK READ    2-11 U6C08680
                          MDX  L  $DBSY,0   SKIP IF READ COMPLETE  2-11 U6C08690
                          MDX     *-3       LOOP IF NOT COMPLETE   2-11 U6C08700
                          SPAC    1                                     U6C08710
                          LD      IT908+3   FETCH CART ID AND      2-11 U6C08720
                          STO  L1 IT904+11  *STORE TO CART LIST    2-11 U6C08730
                    IT240 LD      IT923     RESTORE CONTENTS OF    2-11 U6C08740
                          STO  L  $LEV2     *LEVEL 2 INT ADDR      2-11 U6C08750
                          MDX   2 2         INCRE AVAIL CART PNTR  2-11 U6C08760
                          MDX   1 1         SKIP IF DR CNT = 0     2-11 U6C08770
                          MDX     IT210     *OTHERWISE, CONTINUE   2-11 U6C08780
                          SPAC    1                                     U6C08790
                    * RESTORE VALUES OF $ACDE IN COMMA, AND SINCE       U6C08800
                    * THIS SUBROUTINE HAS MOVED ALL ARMS TO CYL. 0      U6C08810
                    * TO READ THE CARTRIDGE ID, SET $CYLN TO ZERO       U6C08820
                          SPAC    1                                     U6C08830
                          LDX   2 -5        XR1 = TABLE LENGTH     2-11 U6C08840
                    IT250 LD   L2 IT926+5   RESTORE ORIGINAL       2-11 U6C08850
                          STO  L2 $ACDE+5   *CONTENTS OF $ACDE     2-11 U6C08860
                          SRA     16        SET CURRENT ARM        2-11 U6C08870
                          STO  L2 $CYLN+5   *POSITION TO ZERO      2-11 U6C08880
                          MDX   2 1         SKIP IF FINISHED       2-11 U6C08890
                          MDX     IT250     *OTHERWISE, CONTINUE   2-11 U6C08900
                          SPAC    1                                     U6C08910
                          BSC  I  IT200     RETURN TO MAINLINE     2-11 U6C08920
                          EJCT                                          U6C08930
                    * CONSTANTS AND WORK AREA                           U6C08940
                          SPAC    1                                     U6C08950
                          BSS  E  1         ASSURE ODD BOUNDARY    2-11 U6C08960
                          DC      -1        CONSTANT OF -1         2-11 U6C08970
                    IT906 DC      4         WORD COUNT             2-11 U6C08980
                    IT907 DC      #IDAD     SECTOR ADDRESS         2-11 U6C08990
                    IT908 BSS  4  4         DEF CYL,ID I/O AREA    2-11 U6C09000
                    IT911 DC      IT915     ADDRESS OF I/O AREA    2-11 U6C09010
                          DC      *-*       2ND WORD OF READ IOCC  2-11 U6C09020
                    IT912 DC      /658      MAXIMUM ARM POSITION   2-11 U6C09030
                          DC      *-*       2ND WORD OF SENSE IOCC 2-11 U6C09040
                    IT915 DC      1         WORD COUNT             2-11 U6C09050
                          DC      *-*       I/O AREA               2-11 U6C09060
                    IT917 DC      IT906     ADDR OF ID I/O AREA    2-11 U6C09070
                    IT921 DC      /0701     SENSE W/RESET FUNC CODE2-11 U6C09080
                    IT922 DC      IT220     ADDR OF TEMP INT ROUTN 2-11 U6C09090
                    IT923 DC      *-*       $LEV2 SAVE AREA        2-11 U6C09100
                    IT926 BSS     5         $ACDE SAVE AREA        2-11 U6C09110
                    IT904 BSS     11        CART LIST-PHY DR ORDER 2-11 U6C09120
                    *             THE FOLLOWING BSS MUST CAUSE DISKN    U6C09130
                    *             TO BEGIN ON AN EVEN BOUNDARY          U6C09140
                    *                                                   U6C09150
                          BSS  E  1                                     U6C09160
                    *                                                   U6C09170
                    *             SET READ OR WRITE ERROR               U6C09180
                    *                                                   U6C09190
                    IC320 MDX  L  IC929,0   SKIP NEXT IF RETRY NOT SET  U6C09200
                          MDX     IC325     BR IF NOT FIRST ERROR       U6C09210
                          MDX  L  IC929,50  INCR TO RETRY 50 TIMES      U6C09220
                          MDX     IC326     BR TO EXIT                  U6C09230
                    IC325 LD   L  IC925     CURRENT CYL SCTR 0 ADDR     U6C09240
                          STO  L  IC927     SET BAD CYL INDR ON         U6C09250
                    IC326 BSC  L  *-*       EXIT                        U6C09260
                          MDX     IC320     BR TO SET ERROR             U6C09270
                    *                                                   U6C09280
                    *                                                   U6C09290
                    * PATCH AREA REMOVED                           2-11 U6C09300
                    *                                                   U6C09310
                    *                                                   U6C09320
                          HDNG    DISK READ/WRITE SUBROUTINE            U6C09330
                    DISKN STX   2 D0900+3   SAVE CONTENTS OF XR2        U6C09340
                          LDX  I2 *-*       PUT LINK WD FROM TV IN XR2  U6C09350
                          MDX     D0027     BRANCH TO CALL PROCESSING   U6C09360
                    D0004 DC      *-*       ENTRY POINT FOR INTERRUPTS  U6C09370
                          MDX     D0600     BR TO CONTINUE              U6C09380
                          DC      *-*       DISC ENTRY                  U6C09390
                          STX   2 D0900+3   SAVE XR2                    U6C09400
                          LDX  I2 *-4                                   U6C09410
                          MDX     D0027     BRANCH TO CONTINUE          U6C09420
                    D0600 SLA     16        INITIALIZE PHY DR CODE 2-11 U6C09430
                          STO     D0620+1   *ACCUMULATOR TO ZERO   2-11 U6C09440
                          XIO  L  SENSI-1   SENSE ILSW             2-11 U6C09450
                    D0610 SLA     1                                2-11 U6C09460
                          BSC  L  D0620,+-  BR IF DR CD ACCUMULATED2-11 U6C09470
                          MDX  L  D0620+1,2  ACCUMULATE 2*DR CODE  2-11 U6C09480
                          MDX     D0610     BR TO CHECK FOR ZERO   2-11 U6C09490
                    D0620 LDX  L1 *-*       XR1 = 2*DRIVE NUMBER   2-11 U6C09500
                          MDX  L1 CYLIN     ADJUST TO STORAGE AREA      U6C09510
                          XIO   1 D0950-1-C  SENSE WITH RESET      2-11 U6C09520
                          BSC  L  D0698,-   BRANCH IF NO DATA ERROR     U6C09530
                          LDD     IOCCN     FETCH LAST IOCC        2-11 U6C09540
                          BSI     IC326+1    BR TO DISK ERROR RTN   2-9 U6C09550
                          BSC  L  D0697,-   BRANCH TO IGNORE ERROR      U6C09560
                    D0696 LD      *         FETCH NON-ZERO WORD         U6C09570
                          XIO     IOCCN     RETRY LAST OPERATION   2-11 U6C09580
                    D0699 STO     DBUSY     SET DBUSY AS SWITCH    2-11 U6C09590
                          BSC  I  D0004     RETURN TO INTERRUPT LEVEL   U6C09600
                    *                                                   U6C09610
                    D0698 LD      IOCCN+1   GET 2ND WD LAST IOCC   2-11 U6C09620
                          AND     SENSI     DETERMINE IF LAST OPERATION U6C09630
                          BSC  L  D0695,+-  *WAS A SENSE. BR IF IT WAS  U6C09640
                          LD      DBUSY     CHECK DBUSY SIGN       2-11 U6C09650
                          BSC  L  D0696,Z+                              U6C09660
                    D0697 SLA     16        CLEAR ACC TO SET SWITCH     U6C09670
                          MDX     D0699     RETURN TO INTERRUPT LEVEL   U6C09680
                    *                                                   U6C09690
                    D0695 MDX  L  SCNTR,-1  DECREMENT RETRY COUNTER     U6C09700
                          MDX     *+2       BR TO TRY AGAIN             U6C09710
                          DC      /3333     WAIT                        U6C09720
                          MDX     *-2                                   U6C09730
                          XIO   1 D0950-1-C  SENSE WITH RESET      2-11 U6C09740
                          SLA     4                                     U6C09750
                          BSC  L  D0697,Z+  BRANCH IF CARRIAGE HOME     U6C09760
                          XIO     SEEK      INITIATE SEEK               U6C09770
                          MDX     D0699+1   BRANCH TO EXIT              U6C09780
                    *                                                   U6C09790
                    D0027 STD     SAVAC     SAVE ACC AND EXT            U6C09800
                          STX   1 D0900+1   SAVE CONTENTS OF XR1        U6C09810
                          LDD  I2 1         FETCH WD CNT, SCTR ADDRESS  U6C09820
                          SLT     16        ISOLATE THE DRIVE CODE      U6C09830
                          RTE     11                               2-11 U6C09840
                          STO     SAVE1+1   SAVE TWICE THE              U6C09850
                    SAVE1 LDX  L1 *-*       *DRIVE CODE                 U6C09860
                          MDX  L1 CYLIN     POINT TO BUFFER AREA        U6C09870
                    * ONE INSTRUCTION REMOVED                      2-11 U6C09880
                          MDX  L  DBUSY,0   SKIP IF DISK NOT BUSY  2-11 U6C09890
                          MDX     *-3       *BRANCH TO TRY AGAIN        U6C09900
                          LD    2 0         LOAD CONTROL PARAMETER      U6C09910
                          BSC  L  D0202,Z   BRANCH IF NOT TEST FUNCTION U6C09920
                    D0024 LDD     SAVAC     RESTORE ACC AND EXT         U6C09930
                          MDX   2 2         SET UP FOR RETURN TO CALL+3 U6C09940
                    D0030 STX   2 D0150     STORE RETURN ADDRESS        U6C09950
                    D0900 LDX  L1 *-*       RESTORE XR1                 U6C09960
                          LDX  L2 *-*       RESTORE XR2                 U6C09970
                          BSC  L  *-*       RETURN TO USER              U6C09980
                    D0150 EQU     *-1                                   U6C09990
                    *                                                   U6C10000
                    * PREPARE TO MAKE PRE-OPERATIVE ERROR EXIT          U6C10010
                    *                                                   U6C10020
                    D0550 LD      NTRDY     LOAD NOT READY ERROR CODE   U6C10030
                          BSI  L  STRAP     WAIT AT PRE-OPERATIVE EXIT  U6C10040
                          MDX     D0203     BR ON STRAP RETURN          U6C10050
                    *                                                   U6C10060
                    * PROCESS ALL FUNCTIONS EXCEPT TEST                 U6C10070
                    *                                                   U6C10080
                    D0202 SRT     5         RIGHT JUSTIFY SCTR ADDR     U6C10090
                          LD    2 1         LOAD AND SAVE ADDRESS       U6C10100
                          STO     IOCCN     *OF USERS I/O BUFFER   2-11 U6C10110
                          LD   I2 1         FETCH WORD COUNT            U6C10120
                          STD  I2 1                                     U6C10130
                          SLA     3         ISOLATE SECTOR NUMBER       U6C10140
                          RTE     3                                     U6C10150
                          SRA     13                                    U6C10160
                          OR    2 0         OR IN THE FUNCTION CODE     U6C10170
                          STO     DBUSY     SET BUSY INDICATOR     2-11 U6C10180
                          EOR   1 D0950-C   OR IN AREA CD & SENSE  2-11 U6C10190
                          EOR     D0001                                 U6C10200
                          STO     IOCCN+1   PUT IN 2ND WD OF IOCC  2-11 U6C10210
                          AND     SENSI     CHECK IF REQ FUNC IS A SEEK U6C10220
                          BSC  L  D0203,Z   BR IF NOT                   U6C10230
                          LD      D0001                                 U6C10240
                          STO   1 CYLIN-C   SET CURRENT CYLN TO 1  2-11 U6C10250
                          SLA     8                                     U6C10260
                          STO     SCNTR                                 U6C10270
                          SLT     16                                    U6C10280
                    D0203 XIO   1 D0950-1-C  SENSE DR N WITH RESET 2-11 U6C10290
                          SLA     2         TEST FOR DRIVE READY        U6C10300
                          BSC  L  D0550,Z+  *AND BRANCH IF IT IS NOT    U6C10310
                    *                                                   U6C10320
                    * CHECK TO SEE IF A SEEK IS NECESSARY               U6C10330
                    *                                                   U6C10340
                          SLT     16        SAVE SOUGHT                 U6C10350
                          STO     SAVE1+1   *CYLINDER                   U6C10360
                          S     1 CYLIN-C   SUB CURRENT ARM POSN   2-11 U6C10370
                          BSC  L  D0042,+-  BR IF SEEK NOT NECESSARY    U6C10380
                    *                                              2-11 U6C10390
                    *                                              2-11 U6C10400
                    * SIX INSTRUCTIONS REMOVED                     2-11 U6C10410
                    *                                              2-11 U6C10420
                    * BUILD SEEK IOCC                              2-11 U6C10430
                    *                                              2-11 U6C10440
                          SRT     16        PUT NO. CYLINDERS IN EXT    U6C10450
                          AND     D0940     AND WITH BIT 3              U6C10460
                          OR    1 D0950-C   CONSTRUCT              2-11 U6C10470
                          EOR     SENSI     *SEEK                       U6C10480
                          A       D0917     *IOCC                       U6C10490
                          RTE     16                                    U6C10500
                          BSC     -         SKIP IF SEEK TOWARD HOME    U6C10510
                          MDX     *+2       BR TO CONTINUE              U6C10520
                          EOR     D0917     GENERATE POSITIVE NO. CYLS  U6C10530
                          A       D0001     *TO SEEK                    U6C10540
                          STD     SEEK      STORE IOCC WORDS            U6C10550
                    *                       INST.MOVED AHEAD 4 INST2-10 U6C10560
                          LD      SAVE1+1   RESET CURRENT               U6C10570
                          STO   1 CYLIN-C   *ARM POSITION          2-11 U6C10580
                          LD      D0917     LOAD NEGATIVE NUMBER        U6C10590
                          STO     DBUSY     USE DBUSY AS SEEK FLAG 2-11 U6C10600
                          XIO     SEEK      INITIATE SEEK          2-10 U6C10610
                          MDX     D0024     BRANCH TO EXIT              U6C10620
                    D0042 XIO     IOCCN     INITIATE READ OR WRITE 2-11 U6C10630
                          MDX     D0024     BRANCH TO EXIT              U6C10640
                    *                                                   U6C10650
                    * CONSTANTS AND WORK AREAS                          U6C10660
                    *                                                   U6C10670
                    SEEK  BSS  E  2         STORAGE FOR SEEK IOCC       U6C10680
                    SAVAC BSS  E  2         ACC AND EXT STORAGE    2-11 U6C10690
                    D0001 DC      1         CONSTANT OF ONE             U6C10700
                    SENSI DC      /0300     FUNCTION CODE MASK          U6C10710
                    D0940 DC      4         SEEK IOCC DIRECTION MASK    U6C10720
                    SCNTR DC      *-*       RETRY COUNTER               U6C10730
                    D0917 DC      -1        CONSTANT                    U6C10740
                    NTRDY DC      /5000     DISK NOT READY ERROR CODE   U6C10750
                    DBUSY DC      *-*       DISK BUSY/SEEK INDIC   2-11 U6C10760
                    IOCCN BSS  E  2         IOCC FOR REQUESTED FUNC2-11 U6C10770
                    CYLIN DC      203       CURRENT ARM POSN,DR  0 2-11 U6C10780
                    D0950 DC      /2701     SENSE IOCC, DR  0      2-11 U6C10790
                          DC      203       CURRENT ARM POSN,DR  1 2-11 U6C10800
                          DC      /8F01     SENSE IOCC, DR  1      2-11 U6C10810
                          DC      203       CURRENT ARM POSN,DR  2 2-11 U6C10820
                          DC      /9701     SENSE IOCC, DR  2      2-11 U6C10830
                          DC      203       CURRENT ARM POSN,DR  3 2-11 U6C10840
                          DC      /9F01     SENSE IOCC, DR  3      2-11 U6C10850
                          DC      203       CURRENT ARM POSN,DR  4 2-11 U6C10860
                          DC      /A701     SENSE IOCC, DR  4      2-11 U6C10870
                          DC      203       CURRENT ARM POSN,DR  5 2-11 U6C10880
                          DC      /B701     SENSE IOCC, DR  5      2-11 U6C10890
                          DC      203       CURRENT ARM POSN,DR  6 2-11 U6C10900
                          DC      /BF01     SENSE IOCC, DR  6      2-11 U6C10910
                          DC      203       CURRENT ARM POSN,DR  7 2-11 U6C10920
                          DC      /BF11     SENSE IOCC, DR  7      2-11 U6C10930
                          DC      203       CURRENT ARM POSN,DR  8 2-11 U6C10940
                          DC      /BF21     SENSE IOCC, DR  8      2-11 U6C10950
                          DC      203       CURRENT ARM POSN,DR  9 2-11 U6C10960
                          DC      /BF31     SENSE IOCC, DR  9      2-11 U6C10970
                          DC      203       CURRENT ARM POSN,DR 10 2-11 U6C10980
                          DC      /BF41     SENSE IOCC, DR 10      2-11 U6C10990
                    C     EQU     CYLIN     TABLE POINTER          2-11 U6C11000
                    STRAP EQU     40        ADDRESS OF STRAP IN (COMMA) U6C11010
                    DIO   EQU     DISKN+7   TV LINK WORD ADDRESS        U6C11020
                    *                                                   U6C11030
                    *             DISK SECTOR READ-WRITE BUFFER         U6C11040
                    *                                                   U6C11050
                          BSS  E  0         MAKE ADDR EVEN              U6C11060
                    IC990 DC      321       BUFFER WORD COUNT           U6C11070
                          BSS     321       RESERVE 321 WORDS           U6C11080
                          ORG     *-320     OVERLAY BUFFER WITH NEXT    U6C11090
                          END     IC000                                 U6C11100
