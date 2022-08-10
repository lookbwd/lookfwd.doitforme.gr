program ask9(input,output,FIL,PRETTY);
    {epeksergastis keimenou}
  var fil,pretty:text;
      line_old,line_new:array[1..100] of char;
      word1,word2:array[1..max_word] of char;
      counter,charnum,words,i,a,b,c,k:integer;
      ch:char;

  procedure print_line;
     var r:integer;
  begin
     for r:=1 to max do
     write(pretty,line_new[r]);
     writeln(pretty);
  end;

begin
   reset(fil);
   rewrite(pretty);
   charnum:=0;
   words:=0;
   repeat
    repeat
      read(fil,ch);
      if ch<>'' then
       begin
        counter:=0;
        words:=words+1;
        repeat
         counter:=counter +1;
         charnum:=charnum+1;
         if words mod 2 =0 then
          word1[counter]:=ch;
            else
          word2[counter]:=ch;
         line_old[charnum]:=ch;
         read(fil,ch);
        until (ch='') or eoln(fil);
        if (words>0) and (ch='') and line_old[charnum] <>'')then
         begin
          charnum:=charnum +1;
          line_old[charnum]:='';
         end;
        if (ch <>'') and eoln(fil) then
         begin
          counter:=counter +1;
          line_old[k]:=word2[k];
         line_old[counter +1]:='';
         words:=1;
         charnum:counter +1;
       until eof(fil);
end.