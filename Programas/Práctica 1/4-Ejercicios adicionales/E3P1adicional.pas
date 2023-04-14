program E3P1adicional;

const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		DNI: longint;
		valor: real;
	end;

	vector = array [1..dimF] of oficina;
//______________________________________________________________________________________

procedure leer(var o:oficina);
BEGIN
	write('Codigo de identificacion: '); readln(o.codigo);
	if (o.codigo <> 0) then begin
		write('DNI del propietario: '); readln(o.DNI);
		write('Valor de la expensa: '); readln(o.valor);
	end;
END;

procedure cargarVector(var v:vector; var dimL:integer);
var
	o: oficina;
BEGIN
	leer(o);
	dimL:= 0;
	while (o.codigo <> 0) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leer(o);
	end;
END;
//______________________________________________________________________________________

procedure ordenarPorIncersion(var v:vector; dimL:integer); //mas eficiente
var
	i, j: integer;
	actual: oficina; 	
BEGIN
	for i:=2 to dimL do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;  
		v[j+1]:= actual;
	end;
END;
//______________________________________________________________________________________


procedure  busquedaDicotomica (v:vector; ini,fin:integer; codigo:integer; var pos:integer);
var
	medio:integer;
BEGIN
	medio:=(ini+fin)div 2;
	while (ini <= fin) and (codigo <> v[medio].codigo)do begin
		if (codigo < v[medio].codigo) then
			fin:=medio-1
		else
			ini:=medio+1;
		medio:=(ini+fin)div 2;
	end;
	if (ini<=fin) then
		pos:=medio
	else
		pos:=-1;
END;
//______________________________________________________________________________________

procedure imprimir(v:vector; dimL:integer);
var
	i: integer;
BEGIN
	for i:= 1 to dimL do begin
		writeln('Codigo de identificacion: ',v[i].codigo);
		writeln('DNI del propietario: ',v[i].DNI);
		writeln('Valor de la expensa: ',v[i].valor:1:2);
	end;
END;

var
	v:vector;
	dimL, codigo, pos: integer;
BEGIN
	cargarVector(v,dimL);
	ordenarPorIncersion(v,dimL);
	writeln;
	imprimir(v,dimL);
	writeln;
	write('Ingrese un codigo de oficina a encontrar: '); readln(codigo);
	busquedaDicotomica(v,1,dimL,codigo,pos);
	if (pos <> -1) then
		writeln('La posicion de la oficina buscada en el vector es: ',pos)
	else
		writeln('No se encontro');
END.
