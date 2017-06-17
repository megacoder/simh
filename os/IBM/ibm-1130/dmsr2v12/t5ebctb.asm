                    *             JULY 6,1967                           T5B00010
                          HDNG    EBCTB                                 T5B00020
                    *             SINGLE DEVICE EBC TABLE               T5B00030
                          LIBR                                          T5B00040
                    *************************************************** T5B00050
                    *                                                 * T5B00060
                    *STATUS-VERSION 2, MODIFICATION 0                 * T5B00070
                    *                                                 * T5B00080
                    *FUNCTION/OPERATION-                              * T5B00090
                    *   TABLE TO CONVERT DATA FROM EBC TO TYPEWRITER  * T5B00100
                    *   CODE OR VICE-VERSA. BITS 0-7 OF EACH WORD     * T5B00110
                    *   CONTAIN THE EBC CHARACTER REPRESENTATION      * T5B00120
                    *   AND BITS 8-15 THE TYPEWRITER CODE.            * T5B00130
                    *   THE TABLE ADDRESS IS OBTAINED FROM THE LIBF   * T5B00140
                    *   TRANSFER VECTOR BY THE GETAD SUBROUTINE AND   * T5B00150
                    *   IS USED BY THE HOLEZ SUBROUTINE FOR CONVERSION* T5B00160
                    *                                                 * T5B00170
                    *ENTRY POINTS-                                    * T5B00180
                    *   * EBCTB                                       * T5B00190
                    *                                                 * T5B00200
                    *INPUT-N/A                                        * T5B00210
                    *                                                 * T5B00220
                    *OUTPUT-N/A                                       * T5B00230
                    *                                                 * T5B00240
                    *EXTERNAL REFERENCES-N/A                          * T5B00250
                    *                                                 * T5B00260
                    *EXITS-N/A                                        * T5B00270
                    *                                                 * T5B00280
                    *TABLES/WORK AREAS-N/A                            * T5B00290
                    *ATTRIBUTES-RELOCATABLE                           * T5B00300
                    *                                                 * T5B00310
                    *NOTES-N/A                                        * T5B00320
                    *                                                 * T5B00330
                    *************************************************** T5B00340
                          HDNG    EBCTB                                 T5B00350
                          ENT     EBCTB                                 T5B00360
                    *                                                   T5B00370
                    *             THE FOLLOWING   CHARACTERS ARE TYPE-  T5B00380
                    *             WRITER CONTROL CHARACTERS AND ARE     T5B00390
                    *             USED ONLY BY THE TYPEWRITER CONVERT   T5B00400
                    *             SUBROUTINES WRTYZ AND TYPEZ           T5B00410
                    *                                                   T5B00420
                          DC      /1611          BACKSPACE              T5B00430
                          DC      /1581          CARRIER RETURN         T5B00440
                          DC      /2503          LINE FEED              T5B00450
                          DC      /1405          SHIFT TO PRINT BLACK   T5B00460
                          DC      /3509          SHIFT TO PRINT RED     T5B00470
                          DC      /0541          TABULATE               T5B00480
                    *                                                   T5B00490
                    *             EBC-TYPEWRITER TABLE                  T5B00500
                    *                                                   T5B00510
                          DC      /4021          BLANK                  T5B00520
                          DC      /F0C4          0                      T5B00530
                          DC      /F1FC          1                      T5B00540
                          DC      /F2D8          2                      T5B00550
                          DC      /F3DC          3                      T5B00560
                          DC      /F4F0          4                      T5B00570
                          DC      /F5F4          5                      T5B00580
                          DC      /F6D0          6                      T5B00590
                          DC      /F7D4          7                      T5B00600
                          DC      /F8E4          8                      T5B00610
                          DC      /F9E0          9                      T5B00620
                          DC      /6084          -                      T5B00630
                          DC      /4B00          .                      T5B00640
                          DC      /C534          E                      T5B00650
                          DC      /4EDA          PLUS                   T5B00660
                          DC      /5044          AMPERSAND              T5B00670
                          DC      /7EC2          EQUAL                  T5B00680
                          DC      /5DF6          RIGHT PAREN            T5B00690
                          DC      /4DFE          LEFT PAREN             T5B00700
                          DC      /6B80          ,                      T5B00710
                          DC      /7DE6          APOSTROPHE             T5B00720
                          DC      /61BC          /                      T5B00730
                          DC      /5CD6          *                      T5B00740
                          DC      /5B40          $                      T5B00750
                          DC      /4CDE          LESS THAN              T5B00760
                          DC      /6C06          PERCENT                T5B00770
                          DC      /7BC0          POUND SIGN             T5B00780
                          DC      /7C04          AT SIGN                T5B00790
                          DC      /C13C          A                      T5B00800
                          DC      /C218          B                      T5B00810
                          DC      /C31C          C                      T5B00820
                          DC      /C430          D                      T5B00830
                          DC      /C610          F                      T5B00840
                          DC      /C714          G                      T5B00850
                          DC      /C824          H                      T5B00860
                          DC      /C920          I                      T5B00870
                          DC      /D17C          J                      T5B00880
                          DC      /D258          K                      T5B00890
                          DC      /D35C          L                      T5B00900
                          DC      /D470          M                      T5B00910
                          DC      /D574          N                      T5B00920
                          DC      /D650          O                      T5B00930
                          DC      /D754          P                      T5B00940
                          DC      /D864          Q                      T5B00950
                          DC      /D960          R                      T5B00960
                          DC      /E298          S                      T5B00970
                          DC      /E39C          T                      T5B00980
                          DC      /E4B0          U                      T5B00990
                          DC      /E5B4          V                      T5B01000
                          DC      /E690          W                      T5B01010
                          DC      /E794          X                      T5B01020
                          DC      /E8A4          Y                      T5B01030
                          DC      /E9A0          Z                      T5B01040
                    X     DC      0                                     T5B01050
                    EBCTB EQU     X-2                                   T5B01060
                          END                                           T5B01070
