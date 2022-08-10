program studentsort(input,output,stud,studsort,printstud);
      (*taksinomisi listas mathitwn me onomatepwnimo kai alla stoixia*)
   const size=15
   type student=record
   epitheto,onoma:string[20];
                am:integer;
                  end;
       lista=arrey[1...size] of student;
   var i,number:integer;
      catalog:lista;
   stud,printstud:text;
   studsort:file of student;
function comparison(a,b:student):boolean;
   begin {1}
   if a.epitheto<b.epitheto then comparison:=true;
   if a.epitheto>b.epitheto then comparison:=false;
   if a.epitheto=b.epitheto then
 begin {2}
  if a.onoma<b.onoma then comparison:=true;
  if a.onoma>b.onoma then comparison:=false;
  if a.onoma=b.onoma then
 begin {3}
  if a.am<b.am then comparison:=true;
  if a.aa>=b.am then comparison:=false;
 end{3}
end{2}
end;{1}
   procedure merge(var a,b,c:lista; fa,1a,fb,1b,fc:integer;var lc:integer);
  var ia,ib,ic:integer;
 begin {merge}
  ia:=fa;
  ib:=fb;
  ic:=fc;
 repeat
  if comparison(a[ia],a[ib])then
   begin {1}
  c[ic]:=a[ia];
   charnum:=charnum +1;
   if words mod2=0 then
  words1[counter]:=ch
   else
  word2[counter]:=ch;
    line_old[charnum]:=clear;
  end;
 end;
until(charnum>max)or eof(fil);
  if line_old[charnum]=''then
  charnum:=charnum-1;
   if charnum>max then
  charnum:=charnum-counter-1;
  a:=(max-charnum)div (words-1);
  b:=(max-charnum)mod(words-1);
  i:=1;
  c:=1;
    while i<=60 do
  begin {1}
  if not eof(fil) then
  begin {2}
  if line_old[c]=''then
  begin{3}
  for k:=1 to a+1 do
  begin{4}
   line_new[1]:='';
  i:=i+1;
  end; {4}
  c:=c+1;
  end{3}
else
   begin{5}
  line_new[i]:=line_old[c];
   i:=i+1;
   c:=c+1;
  end;{5}
   begin{6}
   for k:=1 to charnum do
  line_new[k]:=line_old[k];
   i:=61;
   for k:=charnum+1 to max do
   line_new[k]:='';
  end;{6}
  end;{1}
   print_line;
   for k:=1 to counter do
   if words mod2=0 then
   readln(stud,catalog[i].am)
  end;
  number:=i;
  close(stud);
   mergesort(catalog,1,number);
   rewrite(stusort);
   for i:=1 to number do
   write (studsort,catalog[i]);
   close(studsort);
   rewrite(printstud);
   for i:=1 to number do
   writeln(printstud,catalog[i].epitheto:20,'',catalog[i].onoma; 20,catalog[i].

   am:6);
  close(printstud);
  writeln('their data sorted are:');
   writeln;
   for i:=1 to number do
  writeln(catalog[i].epitheto:20,'',catalog[i].onoma:20,catalog[i].am:6);
   writeln('have a nice day;);
  writeln
  end.
