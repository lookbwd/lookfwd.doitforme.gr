/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Epidi i alli ekdwsi tou programmatos paraeinai advanced, na */
/* kai mia pio apli ekdoxi tou pollaplasiasmou pinakwn         */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXX 10
#define MAXY 10
#define MAXCHAR 100

int InsertMatrix(char * name,double (*matrix)[MAXX][MAXY],int * Mx, int * My );
void printMatrixLine(double matrix[MAXX][MAXY],int x,int y,int yi);
void printMatrix(double matrix[MAXX][MAXY],int x, int y);
void multiplymatrix(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double (*matrixC)[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int * Cx,int * Cy);
void printMatrixSet(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double matrixC[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int Cx,int Cy);
int mymax(int a, int b, int c);

int main(void)
{

char prompt[MAXCHAR] = "";
int  Ax,Ay,Bx,By,Cx,Cy;
double fMatrA[MAXX][MAXY];
double fMatrB[MAXX][MAXY];
double fMatrC[MAXX][MAXY];
int check;
int i;

printf("We are going to calculate the matrix A * B if posible");

do {	InsertMatrix("A",&fMatrA,&Ax,&Ay);
        InsertMatrix("B",&fMatrB,&Bx,&By);

        if ((Ax!=By)&& (!((Ax==1)&&(Ay==1) || (Bx==1)&&(By==1)))) printf("\n%d x %d and %d x %d matrices can not be multiplied",Ay,Ax,By,Bx);
        else
        {       printf("\nCalculating...");
                multiplymatrix(fMatrA,fMatrB,&fMatrC,Ax,Ay,Bx,By,&Cx,&Cy);
                printf("\nResult is a %d x %d matrix.\n\n",Cy,Cx);
                printMatrixSet(fMatrA,fMatrB,fMatrC,Ax,Ay,Bx,By,Cx,Cy);
        }

        printf("\nDo you want to try another pair of matices? (Y/N) ");
        scanf("%s",prompt);
        } while ((prompt[0]!='N') && (prompt[0]!='n'));
	return 1;
}

int InsertMatrix(char * name,double (*matrix)[MAXX][MAXY],int * Mx, int * My )
{
    int check = 0 ;
    int i,j;
    float tempFloat;
    printf("\n");
    while (check != 1)
    {
        printf("\nHow many rows do you want matrix %s to have? :   ",name);
        fflush(stdin);
        check = scanf("%d",My);
        if (check!=1) continue;
        printf("How many columns do you want matrix %s to have? :   ",name);
        fflush(stdin);
        check = scanf("%d",Mx);
        if (check!=1) continue;
        if ((*Mx<0)||(*My<0)||(*Mx>MAXX)||(*My>MAXY))
        {
            check = 0;
            continue;
	}
        check = 1;
    }
    for (j=0 ; j < *My ; j++)
    for (i=0 ; i < *Mx ; i++)
    {
    check = 0;
        while (check != 1)
        {
            printf("Please enter: %s[%d][%d]:   ",name,j+1,i+1);
            fflush(stdin);
            check = scanf("%f",&tempFloat);
        }
        (*matrix)[i][j] = (double)tempFloat;
    }

}


void printMatrixSet(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double matrixC[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int Cx,int Cy)
{

int yi;
int maxy = mymax(Ay,By,Cy);
for (yi=0; yi < maxy; yi++)
        {
                printMatrixLine(matrixA,Ax,Ay,yi);
                if (yi == (int) (maxy/2-0.1) ) printf(" * "); else printf("   ");
                printMatrixLine(matrixB,Bx,By,yi);
                if (yi == (int) (maxy/2-0.1) ) printf(" = "); else printf("   ");
                printMatrixLine(matrixC,Cx,Cy,yi);
                printf("\n");

        }
}

void printMatrix(double matrix[MAXX][MAXY],int x,int y)
{
int yi;
for (yi=0; yi < y; yi++)
        {
                printMatrixLine(matrix,x,y,yi);
                printf("\n");
        }
}

void printMatrixLine(double matrix[MAXX][MAXY],int x,int y,int yi)
{
int xi,nulcount;
if (yi<y)
{
if ((yi == y-1)||(yi == 0)) printf("[ "); else printf("| ");
for (xi=0; xi < x; xi++)
        {
                printf("%4.1f ",matrix[xi][yi]);
        }
if ((yi == y-1)||(yi == 0)) printf("]"); else printf("|");
} else for(nulcount=0;nulcount<(3+(5*x));nulcount++) printf(" ");
}

void multiplymatrix(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double (*matrixC)[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int * Cx,int * Cy)
{
int yi,xi,count;

/* Two cases of scalar * matrix */
if ((Ax==1)&(Ay==1))
{
for (xi=0; xi<Bx ; xi++) for (yi=0; yi<By ; yi++) (*matrixC)[xi][yi] = matrixA[0][0] * matrixB[xi][yi];
*Cx=Bx;
*Cy=By;
return;
}

if ((Bx==1)&(By==1))
{
for (xi=0; xi<Ax ; xi++) for (yi=0; yi<Ay ; yi++) (*matrixC)[xi][yi] = matrixB[0][0] * matrixA[xi][yi];
*Cx=Ax;
*Cy=Ay;
return;
}

/* The main matrix * matrix routine */

for (yi=0; yi<Ay; yi++)
for (xi=0; xi<Bx; xi++)
{
        (*matrixC)[xi][yi]=0;
        for (count=0; count<Ax; count++)
        {
                (*matrixC)[xi][yi] += matrixA[count][yi] * matrixB[xi][count];
        }
}
*Cy=Ay;
*Cx=Bx;
}

int mymax(int a, int b, int c)
{
        if ((a>=b)&&(a>=c)) return a;
        if ((b>=a)&&(b>=c)) return b;
        if ((c>=a)&&(c>=b)) return c;
        return 0;
}
