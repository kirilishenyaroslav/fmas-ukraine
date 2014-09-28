unit fmAsupReportMedLic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, uFControl, uLabeledFControl,
  uSpravControl;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    CheckBoxWithChild: TcxCheckBox;
    Bevel2: TBevel;
    ActBtn: TcxButton;
    ActAction: TAction;
    LabelDateForm: TcxLabel;
    cxSpinYear: TcxSpinEdit;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActActionExecute(Sender: TObject);
    procedure cxSpinYearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSpinYearKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
    Pyears:integer;
    PAct:boolean;
    PDesignRep: Boolean;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Id_Department:integer read PId_Depratment;
    property Act:boolean read PAct;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
uses dmAsupReportMedLic;
{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=DM.DB.Handle;
    Caption := 'Список осіб, які підлягають періодичному медичному огляду';
    YesBtn.Caption := YesBtn_Caption;
    CancelBtn.Caption := CancelBtn_Caption;
    ActBtn.Caption := 'Акт';
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    ActBtn.Hint :=ActBtn.Caption;
    LabelDepartment.Caption := Label_Department_Caption;
    CheckBoxWithChild.Properties.Caption := CheckBoxWithChild_Caption;
    PId_Depratment:=-255;
    PDesignRep:=false;
    Dm.DSetDep.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
    Dm.DSetDep.Open;
    EditDepartment.Text:= Dm.DSetDep.FieldValues['FIRM_NAME'];
    PId_Depratment:=Dm.DSetDep.FieldValues['CURRENT_DEPARTMENT'];
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    if EditDepartment.Text='' then
    begin
        AsupShowMessage(Error_Caption,E_NotSelectDepartment_Text,mtWarning,[mbOK]);
        Exit;
    end;
    ModalResult := mrYes;
end;

procedure TFormOptions.EditDepartmentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
       ShowMessage('Не обрано жодного підрозділу!')
    else
    if not sp.Output.IsEmpty then
       begin
           EditDepartment.Text := varToStr(sp.Output['NAME_FULL']);
           PId_Depratment:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;

procedure TFormOptions.ActActionExecute(Sender: TObject);
begin
    if EditDepartment.Text='' then
    begin
        AsupShowMessage(Error_Caption,E_NotSelectDepartment_Text,mtWarning,[mbOK]);
        Exit;
    end;
    ModalResult := mrYes;
    PAct:=true;
end;

procedure TFormOptions.cxSpinYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Pyears:=cxSpinYear.Value;
end;

procedure TFormOptions.cxSpinYearKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Pyears:=cxSpinYear.Value;
end;

end.
