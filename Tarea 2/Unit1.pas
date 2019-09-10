unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    lbl1: TLabel;
    dlgColor1: TColorDialog;
    tmr1: TTimer;
    edt1: TEdit;
    edt2: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btn10: TButton;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gradosS, gradosM, gradosH: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var autor : TBitmap;
begin
  autor := TBitmap.Create;
  autor.LoadFromFile('autor.bmp');
  Image1.Canvas.Draw(0,0,autor);
  img1.Canvas.Rectangle(0,0,300,300);
  gradosS := 0;
  gradosM := 0;
  gradosH := 0;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.btn1Click(Sender: TObject);
var seg : array[1..4] of TPoint;
{
 Pascal permite poner indices superiores e inferiores
 array[indice inferior .. indice superior]
}
var i : Integer;
begin
  //Segundero
  seg[1] := Point(-3,0);
  seg[2] := Point(0,3);
  seg[3] := Point(3,0);
  seg[4] := Point(0,-85);
  
  //Traslacion del objeto
  for i := 1 to 4 do
  begin
    seg[i].X := seg[i].X + 150;
    seg[i].Y := seg[i].Y + 150;
  end;
  //Pintar
  img1.Canvas.Polygon(seg);
end;

procedure TForm1.btn7Click(Sender: TObject);
var RELOG : TBitmap;
begin
  tmr1.Enabled := False;
  RELOG := TBitmap.Create;
  RELOG.LoadFromFile('rolex.bmp');
  img1.Canvas.Rectangle(0,0,300,300);
  img1.Canvas.Draw(0,0,RELOG);
  img1.Canvas.Brush.Color := clWhite;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  ShowMessage('Paulo Cesar Ruiz Lozano');
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
  if(dlgColor1.Execute)then
  begin
    img1.Canvas.Pen.Color := dlgColor1.Color;
  end;
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
  if(dlgColor1.Execute)then
  begin
    img1.Canvas.Brush.Color := dlgColor1.Color;
  end;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
var seg : array[1..4] of TPoint;
var min : array[1..4] of TPoint;
var hor : array[1..4] of TPoint;
var i : Integer;
var xAux, yAux, alpha1, alpha2, alpha3 : Real;
var BUAP : TBitmap;
var hora: string[8];
begin
  BUAP := TBitmap.Create;
  BUAP.LoadFromFile('rolex.bmp');

  //Hora
  edt1.Text := TimeToStr(Time);
  //Fecha
  edt2.Text := DateToStr(Date);
  hora := TimeToStr(Time);

  gradosS := 6 * StrToInt(hora[7]+hora[8]);
  gradosM := 6 * StrToInt(hora[4]+hora[5]);
  gradosH := -6 * StrToInt(hora[1]+hora[2]);

  //Biblioteca de tiempo Ttimer
  //Segundero
  seg[1] := Point(-3,0);
  seg[2] := Point(0,3);
  seg[3] := Point(3,0);
  seg[4] := Point(0,-85);
  //Minutero
  min[1] := Point(-10,0);
  min[2] := Point(0,10);
  min[3] := Point(10,0);
  min[4] := Point(0,-75);
  //Horero
  hor[1] := Point(-7,0);
  hor[2] := Point(0,7);
  hor[3] := Point(7,0);
  hor[4] := Point(0,-50);
  //Calculo del angulo en radianes
  alpha1 := (-gradosS*pi)/180.0;
  alpha2 := (-gradosM*pi)/180.0;
  alpha3 := (-gradosH*pi)/180.0;
  //Modificaciones en los puntos
  for i := 1 to 4 do
  begin
    //
    //Rotacion
    //
    //Segunderos
    xAux := seg[i].X * Cos(alpha1) + seg[i].Y * Sin(alpha1);
    yAux := -seg[i].X * Sin(alpha1) + seg[i].y * Cos(alpha1);

    seg[i].X := Round(xAux);
    seg[i].Y := Round(yAux);
    //Minuteros
    xAux := min[i].X * Cos(alpha2) + min[i].Y * Sin(alpha2);
    yAux := -min[i].X * Sin(alpha2) + min[i].y * Cos(alpha2);

    min[i].X := Round(xAux);
    min[i].Y := Round(yAux);
    //Horeros
    xAux := hor[i].X * Cos(alpha3) + hor[i].Y * Sin(alpha3);
    yAux := -hor[i].X * Sin(alpha3) + hor[i].y * Cos(alpha3);

    hor[i].X := Round(xAux);
    hor[i].Y := Round(yAux);
    //
    //Traslacion
    //
    //Segundero
    seg[i].X := seg[i].X + 150;
    seg[i].Y := seg[i].Y + 150;
    //Minutero
    min[i].X := min[i].X + 150;
    min[i].Y := min[i].Y + 150;
    //Horero
    hor[i].X := hor[i].X + 150;
    hor[i].Y := hor[i].Y + 150;
  end;
  //Limpiar pantalla
  img1.Canvas.Brush.Color := clWhite;
  img1.Canvas.Rectangle(0,0,300,300);
  img1.Canvas.Draw(0,0,BUAP);
  //Pintar
  img1.Canvas.Pen.Color := clRed;
  img1.Canvas.Polygon(min);

  img1.Canvas.Pen.Color := clBlue;
  img1.Canvas.Polygon(hor);
  
  img1.Canvas.Pen.Color := clBlack;
  img1.Canvas.Polygon(seg);
  //Incremento de los grados
  gradosS := gradosS + 6;
  if(gradosS = 360)then
  begin
    gradosS := 0;
    gradosM := gradosM + 6;
  end;
  if(gradosM = 360)then
  begin
    gradosM := 0;
    gradosH := gradosH + 6;
  end;


end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  tmr1.Enabled := False;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  gradosS := 0;
  gradosM := 0;
  gradosH := 0;
end;

procedure TForm1.btn10Click(Sender: TObject);
begin
  tmr1.Enabled := True;
end;

procedure TForm1.btn3Click(Sender: TObject);
var min : array[1..4] of TPoint;
{
 Pascal permite poner indices superiores e inferiores
 array[indice inferior .. indice superior]
}
var i : Integer;
begin
  //Minutero
  min[1] := Point(-10,0);
  min[2] := Point(0,10);
  min[3] := Point(10,0);
  min[4] := Point(0,-75);

  //Traslacion del objeto
  for i := 1 to 4 do
  begin
    min[i].X := min[i].X + 150;
    min[i].Y := min[i].Y + 150;
  end;
  //Pintar
  img1.Canvas.Polygon(min);
end;

procedure TForm1.Button1Click(Sender: TObject);
var hor : array[1..4] of TPoint;
{
 Pascal permite poner indices superiores e inferiores
 array[indice inferior .. indice superior]
}
var i : Integer;
begin
  //Horero
  hor[1] := Point(-7,0);
  hor[2] := Point(0,7);
  hor[3] := Point(7,0);
  hor[4] := Point(0,-50);
  //Traslacion del objeto
  for i := 1 to 4 do
  begin
    hor[i].X := hor[i].X + 150;
    hor[i].Y := hor[i].Y + 150;
  end;
  //Pintar
  img1.Canvas.Polygon(hor);
end;

end.
