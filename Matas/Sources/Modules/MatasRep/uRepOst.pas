{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, uSpMatSchMulti;

procedure ShowRepOst(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepOst;

type
  TOstRepForm = class(TForm)
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    frOstDataSet: TfrDBDataSet;
    frOstReport: TfrReport;
    ReportDataSet: TpFIBDataSet;
    cxReport: TcxComboBox;
    Label2: TLabel;
    cxSelectPrinter: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxReportPropertiesChange(Sender: TObject);
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
   FILTER_ID_SESSION: integer;
   F_SCH: boolean;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  OstRepForm: TOstRepForm;

implementation

{$R *.dfm}
uses DateUtils;

procedure ShowRepOst(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TOstRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TOstRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
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
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OST;
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

procedure TOstRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYear.Value;
 MatasMonth:=cxMonth.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 DEND:=EndOfAMonth(MatasYear, MatasMonth);

 if cxReport.ItemIndex=0 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SEL_SALDO_FOR_JO_BY_PERIOD(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY GROUP_SCH_NUMBER, SCH_NUMBER, FIO, NAME_DEPARTMENT');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_by_sch.frf');
 end;

 if cxReport.ItemIndex=1 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SEL_SALDO_FOR_JO_BY_PERIOD(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY GROUP_SCH_NUMBER, FIO, NAME_DEPARTMENT, SCH_NUMBER');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_by_mo_sch.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=2 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SEL_SALDO_FOR_JO_BY_PERIOD(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY FIO, NAME_DEPARTMENT, GROUP_SCH_NUMBER, SCH_NUMBER');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_by_mo.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=3 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT s.ID_SCH, s.SCH_NUMBER, s.SCH_TITLE, s.BAL_ID_SCH, s.GROUP_SCH_NUMBER, s.GROUP_SCH_TITLE,');
   Add('sum(s.kol_mat) as kol_mat, sum(s.SUMMA) as summa');
   Add('FROM MAT_SEL_SALDO_FOR_JO_BY_PERIOD(:PDATE) s');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('GROUP BY s.ID_SCH, s.SCH_NUMBER, s.SCH_TITLE, s.BAL_ID_SCH, s.GROUP_SCH_NUMBER, s.GROUP_SCH_TITLE');
   Add('ORDER BY GROUP_SCH_NUMBER, SCH_NUMBER');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_by_itog.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=4 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   Add('ORDER BY FIO, NAME_DEPARTMENT, SCH_NUMBER, NAME, INVNUM, NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_full.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=5 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME, SUM(KOL_DRAG_MET)');
   Add('FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   Add('GROUP BY ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME');
   Add('ORDER BY FIO, NAME_DEPARTMENT, NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_itog1.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=6 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME, SUM(KOL_DRAG_MET)');
   Add('FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   Add('GROUP BY ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME');
   Add('ORDER BY NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_itog2.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=7 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO, NAME_DEPARTMENT, SCH_NUMBER, NAME, INVNUM, NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_full_sch.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=8 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME, SUM(KOL_DRAG_MET)');
   Add('FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('GROUP BY BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME');
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO, NAME_DEPARTMENT, NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_itog1_sch.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=9 then
 begin
  ReportDataSet.Close;
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT  BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME, SUM(KOL_DRAG_MET)');
   Add('FROM MAT_SEL_DRAG_MET_VED(:PDATE)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('GROUP BY BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ID_DRAG_MET, NAME_DRAG_MET, SHORT_NAME');
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, NAME_DRAG_MET');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.CloseOpen(false);
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ost_dragmet_itog2_sch.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 // frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 frVariables['PERIOD']:=DateToStr(DBEG);
 frVariables['ORG_NAME']:=_ORG_FULL_NAME;
 frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
 frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
 CloseWaitWindow(w);
 frOstReport.PrepareReport;
 if cxCopies.Value>1 then
  frOstReport.DefaultCopies:=cxCopies.Value;
 if cxCheckOnPrinter.Checked then
 begin
  if cxSelectPrinter.Checked then
   frOstReport.PrintPreparedReportDlg
  else
   frOstReport.PrintPreparedReport('', cxCopies.Value, false, frAll);
 end
 else
  frOstReport.ShowReport;
 if cxCheckBox1.Checked then
  frOstReport.DesignReport;
end;

procedure TOstRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOstRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOstRepForm.FormCreate(Sender: TObject);
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0; 
end;

procedure TOstRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOstRepForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxLookupSch.Text:='';
 end;
end;

procedure TOstRepForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
 end
end;

procedure TOstRepForm.cxReportPropertiesChange(Sender: TObject);
begin
 if (cxReport.ItemIndex>3) and (cxReport.ItemIndex<7) then
  cxLookupSch.Enabled:=false
 else
  cxLookupSch.Enabled:=true;
end;

procedure TOstRepForm.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.


