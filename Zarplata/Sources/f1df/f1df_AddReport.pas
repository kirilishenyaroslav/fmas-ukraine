unit f1df_AddReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ActnList,
  cxCheckBox, IBase,
  Unit_ZGlobal_Consts, zMessages, ZProc, DB, FIBDataSet, pFIBDataSet,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

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
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
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

 DB.Handle := PDb_Handle;
 DSetTypes.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_INI_TYPE_REPORT';
 DSetTypes.Open;
 LookupComboBoxTypes.EditValue := 1;
end;

procedure TFAddReport.ActionYesExecute(Sender: TObject);
begin
try
 self.Enabled := False;
 PId_1Df := 0;
 with StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_1DF_DNDZ';
   Prepare;
   ParamByName('YEAR_NUM').AsInteger    := SpinEditYear.EditValue;
   ParamByName('KVARTAL_NUM').AsInteger := SpinEditKvartal.EditValue;
   ParamByName('P_TIN').AsString        := CheckBoxPTin.EditValue;
   ParamByName('ID_TYPE').AsInteger     := LookupComboBoxTypes.EditValue;
   ExecProc;
   PId_1Df := ParamByName('ID_1DF').AsInteger;
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

end.
