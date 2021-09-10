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
  System.SysUtils,
  System.RTTI,
  System.TypInfo,
  Model.Attributes,
  Vcl.Controls;

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
  FCountTop : Integer;

  tb: Table;
  fd: Field;

  edit    : TDBEdit;
  maskEdit: TDBEdit;
  dateEdit: TDBEdit;
  &label  : TLabel;
begin
  FCountTop := 10;

  Result := TFrmCadastroPadrao.Create(Application);

  ctxContext := TRttiContext.Create;
  try
    Info    := System.TypeInfo(T);
    typRtti := ctxContext.GetType(Info);

    for cusAttr in typRtti.GetAttributes do
    begin
      if cusAttr is Table then
      begin
        tb := Table(cusAttr);

        Result.Name := 'frm'+ tb.TableName;
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


          case fd.FieldType of
            ctEdit:
              begin
                &label         := TLabel.Create(Result);
                &label.Name    := 'lb' + fd.FieldName;
                &label.Caption := fd.Caption;
                &label.Top     := FCountTop;
                &label.Left    := 10;
                &label.Parent  := Result.pnContainer;
                Inc(FCountTop, 15);

                edit            := TDBEdit.Create(Result);
                edit.Name       := 'edt' + fd.FieldName;
                edit.DataField  := fd.FieldName;
                edit.DataSource := Result.DataSource;
                edit.Enabled    := fd.Enable;
                edit.Text       := '';
                edit.Parent     := Result.pnContainer;
                edit.Top        := FCountTop;
                edit.Left       := 10;

                case fd.Size of
                  fsSmall:
                    edit.Width := 30 * 6;
                  fsMedium:
                    edit.Width := 60 * 6;
                  fsBig:
                    edit.Width := 120 * 6;
                end;

                Inc(FCountTop, 30);
              end;

            ctMaskedEdit:
              begin
                &label         := TLabel.Create(Result);
                &label.Name    := 'lb' + fd.FieldName;
                &label.Caption := fd.Caption;
                &label.Top     := FCountTop;
                &label.Left    := 10;
                &label.Parent  := Result.pnContainer;
                Inc(FCountTop, 15);

                maskEdit            := TDBEdit.Create(Result);
                maskEdit.Name       := 'edt' + fd.FieldName;
                maskEdit.DataField  := fd.FieldName;
                maskEdit.Enabled    := fd.Enable;
                maskEdit.DataSource := Result.DataSource;
                maskEdit.Top        := FCountTop;
                maskEdit.Left       := 10;
                maskEdit.Text       := '';
                maskEdit.Parent     := Result.pnContainer;
                Inc(FCountTop, 30);

                case fd.Size of
                  fsSmall:
                    maskEdit.Width := 30 * 6;
                  fsMedium:
                    maskEdit.Width := 60 * 6;
                  fsBig:
                    maskEdit.Width := 120 * 6;
                end;
              end;

            ctDateEdit:
              begin
                &label         := TLabel.Create(Result);
                &label.Name    := 'lb' + fd.FieldName;
                &label.Caption := fd.Caption;
                &label.Top     := FCountTop;
                &label.Left    := 10;
                &label.Parent  := Result.pnContainer;
                Inc(FCountTop, 15);

                dateEdit         := TDBEdit.Create(Result);
                dateEdit.Name    := 'edt' + fd.FieldName;
                dateEdit.Enabled := fd.Enable;
                dateEdit.Left    := 10;
                dateEdit.Top     := FCountTop;
                dateEdit.Width   := 30;
                dateEdit.Parent  := Result.pnContainer;
                Inc(FCountTop, 30);

                case fd.Size of
                  fsSmall:
                    dateEdit.Width := 30 * 6;
                  fsMedium:
                    dateEdit.Width := 60 * 6;
                  fsBig:
                    dateEdit.Width := 120 * 6;
                end;
              end;

            ctCurrencyEdit:
              begin

              end;

            ctButtonedEdit:
              begin

              end;
          end;

        end;
      end;

    Result.Top  := Round((Application.MainForm.Height / 2) - (Result.Height / 2));
    Result.Left := Round((Application.MainForm.Width / 2) - (Result.Width / 2));
  finally
    ctxContext.Free;
  end;
end;

end.
