  //Puta Alta
  ProyParalela(Objeto3D[1].X, Objeto3D[1].Y, P.X, P.Y);
  Lienzo.Canvas.Pen.Color := ClRed;

  for i := 1 to 4 do
  begin
    Lienzo.Canvas.MoveTo(P.X, P.Y);
    ProyParalela(Objeto3D[1+i].X, Objeto3D[1+i].Y, Q.X, Q.Y);
    Lienzo.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Base
  ProyParalela(Objeto3D[2].X, Objeto3D[2].Y, P.X, P.Y);

  Lienzo.Canvas.Pen.Color := ClBlue;
  Lienzo.Canvas.MoveTo(P.X, P.Y);
  ProyParalela(Objeto3D[5].X, Objeto3D[5].Y, Q.X, Q.Y);
  Lienzo.Canvas.LineTo(Q.X, Q.Y);

  Lienzo.Canvas.MoveTo(P.X, P.Y);
  ProyParalela(Objeto3D[3].X, Objeto3D[3].Y, Q.X, Q.Y);
  Lienzo.Canvas.LineTo(Q.X, Q.Y);

  ProyParalela(Objeto3D[4].X, Objeto3D[4].Y, P.X, P.Y);

  Lienzo.Canvas.MoveTo(P.X, P.Y);
  ProyParalela(Objeto3D[5].X, Objeto3D[5].Y, Q.X, Q.Y);
  Lienzo.Canvas.LineTo(Q.X, Q.Y);

  Lienzo.Canvas.MoveTo(P.X, P.Y);
  ProyParalela(Objeto3D[3].X, Objeto3D[3].Y, Q.X, Q.Y);
  Lienzo.Canvas.LineTo(Q.X, Q.Y);
  //Puta Baja
  ProyParalela(Objeto3D[6].X, Objeto3D[6].Y, P.X, P.Y);
  //Pinta
  Lienzo.Canvas.Pen.Color := ClBlack;
  for i := 1 to 4 do
  begin
    Lienzo.Canvas.MoveTo(P.X, P.Y);
    ProyParalela(Objeto3D[6-i].X, Objeto3D[6-i].Y, Q.X, Q.Y);
    Lienzo.Canvas.LineTo(Q.X, Q.Y);
  end;