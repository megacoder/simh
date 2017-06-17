                    *************************************************** U4N00010
                    *                                                 * U4N00020
                    *   SUBROUTINE NAME-                              * U4N00030
                    *      FULL NAME- HOLLERITH TO 1403 PRINTER CODE  * U4N00040
                    *         CONVERSION TABLE SUBROUTINE.            * U4N00050
                    *      CODE NAME- HLPT3                           * U4N00060
                    *   PURPOSE- HLPT3 IS A TABLE OF PACKED,8-BIT     * U4N00070
                    *      1403 PRINTER CODE TO BE USED BY ZIPCO,     * U4N00080
                    *      THE SPEED CONVERSION SUBROUTINE.           * U4N00090
                    *   METHOD-                                       * U4N00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4N00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U4N00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4N00130
                    *   SPECIAL FEATURES- NON-EXECUTABLE              * U4N00140
                    *   ADDITIONAL INFORMATION-                       * U4N00150
                    *      ESTIMATED EXECUTION TIME- N/A              * U4N00160
                    *                                                 * U4N00170
                    *************************************************** U4N00180
                          HDNG    HOL TO 1403 CONV TABLE FOR ZIPCO      U4N00190
                          ENT     HLPT3                                 U4N00200
                    HLPT3 DC      /157F      AMPERSAND    SPACE         U4N00210
                          DC      /2C08      I            9             U4N00220
                          DC      /6B07      H            8             U4N00230
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00240
                          DC      /6440      A            1             U4N00250
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00260
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00270
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00280
                          DC      /2501      B            2             U4N00290
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00300
                          DC      /7F7F      CENT         COLON         U4N00310
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00320
                          DC      /2602      C            3             U4N00330
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00340
                          DC      /6E7F      PERIOD       NUMBER        U4N00350
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00360
                          DC      /6743      D            4             U4N00370
                          DC      /7F7F      PUNCH OFF    PUNCH ON      U4N00380
                          DC      /7F7F      LESS THAN    AT            U4N00390
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00400
                          DC      /6804      E            5             U4N00410
                          DC      /7F7F      HORIZ TAB    READR STOP    U4N00420
                          DC      /570B      LEFT PAREN   APOSTROPHE    U4N00430
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00440
                          DC      /2945      F            6             U4N00450
                          DC      /7F7F      LOWER CASE   UPPER CASE    U4N00460
                          DC      /6D4A      PLUS         EQUAL         U4N00470
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00480
                          DC      /2A46      G            7             U4N00490
                          DC      /7F7F      DELETE       EOT           U4N00500
                          DC      /7F7F      LOGICAL OR   QUOTE         U4N00510
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00520
                          DC      /7F49      PLUS ZERO    0             U4N00530
                          DC      /7F54      NO GRAPHIC   Z             U4N00540
                          DC      /7F13      NO GRAPHIC   Y             U4N00550
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00560
                          DC      /7F4C      NO GRAPHIC   SLASH         U4N00570
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00580
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00590
                          DC      /7F7F      NUL          NO GRAPHIC    U4N00600
                          DC      /7F0D      NO GRAPHIC   S             U4N00610
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00620
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00630
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00640
                          DC      /7F0E      NO GRAPHIC   T             U4N00650
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00660
                          DC      /7F16      NO GRAPHIC   COMMA         U4N00670
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00680
                          DC      /7F4F      NO GRAPHIC   U             U4N00690
                          DC      /7F7F      NO GRAPHIC   BYPASS        U4N00700
                          DC      /7F7F      NO GRAPHIC   PERCENT       U4N00710
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00720
                          DC      /7F10      NO GRAPHIC   V             U4N00730
                          DC      /7F7F      NO GRAPHIC   LINE FEED     U4N00740
                          DC      /7F7F      NO GRAPHIC   UNDERSCORE    U4N00750
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00760
                          DC      /7F51      NO GRAPHIC   W             U4N00770
                          DC      /7F7F      NO GRAPHIC   EOB           U4N00780
                          DC      /7F7F      NO GRAPHIC   GREATER THAN  U4N00790
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00800
                          DC      /7F52      NO GRAPHIC   X             U4N00810
                          DC      /7F7F      NO GRAPHIC   PREFIX        U4N00820
                          DC      /7F7F      NO GRAPHIC   QUESTION MARK U4N00830
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00840
                          DC      /7F61      NO GRAPHIC   DASH          U4N00850
                          DC      /7F20      NO GRAPHIC   R             U4N00860
                          DC      /7F1F      NO GRAPHIC   Q             U4N00870
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00880
                          DC      /7F58      NO GRAPHIC   J             U4N00890
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00900
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00910
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00920
                          DC      /7F19      NO GRAPHIC   K             U4N00930
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00940
                          DC      /7F7F      NO GRAPHIC   EXCLAMATION   U4N00950
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00960
                          DC      /7F1A      NO GRAPHIC   L             U4N00970
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N00980
                          DC      /7F62      NO GRAPHIC   DOLLAR        U4N00990
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01000
                          DC      /7F5B      NO GRAPHIC   M             U4N01010
                          DC      /7F7F      NO GRAPHIC   RESTORE       U4N01020
                          DC      /7F23      NO GRAPHIC   ASTERISK      U4N01030
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01040
                          DC      /7F1C      NO GRAPHIC   N             U4N01050
                          DC      /7F7F      NO GRAPHIC   NEW LINE      U4N01060
                          DC      /7F2F      NO GRAPHIC   RIGHT PAREN   U4N01070
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01080
                          DC      /7F5D      NO GRAPHIC   O             U4N01090
                          DC      /7F7F      NO GRAPHIC   BACKSPACE     U4N01100
                          DC      /7F7F      NO GRAPHIC   SEMI-COLON    U4N01110
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01120
                          DC      /7F5E      NO GRAPHIC   P             U4N01130
                          DC      /7F7F      NO GRAPHIC   IDLE          U4N01140
                          DC      /7F7F      NO GRAPHIC   LOGICAL NOT   U4N01150
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01160
                          DC      /7F7F      NO GRAPHIC   MINUS ZERO    U4N01170
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01180
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01190
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01200
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01210
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01220
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01230
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01240
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01250
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01260
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01270
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01280
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01290
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01300
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01310
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01320
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01330
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01340
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01350
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01360
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01370
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01380
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01390
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01400
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01410
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01420
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01430
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01440
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01450
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01460
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01470
                          DC      /7F7F      NO GRAPHIC   NO GRAPHIC    U4N01480
                          END                                           U4N01490
