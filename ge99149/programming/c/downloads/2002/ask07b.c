/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Auti i askisi einai tou 1 leptou an afaireseis to "filiko"  */
/* user interface kai ton austiro elegxo twn pinakwn. O algo-  */
/* ri8mos tou pollaplasiasmou krubetai mesa stin sunartisi     */
/* multiplymatrix. Ola ta alla einai stin ousia froufrou ki    */
/* arwmata.                                                    */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXX 10
#define MAXY 10
#define MAXCHAR 100

int parceMatrix(char * string, double (*matrix)[MAXX][MAXY],int * Mx, int * My );
void printMatrixLine(double matrix[MAXX][MAXY],int x,int y,int yi);
void printMatrix(double matrix[MAXX][MAXY],int x, int y);
void multiplymatrix(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double (*matrixC)[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int * Cx,int * Cy);
void printMatrixSet(double matrixA[MAXX][MAXY],double matrixB[MAXX][MAXY],double matrixC[MAXX][MAXY],int Ax,int Ay,int Bx,int By,int Cx,int Cy);
int isfloat(char *string);
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

printf("We are going to calculate the matrix A * B if posible\n\n");
printf("All matrices must be in standart matlab format e.g:\n");
printf(" [ 1,2  2.2 ]\n");
printf(" | 3.2  4.2 |  is  [1.2,2.2;3.2,4.2;5.2,6.2]\n");
printf(" [ 5.2  6.2 ]\n");

do {	check=0;
        while (check != 1)
        {
                printf("\nPlease Insert matrix A:   ");
                check = scanf("%s",prompt);
                check=1;
                if (check == 1 ) check = parceMatrix(prompt,&fMatrA,&Ax,&Ay);
                if (check == 1 ) printf("A is a %d x %d matrix\n",Ay,Ax);
                printMatrix(fMatrA,Ax,Ay);
        }

        check = 0 ;
        while (check != 1)
        {
                printf("\nPlease Insert matrix B:   ");
                check = scanf("%s",prompt);
                check=1;
                if (check == 1 ) check = parceMatrix(prompt,&fMatrB,&Bx,&By);
                if (check == 1 ) printf("B is a %d x %d matrix\n",By,Bx);
                printMatrix(fMatrB,Bx,By);
        }
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


int parceMatrix(char * string, double (*matrix)[MAXX][MAXY],int * Mx, int * My )
{
        int j,i=1;
        int x = 0;
        int y = 0;
        int previousLineNumbers;
        char temp[MAXCHAR];
        char command;

        *Mx = *My = -1;

        if (string[0]!='[')
        {
                printf("Matrix definition must have [ as first digit");
                return -1;
        }

        while(i<strlen(string))
        {
                strcpy(temp,(string + i) );

                /* Find first occurance of command characters*/
                for (j = 0 ; j < strlen(temp); j++) if ((temp[j] == ',') || (temp[j] == ';') || (temp[j] == ']')) break;

                if ((temp[j] == ',') || (temp[j] == ';') || (temp[j] == ']'))
                {
                        command = temp[j];
                        temp[j]='\0';


                        if (isfloat(temp))
                        {
                                (*matrix)[x][y] = atof(temp);
                        } else
                        {
                                printf("float expected but ""%s"" found\n", temp);
                                return -1;
                        }
                        if (command==',')
                        {
                                x++;
                                if (x > MAXX - 1)
                                {
                                        printf("%d elements per line maximum\n", MAXX);
                                        return -1;
                                }
                        }

                        if (command==';')
                        {
                                y++;
                                if ( (x!=previousLineNumbers) && (y!=1) )
                                {
                                        printf("line no %d had %d elements but line no %d has %d\n", y-1,previousLineNumbers+1,y,x+1);
                                        return -1;
                                }

                                previousLineNumbers = x;
                                x=0;
                                if (y > MAXY - 1)
                                {
                                        printf("%d elements per line maximum\n", MAXY);
                                        return -1;
                                }
                        }

                        if (command==']')
                        {
                                y++;
                                if ( (x!=previousLineNumbers) && (y!=1) )
                                {
                                        printf("line no %d had %d elements but line no %d has %d\n",y-1,previousLineNumbers+1,y,x+1);
                                        return -1;
                                }

                                if (y > MAXY - 1)
                                {
                                        printf("%d elements per line maximum\n", MAXY);
                                        return -1;
                                }
                                *Mx = x + 1;
                                *My = y;
                                return 1;

                        }

                } else
                {
                        printf("; , or ] not found until end of matrix definition\n");
                        return -1;
                }

                i += j+1;
        }
        printf("] not found at the end of the matrix\n");
        return -1;
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


int isfloat(char *string)
{
        int j=0;
        int size = strlen(string);
        for (; j<size ;j++)
        {
                if (!((isdigit(string[j])) || (string[j]=='-') || (string[j]=='+') ||
                (string[j]=='e') || (string[j]=='E') || (string[j]=='.'))) return 0;
        }
        return 1;
}

int mymax(int a, int b, int c)
{
        if ((a>=b)&&(a>=c)) return a;
        if ((b>=a)&&(b>=c)) return b;
        if ((c>=a)&&(c>=b)) return c;
        return 0;
}
