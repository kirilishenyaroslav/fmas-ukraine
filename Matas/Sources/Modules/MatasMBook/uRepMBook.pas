{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                     Модуль печати приложения к Главной книге                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepMBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, uMatasVars, uMatasUtils,
  FR_Desgn, ActnList, DateUtils, Kernel, FIBQuery, pFIBQuery,
  pFIBStoredProc;

procedure ShowRepMainBook(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepMainBook;

type
  TMBookRepForm = class(TForm)
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    OperRepDataSet: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    cxCheckDesign: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    cxReport: TcxComboBox;
    Label3: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    WriteTransaction: TpFIBTransaction;
    WorkStoredProc: TpFIBStoredProc;
    cxCheckSave: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    function SaveMBookInProv(aDATE_BEG, aDATE_END, aPERIOD: TDateTime): boolean;
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  MBookRepForm: TMBookRepForm;

implementation

{$R *.dfm}

procedure ShowRepMainBook(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TMBookRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TMBookRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_MB;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   LoadMonthTocxComboBox(self.cxMonth);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   MatasMonth:=dm;
   self.cxMonth.ItemIndex:=MatasMonth-1;
   self.cxYear.Value:=MatasYear;
 end;
end;

procedure TMBookRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 PERIOD: TDateTime;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYear.Value;
 MatasMonth:=cxMonth.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 DEND:=EndOfAMonth(MatasYear, MatasMonth);
 PERIOD:=DEND;
 if SaveMBookInProv(DBEG, DEND, PERIOD) then
 begin
  OperRepDataSet.Close;
  if cxReport.ItemIndex=1 then
  begin
   with OperRepDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT DB_SCH_NUMBER, KR_SCH_NUMBER, SUM(SUMMA) AS SUMMA');
    Add(' FROM MAT_SEL_MBOOK_DATA(:PDATE_BEG, :PDATE_END)');
    Add(' GROUP BY DB_SCH_NUMBER, KR_SCH_NUMBER');
    Add(' ORDER BY KR_SCH_NUMBER');
   end;
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mbook_rep.frf');
  end;

  if cxReport.ItemIndex=0 then
  begin
   with OperRepDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * ');
    Add(' FROM MAT_SEL_MBOOK_DATA_FULL(:PDATE_BEG, :PDATE_END)');
    Add(' ORDER BY KR_SCH_NUMBER, DB_SCH_NUMBER, DB_SM_KOD, DB_RZ_KOD, DB_ST_KOD, DB_KEKV_KOD');
   end;
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mbook_full_rep.frf');
  end;

  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('PDATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
  frVariables['ORG_NAME']:=_ORG_FULL_NAME;
  frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
  frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
  CloseWaitWindow(w);
  frReport1.PrepareReport;
  if cxCopies.Value>1 then
   frReport1.DefaultCopies:=cxCopies.Value;
  if cxCheckOnPrinter.Checked then
  begin
   if cxSelectPrinter.Checked then
    frReport1.PrintPreparedReportDlg
   else
    frReport1.PrintPreparedReport('', cxCopies.Value, false, frAll);
  end
  else
   frReport1.ShowReport;
  if cxCheckDesign.Checked then
   frReport1.DesignReport;
  OperRepDataSet.Close;
 end
 else
  CloseWaitWindow(w);
end;

procedure TMBookRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMBookRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TMBookRepForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckDesign.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

procedure TMBookRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

function TMBookRepForm.SaveMBookInProv(aDATE_BEG, aDATE_END, aPERIOD: TDateTime): boolean;
var
 DBEG, DEND: TDateTime;
 KEY_SESSION: int64;
 STRU: KERNEL_MODE_STRUCTURE;
 ErrorList: TStringList;
 DoResult: boolean;
 StringError: string;
 i: integer;
 MAX_ERR: integer;
begin
 if not cxCheckSave.Checked then
 begin
  Result:=true;
  exit;
 end;
 DBEG:=aDATE_BEG;
 DEND:=aDATE_END;
 try
   WorkStoredProc.Transaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_MAKE_MBOOK_DATA';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('PDATE_BEG').Value:=DBEG;
   WorkStoredProc.ParamByName('PDATE_END').Value:=DEND;
   WorkStoredProc.ParamByName('PDATE_REC').Value:=aPERIOD;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
   KEY_SESSION:=WorkStoredProc.ParamByName('KEY_SESSION').AsInt64;
 except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
 end;
 WriteTransaction.StartTransaction;
 STRU.DBHANDLE:=DBHANDLE;
 STRU.TRHANDLE:=WriteTransaction.Handle;
 STRU.WORKDATE:=_MATAS_PERIOD;
 STRU.KERNEL_ACTION:=1;
 STRU.KEY_SESSION:=KEY_SESSION;
 DoResult:=Kernel.KernelDo(@STRU);
 if not DoResult
 then begin
  if agMessageDlg(MAT_STR_WARNING, 'Виникли помилки при збереженні даних! Показати протокол?', mtConfirmation, [mbYes, mbNo]) = ID_YES then
  begin
   ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
   StringError:=MAT_STR_SAVE_ERROR+chr(10)+chr(13);
   if ErrorList.Count-1<15 then
    MAX_ERR:=ErrorList.Count-1
   else
    MAX_ERR:=15;
   if ErrorList<>nil then for i:=0 to MAX_ERR do StringError:=StringError+ErrorList.Strings[i]+chr(10)+chr(13);
   StringError:=StringError+chr(10)+chr(13)+'KEY_SESSION:'+IntToStr(KEY_SESSION);
   ShowMessage(StringError);
  end;
  WriteTransaction.Rollback;
 end
 else
  WriteTransaction.Commit;
 Result:=DoResult;
end;

end.
