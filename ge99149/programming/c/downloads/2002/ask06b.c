/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Ouden sxolion  */

#include <stdio.h>
int main()
{
  int c;
printf("dose mia akolouthia xaraktiron\n");
/*diabazei me ti seira tous xaraktires tis alfabitou*/
while ( (c=getchar()) !=EOF)
   if (c>='a'&&c<='z')/*elegxei an einai xaraktiras tis alfabitou*/
       putchar (c+'A'-'a'); /*metatrepei ta mikra se kefalaia*/ 
   else putchar(c);
   return 0;
}
