  { oi treis proigoumenes askiseis einai ypoperiptwsi autis }

Program pra3eismeklasmata(input,output);

 {parousiasi apotelesmatos se klasmatiki kai dekadiki morfi}

var a,b,c,d,x,y,i,j,l,o:integer;
    k,t:char;

BEGIN
  REPEAT

  (*diavasma twn 2 klasmatwn kai tou symvolou pra3is*)
    writeln('dwse tis gnwstes metavlites me ti seira');
    writeln('ton 1o arithmiti a');
    readln(a);
    writeln('ton 2o paronomasti b');
    readln(b);
    writeln('ton 1o arithmiti c');
    readln(c);
    writeln('ton 2o paronomasti d');
    readln(d);
    writeln('dwse twra to symvolo tis pra3is');
    readln(k);

    BEGIN           (*elegxos twn apetoumenwn periorismwn*)
      IF  (b=0) or (d=0) or (y=0) or (abs (b)>9) or (abs (c)>9) or (abs(a)>9)
      or (abs(d)>9) or ((k='/') and  (c=0))
      THEN writeln('lathos dedomena')

      ELSE     {an ta dedomena tou xristi itan epitrepta tote synexizoume
             stin pra3i}
        BEGIN

          BEGIN
            CASE k of '+': begin
                             x := a*d + c*b;
                             y := b*d;
                           end;
                       '-': begin
                              x := a*d - c*b;
                              y := b*d;
                            end;
                       '*': begin
                              x := a * c ;
                              y :=  b * d ;
                            end;
                       '/': begin
                              x:= a * d ;
                              y:= b * c ;
                            end;
            END; (*thymizoume oti to case kleinei kai auto me end*)
          END;


       BEGIN   (*voithitikes entoles anathesis*)
         l := x div y;
         o := x mod y;
         i := o;
         j := y;
       END;

       {euresi tou megistou koinou diaireti, me ton algorithmo tou
        Euklidi gia tin aplopoiisi tou klasmatos}
     IF (i<>0) and (j<>0) THEN
       BEGIN
         REPEAT
           begin
             IF i>j THEN i := i-j;
             IF j>i THEN j := j-i;
           end;
         UNTIL (i=j);
         o:=o div i;
         y:=y div i;
       END;

      {Typwsi twn apotelesmatwn stin othoni}
       begin
          writeln(' ',a,'   ',c,'    ',o,' ');
          writeln(' ','-',' ',k,' ','-','','=','',l,'  ','--');
          writeln(' ',b,'   ',d,'    ',y,' ');
       end;
     END;

   END;

   (*diavasma xaraktira gia tin epanalipsi tis diadikasias kai
     pragmatopoiisi tis epithymias tou xristi me to klisimo until*)
   writeln('na epanaliuthei i diadikasia? y/n');
   readln(t);
  UNTIL(t = 'n');
end.
