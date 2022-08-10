/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Ouden sxolion  */

#include <stdio.h>
int main (void)
{
  int x, y, z;   /* dilosame tis metablites */
  printf("dose mou 2 arithmous na bro to piliko tous\n"); /*tiposame to minima prokeimenou na dothoun 2 arithmoi apo to pliktrologio */
  do
    scanf("%d %d",&x, &y); /* diabazei tous dosmenous arithmous apo to pliktrologio */
  while (y==0);
  z = x/y; /* ginetai i diairesi ton 2 arithmon otan o deuteros den einai 0 */
  printf("to piliko %d dia %d einai %d\n", x, y, x/y); /* tiponetai to minima kai emfanizetai to apotelesma*/
}

