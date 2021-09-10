unit Model.TB_USUARIO;

interface

uses
  Data.DB,
  Model.Attributes;

type
  [Table('TB_USUARIO', 'Cadastro de Usuario', fsSmall)]
  TUsuario = Class
  private
    FID: Integer;
    FNome: String;
    FTelefone: String;
    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
  public
//    [Field(ftInteger, 'ID', 'Código', '', fsSmall, 0)]
//    property ID: Integer read FID write SetID;
//
//    [Field(ftString, 'NOME', 'Nome', '', fsSmall, 0)]
//    property Nome: String read FNome write SetNome;
//
//    [Field(ftString, 'TELEFONE', 'Telefone', '', fsSmall, 0)]
//    Property Telefone: String read FTelefone write SetTelefone;
  End;

implementation

{ TUsuario }

procedure TUsuario.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuario.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
