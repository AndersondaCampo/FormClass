program FormClass;

uses
  Vcl.Forms,
  View.Principal in 'source\View\View.Principal.pas' {FrmPrincipal},
  View.CadastroPadrao in 'source\View\View.CadastroPadrao.pas' {FrmCadastroPadrao},
  Model.DB in 'source\Model\Model.DB.pas',
  Model.TB_USUARIO in 'source\Model\Model.TB_USUARIO.pas',
  Model.Attributes in 'source\Model\Model.Attributes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
