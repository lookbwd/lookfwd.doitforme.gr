/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <dos.h>
#include <math.h>
#define	eps	0.000000000000001

double	root (double (*)(double),double a, double b);
double	min(double a,double b);
double	max(double a,double b);
double	p(double x);

main() {
double a,b,c;
printf ("\nDwse to panw kai katw orio gia thn aneureh rizas  : ");
do {  	scanf ("%lf%lf",&a,&b); if (a==b) 	    printf("a <> b     "); if ((p(a)*p(b))>=0) printf("f(a)*f(b)<0");} while ((a==b)||((p(a)*p(b))>=0)) ;
c=root( p,min(a,b),max(a,b)) ;
printf ("root: %.20f value: %.20f\n",c ,p(c)) ;
sleep(5);
return 0;
}

double	root (double f(double),double a, double b)
	{ double m=((a/2)+(b/2));
	if (fabs(f(m))<= eps)	return m;
			else	return ( (p(a)*p(m)<0) ?  root(f,a,m) : root(f,m,b) ); }
double	p(double x)	{ return ( (pow(x,5)) - (7*x) -3 ); }
double	min(double a,double b) {return (a<b ? a : b);}
double	max(double a,double b) {return (a>b ? a : b);}
