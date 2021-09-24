object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 559
  ClientWidth = 962
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 962
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 8404992
    ParentBackground = False
    TabOrder = 0
    object lbTitle: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 956
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 505
    Width = 962
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      962
      54)
    object btnCancelar: TButton
      Left = 787
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&ancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnConfirmar: TButton
      Left = 868
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object btnCadastrar: TButton
      Left = 868
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object btnEditar: TButton
      Left = 787
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Editar'
      TabOrder = 3
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 706
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'E&xcluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 962
    Height = 456
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 2
    TabWidth = 100
    object tsGrid: TTabSheet
      Caption = 'Browse'
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 948
        Height = 422
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Informa'#231#245'es'
      ImageIndex = 1
      object PEFlowGridLayout1: TPEFlowGridLayout
        Left = 0
        Top = 0
        Width = 954
        Height = 428
        AlignSpace = 10
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object query: TFDQuery
    CachedUpdates = True
    OnReconcileError = queryReconcileError
    Left = 352
    Top = 8
  end
  object DataSource: TDataSource
    DataSet = query
    Left = 408
    Top = 9
  end
end
