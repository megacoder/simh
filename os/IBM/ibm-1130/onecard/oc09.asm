// ASM
*XREF
                          ABS
                          HDNG    OC09       1442 NONBLANKSORT ONE CARD OC09 000
 O   C   0   9      *                                                   OC09 001
O O C C 0 0 9 9     *************************************************** OC09 002
O O C   000  99     *************************************************** OC09 003
O O C C 0 0  9      *                                                   OC09 004
 O   C   0  9       *     SORTIERT ALLE GELOCHTEN KARTEN (OHNE LETZTE   OC09 005
                    *     ZWEI KARTEN) EINES KARTENDECKS IM 1442 VON    OC09 006
                    *     DEN UNGELOCHTEN KARTEN                        OC09 007
                    *                                                   OC09 008
                    *************************************************** OC09 009
                    *                                                   OC09 010
                    *     SAP 2D  1131/1442                       OEW/0 OC09 011
                    *                                                   OC09 012
                    *************************************************** OC09 013
                    *                                                   OC09 014
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC09 015
                    *               MIT PROGRAM LOAD TASTE              OC09 016
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC09 017
                    *               IMMEDIATE STOP, RESET UND PROGRAMM  OC09 018
                    *               START                               OC09 019
                    *                                                   OC09 020
                    *     INPUT   1442       KARTENDECK MIT GELOCHTEN   OC09 021
                    *                        UND UNGELOCHTEN KARTEN     OC09 022
                    *                                                   OC09 023
                    *     OUTPUT  1442-1     UNGELOCHTE KARTEN          OC09 024
                    *                                                   OC09 025
                    *             1442-2     GELOCHTE KARTEN            OC09 026
                    *                                                   OC09 027
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC09 028
                    *                        GINNEN                     OC09 029
                    *                                                   OC09 030
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC09 031
                    *             DUERFEN NICHT BENUETZT WERDEN         OC09 032
                    *                                                   OC09 033
                    *************************************************** OC09 034
                    *************************************************** OC09 035
                          EJCT                                          OC09 036
                    *                                                   OC09 037
                    *     PROGRAMMKOPF UND -ABLAUF, INTERRUPT-ADRESSEN  OC09 038
                    *                                                   OC09 039
                          DN      OC09                                  OC09 040
                          DC      25073                        25.07.73 OC09 041
                          ORG     /0000                        -- *-  - OC09 042
                    *                                                   OC09 043
                    START SRA     16                                    OC09 044
                          ORG     *-1                                   OC09 045
                    OC09  B       MODIF                           ABS 0 OC09 046
                          STO     SELEC                                 OC09 047
                          XIO     PCHST-1    PUNCH READ                 OC09 048
                          B       *-1                                   OC09 049
                    *                                                   OC09 050
                          ORG     *-1                                   OC09 051
                    RS    SRA     16                                    OC09 052
                    *                                                   OC09 053
                    CSTO  DC      *-*        SPEICHER           OC09+ 4 OC09 054
                          ORG     *-1                                   OC09 055
                    H0029 DC      /0029                                 OC09 056
                    *                                                   OC09 057
                    BOSC  DC      *-*        INTERRUPT LOESCHEN OC09+ 5 OC09 058
                          ORG     *-1                                   OC09 059
                    H4000 DC      /4000                                 OC09 060
                          DC      /00CC      (BOSC I)                   OC09 061
                          DC      BOSC                                  OC09 062
                    *                                                   OC09 063
                    LEV0  DC      INTR0      ADR LEV 0          OC09+ 8 OC09 064
                    *                                                   OC09 065
                    PCHST DC      /1404      IOCC PREAD START         O OC09 066
                          DC      *-*        PATCH AREA                 OC09 067
                          DC      *-*                                   OC09 068
                    *                                                   OC09 069
                    LEV4  DC      INTR4      ADR LEV 4          OC09+12 OC09 070
                    *                                                   OC09 071
                          DC      *-*        PATCH AREA                 OC09 072
                          DC      *-*                                   OC09 073
                          DC      *-*                                   OC09 074
                          DC      *-*                                   OC09 075
                          DC      *-*                                   OC09 076
                    *                                                   OC09 077
                    *************************************************** OC09 078
                          EJCT                                          OC09 079
                    *                                                   OC09 080
                    *     INTERRUPT-ROUTINEN                            OC09 081
                    *                                                   OC09 082
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC09 083
                          ORG     *-1                           OC09+18 OC09 084
                    H3010 DC      /3010                                 OC09 085
                          XIO     D1442-1                               OC09 086
                          NOP                                           OC09 087
                          BSI     BOSC                                  OC09 088
                          LD      SELEC                                 OC09 089
                          BSC     Z                                     OC09 090
                          XIO     STSEL-1                               OC09 091
                          NOP                                           OC09 092
                          NOP                                           OC09 093
                          NOP                                           OC09 094
                          LDX     START                                 OC09 095
                    *                                                   OC09 096
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC09 097
                          ORG     *-1                                   OC09 098
                    H0001 DC      /0001                                 OC09 099
                          XIO     SENS0-1                               OC09 100
                          XIO     WREAD-1                               OC09 101
                          NOP                                           OC09 102
                          NOP                                           OC09 103
                          LD      CSTO                                  OC09 104
                          BSC     Z                                     OC09 105
                          STO     SELEC                                 OC09 106
                          NOP                                           OC09 107
                          BSI     BOSC                                  OC09 108
                    END   B       *-1                                   OC09 109
                    *                                                   OC09 110
                    *************************************************** OC09 111
                    *                                                   OC09 112
                    *     UEBERLAGERUNGEN                               OC09 113
                    *                                                   OC09 114
                    SELEC DC      *-*        SELECT SWITCH              OC09 115
                    STSEL DC      /1480      IOCC STACKER             O OC09 116
                          DC      *-*                                   OC09 117
                          DC      *-*                                   OC09 118
                          DC      *-*                                   OC09 119
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC09 120
                          DC      *-*                                   OC09 121
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC09 122
                    ADRC  DC      CSTO       IOCC WREAD ADR           E OC09 123
                    WREAD DC      /1200      IOCC WREAD               O OC09 124
                          ORG     END+1                                 OC09 125
                    *                                                   OC09 126
                    *************************************************** OC09 127
                          EJCT                                          OC09 128
                    *                                                   OC09 129
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC09 130
                    *                                                   OC09 131
                    MODIF LD      RS                                    OC09 132
                          STO     OC09       FUER NEUBEGINN             OC09 133
                          LD      BOSC+1                                OC09 134
                          SLA     4          /0CC0                      OC09 135
                          OR      H4000      /4CC0                      OC09 136
                          STO     BOSC+1                                OC09 137
                          LD      H3010                                 OC09 138
                          SRA     4          /0301                      OC09 139
                          STO     H3010                                 OC09 140
                          LD      END                                   OC09 141
                          STO     OC09+3                                OC09 142
                          B       FORT                                  OC09 143
                          DC      *-*        PATCH AREA                 OC09 144
                          DC      *-*                                   OC09 145
                          DC      *-*                                   OC09 146
                          DC      *-*                                   OC09 147
                          DC      *-*                                   OC09 148
                          DC      *-*                                   OC09 149
                          DC      *-*                                   OC09 150
                    FORT  LD      LEV4                                  OC09 151
                          SLA     8          /1200                      OC09 152
                          STO     WREAD                                 OC09 153
                          LD      H0029                                 OC09 154
                          SLA     7          /1480                      OC09 155
                          STO     STSEL                                 OC09 156
                          LD      H4000                                 OC09 157
                          SRA     12         /0004                      OC09 158
                          STO     ADRC                                  OC09 159
                          SLA     8          /0400                      OC09 160
                          OR      PCHST      /1404                      OC09 161
                          STO     PCHST                                 OC09 162
                          EOR     ADRC       /1400                      OC09 163
                          OR      H3010      /1701                      OC09 164
                          STO     SENS0                                 OC09 165
                          A       H0001      /1702                      OC09 166
                          STO     D1442                                 OC09 167
                          NOP                                           OC09 168
                          NOP                                           OC09 169
                          NOP                                           OC09 170
                          LDX     START                                 OC09 171
                    *                                                   OC09 172
                    *************************************************** OC09 173
                    *************************************************** OC09 174
                    *                                                   OC09 175
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC09 176
                    *                                                   OC09 177
                          END     OC09                         25.07.73 OC09 178
