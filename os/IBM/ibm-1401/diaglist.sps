01010        CTL3                      CONTROL CARD
01020        ORG4000                   START AT 4000
01030  START LCA%U1        0001       RREAD TAPE REC
01035        B  EOJ                   KEND OF REEL?
01040        A  ONE        COUNT       UP COUNTER
01050        B  HEADR      0080       ATITLE REC?
01060        B  START                  NO - REPEAT
01070  HEADR MCW0080       0280
01075        MCWCOUNT      0300
01080        W
01090        B  START
01170  EOJ   H  0001
0118004COUNT DCW*      0000
0119001ONE   DCW*      1
01200        ENDSTART
