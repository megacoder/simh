                          HDNG    LIBF SUBSC                            T2D00010
                    *             FORTRAN SUBSCRIPT DISPLACEMENT CALC.  T2D00020
                          LIBR    SUBSC                                 T2D00030
                          ENT     SUBSC                                 T2D00040
                    *             SYSTEMS SUBROUTINE 'SUBSC'            T2D00050
                    *             COMPUTES DISPLACEMENT AND MOVES IT    T2D00060
                    *             INTO SUBSCRIPT-GENERATED-TEMPORARY    T2D00070
                    *             AND INTO INDEXREGISTER 1              T2D00080
                    *                                                   T2D00090
                    *             ORDER OF ARGUMENTS IS                 T2D00100
                    *                                                   T2D00110
                    *             ADDR OF SUBSCR GENERATED TEMPORARY    T2D00120
                    *             D4                                    T2D00130
                    *             ADDRESS OF AN INTEGER VARIABLE        T2D00140
                    *                      (ONLY INCLUDED FOR THREE-    T2D00150
                    *                      DIMENSIONAL ARRAYS)          T2D00160
                    *             D3                                    T2D00170
                    *                      (ONLY INCLUDED FOR THREE-    T2D00180
                    *                      DIMENSIONAL ARRAYS)          T2D00190
                    *             ADDRESS OF AN INTEGER VARIABLE        T2D00200
                    *                      (ONLY INCLUDED FOR TWO- AND  T2D00210
                    *                      THREEDIMENSIONAL ARRAYS)     T2D00220
                    *             D2                                    T2D00230
                    *                      (ONLY INCLUDED FOR TWO- AND  T2D00240
                    *                      THREEDIMENSIONAL ARRAYS)     T2D00250
                    *             ADDRESS OF AN INTEGER VARIABLE        T2D00260
                    *             D1, TAGGED  (HAS A ONE IN BIT 0. TO   T2D00270
                    *                      INDICATE THAT IT IS THE LAST T2D00280
                    *                      ARGUMENT                     T2D00290
                    *                                                   T2D00300
                    SUBSC STO     SUBS4+1  SAVE CONTENTS OF A-REG       T2D00310
                          LDX  I1 *+*-*-*  'CALLING ARGUM ADDR' TO X1   T2D00320
                    *                        (ADDRESS OF LINKWORD IN    T2D00330
                    *                        TRANSFER VECTOR INSERTED   T2D00340
                    *                        BY LOADER)                 T2D00350
                          LD    1 0        INSERT ADDRESS OF            T2D00360
                          STO     SUBS3+1    SUBSC-GENER-TEMPORARY      T2D00370
                          SLA     16                                    T2D00380
                          S     1 1        STORE -D4 AS INITIAL VALUE   T2D00390
                          STO     SUBS2+1    OF SUBSEQUENT ACCUMULATION T2D00400
                          MDX   1 2                                     T2D00410
                    SUBS1 MDX   1 2                                     T2D00420
                          SLA     16                                    T2D00430
                          S     1 -1       GET -D1 (OR -D2 OR -D3)      T2D00440
                          SLA     1          FROM ARGUMENT LIST         T2D00450
                          M    I1 -2       MULTIPLY                     T2D00460
                          SLT     15         BY VARIABLE AND            T2D00470
                          A       SUBS2+1    ACCUMULATE THE RESULT      T2D00480
                          STO     SUBS2+1                               T2D00490
                          LD    1 -1                                    T2D00500
                          BSC     -        SKIP IF LAST (=TAGGED) ARGUM T2D00510
                          MDX     SUBS1    BR IF NOT                    T2D00520
                          LD      SUBS4+1  RESTORE A-REGISTER           T2D00530
                          STX  L1 SUBS4+1  INSERT RETURN-ADDRESS        T2D00540
                    SUBS2 LDX  L1 *-*      COMPUTED DISPLACEMENT TO X1  T2D00550
                    SUBS3 STX  L1 *-*      SAME VALUE TO SUBSC-GEN-TEMP T2D00560
                    SUBS4 BSC  L  *-*      RETURN  (ADDRESSPART ALSO    T2D00570
                    *                        USED FOR TEMPORARY         T2D00580
                    *                        STORAGE OF A-REGISTER)     T2D00590
                          END                                           T2D00600
