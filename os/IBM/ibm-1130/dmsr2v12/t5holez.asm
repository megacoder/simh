                          HDNG    HOLEZ                                 T5D00020
                          LIBR                                          T5D00030
                          ENT     HOLEZ                                 T5D00040
                    *************************************************** T5D00050
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * T5D00060
                    *                                                 * T5D00070
                    *FUNCTION/OPERATION-                              * T5D00080
                    *   THIS SUBROUTINE IS USED BY FORTRAN I/O        * T5D00090
                    *   SUBROUTINES TO CONVERT FROM EBC TO HOLLERITH  * T5D00100
                    *   CODE OR VICE-VERSA. THIS IS DONE BY A TABLE   * T5D00110
                    *   LOOKUP METHOD                                 * T5D00120
                    *                                                 * T5D00130
                    *ENTRY POINTS-                                    * T5D00140
                    *   * HOLEZ-ENTERED BY A LIBF HOLEZ               * T5D00150
                    *                                                 * T5D00160
                    *INPUT-                                           * T5D00170
                    *   * XR1 CONTAINS THE I/O BUFFER ADDRESS         * T5D00180
                    *   * XR2 CONTAINS THE CHARACTER COUNT            * T5D00190
                    *   * ACC CONTAINS A 0 OR 2. 0 MEANS A READ       * T5D00200
                    *     CONVERSION FROM HOLL TO EBC. 2 MEANS A PUNCH* T5D00210
                    *     CONVERSION FROM EBC TO HOLLERITH AND IS USED* T5D00220
                    *     BY THE PROGRAM.                             * T5D00230
                    *                                                 * T5D00240
                    *OUTPUT-THE I/O BUFFER IN CONVERTED FORMAT        * T5D00250
                    *                                                 * T5D00260
                    *EXTERNAL REFERENCES-                             * T5D00270
                    *   * GETAD-A ROUTINE TO GET EFFECTIVE ADDR OF TBL* T5D00280
                    *   * HOLTB-HOLLERITH TO EBC TABLE                * T5D00290
                    *   * EBCTB-EBC TO HOLLERITH TABLE                * T5D00300
                    *                                                 * T5D00310
                    *EXITS-                                           * T5D00320
                    *   NORMAL-                                       * T5D00330
                    *      * HOLEZ+1-RETURNS TO CALLING SUBROUTINE    * T5D00340
                    *   ERROR -                                       * T5D00345
                    *      * IF INVALID CHARACTERS APPEAR IN THE INPUT* T5D00350
                    *      * RECORD THE ROUTINE WILL CONVERT THEM TO  * T5D00355
                    *      * EBC BLANKS                               * T5D00360
                    *                                                 * T5D00365
                    *TABLES/WORK AREAS-N/A                            * T5D00370
                    *                                                 * T5D00380
                    *ATTRIBUTES-RELOCATABLE                           * T5D00390
                    *                                                 * T5D00400
                    *NOTES-N/A                                        * T5D00410
                    *                                                 * T5D00420
                    *************************************************** T5D00430
                          HDNG    HOLEZ                                 T5D00440
                    *                                                   T5D00450
                    *             INITALIZATION PHASE                   T5D00460
                    *                                                   T5D00470
                    HOLEZ MDX     *+2        ENTRY                      T5D00480
                          BSC  I  *-*        EXIT                       T5D00490
                          STO     HZ903      SAVE READ/PUNCH INDICATOR  T5D00500
                          STX   2 HZ902      SAVE COUNT TO CONVERT      T5D00510
                          LDD     HZ903+1    SET UP TABLE ENTRIES       T5D00520
                          MDX  L  HZ903,0    CHECK FOR READ OR PUNCH    T5D00530
                          RTE     16         PUNCH, CONVERT EBC TO HOLL T5D00540
                          STD     HZ903+3    SAVE CONVERSION TBL ORDER  T5D00550
                          LIBF    GETAD      GET ADDRESS OF TABLE       T5D00560
                          STO     HZ100+1    SAVE ADDRESS OF TABLE      T5D00570
                          LD      HZ903+4    GET ADDRESS OF OTHER       T5D00580
                          LIBF    GETAD      *TABLE                     T5D00590
                          STO     HZ300+1    SAVE ADDRESS OF OTHER TBL  T5D00600
                    *                                                   T5D00610
                    *             SCAN TABLES AND CONVERT DATA          T5D00620
                    *                                                   T5D00630
                          LDX   2 -53        SET TABLE SIZE             T5D00640
                    HZ100 LD   L2 *-*        GET CHAR FROM TABLE        T5D00650
                          MDX  L  HZ903,0    TEST IF READ OR WRITE      T5D00660
                          SRA     8          SHIFT CHAR IF EBC WRITE    T5D00670
                          EOR   1 0          COMPARE TO BUFFER CHAR     T5D00680
                          BSC  L  HZ300,+-   BRANCH IF EQUAL            T5D00690
                          MDX   2 1          INCREMENT TABLE COUNTER    T5D00700
                          MDX     HZ100      CHECK NXT CHAR IN TBL      T5D00710
                          LD      HZ901      NO MATCH, LD ASTERISK      T5D00720
                          MDX  L  HZ903,0    TEST IF WRITE INSTRUCTION  T5D00730
                          SRA     16         IF READ, SET CHAR TO 0     T5D00740
                    *                                                   T5D00750
                    *             SAVE CHARACTER, PROCESS NEXT ONE      T5D00760
                    *                                                   T5D00770
                    HZ200 STO   1 0          SAVE CHARACTER IN BUFR     T5D00780
                          MDX   1 1          INCR BUFFER POINTER        T5D00790
                          MDX  L  HZ902,-1   DECR COUNT OF CHARS BY ONE T5D00800
                          MDX     HZ100-1    CNT NOT DONE, CONVERT NEXT T5D00810
                    *             ALL CHARACTERS CONVERTED. IF PUNCH    T5D00820
                    *             OUTPUT REQUIRED INSERT STOP CHARACTER T5D00830
                    *             AND SAVE IN BUFFER. STOP CHAR =/4     T5D00840
                    *                                                   T5D00850
                          LD      HZ903      LD READ/PUNCH INDR.        T5D00860
                    *************************************************** T5D00870
                    *             NOTE---PUNCH INDR MUST =2 BECAUSE OF  T5D00880
                    *             FOLLOWING CODING                      T5D00890
                    *                                                   T5D00900
                    *************************************************** T5D00910
                          SLA     2          MULT BY 2                  T5D00920
                          OR    1 -1         ADD TO LAST WD OF BUFFER   T5D00930
                          STO   1 -1         SAVE IN BUFFER             T5D00940
                          MDX     HOLEZ+1    EXIT FROM ROUTINE          T5D00950
                    *                                                   T5D00960
                    *             MATCH FOUND, GET CHAR FROM OTHER TBL  T5D00970
                    *             AND PUT IN BUFFER                     T5D00980
                    *                                                   T5D00990
                    HZ300 LD   L2 *-*        GET CHAR FROM TABLE        T5D01000
                          MDX  L  HZ903,0    TEST FOR PUNCH O/P         T5D01010
                          MDX     HZ200      PUNCH, GO SAVE O/P         T5D01020
                          SRA     8          READ-SHIFT EBC CHAR        T5D01030
                          MDX     HZ200      GO STORE SHIFTED CHAR      T5D01040
                    *                                                   T5D01050
                    *             CONSTANTS                             T5D01060
                    *                                                   T5D01070
                    HZ901 DC      /005C     EBCDIC ASTERISK         212 T5D01080
                          BSS  E  0                                     T5D01090
                    HZ902 DC      0          COUNT OF CHARS             T5D01100
                    HZ903 DC      0          READ/PUNCH INDR            T5D01110
                          LIBF    HOLTB      HOLL CONVERSION TABLE      T5D01120
                          LIBF    EBCTB      EBC CONVERSION TABLE       T5D01130
                          DC      0          TABLE TO BE CONVERTED FROM T5D01140
                          DC      0          TABLE TO BE CONVERTED TO   T5D01150
                          END                                           T5D01160
