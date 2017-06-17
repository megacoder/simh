                          HDNG    OVERLAY FROM DISK TO LOCAL/SOCAL AREA U5D00010
                    *************************************************** U5D00020
                    *                                                 * U5D00030
                    *   PROGRAM NAME- LOCAL/SOCAL FLIPPER             * U5D00040
                    *      CODE NAME- FLIPR                           * U5D00050
                    *   FUNCTION/OPERATION-                           * U5D00060
                    *      THIS PROGRAM IS INCLUDED IN A CORE LOAD    * U5D00070
                    *      IF ANY SUBROUTINES USED ARE LOCALS OR ARE  * U5D00080
                    *      IN SOCALS. FLIPPER IS USED TO READ THE     * U5D00090
                    *      OVERLAY FROM DISK INTO THE LOCAL/SOCAL AREA* U5D00100
                    *      IN CORE AT THE POINT IN EXECUTION WHEN THE * U5D00110
                    *      SUBROUTINE IS CALLED. IT THEN BRANCHES TO  * U5D00120
                    *      EXECUTE THE SUBROUTINE THAT HAS BEEN CALL- * U5D00130
                    *      ED. IN THE CASE OF A CALL SUBROUTINE,FLIPP-* U5D00140
                    *      ER SIMULATES A BSI FROM THE LOCATION WHER  * U5D00150
                    *      THE CALL WAS ACTUALLY MADE. BEFORE FETCHING* U5D00160
                    *      A SUBROUTINE,FLIPPER CHECKS TO SEE IF IT IS* U5D00170
                    *      ALREADY IN THE LOCAL/SOCAL AREA. IF SO,    * U5D00180
                    *      FLIPPER IMMEDIATELY BRANCHES TO THE SUB-   * U5D00190
                    *      ROUTINE.                                   * U5D00200
                    *   ENTRY POINTS-                                 * U5D00210
                    *      THIS PROGRAM HAS SIX ENTRY POINTS          * U5D00220
                    *      ***  FOR LIBF LOCALS.                      * U5D00230
                    *         INDEX REGISTER 2 IS SET TO THE ADDRESS  * U5D00240
                    *         OF THE FIRST PARAMETER IN THE CALLING   * U5D00250
                    *         SEQUENCE. THE CALLING SEQUENCE IS AS    * U5D00260
                    *         FOLLOWS--                               * U5D00270
                    *                   BSI  L  FL010                 * U5D00280
                    *                   DC      WORD COUNT            * U5D00290
                    *                   DC      SECTOR ADDRESS        * U5D00300
                    *                   DC      ENTRY POINT           * U5D00310
                    *      ***  FOR CALL LOCALS.                      * U5D00320
                    *         INDEX REGISTER TWO IS SET TO THE ADDRESS* U5D00330
                    *         OF THE FIRST PARAMETER IN THE CALLING   * U5D00340
                    *         SEQUENCE. THE CALLING SEQUENCE IS AS    * U5D00350
                    *         FOLLOWS--                               * U5D00360
                    *                   DC      *-*    LINK WORD      * U5D00370
                    *                   BSI  L  FL020                 * U5D00380
                    *                   DC      WORD COUNT            * U5D00390
                    *                   DC      SECTOR ADDRESS        * U5D00400
                    *                   DC      ENTRY POINT           * U5D00410
                    *      ***  FOR FUNCTION SUBROUTINES.             * U5D00420
                    *         INDEX REGISTER TWO IS SET TO ZERO AS    * U5D00430
                    *         AN INDICATOR THAT THIS ENTRY WAS USED.  * U5D00440
                    *         THIS SECTION IS ENTERED VIA A BSI TO    * U5D00450
                    *         FL200.                                  * U5D00460
                    *      *** FOR ARITHMETIC SUBROUTINES.            * U5D00470
                    *         INDEX REGISTER TWO IS SET TO ZERO AS AN * U5D00480
                    *         INDICATOR THAT THIS ENTRY WAS USED.     * U5D00490
                    *         THIS SECTION IS ENTERED VIA A BSI TO    * U5D00500
                    *         FL210.                                  * U5D00510
                    *      ***  FOR EVERYTHING IN THE FIO SOCAL       * U5D00520
                    *         INDEX REGISTER TWO IS SET TO 2 AS AN    * U5D00530
                    *         INDICATOR OF AN FIO SOCAL. THIS SECTION * U5D00540
                    *         IS ENTERED VIA A BSC TO FL220.          * U5D00550
                    *      ***  FOR EVERYTHING IN THE DISK FIO SOCAL. * U5D00560
                    *         INDEX REGISTER TWO IS SET TO 4 AS AN    * U5D00570
                    *         INDICATOR OF A DISK FIO SOCAL. THIS     * U5D00580
                    *         SECTION IS ENTERED VIA A BSC TO FL230.  * U5D00590
                    *   INPUT- SEE ENTRY POINT AND CALLING SEQUENCE   * U5D00600
                    *         INFORMATION.                            * U5D00610
                    *   OUTPUT- THE SUBROUTINE CALLED IS READ INTO    * U5D00620
                    *      THE OVERLAY AREA FROM DISK.                * U5D00630
                    *   EXTERNAL REFERENCES-                          * U5D00640
                    *      DZ000 -- ENTRY POINT FOR THE DISK I/O      * U5D00650
                    *               SUBROUTINE.                       * U5D00660
                    *      $WRD1 -- FIRST WORD OF CI HEADER           * U5D00670
                    *      $IOCT    IOCS COUNTER                      * U5D00680
                    *      $DBSY    DISK BUSY INDR                    * U5D00690
                    *      $LSAD    RELATIVE ADDR OF LOCAL SECTOR     * U5D00700
                    *   ERROR CONDITIONS- NONE RECOGNIZED             * U5D00710
                    *   NOTES- NONE                                   * U5D00720
                    *                                                 * U5D00730
                    *************************************************** U5D00740
                          HDNG    OVERLAY FROM DISK TO LOCAL/SOCAL AREA U5D00750
                          ENT     FLIPR                                 U5D00760
                    FL000 DC      *-*       CONTENTS OF ACCUMULATOR     U5D00770
                          DC      *-*       CONTENTS OF EXTENSION       U5D00780
                    *                                                   U5D00790
                    * ENTRY POINT FOR  LIBF LOCALS                      U5D00800
                    *                                                   U5D00810
                    FL010 EQU     *-1       ENTRY POINT FOR LIBF LOCALS U5D00820
                          STS     FL140     SAVE STATUS                 U5D00830
                          STX   2 FL130+1   SAVE XR2                    U5D00840
                          LDX  I2 FL010     ADDR OF PARAMETERS TO XR1   U5D00850
                          STD     FL000     SAVE ACCUMULATOR, EXTENSION U5D00860
                          LD    2 2         FETCH LOCAL EXECUTION ADDR  U5D00870
                          MDX     FL100                                 U5D00880
                    *                                                   U5D00890
                    * ENTRY POINT FOR CALL LOCALS                       U5D00900
                    *                                                   U5D00910
                    FL020 DC      *-*       ENTRY POINT FOR CALL LOCALS U5D00920
                          STS     FL140     SAVE STATUS                 U5D00930
                          STX   2 FL130+1   SAVE XR2                    U5D00940
                          LDX  I2 FL020                                 U5D00950
                          STD     FL000     SAVE ACCUMULATOR, EXTENSION U5D00960
                          LD      FL910     SET UP RETURN ADDR TO       U5D00970
                          STO     FL200     *RETURN TO FL050            U5D00980
                          MDX     FL110                                 U5D00990
                    FL050 LDX  I2 FL020     ADDR OF PARAMETERS TO XR2   U5D01000
                          LD    2 -3        SIMULATE A BSI TO THE SUB-  U5D01010
                          STO  I2 2         *ROUTINE WHICH WAS CALLED   U5D01020
                          LD    2 2         CONTINUE SIMULATION BY SET- U5D01030
                          A       FL920     *TING UP A BSC TO ENTRY+1   U5D01040
                    FL100 STO     FL200     STORE EXIT ADDR             U5D01050
                    FL110 LD    2 1         FETCH SCTR ADDR FROM LOCAR  U5D01060
                          A    L  $LSAD     ADJUST SCTR ADDR            U5D01070
                          S       FL998+1   BRANCH IF THE DESIRED LOCAL U5D01080
                          BSC  L  FL130,+-  *IS ALREADY IN CORE         U5D01090
                          A       FL998+1                               U5D01100
                          STO     FL998+1   *UA/FXA OR WORKING STORAGE  U5D01110
                          LD    2 0         STORE THE                   U5D01120
                          STO     FL998     *WORD COUNT                 U5D01130
                          LD      FL925     FETCH ADDR OF LOCAL AREA    U5D01140
                    FL115 MDX  L  $IOCT,0   WAIT OUT ANY PENDING INTER- U5D01150
                    FL120 MDX     *-3       *RUPTS BEFORE OVERLAYING    U5D01160
                    *                                                   U5D01170
                    * FETCH THE DESIRED LOCAL/SOCAL                     U5D01180
                    *                                                   U5D01190
                          SRT     16                                    U5D01200
                          BSI  L  DZ000     FETCH DESIRED LOCAL/SOCAL   U5D01210
                          MDX  L  $DBSY,0   LOOP UNTIL LOCAL/SOCAL HAS  U5D01220
                          MDX     *-3       *BEEN READ INTO CORE        U5D01230
                    FL130 LDX  L2 *-*       RESTORE XR2                 U5D01240
                    FL140 LDS     0         RESTORE STATUS              U5D01250
                          LDD     FL000     RESTORE ACCUMULATOR         U5D01260
                          BSC  L  *-*       EXIT FROM FLIPPER           U5D01270
                    *                                                   U5D01280
                    * ENTRY POINT FOR FUNCTION SUBROUTINES              U5D01290
                    *                                                   U5D01300
                    FL200 EQU     *-1                                   U5D01310
                          STX   2 FL130+1   SAVE XR2                    U5D01320
                          STD     FL000     SAVE ACCUMULATOR, EXTENSION U5D01330
                          MDX  L  FL200,-2                              U5D01340
                          LDX   2 0         ARITH/FUNC INDICATOR TO XR2 U5D01350
                          MDX     FL300     BR TO SAVE STATUS           U5D01360
                    *                                                   U5D01370
                    * ENTRY POINT FOR ARITHMETICS                       U5D01380
                    *                                                   U5D01390
                    FL210 STX   2 FL130+1   SAVE XR2                    U5D01400
                          LDX   2 0         ARITH/FUNC INDICATOR TO XR2 U5D01410
                          MDX     FL250     BR TO SAVE ACCUMULATOR,EXT  U5D01420
                    *                                                   U5D01430
                    * ENTRY POINT FOR EVERYTHING IN THE FIO SOCAL       U5D01440
                    *                                                   U5D01450
                    FL220 STX   2 FL130+1   SAVE XR2                    U5D01460
                          LDX   2 2         FIO INDICATOR TO XR2        U5D01470
                          MDX     FL250     BR TO SAVE ACCUMULATOR,EXT  U5D01480
                    *                                                   U5D01490
                    * ENTRY POINT FOR EVERYTHING IN THE DISK FIO SOCAL  U5D01500
                    *                                                   U5D01510
                    FL230 STX   2 FL130+1   SAVE XR2                    U5D01520
                          LDX   2 4         DISK FIO INDICATOR TO XR2   U5D01530
                    FL250 STD     FL000     SAVE ACCUMULATOR, EXTENSION U5D01540
                          LD   L2 FL380     PREPARE TO RETURN TO 3RD WD U5D01550
                          STO     FL200     *OF DUMMY SOCAL ENTRY IN TV U5D01560
                    FL300 STS     FL140     SAVE STATUS                 U5D01570
                          LDD  L2 FL900     FETCH SCTR ADDR,WD CNT      U5D01580
                          A    L  $LSAD     *OF DESIRED SOCAL AND       U5D01590
                          RTE     16        *ADJUST IT TO UA/FXA OR WS  U5D01600
                          STD  L  *-*       STORE PARAMS IN SOCAL AREA  U5D01610
                    FL350 EQU     *-1       CORE ADDR OF THE SOCAL AREA U5D01620
                          LD      FL915     PUT MDX TO *-9 (*-12 IF ALL U5D01630
                          STO  L  *-*       *3 SOCALS USED) IN 3RD WD   U5D01640
                    FL380 EQU     *-1                                   U5D01650
                          STO  L  *-*       *OF DUMMY ARITH,FIO ENTRIES U5D01660
                          STO  L  *-*       *ALSO DKFIO IF IT IS USED   U5D01670
                          LD      FL120     PUT MDX TO *-3 IN 3RD WD OF U5D01680
                          STO  I2 FL380     *DUMMY TV ENT FOR THIS SOCL U5D01690
                          LD      FL350     FETCH ADDR OF SOCAL AREA    U5D01700
                          MDX     FL115     *AND BR TO FETCH THE SOCAL  U5D01710
                    *                                                   U5D01720
                    * CONSTANTS AND WORK AREAS                          U5D01730
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       U5D01740
                    *                                                   U5D01750
                    * THE 6 WORDS STARTING AT FL900 CONTAIN THE SCTR    U5D01760
                    * ADDRESS AND WORD COUNT FOR EACH OF THE SOCALS.    U5D01770
                    *                                                   U5D01780
                    FL900 BSS  E  6    WD CNT, SCTR ADDR FOR ALL SOCALS U5D01790
                    *                                                   U5D01800
                    * FL120 AND FL915 ARE STORED IN THE 3RD WORD OF THE U5D01810
                    * DUMMY TV ENTRIES FOR SOCALS, FL120 IN THE TV ENT- U5D01820
                    * -RY OF THE SOCAL IN THE SOCAL AREA, FL915 IN THE  U5D01830
                    * OTHER ENTRY(IES). IF OPTION 1 IS EMPLOYED, FL915  U5D01840
                    * IS AN MDX TO *-9. IF OPTION 2 IS EMPLOYED, IT IS  U5D01850
                    * AN MDX TO *-12.                                   U5D01860
                    *                                                   U5D01870
                    FL910 DC      FL050                                 U5D01880
                    FL915 BSS     1    MDX *-9 OR MDX *-12              U5D01890
                    FL920 DC      1                                     U5D01900
                    FL925 DC      FL998 ADDR OF LOCAL OVERLAY AREA      U5D01910
                    *                                                   U5D01920
                    * THE LOCAL OVERLAY AREA, INCLUDING THE WORD        U5D01930
                    * COUNT AND SECTOR ADDRESS                          U5D01940
                    *                                                   U5D01950
                          BSS  E  0                                     U5D01960
                    FL998 DC      *-*  WORD COUNT OF LOCAL              U5D01970
                          DC      *-*  SCTR ADDR OF LOCAL               U5D01980
                    *                                                   U5D01990
                    *                                                   U5D02000
                    *                                                   U5D02010
                    FLIPR EQU     FL000                                 U5D02020
                    DZ000 EQU     /F2  ENTRY POINT FOR DISK I/O ROUTINE U5D02030
                    $WRD1 EQU     /7B  ADDR OF 1ST WD OF CI HEADER      U5D02040
                    $IOCT EQU     50   IOCS COUNTER                     U5D02050
                    $DBSY EQU     /EE  DISK BUSY INDICATOR              U5D02060
                    $LSAD EQU     /75  RELATIVE ADDR OF LOCAL SCTR ADDR U5D02070
                          END                                           U5D02080
