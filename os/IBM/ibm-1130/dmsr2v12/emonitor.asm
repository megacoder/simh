*SAVE SYMBOL TABLE
                    * RLTV ADDR* SYMBOL* DESCRIPTION                    PMN00010
                    *          *       *                                PMN00020
                    * 0-3      *       * RESERVED FOR EVEN BOUNDARIES   PMN00030
                    * 4-5      * #NAME * NAME OF PROGRAM/CORE LOAD      PMN00040
                    * 6        * #DBCT * BLOCK COUNT OF PROG/CORE LOAD  PMN00050
                    * 7        * #FCNT * *FILES SWITCH--ZERO MEANS NO   PMN00060
                    *          *       * FILES HAVE BEEN EQUATED        PMN00070
                    * 8        * #SYSC * SYS/NON-SYS CARTRIDGE INDR     PMN00080
                    * 9        * #JBSW * JOBT SWITCH-- NON-ZERO MEANS   PMN00090
                    *          *       * TEMPORARY MODE                 PMN00100
                    * 10       * #CBSW * CLB-RETURN-TO-DUP SWITCH--     PMN00110
                    *          *       * ZERO=CLB RETURN TO SUPV        PMN00120
                    * 11       * #LCNT * NO. OF LOCALS                  PMN00130
                    * 12       * #MPSW * CORE MAP SWITCH--ZERO MEANS    PMN00140
                    *          *       * DO NOT PRINT A CORE MAP        PMN00150
                    * 13       * #MDF1 * NO. DUP CTRL RECDS (MODIF)     PMN00160
                    * 14       * #MDF2 * ADDR OF MODIF BUFFER           PMN00170
                    * 15       * #NCNT * NO. OF NOCALS                  PMN00180
                    * 16       * #ENTY * RLTV ENTRY ADDR OF PROGRAM     PMN00190
                    * 17       * #RP67 * 1442-5 SW (0=1442-5 ON SYSTEM  PMN00200
                    * 18       * #TODR * 'TO' WORKING STG DRIVE CODE    PMN00210
                    * 19       * #FRDR * 'FROM' WORKING STG DRIVE CODE  PMN00220
                    * 20       * #FHOL * ADDR OF LARGEST HOLE IN FXA    PMN00230
                    * 21       * #FSZE * BLK CNT OF LARGEST HOLE IN FXA PMN00240
                    * 22       * #UHOL * ADDR OF LAST HOLE IN UA   2-10 PMN00250
                    * 23       * #USZE * BLK CNT OF LAST HOLE IN UA2-10 PMN00260
                    * 24       * #DCSW * DUP CALL SW--NON-ZERO=DUP CALL PMN00270
                    * 25       * #PIOD * PRINCIPAL I/O DEVICE INDICATOR PMN00280
                    * 26       * #PPTR * PRINC. PRINT DEVICE INDICATOR  PMN00290
                    * 27       * #CIAD * RLTV ADDR IN @STRT OF CIL ADDR PMN00300
                    * 28       * #ACIN * AVAILABLE CARTRIDGE INDICAT2-2 PMN00310
                    * 29       * #GRPH * 2250 INDICATOR             2G2 PMN00320
                    * 30       * #GCNT * NO. G2250 RECORDS          2G2 PMN00330
                    * 31       * #LOSW * LOCAL-CANNOT-CALL-LOCAL SW 2-2 PMN00340
                    * 32       * #X3SW * SPECIAL ILS SWITCH         2-2 PMN00350
                    * 33       * #ECNT * NO. OF *EQUAT RCDS         2-4 PMN00360
                    * 33-34    *       * RESERVED FOR FUTURE USE    2-2 PMN00370
                    * 35       * #ANDU * 1+BLOCK ADDR OF END OF USER    PMN00380
                    *          *       * AREA (ADJUSTED) LOGICAL DR 0   PMN00390
                    * 36       *       * 1+BLOCK ADDR OF END OF USER    PMN00400
                    *          *       * AREA (ADJUSTED) LOGICAL DR 1   PMN00410
                    * 37       *       * 1+BLOCK ADDR OF END OF USER    PMN00420
                    *          *       * AREA (ADJUSTED) LOGICAL DR 2   PMN00430
                    * 38       *       * 1+BLOCK ADDR OF END OF USER    PMN00440
                    *          *       * AREA (ADJUSTED) LOGICAL DR 3   PMN00450
                    * 39       *       * 1+BLOCK ADDR OF END OF USER    PMN00460
                    *          *       * AREA (ADJUSTED) LOGICAL DR 4   PMN00470
                    * 40       * #BNDU * 1+BLOCK ADDR OF END OF USER    PMN00480
                    *          *       * AREA (BASE) LOGICAL DRIVE  0   PMN00490
                    * 41       *       * 1+BLOCK ADDR OF END OF USER    PMN00500
                    *          *       * AREA (BASE) LOGICAL DRIVE  1   PMN00510
                    * 42       *       * 1+BLOCK ADDR OF END OF USER    PMN00520
                    *          *       * AREA (BASE) LOGICAL DRIVE  2   PMN00530
                    * 43       *       * 1+BLOCK ADDR OF END OF USER    PMN00540
                    *          *       * AREA (BASE) LOGICAL DRIVE  3   PMN00550
                    * 44       *       * 1+BLOCK ADDR OF END OF USER    PMN00560
                    *          *       * AREA (BASE) LOGICAL DRIVE  4   PMN00570
                    * 45       * #FPAD * FILE PROTECT ADDR, LOGICAL     PMN00580
                    *          *       * DRIVE 0 (BASE)                 PMN00590
                    * 46       *       * FILE PROTECT ADDR, LOGICAL     PMN00600
                    *          *       * DRIVE 1 (BASE)                 PMN00610
                    * 47       *       * FILE PROTECT ADDR, LOGICAL     PMN00620
                    *          *       * DRIVE 2 (BASE)                 PMN00630
                    * 48       *       * FILE PROTECT ADDR, LOGICAL     PMN00640
                    *          *       * DRIVE 3 (BASE)                 PMN00650
                    * 49       *       * FILE PROTECT ADDR,LOGICAL      PMN00660
                    *          *       * DRIVE 4 (BASE)                 PMN00670
                    * 50       * #PCID * CARTRIDGE ID, PHYSICAL DRIVE 0 PMN00680
                    * 51       *       * CARTRIDGE ID, PHYSICAL DRIVE 1 PMN00690
                    * 52       *       * CARTRIDGE ID, PHYSICAL DRIVE 2 PMN00700
                    * 53       *       * CARTRIDGE ID, PHYSICAL DRIVE 3 PMN00710
                    * 54       *       * CARTRIDGE ID, PHYSICAL DRIVE 4 PMN00720
                    * 55       * #CIDN * CARTRIDGE ID, LOGICAL DRIVE 0  PMN00730
                    * 56       *       * CARTRIDGE ID, LOGICAL DRIVE 1  PMN00740
                    * 57       *       * CARTRIDGE ID, LOGICAL DRIVE 2  PMN00750
                    * 58       *       * CARTRIDGE ID, LOGICAL DRIVE 3  PMN00760
                    * 59       *       * CARTRIDGE ID, LOGICAL DRIVE 4  PMN00770
                    * 60       * #CIBA * SCTR ADDR OF CIB, LOGICAL DR 0 PMN00780
                    * 61       *       * SCTR ADDR OF CIB, LOGICAL DR 1 PMN00790
                    * 62       *       * SCTR ADDR OF CIB, LOGICAL DR 2 PMN00800
                    * 63       *       * SCTR ADDR OF CIB, LOGICAL DR 3 PMN00810
                    * 64       *       * SCTR ADDR OF CIB, LOGICAL DR 4 PMN00820
                    * 65       * #SCRA * SCRA, LOGICAL DRIVE 0          PMN00830
                    * 66       *       * SCRA, LOGICAL DRIVE 1          PMN00840
                    * 67       *       * SCRA, LOGICAL DRIVE 2          PMN00850
                    * 68       *       * SCRA, LOGICAL DRIVE 3          PMN00860
                    * 69       *       * SCRA, LOGICAL DRIVE 4          PMN00870
                    * 70       * #FMAT * FORMAT OF PROG IN WS, DRIVE 0  PMN00880
                    * 71       *       * FORMAT OF PROG IN WS, DRIVE 1  PMN00890
                    * 72       *       * FORMAT OF PROG IN WS, DRIVE 2  PMN00900
                    * 73       *       * FORMAT OF PROG IN WS, DRIVE 3  PMN00910
                    * 74       *       * FORMAT OF PROG IN WS, DRIVE 4  PMN00920
                    * 75       * #FLET * FLET SCTR ADDR, LOGICAL DR 0   PMN00930
                    * 76       *       * FLET SCTR ADDR, LOGICAL DR 1   PMN00940
                    * 77       *       * FLET SCTR ADDR, LOGICAL DR 2   PMN00950
                    * 78       *       * FLET SCTR ADDR, LOGICAL DR 3   PMN00960
                    * 79       *       * FLET SCTR ADDR, LOGICAL DR 4   PMN00970
                    * 80       * #ULET * LET SCTR ADDR, LOGICAL DR 0    PMN00980
                    * 81       *       * LET SCTR ADDR, LOGICAL DR 1    PMN00990
                    * 82       *       * LET SCTR ADDR, LOGICAL DR 2    PMN01000
                    * 83       *       * LET SCTR ADDR, LOGICAL DR 3    PMN01010
                    * 84       *       * LET SCTR ADDR, LOGICAL DR 4    PMN01020
                    * 85       * #WSCT * BLK CNT OF PROG IN WS, DRIVE 0 PMN01030
                    * 86       *       * BLK CNT OF PROG IN WS, DRIVE 1 PMN01040
                    * 87       *       * BLK CNT OF PROG IN WS, DRIVE 2 PMN01050
                    * 88       *       * BLK CNT OF PROG IN WS, DRIVE 3 PMN01060
                    * 89       *       * BLK CNT OF PROG IN WS, DRIVE 4 PMN01070
                    * 90       * #CSHN * SCTR CNT CUSHION,LOGICAL DR 0  PMN01080
                    * 91       *       * SCTR CNT CUSHION,LOGICAL DR 1  PMN01090
                    * 92       *       * SCTR CNT CUSHION,LOGICAL DR 2  PMN01100
                    * 93       *       * SCTR CNT CUSHION,LOGICAL DR 3  PMN01110
                    * 94       *       * SCTR CNT CUSHION,LOGICAL DR 4  PMN01120
                    * 95-319   *       * RESERVED FOR FUTURE USE        PMN01130
                          HDNG    RESIDENT MONITOR                      PMN01140
                    *************************************************** PMN01150
                    *                                                 * PMN01160
                    *STATUS-VERSION 2, MODIFICATION 10                * PMN01170
                    *                                                 * PMN01180
                    *FUNCTION/OPERATION-                              * PMN01190
                    *   THIS SECTION ALWAYS REMAINS IN CORE. IT       * PMN01200
                    *   IS COMPRISED OF THE COMMUNICATIONS            * PMN01210
                    *   AREA (COMMA), THE SKELETON SUPERVISOR, AND    * PMN01220
                    *   A DISK I/O SUBROUTINE, NOMINALLY DISKZ. (THE  * PMN01230
                    *   FIRST TWO OF THESE SECTIONS ARE INTERMIXED.)  * PMN01240
                    *   COMMA CONTAINS THE SYSTEM PARAMETERS REQUIR-  * PMN01250
                    *   ED TO FETCH A CORE LOAD IN CORE IMAGE FOR-    * PMN01260
                    *   MAT. THE SKELETON SUPERVISOR PROVIDES IN-     * PMN01270
                    *   STRUCTIONS FOR INITIATING A CALL EXIT, A      * PMN01280
                    *   CALL LINK, A DUMP-TO-PRINTER OR A CALL TO THE * PMN01290
                    *   AUXILIARY SUPERVISOR.  IN ADDITION, THE SKELE-* PMN01300
                    *   TON SUPERVISOR CONTAINS SEVERAL TRAPS FOR CER-* PMN01310
                    *   TAIN I/O FUNCTIONS/CONDITIONS. THE DISK I/O   * PMN01320
                    *   SECTION CONSISTS OF A SUBROUTINE FOR READING  * PMN01330
                    *   FROM OR WRITING ON A DISK CARTRIDGE ON A      * PMN01340
                    *   GIVEN LOGICAL DISK DRIVE.                     * PMN01350
                    *                                                 * PMN01360
                    *ENTRY POINTS-                                    * PMN01370
                    *   * $PRET-A TRAP FOR PREOPERATIVE I/O ERRORS.   * PMN01380
                    *           THE CALLING SEQUENCE IS               * PMN01390
                    *              BSI   L  $PRET                     * PMN01400
                    *   * $PSTX-A POSTOPERATIVE ERROR TRAP FOR I/O    * PMN01410
                    *           DEVICES ON LEVEL X (X=1,2,3,OR 4).    * PMN01420
                    *           THE CALLING SEQUENCE IS               * PMN01430
                    *              BSI  L  $PSTX                      * PMN01440
                    *   * $STOP-THE PROGRAM STOP KEY TRAP.            * PMN01450
                    *   * $EXIT-THE ENTRY POINT FOR THE EXIT/CALL     * PMN01460
                    *          EXIT STATEMENT. THE CALLING SEQUENCE IS* PMN01470
                    *             LDX   0 $EXIT                       * PMN01480
                    *   * $LINK-THE ENTRY POINT FOR THE LINK/CALL     * PMN01490
                    *          LINK STATEMENT. THE CALLING SEQUENCE IS* PMN01500
                    *             BSI  L  $LINK                       * PMN01510
                    *   * $DUMP-THE ENTRY POINT FOR THE DUMP/PDMP     * PMN01520
                    *          STATEMENT. THE CALLING SEQUENCE IS     * PMN01530
                    *             BSI  L  $DUMP                       * PMN01540
                    *             DC      FORMAT                      * PMN01550
                    *             DC      LIMIT1                      * PMN01560
                    *             DC      LIMIT2                      * PMN01570
                    *          WHERE LIMIT1 AND LIMIT2 ARE THE LIMITS * PMN01580
                    *          BETWEEN WHICH THE DUMP IS TO OCCUR, AND* PMN01590
                    *          FORMAT IS A CODE INDICATING THE FORMAT * PMN01600
                    *          OF THE DUMP. IF FORMAT IS NEGATIVE,    * PMN01610
                    *          THE AUXILIARY SUPERVISOR IS FETCHED    * PMN01620
                    *          AND CONTROL PASSED TO IT.              * PMN01630
                    *   * DZ000-ENTERED WHEN THE CALLER WISHES TO     * PMN01640
                    *           PERFORM A DISK I/O OPERATION. THE     * PMN01650
                    *           CALLING SEQUENCE VARIES WITH THE      * PMN01660
                    *           VERSION OF THE DISK I/O SUBROUTINE.   * PMN01670
                    *   * $I200/$I400-ENTERED WHEN THE OPERATION-     * PMN01680
                    *                 COMPLETE INTERRUPT OCCURS ON    * PMN01690
                    *                 LEVEL 2/4.                      * PMN01700
                    *                                                 * PMN01710
                    *INPUT-N/A                                        * PMN01720
                    *                                                 * PMN01730
                    *OUTPUT-WORDS 6-4090 SAVED ON THE CIB ON A CALL   * PMN01740
                    *       DUMP                                      * PMN01750
                    *                                                 * PMN01760
                    *EXTERNAL REFERENCES-N/A                          * PMN01770
                    *                                                 * PMN01780
                    *EXITS-                                           * PMN01790
                    *   * NORMAL                                      * PMN01800
                    *       *THE EXITS FROM THE SUBROUTINES AT $PRET  * PMN01810
                    *        $PST1, $PST2, $PST3, $PST4, AND $STOP    * PMN01820
                    *        ARE BRANCH INSTRUCTIONS FOLLOWING A      * PMN01830
                    *        WAIT INSTRUCTION. $STOP TURNS OFF IN-    * PMN01840
                    *        TERRUPT LEVEL 5 AFTER THE START KEY IS   * PMN01850
                    *        DEPRESSED.                               * PMN01860
                    *       *THE EXITS FROM $EXIT,$LINK,AND $DUMP ARE * PMN01870
                    *        TO THE CORE IMAGE LOADER, PHASE 1,       * PMN01880
                    *        AFTER THAT PHASE HAS BEEN FETCHED.       * PMN01890
                    *       *THE EXIT FROM DZ000 IS BACK TO THE       * PMN01900
                    *        CALLER AFTER THE REQUESTED DISK OPERA-   * PMN01910
                    *        TION HAS BEEN INITIATED.                 * PMN01920
                    *       *THE EXITS FROM $I200/$I400 ARE BACK TO   * PMN01930
                    *        THE ADDRESSES FROM WHICH THE DISK OP-    * PMN01940
                    *        ERATION COMPLETE INTERRUPT OCCURED       * PMN01950
                    *        AFTER THE INTERRUPT HAS BEEN SERVICED    * PMN01960
                    *        BY THE APPROPRIATE ISS.                  * PMN01970
                    *   * ERROR-N/A                                   * PMN01980
                    *                                                 * PMN01990
                    *TABLES/WORK AREAS-                               * PMN02000
                    *   * $ACDE                                       * PMN02010
                    *   * $CH12                                       * PMN02020
                    *   * $CILA                                       * PMN02030
                    *   * $CLSW                                       * PMN02040
                    *   * $COMN                                       * PMN02050
                    *   * $CORE                                       * PMN02060
                    *   * $CTSW                                       * PMN02070
                    *   * $CXR1                                       * PMN02080
                    *   * $CYLN                                       * PMN02090
                    *   * $DADR                                       * PMN02100
                    *   * $DBSY                                       * PMN02110
                    *   * $DCYL                                       * PMN02120
                    *   * $DMPF                                       * PMN02130
                    *   * $DREQ                                       * PMN02140
                    *   * $FPAD                                       * PMN02150
                    *   * $GCOM                                   2G2 * PMN02160
                    *   * $GRIN                                   2G2 * PMN02170
                    *   * $HASH                                       * PMN02180
                    *   * $IBT2                                       * PMN02190
                    *   * $IBT4                                       * PMN02200
                    *   * $IBSY                                       * PMN02210
                    *   * $IOCT                                       * PMN02220
                    *   * $KCSW                                       * PMN02230
                    *   * $LAST                                       * PMN02240
                    *   * $LNXQ                                   2-9 * PMN02250
                    *   * $NDUP                                       * PMN02260
                    *   * $NXEQ                                       * PMN02270
                    *   * $PBSY                                       * PMN02280
                    *   * $PGCT                                       * PMN02290
                    *   * $PHSE                                       * PMN02300
                    *   * $RMSW                                       * PMN02310
                    *   * $SCAT                                   2-4 * PMN02320
                    *   * $SNLT                                       * PMN02330
                    *   * $UFIO                                       * PMN02340
                    *   * $ULET                                       * PMN02350
                    *   * $WRD1                                       * PMN02360
                    *   * $WSDR                                       * PMN02370
                    *   * $XR3X                                   2-2 * PMN02380
                    *                                                 * PMN02390
                    *ATTRIBUTES-REUSABLE                              * PMN02400
                    *                                                 * PMN02410
                    *NOTES-                                           * PMN02420
                    *   THERE ARE WAIT INSTRUCTIONS AT $PRET+1,       * PMN02430
                    *   $STOP+1, AND $PSTX+1. DEPRESSING THE START    * PMN02440
                    *   KEY WILL RETURN CONTROL TO THE CALLER IN ALL  * PMN02450
                    *   CASES.                                        * PMN02460
                    *************************************************** PMN02470
                          HDNG    RESIDENT MONITOR                      PMN02480
                    * PROVIDE PARAMETERS FOR SYSTEM LOADER              PMN02490
                    *                                                   PMN02500
                          ABS                                           PMN02510
                          ORG     4                                     PMN02520
                          DC      4095-* WD CNT FOR WRITING CORE ON CIB PMN02530
                    $CIBA DC      *-*  SCTR ADDR OF THE CIB             PMN02540
                    $CH12 DC      *-*  ADDR OF CHANNEL 12 INDICATOR     PMN02550
                    $COMN DC      *-*  LENGTH OF COMMON (IN WORDS)      PMN02560
                    *                                                   PMN02570
                    * ULTIMATE RESIDENCE OF THE INTERRUPT TV            PMN02580
                    *                                                   PMN02590
                    $LEV0 DC      *-*   LEVEL 0 BRANCH ADDRESS          PMN02600
                    $LEV1 DC      *-*   LEVEL 1 BRANCH ADDRESS          PMN02610
                    $LEV2 DC      $I200 LEVEL 2 BRANCH ADDR             PMN02620
                    $LEV3 DC      *-*   LEVEL 3 BRANCH ADDRESS          PMN02630
                    $LEV4 DC      $I400 LEVEL 4 BRANCH ADDR             PMN02640
                    $LEV5 DC      $STOP LEVEL 5 BRANCH ADDR             PMN02650
                    *                                                   PMN02660
                    *                                                   PMN02670
                    $CORE DC      *-*  SIZE OF CORE, E.G., /1000=4K     PMN02680
                    $CTSW DC      *-*  CONTROL RECORD TRAP SWITCH       PMN02690
                    $DADR DC      *-*  SCTR ADDR OF PROG TO BE LOADED   PMN02700
                    $SCAT DC      *-*  NON ZERO=SCA INTRPT PNDNG    2-4 PMN02710
                    $DREQ DC      *-*  IND. FOR REQUESTED VERSION DKI/O PMN02720
                    $IBSY DC      *-*  NON-ZERO IF CD/PAP TP DEV. BUSY  PMN02730
                    $HASH BSS  E  12   WORK AREA                        PMN02740
                    *                                                   PMN02750
                    *                                                   PMN02760
                    $SCAN BSS     8    1132 SCAN AREA                32 PMN02770
                    *                                                   PMN02780
                    *                                                   PMN02790
                    *                                                   PMN02800
                    * TRAP FOR PREOPERATIVE I/O ERRORS                  PMN02810
                    *                                                   PMN02820
                    $PRET DC      *-*       ENTRY POINT                 PMN02830
                          WAIT              WAIT TIL START KEY PUSHED   PMN02840
                          BSC  I  $PRET     RETURN TO CALLER            PMN02850
                    *                                                   PMN02860
                    *                                                   PMN02870
                    $IREQ DC      *-*  ADDR OF INT REQUEST SUBROUTINE   PMN02880
                    $ULET DC      *-*  ADDR OF LET, LOGICAL DR 0        PMN02890
                          DC      *-*  ADDR OF LET, LOGICAL DR 1        PMN02900
                          DC      *-*  ADDR OF LET, LOGICAL DR 2        PMN02910
                          DC      *-*  ADDR OF LET, LOGICAL DR 3        PMN02920
                          DC      *-*  ADDR OF LET, LOGICAL DR 4        PMN02930
                    $IOCT DC      *-*  ZERO IF NO I/O IN PROGRESS    50 PMN02940
                    $LAST DC      *-*  NON-ZERO WHEN LAST CARD SENSED   PMN02950
                    $NDUP DC      *-*  DO NOT DUP IF NON-ZERO           PMN02960
                    $NXEQ DC      *-*  DO NOT EXECUTE IF NON-ZERO       PMN02970
                    $PBSY DC      *-*  NON-ZERO WHEN PRINTER BUSY       PMN02980
                    $PGCT DC      *-*  PAGE NO. FOR HEADINGS            PMN02990
                    *                                                   PMN03000
                    * CALL EXIT ENTRY POINT TO SKELETON SUPERVISOR      PMN03010
                    *                                                   PMN03020
                    $EXIT MDX     $S000     BR TO FETCH CIL, PHASE 1 56 PMN03030
                    *                                                   PMN03040
                    *** CALL LINK ENTRY POINT                           PMN03050
                    *                                                   PMN03060
                    $LINK DC      *-*       ENTRY POINT              57 PMN03070
                          SRA     16                                    PMN03080
                          MDX     $S100     BR TO FETCH CIL, PHASE 1    PMN03090
                          BSS  E  0                                     PMN03100
                    $S900 DC      1    DISK PARAMETERS FOR SAVING CORE  PMN03110
                    *$S900 ALSO USED AS CONSTANT 1 BY CIL PH2      2-10 PMN03111
                          DC      $CIBA-1 *IN CONNECTION WITH DUMP      PMN03120
                    $S910 DC      -1   CALL EXIT INDICATOR              PMN03130
                    *$S910 ALSO USED AS CONSTANT-1 BY CIL PH2      2-10 PMN03131
                    *                                                   PMN03140
                    *** SAVE 1ST 4K OF CORE ON THE CIB                  PMN03150
                    *                                                   PMN03160
                    $DUMP DC      *-*       ENTRY POINT             63  PMN03170
                          STD     $ACEX     SAVE ACCUMULATOR, EXTENSION PMN03180
                          BSI     $S250     CHK PNDNG INTRPT        2-4 PMN03190
                          STS     $SSTS     SAVE STATUS             2-6 PMN03200
                          STX   1 $CXR1     SAVE XR1                    PMN03210
                          LD   I  $DUMP                                 PMN03220
                          STO     $DMPF     SAVE DUMP FORMAT CODE       PMN03230
                          LDD     $S900                                 PMN03240
                          BSI  L  DZ000     SAVE WDS 6-4095 ON CIB      PMN03250
                          LD      $S900                                 PMN03260
                          MDX     $S100     BR TO FETCH CIL, PHASE 1    PMN03270
                    *                                               2-6 PMN03280
                          BSS     6         PATCH AREA              2-7 PMN03290
                          HDNG    RESIDENT MONITOR                      PMN03300
                    *                                                   PMN03310
                    *** FETCH CORE IMAGE LOADER, PHASE 1                PMN03320
                    *                                                   PMN03330
                    $S000 LD      $S910                                 PMN03340
                    $S100 STO     $RMSW     SAVE EXIT-LINK-DUMP SWITCH  PMN03350
                          LDX  I1 $LINK     LINK ADDR TO XR1            PMN03360
                          LD    1 1         FETCH 2ND WD OF LINK NAME   PMN03370
                          RTE     16                                    PMN03380
                          LD    1 0         FETCH 1ST WD OF LINK NAME   PMN03390
                    * $S150+1 CONTAINS ADDR LAST WD OF DISK I/O MINUS 3 PMN03400
                    $S150 LDX  L1 *-*       ADDR END OF DKI/O-1 TO XR1  PMN03410
                          STD     $LKNM     SAVE LINK NAME              PMN03420
                          BSI     $S250     CHK ANY PNDNG INTRPT    2-4 PMN03430
                          LD      $CILA                                 PMN03440
                    $S200 SRT     16                                    PMN03450
                          BSI  L  DZ000     FETCH CI LOADER, PHASE 1    PMN03460
                          BSI     $S250     CHK DISK OP FINISHED    2-4 PMN03470
                          BSI   1 2         BR TO CI LOADER, PHASE 1    PMN03480
                    *                                                   PMN03490
                    $GCOM DC      *-*  GRAPHIC SUBR PACKAGE INDR    2G2 PMN03500
                    $GRIN DC      *-*  GRAPHIC INITLZN PROGRAM INDR 2G2 PMN03510
                    *                                                   PMN03520
                    *** SUBR TO CHECK IF ANY INTRPT IS PENDING          PMN03530
                    *                                                   PMN03540
                    $S250 DC      *-*       ENTRY POINT                 PMN03550
                    $S300 LD      $IOCT     IS THERE INTRPT PNDNG       PMN03560
                          OR      $SCAT     *OR SCA INTRPT PNDNG        PMN03570
                          BSC  L  $S300,Z   *THEN BR,IF ALL INTRPT      PMN03580
                          XIO     $I499     RESET 2250              2-7 PMN03590
                          BSC  I  $S250     *IS SERVICED-RETURN         PMN03600
                    *                                               2-6 PMN03610
                    $SSTS LDS     *-*       STATUS SAVED FOR DUMP   2-7 PMN03620
                    $I499 DC      0         IOCC FOR RESET          2-7 PMN03630
                          DC      /CC80     *OF 2250                2-7 PMN03640
                    $LNXQ DC      *-*  LINK/XEQ SW, -1 LINK,+1 XEQ  2-9 PMN03650
                    *                                                   PMN03660
                    $FLSH DC      *-*  FLUSH-TO-NEXT-JOB SWITCH 1=FLUSH PMN03670
                          BSS  E  0                                     PMN03680
                    $CWCT DC      *-*  WORD COUNT AND SECTOR ADDRESS    PMN03690
                          DC      *-*  *FOR SAVING/RESTORING COMMON     PMN03700
                    $CCAD DC      *-*  ADDR FOR SAVING/RESTORING COMMON PMN03710
                    $LSAD DC      *-*  SCTR ADDR OF 1ST LOCAL/SOCAL     PMN03720
                    $DZ1N DC      *-*  DISKZ/1/N INDICATOR (-1,0,+1)    PMN03730
                    $DCDE DC      *-*  LOGICAL DRIVE CODE FOR PROGRAM   PMN03740
                    $PHSE DC      *-*  NO. OF PHASE NOW IN CORE         PMN03750
                    $UFIO DC      *-*  UNFORMATTED I/O RECORD NO.       PMN03760
                    $WSDR DC      *-*  WORKING STORAGE DRIVE CODE       PMN03770
                    $WRD1 DC      *-*  LOADING ADDR OF THE CORE LOAD    PMN03780
                    $KCSW DC      *-*  1 IF KB,CP BOTH UTILIZED         PMN03790
                    $UFDR DC      *-*  UNFORMATTED I/O DRIVE CODE       PMN03800
                    $CPTR DC      *-*  CHANNEL 12 INDICATOR FOR CP      PMN03810
                    $1132 DC      *-*  CHANNEL 12 INDICATOR FOR 1132    PMN03820
                    $1403 DC      *-*  CHANNEL 12 INDICATOR FOR 1403    PMN03830
                          HDNG    RESIDENT MONITOR                      PMN03840
                    * TRAP FOR POSTOPERATIVE I/O ERRORS ON LEVEL 1      PMN03850
                    *                                                   PMN03860
                    $PST1 DC      *-*       ENTRY POINT                 PMN03870
                          WAIT                                          PMN03880
                          BSC  I  $PST1     RETURN TO DEVICE SUBROUTINE PMN03890
                    *                                                   PMN03900
                    * TRAP FOR POSTOPERATIVE I/O ERRORS ON LEVEL 2      PMN03910
                    *                                                   PMN03920
                    $PST2 DC      *-*       ENTRY POINT                 PMN03930
                          WAIT                                          PMN03940
                          BSC  I  $PST2     RETURN TO DEVICE SUBROUTINE PMN03950
                    *                                                   PMN03960
                    * TRAP FOR POSTOPERATIVE I/O ERRORS ON LEVEL 3      PMN03970
                    *                                                   PMN03980
                    $PST3 DC      *-*       ENTRY POINT                 PMN03990
                          WAIT                                          PMN04000
                          BSC  I  $PST3     RETURN TO DEVICE SUBROUTINE PMN04010
                    *                                                   PMN04020
                    * TRAP FOR POSTOPERATIVE I/O ERRORS ON LEVEL 4      PMN04030
                    *                                                   PMN04040
                    $PST4 DC      *-*       ENTRY POINT                 PMN04050
                          WAIT                                          PMN04060
                          BSC  I  $PST4     RETURN TO DEVICE SUBROUTINE PMN04070
                    *                                                   PMN04080
                    *                                                   PMN04090
                    * PROGRAM STOP KEY TRAP                             PMN04100
                    *                                                   PMN04110
                    $STOP DC      *-*       ENTRY POINT                 PMN04120
                          WAIT              WAIT TIL START KEY PUSHED   PMN04130
                          BOSC I  $STOP     RETURN TO CALLER            PMN04140
                          HDNG    RESIDENT MONITOR                      PMN04150
                    *                                                   PMN04160
                    * PARAMETERS USED BY THE DISK I/O SUBROUTINES. THE  PMN04170
                    * LOGICAL DRIVE CODE IS FOUND IN BITS 1-3 FOR ALL   PMN04180
                    * BUT THE AREA CODE. BIT 0 WILL ALWAYS BE ZERO.     PMN04190
                    *                                                   PMN04200
                    *                                                   PMN04210
                    *** DISK1 AND DISKN WILL NOT WRITE BELOW THE        PMN04220
                    *** FOLLOWING SCTR ADDRESSES (EXCEPT WRITE IMMED).  PMN04230
                    *                                                   PMN04240
                    $FPAD DC      *-*  FILE PROTECT ADDR, LOGICAL DR 0  PMN04250
                          DC      *-*  FILE PROTECT ADDR, LOGICAL DR 1  PMN04260
                          DC      *-*  FILE PROTECT ADDR, LOGICAL DR 2  PMN04270
                          DC      *-*  FILE PROTECT ADDR, LOGICAL DR 3  PMN04280
                          DC      *-*  FILE PROTECT ADDR, LOGICAL DR 4  PMN04290
                    *                                                   PMN04300
                    *** THE ARM POSITION IS UPDATED WHENEVER A SEEK     PMN04310
                    *** OCCURS.                                         PMN04320
                    *                                                   PMN04330
                    $CYLN DC      0    ARM POSITION FOR LOGICAL DRIVE 0 PMN04340
                          DC      0    ARM POSITION FOR LOGICAL DRIVE 1 PMN04350
                          DC      0    ARM POSITION FOR LOGICAL DRIVE 2 PMN04360
                          DC      0    ARM POSITION FOR LOGICAL DRIVE 3 PMN04370
                          DC      0    ARM POSITION FOR LOGICAL DRIVE 4 PMN04380
                    *                                                   PMN04390
                    *** BELOW ARE THE DISK AREA CODES. A ZERO           PMN04400
                    *** INDICATES THE CORRESPONDING DRIVE IS NOT        PMN04410
                    *** ON THE SYSTEM                                   PMN04420
                    *                                                   PMN04430
                    $ACDE DC      *-*  AREA  CODE FOR LOGICAL DRIVE 0   PMN04440
                          DC      *-*  AREA  CODE FOR LOGICAL DRIVE 1   PMN04450
                          DC      *-*  AREA  CODE FOR LOGICAL DRIVE 2   PMN04460
                          DC      *-*  AREA  CODE FOR LOGICAL DRIVE 3   PMN04470
                          DC      *-*  AREA  CODE FOR LOGICAL DRIVE 4   PMN04480
                    *                                                   PMN04490
                    *** THE ADR OF THE CYLINDER IN WHICH A DEFECT OC-   PMN04500
                    *** CURS, IF ANY, IS STORED IN THE 1ST, 2ND, OR 3RD PMN04510
                    *** WORD BELOW, DEPENDING ON WHETHER IT IS THE 1ST, PMN04520
                    *** 2ND, OR 3RD DEFECT ON THE CARTRIDGE.            PMN04530
                    *                                                   PMN04540
                    $DCYL DC      *-*  DEFECTIVE CYLINDER ADDRESSES   1 PMN04550
                          DC      *-*  *FOR LOGICAL DRIVE 0           2 PMN04560
                          DC      *-*                                 3 PMN04570
                          DC      *-*  DEFECTIVE CYLINDER ADDRESSES   1 PMN04580
                          DC      *-*  *FOR LOGICAL DRIVE 1           2 PMN04590
                          DC      *-*                                 3 PMN04600
                          DC      *-*  DEFECTIVE CYLINDER ADDRESSES   1 PMN04610
                          DC      *-*  *FOR LOGICAL DRIVE 2           2 PMN04620
                          DC      *-*                                 3 PMN04630
                          DC      *-*  DEFECTIVE CYLINDER ADDRESSES   1 PMN04640
                          DC      *-*  *FOR LOGICAL DRIVE 3           2 PMN04650
                          DC      *-*                                 3 PMN04660
                          DC      *-*  DEFECTIVE CYLINDER ADDRESSES   1 PMN04670
                          DC      *-*  *FOR LOGICAL DRIVE 4           2 PMN04680
                          DC      *-*                                 3 PMN04690
                          HDNG    RESIDENT MONITOR                      PMN04700
                    *                                                   PMN04710
                    * ILS02--THIS SUBROUTINE SAVES XR1, XR2, STATUS,    PMN04720
                    *        AND THE ACCUMULATOR AND ITS EXTENSION.     PMN04730
                    *        THE ADDRESS OF THE INTERRUPT SERVICE ROU-  PMN04740
                    *        TINE IS STORED IN $I205 BY PHASE 2 OF      PMN04750
                    *        THE CORE IMAGE LOADER. WORD 10 ALWAYS      PMN04760
                    *        CONTAINS THE ADDRESS OF $I200.             PMN04770
                    *                                                   PMN04780
                    *                                                   PMN04790
                    *                                                   PMN04800
                    $I200 DC      *-*       ENTRY PT (LEVEL 2 INTRUPT)  PMN04810
                          STX   1 $I210+1   SAVE XR1                    PMN04820
                          STX   2 $I210+3   SAVE XR2                    PMN04830
                          STS     $I210+4   STORE STATUS                PMN04840
                          STD     $I290     SAVE ACCUMULATOR,EXTENSION  PMN04850
                    * $I205+1 CONTAINS ADDR INTERRUPT ENTRY PT TO DKI/O PMN04860
                    $I205 BSI  L  *-*       BR TO SERVICE THE INTERRUPT PMN04870
                    $I210 LDX  L1 *-*       RESTORE XR1                 PMN04880
                          LDX  L2 *-*       RESTORE XR2                 PMN04890
                          LDS     0         RESTORE STATUS              PMN04900
                          LDD     $I290     RESTORE ACCUMULATOR,EXT     PMN04910
                          BOSC I  $I200     RETURN FROM INTERRUPT       PMN04920
                    $I290 BSS  E  0                                     PMN04930
                          DC      *-*       CONTENTS OF ACCUMULATOR AND PMN04940
                          DC      *-*       *EXTENTION                  PMN04950
                          HDNG    RESIDENT MONITOR                      PMN04960
                    *                                                   PMN04970
                    * ILS04--THIS SUBROUTINE SAVES XR1, XR2, STATUS,    PMN04980
                    *        AND THE ACCUMULATOR AND ITS EXTENSION.     PMN04990
                    *        IF THE INTERRUPT IS FOR A KEYBOARD REQ-  * PMN05000
                    *        UEST,AND IF A MONITOR PROGRAM IS IN CON- * PMN05010
                    *        TROL, CONTROL IS PASSED TO DUMP. OTHER-  * PMN05020
                    *        WISE, CONTROL IS PASSED TO THE KEYBOARD/ * PMN05030
                    *        CONSOLE PRINTER SUBROUTINE. WORD 12 AL-  * PMN05040
                    *        WAYS CONTAINS THE ADDRESS OF $I400.      * PMN05050
                    *                                                   PMN05060
                    * THE TABLE BELOW CONTAINS THE ADDRESSES OF THE     PMN05070
                    * INTERRUPT SERVICE ROUTINES FOR ALL THE DEVICES    PMN05080
                    * ON LEVEL 4.                                       PMN05090
                    *                                                   PMN05100
                    *                                                   PMN05110
                    *                                                   PMN05120
                    $I400 DC      *-*       ENTRY POINT                 PMN05130
                          STD     $I490     SAVE ACCUMULATOR, EXTENSION PMN05140
                          STS     $I410     SAVE STATUS                 PMN05150
                          STX   1 $I410+2   SAVE XR1                    PMN05160
                          STX   2 $I410+4   SAVE XR2                    PMN05170
                          XIO     $I492     SENSE DSW                   PMN05180
                          SLA     2         IS THIS INTERRUPT REQUEST   PMN05190
                          BSC  L  $I403,-   BR IF NOT INTERRUPT REQUEST PMN05200
                          BSI  I  $IREQ     BR IF INTERRUPT REQUEST     PMN05210
                          DC      -2        ERROR CODE                  PMN05220
                    $I403 LDX   1 9         NO. DEVICES ON LEVEL TO XR1 PMN05230
                          XIO     $I494     SENSE ILSW                  PMN05240
                          SLCA  1           FIND CAUSE OF INTERRUPT     PMN05250
                    * $I405+1 CONTAINS ADDR OF LEVEL 4 IBT MINUS 1      PMN05260
                    $I405 BSI  I1 *-*       BR TO SERVICE THE INTERRUPT PMN05270
                    $I410 LDS     0         RESTORE STATUS              PMN05280
                          LDX  L1 *-*       RESTORE XR1                 PMN05290
                          LDX  L2 *-*       RESTORE XR2                 PMN05300
                          LDD     $I490     RESTORE ACCUMULATOR, EXT.   PMN05310
                          BOSC I  $I400     RETURN                      PMN05320
                    *                                                   PMN05330
                    * CONSTANTS AND WORK AREAS                          PMN05340
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       PMN05350
                    *                                                   PMN05360
                    $DDSW DC      *-*       DSW FOR THE DISK            PMN05370
                    $I490 BSS  E  2    CONTENTS OF ACCUMULATOR, EXT.    PMN05380
                    $I492 DC      *-*                                   PMN05390
                    $SYSC EQU     *-1  VERSION AND MOD NO.              PMN05400
                          DC      /0F00 IOCC FOR SENSE IOCC FOR KB/CP   PMN05410
                    $I494 BSS     1    PATCH AREA                       PMN05420
                          DC      /0300 IOCC FOR SENSING ILSW04         PMN05430
                          HDNG    RESIDENT MONITOR                      PMN05440
                    *                                               2-2 PMN05450
                    *                                               2-2 PMN05460
                    $I496 DC      *-*        XR3 SETTING DURING XEQ 2-2 PMN05470
                          DC      /0F01      SENSE KEY BOARD W RESET2-2 PMN05480
                    *                                               2-2 PMN05490
                    $I420 DC      *-*        ENTRY POINT FLUSH JOB  2-2 PMN05500
                          XIO     $I496      SENSE KEY BOARD W RESET2-2 PMN05510
                          BOSC L  $I425      TURN OF INTERRUPT      2-2 PMN05520
                    $I425 BSI  L  $DUMP     BR TO $DUMP             2-7 PMN05530
                          DC      -2        CALLING AUX SUP         2-7 PMN05540
                    *                                               2-2 PMN05550
                          BSS     1         PATCH AREA              2-7 PMN05560
                    $DBSY DC      *-*  NON-ZERO WHEN DISK I/O BUSY      PMN05570
                          HDNG    DISKZ                                 PMN05580
                    *************************************************** PMN05590
                    *                                                 * PMN05600
                    *STATUS - VERSION 2, MODIFICATION 11              * PMN05610
                    *                                                 * PMN05620
                    *PROGRAM NAME-                                    * PMN05630
                    *   *FULL NAME-FORTRAN/SYSTEM DISK I/O SUBROUTINE * PMN05640
                    *   *CALLING SEQUENCE-                            * PMN05650
                    *      LDD     PARAM                              * PMN05660
                    *      BSI  L  DZ000                              * PMN05670
                    *    WHERE PARAM IS THE LABEL OF A DOUBLE-WORD    * PMN05680
                    *    CELL CONTAINING THE FUNCTION CODE AND THE    * PMN05690
                    *    ADDR OF THE I/O BUFFER,I.E., ADDR OF WD CNT. * PMN05700
                    *    SEE 'CAPABILITIES' FOR DISCUSSION OF PARAM-  * PMN05710
                    *    ETERS.                                       * PMN05720
                    *                                                   PMN05730
                    *PURPOSE-                                         * PMN05740
                    *   TO PROVIDE A SUBROUTINE TO PERFORM DISK OPERA-* PMN05750
                    *   TIONS. THIS SUBROUTINE IS INTENDED FOR USE BY * PMN05760
                    *   MONITOR PROGRAMS AND USER PROGRAMS WRITTEN IN * PMN05770
                    *   FORTRAN. THUS,IT IS INTENDED FOR USE IN AN    * PMN05780
                    *   ERROR-FREE ENVIRONMENT.                       * PMN05790
                    *                                                 * PMN05800
                    *METHOD-                                          * PMN05810
                    *   DISKZ REQUIRES A BUFFER,THE LENGTH OF WHICH IS* PMN05820
                    *   2 GREATER THAN THE NO. WORDS TO BE READ/WRIT- * PMN05830
                    *   TEN.                                          * PMN05840
                    *                                                 * PMN05850
                    *CAPABILITIES AND LIMITATIONS-                    * PMN05860
                    *   THE WD CNT,AS WELL AS DZ000,MUST BE ON AN EVEN* PMN05870
                    *   BOUNDARY,MUST BE IN THE RANGE 0-32767. THE    * PMN05880
                    *   DRIVE CODE MUST BE IN BITS 1-3 OF THE SECTOR  * PMN05890
                    *   ADDR,WHICH FOLLOWS THE WD CNT. THE FUNCTION   * PMN05900
                    *   INDICATOR MUST BE XX00 FOR A READ OR XX01 FOR * PMN05910
                    *   A WRITE,WHERE 'XX' MEANS ANY 2 HEXADECIMAL    * PMN05920
                    *   CHARACTERS. A WD CNT OF ZERO INDICATES A SEEK.* PMN05930
                    *   (READ OR WRITE MAY BE INDICATED.) AUTOMATIC   * PMN05940
                    *   SEEKING IS PROVIDED AS A PART OF READ/WRITE.  * PMN05950
                    *   A WRITE IS ALWAYS WITH A READ-BACK-CHECK.     * PMN05960
                    *   DISKZ MAKES NO PREOPERATIVE PARAMETER CHECKS. * PMN05970
                    *                                                 * PMN05980
                    *SPECIAL FEATURES-                                * PMN05990
                    *   DISKZ PROVIDES ONLY THOSE FUNCTIONS MENTIONED * PMN06000
                    *   ABOVE. DISK1 AND DISKN OFFER THIS BASIC SET OF* PMN06010
                    *   FUNCTIONS PLUS OTHERS.                        * PMN06020
                    *                                                 * PMN06030
                    *************************************************** PMN06040
                          HDNG    DISKZ                                 PMN06050
                    * PROVIDE PARAMETERS FOR SYSTEM LOADER              PMN06060
                    *                                                   PMN06070
                          BSS  E  0                                     PMN06080
                          DC      $ZEND-*   DISKZ WORD COUNT            PMN06090
                          DC      -@DZID    PHASE ID                    PMN06100
                          DC      $ZEND-6-*+1 ADDR OF SLET EXTRACT      PMN06110
                          DC      1         NO. ENTRIES IN SLET EXTRACT PMN06120
                          ORG     *-2                                   PMN06130
                          HDNG    DISKZ                                 PMN06140
                    DZ000 DC      *-*       ENTRY POINT                 PMN06150
                          MDX  L  $DBSY,0   LOOP UNTIL OPERATION IN     PMN06160
                          MDX     *-3       *PROGRESS IS COMPLETE       PMN06170
                          MDX     DZ020     BR AROUND INT ENTRY POINT   PMN06180
                    *                                                   PMN06190
                    * INTERRUPT ENTRY POINT                             PMN06200
                    *                                                   PMN06210
                    DZ010 DC      *-*       INTERRUPT ADDRESS           PMN06220
                          MDX     DZ180     BR TO SERVICE INTERRUPT     PMN06230
                    DZ020 STX   1 DZ100+1   SAVE XR1                    PMN06240
                          STX   2 DZ100+3   SAVE XR2                    PMN06250
                          SLA     8         SHIFT INDICATOR 8 BITS      PMN06260
                          STO     DZ945     SAVE FUNCTION INDICATOR     PMN06270
                          RTE     16                                    PMN06280
                          STO     DZ235+1   SAVE ADDR OF THE I/O AREA   PMN06290
                          MDX     DZ230     BR TO CONTINUE              PMN06300
                    DZ060 BSC  L  *-*       BR TO SERVICE THE INTERRUPT PMN06310
                    *                                                   PMN06320
                    * START ALL DISK OPERATIONS                         PMN06330
                    *                                                   PMN06340
                    DZ070 STX   1 DZ180+1   SAVE ADDR OF THE I/O AREA   PMN06350
                          XIO     DZ904     START AN OPERATION          PMN06360
                    *                                                   PMN06370
                    * RETURN TO USER                                    PMN06380
                    *                                                   PMN06390
                    DZ100 LDX  L1 *-*       RESTORE XR1                 PMN06400
                          LDX  L2 *-*       RESTORE XR2                 PMN06410
                          LD      DZ010     INTERRUPT ENTRY         2-6 PMN06420
                          BSC  I  DZ000,+-  NO,MONITOR ENTRY        2-6 PMN06430
                          STO     DZ110+1   YES,INT ENTRY           2-6 PMN06440
                          SRA     16        RESET                   2-6 PMN06450
                          STO     DZ010     *INT ENTRY              2-6 PMN06460
                    DZ110 BSC  L  *-*                               2-6 PMN06470
                          NOP               DUMMY OP                2-6 PMN06480
                    *                                                   PMN06490
                    * SERVICE ALL INTERRUPTS                            PMN06500
                    *                                                   PMN06510
                    DZ180 LDX  L1 *-*       ADDR OF I/O AREA TO XR1     PMN06520
                          LDX  L2 DZ000     ADDR OF DZ000 TO XR2        PMN06530
                          XIO     DZ910     SENSE THE DSW               PMN06540
                          STO     $DDSW     SAVE THE DSW                PMN06550
                          BSC     -         SKIP IF ERROR BIT SET   2-6 PMN06560
                          MDX     DZ060     BRANCH IF ERROR BIT NOT SET PMN06570
                    DZ185 LDD     DZ902     RESTORE WORD COUNT          PMN06580
                          STD   1 0         *AND SECTOR ADDRESS         PMN06590
                          MDX  L  $DBSY,-1  SKIP IF 16 RETRIES DONE     PMN06600
                          MDX     DZ235     BRANCH IF LESS THAN 16      PMN06610
                    *                                                   PMN06620
                    * TRAP OUT TO POSTOPERATIVE TRAP                    PMN06630
                    *                                                   PMN06640
                          LDD     DZ912     1+SCTR ADDR TO EXTENSION    PMN06650
                          LD      DZ915                                 PMN06660
                    DZ190 BSI   2 $PST2-X2  BR TO POSTOPERATIVE ER TRAP PMN06670
                          MDX     DZ232     RETRY OPERATION         2-6 PMN06680
                    *                                                   PMN06690
                    * CONSTANTS AND WORK AREAS                          PMN06700
                    *                                                   PMN06710
                          BSS  E  0                                     PMN06720
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       PMN06730
                    DZ900 DC      1    CONSTANT,READ-AFTER-SEEK WD CNT  PMN06740
                    DZ901 DC      0    CURRENT ARM POSITION             PMN06750
                    DZ902 DC      *-*  LAST TWO WORDS OF SECTOR         PMN06760
                          DC      *-*  *PREVIOUSLY READ                 PMN06770
                    DZ904 DC      *-*  IOCC FOR OPERATION CURRENTLY     PMN06780
                    DZ905 DC      *-*  *BEING PERFORMED                 PMN06790
                    DZ906 DC      *-*  SAVE AREA FOR IOCC FOR           PMN06800
                    DZ907 DC      *-*  *USER-REQUESTED OPERATION        PMN06810
                    DZ908 DC      DZ900 IOCC FOR READ                   PMN06820
                    DZ909 DC      *-*  *AFTER SEEK                      PMN06830
                    DZ910 DC      *-*  2ND WORD OF SEEK IOCC            PMN06840
                    DZ911 DC      *-*  SENSE IOCC                       PMN06850
                    DZ912 DC      *-*  INTERMEDIATE WORD COUNT          PMN06860
                    DZ913 DC      *-*  ADDR OF NEXT SEQUENTIAL SECTOR   PMN06870
                    DZ914 DC      /5002 WRITE SELECT/POWER UNSAFE INDR  PMN06880
                    DZ915 DC      /5004 READ/WRITE/SEEK ERROR INDICATOR PMN06890
                    DZ916 DC      -320 TO BE USED TO SIMULTANEOUSLY     PMN06900
                          DC      1    *DECR WD CNT, INCR SCTR ADDR     PMN06910
                    DZ920 DC      /0080 READ CHECK BIT FOR IOCC         PMN06920
                    DZ925 DC      /0600 2ND WD OF READ IOCC W/O AREA CD PMN06930
                    DZ930 DC      8    NO. SECTORS PER CYLINDER         PMN06940
                    DZ935 DC      /5000 NOT READY DISPLAY CODE          PMN06950
                    DZ940 DC      /0FF8 'AND' OUT DR CODE, SCTR ADDR    PMN06960
                    DZ945 DC      *-*  FUNC INDICATOR (0=READ,1=WRITE)  PMN06970
                    DZ950 DC      /0701 SENSE IOCC W/O AREA CODE        PMN06980
                    DZ955 DC      /0007 'AND' OUT ALL BUT SCTR NO.      PMN06990
                    DZ960 DC      $DCYL-$CYLN BASE DEFECTIVE CYL ADDR   PMN07000
                    DZ965 DC      $ACDE BASE AREA CODE ADDR             PMN07010
                    DZ970 DC      $CYLN-$ACDE BASE ARM POSITION ADDR    PMN07020
                    DZ975 DC      *-*  2ND WORD OF READ CHECK IOCC      PMN07030
                    DZ980 DC      /0400 2ND WD OF SEEK IOCC W/O AREA CD PMN07040
                    DZ985 DC      321  NO. WORDS PER SECTOR (W/ ADDR)   PMN07050
                    DZ990 DC      *-*  CURRENT SECTOR NO.               PMN07060
                    DZ995 DC      -1   MASK FOR COMPLEMENTING           PMN07070
                    *                                                   PMN07080
                    * RESERVED FOR SAVING CORE ON A DUMP ENTRY TO SKEL  PMN07090
                    *                                                   PMN07100
                          BSS     2    THIS AREA MUST BE AT $CIBA+319   PMN07110
                    X2    EQU     DZ000                                 PMN07120
                    *                                                   PMN07130
                    *                                                   PMN07140
                    *                                                   PMN07150
                    DZ210 SRA     16                                    PMN07160
                          STO     $DBSY     CLEAR BUSY INDICATOR        PMN07170
                          MDX  L  $IOCT,-1  DECREMENT IOCS COUNTER      PMN07180
                          NOP                                           PMN07190
                          MDX     DZ100     TO EXIT                     PMN07200
                    *                                                   PMN07210
                    * PREPARE TO TRAP OUT ON 'POWER UNSAFE' CONDITION   PMN07220
                    *                                                   PMN07230
                    DZ215 LDD     DZ902     RESTORE WORD COUNT      2-6 PMN07240
                          STD   1 0         *AND SECTOR ADDRES      2-6 PMN07250
                          LD      DZ914                                 PMN07260
                          MDX     DZ190     BR TO TPAP OUT              PMN07270
                    *                                                   PMN07280
                    * PREPARE TO TRAP OUT ON 'NOT READY' CONDITION      PMN07290
                    *                                                   PMN07300
                    DZ220 LD      DZ935     FETCH ERROR CODE            PMN07310
                          BSI  L  $PRET     BR TO PREOPERATIVE ERR TRAP PMN07320
                          MDX     DZ340     RETRY THE OPERATION         PMN07330
                    *                                                   PMN07340
                    *                       STATEMENTS MOVED        2-1 PMN07350
                    *                                                   PMN07360
                    DZ230 MDX  L  $IOCT,1   INCREMENT IOCS COUNTER      PMN07370
                    DZ232 LDX   2 @TCNT     TURN BUSY INDICATOR ON 2-10 PMN07380
                          STX   2 $DBSY     *                       2-6 PMN07390
                    DZ235 LDX  L1 *-*       ADDR I/O AREA TO XR1        PMN07400
                          LDD   1 0                                     PMN07410
                          STD     DZ902     SAVE WORD COUNT, SCTR ADDR  PMN07420
                          STD     DZ912                                 PMN07430
                    DZ240 SRA     16                                    PMN07440
                          SLT     4         DRIVE CODE IN BITS 12-15    PMN07450
                          STO     DZ280+1                               PMN07460
                          A       DZ965     COMPUTE AND STORE THE       PMN07470
                          STO     DZ330+1   *ADDR OF THE AREA CODE      PMN07480
                          A       DZ970     COMPUTE AND STORE THE       PMN07490
                          STO     DZ350+1   *ADDR OF THE ARM POSITION   PMN07500
                          A       DZ960     ADD IN BASE DT ADDR         PMN07510
                          A       DZ280+1   ADD IN THE DRIVE            PMN07520
                          A       DZ280+1   *CODE TWICE MORE            PMN07530
                          STO     DZ280+1                               PMN07540
                          LDX   2 -3        INITIALIZE COUNTER FOR LOOP PMN07550
                          STX   1 DZ906                                 PMN07560
                          LD    1 1         FETCH DESIRED SECTOR ADDR   PMN07570
                          AND     DZ940     'AND' OUT SECTOR NO.        PMN07580
                    DZ250 STO   1 1         *AND DRIVE CODE             PMN07590
                    DZ280 S    L  *-*       SUB DEFECTIVE CYLINDER ADDR PMN07600
                          BSC     Z+        SKIP IF BAD CYLINDER        PMN07610
                          MDX     DZ300     BR TO CONTINUE PROCESSING   PMN07620
                          LD    1 1                                     PMN07630
                          A       DZ930     INCREMENT SCTR ADDR BY 8    PMN07640
                          MDX  L  DZ280+1,1 POINT TO NEXT DEFECTIVE CYL PMN07650
                          MDX   2 1         SKIP AFTER 3RD PASS         PMN07660
                          MDX     DZ250     COMPARE W/ NEXT DEF CYL ADR PMN07670
                          STO   1 1         SCTR ADDR WITH 3 DEF CYL2-4 PMN07680
                    *                                                   PMN07690
                    * CONSTRUCT THE 2ND WORD OF ALL IOCC'S              PMN07700
                    *                                                   PMN07710
                    DZ300 LDX  L2 DZ000     ADDR OF DZ000 TO XR2        PMN07720
                          LD    2 DZ913-X2  FETCH SECTOR ADDRESS        PMN07730
                          AND   2 DZ955-X2  'AND' OUT ALL BUT SECTOR NO PMN07740
                          STO   2 DZ990-X2  SAVE SECTOR NO.             PMN07750
                    DZ330 LD   L  *-*       FETCH AREA CODE             PMN07760
                          OR    2 DZ980-X2  'OR' IN SEEK FUNCTION CODE  PMN07770
                          STO   2 DZ910-X2  SEEK IOCC MINUS DIRECTION   PMN07780
                          OR    2 DZ925-X2  'OR' IN READ FUNCTION CODE  PMN07790
                          STO   2 DZ909-X2  IOCC FOR READ-AFTER-SEEK    PMN07800
                          OR    2 DZ990-X2  'OR' IN SECTOR NO.          PMN07810
                          S     2 DZ945-X2  COMPLETE READ/WRITE CODE    PMN07820
                          STO   2 DZ907-X2  2ND WD OF READ/WRITE IOCC   PMN07830
                          OR    2 DZ920-X2  'OR' IN READ CHECK BIT      PMN07840
                          A     2 DZ945-X2                              PMN07850
                          STO   2 DZ975-X2  2ND WD OF READ CHECK IOCC   PMN07860
                          OR    2 DZ950-X2  'OR' IN SENSE IOCC BITS     PMN07870
                          STO   2 DZ911-X2  COMPLETED SENSE IOCC        PMN07880
                          LDD   2 DZ912-X2  1+SCTR ADDR TO EXTENSION    PMN07890
                    DZ340 XIO   2 DZ910-X2  SENSE FOR DISK READY        PMN07900
                          STO   2 $DDSW-X2  SAVE THE DSW                PMN07910
                          BSC     Z+        SKIP UNLESS POWER UNSAFE OR PMN07920
                          MDX     DZ215     *WRITE SELECT, BR OTHERWISE PMN07930
                          SLA     2         BR TO PREOPERATIVE ERR TRAP PMN07940
                          BSC     Z+        *IF DISK NOT READY, SKIP    PMN07950
                          MDX     DZ220     *OTHERWISE                  PMN07960
                    *                       STATEMENTS REMOVED      2-1 PMN07970
                          SLA     2         CHECK FOR ARM AT HOME  2-11 PMN07980
                          BSC     +Z        SKIP IF NOT HOME       2-11 PMN07990
                          MDX     DZ390+1   BR TO VERIFY ARM AT HOM2-11 PMN08000
                    *                                              2-11 PMN08010
                    *                       3 INSTRUCTIONS REMOVED 2-11 PMN08020
                    *                                              2-11 PMN08025
                          LD    1 1         FETCH DESIRED CYLINDER ADDR PMN08030
                    DZ350 S    L  *-*       SUBTRACT ARM POSITION       PMN08040
                          BSC     +-        SKIP IF SEEK NECESSARY      PMN08050
                          MDX     DZ400     BRANCH TO PERFORM OPERATION PMN08060
                    *                                                   PMN08070
                    * SEEK                                              PMN08080
                    *                                                   PMN08090
                          SRT     19        PUT NO. CYLINDERS IN EXT    PMN08100
                          SRA     15        + OR - SIGN TO BIT 15       PMN08110
                          SLA     2         SHIFT SIGN TO BIT 13        PMN08120
                          OR    2 DZ910-X2  "OR" IN REMAINDER OF IOCC   PMN08130
                          RTE     16                                    PMN08140
                          BSC     -         SKIP IF SEEK TOWARD HOME    PMN08150
                          MDX     DZ380     BRANCH IF SEEK TOWARD CENTR PMN08160
                          EOR   2 DZ995-X2  COMPLEMENT NO. CYLS TO BE   PMN08170
                          A     2 DZ900-X2  *SOUGHT TO GET POSITIVE NO. PMN08180
                    DZ380 STD   2 DZ904-X2                              PMN08190
                    DZ390 BSI   2 DZ070-1-X2 START SEEK             2-1 PMN08200
                    *                                                   PMN08210
                    * SEEK COMPLETE INTERRUPT PROCESSING                PMN08220
                    *                                                   PMN08230
                          LDD   2 DZ908-X2  SET UP IOCC FOR             PMN08240
                          STD   2 DZ904-X2  *READ AFTER SEEK            PMN08250
                          BSI   2 DZ070-1-X2 START READ-AFTER-SEEK      PMN08260
                    *                                                   PMN08270
                    * READ-AFTER-SEEK COMPLETE INTERRUPT PROCESSING     PMN08280
                    *                                                   PMN08290
                          LD    2 DZ901-X2  FETCH ADR OF SCTR JUST READ PMN08300
                          STO  I  DZ350+1   UPDATE ARM POSITION         PMN08310
                          S     1 1         SUB DESIRED SCTR ADDR       PMN08320
                          BSC  L  DZ400,+-  BR IF SEEK SUCCESSFUL  2-11 PMN08330
                          MDX  L  $DBSY,-1  SKIP IF NO MORE RETRIES2-11 PMN08332
                          MDX     DZ350-1   BR TO CALC NEW SEEK    2-11 PMN08334
                          MDX  L  $DBSY,1   PREVENT A MINUS $DBSY  2-11 PMN08336
                          BSC  L  DZ185     BR TO TRAP OUT         2-11 PMN08338
                    *                                                   PMN08340
                    *                                                   PMN08350
                    * READ/WRITE                                        PMN08360
                    *                                                   PMN08370
                    DZ400 LDD   2 DZ912-X2  FETCH INTERMEDIATE WD CNT   PMN08380
                          BSC     +         SKIP, WD CNT NOT EXHAUSTED  PMN08390
                          MDX     DZ410     BR IF WD CNT EXHAUSTED 2-11 PMN08400
                          AD    2 DZ916-X2  DECREMENT WORD COUNT AND    PMN08410
                          STD   2 DZ912-X2  *INCREMENT SECTOR ADDRESS   PMN08420
                          BSC     Z-        SKIP IF THIS IS LAST SECTOR PMN08430
                          SRA     16        CLEAR ACCUMULATOR           PMN08440
                          A     2 DZ985-X2  ADD BACK 321 TO WD CNT      PMN08450
                          STO   1 0         STORE RESULT IN I/O AREA    PMN08460
                          LDD   2 DZ906-X2  RESTORE IOCC FOR ORIGINALLY PMN08470
                          STD   2 DZ904-X2  *REQUESTED OPERATION        PMN08480
                          LD    1 1         ADD SECTOR NO. TO SECTOR    PMN08490
                          OR    2 DZ990-X2  *ADDRESS                    PMN08500
                          STO   1 1                                     PMN08510
                          BSI   2 DZ070-1-X2 START READ/WRITE OPERATION PMN08520
                    *                                                   PMN08530
                    * READ/WRITE COMPLETE INTERRUPT PROCESSING          PMN08540
                    *                                                   PMN08550
                          LD    2 DZ975-X2  SET UP FOR READ CHECK       PMN08560
                          STO   2 DZ905-X2                              PMN08570
                          LD    2 DZ945-X2  FETCH FUNCTION INDICATOR    PMN08580
                          BSC     Z         SKIP IF READ REQUESTED      PMN08590
                          BSI   2 DZ070-1-X2 START READ CHECK OPERATION PMN08600
                    DZ410 LDD   2 DZ902-X2  RESTORE LST 2 WDS, SEC-2-11 PMN08610
                          STD   1 0         *TOR PREVIOUSLY READ        PMN08620
                          LD    2 DZ912-X2  FETCH INTERMEDIATE WD CNT   PMN08630
                    * SHORT BSC AND MDX CHANGED TO FOLLOWING BSC L 2-11 PMN08640
                          BSC  L  DZ210,+   BR IF WD CNT EXHAUSTED 2-11 PMN08650
                          MDX  L1 320       POINT XR1 TO NEW I/O AREA   PMN08660
                          LDD   1 0         SAVE LAST 2 WDS OF SECTOR   PMN08670
                          STD   2 DZ902-X2  *JUST READ/WRITTEN          PMN08680
                          LDD   2 DZ912-X2  WD CNT, SCTR ADDR NEXT OP   PMN08690
                          STD   1 0         STORE BOTH IN NEW I/O AREA  PMN08700
                          MDX     DZ240     BACK TO SET UP NEXT OPERATN PMN08710
                    *                                                   PMN08720
                    *                                                   PMN08730
                    $ZEND EQU     /01E0     1 + END OF DISKZ       2-11 PMN08735
                          BSS     $ZEND-*-6  PATCH AREA            2-11 PMN08740
                    *                                                   PMN08750
                    *                                                   PMN08760
                          DC      @CIL1     ID NO. OF CORE IMAGE LDR,P1 PMN08770
                    $CIDN DC      *-*       CORE ADDR/CID NO.           PMN08780
                          DC      *-*       WORD COUNT                  PMN08790
                          DC      *-*       SCTR ADDR                   PMN08800
                          BSS     2         WD CNT, SCTR ADDR CORE LDS  PMN08810
                    *                       $ZEND EQUATE MOVED     2-11 PMN08820
                          HDNG    EQUIVALENCES                          PMN08830
                    *                                                   PMN08840
                    * EQUIVALENCES FOR DCOM PARAMETERS                  PMN08850
                    *                                                   PMN08860
                    #NAME EQU     4    NAME OF PROGRAM/CORE LOAD        PMN08870
                    #DBCT EQU     6    BLOCK CT OF PROGRAM/CORE LOAD    PMN08880
                    #FCNT EQU     7    FILES SWITCH                     PMN08890
                    #SYSC EQU     8    SYSTEM/NON-SYSTEM CARTRIDGE INDR PMN08900
                    #JBSW EQU     9    JOBT SWITCH                      PMN08910
                    #CBSW EQU     10   CLB-RETURN SWITCH                PMN08920
                    #LCNT EQU     11   NO. OF LOCALS                    PMN08930
                    #MPSW EQU     12   CORE MAP SWITCH                  PMN08940
                    #MDF1 EQU     13   NO. DUP CTRL RECORDS (MODIF)     PMN08950
                    #MDF2 EQU     14   ADDR OF MODIF BUFFER             PMN08960
                    #NCNT EQU     15   NO. OF NOCALS                    PMN08970
                    #ENTY EQU     16   RLTV ENTRY ADDR OF PROGRAM       PMN08980
                    #RP67 EQU     17   1442-5 SWITCH                    PMN08990
                    #TODR EQU     18   OBJECT WORK STORAGE DRIVE CODE   PMN09000
                    #FHOL EQU     20   ADDR LARGEST HOLE IN FIXED AREA  PMN09010
                    #FSZE EQU     21   BLK CNT LARGEST HOLE IN FXA      PMN09020
                    #UHOL EQU     22   ADDR LAST HOLE IN USER AREA 2-10 PMN09030
                    #USZE EQU     23   BLK CNT LAST HOLE IN UA     2-10 PMN09040
                    #DCSW EQU     24   DUP CALL SWITCH                  PMN09050
                    #PIOD EQU     25   PRINCIPAL I/O DEVICE INDICATOR   PMN09060
                    #PPTR EQU     26   PRINCIPAL PRINT DEVICE INDICATOR PMN09070
                    #CIAD EQU     27   RLTV ADDR IN @STRT OF CIL ADDR   PMN09080
                    #ACIN EQU     28   AVAILABLE CARTRIDGE INDICATOR    PMN09090
                    #GRPH EQU     29   2250 INDICATOR               2G2 PMN09100
                    #GCNT EQU     30   NO. G2250 RECORDS            2G2 PMN09110
                    #LOSW EQU     31   LOCAL-CALLS-LOCAL SWITCH     2-2 PMN09120
                    #X3SW EQU     32   SPECIAL ILS SWITCH           2-2 PMN09130
                    #ECNT EQU     33   NO. OF *EQUAT RCDS           2-4 PMN09140
                    #ANDU EQU     35   1+BLK ADDR END OF UA (ADJUSTED)  PMN09150
                    #BNDU EQU     40   1+BLK ADDR END OF UA (BASE)      PMN09160
                    #FPAD EQU     45   FILE PROTECT ADDR                PMN09170
                    #PCID EQU     50   CARTRIDGE ID, PHYSICAL DRIVE     PMN09180
                    #CIDN EQU     55   CARTRIDGE ID, LOGICAL DRIVE      PMN09190
                    #CIBA EQU     60   SCTR ADDR OF CIB                 PMN09200
                    #SCRA EQU     65   SCTR ADDR OF SCRA                PMN09210
                    #FMAT EQU     70   FORMAT OF PROG IN WORKING STG    PMN09220
                    #FLET EQU     75   SCTR ADDR 1ST SCTR OF FLET       PMN09230
                    #ULET EQU     80   SCTR ADDR 1ST SCTR OF LET        PMN09240
                    #WSCT EQU     85   BLK CNT OF PROG IN WORKING STG   PMN09250
                    #CSHN EQU     90   NO. SCTRS IN CUSHION AREA        PMN09260
                    *                                                   PMN09270
                    * EQUIVALENCES FOR PHASE ID NUMBERS                 PMN09280
                    *                                                   PMN09290
                    @MCRA EQU     110       PHASE ID FOR MCRA           PMN09300
                    @SUP6 EQU     115       PHASE ID FOR DUMP PROG 2-10 PMN09310
                    @SUP7 EQU     116       PHASE ID FOR AUX SUPV  2-10 PMN09320
                    @CLB0 EQU     120       PHASE ID FOR CLB, PHASE 0/1 PMN09330
                    @1403 EQU     140       PHASE ID FOR SYS 1403 SUBR  PMN09340
                    @1132 EQU     141       PHASE ID FOR SYS 1132 SUBR  PMN09350
                    @CPTR EQU     142       PHASE ID FOR SYS CP SUBR    PMN09360
                    @2501 EQU     143       PHASE ID FOR SYS 2501 SUBR  PMN09370
                    @1442 EQU     144       PHASE ID FOR SYS 1442 SUBR  PMN09380
                    @1134 EQU     145       PHASE ID FOR SYS 1134 SUBR  PMN09390
                    @KBCP EQU     146       PHASE ID FOR SYS KB/CP SUBR PMN09400
                    @CDCV EQU     147       PHASE ID FOR SYS CD   CONV  PMN09410
                    @PTCV EQU     148       PHASE ID FOR SYS 1134 CONV  PMN09420
                    @KBCV EQU     149       PHASE ID FOR SYS KB   CONV  PMN09430
                    @DZID EQU     150       PHASE ID FOR DISKZ          PMN09440
                    @D1ID EQU     151       PHASE ID FOR DISKI          PMN09450
                    @DNID EQU     152       PHASE ID FOR DISKN          PMN09460
                    @CIL1 EQU     160       PHASE ID FOR CI LOADER,PH 1 PMN09470
                    @CIL2 EQU     161       PHASE ID FOR CI LOADER,PH 2 PMN09480
                    *                                                   PMN09490
                    * EQUIVALENCES FOR RESIDENT MONITOR                 PMN09500
                    *                                                   PMN09510
                    $LKNM EQU     $HASH     SAVE AREA FOR NAME OF LINK  PMN09520
                    $RMSW EQU     $HASH+2   EXIT-LINK-DUMP SW(-1,0,+1)  PMN09530
                    $CXR1 EQU     $HASH+3   SAVE AREA FOR XR1           PMN09540
                    $CLSW EQU     $HASH+4   SW FOR CORE IMAGE LDR,PH 2  PMN09550
                    $DMPF EQU     $HASH+5   DUMP FORMAT CODE            PMN09560
                    $ACEX EQU     $HASH+6   ACC AND EXT WHEN ENTER DUMP PMN09570
                    $CILA EQU     $S150+1   ADDR OF END OF DK I/O - 3   PMN09580
                    $IBT2 EQU     $I205+1   ADR OF SERVICE PART OF DKIO PMN09590
                    $IBT4 EQU     $I405+1   ADDR OF THE IBT             PMN09600
                    $SNLT EQU     $DBSY+1   SENSE LIGHT INDICATOR       PMN09610
                    $PAUS EQU     DZ000-2   PAUSE,INTERRUPT INDICATOR   PMN09620
                    $RWCZ EQU     DZ000-1   READ/WRITE SWITCH (CARDZ)   PMN09630
                    $XR3X EQU     $I496     XR3 SETTING DURING XEQ  2-2 PMN09640
                    *                                                   PMN09650
                    * EQUIVALENCES FOR ABSOLUTE SECTOR ADDRESSES        PMN09660
                    *                                                   PMN09670
                    @IDAD EQU     0    ADDR OF SCTR WITH ID,DEF CYL ADR PMN09680
                    @DCOM EQU     1    ADDR OF SCTR CONTAINING DCOM     PMN09690
                    @RIAD EQU     2    ADDROOF SCTR CONTAINING RES IMGE PMN09700
                    @SLET EQU     3    ADDR OF SCTR CONTAINING SLET     PMN09710
                    @RTBL EQU     6    ADDR OF SCTR CONTAINING RELD TBL PMN09720
                    @HDNG EQU     7    ADDR OF SCTR CONTAINING PAGE HDR PMN09730
                    @STRT EQU     0    ADDR OF SCTR W/ COLD START PROG  PMN09740
                    *                                                   PMN09750
                    * EQUIVALENCES FOR THE CORE IMAGE HEADER            PMN09760
                    *                                                   PMN09770
                    @XEQA EQU     0    RLTV ADDR OF CORE LOAD EXEC ADDR PMN09780
                    @CMON EQU     1    RLTV ADDR OF WD CNT OF COMMON    PMN09790
                    @DREQ EQU     2    RLTV ADDR OF DISK I/O INDICATOR  PMN09800
                    @FILE EQU     3    RLTV ADDR OF NO. FILES DEFINED   PMN09810
                    @HWCT EQU     4    RLTV ADDR OF WD CNT OF CI HEADER PMN09820
                    @LSCT EQU     5    SCTR CNT OF FILES IN WK STORAGE  PMN09830
                    @LDAD EQU     6    RLTV ADDR OF LOAD ADDR CORE LOAD PMN09840
                    @XCTL EQU     7    RLTV ADDR DISK1/DISKN EXIT CTRL  PMN09850
                    @TVWC EQU     8    RLTV ADDR OF WD CNT OF TV        PMN09860
                    @WCNT EQU     9    RLTV ADDR OF WD CNT OF CORE LOAD PMN09870
                    @XR3X EQU     10   RLTV ADDR OF EXEC SETTING OF XR3 PMN09880
                    @ITVX EQU     11   RLTV ADDR OF 1ST WD OF ITV       PMN09890
                    @ILS4 EQU     17   RLTV ADDR OF 1ST WD OF IBT4      PMN09900
                    @OVSW EQU     26   RLTV ADDR OF LOCAL/SOCAL SWITCH  PMN09910
                    @CORE EQU     27   CORE SIZE OF BUILDING SYST  2-10 PMN09920
                    @HEND EQU     29   RLTV ADDR OF LAST WD OF CI HDR   PMN09930
                    *                                                   PMN09940
                    * EQUIVALENCES FOR LET/FLET                         PMN09950
                    *                                                   PMN09960
                    @LFHD EQU     5    WORD COUNT OF LET/FLET HEADER    PMN09970
                    @LFEN EQU     3    NO OF WDS PER LET/FLET ENTRY     PMN09980
                    @SCTN EQU     0    RLTY ADDR OF LET/FLET SCTR NO.   PMN09990
                    @UAFX EQU     1    RLTV ADDR OF SCTR ADDR OF UA/FXA PMN10000
                    @WDSA EQU     3    RLTV ADDR OF WDS AVAIL IN SCTR   PMN10010
                    @NEXT EQU     4    RLTV ADDR OF ADDR NEXT SCTR      PMN10020
                    @LFNM EQU     0    RLTV ADDR OF LET/FLET ENTRY NAME PMN10030
                    @BLCT EQU     2    RLTV ADDR OF LET/FLET ENTRY DBCT PMN10040
                    *                                                   PMN10050
                    * MISCELLANEOUS EQUIVALENCES                        PMN10060
                    *                                                   PMN10070
                    @ISTV EQU     51   ISS NO. ADJUSTMENT FACTOR    2-1 PMN10080
                    @MXDR EQU     5    MAX NO. DRIVES SUPPORTED         PMN10090
                    @COMZ EQU     896  LOW COMMON LIMIT FOR DISKZ       PMN10100
                    @COM1 EQU     1216 LOW COMMON LIMIT FOR DISK1       PMN10110
                    @COM2 EQU     1536 LOW COMMON LIMIT OF DISKN        PMN10120
                    @TCNT EQU     17   NO. TRIES BEFORE DISK ERROR      PMN10130
                    @DKEP EQU     DZ000+7 LIBF ENTRY TO DISK1/N         PMN10140
                    @DKIP EQU     DZ000+5 DISK I/O INTERRUPT ENTRY PT   PMN10150
                    @SCIB EQU     16   CIB SECTOR COUNT             2-2 PMN10160
                    @HCIB EQU     3    HIGH COMMON SECTOR COUNT     2-2 PMN10170
                    @MCOR EQU     4096       SIZE OF MINIMUM CORE   2-2 PMN10180
                    Y     EQU     127                                   PMN10190
                    *                                                   PMN10200
                    @CIDN EQU     4    RLTV ADDR CARTRIDGE ID       2-2 PMN10210
                    @COPY EQU     5    RLTV ADDR COPY INDICATOR     2-2 PMN10220
                    @DCTB EQU     1    RLTV ADDR DEFECTIV CYL TBL   2-2 PMN10230
                    @DTYP EQU     8    RLTV ADDR DISK TYPE INDR     2-2 PMN10240
                          HDNG    COLD START PROGRAM                    PMN10250
                    *************************************************** PMN10260
                    *                                                 * PMN10270
                    *STATUS - VERSION 2, MODIFICATION 11              * PMN10280
                    *                                                 * PMN10290
                    *FUNCTION/OPERATION -                             * PMN10300
                    *   THIS PROGRAM IS READ INTO CORE FROM SECTOR 0  * PMN10310
                    *   OF THE SYSTEM CARTRIDGE AND TRANSFERRED TO BY * PMN10320
                    *   THE COLD START CARD.  DEFECTIVE CYLINDER      * PMN10330
                    *   ADDRESSES, CARTRIDGE ID AND DISKZ ARE ALSO ON * PMN10340
                    *   SECTOR 0 AND ARE READ IN AT THE SAME TIME.    * PMN10350
                    *   ALL THAT REMAINS FOR THE COLD START PROGRAM IS* PMN10360
                    *   TO READ IN THE RESIDENT IMAGE, SAVE THE       * PMN10370
                    *   CARTRIDGE ID AND TRANSFER TO THE AUXILIARY    * PMN10380
                    *   SUPERVISOR THROUGH $DUMP IN THE RESIDENT      * PMN10390
                    *   MONITOR.                                      * PMN10400
                    *                                                 * PMN10410
                    *ENTRY - CR010-2                                  * PMN10420
                    *   ENTER PROGRAM BY TRANSFER FROM COLD START CARD* PMN10430
                    *                                                 * PMN10440
                    *INPUT -                                          * PMN10450
                    *   THE CARTRIDGE ID OF LOGICAL DRIVE ZERO (THE   * PMN10460
                    *   SYSTEM CARTRIDGE) IS READ IN FROM SECTOR 0    * PMN10470
                    *   WITH THE COLD START PROGRAM.                  * PMN10480
                    *                                                 * PMN10490
                    *OUTPUT -                                         * PMN10500
                    *   * THE RESIDENT IMAGE IS READ INTO CORE FROM   * PMN10510
                    *     THE DISK.                                   * PMN10520
                    *   * IN COMMA-                                   * PMN10530
                    *     $ACDE                                       * PMN10540
                    *     $CIBA-1                                     * PMN10550
                    *     $CIDN                                       * PMN10560
                    *     $CYLN                                       * PMN10570
                    *     $DBSY                                       * PMN10580
                    *     $IOCT                                       * PMN10590
                    *                                                 * PMN10600
                    *EXTERNAL REFERENCES -                            * PMN10610
                    *   DZ000  SUBROUTINE TO PERFORM DISK I/O.        * PMN10620
                    *                                                 * PMN10630
                    *EXITS -                                          * PMN10640
                    *   THE ONLY EXIT IS TO THE AUXILIARY SUPERVISOR  * PMN10650
                    *   AS FOLLOWS-                                   * PMN10660
                    *     BSI     $DUMP                               * PMN10670
                    *     DC      -1                                  * PMN10680
                    *                                                 * PMN10690
                    *TABLES/WORK AREAS - N/A                          * PMN10700
                    *                                                 * PMN10710
                    *ATTRIBUTES -                                     * PMN10720
                    *   THIS PROGRAM IS NOT NATURALLY RELOCATABLE.    * PMN10730
                    *                                                 * PMN10740
                    *NOTES -                                          * PMN10750
                    *   DISK ERRORS RESULT IN A WAIT AT $PST2.        * PMN10760
                    *************************************************** PMN10770
                          HDNG    COLD START PROGRAM                    PMN10780
                    *                                                   PMN10790
                    * READ THE RESIDENT IMAGE INTO CORE                 PMN10800
                    *                                                   PMN10810
                          LDX   1 Y                                     PMN10820
                          LDD     CR920     SET UP WORD COUNT AND SCTR  PMN10830
                    CR010 STD  L  $CIBA-1   *ADDR OF RESIDENT IMAGE     PMN10840
                          STO   1 $DCYL-Y   *INITIALIZE DEF CYL NO. 1   PMN10850
                          LD    1 3-Y       FETCH LOG DRIVE 0 AREA CODE PMN10860
                          STO   1 $ACDE-Y   *AND STORE IT IN COMMA      PMN10870
                          STO     CR920+1   SAVE THE AREA CODE          PMN10880
                          LD    1 DZ000-2-27-Y FETCH AND SAVE THE       PMN10890
                          STO     $CIDN     *CARTRIDGE ID               PMN10900
                          LDX  L2 CR020     SET UP TEMPORARY       2-11 PMN10902
                          STX  L2 $LEV2     *ILS02                 2-11 PMN10904
                          LD      CR010+1   FETCH CORE ADDR OF RESIDENT PMN10910
                          SRT     16        *IMAGE AND PUT IN EXTENSION PMN10920
                          STO   1 $DBSY-Y   CLEAR DISK BUSY INDICATOR   PMN10930
                          STO   1 $CYLN-Y   INITIALIZE ARM POSITION     PMN10940
                          BSI   1 DZ000-Y   FETCH RESIDENT IMAGE        PMN10950
                          WAIT              WAIT OUT THE INTERRUPT      PMN10960
                    *                                                   PMN10970
                    * INITIALIZE ITEMS IN COMMA                         PMN10980
                    *                                                   PMN10990
                          SRA     16                                    PMN11000
                          STO   1 $IOCT-Y   CLEAR IOCS COUNTER          PMN11010
                          LDD     CR910                                 PMN11020
                          STD   1 $CIBA-1-Y *FOR SAVING CORE ON THE CIB PMN11030
                          LD      CR920+1   FETCH AREA CODE             PMN11040
                          STO   1 $ACDE-Y   RESET AREA CODE             PMN11050
                          LD      CR905     INITIALIZE WD ZERO TO       PMN11060
                          STO   1 0-Y       *AN 'MDX   *-1' LOOP        PMN11070
                    *                                                   PMN11080
                    * TRANSFER TO THE AUXILIARY SUPERVISOR              PMN11090
                    * TO COMPLETE INITIALIZATION                        PMN11100
                    *                                                   PMN11110
                          BSI   1 $DUMP-Y   BR TO AUXILLIARY SUPERVISOR PMN11120
                          DC      -1        *FOR JOB PROCESSING         PMN11130
                    *                                                   PMN11140
                    CR020 DC      *-*                              2-11 PMN11142
                          BSI   1 DZ010-Y   BR TO SERVICE INTERRUPT2-11 PMN11144
                          MDX  L  CR020,-1                         2-11 PMN11146
                          BOSC I  CR020     RETURN                 2-11 PMN11148
                    *                                                   PMN11160
                    * CONSTANTS AND WORK AREAS                          PMN11170
                    *                                                   PMN11180
                          BSS  E  0         ASSURE EVEN BOUNDARY   2-11 PMN11190
                    CR910 DC      0         WD CNT,SCTR ADDR OF     2-5 PMN11200
                          DC      @HDNG     *HARMLESS WRITE TO DISK     PMN11210
                    CR920 DC      $DBSY-$CH12 WD CNT AND SCTR           PMN11220
                          DC      @RIAD     *ADDR OF RESIDENT IMAGE     PMN11230
                    CR905 MDX     *-1       TO BE PUT AT ADDR 0000 2-11 PMN11231
                          BSS     /0212-*   PATCH AREA             2-11 PMN11232
                          END     *                                     PMN66890
