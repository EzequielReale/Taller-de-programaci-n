program modulos;

const
	dimF = 20;
type
	vector = array [1..dimF] of integer;
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	
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


procedure imprimir(v:vector; dimL:integer);
var
	i:integer;
BEGIN
	for i:= 1 to dimL do
	  writeln('El numero ',v[i])
END;


procedure eliminar(var v:vector; var dimL:integer; num:integer);
var
	i,p:integer;
BEGIN
	p:= 1;
	while (p < dimL) and (v[p] <> num) do
		p:= p + 1;
	if (p > dimL) then
		writeln('El numero ingresado no estaba')
	else begin
		for i:= p to dimL-1 do
			v[i]:= v[i+1];
		dimL:= dimL - 1;
	end;
END;


procedure agregarAdelante(var L:lista; num:integer);
var
	aux:lista;
BEGIN
	new(aux);
	aux^.dato:= num;
	aux^.sig:= L;
	L:= aux;
END;


Procedure agregarAtras(var l, ult:lista; num:integer);
var
	nue:lista;
BEGIN
	new(nue);
	nue^.elem:= num;
	nue^.sig:= nil;
	if (l = nil) then
		l:=nue
	else
		ult^.sig:=nue;
	ult:= nue;
END;


procedure cargarListaAgregandoAtras(var L: lista);
var
	ult: lista;
	num: integer;
BEGIN
	L:=nil;
	Randomize;
	writeln('Los datos de la lista son generados aleatoriamente entre el 0 y el 15');
	num:= random(16);
	while (num <> 15) do begin
		agregarAtras(L, ult, num);
		num:= random(16);
	end;
END;


procedure cargarListaAgregandoAdelante(var L:lista);
var 
	num: integer;
BEGIN
	L:= nil;
	Randomize;
	writeln('Los datos de la lista son generados aleatoriamente entre el 0 y el 15');
	num:= random(16);
	while (num <> 15) do begin
		agregarAdelante(L,num);
		num:= random(16);
	end;
END;

var

BEGIN

	
END.

