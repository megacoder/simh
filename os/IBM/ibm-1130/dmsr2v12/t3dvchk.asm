                          HDNG    CALL DVCHK                            T3B00010
                    *************************************************** T3B00020
                    *                                                 * T3B00030
                    *   SUBROUTINE NAME-                              * T3B00040
                    *   FULL NAME- DIVIDE CHECK TEST                  * T3B00050
                    *   CODE NAME- DVCHK                              * T3B00060
                    *   PURPOSE- DVCHK IS UTILIZED BY THE FLOATING    * T3B00070
                    *      POINT DIVIDE SUBROUTINES TO CHECK FOR      * T3B00080
                    *      DIVISION BY ZERO.                          * T3B00090
                    *   METHOD-N/A                                    * T3B00100
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3B00110
                    *   SPECIAL FEATURES-N/A                          * T3B00120
                    *   ADDITIONAL INFORMATION-                       * T3B00130
                    *      ESTIMATED EXECUTION TIME-N/A               * T3B00140
                    *                                                 * T3B00150
                    *************************************************** T3B00160
                    *                                                 * T3B00170
                    *   ON DVCHK TV INDR EQUALS  0  IF NO DVCHK       * T3B00180
                    *   AND EQUALS 1 IF THERE WAS A DVCHK.            * T3B00190
                    *   ON DVCHK I EQUALS 2 IF DVCHK OFF AND EQUALS 1 * T3B00200
                    *   IF DVCHK IS ON.                               * T3B00210
                    *                                                 * T3B00220
                          ENT     DVCHK                                 T3B00230
                    DVCHK DC      *-*        RECORD ADDR OF ARGUMENT    T3B00240
                          LD   I  DVCHK      PICKUP ADD OF ARG          T3B00250
                          STO     SET+1      ST  ADDR IN OUTPUT INST    T3B00260
                          LD    3 +123       LD ACC WITH TV INDR        T3B00270
                          BSC     +-         IS IT ON                   T3B00280
                          A       TWO        *NO, SET INDR TO 2         T3B00290
                    SET   STO  L  *-*        RETURN RESULT              T3B00300
                          SLA     16         ZERO ACC                   T3B00310
                          STO   3 +123       ZERO OUT TV INDR           T3B00320
                          MDX  L  DVCHK,+1   SET RET ADDR               T3B00330
                          BSC  I  DVCHK      EXIT                       T3B00340
                    TWO   DC      2          CONSTANT                   T3B00350
                          END                                           T3B00360
