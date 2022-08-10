
Program addcl(input,output);
  {eisagwgi arithmitwn, paronomastwn 2 klasmatwn kai prosthesi tous}

 (*dilwseis metavlitwn*)
var a,b,c,d,k,l:integer;

 (*kyrio meros tou programmatos*)
BEGIN
  writeln('dwste ta dedomena gia tin prosthesi twn klasmatwn');  (*typwnei stin othoni oti vrisketai mesa sta '' kata to
  tre3imo*)
  writeln('dwste ton arithmiti tou 1ou klasmatos');
  readln(a); (*eisagei to dedomeno a*)
  writeln('twra ton paronomasti tou 1ou');
  readln(b);
  writeln('dwste ton arithmiti tou 2ou');
  readln(c);
  writeln('kai twra ton paronomasti tou 2ou');
  readln(d);
  k:=a*d+c*b;  (*entoli anathesis stin opoia i metavliti k pairnei tin timi tou zitoumenou arithmiti*)
  l:=b*d;  (*paronomastis tou zitoumenou klasmatos*)
  writeln(a,'/',b,'+',c,'/',d,'=',k,'/',l,'  ','to vrika, eimai & grigoros!!!'); (*typwsi tou apotelesmatos*)
END.



