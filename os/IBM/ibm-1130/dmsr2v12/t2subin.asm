                          HDNG    LIBF SUBIN                            T2C00010
                    *             FORTRAN SUBROUTINE INITIALIZATION     T2C00020
                          LIBR    SUBIN                                 T2C00030
                          ENT     SUBIN                                 T2C00040
                    *************************************************** T2C00050
                    *   SUBROUTINE NAME                               * T2C00060
                    *      FULL NAME- SUBROUTINE INITIALIZATION       * T2C00070
                    *      CODE NAME- SUBIN                           * T2C00080
                    *   PURPOSE- SYSTEM SUBROUTINE 'SUBIN'            * T2C00090
                    *      INITIALIZES A FORTRAN SUBPROGRAM BY        * T2C00100
                    *      TRANSFERRING THE ADDRESSES IN THE          * T2C00110
                    *      ARGUMENT LIST OF THE CALLING PROGRAM       * T2C00120
                    *      AND INSERTING THEM AS ADDRESSES OF         * T2C00130
                    *      DUMMY VARIABLES IN THE CALLED              * T2C00140
                    *      SUBPROGRAM.                                * T2C00150
                    *      IT ALSO INCREMENTS THE ADDRESS IN          * T2C00160
                    *      THE LINK WORD OF THE SUBPROGRAM BY         * T2C00170
                    *      THE NUMBER OF ARGUMENTS SO THAT THE        * T2C00180
                    *      LINK WORD WILL BECOME RETURN ADDRESS       * T2C00190
                    *      (=FIRST WORD AFTER THE ARGUMENT LIST       * T2C00200
                    *      IN THE CALLING PROGRAM).                   * T2C00210
                    *                                                 * T2C00220
                    *                                                 * T2C00230
                    *                                                 * T2C00240
                    *      CALLING PROGRAM REFERS TO A                * T2C00250
                    *      FORTRAN SUBPROGRAM WITH A LONG             * T2C00260
                    *      BSI INSTRUCTION (ADDRESS = ADDRESS OF      * T2C00270
                    *      THE SUBPROGRAM), FOLLOWED BY AN            * T2C00280
                    *      ARGUMENT LIST.                             * T2C00290
                    *                                                 * T2C00300
                    *      IN ORDER TO TRANSFER THESE ARGUMENTS,      * T2C00310
                    *      THE FIRST EXECUTABLE INSTRUCTION IN        * T2C00320
                    *      EACH SUBPROGRAM THAT HAS DUMMY             * T2C00330
                    *      VARIABLES IS A SHORT BSI INSTRUCTION       * T2C00340
                    *      (ADDRESS = TRANSFER VECTOR ADDRESS OF      * T2C00350
                    *      'SUBIN'), FOLLOWED BY A LIST OF ADD-       * T2C00360
                    *      RESSES OF THE DUMMY VARIABLES TO           * T2C00370
                    *      BE INSERTED.                               * T2C00380
                    *                                                 * T2C00390
                    *                                                 * T2C00400
                    *                                                 * T2C00410
                    *      TO INDICATE WHICH DUMMY VARIABLE IS        * T2C00420
                    *      REFERRED TO IN THE LIST, THE ARRAY OF      * T2C00430
                    *      ADDRESSES REFERRING TO ONE DUMMY           * T2C00440
                    *      VARIABLE IS TERMINATED BY A                * T2C00450
                    *      ZERO. THE ZERO TERMINATING                 * T2C00460
                    *      THE LAST ARRAY IS FOLLOWED BY A            * T2C00470
                    *      WORD = 0001 TO INDICATE THE END OF         * T2C00480
                    *      THE LIST. (CONSTANT = 1 IS                 * T2C00490
                    *      USED SINCE IT CAN NEVER BE MISTAKEN        * T2C00500
                    *      FOR  AN ADDRESS.)                          * T2C00510
                    *      HAVING ENCOUNTERED CONSTANT OF ONE,        * T2C00520
                    *      'SUBIN' TRANSFERS CONTROL TO THE           * T2C00530
                    *      NEXT WORD (AFTER THE CONSTANT), WHICH      * T2C00540
                    *      IS THE NEXT POST-INITIALIZATION            * T2C00550
                    *      EXECUTABLE INSTRUCTION.                    * T2C00560
                    *                                                 * T2C00570
                    *      SUBROUTINES THAT HAVE NO ARGUMENTS         * T2C00580
                    *      DO NOT REQUIRE SUBROUTINE 'SUBIN'.         * T2C00590
                    *                                                 * T2C00600
                    *   METHOD- N/A                                   * T2C00610
                    *   CAPABILITIES AND LIMITATIONS- N/A             * T2C00620
                    *   SPECIAL FEATURES- N/A                         * T2C00630
                    *   ADDITIONAL INFORMATION- N/A                   * T2C00640
                    *************************************************** T2C00650
                    SUBIN SLA     0        DUMMY-INSTRUCTION            T2C00660
                          LD   L  *+*-*-*  GET LINK WORD FROM TV        T2C00670
                          STO     ADR1+1                                T2C00680
                          S       TWO      COMPUTE AND INSERT ADDRESS   T2C00690
                          STO     ADR0+1   *OF LINK WORD (= SUBPROGRAM  T2C00700
                          STO     ADR2+1   *LINK WORD)                  T2C00710
                    ADR0  LDX  I1 *-*                                   T2C00720
                    ADR1  LD   L  *-*      GET NEXT ADDR, ZERO, OR ONE  T2C00730
                          BSC  L  ADR3,Z   BR IF NOT A ZERO             T2C00740
                          MDX   1 1        MOVE XR1 TO NEXT ARGUMENT    T2C00750
                    ADR2  MDX  L  *-*,1    INCR ADDR IN LINK WORD       T2C00760
                          MDX     ADR5                                  T2C00770
                    ADR3  STO     ADR4+1   INSERT ADDRESS               T2C00780
                          SRA     1                                     T2C00790
                          BSC     +-       SKIP IF NOT ONE              T2C00800
                          MDX     ADR6     BR IF END OF ARGUMENT LIST   T2C00810
                          LD    1 0        TRANSFER ONE ADDRESS FROM    T2C00820
                    ADR4  STO  L  *-*      ARGUMENT LIST OF CALL PROG   T2C00830
                    ADR5  MDX  L  ADR1+1,1 INCR SUBIN ARGUMENT POINTER  T2C00840
                          MDX     ADR1                                  T2C00850
                    ADR6  MDX  L  ADR1+1,1                              T2C00860
                          BSC  I  ADR1+1   RETURN TO SUBPROGRAM         T2C00870
                    TWO   DC      2                                     T2C00880
                    *                      (INITIALIZATION TERMINATED)  T2C00890
                    *                                                   T2C00900
                    *************************************************** T2C00910
                          END                                           T2C00920
