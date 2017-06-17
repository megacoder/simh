// ASM
*XREF
                          ABS
                          HDNG    OC02       2501/1442 GANGPCH ONE CARD OC02 000
 O   C   0   22     *                                                   OC02 001
O O C C 0 0 2 2     *************************************************** OC02 002
O O C   000  2      *************************************************** OC02 003
O O C C 0 0 2       *                                                   OC02 004
 O   C   0  222     *     REPRODUZIERT DIE UNMITTELBAR DER PROGRAMMKAR- OC02 005
                    *     TE AUF DEM 2501 NACHFOLGENDE KARTE AUF LEER-  OC02 006
                    *     KARTEN, WELCHE STARTBEREIT IN DER 1442 EINGE- OC02 007
                    *     LEGT SEIN MUESSEN                             OC02 008
                    *                                                   OC02 009
                    *************************************************** OC02 010
                    *                                                   OC02 011
                    *     SAP 2D  1131/1442/2501                  OEW/0 OC02 012
                    *                                                   OC02 013
                    *************************************************** OC02 014
                    *                                                   OC02 015
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC02 016
                    *               MIT PROGRAM LOAD TASTE              OC02 017
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC02 018
                    *               IMMEDIATE STOP, RESET UND PROGRAM   OC02 019
                    *               START                               OC02 020
                    *                                                   OC02 021
                    *     INPUT   2501       ZU REPRODUZIERENDE KARTE   OC02 022
                    *                        UNMITTELBAR AUF PROGRAMM-  OC02 023
                    *                        KARTE FOLGEND, SOWIE EINE  OC02 024
                    *                        LEERKARTE                  OC02 025
                    *                                                   OC02 026
                    *             1442       LEERKARTEN (1442 READY)    OC02 027
                    *                                                   OC02 028
                    *     OUTPUT  1442       REPRODUZIERTE KARTEN       OC02 029
                    *                                                   OC02 030
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC02 031
                    *                        GINNEN                     OC02 032
                    *                                                   OC02 033
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC02 034
                    *             DUERFEN NICHT BENUETZT WERDEN         OC02 035
                    *                                                   OC02 036
                    *************************************************** OC02 037
                    *************************************************** OC02 038
                          EJCT                                          OC02 039
                    *                                                   OC02 040
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC02 041
                    *                                                   OC02 042
                          DN      OC02                                  OC02 043
                          DC      15090                        15.09.70 OC02 044
                          ORG     /0000                        -- *-  - OC02 045
                    *                                                   OC02 046
                    START NOP                                           OC02 047
                          ORG     *-1                                   OC02 048
                    OC02  B       MODIF                           ABS 0 OC02 049
                          NOP                                           OC02 050
                          LDX     READ                                  OC02 051
                    *                                                   OC02 052
                    XR3   DC      *-*                           OC02+ 3 OC02 053
                          ORG     *-1                                   OC02 054
                    RS    NOP                                           OC02 055
                    *                                                   OC02 056
                    CSTO  DC      *-*        SPEICHER           OC02+ 4 OC02 057
                    *                                                   OC02 058
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC02+ 5 OC02 059
                          ORG     *-1                                   OC02 060
                    H4000 DC      /4000                                 OC02 061
                          DC      /00CC      (BOSC I)                   OC02 062
                    D0005 DC      BOSC                                  OC02 063
                    *                                                   OC02 064
                    LEV0  DC      INTR0      ADR LEV 0          OC02+ 8 OC02 065
                    *                                                   OC02 066
                    PCHST DC      /1401      IOCC PUNCH START         O OC02 067
                    ADRR  DC      AREA       IOCC READ ADR            E OC02 068
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC02 069
                    *                                                   OC02 070
                    LEV4  DC      INTR4      ADR LEV 4          OC02+12 OC02 071
                    *                                                   OC02 072
                    READ  XIO     RDST-1     EINSPRUNG READ             OC02 073
                          B       *-1                                   OC02 074
                    *                                                   OC02 075
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH            OC02 076
                          B       *-1                                   OC02 077
                    *                                                   OC02 078
                    *************************************************** OC02 079
                          EJCT                                          OC02 080
                    *                                                   OC02 081
                    *     INTERRUPT-ROUTINEN                            OC02 082
                    *                                                   OC02 083
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC02 084
                          ORG     *-1                           OC02+17 OC02 085
                    H3010 DC      /3010                                 OC02 086
                          NOP                                           OC02 087
                          XIO     D1442-1                               OC02 088
                          XIO     D2501-1                               OC02 089
                          BSI     BOSC                                  OC02 090
                          NOP                                           OC02 091
                          NOP                                           OC02 092
                          NOP                                           OC02 093
                          SRA     16                                    OC02 094
                          STO     XR3                                   OC02 095
                          NOP                                           OC02 096
                          LDX     PUNCH                                 OC02 097
                    *                                                   OC02 098
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC02 099
                          ORG     *-1                                   OC02 100
                    H0001 DC      /0001                                 OC02 101
                          LD    3 AREA-OC02+1                           OC02 102
                          STO     CSTO                                  OC02 103
                          XIO     SENS0-1                               OC02 104
                          XIO     WRITE-1                               OC02 105
                          NOP                                           OC02 106
                          NOP                                           OC02 107
                          NOP                                           OC02 108
                    MDX3  MDX   3 1                                     OC02 109
                          BSI     BOSC                                  OC02 110
                    END   B       *-1                                   OC02 111
                    *                                                   OC02 112
                    *************************************************** OC02 113
                    *                                                   OC02 114
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC02 115
                    *                                                   OC02 116
                          DC      *-*                                   OC02 117
                          DC      *-*                                   OC02 118
                          DC      *-*                                   OC02 119
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC02 120
                          DC      *-*                                   OC02 121
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC02 122
                          DC      *-*                                   OC02 123
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC02 124
                    ADRC  DC      CSTO       IOCC WRITE ADR           E OC02 125
                    WRITE DC      /1100      IOCC WRITE               O OC02 126
                    *                                                   OC02 127
                    AREA  DC      80                                    OC02 128
                          BSS     81                                    OC02 129
                          ORG     END+1                                 OC02 130
                    *                                                   OC02 131
                    *************************************************** OC02 132
                          EJCT                                          OC02 133
                    *                                                   OC02 134
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC02 135
                    *                                                   OC02 136
                    MODIF LD      RS                                    OC02 137
                          STO     OC02       FUER NEUBEGINN             OC02 138
                          LD      BOSC+1                                OC02 139
                          SLA     4          /0CC0                      OC02 140
                          OR      H4000      /4CC0                      OC02 141
                          STO     BOSC+1                                OC02 142
                          LD      H3010                                 OC02 143
                          SRA     4          /0301                      OC02 144
                          STO     H3010                                 OC02 145
                          OR      INTR0+1    /C333                      OC02 146
                          STO     INTR0+1                               OC02 147
                          LD      RDST                                  OC02 148
                          SLA     9          /4E00                      OC02 149
                          STO     RDST                                  OC02 150
                          OR      H3010      /4F01                      OC02 151
                          STO     D2501                                 OC02 152
                          LD      D0005                                 OC02 153
                          SLA     4          /0050                      OC02 154
                          STO     AREA                                  OC02 155
                          LD      LEV4                                  OC02 156
                          SLA     8          /1100                      OC02 157
                          STO     WRITE                                 OC02 158
                          NOP                                           OC02 159
                          LD      H4000                                 OC02 160
                          SRA     12         /0004                      OC02 161
                          STO     ADRC                                  OC02 162
                          SLA     1          /0008                      OC02 163
                          STO     AREA+81                               OC02 164
                          SLA     7          /0400                      OC02 165
                          OR      PCHST      /1401                      OC02 166
                          STO     PCHST                                 OC02 167
                          NOP                                           OC02 168
                          OR      H3010      /1701                      OC02 169
                          STO     SENS0                                 OC02 170
                          A       H0001      /1702                      OC02 171
                          STO     D1442                                 OC02 172
                          LD      MDX3                                  OC02 173
                          OR      H3010      /7301                      OC02 174
                          STO     MDX3                                  OC02 175
                          LDX     START                                 OC02 176
                    *                                                   OC02 177
                    *************************************************** OC02 178
                    *************************************************** OC02 179
                    *                                                   OC02 180
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC02 181
                    *                                                   OC02 182
                          END     OC02                         15.09.70 OC02 183
