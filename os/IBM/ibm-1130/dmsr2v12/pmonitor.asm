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
                          HDNG    SYSTEM 1403 SUBROUTINE                PMN11240
                    *************************************************** PMN11250
                    *                                                 * PMN11260
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN11270
                    *                                                 * PMN11280
                    *FUNCTION/OPERATION-                              * PMN11290
                    *     THIS IS A SUBROUTINE USED BY THE 1130       * PMN11300
                    *     MONITOR TO PERFORM THE FOLLOWING FUNCTIONS  * PMN11310
                    *     ON THE 1403 PRINT DEVICE-                   * PMN11320
                    *     *SKIP TO CHANNEL 1.                         * PMN11330
                    *     *PRINT A LINE WITH ONE SPACE.               * PMN11340
                    *     *SPACE IMMEDIATE.                           * PMN11350
                    *                                                 * PMN11360
                    *ENTRY POINTS-                                    * PMN11370
                    *     *PR000+1 IS THE USER ENTRY.                 * PMN11380
                    *     *PR010 IS THE INTERRUPT ENTRY.              * PMN11390
                    *                                                 * PMN11400
                    *INPUT-                                           * PMN11410
                    *     *SKIP TO CHANNEL 1                          * PMN11420
                    *      ACC = 7000                                 * PMN11430
                    *      EXT = ADDRESS OF HEADING I/O AREA          * PMN11440
                    *     *PRINT A LINE WITH ONE SPACE                * PMN11450
                    *      ACC = 7001                                 * PMN11460
                    *      EXT = ADDRESS OF I/O AREA                  * PMN11470
                    *     *SPACE IMMEDIATE                            * PMN11480
                    *      ACC = 7002                                 * PMN11490
                    *      EXT = ANYTHING                             * PMN11500
                    *     **THE I/O AREA CONSISTS OF ONE WORD OF WORD * PMN11510
                    *       COUNT FOLLOWED BY 0-60 WORD OF PACKED     * PMN11520
                    *       EBCDIC CODE.                              * PMN11530
                    *                                                 * PMN11540
                    *OUTPUT-                                          * PMN11550
                    *     THE MESSAGE IN THE I/O AREA IS PRINTED TO   * PMN11560
                    *     THE 1403 PRINTER.                           * PMN11570
                    *                                                 * PMN11580
                    *EXTERNAL REFERENCES                              * PMN11590
                    *     $I403                                       * PMN11600
                    *     $IOCT                                   2-2 * PMN11610
                    *     $PBSY                                       * PMN11620
                    *     $PGCT                                       * PMN11630
                    *     $PRET                                       * PMN11640
                    *     $PST4                                       * PMN11650
                    *                                                 * PMN11660
                    *EXITS- NORMAL                                    * PMN11670
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * PMN11680
                    *      HAS BEEN INITIATED.                        * PMN11690
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * PMN11700
                    *      SUBROUTINE AFTER AN INTERRUPT HAS BEEN     * PMN11710
                    *      SERVICED.                                  * PMN11720
                    *                                                 * PMN11730
                    *EXITS-ERROR                                      * PMN11740
                    *     *EXIT TO $PRET ON PRE-OPERATIVE ERROR.      * PMN11750
                    *     *EXIT TO $PST4 ON POST-OPERATIVE ERROR.     * PMN11760
                    *                                                 * PMN11770
                    *TABLES/WORK AREAS-                               * PMN11780
                    *     PR390 IS A 60-WORD AREA USED TO STORE THE   * PMN11790
                    *     USERS CONVERTED MESSAGE AND TO PRINT IT.  IT* PMN11800
                    *     IS ALSO USED TO PERFORM ONE TIME            * PMN11810
                    *     INITIALIZATIONS THE INSTRUCTIONS OF WHICH   * PMN11820
                    *     ARE WIPED OUT BY THE FIRST LINE MESSAGE.    * PMN11830
                    *                                                 * PMN11840
                    *ATTRIBUTES-                                      * PMN11850
                    *     *NATURALLY RELOCATABLE.                     * PMN11860
                    *     *REUSABLE.                                  * PMN11870
                    *                                                 * PMN11880
                    *NOTES- NONE                                      * PMN11890
                    *                                                 * PMN11900
                    *************************************************** PMN11910
                          HDNG    SYSTEM 1403 SUBROUTINE                PMN11920
                          ORG     0                                     PMN11930
*SBRKDD  8C         *SYS 1403                                     V2M02 PMN11940
                          DC      PR475-PR000+1 WD CNT OF 1403 SUBR 2-9 PMN11950
                          DC      @1403      PHASE ID OF SYS 1403 SUBR  PMN11960
                          HDNG    SYSTEM 1403 SUBROUTINE                PMN11970
                    PR000 BSC  L  *-*        RETURN TO USER             PMN11980
                          MDX     PR130      GO EXECUTE CALL PORTION    PMN11990
                          BSC  L  *-*        RETURN TO ILS ROUTINE      PMN12000
                    PR010 EQU     *-1        INTERRUPT ENTRANCE         PMN12010
                    *                                                   PMN12020
                    *XR2 SET TO 50 IN ORDER TO REFER TO CERTAIN         PMN12030
                    *LOCATIONS IN COMMA--$PBSY,$1403,$PST4--WITH        PMN12040
                    *SHORT INSTRUCTIONS                                 PMN12050
                    *                                                   PMN12060
                          LDX   2 50                                    PMN12070
                          XIO     PR070-1    SENSE WITH RESET           PMN12080
                          STO     PR060                                 PMN12090
                          SLA     3          CHECK FOR CARRIAGE INTRP   PMN12100
                          BSC     -          YES,JUMP                   PMN12110
                          MDX     PR020      NO,CHK.TRANS.COMPL.INTRP   PMN12120
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 PMN12130
                          NOP                IN CASE OF NO SKIP     2-2 PMN12140
                          SRA     16         *YES,TURN OFF PROG.BUSY*   PMN12150
                          STO   2 $PBSY-50   *INDICATOR             *   PMN12160
                    PR020 LD      PR060      CHK FOR                    PMN12170
                          SLA     1          TRANS.COMP.INTRPT          PMN12180
                          BSC     -          YES,GO MAKE PBUSY NEGATIVE PMN12190
                          MDX     PR040      NO,GO CHK FOR CHANNEL 12   PMN12200
                          STO   2 $PBSY-50   I/O AREA FREE TO CHANGE    PMN12210
                    PR030 XIO     PR100      *TEST FOR*                 PMN12220
                          BSC     E          *PRINTER *                 PMN12230
                          MDX     PR050      *READY   *                 PMN12240
                          XIO     PR090      INITIATE SPACE             PMN12250
                    PR040 LD      PR060      * SET CHANNEL 12 *         PMN12260
                          SLA     12         * SWITCH IF      *         PMN12270
                          BSC     -          * CHANNEL 12     *         PMN12280
                          MDX     PR010-1    * INDICATOR      *         PMN12290
                          STO   2 $1403-50   * IS ON.         *         PMN12300
                          MDX     PR010-1    EXIT                       PMN12310
                    PR050 LD      PR100      LOAD NOT READY ERROR CODE  PMN12320
                          BSI   2 $PST4-50   TO POST -OPERATIVE ER TRAP PMN12330
                          MDX     PR030      TRY AGAIN                  PMN12340
                    *                                                   PMN12350
                    *SYSTEM EQUATES                                     PMN12360
                    *                                                   PMN12370
                    *                                                   PMN12380
                          BSS  E  0                                     PMN12390
                    PR060 DC      0          WORD TO SAVE DSW           PMN12400
                    PR070 DC      /AF01      WITH RESET                 PMN12410
                    PR080 DC      *-* PR390  ADDRESS OF OUTPUT AREA     PMN12420
                          DC      /AD00      IOCC FOR PRINT             PMN12430
                    PR090 DC      /0800      USE THIS WD.FOR CHAN SKIP  PMN12440
                          DC      /AC00      IOCC FOR SPACE             PMN12450
                    PR100 DC      /9000      NOT READY ERROR CODE       PMN12460
                    PR110 DC      /AF00      SENSE WITHOUT RESET        PMN12470
                    PR120 DC      /FF00      CON.TO ELIM.RIGHT 8 BITS   PMN12480
                    *                                                   PMN12490
                    *                                                   PMN12500
                    PR130 STO     PR150      STORE FUNCTION CODE        PMN12510
                          STX   1 PR230+1    SAVE XR1                   PMN12520
                          STX   2 PR240+1    SAVE XR2                   PMN12530
                          STX   3 PR250+1    SAVE XR3                   PMN12540
                    *                                                   PMN12550
                    *GO TO EXECUTE ONE TIME INITIALIZATIONS             PMN12560
                    *                                                   PMN12570
                    PR140 MDX     PR490      SWITCH INSTRUCTION         PMN12580
                    *                                                   PMN12590
                          RTE     16         ADDR.OF I/O AREA TO A REG. PMN12600
                          STO     PR190+2    STORE IT IN INSTRUCTION    PMN12610
                          STO     PR290+1    FOR RETURN FROM CHN SKIP   PMN12620
                          STO     *+1        *WORD COUNT*               PMN12630
                          LDX  I3 *-*        *TO XR3    *               PMN12640
                    *                                                   PMN12650
                    PR150 NOP                BR TO PRINT, SKIP OR SPACE PMN12660
                          MDX     PR330      BRANCH TO SKIP SUBROUTINE  PMN12670
                          MDX     PR160      GO TO PRINT A LINE         PMN12680
                          BSI     PR340      IMMEDIATE SPACE            PMN12690
                          STX  L0 $PBSY      SET PROG.BUSY IND          PMN12700
                          XIO     PR090      INIT SPACE AND GO          PMN12710
                          MDX     PR230      RESTORE REGISTERS AND EXIT PMN12720
                    *                                               2-9 PMN12730
                    PR155 LD      PR100     LD NOT READY CODE /9000 2-9 PMN12740
                          BSI   2 $PRET-60  BR TO DISPLAY           2-9 PMN12750
                    *                                                   PMN12760
                    *CHECK IF THE TRANSFER COMPLETE INTERRUPT HAS BEEN  PMN12770
                    *RECEIVED,I.E.,LOOP TILL PBUSY GOES NEGATIVE.THEN   PMN12780
                    *CLEAR THE PRINTER OUTPUT AREA TO BLANKS            PMN12790
                    *                                                   PMN12800
                    PR160 LDX   2 +60        NO. OF WDS. TO CLEAR=60    PMN12810
                    PR165 XIO     PR110-1   SENSE DSW W/O RESET     2-9 PMN12820
                          BSC     E         SKIP IF READY           2-9 PMN12830
                          MDX     PR155     BR TO DISP NOT READY    2-9 PMN12840
                          LD    2 $PBSY-60   LOOP TILL PBUSY IS NEG.OR  PMN12850
                          BSC     Z-         ZERO,MEANS I/O AREA,PR330  PMN12860
                          MDX     PR165      IS FREE TO BE ALTERED      PMN12870
                          LD      PR310      LOAD BLANKS                PMN12880
                    PR170 STO  L2 *-* PR390-1 CLEAR WORD                PMN12890
                          MDX   2 -1         NEXT WORD,ARE WE DONE      PMN12900
                          MDX     PR170      NO,LOOP,YES START CONV     PMN12910
                    *                                                   PMN12920
                    *                                                   PMN12930
                    *PICK UP ONE WORD--2 CHARS-- FROM USERS I/O AREA    PMN12940
                    *CONVERT TO 1403 CODE FROM EBC AND STORE IN         PMN12950
                    *PRINTER OUTPUT AREA                                PMN12960
                    *                                                   PMN12970
                    PR180 LDX   1 0          INITIALIZE RIGHT-LEFT IND- PMN12980
                          LDX  L2 *-* PR460  XR2=TABLE ADDRESS          PMN12990
                    PR190 SLT     32         CLEAR ACC AND EXT          PMN13000
                          LD   L3 *-*        LOAD WORD FROM USER AREA   PMN13010
                          SLA   1            SHIFT 8 OR NO-OP           PMN13020
                          AND     PR120      ELIMINATE RIGHT HALF       PMN13030
                          BSC     -          SPECIAL CHAR.IF NOT NEG.   PMN13040
                          MDX     PR270      GO PROCESS SPECIAL CHAR    PMN13050
                          SLA     2          1ST OR 2ND HALF OF TABLE   PMN13060
                          BSC     C          *UPPER CASE         *      PMN13070
                          MDX     *+1        *CHARACTERS         *      PMN13080
                          MDX     PR270-1    *TREATED AS BLANKS  *      PMN13090
                          BSC     +          1ST HALF REQUIRED,SKIP     PMN13100
                          MDX   2 10         2ND HALF REQUIRED, SET XR2 PMN13110
                          SLA     2          SET CARRY IF RT.HALF TABLE PMN13120
                          SRA     12         MOVE TO RT.HAND SIDE       PMN13130
                          STO     *+1        COMPUTE TABLE INCREMENT    PMN13140
                    PR200 LD   L2 *-*        LOAD 2-1403 CHARACTERS     PMN13150
                          BSC     C          CHK.CARRY FOR RT.OR LEFT   PMN13160
                          SLA     8          ISOLATE AND LEFT JUSTIFY   PMN13170
                          SRA     8          THE CHARACTER REQUIRED     PMN13180
                          SRT     8          SAVE CHARACTER             PMN13190
                          LD      PR200+1    CHK.VALIDITY OF ORIGINAL   PMN13200
                          S       PR260      EBC HALF CHAR.TREAT AS     PMN13210
                          BSC     -          SPECIAL IF GREATER         PMN13220
                          MDX     PR270-1    THAN 9                     PMN13230
                    PR210 SLT     16         BRING BACK CHAR.SAVED      PMN13240
                          SRA   1            CHAR MOVES RT OR STAYS PUT PMN13250
                          MDX   1 0          IS CHAR.RIGHT OR LEFT      PMN13260
                          MDX     PR220      *RIGHT, GO TO WORD         PMN13270
                          STO     PR380      *LEFT, STORE IN TEMP LOC   PMN13280
                          MDX   1 8          SET XR1 FOR RIGHT SIDE     PMN13290
                          MDX     PR190-2    GO PROCESS RIGHT SIDE CHAR PMN13300
                    PR220 OR      PR380      COMBINE RIGHT-LEFT CHARS   PMN13310
                          STO  L3 *-* PR390-1 STORE IN PRINTER I/O AREA PMN13320
                          MDX   3 -1         NEXT WORD,ARE WE FINISHED  PMN13330
                          MDX     PR180      NO,GO PROCESS NEXT WORD.   PMN13340
                    *                                                   PMN13350
                    * CHECK IF PRINTER READY AND NOT BUSY               PMN13360
                    *                                                   PMN13370
                          BSI     PR340      TO PRINTER BUSY ROUTINE    PMN13380
                          STX  L  $PBSY      SET BUSY INDICATOR         PMN13390
                          XIO     PR080      INITIATE PRINT             PMN13400
                    *                                                   PMN13410
                    * RESTORE XR1,2 AND 3                               PMN13420
                    *                                                   PMN13430
                    PR230 LDX  L1 *-*        RESTORE INDEX REGISTER 1   PMN13440
                    PR240 LDX  L2 *-*        RESTORE INDEX REGISTER 2   PMN13450
                    PR250 LDX  L3 *-*        RESTORE INDEX REGISTER 3   PMN13460
                          MDX     PR000      EXIT TO USERS ROUTINE      PMN13470
                    *                                                   PMN13480
                    *                                                   PMN13490
                    *                                                   PMN13500
                    * ROUTINE TO CONVERT SPECIAL CHARATERS              PMN13510
                    *                                                   PMN13520
                          LD      PR310      FORCE BLANK CHARACTER      PMN13530
                    PR270 STO     PR340      STORE CHAR.IN TEMP.LOC.    PMN13540
                          LDX   2 15        XR2 = SPEC. TABLE CNT   212 PMN13550
                    PR280 SLT     32         CLEAR EXTENSION            PMN13560
                          LD   L2 *-* PR460+19 LD.CHAR FROM SPEC.TABLE  PMN13570
                          SRT     8          SAVE 1403 CHAR IN EXT      PMN13580
                          SLA     8          LEFT JUSTIFY EBC CHAR      PMN13590
                          S       PR340      IS IT CHAR.WE WANT         PMN13600
                          BSC     +-         NO,SKIP                    PMN13610
                          MDX     PR210      YES,GO GET 1403 EQUIVALENT PMN13620
                          MDX   2 -1         NEXT WORD IN TABLE         PMN13630
                          MDX     PR280      LOOP                       PMN13640
                          MDX     PR210      NOT IN TABLE,TREAT AS BLK  PMN13650
                    *                                                   PMN13660
                          BSS  E  0                                     PMN13670
                    PR290 DC      /7001      CALLING SEQUENCE  FOR      PMN13680
                          DC      *-*        PRINTING A LINE            PMN13690
                    PR300 DC      *-* PR370  ADDR OF CONTROL WORD       PMN13700
                          DC      /A900      SKIP IOCC                  PMN13710
                    PR310 DC      /7F7F      1403 BLANK CHARACTERS      PMN13720
                    PR320 DC      /4040      EBC BLANK CHAR--ODD LOC    PMN13730
                    PR260 DC      10        CONSTANT                    PMN13740
                    *                                                   PMN13750
                    * SKIP TO CHANNEL 1                                 PMN13760
                    *                                                   PMN13770
                    PR330 BSI     PR340      BR TO CHECK BUSY, READY    PMN13780
                          LDX   2 +4         BIN TO DEC LOOP COUNTER    PMN13790
                          STO   2 $1403-4    CLEAR CHANNEL 12 SWITCH    PMN13800
                          STX  L0 $PBSY      SET PROG.BUSY INDICATOR    PMN13810
                          XIO     PR300      SKIP TO NEW PAGE           PMN13820
                          MDX     PR400      GO PROCESS PAGE NO         PMN13830
                    *                                                   PMN13840
                    * CHECK IF PRINTER IS READY AND CARRIAGE NOT BUSY   PMN13850
                    *                                                   PMN13860
                          BSC  L  *-*        RETURN                     PMN13870
                    PR340 EQU     *-1                                   PMN13880
                          XIO     PR110-1    SENSE WITHOUT RESET        PMN13890
                          BSC     E          TEST FOR                   PMN13900
                          MDX     PR350      PRINTER NOT READY          PMN13910
                          SLA     13         *LOOP *                    PMN13920
                          BSC     Z          * IF  *                    PMN13930
                          MDX     PR340+1    *BUSY *                    PMN13940
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 PMN13950
                          MDX     PR340-1    *     *                    PMN13960
                    PR350 LD      PR100      LD.NOT READY ER.CODE       PMN13970
                          BSI  L  $PRET      EXIT TO IOCS SOFT ER.TRAP  PMN13980
                          MDX     PR340+1    TRY AGAIN                  PMN13990
                    *                                                   PMN14000
                    PR360 MDX     PR230      INTERMEDIATE JUMP          PMN14010
                    *                                                   PMN14020
                    *                                                   PMN14030
                    *CHANNEL CONSTANT LOCATED IN 1ST. WORD OF SPACE IOC PMN14040
                    *                                                   PMN14050
                    PR370 EQU     PR090                                 PMN14060
                    *                                                   PMN14070
                    *USE WORD FOR TEMPORARY STORAGE                     PMN14080
                    *                                                   PMN14090
                    PR380 EQU     PR150                                 PMN14100
                    *                                                   PMN14110
                    *                                                   PMN14120
                    PR390 BSS     60         PRINTER OUTPUT AREA        PMN14130
                    *                                                   PMN14140
                    *                                                   PMN14150
                    * CONVERT BINARY PAGE COUNT(PGCNT IN COMMA) TO      PMN14160
                    * PACKED EBCDIC DECIMAL CHARACTERS AND INSERT IN    PMN14170
                    * USERS PRINT AREA IN POSITIONS 5-8 (WORDS 3 AND 4  PMN14180
                    * OF PRINT BUFFER) WITH ZERO SUPPRESSION.           PMN14190
                    *                                                   PMN14200
                    PR400 LDX  I3 *-* PR190+2 XR3=ADDR OF USER I/O BFR  PMN14210
                          LD    2 $PGCT-4    BINARY PAGE COUNT          PMN14220
                          SRT     16         CONVERT TO DECIMAL BY      PMN14230
                    PR410 D       PR260      REPETITIVE DIVISION BY 10  PMN14240
                          RTE     16         OR IN /00F0 TO REMAINDER   PMN14250
                          OR      PR450      TO GET EBC CHAR.FOR EACH   PMN14260
                          STO   3 6          POSITION.STORE IN I/O BFR  PMN14270
                          SLA     16                                    PMN14280
                          MDX   3 -1         NEXT POSITION IN BUFFER    PMN14290
                          MDX   2 -1         DECR.LOOP COUNTER          PMN14300
                          MDX     PR410      CONTINUE CONVERSION        PMN14310
                    *                                                   PMN14320
                    * REPLACE LEADING ZEROS WITH BLANKS                 PMN14330
                    *                                                   PMN14340
                    PR420 LD    3 +7         CHECK CHARACTER FOR        PMN14350
                          EOR     PR450      /00F0.REPLACE WITH BLANK   PMN14360
                          BSC     Z          BRANCH IF                  PMN14370
                          MDX     PR430      CHARACTER NOT ZERO         PMN14380
                          LD      PR320      REPLACE ZERO WITH          PMN14390
                          STO   3 +7         EBC BLANK CHAR.            PMN14400
                          MDX   3 +1         NEXT CHAR                  PMN14410
                          MDX     PR420      CONTINUE SCAN FOR ZEROS    PMN14420
                    *                                                   PMN14430
                    *PACK THE 4 CHARACTER EBC PAGE COUNT INTO 2 WORDS   PMN14440
                    *                                                   PMN14450
                    PR430 LDX  I3 *-* PR190+2 XR3=ADDR OF USER I/O BFR  PMN14460
                    PR440 LD    3 +4        *PACK THE           *       PMN14470
                          SRT     8         *EBCDIC CHARACTERS  *       PMN14480
                          LD    3 +3        *TWO PER WORD--1ST  *       PMN14490
                          SLT     8         *TWO CHARACTERS     *       PMN14500
                          STO   3 3         STORE PACKED CHARS IN I/O   PMN14510
                          LD    3 +6        *REPEAT    *                PMN14520
                          SRT     8         *FOR       *                PMN14530
                          LD    3 +5        *NEXT      *                PMN14540
                          SLT     8         *TWO       *                PMN14550
                          STO   3 4         *CHARACTERS*                PMN14560
                          LDD     PR320     BLANK OUT                   PMN14570
                          STD   3 5         2 WDS. OF USER I/O AREA     PMN14580
                    *                                                   PMN14590
                    * INCREMENT PAGE COUNT BY ONE AND SET UP NEW        PMN14600
                    * CALLING SEQUENCE FOR USER TO PRINT HEADER RECORD  PMN14610
                    *                                                   PMN14620
                          MDX  L  $PGCT,1                               PMN14630
                          LDD     PR290      LD CALLING SEQ.FOR PRINT   PMN14640
                          MDX     PR360      RESTORE REGISTERS AND EXIT PMN14650
                    *                                                   PMN14660
                    * CONSTANT  USED IN BINARY TO DECIMAL CONVERSION    PMN14670
                    * OF PAGE COUNT.                                    PMN14680
                    *                                                   PMN14690
                    PR450 DC      /00F0    CONSTANT TO CREATE EBC CHAR  PMN14700
                    *                                                   PMN14710
                    * TABLE OF 1403 CHARACTERS--ALPHABETICS AND NUMERIC PMN14720
                    *                                                   PMN14730
                    PR460 DC      /7F7F      BLANK     BLANK            PMN14740
                          DC      /6458      A         J                PMN14750
                          DC      /2519      B         K                PMN14760
                          DC      /261A      C         L                PMN14770
                          DC      /675B      D         M                PMN14780
                          DC      /681C      E         N                PMN14790
                          DC      /295D      F         O                PMN14800
                          DC      /2A5E      G         P                PMN14810
                          DC      /6B1F      H         Q                PMN14820
                          DC      /2C20      I         R                PMN14830
                    *                                                   PMN14840
                    * SECOND HALF OF TABLE                              PMN14850
                    *                                                   PMN14860
                          DC      /7F49                0                PMN14870
                          DC      /7F40                1                PMN14880
                          DC      /0D01      S         2                PMN14890
                          DC      /0E02      T         3                PMN14900
                          DC      /4F43      U         4                PMN14910
                          DC      /1004      V         5                PMN14920
                          DC      /5145      W         6                PMN14930
                          DC      /5246      X         7                PMN14940
                          DC      /1307      Y         8                PMN14950
                          DC      /5408      Z         9                PMN14960
                    *                                                   PMN14970
                    *SPECIAL CHARACTER TABLE.EBC CODE IN LEFT SIDE,     PMN14980
                    *1403 EQUIVALENT IN RIGHT                           PMN14990
                    *                                                   PMN15000
                    PR470 DC      /407F      BLANK                      PMN15010
                          DC      /7E4A      EQUAL                      PMN15020
                          DC      /7D0B      APOSTROPHE                 PMN15030
                          DC      /614C      SLASH                      PMN15040
                          DC      /5015      AMPERSAND                  PMN15050
                          DC      /6B16      COMMA                      PMN15060
                          DC      /4D57      LEFT PAREN                 PMN15070
                          DC      /6061      MINUS                      PMN15080
                          DC      /5B62      DOLLAR                     PMN15090
                          DC      /5C23      ASTERISK                   PMN15100
                          DC      /4E6D      PLUS                       PMN15110
                          DC      /4B6E      PERIOD                     PMN15120
                          DC      /5D2F      RIGHT PAREN                PMN15130
                          DC      /7C0B     AT SIGN = APOSTROPHE    212 PMN15133
                          DC      /7B4A     POUND SIGN = EQUAL      212 PMN15136
                    *                                                   PMN15140
                    * PATCH AREA                                        PMN15150
                    *                                                   PMN15160
                          DC      /1234   INDICATING END OF PATCH AREA  PMN15170
                    PR475 DC      /5678                             2-9 PMN15180
                    *                                                   PMN15190
                    *ONE TIME INITIALIZATIONS STORED IN THE PRINTER     PMN15200
                    *OUTPUT AREA. THESE INSTRUCTIONS SET UP WORDS       PMN15210
                    *THAT ARE RELOCATABLE.                              PMN15220
                    *                                                   PMN15230
                          ORG     PR390                                 PMN15240
                    PR480 STO     PR140      MAKE INSTRUCTION A NOP     PMN15250
                          MDX     PR140+1    RESUME PROCESSING          PMN15260
                    PR490 STX     *+1        STORE I-COUNTER            PMN15270
                          LDX  L2 *-*               XR2=PR490+1         PMN15280
                          MDX  L2 PR370-PR490-1     XR2=PR370           PMN15290
                          STX   2 PR300      INIT PR300 TO PR370        PMN15300
                    *                                                   PMN15310
                          MDX   2 PR080-PR370       XR2=PR080           PMN15320
                          STX   2 PR500+1    INIT PR500+1 TO PR080      PMN15330
                    *                                                   PMN15340
                          MDX  L2 PR460-PR080       XR2=PR460           PMN15350
                          STX   2 PR180+2    INIT PR180+2 TO PR460      PMN15360
                    *                                                   PMN15370
                          MDX   2 19                XR2=PR460+19        PMN15380
                          STX   2 PR280+2    INIT PR280+2 TO PR460+19   PMN15390
                    *                                                   PMN15400
                          MDX  L2 PR390-1-PR460-19  XR2=PR390-1         PMN15410
                          STX   2 PR170+1    INIT PR170+1 TO PR390-1    PMN15420
                          STX   2 PR220+2    INIT PR220+2 TO PR390-1    PMN15430
                    *                                                   PMN15440
                          MDX   2 +1                XR2=PR390           PMN15450
                    PR500 STX  L2 *-* PR080  INIT PR080 TO PR390        PMN15460
                    *                                                   PMN15470
                          MDX   2 PR190+2-PR390     XR2=PR190+2         PMN15480
                          STX   2 PR400+1    INIT PR400+1 TO PR190+2    PMN15490
                          STX   2 PR430+1    INIT PR430+1 TO PR190+2    PMN15500
                    *                                                   PMN15510
                          LD      PR510      LOAD NOP INSTRUCTION       PMN15520
                          MDX     PR480      GO STORE NOP,RESUM PROC.   PMN15530
                    PR510 NOP                NOP CONSTANT               PMN15540
                          HDNG    SYSTEM 1132 SUBROUTINE                PMN15550
                    *************************************************** PMN15560
                    *STATUS-VERSION 2, MODIFICATION 10                * PMN15570
                    *                                                 * PMN15580
                    *FUNCTION/OPERATION-                              * PMN15590
                    *   * PRINT WITH SINGLE SPACE AFTER PRINTING      * PMN15600
                    *   * SKIP TO CHANNEL 1                           * PMN15610
                    *   * IMMEDIATE SINGLE SPACE                      * PMN15620
                    *                                                 * PMN15630
                    *ENTRY POINTS-                                    * PMN15640
                    *   * PN000+1 IS THE USER ENTRY                   * PMN15650
                    *   * PN010+1 IS THE INTERRUPT ENTRY              * PMN15660
                    *                                                 * PMN15670
                    *INPUT-                                           * PMN15680
                    *   * SKIP TO CHANNEL 1                           * PMN15690
                    *     ACC = 7000                                  * PMN15700
                    *     EXT = ADDRESS OF I/O AREA  (WORD COUNT)     * PMN15710
                    *     THIS ADDRESS MUST BE ODD SO THAT FIRST      * PMN15720
                    *     DATA WORD OF I/O AREA WILL BE AT AN         * PMN15730
                    *     EVEN ADDRESS                                * PMN15740
                    *   * PRINT                                       * PMN15750
                    *     ACC = 7001                                  * PMN15760
                    *     EXT = ADDRESS OF I/O AREA  (WORD COUNT)     * PMN15770
                    *   * SPACE                                       * PMN15780
                    *     ACC = 7002                                  * PMN15790
                    *                                                 * PMN15800
                    *OUTPUT-                                          * PMN15810
                    *   * A CARRIAGE SKIP TO CHANNEL 1 IS EXECUTED,   * PMN15820
                    *     AND THE BINARY JOB PAGE COUNT ($PGCT) IS    * PMN15830
                    *     CONVERTED TO DECIMAL IN THE USERS           * PMN15840
                    *     I/O AREA. THE ACCUMULATOR AND EXTENSION     * PMN15850
                    *     IS SET UP TO PRINT OUT OF THE SAME          * PMN15860
                    *     I/O AREA BEFORE RETURNING TO THE USER       * PMN15870
                    *   * A LINE IS PRINTED FOLLOWED BY A             * PMN15880
                    *     SINGLE SPACE                                * PMN15890
                    *   * THE FORM IS SPACED ONE LINE                 * PMN15900
                    *                                                 * PMN15910
                    *EXTERNAL REFERENCES-                             * PMN15920
                    *     $1132                                       * PMN15930
                    *     $IOCT                                   2-2 * PMN15940
                    *     $PBSY                                       * PMN15950
                    *     $PGCT                                       * PMN15960
                    *     $PRET                                       * PMN15970
                    *                                                 * PMN15980
                    *EXITS-                                           * PMN15990
                    *   NORMAL-                                       * PMN16000
                    *     * SUBROUTINE RETURNS TO USER AFTER          * PMN16010
                    *        FUNCTION HAS BEEN INITIATED              * PMN16020
                    *     * SUBROUTINE RETURNS TO POINT OF            * PMN16030
                    *        INTERRUPTION AFTER AN INTERRUPT          * PMN16040
                    *        (LEVEL 1) HAS BEEN SERVICED              * PMN16050
                    *   ERROR                                         * PMN16060
                    *      * $PRET WITH 6000 IN THE ACCUMULATOR WHEN  * PMN16070
                    *        THE 1132 IS NOT READY TO INITIATE        * PMN16080
                    *        A FUNCTION                               * PMN16090
                    *      * SUBROUTINE RETURNS TO USER WITH $1132    * PMN16100
                    *        SET NON-ZERO IF CHANNEL 12 IS SENSED     * PMN16110
                    *        AFTER PRINTING                           * PMN16120
                    *                                                 * PMN16130
                    *TABLES/WORK AREAS-N/A                            * PMN16140
                    *                                                 * PMN16150
                    *ATTRIBUTES-                                      * PMN16160
                    *   * NATURALLY RELOCATABLE                       * PMN16170
                    *   * SERIALLY REUSEABLE                          * PMN16180
                    *                                                 * PMN16190
                    *NOTES-                                           * PMN16200
                    *    * THE ONLY ERROR DETECTED WITH THE 1132      * PMN16210
                    *      IS A PRINT SCAN CHECK.  WHEN THIS OCCURS,  * PMN16220
                    *      THE SUBROUTINE TAKES 47 IDLE PRINT CYCLES  * PMN16230
                    *      BEFORE RETRYING THE CHARACTER ON WHICH THE * PMN16240
                    *      CHECK OCCURED.                             * PMN16250
                    *                                                 * PMN16260
                    *                                                 * PMN16270
                    *   *THIS ROUTINE WAS COMPLETELY REPLACED IN MOD 9* PMN16280
                    *                                                 * PMN16290
                    *************************************************** PMN16300
                          HDNG    SYSTEM DEVICE SUBROUTINE FOR 1132     PMN16310
                          ORG     0                                     PMN16315
*SBRK    8D         *SYS 1132                                           PMN16317
                          DC      PNEND-*+1  WORDCOUNT OF THIS PHASE    PMN16320
                          DC      @1132      ID OF THIS PHASE           PMN16330
                          HDNG    SYSTEM DEVICE SUBROUTINE FOR 1132     PMN16340
                    *************************************************** PMN16350
                    *      B S I   E N T R Y   P O I N T              * PMN16360
                    *************************************************** PMN16370
                    *                                                   PMN16380
                    PN000 BSC  L  *-*        BSI IS TO SECOND WORD      PMN16390
                          MDX     PN001      BR TO PROCESS REQUEST      PMN16400
                    *                                                   PMN16410
                    *                                                   PMN16420
                    *                                                   PMN16430
                    *************************************************** PMN16440
                    *  I N T E R R U P T   E N T R Y   P O I N T      * PMN16450
                    *************************************************** PMN16460
                    *                                                   PMN16470
                    PN500 BOSC L  *-*        RETURN AND RESET LEVEL 1   PMN16480
                          STX   1 PN591+1    SAVE INDEX 1               PMN16490
                          STX   2 PN592+1    SAVE INDEX 2               PMN16500
                          STX   3 PN593+1    SAVE INDEX 3               PMN16510
                          STS     PN594      SAVE STATUS                PMN16520
                          STD     PN595      SAVE ACC/EXT               PMN16530
                          MDX     PN499      HOP AND JUMP TO PROCESS    PMN16540
                    *                                                   PMN16550
                    * CERTAIN CONVENIENT CONSTANTS                      PMN16560
                    *                                                   PMN16570
                    PN064 DC      /4040      EBCDIC MASK                PMN16580
                          BSS  E  0                                     PMN16590
                    *                                                   PMN16600
                    PN595 DEC     0          SAVE ACC/EXT FOR LEVEL 1   PMN16610
                    PN070 DC      /7001      FOR AFTER EJECT            PMN16620
                          DC      *-*        HOLD ADDR OF COUNT         PMN16630
                    PN240 DC      /00F0                                 PMN16640
                    PN910 DC      10         CONSTANT 10                PMN16650
                    PN916 DC      /1600      MASK FOR TEST READY/BUSY   PMN16660
                    *                                                   PMN16670
                    *                                                   PMN16680
                    *                                                   PMN16690
                    *************************************************** PMN16700
                    *   P R O C E S S I N G   O F   T H E   B S I     * PMN16710
                    *************************************************** PMN16720
                    *                                                   PMN16730
                    PN001 EQU     *                                     PMN16740
                    *                                                   PMN16750
                    * SAVE INDEX REGISTERS FIRST                        PMN16760
                    *                                                   PMN16770
                          STX   1 PN091+1    SAVE INDEX 1               PMN16780
                          STX   2 PN092+1    SAVE INDEX 2               PMN16790
                    *                                                   PMN16800
                    * NOW SAVE THE FUNCTION CODE AS AN MDX              PMN16810
                    *                                                   PMN16820
                          STO     PN010      SAVE AS MDX  *, *+1, *+2   PMN16830
                    *                                                   PMN16840
                    * NOW BE SURE THE ROUTINE IS FREE                   PMN16850
                    *                                                   PMN16860
                          LDX   2 $PBSY      POINT TO BUSY INDICATOR    PMN16870
                          LD    2 0          GET BUSY INDICATOR         PMN16880
                          BSC     Z                                     PMN16890
                          MDX     *-3          ELSE DWELL UNTIL FREE    PMN16900
                    *                                                   PMN16910
                    * ROUTINE IS FREE -- SET IT BUSY AND SAVE ADDRESS   PMN16920
                    *                                                   PMN16930
                          LD      *-1        GET A NEGATIVE             PMN16940
                          STO   2 0          SET $PBSY=ROUT BSY/BUF NOT PMN16950
                          SLT     16         ADDRESS TO ACC             PMN16960
                          STO     *+1                                   PMN16970
                          LDX  L1 *-*        X1=ADDR(COUNT)             PMN16980
                    PN005 EQU     *-1                                   PMN16990
                          STO     PN070+1    SAVE IN CASE EJECT         PMN17000
                    *                                                   PMN17010
                    * NOW BE SURE THE PRINTER IS READY                  PMN17020
                    *                                                   PMN17030
                    PN007 XIO     PN900      SENSE NO RESET             PMN17040
                          AND     PN916      ISOLATE BOTH UNREADY+BUSY  PMN17050
                          BSC     +-         SKIP IF ANY HANGUP         PMN17060
                          MDX     PN009      ALL READY--SET I/O COUNTER PMN17070
                          SLA     5          NOT READY BIT TO BIT 0     PMN17080
                          BSC     -          SKIP IF NOT READY          PMN17090
                          MDX     PN007      JUST BUSY--LOOP            PMN17100
                          LD      PN906      /6000--CODE FOR PRE-OP ERR PMN17110
                          BSI   2 $PRET-$PBSY  GO TO PRE-OP ERROR TRAP  PMN17120
                          MDX     PN007      WHEN RETURN, TEST AGAIN    PMN17130
                    *                                                   PMN17140
                    * WE ARE GOING TO START I/O.  SET THE I/O COUNTER   PMN17150
                    *                                                   PMN17160
                    PN009 MDX  L  $IOCT,+1   INCR THE MASTER I/O COUNT  PMN17170
                    *                                                   PMN17180
                    * NOW BRANCH TO APPROPRIATE ACTION ROUTINE          PMN17190
                    *                                                   PMN17200
                    PN010 DC      *-*        SET TO MDX *, *+1,*+2      PMN17210
                    *                                                   PMN17220
                          MDX     PN011      SKIP TO 1                  PMN17230
                          MDX     PN120      PRINT                      PMN17240
                    *                                                   PMN17250
                    *                                                   PMN17260
                    *                                                   PMN17270
                    *************************************************** PMN17280
                    *  E X E C U T E   S P A C E   R E Q U E S T      * PMN17290
                    *************************************************** PMN17300
                    *                                                   PMN17310
                    PN100 XIO     PN988      START THE CARRIAGE SPACE   PMN17320
                          MDX     PN091      START THE RETURN TO CALLER PMN17330
                          SPAC    3                                     PMN17340
                    *************************************************** PMN17350
                    *   E X E C U T E   E J E C T   R E Q U E S T     * PMN17360
                    *************************************************** PMN17370
                    *                                                   PMN17380
                    * FIRST, CLEAR OFLO INDIC.  ACC IS ALREADY ZERO AND PMN17390
                    *   INDEX 2 NOW POINTS TO $PBSY IN COMMA.           PMN17400
                    *                                                   PMN17410
                    PN011 STO   2 $1132-$PBSY  SET OFLO INDIC = 0       PMN17420
                    *                                                   PMN17430
                    * NOW START THE SKIP                                PMN17440
                    *                                                   PMN17450
                          XIO     PN933      START SKIP                 PMN17460
                    *                                                   PMN17470
                    * NOW CONVERT AND INCREMENT THE PAGE NUMBER         PMN17480
                    *                                                   PMN17490
                          LD    2 $PGCT-$PBSY  GET PAGE NO. IN BINARY   PMN17500
                          MDX  L  $PGCT,+1   INCREMENT FOR NEXT TIME    PMN17510
                          LDX   2 4                                     PMN17520
                          SRT     16         MAKE INTO A DIVIDEND       PMN17530
                    PN013 SRA     4                                     PMN17540
                          STO     PN010      STORE CURRENT ACCUM        PMN17550
                          SLA     16                                    PMN17560
                          D       PN910      DIVIDE BY 10               PMN17570
                          RTE     16                                    PMN17580
                          SLA     12         RMDR TO UPPER ACCUM        PMN17590
                          OR      PN010      OR PREV ACCUMULATION       PMN17600
                          MDX   2 -1                                    PMN17610
                          MDX     PN013      DO MORE IF NOT DONE        PMN17620
                    *                                                   PMN17630
                          MDX   1 +5         X1=ADDR(PAGENO)+2          PMN17640
                          STX   1 PN016+1    SET INTO STORE INSTR       PMN17650
                          SRT     16                                    PMN17660
                          LDX   2 -2         MAJOR CYCLE COUNT          PMN17670
                          LDS     0          SET OVERFLOW OFF           PMN17680
                    PN014 LDX   1 2          SET MINOR CYCLE COUNT      PMN17690
                          SLA     16         CLEAR                      PMN17700
                    PN015 SLA     4                                     PMN17710
                          SLT     4                                     PMN17720
                          BSC     +-         SKIP TO SET F-ZONE IF NONZ PMN17730
                          BSC     O          SKIP IF OFLO OFF--RESETS O PMN17740
                          OR      PN240      NON-ZERO--OR /00F0         PMN17750
                          BSC     Z          SKIP IF STILL ZERO         PMN17760
                          LDS     1          IF NON-ZERO, SET OFLO ON   PMN17770
                          MDX   1 -1         MINOR LOOP                 PMN17780
                          MDX     PN015                                 PMN17790
                          OR      PN064      ASSURE EBCDIC--/4040       PMN17800
                    PN016 STO  L2 *-*        STORE EBC PAGENO IN HEADR  PMN17810
                          MDX   2 +1         INCR POINTER/COUNT         PMN17820
                          MDX     PN014                                 PMN17830
                    *                                                   PMN17840
                    * PAGE NUMBER NOW IN PLACE--SET UP ACC/EXT FOR PRNT PMN17850
                    *                                                   PMN17860
                          LDD     PN070      /7001 AND ADDR             PMN17870
                    *                                                   PMN17880
                    *                                                   PMN17890
                    *                                                   PMN17900
                    *************************************************** PMN17910
                    *    RETURN FROM BSI PROCESSING                   * PMN17920
                    *************************************************** PMN17930
                    *                                                   PMN17940
                    PN091 LDX  L1 *-*        RESTORE INDEX 1            PMN17950
                    PN092 LDX  L2 *-*        RESTORE INDEX 2            PMN17960
                          MDX     PN000      RETURN TO CALLER           PMN17970
                    *                                                   PMN17980
                    *                                                   PMN17990
                    *                                                   PMN18000
                    *************************************************** PMN18010
                    *  FORWARD LINK TO INTERRUPT PROCESSING           * PMN18020
                    *************************************************** PMN18030
                    *                                                   PMN18040
                    PN499 MDX     PN501      BR TO PROCESS INTERRUPT    PMN18050
                    *                                                   PMN18060
                    *************************************************** PMN18070
                    *                                                   PMN18080
                    *  RETURN LINK FROM INTERRUPT PROCESSING          * PMN18090
                    *************************************************** PMN18100
                    *                                                   PMN18110
                    PN591 LDX  L1 *-*        RESTORE INDEX 1            PMN18120
                    PN592 LDX  L2 *-*        RESTORE INDEX 2            PMN18130
                    PN593 LDX  L3 *-*        RESTORE INDEX 3            PMN18140
                    PN594 LDS     0          RESTORE STATUS             PMN18150
                          LDD     PN595      RESTORE ACC/EXT            PMN18160
                          MDX     PN500      GO TO BRANCH OUT           PMN18170
                    *                                                   PMN18180
                    *                                                   PMN18190
                    *                                                   PMN18200
                    *************************************************** PMN18210
                    *  E X E C U T E   P R I N T   R E Q U E S T      * PMN18220
                    *************************************************** PMN18230
                    *                                                   PMN18240
                    * FIRST, ESTABLISH ADDRESS FOR READ EMITTER IOCC    PMN18250
                    *                                                   PMN18260
                    PN120 STX     *+1        ADDR(PN120+1)              PMN18270
                          LDX  L2 *-*        X2=ADDR(PN120+1)           PMN18280
                          MDX   2 PN907-PN120-1  X1=ADDR(PN907)         PMN18290
                          STX   2 PN902      SET ADDR INTO READ E IOCC  PMN18300
                    *                                                   PMN18310
                    * NOW SET UP THE ADDRESSES FOR INTERRUPT SIZE AND   PMN18320
                    *   FOR THE COUNT OF POTENTIALLY PRINTABLE CHARS    PMN18330
                    *                                                   PMN18340
                          STX   1 PN124+1    SET ADDR IN TEST LOAD INST PMN18350
                          LD    1 0          ACC=WORDCOUNT              PMN18360
                          STO     *+1                                   PMN18370
                          MDX  L1 *-*        X1=ADDR(RIGHTMOST WORD)    PMN18380
                          STX   1 PN503+1    SET ADDR IN LDX INSTR      PMN18390
                          STO     PN122+1    SET COUNT INTO LDX INSTR   PMN18400
                          S       PN991                                 PMN18410
                          SRT     3          COUNT/8--EXT WAS ALL ZERO  PMN18420
                          A       PN123      ADD 'LDX  1 1' TO QUOT     PMN18430
                          STO     PN504      SET LDX SCAN PTR           PMN18440
                          SLA     16                                    PMN18450
                          SLT     4          ACC=2*REMAINDER            PMN18460
                          STO     *+1                                   PMN18470
                          LDX  L1 *-*                                   PMN18480
                          LD      PN980      GET A /0002                PMN18490
                          SLA   1                                       PMN18500
                          STO     PN905      SAVE THE STOP BIT FOR INT  PMN18510
                    PN122 LDX  L2 *-*        X2=WORDCOUNT               PMN18520
                    PN123 LDX   1 1          X1=INIT HAMMER COUNT+1     PMN18530
                    *                                                   PMN18540
                    * NOW COUNT THE NUMBER OF POTENTIALLY PRINTABLE     PMN18550
                    *   CHARACTERS                                      PMN18560
                    *                                                   PMN18570
                    PN124 LD   L2 *-*        GET WORD FROM AREA         PMN18580
                          A       PN940      ADD /BF00                  PMN18590
                          BSC     C          SKIP IF CHAR /00-/40       PMN18600
                          MDX   1 +1         INCR HAMMER CNT IF GT /40  PMN18610
                          SLA     8          SECOND CHAR TO UPPER ACC   PMN18620
                          A       PN940      ADD /BF00                  PMN18630
                          BSC     C          SKIP IF CHAR /00-/40       PMN18640
                          MDX   1 +1         INCR HAMMER CNT IF GT /40  PMN18650
                          MDX   2 -1         DECR AREA POINTER/COUNT    PMN18660
                          MDX     PN124      GET ANOTHER WORD           PMN18670
                    *                                                   PMN18680
                    * IF NO CHARACTERS TO PRINT, DO A SPACE ONLY        PMN18690
                    *                                                   PMN18700
                          STX   1 PN548      SET THE HAMMER COUNTER     PMN18710
                          MDX   1 -1         SKIP IF NO CHARS GT /40    PMN18720
                          MDX     *+1        NOT ALL LT /40--CONTINUE   PMN18730
                          MDX     PN100      JUST DO A SPACE            PMN18740
                    *                                                   PMN18750
                    * NOW START THE PRINTER, THEN RETURN TO CALLER      PMN18760
                    *                                                   PMN18770
                          LDX   2 49         SET MAX CYCLES + 1         PMN18780
                          STX   2 PN949      SET THE 'BIG COUNT'        PMN18790
                          BSI     PN520      CLEAR THE SCAN FIELD       PMN18800
                          LD      PN991      GET A 1                    PMN18810
                          STO   2 $SCAN+7-49   SET SCAN COMPLETE BIT    PMN18820
                          STO   2 $PBSY-49  SET $PBSY TOTALLY BUSY      PMN18830
                          XIO     PN956      START THE PRINTER          PMN18840
                          MDX     PN091      START THE RETURN TO CALLER PMN18850
                    *                                                   PMN18860
                    *                                                   PMN18870
                    *                                                   PMN18880
                    *************************************************** PMN18890
                    *INTERMEDIATE RETURN LINK FROM INTERRUPT PROCESSNG* PMN18900
                    *************************************************** PMN18910
                    *                                                   PMN18920
                    PN590 MDX     PN591      NECESSARY BECAUSE OF SHORT PMN18930
                          EJCT                                          PMN18940
                    *************************************************** PMN18950
                    *   I O C C S   A N D   C O N S T A N T S         * PMN18960
                    *************************************************** PMN18970
                    *                                                   PMN18980
                          BSS  E  0                                     PMN18990
                    *                                                   PMN19000
                    PN991 DC      1          CONSTANT 1                 PMN19010
                    PN905 DC      *-*        HOLD INIT SCAN STOP BIT    PMN19020
                          SPAC    1                                     PMN19030
                    PN900 EQU     *                                     PMN19040
                    PN940 DC      /BF00      TO FORCE GT /40 TO CARRY   PMN19050
                          DC      /3700      SENSE *NO* RESET           PMN19060
                    *                                                   PMN19070
                    PN901 EQU     *                                     PMN19080
                    PN980 DC      /0002      MASK FOR SETTING SCAN STOP PMN19090
                          DC      /3701      SENSE WITH *RESET*         PMN19100
                    *                                                   PMN19110
                    PN933 EQU     *                                     PMN19120
                    PN949 DC      *-*        'BIG COUNT'                PMN19130
                          DC      /3404      START CARRIAGE             PMN19140
                    *                                                   PMN19150
                    PN966 EQU     *                                     PMN19160
                    PN906 DC      /6000      PRE-OP ERROR CODE          PMN19170
                          DC      /3402      STOP CARRIAGE              PMN19180
                    PN956 EQU     *                                     PMN19190
                    PN907 DC      *-*        PLACE FOR EMITTER CHAR     PMN19200
                          DC      /3480      START PRINTER              PMN19210
                    *                                                   PMN19220
                    PN902 DC      *-*        ADDR(PN907) MUST BE PLUGGE PMN19230
                          DC      /3200      READ EMITTER               PMN19240
                    PN988 EQU     *                                     PMN19250
                    PN955 DC      /FF00      /FF00 FOR FORCING CARRY    PMN19260
                          DC      /3401      CARRIAGE SPACE             PMN19270
                    *                                                   PMN19280
                    PN947 EQU     *                                     PMN19290
                    PN950 DC      *-*        HOLD CYCLE COUNT           PMN19300
                          DC      /3440      STOP PRINTER               PMN19310
                    *                                                   PMN19320
                    *                                                   PMN19330
                    *                                                   PMN19340
                    *************************************************** PMN19350
                    *  SERVICE ROUTINE TO CLEAR SCAN FIELD            * PMN19360
                    *************************************************** PMN19370
                    *                                                   PMN19380
                          BSC  L  *-*        ENTRY/RETURN               PMN19390
                    PN520 EQU     *-1                                   PMN19400
                          LDX   1 $SCAN     X1=ADDR(SCANFIELD)          PMN19410
                          SRT     27         SCAN-CHECK BIT TO BIT 31   PMN19420
                          SLT     32         ACC/EXT=0, CARRY=SCAN-CHK  PMN19430
                          STD   1 0          CLEAR FIRST TWO WORDS      PMN19440
                          STD   1 2          CLEAR SECOND TWO WORDS     PMN19450
                          STD   1 4          CLEAR THIRD TWO WORDS      PMN19460
                          STD   1 6          CLEAR LAST TWO WORDS       PMN19470
                          MDX     PN520-1    RETURN                     PMN19480
                    *************************************************** PMN19490
                    *  CONTINUE THE PROCESSING OF LEVEL 1 INTERRUPT   * PMN19500
                    *************************************************** PMN19510
                    *                                                   PMN19520
                    * SENSE DSW -- DETERMINE IF PRINT RESPONSE          PMN19530
                    *                                                   PMN19540
                    PN501 XIO     PN901      SENSE WITH RESET           PMN19550
                          BSC     -          SKIP IF IT IS PRINT RESP   PMN19560
                          MDX     PN600      BR IF *NOT* PRINT RESP     PMN19570
                    *                                                   PMN19580
                    * IT IS A PRINT RESPONSE--ZERO THE SCAN FIELD AND   PMN19590
                    *   SEE IF WE HAD A SCAN CHECK ON THE LAST CYCLE.   PMN19600
                    *   THE ZERO-SCAN SERVICE ROUTINE SETS CARRY ON     PMN19610
                    *   IF SCAN CHECK HAS OCCURRED.                     PMN19620
                    *                                                   PMN19630
                          BSI     PN520      DO ZERO-SCAN-FIELD         PMN19640
                          BSC     C          SKIP IF *NO* SCAN CHECK    PMN19650
                          MDX     PN847      SCAN CHECK--BR TO RECOVER  PMN19660
                    *                                                   PMN19670
                    * NO SCAN-CHECK HAS OCCURRED.  SEE IF WE ARE NOW IN PMN19680
                    *   IDLE CYCLES.                                    PMN19690
                    *                                                   PMN19700
                          LD      PN950      ACC=IDLE CYCLE COUNTER     PMN19710
                          BSC     Z          SKIP IF *NOT* IN IDLE      PMN19720
                          MDX     PN800      IN IDLE--BR TO RESOLVE WHY PMN19730
                    *                                                   PMN19740
                    * NO SCAN-CHECK AND NOT IN IDLE.  ONLY QUESTION     PMN19750
                    *   LEFT IS WHETHER LAST CYCLE WAS THE LAST PRINT   PMN19760
                    *   CYCLE THAT WAS NEEDED.                          PMN19770
                    *                                                   PMN19780
                          XIO     PN902      READ EMITTER JUST IN CASE  PMN19790
                          LDX  L2 *-*        X2=COUNT OF REMAINING      PMN19800
                    PN548 EQU     *-1          POSSIBLE HAMMER FIRES    PMN19810
                          LD      PN949      ACC=MAX REMAINING CYCLES   PMN19820
                          S       PN991      SUBTRACT 1                 PMN19830
                          STO     PN949      STORE UPDATED VALUE        PMN19840
                          MDX   2 -1         TRY FORCE SKIP             PMN19850
                          BSC     +          NO SKIP--TEST NO CYCL LEFT PMN19860
                          MDX     PN599      BR IF WAS LAST PRINT CYCLE PMN19870
                    *                                                   PMN19880
                    * NO QUESTIONS LEFT.  WE MUST SET UP THE SCAN FIELD PMN19890
                    *                                                   PMN19900
                          MDX   2 +1         RESTORE HAMMER COUNT       PMN19910
                    PN503 LDX  L3 *-*        X3=ADDR(RIGHTMOST AREA)    PMN19920
                    PN504 DC      *-*        SET TO LDX  1 SCAN-WD NO.  PMN19930
                          LDD     PN905-1    ACC=XXX, EXT=STOP BIT      PMN19940
                    *                                                   PMN19950
                    * NOW SCAN THE PRINT TEXT TO SET SCAN FIELD         PMN19960
                    *                                                   PMN19970
                    PN513 LD    3 0          GET TWO CHARS FROM AREA    PMN19980
                          EOR     PN907      COMPARE FIRST TO EMIT CHAR PMN19990
                          LDS     2          SET CARRY ON               PMN20000
                          BSC     -          AVOID ADD IF NEG--MAY OFLO PMN20010
                          A       PN955      CARRY ON AGAIN IF NOT EQ   PMN20020
                          STS     PN516      SET MDX * OR MDX *+2       PMN20030
                          SLA     8          SECOND CHAR TO UPPER ACC   PMN20040
                          EOR     PN907                                 PMN20050
                          BSC     Z          SKIP IF WAS EQUAL          PMN20060
                    PN515 MDX     *+2        NOT EQ--SKIP NEXT 2 INSTRS PMN20070
                          MDX   2 -1         EQUAL--DECR HAMMER COUNT   PMN20080
                          LD      PN991      EQUAL--SET SCAN BIT ON     PMN20090
                    PN516 MDX     *          BECOMES *+2 IF 1ST NOT EQ  PMN20100
                          MDX   2 -1         EQUAL--DECR HAMMER COUNT   PMN20110
                          OR      PN515      EQUAL--SET SCAN BIT ON     PMN20120
                          SLA     8          GET RID OF FIRST 8 BITS    PMN20130
                          SRA     8             OF POSSIBLE GARBAGE     PMN20140
                          MDX   3 -1         DECR AREA POINTER          PMN20150
                          RTE     2          INCORP SCAN BITS           PMN20160
                          BSC     -          SKIP IF STOPPER CAME AROUN PMN20170
                          MDX     PN513                                 PMN20180
                    *                                                   PMN20190
                    * WE SKIP TO HERE WHEN A SCAN WORD IS TO BE STORED  PMN20200
                          RTE     16         ACC=SCAN-WD, EXT=STOPPER   PMN20210
                          STO   1 $SCAN-1    STORE INTO SCAN FIELD      PMN20220
                          MDX   1 -1         UPDATE SCAN PTR--SKIP IF 0 PMN20230
                          MDX     PN513      NOT LAST SCAN WORD--DO MOR PMN20240
                    *                                                   PMN20250
                    * WE SKIP TO HERE WHEN THE LAST SCAN WORD HAS BEEN  PMN20260
                    *   STORED AND WE ARE ABOUT TO EXIT THE INTERRUPT.  PMN20270
                    *                                                   PMN20280
                          STX   2 PN548      STORE REMAINING HAMMER COU PMN20290
                    PN580 MDX  L  $SCAN+7,+1  SET SCAN-COMPLETE BIT     PMN20300
                          MDX     PN590      EXIT FROM INTERRUPT LEVEL  PMN20310
                    *                                                   PMN20320
                    * WE COME HERE WHEN PREVIOUS CYCLE WAS LAST CYCLE.  PMN20330
                    *   WE HAVE ALREADY TAKEN ONE EXTRA CYCLE FOR IDLE, PMN20340
                    *   AND MUST SET FOR 15 MORE.  WE WILL ALSO SET     PMN20350
                    *   THE $PBSY SWITCH TO INDICATE ROUTINE BUSY BUT   PMN20360
                    *   BUFFER FREE.  THEN WE MAY SET SCAN COMPLETE BIT PMN20370
                    *   AND EXIT THE INTERRUPT LEVEL.                   PMN20380
                    *                                                   PMN20390
                    PN599 LDX   2 15         X2=REMAINING IDLE CYCLES   PMN20400
                          LD      *-1        GET A NEGATIVE             PMN20410
                          STO   2 $PBSY-15   SET ROUT BUSY/BUF FREE     PMN20420
                    PN589 STX   2 PN950      SET IDLE COUNT             PMN20430
                          MDX     PN580      GO SET SCAN COMPLETE, EXIT PMN20440
                    *                                                   PMN20450
                    *                                                   PMN20460
                    *                                                   PMN20470
                    * NOT A PRINTER RESPONSE--MAYBE SKIP                PMN20480
                    *                                                   PMN20490
                    PN600 LDX   1 0          GIVE OURSELVES A BASE ADDR PMN20500
                          SLA     1          SKIP BIT TO BIT 0          PMN20510
                          BSC     -          SKIP IF IT WAS 'SKIP'      PMN20520
                          MDX     PN700      NOT SKIP--BR FOR SPACE     PMN20530
                          SLA     7       CHAN 1 BIT TO BIT 0           PMN20540
                          BSC     -       SKIP IF IT WAS CHANNEL 1      PMN20550
                          MDX     PN590      NOT OUR CHAN--EXIT INTERRU PMN20560
                          XIO     PN966      STOP CARRIAGE              PMN20570
                    *                                                   PMN20580
                    * COMMON CARRIAGE CONTROL EXIT                      PMN20590
                    *                                                   PMN20600
                    PN650 MDX  L  $IOCT,-1   REDUCE MASTER I/O COUNT    PMN20610
                          NOP                IN CASE OF SKIP            PMN20620
                          SLA     16                                    PMN20630
                          STO   1 $PBSY      SET ROUTINE TOTALLY FREE   PMN20640
                          MDX     PN590      GO START THE RETURN        PMN20650
                    *                                                   PMN20660
                    * SPACE COMPLETE INTERRUPT                          PMN20670
                    *                                                   PMN20680
                    PN700 SLA     1          SPACE BIT TO BIT 0         PMN20690
                          BSC     -          SKIP IF SPACE INTERRUPT    PMN20700
                          MDX     PN590      BR ON UNEXPECTED--RETURN   PMN20710
                          SRA     2          CHAN 12 TO BIT 15          PMN20720
                          BSC     E          SKIP IF *NO* CHAN 12       PMN20730
                          STO   1 $1132      SET CHAN 12 ON             PMN20740
                          MDX     PN650      GO TO COMMON CARRIAGE EXIT PMN20750
                    *                                                   PMN20760
                    *                                                   PMN20770
                    *                                                   PMN20780
                    * RECOVERY FROM SCAN CHECK                          PMN20790
                    *                                                   PMN20800
                    PN847 LDX   2 46         SET 46 *MORE* DEAD CYCLES  PMN20810
                          STX   2 PN950      SET IDLE COUNTER           PMN20820
                          LDX   2 120        WE MUST FORGET ABOUT OPTI- PMN20830
                          MDX     PN580-1      MIZING HAMMER FIRES NOW  PMN20840
                    *                                                   PMN20850
                    * IN A DELAY--DISCOVER WHY                          PMN20860
                    *                                                   PMN20870
                    PN800 S       PN991      SUBTRACT 1                 PMN20880
                          STO     PN950      PUT BACK CYCLE             PMN20890
                          BSC     +          SKIP IF ANY IDLE LEFT      PMN20900
                          LD    1 $PBSY-$SCAN                           PMN20910
                          BSC     -          SKIP IF IN BUF FREE MODE   PMN20920
                          MDX     PN580      ELSE, MERE DELAY--RETURN   PMN20930
                          MDX  L  $SCAN+7,+1                            PMN20940
                          XIO     PN947      TIME TO STOP THE PRINTER   PMN20950
                          XIO     PN988        AND START A SPACE        PMN20960
                          MDX     PN590      NOW WE CAN RETURN          PMN20970
                    *                                                   PMN20980
                    *                                                   PMN20990
                    *                                                   PMN21000
                    PNEND EQU     *                                     PMN21010
                          HDNG    SYSTEM CONSOLE PRINTER SUBROUTINE     PMN21020
                    *************************************************** PMN21030
                    *                                                 * PMN21040
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN21050
                    *                                                 * PMN21060
                    *FUNCTION/OPERATION-                              * PMN21070
                    *     *RESTORE (SPACE 5 LINES)                    * PMN21080
                    *     *WRITE                                      * PMN21090
                    *     *SPACE ONE LINE                             * PMN21100
                    *                                                 * PMN21110
                    *ENTRY POINTS-                                    * PMN21120
                    *     *CP000+1 IS THE USER ENTRY.                 * PMN21130
                    *     *CP020+1 IS THE INTERRUPT ENTRY.            * PMN21140
                    *                                                 * PMN21150
                    *INPUT-                                           * PMN21160
                    *     *RESTORE                                    * PMN21170
                    *      ACC = 7000                                 * PMN21180
                    *      EXT = ADDRESS OF PAGE HEADING BUFFER       * PMN21190
                    *     *WRITE                                      * PMN21200
                    *      ACC = 7001                                 * PMN21210
                    *      EXT = ADDRESS OF I/O AREA                  * PMN21220
                    *     *SPACE                                      * PMN21230
                    *      ACC = 7002                                 * PMN21240
                    *      EXT = ANYTHING                             * PMN21250
                    *     **THE I/O AREA CONSISTS OF ONE WORD OF WORD * PMN21260
                    *       COUNT FOLLOWED BY PACKED EBCDIC.          * PMN21270
                    *                                                 * PMN21280
                    *OUTPUT-                                          * PMN21290
                    *     THE MESSAGE IN THE I/O AREA IS PRINTED TO   * PMN21300
                    *     THE KEYBOARD.                               * PMN21310
                    *                                                 * PMN21320
                    *EXTERNAL REFERENCES-                             * PMN21330
                    *     $I405+1                                     * PMN21340
                    *     $IOCT                                   2-2 * PMN21350
                    *     $KCSW                                       * PMN21360
                    *     $PBSY                                       * PMN21370
                    *     $PRET                                       * PMN21380
                    *     $PST4                                       * PMN21390
                    *                                                 * PMN21400
                    *EXITS- NORMAL                                    * PMN21410
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * PMN21420
                    *      HAS BEEN INITIATED.                        * PMN21430
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * PMN21440
                    *      SUBROUTINE AFTER AN INTERRUPT HAS BEEN     * PMN21450
                    *      SERVICED.                                  * PMN21460
                    *                                                 * PMN21470
                    *EXITS- ERROR                                     * PMN21480
                    *     *EXIT TO $PRET ON PRE-OPERATIVE ERROR.      * PMN21490
                    *     *EXIT TO $PST4 ON POST-OPERATIVE ERROR.     * PMN21500
                    *                                                 * PMN21510
                    *TABLES/WORK AREAS-                               * PMN21520
                    *     CP480 IS A TABLE OF EBCDIC TO ROTATE AND    * PMN21530
                    *     TILT INLINE CODE.                           * PMN21540
                    *                                                 * PMN21550
                    *ATTRIBUTES-                                      * PMN21560
                    *     *NATURALLY RELOCATABLE.                     * PMN21570
                    *     *REUSABLE.                                  * PMN21580
                    *                                                 * PMN21590
                    *NOTES- BEFORE RETURNING TO THE CALLER A CHECK IS * PMN21600
                    *     MADE FOR THE PRESENCE OF THE SYSTEM KEYBOARD* PMN21610
                    *     SUBROUTINE IN CORE.  IF IT IS, RETURNING IS * PMN21620
                    *     DELAYED UNTIL CONSOLE PRINTING IS COMPLETED * PMN21630
                    *     TO PREVENT POSSIBLE OVER-LAPPING.           * PMN21640
                    *                                                 * PMN21650
                    *************************************************** PMN21660
                          HDNG    SYSTEM CONSOLE PRINTER SUBROUTINE     PMN21670
                          ORG     0                                     PMN21680
*SBRKSMC 8E         *SYS CONSOLE PRINTER                          V2M03 PMN21690
                          DC      CP530-CP000  WC OF SYS CP SUBR    2-1 PMN21700
                          DC      @CPTR        PHASE ID OF SYS CP SUBR  PMN21710
                          HDNG    SYSTEM CONSOLE PRINTER SUBROUTINE     PMN21720
                    CP000 BSC  L  *-*        ENTER HERE FROM MAIN  (+2) PMN21730
                          MDX     CP090-1    BR TO SERVICE CALL         PMN21740
                    *                                                 * PMN21750
                    CP020 BSC  L  *-*        ENTER HERE ON INTRPT  (+5) PMN21760
                          LD      CP040      INITLZ SYSTEM TRAP ADDR    PMN21770
                          STO     CP110+1    OF 'TEST DEV RDY' SUBR     PMN21780
                          MDX     CP480      BR TO SERVICE INTERRUPT2-1 PMN21790
                    *                                                 * PMN21800
                    CP025 DC      8          IBT INCREMENT              PMN21810
                    CP030 DC      6          PAGE HDR INCREMENT         PMN21820
                    CP040 DC      $PST4      ADDR OF INT TRAP ADDR      PMN21830
                    CP050 DC      $PRET      ADDR OF CALL TRAP ADDR     PMN21840
                    CP060 DC      CP020-CP010  ADDR DISPLACEMENT        PMN21850
                    CP070 DC      0          INTRPT ADDR MINUS DISP     PMN21860
                          BSS  E  0                                     PMN21870
                    CP080 DC      /7001      PRNT FUNC CODE             PMN21880
                          DC      *-*        PAGE HDR ADDR              PMN21890
                    *                                                 * PMN21900
                          STO     CP120      SET UP FUNCTION            PMN21910
                    CP090 LD   L  $PBSY      TEST SUBROUTINE BUSY       PMN21920
                          BSC     Z          SKIP ON NOT BUSY           PMN21930
                          MDX     *-4        LOOP ON BUSY               PMN21940
                    *                                                 * PMN21950
                          STX  L0 $PBSY      SET SUBROUTINE BUSY        PMN21960
                          STO     CP080+1    SAVE FOR INTRPT EXIT       PMN21970
                          STO     CP210      SET LFT/RT INDR TO LFT     PMN21980
                          STO     CP200      AND CARRIER RET INDR TO Z  PMN21990
                          STX   2 CP510+2    SAVE XR2               2-2 PMN22000
                          STX   3 CP510+4    SAVE XR3               2-2 PMN22010
                    *                                                 * PMN22020
                    CP010 STX     CP070      COMPUTE RELATIVE ADDR      PMN22030
                          LD      CP070      *OF INTERRUPT ENTRY        PMN22040
                          A       CP060      FOR ILS04 BRANCH TABLE     PMN22050
                          STO     CP070                                 PMN22060
                          LD   L  $I405+1    FETCH ADDR OF ILS04 IBT    PMN22070
                          A       CP025                                 PMN22080
                          STO     *+2        SAVE KB/CP ENTRY ADDR      PMN22090
                          LD      CP070      SET UP THE INTERRUPT ADDR  PMN22100
                          STO  L  *-*        IN THE IBT                 PMN22110
                          LD      CP050      CALL SYSTEM TRAP ADDR      PMN22120
                          STO     CP110+1    TO 'TEST DEV RDY' SUBR     PMN22130
                          BSI     CP100      GO TO TEST DEVICE READY    PMN22140
                          MDX     CP120      GO TO DETRMINE FUNCTION    PMN22150
                    *                                                 * PMN22160
                          DC      /4C00      BRANCH OUT                 PMN22170
                    CP100 DC      *-*        OF READY TEST              PMN22180
                          XIO     CP320-1    SENSE AND RESET            PMN22190
                          SLA     5                                     PMN22200
                          BSC     -          SKIP ON DEVIC NOT RDY      PMN22210
                          MDX     CP100-1    GO TO RET ON DEVIC RDY     PMN22220
                    *                                                 * PMN22230
                          LD      CP330      ERROR CD FOR DEVC NOT RDY  PMN22240
                    CP110 BSI  L  *-*        TO ACC AND GO TO WAIT      PMN22250
                          MDX     CP100+1    TRY AGAIN                  PMN22260
                    *                                                 * PMN22270
                    CP120 DC      *-*        FUNCTION BRANCH            PMN22280
                          MDX     CP130      *TO HERE ON RESTORE        PMN22290
                          MDX     CP140      *TO HERE ON PRINT          PMN22300
                          MDX     CP180      *TO HERE ON SKIP - BRANCH  PMN22310
                    *                        TO XEQ CARR RET AND EXIT * PMN22320
                    CP130 LD      CP410      SET FOR FIVE               PMN22330
                          STO     CP200      CARR RETURNS AND           PMN22340
                          RTE     16         FETCH I/O AREA ADDR        PMN22350
                          STO     CP080+1    SAVE I/O AREA ADDRESS  2-1 PMN22360
                          STO     CP136+1                           2-1 PMN22370
                          STO     *+2                               2-1 PMN22380
                          LDX   2 4          XR2 EQUALS WORD COUNT  2-1 PMN22390
                          LDX  L3 *-*        XR3 POINT TO I/O AREA  2-1 PMN22400
                          LD   L  $PGCT      FETCH PAGE COUNT       2-1 PMN22410
                          SRT     16                                2-1 PMN22420
                    CP132 D       CP340      CONVERT                2-1 PMN22430
                          RTE     16         *PAGE                  2-1 PMN22440
                          OR      CP420      *COUNT                 2-1 PMN22450
                          STO   3 6          *TO                    2-1 PMN22460
                          SLA     16         *UNPACKED              2-1 PMN22470
                          MDX   3 -1         *EBCDIC                2-1 PMN22480
                          MDX   2 -1                                2-1 PMN22490
                          MDX     CP132                             2-1 PMN22500
                    CP134 LD    3 7          REPLACE                2-1 PMN22510
                          EOR     CP420      *LEADING               2-1 PMN22520
                          BSC     Z          *ZEROS                 2-1 PMN22530
                          MDX     CP136      *WITH                  2-1 PMN22540
                          LD      CP470      *BLANKS                2-1 PMN22550
                          STO   3 7                                 2-1 PMN22560
                          MDX   3 1                                 2-1 PMN22570
                          MDX     CP134                             2-1 PMN22580
                    CP136 LDX  L3 *-*                               2-1 PMN22590
                          LD    3 4          PACK                   2-1 PMN22600
                          SRT     8          *FOUR                  2-1 PMN22610
                          LD    3 3          *CHARACTER             2-1 PMN22620
                          SLT     8          *PAGE                  2-1 PMN22630
                          STO   3 3          *COUNT                 2-1 PMN22640
                          LD    3 6          *TO                    2-1 PMN22650
                          SRT     8          *TWO                   2-1 PMN22660
                          LD    3 5          *WORDS                 2-1 PMN22670
                          SLT     8                                 2-1 PMN22680
                          STO   3 4                                 2-1 PMN22690
                          LDD     CP470      CLEAR TEMPORARLY       2-1 PMN22700
                          STD   3 5          *USED WORDS            2-1 PMN22710
                          MDX  L  $PGCT,1    INCREMENT THE PAGE CNT 2-1 PMN22720
                          MDX     CP180      BRANCH FOR CARR RETURNS2-1 PMN22730
                    *                                               2-1 PMN22740
                    *     CONSTANTS AND WORK AREAS                  2-1 PMN22750
                    *                                               2-1 PMN22760
                          BSS  E  0                                 2-1 PMN22770
                    CP200 DC      *-*        CARRIAGE RETURN INDIC  2-1 PMN22780
                    CP210 DC      *-*        LEFT/RIGHT INDICATOR   2-1 PMN22790
                    CP330 DC      /2000      'DEVICE NOT READY' CODE2-1 PMN22800
                    CP320 DC      /0F01      SENSE AND RESET IOCC   2-1 PMN22810
                    CP340 DC      10         BINARY TO EBCDIC DIVISOR   PMN22820
                    CP410 DC      4          NO. OF CARRIAGE RETURNS2-1 PMN22830
                    CP420 DC      /00F0      BINARY TO EBCDIC MASK  2-1 PMN22840
                    CP470 DC      /4040      PACKED EBCDIC BLANKS   2-1 PMN22850
                    CP480 MDX     CP220      BR TO SERVICE INTERRUPT2-1 PMN22860
                    CP490 BSI     CP100      BR TO SENSE DEVICE RDY 2-1 PMN22870
                          MDX     CP305      BRANCH TO PRINT        2-1 PMN22880
                    CP500 MDX     CP020      RETURN TO ILS04        2-1 PMN22890
                    CP510 LDD     CP080      FUNC CODE / I/O AREA   2-1 PMN22900
                          LDX  L2 *-*        RESTORE XR2            2-2 PMN22910
                          LDX  L3 *-*        RESTORE XR3            2-2 PMN22920
                          MDX     CP000      RETURN TO CALLER       2-1 PMN22930
                    *                                               2-1 PMN22940
                    *                        INSTRUCTION REMOVED    2-2 PMN22950
                    CP140 RTE     16         FETCH AND STORE        2-1 PMN22960
                          STO     CP160+1    ADDRESS OF             2-1 PMN22970
                          STO     *+3        I/O AREA                   PMN22980
                          A       CP400                                 PMN22990
                          STO     CP380                                 PMN23000
                          LDX  I2 *-*        WD CNT TO XR2              PMN23010
                    *                                                 * PMN23020
                          STX     CP250+1                               PMN23030
                    CP150 LD      CP250+1                               PMN23040
                          A       CP390      ADDR OF TEMP STORAGE       PMN23050
                          STO     CP250+1    I/O AREA ADDR TO           PMN23060
                          STO     CP270+1    INLINE CODING              PMN23070
                    *                                                 * PMN23080
                    CP160 LD   L2 *-*        SCAN FOR TRAILING BLANKS   PMN23090
                          S       CP470      FROM END OF I/O AREA   2-1 PMN23100
                          BSC     Z          SKIP IF WD IS A BLANK      PMN23110
                          MDX     CP170      BRANCH OUT TO SCAN         PMN23120
                          MDX   2 -1         DECR WD CNT AND            PMN23130
                          MDX     CP160      CONTINUE SCAN              PMN23140
                    *                                                 * PMN23150
                    CP170 STX   2 CP370      SET ACTUAL WD CNT          PMN23160
                    *                        INSTRUCTION REMOVED    2-2 PMN23170
                    CP180 LD      CP430      SET UP AND                 PMN23180
                          STO     CP450      EXECUTE A CARR RETURN      PMN23190
                          STX     CP350      ADDRESS OF BUFFER          PMN23200
                    CP190 LD      CP350      COMPUTED AND STORED        PMN23210
                          A       CP360      FOR IOCC WORD              PMN23220
                          STO     CP350                                 PMN23230
                    *                                                 * PMN23240
                          XIO     CP350                                 PMN23250
                          MDX  L  $IOCT,1    INCREMENT INTRPT CNTR  2-2 PMN23260
                          MDX  L  $KCSW,0    IS CPSYS SUBR IN CORE      PMN23270
                          MDX     *+1        YES, SKIP TO HANG IN       PMN23280
                          MDX     *+4        NO, GO TO RETURN           PMN23290
                    *                                                 * PMN23300
                          LD   L  $PBSY      IS SUBROUTINE BUSY         PMN23310
                          BSC     Z          SKIP TO RETURN             PMN23320
                          MDX     *-4        LOOP UNTIL NOT BUSY        PMN23330
                    *                                                 * PMN23340
                          MDX     CP510      RETURN TO CALLER       2-1 PMN23350
                    *                                                 * PMN23360
                    *************************************************** PMN23370
                    *     THIS BLOCK OF CODING SERVICES               * PMN23380
                    *     THE INTERRUPT                               * PMN23390
                    *************************************************** PMN23400
                    CP220 XIO     CP320-1                               PMN23410
                          LD      CP200      TEST CARR RET IND          PMN23420
                          BSC     Z          SKIP TO CHECK WD CNT ON Z  PMN23430
                          MDX     CP230      GO TO HANDLE RESTORE       PMN23440
                          LD      CP370      DETRM FUNC REQUESTED       PMN23450
                          BSC     Z          SKIP ON SKIP FUNCTION      PMN23460
                          MDX     CP240      BRANCH TO SERVICE PRINT    PMN23470
                    *                        *REQUEST                 * PMN23480
                          STO  L  $PBSY      TURN OFF SUBR BUSY INDR    PMN23490
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 PMN23500
                          NOP                IN CASE OF SKIP        2-2 PMN23510
                          MDX     CP500      RETURN TO ILS04        2-1 PMN23520
                    CP230 LD      CP200                                 PMN23530
                          S       CP400      DECR THE CARR RET INDR     PMN23540
                          STO     CP200                                 PMN23550
                          MDX     CP300+4    GO TO EXEC CARR RET        PMN23560
                    *                                                 * PMN23570
                    CP240 LD      CP210      DETM WHICH HALF OF PACKED  PMN23580
                          BSC     Z          EBC WORD TO HANDLE         PMN23590
                          MDX     CP260      BRANCH TO HANDLE RIGHT     PMN23600
                    *                                                 * PMN23610
                    CP250 LD   I  *-*        SKIP TO HERE TO HANDLE LFT PMN23620
                          SRA     8          FETCH WRD, SHIFT OUT RT    PMN23630
                          STO     CP450      AND STORE INTO BUFFER      PMN23640
                          LD      *-1                                   PMN23650
                          STO     CP210      SET INDR TO HANDLE RT      PMN23660
                          MDX     CP280-1    GO TO CONVERT              PMN23670
                    *                                                 * PMN23680
                    CP260 SLA     16         SET INDR TO                PMN23690
                          STO     CP210     HANDLE LEFT                 PMN23700
                          LD      CP370      DECR WORD COUNT            PMN23710
                          S       CP400                                 PMN23720
                          STO     CP370                                 PMN23730
                    CP270 LD   I  *-*        FETCH WORD, AND            PMN23740
                          AND     CP440      DELETE RIGHT HALF          PMN23750
                          STO     CP450      STORE INTO BUFFER          PMN23760
                          LD      CP380      INCR I/O AREA POINTER      PMN23770
                          A       CP400                                 PMN23780
                          STO     CP380                                 PMN23790
                    *                                                 * PMN23800
                          STX     CP290+1    COMPUTE THE                PMN23810
                    CP280 LD      CP290+1    *EFFECTIVE ADDRESS         PMN23820
                          A       CP460      *OF THE CONV TABLE         PMN23830
                          STO     CP290+1    *AND STORE IT INLINE       PMN23840
                          STO     CP300+1                               PMN23850
                          LDX   1 +49                                   PMN23860
                          LD      CP450      FETCH WORD                 PMN23870
                    CP290 EOR  L1 *-*                                   PMN23880
                          SLA     8          SHIFT OUT CONSOLE CODE     PMN23890
                          BSC     +-         SKIP IF NO COMPARE         PMN23900
                          MDX     CP300      END SEARCH - CHAR FOUND    PMN23910
                          MDX   1 -1                                    PMN23920
                          MDX     CP290-1    CONTINUE SEARCH            PMN23930
                    *                                                 * PMN23940
                          LD      CP520     INVALID CHAR DETECTED   2-3 PMN23950
                          MDX     CP300+2    GO TO PRINT A BLANK        PMN23960
                    *                                                 * PMN23970
                    CP300 LD   L1 *-*                                   PMN23980
                          AND     CP310      DELETE EBC                 PMN23990
                          STO     CP450      SET FOR IOCC               PMN24000
                    *                                                 * PMN24010
                          MDX     CP490      BR TO SENSE DEVICE RDY 2-1 PMN24020
                    *                                                 * PMN24030
                    CP305 XIO     CP350      PRINT                      PMN24040
                          MDX     CP230-1    GO TO RET FROM INTRPT      PMN24050
                    *************************************************** PMN24060
                    *    FOLLOWING IS A TABLE OF CONSTANTS            * PMN24070
                    *                                                 * PMN24080
                    *************************************************** PMN24090
                          BSS  E  0                                     PMN24100
                    CP350 DC      *-*        AREA ADDR FOR CONSOLE      PMN24110
                          DC      /0902      IOCC FOR WRITE ON CONSOLE  PMN24120
                    CP310 DC      /FF00      MASKING CONSTANT       2-1 PMN24130
                    CP360 DC      CP450-CP190  ADDRESSING DISP          PMN24140
                    CP370 DC      0          WORD COUNT                 PMN24150
                    CP380 DC      0          I/O AREA ADDR              PMN24160
                    CP390 DC      CP380-CP150  ADDRESSING DISP          PMN24170
                    CP400 DC      1          CONSTANT ONE               PMN24180
                    CP430 DC      /8100      IOCC FOR CARR RET          PMN24190
                    CP440 DC      /00FF      MASKING CONSTANT           PMN24200
                    CP450 DC      *-*        INPUT BUFFER               PMN24210
                    CP460 DC      CP520-CP280-1  ADDR DISP          2-1 PMN24220
                    *************************************************** PMN24230
                    *    THE CONV CP480 FOLLOWING CONSISTS            * PMN24240
                    *    OF 49 ACCEPTABLE CONSOLE CODES IN            * PMN24250
                    *    BITS 0-7, AND THEIR CORRESPONDING            * PMN24260
                    *    EBCDIC REPRESENTATION IN BITS 8-15           * PMN24270
                    *************************************************** PMN24280
                    CP520 DC      /2140      BLANK                  2-1 PMN24290
                          DC      /C4F0      0                          PMN24300
                          DC      /FCF1      1                          PMN24310
                          DC      /D8F2      2                          PMN24320
                          DC      /DCF3      3                          PMN24330
                          DC      /F0F4      4                          PMN24340
                          DC      /F4F5      5                          PMN24350
                          DC      /D0F6      6                          PMN24360
                          DC      /D4F7      7                          PMN24370
                          DC      /E4F8      8                          PMN24380
                          DC      /E0F9      9                          PMN24390
                          DC      /3CC1      A                          PMN24400
                          DC      /18C2      B                          PMN24410
                          DC      /1CC3      C                          PMN24420
                          DC      /30C4      D                          PMN24430
                          DC      /34C5      E                          PMN24440
                          DC      /10C6      F                          PMN24450
                          DC      /14C7      G                          PMN24460
                          DC      /24C8      H                          PMN24470
                          DC      /20C9      I                          PMN24480
                          DC      /7CD1      J                          PMN24490
                          DC      /58D2      K                          PMN24500
                          DC      /5CD3      L                          PMN24510
                          DC      /70D4      M                          PMN24520
                          DC      /74D5      N                          PMN24530
                          DC      /50D6      O (ALPHA)                  PMN24540
                          DC      /54D7      P                          PMN24550
                          DC      /64D8      Q                          PMN24560
                          DC      /60D9      R                          PMN24570
                          DC      /98E2      S                          PMN24580
                          DC      /9CE3      T                          PMN24590
                          DC      /B0E4      U                          PMN24600
                          DC      /B4E5      V                          PMN24610
                          DC      /90E6      W                          PMN24620
                          DC      /94E7      X                          PMN24630
                          DC      /A4E8      Y                          PMN24640
                          DC      /A0E9      Z                          PMN24650
                          DC      /004B      PERIOD                     PMN24660
                          DC      /F65D      RIGHT PARENTHESIS          PMN24670
                          DC      /FE4D      LEFT PARENTHESIS           PMN24680
                          DC      /DA4E      PLUS                       PMN24690
                          DC      /4450      AMPERSAND                  PMN24700
                          DC      /405B      DOLLAR SIGN                PMN24710
                          DC      /D65C      ASTERISK                   PMN24720
                          DC      /C27E      EQUAL                      PMN24730
                          DC      /8460      MINUS                      PMN24740
                          DC      /BC61      SLASH                      PMN24750
                          DC      /806B      COMMA                      PMN24760
                          DC      /E67D      APOSTROPHE                 PMN24770
                          DC      /047C     AT SIGN                 212 PMN24771
                          DC      /C07B     POUND SIGN              212 PMN24772
                          DC      /DE4C     LESS THAN               212 PMN24773
                          DC      /066C     PERCENT                 212 PMN24774
                    *                                                   PMN24780
                          BSS     1          PATCH AREA             2-2 PMN24790
                    CP530 DC      0          *AREA                  2-1 PMN24800
                          HDNG    SYSTEM 2501/1442 SUBROUTINE           PMN24810
                    *************************************************** PMN24820
                    *                                                 * PMN24830
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN24840
                    *                                                 * PMN24850
                    *FUNCTION/OPERATION-                              * PMN24860
                    *     THIS IS A SUBROUTINE USED BY THE 1130       * PMN24870
                    *     MONITOR TO PERFORM THE FOLLOWING FUCTIONS   * PMN24880
                    *     ON THE 2501 CARD READ DEVICE AND THE 1442-5 * PMN24890
                    *     CARD PUNCH DEVICE-                          * PMN24900
                    *     *READ A CARD FROM THE 2501.                 * PMN24910
                    *     *PUNCH A CARD TO THE 1442-5.                * PMN24920
                    *                                                 * PMN24930
                    *ENTRY POINTS-                                    * PMN24940
                    *     *RP000+1 IS THE USER ENTRY.                 * PMN24950
                    *     *RP020+1 IS THE INTERRUPT LEVEL 4 ENTRY.    * PMN24960
                    *     *RP040+1 IS THE INTERRUPT LEVEL 0 ENTRY.    * PMN24970
                    *                                                 * PMN24980
                    *INPUT                                            * PMN24990
                    *     *READ A CARD FROM THE 2501                  * PMN25000
                    *      ACC = 7000                                 * PMN25010
                    *      EXT = ADDRESS OF I/O AREA                  * PMN25020
                    *     *PUNCH A CARD TO THE 1442-5                 * PMN25030
                    *      ACC = 7001                                 * PMN25040
                    *      EXT = ADDRESS OF I/O AREA                  * PMN25050
                    *     *READ A CARD FROM THE 2501                  * PMN25060
                    *      ACC = 7002                                 * PMN25070
                    *      EXT = ADDRESS OF I/O AREA                  * PMN25080
                    *     *FEED A CARD THROUGH THE 1442-5             * PMN25090
                    *      ACC = 7003                                 * PMN25100
                    *      EXT = ANYTHING                             * PMN25110
                    *     **THE I/O AREA CONSISTS OF ONE WORD OF      * PMN25120
                    *       COLUMN COUNT (MUST BE HEX 50 FOR A READ   * PMN25130
                    *       FUNCTION) FOLLOWED BY THAT MANY WORDS     * PMN25140
                    *       WHICH IN THE CASE OF A PUNCH FUNCTION ARE * PMN25150
                    *       12 BIT LEFT JUSTIFIED CARD CODE THE LAST  * PMN25160
                    *       OF WHICH IS A PUNCH STOP BIT.             * PMN25170
                    *                                                 * PMN25180
                    *OUTPUT-                                          * PMN25190
                    *     *READ- THE CARD JUST READ IS IN THE I/O AREA* PMN25200
                    *      IN 12 BIT LEFT JUSTIFIED CARD CODE.        * PMN25210
                    *     *PUNCH- THE I/O AREA WAS PUNCHED TO CARD.   * PMN25220
                    *                                                 * PMN25230
                    *EXTERNAL REFERENCES-                             * PMN25240
                    *     $CTSW                                       * PMN25250
                    *     $IBSY                                       * PMN25260
                    *     $IOCT                                   2-2 * PMN25270
                    *     $LAST                                       * PMN25280
                    *     $PRET                                       * PMN25290
                    *                                                 * PMN25300
                    *EXITS- NORMAL                                    * PMN25310
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * PMN25320
                    *      HAS BEEN INITIATED.                        * PMN25330
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * PMN25340
                    *      SUBROUTINE AFTER AN INTERRUPT HAS BEEN     * PMN25350
                    *      SERVICED.                                  * PMN25360
                    *                                                 * PMN25370
                    *EXITS- ERROR                                     * PMN25380
                    *     EXIT TO $PRET ON NOT READY CONDITION        * PMN25390
                    *     *DISPLAYING HEX 1000 FOR 1442-5.            * PMN25400
                    *     *DISPLAYING HEX 4000 FOR 2501.              * PMN25410
                    *                                                 * PMN25420
                    *TABLES/WORK AREAS- NONE                          * PMN25430
                    *                                                 * PMN25440
                    *ATTRIBUTES-                                      * PMN25450
                    *     *NATURALLY RELOCATABLE.                     * PMN25460
                    *     *REUSABLE.                                  * PMN25470
                    *                                                 * PMN25480
                    *NOTES- NONE                                      * PMN25490
                    *                                                 * PMN25500
                    *************************************************** PMN25510
                          HDNG    SYSTEM 2501/1442 SUBROUTINE           PMN25520
                          ORG     0                                     PMN25530
*SBRKDD  8F         *SYS 2501/1442                                V2M02 PMN25540
                          DC      0          WORD CNT OF SYS 2501 SUBR  PMN25550
                          DC      @2501      PHASE ID OF SYS 2501 SUBR  PMN25560
                          HDNG    SYSTEM 2501/1442 SUBROUTINE           PMN25570
                    RP000 BSC  L  *-*        ENTER 2ND WORD OF INSTR    PMN25580
                          MDX     RP320      BR TO PROCESS CALL         PMN25590
                    *                                                   PMN25600
                    RP020 BSC  L  *-*        END OF CARD INTERRUPT      PMN25610
                          MDX     RP080      PROCESS END OF CARD INTRP  PMN25620
                    *************************************************** PMN25630
                    *                                                   PMN25640
                    *             PROCESS PUNCH REQUEST INTERRUPT       PMN25650
                    *                                                   PMN25660
                    RP040 BOSC L  *-*        LEVEL 0 INT -1442 ONLY-    PMN25670
                          STD     RP480      SAVE ACC AND EXT           PMN25680
                          STS     RP060      SAVE STATUS                PMN25690
                          XIO     RP500      PUNCH A COLUMN             PMN25700
                          LD      RP500      INCR COLUMN ADDRESS        PMN25710
                          A       RP640      *FOR PUNCH                 PMN25720
                          STO     RP500                                 PMN25730
                          XIO     RP540-1    SENSE WITH RESET LEVEL 0   PMN25740
                          LDD     RP480      RELOAD ACC AND EXT         PMN25750
                    RP060 LDS     0          RESET STATUS               PMN25760
                          MDX     RP040      TURN OFF INTERRUPT         PMN25770
                    *                                                   PMN25780
                    *************************************************** PMN25790
                    RP080 XIO     RP200-1    SENSE DSW WITH RESET       PMN25800
                          SLA     2                                     PMN25810
                          BSC     +Z         ERROR INDICATOR ON         PMN25820
                          MDX     RP140      BRANCH IF YES              PMN25830
                          SLA     1          NO ERROR.  IS LAST CARD    PMN25840
                          BSC     +Z         *INDICATOR ON.             PMN25850
                          MDX     RP220      BRANCH IF YES              PMN25860
                    RP100 SLA     16                                    PMN25870
                          STO  L  $IBSY      CLEAR PROGRAM BUSY INDIC   PMN25880
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 PMN25890
                          NOP                IN CASE OF SKIP        2-2 PMN25900
                    *                                                   PMN25910
                    * BEFORE EXIT TEST IF THE CARD READ IN IS A CONTROL PMN25920
                    * CARD,INDICATED BY //BLANK IN COLUMNS 1-3,IF SO,   PMN25930
                    * SET THE CONTROL CARD SWITCH--CTLSW--IN LOW CORE   PMN25940
                    *                                                   PMN25950
                          LD      RP520      LOAD ADDRESS OF I/O AREA   PMN25960
                          STO     RP120+1    STORE IN                   PMN25970
                    RP120 LDX  L2 *-*        INDEX REGISTER 2           PMN25980
                          LD    2 2          LOAD SECOND WORD           PMN25990
                          RTE     16         PLACE IN EXTENSION         PMN26000
                          LD    2 1          FIRST WORD IN ACC          PMN26010
                          SD      RP720      TEST FOR //                PMN26020
                          BSC     +-         SKIP IF ACC NON-ZERO       PMN26030
                          RTE     16         ACC = 0, CHECK IF EXT = 0  PMN26040
                          BSC     Z          NO,RETURN TO ILS04         PMN26050
                          MDX     RP020                                 PMN26060
                          LD    2 3          CHECK THIRD WORD FOR       PMN26070
                          BSC     Z          ZERO--BLANK COL.IN CARD    PMN26080
                          MDX     RP020      NO,RETURN TO ILS04         PMN26090
                          STX  L0 $CTSW      FOUND //BLANK,SET SWITCH   PMN26100
                          MDX     RP020      RETURN TO ILS04            PMN26110
                    RP140 LD      RP520                                 PMN26120
                          STO     RP500      RESET ADDRESSES TO FIRST   PMN26130
                          STO     RP600      RESET TO ADDRESS OF WD CNT PMN26140
                          LD      RP200      WHICH DVC IS IN USE        PMN26150
                          BSC     E          SKIP IF 1442               PMN26160
                          MDX     RP160-1    *ELSE TEST 2501            PMN26170
                          BSI     RP240+1    TEST 1442 READY            PMN26180
                          MDX     RP160      TO REPEAT LAST FUNCTION    PMN26190
                          BSI     RP280+1    TEST 2501 READY            PMN26200
                    RP160 XIO     RP620-1    REPEAT LAST FUNCTION       PMN26210
                          MDX     RP020      RETURN TO ILS04            PMN26220
                    *                                                   PMN26230
                    **************************************M************ PMN26240
                    *                                                   PMN26250
                    *               CONSTANTS                           PMN26260
                    *                                                   PMN26270
                          BSS  E  0                                     PMN26280
                    RP180 DC      /1401      START 1442 PCH IOCC      E PMN26290
                    RP200 DC      /1702      SNS LEV 4 WITH RESET     O PMN26300
                    RP480 DC      *-*        SAVE ACCUMULATOR         E PMN26310
                          DC      *-*        SAVE EXTENSION           O PMN26320
                    RP500 DC      *-*        CURRENT COL ADDRESS      E PMN26330
                          DC      /1100      PUNCH A COLUMN           O PMN26340
                    RP520 DC      *-*        RESTART INFORMATION      E PMN26350
                    RP540 DC      /1701      SENSE LEVEL 0 WITH RESET O PMN26360
                    RP560 DC      /4E00      INITIATE 2501 READ       E PMN26370
                    RP580 DC      /4F01      SENSE 2501 WITH RESET    O PMN26380
                    RP600 DC      *-*        WD CNT ADRS FOR 2501     E PMN26390
                    RP620 DC      *-*        PRESET CONTROL FUNCTION  O PMN26400
                    RP640 DC      1          CONSTANT                 E PMN26410
                    RP660 DC      /1402      FEED CARD FROM 1442      O PMN26420
                    RP680 DC      /1000      CONSTANT                 E PMN26430
                    RP700 DC      /1702      SENSE LEV 4 W/RESET 1442 O PMN26440
                    RP720 DC      /3000      CONSTANTS,REPRESENT SLASH  PMN26450
                          DC      /3000      IN IBM CARD CODE           PMN26460
                    RP740 DC      /4000      CONSTANT                   PMN26470
                    *************************************************** PMN26480
                    *                                                   PMN26490
                    *                   LAST CARD SUBROUTINE            PMN26500
                    *                                                   PMN26510
                    RP220 LD      RP200                                 PMN26520
                          BSC     E         1442, SET $LAST POSITIVE    PMN26530
                          LD      *-1       2501, SET $LAST NEGATIVE212 PMN26540
                          STO  L  $LAST                                 PMN26560
                          MDX     RP100                                 PMN26570
                    *                                                   PMN26580
                    *                   1442-5 READY TEST               PMN26590
                    *                                                   PMN26600
                    RP240 BSC  L  *-*                                   PMN26610
                          XIO     RP700-1    SENSE 1442 W/RESET         PMN26620
                          BSC     E          FALL THRU IF NR            PMN26630
                          MDX     RP260      TO DISPLAY ERROR CODE      PMN26640
                          LD      RP700      CHANGE 2501 SENSE W/RESET  PMN26650
                          STO     RP200      *TO 1442 SENSE W/RESET     PMN26660
                          MDX     RP240      1442 IS READY              PMN26670
                    RP260 LD      RP680      FETCH DISPLAY CODE         PMN26680
                          BSI  L  $PRET      TO PREOPERATIVE ERROR TRAP PMN26690
                          MDX     RP240+2    RETEST                     PMN26700
                    *                                                   PMN26710
                    *                   2501 READY TEST                 PMN26720
                    RP280 BSC  L  *-*                                   PMN26730
                          XIO     RP580-1    SENSE 2501 W/RESET         PMN26740
                          BSC     E          FALL THRU IF NOT READY     PMN26750
                          MDX     RP300      TO SETUP ERROR CODE        PMN26760
                          LD      RP580      CHANGE 1442 SENSE W/RESET  PMN26770
                          STO     RP200      *TO 2501 SENSE W/RESET     PMN26780
                          MDX     RP280      2501 IS READY              PMN26790
                    RP300 LD      RP740      FETCH DISPLAY CODE         PMN26800
                          BSI  L  $PRET      TO PREOPERATIVE ERROR TRAP PMN26810
                          MDX     RP280+2    RETEST FOR READY           PMN26820
                    *                                                   PMN26830
                    **************************************M************ PMN26840
                    *                                                   PMN26850
                    *     2501 READER   CALL PROCESSING                 PMN26860
                    *                                                   PMN26870
                    RP400 BSI     RP280+1    TO TEST 2501 READY         PMN26880
                          LD      RP560      SET UP CTRL IOCC TO START  PMN26890
                          STO     RP620      *2501 READER               PMN26900
                          RTE     16         ROTATE I/O AREA ADDR IN    PMN26910
                          STO     RP600      WORD COUNT                 PMN26920
                    RP420 STO     RP520      SAVE FOR RESTART PROC      PMN26930
                          STX  L0 $IBSY      TURN ON BUSY INDICATOR     PMN26940
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 PMN26950
                    RP410 XIO     RP620-1    START DEVICE               PMN26960
                    RP440 LDS     0          RESET STATUS               PMN26970
                          MDX     RP000      RETURN TO CALLING PROGRAM  PMN26980
                    *                                                   PMN26990
                    *************************************************** PMN27000
                    *                                                   PMN27010
                    *             GENERAL CALL PROCESSING               PMN27020
                    *                                                   PMN27030
                    RP320 STS     RP440      SAVE STATUS                PMN27040
                          STO     RP360      DECODE CALLING FUNCTION    PMN27050
                    RP340 MDX  L  $IBSY,0    TEST PROGRAM BUSY          PMN27060
                          MDX     RP340      LOOP UNTIL NOT BUSY        PMN27070
                    RP360 DC      *-*        TO CONTAIN MDX INSTRUC     PMN27080
                          MDX     RP400      READ                       PMN27090
                          MDX     RP460      PUNCH                      PMN27100
                          MDX     RP400      READ                       PMN27110
                    *                                                   PMN27120
                    *************************************************** PMN27130
                    *                                                   PMN27140
                    *             1442 FEED    CALL PROCESSING          PMN27150
                    *                                                   PMN27160
                    RP380 BSI     RP240+1    TEST READY ON 1442-5       PMN27170
                          LD      RP660      SETUP FEED IOCC            PMN27180
                          STO     RP620                                 PMN27190
                          LD   L  $LAST      TEST LAST CARD INDICATOR   PMN27200
                          BSC     +-         SKIP IF ON                 PMN27210
                          MDX     RP420+1    GO SET BUSY + START FEED   PMN27220
                          SLA     16                                    PMN27230
                          STO  L  $LAST      CLEAR LAST CARD INDICATOR  PMN27240
                          MDX     RP410      DO NOT SET BUSY ON         PMN27250
                    *                                                   PMN27260
                    *************************************************** PMN27270
                    *                                                   PMN27280
                    *             1442 PUNCH   CALL PROCESSING          PMN27290
                    *                                                   PMN27300
                    RP460 BSI     RP240+1    TO TEST 1442 READY         PMN27310
                          LD      RP180      SETUP CONTROL IOCC TO      PMN27320
                          STO     RP620      START CARD PUNCH           PMN27330
                          RTE     16                                    PMN27340
                          A       RP640      BUMP TO ADDR OF DATA WD 1  PMN27350
                          STO     RP500      SET UP ADDR OF FIRST COL   PMN27360
                          MDX     RP420      TO SET BUSY AND START      PMN27370
                    *                                                   PMN27380
                    *                                                   PMN27390
                    * PATCH AREA                                        PMN27400
                    *                                                   PMN27410
                          BSS     /9D-*     PATCH AREA              212 PMN27420
                          DC      /2542                                 PMN27430
                          HDNG    SYSTEM 1442/1442 SUBROUTINE           PMN27440
                    *************************************************** PMN27450
                    *                                                 * PMN27455
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN27460
                    *                                                 * PMN27470
                    *FUNCTION/OPERATION-                              * PMN27480
                    *   * READ WITHOUT CONVERSION                     * PMN27490
                    *   * PUNCH                                       * PMN27500
                    *   * READ WITH CONVERSION  (SEE NOTES)           * PMN27510
                    *   * FEED                                        * PMN27520
                    *                                                 * PMN27530
                    *ENTRY POINTS-                                    * PMN27540
                    *   * CD000+1 IS THE USER ENTRY                   * PMN27550
                    *   * CD010+1 IS THE END OF CARD INTERRUPT ENTRY  * PMN27560
                    *   * CD016+1 IS THE COLUMN INTERRUPT ENTRY       * PMN27570
                    *                                                 * PMN27580
                    *INPUT-                                           * PMN27590
                    *   * READ WITHOUT CONVERSION                     * PMN27600
                    *     ACC = 7000                                  * PMN27610
                    *     EXT = ADDRESS OF I/O AREA  (WORD COUNT)     * PMN27620
                    *   * PUNCH                                       * PMN27630
                    *     ACC = 7001                                  * PMN27640
                    *     EXT = ADDRESS OF I/O AREA  (WORD COUNT)     * PMN27650
                    *     LAST COLUMN TO BE PUNCHED CONTAINS          * PMN27660
                    *     1142 PUNCH STOP BIT  (BIT 12)               * PMN27670
                    *   * READ WITH CONVERSION                        * PMN27680
                    *     ACC = 7002                                  * PMN27690
                    *     EXT = ADDRESS OF I/O AREA  (WORD COUNT)     * PMN27700
                    *   * FEED                                        * PMN27710
                    *     ACC = 7003                                  * PMN27720
                    *                                                 * PMN27730
                    *OUTPUT-                                          * PMN27740
                    *   * I/O AREA OF 80 WORDS CONTAINING ALL         * PMN27750
                    *     COLUMN IMAGES OF CARD JUST READ             * PMN27760
                    *   * PUNCHED CARD, THE NUMBER OF COLUMNS PUNCHED * PMN27770
                    *     DETERMINED BY THE POSITION OF THE           * PMN27780
                    *     1442 PUNCH STOP BIT                         * PMN27790
                    *   * CARD (OR CARDS) ADVANCED ON STATION         * PMN27800
                    *     IN 1442. FROM READ STATION TO PUNCH         * PMN27810
                    *     STATION, OR FROM PUNCH TO STACKER           * PMN27820
                    *                                                 * PMN27830
                    *EXTERNAL REFERENCES-                             * PMN27840
                    *     $CTSW                                       * PMN27850
                    *     $IBSY                                       * PMN27860
                    *     $IOCT                                   2-2 * PMN27870
                    *     $PRET                                       * PMN27880
                    *     $PST4                                       * PMN27890
                    *                                                 * PMN27900
                    *EXITS-                                           * PMN27910
                    *   NORMAL-                                       * PMN27920
                    *      * SUBROUTINE RETURNS TO USER AFTER         * PMN27930
                    *        FUNCTION HAS BEEN INITIATED              * PMN27940
                    *      * SUBROUTINE RETURNS TO POINT OF           * PMN27950
                    *        INTERRUPTION AFTER A COLUMN INTERRUPT    * PMN27960
                    *        (LEVEL 0) HAS BEEN SERVICED              * PMN27970
                    *      * SUBROUTINE RETURNS TO INTERRUPT LEVEL    * PMN27980
                    *        SUBROUTINE (ILS04) AFTER THE END OF CARD * PMN27990
                    *        INTERRUPT HAS BEEN SERVICED              * PMN28000
                    *   ERROR-                                        * PMN28010
                    *      * $PRET WITH 1000 IN THE ACCUMULATOR WHEN  * PMN28020
                    *        THE 1442 IS NOT READY TO INITIATE A      * PMN28030
                    *        FUNCTION                                 * PMN28040
                    *      * $PST4 WITH 1000 IN THE ACCUMULATOR WHEN  * PMN28050
                    *        AN ERROR HAS OCCURRED AND THE 1442 IS    * PMN28060
                    *        NOT READY TO RETRY THE FUNCTION          * PMN28070
                    *      * SUBROUTINE RETURNS TO USER WITH $CTSW    * PMN28080
                    *        SET NON-ZERO AFTER A MONITOR CONTROL     * PMN28090
                    *        CARD (// IN COLUMNS 1-2) HAS BEEN READ   * PMN28100
                    *      * SUBROUTINE RETURNS TO USER WITH $LAST    * PMN28110
                    *        SET NON-ZERO IF 1442 IS IN LAST          * PMN28120
                    *        CARD SEQUENCE                            * PMN28130
                    *                                                 * PMN28140
                    *TABLES/WORK AREAS-N/A                            * PMN28150
                    *                                                 * PMN28160
                    *ATTRIBUTES-                                      * PMN28170
                    *   * NATURALLY RELOCATABLE                       * PMN28180
                    *   * SERIALLY REUSEABLE                          * PMN28190
                    *                                                 * PMN28200
                    *NOTES-                                           * PMN28210
                    *   CONVERSION OF INPUT TO UNPACKED EBCDIC IS     * PMN28220
                    *   PROVIDED BY THE SYSTEM KEYBOARD AND THE       * PMN28230
                    *   SYSTEM PAPER TAPE SUBROUTINES. THIS           * PMN28240
                    *   CONVERSION IS NOT PERFORMED BY EITHER         * PMN28250
                    *   SYSTEM CARD SUBROUTINE BECAUSE OF SPEED       * PMN28260
                    *   PERFORMANCE CONSIDERATIONS.  AN ENTRY POINT   * PMN28270
                    *   FOR READ WITH CONVERSION WAS PROVIDED TO      * PMN28280
                    *   RELIEVE THE CALLING PROGRAM OF DEVICE         * PMN28290
                    *   DEPENDENT CODING                              * PMN28300
                    *************************************************** PMN28310
                          HDNG    SYSTEM 1442/1442 SUBROUTINE           PMN28320
                          ORG     0                                     PMN28330
*SBRKGPW 90         *SYS 1442/1442                                V2M04 PMN28340
                          DC      CD990-CD000+1  WORD CNT OF SYS 1442   PMN28350
                          DC      @1442          PHASE ID OF SYS 1442   PMN28360
                          HDNG    SYSTEM 1442/1442 SUBROUTINE           PMN28370
                    CD000 BSC  L  *-*       EXIT/ENTRY                  PMN28380
                          MDX     CD080     GO TO CALL PROCESSING       PMN28390
                    *                                                   PMN28400
                    *             END OF CARD INTERRUPT    (LEVEL 4)    PMN28410
                    *                                                   PMN28420
                    CD010 BSC  L  *-*       EXIT/ENTRY                  PMN28430
                          MDX     CD020                                 PMN28440
                    *                                                   PMN28450
                    *             COLUMN INTERRUPTS   (LEVEL 0)         PMN28460
                    *                                                   PMN28470
                    CD016 BOSC L  *-*       EXIT (LEVEL 0 OFF)/ENTER    PMN28480
                          STD     CD190     SAVE ACC AND EXTENSION      PMN28490
                          STS     CD018     SAVE STATUS INDICATORS      PMN28500
                          XIO     CD210     RESET LEVEL 0 DSW           PMN28510
                          XIO     CD250     READ OR PUNCH COLUMN        PMN28520
                          LD      CD250     ADD 1 TO COLUMN ADDRESS     PMN28530
                          A       CD240     OF READ OR PUNCH COLUMN     PMN28540
                          STO     CD250     IOCC FOR NEXT COLUMN        PMN28550
                          LDD     CD190     RELOAD ACC AND EXTENSION    PMN28560
                    CD018 LDS     0         RELOAD STATUS INDICATORS    PMN28570
                          MDX     CD016     GO TO LEVEL 0 EXIT          PMN28580
                    *                                                   PMN28590
                    CD020 LDX  L1 $PRET     ADDRESS OF SOFTWARE TRAP    PMN28600
                          XIO     CD215                                 PMN28610
                          SLA     3         SAVE ERROR BIT IN CARRY     PMN28620
                          STO     CD280     SAVE SHIFTED DSW        2-9 PMN28630
                          BSC     C         IF NO ERROR CHECK LAST CARD PMN28640
                          MDX     CD050     ERROR  CONTINUE AT CD050    PMN28650
                          BSC     +Z        MINUS IF LAST CARD      2-7 PMN28660
                          MDX     CD030     BR IF LAST CARD         2-7 PMN28670
                          LD      CD188                             2-9 PMN28680
                          BSC     +-        TEST IF LAST OP WAS SKIP2-9 PMN28690
                          MDX     CD030     CONTINUE IF NOT SKIP    2-9 PMN28700
                          SLA     16                                2-9 PMN28710
                          STO     CD188     RESET SKIP INDICATOR    2-9 PMN28720
                          MDX     CD060     CONT WITH PREVIOUS FUNCT2-9 PMN28730
                    *                                               2-9 PMN28740
                    *                                                   PMN28750
                    *     NO ERRORS IN CARD JUST COMPLETED              PMN28760
                    *                                                   PMN28770
                    CD030 SLA     16                                    PMN28780
                          STO   1 $IBSY-X1  SET I/O BUSY SW = ZERO      PMN28790
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 PMN28800
                          NOP                IN CASE OF SKIP        2-2 PMN28810
                          LD      CD210     FETCH ADDR OF 1ST COLUMN    PMN28820
                          STO     CD034+1   AND INITLZ LDX INSTRUCTION  PMN28830
                    CD034 LDX  L2 *-*                                   PMN28840
                          LD    2 +1                                    PMN28850
                          RTE     16        PLACE FIRST TWO COLUMNS     PMN28860
                          LD    2 0         IN ACC AND EXTENSION        PMN28870
                          SD      CD280+1   SD FROM ODD LOC FOR //  2-9 PMN28880
                          BSC     +-                                    PMN28890
                          RTE     16        CHECK 1ST TWO COLUMNS       PMN28900
                          BSC     Z         FOR DOUBLE SLASH (//)       PMN28910
                          MDX     CD010     EXIT IF NOT EQUAL           PMN28920
                          LD    2 +2        IF EQUAL CHECK 3RD          PMN28930
                          BSC     Z         COLUMN FOR BLANK            PMN28940
                          MDX     CD010     EXIT IF NOT EQUAL           PMN28950
                          STX  L0 $CTSW     SET RECORD TRAP SW NON-ZERO PMN28960
                          MDX     CD010     GO TO LEVEL 4 EXIT          PMN28970
                    *                                                   PMN28980
                    *     CARD JUST COMPLETED WITH ERROR INDICATOR ON   PMN28990
                    *                                                   PMN29000
                    CD050 LD      CD230     IF FUNCTION WAS PUNCH,      PMN29010
                          EOR     CD204     DO NOT SKIP 1ST CARD        PMN29020
                          BSC     +-                                    PMN29030
                          MDX     CD060     FUNCTION IS PUNCH           PMN29040
                          LD      CD250     READ FUNCTION           2-9 PMN29050
                          EOR     CD210                             2-9 PMN29060
                          BSC     +-        IF NO COL READ          2-9 PMN29070
                          MDX     CD055     *SET SKIP INDICATOR     2-9 PMN29080
                          LD      CD280     IF COLS READ            2-9 PMN29090
                          BSC     -         *AND LAST CD, SKIP      2-9 PMN29100
                          MDX     CD060     *ELSE DO NOT SET SKIP   2-9 PMN29110
                    CD055 STX   0 CD188     SET SKIP INDICATOR      2-9 PMN29120
                    CD060 XIO     CD210     TEST FOR 1442 READY         PMN29130
                          BSC     E         IF BIT 15 OF ACC = 1,       PMN29140
                          MDX     CD070     1442 IS NOT READY           PMN29150
                    *                                                   PMN29160
                    *     1442 IS READY FOR RE-INITIATION OF OPERATION  PMN29170
                    *                                                   PMN29180
                          LD      CD188     IF SKIP 1ST CARD INDICATOR  PMN29190
                          BSC     +-        IS ON, TAKE O5E FEED CYCLE  PMN29200
                          MDX     CD066     SKIP IND IS NOT ON          PMN29210
                          XIO     CD240     INITIATE FEED OPERATION     PMN29220
                          MDX     CD010     GO TO LEVEL 4 EXIT          PMN29230
                    CD066 LD      CD210     RESET COLUMN IOCC           PMN29240
                          STO     CD250     FOR FIRST COLUMN            PMN29250
                          XIO     CD220     RESTART LAST OPERATION      PMN29260
                          MDX     CD010     GO TO LEVEL 4 EXIT          PMN29270
                    *                                                   PMN29280
                    *     1442 IS NOT READY TO REPEAT LAST OPERATION    PMN29290
                    *                                                   PMN29300
                    CD070 LD      CD220     1442 NOT READY CODE = 1000  PMN29310
                          BSI   1 $PST4-X1  WAIT AT INTRPT 4 TRAP       PMN29320
                          MDX     CD060     REPEAT TEST FOR 1442 READY  PMN29330
                    *                                                   PMN29340
                    *             CONTINUE CALL PROCESSING              PMN29350
                    *                                                   PMN29360
                    CD080 STS     CD120     SAVE STATUS INDICATORS      PMN29370
                    *                                                   PMN29380
                    *             DECODE FUNCTION IN ACC                PMN29390
                    *                                                   PMN29400
                          STO     CD090                                 PMN29410
                    CD090 DC      *-*       BRANCH TO PROPER FUNCTION   PMN29420
                          MDX     CD100     7000 = READ W/O CONVERSION  PMN29430
                          MDX     CD130     7001 = PUNCH                PMN29440
                          MDX     CD100     7002 = READ WITH CONV.      PMN29450
                    *                                                   PMN29460
                    *             7003 = FEED A CARD                    PMN29470
                    *                                                   PMN29480
                          BSI     CD140+1   COMMON INITLZ SUBROUTINE    PMN29490
                          XIO     CD240     FEED CARD                   PMN29500
                          LD   L  $LAST     IF LAST CARD, NO EOC        PMN29510
                          BSC     +-        INTRPT AFTER CARD FEED.     PMN29520
                          MDX     CD110+1   THEREFORE CLEAR LAST CARD   PMN29530
                          SLA     16        IND, BUT DO NOT SET I/O     PMN29540
                          STO  L  $LAST     BUSY SWITCH NON-ZERO.       PMN29550
                          MDX     CD120     GO TO LOAD STATUS           PMN29560
                    *                                                   PMN29570
                    *             FUNCTION IS READ                      PMN29580
                    *                                                   PMN29590
                    CD100 BSI     CD140+1   COMMON INITLZ SUBROUTINE    PMN29600
                          LD      CD190     GET I/O AREA ADDR       2-3 PMN29610
                          RTE     16        GET DSW BACK TO ACC     2-3 PMN29620
                          SLA     3         TEST IF LAST CARD READ  2-3 PMN29630
                          BSC     -         *BY USER PROG           2-3 PMN29640
                          MDX     CD101     *NO BRANCH              2-3 PMN29650
                          XIO     CD240     *YES,FEED CARD FROM PNCH2-3 PMN29660
                          SLA     16                                    PMN29670
                          STO  L  $LAST                                 PMN29680
                          MDX     CD184     BR TO DISPLAY NOT RDY   2-3 PMN29690
                    CD101 LDD     CD200     SET-UP CONTROL 1442 IOCC    PMN29700
                    CD102 STO     CD230     TO START READER OR PUNCH    PMN29710
                          RTE     16        SET-UP COLUMN 1442 IOCC     PMN29720
                          STO     CD260     TO READ OR PUNCH A COLUMN   PMN29730
                    CD110 XIO     CD220     START READER OR PUNCH       PMN29740
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 PMN29750
                          STX  L0 $IBSY     SET I/O BUSY SW NON-ZERO    PMN29760
                    CD120 LDS     0         RELOAD STATUS INDICATORS    PMN29770
                          MDX     CD000     GO TO CALL EXIT             PMN29780
                    *                                                   PMN29790
                    *             FUNCTION IS PUNCH                     PMN29800
                    *                                                   PMN29810
                    CD130 BSI     CD140+1   COMMON INITLZ SUBROUTINE    PMN29820
                          LDD     CD204     SET-UP PUNCH IOCC'S         PMN29830
                          MDX     CD102     CONTINUE FIXING IOCC'S      PMN29840
                    *             IOCC'S AND CONSTANTS                  PMN29850
                    *                                                   PMN29860
                          BSS  E  0         ADJUST IC TO EVEN           PMN29870
                    CD190 BSS     2         SAVE OF ACC AND EXTENSION   PMN29880
                    CD210 DC      *-*       RESET 1ST COLUMN ADDR       PMN29890
                          DC      /1701     SENSE 1442 DSW (RESET 0)    PMN29900
                    CD215 DC      0         1ST WORD OF SENSE DSW IOCC  PMN29910
                          DC      /1702     SENSE DSW , LEVEL 4 W/RESET PMN29920
                    CD250 DC      *-*       CURRENT COLUMN ADDRESS      PMN29930
                    CD260 DC      *-*       READ OR PUNCH COLUMN IOCC   PMN29940
                    CD240 DC      1         INCREMENTS COL. ADDR        PMN29950
                          DC      /1402     IOCC FEED CARD              PMN29960
                    CD200 DC      /1404     START READER WHEN AT CD230  PMN29970
                          DC      /1200     READ COLUMN WHEN AT CD260   PMN29980
                    CD204 DC      /1401     START PUNCH WHEN AT CD230   PMN29990
                          DC      /1100     PUNCH COLUMN WHEN AT CD260  PMN30000
                    CD220 DC      /1000     1442 NOT READY DISPLAY      PMN30010
                    CD230 DC      *-*       START READER OR PUNCH IOCC  PMN30020
                    CD280 DC      *-*       SHIFTED DEVICE STATUS WD2-9 PMN30030
                          DC      /3000     COL IMAGE // (ODD ADDR) 2-9 PMN30040
                    CD188 DC      *-*       SKIP 1ST CARD INDICATOR     PMN30050
                    X1    EQU     $PRET     XR1 INSTRUCTION POINTER     PMN30060
                    *                                                   PMN30070
                    *             COMMON INITIALIZATION SUBROUTINE      PMN30080
                    *                                                   PMN30090
                    CD140 BSC  L  *-*       EXIT/ENTRY                  PMN30100
                    CD150 MDX  L  $IBSY,0   LOOP UNTIL LAST FUNCTION    PMN30110
                          MDX     CD150     COMPLETE AND IBUSY = ZERO   PMN30120
                    CD160 XIO     CD210     TEST FOR 1442 READY         PMN30130
                          BSC     E         IF BIT 15 OF ACC = 1,       PMN30140
                          MDX     CD180     1442 IS NOT READY           PMN30150
                    *                                                   PMN30160
                    *             1442 READY TO INITIATE OPERATION      PMN30170
                    *                                                   PMN30180
                          RTE     16        PUT I/O AREA ADDR IN ACC    PMN30190
                          STO     CD190     SAVE I/O AREA ADDR      2-3 PMN30200
                          A       CD240     ADD 1 TO FORM COL. 1 ADDR   PMN30210
                          STO     CD250     SET-UP ADDR OF COLUMN IOCC  PMN30220
                          STO     CD210     FOR 1ST COLUMN              PMN30230
                          MDX     CD140     GO TO EXIT COMMON SUBRTNE   PMN30240
                    *                                                   PMN30250
                    *             1442 NOT READY TO INITIATE OPERATION  PMN30260
                    *                                                   PMN30270
                    CD180 SLA     3         SAVE ERROR BIT IN CARRY     PMN30280
                          LD      CD090     NO SKIP OF 1ST CARD         PMN30290
                          EOR     CD240     WHEN FUNCTION IS PUNCH      PMN30300
                          BSC     +-        FUNCTION = PUNCH IF NOT 0   PMN30310
                          MDX     CD184     PUNCH                       PMN30320
                          BSC     C         FUNCTION = READ. IF CARRY   PMN30330
                          STX   0 CD188     SET, SKIP 1ST CARD          PMN30340
                    CD184 LD      CD220     DISPLAY 1442 NOT READY CODE PMN30350
                          BSI  L  $PRET     WAIT AT PREOPERATIVE TRAP   PMN30360
                          MDX     CD160     REPEAT TEST FOR 1442 READY  PMN30370
                    *                                                   PMN30380
                          BSS     /AC-*                             212 PMN30390
                    CD990 DC      /FFFF     *AREA                       PMN30400
                          HDNG    SYSTEM 1134/1055 SUBROUTINE           PMN30410
                    *************************************************** PMN30420
                    *                                                 * PMN30430
                    *STATUS- VERSION 2, MODIFICATION LEVEL 7          * PMN30440
                    *                                                 * PMN30450
                    *FUNCTION/OPERATION-                              * PMN30460
                    *     *READ WITHOUT CONVERSION   (EBCDIC)         * PMN30470
                    *     *READ WITH CONVERSION   (PTTC/8)            * PMN30480
                    *     *PUNCH   (EBCDIC)                           * PMN30490
                    *                                                 * PMN30500
                    *ENTRY POINTS-                                    * PMN30510
                    *     *PI000+1 IS THE USER ENTRY.                 * PMN30520
                    *     *PT010+1 IS THE INTERRUPT ENTRY.            * PMN30530
                    *                                                 * PMN30540
                    *INPUT-                                           * PMN30550
                    *     *READ WITHOUT CONVERSION                    * PMN30560
                    *      ACC = 7000                                 * PMN30570
                    *      EXT = ADDRESS OF I/O AREA                  * PMN30580
                    *     *READ WITH CONVERSION                       * PMN30590
                    *      ACC = 7002                                 * PMN30600
                    *      EXT = ADDRESS OF I/O AREA                  * PMN30610
                    *     *PUNCH                                      * PMN30620
                    *      ACC = 7001                                 * PMN30630
                    *      EXT = ADDRESS OF I/O AREA                  * PMN30640
                    *     **THE I/O AREA CONSISTS OF ONE WORD OF WORD * PMN30650
                    *       COUNT FOLLOW BY THAT NUMBER OF WORDS OF   * PMN30660
                    *       PACKED EBCDIC.                            * PMN30670
                    *                                                 * PMN30680
                    *OUTPUT-                                          * PMN30690
                    *     *I/O AREA IN UNPACKED EBCDIC.               * PMN30700
                    *     *PUNCHED EBCDIC TAPE.                       * PMN30710
                    *                                                 * PMN30720
                    *EXTERNAL REFERENCES-                             * PMN30730
                    *     $CTSW                                       * PMN30740
                    *     $IBSY                                       * PMN30750
                    *     $IOCT                                   2-2 * PMN30760
                    *     $PRET                                       * PMN30770
                    *     $PST4                                       * PMN30780
                    *                                                 * PMN30790
                    *EXITS- NORMAL                                    * PMN30800
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * PMN30810
                    *      HAS BEEN INITIATED.                        * PMN30820
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * PMN30830
                    *      SUBROUTINE AFTER A INTERRUPT HAS BEEN      * PMN30840
                    *      SERVICED.                                  * PMN30850
                    *                                                 * PMN30860
                    *EXITS- ERROR                                     * PMN30870
                    *     *$PRET WITH 3000 IN THE ACCUMULATOR WHEN    * PMN30880
                    *      DEVICE NOT READY.                          * PMN30890
                    *                                                 * PMN30900
                    *TABLES/WORK AREAS-                               * PMN30910
                    *     PT780 IS A 119 WORD TABLE OF PTTC/8 TO      * PMN30920
                    *     EBCDIC CONVERSION WITH PTTC/8 IN BITS 0-7   * PMN30930
                    *     AND EBCDIC IN BITS 8-16.                    * PMN30940
                    *                                                 * PMN30950
                    *ATTRIBUTES-                                      * PMN30960
                    *     *NATURALLY RELOCATABLE.                     * PMN30970
                    *     *REUSABLE.                                  * PMN30980
                    *                                                 * PMN30990
                    *************************************************** PMN31000
                          HDNG    SYSTEM 1134/1055 SUBROUTINE           PMN31010
                          ORG     0                                     PMN31020
*SBRKSMC 91         *SYS 1134/1055                                V2M02 PMN31030
                          DC      PT790-*-1  WORD CNT OF SYS 1134 SUBR  PMN31040
                          DC      @1134      PHASE ID OF SYS 1134 SUBR  PMN31050
                          HDNG    SYSTEM 1134/1055 SUBROUTINE           PMN31060
                    PT000 BSC  L  *-*        ENTRY FROM MAIN (+2)       PMN31070
                          ORG     *-1                                   PMN31080
                          DC      PT780      ADDR OF CONV TBL FOR ASM   PMN31090
                          MDX     PT040      GO TO SERVICE              PMN31100
                    PT010 BSC  L  *-*        ENTRY FROM INTRPT   (+5)   PMN31110
                          LD      PT020      INITLZ SYST TRAP ADDR      PMN31120
                          STO     PT160+1    TO 'TEST DEV RDY' SUBR     PMN31130
                          MDX     PT170      GO TO SERVICE INTRPT       PMN31140
                    *                                                 * PMN31150
                    PT015 DC      1          CHANGED BY THE ASM         PMN31160
                    PT020 DC      $PST4      ADDR OF INTRPT TRAP ADDR   PMN31170
                    PT030 DC      $PRET      ADDR OF CALL TRAP ADDR     PMN31180
                    *                                                 * PMN31190
                    PT040 STO     PT060      SET UP FOR FUNCTION BRANCH PMN31200
                          LD   L  $IBSY      TEST SUBR BUSY INDR.       PMN31210
                          BSC     Z                                     PMN31220
                          MDX     *-4        LOOP UNTIL NOT BUSY        PMN31230
                    *                                                 * PMN31240
                          STO     PT310      INITLZ THE CASE SWITCH     PMN31250
                          STO     PT300      AND FILL-MODE SWITCH       PMN31260
                    *                        TO ZERO                  * PMN31270
                          LD      PT030      CALL SYSTEM TRAP ADDR      PMN31280
                          STO     PT160+1    TO 'TEST DEV RDY' SUBR     PMN31290
                          RTE     16                                    PMN31300
                          STO     *+3        FETCH THE WORD COUNT       PMN31310
                          A       PT015      AND I/O AREA ADDR          PMN31320
                          STO     PT340      AND ASSIGN THEM            PMN31330
                          LD   L  *-*        TO IN-LINE STORAGE         PMN31340
                          STO     PT360                                 PMN31350
                          STX   0 PT200+1                               PMN31360
                    PT050 LD      PT200+1    COMPUTE RELATIVE ADDR      PMN31370
                          A       PT320      OF I/O AREA POINTER.       PMN31380
                          STO     PT200+1    INITLZ IN-LINE             PMN31390
                          STO     PT130+1    CODING                     PMN31400
                          STO     PT270+1                               PMN31410
                    *                                                 * PMN31420
                    PT060 DC      0          FUNCTION BR (MDX *+ )      PMN31430
                          MDX     PT080      *TO HERE FOR READ EBC      PMN31440
                          MDX     PT090      *TO HERE FOR PUNCH,AND     PMN31450
                    PT070 STO     PT380      *TO HERE FOR READ PTTC/8   PMN31460
                    PT080 LD      PT350      SET READ INDR              PMN31470
                          MDX     PT090+1                               PMN31480
                    *                                                 * PMN31490
                    PT090 LD      PT330                                 PMN31500
                          STO     PT370                                 PMN31510
                          STO  L  $IBSY      TURN ON SUBR BUSY INDR     PMN31520
                          BSI     PT140      GO TO SENSE DEVICE RDY     PMN31530
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 PMN31540
                    *                                                 * PMN31550
                    PT100 LD      PT370      SET UP IOCC WORD           PMN31560
                          SLA     8          FOR READ/PUNCH             PMN31570
                          OR      PT390                                 PMN31580
                          STO     PT460+1                               PMN31590
                    *                                                 * PMN31600
                          STX   0 PT460      COMPUTE THE BUFFER         PMN31610
                    PT110 LD      PT460      ADDRESS FOR THE            PMN31620
                          A       PT400      IOCC INST                  PMN31630
                          STO     PT460                                 PMN31640
                    *                                                 * PMN31650
                          LD      PT370      DETERMINE WHAT SERVICE     PMN31660
                          BSC     E          REQUESTED                  PMN31670
                          MDX     PT130      GO TO PUNCH                PMN31680
                    *                                                 * PMN31690
                          XIO     PT450      EXEC A READER START        PMN31700
                    *                                                 * PMN31710
                          LD      PT510      SET TO COUNT FIRST 3 CHAR  PMN31720
                          STO     PT500      AS THEY ARE READ IN        PMN31730
                    *                                                 * PMN31740
                          LD      PT520      INITLZ SLASH CTR           PMN31750
                          STO     PT540      TO 3                       PMN31760
                    *                                                 * PMN31770
                    PT120 MDX     PT000      EXIT                       PMN31780
                    *                                                 * PMN31790
                    PT130 LD   I  *-*                                   PMN31800
                          STO     PT480                                 PMN31810
                    *                                                 * PMN31820
                          XIO     PT460      PUNCH FIRST WORD           PMN31830
                          MDX     PT120      RETURN TO MAIN             PMN31840
                    *                                                 * PMN31850
                          DC      /4C00      BRANCH BACK TO CALLER      PMN31860
                    PT140 DC      *-*        ENT HERE TO TEST DEVICE    PMN31870
                          LD      PT370      DETM DEVICE REQUESTED      PMN31880
                          BSC     E                                     PMN31890
                          MDX     *+1        SKIP TO SENSE PUNCH        PMN31900
                          MDX     PT150-1    GO TO SENSE READER         PMN31910
                    *                                                 * PMN31920
                          LD      PT410      MODIFY SHIFT INSTR TO      PMN31930
                          STO     PT150      SENSE FOR PUNCH            PMN31940
                    *                                                 * PMN31950
                          XIO     PT430      SENSE AND RESET            PMN31960
                    PT150 SLA     5          TEST FOR I/O               PMN31970
                          BSC     -          DEVICE READY               PMN31980
                    *                                                 * PMN31990
                          MDX     PT140-1    GO TO RETURN FROM TEST     PMN32000
                    *                                                 * PMN32010
                          LD      PT420      ERROR CD TO ACC AND        PMN32020
                    PT160 BSI  L  *-*        GO TO WAIT IF NOT RDY      PMN32030
                          MDX     PT150-1    TRY AGAIN                  PMN32040
                    *************************************************** PMN32050
                    *                                                 * PMN32060
                    *    THIS BLOCK OF CODING SERVICES                * PMN32070
                    *    AN INTERRUPT FOR READ/PUNCH                  * PMN32080
                    *                                                 * PMN32090
                    *************************************************** PMN32100
                    PT170 XIO     PT430      SENSE AND RESET            PMN32110
                          SLA     1                                     PMN32120
                          BSC     -          DETM SERVICE REQUEST       PMN32130
                          MDX     PT260      PUNCH REQUEST              PMN32140
                    PT180 XIO     PT460      READ A WORD                PMN32150
                    *                                                 * PMN32160
                    PT190 LD      PT380                                 PMN32170
                          BSC     Z          BRANCH IF NO CONV REQUEST  PMN32180
                          MDX     PT670      OTHERWISE, GO TO CONVERT   PMN32190
                          LD      PT480                                 PMN32200
                    PT200 STO  I  *-*        STORE THE WORD             PMN32210
                          LD      PT340      INCR THE I/O AREA POINTER  PMN32220
                          A       PT330                                 PMN32230
                          STO     PT340                                 PMN32240
                          LD      PT360      DECR THE WORD COUNT        PMN32250
                          S       PT330                                 PMN32260
                          STO     PT360                                 PMN32270
                          BSC     -Z                                    PMN32280
                          MDX     PT230      CHECK FILL-MODE SWITCH     PMN32290
                    *                                                 * PMN32300
                    PT210 SLA     16                                    PMN32310
                          STO     PT380                                 PMN32320
                          STO  L  $IBSY      TURN OFF SUBR BUSY INDR    PMN32330
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 PMN32340
                          NOP                IN CASE OF SKIP        2-2 PMN32350
                    PT220 MDX     PT010      EXIT                       PMN32360
                    *                                                 * PMN32370
                    PT230 LD      PT300                                 PMN32380
                          BSC     +-         TEST FILL-MODE SWITCH      PMN32390
                          MDX     *+2        BRANCH IF OFF              PMN32400
                          LD      PT640      OTHERWISE, FILL OUT        PMN32410
                    PT240 MDX     PT200      RECORD WITH BLANKS         PMN32420
                    *                                                 * PMN32430
                    PT250 BSI     PT140      GO TO TEST DEVC RDY        PMN32440
                          XIO     PT450      START THE READER           PMN32450
                          MDX     PT220      GO TO RETURN FROM INTRPT   PMN32460
                    *                                                 * PMN32470
                    *                                                 * PMN32480
                    PT260 LD      PT360      DECR THE WORD COUNT        PMN32490
                          S       PT330                                 PMN32500
                          STO     PT360                                 PMN32510
                          BSC     +                                     PMN32520
                          MDX     PT210      GO TO EXIT                 PMN32530
                          LD      PT340      INCR THE I/O AREA POINTER  PMN32540
                          A       PT330                                 PMN32550
                          STO     PT340                                 PMN32560
                    *                                                 * PMN32570
                    PT270 LD   I  *-*        FETCH WORD INTO BUFFER     PMN32580
                          STO     PT480                                 PMN32590
                    PT280 BSI     PT140      GO TO SENSE DEVICE RDY     PMN32600
                    *                                                 * PMN32610
                    PT290 XIO     PT460      PUNCH A WORD               PMN32620
                          MDX     PT220      GO TO EXIT                 PMN32630
                    *                                                 * PMN32640
                    PT300 DC      0          FILL-MODE SWITCH           PMN32650
                    PT310 DC      0          PTTC/8 CASE IND            PMN32660
                    *************************************************** PMN32670
                    *                                                 * PMN32680
                    *                                                 * PMN32690
                    *         FOLLOWING IS A TABLE OF                 * PMN32700
                    *         CONSTANTS AND STORAGE LOCATIONS         * PMN32710
                    *                                                 * PMN32720
                    *************************************************** PMN32730
                    PT320 DC      PT340-PT050  ADDR DISPLACEMENT        PMN32740
                    PT330 DC      /0001      PUNCH FUNC INDR            PMN32750
                    PT340 DC      0          STORAGE FOR I/O ADDRESS    PMN32760
                    PT350 DC      /0002      RD FUNC INDR               PMN32770
                    PT360 DC      0          STORAGE FOR WD CNT         PMN32780
                    PT370 DC      0          RD/PNCH IND SWTCH          PMN32790
                    PT380 DC      0          CONVERSION SWITCH          PMN32800
                    PT390 DC      /1800      PAPER TAPE AREA CODE       PMN32810
                    PT400 DC      PT480-PT110  ADDR DISPLACEMENT        PMN32820
                    PT410 DC      /1007      SHFT INSTR FOR PNCH SENSE  PMN32830
                          BSS  E  0                                     PMN32840
                    PT420 DC      /3000      DEVICE NOT RDY ERROR CODE  PMN32850
                    PT430 EQU     PT420                                 PMN32860
                          DC      /1F01      SENSE AND RESET            PMN32870
                    PT490 DC      /1000      PTTC/8 CODE FOR SPACE      PMN32880
                    PT450 EQU     PT490                                 PMN32890
                          DC      /1C10      THE READER                 PMN32900
                    PT460 DC      *-*        I/O CONTROL COMMAND        PMN32910
                          DC      0          PUNCH OR READ              PMN32920
                    PT470 DC      /3100      PTTC/8 CODE FOR SLASH      PMN32930
                    PT480 DC      *-*        STORAGE FOR I/O DATA       PMN32940
                    PT500 DC      0          INITIAL INPUT CNTR         PMN32950
                    PT510 DC      4          CONSTANT FOUR              PMN32960
                    PT520 DC      3          CONSTANT 3                 PMN32970
                    *************************************************** PMN32980
                    *         ENTER HERE TO CHECK INPUT               * PMN32990
                    *         FOR A MONITOR CONTROL RECORD            * PMN33000
                    *************************************************** PMN33010
                    PT530 DC      /700B      BR TO * +11                PMN33020
                    PT540 DC      0          SLASH COUNTER              PMN33030
                    *                                                   PMN33040
                    PT550 LD      PT540      ENTER HERE TO CHK FOR      PMN33050
                          S       PT330      A CONTROL RECORD           PMN33060
                          STO     PT540      DECR SLASH INDR            PMN33070
                          BSC     Z          SKIP IF TWO SLASHES CHEKED PMN33080
                    *                                                 * PMN33090
                          MDX     PT570      GO CHK FOR A SLASH         PMN33100
                    *                                                 * PMN33110
                          LD      PT480                                 PMN33120
                          S       PT490      IS 3RD CHAR A BLANK        PMN33130
                          BSC     Z          YES - SKIP                 PMN33140
                          MDX     PT560      NO - GO TO EXIT            PMN33150
                          LD      PT330                                 PMN33160
                          STO  L  $CTSW      IND INPUT IS CTRL RECORD   PMN33170
                    *                                                 * PMN33180
                    PT560 MDX     PT730-1    EXIT                       PMN33190
                    *                                                 * PMN33200
                    PT570 LD      PT480                                 PMN33210
                          S       PT470      CHECK FOR A SLASH          PMN33220
                          BSC     +-         SKIP IF NOT A SLASH        PMN33230
                          MDX     PT560      GO TO EXIT                 PMN33240
                    *                                                 * PMN33250
                    *                                                 * PMN33260
                          SLA     16         SET CNT TO AVOID           PMN33270
                          STO     PT500      FURTHER CHECKING           PMN33280
                          MDX     PT560      CHECKING AND EXIT          PMN33290
                    *************************************************** PMN33300
                    *                                                 * PMN33310
                    *    THIS BLOCK OF CODING PROVIDES                * PMN33320
                    *    FOR CONVERSION FROM PTTC/8 TO EBC.           * PMN33330
                    *    ALL OF THE CODING WHICH FOLLOWS IS           * PMN33340
                    *    CONCERNED WITH, AND ONLY WITH,               * PMN33350
                    *    THIS CONVERSION.                             * PMN33360
                    *************************************************** PMN33370
                    PT580 DC      /00FF      CONSTANT TO MASK BITS 0-7  PMN33380
                    PT582 DC      /FF00     PTTC/8                  2-7 PMN33390
                    PT590 DC      /7F00-/FF00                       2-7 PMN33400
                    PT600 DC      /0E00-/7F00  *CODE                    PMN33410
                    PT610 DC      /6E00-/0E00  *FOR                     PMN33420
                    PT620 DC      /8000        *SPECIAL                 PMN33430
                    PT630 DC      /DD00-/6E00  *CHARACTERS              PMN33440
                    PT640 DC      /0040      EBC BLANK                  PMN33450
                    PT660 DC      PT780-PT730  ADDR HELP FOR CONV       PMN33460
                    *                                                 * PMN33470
                    PT670 LD      PT480      COME HERE ON CONV REQ      PMN33480
                          S       PT582     IS CHARACTER SUPERDELETE2-7 PMN33490
                          BSC     +-        NO,SKIP                 2-7 PMN33500
                          MDX     PT250     YES,GO TO EXIT          2-7 PMN33510
                          S       PT590      IS CHAR A DELETE           PMN33520
                          BSC     +-         NO, BRANCH                 PMN33530
                          MDX     PT250      YES, GO TO EXIT            PMN33540
                          S       PT600      IS CHAR AN UP CASE         PMN33550
                          BSC     Z          YES, SKIP                  PMN33560
                          MDX     PT690      NO, BRANCH                 PMN33570
                          LD      PT620      INDICATE CASE AND          PMN33580
                    PT680 STO     PT310      SET CASE SWITCH            PMN33590
                          MDX     PT250      GO TO EXIT                 PMN33600
                    *                                                 * PMN33610
                    PT690 S       PT610      IS CHAR A LOW CASE         PMN33620
                          BSC     +-         NO, SKIP                   PMN33630
                          MDX     PT680      YES, GO TO SET INDR        PMN33640
                    PT700 S       PT630      IS CHAR A NEW LINE         PMN33650
                          BSC     +-         NO, SKIP                   PMN33660
                          MDX     PT710      YES, GO TO SET INDR        PMN33670
                          MDX     PT720      NO, GO TO TABLE LOOK-UP    PMN33680
                    *                                                 * PMN33690
                    *                                                 * PMN33700
                    PT710 LD      PT500      TEST FOR FIRST CHAR A NEW  PMN33710
                          EOR     PT510      * LINE                     PMN33720
                          BSC     +-         NO, SKIP                   PMN33730
                          MDX     PT250      GO TO EXIT                 PMN33740
                    *                                                 * PMN33750
                          LD      *-1        SET FILL SWITCH            PMN33760
                          STO     PT300      TO ON                      PMN33770
                          MDX     PT230+3    BR TO FILL RECORD W/BLANKS PMN33780
                    PT715 MDX     PT240                                 PMN33790
                    *                                                 * PMN33800
                    PT720 LD      PT500                                 PMN33810
                          S       PT330      DECR CHAR CNT              PMN33820
                          STO     PT500                                 PMN33830
                          BSC     -Z         SKIP TO CONVERT            PMN33840
                    *                                                 * PMN33850
                          MDX     PT550      BR TO SAVE FIRST 3 CHAR    PMN33860
                          STX     PT750+1    INITILZ TBL ADDR FOR       PMN33870
                    PT730 LD      PT750+1    *LOOPING TO SCAN THE       PMN33880
                          A       PT660      *CONV TABLE                PMN33890
                          STO     PT750+1                               PMN33900
                          STO     PT760+1                               PMN33910
                          LDX  L1 PT785-PT780  SIZE OF CONVERSION TABLE PMN33920
                    PT740 LD      PT480      FETCH WORD                 PMN33930
                          OR      PT310      DETM UPPER/LOWER CASE FOR  PMN33940
                    PT750 EOR  L1 *-*        COMPARE WITH TBL ENTRY     PMN33950
                          SRA     8          SHIFT OUT EBC              PMN33960
                          BSC     +-         SKIP IF NON ZERO RESULT    PMN33970
                          MDX     PT760      GO TO TREAT CONV CHAR      PMN33980
                          MDX   1 -1         DECR LOOP COUNTER          PMN33990
                          MDX     PT740      LOOP THRU SCAN             PMN34000
                    *                                                 * PMN34010
                          LD      PT780      INVALID CHAR DETECTED, GO  PMN34020
                          MDX     PT770      TO ST FF IN STRING         PMN34030
                    *                                                 * PMN34040
                    PT760 LD   L1 *-*        FETCH CONV CHAR            PMN34050
                    PT770 AND     PT580      CLEAR OUT PTTC/8 HALF      PMN34060
                          MDX     PT715                                 PMN34070
                    *************************************************** PMN34080
                    *                                                 * PMN34090
                    *                                                 * PMN34100
                    *    FOLLOWING IS A TABLE WITH                    * PMN34110
                    *    119 ACCEPTABLE PTTC/8 CODES                  * PMN34120
                    *    IN BITS 0-7, AND THEIR CORRESPONDING         * PMN34130
                    *    EBCDIC REPRESENTATION IN BITS 8-15.          * PMN34140
                    *                                                 * PMN34150
                    *                                                 * PMN34160
                    *                                                 * PMN34170
                    *************************************************** PMN34180
                    PT780 DC      /0050      INVAL CHAR CODE            PMN34190
                          DC      /704E      AMPERSAND                  PMN34200
                          DC      /0B7E      POUND                      PMN34210
                          DC      /207D      AT                         PMN34220
                          DC      /954D      PERCENT                    PMN34230
                          DC      /825D      LESS THAN                  PMN34240
                          DC      /6D05      HORIZONTAL TAB             PMN34250
                          DC      /5E16      BACKSPACE                  PMN34260
                          DC      /4C14      RESTORE                    PMN34270
                          DC      /3D25      LINE FEED                  PMN34280
                          DC      /3E26      END OF BLOCK               PMN34290
                          DC      /1040      SPACE                      PMN34300
                          DC      /01F1      1                          PMN34310
                          DC      /02F2      2                          PMN34320
                          DC      /13F3      3                          PMN34330
                          DC      /04F4      4                          PMN34340
                          DC      /15F5      5                          PMN34350
                          DC      /16F6      6                          PMN34360
                          DC      /07F7      7                          PMN34370
                          DC      /08F8      8                          PMN34380
                          DC      /19F9      9                          PMN34390
                          DC      /1AF0      0 (NUMERIC)                PMN34400
                          DC      /E1C1      A                          PMN34410
                          DC      /E2C2      B                          PMN34420
                          DC      /F3C3      C                          PMN34430
                          DC      /E4C4      D                          PMN34440
                          DC      /F5C5      E                          PMN34450
                          DC      /F6C6      F                          PMN34460
                          DC      /E7C7      G                          PMN34470
                          DC      /E8C8      H                          PMN34480
                          DC      /F9C9      I                          PMN34490
                          DC      /D1D1      J                          PMN34500
                          DC      /D2D2      K                          PMN34510
                          DC      /C3D3      L                          PMN34520
                          DC      /D4D4      M                          PMN34530
                          DC      /C5D5      N                          PMN34540
                          DC      /C6D6      O (ALPHA)                  PMN34550
                          DC      /D7D7      P                          PMN34560
                          DC      /D8D8      Q                          PMN34570
                          DC      /C9D9      R                          PMN34580
                          DC      /B2E2      S                          PMN34590
                          DC      /A3E3      T                          PMN34600
                          DC      /B4E4      U                          PMN34610
                          DC      /A5E5      V                          PMN34620
                          DC      /A6E6      W                          PMN34630
                          DC      /B7E7      X                          PMN34640
                          DC      /B8E8      Y                          PMN34650
                          DC      /A9E9      Z                          PMN34660
                          DC      /EB5F      LOGICAL NOT                PMN34670
                          DC      /F04E      PLUS                       PMN34680
                          DC      /DB5A      EXCLAMATION MARK           PMN34690
                          DC      /C06D      UNDERSCORE                 PMN34700
                          DC      /BB4F      LOGICAL OR                 PMN34710
                          DC      /A04A      CENT                       PMN34720
                          DC      /B16F      QUESTION MARK              PMN34730
                          DC      /994D      LEFT PARENTHESIS           PMN34740
                          DC      /9A5D      RIGHT PARENTHESIS          PMN34750
                          DC      /8B7F      QUOTE                      PMN34760
                          DC      /817E      EQUAL                      PMN34770
                          DC      /935E      SEMICOLON                  PMN34780
                          DC      /847A      COLON                      PMN34790
                          DC      /967D      APOSTROPHE                 PMN34800
                          DC      /876E      GREATER THAN               PMN34810
                          DC      /885C      ASTERISK                   PMN34820
                          DC      /6B4B      PERIOD                     PMN34830
                          DC      /5B5B      DOLLAR SIGN                PMN34840
                          DC      /4060      DASH                       PMN34850
                          DC      /3B6B      COMMA                      PMN34860
                          DC      /3161      SLASH                      PMN34870
                          DC      /ED05      NO GRAPHIC                 PMN34880
                          DC      /FC04      NO GRAPHIC                 PMN34890
                          DC      /FA79      NO GRAPHIC                 PMN34900
                          DC      /DE16      NO GRAPHIC                 PMN34910
                          DC      /CF17      NO GRAPHIC                 PMN34920
                          DC      /CC14      NO GRAPHIC                 PMN34930
                          DC      /CA49      NO GRAPHIC                 PMN34940
                          DC      /AC24      NO GRAPHIC                 PMN34950
                          DC      /B025      NO GRAPHIC                 PMN34960
                          DC      /BE26      NO GRAPHIC                 PMN34970
                          DC      /AF27      NO GRAPHIC                 PMN34980
                          DC      /AA69      NO GRAPHIC                 PMN34990
                          DC      /9C34      NO GRAPHIC                 PMN35000
                          DC      /9F37      NO GRAPHIC                 PMN35010
                          DC      /9040      NO GRAPHIC                 PMN35020
                          DC      /7C04      NO GRAPHIC                 PMN35030
                          DC      /6181      NO GRAPHIC                 PMN35040
                          DC      /6282      NO GRAPHIC                 PMN35050
                          DC      /7383      NO GRAPHIC                 PMN35060
                          DC      /6484      NO GRAPHIC                 PMN35070
                          DC      /7585      NO GRAPHIC                 PMN35080
                          DC      /7686      NO GRAPHIC                 PMN35090
                          DC      /6787      NO GRAPHIC                 PMN35100
                          DC      /6889      NO GRAPHIC                 PMN35110
                          DC      /79C0      NO GRAPHIC                 PMN35120
                          DC      /7A4B      NO GRAPHIC                 PMN35130
                          DC      /4F17      NO GRAPHIC                 PMN35140
                          DC      /5797      NO GRAPHIC                 PMN35150
                          DC      /5898      NO GRAPHIC                 PMN35160
                          DC      /4999      NO GRAPHIC                 PMN35170
                          DC      /4AD0      NO GRAPHIC                 PMN35180
                          DC      /5191      NO GRAPHIC                 PMN35190
                          DC      /5292      NO GRAPHIC                 PMN35200
                          DC      /4393      NO GRAPHIC                 PMN35210
                          DC      /5494      NO GRAPHIC                 PMN35220
                          DC      /4595      NO GRAPHIC                 PMN35230
                          DC      /4696      NO GRAPHIC                 PMN35240
                          DC      /2F27      NO GRAPHIC                 PMN35250
                          DC      /2C24      NO GRAPHIC                 PMN35260
                          DC      /32A0      NO GRAPHIC                 PMN35270
                          DC      /23A1      NO GRAPHIC                 PMN35280
                          DC      /34A2      NO GRAPHIC                 PMN35290
                          DC      /25A3      NO GRAPHIC                 PMN35300
                          DC      /26A4      NO GRAPHIC                 PMN35310
                          DC      /37A5      NO GRAPHIC                 PMN35320
                          DC      /38A6      NO GRAPHIC                 PMN35330
                          DC      /29A7      NO GRAPHIC                 PMN35340
                          DC      /2AE0      NO GRAPHIC                 PMN35350
                          DC      /1F37      NO GRAPHIC                 PMN35360
                          DC      /1C34      NO GRAPHIC                 PMN35370
                    PT785 DC      /0D35                                 PMN35380
                          BSS     0         PATCH AREA              2-7 PMN35390
                    PT790 DC      0          *AREA                      PMN35400
                          HDNG    SYSTEM KEYBOARD SUBROUTINE            PMN35410
                    *************************************************** PMN35420
                    *                                                 * PMN35430
                    *STATUS - VERSION 2, MODIFICATION 12              * PMN35440
                    *                                                 * PMN35450
                    *FUNCTION/OPERATION-                              * PMN35460
                    *     INPUT FROM THE KEYBOARD, CONVERT TO EBCDIC  * PMN35470
                    *     AND PRINT INPUT TO THE CONSOLE PRINTER.     * PMN35480
                    *                                                 * PMN35490
                    *ENTRY POINTS-                                    * PMN35500
                    *     *KB000+1 IS THE USER ENTRY.                 * PMN35510
                    *     *KB020+1 IS THE INTERRUPT ENTRY.            * PMN35520
                    *                                                 * PMN35530
                    *INPUT-                                           * PMN35540
                    *     ACC = 7002                                  * PMN35550
                    *     EXT = ADDRESS OF I/O AREA                   * PMN35560
                    *     *THE I/O AREA CONSISTS OF ONE WORD          * PMN35570
                    *      INDICATING HOW MANY WORDS ARE TO BE INPUT  * PMN35580
                    *      FROM THE KEYBOARD FOLLOW BY A BUFFER OF    * PMN35590
                    *      THAT MANY WORDS.                           * PMN35600
                    *                                                 * PMN35610
                    *OUTPUT-                                          * PMN35620
                    *     THE I/O AREA BUFFER WILL CONTAIN THE        * PMN35630
                    *     KEYBOARD INPUT IN UNPACKED EBCDIC.  THE     * PMN35640
                    *     KEYBOARD INPUT IS ALSO PRINTED TO THE       * PMN35650
                    *     CONSOLE PRINTER.                            * PMN35660
                    *                                                 * PMN35670
                    *EXTERNAL REFERENCES-                             * PMN35680
                    *     $CTSW                                       * PMN35690
                    *     $I405+1                                     * PMN35700
                    *     $IBSY                                       * PMN35710
                    *     $KCSW                                       * PMN35720
                    *     $PRET                                       * PMN35730
                    *     $PST4                                       * PMN35740
                    *                                                 * PMN35750
                    *EXITS- NORMAL                                    * PMN35760
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * PMN35770
                    *      HAS BEEN INITIATED.                        * PMN35780
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * PMN35790
                    *      SUBROUTINE AFTER AN INTERRUPT HAS BEEN     * PMN35800
                    *      SERVICED.                                  * PMN35810
                    *                                                 * PMN35820
                    *EXITS- ERROR                                     * PMN35830
                    *     *EXIT TO $PRET ON PRE-OPERATIVE ERROR.      * PMN35840
                    *     *EXIT TO $PST4 ON POST-OPERATIVE ERROR.     * PMN35850
                    *                                                 * PMN35860
                    *TABLES/WORK AREAS-                               * PMN35870
                    *     *KB660 IS A TABLE OF IBM CARD CODE (12 BIT  * PMN35880
                    *      HOLLERITH - BITS 0-11)                     * PMN35890
                    *     *KB670 IS A TABLE OF EBCDIC TO ROTATE AND   * PMN35900
                    *      TILT INLINE CODE. (BITS 0-7 RAT AND BITS   * PMN35910
                    *      8-15 EBCDIC)                               * PMN35920
                    *                                                 * PMN35930
                    *ATTRIBUTES-                                      * PMN35940
                    *     *NATURALLY RELOCATABLE.                     * PMN35950
                    *     *REUSABLE.                                  * PMN35960
                    *                                                 * PMN35970
                    *NOTES- BEFORE RETURNING TO THE CALLER A CHECK IS * PMN35980
                    *       MADE FOR THE PRESENCE OF THE SYSTEM       * PMN35990
                    *       CONSOLE PRINTER SUBROUTINE IN CORE.  IF IT* PMN36000
                    *       IS, RETURNING IS DELAYED UNTIL OPERATION  * PMN36010
                    *       IS COMPLETED TO PREVENT POSSIBLE          * PMN36020
                    *       OVERLAPPING.                              * PMN36030
                    *                                                 * PMN36040
                    *************************************************** PMN36050
                          HDNG    SYSTEM KEYBOARD SUBROUTINE            PMN36060
                          ORG     0                                     PMN36070
*SBRKSMC 92         *SYS KEYBOARD                                 V2M00 PMN36080
                          DC      KB680-*-1  WORD CNT OF SYS KB SUBR    PMN36090
                          DC      @KBCP      PHASE ID OF SYS KB SUBR    PMN36100
                          HDNG    SYSTEM KEYBOARD SUBROUTINE            PMN36110
                    KB000 BSC  L  *-*        ENTER HERE FROM MAIN (+2)  PMN36120
                          ORG     *-1                                   PMN36130
                          DC      KB670      ADDR OF CONV TBL FOR ASM   PMN36140
                          MDX     KB070-1    BR TO SERVICE CALL         PMN36150
                    KB020 BSC  L  *-*        ENTER HERE ON INTRPT (+5)  PMN36160
                          LD      KB030      INITLZ SYSTEM TRAP ADDR    PMN36170
                          STO     KB130+1    TO 'TEST DEVICE RDY' SUBR  PMN36180
                          MDX     KB180      GO TO SERVICE              PMN36190
                    *                                                 * PMN36200
                    KB022 DC      1          CHANGED BY THE ASM         PMN36210
                    KB025 DC      8         CONSTANT EIGHT          212 PMN36212
                          BSS  E  0                                 212 PMN36213
                    KB160 DC      0         PERM STORAGE FOR ORIG   212 PMN36214
                    KB170 DC      0         WD CNT & I/O AREA ADDR  212 PMN36215
                    KB330 DC      /1005     SLA 5                   212 PMN36216
                    KB030 DC      $PST4      ADDR OF INTRPT TRAP ADDR   PMN36230
                    KB040 DC      $PRET      ADDR OF CALL TRAP ADDR     PMN36240
                    KB050 DC      0          INTRPT ADDR MINUS DISP     PMN36250
                    KB060 DC      KB020-KB010  ADDR DISPLACEMENT        PMN36260
                          STO     KB080      SET UP FUNC                PMN36270
                    KB070 MDX  L  $IBSY,0   LOOP UNTIL BUSY         212 PMN36280
                          MDX     KB070     *INDICATOR IS ZERO      212 PMN36290
                          STX  L0 $IBSY      SET SUBR BUSY              PMN36310
                          SLA     16        ZERO ACCUMULATOR        212 PMN36315
                          STO     KB150      INITLZ FILL SWITCH TO ZERO PMN36320
                    *                                                 * PMN36330
                    KB010 STX   0 KB050      COMPUTE RELATIVE ADDR      PMN36340
                          LD      KB050      OF INTRPT ENTRY            PMN36350
                          A       KB060      FOR ILS04 BRANCH TABLE     PMN36360
                          STO     KB050                                 PMN36370
                          LD   L  $I405+1    FETCH ADDR OF ILS04 IBT    PMN36380
                          A       KB025                                 PMN36390
                          STO     *+2        SAVE KB/CP ENTRY ADDR      PMN36400
                          LD      KB050      SET UP THE INTRPT ADDR     PMN36410
                          STO  L  *-*        IN THE IBT                 PMN36420
                          LD      KB040      CALL SYSTEM TRAP ADDR      PMN36430
                          STO     KB130+1    TO 'TEST DEVC RDY' SUBR    PMN36440
                    KB080 DC      *-*        FUNTION BRANCH             PMN36450
                          MDX     KB000      *TO HERE ON IGNORE & RET   PMN36460
                          MDX     KB000      *TO HERE ON IGNORE & RET   PMN36470
                          SLT     16         *TO HERE ON RD/PRNT W/CON  PMN36480
                          STO     KB090+1                               PMN36490
                          A       KB022      COMPUTE I/O AREA ADDR      PMN36500
                          STO     KB280      AND WORD COUNT, AND        PMN36510
                          STO     KB160      ASSIGN THEM STORAGE        PMN36520
                          STO     KB310+1                               PMN36530
                    KB090 LD   L  *-*                                   PMN36540
                          STO     KB290                                 PMN36550
                          STO     KB170                                 PMN36560
                    *                                                 * PMN36570
                          LD      KB330      SET UP TO                  PMN36580
                          STO     KB120+1    TEST CONSOLE READY         PMN36590
                          STX   0 KB370      COMPUTE THE BUFFER ADDR    PMN36600
                    KB100 LD      KB370      *FOR THE IOCC              PMN36610
                          A       KB350      *AND THE ADDR              PMN36620
                          STO     KB370      *OF THE I/O AREA           PMN36630
                          A       KB260      *PT FOR INLINE CODING      PMN36640
                          STO     KB400+2   *AND STORE IN               PMN36650
                          STO     KB410+1   *THE CODE                   PMN36660
                    *                                                 * PMN36670
                          BSI     KB110+1    GO TO SENSE DEVICE STATUS  PMN36680
                          MDX     KB140      GO TO PRINT                PMN36690
                    *                                                 * PMN36700
                    KB110 DC      /4C00                                 PMN36710
                          DC      *-*        ENTER HERE TO              PMN36720
                    KB120 XIO     KB390-1    TEST DEVICE READY          PMN36730
                          SLA     5                                     PMN36740
                          BSC     -          SKIP IF NOT RDY            PMN36750
                          MDX     KB110      BRNCH OUT IF RDY           PMN36760
                          LD      KB380      NOT RDY,                   PMN36770
                    KB130 BSI  L  *-*        TRAP OUT TO WAIT           PMN36780
                          MDX     KB120      TRY AGAIN                  PMN36790
                    *                                                 * PMN36800
                    KB140 LD      KB460      SET TO PRINT               PMN36810
                          STO     KB370+1    ONE CHAR/CONTROL           PMN36820
                          LD      KB420                                 PMN36830
                          STO     KB270                                 PMN36840
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 PMN36850
                          XIO     KB370      XEQ CARR RET               PMN36860
                    KB145 LD      KB321     LOAD /2002              212 PMN36870
                          BSI  L  $PRET     PRE-OP ERROR TRAP       212 PMN36875
                          MDX  L  $IBSY,0   BUSY?                   212 PMN36880
                          MDX     KB145     ELSE, LOOP              212 PMN36890
                          MDX     KB000     RETURN TO CALLER        212 PMN36895
                    *                                                 * PMN36950
                    *************************************************** PMN37000
                    *                                                 * PMN37010
                    *    THIS SECTION OF CODING                       * PMN37020
                    *    SERVICES THE INTERRUPT                       * PMN37030
                    *                                                 * PMN37040
                    *************************************************** PMN37050
                    *                                                 * PMN37060
                    KB180 XIO     KB390-1    SENSE AND RESET            PMN37070
                          BSC     +Z         TEST BIT 0                 PMN37080
                          MDX     KB200      GO TO SERVICE PRINT INTRPT PMN37090
                          SLA     1                                     PMN37100
                          BSC     +Z         TEST BIT 1                 PMN37110
                          MDX     KB590      GO TO SERVICE RD INTRPT    PMN37120
                    KB190 MDX     KB020      EXIT                       PMN37130
                    KB200 LD      KB270     WAS INTERRUPT CAUSED BY 212 PMN37140
                          S       KB530     *BACKSPACE              212 PMN37145
                          BSC     +-        NO                      212 PMN37150
                          MDX     KB210     YES, GO PRINT A SLASH   212 PMN37160
                          MDX  L  $IOCT,-1  DECREMENT I/O COUNTER   212 PMN37170
                          NOP               IN CASE OF SKIP         212 PMN37180
                          LD      KB270     WAS INTERRUPT CAUSED BY 212 PMN37190
                          S       KB420     * CARRIAGE RETURN       212 PMN37200
                          BSC     +-        NO                      212 PMN37210
                          MDX     KB300     YES, GO HANDLE          212 PMN37220
                    *                                                 * PMN37230
                          LD      KB470      CHECK SLASH INDR           PMN37240
                          BSC     +-         SKIP IF ON                 PMN37250
                          MDX     KB230      IF OFF, BRANCH TO HANDLE   PMN37260
                    *                                                 * PMN37270
                          S       KB260      HAVE 2 SLASHES BEEN PRINTD PMN37280
                          STO     KB470                                 PMN37290
                          BSC     Z          YES, SKIP                  PMN37300
                    KB210 MDX     KB600      NO, GO TO PRINT A SLASH    PMN37310
                    *                                                 * PMN37320
                    *                                                 * PMN37330
                          LDD     KB160      RESTORE ORIG I/O AREA      PMN37340
                          STD     KB280      ADDR AND WD COUNT          PMN37350
                    *                                                 * PMN37360
                          LD      KB420      SET TO DO CARR RET         PMN37370
                    KB220 STO     KB270                                 PMN37380
                    *                                                 * PMN37390
                          LD      KB330      SET UP TO                  PMN37400
                          STO     KB120+1    TEST CONSOLE RDY           PMN37410
                          LD      KB460      PRINT FUNC TO IOCC         PMN37420
                          STO     KB370+1                               PMN37430
                    *                                                 * PMN37440
                          BSI     KB110+1    GO TO SENSE DEVICE RDY     PMN37450
                    *                                                   PMN37460
                          XIO     KB370      EXEC PRINT                 PMN37470
                          MDX     KB020      EXIT                       PMN37480
                    *                                                   PMN37490
                    KB230 LD      KB490      IS BCKSP INDR ON           PMN37500
                          BSC     -Z         NO, SKIP                   PMN37510
                          MDX     KB250      YES, GO TO RELEASE THE KEY PMN37520
                    *                                                 * PMN37530
                    KB240 LD      KB290                                 PMN37540
                          S       KB260      DECR THE WD CNT            PMN37550
                          STO     KB290      TEST FOR ZERO              PMN37560
                          BSC     +-         SKIP IF NOT ZERO           PMN37570
                          MDX     KB310      GO TO SET SUBR NOT BUSY    PMN37580
                          LD      KB280                                 PMN37590
                          A       KB260      INCR THE I/O AREA PT       PMN37600
                          STO     KB280                                 PMN37610
                    *                                                 * PMN37620
                          LD      KB150      TEST FILL SWITCH           PMN37630
                          BSC     Z          SKIP IF OFF                PMN37640
                          MDX     KB400      GO TO HANDLE IF ON         PMN37650
                    *                                                 * PMN37660
                    KB250 LD      KB340      SET UP TO                  PMN37670
                          STO     KB120+1    TEST KEYBOARD RDY          PMN37680
                    *                                                 * PMN37690
                          LD      KB360      SET UP IOCC AND GO TO      PMN37700
                          MDX     KB220+4   GO SELECT KEYBOARD          PMN37710
                    *                                                 * PMN37720
                    *                                                 * PMN37730
                          BSS  E  0                                     PMN37750
                    KB260 DC      1          CONSTANT ONE               PMN37760
                    KB270 DC      *-*        IOCC BFR                   PMN37770
                    KB280 DC      *-*        I/O AREA POINTER           PMN37780
                    KB290 DC      *-*        WORD COUNT                 PMN37790
                          BSS  E  0                                 212 PMN37796
                    KB370 DC      *-*       IOCC TO RD/PRNT         212 PMN37797
                          DC      *-*       *                       212 PMN37798
                    KB380 DC      /2000     KB NO READY CODE        212 PMN37799
                    KB390 DC      /0F01     FUNC CODE TO SNS DSW    212 PMN37800
                    KB150 DC      0         FILL WITH BLANKS SWITCH     PMN37802
                    KB321 DC      /2002     HALT FOR // TYP         212 PMN37805
                    *                                                 * PMN37810
                    KB300 LD      KB495     LOAD ERASE/BKSP INDR    212 PMN37811
                          BSC     +-        IF ON, SKIP             212 PMN37812
                          MDX     KB305     ELSE, GO RELEASE KEY    212 PMN37814
                          MDX  L  $IOCT,1   INCREMENT I/O COUNTER   212 PMN37816
                          NOP               MAY SKIP                212 PMN37818
                    KB305 SLA     16        ZERO                    212 PMN37820
                          STO     KB495     *ERASE/BKSP INDR        212 PMN37825
                          STO     KB270      CLEAR THE BUFFER           PMN37830
                          MDX     KB250      GO TO RELEASE THE KEY      PMN37840
                    *                                                 * PMN37850
                    KB460 DC      /0902     PRINT FUNC CODE         212 PMN37855
                    KB350 DC      KB270-KB100 ADDRESS DISPLACEMENT  212 PMN37857
                    KB420 DC      /8100     CONSOLE CODE CARR RET   212 PMN37858
                    KB410 STO  I  *-*       PUT EBC INTO I/O AREA   212 PMN37860
                          MDX  L  $IOCT,1   INCR I/O COUNTER        212 PMN37861
                          MDX     KB220+1   GO TO PRINT             212 PMN37862
                    KB400 LD      KB480     PUT BLANK CHARACTER     212 PMN37863
                          STO  I  *-*       *INTO I/O AREA          212 PMN37864
                          STO     KB150     SET TO FILL I/O AREA    212 PMN37865
                          MDX     KB240     *WITH BLANKS            212 PMN37866
                    KB310 LDX  L1 *-*        INITLZ INPUT ADDR TO XR1   PMN37870
                          LD    1 0                                     PMN37880
                    *                                                 * PMN37890
                          S       KB440      WERE THEY SLASHES          PMN37900
                          BSC     Z          SKIP ON YES                PMN37910
                          MDX     KB320      BR TO EXIT ON NO           PMN37920
                          LD    1 1                                     PMN37930
                          S       KB440                                 PMN37940
                          BSC     Z          SKIP IF 2ND WD IS A SLASH, PMN37950
                          MDX     KB320      OTHERWISE BRANCH           PMN37960
                    *                                                 * PMN37970
                          LD    1 2          FETCH THIRD WRD            PMN37980
                          S       KB480      IS IT A SPACE              PMN37990
                          BSC     Z          SKIP ON YES                PMN38000
                          MDX     KB320      BR TO EXIT ON NO           PMN38010
                    *                                                 * PMN38020
                          STX  L0 $CTSW      RECORD WAS A CTL TYPE      PMN38030
                    KB320 SLA     16         CLEAR ACC                  PMN38040
                          STO  L  $IBSY      TURN OFF SUBROUTINE BUSY   PMN38050
                          MDX     KB190      EXIT                       PMN38080
                    *                                                 * PMN38090
                    *                                                 * PMN38120
                    KB360 DC      /0C00      FUNC CODE TO RELEASE KEY   PMN38160
                    KB440 DC      /0061      EBC CODE FOR A SLASH       PMN38320
                    KB450 DC      /0A00      FUNC CODE TO READ          PMN38330
                    KB470 DC      0          SLASH INDR                 PMN38350
                    KB480 DC      /0040      EBC SPACE                  PMN38360
                    KB490 DC      0          BCKSP INDR                 PMN38370
                    *************************************************** PMN38380
                    *                                                 * PMN38390
                    *THIS BLOCK OF CODING HANDLES THE CONVERSION OF   * PMN38395
                    *   12-BIT HOLLERITH TO EBCDIC AND CONSOLE        * PMN38400
                    *   PRINTER CODE                                  * PMN38410
                    *                                                 * PMN38420
                    *************************************************** PMN38430
                    KB500 LD      KB490                                 PMN38440
                          A       KB260      INCR BCKSP                 PMN38450
                          STO     KB490      INDR BY ONE                PMN38460
                    *                                                 * PMN38470
                          LD      KB280     DECREMENT                   PMN38475
                          S       KB260     *I/O                        PMN38480
                          STO     KB280     * POINTER                   PMN38485
                          LD      KB290     INCREMENT                   PMN38510
                          A       KB260     *WORD                       PMN38520
                          STO     KB290                                 PMN38540
                          LD      KB530      SET TO DO A BACKSPACE      PMN38550
                    KB505 MDX     KB220     DO BACKSPACE            212 PMN38560
                    *                                                 * PMN38570
                    *                                                 * PMN38580
                    KB495 DC      *-*       ERASE/BKSP INDR         212 PMN38600
                    KB530 DC      /1100      CP CODE FOR BCKSP          PMN38610
                    KB590 LD      KB450      SET UP IOCC                PMN38690
                          STO     KB370+1                               PMN38700
                          XIO     KB370      READ ONE CHAR              PMN38710
                    *                                                 * PMN38720
                          LD      KB270      FETCH CHAR JUST READ       PMN38730
                          S       KB540      IS IT A BACKSPACE          PMN38740
                          BSC     +-         NO, SKIP                   PMN38750
                          MDX     KB500      YES, GO HANDLE             PMN38760
                    *                                                 * PMN38770
                          SLA     16         TURN OFF                   PMN38780
                          STO     KB490      BACKSPACE INDR             PMN38790
                    *                                                 * PMN38800
                          LD      KB270      FETCH CHARACTER            PMN38810
                          S       KB550      IS IT AN END-OF-MESSAGE    PMN38820
                          BSC     +-         NO, SKIP                   PMN38830
                          MDX     KB400      GO TO HANDLE               PMN38840
                    *                                                 * PMN38850
                          S       KB560      IS IT AN ERRASE            PMN38860
                          BSC     Z          YES, SKIP                  PMN38870
                          MDX     KB630-1    NO, GO TO CONV CHAR        PMN38880
                    *                                                 * PMN38890
                          LDX   1 2         SET SLASH INDICATOR     212 PMN38900
                          STX   1 KB470     *TO TWO                 212 PMN38910
                          STX     KB495     SET ERASE INDR ON       212 PMN38915
                    KB600 MDX  L  $IOCT,1   INCR IO COINTER         212 PMN38920
                    KB340 DC      /1006                                 PMN38921
                          LD      KB510     GO TO PRINT                 PMN38924
                          MDX     KB505     A SLASH                 212 PMN38930
                    KB510 DC      /BC00      PRINT SLASH            212 PMN38932
                    KB540 DC      /0004     BACKSPACE CODE          212 PMN38933
                    KB550 DC      /0008     EOM CODE                212 PMN38934
                    KB560 DC      /0002-/0008  ERASE CODE           212 PMN38935
                    KB570 DC      KB660-KB630  ADDR DISPLACEMENT    212 PMN38936
                    KB580 DC      KB670-KB660  ADDR DISPLACEMENT    212 PMN38937
                    *************************************************** PMN38940
                    *                                                 * PMN38950
                    *PERFORM A TABLE LOOK-UP TO CONVERT INPUT CHAR-   * PMN38960
                    *   ACTER TO EBCDIC AND CONSOLE PRINTER CODE      * PMN38970
                    *                                                 * PMN38990
                    *************************************************** PMN39000
                          STX   0 KB640+1    COMPUTE THE                PMN39010
                    KB630 LD      KB640+1    EFFECTIVE ADDRESSES        PMN39020
                          A       KB570      OF BOTH CONV TABLES        PMN39030
                          STO     KB640+1    AND STORE THEM TO          PMN39040
                          A       KB580      INLINE CODING              PMN39050
                          STO     KB650+1                               PMN39060
                          LDX   2 +53        SIZE OF TABLE              PMN39070
                          LD      KB270      FETCH CHAR                 PMN39080
                    KB640 EOR  L2 *-*        COMPARE WITH TABLE ENTRY   PMN39090
                          BSC     +-         SKIP IF NO COMPARE         PMN39100
                          MDX     KB650      CHAR FOUND-END OF SEARCH   PMN39110
                          MDX   2 -1         DECR LOOP COUNTER          PMN39120
                          MDX     KB640-1    LOOP TO CONTINUE SEARCH    PMN39130
                    *                                                 * PMN39140
                          LD      KB670      INVALID CHAR DETECTED      PMN39150
                          MDX     KB650+2    GO TO PRINT A BLANK        PMN39160
                    *                                                 * PMN39170
                    KB650 LD   L2 *-*        FETCH CORESPOND TABL2 ENT  PMN39180
                          STO     KB270      SET TO PRINT IT            PMN39190
                          SLA     8          SHIFT OUT CONSOLE CODE     PMN39200
                          SRA     8          RIGHT JUSTIFY EBC          PMN39210
                          MDX     KB410      GO TO HANDLE               PMN39220
                    *************************************************** PMN39230
                    *             BITS 0-11 = IBM CARD CODE           * PMN39240
                    *************************************************** PMN39250
                    KB660 DC      0          TBL ADJUSTMENT FOR ASM     PMN39260
                          DC      /8000      AMPERSAND                  PMN39270
                          DC      /0420      POUND                      PMN39280
                          DC      /0220      AT                         PMN39290
                          DC      /2220      PERCENT                    PMN39300
                          DC      /8220      LESS THAN                  PMN39310
                          DC      /0000      SPACE                      PMN39320
                          DC      /2000      0                          PMN39330
                          DC      /1000      1                          PMN39340
                          DC      /0800      2                          PMN39350
                          DC      /0400      3                          PMN39360
                          DC      /0200      4                          PMN39370
                          DC      /0100      5                          PMN39380
                          DC      /0080      6                          PMN39390
                          DC      /0040      7                          PMN39400
                          DC      /0020      8                          PMN39410
                          DC      /0010      9                          PMN39420
                          DC      /9000      A                          PMN39430
                          DC      /8800      B                          PMN39440
                          DC      /8400      C                          PMN39450
                          DC      /8200      D                          PMN39460
                          DC      /8100      E                          PMN39470
                          DC      /8080      F                          PMN39480
                          DC      /8040      G                          PMN39490
                          DC      /8020      H                          PMN39500
                          DC      /8010      I                          PMN39510
                          DC      /5000      J                          PMN39520
                          DC      /4800      K                          PMN39530
                          DC      /4400      L                          PMN39540
                          DC      /4200      M                          PMN39550
                          DC      /4100      N                          PMN39560
                          DC      /4080      O                          PMN39570
                          DC      /4040      P                          PMN39580
                          DC      /4020      Q                          PMN39590
                          DC      /4010      R                          PMN39600
                          DC      /2800      S                          PMN39610
                          DC      /2400      T                          PMN39620
                          DC      /2200      U                          PMN39630
                          DC      /2100      V                          PMN39640
                          DC      /2080      W                          PMN39650
                          DC      /2040      X                          PMN39660
                          DC      /2020      Y                          PMN39670
                          DC      /2010      Z                          PMN39680
                          DC      /8420      PERIOD                     PMN39690
                          DC      /4120      RIGHT PARENTHESIS          PMN39700
                          DC      /8120      LEFT PARENTHESIS           PMN39710
                          DC      /80A0      PLUS                       PMN39720
                          DC      /4420      DOLLAR SIGN                PMN39730
                          DC      /4220      ASTERISK                   PMN39740
                          DC      /00A0      EQUAL                      PMN39750
                          DC      /4000      DASH                       PMN39760
                          DC      /3000      SLASH                      PMN39770
                          DC      /2420      COMMA                      PMN39780
                          DC      /0120      APOSTROPHE                 PMN39790
                    KB670 DC      /2150      CODES FOR INVALID CHAR     PMN39800
                          DC      /444E      AMPERSAND                  PMN39810
                          DC      /C07B     POUND                   212 PMN39820
                          DC      /047C     AT                      212 PMN39830
                          DC      /066C     PERCENT                 212 PMN39840
                          DC      /DE4C     LESS THAN               212 PMN39850
                          DC      /2140      BLANK                      PMN39860
                          DC      /C4F0      0                          PMN39870
                          DC      /FCF1      1                          PMN39880
                          DC      /D8F2      2                          PMN39890
                          DC      /DCF3      3                          PMN39900
                          DC      /F0F4      4                          PMN39910
                          DC      /F4F5      5                          PMN39920
                          DC      /D0F6      6                          PMN39930
                          DC      /D4F7      7                          PMN39940
                          DC      /E4F8      8                          PMN39950
                          DC      /E0F9      9                          PMN39960
                          DC      /3CC1      A                          PMN39970
                          DC      /18C2      B                          PMN39980
                          DC      /1CC3      C                          PMN39990
                          DC      /30C4      D                          PMN40000
                          DC      /34C5      E                          PMN40010
                          DC      /10C6      F                          PMN40020
                          DC      /14C7      G                          PMN40030
                          DC      /24C8      H                          PMN40040
                          DC      /20C9      I                          PMN40050
                          DC      /7CD1      J                          PMN40060
                          DC      /58D2      K                          PMN40070
                          DC      /5CD3      L                          PMN40080
                          DC      /70D4      M                          PMN40090
                          DC      /74D5      N                          PMN40100
                          DC      /50D6      O (ALPHA)                  PMN40110
                          DC      /54D7      P                          PMN40120
                          DC      /64D8      Q                          PMN40130
                          DC      /60D9      R                          PMN40140
                          DC      /98E2      S                          PMN40150
                          DC      /9CE3      T                          PMN40160
                          DC      /B0E4      U                          PMN40170
                          DC      /B4E5      V                          PMN40180
                          DC      /90E6      W                          PMN40190
                          DC      /94E7      X                          PMN40200
                          DC      /A4E8      Y                          PMN40210
                          DC      /A0E9      Z                          PMN40220
                          DC      /004B      PERIOD                     PMN40230
                          DC      /F65D      RIGHT PARENTHESIS          PMN40240
                          DC      /FE4D      LEFT PARENTHESIS           PMN40250
                          DC      /DA4E      PLUS                       PMN40260
                          DC      /405B      DOLLAR SIGN                PMN40270
                          DC      /D65C      ASTERICK                   PMN40280
                          DC      /C27E      EQUAL                      PMN40290
                          DC      /8460      MINUS                      PMN40300
                          DC      /BC61      SLASH                      PMN40310
                          DC      /806B      COMMA                      PMN40320
                          DC      /E67D      APOSTROPHE                 PMN40330
                    *                                                 * PMN40340
                    KB675 BSS     /175-*+1 PATCH AREA               212 PMN40350
                    KB680 EQU     *-1                               212 PMN40360
                          HDNG    SYSTEM 2501/1442 CONVERSION SUBROUTINEPMN40370
                    *************************************************** PMN40380
                    *STATUS-VERSION 2, MODIFICATION 12                * PMN40390
                    *                                                 * PMN40400
                    *FUNCTION/OPERATION-                              * PMN40410
                    *   CONVERT IBM CARD CODE TO UNPACKED EBCDIC      * PMN40420
                    *                                                 * PMN40430
                    *ENTRY POINTS-                                    * PMN40440
                    *   SP000+1 IS THE USER ENTRY                     * PMN40450
                    *                                                 * PMN40460
                    *INPUT-                                           * PMN40470
                    *   ACC = ADDRESS OF I/O AREA  (WORD COUNT)       * PMN40480
                    *                                                 * PMN40490
                    *OUTPUT-                                          * PMN40500
                    *   EIGHT WORD BUFFER SPECIFIED BY INPUT FILLED   * PMN40510
                    *   WITH UNPACKED,RIGHT-JUSTIFIED EBCDIC          * PMN40520
                    *   CHARACTERS                                    * PMN40530
                    *                                                 * PMN40540
                    *EXTERNAL REFERENCES-N/A                          * PMN40550
                    *                                                 * PMN40560
                    *EXITS-                                           * PMN40570
                    *   NORMAL-                                       * PMN40580
                    *      SUBROUTINE RETURNS TO USER AFTER           * PMN40590
                    *      ALL EIGHTY COLUMNS HAVE BEEN               * PMN40600
                    *      CONVERTED                                  * PMN40610
                    *   ERROR-N/A                                     * PMN40620
                    *                                                 * PMN40630
                    *TABLES/WORK AREAS-                               * PMN40640
                    *                                                 * PMN40650
                    *   SP130 IS A TABLE OF EBCDIC, TWO CHARACTERS    * PMN40660
                    *   PER WORD. THE RIGHT HALF OF EACH ENTRY        * PMN40670
                    *   CONVERTS FROM CARD CODE OF LEFT HALF          * PMN40680
                    *   PLUS A NINE ROW PUNCH. THE ENTRIES ARE        * PMN40690
                    *   ARRANGED BY CARD CODE ZONES TO ALLOW          * PMN40700
                    *   THE SUBROUTINE DIRECT ACCESS                  * PMN40710
                    *                                                 * PMN40720
                    *ATTRIBUTES-                                      * PMN40730
                    *   * NATURALLY RELOCATABLE                       * PMN40740
                    *   * SERIALLY REUSEABLE                          * PMN40750
                    *                                                 * PMN40760
                    *NOTES-N/A                                        * PMN40770
                    *************************************************** PMN40780
                          HDNG    SYSTEM 2501/1442 CONVERSION SUBR      PMN40790
                          ORG     0                                     PMN40800
*SBRKGPW 93         *SYS 2501/1442 CONVERSION                     V2M00 PMN40810
                          DC      SP990-SP000+1  WORD CNT OF SYS CD CNV PMN40820
                          DC      @CDCV          PHASE ID OF SYS CD CNV PMN40830
                          HDNG    SYSTEM 2501/1442 CONVERSION SUBR      PMN40840
                    SP000 BSC  L  *-*       EXIT/ENTRY                  PMN40850
                          STS     SP074     SAVE STATUS INDICATORS      PMN40860
                          STX   1 SP070+1   SAVE XR1                    PMN40870
                          STX   2 SP072+1   SAVE XR 2                   PMN40880
                          STO     SP020+1   INITIALIZE LOAD AND STORE   PMN40890
                          STO     SP060+1   WITH ADDRESS OF I/O AREA.   PMN40900
                          LDX   2 80        XR2 = COLUMN COUNT          PMN40910
                    SP020 LD   L2 *-*       FETCH HOLLERITH CARD COLUMN PMN40920
                          STO     SP090     SAVE FOR LATER RELOAD       PMN40930
                          SRT     6         PACK 12,11,0 ROWS NEXT TO   PMN40940
                          SRA     7         8,9 ROWS AND STORE          PMN40950
                          SRT     3         *IN EXTENSION               PMN40960
                          LD      SP090     RELOAD COLUMN IN ACC        PMN40970
                    *                                                   PMN40980
                    *     DETERMINE WHICH ROWS OF ROWS 1-7 ARE PUNCHED  PMN40990
                    *                                                   PMN41000
                          LDX   1 10                                    PMN41010
                          AND     SP100     ZERO ALL ROWS EXCEPT 1-7    PMN41020
                          SLCA  1                                       PMN41030
                          SLA     1         IS MULTIPLE PUNCH IN 1-7    PMN41040
                          BSC     +-                                    PMN41050
                          MDX     SP030     NO MULTIPLE PUNCHES         PMN41060
                          LD      SP120     USE AMPERSAND (ASM--FF)     PMN41070
                          MDX     SP060     TO INDICATE INVALID PUNCH   PMN41080
                    *                                                   PMN41090
                    *             COLUMN CONTAINS VALID PUNCH           PMN41100
                    *                                                   PMN41110
                    SP030 STX   1 SP090     XR1 = 0 IF NO 1-7 PUNCH,    PMN41120
                          LD      SP090     *   = 1 IF 7 PUNCH          PMN41130
                          SLT     4         *   = 7 IF 1 PUNCH          PMN41140
                          STO     SP050+1   ADD 12,11,0,AND 8 ROWS      PMN41150
                          STO     SP090                                 PMN41160
                          STX   0 SP052+1   BUILD ADDRESS FOR           PMN41170
                    SP040 LD      SP052+1   INDEXED LOAD INST AT SP052  PMN41180
                          A       SP110                                 PMN41190
                          STO     SP052+1                               PMN41200
                          LD      SP090                                 PMN41210
                          SLT     17        STORE 9 ROW IN CARRY        PMN41220
                    SP050 LDX  L1 *-*       XR1 = TABLE LOOK-UP ADDRESS PMN41230
                    SP052 LD   L1 *-*       LOAD TABLE ENTRY            PMN41240
                    *                                                   PMN41250
                    *     IF 9 PUNCH, USE RIGHT HALF OF ENTRY           PMN41260
                    *                                                   PMN41270
                          BSC     C         IF CARRY SET                PMN41280
                          SLA     8         USE RIGHT-HALF, OTHERWISE   PMN41290
                          SRA     8         USE LEFT-HALF OF ENTRY      PMN41300
                    SP060 STO  L2 *-*       STORE CHAR IN BUFFER        PMN41310
                          MDX   2 -1        CHANGE COLUMN POINTER       PMN41320
                          MDX     SP020     TO CONVERT NEXT COLUMN      PMN41330
                    SP070 LDX  L1 *-*       RELOAD XR 1                 PMN41340
                    SP072 LDX  L2 *-*       RELOAD XR 2                 PMN41350
                    SP074 LDS     0         RELOAD STATUS INDICATORS    PMN41360
                          MDX     SP000     GO TO EXIT                  PMN41370
                    *                                                   PMN41380
                    *     CONSTANTS (OTHER THAN TABLE) USED BY ROUTINE  PMN41390
                    *                                                   PMN41400
                    SP090 DC      *-*       TEMPORARY STORE FOR COLUMN  PMN41410
                    SP100 DC      /1FC0     MASK OUT ALL ROWS BUT 1-7   PMN41420
                    SP110 DC      SP130-SP040   DISP. TO BUILD SP052    PMN41430
                    SP120 DC      /00EF     INVALID CHAR CODE       2-8 PMN41440
                    *                                                   PMN41450
                          BSS     2         PATCH AREA              2-9 PMN41460
                    ************************************************2-9 PMN41470
                    *                                              *2-9 PMN41480
                    *   DUP DUMP / STORE EBCDIC USES THIS TABLE    *2-9 PMN41490
                    *   TO CONVERT TO CARD CODE. SP130 IS EXPECTED *2-9 PMN41500
                    *   TO BE AT RELATIVE ADDR /3B. ANY CHANGE     *2-9 PMN41510
                    *   WILL NECESSITATE CHANGING XE900 IN DUP DUMP*2-9 PMN41520
                    *   AND RI900 IN DUP DCTL.                     *2-9 PMN41530
                    ************************************************2-9 PMN41540
                    *                                                   PMN41550
                    *             EBCDIC CHARACTER TABLE - BASED ON     PMN41560
                    *             PACKED HOL ( 1-7 ROW COMPLEMENT, 12,  PMN41570
                    *             11,0,8 ROWS ... RIGHT CHAR IF 9 ROW)  PMN41580
                    *                                                   PMN41590
                    *             EBCDIC,HOL ROW PUNCHES,   LEFT,RIGHT  PMN41600
                    *                                                   PMN41610
                    SP130 DC      /40F9  BLANK,(9)          BLANK  9    PMN41620
                          DC      /F838  8,(9)              8           PMN41630
                          DC      /F0E9  0,(9)              ZERO   Z    PMN41640
                          DC      /E828  0,8,(9)            Y           PMN41650
                          DC      /60D9  11,(9)             DASH   R    PMN41660
                          DC      /D818  11,8,(9)           Q           PMN41670
                          DC      /D0A9  11,0,(9)                       PMN41680
                          DC      /A868  11,0,8,(9)                     PMN41690
                          DC      /50C9          AMPSND I           2-8 PMN41700
                          DC      /C808  12,8,(9)           H           PMN41710
                          DC      /C089  12,0,(9)                       PMN41720
                          DC      /8848  12,0,8,(9)                     PMN41730
                          DC      /6A99  12,11,(9)                      PMN41740
                          DC      /9858  12,11,8,(9)                    PMN41750
                          DC      /70B9  12,11,0,(9)                    PMN41760
                          DC      /B878  12,11,0,8,(9)                  PMN41770
                    *                                                   PMN41780
                          DC      /F737  7,(9)              7      EOT  PMN41790
                          DC      /7F3F  7,8,(9)                        PMN41800
                          DC      /E727  7,0,(9)            X      PRE  PMN41810
                          DC      /6F2F  7,0,8,(9)                      PMN41820
                          DC      /D717  7,11,(9)           P      IDL  PMN41830
                          DC      /5F1F  7,11,8,(9)                     PMN41840
                          DC      /A767  7,11,0,(9)                     PMN41850
                          DC      /AFEF  7,11,0,8,(9)                   PMN41860
                          DC      /C707  7,12,(9)           G      DEL  PMN41870
                          DC      /4F0F  7,12,8,(9)                     PMN41880
                          DC      /8747  7,12,0,(9)                     PMN41890
                          DC      /8FCF  7,12,0,8,(9)                   PMN41900
                          DC      /9757  7,12,11,(9)                    PMN41910
                          DC      /9FDF  7,12,11,8,(9)                  PMN41920
                          DC      /B777  7,12,11,0,(9)                  PMN41930
                          DC      /BFFF  7,12,11,0,8,(9)                PMN41940
                    *                                                   PMN41950
                          DC      /F636  6,(9)              6      UC   PMN41960
                          DC      /7E3E  6,8,(9)            EQUAL       PMN41970
                          DC      /E626  6,0,(9)            W      EOB  PMN41980
                          DC      /6E2E  6,0,8,(9)                      PMN41990
                          DC      /D616  6,11,(9)           O      BS   PMN42000
                          DC      /5E1E  6,11,8,(9)                     PMN42010
                          DC      /A666  6,11,0,(9)                     PMN42020
                          DC      /AEEE  6,11,0,8,(9)                   PMN42030
                          DC      /C606  6,12,(9)           F      LC   PMN42040
                          DC      /4E0E  6,12,8,(9)         PLUS        PMN42050
                          DC      /8646  6,12,0,(9)                     PMN42060
                          DC      /8ECE  6,12,0,8,(9)                   PMN42070
                          DC      /9656  6,12,11,(9)                    PMN42080
                          DC      /9EDE  6,12,11,8,(9)                  PMN42090
                          DC      /B676  6,12,11,0,(9)                  PMN42100
                          DC      /BEFE  6,12,11,0,8,(9)                PMN42110
                    *                                                   PMN42120
                          DC      /F535  5,(9)              5      RS   PMN42130
                          DC      /7D3D  5,8,(9)                        PMN42140
                          DC      /E525  5,0,(9)            V      LF   PMN42150
                          DC      /6D2D  5,0,8,(9)                      PMN42160
                          DC      /D515  5,11,(9)           N      NL   PMN42170
                          DC      /5D1D  5,11,8,(9)         )           PMN42180
                          DC      /A565  5,11,0,(9)                     PMN42190
                          DC      /ADED  5,11,0,8,(9)                   PMN42200
                          DC      /C505  5,12,(9)           E      HT   PMN42210
                          DC      /4D0D  5,12,8,(9)         (           PMN42220
                          DC      /8545  5,12,0,(9)                     PMN42230
                          DC      /8DCD  5,12,0,8,(9)                   PMN42240
                          DC      /9555  5,12,11,(9)                    PMN42250
                          DC      /9DDD  5,12,11,8,(9)                  PMN42260
                          DC      /B575  5,12,11,0,(9)                  PMN42270
                          DC      /BDFD  5,12,11,0,8,(9)                PMN42280
                    *                                                   PMN42290
                          DC      /F434  4,(9)              4    PN 2-7 PMN42300
                          DC      /7C3C          AT-SIGN            2-8 PMN42310
                          DC      /E424  4,0,(9)            U      BYP  PMN42320
                          DC      /4D2C     PERCENT                     PMN42330
                          DC      /D414  4,11,(9)           M      RES  PMN42340
                          DC      /5C1C  4,11,8,(9)         *           PMN42350
                          DC      /A464  4,11,0,(9)                     PMN42360
                          DC      /ACEC  4,11,0,8,(9)                   PMN42370
                          DC      /C404  4,12,(9)           D      PF   PMN42380
                          DC      /5D0C     LESS THAN                   PMN42390
                          DC      /8444  4,12,0,(9)                     PMN42400
                          DC      /8CCC  4,12,0,8,(9)                   PMN42410
                          DC      /9454  4,12,11,(9)                    PMN42420
                          DC      /9CDC  4,12,11,8,(9)                  PMN42430
                          DC      /B474  4,12,11,0,(9)                  PMN42440
                          DC      /BCFC  4,12,11,0,8,(9)                PMN42450
                    *                                                   PMN42460
                          DC      /F333  3,(9)              3           PMN42470
                          DC      /7B3B          POUND SIGN         2-8 PMN42480
                          DC      /E323  3,0,(9)            T           PMN42490
                          DC      /6B2B  3,0,8,(9)          COMMA       PMN42500
                          DC      /D313  3,11,(9)           L           PMN42510
                          DC      /5B1B  3,11,8,(9)         /           PMN42520
                          DC      /A363  3,11,0,(9)                     PMN42530
                          DC      /ABEB  3,11,0,8,(9)                   PMN42540
                          DC      /C303  3,12,(9)           C           PMN42550
                          DC      /4B0B  3,12,8,(9)         .           PMN42560
                          DC      /8343  3,12,0,(9)                     PMN42570
                          DC      /8BCB  3,12,0,8,(9)                   PMN42580
                          DC      /9353  3,12,11,(9)                    PMN42590
                          DC      /9BDB  3,12,11,8,(9)                  PMN42600
                          DC      /B373  3,12,11,0,(9)                  PMN42610
                          DC      /BBFB  3,12,11,0,8,(9)                PMN42620
                    *                                                   PMN42630
                          DC      /F232  2,(9)              Z           PMN42640
                          DC      /7A3A  2,8,(9)                        PMN42650
                          DC      /E222  2,0,(9)            S           PMN42660
                          DC      /E02A  2,0,8,(9)                      PMN42670
                          DC      /D212  2,11,(9)           K           PMN42680
                          DC      /5A1A  2,11,8,(9)                     PMN42690
                          DC      /A262  2,11,0,(9)                     PMN42700
                          DC      /AAEA  2,11,0,8,(9)                   PMN42710
                          DC      /C202  2,12,(9)           B           PMN42720
                          DC      /4A0A  2,12,8,(9)                     PMN42730
                          DC      /8242  2,12,0,(9)                     PMN42740
                          DC      /8ACA  2,12,0,8,(9)                   PMN42750
                          DC      /9252  2,12,11,(9)                    PMN42760
                          DC      /9ADA  2,12,11,8,(9)                  PMN42770
                          DC      /B272  2,12,11,0,(9)                  PMN42780
                          DC      /BAFA  2,12,11,0,8,(9)                PMN42790
                    *                                                   PMN42800
                          DC      /F131  1,(9)              1           PMN42810
                          DC      /7939  1,8,(9)                        PMN42820
                          DC      /6121  1,0,(9)            SLASH       PMN42830
                          DC      /6929  1,0,8,(9)                      PMN42840
                          DC      /D111  1,11,(9)           J           PMN42850
                          DC      /5919  1,11,8,(9)                     PMN42860
                          DC      /A1E1  1,11,0,(9)                     PMN42870
                          DC      /A020  1,11,0,8,(9)                   PMN42880
                          DC      /C101  1,12,(9)           A           PMN42890
                          DC      /4909  1,12,8,(9)                     PMN42900
                          DC      /8141  1,12,0,(9)                     PMN42910
                          DC      /8000  1,12,0,8,(9)              NUL  PMN42920
                          DC      /9151  1,12,11,(9)                    PMN42930
                          DC      /9010  1,12,11,8,(9)                  PMN42940
                          DC      /B171  1,12,11,0,(9)                  PMN42950
                    SP990 DC      /B030  1,12,11,0,8,(9)            2-9 PMN42960
                          HDNG    SYSTEM 1134/1055 CONVERSION SUBROUTINEPMN42970
                    *************************************************** PMN42980
                    *                                                 * PMN42990
                    *STATUS- VERSION 2, MODIFICATION LEVEL 0          * PMN43000
                    *                                                 * PMN43010
                    *FUNCTION- THE NATURE OF THE SYSTEM PAPERTAPE     * PMN43020
                    *          SUBROUTINE IS SUCH THAT THE CONVERSION * PMN43030
                    *          FROM PAPERTAPE CODE TO EBCDIC          * PMN43040
                    *          CODE IS AN INTEGRAL PART OF SAID       * PMN43050
                    *          SUBROUTINE.  THEREFORE, THE SYSTEM     * PMN43060
                    *          PAPERTAPE CONVERSION SUBROUTINE IS A   * PMN43070
                    *          DUMMY SUBROUTINE CONSISTING OF AN      * PMN43080
                    *          ENTRY FOLLOWED IMMEDIATELY BY A RETURN * PMN43090
                    *          TO THE CALLER.  THE PURPOSE OF THIS    * PMN43100
                    *          DUMMY CONVERSION SUBROUTINE IS TO      * PMN43110
                    *          PROVIDE COMPATABILITY BETWEEN ALL      * PMN43120
                    *          SYSTEM I/O DEVICE SUBROUTINES.         * PMN43130
                    *                                                 * PMN43140
                    *ENTRY- DP000                                     * PMN43150
                    *                                                 * PMN43160
                    *EXIT- DP000+1                                    * PMN43170
                    *                                                 * PMN43180
                    *TABLES/WORK AREAS- N/A                           * PMN43190
                    *                                                 * PMN43200
                    *ATTRIBUTES- RE-USABLE                            * PMN43210
                    *                                                 * PMN43220
                    *************************************************** PMN43230
                          HDNG    DUMMY 1134/1055 CONVERSION            PMN43240
                          ORG     0                                     PMN43250
*SBRKSMC 94         *SYS 1134/1055 CONVERSION                     V2M00 PMN43260
                          DC      3          SYS PAPER TAPE CONV WD CNT PMN43270
                          DC      @PTCV     PHASE ID FOR SYS 1134  CONV PMN43280
                    DP000 BSC  L  *-*       DUMMY CONV ENTRY            PMN43290
                          MDX     DP000     RETURN                      PMN43300
                          HDNG    SYSTEM KEYBOARD CONVERSION SUBROUTINE PMN43310
                    *************************************************** PMN43320
                    *                                                 * PMN43330
                    *STATUS- VERSION 2, MODIFICATION LEVEL 0          * PMN43340
                    *                                                 * PMN43350
                    *FUNCTION- THE NATURE OF THE SYSTEM KEYBOARD      * PMN43360
                    *          SUBROUTINE IS SUCH THAT THE CONVERSION * PMN43370
                    *          FROM HOLL TO CP CODE AND TO EBCDIC     * PMN43380
                    *          CODE IS AN INTEGRAL PART OF SAID       * PMN43390
                    *          SUBROUTINE.  THEREFORE, THE SYSTEM     * PMN43400
                    *          KEYBOARD CONVERSION SUBROUTINE IS A    * PMN43410
                    *          DUMMY SUBROUTINE CONSISTING OF AN      * PMN43420
                    *          ENTRY FOLLOWED IMMEDIATELY BY A RETURN * PMN43430
                    *          TO THE CALLER.  THE PURPOSE OF THIS    * PMN43440
                    *          DUMMY CONVERSION SUBROUTINE IS TO      * PMN43450
                    *          PROVIDE COMPATABILITY BETWEEN ALL      * PMN43460
                    *          SYSTEM I/O DEVICE SUBROUTINES.         * PMN43470
                    *                                                 * PMN43480
                    *ENTRY- DK000                                     * PMN43490
                    *                                                 * PMN43500
                    *EXIT- DK000+1                                    * PMN43510
                    *                                                 * PMN43520
                    *TABLES/WORK AREAS- N/A                           * PMN43530
                    *                                                 * PMN43540
                    *ATTRIBUTES- RE-USABLE                            * PMN43550
                    *                                                 * PMN43560
                    *************************************************** PMN43570
                          HDNG    DUMMY KEYBOARD CONVERSION             PMN43580
                          ORG     0                                     PMN43590
*SBRKSMC 95         *SYS KEYBOARD CONVERSION                      V2M00 PMN43600
                          DC      3          SYS KEYBOARD CONV WD CNT   PMN43610
                          DC      @KBCV     PHASE ID FOR SYS KB/CP CONV PMN43620
                    DK000 BSC  L  *-*        DUMMY ENTRY FOR CONV       PMN43630
                          MDX     DK000     IMMEDIATE RETURN TO CALLER  PMN43640
                          HDNG    DISK1                                 PMN43650
                    *************************************************** PMN43660
                    *                                                 * PMN43670
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN43680
                    *                                                 * PMN43690
                    *FUNCTION/OPERATION-                              * PMN43700
                    *     DISK1 HAS THE FOLLOWING FIVE DISK FUNCTIONS-* PMN43710
                    *     *TEST  (TEST FOR DISK BUSY)                 * PMN43720
                    *     *READ                                       * PMN43730
                    *     *WRITE WITHOUT READ-BACK-CHECK              * PMN43740
                    *     *WRITE WITH READ-BACK-CHECK                 * PMN43750
                    *     *WRITE IMMEDIATE                            * PMN43760
                    *     *SEEK                                       * PMN43770
                    *                                                 * PMN43780
                    *ENTRY POINTS-                                    * PMN43790
                    *     DISK1 IS ENTERED                            * PMN43800
                    *     *FROM THE MONITOR AT D1000 + 0  (00F2)      * PMN43810
                    *     *FROM THE LEVEL 2 INTERRUPT AT D1000 + 5    * PMN43820
                    *     *FROM THE TRANSFER VECTOR AT D1000 +79      * PMN43830
                    *     AS FOLLOWS-                                 * PMN43840
                    *     LIBF    DISK1     (OR BSC  L  DZ000)        * PMN43850
                    *     DC      /WXYZ     CONTROL                   * PMN43860
                    *     DC      AREA      I/O AREA ADDRESS          * PMN43870
                    *     DC      ERROR     ERROR ROUTINE             * PMN43880
                    *     WHERE- W = I/O FUNCTION                     * PMN43890
                    *            X = NOT USED                         * PMN43900
                    *            Y = SEEK OPTION                      * PMN43910
                    *            Z = DISPLACEMENT OPTION              * PMN43920
                    *                                                 * PMN43930
                    *EXTERNAL REFERENCES- CALL IN COMMA)              * PMN43940
                    *     $ACDE                                       * PMN43950
                    *     $CYLN                                       * PMN43960
                    *     $DBSY                                       * PMN43970
                    *     $DCYL                                       * PMN43980
                    *     $DDSW                                       * PMN43990
                    *     $EXIT                                       * PMN44000
                    *     $FPAD                                       * PMN44010
                    *     $IOCT                                       * PMN44020
                    *     $PST2                                       * PMN44030
                    *     $PRET                                       * PMN44040
                    *                                                 * PMN44050
                    *EXITS- NORMAL                                    * PMN44060
                    *     *RETURN TO CALL + 3 ON TEST AND WRITE       * PMN44070
                    *      IMMEDIATE FUNCTIONS.                       * PMN44080
                    *     *RETURN TO CALL + 4 ON ALL OTHER FUNCTIONS. * PMN44090
                    *                                                 * PMN44100
                    *EXITS- ERROR                                     * PMN44110
                    *     *BRANCH TO $PRET WITH 5000 IN ACCUMULATOR   * PMN44120
                    *      WHEN DISK NOT READY. (002A)                * PMN44130
                    *     *BRANCH TO $PRET WITH 5001 IN ACCUMULATOR   * PMN44140
                    *      ON BAD CALL. (002A)                        * PMN44150
                    *     *BRANCH TO $PRET OR $PST2 WITH 5002 IN THE  * PMN44160
                    *      ACCUMULATOR ON WRITE SELCT/POWER UNSAFE    * PMN44170
                    *     *BRANCH TO $PST2 WITH 5003 IN ACCUMULATOR   * PMN44180
                    *      ON DATA ERROR OR DISK OVERFLOW,MONTOR CALL*  PMN44190
                    *     ***DRIVE CODE AND SECTOR ADDRESS IN EXT.    * PMN44200
                    *     *BRANCH TO $EXIT ON DISK OVERFLOW.          * PMN44210
                    *                                                 * PMN44220
                    *ATTRIBUTES-                                      * PMN44230
                    *     *DISK1 MAY BE CALLED FROM THE MONITOR OR BY * PMN44240
                    *      A LIBF.                                    * PMN44250
                    *     *DISK1 WILL OPERATE ON ONLY ONE OF THE FIVE * PMN44260
                    *      DRIVES AT A TIME.                          * PMN44270
                    *     *DISK1 ACCEPTS I/O AREA BEGINNING ON UNEVEN * PMN44280
                    *      BOUNTRIES.                                 * PMN44290
                    *                                                 * PMN44300
                    *NOTES- NONE                                      * PMN44310
                    *                                                 * PMN44320
                    *************************************************** PMN44330
                          HDNG    DISK1                                 PMN44340
                          ORG     DZ000-2                               PMN44350
*SBRKMET 97         *SYS DISK1                                    V2M06 PMN44360
                          DC      $1END-*-1 DISK1 WORD COUNT            PMN44370
                          DC      -151      DISK1 PHASE ID              PMN44380
                          DC      $1END-6-*+1                           PMN44390
                          DC      1                                     PMN44400
                          ORG     *-2                                   PMN44410
                          HDNG    DISK1                                 PMN44420
                    *                                                   PMN44430
                    *     MONITOR ENTRY.                                PMN44440
                    *                                                   PMN44450
                    D1000 DC      *-*       MONITOR ENTRY               PMN44460
                          STX   2 D1060+4   SAVE CONTENTS OF XR2.       PMN44470
                    D1010 LDX  L2 D1912     ADDR OF MON PSEUDO CALL + 1 PMN44480
                          MDX     D1120     BR TO SET UP MON CALL PARAM PMN44490
                    *                                                   PMN44500
                    *     INTERRUPT ENTRY.                              PMN44510
                    *                                                   PMN44520
                    D1020 DC      *-*       INTERRUPT ENTRY             PMN44530
                          MDX     D1200     BRANCH TO SERVICE INTERRUPT PMN44540
                    *                                                   PMN44550
                    *     LIBF ENTRY.                                   PMN44560
                    *                                                   PMN44570
                          STX   2 D1060+4   SAVE CONTENTS OF XR2.       PMN44580
                          LDX  I2 *-*       LINK WORD FROM TV TO XR2    PMN44590
                    D1030 STX   1 D1060+2   SAVE CONTENTS OF XR1.       PMN44600
                          STS     D1060     SAVE STATUS OF CARRY/OVFLO. PMN44610
                          STD     D1912     SAVE CONTENTS OF ACC/EXT    PMN44620
                    D1040 SLT     16        CLEAR EXTENSION.            PMN44630
                          LD    2 0         FETCH FIRST PARAMETER       PMN44640
                          RTE     12        RIGHT JUSTIFY DRIVE CODE.   PMN44650
                          BSC  L  D1240,Z   BRANCH IF FUNCTION NOT TEST PMN44660
                    *                                                   PMN44670
                    *     TEST FUNCTION                                 PMN44680
                    *                                                   PMN44690
                          MDX  L  $DBSY,0   IF DISK BUSY, SET UP TO     PMN44700
                          MDX   2 -1        *RETURN TO CALL+3, ELSE SET PMN44710
                    D1050 MDX   2 3         *RETURN TO CALL+4.          PMN44720
                          STX   2 D1070     STORE RETURN ADDRESS.       PMN44730
                    *                                                   PMN44740
                    *     RETURN TO USER                                PMN44750
                    *                                                   PMN44760
                    D1060 LDS     0         RESTORE CARRY AND OVERFLOW. PMN44770
                          LDX  L1 *-*       RESTORE CONTENTS OF XR1.    PMN44780
                          LDX  L2 *-*       RESTORE CONTENTS OF XR2.    PMN44790
                          LDD     D1912     RESTORE ACC AND EXT         PMN44800
                          BSC  L  *-*       RETURN TO USER.             PMN44810
                    D1070 EQU     *-1       RETURN ADDRESS              PMN44820
                    *                                                   PMN44830
                    * SET UP FOR PRE-OPERATIVE ERROR EXIT               PMN44840
                    *                                                   PMN44860
                    D1080 LD    2 D1951-C   LOAD DISK NOT READY CODE    PMN44870
                          MDX     D1100+1   BR TO SET UP ERROR EXIT.    PMN44880
                    D1090 LD      D1150+1   LOAD ADDRESS OF CALL+1.     PMN44890
                          S       D1010+1   SUB ADDR OF MON PSEUDO CALL PMN44900
                          BSC  L  D1320,+-  BR IF IT WAS A MON CALL     PMN44910
                    D1100 LD    2 D1952-C   FETCH PREOP ERROR CODE.     PMN44920
                    D1110 SRT     16        SHIFT ERROR CODE TO EXT.    PMN44940
                          STO     $DBSY     CLEAR DISK BUSY INDR    2-8 PMN44950
                          MDX  L  $IOCT,-1  DECR I/O-COUNTER        2-8 PMN44960
                          NOP               IN CASE OF SKIP         2-8 PMN44970
                          SLT     16        SHIFT ERROR CODE TO ACC     PMN45010
                          LDX  I2 D1150+1   XR2 TO ADDR OF CALL+1.      PMN45020
                          BSI  L  $PRET                                 PMN45030
                          MDX     D1040     BR TO RETRY CALL TO DISKN.  PMN45040
                    *                                                   PMN45050
                    *     MONITOR ENTRY CONTINUED                       PMN45060
                    *                                                   PMN45070
                    *     SET UP CONTROL PARAMETER FOR MONITOR CALL     PMN45080
                    *                                                   PMN45090
                    D1120 SLA     8                                     PMN45100
                          BSC     Z         SKIP IF FUNCTION IS READ.   PMN45110
                          LD      D1949     SET UP                      PMN45120
                          A       D1140     *FUNCTION CODE.             PMN45130
                          MDX     D1030     BR TO PROCESS CALL.         PMN45140
                    *                                                   PMN45150
                    *     CLEAR DISK BUSY INDICATOR AND DECREMENT THE   PMN45160
                    *      SYSTEM I/O COUNTER BEFORE RETURNING TO THE   PMN45170
                    *      CALLING PROGRAM.                             PMN45180
                    *                                                   PMN45190
                    D1130 SLA     16        CLEAR DISK                  PMN45200
                          STO     $DBSY     *BUSY INDICATOR             PMN45210
                          MDX  L  $IOCT,-1  DECREMENT SYS I/O COUNTER.  PMN45220
                    D1140 NOP               IN CASE OF SKIP.            PMN45230
                    D1150 LDX  L2 *-*       XR2 SET TO ADDR OF CALL+1.  PMN45240
                          LD      D1020     INTERRUPT ENTRY         2-6 PMN45250
                          BSC     +-        *                       2-6 PMN45260
                          MDX     D1050     NO                      2-6 PMN45270
                          STO     D1151+1   YES                     2-6 PMN45280
                          SLA     16        RESET                   2-6 PMN45290
                          STO     D1020     *INT ENTRY              2-6 PMN45300
                    D1151 BSC  L  *-*                               2-6 PMN45310
                    *                                                   PMN45320
                    *     TRAP OUT TO POSTOPERATIVE TRAP                PMN45330
                    *                                                   PMN45340
                    D1160 LD    2 D1953-C   LD WR/SELECT-PWR/UNSAFE CD. PMN45350
                          MDX     D1110     BR TO SET UP FOR ERROR TRAP PMN45360
                    *                                                   PMN45370
                    *     SET UP TO INDICATE DISK OVERFLOW CONDITION.   PMN45380
                    *                                                   PMN45390
                    D1170 LD      D1020     CALL OR INT SERVICE     2-6 PMN45400
                          BSC  L  D1100,+-  BRANCH IF SERVICING A CALL. PMN45410
                          LDD     D1941     LD OVFL INDR TO EXT    2-10 PMN45420
                          BSI     D1180     BRANCH TO SET UP ERROR EXIT PMN45430
                    D1175 LDX   1 $EXIT     SET UP BRANCH TO            PMN45440
                          STX   1 D1020     *$EXIT IN COMMA.            PMN45450
                          BOSC L  D1130     GO TO MAKE EXIT.            PMN45460
                    *                                                   PMN45470
                    *     SET UP FOR RECURRENT DISK ERROR EXIT.         PMN45480
                    *                                                   PMN45490
                    D1180 DC      *-*                                   PMN45500
                          LD      D1150+1   SEE IF IT WAS A USER        PMN45520
                          S       D1010+1   *OR MONITOR CALL.           PMN45530
                          BSC     +-        SKIP IF LIBF CALL      2-10 PMN45540
                    *THE NEXT INSTRUCTION WILL FORCE ERROR CODE TO 2-10 PMN45550
                    *EXTENTION                                     2-10 PMN45555
                          LDD     D1954     LD MON ER CODE TO EXT  2-10 PMN45560
                    D1185 LD    2 D1270+1-C LOAD LOGICAL DRIVE CODE     PMN45570
                          SLA     12        LEFT JUSTIFY DRIVE CODE.    PMN45580
                          OR      D1926     OR IN SECTOR ADDRESS.       PMN45590
                          RTE     16                                    PMN45600
                    D1190 BSI  L  *-*       BR TO ERROR SUBR OF CALLER. PMN45610
                          BSC  I  D1180     BR TO SEE IF RETRY IN ORDER PMN45620
                    *                                                   PMN45630
                    *     INTERRUPT ENTRY CONTINUED                     PMN45640
                    *                                                   PMN45650
                    D1200 XIO     D1951     SENSE DISK WITH RESET   2-6 PMN45660
                          STO     $DDSW     SAVE IN COMM. AREA      212 PMN45665
                    D1205 LDX  L2 C         POINT XR2 TO CNST AREA  2-6 PMN45670
                          BSC     -         SKIP IF ERROR           2-9 PMN45680
                          MDX     D1210     BR IF NO ERROR         2-11 PMN45690
                          SLA     2         TEST FOR WR SEL/PWR UNS 2-9 PMN45700
                          BSC  L  D1220+1,- BR IF NOT WR SEL        2-9 PMN45710
                          LD      D1953     LD WR SEL/PWR UNS CODE  2-9 PMN45720
                          BSI  L  $PST2     BR TO DISPLAY           2-9 PMN45730
                          MDX     D1175     BR TO EXIT              2-9 PMN45740
                    *                                              2-11 PMN45750
                    *                                              2-11 PMN45760
                    *                       5 INSTRUCTIONS MOVED   2-11 PMN45770
                    *                                              2-11 PMN45780
                    *                                              2-11 PMN45790
                    D1210 LDX  L1 *-*       SET XR1 TO $FPAD & DRIVE NO PMN45820
                          BSC  L  *-*       BRANCH TO PERFORM           PMN45830
                    D1220 EQU     *-1       *NEXT OPERATION.            PMN45840
                    *                                                   PMN45850
                    *     START ALL DISK OPERATIONS                     PMN45860
                    *                                                   PMN45870
                          LD      D1928     SET READ /WR/SEEK      2-10 PMN45880
                          SRA     1         *IN CASE OF BRANCH     2-10 PMN45890
                          A       D1900     *TO ERROR ROUTINE      2-10 PMN45900
                          SRT     16        SHIFT TO EXTENSION     2-10 PMN45905
                          MDX  L  $DBSY,-1  SKIP IF 16 RETRIES MADE.    PMN45910
                          MDX     D1230     BRANCH TO RETRY.            PMN45920
                          LD      D1928     LD FUNCTION CODE       2-10 PMN45922
                          S       D1941     S WR IMMEDIATE CODE    2-10 PMN45924
                          BSC  L  D1210,+-  IGNORE ERROR IF WR IM  2-11 PMN45926
                          BSI     D1180     BRANCH TO SET UP ERROR EXIT PMN45930
                          MDX  L  $DBSY,17  BUSY IND TO 17          2-6 PMN45940
                          BSC  L  D1230,Z   BR IF USER NOT IGNOR ERR2-6 PMN45950
                          LDX  I1 D1906     XR1 = ADDR OF I/O BUF  2-11 PMN45960
                          LD      D1902     RESTORE FIRST TWO      2-11 PMN45965
                          STO   1 0         *WORDS OF              2-11 PMN45970
                          LD      D1903     *USERS                 2-11 PMN45975
                          STO   1 1         *BUFFER                2-11 PMN45976
                          MDX     D1130     EXIT-USER IGNORED ERROR2-11 PMN45980
                    D1230 XIO     D1904     INITIATE DISK OPERATION.    PMN45990
                          MDX     D1150     BRANCH TO SET UP EXIT.      PMN46000
                    *                                                   PMN46010
                    *     CONSTANTS AND WORK AREAS                      PMN46020
                    *                                                   PMN46030
                    *                       D1955 MOVED AFTER D19562-11 PMN46035
                          BSS  E  0                                     PMN46040
                    C     EQU     *                                     PMN46050
                    D1912 DC      *-*       CONTENTS OF ACC             PMN46060
                    D1913 DC      *-*       CONTENTS OF EXT             PMN46070
                          DC      $PST2     ADDR OF MONITOR ERROR EXIT  PMN46080
                          BSC  I  D1000     RETURN TO MONITOR           PMN46090
                    D1921 DC      /0101     MASK USED TO FORM READ IOCC PMN46100
                    *                                                   PMN46110
                    D1900 DC      1         CONSTANT ONE/               PMN46120
                    *                       *READ-AFTER-SEEK WORD COUNT PMN46130
                    D1901 DC      *-*       CURRENT ARM POSITION.       PMN46140
                    D1904 DC      *-*       IOCC FOR OPERATION          PMN46150
                    D1905 DC      *-*       *CURRENTLY BEING PREFORMED  PMN46160
                    D1906 DC      *-*       IOCC OF USER                PMN46170
                    D1907 DC      *-*       *REQUESTED OPERATION        PMN46180
                    D1902 DC      *-*       LAST TWO WORDS OF           PMN46190
                    D1903 DC      *-*       * SECTOR PREVIOUSLY READ    PMN46200
                    D1908 DC      D1900     IOCC FOR                    PMN46210
                    D1909 DC      *-*       *READ-AFTER-SEEK            PMN46220
                    D1951 DC      /5000     DISK NOT READY ERROR CODE   PMN46230
                    D1911 DC      *-*       2ND WORD OF SENSE IOCC.     PMN46240
                    D1922 DC      /2028     USED TO FORM NEXT OP IOCC.  PMN46250
                    D1923 DC      /0301     USED IN FORMING ERROR CODES PMN46260
                    D1924 DC      *-*       USED TO CHK DEFECTIVE CYLS. PMN46270
                    D1925 DC      *-*       INTERMEDIATE WORD COUNT     PMN46280
                    D1926 DC      *-*       ADDRESS OF NEXT SEQ. SECTOR PMN46290
                    D1927 DC      *-*       USED TO FORM USERS IOCC.    PMN46300
                    D1928 DC      *-*       FUNCTION CODE               PMN46310
                    D1929 DC      *-*       SEEK OPTION PARAMETER.      PMN46320
                    D1930 DC      *-*       DISPLACEMENT OPTION PARAM.  PMN46330
                    D1931 DC      /0600     2ND WORD OF READ IOCC.      PMN46340
                    D1933 DC      /0180     USED TO FORM RDBCK/CHK IOCC PMN46350
                    * D1954 MUST BE ON ODD ADDRESS                 2-10 PMN46355
                    D1954 DC      /5003     MON CALL DISK ER CODE  2-10 PMN46360
                    D1940 DC      3         MAXIMUM NO. OF DEF CYLS.    PMN46370
                    D1941 DC      4         SEEK HOME BIT.              PMN46380
                    D1942 DC      5         MAXIMUM VALID FUNCTION CODE PMN46390
                    D1943 DC      8         NO. OF SECTORS PER CYLINDER PMN46400
                    D1944 DC      320       NO OF DATA WORDS IN SECTOR. PMN46410
                    D1945 DC      321       NO OF DATA WORDS IN SCTR+1. PMN46420
                    D1946 DC      1599      LARGEST USABLE SCTR ADDRESS PMN46430
                    D1947 DC      /0007     USED TO MASK OUT SCTR NO.   PMN46440
                    D1948 DC      *-*                                   PMN46450
                    D1949 DC      /2000     TO FORM NON CALL FUNC CODE. PMN46460
                    D1950 DC      /FFFF     USED TO COMPLEMENT NEG NO.  PMN46470
                    D1952 DC      /5001     PREOPERATIVE ERROR CODE.    PMN46480
                    D1953 DC      /5002     WR/SELECT-PWR/UNSAFE ERR CD PMN46490
                    D1956 DC      /0FFF     MASK                   2-10 PMN46505
                    D1955 DC      *-*       USED FOR DEF CYL ADJST 2-11 PMN46506
                    *                                                   PMN46510
                    *     PROCESS ALL FUNCTIONS EXCEPT TEST             PMN46520
                    *                                                   PMN46530
                    D1240 MDX  L  $DBSY,0   TEST TO SEE IF DISK IS BUSY PMN46540
                          MDX     *-3       BRANCH TO TEST AGAIN        PMN46550
                          STX   2 D1150+1   SAVE THE LINK WORD          PMN46560
                          STO     D1928     SAVE FUNCTION CODE.         PMN46570
                          STO     D1948                                 PMN46580
                          SRA     1                                     PMN46590
                          BSC     Z                                     PMN46600
                          LD      D1900                                 PMN46610
                          A       D1900                                 PMN46620
                          SLA     8                                     PMN46630
                          STO     D1927                                 PMN46640
                          SLT     8         ISOLATE AND SAVE SEEK       PMN46650
                          STO     D1929     *OPTION PARAMETER.          PMN46660
                          SLT     16        ISOLATE AND SAVE DISPLCMNT  PMN46670
                          STO     D1930     *OPTION PARAMETER.          PMN46680
                          LD    2 1         SET UP FIRST WORD OF IOCC   PMN46690
                          STO     D1906     *WITH ADDR OF I/O BUFFER.   PMN46700
                          STO     D1260+1   SAVE ADDR OF I/O BUFFER.    PMN46710
                          LD    2 2         SET UP BRANCH INSTRUCTION   PMN46720
                          STO     D1190+1   *TO USERS ERROR SUBROUTINE. PMN46730
                          LDX  L2 C                                     PMN46740
                          MDX  L  $IOCT,1   INCREMENT SYS I/O COUNTER.  PMN46750
                    D1250 LDX   1 @TCNT     SET DISK BUSY               PMN46760
                          STX  L1 $DBSY     *INDICATOR TO 17.           PMN46770
                    D1260 LDX  L1 *-*       POINT XR1 TO I/O AREA.      PMN46780
                          SLT     32                                    PMN46790
                          STO     D1924                                 PMN46800
                          LD    1 0         LOAD AND SAVE               PMN46810
                          STO   2 D1925-C   *USERS WORD COUNT.          PMN46820
                          LD    1 1         LOAD AND SAVE USERS         PMN46830
                          STO   2 D1926-C   *SECTOR ADDRESS.            PMN46840
                          RTE     12        RIGHT JUSTIFY DRIVE CODE.   PMN46850
                          STO     *+1                                   PMN46860
                    D1270 LDX  L1 *-*       LOAD XR1 WITH DRIVE CODE.   PMN46870
                          S     2 D1942-C                               PMN46880
                          BSC  L  D1100,-                               PMN46890
                          MDX  L1 $FPAD     POINT XR1 TO $FPAD+DRIVE NO PMN46900
                          STX   1 D1210+1                               PMN46910
                          SLT     12        SHIFT SECTOR ADDR INTO ACC. PMN46920
                          MDX  L  D1930,0   SKIP IF DISPL OPT NOT USED. PMN46930
                          A     1 0         ADD IN FILE PROTECT ADDRESS PMN46940
                          AND     D1956     MASK OUT DR CODE       2-10 PMN46950
                          STO   2 D1926-C   SAVE USERS SECTOR ADDRESS.  PMN46970
                          SRT     3         SHIFT SECTOR NO INTO EXT.   PMN46980
                    *                                                   PMN46990
                    *     SET UP SECOND WORD OF IOCCS.                  PMN47000
                    *                                                   PMN47010
                          LD    1 $ACDE-$FPAD LOAD AREA CD FOR THIS DR. PMN47020
                          BSC  L  D1100,+-  BR IF THIS DR NOT ON SYSTEM PMN47030
                          OR    2 D1931-C   SET UP SECOND WORD OF       PMN47040
                          STO   2 D1909-C   *READ-AFTER-SEEK IOCC.      PMN47050
                          OR    2 D1921-C   SET UP SECOND WORD OF       PMN47060
                          STO   2 D1911-C   *SENSE W/RESET IOCC.        PMN47070
                          SRA     3         *WORD OF USER               PMN47080
                          SLT     3         *   REQUESTED               PMN47090
                          EOR   2 D1927-C   SET UP SECOND WORD          PMN47100
                          STO   2 D1907-C   *OF USERS IOCC.             PMN47110
                          XIO   2 D1951-C   SENSE THE DISK WITH RESET.  PMN47120
                          BSC  L  D1160,Z+  BR IF PWR/UNSAFE OR WR/SEL. PMN47130
                          SLA     2                                     PMN47140
                          BSC  L  D1080,Z+  BRANCH IF DISK NOT READY.   PMN47150
                          LD    2 D1928-C   LOAD FUNCTION CODE.         PMN47160
                          S     2 D1942-C   SUBTRACT FIVE.              PMN47170
                          BSC  L  D1100,Z-  BR IF FUNCTION CODE ILLEGAL PMN47180
                          BSC  L  D1340,Z   BRANCH IF FUNCTION NOT SEEK PMN47190
                          STO   2 D1925-C   CLEAR INTERMEDIAT WC    2-1 PMN47200
                          LD    2 D1929-C   LOAD SEEK OPTION PARAMETER  PMN47210
                          BSC  L  D1290,+-  BR IF SEEK OPTION NOT USED  PMN47220
                    D1280 LD    2 D1943-C   LOAD CONSTANT OF EIGHT      PMN47230
                          STO   2 D1924-C                               PMN47240
                          A     1 $CYLN-$FPAD ADD CURRENT ARM POSITION. PMN47250
                          STO   2 D1926-C   STORE AS WORKING SCTR ADDR. PMN47260
                    D1290 SLA     16                                    PMN47270
                          STO   2 D1955-C                               PMN47280
                          XIO   2 D1951-C   SENSE DSW              2-11 PMN47290
                          SLA     4         CHECK FOR CART HOME    2-11 PMN47300
                          BSC     +Z        SKIP IF NOT            2-11 PMN47310
                          MDX     D1325     BR IF CART HOME        2-11 PMN47320
                    *                                              2-11 PMN47330
                    *                       2 NOP S  REMOVED       2-11 PMN47335
                    D1295 MDX  I1 D1270+1                               PMN47340
                          MDX  I1 D1270+1                               PMN47350
                    *                                                   PMN47360
                    *     CHECK FOR DEFECTIVE CYLINDERS.                PMN47370
                    *                                                   PMN47380
                          LD    2 D1926-C   LOAD WORKING SECTOR ADDRESS PMN47390
                    D1300 S     1 $DCYL-$FPAD SUBTRACT DEF CYL ADDRESS. PMN47400
                          BSC  L  D1310,Z+  BR IF GT WORKING SCTR ADDR. PMN47410
                          MDX  L  D1955,8                               PMN47420
                          BSC     Z                                     PMN47430
                          S     2 D1924-C                               PMN47440
                          A     2 D1943-C   ADD EIGHT TO SECTOR ADDRESS PMN47450
                    D1310 A     1 $DCYL-$FPAD ADD BACK DEF CYL ADDRESS. PMN47460
                          MDX   1 1         POINT TO NEXT DEF CYL ADDR. PMN47470
                          MDX  L  D1940,-1  DECREMENT COUNTER.          PMN47480
                          MDX     D1300     BR TO CHECK NEXT DEF CYL.   PMN47490
                          MDX  L  D1940,3                               PMN47500
                          LDX  I1 D1210+1   RESET XR1 AS POINTER.       PMN47510
                          STO   2 D1926-C   SAVE ADJUSTED SCTR ADDR.    PMN47520
                          S     2 D1955-C   SEE IF SECTOR ADDRESS       PMN47530
                          S     2 D1946-C   *EXCEEDS MAXIMUM LIMIT.     PMN47540
                          BSC  L  D1170,Z-  BR IF SECTOR ADDR TOO LARGE PMN47550
                    *                                                   PMN47560
                    *     CHECK FOR FILE PROTECTION.                    PMN47570
                    *                                                   PMN47580
                          LD    1 0         LOAD FILE PROTECT ADDRESS.  PMN47590
                          AND     D1956     MASK OUT DR CODE       2-10 PMN47600
                          S     2 D1926-C                               PMN47620
                          BSC  L  D1320,+   BR IF SCTR ADDR GTE $FPAD.  PMN47630
                          LD    2 D1928-C   LOAD FUNCTION CODE.         PMN47640
                          SRA     1                                     PMN47650
                          BSC  L  D1090,E   BRANCH IF FUNCTION IS WRITE PMN47660
                    *                                                   PMN47670
                    D1320 LD    2 D1926-C   LOAD USERS SECTOR ADDRESS.  PMN47680
                          S     1 $CYLN-$FPAD SUBTRACT CURRENT ARM POS. PMN47690
                          SRT     3                                     PMN47700
                          BSC  L  D1370,+-  BRANCH IF SEEK NOT NEEDED.  PMN47710
                    *                                                   PMN47720
                    *     SEEK                                          PMN47730
                    *                                                   PMN47740
                    *                                              2-11 PMN47750
                    *                       3 INSTRUCTIONS REMOVED 2-11 PMN47760
                    *                                              2-11 PMN47770
                          SRT     16                                    PMN47780
                          AND   2 D1941-C   AND WITH BIT 13.            PMN47790
                          OR    2 D1911-C   OR IN 2ND WD OF SENSE IOCC. PMN47800
                          EOR   2 D1923-C   MASK OUT BITS 6, 7, AND 15. PMN47810
                          RTE     16                                    PMN47820
                          BSC  L  *+2,-     BR IF SEEK AWAY FROM HOME   PMN47830
                          EOR   2 D1950-C   COMPLEMENT NO. OF CYLS TO   PMN47840
                          A     2 D1900-C   *SEEK TO GET POSITIVE NO.   PMN47850
                          STD   2 D1904-C                               PMN47860
                    *                                              2-11 PMN47870
                    *                                              2-11 PMN47880
                    *                       5 INSTRUCTIONS MOVED   2-11 PMN47890
                    *                                              2-11 PMN47900
                    *                                              2-11 PMN47910
                          BSI   2 D1220-C   BRANCH TO INITIATE SEEK.    PMN47920
                    *                                                   PMN47930
                    * SEEK COMPLETE INTERRUPT PROCESSING.               PMN47940
                    *                                                   PMN47950
                    *  3 INSTRUCTIONS REMOVED                      2-12 PMN47960
                    D1325 LDD   2 D1908-C   SET UP IOCC FOR        2-11 PMN47990
                          STD   2 D1904-C   *READ AFTER SEEK.           PMN48000
                          BSI   2 D1220-C   BR TO START READ AFTER SEEK PMN48010
                    *                                                   PMN48020
                    * READ-AFTER-SEEK COMPLETE INTERRUPT PROCESSING.    PMN48030
                    *                                                   PMN48040
                          LD    2 D1901-C   LOAD ADDR OF SCTR JUST READ PMN48050
                    D1330 STO   1 $CYLN-$FPAD UPDATE CURRENT ARM POS.   PMN48060
                          MDX     D1320                                 PMN48070
                    *                                                   PMN48080
                    D1340 LD    2 D1925-C   LOAD USERS WORD COUNT.      PMN48090
                          BSC  L  D1100,+   BR IF WORD COUNT ILLEGAL.   PMN48100
                          LD    2 D1928-C   LOAD FUNCTION CODE.         PMN48110
                          SRA     2                                     PMN48120
                          BSC  L  D1290,+-  BR IF NOT WRITE IMMEDIATE.  PMN48130
                          STO   2 D1929-C   SAVE AS SEEK OPTION.        PMN48140
                          MDX  L  D1150+1,-1  DECR ADDRESS OF CALL + 1. PMN48150
                          LD    2 D1926-C   FETCH NEXT SECTOR ADDRESS.  PMN48160
                          AND   2 D1947-C   MASK OUT ALL BUT SECTOR NO. PMN48170
                          A     1 $CYLN-$FPAD  ADD CURRENT ARM POSITION PMN48180
                          STO   2 D1926-C   SAVE AS NEXT SEQ SCTR ADDR. PMN48190
                    D1350 BSC  L  D1280,C   BRANCH IF CARRY ON.         PMN48200
                    *                                                   PMN48210
                    *     READ/WRITE                                    PMN48220
                    *                                                   PMN48230
                          LDX  I1 D1906     POINT XR1 TO I/O AREA.      PMN48240
                          LD    1 0         FETCH AND                   PMN48250
                          STO   2 D1902-C   *SAVE LAST TWO WORDS        PMN48260
                          LD    1 1         *OF PREVIOUSLY              PMN48270
                          STO   2 D1903-C   *READ SECTOR.               PMN48280
                          LD    2 D1925-C   DECREMENT                   PMN48290
                          S     2 D1944-C   *INTERMEDIATE WORD COUNT BY PMN48300
                          STO   2 D1925-C   *ONE SECTOR (320 WORDS).    PMN48310
                          BSC     Z-        SKIP IF NOT LAST SECTOR     PMN48320
                          SRA     16        CLEAR ACCUMULATOR           PMN48330
                          A     2 D1945-C   ADD SECTOR WORD COUNT (321) PMN48340
                          STO   1 0         *AND STORE TO I/O AREA.     PMN48350
                          LD    2 D1926-C   FETCH NEXT SECTOR ADDRESS   PMN48360
                          STO   1 1         *AND STORE TO I/O AREA      PMN48370
                          LDD   2 D1906-C   FETCH USER REQUESTED IOCC   PMN48380
                          STD   2 D1904-C   *AND STORE TO CURRENT IOCC  PMN48390
                          BSI   2 D1220-C   BRANCH TO START READ/WRITE. PMN48400
                    *                                                   PMN48410
                    *     READ/WRITE COMPLETE INTERRUPT PROCESSING      PMN48420
                    *                                                   PMN48430
                          LDX  I1 D1906     XR1 = ADDR OF I/O BUF  2-11 PMN48431
                          LD    2 D1902-C   RESTORE FIRST          2-11 PMN48432
                          STO   1 0         *TWO WORDS             2-11 PMN48433
                          LD    2 D1903-C   *OF USERS              2-11 PMN48434
                          STO   1 1         *BUFFER                2-11 PMN48435
                          LDX   1 @TCNT     SET DISK BUSY          2-11 PMN48436
                          STX  L1 $DBSY     *INDICATOR TO 17       2-11 PMN48437
                          LDX  I1 D1210+1   XR1 = $FPAD & DR NO.   2-11 PMN48438
                          LDD   2 D1904-C   FETCH CURRENT IOCC.         PMN48440
                          RTE     3         ROTATE SECTOR NO. TO ACC.   PMN48450
                          A     2 D1922-C   INCR SCTR NO.,I/O AREA ADDR PMN48460
                          RTE     29        ROTATE SCTR NO. BACK TO EXT PMN48470
                          STD   2 D1906-C   SAVE NEW IOCC               PMN48480
                          MDX  L  D1926,1   INCR NEXT SEQ SECTOR ADDR.  PMN48490
                    D1370 LD    2 D1925-C   FETCH INTERMEDIATE WORD CNT PMN48500
                          BSC  L  D1350,Z-  *AND BRANCH IF POSITIVE.    PMN48510
                    *                                                   PMN48520
                    *     READBACK-CHECK                                PMN48530
                    *                                                   PMN48540
                          LD    2 D1260+1-C RESTORE ADDR OF USERS I/O   PMN48550
                          STO   2 D1906-C   *AREA TO 2ND WORD OF IOCC   PMN48560
                          LDX  I1 D1906     POINT XR2 TO I/O AREA.      PMN48570
                          LD    1 0         FETCH AND                   PMN48580
                          STO   2 D1902-C   *SAVE USERS WORD COUNT      PMN48590
                          LD    1 1         *AND                        PMN48600
                          STO   2 D1903-C   *USERS SECTOR ADDRESS.      PMN48610
                          LD    2 D1928-C   FETCH FUNCTION CODE.        PMN48620
                          S     2 D1940-C   TEST FOR AND                PMN48630
                    D1380 BSC  L  D1130,Z   *BRANCH IF NOT WRITE/RBC.   PMN48640
                          LD    2 D1933-C   SET UP TO BUILD             PMN48650
                          STO   2 D1927-C   *READ-BACK-CHECK IOCC.      PMN48660
                          MDX  L  D1948,-4  DECREMENT FUNCTION CODE.    PMN48670
                          MDX     D1380     BRANCH IF RBC DONE.         PMN48680
                          BSC  L  D1250     BRANCH TO DO READ-BACK-CK.  PMN48690
                    *                                                   PMN48700
                    *                       1 CONSTANT REMOVED     2-11 PMN48705
                    *                                                   PMN48710
                    $1END EQU     /0294     1 + END OF DISK1       2-11 PMN48712
                    *                                              2-11 PMN48714
                          BSS     $1END-*-6  PATCH AREA            2-11 PMN48716
                          DC      @CIL1                                 PMN48720
                          DC      *-*                                   PMN48730
                          DC      *-*                                   PMN48740
                          DC      *-*                                   PMN48750
                          DC      *-*       WORD COUNT AND SECTOR ADDR  PMN48760
                          DC      *-*       *FOR CORE LOADS             PMN48770
                    *                       $1END EQUATE MOVED     2-11 PMN48780
                          HDNG    DISKN                                 PMN48790
                    *************************************************** PMN48800
                    *                                                 * PMN48810
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN48820
                    *                                                 * PMN48830
                    *FUNCTION/OPERATION-                              * PMN48840
                    *     DISKN HAS THE FOLLOWING SIX DISK FUNCTIONS- * PMN48850
                    *     *TEST  (TEST FOR DISK BUSY)                 * PMN48860
                    *     *READ                                       * PMN48870
                    *     *WRITE WITHOUT READ-BACK-CHECK              * PMN48880
                    *     *WRITE WITH READ-BACK-CHECK                 * PMN48890
                    *     *WRITE IMMEDIATE                            * PMN48900
                    *     *SEEK                                       * PMN48910
                    *                                                 * PMN48920
                    *ENTRY POINTS-                                    * PMN48930
                    *     DISKN IS ENTERED                            * PMN48940
                    *     *FROM THE MONITOR AT DN000  (00F2)          * PMN48950
                    *     *FROM THE TRANSFER VECTOR AT DN030 - 1      * PMN48960
                    *     AS FOLLOWS-                                 * PMN48970
                    *     LIBF    DISKN     (OR BSI  L  DZ000)        * PMN48980
                    *     DC      /WXYZ     CONTROL                   * PMN48990
                    *     DC      AREA      I/O AREA ADDRESS          * PMN49000
                    *     DC      ERROR     ERROR ROUTINE             * PMN49010
                    *     WHERE-  W = I/O FUNCTION CODE               * PMN49020
                    *             X = USED DURING TEST                * PMN49030
                    *             Y = SEEK OPTION                     * PMN49040
                    *             Z = DISPLACEMENT OPTION             * PMN49050
                    *                                                 * PMN49060
                    *EXTERNAL REFERENCES-  (ALL IN COMMA)             * PMN49070
                    *     $ACDE                                       * PMN49080
                    *     $CYLN                                       * PMN49090
                    *     $DBSY                                       * PMN49100
                    *     $DCYL                                       * PMN49110
                    *     $EXIT                                       * PMN49120
                    *     $FPAD                                       * PMN49130
                    *     $IOCT                                       * PMN49140
                    *     $PST2                                       * PMN49150
                    *     $PRET                                       * PMN49160
                    *                                                 * PMN49170
                    *EXITS- NORMAL                                    * PMN49180
                    *     *RETURN TO CALL + 3 ON TEST AND WRITE       * PMN49190
                    *      IMMEDIATE FUNCTIONS.                       * PMN49200
                    *     *RETURN TO CALL + 4 ON ALL OTHER FUNCTIONS. * PMN49210
                    *                                                 * PMN49220
                    *EXITS- ERROR                                     * PMN49230
                    *     *BRANCH TO $PRET WITH 5000 IN ACCUMULATOR   * PMN49240
                    *      WHEN DISK NOT READY.                       * PMN49250
                    *     *BRANCH TO $PRET WITH 5001 IN ACCUMULATOR   * PMN49260
                    *      ON BAD CALL.                               * PMN49270
                    *     *BRANCH TO $PRET OR $PST2 WITH 5002 IN THE  * PMN49280
                    *      ACCUMULATOR ON WRITE SELECT/POWER UNSAFE   * PMN49290
                    *     *BRANCH TO $PST2 WITH 5003 IN ACCUMULATOR   * PMN49300
                    *      ON DATA ERROR OR DISK OVERFLOW,MONITOR CALL* PMN49310
                    *     ***DRIVE CODE AND SECTOR ADDRESS IN EXT.    * PMN49320
                    *     *BRANCH TO $EXIT ON DISK OVERFLOW.          * PMN49330
                    *     *BRANCH TO CALLER ERROR ROUTINE ON POST-    * PMN49340
                    *      OPERATIVE ERROR.                           * PMN49350
                    *                                                 * PMN49360
                    *ATTRIBUTES-                                      * PMN49370
                    *     *DISKN MAY BE CALLED FROM THE MONITOR OR BY * PMN49380
                    *      A LIBF.                                    * PMN49390
                    *     *DISKN WILL OPERATE ON MULTIPLE DRIVES      * PMN49400
                    *      SIMULTANEOUSLY.                            * PMN49410
                    *     *DISKN ACCEPTS I/O AREAS BEGINNING ON UNEVEN* PMN49420
                    *      BOUNDRIES.                                 * PMN49430
                    *     *DISKN IS NOT RELOCATABLE.                  * PMN49440
                    *     *DISKN IS REUSABLE.                         * PMN49450
                    *                                                 * PMN49460
                    *NOTES- NONE                                      * PMN49470
                    *                                                 * PMN49480
                    *************************************************** PMN49490
                          HDNG    DISKN                                 PMN49500
                    * PARAMETERS FOR THE SYSTEM LOADER                  PMN49510
                    *                                                   PMN49520
                          ORG     DZ000-2                               PMN49530
*SBRKCLM 98         *SYS DISKN                                    V2M00 PMN49540
                          DC      $NEND-*   DISKN WORD COUNT.           PMN49550
                          DC      -@DNID                                PMN49560
                          DC      $NEND-6-*+1 ADDR OF SLET EXTRACT      PMN49570
                          DC      1         NO. ENTRIES IN SLET EXTRACT PMN49580
                          ORG     *-2                                   PMN49590
                          HDNG    DISKN                                 PMN49600
                    DN000 DC      *-*       ENTRY PT FOR MONITOR PROGS. PMN49610
                          STX   2 DN110+3   SAVE CONTENTS OF XR2.       PMN49620
                          LDX  L2 DN902     FETCH ADDR OF PSEUDO CALL.  PMN49630
                          MDX     DN210     BRANCH AROUND ENTRY POINTS. PMN49640
                    DN020 DC      *-*       ENTRY POINT FOR INTERRUPTS. PMN49650
                          MDX     DN240     BR TO INTERRUPT PROCESSING. PMN49660
                          STX   2 DN110+3   SAVE CONTENTS OF XR2.       PMN49670
                          LDX  I2 *-*       PUT LINK WD FROM TV IN XR2. PMN49680
                    DN030 STX   1 DN110+1   SAVE CONTENTS OF XR1        PMN49690
                          STX   2 DN230+1   SAVE ADDRESS OF CALL+1.     PMN49700
                          STD     DN902     SAVE CONTENTS OF ACC/EXT.   PMN49710
                          STS     DN100     SAVE STATUS OF INDICATORS.  PMN49720
                    DN040 LD    2 0         LOAD CONTROL PARAMETER.     PMN49730
                          SRT     12        ISOLATE FIRST DIGIT.        PMN49740
                          BSC  L  DN050-2,+- BRANCH IF FUNCTION IS TEST PMN49750
                          LD    2 1         LOAD ADDR OF USERS BUFFER.  PMN49760
                          STO     *+1                                   PMN49770
                          LDX  L1 *-*       POINT XR1 TO USERS BUFFER.  PMN49780
                          LD    1 1         LOAD USERS SECTOR ADDRESS.  PMN49790
                          SRT     16        SHIFT TO EXTENSION.         PMN49800
                          SLT     5         SET UP XR1                  PMN49810
                          STO     *+1       * WITH TWICE                PMN49820
                    DN050 LDX  L1 *-*       *   DRIVE CODE NUMBER.      PMN49830
                          SRA     1         CALC LOG DR NO          2-9 PMN49840
                          STO     DN080+1   SAVE LOG DR NO          2-9 PMN49850
                          MDX   1 -8        SKIP IF DRIVE CODE LEGAL.   PMN49860
                          MDX     DN200     BR TO PRE-OP ERROR EXIT.    PMN49870
                          MDX   1 8         RESET XR1 TO TWICE DR CODE. PMN49880
                    DN060 NOP               IN CASE OF SKIP.            PMN49890
                    DN070 LDS     0         TURN OFF OVERFLOW INDICATOR PMN49900
                          LD    2 0         LOAD CONTROL PARAMETER.     PMN49910
                          SRA     12        ISOLATE FUNCTION CODE.      PMN49920
                          BSC  L  DN250,Z   BRANCH IF NOT TEST FUNCTION PMN49930
                    *                                                   PMN49940
                    * PERFORM THE TEST FUNCTION.                        PMN49950
                    *                                                   PMN49960
                    DN080 LDX  L1 *-*       SET XR1 TO LOG DR NO    2-9 PMN49970
                          LD      $DBSY     SEE IF DRIVE                PMN49980
                          SRA   1           *N IS BUSY              2-9 PMN49990
                          BSC     E         SKIP IF DR N IS NOT BUSY2-9 PMN50000
                          MDX   2 -1        SET UP FOR RETURN TO CALL+3 PMN50010
                    DN090 MDX   2 3         SET UP FOR RETURN TO CALL+4 PMN50020
                    *                                                   PMN50030
                    * RESTORE REGISTERS AND INDICATORS                  PMN50040
                    * AND SET UP FOR RETURN TO CALLING PROGRAM.         PMN50050
                    *                                                   PMN50060
                          LDD     DN902     RESTORE CONTENTS OF ACC/EXT PMN50070
                    DN100 LDS     0         RESTORE CARRY AND OVERFLOW. PMN50080
                          STX   2 DN120     STORE RETURN ADDRESS.       PMN50090
                    DN110 LDX  L1 *-*       RESET XR1 TO ORIG CONTENTS. PMN50100
                          LDX  L2 *-*       RESET XR2 TO ORIG CONTENTS. PMN50110
                          BSC  L  *-*       RETURN TO USER.             PMN50120
                    DN120 EQU     *-1                                   PMN50130
                    *                                                   PMN50140
                    * CONSTANTS AND WORK AREAS.                         PMN50150
                    *                                                   PMN50160
                    DN900 DC      /5000     DISK NOT READY ERROR CODE.  PMN50170
                    DN901 DC      /5001     BAD CALL ERROR CODE.        PMN50180
                    *                                                   PMN50190
                    DN903 DC      5         CONSTANT                    PMN50200
                    *                                                   PMN50210
                    * PREPARE TO MAKE PRE-OPERATIVE ERROR EXIT.         PMN50220
                    *                                                   PMN50230
                    DN170 LD      DN900     LOAD DISK NOT RDY ERR CODE. PMN50240
                          MDX     DN200+1   BRANCH TO EXIT TO $PRET.    PMN50250
                    DN180 LD    1 DN982-D   IS IT A MONITOR CALL        PMN50260
                          S       DN902+2                               PMN50270
                          BSC  L  DN610,+-  BRANCH IF YES               PMN50280
                    DN190 BSC  L  DN380,O   BR IF IT IS A POST-OP ERR.  PMN50290
                    DN200 LD      DN901     FETCH PREOP ERROR CODE.     PMN50300
                          LDX  I2 DN230+1   LD XR2 WITH ADDR OF CALL+1. PMN50310
                          BSI  L  $PRET     BR TO PREOPERATIVE ERR TRAP PMN50320
                          MDX     DN040     BRANCH TO RE-ENTER DISKN.   PMN50330
                    *                                                   PMN50340
                    *   SET UP CONTROL PARAMETER FOR MONITOR CALL.      PMN50350
                    *                                                   PMN50360
                    DN210 SLA     8                                     PMN50370
                          BSC     Z         BRANCH IF READ OPERATION.   PMN50380
                          LD      DN070     SET UP FUNCTION             PMN50390
                          A       DN060     *INDICATOR.                 PMN50400
                          MDX     DN030     BR TO CONT PROCESSING CALL. PMN50410
                    *                                                   PMN50420
                    *    SET THE BIT FOR DRIVE N IN THE DISK BUSY       PMN50430
                    * INDICATOR AND INCREMENT THE SYSTEM I/O COUNTER.   PMN50440
                    *                                                   PMN50450
                    DN220 LDX  I2 DN080+1   SET XR2 TO LOG DR NO    2-9 PMN50460
                          LD      DN914     SET BIT FOR                 PMN50470
                          SLA   2           *DRIVE N IN             2-9 PMN50480
                          OR      DN915     *DISK BUSY              2-9 PMN50490
                          STO     DN225     *INDICATOR              2-9 PMN50500
                    DN225 MDX  L  $DBSY     *                       2-9 PMN50510
                          MDX  L  $IOCT,1   INCREMENT SYS I/O COUNTER.  PMN50520
                    DN230 LDX  L2 *-*       XR2 = ADDRESS OF CALL+1.    PMN50530
                          MDX     DN090     BR TO SET UP RET TO CALL+4. PMN50540
                    *                                                   PMN50550
                    DN240 BSC  L  DN440     BR TO INTERRUPT PROCESSING. PMN50560
                    DN914 DC      /0001     WORD USED TO SET $DBSY  2-9 PMN50570
                    DN915 DC      /7400     WORD USED TO SET INSTR  2-9 PMN50580
                    *                                                   PMN50590
                    *        PSEUDO CALL TO DISKN FOR MONITOR.          PMN50600
                    *                                                   PMN50610
                          BSS  E  0                                     PMN50620
                    DN902 DC      *-*       WD TO SAVE CONTENTS OF ACC. PMN50630
                          DC      *-*       WD TO SAVE CONTENTS OF EXT. PMN50640
                          DC      $PST2     ADDR POSTOPERATIVE ERR TRAP PMN50650
                          BSC  I  DN000     BRANCH TO RETURN TO MONITOR PMN50660
                    *                                                   PMN50670
                    * PROCESS ALL  FUNCTIONS EXCEPT TEST.               PMN50680
                    *                                                   PMN50690
                    DN250 LD      $DBSY     SEE IF DRIVE                PMN50700
                          LDX  I1 DN080+1   SET XR1 TO LOG DR NO    2-9 PMN50710
                          SRA   1           SEE IF DR N IS BUSY     2-9 PMN50720
                          BSC     E         SKIP IF DR N IS NOT BUSY2-9 PMN50730
                          MDX     DN250     BUSY, BRANCH AND TRY AGAIN. PMN50740
                          LDX  I1 DN050+1   RESTORE XR1             2-9 PMN50750
                    DN260 MDX  L1 D         POINT XR1 TO APPROPRIATE    PMN50760
                          LD    2 0         LOAD CONTROL PARAMETER.     PMN50770
                          SLA     12        ISOLATE FOURTH DIGIT.       PMN50780
                          BSC  L  DN270,+-  BR IF SECT ADDR IS ABSOLUTE PMN50790
                          SLT     11        SHIFT IN USERS SECTOR ADDR. PMN50800
                          A    I1 DN973-D   ADD IN FILE PROTECT ADDRESS PMN50810
                          SRT     11        SHIFT SECTOR ADDR INTO EXT. PMN50820
                    DN270 SLT     15        SHIFT SCT ADDR INTO ACC     PMN50830
                          SRA     4         *AND SHIFT OUT DR NO        PMN50840
                          STO   1 DN990-D   STORE INITIAL SECTOR ADDR.  PMN50850
                          STO   1 DN991-D   STORE WORKING SECTOR ADDR.  PMN50860
                          LD    2 1         LOAD AND SAVE ADDRESS       PMN50870
                          STO   1 DN994-D   *OF USERS I/O BUFFER.       PMN50880
                          LD    2 2         LOAD AND SAVE ADDRESS       PMN50890
                          STO   1 DN982-D   *OF USERS ERROR SUBROUTINE. PMN50900
                          LD    2 0         LOAD CONTROL PARAMETER.     PMN50910
                          RTE     12        ISOLATE FUNCTION CODE.      PMN50920
                          STO   1 DN984-D   SAVE FUNCTION CODE.         PMN50930
                          LD   I1 DN977-1-D LOAD AREA CODE FOR DRIVE N. PMN50940
                          BSC  L  DN200,+-  BR IF DRIVE NOT ON SYSTEM.  PMN50950
                          LDX   2 4         SET UP PHYS DR NO           PMN50960
                          SLCA  2                                       PMN50970
                          SRA     11                                    PMN50980
                          AND  L  DN954                                 PMN50990
                          STO     *+1                                   PMN51000
                          LDX  L2 *-*       SET XR2=PHYS DR NO          PMN51010
                          LD      DN050+1   SET UP WORD USED BY         PMN51020
                          A       DN260+1   *INTERRUPT PROSESSING TO    PMN51030
                          STO  L2 DN966     *POINT OUT CONST AREA       PMN51040
                          LD   I1 DN977-1-D                             PMN51050
                          OR      DN931     OR IN 2ND WD OF SENSE IOCC. PMN51060
                          STO   1 DN976+1-D ST IN 2ND WD OF SENSE IOCC. PMN51070
                          XIO   1 DN976-D   SENSE DRIVE N WITH RESET.   PMN51080
                          BSC  L  DN300,Z+  BR IF WR/SEL OR PWR/UNSAFE. PMN51090
                          SLA     2         TEST NOT READY BIT OF DSW.  PMN51100
                          BSC  L  DN170,Z+  BRANCH IF DRIVE N NOT READY PMN51110
                    DN280 LD    1 DN984-D   LOAD FUNCTION CODE.         PMN51120
                          S       DN903     SUBTRACT FIVE.              PMN51130
                          STO   1 DN970-D                               PMN51140
                          BSC  L  DN200,Z-  BR IF FUNCTION CODE ILLEGAL PMN51150
                          BSC  L  DN560,Z   BR IF FUNCTION IS NOT SEEK. PMN51160
                          SLT     8         ISOLATE THIRD DIGIT         PMN51170
                          SLA     12        *OF CONTROL PARAMETER.      PMN51180
                          BSC  L  DN580,+-  BR IF SEEK OPT UNUSED  2-11 PMN51190
                          BSC  L  DN570+1   SET UP SCTR ADDR FOR SK-OPT PMN51200
                    *                                                   PMN51210
                    * RESET THE BIT FOR DRIVE N IN THE DISK BUSY        PMN51220
                    * INDICATOR AND DECREMENT THE SYSTEM I/O COUNTER.   PMN51230
                    *                                                   PMN51240
                    DN290 DC      *-*                                   PMN51250
                          MDX  L1 -D        SET XR1 TO TWICE DR CODE NO PMN51260
                          NOP               IN CASE OF SKIP.            PMN51270
                          MDX  L  $IOCT,-1  DECREMENT SYS I/O COUNTER.  PMN51280
                    DN922 NOP               IN CASE OF SKIP             PMN51290
                          LD   L  DNXR1     LD XR1                  2-9 PMN51300
                          SRA     1         DIVIDE BY 2             2-9 PMN51310
                          OR      DN922     SET UP SLA INSTR        2-9 PMN51320
                          STO     DN295                             2-9 PMN51330
                          LD      DN914     RESET BIT                   PMN51340
                    DN295 SLA     0         * FOR DRIVE N           2-9 PMN51350
                          EOR  L  $DBSY     *   IN DISK BUSY            PMN51360
                          STO  L  $DBSY     *     INDICATOR.            PMN51370
                          BSC  I  DN290                                 PMN51380
                    *                                                   PMN51390
                    DN300 LD      DN911     LD WR/SEL-PWR UNSAFE ERR CD PMN51400
                          MDX     DN200+1   BRANCH TO SET UP ERROR EXIT PMN51410
                    *                                                   PMN51420
                    * CONSTANTS AND WORK AREAS.                         PMN51430
                    *                                                   PMN51440
                    *                                                   PMN51450
                    *                                                   PMN51460
                    * SET UP FOR AND THEN BRANCH TO ERROR               PMN51470
                    * SUBROUTINE OF THE CALLING PROGRAM.                PMN51480
                    *                                                   PMN51490
                    DN340 DC      *-*                                   PMN51500
                          SRT     16        SHIFT ERROR CODE TO EXT.    PMN51510
                          LD    1 DN982-D   TEST FOR MONITOR CALL       PMN51520
                          S       DN902+2                               PMN51530
                          BSC  L  DN345,Z   BR IF NOT MONITOR CALL      PMN51540
                          LD      DN934     LD ER DISP FOR MON CALL 2-9 PMN51550
                          SRT     16        SHIFT ERROR CODE TO EXT.    PMN51560
                    DN345 LD      DN930     RESET RETRY                 PMN51570
                          STO   1 DN985-D   *COUNTER TO 16.             PMN51580
                          LD    1 DN977-1-D LD AREA CD ADDR OF DRIVE N. PMN51590
                          S    L  DN977-1   SUBTRACT AREA CD BASE ADDR. PMN51600
                          SLA     12        PUT DRIVE CODE IN BITS 0-3. PMN51610
                          OR    1 DN991-D   OR IN SECTOR ADDRESS.       PMN51620
                          RTE     16                                    PMN51630
                          BSI  I1 DN982-D   BR TO USERS ERROR ROUTINE.  PMN51640
                          BSC  I  DN340     RETURN TO WHERE ERROR FOUND PMN51650
                    *                                                   PMN51660
                    DN350 SLA     2         BR IF NOT WRITE         2-8 PMN51670
                          BSC  L  DN356,-   *SELECT ERROR           2-8 PMN51680
                          LD      DN911     ERROR CODE TO ACC       2-8 PMN51690
                          BSI  L  $PST2     BR TO POST ERR TRAP     2-8 PMN51700
                          BSI     DN290     RESET $IOCT,$DBSY       2-8 PMN51710
                          MDX     DN382     BR TO CONTINUE TO EXIT  2-8 PMN51720
                    DN356 LD    1 DN984-D   LOAD FUNCTION CODE          PMN51730
                          SRA     2         SEE IF FUNC WRITE IMMEDIATE PMN51740
                          BSC  L  DN460,Z   BR IF FUNC WRITE IMMEDIATE. PMN51750
                          LD    1 DN995-D   SEE IF ERROR IN RDBCK CHECK PMN51760
                          BSC  L  DN400,E   BRANCH IF READBACK CHECK.   PMN51770
                          LD    1 DN985-D   LOAD AND                    PMN51780
                          S       DN933     * DECREMENT                 PMN51790
                          STO   1 DN985-D   *   RETRY COUNTER.          PMN51800
                          BSC  L  DN370,Z   BRANCH TO TRY AGAIN.        PMN51810
                    DN360 LD    1 DN984-D   LOAD FUNCTION CODE.         PMN51820
                          SRA     1         SET UP                      PMN51830
                          A       DN933     *ERROR CODE.                PMN51840
                          BSI     DN340     BRANCH TO SET UP ERROR EXIT PMN51850
                          BSC  L  DN460,+-  BRANCH TI IGNORE ERROR.     PMN51860
                    DN370 XIO   1 DN986-D   RETRY READ OR WRITE.        PMN51870
                          MDX     DN450     BR TO RETRN TO INTRPT LEVEL PMN51880
                    *                                                   PMN51890
                    * SET UP FOR POST-OPERATIVE DISK OVFLO ERROR EXIT.  PMN51900
                    *                                                   PMN51910
                    DN380 LD   L  DN963     LOAD ERROR CODE             PMN51920
                          BSI     DN340     BRANCH TO SET UP ERROR EXIT PMN51930
                          BSI     DN290     BR TO RESET BUSY INDRS      PMN51940
                    DN382 BOSC L  *         TURN OFF INTERRUPT LEVEL.   PMN51950
                          MDX  L  $DBSY,0   LOOP UNTIL ALL DISK         PMN51960
                          MDX     *-3       *OPERATIONS COMPLETE.       PMN51970
                          EXIT              EXECUTE A CALL EXIT         PMN51980
                    *                                                   PMN51990
                    * CONSTANTS AND WORK AREAS.                         PMN52000
                    *                                                   PMN52010
                    DN920 DC      /0680     READBACK CHECK IOCC WORD.   PMN52020
                    DN940 DC      2*@TCNT   TWICE NO RETRIES        212 PMN52030
                    DN931 DC      /0701     2ND WORD OF SENSE W/RESET   PMN52040
                    *                                                   PMN52050
                    DN390 LD    1 DN984-D   LOAD FUNCTION CODE.         PMN52060
                          S       DN932     SUBTRACT THREE.             PMN52070
                          BSC  L  DN430,Z   BR IF NOT WR W/RDBCK CHECK. PMN52080
                          LD    1 DN995-D   READBACK CHECK INDR     212 PMN52090
                          SRT     16        SAVE TEMPORARILY        212 PMN52092
                          LD      DN940     LOAD 2*TCNT             212 PMN52094
                          STO   1 DN995-D   SAVE IN RDBCK CK INDR   212 PMN52096
                          SLT     16        PREVIOUS VALUE          212 PMN52098
                          BSC  L  DN430,E   BRANCH IF CHECK DONE    212 PMN52100
                    DN400 S       DN933     DECREMENT READBACK          PMN52110
                          BSC  L  DN360,+-  BR IF 16 RETRIES DONE   212 PMN52120
                          STO   1 DN995-D   SET RETRY COUNTER       212 PMN52130
                          BSC  L  DN410,E   BRANCH TO READBACK CHECK.   PMN52140
                          LD    1 DN986-D   RESTORE                 2-6 PMN52150
                          STO  L  DNXR2     *FIRST TWO WORDS        2-9 PMN52160
                          LD    1 DN980-D   * IF                    2-6 PMN52170
                          STO   2 0         * ERROR                 2-6 PMN52180
                          LD    1 DN980+1-D * IN                    2-6 PMN52190
                          STO   2 1         * READ BACK CHECK       2-6 PMN52200
                          LD      DN941     LD WD TO SET UP WRITE IOCC. PMN52210
                          MDX     *+1       SKIP OVER NEXT INSTRUCTION. PMN52220
                    DN410 LD      DN920     LD WD TO SET UP RDBK/CHK.   PMN52230
                          STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  PMN52240
                          LD    1 DN990-D   LOAD ORIGINAL SECTOR ADDR.  PMN52250
                          STO   1 DN991-D   STORE AS WORKING SECT ADDR. PMN52260
                          LDS     1         SET OVERFLOW INDICATOR.     PMN52270
                          MDX     DN280     BR TO SET UP FOR RDBACK/CHK PMN52280
                    *                                                   PMN52290
                    * CONSTANTS AND WORK AREAS.                         PMN52300
                    *                                                   PMN52310
                    DN930 DC      @TCNT     NUMBER OF RETRIES TO MAKE.  PMN52320
                    DN911 DC      /5002     WR/SEL-PWR UNSAFE ERROR CODEPMN52330
                          BSS  E  0                                     PMN52340
                    DN912 DC      /0101     MASK FOR BUILDING READ IOCC PMN52350
                          DC      /0300     2ND WD OF SENSE INTRPT IOCC PMN52360
                    DN933 DC      1         CONSTANT OF DECIMAL ONE.    PMN52370
                    DN932 DC      3         WRITE W/RDBCK FUNCTION CODE PMN52380
                    DN934 DC      /5003     MON CALL DISK ERROR CODE    PMN52390
                    *                                                   PMN52400
                    *                                                   PMN52440
                    * SET UP FOR RETURN TO INTERRUPT LEVEL.             PMN52450
                    *                                                   PMN52460
                    DN430 BSI     DN290     BRANCH TO RESET $DBSY       PMN52490
                          MDX     DN450     BR TO RETRN TO INTRPT LEVEL PMN52500
                    *                                                   PMN52510
                    DN440 LDX   2 4                                     PMN52520
                          XIO     DN912     SENSE INTERRUPT.            PMN52530
                          SLCA  2           SET UP XR2                  PMN52540
                          SRA   2           * WITH THE                  PMN52550
                          LDX   2 4         *   PHYSICAL                PMN52560
                          SLCA  2           *     DRIVE NO.             PMN52570
                          LD   L2 DN966                                 PMN52580
                          STO  L  DNXR1     SET XR1 TO LOG DR+D     2-9 PMN52590
                          LDD     DN952     SAVE CONTENTS OF            PMN52600
                          STD     DN942     *WORDS IN CALL PORTION.     PMN52610
                          XIO   1 DN976-D   SENSE WITH RESET.           PMN52620
                          STO  L  $DDSW     SAVE IN COMM. AREA      212 PMN52625
                          OR    1 DN983-D   OR IN SEEK FLAG TO DSW.     PMN52630
                          BSC  L  DN460,-   BR IF NOT SEEK OR NO ERROR. PMN52640
                          EOR   1 DN983-D   EXCLUSIVE OR OUT SEEK FLAG. PMN52650
                          BSC  L  DN350,Z+  BR IF THERE WAS AN ERROR.   PMN52660
                          LD    1 DN970-D   LOAD RD-AFTER-SEEK CHK FLAG PMN52670
                          BSC  L  DN490-1,Z- BRANCH IF NO CHECK NEEDED. PMN52680
                          LD    1 DN978+1-D SEE IF SEEK HAS BEEN CHKD.  PMN52690
                          BSC  L  DN490,-   BRANCH IF RD HAS BEEN DONE. PMN52700
                          STX   1 DN952     SET UP BFR ADDR FOR READ.   PMN52710
                          LD      DN912     SET UP 2ND                  PMN52720
                          EOR   1 DN976+1-D * WORD OF                   PMN52730
                          STO     DN952+1   *   READ IOCC.              PMN52740
                          XIO     DN952     INITIATE READ-AFTER-SEEK.   PMN52750
                    DN450 LDD     DN942     RESTORE TWO WORDS           PMN52760
                          STD     DN952     *IN CALL PORTION.           PMN52770
                          BSC  I  DN020     RETURN TO INTERRUPT LEVEL.  PMN52780
                    *                                                   PMN52790
                    DN460 LDD   1 DN986-D   LOAD IOCC OF LAST OPERATION PMN52800
                          RTE     3         ADD ONE TO SECTOR NUMBER,   PMN52810
                          A       DN921     *AND 320 TO I/O ADDRESS.    PMN52820
                          RTE     29                                    PMN52830
                          STD   1 DN986-D   STO IOCC FOR NEXT OPERATION PMN52840
                          STO  L  DNXR2     SET XR2 TO ADDR OF I/O B2-9 PMN52850
                          LD    2 0         LOAD AND SAVE FIRST         PMN52860
                          STO     DN952     *WORD OF I/O BUFFER.        PMN52870
                          LD    2 1         LOAD AND SAVE SECOND        PMN52880
                          STO     DN952+1   *WORD OF I/O BUFFER.        PMN52890
                          LD    1 DN993-D   LOAD WD CNT FOR NEXT OPER.  PMN52900
                          BSC     +         SKIP IF POSITIVE.           PMN52910
                          MDX     DN470      ALL DONE - BRANCH TO EXIT. PMN52920
                          STO   2 0         STORE WORD COUNT IN BUFFER. PMN52930
                          BSC     C         SKIP IF NO SEEK NEEDED.     PMN52940
                          STO   1 DN983-D   MAKE SEEK FLAG POSITIVE.    PMN52950
                          LD    1 DN991-D   LOAD AND                    PMN52960
                          A       DN933     * INCREMENT WORKING         PMN52970
                          STO   1 DN991-D   *   SECTOR ADDRESS.         PMN52980
                          STO   2 1         STORE SECT ADDR IN I/O BUFR PMN52990
                          LD    1 DN983-D   LOAD SEEK FLAG.             PMN53000
                          BSC     +-        SKIP IF SEEK NECESSARY.     PMN53010
                          XIO   1 DN986-D   INITIATE NEXT OPERATION.    PMN53020
                    DN470 LD    1 DN980-D   RESTORE FIRST WORD OF       PMN53030
                          STO  L2 -320      *LAST I/O BUFFER.           PMN53040
                          LD    1 DN980+1-D RESTORE SECOND WORD OF      PMN53050
                          STO  L2 -319      *LAST I/O BUFFER.           PMN53060
                          LDS     0         RESET OVERFLOW INDICATOR.   PMN53070
                          LDD     DN952     LOAD AND SAVE FIRST TWO     PMN53080
                          STD   1 DN980-D   *WORDS OF NEW I/O BUFFER.   PMN53090
                    DN480 LD      DN930     RESTORE READ/WRITE          PMN53100
                          STO   1 DN985-D   *RETRY COUNTER TO 16.       PMN53110
                          LD    1 DN986-D   SET XR2 TO THE              PMN53120
                          STO     DN952     * ADDRESS OF THE            PMN53130
                          LDX  I2 DN952     *   DISK BUFFER.            PMN53140
                          LDD   1 DN993-D   LOAD WD CNT FOR THIS OPER.  PMN53150
                          BSC  L  DN390,+   BR IF ENTIRE OPERATION DONE PMN53160
                          STO   2 0         ST WORD CNT IN THE BFR AREA PMN53170
                          LD    1 DN991-D   SET UP SECTOR ADDRESS       PMN53180
                          STO   2 1         *FOR THIS OPERATION.        PMN53190
                          LD    1 DN983-D   LOAD SEEK FLAG.             PMN53200
                          BSC  L  DN570,Z-  BRANCH IF SEEK NECESSARY.   PMN53210
                          XIO   1 DN976-D   SENSE WITH RESET.           PMN53220
                          SLA     3         SEE IF DISK N IS BUSY.      PMN53230
                          BSC     -         SKIP IF DISK N IS BUSY.     PMN53240
                          XIO   1 DN986-D   INITIATE NEXT OPERATION.    PMN53250
                          MDX     DN520     BR TO SET UP FOR NEXT OPER. PMN53260
                    DN941 DC      /0500     WRITE IOCC WORD         212 PMN53270
                    *                                                   PMN53320
                          LD    1 DN991-D                               PMN53330
                    DN490 STO  I1 DN972-D   STORE CURRENT ARM POSITION. PMN53340
                          LD      *                                     PMN53350
                          STO   1 DN978+1-D                             PMN53360
                          LD    1 DN985-D   LOAD AND                    PMN53370
                          S       DN933     * DECREMENT                 PMN53380
                          STO   1 DN985-D   *   RETRY COUNTER.          PMN53390
                          BSC  L  DN550,Z   BRANCH TO TRY AGAIN.        PMN53400
                          LD      DN932     LOAD ERROR CODE.            PMN53410
                          BSI  L  DN340                                 PMN53420
                          BSC  L  DN550,Z   BRANCH TO TRY AGAIN.        PMN53430
                          STO   1 DN983-D   CLEAR SEEK FLAG.            PMN53440
                    DN500 SLT     16        CLEAR EXTENSION.            PMN53450
                          LD    1 DN986+1-D LOAD 2ND WORD OF IOCC.      PMN53460
                          SRA     12        BRANCH IF IOCC AND BUFFER   PMN53470
                          BSC  L  DN530,Z   *AREA ALREADY SET UP.       PMN53480
                    DN510 LD    1 DN991-D   LOAD WORKING SECTOR ADDRESS PMN53490
                          AND     DN954     AND OUT ALL BUT SECTOR NO.  PMN53500
                          OR    1 DN986+1-D OR IN 2ND WORD OF IOCC.     PMN53510
                    *                                               2-8 PMN53520
                    *ADDR 284/285 MUST BE WITHIN DN510 AND DN520-1      PMN53530
                    *                                               2-8 PMN53540
                          OR   I1 DN977-1-D OR IN AREA CODE.            PMN53550
                          STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  PMN53560
                          SLT     16        CLEAR EXTENSION.            PMN53570
                    DN520 LD    1 DN992-D   LOAD AND SAVE               PMN53580
                          STO   1 DN993-D   *REMAINING WORD COUNT.      PMN53590
                          BSC     +         SKIP IF POSITIVE.           PMN53600
                          MDX     DN530     BR IF OPERATION COMPLETE.   PMN53610
                          S       DN951     SUBTRACT DECIMAL 320.       PMN53620
                          STO   1 DN992-D   STORE REMAINING WORD COUNT. PMN53630
                    DN525 BSC     Z-        SKIP IF NOT POSITIVE.       PMN53640
                          SRA     16        CLEAR ACCUMULATOR.          PMN53650
                          A       DN953     ADD DECIMAL 321.            PMN53660
                          STO   1 DN993-D   STORE WORD CNT FOR NEXT OP. PMN53670
                    DN530 SLT     16        SHIFT EXTENSION INTO ACC.   PMN53680
                          OR    1 DN983-D   OR IN SEEK FLAG.            PMN53690
                          BSC  L  DN640,O   BRANCH IF IN CALL PORTION.  PMN53700
                          BSC  L  DN450,Z   BRANCH IF SEEK IN PROGRESS. PMN53710
                          MDX     DN480     BRANCH TO SET UP READ/WRITE PMN53720
                    *                                                   PMN53730
                    * CONSTANTS AND WORK AREAS.                         PMN53740
                    *                                                   PMN53750
                    DN921 DC      /2028     CONSTANT                212 PMN53752
                    DN952 BSS  E  2         WORK AREA                   PMN53760
                    DN942 BSS  E  2         WORK AREA                   PMN53770
                    DN953 DC      321       1 PLUS NO. WDS PER SECTOR   PMN53780
                    DN951 DC      320       NO OF WORDS PER SECTOR      PMN53790
                    *                                                   PMN53800
                    DN550 LDS     1         SET OVERFLOW INDICATOR.     PMN53810
                          MDX     DN610     BRANCH TO SET UP SEEK.      PMN53820
                    *                                                   PMN53830
                    DN560 LD    1 DN994-D   LOAD ADDR OF USERS I/O AREA PMN53840
                          STO   1 DN986-D   STORE IN 1ST WORD OF IOCC.  PMN53850
                          STO     DN952                                 PMN53860
                          LDX  I2 DN952                                 PMN53870
                          LD    2 0         LOAD WORD COUNT.            PMN53880
                          BSC  L  DN200,+   BR TO PRE-OP ERR IF NOT +.  PMN53890
                          STO   1 DN980-D   SAVE 1ST WORD OF I/O BUFFER PMN53900
                          STO   1 DN992-D   SAVE WORD COUNT.            PMN53910
                          LD    2 1         LOAD AND SAVE SECOND        PMN53920
                          STO   1 DN980+1-D *WORD OF I/O BUFFER.        PMN53930
                          LD    1 DN984-D   LOAD FUNCTION CODE.         PMN53940
                          SRA     2         SEE IF WRITE IMMEDIATE.     PMN53950
                          BSC  L  DN580,+   BR IF NOT WR IMMEDIATE 2-11 PMN53960
                          LD    1 DN991-D   LOAD USERS SECTOR ADDRESS.  PMN53970
                          AND     DN954     AND OUT ALL BUT SECTOR NO.  PMN53980
                          OR   I1 DN972-D   OR IN CURRENT ARM POSITION. PMN53990
                          STO   1 DN991-D   STORE AS WORKING SCTR ADDR. PMN54000
                          MDX  L  DN230+1,-1 SET FOR RETURN TO CALL+3.  PMN54010
                          LD      DN941     2ND WD WRITE IOCC           PMN54020
                          MDX     DN630     BRANCH TO SET UP FOR WRITE. PMN54030
                    *                                                   PMN54040
                    DN954 DC      /0007     MASK TO OBTAIN SCTR NO.     PMN54050
                    *                                                   PMN54060
                    DN570 LDS     1         SET OVERFLOW INDICATOR.     PMN54070
                          LD   I1 DN972-D   LOAD CURRENT ARM POSITION.  PMN54080
                          A       DN960     ADD TO IT ONE CYLINDER.     PMN54090
                          STO   1 DN991-D   STORE AS WORKING SECT ADDR. PMN54100
                          LD    1 DN984-D   LOAD FUNCTION CODE.         PMN54110
                          SRA     2                                     PMN54120
                          STO   1 DN970-D                               PMN54130
                    DN580 XIO   1 DN976-D   TEST FOR CART HOME     2-11 PMN54140
                          SLA     4         *                      2-11 PMN54150
                          BSC  L  DN582,-   BR IF NOT              2-11 PMN54160
                          SLA     16        UPDATE $CYLN           2-11 PMN54170
                          STO  I1 DN972-D   *IF YES                2-11 PMN54180
                    DN582 LDD   1 DN970-D                               PMN54190
                          A       DN960                                 PMN54200
                          AND     DN960                                 PMN54210
                          STD     DN952                                 PMN54220
                          LDX  I2 DN952+1   XR2=ADDR OF DEF CYLN        PMN54230
                          LD      DN961                                 PMN54240
                          SRT     16                                    PMN54250
                          STO     DN961                                 PMN54260
                          LD    1 DN991-D   LD WORKING SCTR ADDR        PMN54270
                          STX   1 DN952+1   SAVE CONTENTS OF XR1.       PMN54280
                          LDX   1 3                                     PMN54290
                    *                                                   PMN54300
                    * CHECK FOR DEFECTIVE CYLINDERS.                    PMN54310
                    *                                                   PMN54320
                    DN590 S     2 0         SUB A DEFECTIVE CYL LIMIT.  PMN54330
                          BSC  L  DN600,Z+  BR IF NOT DEF CYLN          PMN54340
                          MDX  L  DN961,8   COUNTER FOR UNUSED SCTRS    PMN54350
                          BSC     Z                                     PMN54360
                          S       DN952                                 PMN54370
                          A       DN960     INCREMENT SCTR ADDR BY 8    PMN54380
                    DN600 A     2 0         ADD THE DEFECTIVE CYL LIMIT PMN54390
                          MDX   2 1                                     PMN54400
                          MDX   1 -1                                    PMN54410
                          MDX     DN590     CHECK NEXT DEFECTIVE ADDR.  PMN54420
                          LDX  I1 DN952+1   RESTORE CONTENTS OF XR1.    PMN54430
                          STO   1 DN991-D   LOAD WORKING SECTOR ADDRESS PMN54440
                          S       DN961     CHECK FOR ADDR ABOVE        PMN54450
                          S       DN965     *1600                       PMN54460
                          BSC  L  DN190,-   BR IF OVERFLOW              PMN54470
                          SLT     16                                    PMN54480
                          STO     DN961                                 PMN54490
                          LD   I1 DN973-D   LOAD FILE PROT ADDR         PMN54500
                          SLA     4         SHIFT OUT DR NO             PMN54510
                          SRA     4                                     PMN54520
                          S     1 DN991-D                               PMN54530
                          BSC  L  DN610,+   BR IF ABOVE FILE PROT ADDR  PMN54540
                          LD    1 DN984-D   LOAD FUNCTION CODE.         PMN54550
                          SRA     1         SEE IF FUNCTION IS WRITE.   PMN54560
                          BSC  L  DN180,E   BRANCH IF FUNCTION IS WRITE PMN54570
                    *                                                   PMN54580
                    * CHECK TO SEE IF A SEEK IS NECESSARY.              PMN54590
                    *                                                   PMN54600
                    DN610 LD    1 DN991-D   LOAD WORKING SECTOR ADDRESS PMN54610
                          S    I1 DN972-D   SUB CURRENT ARM POSITION.   PMN54620
                          SRT     3         SHIFT IN NO OF CYLS TO SEEK PMN54630
                          BSC  L  DN620,+-  BR IF SEEK NOT NECESSARY.   PMN54640
                    *                                                   PMN54650
                    * SEEK                                              PMN54660
                    *                                                   PMN54670
                          SRT     16        PUT NO. CYLINDERS IN EXT.   PMN54700
                          AND     DN963     AND WITH BIT 13.            PMN54710
                          OR      DN964     OR IN SEEK IOCC WORD.       PMN54720
                          OR   I1 DN977-1-D OR IN AREA CODE.            PMN54730
                          RTE     16                                    PMN54740
                          BSC     -         SKIP IF SEEK TOWARD HOME.   PMN54750
                          MDX     *+2       SKIP NEXT TWO INSTRUCTIONS. PMN54760
                          EOR     DN962     COMPLEMENT NO. CYLINDERS TO PMN54770
                          S       DN962     *BE SOUGHT TO GET POS. NO.  PMN54780
                          STD     DN952     STORE IOCC WORDS.           PMN54790
                          XIO     DN952     INITIATE THE SEEK.          PMN54800
                          LD      DN962     LOAD NEGATIVE NUMBER.       PMN54810
                    DN620 STO   1 DN983-D   STORE IN SEEK FLAG.         PMN54820
                          BSC  L  DN500,O   BR IF IN INTRPT PROCESSING. PMN54830
                          LD    1 DN984-D   LOAD FUNCTION CODE.         PMN54840
                          SRA     1                                     PMN54850
                          A       DN978                                 PMN54860
                          EOR     DN954                                 PMN54870
                          SLA     8                                     PMN54880
                    DN630 STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  PMN54890
                          LDS     1         SET OVERFLOW INDICATOR.     PMN54900
                          LD    1 DN992-D   LOAD REMAINING WORD COUNT.  PMN54910
                          BSC  L  DN510,Z-  BR IF OPERATION NOT SEEK.   PMN54920
                          LD    1 DN983-D   LOAD SEEK FLAG.             PMN54930
                          BSC  L  DN230,+-  BR IF SEEK NOT NECESSARY.   PMN54940
                    DN640 BSC  L  DN220,Z   BRANCH IF SEEK NECESSARY.   PMN54950
                          LDS     1         SET OVERFLOW INDICATOR.     PMN54960
                          BSC  L  DN480                                 PMN54970
                    *                                                   PMN54980
                    * CONSTANTS AND WORK AREAS.                         PMN54990
                    *                                                   PMN55000
                    *                                                   PMN55010
                    DN960 DC      8         NO. SECTORS PER CYLINDER .  PMN55020
                    DN961 DC      *-*       TEMPORARY STORAGE           PMN55030
                    DN962 DC      -1        CONSTANT OF MINUS ONE.      PMN55040
                    DN963 DC      4         SEEK HOME BIT.              PMN55050
                    DN964 DC      /0400     SEEK IOCC WORD.             PMN55060
                    DN965 DC      1600      1+MAX SCTR ADDR             PMN55070
                    DN966 BSS     5                                     PMN55080
                          BSS  E  0                                     PMN55090
                    DN970 DC      *-*       FUNCTION CODE FOR DRIVE 0   PMN55100
                    DN971 DC      $DCYL     ADDR OF DEF CYLN FOR DR 0   PMN55110
                          DC      *-*       FUNCTION CODE FOR DRIVE 1   PMN55120
                          DC      $DCYL+3   ADDR OF DEF CYLN FOR DR 1   PMN55130
                          DC      *-*       FUNCTION CODE FOR DRIVE 2   PMN55140
                          DC      $DCYL+6   ADDR OF DEF CYLN FOR DR 2   PMN55150
                          DC      *-*       FUNCTION CODE FOR DRIVE 3   PMN55160
                          DC      $DCYL+9   ADDR OF DEF CYLN FOR DR 3   PMN55170
                          DC      *-*       FUNCTION CODE FOR DRIVE 4   PMN55180
                          DC      $DCYL+12  ADDR OF DEF CYLN FOR DR 4   PMN55190
                    DN972 DC      $CYLN     ADDR OF ARM POS OF DRIVE 0  PMN55200
                    DN973 DC      $FPAD     FILE PROTECTED ADDR OF DR 0 PMN55210
                          DC      $CYLN+1   ADDR OF ARM POS OF DRIVE 1  PMN55220
                          DC      $FPAD+1   FILE PROTECTED ADDR OF DR 1 PMN55230
                          DC      $CYLN+2   ADDR OF ARM POS OF DRIVE 2  PMN55240
                          DC      $FPAD+2   FILE PROTECTED ADDR OF DR 2 PMN55250
                          DC      $CYLN+3   ADDR OF ARM POS OF DRIVE 3  PMN55260
                          DC      $FPAD+3   FILE PROTECTED ADDR OF DR 3 PMN55270
                          DC      $CYLN+4   ADDR OF ARM POS OF DRIVE 4  PMN55280
                          DC      $FPAD+4   FILE PROTECTER ADDR OF DR 4 PMN55290
                    DN976 DC      $ACDE     ADDR OF AREA CODE OF DR 0   PMN55300
                    DN977 DC      *-*                                   PMN55310
                          DC      $ACDE+1   ADDR OF AREA CODE OF DR 1   PMN55320
                          DC      *-*                                   PMN55330
                          DC      $ACDE+2   ADDR OF AREA CODE OF DR 2   PMN55340
                          DC      *-*                                   PMN55350
                          DC      $ACDE+3   ADDR OF AREA CODE OF DR 3   PMN55360
                          DC      *-*                                   PMN55370
                          DC      $ACDE+4   ADDR OF AREA CODE OF DR 4   PMN55380
                          DC      *-*                                   PMN55390
                    DN978 DC      1                                     PMN55400
                          DC      -1   CURRENT ARM POSITION - DRIVE 0   PMN55410
                          DC      1                                     PMN55420
                          DC      -1   CURRENT ARM POSITION - DRIVE 1   PMN55430
                          DC      1                                     PMN55440
                          DC      -1   CURRENT ARM POSITION - DRIVE 2   PMN55450
                          DC      1                                     PMN55460
                          DC      -1   CURRENT ARM POSITION - DRIVE 3   PMN55470
                          DC      1                                     PMN55480
                          DC      -1   CURRENT ARM POSITION - DRIVE 4   PMN55490
                    DN980 BSS     10   FIRST TWO WORDS OF I/O BUFFER.   PMN55500
                    DN982 DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 0 PMN55510
                    DN983 DC      *-*  SEEK FLAG - DRIVE 0.             PMN55520
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 1 PMN55530
                          DC      *-*  SEEK FLAG - DRIVE 1.             PMN55540
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 2 PMN55550
                          DC      *-*  SEEK FLAG - DRIVE 2.             PMN55560
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 3 PMN55570
                          DC      *-*  SEEK FLAG - DRIVE 3.             PMN55580
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 4 PMN55590
                          DC      *-*  SEEK FLAG - DRIVE 4.             PMN55600
                    DN984 DC      *-*  FUNCTION CODE - DRIVE 0.         PMN55610
                    DN985 DC      50   READ/WRITE RETRY CTR - DRIVE 0.  PMN55620
                          DC      *-*  FUNCTION CODE - DRIVE 1.         PMN55630
                          DC      50   READ/WRITE RETRY CTR - DRIVE 1.  PMN55640
                          DC      *-*  FUNCTION CODE - DRIVE 2.         PMN55650
                          DC      50   READ/WRITE RETRY CTR - DRIVE 2.  PMN55660
                          DC      *-*  FUNCTION CODE - DRIVE 3.         PMN55670
                          DC      50   READ/WRITE RETRY CTR - DRIVE 3.  PMN55680
                          DC      *-*  FUNCTION CODE - DRIVE 4.         PMN55690
                          DC      50   READ/WRITE RETRY CTR - DRIVE 4.  PMN55700
                    DN986 BSS     10   IOCC FOR NEXT OPERATION.         PMN55710
                    DN990 DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 0.  PMN55720
                    DN991 DC      *-*  WORKING SECTOR ADDRESS - DRIVE 0 PMN55730
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 1.  PMN55740
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 1 PMN55750
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 2.  PMN55760
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 2 PMN55770
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 3.  PMN55780
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 3 PMN55790
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 4.  PMN55800
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 4 PMN55810
                    DN992 DC      *-*  INTERMEDIATE WORD CNT - DRIVE 0. PMN55820
                    DN993 DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 0 PMN55830
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 1. PMN55840
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 1 PMN55850
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 2. PMN55860
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 2 PMN55870
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 3. PMN55880
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 3 PMN55890
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 4. PMN55900
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 4 PMN55910
                    DN994 DC      *-*  ADDR OF USERS I/O AREA - DRIVE 0 PMN55920
                    DN995 DC      100  READBACK CHECK COUNTER - DRIVE 0 PMN55930
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 1 PMN55940
                          DC      100  READBACK CHECK COUNTER - DRIVE 1 PMN55950
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 2 PMN55960
                          DC      100  READBACK CHECK COUNTER - DRIVE 2 PMN55970
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 3 PMN55980
                          DC      100  READBACK CHECK COUNTER - DRIVE 3 PMN55990
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 4 PMN56000
                          DC      100  READBACK CHECK COUNTER - DRIVE 4 PMN56010
                    *                                                   PMN56020
                    $NEND EQU     /3A2      1+END OF DISKN          212 PMN56030
                          BSS     $NEND-*-6  PATCH AREA             212 PMN56040
                    *                                                   PMN56050
                          DC      @CIL1     CORE IMAGE LDR-PH 1, PH ID  PMN56060
                          DC      *-*       CORE ADDRESS                PMN56070
                          DC      *-*       WORD COUNT                  PMN56080
                          DC      *-*       SECTOR ADDRESS              PMN56090
                          DC      *-*       WORD COUNT OF CORE LOAD     PMN56100
                          DC      *-*       SCTR ADDR OF CORE LOAD      PMN56110
                    D     EQU     DN978                                 PMN56120
                    DNXR1 EQU     /0001     POINT TO XR1            2-9 PMN56130
                    DNXR2 EQU     /0002     POINT TO XR2            2-9 PMN56140
                          HDNG    CORE IMAGE LOADER, PHASE 1            PMN56160
                    *************************************************** PMN56170
                    *STATUS - VERSION 2, MODIFICATION LEVEL 11        * PMN56180
                    *FUNCTION/OPERATION-THIS PHASE PROVIDES THE LINK- * PMN56190
                    *     AGE BETWEEN THE SKELETON SUPERVISOR AND THE * PMN56200
                    *     SUPERVISOR, THE CORE LOAD BUILDER, PHASE 2  * PMN56210
                    *     OF THE CORE IMAGE LOADER, THE DUMP PROGRAM, * PMN56220
                    *     OR THE AUXILIARY  SUPERVISOR. IN PROVIDING  * PMN56230
                    *     THIS LINKAGE THE FOLLOWING FUNCTIONS ARE    * PMN56240
                    *     PERFORMED.                                  * PMN56250
                    *        *  COMMON IS SAVED AS NECESSARY FOR LINKS* PMN56260
                    *        *  THE CORE IMAGE HEADER IS PROCESSED.   * PMN56270
                    *        *  THE PROPER VERSION OF DISK I/O IS     * PMN56280
                    *           FETCHED.                              * PMN56290
                    *        *  THE DISK ADDRESS OF THE NEXT LINK IS  * PMN56300
                    *           FETCHED FROM LET/FLET.                * PMN56310
                    *        * THE AUXILIARY  SUPERVISOR IS FETCHED   * PMN56320
                    *           AND CONTROL PASSED TO IT.             * PMN56330
                    *        * MONITOR CTRL RECD ANALYZER IS FETCHED  * PMN56340
                    *           CONTROL PASSED TO IT.                 * PMN56350
                    *        *  THE DUMP-TO-PRINTER PROGRAM IS FETCHED* PMN56360
                    *           AND CONTROL PASSED TO IT.             * PMN56370
                    *        *  THE CORE LOAD BUILDER OR PHASE 2 OF   * PMN56380
                    *           THE CORE IMAGE LOADER IS FETCHED AS   * PMN56390
                    *           NECESSARY.                            * PMN56400
                    *                                                 * PMN56410
                    *ENTRY POINTS-                                    * PMN56420
                    *     CM000 IS THE ONLY ENTRY POINT TO THIS PHASE * PMN56430
                    *     THE CALLING SEQUENCE IS                     * PMN56440
                    *     BSI  L  CM000                               * PMN56450
                    *INPUT- NONE                                      * PMN56460
                    *OUTPUT-                                          * PMN56470
                    *     * THE REQUIRED VERSION OF DISK I/O IN THE   * PMN56480
                    *       RESIDENT MONITOR                          * PMN56490
                    *     * THE 320 WDS FOLLOWING THE END OF DISK I/O,* PMN56500
                    *       ADJUSTED TO A COMMON SCTR (I.E.,896-1216  * PMN56510
                    *       FOR DKZ,1216-1536 FOR DK1/DKN) ON THE CIB * PMN56520
                    *       IF THE ENTRY IS CALL LINK                 * PMN56530
                    *EXTERNAL REFERENCES- (ALL IN COMMA)              * PMN56540
                    *     * $COMN                                     * PMN56550
                    *     * $CORE                                     * PMN56560
                    *     * $CIBA                                       PMN56570
                    *     * $DBSY                                       PMN56580
                    *     * $CILA                                       PMN56590
                    *     * $DREQ                                       PMN56600
                    *     * $DUMP                                       PMN56610
                    *     * $CLSW                                       PMN56620
                    *     * DZ000                                       PMN56630
                    *     * $ULET                                       PMN56640
                    *     * $PHSE                                       PMN56650
                    *     * $STOP                                 2-10* PMN56655
                    *     * $LEV2                                       PMN56660
                    *     * $LEV3                                 2-10* PMN56665
                    *     $ $LEV4                                       PMN56670
                    *     $ $IREQ                                       PMN56680
                    *     $ $DZ1N                                       PMN56690
                    *     * $HASH                                       PMN56700
                    *     * $RMSW                                       PMN56710
                    *     * $CCAD                                       PMN56720
                    *     * $CWCT                                       PMN56730
                    *     * $S910                                       PMN56740
                    *     * $DADR                                       PMN56750
                    *     * $LKNM                                       PMN56760
                    *     * $DCDE                                       PMN56770
                    *     * $NEND                                       PMN56780
                    *EXITS- NORMAL                                    * PMN56790
                    *     * TO SUPERVISOR IF ENTERED FROM EXIT        * PMN56800
                    *     * TO CORE LOAD BUILDER OR CORE IMAGE LOADER,* PMN56810
                    *       ON CALL LINK                              * PMN56820
                    *     * TO AUXILIARY  SUPERVISOR IF ENTERED FROM  * PMN56830
                    *       $DUMP WITH A NEGATIVE FORMAT CODE.        * PMN56840
                    *     * TO THE DUMP-TO-PRINTER PROGRAM IF ENTERED * PMN56850
                    *       FROM $DUMP WITH A POSITIVE FORMAT CODE.   * PMN56860
                    *       ERROR-TO AUXILIARY  SUPERVISOR IF LINKED  * PMN56870
                    *              PROGRAM NOT IN LET/FLET OR IF LINK-* PMN56880
                    *              ED PROGRAM IS A DATA FILE          * PMN56890
                    *TABLES/WORK AREAS- N/A                           * PMN56900
                    *ATTRIBUTES-                                      * PMN56910
                    *     * REUSABLE                                  * PMN56920
                    *     * NATURALLY RELOCATABLE                     * PMN56930
                    *NOTES- THIS PHASE IS CALLED INTO THE 320 WORDS   * PMN56940
                    *       IMMEDIATELY FOLLOWING WHATEVER VERSION OF * PMN56950
                    *       THE DISK I/O IS IN THE RESIDENT.          * PMN56960
                    *************************************************** PMN56970
                          HDNG    CORE IMAGE LOADER, PHASE 1            PMN56980
                          ORG     0                                     PMN56990
*SBRKGL  A0         *CIL CORE IMAGE LOADER - PHASE 1              V2M02 PMN57000
                    * PROVIDE PARAMETERS FOR SYSTEM LOADER              PMN57010
                    *                                                   PMN57020
                          DC      CMEND-*   WORD COUNT OF THIS PHASE    PMN57030
                          DC      -@CIL1    PHASE ID FOR CI LOADER,PH 1 PMN57040
                          DC      CM980-*+1 ADDR OF SLET EXTRACT        PMN57050
                          DC      5         NO. ENTRIES IN EXTRACT      PMN57060
                          ORG     *-2                                   PMN57070
                          HDNG    CORE IMAGE LOADER, PHASE 1            PMN57080
                    CM000 DC      *-*       ENTRY POINT                 PMN57090
                          NOP                                           PMN57100
                          LDX  L1 @CIL1                                 PMN57110
                          STX  L1 $PHSE                                 PMN57120
                          LDX  L1 $I200                                 PMN57130
                          STX  L1 $LEV2     RESTORE $LEV2               PMN57140
                          LDX  L1 $I400                                 PMN57150
                          STX  L1 $LEV4     RESTORE $LEV4               PMN57160
                          LDX  L1 $I420     RESTORE INTRPT REQUEST  2-2 PMN57170
                          STX  L1 $IREQ     *TRAP POINTER               PMN57180
                          LDX  L1 $STOP     RESTORE                 2-6 PMN57190
                          STX  L1 $LEV5     *$LEV5                  2-6 PMN57200
                    * ONE INSTRUCTION MOVED                        2-11 PMN57205
                          STX   3 CM105+1   SAVE XR3                    PMN57210
                          LDX   3 Y                                     PMN57220
                          LD    3 $RMSW-Y   CHECK FOR A DUMP OP    2-11 PMN57222
                          BSC     -Z        SKIP IF LINK OR EXIT   2-11 PMN57224
                          MDX     CM010     SKIP IF DUMP           2-11 PMN57225
                          STX  L1 $LEV3     RESTORE LEV3 INDICATOR 2-11 PMN57226
                    CM010 STX   0 CM115+1   SAVE IAR               2-11 PMN57230
                    *                                                   PMN57240
                    * STORE THE 'GET' SUBR IN WORDS $HASH+8             PMN57250
                    *                                                   PMN57260
                    CM020 LDD     CM900                                 PMN57270
                          STD   3 $HASH+8-Y                             PMN57280
                          LDD     CM900+2                               PMN57290
                          STD   3 $HASH+10-Y                            PMN57300
                          LDD     CM900+4                               PMN57310
                          STD   3 $HASH+12-Y                            PMN57320
                          LDD     CM900+6                               PMN57330
                          STD   3 $HASH+14-Y                            PMN57340
                          LDD     CM900+8                               PMN57350
                          STD   3 $HASH+16-Y                            PMN57360
                          LDD     CM900+10                              PMN57370
                          STD   3 $HASH+18-Y                            PMN57380
                          LD    3 $DZ1N-Y                               PMN57390
                          BSC     +Z        SKIP IF DISK1/N IS IN CORE  PMN57400
                          MDX     CM080     BR IF DISKZ IS IN CORE      PMN57410
                          BSC     Z         SKIP IF DISK1 IS IN CORE    PMN57420
                          MDX     CM030      BR IF DISKN  IS IN CORE    PMN57430
                          LD      CM925     FETCH DISK1 LOW COMMON LIM  PMN57440
                          MDX     CM040     BR TO SAVE LOW COMMON       PMN57450
                    CM030 LD      CM990     FETCH DISKN COMMON LIMIT    PMN57460
                    CM040 STO     CM110+1                               PMN57470
                          STO     CM935                                 PMN57480
                          LD    3 $RMSW-Y   FETCH EXIT-LINK-DUMP SWITCH PMN57490
                          BSC     +         SKIP IF CALL DUMP           PMN57500
                          MDX     CM110     BR IF CALL EXIT OR LINK     PMN57510
                    *                                                   PMN57520
                    * CALL DUMP PROCESSING                              PMN57530
                    *                                                   PMN57540
                          LD    3 $DMPF-Y                               PMN57550
                          LDX  I1 $CXR1     RESTORE XR1                 PMN57560
                          BSC     +Z        SKIP TO DUMP PROGRAM        PMN57570
                          MDX     CM100     BR TO AUXILIARY SUPERVISOR  PMN57580
                          LD      CM982+1   PREPARE TO FETCH DUMP-      PMN57590
                          STO   3 $HASH+11-Y *TO PRINTER PROGRAM        PMN57600
                          A       CM904                                 PMN57610
                          STO   3 $HASH+9-Y                             PMN57620
                          LDD     CM982+2                               PMN57630
                          MDX     CM105                                 PMN57640
                    CM080 LD      CM920     FETCH DISKZ COMMON LIMIT    PMN57650
                          MDX     CM040     *LIMIT, BR TO SAVE 320 WDS  PMN57660
                    CM100 LD      CM984+1   PREPARE TO FETCH THE        PMN57670
                          STO   3 $HASH+11-Y *AUXILIARY SUPERVISOR      PMN57680
                          A       CM904                                 PMN57690
                          STO   3 $HASH+9-Y                             PMN57700
                          LDD     CM984+2                               PMN57710
                    CM105 LDX  L3 *-*       RESTORE XR3                 PMN57720
                          NOP                                           PMN57730
                          MDX     CM118     FETCH REQUESTED PHASE       PMN57740
                    CM110 LDX  L1 *-*       ADDR OF COMMON LIMIT TO XR1 PMN57750
                    CM115 LDX  L2 *-*       ADDR OF CM020 TO XR2        PMN57760
                          MDX   2 X-CM020   ADDR OF CM900 TO XR2        PMN57770
                          LD    2 CM976-X   SET WORD COUNT OF           PMN57780
                          STO   1 0         *320 INTO I/O AREA          PMN57790
                          LD    3 $RMSW-Y   FETCH EXIT-DUMP-LINK SWITCH PMN57800
                          BSC     Z+        SKIP IF CALL LINK           PMN57810
                          MDX     CM140     BRANCH IF CALL EXIT         PMN57820
                    *                                                   PMN57830
                    * CALL LINK PROCESSING                              PMN57840
                    *                                                   PMN57850
                          LD    3 $CORE-Y                               PMN57860
                          S     3 $COMN-Y                               PMN57870
                          S       CM110+1                               PMN57880
                          S     2 CM915-X                               PMN57890
                          BSC     Z+        SKIP IF NO COMMON TO SAVE   PMN57900
                          BSI     CM117     BR IF NEC TO SAVE COMMON    PMN57910
                          MDX     CM119     BR TO FIND PROG IN LET/FLET PMN57920
                    *                                                   PMN57930
                    * SAVE/RESTORE 320 WDS OF COMMON (LOW COMMON)       PMN57940
                    *                                                   PMN57950
                          BSC  L  *-*       RETURN                      PMN57960
                    CM117 EQU     *-1       ENTRY POINT                 PMN57970
                          LD    3 $CIBA-Y   FETCH CIB SCTR ADDR         PMN57980
                          STO   1 1                                     PMN57990
                          LDD     CM930     ADDR OF LOW COMMON TO EXT   PMN58000
                          LD      CM965                                 PMN58010
                          BSI   3 DZ000-Y   SAVE/RESTORE 320 WDS COMMON PMN58020
                          MDX  L  $DBSY,0   LOOP UNTIL OPERATION        PMN58030
                          MDX     *-3       *IS COMPLETE                PMN58040
                          NOP                                           PMN58050
                          SRA     16        SET FUNCTION INDICATOR SO   PMN58060
                          STO     CM965     *THAT NEXT TIME IS A READ   PMN58070
                          MDX     CM117-1   BR TO EXIT                  PMN58080
                    *                                                   PMN58090
                    CM118 MDX     CM180     FETCH REQUESTED PHASE       PMN58100
                    *                       INSTRUCTION MOVED       2-2 PMN58110
                    *                                                   PMN58120
                    *                                                   PMN58130
                    * ABBREVIATED COPY OF SLET, INITIALIZED BY THE      PMN58140
                    * SYSTEM LOADER                                     PMN58150
                    *                                                   PMN58160
                    * SLET ENTRY FOR SUPERVISOR, PHASE 1                PMN58170
                          BSS  E  0                                     PMN58180
                    CM980 DC      @MCRA PHASE ID                        PMN58190
                          DC      *-*  CORE ADDR                        PMN58200
                          DC      *-*  WD CNT                           PMN58210
                          DC      *-*  SCTR ADDR                        PMN58220
                    * SLET ENTRY FOR DUMP-TO-PRINTER PROGRAM            PMN58230
                    CM982 DC      @SUP6 PHASE ID                   2-10 PMN58240
                          DC      *-*  CORE ADDR                        PMN58250
                          DC      *-*  WD CNT                           PMN58260
                          DC      *-*  SCTR ADDR                        PMN58270
                    * SLET ENTRY FOR THE AUXILLIARY SUPERVISOR          PMN58280
                    CM984 DC      @SUP7 PHASE ID                   2-10 PMN58290
                          DC      *-*  CORE ADDR                        PMN58300
                          DC      *-*  WD CNT                           PMN58310
                          DC      *-*  SCTR ADDR                        PMN58320
                    * SLET ENTRY FOR THE CORE LOAD BUILDER, PHASE 0/1   PMN58330
                    CM986 DC      @CLB0     PHASE ID                    PMN58340
                          DC      *-*  CORE ADDR                        PMN58350
                          DC      *-*  WD CNT                           PMN58360
                          DC      *-*  SCTR ADDR                        PMN58370
                    * SLET ENTRY FOR CORE IMAGE LOADER, PHASE 2         PMN58380
                    CM988 DC      @CIL2     PHASE ID                    PMN58390
                          DC      *-*  CORE ADDR                        PMN58400
                          DC      *-*  WD CNT                           PMN58410
                          DC      *-*  SCTR ADDR                        PMN58420
                    *                                                   PMN58430
                    * CONSTANTS AND WORK AREAS                          PMN58440
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       PMN58450
                    *                                                   PMN58460
                    *                                                   PMN58470
                    * CALL DISK SUBROUTINE (TO BE MOVED TO $HASH+8)     PMN58480
                    *                                                   PMN58490
                    CM900 BSC  L  *-*       RETURN ENTRY POINT      +8  PMN58500
                          STD  L  *-*       STORE WD CNT, SCTR ADDR +10 PMN58510
                          LD      *-2                               +12 PMN58520
                          SRT     16                                +13 PMN58530
                          BSI  L  DZ000     BRANCH TO DISK I/O      +14 PMN58540
                          MDX  L  $DBSY,0   SKIP WHEN OPERATION DONE    PMN58550
                          MDX     *-3       BR UNTIL OPERATION DONE +18 PMN58560
                          MDX     *-12      BRANCH TO EXIT          +19 PMN58570
                    CM904 DC      2    CONSTANT OF 2                    PMN58580
                    CM905 DC      *-*  NO. SCTRS COMMON TO BE SAVED     PMN58590
                    CM908 DC      *-*  WASTEBASKET                      PMN58600
                    CM915 DC      322  2+NO. WDS IN A SECTOR            PMN58610
                    CM920 DC      @COMZ-2 DISKZ LOW COMMON LIMIT - 2    PMN58620
                    CM925 DC      @COM1-2 DISK 1   LOW COMMON LIMIT - 2 PMN58630
                    CM930 DC      0    DISK I/O FUNCTION INDICATOR      PMN58640
                    CM935 DC      *-*  ADDR OF LOW COMMON - 2           PMN58650
                    CM940 DC      @MCOR ADDR 1ST WD IN 2ND MEM BANK 2-2 PMN58660
                    CM945 DC      *-*  NO. WDS LEFT FOR COMPARISON      PMN58670
                    CM954 DC      *-*  CURRENT BLOCK ADDR               PMN58680
                    CM955 DC      16   NO. OF 1ST SECTOR IN FLET        PMN58690
                    CM956 DC      320-@LFHD NO. WDS PER LET/FLET SCTR   PMN58700
                    CM957 DC      *-*  BLK CNT OF CURR LET/FLET ENTRY   PMN58710
                    CM960 DC      *-*  NO. WDS COMMON TO BE SAVED       PMN58720
                    CM965 DC      1    SAVE/RESTORE  INDICATOR (1=SAVE) PMN58730
                    CM976 DC      320  NO. WORDS/SECTOR                 PMN58740
                    CM977 DC      /F000 USED TO 'AND' OUT SCTR ADDR     PMN58750
                    CM978 DC      @LFEN NO. WDS PER LET/FLET ENTRY      PMN58760
                    CM979 DC      *-*  SAVE AREA FOR DISK REQ INDICATOR PMN58770
                    CM990 DC      @COM2-2 DISKN LOW COMMON LIMIT-2      PMN58780
                    CM991 DC      @SCIB-@HCIB 1ST SCTR OF HIGH COMM 2-2 PMN58790
                    CM992 BSI  L  *-*  LONG BSI (MOVED INTO A SUBR) 2-2 PMN58800
                    *                                                   PMN58810
                    X     EQU     CM900                                 PMN58820
                    *                                                   PMN58830
                    CM119 MDX     CM220     BR TO SEARCH LET/FLET   2-2 PMN58840
                    *                                                   PMN58850
                    CM120 LD    3 $CORE-Y                               PMN58860
                          S     3 $COMN-Y                               PMN58870
                          S       CM940                                 PMN58880
                          BSC     -         SKIP IF ANY COMMON BELOW    PMN58890
                          MDX     CM140     *4096, BRANCH OTHERWISE     PMN58900
                          STO     CM908     SAVE MINUS NO. WDS TO SAVE  PMN58910
                          MDX     CM128     BRANCH TO CONTINUE          PMN58920
                    *                                                   PMN58930
                    * SAVE COMMON BELOW 4096 (CALL LINK, DSF)           PMN58940
                    *                                                   PMN58950
                    CM125 LD      CM908                                 PMN58960
                          A     2 CM976-X   ADD 320                     PMN58970
                          STO     CM908                                 PMN58980
                          BSC     -Z        SKIP IF DIFFERENCE NOT +    PMN58990
                          MDX     CM130     *BRANCH OTHERWISE           PMN59000
                    CM128 LD    2 CM905-X   ACCUMULATE NO. OF           PMN59010
                          A     3 $S900-Y   *SECTOR OF COMMON TO SAVE   PMN59020
                          STO   2 CM905-X                               PMN59030
                          LD      CM960     ACCUMULATE   NO. WDS TO BE  PMN59040
                          A     2 CM976-X   *SAVED (TO A SCTR BOUNDARY) PMN59050
                          STO     CM960                                 PMN59060
                          MDX     CM125     BR TO ACCUMULATE            PMN59070
                    CM130 LD      CM940     COMPUTE CORE ADR FROM WHICH PMN59080
                          S       CM960     *SAVING OF COMMON TO START  PMN59090
                          S     2 CM904-X   ALLOW FOR WD CNT, SCTR ADDR PMN59100
                          STO     CM135+1                               PMN59110
                          STO   3 $CCAD-Y                               PMN59120
                          LD    3 $CIBA-Y   COMPUTE SECTOR ADDR ONTO    PMN59130
                          A       CM991     *WHICH 1ST 320 WDS ARE  2-2 PMN59140
                          S       CM905     *TO BE SAVED                PMN59150
                          RTE     16                                    PMN59160
                          LD      CM960                                 PMN59170
                    CM135 STD  L  *-*       STORE DKI/O PARAMETERS      PMN59180
                          STD   3 $CWCT-Y                               PMN59190
                          LD      CM135+1                               PMN59200
                          RTE     16                                    PMN59210
                          LD    3 $S900-Y                               PMN59220
                          BSI   3 DZ000-Y   SAVE REST OF 1ST 4K OF CORE PMN59230
                    *                                                   PMN59240
                    * CALL EXIT/CALL LINK (DSF LINK) PROCESSING         PMN59250
                    *                                                   PMN59260
                    CM140 LD    3 $DZ1N-Y                               PMN59270
                          BSC     Z+        SKIP IF DISK1/N IS IN CORE  PMN59280
                          MDX     CM160     BRANCH IF DISKZ IS IN CORE  PMN59290
                          LD    3 $DREQ-Y   SAVE DISK REQUESTED         PMN59300
                          STO     CM979     *INDICATOR                  PMN59310
                          LD    3 $S910-Y   FORCE A REQUEST FOR         PMN59320
                          STO   3 $DREQ-Y   *DISKZ                      PMN59330
                          LD      CM965     SET SWITCH TO INDICATE THAT PMN59340
                          STO   3 $CLSW-Y   *DISK I/O IS TO BE FETCHED  PMN59350
                          STX  L1 $HASH+11                              PMN59360
                          LDD     CM988+2                               PMN59370
                          BSI   3 $HASH+9-Y FETCH CIL, PHASE 2          PMN59380
                          BSI   1 2         BR TO CIL, PHASE 2          PMN59390
                          LDX  L1 @CIL1     RESTORE PHASE ID            PMN59400
                          STX  L1 $PHSE                                 PMN59410
                          LD      CM979     RESTORE DISK-               PMN59420
                          STO   3 $DREQ-Y   *REQUESTED INDICATOR        PMN59430
                          LD    3 $S910-Y                               PMN59440
                          STO   3 $DZ1N-Y   SET DISK I/O INDICATOR      PMN59450
                    CM160 LD    3 $RMSW-Y   FETCH EXIT-LINK-DUMP SWITCH PMN59460
                          BSC     -+        SKIP IF CALL EXIT           PMN59470
                          MDX     CM390     BRANCH IF CALL LINK         PMN59480
                          LD      CM980+1   FETCH AND STORE CORE LOAD-  PMN59490
                          STO   3 $HASH+11-Y *ING ADDR OF MCRA          PMN59500
                          A       CM904     GENERATE XEQ ADDR           PMN59510
                          STO   3 $HASH+9-Y *IN DISK CALL SUBROUTINE    PMN59520
                          LDD     CM980+2   SET UP WD CNT, SCTR ADDR    PMN59530
                    CM180 NOP                                           PMN59540
                          LDX   0 $HASH+10  BR TO 'GET' SUBR            PMN59550
                    *                                                   PMN59560
                    * LOOK UP LINK NAME IN LET/FLET                     PMN59570
                    *                                                   PMN59580
                    CM220 STX   1 CM230+1   SAVE XR1                    PMN59590
                          STX   1 CM380+1                               PMN59600
                          STX   1 CM420+1                               PMN59610
                          STX   2 CM285+1   SAVE XR2                    PMN59620
                          LDX   2 0         ZERO TO XR2             212 PMN59660
                          MDX   2 -@MXDR-1  DECREMENT BY NO DRIVES  212 PMN59670
                          NOP               ALLOW FOR SKIP          2-2 PMN59680
                          MDX     CM230     BR TO BEGIN SEARCH      2-2 PMN59690
                    CM225 LDX  L2 *-*       PREPARE TO SEARCH NEXT L2-2 PMN59700
                    CM230 LDX  L1 *-*       SEARCH NEXT LET TABLE       PMN59710
                          LD   L2 $ULET+@MXDR+1 FETCH ADDR UA       212 PMN59720
                          MDX   2 1         SKIP IF ALL DRIVES SEARCHED PMN59730
                          MDX     CM270     *BRANCH OTHERWISE           PMN59740
                    *                                                   PMN59750
                    * OUT TO PRINT ERROR MESSAGE                        PMN59760
                    *                                                   PMN59770
                    CM240 LDX   1 -3         NAME NOT FOUND IN LET  2-2 PMN59780
                          MDX     CM470      *FLET,GET ERROR NUMB   2-2 PMN59790
                    *                                                   PMN59800
                    CM250 MDX     CM120                                 PMN59810
                    *                                                   PMN59820
                    CM270 BSC     +-        SKIP IF DISK MOUNTED,       PMN59830
                          MDX     CM240     *BRANCH OTHERWISE           PMN59840
                          STX   2 CM225+1   SAVE NEXT DRIVE INDICATOR   PMN59850
                    CM280 STX  L1 $HASH+11  SAVE ADDR OF LET SEARCH BFR PMN59860
                          RTE     16                                    PMN59870
                    CM285 LDX  L2 *-*       RESTORE XR2                 PMN59880
                          LD    2 CM976-X                               PMN59890
                          NOP                                           PMN59900
                          BSI   3 $HASH+9-Y FETCH 1 SECTOR OF LET/FLET  PMN59910
                          LD    2 CM954-X   INITIALIZE BLK ADDR ACCUM-  PMN59920
                          STO   3 $DADR-Y   *ULATOR WITH CURRENT ADDR   PMN59930
                          LD    1 @SCTN+2   FETCH LET/FLET SECTOR NO.   PMN59940
                          BSC     +-        SKIP, NOT FIRST LET SECTOR  PMN59950
                          MDX     CM290     *BRANCH OTHERWISE           PMN59960
                          S     2 CM955-X                               PMN59970
                          BSC     Z         SKIP IF FIRST SECTOR FLET   PMN59980
                          MDX     CM300     BR, NOT FIRST SCTR LET/FLET PMN59990
                    CM290 LD    1 @UAFX+2   INITIALIZE BLK ADDR ACCUM-  PMN60000
                          SLA     4         *ULATOR TO ADDR 1ST PROGRAM PMN60010
                          STO   2 CM954-X   *STORED IN LET/FLET         PMN60020
                          STO   3 $DADR-Y                               PMN60030
                    CM300 LD    2 CM956-X   COMPUTE NO. WDS IN CURRENT  PMN60040
                          S     1 @WDSA+2   *LET/FLET SECTOR            PMN60050
                          STO   2 CM945-X                               PMN60060
                    CM320 LD    1 @BLCT+@LFHD+2 SAVE BLK CNT OF CURRENT PMN60070
                          BSC     Z         SKIP IF SEC ENT PT     2-10 PMN60075
                          STO   2 CM957-X   *LET/FLET ENTRY             PMN60080
                          LD    1 @LFNM+@LFHD+2 SAVE NAME OF CURRENT    PMN60090
                          STO   2 CM900+1-X *LET/FLET ENTRY             PMN60100
                          SLA     2                                     PMN60110
                          SRA     2                                     PMN60120
                          S     3 $LKNM-Y   COMPARE WITH NAME SOUGHT    PMN60130
                          BSC     Z         SKIP IF 1ST WDS MATCH,      PMN60140
                          MDX     CM400     *BRANCH OTHERWISE           PMN60150
                          LD    3 $LKNM+1-Y FETCH 2ND WD OF NAME        PMN60160
                          S     1 @LFNM+1+@LFHD+2                       PMN60170
                          BSC     Z         SKIP IF 2ND WDS MATCH,      PMN60180
                          MDX     CM400     *BRANCH OTHERWISE           PMN60190
                          LD    1 @BLCT+@LFHD+2  TEST DB CNT       2-10 PMN60192
                          BSC     Z         SKIP IF SEC ENT PT     2-10 PMN60193
                          MDX     CM380     MATCH WAS OK           2-10 PMN60194
                          LD    3 $DADR-Y   GET ACCUMLATE BLK ADDR 2-10 PMN60196
                          S     2 CM957-X   DB CNT OF THIS ROUTINE 2-10 PMN60197
                          STO   3 $DADR-Y   POINT BACK TO MAIN ENT 2-10 PMN60198
                    CM380 LDX  L1 *-*       RESTORE XR1                 PMN60200
                          LD    1 1                                     PMN60210
                          AND   2 CM977-X                               PMN60220
                          STO   3 $DCDE-Y   STORE DRIVE CODE OF PROGRAM PMN60230
                          LD    2 CM117-X                               PMN60240
                          BSC     Z         SKIP IF NO COMMON SAVED     PMN60250
                          BSI   2 CM117-X   BR TO RESTORE 320 COMMON    PMN60260
                          LD    2 CM900+1-X FETCH FIRST WORD OF NAME    PMN60270
                          SLA     1                                     PMN60280
                          BSC     +Z        TEST PROGRAM FORMAT         PMN60290
                          MDX     CM460     BRANCH IF DATA FILE         PMN60300
                          BSC     C         SKIP IF PROGRAM IN DSF,     PMN60310
                          MDX     CM480     *BR FOR CORE IMAGE FORMAT   PMN60320
                          MDX     CM250     BR TO CHECK COMMON          PMN60330
                    CM390 LD    2 CM986+1-X PREPARE TO FETCH CORE LOAD  PMN60340
                          STO   3 $HASH+11-Y *BUILDER, PHASE 1          PMN60350
                          A     2 CM904-X                               PMN60360
                          STO   3 $HASH+9-Y                             PMN60370
                          LDD   2 CM986+2-X                             PMN60380
                    CM395 MDX     CM180     BR TO EXIT FROM CIL, PH 1   PMN60390
                    CM400 LD    3 $DADR-Y                               PMN60400
                          A     1 @BLCT+@LFHD+2  CURRENT DB CNT    2-10 PMN60410
                          STO   3 $DADR-Y   ACCUMULATED BLOCK ADDR      PMN60420
                          MDX   1 @LFEN     POINT TO NEXT LET/FLET ENT  PMN60430
                          LD    2 CM945-X                               PMN60440
                          S     2 CM978-X   DECREMENT LET/FLET COUNT    PMN60450
                          STO   2 CM945-X                               PMN60460
                          BSC     Z         SKIP WHEN SECTOR SEARCHED,  PMN60470
                          MDX     CM320     *BRANCH OTHERWISE           PMN60480
                    *                                                   PMN60490
                    * PREPARE TO READ DOWN A NEW LET/FLET SECTOR        PMN60500
                    *                                                   PMN60510
                    CM420 LDX  L1 *-*       ADDR OF BUFFER TO XR1       PMN60520
                          LD    3 $DADR-Y   INITIALIZE BLOCK ADDR WITH  PMN60530
                          STO   2 CM954-X   *PRESENT ACCUMULATED ADDR   PMN60540
                          LD    1 @NEXT+2                               PMN60550
                          BSC     +-        SKIP UNLESS LAST LET/FLET   PMN60560
                          MDX     CM225     BR TO INITIALIZE NEW DRIVE  PMN60570
                          LD    1 1         FETCH CURRENT SECTOR ADDR   PMN60580
                          AND   2 CM977-X   MASK OUT SECTOR ADDRESS     PMN60590
                          OR    1 @NEXT+2   MASK IN NEXT SECTOR ADDRESS PMN60600
                          MDX     CM280     BRANCH TO CONTINUE          PMN60610
                    *                                                   PMN60620
                    * OUT TO PRINT ERROR MESSAGE                        PMN60630
                    *                                                   PMN60640
                    CM460 LDX   1 -4         ATTEMT TO EXEQ DATA FIL2-2 PMN60650
                    CM470 STX   1 CM995      SET ER CODE FOR AUX SUP2-2 PMN60660
                          LDX   1 $LKNM      PREVENT SKELETON SUP TO2-2 PMN60670
                          STX  L1 $LINK      *DESTROY LINK NAME     2-2 PMN60680
                          BSI   3 $DUMP-Y    BR TO GET AUX SUP      2-2 PMN60690
                    CM995 DC      *-*        SLOT FOR ERROR CODE    2-2 PMN60700
                    *                                                   PMN60710
                    * FETCH THE CORE IMAGE LOADER, PHASE 2              PMN60720
                    *                                                   PMN60730
                    CM480 LDX  L1 $NEND-2   END OF DISKN MINUS 2 TO XR1 PMN60740
                          LD      *         FETCH ANY NEG VALUE         PMN60750
                          STO   3 $CLSW-Y   CLEAR CIL SWITCH            PMN60760
                          STX  L1 $HASH+11  SAVE ADDR OF LET SEARCH BFR PMN60770
                          MDX   1 2                                     PMN60780
                          STX  L1 $HASH+9   STORE EXECUTION ADDR        PMN60790
                          LD    2 CM992-X                               PMN60800
                          STO   3 $HASH+8-Y                             PMN60810
                          LDD   2 CM988+2-X SET UP WD CNT, SCTR ADDR    PMN60820
                          MDX     CM395     BR TO FETCH CIL, PH 2   2-2 PMN60830
                    *                                                   PMN60840
                    *                                                   PMN60850
                          BSS     2         PATCH AREA             2-11 PMN60860
                          DC      0         PATCH AREA                  PMN60870
                    CMEND EQU     *-1                                   PMN60880
                          BSS  E  322       LET/FLET SECTOR BUFFER      PMN60890
                          HDNG    CORE IMAGE LOADER, PHASE 2            PMN60900
                    *************************************************** PMN60910
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * PMN60920
                    *FUNCTION/OPERATION- THIS PHASE READS THE REQUEST-* PMN60930
                    *     ED VERSION OF THE DISK I/O SUBR    INTO CORE* PMN60940
                    *     AND UPDATES THE SKELETON SUPERVISOR WITH THE* PMN60950
                    *     ADDR OF THE END OF THE DISK I/O SUBR.       * PMN60960
                    *     CIL, PHASE 2 WILL, IN ADDITION, FETCH AND   * PMN60970
                    *     TRANSFER CONTROL TO A CORE IMAGE PROGRAM.   * PMN60980
                    *ENTRY POINTS- LD000 IS THE ONLY ENTRY POINT. THE * PMN60990
                    *     CALLING SEQUENCE IS                         * PMN61000
                    *     BSI  L  LD000                               * PMN61010
                    *INPUT- NONE                                      * PMN61020
                    *OUTPUT- THE ONLY OUTPUT IS THE VERSION OF THE    * PMN61030
                    *     DISK SUBROUTINE REQUESTED, WHICH WILL BE    * PMN61040
                    *     FOUND IN THE RESIDENT MONITOR AT DZ000.     * PMN61050
                    *EXTERNAL REFERENCES-                             * PMN61060
                    *     * $PHSE                                       PMN61070
                    *     * $CLSW                                       PMN61080
                    *     * $DADR                                       PMN61090
                    *     * $DCDE                                       PMN61100
                    *     * $HASH                                       PMN61110
                    *     * $IBT4                                       PMN61120
                    *     * $WRD1                                       PMN61130
                    *     * $CORE                                       PMN61140
                    *     * $LEV0                                       PMN61150
                    *     * $LEV1                                       PMN61160
                    *     * $LEV2                                       PMN61170
                    *     * $LEV3                                       PMN61180
                    *     * $LEV4                                       PMN61190
                    *     * $LEV5                                       PMN61200
                    *     * $LNXQ                                   2-9 PMN61210
                    *     * $CLSW                                       PMN61220
                    *     * $CIBA                                       PMN61230
                    *     * $WSDR                                       PMN61240
                    *     * $FPAD                                       PMN61250
                    *     * $LSAD                                       PMN61260
                    *     * $DREQ                                       PMN61270
                    *     * $:Z1N                                       PMN61280
                    *     * DZ000                                       PMN61290
                    *     * $DBSY                                       PMN61300
                    *     * $1END                                       PMN61310
                    *     * $NEND                                       PMN61320
                    *     * $ZEND                                       PMN61330
                    *     * $CILA                                       PMN61340
                    *     * $IBT2                                       PMN61350
                    *     * $COMN                                       PMN61360
                    *     * $CCAD                                       PMN61370
                    *     * $CWCT                                       PMN61380
                    *     * $DDSW                                       PMN61390
                    *     * $CYLN                                       PMN61400
                    *     * $PRET                                       PMN61410
                    *     * $PST2                                       PMN61420
                    *     * $DCYL                                       PMN61430
                    *     * $ACDE                                       PMN61440
                    *     * $XR3X                                  2-2* PMN61450
                    *EXITS- NORMAL                                    * PMN61460
                    *     * TO THE CALLER                             * PMN61470
                    *     * TO THE REQUESTED CORE LOAD                * PMN61480
                    *     ERROR-                                      * PMN61490
                    *         * $PRET                                 * PMN61500
                    *         * $PST2                                 * PMN61510
                    *TABLES/WORK AREAS-N/A                            * PMN61520
                    *            BY THE SYSTEM LOADER                 * PMN61530
                    *ATTRIBUTES-                                      * PMN61540
                    *     NATURALLY RELOCATABLE                       * PMN61550
                    *NOTES- THIS PHASE CONTAINS A DISK SUBROUTINE THAT* PMN61560
                    *     READS THE REQUESTED VERSION OF DISK I/O     * PMN61570
                    *     DIRECTLY INTO DZ000.                        * PMN61580
                    *************************************************** PMN61590
                          HDNG    CORE IMAGE LOADER, PHASE 2            PMN61600
                    * PROVIDE PARAMETERS FOR SYSTEM LOADER              PMN61610
                    *                                                   PMN61620
                          ORG     0                                     PMN61630
*SBRKGL  A1         *CIL CORE IMAGE LOADER - PHASE 2              V2M04 PMN61640
                          DC      LDEND-*   WORD COUNT OF THIS PHASE    PMN61650
                          DC      -@CIL2    PHASE ID FOR CI LOADER,PH 2 PMN61660
                          DC      LD930-*+1 ADDR OF SLET TABLE EXTRACT  PMN61670
                          DC      3         COUNT OF SLET ENTRIES       PMN61680
                          ORG     *-2                                   PMN61690
                          HDNG    CORE IMAGE LOADER, PHASE 2            PMN61700
                    LD000 DC      *-*       ENTRY POINT                 PMN61710
                          NOP                                           PMN61720
                          LDX  L3 @CIL2                            2-10 PMN61730
                          STX  L3 $PHSE                             2-9 PMN61740
                          LDX   3 Y                                 2-9 PMN61750
                          STX   1 LD055+1   SAVE XR1                2-9 PMN61760
                          STX   2 LD055+3   SAVE XR2                2-9 PMN61770
                          STX   0 *+1                                   PMN61780
                    LD010 LDX  L1 *-*                                   PMN61790
                          MDX  L1 RAREA-LD010                           PMN61800
                          LD    3 $HASH+7-Y SET WITH -1 BY MCRA     2-9 PMN61810
                          SRT     16        *IF XEQ                 2-9 PMN61820
                          BSC     +Z                                2-9 PMN61830
                          LD      LD902     SET +1 IF XEQ           2-9 PMN61840
                          S     3 $S900-Y   *OR -1 IF LINK         2-10 PMN61850
                          STO   3 $LNXQ-Y   *IF XEQ SET +1          2-9 PMN61860
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LDR SWITCH PMN61870
                          BSC     Z-        SKIP IF FETCHING CORE LOAD  PMN61880
                          MDX     LD060     BR IF FETCHING DISK1/DISKN  PMN61890
                          LD    3 $DADR-Y   PREPARE TO FETCH THE        PMN61900
                          SRA     4         CONVERT FROM DB TO SCTR ADR PMN61910
                          OR    3 $DCDE-Y   OR IN THE DRIVE CODE        PMN61920
                          RTE     16        *CORE IMAGE HEADER          PMN61930
                          LD      LD915                                 PMN61940
                          STX  L1 $HASH+11                              PMN61950
                          BSI   3 $HASH+9-Y FETCH CORE IMAGE HEADER     PMN61960
                          DC      *-*       RETURN FROM FETCHING CI HDR PMN61970
                          LD    1 @DREQ+2                           2-1 PMN61980
                          BSC     Z+        SKIP IF DISK1/N         2-1 PMN61990
                          MDX     LD012     *BR OTHERWISE           2-1 PMN62000
                          LD    1 @XCTL+2   STORE EXIT CONTROL ADR  2-1 PMN62010
                          STO  L  @DKEP+2   *IN DISK1/N             2-1 PMN62020
                    LD012 LD    1 @XR3X+2   FETCH XR3 SETTING       2-1 PMN62030
                          STO     LD025+1                               PMN62040
                          STO   3 $XR3X-Y    SAVE IN COMMA          2-2 PMN62050
                          LD    1 @LDAD+2   FETCH LOADING ADDR          PMN62060
                          A       LD905     *AND COMPUTE ADDR OF THE    PMN62070
                          STO   3 $IBT4-Y   *IBT FOR LEVEL 4            PMN62080
                          LD    1 @LDAD+2   FETCH LOADING ADDR          PMN62090
                          STO   3 $WRD1-Y                               PMN62100
                          S       LD902     COMPUTE LOADING         2-9 PMN62110
                          STO     LD020+1   *ADDRESS MINUS TWO          PMN62120
                          LD    1 @TVWC+2   FETCH THE TV WORD COUNT     PMN62130
                          STO     LD025+3                               PMN62140
                          BSC     +-        SKIP IF NO TV               PMN62150
                          MDX     LD015     *BRANCH OTHERWISE           PMN62160
                          LD    1 @LDAD+2   FETCH LOADING ADDR,         PMN62170
                          A     1 @WCNT+2   *ADD THE WORD COUNT,        PMN62180
                          S     1 @TVWC+2   *SUB THE TV WORD COUNT,     PMN62190
                          S     3 $S900-Y   *AND 1 TO GET ADDR FR  2-10 PMN62200
                          STO     FROM      *WHICH TV IS TO BE MOVED    PMN62210
                          LD    1 @CORE+2   FETCH CORE SIZE        2-10 PMN62220
                          S     1 @CMON+2   *SUB THE WD CNT OF COMMON,  PMN62230
                          S     1 @TVWC+2   *THE TV WORD COUNT,         PMN62240
                          S     3 $S900-Y   *AND 1 TO GET ADDR TO  2-10 PMN62250
                          STO     TO        *WHICH THE TV TO BE MOVED   PMN62260
                    LD015 LD    1 @XEQA+2   FETCH CORE LOAD EXEC ADDR   PMN62270
                          STO     ABXEQ                                 PMN62280
                    *                                                   PMN62290
                    * FILL IN THE INTERRUPT TRANSFER VECTOR             PMN62300
                    *                                                   PMN62310
                          LD    1 @ITVX+2                               PMN62320
                          STO   3 $LEV0-Y   LEVEL 0 BRANCH ADDR         PMN62330
                          LD    1 @ITVX+3                               PMN62340
                          STO   3 $LEV1-Y   LEVEL 1 BRANCH ADDR         PMN62350
                          LD    1 @ITVX+4                               PMN62360
                          STO     LEVL2     LEVEL 2 BRANCH ADDR     2-2 PMN62370
                          LD    1 @ITVX+5                               PMN62380
                          STO   3 $LEV3-Y   LEVEL 3 BRANCH ADDR         PMN62390
                          LD    1 @ITVX+6                               PMN62400
                          STO   3 $LEV4-Y   LEVEL 4 BRANCH ADDR         PMN62410
                          LD    1 @ITVX+7                               PMN62420
                          STO   3 $LEV5-Y   LEVEL 5 BRANCH ADDR         PMN62430
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LOADER SW  PMN62440
                          BSC     -         *AND SKIP IF PROG IN USER-  PMN62450
                          MDX     LD030     *FIXED AREA. BR IF IN CIB   PMN62460
                          LD    3 $DADR-Y                               PMN62470
                          SRA     4                                     PMN62480
                          OR    3 $DCDE-Y   STORE SCTR ADDR OF CORE     PMN62490
                          STO     LD900+1   *LOAD, INCLUDING DRIVE CODE PMN62500
                          LD    1 @WCNT+2                               PMN62510
                          A       LD985                                 PMN62520
                          SRT     16        CONVERT CORE LOAD WORD CNT  PMN62530
                          D       LD960     *TO A SCTR CNT AND ADD TO   PMN62540
                          A       LD900+1   STORE ADDR OF 1ST LOCAL/    PMN62550
                          STO     LD970     *SOCAL, INCLUDING DRIVE CD  PMN62560
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LOADER SW  PMN62570
                          SLA     1         *AND SET CARRY IF XEQ DCI   PMN62580
                          LD      LD970                                 PMN62590
                          BSC     C         SKIP IF XEQ DSF (NOT DCI)   PMN62600
                          S     1 @LSCT+2   ADJUST FOR FILES IN WS      PMN62610
                          MDX     LD040     *LOAD (ADDR OF LOCAL/SOCAL) PMN62620
                    *                                                   PMN62630
                    *                                                   PMN62640
                    *                                                   PMN62650
                    LD020 LDX  L1 *-*       LOADING ADDR - 2 TO XR1     PMN62660
                          SRA     16                                    PMN62670
                          STO   3 $DCDE-Y   CLEAR DR CODE INDICATOR 2-2 PMN62680
                          STO   3 $PHSE-Y   INDICATE USER PROG IN CTRL  PMN62690
                          LDD     LD900     FETCH CORE LOAD WD CNT      PMN62700
                    LD025 LDX  L3 *-*       POINT XR3 AT TRANSFER VECTR PMN62710
                          LDX  L2 *-*       TV WD CNT TO XR2            PMN62720
                          LDX   0 $HASH     BR TO FETCH THE CORE LOAD   PMN62730
                    *                                                   PMN62740
                    *                                                   PMN62750
                    LD050 LD      LD000                             2-9 PMN62760
                    LD055 LDX  L1 *-*       RESTORE XR1             2-9 PMN62770
                          LDX  L2 *-*       RESTORE XR2             2-9 PMN62780
                          STO     *+1                               2-9 PMN62790
                          BSC  L  *-*       RETURN TO CIL, PHASE 1  2-9 PMN62800
                    *                                               2-9 PMN62810
                    *                                               2-9 PMN62820
                    *                                               2-9 PMN62830
                    LD030 LD    3 $CIBA-Y   FETCH DRIVE CODE, SCTR ADDR PMN62840
                          STO     LD900+1   *OF THE CIB                 PMN62850
                          LDX  I2 $WSDR     DRIVE CODE OF WS TO XR2     PMN62860
                          LD   L2 $FPAD     FETCH ADDR OF WKNG STGE     PMN62870
                    LD040 STO   3 $LSAD-Y   STORE LOCAL/SOCAL SCTR ADDR PMN62880
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LDR SWITCH PMN62890
                          BSC     Z+        SKIP IF FETCHING DISK I/O   PMN62900
                          MDX     LD075     *OR XEQ DSF, BR IF XEQ DCI  PMN62910
                          LD    1 @LDAD+2                               PMN62920
                          S       LD980                                 PMN62930
                          BSC     -         SKIP IF AT LEAST PART OF    PMN62940
                          MDX     LD045     *CORE LD IS BELOW 4K    2-9 PMN62950
                          LD    1 @LDAD+2   COMPARE ADDR OF END OF CORE PMN62960
                          A     1 @WCNT+2   *LOAD WITH 4096             PMN62970
                          S       LD980                                 PMN62980
                          BSC     +         SKIP IF PART OF CORE LOAD   PMN62990
                          MDX     LD075     *RESIDES ABOVE 4095         PMN63000
                          STO     LD970     SAVE AMOUNT ABOVE 4095      PMN63010
                          LD    1 @WCNT+2   REDUCE CORE LOAD WD CNT BY  PMN63020
                          S       LD970     *AMOUNT ABOVE 4095          PMN63030
                          MDX     LD080     BR TO STORE WD CNT          PMN63040
                    LD045 LD      LD903     IF CORE LD ABOVE 4K     2-9 PMN63050
                          STO     GETCL     *FORCE $HASH CODE TO    2-9 PMN63060
                          MDX     LD085     *SKIP DISK READ         2-9 PMN63070
                    *                                                   PMN63080
                    LD902 DC      2         CONSTANT 2              2-9 PMN63100
                    *                                                   PMN63110
                    LD060 LD    3 $DREQ-Y                               PMN63120
                          BSC     Z         SKIP IF DISK1 REQUESTED     PMN63130
                          MDX     LD400     BR UNLESS DISK1 REQUESTED   PMN63140
                          MDX     LD090     BR TO CONTINUE PROCESSING   PMN63150
                    *                                                   PMN63160
                    *                                                   PMN63180
                    * CONSTANTS AND WORK AREA                           PMN63190
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       PMN63200
                    *                                                   PMN63210
                    LD903 DC      /7008     SKIP DK IO IN $HASH AREA2-9 PMN63220
                          BSS  E  0                                     PMN63230
                    LD900 DC      *-*       WORD COUNT AND SECTOR ADDR  PMN63240
                          DC      *-*       *FOR CORE LOAD              PMN63250
                    *                                               2-9 PMN63260
                    LD905 DC      @ILS4-@XEQA-1 IBT ADDR IN CI HDR      PMN63270
                    *                       CONSTANT MOVED          2-9 PMN63280
                    LD915 DC      @HEND-@XEQA+1 WD CNT OF CI HEADER     PMN63290
                          BSS  E  0                                     PMN63300
                    * SLET ENTRY FOR DISKZ                              PMN63310
                    LD930 DC      @DZID     PHASE ID FOR DISKZ          PMN63320
                          DC      *-*       CORE ADDR                   PMN63330
                          DC      *-*       WORD COUNT                  PMN63340
                          DC      *-*       SECTOR ADDR                 PMN63350
                    * SLET ENTRY FOR DISK1                              PMN63360
                    LD940 DC      @D1ID     PHASE ID FOR DISK1          PMN63370
                          DC      *-*       CORE ADDR                   PMN63380
                          DC      *-*       WORD COUNT                  PMN63390
                          DC      *-*       SECTOR ADDR                 PMN63400
                    * SLET ENTRY FOR DISKN                              PMN63410
                    LD950 DC      @DNID     PHASE ID FOR DISKN          PMN63420
                          DC      *-*       CORE ADDR                   PMN63430
                          DC      *-*       WORD COUNT                  PMN63440
                          DC      *-*       SECTOR ADDR                 PMN63450
                    LD960 DC      320       NO. WORDS/SECTOR            PMN63460
                    LD965 DC      @DKIP     DISK I/O INTERRUPT ENTRY PT PMN63470
                    LD970 DC      *-*       WASTEBASKET                 PMN63480
                    *                       CONSTANT MOVED          2-9 PMN63490
                    LD980 DC      @MCOR     MINIMUM CORE SIZE SUPPOR2-2 PMN63500
                    LD985 DC      319       WORDS/SECTOR MINUS 1        PMN63510
                    *                                                   PMN63520
                    * SUBR TO FETCH THE CORE LOAD AND TRANSFER TO IT.   PMN63530
                    * (TO BE MOVED TO SKELETON SUPERVISOR WORK AREA)    PMN63540
                    *                                                   PMN63550
                    LD070 MDX     LD020     INTERMEDIATE BRANCH    2-10 PMN63555
                          BSS  E  0                                     PMN63560
                    GETCL NOP                                           PMN63570
                          STO   1 0         STORE CORE LOAD WORD COUNT  PMN63580
                          RTE     16                                    PMN63590
                          STO   1 1         STORE DISK ADDR OF CORE LD  PMN63600
                          STX   1 GETCL     LOADING ADDR MINUS 2        PMN63610
                          LD      GETCL     *MOVED INTO                 PMN63620
                          LDX   1 $HASH+6   ADDR RETN TO XR1        2-2 PMN63630
                          MDX  X  $S200-$HASH-7-1 BR TO SKELETON SUP2-2 PMN63640
                          DC      *-*       RETURN FROM SKELETON SUP2-2 PMN63650
                          LDX  L1 *-*       STORE ADDR OF LEVEL     2-2 PMN63660
                    LEVL2 EQU     *-1       *2 IBT ENTRY IN         2-2 PMN63670
                          TRAP                                          KNITTEL
                          STX  X1 $LEV2-$HASH-11-1                  2-2 PMN63680
                          LD   L2 *-*       FETCH 1 WD OF THE TV        PMN63690
                    FROM  EQU     *-1       ADDR FROM WHICH TV MOVED    PMN63700
                          STO  L2 *-*       MOVE IT TO PROPER LOCATION  PMN63710
                    TO    EQU     *-1       ADDR TO WHICH TV MOVED      PMN63720
                          MDX   2 -1        SKIP WHEN TV MOVED          PMN63730
                          MDX     *-6       MOVE ANOTHER WORD           PMN63740
                          BSC  L  *-*       GIVE CONTROL TO THE CORE LD PMN63750
                    ABXEQ EQU     *-1       EXECUTION ADDR OF CORE LOAD PMN63760
                    *                                                   PMN63770
                    *                                                   PMN63780
                    *                                                   PMN63790
                    LD075 LD    1 @WCNT+2   FETCH WD CNT OF CORE LOAD   PMN63800
                    LD080 STO     LD900                                 PMN63810
                    LD085 LD    1 @DREQ+2   FETCH DISK REQUEST INT 2-10 PMN63820
                          S     3 $DZ1N-Y                               PMN63830
                          BSC     +-        BRANCH IF UNNECESSARY TO    PMN63840
                          MDX     LD200     *FETCH DISK I/O             PMN63850
                          LD    1 @DREQ+2   FETCH DISK REQUESTED IND    PMN63860
                          STO   3 $DZ1N-Y   RESTORE DISK I/O IND.       PMN63870
                          BSC     Z         BRANCH IF DISKZ OR DISKN    PMN63880
                          MDX     LD400     *REQUESTED                  PMN63890
                    *                                                   PMN63900
                    * PREPARE TO FETCH DISK1                            PMN63910
                    *                                                   PMN63920
                    LD090 LDD     LD940+2   DISK1 WD CNT, SCTR ADDR     PMN63930
                          LDX  L2 $1END-4   END OF DISK1 - 4 TO XR2     PMN63940
                    *                                                   PMN63950
                    * FETCH THE REQUESTED VERSION OF DISK I/O           PMN63960
                    *                                                   PMN63970
                    LD100 STD   3 DZ000-2-Y STORE WD CNT, SCTR ADDR     PMN63980
                          STX  L2 $CILA     STORE ADDR OF DISK I/O - 4  PMN63990
                          LD    1 @XCTL+2                               PMN64000
                          STO     LD970                                 PMN64010
                          LD    1 @DREQ+2                               PMN64020
                          STO   3 $DZ1N-Y                               PMN64030
                          BSI     DR000     READ IN DISK I/O            PMN64040
                          NOP                                           PMN64050
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LDR SWITCH PMN64060
                          BSC     Z-        SKIP IF FETCHING A CORE     PMN64070
                          MDX     LD150     *LOAD, BRANCH OTHERWISE     PMN64080
                          LD      LD970     FETCH DISK EXIT CTRL ADDR   PMN64090
                          BSC     Z         SKIP IF EXIT CTRL ADDR ZERO PMN64100
                          STO   3 @DKEP+2-Y STORE EXIT CTRL IN DISK1/N  PMN64110
                    LD150 LD      LD965                                 PMN64120
                          STO   3 $IBT2-Y   *DISKZ,1,N                  PMN64130
                          LD    3 $CLSW-Y   FETCH CORE IMAGE LDR SWITCH PMN64140
                          BSC     Z-        SKIP IF FETCHING CORE LOAD  PMN64150
                          MDX     LD050     BR IF FETCHING DISK1/DISKN  PMN64160
                    *                                                   PMN64170
                    * MOVE SUBR FOR FETCHING THE CORE LOAD TO THE       PMN64180
                    * WORK AREA IN THE SKELETON SUPERVISOR              PMN64190
                    *                                                   PMN64200
                    LD200 LD    3 $CLSW-Y   FETCH CIL SWITCH        2-6 PMN64210
                          BSC     Z+        SKIP IF FETCH DISK I/O  2-6 PMN64220
                          MDX     LD250     *OR XEQ DSF, BR IF DCI  2-6 PMN64230
                          LD    3 $CORE-Y                               PMN64240
                          S     3 $COMN-Y                               PMN64250
                          S       LD980                                 PMN64260
                          BSC     -         SKIP IF ANY COMMON BELOW    PMN64270
                          MDX     LD250     *4096, BRANCH OTHERWISE     PMN64280
                          LD    3 $CCAD-Y   FETCH ADDR OF COMMON        PMN64290
                          STO   3 $HASH+11-Y                            PMN64300
                          LDD   3 $CWCT-Y   FETCH PARAMS FOR COMMON     PMN64310
                          BSI   3 $HASH+9-Y RESTORE COMMON BELOW 4096   PMN64320
                          DC      *-*       RETURN FROM RESTORING COMMN PMN64330
                    LD250 LD    1 @CMON+2   FETCH WD CNT OF COMMON      PMN64340
                          STO   3 $COMN-Y                               PMN64350
                          LDD     GETCL                                 PMN64360
                          STD   3 $HASH-Y                               PMN64370
                          LDD     GETCL+2                               PMN64380
                          STD   3 $HASH+2-Y                             PMN64390
                          LDD     GETCL+4                               PMN64400
                          STD   3 $HASH+4-Y                             PMN64410
                          LDD     GETCL+6                               PMN64420
                          STD   3 $HASH+6-Y                             PMN64430
                          LDD     GETCL+8                               PMN64440
                          STD   3 $HASH+8-Y                             PMN64450
                          LDD     GETCL+10                              PMN64460
                          STD   3 $HASH+10-Y                            PMN64470
                          LDD     GETCL+12                              PMN64480
                          STD   3 $HASH+12-Y                            PMN64490
                          LDD     GETCL+14                              PMN64500
                          STD   3 $HASH+14-Y                            PMN64510
                          LDD     GETCL+16                              PMN64520
                          STD   3 $HASH+16-Y                            PMN64530
                          LDD     GETCL+18                              PMN64540
                          STD   3 $HASH+18-Y                            PMN64550
                          MDX     LD070     BR TO FETCH CORE LOAD       PMN64560
                    *                                                   PMN64570
                    LD400 BSC     -         BRANCH IF DISKN             PMN64580
                          MDX     LD500     *REQUESTED                  PMN64590
                    *                                                   PMN64600
                    * PREPARE TO FETCH DISKZ                            PMN64610
                    *                                                   PMN64620
                          LDD     LD930+2   DISKZ WD CNT, SCTR ADDR     PMN64630
                          LDX  L2 $ZEND-4   END OF DISKZ - 4 TO XR2     PMN64640
                          MDX     LD100                                 PMN64650
                    *                                                   PMN64660
                    * PREPARE TO FETCH DISKN                            PMN64670
                    *                                                   PMN64680
                    LD500 LDD     LD950+2   DISKN WD CNT, SCTR ADDR     PMN64690
                          LDX  L2 $NEND-4   END OF DISKN - 4 TO XR2     PMN64700
                          MDX     LD100                                 PMN64710
                          HDNG    CORE IMAGE LOADER, PHASE 2 (DISKR)    PMN64720
                          BSC  L  *-*       RETURN                      PMN64730
                    DR000 EQU     *-1       ENTRY POINT                 PMN64740
                          STS     DR219     SAVE STATUS            2-12 PMN64745
                          STX   1 DR217+1   SAVE XR1                    PMN64750
                          STX   2 DR217+3   SAVE XR2                    PMN64760
                          STX   0 DR010+1        SET UP THE INTERRUPT   PMN64770
                    DR010 LDX  L2 *-*            *ENTRY ADDRESS IN THE  PMN64780
                          MDX   2 DR150-DR010    *LEVEL 2 INTRRUPT      PMN64790
                          STX  L2 $IBT2          *BRANCH TABLE          PMN64800
                    *                                                   PMN64810
                    DR030 MDX  L  $DBSY,@TCNT TURN BUSY INDICATOR ON,   PMN64820
                          MDX     DR230     BR TO CONTINUE              PMN64830
                    DR060 BOSC L  *-*       BR TO SERVICE THE INTERRUPT PMN64840
                    *                                                   PMN64850
                    * START ALL DISK OPERATIONS                         PMN64860
                    *                                                   PMN64870
                    DR070 XIO     DR904     START AN OPERATION          PMN64880
                          WAIT              WAIT OUT THE INTERRUPT      PMN64890
                    *                                                   PMN64900
                    * ENTRY POINT FOR INTERRUPTS                        PMN64910
                    *                                                   PMN64920
                    DR150 DC      *-*       INTERRUPT ENTRY POINT       PMN64930
                          XIO     DR910     SENSE THE DSW               PMN64940
                          STO   3 $DDSW-Y   SAVE THE DSW                PMN64950
                          BOSC    -         SKIP IF ERROR BIT SET       PMN64960
                          MDX     DR060     BRANCH IF ERROR BIT NOT SET PMN64970
                    DR185 LDD     DR902     RESTORE WORD COUNT          PMN64980
                          STD   1 0         *AND SECTOR ADDRESS         PMN64990
                          MDX  L  $DBSY,-1  SKIP IF 17 RETRIES DONE 2-8 PMN65000
                          MDX     DR230     BRANCH IF LESS THAN 17  2-8 PMN65010
                    *                                                   PMN65020
                    * TRAP OUT TO POSTOPERATIVE TRAP                    PMN65030
                    *                                                   PMN65040
                          LDD     DR912     1+SCTR ADDR TO EXTENSION    PMN65050
                          LD      DR915                                 PMN65060
                    DR190 BSI   3 $PST2-Y   BR TO POSTOPERATIVE ER TRAP PMN65070
                          SRA     16        CLEAR                       PMN65080
                          STO   3 $CYLN-Y   *ARM POSTION                PMN65090
                          MDX     DR030     RETRY OPERATION             PMN65100
                    DR195 MDX     DR185     BR TO TRAP OUT              PMN65110
                    DR935 DC      /5000     NOT READY DISPLAY CODE 2-10 PMN65115
                    *                                                   PMN65120
                    * CONSTANTS AND WORK AREAS                          PMN65130
                    *                                                   PMN65140
                          BSS  E  0                                     PMN65150
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       PMN65160
                    DR900 DC      1    CONSTANT,READ-AFTER-SEEK WD CNT  PMN65170
                    DR901 DC      0    CURRENT ARM POSITION             PMN65180
                    DR902 DC      *-*  LAST TWO WORDS OF SECTOR         PMN65190
                          DC      *-*  *PREVIOUSLY READ                 PMN65200
                    DR904 DC      *-*  IOCC FOR OPERATION CURRENTLY     PMN65210
                          DC      *-*  *BEING PERFORMED                 PMN65220
                    DR906 DC      *-*  SAVE AREA FOR IOCC FOR           PMN65230
                    DR907 DC      *-*  *USER-REQUESTED OPERATION        PMN65240
                    DR908 DC      *-*  IOCC FOR READ                    PMN65250
                    DR909 DC      *-*  *AFTER SEEK                      PMN65260
                    DR910 DC      *-*  2ND WORD OF SEEK IOCC            PMN65270
                    DR911 DC      *-*  SENSE IOCC                       PMN65280
                    DR912 DC      *-*  INTERMEDIATE WORD COUNT          PMN65290
                    DR913 DC      *-*  ADDR OF NEXT SEQUENTIAL SECTOR   PMN65300
                    DR914 DC      /5002 WRITE SELECT/POWER UNSAFE INDR  PMN65310
                    DR915 DC      /5004 READ/SEEK ERROR INDICATOR       PMN65320
                    DR916 DC      -320 TO BE USED TO SIMULTANEOUSLY     PMN65330
                          DC      1    *DECR WD CNT, INCR SCTR ADDR     PMN65340
                    DR990 DC      *-*  CURRENT SECTOR NO.               PMN65350
                    DR925 DC      /0600 2ND WD OF READ IOCC W/O AREA CD PMN65360
                    DR930 DC      8    NO. SECTORS PER CYLINDER         PMN65370
                    DR940 DC      /0FF8 'AND' OUT DR CODE, SCTR ADDR    PMN65390
                    DR985 DC      321  NO. WORDS PER SECTOR (W/ ADDR)   PMN65400
                    DR950 DC      /0701 SENSE IOCC W/O AREA CODE        PMN65410
                    DR955 DC      /0007 'AND' OUT ALL BUT SCTR NO.      PMN65420
                    DR980 DC      /0400 2ND WD OF SEEK IOCC W/O AREA CD PMN65430
                    DR996 DC      /9300+$DCYL-Y FOR REST DR280      2-8 PMN65450
                    A     EQU     DR900                                 PMN65460
                    *                                                   PMN65470
                    *                                                   PMN65480
                    *                                                   PMN65490
                    DR210 SRA     16                                    PMN65500
                    *                                                   PMN65510
                          STO   3 $DBSY-Y   CLEAR BUSY INDICATOR        PMN65520
                    DR217 LDX  L1 *-*       RESTORE XR1                 PMN65530
                          LDX  L2 *-*       RESTORE XR2                 PMN65540
                    DR219 LDS     0         RESTORE STATUS         2-11 PMN65545
                          MDX     DR000-1   TO EXIT                     PMN65550
                    *                                                   PMN65560
                    * PREPARE TO TRAP OUT ON 'POWER UNSAFE' CONDITION   PMN65570
                    *                                                   PMN65580
                    DR215 LD      DR914                                 PMN65590
                          MDX     DR190     BR TO TPAP OUT              PMN65600
                    *                                                   PMN65610
                    * PREPARE TO TRAP OUT ON 'NOT READY' CONDITION      PMN65620
                    *                                                   PMN65630
                    DR220 LD      DR935     FETCH ERROR CODE            PMN65640
                          BSI   3 $PRET-Y   BR TO PREOPERATIVE ERR TRAP PMN65650
                          MDX     DR340     RETRY THE OPERATION         PMN65660
                    *                        5 INSTRUCTIONS REMOVED 2-2 PMN65670
                    DR230 LDX  L1 DZ000-2   ADDR I/O AREA TO XR1        PMN65680
                          LDD   1 0                                     PMN65690
                          STD     DR902     SAVE WORD COUNT, SCTR ADDR  PMN65700
                          STD     DR912                                 PMN65710
                    DR240 LDX   2 -3        INITIALIZE COUNTER FOR LOOP PMN65720
                          STX   1 DR906                                 PMN65730
                          LD    1 1         FETCH DESIRED SECTOR ADDR   PMN65740
                          AND     DR940     'AND' OUT SECTOR NO.        PMN65750
                    DR250 STO   1 1         *AND DRIVE CODE             PMN65760
                    DR280 S     3 $DCYL-Y   SUB DEFECTIVE CYLINDER ADDR PMN65770
                          BSC     Z+        SKIP IF BAD CYLINDER        PMN65780
                          MDX     DR300     BR TO CONTINUE PROCESSING   PMN65790
                          LD      DR280     POINT TO NEXT DEFECTIVE CYL PMN65800
                          A       DR900                                 PMN65810
                          STO     DR280                                 PMN65820
                          LD    1 1                                     PMN65830
                          A       DR930     INCREMENT SCTR ADD BY 8     PMN65840
                          MDX   2 1         SKIP AFTER 3RD PASS         PMN65850
                          MDX     DR250     COMPARE W/ NEXT DEF CYL ADR PMN65860
                          STO   1 1         CYL ADDR ADJ 3RD DEF CYL2-4 PMN65870
                    DR300 LD      DR996     RESTORE DR280           2-8 PMN65880
                          STO     DR280     *                       2-8 PMN65890
                    *                                                   PMN65900
                    * CONSTRUCT THE 2ND WORD OF ALL IOCC'S              PMN65910
                    *                                                   PMN65920
                          LDX  I2 $IBT2     LOAD XR2 WITH               PMN65930
                          MDX   2 DR900-DR150 *ADDR OF DR900            PMN65940
                          STX   2 DR908                                 PMN65950
                          LD      DR913     FETCH SECTOR ADDRESS        PMN65960
                          AND     DR955     'AND' OUT ALL BUT SECTOR NO PMN65970
                          STO     DR990     SAVE SECTOR NO.             PMN65980
                          LD    3 $ACDE-Y   FETCH AREA CODE             PMN65990
                          OR      DR980     'OR' IN SEEK FUNCTION CODE  PMN66000
                          STO     DR910     SEEK IOCC MINUS DIRECTION   PMN66010
                          OR      DR925     'OR' IN READ FUNCTION       PMN66020
                          STO     DR909     IOCC FOR READ AFTER SEEK    PMN66030
                          OR      DR990     'OR' IN SECTOR NO.          PMN66040
                          STO     DR907     2ND WORD OF READ IOCC       PMN66050
                          LD    3 $ACDE-Y                               PMN66060
                          OR      DR950     'OR' IN SENSE IOCC BITS     PMN66070
                          STO     DR911     COMPLETED SENSE IOCC        PMN66080
                          LDD     DR912     1+SCTR ADDR TO EXTENSION    PMN66090
                    DR340 XIO     DR910     SENSE FOR DISK READY        PMN66100
                          STO   3 $DDSW-Y   SAVE THE DSW                PMN66110
                          BSC     Z+        SKIP UNLESS POWER UNSAFE OR PMN66120
                          MDX     DR215     *WRITE SELECT, BR OTHERWISE PMN66130
                          SLA     2         BR TO PREOPERATIVE ERR TRAP PMN66140
                          BSC     Z+        *IF DISK NOT READY, SKIP    PMN66150
                          MDX     DR220     *OTHERWISE                  PMN66160
                    *                        3 INS  UCTIONS REMOVED 2-2 PMN66170
                          LD    1 1         FETCH DESIRED CYLINDER ADDR PMN66180
                          S     3 $CYLN-Y   SUBTRACT ARM POSITION       PMN66190
                          BSC     +-        SKIP IF SEEK NECESSARY      PMN66200
                          MDX     DR400     BRANCH TO PERFORM OPERATION PMN66210
                    *                                                   PMN66220
                    * SEEK                                              PMN66230
                    *                                                   PMN66240
                          SRT     19        PUT NO. CYLINDERS IN EXT    PMN66250
                          SRA     15        + OR - SIGN TO BIT 15       PMN66260
                          SLA     2         SHIFT SIGN TO BIT 13        PMN66270
                          OR      DR910     OR  IN REMAINDER OF IOCC    PMN66280
                          RTE     16                                    PMN66290
                          BSC     -         SKIP IF SEEK TOWARD HOME    PMN66300
                          MDX     DR380     BRANCH IF SEEK TOWARD CENTR PMN66310
                          EOR   3 $S910-Y   COMPLEMENT NO CYL TO BE2-10 PMN66320
                          A       DR900     *SOUGHT TO GET POSITIVE     PMN66330
                    DR380 STD     DR904                                 PMN66340
                    DR390 BSI   2 DR070-1-A START SEEK              2-2 PMN66350
                    *                                                   PMN66360
                    * SEEK COMPLETE INTERRUPT PROCESSING                PMN66370
                    *                                                   PMN66380
                          LDD     DR908        SET UP IOCC FOR          PMN66390
                          STD     DR904        *READ AFTER SEEK         PMN66400
                          BSI   2 DR070-1-A    START READ-AFTER-SEEK    PMN66410
                    *                                                   PMN66420
                    * READ-AFTER-SEEK COMPLETE INTERRUPT PROCESSING     PMN66430
                    *                                                   PMN66440
                          LD      DR901     FETCH ADR OF SCTR JUST READ PMN66450
                          STO   3 $CYLN-Y   UPDATE ARM POSITION         PMN66460
                          S     1 1         SUB DESIRED SCTR ADDR       PMN66470
                          BSC     Z         BR IF SEEK UNSUCCESSFUL,    PMN66480
                          MDX     DR195     *SKIP OTHERWISE             PMN66490
                    *                                                   PMN66500
                    *                                                   PMN66510
                    * READ                                              PMN66520
                    *                                                   PMN66530
                    DR400 LDD     DR912     FETCH INTERMEDIATE WD CNT   PMN66540
                          BSC     +         SKIP, WD CNT NOT EXHAUSTED  PMN66550
                    DR410 MDX     DR210     BRANCH IF READ/WRITE DONE   PMN66560
                          AD      DR916     DECREMENT WORD COUNT AND    PMN66570
                          STD     DR912     *INCREMENT SECTOR ADDRESS   PMN66580
                          BSC     Z-        SKIP IF THIS IS LAST SECTOR PMN66590
                          SRA     16        CLEAR ACCUMULATOR           PMN66600
                          A       DR985     ADD BACK 321 TO WORD CNT    PMN66610
                          STO   1 0         STORE RESULT IN I/O AREA    PMN66620
                          LDD   2 DR906-A   RESTORE IOCC FOR ORIGINAL   PMN66630
                          STD   2 DR904-A   *REQUESTED OPERATION        PMN66640
                          LD    1 1         ADD SECTOR NO. TO SECTOR    PMN66650
                          OR      DR990     *ADDRESS                    PMN66660
                          STO   1 1                                     PMN66670
                          BSI   2 DR070-1-A  START READ OPERATION       PMN66680
                    *                                                   PMN66690
                    * READ       COMPLETE INTERRUPT PROCESSING          PMN66700
                    *                                                   PMN66710
                          LDD   2 DR902-A   RESTORE LAST 2 WDS OF SEC   PMN66720
                          STD   1 0         *TOR PREVIOUSLY READ        PMN66730
                          LD    2 DR912-A   FETCH INTERMEDIATE WD CNT   PMN66740
                          BSC     +         SKIP IF MORE READING        PMN66750
                          MDX     DR410     BRANCH IF FINISHED          PMN66760
                          MDX  L1 320       POINT XR1 TO NEW I/O AREA   PMN66770
                          LDD   1 0         SAVE LAST 2 WDS OF SECTOR   PMN66780
                          STD   2 DR902-A   *JUST READ                  PMN66790
                          LDD   2 DR912-A   WD CNT,SCTR ADDR NEXT OP    PMN66800
                          STD   1 0         STORE BOTH IN NEW I/O AREA  PMN66810
                          MDX     DR240     BACK TO SET UP OPERATION    PMN66820
                    *                                                   PMN66830
                    *                                                   PMN66840
                          BSS     /01C1-*   PATCH AREA             2-10 PMN66850
                          DC      0         PATCH AREA                  PMN66860
                    LDEND EQU     *-1                                   PMN66870
                    RAREA BSS  E  @HEND-@XEQA+1 CI HEADER BUFFER        PMN66880
                          END     *                                     PMN66890
