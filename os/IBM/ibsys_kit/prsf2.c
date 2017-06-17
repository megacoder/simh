
#include <stdlib.h>
#include <stdio.h>

char fin[300], fon[300];

void parsefiles (int argc, char **argv, char *iex, char *oex, int *parm)
{
   register char *p;
   register char *q;
   char *d;
   int file2;

   if (argc < 2 || argc > 4 || (parm == 0 && argc > 3))
   {
      if (parm == 0)
      {
         fprintf(stderr, "Usage: %s2%s <infile> [<outfile>]\n",
            iex, oex);
      }
      else
      {
         fprintf(stderr,
	     "Usage: %s2%s <infile> [<outfile>] [<record len>, default %d]\n",
            iex, oex, *parm);
      }
      exit(1);
   }
   d = 0;
   q = fin;
   for (p = argv[1]; *p; p++)
   {
      *q++ = *p;
      if (*p == '.')
         d = q;
      else if (*p == '\\')
         d = 0;
   }
   if (d == 0)
   {
      *q++ = '.';
      d = q;
      for (p = iex; *p; p++)
         *q++ = *p;
   }
   *q++ = 0;

   file2 = 0;
   if (argc > 2)
   {
      if (parm)
      {
         int   v = 0;

         for (q = argv[argc-1]; *q; q++)
	 {
            if (*q >= '0' && *q <= '9')
	    {
               v = 10*v + *q - '0';
            }
	    else
	    {
               if (argc == 3)
	       {
                  file2 = 1;
                  goto getfile;
               }
	       else
	       {
                  fprintf(stderr, "Invalid number\n");
                  exit(1);
               }
            }
         }
         *parm = v;
         if (argc > 3)
	 {
            file2 = 1;
         }
      }
      else
      {
         file2 = 1;
      }
   }
getfile:

   q = fon;
   if (!file2)
   {
      for (p = fin; p < d; p++)
         *q++ = *p;
      for (p = oex; *p; p++)
         *q++ = *p;
      *q++ = 0;
   }
   else
   {
      d = 0;
      for (p = argv[2]; *p; p++)
      {
         *q++ = *p;
         if (*p == '.')
            d = q;
         else if (*p == '\\')
            d = 0;
      }
      if (d == 0)
      {
         *q++ = '.';
         d = q;
         for (p = oex; *p; p++)
            *q++ = *p;
      }
      *q++ = 0;
   }
}
