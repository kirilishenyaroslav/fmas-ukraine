unit ManEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, cxButtons,
  IBase,PackageLoad, cxSpinEdit,Zproc,Unit_RecountConsts,ZMessages, Dates,
  cxLabel, cxButtonEdit, ActnList, cxCheckBox, cxRadioGroup, Ztypes, uCommonSp;

type
  TManEditForm = class(TForm)
    GroupBox1: TGroupBox;
    PeriodBegLabel: TLabel;
    PeriodEndLabel: TLabel;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    YearBegEdit: TcxSpinEdit;
    YearEndEdit: TcxSpinEdit;
    EditMan: TcxButtonEdit;
    LabelManData: TcxLabel;
    MonthBegEdit: TcxSpinEdit;
    MonthEndEdit: TcxSpinEdit;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionNo: TAction;
    ManLabel: TcxRadioButton;
    DepLabel: TcxRadioButton;
    EditDep: TcxButtonEdit;
    LabelDepData: TcxLabel;
    procedure OkBtnClick(Sender: TObject);
    procedure EditManExit(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ActionNoExecute(Sender: TObject);
    procedure ManLabelClick(Sender: TObject);
    procedure DepLabelClick(Sender: TObject);
    procedure EditDepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDepExit(Sender: TObject);
  private
    FFIO:      String;
    FTN:       Integer;
    FDbHandle: TISC_DB_HANDLE;
    function CheckData():Boolean;

    procedure SetKodBeg(Kod:integer);
    procedure SetKodEnd(Kod:integer);
    function  GetKodBeg:integer;
    function  GetKodEnd:integer;
  public
    PId_department:Variant;
    FIdMan:    Integer;

    constructor Create (AOwner:TComponent;DbHandle:TISC_DB_HANDLE;IdMan:Integer=-1;FIO:String='';TN:Integer=-1);reintroduce;

    property KodBeg:integer read GetKodBeg write SetKodBeg;
    property KodEnd:integer read GetKodEnd write SetKodEnd;
  end;

var
  ManEditForm: TManEditForm;

implementation
{$R *.dfm}

procedure TManEditForm.SetKodBeg(Kod:integer);
begin
   MonthBegEdit.Value := YearMonthFromKodSetup(Kod,False);
   YearBegEdit.Value := YearMonthFromKodSetup(Kod);
end;

procedure TManEditForm.SetKodEnd(Kod:integer);
begin
   MonthEndEdit.Value := YearMonthFromKodSetup(Kod,False);
   YearEndEdit.Value := YearMonthFromKodSetup(Kod);
end;

function TManEditForm.GetKodBeg:integer;
begin
   result := PeriodToKodSetup(YearBegEdit.Value,MonthBegEdit.Value);
end;

function TManEditForm.GetKodEnd:integer;
begin
   result := PeriodToKodSetup(YearEndEdit.Value,MonthEndEdit.Value);
end;

function TManEditForm.CheckData():Boolean;
begin
    CheckData:=True;

    if (LabelManData.Caption='') and (ManLabel.Checked)
    then begin
              ZShowMessage ('Помилка!','Не вибрана фізична особа!',mtInformation,[mbOk]);
              EditMan.SetFocus;
              CheckData:=False;
              Exit;
    end;

    if (LabelDepData.Caption='') and (DepLabel.Checked)
    then begin
              ZShowMessage ('Помилка!','Не вибрано підрозділ!',mtInformation,[mbOk]);
              EditDep.SetFocus;
              CheckData:=False;
              Exit;
    end;



    if PeriodToKodSetup(YearBegEdit.Value,MonthBegEdit.Value)>PeriodToKodSetup(YearBegEdit.Value,MonthBegEdit.Value) then
    begin
        ZShowMessage('Помилка!','Початковий період більше ніж період закінчення',mtInformation,[mbOk]);
        YearBegEdit.SetFocus;
        CheckData:=False;
    end
end;



constructor TManEditForm.Create (AOwner:TComponent;DbHandle:TISC_DB_HANDLE;IdMan:Integer=-1;FIO:String='';TN:Integer=-1);
begin
    inherited Create(AOwner);
    PId_department:=null;

    Self.Caption:=ManEditForm_Caption;
    Self.GroupBox1.Caption:=ManEditBox_Caption;
    Self.ManLabel.Caption:=ManLabel_Caption;
    Self.PeriodBegLabel.Caption:=PeriodBegLabel_Caption;
    Self.PeriodEndLabel.Caption:=PeriodEndLabel_Caption;

    Self.OkBtn.Caption:=OkBtn_Caption;
    Self.CancelBtn.Caption:=CancelBtn_Caption;

    FIdMan:=IdMan;
    FFIO:=FIO;
    FTN:=TN;
    if FTN<>-1 then EditMan.Text := IntToStr(FTN);
    LabelManData.Caption := FFIO;

    FDbHandle:=DbHandle;
end;

procedure TManEditForm.OkBtnClick(Sender: TObject);
begin
  ActionYesExecute(Sender);
end;

procedure TManEditForm.EditManExit(Sender: TObject);
var Man:Variant;
begin
if EditMan.Text<>'' then
 begin
  man:=ManByTn(StrToInt(EditMan.Text),FDbHandle);
  if VarArrayDimCount(man)>0 then
   begin
    FIdMan:=man[0];
    LabelManData.Caption := man[2];
   end
  else
   EditMan.SetFocus;
 end;
end;

procedure TManEditForm.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,FDbHandle);
if VarArrayDimCount(Man)> 0 then
     If Man[0]<>NULL
     then begin
               FIdMan := Man[0];
               LabelManData.Caption := Man[2];
               EditMan.Text := Man[1];
     end;
end;

procedure TManEditForm.ActionYesExecute(Sender: TObject);
begin
     if CheckData then ModalResult:=mrOk;
end;

procedure TManEditForm.CancelBtnClick(Sender: TObject);
begin
     ActionNoExecute(Sender);
end;

procedure TManEditForm.ActionNoExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TManEditForm.ManLabelClick(Sender: TObject);
begin
     EditMan.Enabled     :=true;
     EditMan.SetFocus;
     LabelManData.Enabled:=true;
     EditDep.Enabled     :=false;
     LabelDepData.Enabled:=false;
end;

procedure TManEditForm.DepLabelClick(Sender: TObject);
begin
     EditMan.Enabled     :=false;
     LabelManData.Enabled:=false;
     EditDep.Enabled     :=true;
     EditDep.SetFocus;
     LabelDepData.Enabled:=true;
end;

procedure TManEditForm.EditDepPropertiesButtonClick(Sender: TObject;
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
              FieldValues['DBHandle'] := Integer(FDbHandle);
              FieldValues['ShowStyle'] := 0;
              FieldValues['Select'] := 1;
              FieldValues['Actual_Date'] := Date;
              Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil
    then ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty
    then begin
              EditDep.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
              LabelDepData.Caption := varToStrDef(sp.Output['NAME_FULL'],'');
              PId_department := sp.Output['ID_DEPARTMENT'];
    end;
    sp.Free;
end;

procedure TManEditForm.EditDepExit(Sender: TObject);
var Department:Variant;
begin
      if EditDep.Text<>''
      then begin
                Department:=DepartmentByKod(EditDep.Text,FDbHandle);
                if VarArrayDimCount(Department)>0
                then begin
                          PId_department:=Department[0];
                          LabelDepData.Caption := Department[2];
                end
                else LabelDepData.SetFocus;
       end;
end;

end.
