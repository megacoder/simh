                          HDNG    LIBF PLOTI                            V1K00010
                          LIBR                                          V1K00020
                          ENT     PLOTI                                 V1K00030
                          ENT     PLOTS                                 V1K00040
                    *************************************************** V1K00050
                    *   SUBROUTINE NAME-                              * V1K00060
                    *      FULL NAME-N/A                              * V1K00070
                    *      CODE NAME- PLOTI                           * V1K00080
                    *   PURPOSE- THIS SUBROUTINE IS AN INTERFACE FOR  * V1K00090
                    *      CALLING PLOTX. THIS SUBROUTINE MAY BE      * V1K00100
                    *      REPLACED WITH LINKAGE TO OTHER PLOT        * V1K00110
                    *      FUNCTIONS IF DESIRED.                      * V1K00120
                    *   METHOD- N/A                                   * V1K00130
                    *   CAPABILITIES AND LIMITATIONS- N/A             * V1K00140
                    *   SPECIAL FEATURES- N/A                         * V1K00150
                    *   ADDITIONAL INFORMATION-                       * V1K00160
                    *      CALLING SEQUENCES-                         * V1K00170
                    *         LIBF    PLOTI                           * V1K00180
                    *         DC      X                               * V1K00190
                    *                                                 * V1K00200
                    *         LIBF    PLOTS                           * V1K00210
                    *            PARAMETER IS IN ACCUMULATOR          * V1K00220
                    *************************************************** V1K00230
                    PLOTI STX   1 SXR1+1    SAVE XR1                    V1K00240
                          LDX  I1 *-*                                   V1K00250
                          LD    1 0         GET PARAMETER               V1K00260
                          OR      PLOTR                                 V1K00270
                          STO     MOVE      SET PLOTX PARAMETER         V1K00280
                          MDX   1 1                                     V1K00290
                          STX   1 RETN+1    SET RETURN ADDRESS          V1K00300
                          LIBF    PLOTX                                 V1K00310
                    MOVE  DC      *-*       PLOTX PARAMETER             V1K00320
                    SXR1  LDX  L1 *-*       RESTORE XR1                 V1K00330
                    RETN  BSC  L  *-*       RETURN                      V1K00340
                    PLOTR DC      *-*                                   V1K00350
                    PLOTS STO     PLOTR     SAVE PARAMETER FOR OR       V1K00360
                          BSC  I  *-*                                   V1K00370
                          END                                           V1K00380
