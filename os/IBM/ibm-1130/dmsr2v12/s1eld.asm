                    *************************************************** S1F00010
                    *                                                 * S1F00020
                    *   SUBROUTINE NAME-                              * S1F00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1F00040
                    *         POINT LOAD-STORE SUBPROGRAM.            * S1F00050
                    *      CODE NAME- ELD/ELDX/ESTO/ESTOX             * S1F00060
                    *   PURPOSE- THIS SUBPROGRAM LOADS THE SPECIFIED  * S1F00070
                    *      EXTENDED PRECISION FLOATING-POINT NUMBER   * S1F00080
                    *      INTO FAC,OR WILL STORE THE CONTENTS OF FAC * S1F00090
                    *      IN A SPECIFIED LOCATION.                   * S1F00100
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1F00110
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1F00120
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1F00130
                    *   SPECIAL FEATURES- N/A                         * S1F00140
                    *   ADDITIONAL INFORMATION-                       * S1F00150
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1F00160
                    *         SUBROUTINE LIBRARY MANUAL               * S1F00170
                    *                                                 * S1F00180
                    *************************************************** S1F00190
                          HDNG    LIBF ELD  -V1.                        S1F00200
                          LIBR                                          S1F00210
                          EPR                                           S1F00220
                          ENT     ELD                                   S1F00230
                          ENT     ELDX                                  S1F00240
                          ENT     ESTO                                  S1F00250
                          ENT     ESTOX                                 S1F00260
                    *                                                   S1F00270
                    *SUBROUTINES TO STORE (FAC) IN ARG                  S1F00280
                    *                                                   S1F00290
                    ESTOX STX   1 SV+1      INDEXED STORE ENTRY         S1F00300
                          LD   L  *-*       CALL +1                     S1F00310
                          MDX     COM                                   S1F00320
                    ESTO  STX   1 SV+1      NON-INDEXED STORE ENTRY     S1F00330
                          LD   L  *-*       CALL+1                      S1F00340
                          LDX   1 0         SUPPRESS INDEXING           S1F00350
                    COM   STO     *+3       STORE LOC OF OPND ADDR      S1F00360
                          A       ONE       INCR ADDR BY 1              S1F00370
                          STO     EXIT+1    BUILD EXIT                  S1F00380
                          MDX  I1 *-*       MODIFY XR1 BY OPND ADDR     S1F00390
                          NOP               IF MDX CAUSES BR,SKIP NOP   S1F00400
                          LDD   3 126       GET CONTENTS OF FAC         S1F00410
                          STO   1 1         AND STORE IN ARG LOC        S1F00420
                          RTE     16                                    S1F00430
                          STO   1 2                                     S1F00440
                          LD    3 125                                   S1F00450
                          STO   1 0                                     S1F00460
                          MDX     SV        BR TO QUIT                  S1F00470
                    ONE   DC      1         SINGLE WORD ONE             S1F00480
                    *                                                   S1F00490
                    *SUBROUTINES TO LOAD (ARG) INTO FAC                 S1F00500
                    *                                                   S1F00510
                    ELDX  STX   1 SV+1      INDEXED LOAD ENTRY          S1F00520
                          LD   L  *-*       CALL+1                      S1F00530
                          MDX     CMN                                   S1F00540
                    ELD   STX   1 SV+1      NON-INDEXED LOAD ENTRY      S1F00550
                          LD   L  *-*       CALL+1                      S1F00560
                          LDX   1 0         SUPPRESS INDEXING           S1F00570
                    CMN   STO     *+3       STORE LOC OF OPND ADDR      S1F00580
                          A       ONE       INCR ADDR BY 1              S1F00590
                          STO     EXIT+1    BUILD EXIT                  S1F00600
                          MDX  I1 *-*       MODIFY XR1 BY OPND ADDR     S1F00610
                          NOP               IF MAX CAUSES BR,SKIP NOP   S1F00620
                          LD    1 0         GET EXPONENT                S1F00630
                          STO   3 125       PUT IN FAC                  S1F00640
                          LD    1 2         GET SECOND HALF OF OPND     S1F00650
                          RTE     16        SHIFT TO EXTENSION          S1F00660
                          LD    1 1         GET FIRST HALF OF OPND      S1F00670
                          STD   3 126       PUT OPND IN FAC             S1F00680
                    SV    LDX  L1 *-*       RESTORE XR1                 S1F00690
                    EXIT  BSC  L  *-*       BR OUT                      S1F00700
                          END                                           S1F00710
