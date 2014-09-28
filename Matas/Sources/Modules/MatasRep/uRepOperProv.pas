{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOperProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, uMatasVars, uMatasUtils,
  ActnList, uSpMatSchMulti, cxButtonEdit;

procedure ShowRepOperProv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepOperProv;

type
  TOperRepForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    OperRepDataSet: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    cxCheckBox1: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    ItogRepDataset: TpFIBDataSet;
    frDBDataSet2: TfrDBDataSet;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    cxReport: TcxComboBox;
    Label2: TLabel;
    Label1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    Label5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   FILTER_ID_SESSION: integer;
   F_SCH: boolean;
   PERIOD: TDateTime;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  OperRepForm: TOperRepForm;

implementation

{$R *.dfm}
uses DateUtils;

procedure ShowRepOperProv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TOperRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TOperRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self. WorkTransaction.StartTransaction;
   Self.PERIOD:=PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OPER;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   MatasMonth:=dm;
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=MatasMonth-1;
   self.cxYearBeg.Value:=MatasYear;
   self.cxMonthEnd.ItemIndex:=MatasMonth-1;
   self.cxYearEnd.Value:=MatasYear;
 end;
end;

procedure TOperRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYearBeg.Value;
 MatasMonth:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 MatasYear:=cxYearEnd.Value;
 MatasMonth:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear, MatasMonth);

 if cxReport.ItemIndex=0 then
 begin
 //Отчет по операциям по МОЛам

  OperRepDataSet.Close;
  with OperRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT *');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('ORDER BY');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN');
  end;

  ItogRepDataset.Close;
  with ItogRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT DB_SCH, KR_SCH, SUM(SUMMA) as SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('GROUP BY 	DB_SCH, KR_SCH');
   Add('ORDER BY KR_SCH, DB_SCH');
  end;

  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  ItogRepDataset.Prepare;
  ItogRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  ItogRepDataSet.ParamByName('DATE_END').Value:=DEND;
  ItogRepDataSet.CloseOpen(false);

  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_rep_full.frf');
 end;

 if cxReport.ItemIndex=1 then
 begin
 //Отчет по операциям по МОЛам

  OperRepDataSet.Close;
  with OperRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH,');
   Add('	SUM(MAT_SEL_OPER_BY_PERIOD.SUMMA) as SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('GROUP BY 	MAT_SEL_OPER_BY_PERIOD.ID_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH');
   Add('ORDER BY');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN');
  end;

  ItogRepDataset.Close;
  with ItogRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT DB_SCH, KR_SCH, SUM(SUMMA) as SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('GROUP BY 	DB_SCH, KR_SCH');
   Add('ORDER BY KR_SCH, DB_SCH');
  end;

  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  ItogRepDataset.Prepare;
  ItogRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  ItogRepDataSet.ParamByName('DATE_END').Value:=DEND;
  ItogRepDataSet.CloseOpen(false);

  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_rep.frf');
 end;

  if cxReport.ItemIndex=2 then
 begin
 //Отчет по операциям по МОЛам

  OperRepDataSet.Close;
  with OperRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH,');
   Add('	SUM(MAT_SEL_OPER_BY_PERIOD.SUMMA) as SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('GROUP BY 	MAT_SEL_OPER_BY_PERIOD.ID_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.ID_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_ID_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH');
   Add('ORDER BY');
   Add('	MAT_SEL_OPER_BY_PERIOD.KR_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DB_SCH,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_OUT,');
   Add('	MAT_SEL_OPER_BY_PERIOD.FIO_MO_IN,');
   Add('	MAT_SEL_OPER_BY_PERIOD.DEP_MO_IN');
  end;

  ItogRepDataset.Close;
  with ItogRepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT DB_SCH, KR_SCH, SUM(SUMMA) as SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD(:DATE_BEG, :DATE_END)');
   if F_SCH then
   begin
    Add('WHERE (DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    Add('OR (KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add('GROUP BY 	DB_SCH, KR_SCH');
   Add('ORDER BY KR_SCH, DB_SCH');
  end;

  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  ItogRepDataset.Prepare;
  ItogRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  ItogRepDataSet.ParamByName('DATE_END').Value:=DEND;
  ItogRepDataSet.CloseOpen(false);

  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_rep_itog.frf');
 end;

 if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
  frVariables['PERIOD']:=AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)
 else
  frVariables['PERIOD']:='ПЕРІОД З '+AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)+' ПО '+AnsiUpperCase(cxMonthEnd.Text)+' '+IntToStr(cxYearEnd.Value);
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

procedure TOperRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOperRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOperRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOperRepForm.FormCreate(Sender: TObject);
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
 cxReport.ItemIndex:=0;
end;

procedure TOperRepForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
 end
end;

procedure TOperRepForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
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

procedure TOperRepForm.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.
