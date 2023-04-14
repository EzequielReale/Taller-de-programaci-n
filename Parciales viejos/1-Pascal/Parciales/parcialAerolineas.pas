{
Una aerolínea dispone de un árbol binario de búsqueda con la información de sus empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1..20) y año de ingreso a la empresa. 
* El árbol se encuentra ordenado por número de legajo. Se solicita:
Implementar un módulo que reciba el árbol de empleados, número de legajo “A”, número de legajo “B” y un número de categoría, y retorne un vector ordenado por número de legajo.
*  El vector debe contener el número de legajo y Dni de aquellos empleados cuyo número de legajo se encuentra comprendido entre los números de legajo recibidos (“A” y “B”, siendo “A” menor que “B”) y la categoría se corresponda con la recibida por parámetro.
*  Por norma de la empresa, cada categoría puede contar con a lo sumo 250 empleados.
Implementar un módulo recursivo que reciba la información generada en “a” y retorne el promedio de los números de Dni.
   
   
}
program Pestana_bruno;

const
	dimFCat = 20;
	dimFEmpl = 250;
type

	categorias = 1..dimFCat;

empleado = record
	dni:integer;
	ano: 1900..2021;
	legajo:integer;
	categoria: categorias;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: empleado;
		hi: arbol;
		hd: arbol;
	end;
	
regRango = record
		legajo: integer;
		DNI: integer;
	end;
	
vectorEmp = array [1..dimFEmpl] of regRango;

categoria = record
	dimL:integer;
	vectorEmp:vectorEmp;
	end;
	
	vectorCategoria = array [1..dimFCat] of categoria;
	
procedure agregarArbol(var a:arbol; d:empleado);
begin
	if ( a= nil) then begin
		new(a);
		a^.dato:= d;
		a^.hi:= nil;
		a^.hd:=nil;
	end
	else
		if (d.legajo < a^.dato.legajo) then
			agregarArbol(a^.hi,d)
		else
			agregarArbol(a^.hd,d);
	end;
	
procedure leer ( var e: empleado);
begin
	e.legajo:= Random(100) - 1;
	writeln(#10 + 'legajo : ',e.legajo);
	e.dni:= Random(20000);
	writeLn('DNI: ', e.dni);
	e.ano:= Random(121) + 1900;
	writeln('Ano: ', e.ano);
	e.categoria:= Random(20) + 1;
	writeLn('Categoria: ', e.categoria);

end;

procedure crear(var a :arbol);
var
i:integer;
e:empleado;
begin
	
	a:=nil;
	for i := 1 to 100 do begin
		leer(e);
		agregarArbol(a,e);	
	end;
end;


procedure inicializar ( var v:vectorCategoria);
var
i:integer;
begin
	for i:= 1 to dimFCat do 
		v[i].dimL:=0;
end;

procedure guardarRango ( a:arbol; inf,sup:integer; var v: vectorCategoria);
begin
	if (a <> nil) then begin
		if ( inf < a^.dato.legajo) then
			guardarRango(a^.hi,inf,sup,v);
		if (( a^.dato.legajo > inf) and (a^.dato.legajo < sup)) then
			if (v[a^.dato.categoria].dimL < dimFEmpl) then begin
				v[a^.dato.categoria].dimL:= v[a^.dato.categoria].dimL + 1;
				v[a^.dato.categoria].vectorEmp[v[a^.dato.categoria].dimL].legajo:= a^.dato.legajo;
				v[a^.dato.categoria].vectorEmp[v[a^.dato.categoria].dimL].DNI:= a^.dato.DNI;
			end;
		if (sup > a^.dato.legajo) then
			guardarRango(a^.hd,inf,sup,v);
	end;

end;

procedure imprimirVector(v: vectorCategoria);
var
	i, j: integer;
	
begin
	writeLn(#10 + 'Vector: ');
	for	i:= 1 to dimFCat do begin
		writeLn(#10 + 'Categoria: ', i);
		for j:= 1 to v[i].dimL do begin
			writeLn(#10#9#9+'Legajo: ', v[i].vectorEmp[j].legajo);
			writeLn(#9#9'DNI: ', v[i].vectorEmp[j].DNI);
		end;
	end;
end;

var
	a: arbol;
	v:vectorCategoria;
	
begin
	crear(a);
	inicializar(v);
	guardarRango(a, 50, 70, v);
	imprimirVector(v);
end.
