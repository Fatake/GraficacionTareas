  for i:=7 to 13 do
  begin
    for j:=13 downto i do
    begin
      if( Objeto3D[j].Z < Objeto3D[j-1].Z ) then
      begin
        Objeto3D[15] := Objeto3D[j];
        Objeto3D[j] := Objeto3D[j-1];
        Objeto3D[j-1] := Objeto3D[15];
        
        car := CarasAux[j];
        CarasAux[j] := CarasAux[j-1];
        CarasAux[j-1] := car;
      end;
    end;
  end;
  
  
  for i:=8 to 14 do
  begin
    for j:=7 to 13 do
    begin
      if (Objeto3D[j].Z > Objeto3D[j+1].Z) then
      begin
        car := CarasAux[j];
        CarasAux[j] := CarasAux[j+1];
        CarasAux[j+1] := car;

        Objeto3D[15] := Objeto3D[j];
        Objeto3D[j] := Objeto3D[j+1];
        Objeto3D[j+1] := Objeto3D[15];
      end;
    end;
  end;