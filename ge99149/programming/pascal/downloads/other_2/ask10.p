program sort(input,output,STUD,FILOSTUD);

  const size=15;

  type list=array[1..size] of string[80];


   var p,r:integer;
       A,B:string[80];
       stud,filostud:text;
       choice:char;
       coolist:list;

  procedure merge(var a,b,c:list; fa,la,fb,lb,fc:integer;
                  var lc:integer);
      var ia,ib,ic:integer;
    begin
    ia:=fa; ib:=fb; ic:=fc;
    repeat
      if a[ia]<b[ib] then begin c[ic]:=a[ia]; ia:=ia+1; end
                     else begin c[ic]:=b[ib]; ib:=ib+1; end;
      ic:=ic+1;
    until (ia>la) or (ib>lb);
    for ia:=ia to la do begin c[ic]:=a[ia]; ic:=ic+1 end;
    for ib:=ib to lb do begin c[ic]:=b[ib]; ic:=ic+1 end;
    lc:=ic-1;
    end;

  procedure mergesort(var a:list; fa,la:integer);
      var b:list; i,mid:integer;
    begin
    if fa<la then
      begin mid:=(fa+la) div 2;
      mergesort(a,fa,mid); mergesort(a,mid+1,la);
      merge(a,a,b,fa,mid,mid+1,la,fa,la);
      for i:=fa to la do a[i]:=b[i]
      end;
    end;


 begin
   assign (stud,'c:\peter\pascal\ergasies\stud.txt');
   assign (filostud,'c:\peter\pascal\ergasies\filostud.txt');

   reset (stud);
   writeln('      *****   SORT STUDENT LIST   *****');
   writeln;writeln;

    r:=0;
   while not  eof(stud) do
         begin
         readln(stud,A);
         r:=r+1;
         coolist[r]:=A;
         end;


   mergesort(coolist,1,r);
   (* output *)
       rewrite(filostud);
       for p:=1 to r do
             begin
             write(filostud,coolist[p]);writeln(filostud);
             end;
        close(filostud);


     write ('Do you want to see the sorted file of students ? (y/n) :');
        readln (choice);
        while (choice<>'y') and (choice<>'n') do
        begin
        write('(y/n) ?  :');readln(choice);
        end;

     if choice='y' then
        begin
        reset(filostud);
        while not eof(filostud) do
          begin
          readln(filostud,B); writeln(B);
          end;
        close(filostud);
        end;

      writeln;writeln;
      write('Goodbye ...');

end.