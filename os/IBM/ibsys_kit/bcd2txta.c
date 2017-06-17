/***********************************************************************
*
* bcd2txt.c - IBM 7090 BCD to Text converter.
*
* Changes:
*   ??/??/??   PRP   Original.
*   01/28/05   DGP   Changed to use IBSYS standard characters as default.
*   03/18/05   DGP   Changed 072 usage, in altbcd it is a '?'.
*   
***********************************************************************/


#include <stdlib.h>
#include <stdio.h>

#include "sysdef.h"
#include "nativebcd.h"
#include "prsf2.h"
#include "cvtpar.h"

#define MAXREC 10000

char fin[300], fon[300];
uint8 record[MAXREC];

int
main (int argc, char **argv)
{
   FILE *fi, *fo;
   uint8 *p;
   char *optarg;
   int optind;
   int blank;
   int printer;
   int altchars;
   int c;
   int fileflag;
   int reclen;

   blank = 0;
   altchars = 0;
   printer = 0;
   for (optind = 1, optarg = argv[optind];
       (optind < argc) && ((*optarg == '-') || (*optarg == '/'));
       optind++, optarg = argv[optind])
   {
      ++optarg;
      while (*optarg)
      {
         switch(*optarg++)
	 {

         case 'a':
            altchars = 1;
            break;

         case 'b':
	    blank = 1;
            break;

         case 'p':
	    printer = 1;
            break;

         default:
            fprintf(stderr, "Usage: bcd2txt [-a] <in> <out> <record length>\n");
            fprintf(stderr, "  -a     Use Alternate character set\n");
            fprintf(stderr, "  -p     Convert printer controls\n");
            exit(1);
         }
      }
   }

   reclen = MAXREC;
   parsefiles(argc - (optind-1), &argv[optind-1], "bcd", "txt", &reclen);
   if ((fi = fopen(fin, "rb")) == NULL)
   {
      perror(fin);
      exit(1);
   }
   if ((fo = fopen(fon, "w")) == NULL)
   {
      perror(fon);
      exit(1);
   }
   p = record;
   fileflag = 1;
   while ( (c = fgetc(fi)) != EOF )
   {
      int d = c & 077;
      if (d == 012) d = 0;
      else if (d & 020) d = d ^ 040;
      c = (c & 0200) | evenpar[d];

      if (c & 0200 || p - record == reclen || (!altchars && c == 072))
      {
         while (p != record && p[-1] == ' ')
	 {
            p--;
         }
         if (p != record)
	 {
            fwrite(record, 1, p - record, fo);
            fputc('\n', fo);
         }
	 else if (!fileflag)
	 {
            fputc('\n', fo);
         }
         fileflag = 0;
         p = record;
	 if (printer)
	 {
	    int ch;

	    if (c == 072)
	    {
	       c = fgetc(fi);
	    }

	    ch = tonative[c & 077];
	    switch (ch)
	    {
	    case '0':
	       fputc ('\n', fo);
	       break;
	    case '1':
	       fputc ('\f', fo);
	       break;
	    default: ;
	    }
	    c = 072;
	    
	 }
      }
      if (!(!altchars && c == 072))
      {
         if (c == 0217)
	 {
            fputc('\n', fo);
            fileflag = 1;
         }
	 else if (c != 0132)
	 {
            if (blank && (c & 077) == 020)
	    {
               *p++ = ' ';
            }
	    else if (altchars)
	    {
               *p++ = toaltnative[c & 077];
            }
	    else
	    {
               *p++ = tonative[c & 077];
            }
         }
      }
   }
   if (p != record)
   {
      while (p != record && p[-1] == ' ')
      {
         p--;
      }
      if (p != record)
      {
         fwrite(record, 1, p - record, fo);
         fputc('\n', fo);
      }
      else if (!fileflag)
      {
         fputc('\n', fo);
      }
   }
   fclose (fi);
   fclose (fo);

   return (0);
}
