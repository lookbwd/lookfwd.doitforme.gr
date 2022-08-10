/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>

typedef struct {char S[10];} String;
typedef struct {int Co, Pl ;} Apot;

int Computer();
int Player();
int Apotelesma(Apot Apote);

main()
{ String *Card,*RAM; Apot Apote;  int Buf1,Buf2,Sum[3]={0};
Card=RAM=malloc(6*sizeof(String));
strcpy(Card++,"Petra");strcpy(Card++,"Psalidi");strcpy(Card++,"Xarti");strcpy(Card++,"U Win");strcpy(Card++,"U Lose");strcpy(Card,"Equals");
clrscr();
gotoxy(1,25);printf("Dwse : \t0->Petra\t1->Psalidi\t2->Xarti\tX->Exit");
gotoxy(65,1);printf("W:%d L:%d E:%d",Sum[0],Sum[1],Sum[2]);
srand(time(NULL));
window(1,1,80,21);
while (1==1)
{ cprintf("%s", Card=(RAM+(Apote.Pl=Player(Sum))) );
  sleep(1);
  cprintf("\r\nComputer : %s", Card=(RAM+(Apote.Co=Computer() )));
  ++Sum[(Apotelesma(Apote)-3)];
  cprintf("\r\n-- %s --     \r\n\r\n",Card=(RAM+Apotelesma(Apote)));
  Buf1=wherex();Buf2=wherey();gotoxy(65,1);printf("W:%d L:%d E:%d",Sum[0],Sum[1],Sum[2]);gotoxy(Buf1,Buf2);
}}

int Computer()
{ return (rand()%3) ;}
int Player(int *Sum)
{ cprintf("Paikths  : ");
while (1==1) switch (getch()) {case '0' :return 0;
 		   case '1' : return 1;
                   case '2' : return 2;
                   case 'x' :
                   case 'X' : {window(1,1,80,25);clrscr();gotoxy(24,1);printf((Sum[0]+Sum[1]+Sum[2]) ? "-- Thank U For Playing --\n" : "-- Thank U For Not Playing --\n" );exit(1); }
                   default  : ;
		   }
}
int Apotelesma(Apot Apote)
{ if (Apote.Co==0 && Apote.Pl==0 ) return 5 ;
  if (Apote.Co==0 && Apote.Pl==1 ) return 4 ;
  if (Apote.Co==0 && Apote.Pl==2 ) return 3 ;
  if (Apote.Co==1 && Apote.Pl==0 ) return 3 ;
  if (Apote.Co==1 && Apote.Pl==1 ) return 5 ;
  if (Apote.Co==1 && Apote.Pl==2 ) return 4 ;
  if (Apote.Co==2 && Apote.Pl==0 ) return 4 ;
  if (Apote.Co==2 && Apote.Pl==1 ) return 3 ;
  if (Apote.Co==2 && Apote.Pl==2 ) return 5 ;}
