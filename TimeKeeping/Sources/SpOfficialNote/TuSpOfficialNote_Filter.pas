unit TuSpOfficialNote_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxControls, cxGroupBox, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit,
  cxCheckBox,TuSpOfficialNote_Main, TuCommonLoader,gr_uCommonLoader,TuCommonTypes,
  cxSpinEdit,dates;

type
  TFormOfficialNote_Filtr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGroupBox1: TcxGroupBox;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GroupBox1: TcxGroupBox;
    CheckBoxDog: TcxCheckBox;
    EditDog: TcxButtonEdit;
    cxGroupBox3: TcxGroupBox;
    EditMan: TcxButtonEdit;
    CheckBoxMan: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    CheckBoxPeriodAction: TcxCheckBox;
    cxGroupBox4: TcxGroupBox;
    EditTypeWork: TcxButtonEdit;
    CheckBoxTypeWork: TcxCheckBox;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    cxGroupBox5: TcxGroupBox;
    CheckBoxWorkMode: TcxCheckBox;
    EditWorkMode: TcxButtonEdit;
    CheckBoxDateCreate: TcxCheckBox;
    Label4: TLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    EditDateBegActive: TcxDateEdit;
    EditDateEndActive: TcxDateEdit;
    EditDateBegCreate: TcxDateEdit;
    EditDateEndCreate: TcxDateEdit;
    procedure CheckBoxPeriodActionPropertiesChange(Sender: TObject);
    procedure EditDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditTypeWorkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditWorkModePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    FParam:TOfficialNoteFilterParam;
    constructor create(Param:TOfficialNoteFilterParam);
  end;



implementation

uses TuSpOfficialNote_DM;

{$R *.dfm}

{ TFormOfficialNote_Filtr }

constructor TFormOfficialNote_Filtr.create(
  Param: TOfficialNoteFilterParam);
begin
  inherited create(Param.Owner);
  FParam:=Param;
  if Param.DateBegActive<>null then
  begin
    CheckBoxPeriodAction.Checked:=true;
    EditDateBegActive.Date:=strtodate(Param.DateBegActive);
    EditDateEndActive.Date:=strtodate(Param.DateEndActive);
  end
  else
  begin
    EditDateBegActive.Date:=strtodate(KodSetupToPeriod(Param.KodSetup,6));
    EditDateEndActive.Date:=strtodate(KodSetupToPeriod(Param.KodSetup+1,6))-1;
  end ;
  if Param.DateBegCreate<>null then
  begin
    CheckBoxDateCreate.Checked:=true;
    EditDateBegCreate.Date:=strtodate(Param.DateBegCreate);
    EditDateEndCreate.Date:=strtodate(Param.DateEndCreate);
  end
  else
  begin
    EditDateBegCreate.Date:=strtodate(KodSetupToPeriod(Param.KodSetup,6));
    EditDateEndCreate.Date:=strtodate(KodSetupToPeriod(Param.KodSetup+1,6))-1;
  end;
  EditTypeWork.text:=Param.NameVihod;
  EditWorkMode.text:=Param.NameWorkMode;
  if Param.id_man<>null   then
  begin
    CheckBoxMan.Checked:=true;
    EditMan.text:=Param.FioMan;
  end;
  if Param.rmoving<>null   then
  begin
    CheckBoxDog.Checked:=true;
    EditDog.text:=Param.FioDog;
  end;
  if Param.id_vihod<>null  then
    CheckBoxTypeWork.Checked:=true;
  if Param.is_work_mode='T'   then
    CheckBoxWorkMode.Checked:=true;
end;

procedure TFormOfficialNote_Filtr.CheckBoxPeriodActionPropertiesChange(
  Sender: TObject);
begin
  EditDateBegCreate.Enabled:=CheckBoxDateCreate.Checked;
  EditDateEndCreate.Enabled:=CheckBoxDateCreate.Checked;
  EditDateBegActive.Enabled:=CheckBoxPeriodAction.Checked;
  EditDateEndActive.Enabled:=CheckBoxPeriodAction.Checked;
  EditDog.Enabled:=CheckBoxDog.Checked;
  EditMan.Enabled:=CheckBoxMan.Checked;
  EditTypeWork.Enabled:=CheckBoxTypeWork.Checked;
  EditWorkMode.Enabled:=CheckBoxWorkMode.Checked;
end;

procedure TFormOfficialNote_Filtr.EditDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res:variant;
begin
  Res:=LoadTuSpDog(self,dm.db.Handle, FParam.kodSetup , Null);
  if VarIsArray(res) then
  begin
    EditDog.Text:=Res[2];
    FParam.Rmoving:=Res[0];
    FParam.Id_Post_Moving:=Res[1];
    FParam.FioDog:=Res[2];
  end
end;

procedure TFormOfficialNote_Filtr.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
Res:=ShowSpPeople(self, Dm.DB.handle);
  if VarIsArray(Res) then
  begin
    EditMan.Text:=Res[1]+' '+Res[2]+' '+Res[3];
    FParam.id_man:=Res[0];
    FParam.FioMan:=Res[1]+' '+Res[2]+' '+Res[3];
  end
end;


procedure TFormOfficialNote_Filtr.EditTypeWorkPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Parameter:TTuSimpleParam;
    res:variant;
begin
   Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsModal;
  res:=DoFunctionFromPackage(Parameter,Tu_SpTypeWork_Pack);
  if VarIsArray(res) then
  begin
    FParam.Id_Vihod:=res[0];
    EditTypeWork.text:=res[1];
    FParam.NameVihod:=res[1];
  end;
  Parameter.Destroy;

end;

procedure TFormOfficialNote_Filtr.EditWorkModePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Parameter:TTuSimpleParam;
    res:variant;
begin
  Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsModal;
  res:=DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
  if VarIsArray(res)then
  begin
     FParam.id_work_mode:=res[0];
     EditWorkMode.Text:=res[1];
     FParam.NameWorkMode:=res[1];
  end;
  Parameter.Destroy;
end;


procedure TFormOfficialNote_Filtr.ActionYesExecute(Sender: TObject);
begin
if  CheckBoxDateCreate.Checked then
begin
  FParam.DateBegCreate:=EditDateBegCreate.text;
  Fparam.DateEndCreate:=EditDateEndCreate.text;
end
else
begin
  FParam.DateBegCreate:=null;
  Fparam.DateEndCreate:=null;
end;
if   CheckBoxPeriodAction.Checked then
begin
 FParam.DateBegActive:=EditDateBegActive.Text;
 FParam.DateEndActive:=EditDateEndActive.text;
end
else
begin
 FParam.DateBegActive:=null;
 FParam.DateEndActive:=null;
end;
if not  CheckBoxDog.Checked then
begin
 FParam.rmoving:=null;
 FParam.id_post_moving:=null;
end;
if not  CheckBoxMan.Checked then
 FParam.id_man:=null;
if not  CheckBoxTypeWork.Checked then
 FParam.id_vihod:=null;
 FParam.is_work_mode:=CheckBoxWorkMode.EditValue;
if not  CheckBoxWorkMode.Checked then
 FParam.id_work_mode:=null;

ModalResult:=mrYes;
end;

procedure TFormOfficialNote_Filtr.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
