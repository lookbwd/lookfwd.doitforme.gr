/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Ouden sxolion  */


#include <stdio.h>  /* To programma ipologizei to paragontiko tou arithmou n */
int main()
{
  int n;
  printf ("Dose mou enan akeraio thetiko arithmo gia na ipologiso to paragotiko tou\n");
  /* zitaei ton arithmo n */
  do
    scanf ("%d", &n);   /* dibazei ton arithmo n*/
  while ( n <= 0 );     /* an to n einai arnitikos xanazitaei arithmo */
  printf ("%d! = %d\n", n, factor(n));
  return 0;
}
int factor(int s)
{
  int i,prod=1;
  for (i=2; i<=s; i++) prod=prod * i ; /* ipologizei to paragontiko */
/* ka8e fora polaplasiazei to prod me to i, s fores. ara 1*2*3*...s=s!*/
}
