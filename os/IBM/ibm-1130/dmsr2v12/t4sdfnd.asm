                          HDNG    LIBF SDFND   FIND(A'B) FOR. DISK SEEK T4B00010
                    *************************************************** T4B00030
                    *STATUS    VERSION 2  -  MODIFICATION 11          * T4B00040
                    *                                                 * T4B00050
                    *FUNCTION/OPERATION-                              * T4B00060
                    *   * POSITIONS THE DISK ARM AT A DESIGNATED      * T4B00070
                    *     SECTOR ON THE DISK                          * T4B00080
                    *                                                 * T4B00090
                    *ENTRY POINT                                      * T4B00100
                    *   LIBF      SDFND      CALL TO FIND             * T4B00110
                    *   DC        ADDR1      ADDR OF FILE NO.         * T4B00120
                    *   DC        ADDR2      ADDR OF RCD              * T4B00130
                    *                                                 * T4B00140
                    *INPUT-N/A                                        * T4B00150
                    *                                                 * T4B00160
                    *OUTPUT-N/A                                       * T4B00170
                    *                                                 * T4B00180
                    *EXTERNAL REFERENCES-                             * T4B00190
                    *   SUBROUTINES-                                  * T4B00200
                    *      DZ000                                      * T4B00210
                    *   COMMA/DCOM-                                   * T4B00220
                    *      $EXIT                                      * T4B00230
                    *      $FPAD                                      * T4B00240
                    *      $PRET                                      * T4B00250
                    *      $WRD1                                      * T4B00260
                    *                                                 * T4B00270
                    *EXITS-                                           * T4B00280
                    *   NORMAL-                                       * T4B00290
                    *       *RETURN TO LAST FIND PARAMETER + 1        * T4B00300
                    *   ERROR-N/A                                     * T4B00310
                    *                                                 * T4B00320
                    *TABLES-                                            T4B00330
                    *       DEFINE FILE ENTRY TABLE ENTRIES (7 WORDS  * T4B00331
                    *       PER FILE) IMMEDIATELY FOLLOWS CORE IMAGE  * T4B00332
                    *       HEADER.  IT IS CREATED BY THE COMPILER OR * T4B00333
                    *       ASSEMBLER AS PART OF THE MAINLINE PROGRAM.* T4B00334
                    *       IT IS MODIFIED BY THE CORE LOAD BUILDER.  * T4B00335
                    *       IT IS USED TO CONNECT LOGICAL FILE NUMBER * T4B00336
                    *       REFERENCES TO FILE LOCATIONS ON DISK.     * T4B00337
                    *                                                 * T4B00339
                    *WORK AREAS-N/A                                   * T4B00340
                    *                                                 * T4B00350
                    *ATTRIBUTES-N/A                                   * T4B00360
                    *                                                 * T4B00370
                    *NOTES-N/A                                        * T4B00380
                    *                                                 * T4B00390
                    *************************************************** T4B00400
                    *     EJCT        BLK REMOVED                       T4B00405
                          LIBR                                          T4B00410
                    *             SUBROUTINE FOR FIND OPERATION         T4B00420
                          ENT     SDFND      CALL FIND                  T4B00430
                    *                                                   T4B00432
                    $DBSY EQU     /00EE      DISK BUSY INDICATOR   2-11 T4B00433
                    $WRD1 EQU     /007B      ADDR OF CORE IMAGE HEADER  T4B00434
                    $FPAD EQU     /0095      FILE PROTECT ADDR(WS ADDR) T4B00436
                    DZ000 EQU     /00F2      DISK I/O SUBR ENTRY POINT  T4B00438
                    *                                                   T4B00440
                    SDFND STX   1 SK300+1    SAVE XR1                   T4B00450
                          LDX  I2 *-*        LOAD PARAM ADDR            T4B00460
                    *                                                   T4B00462
                          MDX  L  $DBSY,0   LOOP UNTIL DISK        2-11 T4B00464
                          MDX     *-3       * OP COMPLETE          2-11 T4B00466
                    *                                                   T4B00468
                          MDX   2 2         SET UP XR2                  T4B00470
                          STX   2 SK300+3   * FOR RETURN                T4B00472
                    *                                                   T4B00474
                          LDX  I1 $WRD1     LOAD ADRS OF 1ST WD OF HDR  T4B00476
                    *************************************************** T4B00480
                          LD    1 26         SHOULD BECOME  SLA     16  T4B00490
                    *                        TO IGNORE LOCAL/SOCAL CHK  T4B00500
                    *************************************************** T4B00510
                          STO     SK905      SAVE FOR DELAYED TEST  2-5 T4B00520
                          LD    1 3          LOAD FILE COUNT            T4B00530
                          STO     SK900      STORE NUMBER OF FILES      T4B00540
                          BSC  L  SK300,+    RETURN IF NOT POSITIVE 2-5 T4B00550
                          LD    1 4          GET CORE IMAGE HDR LENGTH  T4B00580
                          STO     *+1                                   T4B00590
                          MDX  L1 *-*        MOVE PTR TO DEFINE FILE TB T4B00600
                    *                                                   T4B00610
                    SK100 LD   I2 -2         LOAD FILE ID               T4B00620
                          EOR   1 0          FOUND FILE IN TABLE        T4B00630
                          BSC  L  SK200,+-   BRANCH IF YES              T4B00640
                          MDX   1 7          PUT PT AT NEXT FILE ENTRY  T4B00650
                          MDX  L  SK900,-1   DECREASE FILE COUNT        T4B00660
                          MDX     SK100      CHECK NEXT ENTRY           T4B00670
                          MDX     SK300      FILE NOT FOUND - RETURN    T4B00680
                    *                                                   T4B00690
                    SK200 LD   I2 -1         LOAD NO. OF RCD IN FILE    T4B00700
                          STO  I1 3          STORE ASSOCIATED VARIABLE  T4B00710
                          LD      SK905      LOAD SAVED LOCAL/SOCAL 2-5 T4B00714
                          BSC  L  SK300,Z    RETURN IF LOCAL/SOCAL  2-5 T4B00716
                          LD    1 4          LOAD SECTOR START ADDR     T4B00720
                          BSC  L  SK210,-    IS FILE IN WORKING STG     T4B00730
                          AND     SK903      YES, CLEAR SIGN BIT        T4B00740
                          STO     SK905      SAVE ADDR                  T4B00750
                          SRA     12         GET ADDR OF                T4B00760
                          A       SK906      FILE PROTECT               T4B00770
                          STO     *+1        FOR GIVEN LOGICAL DRIVE    T4B00780
                          LD   L  *-*        LOAD RECORD NUMBER         T4B00790
                          AND     SK904      CLEAR LEADING BITS         T4B00800
                          A       SK905      ADD SECTOR START ADDR      T4B00810
                    SK210 STO     SK902+1    SET UP SEEK INITIAL SECTOR T4B00820
                          LD   I2 -1         LOAD RECORD NUMBER         T4B00830
                          BSC  L  SK300,+    BRANCH IF INVALID          T4B00840
                          S     1 1          SUBTRACT NO. RCDS IN FILE  T4B00850
                          BSC     -Z         SKIP IF NUMBER VALID       T4B00860
                          MDX     SK300      INVALID REQUEST-EXIT       T4B00870
                          A     1 1          RESTORE RECORD NO.         T4B00880
                          S       SK907      SUBTRACT 1             2-5 T4B00890
                          SRT     16         DIVIDE RECORD NUMBER-1 2-5 T4B00900
                          D     1 5          *BY RECORDS PER SECTOR 2-5 T4B00910
                          A       SK902+1    INCREMENT SCTR ADDR IN 2-5 T4B00920
                          STO     SK902+1    *I/O BUFFER BY QUOTIENT2-5 T4B00925
                          LDD     SK910      LOAD SEEK PARAMETER        T4B00930
                          BSI  L  DZ000      EXECUTE DISK SEEK          T4B00940
                    SK300 LDX  L1 *-*        RESTORE XR1                T4B00950
                          BSC  L  *-*        RETURN TO MAINLINE         T4B00960
                    SK900 DC      *-*        NUMBER OF FILES            T4B00970
                          BSS  E                                    2-7 T4B00980
                    SK902 DC      1         READ I/O PARAM          2-5 T4B00990
                          DC      *-*        SECTOR ADDRESS             T4B01000
                          BSS     1                                 2-5 T4B01005
                    SK903 DC      /7FFF      MASK TO CLEAR SIGN BIT     T4B01007
                    SK904 DC      /0FFF      MASK TO CLEAR LEADING BITS T4B01010
                    SK905 DC      *-*        SECTOR START ADDR          T4B01020
                    *                        *AND TEMP LOCAL/SOCAL CNT  T4B01025
                    SK906 DC      $FPAD      ADDR OF FILE START ADDR    T4B01030
                    SK907 DC      1          CONSTANT               2-5 T4B01040
                          BSS  E  0                                     T4B01060
                    SK910 DC      /7000      SEEK PARAMETERS            T4B01070
                          DC      SK902      FOR DZ000                  T4B01080
                          END                                           T4B01090
