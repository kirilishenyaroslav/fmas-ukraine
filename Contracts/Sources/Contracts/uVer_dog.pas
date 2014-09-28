unit uVer_dog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cxCheckBox, DB, FIBDataSet, pFIBDataSet, iBase, frxClass, frxDBSet,
  frxDesgn, cn_Common_WaitForm, ActnList;

type
  TfrmVer_dog = class(TForm)
    Button_ok: TcxButton;
    Button_cancel: TcxButton;
    Date_edit_Date_beg: TcxDateEdit;
    Date_edit_Date_end: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    CheckBox_form: TcxCheckBox;
    DataSet_read: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    ActionList1: TActionList;
    IsDebugMode_act: TAction;
    Label1: TLabel;
    Report: TfrxReport;
    CheckBox_projects: TcxCheckBox;
    All_work_dog_chek: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure Button_okClick(Sender: TObject);
    procedure IsDebugMode_actExecute(Sender: TObject);
    procedure All_work_dog_chekPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    aHandle:TISC_DB_HANDLE;
    IsDebugMode:Boolean;
    { Public declarations }
  end;

var
  frmVer_dog: TfrmVer_dog;

implementation

uses DM, FIBDatabase;

{$R *.dfm}

procedure TfrmVer_dog.FormCreate(Sender: TObject);
begin
  Date_edit_Date_beg.EditValue:=date;
  Date_edit_Date_end.EditValue:=date;
  IsDebugMode:=false;
end;

procedure TfrmVer_dog.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmVer_dog.Button_okClick(Sender: TObject);
var
  Dm:TDM_Contracts;
  wf:TForm;
begin
  if CheckBox_form.Checked
   then ModalResult:=mrOk
   else
    Begin
      wf:=ShowWaitForm(self,wfLoadPackage);
      DM:=TDM_Contracts.Create(self);
      DM.DB.Handle:=aHandle;
      DataSet_read.Database:=DM.DB;
      DataSet_read.Transaction:=DM.ReadTransaction;
      DM.DB.Open;
      DM.ReadTransaction.StartTransaction;
      DataSet_read.Close;
      DataSet_read.SQLs.SelectSQL.Clear;
      DataSet_read.SQLs.SelectSQL.Add('select * from ');

      if not All_work_dog_chek.Checked
       then DataSet_read.SQLs.SelectSQL.Add(' cn_verification_of_input(:date_beg_ver,:date_end_ver)')
       else DataSet_read.SQLs.SelectSQL.Add(' CN_VERIFICATION_ALL_DOGS ');

      if CheckBox_projects.Checked
       then DataSet_read.SQLs.SelectSQL.Add('Where name_dog_status<>'+'''проект''');

      DataSet_read.SQLs.SelectSQL.Add('order by nac, kat_stud, facul, spec, form_stud, FIO, num_dog, kurs');

      if not All_work_dog_chek.Checked then
       begin
        DataSet_read.ParamByName('date_beg_ver').AsDate:=Date_edit_Date_beg.EditValue;
        DataSet_read.ParamByName('date_end_ver').AsDate:=Date_edit_Date_end.EditValue;
       End;
        
      DataSet_read.Open;
      CloseWaitForm(wf);

      Report.Clear;
      report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\VerDog.fr3');
      report.Variables.Clear;
      Report.PrepareReport;
      if IsDebugMode
       then Report.DesignReport
       else Report.ShowPreparedReport;
      DM.DB.Close;
      DM.Free; 
    End;
end;

procedure TfrmVer_dog.IsDebugMode_actExecute(Sender: TObject);
begin
  if not IsDebugMode
  then
   Begin
    IsDebugMode:=true;
    Label1.Caption:='*debug';
   End
  Else
   Begin
    IsDebugMode:=false;
    Label1.Caption:='';
   End;
end;

procedure TfrmVer_dog.All_work_dog_chekPropertiesChange(Sender: TObject);
begin
  if All_work_dog_chek.Checked then
   begin
     Date_edit_Date_beg.Enabled:=False;
     Date_edit_Date_end.Enabled:=False;
     CheckBox_projects.Enabled:=false;
   End
  else
   begin
     Date_edit_Date_beg.Enabled:=True;
     Date_edit_Date_end.Enabled:=true;
     CheckBox_projects.Enabled:=true;
   end;
end;

end.
