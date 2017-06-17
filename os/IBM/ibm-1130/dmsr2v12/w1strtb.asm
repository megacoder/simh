                          HDNG    4 OF 8 CODE AND EBCDIC TABLE          W1G00010
                    *************************************************** W1G00020
                    * TITLE - STRTB                                   * W1G00030
                    * STATUS - CHANGE LEVEL 0                         * W1G00040
                    * FUNCTION/OPERATION - .STRTB. IS A TABLE OF      * W1G00050
                    *  4-OF-8 CODE AND EBCDIC. THE LEFT-HALF IS 4-OF-8* W1G00060
                    *  AND THE RIGHT-HALF IS EBCDIC.                  * W1G00070
                    * ENTRY POINTS - NONE                             * W1G00080
                    * INPUT - NONE                                    * W1G00090
                    * OUTPUT - NONE                                   * W1G00100
                    * EXTERNAL ROUTINES - NONE                        * W1G00110
                    * EXITS-NORMAL - NONE                             * W1G00120
                    *      -ERROR - NONE                              * W1G00130
                    * TABLES/WORK AREAS - NONE                        * W1G00140
                    * ATTRIBUTES - REUSABLE                           * W1G00150
                    * NOTES - NONE                                    * W1G00160
                    *************************************************** W1G00170
                          HDNG    4 OF 8 CODE AND EBCDIC TABLE          W1G00180
                          LIBR                                          W1G00190
                          ENT     STRTB                                 W1G00200
                    STRTB DC                THE LOADER STORES THE TV    W1G00210
                          DC                ADDRESS IN THE THIRD WORD,  W1G00220
                          DC                SO THESE ARE NOT USED.      W1G00230
                          DC      /F07D     BLANK         APOSTROPHE    W1G00240
                          DC      /71F7     A             7             W1G00250
                          DC      /727B     B             POUND SIGN    W1G00260
                          DC      /637F     C             QUOTE         W1G00270
                          DC      /747E     D             EQUAL         W1G00280
                          DC      /65E7     E             X             W1G00290
                          DC      /666B     F             COMMA         W1G00300
                          DC      /876F     G             QUESTION MARK W1G00310
                          DC      /787A     H             COLON         W1G00320
                          DC      /6940     I                           W1G00330
                          DC      /6A40      CENT                       W1G00340
                          DC      /8B4E     PERIOD        PLUS          W1G00350
                          DC      /6C40     LESS THAN                   W1G00360
                          DC      /566E     LEFT PAREN    GREATER THAN  W1G00370
                          DC      /365E     PLUS          SEMICOLON     W1G00380
                          DC      /8DD7     LOGICAL OR    P             W1G00390
                          DC      /8E5B     AND           DOLLAR SIGN   W1G00400
                          DC      /D15F     J             LOGICAL NOT   W1G00410
                          DC      /D260     K             DASH          W1G00420
                          DC      /C340     L                           W1G00430
                          DC      /D440     M                           W1G00440
                          DC      /C54D     N             LEFT PAREN    W1G00450
                          DC      /C640     O                           W1G00460
                          DC      /476D     P             UNDERSCORE    W1G00470
                          DC      /D85D     Q             RIGHT PAREN   W1G00480
                          DC      /C9C3     R             C             W1G00490
                          DC      /CAC5     EXCLAMATION   E             W1G00500
                          DC      /4BC6     DOLLAR SIGN   F             W1G00510
                          DC      /CCC9     ASTERISK      I             W1G00520
                          DC      /5C4A     RIGHT PAREN   CENT          W1G00530
                          DC      /3C4C     SEMICOLON     LESS THAN     W1G00540
                          DC      /4DC1     LOGICAL NOT   A             W1G00550
                          DC      /4EC2     DASH          B             W1G00560
                          DC      /B1C4     /             D             W1G00570
                          DC      /B2C8     S             H             W1G00580
                          DC      /A3C7     T             G             W1G00590
                          DC      /B44B     U             P             W1G00600
                          DC      /A54F     V             LOGICAL OR    W1G00610
                          DC      /A650     W             AND           W1G00620
                          DC      /27F3     X             3             W1G00630
                          DC      /B8F5     Y             5             W1G00640
                          DC      /A9F6     Z             6             W1G00650
                          DC      /AAF9     RECORD MARD   9             W1G00660
                          DC      /2BF0     COMMA         0             W1G00670
                          DC      /AC7C     PERCENT       AT SIGN       W1G00680
                          DC      /5AE3     UNDERSCORE    T             W1G00690
                          DC      /3AE5     GREATER THAN  V             W1G00700
                          DC      /2DE6     QUESTION MARK W             W1G00710
                          DC      /9AE9     0             Z             W1G00720
                          DC      /E1E0     1             RECORD MARK   W1G00730
                          DC      /E26C     2             PERCENT       W1G00740
                          DC      /9361     3             /             W1G00750
                          DC      /E4E2     4             S             W1G00760
                          DC      /95E4     5             U             W1G00770
                          DC      /96E8     6             Y             W1G00780
                          DC      /17D3     7             L             W1G00790
                          DC      /E8D5     8             N             W1G00800
                          DC      /99D6     9             O             W1G00810
                          DC      /2ED9     COLON         R             W1G00820
                          DC      /1B5A     POUND         EXCLAMATION   W1G00830
                          DC      /9C5C     AT SIGN       ASTERISK      W1G00840
                          DC      /0FD1     APOSTROPHE    J             W1G00850
                          DC      /1ED2     EQUAL         K             W1G00860
                          DC      /1DD4     QUOTE         M             W1G00870
                          DC      /00D8                   Q             W1G00880
                          DC      /00F1                   1             W1G00890
                          DC      /00F2                   2             W1G00900
                          DC      /00F4                   4             W1G00910
                          DC      /00F8                   8             W1G00920
                          DC      /0040                   BLANK         W1G00930
                          END                                           W1G00940
