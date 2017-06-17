                    *************************************************** U4L00010
                    *                                                 * U4L00020
                    *   SUBROUTINE NAME-                              * U4L00030
                    *      FULL NAME- EBCDIC TO 1403 PRINTER CODE     * U4L00040
                    *         CONVERSION TABLE SUBROUTINE             * U4L00050
                    *      CODE NAME- EBPT3                           * U4L00060
                    *   PURPOSE- EBPT3 IS A TABLE OF PACKED 8-BIT     * U4L00070
                    *      1403 PRINTER CODES TO BE USED BY ZIPCO,    * U4L00080
                    *      THE SPEED CONVERSION ROUTINE.              * U4L00090
                    *   METHOD-                                       * U4L00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4L00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U4L00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4L00130
                    *   SPECIAL FEATURES- NON-EXECUTABLE              * U4L00140
                    *   ADDITIONAL INFORMATION-                       * U4L00150
                    *      ESTIMATED EXECUTION TIME- N/A              * U4L00160
                    *                                                 * U4L00170
                    *************************************************** U4L00180
                          HDNG    EBCDIC TO 1403 CONV TABLE FOR ZIPCO   U4L00190
                          ENT     EBPT3                                 U4L00200
                    EBPT3 DC      /7F7F      NO GRAPHIC   NUL           U4L00210
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00220
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00230
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00240
                          DC      /7F7F      NO GRAPHIC   PF            U4L00250
                          DC      /7F7F      NO GRAPHIC   HT            U4L00260
                          DC      /7F7F      NO GRAPHIC   LC            U4L00270
                          DC      /7F7F      NO GRAPHIC   DEL           U4L00280
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00290
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00300
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00310
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00320
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00330
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00340
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00350
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00360
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00370
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00380
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00390
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00400
                          DC      /7F7F      NO GRAPHIC   RES           U4L00410
                          DC      /7F7F      NO GRAPHIC   NL            U4L00420
                          DC      /7F7F      NO GRAPHIC   BS            U4L00430
                          DC      /7F7F      NO GRAPHIC   IDL           U4L00440
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00450
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00460
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00470
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00480
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00490
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00500
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00510
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00520
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00530
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00540
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00550
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00560
                          DC      /7F7F      NO GRAPHIC   BYP           U4L00570
                          DC      /7F7F      NO GRAPHIC   LF            U4L00580
                          DC      /7F7F      NO GRAPHIC   EOB           U4L00590
                          DC      /7F7F      NO GRAPHIC   PRE           U4L00600
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00610
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00620
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00630
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00640
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00650
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00660
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00670
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00680
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00690
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00700
                          DC      /7F7F      NO GRAPHIC                 U4L00710
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00720
                          DC      /7F7F      NO GRAPHIC   PN            U4L00730
                          DC      /7F7F      NO GRAPHIC   RS            U4L00740
                          DC      /7F7F      NO GRAPHIC   UC            U4L00750
                          DC      /7F7F      NO GRAPHIC   EOT           U4L00760
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00770
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00780
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00790
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00800
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00810
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00820
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00830
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00840
                          DC      /7F7F      (+ZERO)      (SPACE)       U4L00850
                          DC      /647F      A            NO GRAPHIC    U4L00860
                          DC      /257F      B            NO GRAPHIC    U4L00870
                          DC      /267F      C            NO GRAPHIC    U4L00880
                          DC      /677F      D            NO GRAPHIC    U4L00890
                          DC      /687F      E            NO GRAPHIC    U4L00900
                          DC      /297F      F            NO GRAPHIC    U4L00910
                          DC      /2A7F      G            NO GRAPHIC    U4L00920
                          DC      /6B7F      H            NO GRAPHIC    U4L00930
                          DC      /2C7F      I            NO GRAPHIC    U4L00940
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00950
                          DC      /7F6E      NO GRAPHIC   .             U4L00960
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L00970
                          DC      /7F57      NO GRAPHIC   (             U4L00980
                          DC      /7F6D      NO GRAPHIC   NO GRAPHIC    U4L00990
                          DC      /7F7F      NO GRAPHIC   LOGICAL OR    U4L01000
                          DC      /7F15      NO GRAPHIC   AMPERSAND     U4L01010
                          DC      /587F      J            NO GRAPHIC    U4L01020
                          DC      /197F      K            NO GRAPHIC    U4L01030
                          DC      /1A7F      L            NO GRAPHIC    U4L01040
                          DC      /5B7F      M            NO GRAPHIC    U4L01050
                          DC      /1C7F      N            NO GRAPHIC    U4L01060
                          DC      /5D7F      O            NO GRAPHIC    U4L01070
                          DC      /5E7F      P            NO GRAPHIC    U4L01080
                          DC      /1F7F      Q            NO GRAPHIC    U4L01090
                          DC      /207F      R            NO GRAPHIC    U4L01100
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01110
                          DC      /7F62      NO GRAPHIC   $             U4L01120
                          DC      /7F23      NO GRAPHIC   *             U4L01130
                          DC      /7F2F      NO GRAPHIC   )             U4L01140
                          DC      /7F7F      NO GRAPHIC   ;             U4L01150
                          DC      /7F7F      NO GRAPHIC   LOGICAL NOT   U4L01160
                          DC      /7F61      NO GRAPHIC   -             U4L01170
                          DC      /7F4C      NO GRAPHIC   /             U4L01180
                          DC      /0D7F      S            NO GRAPHIC    U4L01190
                          DC      /0E7F      T            NO GRAPHIC    U4L01200
                          DC      /4F7F      U            NO GRAPHIC    U4L01210
                          DC      /107F      V            NO GRAPHIC    U4L01220
                          DC      /517F      W            NO GRAPHIC    U4L01230
                          DC      /527F      X            NO GRAPHIC    U4L01240
                          DC      /137F      Y            NO GRAPHIC    U4L01250
                          DC      /547F      Z            NO GRAPHIC    U4L01260
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01270
                          DC      /7F16      NO GRAPHIC   ,             U4L01280
                          DC      /7F7F      NO GRAPHIC   %             U4L01290
                          DC      /7F7F      NO GRAPHIC   UNDERSCORE    U4L01300
                          DC      /7F7F      NO GRAPHIC   >             U4L01310
                          DC      /7F7F      NO GRAPHIC   ?             U4L01320
                          DC      /497F      0            NO GRAPHIC    U4L01330
                          DC      /407F      1            NO GRAPHIC    U4L01340
                          DC      /017F      2            NO GRAPHIC    U4L01350
                          DC      /027F      3            NO GRAPHIC    U4L01360
                          DC      /437F      4            NO GRAPHIC    U4L01370
                          DC      /047F      5            NO GRAPHIC    U4L01380
                          DC      /457F      6            NO GRAPHIC    U4L01390
                          DC      /467F      7            NO GRAPHIC    U4L01400
                          DC      /077F      8            NO GRAPHIC    U4L01410
                          DC      /087F      9            NO GRAPHIC    U4L01420
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01430
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01440
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01450
                          DC      /7F0B      NO GRAPHIC   '             U4L01460
                          DC      /7F4A      NO GRAPHIC   =             U4L01470
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4L01480
                          END                                           U4L01490
