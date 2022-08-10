program magic_squares(input,output);
 var n: integer; again: char;
     s: array[1..9,1..9] of integer;

procedure get_n;
     var ok: boolean;
begin
repeat
 write('Dwse thn plevlra tou tetragwnou (3, 5, 7, 9) : ');
 readln(n); ok:=true; { user input for size }
 if not (odd(n) and (n>=3) and (n<=9)) then begin { check for valid number }
  writeln('La8os epilogh ari8mou - Dokimase pali ...');
  ok:=false; end;
until ok=true
end;

procedure make;
 var x,y,i,j,num: integer;
begin
 y:=n; x:=(n div 2) + 1; num:=1; { move to initial position }
 for i:=1 to n do begin
  for j:=1 to n do begin
   s[x,y]:=num; num:=num+1;
   if (j<n) then begin x:=x mod n+1; y:=y mod n+1; end;
  end;
  y:=y-1;
 end;
end;

procedure show;
 var i,j,k: integer;
begin
 for i:=1 to n do begin
   for k:=1 to (5*n+1) do write('-'); writeln; { horizontial gridline }
   write('|');
   for j:=1 to n do write(s[i,j]:3,' |'); writeln; { horizontial line }
  end;
 for k:=1 to (5*n+1) do write('-'); writeln; { last gridline }
end;

begin
writeln('Magic Squares!');
repeat
 begin get_n; make; show;
 write('8eleis na epanalhf8ei to programma (y/n) ? '); readln(again);
 end;
until (again='n') or (again='N');
writeln('Goodbye !');
end.