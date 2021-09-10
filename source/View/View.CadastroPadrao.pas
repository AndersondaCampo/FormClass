unit View.CadastroPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Model.Attributes,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TFrmCadastroPadrao = class(TForm)
    Panel2: TPanel;
    lbTitle: TLabel;
    Panel3: TPanel;
    btnCancelar: TButton;
    btnConfirmar: TButton;
    query: TFDQuery;
    DataSource: TDataSource;
    btnCadastrar: TButton;
    PageControl1: TPageControl;
    tsGrid: TTabSheet;
    tsCadastro: TTabSheet;
    pnContainer: TPanel;
    DBGrid1: TDBGrid;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure queryReconcileError(DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure btnCadastrarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FColumns: Integer;
    FTable  : String;
    FFields : String;
    FOnDestroy: TProc<TObject>;
  public
    procedure SetTable(const ATable: String);
    procedure SetField(const AField: String);
    procedure SetTitle(const ATitle: String);
    procedure SetSize(const ASize: TSize);
    function SetProcOnDestroy(AProc: TProc<TObject>): TFrmCadastroPadrao;
    procedure SetCollumns(const ACollumns: Integer = 1);
    procedure Prepare;
  end;

const
  SMALL_H = 350;
  SMALL_W = 500;

  MEDIUM_H = 550;
  MEDIUM_W = 700;

  BIG_H = 700;
  BIG_W = 1000;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

uses
  Model.DB;

{$R *.dfm}

procedure TFrmCadastroPadrao.btnCadastrarClick(Sender: TObject);
begin
  query.Append;

  PageControl1.ActivePage := tsCadastro;
  btnCadastrar.Visible    := False;
  btnExcluir.Visible      := False;
  btnEditar.Visible       := False;
  btnConfirmar.Visible    := True;
  btnCancelar.Visible     := True;
end;

procedure TFrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  query.CancelUpdates;

  PageControl1.ActivePage := tsGrid;
  btnCadastrar.Visible    := True;
  btnEditar.Visible       := True;
  btnExcluir.Visible      := True;
  btnCancelar.Visible     := False;
  btnConfirmar.Visible    := False;
end;

procedure TFrmCadastroPadrao.btnConfirmarClick(Sender: TObject);
begin
  SysDB.Connection.StartTransaction;
  try
    query.Post;
    if query.ApplyUpdates(0) <> 0 then
      Abort;

    SysDB.Connection.Commit;

    PageControl1.ActivePage := tsGrid;
    btnCadastrar.Visible    := True;
    btnExcluir.Visible      := True;
    btnEditar.Visible       := True;
    btnCancelar.Visible     := False;
    btnConfirmar.Visible    := False;
  except
    SysDB.Connection.Rollback;
  end;
end;

procedure TFrmCadastroPadrao.btnEditarClick(Sender: TObject);
begin
  if query.IsEmpty then
    Exit;

  query.Edit;

  PageControl1.ActivePage := tsCadastro;
  btnCadastrar.Visible    := False;
  btnExcluir.Visible      := False;
  btnEditar.Visible       := False;
  btnConfirmar.Visible    := True;
  btnCancelar.Visible     := True;
end;

procedure TFrmCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
  if not query.IsEmpty and (MessageDlg('Excluir realmente excluir o cadastro?', mtConfirmation, [mbNo, mbYes], 0) = mrYes) then
    query.Delete;
end;

procedure TFrmCadastroPadrao.DBGrid1DblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TFrmCadastroPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  query.Connection := SysDB.Connection;
end;

procedure TFrmCadastroPadrao.FormDestroy(Sender: TObject);
begin
  if Assigned(FOnDestroy) then
    FOnDestroy(Self);
end;

procedure TFrmCadastroPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    if query.State in [dsInsert, dsEdit] then
      if MessageDlg('Cadastro com informação pendentes de confirmação!'+ #13+ 'Deseja sair mesmo assim?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
        Abort;

  Self.Close;
end;

procedure TFrmCadastroPadrao.FormShow(Sender: TObject);
begin
  tsGrid.TabVisible       := False;
  tsCadastro.TabVisible      := False;
  PageControl1.ActivePage := tsGrid;
end;

procedure TFrmCadastroPadrao.Prepare;
begin
  query.SQL.Clear;
  query.SQL.Add('SELECT ' + FFields + ' FROM ' + FTable);
  query.Prepare;
end;

procedure TFrmCadastroPadrao.queryReconcileError(DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TFrmCadastroPadrao.SetCollumns(const ACollumns: Integer);
begin
  FColumns := ACollumns;
end;

procedure TFrmCadastroPadrao.SetField(const AField: String);
begin
  FFields := FFields + IfThen(FFields.IsEmpty, '', ', ') + AField;
end;

Function TFrmCadastroPadrao.SetProcOnDestroy(AProc: TProc<TObject>): TFrmCadastroPadrao;
begin
  Result := Self;
  FOnDestroy := AProc;
end;

procedure TFrmCadastroPadrao.SetSize(const ASize: TSize);
begin
  case ASize of
    fsSmall:
      begin
        Self.Height := SMALL_H;
        Self.Width  := SMALL_W;
      end;

    fsMedium:
      begin
        Self.Height := MEDIUM_H;
        Self.Width  := MEDIUM_W;
      end;

    fsBig:
      begin
        Self.Height := BIG_H;
        Self.Width  := BIG_W
      end;
  end;
end;

procedure TFrmCadastroPadrao.SetTable(const ATable: String);
begin
  FTable := ATable;
end;

procedure TFrmCadastroPadrao.SetTitle(const ATitle: String);
begin
  lbTitle.Caption := ATitle;
end;

end.
