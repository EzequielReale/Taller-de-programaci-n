program E5P1adicional;

const
	dimF = 5;
	ALTO = 100000;

type
	cliente = record
		sucursal, codigo, minutos: integer;
		dni: longint;
		fecha: string;
	end;

	lista = ^nodo;
	nodo = record
		dato: cliente;
		sig: lista;
	end;

	vlistas = array [1..5] of lista;

	cliente2 = record
		codigo: integer;
		dni: longint;
		cant: integer;
	end;

	arbol = ^nodo2;
	nodo2 = record
		dato: cliente2;
		HI: arbol;
		HD: arbol
	end;
//______________________________________________________________________________________

procedure leer(var c:cliente);
BEGIN
	with c do begin
		write('Ingrese codigo de cliente: '); readln(codigo);
		if (codigo <> -1) then begin
			write('Ingrese el numero de sucursal [1..5]: '); readln(sucursal);
			write('Ingrese DNI del cliente: '); readln(dni);
			write('Ingrese la fecha en la que asisitio el cliente: '); readln(fecha);
			write('Ingrese la cantidad de minutos que estuvo el cliente: '); readln(minutos);
		end;
	end;
END;

procedure insertarOrdenado(var L:lista; c:cliente);
var
  aux, ant, act: lista;
BEGIN
 	new(aux);
 	aux^.dato:= c;
 	aux^.sig:= nil;
 	if (L = nil) then
		L:= aux
	else begin
		ant:= L; act:= L;
		while (act <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin //ordenado de menor a mayor
			ant:= act;
			act:= act^.sig;
		end;
		if (ant = act) then begin
			aux^.sig:= L;
			L:= aux;
		end
		else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;
END;

procedure cargarListas(var v:vlistas);
var
	i: integer;
	c: cliente;
BEGIN
	for i:= 1 to 5 do
		v[i]:= nil;
	leer(c);
	while (c.codigo <> -1) do begin
		insertarOrdenado(v[c.sucursal],c);
		leer(c);
	end;
END;
//______________________________________________________________________________________

procedure insertarNodo(var a:arbol; c:cliente2);
BEGIN
	if (a = nil) then begin
		new(a);
		a^.dato:= c;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (a^.dato.dni > c.dni) then
			insertarNodo(a^.HI,c)
		else
			if (a^.dato.dni < c.dni) then
				insertarNodo(a^.HD,c);
END;

procedure minimoMerge(var v:vlistas; var minimo:cliente);
Var	
	posMin,i: integer;
BEGIN
	minimo.codigo:= maxint;
	for i:= 1 to dimF do begin
		if (v[i] <> nil) and (v[i]^.dato.codigo <= minimo.codigo) then begin
			posMin:= i;
			minimo:= v[posMin]^.dato;  
		end;
	end;
	if (minimo.codigo <> maxint) then
		v[posMin]:= v[posMin]^.sig;
END;


Procedure mergeAcumulador(v:vlistas; var a:arbol);
var
	minimo: cliente;
	actual: cliente2;
	codigoAct: integer;
BEGIN
	a:= nil;

	minimoMerge (v,minimo);
	while (minimo.codigo <> maxint) do begin
		codigoAct:= minimo.codigo;
		actual.dni:= minimo.dni;
		actual.cant:= 0;
		while ((minimo.codigo <> maxint) and (minimo.codigo = codigoAct)) do begin
			actual.cant:= actual.cant + 1;
			minimoMerge (v,minimo);
		end;
		insertarNodo(a,actual);
	end;
END;

procedure imprimirArbolCreciente(a:arbol); //módulos opcionales para comprobar que el programa funciona correctamente
BEGIN
	 if (a <> nil) then begin
		 imprimirArbolCreciente(a^.HI);
		 write(a^.dato.dni,' - ');
		 writeln(a^.dato.cant);
		 imprimirArbolCreciente(a^.HD);
	 end;
END;

procedure imprimirLista(v:vlistas);
var
	i:integer;
BEGIN
	for i:= 1 to 5 do begin
		while (v[i] <> nil) do begin
			writeln(v[i]^.dato.dni);
			V[i]:= v[i]^.sig;
		end;
	end;
END;
//______________________________________________________________________________________

var
	v:vlistas;
	a:arbol;
BEGIN
	cargarListas(v);
	mergeAcumulador(v,a);
	writeln;
	imprimirArbolCreciente(a);
END.