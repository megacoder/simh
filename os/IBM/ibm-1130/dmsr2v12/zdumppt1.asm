                    *************************************************** ZD300010
                    *                                                 * ZD300020
                    *STATUS- VERSION 2, MODIFICATION 0                * ZD300030
                    *                                                 * ZD300040
                    *FUNCTION/OPERATION-                              * ZD300050
                    *   THIS PAPER TAPE SYSTEM PROGRAM LOADS THE      * ZD300060
                    *   1403/1132 STAND-ALONE DUMP PROGRAM INTO LOCA- * ZD300070
                    *   TION /40.  THIS PAPER TAPE LOADER IS PUT INTO * ZD300080
                    *   CORE BY MEANS OF THE IPL KEY.                 * ZD300090
                    *                                                 * ZD300100
                    *ENTRY POINTS- N/A                                * ZD300110
                    *                                                 * ZD300120
                    *INPUT- N/A                                       * ZD300130
                    *                                                 * ZD300140
                    *OUTPUT-                                          * ZD300150
                    *   * THE STAND-ALONE DUMP PROGRAM IS READ FROM   * ZD300160
                    *     PAPER TAPE INTO CORE STARTING AT LOCATION   * ZD300170
                    *     /40.                                        * ZD300180
                    *   * INDEX REGISTERS,THE A AND Q REGISTERS,AND   * ZD300190
                    *     THE STATUS ARE NOT SAVED OR RESTORED.  THE  * ZD300200
                    *     PROGRAM CAN ONLY BE USED VIA THE INITIAL    * ZD300210
                    *     PROGRAM LOAD KEY, SO IT IS ASSUMED THAT     * ZD300220
                    *     MACHINE STATUS IS IMMATERIAL TO THE USER.   * ZD300230
                    *                                                 * ZD300240
                    *EXTERNAL REFERENCES-                             * ZD300250
                    *   SUBROUTINES- N/A                              * ZD300260
                    *   COMMA/DCOM- N/A                               * ZD300270
                    *                                                 * ZD300280
                    *EXITS-                                           * ZD300290
                    *   NORMAL- BRANCH TO LOCATION /40 TO START DUMP. * ZD300300
                    *   ERROR- N/A                                    * ZD300310
                    *                                                 * ZD300320
                    *TABLES/WORK AREAS- N/A                           * ZD300330
                    *                                                 * ZD300340
                    *ATTRIBUTES- N/A                                  * ZD300350
                    *                                                 * ZD300360
                    *NOTES- N/A                                       * ZD300370
                    *                                                 * ZD300380
                    *************************************************** ZD300390
                          HDNG    PAPER TAPE STAND-ALONE DUMP LOADER    ZD300400
                          ABS                                           ZD300410
                          ORG     0                                     ZD300420
                    BUFR  LDX  L1 -374      SET NO. OF WDS TO READ      ZD300430
                          MDX     START     CONTINUE (2 FRAME CTR)      ZD300440
                    START LDX   2 2         SET FOR 2 FRAMES PER WD     ZD300450
                          XIO     SENSR     SENSE WITH RESET            ZD300460
                          SLA     5         IS READER READY             ZD300470
                          BSC  L  *-4,+Z    NO, CHK AGAIN               ZD300480
                          XIO     CNTL      YES,DO CONTROL FUNC         ZD300490
                          WAIT              WAIT FOR INTRPT             ZD300500
                    SENSR DC      0                                     ZD300510
                          DC      /1F01     IOCC TO SENSE,RESET         ZD300520
                    CNTL  DC      INTRP     1134 ILS ADDR (LOC 12)      ZD300530
                          DC      /1C00     CONTROL IOCC                ZD300540
                    READ  DC      BUFR                                  ZD300550
                          DC      /1A00     IOCC TO READ ONE FRAME      ZD300560
                    INTRP DC      0         INTRPT SERVICING PORTION    ZD300570
                          XIO     SENSR     RESET ANY BUSY INDRS        ZD300580
                          BOSC    +-Z       TURN OFF INTRPT & SKIP      ZD300590
                          NOP                                           ZD300600
                          XIO     READ      READ CHAR                   ZD300610
                          LD      BUFR      GET THE FRAME JUST READ     ZD300620
                          MDX   2 -1        IS IT THE FIRST HALF OF WD  ZD300630
                          MDX     FSTFR     YES,GO PUT IN Q REG         ZD300640
                          RTE     8         NO, PUT TOGETHER WD IN ACC  ZD300650
                          STO  L1 /1B6      STO WD OF TAPE              ZD300660
                          MDX   1 +1        POINT TO NEXT WD            ZD300670
                          MDX     START     RET TO GET NEXT WD          ZD300680
                          MDX     /40       DONE                        ZD300690
                    FSTFR SRT     24        FIRST FRAME--POSITION       ZD300700
                          MDX     START+1   RET TO GET SECOND FRAME     ZD300710
                          END     BUFR                                  ZD300720
