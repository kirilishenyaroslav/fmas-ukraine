{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOperIstFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList;

procedure ShowRepOperIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepOperIstFin;

type
  TOperRepIstFinForm = class(TForm)
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    OperRepDataSet: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    cxReport: TcxComboBox;
    Label2: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   ID_SCH: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  OperRepIstFinForm: TOperRepIstFinForm;

implementation

{$R *.dfm}
uses DateUtils;

procedure ShowRepOperIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TOperRepIstFinForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TOperRepIstFinForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
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
   Self.Caption:=MAT_SYS_PREFIX+'Расшифровка оборотов';
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   MatasMonth:=dm;
   LoadMonthTocxComboBox(self.cxMonth);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonth.ItemIndex:=MatasMonth-1;
   self.cxYear.Value:=MatasYear;
 end;
end;

procedure TOperRepIstFinForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYear.Value;
 MatasMonth:=cxMonth.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 DEND:=EndOfAMonth(MatasYear, MatasMonth);
 OperRepDataSet.Close;
 OperRepDataSet.SelectSQL.Clear;

 if (cxReport.ItemIndex=0) or (cxReport.ItemIndex=2) then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_TITLE, KR_SCH_TITLE,');
   Add('       BAL_DB_ID_SCH, BAL_DB_SCH_NUMBER, BAL_DB_SCH_TITLE,');
   Add('       BAL_KR_ID_SCH, BAL_KR_SCH_NUMBER, BAL_KR_SCH_TITLE,');
   Add('       DB_ID_FOND, KR_ID_FOND, DB_FOND_NUMBER, KR_FOND_NUMBER, DB_FOND_TITLE, KR_FOND_TITLE,');
   Add('       DB_ID_SM, DB_SM_TITLE, DB_SM_KOD, DB_ID_RZ, DB_RZ_TITLE, DB_RZ_KOD,');
   Add('       DB_ID_ST, DB_ST_TITLE, DB_ST_KOD, DB_ID_KEKV, DB_KEKV_TITLE, DB_KEKV_KOD,');
   Add('       KR_ID_SM, KR_SM_TITLE, KR_SM_KOD, KR_ID_RZ, KR_RZ_TITLE, KR_RZ_KOD,');
   Add('       KR_ID_ST, KR_ST_TITLE, KR_ST_KOD, KR_ID_KEKV, KR_KEKV_TITLE, KR_KEKV_KOD,');
   Add('       DB_ISTFIN, KR_ISTFIN, SUM(SUMMA) AS SUMMA');
   Add('FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1');
   Add('GROUP BY DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_TITLE, KR_SCH_TITLE,');
   Add('       BAL_DB_ID_SCH, BAL_DB_SCH_NUMBER, BAL_DB_SCH_TITLE,');
   Add('       BAL_KR_ID_SCH, BAL_KR_SCH_NUMBER, BAL_KR_SCH_TITLE,');
   Add('       DB_ID_FOND, KR_ID_FOND, DB_FOND_NUMBER, KR_FOND_NUMBER, DB_FOND_TITLE, KR_FOND_TITLE,');
   Add('       DB_ID_SM, DB_SM_TITLE, DB_SM_KOD, DB_ID_RZ, DB_RZ_TITLE, DB_RZ_KOD,');
   Add('       DB_ID_ST, DB_ST_TITLE, DB_ST_KOD, DB_ID_KEKV, DB_KEKV_TITLE, DB_KEKV_KOD,');
   Add('       KR_ID_SM, KR_SM_TITLE, KR_SM_KOD, KR_ID_RZ, KR_RZ_TITLE, KR_RZ_KOD,');
   Add('       KR_ID_ST, KR_ST_TITLE, KR_ST_KOD, KR_ID_KEKV, KR_KEKV_TITLE, KR_KEKV_KOD,');
   Add('       DB_ISTFIN, KR_ISTFIN');
   Add('ORDER BY BAL_KR_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_FOND_NUMBER, DB_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  if cxReport.ItemIndex=0 then
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if1i.frf');
  if cxReport.ItemIndex=2 then
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if1g.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if (cxReport.ItemIndex=1) or (cxReport.ItemIndex=3) then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_TITLE, KR_SCH_TITLE,');
   Add('       BAL_DB_ID_SCH, BAL_DB_SCH_NUMBER, BAL_DB_SCH_TITLE,');
   Add('       BAL_KR_ID_SCH, BAL_KR_SCH_NUMBER, BAL_KR_SCH_TITLE,');
   Add('       DB_ID_FOND, KR_ID_FOND, DB_FOND_NUMBER, KR_FOND_NUMBER, DB_FOND_TITLE, KR_FOND_TITLE,');
   Add('       DB_ID_SM, DB_SM_TITLE, DB_SM_KOD, DB_ID_RZ, DB_RZ_TITLE, DB_RZ_KOD,');
   Add('       DB_ID_ST, DB_ST_TITLE, DB_ST_KOD, DB_ID_KEKV, DB_KEKV_TITLE, DB_KEKV_KOD,');
   Add('       KR_ID_SM, KR_SM_TITLE, KR_SM_KOD, KR_ID_RZ, KR_RZ_TITLE, KR_RZ_KOD,');
   Add('       KR_ID_ST, KR_ST_TITLE, KR_ST_KOD, KR_ID_KEKV, KR_KEKV_TITLE, KR_KEKV_KOD,');
   Add('       DB_ISTFIN, KR_ISTFIN, SUM(SUMMA) AS SUMMA');
   Add('FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0');
   Add('GROUP BY DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_TITLE, KR_SCH_TITLE,');
   Add('       BAL_DB_ID_SCH, BAL_DB_SCH_NUMBER, BAL_DB_SCH_TITLE,');
   Add('       BAL_KR_ID_SCH, BAL_KR_SCH_NUMBER, BAL_KR_SCH_TITLE,');
   Add('       DB_ID_FOND, KR_ID_FOND, DB_FOND_NUMBER, KR_FOND_NUMBER, DB_FOND_TITLE, KR_FOND_TITLE,');
   Add('       DB_ID_SM, DB_SM_TITLE, DB_SM_KOD, DB_ID_RZ, DB_RZ_TITLE, DB_RZ_KOD,');
   Add('       DB_ID_ST, DB_ST_TITLE, DB_ST_KOD, DB_ID_KEKV, DB_KEKV_TITLE, DB_KEKV_KOD,');
   Add('       KR_ID_SM, KR_SM_TITLE, KR_SM_KOD, KR_ID_RZ, KR_RZ_TITLE, KR_RZ_KOD,');
   Add('       KR_ID_ST, KR_ST_TITLE, KR_ST_KOD, KR_ID_KEKV, KR_KEKV_TITLE, KR_KEKV_KOD,');
   Add('       DB_ISTFIN, KR_ISTFIN');
   Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, KR_FOND_NUMBER, KR_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  if cxReport.ItemIndex=1 then
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if2i.frf');
  if cxReport.ItemIndex=3 then
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if2g.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=4 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1');
   Add('ORDER BY BAL_KR_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_FOND_NUMBER, DB_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if1f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=5 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0');
   Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, KR_FOND_NUMBER, KR_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if2f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

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
 if cxCheckBox1.Checked then
  frReport1.DesignReport;
 OperRepDataSet.Close;
end;

procedure TOperRepIstFinForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOperRepIstFinForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOperRepIstFinForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
end;

procedure TOperRepIstFinForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOperRepIstFinForm.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.


