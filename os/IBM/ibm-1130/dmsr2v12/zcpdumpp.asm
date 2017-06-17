                          HDNG    PAPER-TAPE CONSOLE PRINTER DUMP       ZDP00010
                    *************************************************** ZDP00020
                    *STATUS-VERSION 2, MODIFICATION 000               * ZDP00030
                    *FUNCTION/OPERATION-THIS IS A STAND-ALONE DUMP    * ZDP00040
                    *PROGRAM WRITTEN EXPRESSLY FOR THE PAPER TAPE USER* ZDP00050
                    *IT COMES IN THE FORM OF A PAPER-TAPE STRIP       * ZDP00060
                    *PUNCHED IN PAPER-TAPE IPL FORMAT(4 BITS PER      * ZDP00070
                    *FRAME).THE PROGRAM IS LOADED STARTING AT LOCATION* ZDP00080
                    *ZERO AND EXECUTES FROM LOW-CORE. THE PROGRAM     * ZDP00090
                    *DUMPS MEMORY IN HEX.FORMAT,8 WORDS PER LINE ON   * ZDP00100
                    *THE CONSOLE PRINTER. THE STARTING ADDRESS OF THE * ZDP00110
                    *DUMP IS READ FROM THE BIT SWITCHES.              * ZDP00120
                    *                                                 * ZDP00130
                    *ENTRY POINTS-                                    * ZDP00140
                    *     *START-AFTER THE TAPE IS LOADED BY IPL,     * ZDP00150
                    *     CONTROL IS PASSED TO LOC. ZERO(START)       * ZDP00160
                    *     *INTRP-THIS IS THE TYPEWRITER INTERRUPT     * ZDP00170
                    *     SERVICE ENTRY POINT.                        * ZDP00180
                    *                                                 * ZDP00190
                    *INPUT- STARTING ADDRESS THROUGH BIT SWITCHES     * ZDP00200
                    *                                                 * ZDP00210
                    *OUTPUT- PRINTED OUTPUT ON THE TYPEWRITER         * ZDP00220
                    *                                                 * ZDP00230
                    *EXTERNAL REFERENCES- NONE                        * ZDP00240
                    *                                                 * ZDP00250
                    *EXITS-NORMAL NONE, PROGRAM EXECUTES CONTINUOUSLY * ZDP00260
                    *UNTIL EITHER IMM STOP OR PROG.STOP IS PRESSED.   * ZDP00270
                    *                                                 * ZDP00280
                    *TABLES/WORKAREA .BUF. ONE WORD LOCATION FROM     * ZDP00290
                    *WHICH EACH CHARACTER IS PRINTED, .TABLE. A TABLE * ZDP00300
                    *CONTAINING 16 R/T CHARACTERS,0-F,PACKED 2 PER WD.* ZDP00310
                    *                                                 * ZDP00320
                    *ATTRIBUTES-REUSABLE                              * ZDP00330
                    *                                                 * ZDP00340
                    *NOTES--WAITS WITH /2000 IN ACC ON TYPEWRITER     * ZDP00350
                    *NOT READY.ALSO WAITS AT LOC /54 WHEN PROGRAM     * ZDP00360
                    *STOP KEY IS PRESSED.                             * ZDP00370
                    *************************************************** ZDP00380
                          ABS                                           ZDP00390
                    *PAPER TAPE STRIP DUMP ON TYPEWRITER. STARTING      ZDP00400
                    *ADDRESS ENTERED FROM BIT SWITCHES.                 ZDP00410
                          ORG     0                                     ZDP00420
                    START XIO     BITSW     READ STARTING ADDRESS       ZDP00430
                          LD      ADDR      ADDRESS FROM BIT SWITCHES   ZDP00440
                          AND     FFF0      EXTRACT ADDRESS MOD 16      ZDP00450
                          STO     ADDR      ADDRESS OF LINE             ZDP00460
                    LINE  LDX   3 16        WDS PER LINE COUNT          ZDP00470
                          BSI     PRINT     PRINT LINE ADDRESS          ZDP00480
                          BSI     RDYTS     READY  TEST                 ZDP00490
                          XIO     WRITE     PRINT ADDITIONAL SPACE      ZDP00500
                    NEXT  LD   I  ADDR      WORD TO PRINT               ZDP00510
                          BSI     PRINT     GO TYPE ONE WORD            ZDP00520
                          MDX     OVER      SKIP OVER INTERRUPT WORDS   ZDP00530
                          DC      INTRP     LEVEL 4 INTERRUPT           ZDP00540
                          DC      PSTOP     PROGRAM STOP INTERRUPT      ZDP00550
                    OVER  MDX  L  ADDR,1    NEXT ADDRESS                ZDP00560
                          MDX   3 -1        DECREMENT LINE COUNT        ZDP00570
                          MDX     NEXT      NEXT WD IF LINE NOT DONE    ZDP00580
                          LD      CRTN      CARRIER RETURN CODE TO      ZDP00590
                          STO     BUF       *OUTPUT BUFFER              ZDP00600
                          BSI     RDYTS     READY  TEST                 ZDP00610
                          XIO     WRITE     CARRIER RETURN              ZDP00620
                          LD      ADDR      ADDRESS OF LINE             ZDP00630
                          MDX     LINE      PRINT ADDRESS OF NEXT LINE  ZDP00640
                    *                                                   ZDP00650
                    *SUBROUTINE TO CONVERT A WORD TO 4 HEX CHARACTERS   ZDP00660
                    *AND TYPE THEN ON THE CONSOLE PRINTER               ZDP00670
                    *                                                   ZDP00680
                    PRINT DC      0                                     ZDP00690
                          RTE     16        SAVE WORD IN EXTENSION      ZDP00700
                          LDX   1 4         XR1 IS 4-CHAR-COUNTER       ZDP00710
                    STAR2 LDX   2 0         XR2 IS ODD/EVEN SWITCH.     ZDP00720
                          SLA     16        CLEAR ACC                   ZDP00730
                          SLT     4         BRING IN ONE CHAR           ZDP00740
                          BSC     E         IS CHAR EVEN,YES,SKIP       ZDP00750
                          MDX   2 8         NO,SET XR2 TO SHIFT 8       ZDP00760
                          SRA     1         DIVIDE BY 2                 ZDP00770
                          A       TBLAD     CREATE ADDR OF CHAR IN TABL ZDP00780
                          STO     LOAD+1                                ZDP00790
                    READY BSI     RDYTS     READY  TEST                 ZDP00800
                    LOAD  LD   L  *-*       LD 2 R/T CHARS FROM TABLE   ZDP00810
                          SLA   2 0         LEFT JUSTIFY IF NECESSARY   ZDP00820
                          STO     BUF       STORE CHARECTER             ZDP00830
                          XIO     WRITE     TYPE ONE CHARACTER          ZDP00840
                          MDX   1 -1        CHK IF 4 CHARS,1 WD,DONE    ZDP00850
                          MDX     STAR2     NO,GO GET NEXT CHARACTER    ZDP00860
                          LD      TABLE-1   SPACE CHARACTER             ZDP00870
                          S       BUF                                   ZDP00880
                          BSC  I  PRINT,+-  EXIT IF LAST CHAR WAS SPACE ZDP00890
                          LDX   2 0         SET XR2 FOR NO SHIFT        ZDP00900
                          LD      MINUS     POINT TO SPACE CHAR IN TABL ZDP00910
                          MDX     READY-2   PRINT SPACE                 ZDP00920
                    *                                                   ZDP00930
                    *TEST TYPEWRITER FOR READY                          ZDP00940
                    *                                                   ZDP00950
                    RDYTS DC      *-*                                   ZDP00960
                          XIO     SENSE-1   SENSE  TYPEWRITER           ZDP00970
                          SLA     5                                     ZDP00980
                          BSC  I  RDYTS,-   EXIT  IF READY              ZDP00990
                          LD      H2000     NOT  READY,LOAD ERROR CODE  ZDP01000
                          WAIT              WAIT  FOR OPERATOR          ZDP01010
                          MDX     RDYTS+1   TRY  AGAIN                  ZDP01020
                    *                                                   ZDP01030
                    * TYPEWRITER INTERRUPT SERVICE                      ZDP01040
                    *                                                   ZDP01050
                    INTRP DC      *-*                                   ZDP01060
                          XIO     SENSE-1   SENSE WITH RESET            ZDP01070
                          BOSC I  INTRP     TURN OFF INTRP LVL AND EXIT ZDP01080
                    *                                                   ZDP01090
                          BSS  E  0                                     ZDP01100
                    TBLAD DC      TABLE     ADDRESS OF CHARACTER TABLE  ZDP01110
                    SENSE DC      /0F03     SENSE/RESET IOCC            ZDP01120
                    WRITE DC      BUF       PRINT                       ZDP01130
                          DC      /0902     *IOCC                       ZDP01140
                    BITSW DC      ADDR      ADDR. OF BIT SW READ-IN     ZDP01150
                          DC      /3A00     BIT  SWITCH IOCC            ZDP01160
                    ADDR  DC      *-*                                   ZDP01170
                    FFF0  DC      /FFF0     LINE ADDRESS MASK           ZDP01180
                    CRTN  DC      /8100     CARRIER RETURN CODE         ZDP01190
                    MINUS DC      -1        CONST USED FOR SPACING      ZDP01200
                    BUF   DC      0         WD USED TO TYPE CHAR FROM   ZDP01210
                          DC      /2100     SPACE                       ZDP01220
                    TABLE DC      /C4FC     *ROT./TILT CHARACTERS 01    ZDP01230
                          DC      /D8DC     *ROT./TILT CHARACTERS 23    ZDP01240
                          DC      /F0F4     *ROT./TILT CHARACTERS 45    ZDP01250
                          DC      /D0D4     *ROT./TILT CHARACTERS 67    ZDP01260
                          DC      /E4E0     *ROT./TILT CHARACTERS 89    ZDP01270
                          DC      /3C18     *ROT./TILT CHARACTERS AB    ZDP01280
                          DC      /1C30     *ROT./TILT CHARACTERS CD    ZDP01290
                          DC      /3410     *ROT./TILT CHARACTERS EF    ZDP01300
                    *                                                   ZDP01310
                    H2000 DC      /2000     NOT  READY ERROR CODE       ZDP01320
                    *                                                   ZDP01330
                    * PROGRAM STOP INTERRUPT SERVICE                    ZDP01340
                    *                                                   ZDP01350
                    PSTOP DC      *-*                                   ZDP01360
                          WAIT              WAIT OPERATOR ACTION        ZDP01370
                          BOSC I  PSTOP     TURN OFF LEVEL AND EXIT     ZDP01380
                    *                                                   ZDP01390
                          END     START                                 ZDP01400
