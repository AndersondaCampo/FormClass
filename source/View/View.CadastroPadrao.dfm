object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmCadastroPadrao'
  ClientHeight = 559
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBody: TPanel
    Left = 0
    Top = 49
    Width = 863
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 863
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 8404992
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 793
      Height = 43
      Align = alClient
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 73
      ExplicitHeight = 23
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 802
      Top = 3
      Width = 58
      Height = 43
      Align = alRight
      Caption = 'Sair'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 505
    Width = 863
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    object btnCancelar: TButton
      Left = 687
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
    end
    object btnConfirmar: TButton
      Left = 768
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 1
    end
  end
  object query: TFDQuery
    Left = 384
    Top = 504
  end
  object DataSource: TDataSource
    DataSet = query
    Left = 440
    Top = 505
  end
end
