// ASM
*XREF
                          ABS
                          HDNG    OC05       2501/1442 COMPARE ONE CARD OC05 000
 O   C   0  555     *                                                   OC05 001
O O C C 0 0 5       *************************************************** OC05 002
O O C   000 55      *************************************************** OC05 003
O O C C 0 0   5     *                                                   OC05 004
 O   C   0  55      *     VERGLEICHT EIN UNMITTELBAR DER PROGRAMMKARTE  OC05 005
                    *     AUF DEM 2501 NACHFOLGENDES KARTENDECK MIT     OC05 006
                    *     EINEM ZWEITEN DECK, WELCHES STARTBEREIT IN    OC05 007
                    *     DER 1442 EINGELEGT SEIN MUSS                  OC05 008
                    *                                                   OC05 009
                    *************************************************** OC05 010
                    *                                                   OC05 011
                    *     SAP 2D  1131/1442/2501                  OEW/0 OC05 012
                    *                                                   OC05 013
                    *************************************************** OC05 014
                    *                                                   OC05 015
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC05 016
                    *               MIT PROGRAM LOAD TASTE              OC05 017
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC05 018
                    *               IMMEDIATE STOP, RESET UND PROGRAM   OC05 019
                    *               START                               OC05 020
                    *                                                   OC05 021
                    *     INPUT   2501       KARTENDECK 1 UNMITTELBAR   OC05 022
                    *                        AUF PROGRAMMKARTE FOLGEND, OC05 023
                    *                        SOWIE EINE LEERKARTE       OC05 024
                    *                                                   OC05 025
                    *             1442       KARTENDECK 2 (1442 READY), OC05 026
                    *                        SOWIE EINE LEERKARTE       OC05 027
                    *                                                   OC05 028
                    *     OP/REQ  SBR /300C  KARTENFEHLER, PROG/START   OC05 029
                    *                        DRUECKEN                   OC05 030
                    *                                                   OC05 031
                    *             SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC05 032
                    *                        GINNEN                     OC05 033
                    *                                                   OC05 034
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC05 035
                    *             DUERFEN NICHT BENUETZT WERDEN         OC05 036
                    *                                                   OC05 037
                    *************************************************** OC05 038
                    *************************************************** OC05 039
                          EJCT                                          OC05 040
                    *                                                   OC05 041
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC05 042
                    *                                                   OC05 043
                          DN      OC05                                  OC05 044
                          DC      15090                        15.09.70 OC05 045
                          ORG     /0000                        -- *-  - OC05 046
                    *                                                   OC05 047
                    START SRA     16                                    OC05 048
                          ORG     *-1                                   OC05 049
                    OC05  B       MODIF                           ABS 0 OC05 050
                          STO     XR3                                   OC05 051
                          LDX     READ                                  OC05 052
                    *                                                   OC05 053
                    XR3   DC      *-*                           OC05+ 3 OC05 054
                          ORG     *-1                                   OC05 055
                    RS    SRA     16                                    OC05 056
                    *                                                   OC05 057
                    CSTO  DC      *-*        SPEICHER           OC05+ 4 OC05 058
                    *                                                   OC05 059
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC05+ 5 OC05 060
                          ORG     *-1                                   OC05 061
                    H4000 DC      /4000                                 OC05 062
                          DC      /00CC      (BOSC I)                   OC05 063
                    D0005 DC      BOSC                                  OC05 064
                    *                                                   OC05 065
                    LEV0  DC      INTR0      ADR LEV 0          OC05+ 8 OC05 066
                    *                                                   OC05 067
                    PCHST DC      /1404      IOCC PREAD START         O OC05 068
                    ADRR  DC      AREA       IOCC READ ADR            E OC05 069
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC05 070
                    *                                                   OC05 071
                    LEV4  DC      INTR4      ADR LEV 4          OC05+12 OC05 072
                    *                                                   OC05 073
                    READ  STO     STOP       EINSPRUNG READ             OC05 074
                          XIO     RDST-1                                OC05 075
                          B       *-1                                   OC05 076
                    *                                                   OC05 077
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH READ       OC05 078
                          B       *-1                                   OC05 079
                    *                                                   OC05 080
                    *************************************************** OC05 081
                          EJCT                                          OC05 082
                    *                                                   OC05 083
                    *     INTERRUPT-ROUTINEN                            OC05 084
                    *                                                   OC05 085
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC05 086
                          ORG     *-1                           OC05+18 OC05 087
                    H3010 DC      /3010                                 OC05 088
                          XIO     D1442-1                               OC05 089
                          XIO     D2501-1                               OC05 090
                          BSI     BOSC                                  OC05 091
                          LD      XR3                                   OC05 092
                          BSC     +-                                    OC05 093
                          LDX     PUNCH                                 OC05 094
                          LD      STOP                                  OC05 095
                          BSC     Z                                     OC05 096
                          WAIT    /0C                                   OC05 097
                          LDX     START                                 OC05 098
                    *                                                   OC05 099
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC05 100
                          ORG     *-1                                   OC05 101
                    H0001 DC      /0001                                 OC05 102
                          XIO     SENS0-1                               OC05 103
                          XIO     WREAD-1                               OC05 104
                          LD    3 AREA-OC05+1                           OC05 105
                          NOP                                           OC05 106
                          EOR     CSTO                                  OC05 107
                          BSC     Z                                     OC05 108
                          STO     STOP                                  OC05 109
                    MDX3  MDX   3 1                                     OC05 110
                          BSI     BOSC                                  OC05 111
                    END   B       *-1                                   OC05 112
                    *                                                   OC05 113
                    *************************************************** OC05 114
                    *                                                   OC05 115
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC05 116
                    *                                                   OC05 117
                    STOP  DC      *-*        STOP SWITCH                OC05 118
                          DC      *-*                                   OC05 119
                          DC      *-*                                   OC05 120
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC05 121
                          DC      *-*                                   OC05 122
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC05 123
                          DC      *-*                                   OC05 124
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC05 125
                    ADRC  DC      CSTO       IOCC WREAD ADR           E OC05 126
                    WREAD DC      /1200      IOCC WREAD               O OC05 127
                    *                                                   OC05 128
                    AREA  DC      80                                  E OC05 129
                          BSS     80                                    OC05 130
                          ORG     END+1                                 OC05 131
                    *                                                   OC05 132
                    *************************************************** OC05 133
                          EJCT                                          OC05 134
                    *                                                   OC05 135
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC05 136
                    *                                                   OC05 137
                    MODIF LD      RS                                    OC05 138
                          STO     OC05       FUER NEUBEGINN             OC05 139
                          LD      BOSC+1                                OC05 140
                          SLA     4          /0CC0                      OC05 141
                          OR      H4000      /4CC0                      OC05 142
                          STO     BOSC+1                                OC05 143
                          LD      H3010                                 OC05 144
                          SRA     4          /0301                      OC05 145
                          STO     H3010                                 OC05 146
                          OR      INTR0+3    /C333                      OC05 147
                          STO     INTR0+3                               OC05 148
                          LD      RDST                                  OC05 149
                          SLA     9          /4E00                      OC05 150
                          STO     RDST                                  OC05 151
                          OR      H3010      /4F01                      OC05 152
                          STO     D2501                                 OC05 153
                          LD      D0005                                 OC05 154
                          SLA     4          /0050                      OC05 155
                          STO     AREA                                  OC05 156
                          LD      LEV4                                  OC05 157
                          SLA     8          /1200                      OC05 158
                          STO     WREAD                                 OC05 159
                          NOP                                           OC05 160
                          NOP                                           OC05 161
                          NOP                                           OC05 162
                          LD      H4000                                 OC05 163
                          SRA     12         /0004                      OC05 164
                          STO     ADRC                                  OC05 165
                          SLA     8          /0400                      OC05 166
                          OR      PCHST      /1404                      OC05 167
                          STO     PCHST                                 OC05 168
                          EOR     ADRC       /1400                      OC05 169
                          OR      H3010      /1701                      OC05 170
                          STO     SENS0                                 OC05 171
                          A       H0001      /1702                      OC05 172
                          STO     D1442                                 OC05 173
                          LD      MDX3                                  OC05 174
                          OR      H3010      /7301                      OC05 175
                          STO     MDX3                                  OC05 176
                          LDX     START                                 OC05 177
                    *                                                   OC05 178
                    *************************************************** OC05 179
                    *************************************************** OC05 180
                    *                                                   OC05 181
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC05 182
                    *                                                   OC05 183
                          END     OC05                         15.09.70 OC05 184
