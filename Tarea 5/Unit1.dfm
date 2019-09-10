object Form1: TForm1
  Left = 687
  Top = 137
  Width = 853
  Height = 713
  Caption = 'Form1'
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Titulo: TLabel
    Left = 168
    Top = 8
    Width = 156
    Height = 25
    Caption = 'Editor Redes FCC'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Microsoft YaHei UI'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 25
    Top = 41
    Width = 600
    Height = 600
  end
  object Panel1: TPanel
    Left = 656
    Top = 48
    Width = 177
    Height = 545
    Color = clBtnHighlight
    TabOrder = 0
    object Button3: TButton
      Left = 88
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Rotacion X-'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 96
      Top = 512
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 88
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Rotacion Z-'
      TabOrder = 2
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 88
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Rotacion Y-'
      TabOrder = 3
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 8
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Rotacion Z +'
      TabOrder = 4
      OnClick = Button8Click
    end
    object Button10: TButton
      Left = 8
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Rotacion X+'
      TabOrder = 5
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 8
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Rotacion Y+'
      TabOrder = 6
      OnClick = Button11Click
    end
    object Button13: TButton
      Left = 8
      Top = 296
      Width = 75
      Height = 25
      Caption = 'Alejar'
      TabOrder = 7
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 88
      Top = 296
      Width = 75
      Height = 25
      Caption = 'cercar'
      TabOrder = 8
      OnClick = Button14Click
    end
    object Button1: TButton
      Left = 56
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Pintar'
      TabOrder = 9
      OnClick = Button1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
        OnClick = Abrir1Click
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Pintar1: TMenuItem
        Caption = 'Pintar'
        OnClick = Pintar1Click
      end
      object Limpiar1: TMenuItem
        Caption = 'Limpiar'
        OnClick = Limpiar1Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
      object Autor1: TMenuItem
        Caption = 'Autor'
        OnClick = Autor1Click
      end
      object Informacion1: TMenuItem
        Caption = 'Informacion'
        OnClick = Informacion1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.edp|*.edp|.edp|.edp'
    Left = 40
    Top = 8
  end
end
