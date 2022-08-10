/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Ta3inomisi me dunamikes listes...Must gia tis e3etaseis kai */
/* sigoura ena programma pou 8elei arketi douleia mexri na     */
/* doulepsei kala.                                             */

#include <stdio.h>

typedef struct DMTemp {
    struct DMN * next;
    int data;
} DMN;  /* Dynamic Matrix Node */

void insertNode(DMN ** DMTHead,int newInt)
{
    DMN * newElement;
    newElement = (DMN *) malloc( sizeof(DMN) );
    newElement->next = *DMTHead;
    newElement->data = newInt;
    *DMTHead = newElement;
}

void insertNodeBetween(DMN * DMTPrevious,DMN * DMTNext,int newInt)
{
    DMN * newElement;
    newElement = (DMN *) malloc( sizeof(DMN) );
    newElement->next = DMTNext;
    newElement->data = newInt;
    DMTPrevious->next = newElement;
}

void AddBeforeGreater(DMN **SortList,int sourceData)
{
    DMN * DestinationPointer;
    DMN * Previous;

    if (*SortList==NULL)
    {
    printf(". %d inserted because empty list-\n",sourceData);
        insertNode(SortList,sourceData);
        return;
    }

    if ((*SortList)->data > sourceData)
    {
    printf(". %d inserted as root-\n",sourceData);
        insertNode(SortList,sourceData);
        return;
    }

    Previous = *SortList;
    DestinationPointer = Previous->next;
    while (DestinationPointer != NULL)
    {
        if (DestinationPointer->data > sourceData)
        {
            printf(". %d inserted between two other nodes-\n",sourceData);
            insertNodeBetween(Previous,DestinationPointer,sourceData);
            return;
	}
        Previous = DestinationPointer;
        DestinationPointer = DestinationPointer->next;
    }
    printf(". %d inserted at the end of the list-\n",sourceData);
    insertNodeBetween(Previous,NULL,sourceData);
}

void sortlist(DMN **SortList,DMN * DMHead)
{
    DMN * SourcePointer = DMHead;
    while (SourcePointer!=NULL)
    {
        AddBeforeGreater(SortList,SourcePointer->data);
        SourcePointer = SourcePointer->next;
    }
}

void printVector(DMN *DMTHead)
{
    if (DMTHead != NULL)          /* Do not print head data but return */
    {
        printVector(DMTHead->next);     /* Go one level inner */
        /* Command bellow will be executed after reaching the */
        /* last element of array wich was imported first      */
        printf("%d\t",DMTHead->data);
    }
}


int main(void)
{
    DMN * DMHead = NULL;
    DMN * SortList = NULL;
    int tempNumber;
    char choise[30];

    do
    {
    printf("Please write some integers to add in list and then a character to terminate\n\n");
    while (scanf("%d",&tempNumber)==1)
    {
        insertNode(&DMHead, tempNumber);
    }

    printf("\nPrinting unsorted vector:\n");
    printVector(DMHead);
    printf("\n\n");

    sortlist(&SortList,DMHead);

    printf("\nPrinting sorted vector:\n");
    printVector(SortList);

    printf("\n\nDo You want to try some other numbers? (Y/N):  ");
    fflush(stdin);
    scanf("%30s",choise);

    } while ((choise[0]!='N')&&(choise[0]!='n'));
}
