/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Basismeni stin askisi 10 i askisi auti einai paixnidi. An   */
/* paratirisete oles oi ousiastikes sunartiseis einai idies.   */

#include <stdio.h>
#include <string.h>
#define MAX_WORD_LENGTH 20

typedef struct DMTemp {
    struct CL * next;
    char data[MAX_WORD_LENGTH];
    int frequency;
} CL;  /* Conected List */

void insertNode(CL ** CLHead,char * newword)
{
    CL * newElement;
    newElement = (CL *) malloc( sizeof(CL) );
    newElement->next = *CLHead;
    strcpy(newElement->data,newword);
    newElement->frequency = 1;
    *CLHead = newElement;
}

void printVector(CL *CLHead,int i)
{
    if (CLHead != NULL)
    {   if (i<3)
        {
            printf("%11s : %d  ",CLHead->data, CLHead->frequency);
            i++;
        }
        else
        {
            i=0;
            printf("%11s : %d\n",CLHead->data, CLHead->frequency);
        }
        printVector(CLHead->next,i);
    }
}

void addWord(CL **CLHead,char *word)
{
    /* This function is exactly like printVector above    */
    /* It traverses the list and if it find matching word */
    /* it increases frequency else it adds new word       */

    if ( (*CLHead) != NULL )
    {
        if (strcmp(word,(*CLHead)->data))
        {
    /* Word doesn't match some existing into list: check next node */
            addWord(&((*CLHead)->next),word);
	} else
        {
    /* Word match some existing into list: increase frequency */
            ((*CLHead)->frequency)++;
	}
    } else
    {
    /* Reached end of the list and word not found: Add new word */
        insertNode(CLHead,word);
    }
}

int main(void)
{
    CL * CLHead = NULL;
    char word[MAX_WORD_LENGTH];
    int check;
    FILE *In;

    In = fopen("text.txt","rt");

    check=1;
    while (check==1)
    {
        check = fscanf(In,"%s",word);
        if (check==1)
	{
            addWord(&CLHead,word);
        }
    }
    fclose(In);

    printVector(CLHead,0);
}
