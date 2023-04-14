program Teoria;

const
	dimF = 20;
	valor1 = 20;
	valor2 = 22;
type
	participante = record
		cod,edad: integer;
	end;
	vector = array [1..dimF] of participante;
	lista = ^nodo;
	nodo = record
		dato: participante;
		sig: lista;
	end;


procedure leer(var info:participante);
BEGIN
	write('Escriba el codigo del participante: '); readln(info.cod);
	if (info.cod <> -1) then begin
		write('Escriba la edad del participante: '); readln(info.edad);
	end;
END;


procedure cargarVector (var v:vector; var dimL:integer);
var
	info: participante;
BEGIN
	dimL:= 1;
	leer(info);
	while (dimL < dimF) and (info.cod <> -1) do begin
		v[dimL]:= info;
		dimL:= dimL + 1;
		leer(info);
	end;
END;


procedure ordenar(var v:vector; dimL:integer);
var 
	i, j: integer;
	actual: participante; 	
BEGIN
	for i:=2 to dimL do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0) and (v[j].edad > actual.edad) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;  
		v[j+1]:= actual; 
	end;
END;


procedure imprimir(v:vector; dimL:integer);
var
	i:integer;
BEGIN
	for i:= 1 to dimL do
	  writeln('El participante codigo ',v[i].cod,' tiene ',v[i].edad,' anios');
END;


procedure eliminar(var v:vector; var dimL:integer);
var
	posicion, i, cant : integer;
BEGIN
	cant := 0;
	i := 1;  
	{busco al primer participante de 20 años o mas}
	while ((i < dimL) and (v[i].edad < valor1 )) do        
		i := i +1;                                           
	posicion:= i;
	while (i < dimL) and (v[i].edad <=valor2 ) do
		i := i + 1;
	{ vamos a eliminar a todos los participantes entre las posiciones posicion e i del vector V }
	cant := i - posicion;
	for i := (posicion+cant) to dimL do
		v[i-cant] := v[i];
	dimL := dimL - cant;  
END;


{
procedure insertarOrdenado (var L:lista; info:participante);
var
  ant, act, aux: lista;
BEGIN
  new(aux); aux^.dato:= info; aux^.sig:= nil; ant:= L; act:= L;
  while (act <> nil) and (act^.dato.edad < info.edad) do begin
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
END;


procedure cargarLista(var L:lista; v:vector; dimL:integer);
var
	i:integer;
BEGIN
	for i:= 1 to dimL do begin
		insertarOrdenado(L,v[i]);
	end;
END;
}


procedure agregarAtras(var l:lista; elemento:participante; var ult:lista);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=elemento;
	nue^.sig:=nil;
	if(l=nil)then 
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;   
 

procedure cargarLista(var l:lista; v:vector; diml:integer);
var
	i:integer;
	ult:lista;
begin
	l:= nil;
	for i := 1 to diml do 
		agregarAtras(l,v[i],ult);
end;

  
procedure imprimirLista(L:lista);
BEGIN
  while (L <> nil) do begin
    writeln('El participante codigo ',L^.dato.cod,' tiene ',L^.dato.edad,' anios');
    L:= L^.sig;
  end;
END;


var
	v: vector;
	L: lista;
	dimL: integer;
BEGIN
		cargarVector(v,dimL);
		writeln();
		writeln('Desordenado:');
		imprimir(v,dimL);
		ordenar(v,dimL);
		writeln();
		writeln('Ordenado:');
		imprimir(v,dimL);
		eliminar(v,dimL);
		writeln();
		writeln('Eliminando entre 20 y 22 anios:');
		imprimir(v,dimL);
		cargarLista(L,v,dimL);
		writeln();
		writeln('Lista:');
		imprimirLista(L);
		readln();
END.

