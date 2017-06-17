                    *             JULY 6,1967                           T5C00010
                          HDNG    GETAD                                 T5C00020
                          LIBR                                          T5C00030
                          ENT     GETAD                                 T5C00040
                    *************************************************** T5C00050
                    *STATUS-VERSION 2,MODIFICATION 0                  * T5C00060
                    *                                                 * T5C00070
                    *FUNCTION/OPERATION-                              * T5C00080
                    *   THIS SUBROUTINE CALCULATES THE EFFECTIVE ADDR * T5C00090
                    *   OF A TABLE FROM A LIBF    TABLE INSTRUCTION   * T5C00100
                    *   IN THE ACCUMULATOR.                           * T5C00110
                    *                                                 * T5C00120
                    *ENTRY POINTS-                                    * T5C00130
                    *   * GETAD-ENTERED BY A LIBF    GETAD            * T5C00140
                    *                                                 * T5C00150
                    *INPUT-                                           * T5C00160
                    *   * THE ACC CONTAINS A LIBF    TABLE            * T5C00170
                    *                                                 * T5C00180
                    *OUTPUT-                                          * T5C00190
                    *   * THE ACC CONTAINS THE EFFECTIVE ADDRESS OF   * T5C00200
                    *     THE TABLE                                   * T5C00210
                    *                                                 * T5C00220
                    *EXTERNAL REFERENCES-N/A                            T5C00230
                    *                                                 * T5C00240
                    *EXITS                                            * T5C00250
                    *   NORMAL-                                       * T5C00260
                    *      * GETAD+1-RETURNS TO CALLING SUBROUTINE    * T5C00270
                    *   ERROR-N/A                                     * T5C00280
                    *                                                 * T5C00290
                    *TABLES/WORK AREAS-N/A                            * T5C00300
                    *                                                 * T5C00310
                    *ATTRIBUTES-RELOCATABLE                           * T5C00320
                    *                                                 * T5C00330
                    *NOTES-N/A                                        * T5C00340
                    *                                                 * T5C00350
                    *************************************************** T5C00360
                          HDNG    GETAD                                 T5C00370
                    GETAD MDX     *+2        ENTRY                      T5C00380
                          BSC  I  *-*        RETURN                     T5C00390
                          SLT     8          GET DISPLACEMENT IN ACC    T5C00400
                          SRT     8          SHIFT TO INCLUDE SIGN BITS T5C00410
                          STX   3 GZ901      SAVE CONTENTS OF XR3       T5C00420
                          A       GZ901      ADD CONTENTS OF XR3        T5C00430
                          A       GZ902      ADD 2                      T5C00440
                          STO     *+1        STORE EFFECTIVE ADDRESS    T5C00450
                          LD   L  *-*        LOAD EFFECTIVE ADDRESS     T5C00460
                          A       GZ902      ADD 2                      T5C00470
                          MDX     GETAD+1    RETURN                     T5C00480
                    *                                                   T5C00490
                    *                        CONSTANT STORAGE           T5C00500
                    *                                                   T5C00510
                    GZ901 DC      0          TEMP STORAGE CONTENTS XR3  T5C00520
                    GZ902 DC      2          CONSTANT                   T5C00530
                          END                                           T5C00540
