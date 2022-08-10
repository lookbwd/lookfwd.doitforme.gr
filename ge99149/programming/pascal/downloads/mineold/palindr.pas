program palindr(input, output);
  var s: string[20];
      correct,total,slen: integer;
      again: char;

procedure input_data;
  var temp: string[80]; i,j,l: integer;
      ok: boolean;
begin
  repeat
  write('Dwse mia symboloseira to poly 20 xarakthrwn : '); readln(temp);
  ok:=true; l:=length(temp);
  if l>20 then begin ok:=false; writeln('Eipame mexri 20 xarakthres !!!'); end 
    else if l=0 then begin ok:=false;
 writeln('H symboloseira einai adeia !!!'); end
  until ok=true; 
  i:=1; j:=1;
  repeat
      if temp[i]=' ' then i:=i+1 else
                     begin s[j]:=temp[i]; i:=i+1; j:=j+1; end;
    
  until i>l; 
  slen:=j-1;
end;

procedure check;
  var i,max: integer; match: boolean;
begin
  i:=1; total:=total+1; max:=slen div 2;
  repeat
    match:=(s[i]=s[slen+1-i]); i:=i+1;
  until (not match) or (i>max);
  if match then begin writeln('H symboloseira einai palindromikh');
                      correct:=correct+1; end
	   else writeln('H symboloseira den einai palindromikh.');
end;

begin
writeln('**********************************');
writeln('** Palindromikes symboloseires  **');
writeln('**********************************'); writeln;
correct:=0; total:=0;
repeat
  input_data; check;
  write('8eleis na eisageis ki allh symboloseira ? (Y)es - (N)o :');
  read(again); readln;
until (again='n') or (again='N');
writeln('Statistika:');
writeln('O xrhsths edwse ',total,' swstes symboloseires.'); 
writeln('Apo aftes, ',correct,' htan palindromikes');
writeln('Pososto: ',(correct/total)*100:4:2,'%');
writeln('Goodbye ...');
end.
