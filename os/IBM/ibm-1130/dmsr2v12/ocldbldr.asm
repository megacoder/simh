                          ABS                                           OCB00010
                    *                                                   OCB00020
                    * EQUIVALENCES FOR THE RESIDENT MONITOR             OCB00030
                    *                                                   OCB00040
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 OCB00050
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  OCB00060
                    $CLSW EQU     /18  CORE IMAGE  LADER SW             OCB00070
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) OCB00080
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  OCB00090
                    $GCOM EQU     /63  GRAPHICS CORE LOAD INDICATOR     OCB00100
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  OCB00110
                    $DCDE EQU     /77  LOGICAL DRIVE NO. OF PROGRAM     OCB00120
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   OCB00130
                    $FPAD EQU     /95  ADDR OF WORKING STORAGE,LOG DR 0 OCB00140
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   OCB00150
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   OCB00160
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   OCB00170
                    $I405 EQU     /D3                                   OCB00180
                    $LEV1 EQU     9    ADDR OF LEVEL 1 INTERRUPT WORD   OCB00190
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   OCB00200
                    $NEND EQU     /3A2 1+ADDR OF LAST WORD OF DISKN     OCB00210
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEC OCB00220
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY OCB00230
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   OCB00240
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       OCB00250
                    $UFDR EQU     /7D  DRIVE CODE FOR UFIO AREA         OCB00260
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     OCB00270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       OCB00280
                    $ZEND EQU     /1E0 1+ADDR OF LAST WORD OF DISKZ     OCB00290
                    $1END EQU     /294 1+ADDR OF LAST WORD OF DISK1     OCB00300
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       OCB00310
                    DZ000 EQU     /F2  ENTRY PT TO DISKZ,DISK1,DISKN    OCB00320
                    *                                                   OCB00330
                    * EQUIVALENCES FOR LOCAL/SOCAL FLIPPER (FLIPR)      OCB00340
                    *                                                   OCB00350
                    FL010 EQU     1    ADDR OF LIBF ENTRY POINT (LOCAL) OCB00360
                    FL020 EQU     9    ADDR OF CALL ENTRY POINT (LOCAL) OCB00370
                    FL200 EQU     /33  ADDR OF FUNCTION SUBR ENTRY PT   OCB00380
                    FL210 EQU     /3A  ADDR OF ARITHMETIC SUBR ENTRY PT OCB00390
                    FL220 EQU     /3D  ADDR OF SOCAL 2 ENTRY POINT      OCB00400
                    FL230 EQU     /40  ADDR OF SOCAL 3 ENTRY POINT      OCB00410
                    FL350 EQU     /4D  ADDR OF SOCAL INPUT AREA (SOCAR) OCB00420
                    FL380 EQU     /50  ADDR OF DUMMY TV ENTRY FOR SOC 1 OCB00430
                    FL900 EQU     /5A  ADDR OF SOCAL1 SCTR ADDR,WD CNT  OCB00440
                    FL915 EQU     /61  ADDR OF SPECIAL MDX INSTRUCTION  OCB00450
                    FL998 EQU     /64  ADDR OF LOCAL INPUT AREA (LOCAR) OCB00460
                    *                                                   OCB00470
                    * EQUIVALENCES FOR PHASE ID NOS.                    OCB00480
                    *                                                   OCB00490
                    @DU17 EQU     17   ID NO. FOR DUP, PHASE 17         OCB00500
                    @CLB0 EQU     120  ID NO. FOR CORE LOAD BLDR,PH 0/1 OCB00510
                    @CLB2 EQU     121  ID NO. FOR CORE LOAD BLDR, PH 2  OCB00520
                    @CLB3 EQU     122  ID NO. FOR CORE LOAD BLDR, PH 3  OCB00530
                    @CLB4 EQU     123  ID NO. FOR CORE LOAD BLDR, PH 4  OCB00540
                    @CLB5 EQU     124  ID NO. FOR CORE LOAD BLDR, PH 5  OCB00550
                    @CLB6 EQU     125  ID NO. FOR CORE LOAD BLDR, PH 6  OCB00560
                    @CLB7 EQU     126  ID NO. FOR CORE LOAD BLDR, PH 6  OCB00570
                    @CLB8 EQU     127  ID NO. FOR CORE LOAD BLDR, PH 8  OCB00580
                    @CLB9 EQU     128  ID NO. FOR CORE LOAD BLDR, PH 9  OCB00590
                    @CLBA EQU     129  ID NO. FOR CORE LOAD BLDR, PH 10 OCB00600
                    @CLBB EQU     130  ID NO. FOR CORE LOAD BLDR, PH 11 OCB00610
                    @CLBC EQU     131  ID NO. FOR CORE LOAD BLDR, PH 12 OCB00620
                    @CLBD EQU     132  ID FOR CLB PH 13             2G2 OCB00630
                    @PRNT EQU     153  ID NO. FOR PRINC PRINT SUBR      OCB00640
                    @CIL2 EQU     161  ID NO. FOR CORE IMAGE LDR, PH 2  OCB00650
                    *                                                   OCB00660
                    * EQUIVALENCES FOR MESSAGE NOS.                     OCB00670
                    *                                                   OCB00680
                    MSG00 EQU     0                                     OCB00690
                    MSG01 EQU     1                                     OCB00700
                    MSG02 EQU     2                                     OCB00710
                    MSG03 EQU     3                                     OCB00720
                    MSG04 EQU     4                                     OCB00730
                    MSG05 EQU     5                                     OCB00740
                    MSG06 EQU     6                                     OCB00750
                    MSG07 EQU     7                                     OCB00760
                    MSG08 EQU     8                                     OCB00770
                    MSG09 EQU     9                                     OCB00780
                    MSG10 EQU     10                                    OCB00790
                    MSG16 EQU     16                                    OCB00800
                    MSG17 EQU     17                                    OCB00810
                    MSG18 EQU     18                                    OCB00820
                    MSG19 EQU     19                                    OCB00830
                    MSG20 EQU     20                                    OCB00840
                    MSG21 EQU     21                                    OCB00850
                    MSG22 EQU     22                                    OCB00860
                    MSG23 EQU     23                                    OCB00870
                    MSG24 EQU     24                                    OCB00880
                    MSG25 EQU     25                                    OCB00890
                    MSG26 EQU     26                                    OCB00900
                    MSG37 EQU     37                                    OCB00910
                    MSG39 EQU     39                                    OCB00920
                    MSG40 EQU     40                                    OCB00930
                    MSG41 EQU     41                                    OCB00940
                    MSG42 EQU     42                                    OCB00950
                    MSG43 EQU     43                                    OCB00960
                    MSG44 EQU     44                                    OCB00970
                    MSG45 EQU     45                                    OCB00980
                    MSG46 EQU     46                                    OCB00990
                    MSG47 EQU     47                                    OCB01000
                    MSG48 EQU     48                                2-6 OCB01010
                    MSG64 EQU     64                                    OCB01020
                    MSG65 EQU     65                                    OCB01030
                    MSG66 EQU     66                                    OCB01040
                    MSG67 EQU     67                                    OCB01050
                    MSG68 EQU     68                                    OCB01060
                    *                                                   OCB01070
                    * EQUIVALENCES FOR THE LOAD TABLE                   OCB01080
                    *                                                   OCB01090
                    @WRD1 EQU     0    RELATIVE ADDR OF 1ST WD LD TBL   OCB01100
                    @WRD2 EQU     1    RELATIVE ADDR OF 2ND WD LD TBL   OCB01110
                    @WRD3 EQU     2    RELATIVE ADDR OF 3RD WD LD TBL   OCB01120
                    @WRD4 EQU     3    RELATIVE ADDR OF 4TH WD LD TBL   OCB01130
                    @LTEN EQU     4    LENGTH OF A LOAD TABLE ENTRY     OCB01140
                    *                                                   OCB01150
                    * EQUIVALENCES FOR THE DEFINE FILE TABLE            OCB01160
                    *                                                   OCB01170
                    @FLNR EQU     0    RELATIVE ADDR OF FILE NO.        OCB01180
                    @RCCT EQU     1    RELATIVE ADDR OF RECORD COUNT    OCB01190
                    @WDRC EQU     2    RELATIVE ADDR OF WORDS/RECORD    OCB01200
                    @ASOC EQU     3    RELATIVE ADDR OF ASSOC VARIABLE  OCB01210
                    @SCAD EQU     4    RELATIVE ADDR OF SECTOR ADDR     OCB01220
                    @RCSC EQU     5    RELATIVE ADDR OF RECORDS/SECTOR  OCB01230
                    @BCNT EQU     6    RELATIVE ADDR OF BLOCK COUNT     OCB01240
                    @DFEN EQU     7    LENGTH OF A DEFINE FILE TBL ENT  OCB01250
                    *                                                   OCB01260
                    * EQUIVALENCES FOR THE *FILES EQUATE TABLE          OCB01270
                    *                                                   OCB01280
                    @EQEN EQU     4    WD CNT OF AN ENTRY               OCB01290
                    @EQNO EQU     0    RELATIVE ADDR OF FILE NO.        OCB01300
                    @EQNM EQU     1    RELATIVE ADDR OF FILE NAME       OCB01310
                    @EQID EQU     3    RELATIVE ADDR OF CARTRIDGE ID    OCB01320
                    *                                                   OCB01330
                    * MISCELLANEOUS EQIVALENCES                         OCB01340
                    *                                                   OCB01350
                    @EQLM EQU     25   MAX NO. EQUATES PERMITTED    2-8 OCB01360
                    @EETY EQU     4    NO. WDS PER EQUATE           2-4 OCB01370
                    @MXLB EQU     85   MAX NO. ENTRIES IN LIBF TV       OCB01380
                    @MXEP EQU     14   MAX NO. ENTRY PTS ALLOWED        OCB01390
                    @DBSC EQU     16   NO. DISK BLOCKS PER SECTOR       OCB01400
                    @MXDR EQU     5    MAX NO. DISK DRIVES SUPPORTED    OCB01410
                    @LFEN EQU     3    WD CNT OF A LET/FLET ENTRY       OCB01420
                    @LBEN EQU     3    WD CNT OF A LIBF TV ENTRY        OCB01430
                    @CLEN EQU     1    WD CNT OF A CALL TV ENTRY        OCB01440
                    @COMZ EQU     896  LOW COMMON LIMIT, DISKZ          OCB01450
                    @COM1 EQU     1216 LOW COMMON LIMIT, DISK1          OCB01460
                    @COM2 EQU     1536 LOW COMMON LIMIT, DISKN          OCB01470
                    @DCOM EQU     1    SCTR CONTAINING DCOM             OCB01480
                    @HDNG EQU     7    SCTR ADDR OF PAGE HEADING        OCB01490
                    @ISTV EQU     51   ISS NO. ADJUSTMENT FACTOR    2-1 OCB01500
                    @DFOF EQU     4    OFFSET TO *FILES TABLE           OCB01510
                    @SCIB EQU     16   NO. SECTORS IN THE CIB           OCB01520
                    @HCIB EQU     3    NO. SECTORS IN HIGH COMMON   2-2 OCB01530
                    @FLEN EQU     5    WD CNT OF LIBF FLIPPER TBL ENTRY OCB01540
                    @FCEN EQU     6    WD CNT OF CALL FLIPPER TBL ENTRY OCB01550
                    @DKEP EQU     DZ000+7 LIBF ENTRY PT TO DISK1/DISKN  OCB01560
                    @MCOR EQU     4096 SIZE OF MINIMIMUM CORE SUPPO 2-2 OCB01570
                    @LOAD EQU     0    RLTV ADDR OF LOCALS IN SCRA  2-4 OCB01580
                    @NOAD EQU     2    RLTV ADDR OF NOCALS IN SCRA  2-4 OCB01590
                    @FIAD EQU     4    RLTV ADDR OF FILES  IN SCRA  2-4 OCB01600
                    @GRAD EQU     6    RLTV ADDR OF G2250  IN SCRA  2-4 OCB01610
                    @EQAD EQU     7    RLTV ADDR OF EQUAT  IN SCRA  2-4 OCB01620
                    *                                                   OCB01630
                    * EQUIVALENCES FOR LET/FLET                         OCB01640
                    *                                                   OCB01650
                    @LFHD EQU     5    WORD COUNT OF LET/FLET HEADER    OCB01660
                    @SCTN EQU     0    LET/FLET SECTOR NO.              OCB01670
                    @UAFX EQU     1    SCTR ADDR OF USER/FIXED AREA     OCB01680
                    @WDSA EQU     3    NO. WDS IN LET/FLET SECTOR       OCB01690
                    @NEXT EQU     4    ADDR OF NEXT LET/FLET SECTOR     OCB01700
                    @LFNM EQU     0    NAME OF LET/FLET ENTRY           OCB01710
                    @BLCT EQU     2    DISK BLOCK CNT OF LET/FLET ENTRY OCB01720
                    *                                                   OCB01730
                    * EQUIVALENCES FOR THE PROGRAM HEADER RECORD        OCB01740
                    *                                                   OCB01750
                    @ZERO EQU     0    RELATIVE ADDR OF 1ST WD PROG HDR OCB01760
                    @TYPE EQU     2    RELATIVE ADDR OF PROG TYPE       OCB01770
                    @PREC EQU     2    REL ATIVE ADDR OF PRECISION      OCB01780
                    @WDCT EQU     3    REL ATIVE ADDR OF EFFECTIVE LNG  OCB01790
                    @COMN EQU     4    RELATIVE ADDR OF COMMON WD CNT   OCB01800
                    @LHDR EQU     5    RELATIVE ADDR FOR HDR WD CNT - 9 OCB01810
                    @DBCT EQU     7    RELATIVE ADDR FOR PROG DB CNT    OCB01820
                    @FILS EQU     8    RELATIVE ADDR FOR NO. FILES      OCB01830
                    @FORT EQU     8    RELATIVE ADDR FOR FOR/ASM INDR   OCB01840
                    @NAME EQU     9    RELATIVE ADDR FOR ENTRY PT NAME  OCB01850
                    @ENTY EQU     11   RELATIVE ADDR FOR RELATIVE ENTRY OCB01860
                    @ISSP EQU     12   RELATIVE ADDR OF ISS NO. + @ISTV OCB01870
                    @ISSN EQU     13   RELATIVE ADDR OF ISS NO.         OCB01880
                    @NILS EQU     14   RELATIVE ADDR OF NO. LEVELS      OCB01890
                    @ILN1 EQU     15   RELATIVE ADDR OF 1ST LEVEL NO.   OCB01900
                    *                                                   OCB01910
                    * EQUIVALENCES FOR DCOM                             OCB01920
                    *                                                   OCB01930
                    #FCNT EQU     7    *FILES COUNT--ZERO=NO *FILES REC OCB01940
                    #CBSW EQU     10   CORE LOAD BUILDER SWITCH         OCB01950
                    #LCNT EQU     11   LOCAL COUNT                      OCB01960
                    #MPSW EQU     12   CORE MAP SWITCH                  OCB01970
                    #NCNT EQU     15   NOCAL COUNT                      OCB01980
                    #GRPH EQU     29   2250 INDICATOR               2-8 OCB01990
                    #GCNT EQU     30   NO. G2250 RECORDS            2-8 OCB02000
                    #LOSW EQU     31   LOCALS CALL LOCALS SWITCH    2-2 OCB02010
                    #X3SW EQU     32   SPECIAL ILS SWITCH           2-2 OCB02020
                    #ECNT EQU     33   1+NO. WDS IN EQUATE TABLE    2-4 OCB02030
                    #CIDN EQU     55   CARTRIDGE ID FOR LOGICAL DR 0    OCB02040
                    #SCRA EQU     65   ADDR OF 1ST SCTR OF SCRA         OCB02050
                    #FMAT EQU     70   FORMAT OF WS PROG INDICATOR      OCB02060
                    #WSCT EQU     85   BLOCK CNT OF PROG IN WS          OCB02070
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB02080
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB02090
                    *                                                   OCB02100
                          ORG     $ZEND                                 OCB02110
                          DC      P1END-*-1 WD CNT OF PHASE             OCB02120
                          DC      -@CLB0    ID NO. OF PHASE             OCB02130
                          DC      LK910-*+1 ADDR OF SLET EXTRACT        OCB02140
                          DC      15        NO.ENTRIES IN SLET EXTR.2G2 OCB02150
                          ORG     *-2                                   OCB02160
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB02170
                    *************************************************** OCB02180
                    *                                                 * OCB02190
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * OCB02200
                    *                                                 * OCB02210
                    *FUNCTION/OPERATION-                              * OCB02220
                    *   * PHASE 0 ALWAYS REMAINS IN CORE. IT CONSISTS * OCB02230
                    *     OF TWO SECTIONS                             * OCB02240
                    *     * BASIC SUBROUTINES NEEDED BY OTHER PHASES  * OCB02250
                    *     * CONSTANTS SHARED BY SUBROUTINES, RCOM     * OCB02260
                    *                                                 * OCB02270
                    *ENTRY POINTS-                                    * OCB02280
                    *   * PM000-THIS SUBROUTINE HAS TWO ENTRY POINTS  * OCB02290
                    *     * ENTRY FOR ERROR MESSAGES                  * OCB02300
                    *             BSI  L  PM000                       * OCB02310
                    *     * ENTRY FOR CHECK MAP SWITCH                * OCB02320
                    *             BSI  L  PM300                       * OCB02330
                    *   * ALL OTHER SUBROUTINES HAVE ONLY ONE ENTRY   * OCB02340
                    *     POINT                                       * OCB02350
                    *             BSI  L  XX000                       * OCB02360
                    *     WHERE XX000 IS THE FIRST EXECUTABLE INSTRUC-* OCB02370
                    *     TION IN THE SUBROUTINE                      * OCB02380
                    *                                                 * OCB02390
                    *INPUT-N/A                                        * OCB02400
                    *                                                 * OCB02410
                    *OUTPUT-N/A                                       * OCB02420
                    *                                                 * OCB02430
                    *EXTERNAL REFERENCES-                             * OCB02440
                    *   * SUBROUTINES-N/A                             * OCB02450
                    *   * COMMA/DCOM                                  * OCB02460
                    *     * $CLSW                                     * OCB02470
                    *     * $DBSY                                     * OCB02480
                    *     * $DREQ                                     * OCB02490
                    *     * $HASH                                     * OCB02500
                    *     * $NDUP                                     * OCB02510
                    *     * $PHSE                                     * OCB02520
                    *     * $ULET                                     * OCB02530
                    *                                                 * OCB02540
                    *EXITS-                                           * OCB02550
                    *   * NORMAL-                                     * OCB02560
                    *     * BACK TO CALLER INDIRECTLY VIA ENTRY POINT * OCB02570
                    *   * ERROR-                                      * OCB02580
                    *     * TO TL000 FOR PRINTING MESSAGE(S) AND OUT  * OCB02590
                    *                                                 * OCB02600
                    *TABLES/WORK AREAS-                               * OCB02610
                    *   * RCOM                                        * OCB02620
                    *   * LOAD TABLE                                  * OCB02630
                    *   * ISS TABLE                                2-8* OCB02640
                    *   * EQUATE TABLE                             2-8* OCB02650
                    *                                                 * OCB02660
                    *NOTES-N/A                                        * OCB02670
                    *************************************************** OCB02680
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB02690
                          BSI  L  IN000     ENTRY POINT TO CLB          OCB02700
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB02710
                    * SUBROUTINE FOR FINDING A PROGRAM IN LET/FLET      OCB02720
                    *                                                   OCB02730
                    LS000 DC      *-*       ENTRY POINT                 OCB02740
                          STX   1 LS380+1   SAVE XR1                    OCB02750
                          STX   2 LS380+3   SAVE XR2                    OCB02760
                          LDD   3 NAME                                  OCB02770
                          SLT     2         MASK OUT FLAG BITS          OCB02780
                          STD   3 RNAME     SAVE NAME OF PROG SOUGHT    OCB02790
                          SRA     16                                    OCB02800
                          STO     LS900     *ACCUMULATOR                OCB02810
                          LD    3 K8000     INITIALIZE SW 11 TO INDI-   OCB02820
                          STO   3 LSW11     *CATE SEARCHING LET         OCB02830
                          LDX   2 -@MXDR-1  1+NO. DRIVES TO XR2         OCB02840
                          MDX  I2 IGNOR+X3                              OCB02850
                    LS230 LDX  L1 BUFLS     ADDR OF LET SEARCH BUFFER   OCB02860
                          LD   L2 $ULET+@MXDR+1 SAVE LET SCTR ADDR      OCB02870
                          STO   1 1         *FOR CURRENT CARTRIDGE      OCB02880
                          MDX   2 +1        SKIP IF ALL CARTS SEARCHED, OCB02890
                          MDX     LS270     *BRANCH OTHERWISE           OCB02900
                    *                                                   OCB02910
                    * PROGRAM SOUGHT IS NOT IN LET OR FLET              OCB02920
                    *                                                   OCB02930
                    LS240 LD    3 LSW23     CHECK FOR EQUAT         212 OCB02940
                          BSC  L  LS250,Z   DON'T PRINT MSG IF EQUAT212 OCB02950
                          LDX   2 MSG16     BRANCH                  212 OCB02960
                          BSI  L  TL000     *TO PRINT ERROR MESSAGE     OCB02970
                    LS250 STX   0 LS925     SET MATCH = PRIMARY     212 OCB03000
                          LD    3 KFF0F     SET LET/FLET INDR = THIS212 OCB03010
                          STO   3 LSW22     *PROGRAM NOT FOUND      212 OCB03020
                          MDX     LS380     RETURN                  212 OCB03030
                    *                                                   OCB03040
                    * PREPARE TO SEARCH LET AND FLET ON CURR CARTRIDGE  OCB03050
                    *                                                   OCB03060
                    LS270 BSC     +-        SKIP UNLESS CARTRIDGE NOT   OCB03070
                          MDX     LS240     *DEFINED FOR CURRENT JOB    OCB03080
                    *                                                   OCB03090
                    * INITIALIZE TO START LET/FLET SEARCH               OCB03100
                    *                                                   OCB03110
                    LS280 LD    3 LSBUF     ADDRS OF LET SEARCH BUFFER  OCB03120
                          SRT     16        *STORED IN EXTENSION        OCB03130
                          BSI  L  GP000     FETCH 1 SCTR OF LET/FLET    OCB03140
                          LD    1 1         FETCH CURR LET SCTR ADDR    OCB03150
                          AND   3 KF000     'AND' OUT ALL BUT DRIVE COD OCB03160
                          STO   3 DRCDE     STORE DRIVE CODE            OCB03170
                          OR    1 @NEXT+2   'OR' IN NEXT SECTOR ADDR    OCB03180
                          STO   1 1         STORE SCTR ADDR W/ DR CODE  OCB03190
                          LD      LS900                                 OCB03200
                          STO   3 BYADR                                 OCB03210
                          LD    1 @SCTN+2   FETCH LET/FLET SCTR NO.     OCB03220
                          BSC     +-        SKIP IF NOT 1ST SCTR,       OCB03230
                          MDX     LS290     *BRANCH OTHERWISE           OCB03240
                          S       LS905                                 OCB03250
                          BSC     Z+        SKIP IF SEARCHING FLET,     OCB03260
                          MDX     LS300     *BR IF SEARCHING LET        OCB03270
                          STO   3 LSW11     SET SW 11 TO INDICATE FLET  OCB03280
                          BSC     Z         SKIP IF 1ST FLET SECTOR,    OCB03290
                          MDX     LS300     *BRANCH OTHERWISE           OCB03300
                    LS290 LD    1 @UAFX+2   INITIALIZE BLK ADDR ACCUM   OCB03310
                          SLA     4         *TO ADDR OF 1ST PROG STORED OCB03320
                          STO     LS900     *IN LET/FLET                OCB03330
                          STO   3 BYADR     INITIALIZE ADDR ACCUMULATOR OCB03340
                    LS300 LD      LS915     COMPUTE AND STORE NO. WDS   OCB03350
                          S     1 @WDSA+2   *IN CURRENT LET/FLET SCTR   OCB03360
                          STO     LS920                                 OCB03370
                    *                                                   OCB03380
                    * START SEARCHING LET/FLET                          OCB03390
                    *                                                   OCB03400
                    LS320 LD    1 @BLCT+@LFHD+2 SAVE BLOCK COUNT OF     OCB03410
                          STO     LS925     *CURRENT LET/FLET ENTRY     OCB03420
                          BSC     Z         SKIP IF SECONDARY ENTRY PT  OCB03430
                          STO   3 LDBCT     SAVE PRIMARY DISK BLOCK CNT OCB03440
                          LD    1 @LFNM+1+@LFHD+2                       OCB03450
                          SRT     16        SAVE NAME OF LET/FLET ENTRY OCB03460
                          LD    1 @LFNM+@LFHD+2  *CURRENTLY COMPARED    OCB03470
                          STO   3 LSW12     SET LET/FLET ENTRY SWITCH   OCB03480
                          SLT     2         MASK OUT FLAG BITS          OCB03490
                          STD   3 NAME2     COMPARE NAME IN LET/FLET    OCB03500
                          SD    3 RNAME     *W/ NAME SOUGHT             OCB03510
                          BSC     +-        SKIP IF 1ST WDS DON'T MATCH OCB03520
                          RTE     16                                    OCB03530
                          BSC  L  LS400,Z   BR IF 2ND WDS DO NOT MATCH  OCB03540
                          LD    1 @LFNM+@LFHD+2 FETCH 1ST WD OF NAME    OCB03550
                          SRA     15        ZERO TO LSW18 IF PROG IN    OCB03560
                          STO     LS930     *DSF, 1 OTHERWISE           OCB03570
                          LD    3 LSW06                                 OCB03580
                          BSC     +-        SKIP UNLESS THE MATCH WAS   OCB03590
                          MDX     LS360     *WITH THE NAME OF DATA FILE OCB03600
                          LD    3 LSW15                                 OCB03610
                          EOR     LS930                                 OCB03620
                          BSC     +-        SKIP IF WRONG FORMAT,       OCB03630
                          MDX     LS360     *BRANCH OTHERWISE           OCB03640
                    *                                                   OCB03650
                    * LOOKING FOR A DSF PROGRAM AND FOUND A CORE IMAGE  OCB03660
                    * PROGRAM/DATA FILE OR VICE VERSA                   OCB03670
                    *                                                   OCB03680
                          LDX   2 MSG66                                 OCB03690
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXIT   OCB03700
                    *                                                   OCB03710
                    * CONTINUE AFTER FINDING A PROGRAM IN LET OR FLET   OCB03720
                    *                                                   OCB03730
                    LS360 STX  L1 XR1LS+X3  SAVE POINTER FOR LS BUFFER  OCB03740
                          LDD  I  CURTV+X3  RESTORE NAME OF SUBROUTINE  OCB03750
                          SLT     2         *CURRENTLY BEING RELOCATED  OCB03760
                          STD   3 RNAME                                 OCB03770
                          LD      LS925                                 OCB03780
                          BSC  L  LS450,+-  BR IF MATCH WAS SECONDARY   OCB03790
                    LS380 LDX  L1 *-*       RESTORE XR1                 OCB03800
                          LDX  L2 *-*       RESTORE XR2                 OCB03810
                          SLA     16        CLEAR EQUAT INDR        212 OCB03813
                          STO   3 LSW23     *                       212 OCB03817
                          LD    3 LSW22     ACC=LET/FLET INDR       212 OCB03820
                          BSC  I  LS000     RETURN                      OCB03830
                    *                                                   OCB03840
                    * PREPARE TO CONTINUE SEARCHING                     OCB03850
                    *                                                   OCB03860
                    LS400 LD    3 BYADR                                 OCB03870
                          A       LS925                                 OCB03880
                          STO   3 BYADR     ACCUMULATE THE BLOCK ADDR   OCB03890
                          MDX   1 @LFEN     POINT TO NEXT LET/FLET ENT  OCB03900
                          MDX  L  LS920,-@LFEN SKIP WHEN SCTR SEARCHED, OCB03910
                          MDX     LS320     *BRANCH OTHERWISE           OCB03920
                    *                                                   OCB03930
                    * PREPARE TO FETCH NEXT LET/FLET SECTOR             OCB03940
                    *                                                   OCB03950
                          LDX  L1 BUFLS     ADDR LET SEARCH BUFFER      OCB03960
                          LD    3 BYADR     SAVE CURRENT ACCUMULATED    OCB03970
                          STO     LS900     *BLOCK ADDRESS              OCB03980
                          LD    1 @NEXT+2                               OCB03990
                          BSC     Z         SKIP IF LAST LET/FLET SCTR  OCB04000
                          MDX     LS280     *ON CURR CART,BR OTHERWISE  OCB04010
                          MDX     LS230     BR TO SEARCH ANOTHER CART   OCB04020
                    LS450 LD    3 BYADR     ADJUST PROGRAM BLOCK ADDR   OCB04030
                          S     3 LDBCT     *BECAUSE MATCH WAS TO A     OCB04040
                          STO   3 BYADR     *SECONDARY ENTRY PT AND     OCB04050
                          MDX     LS380     *BYADR POINTED TO NEXT PROG OCB04060
                    *                                                   OCB04070
                    * CONSTANTS AND WORK AREAS                          OCB04080
                    *                                                   OCB04090
                    LS900 DC      *-*  BLK ADDR 1ST PROG IN CURR SCTR   OCB04100
                    LS905 DC      16   NO. OF 1ST SCTR IN FLET          OCB04110
                    LS915 DC      320-@LFHD NO. WDS PER LET/FLET SCTR   OCB04120
                    LS920 DC      *-*  NO. WDS LEFT FOR COMPARISON      OCB04130
                    LS925 DC      *-*  BLK CNT OF CURRENT LET ENTRY     OCB04140
                    LS930 DC      *-*  DSF SWITCH                       OCB04150
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB04160
                    * READ THE HEADER RECORD INTO THE DATA BUFFER       OCB04170
                    *                                                   OCB04180
                    *                                                   OCB04190
                    RH000 DC      *-*       ENTRY POINT                 OCB04200
                          LD    3 LOBUF                                 OCB04210
                          STO   3 BUFFR                                 OCB04220
                          LD    3 CIBLM     SET INDEX TO FORCE A RD 2-2 OCB04230
                          STO   3 INDEX                                 OCB04240
                          LD    3 K0        ZERO TO COUNT OF NO. WORDS  OCB04250
                          STO   3 LSW14                                 OCB04260
                          BSI  L  NW000     READ HEADER+PART OF PROGRAM OCB04270
                          BSC  I  RH000     RETURN                      OCB04280
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB04290
                    * FETCH THE NEXT DATA WD IN SEQUENCE FROM DATA      OCB04300
                    * BUFFER, READING IN A NEW SECTOR IF NECESSARY      OCB04310
                    *                                                   OCB04320
                    *                                                   OCB04330
                    NW000 DC      *-*       ENTRY POINT                 OCB04340
                          STX   2 NW015+1   SAVE XR2                    OCB04350
                          LDX  I2 INDEX+X3  POINT XR2 AT DATA BFR WD    OCB04360
                          MDX   2 1         POINT TO NEXT WORD          OCB04370
                    NW010 STX  L2 INDEX+X3                              OCB04380
                          LD    3 INDEX                                 OCB04390
                          S     3 LOBUF                                 OCB04400
                          S     3 K320                                  OCB04410
                          S     3 K2                                    OCB04420
                          BSC  L  NW020,-   BR IF BUFFER EXHAUSTED      OCB04430
                          LD    2 0         LOAD NEXT WD IN DATA BUFFER OCB04440
                    NW015 LDX  L2 *-*       RESTORE XR2                 OCB04450
                          BSC  I  NW000     RETURN                      OCB04460
                    *                                                   OCB04470
                    * FETCH A NEW BUFFER WORD                           OCB04480
                    *                                                   OCB04490
                    NW020 LDX  I2 BUFFR+X3  POINT XR2 AT 1ST WORD IN    OCB04500
                          MDX   2 2         *DATA BUFFER                OCB04510
                          LD    3 LSW14     BRANCH IF BLOCK ADDR IS TO  OCB04520
                          BSC  L  NW025,+-  *BE FETCHED FROM BYADR      OCB04530
                          LD    3 NEXT      FETCH BLOCK ADDR            OCB04540
                          SRA     4         SHIFT OUT BLOCK NO.         OCB04550
                          SLA     4                                     OCB04560
                          A     3 K16       COMPUTE NEXT SECTOR ADDR    OCB04570
                          MDX     NW025+1                               OCB04580
                    NW025 LD    3 BYADR     FETCH BLOCK ADDR            OCB04590
                          STO   3 NEXT                                  OCB04600
                          AND   3 BLCKS     COMPUTE NO. WORDS IN SECTOR OCB04610
                          M     3 K20       *WHICH PRECEDE DESIRED WD   OCB04620
                          RTE     16                                    OCB04630
                          STO     NW910                                 OCB04640
                          LD    3 NEXT      COMPUTE AND STORE THE       OCB04650
                          SRA     4         *SECTOR ADDRESS             OCB04660
                          OR    3 LDCDE                                 OCB04670
                          S     3 SADDR     BRANCH IF DESIRED SECT0R IS OCB04680
                          BSC  L  NW050,+-  *ALREADY IN THE DATA BUFFER OCB04690
                          A     3 SADDR                                 OCB04700
                          STO   3 SADDR                                 OCB04710
                          STO   2 -1                                    OCB04720
                          LD    3 BUFFR                                 OCB04730
                          SRT     16                                    OCB04740
                          BSI  L  GP000     READ 1 SCTR INTO DATA BFR   OCB04750
                    NW050 MDX  I2 NW910     POINT XR2 AT DESIRED WD     OCB04760
                          LD    3 K1                                    OCB04770
                          STO   3 LSW14     SET DATA BUFFER SWITCH      OCB04780
                          MDX     NW010     BR TO FETCH DATA WORD       OCB04790
                    *                                                   OCB04800
                    * CONSTANTS AND WORK AREAS                          OCB04810
                    *                                                   OCB04820
                    NW910 DC      0    NO. OF WDS. PRECEDING DATA       OCB04830
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB04840
                    * COMPARE A SUBROUTINE NAME WITH NAMES OF DISK I/O  OCB04850
                    *                                                   OCB04860
                    CN000 DC      *-*       ENTRY POINT                 OCB04870
                          STX   1 CN120+1   SAVE XR1                    OCB04880
                          LDX   1 CN900-CN915                           OCB04890
                          LD      CN900                                 OCB04900
                          S     3 NAME      BR IF NAME BEING CHECKED    OCB04910
                          BSC  L  CN100,Z   *NOT THAT OF DISK I/O SUBR  OCB04920
                    CN050 LD   L1 CN900+4                               OCB04930
                          S     3 NAME+1    BR IF NAME BEING COMPARED   OCB04940
                          BSC  L  CN150,+-  *IS THAT OF DISK I/O SUBR   OCB04950
                          MDX   1 1         SKIP WHEN ALL NAMES CHECKED OCB04960
                          MDX     CN050     *BR OTHERWISE               OCB04970
                    CN100 SRA     16        CLEAR LSW18                 OCB04980
                    CN110 STO   3 LSW18                                 OCB04990
                    CN120 LDX  L1 *-*       RESTORE XR1                 OCB05000
                          BSC  I  CN000     RETURN                      OCB05010
                    CN150 LD   L1 CN920+3   FETCH SETTING FOR $DREQ     OCB05020
                          STO   3 LDREQ                                 OCB05030
                          LD      CN900+3   FETCH 2ND WORD OF #DISKN#   OCB05040
                          MDX   1 1         SKIP IF DISKN CALLED        OCB05050
                          LD      CN900+2   FETCH 2ND WORD OF #DISK1#   OCB05060
                          STO   3 NAME+1                                OCB05070
                          LD      CN935     DK I/O ENTRY POINT TO LSW18 OCB05080
                          MDX     CN110     BR TO SET LSW18             OCB05090
                    *                                                   OCB05100
                    * CONSTANTS AND WORK AREAS                          OCB05110
                    *                                                   OCB05120
                    CN900 DN      DISK0                                 OCB05130
                          DC      /24B1 2ND 16 BITS OF 'DISK1'          OCB05140
                    CN915 DC      /2495 2ND 16 BITS OF 'DISKN'          OCB05150
                    CN920 DC      0    'DISK0' SETTING FOR $DREQ        OCB05160
                          DC      0    'DISK1' SETTING FOR $DREQ        OCB05170
                          DC      +1   'DISKN' SETTING FOR $DREQ        OCB05180
                    CN935 DC      @DKEP LIBF ENTRY PT TO DISK1, DISKN   OCB05190
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB05200
                    * ENTER A PROGRAM IN THE LOAD TABLE IF IT IS        OCB05210
                    * NOT ALREADY THERE                                 OCB05220
                    *                                                   OCB05230
                    BT000 DC      *-*       ENTRY POINT                 OCB05240
                          STX  L1 BT360+1   SAVE XR1                    OCB05250
                          STX  L2 BT360+3   SAVE XR2                    OCB05260
                    *                                                   OCB05270
                    * INITIALIZE                                        OCB05280
                    *                                                   OCB05290
                          LD    3 K0                                    OCB05300
                          STO     BT930                                 OCB05310
                          STO     BT940                                 OCB05320
                          STO   3 ITVCT     CLEAR CALL TV COUNTER       OCB05330
                          LDD   3 NAME                                  OCB05340
                          SLT     2                                     OCB05350
                          STD   3 NAME2     SAVE NAME TO BE ADDED       OCB05360
                          STD   3 RNAME     *TO THE LOAD TABLE          OCB05370
                          BSI  L  CN000     CHECK NAME WITH DKI/O NAME  OCB05380
                          LD    3 LSW18     BR IF NAME IS NOT THAT OF   OCB05390
                          BSC  L  BT020,+-  *A DISK I/O SUBR            OCB05400
                          STO     BT930                                 OCB05410
                          LD   L  $DREQ     BR IF NAME IN LIBF STATE-   OCB05420
                          S     3 LDREQ     *MENT INCONSISTENT WITH     OCB05430
                          BSC  L  BT540,Z   *DISK REQUESTED ON XEQ RECD OCB05440
                    BT020 LDX   1 127-@LBEN-2 INITIALIZE DISPLACEMENT   OCB05450
                          STX  L1 DISPL+X3  *BE USED IN BSI TO TV       OCB05460
                          LDX  I1 RIGHT+X3  RT LIMIT OF LD TBL TO XR1   OCB05470
                          LD    3 LBATV                                 OCB05480
                          BSC  L  BT150,+-  BR IF NO ENT IN LOAD TABLE  OCB05490
                    *                                                   OCB05500
                    * FIND OUT IF NAME TO BE ADDED ALREADY IN LOAD TBL  OCB05510
                    *                                                   OCB05520
                          LDX  I2 LBATV+X3                              OCB05530
                    BT060 LD    1 @WRD1     BR IF TABLE ENTRY CURRENT-  OCB05540
                          SLA     1         *LY BEING COMPARED IS A     OCB05550
                          BSC  L  BT420,Z+  *CALL ENTRY                 OCB05560
                          LD    3 DISPL     COMPUTE 8-BIT DIS -         OCB05570
                          S       BT900     *PLACEMENT FOR CURRENT      OCB05580
                          AND   3 K00FF     *LIBF ENTRY                 OCB05590
                          STO   3 DISPL                                 OCB05600
                    BT090 LD    1 @WRD2     BR IF 2ND WORD OF TBL ENTRY OCB05610
                          S     3 NAME+1    *NOT EQUAL TO 2ND WORD OF   OCB05620
                          BSC  L  BT120,Z   *NAME OF PROG TO BE ADDED   OCB05630
                          LD    1 @WRD1                                 OCB05640
                          S     3 NAME                                  OCB05650
                          STO     BT920                                 OCB05660
                          SLA     2         BRANCH IF CORRESPONDING     OCB05670
                          BSC  L  BT210,+-  *1ST WORDS ARE EQUAL        OCB05680
                    BT120 MDX   1 -@LTEN    POINT TO NEXT LOAD TBL ENT  OCB05690
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB05700
                          MDX     BT060     BACK TO TEST NEXT TBL ENTRY OCB05710
                    *                                                   OCB05720
                    * ADD A NAME TO LOAD TABLE, IF POSSIBLE             OCB05730
                    *                                                   OCB05740
                    BT150 LD    3 LEFTX                                 OCB05750
                          S     3 ENDRL     BRANCH IF NO ROOM TO ADD    OCB05760
                          BSC  L  BT480,+   *ANOTHER ENTRY TO LOAD TBL  OCB05770
                          LD    3 NAME                                  OCB05780
                          SLA     1         BRANCH IF NAME TO BE ADDED  OCB05790
                          BSC  L  BT510,Z+  *IS THAT OF A CALL          OCB05800
                          LD    3 DISPL                                 OCB05810
                          S       BT900     COMPUTE 8-BIT DISPLACEMENT  OCB05820
                          AND   3 K00FF     *FOR LIBF ENTRY WHICH       OCB05830
                          STO   3 DISPL     *IS TO BE ADDED NOW         OCB05840
                          LD    3 LTVWC                                 OCB05850
                          S       BT950     BR IF THERE ARE ALREADY 84  OCB05860
                          BSC  L  BT570,+-  *LIBF ENTRIES IN LOAD TABLE OCB05870
                          MDX  L  LTVWC+X3,@LBEN ACCUMULATE LIBF TV LNG OCB05880
                          LD    3 RLCOR     DECR AVAILABLE CORE CNT BY  OCB05890
                          S       BT900     *TO ACCOUNT FOR A LIBF      OCB05900
                    BT180 STO   3 RLCOR                                 OCB05910
                          LDD   3 NAME      ENTER THE NAME OF THE       OCB05920
                          STD   1 @WRD1     *CALL/LIBF IN LOAD TABLE    OCB05930
                          LD      BT930     ZERO/DISK ENT TO 3RD WD ENT OCB05940
                          STO   1 @WRD3     *NOW BEING ADDED            OCB05950
                          LD    3 K0                                    OCB05960
                          OR    3 LSW16     'OR' IN LOCAL INDICATOR AND OCB05970
                          STO   1 @WRD4     *STORE RESULT IN 4TH WORD   OCB05980
                          MDX  L  LBATV+X3,@LTEN ACCUM LOAD TABLE LNG   OCB05990
                          MDX  L  INCRE+X3,@LTEN ACCUM LENGTH ADDED     OCB06000
                          LD    3 LEFTX     DECREMENT ADDRESS OF LEFT   OCB06010
                          S       BT910     *LIMIT OF LOAD TABLE        OCB06020
                          STO   3 LEFTX                                 OCB06030
                          MDX     BT270     BR TO CHECK 2ND PASS SW     OCB06040
                    *                                                   OCB06050
                    * CONSTANTS AND WORKING STORAGE                     OCB06060
                    *                                                   OCB06070
                    BT900 DC      @LBEN     WD CNT OF A LIBF TV ENTRY   OCB06080
                    BT910 DC      @LTEN     WD CNT OF LOAD TABLE ENTRY  OCB06090
                    BT920 DC      *-*       FLAG BITS FORM SUBR NAME    OCB06100
                    BT930 DC      *-*       INITIAL SETTING FOR WD 3    OCB06110
                    BT940 DC      *-*       SOCAL TV POINTER            OCB06120
                    BT950 DC      @MXLB*@LBEN-2*@LBEN MAX LIBF TV @WCNT OCB06130
                    BT960 DC      @CLEN     WD CNT OF A CALL TV ENTRY   OCB06140
                    BT970 DC      *-*       NO OF CALLS PROCESSED   2-8 OCB06150
                    *                                                   OCB06160
                    *                                                   OCB06170
                    *                                                   OCB06180
                    *                                                   OCB06190
                    * DETERMINE WHETHER OR NOT CURRENT LOAD TABLE       OCB06200
                    * ENTRY IS A LOCAL CALLED BY A LOCAL                OCB06210
                    *                                                   OCB06220
                    BT210 STX  L1 WASTE+X3  SAVE ADDR OF CURR TBL ENTRY OCB06230
                          LD    3 LSW16     BR UNLESS CURRENT           OCB06240
                          BSC  L  BT240,+-  *ENTRY CALLED BY A LOCAL    OCB06250
                          LD    1 @WRD1                                 OCB06260
                          MDX  L  LLOSW+X3,0 SKIP IF LOC CANT CALLLL2-2 OCB06270
                          MDX     *+2       *LOCALS, BR OTHERWISE   2-2 OCB06280
                          BSC  L  BT600,+Z  BR IF CURRENT ENTRY A LOCAL OCB06290
                    * 3 INSTRUCTIONS REMOVED                       2-11 OCB06300
                    *                                                   OCB06310
                    * DETERMINE WHETHER OR NOT CURRENT ENTRY HAS BEEN   OCB06320
                    * REFERENCED PROPERLY                               OCB06330
                    *                                                   OCB06340
                    BT240 LD      BT920                                 OCB06350
                          SLA     1                                     OCB06360
                          SRA     1         BRANCH UNLESS CURRENT ENTRY OCB06370
                          BSC  L  BT270,+-  *WAS IMPROPERLY REFERENCED  OCB06380
                          LDX   2 MSG64                                 OCB06390
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXIT   OCB06400
                    *                                                   OCB06410
                    * PREPARE TO RETURN TO CALLER                       OCB06420
                    *                                                   OCB06430
                    BT270 LD    3 LSW17                                 OCB06440
                          BSC  L  BT390,Z   BRANCH DURING 2ND PASS      OCB06450
                    BT300 LD    3 CALTV     COMPUTE AND STORE ADDR OF   OCB06460
                          S     3 ITVCT     *CALL TV ENTRY IN CASE      OCB06470
                          A     3 K7        *A CALL IS BEING PROCESSED  OCB06480
                    BT330 STO   3 TVPTR                                 OCB06490
                          LD      BT970     SET ITVCT TO NUMBER OF  2-8 OCB06500
                          STO   3 ITVCT     *CALLS PROCESSED SO FAR 2-8 OCB06510
                    BT360 LDX  L1 *-*       RESTORE XR1                 OCB06520
                          LDX  L2 *-*       RESTORE XR2                 OCB06530
                          BSC  I  BT000     RETURN                      OCB06540
                    *                                                   OCB06550
                    * COMPUTE ADDR OF SOCAL TV ENTRY                    OCB06560
                    * IN CASE A CALL IS BEING PROCESSED                 OCB06570
                    *                                                   OCB06580
                    BT390 LD    1 @WRD1                                 OCB06590
                          BSC  L  BT300,+Z  BR IF CURRENT ENTRY A LOCAL OCB06600
                          LD    1 @WRD4                                 OCB06610
                          BSC  L  BT300,+-  BR IF CURR ENTRY AN IN-CORE OCB06620
                          LD    3 SOCAR                                 OCB06630
                          A       BT940                                 OCB06640
                          S       BT960                                 OCB06650
                          MDX     BT330     TO EXIT                     OCB06660
                    *                                                   OCB06670
                    * ACCUMULATE SOCAL TV LENGTH AND/OR CALL TV LENGTH  OCB06680
                    *                                                   OCB06690
                    BT420 LD    1 @WRD1                                 OCB06700
                          BSC  L  BT450,+Z  BR IF CURRENT ENTRY A LOCAL OCB06710
                          LD    1 @WRD4                                 OCB06720
                          BSC  L  BT450,+-  BR IF CURR ENTRY AN IN-CORE OCB06730
                          LD    3 LSW17                                 OCB06740
                          BSC  L  BT450,+-  BRANCH DURING 1ST PASS      OCB06750
                          MDX  L  BT940,@CLEN TALLY 1 SOCAL TV ENTRY    OCB06760
                          MDX     BT090     BACK TO FINISH COMPARE      OCB06770
                    BT450 MDX  L  ITVCT+X3,@CLEN ACCUM IN-CORE CALL TV  OCB06780
                          MDX     BT090     BACK TO FINISH COMPARE      OCB06790
                    *                                                   OCB06800
                    * LOAD TABLE IS ALREADY FULL                        OCB06810
                    *                                                   OCB06820
                    BT480 LDX   2 MSG07     LOAD TABLE TOO LONG         OCB06830
                          BSI  L  TL000     PRINT MESSAGE R07 AND EXIT  OCB06840
                    BT510 LD    3 ITVCT     ACCUMULATE NUMBER OF    2-8 OCB06850
                          A     3 K1        *CALLS AND SAVE         2-8 OCB06860
                          STO   3 ITVCT     *NEW MAXIMUM            2-8 OCB06870
                          STO     BT970     *VALUE                  2-8 OCB06880
                          LD    3 RLCOR     DECREMENT AVAILBLE CORE 2-8 OCB06890
                          S     3 K1        *COUNT BY 1 FOR A CALL  2-8 OCB06900
                          MDX     BT180     BACK TO ENTER NAME IN TBL   OCB06910
                    *                                                   OCB06920
                    * CONTINUE CONSISTENCY CHECK OF DISK I/O LIBF       OCB06930
                    *                                                   OCB06940
                    BT540 LDX   2 MSG22     INCONSISTENT DISK I/O LIBF  OCB06950
                          BSI  L  TL000     PRINT MESSAGE R22 AND EXIT  OCB06960
                    *                                                   OCB06970
                    * LIBF TV IS ALREADY FULL                           OCB06980
                    *                                                   OCB06990
                    BT570 LDX   2 MSG09     TOO MANY LIBF ENTRIES       OCB07000
                          BSI  L  TL000     PRINT MESSAGE R09 AND EXIT  OCB07010
                    *                                                   OCB07020
                    * A LOCAL HAS CALLED A LOCAL                        OCB07030
                    *                                                   OCB07040
                    BT600 LDD   1 @WRD1     LD NAME OF LOCAL        2-9 OCB07050
                    BT610 SLT     2                                2-10 OCB07060
                          STD   3 RNAME     SAVE NAME OF CURRENT ENTRY  OCB07070
                          LDX   2 MSG17     LOCAL CALLS A LOCAL         OCB07080
                          BSI  L  TL000     PRINT MESSAGE R17 AND EXIT  OCB07090
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB07100
                    * PRINT A DIAGNOSTIC AND EXIT                       OCB07110
                    * FETCH A PHASE                                     OCB07120
                    *                                                   OCB07130
                    LK000 DC      *-*       ENTRY POINT                 OCB07140
                          NOP                                           OCB07150
                          STX   1 LK900                                 OCB07160
                          STO     LK985                                 OCB07170
                          LD    3 K320                                  OCB07180
                          STO     LK985+1                               OCB07190
                          LDX   1 0                                     OCB07200
                    LK030 LD   L1 LK910     COMPARE DESIRED ID WITH     OCB07210
                          S       LK900     *AN ID FROM SLET EXTRACT    OCB07220
                          BSC  L  LK040,+-  BR WHEN MATCH OCCURS        OCB07230
                          MDX   1 4                                     OCB07240
                          MDX     LK030     BACK TO TRY AGAIN           OCB07250
                    LK040 LD   L1 LK910+1   FETCH LOADING ADDR OF       OCB07260
                          STO     LK050+1   *DESIRED PHASE              OCB07270
                          LDD  L1 LK910+2   SET UP WD CNT AND SCTR ADDR OCB07280
                    LK050 STD  L  *-*       *ADDR OF DESIRED PHASE      OCB07290
                          LD      LK050+1                               OCB07300
                          SRT     16                                    OCB07310
                          BSI  L  GP000     FETCH DESIRED PHASE         OCB07320
                          LD      LK900     SET PHASE ID IN COMMA WITH  OCB07330
                          S       LK985-1   BRANCH IF FETCHING PRINCI-  OCB07340
                          BSC  L  LK100,+-  *PAL PRINT SUBROUTINE       OCB07350
                          LD      LK900                                 OCB07360
                          STO  L  $PHSE     *ID OF PHASE JUST FETCHED   OCB07370
                    LK100 BSC  I  LK000     RETURN                      OCB07380
                    *                                                   OCB07390
                    * CONSTANTS AND WORK AREAS                          OCB07400
                    *                                                   OCB07410
                    LK900 DC      *-*  PHASE ID OF DESIRED PHASE        OCB07420
                          BSS  E  0                                     OCB07430
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 2         OCB07440
                    LK910 DC      @CLB2 ID NO.                          OCB07450
                          DC      *-*  CORE ADDR                        OCB07460
                          DC      *-*  WD CNT                           OCB07470
                          DC      *-*  SCTR ADDR                        OCB07480
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 3         OCB07490
                          DC      @CLB3 ID NO.                          OCB07500
                          DC      *-*  CORE ADDR                        OCB07510
                          DC      *-*  WD CNT                           OCB07520
                          DC      *-*  SCTR ADDR                        OCB07530
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 4         OCB07540
                          DC      @CLB4 ID NO.                          OCB07550
                          DC      *-*  CORE ADDR                        OCB07560
                          DC      *-*  WD CNT                           OCB07570
                          DC      *-*  SCTR ADDR                        OCB07580
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 5         OCB07590
                          DC      @CLB5 ID NO.                          OCB07600
                          DC      *-*  CORE ADDR                        OCB07610
                          DC      *-*  WD CNT                           OCB07620
                          DC      *-*  SCTR ADDR                        OCB07630
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 6         OCB07640
                          DC      @CLB6 ID NO.                          OCB07650
                          DC      *-*  CORE ADDR                        OCB07660
                          DC      *-*  WD CNT                           OCB07670
                          DC      *-*  SCTR ADDR                        OCB07680
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 7         OCB07690
                          DC      @CLB7 ID NO.                          OCB07700
                          DC      *-*  CORE ADDR                        OCB07710
                          DC      *-*  WD CNT                           OCB07720
                          DC      *-*  SCTR ADDR                        OCB07730
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 8         OCB07740
                          DC      @CLB8 ID NO.                          OCB07750
                          DC      *-*  CORE ADDR                        OCB07760
                          DC      *-*  WD CNT                           OCB07770
                          DC      *-*  SCTR ADDR                        OCB07780
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 9         OCB07790
                          DC      @CLB9 ID NO.                          OCB07800
                          DC      *-*  CORE ADDR                        OCB07810
                          DC      *-*  WD CNT                           OCB07820
                          DC      *-*  SCTR ADDR                        OCB07830
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 10        OCB07840
                          DC      @CLBA ID NO.                          OCB07850
                          DC      *-*  CORE ADDR                        OCB07860
                          DC      *-*  WD CNT                           OCB07870
                          DC      *-*  SCTR ADDR                        OCB07880
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 11        OCB07890
                          DC      @CLBB ID NO.                          OCB07900
                          DC      *-*  CORE ADDR                        OCB07910
                          DC      *-*  WD CNT                           OCB07920
                          DC      *-*  SCTR ADDR                        OCB07930
                    * SLET ENTRY FOR CORE LOAD BUILDER, PHASE 12        OCB07940
                          DC      @CLBC ID NO.                          OCB07950
                          DC      *-*  CORE ADDR                        OCB07960
                          DC      *-*  WD CNT                           OCB07970
                          DC      *-*  SCTR ADDR                        OCB07980
                    *  SLET ENTRY FOR CORE LOAD BUILDER, PHASE 13   2G2 OCB07990
                          DC      @CLBD   ID NO.                    2G2 OCB08000
                          DC      *-*     CORE ADDR                 2G2 OCB08010
                          DC      *-*     WORD COUNT                2G2 OCB08020
                          DC      *-*     SCTR ADDR                 2G2 OCB08030
                    * SLET ENTRY FOR SYSTEM PRINCIPAL PRINT SUBROUTINE  OCB08040
                          DC      @PRNT ID NO.                          OCB08050
                    LK985 DC      *-*  CORE ADDR                        OCB08060
                          DC      *-*  WD CNT                           OCB08070
                          DC      *-*  SCTR ADDR                        OCB08080
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB08090
                    *                                                   OCB08100
                    * CONSTANTS AND WORK AREAS                          OCB08110
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       OCB08120
                    *                                                   OCB08130
                          BSS  E  0                                     OCB08140
                    * SLET EXTRACT FOR DUP, PHASE 17                    OCB08150
                    EX900 DC      @DU17     PHASE ID                    OCB08160
                          DC      *-*       CORE ADDR OF DUP, PHASE 17  OCB08170
                          DC      *-*       WD CNT OF DUP, PHASE 17     OCB08180
                          DC      *-*       SCTR ADDR OF DUP, PHASE 17  OCB08190
                    * SLET EXTRACT FOR CORE IMAGE LOADER, PHASE 2       OCB08200
                    EX910 DC      @CIL2     PHASE ID                    OCB08210
                          DC      *-*       CORE ADDR OF CIL,PHASE 2    OCB08220
                          DC      *-*       WD CNT OF CORE IMAGE LDR,P2 OCB08230
                          DC      *-*       SCTR ADDR OF SAME           OCB08240
                    * EXIT SUBROUTINE                                   OCB08250
                    EX920 BSI  L  *-*       BR TO CIL,PH 2 OR DUP,PH 17 OCB08260
                          STD  L  *-*       STORE WD CNT, SCTR ADDR     OCB08270
                          LD      *-2                                   OCB08280
                          SRT     16                                    OCB08290
                          BSI  L  DZ000     FETCH CIL,PH 2 OR DUP,PH 17 OCB08300
                          MDX  L  $DBSY,0   LOOP UNTIL PHASE HAS        OCB08310
                          MDX     *-3       *BEEN READ INTO CORE        OCB08320
                    EX929 MDX     *-12      BR TO CIL,PH 2 OR DUP,PH 17 OCB08330
                    *                                                   OCB08340
                    * EXIT FROM THE CORE LOAD BUILDER                   OCB08350
                    *                                                   OCB08360
                    EX000 DC      *-*       ENTRY POINT                 OCB08370
                    *                                                   OCB08380
                    * MOVE EXIT SUBR TO 1132 SCAN AREA                  OCB08390
                    *                                                   OCB08400
                          LDX   1 EX920-EX929-1                         OCB08410
                    EX150 LDD  L1 EX929+1                               OCB08420
                          STD  L1 $HASH+EX929+1-EX900                   OCB08430
                          MDX   1 2         SKIP WHEN DONE              OCB08440
                          MDX     EX150     BR TO STORE 2 MORE WORDS    OCB08450
                          LDX  L2 EX900                                 OCB08460
                          LD    3 LCBSW                                 OCB08470
                          BSC  L  EX200,Z   BR IF STORE CORE IMAGE      OCB08480
                          MDX  L  $NDUP,0   SKIP IF NO ERRORS DETECTED  OCB08490
                          EXIT              CALL EXIT                   OCB08500
                    *                                                   OCB08510
                    * PREPARE TO EXIT TO CORE IMAGE LOADER, PHASE 2     OCB08520
                    *                                                   OCB08530
                          STO   1 $CLSW-0   INDICATE XEQ DSF IN CIL SW  OCB08540
                          LD    3 CILCA                                 OCB08550
                          STO     EX910+1                               OCB08560
                          MDX   2 EX910-EX900                           OCB08570
                    EX200 LD    2 1         FETCH CORE ADDR             OCB08580
                          STO   1 $HASH+11-0                            OCB08590
                          A     3 K2                                    OCB08600
                          STO   1 $HASH+9-0                             OCB08610
                          LDD   2 2                                     OCB08620
                    *                                                   OCB08630
                    * EXIT TO CORE IMAGE LOADER OR DUP                  OCB08640
                    *                                                   OCB08650
                          NOP                                           OCB08660
                          LDX   0 $HASH+10-0 BR TO FETCH,EXEC CIL,PH 2  OCB08670
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB08680
                    TL000 DC      *-*       ENTRY POINT                 OCB08690
                          STX   2 TL900                                 OCB08700
                          LD      TL900     BR IF ERROR MESSAGE TO BE   OCB08710
                          BSI  L  PM000,-   *PRINTED BEFORE ABORT MSG   OCB08720
                          LD      TL900     TEST FOR MSG 16-PROGRAM 212 OCB08730
                          S     3 K16       *NOT FOUND IN LET/FLET  212 OCB08740
                          BSC  I  TL000,+-  RETURN IF MSG 16        212 OCB08750
                    TL100 LDD   3 LNAME                             212 OCB08760
                          STD   3 RNAME                                 OCB08770
                          LDX   2 MSG18                                 OCB08780
                          BSI  L  PM000     PRINT ABORT MESSAGE         OCB08790
                          BSI  L  EX000     EXIT FROM CLB               OCB08800
                    *                                                   OCB08810
                    * CONSTANTS AND WORK AREAS                          OCB08820
                    *                                                   OCB08830
                    TL900 DC      *-*       NO. OF DESIRED MESSAGE      OCB08840
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB08850
                    * GET/PUT SUBROUTINE                                OCB08860
                    *                                                   OCB08870
                    GP000 DC      *-*       ENTRY POINT                 OCB08880
                          BSC  L  GP100,+   BR IF READ REQUEST      212 OCB08890
                          LD    3 LSW22     TEST FOR ALL SUBR FOUND 212 OCB08900
                          BSC  I  GP000,Z   *BR IF NOT              212 OCB08910
                          LD    3 K1        RESTORE WRITE REQUEST   212 OCB08920
                    GP100 BSI  L  DZ000     CALL DISK I/O           212 OCB08930
                          MDX  L  $DBSY,0   LOOP UNTIL                  OCB08940
                          MDX     *-3       *OPERATION COMPLETE         OCB08950
                          BSC  I  GP000     RETURN                      OCB08960
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB08970
                    * FLIPPER FOR PRINTING MESSAGES                     OCB08980
                    *                                                   OCB08990
                    PM000 DC      *-*       ENTRY POINT FOR ERROR MSGES OCB09000
                          NOP                                           OCB09010
                          STX   1 PM100+1   SAVE XR1                    OCB09020
                          STX   2 PM910     SAVE MAP/MESSAGE INDICATOR  OCB09030
                          LD   L  $PHSE     SAVE PHASE ID               OCB09040
                          STO     PM900     *CURRENTLY IN COMMA         OCB09050
                          LD      PM910     FETCH INDICATOR             OCB09060
                          SRA     4                                     OCB09070
                          LDX   1 0         ZERO TO XR1                 OCB09080
                          BSC  L  PM030,+-  BR IF NO. LT 16             OCB09090
                          MDX   1 1                                     OCB09100
                          SRA     1                                     OCB09110
                          BSC  L  PM030,+-  BR IF NO. LT 32             OCB09120
                          MDX   1 1                                     OCB09130
                          SRA     1                                     OCB09140
                          BSC  L  PM030,+-  BR IF NO. LT 64             OCB09150
                          MDX   1 1                                     OCB09160
                    PM030 MDX   1 @CLB8-1   PHASE NO. TO XR1            OCB09170
                          BSI  L  LK000     FETCH DESIRED PHASE         OCB09180
                          BSI  L  BUFLS+2   BR TO MAP/MESSAGE PHASE     OCB09190
                          LD      PM900     RESTORE PHASE ID            OCB09200
                          STO  L  $PHSE     *IN COMMA                   OCB09210
                    PM100 LDX  L1 *-*       RESTORE XR1                 OCB09220
                          BSC  I  PM000     RETURN                      OCB09230
                    PM300 DC      *-*       ENTRY PT. TO CHECK MAP SW   OCB09240
                          MDX  L  LMPSW+X3,0 SKIP IF NO MAP REQUESTED   OCB09250
                          BSI     PM000     BR TO PRINT MESSAGE         OCB09260
                          BSC  I  PM300     RETURN                      OCB09270
                    *                                                   OCB09280
                    * CONSTANTS AND WORK AREAS                          OCB09290
                    *                                                   OCB09300
                    PM900 DC      *-*  PHASE ID FROM COMMA              OCB09310
                    PM910 DC      *-*  MESSAGE/MAP INDICATOR            OCB09320
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB09330
                    *                                                   OCB09340
                    * LET ENTRIES FOR CURRENT SUBPROGRAM                OCB09350
                    *                                                   OCB09360
                    ENTPT BSS  E  @MXEP*@LTEN                           OCB09370
                    *                                                   OCB09380
                    * CORE IMAGE HEADER                                 OCB09390
                    *                                                   OCB09400
                    B     EQU     *                                     OCB09410
                    * MISCELLANEOUS LOADING PARAMETERS                  OCB09420
                    @XEQA DC      *-*  CORE LOAD EXECUTION ADDR       1 OCB09430
                    @CMON DC      *-*  WD CNT OF COMMON               2 OCB09440
                    @DREQ DC      *-*  DISK I/O INDICATOR             3 OCB09450
                    @FILE DC      *-*  NO. DEFINED FILES              4 OCB09460
                    @HWCT DC      @HEND-@XEQA+1 CORE IMAGE HDR WD CNT 5 OCB09470
                    @LSCT DC      *-*  SCTR CNT OF FILES IN SYS WS    6 OCB09480
                    @LDAD DC      *-*  LOADING ADDR OF CORE LOAD      7 OCB09490
                    @XCTL DC      *-*  EXIT CTRL ADDR FOR DISK1/N     8 OCB09500
                    @TVWC DC      *-*  TRANSFER VECTOR WD CNT         9 OCB09510
                    @WCNT DC      *-*  WD CNT OF CORE LOAD           10 OCB09520
                    @XR3X DC      *-*  SETTING FOR XR3 DURING EXECUTION OCB09530
                    * INTERRUPT TV (ITV)                                OCB09540
                    @ITVX DC      *-*  WORD 8                        12 OCB09550
                          DC      *-*  WORD 9                        13 OCB09560
                          DC      *-*  WORD 10                       14 OCB09570
                          DC      *-*  WORD 11                       15 OCB09580
                          DC      *-*  WORD 12                       16 OCB09590
                          DC      *-*  WORD 13                       17 OCB09600
                    * INTERRUPT BRANCH TABLE FOR LEVEL 4 (IBT4)         OCB09610
                    @ILS4 DC      *-*  RESERVED FOR FUTURE USE       18 OCB09620
                          DC      *-*  RESERVED FOR FUTURE USE       19 OCB09630
                          DC      *-*  RESERVED FOR FUTURE USE       20 OCB09640
                          DC      *-*  ISS FOR 1231                  21 OCB09650
                          DC      *-*  ISS FOR 1403                  22 OCB09660
                          DC      *-*  ISS FOR 2501                  23 OCB09670
                          DC      *-*  ISS FOR 1442                  24 OCB09680
                          DC      *-*  ISS FOR KEYBOARD/CONSOLE PRINTER OCB09690
                          DC      *-*  ISS FOR 1134/1055             26 OCB09700
                    *                                                   OCB09710
                    @OVSW DC      *-*  LOCAL/SOCAL SECTOR COUNT      27 OCB09720
                    @CORE DC      *-*  CORE SIZE OF SYS BUILDING LOAD   OCB09730
                    *                                                   OCB09740
                          DC      *-*  USED BY SDFIO FOR CHECKSUMMING   OCB09750
                          DC      *-*  *DEFINE FILE TABLE            30 OCB09760
                    @HEND EQU     *-1                                   OCB09770
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB09780
                    * ISS TABLE                                         OCB09790
                          DC      0    ISS NO. 0, UNASSIGNED            OCB09800
                    ISTVX DC      0    ISS NO. 1, 1442 CD READ/PUNCH    OCB09810
                          DC      0    ISS NO. 2, KEYBOARD/CONSOLE PTR  OCB09820
                          DC      0    ISS NO. 3, 1134/1055 PAPER TAPE  OCB09830
                          DC      0    ISS NO. 4, 2501 CARD READER      OCB09840
                    DKISS DC      0    ISS NO. 5, 2310 DISK         2-2 OCB09850
                          DC      0    ISS NO. 6, 1132 PRINTER          OCB09860
                          DC      0    ISS NO. 7, 1627 PLOTTER          OCB09870
                          DC      0    ISS NO. 8, SCA                   OCB09880
                          DC      0    ISS NO. 9, 1403 PRINTER          OCB09890
                          DC      0    ISS NO. 10, 1231 MARK READER     OCB09900
                          DC      0    ISS NO. 11, 2250 GRAPHIC DISPLAY OCB09910
                          DC      0    ISS NO. 12, RESERVED             OCB09920
                          DC      0    ISS NO. 13, RESERVED             OCB09930
                          DC      0    ISS NO. 14, RESERVED             OCB09940
                          DC      0    ISS NO. 15, RESERVED             OCB09950
                          DC      0    ISS NO. 16, RESERVED             OCB09960
                          DC      0    ISS NO. 17, RESERVED             OCB09970
                          DC      0    ISS NO. 18, RESERVED             OCB09980
                          DC      0    ISS NO. 19, RESERVED             OCB09990
                          DC      0    ISS NO. 20, RESERVED             OCB10000
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB10010
                    *                                               2-4 OCB10020
                    * EQUATE TABLE                                  2-4 OCB10030
                    *                                               2-4 OCB10040
                    EQTBL BES  E  @EQLM*@EETY                      2-10 OCB10050
                          HDNG    CORE LOAD BUILDER, PHASE 0            OCB10060
                    * RCOM, CONSTANTS AND WORK AREAS SHARED BY PHASES   OCB10070
                          BSS  E  0                                     OCB10080
                    *                                                   OCB10090
                    * THE FOLLOWING 2-WD CELLS ARE ON EVEN-BOUNDARIES   OCB10100
                    *                                                   OCB10110
                    X3    EQU     *+128                                 OCB10120
                          ORG     *                                     OCB10130
                    W     EQU     *+129                                 OCB10140
                          DC      *-*  MAINLINE NAME IN                 OCB10150
                    LNAME EQU     *-W                                   OCB10160
                          DC      *-*  *NAME CODE                       OCB10170
                          DC      *-*  CELL FOR HOLDING NAME BEING      OCB10180
                    NAME  EQU     *-W                                   OCB10190
                          DC      *-*  *COMPARED WITH THOSE IN LOAD TBL OCB10200
                          DC      *-*  CELL FOR HOLDING 2ND PARA-       OCB10210
                    NAME2 EQU     *-W                                   OCB10220
                          DC      *-*  *METER FOR ERROR MESSAGES        OCB10230
                          DC      *-*  NAME OF SUBROUTINE CURRENTLY     OCB10240
                    RNAME EQU     *-W                                   OCB10250
                          DC      *-*  *BEING RELOCATED,IN NAME CODE    OCB10260
                    *                                                   OCB10270
                    * THE FOLLOWING CELLS MUST APPEAR IN                OCB10280
                    * THIS ORDER TO FACILITATE INDEXING                 OCB10290
                    *                                                   OCB10300
                          DC      *-*  LENGTH OF MISC. IN-CORE SUBRS    OCB10310
                    INCOR EQU     *-W                                   OCB10320
                          DC      *-*  ARITH & FUNCTIONAL LENGTH        OCB10330
                    ARITH EQU     *-W                                   OCB10340
                          DC      *-*  LENGTH OF FI/O                   OCB10350
                    FORIO EQU     *-W                                   OCB10360
                          DC      *-*  LENGTH OF DISK FI/O              OCB10370
                    DKFIO EQU     *-W                                   OCB10380
                          DC      *-*  LENGTH OF LONGEST LOCAL SUBR     OCB10390
                    LOCAL EQU     *-W                                   OCB10400
                    *                                                   OCB10410
                    * THE FOLLOWING ARE CONSTANTS USED                  OCB10420
                    * FOR VARIOUS PURPOSES                              OCB10430
                    *                                                   OCB10440
                          DC      0    ZERO                             OCB10450
                    K0    EQU     *-W                                   OCB10460
                          DC      1    ONE                              OCB10470
                    K1    EQU     *-W                                   OCB10480
                          DC      2    TWO                              OCB10490
                    K2    EQU     *-W                                   OCB10500
                          DC      3    THREE                            OCB10510
                    K3    EQU     *-W                                   OCB10520
                          DC      5    FIVE                             OCB10530
                    K5    EQU     *-W                                   OCB10540
                          DC      6    SIX                              OCB10550
                    K6    EQU     *-W                                   OCB10560
                          DC      7    SEVEN                            OCB10570
                    K7    EQU     *-W                                   OCB10580
                          DC      8    EIGHT                            OCB10590
                    K8    EQU     *-W                                   OCB10600
                          DC      16   SIXTEEN                          OCB10610
                    K16   EQU     *-W                                   OCB10620
                          DC      20   NO. WORDS PER DISK BLOCK         OCB10630
                    K20   EQU     *-W                                   OCB10640
                          DC      320  NO. WORDS PER SECTOR             OCB10650
                    K320  EQU     *-W                                   OCB10660
                          DC      /4000 MASK                            OCB10670
                    K4000 EQU     *-W                                   OCB10680
                    *                        2 INSTRUCTIONS REMOVED 2-2 OCB10690
                          DC      /8000 MASK                            OCB10700
                    K8000 EQU     *-W                                   OCB10710
                          DC      /F000 MASK                            OCB10720
                    KF000 EQU     *-W                                   OCB10730
                          DC      /00FF MASK                            OCB10740
                    K00FF EQU     *-W                                   OCB10750
                          DC      /0FFF MASK                            OCB10760
                    K0FFF EQU     *-W                                   OCB10770
                          DC      /FF0F MASK                            OCB10780
                    KFF0F EQU     *-W                                   OCB10790
                    *                                                   OCB10800
                    * THE FOLLOWING CONSTANTS AND WORK                  OCB10810
                    * AREAS ARE ARRANGED ALPHABETICALLY                 OCB10820
                    *                                                   OCB10830
                          DC      @DBSC-1 NO. DISK BLOCKS PER           OCB10840
                    BLCKS EQU     *-W  *SECTOR MINUS 1                  OCB10850
                          BSI   3 0    BSI TO REPLACE LIBF NAME         OCB10860
                    BSIT3 EQU     *-W  *IN PROCESSING LIBF STATEMENTS   OCB10870
                          DC      *-*  CORE ADDR OF DESIRED BUFFER      OCB10880
                    BUFFR EQU     *-W                                   OCB10890
                          DC      *-*  DISK BLOCK ADDR OF PROGRAM       OCB10900
                    BYADR EQU     *-W  *JUST LOOKED UP IN LET/FLET      OCB10910
                          DC      *-*  RIGHTMOST ADDR IN CALL TV        OCB10920
                    CALTV EQU     *-W                                   OCB10930
                          DC      BUFCI CORE ADDR OF CIB BUFFER         OCB10940
                    CIBBF EQU     *-W                                   OCB10950
                          DC      *-*  UPPER LIMIT OF CORE TO BE    2-2 OCB10960
                    CIBLM EQU     *-W  *STORED IN THE CIB           2-2 OCB10970
                          DC      *-*  CORE ADDR OF CORE IMAGE LDR,PH 2 OCB10980
                    CILCA EQU     *-W                                   OCB10990
                          DC      *-*  CLASS CODE OF PROGRAM CURRENTLY  OCB11000
                    CLASS EQU     *-W  *BEING RELOCATED                 OCB11010
                          DC      *-*  LOAD TABLE ADDR OF SUBROUTINE    OCB11020
                    CURTV EQU     *-W  *CURRENTLY BEING RELOCATED       OCB11030
                          DC      *-*  DATA WD TO BE WRITTEN ON THE CIB OCB11040
                    DATWD EQU     *-W                                   OCB11050
                          DC      *-*  CORE ADDR TO WHICH DEFINE FILE   OCB11060
                    DFADR EQU     *-W  *TABLE HAS BEEN MOVED            OCB11070
                          DC      *-*  DISPLACEMENT IN LIBF TV FOR      OCB11080
                    DISPL EQU     *-W  *CURRENT LOAD TABLE ENTRY        OCB11090
                          DC      *-*  DRIVE CODE OF LAST NAME SOUGHT   OCB11100
                    DRCDE EQU     *-W  *IN LET/FLET                     OCB11110
                          DC      BUFCI+322 HIGHEST ADDR USED BY CLB,   OCB11120
                    ENDRL EQU     *-W  *EXCLUDING THE LOAD TABLE        OCB11130
                          DC      0    THE NEG NO. OF WORDS         2-4 OCB11140
                    EQCNT EQU     *-W  *THE EQUATE TABLE            2-4 OCB11150
                          DC      0    WORD COUNT OF THE LOCAL          OCB11160
                    FLIPT EQU     *-W  *FLIPPER TABLE                   OCB11170
                          DC      *-*  ADDR OF LOCAL FLIPPER,I.E.,1+    OCB11180
                    FLPAD EQU     *-W  *ADDR OF END OF FLIPPER TABLE    OCB11190
                          DC      *-*  SECTOR ADDR OF LAST SECTOR OF    OCB11200
                    FSCTR EQU     *-W  *LAST FILE IN WORKING STORAGE    OCB11210
                          DC      0    HIGHEST ADDR OCCUPIED BY CORE    OCB11220
                    HADDR EQU     *-W  *LOAD TO THIS POINT IN LOADING   OCB11230
                    IBT04 DC      *-*  IBT04 ENTRY FOR THE 1403         OCB11240
                    IBT4X EQU     *-W                                   OCB11250
                          BSS     2                                     OCB11260
                          DC      *-*  IBT04 ENTRY FOR CONSOLE PRINTER  OCB11270
                          DC      *-*  MINUS DRIVE NO. FROM WHICH LET/  OCB11280
                    IGNOR EQU     *-W  *FLET SEARCHING BEGINS           OCB11290
                          DC      0   WORD COUNT OF ALL INTERRUPT LEVEL OCB11300
                    ILSCT EQU     *-W  *SUBROUTINES IN THIS CORE LOAD   OCB11310
                          DC      *-*  NO. WORDS PROG CURRENTLY BEING   OCB11320
                    INCRE EQU     *-W  *RELOCATED ADDR TO LOAD TABLE    OCB11330
                          DC      *-*  ADDR IN DATA BFR OF CURRENT WD   OCB11340
                    INDEX EQU     *-W                                   OCB11350
                          DC      *-*  ISS TBL ADDR FOR CURR I/O DEVICE OCB11360
                    ISSTV EQU     *-W                                   OCB11370
                          DC      0    NO. OF IN-CORE CALLS (NOT LIBFS) OCB11380
                    ITVCT EQU     *-W                                   OCB11390
                          DC      *-*  LOCATION ADDRESS COUNTER         OCB11400
                    LACTR EQU     *-W                                   OCB11410
                          DC      *-*  LOADING ADDR OF PROGRAM          OCB11420
                    LADDR EQU     *-W  *CURRENTLY BEING RELOCATED       OCB11430
                          DC      0    WORD LENGTH OF LOAD TABLE        OCB11440
                    LBATV EQU     *-W                                   OCB11450
                          DC      *-*  STORE CI INDICATOR--             OCB11460
                    LCBSW EQU     *-W  *ZERO MEANS STORE CORE IMAGE     OCB11470
                          DC      *-*  LOGICAL DR NO. OF DRIVE CON-     OCB11480
                    LDCDE EQU     *-W  *TAINING DESIRED PROGRAM         OCB11490
                          DC      *-*  CARTRIDGE ID FOR LOGICAL DRIVE 0 OCB11500
                    LCIDN EQU     *-W                                   OCB11510
                          DC      *-*  CARTRIDGE ID FOR LOGICAL DRIVE 1 OCB11520
                          DC      *-*  CARTRIDGE ID FOR LOGICAL DRIVE 2 OCB11530
                          DC      *-*  CARTRIDGE ID FOR LOGICAL DRIVE 3 OCB11540
                          DC      *-*  CARTRIDGE ID FOR LOGICAL DRIVE 4 OCB11550
                          DC      *-*  NO. BLOCKS IN FILE/PROG          OCB11560
                    LDBCT EQU     *-W  *JUST LOOKED UP IN LET/FLET      OCB11570
                          DC      *-*  DISK I/O REQUESTED INDICATOR     OCB11580
                    LDREQ EQU     *-W  *(FROM LIBF STATEMENT)           OCB11590
                          DC      *-*  ADDR OF 1ST WORD OF RIGHTMOST    OCB11600
                    LEFTX EQU     *-W  *AVAILABLE ENTRY IN LOAD TABLE   OCB11610
                          DC      *-*  NO. DEVICES ON INTERRUPT LEVEL   OCB11620
                    LEVLS EQU     *-W  *CURRENTLY BEING SERVICED        OCB11630
                          DC      *-*  NO. *FILES RECORDS IN THE SCRA   OCB11640
                    LFCNT EQU     *-W                                   OCB11650
                          DC      *-*  WORD 9 OF MAINLINE HEADER        OCB11660
                    LFORT EQU     *-W                                   OCB11670
                          DC      *-*  NO. *LOCAL RECORDS IN THE SCRA   OCB11680
                    LLCNT EQU     *-W                                   OCB11690
                          DC      *-*  LOCAL-CANNOT-CALL-LOCAL SW,  2-2 OCB11700
                    LLOSW EQU     *-W  *ZERO=CANNOT                 2-2 OCB11710
                          DC      *-*  MAP SWITCH--ZERO=NO MAP REQUESTD OCB11720
                    LMPSW EQU     *-W                                   OCB11730
                          DC      *-*  NO. OF NOCALS REQUESTED          OCB11740
                    LNCNT EQU     *-W                                   OCB11750
                          DC      *-*  LENGTH OF PROGRAM REFERENCED     OCB11760
                    LNGTH EQU     *-W  *IN DSA STATEMENT                OCB11770
                          DC      *-*  LOWEST ADDR OCCUPIED BY CURR-    OCB11780
                    LOADR EQU     *-W  *ENTLY RELOCATED SUBROUTINE      OCB11790
                          DC      BUFLO CORE ADR OF DATA BUFFER         OCB11800
                    LOBUF EQU     *-W                                   OCB11810
                          DC      *-*  CORE ADDR OF LOCAL AREA          OCB11820
                    LOCAR EQU     *-W                                   OCB11830
                          DC      19   WORD COUNT OF A FILE MAP LINE    OCB11840
                    LONGX EQU     *-W  *FOR A TRUNCATED FILE            OCB11850
                          DC      *-*  ML  PRECISION -- 0=NONE,1=       OCB11860
                    LPREC EQU     *-W  *STANDARD,2 = EXTENDED           OCB11870
                          DC      *-*  ADDR OF LOCAL AREA (SW 9=0) OR   OCB11880
                    LSADR EQU     *-W  *SOCAL AREA (SW 9=1,2,OR 3)      OCB11890
                          DC      BUFLS CORE ADDR OF LET/FLET           OCB11900
                    LSBUF EQU     *-W  *SEARCH BUFFER                   OCB11910
                          DC      *-*  SCTR ADDR OF SCRA                OCB11920
                    LSCRA EQU     *-W                                   OCB11930
                          DC      *-*  BYPASS SW--NON-ZERO INDICATES    OCB11940
                    LSW01 EQU     *-W  NOT TO LOAD CURRENT PROGRAM      OCB11950
                          DC      0    FILES ALLOC HDNG SW-0=NOT PRINTD OCB11960
                    LSW02 EQU     *-W                                   OCB11970
                          DC      1    DO NOT STORE EXECUTION ADDR      OCB11980
                    LSW03 EQU     *-W  *IN 3RD WD OF LD TBL IF NON-ZERO OCB11990
                          DC      *-*  TRUNCATED FILE SWITCH--CURRENT   OCB12000
                    LSW04 EQU     *-W  *FILE HAS BEEN TRUNCATED         OCB12010
                          DC      *-*  DO-NOT-LOAD SW--1=DO NOT RELO-   OCB12020
                    LSW05 EQU     *-W  *CATE CURRENT SUBROUTINE         OCB12030
                          DC      0    DF SW--1=DEFINE FILE TABLE       OCB12040
                    LSW06 EQU     *-W  *PROCESSING INCOMPLETE           OCB12050
                          DC      0    ILS SWITCH--1=PROCESSING BRANCH  OCB12060
                    LSW07 EQU     *-W  *TABLE OF AN ILS                 OCB12070
                          DC      *-*  CALL/LIBF SW--1=CALL,ZERO=LIBF   OCB12080
                    LSW08 EQU     *-W                                   OCB12090
                          DC      *-*  MODE SW--0=PROCESSING LOCALS,    OCB12100
                    LSW09 EQU     *-W  *-1=PROCESSING IN-CORES,+=SOCALS OCB12110
                          DC      0    INHIBITED TRANSFER TO CIB SW--   OCB12120
                    LSW10 EQU     *-W  1=DO NOT WRITE ON CIB            OCB12130
                          DC      *-*  LET/FLET SW--0=LET, 1=FLET       OCB12140
                    LSW11 EQU     *-W                                   OCB12150
                          DC      *-*  LET ENTRY TYPE SW--+ =DSF ENTRY, OCB12160
                    LSW12 EQU     *-W  * - = DDF OR DCI                 OCB12170
                          DC      *-*  1ST TIME SW FOR THE PS SUBR IN   OCB12180
                    LSW13 EQU     *-W  *PHASE 5                         OCB12190
                          DC      *-*  DATA BFR SW--ZERO=GET DISK ADDR  OCB12200
                    LSW14 EQU     *-W  *FROM BYADR,OTHERWISE COMPUTE IT OCB12210
                          DC      0    DSA SWITCH-- 1=PROCESSING        OCB12220
                    LSW15 EQU     *-W  *A DSA STATEMENT                 OCB12230
                          DC      *-*  LOCAL SWITCH-- 8=PROCESSING      OCB12240
                    LSW16 EQU     *-W  *A SUBR CALLED BY A LOCAL        OCB12250
                          DC      0    PASS SWITCH - ZERO=              OCB12260
                    LSW17 EQU     *-W  *1ST PASS, 1=2ND PASS            OCB12270
                          DC      *-*  DISK I/O SW--0=CALL/LIBF NOT A   OCB12280
                    LSW18 EQU     *-W  *DISK I/O CALL                   OCB12290
                          DC      0    OVERLAY SWITCH--NON-ZERO MEANS   OCB12300
                    LSW19 EQU     *-W  *LOCALS/SOCALS IN THE CORE LOAD  OCB12310
                          DC      *-*  CORE IMAGE HDR SW--NON-ZERO=     OCB12320
                    LSW20 EQU     *-W  *OUTPUTTING CORE IMAGE HEADER    OCB12330
                          DC      *-*  CIB SWITCH--0=1ST TIME CIB SCTR  OCB12340
                    LSW21 EQU     *-W  *READ INTO CIB BUFFER            OCB12350
                          DC      0    WORD LENGTH OF TRANSFER VECTOR   OCB12360
                    LSW22 EQU     *-W       LET/FLET SW--0=ALL PROGS212 OCB12370
                          DC      0         *FOUND,+=PREVIOUS PROG  212 OCB12380
                    *                       *NOT FOUND,-=THIS PROG  212 OCB12390
                    *                       *NOT FOUND              212 OCB12400
                    LSW23 EQU     *-W       PROCESSING EQUAT--NON-  212 OCB12410
                          DC      0         ZERO = PROCESSING EQUAT 212 OCB12420
                    LTVWC EQU     *-W                                   OCB12430
                          DC      *-*  TYPE FOR PROGRAM CURRENTLY       OCB12440
                    LTYPE EQU     *-W  *BEING RELOCATED                 OCB12450
                          DC      *-*  EXEC ADDR, IF ANY, FOR DSA       OCB12460
                    LXEQA EQU     *-W  *CURRENTLY BEING PROCESSED       OCB12470
                          DC      *-*  SPECIAL ILS INDICATOR--NON-ZE2-2 OCB12480
                    LX3SW EQU     *-W  *USE SPECIAL IL SUBROUTINES  2-2 OCB12490
                          DC      *-*  ADDR ASSIGNED TO THE FIRST       OCB12500
                    MLWD1 EQU     *-W  *WORD OF THE MAINLINE            OCB12510
                          DC      *-*  ADDR OF NEXT SECTOR TO BE READ   OCB12520
                    NEXT  EQU     *-W  *INTO DATA BUFFER                OCB12530
                          DC      *-*  NO. ENTRY POINTS  IN SUBROUTINE  OCB12540
                    NOPTS EQU     *-W  *CURRENTLY BEING RELOCATED       OCB12550
                          DC      $ZEND+@HEND-@XEQA+1 ORIGIN FOR DISKZ  OCB12560
                          DC      $1END+@HEND-@XEQA+1 ORIGIN FOR DISK1  OCB12570
                    ORGIN EQU     *-W                                   OCB12580
                          DC      $NEND+@HEND-@XEQA+1 ORIGIN FOR DISKN  OCB12590
                          DC      0    LOCAL/SOCAL SWITCH--2=OPTION 1,  OCB12600
                    OVLAY EQU     *-W  *3 = OPTION 2                    OCB12610
                          DC      *-*  RELOCATION FACTOR                OCB12620
                    RELOC EQU     *-W                                   OCB12630
                          DC      *-*  ADDR OF 1ST WORD OF 1ST          OCB12640
                    RIGHT EQU     *-W  *ENTRY IN LOAD TABLE             OCB12650
                          DC      *-*  AVAILABLE CORE AFTER ALLOWING    OCB12660
                    RLCOR EQU     *-W  *FOR TRANSFER VECTOR, COMMON     OCB12670
                          DC      *-*  RELATIVE ENTRY ADDR OF PROGRAM   OCB12680
                    RLXEQ EQU     *-W  *CURRENTLY BEING RELOCATED       OCB12690
                          DC      *-*  ADDR OF SECTOR NOW               OCB12700
                    SADDR EQU     *-W  *IN THE DATA BUFFER              OCB12710
                          DC      *-*  NO. OF ENTRIES IN SOCAL TV,I.E., OCB12720
                    SCLCT EQU     *-W  *NO. OF FUNCTION SUBPROGRAMS     OCB12730
                          DC      *-*  ADDR OF 1ST SCTR OF LOCAL/SOCAL  OCB12740
                    SCTAD EQU     *-W  *CURRENTLY BEING PROCESSED       OCB12750
                          DC      *-*  SAME FOR LOGICAL DRIVE 1         OCB12760
                          DC      *-*  SAME FOR LOGICAL DRIVE 2         OCB12770
                          DC      *-*  SAME FOR LOGICAL DRIVE 3         OCB12780
                          DC      *-*  SAME FOR LOGICAL DRIVE 4         OCB12790
                          DC      *-*  NO. OF CURR CIB SCTR IN CIB BFR  OCB12800
                    SCTRX EQU     *-W  *BFR, NO. = 0, 1, ..., 13        OCB12810
                          DC      14   WORD COUNT OF A NORMAL           OCB12820
                    SHORT EQU     *-W  *LINE OF THE FILE MAP            OCB12830
                          DC      1599 HIGHEST SCTR ADDR ALLOWABLE      OCB12840
                    SLIMT EQU     *-W                                   OCB12850
                          DC      *-*  CORE ADDR OF THE SOCAL AREA      OCB12860
                    SOCAR EQU     *-W                                   OCB12870
                          DC      *-*  ADDR OF THE FUNCTION ENTRY   2-2 OCB12880
                    STVAD EQU     *-W  *POINT IN LOCAL/SOCAL FLIPPER2-2 OCB12890
                          DC      *-*  WD CNT  OF SUBROUTINE CURRENTLY  OCB12900
                    SUBWC EQU     *-W  *BEING RELOCATED                 OCB12910
                          DC      *-*  WD CNT OF SOCAL 1                OCB12920
                    S1WCT EQU     *-W                                   OCB12930
                          DC      *-*  WD CNT OF SOCAL 2                OCB12940
                          DC      *-*  WD CNT OF SOCAL 3                OCB12950
                          DC      *-*  SCTR ADDR OF SOCAL 1             OCB12960
                    S1SAD EQU     *-W                                   OCB12970
                          DC      *-*  SCTR ADDR OF SOCAL 2             OCB12980
                          DC      *-*  SCTR ADDR OF SOCAL 3             OCB12990
                          DC      *-*  TRANSFER VECTOR POINTER          OCB13000
                    TVADR EQU     *-W                                   OCB13010
                          DC      *-*  ADDR OF 1ST WORD OF LAST (LH)    OCB13020
                    TVEND EQU     *-W  *ENTRY IN LIBF TV                OCB13030
                          DC      *-*  CALL TV ADDR OF CALL JUST        OCB13040
                    TVPTR EQU     *-W  *ENTERED IN LOAD TABLE           OCB13050
                          DC      *-*  WASTEBASKET                      OCB13060
                    WASTE EQU     *-W                                   OCB13070
                          DC      *-*  ADDR OF CURRENT SCTR ADDR IN     OCB13080
                    WSADR EQU     *-W  *WORKING STORAGE                 OCB13090
                          DC      *-*  ADDR IN LET SEARCH BFR OF        OCB13100
                    XR1LS EQU     *-W  *NAME OF DESIRED PROGRAM         OCB13110
                    IND05 DC      *-*       STORE AREA TO DENOTE   2-11 OCB13120
                    *                       *ISSUING OF R05 ERROR  2-11 OCB13130
                          BSS     /05BB-*   PATCH AREA             2-11 OCB13140
                          HDNG    CORE LOAD BUILDER, PHASE 1            OCB13150
                    *************************************************** OCB13160
                    *STATUS - VERSION 2, MODIFICATIOON LEVEL 12       * OCB13170
                    *                                                 * OCB13180
                    *FUNCTION/OPERATION-                              * OCB13190
                    *   * PHASE 1 PERFORMS THE INITIALIZATION AND THEN* OCB13200
                    *     OVERLAYS ITSELF WITH PHASE 2. IT CONSISTS OF* OCB13210
                    *     THE SUBROUTINES,                            * OCB13220
                    *     * IN000-INITIALIZE THE CORE LOAD BUILDER,   * OCB13230
                    *       PROCESS THE MAINLINE PROGRAM HEADER AND   * OCB13240
                    *       READ LOCALS AND NOCALS FROM SCRA.         * OCB13250
                    *     * LN000-ENTER A LOCAL NOCAL NAME TO THE     * OCB13260
                    *       LOAD TABLE.                               * OCB13270
                    *                                                 * OCB13280
                    *ENTRY POINTS-                                    * OCB13290
                    *   * IN000-THE ONLY ENTRY POINT                  * OCB13300
                    *             BSI  L  IN000                       * OCB13310
                    *                                                 * OCB13320
                    *INPUT-                                           * OCB13330
                    *   * DCOM                                        * OCB13340
                    *   * MAINLINE HEADER RECORD                      * OCB13350
                    *   * SCRA                                        * OCB13360
                    *   * LOCAL/NOCAL HEADER                          * OCB13370
                    *                                                 * OCB13380
                    *OUTPUT-                                          * OCB13390
                    *   * INITIALIZED SWITCHES, ETC.                  * OCB13400
                    *                                                 * OCB13410
                    *EXTERNAL REFERENCES-                             * OCB13420
                    *   * SUBROUTINES-                                * OCB13430
                    *     * BT000-ENTER NAME IN LOAD TABLE            * OCB13440
                    *     * GP000-GET/PUT SUBROUTINE                  * OCB13450
                    *     * LK000-FETCH A PHASE                       * OCB13460
                    *     * MC000-MASTER CONTROL SUBROUTINE           * OCB13470
                    *     * NW000-FETCH WORD FROM DATA BUFFER         * OCB13480
                    *     * LS000-FIND A PROGRAM IN LET/FLET          * OCB13490
                    *     * PM000-FLIPPER FOR PRINTING MESSAGE        * OCB13500
                    *     * RH000-READ PROGRAM HEADER TO DATA BUFFER  * OCB13510
                    *     * TL000-PRINT ERROR MESSAGE(S), EXIT        * OCB13520
                    *   * COMMA/DCOM                                  * OCB13530
                    *     * $CIBA                                     * OCB13540
                    *     * $CORE                                     * OCB13550
                    *     * $DADR                                     * OCB13560
                    *     * $DCDE                                     * OCB13570
                    *     * $DREQ                                     * OCB13580
                    *     * $FPAD                                     * OCB13590
                    *     * $IBT4                                     * OCB13600
                    *     * $LEV1                                     * OCB13610
                    *     * $WSDR                                     * OCB13620
                    *     * #CBSW                                     * OCB13630
                    *     * #CIND                                     * OCB13640
                    *     * #FMAT                                     * OCB13650
                    *     * #LCNT                                     * OCB13660
                    *     * #MPSW                                     * OCB13670
                    *     * #NCNT                                     * OCB13680
                    *     * #SCRA                                     * OCB13690
                    *     * #WSCT                                     * OCB13700
                    *                                                 * OCB13710
                    *EXITS-                                           * OCB13720
                    *   * NORMAL-                                     * OCB13730
                    *     * TO MASTER CONTROL SUBROUTINE IN PHASE 2   * OCB13740
                    *         LDX  L1 MC000  ENTRY POINT TO PHASE 2   * OCB13750
                    *         STX  L1 LK000  SIMULATE A BSI TO LK000  * OCB13760
                    *         BSC  L  LK000  FETCH PHASE 2 AND BRANCH * OCB13770
                    *   * ERROR                                       * OCB13780
                    *     * TO SUBROUTINE TL000 TO  PRINT             * OCB13790
                    *       MESSAGE(S) AND EXIT FROM CLB.             * OCB13800
                    *                                                 * OCB13810
                    *TABLES/WORK AREAS-                               * OCB13820
                    *   * RCOM                                        * OCB13830
                    *   * LOAD TABLE                                  * OCB13840
                    *                                                 * OCB13850
                    *NOTES-N/A                                        * OCB13860
                    *************************************************** OCB13870
                          HDNG    CORE LOAD BUILDER, PHASE 1            OCB13880
                    * MASTER CONTROL SUBROUTINE, OVERLAY 1              OCB13890
                    *                                                   OCB13900
                          BSS  E  2                                     OCB13910
                    *                                                   OCB13920
                    * INITIALIZATION                                    OCB13930
                    *                                                   OCB13940
                    IN000 DC      *-*       ENTRY POINT                 OCB13950
                          NOP                                           OCB13960
                          LDX  L1 @CLB0                                 OCB13970
                          STX  L1 $PHSE                                 OCB13980
                          LDX  L3 X3        POINT XR3 AT WORK AREA      OCB13990
                          LDX  L1 BUFLO+6                               OCB14000
                          STX  L1 IBT4X+X3  INITIALIZE                  OCB14010
                          STX  L1 IBT4X+3+X3 *FOR                       OCB14020
                          STX  L1 $LEV1     *PRINTING                   OCB14030
                          LD   L  IN925     COMPUTE                 2-2 OCB14040
                          SRA     1         *INITIAL                    OCB14050
                          S    L  IN930     *TV ENTRIES             2-2 OCB14060
                          STO   3 DISPL                                 OCB14070
                          LD   L  $WSDR                                 OCB14080
                          A    L  IN950                             2-2 OCB14090
                          STO   3 WSADR                                 OCB14100
                          LD   L  IN920                             2-2 OCB14110
                          STO  L  $IBT4     SET UP ADDR OF IBT04        OCB14120
                          LD   L  $DADR     FETCH MAINLINE BLOCK ADDR   OCB14130
                          STO   3 BYADR                                 OCB14140
                          LD   L  $DCDE     FETCH DRIVE CODE OF CART    OCB14150
                          STO   3 LDCDE     *CONTAINING MAINLINE        OCB14160
                          LD   L  $DREQ                                 OCB14170
                          STO  L  @DREQ                                 OCB14180
                          LD   L  $CIBA                                 OCB14190
                          RTE     16                                    OCB14200
                          LD    3 K320                                  OCB14210
                          STD  L  BUFLS                                 OCB14220
                          STD  L  BUFLO                                 OCB14230
                          STD  L  BUFCI                                 OCB14240
                    *                       3 INSTRUCTIONS MOVED    2-2 OCB14250
                          LD   L  IN940     PUT A NO. IN SCTRX THAT IS  OCB14260
                          STO   3 SCTRX     *OUTSIDE ITS NORMAL RANGE   OCB14270
                          LD    3 K0        INITIALIZE SO THAT LET/FLET OCB14280
                          STO   3 IGNOR     *SEARCH BEGINS ON DRIVE 0   OCB14290
                          LD    3 K8000     SET MODE SWITCH TO          OCB14300
                          STO   3 LSW09     *INDICATE IN-CORE MODE      OCB14310
                          STO   3 LSW02     SET TO PRINT FILES HEADING  OCB14320
                          LDX  I2 $DREQ                                 OCB14330
                          LD   L2 ORGIN+X3                              OCB14340
                          S    L  @HWCT                                 OCB14350
                          S     3 K2                                    OCB14360
                          STO   3 CILCA                                 OCB14370
                    *                                                   OCB14380
                    * FETCH DCOM AND EXTRACT WHAT IS                    OCB14390
                    * NEEDED BY THE CORE LOAD BUILDER                   OCB14400
                    *                                                   OCB14410
                          LD      IN915     FETCH ADDR OF DCOM          OCB14420
                          STO  L  BUFLS+1   STORE DCOM SCTR ADDR        OCB14430
                          LD    3 LSBUF                                 OCB14440
                          SRT     16                                    OCB14450
                          BSI  L  GP000     FETCH DCOM                  OCB14460
                          LDX  L1 BUFLS+2                               OCB14470
                          LDX  L2 DZ000                             2-2 OCB14480
                          STX  L2 DKISS     FLAG DISK I/O           2-2 OCB14490
                    IN006 LD    1 #X3SW                             2-2 OCB14500
                          STO   3 LX3SW                             2-2 OCB14510
                          LD    1 #FCNT                                 OCB14520
                          STO   3 LFCNT     SAVE *FILES SWITCH          OCB14530
                          LD    1 #CBSW                                 OCB14540
                          STO   3 LCBSW     SAVE CLB SWITCH             OCB14550
                          LD    1 #MPSW                                 OCB14560
                          STO   3 LMPSW     SAVE MAP SWITCH             OCB14570
                          LD    1 #LCNT                                 OCB14580
                          STO   3 LLCNT                                 OCB14590
                          LD    1 #LOSW                             2-2 OCB14600
                          STO   3 LLOSW     SAVE LOCAL SWITCH       2-2 OCB14610
                          LD    1 #NCNT                                 OCB14620
                          STO   3 LNCNT                                 OCB14630
                          LD    1 #GCNT                             2G2 OCB14640
                          STO  L  $GCOM                             2G2 OCB14650
                          LD    1 #ECNT                             2-4 OCB14660
                          STO     IN975     SAVE NO. OF EQUAT RCDS  2-4 OCB14670
                          LD    1 #SCRA                                 OCB14680
                          STO   3 LSCRA     SAVE ADDR OF SCRA           OCB14690
                          LD    1 #CIDN     SAVE                        OCB14700
                          STO   3 LCIDN     *CARTRIDGE                  OCB14710
                          LD    1 #CIDN+1   *ID NOS.                    OCB14720
                          STO   3 LCIDN+1   *FOR                        OCB14730
                          LD    1 #CIDN+2   *CARTRIDGES                 OCB14740
                          STO   3 LCIDN+2   *CURRENTLY                  OCB14750
                          LD    1 #CIDN+3   *MOUNTED                    OCB14760
                          STO   3 LCIDN+3   *ON                         OCB14770
                          LD    1 #CIDN+4   *THE                        OCB14780
                          STO   3 LCIDN+4   *SYSTEM                     OCB14790
                          LD   L  $DCDE     LEFT-JUSTIFY DR CODE FOR2-2 OCB14800
                          SRA     12        *DRIVE CONTAINING MAINLN2-2 OCB14810
                          STO   3 WASTE                             2-2 OCB14820
                          LDX  I2 WASTE+X3  DRIVE CODE TO XR2       2-2 OCB14830
                          LD   L  $DADR     CONVERT DB ADDR OF MAINL2-2 OCB14840
                          SRA     4         *TO A SECTOR ADDR       2-2 OCB14850
                    *                        INSTRUCTION REMOVED    2-2 OCB14860
                          OR   L  $DCDE                                 OCB14870
                          S    L2 $FPAD                                 OCB14880
                          BSC  L  IN015,Z   BR IF MAINLINE NOT IN WS2-2 OCB14890
                    *                                               2-2 OCB14900
                    * CHECK TO SEE IF DSF PROGRAM IS IN WORKING STRG2-2 OCB14910
                    *                                               2-2 OCB14920
                          MDX  I1 WASTE+X3  PT TO MEMBER OF QUINTPLS2-2 OCB14930
                          LD    1 #FMAT                             2-2 OCB14940
                          BSC  L  IN010,Z   BR IF NO DSF PROGRAM IN 2-2 OCB14950
                          LD    1 #WSCT                             2-2 OCB14960
                          BSC  L  IN015,Z-  BR IF NO PROGRAM IN  WS 2-2 OCB14970
                    IN010 LDX   2 MSG03                             2-2 OCB14980
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXT2-2 OCB14990
                    IN015 LD      IN960                             2-2 OCB15000
                          S     3 K1        SET CIB LIMIT FOR A     2-2 OCB15010
                          STO   3 CIBLM     *4K SYSTEM              2-2 OCB15020
                          LD      IN954     SET LOAD TABLE LIMITS   2-2 OCB15030
                          STO   3 RIGHT     *FOR A                  2-2 OCB15040
                          STO   3 LEFTX     *4 K SYSTEM             2-2 OCB15050
                          LD   L  $CORE                             2-2 OCB15060
                          S       IN960                             2-2 OCB15070
                          BSC  L  IN020,+-  BR IF IT IS A 4K SYSTEM 2-2 OCB15080
                          LD      IN955     SET LOAD TABLE LIMITS   2-2 OCB15090
                          STO   3 RIGHT     *FOR A SYSTEM           2-2 OCB15100
                          STO   3 LEFTX     *LAGER THAN 4 K         2-2 OCB15110
                          LD    3 CIBLM                             2-2 OCB15120
                          A       IN965     SET CIB LIMIT FOR A     2-2 OCB15130
                          STO   3 CIBLM     *SYSTEM LARGER THAN 4K  2-2 OCB15140
                          LD   L  $CIBA     COMPUTE CIB SCTR ADDR ON2-2 OCB15150
                          A       IN970     *WHICH TO SAVE HIGH COMM2-2 OCB15160
                          RTE     16                                2-2 OCB15170
                          LD      IN965     FETCH WORD COUNT        2-2 OCB15180
                          STD  L  @MCOR-2   WC ,SCTR ADDR TO IO AREA2-2 OCB15190
                          LD      *-2                               2-2 OCB15200
                          RTE     16                                2-2 OCB15210
                          LD    3 K1                                2-2 OCB15220
                          BSI  L  GP000     SAVE HIGH COMMON        2-2 OCB15230
                    *                        7 INSTRUCTIONS REMOVED 2-2 OCB15240
                    *                                                   OCB15250
                    * FETCH AND PROCESS THE MAINLINE HEADER             OCB15260
                    *                                                   OCB15270
                    IN020 BSI  L  RH000     FETCH MAINLINE HEADER       OCB15280
                          LDX  I1 INDEX+X3                              OCB15290
                          LDD   1 @NAME                                 OCB15300
                          SLT     2                                     OCB15310
                          STD   3 LNAME     SAVE NAME OF MAINLINE       OCB15320
                          MDX     IN060     BR AROUND CONSTANTS         OCB15330
                    *                                                   OCB15340
                    * CONSTANTS AND WORK AREAS                          OCB15350
                    *                                                   OCB15360
                    IN915 DC      @DCOM     SCTR ADDR OF DCOM           OCB15370
                    IN920 DC      IBT04-5   ADDR OF IBT04 MINUS 1       OCB15380
                    IN925 DC      @MXLB*@LBEN MAX WD CNT OF LIBF TV     OCB15390
                    IN930 DC      3*@LBEN-1 WD CNT OF 3 ENTRIES MINUS 1 OCB15400
                    IN935 DC      2*@LBEN+1 WD CNT OF 2 ENTRIES PLUS 1  OCB15410
                    IN940 DC      @SCIB+1 1+NO. SCTRS IN THE CIB        OCB15420
                    IN950 DC      SCTAD+X3                              OCB15430
                    IN954 DC      @MCOR-2*@LTEN-2                   2-2 OCB15440
                    IN955 DC      @MCOR-2-2*@LTEN+320*@HCIB         2-2 OCB15450
                    IN960 DC      @MCOR     MINIMUM CORE SUPPORTED  2-2 OCB15460
                    IN965 DC      320*@HCIB HIGH COMMON WORD COUNT  2-2 OCB15470
                    IN970 DC      @SCIB-@HCIB CIB SCTR FOR HIGH COMM2-2 OCB15480
                    IN975 DC      *-*  NO. WDS (+1) IN EQUATE TABLE 2-4 OCB15490
                    *                                                   OCB15500
                    * FETCH NAME OF MAINLINE FROM PROGRAM HEADER        OCB15510
                    *                                                   OCB15520
                    IN060 LD    1 @NAME+1                               OCB15530
                          SRT     16                                    OCB15540
                          LD    1 @NAME                                 OCB15550
                          SLT     2                                     OCB15560
                          STD   3 LNAME     SAVE NAME OF ML             OCB15570
                          LD    1 @TYPE                                 OCB15580
                          SRA     8                                     OCB15590
                          STO   3 LTYPE     SAVE PROGRAM TYPE (1 OR 2)  OCB15600
                          LD    1 @PREC                                 OCB15610
                          SLA     8                                     OCB15620
                          STO   3 LPREC     SAVE PRECISION              OCB15630
                          LD    1 @FORT                                 OCB15640
                          STO   3 LFORT     SAVE FORTRAN FLAG           OCB15650
                          SLA     8                                     OCB15660
                          SRA     8                                     OCB15670
                          STO  L  @FILE     SAVE NO. FILES DEFINED      OCB15680
                          BSC  L  IN160,Z   BRANCH IF THERE ARE FILES   OCB15690
                          STX  L0 LSW06+X3  SET DEFINE FILE SWITCH      OCB15700
                    *                                                   OCB15710
                    * PROCESS MAINLINE HEADER INFORMATION               OCB15720
                    *                                                   OCB15730
                    IN160 LD    1 @COMN                                 OCB15740
                          STO  L  @CMON                                 OCB15750
                          LD    3 LTYPE                                 OCB15760
                          S     3 K1                                    OCB15770
                          LDX  I2 $DREQ     DISK CODE TO XR2            OCB15780
                          BSC  L  IN300,Z+  BR IF TYPE LESS THAN 1      OCB15790
                          BSC  L  IN270,+-  BR IF TYPE=1,I.E.,ML ABS    OCB15800
                          S     3 K1                                    OCB15810
                          BSC  L  IN300,Z   BR IF TYPE GREATER THAN 2   OCB15820
                          LD   L2 ORGIN+X3                              OCB15830
                          STO   3 RELOC     SET RELOCATION FACTOR       OCB15840
                          STO   3 MLWD1                                 OCB15850
                          A     1 @ENTY                                 OCB15860
                          STO  L  @XEQA     SAVE EXECUTION ADDR         OCB15870
                          STO   3 RNAME                                 OCB15880
                          S    L  @HWCT                                 OCB15890
                          S     1 @ENTY                                 OCB15900
                          STO  L  @LDAD     STORE LOADING ADDRESS       OCB15910
                          LD   L  $DREQ                                 OCB15920
                          BSC  L  IN190,-   BR UNLESS DISKZ UTILIZED    OCB15930
                          LD   L  @LDAD                                 OCB15940
                          BSC  L  IN200,E   BR IF LOAD ADDR IS ODD      OCB15950
                    IN190 LD    3 RNAME                                 OCB15960
                          S    L2 ORGIN+X3  BRANCH IF EXECUTION ADDRESS OCB15970
                          BSC  L  IN210,-   *IS LEGAL                   OCB15980
                    IN200 LDX   2 MSG46     CORE LOAD EXEC ADDR TOO LOW OCB15990
                          BSI  L  TL000     PRINT MESSAGE R46 AND EXIT  OCB16000
                    *                                                   OCB16010
                    * INITIALIZE                                        OCB16020
                    *                                                   OCB16030
                    IN210 LD   L  $CORE     COMPUTE RIGHTMOST ADDRESS   OCB16040
                          STO  L  @CORE                                 OCB16050
                          S    L  @CMON     *OF LIBF TV                 OCB16060
                          S       IN935     ACCOUNT FOR FAC,IND TV ENTS OCB16070
                          STO   3 RLCOR     SET AVAILABLE CORE          OCB16080
                          STO   3 CALTV     SET CALL TV ADDR            OCB16090
                          LD    3 K1                                    OCB16100
                          STO  L  @ITVX+2   ASSURE THAT ILS02 PROCESSED OCB16110
                          STO  L  @ITVX+4   ASSURE THAT ILS04 PROCESSED OCB16120
                    *                                               2-4 OCB16130
                    * PROCESS *EQUAT ENTRIES                        2-4 OCB16140
                    *                                               2-4 OCB16150
                          LD      IN975                             2-4 OCB16160
                          BSI  L  EQ000,Z-  BR IF THERE ARE ENTRIES 2-4 OCB16170
                    *                                               2G2 OCB16180
                    *  CHECK GSP INDICATOR. IF ON PROCESS G2250 REC 2G2 OCB16190
                    *                                               2G2 OCB16200
                          LD   L  $GCOM                             2G2 OCB16210
                          BSI  L  GR000,Z-  BR IF INDICATOR ON      2G2 OCB16220
                    *                                               2G2 OCB16230
                    *                                                   OCB16240
                    * PROCESS *LOCAL AND *NOCAL RECORDS                 OCB16250
                    *                                                   OCB16260
                          MDX  L  LLCNT+X3,0 SKIP IF NO LOCALS          OCB16270
                          MDX     *+2       BR TO PROCESS *LOCAL/*NOCAL OCB16280
                          MDX  L  LNCNT+X3,0 SKIP IF NO NOCALS          OCB16290
                          BSI     LN000     BR TO PROCESS *LOCAL/*NOCAL OCB16300
                          LDX   1 @MXDR     LOAD NUMBER OF DRIVES       OCB16310
                    IN250 LD   L1 $FPAD-1                               OCB16320
                          STO  L1 SCTAD+X3-1                            OCB16330
                          MDX   1 -1        DECREMENT DRIVE COUNT       OCB16340
                          MDX     IN250     BRANCH IF NOT ZERO          OCB16350
                          LDX  I1 $WSDR                                 OCB16360
                          LD   L1 $FPAD                                 OCB16370
                          STO   3 FSCTR                                 OCB16380
                          LD   L  $CIBA     INITIALIZE SECTOR ADDR IN   OCB16390
                          STO  L  BUFCI+1   *CIB BUFFER                 OCB16400
                          LDX  L1 MC000     ENTRY POINT TO PHASE 2      OCB16410
                          STX  L1 LK000     SIMULATE A BSI TO LK000     OCB16420
                          LDX   1 @CLB2                                 OCB16430
                          BSC  L  LK000+1   FETCH PHASE 2               OCB16440
                    *                                                   OCB16450
                    * SET RELOCATION FACTOR AND EXEC ADDR FOR ML ABS    OCB16460
                    *                                                   OCB16470
                    IN270 STO   3 RELOC     ZERO TO RELOCATION FACTOR   OCB16480
                          LD    1 @ENTY                                 OCB16490
                          STO  L  @XEQA                                 OCB16500
                          MDX     IN210                                 OCB16510
                    *                                                   OCB16520
                    * MAINLINE IS NOT TYPE 1 OR 2                       OCB16530
                    *                                                   OCB16540
                    IN300 LDD   3 LNAME                                 OCB16550
                          STD   3 RNAME                                 OCB16560
                          LDX   2 MSG66                                 OCB16570
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXIT   OCB16580
                          HDNG    CORE LOAD BUILDER, PHASE 1            OCB16590
                    * FETCH EQUATE TABLE FROM SCRA                  2-4 OCB16600
                    *                                               2-4 OCB16610
                    EQ000 DC      *-*       ENTRY POINT             2-4 OCB16620
                          LD    3 LSCRA                             2-4 OCB16630
                          A       EQ905                             2-4 OCB16640
                          SLA     4         SET UP DB ADDR OF EQUATE2-4 OCB16650
                          STO   3 BYADR     *TABLE                  2-4 OCB16660
                          LD    3 CIBLM     FORCE INDEX TO POINT    2-4 OCB16670
                          STO   3 INDEX     *OUTSIDE DATA BUFFER    2-4 OCB16680
                          LD    3 K0        SET SWITCH SO THAT NW TA2-4 OCB16690
                          STO   3 LSW14     *DB ADDR FROM BYADDR    2-4 OCB16700
                          STO   3 LDCDE     SET DRIVE CODE TO ZERO  2-4 OCB16710
                          LD    3 LOBUF     SET UP TO READ EQUATE   2-4 OCB16720
                          STO   3 BUFFR     *SECTOR INTO DATA BUFFER2-4 OCB16730
                          BSI  L  NW000     FETCH WD CNT OF TABLE   2-4 OCB16740
                          BSC  L  EQ200,+   BRANCH IF CNT ZERO     2-10 OCB16750
                          EOR     EQ900     SET TO NEG NO. OF       2-4 OCB16760
                          A     3 K2        *WORDS IN EQUAT TABLE   2-4 OCB16770
                          STO   3 EQCNT                             2-4 OCB16780
                          LDX  I1 EQCNT+X3  COMPLEMENTED WD CNT TO X2-4 OCB16790
                    EQ100 BSI  L  NW000     FETCH A WD OF EQUATE TAB2-4 OCB16800
                          STO   3 NAME      *AND STORE IN CORE      2-4 OCB16810
                          BSI  L  NW000     FETCH 2ND WD OF NAME    2-4 OCB16820
                          RTE     16                                2-4 OCB16830
                          LD    3 NAME                              2-4 OCB16840
                          STD  L1 EQTBL     SAVE LEFT SIDE OF EQU EN2-4 OCB16850
                          BSI  L  NW000     FETCH 1ST WD OF NAME    2-4 OCB16860
                          STO   3 NAME                              2-4 OCB16870
                          BSI  L  NW000     FETCH 2ND WD OF NAME    2-4 OCB16880
                          RTE     16                                2-4 OCB16890
                          LD    3 NAME      COMBINE                 2-4 OCB16900
                          STD  L1 EQTBL+2   SAVE RT SIDE OF EQU ENTR2-4 OCB16910
                          MDX   1 @EETY     SKIP AFTER LAST ENTRY   2-4 OCB16920
                          MDX     EQ100     BR TO FETCH NEXT WORD   2-4 OCB16930
                    EQ200 LD   L  $DADR     RESTORE SEC ADDR TO    2-10 OCB16940
                          STO   3 BYADR     *POINT AT MAIN LINE     2-4 OCB16950
                          LD   L  $DCDE     RESTORE DRIVE CODE      2-4 OCB16960
                          STO   3 LDCDE     *OF MAINLINE            2-4 OCB16970
                          BSI  L  RH000     RESTORE MAINLINE HEADER 2-4 OCB16980
                    *                                               2-4 OCB16990
                          BSC  I  EQ000     RETURN                  2-4 OCB17000
                    *                                               2-4 OCB17010
                    * CONSTANTS AND WORK AREAS                      2-4 OCB17020
                    *                                               2-4 OCB17030
                    EQ900 DC      /FFFF     CONSTANT FOR COMPLEMENTI2-4 OCB17040
                    EQ905 DC      @EQAD     RLTN ADDR OF *EQUAT SCTR2-4 OCB17050
                          HDNG    CORE LOAD BUILDER, PHASE 1            OCB17060
                    * ENTER ALL LOCAL/NOCAL NAMES IN THE LOAD TABLE     OCB17070
                    *                                                   OCB17080
                    LN000 DC      *-*                                   OCB17090
                          STX  L1 LN430+1   SAVE XR1                    OCB17100
                          LD    3 LLCNT                                 OCB17110
                          BSC  L  LN350,+-  BR IF NO LOCALS             OCB17120
                          LD    3 LSCRA     COMPUTE ADDR OF             OCB17130
                          A       LN905     COMPUTE ADDR OF         2-4 OCB17140
                    LN030 SLA     4         *LOCAL/NOCAL SECTOR TO BE   OCB17150
                          STO   3 BYADR     *READ NEXT                  OCB17160
                          LD    3 CIBLM     FORCE INDEX TO POINT    2-2 OCB17170
                          STO   3 INDEX     *OUTSIDE DATA BUFFER        OCB17180
                          LD    3 K0        SET SWITCH SO THAT NW TAKES OCB17190
                          STO   3 LSW14     *DISK BLOCK ADDR FROM BYADR OCB17200
                          STO   3 LDCDE     SET DR CODE TO ZERO     2-2 OCB17210
                          LD    3 LOBUF     SET UP TO READ LOCAL/NOCAL  OCB17220
                          STO   3 BUFFR     *SECTOR INTO DATA BUFFER    OCB17230
                    LN050 BSI  L  NW000     FETCH BLOCK WORD COUNT      OCB17240
                          STO     LN910     SAVE WORD BLOCK COUNT. 2-11 OCB17250
                          BSC  L  LN070,-   BR. IF POS. WORD COUNT 2-11 OCB17260
                          SLA     1         CLEAR SIGN BIT              OCB17270
                          SRA     1                                     OCB17280
                    LN070 BSC  L  LN350,+-  BR IF WORD COUNT IS ZERO    OCB17290
                          STO     LN900     SAVE POSITIVE WORD COUNT    OCB17300
                          BSI  L  NW000     FETCH AND STORE 1ST WORD    OCB17310
                          STO   3 NAME      *OF MAINLINE NAME           OCB17320
                          BSI  L  NW000     FETCH AND STORE 2ND WORD    OCB17330
                          STO   3 NAME+1    *OF MAINLINE NAME           OCB17340
                          LDD   3 NAME                                  OCB17350
                          SLT     2                                     OCB17360
                          SD    3 LNAME                                 OCB17370
                          LDX  I1 LN900     BLOCK WORD COUNT MINUS 3    OCB17380
                          MDX   1 -3                                    OCB17390
                          NOP               MAY SKIP                2-6 OCB17400
                          BSC  L  LN090,Z   BR ON NO MATCH OF NAMES     OCB17410
                          RTE     16                                    OCB17420
                          BSC  L  LN140,+-  BR IF NAME MATCHES ML NAME  OCB17430
                    LN090 LD      LN910     BRANCH IF CURRENT BLOCK     OCB17440
                          BSC  L  LN350,Z+  *IS LAST BLOCK              OCB17450
                    LN100 BSI  L  NW000     PASS OVER ALL LOCAL/NOCAL   OCB17460
                          MDX   1 -1        *NAMES IN CURRENT BLOCK,    OCB17470
                          MDX     LN100     *SKIPPING AFTER FETCHING    OCB17480
                          MDX     LN050     *NEXT BLOCK WORD COUNT      OCB17490
                    *                                                   OCB17500
                    * CONSTANTS AND WORK AREAS                          OCB17510
                    *                                                   OCB17520
                    LN900 DC      *-*  WD CNT FOR CURR BLOCK (W/O SIGN) OCB17530
                    LN905 DC      @LOAD     RLTV ADDR OF *LOCAL SCTR2-4 OCB17540
                    LN910 DC      *-*  WD CNT FOR CURR BLOCK (W/ SIGN)  OCB17550
                    LN915 DC      @NOAD     RLTV ADDR OF *NOCAL SCTR2-4 OCB17560
                    LN920 DC      /8000 SWITCH--/8000=LOCAL, ZERO=NOCAL OCB17570
                    LN930 DC      @TYPE RELATIVE ADDR OF PROG TYPE      OCB17580
                    LN940 DC      0    ABORT SWITCH--NON-ZERO = ABORT   OCB17590
                    LN950 DC      *-*  POINTER IN DATA BUFFER FOR LOCAL OCB17600
                    LN960 DC      *-*  DISK BLOCK ADDR OF LOCAL         OCB17610
                    LN970 DC      *-*  ADDR OF NEXT SCTR IN SEQUENCE    OCB17620
                    LN980 DC      BUFLO ADDR OF DATA BUFFER             OCB17630
                    LN990 DC      /13  TYPE 3, SUBTYPE 1                OCB17640
                          DC      /35  TYPE 5, SUBTYPE 3                OCB17650
                          DC      /84  TYPE 4, SUBTYPE 8                OCB17660
                    *                                                   OCB17670
                    *                                                   OCB17680
                    *                                                   OCB17690
                    LN140 LD      LN920                                 OCB17700
                          BSC  L  LN150,-   BR IF PROCESSING NOCALS     OCB17710
                          LD    3 K1        SET LOCAL/SOCAL SW TO       OCB17720
                          STO  L  @OVSW     *INDICATE LOCALS            OCB17730
                    LN150 BSI  L  NW000     FETCH 1ST WD LOCAL/NOCAL    OCB17740
                          STO   3 NAME      *NAME                       OCB17750
                          BSI  L  NW000     FETCH AND SAVE 2ND WORD OF  OCB17760
                          STO   3 NAME+1    *LOCAL/NOCAL NAME           OCB17770
                          LD    3 INDEX     SAVE POINTER FOR LOCAL RECD OCB17780
                          STO     LN950     RESTORE POINTER             OCB17790
                          LD    3 NEXT      SAVE SECTOR ADDRESS         OCB17800
                          STO     LN970                                 OCB17810
                          LD    3 BYADR     SAVE DISK BLOCK ADDR        OCB17820
                          STO     LN960     *OF LOCAL RECORD            OCB17830
                          BSI  L  ES000     CK FOR EQUAT,SEARCH LET2-10 OCB17840
                    *                       *UPON RETURN, ACC =     212 OCB17850
                    *                       *LET/FLET INDR (LSW22)  212 OCB17860
                          BSC  L  LN300,Z+  BR IF NOT IN LET        212 OCB17870
                          LD    3 DRCDE                                 OCB17880
                          STO   3 LDCDE                                 OCB17890
                          LD    3 CIBLM     FORCE INDEX TO POINT    2-2 OCB17900
                          STO   3 INDEX     *OUTSIDE DATA BUFFER        OCB17910
                          LD    3 K0        SET SWITCH SO THAT NW TAKES OCB17920
                          STO   3 LSW14     *DISK BLOCK ADDR FROM BYADR OCB17930
                          LD    3 CIBBF     SET UP TO READ HEADER OF    OCB17940
                          STO   3 BUFFR     *LOCAL INTO CIB BUFFER      OCB17950
                          STO   3 LOBUF                                 OCB17960
                          BSI  L  NW000     FETCH LOCAL HEADER RECD     OCB17970
                          LD      LN970     RESTORE SECTOR ADDRESS      OCB17980
                          STO   3 NEXT                                  OCB17990
                          LD      LN980                                 OCB18000
                          STO   3 LOBUF                                 OCB18010
                    *                                                   OCB18020
                    * CHECK THAT TYPE IS 3-6, /13, /23, /33, /43,OR /84 OCB18030
                    *                                                   OCB18040
                          LDD   3 NAME                                  OCB18050
                          SLT     2                                     OCB18060
                          STD   3 RNAME                                 OCB18070
                          LD    3 INDEX                                 OCB18080
                          A       LN930     COMPUTE AND STORE CORE ADDR OCB18090
                          STO     *+1       *OF TYPE AND SUBTYPE CODES  OCB18100
                          LD   L  *-*       FETCH TYPE/SUBTYPE CODES    OCB18110
                          SRA     8                                     OCB18120
                          STO   3 WASTE                                 OCB18130
                          S     3 K3        BRANCH IF TYPE/SUBTYPE LESS OCB18140
                          BSC  L  LN180,Z+  *THAN 03                    OCB18150
                          BSC  L  LN500,+-  BR IF EQUAL TO 03           OCB18160
                          S     3 K3        BRANCH IF TYPE/SUBTYPE      OCB18170
                          BSC  L  LN550,+-  *EQUAL TO 06                OCB18180
                          A     3 K1        BRANCH IF                   OCB18190
                          BSC  L  LN500,+-  *EQUAL TO 05                OCB18200
                          BSC  L  LN550,Z+  BR IF EQUAL TO 04           OCB18210
                          LD    3 WASTE                                 OCB18220
                          S       LN990                                 OCB18230
                          BSC     Z         SKIP   IF TYPE/SUBTYPE=/13  OCB18240
                          S     3 K16                                   OCB18250
                          BSC     Z         SKIP   IF TYPE/SUBTYPE=/23  OCB18260
                          S     3 K16                                   OCB18270
                          BSC  L  LN500,+-  BRANCH IF TYPE/SUBTYPE=/33  OCB18280
                          LD    3 WASTE                                 OCB18290
                          S       LN990+2                               OCB18300
                          BSC  L  LN550,+-  BRANCH IF TYPE/SUBTYPE=/84  OCB18310
                          LD    3 WASTE                                 OCB18320
                          S       LN990+1                               OCB18330
                          BSC  L  LN500,+-  BR IF TYPE 35               OCB18340
                    *                                                   OCB18350
                    * PRINT AN ERROR MESSAGE AND SET NON-DUP, NON-XEQAD OCB18360
                    *                                                   OCB18370
                    LN180 LDX   2 MSG17                                 OCB18380
                          LD    3 K1                                    OCB18390
                          STO     LN940     SET ABORT SWITCH            OCB18400
                          BSI  L  PM000     PRINT MESSAGE R17           OCB18410
                    LN300 LD      LN920                                 OCB18420
                          BSC  L  LN315,-   BRANCH IF PROCESSING NOCALS OCB18430
                          LD    3 K1        SET OVERLAY SWITCH          OCB18440
                          STO   3 LSW19     *FOR FORTRAN                OCB18450
                    LN315 LD   L  LN950                                 OCB18460
                          STO   3 INDEX                                 OCB18470
                          LD   L  LN960     RESTORE DISK BLOCK ADDR     OCB18480
                          STO   3 BYADR                                 OCB18490
                          LD    3 LOBUF     RESTORE BUFFER ADDRESS      OCB18500
                          STO   3 BUFFR                                 OCB18510
                          BSI  L  BT000     ENTER LOCAL/NOCAL IN LD TBL OCB18520
                          LD    3 K0                                    OCB18530
                          STO   3 LDCDE                                 OCB18540
                          MDX   1 -2        SKIP AT END OF BLOCK        OCB18550
                          MDX     LN150     BR IF NOT END OF BLOCK      OCB18560
                          LD   L  LN910     BRANCH UNLESS THIS WAS      OCB18570
                          BSC  L  LN050,-   *THE LAST BLOCK             OCB18580
                    LN350 LD   L  LN920     BRANCH IF DONE, I.E., NOCAL OCB18590
                          BSC  L  LN400,-   *RECORD IS PROCESSED        OCB18600
                          LD    3 K0        CHANGE SWITCH FROM          OCB18610
                          STO  L  LN920     */8000 TO ZERO              OCB18620
                          LD    3 LNCNT                                 OCB18630
                          BSC  L  LN400,+-  BRANCH IF NO NOCALS         OCB18640
                          LD    3 LSCRA     PREPARE TO FETCH NOCAL      OCB18650
                          A       LN915     *RECORD                 2-4 OCB18660
                          BSC  L  LN030     BR TO FETCH NEXT SCTR       OCB18670
                    LN400 LD   L  LN940                                 OCB18680
                          LDX   2 -1                                    OCB18690
                          BSI  L  TL000,Z   BRANCH IF INVALID LOCAL(S)  OCB18700
                          LD   L  $DADR                                 OCB18710
                          STO   3 BYADR                                 OCB18720
                          LD   L  $DCDE     RESTORE DRIVE CODE          OCB18730
                          STO   3 LDCDE     *OF MAINLINE                OCB18740
                          LD   L  BUFLO+1   SAVE ADDR OF SECTOR NOW     OCB18750
                          STO   3 SADDR     *IN DATA BUFFER             OCB18760
                          BSI  L  RH000     RESTORE MAINLINE HEADER     OCB18770
                    LN430 LDX  L1 *-*                                   OCB18780
                          BSC  I  LN000     RETURN                      OCB18790
                    LN500 LD    3 K0        FLAG A LIBF                 OCB18800
                    LN520 OR   L  LN920     FLAG NOCAL OR LOCAL         OCB18810
                          OR    3 NAME                                  OCB18820
                          STO   3 NAME                                  OCB18830
                          MDX     LN300     BR TO CONTINUE PROCESSING   OCB18840
                    LN550 LD    3 K4000     FLAG A CALL                 OCB18850
                          MDX     LN520     BR TO FLAG THE NAME         OCB18860
                          HDNG    CORE LOAD BUILDER,PHASE 1             OCB18870
                    *  GR SUBROUTINE FOR C.L.B. PHASE 1             2G2 OCB18880
                    *                                               2G2 OCB18890
                    *  THIS SUBROUTINE ENTERS THE GSP SUPPORT       2G2 OCB18900
                    *  SUBROUTINE NAMES IN THE LOAD TABLE AS        2G2 OCB18910
                    *  THE FIRST IN-CORE TYPE SUBROUTINES.          2G2 OCB18920
                    *                                               2G2 OCB18930
                    *                                               2G2 OCB18940
                    GR000 DC      *-*       ENTRY POINT             2G2 OCB18950
                          STX   1 GR060+1   SAVE XR1                2G2 OCB18960
                    *                                               2G2 OCB18970
                    *                                               2G2 OCB18980
                    *                                               2G2 OCB18990
                          LD    3 LSCRA     COMPUTE ADDR OF         2G2 OCB19000
                          A       GR905     *G2250 SECTOR TO        2-4 OCB19010
                          SLA     4         *BE READ NEXT           2G2 OCB19020
                          STO   3 BYADR                             2G2 OCB19030
                          LD    3 K0        SET DRIVE CODE          2G2 OCB19040
                          STO   3 LDCDE     *FOR MASTER             2G2 OCB19050
                          BSI  L  RH000     READ G2250 SECTOR INTO  2G2 OCB19060
                    *                       *DATA BUFFER            2G2 OCB19070
                    *                                               2G2 OCB19080
                    GR030 STO     GR900     SAVE POSITIVE WORD COUNT2G2 OCB19090
                          BSI  L  NW000     FETCH AND STORE 1ST WORD2G2 OCB19100
                          STO   3 NAME      *OF MAINLINE NAME       2G2 OCB19110
                          BSI  L  NW000     FETCH AND STORE 2ND WORD2G2 OCB19120
                          STO   3 NAME+1    *OF MAINLINE NAME       2G2 OCB19130
                          LDX  I1 GR900     RECORD WORD COUNT       2G2 OCB19140
                          MDX   1 -3        DECR. 3 WORDS           2G2 OCB19150
                          LDD   3 NAME                              2G2 OCB19160
                          SLT     2                                 2G2 OCB19170
                          SD    3 LNAME                             2G2 OCB19180
                          BSC  L  GR050,Z   BR IF NO MATCH          2G2 OCB19190
                          RTE     16                                2G2 OCB19200
                          BSC     +-        SKIP IF NAMES NOT THE SA2G2 OCB19210
                          MDX     GR100     BR IF SAME              2G2 OCB19220
                    *                                               2G2 OCB19230
                    *                                               2G2 OCB19240
                    GR050 BSI  L  NW000     PASS OVER REST OF G2250 2G2 OCB19250
                          MDX   1 -1        *SUBRTN NAMES TO LOOK AT2G2 OCB19260
                          MDX     GR050     *NEXT RECORD, IF ANY.   2G2 OCB19270
                          BSI  L  NW000                             2G2 OCB19280
                          BSC  L  GR030,Z-  BR IF NEXT REC COUNT POS2G2 OCB19290
                    *                                               2G2 OCB19300
                    *                                               2G2 OCB19310
                    GR055 LD   L  $DADR                             2G2 OCB19320
                          STO   3 BYADR                             2G2 OCB19330
                          LD   L  $DCDE                             2G2 OCB19340
                          STO   3 LDCDE                             2G2 OCB19350
                          BSI  L  RH000                             2G2 OCB19360
                    GR060 LDX  L1 *-*       RESTORE XR1             2G2 OCB19370
                          BSC  I  GR000     RETURN                  2G2 OCB19380
                    *                                               2G2 OCB19390
                    *  CONSTANTS                                    2G2 OCB19400
                    *                                               2G2 OCB19410
                    GR900 DC      *-*       RECORD WORD COUNT       2G2 OCB19420
                    GR905 DC      @GRAD     RLTV ADDR OF *G2250 SCTR2-4 OCB19430
                    *                                               2G2 OCB19440
                    GR100 BSI  L  NW000     FETCH AND STORE 1ST WORD2G2 OCB19450
                          STO   3 NAME      *OF G2250 SUBRTN        2G2 OCB19460
                          BSI  L  NW000     FETCH AND STORE 2ND WORD2G2 OCB19470
                          STO   3 NAME+1    *OF G2250 SUBRTN        2G2 OCB19480
                    *                                               2-9 OCB19490
                          BSI     ES000     CK FOR EQUAT,SEARCH LET2-10 OCB19500
                    *                                               2G2 OCB19510
                          LD    3 K4000     FLAG AS A CALL          2G2 OCB19520
                          OR    3 NAME      *THE FIRST WORD (BIT 1) 2G2 OCB19530
                          STO   3 NAME      *OF G2250 SUBRTN NAME   2G2 OCB19540
                    *                                               2G2 OCB19550
                    *                                               2G2 OCB19560
                          BSI  L  BT000     ENTER G2250 SUBRTN NAME 2G2 OCB19570
                    *                       *IN LOAD TABLE          2G2 OCB19580
                    *                                               2G2 OCB19590
                          MDX   1 -2        DECR WORD COUNT TO      2G2 OCB19600
                          MDX     GR100     *FETCH NEXT G2250 SUBRTN2G2 OCB19610
                          MDX     GR055     *OR RETURN IF END OF REC2G2 OCB19620
                          HDNG    CORE LOAD BUILDER, PHASE 1            OCB19630
                    *                                              2-10 OCB19640
                    *  SEARCH EQUAT TABLE FOR ROUTINES             2-10 OCB19650
                    *  AND LOOK UP FINAL NAME IN LET.              2-10 OCB19660
                    *                                              2-10 OCB19670
                    ES000 DC      *-*       ENTRY POINT            2-10 OCB19680
                          LD    3 EQCNT     BRANCH IF              2-10 OCB19690
                          BSC  L  ES300,+-  *NO EQUAT TABLE        2-10 OCB19700
                          STX   1 ES200+1   SAVE XR1               2-10 OCB19710
                          LDX  I1 EQCNT+X3  COMPLEMENTED WD CNT    2-10 OCB19720
                    ES125 LDD   3 NAME      COMPARE CURRENT NAME   2-10 OCB19730
                          SD   L1 EQTBL     *WITH EQUAT TBL ENTRY  2-10 OCB19740
                          BSC     +-        SKIP IF UNEQUAL        2-10 OCB19750
                          RTE     16        CHECK 2ND WD           2-10 OCB19760
                          BSC  L  ES175,Z   BRANCH IF NO MATCH     2-10 OCB19770
                          LDD  L1 EQTBL+2   REPLACE NAME EQUATED   2-10 OCB19780
                          STD   3 NAME      *WITH NEW NAME         2-10 OCB19790
                          MDX     ES200                            2-10 OCB19800
                    ES175 MDX   1 @EETY     SKIP IF NO MATCH       2-10 OCB19810
                          MDX     ES125     LOOP THRU TBL          2-10 OCB19820
                    ES200 LDX  L1 *-*       RESTORE XR1            2-10 OCB19830
                    ES300 LD      *-1       LOAD NEGATIVE NUMBER    212 OCB19840
                          STO   3 LSW23     SET EQUATE INDICATOR    212 OCB19850
                          BSI  L  LS000     LOOK UP NAME IN LET     212 OCB19860
                    *                       *UPON RETURN, ACC =     212 OCB19870
                    *                       *LET/FLET INDR (LSW22)  212 OCB19880
                    *                                              2-10 OCB19890
                          BSC  I  ES000     RETURN                 2-10 OCB19900
                    *                                              2-10 OCB19910
                    *  THE FOLLOWING PATCH AREA IS DESIGNED SO     2-10 OCB19920
                    *  THIS PHASE IS AN INTEGRAL NO. OF SECTORS.   2-10 OCB19930
                    *                                              2-10 OCB19940
                          BSS     6*320+LS000-*-1  PATCH AREA       2-8 OCB19950
                          DC      0         PATCH AREA                  OCB19960
                    P1END EQU     *-1                                   OCB19970
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB19980
                    *************************************************** OCB19990
                    *STATUS -VERSION 2, MODIFICATION LEVEL 12         * OCB20000
                    *                                                 * OCB20010
                    *FUNCTION/OPERATION-                              * OCB20020
                    *   * PHASE 2 IS READ INTO CORE       AT THE END  * OCB20030
                    *     OF INITIALIZATION. IT OVERLAYS PHASE 1 AND  * OCB20040
                    *     ITS SUBROUTINES MC000, RL000, TS000,     2-8* OCB20050
                    *     CQ000, TR000, XC000, AND DC000           2-8* OCB20060
                    *     REMAIN IN CORE FOR THE REMAINDER         2-8* OCB20070
                    *     OF THE PROCESS.                          2-8* OCB20080
                    *     * MC000-THE MASTER CONTROL SUPPLIES THE     * OCB20090
                    *       BASIC LOGIC. HERE THE FLOW OF THE CORE    * OCB20100
                    *       LOAD BUILDING PROCESS CAN BE FOLLOWED.    * OCB20110
                    *     * RL000-PERFORMS    THE ACTUAL RELOCATION.  * OCB20120
                    *       IT DETERMINES FROM THE INDICATOR WORD IN  * OCB20130
                    *       THE CURRENT DSF BLOCK AND INFORMATION     * OCB20140
                    *       EXTRACTED FROM THE PROGRAM HEADER HOW TO  * OCB20150
                    *       RELOCATE DATA WORDS, PUT   NEW ENTRIES IN * OCB20160
                    *       THE LOAD TABLE, PROCESS LIBF, CALL AND DSA* OCB20170
                    *       STATEMENTS.                               * OCB20180
                    *     * TR000-TRANSFERS A RELOCATED WORD OF THE   * OCB20190
                    *       CORE LOAD TO CORE, THE CIB BUFFER, OR     * OCB20200
                    *       WORKING STORAGE.                          * OCB20210
                    *                                                 * OCB20220
                    *ENTRY POINTS-                                    * OCB20230
                    *   * THERE IS ONE ENTRY POINT TO EACH  SUBROUTINE* OCB20240
                    *             BSI  L  XX000                       * OCB20250
                    *     WHERE XX000 IS THE FIRST EXECUTABLE INSTRUC-* OCB20260
                    *     TION IN THE SUBROUTINE                      * OCB20270
                    *                                                 * OCB20280
                    *INPUT-                                           * OCB20290
                    *   * THE MAINLINE AND ITS RELATED SUBROUTINES.   * OCB20300
                    *                                                 * OCB20310
                    *OUTPUT-                                          * OCB20320
                    *   * A CORE LOAD                                 * OCB20330
                    *                                                 * OCB20340
                    *EXTERNAL REFECENCES-                             * OCB20350
                    *   * SUBROUTINES-                                * OCB20360
                    *     * BT000-ENTER NAME IN LOAD TABLE            * OCB20370
                    *     * CC000-CONTROL LOADING OF SUBROUT. BY TYPE * OCB20380
                    *     * CN000-TEST A SUBROUTINE NAME FOR DISK I/O * OCB20390
                    *     * ET000-COMPUTE CORE AVAILABLE              * OCB20400
                    *     * EX000-PRINT A MESSAGE AND EXIT            * OCB20410
                    *     * GP000-GET/PUT DISK SUBROUTINE             * OCB20420
                    *     * IL000-RELOCATE AN ILS                     * OCB20430
                    *     * LK000-FETCH A PHASE                       * OCB20440
                    *     * LS000-FIND NAME IN LET/FLET               * OCB20450
                    *     * NW000-FETCH A WORD FROM DATA BUFFER       * OCB20460
                    *     * PL000-CREATE FLIPPER TBL, RELOCATE FLIPR  * OCB20470
                    *     * PM000-FLIPPER FOR PRINTING MESSAGE        * OCB20480
                    *     * PS000-PROCESS SOCALS                      * OCB20490
                    *     * TL000-PRINT A MESSAGE AND TERMIN. LOADING * OCB20500
                    *     * TP000-TERMINAL PROCESSING                 * OCB20510
                    *     * TV000-CREATE THE TRANSFER VECTOR          * OCB20520
                    *   * COMMA/DCOM-                                 * OCB20530
                    *     * $CIBA                                     * OCB20540
                    *     * $CORE                                     * OCB20550
                    *     * $FPAD                                     * OCB20560
                    *     * $STOP                                     * OCB20570
                    *     * $UFDR                                     * OCB20580
                    *     * $WSDR                                     * OCB20590
                    *                                                 * OCB20600
                    *EXITS-                                           * OCB20610
                    *   *NORMAL-                                      * OCB20620
                    *     * BACK TO CALLER INDIRECTLY VIA FIRST WORD  * OCB20630
                    *   * ERROR-                                      * OCB20640
                    *     * TO SUBROUTINE PM000 WITH MESSAGE NUMBER   * OCB20650
                    *       IN XR2.                                   * OCB20660
                    *                                                 * OCB20670
                    *TABLES/WORK AREAS                                * OCB20680
                    *   * RCOM                                        * OCB20690
                    *   * LOAD TABLE                                  * OCB20700
                    *                                                 * OCB20710
                    *NOTES-N/A                                        * OCB20720
                    *************************************************** OCB20730
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB20740
                    * MASTER CONTROL SUBROUTINE, OVERLAY 2              OCB20750
                    *                                                   OCB20760
                    *                                                   OCB20770
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB20780
                    *                                                   OCB20790
                          ORG     IN000-2                               OCB20800
*SBRKGL  79         *CORE LOAD BUILDER, PHASE 2                   V2M04 OCB20810
                          DC      P2END-*-1 PHASE 2 WD CNT              OCB20820
                          DC      @CLB2     PHASE 2 ID NO.              OCB20830
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB20840
                    MC000 EQU     *         ENTRY POINT             212 OCB20850
                          BSI  L  RL000     RELOCATE MAINLINE PROGRAM   OCB20860
                          BSI  L  CK000     CHECK LENGTH OF COMMON      OCB20870
                    *                                                   OCB20880
                    * START PASS 1 OF THE CORE LOAD BUILDING PROCESS    OCB20890
                    *                                                   OCB20900
                    MC030 LDX   1 @CLB3                                 OCB20910
                          BSI  L  LK000     FETCH CORE LOAD BLDR, PH 3  OCB20920
                          LDX  I2 LBATV+X3                              OCB20930
                          LDX  I1 RIGHT+X3                              OCB20940
                          LD    3 RIGHT     INITIALIZE TO 1ST           OCB20950
                          STO   3 CURTV     *ENTRY IN LOAD TABLE        OCB20960
                          LD    3 LBATV     IS THERE ANY ENTRIES IN 2-2 OCB20970
                          BSC  L  MC100,+-  *LOAD TABLE, BR IF NOS  2-2 OCB20980
                    *                                                   OCB20990
                    * MAKE A PASS THROUGH THE LOAD TABLE                OCB21000
                    *                                                   OCB21010
                    MC060 LD    1 @WRD3     BR IF CURRENT SUBR HAS      OCB21020
                          BSC  L  MC210,+-  *NOT YET BEEN LOADED        OCB21030
                    MC090 MDX   1 -@LTEN    POINT TO NEXT LOAD TBL ENT  OCB21040
                          MDX  L  CURTV+X3,-4                           OCB21050
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB21060
                          MDX     MC060     BR TO CHECK NEXT TBL ENTRY  OCB21070
                          LD    3 LSW22     GET LET/FLET SW         212 OCB21080
                          BSC  L  MC200,Z   BR IF ALL ROUT NOT FND  212 OCB21090
                    *                                                   OCB21100
                    * START PROCESSING AS RESULT OF A PASS THROUGH      OCB21110
                    * THE LOAD TABLE                                    OCB21120
                    *                                                   OCB21130
                    MC100 LD    3 LSW17                                 OCB21140
                          BSC  L  MC120,Z   BRANCH DURING 2ND PASS      OCB21150
                          LDX   1 @CLB4                                 OCB21160
                          BSI  L  LK000     FETCH PHASE 4               OCB21170
                          BSI  L  IL000     RELOCATE ILS SUBROUTINES    OCB21180
                          BSI  L  ET000     COMPUTE CORE AVAILABLE      OCB21190
                    * ONE INSTR REMOVED---ACC = @OVSW               212 OCB21200
                          BSC  L  MC150,+-  BR IF NO LOCALS OR SOCALS   OCB21210
                          LDX  L1 MC000     SIMULATE A BSI              OCB21220
                          STX  L1 LK000     TO LK000                    OCB21230
                          LDX   1 @CLB2                                 OCB21240
                          BSC  L  LK000+1   FETCH PHASE 2               OCB21250
                    MC120 LDX   1 @CLB5                                 OCB21260
                          BSI  L  LK000     FETCH PHASE 5               OCB21270
                          LD    3 LSW09     BR IF LOCALS                OCB21280
                          BSC  L  MC330,Z+  *HAVE NOT BEEN PROCESSED    OCB21290
                    MC130 BSI  L  PS000     INITIALIZE TO PROCESS A SCL OCB21300
                    * ONE INSTR REMOVED---ACC = LSW09               212 OCB21310
                          BSC  L  MC030,-   BR UNTIL SOCALS RELOCATED   OCB21320
                          LDX   1 @CLB4                                 OCB21330
                          BSI  L  LK000     FETCH CORE LOAD BLDR, PH 4  OCB21340
                          BSI  L  IL000     RELOCATE ILS SUBROUTINES    OCB21350
                    MC150 LDX  L1 @CLBC                                 OCB21360
                          BSI  L  LK000     FETCH CORE MAP PHASE        OCB21370
                          LD    3 LMPSW                                 OCB21380
                          BSI  L  M2000,Z   PRINT MAP IF REQUESTED      OCB21390
                          LDX   1 @CLB6                                 OCB21400
                          BSI  L  LK000     FETCH PHASE 6               OCB21410
                          BSI  L  TV000     CREATE THE TRANSFER VECTOR  OCB21420
                          BSI  L  TP000     DO TERMINAL PROCESSING      OCB21430
                    *                                                   OCB21440
                    * THIS POINT MARKS THE END OF THE CORE              OCB21450
                    * LOAD BUILDING PROCESS,I.E., THE CORE LOAD IS      OCB21460
                    * NOW COMPLETE                                      OCB21470
                    *                                                   OCB21480
                          LD    3 LSW10                                 OCB21490
                          BSC  L  MC170,+-  BR UNLESS COMMON TOO LONG   OCB21500
                          STO   3 RNAME     STORE OVERAGE               OCB21510
                          LDX   2 MSG47     COMMON TOO LONG             OCB21520
                          BSI  L  PM000     PRINT MESSAGE R47           OCB21530
                    MC170 LD      IND05     R05 ISSUED?            2-11 OCB21540
                          BSC  L  MC175,+-  BR IF NO               2-11 OCB21550
                          STX  L0 $NDUP     SET NON-DUP AND        2-11 OCB21560
                          STX  L0 $NXEQ     *NON-EXECUTE SWITCHES  2-11 OCB21570
                    MC175 MDX  L  $NDUP,0   SKIP IF NO ERRORS FOUND2-11 OCB21580
                          MDX     MC200     BR TO ABORT LOADING         OCB21590
                          LD   L  @XEQA                                 OCB21600
                          STO   3 RNAME                                 OCB21610
                          LDX   2 MSG42                                 OCB21620
                          BSI  L  PM300     PRINT EXEC ADDR MESSAGE     OCB21630
                    MC190 BSI  L  EX000     EXIT FROM CORE LOAD BUILDER OCB21640
                    MC200 LDX   2 -1                                    OCB21650
                          BSI  L  TL000     PRINT ABORT MESSAGE         OCB21660
                    * ONE INSTRUCTION REMOVED                      2-11 OCB21670
                    *                                                   OCB21680
                    * DETERMINE WHETHER OR NOT TO RELOCATE CURRENT      OCB21690
                    * ENTRY NOW                                         OCB21700
                    *                                                   OCB21710
                    MC210 LDD   1 @WRD1                                 OCB21720
                          STD   3 NAME                                  OCB21730
                          LD    3 LSW22     INSURE L/F IND DOES NOT 212 OCB21740
                          AND   3 K4000     *INDICATE PROG NOT      212 OCB21750
                          STO   3 LSW22     *FOUND IN LET/FLET      212 OCB21760
                          BSI  L  CN000     CHECK NAME OF CALL/LIBF     OCB21770
                    * ONE INSTR REMOVED---ACC = LSW18               212 OCB21780
                    *                       BRANCH IF NAME IS NOT THAT  OCB21790
                          BSC  L  MC220,+-  *OF A DISK I/O SUBR         OCB21800
                          STO   1 @WRD3                                 OCB21810
                    MC215 MDX     MC090     BR TO LOOK AT NEXT SUBR     OCB21820
                    MC220 LD    3 LSW17                                 OCB21830
                          BSC     Z         SKIP DURING 1ST PASS,       OCB21840
                          MDX     MC240     *BRANCH OTHERWISE           OCB21850
                          LD    1 @WRD4                                 OCB21860
                          SRA     4         BRANCH IF CURR ENTRY IS A   OCB21870
                          BSC  L  MC090,Z   *PREVIOUSLY RELOCATED LOCAL OCB21880
                    MC240 BSI  L  CC000     DECIDE WHETHER OR NOT TO    OCB21890
                    * ONE INSTR REMOVED--ACC = LSW01                212 OCB21900
                    *                       BRANCH IF CURRENT SUBR  212 OCB21910
                          BSC  L  MC090,Z   *SHOULD BE BYPASSED         OCB21920
                          LD    3 K0                                    OCB21930
                          STO   3 INCRE                                 OCB21940
                          BSI     RL000     RELOC CURRENT SUBR     2-11 OCB21950
                          MDX  I2 INCRE+X3                              OCB21960
                          MDX     MC215     BR TO PROCESS NEXT SUBR     OCB21970
                    MC330 LD    3 FLIPT                                 OCB21980
                          BSC  L  MC130,+-  BR IF NO LOCALS             OCB21990
                          BSI  L  PL000     INCORPORATE FLIPPER         OCB22000
                          BSC  L  MC030     BR TO FETCH PHASE 3    2-11 OCB22010
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB22020
                    * CONVERT A PROGRAM FROM DSF TO CORE IMAGE FORMAT   OCB22030
                    *                                                   OCB22040
                    RL000 DC      *-*       ENTRY POINT                 OCB22050
                          LD    3 LSW22     GET LET/FLET SW         212 OCB22060
                          BSC  I  RL000,+Z  BR IF ROUT NOT FND      212 OCB22070
                          STX  L2 RL200+1   SAVE XR2                    OCB22080
                          LDX  L2 RL900     POINT XR2 TO CONSTANTS      OCB22090
                          MDX  L  INDEX+X3,@ENTY-@ZERO POINT TO LAST WD OCB22100
                          LD    3 K0                                    OCB22110
                          STO   2 RL970-RL900  ZERO TO 1ST-BLOCK SWITCH OCB22120
                          STO   2 RL930-RL900  ZERO TO HIGH REFERENCE   OCB22130
                          STO   3 LEVLS     ZERO TO NO. DEVICES         OCB22140
                          LD    3 RELOC     RELOCATION FACTOR TO        OCB22150
                          STO   3 LADDR     *LOADING ADDR OF PROGRAM    OCB22160
                          STO   3 LOADR     * AND LOW REFERENCE         OCB22170
                    *                                                   OCB22180
                    * FETCH LOADING ADDRESS FOR CURRENT DSF MODULE      OCB22190
                    *                                                   OCB22200
                    RL010 BSI  L  NW000     FETCH LOADING ADDRESS       OCB22210
                          STO   3 WASTE                                 OCB22220
                          LD    2 RL940-RL900  BR UNLESS PROCESSING A   OCB22230
                          BSC  L  RL050,Z   *CALL, LIBF, OR DSA         OCB22240
                          LD    3 WASTE     RELOCATE LOADING ADDRESS    OCB22250
                          A     3 RELOC     *FOR CURRENT DSF MODULE     OCB22260
                          STO   3 LACTR     INITIALIZE LOCATION ADDR CT OCB22270
                          LD    2 RL970-RL900  BRANCH ON ALL BUT 1ST    OCB22280
                          BSC  L  RL050,Z   *DSF MODULE OF PROGRAM      OCB22290
                    *                                                   OCB22300
                    * INITIALIZATION TO BE DONE AT BEGINNING            OCB22310
                    * OF RELOCATION OF EACH SUBROUTINE                  OCB22320
                    *                                                   OCB22330
                          LD    3 LTYPE                                 OCB22340
                          STO   2 RL970-RL900 SET 1ST-DSF-MODULE SW     OCB22350
                          S     3 K2                                    OCB22360
                          BSC  L  RL015,-   BR UNLESS MAINLINE ABS      OCB22370
                          BSI  L  ML000     BR TO CHECK LOADING ADDR    OCB22380
                          MDX     RL050     BR TO FETCH NEXT DATA WORD  OCB22390
                    RL015 BSC  L  RL050,+-  BR IF MAINLINE RELOCATABLE  OCB22400
                          LD    3 LSW03     BRANCH IF RELOCATING AN     OCB22410
                          BSC  L  RL050,Z   *ILS OR FLIPPER             OCB22420
                          LD    3 LSW17                                 OCB22430
                          BSC  L  RL030,Z   BRANCH ON 2ND PASS          OCB22440
                          LD    1 @WRD1     BR UNLESS CURRENT ENTRY IS  OCB22450
                          BSC  L  RL020,-   *A LOCAL                    OCB22460
                          LD    3 RLXEQ                                 OCB22470
                          MDX     RL040     PUT EXEC ADDR IN LOAD TABLE OCB22480
                    RL020 LD    3 CLASS     PUT CLASS CODE AND LOCAL    OCB22490
                          OR    3 LSW16     *INDICATOR IN 4TH WORD OF   OCB22500
                          STO   1 @WRD4     *LOAD TABLE ENTRY           OCB22510
                    RL030 LD    3 LADDR                                 OCB22520
                          A     3 RLXEQ     COMPUTE ABSOLUTE ENTRY ADDR OCB22530
                    RL040 STO   1 @WRD3     *STORE IN 3RD WD LD TBL ENT OCB22540
                          LD    3 LTYPE                                 OCB22550
                          S     3 K5                                    OCB22560
                          BSC     Z         SKIP IF RELOCATING TYPE 5   OCB22570
                          S     3 K1                                    OCB22580
                          BSC     Z         SKIP IF RELOCATING SUBTP 3  OCB22590
                          S     2 RL905-RL900                           OCB22600
                          BSC  L  RL050,Z   BR UNLESS RELOCATING TYPE 6 OCB22610
                          LD    3 ISSTV                                 OCB22620
                          STO     *+2                                   OCB22630
                          LD    1 @WRD3     STORE ENTRY POINT      2-10 OCB22640
                          STO  L  *-*       *ADDRESS IN ISS TABLE   2-7 OCB22650
                    *                                                   OCB22660
                    * FETCH WORD COUNT FOR CURRENT DSF MODULE           OCB22670
                    *                                                   OCB22680
                    RL050 BSI  L  NW000     FETCH WD CNT OF DSF MODULE  OCB22690
                          STO   2 RL910-RL900                           OCB22700
                          LD    3 LACTR     BRANCH UNLESS CURRENT DSF   OCB22710
                          S     2 RL930-RL900 *MODULE ADDR IS A NEW     OCB22720
                          BSC  L  RL060,+   *MAXIMUM VALUE              OCB22730
                          LD    3 LACTR     SAVE NEW MAXIMUM            OCB22740
                          STO     RL930                                 OCB22750
                    RL060 LD      RL910                                 OCB22760
                          BSC  L  RL150,+-  BR IF END OF PROG (WDCNT=0) OCB22770
                          S     3 K2        BRANCH IF NO DATA IN MOD-   OCB22780
                          BSC  L  RL010,+-  *ULE,I.E., WD CNT = 2       OCB22790
                    *                                                   OCB22800
                    * FETCH AN INDICATOR WORD                           OCB22810
                    *                                                   OCB22820
                    RL070 BSI  L  NW000     FETCH INDICATOR WORD        OCB22830
                          STO     RL920                                 OCB22840
                          LD    3 K0                                    OCB22850
                          STO     RL900     ZERO TO DSF BLOCK COUNTER   OCB22860
                          MDX  L  RL910,-1  DECREMENT BLOCK WD CNT BY 1 OCB22870
                    *                                                   OCB22880
                    * FETCH A DATA WORD                                 OCB22890
                    *                                                   OCB22900
                    RL080 BSI  L  NW000     FETCH A DATA WORD           OCB22910
                          STO   3 NAME                                  OCB22920
                          MDX  L  RL900,1   INCR DSF BLOCK COUNTER BY 1 OCB22930
                          MDX  L  RL910,-1  DECR MODULE WD CNT BY 1     OCB22940
                          LD    2 RL940-RL900 BR IF PROCESSING 2ND WORD OCB22950
                          BSC  L  RL380,Z   *OF A CALL, LIBF, OR DSA    OCB22960
                          LD      RL920                                 OCB22970
                          SLA     1                                     OCB22980
                          STO     RL920     BR IF PROCESSING 1ST WD     OCB22990
                          BSC  L  RL320,C   *OF A CALL, LIBF, OR DSA    OCB23000
                          LD      RL920                                 OCB23010
                          SLA     1                                     OCB23020
                          STO     RL920                                 OCB23030
                          BSC     C         SKIP UNLESS WORD SHOULD     OCB23040
                          MDX     *+1       *BE INCREMENTED             OCB23050
                          MDX     RL085     BR TO CONTINUE PROCESSING   OCB23060
                          LD    3 NAME      INCREMENT DATA WORD         OCB23070
                          A     3 RELOC                                 OCB23080
                          STO   3 NAME                                  OCB23090
                    RL085 LD    3 LSW07     BRANCH IF FILLING IN BRANCH OCB23100
                          BSC  L  RL092,Z   *TABLE OF AN ILS            OCB23110
                    RL090 LD    3 LSW06     BRANCH UNLESS PROCESSING    OCB23120
                          BSC  L  RL100,Z   *DEFINE FILE TABLE          OCB23130
                          BSI  L  MV000     MOVE DEFINE FILE TABLE      OCB23140
                          MDX     RL120     BR TO PROCESS NEXT DATA WD  OCB23150
                    RL092 LD    3 NAME                                  OCB23160
                          BSC  L  RL095,Z   BR UNLESS END OF ILS TABLE  OCB23170
                          STO   3 LSW07                                 OCB23180
                          MDX     RL090     BR TO PROCESS NEXT WORD     OCB23190
                    RL095 BSI  L  TS000     PROCESS 1 IBT WORD          OCB23200
                          MDX     RL110     OUTPUT 1 WORD OF IBT        OCB23210
                    *                                                   OCB23220
                    * OUTPUT A WORD OF THE CORE LOAD AND DECIDE WHAT    OCB23230
                    * TO DO NEXT                                        OCB23240
                    *                                                   OCB23250
                    RL100 LD    3 NAME                                  OCB23260
                    RL110 BSI  L  TR000     OUTPUT 1 DATA WORD          OCB23270
                    RL120 LD      RL910                                 OCB23280
                          S     3 K2        BR IF END OF DSF MODULE,    OCB23290
                          BSC  L  RL010,+   *I.E., MODULE WD CNT = 2    OCB23300
                          LD      RL900                                 OCB23310
                          S     3 K8        BRANCH TO FETCH INDICATOR   OCB23320
                          BSC  L  RL070,-   *WD IF DSF BLOCK COUNTER=8  OCB23330
                          MDX     RL080     BR TO FETCH NEXT DATA WD    OCB23340
                    *                                                   OCB23350
                    * TERMINAL PROCESSING--THE SUBROUTINE HAS           OCB23360
                    * BEEN RELOCATED                                    OCB23370
                    *                                                   OCB23380
                    RL150 LD      RL930                                 OCB23390
                          S     3 LOADR     COMPUTE AND STORE LENGTH OF OCB23400
                          STO   3 SUBWC     *PROGRAM JUST RELOCATED     OCB23410
                          LD    3 LACTR     SKIP IF LOCATION ADDR CTR   OCB23420
                          BSC     E         *ENDED ON AN EVEN BOUNDARY  OCB23430
                          MDX     *+1       BR IF ODD                   OCB23440
                          MDX     RL155     BR TO CHECK PASS NO.        OCB23450
                          A     3 K1        MAKE LOCATION ADDR CTR EVEN OCB23460
                          MDX  L  SUBWC+X3,1 INCREMENT WORD COUNT BY 1  OCB23470
                    RL155 MDX  L  LSW17+X3,0 SKIP DURING 1ST PASS       OCB23480
                          MDX     RL160     BRANCH IF 2ND PASS          OCB23490
                          MDX  L  LSW19+X3,0  SKIP IF NO LOCALS         OCB23500
                          MDX     *+1       BRANCH IF LOCALS            OCB23510
                          MDX     RL160     BRANCH IF NO LOCALS         OCB23520
                          SLA     3         PREVENT LACTR FROM     2-11 OCB23530
                          SRA     3         * EXCEEDING 8,191      2-11 OCB23540
                    *                       * DURING PASS 1        2-11 OCB23550
                    RL160 STO   3 RELOC     SAVE NEXT RELOCATION FACTOR OCB23560
                          S     3 HADDR     BR IF HIGHEST ADDR ENCOUN-  OCB23570
                          BSC  L  RL170,+   *TERED EXCEEDS RELOC FACTOR OCB23580
                          LD    3 RELOC     REPLACE HIGH ADDR WITH      OCB23590
                          STO   3 HADDR     *RELOCATION FACTOR          OCB23600
                    RL170 BSI  L  XC000     FILL IN EXIT CONTROL CELL   OCB23610
                          LD    3 LTYPE                                 OCB23620
                          S     3 K2                                    OCB23630
                          BSC  L  RL180,+   BRANCH IF A MAINLINE        OCB23640
                          LD    3 LSW03     BRANCH IF RELOCATING AN     OCB23650
                          BSC  L  RL180,Z   *ILS OR FLIPPER             OCB23660
                          LD    1 @WRD1     BR IF CURRENTLY RELOCATING  OCB23670
                          BSC  L  RL250,Z+  *A LOCAL                    OCB23680
                    RL180 LD    3 LTYPE                                 OCB23690
                          S     3 K7        BRANCH UNLESS PROCESSING    OCB23700
                          BSC  L  RL240,Z   *AN ILS                     OCB23710
                          LD    3 ILSCT                                 OCB23720
                          A     3 SUBWC     ACCUMULATE LENGTH OF ILS    OCB23730
                          STO   3 ILSCT     *SUBROUTINES IN CORE LOAD   OCB23740
                    *                                                   OCB23750
                    * RETURN TO CALLER                                  OCB23760
                    *                                                   OCB23770
                    RL200 LDX  L2 *-*       RESTORE XR2                 OCB23780
                          BSC  I  RL000     RETURN                      OCB23790
                    *                                                   OCB23800
                    * CONSTANTS AND WORK AREAS                          OCB23810
                    *                                                   OCB23820
                          BSS  E  0                                 212 OCB23830
                    RL992 DN      $$$$$ NAME OF UFIO AREA           212 OCB23840
                    RL900 DC      *-*  DSF BLOCK COUNTER (CNT UP TO 8)  OCB23850
                    RL905 DC      /0035-5-1                             OCB23860
                    RL910 DC      *-*  NO. WORDS IN CURRENT DSF MODULE  OCB23870
                    RL920 DC      *-*  INDICATOR BITS                   OCB23880
                    RL930 DC      *-*  HIGHEST CORE ADDR IN PROGRAM     OCB23890
                    RL940 DC      *-*  CALL-LIBF-DSA SWITCH             OCB23900
                    RL950 DC      *-*  MASK                             OCB23910
                    RL970 DC      *-*  1ST BLOCK SWITCH--0=1ST DATA BLK OCB23920
                    RL980 DC      *-*  CALL-LIBF SWITCH--ZERO LIBF      OCB23930
                    RL990 DC      /4480 1ST WORD OF AN INDIRECT BSI     OCB23940
                    RL999 DC      *-*       GRAPHICS INDICATOR      2G2 OCB23950
                    *                                               212 OCB23960
                    *  1 CONSTANT MOVED                             212 OCB23970
                    *                                                   OCB23980
                    *                                                   OCB23990
                    *                                                   OCB24000
                    *                                                   OCB24010
                    * ACCUMULATE WORD COUNTS OF THE VARIOUS CLASSES     OCB24020
                    * OF SUBROUTINES                                    OCB24030
                    *                                                   OCB24040
                    RL240 LDX  I2 CLASS+X3                              OCB24050
                          MDX  L  LSW17+X3,0 SKIP DURING 1ST PASS,      OCB24060
                          MDX     RL200     *BRANCH OTHERWISE           OCB24070
                          LD    3 SUBWC     ACCUMULATE LENGTH OF        OCB24080
                          A    L2 INCOR+X3  *SUBROUTINES IN THIS CLASS  OCB24090
                          STO  L2 INCOR+X3                              OCB24100
                          MDX     RL200     TO EXIT                     OCB24110
                    *                                                   OCB24120
                    * SAVE WORD COUNT AND SECTOR ADDRESS OF EACH LOCAL  OCB24130
                    * AS WELL AS THE WORD COUNT OF THE LONGEST LOCAL    OCB24140
                    *                                                   OCB24150
                    RL250 LD    3 LOCAL     BRANCH UNLESS THIS IS THE   OCB24160
                          S     3 SUBWC     *LONGEST LOCAL ENCOUNTERED  OCB24170
                          BSC  L  RL260,-   * SO FAR                    OCB24180
                          LD    3 SUBWC     SAVE LENGTH OF THE          OCB24190
                          STO   3 LOCAL     *LONGEST LOCAL              OCB24200
                    RL260 LD    3 LSW17                                 OCB24210
                          BSC  L  RL280,Z   BRANCH IF 2ND PASS          OCB24220
                          LDX  I2 CURTV+X3                              OCB24230
                          LD    3 SUBWC     SAVE LOCAL LENGTH IN 4TH    OCB24240
                          OR    3 K8000     *WORD OF LOAD TABLE (BIT    OCB24250
                          STO   2 @WRD4     *ZERO IS A FLAG)            OCB24260
                          MDX     RL200     TO EXIT                     OCB24270
                    RL280 LD    3 LSW09     BRANCH UNLESS PROCESSING    OCB24280
                          BSC  L  RL200,Z   *LOCALS                     OCB24290
                          LD    3 WSADR                                 OCB24300
                          STO     RL290+1                               OCB24310
                          LD    3 SUBWC                                 OCB24320
                    RL290 MDX  L  *-*,1     ACCUMULATE SECTOR           OCB24330
                          S     3 K320      *ADDR FOR NEXT LOCAL        OCB24340
                          BSC  L  RL290,Z-  BR UNTIL SCTR NO. FORMED.   OCB24350
                          MDX     RL200     TO EXIT                     OCB24360
                    *                                                   OCB24370
                    * PROCESS 1ST WORD OF NAME OF CALL, LIBF, OR DSA    OCB24380
                    *                                                   OCB24390
                    RL320 LD    3 K1        SET SWITCH TO INDICATE NOW  OCB24400
                          STO     RL940     *PROCESSING CALL,LIBF,DSA   OCB24410
                          LD      RL920                                 OCB24420
                          SLA     1                                     OCB24430
                          STO     RL920                                 OCB24440
                          LD    3 K0                                    OCB24450
                          BSC     C         SKIP IF PROCESSING A LIBF   OCB24460
                          LD    3 K4000                                 OCB24470
                          STO     RL950     MASK=4000 FOR CALL,0 LIBF   OCB24480
                          STO     RL980     NON-ZERO=PROCESSING A CALL  OCB24490
                          BSC     Z         SKIP IF IND BITS=10     2G2 OCB24500
                          MDX     RL330     CHECK IF GCB ORDER      2G2 OCB24510
                    RL325 LD    3 NAME                              2G2 OCB24520
                          STO   3 NAME+1                                OCB24530
                          MDX     RL120     BR TO PROCESS NEXT DATA WD  OCB24540
                    RL330 LD    3 NAME      CHECK IF BIT 0=1        2G2 OCB24550
                          BSC     -         SKIP IF YES (A GSB ORDE 2G2 OCB24560
                          MDX     RL325     NO,RESUME PROCESSING    2G2 OCB24570
                          LD    3 K1                                2G2 OCB24580
                          STO     RL999                             2G2 OCB24590
                    RL340 STX   1 RL940     SAVE XR1                2G2 OCB24600
                          LDX  L1 @CLBD     CLB PH 13 ID            2G2 OCB24610
                          BSI  L  LK000     LOAD GRAPHIC PHASE      2G2 OCB24620
                          BSC  L  GC000     BR TO GRAPHICS PHASE    2G2 OCB24630
                    *                                                   OCB24640
                    * PROCESS 2ND WORD OF NAME OF CALL, LIBF, OR DSA    OCB24650
                    *                                                   OCB24660
                    RL380 LD      RL920                                 OCB24670
                          SLA     1                                 2G2 OCB24680
                          BSC  L  RL340,C                           2G2 OCB24690
                          SLA     1                                     OCB24700
                          STS     RL385     SAVE CARRY TO IND DSA   2-4 OCB24710
                          STO     RL920                                 OCB24720
                          LD    3 K0        CLEAR CALL-LIBF-DSA         OCB24730
                          STO     RL940     *PROCESSING SWITCH          OCB24740
                          LDD   3 NAME                                  OCB24750
                          RTE     16        RESTORE NAME OF PROGRAM     OCB24760
                          STD   3 NAME      *BEING PROCESSED            OCB24770
                          BSI     CQ000     BR TO CHK FOR EQUATES  2-11 OCB24780
                          LDD   3 NAME                              2-4 OCB24790
                    RL385 LDS     *-*       SET CARRY IF PROC DSA   2-4 OCB24800
                          BSC  L  RL450,C   BR IF PROCESSING A DSA      OCB24810
                          OR      RL950     FLAG NAME AS A CALL         OCB24820
                          STO   3 NAME      *OR A LIBF                  OCB24830
                    *                                                   OCB24840
                    * PROCESS CALLS AND LIBFS                           OCB24850
                    *                                                   OCB24860
                          BSI  L  BT000     ENTER NAME IN LOAD TABLE    OCB24870
                          LD      RL980                                 OCB24880
                          BSC  L  RL410,Z   BRANCH IF PROCESSING A CALL OCB24890
                          LD    3 DISPL     REPLACE NAME OF SUBROUTINE  OCB24900
                          OR    3 BSIT3     *WITH SHORT BSI TO LIBF TV  OCB24910
                    RL390 STO   3 NAME                                  OCB24920
                          BSC  L  RL100     BR TO OUTPUT A DATA WD      OCB24930
                    *                                                   OCB24940
                    * PROCESS CALLS                                     OCB24950
                    *                                                   OCB24960
                    RL410 LD      RL990     REPLACE 1ST WD OF NAME WITH OCB24970
                          BSI     TR000     *1ST WD OF A LONG BSI  2-11 OCB24980
                          LD    3 TVPTR     REPLACE 2ND WD OF NAME WITH OCB24990
                          MDX     RL390     *ADDR OF CALL TV ENTRY      OCB25000
                    *                                                   OCB25010
                    * PROCESS DSA STATEMENTS                            OCB25020
                    *                                                   OCB25030
                    RL450 LD    3 K1                                    OCB25040
                          STO   3 LSW15     SET DSA SWITCH              OCB25050
                          LDD   3 NAME                                  OCB25060
                          SD    2 RL992-RL900                           OCB25070
                          BSC     +-        SKIP UNLESS 1ST NAMES MATCH OCB25080
                          RTE     16                                    OCB25090
                          BNZ     DC000     BR IF NAME OF UFIO AREA 212 OCB25100
                          LD   L  $UFDR                                 OCB25110
                          STO   3 IGNOR                             212 OCB25120
                    *                                               212 OCB25130
                    *FETCH 1ST AND 3RD WORDS OF DSA STATEMENTS      212 OCB25140
                    *                                               212 OCB25150
                    DC000 EQU     *         ENTRY POINT             212 OCB25160
                          STX   2 DC100+1   SAVE XR2                212 OCB25170
                          BSI  L  LS000     LOOK UP NAME IN LET/FLET212 OCB25180
                    *                       *UPON RETURN, ACC =     212 OCB25190
                    *                       *LET/FLET INDR(LSW22)   212 OCB25200
                          BSC  L  TL100,+Z  EXIT IF NAME NOT FOUND  212 OCB25210
                          LD    3 LCBSW     TEST FOR STORECI        212 OCB25220
                          BSC  L  DC020,+-  BRANCH IF DSF LOAD      212 OCB25230
                          LD    3 LSW11     TEST WHERE FOUND        212 OCB25240
                          BSC  L  DC020,-   BR IF IN FLET           212 OCB25250
                          LDD   3 NAME      PREPARE                 212 OCB25260
                          SLT     2         *NAME FOR               212 OCB25270
                          STD   3 RNAME     *ERROR MSG              212 OCB25280
                          LDX   2 MSG23     FLAG ERROR R23          212 OCB25290
                          BSI  L  PM000     GO PRINT ERROR MESSAG   212 OCB25300
                    DC020 LD    3 BYADR     COMPUTE AND STORE DISK  212 OCB25310
                          SRA     4         *BLOCK ADDR OF 1ST SCTR 212 OCB25320
                          OR    3 DRCDE                             212 OCB25330
                          STO  L  BUFLS+1   *OF PROGRAM/DATA FILE   212 OCB25340
                          LD    3 LSW12                             212 OCB25350
                          SLA     1                                 212 OCB25360
                          BSC  L  DC150,Z+  BR IF DSA FOR A DATA FIL212 OCB25370
                          LD    3 LSBUF                             212 OCB25380
                          SRT     16                                212 OCB25390
                          BSI  L  GP000     FETCH CORE IMAGE HEADER 212 OCB25400
                          LDX  L2 BUFLS+2   POINT XR2 AT HDR        212 OCB25410
                          LD    2 @WCNT-@XEQA  FETCH WORD COUNT OF  212 OCB25420
                          STO   3 LNGTH     *CORE LOAD              212 OCB25430
                          LD    2 @XEQA-@XEQA                       212 OCB25440
                    DC050 STO   3 LXEQA     SAVE EXECUTION ADDRESS  212 OCB25450
                    DC100 LDX  L2 *-*       RESTORE XR2             212 OCB25460
                          LD    3 K0                                212 OCB25470
                          STO   3 LSW15     CLEAR DSA SWITCH        212 OCB25480
                          STO   3 IGNOR                                 OCB25490
                          LD    3 LNGTH     OUTPUT LENGTH OF PROGRAM    OCB25500
                          BSI     TR000     *REFERENCED IN THE DSA 2-11 OCB25510
                          LD   L  BUFLS+1   OUTPUT SCTR ADDR OF PRO-    OCB25520
                          BSI     TR000     *GRAM REF'NCED IN DSA  2-11 OCB25530
                          LD    3 LXEQA     OUTPUT EXECUTION ADDR       OCB25540
                          MDX     RL390     BR TO OUTPUT A DATA WD      OCB25550
                    DC150 LD    3 LDBCT                             212 OCB25560
                          M     3 K20                               212 OCB25570
                          SLT     17        TRUNCATE WD CNT TO 32K  212 OCB25580
                          SRA     1                                 212 OCB25590
                          STO   3 LNGTH     SAVE WD COUNT           212 OCB25600
                          LD    3 LDBCT                             212 OCB25610
                          A     3 BLCKS                             212 OCB25620
                          SRA     4                                 212 OCB25630
                          MDX     DC050     BR TO STORE WD 3        212 OCB25640
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB25650
                    TS000 DC      *-*       ENTRY POINT                 OCB25660
                    *                                                   OCB25670
                    * PROCESS THE BRANCH TABLE AT BEGINNING OF AN ILS   OCB25680
                    *                                                   OCB25690
                          AND   3 K00FF     TURN OFF BITS 0-7       212 OCB25700
                          A       TS900     ADD ADDR OF ISS TBL+@ISTV   OCB25710
                          STO     TS100+1                               OCB25720
                          MDX  L  LEVLS+X3,1 ACCUMULATE NO. WDS IN TBL  OCB25730
                          LD    3 NAME                                  OCB25740
                          SRA     8                                     OCB25750
                          STO   3 NAME                                  OCB25760
                    TS100 LD   L  *-*       BRANCH IF NO. THIS ENTRY IN OCB25770
                          BSC  L  TS160,+-  *ISS TBL IS STILL VACANT    OCB25780
                          A     3 NAME                                  OCB25790
                    TS130 BSC  I  TS000     RETURN                      OCB25800
                    TS160 LD      TS905     PUT ADDR OF PREOPERATIVE ER OCB25810
                          MDX     TS130     *IN CURRENT ISS TABLE ENTRY OCB25820
                    *                                                   OCB25830
                    * CONSTANTS AND WORK AREAS                          OCB25840
                    *                                                   OCB25850
                    TS900 DC      ISTVX-@ISTV-1 ADDR ISS TBL + @ISTV2-1 OCB25860
                    TS905 DC      $STOP ADDR OF PROG STOP KEY TRAP      OCB25870
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB25880
                    * CHECK CALLS AGAINST THE EQUATE TABLE          2-4 OCB25890
                    *                                               2-4 OCB25900
                    CQ000 DC      *-*       ENTRY POINT             2-4 OCB25910
                          STX   1 CQ100+1   SAVE XR1                2-4 OCB25920
                          LD    3 EQCNT     BR IF THERE IS          2-4 OCB25930
                          BSC  L  CQ100,+-  *NO EQUATE TABLE        2-4 OCB25940
                          LDX  I1 EQCNT+X3  COMPLEMENTED WD CNT TO X2-4 OCB25950
                    CQ050 LDD   3 NAME      COMPARE CURRENT CALL WIT2-4 OCB25960
                          SD   L1 EQTBL     *AN EQUATE TABLE ENTRY  2-4 OCB25970
                          BSC     +-        SKIP IF UNEQUAL         2-4 OCB25980
                          RTE     16        READY TO COMPARE 2ND WOR2-4 OCB25990
                          BSC  L  CQ150,Z   BR IF UNEQUAL           2-4 OCB26000
                          LDD  L1 EQTBL+2   REPLACE NAME OF CALL WIT2-4 OCB26010
                          STD   3 NAME      *SUBSTITUTE NAME        2-4 OCB26020
                    CQ100 LDX  L1 *-*       RESTORE XR1             2-4 OCB26030
                          BSC  I  CQ000     RETURN                  2-4 OCB26040
                    CQ150 MDX   1 @EETY     SKIP IF NO MATCH IN TABL2-4 OCB26050
                          MDX     CQ050     BR TO COMPARE NEXT ENTRY2-4 OCB26060
                          MDX     CQ100     BR TO EXIT              2-4 OCB26070
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB26080
                    * MOVE 1 DATA WORD TO CORE,THE CIB,OR WKNG STORAGE  OCB26090
                    *                                                   OCB26100
                    TR000 DC      *-*       ENTRY POINT                 OCB26110
                          STO   3 DATWD                                 OCB26120
                          STX   1 TR190+1   SAVE REGISTER 1             OCB26130
                          STX   2 TR190+3   SAVE XR2               2-11 OCB26140
                          LDX  L1 @CMON     XR1 POINTS AT CI HDR   2-11 OCB26150
                          LDX  I2 $WSDR     XR2 = VAL OF WS DRIVE  2-11 OCB26160
                    *                                                   OCB26170
                    * GUARD AGAINST OVERLAYING COMMON                   OCB26180
                    *                                                   OCB26190
                          LD    1 @CMON-@CMON                      2-11 OCB26200
                          BSC  L  TR030,+-  BRANCH IF NO COMMON         OCB26210
                          LD   L  $CORE                                 OCB26220
                          S     1 @CMON-@CMON                      2-11 OCB26230
                          S     3 LACTR     BRANCH IF THIS DATA WORD    OCB26240
                          BSC  L  TR030,Z-  *WILL NOT OVERLAY COMMON    OCB26250
                          LD    3 LSW10     ACCUMULATE PROGRAM/COMMON   OCB26260
                          A     3 K1        *OVERLAP                    OCB26270
                          STO   3 LSW10                                 OCB26280
                          LD    3 LSW19     BRANCH TO CHECK LACTR   2-8 OCB26290
                          BSC  L  TR020,+-  *IF NO LOCALS/SOCALS    2-8 OCB26300
                          LD    3 LSW17     BRANCH TO CONTINUE      2-8 OCB26310
                          BSC  L  TR180,+-  *IF PASS ONE            2-8 OCB26320
                    TR020 LD    3 LACTR      BRANCH IF CORE LOAD    2-4 OCB26330
                          BSC  L  TR200,+    *EXCEEDS 32 K          2-4 OCB26340
                          MDX     TR180     BR W/O TRANSFERRING DATA WD OCB26350
                    *                                                   OCB26360
                    * SAVE THE HIGHEST ADDRESS LOADED THUS FAR          OCB26370
                    *                                                   OCB26380
                    TR030 LD    3 HADDR                                 OCB26390
                          S     3 LACTR     BR IF HIGHEST ADDR LOADED   OCB26400
                          BSC  L  TR050,-   *THUS FAR LT THE LACTR      OCB26410
                          LD    3 LACTR     SAME HIGHEST ADDR           OCB26420
                          STO   3 HADDR     *LOADED THUS FAR            OCB26430
                    TR050 LD    3 LSW17                                 OCB26440
                          BSC  L  TR110,+-  BRANCH DURING 1ST PASS      OCB26450
                          LD    3 LSW09                                 OCB26460
                          BSC  L  TR150,Z+  BR IF PROCESSING IN-CORES   OCB26470
                          MDX     TR250     BR IF PROCESSING LOCAL/SOCL OCB26480
                    *                                                   OCB26490
                    * OUTPUT THE DATA WD TO CIB OR WKNG STORAGE         OCB26500
                    *                                                   OCB26510
                    TR110 MDX  L  LSW19+X3,0 SKIP IF THERE ARE NO       OCB26520
                          MDX     TR180     *LOCALS/SOCALS,BR OTHERWISE OCB26530
                          LD    3 LACTR                                 OCB26540
                          BSC  L  TR200,+   BR IF LACTR EXCEEDS 32767   OCB26550
                          S    L  $CORE     BRANCH IF PROGRAM TOO       OCB26560
                          BSC  L  TR180,-   *LARGE FOR CORE             OCB26570
                          LD    3 LSW21                                 OCB26580
                          BSC  L  TR150,Z   BR IF OUTPUTTING CI HEADER  OCB26590
                          LD    3 LACTR                                 OCB26600
                          S     3 MLWD1     BR UNLESS LOCATION ADDR CTR OCB26610
                          BSC  L  TR130,-   *LESS THAN 1ST WD OF ML     OCB26620
                          LDX   2 MSG01     INVALID ORG                 OCB26630
                          MDX     TR200+1   PRNT MSG R01 AND EXIT  2-11 OCB26640
                    *                                                   OCB26650
                    * DETERMINE WHETHER TO OUTPUT THE WD                OCB26660
                    *                                                   OCB26670
                    TR130 LD    3 LSW06                                 OCB26680
                          BSC  L  TR150,+-  BR IF PROCESSING FILES      OCB26690
                          LD    3 LSW19     BRANCH IF PROCESSING        OCB26700
                          BSC  L  TR180,Z   *LOCALS/SOCALS              OCB26710
                    TR150 LD    3 LACTR     BR IF DATA WORD IS TO BE    OCB26720
                          S     3 CIBLM     *WRITTEN ON CIB,I.E., TO2-2 OCB26730
                          BSC  L  TR250,+   *RESIDE BELOW HIGH COMM 2-2 OCB26740
                    *                                                   OCB26750
                    * OUTPUT THE DATA WD TO CORE (ABOVE HIGH COMMON)2-2 OCB26760
                    *                                                   OCB26770
                          LD    3 DATWD     LOAD CURRENT DATA WORD DIR- OCB26780
                          STO  I3 LACTR     *ECTLY IN CORE (ABOVE 4095) OCB26790
                    *                       2 INSTRUCTIONS REMOVED 2-11 OCB26800
                    *                                              2-11 OCB26810
                    TR180 MDX  L  LACTR+X3,1  INCRE LACTR BY 1     2-11 OCB26820
                    TR190 LDX  L1 *-*       RESTORE REGISTER 1          OCB26830
                          LDX  L2 *-*       RESTORE REGISTER 2     2-11 OCB26840
                          BSC  I  TR000     RETURN                      OCB26850
                    TR200 LDX   2 MSG08     CORE LOAD EXCEEDS 32K       OCB26860
                          BSI  L1 TL000-@CMON  PRINT MSG AND EXIT   212 OCB26870
                    *                                                   OCB26880
                    * WRITE DATA WORD ON CIB OR WORKING STORAGE         OCB26890
                    *BY PLACING IT FIRST IN THE CIB BUFFER              OCB26900
                    *                                                   OCB26910
                    TR250 LD    3 LSW09                                 OCB26920
                          BSC  L  TR270,-   BRANCH IF LOCAL OR SOCAL    OCB26930
                    *                                                   OCB26940
                    * INITIALIZE IF PROCESSING IN-CORES                 OCB26950
                          LD   L  $CIBA     INITIALIZE WITH LEFTMOST2-2 OCB26960
                          STO     TR920     *DISK SECTOR ADDR IN CIB2-2 OCB26970
                          LD    3 CIBLM                             2-2 OCB26980
                          S       TR930                             2-2 OCB26990
                          BSC  L  TR290,+-  BR IF MINIMUM SIZE CORE 2-2 OCB27000
                          LD    3 LACTR                             2-2 OCB27010
                          S       TR930     BR IF LAC IS IN         2-2 OCB27020
                          BSC  L  TR430,Z-  *HIGH COMMON            2-2 OCB27030
                          MDX     TR290     BR TO CONTINUE PROC     2-2 OCB27040
                    *                                                   OCB27050
                    * INITIALIZE IF PROCESSING LOCALS OR SOCALS         OCB27060
                    *                                                   OCB27070
                    TR270 LD   L2 SCTAD+X3  INITIALIZE WITH CURRENT2-11 OCB27080
                          STO     TR920     *ADDR IN WORKING STORAGE    OCB27090
                          LDD   3 NAME                                  OCB27100
                          SLT     2                                     OCB27110
                          STD   3 RNAME                                 OCB27120
                          LD    3 LACTR     COMPUTE ADDR CURR DATA WD   OCB27130
                          S     3 LSADR     *RELATIVE TO LOCAL/SOCAL AR OCB27140
                          MDX     TR310     BR TO CONTINUE PROCESSING   OCB27150
                    *                                                   OCB27160
                    * PREPARE TO TRANSFER DATA WD TO CIB OR             OCB27170
                    * TO WORKING STORAGE                                OCB27180
                    *                                                   OCB27190
                    TR290 LD    3 LACTR     COMPUTE WHICH CIB SECTOR    OCB27200
                          S     3 MLWD1     *DATA WD TO BE STORED IN    OCB27210
                          A     1 @HWCT-@CMON  ADJST FOR CI HDR    2-11 OCB27220
                    TR310 SRT     16                                    OCB27230
                          D     3 K320                                  OCB27240
                    TR315 S     3 SCTRX                                 OCB27250
                          STD   3 NAME2     BRANCH IF DESIRED SECTOR IS OCB27260
                          BSC  L  TR370,+-  *ALREADY IN CIB BUFFER      OCB27270
                          A     3 SCTRX     REPLACE OLD SECTOR NO.      OCB27280
                          STO   3 SCTRX     *WITH ONE JUST COMPUTED     OCB27290
                          LD    3 LSW09                                 OCB27300
                          BSC  L  TR330,Z+  BR UNLESS PROCESSING LOCALS OCB27310
                    *                                                   OCB27320
                    * CHECK FOR SUFFICIENT WORKING STORAGE              OCB27330
                    *                                                   OCB27340
                          LD   L2 SCTAD+X3                         2-11 OCB27350
                          AND   3 K0FFF                                 OCB27360
                          A     3 SCTRX                                 OCB27370
                          S     3 SLIMT     BRANCH IF INSUFFICIENT      OCB27380
                          BSC  L  TR410,Z-  *WORKING STORAGE            OCB27390
                    TR330 LD    3 LSW20     BRANCH 1ST TIME THIS        OCB27400
                          BSC  L  TR350,+-  *WORD IS CHECKED            OCB27410
                    *                                                   OCB27420
                    * WRITE OUT PRESENT CONTENTS OF CIB                 OCB27430
                    * BUFFER ON THE CIB OR ON WORKING STORAGE           OCB27440
                    *                                                   OCB27450
                          LD    3 CIBBF     WRITE PRESENT CONTENTS OF   OCB27460
                          RTE     16        *CIB BUFFER ON THE CIB      OCB27470
                          LD    3 K1        *OR ON WORKING STORAGE      OCB27480
                          BSI   1 GP000-@CMON  OUT TO WRITE        2-11 OCB27490
                    *                                                   OCB27500
                    * PLACE THE DATA WORD IN THE CIB BUFFER             OCB27510
                    *                                                   OCB27520
                    TR350 LD    3 SCTRX     COMPUTE AND STORE DESIRED   OCB27530
                          A       TR920     *DISK SECTOR ADDRESS        OCB27540
                          STO  L  BUFCI+1                               OCB27550
                    *                       1 INSTRUCTION MOVED    2-11 OCB27560
                          LD    3 CIBBF                                 OCB27570
                          SRT     16                                    OCB27580
                          MDX  L  LSW20+X3,0  SKIP 1ST TIME THRU   2-11 OCB27590
                          BSI   1 GP000-@CMON  FETCH DESIRED SECTOR2-11 OCB27600
                          STX  L0 LSW20+X3  SET 1ST TIME SWITCH    2-11 OCB27610
                    TR370 LD    3 NAME2+1                               OCB27620
                          A     3 CIBBF     COMPUTE ADDR IN CIB BFR OF  OCB27630
                          A     3 K2                                    OCB27640
                          STO     TR390+1   *DATA WORD TO BE WRITTEN    OCB27650
                          LD    3 DATWD                                 OCB27660
                    TR390 STO  L  *-*       STORE DATA WORD IN CIB BFR  OCB27670
                          MDX     TR180     TO EXIT                     OCB27680
                    TR410 LDX   2 MSG00     INSUFFICIENT WKNG STORAGE   OCB27690
                          MDX     TR200+1   PRNT MSG R00 AND EXIT  2-11 OCB27700
                    *                                               2-2 OCB27710
                    * PREPARE TO PUT DATA WD IN HIGH COMMON         2-2 OCB27720
                    *                                               2-2 OCB27730
                    TR430 S     3 K1                                2-2 OCB27740
                          SRT     16                                2-2 OCB27750
                          D     3 K320      COMPUTE SCTR NUMBER OF  2-2 OCB27760
                          A       TR940     *SCTRS IN CIB           2-2 OCB27770
                          MDX     TR315     BR TO LOOK IF SCTR IS IN2-2 OCB27780
                    *                                               2-2 OCB27790
                    * CONSTANTS AND WORK AREAS                      2-2 OCB27800
                    *                                                   OCB27810
                    TR910 DC      @CLB6  ID NO. OF CLB, PHASE 6         OCB27820
                    TR920 DC      *-*  CIB OR WS BASE DISK ADDR         OCB27830
                    TR930 DC      @MCOR-1   MIN CORE SIZE MINUS 1   2-2 OCB27840
                    TR940 DC      @SCIB-@HCIB ADDR IN CIB OF HI COMM2-2 OCB27850
                    TR950 DC      @MCOR+@HCIB*320 ADDR END OF HI COM2-2 OCB27860
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB27870
                    * FILL IN EXIT CTL WORDS FOR TYPE 3 PROGRAMS        OCB27880
                    *                                                   OCB27890
                    *                                                   OCB27900
                    XC000 DC      *-*                                   OCB27910
                          STX   1 XC050+1   SAVE XR1                    OCB27920
                          STX   2 XC050+3   SAVE XR2                    OCB27930
                          LD    3 LSW03     BR IF PROCESSING ML,        OCB27940
                          BSC  L  XC050,Z   *FLIPPER, OR AN ILS         OCB27950
                          LD    3 LSW17     BRANCH UNLESS THIS IS THE   OCB27960
                          BSC  L  XC050,+-  *SECOND PASS                OCB27970
                          LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB27980
                          SLA     1         BR IF SUBROUTINE JUST       OCB27990
                          BSC  L  XC100,-   *RELOCATED WAS A LIBF       OCB28000
                    XC050 LDX  L1 *-*       RESTORE XR1                 OCB28010
                          LDX  L2 *-*       RESTORE XR2                 OCB28020
                          BSC  I  XC000     RETURN                      OCB28030
                    XC100 LDX  L1 ENTPT     ADDR ENTRY PT TABLE TO XR1  OCB28040
                          LDX  I2 NOPTS+X3  NO. ENTRY POINTS TO XR2     OCB28050
                    XC170 LD    1 @WRD4     BR IF CURRENT ENTRY POINT   OCB28060
                          BSC  L  XC200,+-  *WAS NOT REFERENCED         OCB28070
                          LD    1 @WRD3     FETCH RELATIVE EXEC ADDR    OCB28080
                          A     3 LADDR     COMPUTE ABSOLUTE ENTRY ADDR OCB28090
                          A     3 K2        COMPUTE AND STORE ABSOLUTE  OCB28100
                          STO   3 LACTR     *ADDR OF EXIT CONTROL WORD  OCB28110
                          LD    1 @WRD4     FETCH ADDR OF LIBF TV ENTRY OCB28120
                          BSI  L  TR000     FILL IN EXIT CONTROL WORD   OCB28130
                    XC200 MDX   1 4                                     OCB28140
                          MDX   2 -1        SKIP AFTER LAST ENTRY POINT OCB28150
                          MDX     XC170     BR TO CONTINUE PROCESSING   OCB28160
                          MDX     XC050     BR IF ALL LIBFS PROCESSED   OCB28170
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB28180
                          BSS     /08B6-*   PATCH AREA             2-11 OCB28190
                    *                                               2-8 OCB28200
                    ************************************************2-8 OCB28210
                    *                                               2-8 OCB28220
                    *  THE PRECEDING PORTION OF PHASE 2 REMAINS IN  2-8 OCB28230
                    *  CORE FOR THE REMAINDER OF THE CORE LOAD BUILD2-8 OCB28240
                    *  PROCESS.  THE REMAINING PORTION OF PHASE 2   2-8 OCB28250
                    *  IS OVERLAID BY SUBSEQUENT PHASES.            2-8 OCB28260
                    *                                               2-8 OCB28270
                    ************************************************2-8 OCB28280
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB28290
                    * SAVE THE DEFINE FILE TABLE IN TEMPORARY STORAGE   OCB28300
                    * PRIOR TO FILLING IN THE SECTOR ADDRESSES          OCB28310
                    *                                                   OCB28320
                          BSS  E  0                                     OCB28330
                    MV000 DC      *-*       ENTRY POINT                 OCB28340
                          LD      MV900     BRANCH AFTER 1ST TIME       OCB28350
                          BSC  L  MV080,Z   *THIS SUBROUTINE IS ENTERED OCB28360
                          LD   L  @FILE                                 OCB28370
                          M     3 K7        COMPUTE AND STORE LENGTH    OCB28380
                          SLT     16                                    OCB28390
                          STO     MV900     *OF DEFINE FILE TABLE       OCB28400
                          STO     MV920                                 OCB28410
                          A     3 LACTR     SAVE LACTR SETTING FOR E2-2 OCB28420
                          STO     MV940     *OF DEFINE FILE TABLE   2-2 OCB28430
                          MDX  L  LSW17+X3,0 SKIP DURING 1ST PASS       OCB28440
                          MDX     MV060     BR DURING 2ND PASS          OCB28450
                          LD    3 LADDR                                 OCB28460
                          STO     MV940                                 OCB28470
                    MV060 LD    3 LEFTX     PREPARE TO SAVE TABLE       OCB28480
                          S       MV900     *TEMPORARILY IN UNUSED      OCB28490
                          STO     MV100+1   *LOAD TABLE AREA            OCB28500
                          STO   3 DFADR                                 OCB28510
                    MV080 MDX  L  LSW17+X3,0 SKIP  DURING FIRST PASS    OCB28520
                          MDX     MV120     BR DURING 2ND PASS          OCB28530
                    *                                                   OCB28540
                    * MOVE 1 WORD OF DEFINE FILE TABLE                  OCB28550
                    *                                                   OCB28560
                          LD    3 NAME                                  OCB28570
                          MDX  L  MV940,1   INCREMENT AUXILLIARY LACTR  OCB28580
                    MV100 STO  L  *-*       SAVE 1 WD OF FILE TABLE     OCB28590
                    MV120 LD      MV100+1                               OCB28600
                          A     3 K1                                    OCB28610
                          STO     MV100+1                               OCB28620
                          S     3 LEFTX     BRANCH AFTER LAST WORD OF   OCB28630
                          BSC  L  MV250,+-  *TABLE HAS BEEN MOVED       OCB28640
                    MV150 BSC  I  MV000     RETURN                      OCB28650
                    MV250 LD    3 LSW17                                 OCB28660
                          BSC  L  MV270,+-  BR DURING 1ST PASS          OCB28670
                          LD      MV940                                 OCB28680
                          STO   3 LACTR                                 OCB28690
                          MDX     MV380     BR WHEN DF TABLE MOVED      OCB28700
                    *                                                   OCB28710
                    * PROCESS THE DEFINE FILE TABLE                     OCB28720
                    *                                                   OCB28730
                    MV270 BSI     DF000     PROCESS FILES IN UA/FX  2-9 OCB28740
                          LD    3 LSW22     GET LET/FLET INDR +BR   212 OCB28750
                          BSC  L  MV380,+Z  *IF FILE NOT IN LET/FLET212 OCB28760
                          LD    3 LSW19                                 OCB28770
                          STO     MV930     SAVE LOCAL/SOCAL SWITCH     OCB28780
                          SRA     16                                    OCB28790
                          STO   3 LSW19     CLEAR LOCAL/SOCAL SWITCH    OCB28800
                          LD   L  $CIBA                                 OCB28810
                          STO  L  BUFCI+1   SECTOR ADDR TO CIB BUFFER   OCB28820
                          LD    3 LTYPE     LOAD PROGRAM TYPE       2-4 OCB28830
                          S     3 K1        IS IT ABS MAINLINE      2-4 OCB28840
                          BSC  L  MV280,+-  YES - BRANCH            2-9 OCB28850
                          LD    3 LADDR     SET LOCN ADDR CTR TO ADDR   OCB28860
                          MDX     MV290     *SKIP TO STORE          2-9 OCB28870
                    MV280 LD    3 MLWD1     1ST WD FOR ABS ML       2-9 OCB28880
                    MV290 STO   3 LACTR     ADDR OF DEFINE FILE TABL2-9 OCB28890
                          LD    3 DFADR     PRESET TEMP ADDR OF     2-9 OCB28900
                          STO     MV310+1   *1ST DEFINE FILE TBL ENTRY  OCB28910
                    *                                                   OCB28920
                    * OUTPUT DEFINE FILE TABLE AFTER PROCESSING         OCB28930
                    *                                                   OCB28940
                    MV310 LD   L  *-*       FETCH WD FROM DEFINE FILE   OCB28950
                          BSI  L  TR000     WRITE IT ON THE CIB         OCB28960
                          MDX  L  MV310+1,1                             OCB28970
                          MDX  L  MV920,-1  SKIP AT END OF DF TABLE     OCB28980
                          MDX     MV310     BACK TO MOVE 1 WD OF TABLE  OCB28990
                          LD    3 CIBBF                                 OCB29000
                          RTE     16                                    OCB29010
                          LD    3 K1                                    OCB29020
                          BSI  L  GP000     OUTPUT FILES DATA TO CIB    OCB29030
                          LD      MV930                                 OCB29040
                          STO   3 LSW19     RESTORE LOCAL/SOCAL SWITCH  OCB29050
                    MV380 LD    3 K1        1 TO SW 6, I.E. TABLE HAS   OCB29060
                          STO   3 LSW06     *BEEN PROCESSED             OCB29070
                          LD    3 K0        CLEAR FOR RE-ENTRY          OCB29080
                          STO     MV900                                 OCB29090
                          MDX     MV150     TO EXIT                     OCB29100
                    *                                                   OCB29110
                    * CONSTANTS AND WORK AREAS                          OCB29120
                    *                                                   OCB29130
                    MV900 DC      0    SWITCH--NON-ZERO AFTER 1ST TIME  OCB29140
                    MV920 DC      *-*  NO. FILES DEFINED                OCB29150
                    MV930 DC      *-*  WASTEBASKET                      OCB29160
                    MV940 DC      *-*  AUXILLIARY LOCATION ADDR CTR     OCB29170
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB29180
                    * CHECK MAINLINE LOADING ADDRESS                    OCB29190
                    *                                                   OCB29200
                    ML000 DC      *-*       ENTRY POINT                 OCB29210
                          STX   1 ML100+1   SAVE XR1                    OCB29220
                          LD    3 LACTR     SAVE ADDRESS OF 1ST         OCB29230
                          STO   3 RNAME                                 OCB29240
                          STO   3 MLWD1     *WORD OF MAINLINE           OCB29250
                          STO   3 LOADR                                 OCB29260
                          S    L  @HWCT                                 OCB29270
                          STO  L  @LDAD                                 OCB29280
                          SLA     16                                    OCB29290
                          LD   L  @DREQ     FETCH DISK REQUESTED CODE   OCB29300
                          BSC  L  ML050,-   BR UNLESS DISKZ UTILIZED    OCB29310
                          BSC  L  ML070,C   BR IF LOADING ADDR ODD      OCB29320
                    ML050 LDX  I1 @DREQ     DISK REQUESTED CODE TO XR1  OCB29330
                          LD   L1 ORGIN+X3  FETCH LOWEST ALLOWABLE ORG  OCB29340
                          S     3 MLWD1     BRANCH IF REQUESTED TO      OCB29350
                          BSC  L  ML100,+   *ORIGIN BELOW DISK I/O      OCB29360
                    ML070 LDX   2 MSG46     INVALID ORG                 OCB29370
                          BSI  L  TL000     PRINT MESSAGE AND EXIT      OCB29380
                    ML100 LDX  L1 *-*       RESTORE XR1                 OCB29390
                          BSC  I  ML000     RETURN                      OCB29400
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB29410
                    * CHECK LENGTH OF MAINLINE COMMON                   OCB29420
                    *                                                   OCB29430
                    CK000 DC      *-*       ENTRY POINT                 OCB29440
                          STX   1 CK100+1   SAVE XR1                    OCB29450
                          LD    3 K0        CLEAR SW 3                  OCB29460
                          STO   3 LSW03                                 OCB29470
                          LD   L  @CMON     BR IF COMMON IS             OCB29480
                          BSC  L  CK150,-   *NON-NEGATIVE               OCB29490
                    CK050 STO   3 RNAME     SAVE EXCESS COMMON          OCB29500
                          LDX   2 MSG47     COMMON TOO LONG             OCB29510
                          BSI  L  PM000     PRINT ERROR MESSAGE         OCB29520
                    CK100 LDX  L1 *-*       RESTORE XR1                 OCB29530
                          BSC  I  CK000     RETURN                      OCB29540
                    CK150 LD   L  $CORE                                 OCB29550
                          S    L  @CMON                                 OCB29560
                          LDX  I1 $DREQ     DISK TYPE CODE TO XR1       OCB29570
                          S    L1 CK930     BR UNLESS COMMON EXTENDS    OCB29580
                          BSC  L  CK100,-   *TOO FAR LEFTWARD           OCB29590
                          EOR     CK920     COMPLEMENT EXCESS COMMON    OCB29600
                          A     3 K1                                    OCB29610
                          MDX     CK050     BR TO PRINT ERROR MESSAGE   OCB29620
                    *                                                   OCB29630
                    * CONSTANTS AND WORK AREAS                          OCB29640
                    *                                                   OCB29650
                    CK920 DC      /FFFF CONSTANT FOR COMPLEMENTING      OCB29660
                          DC      @COMZ LOW COMMON LIMIT FOR DISKZ      OCB29670
                    CK930 DC      @COM1 LOW COMMON LIMIT FOR DISK1      OCB29680
                          DC      @COM2 LOW COMMON LIMIT FOR DISKN      OCB29690
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB29700
                    * PUT SECTOR ADDRESSES IN THE DEFINE FILE TABLE     OCB29710
                    *                                                   OCB29720
                    DF000 DC      *-*       ENTRY POINT                 OCB29730
                          STX   1 DF125+1   SAVE XR1                    OCB29740
                          STX   2 DF125+3   SAVE XR2                    OCB29750
                          LDX  L1 DF910     PNT XR1 TO CONSTANTS   2-11 OCB29760
                          LD    3 INDEX     SAVE POINTER FOR MAINLINE   OCB29770
                          STO   1 DF910-DF910                      2-11 OCB29780
                          LD   L  BUFLO+1   SAVE ADDR FROM DATA BUFFER  OCB29790
                          STO   1 DF960-DF910                      2-11 OCB29800
                          LD    3 LMPSW     SAVE MAP SWITCH             OCB29810
                          STO   1 DF940-DF910                      2-11 OCB29820
                          LD   L  @FILE     INITIALIZE COUNTER WITH     OCB29830
                          STO   1 DF900-DF910                      2-11 OCB29840
                    *                                                   OCB29850
                    * FETCH THE DEFINE FILE EQUATE TABLE                OCB29860
                    *                                                   OCB29870
                          LDX  I1 DFADR+X3  ADDR DEFINE FILE TBL TO XR1 OCB29880
                          LD    3 LFCNT                                 OCB29890
                          BSC  L  DF070,+-  BR IF NO FILES EQUATED  2-8 OCB29900
                          LDX  L2 BUFLO     START OF BUFFER TO XR2      OCB29910
                          LD    3 LSCRA     FETCH AND STORE SECTOR      OCB29920
                          A    L  DF920     ADD IN OFFSET               OCB29930
                          STO   2 1         *ADDR OF SCRA               OCB29940
                          LD    3 CIBLM     CHECK IF MINIMUM       2-11 OCB29950
                          SRA     12        *CORE SIZE             2-11 OCB29960
                          BSC     Z         SKIP IF 4K SYSTEM      2-11 OCB29970
                          LD    3 K320      **READ 2 SECTORS IF NOT2-11 OCB29980
                          A     3 K320      **4K.IF 4K,ONLY READ 1.2-11 OCB29990
                          STO   2 0         *BOTH SECTORS               OCB30000
                          LD    3 LOBUF                                 OCB30010
                          SRT     16                                    OCB30020
                          BSI  L  GP000     FETCH DF EQUATE TABLE       OCB30030
                          LD    3 K320      RESTORE WORD COUNT          OCB30040
                          STO   2 0         *OF 320 TO DATA BUFFER      OCB30050
                          MDX   2 3         ADDR 1ST DATA WD TO XR2     OCB30060
                          LD    2 -1        FETCH WD CNT FOR EQU BLOCK  OCB30070
                          S     3 K1        SUB ONE                 2-9 OCB30080
                          STO  L  DF950     SAVE WORD COUNT             OCB30090
                    *                       CODE REMOVED            2-8 OCB30100
                    *                                               2-9 OCB30110
                    *                                                   OCB30120
                    * COMPARE ENTRIES IN EQUATE TABLE WITH              OCB30130
                    * THOSE IN DEFINE FILE TABLE                        OCB30140
                    *                                                   OCB30150
                    DF040 LD    2 @EQNO     BR IF A DEFINED FILE NO.    OCB30160
                          S     1 @FLNR     *EQUALS A NO. FROM THE      OCB30170
                          BSC  L  DF195,+-  *EQUATE TABLE           2-9 OCB30180
                    DF050 MDX   1 @DFEN     POINT TO NEXT FILE NO.      OCB30190
                          LD    3 K0                                    OCB30200
                          STO   3 IGNOR                                 OCB30210
                          MDX  L  DF900,-1  SKIP ON LAST FILE NO.       OCB30220
                          MDX     DF040     BACK TO MAKE NEXT COMPARE   OCB30230
                          LD    3 LSW22     GET LET/FLET INDR       212 OCB30240
                          BSC  L  DF125,Z   BR IF FILES NOT FOUND   212 OCB30250
                          LDX  I1 DFADR+X3  ADDR DEFINE FILE TBL TO XR1 OCB30260
                          LD   L  @FILE     INITIALIZE COUNTER WITH     OCB30270
                          STO     DF900     *NO. OF FILES DEFINED       OCB30280
                    DF060 MDX   2 @EQEN                                 OCB30290
                          LD    3 K0                                    OCB30300
                          STO   3 IGNOR                                 OCB30310
                          MDX  L  DF950,-@EQEN SKIP ON LAST ENTRY       OCB30320
                          MDX     DF040     BACK TO MAKE NEXT COMPARE   OCB30330
                    DF070 LD   L  $WSDR                             2-8 OCB30340
                          STO   3 IGNOR     WS DRIVE FOR FILES          OCB30350
                    *                                                   OCB30360
                    * FIND SECTOR ADDRESSES NOT YET FILLED IN           OCB30370
                    *                                                   OCB30380
                    DF080 LD    1 @SCAD     BR IF SCTR ADDR FOR CURRENT OCB30390
                          BSI  L  DF135,+-  *FILE NOT YET FILLED IN     OCB30400
                    DF100 MDX   1 @DFEN     POINT TO NEXT FILE NO.      OCB30410
                          MDX  L  DF900,-1  SKIP ON LAST DEFINE FILE    OCB30420
                          MDX     DF080     BR TO CHECK NEXT FILE       OCB30430
                          LD    3 K0                                    OCB30440
                          STO   3 LSW02     STORAGE ALLOCATION SWITCH   OCB30450
                          BSI  L  FM000     PRINT 'STORAGE ALLOCATION'  OCB30460
                          LD    3 K320      RESTORE WORD COUNT          OCB30470
                          STO  L  BUFCI     *TO CIB BUFFER              OCB30480
                          LD      DF960                                 OCB30490
                          STO  L  BUFLO+1                               OCB30500
                          LD      DF910     RESTORE POINTER             OCB30510
                          STO   3 INDEX                                 OCB30520
                          LD    3 LOBUF                                 OCB30530
                          SRT     16                                    OCB30540
                          STO   3 IGNOR                                 OCB30550
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB30560
                          LD   I3 WSADR     FETCH AND STORE SCTR CNT OF OCB30570
                          STO   3 FSCTR     *FILES IN SYSTEM WS         OCB30580
                    DF125 LDX  L1 *-*       RESTORE XR1                 OCB30590
                          LDX  L2 *-*       RESTORE XR2                 OCB30600
                          BSC  I  DF000     RETURN                      OCB30610
                    *                                                   OCB30620
                    * PROCESS CURRENT WORKING STORAGE FILE              OCB30630
                    *                                                   OCB30640
                    DF135 DC      0         SWITCH FOR DIRECTION        OCB30650
                    DF140 LD    1 @BCNT     COMPUTE NEXT AVAILABLE SCTR OCB30660
                          STX   2 DF170+1                               OCB30670
                          LDX  I2 IGNOR+X3                              OCB30680
                          A     3 BLCKS                                 OCB30690
                          SRA     4                                     OCB30700
                          A    L2 SCTAD+X3                              OCB30710
                          STO     DF930                                 OCB30720
                          AND   3 K0FFF                                 OCB30730
                          S     3 SLIMT                                 OCB30740
                          BSC  L  DF180,-   BR IF NO WS REMAINS    2-10 OCB30750
                          LD    3 SHORT                                 OCB30760
                          STO   3 LSW04     CALL FOR SHORT MAP LINE     OCB30770
                    DF160 LD   L2 SCTAD+X3  FILL IN THE STARTING ADDR   OCB30780
                          STO   1 @SCAD     *FOR CURRENT FILE (IN WS)   OCB30790
                          LD      DF930                                 OCB30800
                          STO  L2 SCTAD+X3                              OCB30810
                          LD      DF940     RESTORE MAP SWITCH          OCB30820
                          STO   3 LMPSW                                 OCB30830
                          LD    1 @SCAD     FETCH SECTOR ADDR           OCB30840
                          AND   3 KF000     DOUBLE THE DRIVE        2-3 OCB30850
                          A     1 @SCAD     *CODE                  2-10 OCB30860
                          S    L2 $FPAD     RELATIVEIZE SCTR ADDR TO    OCB30870
                          OR    3 K8000     *BEGINNING OF WKNG STORAGE  OCB30880
                          STO   1 @SCAD                                 OCB30890
                          BSI  L  FM000     PRINT A LINE OF FILE MAP    OCB30900
                    DF170 LDX  L2 *-*       RESTORE XR2                 OCB30910
                          LD      DF135                                 OCB30920
                          S       DF996                                 OCB30930
                          BSC  I  DF135,+-  BR IF EQUATED FILE IN WS    OCB30940
                          MDX     DF270     BR TO PROCESS NEXT FILE     OCB30950
                    *                                                   OCB30960
                    * TRUNCATE CURRENT WORKING STORAGE FILE,            OCB30970
                    * IF POSSIBLE                                       OCB30980
                    *                                                   OCB30990
                    DF180 LD    3 IGNOR                                 OCB31000
                          SLA     12                                    OCB31010
                          OR    3 SLIMT                                 OCB31020
                          A     3 K1        COMPUTE SA OF END       2-9 OCB31030
                          STO     DF930     *OF DISK.                   OCB31040
                          S    L2 SCTAD+X3  FIND LENGTH OF FILE AND     OCB31050
                          SLA     4         *COMPUTE FILE INFORMATION.  OCB31060
                          STO   1 @BCNT     STORE FILE BLOCK COUNT      OCB31070
                          M     1 @RCSC                                 OCB31080
                          SLT     12                                    OCB31090
                          STO   1 @RCCT     STORE SECTOR COUNT          OCB31100
                          LD    3 LONGX                                 OCB31110
                          STO   3 LSW04     CALL FOR LONG MAP LINE      OCB31120
                          LD    1 @BCNT     ERROR IF NO WS LEFT    2-10 OCB31130
                          BSC  L  DF190,+-  *FOR THIS FILE         2-10 OCB31140
                          BSI  L  TF000     BR TO TRUNCATE FILE         OCB31150
                          MDX     DF160     BR TO FILL IN SCTR ADDR     OCB31160
                    *                                                   OCB31170
                    * INSUFFICIENT WORKING STORAGE FOR FILE(S)          OCB31180
                    *                                                   OCB31190
                    DF190 LDX   2 MSG02     FILE(S) EXCEED WORK STORAGE OCB31200
                          BSI  L  PM000     PRINT MESSAGE R02           OCB31210
                          LD      DF995                                 OCB31220
                          STO     DF190+1                               OCB31230
                          LDX  I2 IGNOR+X3  RESTORE XR2                 OCB31240
                          MDX     DF160     BACK TO FILL IN SECTOR ADDR OCB31250
                    *                                                   OCB31260
                    * CONSTANTS AND WORK AREAS                          OCB31270
                    *                                                   OCB31280
                    DF900 DC      *-*  NO. FILES DEFINED                OCB31290
                    DF910 DC      *-*  TEMPORARY STORE FOR DATA BUFFER  OCB31300
                    DF920 DC      @DFOF     CONSTANT                    OCB31310
                    DF930 DC      *-*  WASTEBASKET                      OCB31320
                    DF940 DC      *-*  ORIGINAL SETTING OF MAP SWITCH   OCB31330
                    DF950 DC      *-*  DF EQU BLOCK WORD COUNT          OCB31340
                    DF960 DC      *-*  SCTR ADDR FROM DATA BUFFER       OCB31350
                    *                       CONSTANTS REMOVED      2-10 OCB31360
                    DF990 DC      @MXDR MAX NO. DRIVES SUPPORTED        OCB31370
                    DF995 MDX     *+3                                   OCB31380
                    DF996 DC      DF100                                 OCB31390
                    *                                                   OCB31400
                    * PROCESS CURRENT EQUATED FILE                      OCB31410
                    *                                                   OCB31420
                    DF195 LD    1 @SCAD     IF ZERO FILE HAS NOT   2-10 OCB31430
                          BSC  L  DF200,+-  *BEEN EQUATED BEFORE    2-9 OCB31440
                          LDD   2 @EQNM     GET FILE NAME          2-10 OCB31450
                          SLT     2         *FOR ERROR MSG          2-9 OCB31460
                          STX   2 DF209+1   SAVE XR2                2-9 OCB31470
                          LDX   2 MSG68     POINT TO ERR MSG        2-9 OCB31480
                          MDX     DF208     GO TO SET UP PRINT      2-9 OCB31490
                    DF200 STX   1 DF207+1   SAVE XR1                    OCB31500
                          LDX   1 -@MXDR    NO. DRIVES TO XR1           OCB31510
                    DF205 LD    2 @EQID     COMPARE AN *FILES CART ID   OCB31520
                          BSC  L  DF210,+-  BRANCH IF NO CART ID        OCB31530
                          S    L1 LCIDN+X3+@MXDR *W/ CART ID ON SYSTEM  OCB31540
                          BSC  L  DF210,+-  BR IF MATCH OCCURS          OCB31550
                          MDX   1 1         SKIP IF NOT MOUNTED         OCB31560
                          MDX     DF205     BR TO CHECK NEXT CART ID    OCB31570
                          LD    2 @EQID                                 OCB31580
                    *                       CODE MOVED              2-9 OCB31590
                    DF207 LDX  L1 *-*       RESTORE XR1                 OCB31600
                          STX   2 DF209+1   SAVE XR2                2-9 OCB31610
                          LDX   2 MSG39      CARTRIDGE NOT MOUNTED  2-1 OCB31620
                    DF208 STD   3 RNAME                             2-9 OCB31630
                          BSI  L  PM000     PRINT ERROR MESSAGE         OCB31640
                    DF209 LDX  L2 *-*       RESTORE XR2             2-9 OCB31650
                          BSC  L  DF060     BR TO CHECK NEXT *FILES ENT OCB31660
                    DF210 STX   1 DF930                                 OCB31670
                          LD      DF930                                 OCB31680
                          A       DF990     INITIALIZE TO START LET     OCB31690
                          STO   3 IGNOR     *SEARCH CORRECTLY           OCB31700
                          LDX  I1 DF207+1   RESTORE XR1                 OCB31710
                          LDD   2 @EQNM                            2-10 OCB31720
                          BSI  L  DF135,+-  BR IF FILE IN WORK STORAGE  OCB31730
                          STD   3 NAME                                  OCB31740
                          BSI  L  LS000     LOOK UP FILE NAME IN LET    OCB31750
                    *                       *UPON RETURN, ACC =     212 OCB31760
                    *                       *LET/FLET INDR (LSW22)  212 OCB31770
                          BSC  L  TL100,Z   BR IF NOT IN LET        212 OCB31780
                          LDD   3 NAME                                  OCB31790
                          SLT     2                                     OCB31800
                          STD   3 RNAME                                 OCB31810
                          LD    2 @EQID     CHECK                  2-10 OCB31820
                          BSC  L  DF215,+-  *IF SPECIFIED           2-7 OCB31830
                          LD    3 DRCDE     *CARTRIDGE              2-7 OCB31840
                          SRA     12        *IS SAME AS             2-7 OCB31850
                          S     3 IGNOR     *ON WHICH FILE IS FOUND 2-7 OCB31860
                          BSC  L  DF215,+-  BRANCH IF YES           2-7 OCB31870
                          LDX   2 MSG16     PRINT ERROR MESSAGE     2-7 OCB31880
                          BSI  L  TL000     *IF NO                  2-7 OCB31890
                          BSI  L  TL100     BR TO EXIT FROM CLB     212 OCB31900
                    DF215 LD    3 LSW11     BRANCH IF THIS FILE IS      OCB31910
                          BSC  L  DF600,Z+  *IN THE USER AREA           OCB31920
                    DF220 LD    3 LDBCT                                 OCB31930
                          S     1 @BCNT                                 OCB31940
                          BSC  L  DF280,+Z  BR IF FILE TO BE TRUNCATED  OCB31950
                          LD    3 SHORT                                 OCB31960
                          STO   3 LSW04     CALL FOR SHORT MAP LINE     OCB31970
                    DF260 LD    3 BYADR     FILL IN THE STARTING SECTOR OCB31980
                          SRA     4                                     OCB31990
                          STO   1 @SCAD                                 OCB32000
                          LD    3 DRCDE                                 OCB32010
                          OR    1 @SCAD     PUT LOGICAL DRIVE CODE IN   OCB32020
                          STO   1 @SCAD     *1ST CHARACTER OF SCTR ADDR OCB32030
                          BSI     FM000     PRNT ALLOCATION OF FILE 2-9 OCB32040
                    DF270 LD      DF940     RESTORE MAP SWITCH          OCB32050
                          STO   3 LMPSW                                 OCB32060
                          BSC  L  DF050     BACK TO CONTINUE PROCESSING OCB32070
                    *                                                   OCB32080
                    * TRUNCATE CURRENT UA/FXA FILE, IF POSSIBLE         OCB32090
                    *                                                   OCB32100
                    DF280 LD    3 LDBCT     PUT ADJUSTED NO OF RECORDS  OCB32110
                          STO   1 @BCNT     *IN DEFINE FILE TABLE       OCB32120
                          BSI     TF000     BR TO TRUNCATE FILE     2-9 OCB32130
                          MDX     DF260     BR TO FILL IN SCTR ADDR     OCB32140
                    *                                                   OCB32150
                    *DO NOT ALLOW A DSF PROGRAM TO BE                   OCB32160
                    *USED AS A DATA FILE                                OCB32170
                    *                                                   OCB32180
                    DF600 STX   2 DF730+1   SAVE XR2                    OCB32190
                          LD    3 BYADR     BRANCH IF FILE DOES NOT     OCB32200
                          SLA     12        *BEGIN ON SECTOR            OCB32210
                          BSC  L  DF650,+-  *BOUNDARY                   OCB32220
                          LD    3 LSW12                                 OCB32230
                          BSC  L  DF650,Z+  BR IF CI PROG OR DATA       OCB32240
                          LDX   2 MSG19     FILE NOT ON SECTOR BOUNDARY OCB32250
                          BSI  L  PM000     PRINT MESSAGE R19           OCB32260
                    *                                                   OCB32270
                    * DO NOT ALLOW A CORE IMAGE PROGRAM TO REFERENCE    OCB32280
                    * A FILE STORED IN THE USER AREA                    OCB32290
                    *                                                   OCB32300
                    DF650 LD    3 LCBSW                                 OCB32310
                          BSC  L  DF730,+-  BR IF LOADING A DSF PROGRAM OCB32320
                    DF700 LDX   2 MSG23      SHOULD BE IN FIXED AREA2-1 OCB32330
                          BSI  L  PM000     PRINT ERROR MESSAGE         OCB32340
                          LD      DF995                                 OCB32350
                          STO     DF700+1                               OCB32360
                    DF730 LDX  L2 *-*                                   OCB32370
                          MDX     DF220                                 OCB32380
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB32390
                    * TRUNCATE A FILE                                   OCB32400
                    *                                                   OCB32410
                    TF000 DC      *-*                                   OCB32420
                          M     1 @RCSC                                 OCB32430
                          SLT     12                                    OCB32440
                          STO   1 @RCCT                                 OCB32450
                          LD    3 LONGX     CALL FOR LONG MAP LINE      OCB32460
                          STO   3 LSW04                                 OCB32470
                          STX   2 TF150+1   SAVE XR2                    OCB32480
                          LDX   2 MSG06                                 OCB32490
                    TF100 BSI  L  PM300     PRNT ERROR MSG IF MAP REQ-2 OCB32500
                          LD      *-1                                   OCB32510
                          STO     TF100                                 OCB32520
                          STO     TF100+1                               OCB32530
                    TF150 LDX  L2 *-*       RESTORE XR2                 OCB32540
                          BSC  I  TF000     RETURN                      OCB32550
                          HDNG    CORE LOAD BUILDER, PHASE 2            OCB32560
                    * MAP THE FILES                                     OCB32570
                    *                                                   OCB32580
                    FM000 DC      *-*       ENTRY POINT                 OCB32590
                          LD    3 LMPSW                                 OCB32600
                          BSC  L  FM200,+-  BR IF NO MAP REQUESTED      OCB32610
                          STX   1 FM100+1   SAVE XR1                    OCB32620
                          LD   L  BUFLO+1                               OCB32630
                          STO     FM900                                 OCB32640
                          LDX  L1 @CLBB                                 OCB32650
                          BSI  L  LK000     FETCH PHASE 11              OCB32660
                    FM100 LDX  L1 *-*       RESTORE XR1                 OCB32670
                          BSI  L  M1000     PRINT A LINE                OCB32680
                          LD      FM900                                 OCB32690
                          STO  L  BUFLO+1                               OCB32700
                          LD    3 LOBUF                                 OCB32710
                          SRT     16                                    OCB32720
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB32730
                    FM200 BSC  I  FM000     RETURN                      OCB32740
                    *                                                   OCB32750
                    * CONSTANTS AND WORK AREAS                          OCB32760
                    *                                                   OCB32770
                    FM900 DC      *-*  SCTR ADDR FROM DATA BUFFER       OCB32780
                    *                                               2-2 OCB32790
                          BSS     /0AA0-*   PATCH AREA             2-11 OCB32800
                    *                                               2-2 OCB32810
                    P2END EQU     *-1                                   OCB32820
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB32830
                    *************************************************** OCB32840
                    *STATUS -VERSION 2, MODIFICATION LEVEL 12         * OCB32850
                    *                                                 * OCB32860
                    *FUNCTION/OPERATION-                              * OCB32870
                    *   * PHASE 3 OVERLAYS UPPER PART OF PHASE 2. IF  * OCB32880
                    *     ANY LOCALS/SOCALS IT IS CALLED INTO CORE    * OCB32890
                    *     MORE THAN ONCE.                             * OCB32900
                    *     * HR000-CHECKS THE INFORMATION IN SUBROUTINE* OCB32910
                    *       HEADER RECORDS ( EXEPT ILS'S) AND STORES  * OCB32920
                    *       IT IN RCOM.                               * OCB32930
                    *     * CC000-IS CALLED BY MASTER CONTROL         * OCB32940
                    *       SUBROUTINE TO CONTROL LOADING OF A        * OCB32950
                    *       SUBROUTINE BY TYPE. THE OTHER SUBROUTINES * OCB32960
                    *       OF THIS PHASE ARE CALLED FROM HERE.       * OCB32970
                    *     * TY000-CHECKS THAT LIBFS ARE REFERENCED BY * OCB32980
                    *       LIBF AND CALLS BY CALL. NO CHECK DURING   * OCB32990
                    *       2ND PASS.                                 * OCB33000
                    *     * SV000-CHECKS WHETHER OR NOT A SUBPROGRAM  * OCB33010
                    *       HAS ALREADY BEEN RELOCATED UNDER A        * OCB33020
                    *       DIFFRENT NAME I.E. ANOTHER ENTRY POINT.   * OCB33030
                    *                                                 * OCB33040
                    *ENTRY POINTS-                                    * OCB33050
                    *   * EACH SUBROUTINE HAS ONLY ONE ENTRY POINT    * OCB33060
                    *             BSI  L  XX000                       * OCB33070
                    *     WHERE XX000 IS THE FIRST WORD IN THE SUBROUT* OCB33080
                    *                                                 * OCB33090
                    *INPUT-                                           * OCB33100
                    *   * SUBROUTINE HEADER RECORDS                   * OCB33110
                    *                                                 * OCB33120
                    *OUTPUT-                                          * OCB33130
                    *   * INITIALIZED WORDS IN RCOM                   * OCB33140
                    *                                                 * OCB33150
                    *EXTERNAL REFERENCES-                             * OCB33160
                    *   * SUBROUTINES-                                * OCB33170
                    *     * LS000-FIND A PROGRAM IN LET/FLET          * OCB33180
                    *     * NW000-FETCH A WORD FROM DATA BUFFER       * OCB33190
                    *     * PM000-FLIPPER FOR PRINTING MESSAGE        * OCB33200
                    *     * RH000-READ PROGRAM HEADER TO DATA BUFFER  * OCB33210
                    *     * TL000-PRINT ERROR MESSAGE AND EXIT        * OCB33220
                    *   * COMMA/DCOM-N/A                              * OCB33230
                    *                                                 * OCB33240
                    *EXITS-                                           * OCB33250
                    *   * NORMAL-                                     * OCB33260
                    *     * BACK TO CALLER VIA FIRST WORD             * OCB33270
                    *   * ERROR-                                      * OCB33280
                    *     * TO TL000 FDR PRINTING MESSAGES AND EXIT   * OCB33290
                    *       FROM CLB                                  * OCB33300
                    *                                                 * OCB33310
                    *TABLES/WORK AREAS-                               * OCB33320
                    *   * LOAD TABLE                                  * OCB33330
                    *   * RCOM                                        * OCB33340
                    *                                                 * OCB33350
                    *NOTES-N/A                                        * OCB33360
                    *************************************************** OCB33370
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB33380
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB33390
                    *                                                   OCB33400
                          ORG     MV000                                 OCB33410
*SBRKGL  7A         *CORE LOAD BUILDER, PHASE 3                   V2M03 OCB33420
                          DC      P3END-*-1 PHASE 3 WD CNT              OCB33430
                          DC      @CLB3 ID NO. OF CLB, PHASE 3          OCB33440
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB33450
                    * PROCESS THE PROGRAM HEADER RECORD                 OCB33460
                    *                                                   OCB33470
                    HR000 DC      *-*       ENTRY POINT                 OCB33480
                          STX   1 HR065+1   SAVE XR1                    OCB33490
                          STX   2 HR065+3   SAVE XR2                    OCB33500
                          SLT     32                                    OCB33510
                          STO   3 ISSTV                                 OCB33520
                          STO   3 CLASS     SET CLASS TO ZERO           OCB33530
                          LDX  I1 INDEX+X3                              OCB33540
                          LD    1 @TYPE                                 OCB33550
                          SRA     8                                     OCB33560
                          STO   3 LTYPE     SAVE THE PROGRAM TYPE       OCB33570
                          LD    1 @PREC                                 OCB33580
                          SLA     8                                     OCB33590
                          STO   3 WASTE     SAVE CURRENT PRECISION      OCB33600
                          LD    3 LTYPE                                 OCB33610
                          S     3 K2        BR ON MAINLINES             OCB33620
                          BSC  L  HR060,+   *I.E., TYPES 1 AND 2        OCB33630
                          S     3 K5        BR UNLESS AN ILS            OCB33640
                          BSC  L  HR080,Z   *(TYPE 7) PROGRAM           OCB33650
                    HR060 LDX   2 MSG66                                 OCB33660
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXIT   OCB33670
                    HR065 LDX  L1 *-*       RESTORE XR1                 OCB33680
                          LDX  L2 *-*       RESTORE XR2                 OCB33690
                          BSC  I  HR000     RETURN                      OCB33700
                    *                                                   OCB33710
                    * PROCESS A TYPE 3, 4, 5, OR 6 PROGRAM              OCB33720
                    *                                                   OCB33730
                    HR080 LD    3 K0                                    OCB33740
                          STO   3 LSW05                                 OCB33750
                          STO   3 LSW07                                 OCB33760
                          LD    3 LPREC                                 OCB33770
                          BSC     Z         SKIP IF ML PRECISION = ZERO OCB33780
                          LD    3 WASTE                                 OCB33790
                          BSC     Z         SKIP IF CURR PRECISION ZERO OCB33800
                          S     3 LPREC     BRANCH IF ML PRE AND CURR   OCB33810
                          BSC  L  HR100,+-  *PRECISIONS AGREE           OCB33820
                          LD    3 LPREC     SKIP IF NO MAINLINE     2-5 OCB33830
                          BSC     +Z        *INTEGER PREC SPECIFIED 2-5 OCB33840
                          LD    3 WASTE     ERROR R 21 IF CURRENT   2-5 OCB33850
                          BSC  L  HR090,+Z  *INTEGER PREC SPECIFIED 2-5 OCB33860
                          LD    3 LPREC     COMPARE ONLY REAL       2-5 OCB33870
                          EOR   3 WASTE     *PRECISION OF MAINLINE  2-5 OCB33880
                          SLA     4         *AND SUBROUTINE         2-5 OCB33890
                          BSC  L  HR100,+-  BRANCH IF SAME          2-5 OCB33900
                    HR090 LDX   2 MSG21     INCONSISTENT PRECISIONS     OCB33910
                          BSI  L  PM000     PRINT MESSAGE R21           OCB33920
                    HR100 LD   L  @CMON     BR IF MAINLINE              OCB33930
                          S     1 @COMN     *COMMON NOT LONGER THAN     OCB33940
                          BSC  L  HR110,-   *ANY OTHER COMMON           OCB33950
                          LDX   2 MSG20     INCONSISTENT  COMMON        OCB33960
                          BSI  L  PM000     PRINT MESSAGE R20           OCB33970
                    HR110 LD    1 @LHDR     SAVE WD CNT OF VARIABLE     OCB33980
                          STO     HR930     *LENGTH PART OF HEADER      OCB33990
                          SRT     16                                    OCB34000
                          D       HR910                                 OCB34010
                          STO   3 NOPTS     SAVE NO. OF ENTRY PTS.      OCB34020
                          S       HR920     BRANCH IF NO. ENTRY POINTS  OCB34030
                          BSC  L  HR130,Z+  *IS LESS THAN MAX ALLOWED   OCB34040
                          LDX   2 MSG65                                 OCB34050
                          BSI  L  TL000     PRINT ERROR MESSAGE, EXIT   OCB34060
                    HR130 LD    3 LTYPE                                 OCB34070
                          SLA     16                                    OCB34080
                          LD    3 K1                                    OCB34090
                          BSC     C                                     OCB34100
                          LD    3 K0        SET SWITCH TO INDICATE THAT OCB34110
                          STO     HR940     *THIS IS A LIBF             OCB34120
                          LD    3 LTYPE                                 OCB34130
                          S     3 K5        SKIP ON ISS, I.E.,          OCB34140
                          BSC     Z         *TYPE 5 AND 6 PROGRAMS      OCB34150
                          S     3 K1                                    OCB34160
                          BSC  L  HR300,+-  BR ON ISS PROGRAMS          OCB34170
                          LD    3 LTYPE                                 OCB34180
                          S       HR950                                 OCB34190
                          BSC  L  HR300,+-  BR IF TYPE 35               OCB34200
                    *                                                   OCB34210
                    * BUILD TABLE OF NAMES,ENTRY PTS.,TV ENTRY ADDR.    OCB34220
                    *                                                   OCB34230
                          LDX  L2 ENTPT                                 OCB34240
                          MDX  L  INDEX+X3,@NAME-@ZERO-1                OCB34250
                    HR150 BSI  L  NW000     GO GET 1ST PART OF NAME     OCB34260
                          STO   2 @WRD1                                 OCB34270
                          BSI  L  NW000     GO GET 2ND PART OF NAME     OCB34280
                          STO   2 @WRD2                                 OCB34290
                          BSI  L  NW000     FETCH RELATIVE EXEC ADDR,   OCB34300
                          STO   2 @WRD3     *STORE IN ENTRY PT TBL      OCB34310
                          LDD   2 @WRD1                                 OCB34320
                          SD    3 NAME                                  OCB34330
                          BSC     +-        SKIP IF NAMES UNEQUAL       OCB34340
                          RTE     16                                    OCB34350
                          BSC  L  HR155,Z   BRANCH IF NAMES UNEQUAL     OCB34360
                          LD    2 @WRD3                                 OCB34370
                          STO   3 RLXEQ                                 OCB34380
                    HR155 LD    3 K0                                    OCB34390
                          STO   2 @WRD4                                 OCB34400
                          MDX   2 @LTEN     SET TO LOOK AT NXT ENT      OCB34410
                          MDX  L  HR930,+@NAME-@ENTY-1                  OCB34420
                          MDX     HR150     BACK TO MAKE NEXT COMPARE   OCB34430
                          MDX     HR200     BR TO CHECK TYPE, SUBTYPE   OCB34440
                    *                                                   OCB34450
                    * CONSTANTS AND WORKING STORAGE                     OCB34460
                    *                                                   OCB34470
                    HR910 DC      @ENTY-@NAME+1                         OCB34480
                    HR920 DC      @MXEP+1 1+MAX NO. ENTRY PTS ALLOWED   OCB34490
                    HR930 DC      *-*  NO. HDR WDS LEFT TO PROCESS      OCB34500
                    HR940 DC      *-*  SWITCH TO INDICATE LIBF OR CALL  OCB34510
                    HR950 DC      /0035 TYPE FOR 'Z' SUBROUTINES        OCB34520
                    HR960 DC      /0013 TYPE FOR DISK FI/O              OCB34530
                    HR970 DC      ISTVX-1 ADDR OF ISS TBL MINUS 1       OCB34540
                    HR980 DC      /0084 TYPE FOR FUNCTIONALS            OCB34550
                    HR990 DC      @ITVX ADDR OF ITV IN CORE IMAGE HDR   OCB34560
                    *                                                   OCB34570
                    * CHECK TYPE AND SUBTYPE FOR VALIDITY               OCB34580
                    *                                                   OCB34590
                    HR200 LD    3 LTYPE                                 OCB34600
                          MDX  L  INDEX+X3,@ZERO-@ENTY                  OCB34610
                          S     3 K6                                    OCB34620
                          BSC     Z         SKIP ON TYPE 06             OCB34630
                          A     3 K1                                    OCB34640
                          BSC     Z         SKIP ON TYPE 05             OCB34650
                          A     3 K1                                    OCB34660
                          BSC     Z         SKIP ON TYPE 04             OCB34670
                          A     3 K1                                    OCB34680
                          BSC  L  HR065,+-  BRANCH ON TYPE 03           OCB34690
                          LD    3 LTYPE                                 OCB34700
                          S       HR980                                 OCB34710
                          BSC  L  HR230,+-  BRANCH ON TYPE 84           OCB34720
                          LD    3 LTYPE                                 OCB34730
                          S       HR960                                 OCB34740
                          BSC  L  *+2,Z     BRANCH UNLESS TYPE 13       OCB34750
                          LD    3 K3        CLASS 3                     OCB34760
                          MDX     HR250     BR TO STORE CLASS CODE      OCB34770
                          S     3 K16                                   OCB34780
                          BSC  L  *+2,Z     BRANCH UNLESS TYPE 23       OCB34790
                    HR230 LD    3 K1        TYPE 23, CLASS 1            OCB34800
                          MDX     HR250                                 OCB34810
                          S     3 K16                                   OCB34820
                          BSC  L  HR270,Z   BR UNLESS TYPE 33           OCB34830
                    HR240 LD    3 K2        CLASS 2                     OCB34840
                    HR250 STO   3 CLASS                                 OCB34850
                          BSC  L  HR065     TO EXIT                     OCB34860
                    HR270 LD    3 LTYPE                                 OCB34870
                          S       HR950                                 OCB34880
                          BSC  L  HR060,Z   BR UNLESS TYPE 35           OCB34890
                          MDX     HR240     BR TO STORE CLASS CODE      OCB34900
                    *                                                   OCB34910
                    * PROCESS A SUBROUTINE ASSOCIATED WITH AN INTERRUPT OCB34920
                    * LEVEL (5).                                        OCB34930
                    *                                                   OCB34940
                    HR300 LD    1 @ISSN     COMP, STORE ISS TBL ADDR    OCB34950
                          MDX  L  INDEX+X3,@NAME+1-@ZERO           2-10 OCB34960
                          MDX  L  HR930,+@NAME-@NILS-1                  OCB34970
                          A       HR970                                 OCB34980
                          STO   3 ISSTV                                 OCB34990
                          STO     HR320+1                               OCB35000
                          LDX  L2 ENTPT     ADDR ENTRY PT TBL TO XR2    OCB35010
                          LD    3 K1                                    OCB35020
                          STO   3 NOPTS                                 OCB35030
                          LDD   3 NAME      STORE THE NAME IN THE       OCB35040
                          STD   2 @WRD1     *ENTRY POINT TABLE          OCB35050
                          LD    3 K0                                    OCB35060
                          STO   2 @WRD4                            2-10 OCB35070
                          BSI  L  NW000     GET RELATIVE ENTRY      2-7 OCB35080
                          STO   2 @WRD3     *POINT ADDRESS AND     2-10 OCB35090
                          STO   3 RLXEQ     *SAVE IT                2-7 OCB35100
                          MDX  L  INDEX+X3,@NILS-@ENTY             2-10 OCB35110
                          LD    3 LSW17                                 OCB35120
                          BSC  L  HR370,Z   BRANCH DURING 2ND PASS      OCB35130
                    *                                                   OCB35140
                    * DETERMINE WHETHER ANOTHER VERSION OF              OCB35150
                    * THIS DEVICE SUBROUTINE ALREADY RELOCATED          OCB35160
                    *                                                   OCB35170
                    HR320 LD   L  *-*       FETCH ISS TABLE ENTRY       OCB35180
                          BSC  L  HR440,Z   *OF PROGRAM ALREADY LOADED  OCB35190
                    *                                                   OCB35200
                    * FLAG THE INTERRUPT LEVELS REQUIRED                OCB35210
                    *                                                   OCB35220
                    HR340 BSI  L  NW000     GO GET ILS LVL              OCB35230
                          A       HR990                                 OCB35240
                          STO     *+1       *FOR THIS INTERRUPT LEVEL   OCB35250
                          STO  L  *-*       FLAG THIS ITV ENTRY         OCB35260
                    HR350 MDX  L  HR930,-1  SKIP WHEN NO MORE IL NOS.   OCB35270
                          MDX     HR340     BR TO PROCESS NEXT WD       OCB35280
                          MDX   1 @ENTY-@NAME+1                         OCB35290
                          MDX     HR200     BR TO CHECK TYPE            OCB35300
                    HR370 BSI  L  NW000     INCREMENT INDEX POINTER     OCB35310
                          MDX     HR350     BR IF MORE TO PROCESS       OCB35320
                    *                                                   OCB35330
                    * ANOTHER ISS FOR SAME DEVICE HAS                   OCB35340
                    * ALREADY BEEN BUILT INTO THE CORE LOAD             OCB35350
                    *                                                   OCB35360
                    HR440 LDX  I2 HR065+1                               OCB35370
                          STO   2 @WRD3     PUT 1 IN EXEC ADDR OF TV EN OCB35380
                          LD    3 K1        1 TO SWITCH 5, I.E., DO     OCB35390
                          STO   3 LSW05     *NOT LOAD THIS PROGRAM      OCB35400
                          STX   2 HR470+1   SAVE XR2                    OCB35410
                          LDX   2 MSG22     ANOTHER VERSION LOADED      OCB35420
                          BSI  L  PM000     PRINT MESSAGE R22           OCB35430
                    HR470 LDX  L2 *-*       RESTORE XR2                 OCB35440
                          MDX     HR340      SHOW ENTRY BEEN SERVICED   OCB35450
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB35460
                    * CONTROL LOADING OF SUBROUTINES BY TYPE            OCB35470
                    *                                                   OCB35480
                    CC000 DC      *-*       ENTRY POINT                 OCB35490
                          LD    1 @WRD2                                 OCB35500
                          STO   3 NAME+1                                OCB35510
                          LD    3 K0        ZERO OUT LSW16              OCB35520
                          STO   3 LSW16                                 OCB35530
                          STO   3 LSW01     CLEAR BYPASS SWITCH         OCB35540
                          LD    3 LSW17                                 OCB35550
                          BSC  L  CC160,+-  BRANCH DURING 1ST PASS      OCB35560
                          LD    1 @WRD1     BRANCH IF CURRENT PROG      OCB35570
                          BSC  L  CC120,-   *IS NOT A LOCAL             OCB35580
                          LD    3 LSW09     BRANCH IF NOT CURRENTLY     OCB35590
                          BSC  L  CC140,Z   *PROCESSING LOCALS          OCB35600
                    *                                                   OCB35610
                    * INITIALIZE FOR PROCESSING LOCALS                  OCB35620
                    *                                                   OCB35630
                          LD    3 K4000     INITIALIZE FOR LOCAL        OCB35640
                          STO   3 SCTRX     *PROCESSING                 OCB35650
                          LD    3 LOCAR     SET START OF LOCAL AREA     OCB35660
                          STO   3 RELOC     *IN RELOCATION FACTOR       OCB35670
                          STO   3 LACTR                                 OCB35680
                    CC040 LD    1 @WRD1                                 OCB35690
                          SLA     2                                     OCB35700
                          SRA     2                                     OCB35710
                          STO   3 NAME                                  OCB35720
                          LD    3 K0                                    OCB35730
                          BSC     C         SKIP IF CALL FLAG NOT SET   OCB35740
                          LD    3 K1                                    OCB35750
                          STO   3 LSW08     SET CALL/LIBF SWITCH        OCB35760
                          BSI  L  LS000     FIND PROGRAM IN LET         OCB35770
                    *                       *UPON RETURN, ACC =     212 OCB35780
                    *                       *LET/FLET INDR (LSW22)  212 OCB35790
                          BSC  L  CC060,+Z  BR IF PROGRAM NOT FOUND 212 OCB35800
                          LD    3 DRCDE                                 OCB35810
                          STO   3 LDCDE                                 OCB35820
                          BSI  L  RH000     READ DOWN HEADER RECORD     OCB35830
                          BSI  L  HR000     PROCESS HEADER RECORD       OCB35840
                          BSI     TY000     CHK CONSISTENT CALL    2-10 OCB35850
                    CC060 LD    3 LSW05     BR IF ANOTHER VERSION   212 OCB35860
                          BSC  L  CC140,Z   *OF THIS I/O PROGRAM LOADED OCB35870
                    *                                                   OCB35880
                    * SCAN LOAD TABLE BACKWARD TO FIND OUT IF           OCB35890
                    * CURR PROG ALREADY LOADED                          OCB35900
                    *                                                   OCB35910
                    *                       ACC ZERO, CHK IF PROG  2-10 OCB35920
                          BSI     SV000     *ALREADY LOADED        2-10 OCB35930
                          LD    3 LSW01                                 OCB35940
                          BSC  L  CC080,Z   BR IF LOADING TO BE BYPASSD OCB35950
                    *                                                   OCB35960
                    * SCAN LOAD TABLE FORWARD TO FIND ANY               OCB35970
                    * OTHER ENTRY POINTS TO CURRENT PROG                OCB35980
                    *                                                   OCB35990
                          LD    3 K1        OUT TO FIND OUT IF OTHER    OCB36000
                          BSI     SV000     *ENT PTS AHEAD IN LD TB2-10 OCB36010
                    CC080 LD    3 LSW01     LOAD BY-PASS SW (A MUST 212 OCB36020
                          BSC  I  CC000     RETURN      *FOR MC000) 212 OCB36030
                    *                                                   OCB36040
                    * CHECK FOR LOADING A PART OF A SOCAL               OCB36050
                    *                                                   OCB36060
                    CC120 LD    3 LSW09                                 OCB36070
                          BSC  L  CC240,+   BR IF NOT PROCESSING SOCALS OCB36080
                          S     1 @WRD4     BR IF CURR PROG CAN BE      OCB36090
                          BSC  L  CC040,+-  *LOADED NOW                 OCB36100
                    CC140 LD    3 K1                                    OCB36110
                          STO   3 LSW01     SET BYPASS SWITCH           OCB36120
                          MDX     CC080     TO EXIT                     OCB36130
                    *                                                   OCB36140
                    * SET LOCAL SWITCH IF CURR PROG A LOCAL             OCB36150
                    *                                                   OCB36160
                    CC160 LD    1 @WRD1     BRANCH IF CURRENT PROG      OCB36170
                          BSC  L  CC280,-   *IS NOT A LOCAL             OCB36180
                    CC200 LD    3 K8        SET LSW16 TO NON ZERO       OCB36190
                          STO   3 LSW16                                 OCB36200
                          MDX     CC040     BR TO CONTINUE PROCESSING   OCB36210
                    *                                                   OCB36220
                    * DETERMINE WHETHER CURR PROG IS AN IN-CORE         OCB36230
                    *                                                   OCB36240
                    CC240 LD    1 @WRD4     BRANCH IF CURRENT PROG      OCB36250
                          BSC  L  CC040,+-  *IS AN IN-CORE              OCB36260
                          MDX     CC140     TO EXIT                     OCB36270
                    *                                                   OCB36280
                    * DETERMINE WHETHER CURR PROG CALLED BY A LOCAL     OCB36290
                    *                                                   OCB36300
                    CC280 LD    1 @WRD4                                 OCB36310
                          SRA     3         BRANCH UNLESS CURR          OCB36320
                          BSC  L  CC040,+-  *PROG CALLED BY A LOCAL     OCB36330
                          MDX     CC200     BR TO SET THE LOCAL SW      OCB36340
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB36350
                    *  CHECK TO SEE THAT LIBFS ARE REFERENCED BY        OCB36360
                    *  LIBF AND CALLS BY CALL                           OCB36370
                    *                                                   OCB36380
                    TY000 DC      *-*       ENTRY POINT                 OCB36390
                          LD    3 LSW17     RETURN IMMEDIATELY          OCB36400
                          BSC  I  TY000,Z   BRANCH DURING 2ND PASS      OCB36410
                          LD    3 LTYPE     GET HEADER TYPE             OCB36420
                          AND   3 KFF0F                                 OCB36430
                          S     3 K3        CHK TYPE 3 AND LIBF         OCB36440
                          S     3 LSW08     OR TYPE 4 AND CALL          OCB36450
                          BSC  I  TY000,+-  EXIT IF OK                  OCB36460
                          LD    3 LTYPE                                 OCB36470
                          AND   3 KFF0F                                 OCB36480
                          S     3 K5        CHK TYPE 5 FOR LIBF         OCB36490
                          S     3 LSW08     *AND TYPE 6 FOR CALL        OCB36500
                          BSC  L  TY050,+-  BR IF TYPE IS VALID         OCB36510
                          LDX   2 MSG64                                 OCB36520
                          BSI  L  PM000     PRINT ERROR MESSAGE         OCB36530
                    TY050 BSC  I  TY000     RETURN                      OCB36540
                          HDNG    CORE LOAD BUILDER, PHASE 3            OCB36550
                    * SCAN LOAD-TABLE AHEAD OF OR BEHIND CURRENT        OCB36560
                    * ENTRY FOR OTHER ENTRY PTS TO THE SAME SUBROUTINE  OCB36570
                    *                                                   OCB36580
                    SV000 DC      *-*       ENTRY POINT                 OCB36590
                          STX   1 SV150+1   SAVE XR1                    OCB36600
                          STX   2 SV150+3   SAVE XR2                    OCB36610
                          STO  L  SV950     BR IF SWITCH=1, I.E., IF2-2 OCB36620
                          BSC  L  SV240,Z   *SEARCHING AHEAD IN LD TBL  OCB36630
                    *                                                   OCB36640
                    * PREPARE TO SEARCH LOAD TABLE FROM 1ST NON-LOCAL   OCB36650
                    * ENTRY TO THE CURRENT ENTRY (BACKWARD SCAN)        OCB36660
                    *                                                   OCB36670
                          LD    3 LSW17                                 OCB36680
                          BSC  L  SV150,Z   BRANCH DURING 2ND PASS      OCB36690
                          LD    3 RIGHT     PREPARE TO SCAN BACKWARD IN OCB36700
                          STO     SV910     *LD TBL I.E.,FROM 1ST NON-  OCB36710
                          S     3 CURTV                                 OCB36720
                          BSC  L  SV150,+-  BR ON 1ST LD TBL ENTRY      OCB36730
                          LD    3 CURTV     *LOCAL ENTRY TO CURRENT     OCB36740
                    SV030 A       SV960                                 OCB36750
                          STO     SV940                                 OCB36760
                          LDX  I1 SV910     START ADDR FOR LD TBL SCAN  OCB36770
                    SV060 LD    3 NOPTS                                 OCB36780
                          STO     SV930                                 OCB36790
                          LDX  L2 ENTPT     ADDR ENTRY PT TBL TO XR2    OCB36800
                    SV090 LDD   1 @WRD1     FETCH NAME                  OCB36810
                          SLA     2                                     OCB36820
                          SRA     2                                     OCB36830
                          SD    2 @WRD1                                 OCB36840
                          BSC     +-        SKIP IF NAMES UNEQUAL       OCB36850
                          RTE     16                                    OCB36860
                          BSC  L  SV180,Z   BR IF NAMES UNEQUAL         OCB36870
                          LD      SV950     BRANCH IF SEARCHING FORWARD OCB36880
                          BSC  L  SV270,Z                               OCB36890
                          LD    1 @WRD1     BR IF CURR ENTRY IN LOAD    OCB36900
                          BSC  L  SV120,-   *TABLE IS NOT A LOCAL       OCB36910
                    *                                                   OCB36920
                    * CHECK FOR LOCAL CALLING A LOCAL AND FLAG SUBR     OCB36930
                    * CURRENTLY BEING RELOCATED ON A LOCAL              OCB36940
                    *                                                   OCB36950
                          STX   1 SV910     SAVE POINTER                OCB36960
                          LDX  I1 CURTV+X3                              OCB36970
                          LD    3 K8000     FLAG ENTRY IN LOAD TBL CUR- OCB36980
                          OR    1 @WRD1     *RENTLY BEING RELOCATED     OCB36990
                          STO   1 @WRD1     *AS A LOCAL                 OCB37000
                          LD    1 @WRD4     BRANCH IF CURRENTLY RE-     OCB37010
                          MDX  L  LLOSW+X3,0 SKIP IF LOCALS CANT CAL2-3 OCB37020
                          MDX     *+2       *LOCALS, BR OTHERWISE   2-3 OCB37030
                          BSC  L  BT600,Z   BR IF CUR LOC CALL LOC 2-10 OCB37040
                          LD      SV910     FLAG CURRENTLY RELOCATED    OCB37050
                          STO   1 @WRD4     *ENTRY AS AN UNSPECIFIED    OCB37060
                          LD    3 RLXEQ     *LOCAL                      OCB37070
                          STO   1 @WRD3     SAVE RELATIVE EXEC ADDR     OCB37080
                          MDX     SV140     TO EXIT                     OCB37090
                    *                                                   OCB37100
                    * COMPUTE ENTRY POINT ADDRESS                       OCB37110
                    *                                                   OCB37120
                    SV120 LD    1 @WRD3     FETCH PREVIOUS EXEC ADDR    OCB37130
                          S     2 @WRD3     SUB PREVIOUS RLTV EXEC ADDR OCB37140
                          A     3 RLXEQ     ADD CURR RELATIVE ADDR      OCB37150
                          LDX  I1 CURTV+X3  *AND STORE FOR EXEC ADDR OF OCB37160
                          STO   1 @WRD3     *THIS NON-LOCAL SUBROUTINE  OCB37170
                          LD    3 CLASS     SAVE CLASS CODE FOR NON-    OCB37180
                          STO   1 @WRD4     *LOCAL SUBROUTINE           OCB37190
                    SV140 LD    3 K1                                    OCB37200
                          STO   3 LSW01     SET BYPASS SWITCH           OCB37210
                    *                                                   OCB37220
                    * RETURN TO CALLER                                  OCB37230
                    *                                                   OCB37240
                    SV150 LDX  L1 *-*       RESTORE XR1                 OCB37250
                          LDX  L2 *-*       RESTORE XR2                 OCB37260
                          BSC  I  SV000     RETURN                      OCB37270
                    SV180 MDX   2 @LTEN     PICK OUT NEXT ENTRY POINT   OCB37280
                          MDX  L  SV930,-1  SKIP IF NO MORE ENTRY PTS.  OCB37290
                          MDX     SV090     BACK TO MAKE NEXT COMPARE   OCB37300
                    *                                                   OCB37310
                    * HAS BACKWARD SCAN ENDED                           OCB37320
                    *                                                   OCB37330
                    SV210 STX   1 SV910                                 OCB37340
                          LD      SV910                                 OCB37350
                          S       SV940     BRANCH IF SEARCH HAS REACH- OCB37360
                          BSC  L  SV150,+   *ED LEFTMOST LIMIT          OCB37370
                          MDX   1 -@LTEN    PICK OUT NEXT LD TBL ENTRY  OCB37380
                          MDX     SV060     BACK TO MAKE NEXT COMPARE   OCB37390
                    *                                                   OCB37400
                    * PREPARE TO SEARCH LOAD TABLE FROM CURRENT ENTRY   OCB37410
                    * TO THE END (FORWARD SCAN)                         OCB37420
                    *                                                   OCB37430
                    SV240 LD    3 CURTV                                 OCB37440
                          MDX  L  LSW17+X3,0 SKIP  DURING FIRST PASS    OCB37450
                          MDX     *+1       START SCAN WITH THIS ENTRY  OCB37460
                          S       SV960                                 OCB37470
                          STO     SV910                                 OCB37480
                          S     3 LEFTX     BR OUT IF CURR ENTRY IS2-10 OCB37490
                          BSC  L  SV150,+-  *LEFTMOST IN LD TBL    2-10 OCB37500
                          LD    1 @WRD1     IF PRIME NAME IS LOCAL      OCB37510
                          SRA     15        *SET SWITCH=0 IF LOCAL      OCB37520
                          EOR   3 K1        *AND 1 IF NON-LOCAL         OCB37530
                          STO     SV900                                 OCB37540
                          LD    3 LEFTX                                 OCB37550
                          MDX     SV030     BACK TO ANOTHER PASS        OCB37560
                    SV270 LD    1 @WRD1     SET LSW08 TO ZERO IF TABLE  OCB37570
                          SLA     2         *ENTRY BEING COMPARED       OCB37580
                          LD    3 K0        *AGAINST IS A LIBF          OCB37590
                          BSC     C         *OR ONE IF IT IS A CALL     OCB37600
                          LD    3 K1                                    OCB37610
                          STO   3 LSW08                                 OCB37620
                          BSI     TY000     CHECK CONSISTENT CALL  2-10 OCB37630
                          LD    3 LSW17                                 OCB37640
                          BSC     Z         SKIP DURING 1ST PASS        OCB37650
                          STO     SV900     SET SWITCH TO NON-LOCAL     OCB37660
                          SLA     16                                    OCB37670
                          MDX  L  SV900,0   SKIP IF PROCESSING A LOCAL  OCB37680
                          A     3 RELOC     ADD RELOCATION FACTOR TO    OCB37690
                          A     2 @WRD3     *RELATIVE EXECUTION ADDR    OCB37700
                          STO   1 @WRD3     *STORE IN 3RD LD TBL WORD   OCB37710
                          MDX  L  LSW17+X3,0 SKIP  DURING FIRST PASS    OCB37720
                          MDX     SV390     GET EXIT CONTROL ADDR       OCB37730
                          LD    3 CLASS                                 OCB37740
                          MDX  L  SV900,0   SKIP IF A LOCAL             OCB37750
                          MDX     SV360     BR TO STORE CLASS CODE      OCB37760
                          LD    1 @WRD4     TEST IF LOC HAS CALLED 2-10 OCB37770
                          MDX  L  LLOSW+X3,0 SKIP IF LOC-CALL-LOC  2-10 OCB37780
                          MDX     *+2       *BYPASS SPECIFIED      2-10 OCB37790
                          BSC  L  SV510,Z   BR IF LOC CALLED LOC   2-10 OCB37800
                          LD      SV150+1   STORE ENTRY POINTER         OCB37810
                    SV300 STO   1 @WRD4     *INTO 4TH WD OF LD TBL ENT  OCB37820
                    *                                                   OCB37830
                    * SET LOCAL FLAG IF CURRENT ENTRY WAS SPECIFIED     OCB37840
                    * AS A LOCAL ON AN *LOCAL RECORD                    OCB37850
                          LD      SV900                                 OCB37860
                          EOR   3 K1                                    OCB37870
                          SLA     15                                    OCB37880
                          OR    1 @WRD1                                 OCB37890
                          STO   1 @WRD1                                 OCB37900
                          MDX     SV210     GO CONTINUE SCAN AHEAD      OCB37910
                    SV360 OR    3 LSW16     SET CALLED-BY-A-LOCAL SW    OCB37920
                          MDX     SV300     BR TO FILL IN 4TH WD        OCB37930
                    *                                                   OCB37940
                    * CONSTANTS AND WORK AREAS                          OCB37950
                    *                                                   OCB37960
                    SV900 DC      *-*  ZERO=LOCAL   1=NON-LOCAL         OCB37970
                    SV910 DC      *-*  WASTEBASKET                      OCB37980
                    SV920 DC      *-*  CONTENTS OF EXIT CONTROL WORD    OCB37990
                    SV930 DC      *-*  CT. OF NO. ENTRY PTS. IN PROGRAM OCB38000
                    SV940 DC      *-*  RIGHT LIMIT OF SEARCH            OCB38010
                    SV950 DC      *-*  SWITCH FOR DETERMINING MODE      OCB38020
                    SV960 DC      @LTEN WD CNT OF A LOAD TABLE ENTRY    OCB38030
                    *                                                   OCB38040
                    *                                                   OCB38050
                    *                                                   OCB38060
                    SV390 STX  L1 WASTE+X3  STORE CURRENT POINTER       OCB38070
                          STX   2 SV480+1   SCAN TBL TO FIND EXIT CTRL  OCB38080
                          LDX  I2 RIGHT+X3  *ADDR TO STORE IN 4TH       OCB38090
                          LD    3 TVEND     *WORD OF LOAD TABLE ENTRY   OCB38100
                          STO     SV920                                 OCB38110
                    SV420 LD    2 @WRD1     FETCH 1ST WD OF NAME        OCB38120
                          SLA     1                                     OCB38130
                          BSC  L  SV450,+   BRANCH IF CALL              OCB38140
                          MDX  L  SV920,-@LBEN ADJUST EXIT CTRL ADDR    OCB38150
                          STX   2 SV910                                 OCB38160
                          LD    3 WASTE                                 OCB38170
                          S       SV910     BR IF ADDR HAS              OCB38180
                          BSC  L  SV480,+-  *BEEN OBTAINED              OCB38190
                    SV450 MDX   2 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB38200
                          MDX     SV420     BR TO CHK IF CALL OR LIBF   OCB38210
                    SV480 LDX  L2 *-*       RESTORE XR2                 OCB38220
                          LD      SV920     STORE EXIT CTRL TO ENT TBL  OCB38230
                          STO   2 @WRD4                                 OCB38240
                          MDX     SV210     GO CONTINUE SCAN AHEAD      OCB38250
                    *                                                   OCB38260
                    * A LOCAL HAS CALLED A LOCAL                        OCB38270
                    *                                                   OCB38280
                    SV510 LDD  I  CURTV+X3  LD CURR NAME           2-10 OCB38290
                          BSC  L  BT610     GO SET UP ERR MSG17    2-10 OCB38300
                          BSS     /0A9F-*   PATCH AREA             2-10 OCB38310
                          DC      0         PATCH AREA                  OCB38320
                    P3END EQU     *-1                                   OCB38330
                          HDNG    BUFFERS REQUIRED BY CORE LOAD BUILDER OCB38340
                          BSS  E  0                                     OCB38350
                    BUFLS EQU     *         LET/FLET SEARCH BUFFER      OCB38360
                    BUFLO EQU     *+322     DATA BUFFER                 OCB38370
                    BUFCI EQU     *+644     CIB BUFFER                  OCB38380
                          HDNG    CORE LOAD BUILDER, PHASE 4            OCB38390
                    *************************************************** OCB38400
                    *STATUS - VERSION 2,MODIFICATION LEVEL 12         * OCB38410
                    *                                                 * OCB38420
                    *FUNCTION/OPERATION-                              * OCB38430
                    *   * PHASE 4 OVERLAYS PHASE 3 OR 5 AND CONSISTS  * OCB38440
                    *     OF SUBROUTINES                              * OCB38450
                    *     * IL000-SEEKS FLAGGED INTERUPT LEVELS AND   * OCB38460
                    *       FETCHES AND RELOCATES CORESPONDING ILS.   * OCB38470
                    *     * ET000-DETERMINES WHETHER OR NOT CORE LOAD * OCB38480
                    *       FITS IN CORE STORAGE OR CAN BE MADE TO FIT* OCB38490
                    *       BY COMPUTNG CORE THAT CAN BE SAVED BY     * OCB38500
                    *       EMPLOYING SOCALS.                         * OCB38510
                    *                                                 * OCB38520
                    *ENTRY POINTS-                                    * OCB38530
                    *   * ONE ENTRY POINT IN EACH SUBROUTINE          * OCB38540
                    *             BSI  L  XX000                       * OCB38550
                    *     WHERE XX000 IS THE FIRST WORD.              * OCB38560
                    *                                                 * OCB38570
                    *INPUT-                                           * OCB38580
                    *   * ILS IN DSF                                  * OCB38590
                    *                                                 * OCB38600
                    *OUTPUT                                           * OCB38610
                    *   * RELOCATED ILS                               * OCB38620
                    *                                                 * OCB38630
                    *EXTERNAL REFERENCES-                             * OCB38640
                    *   * SUBROUTINES-                                * OCB38650
                    *     * CN000-CHECK NAME WITH THAT OF DISK I/O    * OCB38660
                    *     * LS000-FIND A PROGRAM IN LET/FLET          * OCB38670
                    *     * NW000-FETCH WORD FROM DATA BUFFER         * OCB38680
                    *     * PM300-FLIPPER FOR PRINTING MESSAGE        * OCB38690
                    *     * RH000-READ PROGRAM HEADER TO DATA BUFFER  * OCB38700
                    *     * RL000-RELOCATE A PROGRAM                  * OCB38710
                    *     * TL000-PRINT ERROR MESSAGE(S),EXIT FROM CLB* OCB38720
                    *     * TS000-PROCESS THE ILS BRANCH TABLE        * OCB38730
                    *   * COMMA/DCOM                                  * OCB38740
                    *     * $DADR                                     * OCB38750
                    *     * $D200                                     * OCB38760
                    *     * $I400                                     * OCB38770
                    *     * $STOP                                     * OCB38780
                    *                                                 * OCB38790
                    *EXITS-                                           * OCB38800
                    *   * NORMAL-                                     * OCB38810
                    *     * BACK TO CALLER VIA THE FIRST WORD         * OCB38820
                    *   * ERROR-                                      * OCB38830
                    *     * TO TL000 FOR PRINTING MESSAGE(S) AND EXIT * OCB38840
                    *       FROM CLB.                                 * OCB38850
                    *                                                 * OCB38860
                    *TABLES/WORK AREAS                                * OCB38870
                    *   * LOAD TABLE                                  * OCB38880
                    *   * RCOM                                        * OCB38890
                    *                                                 * OCB38900
                    *NOTES-N/A                                        * OCB38910
                    *************************************************** OCB38920
                          HDNG    CORE LOAD BUILDER, PHASE 4            OCB38930
                    * PARAMETERS FOR SYSTEM LOADER                      OCB38940
                    *                                                   OCB38950
                          ORG     MV000     ORG TO PHASE OVERLAY AREA   OCB38960
*SBRKGL  7B         *CORE LOAD BUILDER, PHASE 4                   V2M02 OCB38970
                          DC      P4END-*-1 PHASE 4 WD CNT              OCB38980
                          DC      @CLB4 ID NO. OF CLB, PHASE 4          OCB38990
                          HDNG    CORE LOAD BUILDER, PHASE 4            OCB39000
                    * FIND ILS ON DISK, FETCH IT, AND RELOCATE IT       OCB39010
                    *                                                   OCB39020
                    IL000 DC      *-*       ENTRY POINT                 OCB39030
                          STX   2 IL120+1   SAVE XR2                    OCB39040
                          STX   1 IL120+3   SAVE XR1                    OCB39050
                          LDX   2 6         NO. INTERRUPT LEVELS TO XR1 OCB39060
                    IL050 LD   L2 @ITVX-1   BRANCH IF THIS INTERRUPT    OCB39070
                          BSC  L  IL150,Z   *LEVEL HAS BEEN FLAGGED     OCB39080
                          LD      IL930                                 OCB39090
                    IL070 STO  L2 @ITVX-1                               OCB39100
                    IL100 MDX   2 -1        SKIP AFTER CHECKING LEVEL 0 OCB39110
                          MDX     IL050     BACK TO CHECK NEXT LEVEL    OCB39120
                    IL120 LDX  L2 *-*                                   OCB39130
                          LDX  L1 *-*                                   OCB39140
                          BSC  I  IL000     RETURN                      OCB39150
                    IL150 STX   2 IL900                                 OCB39160
                          S       IL930     BR IF CURR INT LEVEL        OCB39170
                          BSC  L  IL100,+-  *FLAGGED WITH TRAP ADDR     OCB39180
                    *                                                   OCB39190
                    * CREATE NAME OF REQUIRED ILS                       OCB39200
                    *                                                   OCB39210
                          LD      IL910                                 OCB39220
                          STO   3 NAME                                  OCB39230
                          LD      IL900     LOAD ILS NUMBER + 1         OCB39240
                          S     3 K1                                    OCB39250
                          SRT     4         CONVERT NUMBER TO           OCB39260
                          SLA     2         *TRUNCATED EBCDIC           OCB39270
                          SLT     4                                     OCB39280
                          STO     IL935                             2-2 OCB39290
                          LD   L  $GCOM     BRANCH IF THIS IS A     2-2 OCB39300
                          BSC  L  IL450,Z   *GRAPHICS CORE LOAD     2-2 OCB39310
                          LD    3 LX3SW     BRANCH IF SPECIAL IL SUB2-2 OCB39320
                          BSC  L  IL450,Z   *REQUIRED               2-2 OCB39330
                          LD      IL935                             2-2 OCB39340
                          OR      IL910+1                               OCB39350
                    IL200 STO   3 NAME+1                                OCB39360
                          STO     IL999     SAVE FOR LATER TEST     2-6 OCB39370
                    *                                                   OCB39380
                    * FIND ILS AND RELOCATE IT                          OCB39390
                    *                                                   OCB39400
                          BSI  L  LS000     FIND ILS IN LET             OCB39410
                    *                       *UPON RETURN, ACC =     212 OCB39420
                    *                       *LET/FLET INDR (LSW22)  212 OCB39430
                          BSC  L  IL240,+Z  BR IF NOT IN LET/FLET   212 OCB39440
                          LD    3 DRCDE                                 OCB39450
                          STO   3 LDCDE                                 OCB39460
                          BSI  L  RH000     FETCH REQUIRED ILS          OCB39470
                          LDX  I1 INDEX+X3                              OCB39480
                          LD    1 @TYPE     FETCH TYPE CODE             OCB39490
                          S       IL950     CHECK FOR TYPE 7, SUBTYPE 1 OCB39500
                          BSC  L  IL250,+-  BR IF TYPE 17               OCB39510
                          LD    3 K0        ZERO TO CLASS CODE          OCB39520
                          STO   3 CLASS                                 OCB39530
                          LD    3 K7        7 TO TYPE                   OCB39540
                          STO   3 LTYPE                                 OCB39550
                          STO   3 LSW07     SET SWITCH 7                OCB39560
                          STO   3 LSW03     SET INHIBIT TV STORE IN RL  OCB39570
                          MDX  L  INDEX+X3,@ISSP-@ENTY                  OCB39580
                          BSI  L  RL000     RELOCATE PROGRAM            OCB39590
                          LD      IL999     TEST FOR ILSX2          2-6 OCB39600
                          SLA     14        * OR ILS02              2-6 OCB39610
                          SRA     14        *                       2-6 OCB39620
                          S     3 K2                                2-6 OCB39630
                          BSC  L  IL460,+-  BRANCH IF YES           2-6 OCB39640
                    IL240 LD    3 K0        RESET INHIBIT TV STORE      OCB39650
                          STO   3 LSW03                                 OCB39660
                          LD    3 LADDR     SAVE LOADING ADDRESS FOR    OCB39670
                          A     3 LEVLS                                 OCB39680
                          MDX     IL070     BACK TO CONTINUE PROCESSING OCB39690
                    IL250 LD      IL900                                 OCB39700
                          S     3 K3                                    OCB39710
                          BSC  L  IL270,Z   BR IF PROCESSING ILS04      OCB39720
                          LD      IL985     FETCH ADDR OF SYS ILS02     OCB39730
                          MDX     IL070     BR TO OUTPUT THE ADDR       OCB39740
                    IL270 LD      IL970     FETCH ADDR OF IBT4          OCB39750
                          STO     IL350+1                               OCB39760
                          MDX  L  INDEX+X3,@ENTY-@ZERO+3                OCB39770
                          LD    3 K1                                    OCB39780
                          MDX     IL310     BR TO SET 9-COUNTER         OCB39790
                    IL300 LD      IL995                                 OCB39800
                    IL310 STO     IL990     INITIALIZE 9-COUNTER        OCB39810
                    IL320 BSI  L  NW000     FETCH DATA WORD             OCB39820
                          MDX  L  IL990,-1  SKIP IF NEXT WD IS AN       OCB39830
                          MDX     *+1       *INDICATOR,BR OTHERWISE     OCB39840
                          MDX     IL300     BR TO FETCH INDICATOR WORD  OCB39850
                          BSC  L  IL400,+-  BR IF END OF TABLE          OCB39860
                          STO   3 NAME                                  OCB39870
                          BSI  L  TS000     PROCESS AN IBT WORD         OCB39880
                    IL350 STO  L  *-*       STORE A WORD IN IBT4        OCB39890
                          MDX  L  IL350+1,1 PT TO NEXT WORD IN IBT4     OCB39900
                          MDX     IL320     BR TO FETCH NEXT DATA WORD  OCB39910
                    IL400 LD      IL980     FETCH ADDR OF SYS ILS04     OCB39920
                          MDX     IL070     BR TO OUTPUT THE ADDR       OCB39930
                    IL450 LD      IL935     'OR' IN SPECIAL         2-2 OCB39940
                          OR      IL940+1   *ILS NAME               2-2 OCB39950
                          MDX     IL200     BR TO STORE NAME        2-2 OCB39960
                    *                                                   OCB39970
                    * CONSTANTS AND WORK AREAS                          OCB39980
                    *                                                   OCB39990
                    IL900 DC      *-*  1+CURRENT ILS NO.                OCB40000
                    IL910 DN      ILS00                                 OCB40010
                    IL930 DC      $STOP ADDR PROGRAM STOP KEY TRAP      OCB40020
                    IL935 DC      *-*  WASTEBASKET                  2-2 OCB40030
                    IL940 DN      ILSX0                             2-2 OCB40040
                    IL950 DC      /1700 TYPE 7, SUBTYPE 1               OCB40050
                    IL970 DC      @ILS4 ADDR OF IBT4                    OCB40060
                    IL980 DC      $I400 ADDR OF SYSTEM ILS04            OCB40070
                    IL985 DC      $I200 ADDR OF SYSTEM ILS02            OCB40080
                    IL990 DC      *-*  9-COUNTER                        OCB40090
                    IL995 DC      9    NO. WDS FROM 1 INDR TO NEXT      OCB40100
                    IL998 DC      4                                 2-6 OCB40110
                    IL999 DC      0                                 2-6 OCB40120
                    IL901 DC      0                                 2-6 OCB40130
                    IL902 DC      /1000                             2-6 OCB40140
                    IL903 DC      /140                              2-6 OCB40150
                    IL460 STO  L  IND05     ZERO R05 INDICATOR     2-11 OCB40160
                          LD    3 SUBWC     COMPUTE AND STORE LENG.2-11 OCB40170
                          A     3 K1        * OF SUBROUTINE         2-6 OCB40180
                          STO     IL999     *                       2-6 OCB40190
                          LD    3 LACTR     IS LOADING              2-6 OCB40200
                          S     3 K1        ADDRESS                 2-6 OCB40210
                          STO     IL901     BELOW                   2-6 OCB40220
                          S       IL902     4 K                     2-6 OCB40230
                          BSC  L  IL240,-   BRANCH IF NO            2-6 OCB40240
                          A       IL902     ADD BACK                2-6 OCB40250
                    IL470 S       IL998     SUBTRACT 4              2-6 OCB40260
                          SRT     16        DIVIDE                  2-6 OCB40270
                          D       IL903     *MODULO /140            2-6 OCB40280
                          SLT     16                                2-6 OCB40290
                          BSC  L  IL480,+-  BR IF LOCATION MOD /140 2-6 OCB40300
                          MDX  L  IL999,-1  DECREMENT COUNTER       2-6 OCB40310
                          MDX     *+1                               2-6 OCB40320
                          MDX     IL240     BR BACK IF FINISHED     2-6 OCB40330
                          MDX  L  IL901,-1  DECREMENT CORE COUNTER  2-6 OCB40340
                          LD      IL901     CHECK NEXT LOCATION     2-6 OCB40350
                          MDX     IL470                             2-6 OCB40360
                    IL480 LD      IL999     LOAD COUNTER FOR OUTPUT 2-6 OCB40370
                          STO   3 RNAME     STORE IN OUTPUT AREA    2-6 OCB40380
                          STX   2 IL481+1   SAVE XR2                2-6 OCB40390
                          LDX   2 MSG48     LOAD MESSAGE NUMBER     2-6 OCB40400
                          BSI  L  PM000     BR FOR PRINTING OUTPUT  2-6 OCB40410
                          LDX   2 MSG05     LOAD MESSAGE            2-6 OCB40420
                          BSI  L  PM000     BR TO PRINT OUTPU       2-6 OCB40430
                          STX  L0 IND05     SET INDR FOR R05 MSG   2-11 OCB40440
                    IL481 LDX  L2 *-*       RESTORE XR2             2-6 OCB40450
                          BSC  L  IL240     BR BACK                 2-6 OCB40460
                          HDNG    CORE LOAD BUILDER, PHASE 4            OCB40470
                    ET000 DC      *-*       ENTRY POINT                 OCB40480
                          LD    3 K0        CLEAR THE LOCAL SWITCH      OCB40490
                          STO   3 LSW16                                 OCB40500
                          MDX  L  @OVSW,0   SKIP IF THERE ARE NO LOCALS OCB40510
                          MDX     ET080     *BRANCH OTHERWISE           OCB40520
                    *                                                   OCB40530
                    * COMPUTE NO. WORDS OF CORE AVAILABLE,              OCB40540
                    * ALLOWING FOR THE LOAD TABLE                       OCB40550
                    *                                                   OCB40560
                    ET020 LD    3 ITVCT     ADJUST LEFT END OF      2-8 OCB40570
                          SLA     15        *TRANSFER VECTOR IF WE  2-8 OCB40580
                          SRA     15        *HAD AN EVEN NUMBER OF  2-8 OCB40590
                          EOR   3 K1        *CALLS IN THIS PROGRAM  2-8 OCB40600
                          STO   3 ITVCT     *                       2-8 OCB40610
                          A     3 RLCOR     *                       2-8 OCB40620
                          S     3 MLWD1     SUB ADDR OF MAINLINE        OCB40630
                          MDX  L  @OVSW,0   SKIP IF NO LOCALS           OCB40640
                          S       ET940     ALLOW FOR FLIPR ROUTINE 2-8 OCB40650
                          S     3 FLIPT     SUB LENGTH OF FLIPPER TABLE OCB40660
                          STO     ET900     STORE NO. WORDS AVAILABLE   OCB40670
                    *                                                   OCB40680
                    * COMPUTE NO. WORDS OF CORE REQUIRED BY CORE LOAD,  OCB40690
                    * EXCLUSIVE OF THE LOAD TABLE                       OCB40700
                    *                                                   OCB40710
                          SLA     16        CLEAR ACCUMULATOR           OCB40720
                          LDX   1 INCOR-LOCAL-1                         OCB40730
                    ET040 A    L1 LOCAL+X3+1 ACCUMULATE CORE LD WD CNT  OCB40740
                          MDX   1 1         SKIP WHEN DONE,BRANCH       OCB40750
                          MDX     ET040     *TO CONTINUE ACCUMULATION   OCB40760
                          A     3 ILSCT     ADD IN ILS LENGTHS          OCB40770
                          S       ET900     COMPARE WITH CORE AVAILABLE OCB40780
                          BSC  L  ET320,Z-  BR IF CORE LOAD TOO LONG    OCB40790
                          EOR  L  ET905     COMPLEMENT THE DIFFERENCE   OCB40800
                          BSC     E         SKIP IF DIFFERENCE EVEN     OCB40810
                          A     3 K1        MAKE DIFFERENCE EVEN        OCB40820
                          STO   3 RNAME                                 OCB40830
                          LD    3 LSW22     GET LET/FLET SWITCH     212 OCB40840
                          BSC  L  ET050,Z   BR IF ALL SUBR NOT FOUND212 OCB40850
                          LDX   2 MSG41     WORDS AVAILABLE             OCB40860
                          BSI  L  PM300     PRINT MESSAGE R41           OCB40870
                    ET050 MDX  L  LSW19+X3,0 SKIP IF NO LOCALS      212 OCB40880
                          MDX     ET180     *BRANCH OTHERWISE           OCB40890
                    *                                                   OCB40900
                    * CLEAR ALL CLASS CODES IN LOAD TABLE TO ZERO       OCB40910
                    *                                                   OCB40920
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB40930
                          LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB40940
                          SLA     16        CLEAR ACCUMULATOR TO ZERO   OCB40950
                    ET060 STO   1 @WRD4     SET CLASS CODE TO ZERO      OCB40960
                          MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB40970
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB40980
                          MDX     ET060     *TBL, BRANCH OTHERWISE      OCB40990
                          LD   L  @OVSW     MUST BE FOR MC000 ROUT  212 OCB41000
                    ET070 BSC  I  ET000     RETURN                      OCB41010
                    *                                                   OCB41020
                    * GET SIZE OF FLIPPER TABLE AND                     OCB41030
                    * REFLECT IT IN CORE AVAILABLE COUNT                OCB41040
                    *                                                   OCB41050
                    ET080 LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB41060
                          LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB41070
                    ET100 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB41080
                          BSC  L  ET120,-   BRANCH IF NOT LOCAL         OCB41090
                          SLA     1         ZERO TO ACCUMULATOR FOR A   OCB41100
                          SRA     15        *LIBF, 1 FOR A CALL         OCB41110
                          A       ET925                                 OCB41120
                          A       ET900     COMPUTE AND STORE NEW NO.   OCB41130
                          STO     ET900     * WORDS AVAILABLE           OCB41140
                    ET120 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB41150
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB41160
                          MDX     ET100     * BRANCH OTHERWISE          OCB41170
                          LD      ET900                                 OCB41180
                          BSC     E         SKIP IF AVAILABLE CNT EVEN  OCB41190
                          MDX     ET160     BR TO INCR IN-CORE WD CNT   OCB41200
                    ET140 STO   3 FLIPT     STORE FLIPPER TABLE WD CNT  OCB41210
                          MDX     ET020     BR TO CHECK CORE LOAD LNG   OCB41220
                    ET160 MDX  L  INCOR+X3,1 INCR IN-CORE TALLY BY 1    OCB41230
                          MDX     ET140     BR TO STORE FLIPPER TBL CNT OCB41240
                    *                                                   OCB41250
                    * CONSTANTS AND WORK AREAS                          OCB41260
                    *                                                   OCB41270
                    ET900 DC      *-*       WORDS OF CORE AVAILABLE     OCB41280
                    ET901 DC      /FFF7     MASK OUT BITS 0-12          OCB41290
                    ET910 DC      @LBEN-2                               OCB41300
                    ET915 DC      2*@LBEN+1                             OCB41310
                    ET920 DC      @CLEN                                 OCB41320
                    ET925 DC      @FLEN     WD CNT OF LIBF FLIP TBL ENT OCB41330
                    ET930 DC      FL998     WD CNT OF LOCAL/SOCAL FLIPR OCB41340
                    ET935 DC      $STOP     ADDR OF PROGRAM STOP TRAP   OCB41350
                    ET940 DC      FL998+2   SIZE OF FLIPR+WC/SA     2-8 OCB41360
                    *                                                   OCB41370
                    *                                                   OCB41380
                    *                                                   OCB41390
                    * CLEAR BITS 0-12 OF NON-LOCAL LOAD TABLE ENTRIES,  OCB41400
                    * SET CLASS CODE TO ZERO FOR IN-CORE SUBROUTINES,   OCB41410
                    * AND SET EXECUTION ADDRESS TO ZERO FOR NON-LOCALS  OCB41420
                    *                                                   OCB41430
                    ET180 LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB41440
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB41450
                    ET200 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB41460
                          BSC  L  ET220,+Z  BRANCH IF LOCAL             OCB41470
                          LDD   1 @WRD1                                 OCB41480
                          STD   3 NAME                                  OCB41490
                          BSI  L  CN000     CHECK NAME                  OCB41500
                          LD    3 LSW18     BR IF NAME OF ONE OF THE    OCB41510
                          BSC  L  ET310,Z   *DISK I/O SUBROUTINES       OCB41520
                          LD    1 @WRD4     'AND' OUT BIT 12            OCB41530
                          AND     ET901     * OF 4TH WORD OF ENTRY      OCB41540
                          STO   1 @WRD4                                 OCB41550
                          LD    3 OVLAY     COMPARE CLASS CODE          OCB41560
                          S     1 @WRD4     *WITH OVERLAY MODE          OCB41570
                          SLA     1                                     OCB41580
                          LD    3 K0        SKIP IF CURR ENTRY NOT      OCB41590
                          BSC     C         *AN IN-CORE SUBROUTINE      OCB41600
                          STO   1 @WRD4     SET CLASS CODE TO ZERO      OCB41610
                          STO   1 @WRD3     SET EXEC ADDR TO ZERO       OCB41620
                    ET220 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB41630
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE,  OCB41640
                          MDX     ET200     *BRANCH OTHERWISE           OCB41650
                    *                                                   OCB41660
                    * GET NO. CALLS IN ARITH/FUNC OVERLAY (SOCAL 1)     OCB41670
                    *                                                   OCB41680
                          LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB41690
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB41700
                    ET240 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB41710
                          SLA     1                                     OCB41720
                          BSC  L  ET260,-   BR IF CURR ENTRY IS A LIBF  OCB41730
                          LD    1 @WRD4     FETCH 4TH WORD OF ENTRY     OCB41740
                          S     3 K1        BRANCH IF CURR ENTRY COULD  OCB41750
                          BSC  L  ET260,Z   *NOT BE IN SOCAL 1          OCB41760
                          MDX  L  SCLCT+X3,1 ACCUMULATE NO.SOCAL CALLS  OCB41770
                          MDX  L  RLCOR+X3,1 INCR AVAILABLE CORE BY 1   OCB41780
                    ET260 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB41790
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB41800
                          MDX     ET240     *BRANCH OTHERWISE           OCB41810
                    *                                                   OCB41820
                    * COMPUTE ADDR OF LEFT SIDE OF LIBF TV              OCB41830
                    *                                                   OCB41840
                          LD    3 RLCOR                                 OCB41850
                          A     3 LTVWC                                 OCB41860
                          BSC     E         SKIP IF NO GAP              OCB41870
                          A       ET910     ALLOW FOR DUMMY CALL        OCB41880
                          STO   3 TVEND     *LIBF TV AND STORE RESULT   OCB41890
                    *                                                   OCB41900
                    * PREPARE TO FETCH PHASE 2 AND BEGIN PASS 2         OCB41910
                    *                                                   OCB41920
                          LD    3 K1                                    OCB41930
                          STO   3 LSW17     SET 2ND PASS SWITCH         OCB41940
                          SRA     16                                    OCB41950
                          STO   3 LSW10     RESET INHIBIT TRANSFER SW   OCB41960
                          LD   L  @ITVX+5                               OCB41970
                          S       ET935     BR UNLESS LEVEL 5 FLAGGED   OCB41980
                          BSC  L  ET280,Z   *W/ ADDR PROG STOP KEY TRAP OCB41990
                          STO  L  @ITVX+5   CLEAR LEVEL 5 FLAG          OCB42000
                    ET280 LD   L  $DADR                                 OCB42010
                          STO   3 BYADR     STORE MAINLINE BLOCK ADDR   OCB42020
                          LD   L  $DCDE     RESTORE DRIVE CODE          OCB42030
                          STO   3 LDCDE     *OF MAINLINE                OCB42040
                          BSI  L  RH000     GET ML HEADER               OCB42050
                          LDX  I1 INDEX+X3  POINT TO 1ST  WD OF HDR     OCB42060
                          LD    3 K0                                    OCB42070
                          STO   3 HADDR     CLEAR HIGH-ADDR COUNTER     OCB42080
                          LD    3 LSW06                                 OCB42090
                          SRA     1         SET FILE SWITCH TO          OCB42100
                          STO   3 LSW06     *REPROCESS DEFINE FILES     OCB42110
                          LD    1 @TYPE                                 OCB42120
                          SRA     8                                     OCB42130
                          STO   3 LTYPE     SAVE MAINLINE TYPE          OCB42140
                          S     3 K1                                    OCB42150
                          BSC  L  ET300,+-  BR IF MAINLINE ABSOLUTE     OCB42160
                          LD    3 MLWD1                                 OCB42170
                    ET300 STO   3 RELOC     RESET RELOCATION FACTOR     OCB42180
                          LD    3 K1                                    OCB42190
                          STO   3 LSW03     SET SWITCH 3                OCB42200
                          BSC  L  ET070     TO EXIT                     OCB42210
                    *                                                   OCB42220
                    * CLEAR 4TH WD OF LOAD TBL ENTRY FOR DISK1/N        OCB42230
                    *                                                   OCB42240
                    ET310 LD    3 K0                                    OCB42250
                          STO   1 @WRD4     CLEAR WD 4 OF LD TBL ENTRY  OCB42260
                          MDX     ET220     BR TO EXAMINE NEXT ENTRY    OCB42270
                    *                                                   OCB42280
                    * DETERMINE WHETHER OR NOT CORE LOAD CAN            OCB42290
                    * BE MADE TO FIT BY EMPLOYING SOCALS                OCB42300
                    *                                                   OCB42310
                    ET320 STO     ET902     SAVE SHORTAGE               OCB42320
                          STO   3 RNAME                                 OCB42330
                          LD    3 LFORT                                 OCB42340
                          SLA     2         FORTRAN IND INTO SIGN   2-7 OCB42350
                    ET340 LDX   2 MSG40     SET UP ERROR R40        2-7 OCB42360
                          BSI  L  TL000,-   ERROR IF ML NOT FORTRAN 2-7 OCB42370
                    *                                                   OCB42380
                    *                                                   OCB42390
                          MDX  L  @OVSW,0   SKIP IF NO LOCALS           OCB42400
                          MDX     ET370     *BRANCH OTHERWISE           OCB42410
                          LD      ET902                                 OCB42420
                          A       ET930                                 OCB42430
                          STO     ET902     ALLOW FOR LOCAL/SOCAL FLIPR OCB42440
                    ET370 MDX  L  ET902,4*@LBEN+2 OPTION 1 OVERHEAD     OCB42450
                    *                                               2-2 OCB42460
                    * COMPARE THE SIZES OF SOCALS                   2-2 OCB42470
                    * CHECK IF ANY TWO SOCALS ARE ZERO              2-2 OCB42480
                    *                                               2-2 OCB42490
                          LD    3 ARITH     COMPARE THE SIZE OF     2-2 OCB42500
                          STO     ET950     *SOCAL 1 WITH           2-2 OCB42510
                          LD    3 FORIO     *THE SIZE OF            2-2 OCB42520
                          STO     ET950+1   *                       2-2 OCB42530
                          S     3 ARITH     *SOCAL 2 AND            2-2 OCB42540
                          SLA     1         *SET                    2-2 OCB42550
                          LDD     ET950     *ET950 WITH THE         2-2 OCB42560
                          BSC     C         *SMALLEST OF THE TWO    2-2 OCB42570
                          RTE     16        *AND                    2-2 OCB42580
                          STD     ET950     *ET950+1 WITH THE LARGER2-2 OCB42590
                    *                                               2-2 OCB42600
                          A     3 DKFIO     IS ANY TWO SOCALS       2-2 OCB42610
                          BSC     Z         *ZERO, BR TO PRINT      2-2 OCB42620
                          LD      ET950+1   *MSG 18 AND             2-2 OCB42630
                          BSI  L  TL000,+-  *EXIT                   2-2 OCB42640
                    *                                                   OCB42650
                          BSI  L  PM300     PRINT ERROR R40         2-7 OCB42660
                    *                                               2-2 OCB42670
                          LD    3 DKFIO     COMPARE SOCAL 3 WITH THE2-2 OCB42680
                          S       ET950+1   *LAGER OF SOCAL 1 AND   2-2 OCB42690
                          BSC  L  ET390,-   *SOCAL 2 AND SET        2-2 OCB42700
                          LD    3 DKFIO     *ET950+1                2-2 OCB42710
                          STO     ET950+1   *WITH THE SMALLEST      2-2 OCB42720
                    *                                                   OCB42730
                    * (SOCAL OVERHEAD IS COST OF 2 ADDITIONAL LIBF TV   OCB42740
                    * ENTRIES, 2 LONG BRANCHES, AND 1 WORD EACH FOR THE OCB42750
                    * WORD COUNT AND SECTOR ADDRESS OF THE SOCAL AREA.) OCB42760
                    *                                                   OCB42770
                    * PRINT SOCAL MESSAGES                              OCB42780
                    *                                                   OCB42790
                    ET390 LD    3 ARITH                                 OCB42800
                          STO   3 RNAME                                 OCB42810
                          LDX   2 MSG43     ARITH/FUNCTIONAL SIZE       OCB42820
                          BSI  L  PM300     PRINT MESSAGE R43           OCB42830
                          LD    3 FORIO                                 OCB42840
                          STO   3 RNAME                                 OCB42850
                          LDX   2 MSG44     FI/O SIZE                   OCB42860
                          BSI  L  PM300     PRINT MESSAGE R44           OCB42870
                    *                                                   OCB42880
                    * ARE THERE 2 MORE LIBF TV ENTRIES                  OCB42890
                    *                                                   OCB42900
                          LD    3 LTVWC     COMPARE LIBF TV LENGTH      OCB42910
                          S       ET904     WITH MAX LENGTH,OPTION 1    OCB42920
                          BSC  L  ET460,Z-  BR IF NOT ENOUGH ROOM       OCB42930
                    *                                                   OCB42940
                    * DETERMINE WHETHER OR NOT SOCAL OPTION             OCB42950
                    * 1 IS SUFFICIENT                                   OCB42960
                    *                                                   OCB42970
                          LD      ET950     GET SMALLES OF SOCAL 1/22-2 OCB42980
                    *                       6 STATEMENTS REMOVED    2-2 OCB42990
                          S       ET902     SUB +(EXCESS CORE REQD)     OCB43000
                          S     3 ITVCT     IF WE HAVE AN EVEN NMBR 2-8 OCB43010
                          S     3 ITVCT     *OF CALLS,TAKE CARE OF  2-8 OCB43020
                    *                       *THE TWO EXTRA WORDS    2-8 OCB43030
                    *                       *NEEDED IF AN ODD NUMBR 2-8 OCB43040
                    *                       *GOES INTO SOCAL 1      2-8 OCB43050
                          STO     ET902     *AND SAVE RESULT            OCB43060
                          MDX  L  OVLAY+X3,@LBEN-1 INDICATE OPTION 1    OCB43070
                          BSC  L  ET420,-   BRANCH IF FITS W/ OPTION 1  OCB43080
                          MDX  L  OVLAY+X3,@LBEN-2 INDICATE OPTION 2    OCB43090
                    *                                                   OCB43100
                    * DETERMINE WHETHER OR NOT SOCAL OPTION             OCB43110
                    * 2 IS SUFFICIENT                                   OCB43120
                    *                                                   OCB43130
                          LD    3 DKFIO                                 OCB43140
                          STO   3 RNAME                                 OCB43150
                          BSC  L  ET400,+-  BR IF NO DISK FI/O CALLED   OCB43160
                          MDX  L  ET902,-2*@LBEN                        OCB43170
                          LDX   2 MSG45     DISK FI/O SIZE              OCB43180
                          BSI  L  PM300     PRINT MESSAGE R45           OCB43190
                    ET400 LD    3 LTVWC     COMPARE LIBF TV LENGTH      OCB43200
                          S       ET907     *WITH MAX LENGTH, OPTION 2  OCB43210
                          BSC  L  ET460,Z-  BR IF NOT ENOUGH ROOM       OCB43220
                          LD      ET902                                 OCB43230
                          A       ET950+1   ADD THE SMALLES IN OP 2 2-2 OCB43240
                          BSC  L  ET420,-   *WITH SOCAL, OPTION 2       OCB43250
                          EOR     ET905     COMPLEMENT SHORTAGE LEFT    OCB43260
                          A     3 K1        *                       2-1 OCB43270
                    ET405 BSC     E         SKIP IF SHORTAGE EVEN       OCB43280
                          A     3 K1        MAKE SHORTAGE EVEN          OCB43290
                          STO   3 RNAME                                 OCB43300
                          MDX     ET340     BR BECAUSE WILL NOT FIT     OCB43310
                    *                                                   OCB43320
                    * COMPLETE THE SOCAL PROCESSING                     OCB43330
                    *                                                   OCB43340
                    ET420 BSC     E         SKIP IF WDS AVAILABLE EVEN  OCB43350
                          S     3 K1        MAKE WDS AVAILABLE EVEN     OCB43360
                          STO   3 RNAME                                 OCB43370
                          LD    3 LSW22     GET LET/FLET SWITCH     212 OCB43380
                          BSC  L  ET430,Z   BR IF ALL SUBR NOT FOUND212 OCB43390
                          LDX   2 MSG41     WORDS AVAILABLE             OCB43400
                          BSI  L  PM300     PRINT MESSAGE R41           OCB43410
                    ET430 LD    3 K1                                212 OCB43420
                          A     3 OVLAY     ADD SOCAL OPTION SWITCH     OCB43430
                          STO  L  @OVSW     SET OVERLAY SWITCH          OCB43440
                          LD    3 MLWD1     CALCULATE ADDR OF END       OCB43450
                          A     3 INCOR     *OF LAST IN-CORE SUBROUTINE OCB43460
                          STO     ET906                                 OCB43470
                          LD    3 OVLAY                                 OCB43480
                          S     3 K3                                    OCB43490
                          BSC  L  ET440,+-  BR IF OPTION 2 EMPLOYED     OCB43500
                          LD      ET906                                 OCB43510
                          A     3 DKFIO     ADD IN LENGTH OF            OCB43520
                          STO     ET906     DISK FORIO TO IN-CORE       OCB43530
                    *                                                   OCB43540
                    * COMPUTE ADDR OF SOCAL AREA                        OCB43550
                    *                                                   OCB43560
                    ET440 LD    3 LOCAL     FETCH WD CNT LONGEST LOCAL  OCB43570
                          BSC     Z         SKIP IF NO LOCALS           OCB43580
                          A     3 K2        ALLOW FOR LOCAL WD CNT,SAD  OCB43590
                          A       ET906     ALLOW FOR IN-CORE SUBRS     OCB43600
                          A    L  ET930     ALLOW FOR THE               OCB43610
                          A     3 K1        *LOCAL/SOCAL FLIPPER        OCB43620
                          A     3 FLIPT                                 OCB43630
                          BSC     E         SKIP IF ADDR ALREADY EVEN   OCB43640
                          A     3 K1        ADJUST TO EVEN BOUNDARY     OCB43650
                          STO   3 SOCAR                                 OCB43660
                          BSC  L  ET180     BR TO MODIFY LOAD TABLE     OCB43670
                    ET460 LDX   2 MSG09     TOO MANY LIBFS              OCB43680
                          BSI  L  TL000     PRINT MESSAGE R10 AND EXIT  OCB43690
                    *                                               2-2 OCB43700
                    *                                                   OCB43710
                    * CONSTANTS AND WORK AREAS                          OCB43720
                    *                                                   OCB43730
                          BSS  E  0                                 2-2 OCB43740
                    ET950 DC      *-*                               2-2 OCB43750
                          DC      *-*                               2-2 OCB43760
                    ET902 DC      *-*       -(EXCESS CORE REQUIRED)     OCB43770
                    ET904 DC      @MXLB*@LBEN-3*@LBEN MAX LIBF TV,SCL 1 OCB43780
                    ET905 DC      /FFFF     CONSTANT FOR COMPLEMENTING  OCB43790
                    ET906 DC      *-*       IN-CORE WORD COUNT          OCB43800
                    ET907 DC      @MXLB*@LBEN-4*@LBEN MAX LIBF TV,SCL 2 OCB43810
                    *                                                   OCB43820
                    P4END BSS     P3END-*   PATCH AREA                  OCB43830
                          DC      0         PATCH AREA                  OCB43840
                          HDNG    CORE LOAD BUILDER, PHASE 5            OCB43850
                    *************************************************** OCB43860
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * OCB43870
                    *                                                 * OCB43880
                    *FUNCTION/OPERATION-                              * OCB43890
                    *   * THIS PHASE IS FLIP-FLOPPED WITH PHASE 3. IT * OCB43900
                    *     IS BROUGHT INTO CORE ONCE IF THERE ARE      * OCB43910
                    *     LOCALS AND ONCE FOR EACH SOCAL. IT CONSISTS * OCB43920
                    *     OF SUBROUTINES                              * OCB43930
                    *     * PL000-BUILDS FLIPPER TABLE IF LOCALS ARE  * OCB43940
                    *       SPECIFIED.                                * OCB43950
                    *     * PS000-PROCESSES THE BUILDING OF EACH SOCAL* OCB43960
                    *     * FF000-RELOCATES FLIPPER SUBROUTINE.       * OCB43970
                    *                                                 * OCB43980
                    *ENTRY POINTS-                                    * OCB43990
                    *   * EACH SUBROUTINE HAS ONE ENTRY POINT         * OCB44000
                    *             BSI  L  XX000                       * OCB44010
                    *     WHERE XX000 IS THE FIRST WORD.              * OCB44020
                    *                                                 * OCB44030
                    *INPUT-                                           * OCB44040
                    *   * FLIPPER SUBROUTINE IN DSF                   * OCB44050
                    *                                                 * OCB44060
                    *OUTPUT-                                          * OCB44070
                    *   * THE FLIPPER TABLE                           * OCB44080
                    *   * SOCALS                                      * OCB44090
                    *   * RELOCATED FLIPPER SUBROUTINE                * OCB44100
                    *                                                 * OCB44110
                    *EXTERNAL REFERENCES-                             * OCB44120
                    *   * SUBROUTINES-                                * OCB44130
                    *     * GP000-GET/PUT DISK SUBROUTINE             * OCB44140
                    *     * LS000-FINDING PROGRAM IN LET/FLET         * OCB44150
                    *     * RH000-READ PROGRAM HEADER TO DATA BUFFER  * OCB44160
                    *     * RL000-RELOCATE A PROGRAM                  * OCB44170
                    *     * TR000-OUTPUT ONE DATA WORD TO CORE OR DISK* OCB44180
                    *   * COMMA/DCOM-                                 * OCB44190
                    *     * $FPAD                                     * OCB44200
                    *     * $WSDR                                     * OCB44210
                    *                                                 * OCB44220
                    *EXITS-                                           * OCB44230
                    *   * NORMA-                                      * OCB44240
                    *     * BACK TO CALLER VIA THE FIRST WORD         * OCB44250
                    *   * ERROR-N/A                                   * OCB44260
                    *                                                 * OCB44270
                    *TABLES/WORK AREAS-                               * OCB44280
                    *   * RCOM                                        * OCB44290
                    *                                                 * OCB44300
                    *NOTES-N/A                                        * OCB44310
                    *************************************************** OCB44320
                          HDNG    CORE LOAD BUILDER, PHASE 5            OCB44330
                    * PARAMETERS FOR SYSTEM LOADER                      OCB44340
                    *                                                   OCB44350
                          ORG     MV000     ORG TO PHASE OVERLAY AREA   OCB44360
*SBRKGL  7C         *CORE LOAD BUILDER, PHASE 5                   V2M02 OCB44370
                          DC      P5END-*-1 PHASE 5 WD CNT              OCB44380
                          DC      @CLB5 ID NO. OF CLB, PHASE 5          OCB44390
                          HDNG    CORE LOAD BUILDER, PHASE 5            OCB44400
                    PL000 DC      *-*       ENTRY POINT                 OCB44410
                    *                                                   OCB44420
                    * LOCAL PROCESSING                                  OCB44430
                    *                                                   OCB44440
                          LD    3 LSW09                                 OCB44450
                          STO   3 LSW19     SET OVERLAY SWITCH          OCB44460
                          LD    3 RELOC                                 OCB44470
                          STO   3 LACTR                                 OCB44480
                          LD    3 FLIPT                                 OCB44490
                          BSC     E         SKIP IF ALREADY EVEN        OCB44500
                          A     3 K1        MAKE FLIPPER TBL @WCNT EVEN OCB44510
                          A     3 RELOC     COMPUTE STARTING ADDR OF    OCB44520
                          STO   3 FLPAD     *FLIPPER TBL AND SAVE IT    OCB44530
                          A       PL930     ADD IN FLIPPER WD CNT       OCB44540
                          BSC     E         SKIP IF ADDR OF LOCAL AREA  OCB44550
                          A     3 K1        *EVEN, ADJUST OTHERWISE     OCB44560
                          STO   3 LOCAR     *GET ADDR OF LOCAL AREA     OCB44570
                          STO   3 LSADR                                 OCB44580
                          LDX  I1 $WSDR                                 OCB44590
                          LD    3 FSCTR                                 OCB44600
                          S    L1 $FPAD                                 OCB44610
                          STO  L  @LSCT                                 OCB44620
                    *                                                   OCB44630
                    * BUILD THE FLIPPER TABLE                           OCB44640
                    *                                                   OCB44650
                    PL040 LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB44660
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB44670
                          SRA     16                                    OCB44680
                          STO     PL910     CLEAR BYPASS SWITCH         OCB44690
                    PL060 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB44700
                          BSC  L  PL340,-   BR IF NOT A LOCAL           OCB44710
                          LD    1 @WRD4     BR IF ANOTHER ENTRY POINT   OCB44720
                          BSC  L  PL320,-   *TO A LOCAL                 OCB44730
                          MDX  L  PL910,0   SKIP IF CURR ENTRY NOT      OCB44740
                          MDX     PL340     *PROCESSED, BR OTHERWISE    OCB44750
                          STX   1 PL910     SET BYPASS SWITCH           OCB44760
                          EOR   3 K8000     SAVE WD CNT CURR LOCAL      OCB44770
                          STO     PL915     *WITH SIGN BIT SET          OCB44780
                    PL080 LD    1 @WRD3     FETCH RELATIVE EXEC ADDR    OCB44790
                          A     3 LOCAR     ADD ADDR OF LOCAL AREA      OCB44800
                          STO   1 @WRD3                                 OCB44810
                          LD    3 LACTR     STORE ADDR OF FLIPPER       OCB44820
                          STO   1 @WRD4     *TABLE ENTRY IN LOAD TABLE  OCB44830
                          LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB44840
                          SLA     1                                     OCB44850
                          BSC  L  PL220,-   BR IF CURR LOCAL A LIBF     OCB44860
                    *                                                   OCB44870
                    * START TO CREATE AN ENTRY IN FLIPPER TABLE FOR     OCB44880
                    * A CALL STATEMENT                                  OCB44890
                    *                                                   OCB44900
                          SRA     16                                    OCB44910
                    PL100 BSI  L  TR000     OUTPUT THE LINK WORD        OCB44920
                          MDX  L  FLIPT+X3,-@FCEN+@FLEN ACCUM FLIPT CNT OCB44930
                          LD    3 FLPAD                                 OCB44940
                          A       PL935                                 OCB44950
                          MDX     PL240     BR TO CONTINUE PROCESSING   OCB44960
                    *                                                   OCB44970
                    * CONSTANTS AND WORK AREAS                          OCB44980
                    *                                                   OCB44990
                    PL910 DC      *-*  SWITCH--NON-ZERO=BYPASS          OCB45000
                    PL915 DC      *-*  LOCAL WORD COUNT                 OCB45010
                    PL920 DC      *-*  ENTRY POINT TO FLIPPER           OCB45020
                    PL925 DC      FL010 LIBF ENTRY POINT TO FLIPPER     OCB45030
                    PL930 DC      FL998+1 WD CNT OF LOCAL/SOCAL FLIPPER OCB45040
                    PL935 DC      FL020 CALL ENTRY POINT TO FLIPPER     OCB45050
                    PL940 DC      $FPAD ADDR OF WKNG STORAGE,LOG DR 0   OCB45060
                    *                                                   OCB45070
                    *                                                   OCB45080
                    *                                                   OCB45090
                    *                                                   OCB45100
                    * START TO CREATE A ENTRY IN FLIPPER                OCB45110
                    * TABLE FOR A LIBF STATEMENT                        OCB45120
                    *                                                   OCB45130
                    PL220 LD    3 FLPAD                                 OCB45140
                          A       PL925                                 OCB45150
                    *                                                   OCB45160
                    * CREATE REMAINDER OF ENTRY                         OCB45170
                    *                                                   OCB45180
                    PL240 STO     PL920     SAVE FLIPR ENTRY ADDR       OCB45190
                          LD      PL100                                 OCB45200
                          BSI  L  TR000     OUTPUT BSI L                OCB45210
                          LD      PL920                                 OCB45220
                          BSI  L  TR000     OUTPUT FLIPPER ENTRY ADDR   OCB45230
                          LD      PL915                                 OCB45240
                          BSI  L  TR000     OUTPUT LOCAL WORD COUNT     OCB45250
                          LD   L  $WSDR                                 OCB45260
                          A       PL940                                 OCB45270
                          STO     PL250+1                               OCB45280
                          LD   I  WSADR+X3  FETCH CURR LOCAL SCTR ADDR  OCB45290
                    PL250 S    L  *-*       *ADDR AND RELATIVEIZE IT    OCB45300
                          BSI  L  TR000     OUTPUT SECTOR ADDR          OCB45310
                          LD    1 @WRD3     FETCH ABS EXEC ADDR         OCB45320
                          BSI  L  TR000     OUTPUT EXEC ADDR            OCB45330
                          LD    1 @WRD3     FLAG CURR LOCAL IN LD TBL   OCB45340
                          EOR   3 K8000     *AS HAVING BEEN PROCESSED   OCB45350
                          STO   1 @WRD3                                 OCB45360
                          MDX  L  FLIPT+X3,-@FLEN SKIP IF LAST FLIP TBL OCB45370
                          MDX     PL340     *ENTRY PROCESSED,BR OTHERWS OCB45380
                          LD    3 LACTR     ASSURE THAT FLIPPER         OCB45390
                          BSC     E         *SUBROUTINE WILL START ON   OCB45400
                          A     3 K1        *AN EVEN BOUNDARY           OCB45410
                          STO   3 RELOC                                 OCB45420
                          BSI  L  FF000     RELOCATE FLIPPER SUBROUTINE OCB45430
                    *                                                   OCB45440
                    * CLEAR WD 3 OF ALL LOCALS IN THE LOAD TABLE        OCB45450
                    *                                                   OCB45460
                          LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB45470
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB45480
                    PL260 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB45490
                          BSC  L  PL280,-   BR IF NOT A LOCAL           OCB45500
                          SRA     16                                    OCB45510
                          STO   1 @WRD3     CLEAR EXEC ADDR TO ZERO     OCB45520
                    PL280 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB45530
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB45540
                          MDX     PL260     BACK TO CHECK NEXT ENTRY    OCB45550
                          LD    3 K0                                    OCB45560
                          STO   3 LSW09     ZERO TO SWITCH 9            OCB45570
                          LD    3 FSCTR     RESTORE LOCAL SCTR ADDR     OCB45580
                          LDX  I1 $WSDR                                 OCB45590
                          STO  L1 SCTAD+X3                              OCB45600
                          BSC  I  PL000     RETURN                      OCB45610
                    *                                                   OCB45620
                    * DETERMINE WHETHER OR NOT TO PROCESS CURR LOCAL    OCB45630
                    *                                                   OCB45640
                    PL320 LD    1 @WRD3     FETCH EXEC ADDR             OCB45650
                          BSC  L  PL340,+Z  BR IF PROCESSED PREVIOUSLY  OCB45660
                          LD      PL910                                 OCB45670
                          S     1 @WRD4     BR IF ANOTHER ENTRY TO AN   OCB45680
                          BSC  L  PL080,+-  *ALREADY-PROCESSED LOCAL    OCB45690
                    PL340 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB45700
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE,  OCB45710
                          MDX     PL060     *BRANCH OTHERWISE           OCB45720
                    *                                                   OCB45730
                    * GET SECTOR ADDR OF LAST LOCAL                     OCB45740
                    *                                                   OCB45750
                          LD    3 WSADR                                 OCB45760
                          STO     PL360+1                               OCB45770
                          LD      PL915     FETCH LOCAL WD CNT          OCB45780
                    PL360 MDX  L  *-*,1     ACCUMULATE SECTOR ADDRESS   OCB45790
                          S     3 K320      SUB LENGTH OF 1 SCTR        OCB45800
                          BSC  L  PL040,+   BR IF ADDR COMPUTED         OCB45810
                          MDX     PL360     BACK TO CONTINUE COUNTING   OCB45820
                          HDNG    CORE LOAD BUILDER, PHASE 5            OCB45830
                    *                                                   OCB45840
                    * SOCAL PROCESSING                                  OCB45850
                    *                                                   OCB45860
                    PS000 DC      *-*       ENTRY POINT                 OCB45870
                          LD    3 LSW13                                 OCB45880
                          BSC  L  PS020,Z   BR UNLESS 1ST TIME THROUGH  OCB45890
                          LD    3 K1                                    OCB45900
                          STO   3 LSW13                                 OCB45910
                          LD    3 LSW09                                 OCB45920
                          STO   3 LSW19                                 OCB45930
                          LD    3 SCLCT     FETCH SOCAL TV COUNT        OCB45940
                          BSC     E         SKIP IF COUNT EVEN          OCB45950
                          A       PS940     MAKE COUNT EVEN             OCB45960
                          STO   3 SCLCT                                 OCB45970
                          LD    3 SOCAR                                 OCB45980
                          STO   3 LSADR                                 OCB45990
                          LD    3 FLPAD                                 OCB46000
                          BSC  L  PS010,Z   BR UNLESS NO LOCALS         OCB46010
                          LDX  I1 $WSDR                                 OCB46020
                          LD    3 FSCTR                                 OCB46030
                          S    L1 $FPAD     STORE RELATIVEIZED SOCAL    OCB46040
                          STO  L  @LSCT     *SECTOR ADDR                OCB46050
                          LD    3 RELOC                                 OCB46060
                          STO   3 FLPAD                                 OCB46070
                          BSI  L  FF000     FETCH THE FLIPPER SUBR      OCB46080
                    PS010 LD    3 K0        SET SW9 TO INDICATE END OF  OCB46090
                          STO   3 LSW09     *LOCAL PROCESSING MODE      OCB46100
                    PS020 LD    3 LSW09                                 OCB46110
                          S     3 K1                                    OCB46120
                          BSC  L  PS340,+-  BR IF PROCESSING SOCAL 1    OCB46130
                          LD    3 LSW09                                 OCB46140
                          BSC  L  PS480,Z   BR UNLESS IN LOCAL MODE     OCB46150
                    PS060 LD    3 SOCAR                                 OCB46160
                          STO   3 RELOC                                 OCB46170
                          LD    3 LSW09     COMPARE CURR SOCAL NO.      OCB46180
                          S     3 OVLAY     *WITH OVERLAY SWITCH        OCB46190
                          BSC  L  PS260,Z   BR IF MORE SOCALS TO DO     OCB46200
                    *                                                   OCB46210
                    * PREPARE TO RELOCATE REMAINING IN-CORE SUBROUTINES OCB46220
                    *                                                   OCB46230
                          LD    3 HADDR     SET RELOCATION FACTOR TO    OCB46240
                          STO   3 RELOC                                 OCB46250
                          LD    3 K8000     GO BACK TO IN-CORE MODE FOR OCB46260
                          STO   3 LSW09     *RELOCATING THE ILS'S       OCB46270
                          LD      PS950                                 OCB46280
                          STO   3 SCTRX                                 OCB46290
                    *                                                   OCB46300
                    * WRITE OUT LAST SOCAL SECTOR OUTSIDE CONTROL OF TR OCB46310
                    * SUBROUTINE SO THAT IT WILL NOT BE LOST            OCB46320
                    *                                                   OCB46330
                          LD    3 CIBBF                                 OCB46340
                          RTE     16                                    OCB46350
                          LD    3 K1                                    OCB46360
                          BSI  L  GP000     WRITE OUT CIB BUFFER        OCB46370
                          LD    3 LSW09     MUST BE FOR MC000 ROUT  212 OCB46380
                    PS120 BSC  I  PS000     RETURN                      OCB46390
                    *                                                   OCB46400
                    * CONSTANTS AND WORK AREAS                          OCB46410
                    *                                                   OCB46420
                    PS900 DC      *-*       NO. FUNCTIONALS REMAINING   OCB46430
                    PS905 DC      FL200     ADDR FUNC ENT,SOCAL FLIPPER OCB46440
                    PS940 DC      @CLEN     WD CNT OF A CALL TV ENTRY   OCB46450
                    PS945 DC      $FPAD                                 OCB46460
                    PS950 DC      @SCIB+1   1 + NO. SECTORS IN THE CIB  OCB46470
                    *                                                   OCB46480
                    * COMPUTE WORD COUNT AND SECTOR ADDR FOR CURR SOCAL OCB46490
                    *                                                   OCB46500
                    PS260 LDX  I2 LSW09+X3  SOCAL NO. TO XR2            OCB46510
                          LD    3 SCLCT     FETCH SOCAL TV WD CNT       OCB46520
                          A    L2 ARITH+X3                              OCB46530
                          STO  L2 S1WCT+X3  STORE SOCAL WD CNT          OCB46540
                          LD   L  $WSDR                                 OCB46550
                          A       PS945                                 OCB46560
                          STO     PS270+1                               OCB46570
                          LD   I  WSADR+X3  FETCH CURR SOCAL SCTR ADDR  OCB46580
                    PS270 S    L  *-*       *ADDR AND RELATIVEIZE IT    OCB46590
                          STO  L2 S1SAD+X3  STORE RLTV SCTR ADDR        OCB46600
                    *                                                   OCB46610
                    * OUTPUT SOCALS AND THE SOCAL TV                    OCB46620
                    *                                                   OCB46630
                          LD      PS950                                 OCB46640
                          STO   3 SCTRX                                 OCB46650
                          LD    3 SOCAR     FETCH ADDR OF SOCAL AREA    OCB46660
                          A     3 SCLCT     ADD NO. OF FUNCTION SUBRS   OCB46670
                          STO   3 LACTR                                 OCB46680
                          STO   3 RELOC                                 OCB46690
                          LD    3 LSW09                                 OCB46700
                          A     3 K1                                    OCB46710
                          STO   3 LSW09                                 OCB46720
                          S     3 K1        BR IF CURRENTLY PROCESSING  OCB46730
                          BSC  L  PS120,+-  *SOCAL, OPTION 1            OCB46740
                          LD    3 SCLCT     FETCH SOCAL TV COUNT        OCB46750
                          STO     PS900                                 OCB46760
                          BSC  L  PS120,+-  BRANCH IF NO FUNCTIONS      OCB46770
                    *                                                   OCB46780
                    * OUTPUT THE SOCAL TV FOR SOCALS 2 AND/OR 3         OCB46790
                    *                                                   OCB46800
                          LD    3 SOCAR     SET LOCATION ADDR CTR TO    OCB46810
                          STO   3 LACTR     *OUTPUT THE SOCAL TV        OCB46820
                    PS280 LD      PS905     OUTPUT ADDR OF SOCAL FLIP-  OCB46830
                          A     3 FLPAD     *PER ENTRY FOR FUNCTIONS    OCB46840
                          STO   3 STVAD                             2-2 OCB46850
                          BSI  L  TR000     *AND OUTPUT IT              OCB46860
                          MDX  L  PS900,-1  SKIP AFTER LAST SOCAL TV    OCB46870
                          MDX     PS280     *ENTRY, BR OTHERWISE        OCB46880
                          MDX     PS120     TO EXIT                     OCB46890
                    *                                                   OCB46900
                    * OUTPUT THE SOCAL TV FOR SOCAL 1                   OCB46910
                    *                                                   OCB46920
                    PS340 LD    3 SCLCT                                 OCB46930
                          STO     PS900                                 OCB46940
                          BSC  L  PS480,+-  BR IF NO FUNCTION SUBRS     OCB46950
                          LDX  I1 RIGHT+X3  SCAN FOR SOCAL              OCB46960
                          LD    3 SOCAR     *TV EXECUTION ADDR          OCB46970
                          STO   3 LACTR     SET TO OUTPUT SOCAL TV      OCB46980
                    PS360 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB46990
                          BSC  L  PS380,Z+  BRANCH FOR LOCAL ENTRIES    OCB47000
                          SLA     1                                     OCB47010
                          BSC  L  PS380,-   BR IF CURR ENTRY IS A LIBF  OCB47020
                          LD    1 @WRD4     FETCH CLASS CODE            OCB47030
                          BSC  L  PS380,+-  BR IF ENTRY IS AN IN-CORE   OCB47040
                          LD    1 @WRD3     FETCH EXECUTION ADDR        OCB47050
                          BSI  L  TR000     OUTPUT A SOCAL TV ENTRY     OCB47060
                          MDX  L  PS900,-1  SKIP AFTER LAST FUNCTION    OCB47070
                          MDX     PS380     BR TO PROCESS NEXT FUNC     OCB47080
                          MDX     PS400     BR AFTER LAST FUNCTIONS     OCB47090
                    PS380 MDX   1 -@LTEN    SKIP AT END OF LOAD TABLE   OCB47100
                          MDX     PS360     BR TO OUTPUT NEXT ENTRY     OCB47110
                    PS400 LD    3 CIBBF                                 OCB47120
                          RTE     16                                    OCB47130
                          LD    3 K1                                    OCB47140
                          BSI  L  GP000     WRITE CONTENTS OF CIB BFR   OCB47150
                    *                                                   OCB47160
                    * ACCUMULATE SCTR ADDR OF NEXT SOCAL                OCB47170
                    *                                                   OCB47180
                    PS480 LDX  I2 LSW09+X3  SOCAL NO. TO XR2            OCB47190
                          LD    3 WSADR                                 OCB47200
                          STO     PS500+1                               OCB47210
                          LD   L2 S1WCT-1+X3 FETCH CURR SOCAL WD CNT    OCB47220
                    PS500 MDX  L  *-*,1     ACCUMULATE SOCAL SCTR ADDR  OCB47230
                          S     3 K320                                  OCB47240
                          BSC  L  PS060,+   BR TO CONTINUE PROCESSING   OCB47250
                          MDX     PS500     BR UNTIL SCTR CT ACCUMULATD OCB47260
                          HDNG    CORE LOAD BUILDER, PHASE 5            OCB47270
                    * RELOCATE FLIPPER SUBROUTINE                       OCB47280
                    *                                                   OCB47290
                    FF000 DC      *-*       ENTRY POINT                 OCB47300
                          LDD     FF900     FETCH NAME OF FLIPPER SUBR  OCB47310
                          STD   3 NAME                                  OCB47320
                          LD    3 K1        SET SW 3                    OCB47330
                          STO   3 LSW03                                 OCB47340
                          BSI  L  LS000     LOOK UP FLIPPER IN LET      OCB47350
                    *                       *UPON RETURN, ACC =     212 OCB47360
                    *                       *LET/FLET INDR (LSW22)  212 OCB47370
                          BSC  I  FF000,+Z  RETURN IF NOT IN LET    212 OCB47380
                          LD    3 DRCDE                                 OCB47390
                          STO   3 LDCDE                                 OCB47400
                          BSI  L  RH000     FETCH PROGRAM HEADER        OCB47410
                          LD    3 K0                                    OCB47420
                          STO   3 CLASS     ZERO TO CLASS CODE          OCB47430
                          LD      FF910                                 OCB47440
                          STO   3 LTYPE     SET TYPE TO 4               OCB47450
                          BSI  L  RL000     RELOCATE FLIPPER SUBROUTINE OCB47460
                          LD    3 K0        RESET SW 3                  OCB47470
                          STO   3 LSW03                                 OCB47480
                          BSC  I  FF000     RETURN                      OCB47490
                    *                                                   OCB47500
                    * CONSTANTS AND WORK AREAS                          OCB47510
                    *                                                   OCB47520
                          BSS  E  0                                     OCB47530
                    FF900 DN      FLIPR                                 OCB47540
                    FF910 DC      4         TYPE CODE FOR CALL SUBR     OCB47550
                    *                                                   OCB47560
                    P5END BSS     P3END-*   PATCH AREA                  OCB47570
                          DC      0         PATCH AREA                  OCB47580
                          HDNG    CORE LOAD BUILDER, PHASE 6            OCB47590
                    *************************************************** OCB47600
                    *STATUS-VERSION 2, MODIFICATION 10                * OCB47610
                    *                                                 * OCB47620
                    *FUNCTION/OPERATION-                              * OCB47630
                    *     PHASE 6 PERFORMS MISCELLANEOUS FUNCTIONS TO * OCB47640
                    *     TERMINATE THE BUILDING OF A CORE LOAD. PHASE* OCB47650
                    *     6 IS READ INTO CORE ON THE SAME PLACE AS    * OCB47660
                    *     PHASES 3, 4 AND 5.                          * OCB47670
                    *     * TV000-REPLACES 3RD WORD OF LOCAL ENTRIES  * OCB47680
                    *       IN THE LOAD TABLE WITH 4TH WORD,          * OCB47690
                    *       CREATES THE TRANSFER VECTOR.              * OCB47700
                    *     * TP000-FILLS IN THE 3RD WORD OF LIBF ENTRY * OCB47710
                    *       POINTS, OUTPUTS PARAMETERS IN LOCAL/SOCAL * OCB47720
                    *       FLIPPER, WRITES CORE IMAGE HEADER ON 1ST  * OCB47730
                    *       SECTOR OF CIB, CLEARS #FMAT AND WSCT IN   * OCB47740
                    *       DCOM.                                     * OCB47750
                    *                                                 * OCB47760
                    *ENTRY POINTS-                                    * OCB47770
                    *   * EACH SUBROUTINE HAS ONE ENTRY POINT         * OCB47780
                    *             BSI  L  XX000                       * OCB47790
                    *     WHERE XX000 IS THE FIRST WORD               * OCB47800
                    *                                                 * OCB47810
                    *INPUT-N/A                                        * OCB47820
                    *                                                 * OCB47830
                    *OUTPUT-N/A                                       * OCB47840
                    *                                                 * OCB47850
                    *EXTERNAL REFERENCES-                             * OCB47860
                    *   * SUBROUTINES-                                * OCB47870
                    *     * BT000-ENTER NAME IN LOAD TABLE            * OCB47880
                    *       * GP000-GET/PUT DISK SUBROUTINE           * OCB47890
                    *     * PM000-FLIPPER FOR PRINTING MESSAGES       * OCB47900
                    *     * TR000-OUTPUT ONE DATA WORD TO CORE OR DISK* OCB47910
                    *   * COMMA/DCOM-                                 * OCB47920
                    *     * $CIBA                                     * OCB47930
                    *     * $DADR                                     * OCB47940
                    *     * $DCDE                                     * OCB47950
                    *     * $DREQ                                     * OCB47960
                    *     * $I200                                     * OCB47970
                    *     * $WSDR                                     * OCB47980
                    *     * #FMAT                                     * OCB47990
                    *     * #WSCT                                     * OCB48000
                    *                                                 * OCB48010
                    *EXITS-                                           * OCB48020
                    *   * NORMAL-                                     * OCB48030
                    *     * BACK TO CALLER VIA THE FIRST WORD         * OCB48040
                    *   * ERROR-N/A                                   * OCB48050
                    *                                                 * OCB48060
                    *TABLES/WORK AREAS-                               * OCB48070
                    *   * LOAD TABLE                                  * OCB48080
                    *   * RCOM                                        * OCB48090
                    *                                                 * OCB48100
                    *NOTES-N/A                                        * OCB48110
                    *************************************************** OCB48120
                          HDNG    CORE LOAD BUILDER, PHASE 6            OCB48130
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB48140
                    *                                                   OCB48150
                          ORG     MV000                                 OCB48160
*SBRKGL  7D         *CORE LOAD BUILDER, PHASE 6                   V2M03 OCB48170
                          DC      P6END-*-1 PHASE 6 WD CNT              OCB48180
                          DC      @CLB6 ID NO. OF CLB, PHASE 6          OCB48190
                          HDNG    CORE LOAD BUILDER, PHASE 6            OCB48200
                    * TERMINAL PROCESSING SUCH AS CREATING THE TRANSFER OCB48210
                    * VECTOR, FILLING IN EXIT CTRL CELLS, AND COMPLET-  OCB48220
                    * ING THE CORE IMAGE HEADER RECORD                  OCB48230
                    *                                                   OCB48240
                    TV000 DC      *-*       ENTRY POINT                 OCB48250
                          LD    3 HADDR     STORE HIGHEST ADDR USED     OCB48260
                          STO   3 LACTR                                 OCB48270
                    *     THIS AND NEXT INSTRUCTION MOVED TO FIX    2-2 OCB48280
                    *     CALLS ONLY W/ LOCALS BUG                  2-2 OCB48290
                          MDX  L  @TVWC,2*@LBEN ALLOW FOR FAC,INDICATRS OCB48300
                    *                                                   OCB48310
                    * PUT WD 4 IN WD 3 FOR ALL LOCAL ENTRIES            OCB48320
                    *                                                   OCB48330
                          LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB48340
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB48350
                    TV040 LD    1 0                                     OCB48360
                          BSC     -         SKIP ON LOCAL ENTRIES       OCB48370
                          MDX     TV060     BR ON NON-LOCAL ENTRIES     OCB48380
                          LD    1 @WRD4     REPLACE 3RD WORD OF LOAD    OCB48390
                          STO   1 @WRD3     *TABLE ENTRY WITH 4TH WORD  OCB48400
                          SRA     16        ZERO TO 4TH WORD            OCB48410
                          STO   1 @WRD4                                 OCB48420
                    TV060 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB48430
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB48440
                          MDX     TV040     BR TO CHECK NEXT ENTRY      OCB48450
                    *                                                   OCB48460
                    * CREATE THE LINKAGES TO THE SOCAL FLIPPER          OCB48470
                    *                                                   OCB48480
                          LDX  I1 OVLAY+X3  SOCAL LEVEL TO XR1          OCB48490
                    TV080 MDX   1 0         SKIP IF NO SOCALS           OCB48500
                          MDX     TV100     BR TO PROCESS SOCAL ENTRIES OCB48510
                          MDX     TV140     BR TO PROCESS LIBF TV       OCB48520
                    TV100 LD      TV920     1ST WORD OF A LONG BSC      OCB48530
                          BSI  L  TR000     OUTPUT 1ST WD OF TV ENTRY   OCB48540
                          LD   L1 TV920     2ND WORD OF A LONG BSC      OCB48550
                          A     3 FLPAD                                 OCB48560
                          BSI  L  TR000     OUTPUT 2ND WD OF TV ENTRY   OCB48570
                          MDX  L  @TVWC,@LBEN ACCUMULATE TV WORD COUNT  OCB48580
                          BSI  L  TR000     OUTPUT 3RD WD OF TV ENTRY   OCB48590
                          MDX   1 -1        SKIP ON LAST SOCAL ENTRY    OCB48600
                          MDX     TV100     BR TO CONTINUE SOCAL WORK   OCB48610
                    *                                                   OCB48620
                    * CREATE SPECIAL TV ENTRIES FOR SOCALS              OCB48630
                          LDX  I1 OVLAY+X3  SOCAL LEVEL TO XR1          OCB48640
                    TV120 LD      TV900     1ST WORD OF A BSC INDIRECT  OCB48650
                          BSI  L  TR000     OUTPUT 1ST WD SPECIAL ENTRY OCB48660
                          LD    3 K0                                    OCB48670
                          BSI  L  TR000     OUTPUT 2ND WD SPECIAL ENTRY OCB48680
                          LD      TV080                                 OCB48690
                          S     3 K3                                    OCB48700
                          S     3 OVLAY                                 OCB48710
                          S     3 OVLAY                                 OCB48720
                          S     3 OVLAY                                 OCB48730
                          BSI  L  TR000     OUTPUT 3RD WD SPECIAL ENTRY OCB48740
                          MDX  L  @TVWC,@LBEN ACCUMULATE TV WORD COUNT  OCB48750
                          MDX   1 -1        SKIP ON LAST SOCAL ENTRY    OCB48760
                          MDX     TV120     BR TO DO NEXT SPECIAL ENTRY OCB48770
                    *                                                   OCB48780
                    * CREATE A DUMMY CALL ENTRY IF NECESSARY            OCB48790
                    *                                                   OCB48800
                    TV140 LD    3 RLCOR                                 OCB48810
                          A     3 LTVWC     COMPUTE LEFTMOST ADDRESS    OCB48820
                          A       TV950     *IN CALL TRANSFER VECTOR    OCB48830
                          STO   3 TVADR                                 OCB48840
                          BSC  L  TV160,E    BRANCH IF ODD, I.E.,       OCB48850
                          MDX     TV180     *DUMMY CALL ENTRY NECESSARY OCB48860
                    TV160 S     3 K1        MAKE ADDRESS EVEN           OCB48870
                          STO   3 TVADR                                 OCB48880
                          LD    3 K4000     CREATE A DUMMY CALL ENTRY   OCB48890
                          STD   3 NAME                                  OCB48900
                          LD    3 K0                                    OCB48910
                          STO   3 ENDRL                                 OCB48920
                          BSI  L  BT000     ADD DUMMY CALL TO LOAD TBL  OCB48930
                    TV180 LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB48940
                          LD    3 K0        CREATE 2 DUMMY LIBF ENTRIES OCB48950
                          STO   1 @WRD1+1*@LTEN *TO RIGHT OF RTMOST LD  OCB48960
                          STO   1 @WRD1+2*@LTEN *TBL ENT FOR FAC, INDR  OCB48970
                          LD    3 LTVWC                            2-10 OCB48980
                          BSC  L  TV530,+-  BR IF NO LIBF TV       2-10 OCB48990
                    *                                                   OCB49000
                    * CREATE THE LIBF TRANSFER VECTOR                   OCB49010
                    *                                                   OCB49020
                          LDX  I1 LEFTX+X3  LEFT LIMIT OF LD TBL TO XR1 OCB49030
                          MDX   1 @LTEN     POINT TO LAST ENTRY         OCB49040
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB49050
                    TV200 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB49060
                          SLA     1                                     OCB49070
                          BSC     Z+        SKIP ON LIBF ENTRIES        OCB49080
                          MDX     TV400     BR ON CALL ENTRIES          OCB49090
                          LD    3 K0        ZERO TO 1ST WORD OF LIBF    OCB49100
                          BSI  L  TR000     *TV ENTRIES                 OCB49110
                          LD    1 @WRD4     FETCH SOCAL LEVEL INDICATOR OCB49120
                          BSC     +-        SKIP ON SOCAL ENTRIES       OCB49130
                          MDX     TV220     BR TO OUTPUT 2ND WD OF TV   OCB49140
                          LD      TV905                                 OCB49150
                          S     1 @WRD4                                 OCB49160
                          S     1 @WRD4                                 OCB49170
                          S     1 @WRD4                                 OCB49180
                          S     3 LTVWC                                 OCB49190
                          AND   3 K00FF                                 OCB49200
                          OR    3 BSIT3     CREATE A SHORT BSI 3        OCB49210
                          MDX     TV240     BR TO OUTPUT 2ND WD OF TV   OCB49220
                    TV220 LD      TV920     BSC L TO 2ND WORD OF LIBF   OCB49230
                    TV240 BSI  L  TR000     *TV ENTRIES                 OCB49240
                          LD    1 @WRD3     FETCH EXECUTION ADDR        OCB49250
                          BSI  L  TR000     *OF LIBF TV ENTRIES         OCB49260
                          MDX  L  @TVWC,@LBEN ACCUMULATE TV WORD COUNT  OCB49270
                          MDX     TV400     CONTINUE                    OCB49280
                    *                                                   OCB49290
                    * CONSTANTS AND WORK AREAS                          OCB49300
                    *                                                   OCB49310
                    TV900 DC      /4C80 1ST WD OF A BSC INDIRECT        OCB49320
                    TV905 DC      127-1*@LBEN-1                         OCB49330
                    TV920 BSC  L  FL210     BSC TO ARITH SOCAL FLIPPER  OCB49340
                          DC      FL220     ADDR FI/O SOCAL FLIPPER ENT OCB49350
                          DC      FL230     ADDR DK FI/O FLIPPER ENTRY  OCB49360
                    TV940 DC      2+2*@LBEN-127                         OCB49370
                    TV945 DC      3*@LBEN WD CNT FOR 3 LIBF TV ENTRIES  OCB49380
                    TV950 DC      1+2*@LBEN                             OCB49390
                    *                                                   OCB49400
                    *                                                   OCB49410
                    *                                                   OCB49420
                    TV400 MDX   1 @LTEN     POINT TO NEXT LD TBL ENTRY  OCB49430
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB49440
                          MDX     TV200     BR IF MORE TO DO            OCB49450
                          LDX   2 2*@LBEN   WD CNT OF FAC, INDICATORS   OCB49460
                    TV420 LD    3 K0        STORE ZEROS IN FAC AND IN-  OCB49470
                          BSI  L  TR000     *DICATOR ENTRIES IN LIBF TV OCB49480
                          MDX   2 -1                                    OCB49490
                          MDX     TV420     BR UNTIL DONE               OCB49500
                    *                                                   OCB49510
                    * CREATE THE CALL TRANSFER VECTOR                   OCB49520
                    *                                                   OCB49530
                    TV430 LDX  I1 LEFTX+X3  LEFT LIMIT OF LD TBL TO XR1 OCB49540
                          MDX   1 @LTEN     POINT TO LAST ENTRY         OCB49550
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB49560
                    TV440 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB49570
                          SLA     1                                     OCB49580
                          BSC     -         SKIP ON CALL ENTRIES        OCB49590
                          MDX     TV460     BR ON ALL LIBF ENTRIES      OCB49600
                          LD    1 @WRD4     FETCH CLASS CODE            OCB49610
                          BSC     Z         SKIP IF AN IN-CORE SUBR     OCB49620
                          MDX     TV460     BRANCH ON SOCALS            OCB49630
                          LD    1 @WRD3     MOVE THE EXECUTION ADDR     OCB49640
                          BSI  L  TR000     *THE CALL TRANSFER VECTOR   OCB49650
                          MDX  L  @TVWC,@CLEN ACCUMULATE TV WORD COUNT  OCB49660
                    TV460 MDX   1 @LTEN     POINT TO NEXT LD TBL ENTRY  OCB49670
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB49680
                          MDX     TV440     BR UNTIL ALL CALL TV DONE   OCB49690
                    TV500 LD    3 TVADR                                 OCB49700
                          S       TV945     *TV OF 1ST ENTRY TO LEFT    OCB49710
                          STO   3 TVADR                                 OCB49720
                          A       TV940     COMPUTE AND STORE ADDR FOR  OCB49730
                          STO  L  @XR3X     *XR3 DURING EXECUTION       OCB49740
                          BSC  I  TV000     RETURN                      OCB49750
                    TV530 LD    3 LBATV     COMPUTE AND STORE ADDR IN   OCB49760
                          BSC  L  TV430,Z   BR IF THERE IS A CALL TV    OCB49770
                          MDX     TV500     BR IF NO TV AT ALL          OCB49780
                          HDNG    CORE LOAD BUILDER, PHASE 6            OCB49790
                    TP000 DC      *-*       ENTRY POINT                 OCB49800
                          LD    3 LBATV                                 OCB49810
                          BSC  L  TP300,+-  BR IF NO LD TBL ENTRIES     OCB49820
                    *                                                   OCB49830
                    * FILL IN THE 3RD WORD OF EVERY LIBF ENTRY POINT    OCB49840
                    *                                                   OCB49850
                    TP010 LDX  I1 RIGHT+X3  RIGHT LIMIT OF TBL TO XR1   OCB49860
                          SRA     16                                    OCB49870
                          STO     TP900     INITIALIZE LIBF TV POINTER  OCB49880
                          LDX  I2 LBATV+X3  LOAD TABLE LENGTH TO XR2    OCB49890
                          LD    3 TVADR     INITIALIZE CELL TO ADDR OF  OCB49900
                          STO     TP920     *1ST ENTRY IN LIBF TV       OCB49910
                          LD      TP990                                 OCB49920
                          STO     TP985                                 OCB49930
                    TP030 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB49940
                          SLA     1                                     OCB49950
                          BSC  L  TP120,+Z  BR IF CURR ENT IS A CALL    OCB49960
                          LD    1 @WRD3     STORE ADDR OF 3RD WD OF     OCB49970
                          S       TP980                                 OCB49980
                          BSC  L  TP150,+-  BR IF DISK1/N ENTRY         OCB49990
                          LD    3 LSW17                                 OCB50000
                          BSC  L  TP090,Z   BR DURING 2ND PASS          OCB50010
                          LD    1 @WRD3                                 OCB50020
                          A       TP955     *EVERY ENTRY PT IN TV INTO  OCB50030
                          STO   3 LACTR     *THE LOCATION ADDR COUNTER  OCB50040
                          S     3 CIBLM                             2-2 OCB50050
                          BSC  L  TP060,Z-  BR IF NOT IN CIB        2-2 OCB50060
                          LD    1 @WRD3     BRANCH IF THIS ENTRY HAS    OCB50070
                          BSC  L  TP090,+-  *ALREADY BEEN PROCESSED     OCB50080
                          S    L  @LDAD     ADJUST TO 1ST WD IN CIB BFR OCB50090
                          SRT     16                                    OCB50100
                          D     3 K320                                  OCB50110
                          S     3 SCTRX     BR IF DESIRED SCTR IS NOT   OCB50120
                          BSC  L  TP240,Z   *NOW IN THE CIB BUFFER      OCB50130
                    TP060 LD      TP920     FETCH EXIT CONTROL ADDR     OCB50140
                          BSI  L  TR000     *AND STORE IT IN THE SUBR   OCB50150
                          LD    3 K0        INDICATE ENTRY NOW          OCB50160
                          STO   1 @WRD3     *PROCESSED                  OCB50170
                    TP090 MDX  L  TP920,-@LBEN POINT TO NEXT LIBF IN TB OCB50180
                          LD      TP985                                 OCB50190
                          S       TP995                                 OCB50200
                          AND   3 K00FF     ACCUMULATE DISPLACEMENT     OCB50210
                          STO     TP985     *FOR LIBF BSI               OCB50220
                    TP120 MDX   1 -@LTEN    POINT TO NEXT LD TBL ENTRY  OCB50230
                          MDX   2 -@LTEN    SKIP AT END OF LOAD TABLE   OCB50240
                          MDX     TP030     BR TO CHECK NEXT LD TBL ENT OCB50250
                          LD      TP915     BR IF UNNECESSARY TO MAKE   OCB50260
                          BSC  L  TP300,+-  *ANOTHER PASS THRU LD TBL   OCB50270
                          LD    3 K0         ZERO OUT LAST TIME THRU SW OCB50280
                          STO     TP915                                 OCB50290
                          MDX     TP010      GO MAKE ANOTHER PASS       OCB50300
                    TP150 LD      TP985                                 OCB50310
                          SLA     8         IF DISP NEG FILL        2-3 OCB50320
                          SRT     8         *OUT WITH ONES          2-3 OCB50330
                          A    L  @XR3X     COMPUTE EXIT CTRL ADDR OF   OCB50340
                          STO  L  @XCTL     *DISK1/N                    OCB50350
                          MDX     TP090     BR TO FILL IN OTHER EXITS   OCB50360
                    *                                                   OCB50370
                    *                                                   OCB50380
                    * CONSTANTS AND WORK AREAS                          OCB50390
                    TP900 DC      *-*  ZERO WHEN SCAN OF LD TBL STARTS  OCB50400
                    TP905 DC      127-2*@LBEN                           OCB50410
                    TP910 DC      FL900 ADDR OF SOCAL 1 SCTR ADDR IN FL OCB50420
                    TP915 DC      *-*  NON-ZERO UNTIL ALL WDS FILLED IN OCB50430
                    TP920 DC      *-*  CURR ADDR IN LIBF TV             OCB50440
                    TP925 DC      $I200 ADDR OF SYSTEM ILS02            OCB50450
                          DC      @COMZ LOW COMMON LIMIT FOR DISKZ      OCB50460
                    TP935 DC      @COM1 LOW COMMON LIMIT FOR DISK1      OCB50470
                          DC      @COM2 LOW COMMON LIMIT FOR DISKN      OCB50480
                    TP940 DC      FL915 ADDR OF SPECIAL MDX IN FLIPPER  OCB50490
                    TP945 DC      2*@LBEN WD CNT OF 2 LIBF TV ENTRIES   OCB50500
                    TP950 DC      @LBEN WD CNT OF 1 LIBF TV ENTRY       OCB50510
                    TP955 DC      @LBEN-1                               OCB50520
                    TP960 DC      FL350 ADDR IN FLIPPER OF SOCAL AREA   OCB50530
                    TP965 DC      FL380 ADDR IN FLIPR OF SOCAL 1 DUMMY  OCB50540
                    TP970 MDX     *-9  SPECIAL MDX FOR OPTION 1         OCB50550
                    TP975 MDX     *-12 SPECIAL MDX FOR OPTION 2         OCB50560
                    TP980 DC      @DKEP LIBF ENTRY POINT TO DISK1,DFSKN OCB50570
                    TP985 DC      *-*  DISPLACEMENT ACCUMULATOR         OCB50580
                    TP990 DC      127-2*@LBEN-2                         OCB50590
                    TP995 DC      @LBEN WD CNT OF A LIBF TV ENTRY       OCB50600
                    TP996 DC      @DCOM     SCTR ADDR OF DCOM           OCB50610
                    TP997 DC      @MCOR-1                           2-2 OCB50620
                    TP998 DC      320*@HCIB HIGH COMMON WORD COUNT  2-2 OCB50630
                    TP999 DC      @SCIB-@HCIB CIB SCTR FOR HIGH COMM2-2 OCB50640
                    *                                                   OCB50650
                    *                                                   OCB50660
                    *                                                   OCB50670
                    TP240 MDX  L  TP900,0   SKIP IF SWITCH ZERO         OCB50680
                          MDX     TP270     BR TO SET SWITCH            OCB50690
                          STO     TP900     SET SWITCH NON-ZERO         OCB50700
                          MDX     TP060     BR TO STORE EXIT CTRL ADDR  OCB50710
                    TP270 STO     TP915     SET SWITCH NON-ZERO         OCB50720
                          MDX     TP090     BR TO CHECK FOR DONE        OCB50730
                    TP300 LDX  L2 B         POINT XR2 TO ADDR CI HDR    OCB50740
                          LD    3 HADDR     FETCH RIGHTMOST ADDR OF TV  OCB50750
                          A     3 K1                                    OCB50760
                          A     2 @HWCT-B                               OCB50770
                          S     3 MLWD1     STORE LENGTH OF PROGRAM+TV, OCB50780
                          STO   2 @WCNT-B   *I.E., LENGTH OF CORE LOAD  OCB50790
                          LD    2 @OVSW-B                               OCB50800
                          BSC  L  TP330,+-  BR IF NO LOCALS OR SOCALS   OCB50810
                          LDX  I1 $WSDR                                 OCB50820
                          LD   L1 SCTAD+X3                              OCB50830
                          S     3 FSCTR     STORE LOCAL/SOCAL SCTR      OCB50840
                          STO   2 @OVSW-B   *CNT IN CORE IMAGE HEADER   OCB50850
                    *                                                   OCB50860
                    * OUTPUT THE CORE IMAGE HEADER                      OCB50870
                    *                                                   OCB50880
                    TP330 LD    3 MLWD1                                 OCB50890
                          S     2 @HWCT-B                               OCB50900
                          STO   3 LACTR                                 OCB50910
                          STO   3 LSW21     SET CORE IMAGE HDR SW       OCB50920
                          STO   3 SCTRX     ASSURE INVALID SCTR NO. 2-2 OCB50930
                          LDX  L1 @XEQA-@HEND-1 MINUS HDR WD CNT TO XR1 OCB50940
                    TP360 LD   L1 @HEND+1   FETCH A WD FROM CI HEADER   OCB50950
                          BSI  L  TR000     OUT TO TRANSFER 1 WORD      OCB50960
                          MDX   1 1         SKIP WHEN HEADER TRANSFRD   OCB50970
                          MDX     TP360     TRANSFER 1 MORE WORD        OCB50980
                          LD    3 K0                                    OCB50990
                          STO   3 LSW21     CLEAR CORE IMAGE HDR SW     OCB51000
                    *                                                   OCB51010
                    * OUTPUT PARAMETERS IN LOCAL/SOCAL FLIPPER          OCB51020
                    *                                                   OCB51030
                          LD    3 OVLAY                                 OCB51040
                          BSC  L  TP380,+-  BR IF NO SOCALS             OCB51050
                          LD    3 FLPAD     SET LOCATION ADDR COUNTER   OCB51060
                          A       TP965                                 OCB51070
                          STO   3 LACTR                                 OCB51080
                          LD      TP905                                 OCB51090
                          S     3 LTVWC                                 OCB51100
                          A     2 @XR3X-B                               OCB51110
                          STO   3 WASTE                                 OCB51120
                          BSI  L  TR000     STO ADDR DUMMY ENT,SOCAL 1  OCB51130
                          LD    3 WASTE                                 OCB51140
                          S       TP950                                 OCB51150
                          MDX  L  LACTR+X3,1 POINT TO SOCAL 2 DUMMY     OCB51160
                          BSI  L  TR000     STO ADDR DUMMY ENT, SOCAL 2 OCB51170
                          LD    3 WASTE                                 OCB51180
                          S       TP945                                 OCB51190
                          MDX  L  LACTR+X3,1 POINT TO SOCAL 3 DUMMY     OCB51200
                          BSI  L  TR000     STO ADDR DUMMY ENT, SOCAL 3 OCB51210
                          LD    3 FLPAD                                 OCB51220
                          A       TP960                                 OCB51230
                          STO   3 LACTR     SET LOCATION ADDR COUNTER   OCB51240
                          LD    3 SOCAR                                 OCB51250
                          S     3 K2        ALLOW FOR WD CNT, SCTR ADDR OCB51260
                          BSI  L  TR000     STO ADDR OF SOCAL AREA      OCB51270
                          LD    3 FLPAD                                 OCB51280
                          A       TP910                                 OCB51290
                          STO   3 LACTR                                 OCB51300
                          LDX   1 -3        MINUS MAX NO. SOCALS TO XR1 OCB51310
                    TP370 LD   L1 S1SAD+3+X3                            OCB51320
                          BSI  L  TR000     OUTPUT SOCAL SCTR ADDR      OCB51330
                          LD   L1 S1WCT+3+X3                            OCB51340
                          BSI  L  TR000     OUTPUT SOCAL WD CNT         OCB51350
                          MDX   1 1         SKIP AFTER LAST SOCAL DONE  OCB51360
                          MDX     TP370     BR TO OUTPUT MORE PARAMS    OCB51370
                          LD    3 FLPAD                                 OCB51380
                          A       TP940                                 OCB51390
                          STO   3 LACTR                                 OCB51400
                          LD    3 OVLAY                                 OCB51410
                          S     3 K2                                    OCB51420
                          BSC  L  TP450,Z   BR IF OPTION 2 EMPLOYED     OCB51430
                          LD      TP970                                 OCB51440
                    TP375 BSI  L  TR000     OUTPUT THE SPECIAL MDX      OCB51450
                          LDX  I1 SCLCT+X3  SOCAL TV COUNT TO XR1   2-2 OCB51460
                          LD    3 SOCAR     FETCH ADDR OF SOCAL AREA2-2 OCB51470
                          STO   3 LACTR                             2-2 OCB51480
                    TP377 LD    3 STVAD     PUT ADDR OF FUNCTION ENT2-2 OCB51490
                          BSI  L  TR000     *PT TO FLIPR IN SOCAL AR2-2 OCB51500
                          MDX   1 -1        SKIP AT END OF SOCAL TV 2-2 OCB51510
                          MDX     TP377     BR TO OUTPUT ANOTHER ENT2-2 OCB51520
                    *                                                   OCB51530
                    * WRITE LAST CONTENTS OF CIB BUFFER ONTO THE CIB    OCB51540
                    *                                                   OCB51550
                    TP380 LD    3 CIBBF                                 OCB51560
                          RTE     16                                    OCB51570
                          LD    3 K1                                    OCB51580
                          BSI  L  GP000     WRITE OUT CONTENTS CIB BFR  OCB51590
                    *                                               2-2 OCB51600
                    * RESTORE HIGH COMMON                           2-2 OCB51610
                    *                                               2-2 OCB51620
                          LD    3 CIBLM                             2-2 OCB51630
                          S    L  TP997     BR IF UNNECESSARY TO    2-2 OCB51640
                          BSC  L  TP383,+-  *RESTORE HIGH COMMON    2-2 OCB51650
                          LD   L  $CIBA     COMPUTE SCTR ADDR OF    2-2 OCB51660
                          A    L  TP999     *HIGH COMMON            2-2 OCB51670
                          RTE     16                                2-2 OCB51680
                          LD   L  TP998     FETCH HIGH COMMON WD CNT2-2 OCB51690
                          STD  L  @MCOR-2   WC ,SCTR ADDR TO IO AREA2-2 OCB51700
                          LD      *-2                               2-2 OCB51710
                          SRT     16                                2-2 OCB51720
                          BSI  L  GP000     RESTORE HIGH COMMON     2-2 OCB51730
                    TP383 LD   L  $CIBA     INDICATE TO CIL THAT COR2-2 OCB51740
                          SLA     4                                     OCB51750
                          STO  L  $DADR     *LOAD IS IN THE CIB         OCB51760
                          LD   L  $CIBA                                 OCB51770
                          AND   3 KF000                                 OCB51780
                          STO  L  $DCDE     STORE CIB DRIVE CODE        OCB51790
                          LD    2 @ITVX+2-B                             OCB51800
                          S    L  TP925     BR IF THE SYSTEM ILS02  2-2 OCB51810
                          BSC  L  TP385,+-  *IS TO BE UTILIZED          OCB51820
                          LDX  I1 $DREQ                                 OCB51830
                          LD   L1 TP935     COMPARE ADDR WITH THAT      OCB51840
                          S     2 @ITVX+2-B *OF LOW COMMON MINUS 320    OCB51850
                          BSC  L  TP385,+   BR IF LOW COMMON LESS       OCB51860
                          LDX   2 MSG05     INVALID ADDR FOR ILS02      OCB51870
                          BSI  L  PM000     OUT TO PRINT MESSAGE        OCB51880
                          STX  L0 IND05     SET R05 INDICATOR      2-11 OCB51890
                    *                                                   OCB51900
                    * ASSURE THAT CI HDR WRITTEN ON 1ST SCTR OF CIB     OCB51910
                    *                                                   OCB51920
                    TP385 LD   L  $CIBA                                 OCB51930
                          STO  L  BUFCI+1                               OCB51940
                          LD    3 CIBBF                                 OCB51950
                          SRT     16        FETCH PRESENT CONTENTS OF   OCB51960
                          BSI  L  GP000     *1ST SCTR OF THE CIB        OCB51970
                          LDX  L1 @XEQA-@HEND-1 MINUS CI HDR WD CNT     OCB51980
                    TP390 LD   L1 @HEND+1   TRANSFER CORE IMAGE HEADER  OCB51990
                          STO  L1 BUFCI+2+@HEND+1-@XEQA *TO CIB BUFFER  OCB52000
                          MDX   1 1         SKIP WHEN DONE,             OCB52010
                          MDX     TP390     *BRANCH OTHERWISE           OCB52020
                          LD    3 CIBBF                                 OCB52030
                          RTE     16                                    OCB52040
                          LD    3 K1                                    OCB52050
                          BSI  L  GP000     WRITE OUT CONTENTS OF BFR   OCB52060
                          LD   L  @OVSW                                 OCB52070
                          BSC  L  TP400,+-  BR IF NO LOCALS OR SOCALS   OCB52080
                    *                                                   OCB52090
                    * CLEAR #FMAT AND #WSCT IN MASTER DCOM              OCB52100
                    *                                                   OCB52110
                          LDX  L1 BUFLS+2                               OCB52120
                          LD   L  TP996                                 OCB52130
                          STO   1 -1                                    OCB52140
                          LD    3 LSBUF                                 OCB52150
                          SRT     16                                    OCB52160
                          BSI  L  GP000     FETCH DCOM                  OCB52170
                          MDX  I1 $WSDR                                 OCB52180
                          SRA     16        CLEAR BLOCK COUNT           OCB52190
                          STO   1 #WSCT     *OF MASTER WORKING STORAGE  OCB52200
                          LD    3 K1        SET FORMAT INDICATOR FOR    OCB52210
                          STO   1 #FMAT     *MASTER WS TO DDF           OCB52220
                          LD    3 LSBUF                                 OCB52230
                          SRT     16                                    OCB52240
                          LD    3 K1                                    OCB52250
                          BSI  L  GP000     WRITE OUT DCOM              OCB52260
                    TP400 BSC  I  TP000     RETURN                      OCB52270
                    TP450 LD   L  TP975                                 OCB52280
                          MDX     TP375     BR TO OUTPUT THE MDX        OCB52290
                    *                                                   OCB52300
                    P6END BSS     P3END-*   PATCH AREA                  OCB52310
                          DC      0         PATCH AREA                  OCB52320
                          HDNG    CORE LOAD BUILDER, PHASE 7            OCB52330
                    *************************************************** OCB52340
                    *                                                 * OCB52350
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * OCB52360
                    *                                                 * OCB52370
                    *FUNCTION/OPERATION-                              * OCB52380
                    *   * PRINTS ERROR MESSAGES R00-R11               * OCB52390
                    *   * SETS DO-NOT-EXEQUTE AND DO-NOT-DUP SWITCHES * OCB52400
                    *     EXCEPT FOR R05 AND R06.                     * OCB52410
                    *                                                 * OCB52420
                    *ENTRY POINTS-                                    * OCB52430
                    *   * E1000-THE ONLY ENTRY POINT                  * OCB52440
                    *              BSI  L  E1000                      * OCB52450
                    *                                                 * OCB52460
                    *INPUT-                                           * OCB52470
                    *   * XR2 HOLDS THE ERROR NUMBER                  * OCB52480
                    *                                                 * OCB52490
                    *OUTPUT-                                          * OCB52500
                    *   * PRINTED MESSAGE                             * OCB52510
                    *   * SKIP TO CHANNEL 1 AND PRINT HEADING WHEN    * OCB52520
                    *     CHANNEL 12 SENSED                           * OCB52530
                    *   * SWITCHES $NDUP AND $NXEQ SET                * OCB52540
                    *                                                 * OCB52550
                    *EXTERNAL REFERENCES-                             * OCB52560
                    *   SUBROUTINES-                                  * OCB52570
                    *      * GP000   READ AND WRITE ON DISK           * OCB52580
                    *      * LK000   FETCH A PHASE VIA SLET           * OCB52590
                    *   COMMA/DCOM-                                   * OCB52600
                    *      * $CH12                                    * OCB52610
                    *      * $NDUP                                    * OCB52620
                    *      * $NXEQ                                    * OCB52630
                    *      * $PBSY                                    * OCB52640
                    *                                                 * OCB52650
                    *EXITS-                                           * OCB52660
                    *   NORMAL-                                       * OCB52670
                    *      BACK TO CALLER INDIRECTLY VIA E1000        * OCB52680
                    *   ERROR-N/A                                     * OCB52690
                    *                                                 * OCB52700
                    *TABLES/WORK AREAS-                               * OCB52710
                    *      * E1955 TABLE OF WORD COUNTS AND MESSAGES  * OCB52720
                    *                                                 * OCB52730
                    *NOTES-N/A                                        * OCB52740
                    *                                                 * OCB52750
                    *************************************************** OCB52760
                          HDNG    CORE LOAD BUILDER, PHASE 7            OCB52770
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB52780
                    *                                                   OCB52790
                          ORG     BUFLS                                 OCB52800
*SBRKGL  7E         *CORE LOAD BUILDER, PHASE 7                   V2M00 OCB52810
                          DC      P7END-*-1 PHASE 7 WD CNT              OCB52820
                          DC      @CLB7 ID NO. FOR CLB, PHASE 7         OCB52830
                          HDNG    CORE LOAD BUILDER, PHASE 7            OCB52840
                    * PRINT MESSAGES R00-R10 AND SET $NXEQ, $NDUP       OCB52850
                    * UNLESS PRINTING R05 OR R06                   2-11 OCB52860
                    *                                                   OCB52870
                    E1000 DC      *-*       ENTRY POINT                 OCB52880
                          NOP                                           OCB52890
                          LD    3 K320                                  OCB52900
                          STO     E1000-2                               OCB52910
                          STX   1 E1200+1   SAVE XR1                    OCB52920
                          STX   2 E1900     SAVE MESSAGE NO.            OCB52930
                          LD   L  BUFLO+1   SAVE ADDR OF SCTR CURRENTLY OCB52940
                          STO     E1920                                 OCB52950
                          LDX  L1 @PRNT                                 OCB52960
                          LD    3 LOBUF                                 OCB52970
                          BSI  L  LK000     FETCH PRINCIPAL PRINT SUBR  OCB52980
                          LD   I  $CH12                                 OCB52990
                          BSC  L  E1050,+-  BR UNLESS CHANNEL 12 SENSED OCB53000
                          LD      E1902+1                               OCB53010
                          S     3 K1                                    OCB53020
                          SRT     16                                    OCB53030
                          BSI  L  GP000     FETCH HEADING SECTOR        OCB53040
                          LD      E1905-1                               OCB53050
                          STO     E1905                                 OCB53060
                          LDD     E1902                                 OCB53070
                          BSI     E1400     SKIP TO CHANNEL 1           OCB53080
                          BSI     E1400     PRINT PAGE HEADING          OCB53090
                    E1050 LD      E1900     COMPUTE CORE ADDR OF        OCB53100
                          M       E1955     *REQUESTED MESSAGE          OCB53110
                          RTE     16                                    OCB53120
                          A       E1910                                 OCB53130
                          RTE     16        MESSAGE ADDR TO EXTENSION   OCB53140
                          LD      E1915                                 OCB53150
                          BSI     E1400     PRINT REQUESTED MESSAGE     OCB53160
                          LD      E1920                                 OCB53170
                          STO  L  BUFLO+1                               OCB53180
                          LD    3 LOBUF                                 OCB53190
                          SRT     16                                    OCB53200
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB53210
                          LD      E1900                                 OCB53220
                          S       E1926                            2-11 OCB53230
                          BSC  L  E1200,+-  BRANCH IF R05          2-11 OCB53240
                          S       E1925     SUBTRACT 1 MORE        2-11 OCB53250
                          BSC  L  E1200,+-  BRANCH IF R06          2-11 OCB53260
                          STX  L0 $NDUP     SET DO-NOT-EXECUTE SWITCH   OCB53270
                          STX  L0 $NXEQ     SET DO-NOT-DUP SWITCH       OCB53280
                    E1200 LDX  L1 *-*       RESTORE XR1                 OCB53290
                          BSC  I  E1000     RETURN                      OCB53300
                    *                                                   OCB53310
                    * CALL PRINCIPAL PRINTER                            OCB53320
                    *                                                   OCB53330
                    E1400 DC      *-*       ENTRY POINT                 OCB53340
                          BSI  L  BUFLO+3   CALL THE PRINTER            OCB53350
                          MDX  L  $PBSY,0   LOOP UNTIL OPERATION        OCB53360
                          MDX     *-3       *REQUESTED IS COMPLETE      OCB53370
                          BSC  I  E1400     RETURN TO CALLER            OCB53380
                    *                                                   OCB53390
                    * CONSTANTS AND WORK AREAS                          OCB53400
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       OCB53410
                    *                                                   OCB53420
                          BSS  E  0                                     OCB53430
                    E1900 DC      *-*  NO. OF REQUESTED MESSAGE         OCB53440
                          BSS     1         PATCH AREA                  OCB53450
                    E1902 MDX     *         SKIP-TO-CHANNEL-1 INDR,     OCB53460
                          DC      E1905     ADDR OF HEADING BUFFER      OCB53470
                          DC      10        PAGE HEADING WD CNT         OCB53480
                    E1905 DC      @HDNG     PAGE HEADING SCTR ADDR      OCB53490
                          BSS     10        PAGE HEADING BUFFER         OCB53500
                    E1910 DC      E1955     ADDR OF 1ST MESSAGE         OCB53510
                    E1915 MDX     *+1       PRINT FUNCTION INDICATOR    OCB53520
                    E1920 DC      *-*       DATA BUFFER SCTR ADDR       OCB53530
                    E1925 DC      1         ADDED TO E1926 = R06   2-11 OCB53540
                    E1926 DC      MSG05     MESSAGE NUMBER FOR R05 2-11 OCB53550
                          BSS     1         PATCH AREA                  OCB53560
                    E1955 DC      21        R00 WORD COUNT              OCB53570
                          EBC     .R 00 LOCALS/SOCALS O.                OCB53580
                          EBC     .VERFLOW WORK STORAGE.                OCB53590
                          DC      21        R 01 WORD COUNT             OCB53600
                          EBC     .R 01 ORIGIN BELOW 1S.                OCB53610
                          EBC     .T WORD OF MAINLINE  .                OCB53620
                          DC      21        R 02 WORD COUNT             OCB53630
                          EBC     .R 02 DEFINE FILE(S) .                OCB53640
                          EBC     .OVERFLOW WORK STORGE.                OCB53650
                          DC      21        R 03 WORD COUNT             OCB53660
                          EBC     .R 03 NO DSF PROGRAM .                OCB53670
                          EBC     .IN WORKING STORAGE  .                OCB53680
                          DC      21        R04 WORD COUNT              OCB53690
                          EBC     .R 04                .                OCB53700
                          EBC     .                    .                OCB53710
                          DC      21        R05 WORD COUNT              OCB53720
                          EBC     .R 05 INVALID LOADING.                OCB53730
                          EBC     . ADDR FOR ILS02     .                OCB53740
                          DC      21        R 06 WORD COUNT             OCB53750
                          EBC     .R 06 FILE(S) TRUNCAT.                OCB53760
                          EBC     .ED (SEE FILE MAP)   .                OCB53770
                          DC      21        R 07 WORD COUNT             OCB53780
                          EBC     .R 07 TOO MANY ENTRIE.                OCB53790
                          EBC     .S IN LOAD TABLE     .                OCB53800
                          DC      21        R 08 WORD COUNT             OCB53810
                          EBC     .R 08 CORE LOAD EXCEE.                OCB53820
                          EBC     .DS 32K              .                OCB53830
                          DC      21        R 09 WORD COUNT             OCB53840
                          EBC     .R 09 LIBF TV REQUIRE.                OCB53850
                          EBC     .S 84 OR MORE ENTRIES.            212 OCB53860
                          DC      21        R 10 WORD COUNT             OCB53870
                          EBC     .R 10                .                OCB53880
                          EBC     .                    .                OCB53890
                    *                                                   OCB53900
                    P7END BSS     E1000+319-* PATCH AREA                OCB53910
                          DC      0         PATCH AREA                  OCB53920
                          HDNG    CORE LOAD BUILDER, PHASE 8            OCB53930
                    *************************************************** OCB53940
                    *                                                 * OCB53950
                    *STATUS-VERSION 2, MODIFICATION 0                 * OCB53960
                    *                                                 * OCB53970
                    *FUNCTION/OPERATION-                              * OCB53980
                    *   * PRINTS ERROR MESSAGES R16-R23               * OCB53990
                    *   * SETS DO-NOT-EXECUTE AND DO-NOT-DUP SWITCHES * OCB54000
                    *                                                 * OCB54010
                    *ENTRY POINTS-                                    * OCB54020
                    *   * E2000-THIS IS THE ONLY ENTRY POINT          * OCB54030
                    *              BSI  L  E2000                      * OCB54040
                    *                                                 * OCB54050
                    *INPUT-                                           * OCB54060
                    *   * XR2 HOLDS THE ERROR NUMBER                  * OCB54070
                    *   * RNAME THE NAME OF THE PROGRAM INVOLVED      * OCB54080
                    *                                                 * OCB54090
                    *OUTPUT-                                          * OCB54100
                    *   *PRINTED MESSAGE                              * OCB54110
                    *   * SKIP TO CHANNEL 1 AND PRINT HEADING WHEN    * OCB54120
                    *    CHANNEL 12 SENSED                            * OCB54130
                    *   *SWITCHES $NDUP AND $NEXQ SET                 * OCB54140
                    *                                                 * OCB54150
                    *EXTERNAL REFERENCES-                             * OCB54160
                    *   SUBROUTINES                                   * OCB54170
                    *      * GP000   READ AND WRITE ON DISK           * OCB54180
                    *      * LK000   FETCH A PHASE VIA SLET           * OCB54190
                    *   COMMA/DCOM-                                   * OCB54200
                    *      * $CH12                                    * OCB54210
                    *      * $NEXQ                                    * OCB54220
                    *      * $NDUP                                    * OCB54230
                    *      * $PBSY                                    * OCB54240
                    *                                                 * OCB54250
                    *EXITS-                                           * OCB54260
                    *   NORMAL-                                       * OCB54270
                    *      BACK TO CALLER INDIRECTLY VIA E2000        * OCB54280
                    *   ERROR-N/A                                     * OCB54290
                    *                                                 * OCB54300
                    *TABLES/WORK AREAS-                               * OCB54310
                    *      * E2950 TABLE OF WORD COUNTS AND MESSAGES  * OCB54320
                    *                                                 * OCB54330
                    *NOTES-N/A                                        * OCB54340
                    *                                                 * OCB54350
                    *************************************************** OCB54360
                          HDNG    CORE LOAD BUILDER, PHASE 8            OCB54370
                    *                                                   OCB54380
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB54390
                          ORG     BUFLS                                 OCB54400
*SBRKGL  7F         *CORE LOAD BUILDER, PHASE 8                   V2M00 OCB54410
                          DC      P8END-*-1 PHASE 8 WD CNT              OCB54420
                          DC      @CLB8 ID NO. FOR CLB, PHASE 8         OCB54430
                          HDNG    CORE LOAD BUILDER, PHASE 8            OCB54440
                    * PRINT MESSAGES R16-R23 AND SET $NDUP, $NXEQ       OCB54450
                    *                                                   OCB54460
                    *                                                   OCB54470
                    E2000 DC      *-*       ENTRY POINT                 OCB54480
                          NOP                                           OCB54490
                          LD    3 K320                                  OCB54500
                          STO     E2000-2                               OCB54510
                          STX   1 E2200+1   SAVE XR1                    OCB54520
                          STX   2 E2900     SAVE MESSAGE NO.            OCB54530
                          LD   L  BUFLO+1                               OCB54540
                          STO     E2931                                 OCB54550
                          LDX  L1 @PRNT                                 OCB54560
                          LD    3 LOBUF                                 OCB54570
                          BSI  L  LK000     FETCH PRINCIPAL PRINT SUBR  OCB54580
                          LD   I  $CH12                                 OCB54590
                          BSC  L  E2050,+-  BR UNLESS CHANNEL 12 SENSED OCB54600
                          LD      E2920+1                               OCB54610
                          S     3 K1                                    OCB54620
                          SRT     16                                    OCB54630
                          BSI  L  GP000     FETCH PAGE HEADING          OCB54640
                          LD      E2925-1                               OCB54650
                          STO     E2925                                 OCB54660
                          LDD     E2920                                 OCB54670
                          BSI     E2400     SKIP TO CHANNEL 1           OCB54680
                          BSI     E2400     PRINT PAGE HEADING          OCB54690
                    E2050 LD      E2900     COMPUTE CORE ADDR OF        OCB54700
                          S       E2905     *REQUESTED MESSAGE          OCB54710
                          M       E2935                                 OCB54720
                          RTE     16                                    OCB54730
                          A       E2910                                 OCB54740
                          STO     *+1                                   OCB54750
                    E2100 LDX  L1 *-*       ADDR OF MESSAGE TO XR1      OCB54760
                    *                                                   OCB54770
                    * CONVERT NAME TO 5 EBCDIC CHARACTERS               OCB54780
                    *                                                   OCB54790
                          LDD   3 RNAME                                 OCB54800
                          SRT     2                                     OCB54810
                          SLA     2                                     OCB54820
                          SRA     2                                     OCB54830
                          SRT     8                                     OCB54840
                          BSI     E2450     CONVERT @,#,$               OCB54850
                          STO   1 3         STORE 1ST CHARACTER         OCB54860
                          SRA     10                                    OCB54870
                          SLT     6                                     OCB54880
                          BSI     E2450     CONVERT @,#,$               OCB54890
                          SLA     8                                     OCB54900
                          STO     E2940                                 OCB54910
                          SLA     2                                     OCB54920
                          SLT     6                                     OCB54930
                          BSI     E2450     CONVERT @,#,$               OCB54940
                          OR      E2940                                 OCB54950
                          STO   1 4         STORE 2ND, 3RD CHARACTERS   OCB54960
                          LDD   3 RNAME                                 OCB54970
                          SLT     2                                     OCB54980
                          SRA     16                                    OCB54990
                          SLT     6                                     OCB55000
                          BSI     E2450     CONVERT @,#,$               OCB55010
                          SLA     8                                     OCB55020
                          STO     E2940                                 OCB55030
                          SLA     2                                     OCB55040
                          SLT     6                                     OCB55050
                          BSI     E2450     CONVERT @,#,$               OCB55060
                          OR      E2940                                 OCB55070
                          STO   1 5         STORE 5TH CHARACTER         OCB55080
                          LD      E2100+1                               OCB55090
                          RTE     16                                    OCB55100
                          LD      E2915                                 OCB55110
                          BSI     E2400     PRINT REQUESTED MESSAGE     OCB55120
                          LD      E2931                                 OCB55130
                          STO  L  BUFLO+1                               OCB55140
                          LD    3 LOBUF                                 OCB55150
                          SRT     16                                    OCB55160
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB55170
                          STX  L0 $NXEQ     SET DO-NOT-EXECUTE SWITCH   OCB55180
                          STX  L0 $NDUP     SET DO-NOT-DUP SWITCH       OCB55190
                    E2200 LDX  L1 *-*       RESTORE XR1                 OCB55200
                          BSC  I  E2000     RETURN                      OCB55210
                    *                                                   OCB55220
                    * CALL PRINCIPAL PRINTER                            OCB55230
                    *                                                   OCB55240
                    E2400 DC      *-*       ENTRY POINT                 OCB55250
                          BSI  L  BUFLO+3   CALL THE PRINTER            OCB55260
                          MDX  L  $PBSY,0   LOOP UNTIL OPERATION        OCB55270
                          MDX     *-3       *REQUESTED IS COMPLETE      OCB55280
                          BSC  I  E2400     RETURN TO CALLER            OCB55290
                    *                                                   OCB55300
                    * CHECK FOR SPECIAL CHARACTERS                      OCB55310
                    *                                                   OCB55320
                    E2450 DC      *-*       ENTRY POINT                 OCB55330
                          STO     E2941                                 OCB55340
                          AND     E2943                                 OCB55350
                          S       E2942                                 OCB55360
                          BSC  L  E2470,Z+  BR IF NOT A SPECIAL CHAR    OCB55370
                          LD      E2944                                 OCB55380
                          MDX     E2470+1   BR TO CONVERT CHARACTER     OCB55390
                    E2470 LD      E2932                                 OCB55400
                          OR      E2941                                 OCB55410
                          BSC  I  E2450     RETURN                      OCB55420
                    *                                                   OCB55430
                    * CONSTANTS AND WORK AREAS                          OCB55440
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       OCB55450
                    *                                                   OCB55460
                          BSS  E  0                                     OCB55470
                    E2900 DC      *-*  NO. OF REQUESTED MESSAGE         OCB55480
                    E2905 DC      MSG16 NO. 1ST MESSAGE IN THIS PHASE   OCB55490
                    E2910 DC      E2950 ADDR 1ST MESSAGE IN PHASE       OCB55500
                    E2915 MDX     *+1   PRINT FUNCTION-INDICATOR        OCB55510
                    E2920 MDX     *    SKIP-TO-CHANNEL-1 INDICATOR AND  OCB55520
                          DC      E2925 *ADDR OF HEADING BUFFER         OCB55530
                          DC      10   PAGE HEADING WORD COUNT          OCB55540
                    E2925 DC      @HDNG PAGE HEADING SCTR ADDR          OCB55550
                          BSS     10   PAGE HEADING BUFFER              OCB55560
                          BSS     1    PATCH AREA                       OCB55570
                    E2931 DC      *-*  DATA BUFFER SCTR ADDR            OCB55580
                    E2932 DC      /00C0     MASK FOR A-Z, 0-9 IN EBCDIC OCB55590
                    E2935 DC      21                                    OCB55600
                    E2940 DC      *-*       CHAR TO BE CONVERTED        OCB55610
                    E2941 DC      *-*       CHAR CONVERTED TO EBCDIC    OCB55620
                    E2942 DC      /000A     2ND HALF SPECIAL CHAR LIMIT OCB55630
                    E2943 DC      /000F     MASK 1ST HALF EBCDIC CHAR   OCB55640
                    E2944 DC      /0040     EBCDIC BLANK                OCB55650
                    E2950 DC      21        R 16 WORD COUNT             OCB55660
                          EBC     .R 16 XXXXX IS NOT IN.                OCB55670
                          EBC     . LET OR FLET        .                OCB55680
                          DC      21        R 17 WORD COUNT             OCB55690
                          EBC     .R 17 XXXXX CANNOT BE.                OCB55700
                          EBC     . A LOCAL/NOCAL      .                OCB55710
                          DC      21        R 18 WORD COUNT             OCB55720
                          EBC     .R 18 XXXXX LOADING H.                OCB55730
                          EBC     .AS BEEN TERMINATED  .                OCB55740
                          DC      21        R 19 WORD COUNT             OCB55750
                          EBC     .R 19 XXXXX IS NOT A .                OCB55760
                          EBC     .DATA FILE           .                OCB55770
                          DC      21        R 20 WORD COUNT             OCB55780
                          EBC     .R 20 XXXXX COMMON EX.                OCB55790
                          EBC     .CEEDS THAT OF ML    .                OCB55800
                          DC      21        R 21 WORD COUNT             OCB55810
                          EBC     .R 21 XXXXX PRECISION.                OCB55820
                          EBC     . DIFFERENT FROM ML  .                OCB55830
                          DC      21        R 22 WORD COUNT             OCB55840
                          EBC     .R 22 XXXXX AND ANOTH.                OCB55850
                          EBC     .ER VERSION REF'ENCED.                OCB55860
                          DC      21        R 23 WORD COUNT             OCB55870
                          EBC     .R 23 XXXXX SHOULD BE.                OCB55880
                          EBC     . IN THE FIXED AREA  .                OCB55890
                    *                                                   OCB55900
                    P8END BSS     E2000+319-* PATCH AREA                OCB55910
                          DC      0         PATCH AREA                  OCB55920
                          HDNG    CORE LOAD BUILDER, PHASE 9            OCB55930
                    *************************************************** OCB55940
                    *                                                 * OCB55950
                    *STATUS-VERSION 2, MODIFICATION 6                 * OCB55960
                    *                                                 * OCB55970
                    *FUNCTION/OPERATION-                              * OCB55980
                    *   * PRINTS ERROR MESSAGES R38-R47               * OCB55990
                    *   * SETS DO-NOT-EXEQUTE AND DO-NOT-DUP SWITCHES * OCB56000
                    *     FOR R39, R46 AND R47                        * OCB56010
                    *                                                 * OCB56020
                    *ENTRY POINTS-                                    * OCB56030
                    *   * E3000 THIS IS THE ONLY ENTRY POINT          * OCB56040
                    *              BSI  L  E3000                      * OCB56050
                    *                                                 * OCB56060
                    *INPUT-                                           * OCB56070
                    *   * XR2 HOLDS TE ERROR NUMBER                   * OCB56080
                    *   * RNAME HOLDS THE NAME OF THE PROGRAM INVOLVED* OCB56090
                    *     IN NAME CODE                                * OCB56100
                    *                                                 * OCB56110
                    *OUTPUT-                                          * OCB56120
                    *   *PRINTED MESSAGE                              * OCB56130
                    *   * SKIP TO CHANNEL 1 AND PRINT HEADING WHEN    * OCB56140
                    *    CHANNEL 12 SENSED                            * OCB56150
                    *   *SWICHES $NDUP AND $NEXQ SET ONLY IF PRINTING * OCB56160
                    *    R39, R46, R47                                * OCB56170
                    *                                                 * OCB56180
                    *EXTERNAL REFERENCES-                             * OCB56190
                    *   SUBROUTINES-                                  * OCB56200
                    *      * GP000 READ AND WRITE ON DISK             * OCB56210
                    *      * LK000 FETCH A PHASE VIA SLET             * OCB56220
                    *   COMMA/DCOM-                                   * OCB56230
                    *      * $CH12                                    * OCB56240
                    *      * $NEXQ                                    * OCB56250
                    *      * $NDUP                                    * OCB56260
                    *      * $PBSY                                    * OCB56270
                    *                                                 * OCB56280
                    *EXITS-                                           * OCB56290
                    *   NORMAL-                                       * OCB56300
                    *      BACK TO CALLER INDIRECTLY VIA E2000        * OCB56310
                    *   ERROR-N/A                                     * OCB56320
                    *                                                 * OCB56330
                    *TABLES/WORK AREAS-                               * OCB56340
                    *   * E3960 TABLE OF WORD COUNTS AND MESSAGES     * OCB56350
                    *                                                 * OCB56360
                    *NOTES-N/A                                        * OCB56370
                    *                                                 * OCB56380
                    *************************************************** OCB56390
                          HDNG    CORE LOAD BUILDER, PHASE 9            OCB56400
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB56410
                    *                                                   OCB56420
                          ORG     BUFLS                                 OCB56430
*SBRKGL  80         *CORE LOAD BUILDER, PHASE 9                   V2M00 OCB56440
                          DC      P9END-*-1 PHASE 9 WD CNT              OCB56450
                          DC      @CLB9 ID NO. FOR CLB, PHASE 9         OCB56460
                          HDNG    CORE LOAD BUILDER, PHASE 9            OCB56470
                    * PRINT MESSAGES R39-R47 AND SET $NXEQ, $NDUP       OCB56480
                    * FOR R39, R46, AND R47 ONLY                        OCB56490
                    *                                                   OCB56500
                    *                                                   OCB56510
                    E3000 DC      *-*       ENTRY POINT                 OCB56520
                          NOP                                           OCB56530
                          LD    3 K320                                  OCB56540
                          STO     E3000-2                               OCB56550
                          STX   1 E3300+1   SAVE XR1                    OCB56560
                          STX   2 E3900     SAVE MESSAGE NO.            OCB56570
                          LD   L  BUFLO+1   SAVE ADDR OF SCTR CURRENTLY OCB56580
                          STO     E3950                                 OCB56590
                          LDX  L1 @PRNT                                 OCB56600
                          LD    3 LOBUF                                 OCB56610
                          BSI  L  LK000     FETCH PRINCIPAL PRINT SUBR  OCB56620
                          LD   I  $CH12                                 OCB56630
                          BSC  L  E3050,+-  BR UNLESS CHANNEL 12 SENSED OCB56640
                          LD      E3920+1                               OCB56650
                          S     3 K1                                    OCB56660
                          SRT     16                                    OCB56670
                          BSI  L  GP000     FETCH PAGE HEADING          OCB56680
                          LD      E3925-1                               OCB56690
                          STO     E3925                                 OCB56700
                          LDD     E3920                                 OCB56710
                          BSI     E3400     SKIP TO CHANNEL 1           OCB56720
                          BSI     E3400     PRINT PAGE HEADING          OCB56730
                    E3050 LD      E3900     COMPUTE CORE ADDR OF        OCB56740
                          S       E3905     *REQUESTED MESSAGE          OCB56750
                          M       E3960                                 OCB56760
                          RTE     16                                    OCB56770
                          A       E3910                                 OCB56780
                          A     3 K6                                    OCB56790
                          STO     E3200+1                               OCB56800
                    *                                                   OCB56810
                    * CONVERT FROM BINARY TO 4 HEX CHARACTERS IN EBCDIC OCB56820
                    *                                                   OCB56830
                          LDD   3 RNAME                                 OCB56840
                          SRT     16                                    OCB56850
                          LDX   2 -2                                    OCB56860
                    E3150 SLT     4         FETCH 1ST OR 3RD HEX CHAR   OCB56870
                          S       E3935     COMPARE CHARACTER WITH 9    OCB56880
                          BSC     +         SKIP IF GREATER THAN 9      OCB56890
                          A       E3940                                 OCB56900
                          SLA     8                                     OCB56910
                          STO     E3945                                 OCB56920
                          SLA     4                                     OCB56930
                          SLT     4         FETCH 2ND OR 4TH HEX CHAR   OCB56940
                          S       E3935     COMPARE CHARACTER WITH 9    OCB56950
                          BSC     +         SKIP IF GREATER THAN 9      OCB56960
                          A       E3940                                 OCB56970
                          OR      E3945                                 OCB56980
                          OR      E3932                                 OCB56990
                    E3200 STO  L2 *-*                                   OCB57000
                          SRA     16        CLEAR ACCUMULATOR           OCB57010
                          MDX   2 1         SKIP AFTER 2ND PASS         OCB57020
                          MDX     E3150     CONVERT 3RD, 4TH CHARACTER  OCB57030
                          LD      E3200+1                               OCB57040
                          S     3 K6                                    OCB57050
                          RTE     16                                    OCB57060
                          LD      E3915                                 OCB57070
                          BSI     E3400     PRINT REQUESTED MESSAGE     OCB57080
                          LD      E3950                                 OCB57090
                          STO  L  BUFLO+1                               OCB57100
                          LD    3 LOBUF                                 OCB57110
                          SRT     16                                    OCB57120
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB57130
                          LD      E3900                                 OCB57140
                          S       E3905                                 OCB57150
                          BSC  L  E3270,+-  BR IF MESSAGE R39           OCB57160
                          LD      E3900                                 OCB57170
                          S       E3953                                 OCB57180
                          BSC  L  E3300,Z+  *TO BE PRINTED GTE 46       OCB57190
                          S       E3933                             2-6 OCB57200
                          BSC  L  E3300,+-                          2-6 OCB57210
                    E3270 STX  L0 $NXEQ     SET DO-NOT-EXECUTE SWITCH   OCB57220
                          STX  L0 $NDUP     SET DO-NOT-DUP SWITCH       OCB57230
                    E3300 LDX  L1 *-*       RESTORE XR1                 OCB57240
                          BSC  I  E3000     RETURN                      OCB57250
                    *                                                   OCB57260
                    * CALL PRINCIPAL PRINTER                            OCB57270
                    *                                                   OCB57280
                    E3400 DC      *-*       ENTRY POINT                 OCB57290
                          BSI  L  BUFLO+3   CALL THE PRINTER            OCB57300
                          MDX  L  $PBSY,0   LOOP UNTIL OPERATION        OCB57310
                          MDX     *-3       *REQUESTED IS COMPLETE      OCB57320
                          BSC  I  E3400     RETURN TO CALLER            OCB57330
                    *                                                   OCB57340
                    * CONSTANTS AND WORK AREAS                          OCB57350
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       OCB57360
                          BSS  E  0                                     OCB57370
                    E3900 DC      *-*  NO. OF REQUESTED MESSAGE         OCB57380
                    E3905 DC      MSG39     ADDR OF 1ST MESSAGE         OCB57390
                    E3910 DC      E3960     ADDR OF 1ST MESSAGE         OCB57400
                    E3915 MDX     *+1   PRINT FUNCTION-INDICATOR        OCB57410
                    E3920 MDX     *    SKIP-TO-CHANNEL-1 INDICATOR      OCB57420
                          DC      E3925 ADDR OF HEADING BUFFER          OCB57430
                          DC      10   PAGE HEADING WD CNT              OCB57440
                    E3925 DC      @HDNG PAGE HEADING SCTR ADDR          OCB57450
                          BSS     10   PAGE HEADING BUFFER              OCB57460
                    E3932 DC      /C0C0                                 OCB57470
                    E3933 DC      2                                 2-6 OCB57480
                    E3935 DC      9    HIGHEST MARK IN THE DECIMAL SYS  OCB57490
                    E3940 DC      /39                                   OCB57500
                    E3945 DC      *-*                                   OCB57510
                    E3950 DC      *-*  DATA BUFFER SCTR ADDR            OCB57520
                    E3953 DC      MSG46 NO. 1ST MESSAGE CAUSING ABORT   OCB57530
                    E3960 DC      21        R 39 WORD COUNT             OCB57540
                          EBC     .R 39  XXXX IS NOT CU.                OCB57550
                          EBC     .RRENTLY MOUNTED     .                OCB57560
                          DC      21        R40 WORD COUNT              OCB57570
                          EBC     .R 40  XXXX (HEX)=ADD.                OCB57580
                          EBC     .ITIONAL CORE REQUIRD.                OCB57590
                          DC      21        R41 WORD COUNT              OCB57600
                          EBC     .R 41  XXXX (HEX) WDS.                OCB57610
                          EBC     . UNUSED BY CORE LOAD.                OCB57620
                          DC      21        R42 WORD COUNT              OCB57630
                          EBC     .      XXXX (HEX) IS .                OCB57640
                          EBC     .THE EXECUTION ADDR  .                OCB57650
                          DC      21        R43 WORD COUNT              OCB57660
                          EBC     .R 43  XXXX (HEX)=ARI.                OCB57670
                          EBC     .TH/FUNC SOCAL WD CNT.                OCB57680
                          DC      21        R44 WORD COUNT              OCB57690
                          EBC     .R 44  XXXX (HEX)=FI/.                OCB57700
                          EBC     .O, I/O SOCAL WD CNT .                OCB57710
                          DC      21        R45 WORD COUNT              OCB57720
                          EBC     .R 45  XXXX (HEX)=DIS.                OCB57730
                          EBC     .K FI/O SOCAL WD CNT .                OCB57740
                          DC      21        R46 WORD COUNT              OCB57750
                          EBC     .R 46  XXXX (HEX)=AN .                OCB57760
                          EBC     .ILLEGAL ML LOAD ADDR.                OCB57770
                          DC      21        R47 WORD COUNT              OCB57780
                          EBC     .R 47  XXXX (HEX) TOO.                OCB57790
                          EBC     . MANY WDS IN COMMON .                OCB57800
                          DC      8         R 48 WORD COUNT         2-6 OCB57810
                          EBC     .R 48  XXXX (HEX).                2-6 OCB57820
                    *                                                   OCB57830
                    P9END BSS     E3000+319-* PATCH AREA                OCB57840
                          DC      0         PATCH AREA                  OCB57850
                          HDNG    CORE LOAD BUILDER, PHASE 10           OCB57860
                    *************************************************** OCB57870
                    *                                                 * OCB57880
                    *STATUS-VERSION 2, MODIFICATION 9                 * OCB57890
                    *                                                 * OCB57900
                    *FUNCTION/OPERATION-                              * OCB57910
                    *   * PRINTS ERROR MESSAGES R64-R68               * OCB57920
                    *   * SETS D0-NOT-EXECUTE AND DO-NOT-DUP SWITCHES * OCB57930
                    *                                                 * OCB57940
                    *ENTRY POINTS-                                    * OCB57950
                    *   * E4000-THIS IS THE ONLY ENTRY POINT          * OCB57960
                    *              BSI  L  E4000                      * OCB57970
                    *                                                 * OCB57980
                    *INPUT-                                           * OCB57990
                    *   * XR2 HOLDS THE ERROR NUMBER                  * OCB58000
                    *   * RNAME THE NAME OF THE PROGRAM INVOLVED      * OCB58010
                    *                                                 * OCB58020
                    *OUTPUT-                                          * OCB58030
                    *   *PRINTED MESSAGE                              * OCB58040
                    *   * SKIP TO CHANNEL 1 AND PRINT HEADING WHEN    * OCB58050
                    *    CHANNEL 12 SENSED                            * OCB58060
                    *   *SWITCHES $NDUP AND $NXEQ SET                 * OCB58070
                    *                                                 * OCB58080
                    *EXTERNAL REFERENCES-                             * OCB58090
                    *   SUBROUTINES                                   * OCB58100
                    *      * GP000   READ AND WRITE ON DISK           * OCB58110
                    *      * LK000   FETCH A PHASE VIA SLET           * OCB58120
                    *   COMMA/DCOM-                                   * OCB58130
                    *      * $CH12                                    * OCB58140
                    *      * $NEXQ                                    * OCB58150
                    *      * $NDUP                                    * OCB58160
                    *      * $PBSY                                    * OCB58170
                    *                                                 * OCB58180
                    *EXITS-                                           * OCB58190
                    *   NORMAL-                                       * OCB58200
                    *      BACK TO CALLER INDIRECTLY VIA E4000        * OCB58210
                    *   ERROR-N/A                                     * OCB58220
                    *                                                 * OCB58230
                    *TABLES/WORK AREAS-                               * OCB58240
                    *      * E4955 TABLE OF WORD COUNTS AND MESSAGES  * OCB58250
                    *                                                 * OCB58260
                    *NOTES-N/A                                        * OCB58270
                    *                                                 * OCB58280
                    *************************************************** OCB58290
                          HDNG    CORE LOAD BUILDER, PHASE 10           OCB58300
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB58310
                    *                                                   OCB58320
                          ORG     BUFLS                                 OCB58330
*SBRKGL  81         *CORE LOAD BUILDER, PHASE 10                  V2M02 OCB58340
                          DC      PAEND-*-1 PHASE 10 WD CNT             OCB58350
                          DC      @CLBA     ID NO.                      OCB58360
                          HDNG    CORE LOAD BUILDER, PHASE 10           OCB58370
                    * PRINT MESSAGES R64-R68 AND SET $NXEQ, $NDUP       OCB58380
                    *                                                   OCB58390
                    E4000 DC      *-*       ENTRY POINT                 OCB58400
                          NOP                                           OCB58410
                          LD    3 K320                                  OCB58420
                          STO     E4000-2                               OCB58430
                          STX   1 E4300+1   SAVE XR1                    OCB58440
                          STX   2 E4900     SAVE NO. OF REQUESTED MSG   OCB58450
                          LD   L  BUFLO+1                               OCB58460
                          STO     E4940                                 OCB58470
                          LDX  L1 @PRNT                                 OCB58480
                          LD    3 LOBUF                                 OCB58490
                          BSI  L  LK000     FETCH PRINCIPAL PRINT SUBR  OCB58500
                          LD   I  $CH12                                 OCB58510
                          BSC  L  E4050,+-  BR UNLESS CHANNEL 12 SENSED OCB58520
                          LD      E4930+1                               OCB58530
                          S     3 K1                                    OCB58540
                          SRT     16                                    OCB58550
                          BSI  L  GP000     FETCH PAGE HEADING          OCB58560
                          LD      E4935-1                               OCB58570
                          STO     E4935                                 OCB58580
                          LDD     E4930                                 OCB58590
                          BSI     E4400     SKIP TO CHANNEL 1           OCB58600
                          BSI     E4400     PRINT PAGE HEADING          OCB58610
                    E4050 LD      E4900                                 OCB58620
                          S       E4905                                 OCB58630
                          M       E4955                                 OCB58640
                          RTE     16                                    OCB58650
                          A       E4910                                 OCB58660
                          STO     *+1       SAVE ADDR OF REQUESTED MSG  OCB58670
                    E4100 LDX  L1 *-*       ADDR OF MESSAGE TO XR1      OCB58680
                    *                                                   OCB58690
                    * CONVERT NAME TO PACKED EBCDIC                     OCB58700
                    *                                                   OCB58710
                          LDD   3 RNAME                                 OCB58720
                          SRT     2                                     OCB58730
                          SLA     2                                     OCB58740
                          SRA     2                                     OCB58750
                          SRT     8                                     OCB58760
                          BSI     E4450     CONVERT @,#,$               OCB58770
                          STO   1 3         STORE 1ST CHARACTER         OCB58780
                          SRA     10                                    OCB58790
                          SLT     6                                     OCB58800
                          BSI     E4450     CONVERT @,#,$               OCB58810
                          SLA     8                                     OCB58820
                          STO     E4946                                 OCB58830
                          SLA     2                                     OCB58840
                          SLT     6                                     OCB58850
                          BSI     E4450     CONVERT @,#,$               OCB58860
                          OR      E4946                                 OCB58870
                          STO   1 4         STORE 2ND, 3RD CHARACTERS   OCB58880
                          LDD   3 RNAME                                 OCB58890
                          SLT     2                                     OCB58900
                          SRA     16                                    OCB58910
                          SLT     6                                     OCB58920
                          BSI     E4450     CONVERT @,#,$               OCB58930
                          SLA     8                                     OCB58940
                          STO     E4946                                 OCB58950
                          SLA     2                                     OCB58960
                          SLT     6                                     OCB58970
                          BSI     E4450     CONVERT @,#,$               OCB58980
                          OR      E4946                                 OCB58990
                          STO   1 5         STORE 4TH, 5TH CHARACTERS   OCB59000
                          LD      E4100+1                               OCB59010
                          RTE     16                                    OCB59020
                          LD      E4915                                 OCB59030
                          BSI     E4400     PRINT REQUESTED MESSAGE     OCB59040
                          LD      E4940                                 OCB59050
                          STO  L  BUFLO+1                               OCB59060
                          LD    3 LOBUF                                 OCB59070
                          SRT     16                                    OCB59080
                          BSI  L  GP000     RESTORE DATA BUFFER         OCB59090
                          STX  L0 $NXEQ                                 OCB59100
                          STX  L0 $NDUP                                 OCB59110
                    E4300 LDX  L1 *-*       RESTORE XR1                 OCB59120
                          BSC  I  E4000     RETURN                      OCB59130
                    *                                                   OCB59140
                    * CALL PRINCIPAL PRINTER                            OCB59150
                    *                                                   OCB59160
                    E4400 DC      *-*       ENTRY POINT                 OCB59170
                          BSI  L  BUFLO+3   OUT TO PRINT                OCB59180
                          MDX  L  $PBSY,0   LOOP UNTIL                  OCB59190
                          MDX     *-3       *MESSAGE PRINTED            OCB59200
                          BSC  I  E4400     RETURN                      OCB59210
                    *                                                   OCB59220
                    * CHECK FOR SPECIAL CHARACTERS                      OCB59230
                    *                                                   OCB59240
                    E4450 DC      *-*       ENTRY POINT                 OCB59250
                          STO     E4947                                 OCB59260
                          AND     E4949                                 OCB59270
                          S       E4948                                 OCB59280
                          BSC  L  E4470,Z+  BR IF NOT A SPECIAL CHAR    OCB59290
                          LD      E4950                                 OCB59300
                          MDX     E4470+1   BR TO CONVERT CHARACTER     OCB59310
                    E4470 LD      E4945                                 OCB59320
                          OR      E4947                                 OCB59330
                          BSC  I  E4450     RETURN                      OCB59340
                    *                                                   OCB59350
                    * CONSTANTS AND WORK AREAS                          OCB59360
                    * EVEN-NUMBERED LABELS ARE ON EVEN BOUNDARIES       OCB59370
                    *                                                   OCB59380
                          BSS  E  0                                     OCB59390
                    E4900 DC      *-*       NO. OR REQUESTED MESSAGE    OCB59400
                    E4905 DC      MSG64     NO. OF 1ST MESSAGE          OCB59410
                    E4910 DC      E4955     ADDR 1ST MESSAGE            OCB59420
                    E4915 MDX     *+1       PRINT FUNCTION INDICATOR    OCB59430
                    E4930 MDX     *         SKIP-TO-CHANNEL-1 INDICATOR OCB59440
                          DC      E4935     ADDR OF HEADING BUFFER      OCB59450
                          DC      10        PAGE HEADING WD CNT         OCB59460
                    E4935 DC      @HDNG     PAGE HEADING SCTR ADDR      OCB59470
                          BSS     10        PAGE HEADING BUFFER         OCB59480
                    E4940 DC      *-*       DATA BUFFER SCTR ADDR       OCB59490
                    E4945 DC      /00C0     MASK FOR A-Z, 0-9           OCB59500
                    E4946 DC      *-*       CHAR TO BE CONVERTED        OCB59510
                    E4947 DC      *-*       CHAR CONVERTED TO EBCDIC    OCB59520
                    E4948 DC      /000A     2ND HALF SPECIAL CHAR LIMIT OCB59530
                    E4949 DC      /000F     MASK 1ST HALF EBCDIC CHAR   OCB59540
                    E4950 DC      /0040     EBCDIC BLANK                OCB59550
                    E4955 DC      21        R64 WORD COUNT              OCB59560
                          EBC     .R 64 XXXXX IS BOTH A.                OCB59570
                          EBC     . LIBF AND A CALL    .                OCB59580
                          DC      21        R65  WORD COUNT             OCB59590
                          EBC     .R 65 XXXXX HAS MORE .                OCB59600
                          EBC     .THAN 14 ENTRY POINTS.                OCB59610
                          DC      21        R 66 WORD COUNT             OCB59620
                          EBC     .R 66 XXXXX HAS AN IN.                OCB59630
                          EBC     .VALID TYPE CODE     .                OCB59640
                          DC      21        R 67 WORD COUNT             OCB59650
                          EBC     .R 67 XXXXX HAS AN IN.            2G2 OCB59660
                          EBC     .VALID GSB ADDRESS   .            2G2 OCB59670
                          DC      21        R 68 WORD COUNT             OCB59680
                          EBC     .R 68 XXXXX FILE NUMB.            2-9 OCB59690
                          EBC     .ER PREVIOUSLY USED  .            2-9 OCB59700
                    *                                                   OCB59710
                    PAEND BSS     E4000+319-* PATCH AREA                OCB59720
                          DC      0         PATCH AREA                  OCB59730
                          HDNG    CORE LOAD BUILDER, PHASE 11           OCB59740
                    *************************************************** OCB59750
                    *                                                 * OCB59760
                    *STATUS-VERSION 2, MODIFICATION 9                 * OCB59770
                    *                                                 * OCB59780
                    *FUNCTION/OPERATION-                              * OCB59790
                    *   THIS PHASE IS FETCHED INTO CORE BY SUBROUTINE * OCB59800
                    *   FM000 (IN PHASE 2) EVERY TIME A LINE WITH     * OCB59810
                    *   * 'FILES ALLOCATION'     (1)                  * OCB59820
                    *   * FILES ALLOCATION DATA  (2)                  * OCB59830
                    *   * 'STORAGE ALLOCATION    (3)                  * OCB59840
                    *   HAS TO BE PRINTED.                            * OCB59850
                    *                                                 * OCB59860
                    *ENTRY POINTS-                                    * OCB59870
                    *   * M1000     IS THE ONLY ENTRY POINT           * OCB59880
                    *   * M1000 TIS IS THE ONLY ENTRY POINT           * OCB59890
                    *             BSI  L  M1000                       * OCB59900
                    *                                                 * OCB59910
                    *INPUT-                                           * OCB59920
                    *   * LSW02 THIS SWITCH CONTROLS WHAT TO BE DONE  * OCB59930
                    *     NEG. OUTPUT A, ZERO OUTPUT B, POS. OUTPUT C * OCB59940
                    *OUTPUT-                                          * OCB59950
                    *   * A ONE LINE OF EACH (7) AND (2) (SEE ABOVE)  * OCB59960
                    *     B ONE LINE OF (3)                           * OCB59970
                    *     C ONE LINE OF (2)                           * OCB59980
                    *   * SKIP TO CHANNEL 1 AND PRINT HEADING WHEN    * OCB59990
                    *     CHANNEL 12 SENSED                           * OCB60000
                    *                                                 * OCB60010
                    *EXTERNAL REFERENCES-                             * OCB60020
                    *   SUBROUTINES                                   * OCB60030
                    *      * GP000  READ AND WRITE ON DISK            * OCB60040
                    *      * LK000  FETCH A PHASE VIA SLET            * OCB60050
                    *   COMMA/DCOM-                                   * OCB60060
                    *      * $LEV1                                    * OCB60070
                    *      * $PBSY                                    * OCB60080
                    *      * $CH12                                    * OCB60090
                    *      * $FPAD                                    * OCB60100
                    *                                                 * OCB60110
                    *EXITS-                                           * OCB60120
                    *   NORMAL-                                       * OCB60130
                    *      BACK TO CALLER VIA M1000                   * OCB60140
                    *   ERROR-N/A                                     * OCB60150
                    *                                                 * OCB60160
                    *TABLES/WORK AREAS-N/A                            * OCB60170
                    *                                                 * OCB60180
                    *NOTES-N/A                                        * OCB60190
                    *                                                 * OCB60200
                    *************************************************** OCB60210
                          HDNG    CORE LOAD BUILDER, PHASE 11           OCB60220
                          ORG     BUFLO                                 OCB60230
*SBRKGL  82         *CORE LOAD BUILDER, PHASE 11                  V2M03 OCB60240
                          DC      PBEND-*-1 PHASE 11 WD CNT             OCB60250
                          DC      @CLBB     PHASE ID                    OCB60260
                          HDNG    CORE LOAD BUILDER, PHASE 11           OCB60270
                    * MAP-1,SUBR FOR MAPPING FILES AND PRINTING         OCB60280
                    * THE HEADING 'STORAGE ALLOCATION'                  OCB60290
                    *                                                   OCB60300
                    M1000 DC      *-*       ENTRY POINT                 OCB60310
                          LD    3 K320                                  OCB60320
                          STO     M1000-2                               OCB60330
                          STX   1 M1010+1   SAVE XR1                    OCB60340
                          STX  L2 M1190+1   SAVE XR2                    OCB60350
                          LD   L  M1990+1                               OCB60360
                          S     3 K1                                    OCB60370
                          SRT     16                                    OCB60380
                          BSI  L  GP000     FETCH PAGE HEADING          OCB60390
                          LD   L  M1995-1                               OCB60400
                          STO  L  M1995                                 OCB60410
                          LD    3 LSBUF                                 OCB60420
                          A     3 K6                                    OCB60430
                          STO   3 IBT4X     PLACE INTERUPT ADDRESS      OCB60440
                          STO   3 IBT4X+3                               OCB60450
                          STO  L  $LEV1                                 OCB60460
                          LDX  L1 @PRNT                                 OCB60470
                          LD    3 LSBUF                                 OCB60480
                          BSI  L  LK000     FETCH PRINT SUBROUTINE      OCB60490
                    M1010 LDX  L1 *-*       RESTORE XR1                 OCB60500
                          LD    3 LSW02     BR IF FILES ALLOCATION      OCB60510
                          BSC  L  M1020,-   *HEADING ALREADY PRINTED    OCB60520
                          STX  L0 LSW02+X3  SET HEADER SWITCH OFF       OCB60530
                          LD   L  M1960                                 OCB60540
                          BSI  L  M1600     PRINT 'FILES ALLOCATION'    OCB60550
                          MDX     M1030     BR TO MAP A FILE            OCB60560
                    M1020 BSC  L  M1030,Z   BR UNLESS STORAGE ALLOCA-   OCB60570
                          LD   L  M1970                                 OCB60580
                          BSI  L  M1600     PRINT 'STORAGE ALLOCATION'  OCB60590
                          MDX     M1180     TO EXIT                     OCB60600
                    *                                                   OCB60610
                    * CALL PRINCIPAL PRINTER                            OCB60620
                    *                                                   OCB60630
                    M1025 DC      *-*       ENTRY POINT                 OCB60640
                          BSI  L  BUFLS+3   OUT TO SKIP                 OCB60650
                          MDX  L  $PBSY,0   SKIP IF PRINTER NOT BUSY,   OCB60660
                          MDX     *-3       *BRANCH OTHERWISE           OCB60670
                          BSC  I  M1025     RETURN                      OCB60680
                    M1030 LD      M1900                                 OCB60690
                          STO     M1130+1   INITIALIZE LINE ADDR        OCB60700
                          LD    1 0         FETCH FILE NO. FROM TABLE   OCB60710
                    *                                                   OCB60720
                    * CONVERT FILE NO. TO 5-DIGIT NO. IN EBCDIC AND     OCB60730
                    * STORE IN XXXXX POSITIONS OF LINE TO BE PRINTED    OCB60740
                    *                                                   OCB60750
                          LDX   2 5         NO. DIGITS TO XR2           OCB60760
                          SRT     16                                    OCB60770
                    M1050 D    L  M1996                                 OCB60780
                          RTE     16                                    OCB60790
                          STO  L2 M1980-1                               OCB60800
                          SRA     16        CLEAR ACCUMULATOR           OCB60810
                          MDX   2 -1        SKIP AFTER 5TH DIGIT FORMED OCB60820
                          MDX     M1050     BR TO FORM NEXT DIGIT       OCB60830
                          LDX   2 -4                                    OCB60840
                    M1080 LD   L2 M1980+4   FETCH A DIGIT               OCB60850
                          BSC  L  M1110,Z   BRANCH IF DIGIT NOT ZERO    OCB60860
                          LD   L  M1980+5   REPLACE ZERO WITH AN 'F'    OCB60870
                          STO  L2 M1980+4                               OCB60880
                          MDX   2 1         SKIP WHEN LEFT 4 DGTS. DONE OCB60890
                          MDX     M1080     BR TO CHECK NEXT DIGIT      OCB60900
                    M1110 LDX   2 -6                                    OCB60910
                    M1120 LD   L2 M1980+6                               OCB60920
                          SLA     8                                     OCB60930
                          OR   L2 M1980+7                               OCB60940
                          OR      M1905                                 OCB60950
                          MDX  L  M1130+1,1                             OCB60960
                    M1130 STO  L  *-*       STORE EBCDIC CHARACTER      OCB60970
                          MDX   2 2         SKIP AFTER 5TH CHAR. STORED OCB60980
                          MDX     M1120     BR TO STORE NEXT CHARACTER  OCB60990
                    *                                                   OCB61000
                    * STORE SECTOR ADDRESS OF FILE IN YYYY POSITIONS OF OCB61010
                    * LINE TO BE PRINTED                                OCB61020
                    *                                                   OCB61030
                          LD    1 @SCAD     FETCH SECTOR ADDR           OCB61040
                          SLA     4         SHIFT OUT WORKING       2-3 OCB61050
                          SRA     4         *STORAGE INDICATOR      2-3 OCB61060
                          LDX  L2 M1952     ADDR YYYY VALUE TO XR2      OCB61070
                          BSI     M1500     MOVE SCTR ADDR INTO LINE    OCB61080
                    *                                                   OCB61090
                    * STORE SECTOR COUNT OF FILE IN ZZZZ POSITIONS OF   OCB61100
                    * LINE TO BE PRINTED                                OCB61110
                    *                                                   OCB61120
                          LDX  L2 M1954     ADDR OF ZZZZ TO XR2         OCB61130
                          LD    1 @BCNT                                 OCB61140
                          A    L  M1980+5                               OCB61150
                          SRA     4                                     OCB61160
                          BSI     M1500     MOVE SCTR CNT INTO LINE     OCB61170
                    *                                                   OCB61180
                    * STORE CARTRIDGE ID NO. OF FILE IN UUUU POSITIONS  OCB61190
                    *                                                   OCB61200
                          LDX  L2 M1956     ADDR OF UUUU TO XR2         OCB61210
                          LD    1 @SCAD     BR IF NOT              2-10 OCB61220
                          BSC  L  M1135,Z+  *UA/FX FILE             2-7 OCB61230
                          LD    3 DRCDE     COMPUTE CART ID         2-7 OCB61240
                          SRA     12        *FOR PRINTING           2-7 OCB61250
                          MDX     M1136                             2-7 OCB61260
                    M1135 LD    3 IGNOR                                 OCB61270
                    M1136 A       M1935                                 OCB61280
                          STO     *+1                                   OCB61290
                          LD   L  *-*       FETCH CART ID NO.           OCB61300
                          BSI     M1500     MOVE CART ID INTO LINE      OCB61310
                          LD    1 @SCAD     FETCH SECTOR ADDR OF FILE   OCB61320
                          BSC  L  M1650,-   BR IF UA/FXA FILE           OCB61330
                    *                                                   OCB61340
                    * STORE ADDR OF WORKING STORAGE IN NEXT 4 POSITIONS OCB61350
                          MDX   2 1                                     OCB61360
                          LD    3 IGNOR                                 OCB61370
                          A       M1925                                 OCB61380
                          STO     *+1                                   OCB61390
                          LD   L  *-*       FETCH ADDR OF WORKING STG   OCB61400
                          BSI     M1500     MOVE WS ADDR INTO LINE      OCB61410
                    M1140 LD   I  $CH12     BRANCH UNLESS CHANNEL 12    OCB61420
                          BSC  L  M1150,+-  *HAS BEEN SENSED            OCB61430
                          LDD     M1990                                 OCB61440
                          BSI     M1025     SKIP TO CHANNEL 1           OCB61450
                          BSI     M1025     PRINT PAGE HEADING          OCB61460
                    M1150 LD    3 LSW04     SET UP WORD COUNT FOR LINE  OCB61470
                          STO     M1945     *TO BE MAPPED               OCB61480
                          LD      M1900     FETCH ADDR OF LINE          OCB61490
                          BSI     M1600     PRINT A LINE                OCB61500
                    M1180 LD    3 LOBUF                                 OCB61510
                          A     3 K6                                    OCB61520
                          STO   3 IBT4X                                 OCB61530
                          STO   3 IBT4X+3                               OCB61540
                          STO  L  $LEV1                                 OCB61550
                    M1190 LDX  L2 *-*       RESTORE REGISTER 2          OCB61560
                          BSC  I  M1000     RETURN                      OCB61570
                    *                                                   OCB61580
                    * CONVERT 4 HEX CHARACTERS TO EBCDIC                OCB61590
                    *                                                   OCB61600
                    M1500 DC      *-*       ENTRY POINT                 OCB61610
                          SRT     16        PUT NO. IN EXTENSION        OCB61620
                    M1550 SLT     4         FETCH A HEX CHARACTER AND   OCB61630
                          S       M1910     *COMPARE IT WITH 9          OCB61640
                          BSC     +         SKIP IF GREATER THAN 9      OCB61650
                          A       M1915                                 OCB61660
                          SLA     8         SHIFT TO LEFT HALF OF WORD  OCB61670
                          STO     M1980+1                               OCB61680
                          SLA     4                                     OCB61690
                          SLT     4         FETCH NEXT HEX CHARACTER    OCB61700
                          S       M1910     *AND COMPARE IT WITH 9      OCB61710
                          BSC     +         SKIP IF GREATER THAN 9      OCB61720
                          A       M1915                                 OCB61730
                          OR      M1980+1   'OR' IN LEFT HALF OF WORD   OCB61740
                          OR      M1920                                 OCB61750
                          STO   2 0         STORE PACKED EBCDIC WORD    OCB61760
                          SRA     16        CLEAR ACCUMULATOR           OCB61770
                          MDX   2 1         POINT XR2 TO NXT WD IN LINE OCB61780
                          MDX  L  M1940,-1  SKIP AFTER 2 PASSES         OCB61790
                          MDX     M1550     BR TO CONVERT 2 MORE DIGITS OCB61800
                          LD    3 K2                                    OCB61810
                          STO     M1940     RESTORE COUNTER TO 2        OCB61820
                          BSC  I  M1500     RETURN                      OCB61830
                    *                                                   OCB61840
                    * TRANSFER TO PRINCIPAL PRINT SUBR TO PRINT A LINE  OCB61850
                    *                                                   OCB61860
                    M1600 DC      *-*       ENTRY POINT                 OCB61870
                          RTE     16                                    OCB61880
                          LD      M1930                                 OCB61890
                          BSI  L  M1025     CALL PRINCIPAL PRINTER      OCB61900
                          BSC  I  M1600     RETURN                      OCB61910
                    *                                                   OCB61920
                    * CONSTANTS AND WORK AREAS                          OCB61930
                    * EVEN-NUMBEREB LABELS ARE ON EVEN BOUNDARIES       OCB61940
                    *                                                   OCB61950
                          BSS  E  0                                     OCB61960
                    M1900 DC      M1950-1   ADDR OF XXXXX POS MINUS 1   OCB61970
                    M1905 DC      /F0F0                                 OCB61980
                    M1910 DC      9         HIGHEST DECIMAL MARK        OCB61990
                    M1915 DC      /39                                   OCB62000
                    M1920 DC      /C0C0                                 OCB62010
                    M1921 DC      /000A     2ND HALF SPECIAL CHAR LIMIT OCB62020
                    M1922 DC      /000F     MASK 1ST HALF EBCDIC CHAR   OCB62030
                    M1925 DC      $FPAD     ADDR WORKING STORAGE,DR 0   OCB62040
                    M1930 MDX     *+1       PRINT-A-LINE INDICATOR      OCB62050
                    M1935 DC      LCIDN+X3 ADDR OF CART ID NO. LOG DR 0 OCB62060
                    M1940 DC      2         COUNTER FOR PACKED EBCDIC   OCB62070
                    M1945 DC      *-*       WD CNT OF FILE MAP LINE     OCB62080
                    M1950 EBC     .XXXXX .                              OCB62090
                    M1952 EBC     .YYYY  .                              OCB62100
                    M1954 EBC     .ZZZZ  .                              OCB62110
                    M1956 EBC     .UUUU.                                OCB62120
                    M1958 EBC     .       TRUNCATED.                2-9 OCB62130
                          BSS  E  0                                     OCB62140
                    M1960 DC      M1965     ADDR FILES ALLOCATION LINE  OCB62150
                    M1965 DC      M1970-*   WD CNT OF FILE ALLOC LINE   OCB62160
                          EBC     .FILES ALLOCATION.                    OCB62170
                          BSS  E  0                                     OCB62180
                    M1970 DC      M1975     ADDR STGE ALLOCATION LINE   OCB62190
                    M1975 DC      9         'STORAGE ALLOCATION' WD CNT OCB62200
                          EBC     .STORAGE ALLOCATION.                  OCB62210
                    M1980 BSS  E  5         WORK AREA FOR X, Y, AND Z   OCB62220
                          DC      @DBSC-1   NO. BLOCKS/SCTR MINUS 1     OCB62230
                    M1990 MDX     *         SKIP-TO-CHANNEL-1 INDICATOR OCB62240
                          DC      M1995     HDDR OF PAGE HEADING WD CNT OCB62250
                          DC      10        PAGE HEADING WD CNT         OCB62260
                    M1995 DC      @HDNG     PAGE HEADING SCTR ADDR      OCB62270
                          BSS     10        PAGE HEADING BUFFER         OCB62280
                    M1996 DC      10        1+HIGHEST DECIMAL MARK      OCB62290
                    M1997 DC      /0040     EBCDIC BLANK                OCB62300
                    M1998 DC      /00C0                                 OCB62310
                    *                                                   OCB62320
                    * STORE NAME OF FILE IN LINE TO BE PRINTED          OCB62330
                    *                                                   OCB62340
                    M1650 LDD   3 NAME      FETCH FILE NAME             OCB62350
                          SLA     2                                     OCB62360
                          SRA     2                                     OCB62370
                          SRT     8                                     OCB62380
                          BSI     M1670     CONVERT @,#,$               OCB62390
                          STO     M1958     STORE 1ST CHARACTER         OCB62400
                          SRA     10                                    OCB62410
                          SLT     6                                     OCB62420
                          BSI     M1670     CONVERT @,#,$               OCB62430
                          SLA     8                                     OCB62440
                          STO     M1980                                 OCB62450
                          SLA     2                                     OCB62460
                          SLT     6                                     OCB62470
                          BSI     M1670     CONVERT @,#,$               OCB62480
                          OR      M1980                                 OCB62490
                          STO     M1958+1   STORE 2ND, 3RD CHARACTERS   OCB62500
                          LDD   3 NAME                                  OCB62510
                          SLT     4                                     OCB62520
                          SRA     16                                    OCB62530
                          SLT     6                                     OCB62540
                          BSI     M1670     CONVERT @,#,$               OCB62550
                          SLA     8                                     OCB62560
                          STO     M1980                                 OCB62570
                          SLA     2                                     OCB62580
                          SLT     6                                     OCB62590
                          BSI     M1670     CONVERT @,#,$               OCB62600
                          OR      M1980                                 OCB62610
                          STO     M1958+2   STORE 4TH, 5TH CHARACTERS   OCB62620
                          BSC  L  M1140     BR TO PRINT THE LINE        OCB62630
                    *                                                   OCB62640
                    * CONVERT SPECIAL CHARACTERS                        OCB62650
                    *                                                   OCB62660
                    M1670 DC      *-*       ENTRY POINT                 OCB62670
                          STO     M1980+1                               OCB62680
                          AND     M1922                                 OCB62690
                          S       M1921                                 OCB62700
                          BSC  L  M1700,Z+  BR UNLESS $,#,@             OCB62710
                          LD      M1997                                 OCB62720
                          MDX     M1700+1   BR TO COMPLETE CONVERSION   OCB62730
                    M1700 LD      M1998                                 OCB62740
                          OR      M1980+1                               OCB62750
                          BSC  I  M1670     RETURN                      OCB62760
                    *                                                   OCB62770
                    PBEND BSS     M1000+319-* PATCH AREA                OCB62780
                          DC      *-*       PATCH AREA                  OCB62790
                          HDNG    CORE LOAD BUILDER, PHASE 12           OCB62800
                    *************************************************** OCB62810
                    *                                                 * OCB62820
                    *STATUS-VERSION 2, MODIFICATION 2                 * OCB62830
                    *                                                 * OCB62840
                    *FUNCTION/OPERATION-                              * OCB62850
                    *   * MAPS CALL/LIBF TRANSFER VECTORS IF ANY      * OCB62860
                    *   * MAPS INTERUPT LEVEL SUBROUTINES             * OCB62870
                    *   * MAPS FLIPPER FOR LOCALS/SOCALS IF ANY       * OCB62880
                    *                                                 * OCB62890
                    *ENTRY POINTS-                                    * OCB62900
                    *   * M2000 TIS IS THE ONLY ENTRY POINT           * OCB62910
                    *             BSI  L  M2000                       * OCB62920
                    *                                                 * OCB62930
                    *INPUT-                                           * OCB62940
                    *   * LBATV IN RCOM = ZERO, NO TRANSFER VECTORS   * OCB62950
                    *   * @ITVX AND FOLLOWING FOUR WORDS = ADDR OF    * OCB62960
                    *     PROGRAM STOP KEY TRAP, NO ILS               * OCB62970
                    *   * FLPAD IN RCOM = ZERO, NO FLIPPER            * OCB62980
                    *                                                 * OCB62990
                    *OUTPUT-                                          * OCB63000
                    *   * 'CALL TRANSFER VECTOR' AND NAME AND ADDR, OR* OCB63010
                    *     'LIBF TRANSFER VECTOR' AND NAME AND ADDR    * OCB63020
                    *   * 'SYSTEMS SUBROUTINES' NAME ADDR             * OCB63030
                    *   * 'FLIPR' ADDR                                * OCB63040
                    *                                                 * OCB63050
                    *EXTERNAL REFERENCES-                             * OCB63060
                    *   SUBROUTINES-                                  * OCB63070
                    *      * GP000   READ AND WRITE ON DISK           * OCB63080
                    *      * LK000   FETCH A PHASE VIA SLET           * OCB63090
                    *   COMMA/DCOM-                                   * OCB63100
                    *      * $PBSY                                    * OCB63110
                    *      * $CH12                                    * OCB63120
                    *      * $STOP                                    * OCB63130
                    *                                                 * OCB63140
                    *EXITS-                                           * OCB63150
                    *   NORMAL-                                       * OCB63160
                    *      BACK TO CALLER INDIRECTLY VIA M2000        * OCB63170
                    *   ERROR-N/A                                     * OCB63180
                    *                                                 * OCB63190
                    *TABLES/WORK AREA-N/A                             * OCB63200
                    *                                                 * OCB63210
                    *NOTES-N/A                                        * OCB63220
                    *                                                 * OCB63230
                    *************************************************** OCB63240
                          HDNG    CORE LOAD BUILDER, PHASE 12           OCB63250
                    * PARAMETERS FOR THE SYSTEM LOADER                  OCB63260
                    *                                                   OCB63270
                          ORG     MV000                                 OCB63280
*SBRKGL  83         *CORE LOAD BUILDER, PHASE 12                  V2M02 OCB63290
                          DC      PCEND-*-1 PHASE 12 WD CNT             OCB63300
                          DC      @CLBC     ID NO.                      OCB63310
                          HDNG    CORE LOAD BUILDER, PHASE 12           OCB63320
                    * PRINT THE CORE MAP                                OCB63330
                    *                                                   OCB63340
                    M2000 DC      *-*       ENTRY POINT                 OCB63350
                          LDX  L2 Z         POINT TO CONSTANTS          OCB63360
                          LD    2 M2998+1-Z                             OCB63370
                          S     3 K1                                    OCB63380
                          SRT     16                                    OCB63390
                          BSI  L  GP000     FETCH PAGE HEADING          OCB63400
                          LD    2 M2999-1-Z                             OCB63410
                          STO   2 M2999-Z                               OCB63420
                          LD    3 LOBUF                                 OCB63430
                          LDX  L1 @PRNT                                 OCB63440
                          BSI  L  LK000     FETCH PRINCIPAL PRINT SUBR  OCB63450
                          LD    3 LBATV                                 OCB63460
                          BSC  L  M2005,+-  BR IF NO TRANSFER VECTOR    OCB63470
                          BSI     M2300     MAP CALL TRANSFER VECTOR    OCB63480
                          LD    3 K0                                    OCB63490
                          STO   2 M2982-Z   SET CALL/LIBF SWITCH        OCB63500
                          LDD   2 M2980-Z                               OCB63510
                          STD   2 M2995+1-Z                             OCB63520
                          BSI     M2300     MAP LIBF TRANSFER VECTOR    OCB63530
                    *                                                   OCB63540
                    * MAP THE INTERRUPT LEVEL SUBROUTINES               OCB63550
                    *                                                   OCB63560
                    M2005 LDX   1 6         NO. IL SUBROUTINES TO XR1   OCB63570
                          LD    3 K0                                    OCB63580
                          STO   2 M2930-Z                               OCB63590
                    M2010 LD   L1 @ITVX-1                               OCB63600
                          S     2 M2940-Z   BR IF NO ILS REQUIRED FOR   OCB63610
                          BSC  L  M2030,+-  *CURRENT INTERRUPT LEVEL    OCB63620
                          S     2 M2997-Z   BR IF NO ILS05              OCB63630
                          BSC  L  M2030,+-  *REQUIRED                   OCB63640
                          MDX  L  M2930,0   SKIP IF HEADING NOT PRINTED OCB63650
                          MDX     M2020     BR TO MAP THE ILS           OCB63660
                          LD    2 M2996-Z                               OCB63670
                          STO   2 M2930-Z                               OCB63680
                          RTE     16                                    OCB63690
                          LD    2 M2901-Z                               OCB63700
                          BSI     M2200     PRINT 'SYSTEM SUBROUTINES'  OCB63710
                    M2020 STX  L1 M2920     SAVE 1 PLUS CURRENT ILS NO. OCB63720
                          LD   L  $GCOM     CHECK IF ILS TYPE .X.   2-2 OCB63730
                          OR    3 LX3SW     *TO BE MAPPED           2-2 OCB63740
                          BSC  L  M2025,Z   BRANCH IF YES           2-2 OCB63750
                          LD    2 M2920-Z                               OCB63760
                          S     3 K1        COMPUTE ILS NO.             OCB63770
                          OR    2 M2945+1-Z                             OCB63780
                          MDX     M2027                             2-2 OCB63790
                    M2025 LD    2 M2920-Z                           2-2 OCB63800
                          S     3 K1                                2-2 OCB63810
                          OR    2 M2944+1-Z                         2-2 OCB63820
                    M2027 RTE     16                                    OCB63830
                          LD    2 M2945-Z                               OCB63840
                          BSI     M2500     PUT ILS NAME IN PRINT BFR   OCB63850
                          LD    2 M2994-Z                               OCB63860
                          STO   2 M2985-Z                               OCB63870
                          LD   L1 @ITVX-1                               OCB63880
                          BSI   2 M2600-Z   PUT ILS ENTRY ADDR IN BFR   OCB63890
                          LD    2 M2965-Z                               OCB63900
                          RTE     16                                    OCB63910
                          LD    2 M2901-Z                               OCB63920
                          BSI     M2200     MAP CURRENT ILS             OCB63930
                    M2030 MDX   1 -1        SKIP AFTER MAPPING ILS00    OCB63940
                          MDX     M2010     BR TO CHECK FOR NEXT ILS    OCB63950
                    *                                                   OCB63960
                    * MAP  THE FLIPPER                                  OCB63970
                    *                                                   OCB63980
                          LD    3 FLPAD     FETCH THE ADDR OF FLIPPER   OCB63990
                          BSC  L  M2180,+-  BR IF NO LOCALS/SOCALS USED OCB64000
                          LDD   2 M2950-Z   PUT THE WORD 'FLIPR'        OCB64010
                          BSI     M2500     *IN PRINT BUFFER            OCB64020
                          LD    3 FLPAD     PUT ENTRY POINT ADDR TO     OCB64030
                          BSI     M2600     *FLIPPER IN BUFFER          OCB64040
                          LD    2 M2994-Z                               OCB64050
                          STO   2 M2985-Z                               OCB64060
                          LD    2 M2965-Z                               OCB64070
                          RTE     16                                    OCB64080
                          LD    2 M2901-Z                               OCB64090
                          BSI     M2200     MAP THE FLIPPER             OCB64100
                    M2180 BSC  I  M2000     RETURN TO ER SUBROUTINE     OCB64110
                    *                                                   OCB64120
                    * CALL PRINTER                                      OCB64130
                    *                                                   OCB64140
                    M2190 DC      *-*       ENTRY POINT                 OCB64150
                          BSI  L  BUFLO+3   OUT TO PRINTER              OCB64160
                          MDX  L  $PBSY,0   SKIP IF PRINTER NOT BUSY,   OCB64170
                          MDX     *-3       *BRANCH OTHERWISE           OCB64180
                          BSC  I  M2190     RETURN                      OCB64190
                    *                                                   OCB64200
                    * PRINT A LINE                                      OCB64210
                    *                                                   OCB64220
                    M2200 DC      *-*       ENTRY POINT                 OCB64230
                          STD   2 M2920-Z                               OCB64240
                          LD   I  $CH12                                 OCB64250
                          BSC  L  M2230,+-  BR UNLESS CHAN 12 SENSED    OCB64260
                          LDD   2 M2998-Z                               OCB64270
                          BSI     M2190     SKIP TO CHANNEL 1           OCB64280
                          BSI     M2190     PRINT PAGE HEADING          OCB64290
                    M2230 LDD   2 M2920-Z                               OCB64300
                          BSI     M2190     PRINT A LINE                OCB64310
                          BSC  I  M2200     RETURN                      OCB64320
                    *                                                   OCB64330
                    * MAP THE CALL OR LIBF TRANSFER VECTOR              OCB64340
                    *                                                   OCB64350
                    M2300 DC      *-*       ENTRY POINT                 OCB64360
                          SRA     16                                    OCB64370
                          STO   2 M2930-Z   CLEAR HEADING SWITCH        OCB64380
                          LDX  I1 LEFTX+X3  LEFT LIMIT OF LD TBL TO XR1 OCB64390
                          MDX   1 @LTEN     PT TO LAST LD TBL ENTRY     OCB64400
                    M2320 LD    1 @WRD1     FETCH 1ST WORD OF NAME      OCB64410
                          SLA     1                                     OCB64420
                          SRA     15                                    OCB64430
                          EOR   2 M2982-Z                               OCB64440
                          BSC  L  M2400,Z   BR IF NOT TIME TO PRINT     OCB64450
                          LD    2 M2994-Z                               OCB64460
                          STO   2 M2985-Z   SET UP LINE WD CNT          OCB64470
                          LD    1 @WRD1                                 OCB64480
                          BSC  L  M2370,-   BR UNLESS CURR ENT A LOCAL  OCB64490
                          LD    2 M2970-Z                               OCB64500
                          STO   2 M2990-Z                               OCB64510
                          LD    2 M2906-Z   INCREASE WD CNT TO INCLUDE  OCB64520
                          STO   2 M2985-Z     *THE WORD 'LOCAL'         OCB64530
                          MDX     M2380     BR TO DECIDE TO PRINT       OCB64540
                    M2370 LD    1 @WRD4                                 OCB64550
                          BSC  L  M2380,+-  BR UNLESS ENTRY IS A SOCAL  OCB64560
                          OR    2 M2997-Z   PUT SOCAL NO. IN            OCB64570
                          STO   2 M2992-Z   *LINE TO BE PRINTED         OCB64580
                          LD      M2975                                 OCB64590
                          STO   2 M2990-Z                               OCB64600
                          LD    2 M2900-Z   INCREASE WD CNT TO INCLUDE  OCB64610
                          STO     M2985     *THE WORD 'SOCAL'           OCB64620
                    M2380 MDX  L  M2930,0   SKIP IF HEADING NOT PRINTED OCB64630
                          MDX     M2390     BR IF HEADING ALREADY DONE  OCB64640
                          LD      M2960                                 OCB64650
                          SRT     16                                    OCB64660
                          LD      M2901                                 OCB64670
                          STO     M2930                                 OCB64680
                          BSI     M2190     PRINT CALL/LIBF HEADING     OCB64690
                    M2390 LDD   1 @WRD1     FETCH SUBROUTINE NAME       OCB64700
                          BSI     M2500     PUT NAME IN PRINT BUFFER    OCB64710
                          LD    1 @WRD3     FETCH ENTRY POINT           OCB64720
                          BSI     M2600     PUT EXEC ADDR IN PRINT BFR  OCB64730
                          LD      M2965                                 OCB64740
                          RTE     16                                    OCB64750
                          LD      M2901                                 OCB64760
                          BSI     M2200     MAP THE CURRENT LD TBL ENT  OCB64770
                    M2400 STX   1 M2920                                 OCB64780
                          LD      M2920     COMPARE ADDR OF CURR LOAD   OCB64790
                          S     3 RIGHT     *TBL ENTRY W/ ADDR OF LAST  OCB64800
                          MDX   1 @LTEN     POINT TO NEXT LD TBL ENTRY  OCB64810
                          BSC  L  M2320,Z   BR IF NOT YET AT END OF TBL OCB64820
                          BSC  I  M2300     RETURN                      OCB64830
                    *                                                   OCB64840
                    * CONVERT SUBROUTINE NAME FROM NAME CODE TO PACKED  OCB64850
                    * EBCDIC AND STORE IT IN THE XXXXX POSITIONS        OCB64860
                    *                                                   OCB64870
                    M2500 DC      *-*       ENTRY POINT                 OCB64880
                          STD   3 RNAME                                 OCB64890
                          SLA     2                                     OCB64900
                          SRA     2                                     OCB64910
                          SRT     8                                     OCB64920
                          BSI   2 M2650-Z   CONVERT @,#,$               OCB64930
                          STO     M2986     STORE 1ST CHARACTER         OCB64940
                          SRA     10                                    OCB64950
                          SLT     6                                     OCB64960
                          BSI   2 M2650-Z   CONVERT @,#,$               OCB64970
                          SLA     8                                     OCB64980
                          STO     M2920                                 OCB64990
                          SLA     2                                     OCB65000
                          SLT     6                                     OCB65010
                          BSI   2 M2650-Z   CONVERT @,#,$               OCB65020
                          OR      M2920                                 OCB65030
                          STO     M2986+1   STORE 2ND, 3RD CHARACTERS   OCB65040
                          LDD   3 RNAME                                 OCB65050
                          SLT     4                                     OCB65060
                          SRA     16                                    OCB65070
                          SLT     6                                     OCB65080
                          BSI     M2650     CONVERT @,#,$               OCB65090
                          SLA     8                                     OCB65100
                          STO     M2920                                 OCB65110
                          SLA     2                                     OCB65120
                          SLT     6                                     OCB65130
                          BSI     M2650     CONVERT @,#,$               OCB65140
                          OR      M2920                                 OCB65150
                          STO     M2986+2   STORE 4TH, 5TH CHARACTERS   OCB65160
                          BSC  I  M2500     RETURN                      OCB65170
                    *                                                   OCB65180
                    * CONVERT SUBROUTINE ENTRY POINT ADR FROM BINARY TO OCB65190
                    * PACKED EBCDIC AND STORE IT IN THE YYYY POSITIONS  OCB65200
                    *                                                   OCB65210
                    M2600 DC      *-*       ENTRY POINT                 OCB65220
                          SRT     16                                    OCB65230
                    M2630 SLT     4                                     OCB65240
                          S       M2905     SKIP IF CHARACTER IS        OCB65250
                          BSC     +         *LESS THAN 10, I.E., A      OCB65260
                          A       M2903                                 OCB65270
                          SLA     8                                     OCB65280
                          STO     M2920                                 OCB65290
                          SLA     4                                     OCB65300
                          SLT     4                                     OCB65310
                          S       M2905     SKIP IF CHARACTER IS        OCB65320
                          BSC     +         *LESS THAN 10, I.E., A      OCB65330
                          A       M2903                                 OCB65340
                          OR      M2920                                 OCB65350
                          OR      M2902                                 OCB65360
                          STO  L2 M2986+4-Z STORE CONVERTED CHARACTER   OCB65370
                          SRA     16        CLEAR ACCUMULATOR           OCB65380
                          MDX   2 1                                     OCB65390
                          MDX  L  M2904,-1  SKIP AFTER 2ND PASS         OCB65400
                          MDX     M2630     BR TO CONVERT RIGHT HALF    OCB65410
                          LD    3 K2                                    OCB65420
                          STO     M2904     RESTORE COUNTER TO 2        OCB65430
                          MDX   2 -2                                    OCB65440
                          BSC  I  M2600     RETURN                      OCB65450
                    *                                                   OCB65460
                    * CONSTANTS AND WORK AREAS                          OCB65470
                    *                                                   OCB65480
                    Z     BES  E  0                                     OCB65490
                    M2900 DC      10        WD CNT FOR A SOCAL LINE     OCB65500
                    M2901 MDX     *+1       PRINT FUNCTION-INDICATOR    OCB65510
                    M2902 DC      /C0C0                                 OCB65520
                    M2903 DC      /39                                   OCB65530
                    M2904 DC      2         COUNTER                     OCB65540
                    M2905 DC      9         HIGHEST DECIMAL MARK        OCB65550
                    M2906 DC      9         LONG LINE WORD COUNT        OCB65560
                          BSS     1         PATCH AREA                  OCB65570
                    M2920 BSS  E  2         WASTEBASKET                 OCB65580
                    M2922 DC      /000A     2ND HALF SPECIAL CHAR LIMIT OCB65590
                    M2925 DC      /000F     MASK 1ST HALF EBCDIC CHAR   OCB65600
                    M2930 DC      *-*       HDNG SW-ZERO=PRINT HEADING  OCB65610
                    M2935 DC      9         ILS/FLIPR HEADING           OCB65620
                          EBC     .SYSTEM SUBROUTINES.                  OCB65630
                    M2937 DC      /0040     EBCDIC BLANK                OCB65640
                    M2940 DC      $STOP     ADDR OF PROG STOP KEY TRAP  OCB65650
                    M2944 DN      ILSX0                             2-2 OCB65660
                    M2945 DN      ILS00                                 OCB65670
                    M2946 DC      /00C0                                 OCB65680
                    M2950 DN      FLIPR                                 OCB65690
                    M2960 DC      M2995     ADDR OF HEADING LINE BUFFER OCB65700
                    M2965 DC      M2985     ADDR OF MAP LINE BUFFER     OCB65710
                    M2970 EBC     . L.                                  OCB65720
                    M2975 EBC     . S.                                  OCB65730
                    M2980 EBC     .LIBF.                                OCB65740
                    M2982 DC      1         CALL/LIBF SW                OCB65750
                    M2985 DC      *-*       WD CNT FOR MAP LINE         OCB65760
                    M2986 EBC     . XXXXX  .                            OCB65770
                    M2988 EBC     .YYYY.                                OCB65780
                    M2990 EBC     . ZOCAL.                              OCB65790
                    M2992 EBC     . U.                                  OCB65800
                    M2994 DC      6         SHORT LINE WD CNT           OCB65810
                    M2995 DC      10        HEADING WORD COUNT          OCB65820
                          EBC     .CALL TRANSFER VECTOR.                OCB65830
                    M2996 DC      M2935     ADDR OF SYSTEM SUBR HDNG    OCB65840
                    M2997 DC      /40F0     MASK FOR SOCAL NO.          OCB65850
                          BSS  E  0                                     OCB65860
                    M2998 MDX     *         SKIP-TO-CHANNEL-1 INDICATOR OCB65870
                          DC      M2999     ADDR OF PAGE HEADING WD CNT OCB65880
                          DC      10        PAGE HEADING WD CNT         OCB65890
                    M2999 DC      @HDNG     PAGE HEADING SCTR ADDR      OCB65900
                          BSS     10        PAGE HEADING BUFFER         OCB65910
                    *                                                   OCB65920
                    * CONVERT SPECIAL CHARACTERS                        OCB65930
                    *                                                   OCB65940
                    M2650 DC      *-*       ENTRY POINT                 OCB65950
                          STO     M2920+1                               OCB65960
                          AND     M2925                                 OCB65970
                          S       M2922                                 OCB65980
                          BSC  L  M2670,Z+  BR UNLESS $,#,@             OCB65990
                          LD      M2937                                 OCB66000
                          MDX     M2670+1   BR TO COMPLETE CONVERSION   OCB66010
                    M2670 LD      M2946                                 OCB66020
                          OR      M2920+1                               OCB66030
                          BSC  I  M2650     RETURN                      OCB66040
                    *                                                   OCB66050
                    PCEND BSS     P3END-*   PATCH AREA                  OCB66060
                          DC      0         PATCH AREA                  OCB66070
                          HDNG    CORE LOAD BUILDER, PHASE 13       2G2 OCB66080
                    *************************************************** OCB66090
                    *STATUS - VERSION 2 MODIFICATION 10               * OCB66100
                    *                                                 * OCB66110
                    *FUNCTION/OPERATION                               * OCB66120
                    *   * THIS PHASE PROCESSES THE FOLLOWING          * OCB66130
                    *     2250-4 ORDERS                               * OCB66140
                    *       1. GSB (GRAPHIC SHORT BRANCH)             * OCB66150
                    *       2. GBE (GRAPHIC BRANCH EXTERNAL)          * OCB66160
                    *       3. GBCE(GRAPHIC BRANCH CONDITIONAL        * OCB66170
                    *               EXTERNAL)                         * OCB66180
                    *                                                 * OCB66190
                    *ENTRY POINT                                      * OCB66200
                    *   * GC000                                       * OCB66210
                    *                                                 * OCB66220
                    *INPUT                                            * OCB66230
                    *   *FOR GSB-ADDR TO BE RELOCATED IF LESS THAN    * OCB66240
                    *            8K AFTER RELDC FACTER IS ADDED.      * OCB66250
                    *   *FOR GBE,GBCE-NAME OF AN EXTERNAL GRAPHIC     * OCB66260
                    *            ORDER SUBROUTINE                     * OCB66270
                    *                                                 * OCB66280
                    *OUTPUT                                           * OCB66290
                    *   *FOR GSB-RELOCATED GSB ORDER WITH ADDRESS     * OCB66300
                    *            LESS THAN OR EQUAL TO 8191.          * OCB66310
                    *   *FOR GSB,GBCE-GB I TO THE CALL TV TBL ENTRY   * OCB66320
                    *            ADDRESS.                             * OCB66330
                    *                                                 * OCB66340
                    *EXTERNAL REFERENCES                              * OCB66350
                    *   SUBROUTINES                                   * OCB66360
                    *     * BT000                                     * OCB66370
                    *     * TL000                                     * OCB66380
                    *   COMMA/DCOM                                    * OCB66390
                    *     * $PHSE                                     * OCB66400
                    *                                                 * OCB66410
                    *EXITS                                            * OCB66420
                    *   NORMAL-BACK TO PHASE 2                        * OCB66430
                    *   ERROR-                                        * OCB66440
                    *                                                   OCB66450
                    *                                                 * OCB66460
                    *************************************************** OCB66470
                          HDNG    GRAPHICS 2250 PHASE (CLB,PHASE 13)    OCB66480
                    *                                               2G2 OCB66490
                    * PARAMETERS FOR THE SYSTEM LOADER              2G2 OCB66500
                          ORG     BUFLS                             2G2 OCB66510
*SBRKDM  84 08/01/68*CORE LOAD BUILDER, PHASE 13                   2-10 OCB66520
                          DC      PDEND-*-1  PH 13 WORD COUNT       2G2 OCB66530
                          DC      132    PHASE ID OF GRAPHICS PHASE.2G2 OCB66540
                          HDNG    GRAPHICS 2250 PHASE (CLB,PHASE 13)    OCB66550
                    GC000 LD    3 K320                              2G2 OCB66560
                          STO     GC000-2                           2G2 OCB66570
                          LD      GC950                             2G2 OCB66580
                          STO  L  $PHSE                             2G2 OCB66590
                          LDX  I1 RL940     RESTORE XR1             2G2 OCB66600
                          LD   L  RL999     TEST GRAPHIC INDICATOR  2G2 OCB66610
                          BSC  L  GC200,+-  BR IF GBC,GBCE PROCESSIN2G2 OCB66620
                          LD    3 K0                                2G2 OCB66630
                          STO  L  RL940     CLEAR LIBF,CALL,DSA SW  2G2 OCB66640
                          STO  L  RL999     CLEAR GRAPHIC INDICATOR 2G2 OCB66650
                          LD    3 NAME                              2G2 OCB66660
                          SLA     1         CLEAR GSB INDICATOR BIT 2G2 OCB66670
                          SRA     1                                 2G2 OCB66680
                          A     3 RELOC                             2G2 OCB66690
                          STO   3 NAME                              2G2 OCB66700
                          LD    3 LSW17     CHECK IF PASS 1         2G6 OCB66710
                          BSC  L  GC150,Z   BRANCH IF NO            2G6 OCB66720
                          LD    3 LSW19     CHECK IF PASS 2 REQUIRD 2G6 OCB66730
                          BSC  L  GC150,+-  BRANCH IF NO            2G6 OCB66740
                          LD    3 NAME      YES - RESET GSB FLAG    2G6 OCB66750
                          OR    3 K8000     *FOR PASS 2 RELOCATION  2G6 OCB66760
                          STO   3 NAME                              2G6 OCB66770
                          MDX     GC160     BRANCH TO RETURN POINT  2G6 OCB66780
                    GC150 LD    3 NAME      TEST IF GSB ADDR AFTER  2G6 OCB66790
                          S       GC900     *RELOC IS VALID(LT 8192)2G6 OCB66800
                          BSC  L  GC170,Z-  BR IF GSB ADDR IS INVLD 2G6 OCB66810
                    GC160 BSC  L  RL100     RETURN                  2G6 OCB66820
                    GC170 LDX   2 MSG67     INVALID GSB ADDR MSG    2G6 OCB66830
                          BSI  L  TL000     PRINT MSG AND TERMINATE 2G6 OCB66840
                    *                                               2G2 OCB66850
                    GC200 LD    3 K0                                2G2 OCB66860
                          STO     GC930     CLEAR NOP BIT HOLD AREA 2G2 OCB66870
                          LD   L  RL920                             2G2 OCB66880
                          SLA     1                                 2G2 OCB66890
                          SLA     1                                 2G2 OCB66900
                          STO  L  RL920                             2G2 OCB66910
                          BSC     C         SKIP IF GBE OR GBCE     2G2 OCB66920
                          MDX     GC300     BR TO GBCE(NOP)         2G2 OCB66930
                    GC210 LD    3 K0                                2G2 OCB66940
                          STO  L  RL940                             2G2 OCB66950
                          LDD   3 NAME                              2G2 OCB66960
                          RTE     16                                2G2 OCB66970
                          STD   3 NAME                              2G2 OCB66980
                          SRA     14                                2G2 OCB66990
                          STO     GC910                             2G2 OCB67000
                          LD    3 NAME                              2G2 OCB67010
                          SLA     2         CLEAR CONDITION INDICATO2G2 OCB67020
                          SRA     2                                 2G2 OCB67030
                          OR    3 K4000                             2G2 OCB67040
                          STO   3 NAME                              2G2 OCB67050
                          BSI  L  BT000                             2G2 OCB67060
                          LD      GC920     MODEL GB I ORDER        2G2 OCB67070
                          OR      GC910     OR IN CONDITION BITS,IF 2G2 OCB67080
                          OR      GC930     OR IN NOP BIT,IF ANY    2G2 OCB67090
                          BSI  L  TR000     STORE WORD 1 OF ORDER   2G2 OCB67100
                          LD    3 TVPTR     CALL TV ENTRY ADDR.     2G2 OCB67110
                          BSC  L  RL390     STORE WORD 2 OF ORDER   2G2 OCB67120
                    *                                               2G2 OCB67130
                    *  CONSTANTS AND WORK AREA                      2G2 OCB67140
                    *                                               2G2 OCB67150
                    GC900 DC      8191      MAX ADDR FOR GSB ORDER  2G2 OCB67160
                    GC910 DC      *-*       CONDITION BIT HOLD AREA 2G2 OCB67170
                    GC920 DC      /2880     MODEL GB I ORDER        2G2 OCB67180
                    GC930 DC      *-*       NOP BIT HOLD AREA       2G2 OCB67190
                    GC940 DC      /0400     NOP BIT                 2G2 OCB67200
                    GC950 DC      /79                               2G2 OCB67210
                    *                                               2G2 OCB67220
                    *                                               2G2 OCB67230
                    GC300 LD      GC940                             2G2 OCB67240
                          STO     GC930                             2G2 OCB67250
                          MDX     GC210                             2G2 OCB67260
                    *                                               2G2 OCB67270
                    PDEND BSS     GC000+319-* PATCH AREA                OCB67280
                          DC      0         PATCH AREA                  OCB67290
                          END     *                                     OCB67300
