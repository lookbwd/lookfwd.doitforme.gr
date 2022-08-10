Program Prosthesi_Klasmatos (input,output);
Var Ar1 , Ar2, Ar3 , Par1 ,Par2 , Par3 : integer; Choise :char;
begin;

(* Procedures/Functions *)

 
function Eisagwgh_ari8mou(frasi : string(30)) : integer;
(*Εμφανίζει "Dwse mou ton" & μετά την φράση  που στέλνουμε στην διαδικασία. Επιστρέφει την τιμή που πληκτρολογούμε*)
begin
Write ('Dwse mou ton ',frasi,' : ');
Readln(Eisagwgh_ari8mou);
end;

procedure la8os;		(*Μήνυμα λάθους παρονομαστή*)
begin
writeln ('O paronomasths den prepei na einai 0');
end;

procedure Ektelesh_praxis; 		(*Εκτέλεση της πρόσθεσης*)
begin
Ar3:=Par1*Ar2+Par2*Ar1;
Par3:=Par1*Par2;
end;

procedure Emfanish_apotelesmatwn; (*Εμφάνιση κλασμάτων*)
begin
if ((Ar3 mod Par3)<>0) then
   begin
   writeln(Ar1:2 ,' ',Ar2:3,' ',Ar3:3,' ',(Ar3 mod Par3));
   writeln('--- + --- = ---- = ', (Ar3 div Par3),' --');
   writeln(Par1:2,' ',Par2:3,' ',Par3:3,' ', Par3);
   end
else
   begin
   writeln(Ar1:2 ,' ', Ar2:3,' ', Ar3:3 );
   writeln('--- + --- = ----');
   writeln(Par1:2,' ',Par2:3,' ',Par3:3 );
   end;
end;

procedure Epilogh_E3odou; 		(*Ρωτάει αν επιθυμούμε συνέχεια*)
begin
write('8elete na epanalabete thn diadikasia (Y/N)? ');
read(Choise); readln;
writeln;
end;

 (* Main Program *)


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