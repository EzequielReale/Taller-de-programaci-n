program E2P1adicional;

const
	dimF = 7;

type
	entrada = record
		codigo, dia, asiento: integer;
		monto: real;
	end;

	lista = ^nodo;
	lista2 = ^nodo;
	nodo = record
		dato: entrada;
		sig: lista;
	end;

	vListas = array [1..dimF] of lista;


procedure leer(var e:entrada);
BEGIN
	write('Ingrese el codigo de obra: '); readln(e.codigo);
		if (e.codigo <> 0) then begin
			write('Ingrese el dia: '); readln(e.dia);
			write('Ingrese el asiento: '); readln(e.asiento);
			write('Ingrese el monto: '); readln(e.monto);
		end;
END;

procedure insertarOrdenado(var L:lista; e:entrada);
var
	aux, ant, act: lista;
BEGIN
 	new(aux);
 	aux^.dato:= e;
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

procedure cargarLista(var v:vListas);
var
	i: integer;
	e:entrada;
BEGIN
	for i:= 1 to dimF do
		v[i]:= nil;
	leer(e);
	while (e.codigo <> 0) do begin
		insertarOrdenado(v[e.dia],e);
		leer(e);
	end;
END;
//______________________________________________________________________________________

procedure crearLista2(var l2:lista2; v:vListas);
var
	i: integer;
BEGIN
	l2:= nil;
	for i:= 1 to dimF do begin
		while (v[i] <> nil) do begin
			insertarOrdenado(l2,v[i]^.dato);
			v[i]:= v[i]^.sig;
		end;
	end;
END;

//______________________________________________________________________________________

procedure imprimirRecursivo(l2:lista2);
BEGIN
	if (l2 <> nil) then begin
		writeln('Codigo de obra: ',l2^.dato.codigo);
		writeln('Dia: ',l2^.dato.dia);
		writeln('Asiento asignado: ',l2^.dato.asiento);
		writeln('Monto a pagar: ',l2^.dato.monto:1:2);
		imprimirRecursivo(l2^.sig)
	end;
END;

//______________________________________________________________________________________


var
	v:vListas;
	l2:lista2;
BEGIN
	cargarLista(v);
	crearLista2(l2,v);
	imprimirRecursivo(l2);
END.
