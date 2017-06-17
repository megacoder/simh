                          HDNG    HOLLERITH TABLE                       W1C00010
                    *************************************************** W1C00020
                    * TITLE - HOLCA                                   * W1C00030
                    * STATUS - CHANGE LEVEL 0                         * W1C00040
                    * FUNCTION/OPERATION - .HOLCA. IS A TABLE OF IBM  * W1C00050
                    *  CARD CODE CHARACTERS. ONE IBM CARD CODE CHAR.  * W1C00060
                    *  FOR EACH 4-OF-8 CHARACTER                      * W1C00070
                    * ENTRY POINTS - NONE                             * W1C00080
                    * INPUT - NONE                                    * W1C00090
                    * OUTPUT - NONE                                   * W1C00100
                    * EXTERNAL ROUTINES - NONE                        * W1C00110
                    * EXITS-NORMAL -NONE                              * W1C00120
                    *      -ERROR - NONE                              * W1C00130
                    * TABLES/WORD AREAS - NONE                        * W1C00140
                    * ATTRIBUTES - REUSABLE                           * W1C00150
                    * NOTES - NONE                                    * W1C00160
                    *************************************************** W1C00170
                          HDNG    HOLLERITH TABLE                       W1C00180
                          LIBR                                          W1C00190
                          ENT     HOLCA                                 W1C00200
                    HOLCA DC                THE LOADER STORES THE TV    W1C00210
                          DC                ADDRESS IN THE THIRD WORD,  W1C00220
                          DC                SO THESE ARE NOT USED.      W1C00230
                          DC      /0120     APOSTROPHE                  W1C00240
                          DC      /0040     7                           W1C00250
                          DC      /0420     POUND SIGN                  W1C00260
                          DC      /0060     QUOTATION MARK              W1C00270
                          DC      /00A0     EQUALS                      W1C00280
                          DC      /2040     X                           W1C00290
                          DC      /2420     COMMA                       W1C00300
                          DC      /2060     QUESTION MARK               W1C00310
                          DC      /0820     COLON                       W1C00320
                          DC      0         SPACER WD                   W1C00330
                          DC      0         SPACER WD                   W1C00340
                          DC      /80A0     PLUS                        W1C00350
                          DC      0         SPACER WD                   W1C00360
                          DC      /20A0     GREATER THAN                W1C00370
                          DC      /40A0     SEMICOLON                   W1C00380
                          DC      /4040     P                           W1C00390
                          DC      /4420     DOLLAR SIGN                 W1C00400
                          DC      /4060     LOGICAL NOT                 W1C00410
                          DC      /4000     DASH, MUNUS                 W1C00420
                          DC      0         SPACER WD                   W1C00430
                          DC      0         SPACER WD                   W1C00440
                          DC      /8120     LEFT PARENTHESIS            W1C00450
                          DC      0         SPACER WD                   W1C00460
                          DC      /2120     UNDERSCORE                  W1C00470
                          DC      /4120     RIGHT PARENTHESIS           W1C00480
                          DC      /8400     C                           W1C00490
                          DC      /8100     E                           W1C00500
                          DC      /8080     F                           W1C00510
                          DC      /8010     I                           W1C00520
                          DC      /8820     CENT                        W1C00530
                          DC      /8220     LESS THAN                   W1C00540
                          DC      /9000     A                           W1C00550
                          DC      /8800     B                           W1C00560
                          DC      /8200     D                           W1C00570
                          DC      /8020     H                           W1C00580
                          DC      /8040     G                           W1C00590
                          DC      /8420     PERIOD                      W1C00600
                          DC      /8060     LOGICAL OR                  W1C00610
                          DC      /8000     AND                         W1C00620
                          DC      /0400     3                           W1C00630
                          DC      /0100     5                           W1C00640
                          DC      /0080     6                           W1C00650
                          DC      /0010     9                           W1C00660
                          DC      /2000     0                           W1C00670
                          DC      /0220     AT SIGN                     W1C00680
                          DC      /2400     T                           W1C00690
                          DC      /2100     V                           W1C00700
                          DC      /2080     W                           W1C00710
                          DC      /2010     Z                           W1C00720
                          DC      /2820     RECORD MARK                 W1C00730
                          DC      /2220     PERCENT                     W1C00740
                          DC      /3000     /                           W1C00750
                          DC      /2800     S                           W1C00760
                          DC      /2200     U                           W1C00770
                          DC      /2020     Y                           W1C00780
                          DC      /4400     L                           W1C00790
                          DC      /4100     N                           W1C00800
                          DC      /4080     O                           W1C00810
                          DC      /4010     R                           W1C00820
                          DC      /4820     EXCLAMATION MARK            W1C00830
                          DC      /4220     ASTERISK                    W1C00840
                          DC      /5000     J                           W1C00850
                          DC      /4800     K                           W1C00860
                          DC      /4200     M                           W1C00870
                          DC      /4020     Q                           W1C00880
                          DC      /1000     1                           W1C00890
                          DC      /0800     2                           W1C00900
                          DC      /0200     4                           W1C00910
                          DC      /0020     8                           W1C00920
                          DC      /0000     BLANK                       W1C00930
                          END                                           W1C00940
