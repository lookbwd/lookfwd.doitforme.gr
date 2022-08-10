program numpow (input,output);

      var e:array [0..9] of integer;
      i,a,b,c,d:integer;

begin
  for i:=0 to 9 do
  e[i]:=sqr(sqr(i));
  for i:=1000 to 9999 do
    begin
    a:=i div 1000;
    b:=(i div 100)-(10*a);
    c:=(i div 10)-(10*b)-(100*a);
    d:=i-(10*c)-(100*b)-(1000*a);
    if (e[a]+e[b]+e[c]+e[d])=i then writeln (i);
    end;
  writeln;
end.

