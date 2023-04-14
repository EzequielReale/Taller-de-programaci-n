program E13P1;

const
	dimF = 7;
	ALTO = 100000;

type
	entradas = record
		codigo: longint;
		asiento: integer;
		monto: real;
	end;

	lista = ^nodo;
	nodo = record
		dato: entradas;
		sig: lista;
	end;

	Vlista = array [1..dimF] of lista;

	entrada2 = record
		codO:longint;
		cant:integer;
	end;
	 
	lista2 = ^nodo2;
	nodo2 = record
		dato:entrada2;
		sig:lista2;
	end;


procedure leer(var e:entradas);
BEGIN
	with e do begin
		write('Codigo de obra: '); readln(codigo);
		if (codigo <> 0) then begin
			write('Asiento nro: '); readln(asiento);
			write('Monto: '); readln(monto);
		end;
	end;
END;
//______________________________________________________________________________________

procedure insertarOrdenado(var L:lista; e:entradas);
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
		while (act <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin //ordenado de mayor a menor
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
//______________________________________________________________________________________

procedure cargarListaS(var v:Vlista);
var
	i: integer;
	e: entradas;
BEGIN
	for i:= 1 to dimF do begin
		v[i]:= nil;
		leer(e);
		while (e.codigo <> 0) do begin
			insertarOrdenado(v[i],e);
			leer(e);
		end;
	end;
END;
//______________________________________________________________________________________

procedure imprimirListaS(v:Vlista);
var
	i: integer;
	actual: longint;
BEGIN
	for i:= 1 to dimF do begin
		writeln;
		writeln('Dia ',i,':');
		while (v[i] <> nil) do begin
			writeln;
			actual:= v[i]^.dato.codigo;
			writeln('Entradas para la obra nro: ',actual); writeln;
			while (v[i] <> nil) and (v[i]^.dato.codigo = actual) do begin
				writeln('Asiento: ',v[i]^.dato.asiento);
				writeln('Monto: ',v[i]^.dato.monto:1:1);
				v[i]:= v[i]^.sig
			end;
		end;
	end;
END;
//______________________________________________________________________________________
procedure agregarAtras (var L,ult:lista2; elem:entrada2);
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
//______________________________________________________________________________________

procedure minimoMerge(var v:Vlista; var minimo:longint);
Var	
	posMin,i:integer;
BEGIN
	minimo:= ALTO; //Le pongo un numero muy alto para que haya al menos 1 minimo
	for i:= 1 to dimF do begin
		if (v[i] <> nil) and (v[i]^.dato.codigo <= minimo) then begin
			posMin:= i;
			minimo:= v[posMin]^.dato.codigo;  
		end;
	end;
	if (minimo <> ALTO) then // si se actualizó el índice minimo, se modifica el estante de donde se sacó dicho minimo y se guarda el monto	
		v[posMin]:= v[posMin]^.sig;
END;
//______________________________________________________________________________________

procedure mergeAcumulador(v:Vlista; var Lnueva:lista2);
var
	minimo: longint;
	actual: entrada2;
	ult:lista2;
BEGIN
	Lnueva := nil;  //inicializa la nueva lista
	ult:=nil;

	minimoMerge (v,minimo);
	while (minimo <> ALTO) do begin
		actual.codO:= minimo; //actual
		actual.cant:= 0;   
		while ((minimo <> ALTO) and (minimo = actual.codO)) do begin {mientras no llegue al final ni cambie de codigo}
			actual.cant:= actual.cant + 1;
			minimoMerge (v,minimo); //calcula otro minimo
		end;
		agregarAtras(Lnueva,ult,actual);
	end;
END;
//______________________________________________________________________________________

procedure imprimirListaNueva(L:lista2);
BEGIN
	writeln; writeln;
	writeln('Total de la semana:');
	while (L <> nil) do begin
		writeln;
		writeln('Entradas para la obra nro ',L^.dato.codO,': ',L^.dato.cant); writeln;
		L:= L^.sig;
	end;
END;
//______________________________________________________________________________________


var
	v: Vlista;
	Lnueva: lista2;
BEGIN
	cargarListaS(v);
	imprimirListaS(v);
	mergeAcumulador(v,Lnueva);
	imprimirListaNueva(Lnueva);
	readln;
END.
