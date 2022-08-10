program Huffman (input, output, g,h);
{ Dimitris Kousis - Loukas 2002}
const   maxtrees = 27;
type    Nodeptr= ^Nodetype;
        Nodetype = record
              info : char;
              posibility : real;
              right : Nodeptr;
              left : Nodeptr
              end;
        Forest=array[1..maxtrees] of Nodeptr;

var list : Forest; n,i:integer; var g,h:text;

procedure addNode(var listhead: Nodeptr; character:char ; posib:real;left,right:Nodeptr );
var node : Nodeptr;
begin
      new(node);
      node^.info:=character;
      node^.posibility:=posib;
      node^.left:=left;
      node^.right:=right;
      listhead:=node;
end;

procedure initialize(var list : Forest ; var n:integer ) ;

begin
     addNode(list[1], 'a',0.065, nil , nil);
     addNode(list[2], 'b',0.013, nil , nil);
     addNode(list[3], 'c',0.022, nil , nil);
     addNode(list[4], 'd',0.032, nil , nil);
     addNode(list[5], 'e',0.104, nil , nil);
     addNode(list[6], 'f',0.021, nil , nil);
     addNode(list[7], 'g',0.015, nil , nil);
     addNode(list[8], 'h',0.047, nil , nil);
     addNode(list[9], 'i',0.058, nil , nil);
     addNode(list[10],'j',0.001, nil , nil);
     addNode(list[11],'k',0.005, nil , nil);
     addNode(list[12],'l',0.032, nil , nil);
     addNode(list[13],'m',0.032, nil , nil);
     addNode(list[14],'n',0.058, nil , nil);
     addNode(list[15],'o',0.064, nil , nil);
     addNode(list[16],'p',0.015, nil , nil);
     addNode(list[17],'q',0.001, nil , nil);
     addNode(list[18],'r',0.049, nil , nil);
     addNode(list[19],'s',0.056, nil , nil);
     addNode(list[20],'t',0.081, nil , nil);
     addNode(list[21],'u',0.023, nil , nil);
     addNode(list[22],'v',0.008, nil , nil);
     addNode(list[23],'w',0.018, nil , nil);
     addNode(list[24],'x',0.001, nil , nil);
     addNode(list[25],'y',0.017, nil , nil);
     addNode(list[26],'z',0.001, nil , nil);
     addNode(list[27],'/',0.172, nil , nil);
n:=maxtrees;
end;

procedure writenode(list:Nodeptr;level:integer; descr : string; binary:string);
begin

if ((list^.left=nil) and (list^.right=nil)) then writeln(h,list^.info,': ',binary);
writeln(g,level,' ',descr,' -  ',list^.info,'  -  ',list^.posibility:4:3);

if list^.left<>nil then writenode(list^.left,level+1, 'left', concat(binary,'0'));
if list^.right<>nil then writenode(list^.right,level+1, 'righ', concat(binary,'1'));
end;

procedure writetree(list:Nodeptr);
begin

Assign(g, 'huffman.txt'); { exodos se arxeio }
rewrite(g);
Assign(h, 'binaries.txt'); { exodos se arxeio }
rewrite(h);

writenode(list,0, 'root', ''); {klisi tis anadromikis writenode}
        {pou diatrexei to dentro kai tupwnei to periexomeno tou}

close(g); { kleisimo tou arxeiou }
close(h); { kleisimo tou arxeiou }
end;

procedure merge_last(var list:Forest ; n,i: integer);
var posib:real;
begin

posib:= list[n-i+1]^.posibility + list[n-i]^.posibility;
if (list[n-i+1]^.posibility > list[n-i]^.posibility) then

 addNode(list[n-i],' ',posib, list[n-i+1] , list[n-i])
 else
 addNode(list[n-i],' ',posib, list[n-i], list[n-i+1]);
end;

procedure swap(var p,q : Nodeptr);
var temp:Nodeptr;
begin
temp:=p;
p:=q;
q:=temp;
end;

procedure rearrange(var list:Forest; n,i: integer);
var count:integer;
begin
for count:=0 to n-i-1 do
if list[n-count-i+1]^.posibility > list[n-count-i]^.posibility then
                swap(list[n-count-i+1],list[n-count-i]);
end;

begin

initialize(list, n);  { Arxikopoiisi }

for i:=1 to n do rearrange(list,n,i); {arxiki taxinomisi me tin me8odo bubblesort}

for i:=1 to n-1 do    { O algori8mos opws dinetai sto fulladio}
    begin
    merge_last(list,n,i);
    rearrange(list,n,i);
    end;

writetree(list[1]); {emfanisi tou telikou dentrou}

end.