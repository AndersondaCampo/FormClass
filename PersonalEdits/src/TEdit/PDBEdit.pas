unit PDBEdit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  Math,
  StdCtrls,
  Buttons,
  ComCtrls,
  Data.DB,
  Vcl.Mask,
  Vcl.DBCtrls;

type
  TPDBEdit = class(TCustompanel)
  private
    FEditTexto    : TDBEdit;
    FLabel        : TLabel;
    FRequired     : Boolean;
    FLabelCaption : String;
    FRequiredColor: TColor;
    FDataSource   : TDataSource;
    FDataField        : String;
    procedure SetLabelCaption(const Value: String);
    procedure SetRequired(const Value: Boolean);
    procedure DoExit(ASender: Tobject);
    procedure DoEnter(ASender: Tobject);
    procedure SetRequiredColor(const Value: TColor);
    procedure SetValue(const Value: String);
    function GetValue: String;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetDataField(const Value: String);

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CheckRequired;

  published
    property LabelCaption : String read FLabelCaption write SetLabelCaption;
    property Required     : Boolean read FRequired write SetRequired default False;
    property RequiredColor: TColor read FRequiredColor write SetRequiredColor;
    property Value        : String read GetValue write SetValue;
    property Field        : String read FDataField write SetDataField;
    property DataSource   : TDataSource read FDataSource write SetDataSource;

    property Color;
    property Parentcolor;
    property parentbackground;
    property BorderStyle;
    property BevelOuter;
    property Height;
    property AutoSize;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnEnter;
    property OnExit;
  end;

implementation

constructor TPDBEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Parent := TWinControl(AOwner);

  with Self do
  begin
    Caption     := EmptyStr;
    Text        := EmptyStr;
    BorderStyle := bsNone;
    BevelOuter  := bvNone;
    ShowCaption := False;
  end;

  FLabel := TLabel.Create(Self);
  with FLabel do
  begin
    AutoSize := False;
    Parent   := Self;
    Top      := 0;
    Left     := 3;
    Width    := Self.Width - 3;
    Anchors  := [akTop, akLeft, akRight];
  end;

  FEditTexto := TDBEdit.Create(Self);
  with FEditTexto do
  begin
    Top         := (FLabel.Height + 2);
    Left        := 3;
    Width       := Self.Width - 3;
    Anchors     := [akTop, akLeft, akRight];
    Parent      := Self;
    OnKeyPress  := OnKeyPress;
    TabOrder    := 1;
    Color       := clWhite;
    TabStop     := True;
    Parentcolor := False;
  end;

  Self.OnEnter := DoEnter;
  Self.OnExit  := DoExit;
end;

destructor TPDBEdit.Destroy;
begin

  inherited;
end;

procedure TPDBEdit.CheckRequired;
begin
  if FRequired and String.IsNullOrWhiteSpace(FEditTexto.Text) then
    FLabel.Font.Color := FRequiredColor
  else
    FLabel.Font.Color := Self.Font.Color;
end;

procedure TPDBEdit.DoEnter(ASender: Tobject);
begin
  CheckRequired;
end;

procedure TPDBEdit.DoExit(ASender: Tobject);
begin
  CheckRequired;
end;

function TPDBEdit.GetValue: String;
begin
  Result := FEditTexto.Text;
end;

procedure TPDBEdit.SetDataSource(const Value: TDataSource);
begin
  FDataSource           := Value;
  FEditTexto.DataSource := FDataSource;
end;

procedure TPDBEdit.SetDataField(const Value: String);
begin
  FDataField               := Value;
  FEditTexto.DataField := FDataField;
end;

procedure TPDBEdit.SetLabelCaption(const Value: String);
begin
  FLabelCaption  := Value;
  FLabel.Caption := FLabelCaption;
end;

procedure TPDBEdit.SetRequired(const Value: Boolean);
begin
  FRequired := Value;
end;

procedure TPDBEdit.SetRequiredColor(const Value: TColor);
begin
  FRequiredColor := Value;
  CheckRequired;
end;

procedure TPDBEdit.SetValue(const Value: String);
begin
  FEditTexto.Text := Value;
  DoExit(Self);
end;

end.
