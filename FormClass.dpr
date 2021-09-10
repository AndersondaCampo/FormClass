program FormClass;

uses
  Vcl.Forms,
  View.Principal in 'source\View\View.Principal.pas' {Form1},
  View.CadastroPadrao in 'source\View\View.CadastroPadrao.pas' {Form2},
  Model.DB in 'source\Model\Model.DB.pas',
  Model.TB_USUARIO in 'source\Model\Model.TB_USUARIO.pas',
  Model.Attributes in 'source\Model\Model.Attributes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
