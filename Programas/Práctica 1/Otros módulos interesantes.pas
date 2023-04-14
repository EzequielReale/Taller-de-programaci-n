procedure Calcular_DNI_Promedio(var dni_promedio:integer;v:vector;dimL:integer);
var
    total:integer;
    cantidad:integer;
BEGIN
    total:=0;
    cantidad:=0;
    Calcular_Promedio(total,cantidad,v,dimL);
    if cantidad > 0 then
        dni_promedio:=total div cantidad
    else
        dni_promedio:=0;
END;
//________________________________________________________________________________
// se llama al proceso con cont= 0
function promDNIs(v: vector; dL: integer; cont: integer): integer;
begin
    if cont= 0 then
        promDNIs:= promDNIs(v,dL,cont+1) div dL
    else if cont<= dL then
        promDNIs:= v[cont].dni + promDNIs(v,dL,cont+1)
    else
        promDNIs:= 0;
end;
//________________________________________________________________________________
function PromedioVector(v:vCategoria; dimL: integer; i: integer): real;
begin
    if(i <= dimL) then
        PromedioVector := v[i].dni / dimL + PromedioVector(v,dimL,i + 1)
    else
        PromedioVector := 0;
end;
//________________________________________________________________________________

procedure inicializar(var v:vector);
var
    i: integer;
BEGIN
    for i:= 1 to dimF do
        v[i]:= nil;
END;

procedure cargarListas(var vec:vector);
var
    v: venta;
    i, cantVentas: integer;
BEGIN
    inicializar(vec);
    for i:= 1 to dimF do begin
        cantVentas:= 0;
        leer(v);
        while ((cantVentas < 200) and (v.codigo <> -1)) do begin
            insertarOrdenado(vec[i],v);
            leer(v);
        end;
    end;
END;
//______________________________________________________________________________________

procedure minimoMerge(var v:vector; var minimo:venta);
Var 
    posMin,i: integer;
BEGIN
    minimo.codigo:= maxint;
    for i:= 1 to dimF do begin
        if (v[i] <> nil) and (v[i]^.dato.codigo <= minimo.codigo) then begin
            posMin:= i;
            minimo:= v[posMin]^.dato;  
        end;
    end;
    if (minimo.codigo <> maxint) then
        v[posMin]:= v[posMin]^.sig;
END;


procedure mergeAcumulador(v:vector; var l2:lista2);
var
    minimo: venta;
    actual: venta2;
    ult: lista2;
BEGIN
    l2:= nil; ult:= nil;

    minimoMerge (v,minimo);
    while (minimo.codigo <> maxint) do begin
        actual.codigo:= minimo.codigo;
        actual.totalVentas:= 0;
        while ((minimo.codigo <> maxint) and (minimo.codigo = actual.codigo)) do begin
            actual.totalVentas:= actual.totalVentas + minimo.cantVendida;
            minimoMerge (v,minimo);
        end;
        agregarAtras(l2,ult,actual);
    end;
END;
//______________________________________________________________________________________

procedure imprimirListas(v:vlistas);
var
    i:integer;
BEGIN
    for i:= 1 to 5 do begin
        while (v[i] <> nil) do begin
            writeln(v[i]^.dato.dni);
            V[i]:= v[i]^.sig;
        end;
    end;
END;
//______________________________________________________________________________________