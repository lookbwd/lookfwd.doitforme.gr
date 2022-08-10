


(* Papakonstantinou Panagiotis *)
(* Deutera 27,Noembriou 2000 *)

program askisi5 (input,output);

var  a: array [1..20] of char;i:integer;
p,k,j,r:integer; question:char;q:real; check:boolean;
begin
k:=0;p:=0;
repeat
k:=k+1;
check:=true;
writeln;writeln;writeln;
write ('               **** Simboloakolouthies ****');
writeln;writeln;writeln;writeln;writeln;
write ('Grapse mia simboloakoloythia  :');
i:=0;
while not eoln and (i<=20) do
      begin
      i:=i+1;
      read (a[i]);
      end;
readln;
if ( i=0 ) or ( i>20 ) then writeln ('It must be until 20 charakters long!')
else
begin
for j:=1 to i do
if a[j]<>a[i-j+1] then check:=false;
if check then
  begin
  writeln;
  for r:=1 to i do
  write (a[r]);
  writeln (' is a palindromiki symboloakoloythia');writeln;
  p:=p+1;
  end
else
begin
  writeln;
  for r:=1 to i do
  write (a[r]);
  writeln (' is not a palindromiki symboloakoloythia');writeln;
end;end;
write ('Do you want to give one again? Type y for yes or n for no :');
readln (question);
until question='n';
q:=(p/k)*100;
writeln;writeln;
writeln ('You gave ',k,' simboloakoloythies and ',p,' were palindromikes.');
writeln;writeln;
writeln ('The percentage is  ',q:4:1,'%');
end.
