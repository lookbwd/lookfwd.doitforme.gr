(*papakonstantinou panagiotis*)
(*deutera 13 noembriou 2000 *)


program klasmata (input,output);

          (* Any praxi between two fractions*)

        var a,b,p,r,c,d,e,f,m,q,g,h:integer;
        pra,question:char;

begin
    repeat
    writeln;writeln;writeln;
    writeln ('                 PRAXIS METAXI KLASMATON');  writeln;  writeln;
    write ('Give the arithmiti of the first fraction      :');  readln (a);
    while ((a>=10) or (a<0)) do
           begin
           write ('The number must be between 0-9.Give number again  :');
           readln (a);end;
    write ('Give the paranomasti of the first fraction    :');  readln (b);
    while ((b>=10) or (b<=0)) do
           begin
           write ('The number must be between 1-9.Give number again  :');
           readln (b);end;
    write ('Give the arithmiti of the second fraction     :');  readln (c);
    while ((c>=10) or (c<0)) do
           begin
           write ('The number must be between 0-9.Give number again  :');
           readln (c);end;
    write ('Give the paranomasti of the second fraction   :');  readln (d);
    while ((d>=10) or (d<=0)) do
           begin
           write ('The number must be between 1-9.Give number again  :');
           readln (d);end;
  write ('Give the praxi                                :');
  readln (pra);
  while ((pra<>'+') and (pra<>'-') and (pra <>'*') and (pra<>'/')) do
           begin
           write ('Praxi must be  +,-,*,/. Give praxi again          :');
           readln (pra);end;
  if ((pra='/') and (c=0)) then
  while (c=0) do
            begin
            write ('You have to give the arithmiti of the second ');
            write ('fraction again because praxi is /.   Arithmiti      :');
            readln (c);end;
   case pra of
  '+': begin
         e:=a*d+c*b;
         f:=b*d;end;
  '-': begin
         e:=a*d-c*b;
         f:=b*d;end;
  '*': begin
         e:=a*c;
         f:=b*d;end;
  '/': begin
         e:=a*d;
         f:=b*c;end;end;
  if (e=0) then
        begin
        writeln(a,'   ',c,'   ',e);
        writeln('- ',pra,' - = -- = 0');
        writeln(b,'   ',d,'   ',f);end
  else
    begin (*1*)
    if e>0 then
       begin (*11*)
       p:=e;r:=f;
       while (p>0) and (r>0) do
       if p>=r then p:=p mod r else r:=r mod p;
       g:=e div (p+r);
       h:=f div (p+r);
       if (e<>g) then
            begin(*2*)
            if g>=h then
                   begin(*3*)
                   m:=g div h;
                   q:=g-(m*h);
                   if (h<>1) and (g<>h) then
                           begin
                           writeln(a,'   ',c,'   ',e,'    ',g,'     ',q);
                           writeln('- ',pra,' - = -- = -- = ',m,' --');
                           writeln(b,'   ',d,'   ',f,'    ',h,'     ',h);end
                   else
                           begin
                           writeln(a,'   ',c,'   ',e);
                           writeln('- ',pra,' - = -- = ',m);
                           writeln(b,'   ',d,'   ',f);end;
                   end (*3*)
            else
                   begin
                   writeln( a,'   ',c,'   ',e,'   ',g);
                   writeln('- ',pra,' - = -- = --');
                   writeln( b,'   ',d,'   ',f,'   ',h);
                   end;
            end(*2*)
       else
         begin (*33*)
         if g>=h then
                   begin(*4*)
                   m:=g div h;
                   q:=g-(m*h);
                   if (h<>1) and (g<>h) then
                           begin
                           writeln(a,'   ',c,'   ',e,'     ',q);
                           writeln('- ',pra,' - = -- = ',m,' --');
                           writeln(b,'   ',d,'   ',f,'     ',h);end
                   else
                         begin
                         writeln(a,'   ',c,'   ',e);
                         writeln('- ',pra,' - = -- = ',m);
                         writeln(b,'   ',d,'   ',f);end;
                   end(*4*)
         else
                   begin
                   writeln( a,'   ',c,'   ',e);
                   writeln('- ',pra,' - = -- ');
                   writeln( b,'   ',d,'   ',f);
                   end;
         end;(*33*)
       end (*11*)
    else

          begin (*5*)
          p:=abs (p); e:=abs (e); f:=abs (f);
          p:=e;r:=f;
          while (p>0) and (r>0) do
          if p>=r then p:=p mod r else r:=r mod p;
          g:=e div (p+r);
          h:=f div (p+r);
          if (e<>g) then
             begin (*6*)
             if g>=h then
                   begin (*7*)
                   m:=g div h;
                   q:=g-(m*h);
                   if (h<>1) and (g<>h) then
                           begin
                           writeln(a,'   ',c,'    ',e,'     ',g,'      ',q);
                           writeln('- ',pra,' - =- -- =- -- =- ',m,' --');
                           writeln(b,'   ',d,'    ',f,'     ',h,'      ',h);end
                   else
                           begin
                           writeln(a,'   ',c,'    ',e);
                           writeln('- ',pra,' - =- -- =- ',m);
                           writeln(b,'   ',d,'    ',f);end;
                   end(*7*)
             else
                   begin
                   writeln( a,'   ',c,'    ',e,'    ',g);
                   writeln('- ',pra,' - =- -- =- --');
                   writeln( b,'   ',d,'    ',f,'    ',h);
                   end;
             end (*6*)
          else
             begin (*8*)
             if g>=h then
                   begin (*9*)
                   m:=g div h;
                   q:=g-(m*h);
                   if (h<>1) and (g<>h) then
                         begin
                           writeln(a,'   ',c,'     ',e,'      ',q);
                           writeln('- ',pra,' - =- -- =- ',m,' --');
                           writeln(b,'   ',d,'     ',f,'      ',h);end
                   else
                         begin
                         writeln(a,'   ',c,'    ',e);
                         writeln('- ',pra,' - =- -- =- ',m);
                         writeln(b,'   ',d,'    ',f);end;
                   end (*9*)
             else
                  begin
                  writeln( a,'   ',c,'    ',e);
                  writeln('- ',pra,' - =- -- ');
                  writeln( b,'   ',d,'    ',f);
                  end;
             end;(*8*)
          end;(*5*)
    end;(*1*)
  write ('Do you wish to go once more? Type -Y- for Yes or -N- for No :');
  readln (question);
  while (question<>'y') and (question<>'n') do
                  begin
                  write ('(Y/N) ?   :');
                  readln (question);
                  end;writeln;writeln;writeln;
  until (question='n');
  end.

