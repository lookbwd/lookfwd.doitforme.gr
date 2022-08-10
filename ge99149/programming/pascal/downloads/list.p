program xwrismos_listas(input, output);
(*Dimitris Kousis - Loukas*)
type    Nodeptr= ^Nodetype;
        Nodetype = record
              info:integer;
              next : Nodeptr
              end;
var source,positive,negative,node : Nodeptr ;

procedure addNode(var listhead: Nodeptr; data:integer);
var node : Nodeptr;
begin
      new(node);
      node^.info:=data;
      node^.next:=listhead;
      listhead:=node;
end;

procedure print( p : nodeptr );
begin
repeat
      write(p^.info,' '); p:= p^.next;
      until (p=nil);
end;

procedure readinfo (var source: nodeptr);
var data:integer;
begin
     source:=nil;
repeat
      read(data);
      addNode(source,data);
until (eoln);
end;

procedure split(source:nodeptr; var positive,negative : nodeptr );
begin
     negative:=nil;
     positive:=nil;
repeat
      if (source^.info < 0) then
      begin
      addNode(negative,source^.info);
      end  else begin;
      addNode(positive,source^.info);
      end;
      source:= source^.next;
until (source=nil);
end;

begin
writeln('Type some positive and negative integers and press <enter>');
readinfo (source);
split(source, positive ,negative);
writeln;write('source list : ');
print(source);
writeln; write('positive : ');
print(positive);
writeln;write('negative : ');
print(negative);
end.