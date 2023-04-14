program E1P1;

const
	dimF = 300;

type
	oficina = record
		cod, dni: integer;
		valor: real;
	end;
	vector = array [1..dimF] of oficina;


procedure leer(var o:oficina);
BEGIN
	write('Ingrese el codigo de oficina: '); readln(o.cod);
	if (o.cod <> -1) then begin
		write('Ingrese el DNI del propietario: '); readln(o.dni);
		write('Ingrese el valor de la oficina: '); readln(o.valor);
	end;
END;


procedure cargarVector(var v:vector; var dimL:integer);
var
	o:oficina;
BEGIN
	dimL:= 0;
	leer(o);
	while (dimL < dimF) and (o.cod <> -1) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leer(o);
	end;
END;

procedure ordenarPorSeleccion(var v:vector; dimL:integer);
var
	i, j, p, cant: integer;
	aux: oficina;
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


procedure ordenarPorIncersion(var v:vector; dimL:integer);
var
	i, j: integer;
	actual: oficina; 	
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


procedure imprimir(v:vector; dimL:integer);
var
	i:integer;
BEGIN
	for i:= 1 to dimL do begin
		writeln('----------------------------------');
		writeln('Codigo de oficina: ',v[i].cod);
		writeln('DNI del propietario: ',v[i].dni);
		writeln('Valor de la Oficina: ',v[i].valor:1:2);
	end;
END;


var
	v: vector;
	dimL: integer;
BEGIN
	cargarVector(v,dimL);
	ordenarPorSeleccion(v,dimL);
	//ordenarPorIncersion(v,dimL);
	imprimir(v,dimL);
	readln();
END.