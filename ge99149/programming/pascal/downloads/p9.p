Program GCD(input,output);

function gcd(a: integer ;b:integer) : integer; 
var i,j:integer;
begin
i:=abs(a);
j:=abs(b);
while (i>0) and (j>0) do
if i>=j then i:=i mod j else j:=j mod i;
gcd:=i+j;
end;
 
var a,b:integer;
begin
readln(a,b);
writeln('Ο μέγιστος κοινός διαιρέτης των ',a,' και ',b , ' είναι' ,gcd(a,b));
end.