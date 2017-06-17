                          HDNG    CALL ESIGN                            S2F00010
                    *************************************************** S2F00020
                    *                                                 * S2F00030
                    *   SUBROUTINE NAME-                              * S2F00040
                    *      FULL NAME-EXTENDED PRECISION TRANSFER OF   * S2F00050
                    *         SIGN                                    * S2F00060
                    *      CODE NAME-ESIGN                            * S2F00070
                    *   PURPOSE-                                   2-12 S2F00080
                    *      PROVIDE FORTRAN SIGN CHANGE FUNCTION    2-12 S2F00085
                    *   METHOD-                                    2-12 S2F00090
                    *      CHANGE THE VALUE OF THE FLOATING ACCUM- 2-12 S2F00092
                    *      ULATOR (FAC) TO THE COMPLIMENT OF ARG1  2-12 S2F00094
                    *      IF THE SIGNS OF ARG1 AND ARG2 ARE DIFF- 2-12 S2F00096
                    *      ERENT. IF THE SIGNS ARE THE SAME, FAC   2-12 S2F00098
                    *      IS LOADED WITH THE VALUE OF ARG1 AND NO 2-12 S2F00100
                    *      SIGN CHANGE OCCURS.                     2-12 S2F00102
                    *   CAPABILITIES AND LIMITATIONS-N/A              * S2F00110
                    *   SPECIAL FEATURES-N/A                          * S2F00120
                    *   ADDITIONAL INFORMATION-                       * S2F00130
                    *      ESTIMATED EXECUTION TIME-N/A               * S2F00140
                    *                                                 * S2F00150
                    *************************************************** S2F00160
                    *                                                 * S2F00170
                          EPR                                           S2F00180
                          ENT     ESIGN                                 S2F00190
                    ESIGN DC      *-*        LOADER STORE 1ST DC ADDR   S2F00200
                          STX   2 SAVE+1     SAVE XR2                   S2F00210
                          LD      ESIGN      LOAD 1ST DC ADDRESS        S2F00220
                          STO     *+3                                   S2F00230
                          A       ONE        COMPUTE 2ND DC ADDRESS AND S2F00240
                          STO     LDIRA+1    *STORE FOR LOADING OF XR2  S2F00250
                          LDX  I2 *-*        LOAD XR2 ARGUMENT A ADDR.  S2F00260
                          STX   2 DCA        STORE FOR CALL FLOAT SUBT  S2F00270
                          STX   2 DCB        STORE FOR CALL FLOAT LOAD  S2F00280
                          LD    2 1          LOAD ARGUMENT A MANTISSA   S2F00290
                    LDIRA LDX  I2 *-*        LOAD XR2 ARGUMENT B ADDR   S2F00300
                          BSC  L  NOCNG,+-   NO CHANGE IF ARG. A ZERO   S2F00310
                          EOR   2 1          EOR ARGUMENT B MANTISSA    S2F00320
                          BSC  L  NOCNG,-    NO CHANGE IF SIGNS AGREE   S2F00330
                          SLT     32         ZERO THE ACC AND EXT       S2F00340
                          STD   3 126        STORE ZEROS INTO  THE      S2F00350
                          STO   3 125        *FLOATING ACCUMULATOR      S2F00360
                          LIBF    ESUB       CALL FLOATING SUBTRACT     S2F00370
                    DCA   DC      *-*        PARAMETER,MODIFIED ABOVE   S2F00380
                          MDX     GOOUT      GO TO EXIT                 S2F00390
                    NOCNG LIBF    ELD        CALL FLOATING LOAD         S2F00400
                    DCB   DC      *-*        PARAMETER,MODIFIED ABOVE   S2F00410
                    GOOUT MDX  L  ESIGN,2    SET UP EXIT ADDRESS        S2F00420
                    SAVE  LDX  L2 *-*        RESTORE XR2                S2F00430
                          BSC  I  ESIGN      RETURN TO MAINLINE         S2F00440
                    ONE   DC      1          CONSTANT                   S2F00450
                          END                                           S2F00460
