unit UExtInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP;

type
  TfrmGetExtInfo = class(TForm)
    Label3: TLabel;
    Department: TqFSpravControl;
    PostSalary: TqFSpravControl;
    Label4: TLabel;
    qFSC_SovmestFIO: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UpBonusOrderForm, uShtatUtils;

{$R *.dfm}

procedure TfrmGetExtInfo.OkButtonClick(Sender: TObject);
begin
     if not qFCheckAll(Self)
     then exit;
     ModalResult := mrOk;
end;

procedure TfrmGetExtInfo.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('SpDepartment');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(TfmBonusOrder(Owner).workDatabase.Handle);
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_DEPARTMENT'];
                      DisplayText := sp.Output['NAME_FULL'];
            end;
     end;
end;

procedure TfrmGetExtInfo.PostSalaryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var   DM :TdmShtatUtils;
begin
      DM := TdmShtatUtils.Create(self, Integer(TfmBonusOrder(Owner).workDatabase.Handle),  Date);
      DM.GetSalary(Value,DisplayText);
end;

end.
