unit Model.TB_USUARIO;

interface

uses
  Model.Attributes;

type
  [Table('TB_USUARIO', 'Cadastro de Usuario', fsMedium)]
  TUsuario = Class
  private
    FID: Integer;
    FNome: String;
    FTelefone: String;
    FCep: String;
    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetCep(const Value: String);
  public
    [Model.Attributes.Field(ctEdit, True, True, 'ID', 'Código', '', fsSmall)]
    property ID: Integer read FID write SetID;

    [Model.Attributes.Field(ctEdit, True, False, 'NOME', 'Nome', '', fsMedium)]
    property Nome: String read FNome write SetNome;

    [Model.Attributes.Field(ctEdit, True, True, 'TELEFONE', 'Telefone', '(99) 09999-9999;1;_', fsSmall)]
    Property Telefone: String read FTelefone write SetTelefone;

    [Model.Attributes.Field(ctEdit, True, True, 'CEP', 'CEP', '99999-999;1;_', fsSmall)]
    Property Cep: String read FCep write SetCep;
  End;

implementation

{ TUsuario }

procedure TUsuario.SetCep(const Value: String);
begin
  FCep := Value;
end;

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
