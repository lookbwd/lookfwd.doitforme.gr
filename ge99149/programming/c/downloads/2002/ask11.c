/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* I stiba einai mia akoma askisi pou exei ws skopo na         */
/* tromokratisei mias kai gia alli mia fora o kwdikas einai    */
/* elaxistos kai polu tupopoiimenos. To sugkekrimeno programma */
/* grafei to apotelesma kai se arxeio.                         */

#include <stdio.h>
#include <stdlib.h>
#include <curses.h>

typedef struct stack { char StackArray[100];
		       int top;
		       } Stack;


void InitStack (Stack * stk)
{
    stk->top=0;
}

void push  (Stack * stk, char c)
{ 
    stk->StackArray[stk->top]=c;
    stk->top++;
}

char pop   (Stack * stk)
{
    char a;
    a = (stk->StackArray[--(stk->top)]);
    return a;
}

int empty (const Stack * stk)
{
    return (stk->top ? 0 : 1);
}

int full (const Stack * stk)
{
    return (stk->top == 100);
}

main()
{
int a; Stack Sta; FILE *Out;

    printf("\nWrite String Plz : ");
    Out = fopen("out.txt","wt");
    InitStack(&Sta);
    while ( ( !full(&Sta) ) && ( a!='\n' ) )
    {
        push(&Sta, a = getchar());
        if (a!=0x0D) fputc(a,Out);
    }
    pop(&Sta);
    fputc('\n',Out); 
    printf("                 : ");
    while (!empty(&Sta))
    {
        a = pop(&Sta);
        putchar(a);
        fputc(a,Out);
    }
    fputc('\n',Out);
    printf("\n");
    fclose(Out);
}
