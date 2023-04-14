program E11P1;

const
	GENERO = 8;

type
	subrango = 1..GENERO;

	pelicula = record
		codP: integer;
		codG: subrango;
		puntaje: real; 
	end;

	peliculaa = record
		codP: integer;
		codG: subrango;
	end;

	lista = ^nodo;

	nodo = record
		dato: pelicula;
		sig: lista;
	end;

	Vlista = array [1..GENERO] of lista;
//______________________________________________________________________________________

procedure inicializar(var v:Vlista);
var
	i:subrango;
BEGIN
	for i:= 1 to GENERO do
		v[i]:=nil;
END;
//______________________________________________________________________________________

procedure leer (var P:pelicula); 
BEGIN
  write('Codigo de pelicula: '); readln(P.codP);
    if (P.codP <> -1) then begin
      write('Codigo de genero: '); readln(P.codG);
      write('Puntaje promedio: '); readln(P.puntaje);
    end;
END;
//______________________________________________________________________________________

procedure insertarOrdenado (var L:lista; P:pelicula);
var
  aux, ant, act: lista;
BEGIN
  new(aux);
  aux^.dato:= P;
  aux^.sig:= nil;
  if (L = nil) then
    L:= aux
  else begin
    ant:= L; act:= L;
    while (act <> nil) and (act^.dato.codP < aux^.dato.codP) do begin
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

procedure cargar (var v:Vlista);
var
	P:pelicula;
BEGIN
	inicializar(v);
	leer(P);
	while (P.codP <> -1) do begin
		insertarOrdenado(v[P.codG],P);
		leer(P);
	end;
END;
//______________________________________________________________________________________

procedure agregarAtras (var L,ult:lista; elem:pelicula);
var
	nue: lista;
BEGIN
	new(nue); nue^.dato:= elem; nue^.sig:= nil;
	
	if (L = nil) then
		L:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
END;
//______________________________________________________________________________________

procedure minimo (var v:Vlista; var min:pelicula);
var 
	i, posMin: subrango;
  BEGIN
    min.codP:= maxint;
	for i:= 1 to GENERO do begin
		if (v[i] <> nil) then
			if (v[i]^.dato.codP  < min.codP ) then begin
				min:= v[i]^.dato;
				posMin:= i;
			end;
	end;
	if (min.codP <> maxint) then 
		v[posMin]:= v[posMin]^.sig
END;
//______________________________________________________________________________________

procedure merge (v:Vlista; var L:lista);
var 
	ult: lista;
	min: pelicula;
BEGIN
	L:= nil; ult:= nil;
	minimo (v,min);
	while (min.codP <> maxint) do begin
		agregarAtras (L,ult,min);
		minimo (v,min);
	end;
END;
//______________________________________________________________________________________

procedure imprimir (L:lista);
BEGIN
	writeln('----------------------------------------------');
	writeln('Merge:');
	writeln;
	while (L <> nil) do begin
		writeln('Pelicula codigo: ',L^.dato.codP);
		writeln('Genero: ',L^.dato.codG);
		writeln('Puntaje: ',L^.dato.puntaje:1:2);
		writeln;
		L:= L^.sig;
	end;
END;
//______________________________________________________________________________________

var
	v:Vlista;
	L:lista;
BEGIN
	cargar(v);
	merge(v,L);
	imprimir(L);
	readln;
END.
