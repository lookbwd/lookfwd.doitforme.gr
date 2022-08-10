  program nice(input,output,RAWTXT,PRETTY);

     const wid=255;
     var rawtxt,pretty:text;
         rawline,temp:string[wid];
         prettyline,line:string[60];
         choice:char;
         fin:boolean;


  function not_empty (A:string):boolean;
     const space=' ';
     var B:string[wid]; n,m,x:integer;
    begin
    B:=A; x:=0; not_empty:=true;
    repeat
      begin
      m:=length(B);
      n:= pos(space,B);
      if n<>0 then x:=x+1;
      if (n<>0) and (n<>m) then B:= copy(B,n+1,m-n);
      end;
    until (n=0) or (n=m);
    m:=length(A);
    if x=m then not_empty:=false;
    end;


  procedure fitline (rawline:string);
     const lspace=' ';
     var reverseline:string[wid]; n,m,k,y:integer;
    begin
    if length(rawline)>60 then
      begin
      reverseline:=' ';
      for n:=length(rawline) downto 1 do
         begin

         if not_empty(reverseline) then
           reverseline:=reverseline+copy(rawline,n,1)
         else
           reverseline:=copy(rawline,n,1);
         end;

      repeat
        begin
        m:=pos(lspace,reverseline);
        y:=length(reverseline);
        k:=y-m;
        reverseline:=copy(reverseline,m+1,k);
        end;
      until k<=60;

      line:=copy(rawline,1,k);
      temp:=copy(rawline,k+2,length (rawline)-k-1);
      end
    else
      begin
      temp:=' ';
      line:=rawline;
      end;
    end;



  procedure niceline(line:string);
     const lspace=' ';
     var B,tempor:string[60]; m,p,i,k,mspaces:integer;
    begin
    if (30<length(line)) and (length(line)<60) then
       begin
       B:=line; m:=length(B); mspaces:=60-m; p:=0;
       repeat
         begin
         tempor:=' ';
         i:=0;

         repeat
             begin
             m:=length(B);
             k:=pos(lspace,B);
             if k<>0 then
                  begin
                  k:=k+p;
                  insert(lspace,B,k);
                  m:=m+1; i:=i+1;

                  if not_empty(tempor) then
                       tempor:=tempor+copy(B,1,k+1)
                  else tempor:=copy(B,1,k+1);
                  B:=copy(B,k+2,m-k-1);
                  end;
               mspaces:=mspaces-i;i:=0;
             end;
             until (k=0) or (mspaces=0);

             p:=p+1;
             B:=tempor+B;

         end;
       until mspaces=0;
       prettyline:=B;
       end
    else
       prettyline:=line;
    end;


begin
  assign(rawtxt,'c:\peter\pascal\ergasies\rawtxt.txt');
  assign(pretty,'c:\peter\pascal\ergasies\pretty.txt');

  writeln ('                         ****   PRETTY TEXT   ****');
  writeln;writeln;

  reset(rawtxt); rewrite(pretty); temp:=' ';
  repeat
    begin
    fin:=false;
    if not eof(rawtxt) then readln(rawtxt,rawline)
    else begin rawline:=temp; fin:=true;end;

    if not fin then
    begin
    if  not_empty(rawline) then begin
        if not_empty(temp) then  rawline:=temp+' '+rawline end
    else rawline:=temp;
    end;

    if not_empty(rawline) then
       begin
       fitline(rawline); niceline(line);
       end
    else
       prettyline:=copy(rawline,1,60);

    (*  OUTPUT  *)

    write (pretty,prettyline); writeln (pretty);
    end;
  until fin;
    close(rawtxt); close(pretty);

    write ('Do you want to see the pretty text ?  Yes or No (y/n) :');
    readln (choice);
      while (choice<>'y') and (choice<>'n') do
         begin
         write ('(y/n) ?  :'); readln(choice);
         end;
         writeln; writeln;

    if choice='y' then
      begin
      reset(pretty);
      while not eof(pretty) do
         begin
         readln(pretty,line);
         writeln (line);
         end;
      close(pretty);
      end;

   writeln;writeln; writeln('Goodbye...');
end.