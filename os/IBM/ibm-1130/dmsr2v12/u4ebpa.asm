                          HDNG    EBCDIC AND PTTC/8 SUBSET TABLE        U4K00010
                    *************************************************** U4K00020
                    *                                                 * U4K00030
                    *   SUBROUTINE NAME-                              * U4K00040
                    *      FULL NAME- EBCDIC AND PTTC/8 SUBSET TABLE  * U4K00050
                    *      CODE NAME- EBPA                            * U4K00060
                    *   PURPOSE- THIS TABLE IS USED BY EBPRT,HOLEB,   * U4K00070
                    *      PAPEB,PAPHL,PAPPR IN A TABLE LOOKUP CON-   * U4K00080
                    *      VERSION TO OR FROM EITHER EBCDIC SUBSET    * U4K00090
                    *      OR PTTC/8 SUBSET CODE.                     * U4K00100
                    *   METHOD-N/A                                    * U4K00110
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U4K00120
                    *   SPECIAL FEATURES- N/A                         * U4K00130
                    *   ADDITIONAL INFORMATION-                       * U4K00140
                    *      ESTIMATED EXECUTION TIME- N/A              * U4K00150
                    *                                                 * U4K00160
                    *************************************************** U4K00170
                          HDNG    EBCDIC AND PTTC/8 SUBSET TABLE        U4K00180
                          LIBR                                          U4K00190
                          ENT     EBPA                                  U4K00200
                    *                                                   U4K00210
                    *             BITS 0-7 = EBCDIC, BITS 8-15 = PTTC/8 U4K00220
                    *             (BIT 8 = UPPER CASE INDICATOR)        U4K00230
                    *                                                   U4K00240
                    EBPA  DC      0          THE LOADER STORES THE TV   U4K00250
                          DC      0          ADDRESS IN THE THIRD WORD, U4K00260
                          DC      0          SO THESE ARE NOT USED.     U4K00270
                          DC      /4010      SPACE                      U4K00280
                          DC      /4010      SPACE                      U4K00290
                          DC      /4010      SPACE                      U4K00300
                          DC      /056D      HORIZONTAL TAB             U4K00310
                          DC      /066E      LOWER CASE                 U4K00320
                          DC      /077F      DELETE                     U4K00330
                          DC      /144C      RESTORE                    U4K00340
                          DC      /15DD      NEW LINE                   U4K00350
                          DC      /165E      BACKSPACE                  U4K00360
                          DC      /253D      LINE FEED                  U4K00370
                          DC      /263E      END OF BLOCK               U4K00380
                          DC      /350D      READER STOP                U4K00390
                          DC      /360E      UPPER CASE                 U4K00400
                    *                                                   U4K00410
                          DC      /4AA0      CENT                       U4K00420
                          DC      /4C82      LESS THAN                  U4K00430
                          DC      /4FBB      LOGICAL OR                 U4K00440
                          DC      /5ADB      EXCLAMATION POINT          U4K00450
                          DC      /5E93      SEMICOLON                  U4K00460
                          DC      /5FEB      LOGICAL NOT                U4K00470
                          DC      /6C95      PERCENT                    U4K00480
                          DC      /6DC0      UNDERSCORE                 U4K00490
                          DC      /6E87      GREATER THAN               U4K00500
                          DC      /6FB1      QUESTION MARK              U4K00510
                          DC      /7A84      COLON                      U4K00520
                          DC      /7B0B      POUND                      U4K00530
                          DC      /7D96      APOSTROPHE                 U4K00540
                          DC      /7F8B      QUOTE                      U4K00550
                    *                                                   U4K00560
                          DC      /4B6B      PERIOD                     U4K00570
                          DC      /4D99      LEFT PARENTHESIS           U4K00580
                          DC      /5B5B      DOLLAR SIGN                U4K00590
                          DC      /5C88      ASTERISK                   U4K00600
                          DC      /5D9A      RIGHT PARENTHESIS          U4K00610
                          DC      /6131      SLASH                      U4K00620
                          DC      /6B3B      COMMA                      U4K00630
                          DC      /7C20      AT                         U4K00640
                          DC      /7E81      EQUAL                      U4K00650
                    *                                                   U4K00660
                          DC      /E9A9      Z                          U4K00670
                          DC      /E8B8      Y                          U4K00680
                          DC      /E7B7      X                          U4K00690
                          DC      /E6A6      W                          U4K00700
                          DC      /E5A5      V                          U4K00710
                          DC      /E4B4      U                          U4K00720
                          DC      /E3A3      T                          U4K00730
                          DC      /E2B2      S                          U4K00740
                    *                                                   U4K00750
                          DC      /D9C9      R                          U4K00760
                          DC      /D8D8      Q                          U4K00770
                          DC      /D7D7      P                          U4K00780
                          DC      /D6C6      O (ALPHA)                  U4K00790
                          DC      /D5C5      N                          U4K00800
                          DC      /D4D4      M                          U4K00810
                          DC      /D3C3      L                          U4K00820
                          DC      /D2D2      K                          U4K00830
                          DC      /D1D1      J                          U4K00840
                    *                                                   U4K00850
                          DC      /C9F9      I                          U4K00860
                          DC      /C8E8      H                          U4K00870
                          DC      /C7E7      G                          U4K00880
                          DC      /C6F6      F                          U4K00890
                          DC      /C5F5      E                          U4K00900
                          DC      /C4E4      D                          U4K00910
                          DC      /C3F3      C                          U4K00920
                          DC      /C2E2      B                          U4K00930
                          DC      /C1E1      A                          U4K00940
                    *                                                   U4K00950
                          DC      /F919      9                          U4K00960
                          DC      /F808      8                          U4K00970
                          DC      /F707      7                          U4K00980
                          DC      /F616      6                          U4K00990
                          DC      /F515      5                          U4K01000
                          DC      /F404      4                          U4K01010
                          DC      /F313      3                          U4K01020
                          DC      /F202      2                          U4K01030
                          DC      /F101      1                          U4K01040
                          DC      /F01A      0 (NUMERIC)                U4K01050
                    *                                                   U4K01060
                          DC      /6040      DASH                       U4K01070
                          DC      /5070      AMPERSAND                  U4K01080
                          DC      /4EF0      PLUS                       U4K01090
                          DC      /4010      SPACE                      U4K01100
                          END                                           U4K01110
