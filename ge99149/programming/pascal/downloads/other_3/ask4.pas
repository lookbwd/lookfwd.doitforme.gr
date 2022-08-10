Program dynameis(output);  (*prokeitai mono gia typwsi stin othoni mono,
                             opote vazoume mono output*)
 {euresi arithmwn 4psifiwn pou grafontai san prosthesi twn psifiwn tous
  ypsomenwn stin 4i dynami}

var a: array[0..9] of integer;
    i,j,k,l,t:integer;

BEGIN
  FOR t:=0 to 9 DO a[t]:=t*t*t*t; {gia dieukolinsi orisame ton pinaka a=t^4}
    FOR i:=1 to 9 DO
      FOR j:=0 to 9 DO
        FOR k:=0 to 9 DO
          FOR l:=0 to 9 DO
           IF (i*1000+j*100+k*10+l=a[i]+a[j]+a[k]+a[l])
            then writeln(i:1,j:1,k:1,l:1);
END.
 (*dwste prosoxi sto pws domeitai to programma,
  kathws i mia entoli perixetai stin proigoumeni*)