object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 510
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PEFlowGridLayout1: TPEFlowGridLayout
    Left = 0
    Top = 0
    Width = 801
    Height = 469
    MaxColumns = 2
    AlignSpace = 10
    ItemWidth = 120
    ItemHeight = 50
    ListItemHeight = 50
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 469
    Width = 801
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 368
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
