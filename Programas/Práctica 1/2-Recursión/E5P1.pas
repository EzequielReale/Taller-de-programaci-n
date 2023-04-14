program E5P1;

const
	dimF = 20;

type
	vector = array [1..dimF] of integer; 

procedure leerYCargar(var v:vector; var dimL:integer);
var
	num:integer;
BEGIN
	dimL:= 0;
	write('Escriba un numero al azar: ');
	readln(num);
	while (num <> 0) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= num;
		write('Escriba un numero al azar: ');
		readln(num);
	end;
END;


procedure Encontrar_Maximo(v:vector;var max:integer;i:integer;dimL:integer);
Begin
    if (i < dimL) then
    begin
        if (v[i] > max) then
        begin
            max:=v[i];
        end;
        i:=i+1;
        Encontrar_Maximo(v,max,i,dimL);
    end;
End;
//_______________________________________________________________
procedure Suma_Vector(v:vector;var suma:integer;i:integer);
Begin
    if (i < dimF) then
    begin
        suma:=suma + v[i];
        i:=i+1;
        Suma_Vector(v,Suma,i);
    end;
End;
//_______________________________________________________________
var
    v:vector;
    maximo,dimL:integer;
    contador:integer;
    Suma:integer;
begin
    Suma:=0;
    contador:=1;
    maximo:=-1;
    leerYCargar(v,dimL); //A
    Encontrar_Maximo(v,maximo,contador,dimL); //B
    WriteLn('El valor maximo es: ', maximo);
    Suma_Vector(v,Suma,contador);
    writeln('La suma total del vector es: ', Suma);
    readln();
end.