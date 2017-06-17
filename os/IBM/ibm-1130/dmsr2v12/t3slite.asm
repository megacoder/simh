                          HDNG    CALL SLITE                            T3G00010
                    *************************************************** T3G00020
                    * STATUS-VERSION 2,MODIFICATION 9                 * T3G00025
                    *                                                 * T3G00030
                    *   SUBROUTINE NAME-                              * T3G00040
                    *      FULL NAME-SENSE LIGHT CONTROL AND TEST     * T3G00050
                    *      CODE NAME-SLITE                            * T3G00060
                    *   PURPOSE-SIMULATE CONSOLE SENSE LIGHTS         * T3G00070
                    *   METHOD-N/A                                    * T3G00080
                    *   CAPABILITIES AND LIMITATIONS-4 SENSE LIGHTS   * T3G00090
                    *   SPECIAL FEATURES-SIMULATES SENSE LIGHTS       * T3G00100
                    *   ADDITIONAL INFORMATION-                       * T3G00110
                    *      ESTIMATED EXECUTION TIME-N/A               * T3G00120
                    *                                                 * T3G00130
                    *************************************************** T3G00140
                    *                                                 * T3G00150
                          ENT     SLITE                                 T3G00160
                          ENT     SLITT                                 T3G00170
                    SLITE DC      *-*        RECORD ADDR OF PARAMETERS  T3G00180
                          LD   I  SLITE      ADD OF ARG TO ACC          T3G00190
                          STO     SET+1                                 T3G00200
                          LD   I  SET+1      ARG TO ACC                 T3G00210
                          BSC  L  NONZ,Z     BR IF NON ZERO             T3G00220
                          STO  L  $SNLT     ZERO SENSE LIGHT INDR   2-9 T3G00230
                    SLRTN MDX  L  SLITE,+1                              T3G00240
                          BSC  I  SLITE      RETURN ---EXIT---          T3G00250
                    NONZ  BSC  L  SLRTN,+    GOTO RETURN IF ARG IS NEG  T3G00260
                          S       FOUR                                  T3G00270
                          BSC  L  SLRTN,-Z   GOTO RETURN IF ARG GT 4    T3G00280
                          STX   1 RESTR+1    SAVE XR1                   T3G00290
                    SET   LDX  I1 *-*        ARG TO XR1                 T3G00300
                          LD      ONE       SET ACTUAL              2-9 T3G00310
                          SLA   1           *BIT IN                 2-9 T3G00320
                          OR   L  $SNLT     *SENSE LIGHT            2-9 T3G00330
                          STO  L  $SNLT     *INDICATOR              2-9 T3G00340
                    *                                               2-9 T3G00350
                    RESTR LDX  L1 *-*        RESTORE XR1                T3G00360
                          MDX     SLRTN      GOTO RETURN                T3G00370
                    $SNLT EQU     /00EF     SENSE LIGHT INDICATOR   2-9 T3G00380
                    ONE   DC      1          CONSTANT                   T3G00390
                    FOUR  DC      4          CONSTANT                   T3G00400
                    *                                                 * T3G00410
                    *************************************************** T3G00420
                    SLITT DC      *-*        RECORD ADDR OF PARAMETERS  T3G00430
                          LD   I  SLITT      ADD OF ARG1 TO ACC         T3G00440
                          STO     LDA1+1                                T3G00450
                          MDX  L  SLITT,+1                              T3G00460
                          LD   I  SLITT      ADD OF ARG2 TO ACC         T3G00470
                          STO     STA2+1                                T3G00480
                          LD      SLITT                                 T3G00490
                          STO     SLITE                                 T3G00500
                          STX   1 RESTR+1                               T3G00510
                          LD   I  LDA1+1     ARG1 TO ACC                T3G00520
                          BSC  L  LOFF,+     GOTO LOFF IF NEG           T3G00530
                          S       FOUR                                  T3G00540
                          BSC  L  LOFF,-Z    GOTO LOFF IF GT 4          T3G00550
                    LDA1  LDX  I1 *-*        ARG1 TO XR1                T3G00560
                          LD   L  $SNLT                             2-9 T3G00570
                          SRT   1            LITE TO POS 0              T3G00580
                          BSC     E                                     T3G00590
                          MDX     BITON      GOTO BITON IF LITE ON      T3G00600
                    LOFF  LD      TWO        TWO TO ACC                 T3G00610
                    STA2  STO  L  *-*        ACC TO ARG2                T3G00620
                          MDX     RESTR                                 T3G00630
                    BITON S       ONE        TURN LITE OFF              T3G00640
                          SLT   1                                       T3G00650
                          STO  L  $SNLT     SET SENSE LIGHT INDR    2-9 T3G00660
                          LD      ONE        ONE TO ACC                 T3G00670
                          MDX     STA2                                  T3G00680
                    TWO   DC      2          CONSTANT                   T3G00690
                          END                                           T3G00700
