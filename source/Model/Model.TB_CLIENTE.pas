unit Model.TB_CLIENTE;

interface

uses
  Model.Attributes;

type
  [Table('TB_CLIENTE', 'Cadastro de Clientes', fsBig)]
  TCliente = Class
  private
    FId: Integer;
    FNome: String;
    FObs: String;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetObs(const Value: String);
  public
    [Model.Attributes.Field(ctEdit, True, True, 'ID', 'Código', '', fsSmall)]
    property Id: Integer read FId write SetId;

    [Model.Attributes.Field(ctEdit, True, True, 'NOME', 'Nome', '', fsMedium)]
    property Nome: String read FNome write SetNome;

    [Model.Attributes.Field(ctEdit, True, True, 'OBS', 'Observação', '', fsBig)]
    property Obs: String read FObs write SetObs;
  End;

implementation

{ TCliente }

procedure TCliente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetObs(const Value: String);
begin
  FObs := Value;
end;

end.
