program magic ( input, output );

        var n,i,j,p,a,b,x: integer;
            e: array [1..99,1..99] of integer;
            question : char;
            checknumber: boolean;

begin
        repeat
(*a*)   begin
            writeln ; writeln ; writeln ;
writeln ('                   **** I AM A MAGIC PROGRAM ****');
writeln ; writeln ;

            write ('How big should the pinakas be ?   :'); readln (n);

            checknumber:=false;
            if odd(n) then checknumber:=true;
            while not checknumber or (n>=10) do
            begin
            writeln;
            writeln ('Number must be odd and minor to 10!');
            write ('Give number again                 :');readln (n);
            if odd(n) then checknumber:=true;
            end;

       (*   main body to find a[i,j] *)

       (* stiles *)   (* grammes *)
       i:= n div 2 ; j:= n-1 ; x:=0 ;
       for a:=1 to n do
	  begin
            for b:=(1+x) to (n+x) do
                  begin
	          i:= i+1 ;  j:= j+1 ;
                  if i>n then i:=1;
                  if j>n then j:=1;
                  e[j,i] := b ;
                  end;
            j:= j-2 ;  i:= i-1 ;  x:=x+n ;
          end;

        (*  graph *)

        write ('   ');

         (* first line with _ *)

        for a:=1 to (5*n) do write ('_'); writeln ('_');

         (* rows *)

        for j:=1 to n do

    (*1*) begin
             (* small box where letter goes in *)
          (*2*) begin
                    write ('   ');
                    (* if we have a line with numbers *)
                          begin
                          for i:=1 to n do
                            begin
                            if e[i,j]<10 then
                              write ('|  ',e[i,j],' ')

                            else
                              write ('| ',e[i,j],' ');

                          end;
                          writeln ('|');
                          end

           (*2*)end;
             if j<n then
               begin
               write ('   ');
               write ('-');
               for a:=1 to (n-1) do write ('----+');
               writeln ('-----');
               end;
    (*1*)end;
         write ('   ');
         for a:=1 to (5*n+1) do write ('-');

         (* Sinthiki exodou *)
         writeln; writeln;
         write ('Do you want to go once more ? Type y for yes or n for no :');

         readln (question);
         while (question<>'y') and (question<>'n') do
                  begin
                  write ('(Y/N) ?   :');
                  readln (question);
                  end;writeln;writeln;writeln;
 (*a*)end;
   until question='n';
 end.


