                          HDNG    1130 D.M. UNFORMATTED I/O SUBROUTINE  T4D00010
                    *************************************************** T4D00020
                    *STATUS - VERSION 2 MODIFICATION 10               * T4D00030
                    *                                                 * T4D00040
                    *FUNCTION/OPERATION-                              * T4D00050
                    *   * PROVIDES THE CAPABILITY OF READING AND      * T4D00060
                    *     WRITING IN FORTRAN WITHOUT THE SPECIFICATION* T4D00070
                    *     OF A FORMAT.                                * T4D00080
                    *   * DISK IS UTILIZED FOR I/O, WITH EACH LOGICAL * T4D00090
                    *     RECORD CONSISTING OF N PHYSICAL RECORDS OF  * T4D00100
                    *     A MAXIMUM OF 318 WORDS EACH. (N IS DETM BY  * T4D00110
                    *     THE SIZE OF THE UFIO DISK BUFFER $$$$$).    * T4D00120
                    *   * THE PRECISION AND INTEGER SIZE IS DETERMINED* T4D00130
                    *     BY THE PARAMETER FOLLOWING THE INITIALIZING * T4D00140
                    *     CALL TO UFIO.                               * T4D00150
                    *   * UFIO RESEMBLES ALL OTHER FIO'S IN THE       * T4D00160
                    *     CALLING SEQUENCE AND LOGICAL FLOW OF THE    * T4D00170
                    *     CODING.                                     * T4D00180
                    *                                                 * T4D00190
                    *ENTRY POINTS-                                    * T4D00200
                    *     LIBF    UFIO       CALL TO INITIALIZE       * T4D00210
                    *     DC      /00XY      PREC AND INTEGER SIZE    * T4D00220
                    *                                                 * T4D00230
                    *     LIBF    URED       CALL TO READ             * T4D00240
                    *     DC      ADDR       ADDR OF UNIT NO. (10)    * T4D00250
                    *                                                 * T4D00260
                    *     LIBF    UWRT       CALL TO WRITE            * T4D00270
                    *     DC      ADDR       ADDR OF UNIT NO. (10)    * T4D00280
                    *                                                 * T4D00290
                    *     LIBF    UIOI       CALL FOR NON-SUBSC INTGER* T4D00300
                    *     DC      ADDR       ADDRESS OF VARIABLE      * T4D00310
                    *                                                 * T4D00320
                    *     LIBF    UIOF       CALL FOR NON-SUBSC REAL  * T4D00330
                    *     DC      ADDR       ADDRESS OF VARIABLE      * T4D00340
                    *                                                 * T4D00350
                    *     LIBF    UIOIX      CALL FOR SUBSC INTEGER   * T4D00360
                    *     DC      ADDR       ADDR OF BASE VARIABLE    * T4D00370
                    *                        XR1 CONTAINS SUBSCRIPT   * T4D00380
                    *                                                 * T4D00390
                    *     LIBF    UIOFX      CALL FOR SUBSC REAL      * T4D00400
                    *     DC      ADDR       ADDR OF BASE VARIABLE    * T4D00410
                    *                        XR1 CONTAINS SUBSCRIPT   * T4D00420
                    *                                                 * T4D00430
                    *     LIBF    UIOAI      CALL FOR INTEGER ARRAY   * T4D00440
                    *     DC      ADDR1      ADDR FIRST ELT OF ARRAY  * T4D00450
                    *     DC      ADDR2      COUNT OF ELT IN ARRAY    * T4D00460
                    *                                                 * T4D00470
                    *     LIBF    UIOAF      CALL FOR REAL ARRAY      * T4D00480
                    *     DC      ADDR1      ADDR FIRST ELT OF ARRAY  * T4D00490
                    *     DC      ADDR1      COUNT OF ELT IN ARRAY    * T4D00500
                    *                                                 * T4D00510
                    *     LIBF    UCOMP      CALL FOR I/O COMPLETE    * T4D00520
                    *                                                 * T4D00530
                    *     LIBF    BCKSP      CALL TO BKSP LOGICAL RCD * T4D00540
                    *     DC      ADDR       ADDR OF UNIT NO. (10)    * T4D00550
                    *                                                 * T4D00560
                    *     LIBF    EOF        CALL TO WRITE EOF        * T4D00570
                    *     DC      ADDR       ADDR OF UNIT NO. (10)    * T4D00580
                    *                                                 * T4D00590
                    *     LIBF    REWND      CALL TO SET $UFIO = 1    * T4D00600
                    *     DC      ADDR       ADDR OF UNIT NO. (10)    * T4D00610
                    *                                                 * T4D00620
                    *EXTERNAL REFERENCES-                             * T4D00630
                    *    SUBROUTINES                                  * T4D00640
                    *        * DZ000 - SYSTEM DISK I/O SUBROUTINE     * T4D00650
                    *        * PAUSE - SUBROUTINE FOR HALT AT $PRET   * T4D00660
                    *    COMMA/DCOM                                   * T4D00670
                    *        * $UFIO - SECTOR POINTER FOR UFIO        * T4D00680
                    *        * $EXIT - CALL EXIT ENTRY POINT          * T4D00690
                    *        * $DBSY - NON-ZERO IF DISKZ BUSY         * T4D00700
                    *        * $$$$$ - DSA REFERENCE FOR DISK BUFFER  * T4D00710
                    *                                                 * T4D00720
                    *EXITS-                                           * T4D00730
                    *    NORMAL-                                      * T4D00740
                    *        *RETURN TO LAST CALL PARAMETER + 1       * T4D00750
                    *    ERROR                                        * T4D00760
                    *        *CALL EXIT IF DISK BUFFER OVERFLOWS      * T4D00770
                    *                                                 * T4D00780
                    *TABLES/WORKAREAS                                 * T4D00790
                    *        * IOAR - I/O BUFFER - PART OF UFIO       * T4D00800
                    *                                                 * T4D00810
                    *ATTRIBUTES-                                      * T4D00820
                    *    ASSEMBLED RELOCATABLE                        * T4D00830
                    *                                                 * T4D00840
                    *NOTES-                                           * T4D00850
                    *   *AN ERROR CONDITION CAUSES THIS SUBROUTINE TO * T4D00860
                    *    COME TO A WAIT WITH THE ERROR CODE DISPLAYED * T4D00870
                    *    IN THE ACC.ON ALL BUT THE LAST TWO ERRORS  2-7 T4D00880
                    *    CONTROL IS RETURNED TO THE CALLING PROGRAM.  * T4D00890
                    *    IF THE DISK BUFFER IS OVERFLOWED A CALL EXIT * T4D00900
                    *    IS INITIATED UPON PROSSING START.            * T4D00910
                    *         F020 - ILLEGAL UNIT REFERENCE           * T4D00920
                    *         F021 - READ LIST EXCEEDS LENGTH OF      * T4D00930
                    *                WRITE LIST.                      * T4D00940
                    *         F022 - RECORD DOES NOT EXIST FOR FOR    * T4D00950
                    *                READ LIST ELEMENT.               * T4D00960
                    *         F023 - MAXIMUM LENGTH OF $$$$$ AREA ON  * T4D00970
                    *                THE DISK HAS BEEN EXCEEDED. THIS * T4D00980
                    *                ERROR IS UNRECOVERABLE AND       * T4D00990
                    *                RESULTS IN A CALL EXIT.          * T4D01000
                    *          F024 - UFIO  HAS NOT BEEN INITLZD    2-7 T4D01010
                    *                       I.E. THERE IS NO *IOCS  2-7 T4D01020
                    *                       CARD IN THE MAINLINE    2-7 T4D01030
                    *                       ERRROR RESULTS IN A     2-7 T4D01040
                    *                       CALL EXIT               2-7 T4D01050
                    *                                                 * T4D01060
                    *   *ALL DISK HARDWARE ERRORS ARE HANDLED BY DZ000* T4D01070
                    *                                                 * T4D01080
                    *   *WHEN AN END OF FILE IS READ BIT 2 OF THE     * T4D01090
                    *    THIRD FUNCTIONAL ERROR WORD IS SET.          * T4D01100
                    *                                                 * T4D01110
                    *************************************************** T4D01120
                          HDNG    1130 D.M. UNFORMATTED I/O SUBROUTINE  T4D01130
                          LIBR                                          T4D01140
                          ENT     UFIO       INITIALIZATION             T4D01150
                          ENT     URED       READ                       T4D01160
                          ENT     UWRT       WRITE                      T4D01170
                          ENT     UIOI       UNSUBSCRIPTED INTEGER      T4D01180
                          ENT     UIOF       UNSUBSCRIPTED REAL         T4D01190
                          ENT     UIOAI      INTEGER ARRAY              T4D01200
                          ENT     UIOAF      REAL ARRAY                 T4D01210
                          ENT     UIOFX      REAL SUBSCRIPTED ELEMENT   T4D01220
                          ENT     UIOIX      INTEGER SUBSCRIPT. ELEMENT T4D01230
                          ENT     UCOMP      COMPLETION OF READ OR WRT  T4D01240
                          ENT     BCKSP      BACKSPACE - 1 LOGICAL REC  T4D01250
                          ENT     EOF        WRITE END FILE             T4D01260
                          ENT     REWND      REWIND - TO BUFFER START   T4D01270
                    *                                                   T4D01280
                    $UFIO EQU     /79        UFIO RECORD POINTER        T4D01290
                    $EXIT EQU     /38        CALL EXIT ENTRY POINT      T4D01300
                    $DBSY EQU     /EE        NON-ZERO IF DISKZ BUSY     T4D01310
                    DZ000 EQU     /F2        DISKZ ENTRY POINT          T4D01320
                          BSS  E  0          SET BOUNDARY               T4D01330
                    *                                                   T4D01340
                    *             SOME OF THE FOLLOWING VARIABLE WORDS  T4D01350
                    *             ARE BOUNDARY DEPENDENT (ODD OR EVEN)  T4D01360
                    *             AND THEREFORE CARE SHOULD BE TAKEN    T4D01370
                    *             IF THEY ARE TO BE MOVED OR            T4D01380
                    *             RE-ORDERED                            T4D01390
                    *                                                   T4D01400
                    X     EQU     *+128      WORK AREA POINTER          T4D01410
                    *                                                   T4D01420
                    UF900 DC      *-*        ADDRESS OF LIST ELEMENT    T4D01430
                    UF901 DC      *-*        CNT OF ELTS TO TRANSMIT    T4D01440
                    UF902 DC      *-*        INTEGER SIZE- 1, 2, OR 3   T4D01450
                    UF903 DC      *-*        PRECISION- 2 OR 3          T4D01460
                    UF904 DC      *-*        BUFFER COUNTER             T4D01470
                    UF905 DC      *-*        INDR FOR CAUSING NEW RCD   T4D01480
                    UF906 DC      *-*        CURRENT BUFFER POSITION    T4D01490
                    UF907 DC      *-*        INITIAL BUFFER POSITION    T4D01500
                    UF908 DC      0          CONSTANT 0                 T4D01510
                    UF909 DC      1          CONSTANT 1                 T4D01520
                    UF910 DC      *-*        COUNT OF WORDS TO TRANSMIT T4D01530
                    *                        *FOR EACH LIST VARIABLE    T4D01540
                    *                        *OR ELEMENT.               T4D01550
                          DC      1          CON TO DECR CNT OF VAR     T4D01560
                    UF912 DC      *-*        READ-WRITE SWITCH          T4D01570
                    *                        *0- READ, 1- WRITE         T4D01580
                    UF913 DC      UF992+2    ADDRESS OF DATA BUFFER     T4D01590
                    UF914 DC      /1000      HEX. CONSTANT 1000         T4D01600
                    *                       NOT USED               2-10 T4D01610
                    UF916 DC      /2000      HEX CONSTANT 2000          T4D01620
                    UF917 DC      /7001      CONSTANT (MDX  *+1)        T4D01630
                    UF918 DC      /7FFF      HEX. CONSTANT 7FFF         T4D01640
                    UF919 DC      /8000      HEX. CONSTANT 8000         T4D01650
                    UF920 DSA     $$$$$      DSA FOR UFIO BUFFER        T4D01660
                    UF922 EQU     UF920+2    UFIO BUFFER LENGTH         T4D01670
                    UF923 EQU     UF920+1    UFIO BUFFER START SECTOR   T4D01680
                    UF926 EQU     UF920      TEMPORARY WORKING CELL     T4D01690
                    *                       NOT USED               2-10 T4D01700
                    UF932 DC      0          INTEGER OR REAL ELEMENT    T4D01710
                    *                        *0- INTEGER, 2- REAL       T4D01720
                    UF933 DC      0          CNT. OF GOOD WORDS IN BUFR T4D01730
                    UF934 DC      UF992+320  LAST BUFFER POSITION+1 2-3 T4D01740
                    UF935 DC      0          LAST RECORD IND.           T4D01750
                    *                        *0- CONT, 2- NEW RECORD    T4D01760
                    UF936 DC      0          COUNT OF REC. IN LOG. REC. T4D01770
                    UF937 DC      -1         CONSTANT -1                T4D01780
                    UF938 DC      2          CONSTANT 2                 T4D01790
                    UF939 DC      3          CONSTANT 3                 T4D01800
                    *                       NOT USED               2-10 T4D01810
                    UF941 DC      0          SOFTWARE ERROR IND         T4D01820
                    *                       NOT USED               2-10 T4D01830
                    UF943 MDX     *+16       SKIP I/O OPERATION         T4D01840
                    UF944 DC      /F020      CONSTANT FOR ER CODES      T4D01850
                    UF945 EQU     UF908      READ FUNCTION CODE    2-10 T4D01860
                    UF946 DC      UF990      I/O BUFFER ADDRESS         T4D01870
                    UF947 EQU     UF909      WRITE FUNCTION CODE   2-10 T4D01880
                    UF948 DC      318        I/O AREA WORD COUNT        T4D01890
                    UF949 DC      0          DISK BUFFER EXCEEDED ER SW T4D01900
                    UF950 DC      0          NON-ZERO IF EOF READ       T4D01910
                    UF951 DC      0          SOCAL INDICATOR WORD   2-3 T4D01920
                    UF952 DC      4         CONST 4                 2-7 T4D01930
                    *                                                 * T4D01940
                    UFIO  SLT     32         INITIAL CALL TO FIO        T4D01950
                          LDX  I2 *-*        RECORD ENTRY               T4D01960
                          MDX   2 1          UP XR2 TO POINT AT CALLS   T4D01970
                    *                                                 * T4D01980
                          LD    2 -1         FETCH 2ND PARAMETERS       T4D01990
                          SRT     4          SAVE PREC & INT SZE IN Q   T4D02000
                          SLA     16                                    T4D02010
                          SLT     3                                     T4D02020
                    *                                                 * T4D02030
                          STO     UF903                                 T4D02040
                          STO     UF902      SET UP PREC AND INT SIZE   T4D02050
                    *                                                   T4D02060
                          SLT     1          CHK BIT 15                 T4D02070
                          BSC     E          SKIP ON EVEN               T4D02080
                          MDX     *+2        BR WITH INT SIZE TWO-WRDS  T4D02090
                    *                                                   T4D02100
                          LD      UF909      SET INT SIZE               T4D02110
                          STO     UF902      *TO ONE WORDD              T4D02120
                    *                                                   T4D02130
                          STX     UF951      SET SOCAL INDICATOR    2-3 T4D02140
                          LD    2 -2         TEST IF FIRST TIME     2-3 T4D02150
                          S       UF917      *UFIO WAS CALLED       2-3 T4D02160
                          BSC  I  UF290,+-   BRANCH IF NO           2-3 T4D02170
                    *                                               2-3 T4D02180
                          LD      UF917      SET UP RESTART             T4D02190
                          STO   2 -2         PROCEDURE                  T4D02200
                          BSC  L2 0          RETURN TO MAIN             T4D02210
                    *                                                   T4D02220
                    UF100 DC      *-*                                   T4D02230
                          LDX  L2 320       SET COUNT OF BFR        2-7 T4D02240
                          SLA     16         CLEAR ACC                  T4D02250
                    UF110 STO  L2 UF992-1    STORE IN BFR               T4D02260
                          MDX   2 -1         DECRE COUNT BY 1           T4D02270
                          MDX     UF110      IF NOT EXHAUSTED, BRANCH   T4D02280
                    *                                                 * T4D02290
                          LDX  L2 X          EXHAUSTED, BFR CLEARED     T4D02300
                    *                                                 * T4D02310
                          BSC  I  UF100      BRANCH BACK TO CALLER      T4D02320
                    *                                                 * T4D02330
                    UF120 DC      *-*        ENTER HERE TO DO A READ    T4D02340
                          LD      UF120                                 T4D02350
                          STO     UF130      SET FOR RETURN             T4D02360
                          LD      UF945                                 T4D02370
                          MDX     UF130+2    GO TO DO A READ            T4D02380
                    *                                                   T4D02390
                    UF130 DC      *-*        ENTER HERE TO DO A WRITE   T4D02400
                          LD      UF947                                 T4D02410
                          RTE     16         FUNC CODE TO Q             T4D02420
                          LD      UF949      TEST IF DISK BUFFER FILLED T4D02430
                          BSC  L  UF140,+-   BRANCH IF NOT              T4D02440
                          LD      UF939      SET ERROR CODE             T4D02450
                          BSI     UF150      GO INDICATE ERROR          T4D02460
                          LDX     $EXIT      CALL EXIT                  T4D02470
                    *                                                   T4D02480
                    UF140 LD      UF923      COMPUTE SECTOR ADDRESS FOR T4D02490
                          A    L  $UFIO      *READ OR WRITE AND STORE   T4D02500
                          S     2 UF909-X    *                          T4D02510
                          STO  L  UF990+1    *INTO THE I/O BUFFER       T4D02520
                          LD      UF946      I/O BUFFER ADDRESS         T4D02530
                          RTE     16         ROTATE BOTH CODES          T4D02540
                          BSI     UF160      GO TO PERFORM I/O          T4D02550
                          BSC  I  UF130      RETURN                     T4D02560
                    *                                                 * T4D02570
                    *************************************************** T4D02580
                    *                                                 * T4D02590
                    *       HANDLE THE 3 SOFTWARE ERRORS. THE BFR     * T4D02600
                    *  IS CLEARED EXCEPT WHEN THE ERR IS IN UNIT      * T4D02610
                    *  REFERENCE.  SUFIO IS MOD NOT TO PERFORM        * T4D02620
                    *  FURTHER I/O                                      T4D02630
                    *                                                 * T4D02640
                    *************************************************** T4D02650
                    UF150 DC      *-*        RECORD RETURN ADDR         T4D02660
                          OR      UF944      COMPUTE ERROR CODE     2-6 T4D02670
                          STO     UF941      SAVE ERROR IND - IF NON-Z  T4D02680
                          SLA     11                                2-6 T4D02690
                          BSI  L  UF100,Z    GO TO CLEAR BFR            T4D02700
                          LD      UF943                                 T4D02710
                          STO     UF160+1    SET TO BYPASS FURTHER I/O  T4D02720
                    *                                                 * T4D02730
                          LIBF    PAUSE      GO DISPLAY THE         2-6 T4D02740
                          DC      UF941      *ERROR CODE            2-6 T4D02750
                    *                                                   T4D02760
                          BSC  I  UF150      EXIT ERROR RTN             T4D02770
                    *                                                 * T4D02780
                    UF160 DC      *-*        ROUTINE TO TRANSMIT RECORD T4D02790
                          NOP                                           T4D02800
                          MDX  L  UF935,0    HAS LAST RECORD ALREADY    T4D02810
                          MDX     UF230      *BEEN ENCOUNTERED. YES-ERR T4D02820
                    UF170 BSI  L  DZ000      RD OR WR 1 SCTR FROM DISK  T4D02830
                          LD   L  $UFIO                                 T4D02840
                          A     2 UF909-X    INCR SECTOR POINTER        T4D02850
                          STO  L  $UFIO                                 T4D02860
                          S     2 UF922-X    TEST IF DISK BUFFER END    T4D02870
                          BSC     -Z         SKIP IF NOT END            T4D02880
                          STX     UF949      INDICATE NO MORE DISK BUFR T4D02890
                    *                                                   T4D02900
                          MDX  L  $DBSY,0    SKIP IF DISKZ NOT BUSY     T4D02910
                          MDX     *-3        LOOP IF DISKZ BUSY         T4D02920
                    *                                                   T4D02930
                    UF180 LD    2 UF912-X    IS A READ SPECIFIED        T4D02940
                          BSC  L  UF210,Z    IF NO, BRANCH TO HANDLE WT T4D02950
                          LD   L  UF992+1    GET WORD COUNT FROM BUFFER T4D02960
                          BSC  L  UF200,+Z   IS IT NEG., IF YES, BRANCH T4D02970
                    UF190 STO   2 UF933-X    NO, STORE INTO BUFFER CNT. T4D02980
                          BSC  I  UF160      RETURN TO CALLING PROGRAM  T4D02990
                    UF200 STO   2 UF935-X    SET LAST RECORD IND.       T4D03000
                          AND   2 UF918-X    ELIMINATE LAST REC. BIT    T4D03010
                          BSC  L  UF190,Z    BRANCH IF COUNT NOT ZERO   T4D03020
                    *                                                   T4D03030
                    *                        END FILE ENCOUNTERED       T4D03040
                          LD    3 124        LOAD FUNCTIONAL ERROR WD   T4D03050
                          OR    2 UF916-X    SET END FILE BIT ON        T4D03060
                          STO   3 124        RESTORE INDICATOR WORD     T4D03070
                          STO   2 UF950-X    SET EOF SWITCH             T4D03080
                          SLA     16         LOAD ZERO                  T4D03090
                          MDX     UF190      BRANCH BACK FOR RETURN     T4D03100
                    *                                                   T4D03110
                    UF210 BSI     UF100      NO, CLEAR BUFFER           T4D03120
                          MDX     UF190      RETURN TO CALLING PROGRAM  T4D03130
                    *                                                   T4D03140
                    UF220 SLA     16         CLEAR A FOR ERROR CODE     T4D03150
                          BSI     UF150      *AND GO TO ERROR ROUTINE   T4D03160
                          MDX     UF350      EXIT SUFIO                 T4D03170
                    *                                                   T4D03180
                    UF230 LD    2 UF938-X    SET ERROR CODE IN A REG.   T4D03190
                          BSI     UF150      *AND GO TO ERROR ROUTINE   T4D03200
                          MDX     UF230-1   GO OUT                 2-10 T4D03210
                    *                                                 * T4D03220
                    *  ENTER HERE FROM RD/WRT CALL PROCESSING         * T4D03230
                    *  TO HANDLE PROCEDURES COMMON TO BOTH            * T4D03240
                    *                                                 * T4D03250
                    *                                                 * T4D03260
                    UF300 DC      *-*        RECORD RETURN ADDR         T4D03270
                          STO   2 UF912-X    SET READ-WRITE SWITCH      T4D03280
                    *                                                   T4D03290
                          LD    2 UF914-X    RESTO NOP CONDITION        T4D03300
                          STO     UF160+1    TO DZ000 INTERFACING       T4D03310
                    *                                                   T4D03320
                    UF310 LDD   2 UF913-X    YES, SET BFR ADDR IN       T4D03330
                          STD   2 UF906-X    *BUFFER PT AND INITLZ POS  T4D03340
                          SLT     32         CLEAR A AND '              T4D03350
                          STD   2 UF904-X    CLEAR CNTR AND REDO IND.   T4D03360
                          STO   2 UF901-X    CLEAR COUNT OF LIST ELEMTS T4D03370
                          STO   2 UF935-X    CLEAR LAST RECORD IND.     T4D03380
                          STO   2 UF933-X    CLEAR BUFFER COUNT         T4D03390
                          STO   2 UF936-X    SET REC. CNT. TO ZERO      T4D03400
                          STO   2 UF950-X    RESET EOF SWITCH           T4D03410
                          STO   2 UF941-X    RESET ERROR SW        2-10 T4D03415
                          BSI   2 UF100-X    BRANCH TO CLEAR BUFFER     T4D03420
                          MDX   1 1          COMPUTE RETURN ADDRESS     T4D03430
                          STX   1 UF350+3    SAVE RETURN ADDRESS        T4D03440
                          LD   I1 -1         GET LOGICAL UNIT NO.       T4D03450
                          S       UF970      IS DEVICE UNFORMATTED DISK T4D03460
                          BSC  L  UF220,Z    IF NO, GO HANDLE ERROR     T4D03470
                          BSC  I  UF300      BRANCH BACK TO READ OR WRT T4D03480
                    *                                                   T4D03490
                    UF970 DC      10         CONSTANT 10                T4D03500
                    *                                                   T4D03510
                    *             LIBF BCKSP ENTRY                      T4D03520
                    *                                                   T4D03530
                    BCKSP STX   1 UF350+1    SAVE XR1                   T4D03540
                          LDX  I1 *-*        RECORD ENTRY               T4D03550
                          LDX  L2 X          SET TABLE POINTER          T4D03560
                          BSI     UF300      GO TO COMMON AREA FOR I/O  T4D03570
                          MDX  L  $UFIO,-1   BACKSPACE POINTER          T4D03580
                    *                        IF THE NEXT INSTRUCTION    T4D03590
                    *                        IS SKIPPED THE DISK WAS    T4D03600
                    *                        AT 'LOAD POINT'            T4D03610
                          MDX     UF320      CONTINUE, NOT LOAD POINT   T4D03620
                    *                                                   T4D03630
                    *                        NO BACKSPACE MAY OCCUR     T4D03640
                    *                                                   T4D03650
                          MDX     UF325      RESET POINTER TO 'LOAD PT' T4D03660
                    *                                                   T4D03670
                    UF320 SLA     16         SET READ-WRITE INDICATOR   T4D03680
                          STO   2 UF912-X    *TO PERFORM READ           T4D03690
                          STO   2 UF949-X    RESET ERROR SWITCH     2-3 T4D03700
                          BSI   2 UF120-X    GO READ DISK RECORD        T4D03710
                          LD   L  $UFIO      LOAD UFIO SECTOR POINTER   T4D03720
                          S    L  UF992      BACKSPACE SECTOR POINTER   T4D03730
                          STO  L  $UFIO      RESTORE SECTOR POINTER     T4D03740
                          MDX     UF350      EXIT                       T4D03750
                    *                                                   T4D03760
                    *                                                   T4D03770
                    *             LIBF REWND ENTRY POINT                T4D03780
                    *                                                   T4D03790
                    *                                                   T4D03800
                    REWND STX   1 UF350+1    SAVE XR1                   T4D03810
                          LDX  I1 *-*        RECORD ENTRY               T4D03820
                          LDX  L2 X          SET TABLE POINTER          T4D03830
                          SLA     16                                2-3 T4D03840
                          STO   2 UF949-X    RESET ERROR SWITCH     2-3 T4D03850
                          BSI     UF300      GO TO COMMON AREA FOR I/O  T4D03860
                    UF325 LD    2 UF909-X                               T4D03870
                          STO  L  $UFIO      SET SECTOR PT TO 'LOAD PT' T4D03880
                          MDX     UF350      EXIT                       T4D03890
                    *                                                   T4D03900
                    *                                                   T4D03910
                    *             LIBF EOF ENTRY POINT                  T4D03920
                    *                                                   T4D03930
                    *                                                   T4D03940
                    EOF   STX   1 UF350+1    SAVE XR1                   T4D03950
                          LDX  I1 *-*        RECORD ENTRY               T4D03960
                          LDX  L2 X          SET TABLE POINTER          T4D03970
                          BSI     UF300      GO TO COMMON AREA FOR I/O  T4D03980
                          BSI   2 UF100-X    CLEAR I/O BUFFER           T4D03990
                          LD    2 UF919-X                               T4D04000
                          STO  L  UF990+3    SET -0 WORD COUNT          T4D04010
                          LD    2 UF909-X                               T4D04020
                          STO  L  UF990+2    SET PHYSICAL RECORD NO. 1  T4D04030
                          BSI   2 UF130-X    GO WRITE END FILE          T4D04040
                          MDX     UF350      RETURN                     T4D04050
                    *                                                   T4D04060
                    *                                                   T4D04070
                    *             LIBF URED ENTRY POINT                 T4D04080
                    *                                                   T4D04090
                    URED  STX   1 UF350+1    SAVE XR1                   T4D04100
                          LDX  I1 *-*        RECORD ENTRY               T4D04110
                          BSI     UF290     CHECK IF SOCAL          2-3 T4D04120
                          LDX  L2 X         SET TABLE POINTER           T4D04130
                          SLA     16         CLEAR A FOR READ IND.      T4D04140
                          BSI     UF300      GO TO COMMON AREA FOR I/O  T4D04150
                          BSI   2 UF120-X    GO READ A RECORD           T4D04160
                          MDX     UF350      GO TO EXIT                 T4D04170
                    *                                                   T4D04180
                    *                                                   T4D04190
                    *             LIBF UWRT ENTRY POINT                 T4D04200
                    *                                                   T4D04210
                    UWRT  STX   1 UF350+1    SAVE I.R. 1                T4D04220
                          LDX  I1 *-*        RECORD ENTRY               T4D04230
                          BSI     UF290     CHECK IF SOCAL          2-3 T4D04240
                          LDX  L2 X         SET TABLE POINTER           T4D04250
                          LD    2 UF937-X    LOAD IND. FOR WRITE -(-1)  T4D04260
                          BSI     UF300      GO TO COMMON AREA FOR I/O  T4D04270
                          MDX     UF350      GO TO EXIT                 T4D04280
                    *                                               2-3 T4D04290
                    *                                               2-3 T4D04300
                    *             CHECK SOCAL ROUTINE               2-3 T4D04310
                    *                                               2-3 T4D04320
                    UF290 DC      *-*        LINK                   2-3 T4D04330
                          LDX  L2 X         SET TABLE POINTER      2-10 T4D04335
                          LD    2 UF951-X   CHECK IF NEW OVERLAY    2-7 T4D04340
                          BSC  I  UF290,Z   BR IF NO                2-7 T4D04350
                          LD    2 UFIO+2-X  TEST IF EVER INITLZD    2-7 T4D04360
                          BSC  L  UFIO,Z    BR IF YES               2-7 T4D04370
                          LD    2 UF952-X   SET UP ERROR F024       2-7 T4D04380
                          BSI   2 UF150-X   BR TO DISP ERROR       2-7  T4D04390
                          LDX     $EXIT     EXIT                    2-7 T4D04400
                    *                                                   T4D04410
                    *             LIBF UIOF ENTRY POINT                 T4D04420
                    *                                                   T4D04430
                    UIOF  STX   1 UF350+1    SAVE I.R. 1                T4D04440
                          LDX  I1 *-*        REAL NON-SUB ELEMENT ENTRY T4D04450
                          LDS     2          STATUS OF TWO FOR REAL     T4D04460
                          MDX     UF330      BRANCH AHEAD               T4D04470
                    *                                                   T4D04480
                    *                                                   T4D04490
                    *             LIBF UIOI ENTRY POINT                 T4D04500
                    *                                                   T4D04510
                    UIOI  STX   1 UF350+1    SAVE I.R. 1                T4D04520
                          LDX  I1 *-*        INT. NON-SUB ELEMENT ENTRY T4D04530
                          LDS     0          STATUS OF ZERO FOR INTEGER T4D04540
                    UF330 LDD   2 UF908-X    SET A TO ZERO, Q TO ONE    T4D04550
                          STS   2 UF932-X    SET INTEGER/REAL INDICATOR T4D04560
                          MDX     UF370      BRANCH AHEAD               T4D04570
                    *                                                   T4D04580
                    *                                                   T4D04590
                    *             LIBF UIOFX ENTRY POINT                T4D04600
                    *                                                   T4D04610
                    UIOFX STX   1 UF350+1    SAVE I.R. 1                T4D04620
                          LDX  I1 *-*        REAL SUB. ELEMENT ENTRY    T4D04630
                          LDS     2          STATUS OF TWO FOR REAL     T4D04640
                          MDX     UF360      BRANCH AHEAD               T4D04650
                    *                                                   T4D04660
                    UF350 LDX  L1 *-*        RESTORE I.R. 1             T4D04670
                          BSC  L  *-*        RETURN TO CALLING PROGRAM  T4D04680
                    *                                                   T4D04690
                    *                                                   T4D04700
                    *             LIBF UIOIX ENTRY POINT                T4D04710
                    *                                                   T4D04720
                    UIOIX STX   1 UF350+1    SAVE I.R. 1                T4D04730
                          LDX  I1 *-*        INT. SUB. ELEMENT ENTRY    T4D04740
                          LDS     0          STATUS OF ZERO FOR INTEGER T4D04750
                    UF360 STS   2 UF932-X    SET INT/REAL INDR          T4D04760
                          LDD   2 UF908-X    SET Q REGISTER TO 1        T4D04770
                          LD      UF350+1    LOAD DISPLACEMENT INTO A   T4D04780
                    *                                                   T4D04790
                    UF370 A     1 0          ELEMENT ADDR               T4D04800
                          MDX   1 1          SET XR1 FOR RETURN         T4D04810
                          MDX     UF410      BRANCH AHEAD               T4D04820
                    *                                                   T4D04830
                    *                                                   T4D04840
                    *             LIBF UIOAI ENTRY POINT                T4D04850
                    *                                                   T4D04860
                    UIOAI STX   1 UF350+1    SAVE I.R. 1                T4D04870
                          LDX  I1 *-*        INT. NON-SUB ARRAY ENTRY   T4D04880
                          LDS     0          STATUS OF ZERO FOR INTEGER T4D04890
                          MDX     UF400      BRANCH AHEAD               T4D04900
                    *                                                   T4D04910
                    *                                                   T4D04920
                    *             LIBF UIOAF ENTRY POINT                T4D04930
                    *                                                   T4D04940
                    UIOAF STX   1 UF350+1    SAVE I.R. 1                T4D04950
                          LDX  I1 *-*        REAL NON-SUB ARRAY ENTRY   T4D04960
                          LDS     2          STATUS OF TWO FOR REAL     T4D04970
                    *                                                   T4D04980
                    UF400 STS   2 UF932-X    SET INTEGER/REAL INDICATOR T4D04990
                          LD    1 1          LD CNT OF ARRAY ELEMENTS   T4D05000
                          SRT     16         PUT INTO Q REGISTER        T4D05010
                          LD    1 0          LOAD ARRAY ADDRESS         T4D05020
                          MDX   1 2          SET XR1 FOR RETURN         T4D05030
                    *                                                   T4D05040
                    UF410 STD   2 UF900-X    ELEMENT ADDR AND COUNT     T4D05050
                          LD    2 UF932-X    IS AN INTEGER SPECIFIED    T4D05060
                          BSC  L  UF420,+-   IF YES, BRANCH AHEAD       T4D05070
                          LD    2 UF903-X    LOAD PREC. FOR WORD CNT    T4D05080
                          MDX     *+1        BRANCH AHEAD               T4D05090
                    *                                                   T4D05100
                    UF420 LD    2 UF902-X    LOAD INT. SIZE FOR WD. CNT T4D05110
                          STO   2 UF910-X    *AND STORE FOR WD CNT      T4D05120
                          STX  L1 UF350+3    STORE RETURN ADDRESS       T4D05130
                          LD    2 UF941-X    HAS ERR BEEN DISPLAYED2-10 T4D05132
                          BSC  L  UF350,Z    IF YES,GO OUT         2-10 T4D05134
                    *                        IF NO,CONTINUE        2-10 T4D05136
                    *                                                   T4D05140
                    UF430 MDX  L  UF950,0    SKIP IF EOF NOT READ       T4D05150
                          MDX     UF350      BRANCH IF EOF READ         T4D05160
                    *                                                   T4D05170
                          LD    2 UF901-X    IS COUNT OF VAR. EXHAUSTED T4D05180
                          BSC  L  UF350,+-   IF YES,RETURN TO CALLER    T4D05190
                    *                                                   T4D05200
                    UF440 LD    2 UF905-X    IF REDO IND. IS ON,        T4D05210
                          BSC     +-         *GO TRASMIT RECORD         T4D05220
                          MDX     UF460      GO CHECK COUNT FOR CONT.   T4D05230
                          SLT     32         CLEAR REDO IND.            T4D05240
                          STD   2 UF904-X    *AND BUFFER COUNTER        T4D05250
                          LD    2 UF907-X    SET BUFFER PTR. FROM       T4D05260
                          STO   2 UF906-X    *INITIAL POSITION          T4D05270
                          LD    2 UF912-X    IS THIS A READ OR WRITE    T4D05280
                          BSC     +-         IF WRITE, SKIP             T4D05290
                          BSI   2 UF100-X    IF READ, CLEAR BUFFER      T4D05300
                          LD    2 UF936-X    INCREMENT                  T4D05310
                          A     2 UF909-X    *RECORD COUNT              T4D05320
                          STO   2 UF936-X    *BY ONE AND                T4D05330
                          STO     UF990+2    *STORE VALUE IN I/O AREA   T4D05340
                          LD    2 UF912-X                               T4D05350
                          BSC     +-         SKIP ON WRITE              T4D05360
                          MDX     UF450      GO TO DO A READ            T4D05370
                          LD    2 UF933-X    SET BUFFER WD CNT INTO     T4D05380
                          STO     UF990+3    *RECORD IN I/O AREA        T4D05390
                          BSI   2 UF130-X    GO DO A WRITE              T4D05400
                          MDX     UF460      SKIP TO CONT               T4D05410
                    *                                                   T4D05420
                    UF450 BSI   2 UF120-X    GO DO A READ               T4D05430
                    *                                                   T4D05440
                    UF460 LD    2 UF906-X    GET BUFFER POINTER         T4D05450
                          A     2 UF910-X    INCR. BY AMOUNT OF VAR.    T4D05460
                          S     2 UF934-X    HAS LAST BUF. ELEMENT BEEN T4D05470
                          BSC  L  UF470,+    EXCEEDED, IF NO, BRCH. AND T4D05480
                          MDX  L  UF905,2    YES, SET REDO IND.         T4D05490
                          MDX     UF440      *AND BRANCH TO TRANSMIT    T4D05500
                    *                                                   T4D05510
                    UF470 LD    2 UF910-X    SET WD. CNT. INTO          T4D05520
                          STO   2 UF926-X    *TEMPORARY WORKING CELL    T4D05530
                          LDX  I1 UF900      PUT VAR. ADDRS. IN I.R.    T4D05540
                    *                                                   T4D05550
                    UF480 LD    2 UF912-X    IS THIS A READ OPERATION   T4D05560
                          BSC     +-         IF NO, SKIP TO HANDLE WRT  T4D05570
                          MDX     UF520      GO HANDLE MOVE FOR READ    T4D05580
                          LD    1 0          MOVE DATA FROM STORAGE     T4D05590
                          STO  I  UF906      *TO BUFFER AREA            T4D05600
                    *                                                   T4D05610
                    UF490 MDX  L  UF906,1    INCR. BUFFER POINTER BY 1  T4D05620
                          MDX   1 1          INCR. VAR. ADDRS. BY 1     T4D05630
                          NOP                TO HANDLE SKIP             T4D05640
                          MDX  L  UF926,-1   DECR. COUNT BY 1           T4D05650
                          MDX     UF480      OKAY, GO GET NEXT WORD     T4D05660
                          LD    2 UF912-X    IS A READ SPECIFIED        T4D05670
                          BSC  L  UF510,+-   IF YES, BRANCH TO HANDLE   T4D05680
                          LD    2 UF933-X    INCR. BUFFER               T4D05690
                          A     2 UF910-X    *COUNT BY                  T4D05700
                    UF500 STO   2 UF933-X    *RESET                     T4D05710
                          LDD   2 UF900-X    DECR. ADDRESS OF VARIABLE  T4D05720
                          SD    2 UF910-X    *BY 3 AND COUNT OF         T4D05730
                          STD   2 UF900-X    *VARIABLES BY 1            T4D05740
                          MDX     UF430      BRANCH BACK TO CHECK COUNT T4D05750
                    UF510 LD    2 UF933-X    DECR. BUFFER               T4D05760
                          S     2 UF910-X    *COUNT BY RESET            T4D05770
                          BSC     -          IF NEG., AN ERROR EXISTS   T4D05780
                          MDX     UF500      IF POS. OR 0, BRANCH AHEAD T4D05790
                          LD    2 UF909-X    SET ERROR CODE IN A REG.   T4D05800
                          BSI   2 UF150-X    *AND GO TO ERROR ROUTINE   T4D05810
                          LD    2 UF948-X    RESTO ORIG WD CNT          T4D05820
                          MDX     UF500      BR TO RESET ADDR2          T4D05830
                    *                                                   T4D05840
                    UF520 LD   I  UF906      MOVE DATA FROM BUFFER AREA T4D05850
                          STO   1 0          *TO STORAGE                T4D05860
                          MDX     UF490      BRANCH TO CHECK TEMP. CNT. T4D05870
                    *                                                   T4D05880
                    *                                                   T4D05890
                    *             LIBF UCOMP ENTRY POINT                T4D05900
                    *                                                   T4D05910
                    UCOMP STX   1 UF350+1    SAVE I.R. 1                T4D05920
                          LDX  I1 *-*        I/O COMPLETE ENTRY POINT   T4D05930
                          STX   1 UF350+3    STORE RETURN ADDRESS       T4D05940
                          LD    2 UF941-X    HAS ERR BEEN DISPLAYED2-10 T4D05942
                          BSC  L  UF350,Z    YES-GO OUT.NO-CONTINUE2-10 T4D05944
                          LD    2 UF912-X    IS READ SPECIFIED          T4D05950
                          BSC  L  UF620,+-   IF YES, BRANCH TO HANDLE   T4D05960
                          LD    2 UF905-X    IS REDO IND. ON            T4D05970
                          BSC     +-         IF YES, SKIP TO WRITE REC- T4D05980
                          MDX     UF610      NO, BRANCH TO SET LAST REC T4D05990
                    *                                                   T4D06000
                    UF600 LD    2 UF933-X    STORE BUFCT PLUS LAST      T4D06010
                          OR    2 UF919-X    *REC IND IN FIRST          T4D06020
                          STO     UF990+3    *WORD OF RECORD            T4D06030
                          LD    2 UF936-X    INCREMENT                  T4D06040
                          A     2 UF909-X    *RECORD COUNT              T4D06050
                          STO   2 UF936-X    *BY 1 AND                  T4D06060
                          STO     UF990+2    *STORE VALUE IN I/O AREA   T4D06070
                    *                                                   T4D06080
                          BSI   2 UF130-X    WRITE RECORD               T4D06090
                    *                                                   T4D06100
                          BSC  L  UF350      BR TO EXIT                 T4D06110
                    *                                                   T4D06120
                    UF610 LD    2 UF933-X    HAS LAST REC. BEEN WRITTEN T4D06130
                          BSC     Z          IF YES, SKIP TO HANDLE     T4D06140
                          MDX     UF600      NO,BRANCH BACK TO WRITE IT T4D06150
                          MDX  L  $UFIO,-1   BKSP POINTER 1 SECTOR      T4D06160
                          SLA     16         SET READ - WRITE IND.      T4D06170
                          STO   2 UF912-X    *TO PERFORM A READ         T4D06180
                          BSI   2 UF120-X    GO DO THE READ             T4D06190
                          MDX  L  $UFIO,-1   BKSP POINTER 1 SECTOR      T4D06200
                          LD    2 UF937-X    SET READ - WRITE IND.      T4D06210
                          STO   2 UF912-X    *TO PERFORM A WRITE        T4D06220
                          MDX     UF600      GO SET LAST RECORD IND.    T4D06230
                    *                                                   T4D06240
                    UF620 LD    2 UF935-X    IS LAST REC. IND. ON       T4D06250
                          BSC  L  UF350,Z    IF YES, BR TO EXIT         T4D06260
                    *                                                   T4D06270
                          BSI   2 UF120-X    NO, GO READ RECS. UNTIL    T4D06280
                          MDX     UF620      *IT GOES ON, BRANCH BACK   T4D06290
                    *                                                   T4D06300
                    *                                                   T4D06310
                    *             UFIO DISK BUFFER                      T4D06320
                    *                                                   T4D06330
                          BSS  E  0                                     T4D06340
                    UF990 DC      320        WORD COUNT FOR 1 SECTOR    T4D06350
                          DC      *-*        SECTOR ADDRESS             T4D06360
                    *                                                   T4D06370
                    *             RECORD BEGINS HERE                    T4D06380
                    *                                                   T4D06390
                    UF992 DC      *-*        RECORD NO. OF LOGICAL RCD  T4D06400
                          DC      *-*        WORD COUNT (- IF LAST RCD) T4D06410
                    *                                                   T4D06420
                          BSS     318        BUFFER AREA                T4D06430
                    *                                                   T4D06440
                          END                                           T4D06450
