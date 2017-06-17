                    *             JULY 6,1967                           T5F00010
                          HDNG    PAPTZ                                 T5F00020
                          LIBR                                          T5F00030
                          ISS  03 PAPTZ     4                           T5F00040
                    *************************************************** T5F00050
                    *STATUS-VERSION 2,MODIFICATION 10                 * T5F00060
                    *                                                 * T5F00070
                    *FUNCTION/OPERATION-                              * T5F00080
                    *   THIS ROUTINE IS USED BY FORTRAN PROGRAMS TO   * T5F00090
                    *   READ OR WRITE ON PAPER TAPE.                  * T5F00100
                    *                                                 * T5F00110
                    *ENTRY POINTS-                                    * T5F00120
                    *   * PAPTZ-CALL PORTION FROM FORTRAN SFIO PROGRAM* T5F00130
                    *   * BZ100-INTERRUPT ENTRY                       * T5F00140
                    *   THE SUBROUTINE IS ENTERED BY A LIBF    PAPTZ  * T5F00150
                    *                                                 * T5F00160
                    *INPUT-                                           * T5F00170
                    *   * XR1 CONTAINS THE I/O BUFFER ADDR            * T5F00180
                    *   * XR2 CONTAINS THE WORD COUNT                 * T5F00190
                    *   * ACC CONTAINS 0 FOR READ, 2 FOR WRITE        * T5F00200
                    *                                                 * T5F00210
                    *OUTPUT-                                          * T5F00220
                    *   * PUNCHED PAPER TAPE IF WRITE                 * T5F00230
                    *   * A BUFFER FULL OF EBC INFORMATION IF READ    * T5F00240
                    *                                                 * T5F00250
                    *EXTERNAL REFERENCES-                             * T5F00260
                    *   * $EXIT                                       * T5F00270
                    *   * $PRET                                       * T5F00280
                    *                                                 * T5F00290
                    *EXITS-                                           * T5F00300
                    *   NORMAL-                                       * T5F00310
                    *      * CALL PORTION-PAPTZ+1, BACK TO SFIO       * T5F00320
                    *      * INTERRUPT PORTION-BZ100, BACK TO ILSO4   * T5F00330
                    *      * $EXIT-MONITOR EXIT WHEN //(BLANK) CONTROL* T5F00340
                    *        RECORD FOUND.                            * T5F00350
                    *   ERROR-                                        * T5F00360
                    *      * $PRET-MONITOR PRE-OPERATIVE ERROR TRAP   * T5F00370
                    *        WHEN NOT IN READY STATUS                 * T5F00380
                    *                                                 * T5F00390
                    *TABLES/WORK AREAS-                               * T5F00400
                    *   CONTAINS CONVERSION TABLE OF ALL CHARACTERS   * T5F00410
                    *   ALLOWABLE FOR CONVERTING FROM EBC TO PAPER    * T5F00420
                    *   TAPE CODE AND VICE-VERSA.                     * T5F00430
                    *                                                 * T5F00440
                    *ATTRIBUTES-RELOCATABLE                           * T5F00450
                    *                                                 * T5F00460
                    *NOTES-REGISTERS NOT SAVED                        * T5F00470
                    *                                                 * T5F00480
                    *************************************************** T5F00490
                    *                                                 * T5F00500
                          HDNG    PAPTZ                                 T5F00510
                    *                                                   T5F00520
                    *             SYSTEM COMMUNICATION WORDS            T5F00530
                    *                                                   T5F00540
                    $EXIT EQU     /38        MONITOR EXIT               T5F00550
                    $PRET EQU     /28        MONITOR PRE-OP ERR TRAP    T5F00560
                    *                                                   T5F00570
                    *             PROGRAM ENTRY POINT                   T5F00580
                    *                                                   T5F00590
                    PAPTZ MDX     BZ200      ENTRY                      T5F00600
                          BSC  I  *-*        EXIT FROM ROUTINE          T5F00610
                    BZ010 DC      0          ROUTINE BUSY INDICATOR     T5F00620
                    *                                                   T5F00630
                    *             INTERRUPT ENTRY FROM INTERRUPT LEVEL  T5F00640
                    *             SUBROUTINE.  THIS PORTION PROCESSES   T5F00650
                    *             INTERRUPTS AND RETURNS TO THE MAIN-   T5F00660
                    *             LINE CODING OF THIS SUBROUTINE        T5F00670
                    *             THROUGH $ILS4                         T5F00680
                    *                                                   T5F00690
                    BZ100 DC      *-*        INTERRUPT ENTRY VIA BSI    T5F00700
                          XIO     BZ900      RESET INTERRUPT LEVEL      T5F00710
                          STO     BZ926      SAVE INTERRUPT STATUS WD   T5F00720
                          STX     BZ010      SET ROUTINE BUSY FLAG      T5F00730
                          BSC  I  BZ100      RETURN TO $ILS4            T5F00740
                    *                                                   T5F00750
                    *             MAINLINE PORTION OF PROGRAM.          T5F00760
                    *             INITIALIZATION PHASE  A BRANCH OCCURS T5F00770
                    *             ON ENTRY TO THE PAPTZ SUBROUTINE      T5F00780
                    *                                                   T5F00790
                    BZ200 EQU     *          ENTRY POINT                T5F00800
                          STO     BZ924      SAVE READ/WRITE INDICATOR  T5F00810
                          BSC     +-         SKIP IF WRITE              T5F00820
                          LDX   2 120        SET MAX. BUFR SIZE FOR RD  T5F00830
                          MDX   2 1          INCR WD CNT BY 1 FOR NEW   T5F00840
                    *                        *LINE CHARACTER            T5F00850
                          STX   2 BZ929      SAVE WD COUNT              T5F00860
                          STX   1 BZ300+1    SAVE BUFFER ADDRESS        T5F00870
                          STX     BZ922      SET NEW LINE SW TO NO EXIT T5F00880
                          STX     BZ918      SET CASE CHAR TEST SW      T5F00890
                    BZ210 XIO     BZ900      SENSE AND TEST IF READY    T5F00900
                          SLA     1                                     T5F00910
                          MDX  L  BZ924,0    CHECK FOR READ OR WRITE    T5F00920
                          MDX     BZ400      BRANCH IF WRITE            T5F00930
                          SLA     4          SHIFT READY INDR TO SIGN   T5F00940
                          BSC  L  BZ350,+Z   BRANCH IF NOT READY        T5F00950
                          XIO     BZ902      START READER               T5F00960
                    *                                                   T5F00970
                    *             WAIT FOR NEXT INTERRUPT TO OCCUR      T5F00980
                    *             ROUTINE BUSY INDICATOR (BZ010) = 0    T5F00990
                    *             INDICATES NO INTERRUPT WAITING TO BE  T5F01000
                    *             PROCESSED                             T5F01010
                    *                                                   T5F01020
                    BZ220 LD      BZ010      LOAD SUBROUTINE BUSY INDR  T5F01030
                          BSC  L  BZ220,+-   WAIT IF NO INTERRUPT       T5F01040
                          SLA     16         CLEAR SUBROUTINE BUSY INDR T5F01050
                          STO     BZ010      *SO WAIT WILL OCCUR NEXT   T5F01060
                    *                                                   T5F01070
                    *             PROCESS INTERRUPT                     T5F01080
                    *                                                   T5F01090
                          LD      BZ926      LOAD READ/WRITE INDICATOR  T5F01100
                          SLA     1          SHIFT WRITE BIT TO SIGN    T5F01110
                          BSC  L  BZ400,-    BRANCH IF WRITE            T5F01120
                    *                                                   T5F01130
                          XIO     BZ904      READ CHARACTER             T5F01140
                          LD      BZ925      LOAD CHARACTER READ        T5F01150
                          S       BZ914      TEST FOR UPPER CASE CHAR   T5F01160
                          BSC  L  BZ230,Z    BR IF NOT UPPER-CASE       T5F01170
                          LD      BZ916      LOAD UPPER CASE CONSTANT   T5F01180
                          MDX     BZ240      BR TO SAVE CONSTANT        T5F01190
                    *                                                   T5F01200
                    BZ230 S       BZ912      TEST FOR LOWER CASE        T5F01210
                          BSC  L  BZ245,Z    BR IF NOT LOWER CASE       T5F01220
                          SLA     16         CLEAR ACC (LOWER CASE CON) T5F01230
                    BZ240 STO     BZ928      SAVE CASE CONSTANT         T5F01240
                          MDX     BZ210      BR TO READ ANOTHER CHAR    T5F01250
                    *                                                   T5F01260
                    BZ245 S       BZ923      TEST FOR DELETION          T5F01270
                          BSC  L  BZ210,+-   DELETE FOUND,GO RD NXTCHAR T5F01280
                          S       BZ910      TEST FOR NEWLINE CHAR      T5F01290
                          BSC  L  BZ300,+-   BR TO EXIT IF NEWLINE CHAR T5F01300
                          LD      BZ925      GET CHARACTER FROM INPUT   T5F01310
                          OR      BZ928      SET CHAR TO CURRENT CASE   T5F01320
                          STO     BZ925      SAVE NEW CHAR              T5F01330
                          LDX   2 -53        SET TO SCAN CONVERT TABLE  T5F01340
                    BZ250 SLT     16         CLEAR EXTENSION            T5F01350
                          LD   L2 BZ990+1    GET CHAR FROM TABLE        T5F01360
                          RTE     24         RIGHT 1/2 TBL WD TO ACC    T5F01370
                          EOR     BZ925      COMPARE WITH IO WD READ    T5F01380
                          BSC  L  BZ260,+-   BRANCH IF EQUAL            T5F01390
                          MDX   2 1          INCR TABLE POINTER         T5F01400
                          MDX     BZ250      BR IF TABLE NOT EXHAUSTED  T5F01410
                          LDD     BZ911      CHAR NOT IN TBL, LD BLANKS T5F01420
                    BZ260 RTE     16         SHIFT EBC CHAR FR EXTNSION T5F01430
                          STO   1 0          STORE IN OUTPUT BUFFER     T5F01440
                          MDX   1 1          INCR. BUFFER ADDR          T5F01450
                          MDX  L  BZ929,-1   DECREMENT CHAR COUNT       T5F01460
                          MDX     BZ210      BR FOR NXT CHAR IF CNT GTO T5F01470
                    *                                                   T5F01480
                    *             ALL CHARACTERS HAVE BEEN READ EXIT    T5F01490
                    *             ROUTINE FOLLOWS                       T5F01500
                    *                                                   T5F01510
                    *                                                   T5F01520
                    *             CHECK FOR //BLANK CONTROL RECORD ON   T5F01530
                    *             READ. IF FOUND BRANCH TO MONITOR      T5F01540
                    *             EXIT ROUTINE                          T5F01550
                    *                                                   T5F01560
                    *                                                   T5F01570
                    BZ300 LDX  L1 *-*        GET LOC OF FIRST BUFR WD   T5F01580
                          LDD   1 0          LOAD 2 WDS FROM BUFFER     T5F01590
                          SD      BZ915      TEST FOR // (SLASH MUST BE T5F01600
                    *                        * AT ODD ADDRESS)          T5F01610
                    *                                                   T5F01620
                          BSC     +-         SKIP IF ACC NON ZERO       T5F01630
                          RTE     16         PUT EXTENSION IN ACC       T5F01640
                          BSC  L  PAPTZ+1,Z  RETURN IF NOT //           T5F01650
                          LD    1 2          TEST THIRD CHARACTER       T5F01660
                          EOR     BZ911      TEST FOR BLANK             T5F01670
                          BSC  L  PAPTZ+1,Z RETURN IF NOT BLANK    2-10 T5F01680
                          LDX     $EXIT      BR TO MONITOR EXIT         T5F01690
                    *                                                   T5F01700
                    *             PAPER TAPE NOT IN READY STATUS,       T5F01710
                    *             LOAD ERROR INDICATOR (13000)          T5F01720
                    *             BR TO SYSTEM PRE OPERATIVE ERROR TRAP T5F01730
                    *                                                   T5F01740
                    BZ350 LD      BZ927      LOAD ERROR INDICATOR       T5F01750
                          BSI  L  $PRET      BRANCH TO TRAP             T5F01760
                          MDX     BZ210      BRANCH TO PROCESS NXT CHAR T5F01770
                    *                                                   T5F01780
                    *             CONSTANTS                             T5F01790
                    *                                                   T5F01800
                          BSS  E  0                                     T5F01810
                    BZ900 DC      /1100      DELETE CONSTANT AND        T5F01820
                          DC      /1F05      *SENSE IOCC WITH RESET     T5F01830
                    *             THE FIRST IOCC WD  AT BZ900 AND BZ902 T5F01840
                    *             IS USED FOR CONSTANT  STORAGE         T5F01850
                    BZ902 DC      /DD00      NEW LINE OP CODE AND       T5F01860
                          DC      /1C10      *START READER IOCC WORD    T5F01870
                    BZ904 DC      BZ925      READ IOCC WORD             T5F01880
                          DC      /1A00                                 T5F01890
                    BZ906 DC      BZ925      WRITE IOCC WORD            T5F01900
                          DC      /1900                                 T5F01910
                    BZ910 DC      /5E00      NEW LINE CONSTANT TEST     T5F01920
                    BZ911 DC      /0040      EBC BLANK--MUST BE ODD LOC T5F01930
                    BZ912 DC      /6000      LOWER CASE CONSTANT TEST   T5F01940
                    BZ913 DC      /1000      PT BLANK--MUST BE ODD LOC  T5F01950
                    BZ914 DC      /0E00      UPPER CASE CONSTANT TEST   T5F01960
                    BZ915 DC      /0061     EBC SLASH MUST BE ODD  2-10 T5F01970
                    BZ916 DC      /8000      UPPER CASE MASK            T5F01980
                    BZ917 DC      /6E00      CASE CHANGE MASK           T5F01990
                    BZ918 DC      0          CASE CHARACTER FLAG        T5F02000
                    BZ919 DC      0          CASE TO BE O/P             T5F02010
                    BZ920 DC      0          O/P CHAR-FOR CASE CHG TEST T5F02020
                    BZ921 DC      0          PREVIOUS O/P CASE          T5F02030
                    BZ922 DC      0          NEW LINE CHAR SWITCH       T5F02040
                    BZ923 EQU     BZ900      DELETE CONSTANT TEST CODE  T5F02050
                    BZ924 DC      0          READ/WRITE INDICATOR       T5F02060
                    BZ925 DC      0          CHAR TO READ OR WRITE OUT  T5F02070
                    BZ926 DC      0          DSW WD FROM SENSE          T5F02080
                    BZ927 DC      /3000      ERROR INDICATOR            T5F02090
                    BZ928 DC      0          CASE CHAR ON READ          T5F02100
                    BZ929 DC      0          WORD COUNT                 T5F02110
                    BZ930 EQU     BZ902      NEW LINE O/P CODE          T5F02120
                    *                                                   T5F02130
                    *             CONVERT AND PUNCH PAPERTAPE OUTPUT    T5F02140
                    *                                                   T5F02150
                    BZ400 SLA     6          TEST IF PUNCH READY        T5F02160
                          BSC  L  BZ350,+Z   BRANCH IF NOT READY        T5F02170
                    *                                                   T5F02180
                          LD      BZ922      LAST CHAR O/P = NEW LINE   T5F02190
                          BSC  L  PAPTZ+1,+- RETURN IF YES              T5F02200
                          LD      BZ919      LAST CHAR O/P = CASE       T5F02210
                          BSC  L  BZ430,Z    YES, O/P CHAR              T5F02220
                          MDX  L  BZ929,-1   DECREMENT CHARACTER COUNT  T5F02230
                          MDX     BZ410-1    BR UNLESS LOOP FINISHED    T5F02240
                    *                                                   T5F02250
                    *             LOOP FINISHED ALL CHARACTERS 0/P      T5F02260
                    *                                                   T5F02270
                          SLA     16         CLEAR ACC                  T5F02280
                          STO     BZ922      SET NEW LINE CHAR SWITCH   T5F02290
                          LD      BZ930      GET NEW LINE CHARACTER     T5F02300
                          MDX     BZ440      BR TO OUTPUT NEW LINE CHAR T5F02310
                    *                                                   T5F02320
                    *             SCAN TABLE FOR CHARACTER FOR OUTPUT   T5F02330
                    *             AND CONVERT TO PAPER TAPE CODE        T5F02340
                    *                                                   T5F02350
                          LDX   2 -53        SET COUNT ON TABLE SIZE    T5F02360
                    BZ410 SLT     16         CLEAR EXTENSION            T5F02370
                          LD   L2 BZ990+1    LOAD CHAR FROM TABLE       T5F02380
                          RTE     8          SHIFT CHARACTER            T5F02390
                          EOR   1 0          COMPARE WITH BUFFER CHAR   T5F02400
                          BSC  L  BZ420,+-   BRANCH IF EQUAL            T5F02410
                          MDX   2 1          DECREMENT COUNT ON TABLE   T5F02420
                          MDX     BZ410      BR UNLESS TABLE FINISHED   T5F02430
                          LDD     BZ913      NO MATCH FOUND. O/P BLANK  T5F02440
                    BZ420 RTE     16         SHIFT CHARACTER TO O/P     T5F02450
                          STO     BZ920      SAVE CHAR                  T5F02460
                          EOR     BZ921      TEST IF CASE CHANGE REQ    T5F02470
                          BSC  L  BZ450,+Z   BR IF YES                  T5F02480
                          LD      BZ918      CASE CHAR NO O/P FLAG      T5F02490
                          BSC  L  BZ450,Z    O/P CASE CHAR INITIALLY    T5F02500
                    BZ430 SLA     16                                    T5F02510
                          STO     BZ919      CLEAR CASE INDICATOR       T5F02520
                          STO     BZ918      CLEAR CASE SWITCH          T5F02530
                          LD      BZ920      LOAD NEW CASE CHAR         T5F02540
                          STO     BZ921      SAVE FOR NEXT TIME CHECK   T5F02550
                          SLA     1          REMOVE SIGN                T5F02560
                          SRA     1                                     T5F02570
                          MDX   1 1          INCR BUFFER ADDRESS        T5F02580
                    BZ440 STO     BZ925      SAVE CHAR IN O/P CHARACTER T5F02590
                          XIO     BZ906      INITIATE WRITE             T5F02600
                          BSC  L  BZ220      BR TO WAIT FOR INTERRUPT   T5F02610
                    *                                                   T5F02620
                    *             SETUP TO OUTPUT CASE CHANGE           T5F02630
                    *                                                   T5F02640
                    BZ450 LD      BZ920      LOAD CHARACTER             T5F02650
                          AND     BZ916      MASK OUT ALL BUT CASE BIT  T5F02660
                          SRT     2          SHIFT CHAR INCLUDING SIGN  T5F02670
                          AND     BZ917      MASK OUT BIT 0 AND CONVERT T5F02680
                          EOR     BZ917      *TO /6E00 OR /0E00         T5F02690
                          STO     BZ919      STORE CASE CHARACTER       T5F02700
                          MDX     BZ440      BR TO O/P CASE CHAR        T5F02710
                    *                                                   T5F02720
                    *             THE FOLLOWING IS A CONVERT TABLE. THE T5F02730
                    *             LEFT 2 CHARACTERS OF EACH WORD ARE    T5F02740
                    *             THE EBC CODE. THE RIGHT 2 CHARACTERS  T5F02750
                    *             ARE THE PAPER TAPE CODE.              T5F02760
                    *                                                   T5F02770
                          DC      /4010      BLANK                      T5F02780
                          DC      /F01A      0                          T5F02790
                          DC      /F101      1                          T5F02800
                          DC      /F202      2                          T5F02810
                          DC      /F313      3                          T5F02820
                          DC      /F404      4                          T5F02830
                          DC      /F515      5                          T5F02840
                          DC      /F616      6                          T5F02850
                          DC      /F707      7                          T5F02860
                          DC      /F808      8                          T5F02870
                          DC      /F919      9                          T5F02880
                          DC      /6040      -                          T5F02890
                          DC      /4B6B      .                          T5F02900
                          DC      /C5F5      E                          T5F02910
                          DC      /4EF0      PLUS                       T5F02920
                          DC      /5070      AMPERSAND                  T5F02930
                          DC      /7E81      EQUAL                      T5F02940
                          DC      /5D9A      RIGHT PAREN                T5F02950
                          DC      /4D99      LEFT PAREN                 T5F02960
                          DC      /6B3B      ,                          T5F02970
                          DC      /7D96      APOSTROPHE                 T5F02980
                          DC      /6131      /                          T5F02990
                          DC      /5C88      *                          T5F03000
                          DC      /5B5B      $                          T5F03010
                          DC      /4C82      LESS THAN                  T5F03020
                          DC      /6C95      PERCENT                    T5F03030
                          DC      /7B0B      POUND SIGN                 T5F03040
                          DC      /7C20      AT SIGN                    T5F03050
                          DC      /C1E1      A                          T5F03060
                          DC      /C2E2      B                          T5F03070
                          DC      /C3F3      C                          T5F03080
                          DC      /C4E4      D                          T5F03090
                          DC      /C6F6      F                          T5F03100
                          DC      /C7E7      G                          T5F03110
                          DC      /C8E8      H                          T5F03120
                          DC      /C9F9      I                          T5F03130
                          DC      /D1D1      J                          T5F03140
                          DC      /D2D2      K                          T5F03150
                          DC      /D3C3      L                          T5F03160
                          DC      /D4D4      M                          T5F03170
                          DC      /D5C5      N                          T5F03180
                          DC      /D6C6      O                          T5F03190
                          DC      /D7D7      P                          T5F03200
                          DC      /D8D8      Q                          T5F03210
                          DC      /D9C9      R                          T5F03220
                          DC      /E2B2      S                          T5F03230
                          DC      /E3A3      T                          T5F03240
                          DC      /E4B4      U                          T5F03250
                          DC      /E5A5      V                          T5F03260
                          DC      /E6A6      W                          T5F03270
                          DC      /E7B7      X                          T5F03280
                          DC      /E8B8      Y                          T5F03290
                    BZ990 DC      /E9A9      Z                          T5F03300
                          END                                           T5F03310
