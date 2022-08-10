program power4 (input, output);
 var a,b,c,d,i,number: integer;
     pwr: array[0..9] of integer; { lookup table for 4th powers }
     l1000: array[0..9] of integer; { lookup tables for multiples of 1000,100,10 }
     l100: array[0..9] of integer; 
     l10: array[0..9] of integer;
begin
 for i:=0 to 9 do pwr[i]:=i*i*i*i; { initialize lookup tables }
 l10[0]:=0; for i:=1 to 9 do l10[i]:=l10[i-1]+10;
 l100[0]:=0; for i:=1 to 9 do l100[i]:=l100[i-1]+100;
 l1000[0]:=0; for i:=1 to 9 do l1000[i]:=l1000[i-1]+1000;
 for a:=1 to 9 do { main loop }
  for b:=0 to 9 do
   for c:=0 to 9 do
    for d:=0 to 9 do
 begin
     number:=l1000[a]+l100[b]+l10[c]+d;
     if (pwr[a]+pwr[b]+pwr[c]+pwr[d])=number then writeln(number);
 end;
end.


