program ask8(input,output);
  var a:array [1..100] of integer;
      xsana:char;
      noswaps:boolean;
      k,i,j,metath,sigrisis,c:integer;
  procedure swap(var x,y:integer);
  begin
   x:=x+y;y:=x-y;x:=x-y;
  end;
begin
 xsana:='y';
 while xsana='y' do
 begin
  k:=0;
  while not eoln do
  begin
   k:=k+1;
   read(a[k]);
  end;
  readln;
 if k=0 then writeln('den edoses kanena xaraktira') else
 else
 begin
   sigrisis:=0;
   metath:=0;
   write('i akolouthia pou edoses einai:');
   for c:=1 to k do
   begin
    write(a[c],' ');
   end;
   writeln;
   i:=0;
   repeat i:=i+1;noswaps:=true;
   for j:=k-1 downto i do
   begin
   sigrisis:=sigrisis+1;
   if a[j]>a[j+1] then
    begin
      swap(a[j],a[j+1]); noswaps:=false; metath:=metath+1;
    end;
   end;
   until noswaps=true;
   write('i taxinomimeni akolouthia einai:');
   for c:=1 to k do
   begin
     write(a[c],' ');
   end;
   writeln;
   writeln('o arithmos ton sigriseon pou eginan einai:',sigrisis);
   writeln('o arithmos ton metatheseon pou eginan einai:',metath);
   j:=0;
   for c:=1 to k do
   a[c]:=0;
 end;
 write('thes na doseis alli akolouthia,an nai patise y an oxi patise n ');
end;
end.