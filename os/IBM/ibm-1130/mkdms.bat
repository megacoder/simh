@echo off

cd dmsr2v12

echo.
echo Assembling DMS source decks (two warnings expected)...

	rem ... SYMBOLS.SYS is the system symbol table. Name is all upper case even on Unix
if exist SYMBOLS.SYS del SYMBOLS.SYS

	rem ... compile all source files, 1130 relocatable binary output, create listing files
for %%i in (*.asm) do asm1130 -b -l %%i

cd ..

echo.
echo Assembling standalone utilities...

	rem ... edited DBOOTCD (I added transfer address etc) to 1130 relocatable binary format
asm1130 -b -l dbootcd

	rem ... stand-alone disk cartridge utility program ZDCIP to simulator load file format
asm1130    -l zdcip

echo.
echo Creating loader boot card images (one warning expected)...

	rem ... dbootcd1.ipl in 1130 IPL format
mkboot dbootcd.bin           dbootcd1.ipl 1130 /00 /47 LDBOTH01

	rem ... dbootcd2.dat in 1800 IPL format
mkboot dbootcd.bin           dbootcd2.dat 1800 /4F /72 LDBOTH02

	rem ... dciloadr.dat in 1800 IPL format
mkboot dmsr2v12\dciloadr.bin dciloadr.dat 1800 /04 /9D DCLA0001

	rem ... dsysldr1.dat in core image format
mkboot dmsr2v12\dsysldr1.bin dsysldr1.dat CORE 0   0   DCLB

echo.
echo Sorting assembler phases...
	rem ... assembler phases are out of order as assembled, must be physically reordered
bindump -s dmsr2v12\ptmasmbl.bin >ptmasmbl.dat

echo.
echo Binary files are now ready to use with loaddms operation
