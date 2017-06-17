                          HDNG    CALL POINT                            V1M00010
                    *************************************************** V1M00020
                    *                                                 * V1M00030
                    *   SUBROUTINE NAME-                              * V1M00040
                    *      FULL NAME- STANDARD PRECISION POINT        * V1M00050
                    *         FUNCTION.                               * V1M00060
                    *      CODE NAME- POINT.                          * V1M00070
                    *   PURPOSE- DRAWS SPECIAL POINT CHARACTERS AT    * V1M00080
                    *      PRESENT POSITION OF THE PEN.               * V1M00090
                    *   METHOD- N/A.                                  * V1M00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1M00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1M00120
                    *      (FORM C26-3755).                           * V1M00130
                    *   SPECIAL FEATURES- N/A.                        * V1M00140
                    *   ADDITIONAL INFORMATION- N/A.                  * V1M00150
                    *                                                 * V1M00160
                    *************************************************** V1M00170
                          HDNG    CALL POINT                            V1M00180
                    *             THE CALL TO THE POINT SUBROUTINE      V1M00190
                    *             IS AS FOLLOWS                         V1M00200
                    *                                                   V1M00210
                    *             CALL    POINT                         V1M00220
                    *             DC      CHARACTER NO. (INTEGER)       V1M00230
                    *                                                   V1M00240
                          ENT     POINT                                 V1M00250
                    *                                                   V1M00260
                    *             ADDRESS AND CHARACTER TABLES          V1M00270
                    *                                                   V1M00280
                    X     DC      PADD      0   PLUS                    V1M00290
                          DC      XADD      1   X                       V1M00300
                          DC      UADD      2   UP      +X              V1M00310
                          DC      RADD      3   RIGHT   -Y              V1M00320
                          DC      DADD      4   DOWN    -X              V1M00330
                          DC      LADD      5   LEFT    +Y              V1M00340
                    PADD  DC      10        PLUS                        V1M00350
                          DC      /1111                                 V1M00360
                          DC      /1555                                 V1M00370
                          DC      /5555                                 V1M00380
                          DC      /5551                                 V1M00390
                          DC      /1111                                 V1M00400
                          DC      /7777                                 V1M00410
                          DC      /7333                                 V1M00420
                          DC      /3333                                 V1M00430
                          DC      /3337                                 V1M00440
                          DC      /7777                                 V1M00450
                    XADD  DC      10        X                           V1M00460
                          DC      /8888                                 V1M00470
                          DC      /8444                                 V1M00480
                          DC      /4444                                 V1M00490
                          DC      /4448                                 V1M00500
                          DC      /8888                                 V1M00510
                          DC      /6666                                 V1M00520
                          DC      /6222                                 V1M00530
                          DC      /2222                                 V1M00540
                          DC      /2226                                 V1M00550
                          DC      /6666                                 V1M00560
                    RADD  DC      6         RIGHT TRIANGLE              V1M00570
                          DC      /8888                                 V1M00580
                          DC      /8833                                 V1M00590
                          DC      /3333                                 V1M00600
                          DC      /3333                                 V1M00610
                          DC      /3366                                 V1M00620
                          DC      /6666                                 V1M00630
                    DADD  DC      6         LOWER TRIANGLE              V1M00640
                          DC      /2222                                 V1M00650
                          DC      /2255                                 V1M00660
                          DC      /5555                                 V1M00670
                          DC      /5555                                 V1M00680
                          DC      /5588                                 V1M00690
                          DC      /8888                                 V1M00700
                    LADD  DC      6         LEFT  TRIANGLE              V1M00710
                          DC      /4444                                 V1M00720
                          DC      /4477                                 V1M00730
                          DC      /7777                                 V1M00740
                          DC      /7777                                 V1M00750
                          DC      /7722                                 V1M00760
                          DC      /2222                                 V1M00770
                    UADD  DC      6         UPPER TRIANGLE              V1M00780
                          DC      /6666                                 V1M00790
                          DC      /6611                                 V1M00800
                          DC      /1111                                 V1M00810
                          DC      /1111                                 V1M00820
                          DC      /1144                                 V1M00830
                          DC      /4444                                 V1M00840
                    *                                                   V1M00850
                    POINT DC      *-*       ENTRY/RETURN ADDRESS        V1M00860
                          LD      POINT     FETCH                       V1M00870
                          STO     *+1       *CHARACTER                  V1M00880
                          LD   I  *-*       *NUMBER                     V1M00890
                          BSC  L  PTS,+Z    BRANCH IF NEG ARGUMENT  2-2 V1M00895
                          S       NOOF                                  V1M00900
                          BSC  L  PTS,-     BRANCH IF TOO LARGE ARG     V1M00910
                          A       ADDR      CALCULATE AND STORE         V1M00920
                          STO     X3+1      *ADDR OF CHARACTER TABLE    V1M00930
                          LD   I  X3+1      FETCH WORD COUNT            V1M00940
                          A       H0001     POINT TO                    V1M00950
                          STO     PLOOP+1   *BEGINNING OF TABLE         V1M00960
                    X3    LD   I  *-*       FETCH AND                   V1M00970
                          STO     WDCNT     *STORE WORD COUNT           V1M00980
                    PLOOP LD   L  *-*       OUTPUT CHARACTER STRING     V1M00990
                    X1    SRA     12                                    V1M01000
                          AND     H000F                                 V1M01010
                          STO     *+1                                   V1M01020
                          LIBF    PLOTI                                 V1M01030
                          DC      *-*                                   V1M01040
                          MDX  L  X1,-4                                 V1M01050
                    MDX   MDX  L  PPERW,-1                              V1M01060
                          MDX     PLOOP                                 V1M01070
                          LD      FOUR      RESET                       V1M01080
                          STO     PPERW     *LOOP COUNTER               V1M01090
                          MDX  L  PLOOP+1,1 INCREMENT ADDRESS           V1M01100
                          NOP                                           V1M01110
                          LD      SRA       RESET                       V1M01120
                          STO     X1        *INSTRUCTION                V1M01130
                          MDX  L  WDCNT,-1  DECREMENT WORD COUNT        V1M01140
                          MDX     PLOOP     REPEAT LOOP                 V1M01150
                    PTS   MDX  L  POINT,1   SET RETURN ADDRESS          V1M01160
                          NOP                                           V1M01170
                          BSC  I  POINT      RETURN                     V1M01180
                    *                                                   V1M01190
                    *             CONSTANTS                             V1M01200
                    *                                                   V1M01210
                    FOUR  DC      4         CONSTANT FOUR               V1M01220
                    PPERW DC      4         LOOP COUNTER                V1M01230
                    WDCNT DC      *-*       WORD COUNT                  V1M01240
                    ADDR  DC      X+6       ADDR OF END OF ADDR TABLE   V1M01250
                    SRA   SRA     12        SHIFT INSTRUCTION           V1M01260
                    H0001 DC      1         HEXADECIMAL ONE             V1M01270
                    H000F DC      /F        HEXADECIMAL F               V1M01280
                    NOOF  DC      6         NUMBER OF CHARACTERS        V1M01290
                          END                                           V1M01300
