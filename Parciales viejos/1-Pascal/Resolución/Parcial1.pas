program Parcial1;

const
	dimF = 5;
type
	venta = record
		codigo: integer;
		cantVendida: integer;
		monto: real;
	end;

	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;


	venta2 = record
		codigo: integer;
		totalVentas: integer;
	end;

	lista2 = ^nodo2;
	nodo2 = record
		dato: venta2;
		sig: lista2;
	end;

	vector = array [1..dimF] of lista;

	

procedure leer(var v:venta);
BEGIN
	write('Ingrese codigo de producto: '); readln(v.codigo);
	if (v.codigo <> -1) then begin
		write('Ingrese la cantidad de productos vendidos: '); readln(v.cantVendida);
		write('Ingrese monto de producto: '); readln(v.monto);
	end;
END;

procedure insertarOrdenado(var L:lista; v:venta); //en orden segun x parametro
var
  aux, ant, act: lista;
BEGIN
 	new(aux);
 	aux^.dato:= v;
 	aux^.sig:= nil;
 	if (L = nil) then
		L:= aux
	else begin
		ant:= L; act:= L;
		while (act <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin
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

procedure inicializar(var v:vector);
var
	i: integer;
BEGIN
	for i:= 1 to dimF do
		v[i]:= nil;
END;

procedure cargarListas(var vec:vector);
var
	v: venta;
	i, cantVentas: integer;
BEGIN
	inicializar(vec);
	for i:= 1 to dimF do begin
		cantVentas:= 0;
		leer(v);
		while ((cantVentas < 200) and (v.codigo <> -1)) do begin
			insertarOrdenado(vec[i],v);
			leer(v);
		end;
	end;
END;
//______________________________________________________________________________________

procedure agregarAtras(var L,ult:lista2; elem:venta2);
var
	nue: lista2;
BEGIN
	new(nue); nue^.dato:= elem; nue^.sig:= nil;
	
	if (L = nil) then
		L:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
END;

procedure minimoMerge(var v:vector; var minimo:venta);
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


procedure mergeAcumulador(v:vector; var l2:lista2);
var
	minimo: venta;
	actual: venta2;
	ult: lista2;
BEGIN
	l2:= nil; ult:= nil;

	minimoMerge (v,minimo);
	while (minimo.codigo <> maxint) do begin
		actual.codigo:= minimo.codigo;
		actual.totalVentas:= 0;
		while ((minimo.codigo <> maxint) and (minimo.codigo = actual.codigo)) do begin
			actual.totalVentas:= actual.totalVentas + minimo.cantVendida;
			minimoMerge (v,minimo);
		end;
		agregarAtras(l2,ult,actual);
	end;
END;
//______________________________________________________________________________________

procedure mas500(l:lista2; var cant: integer);
BEGIN
	if (l <> nil) then begin;
		if (l^.dato.totalVentas > 500) then
			cant:= cant + 1;
		mas500(l^.sig,cant);
	end;
END;

var
	v:vector;
	l: lista2;
	cant: integer;
BEGIN
	cant:= 0;
	cargarListas(v);
	mergeAcumulador(v,l);
	mas500(l,cant);
	writeln('Cantidad de productos que superaron las 500 ventas: ',cant);
END.
