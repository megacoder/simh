                          HDNG    LIBF TTEST                            T2E00010
                    *************************************************** T2E00020
                    *                                                 * T2E00030
                    *   SUBROUTINE NAME-                              * T2E00040
                    *      FULL NAME-FORTRAN TRACE TEST AND SET       * T2E00050
                    *      CODE NAME-TTEST                            * T2E00060
                    *   PURPOSE-TO SEE IF TRACE SHOULD BE EXECUTED.   * T2E00070
                    *      TO SET THE INTERNAL INDICATOR FOR TTEST    * T2E00080
                    *   METHOD-N/A                                    * T2E00090
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T2E00100
                    *   SPECIAL FEATURES-N/A                          * T2E00110
                    *   ADDITIONAL INFORMATION-                       * T2E00120
                    *      ESTIMATED EXECUTION TIME-N/A               * T2E00130
                    *                                                 * T2E00140
                    *************************************************** T2E00150
                    *                                                 * T2E00160
                    *   ENTER HERE TO SEE IF TRACE SHOULD BE EXECUTED.* T2E00170
                    *   IF DATSW 15 IS ON AND THE INTERNAL INDR IS ON * T2E00180
                    *   THEN TTEST WILL RETURN TO EXECUTE THE TRACE.  * T2E00190
                    *   IF EITHER INDR IS OFF THEN TTEST WILL RETURN  * T2E00200
                    *   TO A BRANCH INST IN THE TRACE THAT WILL BYPASS* T2E00210
                    *   THE PRINTING.                                 * T2E00220
                    *                                                 * T2E00230
                          LIBR    TTEST                                 T2E00240
                          ENT     TTEST                                 T2E00250
                          ENT     TSET                                  T2E00260
                    TTEST XIO     TR1        READ DATA SWITCHES         T2E00270
                          LDX  I2 *-*        STORE RT ADDR IN  XR2      T2E00280
                          LD      TRIND      LOAD INTERNAL INDR TO ACC  T2E00290
                          AND     TR2        AND BIT 15 AND INT INDR    T2E00300
                          BSC     E          BR TO BY PASS TRACE PRINT  T2E00310
                          MDX   2 +1         INCREMENT RETURN ADDR      T2E00320
                          BSC  L2 *-*        BR TO DO TRACE PRINT       T2E00330
                    TRIND DC      1          TRACE INDR SET BY TSET     T2E00340
                          BSS  E  0                                     T2E00350
                    TR1   DC      TR2        ADDR TO READ IN SWITCHES   T2E00360
                          DC      /3A00      SPECIFY BIT SWITCH READ    T2E00370
                    TR2   DC      *-*        RECORD BIT SWITCH STATUS   T2E00380
                    *************************************************** T2E00390
                    *                                                 * T2E00400
                    *   ENTER HERE TO SET THE INTERNAL INDICATOR      * T2E00410
                    *   LIKE THE ACC WAS SET BY EITHER TSTRT OR TSTOP * T2E00420
                    *                                                 * T2E00430
                    TSET  STO     TRIND      STORE INT INDR IN TRIND    T2E00440
                          BSC  I  *-*        EXIT                       T2E00450
                          END                                           T2E00460
