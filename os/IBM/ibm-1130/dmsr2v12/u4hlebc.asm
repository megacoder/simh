                    *************************************************** U4M00010
                    **                                                * U4M00020
                    *   SUBROUTINE NAME-                              * U4M00030
                    *      FULL NAME- HOLLERITH TO EBCDIC CONVERSION  * U4M00040
                    *         TABLE SUBROUTINE.                       * U4M00050
                    *      CODE NAME- HLEBC                           * U4M00060
                    *   PURPOSE- HLEBC IS A TABLE OF PACKED 8-BIT     * U4M00070
                    *      EBCDIC CODES TO BE USED BY THE SPEED       * U4M00080
                    *      CONVERSION ROUTINE.                        * U4M00090
                    *   METHOD-                                       * U4M00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4M00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U4M00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4M00130
                    *   SPECIAL FEATURES- N/A                         * U4M00140
                    *   ADDITIONAL INFORMATION-                       * U4M00150
                    *      ESTIMATED EXECUTION TIME- N/A              * U4M00160
                    *                                                 * U4M00170
                    *************************************************** U4M00180
                          HDNG    HOL TO EBC CONV TABLE   12/1/66       U4M00190
                          ENT     HLEBC                                 U4M00200
                    HLEBC DC      /5040      AMPERSAND    SPACE         U4M00210
                          DC      /C9F9      I            9             U4M00220
                          DC      /C8F8      H            8             U4M00230
                          DC      /0838      NO GRAPHIC   NO GRAPHIC    U4M00240
                          DC      /C1F1      A            1             U4M00250
                          DC      /0131      NO GRAPHIC   NO GRAPHIC    U4M00260
                          DC      /4979      NO GRAPHIC   NO GRAPHIC    U4M00270
                          DC      /0939      NO GRAPHIC   NO GRAPHIC    U4M00280
                          DC      /C2F2      B            2             U4M00290
                          DC      /0232      NO GRAPHIC   NO GRAPHIC    U4M00300
                          DC      /4A7A      CENT         COLON         U4M00310
                          DC      /0A3A      NO GRAPHIC   NO GRAPHIC    U4M00320
                          DC      /C3F3      C            3             U4M00330
                          DC      /0333      NO GRAPHIC   NO GRAPHIC    U4M00340
                          DC      /4B7B      PERIOD       NUMBER        U4M00350
                          DC      /0B3B      NO GRAPHIC   NO GRAPHIC    U4M00360
                          DC      /C4F4      D            4             U4M00370
                          DC      /0434      PUNCH OFF    PUNCH ON      U4M00380
                          DC      /4C7C      LESS THAN    AT            U4M00390
                          DC      /0C3C      NO GRAPHIC   NO GRAPHIC    U4M00400
                          DC      /C5F5      E            5             U4M00410
                          DC      /0535      HORIZ TAB    READER STOP   U4M00420
                          DC      /4D7D      LEFT PAREN   APOSTROPHE    U4M00430
                          DC      /0D3D      NO GRAPHIC   NO GRAPHIC    U4M00440
                          DC      /C6F6      F            6             U4M00450
                          DC      /0636      LOWER CASE   UPPER CASE    U4M00460
                          DC      /4E7E      PLUS         EQUAL         U4M00470
                          DC      /0E3E      NO GRAPHIC   NO GRAPHIC    U4M00480
                          DC      /C7F7      G            7             U4M00490
                          DC      /0737      DELETE       EOT           U4M00500
                          DC      /4F7F      LOGICAL OR   QUOTE         U4M00510
                          DC      /0F3F      NO GRAPHIC   NO GRAPHIC    U4M00520
                          DC      /C0F0      PLUS ZERO    0             U4M00530
                          DC      /89E9      NO GRAPHIC   Z             U4M00540
                          DC      /88E8      NO GRAPHIC   Y             U4M00550
                          DC      /4828      NO GRAPHIC   NO GRAPHIC    U4M00560
                          DC      /8161      NO GRAPHIC   SLASH         U4M00570
                          DC      /4121      NO GRAPHIC   NO GRAPHIC    U4M00580
                          DC      /8069      NO GRAPHIC   NO GRAPHIC    U4M00590
                          DC      /0029      NUL          NO GRAPHIC    U4M00600
                          DC      /82E2      NO GRAPHIC   S             U4M00610
                          DC      /4222      NO GRAPHIC   NO GRAPHIC    U4M00620
                          DC      /8AE0      NO GRAPHIC   NO GRAPHIC    U4M00630
                          DC      /CA2A      NO GRAPHIC   NO GRAPHIC    U4M00640
                          DC      /83E3      NO GRAPHIC   T             U4M00650
                          DC      /4323      NO GRAPHIC   NO GRAPHIC    U4M00660
                          DC      /8B6B      NO GRAPHIC   COMMA         U4M00670
                          DC      /CB2B      NO GRAPHIC   NO GRAPHIC    U4M00680
                          DC      /84E4      NO GRAPHIC   U             U4M00690
                          DC      /4424      NO GRAPHIC   BYPASS        U4M00700
                          DC      /8C6C      NO GRAPHIC   PERCENT       U4M00710
                          DC      /CC2C      NO GRAPHIC   NO GRAPHIC    U4M00720
                          DC      /85E5      NO GRAPHIC   V             U4M00730
                          DC      /4525      NO GRAPHIC   LINE FEED     U4M00740
                          DC      /8D6D      NO GRAPHIC   UNDERSCORE    U4M00750
                          DC      /CD2D      NO GRAPHIC   NO GRAPHIC    U4M00760
                          DC      /86E6      NO GRAPHIC   W             U4M00770
                          DC      /4626      NO GRAPHIC   EOB           U4M00780
                          DC      /8E6E      NO GRAPHIC   GREATER THAN  U4M00790
                          DC      /CE2E      NO GRAPHIC   NO GRAPHIC    U4M00800
                          DC      /87E7      NO GRAPHIC   X             U4M00810
                          DC      /4727      NO GRAPHIC   PREFIX        U4M00820
                          DC      /8F6F      NO GRAPHIC   QUESTION MARK U4M00830
                          DC      /CF2F      NO GRAPHIC   NO GRAPHIC    U4M00840
                          DC      /6A60      NO GRAPHIC   DASH          U4M00850
                          DC      /99D9      NO GRAPHIC   R             U4M00860
                          DC      /98D8      NO GRAPHIC   Q             U4M00870
                          DC      /5818      NO GRAPHIC   NO GRAPHIC    U4M00880
                          DC      /91D1      NO GRAPHIC   J             U4M00890
                          DC      /5111      NO GRAPHIC   NO GRAPHIC    U4M00900
                          DC      /9059      NO GRAPHIC   NO GRAPHIC    U4M00910
                          DC      /1019      NO GRAPHIC   NO GRAPHIC    U4M00920
                          DC      /92D2      NO GRAPHIC   K             U4M00930
                          DC      /5212      NO GRAPHIC   NO GRAPHIC    U4M00940
                          DC      /9A5A      NO GRAPHIC   EXCLAMATION   U4M00950
                          DC      /DA1A      NO GRAPHIC   NO GRAPHIC    U4M00960
                          DC      /93D3      NO GRAPHIC   L             U4M00970
                          DC      /5313      NO GRAPHIC   NO GRAPHIC    U4M00980
                          DC      /9B5B      NO GRAPHIC   DOLLAR        U4M00990
                          DC      /DB1B      NO GRAPHIC   NO GRAPHIC    U4M01000
                          DC      /94D4      NO GRAPHIC   M             U4M01010
                          DC      /5414      NO GRAPHIC   RESTORE       U4M01020
                          DC      /9C5C      NO GRAPHIC   ASTERISK      U4M01030
                          DC      /DC1C      NO GRAPHIC   NO GRAPHIC    U4M01040
                          DC      /95D5      NO GRAPHIC   N             U4M01050
                          DC      /5515      NO GRAPHIC   NEW LINE      U4M01060
                          DC      /9D5D      NO GRAPHIC   RIGHT PAREN   U4M01070
                          DC      /DD1D      NO GRAPHIC   NO GRAPHIC    U4M01080
                          DC      /96D6      NO GRAPHIC   O             U4M01090
                          DC      /5616      NO GRAPHIC   BACKSPACE     U4M01100
                          DC      /9E5E      NO GRAPHIC   SEMI-COLON    U4M01110
                          DC      /DE1E      NO GRAPHIC   NO GRAPHIC    U4M01120
                          DC      /97D7      NO GRAPHIC   P             U4M01130
                          DC      /5717      NO GRAPHIC   IDLE          U4M01140
                          DC      /9F5F      NO GRAPHIC   LOGICAL NOT   U4M01150
                          DC      /DF1F      NO GRAPHIC   NO GRAPHIC    U4M01160
                          DC      /70D0      NO GRAPHIC   MINUS ZERO    U4M01170
                          DC      /B9A9      NO GRAPHIC   NO GRAPHIC    U4M01180
                          DC      /B8A8      NO GRAPHIC   NO GRAPHIC    U4M01190
                          DC      /7868      NO GRAPHIC   NO GRAPHIC    U4M01200
                          DC      /B1A1      NO GRAPHIC   NO GRAPHIC    U4M01210
                          DC      /71E1      NO GRAPHIC   NO GRAPHIC    U4M01220
                          DC      /B0A0      NO GRAPHIC   NO GRAPHIC    U4M01230
                          DC      /3020      56 GRAPHIC   NO GRAPHIC    U4M01240
                          DC      /B2A2      NO GRAPHIC   NO GRAPHIC    U4M01250
                          DC      /7262      NO GRAPHIC   NO GRAPHIC    U4M01260
                          DC      /BAAA      NO GRAPHIC   NO GRAPHIC    U4M01270
                          DC      /FAEA      NO GRAPHIC   NO GRAPHIC    U4M01280
                          DC      /B3A3      NO GRAPHIC   NO GRAPHIC    U4M01290
                          DC      /7363      NO GRAPHIC   NO GRAPHIC    U4M01300
                          DC      /BBAB      NO GRAPHIC   NO GRAPHIC    U4M01310
                          DC      /FBEB      NO GRAPHIC   NO GRAPHIC    U4M01320
                          DC      /B4A4      NO GRAPHIC   NO GRAPHIC    U4M01330
                          DC      /7464      NO GRAPHIC   NO GRAPHIC    U4M01340
                          DC      /BCAC      NO GRAPHIC   NO GRAPHIC    U4M01350
                          DC      /FCEC      NO GRAPHIC   NO GRAPHIC    U4M01360
                          DC      /B5A5      NO GRAPHIC   NO GRAPHIC    U4M01370
                          DC      /7565      NO GRAPHIC   NO GRAPHIC    U4M01380
                          DC      /BDAD      NO GRAPHIC   NO GRAPHIC    U4M01390
                          DC      /FDED      NO GRAPHIC   NO GRAPHIC    U4M01400
                          DC      /B6A6      NO GRAPHIC   NO GRAPHIC    U4M01410
                          DC      /7666      NO GRAPHIC   NO GRAPHIC    U4M01420
                          DC      /BEAE      NO GRAPHIC   NO GRAPHIC    U4M01430
                          DC      /FEEE      NO GRAPHIC   NO GRAPHIC    U4M01440
                          DC      /B7A7      NO GRAPHIC   NO GRAPHIC    U4M01450
                          DC      /7767      NO GRAPHIC   NO GRAPHIC    U4M01460
                          DC      /BFAF      NO GRAPHIC   NO GRAPHIC    U4M01470
                          DC      /FFEF      NO GRAPHIC   NO GRAPHIC    U4M01480
                          END                                           U4M01490
