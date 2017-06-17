                          HDNG    CALL FSIGN                            R2F00010
                    *************************************************** R2F00020
                    *                                                 * R2F00030
                    *   SUBROUTINE NAME-                              * R2F00040
                    *      FULL NAME-STANDARD PRECISION TRANSFER OF   * R2F00050
                    *         SIGN                                    * R2F00060
                    *      CODE NAME-FSIGN                            * R2F00070
                    *   PURPOSE-                                   2-12 R2F00080
                    *      PROVIDE FORTRAN SIGN CHANGE FUNCTION    2-12 R2F00085
                    *   METHOD-                                    2-12 R2F00090
                    *      CHANGE THE VALUE OF THE FLOATING ACCUM- 2-12 R2F00092
                    *      ULATOR (FAC) TO THE COMPLIMENT OF ARG1  2-12 R2F00094
                    *      IF THE SIGNS OF ARG1 AND ARG2 ARE DIFF- 2-12 R2F00096
                    *      ERENT. IF THE SIGNS ARE THE SAME, FAC   2-12 R2F00098
                    *      IS LOADED WITH THE VALUE OF ARG1 AND NO 2-12 R2F00100
                    *      SIGN CHANGE OCCURS.                     2-12 R2F00102
                    *   CAPABILITIES AND LIMITATIONS-N/A              * R2F00110
                    *   SPECIAL FEATURES-N/A                          * R2F00120
                    *   ADDITIONAL INFORMATION-                       * R2F00130
                    *      ESTIMATED EXECUTION TIME-N/A               * R2F00140
                    *                                                 * R2F00150
                    *************************************************** R2F00160
                    *                                                 * R2F00170
                          SPR                                           R2F00180
                          ENT     FSIGN                                 R2F00190
                    FSIGN DC      *-*        LOADER STORE 1ST DC ADDR   R2F00200
                          STX   2 SAVE+1     SAVE XR2                   R2F00210
                          LD      FSIGN      LOAD 1ST DC ADDRESS        R2F00220
                          STO     *+3                                   R2F00230
                          A       ONE        COMPUTE 2ND DC ADDRESS AND R2F00240
                          STO     LDIRA+1    *STORE FOR LOADING OF XR2  R2F00250
                          LDX  I2 *-*        LOAD XR2 ARGUMENT A ADDR.  R2F00260
                          STX   2 DCA        STORE FOR CALL FLOAT SUBT  R2F00270
                          STX   2 DCB        STORE FOR CALL FLOAT LOAD  R2F00280
                          LD    2 0          LOAD ARGUMENT A MANTISSA   R2F00290
                    LDIRA LDX  I2 *-*        LOAD XR2 ARGUMENT B ADDR   R2F00300
                          BSC  L  NOCNG,+-   NO CHANGE IF ARG. A ZERO   R2F00310
                          EOR   2 0          EOR ARGUMENT B MANTISSA    R2F00320
                          BSC  L  NOCNG,-    NO CHANGE IF SIGNS AGREE   R2F00330
                          SLT     32         ZERO THE ACC AND EXT       R2F00340
                          STD   3 126        STORE ZEROS INTO  THE      R2F00350
                          STO   3 125        *FLOATING ACCUMULATOR      R2F00360
                          LIBF    FSUB       CALL FLOATING SUBTRACT     R2F00370
                    DCA   DC      *-*        PARAMETER,MODIFIED ABOVE   R2F00380
                          MDX     GOOUT      GO TO EXIT                 R2F00390
                    NOCNG LIBF    FLD        CALL FLOATING LOAD         R2F00400
                    DCB   DC      *-*        PARAMETER,MODIFIED ABOVE   R2F00410
                    GOOUT MDX  L  FSIGN,2    SET UP EXIT ADDRESS        R2F00420
                    SAVE  LDX  L2 *-*        RESTORE XR2                R2F00430
                          BSC  I  FSIGN      RETURN TO MAINLINE         R2F00440
                    ONE   DC      1          CONSTANT                   R2F00450
                          END                                           R2F00460
