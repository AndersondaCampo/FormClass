unit Model.DB;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite;

type
  TSysDB = Class(TObject)
  private
    FConn: TFDConnection;

  public
    property Connection: TFDConnection read FConn;
    constructor Create;
    destructor Destroy; override;
  End;

var
  SysDB: TSysDB;

implementation

uses
  System.SysUtils;

{ TDB }

constructor TSysDB.Create;
begin
  FConn                 := TFDConnection.Create(nil);
  FConn.Params.DriverID := 'SQLite';
  FConn.Params.Database := ExtractFilePath(ParamStr(0)) + 'FormClass.db';
  FConn.LoginPrompt     := False;
  FConn.Online;

  if FConn.ExecSQLScalar('SELECT name FROM sqlite_master WHERE type=''table'' AND name = ''TB_USUARIO''') = '' then
  begin
    FConn.ExecSQL('CREATE TABLE TB_USUARIO( ' +
                  ' ID INTEGER,' +
                  ' NOME VARCHAR(100), ' +
                  ' TELEFONE VARCHAR(30), '+
                  ' CEP VARCHAR(9)) ');

    FConn.ExecSQL('CREATE TABLE TB_CLIENTE( ' +
                  ' ID INTEGER,' +
                  ' NOME VARCHAR(100), '+
                  ' OBS VARCHAR(100)) ');
  end;
end;

destructor TSysDB.Destroy;
begin
  if FConn.Connected then
    FConn.Offline;

  FConn.DisposeOf;

  inherited;
end;

initialization

SysDB := TSysDB.Create;

finalization

SysDB.DisposeOf;

end.
