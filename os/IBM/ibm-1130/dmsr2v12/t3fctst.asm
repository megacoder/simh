                          HDNG    CALL FCTST                            T3C00010
                    *************************************************** T3C00020
                    *                                                 * T3C00030
                    *   SUBROUTINE NAME-                              * T3C00040
                    *   FULL NAME- FUNCTIONAL ERROR TEST              * T3C00050
                    *   CODE NAME- FCTST                              * T3C00060
                    *   PURPOSE- FCTST IS UTILIZED BY THE FUNCTIONAL  * T3C00070
                    *      SUBROUTINES TO CHECK ERROR CONDITIONS.     * T3C00080
                    *      (SEE SUBROUTINE LIBRARY MANUAL)            * T3C00090
                    *   METHOD-N/A                                    * T3C00100
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3C00110
                    *   SPECIAL FEATURES-N/A                          * T3C00120
                    *   ADDITIONAL INFORMATION-                       * T3C00130
                    *      ESTIMATED EXECUTION TIME-N/A               * T3C00140
                    *                                                 * T3C00150
                    *************************************************** T3C00160
                    *                                                 * T3C00170
                    *   FCTST ON ERR, I EQUALS 1, J EQUALS TV INDR    * T3C00180
                    *   AND THE TV INDR IS SET TO ZERO                * T3C00190
                    *   FCTST NO ERR, I EQUALS 2, J EQUALS ZERO       * T3C00200
                    *                                                 * T3C00210
                          ENT     FCTST                                 T3C00220
                    FCTST DC      *-*                                   T3C00230
                          LD   I  FCTST      PICKUP ADDR OF I           T3C00240
                          STO     SET1+1     ST  ADDR IN SET1           T3C00250
                          MDX  L  FCTST,+1   INCR POINTER               T3C00260
                          LD   I  FCTST      PICKUP ADDR OF J           T3C00270
                          STO     SET2+1     ST  ADDR IN SET2           T3C00280
                          LD    3 +124       PICK UP THE TV INDR        T3C00290
                          BSC  L  SET2,+-    BRANCH IF NO ERR           T3C00300
                          STO  I  SET2+1     ST TV INDR IN J            T3C00310
                          LD      ONE        LD ACC WITH ONE            T3C00320
                    SET1  STO  L  *-*        ST  2 IN I                 T3C00330
                          SLA     16                                    T3C00340
                          STO   3 +124       ZERO THE TV INDR           T3C00350
                          MDX  L  FCTST,+1   INCR. RETURN ADDR          T3C00360
                          BSC  I  FCTST      EXIT                       T3C00370
                    SET2  STO  L  *-*        ST  ZERO IN J              T3C00380
                          LD      TWO        LOAD THE ACC WITH 2        T3C00390
                          MDX     SET1       BRANCH TO SET I TO ONE     T3C00400
                    TWO   DC      2          CONSTANT                   T3C00410
                    ONE   DC      1          CONSTANT                   T3C00420
                          END                                           T3C00430
