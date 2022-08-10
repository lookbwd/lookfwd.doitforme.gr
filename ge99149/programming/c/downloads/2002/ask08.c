/* Dimitris Kousis-Loukas (http://users.ntua.gr/ge99149) @2002 */
/* Alloi exoun to onoma kai alloi exoun tin xari...            */
/* Mia askisi me ekfwnisi pou mporei na tromokratisei ton      */
/* ka8ena mas kai telika lunetai mesa se 10 grammes!           */

#include <stdio.h>

#define maxstates 4 /* O ari8mos twn katastasewn tou automatou*/

main()
{
int state=0;
char statchar[maxstates]="AEOI";  /* ta grammata tou automatou */
int ch;

while (ch!=10 && state<maxstates) {
	/* To 10 einai to noumero tou <enter> */
	ch = getchar();
	if ( ch==statchar[state] ) state++;
	/* An to gramma einai swsto, proxwra stin epomeni katastasi*/
	}

if (state == maxstates) printf("This string was OK\n");
		else printf("This string was NOT OK\n");
}
