// ASM
*XREF
                          ABS
                          HDNG    OC11       2501 CARD COUNTER ONE CARD OC11 000
 O   C   11  11     *                                                   OC11 001
O O C C 1 1 1 1     *************************************************** OC11 002
O O C     1   1     *************************************************** OC11 003
O O C C   1   1     *                                                   OC11 004
 O   C    1   1     *     ZAEHLT DIE KARTEN EINES UNMITTELBAR DER PRO-  OC11 005
                    *     GRAMMKARTE AUF DEM 2501 NACHFOLGENDEN KARTEN- OC11 006
                    *     DECKS, SOFERN DEREN ANZAHL KLEINER ALS 9999   OC11 007
                    *     IST                                           OC11 008
                    *                                                   OC11 009
                    *************************************************** OC11 010
                    *                                                   OC11 011
                    *     SAP 2D  1131/2501                       OEW/0 OC11 012
                    *                                                   OC11 013
                    *************************************************** OC11 014
                    *                                                   OC11 015
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC11 016
                    *               MIT PROGRAM LOAD TASTE              OC11 017
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC11 018
                    *               IMMEDIATE STOP, RESET UND PROGRAMM  OC11 019
                    *               START                               OC11 020
                    *                                                   OC11 021
                    *     INPUT   2501       ZU ZAEHLENDES KARTENDECK   OC11 022
                    *                        UNMITTELBAR AUF PROGRAMM-  OC11 023
                    *                        KARTE FOLDEND              OC11 024
                    *                                                   OC11 025
                    *     OUTPUT  ACC/EXT    DEZIMALES ZAEHLERGEBNIS IN OC11 026
                    *                        HEXADEZIMALER NOTIERUNG,   OC11 027
                    *                        WOBEI SOWOHL IM ACC WIE    OC11 028
                    *                        AUCH IM EXT ALLE KARTEN    OC11 029
                    *                        (AUSSER DER PROGRAMMKARTE) OC11 030
                    *                        GEZAEHLT SIND, DIE NACH    OC11 031
                    *                        NPRO IM STACKER LIEGEN     OC11 032
                    *                                                   OC11 033
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC11 034
                    *                        GINNEN                     OC11 035
                    *                                                   OC11 036
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC11 037
                    *             DUERFEN NICHT BENUETZT WERDEN         OC11 038
                    *                                                   OC11 039
                    *************************************************** OC11 040
                    *************************************************** OC11 041
                          EJCT                                          OC11 042
                    *                                                   OC11 043
                    *     PROGRAMMKOPF UND -ROUTINEN, INTERRUPT-ADRESSE OC11 044
                    *                                                   OC11 045
                          DN      OC11                                  OC11 046
                          DC      24071                        24.07.71 OC11 047
                          ORG     /0000                        -- *-  - OC11 048
                    *                                                   OC11 049
                    START SRA     16                                    OC11 050
                          ORG     *-1                                   OC11 051
                    OC11  B       MODIF                           ABS 0 OC11 052
                          STO     CNT                                   OC11 053
                          LDX     READ                                  OC11 054
                    *                                                   OC11 055
                    XR3   DC      *-*                           OC11+ 3 OC11 056
                          ORG     *-1                                   OC11 057
                    RS    SRA     16                                    OC11 058
                    *                                                   OC11 059
                    CNT   DC      *-*        ZAEHLER                    OC11 060
                    *                                                   OC11 061
                    BOSC  DC      *-*        INTERRUPT LOESCHEN         OC11 062
                          ORG     *-1                                   OC11 063
                    H4000 DC      /4000                                 OC11 064
                          DC      /00CC      (BOSC I)                   OC11 065
                          DC      BOSC                                  OC11 066
                    *                                                   OC11 067
                    H9000 DC      /9000                                 OC11 068
                    D0001 DC      1                                     OC11 069
                    *                                                   OC11 070
                    ADRR  DC      AREA       IOCC READ ADR            E OC11 071
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC11 072
                    *                                                   OC11 073
                    LEV4  DC      INTR4      ADR LEV 4          OC11+12 OC11 074
                    *                                                   OC11 075
                    DECMO LD      CNT        DEZIMALMODIFIZIERUNG       OC11 076
                          SRA     4                                     OC11 077
                          STO     CNT                                   OC11 078
                    MDX3  MDX   3 4                                     OC11 079
                          LDX     RET                                   OC11 080
                    *                                                   OC11 081
                    *************************************************** OC11 082
                          EJCT                                          OC11 083
                    *                                                   OC11 084
                    *     INTERRUPT-ROUTINE UND PROGRAMM-ABLAUF         OC11 085
                    *                                                   OC11 086
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC11 087
                          ORG     *-1                                   OC11 088
                    H3010 DC      /3010                                 OC11 089
                          NOP                                           OC11 090
                          XIO     D2501-1                               OC11 091
                          BSI     BOSC                                  OC11 092
                    *                                                   OC11 093
                    READ  XIO     RDST-1     EINSPRUNG READ             OC11 094
                          NOP                                           OC11 095
                          NOP                                           OC11 096
                          SRA     16                                    OC11 097
                          STO     XR3                                   OC11 098
                          LD      CNT                                   OC11 099
                    *                                                   OC11 100
                    RET   SLA     12         ZAEHLUNG                   OC11 101
                          EOR     H9000                                 OC11 102
                          BSC     +-                                    OC11 103
                          LDX     DECMO                                 OC11 104
                          LD      CNT                                   OC11 105
                          A       D0001                                 OC11 106
                    SLA3  DC      /0026      (SLA 3)                    OC11 107
                          STO     CNT                                   OC11 108
                          XCH                                           OC11 109
                          LD      CNT                                   OC11 110
                          WAIT               RESULTAT IN ACC UND EXT    OC11 111
                    END   B       *-1                                   OC11 112
                    *                                                   OC11 113
                    *************************************************** OC11 114
                    *                                                   OC11 115
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC11 116
                    *                                                   OC11 117
                          DC      *-*        PATCH AREA                 OC11 118
                          DC      *-*                                   OC11 119
                          DC      *-*                                   OC11 120
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC11 121
                          DC      *-*                                   OC11 122
                          DC      *-*                                   OC11 123
                          DC      *-*                                   OC11 124
                          DC      *-*                                   OC11 125
                          DC      *-*                                   OC11 126
                          DC      *-*                                   OC11 127
                    *                                                   OC11 128
                    AREA  DC      1                                     OC11 129
                          BSS     1                                     OC11 130
                          ORG     END+1                                 OC11 131
                    *                                                   OC11 132
                    *************************************************** OC11 133
                          EJCT                                          OC11 134
                    *                                                   OC11 135
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC11 136
                    *                                                   OC11 137
                    MODIF LD      RS                                    OC11 138
                          STO     OC11       FUER NEUBEGINN             OC11 139
                          LD      BOSC+1                                OC11 140
                          SLA     4          /0CC0                      OC11 141
                          OR      H4000      /4CC0                      OC11 142
                          STO     BOSC+1                                OC11 143
                          LD      H3010                                 OC11 144
                          SRA     4          /0301                      OC11 145
                          STO     H3010                                 OC11 146
                          EOR     D0001      /0300                      OC11 147
                          STO     CNT                                   OC11 148
                          LD      RDST                                  OC11 149
                          SLA     9          /4E00                      OC11 150
                          STO     RDST                                  OC11 151
                          OR      H3010      /4F01                      OC11 152
                          STO     D2501                                 OC11 153
                          LD      D0001                                 OC11 154
                          NOP                                           OC11 155
                          STO     AREA                                  OC11 156
                          NOP                                           OC11 157
                          NOP                                           OC11 158
                          NOP                                           OC11 159
                          LD      CNT        /0300                      OC11 160
                          OR      MDX3       /7304                      OC11 161
                          STO     MDX3                                  OC11 162
                          B       FORT                                  OC11 163
                          DC      *-*        PATCH AREA                 OC11 164
                          DC      *-*                                   OC11 165
                          DC      *-*                                   OC11 166
                          DC      *-*                                   OC11 167
                          DC      *-*                                   OC11 168
                          DC      *-*                                   OC11 169
                          DC      *-*                                   OC11 170
                          DC      *-*                                   OC11 171
                          DC      *-*                                   OC11 172
                          DC      *-*                                   OC11 173
                    FORT  LD      SLA3       /0026                      OC11 174
                          SLA     7          /1300                      OC11 175
                          STO     SLA3                                  OC11 176
                          LDX     START                                 OC11 177
                    *                                                   OC11 178
                    *************************************************** OC11 179
                    *************************************************** OC11 180
                    *                                                   OC11 181
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC11 182
                    *                                                   OC11 183
                          END     OC11                         24.07.71 OC11 184
