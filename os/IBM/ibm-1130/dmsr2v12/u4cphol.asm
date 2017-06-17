                    *             JUNE 19,1967                          U4E00010
                    *************************************************** U4E00020
                    *                                                 * U4E00030
                    *   SUBROUTINE NAME-                              * U4E00040
                    *      FULL NAME-CONSOLE PRINTER CODE TO HOLLERITH* U4E00050
                    *         CONVERSION TABLE.                       * U4E00060
                    *      CODE NAME- CPHOL                           * U4E00070
                    *   METHOD-                                       * U4E00080
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4E00090
                    *   CAPABILITIES AND LIMITATIONS-                 * U4E00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4E00110
                    *   SPECIAL FEATURES- NON-EXECUTABLE              * U4E00120
                    *   ADDITIONAL INFORMATION-                       * U4E00130
                    *      ESTIMATED EXECUTION TIME- N/A              * U4E00140
                    *                                                 * U4E00150
                    *************************************************** U4E00160
                          HDNG    CONSOLE PRINTER TO HOLLERITH          U4E00170
                          ENT     CPHOL                                 U4E00180
                    CPHOL DC      /2E8E     ,COMMA       .PERIOD        U4E00190
                          DC      /5500     NEW LINE     NO GRAPHIC     U4E00200
                          DC      /0A8A     :            ¢              U4E00210
                          DC      /0035     NO GRAPHIC   LF             U4E00220
                          DC      /4012     -            @              U4E00230
                          DC      /0051     NO GRAPHIC   RESTORE        U4E00240
                          DC      /3E32     ?            %              U4E00250
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00260
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00270
                          DC      /0015     NO GRAPHIC   RS             U4E00280
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00290
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00300
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00310
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00320
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00330
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00340
                          DC      /3898     W            F              U4E00350
                          DC      /0059     NO GRAPHIC   BS             U4E00360
                          DC      /3898     W            F              U4E00370
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00380
                          DC      /3C9C     X            G              U4E00390
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00400
                          DC      /3C9C     X            G              U4E00410
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00420
                          DC      /2888     S            B              U4E00430
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00440
                          DC      /2888     S            B              U4E00450
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00460
                          DC      /2C8C     T            C              U4E00470
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00480
                          DC      /2C8C     T            C              U4E00490
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00500
                          DC      /2181     Z            I              U4E00510
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00520
                          DC      /2181     Z            I              U4E00530
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00540
                          DC      /2282     Y            H              U4E00550
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00560
                          DC      /2282     Y            H              U4E00570
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00580
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00590
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00600
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00610
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00620
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00630
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00640
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00650
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00660
                          DC      /3090     U            D              U4E00670
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00680
                          DC      /3090     U            D              U4E00690
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00700
                          DC      /3494     V            E              U4E00710
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00720
                          DC      /3494     V            E              U4E00730
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00740
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00750
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00760
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00770
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00780
                          DC      /2484     /            A              U4E00790
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00800
                          DC      /3684     UNDERSCORE   A              U4E00810
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00820
                          DC      /0E4E     #            $              U4E00830
                          DC      /0095     NO GRAPHIC   H. TAB         U4E00840
                          DC      /1A4A     =            !              U4E00850
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00860
                          DC      /2080     0(ZERO)      &              U4E00870
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00880
                          DC      /9E3A     LOGICAL OR   >              U4E00890
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00900
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00910
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00920
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00930
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00940
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00950
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00960
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00970
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E00980
                          DC      /1858     6            O              U4E00990
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01000
                          DC      /5A58     ;            O              U4E01010
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01020
                          DC      /1C5C     7            P              U4E01030
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01040
                          DC      /525C     *            P              U4E01050
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01060
                          DC      /0848     2            K              U4E01070
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01080
                          DC      /9A48     +            K              U4E01090
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01100
                          DC      /0C4C     3            L              U4E01110
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01120
                          DC      /924C     <            L              U4E01130
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01140
                          DC      /0141     9            R              U4E01150
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01160
                          DC      /1E41     QUOTE        R              U4E01170
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01180
                          DC      /0242     8            Q              U4E01190
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01200
                          DC      /1642     APOSTROPHE   Q              U4E01210
                          DC      /0000     NO GRAPHIC   NO GRAPHIC     U4E01220
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01230
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01240
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01250
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01260
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01270
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01280
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01290
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01300
                          DC      /1050     4            M              U4E01310
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01320
                          DC      /5E50     LOGICAL NOT  M              U4E01330
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01340
                          DC      /1454     5            N              U4E01350
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01360
                          DC      /5654     )            N              U4E01370
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01380
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01390
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01400
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01410
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01420
                          DC      /0444     1            J              U4E01430
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01440
                          DC      /9644     (            J              U4E01450
                          DC      /0        NO GRAPHIC   NO GRAPHIC     U4E01460
                          END                                           U4E01470
