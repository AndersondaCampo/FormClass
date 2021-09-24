unit PEdit;

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
  ComCtrls;

type
  TPEdit = class(TCustompanel)
  private
    FEditTexto    : TEdit;
    FLabel        : TLabel;
    FRequired     : Boolean;
    FLabelCaption : String;
    FRequiredColor: TColor;
    procedure SetLabelCaption(const Value: String);
    procedure SetRequired(const Value: Boolean);
    procedure DoExit(ASender: Tobject);
    procedure DoEnter(ASender: Tobject);
    procedure SetRequiredColor(const Value: TColor);
    procedure SetValue(const Value: String);
    function GetValue: String;

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

constructor TPEdit.Create(AOwner: TComponent);
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

  FEditTexto := TEdit.Create(Self);
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

destructor TPEdit.Destroy;
begin

  inherited;
end;

procedure TPEdit.CheckRequired;
begin
  if FRequired and String.IsNullOrWhiteSpace(FEditTexto.Text) then
    FLabel.Font.Color := FRequiredColor
  else
    FLabel.Font.Color := Self.Font.Color;
end;

procedure TPEdit.DoEnter(ASender: Tobject);
begin
  CheckRequired;
end;

procedure TPEdit.DoExit(ASender: Tobject);
begin
  CheckRequired;
end;

function TPEdit.GetValue: String;
begin
  Result := FEditTexto.Text;
end;

procedure TPEdit.SetLabelCaption(const Value: String);
begin
  FLabelCaption  := Value;
  FLabel.Caption := FLabelCaption;
end;

procedure TPEdit.SetRequired(const Value: Boolean);
begin
  FRequired := Value;
end;

procedure TPEdit.SetRequiredColor(const Value: TColor);
begin
  FRequiredColor := Value;
  CheckRequired;
end;

procedure TPEdit.SetValue(const Value: String);
begin
  FEditTexto.Text := Value;
  DoExit(Self);
end;

end.
