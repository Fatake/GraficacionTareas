object Form1: TForm1
  Left = 374
  Top = 189
  Width = 730
  Height = 482
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 104
    Top = 72
    Width = 300
    Height = 300
  end
  object lbl2: TLabel
    Left = 24
    Top = 400
    Width = 23
    Height = 13
    Caption = 'Hora'
  end
  object lbl3: TLabel
    Left = 152
    Top = 400
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 81
    Height = 81
  end
  object Image2: TImage
    Left = 416
    Top = 8
    Width = 81
    Height = 81
  end
  object pnl1: TPanel
    Left = 520
    Top = 0
    Width = 193
    Height = 441
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 240
      Width = 39
      Height = 13
      Caption = 'Colores '
    end
    object btn1: TButton
      Left = 16
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Segundero'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 96
      Top = 56
      Width = 81
      Height = 25
      Caption = 'Apagar'
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 96
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Minutero'
      TabOrder = 2
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 16
      Top = 200
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 3
      OnClick = btn4Click
    end
    object btn5: TButton
      Left = 8
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Autor'
      TabOrder = 4
      OnClick = btn5Click
    end
    object btn6: TButton
      Left = 96
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 5
      OnClick = btn6Click
    end
    object btn7: TButton
      Left = 8
      Top = 312
      Width = 75
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 6
      OnClick = btn7Click
    end
    object btn8: TButton
      Left = 8
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Linea'
      TabOrder = 7
      OnClick = btn8Click
    end
    object btn9: TButton
      Left = 88
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Fondo'
      TabOrder = 8
      OnClick = btn9Click
    end
    object btn10: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 9
      OnClick = btn10Click
    end
    object Button1: TButton
      Left = 16
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Horero'
      TabOrder = 10
      OnClick = Button1Click
    end
  end
  object edt1: TEdit
    Left = 16
    Top = 416
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'hs:mm'
  end
  object edt2: TEdit
    Left = 152
    Top = 416
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'd/m/a'
  end
  object dlgColor1: TColorDialog
    Left = 616
    Top = 312
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 544
    Top = 104
  end
end
