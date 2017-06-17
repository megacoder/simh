To:	7094 Simulator Users
From:	SimH maintenance
Subj:	IBSYS kit for SIMH i7094
Date:	April 20, 2006

IBSYS was the mainstream batch operating system for the IBM 7094.  This
kit contains the data files and utilities needed to run IBSYS jobs on
the SimH i7094 simulator.

The kit and utilities come from Paul Pierce and Dave Pitts.  I am grateful
for their work in making IBSYS usable on simulated systems.

Kit Contents
------------

ASYS1.BIN, ASYS8.BIN	IBSYS tape images
do_ibsys.txt		SimH master DO command file (Windows)
ibsys.ctl		IBSYS startup control file
*.job			Sample IBSYS job files

gendate.c		Utility to generate an IBSYS date card
eof.dat			Tape eof marker
txt2bcda.c		Utility to convert text files to BCD input tapes
bcd2txta.c		Utility to convert BCD output tapes to text files
prs2.c			Supporting parser routine
*.h			Utility header files

Installation
------------

Unzip the archive and install all the files in the same directory as the
i7094 executable image.

Additional Unix Requirements
----------------------------

For Unix, the utilities must be compiled, and the DO file altered.

The text files (do_ibsys.txt, *.job) will need \r\n converted to \n.  The
ASC utility in the SimH simtools collection can do this conversion.

The included Makefile will compile the utilities under gcc.

The command file must be edited to replace the Windows commands copy and
del with cp and rm, respectively.

Running Jobs
------------

The DO command file is Windows specific.  The syntax of the DO command is:

sim> do do_ibsys.txt <job_file_name> <output_file_name>

The simulator will set up the system to run IBSYS, run the specified job,
and convert the output to a text file with the specified output file name.
All intermediate files will be deleted.
