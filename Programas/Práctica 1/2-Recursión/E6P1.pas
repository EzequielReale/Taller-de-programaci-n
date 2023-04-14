procedure busquedaDicotomica(v: vector; ini, fin: integer; dato:integer; Var pos: integer);
BEGIN
	if (ini > fin) then
    	pos:= -1
	else begin
		pos:= (ini + fin) DIV 2;
		if (v[pos] <> dato) then begin
			if (dato < v[pos]) then
				busquedaDicotomica(v, ini, pos-1, dato, pos)
			else
				busquedaDicotomica(v, pos+1, fin, dato, pos);
		end;
	end;
END;