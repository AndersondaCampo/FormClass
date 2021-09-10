unit Model.Attributes;

interface

const
  SMALL_SIZE  = 30;
  MEDIUM_SIZE = 100;
  BIG_SIZE    = 200;

type
  TSize = (fsSmall, fsMedium, fsBig);

  Table = Class(TCustomAttribute)
  private
    FTableName: String;
    FCaption  : String;
    FFormSize : TSize;
    FCollumns : Integer;
    procedure SetCaption(const Value: String);
    procedure SetName(const Value: String);
    procedure SetFormSize(const Value: TSize);
    procedure SetCollumns(const Value: Integer);

  public
    property TableName: String read FTableName write SetName;
    property Caption  : String read FCaption write SetCaption;
    property FormSize : TSize read FFormSize write SetFormSize;
    property Collumns : Integer read FCollumns write SetCollumns;

    constructor Create(TableName, Caption: String; FormSize: TSize; Columns: Integer = 1);
  End;

  PK = Class(TCustomAttribute);

  TComponentType = (ctEdit, ctMaskedEdit, ctDateEdit, ctCurrencyEdit, ctButtonedEdit);

  Field = Class(TCustomAttribute)
  private
    FFieldType   : TComponentType;
    FMask        : String;
    FFieldName   : String;
    FCaption     : String;
    FSize        : TSize;
    FOnlyNumber  : Boolean;
    FEnable      : Boolean;
    procedure SetCaption(const Value: String);
    procedure SetFieldName(const Value: String);
    procedure SetFieldType(const Value: TComponentType);
    procedure SetMask(const Value: String);
    procedure SetSize(const Value: TSize);
    procedure SetOnlyNumber(const Value: Boolean);
    procedure SetEnable(const Value: Boolean);
  public
    property FieldType   : TComponentType read FFieldType write SetFieldType;
    property OnlyNumber  : Boolean read FOnlyNumber write SetOnlyNumber;
    property Enable      : Boolean read FEnable write SetEnable;
    property FieldName   : String read FFieldName write SetFieldName;
    property Caption     : String read FCaption write SetCaption;
    property Mask        : String read FMask write SetMask;
    property Size        : TSize read FSize write SetSize;

    constructor Create(FieldType: TComponentType; Enable, OnlyNumber: Boolean; FieldName, Caption, Mask: String;
      Size: TSize);
  End;

implementation

{ Table }

constructor Table.Create(TableName, Caption: String; FormSize: TSize; Columns: Integer = 1);
begin
  FTableName := TableName;
  FCaption   := Caption;
  FFormSize  := FormSize;
  FCollumns  := Columns;
end;

procedure Table.SetCaption(const Value: String);
begin
  FCaption := Value;
end;

procedure Table.SetCollumns(const Value: Integer);
begin
  FCollumns := Value;
end;

procedure Table.SetFormSize(const Value: TSize);
begin
  FFormSize := Value;
end;

procedure Table.SetName(const Value: String);
begin
  FTableName := Value;
end;

{ Field }

constructor Field.Create(FieldType: TComponentType; Enable, OnlyNumber: Boolean; FieldName, Caption, Mask: String;
      Size: TSize);
begin
  FFieldType    := FieldType;
  FOnlyNumber   := OnlyNumber;
  FEnable       := Enable;
  FFieldName    := FieldName;
  FCaption      := Caption;
  FMask         := Mask;
  FSize         := Size;
end;

procedure Field.SetCaption(const Value: String);
begin
  FCaption := Value;
end;

procedure Field.SetEnable(const Value: Boolean);
begin
  FEnable := Value;
end;

procedure Field.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure Field.SetFieldType(const Value: TComponentType);
begin
  FFieldType := Value;
end;

procedure Field.SetMask(const Value: String);
begin
  FMask := Value;
end;

procedure Field.SetOnlyNumber(const Value: Boolean);
begin
  FOnlyNumber := Value;
end;

procedure Field.SetSize(const Value: TSize);
begin
  FSize := Value;
end;

end.
