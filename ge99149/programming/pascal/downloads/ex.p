Program Prosthesi(input, output);
Var No1,No2:integer;

Procedure emfanish_mynhmatos;
	Begin
	Writeln ('Dwse 2 ari8mous gia prosthesi')
	End;

Procedure eisagwgh_ari8mwn(var No1,No2 : integer);
	Begin
	Write ('Prwtos ari8mos : '); readln(No1);
	Write ('Deuteros ari8mos : '); readln(No2)
	End;

Function A8risma (No1,No2 : integer) : integer ;
	Begin
	A8risma:=No1+No2
End;

Begin

emfanish_mynhmatos;

eisagwgh_ari8mwn(No1,No2);

writeln (No1,' + ',No2, ' = ',A8risma(No1,No2));

end.