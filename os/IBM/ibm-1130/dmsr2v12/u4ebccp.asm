                    *************************************************** U4I00010
                    *                                                 * U4I00020
                    *   SUBROUTINE NAME-                              * U4I00030
                    *      FULL NAME- EBCDIC TO CONSOLE PRINTER CODE  * U4I00040
                    *         CONVERSION TABLE SUBROUTINE.            * U4I00050
                    *      CODE NAME-EBCCP                            * U4I00060
                    *   PURPOSE- EBCCP IS A TABLE OF PACKED 8-BIT     * U4I00070
                    *      CONSOLE PRINTER CODES TO BE USED BY        * U4I00080
                    *      ZIPCO,THE SPEED CONVERSION ROUTINE.        * U4I00090
                    *   METHOD-                                       * U4I00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4I00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U4I00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4I00130
                    *   SPECIAL FEATURES- NON-EXECUTABLE              * U4I00140
                    *   ADDITIONAL INFORMATION-                       * U4I00150
                    *      ESTIMATED EXECUTION TIME- N/A              * U4I00160
                    *                                                 * U4I00170
                    *************************************************** U4I00180
                          HDNG    EBCDIC TO CP CONV TABLE FOR ZIPCO     U4I00190
                          ENT     EBCCP                                 U4I00200
                    EBCCP DC      /2121      NO GRAPHIC   NULL          U4I00210
                          DC      /2121      NO GRAPHIC   NULL          U4I00220
                          DC      /2121      NO GRAPHIC   NULL          U4I00230
                          DC      /2121      NO GRAPHIC   NULL          U4I00240
                          DC      /2121      NO GRAPHIC   PF            U4I00250
                          DC      /2141      NO GRAPHIC   HT            U4I00260
                          DC      /2121      NO GRAPHIC   LC            U4I00270
                          DC      /2121      NO GRAPHIC   DEL           U4I00280
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00290
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00300
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00310
                          DC      /2121      NO GRAPHIC                 U4I00320
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00330
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00340
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00350
                          DC      /2121      NO GRAPHIC                 U4I00360
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00370
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00380
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00390
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00400
                          DC      /2105      NO GRAPHIC   RES           U4I00410
                          DC      /2181      NO GRAPHIC   NL            U4I00420
                          DC      /2111      NO GRAPHIC   BS            U4I00430
                          DC      /2121      NO GRAPHIC   IDL           U4I00440
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00450
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00460
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00470
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00480
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00490
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00500
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00510
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00520
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00530
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00540
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00550
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00560
                          DC      /2121      NO GRAPHIC   BYP           U4I00570
                          DC      /2103      NO GRAPHIC   LF            U4I00580
                          DC      /2121      NO GRAPHIC   EOB           U4I00590
                          DC      /2121      NO GRAPHIC   PRE           U4I00600
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00610
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00620
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00630
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00640
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00650
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00660
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00670
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00680
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00690
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00700
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00710
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00720
                          DC      /2121      NO GRAPHIC   PN            U4I00730
                          DC      /2109      NO GRAPHIC   RS            U4I00740
                          DC      /2121      NO GRAPHIC   UC            U4I00750
                          DC      /2121      NO GRAPHIC   EOT           U4I00760
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00770
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00780
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00790
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00800
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00810
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00820
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00830
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I00840
                          DC      /2121      (+ZERO)      (SPACE)       U4I00850
                          DC      /3C21      A            NO GRAPHIC    U4I00860
                          DC      /1821      B            NO GRAPHIC    U4I00870
                          DC      /1C21      C            NO GRAPHIC    U4I00880
                          DC      /3021      D            NO GRAPHIC    U4I00890
                          DC      /3421      E            NO GRAPHIC    U4I00900
                          DC      /1021      F            NO GRAPHIC    U4I00910
                          DC      /1421      G            NO GRAPHIC    U4I00920
                          DC      /2421      H            NO GRAPHIC    U4I00930
                          DC      /2021      I            NO GRAPHIC    U4I00940
                          DC      /2102      NO GRAPHIC   ¢             U4I00950
                          DC      /2100      NO GRAPHIC   .             U4I00960
                          DC      /21DE      NO GRAPHIC   <             U4I00970
                          DC      /21FE      NO GRAPHIC   (             U4I00980
                          DC      /21DA      NO GRAPHIC   +             U4I00990
                          DC      /21C6      NO GRAPHIC   LOGICAL OR    U4I01000
                          DC      /2144      (-ZERO)      AND           U4I01010
                          DC      /7C21      J            NO GRAPHIC    U4I01020
                          DC      /5821      K            NO GRAPHIC    U4I01030
                          DC      /5C21      L            NO GRAPHIC    U4I01040
                          DC      /7021      M            NO GRAPHIC    U4I01050
                          DC      /7421      N            NO GRAPHIC    U4I01060
                          DC      /5021      O            NO GRAPHIC    U4I01070
                          DC      /5421      P            NO GRAPHIC    U4I01080
                          DC      /6421      Q            NO GRAPHIC    U4I01090
                          DC      /6021      R            NO GRAPHIC    U4I01100
                          DC      /2142      NO GRAPHIC   !             U4I01110
                          DC      /2140      NO GRAPHIC   $             U4I01120
                          DC      /21D6      NO GRAPHIC   *             U4I01130
                          DC      /21F6      NO GRAPHIC   )             U4I01140
                          DC      /21D2      NO GRAPHIC   ;             U4I01150
                          DC      /21F2      NO GRAPHIC   LOGICAL NOT   U4I01160
                          DC      /2184      NO GRAPHIC   -             U4I01170
                          DC      /21BC      NO GRAPHIC   /             U4I01180
                          DC      /9821      S            NO GRAPHIC    U4I01190
                          DC      /9C21      T            NO GRAPHIC    U4I01200
                          DC      /B021      U            NO GRAPHIC    U4I01210
                          DC      /B421      V            NO GRAPHIC    U4I01220
                          DC      /9021      W            NO GRAPHIC    U4I01230
                          DC      /9421      X            NO GRAPHIC    U4I01240
                          DC      /A421      Y            NO GRAPHIC    U4I01250
                          DC      /A021      Z            NO GRAPHIC    U4I01260
                          DC      /2121      NO GRAPHIC   NO GRAPHIC    U4I01270
                          DC      /2180      NO GRAPHIC   ,             U4I01280
                          DC      /2106      NO GRAPHIC   %             U4I01290
                          DC      /21BE      NO GRAPHIC   UNDERSCORE    U4I01300
                          DC      /2146      NO GRAPHIC   >             U4I01310
                          DC      /2186      NO GRAPHIC   ?             U4I01320
                          DC      /C421      0            NO GRAPHIC    U4I01330
                          DC      /FC21      1            NO GRAPHIC    U4I01340
                          DC      /D821      2            NO GRAPHIC    U4I01350
                          DC      /DC21      3            NO GRAPHIC    U4I01360
                          DC      /F021      4            NO GRAPHIC    U4I01370
                          DC      /F421      5            NO GRAPHIC    U4I01380
                          DC      /D021      6            NO GRAPHIC    U4I01390
                          DC      /D421      7            NO GRAPHIC    U4I01400
                          DC      /E421      8            NO GRAPHIC    U4I01410
                          DC      /E021      9            NO GRAPHIC    U4I01420
                          DC      /2182      NO GRAPHIC   :             U4I01430
                          DC      /21C0      NO GRAPHIC   #             U4I01440
                          DC      /2104      NO GRAPHIC   @             U4I01450
                          DC      /21E6      NO GRAPHIC   '             U4I01460
                          DC      /21C2      NO GRAPHIC   =             U4I01470
                          DC      /21E2      NO GRAPHIC   QUOTE         U4I01480
                          END                                           U4I01490
