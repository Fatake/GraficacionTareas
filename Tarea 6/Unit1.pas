unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Lienzo: TImage;
    Panel1: TPanel;
    lbl1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type TPoint3D = Packed Record
  X,Y,Z : Real;
end;
type Caras = Packed Record
  puntos : Array[1..3] of TPoint;
end;

var
  Form1: TForm1;
  P, Q : TPoint;
  arreglo:Array[1..15] of TPoint;
  Objeto3D : Array[1..15] of TPoint3D;
  CarasObjeto3D : Array[1..9] of Caras;
  CarasAux : Array[7..14] of Integer;
  //Las coordenadas x, y Proyectadas
  Xp, Yp : Integer;
  //angulo
  alpha, S, C : Real;
  //Auxiliares
  Xaux, YAux, Zaux : Real;

implementation

{$R *.dfm}
//
//Constructor
//
procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin
  Lienzo.Canvas.Rectangle(0,0,500,500);
  //Angulo
  alpha := (5*PI)/180;
  //Coordenadas de Cada punto del Objeto3D
  //Punto mas alto
  Objeto3D[1].X := +80; Objeto3D[1].Y := +0; Objeto3D[1].Z := +0;
  //Puntos del cuadrado
  Objeto3D[2].X := +0; Objeto3D[2].Y := -20; Objeto3D[2].Z := -20;
  Objeto3D[3].X := +0; Objeto3D[3].Y := -20; Objeto3D[3].Z := +20;
  Objeto3D[4].X := +0; Objeto3D[4].Y := +20; Objeto3D[4].Z := +20;
  Objeto3D[5].X := +0; Objeto3D[5].Y := +20; Objeto3D[5].Z := -20;
  //Punto mas Bajo
  Objeto3D[6].X := -80; Objeto3D[6].Y := +0; Objeto3D[6].Z := +0;
  //Calculo de puntos centrales
  //Cara 1
  Objeto3D[7].X := 40; Objeto3D[7].Y := -10; Objeto3D[7].Z := 0;
  //Cara 2
  Objeto3D[8].X := 40; Objeto3D[8].Y := 0; Objeto3D[8].Z := 10;
  //Cara 3
  Objeto3D[9].X := 40; Objeto3D[9].Y := 10; Objeto3D[9].Z := 0;
  //Cara 4
  Objeto3D[10].X := 40; Objeto3D[10].Y := 0; Objeto3D[10].Z := -10;
  //Cara 5
  Objeto3D[11].X := -40; Objeto3D[11].Y := -10; Objeto3D[11].Z := 0;
  //Cara 6
  Objeto3D[12].X := -40; Objeto3D[12].Y := 0; Objeto3D[12].Z := 10;
  //Cara 7
  Objeto3D[13].X:= -40; Objeto3D[13].Y := 10; Objeto3D[13].Z := 0;
  //Cara 8
  Objeto3D[14].X := -40; Objeto3D[14].Y := 0; Objeto3D[14].Z := -10;
  //Auxiliar
  Objeto3D[15].X := 0; Objeto3D[15].Y := 0; Objeto3D[15].Z := 0;
  for i :=7 to 14 do
  begin
   CarasAux[i] := i;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Close();
end;
//
//Boton 1
//
procedure TForm1.Button1Click(Sender: TObject);
//Pinta Cara
procedure pintaCaras();
begin
  //Cara 1
  CarasObjeto3D[1].puntos[1] := arreglo[1];
  CarasObjeto3D[1].puntos[2] := arreglo[2];
  CarasObjeto3D[1].puntos[3] := arreglo[3];
  //Cara 2
  CarasObjeto3D[2].puntos[1] := arreglo[1];
  CarasObjeto3D[2].puntos[2] := arreglo[2];
  CarasObjeto3D[2].puntos[3] := arreglo[5];
  //Cara 3
  CarasObjeto3D[3].puntos[1] := arreglo[1];
  CarasObjeto3D[3].puntos[2] := arreglo[4];
  CarasObjeto3D[3].puntos[3] := arreglo[5];
  //Cara 4
  CarasObjeto3D[4].puntos[1] := arreglo[1];
  CarasObjeto3D[4].puntos[2] := arreglo[4];
  CarasObjeto3D[4].puntos[3] := arreglo[3];
  //Cara 5
  CarasObjeto3D[5].puntos[1] := arreglo[6];
  CarasObjeto3D[5].puntos[2] := arreglo[2];
  CarasObjeto3D[5].puntos[3] := arreglo[5];
  //Cara 6
  CarasObjeto3D[6].puntos[1] := arreglo[6];
  CarasObjeto3D[6].puntos[2] := arreglo[4];
  CarasObjeto3D[6].puntos[3] := arreglo[5];
  //Cara 7
  CarasObjeto3D[7].puntos[1] := arreglo[6];
  CarasObjeto3D[7].puntos[2] := arreglo[4];
  CarasObjeto3D[7].puntos[3] := arreglo[3];
  //Cara 8
  CarasObjeto3D[8].puntos[1] := arreglo[6];
  CarasObjeto3D[8].puntos[2] := arreglo[2];
  CarasObjeto3D[8].puntos[3] := arreglo[3];
  //Pinta Caras
  Lienzo.Canvas.Brush.Color := clGray;
  //Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[14]-6].puntos);
  Lienzo.Canvas.Brush.Color := clMaroon;
  //Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[13]-6].puntos);
  Lienzo.Canvas.Brush.Color := clTeal;
  //Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[12]-6].puntos);
  Lienzo.Canvas.Brush.Color := clSkyBlue;
  //Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[11]-6].puntos);
  Lienzo.Canvas.Brush.Color := clOlive;
  Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[10]-6].puntos);
  Lienzo.Canvas.Brush.Color := clNavy;
  Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[9]-6].puntos);
  Lienzo.Canvas.Brush.Color := clFuchsia;
  Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[8]-6].puntos);
  Lienzo.Canvas.Brush.Color := clPurple;
  Lienzo.Canvas.Polygon(CarasObjeto3D[CarasAux[7]-6].puntos);
end;
//Proyeccion Paralela
procedure ProyParalela(x,y : Real; var Xpan, Ypan: Integer);
begin
  Xpan := Round(x);
  Xpan := Xpan +250;
  Ypan := Round(y);
  Ypan := Ypan +250;
end;
//Botton Pintar
var i,j,k : Integer;
begin
  //Proyeccion Paralela
  for i := 1 to 14 do
  begin
    ProyParalela(Objeto3D[i].X, Objeto3D[i].Y, arreglo[i].X, arreglo[i].Y);
  end;
  //Ordena caras
  for i:=7 to 14 do
  begin
    for j:=7 to 13 do
    begin
      if( Objeto3D[j].Z > Objeto3D[j+1].Z ) then
      begin
        Objeto3D[15] := Objeto3D[j];
        Objeto3D[j] := Objeto3D[j+1];
        Objeto3D[j+1] := Objeto3D[15];

        k := CarasAux[j];
        CarasAux[j] := CarasAux[j+1];
        CarasAux[j+1] := k;
      end;
    end;
  end;
  pintaCaras();
  //Default
  Lienzo.Canvas.Brush.Color := clWhite;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Lienzo.Canvas.Rectangle(0,0,500,500);
end;
//
//Rotaciones
//
procedure TForm1.Button8Click(Sender: TObject);
var i : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  for i := 1 to 14 do
  begin
    Xaux := Objeto3D[i].X * C + Objeto3D[i].Y * S;
    Yaux := -1 * Objeto3D[i].X * S + Objeto3D[i].Y * C;
    Objeto3D[i].X := Xaux;
    Objeto3D[i].Y := Yaux;
  end;
  Form1.Button9Click(Sender);
  Form1.Button1Click(Sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
var i : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  for i := 1 to 14 do
  begin
    Yaux := Objeto3D[i].Y * C + Objeto3D[i].Z * S;
    Zaux := -1 * Objeto3D[i].Y * S + Objeto3D[i].Z * C;
    Objeto3D[i].Y := Yaux;
    Objeto3D[i].Z := Zaux;
  end;
  Form1.Button9Click(Sender);
  Form1.Button1Click(sender);
end;

procedure TForm1.Button11Click(Sender: TObject);
var i : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  for i := 1 to 14 do
  begin
    Xaux := -1 * Objeto3D[i].Z * S + Objeto3D[i].X * C;
    Zaux := Objeto3D[i].Z * C + Objeto3D[i].X * S;
    Objeto3D[i].X := Xaux;
    Objeto3D[i].Z := Zaux;
  end;
  Form1.Button9Click(Sender);
  Form1.Button1Click(sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
var i : Integer;
begin
  S := sin(-alpha);
  C := cos(-alpha);
  for i := 1 to 14 do
  begin
    Xaux := Objeto3D[i].X * C + Objeto3D[i].Y * S;
    Yaux := -1 * Objeto3D[i].X * S + Objeto3D[i].Y * C;
    Objeto3D[i].X := Xaux;
    Objeto3D[i].Y := Yaux;
  end;
  Form1.Button9Click(Sender);
  Form1.Button1Click(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
var i : Integer;
begin
  S := sin(-alpha);//Seno
  C := cos(-alpha);//Coseno
  for i := 1 to 14 do
  begin
    Xaux := -1 * Objeto3D[i].Z * S + Objeto3D[i].X * C;
    Zaux := Objeto3D[i].Z * C + Objeto3D[i].X * S;
    Objeto3D[i].X := Xaux;
    Objeto3D[i].Z := Zaux;
  end;
  Form1.Button9Click(Sender);
  Form1.Button1Click(sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
var i : Integer;
begin
  S := sin(-alpha);//Seno
  C := cos(-alpha);//Coseno
  for i := 1 to 14 do
  begin
    Yaux := Objeto3D[i].Y * C + Objeto3D[i].Z * S;
    Zaux := -1 * Objeto3D[i].Y * S + Objeto3D[i].Z * C;
    Objeto3D[i].Y := Yaux;
    Objeto3D[i].Z := Zaux;
  end;
  Form1.Button9Click(Sender); 
  Form1.Button1Click(sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage('Ruiz Lozano Paulo Cesar');
end;

end.
