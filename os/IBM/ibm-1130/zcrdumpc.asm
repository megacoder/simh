*list
*
* zcrdumpc - single-card cold-start-type program
* to dump memory to the console typewriter. This
* is the real thing: typed in (sans most comments)
* from the Disk Monitor System source code microfiche.
* More to come.
*
* To use on the simulator in GUI mode, uncomment
* the .IPL 1130 statement below, to enable
* binary output.
*
* Assemble with the command
*
*    asm1130 zcrdumpc
*
* 0. (load something interesting into memory)
*
* 1. Set the console entry switches to the desired
*    dump starting address
*
* 2. Type "attach cr zdumpc.out"
*
* 3. Type "set cr binary"
*
* 4. Click "Program Load".
*
* 5. Click "Program Start".
*
* 6. Watch the output. To stop, click "Imm Stop".
*
* To use on the simulator w/o the GUI, follow steps
* 0-3 above, then,
*
* 4. Type "boot cr"
*
* 5. Watch the output. To stop, type Ctrl-E.
*
* To use with a hex load file, comment out the .IPL
* statement below and reassemble. Then:
*
* 1. Type "deposit ces ####" where #### is the desired
*    hex starting address.
*
* 2. Type "load zcrdumpc.out"
*
* 3. Type "go"
*
* 4. Watch the output. To stop, type Ctrl-E.
*
* The first word printed is the starting address.
* Then, data words until you stop it.
*
* By the way, 
* Cold start programs are loaded directly into memory
* from the card reader, each column of 12 bits
* expanding into one 16 bit word. This means there
* are four missing bits. The index bits are set to
* zero, and the displacement field is sign-extended
* by two bits. This means that cold-start programs
* usually have to do some self-modification in order
* to build instructions that require different values
* for the missing bits, e.g. this program begins
* with some bit-shifting to build a BOSC L
* instruction. It will all make more sense when I
* get the time to put the comments in.     bk
* ---------------------------------------------------
*
* status version 2, modification 0
*
* function/operation- this is a one card dump on
* the typewriter. The card is loaded by pressing
* program load... This program gets its starting
* address from the bit-switches and dumps 4 characters
* per word with a space separating each word. The no.
* of words typed depends on the margin settings of
* the typewriter. ... Runs until IMM STOP is pressed.

	.ipl		1130
	abs
	org		0

* one card dump on typewriter

start	ldd		intrp-1
	slc		9
	sto		intrp-1
	ld		sense+1
	sra		4
	mdx		go

* the next two words become BOSC L 0000

	dc		/0026
intrp	dc		/2000
	sto		save
	xio		sense
	ld		save
	mdx		intrp-1
	dc		intrp
go	sto		sense+1
	ld		star
luck	sla		8
	sto		star
	sto		star3

	ldd		bitsw
	rte		10
	std		bitsw

swit	ld		write+1
	sra		4
	sto		write+1

	xio		bitsw
	ld		star+1
	mdx		star+2

* the next two words were previously initialized to ld l *-*

star	dc		/00c4
	dc		*-*
	rte		16
	ld		const
	sto		count
star2	sla		16
	slc		4
	a		tytab
	sto		*+1

* the next two words were previously set up
* to be a long load instruction LD L *-*

star3	dc		*-*
	dc		*-*
	sla		8
	sto		buf
wrt	xio		write
	dc		/0010
chng2	ld		count
	s		luck
	sto		count
	bsc		z-
	mdx		star2
	ld		space
	sla		8
	sto		buf
	xio		write

* the following word serves both as a wait-for-
* interrupt and also a constant for a rotate/tilt
* space character

space	dc		/0021
	ld		swit
	bsc		z
	mdx		luck2
	ld		star+1
	a		one
	sto		star+1
sense	mdx		star
	dc		/f010

table	dc		/00c4	0
	dc		/00fc	1
	dc		/00d8	2
	dc		/00dc	3
	dc		/00f0	4
	dc		/00f4	5
	dc		/00d0	6
	dc		/00d4	7
	dc		/00e4	8
	dc		/00e0	9
tytab	dc		/003c	a
	dc		/0018	b
bitsw	dc		/70e8	c also 1st wd of bit sw io
const	dc		/c000	d also 2nd wd of bit sw io
	dc		/0034	e
luck2	dc		/1810	f also sra 16 instruction
	sto		swit
	mdx		star
write	dc		buf
	dc		/9010
buf	equ		start+1
one	equ		write
save	equ		start+2
count	equ		start+3
	end		start