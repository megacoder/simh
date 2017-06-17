// ASM
*XREF
                          ABS
                          HDNG    OC07       2501/1442 IDNTSRT ONE CARD OC07 000
 O   C   0  777     *                                                   OC07 001
O O C C 0 0   7     *************************************************** OC07 002
O O C   000  7      *************************************************** OC07 003
O O C C 0 0 7       *                                                   OC07 004
 O   C   0  7       *     SORTIERT ALLE JENE KARTEN (OHNE LETZTE ZWEI   OC07 005
                    *     KARTEN) EINES STARTBEREIT IN DER 1442 EINGE-  OC07 006
                    *     LEGTEN KARTENDECKS, WELCHE MIT EINER UNMIT-   OC07 007
                    *     TELBAR DER PROGRAMMKARTE AUF DEM 2501 NACH-   OC07 008
                    *     FOLGENDEN KARTE UEBEREINSTIMMEN, VON DEN      OC07 009
                    *     UEBRIGEN                                      OC07 010
                    *                                                   OC07 011
                    *************************************************** OC07 012
                    *                                                   OC07 013
                    *     SAP 2D  1131/1442/2501                  OEW/0 OC07 014
                    *                                                   OC07 015
                    *************************************************** OC07 016
                    *                                                   OC07 017
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC07 018
                    *               MIT PROGRAM LOAD TASTE              OC07 019
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC07 020
                    *               IMMEDIATE STOP, RESET UND PROGRAM   OC07 021
                    *               START                               OC07 022
                    *                                                   OC07 023
                    *     INPUT   2501       SORTIERUNGSSTEUERNDE KARTE OC07 024
                    *                        UNMITTELBAR AUF PROGRAMM-  OC07 025
                    *                        KARTE FOLGEND, SOWIE EINE  OC07 026
                    *                        LEERKARTE                  OC07 027
                    *                                                   OC07 028
                    *             1442       KARTENDECK (1442 READY)    OC07 029
                    *                                                   OC07 030
                    *     OUTPUT  1442-1     KARTEN, WELCHE MIT DER     OC07 031
                    *                        SORTIERUNGSSTEUERNDEN KAR- OC07 032
                    *                        TE NICHT UEBEREINSTIMMEN   OC07 033
                    *                                                   OC07 034
                    *             1442-2     KARTEN, WELCHE MIT DER     OC07 035
                    *                        SORTIERUNGSSTEUERNDEN KAR- OC07 036
                    *                        TE UEBEREINSTIMMEN         OC07 037
                    *                                                   OC07 038
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC07 039
                    *                        GINNEN                     OC07 040
                    *                                                   OC07 041
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC07 042
                    *             DUERFEN NICHT BENUETZT WERDEN         OC07 043
                    *                                                   OC07 044
                    *************************************************** OC07 045
                    *************************************************** OC07 046
                          EJCT                                          OC07 047
                    *                                                   OC07 048
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC07 049
                    *                                                   OC07 050
                          DN      OC07                                  OC07 051
                          DC      25073                        25.07.73 OC07 052
                          ORG     /0000                        -- *-  - OC07 053
                    *                                                   OC07 054
                    START NOP                                           OC07 055
                          ORG     *-1                                   OC07 056
                    OC07  B       MODIF                           ABS 0 OC07 057
                          LD      XR3        (NOT ZERO)                 OC07 058
                          LDX     READ                                  OC07 059
                    *                                                   OC07 060
                    XR3   DC      *-*                           OC07+ 3 OC07 061
                          ORG     *-1                                   OC07 062
                    RS    NOP                                           OC07 063
                    *                                                   OC07 064
                    CSTO  DC      *-*        SPEICHER           OC07+ 4 OC07 065
                          ORG     *-1                                   OC07 066
                    H0029 DC      /0029                                 OC07 067
                    *                                                   OC07 068
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC07+ 5 OC07 069
                          ORG     *-1                                   OC07 070
                    H4000 DC      /4000                                 OC07 071
                          DC      /00CC      (BOSC I)                   OC07 072
                    D0005 DC      BOSC                                  OC07 073
                    *                                                   OC07 074
                    LEV0  DC      INTR0      ADR LEV 0          OC07+ 8 OC07 075
                    *                                                   OC07 076
                    PCHST DC      /1404      IOCC PREAD START         O OC07 077
                    ADRR  DC      AREA       IOCC READ ADR            E OC07 078
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC07 079
                    *                                                   OC07 080
                    LEV4  DC      INTR4      ADR LEV 4          OC07+12 OC07 081
                    *                                                   OC07 082
                    READ  STO     SELEC      EINSPRUNG READ             OC07 083
                          XIO     RDST-1                                OC07 084
                          B       *-1                                   OC07 085
                    *                                                   OC07 086
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH READ       OC07 087
                          B       *-1                                   OC07 088
                    *                                                   OC07 089
                    *************************************************** OC07 090
                          EJCT                                          OC07 091
                    *                                                   OC07 092
                    *     INTERRUPT-ROUTINEN                            OC07 093
                    *                                                   OC07 094
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC07 095
                          ORG     *-1                           OC07+18 OC07 096
                    H3010 DC      /3010                                 OC07 097
                          XIO     D1442-1                               OC07 098
                          XIO     D2501-1                               OC07 099
                          BSI     BOSC                                  OC07 100
                          LD      SELEC                                 OC07 101
                          BSC     +-                                    OC07 102
                          XIO     STSEL-1                               OC07 103
                          SRA     16                                    OC07 104
                          STO     XR3                                   OC07 105
                          STO     SELEC                                 OC07 106
                          LDX     PUNCH                                 OC07 107
                    *                                                   OC07 108
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC07 109
                          ORG     *-1                                   OC07 110
                    H0001 DC      /0001                                 OC07 111
                          XIO     SENS0-1                               OC07 112
                          XIO     WREAD-1                               OC07 113
                          LD    3 AREA-OC07+1                           OC07 114
                          NOP                                           OC07 115
                          EOR     CSTO                                  OC07 116
                          BSC     Z                                     OC07 117
                          STO     SELEC                                 OC07 118
                    MDX3  MDX   3 1                                     OC07 119
                          BSI     BOSC                                  OC07 120
                    END   B       *-1                                   OC07 121
                    *                                                   OC07 122
                    *************************************************** OC07 123
                    *                                                   OC07 124
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC07 125
                    *                                                   OC07 126
                    SELEC DC      *-*        SELECT SWITCH              OC07 127
                    STSEL DC      /1480      IOCC STACKER             O OC07 128
                          DC      *-*                                   OC07 129
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC07 130
                          DC      *-*                                   OC07 131
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC07 132
                          DC      *-*                                   OC07 133
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC07 134
                    ADRC  DC      CSTO       IOCC WREAD ADR           E OC07 135
                    WREAD DC      /1200      IOCC WREAD               O OC07 136
                    *                                                   OC07 137
                    AREA  DC      80                                  E OC07 138
                          BSS     80                                    OC07 139
                          ORG     END+1                                 OC07 140
                    *                                                   OC07 141
                    *************************************************** OC07 142
                          EJCT                                          OC07 143
                    *                                                   OC07 144
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC07 145
                    *                                                   OC07 146
                    MODIF LD      RS                                    OC07 147
                          STO     OC07       FUER NEUBEGINN             OC07 148
                          LD      BOSC+1                                OC07 149
                          SLA     4          /0CC0                      OC07 150
                          OR      H4000      /4CC0                      OC07 151
                          STO     BOSC+1                                OC07 152
                          LD      H3010                                 OC07 153
                          SRA     4          /0301                      OC07 154
                          STO     H3010                                 OC07 155
                          OR      INTR0+3    /C333                      OC07 156
                          STO     INTR0+3                               OC07 157
                          LD      RDST                                  OC07 158
                          SLA     9          /4E00                      OC07 159
                          STO     RDST                                  OC07 160
                          OR      H3010      /4F01                      OC07 161
                          STO     D2501                                 OC07 162
                          LD      D0005                                 OC07 163
                          SLA     4          /0050                      OC07 164
                          STO     AREA                                  OC07 165
                          LD      LEV4                                  OC07 166
                          SLA     8          /1200                      OC07 167
                          STO     WREAD                                 OC07 168
                          LD      H0029                                 OC07 169
                          SLA     7          /1480                      OC07 170
                          STO     STSEL                                 OC07 171
                          LD      H4000                                 OC07 172
                          SRA     12         /0004                      OC07 173
                          STO     ADRC                                  OC07 174
                          SLA     8          /0400                      OC07 175
                          OR      PCHST      /1404                      OC07 176
                          STO     PCHST                                 OC07 177
                          EOR     ADRC       /1400                      OC07 178
                          OR      H3010      /1701                      OC07 179
                          STO     SENS0                                 OC07 180
                          A       H0001      /1702                      OC07 181
                          STO     D1442                                 OC07 182
                          LD      MDX3                                  OC07 183
                          OR      H3010      /7301                      OC07 184
                          STO     MDX3                                  OC07 185
                          LDX     START                                 OC07 186
                    *                                                   OC07 187
                    *************************************************** OC07 188
                    *************************************************** OC07 189
                    *                                                   OC07 190
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC07 191
                    *                                                   OC07 192
                          END     OC07                         25.07.73 OC07 193
