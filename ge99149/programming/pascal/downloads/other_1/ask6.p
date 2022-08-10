program ask6 (input,output);
   var i,j,k,l:integer;
       a:array [1..11,1..11] of integer;

   function deiktes (s,c:integer):integer;
     begin
       deiktes:=(s mod c) +1;
     end;

begin
  repeat
   repeat
    writeln('give the dimension of the magic square:');
    writeln('it has to be an odd one_digit number:');
    read(k);readln;
    if (k mod 2<>1) or (k>9) or (k<1)
    then writeln('the dimension is not correct inserted');
    until (k mod 2=1) and (k div 10=0);
    for i:=1 to 11 do
      for j:=1 to 11 do
      a[i,j]:=-1;
      i:=(k+1) div 2;
      j:=k;
      a[i,j]:=1;
      l:=1;
     while l<sqr(k) do
      begin
       l:=l+1;
       if a[deiktes(i,k), deiktes(j,k)]=-1 then
         begin
          a[deiktes(i,k), deiktes(j,k)]:=l;
          i:=deiktes(i,k);
          j:=deiktes(j,k);
         end
       else
        begin
         a[deiktes(i-1,k),deiktes(j-2,k)]:=l;
         j:=deiktes(j-2,k);
        end;
      end;
     for i:=1 to k do
      begin
       write('-');
       for j:=1 to k do
       write('-----');
       writeln;
       for j:=1 to k do
       write('|',a[i,j]:3);
       write('|');
       writeln;
       end;
     write('-');
     for j:=1 to k do
     write('-----');
     writeln;
     write('press<enter><enter> for repetition, <control>-c for exit');
     readln;
    until eof
end.