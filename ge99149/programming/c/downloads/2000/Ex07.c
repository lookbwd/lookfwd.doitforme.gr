/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <conio.h>
#define MAX_LEN 1000
typedef struct stack { char s[MAX_LEN];
		       int top;
		       } stack;
typedef enum {false, true} boolean;

void reset (stack *stk)
{ stk->top=0;}
void push  (char c, stack *stk)
{ stk->s[stk->top]=c; stk->top++;}
char pop   (stack *stk)
{char a; a=(stk->s[--(stk->top)]); return a;}
boolean	empty (const stack *stk)
{ return (stk->top ? false : true);}
boolean	full (const stack *stk)
{ return ((stk->top==MAX_LEN) ? true : false);}

main()
{
int a; stack Sta; FILE *Out;
	clrscr();
	printf("\nWrite String Plz : ");
        Out=fopen("out.txt","wt");
        reset(&Sta);
	while ((!full(&Sta))&&(a!=0x0D))  { push(a=getche(),&Sta); if (a!=0x0D) fputc(a,Out);}
	pop(&Sta);fputc('\n',Out); printf("\n                 : ");
        while (!empty(&Sta)) {printf("%c",a=pop(&Sta)); fputc(a,Out);};
	fputc('\n',Out); fclose(Out);
}