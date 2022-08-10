



program bubble (input ,output);

   var   i,j,c,b,p,e :integer;
         a: array [1..20] of integer;
         question:char;
         noswaps:boolean;

   procedure swap (var x,y:integer);
          var save:integer;
          begin
          save:=x; x:=y; y:=save;
          end;

begin
    repeat

    (* INPUT *)

    writeln;writeln;
    writeln ('              ****         BUBBLES       ****');
    writeln;writeln;
    writeln ('I sort numbers ...');
    writeln;
    write ('Give up to 15, 2-digit numbers devided by a space :');
    i:=0;
    while not eoln do
           begin
           i:=i+1; read (a[i]);
           while (i>15) or (a[i]<10) or (a[i]>99) do
                 begin
                 readln; i:=0;
                 writeln ('!! You must give up to 15, 2-digit, positive numbers.');
                 write ('Give numbers again     :');
                 while not eoln do
                     begin
                     i:=i+1; read (a[i]);
                     end;
                 end;
           end;
    readln;

    (* OUTPUT OF GIVEN LINE *)

    writeln;writeln;writeln;
    write ('Numbers given  :');
         for p:=1 to (i-1) do write (a[p]:3); writeln (a[i]:3);

   (* SORTING *)

    j:=0; c:=0; e:=0;
    repeat
    j:=j+1; noswaps:=true ;
    for b:=(i-1) downto j do
    if a[b]>a[b+1] then
          begin
          swap (a[b],a[b+1]);
          noswaps:=false;
          c:=c+1;
          end else e:=e+1;
    until noswaps;

    (* OUTPUT OF SORTED LINE *)

    write('Sorted numbers :');
          for p:=1 to (i-1) do write (a[p]:3);writeln (a[i]:3);

    (* OUTPUT OF 2 OTHER LINES *)

     writeln ('Singriseis     : ',e+c);
     writeln ('Metatheseis    : ',c);

     (* END *)

     writeln;writeln;writeln;
     write ('Do you wish to go once more? Type -Y- for Yes or -N- for No :');
                readln (question);
                while (question<>'y') and (question<>'n') do
                  begin
                  write ('(Y/N) ?   :');
                  readln (question);
                  end;
      writeln;writeln;writeln;
      until (question='n');
end.
