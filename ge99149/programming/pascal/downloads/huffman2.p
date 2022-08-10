program Huffman (input, output, g,h);
{ Dimitris Kousis - Loukas 2002}
const   maxtrees = 28;
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

begin
     addNode(list[1], 'A',0.065, nil , nil);
     addNode(list[2], 'B',0.013, nil , nil);
     addNode(list[3], 'C',0.022, nil , nil);
     addNode(list[4], 'D',0.032, nil , nil);
     addNode(list[5], 'E',0.104, nil , nil);
     addNode(list[6], 'F',0.021, nil , nil);
     addNode(list[7], 'G',0.015, nil , nil);
     addNode(list[8], 'H',0.047, nil , nil);
     addNode(list[9], 'I',0.058, nil , nil);
     addNode(list[10],'J',0.001, nil , nil);
     addNode(list[11],'K',0.005, nil , nil);
     addNode(list[12],'L',0.032, nil , nil);
     addNode(list[13],'M',0.032, nil , nil);
     addNode(list[14],'N',0.058, nil , nil);
     addNode(list[15],'O',0.064, nil , nil);
     addNode(list[16],'P',0.015, nil , nil);
     addNode(list[17],'Q',0.001, nil , nil);
     addNode(list[18],'R',0.049, nil , nil);
     addNode(list[19],'S',0.056, nil , nil);
     addNode(list[20],'T',0.081, nil , nil);
     addNode(list[21],'U',0.023, nil , nil);
     addNode(list[22],'V',0.008, nil , nil);
     addNode(list[23],'W',0.018, nil , nil);
     addNode(list[24],'X',0.001, nil , nil);
     addNode(list[25],'Y',0.017, nil , nil);
     addNode(list[26],'Z',0.001, nil , nil);
     addNode(list[27],' ',0.172, nil , nil);
     addNode(list[28],'@',0.020, nil , nil);  (*eoln*)
n:=maxtrees;
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
if encode[codeindex].info=upcase(ch) then
   begin
     incount:=incount+8; writeln(h,encode[codeindex].code);
     outcount:=outcount+length(encode[codeindex].code);
   end;
end;

procedure encodeFile;
var word:string; incount,outcount:integer;
begin

Assign(g,'income.txt'); Reset(g);
Assign(h,'outcome.txt');Rewrite(h);

incount:=0;outcount:=0;

while not Eof(g) do
begin
readln(g,word);
for i:=1 to length(word) do writecode2file(word[i],incount,outcount);
writecode2file('@',incount,outcount);
end;

writeln(incount,' bits compressed to ',outcount,' bits');
writeln('Compression rate : ',(((incount-outcount)/incount)*100):2:0,'%');

Close(g);Close(h);
end;

procedure decodeFile;
var word:string; incount,outcount:integer;
begin

incount:=0;outcount:=0;
Assign(g,'income.txt'); Rewrite(g);
Assign(h,'outcome.txt');  Reset(h);

while not eof(h) do
begin
readln(h,word);
for codeindex:=1 to n do 
if (word=encode[codeindex].code) then
begin
     if (encode[codeindex].info='@') then writeln(g,'') else
     write(g,encode[codeindex].info);
     outcount:=outcount+8; incount:=incount+length(word);
end;

end;

writeln(incount,' bits uncompressed successfully to ',outcount,' bits');
writeln('Compression rate : ',(((outcount-incount)/outcount)*100):2:0,'%');

Close(g);Close(h);
end;

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

    writeln; writeln('Huffman compressor');
    writeln('Do you want : ');
    writeln('1. To encode income.txt to outcome.txt or');
    writeln('2. To decode outcome.txt to income.txt ?');
    readln(choise);
    if (choise=1) then encodeFile;
    if (choise=2) then decodefile;
end.