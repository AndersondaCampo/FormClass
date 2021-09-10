﻿unit View.CadastroPadrao;

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
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm2 = class(TForm)
    pnBody: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Panel3: TPanel;
    btnCancelar: TButton;
    btnConfirmar: TButton;
    query: TFDQuery;
    DataSource: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses
  Model.DB;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Self.ModalResult := mrClose;
  Self.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  query.Connection := SysDB.Connection;
end;

end.