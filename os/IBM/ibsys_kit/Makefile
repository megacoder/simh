CC = gcc

TARGETS = gendate txt2bcda bcd2txta
INSTDIR = /usr/local/bin

GENDATEOBJ = gendate.o
TXT2BCDA = txt2bcda.o prsf2.o
BCD2TXTA = bcd2txta.o prsf2.o

all: 
	@if [ "`uname -s`" = "Linux" ] ; then \
		echo "Making Linux on a `uname -m`" ;\
		make $(TARGETS) "CFLAGS=-DLINUX $(DEBUG)" ;\
	elif [ "`uname -s`" = "AIX" ] ; then \
		echo "Making AIX" ;\
		make $(TARGETS) "CFLAGS=-DAIX $(DEBUG)" ;\
	elif [ "`uname -s`" = "HP-UX" ] ; then \
		echo "Making HP-UX" ;\
		make $(TARGETS) "CFLAGS=-DHPUX $(DEBUG)" ;\
	elif [ "`uname -s`" = "OS/390" ] ; then \
		echo "Making OS/390 USS" ;\
		make $(TARGETS) "CC=cc" "CFLAGS=-DUSS $(DEBUG)" ;\
	elif [ "`uname -s`" = "SunOS" ] ; then \
		echo "Making Solaris" ;\
		make $(TARGETS) "CFLAGS=-DSOLARIS $(DEBUG)" ;\
        elif [ "`uname -s`" = "MINGW32_NT-5.1" ] ; then \
                echo "Making Native XP code with MSYS" ;\
                make $(TARGETS) "CFLAGS=-DWIN32 -DMINGW $(DEBUG)" ;\
	else \
		echo "OS type `uname -s` is unknown" ;\
		echo "You must enter an OS type. OS types are:" ;\
		echo "   aix | decunix | hpux | linux | nt | openmvs | solaris" ;\
		echo " " ;\
	fi

aix:
	@make $(TARGETS) "CFLAGS = -DAIX $(DEBUG)"

hpux:
	@make $(TARGETS) "CFLAGS = -DHPUX $(DEBUG)"

linux:
	@make $(TARGETS) "CFLAGS = -DLINUX $(DEBUG)"

nt:
	@nmake/nologo -f makefile.nt

openmvs:
	@make $(TARGETS) "CFLAGS = -DUSS $(DEBUG)"

solaris:
	@make $(TARGETS) "CFLAGS = -DSOLARIS $(DEBUG)"


gendate: $(GENDATEOBJ)
	$(CC) -o gendate $(GENDATEOBJ)

txt2bcda: $(TXT2BCDA)
	$(CC) -o $@ $(TXT2BCDA)

bcd2txta: $(BCD2TXTA)
	$(CC) -o $@ $(BCD2TXTA)


clean:
	rm -f $(GENDATEOBJ) gendate
	rm -f $(TXT2BCDA) txt2bcda
	rm -f $(BCD2TXTA) bcd2txta

gendate.o: gendate.c
prsf2.o: prsf2.c prsf2.h
txt2bcda.o: txt2bcda.c prsf2.h cvtpar.h sysdef.h
bcd2txta.o: bcd2txta.c prsf2.h cvtpar.h sysdef.h
