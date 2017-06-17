// ASM
*XREF
                          ABS
                          HDNG    OC15       1442 CLMN COUNTER ONE CARD OC15 000
 O   C   11 555     *                                                   OC15 001
O O C C 1 1 5       *************************************************** OC15 002
O O C     1 55      *************************************************** OC15 003
O O C C   1   5     *                                                   OC15 004
 O   C    1 55      *     ZAEHLT DIE GELOCHTEN KOLONNEN EINES KARTEN-   OC15 005
                    *     DECKS IM 1442 (OHNE LETZTE KARTE), SOFERN     OC15 006
                    *     DEREN ANZAHL KLEINER ALS 79 999 999 IST       OC15 007
                    *                                                   OC15 008
                    *************************************************** OC15 009
                    *                                                   OC15 010
                    *     SAP 2D  1131/1442                       OEW/0 OC15 011
                    *                                                   OC15 012
                    *************************************************** OC15 013
                    *                                                   OC15 014
                    *     AUFRUF  - DURCH EINLESEN DER PROGRAMMKARTE    OC15 015
                    *               MIT PROGRAM LOAD TASTE              OC15 016
                    *             - NEUBEGINN DURCH DRUECKEN DER TASTEN OC15 017
                    *               IMMEDIATE STOP, RESET UND PROGRAMM  OC15 018
                    *               START                               OC15 019
                    *                                                   OC15 020
                    *     INPUT   1442       KARTENDECK MIT ZU ZAEHLEN- OC15 021
                    *                        DEN, GELOCHTEN KOLONNEN    OC15 022
                    *                                                   OC15 023
                    *     OUTPUT  ACC/EXT    DEZIMALES ZAEHLERGEBNIS IN OC15 024
                    *                        HEXADEZIMALER NOTIERUNG    OC15 025
                    *                                                   OC15 026
                    *     OP/REQ  SBR /70FF  FUNKTIONSFEHLER, NEU BE-   OC15 027
                    *                        GINNEN                     OC15 028
                    *                                                   OC15 029
                    *             DIE TASTEN INT/REQ UND PROG/STOP      OC15 030
                    *             DUERFEN NICHT BENUETZT WERDEN         OC15 031
                    *                                                   OC15 032
                    *************************************************** OC15 033
                    *************************************************** OC15 034
                          EJCT                                          OC15 035
                    *                                                   OC15 036
                    *     PROGRAMMKOPF UND -ROUTINEN, INTERRUPT-        OC15 037
                    *     ADRESSEN                                      OC15 038
                    *                                                   OC15 039
                          DN      OC15                                  OC15 040
                          DC      15092                        15.09.72 OC15 041
                          ORG     /0000                        -- *-  - OC15 042
                    *                                                   OC15 043
                    START SLC     32         (SLT)                      OC15 044
                          ORG     *-1                                   OC15 045
                    OC15  B       MODIF                           ABS 0 OC15 046
                          STD     CNT                                   OC15 047
                          LDX     PUNCH                                 OC15 048
                    *                                                   OC15 049
                    XR3   DC      *-*                           OC15+ 3 OC15 050
                          ORG     *-1                                   OC15 051
                    RS    SLC     32         (SLT)                      OC15 052
                    *                                                   OC15 053
                    CSTO  DC      *-*        SPEICHER           OC15+ 4 OC15 054
                    *                                                   OC15 055
                    BOSC  DC      *-*        INTERRUPT LOESCHEN         OC15 056
                          ORG     *-1                                   OC15 057
                    H4000 DC      /4000                                 OC15 058
                          DC      /00CC      (BOSC I)                   OC15 059
                          DC      BOSC                                  OC15 060
                    *                                                   OC15 061
                    LEV0  DC      INTR0      ADR LEV 0          OC15+ 8 OC15 062
                    *                                                   OC15 063
                    PCHST DC      /1404      IOCC PREAD START         O OC15 064
                    *                                                   OC15 065
                    DEC1  DC      0                                   E OC15 066
                          DC      1                                   O OC15 067
                    *                                                   OC15 068
                    LEV4  DC      INTR4      ADR LEV 4          OC15+12 OC15 069
                    *                                                   OC15 070
                    DECMO LDD     CNT        DEZIMALMODIFIZIERUNG       OC15 071
                          RTE     4          (SRT)                      OC15 072
                          STD     CNT                                   OC15 073
                    MDX3  MDX   3 4                                     OC15 074
                          LDX     RET                                   OC15 075
                    *                                                   OC15 076
                    *************************************************** OC15 077
                          EJCT                                          OC15 078
                    *                                                   OC15 079
                    *     INTERRUPT-ROUTINEN UND PROGRAMM-ABLAUF        OC15 080
                    *                                                   OC15 081
                    INTR4 DC      *-*        EINSPRUNG INT LEV 4        OC15 082
                          ORG     *-1                           OC15+18 OC15 083
                    H3010 DC      /3010                                 OC15 084
                          XIO     D1442-1                               OC15 085
                          NOP                                           OC15 086
                          BSI     BOSC                                  OC15 087
                    *                                                   OC15 088
                    PUNCH XIO     PCHST-1    EINSPRUNG PUNCH READ       OC15 089
                          LDD     CNT                                   OC15 090
                          WAIT               RESULTAT IN ACEXT          OC15 091
                          B       *-1                                   OC15 092
                    *                                                   OC15 093
                    INTR0 DC      *-*        EINSPRUNG INT LEV 0        OC15 094
                          ORG     *-1                                   OC15 095
                    I9000 DC      /9000                                 OC15 096
                          XIO     SENS0-1                               OC15 097
                          XIO     WREAD-1                               OC15 098
                          LD      CSTO                                  OC15 099
                          BSC     +-                                    OC15 100
                          LDX     SLT3+2                                OC15 101
                          SRA     16                                    OC15 102
                          STO     XR3                                   OC15 103
                          LDD     CNT                                   OC15 104
                    *                                                   OC15 105
                    RET   SLC     28         ZAEHLUNG (SLT)             OC15 106
                          EOR     H9000                                 OC15 107
                          BSC     +-                                    OC15 108
                          LDX     DECMO                                 OC15 109
                          LDD     CNT                                   OC15 110
                          AD      DEC1                                  OC15 111
                    SLT3  DC      /0027      (SLT 3)                    OC15 112
                          STD     CNT                                   OC15 113
                          BSI     BOSC                                  OC15 114
                    END   B       *-1                                   OC15 115
                    *                                                   OC15 116
                    *************************************************** OC15 117
                    *                                                   OC15 118
                    *     UEBERLAGERUNGEN                               OC15 119
                    *                                                   OC15 120
                    D1442 DC      /1702      IOCC RESET LEV 4 1442    O OC15 121
                    H9000 DC      /9000                                 OC15 122
                    SENS0 DC      /1701      IOCC RESET LEV 0         O OC15 123
                    ADRC  DC      CSTO       IOCC WREAD ADR           E OC15 124
                    WREAD DC      /1200      IOCC WREAD               O OC15 125
                    *                                                   OC15 126
                    CNT   DC      *-*        ZAEHLER                  E OC15 127
                          DC      *-*        ZAEHLERERWEITERUNG       O OC15 128
                          ORG     END+1                                 OC15 129
                    *                                                   OC15 130
                    *************************************************** OC15 131
                          EJCT                                          OC15 132
                    *                                                   OC15 133
                    *     BOOTSTRAP-MODIFIZIERUNG                       OC15 134
                    *                                                   OC15 135
                    MODIF LD      RS                                    OC15 136
                          STO     OC15       FUER NEUBEGINN             OC15 137
                          LD      BOSC+1                                OC15 138
                          SLA     4          /0CC0                      OC15 139
                          OR      H4000      /4CC0                      OC15 140
                          STO     BOSC+1                                OC15 141
                          LD      H3010                                 OC15 142
                          SRA     4          /0301                      OC15 143
                          STO     H3010                                 OC15 144
                          EOR     DEC1+1     /0300                      OC15 145
                          STO     CSTO                                  OC15 146
                          LD      I9000                                 OC15 147
                          STO     H9000                                 OC15 148
                          NOP                                           OC15 149
                          LD      LEV4                                  OC15 150
                          SLA     8          /1200                      OC15 151
                          STO     WREAD                                 OC15 152
                          LD      CSTO       /0300                      OC15 153
                          OR      MDX3       /7304                      OC15 154
                          STO     MDX3                                  OC15 155
                          LD      H4000                                 OC15 156
                          SRA     12         /0004                      OC15 157
                          STO     ADRC                                  OC15 158
                          SLA     8          /0400                      OC15 159
                          OR      PCHST      /1404                      OC15 160
                          STO     PCHST                                 OC15 161
                          EOR     ADRC       /1400                      OC15 162
                          OR      H3010      /1701                      OC15 163
                          STO     SENS0                                 OC15 164
                          A       DEC1+1     /1702                      OC15 165
                          STO     D1442                                 OC15 166
                          LD      SLT3       /0027                      OC15 167
                          SLA     7          /1380                      OC15 168
                          STO     SLT3                                  OC15 169
                          LDX     START                                 OC15 170
                    *                                                   OC15 171
                    *************************************************** OC15 172
                    *************************************************** OC15 173
                    *                                                   OC15 174
                    *     OSCAR E WYSS, RHEINFELDERSTR 21, 4058 BASEL   OC15 175
                    *                                                   OC15 176
                          END     OC15                         15.09.72 OC15 177
