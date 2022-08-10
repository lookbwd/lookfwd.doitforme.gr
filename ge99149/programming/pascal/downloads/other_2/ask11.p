program askisi11 (input,output);

 type ptr=^box;
         aptr=^abox;
         bptr=^bbox;
      box=record
          data:integer;
          next:ptr;
          end;
      abox=record
           data:integer;
           next:aptr;
           end;
      bbox=record
           data:integer;
           next:bptr;
           end;

 var head,diktis:ptr; ahead,al:aptr; bhead,bl:bptr;
     info:integer;
     neg,pos:boolean;



  procedure aprint(p:aptr);
    begin
    while p<>nil do
     begin write(p^.data:4); p:=p^.next;  end
    end;

 procedure print(p:bptr);
    begin
    while p<>nil do
     begin write(p^.data:4); p:=p^.next;  end
    end;

begin
 writeln;writeln;
  writeln ('Dose arithmous xorismenous me keno kai pata enter :');
  write ln;writeln;

  head:=nil;
  repeat
    begin
    read(info);
    new(diktis);
    diktis^.data:=info; diktis^.next:=head;
    head:=diktis;
    end;
  until eoln;

  neg:=false; pos:=false;
  ahead:=nil; bhead:=nil; diktis:=head;
  while diktis<>nil do
  begin
  if diktis^.data<0 then
    begin
    neg:=true;
    new(al);
    al^.data:=diktis^.data;
    al^.next:=ahead;
    ahead:=al;
    end
  else
    begin
    pos:=true;
    new(bl);
    bl^.data:=diktis^.data;
    bl^.next:=bhead;
    bhead:=bl;
    end;

  diktis:=diktis^.next;
  end;


  (* output *)


    writeln;
    if pos then begin write('The positive numbers are :');print(bl) end
       else write('No positive numbers were found...');
    writeln;
    if neg then begin write('The negative numbers are :');aprint(al) end
       else write('No negative numbers were found...');
end.