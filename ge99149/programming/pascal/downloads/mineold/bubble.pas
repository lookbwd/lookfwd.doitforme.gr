program Bubble(input, output);
type NuList=array[1..15] of integer;

  var  Number:NuList; NumberBck:NuList; var k,l,cnt:integer;


procedure swap(var x,y : integer);
var temp: integer;
begin temp:=x; x:=y; y:=temp;
end;

procedure eisagwgh_dedomenwn(var cnt: integer; var Number:NuList);
var null:integer;
begin
cnt:=1;
writeln('Dwse mia akolou8ia to  poly 15 ari8mwn gia na ta3inomh8ei : ');
while not eoln do
	begin
        if (cnt<=15) then read(Number[cnt]) else read(null);
        cnt:=cnt+1;
	end;
        cnt:=cnt-1;
        if (cnt>15) then writeln('Oi ari8moi prepei na einai mexri 15');
        readln();
end;

procedure Taxinom(n:integer; var Number:NuList; var k,l:integer);
var i,j: integer; noswaps:boolean;
begin
i:=0;k:=0;l:=0;
repeat i:=i+1; noswaps:=true;
for j:=n-1 downto i do
	begin
	k:=k+1;
	if (Number[j]>Number[j+1]) then
		begin swap(Number[j],Number[j+1]); l:=l+1; noswaps:=false
		end;
	end;
until noswaps
end;

procedure Antigrafh_Listas(var NumberBck,Number:NuList; cnt:integer);
var i:integer;
begin
for i:=1 to cnt do NumberBck[i]:=Number[i];
end;

procedure Emfanish_Apotel(NumberBck,Number:NuList; k,l:integer; cnt:integer);
var i:integer;
begin
writeln();
write('Akolou8ia : '); for i:=1 to cnt do write(NumberBck[i],' ');writeln();
write('Ta3inomhmenh Akolou8ia : '); for i:=1 to cnt do write(Number[i],' ');writeln();
writeln('Ari8mos Sygkrisewn : ',k);
writeln('Ari8mos Meta8esewn : ',l);writeln();
end;

begin
writeln('**********************************');
writeln('* Ta3inomhsh ari8mwn(bubblesort) *');
writeln('**********************************'); writeln;

repeat eisagwgh_dedomenwn(cnt,Number); until (cnt<=15);
Antigrafh_Listas(NumberBck,Number,cnt);
Taxinom(cnt,Number,k,l);
Emfanish_Apotel(NumberBck,Number,k,l,cnt);
write('Euxaristw !');readln();
end.
