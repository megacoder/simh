                    *             JULY 6,1967                           T5E00010
                          HDNG    HOLTB                                 T5E00020
                    *             SINGLE DEVICE HOLLERITH TABLE         T5E00030
                          LIBR                                          T5E00040
                    *************************************************** T5E00050
                    *                                                 * T5E00060
                    *STATUS-VERSION 2, MODIFICATION 0                 * T5E00070
                    *                                                 * T5E00080
                    *FUNCTION/OPERATION-                              * T5E00090
                    *   TABLE OF HOLLERITH CHARACTERS USED BY THE     * T5E00100
                    *   HOLEZ SUBROUTINE IN CONJUNCTION WITH THE EBCTB* T5E00110
                    *   TABLE TO CONVERT FROM HOLLERITH TO EBC CODE OR* T5E00120
                    *   VICE VERSA                                    * T5E00130
                    *   THE TABLE ADDRESS IS OBTAINED FROM THE LIBF   * T5E00140
                    *   TRANSFER VECTOR BY THE GETAD SUBROUTINE.      * T5E00150
                    *                                                 * T5E00160
                    *ENTRY POINTS-                                    * T5E00170
                    *   *HOLTB                                        * T5E00180
                    *                                                 * T5E00190
                    *INPUT-N/A                                        * T5E00200
                    *                                                 * T5E00210
                    *OUTPUT-N/A                                       * T5E00220
                    *                                                 * T5E00230
                    *EXTERNAL REFERENCES-N/A                          * T5E00240
                    *                                                 * T5E00250
                    *EXITS-N/A                                        * T5E00260
                    *                                                 * T5E00270
                    *TABLES/WORK AREAS-N/A                            * T5E00280
                    *                                                 * T5E00290
                    *ATTRIBUTES-RELOCATABLE                           * T5E00300
                    *                                                 * T5E00310
                    *NOTES-N/A                                        * T5E00320
                    *                                                 * T5E00330
                    *************************************************** T5E00340
                          HDNG    HOLTB                                 T5E00350
                    *                                                   T5E00360
                    *             HOLLERITH TABLE                       T5E00370
                    *                                                   T5E00380
                          ENT     HOLTB                                 T5E00390
                    *                                                   T5E00400
                          DC      0              BLANK                  T5E00410
                          DC      /2000          0                      T5E00420
                          DC      /1000          1                      T5E00430
                          DC      /0800          2                      T5E00440
                          DC      /0400          3                      T5E00450
                          DC      /0200          4                      T5E00460
                          DC      /0100          5                      T5E00470
                          DC      /0080          6                      T5E00480
                          DC      /0040          7                      T5E00490
                          DC      /0020          8                      T5E00500
                          DC      /0010          9                      T5E00510
                          DC      /4000          -                      T5E00520
                          DC      /8420          .                      T5E00530
                          DC      /8100          E                      T5E00540
                          DC      /80A0          PLUS                   T5E00550
                          DC      /8000          AMPERSAND              T5E00560
                          DC      /00A0          EQUAL                  T5E00570
                          DC      /4120          RIGHT PAREN            T5E00580
                          DC      /8120          LEFT PAREN             T5E00590
                          DC      /2420          ,                      T5E00600
                          DC      /0120          APOSTROPHE             T5E00610
                          DC      /3000          /                      T5E00620
                          DC      /4220          *                      T5E00630
                          DC      /4420          $                      T5E00640
                          DC      /8220          LESS THAN              T5E00650
                          DC      /2220          PERCENT                T5E00660
                          DC      /0420          POUND SIGN             T5E00670
                          DC      /0220          AT SIGN                T5E00680
                          DC      /9000          A                      T5E00690
                          DC      /8800          B                      T5E00700
                          DC      /8400          C                      T5E00710
                          DC      /8200          D                      T5E00720
                          DC      /8080          F                      T5E00730
                          DC      /8040          G                      T5E00740
                          DC      /8020          H                      T5E00750
                          DC      /8010          I                      T5E00760
                          DC      /5000          J                      T5E00770
                          DC      /4800          K                      T5E00780
                          DC      /4400          L                      T5E00790
                          DC      /4200          M                      T5E00800
                          DC      /4100          N                      T5E00810
                          DC      /4080          O                      T5E00820
                          DC      /4040          P                      T5E00830
                          DC      /4020          Q                      T5E00840
                          DC      /4010          R                      T5E00850
                          DC      /2800          S                      T5E00860
                          DC      /2400          T                      T5E00870
                          DC      /2200          U                      T5E00880
                          DC      /2100          V                      T5E00890
                          DC      /2080          W                      T5E00900
                          DC      /2040          X                      T5E00910
                          DC      /2020          Y                      T5E00920
                          DC      /2010          Z                      T5E00930
                    X     DC      0                                     T5E00940
                    HOLTB EQU     X-2                                   T5E00950
                          END                                           T5E00960
