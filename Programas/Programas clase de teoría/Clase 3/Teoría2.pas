{1.Suponiendo que 4 integrantes de una familia, llevan sus gastos de manera similar a Juan y Paula. Se pide:
Generar la estructura para almacenar los gastos de cada uno de los integrantes. 
Cada estructura debe generarse de manera ordenada por nombre de gasto. Cada estructura se carga 
hasta leer el nombre ‘ZZ’.
Imprimir las estructuras generadas en a.
Realizar el merge de manera de generar una única estructura que contenga 
los montos totales por impuesto con la estructura generada en a.
A partir de la estructura generada en c. arme un ABB ordenado por monto total 
y luego imprima el nombre del gasto que menos costo.

}
program Hello;

const
    dimF = 4; //cantidad de estantes es 4 puesto que son 4 integrantes de una familia 
    fin = 'ZZ';


type 
    cadena20 = string[20];
    gasto= record
        nombre:cadena20;
        monto:real;
    end; 
    
    lista =^nodo;
    nodo = record
        dato:gasto;
        sig:lista;
    end; 
    estantes = array[1..dimF] of lista;
    
    arbol = ^nodoA; //como Arbol es un puntero es un tipo de dato SIMPLE
    
    nodoA = record
        dato: gasto; //esto hay que cambiarlo cuando lo usemos segun el tipo de dato
        HI: arbol;
        HD: arbol;
    end;

//---------Fin del Type------------




//-----Leer gasto---------
procedure leerGasto(var g:gasto);
begin
    writeln('GASTO:');
    readln(g.nombre);
    if (g.nombre <> fin) then begin
        writeln('MONTO:');
        readln(g.monto);
    end;
end;


//--------Insertar ordenado-------------
procedure insertarOrdenado(var L : lista; dato : gasto);
var
	aux,ant,act : lista;
	
begin
	new(aux); 
	aux^.dato := dato;
	act := L;
	ant := act;
	while (act <> nil) and (act^.dato.nombre < dato.nombre) do begin
		ant := act;
		act := act^.sig;
	end;
	if (ant=act) then  //primero de la lista, o lista vacía
		L := aux
	else
		ant^.sig := aux;
	aux^.sig := act;
end;



//--------Cargo las listas en el Vector de estantes-------
procedure generarEstantes(var todos:estantes);
var
    i:integer;
    gas:gasto;
begin;
    for i:=1 to dimF do begin
		todos[i]:= nil;
        leerGasto(gas);
        while(gas.nombre <> fin) do begin
            insertarOrdenado(todos[i],gas);
            leerGasto(gas);
        end;
    end;
end;




//-----------Imprimir lista----------
procedure imprimirLista(l: lista);
begin
    
    while(l<> nil) do begin
                writeln('Nombre del gasto: ', l^.dato.nombre);
                writeln('Monto del gasto $: ', l^.dato.monto:4:2);
                l:= l^.sig;
    end;
end;



//-----------Imprimir listas----------
procedure imprimirListas(todos:estantes);
var 
    i:integer;
begin
    writeln('-------------------------');
	writeln('GASTOS CARGADOS');
    for i:=1 to dimF do begin
		writeln;
        writeln('Gastos del integrante ', i);  
        if (todos[i] <> nil) then begin   // este if solo tiene sentido porque se quiere imprimir un cartel específico cuando no tiene gastos
            while(todos[i] <> nil) do begin
                writeln('  Nombre del gasto: ', todos[i]^.dato.nombre);
                writeln('  Monto del gasto $: ', todos[i]^.dato.monto:4:2);
                todos[i]:= todos[i]^.sig;
            end;
        end
        else  writeln('El integrante ', i,' no tiene gastos.'); //la lista estaba en nil
    end;
end;




//---------Agregar atras-----------
procedure agregarAtras(var l,ult: lista; actual:cadena20; montoTotal:real);
var
    nue:lista;
begin
	new(nue);
	nue^.dato.nombre := actual;
	nue^.dato.monto := montoTotal;
	nue^.sig := nil;
	if (l = nil) then
		l := nue
	else
		ult^.sig := nue;
	ult := nue;	
end;




//-------Minimo---------------
procedure minimo (var todos:estantes; var nomMin:cadena20; var monto:real);
Var
 indiceMin,i:integer;
begin
    
    nomMin:= fin; 
    indiceMin:= -1;
    
    for i:= 1 to dimF do
    
        if (todos[i] <> nil) and (todos[i]^.dato.nombre <= nomMin) then begin
                indiceMin:= i;
                nomMin:= todos[i]^.dato.nombre;  
        end; 
        
	if (indiceMin <> -1) then begin // si se actualizó el índice minimo, se modifica el estante de donde se sacó dicho minimo y se guarda el monto
		monto:= todos[indiceMin] ^.dato.monto;
		todos[indiceMin]:= todos[indiceMin]^.sig;
    end;
    
end;








//---------- Merge acumulador-------------
Procedure mergeAcumulador (todos:estantes; var Enuevo:lista);
var
    minNombre,actual: cadena20;
    monto, montoTotal:real;
    ult:lista;
begin
  Enuevo:= nil;  //inicializa la nueva lista
  ult:=nil; // no es necesario
  minimo (todos,minNombre, monto);
  
  while (minNombre <> fin) do begin
  
     actual:= minNombre; //gasto actual
     montoTotal:=0; 	//iniciliza el monto del gasto actual
     
     while ((minNombre <> fin) and (minNombre = actual) ) do begin {mientras no llegue al final ni cambie de gasto}
        montoTotal:= montoTotal + monto; // acumula el monto
        minimo (todos,minNombre,monto); // calcula otro minimo
     end; //cambio de gasto
     
     agregarAtras(Enuevo,ult,actual,montoTotal);
  
  end;
End; 






//---------- insertar en arbol-------------
procedure insertarEnArbol(gas: gasto; var a: arbol);
var
	aux: arbol;
begin
	if (a = nil) then begin
		new(aux);
		aux^.dato:= gas;
		aux^.HI := nil;
		aux^.HD := nil;
		a := aux;
	end
	else
		if (gas.monto > a^.dato.monto) then 
			insertarEnArbol (gas, a^.HD)
		else
			insertarEnArbol (gas, a^.HI); //sabemos que no va a haber repetidos
	end;





//-------generar arbol-----------------
procedure generarArbol (var a:arbol; Enuevo: lista);
begin
    while (Enuevo <> nil) do begin
        insertarEnArbol(Enuevo^.dato, a);
        Enuevo:=Enuevo^.sig;
    end;
end;





//----------Calcular Minimo en arbol---------------
function calcularMinimo (a:arbol): arbol;
begin
	if (a = nil) then
		calcularMinimo := nil
	else
		if (a^.HI = nil) then
			calcularMinimo := a
		else
			calcularMinimo := calcularMinimo(a^.HI); 
end;




//---------Programa principal------------

var
    todos: estantes;
    estanteNuevo: lista; 
    a:arbol;
begin
    
    generarEstantes (todos);
    imprimirListas(todos);
    
    writeln;
    writeln('----- MERGE ----------');
    
    mergeAcumulador(todos,estanteNuevo);
    imprimirLista(estanteNuevo);
    
    writeln('---------------');
    writeln;
    
    generarArbol(a,estanteNuevo);
    writeln('Gasto con menos costo: ', calcularMinimo(a)^.dato.nombre);
    readln;
end.