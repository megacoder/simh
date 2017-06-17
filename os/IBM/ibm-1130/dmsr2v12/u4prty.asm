                    *************************************************** U4Q00010
                    *                                                 * U4Q00020
                    *   SUBROUTINE NAME-                              * U4Q00030
                    *      FULL NAME- 1053 AND 1403 CODE TABLE        * U4Q00040
                    *      CODE NAME- PRTY                            * U4Q00050
                    *   PURPOSE- THIS TABLE IS USED BY EBPRT,HOLPR,   * U4Q00060
                    *      AND PAPPR IN A TABLE LOOKUP CONVERSION     * U4Q00070
                    *      TO OR FROM EITHER 1053 OR 1403 PRINTER     * U4Q00080
                    *      CODE.                                      * U4Q00090
                    *   METHOD- N/A                                   * U4Q00100
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U4Q00110
                    *   SPECIAL FEATURES- N/A                         * U4Q00120
                    *   ADDITIONAL INFORMATION-                       * U4Q00130
                    *      ESTIMATED EXECUTION TIME- N/A              * U4Q00140
                    *      OTHER- EACH WORD REPRESENTS ONE CHARACTER, * U4Q00150
                    *         WHERE BITS 0-7 ARE THE 1053 CODE, AND   * U4Q00160
                    *         BITS 8-15 ARE THE 1403 CODE.            * U4Q00170
                    *                                                 * U4Q00180
                    *************************************************** U4Q00190
                          LIBR                                          U4Q00200
                          ENT     PRTY                                  U4Q00210
                    PRTY  DC      0                                     U4Q00220
                          DC      0                                     U4Q00230
                          DC      0                                     U4Q00240
                          DC      /217F     SPACE                       U4Q00250
                          DC      /217F     SPACE                       U4Q00260
                          DC      /217F     SPACE                       U4Q00270
                          DC      /417F     HORIZONTAL TAB              U4Q00280
                          DC      /217F     LOWER CASE                  U4Q00290
                          DC      /217F     DELETE                      U4Q00300
                          DC      /057F     RESTORE                     U4Q00310
                          DC      /817F     NEW LINE                    U4Q00320
                          DC      /117F     BACKSPACE                   U4Q00330
                          DC      /037F     LINE FEED                   U4Q00340
                          DC      /217F     END OF BLOCK                U4Q00350
                          DC      /097F     READER STOP                 U4Q00360
                          DC      /217F     UPPER CASE                  U4Q00370
                    *                                                   U4Q00380
                          DC      /027F     CENT                        U4Q00390
                          DC      /DE7F     LESS THAN                   U4Q00400
                          DC      /C67F     LOGICAL OR                  U4Q00410
                          DC      /427F     EXCLAMATION POINT           U4Q00420
                          DC      /D27F     SEMICOLON                   U4Q00430
                          DC      /F27F     LOGICAL NOT                 U4Q00440
                          DC      /067F     PRECENT                     U4Q00450
                          DC      /BE7F     UNDERSCORE                  U4Q00460
                          DC      /467F     GREATER THAN                U4Q00470
                          DC      /867F     QUESTION MARK               U4Q00480
                          DC      /827F     COLON                       U4Q00490
                          DC      /C07F     POUND                       U4Q00500
                          DC      /E60B     APOSTROPHE                  U4Q00510
                          DC      /E27F     QUOTE                       U4Q00520
                    *                                                   U4Q00530
                          DC      /006E     PERIOD                      U4Q00540
                          DC      /FE57     LEFT PARENTHESIS            U4Q00550
                          DC      /4062     DOLLAR SIGN                 U4Q00560
                          DC      /D623     ASTERISK                    U4Q00570
                          DC      /F62F     RIGHT PARENTHESIS           U4Q00580
                          DC      /BC4C     SLASH                       U4Q00590
                          DC      /8016     COMMA                       U4Q00600
                          DC      /047F     AT                          U4Q00610
                          DC      /C24A     EQUAL                       U4Q00620
                    *                                                   U4Q00630
                          DC      /A054     Z                           U4Q00640
                          DC      /A413     Y                           U4Q00650
                          DC      /9452     X                           U4Q00660
                          DC      /9051     W                           U4Q00670
                          DC      /B410     V                           U4Q00680
                          DC      /B04F     U                           U4Q00690
                          DC      /9C0E     T                           U4Q00700
                          DC      /980D     S                           U4Q00710
                    *                                                   U4Q00720
                          DC      /6020     R                           U4Q00730
                          DC      /641F     Q                           U4Q00740
                          DC      /545E     P                           U4Q00750
                          DC      /505D     O (ALPHA)                   U4Q00760
                          DC      /741C     N                           U4Q00770
                          DC      /705B     M                           U4Q00780
                          DC      /5C1A     L                           U4Q00790
                          DC      /5819     K                           U4Q00800
                          DC      /7C58     J                           U4Q00810
                    *                                                   U4Q00820
                          DC      /202C     I                           U4Q00830
                          DC      /246B     H                           U4Q00840
                          DC      /142A     G                           U4Q00850
                          DC      /1029     F                           U4Q00860
                          DC      /3468     E                           U4Q00870
                          DC      /3067     D                           U4Q00880
                          DC      /1C26     C                           U4Q00890
                          DC      /1825     B                           U4Q00900
                          DC      /3C64     A                           U4Q00910
                    *                                                   U4Q00920
                          DC      /E008     9                           U4Q00930
                          DC      /E407     8                           U4Q00940
                          DC      /D446     7                           U4Q00950
                          DC      /D045     6                           U4Q00960
                          DC      /F404     5                           U4Q00970
                          DC      /F043     4                           U4Q00980
                          DC      /DC02     3                           U4Q00990
                          DC      /D801     2                           U4Q01000
                          DC      /FC40     1                           U4Q01010
                          DC      /C449     0 (NUMERIC)                 U4Q01020
                    *                                                   U4Q01030
                          DC      /8461     DASH                        U4Q01040
                          DC      /4415     AMPERSAND                   U4Q01050
                          DC      /DA6D     PLUS                        U4Q01060
                          DC      /217F     SPACE                       U4Q01070
                          END                                           U4Q01080
