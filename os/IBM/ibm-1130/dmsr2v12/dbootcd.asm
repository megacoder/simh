                          HDNG    BOOTSTRAP LOADER                      DBTC0010
                    *************************************************** DBTC0020
                    *                                                 * DBTC0030
                    *FUNCTION/OPERATION -                             * DBTC0040
                    *   * THIS TWO CARD BOOTSTRAP LOADER LOADS ANY    * DBTC0050
                    *     NUMBER OF CARDS PUNCHED IN 1800 IPL FORMAT. * DBTC0060
                    *     THE NUMBER OF CARDS, THE LOAD ADDRESS, AND  * DBTC0070
                    *     THE EXECUTION BRANCH ADDRESS ARE SPECIFIED  * DBTC0080
                    *     BY PUNCHING THEM INTO THE APPROPRIATE       * DBTC0090
                    *     FIELDS ON THE 2ND BOOTSTRAP CARD.           * DBTC0100
                    *                                                 * DBTC0110
                    *   * THE BOOTSTRAP LOADER CAN BE IPL-ED FROM     * DBTC0120
                    *     EITHER THE 2501 OR THE 1442. THE CARDS ARE  * DBTC0130
                    *     LOADED FROM THE SAVE DEVICE.                * DBTC0140
                    *                                                 * DBTC0150
                    *ENTRY POINTS -                                   * DBTC0160
                    *   * THE ENTRY POINT IS BT000 WHICH IS LOADED    * DBTC0170
                    *     AT LOCATION 0                               * DBTC0180
                    *                                                 * DBTC0190
                    *INPUT -                                          * DBTC0200
                    *   * THE CARDS TO BE LOADED MUST BE IN 1800 IPL  * DBTC0210
                    *     FORMAT (8-8 FORMAT), 36 WORDS PER CARD.     * DBTC0220
                    *     COL 73-80 ARE LEFT FOR SEQUENCE NUMBERS.    * DBTC0230
                    *                                                 * DBTC0240
                    *OUTPUT -                                         * DBTC0250
                    *   * N/A                                         * DBTC0260
                    *                                                 * DBTC0270
                    *EXTERNAL REFERENCES -                            * DBTC0280
                    *   * N/A                                         * DBTC0290
                    *                                                 * DBTC0300
                    *EXITS -                                          * DBTC0310
                    *   * NORMAL -                                    * DBTC0320
                    *       * THE ADDRESS BRANCHED TO AFTER ALL CARDS * DBTC0330
                    *         HAVE BEEN LOADED IS PUNCHED IN COLS     * DBTC0340
                    *         14-13 OF THE 2ND BOOTSTRAP CARD.        * DBTC0350
                    *                                                 * DBTC0360
                    *   * ERROR -                                     * DBTC0370
                    *       * N/A                                     * DBTC0380
                    *                                                 * DBTC0390
                    *TABLES/WORK AREAS -                              * DBTC0400
                    *   * N/A                                         * DBTC0410
                    *                                                 * DBTC0420
                    *NOTES -                                          * DBTC0430
                    *   * THRERE ARE NO ERROR PROCEDURES. THE PROGRAM * DBTC0440
                    *     ASSUMES THAT ALL READ OPERATIONS EXECUTE    * DBTC0450
                    *     WITHOUT ERRORS                              * DBTC0460
                    *                                                 * DBTC0470
                    *   * THE NUMBER OF CARDS TO BE READ PLUS ONE     * DBTC0480
                    *     MUST BE PUNCHED IN COL 62-61 OF THE 2ND     * DBTC0490
                    *     BOOTSTRAP CARD                              * DBTC0500
                    *                                                 * DBTC0510
                    *   * THE LOAD ADDRESS MINUS /25 MUST BE PUNCHED  * DBTC0520
                    *     IN COL 64-63 OF THE 2ND BOOTSTRAP CARD      * DBTC0530
                    *   * THE FIRST BOOTSTRAP CARD MUST BE IN 1130    * DBTC0540
                    *     IPL FORMAT, THE 2ND CARD MUST BE IN 1800    * DBTC0550
                    *     IPL FORMAT. COLS 73-80 OF EACH CARD ARE     * DBTC0560
                    *     LEFT FOR SEQUENCE NUMBERS.                  * DBTC0570
                    *                                                 * DBTC0580
                    *   * THE FIRST AVAILABLE CORE LOCATION FOR THE   * DBTC0590
                    *     CARDS TO BE LOADED IS /74                   * DBTC0600
                    *                                                 * DBTC0610
                    *************************************************** DBTC0620
                          HDNG    BOOTSTRAP LOADER                      DBTC0630
                          ABS                                           DBTC0640
                          ORG     0                                     DBTC0650
                    BT000 LD      S1442     (2808)             1 00 C04 DBTC0660
                          SRA     1         (1404)             2 01 181 DBTC0670
                          STO     S1442     START 1442 IOCC    3 02 D02 DBTC0680
                          LD      R1442     (4810)             4 03 C07 DBTC0690
                          MDX     START     BRANCH             5 04 709 DBTC0700
                    S1442 DC      /2808     INT TO /1404       6 05 288 DBTC0710
                          DC      /0027     INT TO ADRXX       7 06 027 DBTC0720
                    S2501 DC      *-*       INT TO /4E00       8 07 000 DBTC0730
                          DC      CLINT     COL INT ADR        9 08 029 DBTC0740
                    T2501 DC      /3800     INT TO /4F03      10 09 380 DBTC0750
                          DC      *-*       INT TO ADRXX      11 0A 000 DBTC0760
                    R1442 DC      /4810     INT TO /1204      12 0B 490 DBTC0770
                          DC      OPINT     OP INT ADR        13 0C 031 DBTC0780
                    T1442 DC      /B818     INT TO /1703      14 0D B98 DBTC0790
                    START SRA     2         (1204)            15 0E 182 DBTC0800
                          STO     R1442     READ 1442 IOCC    16 0F D7B DBTC0810
                          LD      T1442     (B808)            17 10 C7C DBTC0820
                          SRA     3         (1701)            18 11 183 DBTC0830
                          STO     T1442     TEST 1442 IOCC    19 12 D7A DBTC0840
                          A       T2501     (4F01)            20 13 875 DBTC0850
                          STO     T2501     TEST 2501 IOCC    21 14 D74 DBTC0860
                          LD      S2501-1   (0027)            22 15 C70 DBTC0870
                          SLA     1         (004E)            23 16 101 DBTC0880
                          STO     S2501-1   START 2501 ADR    24 17 D6E DBTC0890
                          STO     R1442-1   READ  1442 ADR    25 18 D71 DBTC0900
                          STO     AR2XX     ADR IN LOAD INST  26 19 D24 DBTC0910
                          STO     AR3XX     ADR IN STORE INST 27 1A D25 DBTC0920
                          SLA     8         (4E00)            28 1B 108 DBTC0930
                          STO     S2501     START 2501 IOCC   29 1C D6A DBTC0940
                          LD      B1XXX     (00C4)            30 1D C1C DBTC0950
                          SLA     8         (C400)            31 1E 108 DBTC0960
                          STO     B1XXX     LOAD LONG INST    32 1F D1A DBTC0970
                          A       B3XXX     (D400)            33 20 81E DBTC0980
                          STO     B3XXX     STORE LONG INST   34 21 D1D DBTC0990
                          A       B2XXX     (EC00)            35 22 81A DBTC1000
                          STO     B2XXX     OR LONG INST      36 23 D19 DBTC1010
                          LD      AR2XX     (004E)            37 24 C19 DBTC1020
                          STO     WDCNT     INIT WORD COUNT   38 25 D28 DBTC1030
                          NOP               SPACE             39 26 100 DBTC1040
                    READX XIO     S1442-1   START 1442        40 27 0DC DBTC1050
                          XIO     S2501-1   START 2501        41 28 0DD DBTC1060
                    CLINT MDX     *-1       LOOP HERE         42 29 77F DBTC1070
                          XIO     T1442-1   TEST 1442         43 2A 0E1 DBTC1080
                          LD      R1442-1   INCREMENT BY 1    44 2B C5E DBTC1090
                          A       H1XXX       READ 1442 COL   45 2C 803 DBTC1100
                          STO     R1442-1     ADDRESS         46 2D D5C DBTC1110
                          XIO     R1442-1   REAL COL OFF 1442 47 2E 0DB DBTC1120
                          BOSC    +-Z       TURN OFF INT      48 2F 4F8 DBTC1130
                    H1XXX DC      1         CONSTANT          49 30 001 DBTC1140
                    OPINT MDX     *-1       LOOP HERE         50 31 77F DBTC1150
                    LOOP1 LD      AR3XX     INCREMENT STORE   51 32 C0D DBTC1160
                          A       H1XXX       LONG INST ADR   52 33 87C DBTC1170
                          STO     AR3XX       BY 1            53 34 D0B DBTC1180
                          LD      AR2XX     INCREMENT OR      54 35 C08 DBTC1190
                          A       H1XXX       LONG INST ADR   55 36 879 DBTC1200
                          STO     AR1XX       BY 2 AND LOAD   56 37 D03 DBTC1210
                          A       H1XXX       LONG INST ADR   57 38 877 DBTC1220
                          STO     AR2XX       BY 2            58 39 D04 DBTC1230
                    B1XXX DC      /00C4     INT TO ....       59 3A 044 DBTC1240
                    AR1XX DC      *-*             LD  L *-*   60 3B 000 DBTC1250
                    *                       (DD00)                      DBTC1260
                          SRA     8         (00DD)            61 3C 188 DBTC1270
                    B2XXX DC      /1800     INT TO ....       62 3D 180 DBTC1280
                    AR2XX DC      *-*             OR  L *-*   63 3E 000 DBTC1290
                    *                       (DDDD)                      DBTC1300
                    B3XXX DC      /1000     INT TO ....       64 3F 100 DBTC1310
                    AR3XX DC      *-*             STO L *-*   65 40 000 DBTC1320
                    *                       STORE PACKED DATA           DBTC1330
                          LD      NOXXX     DECREMENT NUMBER  66 41 C05 DBTC1340
                          S       H1XXX       OF COLUMNS BY   67 42 96D DBTC1350
                          STO     NOXXX       1               68 43 D03 DBTC1360
                          BSC     Z         SKIP IF ZERO      69 44 4A0 DBTC1370
                          MDX     LOOP1     BRANCH TO CONT.   70 45 76C DBTC1380
                          MDX     ENTER     GO TO 2ND CARD    71 46 728 DBTC1390
                    NOXXX DC      /28                         72 47 028 DBTC1400
                    OLDXX BSS     1         OLD WORD             48     DBTC1410
                          BSS     5         SPACE                49     DBTC1420
                    WDCNT BSS     1         WORD COUNT           4E     DBTC1430
                    *                                         73    L   DBTC1440
                    *                                         74    D   DBTC1450
                    *                                         75    B   DBTC1460
                    *                                         76    0   DBTC1470
                    *                                         77    T   DBTC1480
                    *                                         78    H   DBTC1490
                    *                                         79    0   DBTC1500
                    *                                         80    1   DBTC1510
                    *                                                   DBTC1520
                    *   SECOND CARD OF BOOTSTRAP               OBJ CODE DBTC1530
                    *                                                   DBTC1540
                          ORG     WDCNT+1                               DBTC1550
                    GOONS LD      OLDXX     (XXXX)            1 4F C0F8 DBTC1560
                          STO  I  S2501-1   REPLACE OLD WORD  3 50 D480 DBTC1570
                    *                                         5 51 0006 DBTC1580
                          LD      NOCDX     DECREMENT CARD    7 52 C01A DBTC1590
                          S       H1XXX       COUNT           9 53 90DC DBTC1600
                          BSC  L  *-*,+-    BRANCH IF LOADED 11 54 4C18 DBTC1610
                    *                                        13 55 0000 DBTC1620
                          STO     NOCDX     SAVE CARD COUNT  15 56 D016 DBTC1630
                          LD      MDXXX     (70FF)           17 57 C013 DBTC1640
                          STO     OPINT     RESTORE MDX *-1  19 58 D0D8 DBTC1650
                          STO     CLINT     RESTORE MDX *-1  21 59 D0CF DBTC1660
                          LD      ADRSS     INCREMENT LOAD   23 5A C013 DBTC1670
                          A       H24XX       ADDRESS BY     25 5B 800E DBTC1680
                          STO     ADRSS       36 WORDS       27 5C D011 DBTC1690
                          STO     S2501-1   INIT ADDRESS     29 5D D0A8 DBTC1700
                          STO     R1442-1   INIT ADDRESS     31 5E D0AB DBTC1710
                          STO     AR2XX     INIT ADDRESS     33 5F D0DE DBTC1720
                          STO     AR3XX     INIT ADDRESS     35 60 D0DF DBTC1730
                          LD      H24XX     (0024)           37 61 C008 DBTC1740
                          STO     NOXXX     SET COL COUNT    39 62 D0E4 DBTC1750
                          LD   I  S2501-1   (XXXX)           41 63 C480 DBTC1760
                    *                                        43 64 0006 DBTC1770
                          STO     OLDXX     SAVE OLD WORD    45 65 D0E2 DBTC1780
                          LD      H4EXX     (004E)           47 66 C005 DBTC1790
                          STO  I  S2501-1   SET COL COUNT    49 67 D480 DBTC1800
                    *                         FOR HDWR       51 68 0006 DBTC1810
                          MDX     READX                      53 69 70BD DBTC1820
                    H24XX DC      /24       CONSTANT         55 6A 0024 DBTC1830
                    MDXXX MDX     *-1       CONSTANT         57 6B 70FF DBTC1840
                    H4EXX DC      /4E       CONSTANT         59 6C 004E DBTC1850
                    NOCDX DC      *-*       NO OF CARDS      61 6D 0000 DBTC1860
                    ADRSS DC      *-*       LOAD ADDRESS     63 6E 0000 DBTC1870
                    ENTER XIO     T1442-1   SENSE 1442 DSW   65 6F 089C DBTC1880
                          XIO     T2501-1   SENSE 2501 DSW   67 70 0897 DBTC1890
                          BOSC L  GOONS     BR-TURN OFF INT  69 71 4C40 DBTC1900
                    *                                        71 72 004F DBTC1910
                    *                                        73    L    DBTC1920
                    *                                        74    D    DBTC1930
                    *                                        75    B    DBTC1940
                    *                                        76    0    DBTC1950
                    *                                        77    T    DBTC1960
                    *                                        78    H    DBTC1970
                    *                                        79    0    DBTC1980
                    *                                        80    2    DBTC1990
                          END     *                                     DBTC2000
