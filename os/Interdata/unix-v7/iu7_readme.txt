Interdata Unix V7
-----------------

THE ENCLOSED SOFTWARE IS PROVIDED UNDER LICENSE.

DO NOT USE THIS SOFTWARE UNTIL YOU HAVE READ THE LICENSE AGREEMENT.
BY USING THE SOFTWARE (OR AUTHORIZING ANY OTHER PERSON TO DO SO), YOU
AGREE TO ACCEPT AND ABIDE BY ALL THE TERMS OF THIS LICENSE AGREEMENT.

Background
----------

The V7 port continues the story of Unix on the Interdata 32b systems.
V7 was a major rewrite of UNIX at Bell Labs for portability.  This
version of V7 for Interdata was ported from V7 for the PDP-11 by
Richard Miller and his colleagues at Wollongong University, with help
from Robert Elz at Melbourne University.

Contents Of The Kit
-------------------

	iu7_dp0.dsk		10MB disk image containing / and /usr
	iu7_dp1.dsk		10MB disk for swap and /tmp
	iu7_readme.txt		this file
	AncientUnix.pdf		license covering Unix V5,V6,V7

Running Unix V6
---------------

1. Configure the Interdata simulator to match the unix.732 kernel,
   and attach the disk images to dp0 and dp1:

	sim> set ttp ena	; console is PAS, not TTY
	sim> set pas dev=12	; make room for console PAS
	sim> att -e dp0 iu7_dp0.dsk
	sim> att -e dp1 iu7_dp1.dsk

   You can put all of these files in a command file, or into the
   Interdata initialization file i32.ini.

2. Boot either platter of dp0, and select the default Unix kernel
   from the fixed platter:

	sim> boot {-f} dp0
	Boot
	: dsk(1,0)unix

3. After the memory size printout, type ^D to start multi-user operations
   and then log in as root:

	Memory size = 248.0 K
	# ^D
	Restricted rights: Use, duplication, or disclosure is subject
	to restrictions stated in your contracts with Western Electric
	Company, Inc. and the University of Wollongong.
	Fri Jan  2 14:24:54 EST 1970

	login: root
	Password: root
	#

4. Unix V7 is on the air.  /dev/df0 is /, /dev/dr0 is /usr, /dev/df1
   is /tmp and swap.  /dev/dr0 is formatted but unallocated.  The kernel
   supports three 10MB drives and one 67MB drive, but no magtape.  If
   you are feeling brave, you can regenerate the kernel to include
   additional devices.

Recreating The Disk Image
-------------------------

The disk image can be recreated from the Wollongong V7 distribution
tape, using the following steps:

1. Configure the simulator to match the unix.732 kernel.  Attach blank
   disks to dp0 and dp1 and the distribution tape to mt0.

	sim> set ttp ena
	sim> set pas dev=12
	sim> att dp0 iu7_dp0.dsk
	sim> att dp1 iu7_dp1.dsk
	DP: creating new file
	sim> att -e mt0 wollongongv7.tap

2. Boot the magtape, and then load file mt(0,2).  This is standalone
   mkfs.  Create 9600 block file systems on dsk(0,0), dsk(1,0), and
   dsk(2,0).  Create a 7000 block file system on dsk(3,0).

	sim> boot mt0

	Boot
	: mt(0,2)
	file sys size: 9600
	file system: dsk(0,0)
	isize = 3072
	m/n = 3 500
	Exit called

	Boot
	: mt(0,2)
	file sys size: 9600
	file system: dsk(1,0)
	isize = 3072
	m/n = 3 500
	Exit called

	Boot
	: mt(0,2)
	file sys size: 9600
	file system: dsk(2,0)
	isize = 3072
	m/n = 3 500
	Exit called

	Boot
	: mt(0,2)
	file sys size: 7000
	file system: dsk(3,0)
	isize = 2240
	m/n = 3 500
	Exit called

3. Load file mt(0,3).  This is standalone restore.  Restore magtape
   file (0,6) to dsk(1,0).  Restore magtape file (0,7) to dsk(0,0).

	Boot
	: mt(0,3)
	Tape? mt(0,6)
	Disk? dsk(1,0)
	Last chance before scribbling on disk.
	End of tape

	Boot
	: mt(0,3)
	Tape? mt(0,7)
	Disk? dsk(0,0)
	Last chance before scribbling on disk.
	End of tape

4. Boot kernel unix.732 from the restored system.  Make unix.732 the
   default Unix kernel.  Create special nodes for the second disk
   drive, both in buffered and raw form.

	Boot
	: dsk(1,0)unix.732
	Memory = 248.0 K
	# rm unix
	# cp unix.732 unix
	# cd /etc
	# mknod /dev/dr1 b 0 2
	# mknod /dev/df1 b 0 3
	# mknod /dev/rdr1 c 2 2
	# mknod /dev/rdf1 c 2 3

5. Save the current /etc/rc, and then edit /etc/rc to automount the
   /usr and /tmp file structures.

	# cp rc rc.msm
	# ed rc
	408
	6
	: /etc/mount /dev/msm0c /tmp
	s/: //
	s/msm0c/df1/
	l
	/etc/mount /dev/df1 /tmp
	7
	: /etc/mount /dev/msm0d /usr
	s/: //
	s/msm0d/dr0/
	l
	: /etc/mount /dev/dr0 /usr
	w
	400
	q

6. Install bootstraps on both the fixed and removable platters of dp0.
   Sync the file system and verify that the system can be bootstrapped.

	# mkboot /boot /dev/df0
	# mkboot /boot /dev/dr0
	# sync
	# sync
	^E
	sim> boot -f dp0

	Boot
	: dsk(1,0)unix
	Memory = 248.0 K
	#^D
	# Restricted rights: Use, duplication, or disclosure is subject
	to restrictions stated in your contracts with Western Electric
	Company, Inc. and the University of Wollongong.
	Fri Jan  2 14:24:54 EST 1970

	login: root
	Password: root
	#

7. Verify that the /usr file system has mounted correctly.

	# ls -l /usr
	# ls -l /usr
	total 18
	drwxrwxr-x  2 bin        32 Aug 25 01:47 bin
	drwxrwxr-x  3 bin       128 Jan 11 07:18 dict
	drwxrwxr-x  2 bin       688 Sep 25 03:05 doc
	drwxrwxr-x  5 bin       416 Aug 24 22:45 games
	drwxrwxr-x  3 bin       496 May  5 16:16 include
	drwxrwxr-x 10 bin       640 Aug 24 22:39 lib
	drwxrwxr-x 11 bin       176 Aug 24 23:26 man
	drwxrwxr-x  2 bin        80 Jan 11 07:19 pub
	drwxrwxr-x  2 rm         32 Aug 25 01:39 rm
	drwxrwxr-x  7 bin       112 Aug 24 17:42 spool
	drwxrwxr-x  2 bin       224 Sep 25 03:08 src
	drwxrwxr-x  6 sys       160 Aug 25 00:26 sys
	drwxrwxrwx  2 bin      1792 Sep 21 17:06 tmp
	#
