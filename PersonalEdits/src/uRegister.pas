unit uRegister;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  PEdit,
  PDBEdit,
  PEFlowGridLayout;

procedure Register;
begin
  RegisterComponents('PersonalEdits', [TPEdit, TPDBEdit, TPEFlowGridLayout]);
end;

end.
