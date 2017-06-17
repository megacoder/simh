
#include <stdlib.h>
#include <stdio.h>

#include "sysdef.h"
#include "cvtpar.h"
#include "prsf2.h"

char fin[300], fon[300];

#if '\n' == 0x0A && ' ' == 0x20 && '0' == 0x30 \
  && 'A' == 0x41 && 'a' == 0x61 && '!' == 0x21

/*
** ASCII to BCD conversion table. 
*/

static unsigned char tobcd[128] =
{
 /*00  NL   SH   SX   EX   ET   NQ   AK   BL */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*08  BS   HT   LF   VT   FF   CR   SO   SI */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*10  DL   D1   D2   D3   D4   NK   SN   EB */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*18  CN   EM   SB   EC   FS   GS   RS   US */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*20  SP    !    "    #    $    %    &    ' */
      060, 052, 060, 060, 053, 060, 060, 014,
 /*28   (    )    *    +    ,    -    .    / */
      074, 034, 054, 020, 073, 040, 033, 061,
 /*30   0    1    2    3    4    5    6    7 */
      000, 001, 002, 003, 004, 005, 006, 007,
 /*38   8    9    :    ;    <    =    >    ? */
      010, 011, 060, 060, 060, 013, 060, 032,
 /*40   @    A    B    C    D    E    F    G */
      060, 021, 022, 023, 024, 025, 026, 027,
 /*48   H    I    J    K    L    M    N    O */
      030, 031, 041, 042, 043, 044, 045, 046,
 /*50   P    Q    R    S    T    U    V    W */
      047, 050, 051, 062, 063, 064, 065, 066,
 /*58   X    Y    Z    [    \    ]    ^    _ */
      067, 070, 071, 060, 060, 060, 060, 060,
 /*60   `    a    b    c    d    e    f    g */
      060, 021, 022, 023, 024, 025, 026, 027,
 /*68   h    i    j    k    l    m    n    o */
      030, 031, 041, 042, 043, 044, 045, 046,
 /*70   p    q    r    s    t    u    v    w */
      047, 050, 051, 062, 063, 064, 065, 066,
 /*78   x    y    z    {    |    }    ~   DL */
      067, 070, 071, 060, 060, 060, 060, 060,
};

#endif /* ASCII */

#if '\n' == 0x15 && ' ' == 0x40 && '0' == 0xf0 \
  && 'A' == 0xC1 && 'a' == 0x81 && '!' == 0x5A

/*
** EBCDIC to BCD conversion table. 
*/

static unsigned char tobcd[256] =
{
 /*00  NU   SH   SX   EX   PF   HT   LC   DL */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*08            SM   VT   FF   CR   SO   SI */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*10  DE   D1   D2   TM   RS   NL   BS   IL */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*18  CN   EM   CC   C1   FS   GS   RS   US */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*20  DS   SS   FS        BP   LF   EB   EC */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*28            SM   C2   EQ   AK   BL      */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*30            SY        PN   RS   UC   ET */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*38                 C3   D4   NK        SU */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*40  SP                                    */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*48          CENT    .    <    (    +    | */
      060, 060, 060, 033, 060, 074, 020, 060,
 /*50   &                                    */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*58             !    $    *    )    ;    ^ */
      060, 060, 052, 053, 054, 034, 060, 060,
 /*60   -    /                               */
      040, 061, 060, 060, 060, 060, 060, 060,
 /*68             |    ,    %    _    >    ? */
      060, 060, 060, 073, 060, 060, 060, 032,
 /*70                                        */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*78        `    :    #    @    '    =    " */
      060, 060, 060, 060, 060, 014, 013, 060,
 /*80        a    b    c    d    e    f    g */
      060, 021, 022, 023, 024, 025, 026, 027,
 /*88   h    i         {                     */
      030, 031, 060, 060, 060, 060, 060, 060,
 /*90        j    k    l    m    n    o    p */
      060, 041, 042, 043, 044, 045, 046, 047,
 /*98   q    r         }                     */
      050, 051, 060, 060, 060, 060, 060, 060,
 /*A0        ~    s    t    u    v    w    x */
      060, 060, 062, 063, 064, 065, 066, 067,
 /*A8   y    z                   [           */
      070, 071, 060, 060, 060, 060, 060, 060,
 /*B0                                        */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*B8                            ]           */
      060, 060, 060, 060, 060, 060, 060, 060,
 /*C0   {    A    B    C    D    E    F    G */
      060, 021, 022, 023, 024, 025, 026, 027,
 /*C8   H    I                               */
      030, 031, 060, 060, 060, 060, 060, 060,
 /*D0   }    J    K    L    M    N    O    P */
      060, 041, 042, 043, 044, 045, 046, 047,
 /*D8   Q    R                               */
      050, 051, 060, 060, 060, 060, 060, 060,
 /*E0   \         S    T    U    V    W    X */
      060, 060, 062, 063, 064, 065, 066, 067,
 /*E8   Y    Z                               */
      070, 071, 060, 060, 060, 060, 060, 060,
 /*F0   0    1    2    3    4    5    6    7 */
      000, 001, 002, 003, 004, 005, 006, 007,
 /*F8   8    9                               */
      010, 011, 060, 060, 060, 060, 060, 060
};

#endif /* EBCDIC */

int swizzle (int c)
{
   c = c & 077;
   if (c == 0) c = 012;
   else if (c & 020) c = c ^ 040;
   return evenpar[c];
}

main (int argc, char **argv)
{
   FILE *fi, *fo;
   int c;
   int reclen;
   int chrcnt;
   uint8 buf[160];

   reclen = 84;
   parsefiles(argc, argv, "txt", "bcd", &reclen);
   if ((fi = fopen(fin, "r")) == NULL)
   {
      perror(fin);
      exit(1);
   }
   if ((fo = fopen(fon, "wb")) == NULL)
   {
      perror(fon);
      exit(1);
   }


   chrcnt = 0;
   while ( (c = fgetc(fi)) != EOF )
   {
      if (c == '\r') ;
      else if (c == '\n')
      {
         while (chrcnt < reclen)
	 {
            if (chrcnt == 0)
	    {
               fputc(swizzle(tobcd[' ']) | 0200, fo);
            }
	    else
	    {
               fputc(swizzle(tobcd[' ']), fo);
            }
            chrcnt++;
         }
         chrcnt = 0;
      }
      else if (c == '\f')
      {
            fputc(0217, fo);
      }
      else if (c == '\t')
      {
         if (chrcnt == 0)
	 {
            fputc(swizzle(tobcd[' ']) | 0200, fo);
         }
	 else
	 {
            fputc(swizzle(tobcd[' ']), fo);
         }
         chrcnt++;
         while (chrcnt % 8 != 0)
	 {
            fputc(swizzle(tobcd[' ']), fo);
            chrcnt++;
         }
      }
      else if (chrcnt == 0)
      {
         fputc(swizzle(tobcd[c]) | 0200, fo);
         chrcnt++;
      }
      else
      {
         fputc(swizzle(tobcd[c]), fo);
         chrcnt++;
      }
   }
   if (chrcnt > 0)
   {
      while (chrcnt < reclen)
      {
         fputc(swizzle(tobcd[' ']), fo);
         chrcnt++;
      }
   }
   fputc (0217, fo);
}
