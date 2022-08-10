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
int Thiseas();
int L[80][23];
int mino=0;
int maxx,maxy;

void main()
{ int x=0,y=0,Temp={0}; FILE *LFile;  Point P;
clrscr();
LFile=fopen("Labi.txt","rt");
while ((Temp=fgetc(LFile))!=EOF) {if (Temp=='\n') {maxx=x;y++;x=0;}
				else {L[x++][y]=Temp;} if (Temp=='M') ++mino;
			}
maxy=y+1;
fclose(LFile);
for (y=0 ;y!=maxy;y++){ for (x=0 ;x!=maxx;x++) printf((L[x][y]=='T')?"\001":"%c", L[x][y]); printf("%c",'\n');}
P.x=1;P.y=1;
gotoxy(1,24);
printf("Labyrin8os %dx%d",maxx,maxy);
while (Thiseas());
if (!mino) {gotoxy(2,3);printf(" ");gotoxy(2,2);printf("S");gotoxy(1,25);printf("U Win!!!                                     ");}
getch();
}

int Thiseas()
{ extern int L[80][23]; static Point P={1,1},R; double delay; extern int mino;
gotoxy(P.x+1,P.y+1);printf("S");R=P;
switch (getch()) { case '5' : { if(L[P.x][P.y+1]!='T') ++P.y; break;}
        	   case '8' : { if(L[P.x][P.y-1]!='T') --P.y; break;}
                   case '6' : { if(L[P.x+1][P.y]!='T') ++P.x; break;}
                   case '4' : { if(L[P.x-1][P.y]!='T') --P.x; break;}
		   case 'x' :
		   case 'X' : return 0;}
if ((P.x==1)&&(P.y==1)) if (mino) {gotoxy(1,25);printf("Menoun akoma %d minotauroi  ",mino);} else return 0;
if (L[R.x][R.y]=='M') {gotoxy(1,25);printf("Menoun akoma %d minotauroi  ",mino-1);--mino; L[R.x][R.y]='D';gotoxy(R.x+1,R.y+1);printf("D");}
else {gotoxy(R.x+1,R.y+1);printf("%c",((R.x==1)&&(R.y==1)) ? 'a' : ' ');};
if (!mino) {gotoxy(1,25);printf("Prepei na gyriseis sthn arxh!            ");}
return 1;
}
