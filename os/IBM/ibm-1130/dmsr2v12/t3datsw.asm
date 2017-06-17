                          HDNG    CALL DATSW                            T3A00010
                    *************************************************** T3A00020
                    *                                                 * T3A00030
                    *   SUBROUTINE NAME-                              * T3A00040
                    *   FULL NAME- DATA ENTRY SWITCHES TEST           * T3A00050
                    *   CODE NAME- DATSW                              * T3A00060
                    *   PURPOSE- DATSW PERMITS  EXTERNAL CHECKING OF  * T3A00070
                    *      THE DATA SWITCHES TO DETERMINE A FLOW      * T3A00080
                    *      OF LOGIC WITHIN A PROGRAM.                 * T3A00090
                    *   METHOD-N/A                                    * T3A00100
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3A00110
                    *   SPECIAL FEATURES-N/A                          * T3A00120
                    *   ADDITIONAL INFORMATION-                       * T3A00130
                    *      ESTIMATED EXECUTION TIME-N/A               * T3A00140
                    *                                                 * T3A00150
                    *************************************************** T3A00160
                    *             TEST DATA ENTRY SWITCHES            * T3A00170
                          ENT     DATSW                                 T3A00180
                    DATSW DC      *-*        REC ADDR OF ARGUMENTS      T3A00190
                          LD   I  DATSW      PICK UP ARGUMENTS          T3A00200
                          STO     SS1+1                                 T3A00210
                          MDX  L  DATSW,+1   STEP TO NEXT ARGUMENT ADDR T3A00220
                          LD   I  DATSW                                 T3A00230
                          STO     SS2+1                                 T3A00240
                          XIO     SS3        READ CONSOLE SWITCHES      T3A00250
                          LD      SS4        LOAD SWITCH WORD TO ACC    T3A00260
                          STX   1 SSRT+1     SAVE XR1 IN SSRT           T3A00270
                    SS1   LDX  I1 *-*                                   T3A00280
                          SLA   1                                       T3A00290
                          BSC  L  SSON,+Z    IF NEG, SS ON GOTO SSON    T3A00300
                          LD      TWO                                   T3A00310
                    SS2   STO  L  *-*        STORE ONE OR TWO IN ARG2   T3A00320
                    SSRT  LDX  L1 *-*        RESTORE XR1                T3A00330
                          MDX  L  DATSW,+1   STEP TO RETURN ADDR        T3A00340
                          BSC  I  DATSW      RETURN                     T3A00350
                    SSON  LD      ONE                                   T3A00360
                          MDX     SS2                                   T3A00370
                          BSS  E  0          XIO CONSTANTS              T3A00380
                    SS3   DC      SS4        ADDR OF BIT SW STATUS      T3A00390
                          DC      /3A00      AREA CODE                  T3A00400
                    SS4   DC      *-*        READ SWITCHES INTO HERE    T3A00410
                    ONE   DC      1          CONSTANT                   T3A00420
                    TWO   DC      2          CONSTANT                   T3A00430
                          END                                           T3A00440
