/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#define Gyrw1 L[Thesi.x+1][Thesi.y]  /* Dexia 8esh */
#define Gyrw2 L[Thesi.x][Thesi.y+1]  /* Katw  8esh */
#define Gyrw3 L[Thesi.x-1][Thesi.y]  /* Arist 8esh */
#define Gyrw4 L[Thesi.x][Thesi.y-1]  /* Panw  8esh */
typedef struct {int x,y;} Point;

void Thiseas(Point);
int L[80][23];
int mino;
int maxx,maxy;

void main()
{ int x=0,y=0,Temp={0}; FILE *LFile;  Point P;
clrscr();
LFile=fopen("Labi.txt","rt");
while ((Temp=fgetc(LFile))!=EOF) {if (Temp=='\n') {maxx=x;y++;x=0;}
				else {L[x++][y]=Temp;}
			}
maxy=y+1;
fclose(LFile);
for (y=0 ;y!=maxy;y++){ for (x=0 ;x!=maxx;x++) printf((L[x][y]=='T')?"\001":"%c", L[x][y]); printf("%c",'\n');}
P.x=1;P.y=1;
Thiseas(P);
gotoxy(2,2);printf("S");
gotoxy(1,23);
printf("\nLabyrin8os %dx%d",maxx,maxy);
printf("\nEimai o 8hseas kai Brhka %d minotauro(us)",mino);
getch();
}

void Thiseas(Point Thesi)
{ extern int L[80][23]; Point P; double delay; extern int mino;
gotoxy(Thesi.x+1,Thesi.y+1);printf("S");
delay=3000000;while (delay--);
if (L[Thesi.x][Thesi.y]=='M') {mino++; L[Thesi.x][Thesi.y]='D';gotoxy(Thesi.x+1,Thesi.y+1);printf("D");}
else {L[Thesi.x][Thesi.y]='.';gotoxy(Thesi.x+1,Thesi.y+1);printf("%c",((Thesi.x==1)&&(Thesi.y==1)) ? 'a' : '.');};
if ((Gyrw1==' ') || (Gyrw2==' ') || (Gyrw3==' ') || (Gyrw4==' ') || (Gyrw1=='M')||(Gyrw2=='M')||(Gyrw3=='M')||(Gyrw4=='M'))
       {if ((Gyrw1==' ')||(Gyrw1=='M')) {P.x=Thesi.x+1; P.y=Thesi.y; Thiseas(P);}
        if ((Gyrw2==' ')||(Gyrw2=='M')) {P.x=Thesi.x; P.y=Thesi.y+1; Thiseas(P);}
        if ((Gyrw3==' ')||(Gyrw3=='M')) {P.x=Thesi.x-1; P.y=Thesi.y; Thiseas(P);}
	if ((Gyrw4==' ')||(Gyrw4=='M')) {P.x=Thesi.x; P.y=Thesi.y-1; Thiseas(P);}
     	}
if (L[Thesi.x][Thesi.y]!='D') {gotoxy(Thesi.x+1,Thesi.y+1);printf(" ");}
delay=3000000;while (delay--);
return;
}
