unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Button11: TButton;
    Button13: TButton;
    Button14: TButton;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Editar1: TMenuItem;
    Ayuda1: TMenuItem;
    Autor1: TMenuItem;
    Limpiar1: TMenuItem;
    Abrir1: TMenuItem;
    Titulo: TLabel;
    Pintar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Informacion1: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Limpiar1Click(Sender: TObject);
    procedure Autor1Click(Sender: TObject);
    procedure Pintar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Informacion1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//
//Tipos propios
//
//Firewall
type TFirewall = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Server
type TServer = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Switch
type TSwitch = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Computadora
type TPc = Packed Record
  CordX : Integer;
  CordY : Integer;
  angulo : Integer;
end;
//Impresora
type TPrinter = Packed Record
  CordX : Integer;
  CordY : Integer;
  angulo : Integer;
end;
//TPoint3D
type TPoint3D = Packed Record
  X,Y,Z : Real;
end;
//
//Variables Globales
//
var
  Form1: TForm1;
  P, Q : TPoint;
  Cubo, ObjetoPC, ObjetoImpre, ObjetoFirewall, ObjetoServer, ObjetoSwitchs, ObjetoCable, ObjetoFibra : Array[1..300,1..10] of TPoint3D;
  //Las coordenadas x, y Proyectadas
  Xp, Yp : Integer;
  //angulo
  alpha, angulo, S, C : Real;
  //Auxiliares
  Xaux, YAux, Zaux : Real;
  //Distancias de perspectiva
  OjoAObjeto, OjoAPantalla : Real;
  //Centro
  CoordenadasCentro : TPoint;
  //Listas
  ListaFibras : array[1..100,1..2] of TPoint3D;
  ListaCables : array[1..100,1..2] of TPoint3D;
  ListaFirewalls : array[1..50] of TFirewall;
  ListaServers : array[1..50] of TServer;
  ListaSwitchs : array[1..50] of TSwitch;
  ListaPcs : array[1..50] of TPc;
  ListaImpre : array[1..50] of TPrinter;
  //Contadores
  NumFibra, NumCable, NumFirewall, NumServer, NumSwitch, NumPc, NumImpre: Integer;

implementation

{$R *.dfm}
//
//Constructor
//
procedure TForm1.FormCreate(Sender: TObject);
begin
  //Pinta Pantalla
  Image1.Canvas.Rectangle(0,0,2000,2000);
  //Angulo
  alpha := (5*PI)/180;
  //Objeto Iterable
  Cubo[1][1].X := +40; Cubo[1][1].Y := +40; Cubo[1][1].Z := -40;
  Cubo[1][2].X := +40; Cubo[1][2].Y := -40; Cubo[1][2].Z := -40;

  Cubo[1][3].X := -40; Cubo[1][3].Y := -40; Cubo[1][3].Z := -40;
  Cubo[1][4].X := -40; Cubo[1][4].Y := +40; Cubo[1][4].Z := -40;

  Cubo[1][5].X := +40; Cubo[1][5].Y := +40; Cubo[1][5].Z := -40;
  Cubo[1][6].X := +40; Cubo[1][6].Y := +40; Cubo[1][6].Z := 40;

  Cubo[1][7].X := +40; Cubo[1][7].Y := -40; Cubo[1][7].Z := 40;
  Cubo[1][8].X := -40; Cubo[1][8].Y := -40; Cubo[1][8].Z := 40;

  Cubo[1][9].X := -40; Cubo[1][9].Y := +40; Cubo[1][9].Z := 40;
  Cubo[1][10].X := +40; Cubo[1][10].Y := +40; Cubo[1][10].Z := 40;

  //Calculo de ojo de pantalla;
  OjoAObjeto := 2 * 40;
  OjoAPantalla := 2 * 40;
  //Inicio de Conteo de objetos
  Numfibra := 0;
  NumCable := 0;
  NumFirewall := 0;
  NumServer := 0;
  NumSwitch := 0;
  NumPc := 0;
  NumImpre := 0;
  angulo := 0;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,500,500);
end;
//
//Rotaciones
//
procedure TForm1.Button8Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  Form1.Limpiar1Click(Sender);
  //
  for j:=1 to NumPc do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Xaux := ObjetoPC[j][i].X * C + ObjetoPC[j][i].Y * S;
      Yaux := -1 * ObjetoPC[j][i].X * S + ObjetoPC[j][i].Y * C;
      ObjetoPC[j][i].X := Xaux;
      ObjetoPC[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Xaux := ObjetoImpre[j][i].X * C + ObjetoImpre[j][i].Y * S;
      Yaux := -1 * ObjetoImpre[j][i].X * S + ObjetoImpre[j][i].Y * C;
      ObjetoImpre[j][i].X := Xaux;
      ObjetoImpre[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    for i := 1 to 10 do
    begin
      Xaux := ObjetoFirewall[j][i].X * C + ObjetoFirewall[j][i].Y * S;
      Yaux := -1 * ObjetoFirewall[j][i].X * S + ObjetoFirewall[j][i].Y * C;
      ObjetoFirewall[j][i].X := Xaux;
      ObjetoFirewall[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    for i := 1 to 10 do
    begin
      Xaux := ObjetoServer[j][i].X * C + ObjetoServer[j][i].Y * S;
      Yaux := -1 * ObjetoServer[j][i].X * S + ObjetoServer[j][i].Y * C;
      ObjetoServer[j][i].X := Xaux;
      ObjetoServer[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    for i := 1 to 10 do
    begin
      Xaux := ObjetoSwitchs[j][i].X * C + ObjetoSwitchs[j][i].Y * S;
      Yaux := -1 * ObjetoSwitchs[j][i].X * S + ObjetoSwitchs[j][i].Y * C;
      ObjetoSwitchs[j][i].X := Xaux;
      ObjetoSwitchs[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;

end;

procedure TForm1.Button10Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  Form1.Limpiar1Click(Sender);
  for j := 1 to NumPc do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Yaux := ObjetoPC[j][i].Y * C + ObjetoPC[j][i].Z * S;
      Zaux := -1 * ObjetoPC[j][i].Y * S + ObjetoPC[j][i].Z * C;
      ObjetoPC[j][i].Y := Yaux;
      ObjetoPC[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;

  for j := 1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Yaux := ObjetoImpre[j][i].Y * C + ObjetoImpre[j][i].Z * S;
      Zaux := -1 * ObjetoImpre[j][i].Y * S + ObjetoImpre[j][i].Z * C;
      ObjetoImpre[j][i].Y := Yaux;
      ObjetoImpre[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j := 1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;
    for i := 1 to 10 do
    begin
      Yaux := ObjetoFirewall[j][i].Y * C + ObjetoFirewall[j][i].Z * S;
      Zaux := -1 * ObjetoFirewall[j][i].Y * S + ObjetoFirewall[j][i].Z * C;
      ObjetoFirewall[j][i].Y := Yaux;
      ObjetoFirewall[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j := 1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;
    for i := 1 to 10 do
    begin
      Yaux := ObjetoServer[j][i].Y * C + ObjetoServer[j][i].Z * S;
      Zaux := -1 * ObjetoServer[j][i].Y * S + ObjetoServer[j][i].Z * C;
      ObjetoServer[j][i].Y := Yaux;
      ObjetoServer[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j := 1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;
    for i := 1 to 10 do
    begin
      Yaux := ObjetoSwitchs[j][i].Y * C + ObjetoSwitchs[j][i].Z * S;
      Zaux := -1 * ObjetoSwitchs[j][i].Y * S + ObjetoSwitchs[j][i].Z * C;
      ObjetoSwitchs[j][i].Y := Yaux;
      ObjetoSwitchs[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(alpha);
  C := cos(alpha);
  Form1.Limpiar1Click(Sender);
  for j:= 1 to NumPC do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoPC[j][i].Z * S + ObjetoPC[j][i].X * C;
      Zaux := ObjetoPC[j][i].Z * C + ObjetoPC[j][i].X * S;
      ObjetoPC[j][i].X := Xaux;
      ObjetoPC[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;
  for j:= 1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoImpre[j][i].Z * S + ObjetoImpre[j][i].X * C;
      Zaux := ObjetoImpre[j][i].Z * C + ObjetoImpre[j][i].X * S;
      ObjetoImpre[j][i].X := Xaux;
      ObjetoImpre[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:= 1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoFirewall[j][i].Z * S + ObjetoFirewall[j][i].X * C;
      Zaux := ObjetoFirewall[j][i].Z * C + ObjetoFirewall[j][i].X * S;
      ObjetoFirewall[j][i].X := Xaux;
      ObjetoFirewall[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:= 1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoServer[j][i].Z * S + ObjetoServer[j][i].X * C;
      Zaux := ObjetoServer[j][i].Z * C + ObjetoServer[j][i].X * S;
      ObjetoServer[j][i].X := Xaux;
      ObjetoServer[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:= 1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoSwitchs[j][i].Z * S + ObjetoSwitchs[j][i].X * C;
      Zaux := ObjetoSwitchs[j][i].Z * C + ObjetoSwitchs[j][i].X * S;
      ObjetoSwitchs[j][i].X := Xaux;
      ObjetoSwitchs[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(-alpha);
  C := cos(-alpha);
  Form1.Limpiar1Click(Sender);
  for j:=1 to NumPC do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Xaux := ObjetoPC[j][i].X * C + ObjetoPC[j][i].Y * S;
      Yaux := -1 * ObjetoPC[j][i].X * S + ObjetoPC[j][i].Y * C;
      ObjetoPC[j][i].X := Xaux;
      ObjetoPC[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Xaux := ObjetoImpre[j][i].X * C + ObjetoImpre[j][i].Y * S;
      Yaux := -1 * ObjetoImpre[j][i].X * S + ObjetoImpre[j][i].Y * C;
      ObjetoImpre[j][i].X := Xaux;
      ObjetoImpre[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    for i := 1 to 10 do
    begin
      Xaux := ObjetoFirewall[j][i].X * C + ObjetoFirewall[j][i].Y * S;
      Yaux := -1 * ObjetoFirewall[j][i].X * S + ObjetoFirewall[j][i].Y * C;
      ObjetoFirewall[j][i].X := Xaux;
      ObjetoFirewall[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    for i := 1 to 10 do
    begin
      Xaux := ObjetoServer[j][i].X * C + ObjetoServer[j][i].Y * S;
      Yaux := -1 * ObjetoServer[j][i].X * S + ObjetoServer[j][i].Y * C;
      ObjetoServer[j][i].X := Xaux;
      ObjetoServer[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    for i := 1 to 10 do
    begin
      Xaux := ObjetoSwitchs[j][i].X * C + ObjetoSwitchs[j][i].Y * S;
      Yaux := -1 * ObjetoSwitchs[j][i].X * S + ObjetoSwitchs[j][i].Y * C;
      ObjetoSwitchs[j][i].X := Xaux;
      ObjetoSwitchs[j][i].Y := Yaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(-alpha);
  C := cos(-alpha);
  Form1.Limpiar1Click(Sender);
  for j:=1 to NumPC do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoPC[j][i].Z * S + ObjetoPC[j][i].X * C;
      Zaux := ObjetoPC[j][i].Z * C + ObjetoPC[j][i].X * S;
      ObjetoPC[j][i].X := Xaux;
      ObjetoPC[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoImpre[j][i].Z * S + ObjetoImpre[j][i].X * C;
      Zaux := ObjetoImpre[j][i].Z * C + ObjetoImpre[j][i].X * S;
      ObjetoImpre[j][i].X := Xaux;
      ObjetoImpre[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoFirewall[j][i].Z * S + ObjetoFirewall[j][i].X * C;
      Zaux := ObjetoFirewall[j][i].Z * C + ObjetoFirewall[j][i].X * S;
      ObjetoFirewall[j][i].X := Xaux;
      ObjetoFirewall[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoServer[j][i].Z * S + ObjetoServer[j][i].X * C;
      Zaux := ObjetoServer[j][i].Z * C + ObjetoServer[j][i].X * S;
      ObjetoServer[j][i].X := Xaux;
      ObjetoServer[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    for i := 1 to 10 do
    begin
      Xaux := -1 * ObjetoSwitchs[j][i].Z * S + ObjetoSwitchs[j][i].X * C;
      Zaux := ObjetoSwitchs[j][i].Z * C + ObjetoSwitchs[j][i].X * S;
      ObjetoSwitchs[j][i].X := Xaux;
      ObjetoSwitchs[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j : Integer;
begin
  S := sin(-alpha);
  C := cos(-alpha);
  Form1.Limpiar1Click(Sender);
  for j:=1 to NumPC do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    for i := 1 to 10 do
    begin
      Yaux := ObjetoPC[j][i].Y * C + ObjetoPC[j][i].Z * S;
      Zaux := -1 * ObjetoPC[j][i].Y * S + ObjetoPC[j][i].Z * C;
      ObjetoPC[j][i].Y := Yaux;
      ObjetoPC[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoPC[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    for i := 1 to 10 do
    begin
      Yaux := ObjetoImpre[j][i].Y * C + ObjetoImpre[j][i].Z * S;
      Zaux := -1 * ObjetoImpre[j][i].Y * S + ObjetoImpre[j][i].Z * C;
      ObjetoImpre[j][i].Y := Yaux;
      ObjetoImpre[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoImpre[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    for i := 1 to 10 do
    begin
      Yaux := ObjetoFirewall[j][i].Y * C + ObjetoFirewall[j][i].Z * S;
      Zaux := -1 * ObjetoFirewall[j][i].Y * S + ObjetoFirewall[j][i].Z * C;
      ObjetoFirewall[j][i].Y := Yaux;
      ObjetoFirewall[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoFirewall[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    for i := 1 to 10 do
    begin
      Yaux := ObjetoServer[j][i].Y * C + ObjetoServer[j][i].Z * S;
      Zaux := -1 * ObjetoServer[j][i].Y * S + ObjetoServer[j][i].Z * C;
      ObjetoServer[j][i].Y := Yaux;
      ObjetoServer[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoServer[j];
    Form1.Pintar1Click(Sender);
  end;

  for j:=1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    for i := 1 to 10 do
    begin
      Yaux := ObjetoSwitchs[j][i].Y * C + ObjetoSwitchs[j][i].Z * S;
      Zaux := -1 * ObjetoSwitchs[j][i].Y * S + ObjetoSwitchs[j][i].Z * C;
      ObjetoSwitchs[j][i].Y := Yaux;
      ObjetoSwitchs[j][i].Z := Zaux;
    end;
    Cubo[1] := ObjetoSwitchs[j];
    Form1.Pintar1Click(Sender);
  end;
end;
//
//Acercar
//
procedure TForm1.Button13Click(Sender: TObject);
begin
 OjoAObjeto := OjoAObjeto * 1.10;
 Form1.Limpiar1Click(Sender);
 Form1.Button1Click(Sender);
end;
//
//Alejaer
//
procedure TForm1.Button14Click(Sender: TObject);
begin
  OjoAObjeto := OjoAObjeto / 1.10;
  Form1.Limpiar1Click(Sender);
  Form1.Button1Click(Sender);
end;
//
//Limpiar Menu
//
procedure TForm1.Limpiar1Click(Sender: TObject);
begin
  Image1.Canvas.Rectangle(0,0,2000,2000);
end;
//Autor
procedure TForm1.Autor1Click(Sender: TObject);
begin
  ShowMessage('Ruiz Lozano Paulo Cesar');
end;
//
//Pintar
//
procedure TForm1.Pintar1Click(Sender: TObject);
//Procedimiento Perspectiva
procedure ProyPerspectiva(x,y,z : Real; var Xpan, Ypan: Integer);
var xAux, yAux, zAux: Real;
begin
  zAux := z + OjoAObjeto;
  xAux := x * OjoAPantalla / zAux;
  Xpan := round(xAux)+ 300;
  zAux := z + OjoAObjeto;
  yAux := y * OjoAPantalla / zAux;
  Ypan := round(yAux)+ 300;
end;
var i : Integer;
begin
  for i := 1 to 4 do
  begin
    ProyPerspectiva(Cubo[1][i].X, Cubo[1][i].Y, Cubo[1][i].Z, P.X, P.Y);
    ProyPerspectiva(Cubo[1][i+1].X, Cubo[1][i+1].Y, Cubo[1][i+1].Z, Q.X, Q.Y);

    Image1.Canvas.MoveTo(P.X, P.Y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  for i := 6 to 9 do
  begin
    ProyPerspectiva(Cubo[1][i].X, Cubo[1][i].Y, Cubo[1][i].Z, P.X, P.Y);
    ProyPerspectiva(Cubo[1][i+1].X, Cubo[1][i+1].Y, Cubo[1][i+1].Z, Q.X, Q.Y);

    Image1.Canvas.MoveTo(P.X, P.Y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  for i := 1 to 4 do
  begin
    ProyPerspectiva(Cubo[1][i].X, Cubo[1][i].Y, Cubo[1][i].Z, P.X, P.Y);
    ProyPerspectiva(Cubo[1][i+5].X, Cubo[1][i+5].Y, Cubo[1][i+5].Z, Q.X, Q.Y);

    Image1.Canvas.MoveTo(P.X, P.Y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  Image1.Canvas.Pen.Color := ClBlack;
end;
//
//Abrir
//
procedure TForm1.Abrir1Click(Sender: TObject);
var aux,tipo: String;
var xa,ya,xb,yb,xaux,yaux ,i: Integer;
var maximo,minimo : TPoint;
var conP : TPc;
var conI : TPrinter;
var conH : TSwitch;
var conW : TFirewall;
var conS : TServer;
var  f: TextFile;
begin
  aux := 'l';
  tipo := 'l';
  //Abrir Archivo
  if(OpenDialog1.Execute) then
  begin
  //Reestablece los contadores
  Numfibra := 0;
  NumCable := 0;
  NumFirewall := 0;
  NumServer := 0;
  NumSwitch := 0;
  NumPc := 0;
  NumImpre := 0;
  //Reestablece de defaul el angulo
  angulo := 0;
  //Cargar arvhivos en Pascal
  AssignFile(f,OpenDialog1.FileName);
  //Fopen
  Reset(f);//fopen
  while not EOF(f) do //Mientras no llegue al final del archivo
  begin
    //Lee Linea
    readln(f,aux);
    if(CompareText(aux,'f') = 0)then//Busca Fibras
    begin
      tipo := 'f';
    end;
    if(CompareText(aux,'c') = 0)then//Busca Cables
    begin
      tipo := 'c';
    end;
    if(CompareText(aux,'w') = 0)then//Busca Firewalls
    begin
      tipo := 'w';
    end;
    if(CompareText(aux,'s') = 0)then//Busca Servidores
    begin
      tipo := 's';
    end;
    if(CompareText(aux,'h') = 0)then//Busca Switches
    begin
        tipo := 'h';
    end;
    if(CompareText(aux,'p') = 0)then//Busca Pcs
    begin
        tipo := 'p';
    end;
    if(CompareText(aux,'i') = 0)then//Busca Impresoras
    begin
        tipo := 'i';
    end;
    if(CompareText(aux,'k') = 0)then//Busca Fin de archivo
    begin
      tipo := 'l';
    end;
    //Llena
    if(CompareText(tipo,'l') <> 0)then
    begin
      if(CompareText(tipo,'f') = 0) then//Fibras
      begin
        readln(f,xa);
        readln(f,ya);
        readln(f,xb);
        readln(f,yb);
        ListaFibras[NumFibra+1][1].X := xa;
        ListaFibras[NumFibra+1][1].Y := ya;
        ListaFibras[NumFibra+1][1].Z := 1;
        ListaFibras[NumFibra+1][2].X := xb;
        ListaFibras[NumFibra+1][2].Y := yb;
        ListaFibras[NumFibra+1][2].Z := +1;
        NumFibra := NumFibra + 1;
      end;
      if(CompareText(tipo,'c') = 0) then//Cables
      begin
          readln(f,xa);
          readln(f,ya);
          readln(f,xb);
          readln(f,yb);
          ListaCables[NumCable+1][1].X := xa;
          ListaCables[NumCable+1][1].Y := ya;
          ListaCables[NumCable+1][1].Z := +1;
          ListaCables[NumCable+1][2].X := xb;
          ListaCables[NumCable+1][2].Y := yb;
          ListaCables[NumCable+1][2].Z := +1;
          NumCable := NumCable + 1;
      end;
      if(CompareText(tipo,'w') = 0) then//Firewalls
      begin
          readln(f,xa);
          readln(f,ya);
          conW.CordX := xa;
          conW.CordY := ya;
          ListaFirewalls[NumFirewall+1] := conW;
          NumFirewall := NumFirewall +1;
      end;
      if(CompareText(tipo,'s') = 0) then//Server
      begin
          readln(f,xa);
          readln(f,ya);
          conS.CordX := xa;
          conS.CordY := ya;
          ListaServers[NumServer+1] := conS;
          NumServer := NumServer +1;
      end;
      if(CompareText(tipo,'h') = 0) then//Switchs
      begin
          readln(f,xa);
          readln(f,ya);
          conH.CordX := xa;
          conH.CordY := ya;
          ListaSwitchs[NumSwitch+1] := conH;
          NumSwitch := NumSwitch + 1;
      end;
      if(CompareText(tipo,'p') = 0) then//Computadoras
      begin
          readln(f,xa);
          readln(f,ya);
          readln(f,yb);
          if yb = 0 then
          begin
            conP.angulo := 0;
          end;
          if yb = 90 then
          begin
            conP.angulo := 90;
          end;
          if yb = 180 then
          begin
            conP.angulo := 180;
          end;
          if yb = 270 then
          begin
            conP.angulo := 270;
          end;
          conP.CordX := xa;
          conP.CordY := ya;
          ListaPcs[NumPc+1] := conP;
          NumPc := NumPc + 1;
      end;
      if(CompareText(tipo,'i') = 0) then//Impresoras
      begin
          readln(f,xa);
          readln(f,ya);
          readln(f,yb);
          if yb = 0 then
          begin
            conI.angulo := 0;
          end;
          if yb = 90 then
          begin
            conI.angulo := 90;
          end;
          if yb = 180 then
          begin
            conI.angulo := 180;
          end;
          if yb = 270 then
          begin
            conI.angulo := 270;
          end;
          conI.CordX := xa;
          conI.CordY := ya;
          ListaImpre[NumImpre+1] := conI;
          NumImpre := NumImpre + 1;
      end;
      end;
    end;
    CloseFile(f);//Cerrar El archivo
  end;//Fin if
  //
  //Calculo del punto x y del centro
  //
  //Calculo de Y y X maximos
  xaux := 0;
  yaux := 0;
  for i := 1 to NumCable do //Cables
  begin
    if(ListaCables[i][1].X > xaux)then
    begin
      xaux := Round(ListaCables[i][1].X);
    end;
    if(ListaCables[i][2].X > xaux)then
    begin
      xaux := Round(ListaCables[i][1].X);
    end;
    if(ListaCables[i][1].Y > yaux)then
    begin
      yaux := Round(ListaCables[i][1].Y);
    end;
    if(ListaCables[i][2].Y > yaux)then
    begin
      yaux := Round(ListaCables[i][1].Y);
    end;
  end;
  for i := 1 to NumFibra do //Fibras
  begin
    if(ListaFibras[i][1].X > xaux)then
    begin
      xaux := Round(ListaFibras[i][1].X);
    end;
    if(ListaFibras[i][2].X > xaux)then
    begin
      xaux := Round(ListaFibras[i][1].X);
    end;
    if(ListaFibras[i][1].Y > yaux)then
    begin
      yaux := Round(ListaFibras[i][1].Y);
    end;
    if(ListaFibras[i][2].Y > yaux)then
    begin
      yaux := Round(ListaFibras[i][1].Y);
    end;
  end;
  for i := 1 to NumFirewall do //Firewalls
  begin
    if(ListaFirewalls[i].CordX > xaux)then
    begin
      xaux := ListaFirewalls[i].CordX;
    end;
    if(ListaFirewalls[i].CordX > xaux)then
    begin
      xaux := ListaFirewalls[i].CordY;
    end;
  end;
  for i := 1 to NumImpre do //Impre
  begin
    if(ListaImpre[i].CordX > xaux)then
    begin
      xaux := ListaImpre[i].CordX;
    end;
    if(ListaImpre[i].CordX > xaux)then
    begin
      xaux := ListaImpre[i].CordY;
    end;
  end;
  for i := 1 to NumPc do //Computadora
  begin
    if(ListaPcs[i].CordX > xaux)then
    begin
      xaux := ListaPcs[i].CordX;
    end;
    if(ListaPcs[i].CordX > xaux)then
    begin
      xaux := ListaPcs[i].CordY;
    end;
  end;
  for i := 1 to NumServer do //Servers
  begin
    if(ListaServers[i].CordX > xaux)then
    begin
      xaux := ListaServers[i].CordX;
    end;
    if(ListaServers[i].CordX > xaux)then
    begin
      xaux := ListaServers[i].CordY;
    end;
  end;
  for i := 1 to NumSwitch do //Switch
  begin
    if(ListaSwitchs[i].CordX > xaux)then
    begin
      xaux := ListaSwitchs[i].CordX;
    end;
    if(ListaSwitchs[i].CordX > xaux)then
    begin
      xaux := ListaSwitchs[i].CordY;
    end;
  end;
  maximo.X := xaux;
  maximo.Y := yaux;
  //
  //Calculo de Y y X maminimos
  //
  xaux := 2000;
  yaux := 2000;
  for i := 1 to NumCable do //Cables
  begin
    if(ListaCables[i][1].X < xaux)then
    begin
      xaux := Round(ListaCables[i][1].X);
    end;
    if(ListaCables[i][2].X < xaux)then
    begin
      xaux := Round(ListaCables[i][1].X);
    end;
    if(ListaCables[i][1].Y < yaux)then
    begin
      yaux := Round(ListaCables[i][1].Y);
    end;
    if(ListaCables[i][2].Y < yaux)then
    begin
      yaux := Round(ListaCables[i][1].Y);
    end;
  end;
  for i := 1 to NumFibra do //Fibras
  begin
    if(ListaFibras[i][1].X < xaux)then
    begin
      xaux := Round(ListaFibras[i][1].X);
    end;
    if(ListaFibras[i][2].X < xaux)then
    begin
      xaux := Round(ListaFibras[i][1].X);
    end;
    if(ListaFibras[i][1].Y < yaux)then
    begin
      yaux := Round(ListaFibras[i][1].Y);
    end;
    if(ListaFibras[i][2].Y < yaux)then
    begin
      yaux := Round(ListaFibras[i][1].Y);
    end;
  end;
  for i := 1 to NumFirewall do //Firewalls
  begin
    if(ListaFirewalls[i].CordX < xaux)then
    begin
      xaux := ListaFirewalls[i].CordX;
    end;
    if(ListaFirewalls[i].CordX < xaux)then
    begin
      xaux := ListaFirewalls[i].CordY;
    end;
  end;
  for i := 1 to NumImpre do //Impre
  begin
    if(ListaImpre[i].CordX < xaux)then
    begin
      xaux := ListaImpre[i].CordX;
    end;
    if(ListaImpre[i].CordX < xaux)then
    begin
      xaux := ListaImpre[i].CordY;
    end;
  end;
  for i := 1 to NumPc do //Computadora
  begin
    if(ListaPcs[i].CordX < xaux)then
    begin
      xaux := ListaPcs[i].CordX;
    end;
    if(ListaPcs[i].CordX < xaux)then
    begin
      xaux := ListaPcs[i].CordY;
    end;
  end;
  for i := 1 to NumServer do //Servers
  begin
    if(ListaServers[i].CordX < xaux)then
    begin
      xaux := ListaServers[i].CordX;
    end;
    if(ListaServers[i].CordX < xaux)then
    begin
      xaux := ListaServers[i].CordY;
    end;
  end;
  for i := 1 to NumSwitch do //Switch
  begin
    if(ListaSwitchs[i].CordX < xaux)then
    begin
      xaux := ListaSwitchs[i].CordX;
    end;
    if(ListaSwitchs[i].CordX < xaux)then
    begin
      xaux := ListaSwitchs[i].CordY;
    end;
  end;
  minimo.X := xaux;
  minimo.Y := yaux;
  //
  //Centro del Sistema
  //
  CoordenadasCentro.X := Round((maximo.X-minimo.X)/2) ;
  CoordenadasCentro.Y := Round((maximo.Y-minimo.Y)/2) ;
  //alerta
  ShowMessage('Las coordenadas maximas son: ('
  +IntToStr(maximo.X)+','+IntToStr(maximo.Y)
  + ') Las coordenadas minimas son: ('
  +IntToStr(minimo.X)+','+IntToStr(minimo.Y)
  +') El centro es: ('
  +IntToStr(CoordenadasCentro.X)+','+IntToStr(CoordenadasCentro.Y)+')'
  );
  //
  //Resta del centro a todos los datos
  for i := 1 to NumCable do //Cables
  begin
    ListaCables[i][1].X := ListaCables[i][1].X - CoordenadasCentro.X;  
    ListaCables[i][1].Y := ListaCables[i][1].Y - CoordenadasCentro.Y; 
    ListaCables[i][2].X := ListaCables[i][2].X - CoordenadasCentro.X; 
    ListaCables[i][2].Y := ListaCables[i][2].Y - CoordenadasCentro.Y; 
  end; 
  
  for i := 1 to NumFibra do //Fibras
  begin
    ListaFibras[i][1].X := ListaFibras[i][1].X - CoordenadasCentro.X ;
    ListaFibras[i][1].Y := ListaFibras[i][1].Y - CoordenadasCentro.Y ;
    ListaFibras[i][2].X := ListaFibras[i][2].X - CoordenadasCentro.X ;
    ListaFibras[i][2].Y := ListaFibras[i][2].Y - CoordenadasCentro.Y ; 
  end; 
  
  for i := 1 to NumFirewall do //Firewalls
  begin
    ListaFirewalls[i].CordX := ListaFirewalls[i].CordX - CoordenadasCentro.X ; 
    ListaFirewalls[i].CordY := ListaFirewalls[i].CordY - CoordenadasCentro.X ; 
  end;
  
  for i := 1 to NumImpre do //Impre
  begin
    ListaImpre[i].CordX := ListaImpre[i].CordX - CoordenadasCentro.X ; 
    ListaImpre[i].CordY := ListaImpre[i].CordY - CoordenadasCentro.X ; 
  end; 

  for i := 1 to NumPc do //Computadora
  begin
    ListaPcs[i].CordX := ListaPcs[i].CordX - CoordenadasCentro.X ; 
    ListaPcs[i].CordY := ListaPcs[i].CordY - CoordenadasCentro.X ; 
  end; 

  for i := 1 to NumServer do //Servers
  begin
    ListaServers[i].CordX := ListaServers[i].CordX - CoordenadasCentro.X ; 
    ListaServers[i].CordY := ListaServers[i].CordY - CoordenadasCentro.X ; 
  end; 

  for i := 1 to NumSwitch do //Switch
  begin
    ListaSwitchs[i].CordX := ListaSwitchs[i].CordX - CoordenadasCentro.X ; 
    ListaSwitchs[i].CordY := ListaSwitchs[i].CordY - CoordenadasCentro.X ; 
  end;
  //
  //Creacion de Objetos
  //
  for i := 1 to NumPc do
  begin
    ObjetoPC[i][1].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][1].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][1].Z := -40;
    ObjetoPC[i][2].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][2].Y := -40+ ListaPcs[i].CordY; ObjetoPC[i][2].Z := -40;
    ObjetoPC[i][3].X := -40+ ListaPcs[i].CordX; ObjetoPC[i][3].Y := -40+ ListaPcs[i].CordY; ObjetoPC[i][3].Z := -40;
    ObjetoPC[i][4].X := -40+ ListaPcs[i].CordX; ObjetoPC[i][4].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][4].Z := -40;
    ObjetoPC[i][5].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][5].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][5].Z := -40;
    ObjetoPC[i][6].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][6].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][6].Z := 40;
    ObjetoPC[i][7].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][7].Y := -40+ ListaPcs[i].CordY; ObjetoPC[i][7].Z := 40;
    ObjetoPC[i][8].X := -40+ ListaPcs[i].CordX; ObjetoPC[i][8].Y := -40+ ListaPcs[i].CordY; ObjetoPC[i][8].Z := 40;
    ObjetoPC[i][9].X := -40+ ListaPcs[i].CordX; ObjetoPC[i][9].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][9].Z := 40;
    ObjetoPC[i][10].X := +40+ ListaPcs[i].CordX; ObjetoPC[i][10].Y := +40+ ListaPcs[i].CordY; ObjetoPC[i][10].Z := 40;
  end;

  for i := 1 to NumImpre do
  begin
    ObjetoImpre[i][1].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][1].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][1].Z := -40;
    ObjetoImpre[i][2].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][2].Y := -40+ ListaImpre[i].CordY; ObjetoImpre[i][2].Z := -40;
    ObjetoImpre[i][3].X := -40+ ListaImpre[i].CordX; ObjetoImpre[i][3].Y := -40+ ListaImpre[i].CordY; ObjetoImpre[i][3].Z := -40;
    ObjetoImpre[i][4].X := -40+ ListaImpre[i].CordX; ObjetoImpre[i][4].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][4].Z := -40;
    ObjetoImpre[i][5].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][5].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][5].Z := -40;

    ObjetoImpre[i][6].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][6].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][6].Z := 40;
    ObjetoImpre[i][7].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][7].Y := -40+ ListaImpre[i].CordY; ObjetoImpre[i][7].Z := 40;
    ObjetoImpre[i][8].X := -40+ ListaImpre[i].CordX; ObjetoImpre[i][8].Y := -40+ ListaImpre[i].CordY; ObjetoImpre[i][8].Z := 40;
    ObjetoImpre[i][9].X := -40+ ListaImpre[i].CordX; ObjetoImpre[i][9].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][9].Z := 40;
    ObjetoImpre[i][10].X := +40+ ListaImpre[i].CordX; ObjetoImpre[i][10].Y := +40+ ListaImpre[i].CordY; ObjetoImpre[i][10].Z := 40;
  end;
  
  for i := 1 to NumFirewall do
  begin
    ObjetoFirewall[i][1].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][1].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][1].Z := -40;
    ObjetoFirewall[i][2].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][2].Y := -40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][2].Z := -40;
    ObjetoFirewall[i][3].X := -40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][3].Y := -40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][3].Z := -40;
    ObjetoFirewall[i][4].X := -40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][4].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][4].Z := -40;
    ObjetoFirewall[i][5].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][5].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][5].Z := -40;

    ObjetoFirewall[i][6].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][6].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][6].Z := 40;
    ObjetoFirewall[i][7].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][7].Y := -40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][7].Z := 40;
    ObjetoFirewall[i][8].X := -40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][8].Y := -40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][8].Z := 40;
    ObjetoFirewall[i][9].X := -40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][9].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][9].Z := 40;
    ObjetoFirewall[i][10].X := +40+ ListaFirewalls[i].CordX; ObjetoFirewall[i][10].Y := +40+ ListaFirewalls[i].CordY; ObjetoFirewall[i][10].Z := 40;
  end;
  
  for i := 1 to NumServer do
  begin
    ObjetoServer[i][1].X := +40+ ListaServers[i].CordX; ObjetoServer[i][1].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][1].Z := -40;
    ObjetoServer[i][2].X := +40+ ListaServers[i].CordX; ObjetoServer[i][2].Y := -40+ ListaServers[i].CordY; ObjetoServer[i][2].Z := -40;
    ObjetoServer[i][3].X := -40+ ListaServers[i].CordX; ObjetoServer[i][3].Y := -40+ ListaServers[i].CordY; ObjetoServer[i][3].Z := -40;
    ObjetoServer[i][4].X := -40+ ListaServers[i].CordX; ObjetoServer[i][4].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][4].Z := -40;
    ObjetoServer[i][5].X := +40+ ListaServers[i].CordX; ObjetoServer[i][5].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][5].Z := -40;

    ObjetoServer[i][6].X := +40+ ListaServers[i].CordX; ObjetoServer[i][6].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][6].Z := 40;
    ObjetoServer[i][7].X := +40+ ListaServers[i].CordX; ObjetoServer[i][7].Y := -40+ ListaServers[i].CordY; ObjetoServer[i][7].Z := 40;
    ObjetoServer[i][8].X := -40+ ListaServers[i].CordX; ObjetoServer[i][8].Y := -40+ ListaServers[i].CordY; ObjetoServer[i][8].Z := 40;
    ObjetoServer[i][9].X := -40+ ListaServers[i].CordX; ObjetoServer[i][9].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][9].Z := 40;
    ObjetoServer[i][10].X := +40+ ListaServers[i].CordX; ObjetoServer[i][10].Y := +40+ ListaServers[i].CordY; ObjetoServer[i][10].Z := 40;
  end;
  
  for i := 1 to NumSwitch do
  begin
    ObjetoSwitchs[i][1].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][1].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][1].Z := -40;
    ObjetoSwitchs[i][2].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][2].Y := -40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][2].Z := -40;
    ObjetoSwitchs[i][3].X := -40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][3].Y := -40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][3].Z := -40;
    ObjetoSwitchs[i][4].X := -40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][4].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][4].Z := -40;
    ObjetoSwitchs[i][5].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][5].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][5].Z := -40;

    ObjetoSwitchs[i][6].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][6].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][6].Z := 40;
    ObjetoSwitchs[i][7].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][7].Y := -40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][7].Z := 40;
    ObjetoSwitchs[i][8].X := -40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][8].Y := -40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][8].Z := 40;
    ObjetoSwitchs[i][9].X := -40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][9].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][9].Z := 40;
    ObjetoSwitchs[i][10].X := +40+ ListaSwitchs[i].CordX; ObjetoSwitchs[i][10].Y := +40+ ListaSwitchs[i].CordY; ObjetoSwitchs[i][10].Z := 40;
  end;

  for i := 1 to NumCable do
  begin
    ObjetoCable[i][1].X := +40+ ListaCables[i][1].X; ObjetoCable[i][1].Y := +5+ ListaCables[i][1].Y; ObjetoCable[i][1].Z := -5;
    ObjetoCable[i][2].X := +40+ ListaCables[i][1].X; ObjetoCable[i][2].Y := -5+ ListaCables[i][1].Y; ObjetoCable[i][2].Z := -5;
    ObjetoCable[i][3].X := -40+ ListaCables[i][2].X; ObjetoCable[i][3].Y := -5+ ListaCables[i][2].Y; ObjetoCable[i][3].Z := -5;
    ObjetoCable[i][4].X := -40+ ListaCables[i][2].X; ObjetoCable[i][4].Y := +5+ ListaCables[i][2].Y; ObjetoCable[i][4].Z := -5;
    ObjetoCable[i][5].X := +40+ ListaCables[i][1].X; ObjetoCable[i][5].Y := +5+ ListaCables[i][1].Y; ObjetoCable[i][5].Z := -5;

    ObjetoCable[i][6].X := +40+ ListaCables[i][1].X; ObjetoCable[i][6].Y := +5+ ListaCables[i][1].Y; ObjetoCable[i][6].Z := 5;
    ObjetoCable[i][7].X := +40+ ListaCables[i][1].X; ObjetoCable[i][7].Y := -5+ ListaCables[i][1].Y; ObjetoCable[i][7].Z := 5;
    ObjetoCable[i][8].X := -40+ ListaCables[i][2].X; ObjetoCable[i][8].Y := -5+ ListaCables[i][2].Y; ObjetoCable[i][8].Z := 5;
    ObjetoCable[i][9].X := -40+ ListaCables[i][2].X; ObjetoCable[i][9].Y := +5+ ListaCables[i][2].Y; ObjetoCable[i][9].Z := 5;
    ObjetoCable[i][10].X := +40+ ListaCables[i][1].X; ObjetoCable[i][10].Y := +5+ ListaCables[i][1].Y; ObjetoCable[i][10].Z := 5;
  end;

  for i := 1 to NumFibra do
  begin
    ObjetoFibra[i][1].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][1].Y := +10+ ListaFibras[i][1].Y; ObjetoFibra[i][1].Z := -10;
    ObjetoFibra[i][2].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][2].Y := -10+ ListaFibras[i][1].Y; ObjetoFibra[i][2].Z := -10;
    ObjetoFibra[i][3].X := -40+ ListaFibras[i][2].X; ObjetoFibra[i][3].Y := -10+ ListaFibras[i][2].Y; ObjetoFibra[i][3].Z := -10;
    ObjetoFibra[i][4].X := -40+ ListaFibras[i][2].X; ObjetoFibra[i][4].Y := +10+ ListaFibras[i][2].Y; ObjetoFibra[i][4].Z := -10;
    ObjetoFibra[i][5].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][5].Y := +10+ ListaFibras[i][1].Y; ObjetoFibra[i][5].Z := -10;

    ObjetoFibra[i][6].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][6].Y := +10+ ListaFibras[i][1].Y; ObjetoFibra[i][6].Z := 10;
    ObjetoFibra[i][7].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][7].Y := -10+ ListaFibras[i][1].Y; ObjetoFibra[i][7].Z := 10;
    ObjetoFibra[i][8].X := -40+ ListaFibras[i][2].X; ObjetoFibra[i][8].Y := -10+ ListaFibras[i][2].Y; ObjetoFibra[i][8].Z := 10;
    ObjetoFibra[i][9].X := -40+ ListaFibras[i][2].X; ObjetoFibra[i][9].Y := +10+ ListaFibras[i][2].Y; ObjetoFibra[i][9].Z := 10;
    ObjetoFibra[i][10].X := +40+ ListaFibras[i][1].X; ObjetoFibra[i][10].Y := +10+ ListaFibras[i][1].Y; ObjetoFibra[i][10].Z := 10;
  end;
end;
//Informacion
procedure TForm1.Informacion1Click(Sender: TObject);
begin
  ShowMessage('hay Fibras:'+IntToStr(NumFibra)
  + ' Cables:'+IntToStr(NumCable)
  + ' Firewall:'+IntToStr(NumFirewall)
  + ' Server:'+IntToStr(NumServer)
  + ' Switch:'+IntToStr(NumSwitch)
  + ' Pc:'+IntToStr(NumPc)
  + ' Impre:'+IntToStr(NumImpre));
end;

procedure TForm1.Button1Click(Sender: TObject);
var i :integer;
begin
  Form1.Limpiar1Click(Sender);
  for i := 1 to NumPc do
  begin
    Image1.Canvas.Pen.Color := clBlue;//Computadora
    Cubo[1] := ObjetoPC[i];
    Form1.Pintar1Click(Sender);
  end;

  for i := 1 to NumImpre do
  begin
    Image1.Canvas.Pen.Color := clGray;//Impresora
    Cubo[1] := ObjetoImpre[i];
    Form1.Pintar1Click(Sender);
  end;

  for i := 1 to NumSwitch do
  begin
    Image1.Canvas.Pen.Color := clLime;//Switch
    Cubo[1] := ObjetoSwitchs[i];
    Form1.Pintar1Click(Sender);
  end;

  for i := 1 to NumServer do
  begin
    Image1.Canvas.Pen.Color := clMaroon;//Server
    Cubo[1] := ObjetoServer[i];
    Form1.Pintar1Click(Sender);
  end;

  for i := 1 to NumFirewall do
  begin
    Image1.Canvas.Pen.Color := clRed;//Firewall
    Cubo[1] := ObjetoFirewall[i];
    Form1.Pintar1Click(Sender);
  end;
  {
  for i := 1 to NumCable do
  begin
    Image1.Canvas.Pen.Color := clBlack;//Cables

    Cubo[1] := ObjetoCable[i];
    Form1.Pintar1Click(Sender);
  end;

  for i := 1 to NumFibra do
  begin
    Image1.Canvas.Pen.Color := clOlive;//Fibras
    Cubo[1] := ObjetoFibra[i];
    Form1.Pintar1Click(Sender);
  end;
  }
end;

end.
