object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 618
  ClientWidth = 1187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1187
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object btnClientes: TButton
      Left = 0
      Top = 0
      Width = 121
      Height = 57
      Align = alLeft
      Caption = 'Clientes'
      TabOrder = 0
      OnClick = btnClientesClick
    end
    object btnUsuarios: TButton
      Left = 121
      Top = 0
      Width = 121
      Height = 57
      Align = alLeft
      Caption = 'Usu'#225'rios'
      TabOrder = 1
      OnClick = btnUsuariosClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 599
    Width = 1187
    Height = 19
    Panels = <>
  end
end
