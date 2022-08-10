program pallindromisi(input,output);
 {eleghos pallindromikon sumboloseiron}
var i,j,k,l,m:integer;s2:char;a:array[1..20] of char;eleghos:boolean;
begin
 writeln('ELEGXOS PALLINDROMIKON SYMBOLOAKOLOUTHION');
 k:=0;l:=0;
 repeat
  i:=1;
  writeln('dose ta stoixeia tis akolouthias diadoxika');
  repeat
   read(a[i]);
   i:=i+1;
  until eoln;
  if ((i=1) or (i>21)) then
  writeln('LATHOS!!TO MHKOS THS AKOLOUTHIAS PREPEI NA EINAI METAXY 1 KAI 20')
  else
  begin
  k:=k+1;
  i:=i-1;
  j:=0;
  eleghos:=true;
  while ((eleghos=true) and (j<=i div 2)) do
   begin
    if (a[j+1]<>a[i-j]) then
     begin
      eleghos:=false;
      writeln('H AKOLOUTHIA!DEN! EINAI PALLINDROMIKH');
     end;
    j:=j+1;
   end;
  if (eleghos=true) then
   begin
    writeln(chr(1), 'H AKOLOUTHIA EINAI PALLINDROMIKH',chr(1));
    l:=l+1;
   end;
  end;
  write('theleis na doseis alli akolouthia?(<Y>es/<N>o):');
  readln(s2);
  if ((s2<>'N') and (s2<>'n') and (s2<>'Y') and (s2<>'y')) then
   begin
    repeat
     {writeln(chr(7));}
     write('!!!!!LATHOS!!!!!patise <N> i <Y>:');
     readln(s2);
    until ((s2='n') or (s2='N') or (s2='y') or (s2='Y'));
   end;
  if ((s2='N') or (s2='n')) then
   begin
    write('**to % pososto ton pallindromikon akolouthion einai:');
    writeln(l/k*100:3:5,'% **');
    readln;
   end;
 until ((s2='n') or (s2='N'))
end.