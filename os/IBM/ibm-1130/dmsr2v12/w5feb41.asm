                          HDNG    FEB41 - MTCA TRANSLATION SUBROUTINES  W5A00010
                    *************************************************** W5A00020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * W5A00030
                    *                                                 * W5A00040
                    *SUBROUTINE NAME -                                * W5A00050
                    *   FULL NAME - EBCDIC TO 2741 LINE CODE AND 2741 * W5A00060
                    *               LINE CODE TO EBCDIC CONVERSION    * W5A00070
                    *               SUBROUTINES.                      * W5A00080
                    *   CODE NAMES - FEB41, BEB41, QEB41, F41EB,      * W5A00090
                    *                B41EB AND Q41EB.                 * W5A00100
                    *                                                 * W5A00110
                    *PURPOSE -                                        * W5A00120
                    *   THIS SUBROUTINE CONVERTS EBCDIC DATA IN       * W5A00130
                    *   EITHER A1 FORMAT I.E. ONE CHARACTER PER WORD  * W5A00140
                    *   IN THE LEFT HALF (XX40), OR IN INDEX FORMAT   * W5A00150
                    *   I.E. ONE CHARACTER PER WORD IN THE RIGHT HALF * W5A00160
                    *   (00XX),TO 2741 LINE CODE PACKED TWO CHARACTERS* W5A00170
                    *   PER WORD.  LINE CONTROL CHARACTERS ARE ALSO   * W5A00180
                    *   ADDED.  THIS SUBROUTINE ALSO CONVERTS 2741    * W5A00190
                    *   LINE CODE PACKED TWO CHARACTERS PER WORD TO   * W5A00200
                    *   EBCDIC UNPACKED AS ABOVE.                     * W5A00210
                    *                                                 * W5A00220
                    *METHOD -                                         * W5A00230
                    *   CONVERSION BOTH FROM EBCDIC TO LINE CODE AND  * W5A00240
                    *   FROM LINE CODE TO EBCDIC IS ACCOMPLISHED BY A * W5A00250
                    *   TABLE LOOK-UP PROCEDURE.  FOR CONVERSION FROM * W5A00260
                    *   EBCDIC TO 2741 LINE CODE, CASE SHIFT CHARS    * W5A00270
                    *   ARE ADDED WHERE REQUIRED.  FOR CONVERSION     * W5A00280
                    *   FROM 2741 LINE CODE TO EBCDIC THE APPROPRIATE * W5A00290
                    *   EBCDIC CHARACTER IS SELECTED ACCORDING TO THE * W5A00300
                    *   LAST CASE SHIFT CHARACTER DEALT WITH.         * W5A00310
                    *                                                 * W5A00320
                    *CAPABILITIES AND LIMITATIONS -                   * W5A00330
                    *   VALID CODES -                                 * W5A00340
                    *      ALL EBCDIC CHARACTERS WHICH HAVE A 2741    * W5A00350
                    *      LINE CODE EQUIVALENT.                      * W5A00360
                    *                                                 * W5A00370
                    *SPECIAL FEATURES -                               * W5A00380
                    *   EBCDIC DATA IN A1 FORMAT MAY BE ASSEMBLED     * W5A00390
                    *   EITHER FORWARD OR BACKWARD IN CORE (IN THIS   * W5A00400
                    *   CONTEXT FORWARD MEANS STARTING AT A LOW       * W5A00410
                    *   ADDRESS AND ENDING AT A HIGH ADDRESS). INDEX  * W5A00420
                    *   FORMAT DATA MUST BE ASSEMBLED FORWARD IN CORE.* W5A00430
                    *                                                 * W5A00440
                    *ADDITIONAL INFORMATION -                         * W5A00450
                    *   ERROR PROCEDURES -                            * W5A00460
                    *      ANY INVALID EBCDIC CHARACTER WILL BE       * W5A00470
                    *      CONVERTED TO A BLANK.  ANY BAD PARITY 2741 * W5A00480
                    *      LINE CODE CHARACTER WILL BE CONVERTED TO   * W5A00490
                    *      HEX FF40 FOR A1 FORMAT OR HEX 00FF FOR     * W5A00500
                    *      INDEX FORMAT.                              * W5A00510
                    *   CALLING SEQUENCE -                            * W5A00520
                    *      CALL    XXXXX    SUBROUTINE CALL           * W5A00530
                    *      DC      CTRL      ADDR OF CONTROL WORD     * W5A00540
                    *      DC      INPUT     ADDR OF FIRST INPUT WORD * W5A00550
                    *      DC      OTPUT     ADDR OF FIRST O/P WORD   * W5A00560
                    *      DC      CHCNT     ADDR OF EBCDIC CHAR CNT  * W5A00570
                    *         WHERE -                                 * W5A00580
                    *            * XXXXX DETERMINES WHICH CONVERSION  * W5A00590
                    *              IS REQUIRED -                      * W5A00600
                    *               FEB41 - EBCDIC TO 2741 LINE CODE  * W5A00610
                    *                       EBCDIC DATA IN A1 FORMAT  * W5A00620
                    *                       FORWARD IN CORE           * W5A00630
                    *               BEB41 - EBCDIC TO 2741 LINE CODE  * W5A00640
                    *                       EBCDIC DATA IN A1 FORMAT  * W5A00650
                    *                       BACKWARD IN CORE          * W5A00660
                    *               QEB41 - EBCDIC TO 2741 LINE CODE  * W5A00670
                    *                       EBCDIC DATA IN INDEX      * W5A00680
                    *                       FORMAT FORWARD IN CORE    * W5A00690
                    *               F41EB - 2741 LINE CODE TO EBCDIC  * W5A00700
                    *                       EBCDIC DATA IN A1 FORMAT  * W5A00710
                    *                       FORWARD IN CORE           * W5A00720
                    *               B41EB - 2741 LINE CODE TO EBCDIC  * W5A00730
                    *                       EBCDIC DATA IN A1 FORMAT  * W5A00740
                    *                       BACKWARD IN CORE          * W5A00750
                    *               Q41EB - 2741 LINE CODE TO EBCDIC  * W5A00760
                    *                       EBCDIC DATA IN INDEX      * W5A00770
                    *                       FORMAT FORWARD IN CORE    * W5A00780
                    *            * CTRL DETERMINES WHAT LINE CONTROL  * W5A00790
                    *              CHARACTERS ARE ADDED FOR THE       * W5A00800
                    *              CONVERSIONS FROM EBCDIC TO 2741    * W5A00810
                    *              LINE CODE -                        * W5A00820
                    *               0 - NEW LINE AND EOT CHARACTERS   * W5A00830
                    *               1 - NEW LINE CHARACTER ONLY       * W5A00840
                    *               2 - EOT CHARACTER ONLY            * W5A00850
                    *               3 - NONE                          * W5A00860
                    *                                                 * W5A00870
                    *************************************************** W5A00880
                    *                                                   W5A00890
                    *                                                   W5A00900
                          ENT     FEB41                                 W5A00910
                          ENT     BEB41                                 W5A00920
                          ENT     F41EB                                 W5A00930
                          ENT     B41EB                                 W5A00940
                          ENT     QEB41                                 W5A00950
                          ENT     Q41EB                                 W5A00960
                    *                                                   W5A00970
                    *                                                   W5A00980
                    *************************************************** W5A00990
                    *                                                 * W5A01000
                    *     ENTRY AND HOUSEKEEPING                      * W5A01010
                    *                                                 * W5A01020
                    *************************************************** W5A01030
                    *                                                   W5A01040
                    QEB41 DC      *-*       ENTRY POINT                 W5A01050
                          STD     TR901     SAVE ACC & EXT              W5A01060
                          SLA     16                                    W5A01070
                          STO     TR917     RESET FLAG FOR INDEX        W5A01080
                          LD      QEB41     FETCH RETURN ADDRESS        W5A01090
                          B       TR010     BR TO CONTINUE              W5A01100
                    *                                                   W5A01110
                    FEB41 DC      *-*       ENTRY POINT                 W5A01120
                          STD     TR901     SAVE ACC & EXT              W5A01130
                          STX     TR917     SET FLAG FOR FORTRAN        W5A01140
                          LD      FEB41     FETCH RETURN ADDRESS        W5A01150
                    TR010 STO     BEB41     ST IN EXIT ADDR LOCN        W5A01160
                          SLA     16        RESET F/B FLAG TO FWD       W5A01170
                          B       TR020     BR TO CONTINUE HSK          W5A01180
                    *                                                   W5A01190
                    BEB41 DC      *-*                                   W5A01200
                          STD     TR901     SAVE ACC & EXT              W5A01210
                          STX     TR917     SET FLAG FOR FORTRAN        W5A01220
                          LD      TR909     SET F/B FLAG TO BWD         W5A01230
                    *                                                   W5A01240
                    TR020 STO     TR906                                 W5A01250
                          STS  L  TR190     SAVE STATUS                 W5A01260
                          STX  L1 TR200+1   SAVE XR1                    W5A01270
                          STX  L2 TR210+1   SAVE XR2                    W5A01280
                          LDX  I1 BEB41     SET XR1 AS PARAM PT         W5A01290
                    *                                                   W5A01300
                    *                                                   W5A01310
                    *************************************************** W5A01320
                    *                                                 * W5A01330
                    *     TRANSFER PARAMETERS FROM CALL               * W5A01340
                    *            TO SUBROUTINE                        * W5A01350
                    *                                                 * W5A01360
                    *************************************************** W5A01370
                    *                                                   W5A01380
                          LD   I1 0         GET FIRST PARAMETER         W5A01390
                          STO     TR902     *(CONTROL PARAMETER)        W5A01400
                          LD   L1 1         GET SECOND PARAMETER        W5A01410
                          STO     TR903     *(DATA I/P AREA)            W5A01420
                          LD   L1 2         GET THIRD PARAMETER         W5A01430
                          STO     TR900     *(DATA O/P AREA)            W5A01440
                    *                                                   W5A01450
                    TR900 EQU     *+1       DATA O/P AREA ADDRESS       W5A01460
                    *                                                   W5A01470
                          LDX  L2 *-*       SET XR2 AS O/P PT           W5A01480
                          LD   I1 3         GET FOURTH PARAMETER        W5A01490
                          STO     TR904     *(I/P CHARACTER COUNT)      W5A01500
                          LDX  L1 TR998     XR1 AS TRANSL TABLE PT      W5A01510
                    *                                                   W5A01520
                    *                                                   W5A01530
                    *************************************************** W5A01540
                    *                                                 * W5A01550
                    *     INITIALIZE                                  * W5A01560
                    *                                                 * W5A01570
                    *************************************************** W5A01580
                    *                                                   W5A01590
                          SLT     32                                    W5A01600
                          STO     TR905     RESET O/P CHAR COUNT        W5A01610
                          LD      *-1       SET NEGATIVE VALUE IN       W5A01620
                          STO     TR907     *CASE SHIFT FLAG            W5A01630
                          MDX   2 1         INCR DATA O/P POINTER       W5A01640
                    *                                                   W5A01650
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5A01660
                    * TEST FOR NO DATA FOR CONVERSION                 * W5A01670
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5A01680
                    *                                                   W5A01690
                          LD      TR904     IS I/P COUNT POSITIVE       W5A01700
                          BNP     TR130     NO, BR TO CONTROL RTN       W5A01710
                    *                                                   W5A01720
                    *                                                   W5A01730
                    *************************************************** W5A01740
                    *                                                 * W5A01750
                    *     CONVERSION ROUTINE                          * W5A01760
                    *                                                 * W5A01770
                    *************************************************** W5A01780
                    *                                                   W5A01790
                    TR030 LD   I  TR903     FETCH CHAR FOR CONV         W5A01800
                          MDM     TR917,0   SKP IF NOT FORTRAN DATA     W5A01810
                          SRA     8         *AND STORE FOR              W5A01820
                          STO     *+1       *INDEXING TRANSL TABLE      W5A01830
                          LD   L1 *-*       FETCH TRANSLATION           W5A01840
                          SRA     8         EXTRACT RELEVANT HALF       W5A01850
                          EOR     TR909     TEST IF CHAR IS SPACE   212 W5A01852
                          BZ      TR035     BR, YES                 212 W5A01854
                          EOR     TR909     NO, RESTORE CHAR        212 W5A01856
                          SRT     7         TEST CASE SHIFT OF CHAR     W5A01860
                          BNZ     TR040     BR IF CHAR UPPER CASE       W5A01870
                          LD      TR907     TEST CASE SHIFT FLAG        W5A01880
                          BZ      TR090     BR IF IN LOWER CASE         W5A01890
                          SLA     16                                    W5A01900
                          STO     TR907     RESET CASE FLG TO LOWER     W5A01910
                          LD      TR911     FETCH LOWER CASE CHAR       W5A01920
                          B       TR050     BR TO ST CASE & CHAR        W5A01930
                    *                                               212 W5A01931
                    TR035 LD      TR909     RESTORE CHAR            212 W5A01932
                          SRT     7         SHIFT INTO PLACE        212 W5A01934
                          B       TR090     BR TO STORE CHAR IN O/P 212 W5A01936
                    *                                               212 W5A01939
                    *                                                   W5A01940
                    TR040 LD      TR907     TEST CASE SHIFT FLAG        W5A01950
                          BP      TR090     BR IF UPPER CASE            W5A01960
                          STX     TR907     SET CASE FLAG TO UPPER      W5A01970
                          LD      TR912     FETCH UPPER CASE CHAR       W5A01980
                    *                                                   W5A01990
                    *                                                   W5A02000
                    *************************************************** W5A02010
                    *                                                 * W5A02020
                    *     STORE CASE SHIFT CHARACTER                  * W5A02030
                    *         AND DATA CHARACTER                      * W5A02040
                    *                                                 * W5A02050
                    *************************************************** W5A02060
                    *                                                   W5A02070
                    TR050 SRT     8         SAVE CASE & DATA IN EXT     W5A02080
                          LD      TR905     BR IF PREVIOUS CHAR         W5A02090
                          BOD     TR100     *STORED ON LEFT             W5A02100
                          SLT     8         TRANSFER CASE SHIFT         W5A02110
                          SLA     1         *AND DATA CHAR TO ACC       W5A02120
                          SLT     7                                     W5A02130
                          STO   2 0         STORE IN DATA O/P AREA      W5A02140
                          MDX   2 1         INCR DATA O/P POINTER       W5A02150
                          MDM     TR905,2   INCR O/P CHAR CNT BY 2      W5A02160
                    *                                                   W5A02170
                    *                                                   W5A02180
                    *************************************************** W5A02190
                    *                                                 * W5A02200
                    *     ALTER TABLE POINTERS                        * W5A02210
                    *                                                 * W5A02220
                    *************************************************** W5A02230
                    *                                                   W5A02240
                    TR060 LD      TR906     TEST FWD/BWD FLAG           W5A02250
                          BNZ     TR070     BR IF BACKWARD              W5A02260
                          MDM     TR903,1   SET I/P PT TO NEXT CHAR     W5A02270
                          B       TR080     BR TO CONTINUE              W5A02280
                    *                                                   W5A02290
                    TR070 MDM     TR903,-1  SET I/P PT TO NEXT CHAR     W5A02300
                    TR080 MDM     TR904,-1  DECR I/P CHAR COUNT AND     W5A02310
                    *                       *TEST FOR NO MORE CHARS     W5A02320
                          B       TR030     BR TO CONVERT NEXT CHAR     W5A02330
                          B       TR130     BR TO CONTROL ROUTINE       W5A02340
                    *                                                   W5A02350
                    *                                                   W5A02360
                    *************************************************** W5A02370
                    *                                                 * W5A02380
                    *     CONSTANTS AND WORK AREAS FOR                * W5A02390
                    *          FEB41  AND  BEB41                      * W5A02400
                    *                                                 * W5A02410
                    *************************************************** W5A02420
                    *                                                   W5A02430
                    TR901 BSS  E  2         CONTENTS OF ACC & EXT       W5A02440
                    *                                                   W5A02450
                    TR902 DC      *-*       CONTROL PARAMETER           W5A02460
                    *                       0 - ADD NL AND EOT          W5A02470
                    *                       1 - ADD NL ONLY             W5A02480
                    *                       2 - ADD EOT ONLY            W5A02490
                    *                       3 - ADD NOTHING             W5A02500
                    *                       ELSE - AS FOR 0             W5A02510
                    *                                                   W5A02520
                    TR903 DC      *-*       PT TO DATA I/P AREA         W5A02530
                    TR904 DC      *-*       I/P CHARACTER COUNT         W5A02540
                    TR905 DC      *-*       O/P CHARACTER COUNT         W5A02550
                    *                                                   W5A02560
                    TR906 DC      *-*       FWD/BWD FLAG                W5A02570
                    *                       0 - I/P DATA FORWARD        W5A02580
                    *                           IN CORE                 W5A02590
                    *                       1 - I/P DATA BACKWARD       W5A02600
                    *                           IN CORE                 W5A02610
                    *                                                   W5A02620
                    TR907 DC      *-*       CASE SHIFT FLAG             W5A02630
                    *                       POSITIVE - UPPER CASE       W5A02640
                    *                       ZERO     - LOWER CASE       W5A02650
                    *                       NEGATIVE - NEITHER CASE     W5A02660
                    *                                                   W5A02670
                    TR908 DC      *-*       TEMPORARY STORE             W5A02680
                    TR909 DC      1         CONSTANT                    W5A02690
                    TR910 DC      2         CONSTANT                    W5A02700
                    TR911 DC      /007C     LOWER CASE SHIFT CHAR       W5A02710
                    TR912 DC      /001C     UPPER CASE SHIFT CHAR       W5A02720
                    TR913 DC      /005B     NEW LINE CHARACTER          W5A02730
                    TR914 DC      /005E     IDLE CHARACTER              W5A02740
                    TR915 DC      /001F     EOT CHARACTER               W5A02750
                    TR916 DC      /1F5E     EOT & IDLE CHARACTER        W5A02760
                    *                                                   W5A02770
                    TR917 DC      *-*       FORT/INDEX FORMAT FLAG      W5A02780
                    *                       ZERO - INDEX FORMAT         W5A02790
                    *                              I.E.  /00XX          W5A02800
                    *                       ELSE - FORTRAN FORMAT       W5A02810
                    *                              I.E.  /XX40          W5A02820
                    *                                                   W5A02830
                    *                                                   W5A02840
                    *************************************************** W5A02850
                    *                                                 * W5A02860
                    *     CONVERSION ROUTINE  (CONTINUED)             * W5A02870
                    *                                                 * W5A02880
                    *************************************************** W5A02890
                    *                                                   W5A02900
                    TR090 LD      TR905     BR IF PREVIOUS CHAR         W5A02910
                          BOD     TR120     *STORED ON LEFT             W5A02920
                          MDM     TR905,1   INCR O/P CHAR COUNT         W5A02930
                          B       TR110     BR TO SAVE CHAR             W5A02940
                    *                                                   W5A02950
                    TR100 SLA     8         TRANSFER CASE SHIFT         W5A02960
                          SLT     8         *CHAR TO RIGHT OF ACC       W5A02970
                          EOR     TR908     ASSEMBLE PACKED WORD        W5A02980
                          STO   2 0         *AND STORE IN DATA O/P      W5A02990
                          MDX   2 1         INCR DATA O/P POINTER       W5A03000
                          MDM     TR905,2   INCR O/P CHAR CNT BY 2      W5A03010
                    TR110 SLA     1         TRANSFER DATA CHAR TO       W5A03020
                          SLT     15        *LEFT OF ACC AND STORE      W5A03030
                          STO     TR908     *IN TEMPORARY LOCATION      W5A03040
                          B       TR060     BR TO ALTER TABLE PTS       W5A03050
                    *                                                   W5A03060
                    TR120 SLA     9         TRANSFER DATA CHARACTER     W5A03070
                          SLT     7         *TO RIGHT HALF OF ACC       W5A03080
                          EOR     TR908     ASSEMBLE PACKED WORD        W5A03090
                          STO   2 0         *AND STORE IN DATA O/P      W5A03100
                          MDM     TR905,1   INCR O/P CHAR COUNT         W5A03110
                          MDX   2 1         INCR DATA O/P POINTER       W5A03120
                          B       TR060     BR TO ALTER TABLE PTS       W5A03130
                    *                                                   W5A03140
                    *                                                   W5A03150
                    *************************************************** W5A03160
                    *                                                 * W5A03170
                    *     CONTROL ROUTINE                             * W5A03180
                    *                                                 * W5A03190
                    *************************************************** W5A03200
                    *                                                   W5A03210
                    TR130 LD      TR902     FETCH CONTROL PARAMETER     W5A03220
                          S       TR910                                 W5A03230
                          BN      TR140     BR IF NEW LINE REQUIRED     W5A03240
                    *                                                   W5A03250
                          S       TR909     CHECK FOR NONE (3)          W5A03260
                          BNN     TR135     BR IF YES                   W5A03270
                    *                                                   W5A03280
                          LD      TR905     BR IF PREVIOUS CHAR         W5A03290
                          BOD     TR150     *STORED IN LEFT HALF        W5A03300
                          B       TR170     BR IF STORED ON RIGHT       W5A03310
                    *                                                   W5A03320
                    TR135 LD      TR905     BR IF PREVIOUS CHAR         W5A03330
                          BOD     TR137     *STORED IN LEFT HALF        W5A03340
                          B       TR180     BR FOR RIGHT HALF           W5A03350
                    *                                                   W5A03360
                    TR137 LD      TR908     FETCH TEMPORARY CHAR        W5A03370
                          B       TR155     GO STORE IN BUFFER          W5A03380
                    *                                                   W5A03390
                    TR140 LD      TR905     BR IF PREVIOUS CHAR         W5A03400
                          BOD     TR160     *STORED IN LEFT HALF        W5A03410
                          LD      TR913     FETCH NEW LINE CHAR AND     W5A03420
                          SLA     8         *STORE IN LEFT HALF OF      W5A03430
                          STO     TR908     *TEMPORARY LOCATION         W5A03440
                          MDM     TR905,1   INCR O/P CHAR COUNT         W5A03450
                          LD      TR902     FETCH CONTROL PARAMETER     W5A03460
                          S       TR909                                 W5A03470
                          BNZ     TR150     BR IF EOT CHAR REQUIRED     W5A03480
                          LD      TR914     FETCH IDLE CHARACTER        W5A03490
                          B       *+1       SKIP TO CONTINUE            W5A03500
                    TR150 LD      TR915     FETCH EOT CHARACTER         W5A03510
                          EOR     TR908     ASSEMBLE PACKED WORD        W5A03520
                    TR155 STO   2 0         *AND STORE IN DATA O/P      W5A03530
                          MDM     TR905,1   INCR O/P CHAR COUNT         W5A03540
                          B       TR180     BR TO RESTORE ROUTINE       W5A03550
                    *                                                   W5A03560
                    TR160 LD      TR913     FETCH NEW LINE CHAR         W5A03570
                          EOR     TR908     ASSEMBLE PACKED WORD        W5A03580
                          STO   2 0         *AND STORE IN DATA O/P      W5A03590
                          MDM     TR905,1   INCR O/P CHAR COUNT         W5A03600
                          MDX   2 1         INCR DATA O/P POINTER       W5A03610
                          LD      TR902     FETCH CONTROL PARAMETER     W5A03620
                          S       TR909                                 W5A03630
                          BZ      TR180     BR IF EOT NOT REQUIRED      W5A03640
                    *                                                   W5A03650
                    TR170 LD      TR916     FETCH EOT & IDLE CHAR       W5A03660
                          STO   2 0         STORE IN DATA O/P           W5A03670
                          MDM     TR905,2   INCR O/P CHAR CNT BY 2      W5A03680
                    *                                                   W5A03690
                    *                                                   W5A03700
                    *************************************************** W5A03710
                    *                                                 * W5A03720
                    *     RESTORE AND RETURN ROUTINE                  * W5A03730
                    *                                                 * W5A03740
                    *************************************************** W5A03750
                    *                                                   W5A03760
                    TR180 LD      TR905     FETCH O/P CHAR COUNT        W5A03770
                          STO  I  TR900     STORE IN FIRST WORD OF      W5A03780
                    *                       *DATA O/P                   W5A03790
                    TR190 LDS     0         RESTORE STATUS              W5A03800
                    TR200 LDX  L1 *-*       RESTORE XR1                 W5A03810
                    TR210 LDX  L2 *-*       RESTORE XR2                 W5A03820
                          LDD     TR901     RESTORE ACC AND EXT         W5A03830
                    *                                                   W5A03840
                          MDM     BEB41,4   SET PROGRAM RETURN ADDR     W5A03850
                          B    I  BEB41     RETURN TO CALLER            W5A03860
                    *                                                   W5A03870
                    *                                                   W5A03880
                    *************************************************** W5A03890
                    *                                                 * W5A03900
                    *     TRANSLATION TABLE                           * W5A03910
                    *                                                 * W5A03920
                    *************************************************** W5A03930
                    *OPERATION NOTES -                                * W5A03940
                    *   * FOR USE WITH TABLE LOOK-UP TECHNIQUE        * W5A03950
                    *   * TABLE CONTAINS PACKED DATA -                * W5A03960
                    *      * LEFT BYTE CONTAINS 2741 LINE CODE        * W5A03970
                    *        (COMMENTED IN COLS 45 TO 50)             * W5A03980
                    *      * RIGHT BYTE CONTAINS EBCDIC               * W5A03990
                    *        (COMMENTED IN COLS 55 TO 63)             * W5A04000
                    *   * 2741 LINE CODE DATA HAS BIT 0 AS THE        * W5A04010
                    *     CHARACTER CASE SHIFT INDICATOR -            * W5A04020
                    *      0 - LOWER CASE                             * W5A04030
                    *      1 - UPPER CASE                             * W5A04040
                    *     THIS EXTRA BIT IS REMOVED IN THE            * W5A04050
                    *     TRANSLATION ROUTINE.                        * W5A04060
                    *   * TABLE IS DIVIDED INTO TWO PARTS FOR         * W5A04070
                    *     2741 CODE TO EBCDIC TRANSLATION -           * W5A04080
                    *      1ST PART - USED WHEN LOWER CASE CHAR       * W5A04090
                    *                 TRANSLATED                      * W5A04100
                    *      2ND PART - USED WHEN UPPER CASE CHAR       * W5A04110
                    *                 TRANSLATED                      * W5A04120
                    *************************************************** W5A04130
                    *                                                   W5A04140
                    TR998 DC      /01FF     SPACE     BAD DATA  00      W5A04150
                          DC      /0140     SPACE     SPACE     01      W5A04160
                          DC      /01F1     SPACE     1         02      W5A04170
                          DC      /01FF     SPACE     BAD DATA  03      W5A04180
                          DC      /79F2     PF        2         04      W5A04190
                          DC      /7AFF     HT        BAD DATA  05      W5A04200
                          DC      /7CFF     LC        BAD DATA  06      W5A04210
                          DC      /7FF3     DEL       3         07      W5A04220
                          DC      /01F4     SPACE     4         08      W5A04230
                          DC      /01FF     SPACE     BAD DATA  09      W5A04240
                          DC      /01FF     SPACE     BAD DATA  0A      W5A04250
                          DC      /01F5     SPACE     5         0B      W5A04260
                          DC      /01FF     SPACE     BAD DATA  0C      W5A04270
                          DC      /01F6     SPACE     6         0D      W5A04280
                          DC      /01F7     SPACE     7         0E      W5A04290
                          DC      /01FF     SPACE     BAD DATA  0F      W5A04300
                          DC      /01F8     SPACE     8         10      W5A04310
                          DC      /01FF     SPACE     BAD DATA  11      W5A04320
                          DC      /01FF     SPACE     BAD DATA  12      W5A04330
                          DC      /01F9     SPACE     9         13      W5A04340
                          DC      /58FF     RES       BAD DATA  14      W5A04350
                          DC      /5BF0     NL        0         15      W5A04360
                          DC      /5D7B     BS        #         16      W5A04370
                          DC      /5EFF     IDL       BAD DATA  17      W5A04380
                          DC      /01FF     SPACE     BAD DATA  18      W5A04390
                          DC      /0134     SPACE     PN        19      W5A04400
                          DC      /0135     SPACE     RS        1A      W5A04410
                          DC      /01FF     SPACE     BAD DATA  1B      W5A04420
                          DC      /0136     SPACE     UC        1C      W5A04430
                          DC      /01FF     SPACE     BAD DATA  1D      W5A04440
                          DC      /01FF     SPACE     BAD DATA  1E      W5A04450
                          DC      /0137     SPACE     EOT       1F      W5A04460
                          DC      /017C     SPACE     @         20      W5A04470
                          DC      /01FF     SPACE     BAD DATA  21      W5A04480
                          DC      /01FF     SPACE     BAD DATA  22      W5A04490
                          DC      /0161     SPACE     /         23      W5A04500
                          DC      /38FF     BYP       BAD DATA  24      W5A04510
                          DC      /3BA2     LF        S (LC)    25      W5A04520
                          DC      /3DA3     EOB       T (LC)    26      W5A04530
                          DC      /3EFF     PRE       BAD DATA  27      W5A04540
                          DC      /01FF     SPACE     BAD DATA  28      W5A04550
                          DC      /01A4     SPACE     U (LC)    29      W5A04560
                          DC      /01A5     SPACE     V (LC)    2A      W5A04570
                          DC      /01FF     SPACE     BAD DATA  2B      W5A04580
                          DC      /01A6     SPACE     W (LC)    2C      W5A04590
                          DC      /01FF     SPACE     BAD DATA  2D      W5A04600
                          DC      /01FF     SPACE     BAD DATA  2E      W5A04610
                          DC      /01A7     SPACE     X (LC)    2F      W5A04620
                          DC      /01FF     SPACE     BAD DATA  30      W5A04630
                          DC      /01A8     SPACE     Y (LC)    31      W5A04640
                          DC      /01A9     SPACE     Z (LC)    32      W5A04650
                          DC      /01FF     SPACE     BAD DATA  33      W5A04660
                          DC      /19FF     PN        BAD DATA  34      W5A04670
                          DC      /1AFF     RS        BAD DATA  35      W5A04680
                          DC      /1CFF     UC        BAD DATA  36      W5A04690
                          DC      /1F6B     EOT       ,         37      W5A04700
                          DC      /0124     SPACE     BYP       38      W5A04710
                          DC      /01FF     SPACE     BAD DATA  39      W5A04720
                          DC      /01FF     SPACE     BAD DATA  3A      W5A04730
                          DC      /0125     SPACE     LF        3B      W5A04740
                          DC      /01FF     SPACE     BAD DATA  3C      W5A04750
                          DC      /0126     SPACE     EOB       3D      W5A04760
                          DC      /0127     SPACE     PRE       3E      W5A04770
                          DC      /01FF     SPACE     BAD DATA  3F      W5A04780
                          DC      /0160     SPACE     -         40      W5A04790
                          DC      /01FF     SPACE     BAD DATA  41      W5A04800
                          DC      /01FF     SPACE     BAD DATA  42      W5A04810
                          DC      /0191     SPACE     J (LC)    43      W5A04820
                          DC      /01FF     SPACE     BAD DATA  44      W5A04830
                          DC      /0192     SPACE     K (LC)    45      W5A04840
                          DC      /0193     SPACE     L (LC)    46      W5A04850
                          DC      /01FF     SPACE     BAD DATA  47      W5A04860
                          DC      /01FF     SPACE     BAD DATA  48      W5A04870
                          DC      /0194     SPACE     M (LC)    49      W5A04880
                          DC      /A095     CENTS     N (LC)    4A      W5A04890
                          DC      /76FF     .         BAD DATA  4B      W5A04900
                          DC      /8496     <         O (LC)    4C      W5A04910
                          DC      /93FF     (         BAD DATA  4D      W5A04920
                          DC      /E1FF     +         BAD DATA  4E      W5A04930
                          DC      /B797     |         P (LC)    4F      W5A04940
                          DC      /61FF     &         BAD DATA  50      W5A04950
                          DC      /0198     SPACE     Q (LC)    51      W5A04960
                          DC      /0199     SPACE     R (LC)    52      W5A04970
                          DC      /01FF     SPACE     BAD DATA  53      W5A04980
                          DC      /01FF     SPACE     BAD DATA  54      W5A04990
                          DC      /01FF     SPACE     BAD DATA  55      W5A05000
                          DC      /01FF     SPACE     BAD DATA  56      W5A05010
                          DC      /015B     SPACE     $         57      W5A05020
                          DC      /0114     SPACE     RES       58      W5A05030
                          DC      /01FF     SPACE     BAD DATA  59      W5A05040
                          DC      /D7FF     !         BAD DATA  5A      W5A05050
                          DC      /5715     $         NL        5B      W5A05060
                          DC      /90FF     *         BAD DATA  5C      W5A05070
                          DC      /9516     )         BS        5D      W5A05080
                          DC      /8717     ;         IDL       5E      W5A05090
                          DC      /F6FF     ¬         BAD DATA  5F      W5A05100
                          DC      /40FF     -         BAD DATA  60      W5A05110
                          DC      /2350     /         &         61      W5A05120
                          DC      /0181     SPACE     A (LC)    62      W5A05130
                          DC      /01FF     SPACE     BAD DATA  63      W5A05140
                          DC      /0182     SPACE     B (LC)    64      W5A05150
                          DC      /01FF     SPACE     BAD DATA  65      W5A05160
                          DC      /01FF     SPACE     BAD DATA  66      W5A05170
                          DC      /0183     SPACE     C (LC)    67      W5A05180
                          DC      /0184     SPACE     D (LC)    68      W5A05190
                          DC      /01FF     SPACE     BAD DATA  69      W5A05200
                          DC      /01FF     SPACE     BAD DATA  6A      W5A05210
                          DC      /3785     ,         E (LC)    6B      W5A05220
                          DC      /8BFF     %         BAD DATA  6C      W5A05230
                          DC      /C086     _         F (LC)    6D      W5A05240
                          DC      /8E87     >         G (LC)    6E      W5A05250
                          DC      /A3FF     ?         BAD DATA  6F      W5A05260
                          DC      /0188     SPACE     H (LC)    70      W5A05270
                          DC      /01FF     SPACE     BAD DATA  71      W5A05280
                          DC      /01FF     SPACE     BAD DATA  72      W5A05290
                          DC      /0189     SPACE     I (LC)    73      W5A05300
                          DC      /01FF     SPACE     BAD DATA  74      W5A05310
                          DC      /01FF     SPACE     BAD DATA  75      W5A05320
                          DC      /014B     SPACE     .         76      W5A05330
                          DC      /01FF     SPACE     BAD DATA  77      W5A05340
                          DC      /01FF     SPACE     BAD DATA  78      W5A05350
                          DC      /0104     SPACE     PF        79      W5A05360
                          DC      /8805     :         HT        7A      W5A05370
                          DC      /16FF     #         BAD DATA  7B      W5A05380
                          DC      /2006     @         LC        7C      W5A05390
                          DC      /8DFF     '         BAD DATA  7D      W5A05400
                          DC      /82FF     =         BAD DATA  7E      W5A05410
                          DC      /9607     "         DEL       7F      W5A05420
                    TR999 DC      /01FF     SPACE     BAD DATA  80      W5A05430
                          DC      /6240     A (LC)    SPACE     81      W5A05440
                          DC      /647E     B (LC)    =         82      W5A05450
                          DC      /67FF     C (LC)    BAD DATA  83      W5A05460
                          DC      /684C     D (LC)    <         84      W5A05470
                          DC      /6BFF     E (LC)    BAD DATA  85      W5A05480
                          DC      /6DFF     F (LC)    BAD DATA  86      W5A05490
                          DC      /6E5E     G (LC)    ;         87      W5A05500
                          DC      /707A     H (LC)    :         88      W5A05510
                          DC      /73FF     I (LC)    BAD DATA  89      W5A05520
                          DC      /01FF     SPACE     BAD DATA  8A      W5A05530
                          DC      /016C     SPACE     %         8B      W5A05540
                          DC      /01FF     SPACE     BAD DATA  8C      W5A05550
                          DC      /017D     SPACE     '         8D      W5A05560
                          DC      /016E     SPACE     >         8E      W5A05570
                          DC      /01FF     SPACE     BAD DATA  8F      W5A05580
                          DC      /015C     SPACE     *         90      W5A05590
                          DC      /43FF     J (LC)    BAD DATA  91      W5A05600
                          DC      /45FF     K (LC)    BAD DATA  92      W5A05610
                          DC      /464D     L (LC)    (         93      W5A05620
                          DC      /49FF     M (LC)    BAD DATA  94      W5A05630
                          DC      /4A5D     N (LC)    )         95      W5A05640
                          DC      /4C7F     O (LC)    "         96      W5A05650
                          DC      /4FFF     P (LC)    BAD DATA  97      W5A05660
                          DC      /51FF     Q (LC)    BAD DATA  98      W5A05670
                          DC      /5234     R (LC)    PN        99      W5A05680
                          DC      /0135     SPACE     RS        9A      W5A05690
                          DC      /01FF     SPACE     BAD DATA  9B      W5A05700
                          DC      /0136     SPACE     UC        9C      W5A05710
                          DC      /01FF     SPACE     BAD DATA  9D      W5A05720
                          DC      /01FF     SPACE     BAD DATA  9E      W5A05730
                          DC      /0137     SPACE     EOT       9F      W5A05740
                          DC      /014A     SPACE     CENTS     A0      W5A05750
                          DC      /01FF     SPACE     BAD DATA  A1      W5A05760
                          DC      /25FF     S (LC)    BAD DATA  A2      W5A05770
                          DC      /266F     T (LC)    ?         A3      W5A05780
                          DC      /29FF     U (LC)    BAD DATA  A4      W5A05790
                          DC      /2AE2     V (LC)    S (UC)    A5      W5A05800
                          DC      /2CE3     W (LC)    T (UC)    A6      W5A05810
                          DC      /2FFF     X (LC)    BAD DATA  A7      W5A05820
                          DC      /31FF     Y (LC)    BAD DATA  A8      W5A05830
                          DC      /32E4     Z (LC)    U (UC)    A9      W5A05840
                          DC      /01E5     SPACE     V (UC)    AA      W5A05850
                          DC      /01FF     SPACE     BAD DATA  AB      W5A05860
                          DC      /01E6     SPACE     W (UC)    AC      W5A05870
                          DC      /01FF     SPACE     BAD DATA  AD      W5A05880
                          DC      /01FF     SPACE     BAD DATA  AE      W5A05890
                          DC      /01E7     SPACE     X (UC)    AF      W5A05900
                          DC      /01FF     SPACE     BAD DATA  B0      W5A05910
                          DC      /01E8     SPACE     Y (UC)    B1      W5A05920
                          DC      /01E9     SPACE     Z (UC)    B2      W5A05930
                          DC      /01FF     SPACE     BAD DATA  B3      W5A05940
                          DC      /01FF     SPACE     BAD DATA  B4      W5A05950
                          DC      /01FF     SPACE     BAD DATA  B5      W5A05960
                          DC      /01FF     SPACE     BAD DATA  B6      W5A05970
                          DC      /014F     SPACE     |         B7      W5A05980
                          DC      /0124     SPACE     BYP       B8      W5A05990
                          DC      /01FF     SPACE     BAD DATA  B9      W5A06000
                          DC      /01FF     SPACE     BAD DATA  BA      W5A06010
                          DC      /0125     SPACE     LF        BB      W5A06020
                          DC      /01FF     SPACE     BAD DATA  BC      W5A06030
                          DC      /0126     SPACE     EOB       BD      W5A06040
                          DC      /0127     SPACE     PRE       BE      W5A06050
                          DC      /01FF     SPACE     BAD DATA  BF      W5A06060
                          DC      /156D     0         _         C0      W5A06070
                          DC      /E2FF     A (UC)    BAD DATA  C1      W5A06080
                          DC      /E4FF     B (UC)    BAD DATA  C2      W5A06090
                          DC      /E7D1     C (UC)    J (UC)    C3      W5A06100
                          DC      /E8FF     D (UC)    BAD DATA  C4      W5A06110
                          DC      /EBD2     E (UC)    K (UC)    C5      W5A06120
                          DC      /EDD3     F (UC)    L (UC)    C6      W5A06130
                          DC      /EEFF     G (UC)    BAD DATA  C7      W5A06140
                          DC      /F0FF     H (UC)    BAD DATA  C8      W5A06150
                          DC      /F3D4     I (UC)    M (UC)    C9      W5A06160
                          DC      /01D5     SPACE     N (UC)    CA      W5A06170
                          DC      /01FF     SPACE     BAD DATA  CB      W5A06180
                          DC      /01D6     SPACE     O (UC)    CC      W5A06190
                          DC      /01FF     SPACE     BAD DATA  CD      W5A06200
                          DC      /01FF     SPACE     BAD DATA  CE      W5A06210
                          DC      /01D7     SPACE     P (UC)    CF      W5A06220
                          DC      /15FF     0         BAD DATA  D0      W5A06230
                          DC      /C3D8     J (UC)    Q (UC)    D1      W5A06240
                          DC      /C5D9     K (UC)    R (UC)    D2      W5A06250
                          DC      /C6FF     L (UC)    BAD DATA  D3      W5A06260
                          DC      /C9FF     M (UC)    BAD DATA  D4      W5A06270
                          DC      /CAFF     N (UC)    BAD DATA  D5      W5A06280
                          DC      /CCFF     O (UC)    BAD DATA  D6      W5A06290
                          DC      /CF5A     P (UC)    !         D7      W5A06300
                          DC      /D114     Q (UC)    RES       D8      W5A06310
                          DC      /D2FF     R (UC)    BAD DATA  D9      W5A06320
                          DC      /01FF     SPACE     BAD DATA  DA      W5A06330
                          DC      /0115     SPACE     NL        DB      W5A06340
                          DC      /01FF     SPACE     BAD DATA  DC      W5A06350
                          DC      /0116     SPACE     BS        DD      W5A06360
                          DC      /0117     SPACE     IDL       DE      W5A06370
                          DC      /01FF     SPACE     BAD DATA  DF      W5A06380
                          DC      /01FF     SPACE     BAD DATA  E0      W5A06390
                          DC      /014E     SPACE     +         E1      W5A06400
                          DC      /A5C1     S (UC)    A (UC)    E2      W5A06410
                          DC      /A6FF     T (UC)    BAD DATA  E3      W5A06420
                          DC      /A9C2     U (UC)    B (UC)    E4      W5A06430
                          DC      /AAFF     V (UC)    BAD DATA  E5      W5A06440
                          DC      /ACFF     W (UC)    BAD DATA  E6      W5A06450
                          DC      /AFC3     X (UC)    C (UC)    E7      W5A06460
                          DC      /B1C4     Y (UC)    D (UC)    E8      W5A06470
                          DC      /B2FF     Z (UC)    BAD DATA  E9      W5A06480
                          DC      /01FF     SPACE     BAD DATA  EA      W5A06490
                          DC      /01C5     SPACE     E (UC)    EB      W5A06500
                          DC      /01FF     SPACE     BAD DATA  EC      W5A06510
                          DC      /01C6     SPACE     F (UC)    ED      W5A06520
                          DC      /01C7     SPACE     G (UC)    EE      W5A06530
                          DC      /01FF     SPACE     BAD DATA  EF      W5A06540
                          DC      /15C8     0         H (UC)    F0      W5A06550
                          DC      /02FF     1         BAD DATA  F1      W5A06560
                          DC      /04FF     2         BAD DATA  F2      W5A06570
                          DC      /07C9     3         I (UC)    F3      W5A06580
                          DC      /08FF     4         BAD DATA  F4      W5A06590
                          DC      /0BFF     5         BAD DATA  F5      W5A06600
                          DC      /0D5F     6         ¬         F6      W5A06610
                          DC      /0EFF     7         BAD DATA  F7      W5A06620
                          DC      /10FF     8         BAD DATA  F8      W5A06630
                          DC      /1304     9         PF        F9      W5A06640
                          DC      /0105     SPACE     HT        FA      W5A06650
                          DC      /01FF     SPACE     BAD DATA  FB      W5A06660
                          DC      /0106     SPACE     LC        FC      W5A06670
                          DC      /01FF     SPACE     BAD DATA  FD      W5A06680
                          DC      /01FF     SPACE     BAD DATA  FE      W5A06690
                          DC      /0107     SPACE     DEL       FF      W5A06700
                    *                                                   W5A06710
                    *                                                   W5A06720
                    *************************************************** W5A06730
                    *                                                 * W5A06740
                    *     ENTRY AND HOUSEKEEPING                      * W5A06750
                    *                                                 * W5A06760
                    *************************************************** W5A06770
                    *                                                   W5A06780
                    Q41EB DC      *-*       ENTRY POINT                 W5A06790
                          STD     TR920     SAVE ACC & EXT              W5A06800
                          STX     TR921     SET FLAG FOR INDEX          W5A06810
                          LD      Q41EB     FETCH RETURN ADDRESS        W5A06820
                          B       TR220     BR TO CONTINUE              W5A06830
                    *                                                   W5A06840
                    F41EB DC      *-*       ENTRY POINT                 W5A06850
                          STD     TR920     SAVE ACC & EXT              W5A06860
                          SLA     16                                    W5A06870
                          STO     TR921     RESET FLAG FOR FORTRAN      W5A06880
                          LD      F41EB     FETCH RETURN ADDRESS        W5A06890
                    TR220 STO     B41EB     ST IN EXIT ADDR LOCN        W5A06900
                          SLA     16        RESET F/B FLAG TO FWD       W5A06910
                          B       TR230     BR TO CONTINUE HSK          W5A06920
                    *                                                   W5A06930
                    B41EB DC      *-*       ENTRY POINT                 W5A06940
                          STD     TR920     SAVE ACC & EXT              W5A06950
                          SLA     16                                    W5A06960
                          STO     TR921     RESET FLAG FOR FORTRAN      W5A06970
                          LD      TR929     SET F/B FLAG TO BWD         W5A06980
                    TR230 STO     TR926                                 W5A06990
                          STS     TR380     SAVE STATUS                 W5A07000
                          STX   1 TR390+1   SAVE XR1                    W5A07010
                          STX   2 TR400+1   SAVE XR2                    W5A07020
                          LDX  I1 B41EB     SET XR1 AS PARAM PT         W5A07030
                    *                                                   W5A07040
                    *                                                   W5A07050
                    *************************************************** W5A07060
                    *                                                 * W5A07070
                    *     TRANSFER PARAMETERS FROM CALL               * W5A07080
                    *            TO SUBROUTINE                        * W5A07090
                    *                                                 * W5A07100
                    *************************************************** W5A07110
                    *                                                   W5A07120
                    TR240 LD    1 1         GET SECOND PARAMETER        W5A07130
                          STO     *+1       *(DATA I/P AREA)            W5A07140
                          LDX  L2 *-*       SET XR2 AS I/P PT           W5A07150
                          LD    1 2         GET THIRD PARAMETER         W5A07160
                          STO     TR922     *(DATA O/P AREA)            W5A07170
                          LD    1 3         GET FOURTH PARAMETER        W5A07180
                          STO     TR923     *(ADDR FOR O/P COUNT)       W5A07190
                    *                                                   W5A07200
                    *                                                   W5A07210
                    *************************************************** W5A07220
                    *                                                 * W5A07230
                    *     INITIALIZE                                  * W5A07240
                    *                                                 * W5A07250
                    *************************************************** W5A07260
                    *                                                   W5A07270
                          SLT     32                                    W5A07280
                          STO     TR927     RESET CASE SHIFT TO LC      W5A07290
                          STO     TR925     RESET O/P CHAR COUNT        W5A07300
                          LD    2 0         FETCH I/P CHAR COUNT        W5A07310
                          STO     TR924     *AND STORE                  W5A07320
                          MDX   2 1         INCR DATA I/P POINTER       W5A07330
                    *                                                   W5A07340
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5A07350
                    * TEST FOR NO DATA FOR CONVERSION                 * W5A07360
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5A07370
                    *                                                   W5A07380
                          LD      TR924     IS I/P COUNT POSITIVE       W5A07390
                          BNP     TR370     NO, BR TO RESTORE RTN       W5A07400
                    *                                                   W5A07410
                    *                                                   W5A07420
                    *************************************************** W5A07430
                    *                                                 * W5A07440
                    *     CONVERSION ROUTINE                          * W5A07450
                    *                                                 * W5A07460
                    *************************************************** W5A07470
                    *                                                   W5A07480
                    TR250 LD      TR929                                 W5A07490
                          STO     TR928     SET SIDE FLAG               W5A07500
                          LD    2 0         FETCH WORD FOR TRANSL       W5A07510
                          SRT     8         SAVE 2ND CHAR IN EXT        W5A07520
                    TR260 EOR     TR932     UPPER CASE CONTROL CHAR     W5A07530
                          BNZ     TR270     *NO, BR TO CONTINUE         W5A07540
                          LD      TR929                                 W5A07550
                          STO     TR927     SET CASE SHIFT FLAG         W5A07560
                          B       TR340     BR TO CONTINUE              W5A07570
                    *                                                   W5A07580
                    TR270 EOR     TR932     RESTORE CHARACTER           W5A07590
                          EOR     TR931     LOWER CASE CONTROL CHAR     W5A07600
                          BNZ     TR280     *NO, BR TO CONTINUE         W5A07610
                          STO     TR927     RESET CASE SHIFT FLAG       W5A07620
                          B       TR340     BR TO CONTINUE              W5A07630
                    *                                                   W5A07640
                    TR280 EOR     TR931     RESTORE CHARACTER           W5A07650
                          STO     *+1       STORE IN XR1 AS INDEX       W5A07660
                          LDX  L1 *-*                                   W5A07670
                          LD      TR927     TEST CASE SHIFT FLAG        W5A07680
                          BNZ     TR290     BR IF IN UPPER CASE         W5A07690
                          LD   L1 TR998     FETCH TRANSLATION           W5A07700
                          B       TR300     BR TO CONTINUE              W5A07710
                    *                                                   W5A07720
                    *                                                   W5A07730
                    *************************************************** W5A07740
                    *                                                 * W5A07750
                    *     CONSTANTS AND WORK AREAS FOR                * W5A07760
                    *          F41EB  AND  B41EB                      * W5A07770
                    *                                                 * W5A07780
                    *************************************************** W5A07790
                    *                                                   W5A07800
                    TR920 BSS  E  2         CONTENTS OF ACC & EXT       W5A07810
                    *                                                   W5A07820
                    TR921 DC      *-*       FORT/INDEX FORMAT FLAG      W5A07830
                    *                       ZERO - FORTRAN FORMAT       W5A07840
                    *                              I.E.  /XX40          W5A07850
                    *                       ELSE - INDEX FORMAT         W5A07860
                    *                              I.E.  /00XX          W5A07870
                    *                                                   W5A07880
                    TR922 DC      *-*       DATA O/P AREA ADDRESS       W5A07890
                    TR923 DC      *-*       O/P CHAR COUNT ADDRESS      W5A07900
                    TR924 DC      *-*       I/P CHARACTER COUNT         W5A07910
                    TR925 DC      *-*       O/P CHARACTER COUNT         W5A07920
                    *                                                   W5A07930
                    TR926 DC      *-*       FWD/BWD FLAG                W5A07940
                    *                       0 - O/P DATA FORWARD        W5A07950
                    *                           IN CORE                 W5A07960
                    *                       1 - O/P DATA BACKWARD       W5A07970
                    *                           IN CORE                 W5A07980
                    *                                                   W5A07990
                    TR927 DC      *-*       CASE SHIFT FLAG             W5A08000
                    *                       ZERO - LOWER CASE           W5A08010
                    *                       ELSE - UPPER CASE           W5A08020
                    *                                                   W5A08030
                    TR928 DC      *-*       SIDE FLAG                   W5A08040
                    *                       0 - LAST CHAR ON RIGHT      W5A08050
                    *                       1 - LAST CHAR ON LEFT       W5A08060
                    *                                                   W5A08070
                    TR929 DC      1         CONSTANT                    W5A08080
                    TR930 DC      /0040     FILL IN CHAR A1 FORMAT      W5A08090
                    TR931 DC      /007C     LOWER CASE CHARACTER        W5A08100
                    TR932 DC      /001C     UPPER CASE CHARACTER        W5A08110
                    *                                                   W5A08120
                    *                                                   W5A08130
                    *************************************************** W5A08140
                    *                                                 * W5A08150
                    *     CONVERSION ROUTINE  (CONTINUED)             * W5A08160
                    *                                                 * W5A08170
                    *************************************************** W5A08180
                    *                                                   W5A08190
                    TR290 LD   L1 TR999     FETCH TRANSLATION           W5A08200
                    TR300 SLA     8         SELECT CORRECT PART         W5A08210
                          EOR     TR930     PACK IN A1 FORMAT           W5A08220
                          MDM     TR921,0   SKIP IF FORTRAN             W5A08230
                          SRA     8         PUT IN INDEX FORMAT         W5A08240
                          STO  I  TR922     *STORE IN DATA O/P          W5A08250
                    TR310 MDM     TR926,0   TEST FWD/BWD FLAG           W5A08260
                          B       TR320     BR IF BACKWARD              W5A08270
                          MDM     TR922,1   INCR DATA O/P POINTER       W5A08280
                          B       TR330     BR TO CONTINUE              W5A08290
                    *                                                   W5A08300
                    TR320 MDM     TR922,-1  DECR DATA O/P POINTER       W5A08310
                    *                                                   W5A08320
                    TR330 MDM     TR925,1   INCR DATA O/P COUNT         W5A08330
                    TR340 MDM     TR924,-1  DECR I/P CHAR COUNT AND     W5A08340
                    *                       *TEST FOR NO MORE CHARS     W5A08350
                          B       TR350     BR TO CONTINUE              W5A08360
                          B       TR370     BR TO RESTORE               W5A08370
                    *                                                   W5A08380
                    TR350 LD      TR928     TEST SIDE FLAG              W5A08390
                          BNZ     TR360     BR IF SET                   W5A08400
                          MDX   2 1         INCR DATA I/P POINTER       W5A08410
                          B       TR250     BR TO FETCH NEXT WORD       W5A08420
                    *                                                   W5A08430
                    TR360 SLA     16                                    W5A08440
                          STO     TR928     RESET SIDE FLAG             W5A08450
                          SLT     8         SHIFT 2ND HALF OF I/P       W5A08460
                    *                       *WORD INTO ACC              W5A08470
                          B       TR260     BR TO TEST CHAR             W5A08480
                    *                                                   W5A08490
                    *                                                   W5A08500
                    *************************************************** W5A08510
                    *                                                 * W5A08520
                    *     RESTORE AND RETURN ROUTINE                  * W5A08530
                    *                                                 * W5A08540
                    *************************************************** W5A08550
                    *                                                   W5A08560
                    TR370 LD      TR925     FETCH O/P CHAR COUNT        W5A08570
                          STO  I  TR923     STORE IN COUNT ADDRESS      W5A08580
                    TR380 LDS     0         RESTORE STATUS              W5A08590
                    TR390 LDX  L1 *-*       RESTORE XR1                 W5A08600
                    TR400 LDX  L2 *-*       RESTORE XR2                 W5A08610
                          LDD     TR920     RESTORE ACC AND EXT         W5A08620
                          MDM     B41EB,4   SET PROGRAM RETURN ADDR     W5A08630
                          B    I  B41EB     RETURN TO CALLER            W5A08640
                    *                                                   W5A08650
                    *                                                   W5A08660
                          END                                           W5A08670
