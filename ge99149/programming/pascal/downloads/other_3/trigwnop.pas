program triangle(input,output);

 {to trigwno pascal pou rixnei o papazaxovic stis e3etaseis pou kai pou}

  var n,k:integer;
      result:integer;
      i:integer;
      a:char;

  function n_ana_k(n,k:integer):integer;

     var i,arithm,paron:integer;

     begin
       paron:=1;
       arithm:=1;
       for i:=1 to k do
            paron:=paron*i;
       for i:=n downto n-k+1 do
            arithm:=arithm*i;
           n_ana_k:=arithm div paron;            (*n ana k*)
     end;


BEGIN
  REPEAT
     writeln('dwste mia timi sto n, me 0<=n<7 kai patiste enter');
     readln(n);

     IF (n>6) or (n<0) THEN
       writeln('H ektypwsi einai adynati')

      ELSE
        BEGIN
          writeln('auto einai trigwno pascal gia ', n:1, ' grammes:');
          FOR i:=0 to n DO
            BEGIN
              write(i:5);             (*arithmos grammis*)
              write('#');
              FOR k:=0 to i DO
                BEGIN            (*typwsi tis nk gia ti grammi i & k stili*)
                  write(n_ana_k(i,k):5);
                END;
                writeln;
            END;
        END;
     write('thelete na epanaliuthei to programma; y/n:');
     readln(a);
  UNTIL (a='n') or (a='N');
END.
