unit Model.Attributes;

interface

uses
  Data.DB;

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

  Field = Class(TCustomAttribute)
  private
    FFieldType   : TFieldType;
    FMask        : String;
    FFieldName   : String;
    FCaption     : String;
    FSize        : TSize;
    FDefaultValue: Variant;
    procedure SetCaption(const Value: String);
    procedure SetFieldName(const Value: String);
    procedure SetFieldType(const Value: TFieldType);
    procedure SetMask(const Value: String);
    procedure SetSize(const Value: TSize);
    procedure SetDefaultValue(const Value: Variant);
  public
    property FieldType   : TFieldType write SetFieldType;
    property FieldName   : String read FFieldName write SetFieldName;
    property Caption     : String read FCaption write SetCaption;
    property Mask        : String read FMask write SetMask;
    property Size        : TSize read FSize write SetSize;
    property DefaultValue: Variant read FDefaultValue write SetDefaultValue;

    constructor Create(FieldType: TFieldType; FieldName, Caption, Mask: String; Size: TSize; Default: Variant);
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

constructor Field.Create(FieldType: TFieldType; FieldName, Caption, Mask: String; Size: TSize; Default: Variant);
begin
  FFieldType    := FieldType;
  FFieldName    := FieldName;
  FCaption      := Caption;
  FMask         := Mask;
  FSize         := Size;
  FDefaultValue := Default;
end;

procedure Field.SetCaption(const Value: String);
begin
  FCaption := Value;
end;

procedure Field.SetDefaultValue(const Value: Variant);
begin
  FDefaultValue := Value;
end;

procedure Field.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure Field.SetFieldType(const Value: TFieldType);
begin
  FFieldType := Value;
end;

procedure Field.SetMask(const Value: String);
begin
  FMask := Value;
end;

procedure Field.SetSize(const Value: TSize);
begin
  FSize := Value;
end;

end.
