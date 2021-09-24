unit PEFlowGridLayout;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls;

type
  TPEFlowGridLayout = class(TCustomPanel)
  private
    FListItemHeight: Integer;
    FItemHeight    : Integer;
    FAlignSpace    : Integer;
    FMaxColumns    : Integer;
    FOneCol2List   : Boolean;
    FItemWidth     : Integer;
    procedure SetAlignSpace(const Value: Integer);
    procedure SetItemHeight(const Value: Integer);
    procedure SetItemWidth(const Value: Integer);
    procedure SetListItemHeight(const Value: Integer);
    procedure SetMaxColumns(const Value: Integer);
    procedure SetOneCol2List(const Value: Boolean);
    { Private declarations }
  protected
    procedure Resize; override;

  public
    constructor Create(aOwner: TComponent); override;
    function GetColumnCount: Integer;
    procedure AlignItems;

  published
    property MaxColumns    : Integer read FMaxColumns write SetMaxColumns default 5;
    property AlignSpace    : Integer read FAlignSpace write SetAlignSpace default 20;
    property OneCol2List   : Boolean read FOneCol2List write SetOneCol2List default true;
    property ItemWidth     : Integer read FItemWidth write SetItemWidth default 250;
    property ItemHeight    : Integer read FItemHeight write SetItemHeight default 80;
    property ListItemHeight: Integer read FListItemHeight write SetListItemHeight default 60;

    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BorderWidth;
    property BorderStyle;
    property Color;
    property Constraints;
    property DoubleBuffered;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property Padding;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnCanResize;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

implementation

{ TPEFlowGridLayout }

procedure TPEFlowGridLayout.AlignItems;
begin
  Resize;
end;

constructor TPEFlowGridLayout.Create(aOwner: TComponent);
begin
  inherited;

  BevelOuter  := bvNone;
  Color       := $E6E6E6;
  ShowCaption := false;

  FMaxColumns     := 5;
  FAlignSpace     := 20;
  FOneCol2List    := true;
  FItemWidth      := 250;
  FItemHeight     := 80;
  FListItemHeight := 60;
end;

function TPEFlowGridLayout.GetColumnCount: Integer;
var
  NeededWidth: Integer;
begin
  Result := MaxColumns + 1;

  repeat
    Result      := Result - 1;
    NeededWidth := Result * ItemWidth + (Result + 1) * AlignSpace;
  until Width > NeededWidth;

  if Result = 0 then
    Result := 1;
end;

procedure TPEFlowGridLayout.Resize;
var
  ColCount                      : Integer;
  FrameWidth                    : Integer;
  LeftSide                      : Integer;
  i, Col, Row, ItemLeft, ItemTop: Integer;
  Item                          : TControl;
begin
  inherited;

  ColCount   := GetColumnCount;
  FrameWidth := ColCount * ItemWidth + (ColCount + 1) * AlignSpace;
  LeftSide   := (Width - FrameWidth) div 2;

  for i := 0 to ControlCount - 1 do
  begin
    Item := Controls[i];

    Col := i mod ColCount;
    Row := i div ColCount;
    if (ColCount = 1) and (OneCol2List) then
    begin
      ItemLeft    := 0;
      ItemTop     := Row * ListItemHeight;
      Item.Width  := Width;
      Item.Height := ListItemHeight;
    end
    else
    begin
      ItemLeft    := LeftSide + Col * ItemWidth + (Col + 1) * AlignSpace;
      ItemTop     := 0 + Row * ItemHeight + (Row + 1) * AlignSpace;

      if Item.Width > ItemWidth then
        Item.Width := ItemWidth;

      Item.Height := ItemHeight;
    end;

    Item.Top  := ItemTop;
    Item.Left := ItemLeft;
  end;
end;

procedure TPEFlowGridLayout.SetAlignSpace(const Value: Integer);
begin
  FAlignSpace := Value;
  Resize;
end;

procedure TPEFlowGridLayout.SetItemHeight(const Value: Integer);
begin
  FItemHeight := Value;
  Resize;
end;

procedure TPEFlowGridLayout.SetItemWidth(const Value: Integer);
begin
  FItemWidth := Value;
  Resize;
end;

procedure TPEFlowGridLayout.SetListItemHeight(const Value: Integer);
begin
  FListItemHeight := Value;
end;

procedure TPEFlowGridLayout.SetMaxColumns(const Value: Integer);
begin
  FMaxColumns := Value;
  Resize;
end;

procedure TPEFlowGridLayout.SetOneCol2List(const Value: Boolean);
begin
  FOneCol2List := Value;
  Resize;
end;

end.
