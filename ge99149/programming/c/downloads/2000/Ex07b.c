/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2000 */
#include <stdio.h>
#include <conio.h>

main()
{
char a; int s=0,i,b[1000]; FILE *In;
	In=fopen("Out.txt","rt");
	for(i=0 ; (a=fgetc(In))!='\n' ; i++ ) b[i]=a;
        while (i--) {if (fgetc(In)!=b[i]) s=1;}
       	printf(s ? "File Not OK" : "File OK");
        fclose(In);
}