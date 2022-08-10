program a3b(input, output);

var a,b,c,d,e,f : integer; value:real;
    praxi,again : char;

procedure simplify(var x,y:integer);
 var i,j: integer;
begin
 i:=abs(x); j:=abs(y);
 while (i>0) and (j>0) do if i>=j then i:=i mod j else j:=j mod i;
 x:=x div (i+j); y:=y div (i+j);
end;

procedure inputnum(text: string; nozero: boolean; var dest:integer);
 var fail: boolean;
begin
 repeat
  write(text); read(dest); readln; fail:=false;
  if abs(dest)>9 then begin
   writeln('O ari8mos prepei na einai monopshfios akeraios ! Dokimase pali ...');
   fail:=true; end;
  if nozero and (dest=0) then begin
   writeln('O paronomasths de mporei na einai mhden ! Dokimase pali ...');
   fail:=true; end;
  until fail=false
end;

procedure greeting;
begin
 writeln('***********************************');
 writeln('**    Pra3eis me klasmata        **');
 writeln('***********************************'); writeln;
end;

procedure get_data;
 var ok: boolean;
begin
 inputnum('Ari8mhths tou 1ou klasmatos : ',false,a);
 inputnum('Paronomasths tou 1ou klasmatos : ',true,b);
 inputnum('Ari8mhths tou 2ou klasmatos : ',false,c);
 inputnum('Paronomasths tou 2ou klasmatos : ',true,d); writeln;
 repeat
  write('Symbolo ths pra3hs pou 8a ginei (+,-,*,/) : ');
  read(praxi); readln; ok:=true;
  if not ((praxi='+') or (praxi='-') or (praxi='*') or (praxi='/')) then begin
   writeln('La8os symbolo pra3hs ! Dokimase 3ana ...'); ok:=false; end;
 until ok=true
end;

procedure show;
begin
simplify(e,f);
value:=e/f;
writeln(a,'/',b,praxi,c,'/',d,'=',e,'/',f,'=',value:5:3);
end;

procedure calculate;
begin
case praxi of
     '+': begin e:=a*d+b*c; f:=b*d; show; end;
     '-': begin e:=a*d-b*c; f:=b*d; show; end;
     '*': begin e:=a*c; f:=b*d; show; end;
     '/': if c<>0 then begin e:=a*d; f:=b*c; show; end
                  else writeln('H diairesh de mporei na ginei!');
end;
end;

begin
greeting;
repeat
  get_data;
  calculate;
  writeln; write('Na 3anatre3ei to programma ? (y/n) :');
  read(again); readln;
until again<>'y'
end.