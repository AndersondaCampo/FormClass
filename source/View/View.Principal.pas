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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  System.Generics.Collections;

type
  TFrmPrincipal = class(TForm)
    btnClientes: TButton;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    btnUsuarios: TButton;
    procedure btnClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUsuariosClick(Sender: TObject);

  private
    Forms: TList<TForm>;
    procedure DoFormDestroy(ASender: TObject);
    procedure DoFormAddNotify(ASender: TObject; const AItem: TForm; Action: TCollectionNotification);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Model.TB_USUARIO,
  Model.TB_CLIENTE,
  View.CadastroPadrao,
  Controller.FormManager;

{$R *.dfm}

procedure TFrmPrincipal.btnClientesClick(Sender: TObject);
begin
  Forms.Add(TFormManager.GetForm<TCliente>);
end;

procedure TFrmPrincipal.btnUsuariosClick(Sender: TObject);
begin
  Forms.Add(TFormManager.GetForm<TUsuario>.SetProcOnDestroy(DoFormDestroy));
end;

procedure TFrmPrincipal.DoFormAddNotify(ASender: TObject; const AItem: TForm; Action: TCollectionNotification);
begin
//  if AItem is TFrmCadastroPadrao then
//    lstForms.AddItem(TFrmCadastroPadrao(AItem).lbTitle.Caption, AItem)
//  else
//    lstForms.AddItem(AItem.Caption, AItem);
end;

procedure TFrmPrincipal.DoFormDestroy(ASender: TObject);
begin
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Forms.DisposeOf;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Forms := TList<TForm>.Create;
  Forms.OnNotify := DoFormAddNotify;
end;

end.
