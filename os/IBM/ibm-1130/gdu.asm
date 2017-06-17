                    * GDU.ASM - TEST THE 2250 GRAPHICAL DISPLAY UNIT EMULATOR
                    *
                    START XIO     LAMPS             * light the lamps
                          LD      INTAD             * get address of interrupt svc routine
                          STO  L  /B                * store at vector address B (level 3)
                          XIO     GO                * start regeneration
                    LOOP  WAIT
                          MDX     LOOP
                    *
                    INTAD DC      INTSV
                    *
                    INTSV DC      0                 * interrupt service routine
                          XIO     SENS3             * read DSW and reset interrupts
                          LD      TRING+1           * get revert address
                          S       THREE             * get address of the Y coordinate preceding the jump 
                          STO     VECY              * save it
                          LD   I  VECY              
                          A       JUMP
                          STO  I  VECY
                          XIO     GO                * resume
                          BOSC I  INTSV             * return from interrupt
                    *
                          BSS  E  0
                    GO    DC      GDATA
                          DC      /c900             * write = start regeneration
                    *
                    LAMPS DC      LDATA
                          DC      /c980             * write with modifier = set lamps
                    *
                    SENS3 DC      0
                          DC      /CF01             * read DSW with interrupt reset
                    *
                    JUMP  DC      10                * y increment on pen hit
                    THREE DC      3                 * constant 3
                    VECY  DC      0                 * vector's Y address
                    *
                    LDATA DC      /1234             * indicator lamp data
                          DC      /C002
                    *
                    GDATA SGMV                      * set vector mode
                          SPM     /9                * set pen mode: detect and defer
                    GLOOP STMR                      * start timer
                          MBA     100,100           * set position
                          GB      TRING             * call triangle subroutine
                          MBA     700,300  
                          GB      TRING
                    BPOS  MBA     453,872
                          GB      TRING
                          GB      GLOOP             * repeat
                    *
                    TRING SRVT                      * store revert register
                          DBI     30,0
                          DBI     -15,30
                          DBI     -15,-30
                          GIC     ,D                * interrupt if pen detect occurred
                          RVT
                    *
                          END     START
