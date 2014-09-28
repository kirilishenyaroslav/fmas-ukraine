{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль анализа операций                                }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepAnalize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR;

procedure ShowRepAnalize(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

exports ShowRepAnalize;

type
  TRepAnalizeForm = class(TForm)
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
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
    CBDeb: TcxCheckBox;
    CBKred: TcxCheckBox;
    CBBut: TcxCheckBox;
    CBStatRoz: TcxCheckBox;
    CBKek: TcxCheckBox;
    BEDeb: TcxButtonEdit;
    BEKred: TcxButtonEdit;
    BEBut: TcxButtonEdit;
    BEStatRoz: TcxButtonEdit;
    BEKek: TcxButtonEdit;
    Label3: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure CBDebPropertiesChange(Sender: TObject);
    procedure CBKredPropertiesChange(Sender: TObject);
    procedure CBButPropertiesChange(Sender: TObject);
    procedure CBStatRozPropertiesChange(Sender: TObject);
    procedure CBKekPropertiesChange(Sender: TObject);
    procedure BEDebPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKredPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKekPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEButPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyFilter;
    procedure BEStatRozPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
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
   ID_SESSION:Integer;// содержит  идентификатор  сессии

   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

var
  RepAnalizeForm: TRepAnalizeForm;

implementation

{$R *.dfm}
uses DateUtils, uPackageManager;

procedure ShowRepAnalize(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TRepAnalizeForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TRepAnalizeForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=_MATAS_PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OBR;
   DecodeDate(Self.PERIOD, dy, dm,  dd);
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

   self.CBDeb.Checked:=false;
   self.CBKred.Checked:=false;
   self.CBBut.Checked:=false;
   self.CBStatRoz.Checked:=false;
   self.CBKek.Checked:=false;

   self.BEDeb.Enabled:=false;
   self.BEKred.Enabled:=false;
   self.BEBut.Enabled:=false;
   self.BEStatRoz.Enabled:=false;
   self.BEKek.Enabled:=false;

   self.BEDeb.Text:='';
   self.BEKred.Text:='';
   self.BEBut.Text:='';
   self.BEStatRoz.Text:='';
   self.BEKek.Text:='';

   ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1,WorkTransaction);
 end;
end;

procedure TRepAnalizeForm.ApplyFilter;
begin
 if CBDeb.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=6 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
 end;
 if CBKred.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=7 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
 end;
 if CBBut.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND (DB_ID_SM IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=8 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
  OperRepDataSet.SelectSQL.Add('OR KR_ID_SM IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=8 AND ID_SESSION='+IntToStr(ID_SESSION)+'))');
 end;
 if CBKek.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND (DB_ID_KEKV IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=10 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
  OperRepDataSet.SelectSQL.Add('OR KR_ID_KEKV IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=10 AND ID_SESSION='+IntToStr(ID_SESSION)+'))');
 end;

 if CBStatRoz.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND (DB_ID_ST IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=9 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
  OperRepDataSet.SelectSQL.Add('OR KR_ID_ST IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=9 AND ID_SESSION='+IntToStr(ID_SESSION)+'))');
 end;

end;

procedure TRepAnalizeForm.OkButtonClick(Sender: TObject);
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

   ApplyFilter;

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

   ApplyFilter;

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
 end;

 if cxReport.ItemIndex=4 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=1');

   ApplyFilter;

   Add('ORDER BY BAL_KR_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_FOND_NUMBER, DB_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if1f.frf');
 end;

 if cxReport.ItemIndex=5 then
 begin
  with OperRepDataSet.SelectSQL do begin
   Add('SELECT * FROM MAT_SEL_OPER_ISTFIN_BY_PERIOD(:DATE_BEG, :DATE_END)');
   Add('WHERE CR_BY_DT=0');

   ApplyFilter;

   Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, KR_SCH_NUMBER, KR_FOND_NUMBER, KR_ISTFIN ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oper_if2f.frf');
 end;

 if (cxReport.ItemIndex=6) then
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

   ApplyFilter;

   Add('GROUP BY DB_ID_SCH, KR_ID_SCH, DB_SCH_NUMBER, KR_SCH_NUMBER, DB_SCH_TITLE, KR_SCH_TITLE,');
   Add('       BAL_DB_ID_SCH, BAL_DB_SCH_NUMBER, BAL_DB_SCH_TITLE,');
   Add('       BAL_KR_ID_SCH, BAL_KR_SCH_NUMBER, BAL_KR_SCH_TITLE,');
   Add('       DB_ID_FOND, KR_ID_FOND, DB_FOND_NUMBER, KR_FOND_NUMBER, DB_FOND_TITLE, KR_FOND_TITLE,');
   Add('       DB_ID_SM, DB_SM_TITLE, DB_SM_KOD, DB_ID_RZ, DB_RZ_TITLE, DB_RZ_KOD,');
   Add('       DB_ID_ST, DB_ST_TITLE, DB_ST_KOD, DB_ID_KEKV, DB_KEKV_TITLE, DB_KEKV_KOD,');
   Add('       KR_ID_SM, KR_SM_TITLE, KR_SM_KOD, KR_ID_RZ, KR_RZ_TITLE, KR_RZ_KOD,');
   Add('       KR_ID_ST, KR_ST_TITLE, KR_ST_KOD, KR_ID_KEKV, KR_KEKV_TITLE, KR_KEKV_KOD,');
   Add('       DB_ISTFIN, KR_ISTFIN');
   Add('ORDER BY DB_SCH_NUMBER, DB_RZ_KOD, KR_SCH_NUMBER, DB_SM_KOD, DB_ST_KOD, DB_KEKV_KOD ');
  end;
  OperRepDataSet.Prepare;
  OperRepDataSet.ParamByName('DATE_BEG').Value:=DBEG;
  OperRepDataSet.ParamByName('DATE_END').Value:=DEND;
  OperRepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\rep_oper_out.frf');
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

procedure TRepAnalizeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TRepAnalizeForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
end;

procedure TRepAnalizeForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeForm.CBDebPropertiesChange(Sender: TObject);
begin
  BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TRepAnalizeForm.CBKredPropertiesChange(Sender: TObject);
begin
  BEKred.Enabled:=CBKred.Checked;
end;

procedure TRepAnalizeForm.CBButPropertiesChange(Sender: TObject);
begin
  BEBut.Enabled:=CBBut.Checked;
end;

procedure TRepAnalizeForm.CBStatRozPropertiesChange(Sender: TObject);
begin
  BEStatRoz.Enabled:=CBStatRoz.Checked;
end;

procedure TRepAnalizeForm.CBKekPropertiesChange(Sender: TObject);
begin
  BEKek.Enabled:=CBKek.Checked;
end;

procedure TRepAnalizeForm.BEDebPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);

begin
 // FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,6,PERIOD,'дебету рахунків');

  BEDeb.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,6,PERIOD,'дебету рахунків'));

end;

procedure TRepAnalizeForm.BEKredPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,7,PERIOD,'кредиту рахунків');
//  FM.ShowModal;
  BEKred.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,7,PERIOD,'кредиту рахунків'));

end;


procedure TRepAnalizeForm.BEKekPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,10,PERIOD,'КЕКВам');
//  FM.ShowModal;
  BEKek.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,10,PERIOD,'КЕКВам'));
 // FM.Free;
end;

procedure TRepAnalizeForm.BEButPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 // FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,8,PERIOD,'бюджетам');
//  FM.ShowModal;
  BEBut.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,8,PERIOD,'бюджетам'));

end;

procedure TRepAnalizeForm.BEStatRozPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,9,PERIOD,'статтям/розділам');
//  FM.ShowModal;
  BEStatRoz.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,9,PERIOD,'статтям/розділам'));
end;

procedure TRepAnalizeForm.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.


