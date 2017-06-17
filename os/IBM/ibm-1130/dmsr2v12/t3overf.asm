                          HDNG    CALL OVERF                            T3E00010
                    *************************************************** T3E00020
                    *                                                 * T3E00030
                    *   SUBROUTINE NAME-                              * T3E00040
                    *   FULL NAME- OVERFLOW TEST                      * T3E00050
                    *   CODE NAME- OVERF                              * T3E00060
                    *   PURPOSE- OVERF IS UTILIZED BY ALL FLOATING    * T3E00070
                    *      POINT SUBROUTINES TO CHECK FOR EXPONENT    * T3E00080
                    *      OVERFLOW AND UNDERFLOW.                    * T3E00090
                    *   METHOD-N/A                                    * T3E00100
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3E00110
                    *   SPECIAL FEATURES-N/A                          * T3E00120
                    *   ADDITIONAL INFORMATION-                       * T3E00130
                    *      ESTIMATED EXECUTION TIME-N/A               * T3E00140
                    *                                                 * T3E00150
                    *************************************************** T3E00160
                    *                                                 * T3E00170
                    *   ON OVERFLOW THE TV INDR AND I EQUAL 1         * T3E00180
                    *   ON UNDERFLOW THE TV INDR AND I EQUALS 3       * T3E00190
                    *   OTHERWISE THE TV INDR EQUALS ZERO             * T3E00200
                    *   AND I EQUALS 2                                * T3E00210
                    *                                                 * T3E00220
                          ENT     OVERF                                 T3E00230
                    OVERF DC      *-*        RECORD ADDR OF ARGUMENT    T3E00240
                          LD   I  OVERF      PICKUP ADDR OF ARG         T3E00250
                          STO     SET+1      ST  ADDR IN RESULT RETURN  T3E00260
                          LD    3 +122                                  T3E00270
                          BSC  L  SET,E      TV INDR IS ON              T3E00280
                          LD      TWO        SET ACC TO 2               T3E00290
                    SET   STO  L  *-*        ST  RESULT                 T3E00300
                          SLA     16                                    T3E00310
                          STO   3 +122       ZERO THE TV INDR           T3E00320
                          MDX  L  OVERF,+1   SET UP RET ADDR            T3E00330
                          BSC  I  OVERF      RETURN TO CALLER --EXIT--  T3E00340
                    TWO   DC      2          CONSTANT                   T3E00350
                          END                                           T3E00360
