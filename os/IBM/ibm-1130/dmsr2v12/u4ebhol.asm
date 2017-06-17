                    *************************************************** U4J00010
                    *                                                 * U4J00020
                    *   SUBROUTINE NAME-                              * U4J00030
                    *      FULL NAME- EBCDIC TO HOLLERITH CONVERSION  * U4J00040
                    *         TABLE SUBROUTINE.                       * U4J00050
                    *      CODE NAME- EBHOL                           * U4J00060
                    *   PURPOSE- THIS TABLE IS USED BY ZIPCO IN A     * U4J00070
                    *      DIRECT TABLE ACCESS CONVERSION FROM        * U4J00080
                    *      EBCDIC TO HOLLERITH. THE HOLLERITH IS IN   * U4J00090
                    *      PACKED FORM,SO TWO CHARS FIT IN 1 WORD.    * U4J00100
                    *   METHOD-                                       * U4J00110
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4J00120
                    *   CAPABILITIES AND LIMITATIONS-                 * U4J00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4J00140
                    *   SPECIAL FEATURES- N/A                         * U4J00150
                    *   ADDITIONAL INFORMATION-                       * U4J00160
                    *      ESTIMATED EXECUTION TIME- N/A              * U4J00170
                    *                                                 * U4J00180
                    *************************************************** U4J00190
                          HDNG    EBCDIC TO HOL CONV TABLE FOR ZIPCO    U4J00200
                    *                                GRAPHICS         * U4J00210
                    *                        LFT HALF      RT HALF    * U4J00220
                          ENT     EBHOL                                 U4J00230
                    EBHOL DC      /A6A7      NO GRAPHIC   NO GRAPHIC    U4J00240
                          DC      /A485      NO GRAPHIC   NO GRAPHIC    U4J00250
                          DC      /A889      NO GRAPHIC   NO GRAPHIC    U4J00260
                          DC      /AC8D      NO GRAPHIC   NO GRAPHIC    U4J00270
                          DC      /B091      NO GRAPHIC   PNCH OFF      U4J00280
                          DC      /B495      NO GRAPHIC   HORIZ TAB     U4J00290
                          DC      /B899      NO GRAPHIC   LOWER CASE    U4J00300
                          DC      /BC9D      NO GRAPHIC   DELETE        U4J00310
                          DC      /A283      NO GRAPHIC   NO GRAPHIC    U4J00320
                          DC      /A187      NO GRAPHIC   NO GRAPHIC    U4J00330
                          DC      /AA8B      NO GRAPHIC   NO GRAPHIC    U4J00340
                          DC      /AE8F      NO GRAPHIC   NO GRAPHIC    U4J00350
                          DC      /B293      NO GRAPHIC   NO GRAPHIC    U4J00360
                          DC      /B697      NO GRAPHIC   NO GRAPHIC    U4J00370
                          DC      /BA9B      NO GRAPHIC   NO GRAPHIC    U4J00380
                          DC      /BE9F      NO GRAPHIC   NO GRAPHIC    U4J00390
                          DC      /C6C7      NO GRAPHIC   NO GRAPHIC    U4J00400
                          DC      /C445      NO GRAPHIC   NO GRAPHIC    U4J00410
                          DC      /C849      NO GRAPHIC   NO GRAPHIC    U4J00420
                          DC      /CC4D      NO GRAPHIC   RESTORE       U4J00430
                          DC      /D051      NO GRAPHIC   NEW LINE      U4J00440
                          DC      /D455      NO GRAPHIC   BACKSPACE     U4J00450
                          DC      /D859      NO GRAPHIC   IDLE          U4J00460
                          DC      /DC5D      NO GRAPHIC   NO GRAPHIC    U4J00470
                          DC      /C243      NO GRAPHIC   NO GRAPHIC    U4J00480
                          DC      /C147      NO GRAPHIC   NO GRAPHIC    U4J00490
                          DC      /CA4B      NO GRAPHIC   NO GRAPHIC    U4J00500
                          DC      /CE4F      NO GRAPHIC   NO GRAPHIC    U4J00510
                          DC      /D253      NO GRAPHIC   NO GRAPHIC    U4J00520
                          DC      /D657      NO GRAPHIC   NO GRAPHIC    U4J00530
                          DC      /DA5B      NO GRAPHIC   NO GRAPHIC    U4J00540
                          DC      /DE5F      NO GRAPHIC   DS            U4J00550
                          DC      /6667      NO GRAPHIC   SOS           U4J00560
                          DC      /6425      NO GRAPHIC   FS            U4J00570
                          DC      /6829      NO GRAPHIC   NO GRAPHIC    U4J00580
                          DC      /6C2D      NO GRAPHIC   BYPASS        U4J00590
                          DC      /7031      NO GRAPHIC   LINE FEED     U4J00600
                          DC      /7435      NO GRAPHIC   EOB           U4J00610
                          DC      /7839      NO GRAPHIC   PREFIX        U4J00620
                          DC      /7C3D      NO GRAPHIC   NO GRAPHIC    U4J00630
                          DC      /6223      NO GRAPHIC   NO GRAPHIC    U4J00640
                          DC      /6127      NO GRAPHIC   SET MODE      U4J00650
                          DC      /6A2B      NO GRAPHIC   NO GRAPHIC    U4J00660
                          DC      /6E2F      NO GRAPHIC   NO GRAPHIC    U4J00670
                          DC      /7233      NO GRAPHIC   NO GRAPHIC    U4J00680
                          DC      /7637      NO GRAPHIC   NO GRAPHIC    U4J00690
                          DC      /7A3B      NO GRAPHIC   NO GRAPHIC    U4J00700
                          DC      /7E3F      NO GRAPHIC   NO GRAPHIC    U4J00710
                          DC      /E6E7      NO GRAPHIC   NO GRAPHIC    U4J00720
                          DC      /E405      NO GRAPHIC   NO GRAPHIC    U4J00730
                          DC      /E809      NO GRAPHIC   NO GRAPHIC    U4J00740
                          DC      /EC0D      NO GRAPHIC   NO GRAPHIC    U4J00750
                          DC      /F011      NO GRAPHIC   PNCH ON       U4J00760
                          DC      /F415      NO GRAPHIC   READER STOP   U4J00770
                          DC      /F819      NO GRAPHIC   UPPER CASE    U4J00780
                          DC      /FC1D      NO GRAPHIC   EOT           U4J00790
                          DC      /E203      NO GRAPHIC   NO GRAPHIC    U4J00800
                          DC      /E107      NO GRAPHIC   NO GRAPHIC    U4J00810
                          DC      /EA0B      NO GRAPHIC   NO GRAPHIC    U4J00820
                          DC      /EE0F      NO GRAPHIC   NO GRAPHIC    U4J00830
                          DC      /F213      NO GRAPHIC   NO GRAPHIC    U4J00840
                          DC      /F617      NO GRAPHIC   NO GRAPHIC    U4J00850
                          DC      /FA1B      NO GRAPHIC   NO GRAPHIC    U4J00860
                          DC      /FE1F      NO GRAPHIC   NO GRAPHIC    U4J00870
                          DC      /A000      PLUS ZERO    SPACE         U4J00880
                          DC      /84A5      A            NO GRAPHIC    U4J00890
                          DC      /88A9      B            NO GRAPHIC    U4J00900
                          DC      /8CAD      C            NO GRAPHIC    U4J00910
                          DC      /90B1      D            NO GRAPHIC    U4J00920
                          DC      /94B5      E            NO GRAPHIC    U4J00930
                          DC      /98B9      F            NO GRAPHIC    U4J00940
                          DC      /9CBD      G            NO GRAPHIC    U4J00950
                          DC      /82A3      H            NO GRAPHIC    U4J00960
                          DC      /8186      I            NO GRAPHIC    U4J00970
                          DC      /AB8A      NO GRAPHIC   CENT          U4J00980
                          DC      /AF8E      NO GRAPHIC   PERIOD        U4J00990
                          DC      /B392      NO GRAPHIC   LESS THAN     U4J01000
                          DC      /B796      NO GRAPHIC   LEFT PAREN    U4J01010
                          DC      /BB9A      NO GRAPHIC   PLUS          U4J01020
                          DC      /BF9E      NO GRAPHIC   LOGICAL OR    U4J01030
                          DC      /6080      MINUS ZERO   AMPERSAND     U4J01040
                          DC      /44C5      J            NO GRAPHIC    U4J01050
                          DC      /48C9      K            NO GRAPHIC    U4J01060
                          DC      /4CCD      L            NO GRAPHIC    U4J01070
                          DC      /50D1      M            NO GRAPHIC    U4J01080
                          DC      /54D5      N            NO GRAPHIC    U4J01090
                          DC      /58D9      O            NO GRAPHIC    U4J01100
                          DC      /5CDD      P            NO GRAPHIC    U4J01110
                          DC      /42C3      Q            NO GRAPHIC    U4J01120
                          DC      /4146      R            NO GRAPHIC    U4J01130
                          DC      /CB4A      NO GRAPHIC   EXCLAMATION   U4J01140
                          DC      /CF4E      NO GRAPHIC   DOLLAR        U4J01150
                          DC      /D352      NO GRAPHIC   ASTERISK      U4J01160
                          DC      /D756      NO GRAPHIC   RIGHT PAREN   U4J01170
                          DC      /DB5A      NO GRAPHIC   SEMI COLON    U4J01180
                          DC      /DF5E      NO GRAPHIC   LOGICAL NOT   U4J01190
                          DC      /2A40      NO GRAPHIC   DASH, MINUS   U4J01200
                          DC      /6524      NO GRAPHIC   SLASH         U4J01210
                          DC      /2869      S            NO GRAPHIC    U4J01220
                          DC      /2C6D      T            NO GRAPHIC    U4J01230
                          DC      /3071      U            NO GRAPHIC    U4J01240
                          DC      /3475      V            NO GRAPHIC    U4J01250
                          DC      /3879      W            NO GRAPHIC    U4J01260
                          DC      /3C7D      X            NO GRAPHIC    U4J01270
                          DC      /2263      Y            NO GRAPHIC    U4J01280
                          DC      /2126      Z            NO GRAPHIC    U4J01290
                          DC      /6BC0      NO GRAPHIC   NO GRAPHIC    U4J01300
                          DC      /6F2E      NO GRAPHIC   COMMA         U4J01310
                          DC      /7332      NO GRAPHIC   PERCENT       U4J01320
                          DC      /7736      NO GRAPHIC   UNDERSCORE    U4J01330
                          DC      /7B3A      NO GRAPHIC   GREATER THAN  U4J01340
                          DC      /7F3E      NO GRAPHIC   QUESTION MARK U4J01350
                          DC      /20E0      0            NO GRAPHIC    U4J01360
                          DC      /04E5      1            NO GRAPHIC    U4J01370
                          DC      /08E9      2            NO GRAPHIC    U4J01380
                          DC      /0CED      3            NO GRAPHIC    U4J01390
                          DC      /10F1      4            NO GRAPHIC    U4J01400
                          DC      /14F5      5            NO GRAPHIC    U4J01410
                          DC      /18F9      6            NO GRAPHIC    U4J01420
                          DC      /1CFD      7            NO GRAPHIC    U4J01430
                          DC      /02E3      8            NO GRAPHIC    U4J01440
                          DC      /0106      9            NO GRAPHIC    U4J01450
                          DC      /EB0A      NO GRAPHIC   COLON         U4J01460
                          DC      /EF0E      NO GRAPHIC   NUMBER        U4J01470
                          DC      /F312      NO GRAPHIC   AT            U4J01480
                          DC      /F716      NO GRAPHIC   APOSTROPHE    U4J01490
                          DC      /FB1A      NO GRAPHIC   EQUAL         U4J01500
                          DC      /FF1E      NO GRAPHIC   QUOTATION     U4J01510
                          END                                           U4J01520
