program calculator(input,output);
   {prosthesi klasmatwn}
   var a,b,c,d,e,f:integer;
      h:real;
      g:char;
begin
  writeln('tha kanw prakseis klasmatwn');
  write('dose ton arithmiti tou prwtou klasmatos:');
  read(a);readln;
  write('dose ton paranomasti tou prwtou klasmatos:');
  read(b);readln;
  write('dose ton arithmiti tou deuterou klasmatos:');
  read(c);readln;
  write('dose ton paranomasti tou deuterou klasmatos:');
  read(d);readln;
  write('dose to simbolo tis arithmitikis praxis +,-,*,/:');
  read(g);readln;
 if (b*d=0) or (abs(a)>9) or (abs(b)>9) or (abs(c)>9) or (abs(d)>9)
    then write('den einai dinati i praxi')
 else begin
  if g='+' then begin
  e:=a*d+c*b;
  f:=b*d;
  h:=e/f;
  writeln(a,'/',b,'+',c,'/',d,'=',e,'/',f,'=',h:4:3);
  end;
  end;
  if g='-' then begin
  e:=a*d-c*b;
  f:=b*d;
  h:=e/f;
  writeln(a,'/',b,'-',c,'/',d,'=',e,'/',f,'=',h:4:3);
  end;
  if g='*' then begin
  e:=a*c;
  f:=b*d;
  h:=e/f;
  writeln(a,'/',b,'*',c,'/',d,'=',e,'/',f,'=',h:4:3);
  end;
  if g='/' then begin
  if c=0 then write('o arithmitis tou deuterou klasmatos den prepei
     na einai miden')
   else begin
   e:=a*d;
   f:=b*c;
   h:=e/f;
   writeln(a,'/',b,'/',c,'/',d,'=',e,'/',f,'=',h:4:3);
   end;
   end;
end.