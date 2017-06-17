                          HDNG    CARD CONSOLE PRINTER DUMP             ZDC00010
                    *************************************************** ZDC00020
                    *STATUS-VERSION 2,MODIFICATION 000                * ZDC00030
                    *                                                 * ZDC00040
                    *FUNCTION/OPERATION- THIS IS A ONE CARD DUMP ON   * ZDC00050
                    *THE TYPEWRITER.THE CARD IS LOADED BY PRESSING    * ZDC00060
                    *PROGRAM LOAD.THE PROGRAM IS PUNCHED IN THE CARD  * ZDC00070
                    *IN 1130 IPL FORMAT,THUS THE PROGRAM WHEN LOADED  * ZDC00080
                    *CONTAINS NO LONG OR INDEXED INSTRUCTIONS.SUCH    * ZDC00090
                    *INSTRUCTIIONS HAVE TO BE BUILT UP BEFORE THE DUMP* ZDC00100
                    *PORTION OF THE PROGRAM CAN BE EXECUTED. THIS     * ZDC00110
                    *PROGRAM GETS ITS STARTING ADDRESS FROM THE BIT-  * ZDC00120
                    *SWITCHES AND DUMPS 4 CHARACTERS PER WORD WITH A  * ZDC00130
                    *SPACE SEPARATING EACH WORD,THE NO. OF WORDS TYPED* ZDC00140
                    *DEPENDS ON THE MARGIN SETTING OF THE TYPEWRITER. * ZDC00150
                    *ENTRY POINTS-                                    * ZDC00160
                    *     *START- THIS IS THE ONLY NORMAL ENTRY TO THE* ZDC00170
                    *     PROGRAM,.INTRP. IS THE ENTRY WHICH SERVICES * ZDC00180
                    *     THE TYPEWRITER INTERRUPTS.                  * ZDC00190
                    *                                                 * ZDC00200
                    *INPUT- THE STARTING ADDRESS PROVIDED BY THE USER * ZDC00210
                    *IN THE BIT SWITCHES.                             * ZDC00220
                    *OUTPUT- PRINTED CHARACTERS 4 PER WORD WITH A     * ZDC00230
                    *SEPARATING SPACE ON THE 1053 TYPEWRITER.         * ZDC00240
                    *                                                 * ZDC00250
                    *EXTERNAL REFERENCES- NONE                        * ZDC00260
                    *                                                 * ZDC00270
                    *EXITS NORMAL- NONE. THE PROGRAM TYPES            * ZDC00280
                    *CONTINUOUSLY ON THE TYPEWRITER UNTIL IMM.STOP IS * ZDC00290
                    *PRESSED.                                         * ZDC00300
                    *                                                 * ZDC00310
                    *TABLES/WORK-AREAS. .TABLE. IS THE BEGINNING OF 4 * ZDC00320
                    *16-WORD TABLE OF RT-JUSTIFIED TYPEWRITER CODE    * ZDC00330
                    *CHARACTERS 0 THRU F.                             * ZDC00340
                    *                                                 * ZDC00350
                    *ATTRIBUTES- REUSABLE                             * ZDC00360
                    *                                                 * ZDC00370
                    *NOTES-PORTIONS OF THE PROGRAM WHICH EXECUTE ONE- * ZDC00380
                    *TIME INITIALIZATIONS ARE USED AS WORK-AREAS,.BUF.* ZDC00390
                    *.ONE.,.SAVE.,.COUNT.                             * ZDC00400
                    *                                                 * ZDC00410
                    *************************************************** ZDC00420
                          HDNG    CARD CONSOLE PRINTER DUMP             ZDC00430
                          ABS                                           ZDC00440
                          ORG     0                                     ZDC00450
                    *ONE CARD DUMP ON  TYPEWRITER                       ZDC00460
                    *                                                   ZDC00470
                    START LDD     INTRP-1   MAKE WDS AT INTRP-1 AND     ZDC00480
                          SLC     9         *INTRP  BOSC L *-*          ZDC00490
                          STO     INTRP-1                               ZDC00500
                          LD      SENSE+1   SET  UP IOCC                ZDC00510
                          SRA     4         FOR  SENSE                  ZDC00520
                          MDX     GO        BRANCH AROUND               ZDC00530
                    *                                                   ZDC00540
                    *THE NEXT TWO WORDS BECOME  BOSC L 0000             ZDC00550
                    *                                                   ZDC00560
                          DC      /0026     /4C40  BOSC L               ZDC00570
                    INTRP DC      /2000     /0000   *-* . INTRUPT RTN.  ZDC00580
                          STO     SAVE      SAVE ACC                    ZDC00590
                          XIO     SENSE     TURN  OFF INTRRUPT          ZDC00600
                          LD      SAVE      RESTORE ACC                 ZDC00610
                          MDX     INTRP-1   EXIT                        ZDC00620
                          DC      INTRP     LEVEL 4 INTERRUPT WORD      ZDC00630
                    GO    STO     SENSE+1                               ZDC00640
                          LD      STAR      SET UP LONG LOAD            ZDC00650
                    LUCK  SLA     8         *INSTRUCTIONS AT *          ZDC00660
                          STO     STAR      *.STAR. AND                 ZDC00670
                          STO     STAR3     *.STAR3.                    ZDC00680
                    *                                                   ZDC00690
                          LDD     BITSW     SET - UP IOCC TO READ FROM  ZDC00700
                          RTE     10        * BIT SWITCHES INTO LOCN 1C ZDC00710
                          STD     BITSW     * WHICH IS STAR+1           ZDC00720
                    *                                                   ZDC00730
                    SWIT  LD      WRITE+1   SET UP  IOCC*               ZDC00740
                          SRA     4         *TO TYPE ONE*               ZDC00750
                          STO     WRITE+1   *CHARACTER *                ZDC00760
                    *                                                   ZDC00770
                          XIO     BITSW     READ STARTING ADDRESS       ZDC00780
                          LD      STAR+1    INITIALIZE TO TYPE STARTING ZDC00790
                          MDX     STAR+2    *ADDRESS                    ZDC00800
                    *                                                   ZDC00810
                    *THE NEXT TWO WORDS WERE PREVIOUSLY INITIALIZED     ZDC00820
                    * TO LD L *-*                                       ZDC00830
                    *                                                   ZDC00840
                    STAR  DC      /00C4     LOAD WORD TO                ZDC00850
                          DC      *-*       *BE DUMPED                  ZDC00860
                          RTE     16        SAVE WORD IN EXT            ZDC00870
                          LD      CONST     INIT COUNTER TO             ZDC00880
                          STO     COUNT     *60 HEX                     ZDC00890
                    STAR2 SLA     16        CLEAR ACC                   ZDC00900
                          SLC     4         BRING IN ONE CHARACTER      ZDC00910
                          A       TYTAB     COMPUTE ADDRESS OF CHAR     ZDC00920
                          STO     *+1                                   ZDC00930
                    *                                                   ZDC00940
                    *THE NEXT TWO WORDS WERE PREVIOUSLY SET UP          ZDC00950
                    *TO BE A LONG LOAD INSTRUCTION  LD L *-*            ZDC00960
                    *                                                   ZDC00970
                    STAR3 DC      *-*       LOAD REQUIRED CHARACTER     ZDC00980
                          DC      *-*       *FROM TABLE                 ZDC00990
                          SLA     8         LEFT-JUSTIFY                ZDC01000
                          STO     BUF       ST IN 1ST WD OF WRITE IOCC  ZDC01010
                    WRT   XIO     WRITE     TYPE ONE CHARACTER          ZDC01020
                          DC      /0010     WAIT FOR INTERRUPT          ZDC01030
                    CHNG2 LD      COUNT     CHECK IF                    ZDC01040
                          S       LUCK      *FOUR CHARACTERS            ZDC01050
                          STO     COUNT     *HAVE BEEN TYPED            ZDC01060
                          BSC     Z-        *SKIP IF YES                ZDC01070
                          MDX     STAR2     *NO,GO GET NEXT CHARACTER   ZDC01080
                          LD      SPACE     *YES,TYPE ONE               ZDC01090
                          SLA     8         *SPACE                      ZDC01100
                          STO     BUF       *CHARACTER                  ZDC01110
                          XIO     WRITE     *TYPE SPACE CHARACTER       ZDC01120
                    *                                                   ZDC01130
                    *THE FOLLOWING WORD SERVES BOTH AS A WAIT-FOR -     ZDC01140
                    *INTERRUPT AND ALSO A CONSTANT FOR A ROTATE/TILT    ZDC01150
                    *SPACE CHARACTER                                    ZDC01160
                    *                                                   ZDC01170
                    SPACE DC      /0021                                 ZDC01180
                          LD      SWIT      CHK.IF THIS IS ADDR. WORD   ZDC01190
                          BSC     Z         THAT WAS JUST TYPED,YES,GO  ZDC01200
                          MDX     LUCK2     TURN OFF SWITCH             ZDC01210
                          LD      STAR+1    MODIFY ADDRESS TO PICK      ZDC01220
                          A       ONE       UP NEXT WD. TO BE DUMPED.   ZDC01230
                          STO     STAR+1                                ZDC01240
                    SENSE MDX     STAR      GO DO NEXT WORD             ZDC01250
                          DC      /F010     SENSE  IOCC                 ZDC01260
                    *                                                   ZDC01270
                    *TABLE OF ROTATE/TILT CHARACTERS ,0 THROUGH F       ZDC01280
                    *                                                   ZDC01290
                    TABLE DC      /00C4     0                           ZDC01300
                          DC      /00FC     1                           ZDC01310
                          DC      /00D8     2                           ZDC01320
                          DC      /00DC     3                           ZDC01330
                          DC      /00F0     4                           ZDC01340
                          DC      /00F4     5                           ZDC01350
                          DC      /00D0     6                           ZDC01360
                          DC      /00D4     7                           ZDC01370
                          DC      /00E4     8                           ZDC01380
                          DC      /00E0     9                           ZDC01390
                    TYTAB DC      /003C     A                           ZDC01400
                          DC      /0018     B                           ZDC01410
                    BITSW DC      /70E8     C  ALSO 1ST WD OF BIT SW IO ZDC01420
                    CONST DC      /C000     D  ALSO 2ND WD OF BIT SW IO ZDC01430
                          DC      /0034     E                           ZDC01440
                    LUCK2 DC      /1810     F  ALSO SRA 16 INSTRUCTION  ZDC01450
                          STO     SWIT      *TELLS US THAT ADDRESS IS * ZDC01460
                          MDX     STAR      *TYPED                    * ZDC01470
                    WRITE DC      BUF       CONSTANT 1                  ZDC01480
                          DC      /9010     WRITE IOCC                  ZDC01490
                    BUF   EQU     START+1   LOC. OF BUF IS 0001         ZDC01500
                    ONE   EQU     WRITE     CONSTANT ONE                ZDC01510
                    SAVE  EQU     START+2   WORD TO SAVE ACC            ZDC01520
                    COUNT EQU     START+3   CONST TO COUNT 4 CHARACTERS ZDC01530
                          END     START                                 ZDC01540
