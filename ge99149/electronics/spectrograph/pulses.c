#include <dos.h>
#include <string.h>

#define PORTADDRESS 0x378  /* Enter Your Port Address Here */

#define DATA PORTADDRESS+0
#define STATUS PORTADDRESS+1
#define CONTROL PORTADDRESS+2


/*	Generates pulse sequence for HAMAMATSU C2334	*/
/*	 Clock is DATA0(Pin2), Start is DATA1(Pin3) 	*/
/*		    GND are pins 18...25 		*/


void main(void)
{
 int count;

 while (1) {
 for (count = 0; count <= 38; count++)
  {
  outportb(DATA, inportb(DATA) | 0x02);
  delay(1);
  outportb(DATA, inportb(DATA) & 0xFD);
  delay(1);
  }
  outportb(DATA, inportb(DATA) | 0x01);
  delay(1);
  outportb(DATA, inportb(DATA) & 0xFE);
  }
}