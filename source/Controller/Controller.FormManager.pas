unit Controller.FormManager;

interface

uses
  View.CadastroPadrao;

type
  TFormManager = Class(TObject)
  private

  public
    class function GetForm<T: Class>: TFrmCadastroPadrao; overload;
    procedure GetForm(const FormName: String); overload;
  End;

implementation

uses
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ComCtrls,
  Vcl.Controls,
  System.SysUtils,
  System.RTTI,
  System.TypInfo,
  Model.Attributes,
  PDBEdit,
  Vcl.Graphics;

{ TFormManager }

procedure TFormManager.GetForm(const FormName: String);
begin

end;

class function TFormManager.GetForm<T>: TFrmCadastroPadrao;
var
  ctxContext: TRttiContext;
  typRtti   : TRttiType;
  prpRtti   : TRttiProperty;
  cusAttr   : TCustomAttribute;
  Info      : PTypeInfo;

  tb: Table;
  fd: Field;

  edit  : TPDBEdit;
  &label: TLabel;

  idx: Integer;
begin
  ctxContext := TRttiContext.Create;
  try
    Info    := System.TypeInfo(T);
    typRtti := ctxContext.GetType(Info);

    for cusAttr in typRtti.GetAttributes do
    begin
      if cusAttr is Table then
      begin
        tb := Table(cusAttr);

        for idx := 0 to Screen.FormCount - 1 do
        begin
          if Screen.Forms[idx].Name = 'frm' + tb.TableName then
          begin
            Screen.Forms[idx].BringToFront;

            if Screen.Forms[idx].CanFocus then
              Screen.Forms[idx].SetFocus;

            Exit;
          end;
        end;

        Result                               := TFrmCadastroPadrao.Create(Application);
        Result.PEFlowGridLayout1.OneCol2List := True;
        Result.PEFlowGridLayout1.MaxColumns  := 2;
        Result.PEFlowGridLayout1.AlignSpace  := 8;
        Result.PEFlowGridLayout1.ItemHeight  := 41;
        Result.PEFlowGridLayout1.ItemWidth   := 300;
        Result.Name                          := 'frm' + tb.TableName;
        Result.SetTitle(tb.Caption);
        Result.SetSize(tb.FormSize);
        Result.SetCollumns(tb.Collumns);
        Result.SetTable(tb.TableName);
      end;
    end;

    for prpRtti in typRtti.GetProperties do
      for cusAttr in prpRtti.GetAttributes do
        if (cusAttr is Field) and (not Field(cusAttr).FieldName.IsEmpty) then
          Result.SetField(Field(cusAttr).FieldName);

    Result.Prepare;
    Result.query.Open;

    for prpRtti in typRtti.GetProperties do
      for cusAttr in prpRtti.GetAttributes do
      begin
        if cusAttr is Field then
        begin
          fd := Field(cusAttr);

          Result.query.FieldByName(fd.FieldName).EditMask := fd.Mask;
          Result.query.FieldByName(fd.FieldName).DisplayLabel := fd.Caption;

          edit               := TPDBEdit.Create(Result);
          edit.LabelCaption  := fd.Caption;
          edit.Parent        := Result.PEFlowGridLayout1;
          edit.Name          := 'edt' + fd.FieldName;
          edit.Field         := fd.FieldName;
          edit.DataSource    := Result.DataSource;
          edit.Enabled       := fd.Enable;
          edit.Required      := True;
          edit.RequiredColor := clRed;

          case fd.Size of
            fsSmall:
              edit.Width := 30 * 6;
            fsMedium:
              edit.Width := 60 * 6;
            fsBig:
              edit.Width := 120 * 6;
          end;
        end;
      end;

    Result.Top  := Round((Application.MainForm.Height / 2) - (Result.Height / 2));
    Result.Left := Round((Application.MainForm.Width / 2) - (Result.Width / 2));
    Result.PEFlowGridLayout1.AlignItems;
  finally
    ctxContext.Free;
  end;
end;

end.
