program E4P1adicional;

type
	auto = record
		anio :  integer;
		patente, marca, modelo: string;
	end;

	arbol = ^nodo;
	nodo = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;

	vector = array [2010..2018] of arbol;
//______________________________________________________________________________________

procedure leer(var a:auto);
BEGIN
	write('Ingrese la patente: '); readln(a.patente);
	if (a.patente <> 'zzz') then begin
		write('Ingrese la marca: '); readln(a.marca);
		write('Ingrese el modelo: '); readln(a.modelo);
		write('Ingrese el anio de fabricacion [2010..2018]: '); readln(a.anio);
	end;
END;

procedure insertarNodo(var a:arbol; auto:auto);
BEGIN
	if (a = nil) then begin
		new(a);
		a^.dato:= auto;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (a^.dato.patente > auto.patente) then
			insertarNodo(a^.HI,auto)
		else
			if (a^.dato.patente < auto.patente) then
				insertarNodo(a^.HD,auto);
END;

procedure cargarArbol(var a:arbol);
var
	aut: auto;
BEGIN
	a:= nil;
	leer(aut);
		while (aut.patente <> 'zzz') do begin
			insertarNodo(a,aut);
			leer(aut);
		end;
END;

procedure imprimirArbolCreciente(a:arbol);
BEGIN
	 if (a <> nil) then begin
		 imprimirArbolCreciente(a^.HI);
		 write(a^.dato.patente,' - ');
		 write(a^.dato.marca,' - ');
		 write(a^.dato.modelo,' - ');
		 write(a^.dato.anio);
		 writeln;
		 imprimirArbolCreciente(a^.HD);
	 end;
END;
//______________________________________________________________________________________

procedure ContarPorMarca(a:arbol; marca:string; var cantMarca:integer);
BEGIN
	 if (a <> nil) then begin
		 ContarPorMarca(a^.HI,marca,cantMarca);
		 if (a^.dato.marca = marca) then
		 	cantMarca:= cantMarca + 1;
		 ContarPorMarca(a^.HD,marca,cantMarca);
	 end;
END;
//______________________________________________________________________________________

procedure inicializarVector(var v:vector);
var
	i:integer;
BEGIN
	for i:= 2010 to 2018 do
		v[i]:= nil
END;

procedure cargarVector(var v:vector; a:arbol);
BEGIN
	if (a <> nil) then begin
		cargarVector(v,a^.HI);
		insertarNodo(v[a^.dato.anio],a^.dato);
		cargarVector(v,a^.HD);
	end;
END;

procedure imprimirVector(v:vector);
var
	i: integer;
BEGIN
	for i:= 2010 to 2018 do
		imprimirArbolCreciente(v[i])
END;
//______________________________________________________________________________________

function BuscarPatente (a:arbol; patente:string):integer;
BEGIN
	 if (a=nil) then
		 BuscarPatente:= -1
	 else
		 if (patente = a^.dato.patente)then 
			 BuscarPatente:= a^.dato.anio
		 else
			 if (patente < a^.dato.patente) then
				 BuscarPatente:= BuscarPatente(a^.HI,patente) 
			 else
				 BuscarPatente:= BuscarPatente(a^.HD,patente); 
END;
//______________________________________________________________________________________

var
	a: arbol;
	cantMarca: integer;
	v: vector;
	patente, marca: string;
BEGIN
	cargarArbol(a);
	writeln;
	writeln('arbol: ');
	imprimirArbolCreciente(a);
	
	inicializarVector(v);
	cargarVector(v,a);
	writeln;
	writeln('arbol ordenado por anio de fabricacion: ');
	imprimirVector(v);

	writeln;
	write('Ingrese una marca de la cual quiera contar la cantidad de autos disponibles: '); readln(marca);
	ContarPorMarca(a,marca,cantMarca);
	writeln('Hay ',cantMarca,' autos marca ',marca);

	writeln;
	write('Ingrese una patente de un auto del cual quisiera saber su anio de fabricacion: '); readln(patente);
	writeln('El anio de fabricacion del auto con patente ',patente,' es: ',BuscarPatente(a,patente));
END.
