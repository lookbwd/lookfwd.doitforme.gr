Program Prosthesi20 (input,output);
Var Ari8mos , Sum , Counter: integer;
begin;
Counter:=0; Sum:=0;
Writeln ('8a pros8esw mexri 20 ari8mous, mexri na synanthsw 0'); writeln;
   repeat
        begin;
        Counter:=Counter + 1;
        Write ('Dwse ton ',Counter,'o ari8mo : ');
        readln(Ari8mos);
        Sum := Sum + Ari8mos;
        end;
   until ((Counter=20) or (Ari8mos=0));
if (ari8mos=0) then Counter := Counter - 1;
writeln; Writeln('To a8roisma twn ',Counter,' ari8mwn einai : ', Sum ); writeln;
Writeln ('Fxaristw ! ');
End.