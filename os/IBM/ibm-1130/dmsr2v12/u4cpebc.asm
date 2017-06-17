                    *             JUNE 19,1967                          U4D00010
                    *************************************************** U4D00020
                    *                                                 * U4D00030
                    *   SUBROUTINE NAME-                              * U4D00040
                    *      FULLNAME- CONSOLE PRINTER CODE TO EBCDIC   * U4D00050
                    *         CONVERSION TABLE.                       * U4D00060
                    *      CODE NAME- CPEBC                           * U4D00070
                    *   METHOD-                                       * U4D00080
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4D00090
                    *   CAPABILITIES AND LIMITATIONS-                 * U4D00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4D00110
                    *   SPECIAL FEATURES- NON-EXECUTABLE              * U4D00120
                    *   ADDITIONAL INFORMATION-                       * U4D00130
                    *      ESTIMATED EXECUTION TIME- N/A              * U4D00140
                    *                                                 * U4D00150
                    *************************************************** U4D00160
                          HDNG    CONSOLE PRINTER TO EBCDIC             U4D00170
                          ENT     CPEBC                                 U4D00180
                    CPEBC DC      /6B4B     ,(COMMA)     .PERIOD        U4D00190
                          DC      /1540     NL           NO GRAPHIC     U4D00200
                          DC      /7A4A     :            ¢              U4D00210
                          DC      /4025     NO GRAPHIC   LF             U4D00220
                          DC      /607C     - DASH       @              U4D00230
                          DC      /4014     NO GRAPHIC   RES            U4D00240
                          DC      /6F6C     ?            %              U4D00250
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00260
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00270
                          DC      /4035     NO GRAPHIC   RS             U4D00280
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00290
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00300
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00310
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00320
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00330
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00340
                          DC      /E6C6     W            F              U4D00350
                          DC      /4016     NO GRAPHIC   BS             U4D00360
                          DC      /E6C6     W            F              U4D00370
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00380
                          DC      /E7C7     X            G              U4D00390
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00400
                          DC      /E7C7     X            G              U4D00410
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00420
                          DC      /E2C2     S            B              U4D00430
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00440
                          DC      /E2C2     S            B              U4D00450
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00460
                          DC      /E3C3     T            C              U4D00470
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00480
                          DC      /E3C3     T            C              U4D00490
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00500
                          DC      /E9C9     Z            I              U4D00510
                          DC      /4040     NO GRAPHIC   SPACE          U4D00520
                          DC      /E9C9     A            I              U4D00530
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00540
                          DC      /E8C8     Y            H              U4D00550
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00560
                          DC      /E8C8     Y            H              U4D00570
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00580
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00590
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00600
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00610
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00620
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00630
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00640
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00650
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00660
                          DC      /E4C4     U            D              U4D00670
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00680
                          DC      /E4C4     U            D              U4D00690
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00700
                          DC      /E5C5     V            E              U4D00710
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00720
                          DC      /E5C5     V            E              U4D00730
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00740
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00750
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00760
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00770
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00780
                          DC      /61C1     /            A              U4D00790
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00800
                          DC      /6DC1     UNDERSCORE   A              U4D00810
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00820
                          DC      /7B5B     #            $              U4D00830
                          DC      /4005     NO GRAPHIC   HTAB           U4D00840
                          DC      /7E5A     =            !              U4D00850
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00860
                          DC      /F050     0(ZERO)      &              U4D00870
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00880
                          DC      /4F6E     LOGICAL OR   >              U4D00890
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00900
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00910
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00920
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00930
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00940
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00950
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00960
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00970
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D00980
                          DC      /F6D6     6            O              U4D00990
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01000
                          DC      /5ED6     ;            O              U4D01010
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01020
                          DC      /F7D7     7            P              U4D01030
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01040
                          DC      /5CD7     *            P              U4D01050
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01060
                          DC      /F2D2     2            K              U4D01070
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01080
                          DC      /4ED2     +            K              U4D01090
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01100
                          DC      /F3D3     3            L              U4D01110
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01120
                          DC      /4CD3     <            L              U4D01130
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01140
                          DC      /F9D9     9            R              U4D01150
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01160
                          DC      /7FD9     QUOTE        R              U4D01170
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01180
                          DC      /F8D8     8            Q              U4D01190
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01200
                          DC      /7DD8     APOSTROPHE   Q              U4D01210
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01220
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01230
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01240
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01250
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01260
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01270
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01280
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01290
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01300
                          DC      /F4D4     4            M              U4D01310
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01320
                          DC      /5FD4     LOGICAL NOT  M              U4D01330
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01340
                          DC      /F5D5     5            N              U4D01350
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01360
                          DC      /5DD5     )            N              U4D01370
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01380
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01390
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01400
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01410
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01420
                          DC      /F1D1     1            J              U4D01430
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01440
                          DC      /4DD1     (            J              U4D01450
                          DC      /4040     NO GRAPHIC   NO GRAPHIC     U4D01460
                          END                                           U4D01470
