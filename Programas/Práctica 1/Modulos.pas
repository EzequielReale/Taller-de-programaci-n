*ORDENAR VECTORES:

procedure ordenarPorSeleccion(var v:vector; dimL:integer); //mas facil
var
	i, j, p, cant: integer;
	aux: dato;
BEGIN
	cant:= 0;
	for i:= 1 to dimL-1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if (v[j].cod < v[p].cod) then
				p:= j; //intercambia v[i] y v[p]
			if (i <> p) then begin
				aux:= v[p];
				v[p]:= v[i];
				v[i]:= aux;
			end;
	end;
END;
//______________________________________________________________________________________

procedure ordenarPorIncersion(var v:vector; dimL:integer); //mas eficiente
var
	i, j: integer;
	actual: dato; 	
BEGIN
	for i:=2 to dimL do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0) and (v[j].cod > actual.cod) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;  
		v[j+1]:= actual;
	end;
END;
//______________________________________________________________________________________

procedure  busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos:integer);
var
	medio:integer;
BEGIN
	medio:=(ini+fin)div 2;
	while (ini<=fin) and (dato<>v[medio])do begin
		if (dato<v[medio])then//te quedas con la parte  izquierda
			fin:=medio-1//se resta 1 porque ya sabes que no es lo que estaba en "medio" y entonces para ahorrarte una pasada (tal vez) se resta 1. de forma inversa pasa lo mismo con lo del else.
		else //te quedas con la parte derecha.
			ini:=medio+1;
		medio:=(ini+fin)div 2;
	end;
	if (ini<=fin) then
		pos:=medio
	else
		pos:=-1;
END;
//______________________________________________________________________________________

*AGREGAR EN LISTAS:

procedure agregarAdelante(var L:lista; elem:dato) //al reves de la lectura
var
	aux: lista;
BEGIN
	new(aux);
	aux^.dato := elem;
	aux^.sig := L;
	L := aux;
END;
//______________________________________________________________________________________

procedure agregarAtras(var L,ult:lista; elem:dato); //en el orden en el que se lee
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

procedure insertarOrdenado(var L:lista; e:dato); //en orden segun x parametro
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
//______________________________________________________________________________________


*MERGE DE LISTAS:

procedure minimoCon2(var L1,L2:lista; var min:dato);
BEGIN
	min.cod:= maxint;
	if (L1 <> nil) and (L2 <> nil)then
		if (L1^.dato.cod <= L2 ^.dato.cod ) then begin
			min:= L1^.dato;
			L1:= L1 ^.sig; 
		end; 
		else begin
			min:= L2 ^.dato;
			L2:= L2 ^.sig;
		end 
	else (L1 <> nil) and (L2 = nil) then begin
			min:= L1^.dato;
			L1:= L1 ^.sig;
	end 
	else (L1 = nil) and (L2 <> nil) then begin
		min:= L2 ^.dato;
		L2:= L2 ^.sig; 
	end;
END;


procedure mergeCon2(L1,L2:lista; var Lnueva:lista);
var 
	min: dato;
BEGIN
	Lnueva:= nil;
	minimoCon2(L1,L2,min);
	while (min <> maxint) do begin
		agregarAtras (Lnueva,min);
		minimoCon2(L1,L2,min);
	end;
END;
//______________________________________________________________________________________

procedure minimoConMasDe2(var v:Vlista; var min:dato);
var 
	i, posMin: integer;
  BEGIN
    min.codP:= maxint;
	for i:= 1 to DimF do begin
		if (v[i] <> nil) then begin
			if (v[i]^.dato.codP  < min.codP ) then begin
				min:= v[i]^.dato;
				posMin:= i;
			end;
		end;
	end;
	if (min.codP <> maxint) then 
		v[posMin]:= v[posMin]^.sig
END;


procedure mergeConMasDe2(v:Vlista; var L:lista);
var 
	ult: lista;
	min: pelicula;
BEGIN
	L:= nil; ult:= nil;
	minimoConMasDe2 (v,min);
	while (min.codP <> maxint) do begin
		agregarAtras (L,ult,min);
		minimoConMasDe2 (v,min);
	end;
END;
//______________________________________________________________________________________

procedure minimoMerge(var v:Vlista; var minimo:longint);
Var	
	posMin,i:integer;
BEGIN
	minimo:= maxint; //Le pongo un numero muy alto para que haya al menos 1 minimo
	for i:= 1 to dimF do begin
		if (v[i] <> nil) and (v[i]^.dato.codigo <= minimo) then begin
			posMin:= i;
			minimo:= v[posMin]^.dato.codigo;  
		end;
	end;
	if (minimo <> maxint) then // si se actualizó el índice minimo, se modifica el estante de donde se sacó dicho minimo y se guarda el monto	
		v[posMin]:= v[posMin]^.sig;
END;


Procedure mergeAcumulador(v:Vlista; var Lnueva:lista2);
var
	minimo: longint;
	actual: entrada2;
	ult:lista2;
BEGIN
	Lnueva := nil;  //inicializa la nueva lista
	ult:=nil;

	minimoMerge (v,minimo);
	while (minimo <> maxint) do begin
		actual.codO:= minimo; //actual
		actual.cant:= 0;   
		while ((minimo <> maxint) and (minimo = actual.codO)) do begin {mientras no llegue al final ni cambie de codigo}
			actual.cant:= actual.cant + 1;
			minimoMerge (v,minimo); //calcula otro minimo
		end;
		agregarAtras(Lnueva,ult,actual);
	end;
END;
//______________________________________________________________________________________

*ARBOLES:

procedure insertarNodo(var a:arbol; x:integer);
BEGIN
	if (a = nil) then begin
		new(a);
		a^.dato:= x;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (a^.dato > x) then
			insertarNodo(a^.HI,x)
		else
			if (a^.dato < x) then
				insertarNodo(a^.HD,x);
END;


procedure cargarArbol(var a:arbol);
var
	x: integer;
BEGIN
	a:= nil;
	write('Ingrese un numero: '); readln(x);
		while (x <> 0) do begin
			insertarNodo(a,x);
			write('Ingrese un numero: '); readln(x);
		end;
END;
//______________________________________________________________________________________

function calcularMinimo (a:arbol): arbol; //para maximo es lo mismo pero con HD en vez de HI
BEGIN
	if (a = nil) then
		calcularMinimo := nil
	else
		if (a^.HI = nil) then
			calcularMinimo := a
		else
			calcularMinimo := calcularMinimo(a^.HI); 
END;
//______________________________________________________________________________________

procedure imprimirArbolCreciente(a:arbol);
BEGIN
	 if (a <> nil) then begin
		 imprimirArbolCreciente(a^.HI);
		 writeln(a^.dato.nombre);
		 imprimirArbolCreciente(a^.HD);
	 end;
END;
//______________________________________________________________________________________

function Buscar (a:arbol; dato:nombre):boolean;
BEGIN
	 if (a=nil) then
		 Buscar:=false
	 else
		 if (dato= a^.dato)then 
			 Buscar:=true
		 else
			 if (dato < a^.dato) then
				 Buscar:= Buscar(a^.HI ,dato) 
			 else
				 Buscar:= Buscar(a^.HD ,dato); 
END;
//______________________________________________________________________________________
procedure recorridoAcotado (a: arbol; inf, sup: integer);
BEGIN
  if (a <> nil) then begin
  	if (a^.dato.legajo > inf) then begin
      if (a^.dato.legajo < sup) then begin
        recorridoAcotado(a^.hi, inf, sup);
				writeln('nombre',a^.dato.nom); //accion a ejecutar
        recorridoAcotado(a^.hd, inf, sup);
      end
      else begin
        recorridoAcotado(a^.hi, inf, sup);
      end;
    end
    else begin
      recorridoAcotado(a^.hd, inf, sup);
    end;
  end;
END;