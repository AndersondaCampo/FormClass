unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  View.CadastroPadrao;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  FrmCadastroPadrao := TFrmCadastroPadrao.Create(Application);
end;

end.
