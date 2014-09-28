{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepSchOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, uMatasVars, FIBQuery,
  pFIBQuery, pFIBStoredProc, uMatasUtils, cxButtonEdit,
  uSpMatSchEx, uSpMatOtv, uSpMatSchMulti, ActnList, frxExportRTF, frxClass,
  frxExportXLS, frxDesgn, frxDBSet;

procedure ShowRepSchOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepSchOborot;

type
  TSchOborotRepForm = class(TForm)
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    CancelButton: TcxButton;
    Label1: TLabel;
    RepDataSet: TpFIBDataSet;
    cxCheckBox1: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    cxReport: TcxComboBox;
    Label2: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    Label3: TLabel;
    cxMatOtv: TcxButtonEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    cxGroupOnPage: TcxCheckBox;
    Label5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frReport1: TfrReport;
    OkButton: TcxButton;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxReportPropertiesChange(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth1, MatasYear1: Word;
   MatasMonth2, MatasYear2: Word;
   PERIOD: TDateTime;
   ID_SESSION: integer;
   ID_SCH, TIP_SCH: integer;
   ID_MO: integer;
   FILTER_ID_SESSION: integer;
   F_SCH, F_MO: boolean;
   Reports: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  SchOborotRepForm: TSchOborotRepForm;

implementation

{$R *.dfm}
uses DateUtils;

procedure ShowRepSchOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TSchOborotRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TSchOborotRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
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
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OOV ;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear1:=dy;
   MatasMonth1:=dm;
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=MatasMonth1-1;
   self.cxYearBeg.Value:=MatasYear1;
   self.cxMonthEnd.ItemIndex:=MatasMonth1-1;
   self.cxYearEnd.Value:=MatasYear1;
 end;
 ID_SESSION:=0;
end;

procedure TSchOborotRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
 period_str:string;
begin
 if (cxReport.ItemIndex>=8) and (not F_SCH) then
 begin
   ShowMessage('Необхідно вибрати рахунок!');
   Exit;
 end;
 w:=ShowWaitWindow(self);
 MatasYear1:=cxYearBeg.Value;
 MatasMonth1:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
 MatasYear2:=cxYearEnd.Value;
 MatasMonth2:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear2, MatasMonth2);

 if cxReport.ItemIndex=0 then begin
   cxMatOtv.Text:='';
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_OBOROT_2(:PDATE_BEG, :PDATE_END, 0)');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Print_oborot.fr3');
 end;

  if cxReport.ItemIndex=1 then begin
  cxMatOtv.Text:='';
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_OBOROT_2(:PDATE_BEG, :PDATE_END, 0)');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Print_oborot3.fr3');
 end;

 if cxReport.ItemIndex=2 then begin
   cxMatOtv.Text:='';
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_OBOROT_2(:PDATE_BEG, :PDATE_END, 1)');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Print_oborot.fr3');
 end;

 if cxReport.ItemIndex=3 then begin
   cxMatOtv.Text:='';
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_OBOROT_SIMPLE_2(:PDATE_BEG, :PDATE_END, 0)');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Print_oborot2.fr3');
 end;

 if cxReport.ItemIndex=4 then begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_COMMON_OBOROT_2(:PDATE_BEG, :PDATE_END)');
   Add('WHERE ID_MO>0');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('AND ID_SCH='+IntToStr(ID_SCH))
    else
     Add('AND BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('AND (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   if ID_MO>0 then
    Add('AND ID_MO='+IntToStr(ID_MO));
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO, TIP');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
 ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mol_oborot.fr3');
 end;

 if cxReport.ItemIndex=5 then begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_COMMON_OBOROT_2(:PDATE_BEG, :PDATE_END)');
   Add('WHERE ID_MO>0');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('AND ID_SCH='+IntToStr(ID_SCH))
    else
     Add('AND BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('AND (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   if ID_MO>0 then
    Add('AND ID_MO='+IntToStr(ID_MO));
   Add('ORDER BY FIO, SCH_NUMBER, TIP');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mol_oborot2.fr3');
 end;

  if cxReport.ItemIndex=6 then begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_SESSION, BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE,');
   Add('       ID_SCH, ID_MO, FIO, SFIO, NAME_DEPARTMENT, SCH_TITLE, SCH_NUMBER,');
   Add('       SUM(KOL_MAT_IN) AS KOL_MAT_IN, SUM(SUMMA_IN) AS SUMMA_IN, SUM(DB_KOL_MAT), SUM(DB_SUMMA),');
   Add('       SUM(DB_KOL_MAT) AS DB_KOL_MAT, SUM(DB_SUMMA) AS DB_SUMMA,');
   Add('       SUM(KR_KOL_MAT) AS KR_KOL_MAT, SUM(KR_SUMMA) AS KR_SUMMA,');
   Add('       SUM(SUMMA_OUT)  AS SUMMA_OUT, SUM(KOL_MAT_OUT) AS KOL_MAT_OUT');
   Add(' FROM MAT_GET_COMMON_OBOROT_2(:PDATE_BEG, :PDATE_END)');
   Add('WHERE ID_MO>0');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('AND ID_SCH='+IntToStr(ID_SCH))
    else
     Add('AND BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('AND (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   if ID_MO>0 then
    Add('AND ID_MO='+IntToStr(ID_MO));
   Add(' GROUP BY ID_SESSION, BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE,');
   Add('       ID_SCH, ID_MO, FIO, SFIO, NAME_DEPARTMENT, SCH_TITLE, SCH_NUMBER');
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mol_oboroti.fr3');
 end;

  if cxReport.ItemIndex=7 then begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_SESSION, BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE,');
   Add('       ID_SCH, SCH_TITLE, SCH_NUMBER,');
   Add('       SUM(KOL_MAT_IN) AS KOL_MAT_IN, SUM(SUMMA_IN) AS SUMMA_IN, SUM(DB_KOL_MAT), SUM(DB_SUMMA),');
   Add('       SUM(DB_KOL_MAT) AS DB_KOL_MAT, SUM(DB_SUMMA) AS DB_SUMMA,');
   Add('       SUM(KR_KOL_MAT) AS KR_KOL_MAT, SUM(KR_SUMMA) AS KR_SUMMA,');
   Add('       SUM(SUMMA_OUT)  AS SUMMA_OUT, SUM(KOL_MAT_OUT) AS KOL_MAT_OUT');
   Add(' FROM MAT_GET_COMMON_OBOROT_2(:PDATE_BEG, :PDATE_END)');
   Add('WHERE ID_MO>0');
   if ID_SCH>0 then
   begin
    if TIP_SCH=1 then
     Add('AND ID_SCH='+IntToStr(ID_SCH))
    else
     Add('AND BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   if F_SCH then
   begin
    Add('AND (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
   end;
   Add(' GROUP BY ID_SESSION, BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE,');
   Add('       ID_SCH, SCH_TITLE, SCH_NUMBER');
   Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  ID_SESSION:=RepDataSet.FieldByName('ID_SESSION').AsInteger;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\sch_oboroti.fr3');
 end;

 if cxReport.ItemIndex=8 then
 begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_OBOROT_BY_PERIOD_DM(:PDATE_BEG, :PDATE_END, :PID_FILTER)');
   Add('ORDER BY SCH_NUMBER, FIO, NAME_GROUP1, NAME');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  if F_SCH then
    RepDataSet.ParamByName('PID_FILTER').Value:=FILTER_ID_SESSION
  else
    RepDataSet.ParamByName('PID_FILTER').Value:=null;
  RepDataSet.CloseOpen(false);
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oborot_drag_met.fr3');
 end;

 if cxReport.ItemIndex=9 then
 begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_SCH, SCH_NUMBER, ID_MO, FIO, NAME_DEPARTMENT, ID_GROUP_1, NAME_GROUP1, ');
   Add('sum(Kol_Beg) as KOL_BEG, sum(Kol_Prh) as KOL_PRH,');
   Add('sum(Kol_Rsh) as KOL_RSH, sum(Kol_Ost) as KOL_OST');
   Add('FROM MAT_MAKE_OBOROT_BY_PERIOD_DM(:PDATE_BEG, :PDATE_END, :PID_FILTER)');
   Add('GROUP BY ID_SCH, SCH_NUMBER, ID_MO, FIO, NAME_DEPARTMENT, ID_GROUP_1, NAME_GROUP1 ');
   Add('ORDER BY SCH_NUMBER, FIO, NAME_GROUP1');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  if F_SCH then
    RepDataSet.ParamByName('PID_FILTER').Value:=FILTER_ID_SESSION
  else
    RepDataSet.ParamByName('PID_FILTER').Value:=null;
  RepDataSet.CloseOpen(false);
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\itog_oborot_drag_met.fr3');
 end;

 if cxReport.ItemIndex=10 then
 begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT ID_SCH, SCH_NUMBER, ID_GROUP_1, NAME_GROUP1, ');
   Add('sum(Kol_Beg) as KOL_BEG, sum(Kol_Prh) as KOL_PRH, ');
   Add('sum(Kol_Rsh) as KOL_RSH, sum(Kol_Ost) as KOL_OST');
   Add('FROM MAT_MAKE_OBOROT_BY_PERIOD_DM(:PDATE_BEG, :PDATE_END, :PID_FILTER)');
   Add('GROUP BY ID_SCH, SCH_NUMBER, ID_GROUP_1, NAME_GROUP1');
   Add('ORDER BY SCH_NUMBER');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  if F_SCH then
    RepDataSet.ParamByName('PID_FILTER').Value:=FILTER_ID_SESSION
  else
    RepDataSet.ParamByName('PID_FILTER').Value:=null;
  RepDataSet.CloseOpen(false);
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\itog_oborot_drag_met_1.fr3');
 end;

 if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
 period_str:=AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)
 else   period_str:='ПЕРІОД З '+AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)+' ПО '+AnsiUpperCase(cxMonthEnd.Text)+' '+IntToStr(cxYearEnd.Value);
 frxReport1.Variables['PERIOD']:=''''+period_str+'''';
 frxReport1.Variables['DATE_BEG']:=''''+DateToStr(DBEG)+'''';
 frxReport1.Variables['DATE_END']:=''''+DateToStr(IncDay(DEND))+'''';
 frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
 frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
 frxReport1.Variables['FORM_NEW_PAGE']:=BoolToInt(cxGroupOnPage.Checked);
 CloseWaitWindow(w);
 
 frxReport1.PrepareReport;
 if cxCopies.Value>1 then
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
 if cxCheckOnPrinter.Checked then
 begin
  if cxSelectPrinter.Checked then
   frxReport1.PrintOptions.ShowDialog:=True
  else
   frxReport1.Print;
 end
 else
 if cxCheckBox1.Checked then
   frxReport1.DesignReport
 else frxReport1.ShowReport;    
end;

procedure TSchOborotRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_SCH_OBOROT'); // WHERE ID_SESSION='+IntToStr(ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_MO_OBOROT'); // WHERE ID_SESSION='+IntToStr(ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_FILTER WHERE ID_SESSION='+IntToStr(FILTER_ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 if FormStyle = fsMDIChild then Action := caFree; 
end;

procedure TSchOborotRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TSchOborotRepForm.FormCreate(Sender: TObject);
var
 Res: Variant;
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
 F_MO:=false;
// LoadReportsTocxComboBox(self, DBHANDLE, 'SCH_OBOROT', cxReport, Res);
 cxReport.ItemIndex:=0;
end;

procedure TSchOborotRepForm.cxLookupSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  ID_SCH:=0;
  F_SCH:=false;
 end
end;

procedure TSchOborotRepForm.cxLookupSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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

procedure TSchOborotRepForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_ESCAPE) then
  Close;
end;

procedure TSchOborotRepForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end
end;

procedure TSchOborotRepForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res : Variant;
begin
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then
 begin
  ID_MO:=Res[0];
  cxMatOtv.Text:=VarToStr(Res[1])+' / '+VarToStr(Res[2]);
 end
 else
  ID_MO:=0;
end;

procedure TSchOborotRepForm.cxReportPropertiesChange(Sender: TObject);
begin
if (cxReport.ItemIndex>2) and (cxReport.ItemIndex<6) then
 cxMatOtv.Enabled:=true
else
begin
 cxMatOtv.Enabled:=false;
 cxMatOtv.Text:='';
end;
{ if cxReport.ItemIndex=2 then begin
  cxMonthEnd.ItemIndex:=cxMonthBeg.ItemIndex;
  cxYearEnd.Value:=cxYearBeg.Value;
 end
}
end;

procedure TSchOborotRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TSchOborotRepForm.ActionOkExecute(Sender: TObject);
begin
 OkButton.Click;
end;

end.
