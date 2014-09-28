{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, uMatasVars, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxButtonEdit,
  cxCheckBox, uSpTipDocMulti, ibase, FR_DSet, FR_DBSet, FR_Class, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, uMatasUtils;

type
  TDocWorkRepForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    RepDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Label2: TLabel;
    cxDateBeg: TcxDateEdit;
    Label3: TLabel;
    cxDateEnd: TcxDateEdit;
    cxTipDoc: TcxButtonEdit;
    Label1: TLabel;
    cxCheckUser: TcxCheckBox;
    frReportReestr: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    WorkStoredProc: TpFIBStoredProc;
    WorkDataSet: TpFIBDataSet;
    cxCheckEdit: TcxCheckBox;
    cxNewReestr: TcxCheckBox;
    WorkDataSource: TDataSource;
    Label4: TLabel;
    cxLookupNumReestr: TcxLookupComboBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label5: TLabel;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    Label6: TLabel;
    cxReport: TcxComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNewReestrPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxReportPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE : TISC_DB_HANDLE;
  public
    TIP_REPORT: integer;
    ID_TIPD: integer;
    FILTER_ID_SESSION: Integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; TIP_REPORT: integer; DBEG: TDateTime; DEND: TDateTime);overload;
  end;

var
  DocWorkRepForm: TDocWorkRepForm;

implementation

{$R *.dfm}
constructor TDocWorkRepForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; TIP_REPORT: integer; DBEG: TDateTime; DEND: TDateTime);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.WorkDatabase.Close;
  Self.WorkDatabase.Handle:=DBHANDLE;
  Self.ReadTransaction.StartTransaction;
 end;
 Self.Caption:=MAT_SYS_PREFIX;
 Self.ID_TIPD:=0;
 Self.TIP_REPORT:=TIP_REPORT;
 Self.cxDateBeg.EditValue:=DBEG;
 Self.cxDateEnd.EditValue:=DEND;
 Self.FILTER_ID_SESSION:=Self.WorkDatabase.Gen_Id('MAT_ID_SESSION', 1);
 case TIP_REPORT of
  1: Self.Caption:=Self.Caption+'Реестр документов';
  2: Self.Caption:=Self.Caption+'Отчет по приходу ТМЦ';
  3: Self.Caption:=Self.Caption+'отчет по расходу ТМЦ';
 end;
end;

procedure TDocWorkRepForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TDocWorkRepForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  FormResult: Boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
  Res:=uSpTipDocMulti.GetTipDocMulti(self, self.DBHANDLE, 0, FILTER_ID_SESSION, FormResult);
  if FormResult then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxTipDoc.Text := s;
  end
 end
end;

procedure TDocWorkRepForm.cxNewReestrPropertiesChange(Sender: TObject);
begin
 if cxNewReestr.Checked then
 begin
  Label4.Enabled:=false;
  cxLookupNumReestr.Enabled:=false;
 end
 else
 begin
  Label4.Enabled:=true;
  cxLookupNumReestr.Enabled:=true;
  WorkDataSet.Close;
  WorkDataSet.SelectSQL.Clear;
  WorkDataSet.SelectSQL.Add('SELECT NUM_REESTR FROM MAT_DT_DOC_REP_NUM_SEL(:DBEG, :DEND) ORDER BY NUM_REESTR');
  WorkDataSet.Prepare;
  WorkDataSet.ParamByName('DBEG').Value:=cxDateBeg.EditValue;
  WorkDataSet.ParamByName('DEND').Value:=cxDateEnd.EditValue;
  WorkDataSet.CloseOpen(false);
 end
end;

procedure TDocWorkRepForm.FormCreate(Sender: TObject);
begin
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

procedure TDocWorkRepForm.OkButtonClick(Sender: TObject);
var
 NUMR: string;
begin
 if TIP_REPORT=1 then
 begin
  cxNewReestr.Enabled:=true;
  if cxNewReestr.Checked then
  begin
   WorkStoredProc.StoredProcName:='MAT_DT_DOC_REP_CREATE';
   WorkStoredProc.Prepare;
   if cxCheckUser.Checked then
    WorkStoredProc.ParamByName('PID_USER').Value:=_CURRENT_USER_ID
   else
    WorkStoredProc.ParamByName('PID_USER').Value:=0;
   WorkStoredProc.ParamByName('DATE_BEG').Value:=cxDateBeg.EditValue;
   WorkStoredProc.ParamByName('DATE_END').Value:=cxDateEnd.EditValue;
   WorkStoredProc.ParamByName('PID_TIPD').Value:=ID_TIPD;
   try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.ExecProc;
    WorkStoredProc.Transaction.Commit;
    NUMR:=WorkStoredProc.ParamByName('NUM_REESTR').AsString;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
      exit;
     end;
   end;
  end
  else
   NUMR:=cxLookupNumReestr.EditText;
  if (cxReport.ItemIndex=0) or (cxReport.ItemIndex=1) then
  begin
   RepDataSet.Close;
   with RepDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_DT_DOC_REP_SELECT(:PNUM_REESTR)');
    Add('ORDER BY DATE_DOC, TIPD, NUM_DOC')
   end;
   RepDataSet.Prepare;
   RepDataSet.ParamByName('PNUM_REESTR').Value:=NUMR;
   RepDataSet.CloseOpen(false);
  end;
  if (cxReport.ItemIndex=2) then
  begin
   RepDataSet.Close;
   with RepDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_DT_DOC_SELECT(:DATE_BEG, :DATE_END, :ID_TIPD, :ID_FILTER)');
    Add('ORDER BY TIPD, DATE_DOC, NUM_DOC')
   end;
   RepDataSet.Prepare;
   RepDataSet.ParamByName('DATE_BEG').Value:=cxDateBeg.EditValue;
   RepDataSet.ParamByName('DATE_END').Value:=cxDateEnd.EditValue;
   RepDataSet.ParamByName('ID_TIPD').Value:=ID_TIPD;
   RepDataSet.ParamByName('ID_FILTER').Value:=null;
   RepDataSet.CloseOpen(false);
  end;
  if cxReport.ItemIndex=0 then
   frReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\reestr_doc.frf');
  if cxReport.ItemIndex=1 then
   frReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\reestr_doc2.frf');
  if cxReport.ItemIndex=2 then
   frReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\reestr_doc3.frf');
  if (cxDateBeg.EditValue=cxDateEnd.EditValue) then
   frVariables['PERIOD']:='за '+cxDateBeg.Text
  else
   frVariables['PERIOD']:='c '+cxDateBeg.Text+' по '+cxDateEnd.Text;
  frVariables['NUM_REESTR']:=NUMR;
  frVariables['ORG_NAME']:=_ORG_FULL_NAME;
  frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
  frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
  frReportReestr.PrepareReport;
  if cxCopies.Value>1 then
   frReportReestr.DefaultCopies:=cxCopies.Value;
  if cxCheckOnPrinter.Checked then
  begin
   if cxSelectPrinter.Checked then
    frReportReestr.PrintPreparedReportDlg
   else
    frReportReestr.PrintPreparedReport('', cxCopies.Value, false, frAll);
  end
  else
   frReportReestr.ShowReport;
  if cxCheckEdit.Checked then
   frReportReestr.DesignReport;
 end;
end;

procedure TDocWorkRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkRepForm.cxReportPropertiesChange(Sender: TObject);
begin
 if cxReport.ItemIndex=2 then
 begin
  cxNewReestr.Checked:=false;
  cxNewReestr.Enabled:=false;
 end
 else
  cxNewReestr.Enabled:=true;
end;

end.
