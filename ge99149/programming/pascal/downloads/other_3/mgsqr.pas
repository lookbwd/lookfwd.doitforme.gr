Program magicscqr(input,output);
   {magic squares}

const max=9;
var m,n,i,j:integer;
a:array [1..max,1..max] of integer;

begin

  writeln('dwste to vathmo tou pinaka, o opoios na einai perittos monopsifios');
  readln(n);

 IF (n>9) or (n<=0) or odd(n+1) THEN writeln('lathos dedomena')

 ELSE

  BEGIN

   FOR i:=1 to n DO
     FOR j:=1 to n DO     (*dinetai i timi 0 sola ta stoixeia tou nxn pinaka*)
       a[i,j]:=0;

   {akolouthei i methodos tou pacman gia tin kataskeui tou pinaka}

  m:=1;
  i:=(n+1)div 2;
  j:=n;
  a[i,j]:=m;            (*3ekinontas dinetai i timi 1 sto mesaio stoixeio *)
  m:=m+1;               (* tis teleutaias stilis*)

    REPEAT

       IF (i+1<=n) AND
       (j+1<=n)   AND   (m<=sqr(n)) and

       (a[i+1,j+1]=0) THEN

          begin
            a[i+1,j+1]:=m;
            m:=m+1;           (*  ta loop mesa sto repeat sximatizoun                         *)
            i:=i+1;           (*  ton pinaka. Meta to prwto stoixeio                          *)
            j:=j+1;           (*  elegxoume an to epomeno de3ia katw                          *)
          end;                (*  stoixeio einai 0. An den yparxei pame                       *)
                              (*  sto (1,j+1) i sto (i+1,1) stoixeio,                         *)
       IF (i+1<=n) and        (*  otan i+1>n i j+1>n antistoixa (san to pacman).              *)
        (j+1>n) and
        (m<=sqr(n)) and       (*  An auto einai diaforo tou 0  pame sto j-1 soixeio           *)
        (a[i+1,1]=0) THEN     (*  tis idias grammis. Sto stoixeio pou eimaste dinoume         *)
                              (*  tin timi 2, pou exoume dwsei stin metavliti m               *)
         begin                (*  kai prosthetoume se auti to 1 kai dinoume sta i,j           *)
           a[i+1,1]:=m;       (*  tis times twn i,j tou stoixeiou pou vriskomaste.            *)
           m:=m+1;            (*  H diadikasia epanalamvanetai mexri to m na ginei            *)
           i:=i+1;            (*  iso me n tetragwno opou kai o pinakas exei symplirwthei     *)
           j:=1;
         end;

       IF (i+1>n)  and
          (j+1<=n) and  (m<=sqr(n)) and

          (a[1,j+1]=0) THEN

          begin
            a[1,j+1]:=m;
            m:=m+1;
            i:=1;
            j:=j+1;
          end;

        IF (i+1>n) and
           (j+1>n) and  (m<=sqr(n)) and

           (a[1,1]=0) THEN

          BEGIN
            a[1,1]:=m;
            m:=m+1;
            i:=1;
            j:=1;
          END;

        IF (i+1<=n) and
           (j+1<=n)  and (m<=sqr(n)) and

           (a[i+1,j+1]<>0) THEN

            begin
              a[i,j-1]:=m;
              m:=m+1;
              i:=i;
              j:=j-1;
            end;

        IF (i+1>n) and
           (j+1>n) and (m<=sqr(n)) and

           (a[1,1]<>0) THEN

           begin
             a[i,j-1]:=m;
             m:=m+1;
             i:=i;
             j:=j-1;
           end;

        IF (i+1>n) and
           (j+1<=n) and  (m<=sqr(n)) and

           (a[1,j+1]<>0) THEN

           begin
             a[i,j-1]:=m;
             m:=m+1;
             i:=i;
             j:=j-1;
           end;

        IF (i+1<=n) and
           (j+1>n) and  (m<=sqr(n)) and

           (a[i+1,1]<>0) THEN

           begin
             a[i,j-1]:=m;
             m:=m+1;
             i:=i;
             j:=j-1;
           end;



       UNTIL m>sqr(n);

        For i:=1 to 3 Do

       begin
         writeln;
       end;

       writeln(' o pinakas twn magikwn tetragwnwn me vathmo','  ',n,
               '  ',       'einai o parakatw:');
       writeln;


        i:=1;
        for j:=1 to 4*n do write('_'); writeln;   (*xazoefe*)
        repeat
           begin

               for j:=1 to n do

                write('|',a[i,j]:2,'|');      (*typwsi tou pinaka*)
           end;

            writeln;
            i:=i+1
        until i>n;
        for j:=1 to 4*n DO write('-');       (*xazoefe*)

  END;

end.

