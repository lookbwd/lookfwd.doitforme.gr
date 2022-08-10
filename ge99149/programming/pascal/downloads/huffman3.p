program Huffman (input, output, g,h);
{ Dimitris Kousis - Loukas 2002}
const   maxtrees = 200;
type    Nodeptr= ^Nodetype;
               Nodetype = record
              info : char;
              posibility : real;
              right : Nodeptr;
              left : Nodeptr
              end;

              cell = record
              info : char;
              code : string;
              end;
       Forest=array[1..maxtrees] of Nodeptr;
       codelist=array[1..maxtrees] of cell;

var list : Forest; n,i,codeindex,choise:integer; var g,h:text; encode:codelist;

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
var bool:boolean; ch:char; temp,totalcount:integer;
begin

   totalcount:=0; n:=0;
   assign(h, 'income.txt');
   reset(h);

   while not EOF(h) do
      begin
        read(h,ch);
	totalcount:=totalcount+1;

	bool:=true;
	for temp:=1 to n do if (list[temp]^.info=ch) then
	begin
	list[temp]^.posibility:=list[temp]^.posibility+1;
	bool:=false;
	end;

if (bool) then 
begin
n:=n+1;
addNode(list[n], ch , 1 , nil , nil);
end;
end;
for temp:=1 to n do list[temp]^.posibility:=list[temp]^.posibility/totalcount;
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

procedure createEncodeList(list:nodePtr; binary:string);
begin
if list^.left<>nil then createEncodeList(list^.left,concat(binary,'0'));
if list^.right<>nil then createEncodeList(list^.right, concat(binary,'1'));
if ((list^.right=nil) and (list^.left=nil)) then 
begin
codeindex:=codeindex+1;
encode[codeindex].info:=list^.info;
encode[codeindex].code:=binary;
end;
end;

procedure deleteTree(list:Nodeptr);
begin
if list^.left<>nil then deleteTree(list^.left);
if list^.right<>nil then deleteTree(list^.right);
dispose(list);
end;

procedure writecode2file(ch:char; var incount,outcount:integer);
var codeindex:integer;
begin
for codeindex:=1 to n do
if encode[codeindex].info=ch then
   begin
     incount:=incount+8; write(h,encode[codeindex].code);
     outcount:=outcount+length(encode[codeindex].code);
   end;
end;

procedure encodeFile;
var ch:char; incount,outcount:integer;
begin

Assign(g,'income.txt'); Reset(g);
Assign(h,'outcome.txt');Rewrite(h);


for i:=1 to n do
begin
writeln(h,encode[i].info);
writeln(h,encode[i].code);
end;

writeln(h,'0');
writeln(h,'0');

{ xaraktiras termatismou tou merous pou einai grammeno to }
{ dentro mesa sto arxeio. Apo dw kai pera arxizei to keimeno }

incount:=0;outcount:=0;

while not Eof(g) do
begin
read(g,ch);
writecode2file(ch,incount,outcount);
end;


writeln(incount,' bits compressed to ',outcount,' bits');
writeln('Compression rate : ',(((incount-outcount)/incount)*100):2:0,'%');

Close(g);Close(h);
end;

procedure decodeFile;
var word:string; ch:char; incount,outcount:integer;
begin

incount:=0;outcount:=0;n:=-1;word:='';
Assign(g,'income.txt'); Rewrite(g);
Assign(h,'outcome.txt');  Reset(h);

{ anaktisi tou dentrou apo to arxeio outcome.txt }
repeat
n:=n+1;
read(h,encode[n+1].info);readln(h);
readln(h,encode[n+1].code);
until((encode[n+1].info='0')and(encode[n+1].code='0'));

{ apokwdikopoiisi keimenou }


while not eof(h) do
begin
read(h,ch);
word:=concat(word,ch);
for codeindex:=1 to n do
begin
if (word=encode[codeindex].code) then
begin
     write(g,encode[codeindex].info);
     outcount:=outcount+8; incount:=incount+length(word);
     word:='';
end;

end;

end;

writeln(incount,' bits uncompressed successfully to ',outcount,' bits');
writeln('Compression rate : ',(((outcount-incount)/outcount)*100):2:0,'%');

Close(g);Close(h);
end;

begin
    writeln; writeln('Huffman compressor');
    writeln('Do you want : ');
    writeln('1. To encode income.txt to outcome.txt or');
    writeln('2. To decode outcome.txt to income.txt ?');
    readln(choise);
    if (choise=1) then
    begin
    initialize(list, n);  { Arxikopoiisi }
    for i:=1 to n do rearrange(list,n,i); {arxiki taxinomisi me tin me8odo bubblesort}
    for i:=1 to n-1 do    { O algori8mos opws dinetai sto fulladio}
    begin
         merge_last(list,n,i);
         rearrange(list,n,i);
    end;
    codeindex:=0;
    createEncodeList(list[1],'');
    deleteTree(list[1]);
    encodeFile;
    end;

    if (choise=2) then
    begin
    decodefile;
    end;
end.