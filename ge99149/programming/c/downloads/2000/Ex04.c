/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define	Show_no 50

int Randome;
long Count,Rand_No,seed;

int main (void)
{
clrscr();
seed=time(NULL);
srand(seed);
printf("Posous Tixaious ari8mous 8eleis na upologisw ? ");
scanf ("%ld", &Rand_No);
seed=time(NULL);
for (Count = 0 ; (Count != Rand_No) ; ++Count)
		{
		Randome = rand();
		if (Count < Show_no)	printf("%8d",Randome);
		}
printf ("\nMesos Xronos : %.9f \n",((time(NULL)-seed)/(float)Rand_No));
getch();
}
