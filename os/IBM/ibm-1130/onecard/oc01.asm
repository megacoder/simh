// ASM
*XREF
                          ABS
                          HDNG    OC01       2501/1442 REPRO ONE CARD   OC01 000
 O   C   0   11     *                                                   OC01 001
O O C C 0 0 1 1     *************************************************** OC01 002
O O C   000   1     *************************************************** OC01 003
O O C C 0 0   1     *                                                   OC01 004
 O   C   0    1     *     REPRODUZIERT EIN UNMITTELBAR DER PROGRAMMKAR- OC01 005
                    *     TE AUF DEM 2501 NACHFOLGENDES KARTENDECK AUF  OC01 006
                    *     LEERKARTEN, WELCHE STARTBEREIT IN DER 1442    OC01 007
                    *     EINGELEGT SEIN MUESSEN                        OC01 008
                    *                                                   OC01 009
                    *************************************************** OC01 010
                    *                                                   OC01 011
                    *     SAP 2D  1131/1442/2501                  OEW/0 OC01 012
                    *                                                   OC01 013
                    *************************************************** OC01 014
                    *                                                   OC01 015
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC01 016
                    *               MIT PROGRAM LOAD TASTE              OC01 017
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC01 018
                    *               IMMEDIATE STOP, RESET UND PROGRAM   OC01 019
                    *               START                               OC01 020
                    *                                                   OC01 021
                    *     INPUT   2501       ZU REPRODUZIERENDES KAR-   OC01 022
                    *                        TENDECK UNMITTELBAR AUF    OC01 023
                    *                        PROGRAMMKARTE FOLGEND, SO- OC01 024
                    *                        WIE EINE LEERKARTE         OC01 025
                    *                                                   OC01 026
                    *             1442       LEERKARTEN (1442 READY)    OC01 027
                    *                                                   OC01 028
                    *     OUTPUT  1442       REPRODUZIERTES DECK        OC01 029
                    *                                                   OC01 030
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC01 031
                    *                        GINNEN                     OC01 032
                    *                                                   OC01 033
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC01 034
                    *             DUERFEN NICHT BENUETZT WERDEN         OC01 035
                    *                                                   OC01 036
                    *************************************************** OC01 037
                    *************************************************** OC01 038
                          EJCT                                          OC01 039
                    *                                                   OC01 040
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC01 041
                    *                                                   OC01 042
                          DN      OC01                                  OC01 043
                          DC      15090                        15.09.70 OC01 044
                          ORG     /0000                        -- *-  - OC01 045
                    *                                                   OC01 046
                    START SRA     16                                    OC01 047
                          ORG     *-1                                   OC01 048
                    OC01  B       MODIF                           ABS 0 OC01 049
                          STO     XR3                                   OC01 050
                          LDX     READ                                  OC01 051
                    *                                                   OC01 052
                    XR3   DC      *-*                           OC01+ 3 OC01 053
                          ORG     *-1                                   OC01 054
                    RS    SRA     16                                    OC01 055
                    *                                                   OC01 056
                    CSTO  DC      *-*        SPEICHER           OC01+ 4 OC01 057
                    *                                                   OC01 058
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC01+ 5 OC01 059
                          ORG     *-1                                   OC01 060
                    H4000 DC      /4000                                 OC01 061
                          DC      /00CC      (BOSC I)                   OC01 062
                    D0005 DC      BOSC                                  OC01 063
                    *                                                   OC01 064
                    LEV0  DC      INTR0      ADR LEV 0          OC01+ 8 OC01 065
                    *                                                   OC01 066
                    PCHST DC      /1401      IOCC PUNCH START         O OC01 067
                    ADRR  DC      AREA       IOCC READ ADR            E OC01 068
                    RDST  DC      /0027      IOCC READ (/4E00)        O OC01 069
                    *                                                   OC01 070
                    LEV4  DC      INTR4      ADR LEV 4          OC01+12 OC01 071
                    *                                                   OC01 072
                    READ  XIO     RDST-1     EINSPRUNG READ             OC01 073
                          B       *-1                                   OC01 074
                    *                                                   OC01 075
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH            OC01 076
                          B       *-1                                   OC01 077
                    *                                                   OC01 078
                    *************************************************** OC01 079
                          EJCT                                          OC01 080
                    *                                                   OC01 081
                    *     INTERRUPT-ROUTINEN                            OC01 082
                    *                                                   OC01 083
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC01 084
                          ORG     *-1                           OC01+17 OC01 085
                    H3010 DC      /3010                                 OC01 086
                          NOP                                           OC01 087
                          XIO     D1442-1                               OC01 088
                          XIO     D2501-1                               OC01 089
                          BSI     BOSC                                  OC01 090
                          LD      XR3                                   OC01 091
                          BSC     +-                                    OC01 092
                          LDX     PUNCH                                 OC01 093
                          NOP                                           OC01 094
                          NOP                                           OC01 095
                          NOP                                           OC01 096
                          LDX     START                                 OC01 097
                    *                                                   OC01 098
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC01 099
                          ORG     *-1                                   OC01 100
                    H0001 DC      /0001                                 OC01 101
                          LD    3 AREA-OC01+1                           OC01 102
                          STO     CSTO                                  OC01 103
                          XIO     SENS0-1                               OC01 104
                          XIO     WRITE-1                               OC01 105
                          NOP                                           OC01 106
                          NOP                                           OC01 107
                          NOP                                           OC01 108
                    MDX3  MDX   3 1                                     OC01 109
                          BSI     BOSC                                  OC01 110
                    END   B       *-1                                   OC01 111
                    *                                                   OC01 112
                    *************************************************** OC01 113
                    *                                                   OC01 114
                    *     UEBERLAGERUNGEN UND KARTENGEBIET              OC01 115
                    *                                                   OC01 116
                          DC      *-*                                   OC01 117
                          DC      *-*                                   OC01 118
                          DC      *-*                                   OC01 119
                    D2501 DC      /4F01      IOCC RESET LEV 4 2501    O OC01 120
                          DC      *-*                                   OC01 121
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC01 122
                          DC      *-*                                   OC01 123
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC01 124
                    ADRC  DC      CSTO       IOCC WRITE ADR           E OC01 125
                    WRITE DC      /1100      IOCC WRITE               O OC01 126
                    *                                                   OC01 127
                    AREA  DC      80                                    OC01 128
                          BSS     81                                    OC01 129
                          ORG     END+1                                 OC01 130
                    *                                                   OC01 131
                    *************************************************** OC01 132
                          EJCT                                          OC01 133
                    *                                                   OC01 134
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC01 135
                    *                                                   OC01 136
                    MODIF LD      RS                                    OC01 137
                          STO     OC01       FUER NEUBEGINN             OC01 138
                          LD      BOSC+1                                OC01 139
                          SLA     4          /0CC0                      OC01 140
                          OR      H4000      /4CC0                      OC01 141
                          STO     BOSC+1                                OC01 142
                          LD      H3010                                 OC01 143
                          SRA     4          /0301                      OC01 144
                          STO     H3010                                 OC01 145
                          OR      INTR0+1    /C333                      OC01 146
                          STO     INTR0+1                               OC01 147
                          LD      RDST                                  OC01 148
                          SLA     9          /4E00                      OC01 149
                          STO     RDST                                  OC01 150
                          OR      H3010      /4F01                      OC01 151
                          STO     D2501                                 OC01 152
                          LD      D0005                                 OC01 153
                          SLA     4          /0050                      OC01 154
                          STO     AREA                                  OC01 155
                          LD      LEV4                                  OC01 156
                          SLA     8          /1100                      OC01 157
                          STO     WRITE                                 OC01 158
                          NOP                                           OC01 159
                          LD      H4000                                 OC01 160
                          SRA     12         /0004                      OC01 161
                          STO     ADRC                                  OC01 162
                          SLA     1          /0008                      OC01 163
                          STO     AREA+81                               OC01 164
                          SLA     7          /0400                      OC01 165
                          OR      PCHST      /1401                      OC01 166
                          STO     PCHST                                 OC01 167
                          NOP                                           OC01 168
                          OR      H3010      /1701                      OC01 169
                          STO     SENS0                                 OC01 170
                          A       H0001      /1702                      OC01 171
                          STO     D1442                                 OC01 172
                          LD      MDX3                                  OC01 173
                          OR      H3010      /7301                      OC01 174
                          STO     MDX3                                  OC01 175
                          LDX     START                                 OC01 176
                    *                                                   OC01 177
                    *************************************************** OC01 178
                    *************************************************** OC01 179
                    *                                                   OC01 180
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC01 181
                    *                                                   OC01 182
                          END     OC01                         15.09.70 OC01 183
