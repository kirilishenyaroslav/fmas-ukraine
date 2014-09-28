{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOper51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList;

procedure ShowRepOper51(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepOper51;

type
  TOperRep51Form = class(TForm)
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
  OperRep51Form: TOperRep51Form;

implementation

{$R *.dfm}
uses DateUtils;

procedure ShowRepOper51(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TOperRep51Form.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TOperRep51Form.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
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
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_DJO;
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

procedure TOperRep51Form.OkButtonClick(Sender: TObject);
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
 if cxReport.ItemIndex=0 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER51_BY_PERIOD(:DATE_BEG, :DATE_END, :TIP)');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.ParamByName('TIP').Value:=1;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;
 if cxReport.ItemIndex=1 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER51_BY_PERIOD(:DATE_BEG, :DATE_END, :TIP)');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.ParamByName('TIP').Value:=2;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=2 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1');
   Add('ORDER BY BAL_DB_SCH_NUMBER, SFIO_MO_IN, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=3 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0');
   Add('ORDER BY BAL_KR_SCH_NUMBER, SFIO_MO_OUT, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=4 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1 AND id_mo_in in (select id_mo from mat_sp_mo where is_sklad=1)');
   Add('ORDER BY BAL_DB_SCH_NUMBER, SFIO_MO_IN, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=5 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0 AND id_mo_out in (select id_mo from mat_sp_mo where is_sklad=1)');
   Add('ORDER BY BAL_KR_SCH_NUMBER, SFIO_MO_OUT, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=6 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1 AND id_mo_in in (select id_mo from mat_sp_mo where is_sklad=0)');
   Add('ORDER BY BAL_DB_SCH_NUMBER, SFIO_MO_IN, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=7 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0 AND id_mo_out in (select id_mo from mat_sp_mo where is_sklad=0)');
   Add('ORDER BY BAL_KR_SCH_NUMBER, SFIO_MO_OUT, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2f.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=8 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1 AND id_mo_in in (select id_mo from mat_sp_mo where is_sklad=1)');
   Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, SFIO_MO_IN, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1s.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=9 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0 AND id_mo_out in (select id_mo from mat_sp_mo where is_sklad=1)');
   Add('ORDER BY BAL_KR_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_NUMBER, SFIO_MO_OUT, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2s.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=10 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1 AND id_mo_in in (select id_mo from mat_sp_mo where is_sklad=0)');
   Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, SFIO_MO_IN, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1s.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=11 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0 AND id_mo_out in (select id_mo from mat_sp_mo where is_sklad=0)');
   Add('ORDER BY BAL_KR_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_NUMBER, SFIO_MO_OUT, TIPD, NUM_DOC');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2s.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=12 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT BAL_DB_SCH_NUMBER, BAL_DB_ID_SCH, DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, SUM(SUMMA) AS SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1');
   Add('GROUP BY BAL_DB_SCH_NUMBER, BAL_DB_ID_SCH, DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER');
   Add('ORDER BY BAL_DB_SCH_NUMBER');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo1i.frf');
  frVariables['PERIOD']:=cxMonth.Text+' '+IntToStr(cxYear.Value);
 end;

 if cxReport.ItemIndex=13 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT BAL_KR_SCH_NUMBER, BAL_KR_ID_SCH, DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, SUM(SUMMA) AS SUMMA');
   Add('FROM MAT_SEL_OPER_BY_PERIOD_EX(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0');
   Add('GROUP BY BAL_KR_SCH_NUMBER, BAL_KR_ID_SCH, DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER');
   Add('ORDER BY BAL_KR_SCH_NUMBER');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_jo2i.frf');
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

procedure TOperRep51Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOperRep51Form.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOperRep51Form.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
end;

procedure TOperRep51Form.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOperRep51Form.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.


