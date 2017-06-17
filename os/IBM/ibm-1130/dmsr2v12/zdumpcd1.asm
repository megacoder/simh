                    *************************************************** ZD100010
                    *                                                 * ZD100020
                    *   STATUS- VERSION 2, MODIFICATION 11            * ZD100025
                    *                                                 * ZD100030
                    *   PROGRAM NAME- STAND ALONE CORE DUMP,PHASE 1   * ZD100040
                    *                                                 * ZD100050
                    *   FUNCTION/OPERATION-                           * ZD100060
                    *      THIS PHASE IS LOADED INTO CORE BY CIL-BOOT-* ZD100070
                    *      STRAP TO LOC /74.                          * ZD100080
                    *           IT DETERMINES THE SIZE OF CORE AND    * ZD100090
                    *      SETS UP THE LINE COUNTER FOR THE PRINTER   * ZD100100
                    *      ACCORDINGLY. THE ROUTINE ALSO CHECKS TO SEE* ZD100110
                    *      WHICH PRINTER IS ON THE SYSTEM. IF THE 1403* ZD100120
                    *      IS ON THE SYSTEM AND READY IT WILL BE USED.* ZD100130
                    *                                                 * ZD100140
                    *   ENTRY POINTS- START IS THE ONLY ENTRY POINT.  * ZD100150
                    *      THE PROGRAM THEN GOES TO THE LOADER (CIL-  * ZD100160
                    *      BOOTSTRAP)TO BRING IN PHASE 2.             * ZD100170
                    *                                                 * ZD100180
                    *   INPUT- NONE                                   * ZD100190
                    *                                                 * ZD100200
                    *   OUTPUT- THE LINE COUNT FOR THE PRINTER OUTPUT * ZD100210
                    *      IS SAVED IN CORE LOCATION 4.               * ZD100220
                    *      AN INDICATOR WD AT LOCATION /26 IS SET     * ZD100230
                    *      AS FOLLOWS-                                * ZD100240
                    *               ZERO -- 1403 PRINTER USED         * ZD100250
                    *               NON-ZERO -- 1132 PRINTER USED     * ZD100260
                    *                                                 * ZD100270
                    *   EXTERNAL REFERENCES-  THE INTERRUPT BRANCH    * ZD100280
                    *      WORDS FOR INTERRUPT LEVEL 1 (LOC 9) AND    * ZD100290
                    *      INTERRUPT LEVEL 4 (LOC 12) ARE SET TO      * ZD100300
                    *      THE PROGRAMS OWN ILS ROUTINES. WORDS 9     * ZD100310
                    *      AND 12 ARE RESTORED.                       * ZD100320
                    *                                                 * ZD100330
                    *   ERROR CONDITIONS- NO ERRORS ARE RECOGNIZED.   * ZD100340
                    *      IF NO PRINTER IS READY ON THE SYSTEM,THE   * ZD100350
                    *      PROGRAM JUST LOOPS UNTIL ONE IS READY.     * ZD100360
                    *                                                 * ZD100370
                    *   NOTES-                                        * ZD100380
                    *      *THIS PROGRAM MUST BE CONVERTED TO 8/8     * ZD100382
                    *       FORMAT WITH DATA IN COLUMNS 1 THRU 72.    * ZD100384
                    *       COLUMNS 73 THRU 80 ARE TO CONTAIN THE     * ZD100386
                    *       SEQUENCE NUMBERS.                         * ZD100388
                    *      *THE PROGRAM IS LOADED INTO CORE BY THE    * ZD100390
                    *       2-CARD BOOTSTRAP LOADER.                  * ZD100392
                    *                                                 * ZD100394
                    *************************************************** ZD100400
                          HDNG    1403/1132 STAND ALONE CORE DUMP,PH 1  ZD100410
                          ABS                                           ZD100420
                          ORG     /74                                   ZD100430
                    START LDX   3 0          XR3=0--FOR SHORT INSTR     ZD100440
                    *                                                   ZD100450
                    *SAVE WORDS  1E0 THRU 1E4-- THESE LOCATIONS ARE     ZD100460
                    *DESTROYED WHEN 2ND PHASE IS LOADED.THEY ARE        ZD100470
                    *RESTORED WHEN THE SECOND PHASE STARTS EXECUTION.   ZD100480
                    *                                                   ZD100490
                          LDD  L  /1E0                                  ZD100500
                          STD     /1E                                   ZD100510
                          LDD  L  /1E2                                  ZD100520
                          STD     /20                                   ZD100530
                    *                                                   ZD100540
                          LD    3 NINE      SAVE WORDA 9 AND            ZD100550
                          STO     SAV9      *12 IN BOOTSTRAP            ZD100560
                          LD    3 TWLVE     *LOADER AREA BEFORE         ZD100570
                          STO     SAV12     *SETTINF INTRP ADDR         ZD100580
                          LD      INTA4     SET  UP 1403 INTERRUPT SUB- ZD100590
                          STO   3 TWLVE     *ROUTINE ADDR IN WD. 12     ZD100600
                          LD      INTAD     SET  UP 1132 INTERRUPT SUB- ZD100610
                          STO   3 NINE      *ROUTINE ADDR IN WD. 9      ZD100620
                    *                                                   ZD100630
                    * SUBROUTINE TO DETERMINE THE SIZE OF CORE AND SET  ZD100640
                    * UP THE LINE-COUNTER--CTR-- ACCORDING TO THE       ZD100650
                    * CORE-SIZE,227 LINES FOR 1ST  4K AND 256 LINES FOR ZD100660
                    * EVERY ADDITIONAL 4K.                              ZD100670
                    *                                                   ZD100680
                    CORE1 LD   I  COREL     SAVE  CONTENTS OF CORE LOC  ZD100690
                          STO     PACK      *4097                       ZD100700
                          SLA     16        PUT  ZERO IN 4097           ZD100710
                          STO  I  COREL     *IN 4097, 8193 ETC          ZD100720
                          MDX   1 0         IS  LOC 1 ZERO              ZD100730
                          MDX     GR4K      NO ,TRY NEXT HIGHER SIZE    ZD100740
                          LD      CTR1      YES,                        ZD100750
                          STO   3 CTR       *SAVE LINE CNT OF 227       ZD100760
                          MDX     PTEST     GO DO PRINTER TEST          ZD100770
                    GR4K  LD      D256      NEXT HIGHER SIZE-- INCR     ZD100780
                          A       CTR1      LINE CTR BY 256             ZD100790
                          STO     CTR1                                  ZD100800
                    *                                                   ZD100810
                          LD      PACK      RESTORE LOC                 ZD100820
                          STO  I  COREL     *4097, 8193 ETC             ZD100830
                          LD      D4096     MODIFY CORE ADDR BY 4096    ZD100840
                          A       COREL     TO TRY FOR NEXT HIGHER      ZD100850
                          STO     COREL     CORE SIZE.                  ZD100860
                          MDX     CORE1     RET TO TRY AGAIN            ZD100870
                    *                                                   ZD100880
                    *CONSTANTS AND BUFFER AREA                          ZD100890
                    *                                                   ZD100900
                    INTA4 DC      INT4      ADDR  OF 1403 PRINTER       ZD100910
                    *                       *INTRPT ROUTINE             ZD100920
                    D4096 DC      /1000     CONSTANT  OF 4K = 4096      ZD100930
                    TWLVE EQU     12        ADDR  OF INTRPT LEVEL 4 WD  ZD100940
                    INTAD DC      INT                                   ZD100950
                    *                       INTERUPT ROUTINE            ZD100960
                    NINE  EQU     9         ADDR OF INTRPT LEVEL 1 WRD  ZD100970
                          BSS  E  0                                     ZD100980
                    SPAC3 DC      1         IOCC  TO SPACE 1403         ZD100990
                          DC      /AC00     *PRINTER                    ZD101000
                    SENS3 DC      0         IOCC  TO SENSE 1403         ZD101010
                          DC      /AF01     *PRINTER                    ZD101020
                    SENS2 DC      /F000     IOCC TO SENSE 1132 PRINTER  ZD101030
                          DC      /3701     *WITH RESET                 ZD101040
                    SPACE DC      /C500     IOCC TO SPACE 1132          ZD101050
                          DC      /3401     *PRINTER                    ZD101060
                    COREL DC      /1001     CORE LOC BUFFER(NOW 4097)   ZD101070
                    D256  DC      256       NO. OF LINES FOR ADDING 4K  ZD101080
                    PACK  DC      0         TEMPORARY STG FOR TEST WD   ZD101090
                    *                                                   ZD101100
                    *TEST FOR WHICH PRINTER IS ON SYSTEM,1403 OR 1132   ZD101110
                    *IFBOTH ARE ON SYSTEM AND BOTH ARE READY,DUMP IS    ZD101120
                    *ON 1403.                                           ZD101130
                    *                                                   ZD101140
                    PTEST XIO     SENS3     CHK 1403 PRINTER READY      ZD101150
                          BSC     E         YES, SKIP                   ZD101160
                          MDX     PT010     NO, GO CHK 1132 PRINTER     ZD101170
                    STSPC XIO     SPAC3     ONE  SPACE ON 1403          ZD101180
                          XIO     SENS3     SENSE  FOR CARRIAGE BUSY    ZD101190
                          SRA     2                                     ZD101200
                          BSC  L  D1403,E   BUSY ,START DUMP ON 1403    ZD101210
                    PT010 XIO     SENS2     NOT  BUSY ,CHECK 1132 READY ZD101220
                          SLA     5         NO READY BIT TO SIGN BIT    ZD101230
                          BSC  L  PTEST,+Z  IF  NOT RDY RET TO 1403     ZD101240
                          XIO     SPACE     TEST 1132 READY, DO 1 SPACE ZD101250
                          XIO     SENS2     TEST  1132 BUSY             ZD101260
                          SLA     3         CARRIAGE  BUSY TO SIGN BIT  ZD101270
                          BSC  L  D1132,+Z  BUSY, START DUMP ON 1132    ZD101280
                          MDX     PTEST     NOT  BUSY,BACK TO 1403 TEST ZD101290
                    *                                                   ZD101300
                    *SET A SWITCH TO INDICATE O/P DEVICE,AND PREPARE    ZD101310
                    *TO GO TO LOADER TO GET SECOND PHASE                ZD101320
                    *                                                   ZD101330
                    D1132 STO   3 PRNSW     SET  1132 SWITCH NON-ZERO   ZD101340
                    LOOP1 XIO     SENS2     LOOP UNTIL 1132             ZD101350
                          SLA     3         HAS FINISHED SPACING        ZD101360
                          BSC  L  LOOP1,+Z                              ZD101370
                          MDX     NXTLD     PREPARE TO RET TO LOADER    ZD101380
                    D1403 SRA     16        SET  SWITCH TO DUMP ON      ZD101390
                          STO   3 PRNSW     *1403 PRINTER               ZD101400
                    LOOP2 XIO     SENS3     LOOP UNTIL 1403             ZD101410
                          SLA     13        *FINISHES                   ZD101420
                          BSC  L  LOOP2,+Z  *SPACING                    ZD101430
                    NXTLD LD      H74       SET UP NEXT PHASE           ZD101440
                          STO     BRAD      BRANCH ADDRESS              ZD101450
                          LD      H4F                                   ZD101460
                          STO     ADRSS     AND LOAD ADDR-/25.          ZD101470
                          LD      CDNO      SET UP NO. OF CARDS         ZD101480
                          STO     NOCDX     *LOADER IS TO READ          ZD101490
                          LD      SAV9                                  ZD101500
                          STO   3 NINE      RESTORE INTRPT LEVEL 1 WD   ZD101510
                          LD      SAV12                                 ZD101520
                          STO   3 TWLVE     RESTORE INTRPT LEVEL 4 WD   ZD101530
                          MDX     LOAD      LD. NXT.PH.OF DUMP PROGRAM  ZD101540
                    *                                                   ZD101550
                    *CONSTANTS AND BUFFER AREA                          ZD101560
                    *                                                   ZD101570
                    H74   DC      /74       BR ADDR OF SECOND PHASE     ZD101580
                    H4F   DC      /4F       LOAD ADDR MINUS /25         ZD101590
                    CTR1  DC      227       LINE  COUNT                 ZD101600
                    SAV9  DC      0         BUFFER TO SAVE WD 9         ZD101610
                    SAV12 DC      0         BUFFER TO SAVE WD 12        ZD101620
                    CDNO  DC      9         NO. CDS TO LD,SECOND PHASE  ZD101630
                    *                                                   ZD101640
                    * BOOTSTRAP ADDRESSES                               ZD101650
                    *                                                   ZD101660
                    BRAD  EQU     /55       BRANCH ADDRESS              ZD101670
                    LOAD  EQU     /57       RETURN  TO LOADER           ZD101680
                    NOCDX EQU     /6D       ADDR OF NO. CDS TO LD       ZD101690
                    ADRSS EQU     /6E       LOAD  ADDRESS               ZD101700
                    CTR   EQU     /0004     ADDR OF NO. OF LINES TO PR  ZD101710
                    PRNSW EQU     /26       PTR SW(0=1403,OTHER=1132)   ZD101720
                    *                                                   ZD101730
                    * 1403 PRINTER INTERRUPT ROUTINE                    ZD101740
                    *                                                   ZD101750
                    INT4  DC      0         ADDR OF RET TO LOADER       ZD101760
                          STO     SAV       SAVE ACC                    ZD101770
                          XIO     SENS3     SENSE  WITH RESET           ZD101780
                          LD      SAV       RESTORE ACC                 ZD101790
                          BOSC I  INT4      TURN OFF INTRPT LEVEL,RET   ZD101800
                    SAV   EQU     PTEST     TEMPORARY STG FOR ACC       ZD101810
                    *                                                   ZD101820
                    *  1132 PRINTER INTERRUPT ROUTINE                   ZD101830
                    *                                                   ZD101840
                    INT   DC      1         SAVE RETURN ADDRESS         ZD101850
                          XIO     SENS2     SENSE DEVICE WITH RESET     ZD101860
                          BOSC I  INT       TURN OFF INTRPT LEVEL,RET   ZD101870
                          END     START                                 ZD101880
