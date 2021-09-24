program PersonalEditsSample;

uses
  Vcl.Forms,
  uPrincipal in 'src\uPrincipal.pas' {Form1},
  PDBEdit in '..\src\TEdit\PDBEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
