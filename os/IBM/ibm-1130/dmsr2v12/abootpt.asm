                    ** ABOOTPT-PAPER TAPE CORE IMAGE LOADER             ABPT0000
                    ***   HDNG    PT CI LOADER                          ABPT0010
                    *************************************************** ABPT0020
                    *STATUS- VERSION 2, MODIFICATION LEVEL 0          * ABPT0030
                    *                                                 * ABPT0040
                    *FUNCTION/OPERATION-                              * ABPT0050
                    *   * THE PAPER TAPE CORE IMAGE LOADER IS A STAND-* ABPT0060
                    *     ALONE TAPE USED TO LOAD DATA FROM CORE IMAGE* ABPT0070
                    *     FORMAT TAPES TO CORE LOCATIONS ABOVE 00D5.  * ABPT0080
                    *   * THE CORE IMAGE LOADER OCCUPIES CORE FROM    * ABPT0090
                    *     0000 THROUGH 00D5.                          * ABPT0100
                    *                                                 * ABPT0110
                    *ENTRY POINT- CORE LOCATION 0000.                 * ABPT0120
                    *                                                 * ABPT0130
                    *INPUT- CORE IMAGE FORMAT PAPER TAPE RECORDS.     * ABPT0140
                    *                                                 * ABPT0150
                    *OUTPUT- NONE.                                    * ABPT0160
                    *                                                 * ABPT0170
                    *EXTERNAL REFERENCES- NONE.                       * ABPT0180
                    *                                                 * ABPT0190
                    *EXITS-                                           * ABPT0200
                    *   * NORMAL- WAITS AT CORE LOCATION 00C9 BEFORE  * ABPT0210
                    *     GOING TO EXECUTION OF LOADED PROGRAM.       * ABPT0220
                    *   * ERROR- LOOPS AT CORE LOCATION 0033 IF CHECK-* ABPT0230
                    *     SUM ERROR.  WAITS AT CORE LOCATION 00CC IF  * ABPT0240
                    *     READ ERROR.WAITS AT CORE LOCATION 006C IF   * ABPT0250
                    *     PAPERTAPE READER IS NOT READY               * ABPT0260
                    *                                                 * ABPT0270
                    *TABLES/WORK AREAS- 72 WORD INPUT BUFFER LABELLED * ABPT0280
                    *     'INPUT'.                                    * ABPT0290
                    *                                                 * ABPT0300
                    *ATTRIBUTES-                                      * ABPT0310
                    *   * STAND-ALONE                                 * ABPT0320
                    *   * SELF-LOADING                                * ABPT0330
                    *                                                 * ABPT0340
                    *NOTES-                                           * ABPT0350
                    *   * ERROR PROCEDURES-                           * ABPT0360
                    *      * IF PROGRAM LOOPS AT CHECKSUM ERROR EXIT  * ABPT0370
                    *        AT CORE LOC 0033, CORRECT TAPE & RESTART.* ABPT0380
                    *      * IF PROGRAM WAITS AT READ ERROR TRAP (LOC * ABPT0390
                    *        00CC), POSITION TAPE TO RE-READ LAST     * ABPT0400
                    *        RECORD, OR RESTART.                      * ABPT0410
                    *************************************************** ABPT0420
                    *                                                   ABPT0430
                    *     PAPER TAPE CORE IMAGE LOADER                  ABPT0440
                    *                                                   ABPT0450
                    *                                                   ABPT0460
                    *                                                   ABPT0470
                          ABS                                           ABPT0480
                          ORG     0                                     ABPT0490
                    Y     NOP                                           ABPT0500
                          MDX     CNT-1                                 ABPT0510
                          DC      *-*        RESERVED FOR XR2           ABPT0520
                          DC      *-*        RESERVED FOR XR3           ABPT0530
                          DC      0                                     ABPT0540
                    *                                                   ABPT0550
                    *     ALL INTERRUPT BRANCH LOCATIONS POINT TO       ABPT0560
                    *     INTER,THE PAPERTAPE INTERRUPT SERVICE         ABPT0570
                    *     SUBROUTINE.                                 * ABPT0580
                    *                                                 CIABPT0590
                          DC      INTER                                 ABPT0600
                          DC      INTER                                 ABPT0610
                          DC      INTER                                 ABPT0620
                          DC      INTER                                 ABPT0630
                          DC      INTER                                 ABPT0640
                          DC      INTER                                 ABPT0650
                          DC      INTER                                 ABPT0660
                          DC      INTER                                 ABPT0670
                          DC      LEV5       PROGRAM STOP               ABPT0680
                    *                                                   ABPT0690
                    *     PROGRAM STOP INTERRUPT SERVICE.               ABPT0700
                    *                                                   ABPT0710
                    LEV5  DC      0          PROGRAM STOP ENTRY         ABPT0720
                          STO     IOCCX      SAVE ACCUM                 ABPT0730
                          XIO     IOCCX      SENSE DSW                  ABPT0740
                          BSC     +Z         CHECK PROG STOP BIT        ABPT0750
                          WAIT               YES,WAIT OPERATOR ACTION   ABPT0760
                          LD      IOCCX      RESTORE ACCUM              ABPT0770
                          BOSC I  LEV5       TURN OFF LEVEL AND EXIT    ABPT0780
                    IOCCX DC      0                                     ABPT0790
                          DC      /3F00      SENSE PROG STOP            ABPT0800
                          DC      INTER                                 ABPT0810
                          DC      INTER                                 ABPT0820
                          DC      INTER                                 ABPT0830
                          DC      INTER                                 ABPT0840
                          DC      INTER                                 ABPT0850
                          DC      INTER                                 ABPT0860
                          DC      INTER                                 ABPT0870
                          DC      INTER                                 ABPT0880
                          DC      INTER                                 ABPT0890
                          DC      INTER                                 ABPT0900
                          DC      INTER                                 ABPT0910
                    CKSUM LD      INPUT+1    TEST RECORD TYPE           ABPT0920
                          BSC  L  DAT,+-     BRANCH IF DATA RECORD      ABPT0930
                          MDX  L  CDCNT,1    INCR CARD COUNT BY ONE     ABPT0940
                          LDX   2 54         XR2 IS SET WITH WD COUNT   ABPT0950
                          LD      CDCNT                                 ABPT0960
                    OTTO  A    L2 INPUT-1                               ABPT0970
                          BSC     C          SKIP IF NO CARRY           ABPT0980
                          A       ONE4                                  ABPT0990
                          MDX   2 -1         LOOP UNTIL COUNT IS ZERO   ABPT1000
                          MDX     OTTO                                  ABPT1010
                          S       ONE4                                  ABPT1020
                          BSC  L  DAT,+-                                ABPT1030
                    CK3   MDX     CK3         WAIT HERE IF ERROR        ABPT1040
                    CDCNT DC      0                                     ABPT1050
                    ONE4  DC      1                                     ABPT1060
                    *                                                   ABPT1070
                    *     PAPERTAPE INPUT AREA,DC'S USED INSTEAD OF     ABPT1080
                    *     BSS BECAUSE CIL TAPE IS LOADED IN IPL MODE    ABPT1090
                    *                                                   ABPT1100
                    INPUT DC      0                                     ABPT1110
                          DC      0                                     ABPT1120
                          DC      0                                     ABPT1130
                          DC      0                                     ABPT1140
                          DC      0                                     ABPT1150
                          DC      0                                     ABPT1160
                          DC      0                                     ABPT1170
                          DC      0                                     ABPT1180
                          DC      0                                     ABPT1190
                          DC      0                                     ABPT1200
                          DC      0                                     ABPT1210
                          DC      0                                     ABPT1220
                          DC      0                                     ABPT1230
                          DC      0                                     ABPT1240
                          DC      0                                     ABPT1250
                          DC      0                                     ABPT1260
                          DC      0                                     ABPT1270
                          DC      0                                     ABPT1280
                          DC      0                                     ABPT1290
                          DC      0                                     ABPT1300
                          DC      0                                     ABPT1310
                          DC      0                                     ABPT1320
                          DC      0                                     ABPT1330
                          DC      0                                     ABPT1340
                          DC      0                                     ABPT1350
                          DC      0                                     ABPT1360
                          DC      0                                     ABPT1370
                          DC      0                                     ABPT1380
                          DC      0                                     ABPT1390
                          DC      0                                     ABPT1400
                          DC      0                                     ABPT1410
                          DC      0                                     ABPT1420
                          DC      0                                     ABPT1430
                          DC      0                                     ABPT1440
                          DC      0                                     ABPT1450
                          DC      0                                     ABPT1460
                          DC      0                                     ABPT1470
                          DC      0                                     ABPT1480
                          DC      0                                     ABPT1490
                          DC      0                                     ABPT1500
                          DC      0                                     ABPT1510
                          DC      0                                     ABPT1520
                          DC      0                                     ABPT1530
                          DC      0                                     ABPT1540
                          DC      0                                     ABPT1550
                          DC      0                                     ABPT1560
                          DC      0                                     ABPT1570
                          DC      0                                     ABPT1580
                          DC      0                                     ABPT1590
                          DC      0                                     ABPT1600
                          DC      0                                     ABPT1610
                          DC      0                                     ABPT1620
                          DC      0                                     ABPT1630
                          DC      0                                     ABPT1640
                    *                                                   ABPT1650
                    CNT1  WAIT               P.T. NOT READY,WAIT OPER   ABPT1660
                          MDX     CNT        *ATOR ACTION AND TRY AGAIN ABPT1670
                    QCNT  LDX   1 54         CLEAR                      ABPT1680
                          SRA     16         *THE                       ABPT1690
                          STO  L1 INPUT-1    *PAPERTAPE                 ABPT1700
                          MDX   1 -1         *INPUT                     ABPT1710
                          MDX     *-4        *AREA                      ABPT1720
                          LDX   1 1          XR1 POINTS TO INPUT BFR    ABPT1730
                    CNT   BSI     LEV5       CHECK PROGRAM STOP         ABPT1740
                          MDX     H6200+1    BRANCH TO SENSE DSW        ABPT1750
                          BSC     Z+         IS READER READY            ABPT1760
                          MDX     CNT1       NO,WAIT                    ABPT1770
                    STRDR XIO     READS      YES,START  READER          ABPT1780
                          WAIT               WAIT FOR INTERRUPT         ABPT1790
                    INTER SLA     16         CLEAR                      ABPT1800
                          STO     BUF        BUFFER                     ABPT1810
                          XIO     IOCC       MOVES CONTENTS OF HARDWARE ABPT1820
                          XIO     SENSE      BUFFER INTO BUF AND RESET  ABPT1830
                          BSC  L  ERROR,+Z   IF READ ERROR GO TO ERROR  ABPT1840
                    X     LD      BUF                                   ABPT1850
                          S       DELET      TEST FRAME FOR DELETE CODE ABPT1860
                          BOSC L  CNT,+-     BR IF DELETE CODE          ABPT1870
                          LD      FIX        FETCH MDX INSTRUCTION      ABPT1880
                          STO     X          CHANGE LD TO MDX INST      ABPT1890
                          LD      BUF        FETCH FRAME JUST READ IN   ABPT1900
                          SRA     8          RIGHT JUSTIFY              ABPT1910
                          STO     *+3                                   ABPT1920
                          OR      H6200      MODIFY                     ABPT1930
                          STO     OTTO-2     *INSTRUCTION               ABPT1940
                          LDX  L2 *-*        XR2=COUNT                  ABPT1950
                          BOSC L  CNT        TURN OFF LVL,RD NXT FRAME  ABPT1960
                          LD      TEST       RIGHT OR LEFT              ABPT1970
                          BSC  L  PART2,Z    HALF OF 1L BIT BINARY WORD ABPT1980
                    PART1 LD      BUF        LEFT HALF PROCESSED HERE   ABPT1990
                          STO  L1 INPUT-1    STORE BUF,LEFT HALF OF WD  ABPT2000
                          BOSC    +-Z        TURN OFF INTERRYPT LEVEL   ABPT2010
                    ONE   DC      1          CONSTANT                   ABPT2020
                          LD      ONE        SET TEST TO ONE            ABPT2030
                          STO     TEST       FOR RIGHT HALF OF WORD     ABPT2040
                          MDX     CNT        GO READ NEXT FRAME         ABPT2050
                    *                                                   ABPT2060
                    BUF   DC      0                                     ABPT2070
                          BSS  E  0          I/O CONTROL WORD           ABPT2080
                    IOCC  DC      BUF                                   ABPT2090
                          DC      /1A00      READ IOCC                  ABPT2100
                    READS DC      0                                     ABPT2110
                          DC      /1C10      START READER               ABPT2120
                    SENSE DC      0                                     ABPT2130
                          DC      /1F01      SENSE DSW WITH RESET       ABPT2140
                    TEST  DC      0          CONSTANT                   ABPT2150
                    *                                                   ABPT2160
                    PART2 LD      BUF        RIGHT HALF OF WORD         ABPT2170
                          SRA     8          SHIFTED OVER WILL BE       ABPT2180
                          OR   L1 INPUT-1    ORD IN WITH LEFT HALF      ABPT2190
                          STO  L1 INPUT-1                               ABPT2200
                          BOSC    Z+-        TURN OFF INTERRUPT LEVEL   ABPT2210
                    MASK  DC      /0F00      MASK CONSTANT              ABPT2220
                          SRA     16         RESET                      ABPT2230
                          STO     TEST       TEST                       ABPT2240
                          MDX   1 1          INCREMENT POINTER          ABPT2250
                          MDX   2 -1         DECREMENT COUNTER          ABPT2260
                          MDX     CNT                                   ABPT2270
                          LD      REFIX      RESET X WITH LD INST       ABPT2280
                          STO     X                                     ABPT2290
                          BSC  L  CKSUM                                 ABPT2300
                    DAT   LD      INPUT+2    3RD WORD OF RECORD         ABPT2310
                          AND     MASK1      GET CNT, MASK OUT TYPE     ABPT2320
                          STO     LAB+1      SETUP COUNT FOR XR2        ABPT2330
                    LAB   LDX  L2 *-*        LOAD XR2 WITH WD COUNT     ABPT2340
                          LD   L  INPUT                                 ABPT2350
                          S       ONE                                   ABPT2360
                          STO     LOOP3+3                               ABPT2370
                    LOOP3 LD   L2 INPUT+2                               ABPT2380
                          STO  L2 *-*        STORE DATA WORD            ABPT2390
                          MDX   2 -1         DECR XR2,  LOOP UNTIL 0    ABPT2400
                          MDX     LOOP3                                 ABPT2410
                          LD   L  INPUT+2                               ABPT2420
                          BSC  L  QCNT,-                                ABPT2430
                    EOP   LDX  I3 INPUT+52                              ABPT2440
                          WAIT                                          ABPT2450
                          BSC  I  INPUT+53   BR TO EXECUTE LOADED PROG  ABPT2460
                    ERROR WAIT               READ ERROR                 ABPT2470
                          MDX     CNT        TO READ RECORD             ABPT2480
                    *                                                   ABPT2490
                    REFIX DC      /C019      LOAD ACCUM INSTRUCTION     ABPT2500
                    FIX   DC      /700E      MDX INSTRUCTION            ABPT2510
                    DELET DC      /7F00      PAPER TAPE DELETE CODE     ABPT2520
                    MASK1 DC      /00FF      CON TO MASK OUT LEFT BITS  ABPT2530
                    H6200 DC      /6200      LDX  2 INSTRUCTION         ABPT2540
                    *                                                   ABPT2550
                          XIO     SENSE      SENSE DSW WITH RESET       ABPT2560
                          SLA     5                                     ABPT2570
                          MDX     CNT+2      BR TO TEST IF BIT 5 ON     ABPT2580
                          END     Y                                     ABPT2590
