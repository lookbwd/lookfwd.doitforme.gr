program ask3(input,output);
   {prakseis metaxi klasmaton, parousiasi kai aplopoiisi paotelesmatos}
    var k,l,m,n,a,b,c,d,i,j:integer;
        answer:char;
begin
  repeat
  writeln('enter your fractions');
  write('enter the numerator of the first fraction, then press <enter>:');
  read(k);readln;
  if (k>9) or (k<-9) then writeln('wrong data')
     else
      begin{1}
  write('enter the denominator of the first, then press <enter>:');
  read(l);readln;
  if (l>9) or (l<-9) or (l=0) then writeln('wrong data')
     else
      begin{2}
  write('enter the numerator of the second, then press <enter>:');
  read(m);readln;
  if (m>9) or (m<-9) then writeln('wrong data')
     else
      begin{3}
  write('enter the denominator of the second, then press <enter>:');
  read(n);readln;
  if (n>9) or (n<-9) or (n=0) then writeln('wrong data')
     else
      begin{4}
  writeln('you are about to enter the numerical procedure');
  writeln('press(1) for add');
  writeln('press(2) for substraction');
  writeln('press(3) for multiplication');
  writeln('press(4) for division');
  writeln('now, enter the procedure, them press <enter>:');
  read(a);readln;
  if (a>4) or (a<1) then writeln ('wrong data')
     else
      begin{5}
  case a of
     1:begin
         b:=(k*n+m*l);
         c:=l*n;
         d:=b div c;
         i:=abs(b);j:=abs(c);
         while i<>j do
         if i>j then i:=i-j else j:=j-i;
         writeln (k:1,'',m:1,'',b:2,' ',(b-c*d)/i:1:0);
         writeln('-','+','-','=','--','=',d:2,'--');
         writeln(l:1,'',n:1,'',c:2,' ',(c/i):1:0);
       end;
     2:begin
         b:=(k*n-l*m);
         c:=l*n;
         d:=b div c;
         i:=abs(b);j:=abs(c);
         while i<>j do
         if i>j then i:=i-j else j:=j-i;
         writeln (k:1,'',m:1,'',b:2,' ',(b-c*d)/i:1:0);
         writeln('-','-','-','=','--','=',d:2,'--');
         writeln(l:1,'',n:1,'',c:2,' ',(c/i):1:0);
       end;
     3:begin
         b:=k*m;
         c:=l*n;
         d:=b div c;
         i:=abs(b);j:=abs(c);
         while i<>j do
         writeln (k:1,'',m:1,'',b:2,' ',(b-c*d)/i:1:0);
         writeln('-','*','-','=','--','=',d:2,'--');
         writeln(l:1,'',n:1,'',c:2,' ',(c/i):1:0);
       end;
     4:begin
         if(m=0) then writeln('wrong data')
             else
              begin
               b:=k*m;
               c:=l*n;
               d:=b div c;
               i:=abs(b);j:=abs(c);
               while i<>j do
               writeln (k:1,'',m:1,'',b:2,' ',(b-c*d)/i:1:0);
               writeln('-','*','-','=','--','=',d:2,'--');
               writeln(l:1,'',n:1,'',c:2,' ',(c/i):1:0);
               end;
       end;
  end(*case a of*)
    end{5}
    end{4}
    end{3}
    end{2}
    end{1};
  writeln('do you wish to repeat?(y/n)?');
  readln(answer);
  until answer='n';
  writeln('have a nice day!!!');
end.