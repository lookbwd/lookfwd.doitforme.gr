program graph (input ,output,GRAPHFIL);

const wid=39;

var     x,dx,scale:real;
        n,k,l,i,m,p,bounda,boundb:integer;
        checkn,checkm:boolean;
        graphfil:text;
        line :array [-wid..wid] of char;
        question:char;

     function f (x:real):real;
        begin
        f:= 3* exp( -x) *sin(3*x);
        end;

     function g (x:real):real;
        begin
        g:= 3* exp(-(x+1));
        end;

      function fit (n,m :integer ):boolean;
        begin
        fit:= true; checkn := false; checkm:= false;
        if (n<-wid) or (n>wid) then
            begin
            checkn := true; fit :=false; k:=k+1;
            end;
        if (m<-wid) or (m>wid) then
            begin
            checkm := true ; fit := false; l:=l+1;
            end;
        if checkn then line[m]:='.';
        if checkm then line[n]:='*';
        end;


begin
       repeat

      (*  ENTERING DATA  *)

     writeln;writeln;writeln;
     writeln ('            ****                GRAPH	            ****');
     writeln;writeln;
     writeln ('This program makes the graph of f(x)=3e^(-x)sin(3x) and g(x)=3e^[-(x+1)].');
     writeln;
     write ('Give first and last border of the graphs, devided by a space  :');
                  readln(bounda, boundb);
                  while (bounda>=boundb) do
 	                begin
                        writeln;
                        writeln(' !! Last border must be bigger than the first border .');
                        write   ('Give borders again      :');
                        readln(bounda, boundb);writeln;
                        end;
     write ('Give the deltax of the graphs                :');
                   readln(dx);
                   while dx<=0 do
                     begin
                     writeln;
                     writeln ('!! Deltax must be positive and greater than 0.');
                     write ('Give deltax again         :');
                     readln (dx);
                     end;
     write ('Give the scale of the graphs                 :');
                   readln(scale);



      (*  MAIN BODY    *)

     assign(graphfil,'c:\peter\pascal\ergasies\graphfil.txt');
     x:= bounda*dx;   rewrite (graphfil);  k:=0; l:=0;
     for i:= bounda to boundb do
  (*1*)begin
           for p:= -wid to wid do line[p]:=' '; line[0]:='|';
           n:= round (scale*f(x));
           m:= round (scale*g(x));

            if i=0 then
                  begin
                  for p:= -wid to wid do
                      line[p]:='-'; line[0]:='+';
                  end;

           if fit(n,m) then
                  begin
                  line[n] := '*'; line[m] := '.';
                  if n=m then line[n]:='o';
                  end;


      (*  OYTPUT   *)


      for p:=-wid to (wid-1) do
              begin
              write (line[p]); write (graphfil, line[p]);
              end;
      writeln (line[wid]); writeln (graphfil, line[wid]);
      x:=x+dx;
(*1*)end;

      write (graphfil, 'border a :',bounda:5,'   border b :',boundb:5,'   scale :',scale:5,'   deltax :',dx:5);
      close (graphfil);


      (*  END   *)

     writeln;
     if k>0 then writeln (' The graph of f(x) does not fit  ...');
     if l>0 then writeln (' The graph of g(x) does not fit  ... ');
     writeln;
     write ('Do you wish to go once more? Type -Y- for Yes or -N- for No :');
                readln (question);
                while (question<>'y') and (question<>'n') do
                  begin
                  write ('(Y/N) ?   :');
                  readln (question);
                  end;
      writeln;writeln;writeln;
      until (question='n');
end.