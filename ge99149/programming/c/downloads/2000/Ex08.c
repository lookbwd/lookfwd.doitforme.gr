/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#define  Max 15

typedef struct {char *Le3h[Max]; struct Lexicon *arist,*de3ia;} Lexicon;

int fileopen(Lexicon *);            /*Anoigma arxeiou Words.txt kai dhmiourgia dentrou*/
void TreeView(Lexicon *);           /*Anagnwsh dentrou kai emfanish stoixiwn*/
int TreeCreate(char [],Lexicon *);  /*Anadromikh sunarthsh dhmiourgias dentrou*/
void ScanWord(Lexicon *);           /*Eisagwgh kai apo8hkeush neas le3hs*/

void main()
{ int WordNo; Lexicon *Root; int command;
clrscr();
Root=malloc(sizeof(Lexicon));
WordNo=fileopen(Root);
printf("W gia eisagwgh le3hs, V gia epidei3h lista, X gia e3odo\n");
window(1,3,80,25);
while (((command=getch())!='x')&&(command!='X'))
{clrscr();
if (command=='v'||command=='V') {TreeView(Root);printf("\n");}
if (command=='w'||command=='W') {ScanWord(Root);printf("OK!\n");}
}
clrscr();printf("Bye!!");
}

void ScanWord(Lexicon *Root)
{ char CurWord[Max];FILE *Words;int a;
printf ("Dwse mia le3h : ");
scanf("%s",&CurWord);
if (TreeCreate(CurWord,Root)) {Words=fopen("Words.txt","at");fputs(CurWord,Words);fputc('\n',Words);fclose(Words);}
}

int fileopen(Lexicon *Root)
{ int Temp,WordNo=1,CharNo=0; FILE *Words; char CurWord[Max]={''};
Words=fopen("Words.txt","rt");
while ((Temp=fgetc(Words))!=EOF)
	{
	if (Temp=='\n') {if (WordNo==1) {strcpy(Root->Le3h,CurWord);Root->arist=Root->de3ia=NULL;}
        			else TreeCreate(CurWord,Root);
	WordNo++;while ((CharNo--)-1) CurWord[CharNo]='';}
	else CurWord[CharNo++]=Temp;
        }
fclose(Words);return WordNo;
}

int TreeCreate(char CurWord[Max],Lexicon *Root)
{int temp;
if ((temp=strcmp(Root->Le3h,strlwr(CurWord)))==0) {printf("h le3h yparxei\t");return 0;}
 else {if (temp>0) {
 		if (Root->arist==NULL)
                	{Root->arist=malloc(sizeof(Lexicon));
                        Root=(Root->arist);strcpy(Root->Le3h,CurWord);Root->arist=Root->de3ia=NULL;}
                else  return TreeCreate(CurWord,Root->arist);}
	else	{
 		if (Root->de3ia==NULL)
                	{Root->de3ia=malloc(sizeof(Lexicon));
                        Root=(Root->de3ia);strcpy(Root->Le3h,CurWord);Root->arist=Root->de3ia=NULL;}
                else  return TreeCreate(CurWord,Root->de3ia);}
        }
return 1;
}

void TreeView(Lexicon *Root)
{ if (Root->arist!=NULL) TreeView(Root->arist);
printf("%10s\t",Root->Le3h);
if (Root->de3ia!=NULL) TreeView(Root->de3ia);
}
