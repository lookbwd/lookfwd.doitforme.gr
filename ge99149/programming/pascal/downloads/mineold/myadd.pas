Program Prosthesi_Klasmatos (input,output);
Var Ar1 , Ar2, Ar3 , Par1 ,Par2 , Par3 : integer; Choise :char;
begin;

{ Procedures/Functions }

function Eisagwgh_ari8mou(frasi : string(30)) : integer;
begin
Write ('Dwse mou ton ',frasi,' : ');
Readln(Eisagwgh_ari8mou);
end;

procedure la8os;
begin
writeln ('O paronomasths den prepei na einai 0');
end;

procedure Ektelesh_praxis;
begin
Ar3:=Par1*Ar2+Par2*Ar1;
Par3:=Par1*Par2;
end;

procedure Emfanish_apotelesmatwn;
begin
writeln(Ar1:2 ,'     ', Ar2:3,'      ', Ar3:3 );
writeln('---  +  ---  =  ----');
writeln(Par1:2,'     ',Par2:3,'      ',Par3:3 );
end;

procedure Epilogh_E3odou;
begin
write('8elete na epanalabete thn diadikasia (Y/N)? ');
read(Choise); readln;
writeln;
end;

{ Main Program }

begin
repeat begin;
Writeln ('8a pros8esw 2 klasmata.'); writeln;
Ar1:=Eisagwgh_ari8mou('ari8mith tou prwtou');
repeat begin;
Par1:=Eisagwgh_ari8mou('paronomasth tou prwtou');
if (Par1=0) then la8os;
end;
until (Par1<>0);
Ar2:=Eisagwgh_ari8mou('ari8mith tou deuterou');
repeat begin;
Par2:=Eisagwgh_ari8mou('paronom. tou deuterou');
if (Par2=0) then la8os;
end;

until (Par2<>0);
Ektelesh_praxis;
Emfanish_apotelesmatwn;
Epilogh_E3odou
end;
until ((Choise<>'Y') and (Choise<>'y'));
writeln('Fxaristw !');
end.