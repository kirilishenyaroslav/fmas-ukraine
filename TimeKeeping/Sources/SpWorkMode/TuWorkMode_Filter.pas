unit TuWorkMode_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, cxLabel,
  StdCtrls, cxTextEdit, cxMaskEdit, cxButtonEdit, cxContainer, cxEdit,
  cxCheckBox, cxControls, cxGroupBox, cxButtons, ExtCtrls, ActnList,
  TuCommonLoader,SpWorkMode_MainForm,dates,gr_uCommonLoader,SpWorkMode_DM;

type
  TFormWorkMode_Filter = class(TForm)
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    Panel2: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    GroupBox1: TcxGroupBox;
    CheckBoxDog: TcxCheckBox;
    EditDog: TcxButtonEdit;
    cxGroupBox3: TcxGroupBox;
    EditMan: TcxButtonEdit;
    CheckBoxMan: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    CheckBoxPeriodAction: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EditDateBegActive: TcxDateEdit;
    EditDateEndActive: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    CheckBoxPeriod: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    procedure CheckBoxPeriodActionPropertiesChange(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
   FParam: TWorkModeFilterParam ;
   constructor create (Aparam:TWorkModeFilterParam;ADModule:TDModule);reintroduce;
  end;

var
  FormWorkMode_Filter: TFormWorkMode_Filter;

implementation


{$R *.dfm}

procedure TFormWorkMode_Filter.CheckBoxPeriodActionPropertiesChange(Sender: TObject);
begin
  EditDateBegActive.Enabled:=CheckBoxPeriodAction.Checked;
  EditDateEndActive.Enabled:=CheckBoxPeriodAction.Checked;
  EditDog.Enabled:=CheckBoxDog.Checked;
  EditMan.Enabled:=CheckBoxMan.Checked;
  EditDateBeg.Enabled:=CheckBoxPeriod.Checked;
  EditDateEnd.Enabled:=CheckBoxPeriod.Checked;
end;

procedure TFormWorkMode_Filter.ActionCancelExecute(Sender: TObject);
begin
modalResult:=mrCancel;
end;

procedure TFormWorkMode_Filter.ActionYesExecute(Sender: TObject);
begin

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
if   CheckBoxPeriod.Checked then
begin
 FParam.DateBeg:=EditDateBeg.Text;
 FParam.DateEnd:=EditDateEnd.text;
end
else
begin
 FParam.DateBeg:=null;
 FParam.DateEnd:=null;
end;
if not  CheckBoxDog.Checked then
begin
 FParam.rmoving:=null;
 FParam.id_post_moving:=null;
end;
if not  CheckBoxMan.Checked then
 FParam.id_man:=null;
modalResult:=mrYes;
end;

constructor TFormWorkMode_Filter.create(Aparam: TWorkModeFilterParam;ADModule:TDModule);
begin
  inherited create (Aparam.owner);
  DModule:=ADModule;
  FParam:=AParam;
  EditDateBegActive.date:=strtodate(KodSetupToPeriod(FParam.KodSetup,6));
  EditDateEndActive.date:=strtodate(KodSetupToPeriod(FParam.KodSetup+1,6))-1;
  EditDateBeg.Date:=strtodate(KodSetupToPeriod(FParam.KodSetup,6));
  EditDateEnd.Date:=strtodate(KodSetupToPeriod(FParam.KodSetup+1,6))-1;

  if FParam.DateBegActive<>null then
  begin
    CheckBoxPeriodAction.Checked:=true;
    EditDateBegActive.Date:=strtodate(FParam.DateBegActive);
    EditDateEndActive.Date:=strtodate(FParam.DateEndActive);
  end ;
  if FParam.DateBeg<>null then
  begin
    CheckBoxPeriod.Checked:=true;
    EditDateBeg.Date:=strtodate(FParam.DateBeg);
    EditDateEnd.Date:=strtodate(FParam.DateEnd);
  end ;
  if FParam.id_man<>null   then
  begin
    CheckBoxMan.Checked:=true;
    EditMan.text:=FParam.FioMan;
  end;
  if FParam.rmoving<>null   then
  begin
    CheckBoxDog.Checked:=true;
    EditDog.text:=FParam.FioDog;
  end;
end;

procedure TFormWorkMode_Filter.EditDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res:variant;
begin
  Res:=LoadTuSpDog(self,dmodule.db.Handle, FParam.kodSetup , Null);
  if VarIsArray(res) then
  begin
    EditDog.Text:=Res[2];
    FParam.Rmoving:=Res[0];
    FParam.Id_Post_Moving:=Res[1];
    FParam.FioDog:=Res[2];
  end
end;

procedure TFormWorkMode_Filter.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
  Res:=ShowSpPeople(self, Dmodule.DB.handle);
  if VarIsArray(Res) then
  begin
    EditMan.Text:=Res[1]+' '+Res[2]+' '+Res[3];
    FParam.id_man:=Res[0];
    FParam.FioMan:=Res[1]+' '+Res[2]+' '+Res[3];
  end
end;

end.
