program klasmata (input,output);

     (* Any praxi between two fractions*)

     var a,b,c,d,e,f,p,r:integer;g:real;
     pra:char;

begin
    writeln;writeln;
    writeln ('               PRAXIS METAXI KLASMATON');  writeln;  writeln;
    write ('Give the arithmiti of the first fraction      :');  readln (a);
    while ((a>=10) or (a<0)) do
           begin
           write ('The number must be between 0-9.Give number again  :');
           readln (a);end;
    write ('Give the paranomasti of the first fraction    :');  readln (b);
    while ((b>=10) or (b<=0)) do
           begin
           write ('The number must be between 1-9.Give number again  :');
           readln (b);end;

    write ('Give the arithmiti of the second fraction     :');  readln (c);
    while ((c>=10) or (c<0)) do
           begin
           write ('The number must be between 0-9.Give number again  :');
           readln (c);end;
    write ('Give the paranomasti of the second fraction   :');  readln (d);
    while ((d>=10) or (d<=0)) do
           begin
           write ('The number must be between 1-9.Give number again  :');
           readln (d);end;
    write ('Give the praxi                                :'); readln (pra);
    while ((pra<>'+') and (pra<>'-') and (pra <>'*') and (pra<>'/')) do
           begin
           write ('Praxi must be  +,-,*,/. Give praxi again          :');
           readln (pra);end;
    if ((pra='/') and (c=0)) then
    while (c=0) do
           begin
           write ('You have to give the arithmiti of the second ');
           write ('fraction again because praxi is /.   Arithmiti      :');
           readln (c);end;
  case pra of
  '+': begin
       e:=a*d+c*b;
       f:=b*d;end;
  '-': begin
       e:=a*d-c*b;
       f:=b*d;end;
  '*': begin
       e:=a*c;
       f:=b*d;end;
  '/': begin
       e:=a*d;
       f:=b*c;end;end;
  g:=e/f;
  begin
  p:=e;r:=f;
  while (p>0) and (r>0) do
  if p>=r then p:=p mod r else r:=r mod p;end;
  e:=e div (p+r);
  f:=f div (p+r);
  writeln( a,'   ',c,'    ',e);
  writeln('- ',pra,' -  = -- =',g:5:3);
  writeln( b,'   ',d,'    ',f);
  end.