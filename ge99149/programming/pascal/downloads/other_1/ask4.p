program ask4(input,output);
var a1,a2,a3,a4,k,l,i:integer;a:array[1000..9999] of integer;
begin
  writeln('evresi ton tetrapsifion akeraion pou einai isoi me to athroisma',
          'ton psifion tous,ypsomena stin tetarti dinami');
  writeln;
  write('oi arithoi pou einai isoi me to athroisma ton psifion tous',
         'ypsomena stin tetarti dynami einai oi:');
  for i:=1000 to 9999 do
   begin
     a4:=i mod 10;k:=i div 10;
     a3:=k mod 10;l:=k div 10;
     a2:=l mod 10;a1:=l div 10;
     if (i=sqr(sqr(a1)) + sqr(sqr(a2)) + sqr(sqr(a3)) + sqr(sqr(a4))) then
     begin
     a[i]:=i;
     write(a[i],' ');
     end;
   end;
   writeln;
   writeln('patise enter gia telos');
   readln;
   writeln;
end.