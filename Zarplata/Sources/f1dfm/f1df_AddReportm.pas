unit f1df_AddReportm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ActnList,
  cxCheckBox, IBase,
  Unit_ZGlobal_Consts, zMessages, ZProc, DB, FIBDataSet, pFIBDataSet,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxRadioGroup, cxGroupBox;

type
  TFAddReport = class(TForm)
    SpinEditKvartal: TcxSpinEdit;
    SpinEditYear: TcxSpinEdit;
    LabelYear: TcxLabel;
    LabelKvartal: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DB: TpFIBDatabase;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    CheckBoxPTin: TcxCheckBox;
    LookupComboBoxTypes: TcxLookupComboBox;
    LabelType: TcxLabel;
    DSetTypes: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSourceTypes: TDataSource;
    CheckBoxWork: TcxCheckBox;
    CheckBoxStud: TcxCheckBox;
    DSetFirm: TpFIBDataSet;
    DSourceFirm: TDataSource;
    CheckBoxAll: TcxCheckBox;
    BoxShifr: TcxGroupBox;
    LabelShifr: TcxLabel;
    LookupComboBoxFirm: TcxLookupComboBox;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure CheckBoxAllPropertiesChange(Sender: TObject);
  private
    PId_1Df:Integer;
    PLanguageIndex:Byte;
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE);reintroduce;
    property Id_1Df:Integer read PId_1Df;
  end;

function ShowFormAddReport(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE):integer;

implementation

{$R *.dfm}

function ShowFormAddReport(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE):integer;
var Form:TFAddReport;
begin
Result:=0;
Form := TFAddReport.Create(AOwner,ADB_handle);
if Form.ShowModal=mrYes then Result:=Form.Id_1Df;
Form.Destroy;
end;

constructor TFAddReport.Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PDb_Handle := ADB_handle;
 PLanguageIndex := LanguageIndex;

 Caption := Caption_Form[PLanguageIndex];
 LabelYear.Caption := LabelYear_Caption[PLanguageIndex];
 LabelKvartal.Caption := LabelKvartal_Caption[PLanguageIndex];
 LabelType.Caption := LabelType_Caption[PLanguageIndex];

 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
 CheckBoxPTin.Properties.Caption := LabelNotTinPeople_Caption[PLanguageIndex];

 SpinEditKvartal.Value:=IfThen(((ValueFieldZSetup(PDb_Handle,'MONTH_SET')-1)div 3)=0,4,(ValueFieldZSetup(PDb_Handle,'MONTH_SET')-1)div 3);
 SpinEditYear.Value:=IfThen(SpinEditKvartal.Value=4,ValueFieldZSetup(PDb_Handle,'YEAR_SET')-1,ValueFieldZSetup(PDb_Handle,'YEAR_SET'));

 DB.Handle := PDb_Handle;
 DSetTypes.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_INI_TYPE_REPORT';
 DSetTypes.Open;
 LookupComboBoxTypes.EditValue := 1;
 DSetFirm.SQLs.SelectSQL.Text := 'SELECT ID_1DF_FIRM, FIRM_NAME FROM Z_1DF_FIRM';
 DSetFirm.Open;
 LookupComboBoxFirm.EditValue := 1;
 CheckBoxWork.EditValue:='T';
 CheckBoxStud.EditValue:='T';
 if(ValueFieldZSetup(PDb_Handle,'IS_UNIVER')='F')then
 begin
   CheckBoxWork.Visible:=false;
   CheckBoxStud.Visible:=false;
   CheckBoxWork.EditValue:='T';
   CheckBoxStud.EditValue:='F';
 end;
end;

procedure TFAddReport.ActionYesExecute(Sender: TObject);
begin
try
 self.Enabled := False;
 PId_1Df := 0;
 with StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_1DF_HEADERS_I';
   Prepare;
   ParamByName('YEAR_1DF').AsInteger    := SpinEditYear.EditValue;
   ParamByName('KVARTAL_1DF').AsInteger := SpinEditKvartal.EditValue;
   ParamByName('IS_INN').AsString        := CheckBoxPTin.EditValue;
   ParamByName('ID_TYPE').AsInteger     := LookupComboBoxTypes.EditValue;
   ParamByName('IS_WORK_INCLUDE').AsString       := CheckBoxWork.EditValue;
   ParamByName('IS_STUD_INCLUDE').AsString       := CheckBoxStud.EditValue;
   if(CheckBoxAll.Checked=true)then
     ParamByName('ID_1DF_FIRM').AsInteger  := LookupComboBoxFirm.EditValue
   else
     ParamByName('ID_1DF_FIRM').AsInteger  := -1;
   ExecProc;
   PId_1Df := ParamByName('ID').AsInteger;
   Transaction.Commit;
   if ReadTransaction.InTransaction then ReadTransaction.Commit;
   ModalResult := mrYes;
  except
   on E:Exception do
    begin
     zShowMessage(Error_Caption[PLanguageIndex],e.Message,mtInformation,[mbOK]);
     Transaction.Rollback;
    end;
  end;
finally
 self.Enabled := True;
end;
end;

procedure TFAddReport.ActionCancelExecute(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
ModalResult:=mrCancel;
end;

procedure TFAddReport.CheckBoxAllPropertiesChange(Sender: TObject);
begin
  BoxShifr.Enabled:=CheckBoxAll.Checked;
  LabelShifr.Enabled:=CheckBoxAll.Checked;
  LookupComboBoxFirm.Enabled:=CheckBoxAll.Checked;
end;

end.
