program    addnums(input,output);
       {eisagogi arithmiti kai paranomasti dio klasmaton,prosthesi ton klasmaton
        ,parousiasi athrismatos xoris aplopoiisi}
   var a,b,c,d,x,y,z,sum:integer;
begin
       writeln('tha prostheso dio klasmata');
       write('dose ton arithmiti tou protou klasmatos,meta patise <enter>:');
       read(a);readln;
       write('tora ton paranomasti tou protou klasmatos,<enter>:');
       read(b);readln;
       write('dose ton arithmiti tou deuterou klasmatos,<enter>:');
       read(c);readln;
       write('tora ton paranomasti tou deuterou klasmatos,<enter>:');
       read(d);readln;
       x:=b*d;
       y:=a*d;
       z:=c*b;
       sum:=y+z;
       writeln('athroisma:',sum,'/',x)
end.