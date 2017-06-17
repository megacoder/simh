                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2700010
                    *************************************************** K2700020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * K2700030
                    *                                                 * K2700040
                    *FUNCTION/OPERATION                               * K2700050
                    *    * NORMAL- NO ERRORS-                         * K2700060
                    *      * UPDATE DCOM ON SYSTEM DRIVE              * K2700070
                    *      * UPDATE DCOM ON WS DRIVE IF WS IS NOT ON  * K2700080
                    *        THE SYSTEM DRIVE                         * K2700090
                    *      * PRINT REL ENTRY POINT ADDR IF SUBPROGRAM * K2700100
                    *      * PRINT .END OF COMPILATION.               * K2700110
                    *      * CALL $EXIT                               * K2700120
                    *   * NORMAL- WITH ERRORS                         * K2700130
                    *      * SET $NDUP AND $NXEQ NON-ZERO             * K2700140
                    *      * PRINT C97 ERROR IF REQUESTED          2-11 K2700142
                    *      * PRINT C 99 ERROR IF REQUESTED            * K2700150
                    *      * PRINT .COMPILATION DISCONTINUED.         * K2700160
                    *      * CALL $EXIT                               * K2700170
                    *   * WORKING STORAGE EXCEEDED                    * K2700180
                    *      * PRINT .C 96 WORKING STORAGE EXCEEDED.    * K2700190
                    *      * SET $NDUP AND $NXEQ NON-ZERO             * K2700200
                    *      * PRINT .COMPILATION DISCONTINUED.         * K2700210
                    *      * CALL $EXIT                               * K2700220
                    *   * // CONTROL CARD ENCOUNTERED ON INPUT        * K2700230
                    *      * SET $NDUP AND $NXEQ NON-ZERO             * K2700240
                    *      * PRINT .COMPILATION DISCONTINUED.         * K2700250
                    *      * MOVE CONTROL RECORD TO SUPERVISOR        * K2700260
                    *        INPUT BUFFER                             * K2700270
                    *      * CALL EXIT                                * K2700280
                    *                                                 * K2700290
                    *ENTRY POINTS-                                    * K2700300
                    *   * RC000-ENTERED FROM THE ROL SUBROUTINE BY    * K2700310
                    *     A CALL FROM A PREVIOUS PHASE.               * K2700320
                    *                                                 * K2700330
                    *INPUT-                                           * K2700340
                    *   * FCOM                                        * K2700350
                    *                                                 * K2700360
                    *OUTPUT-                                          * K2700370
                    *   * MESSAGES ON THE SYSTEM PRINT DEVICE         * K2700380
                    *                                                 * K2700390
                    *EXTERNAL REFERENCES-                             * K2700400
                    *   SUBROUTINES-                                  * K2700410
                    *      * SYSTEM PRINT SUBR (PHASE ID /99)         * K2700420
                    *      * DZ000                                    * K2700430
                    *   COMMA/DCOM                                    * K2700440
                    *      * $CH12                                    * K2700450
                    *      * $NDUP                                    * K2700460
                    *      * $NXEQ                                    * K2700470
                    *      * $PBSY                                    * K2700480
                    *      * $PHSE                                    * K2700490
                    *      * $WSDR                                    * K2700500
                    *      * $EXIT                                    * K2700510
                    *      * $FPAD                                    * K2700520
                    *      * $DBSY                                    * K2700530
                    *      * #DCOM                                    * K2700540
                    *      * #DBCT                                    * K2700550
                    *      * #ENTY                                    * K2700560
                    *      * #FMAT                                    * K2700570
                    *      * #WSCT                                    * K2700580
                    *   FCOM                                          * K2700590
                    *      * ORG                                      * K2700600
                    *      * EOFS                                     * K2700610
                    *      * SOFST                                    * K2700620
                    *      * COMON                                    * K2700630
                    *      * ERROR                                    * K2700640
                    *      * SORF                                     * K2700650
                    *                                                 * K2700660
                    *TABLES/WORK AREAS                                * K2700670
                    *      * FCOM                                     * K2700680
                    *      * OVERD                                    * K2700690
                    *      * SBUFX                                    * K2700700
                    *                                                 * K2700710
                    *ATTRIBUTES-                                      * K2700720
                    *      NONE                                       * K2700730
                    *                                                 * K2700740
                    *NOTES- N/A                                       * K2700750
                    *************************************************** K2700760
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2700770
                          ABS                                           K2700780
                    *                                                   K2700790
                    *             SYSTEM EQUATES                        K2700800
                    *                                                   K2700810
                    *                                                   K2700820
                    *             COMMA                                 K2700830
                    *                                                   K2700840
                    $CH12 EQU     /06   NON-ZERO WHEN CHANNEL 12 SENSED K2700850
                    $NDUP EQU     /34   DO NOT DUP IF NON-ZERO          K2700860
                    $NXEQ EQU     /35   DO NOT EXECUTE IF NON-ZERO      K2700870
                    $PBSY EQU     /36   NON-ZERO WHEN PRINTER BUSY      K2700880
                    $PHSE EQU     /78   NO. OF PHASE NOW IN CORE        K2700890
                    $WSDR EQU     /7A   WORKING STORAGE DRIVE NO.       K2700900
                    $EXIT EQU     /38   CALL EXIT ENTRY POINT           K2700910
                    $FPAD EQU     /95   TABLE OF FILE PROTECT ADDRESSES K2700920
                    $DBSY EQU     /EE   NON-ZERO WHEN DISKZ BUSY        K2700930
                    DZ000 EQU     /F2   DISKZ ENTRY POINT               K2700940
                    *                                                   K2700950
                    *                                                   K2700960
                    #DCOM EQU     1          DCOM SECTOR ADDRESS        K2700970
                    *                                                   K2700980
                    *                                                   K2700990
                    *                                                   K2701000
                    *                                                   K2701010
                    *             ADDRESSES RELATIVE TO THE START OF    K2701020
                    *             DCOM                                  K2701030
                    *                                                   K2701040
                    #DBCT EQU     6     BLOCK COUNT OF PROG/CORE LOAD   K2701050
                    #ENTY EQU     16    RLTV ENTRY ADDR OF PROGRAM      K2701060
                    #FMAT EQU     70    FORMAT OF PROG IN WS, DRIVE 0   K2701070
                    *             71    FORMAT OF PROG IN WS, DRIVE 1   K2701080
                    *             72    FORMAT OF PROG IN WS, DRIVE 2   K2701090
                    *             73    FORMAT OF PROG IN WS, DRIVE 3   K2701100
                    *             74    FORMAT OF PROG IN WS, DRIVE 4   K2701110
                    #WSCT EQU     85    BLK CNT OF PROG IN WS, DRIVE 0  K2701120
                    *             86    BLK CNT OF PROG IN WS, DRIVE 1  K2701130
                    *             87    BLK CNT OF PROG IN WS, DRIVE 2  K2701140
                    *             88    BLK CNT OF PROG IN WS, DRIVE 3  K2701150
                    *             89    BLK CNT OF PROG IN WS, DRIVE 4  K2701160
                    *                                                   K2701170
                    *                                                   K2701180
                    MEMRY EQU     /8000 MAXIMUM CORE SIZE               K2701190
                    *                                                   K2701200
                    SBUFX EQU     /FB0       SUPERVISOR INPUT BUFFER    K2701210
                    *                                                   K2701220
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2701230
                    *                                                   K2701240
                    *             RECOVERY PHASE EQUATES                K2701250
                    *                                                   K2701260
                    OVERZ EQU     MEMRY-2450 PHASE ORIGIN               K2701270
                    OVERL EQU     MEMRY-1501 FCOM ORIGIN            2-4 K2701280
                    RL000 EQU     MEMRY-68   ENTRY INTERPHASE ROLL SUBR K2701290
                    HEAD  EQU     RL000-49   PAGE HEADER STORAGE AREA   K2701300
                    OVERP EQU     HEAD-327-2 SYSTEM PRINT SUBR AREA     K2701310
                    OVERD EQU     OVERZ-322  DCOM READ AREA             K2701320
                    *                                                   K2701330
                    *                                                   K2701340
                    *             FCOM                                  K2701350
                    *                                                   K2701360
                    ORG   EQU     OVERL      RECOVERY FUNCTION CODE     K2701370
                    *                        = 0 - NORMAL               K2701380
                    *                        = 1 - WRK STG EXCEEDED     K2701390
                    *                        = 2 - // CTL RCD TRAPPED   K2701400
                    *                                                   K2701410
                    EOFS  EQU     OVERL+2    BUFFER ADDR (FROM INPUT)   K2701420
                    SOFST EQU     OVERL+3    DB CNT FROM OUTPUT PHASE   K2701430
                    COMON EQU     OVERL+8    RELATIVE ENTRY POINT       K2701440
                    ERROR EQU     OVERL+10   ERROR INDICATOR            K2701450
                    *         BIT 15 - OVERLAP PRIOR TO PHASE 20    2-4 K2701460
                    *         BIT 14 - NORMAL COMPILATION ERRORS    2-4 K2701470
                    *         BIT 13 - SUBIN TOO LARGE              2-4 K2701480
                    *         BIT 12 - CORE REQUIREMENTS EXCESSIVE  2-4 K2701490
                    *         BIT 11 - ORIGIN IN SUBPROGRAM         2-4 K2701500
                    *         BIT 10 - OVERLAP IN PHASE 21          2-4 K2701510
                    *         BIT  9 - INVALID ORIGIN               2-4 K2701520
                    *        BIT  8 - S/T EXCEEDS MAX LIMIT        2-11 K2701522
                    *                                                   K2701530
                    SORF  EQU     OVERL+13   SUBROUTINE OR FUNCTION IND K2701540
                    *                                                   K2701550
                    *                                                   K2701560
                    PHID  EQU     57         PHASE ID                   K2701570
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2701580
                    *                                                   K2701590
                    *             MAINLINE ROUTINE                      K2701600
                    *                                                   K2701610
                          ORG     OVERZ      RECOVERY PHASE ORIGIN      K2701620
                    *                                                   K2701630
                          DC      0          WORK AREA FOR LOADER       K2701640
                          DC      -57        -ID COMPILER PHASE 27      K2701650
                          DC      RC004-*+1  RLTV ADDR SLET ENTRY STG   K2701660
                          DC      1          NO. OF ENTS TO BE STORED   K2701670
                          ORG     *-2                                   K2701680
                    *                                                   K2701690
                    *                                                   K2701700
                    RC000 LDX   1 PHID       LOAD PHASE ID              K2701710
                          STX  L1 $PHSE      STORE INTO PHASE           K2701720
                    *                                                   K2701730
                    *                                                   K2701740
                    *                                                   K2701750
                    *             BEGINNING OF RECOVERY PHASE           K2701760
                    *                                                   K2701770
                    *             LOAD SYSTEM PRINT SUBROUTINE          K2701780
                    *                                                   K2701790
                          LDD     RC004+2    LD DISK ADDR OF PRINT SUBR K2701800
                          STD  L  OVERP      STORE IN PRINT SUBR AREA   K2701810
                    *                                                   K2701820
                          LDD     RC006      LOAD DISK CTL FOR SUBR LD  K2701830
                          BSI  L  DZ000      LOAD PRINT SUBR            K2701840
                    *                                                   K2701850
                          MDX  L  $DBSY,0    SKIP IF DISK FREE          K2701860
                          MDX     *-3        LOOP IF DISK BUSY          K2701870
                    *                                                   K2701880
                    *                                                   K2701890
                    *             DETERMINE TYPE OF ENTRY               K2701900
                    *                                                   K2701910
                          LDX  I1 ORG        GET RECOVERY FUNC CODE     K2701920
                          BSC  I1 RC001      GO TO APPROPRIATE ROUTINE  K2701930
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2701940
                    *                                                   K2701950
                    *             RECOVERY ENTRY LIST                   K2701960
                    *                                                   K2701970
                    RC001 DC      RC100      NORMAL ENTRY               K2701980
                          DC      RC500      WORK AREA EXCEEDED         K2701990
                          DC      RC600      CTL RECORD TRAPPED         K2702000
                    *                                                   K2702010
                          BSS  E  0          SLET STORAGE AREA          K2702020
                    RC004 DC      153        ID PRINCIPAL PRINT SUBR    K2702030
                          DC      *-*        NOT USED                   K2702040
                          DC      *-*        WORD COUNT                 K2702050
                          DC      *-*        SECTOR ADDRESS             K2702060
                    *                                                   K2702070
                    RC006 DC      /7000      DISK CONTROL FOR READ      K2702080
                          DC      OVERP      SYSTEM PRINT SUBR AREA     K2702090
                    *                                                   K2702100
                    RC008 DC      /7000      DISK CONTROL FOR READ      K2702110
                          DC      OVERD      DCOM READ AREA             K2702120
                    *                                                   K2702130
                    RC010 DC      320        WORD COUNT FOR DCOM READ   K2702140
                          DC      #DCOM      SCTR ADDR OF DCOM          K2702150
                    *                                                   K2702160
                    RC011 DC      34         WD CNT DR DEPENDENT PARAM  K2702170
                          DC      #DCOM      SCTR ADDR OF DCOM          K2702180
                    *                                                   K2702190
                    RC012 DC      /7001      DISK CONTROL FOR WRITE     K2702200
                          DC      OVERD      DCOM READ AREA             K2702210
                    *                                                   K2702220
                    *                                                   K2702230
                    RC015 DC      /F000      MASK FOR DISK ADDRESSES    K2702240
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2702250
                    *                                                   K2702260
                    *             NORMAL RECOVERY ENTRY                 K2702270
                    *             ERRORS POSSIBLE                       K2702280
                    *                                                   K2702290
                    RC100 LD   L  ERROR      CHECK IF ERRORS DETECTED   K2702300
                          BSC  L  RC300,Z    BRANCH IF YES          2-4 K2702310
                    *                                                   K2702320
                    *                                                   K2702330
                    *             READ  DCOM                            K2702340
                    *                                                   K2702350
                    RC110 LDD     RC010      SET UP DISK ADDR FOR       K2702360
                          STD  L  OVERD      DCOM READ                  K2702370
                    *                                                   K2702380
                          LDD     RC008      LOAD DISK READ PARAMETERS  K2702390
                          BSI  L  DZ000      READ DCOM                  K2702400
                    *                                                   K2702410
                          MDX  L  $DBSY,0    SKIP IF DISK READY         K2702420
                          MDX     *-3        LOOP IF DISK BUSY          K2702430
                    *                                                   K2702440
                          LDX  L1 OVERD+2    POINT TO DCOM AREA         K2702450
                    *                                                   K2702460
                          LD   L  SOFST      LOAD BLOCK COUNT OF PROG   K2702470
                          STO   1 #DBCT      STORE INTO BLOCK COUNT     K2702480
                          LD   L  COMON                                 K2702490
                          STO   1 #ENTY      STORE RELATIVE ENTRY POINT K2702500
                    *                                                   K2702510
                          MDX  I1 $WSDR      ADJUST FOR WS DRIVE NO.    K2702520
                    *                                                   K2702530
                          SLA     16                                    K2702540
                          STO   1 #FMAT      ZERO FORMAT                K2702550
                    *                                                   K2702560
                          LD   L  SOFST      LOAD BLOCK COUNT           K2702570
                          STO   1 #WSCT      STORE IN WS BLOCK COUNT    K2702580
                    *                                                   K2702590
                    *                                                   K2702600
                    *             RESTORE DCOM                          K2702610
                    *                                                   K2702620
                    RC120 LDD     RC012      LOAD DISK WRITE PARAMETERS K2702630
                          BSI  L  DZ000      WRITE DCOM TO PACK         K2702640
                    *                                                   K2702650
                          MDX  L  $DBSY,0    SKIP IF DISK READY         K2702660
                          MDX     *-3        LOOP IF DISK BUSY          K2702670
                    *                                                   K2702680
                    *                                                   K2702690
                    *             CHECK IF WS IS ON DRIVE 0             K2702700
                    *                                                   K2702710
                          LDX  I1 $WSDR      WORKING STORAGE DRIVE NO   K2702720
                          LD   L1 $FPAD      LOAD WORKING STORAGE ADDR  K2702730
                          AND     RC015      MASK OUT SECTOR ADDR       K2702740
                          BSC  L  RC160,+-   BRANCH IF ZERO             K2702750
                    *                                                   K2702760
                    *                                                   K2702770
                    *             UPDATE DCOM ON NON-SYSTEM PACK        K2702780
                    *                                                   K2702790
                          OR      RC011+1    UPDATE DISK ADDRESS FOR    K2702800
                          STO     RC011+1    *NON-SYSTEM DCOM RD/WRT    K2702810
                    *                                                   K2702820
                          LDD     RC011                                 K2702830
                          STD  L  OVERD      STORE DK ADDR IN RD AREA   K2702840
                    *                                                   K2702850
                          LDD     RC008      LD DISK RD PARAMETERS      K2702860
                          BSI  L  DZ000      READ DCOM FROM NON-SYS DR  K2702870
                    *                                                   K2702880
                          MDX  L  $DBSY,0    SKIP IF DISK READY         K2702890
                          MDX     *-3        LOOP IF DISK BUSY          K2702900
                    *                                                   K2702910
                          LD      RC010      SET UP TO RESTORE DCOM     K2702920
                          STO  L  OVERD      *TO NON-SYSTEM DRIVE       K2702930
                    *                                                   K2702940
                          SLA     16                                    K2702950
                          STO     RC015      ZERO MASK AS A SWITCH      K2702960
                          MDX     RC120      UPDATE NON-SYSTEM DCOM     K2702970
                    *                                                   K2702980
                    *             PRINT THE RELATIVE ENTRY POINT    2-8 K2702990
                    *             ADDRESS IF COMPILING A SUBPROGRAM 2-8 K2703000
                    *                                                   K2703010
                    *                                                   K2703020
                    RC130 DC      *-*        LINK                   2-8 K2703030
                          SLA     16         ZERO ACCUMULATOR       2-8 K2703040
                          SLT     4          SHIFT IN ONE HEX DIGIT 2-8 K2703050
                          S       RC856      COMPARE WITH NINE      2-8 K2703060
                          BSC  L  RC140,Z-   BRANCH IF GREATER      2-8 K2703070
                          A       RC856      RESTORE DIGIT          2-8 K2703080
                          OR      RC858      MAKE IT EBC NUMERIC    2-8 K2703090
                          MDX     RC150      SKIP ONE INSTRUCTION   2-8 K2703100
                    RC140 OR      RC860      MAKE IT EBC ALPHABETIC 2-8 K2703110
                    RC150 BSC  I  RC130      RETURN                 2-8 K2703120
                    *                                                   K2703130
                    *                                                   K2703140
                    RC160 LD   L  SORF       IS THIS A SUBPROGRAM   2-8 K2703150
                          BSC  L  RC200,+-   BRANCH IF NO           2-8 K2703160
                          LDX   1 -2         SET UP COUNTER         2-8 K2703170
                          LD   L  COMON      PUT REL ENTRY POINT    2-8 K2703180
                          SRT     16         *ADDRESS IN EXTENSION  2-8 K2703190
                    RC170 BSI     RC130      CONVERT ONE DIGIT      2-8 K2703200
                          SLA     8          SHIFT LEFT             2-8 K2703210
                          STO  L1 RC907+2    STORE TEMPORARY        2-8 K2703220
                          BSI     RC130      CONVERT ONE DIGIT      2-8 K2703230
                          OR   L1 RC907+2    COMBINE WITH LAST ONE  2-8 K2703240
                          STO  L1 RC907+2    STORE IN OUTPUT AREA   2-8 K2703250
                          MDX   1 1          INCREMENT COUNTER      2-8 K2703260
                          MDX     RC170      BR IF NOT FINISHED     2-8 K2703270
                    *                                                   K2703280
                    *                                                   K2703290
                          LDX  L1 RC906      SET UP AND PRINT REL   2-8 K2703300
                          BSI     RC700      *ENTRY POINT ADDRESS   2-8 K2703310
                    *                                                   K2703320
                          LD      RC850      SPACE THE PRINTER      2-8 K2703330
                          BSI  L  OVERP+3    *ONE LINE              2-8 K2703340
                    *                                                   K2703350
                    *                                                   K2703360
                    *             COMPLETE NORMAL RECOVERY              K2703370
                    *                                                   K2703380
                    RC200 LDX  L1 RC901      SET UP TO PRINT ECOM MSG   K2703390
                    *                                                   K2703400
                    RC210 BSI     RC700      PRINT MESSAGE              K2703410
                    *                                                   K2703420
                          LDX     $EXIT      CALL EXIT                  K2703430
                    *                                                   K2703440
                    RC300 EQU     *          NORMAL ERROR ENTRY         K2703450
                    *                                                   K2703460
                          SLA     8         IS IT ERROR 97         2-11 K2703461
                          BSC  L  RC350,-   NO - CHECK FOR ERROR 862-11 K2703462
                          LDX  L1 RC908     LOAD WORD COUNT         212 K2703463
                          MDX     RC505     GO PRINT ERROR MESSAGE 2-11 K2703464
                    RC350 SLA     1         IS IT ERROR 86         2-11 K2703470
                          BSC  L  RC400,+Z   YES - BRANCH           2-4 K2703480
                          SLA     3          IS IT ERROR 99         2-4 K2703490
                          BSC  L  RC600,-   NO - BRANCH            2-11 K2703500
                          LDX  L1 RC905      SET UP FOR CRE MESS    2-2 K2703510
                          MDX     RC505      GO PRINT AND EXIT      2-2 K2703520
                    *                                                   K2703530
                    RC400 LDX  L1 RC904      SET UP FOR ERROR 86    2-4 K2703540
                          MDX     RC505      GO PRINT AND EXIT      2-4 K2703550
                    *                                                   K2703560
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2703570
                    *                                                   K2703580
                    *                                                   K2703590
                    *             ENTRY IF WORK AREA EXCEEDED           K2703600
                    *                                                   K2703610
                    *                                                   K2703620
                    RC500 EQU     *          WORK AREA EXCEEDED         K2703630
                    *                                                   K2703640
                          LDX  L1 RC902      SET UP TO PRINT WSE MSG    K2703650
                    RC505 BSI     RC700      PRINT MESSAGE              K2703660
                    *                                                   K2703670
                          LD      RC850      SKIP ONE               2-4 K2703680
                          BSI  L  OVERP+3    LINE                   2-4 K2703690
                    *                                                   K2703700
                    *                                             2-11* K2703710
                    *        4 INSTRUCTIONS REMOVED 2-11          2-11* K2703720
                    *                                             2-11* K2703730
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2703770
                    *                                                   K2703780
                    *                                                   K2703790
                    *             ENTRY IF // CONTROL CARD ENCOUNTERED  K2703800
                    *                                                   K2703810
                    *                                                   K2703820
                    RC600 EQU     *          CTL RECORD TRAPPED         K2703830
                    *                                                   K2703840
                          STX  L  $NDUP      SET FOR NO DUP FUNCTIONS   K2703850
                          STX  L  $NXEQ      SET FOR NO EXECUTE         K2703860
                    *                                                   K2703870
                          LDX  L1 RC903                                 K2703880
                          BSI     RC700      PRINT COMP DISC MESSAGE    K2703890
                    *                                                   K2703900
                    *             MOVE TRAPPED CONTROL RECORD TO        K2703910
                    *             SUPERVISOR INPUT BUFFER.              K2703920
                    *                                                   K2703930
                          LDX   1 80         SET BUFFER LENGTH          K2703940
                          LD   L  EOFS       GET BUFFER ADDRESS         K2703950
                          STO     *+1        SET UP CTL CARD MOVE       K2703960
                    RC610 LD   L1 *-*        MOVE CTL CD TO SUPERVISOR  K2703970
                          STO  L1 SBUFX-1    BUFFER IN UNPACKED FORM    K2703980
                          MDX   1 -1                                    K2703990
                          MDX     RC610                                 K2704000
                    *                                                   K2704010
                          LDX     $EXIT      CALL EXIT                  K2704020
                    *                                                   K2704030
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2704040
                    *                                                   K2704050
                    *                                                   K2704060
                    *                                                   K2704070
                    *             PRINT CONTROL ROUTINE                 K2704080
                    *                                                   K2704090
                    RC700 DC      *-*        LINK                       K2704100
                    *                                                   K2704110
                          LD   I  $CH12      LOAD CHANNEL 12 SWITCH     K2704120
                          BSC  L  RC710,+-   BRANCH IF NOT ON           K2704130
                    *                                                   K2704140
                          LDD     RC852                                 K2704150
                          BSI  L  OVERP+3    RESTORE PAGE               K2704160
                    *                                                   K2704170
                          BSI  L  OVERP+3    PRINT HEADER               K2704180
                    *                                                   K2704190
                          LD      RC850      LOAD SPACE PARAMETER       K2704200
                          BSI  L  OVERP+3    SPACE PRINTER              K2704210
                    *                                                   K2704220
                    *                                                   K2704230
                    RC710 STX   1 RC854+1    STORE MESSAGE ADDRESS      K2704240
                    *                                                   K2704250
                          LDD     RC854      LOAD PRINT PARAMETER       K2704260
                          BSI  L  OVERP+3    PRINT MESSAGE              K2704270
                    *                                                   K2704280
                          MDX  L  $PBSY,0    SKIP IF PRINTER READY      K2704290
                          MDX     *-3        LOOP IF PRINTER BUSY       K2704300
                    *                                                   K2704310
                          BSC  I  RC700      RETURN                     K2704320
                          HDNG    1130 FORTRAN COMPILER RECOVERY PHASE  K2704330
                    *                                                   K2704340
                    *             CONSTANTS AND MESSAGES                K2704350
                    *                                                   K2704360
                    *                                                   K2704370
                    RC850 DC      /7002      SPACE PARAMETER            K2704380
                    *                                                   K2704390
                          BSS  E  0                                     K2704400
                    RC852 DC      /7000      PAGE RESTORE PARAMETER     K2704410
                          DC      HEAD       PAGE HEADER ADDRESS        K2704420
                    *                                                   K2704430
                    RC854 DC      /7001      PRINT PARAMETER            K2704440
                          DC      *-*        MESSAGE ADDRESS            K2704450
                    *                                                   K2704460
                    RC856 DC      9          CONSTANT NINE          2-8 K2704470
                    RC858 DC      /F0        MASK FOR EBC NUMERIC   2-8 K2704480
                    RC860 DC      /C0        MASK FOR EBC ALPHABET  2-8 K2704490
                    *                                                   K2704500
                    *                                                   K2704510
                    *             PRINT MESSAGES                        K2704520
                    *                                                   K2704530
                    RC901 DC      RC902-RC901-1   WORD COUNT            K2704540
                    *                                                   K2704550
                          EBC     .END OF COMPILATION.                  K2704560
                    *                                                   K2704570
                    *                                                   K2704580
                    RC902 DC      RC903-RC902-1   WORD COUNT            K2704590
                    *                                                   K2704600
                          EBC     . C 96 WORKING STORAGE EXCEEDED.  2-4 K2704610
                    *                                                   K2704620
                    *                                                   K2704630
                    RC903 DC      RC904-RC903-1   WORD COUNT            K2704640
                    *                                                   K2704650
                          EBC     .COMPILATION DISCONTINUED.            K2704660
                    *                                                   K2704670
                    *                                                   K2704680
                    RC904 DC      RC905-RC904-1  WORD COUNT         2-4 K2704690
                    *                                                   K2704700
                          EBC     . C 86 INVALID ORIGIN.            2-4 K2704710
                    *                                                   K2704720
                    *                                                   K2704730
                    RC905 DC      RC906-RC905-1  WORD COUNT             K2704740
                    *                                                   K2704750
                          EBC     . C 99 CORE REQUIREMENTS .        2-4 K2704760
                          EBC     .EXCESSIVE .                      2-4 K2704770
                    *                                                   K2704780
                    *                                                   K2704790
                    RC906 DC      RC908-RC906-1  WORD COUNT         2-8 K2704800
                    *                                                   K2704810
                          EBC     .RELATIVE ENTRY POINT ADDRESS IS . -8 K2704820
                    RC907 EBC     .     (HEX).                      2-8 K2704830
                    *                                                   K2704840
                    *                                                   K2704850
                    RC908 DC      RC909-RC908-1                    2-11 K2704860
                    *                                              2-11 K2704862
                          EBC     . C 97 PROGRAM LENGTH EXCEEDS.   2-11 K2704864
                          EBC     . CAPACITY.                      2-11 K2704866
                    *                                                   K2704870
                    *                                                   K2704880
                    RC909 EQU     *                                2-11 K2704890
                          DC      0                                     K2704900
                          END     OVERZ                                 K2704910
