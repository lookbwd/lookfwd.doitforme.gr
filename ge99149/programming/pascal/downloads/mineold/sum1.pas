program add(input,output);

   var a,b,c,d : integer;

begin
   writeln('8a ppos8esw 2 klasmata');
   writeln('-------------------------');
   write('Dwse ton ari8mith tou prwtou : ');
   read(a); readln;

   repeat 
      write('Dwse ton paronomasth tou prwtou : ');
      read(b); readln;
      if b=0 then writeln('The denominator cannot be zero ! Try again');
   until b<>0;

   write('Dwse ton ari8mith tou deuterou : ');
   read(c); readln;

   repeat
   write('Dwse ton paronomasth tou deuterou : ');
      read(d); readln;
      if d=0 then writeln('The denominator cannot be zero ! Try again');   
      until d<>0;

   if b=d then writeln('Sum: ',a+c,'/',b) 
          else writeln('Sum: ',a*d+c*b,'/',b*d)
end.