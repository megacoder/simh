                    *************************************************** T2B00010
                    *   SUBROUTINE NAME                               * T2B00020
                    *      FULL NAME- FORTRAN 'STOP' STATEMENT        * T2B00030
                    *      CODE NAME- STOP                            * T2B00040
                    *   PURPOSE- SERVICE THE FORTRAN 'STOP'           * T2B00050
                    *      STATEMENT BY BRINGING EXECUTION TO         * T2B00060
                    *      A WAIT DISPLAYING THE REQUESTED CODE.      * T2B00070
                    *   METHOD- N/A                                   * T2B00080
                    *   CAPABILITIES AND LIMITATIONS- N/A             * T2B00090
                    *   SPECIAL FEATURES- N/A                         * T2B00100
                    *   ADDITIONAL INFORMATION- N/A                   * T2B00110
                    *************************************************** T2B00120
                          HDNG    LIBF STOP                             T2B00130
                          LIBR                                          T2B00140
                    *             CALLING SEQ  LIBF  STOP               T2B00150
                    *                          DC    CONST ADDR         T2B00160
                          ENT     STOP                                  T2B00170
                    STOP  SLA     0          NOP                        T2B00180
                          LDX  I2 *-*        PICK UP ADDR OF CONSTANT   T2B00190
                          LD   L  50                                    T2B00200
                          BSC  L  *-4,Z                                 T2B00210
                          LD   I2 *-*        LOAD CONSTANT IN AREG      T2B00220
                          BSI  L  /28        WAIT                       T2B00230
                          LDX     /38                                   T2B00240
                          END                                           T2B00250
