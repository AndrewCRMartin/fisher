#include <stdio.h>
#include <string.h>
#include "fexact.h"

#define MAXBUFF 1024
#define TERMINATE(x) do {  int _terminate_macro_j;                    \
                        for(_terminate_macro_j=0;                     \
                            (x)[_terminate_macro_j];                  \
                            _terminate_macro_j++)                     \
                        {  if((x)[_terminate_macro_j] == '\n')        \
                           {  (x)[_terminate_macro_j] = '\0';         \
                              break;                                  \
                     }  }  }  while(0)

int main(int argc, char **argv)
{
   FILE *fp = NULL;
   char buffer[MAXBUFF];
   int  nlines = 0;
   int  data[16];
   double pval;

   if((fp=fopen(argv[1], "r"))==NULL)
   {
      fprintf(stderr,"Can't open file %s\n", argv[1]);
      return(1);
   }

   while(fgets(buffer, MAXBUFF, fp))
   {
      TERMINATE(buffer);
      if(strlen(buffer))
      {
         char label1[MAXBUFF],
            label2[MAXBUFF];
         int value;

         sscanf(buffer, "%s %s %d", label1, label2, &value);
         data[nlines++] = value;
         if(nlines > 4)
         {
            fprintf(stderr, "fisher can only analyze a 2x2 contingency table\n");
            return(1);
         }
      }
   }

   pval = my_fisher_exact(data, 2, 2);
   printf("p-value: %.3g\n", pval);

   return(0);
}
