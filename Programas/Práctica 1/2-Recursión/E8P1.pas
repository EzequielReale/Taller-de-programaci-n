program E8P1;

type
	arbol = ^nodo;
	nodo = record
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;


procedure insertarNodo(var a:arbol; x:integer);
BEGIN
	if (a = nil) then begin
		new(a);
		a^.dato:= x;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (a^.dato > x) then
			insertarNodo(a^.HI,x)
		else
			if (a^.dato < x) then
				insertarNodo(a^.HD,x);
END;


procedure cargarArbol(var a:arbol);
var
	x: integer;
BEGIN
	a:= nil;
	write('Ingrese un numero: '); readln(x);
		while (x <> 0) do begin
			insertarNodo(a,x);
			write('Ingrese un numero: '); readln(x);
		end;
END;


procedure maximo(a:arbol; var max:integer);
BEGIN
	if (a = nil) then
		max:= -maxint
	else
		if (a^.HD = nil) then
			max:= a^.dato
		else
			maximo(a^.HD,max); 
END;


procedure minimo(a:arbol; var min:integer);
BEGIN
	if (a = nil) then
		min:= maxint
	else
		if (a^.HI = nil) then
			min:= a^.dato
		else
			minimo(a^.HI,min); 
END;


procedure cantidadElementos(a:arbol; var cant:integer);
BEGIN
	if (a <> nil) then begin 
		cant:= cant + 1;
		cantidadElementos(a^.HI,cant);
		cantidadElementos(a^.HD,cant);
	end;
END;


procedure enOrden(a:arbol);
BEGIN
	if (a <> nil) then begin
		enOrden(a^.HI);
		write(a^.dato,' - ');
		enOrden(a^.HD);
	end;
END;


procedure enDesOrden(a:arbol);
BEGIN
	if (a <> nil) then begin
		enDesOrden(a^.HD);
		if (a^.dato mod 2 = 0) then
			write(a^.dato,' - ');
		enDesOrden(a^.HI);
	end;
END;


procedure recorrer(a:arbol);
var
	max, min, cant: integer;
BEGIN
	cant:= 0;
	maximo(a,max);
	writeln;
	writeln('Numero maximo: ',max);
	minimo(a,min);
	writeln;
	writeln('Numero minimo: ',min);
	cantidadElementos(a,cant);
	writeln;
	writeln('Cantidad de elementos: ',cant);
	writeln('--------------');
	write('Arbol escrito en orden: ');
	enOrden(a);
	writeln;
	writeln('--------------');
	write('Arbol escrito de forma decreciente (solo numeros pares): ');
	enDesOrden(a);
END;

{modulos alt

function MaximoDeArbol(a: arbol):integer;
begin
	if (a = nil) then begin
		MaximoDeArbol := -9999;
	end
	else begin
		if (a^.HD = nil) then begin
			MaximoDeArbol := a^.dato;
		end
		else begin
			MaximoDeArbol := MaximoDeArbol(a^.HD);
		end;	
	end;
end;

function CantidadElementos(a: arbol):integer;
begin
	if (a = nil) then begin
		CantidadElementos := 0;
	end
	else begin
		CantidadElementos := 1 + CantidadElementos(a^.HI) + CantidadElementos(a^.HD);
	end;
end;
}

var
a: arbol;

BEGIN
	cargarArbol(a);
	recorrer(a);
	readln;
END.
