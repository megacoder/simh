                          HDNG    CALL DMP80                            U5A00010
                          HDNG    DMP80 SUBROUTINE                      U5A00020
                    *************************************************** U5A00030
                    *                                                 * U5A00040
                    * PROGRAM NAME  - DMP80 SUBROUTINE                * U5A00050
                    * PURPOSE - DUMP CORE LOCATIONS 000 THRU 079 ONTO * U5A00060
                    *           TYPEWRITER.                           * U5A00070
                    * CALLING SEQUENCE -                              * U5A00080
                    *     CALL    DMP80                               * U5A00090
                    *                                                 * U5A00100
                    *************************************************** U5A00110
                    * DUMP 80 ROUTINE                                   U5A00120
                          ENT     DMP80                                 U5A00130
                    *                                                   U5A00140
                    *            DMP80                                  U5A00150
                    *                                                   U5A00160
                          BSS  E  0                                     U5A00170
                    SENSE DC      0       INTERRUPT ADDRESS FROM EDIT   U5A00180
                          DC      /0F03     SENSE AND RESET IOCC        U5A00190
                    WRITE DC      BUF       WRITE IOCC                  U5A00200
                          DC      /0902     *     IOCC                  U5A00210
                    BUF   DC      /8100     CHAR. TO BE WRITTEN         U5A00220
                    *    DUMP CORE 000-079 ONTO TYPEWRITER              U5A00230
                    DMP80 DC      0         ENTRY POINT                 U5A00240
                          MDX  L  $IOCT,1                               U5A00250
                          NOP                                           U5A00260
                    *    SAVE WORD AT INTERRUPT LEVEL XX FOR DUMP       U5A00270
                          LD   I  SENSE                                 U5A00280
                          STO     SAVWD                                 U5A00290
                    *    INTERRUPT ON TYPEWRITER LEVEL GOES TO TAG      U5A00300
                          LD      CTAG                                  U5A00310
                          STO  I  SENSE                                 U5A00320
                    *    RETURN CARRIAGE                                U5A00330
                          BSI     WRT                                   U5A00340
                    STAR1 LD   L  *-*       LOAD WORD TO ACC.           U5A00350
                    MWORD EQU     *-1                                   U5A00360
                          MDX  L  C4,4                                  U5A00370
                          SRT     16        SHIFT ACC TO EXT            U5A00380
                    STAR2 SLA     16                                    U5A00390
                    *   FOUR BITS TO ROTATE AND TILT                    U5A00400
                          SLT     4                                     U5A00410
                          A       CTHEX                                 U5A00420
                          STO     *+1                                   U5A00430
                          LD   L  *-*       ADD 4 BITS TO TABLE ADDR.   U5A00440
                          STO     BUF                                   U5A00450
                    *    WRITE ONE HEX. CHARACTER                       U5A00460
                          BSI     WRT                                   U5A00470
                          MDX  L  C4,-1                                 U5A00480
                          MDX     STAR2                                 U5A00490
                          LD      SPACE                                 U5A00500
                          STO     BUF                                   U5A00510
                    *    SPACE BETWEEN EACH WORD                        U5A00520
                          BSI     WRT                                   U5A00530
                          LD      CARR                                  U5A00540
                          STO     BUF                                   U5A00550
                          LD      MWORD                                 U5A00560
                          SLA     12                                    U5A00570
                          EOR     TYHEX+4    TEST FOR END OF ROW        U5A00580
                          BSC     +-                                    U5A00590
                    *    RETURN CARRIAGE                                U5A00600
                          BSI     WRT                                   U5A00610
                          MDX  L  MWORD,1    NEXT CORE WORD             U5A00620
                          LD      MWORD                                 U5A00630
                    *    TEST FOR SAVED WORD ADDRESS                    U5A00640
                          S       SENSE                                 U5A00650
                          BSC  L  ENDQ,Z                                U5A00660
                          LD      SAVWD                                 U5A00670
                          MDX     STAR1+2                               U5A00680
                    ENDQ  LD      MWORD                                 U5A00690
                          S       LSTWD                                 U5A00700
                          BSC  L  STAR1,Z    TEST FOR END OF DUMP       U5A00710
                    *       RESTORE INTERRUPT WORD                      U5A00720
                          STO     MWORD     INIT. TO WORD ZERO          U5A00730
                          LD      SAVWD                                 U5A00740
                          STO  I  SENSE                                 U5A00750
                          MDX  L  $IOCT,-1                              U5A00760
                          NOP                                           U5A00770
                    *     RETURN TO MAIN PROGRAM                        U5A00780
                          BSC  I  DMP80                                 U5A00790
                    WRT   NOP               SUBROUTINE TO TYPE          U5A00800
                          XIO     SENSE                                 U5A00810
                          SLA     5                                     U5A00820
                          BSC  L  WRT+1,Z+                              U5A00830
                          XIO     WRITE                                 U5A00840
                          WAIT              WAIT FOR INTERRUPT          U5A00850
                          BSC  I  WRT                                   U5A00860
                    TAG   NOP               INTERRUPT LEVEL SUBROUTINE  U5A00870
                          STO     SAVA                                  U5A00880
                          XIO     SENSE                                 U5A00890
                          LD      SAVA                                  U5A00900
                          BOSC I  TAG                                   U5A00910
                    SAVWD DC      0         SAVED ILS ADDR.             U5A00920
                    SAVA  DC      0         SAVED ACC                   U5A00930
                    C4    DC      0         COUNTER OF 4 BITS           U5A00940
                    LSTWD DC      80        END OF DUMP COMPARE NUMBER  U5A00950
                    CTHEX DC      TYHEX     ADDR OF ROTATE/TILT TABLE   U5A00960
                    CTAG  DC      TAG       ADDR OF TEMP. ILS           U5A00970
                    *                                                   U5A00980
                    *   ROTATE AND TILT CODE                            U5A00990
                    *                                                   U5A01000
                    TYHEX DC      /C400     0                           U5A01010
                          DC      /FC00     1                           U5A01020
                          DC      /D800     2                           U5A01030
                          DC      /DC00     3                           U5A01040
                          DC      /F000     4                           U5A01050
                          DC      /F400     5                           U5A01060
                          DC      /D000     6                           U5A01070
                          DC      /D400     7                           U5A01080
                          DC      /E400     8                           U5A01090
                          DC      /E000     9                           U5A01100
                          DC      /3C00     A                           U5A01110
                          DC      /1800     B                           U5A01120
                          DC      /1C00     C                           U5A01130
                          DC      /3000     D                           U5A01140
                          DC      /3400     E                           U5A01150
                          DC      /1000     F                           U5A01160
                    CARR  DC      /8100     CARRIAGE RETURN             U5A01170
                    SPACE DC      /2100     SPACE                       U5A01180
                    *                       FOR 1130 OPERATION          U5A01190
                          ORG     SENSE                                 U5A01200
                          DC      12                                    U5A01210
                          ORG     SPACE+1   CORRECT EOP CARD            U5A01220
                    $IOCT EQU     50        ISS COUNTER                 U5A01230
                          END                                           U5A01240
