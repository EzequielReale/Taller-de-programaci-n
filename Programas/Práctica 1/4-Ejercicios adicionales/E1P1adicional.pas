program E1P1adicional;

const
    dimF = 250;
    dimFC = 20;
type
    empleado = record
        legajo, categoria, ingreso: integer;
        DNI: longint;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato: empleado;
        HI: arbol;
        HD: arbol;
    end;

    vectorEmpleados = array [1..dimF] of empleado;
    vectorDimL = array [1..dimFC] of integer;
    vectorCategorias = array [1..dimFC] of vectorEmpleados;

procedure leer(var e:empleado);
BEGIN
    write('Ingrese el numero de legajo: '); readln(e.legajo);
    write('Ingrese el numero de categoria: '); readln(e.categoria);
    write('Ingrese el anio de ingreso: '); readln(e.ingreso);
    write('Ingrese el numero de DNI: '); readln(e.DNI);
END;

procedure insertarNodo(var a:arbol; e:empleado);
BEGIN
	if (a = nil) then begin
		new(a);
		a^.dato:= e;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (a^.dato.legajo > e.legajo) then
			insertarNodo(a^.HI,e)
		else
			if (a^.dato.legajo < e.legajo) then
				insertarNodo(a^.HD,e);
END;

procedure cargarArbol(var a:arbol);
var
	e: empleado;
BEGIN
	a:= nil;
	leer(e);
		while (e.DNI <> 0) do begin
			insertarNodo(a,e);
			leer(e);
		end;
END;
//______________________________________________________________________________________
procedure inicializarDimL(var dimL:vectorDimL);
var
	i: integer;
BEGIN
	for i:= 1 to 20 do
		dimL[i]:= 0;
END;

procedure cargarVectorEmpleados(var v:vectorEmpleados; var dimL:vectorDimL; e:empleado; A, B: integer);
BEGIN
	if (e.legajo > A) and (e.legajo < B) then
		dimL[e.categoria]:= dimL[e.categoria] + 1;
		v[dimL[e.categoria]]:= e;
END;

procedure cargarVectorCategorias(var vC:vectorCategorias; var dimL:vectorDimL; A,B:integer; ar:arbol);
BEGIN
    if (ar <> nil) then begin
		cargarVectorCategorias(vC,dimL,A,B,ar^.HI);
		cargarVectorEmpleados(vC[ar^.dato.categoria],dimL,ar^.dato,A,B);
		cargarVectorCategorias(vC,dimL,A,B,ar^.HD);
	end;
END;
//______________________________________________________________________________________

{procedure sumarDNI(a:arbol; var cant,suma:integer);
BEGIN
	if (a <> nil) then begin
		sumarDNI(a^.HI,cant,suma);
		suma:= suma + a^.dato.dni;
        cant:= cant + 1;
	    sumarDNI(a^.HD,cant,suma);
    end;
END;
    
function promedio(a:arbol): real;
var
    suma, cant: integer;
BEGIN
	cant:= 0;
    suma:= 0;
    sumarDNI(a,cant,suma);
    if (cant <> 0) then
		promedio:= suma / cant
	else
		promedio:= 0;
END;}

function promedio(a:arbol; var cant:integer):real;
BEGIN
	if (a <> nil) then begin
		promedio:= a^.dato.dni + promedio(a^.HI,cant);
		cant:= cant + 1;
		promedio:= a^.dato.dni + promedio(a^.HD,cant);
	end;
END;
//______________________________________________________________________________________

{procedure imprimirVector(v:vectorEmpleados; dimL:vectorDimL; j:integer);
var
	i: integer;
BEGIN
	for i:= 1 to dimL[j] do begin
		if (dimL[j] > 0) then
			writeln(v[i].dni);
	end;
END;

procedure imprimirVector(v:vectorCategorias; dimL:vectorDimL);
var
	i: integer;
BEGIN
	for i:= 1 to dimFC do begin
		imprimirVector(v[i],dimL,i);
	end;
END;
//______________________________________________________________________________________}

var
    v: vectorCategorias;
    dimL: vectorDimL;
    ar: arbol;
    A,B: integer;
    
    cant: integer;
BEGIN
    cargarArbol(ar);
    
    write('Ingrese el legajo minimo: '); readln(A);
    write('Ingrese el legajo maximo: '); readln(B);
    inicializarDimL(dimL);
    cargarVectorCategorias(v,dimL,A,B,ar);
    //imprimirVector(v,dimL);
    
    {writeln('Promedio de DNI: ',promedio(ar):1:2);}
    
    cant:= 0;
    writeln('Promedio de DNI: ',promedio(ar,cant) / cant:1:2);
END.
