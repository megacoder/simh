                          HDNG    DIRECT TABLE ACCESS CONVERSION        U3I00010
                    *************************************************** U3I00020
                    *                                                 * U3I00030
                    *  STATUS-VERSION 2, MODIFICATION 10              * U3I00040
                    *                                                 * U3I00050
                    *  FUNCTION -                                     * U3I00060
                    *  ZIPCO IS A SPEEDY DIRECT TABLE ACCESS CONV     * U3I00070
                    *  ROUTINE.  CODES ARE ACCEPTED THROUGH THE       * U3I00080
                    *  INPUT BFR IN EITHER PACKED OR UNPACKED FORMAT. * U3I00090
                    *  12-BIT HOL MAY BE ENTERED AND WILL BE PACKED   * U3I00100
                    *  TO 8-BITS BEFORE CONV. ALL HOL OUTPUT WILL BE  * U3I00110
                    *  UNPACKED TO 12-BITS. CONV CODES ARE TRANS      * U3I00120
                    *  TO THE OUTPUT BFR IN EITHER PACKED OR UNPCKED  * U3I00130
                    *  FORMAT                                         * U3I00140
                    *                                                 * U3I00150
                    *  ENTRY POINTS - ZIPCO                           * U3I00160
                    *    CALLING SEQUENCE -  LIBF    ZIPCO            * U3I00170
                    *                        DC      CONTROL          * U3I00180
                    *                        DC      INPUT            * U3I00190
                    *                        DC      OUTPUT           * U3I00200
                    *                        DC      CHAR CNT         * U3I00210
                    *                        CALL    TABLE            * U3I00220
                    *                                                 * U3I00230
                    *  INPUT - A CONTROL WRD, THE ADDR OF THE INPUT   * U3I00240
                    *      BFR, OUTPUT BFR, AND CONV TABLE, AND THE   * U3I00250
                    *      CHAR COUNT                                 * U3I00260
                    *                                                 * U3I00270
                    *  OUTPUT - THE CONV CHAR                         * U3I00280
                    *                                                 * U3I00290
                    *  EXTERNAL REFERENCES - THE CONV TABLE (SUBR)    * U3I00300
                    *                                                 * U3I00310
                    *  EXIT - NORMAL AT ZIP70                         * U3I00320
                    *          ERROR - NONE                           * U3I00330
                    *                                                   U3I00340
                    *  ATTRIBUTES - REUSABLE                          * U3I00350
                    *                                                 * U3I00360
                    *  NOTES - NO ERRORS ARE DETECTED BY THIS ROUTINE * U3I00370
                    *                                                 * U3I00380
                    *************************************************** U3I00390
                          HDNG    DIRECT TABLE ACCESS CONVERSION        U3I00400
                          LIBR                                          U3I00410
                          ENT     ZIPCO                                 U3I00420
                    ZIPCO STX   1 SAV1+1     SAVE XR1                   U3I00430
                          LDX  I1 *-*        RECORD ENTRY               U3I00440
                          STX   2 SAV2+1     SAVE XR2                   U3I00450
                          SLT     32         CLEAR ACC & EXT            U3I00460
                          STO     HALF       INITIALIZE TO LEFT HALF    U3I00470
                    *                                                 * U3I00480
                          LD    1 0          FETCH CONTROL WORD         U3I00490
                          RTE     16         TO EXTENSION               U3I00500
                    *                                                 * U3I00510
                          SLT     4          IS INPUT HOLLERITH         U3I00520
                          STO     HOLIN      YES, SET HOLLERITH SWITCH  U3I00530
                    *                                                 * U3I00540
                          SLT     4          IS INPUT PACKED            U3I00550
                          STO     PCKIN      YES, SET PACKED INPUT SW   U3I00560
                          SLA     16         CLEAR ACC                  U3I00570
                          SLT     4          IS OUTPUT HOLLERTH         U3I00580
                          STO     HOLLO      YES, SET HOLL SWITCH       U3I00590
                    *                                                 * U3I00600
                          SLT     4          IS OUTPUT PACKED           U3I00610
                          STO     PKOUT      YES, SET PACKED OUTPUT SW  U3I00620
                    *                                                 * U3I00630
                          LD    1 1                                     U3I00640
                          STO     ZIP10+1    SET UP INPUT ADDR          U3I00650
                    *                                                 * U3I00660
                          LD    1 2                                     U3I00670
                          STO     ZIP50+1    SET UP OUTPUT ADDR         U3I00680
                    *                                                 * U3I00690
                          LD    1 3                                     U3I00700
                          STO     WDCNT      SET UP CHAR CNT            U3I00710
                    *                                                 * U3I00720
                          LD   I1 5          FETCH ADDR FROM LIBF       U3I00730
                          STO     ZIP25+1    SET UP TABLE ADDR          U3I00740
                    *                                                 * U3I00750
                          MDX   1 6                                     U3I00760
                          STX   1 ZIP70+1    SET FOR RETURN             U3I00770
                          LD      WDCNT     CHECK IF WD CNT IS     2-10 U3I00772
                          BSC  L  SAV2,+    *POSITIVE              2-10 U3I00774
                    *                                                 * U3I00780
                    *                                                 * U3I00790
                          SLT     32         CLEAR ACC & EXT            U3I00800
                    ZIP10 LD   L  *-*        FETCH CHAR                 U3I00810
                          RTE     16         PUT CHAR IN EXTENSION      U3I00820
                    ZIP15 SLT     1          CHK THE 0 BIT AND          U3I00830
                          STO     CASE       SET UP CASE SHIFT          U3I00840
                    *                                                 * U3I00850
                          SLA     16         CLEAR ACC                  U3I00860
                    *                                                 * U3I00870
                          MDX  L  HOLIN,0    IS INPUT HOLLERITH         U3I00880
                          MDX     ZIP90      YES, GO TO PACK IT         U3I00890
                    ZIP20 SLT     7          NO, FETCH REST OF WORD     U3I00900
                          STO     TEMP1      SET CHAR IN TEMP           U3I00910
                    *                                                 * U3I00920
                          LDX  I1 TEMP1     INPUT CODE TO XR1           U3I00930
                    ZIP25 LD   L1 *-*       FETCH CONVERTED CHAR        U3I00940
                    *                                                 * U3I00950
                          MDX  L  CASE,0    CHECK CASE SW               U3I00960
                          MDX     ZIP30-1   SKIP TO GET LEFT HALF       U3I00970
                          SLA     8         LEFT JUSTIFY RT HALF        U3I00980
                          MDX     ZIP30     SKIP TO SAVE RESULT         U3I00990
                    *                                                   U3I01000
                    HOLIN DC      0         HOLLERITH INPUT SW          U3I01010
                    PCKIN DC      0         PACKED INPUT SW             U3I01020
                    HOLLO DC      0         HOLLERITH OUTPUT SW         U3I01030
                    PKOUT DC      0         PACKED OUTPUT SW            U3I01040
                    HALF  DC      0         LEFT/RIGHT INDR             U3I01050
                    WDCNT DC      *-*       CHAR CNT               2-10 U3I01055
                    *                                                 * U3I01060
                          AND     HFF00     FETCH LEFT HALF             U3I01070
                    ZIP30 STO     TEMP1     SAVE RESULT                 U3I01080
                    *                                                 * U3I01090
                          LD      ONE                                   U3I01100
                          MDX  L  HALF,0    CHK THE LEFT/RT HALF SW     U3I01110
                          SLA     16                  AND               U3I01120
                          STO     HALF      REVERSE ITS SETTING         U3I01130
                    *                                                 * U3I01140
                          LD      TEMP1     YES,CHK HALF SW             U3I01150
                          MDX  L  PKOUT,0   IS OUTPUT TO BE PACKED      U3I01160
                          MDX     ZIP40+2   NO, GO TO OUTPUT CONVERTED  U3I01170
                    *                                                 * U3I01180
                          MDX  L  HALF,0    CHECK SETTING               U3I01190
                          MDX     *+1       SKIP IF LEFT                U3I01200
                          MDX     ZIP40     BR ON RT                    U3I01210
                          STO     TEMP2     SET UP IN TEMP BUFFER       U3I01220
                          MDX  L  WDCNT,-1  DECR CHAR COUNT         2-1 U3I01221
                          MDX     ZIP80     GO TO CONVERT MORE      2-1 U3I01222
                          LD   I  ZIP50+1   LOAD WORD IN OUTPUT AREA2-1 U3I01223
                          AND     H00FF     SAVE RIGHT HALF         2-1 U3I01224
                          OR      TEMP2     COMBINE TO ONE WORD     2-1 U3I01225
                          MDX     ZIP50     GO TO OUTPUT ONE WORD   2-1 U3I01226
                    *                                                 * U3I01240
                    ZIP40 SRA     8         RIGHT JUSTIFY CHARACTER     U3I01250
                          OR      TEMP2     OR WITH PREVIOUS CHAR       U3I01260
                    *                                                 * U3I01270
                          MDX  L  HOLLO,0   IS OUTPUT HOLLERITH         U3I01280
                          MDX     ZIP95     YES, GO TO UNPACK IT        U3I01290
                    *                                                   U3I01300
                    ZIP50 STO  L  *-*       OUTPUT THE CONVERTED CHAR   U3I01310
                          LD      ZIP50+1   INCREMENT              2-10 U3I01320
                          A       ONE       *OUTPUT ADDRESS        2-10 U3I01325
                          STO     ZIP50+1   *BY ONE                2-10 U3I01330
                          MDX  L  WDCNT,-1  DECR THE CHAR CNT           U3I01340
                          MDX     ZIP80     GO TO CONVERT MORE          U3I01350
                    *                                                 * U3I01360
                    *                                                 * U3I01390
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U3I01400
                    SAV1  LDX  L1 *-*       RESTORE XR1                 U3I01410
                    ZIP70 BSC  L  *-*       EXIT                        U3I01420
                    *                                                 * U3I01430
                    ZIP80 SLA     16        CLEAR ACC                   U3I01440
                          MDX  L  PCKIN,0   IS INPUT PACKED             U3I01450
                          MDX     ZIP85     NO,GO TO INCR IN ADDR       U3I01460
                          MDX  L  HALF,0    IS RT HALF ON - SKIP IF YES U3I01470
                          MDX     ZIP15     BR TO FETCH 2ND HALF        U3I01480
                    *                                                   U3I01490
                    ZIP85 MDX  L  ZIP10+1,+1 INCR INPUT ADDR            U3I01500
                          MDX     ZIP10-1   GO TO FETCH NEXT CHAR       U3I01510
                    *                                                 * U3I01520
                    *************************************************** U3I01530
                    *                                                 * U3I01540
                    *  THIS MODULE OF ZIPCO PACKS 12 BIT HOLLERITH TO * U3I01550
                    *  8 BITS BY COMBINING THE 1 THRU 7 ROW PUNCHES   * U3I01560
                    *  INTO 3 BITS.                                   * U3I01570
                    *                                                 * U3I01580
                    *************************************************** U3I01590
                    ZIP90 SLT     2         PICK UP THE 11 AND 0 PUNCHS U3I01600
                          SLA     5         LEFT JUSTIFY                U3I01610
                          STO     TEMP3     TEMP SAVE                   U3I01620
                          SLA     16                                    U3I01630
                    *                                                 * U3I01640
                          SLT     7         FETCH 1-7 PUNCH             U3I01650
                          BSC  L  ZIP92,+-  BR ON ZERO PUNCH            U3I01660
                          LDX   2 15                                    U3I01670
                          SLCA  2 0         DETERMINE WHICH ROW PUNCH   U3I01680
                    *                                                 * U3I01690
                          MDX   2 -7        TAKE 2'S COMPLEMENT         U3I01700
                          NOP                                           U3I01710
                          STX   2 TEMP1     DECR COUNT                  U3I01720
                          SLA     16                                    U3I01730
                          S       TEMP1     ACTUAL VALUE IN 13-15       U3I01740
                    ZIP92 SLT     2         SHIFT IN 8 AND 9 PUNCH      U3I01750
                          OR      TEMP3     INCLUDE 11 AND 0 PUNCH      U3I01760
                    *                                                 * U3I01770
                          MDX     ZIP20+1   RET TO CONVERT HOLLERITH    U3I01780
                    *                                                 * U3I01790
                    *                                                 * U3I01800
                    *************************************************** U3I01810
                    *                                                 * U3I01820
                    *  THIS MODULE OF ZIPCO UNPACKS 8 BIT HOLLERITH TO* U3I01830
                    *  12 BITS BY EXPANDING 3 BITS TO 1-7 ROW PUNCH.  * U3I01840
                    *                                                 * U3I01850
                    *************************************************** U3I01860
                    ZIP95 RTE     16        SHIFT TO EXTENSION          U3I01870
                          STO     SAVQ      SAVE EXT                    U3I01880
                          SLA     16        CLEAR ACC                   U3I01890
                          SLT     3                                     U3I01900
                          SLA     13        LEFT JUSTIFY                U3I01910
                          STO     TEMP3     SAVE 12, 11, AND 0 PUNCHES  U3I01920
                    *                                                 * U3I01930
                          SLT     3         GET 1-7 PUNCHES             U3I01940
                          BSC  L  ZIP98+1,+-  BR IF ZERO                U3I01950
                          S       K13                                   U3I01960
                          STO     TEMP1     DETERMINE VALUE             U3I01970
                          SLA     16                                    U3I01980
                          S       TEMP1                                 U3I01990
                          STO     TEMP1     PUT SHIFT COUNT             U3I02000
                          LDX  I2 TEMP1     INTO XR2                    U3I02010
                    *                                                 * U3I02020
                          LD      ONE                                   U3I02030
                    ZIP98 SLA   2 0         SHIFT ONE BIT               U3I02040
                          OR      TEMP3     OR WITH 12, 11, AND 0 BITS  U3I02050
                          SRA     6                                     U3I02060
                          SLT     6         PICK UP 8 AND 9             U3I02070
                    *                                                 * U3I02080
                          RTE     16                                    U3I02090
                          LD      SAVQ      RESTORE THE EXTENSION       U3I02100
                          RTE     16                                    U3I02110
                    *                                                   U3I02120
                          MDX     ZIP50     RETURN TO OUTPUT HOLLERITH  U3I02130
                    *                                                 * U3I02140
                    *                                                 * U3I02150
                    *  FOLLOWING IS A PARTIAL TABLE OF CONSTANTS      * U3I02160
                    *  SWITCHES, AND STORAGE USED BY ZIPCO            * U3I02170
                    TEMP1 DC      0         TEMP STG                    U3I02190
                    TEMP2 DC      0         TEMP STG                    U3I02200
                    CASE  DC      0         CASE SHIFT SW               U3I02210
                    HFF00 DC      /FF00     CON FOR FETCH OF LEFT CHAR  U3I02220
                    ONE   DC      1         CONSTANT ONE                U3I02230
                    TEMP3 DC      0         TEMP STG                    U3I02240
                    K13   DC      13        CONSTANT 13                 U3I02250
                    SAVQ  DC      0         TEMP STG FOR EXTENSION      U3I02260
                    H00FF DC      /00FF     CON TO FETCH RIGHT HALF 2-1 U3I02265
                          END                                           U3I02275
