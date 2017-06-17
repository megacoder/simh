                          HDNG    HOLLERITH SUBSET TABLE                U4P00010
                    *************************************************** U4P00020
                    *                                                 * U4P00030
                    *   SUBROUTINE NAME-                              * U4P00040
                    *      FULL NAME-HOLLERITH SUBSET TABLE           * U4P00050
                    *      CODE NAME- HOLL                            * U4P00060
                    *   PURPOSE- THIS TABLE IS USED BY HOLEB, BY HOLPR* U4P00070
                    *      AND BY PAPHL TO PERFORM A TABLE LOOKUP     * U4P00080
                    *      CONVERSION TO OR FROM IBM CARD CODE.       * U4P00090
                    *   METHOD- N/A                                   * U4P00100
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U4P00110
                    *   SPECIAL FEATURES- N/A                         * U4P00120
                    *   ADDITIONAL INFORMATION-                       * U4P00130
                    *      ESTIMATED EXECUTION TIME-N/A               * U4P00140
                    *                                                 * U4P00150
                    *************************************************** U4P00160
                          HDNG    HOLLERITH SUBSET TABLE                U4P00170
                          LIBR                                          U4P00180
                          ENT     HOLL                                  U4P00190
                    *                                                   U4P00200
                    *             BITS 0-11 = IBM CARD CODE             U4P00210
                    *                                                   U4P00220
                    HOLL  DC      0          THE LOADER STORES THE TV   U4P00230
                          DC      0          ADDRESS IN THE THIRD WORD, U4P00240
                          DC      0          SO THESE ARE NOT USED.     U4P00250
                          DC      /0000      SPACE                      U4P00260
                          DC      /0000      SPACE                      U4P00270
                          DC      /0000      SPACE                      U4P00280
                          DC      /8110      HORIZONTAL TAB             U4P00290
                          DC      /8090      LOWER CASE                 U4P00300
                          DC      /8050      DELETE                     U4P00310
                          DC      /4210      RESTORE                    U4P00320
                          DC      /4110      NEW LINE                   U4P00330
                          DC      /4090      BACKSPACE                  U4P00340
                          DC      /2110      LINE FEED                  U4P00350
                          DC      /2090      END OF BLOCK               U4P00360
                          DC      /0110      READER STOP                U4P00370
                          DC      /0090      UPPER CASE                 U4P00380
                    *                                                   U4P00390
                          DC      /8820      CENT                       U4P00400
                          DC      /8220      LESS THAN                  U4P00410
                          DC      /8060      LOGICAL OR                 U4P00420
                          DC      /4820      EXCLAMATION POINT          U4P00430
                          DC      /40A0      SEMICOLON                  U4P00440
                          DC      /4060      LOGICAL NOT                U4P00450
                          DC      /2220      PERCENT                    U4P00460
                          DC      /2120      UNDERSCORE                 U4P00470
                          DC      /20A0      GREATER THAN               U4P00480
                          DC      /2060      QUESTION MASK              U4P00490
                          DC      /0820      COLON                      U4P00500
                          DC      /0420      POUND                      U4P00510
                          DC      /0120      APOSTROPHE                 U4P00520
                          DC      /0060      QUOTE                      U4P00530
                    *                                                   U4P00540
                          DC      /8420      PERIOD                     U4P00550
                          DC      /8120      LEFT PARENTHESIS           U4P00560
                          DC      /4420      DOLLAR SIGN                U4P00570
                          DC      /4220      ASTERISK                   U4P00580
                          DC      /4120      RIGHT PARENTHESIS          U4P00590
                          DC      /3000      SLASH                      U4P00600
                          DC      /2420      COMMA                      U4P00610
                          DC      /0220      AT                         U4P00620
                          DC      /00A0      EQUAL                      U4P00630
                    *                                                   U4P00640
                          DC      /2010      Z                          U4P00650
                          DC      /2020      Y                          U4P00660
                          DC      /2040      X                          U4P00670
                          DC      /2080      W                          U4P00680
                          DC      /2100      V                          U4P00690
                          DC      /2200      U                          U4P00700
                          DC      /2400      T                          U4P00710
                          DC      /2800      S                          U4P00720
                    *                                                   U4P00730
                          DC      /4010      R                          U4P00740
                          DC      /4020      Q                          U4P00750
                          DC      /4040      P                          U4P00760
                          DC      /4080      O                          U4P00770
                          DC      /4100      N                          U4P00780
                          DC      /4200      M                          U4P00790
                          DC      /4400      L                          U4P00800
                          DC      /4800      K                          U4P00810
                          DC      /5000      J                          U4P00820
                    *                                                   U4P00830
                          DC      /8010      I                          U4P00840
                          DC      /8020      H                          U4P00850
                          DC      /8040      G                          U4P00860
                          DC      /8080      F                          U4P00870
                          DC      /8100      E                          U4P00880
                          DC      /8200      D                          U4P00890
                          DC      /8400      C                          U4P00900
                          DC      /8800      B                          U4P00910
                          DC      /9000      A                          U4P00920
                    *                                                   U4P00930
                          DC      /0010      9                          U4P00940
                          DC      /0020      8                          U4P00950
                          DC      /0040      7                          U4P00960
                          DC      /0080      6                          U4P00970
                          DC      /0100      5                          U4P00980
                          DC      /0200      4                          U4P00990
                          DC      /0400      3                          U4P01000
                          DC      /0800      2                          U4P01010
                          DC      /1000      1                          U4P01020
                          DC      /2000      0                          U4P01030
                    *                                                   U4P01040
                          DC      /4000      DASH                       U4P01050
                          DC      /8000      AMPERSAND                  U4P01060
                          DC      /80A0      PLUS                       U4P01070
                          DC      /0000      SPACE                      U4P01080
                          END                                           U4P01090
