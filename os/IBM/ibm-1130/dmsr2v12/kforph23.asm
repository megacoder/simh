                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2300010
                    *************************************************** K2300020
                    *STATUS - VERSION 2 MODIFICATION 8                * K2300030
                    *                                                 * K2300040
                    *FUNCTION/OPERATION-                              * K2300050
                    *   * LISTS THE FEATURES SUPPORTED BY THE PROGRAM * K2300060
                    *     AS INDICATED IN THE FORTRAN COMMUNICATIONS  * K2300070
                    *     AREA (FCOM).                                * K2300080
                    *   * LISTS THE SYSTEM SUBROUTINES USED BY THE    * K2300090
                    *     PROGRAM, IF REQUESTED.                      * K2300100
                    *   * LISTS THE SUBPROGRAM NAMES FOUND IN THE     * K2300110
                    *     SYMBOL TABLE, IF REQUESTED.                 * K2300120
                    *   * AS A SUPPLEMENT TO THE EXPANDER PHASES, 17  * K2300130
                    *     AND 18, THIS PHASE ADDS INDEXING TO THE     * K2300140
                    *     SYSTEM LIBRARY SUBROUTINE CALLS AND 2-WORD  * K2300150
                    *     INSTRUCTIONS WHICH REFERENCE DIMENSIONED    * K2300160
                    *     VARIABLES.                                  * K2300170
                    *                                                 * K2300180
                    *ENTRY POINTS-                                    * K2300190
                    *   * NEQ   - ENTERED VIA A CALL TO THE ROL SUBR  * K2300200
                    *             FROM PHASE 23.                      * K2300210
                    *                                                 * K2300220
                    *INPUT-                                           * K2300230
                    *   * STRING AREA                                 * K2300240
                    *   * SYMBOL TABLE AREA                           * K2300250
                    *   * FCOM                                        * K2300260
                    *                                                 * K2300270
                    *OUTPUT-                                          * K2300280
                    *   * STRING AREA                                 * K2300290
                    *   * SYMBOL TABLE AREA                           * K2300300
                    *   * FCOM                                        * K2300310
                    *   * PRINTED LISTING                             * K2300320
                    *                                                 * K2300330
                    *EXTERNAL REFERENCES-                             * K2300340
                    *   SUBROUTINES                                   * K2300350
                    *      * ROL                                      * K2300360
                    *      * LSTPR                                    * K2300370
                    *      * PRINT                                    * K2300380
                    *      * NEWPG                                    * K2300390
                    *   COMMA/DCOM                                    * K2300400
                    *      * $ PHSE                                   * K2300410
                    *      * $ CH12                                   * K2300420
                    *                                                 * K2300430
                    *EXITS-                                           * K2300440
                    *   NORMAL-                                       * K2300450
                    *      EXIT FROM THIS PHASE IS MADE VIA A CALL    * K2300460
                    *      TO THE ROL SUBR WITH A REQUEST TO ENTER    * K2300470
                    *      THE NEXT PHASE.                            * K2300480
                    *   ERROR-                                        * K2300490
                    *      N/A                                        * K2300500
                    *                                                 * K2300510
                    *ATTRIBUTES-                                      * K2300520
                    *   N/A                                           * K2300530
                    *                                                 * K2300540
                    *NOTES-                                           * K2300550
                    *   THERE ARE NO ERRORS DETECTED IN THIS PHASE    * K2300560
                    *                                                 * K2300570
                    *************************************************** K2300580
                          ABS                                           K2300590
                    *                                                   K2300600
                    *                       SYSTEM EQUATES              K2300610
                    MEMRY EQU     /8000                                 K2300620
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2300630
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K2300640
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K2300650
                    *                                                   K2300660
                    PHID  EQU     53         ID NUMBER THIS PHASE       K2300670
                    *                       PRINT ROUTINE               K2300680
                    *                                                   K2300690
                    HEAD  EQU     ROL-49     PAGE HEADER AREA           K2300700
                    OVERP EQU     HEAD-327-2 DEVICE PRINT ROUTINE AREA  K2300710
                    NEWPG EQU     OVERP-54   INDIRECT ENTRY PAGE EJECT  K2300720
                    $CH12 EQU     /06        CHANNEL 12 INDICATOR       K2300730
                    PRINT EQU     NEWPG+2    PRINT INTERFACE RTN ENTRY  K2300740
                    LSTPR EQU     OVERP+3    DEVICE PRINT ROUTINE ENTRY K2300750
                    AREA  EQU     NEWPG+1  MESSAGE ADDRESS              K2300760
                    PHLEN EQU     3         NO SECTORS THIS PHASE       K2300765
                    *                                                   K2300770
                          HDNG    1132 D.M. V2 FORT P24    LIST SYMBOLS K2300780
                          ORG     OVERL                                 K2300790
                    *                                                   K2300800
                    *                  FORTRAN COMMUNICATION AREA       K2300810
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K2300815
                    SOFS  BSS     1    START OF STRING                  K2300820
                    EOFS  BSS     1    END OF STRING                    K2300830
                    SOFST BSS     1    START OF SYMBOL TABLE            K2300840
                    SOFNS BSS     1    LENGTH OF PROGRAM                K2300850
                    SOFXT BSS     1    SIZE OF WORK AREA (VAR AREA)     K2300860
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2300870
                    EOFST BSS     1    END OF SYMBOL TABLE              K2300880
                    COMON BSS     1    RELATIVE ENTRY POINT             K2300890
                    CSIZE BSS     1    SIZE OF COMMON                   K2300900
                    ERROR BSS     1    ERROR FLAG                       K2300910
                    *               BIT 15 OVERLAP ERROR                K2300920
                    *               BIT 14 OTHER ERROR                  K2300930
                    FNAME BSS     1    PROGRAM NAME                     K2300940
                          BSS     1                                     K2300950
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2300960
                    CCWD  BSS     1    CONTROL CARD WORD                K2300970
                    *                BIT 15 TRANSFER TRACE              K2300980
                    *                BIT 14 ARITHMETIC TRACE            K2300990
                    *                BIT 13 EXTENDED PRECISION          K2301000
                    *                BIT 12 LIST SYMBOL TABLE           K2301010
                    *                BIT 11 LIST SUBPROGRAM NAMES       K2301020
                    *                BIT 10 LIST SOURCE PROGRAM         K2301030
                    *                BIT  9 ONE WORD INTEGERS           K2301040
                    *                BIT  8 ORIGIN                  2-4 K2301045
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2301050
                    *                BIT 15 CARD                        K2301060
                    *                BIT 14 PAPER TAPE                  K2301070
                    *                BIT 13 TYPEWRITER                  K2301080
                    *                BIT 12 1403 PRINTER                K2301090
                    *                BIT 11 2501 READER                 K2301100
                    *                BIT 10 KEYBOARD                    K2301110
                    *                BIT  9 1442 PUNCH                  K2301120
                    *                BIT  8 DISK                        K2301130
                    *                BIT  7 1132 PRINTER                K2301140
                    *                BIT  3 PLOTTER                     K2301150
                    *                BIT  1 UNFORMATTED DISK            K2301160
                    DFCNT BSS     1                                     K2301170
                    *                                                   K2301180
                    *                  END OF FORTRAN COMMUNICATION     K2301190
                    *                  AREA                             K2301200
                    *************************************************** K2301210
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2301220
                    BPHAR EQU     *+2                                   K2301230
                          DC      0        LOADER WORK AREA             K2301240
                          DC      -53      -PHASE ID FOR SLET LOOKUP    K2301250
                          DC      NXTPH-*+1 DISPLACEMENT TO SLET TABLE  K2301260
                          DC      1        ONE SLET ENTRY REQUESTED     K2301270
                          ORG     *-2                                   K2301280
                    NEQ   BSC  L  ENT      BRANCH TO BEGIN PROCESSING   K2301290
                    *                                                   K2301300
                    *                                                   K2301310
                    WDCNT DC      *-*      PRINT AREA WORD COUNT        K2301320
                    PAREA DC      /4000    PRINT AREA START             K2301330
                          DC      /4000    BLANK                        K2301340
                          DC      /4000    BLANK                        K2301350
                          DC      /4000    BLANK                        K2301360
                    *                                                   K2301370
                    PAEND EQU     PAREA+119  END OF PRINT AREA          K2301380
                    *                                                   K2301390
                    ENT   LDX   1 PHID     GET ID THIS PHASE            K2301400
                          STX  L1 $PHSE    STORE IN COMMA               K2301410
                          LD   L  ERROR                                 K2301420
                          BSC  L  EXIT,Z   BR TO EXIT IF OVERLAP ERROR  K2301430
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2301440
                    *             INITIALIZATION PROGRAM IS EXECUTED    K2301450
                    *             AT LOCATIONS THAT LATER SERVE AS      K2301460
                    *             PRINT AREA                            K2301470
                    *                                                   K2301480
                    *                                                   K2301490
                    *             INITIALIZE TRANSFERVECTOR             K2301500
                    *                                                   K2301510
                          LDX  L3 Z        LOAD XR3 WITH WK AREA PT     K2301520
                          STX  L3 NEQ      SAVE FOR RE-INITIALIZATION   K2301530
                    *                                                   K2301540
                    *                                                   K2301550
                    *             LIST FEATURES SUPPORTED               K2301560
                    *                                                   K2301570
                    *                                                   K2301580
                    *             ANY FEATURES SUPPORTED                K2301590
                    *                                                   K2301600
                          LD      IOCS     LD IOCS CONTROL CD WORD      K2301610
                          BSC     Z        SKIP IF ZERO                 K2301620
                          MDX     K1010    BRANCH IF IOCS PRESENT       K2301630
                          LD   L  CCWD     LD CONTROL CARD WORD         K2301640
                          AND   3 H00C7-Z  REMOVE UNNECESSARY BITS  2-4 K2301650
                          BSC  L  L1035,+- BR IF NO FEATURES SUPPORTED  K2301660
                    *                                                   K2301670
                    *             IF ANY FEATURES SUPPORTED             K2301680
                    *             PRINT TEXT -FEATURES SUPPORTED-       K2301690
                    *                                                   K2301700
                    *                                                   K2301710
                    K1010 BSI  L  PBLNK    SPACE PRINTER ONE LINE       K2301720
                          BSI  L  HTEST    PRINT MSG                    K2301730
                          DC      9        WORD COUNT                   K2301740
                          EBC     .FEATURES SUPPORTED.                  K2301750
                    *                                                   K2301760
                    *                                                   K2301770
                    *             PRINT .TRANSFER TRACE.                K2301780
                    *             IF APPLICABLE                         K2301790
                    *                                                   K2301800
                    K1020 LD      CCWD     LOAD CONTROL CARD WORD       K2301810
                          SLA     15       TEST FOR TRANSFER TRACE      K2301820
                          BSC  L  K1021,-  BR IF NO TRANSFER TRACE      K2301830
                          BSI  L  HTEST    PRINT MSG                    K2301840
                          DC      8        WORD COUNT                   K2301850
                          EBC     . TRANSFER TRACE .                    K2301860
                    *                                                   K2301870
                    *             PRINT .ARITHMETIC TRACE.              K2301880
                    *             IF APPLICABLE                         K2301890
                    *                                                   K2301900
                    K1021 LD   L  CCWD     LOAD CONTROL CARD WORD       K2301910
                          SLA     14       TEST FOR ARITHMETIC TRACE    K2301920
                          BSC  L  K1031,-  BR IF NO ARITHMETIC TRACE    K2301930
                          BSI  L  HTEST    PRINT MSG                    K2301940
                          DC      9        WORD COUNT                   K2301950
                          EBC     . ARITHMETIC TRACE .                  K2301960
                    *                                                   K2301970
                    *             PRINT .ONE WORD INTEGERS.             K2301980
                    *             IF APPLICABLE                         K2301990
                    *                                                   K2302000
                    K1031 LD   L  CCWD     LOAD CONTROL CARD WORD       K2302010
                          SLA     9        TEST FOR ONE WORD INTEGERS   K2302020
                          BSC  L  K1051,-  BR IF NO ONE WORD INTEGERS   K2302030
                          BSI  L  HTEST    PRINT MSG                    K2302040
                          DC      9        WORD COUNT                   K2302050
                          EBC     . ONE WORD INTEGERS.                  K2302060
                    *                                                   K2302070
                    *             PRINT .EXTENDED PRECISION.            K2302080
                    *             IF APPLICABLE                         K2302090
                    *                                                   K2302100
                    K1051 LD      CCWD     LOAD CONTROL CARD WORD       K2302110
                          SLA     13       TEST FOR EXTENDED PRECISION  K2302120
                          BSC  L  L1025,-  BR IF NOT EXTENDED PRECISION K2302130
                          BSI     HTEST    PRINT MSG                    K2302140
                          DC      10       WORD COUNT                   K2302150
                          EBC     . EXTENDED PRECISION .                K2302160
                    *                                                   K2302170
                    *             CHANGE SYSTEM SUBR.-NAME-LIST SO THAT K2302180
                    *             APPLICABLE NAMES BEGIN WITH .E.       K2302190
                    *             RATHER THAN WITH .F.                  K2302200
                    *                                                   K2302210
                          LDX   1 FAXIX-TABSS+2                         K2302220
                    L1022 BSI   3 FTOE-Z   CHANGE NEXT NAME             K2302230
                          MDX   1 -2                                    K2302240
                          MDX     L1022    BR IF X1 NOT ZERO            K2302250
                    *                                                   K2302260
                          LDX   1 FCHRI-TABSS+2  CHANGE WCHRI       2-6 K2302262
                          BSI   3 FTOE-Z         *INTO  VCHRI       2-6 K2302264
                    *                                                   K2302270
                    *             CHANGE SECOND CHAR IN TRACE ROUTINE   K2302280
                    *             NAMES FROM 'F' INTO 'E'               K2302290
                    *                                                   K2302300
                          LD    3 H0004-Z  MODIFY FTOE SUBR TO MODIFY   K2302310
                          STO     DIFF     *THE SECOND CHAR OF NAME     K2302320
                          LDX   1 FARI-TABSS+2                          K2302330
                          BSI   3 FTOE-Z   MODIFY FARI                  K2302340
                          LDX   1 FARIX-TABSS+2                         K2302350
                          BSI   3 FTOE-Z   MODIFY FARIX                 K2302360
                          LDX   1 FIF-TABSS+2                           K2302370
                          BSI   3 FTOE-Z   MODIFY FIF                   K2302380
                    *                                                   K2302381
                    *             PRINT .ORIGIN.                        K2302382
                    *             IF APPLICABLE                         K2302383
                    *                                                   K2302384
                    L1025 LD   L  CCWD     LOAD CONTROL CARD WORD   2-4 K2302385
                          SLA     8        TEST FOR ORIGIN          2-4 K2302386
                          BSC  L  L1030,-  BRANCH IF NOT ORIGIN     2-4 K2302387
                          BSI     HTEST    PRINT MESSAGE            2-4 K2302388
                          DC      4        WORD COUNT               2-4 K2302389
                          EBC     . ORIGIN .                        2-4 K2302390
                    *                                                   K2302391
                    *             TEST FOR IOCS                         K2302400
                    L1030 LD   L  IOCS     LOAD IOCS CONTROL CARD WORD  K2302410
                          BSC  L  L1035,+- BR IF NO IOCS REQUESTED      K2302420
                          BSI     HTEST    PRINT MSG                    K2302430
                          DC      3        WORD COUNT                   K2302440
                          EBC     . IOCS .                              K2302450
                    *                                                   K2302460
                    *                                                   K2302470
                    L1035 LD   L  CCWD     LOAD CONTROL CARD WORD       K2302480
                          SLA     11       TEST IF LIST SUBP NAMES      K2302490
                          BSC  L  L2011,-  BR IF NO LIST REQUESTED      K2302500
                    *                                                   K2302510
                          LDX  I1 SOFST    INITIALIZE SYMBOL PT         K2302520
                          STX  L1 STP      *                            K2302530
                    *                                                   K2302540
                    *             BRANCH TO PROGRAM AREA                K2302550
                    *             OUTSIDE THE PRINT AREA                K2302560
                    *                                                   K2302570
                          BSC  L  L1041    BR OUT OF PRINT AREA         K2302580
                    *                                                   K2302590
                    *                                                   K2302600
                    *             PRINT SECTION HEADER                  K2302610
                    *                                                   K2302620
                    HTEST DC      *-*      LINK                         K2302630
                    *                                                   K2302640
                          LD   I  $CH12    LOAD CHANNEL 12 INDICATOR    K2302650
                          BSI  I  NEWPG,Z  EJECT PAGE IF SET            K2302660
                    *                                                   K2302670
                          LD      HTEST    GET WORD COUNT ADDRESS       K2302680
                          RTE     16       SHIFT TO EXTENSION           K2302690
                          LD      HTES1    LOAD PRINT PARAMETER         K2302700
                          BSI  L  LSTPR    PRINT HEADER                 K2302710
                    *                                                   K2302720
                    *             CALCULATE RETURN ADDRESS              K2302730
                    *                                                   K2302740
                          LD   I  HTEST    LOAD WORD COUNT              K2302750
                          A       HTEST    ADD WORD COUNT ADDRESS       K2302760
                          A     3 ONE-Z    ADD ONE                      K2302770
                          STO     *+1      STO INTO RETURN INSTRUCTION  K2302780
                          BSC  L  *-*      RETURN                       K2302790
                    *                                                   K2302800
                    *                                                   K2302810
                    HTES1 DC      /7001    PRINT PARAMETER              K2302820
                    *                                                   K2302830
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2302840
                    **************************************************  K2302850
                    *                                                   K2302860
                    *             .TRANSFER VECTOR. SUBROUTINES FOLLOW  K2302870
                    **************************************************  K2302880
                    *                                                   K2302890
                    *                                                   K2302900
                    *             SUBROUTINE                            K2302910
                    *             GET SYMBOL TABLE ID-WORD              K2302920
                    *                                                   K2302930
                    GETST DC      0        LINK                         K2302940
                          AND   3 H07FF-Z  MK TO LV SYM TBL ENTRY NO.   K2302950
                          BSC  I  GETST,+-  RETURN IF ZERO          2-6 K2302955
                          STO     GETS1+1  STORE INTO LD INSTRUCTION    K2302960
                          LD   L  SOFST    LD START OF SYM TBL ADDRESS  K2302970
                          S       GETS1+1  SUBTRACT 3*ENTRY NUMBER      K2302980
                          S       GETS1+1  *                            K2302990
                          S       GETS1+1  *                            K2303000
                          A     3 3        PLUS THREE                   K2303010
                          STO     GETS1+1  STO SYM TBL ENTRY ADR        K2303020
                    GETS1 LD   L  *-*      LD SYM TBL ID WORD           K2303030
                          BSC  I  GETST    RETURN                       K2303040
                    *                                                   K2303050
                    *                                                   K2303060
                    *             SUBROUTINE                            K2303070
                    *             CHANGE .F. IN FIRST CHARACTER OF A    K2303080
                    *             SUBROUTINE NAME INTO .E.              K2303090
                    *             (OR  E,F INTO V,W)                    K2303100
                    *                                                   K2303110
                    *             DISPLACEMENT IN NAME LIST = X1        K2303120
                    DIFF  DC      /0100                                 K2303130
                    FTOE  DC      0        LINK                         K2303140
                          LD   L1 TABSS-2  GET FIRST WORD IN NAME       K2303150
                          S       DIFF     CHANGE NAME BY               K2303160
                    *                      *SUBTRACTING DIFF            K2303170
                          STO  L1 TABSS-2  RETURN WORD TO TABLE         K2303180
                          BSC  I  FTOE     RETURN                       K2303190
                    *                                                   K2303200
                    *             SUBROUTINE                            K2303210
                    *             .TAG. SYSTEM SUBR. NAME IN LIST BY    K2303220
                    *             MAKING  LEFTMOST BIT = ONE            K2303230
                    *                                                   K2303240
                    TAGSR DC      0        LINK                         K2303250
                          LD   L2 TABSS-2  LOAD TABLE ENTRY             K2303260
                          OR    3 H8000-Z  TAG IT TO BE PRINTED         K2303270
                          STO  L2 TABSS-2  RESTORE TABLE ENTRY          K2303280
                          BSC  I  TAGSR    RETURN                       K2303290
                    *             MOVE STRING POINTER                   K2303300
                    MOVEP DC      0        LINK                         K2303310
                          MDX   1 1        INCR STRING POINTER          K2303320
                          SLA     0                                     K2303330
                          MDX  L  NRM,-4   DECR WORD COUNT              K2303340
                          SLA     0                                     K2303350
                          BSC  I  MOVEP    RETURN                       K2303360
                    *                                                   K2303370
                    *             SUBR. MOVE SYMBOL TABLE POINTER       K2303380
                    MSTP  DC      0        LINK                         K2303390
                          LD    1 0        LD SYM TBL ID WORD           K2303400
                          AND   3 MASK3-Z  TEST IF DIMENTIONED          K2303410
                          BSC     Z        SKIP IF NOT DIMENSIONED      K2303420
                          LD    3 CM3-Z    MINUS THREE                  K2303430
                          S     3 3        MINUS THREE                  K2303440
                          A     3 STP-Z    ADD SYM TBL PT ADDRESS       K2303450
                          STO   3 STP-Z    STO NEXT SYM TBL ENTRY ADDR  K2303460
                          LDX  I1 STP      SET SR1 TO NEW SYM TBL ENTRY K2303470
                          BSC  I  MSTP     RETURN                       K2303480
                    *                                                   K2303490
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2303500
                    *             CONSTANTS                             K2303510
                    *                                                   K2303520
                    D60   DC      60       CONSTANT                     K2303530
                    PAPIN DC      PAREA    INITIAL VALUE OF PAP         K2303540
                    PAP   DC      PAREA    PRINT AREA POINTER           K2303550
                    C120  DC      120      CONSTANT                     K2303560
                    Z     DC      0        CONSTANT, WK AREA BASE ADDR  K2303570
                    ZERO  EQU     Z        *                            K2303580
                    ONE   DC      1        CONSTANT                     K2303590
                    TWO   DC      2        CONSTANT                     K2303600
                    THREE DC      3        CONSTANT                     K2303610
                    FOUR  DC      4        CONSTANT                     K2303620
                    H0004 EQU     FOUR     *                            K2303630
                    H07FF DC      /07FF    CONSTANT MASK                K2303640
                    *                                                   K2303650
                    H0100 DC      /0100    CONSTANT MASK                K2303660
                    H8000 DC      /8000    CONSTANT FLAG BIT            K2303670
                    STP   DC      0        SYMBOL TABLE POINTER         K2303680
                    MASK2 DC      /0080    FOR TESTING IF SUBP NAME     K2303690
                    MASK3 DC      /1800    FOR TESTING IF DIMENTIONED   K2303700
                    CM3   DC      /FFFD    CONSTANT                     K2303710
                    MASK5 DC      /F800    FOR EXTRACTING STMNT ID      K2303720
                    MASK6 DC      /07FC    FOR EXTRACTING NORM          K2303730
                    NRM   DC      0        STORED NORM                  K2303740
                    STID  DC      0        STMNT ID                     K2303750
                    FTEST DC      /6000    STMNT ID = FORMAT            K2303760
                    ENDID DC      /1000    STMNT ID = END               K2303770
                    H1800 DC      /1800    MASK TO TEST IF DIMENTIONED  K2303780
                    H1900 DC      /1900    MASK TO TEST IF .CALL SUBC.  K2303790
                    H1E00 DC      /1E00    MASK TO TEST .LIBF VIOAI.    K2303800
                    H5B00 DC      /5B00    MASK TO TEST .LDXL1.         K2303810
                    H0500 DC      /0500    CONSTANT                     K2303820
                    H00C7 DC      /00C7    TEST IF FEATURES SUPPORTED   K2303830
                    H0080 DC      /0080    CONSTANT                     K2303840
                    H0008 DC      /0008    CONSTANT                     K2303850
                    H7800 DC      /7800    CONSTANT                     K2303860
                    H1D00 DC      /1D00    MASK TO TEST .LIBF SUBIN.    K2303870
                    H1600 DC      /1600    MASK TO TEST .LIBF SIOAI.    K2303880
                    H1680 DC      /1680    MASK TO TEST .LIBF SIOAF.    K2303890
                    H5D00 DC      /5D00    MASK TO TEST SPEC .BSC L.    K2303900
                    H4000 DC      /4000    CONSTANT                     K2303910
                    HD800 DC      /D800    MAST TO TEST INTNL O/P FMT   K2303920
                    H4700 DC      /4700    MASK TO TEST .BSI L.         K2303930
                    DFILE DC      /F000    MASK TO TEST IF DEFINE FILE  K2303940
                    DATA  DC      /F800-/F000                           K2303950
                    *                                                   K2303960
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2303970
                    *             SYSTEM SUBR. TABLE                    K2303980
                    TABSS DC      /0604    FADD  CODE=008               K2303990
                          DC      /4100                                 K2304000
                          DC      /0604    FADDX      010               K2304010
                          DC      /4127                                 K2304020
                          DC      /068A    FSUB       018               K2304030
                          DC      /4080                                 K2304040
                          DC      /068A    FSUBX      020               K2304050
                          DC      /40A7                                 K2304060
                          DC      /0651    FMPY       028               K2304070
                          DC      /7A00                                 K2304080
                          DC      /0651    FMPYX      030               K2304090
                          DC      /7A27                                 K2304100
                          DC      /0610    FDIV       038               K2304110
                          DC      /9940                                 K2304120
                          DC      /0610    FDIVX      040               K2304130
                          DC      /9967                                 K2304140
                          DC      /064C    FLD        048               K2304150
                          DC      /4000                                 K2304160
                          DC      /064C    FLDX       050               K2304170
                          DC      /49C0                                 K2304180
                          DC      /068A    FSTO       058               K2304190
                          DC      /3580                                 K2304200
                          DC      /068A    FSTOX      060               K2304210
                          DC      /35A7                                 K2304220
                          DC      /0688    FSBR       068               K2304230
                          DC      /2640                                 K2304240
                          DC      /0688    FSBRX      070               K2304250
                          DC      /2667                                 K2304260
                          DC      /0612    FDVR       078               K2304270
                          DC      /5640                                 K2304280
                          DC      /0612    FDVRX      080               K2304290
                          DC      /5667                                 K2304300
                          DC      /0606    FAXI       088               K2304310
                          DC      /7240                                 K2304320
                    FAXIX DC      /0606    FAXIX      090               K2304330
                          DC      /7267                                 K2304340
                          DC      /0626    FIXI       098               K2304350
                          DC      /7240                                 K2304360
                          DC      /0626    FIXIX      0A0               K2304370
                          DC      /7267                                 K2304380
                    FARI  DC      /2218    SFAR       0A8               K2304390
                          DC      /1640                                 K2304400
                    FARIX DC      /2218    SFARX      0B0               K2304410
                          DC      /1667                                 K2304420
                    FIAR  DC      /2224    SIAR       0B8               K2304430
                          DC      /1640                                 K2304440
                    FIARX DC      /2224    SIARX      0C0               K2304450
                          DC      /1667                                 K2304460
                    AIFIX DC      /0918    IFIX       0C8               K2304470
                          DC      /99C0                                 K2304480
                    AFLT  DC      /064D    FLOAT      0D0               K2304490
                          DC      /6063                                 K2304500
                          DC      /2666    WRTYZ      0D8               K2304510
                          DC      /3A29                                 K2304520
                          DC      /23A1    TYPEZ      0E0               K2304530
                          DC      /7169                                 K2304540
                    FIIF  DC      /2224    SIIF       0E8               K2304550
                          DC      /9180                                 K2304560
                    FIF   DC      /2218    SFIF       0F0               K2304570
                          DC      /9180                                 K2304580
                    FGOTO DC      /221D    SGOTO      0F8               K2304590
                          DC      /68D6                                 K2304600
                          DC      /0305    CARDZ      100               K2304610
                          DC      /9129                                 K2304620
                          DC      /1765    PRNTZ      108               K2304630
                          DC      /58E9                                 K2304640
                          DC      /1705    PAPTZ      110               K2304650
                          DC      /78E9                                 K2304660
                    FCHRI DC      /260C    WCHRI      118           2-1 K2304670
                          DC      /8649                                 K2304680
                          DC      /2464    URED       120               K2304690
                          DC      /5100                                 K2304700
                          DC      /2499    UWRT       128               K2304710
                          DC      /98C0                                 K2304720
                          DC      /240D    UCOMP      130               K2304730
                          DC      /6517                                 K2304740
                          DC      /1914    READZ      138               K2304750
                          DC      /1129                                 K2304760
                    AERD  DC      /2264    SRED       140               K2304770
                          DC      /5100                                 K2304780
                          DC      /2299    SWRT       148               K2304790
                          DC      /98C0                                 K2304800
                          DC      /220D    SCOMP      150               K2304810
                          DC      /6517                                 K2304820
                    AFIO  DC      /2218    SFIO       158               K2304830
                          DC      /9580                                 K2304840
                          DC      /2225    SIOAI      160               K2304850
                          DC      /6049                                 K2304860
                    AIOAF DC      /2225    SIOAF      168               K2304870
                          DC      /6046                                 K2304880
                          DC      /2225    SIOFX      170               K2304890
                          DC      /61A7                                 K2304900
                          DC      /2225    SIOIX      178               K2304910
                          DC      /6267                                 K2304920
                          DC      /2225    SIOF       180               K2304930
                          DC      /6180                                 K2304940
                    IOI   DC      /2225    SIOI       188               K2304950
                          DC      /6240                                 K2304960
                    SUBSC DC      /2290    SUBSC      190               K2304970
                          DC      /2883                                 K2304980
                          DC      /1765    PRNZ       198               K2304990
                          DC      /5A40                                 K2305000
                    BCKSP DC      /020D    BCKSP      1A0               K2305010
                          DC      /2897                                 K2305020
                    EOF   DC      /0558    EOF        1A8               K2305030
                          DC      /6000                                 K2305040
                    REWND DC      /1916    REWND      1B0               K2305050
                          DC      /6544                                 K2305060
                          DC      /228D    STOP       1B8               K2305070
                          DC      /65C0                                 K2305080
                          DC      /1706    PAUSE      1C0               K2305090
                          DC      /4885                                 K2305100
                    RSIGN DC      /2255    SNR        1C8               K2305110
                          DC      /9000                                 K2305120
                          DC      /2290    SUBIN      1D0               K2305130
                          DC      /2255                                 K2305140
                          DC      /2418    UFIO       1D8               K2305150
                          DC      /9580                                 K2305160
                          DC      /2425    VIOAI      1E0               K2305170
                          DC      /6049                                 K2305180
                          DC      /2425    VIOAF      1E8               K2305190
                          DC      /6046                                 K2305200
                          DC      /2425    UIOFX      1F0               K2305210
                          DC      /61A7                                 K2305220
                          DC      /2425    UIOIX      1F8               K2305230
                          DC      /6267                                 K2305240
                          DC      /2425    UIOF       200               K2305250
                          DC      /6180                                 K2305260
                          DC      /2425    UIOI       208               K2305270
                          DC      /6240                                 K2305280
                    MDFIO DC      /2210    SDFIO      210               K2305290
                          DC      /6256                                 K2305300
                          DC      /2211    SDRED      218               K2305310
                          DC      /9144                                 K2305320
                          DC      /2212    SDWRT      220               K2305330
                          DC      /6663                                 K2305340
                          DC      /2210    SDCOM      228               K2305350
                          DC      /3594                                 K2305360
                          DC      0        RESERVED TO KEEP CODE        K2305370
                          DC      0        DIFFERENCE CONSTANT          K2305380
                    *                      BETWEEN DISK I/O             K2305390
                    *                      ROUTINES AND OTHERS          K2305400
                          DC      /2210    SDAI       238               K2305410
                          DC      /1240                                 K2305420
                          DC      /2210    SDAF       240               K2305430
                          DC      /1180                                 K2305440
                          DC      /2210    SDFX       248               K2305450
                          DC      /69C0                                 K2305460
                          DC      /2210    SDIX       250               K2305470
                          DC      /99C0                                 K2305480
                          DC      /2210    SDF        258               K2305490
                          DC      /6000                                 K2305500
                    MDI   DC      /2210    SDI        260               K2305510
                          DC      /9000                                 K2305520
                    MDFND DC      /2210    SDFND      268               K2305530
                          DC      /6544                                 K2305540
                          DC      /1754    PNCHZ      270               K2305550
                          DC      /3229                                 K2305560
                    *                                                   K2305570
                    EOTAB DC      /0000    NOT USED                     K2305580
                          DC      /0000    NOT USED                     K2305590
                          HDNG    1130 FORTRAN COMPILER PHASE 23        K2305600
                    *                                                   K2305610
                    *                                                   K2305620
                    *                                                   K2305630
                    **************************************************  K2305640
                    *                                                   K2305650
                    *                                                   K2305660
                    L1041 LD    3 STP-Z    TEST IF END OF SYMBOL TABLE  K2305670
                          S    L  EOFST    *                            K2305680
                          BSC     +        SKIP IF NOT                  K2305690
                          MDX     L2011    BR IF END OF SYMBOL TABLE    K2305700
                          LD    1 0        LOAD SYMBOL TABLE ID WORD    K2305710
                    *                                                   K2305720
                    *             TEST IF CONSTANT                      K2305730
                    *             (EXTENDED PREC CONST MAY HAVE BITS    K2305740
                    *             IN ID-WORD TO MAKE IT SIMILAR TO      K2305750
                    *             SUBPROGRAM NAMES)                     K2305760
                          BSC  L  L1045,+Z BR IF NOT CONSTANT OR NAME   K2305770
                    *                                                   K2305780
                          AND   3 MASK2-Z                               K2305790
                          BSC     +        SKIP IF SUBPROGR NAME        K2305800
                          MDX     L1045    BR IF NOT                    K2305810
                    *                                                   K2305820
                    *             TEST IF SUBPROGRAM NAME IS THE        K2305830
                    *             NAME OF THE COMPILED SUBPROGRAM       K2305840
                    *             ITSELF                                K2305850
                    *             (HAS /FFFF IN LAST WORD)              K2305860
                    *             IN THAT CASE DO NOT PRINT             K2305870
                    *                                                   K2305880
                          LD    1 2        LOAD NAME WORD 2             K2305890
                          A     3 1                                     K2305900
                          BSC     +-       SKIP IF DIFF                 K2305910
                          MDX     L1045    BR IF SAME                   K2305920
                    *                                                   K2305930
                    *             TEST IF ARITH STMT FUNCT NAME         K2305940
                    *             IN THAT CASE DO NOT PRINT             K2305950
                    *                                                   K2305960
                          LD    1 0        LOAD SYMBOL TABLE ID WORD    K2305970
                          AND   3 H0100-Z                               K2305980
                          BSC  L  L1045,Z  BR IF ARITH SMT FUNCT NAME   K2305990
                    *                                                   K2306000
                    *             GET NAME FROM SYMBOL TABLE            K2306010
                    *             MOVE NAME TO PRINT AREA               K2306020
                    *                                                   K2306030
                          BSI  L  MNAME    MOVE NAME TO PRINT AREA      K2306040
                    *                                                   K2306050
                    *                                                   K2306060
                    L1045 BSI   3 MSTP-Z   INCR SYMBOL TABLE POINTER    K2306070
                          MDX     L1041    GO CHECK NEXT ENTRY          K2306080
                    *                                                   K2306090
                    *                                                   K2306100
                    L2011 LDX  I1 SOFS     INITIALIZE STRING POINTER    K2306110
                    *                                                   K2306120
                    L2012 LD    1 0        LOAD STATEMENT ID WORD       K2306130
                          AND   3 MASK5-Z  EXTRACT ID                   K2306140
                          STO   3 STID-Z   STORE ID                     K2306150
                          LD    1 0        LOAD STATEMENT ID WORD       K2306160
                          AND   3 MASK6-Z  EXTRACT NORM                 K2306170
                          STO   3 NRM-Z    STORE NORM                   K2306180
                          BSI   3 MOVEP-Z  MOVE POINTER                 K2306190
                    *                                                   K2306200
                    *             TEST IF END-STATEMENT                 K2306210
                    L2021 LD    3 STID-Z   LOAD STATEMENT ID            K2306220
                          S     3 ENDID-Z  TEST IF .END.                K2306230
                          BSC  L  L2041,+- BR IF .END.                  K2306240
                    *                                                   K2306250
                    *                                                   K2306260
                    *             TEST TO FIND STATEMENTS THAT          K2306270
                    *             CONSIST OF ONE WORD ONLY              K2306280
                    *                                                   K2306290
                          LD    3 NRM-Z                                 K2306300
                          BSC  L  L2012,+- BR IF ONE-WD STMT            K2306310
                    *                                                   K2306320
                    *                                                   K2306330
                          LD    3 STID-Z   LOAD STATEMENT ID            K2306340
                          S     3 FTEST-Z  TEST IF FORMAT-STATEMENT     K2306350
                          BSC  L  L2022,+- BR IF FORMAT-STATEMENT       K2306360
                    *                                                   K2306370
                    *             TEST IF LOADER-OVERLAY SMT            K2306380
                    *             IN A SUBPROGRAM                       K2306390
                    *             OR DEFINE FILE, DATA                  K2306400
                    *                                                   K2306410
                          LD    3 STID-Z   LOAD STATEMENT ID            K2306420
                          S     3 DFILE-Z                               K2306430
                          BSC  L  L2022,+- BR IF DEFINE FILE            K2306440
                          S     3 DATA-Z                                K2306450
                          BSC  L  L2022,+- BR IF DATA-STMT              K2306460
                    *                                                   K2306470
                          LD    3 STID-Z   LOAD STATEMENT ID            K2306480
                          S     3 HD800-Z                               K2306490
                          BSC  L  L2031,Z  BR IF STMT-ID .NE. D800      K2306500
                          LD   L  SORF                                  K2306510
                          BSC  L  L2022,Z  BR IF LOADER-OVERLAY STMT    K2306520
                          MDX     L2031    BR IF NOT                    K2306530
                    *                                                   K2306540
                    *                                                   K2306550
                    *             MOVE POINTER TO NEXT STATEMENT        K2306560
                    *                                                   K2306570
                    L2022 LD    3 NRM-Z    LOAD NORM                    K2306580
                          BSC  L  L2012,+- BRANCH IF NORM = ZERO        K2306590
                          BSI   3 MOVEP-Z  MOVE POINTER                 K2306600
                          MDX     L2022    BR, MOVE NOT COMPLETE        K2306610
                    *                                                   K2306620
                    *                                                   K2306630
                    L2031 LD    1 0        LD SYMBOL TABLE PT WORD      K2306640
                          BSC     -        SKIP IF PACKED INSTR OR NAME K2306650
                          MDX     L2033    BR IF NOT                    K2306660
                          AND   3 H7800-Z                               K2306670
                          BSC  L  L2032,+- BR IF NAME                   K2306680
                    *                                                   K2306690
                    *             CHANGE PACKED INSTRUCTION IF          K2306700
                    *             NAME REFERS TO DIMENSIONED            K2306710
                    *             VARIABLE                              K2306720
                    *                                                   K2306730
                          LD    1 0        LD SYMBOL TABLE PT WORD      K2306740
                          BSI  L  GETST    GET SYMBOL TABLE ID WORD     K2306750
                          AND   3 H1800-Z  TEST FOR DIMENSIONED VAR     K2306760
                          BSC  L  L2032,+- BR IF NOT DIMENSIONED        K2306770
                    *                                                   K2306780
                    *             CHANGE INSTRUCTION CODE               K2306790
                    *             (FROM LDL TO LDL1 ETC)                K2306800
                    *             WAS NOT DONE IN MACRO 1 BECAUSE       K2306810
                    *             THE PHASE WAS SPACE CRITICAL          K2306820
                    *                                                   K2306830
                          LD    1 0        LOAD STRING WORD             K2306840
                          OR    3 H4000-Z  MODIFY INSTRUCTION CODE      K2306850
                          STO   1 0        SAVE BACK IN STRING          K2306860
                    *                                                   K2306870
                    *                                                   K2306880
                    L2032 BSI   3 MOVEP-Z  MOVE STRING POINTER          K2306890
                          LD    3 NRM-Z    LOAD STMNT NORM              K2306900
                          BSC  L  L2031,Z  BR IF NORM NOT ZERO          K2306910
                          MDX     L2012    BR IF NORM ZERO              K2306920
                    *                                                   K2306930
                    *                                                   K2306940
                    L2033 LD    1 0        LOAD STMNT ID WORD           K2306950
                          SLA     1        SHIFT TEST BIT TO SIGN       K2306960
                          BSC  L  L3011,-  BR IF .CALL.                 K2306970
                    *                                                   K2306980
                    *             TEST IF HARDW-INSTR CODE              K2306990
                    *             REFERS TO .SPEC BSC L.                K2307000
                    *             IF SO, MOVE POINTER ONE WORD          K2307010
                    *             EXTRA  (SPEC BSC L  IS FOLLOWED       K2307020
                    *             BY A DISPLACEMENT VALUE RATHER        K2307030
                    *             THAN A NAME                           K2307040
                    *                                                   K2307050
                          LD    1 0        LOAD STRING WORD             K2307060
                          S     3 H5D00-Z  SUBTRACT SPECIAL BSC CODE    K2307070
                          BSC  L  L2034,+- BR IF SPECIAL BSC FOUND      K2307080
                    *                                                   K2307090
                    *                                                   K2307100
                          LD    1 0        LOAD STRING WORD             K2307110
                          S     3 H5B00-Z  SUBTRACT LDX  L1 CODE        K2307120
                          BSC  L  L2032,Z  BR IF NOT LDXL1              K2307130
                    *                                                   K2307140
                    *                                                   K2307150
                    L2034 BSI   3 MOVEP-Z  MOVE POINTER BY 1            K2307160
                          MDX     L2032    CONTINUE                     K2307170
                    *                                                   K2307180
                    *                                                   K2307190
                    L2041 LDX  L1 TABSS-EOTAB-2  LD SIZE OF PR TBL  2-8 K2307200
                          LD   L  CCWD     LD CONTROL CARD WORD         K2307210
                          SLA     11       TEST TO LIST SUBPROG NAME    K2307220
                          BSC  L  EXIT,-   BR IF LISTING NOT REQUIRED   K2307230
                    L2042 MDX   1 2        INCR COUNT OF NAMES          K2307240
                          MDX     L2044    BR TO LIST NAME IF CNT NE 0  K2307250
                    *                                                   K2307260
                    *                      (SKIP OCCURS AT END OF LIST) K2307270
                    *                                                   K2307280
                    *             TEST IF HALF FILLED LINE REMAINS      K2307290
                    *             TO BE PRINTED                         K2307300
                    *                                                   K2307310
                          LD   L  PCNT     LOAD PRINT CHAR COUNT        K2307320
                          BSC  L  EXIT,+-  BR IF PRINT COUNT ZERO       K2307330
                          SRA     1        DIVIDE BY 2                  K2307340
                          STO  L  WDCNT    SAVE IN WORD COUNT           K2307350
                          LD    3 PAPIN-Z  FET PR AREA POINTER START    K2307360
                          STO  L  AREA     SAVE FOR PRINT SUBROUTINE    K2307370
                          BSI  L  PRINT    PRINT LAST LINE              K2307380
                          BSC  L  EXIT     BR TO EXIT THIS PHASE        K2307390
                    *                                                   K2307400
                    *             PRINT .TAGGED. SYSTEM SUBROUTINE      K2307410
                    *                      NAMES                        K2307420
                    *                                                   K2307430
                    L2044 LD   L1 EOTAB    LOAD NAME FROM TABLE         K2307440
                          BSC     -        SKIP IF SUBR NAME .TAGGED.   K2307450
                          MDX     L2042    BR IF NOT                    K2307460
                          MDX  L1 EOTAB-1  INCR INDEX SO NAME AT XR1+1  K2307470
                          SLA     0        NOP, IF SIGN CHANGE          K2307480
                          BSI  L  MNAME    MOVE NAME TO PRINT AREA      K2307490
                          MDX  L1 -EOTAB+1 RESET XR1                    K2307500
                          SLA     0        NOP                          K2307510
                          MDX     L2042    BR BACK TO SEARCH LIST       K2307520
                    *                                                   K2307530
                    *             TWO-WORD SUBPROGRAM CALL              K2307540
                    *             OR SYSTEMS SUBR CALL ENCOUNTERED.     K2307550
                    *                                                   K2307560
                    L3011 LD    1 0        LOAD STRING WORD             K2307570
                          SRA     7        SHIFT TO TEST FOR 2-WD CALL  K2307580
                    *                                                   K2307590
                          BSC  L  L3051,+- BR IF TWO-WORD CALL          K2307600
                    *                                                   K2307610
                    *             THIS IS A SYSTEMS SUBROUTINE CALL     K2307620
                    *                                                   K2307630
                    *             TEST IF LAST WORD IN STATEMENT        K2307640
                          LD    3 NRM-Z    LOAD STORED NORM             K2307650
                          S     3 FOUR-Z   SUBTRACT 1 FROM NORM COUNT   K2307660
                          BSC  L  L3012,+  BR IF LAST                   K2307670
                    *                                                   K2307680
                    *             TEST IF .CALL SUBIN.                  K2307690
                    *             TEST MUST BE MADE HERE SINCE ITS      K2307700
                    *             FOLLOWING ARGUMENTS COULD BE          K2307710
                    *             MISTAKEN FOR DIMENSIONED              K2307720
                    *             VARIABLE NAMES, AT OCCASION           K2307730
                    *                                                   K2307740
                          LD    1 0        LOAD STRING WORD             K2307750
                          S     3 H1D00-Z  SUBTRACT .SUBIN. CODE        K2307760
                          BSC  L  L3012,+- BR IF .SUBIN.                K2307770
                    *                                                   K2307780
                    *                                                   K2307790
                    *             IF FOLLOWED BY A DIMENSIONED NAME,    K2307800
                    *             INCREMENT CALL CODE                   K2307810
                    *             CORRECTION DONE HERE BECAUSE          K2307820
                    *             MACRO 1  PHASE APPROACHING CRITICAL   K2307830
                    *             SIZE                                  K2307840
                    *                                                   K2307850
                          LD    1 1        GET NEXT WORD OF STRING      K2307860
                          BSC  L  L3012,-  BR IF NOT FOLLOWED BY        K2307870
                    *                      *NAME OR PACKED INSTRUCTION  K2307880
                          AND   3 H7800-Z  MASK NAME BITS               K2307890
                          BSC  L  L3012,Z  BR IF PACKED INSTR           K2307900
                    *                                                   K2307910
                    *             TEST IF NAME DIMENSIONED              K2307920
                          LD    1 1        GET STRING WD                K2307930
                          BSI  L  GETST    BR TO GET SYMBOL TABLE ID WD K2307940
                          AND   3 H1800-Z  MASK ALL BUT DIMENSION BITS  K2307950
                          BSC  L  L3012,+- BR IF NAME NOT DIMENSIONED   K2307960
                    *                                                   K2307970
                    *             NAME IS DIMENSIONED,                  K2307980
                    *             CHANGE CALL CODE                      K2307990
                    *                                                   K2308000
                          LD    1 0        LOAD STRING WORD             K2308010
                          A     3 H0080-Z  MASK IN DIMENSION BITS       K2308020
                          STO   1 0        SAVE IN STRING               K2308030
                    *                                                   K2308040
                    *                                                   K2308050
                    *             TAG SYSTEMS SUBROUTINE NAME IN TABLE  K2308060
                    *                                                   K2308070
                    L3012 LD    1 0        LD STRING WD                 K2308080
                          SRA     6        RIGHT JUSTIFY POINTER        K2308090
                          STO     L3013+1  SAVE POINTER TO SUBR TABLE   K2308100
                    L3013 LDX  L2 *-*      PUT POINTER IN XR2           K2308110
                          BSI   3 TAGSR-Z  BR TO FLAG SUBR TABLE ENTRY  K2308120
                    *                                                   K2308130
                    *             TEST IF SYSTEM SUBROUTINE             K2308140
                    *             HAS SPECIAL ARGUMENT LIST TO          K2308150
                    *             MOVE POINTER PAST THIS ARG LIST       K2308160
                    *                                                   K2308170
                          LD    1 0        LOAD STRING WORD             K2308180
                          S     3 H1600-Z  TEST FOR CALL FIOAI          K2308190
                          BSC  L  L3015,+- BR IF CALL FIOAI             K2308200
                    *                                                   K2308210
                          LD    1 0        LOAD STRING WORD             K2308220
                          S     3 H1680-Z  TEST FOR CALL FIOAF          K2308230
                          BSC  L  L3015,+- BR IF CALL FIOAF             K2308240
                    *                                                   K2308250
                          LD    1 0        LOAD STRING WORD             K2308260
                          S     3 H1D00-Z  TEST FOR CALL SUBIN          K2308270
                          BSC  L  L3041,+- BR IF CALL SUBIN             K2308280
                    *                                                   K2308290
                          LD    1 0        LOAD STRING WORD             K2308300
                          S     3 H1900-Z  TEST FOR CALL SUBSC          K2308310
                          BSC  L  HERE,+-  BR IF NOT CALL SUBSC         K2308320
                          LD    1 0        LOAD STRING WORD             K2308330
                          S     3 H1E00-Z  TEST FOR CALL UIOA2          K2308340
                          BSC     Z        SKIP IF FOUND                K2308350
                          S     3 H0080-Z  TEST FOR CALL UIOAI          K2308360
                          BSC     Z        SKIP IF FOUND                K2308370
                          S     3 H0500-Z  TEST FOR CALL SDAI           K2308380
                          BSC     Z        SKIP IF FOUND                K2308390
                          S     3 H0080-Z  TEST FOR CALL SDAF           K2308400
                          BSC  L  L2032,Z  NO MATCH, BR TO MOVE PT      K2308410
                          MDX     L3015    BR TO MOVE PT PAST 2 WDS     K2308420
                    *                                                   K2308430
                    *             MOVE POINTER PAST ARGUMENT LIST       K2308440
                    *             OF .CALL SUBSC.                       K2308450
                    *                                                   K2308460
                    HERE  BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308470
                          BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308480
                    L3042 BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308490
                          BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308500
                          LD    1 0        LOAD STRING WD               K2308510
                          BSC  L  L2032,Z+ BR IF PAST ARGUMENT STRING   K2308520
                          MDX     L3042    BR IF NOT                    K2308530
                    *                                                   K2308540
                    *                                                   K2308550
                    *             MOVE POINTER PAST TWO ARGUMENTS       K2308560
                    *                                                   K2308570
                    L3015 BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308580
                          BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308590
                          BSC  L  L2032    CONTINUE                     K2308600
                    *                                                   K2308610
                    *                      MOVE POINTER BY ARGUMENTS    K2308620
                    L3041 SLA     0        NOP                          K2308630
                    L3016 BSI   3 MOVEP-Z  MOVE POINTER 1 WORD          K2308640
                          LD    1 0        LOAD STRING WORD             K2308650
                          S     3 ONE-Z    SUB END-OF-LIAT INDR (=1)    K2308660
                          BSC  L  L3016,Z  BR IF NOT END OF             K2308670
                    *                      *ARGUMENT LIST               K2308680
                          BSC  L  L2032    BR IF END OF ARGUMENT LIST   K2308690
                    *                                                   K2308700
                    *             TWO-WORD CALL ENCOUNTERED             K2308710
                    *             IF CALL IS TO ARITH STMNT FUNCTION    K2308720
                    *             CHANGE TO BSI L                       K2308730
                    *                                                   K2308740
                    L3051 LD    1 1        LOAD STRING WD +1            K2308750
                          BSI  L  GETST    BR TO GET SYM TBL ID WD      K2308760
                          AND   3 H0500-Z  MASK ARITH STMNT FUNC BIT    K2308770
                          BSC  L  L2032,+  BR IF NOT ARITH STMNT FUNC   K2308780
                    *             OR DUMMY VARIABLE NAME                K2308790
                          LD    3 H4700-Z  CODE FOR .BSI L.             K2308800
                          STO   1 0        SAVE AS FIRST STRING WD      K2308810
                          BSC  L  L2032    BR TO CONTINUE               K2308820
                    *                                                   K2308830
                    *             PRINT HEADER IF NECESSARY             K2308840
                    *             BUILD PRINT LINE                      K2308850
                    *                                                   K2308860
                    MNAME DC      0        ENTRY POINT                  K2308870
                          BSI  L  PBLNK    BR TO PRINT BLANK LINE       K2308880
                          BSI  L  HTEST    BR TO PRINT HEADER           K2308890
                          DC      9        WD CNT AND HEADER TO PRINT   K2308900
                          EBC     .CALLED SUBPROGRAMS.                  K2308910
                          LDX  L2 RWM-1    SET UP TO BR PAST HDR PR     K2308920
                          STX   2 MNAME+2  *AFTER FIRST PASS            K2308930
                    RWM   BSI     TOPAB    BR TO PRINT BLANK CHAR       K2308940
                          LD    1 1        GET SUBR NAME TO PRINT       K2308950
                          BSI     TOPA     BR TO CONVERT, MOVE 1ST CHAR K2308960
                          LD    1 1        GET SUBR NAME                K2308970
                          SLA     6        SHIFT 2ND CHAR               K2308980
                          BSI     TOPA     BR TO CONVERT, MOVE 2ND CHAR K2308990
                          LD    1 2        GET 2ND WD OF SUBR NAME      K2309000
                          RTE     16       SHIFT TO EXTENSION           K2309010
                          LD    1 1        GET 1ST WD OF SUBR NAME      K2309020
                          SLT     12       SHIFT BOTH REGS FOR 3RD CHAR K2309030
                          BSI     TOPA     BR TO CONVERT, MOVE 3RD CHAR K2309040
                          LD    1 2        GET 2ND WD OF SUBR NAME      K2309050
                          SLA     2        SHIFT 4TH CHAR               K2309060
                          BSI     TOPA     BR TO CONVERT, MOVE 4TH CHAR K2309070
                          LD    1 2        GET 2ND WD OF SUBR NAME      K2309080
                          SLA     8        SHIFT 5TH CHAR               K2309090
                          BSI     TOPA     BR TO CONVERT, MOVE 5TH CHAR K2309100
                          BSI     TOPAB    BR TO OUTPUT BLANK CHAR      K2309110
                          BSI     TOPAB    BR TO OUTPUT BLANK CHAR      K2309120
                    *                                                   K2309130
                    *             INCREMENT PRINT COUNT                 K2309140
                          LD      PCNT     LOAD PRINT COUNT             K2309150
                          A     3 H0008-Z  INCR BY 8 CHARS              K2309160
                          STO     PCNT     SAVE IN PRINT COUNT          K2309170
                    *                                                   K2309180
                    *     TEST IF LINE FULL                             K2309190
                          S     3 C120-Z   SUBTRACT MAX NO. CHARS/LINE  K2309200
                          BSC  I  MNAME,+Z RETURN IF LINE NOT FULL      K2309210
                          LD    3 PAPIN-Z  LOAD PR AREA INT CONSTANT    K2309220
                          STO   3 PAP-Z    RESET PR AREA POINTER        K2309230
                          STO  L  AREA     RESET START OF PR AREA       K2309240
                          LD    3 D60-Z    GET CONSTANT 60              K2309250
                          STO  L  WDCNT    *TO SET UP PRINT WD COUNT    K2309260
                          BSI  L  PRINT    PRINT A LINE                 K2309270
                          SLA     16       CLEAR ACC                    K2309280
                          STO     PCNT     CLEAR PRINT COUNT            K2309290
                          LD   I  $CH12    TEST FOR CHANNEL 12 FOUND    K2309300
                          BSI  I  NEWPG,Z  BR TO PAGE EJECT IF FOUND    K2309310
                          BSI     BLKPA    BR TO BLANK OUT THE PR AREA  K2309320
                          BSC  I  MNAME    RETURN                       K2309330
                    *                                                   K2309340
                    *             SUBROUTINE                            K2309350
                    *             CHAR IN ACC TO PRINT AREA UNCHANGED   K2309360
                    *                                                   K2309370
                    TOPAU DC      0        LINK ENTRY POINT             K2309380
                          STO     STOCH    SAVE CHAR TO PRINT           K2309390
                    TOPAX LD      STOCH    LD CHAR TO PRINT             K2309400
                          STO  I  PAP      SAVE IN PRINT AREA           K2309410
                          MDX  L  PAP,1    MOVE PRINT AREA POINTER      K2309420
                          BSC  I  TOPAU    RETURN                       K2309430
                    *                                                   K2309440
                    *             SUBROUTINE                            K2309450
                    *             CONVERT CHAR IN ACC INTO              K2309460
                    *             EBC-CODE, THEN MOVE TO PRINT AREA     K2309470
                    *                                                   K2309480
                    TOPA  DC      0        LINK                         K2309490
                          AND     H3F00    GET BITS 2-7 OF PR CHAR      K2309500
                          BSC  L  TOPA2,+- BR IF BLANK                  K2309510
                    *                                                   K2309520
                    *             NOTE                                  K2309530
                    *             IF OTHER SPECIAL CHARACTERS THAN      K2309540
                    *             BLANK ARE EXPECTED, TESTING SHOULD    K2309550
                    *             BE HERE                               K2309560
                          OR      HC000    OR IN BITS 0,1 OF PR CHAR    K2309570
                    TOPA1 STO     STOCH    SAVE CHAR TO PR IN EBC CODE  K2309580
                          LD      TOPA     MOVE LINK                    K2309590
                          STO     TOPAU    SAVE IN COMMON OUTPUT AREA   K2309600
                          MDX     TOPAX    BR TO INCR PAP AND RETURN    K2309610
                    TOPA2 LD    3 H4000-Z  LOAD EBC BLANK               K2309620
                          MDX     TOPA1    BR TO OUTPUT IT              K2309630
                    *                                                   K2309640
                    TOPAB DC      0        LINK ENTRY POINT             K2309650
                          SLA     16       CLEAR ACC                    K2309660
                          BSI     TOPA     BR TO OUTPUT EBC BLANK       K2309670
                          BSC  I  TOPAB    RETURN                       K2309680
                    *                                                   K2309690
                    *             CONSTANTS                             K2309700
                    PCNT  DC      *-*      COUNT OF CHARS TO PRINT      K2309710
                    H3F00 DC      /3F00    CONSTANT MASK                K2309720
                    HC000 DC      /C000    CONSTANT MASK                K2309730
                    STOCH DC      *-*      CHAR TO BE PRINTED           K2309740
                    *                                                   K2309750
                    *             SUBROUTINE                            K2309760
                    *             TO PRINT BLANK LINE                   K2309770
                    *                                                   K2309780
                    PBLNK DC      *-*      LINK ENTRY POINT             K2309790
                          LD      PLBN2    LOAD SPACE PARAMETER         K2309800
                          BSI  L  LSTPR    SPACE PRINTER                K2309810
                    *                                                   K2309820
                          LD   I  $CH12    LOAD CHANNEL 12 INDICATOR    K2309830
                          BSI  I  NEWPG,Z  EJECT PAGE IF ON             K2309840
                    *                                                   K2309850
                          BSC  I  PBLNK    RETURN                       K2309860
                    *                                                   K2309870
                    PLBN2 DC      /7002    PRINTER SPACE PARAMETER      K2309880
                    *                                                   K2309890
                    BLKPA DC      *-*      CLEAR THE PRINT AREA ENTRY   K2309900
                          LD    3 H4000-Z  LOAD EBC BLANK               K2309910
                          LDX  I3 WDCNT    PUT WORD COUNT XR3           K2309920
                          MDX  I3 WDCNT    INCR WORD CNT BY SAME AMT    K2309930
                    BLKP  STO  L3 PAREA-1  SAVE BLANK IN PR AREA        K2309940
                          MDX   3 -1       DECR COUNT OF NO. BLANKS     K2309950
                          MDX     BLKP     LOOP IF PR AREA NOT FULL     K2309960
                          LDX  L3 Z        RESET XR3 TO CONSTANT PT     K2309970
                          BSC  I  BLKPA    RETURN                       K2309980
                    *                                                   K2309990
                    *              EXIT ROUTINE                         K2310000
                    *                                                   K2310010
                    EXIT  SLA     0        NOP                          K2310020
                          LD   I  $CH12    LOAD CHANNEL 12 SW           K2310030
                          BSI  I  NEWPG,Z  IF END OF PAGE, RESTORE PAGE K2310040
                    *                                                   K2310050
                    *                                                   K2310060
                          LDX  I1 NXTPH+1  LOAD PARAMETER FOR READING   K2310070
                          LDD     NXTPH+2  *NEXT PHASE                  K2310080
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2310090
                          BSS  E  0                                     K2310100
                    NXTPH DC      54       ID OF NEXT PHASE             K2310110
                          DC      *-*      CORE ADDRESS NEXT PHASE      K2310120
                          DC      *-*      WORD COUNT NEXT PHASE        K2310130
                          DC      *-*      SECTOR ADDRESS NEXT PHASE    K2310140
                    *                                                   K2310150
                          BSS     BPHAR+320*PHLEN-*-1   PATCH AREA  2-6 K2310160
                    *                                                   K2310170
                          DC       0                                    K2310180
                          END     BPHAR-2                               K2310190
