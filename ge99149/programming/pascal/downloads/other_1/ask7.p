program ask7(input,output,p);
 {grafiki parastasi dio sinartiseon}
 var line:array[-39..39] of char;
     i,j,k,l:integer;
     answer:char;
     x,deltax,bounda,boundb,scale:real;
     p:text;

 function f(x:real):real;
   begin
     f:=3*exp(-x)*sin(3*x);
   end;

 function g(x:real):real;
   begin
     g:=3*exp(-x-1);
   end;

begin
  repeat
    rewrite(p);
    write('dose bound A:');
    read(bounda);readln;
    write('dose bound B:');
    read(boundb);readln;
    write('dose delta X:');
    read(deltax);readln;
    write('dose scale:');
    read(scale);readln;
    for i:=-39 to 39 do
     begin
    (line[i]:='';)
    x:=bounda;
    write(p,'Bound A:',bounda);
    write(p,'Bound B:',boundb);
    writeln(p);
    write(p,'Delta X:',deltax);
    write(p,'scale:',scale);
    writeln(p);
     end;
    for i:=0 to round((boundb-bounda/deltax) do
     begin
      j:=round(scale*f(x));
      k:=round(scale*g(x));
      if abs(j)<=39 then line[j]:='*';
      if abs(k)<=39 then line[k]:='+';
      line[0]:='|';
      for l:=-39 to 39 do
     begin
       write(line[l]);
       write(p,line[l]);
     end;
    writeln;
    writeln(p);
    x:=x+deltax;
    if (abs(j)<=39) then line[j]:='';
    if (abs(k)<=39) then line[k]:='';
     end;
    write('thelete na sinexisete [y/n]:');
    read(answer);
   until answer='n';
end.