program E4P1;

type
	lista = ^nodo;
	 
	nodo = record
		dato:integer;
		sig:lista;
	end;

procedure agregarAtras (var l: lista; num: integer); 
var  
	act, nue : lista;
BEGIN 
	new (nue);
	nue^.dato:= num;
	nue^.sig := nil;
	if (l <> nil) then begin
        act := l;
        while  (act^.sig <> nil) do 
			act := act^.sig ;
        act^.sig := nue ;
    end
    else
        l:= nue;
END;


procedure cargarLista(var l:lista);
var
	num:integer;
BEGIN
	l:= nil;
	write('Ingrese un numero entero: '); readln(num);
	while (num <> -1)do begin
		agregarAtras(l,num);
		write('Ingrese un numero entero: '); readln(num);
	end;
END;


procedure maximo(l:lista; var max:integer);
BEGIN
	if (l <> nil) then begin
		if (max < l^.dato) then
			max:= l^.dato;
		maximo(l^.sig,max);
	end;
END;


procedure minimo(l:lista; var min:integer);
BEGIN
	if (l <> nil) then begin
		if (min > l^.dato) then
			min:= l^.dato;
		minimo(l^.sig,min);
	end;
END;


function buscar(l:lista; buscado:integer): boolean;
BEGIN
	buscar:= false;
	if (l <> nil) then begin
		if (buscado <> l^.dato) then
			buscar:= buscar(l^.sig,buscado)
		else
			buscar:= true;
	end;
END;


var
	l: lista;
	max, min, buscado: integer;
BEGIN
	max:= -maxint; min:= maxint;
	cargarLista(l);
	maximo(l,max);
	minimo(l,min);
	writeln('El numero mas grande de la lista es: ',max);
	writeln('El numero mas chico de la lista es: ',min);
	write('Ingrese un numero de la lista: '); readln(buscado);
	if (buscar(l,buscado)) then
		writeln('El elemento buscado se encuentra en la lista')
	else
		writeln('El elemento buscado no se encuentra en la lista');
	readln();
END.