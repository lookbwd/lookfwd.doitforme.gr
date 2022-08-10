Program palinro(input,output);
{eisagwgi symvoloakolouthias kai elegxos an auti einai palindromiki}

var a: array [1..20] of char;
    i,j,k,l:integer;
    z: boolean;
    c:char;
    m:real;
BEGIN

    k:=0;
    l:=0;

  REPEAT

    writeln('dwse tin symvoloakolouthia');

    i:=0;

    REPEAT
      i:=i+1;         (*diavasma twn xaraktirwn tis grammis*)
      read(a[i]);
    UNTIL eoln;

    j:=1;

    REPEAT

      IF (a[j]=a[i-j+1]) THEN           {elegxos palindromisis}
      z:=true   ELSE  z:=false;
      j:=j+1

    UNTIL (j>i) or (z=false);
    writeln;
    {parousiasi apotelesmatos}
    IF (z=true) THEN writeln('einai palindromiki')
    ELSE writeln('den einai palinromiki');

    IF (z=true) THEN l:=l+1;   {timi sto l gia tin katagrafi posostou}

    writeln('thelete na eisagete kai alli symvoloakolouthia; y/n (nai/oxi)');
    readln(c);

    k:=k+1;        {timi sto k gia tin katagrafi posostou}

  UNTIL (c='n') or (c='N');

   m:=100*l/k;    {timi posostou palindromikwn symvoloakolouthiwn}
  {patousiasi tou apotelesmatos posostou}
  writeln('to pososto twn symvoloakolouthiwn pou einai palindromikes');
  writeln('apo to synolo pou eisixthisan einai');
  writeln(m:3:2,'%');

END.
 (* stin turbo tha xreiastite enter kai space meta tin eisagwgi tou kathe
 xaraktira kai 2 enter meta to telos tis symvoloakolouthias*)


