// ASM
*XREF
                          ABS
                          HDNG    OC08       2501/1442 MTCHSRT ONE CARD OC08 000
 O   C   0   8      *                                                   OC08 001
O O C C 0 0 8 8     *************************************************** OC08 002
O O C   000  8      *************************************************** OC08 003
O O C C 0 0 8 8     *                                                   OC08 004
 O   C   0   8      *     SORTIERT ALLE JENE KARTEN (OHNE LETZTE ZWEI   OC08 005
                    *     KARTEN) EINES STARTBEREIT IN DER 1442 EINGE-  OC08 006
                    *     LEGTEN KARTENDECKS, WELCHE DEN SELBEN BEGRIFF OC08 007
                    *     AUFWEISEN, WIE EINE UNMITTELBAR DER PROGRAMM- OC08 008
                    *     KARTE AUF DEM 2501 NACHFOLGENDE KARTE, VON    OC08 009
                    *     DEN UEBRIGEN                                  OC08 010
                    *                                                   OC08 011
                    *************************************************** OC08 012
                    *                                                   OC08 013
                    *     SAP 2D  1131/1442/2501                  OEW/0 OC08 014
                    *                                                   OC08 015
                    *************************************************** OC08 016
                    *                                                   OC08 017
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC08 018
                    *               MIT PROGRAM LOAD TASTE              OC08 019
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC08 020
                    *               IMMEDIATE STOP, RESET UND PROGRAM   OC08 021
                    *               START                               OC08 022
                    *                                                   OC08 023
                    *     INPUT   2501       KARTE MIT SORTIERBEGRIFF   OC08 024
                    *                        UNMITTELBAR AUF PROGRAMM-  OC08 025
                    *                        KARTE FOLGEND, SOWIE EINE  OC08 026
                    *                        LEERKARTE                  OC08 027
                    *                                                   OC08 028
                    *             1442       KARTENDECK (1442 READY)    OC08 029
                    *                                                   OC08 030
                    *     OUTPUT  1442-1     KARTEN, WELCHE DEN SOR-    OC08 031
                    *                        TIERBEGRIFF NICHT ENTHAL-  OC08 032
                    *                        TEN                        OC08 033
                    *                                                   OC08 034
                    *             1442-2     KARTEN, WELCHE DEN SOR-    OC08 035
                    *                        TIERBEGRIFF ENTHALTEN, RSP OC08 036
                    *                        ALLE KARTEN, WENN KEIN     OC08 037
                    *                        SORTIERBEGRIFF SPEZIFI-    OC08 038
                    *                        ZIERT WURDE (LEERKARTE DI- OC08 039
                    *                        REKT NACH PROGRAMMKARTE)   OC08 040
                    *                                                   OC08 041
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC08 042
                    *                        GINNEN                     OC08 043
                    *                                                   OC08 044
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC08 045
                    *             DUERFEN NICHT BENUETZT WERDEN         OC08 046
                    *                                                   OC08 047
                    *************************************************** OC08 048
                    *************************************************** OC08 049
                          EJCT                                          OC08 050
                    *                                                   OC08 051
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC08 052
                    *                                                   OC08 053
                          DN      OC08                                  OC08 054
                          DC      25073                        25.07.73 OC08 055
                          ORG     /0000                        -- *-  - OC08 056
                    *                                                   OC08 057
                    START NOP                                           OC08 058
                          ORG     *-1                                   OC08 059
                    OC08  B       MODIF                           ABS 0 OC08 060
                          LD      XR3        (NOT ZERO)                 OC08 061
                          LDX     READ                                  OC08 062
                    *                                                   OC08 063
                    XR3   DC      *-*                           OC08+ 3 OC08 064
                          ORG     *-1                                   OC08 065
                    RS    NOP                                           OC08 066
                    *                                                   OC08 067
                    CSTO  DC      *-*        SPEICHER           OC08+ 4 OC08 068
                          ORG     *-1                                   OC08 069
                    H0029 DC      /0029                                 OC08 070
                    *                                                   OC08 071
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC08+ 5 OC08 072
                          ORG     *-1                                   OC08 073
                    H4000 DC      /4000                                 OC08 074
                          DC      /00CC      (BOSC I)                   OC08 075
                    D0005 DC      BOSC                                  OC08 076
                    *                                                   OC08 077
                    LEV0  DC      INTR0      ADR LEV 0          OC08+ 8 OC08 078
                    *                                                   OC08 079
                    PCHST DC      /1404      IOCC PREAD START         O OC08 080
                    ADRR  DC      AREA       IOCC READ ADR            E OC08 081
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC08 082
                    *                                                   OC08 083
                    LEV4  DC      INTR4      ADR LEV 4          OC08+12 OC08 084
                    *                                                   OC08 085
                    READ  STO     SELEC      EINSPRUNG READ             OC08 086
                          XIO     RDST-1                                OC08 087
                          B       *-1                                   OC08 088
                    *                                                   OC08 089
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH READ       OC08 090
                          B       *-1                                   OC08 091
                    *                                                   OC08 092
                    *************************************************** OC08 093
                          EJCT                                          OC08 094
                    *                                                   OC08 095
                    *     INTERRUPT-ROUTINEN                            OC08 096
                    *                                                   OC08 097
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC08 098
                          ORG     *-1                           OC08+18 OC08 099
                    H3010 DC      /3010                                 OC08 100
                          XIO     D1442-1                               OC08 101
                          XIO     D2501-1                               OC08 102
                          BSI     BOSC                                  OC08 103
                          LD      SELEC                                 OC08 104
                          BSC     +-                                    OC08 105
                          XIO     STSEL-1                               OC08 106
                          SRA     16                                    OC08 107
                          STO     XR3                                   OC08 108
                          STO     SELEC                                 OC08 109
                          LDX     PUNCH                                 OC08 110
                    *                                                   OC08 111
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC08 112
                          ORG     *-1                                   OC08 113
                    H0001 DC      /0001                                 OC08 114
                          XIO     SENS0-1                               OC08 115
                          XIO     WREAD-1                               OC08 116
                          LD    3 AREA-OC08+1                           OC08 117
                          BSC     Z                                     OC08 118
                          EOR     CSTO                                  OC08 119
                          BSC     Z                                     OC08 120
                          STO     SELEC                                 OC08 121
                    MDX3  MDX   3 1                                     OC08 122
                          BSI     BOSC                                  OC08 123
                    END   B       *-1                                   OC08 124
                    *                                                   OC08 125
                    *************************************************** OC08 126
                    *                                                   OC08 127
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC08 128
                    *                                                   OC08 129
                    SELEC DC      *-*        SELECT SWITCH              OC08 130
                    STSEL DC      /1480      IOCC STACKER             O OC08 131
                          DC      *-*                                   OC08 132
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC08 133
                          DC      *-*                                   OC08 134
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC08 135
                          DC      *-*                                   OC08 136
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC08 137
                    ADRC  DC      CSTO       IOCC WREAD ADR           E OC08 138
                    WREAD DC      /1200      IOCC WREAD               O OC08 139
                    *                                                   OC08 140
                    AREA  DC      80                                  E OC08 141
                          BSS     80                                    OC08 142
                          ORG     END+1                                 OC08 143
                    *                                                   OC08 144
                    *************************************************** OC08 145
                          EJCT                                          OC08 146
                    *                                                   OC08 147
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC08 148
                    *                                                   OC08 149
                    MODIF LD      RS                                    OC08 150
                          STO     OC08       FUER NEUBEGINN             OC08 151
                          LD      BOSC+1                                OC08 152
                          SLA     4          /0CC0                      OC08 153
                          OR      H4000      /4CC0                      OC08 154
                          STO     BOSC+1                                OC08 155
                          LD      H3010                                 OC08 156
                          SRA     4          /0301                      OC08 157
                          STO     H3010                                 OC08 158
                          OR      INTR0+3    /C333                      OC08 159
                          STO     INTR0+3                               OC08 160
                          LD      RDST                                  OC08 161
                          SLA     9          /4E00                      OC08 162
                          STO     RDST                                  OC08 163
                          OR      H3010      /4F01                      OC08 164
                          STO     D2501                                 OC08 165
                          LD      D0005                                 OC08 166
                          SLA     4          /0050                      OC08 167
                          STO     AREA                                  OC08 168
                          LD      LEV4                                  OC08 169
                          SLA     8          /1200                      OC08 170
                          STO     WREAD                                 OC08 171
                          LD      H0029                                 OC08 172
                          SLA     7          /1480                      OC08 173
                          STO     STSEL                                 OC08 174
                          LD      H4000                                 OC08 175
                          SRA     12         /0004                      OC08 176
                          STO     ADRC                                  OC08 177
                          SLA     8          /0400                      OC08 178
                          OR      PCHST      /1404                      OC08 179
                          STO     PCHST                                 OC08 180
                          EOR     ADRC       /1400                      OC08 181
                          OR      H3010      /1701                      OC08 182
                          STO     SENS0                                 OC08 183
                          A       H0001      /1702                      OC08 184
                          STO     D1442                                 OC08 185
                          LD      MDX3                                  OC08 186
                          OR      H3010      /7301                      OC08 187
                          STO     MDX3                                  OC08 188
                          LDX     START                                 OC08 189
                    *                                                   OC08 190
                    *************************************************** OC08 191
                    *************************************************** OC08 192
                    *                                                   OC08 193
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC08 194
                    *                                                   OC08 195
                          END     OC08                         25.07.73 OC08 196
