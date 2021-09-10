object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 300
  ClientWidth = 709
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
    Width = 709
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 8404992
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 863
    object lbTitle: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 703
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
    Top = 246
    Width = 709
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 505
    ExplicitWidth = 863
    DesignSize = (
      709
      54)
    object btnCancelar: TButton
      Left = 534
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&ancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
      ExplicitLeft = 776
    end
    object btnConfirmar: TButton
      Left = 615
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
      ExplicitLeft = 857
    end
    object btnCadastrar: TButton
      Left = 615
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object btnEditar: TButton
      Left = 534
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Editar'
      TabOrder = 3
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 453
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
    Width = 709
    Height = 197
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
        Width = 695
        Height = 163
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
      object pnContainer: TPanel
        Left = 0
        Top = 0
        Width = 701
        Height = 169
        Align = alClient
        BevelOuter = bvNone
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
