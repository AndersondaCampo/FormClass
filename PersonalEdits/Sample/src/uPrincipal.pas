unit uPrincipal;

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
  Vcl.ExtCtrls,
  PEdit,
  Vcl.StdCtrls,
  PEFlowGridLayout,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    PEFlowGridLayout1: TPEFlowGridLayout;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.MaskUtils;

{$R *.dfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  edt: TPEdit;
  Idx: Integer;
begin
  for Idx := 0 to 4 do
  begin
    edt               := TPEdit.Create(PEFlowGridLayout1);
    edt.Parent        := PEFlowGridLayout1;
    edt.Value         := Idx.ToString;
    edt.LabelCaption  := 'Edit n° ' + Idx.ToString;
    edt.Required      := True;
    edt.RequiredColor := clRed;
  end;
  PEFlowGridLayout1.AlignItems;
end;

end.
