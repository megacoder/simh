Interdata Unix V6
-----------------

THE ENCLOSED SOFTWARE IS PROVIDED UNDER LICENSE.

DO NOT USE THIS SOFTWARE UNTIL YOU HAVE READ THE LICENSE AGREEMENT.
BY USING THE SOFTWARE (OR AUTHORIZING ANY OTHER PERSON TO DO SO), YOU
AGREE TO ACCEPT AND ABIDE BY ALL THE TERMS OF THIS LICENSE AGREEMENT.

Background
----------

In 1976-77, Richard Miller and his colleagues at the University of
Wollongong, Australia, ported Unix V6 to the Interdata 7/32.  This
was a notable achievement in computer history, representing

	- the first port of UNIX from its native PDP-11 environment
	- a port from a 16b computer to a 32b computer
	- a port from a little-endian computer to a big-endian computer

Richard Miller has documented the project in his excellent paper,
"The First Unix Port" (Proceedings of the 1998 Usenix Technical
Conference), and he continues to maintain an interest in the code.
Indeed, the recreation of Unix V6 on the Interdata simulator would
not have been possible without Richard's knowledge, help, and above
all patience.

Contents Of The Kit
-------------------

	iu6_dp0.dsk		10MB disk image containing Unix V6
	iu6_readme.txt		this file
	AncientUnix.pdf		license covering Unix V5,V6,V7
	uboot			binary image of the system bootstrap
	tp512cvt.c		program to convert tp-format image
				dumps to simulated tapes

Running Unix V6
---------------

1. Configure the Interdata simulator to match the default Unix kernel,
   and attach the disk image to dp0:

	sim> set ttp ena	; console is PAS, not TTY
	sim> set pas dev=12	; make room for console PAS
	sim> d lfc tps 100	; 50Hz clock
	sim> att -e dp0 iu6_dp0.dsk

   You can put all of these files in a command file, or into the
   Interdata initialization file i32.ini.

2. Boot the disk, and select the default Unix kernel:

	sim> boot dp0
	?unix

3. After the memory size printout, log in as root:

	Memory size = 181.50 K
	login: root
	You have mail.

4. Unix is on the air!  You can start by reading the welcoming mail
   message, "sent" by Richard Miller 25 years ago.

	# mail

Recreating The Disk Image
-------------------------

The disk image can be recreated from Richard Miller's Internet kit,
using the following steps:

1. Download root.gz and src.tp.gz from an Internet Unix archive (for
   example, http://www.tribug.org/pub/tuhs/Other/Interdata/).

2. Unpack root.gz and rename the extracted file iu6_dp0.dsk; unpack
   src.tp.gz and rename the extracted file src.in.

3. Compile utility program tp512cvt.c and use it to convert src.in to
   simulator format:

	C:\temp> gcc tp512cvt.c -o tp512cvt
	C:\temp> tp512cvt src.in
	Processing file: src.in

   The resulting file is called src.tap.

4. Start the Interdata simulator.  Configure the simulator to match
   the default unix kernel.  Attach the disk image to dp0, uboot to pt0,
   and src.tap to mt0:

	C:\temp> i32
	sim> set ttp ena
	sim> set pas dev=12
	sim> d lfc tps 100
	sim> att -e dp0 iu6_dp0.dsk
	sim> att -e pt0 uboot
	sim> att -e mt0 src.tap

5. Enter the following short program, which reads in uboot and starts
   it running.  Note that the first 32 bytes of the tape are skipped:

	sim> d pt rpos 32
	sim> id 10000/10
	10000:  lis r1,3
	10002:  lhi r0,99
	10006:  xr r2,r2
	10008:  lhi r3,1000
	1000C:  ocr r1,r0
	1000E:  rbr r1,r2
	10010:  b 80

6. Run this program, starting at location 10000.  This will bootstrap
   the disk and bring up the Unix boot prompt.  Select the default
   Unix kernel and login as root:

	?unix
	Memory size = 181.50 K
	login: root
	You have mail.

7. Run script /usr/rm/fixup.  This extends the root file system to the
   full size of the disk (it was shortened to make the backup smaller)
   and writes the disk bootstrap.  When the script completes, sync the
   file system and reboot:

	# /usr/rm/fixup
	== Moving LSU bootstrap
	== Expanding filesystem size
	Not a.out format: /dev/dr0

	1004    4000    1004    8000    == Fixing up freelist
	/dev/dr0:
	*** Please Reboot Immediately ***
	# sync
	# sync
	# ^E
	Simulation stopped, PC: 2EB5C (EPSR R1,R0)
	sim> boot dp0
	?unix
	Memory size = 181.50 K
	login: root
	You have mail.

8. Verify that the fixup script worked by running icheck.  There should
   be more than 4000 free blocks:

	# /etc/icheck /dev/dr0
	/dev/dr0:
	spcl      44
	files    259
	large     99
	direc     22
	indir    101
	used    3540
	free    4302

9. Create a file system on the fixed platter and mount it as /usr/source:

	# chdir /usr
	# /etc/mkfs /dev/df0 rm/proto
	/dev/null: bad format
	# /etc/mount /dev/df0 /usr/source

10. Run script /usr/rm/extract to restore the /usr/doc and /usr/source
   directories.  Before running the script, you must manually create
   directory /usr/source/m6, which is not present in the script:

	# mkdir source/m6
	# rm/extract
	doc: File exists
	source: File exists
	End
	#

11. Edit /etc/rc to mount /usr/source automatically at startup:

	# cat /etc/rc
	rm -f /tmp/* /usr/lpd/lock
	al /etc/mtab
	/etc/update
	# ed /etc/rc
	52
	2l
	al /etc/mtab
	i
	/etc/mount /dev/df0 /usr/source
	.
	w
	84
	q
	# cat /etc/rc
	rm -f /tmp/* /usr/lpd/lock
	/etc/mount /dev/df0 /usr/source
	al /etc/mtab
	/etc/update

12. Sync the file system and exit the simulator:

	# sync
	# sync
	^E
	sim> exit

The disk image is now ready for use.
