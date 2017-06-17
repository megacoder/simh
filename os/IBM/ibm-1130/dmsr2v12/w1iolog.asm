                          HDNG    IOLOG                                 W1J00010
                    *************************************************** W1J00020
                    *STATUS-VERSION 2, MODIFICATION 3                 * W1J00030
                    *                                                 * W1J00040
                    *     THIS DUMMY SUBROUTINE IS A SUBSTITUTE FOR   * W1J00050
                    *     THE REAL IOLOG SUBROUTINE, WHICH LOGS       * W1J00060
                    *     FUNCTION PARAMETERS AND CONTROL CHARACTERS  * W1J00070
                    *     FOR SCAT1.                                  * W1J00080
                    *                                                 * W1J00090
                    *************************************************** W1J00100
                          HDNG    IOLOG DUMMY SUBR                      W1J00110
                          ENT     IOLOG                             2-3 W1J00120
                          ENT     CPLOG                             2-3 W1J00130
                    IOLOG DC      *-*        PRIMARY ENTRY          2-3 W1J00140
                          BSC  I  IOLOG      RETURN                 2-3 W1J00150
                    CPLOG DC      *-*        SECONDARY ENTRY        2-3 W1J00160
                          BSC  I  CPLOG      RETURN                 2-3 W1J00170
                          END                                       2-3 W1J00180
