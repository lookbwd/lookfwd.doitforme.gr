/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>
#define	Q0 5

int Afi3h (int c);
int E3yphretish (int c);
int te3();
int taf();

void main()
{ int a,s,b,Q=Q0,t1=0,t2=0; unsigned int t=0 ;double delay=0;
srand(time(NULL));
clrscr();
gotoxy(23,2);printf("|0        |10       |20       |30       |40     50|");
a=te3(); b=taf();
for( ; t!=36060 ;t++)
	{delay=500;while (delay--);
	if (t==a) {++t1;--Q;a+=te3();}
        if (Q==-1) {--t1;++Q;};
	if (t==b) {++t2;++Q;b+=taf();}
        if (((int)t%60)==0) {gotoxy(1,1);printf("%4d :  %4d\t\t",(t / 60),Q);for(s=0; s!=50 ;s++) printf((s>=Q)?" ":"*");};
        }
gotoxy(1,1);printf("%4d :  %4d\t\t",(t / 60),Q);for(s=0; s!=50 ;s++) printf((s>=Q)?" ":"*");
printf("\n\nafi3eis %d e3uphretiseis %d ",t2,t1) ;
getch();
}

int te3()
{ return ((int)(60*(float)rand()/RAND_MAX)+60); /*Xronos se sec*/}
int taf()
{ return ((int)(60*(float)rand()/RAND_MAX)+60); /*Xronos se sec*/}
