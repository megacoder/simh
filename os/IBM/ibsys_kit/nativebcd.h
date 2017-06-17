/***********************************************************************
*
* nativebcd.h - BCD to native character conversion table.
*
* Changes:
*   01/20/05   DGP   Original.
*   02/15/05   DGP   Changed ASCII to native, since EBCDIC works, too.
*   03/18/05   DGP   Added isbcd table.
*	
***********************************************************************/

/*
 * BCD to native table. Matches the IBSYS conversion tables.
 */

unsigned char tonative[64] = {
/* 00 */ '0', '1', '2', '3', '4', '5', '6', '7',
/* 10 */ '8', '9', ' ', '=', '\'', ' ', ' ', ' ',
/* 20 */ '+', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
/* 30 */ 'H', 'I', '?', '.', ')', ' ', ' ', ' ',
/* 40 */ '-', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
/* 50 */ 'Q', 'R', '!', '$', '*', ' ', ' ', ' ',
/* 60 */ ' ', '/', 'S', 'T', 'U', 'V', 'W', 'X',
/* 70 */ 'Y', 'Z', ' ', ',', '(', ' ', ' ', ' '
};

unsigned char toaltnative[64] = {
/* 00 */ ' ', '1', '2', '3', '4', '5', '6', '7',
/* 10 */ '8', '9', '0', '=', '\'', ':', '>', '{',
/* 20 */ ' ', '/', 'S', 'T', 'U', 'V', 'W', 'X',
/* 30 */ 'Y', 'Z', '|', ',', '(', '~', '\\', '"',
/* 40 */ '-', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
/* 50 */ 'Q', 'R', '!', '$', '*', ']', ';', '_',
/* 60 */ '+', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
/* 70 */ 'H', 'I', '?', '.', ')', '[', '<', '}'
};

int isbcd[64] = {
/* 00 */ 1, 1, 1, 1, 1, 1, 1, 1,
/* 10 */ 1, 1, 0, 1, 1, 0, 0, 0,
/* 20 */ 1, 1, 1, 1, 1, 1, 1, 1,
/* 30 */ 1, 1, 0, 1, 1, 0, 0, 0,
/* 40 */ 1, 1, 1, 1, 1, 1, 1, 1,
/* 50 */ 1, 1, 0, 1, 1, 0, 0, 0,
/* 60 */ 1, 1, 1, 1, 1, 1, 1, 1,
/* 70 */ 1, 1, 0, 1, 1, 0, 0, 0
};

