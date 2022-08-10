{* best parameters : bounda<=-10, boundb=-5, deltax=0.5, scale=20 ??? }
  
program graph(input, output); { , graphout); }

const wide=39;
var bounda, boundb, deltax, scale: real;
    graphout: text; 

function f(x: real): real;
begin f:=3*exp(-x)*sin(3*x); end;

function g(x: real): real;
begin g:=3*exp(-x-1); end;

procedure UI;
 var ok: boolean;
begin
 repeat 
  begin
  write('Define left bound: '); readln(bounda);
  write('Define right bound: '); readln(boundb); ok:=true;
  if bounda>boundb then begin 
    ok:=false; writeln('Left bound must be lower than right bound! Try again.');
  end; end;
 until ok=true;
 write('Define ''dx'' stepping: '); readln(deltax); deltax:=abs(deltax);
 write('Define plot scale: '); readln(scale); scale:=abs(scale);
end;

procedure main;
 var line: array[-wide..wide] of char;
     y1, y2, i, numlines: integer; 
begin
 rewrite(graphout); 
 numlines:=round((boundb-bounda)/deltax);
 for i:=0 to numlines-1 do
 begin
  for y1:=-wide to wide do line[y1]:=' '; 
  y1:=round(f(i*deltax)*scale);
  y2:=round(g(i*deltax)*scale);
  line[0]:='|';
  if not (abs(y1)>wide) then line[y1]:='*';
  if not (abs(y2)>wide) then line[y2]:='o';
  for y1:=-wide to wide do begin 
      write(line[y1]); write(graphout,line[y1]); 
  end;
  writeln; writeln(graphout); 
 end;
end;

begin
UI; main;
end.

  
 




