program matrix_operations(input, output);

const size = 5;

type vector = array[1..size] of 0..100;
type matrix = array[1..size,1..size] of 0..100;

var TheMatrix:Matrix;
var tempVector:Vector;
var LimitVector:Vector;
var i:integer;
var demo:integer;

function min(a:vector):integer;
  var counter,imin:integer;
   begin
     imin:=a[1];
     for counter:=2 to size do
        if (a[counter]<imin) then imin:=a[counter];
        min:=imin;
   end;

function max(a:vector):integer;
  var counter,imax:integer;
   begin
     imax:=a[1];
     for counter:=2 to size do
     if (a[counter]>imax) then imax:=a[counter];
     max := imax;
   end;

procedure Extract_Row_From_Matrix(src:matrix; rownum:integer; var dest:vector);
var i:integer;
begin
    for i:=1 to size do
        dest[i]:=src[i,rownum];
end;

procedure Extract_Column_From_Matrix(src:matrix; columnnum:integer; var dest:vector);
var i:integer;
begin
    for i:=1 to size do
        dest[i]:=src[columnnum,i];
end;

procedure Input_Matrix_From_Keyboard(var dest:matrix);
var i,j:integer;
begin
    for i:=1 to size do
       for j:=1 to size do
       begin
          Write('Please type the [',i,',',j,'] digit of the matrix : ');
          readln(dest[i,j]);
       end;
end;

procedure FillDemo(var dest:matrix);
var i,j:integer;
begin
    for i:=1 to size do
       for j:=1 to size do
        dest[i,j]:=i+j-1;
end;

procedure PrintMatrix(src:matrix);
var i,j:integer;
begin
    for i:=1 to size do
       begin;
        for j:=1 to size do
        write(src[i,j]:2, '  ');
	writeln;
	end;
end;

begin
   repeat
   Writeln('Do you want to');
   Writeln('(1) Enter your custom matrix or');
   Writeln('(2) Fill a demo matrix automaticaly?');
   readln(demo);
   until ((demo = 1) or (demo = 2));

   if (demo=1) then Input_Matrix_From_Keyboard(TheMatrix);
   if (demo=2) then FillDemo(TheMatrix);

   writeln('The matrix is : ');
   writeln;

   PrintMatrix(TheMatrix);

   writeln;
   writeln('We will calculate the min and max of a matrix with two ways : ');
   writeln('(1) By extracting columns first and then finding the lim');
   writeln('(2) By extracting rows first and then finding the lim');
   writeln;

   for i:=1 to size do
   begin
      Extract_Column_From_Matrix(TheMatrix,i,tempVector);
      LimitVector[i] := max(tempVector);
   end;
   writeln('(1) Maximum number of matrix is : ' , max(LimitVector));


   for i:=1 to size do
   begin
      Extract_Column_From_Matrix(TheMatrix,i,tempVector);
      LimitVector[i] := min(tempVector);
   end;
   writeln('(1) Maximum number of matrix is : ', min(LimitVector));

   for i:=1 to size do
   begin
      Extract_Row_From_Matrix(TheMatrix,i,tempVector);
      LimitVector[i] := max(tempVector);
   end;
   writeln('(2) Maximum number of matrix is : ', max(LimitVector));

   for i:=1 to size do
   begin
      Extract_Row_From_Matrix(TheMatrix,i,tempVector );
      LimitVector[i] := min(tempVector);
   end;
   writeln('(2) Maximum number of matrix is : ', min(LimitVector));
end.