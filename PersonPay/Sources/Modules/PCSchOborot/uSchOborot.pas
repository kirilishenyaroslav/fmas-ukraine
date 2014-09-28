unit uSchOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxSpinEdit, cxDropDownEdit, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, DateUtils, ibase, uMainPerem,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, cxLookAndFeelPainters,
  cxButtons, RxMemDS, frxClass, frxDBSet, frxDesgn, cxCheckBox, frxChart,
  frxCross, ComCtrls, Printers, frxExportPDF, frxExportXLS, frxExportRTF ;

type
  TSchOborotForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbl3: TLabel;
    cxCheckEdit: TcxCheckBox;
    DataSetFullSch: TpFIBDataSet;
    DataSetFullSchS1: TFIBBCDField;
    DataSetFullSchS2: TFIBBCDField;
    DataSetFullSchS3: TFIBBCDField;
    DataSetFullSchS4: TFIBBCDField;
    ds_podchin_1: TpFIBDataSet;
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl2: TLabel;
    lbl4: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    lbl1: TLabel;
    cxSch: TcxButtonEdit;
    DatabaseWork: TpFIBDatabase;
    DataSetWork: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    actlst1: TActionList;
    actClose: TAction;
    actPrint: TAction;
    actdesigne: TAction;
    StPr: TpFIBStoredProc;
    RxMemoryData: TRxMemoryData;
    cxPrintForm: TcxComboBox;
    lbl5: TLabel;
    chbPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    chbChoosePrinter: TcxCheckBox;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxDBDataset2: TfrxDBDataset;
    ds_podchin: TpFIBDataSet;
    frxDBDataset3: TfrxDBDataset;
    ts2: TTabSheet;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    cx_1: TcxComboBox;
    cx_2: TcxComboBox;
    cx_3: TcxComboBox;
    cx_4: TcxComboBox;
    cb_4: TcxCheckBox;
    cb_3: TcxCheckBox;
    cb_2: TcxCheckBox;
    cb_1: TcxCheckBox;
    frxReport: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    procedure cxSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actPrintExecute(Sender: TObject);
    procedure actdesigneExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxPrintFormPropertiesChange(Sender: TObject);
    procedure cb_1PropertiesChange(Sender: TObject);
    procedure cb_2PropertiesChange(Sender: TObject);
    procedure cb_3PropertiesChange(Sender: TObject);
    procedure cb_4PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cx_1PropertiesChange(Sender: TObject);
    procedure cx_2PropertiesChange(Sender: TObject);
    procedure cx_3PropertiesChange(Sender: TObject);
    procedure cx_4PropertiesChange(Sender: TObject);

  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    Sch_array:array of Integer;
    DATE_REC, DBEG, DEND:TDateTime;
    on_calc:Integer;
    ID_SES, id_session:Integer;
    is_come:Integer;
    it_ind, it_year, it_ind1, it_year1:Integer;
    PCMonth, PCYear: Word;
    chose_sch:Integer;
    IN_DB_SUMMA, IN_KR_SUMMA, OUT_DB_SUMMA, OUT_KR_SUMMA: double;
    new_, old_:Integer;
    grupp:array of Integer;
    procedure MakeReport;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;

  end;

  procedure ShowSchOborotForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowSchOborotForm;

var
  SchOborotForm: TSchOborotForm;

implementation

{$R *.dfm}
uses uSpSch, uWate;

constructor TSchOborotForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
var DATE_REC:TDateTime;
    month, year:Word;
    i:Integer;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.DatabaseWork.Close;
  Self.DatabaseWork.Handle:=DBHANDLE;

  month:=MonthOf(PERS_PAY_PERIOD);
  year:=YearOf(PERS_PAY_PERIOD);
  Self.cxMonthBeg.ItemIndex:=month-1;
  Self.cxMonthEnd.ItemIndex:=month-1;
  it_ind:=month;
  it_ind1:=month;
  Self.cxYearBeg.value:=year;
  Self.cxYearEnd.value:=year;
  it_year:=year;
  it_year1:=year;

  Self.cxPrintForm.ItemIndex:=0;

  is_come:=0;
  on_calc:=0;
  chose_sch:=0;

  chbChoosePrinter.Checked:=True;

  
 end;
end;


procedure TSchOborotForm.cxSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var Year, Month: Word;
      f:TSpSchForm;
      i:Integer;
begin
chose_sch:=1;
PCYear:=cxYearBeg.Value;
PCMonth:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(PCYear, PCMonth);
PCYear:=cxYearEnd.Value;
PCMonth:=cxMonthEnd.ItemIndex+1;
DEND:=EndOfAMonth(PCYear, PCMonth);
on_calc:=on_calc+1;
f:=TSpSchForm.Create(Self, DBHANDLE, DBEG, DEND, on_calc);
f.DS.Open;
RxMemoryData.Open;
 while not f.DS.Eof do
 begin
  if not RxMemoryData.Locate('SCH_NUMBER',f. DS['SCH_NUMBER'],[loCaseInsensitive]) then
  begin
   RxMemoryData.Append;
   rxMemoryData.FieldByName('SCH_NUMBER').AsString:= f.DS['SCH_NUMBER'];
   RxMemoryData.FieldByName('SCH_TITLE').AsString:=f.DS['SCH_TITLE'];
   RxMemoryData.FieldByName('ID_SCH').value:=f.DS['ID_SCH'];
   if on_calc = 1 then
   RxMemoryData.FieldByName('ON_CHECK').value:=0;
   RxMemoryData.Post;
  end;
  f.DS.Next;
 end;
f.DS.Close;
f.ShowModal;
if f.ModalResult = mrOk then
begin
 cxSch.Text:='';
 RXMemoryData.Open;
 RXMemoryData.first;
 while not RXMemoryData.Eof do
 begin
  if RXMemoryData.FieldByName('ON_CHECK').Value = 1 then
  cxSch.Text:=cxSch.Text + RxMemoryData.FieldByName('SCH_NUMBER').Value+' ';
  RXMemoryData.Next;
 end;
end;
f.Free;
end;

procedure TSchOborotForm.FormCreate(Sender: TObject);
var month, year:Word;
begin
{   DBHANDLE:= MAIN_DB_HANDLE;
   DatabaseWork.Close;
   DatabaseWork.Handle:= MAIN_DB_HANDLE;

   month:=MonthOf(PERS_PAY_PERIOD);
   year:=YearOf(PERS_PAY_PERIOD);
   cxMonthBeg.ItemIndex:=month-1;
   cxMonthEnd.ItemIndex:=month-1;
   it_ind:=month;
   it_ind1:=month;
   cxYearBeg.value:=year;
   cxYearEnd.value:=year;
   it_year:=year;
   it_year1:=year;

{   RxMemoryData.Close;
   RxMemoryData.FieldDefs.Add('ID_SCH', ftInteger, 0, True);
   RxMemoryData.FieldDefs.Add('SCH_TITLE', ftSTRING, 60, True);
   RxMemoryData.FieldDefs.Add('SCH_NUMBER', ftstring, 30, True);
   RxMemoryData.FieldDefs.Add('ON_CHECK', ftInteger, 0, True);  }
{   RXMemoryData.Open;
   RXMemoryData.first;
   while not RXMemoryData.Eof do
   begin
    RXMemoryData.FieldByName('ON_CHECK').Value:= 0;
    RXMemoryData.Next;
   end;

   cxPrintForm.ItemIndex:=0;

   is_come:=0;
   on_calc:=0;
   chose_sch:=0;
 }
 cx_1.ItemIndex:=0;
 cx_2.ItemIndex:=1;
 cx_3.ItemIndex:=2;
 cx_4.ItemIndex:=3;
 cb_1.Checked:=True;
 cb_2.Checked:=True;
 cb_3.Checked:=True;
 cb_4.Checked:=True;
end;

procedure ShowSchOborotForm(AOwner:TComponent;  DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TSchOborotForm;
begin
 form := TSchOborotForm.Create(AOwner, DBHANDLE);
 Form.Show;// = mrOk then Form.free;;
// Form.Free;
end;

procedure TSchOborotForm.actCloseExecute(Sender: TObject);
begin
 Close;

end;

procedure TSchOborotForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
try
 StPr.Close;
 StPr.Transaction := Transaction;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StPr.Prepare;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ExecProc;
 StPr.Transaction.Commit;
 except on E : Exception
  do begin
  ShowMessage(E.Message);
  StPr.Transaction.Rollback;
  exit;
  end;
end;
//RXMemoryData.Close;
 CanClose:=True;
//SpSchForm.Free;
end;

procedure TSchOborotForm.actPrintExecute(Sender: TObject);
var Year, Month: Word;
      f:TSpSchForm;
      i, t:Integer;
      flag, flag_:Boolean;
      text_zapros, name_report, group_by, prefix, order_by: string;
      All_records: Integer;
      Wf:TWateForm;
      tip:string;

begin
 Wf:=TWateForm.Create(Self);
 Wf.cxLabel1.Caption:='';
 Wf.cxLabel1.Caption:='Увага! Триває збір даних за рахунками! ';
 Wf.Show;
 Wf.Update;
 if chose_sch = 0 then
 begin
 f:=TSpSchForm.Create(Self, DBHANDLE, DBEG, DEND, 1);
 f.DS.Open;
 RxMemoryData.Open;
  while not f.DS.Eof do
    begin
   if not RxMemoryData.Locate('SCH_NUMBER',f. DS['SCH_NUMBER'],[loCaseInsensitive]) then
   begin
    RxMemoryData.Append;
    rxMemoryData.FieldByName('SCH_NUMBER').AsString:= f.DS['SCH_NUMBER'];
    RxMemoryData.FieldByName('SCH_TITLE').AsString:=f.DS['SCH_TITLE'];
    RxMemoryData.FieldByName('ID_SCH').value:=f.DS['ID_SCH'];
    if on_calc = 1 then RxMemoryData.FieldByName('ON_CHECK').value:=0;
    RxMemoryData.Post;
   end;
   f.DS.Next;
  end;
 end;
is_come:=is_come+1;
All_records:=0;
if cxSch.Text='' then All_records:=1;
 ID_SES:=ID_SES_SCH_FOR_SYSTEM;
//заполняем временную таблицу счетов
 RXMemoryData.Open;
 RXMemoryData.first;
 while not RXMemoryData.Eof do
  begin
  try
   StPr.Close;
   StPr.Transaction := Transaction;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='PC_TMP_SCH_INS';
   StPr.Prepare;
   if All_records = 1 then StPr.ParamByName('ON_ADD').AsInteger:=1
   else StPr.ParamByName('ON_ADD').AsInteger:= RXMemoryData.FieldByName('ON_CHECK').Value;
   StPr.ParamByName('ID_SCH').AsInteger:=RxMemoryData.FieldByName('ID_SCH').Value;
   StPr.ParamByName('ID_SESSION').AsInteger:=ID_SES;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
  RXMemoryData.Next;
  end;

  if (is_come=1) or ((it_ind<>cxMonthBeg.ItemIndex+1) or (it_year<>cxYearBeg.value) or (it_ind1<>cxMonthEnd.ItemIndex+1) or (it_year1<>cxYearEnd.value)) then
  begin
   if (is_come>1) then
   begin
   try
    StPr.Close;
    StPr.Transaction := Transaction;
    StPr.Transaction.StartTransaction;
    StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
    StPr.Prepare;
    StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
    StPr.ExecProc;
    StPr.Transaction.Commit;
   except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
   end;
   end;
   it_ind:= cxMonthBeg.ItemIndex+1;
   it_year:= cxYearBeg.Value;
   it_ind1:= cxMonthEnd.ItemIndex+1;
   it_year1:= cxYearEnd.Value;
   PCYear:=cxYearBeg.Value;
   PCMonth:=cxMonthBeg.ItemIndex+1;
   DBEG:=StartOfAMonth(PCYear, PCMonth);
   PCYear:=cxYearEnd.Value;
   PCMonth:=cxMonthEnd.ItemIndex+1;
   DEND:=EndOfAMonth(PCYear, PCMonth);
  // выбираем сессию
  try
   StPr.Close;
   StPr.Transaction := Transaction;
   StPr.Transaction.StartTransaction;
   if IS_VALYUTA = 1 then
   StPr.StoredProcName:='PC_TMP_OBOROT_INS_UPD_VALUTE'
   else
   StPr.StoredProcName:='PC_TMP_OBOROT_INS_UPD';
   StPr.Prepare;
   StPr.ParamByName('DATE_BEG').Value:=DBEG;
   StPr.ParamByName('DATE_END').Value:=DEND;
   StPr.ParamByName('ID_REG').Value:=ID_REG;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
   id_session:=StPr.ParamByName('ID_SESSION').Value;
 end;
 DataSetWork.Close;
 DataSetWork.SelectSQL.Clear;
 if cxPrintForm.ItemIndex = 0 then
 begin
   text_zapros:='SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
   IF IS_VALYUTA = 1 then
   text_zapros:=text_zapros+' ,ID_VALUTE, CODE_VAL, NAME_VAL, SYMBOL, SUM(IN_DB_SUMMA_VAL) AS IN_D_S_V, SUM(IN_KR_SUMMA_VAL) AS IN_K_S_V, SUM(DB_SUMMA_VAL) AS D_S_V, SUM(KR_SUMMA_VAL) AS K_S_V, SUM(OUT_DB_SUMMA_VAL) AS OUT_D_S_V, SUM(OUT_KR_SUMMA_VAL) AS OUT_K_S_V';
   text_zapros:=text_zapros+' FROM PC_TMP_OBOROT_SELECT_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+' GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE ';
   if is_valyuta = 1 then text_zapros:=text_zapros+' ,ID_VALUTE, CODE_VAL, NAME_VAL, SYMBOL ';
   text_zapros:=text_zapros+' ORDER BY SCH_NUMBER';
   if is_valyuta = 1 then text_zapros:=text_zapros+' ,NAME_VAL';
   IF IS_VALYUTA = 1 then name_report:='\frSchCommonReportVal.fr3'
   else
   name_report:='\frSchCommonReport.fr3';
 end;
 if cxPrintForm.ItemIndex = 1 then
 begin
   text_zapros:=' SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros+' ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
   IF IS_VALYUTA = 1 then
   text_zapros:=text_zapros+ ' ,ID_VALUTE, CODE_VAL, NAME_VAL, SYMBOL, SUM(IN_DB_SUMMA_VAL) AS IN_D_S_V, SUM(IN_KR_SUMMA_VAL) AS IN_K_S_V, SUM(DB_SUMMA_VAL) AS D_S_V, SUM(KR_SUMMA_VAL) AS K_S_V, SUM(OUT_DB_SUMMA_VAL) AS OUT_D_S_V, SUM(OUT_KR_SUMMA_VAL) AS OUT_K_S_V ';
   text_zapros:=text_zapros+' FROM PC_TMP_OBOROT_SELECT_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+' GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros+' ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE ';
   if is_valyuta = 1 then text_zapros:=text_zapros+' ,ID_VALUTE, CODE_VAL, NAME_VAL, SYMBOL ';
   text_zapros:=text_zapros+' ORDER BY SCH_NUMBER';
   if is_valyuta = 1 then text_zapros:=text_zapros+' ,NAME_VAL';
   if IS_VALYUTA=1 then name_report:='\frSchIstFinReportVal.fr3'
   else
   name_report:='\frSchIstFinReport.fr3';
 end;
 if ((cxPrintForm.ItemIndex = 2) or(cxPrintForm.ItemIndex =7))  then
 begin
   text_zapros:='SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros+'ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE, ID_DOG, KOD_DOG, FIO, N_DOG, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
   if is_valyuta=1 then
   text_zapros:=text_zapros+' ,ID_VALUTE, NAME_VAL, CODE_VAL, SYMBOL, SUM(IN_DB_SUMMA_VAL) AS IN_D_S_V, SUM(IN_KR_SUMMA_VAL) AS IN_K_S_V, SUM(DB_SUMMA_VAL) AS D_S_V, SUM(KR_SUMMA_VAL) AS K_S_V, SUM(OUT_DB_SUMMA_VAL) AS OUT_D_S_V, SUM(OUT_KR_SUMMA_VAL) AS OUT_K_S_V  ';
   text_zapros:=text_zapros+' FROM PC_TMP_OBOROT_SELECT_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+' GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros+' ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE, ID_DOG, KOD_DOG, FIO, N_DOG ';
   if is_valyuta=1 then
   text_zapros:=text_zapros+' ,ID_VALUTE, NAME_VAL, CODE_VAL,  SYMBOL ';
   text_zapros:=text_zapros+' ORDER BY SCH_NUMBER, FIO, N_DOG';
   if is_valyuta = 1 then
   text_zapros:=text_zapros+' ,NAME_VAL';
   if cxPrintForm.ItemIndex = 2 then
   if is_valyuta=1 then
   name_report:='\frSchIstFinFIOReportVal.fr3'
   else
   name_report:='\frSchIstFinFIOReport.fr3';
   if cxPrintForm.ItemIndex = 7 then
   if is_valyuta=1 then
   name_report:='\frSchIstFinFIOReportWithoutDogVal.fr3'
   else
   name_report:='\frSchIstFinFIOReportWithoutDog.fr3';
 end;
 if cxPrintForm.ItemIndex = 3 then
 begin
   if is_valyuta=1 then
   begin
   text_zapros:= 'SELECT ID_PC_TMP, ID_DOG, KOD_DOG ,IN_DB_SUMMA, IN_KR_SUMMA, ';
   text_zapros:=text_zapros + 'OUT_DB_SUMMA, OUT_KR_SUMMA, DB_SUMMA_DOC, KR_SUMMA_DOC, ';
   text_zapros:=text_zapros + 'ID_SM, ID_RZ, ID_ST, ID_KEKV, SM_TITLE, SM_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros + 'RZ_KOD, ST_TITLE, ST_KOD, KEKV_TITLE, KEKV_KOD, FIO, N_DOG, DB_PK_ID, ';
   text_zapros:=text_zapros + 'DB_NUM_DOC, DB_SUMMA, DB_DATE_DOC, KR_PK_ID, KR_NUM_DOC, KR_SUMMA, KR_DATE_DOC, N_LINE1, N_LINE2,';
   text_zapros:=text_zapros + 'cor_kr_id_sch, cor_kr_sch_number, cor_kr_sch_title, cor_db_id_sch, ';
   text_zapros:=text_zapros + 'cor_db_sch_number, cor_db_sch_title, osn_id_sch, osn_sch_number, osn_sch_title, ';
   text_zapros:=text_zapros + ' in_db_summa_val, in_kr_summa_val, db_summa_doc_val, kr_summa_doc_val, out_db_summa_val, out_kr_summa_val, db_summa_val, kr_summa_val ,name_val, code_val, symbol ';
   text_zapros:=text_zapros + 'FROM PC_FULL_REPORT_FOR_SCH_VAL(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+'ORDER BY OSN_SCH_NUMBER, NAME_VAL, FIO';
   name_report:='\frFullSchReportVal.fr3';
   end
   else
   begin
   text_zapros:= 'SELECT ID_PC_TMP, ID_DOG, KOD_DOG ,IN_DB_SUMMA, IN_KR_SUMMA, ';
   text_zapros:=text_zapros + 'OUT_DB_SUMMA, OUT_KR_SUMMA, DB_SUMMA_DOC, KR_SUMMA_DOC, ';
   text_zapros:=text_zapros + 'ID_SM, ID_RZ, ID_ST, ID_KEKV, SM_TITLE, SM_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros + 'RZ_KOD, ST_TITLE, ST_KOD, KEKV_TITLE, KEKV_KOD, FIO, N_DOG, DB_PK_ID, ';
   text_zapros:=text_zapros + 'DB_NUM_DOC, DB_SUMMA, DB_DATE_DOC, KR_PK_ID, KR_NUM_DOC, KR_SUMMA, KR_DATE_DOC, N_LINE1, N_LINE2,';
   text_zapros:=text_zapros + 'cor_kr_id_sch, cor_kr_sch_number, cor_kr_sch_title, cor_db_id_sch, ';
   text_zapros:=text_zapros + 'cor_db_sch_number, cor_db_sch_title, osn_id_sch, osn_sch_number, osn_sch_title ';
   text_zapros:=text_zapros + 'FROM PC_FULL_REPORT_FOR_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+'ORDER BY OSN_SCH_NUMBER, FIO';
   name_report:='\frFullSchReport.fr3';
   end;
 end;

 if ((cxPrintForm.ItemIndex = 4)or(cxPrintForm.ItemIndex = 8)) then
 begin
   {if is_valyuta=1 then
   begin
   text_zapros:='SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ';
   text_zapros:=text_zapros+'ID_DOG, KOD_DOG, FIO, N_DOG, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
   text_zapros:=text_zapros+' ,ID_VALUTE, NAME_VAL, CODE_VAL, SYMBOL, SUM(IN_DB_SUMMA_VAL) AS IN_D_S_V, SUM(IN_KR_SUMMA_VAL) AS IN_K_S_V, SUM(DB_SUMMA_VAL) AS D_S_V, SUM(KR_SUMMA_VAL) AS K_S_V, SUM(OUT_DB_SUMMA_VAL) AS OUT_D_S_V, SUM(OUT_KR_SUMMA_VAL) AS OUT_K_S_V  ';
   text_zapros:=text_zapros+' FROM PC_TMP_OBOROT_SELECT_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+' GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_VALUTE, NAME_VAL, CODE_VAL, SYMBOL, ';
   text_zapros:=text_zapros+' ID_DOG, KOD_DOG, FIO, N_DOG ';
   text_zapros:=text_zapros+' ORDER BY SCH_NUMBER, NAME_VAL, FIO';
   if cxPrintForm.ItemIndex = 4 then
   name_report:='\frMemOrderVal.fr3';
   if cxPrintForm.ItemIndex = 8 then
   name_report:='\frMemOrderWithoutDogVal.fr3';

  ds_podchin.Close;
  ds_podchin.SelectSQL.Text:='select db_sch_number, d_s, d_s_v from pc_full_report_sch_val(:date_beg, :date_end, :id_reg,0,0)';
  ds_podchin.Prepare;
  ds_podchin.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin.ParamByName('DATE_END').Value:=DEND;
  ds_podchin.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin.CloseOpen(False);

  ds_podchin_1.Close;
  ds_podchin_1.SelectSQL.Text:='select kr_sch_number, k_s from pc_full_report_sch(:date_beg, :date_end, :id_reg,0,1)';
  ds_podchin_1.Prepare;
  ds_podchin_1.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin_1.ParamByName('DATE_END').Value:=DEND;
  ds_podchin_1.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin_1.CloseOpen(False);

  DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_OBOROT WHERE ID_SESSION = '+IntToStr(id_session));
  DataSetFullSch.CloseOpen(False);
  IN_DB_SUMMA:=DataSetFullSchS1.Value;
  IN_KR_SUMMA:=DataSetFullSchS2.Value;
  OUT_DB_SUMMA:=DataSetFullSchS3.Value;
  OUT_KR_SUMMA:=DataSetFullSchS4.Value;
   end
   else
   begin  }
   text_zapros:='SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, KEKV_KOD,';
   text_zapros:=text_zapros+'ID_DOG, KOD_DOG, FIO, N_DOG, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
   text_zapros:=text_zapros+'FROM PC_TMP_OBOROT_SELECT_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+'GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, KEKV_KOD,';
   text_zapros:=text_zapros+'ID_DOG, KOD_DOG, FIO, N_DOG ';
   text_zapros:=text_zapros+'ORDER BY SCH_NUMBER, FIO';
   {if cxPrintForm.ItemIndex = 4 then
   name_report:='\ekonom_mo.fr3';}
   if cxPrintForm.ItemIndex = 4 then
   name_report:='\frMemOrder.fr3';
   if cxPrintForm.ItemIndex = 8 then
   name_report:='\frMemOrderWithoutDog.fr3';


  ds_podchin.Close;
  ds_podchin.SelectSQL.Text:='select db_sch_number, d_s from pc_full_report_sch(:date_beg, :date_end, :id_reg,0,0,:ID_SESSION_FOR_SCH)';
  ds_podchin.Prepare;
  ds_podchin.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin.ParamByName('DATE_END').Value:=DEND;
  ds_podchin.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin.ParamByName('ID_SESSION_FOR_SCH').Value:=ID_SES;
  ds_podchin.CloseOpen(False);

  ds_podchin_1.Close;
  ds_podchin_1.SelectSQL.Text:='select kr_sch_number, k_s from pc_full_report_sch(:date_beg, :date_end, :id_reg,0,1,:ID_SESSION_FOR_SCH)';
  ds_podchin_1.Prepare;
  ds_podchin_1.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin_1.ParamByName('DATE_END').Value:=DEND;
  ds_podchin_1.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin_1.ParamByName('ID_SESSION_FOR_SCH').Value:=ID_SES;
  ds_podchin_1.CloseOpen(False);

  DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_OBOROT WHERE ID_SESSION = '+IntToStr(id_session)+' and EXISTS(SELECT * FROM PC_TMP_SCH WHERE ID_SCH = PC_ID_SCH AND ID_SESSION = '+Inttostr(ID_SES)+')');
  DataSetFullSch.CloseOpen(False);
  IN_DB_SUMMA:=DataSetFullSchS1.Value;
  IN_KR_SUMMA:=DataSetFullSchS2.Value;
  OUT_DB_SUMMA:=DataSetFullSchS3.Value;
  OUT_KR_SUMMA:=DataSetFullSchS4.Value;
 // end;
 end;

 if cxPrintForm.ItemIndex = 6 then
 begin
   text_zapros:= 'SELECT ID_PC_TMP, ID_DOG, KOD_DOG ,IN_DB_SUMMA, IN_KR_SUMMA, KEKV_KOD,';
   text_zapros:=text_zapros + 'OUT_DB_SUMMA, OUT_KR_SUMMA, DB_SUMMA_DOC, KR_SUMMA_DOC, ';
   text_zapros:=text_zapros + 'ID_SM, ID_RZ, ID_ST, ID_KEKV, SM_TITLE, SM_KOD, RZ_TITLE, ';
   text_zapros:=text_zapros + 'RZ_KOD, ST_TITLE, ST_KOD, KEKV_TITLE, KEKV_KOD, FIO, N_DOG, DB_PK_ID, ';
   text_zapros:=text_zapros + 'DB_NUM_DOC, DB_SUMMA, KR_PK_ID, KR_NUM_DOC, KR_SUMMA, N_LINE1, N_LINE2,';
   text_zapros:=text_zapros + 'cor_kr_id_sch, cor_kr_sch_number, cor_kr_sch_title, cor_db_id_sch, ';
   text_zapros:=text_zapros + 'cor_db_sch_number, cor_db_sch_title, osn_id_sch, osn_sch_number, osn_sch_title, db_date_doc, kr_date_doc ';
   text_zapros:=text_zapros + 'FROM PC_FULL_REPORT_FOR_SCH(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
   text_zapros:=text_zapros+'ORDER BY OSN_SCH_NUMBER, FIO';
   name_report:='\frMemOrderByDoc.fr3';

  ds_podchin.Close;
  ds_podchin.SelectSQL.Text:='select db_sch_number, d_s from pc_full_report_sch(:date_beg, :date_end, :id_reg,0,0,:ID_SESSION_FOR_SCH)';
  ds_podchin.Prepare;
  ds_podchin.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin.ParamByName('DATE_END').Value:=DEND;
  ds_podchin.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin.ParamByName('ID_SESSION_FOR_SCH').Value:=ID_SES;
  ds_podchin.CloseOpen(False);

  ds_podchin_1.Close;
  ds_podchin_1.SelectSQL.Text:='select kr_sch_number, k_s from pc_full_report_sch(:date_beg, :date_end, :id_reg,0,1,:ID_SESSION_FOR_SCH)';
  ds_podchin_1.Prepare;
  ds_podchin_1.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin_1.ParamByName('DATE_END').Value:=DEND;
  ds_podchin_1.ParamByName('ID_REG').Value:=ID_REG;
  ds_podchin_1.ParamByName('ID_SESSION_FOR_SCH').Value:=ID_SES;
  ds_podchin_1.CloseOpen(False);

  DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_OBOROT WHERE ID_SESSION = '+IntToStr(id_session)+' and EXISTS(SELECT * FROM PC_TMP_SCH WHERE ID_SCH = PC_ID_SCH AND ID_SESSION = '+Inttostr(ID_SES)+')');
  DataSetFullSch.CloseOpen(False);
  IN_DB_SUMMA:=DataSetFullSchS1.Value;
  IN_KR_SUMMA:=DataSetFullSchS2.Value;
  OUT_DB_SUMMA:=DataSetFullSchS3.Value;
  OUT_KR_SUMMA:=DataSetFullSchS4.Value;
 end;

  if cxPrintForm.ItemIndex = 5 then
 begin
 { DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_OBOROT WHERE ID_SESSION = '+IntToStr(id_session));
  DataSetFullSch.CloseOpen(False);
  IN_DB_SUMMA:=DataSetFullSchS1.Value;
  IN_KR_SUMMA:=DataSetFullSchS2.Value;
  OUT_DB_SUMMA:=DataSetFullSchS3.Value;
  OUT_KR_SUMMA:=DataSetFullSchS4.Value; }
 //text_zapros:=' select a.db_sch_number, a.d_s, a.sch_number_1, a.sch_title_1, b.kr_sch_number, b.k_s, b.sch_number_2, b.sch_title_2';
  //text_zapros:=text_zapros + ' from pc_full_report_sch(:date_beg, :date_end, :id_reg,0) a full join pc_full_report_sch(:date_beg, :date_end, :id_reg,1) b ';
  //text_zapros:=text_zapros + ' on a.n_line= b.n_line ';
 text_zapros:= ' select * from PC_ADD_MAIN_BOOK(:date_beg, :date_end, :id_reg, :ID_SES, :ID_SES_SUM) order by main_sch_number';
  name_report:='\frRozshRah.fr3';
 end;

   if cxPrintForm.ItemIndex = 9 then
   begin
     grupp:=nil;
    SetLength(grupp,4);
     for i:=0 to 3 do grupp[i]:=0;

     for i:=0 to 3 do
     begin
       if i=0 then
       if cb_1.Checked then
       begin
        if cx_1.ItemIndex = 0 then grupp[0]:=1;
        if cx_1.ItemIndex = 1 then grupp[0]:=2;
        if cx_1.ItemIndex = 2 then grupp[0]:=3;
        if cx_1.ItemIndex = 3 then grupp[0]:=4;
       end;

       if i=1 then
       if cb_2.Checked then
       begin
        if cx_2.ItemIndex = 0 then grupp[1]:=1;
        if cx_2.ItemIndex = 1 then grupp[1]:=2;
        if cx_2.ItemIndex = 2 then grupp[1]:=3;
        if cx_2.ItemIndex = 3 then grupp[1]:=4;
       end;

       if i=2 then
       if cb_3.Checked then
       begin
        if cx_3.ItemIndex = 0 then grupp[2]:=1;
        if cx_3.ItemIndex = 1 then grupp[2]:=2;
        if cx_3.ItemIndex = 2 then grupp[2]:=3;
        if cx_3.ItemIndex = 3 then grupp[2]:=4;
       end;

       if i=3 then
       if cb_4.Checked then
       begin
        if cx_4.ItemIndex = 0 then grupp[3]:=1;
        if cx_4.ItemIndex = 1 then grupp[3]:=2;
        if cx_4.ItemIndex = 2 then grupp[3]:=3;
        if cx_4.ItemIndex = 3 then grupp[3]:=4;
       end;
     end;

    i:=0;
    flag_:=True;
    while ((flag_) and (i<=3)) do
    begin
      for t:=0 to 3 do
      if (t<>i) and (grupp[i]<>0) and (grupp[i]=grupp[t])then flag_:=False;
      inc(i);
    end;
     if flag_=False then begin ShowMessage('Ви поставили однакові групи!'); pgc1.ActivePage:=ts2; Wf.Free; Exit; end;

     text_zapros:=' select ';
     group_by:='  ';
     order_by:=' ' ;
     prefix:='';
     if cb_1.Checked then
     begin
      if cx_1.ItemIndex = 0 then begin text_zapros:= text_zapros+prefix+' ID_SM, SM_KOD, SM_TITLE '; group_by:= group_by+prefix+' ID_SM, SM_KOD, SM_TITLE '; order_by:=order_by +prefix+ ' SM_KOD '; prefix:=','; end;
      if cx_1.ItemIndex = 1 then begin text_zapros:= text_zapros+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; group_by:= group_by+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; order_by:=order_by +prefix+ ' RZ_KOD '; prefix:=','; end;
      if cx_1.ItemIndex = 2 then begin text_zapros:= text_zapros+prefix+' ID_ST, ST_KOD, ST_TITLE '; group_by:= group_by+prefix+' ID_ST, ST_KOD, ST_TITLE '; order_by:=order_by +prefix+ ' ST_KOD '; prefix:=','; end;
      if cx_1.ItemIndex = 3 then begin text_zapros:= text_zapros+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; group_by:= group_by+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; order_by:=order_by +prefix+ ' KEKV_KOD '; prefix:=','; end;
     end;
     if cb_2.Checked then
     begin
      if cx_2.ItemIndex = 0 then begin text_zapros:= text_zapros+prefix+' ID_SM, SM_KOD, SM_TITLE '; group_by:= group_by+prefix+' ID_SM, SM_KOD, SM_TITLE '; order_by:=order_by +prefix+ ' SM_KOD '; prefix:=','; end;
      if cx_2.ItemIndex = 1 then begin text_zapros:= text_zapros+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; group_by:= group_by+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; order_by:=order_by +prefix+ ' RZ_KOD '; prefix:=','; end;
      if cx_2.ItemIndex = 2 then begin text_zapros:= text_zapros+prefix+' ID_ST, ST_KOD, ST_TITLE '; group_by:= group_by+prefix+' ID_ST, ST_KOD, ST_TITLE '; order_by:=order_by +prefix+ ' ST_KOD '; prefix:=','; end;
      if cx_2.ItemIndex = 3 then begin text_zapros:= text_zapros+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; group_by:= group_by+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; order_by:=order_by +prefix+ ' KEKV_KOD '; prefix:=','; end;
     end;
     if cb_3.Checked then
     begin
      if cx_3.ItemIndex = 0 then begin text_zapros:= text_zapros+prefix+' ID_SM, SM_KOD, SM_TITLE '; group_by:= group_by+prefix+' ID_SM, SM_KOD, SM_TITLE '; order_by:=order_by +prefix+ ' SM_KOD '; prefix:=','; end;
      if cx_3.ItemIndex = 1 then begin text_zapros:= text_zapros+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; group_by:= group_by+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; order_by:=order_by +prefix+ ' RZ_KOD '; prefix:=','; end;
      if cx_3.ItemIndex = 2 then begin text_zapros:= text_zapros+prefix+' ID_ST, ST_KOD, ST_TITLE '; group_by:= group_by+prefix+' ID_ST, ST_KOD, ST_TITLE '; order_by:=order_by +prefix+ ' ST_KOD '; prefix:=','; end;
      if cx_3.ItemIndex = 3 then begin text_zapros:= text_zapros+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; group_by:= group_by+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; order_by:=order_by +prefix+ ' KEKV_KOD '; prefix:=','; end;
     end;
     if cb_4.Checked then
     begin
      if cx_4.ItemIndex = 0 then begin text_zapros:= text_zapros+prefix+' ID_SM, SM_KOD, SM_TITLE '; group_by:= group_by+prefix+' ID_SM, SM_KOD, SM_TITLE '; order_by:=order_by +prefix+ ' SM_KOD '; prefix:=','; end;
      if cx_4.ItemIndex = 1 then begin text_zapros:= text_zapros+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; group_by:= group_by+prefix+' ID_RZ, RZ_KOD, RZ_TITLE '; order_by:=order_by +prefix+ ' RZ_KOD '; prefix:=','; end;
      if cx_4.ItemIndex = 2 then begin text_zapros:= text_zapros+prefix+' ID_ST, ST_KOD, ST_TITLE '; group_by:= group_by+prefix+' ID_ST, ST_KOD, ST_TITLE '; order_by:=order_by +prefix+ ' ST_KOD '; prefix:=','; end;
      if cx_4.ItemIndex = 3 then begin text_zapros:= text_zapros+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; group_by:= group_by+prefix+' ID_KEKV, KEKV_KOD, KEKV_TITLE '; order_by:=order_by +prefix+ ' KEKV_KOD '; prefix:=','; end;
     end;
     text_zapros:=text_zapros+ prefix+' sch_number, cor_db_sch_number, cor_kr_sch_number, db_osn_sch_number, kr_osn_sch_number, SUM(IN_DB_SUMMA) AS IN_D_S, SUM(IN_KR_SUMMA) AS IN_K_S, SUM(DB_SUMMA) AS D_S, SUM(KR_SUMMA) AS K_S, SUM(OUT_DB_SUMMA) AS OUT_D_S, SUM(OUT_KR_SUMMA) AS OUT_K_S ';
     text_zapros:=text_zapros+' FROM PC_FULL_REPORT_FOR_SCH_EX(:ID_SESSION_FOR_PROV, :ID_SESSION_FOR_SCH, :DATE_REG, :ID_REG) ';
     text_zapros:=text_zapros+ ' group by ' +group_by + prefix+' sch_number, cor_db_sch_number, cor_kr_sch_number, db_osn_sch_number, kr_osn_sch_number ';
     text_zapros:=text_zapros+ ' order by ' +order_by + prefix+' sch_number, in_d_s, in_k_s, cor_db_sch_number, cor_kr_sch_number, db_osn_sch_number, kr_osn_sch_number ';

     //name_report:='\frSvodnVed.fr3';
   end;

 //ShowMessage(text_zapros);
  DataSetWork.SelectSQL.Add(text_zapros);
  if cxPrintForm.ItemIndex = 5 then
  begin
  DataSetWork.Prepare;
  DataSetWork.ParamByName('DATE_BEG').Value:=DBEG;
  DataSetWork.ParamByName('DATE_END').Value:=DEND;
  DataSetWork.ParamByName('ID_REG').Value:=ID_REG;
  DataSetWork.ParamByName('ID_SES').AsInteger:=ID_SES;
  DataSetWork.ParamByName('ID_SES_SUM').AsInteger:=id_session;
  DataSetWork.CloseOpen(False);
  end
  else
  begin
  DataSetWork.Prepare;
  DataSetWork.ParamByName('ID_SESSION_FOR_PROV').AsInteger:=id_session;
  DataSetWork.ParamByName('ID_SESSION_FOR_SCH').AsInteger:=ID_SES;
  DataSetWork.ParamByName('DATE_REG').Value:=DBEG;
  DataSetWork.ParamByName('ID_REG').Value:=ID_REG;
  DataSetWork.CloseOpen(false);
  end;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ name_report);
  if cxPrintForm.ItemIndex = 9 then
  begin

    makereport;
    //frxReport.ShowReport;
  end;

   frxReport.Variables['MONTH1']:=''''+AnsiUpperCase(cxMonthBeg.Text)+'''';
   frxReport .Variables['YEAR1']:=IntToStr(cxYearBeg.Value);
   frxReport.Variables['MONTH2']:=''''+AnsiUpperCase(cxMonthEnd.Text)+'''';
   frxReport.Variables['YEAR2']:=IntToStr(cxYearEnd.Value);
   frxReport.Variables['ORG_NAME']:=''''+ORG_FULL_NAME+'''';
   frxReport.Variables['ORG_SHORT_NAME']:=''''+SHORT_TITLE+'''';
   frxReport.Variables['ORG_KOD_OKPO']:=''''+ORG_KOD_OKPO+'''';
   if cxSch.Text='' then
   frxReport.Variables['SYSTEM_SCH']:=''''+SCH_SYSTEM+''''
   else frxReport.Variables['SYSTEM_SCH']:=''''+cxSch.Text+'''';
   frxReport.Variables['USER']:=''''+USER_FIO+'''';
   frxReport.Variables['SCH_FILTR']:=''''+cxSch.Text+'''';

   if ((cxPrintForm.ItemIndex = 5)or(cxPrintForm.ItemIndex = 4)or(cxPrintForm.ItemIndex = 8)or(cxPrintForm.ItemIndex = 6)) then
   begin
    if DEBETORI_KREDITORI='дебиторами' then tip:='408' else tip:='409';
    frxReport.Variables['TIP']:=''''+tip+'''';
    frxReport.Variables['DEBIT_KREDIT']:=''''+DEBETORI_KREDITORI+'''';
    frxReport.Variables['IN_DB_SUMMA']:=''''+FloatToStr(IN_DB_SUMMA)+'''';
    frxReport.Variables['IN_KR_SUMMA']:=''''+FloatToStr(IN_KR_SUMMA)+'''';
    frxReport.Variables['OUT_DB_SUMMA']:=''''+FloatToStr(OUT_DB_SUMMA)+'''';
    frxReport.Variables['OUT_KR_SUMMA']:=''''+FloatToStr(OUT_KR_SUMMA)+'''';
   end;

   Wf.Free;
   frxReport.PrepareReport;
   if cxCopies.Value>1 then
    frxReport.PrintOptions.Copies:=cxCopies.Value;
    frxReport.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;
   frxReport.PrintOptions.ShowDialog:=True;

   {if chbPrinter.Checked then
    frxReport1.Print
   else
    frxReport1.ShowReport;

   if cxCheckEdit.Checked then
    frxReport1.DesignReport; }
 if cxCopies.Value>1 then
 frxReport.PrintOptions.Copies:=cxCopies.Value;

 frxReport.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;

 if NOT_PRINT_FIO_ISPOLN=1 then
 begin
    if cxPrintForm.ItemIndex=0 then
    begin
      frxReport.FindObject('Memo30').Visible:=False;
      frxReport.FindObject('Memo31').Visible:=False;
      frxReport.FindObject('Memo32').Visible:=False;
    end;
    if cxPrintForm.ItemIndex=1 then
    begin
      frxReport.FindObject('Memo46').Visible:=False;
      frxReport.FindObject('Memo47').Visible:=False;
      frxReport.FindObject('Memo48').Visible:=False;
    end;
    if ((cxPrintForm.ItemIndex=2) or (cxPrintForm.ItemIndex=7)) then
    begin
      frxReport.FindObject('Memo48').Visible:=False;
      frxReport.FindObject('Memo49').Visible:=False;
      frxReport.FindObject('Memo50').Visible:=False;
    end;
    if cxPrintForm.ItemIndex=3 then
    begin
      frxReport.FindObject('Memo12').Visible:=False;
      frxReport.FindObject('Memo16').Visible:=False;
      frxReport.FindObject('Memo21').Visible:=False;
    end;
    if ((cxPrintForm.ItemIndex=4) or (cxPrintForm.ItemIndex=8)) then
    begin
      frxReport.FindObject('Memo6').Visible:=False;
      frxReport.FindObject('Memo46').Visible:=False;
      frxReport.FindObject('Memo64').Visible:=False;
      frxReport.FindObject('Memo65').Visible:=False;
      frxReport.FindObject('Memo66').Visible:=False;
      frxReport.FindObject('Memo47').Visible:=False;
      frxReport.FindObject('Memo67').Visible:=False;
    end;
     if cxPrintForm.ItemIndex=5 then
    begin
      frxReport.FindObject('Memo29').Visible:=False;
      frxReport.FindObject('Memo28').Visible:=False;
      frxReport.FindObject('Memo27').Visible:=False;
    end;
    if cxPrintForm.ItemIndex=6 then
    begin
      frxReport.FindObject('Memo83').Visible:=False;
      frxReport.FindObject('Memo84').Visible:=False;
      frxReport.FindObject('Memo86').Visible:=False;
      frxReport.FindObject('Memo87').Visible:=False;
      frxReport.FindObject('Memo88').Visible:=False;
      frxReport.FindObject('Memo85').Visible:=False;
      frxReport.FindObject('Memo89').Visible:=False;
    end;
 end;

 if chbPrinter.Checked then  frxReport.Print
else frxReport.ShowReport;

 if cxCheckEdit.Checked then  frxReport.DesignReport;
end;

procedure TSchOborotForm.actdesigneExecute(Sender: TObject);
begin
 cxCheckEdit.Visible:=not(cxCheckEdit.Visible) ;
end;

procedure TSchOborotForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
try
 StPr.Close;
 StPr.Transaction := Transaction;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StPr.Prepare;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ExecProc;
 StPr.Transaction.Commit;
 except on E : Exception
  do begin
  ShowMessage(E.Message);
  StPr.Transaction.Rollback;
  exit;
  end;
end;
Action:=caFree;
//RxMemoryData.Close;
//SpSchForm.Free;
end;

procedure TSchOborotForm.cxPrintFormPropertiesChange(Sender: TObject);
begin
if cxPrintForm.ItemIndex =  9 then begin ts2.Enabled:=True; ts2.Caption:='Інші опції'; ts2.Font.Color:=clBlack; end
else begin ts2.Enabled:=False; ts2.Caption:=''; ts2.Font.Color:=clGray; end
end;

procedure TSchOborotForm.cb_1PropertiesChange(Sender: TObject);
begin
if cb_1.checked then cx_1.enabled:=True else cx_1.enabled:=False;
end;

procedure TSchOborotForm.cb_2PropertiesChange(Sender: TObject);
begin
if cb_2.checked then cx_2.enabled:=True else cx_2.enabled:=False;
end;

procedure TSchOborotForm.cb_3PropertiesChange(Sender: TObject);
begin
if cb_3.checked then cx_3.enabled:=True else cx_3.enabled:=False;
end;

procedure TSchOborotForm.cb_4PropertiesChange(Sender: TObject);
begin
if cb_4.checked then cx_4.enabled:=True else cx_4.enabled:=False;
end;

procedure TSchOborotForm.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure TSchOborotForm.MakeReport;
var page:TfrxReportPage;
    band_head, gf1, gf2, gf3, gf4:TfrxBand;
    memo1, memo2, memo3, memo4, memo5, memo6, memo7, memo8,memo9, memo10,memo11,memo12, memo13, memo14, memo15:TfrxMemoView;
    memo16, memo17, memo18, memo19, memo20, memo21, memo22, memo23,memo24:TfrxMemoView;
    memo1_1, memo1_2, memo1_3, memo1_4, memo1_5: TfrxMemoView;
    next_left, top_next: Extended;
    gh1, gh2, gh3, gh4: TfrxGroupHeader;
    DataBand:TfrxMasterData;
    i, k, k_:Integer;
    width_name:Double;
begin
  frxReport.Clear;                         //создаем страницу отчета
  frxReport.DataSets.Add(frxDBDataset1);
  page:=TfrxReportPage.Create(frxReport);
  page.CreateUniqueName;
  page.SetDefaults;
  page.Orientation:=poLandscape;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.4*fr1cm;

  top_next:=band_head.top + band_head.Height;

  memo1:=TfrxMemoView.Create(band_head);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=27.7*fr1cm;
  memo1.Font.Size:=10;
  memo1.Left:=0*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:=ORG_FULL_NAME;
 // memo1.OnBeforePrint;

  memo2:=TfrxMemoView.Create(band_head);
  memo2.CreateUniqueName;
  memo2.Height:=0.5*fr1cm;
  memo2.Width:=27.7*fr1cm;
  memo2.Font.Size:=10;
  memo2.Left:=0*fr1cm;
  memo2.top:=0.5*fr1cm;
  memo2.HAlign:=haLeft;
  memo2.VAlign:=vaCenter;
  memo2.Text:=DateToStr(Date());

  memo3:=TfrxMemoView.Create(band_head);
  memo3.CreateUniqueName;
  memo3.Height:=0.5*fr1cm;
  memo3.Width:=27.7*fr1cm;
  memo3.Font.Size:=10;
  memo3.Left:=0*fr1cm;
  memo3.top:=1*fr1cm;
  memo3.HAlign:=haCenter;
  memo3.VAlign:=vaCenter;
  memo3.Text:=SHORT_TITLE;

  memo4:=TfrxMemoView.Create(band_head);
  memo4.CreateUniqueName;
  memo4.Height:=0.5*fr1cm;
  memo4.Width:=27.7*fr1cm;
  memo4.Font.Size:=10;
  memo4.Left:=0*fr1cm;
  memo4.top:=1.5*fr1cm;
  memo4.HAlign:=haCenter;
  memo4.VAlign:=vaCenter;
  memo4.Text:='Зведена відомість';
  memo4.Font.Style:=[fsBold];

  memo5:=TfrxMemoView.Create(band_head);
  memo5.CreateUniqueName;
  memo5.Height:=0.5*fr1cm;
  memo5.Width:=27.7*fr1cm;
  memo5.Font.Size:=10;
  memo5.Left:=0*fr1cm;
  memo5.top:=2*fr1cm;
  memo5.HAlign:=haCenter;
  memo5.VAlign:=vaCenter;
  memo5.Text:='за період з '+cxMonthBeg.Text+' '+ IntToStr(cxYearBeg.EditValue)+' по '+ cxMonthEnd.Text+' '+ IntToStr(cxYearEnd.EditValue);

  memo6:=TfrxMemoView.Create(band_head);
  memo6.CreateUniqueName;
  memo6.Height:=1.5*fr1cm;
  memo6.Width:=0.7*fr1cm;
  memo6.Font.Size:=10;
  memo6.Left:=0.1*fr1cm;
  memo6.top:=2.9*fr1cm;
  memo6.HAlign:=haCenter;
  memo6.VAlign:=vaCenter;
  memo6.Text:='№ п/п';
  memo6.Font.Style:=[fsBold];
  memo6.Color:=$00D8D8D8;
  memo6.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo6.left+memo6.width;

  // считаем кол-во группировок
  width_name:=0;
  k_:=0;
  for k:=0 to 3 do
  if grupp[k]<>0 then Inc(k_);

  if k_=4 then width_name:=4;
  if k_=3 then width_name:=5;
  if k_=2 then width_name:=6;
  if k_=1 then width_name:=7;
  //
  memo1_1:=TfrxMemoView.Create(band_head);
  memo1_1.CreateUniqueName;
  memo1_1.Height:=1.5*fr1cm;
  memo1_1.Width:=1*fr1cm;
  memo1_1.Font.Size:=10;
  memo1_1.Left:=next_left;
  memo1_1.top:=2.9*fr1cm;
  memo1_1.HAlign:=haCenter;
  memo1_1.VAlign:=vaCenter;
 // memo1_1.Font.Style:=[fsBold];
  memo1_1.Color:=$00D8D8D8;
  memo1_1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  if grupp[0]=1 then memo1_1.Text:='Код кошторису';
  if grupp[0]=2 then memo1_1.Text:='Код розділу';
  if grupp[0]=3 then memo1_1.Text:='Код статті';
  if grupp[0]=4 then memo1_1.Text:='Код КЕКВ';

  next_left:=memo1_1.left+memo1_1.width;

  memo1_2:=TfrxMemoView.Create(band_head);
  memo1_2.CreateUniqueName;
  memo1_2.Height:=1.5*fr1cm;
  memo1_2.Width:=width_name*fr1cm;
  memo1_2.Font.Size:=10;
  memo1_2.Left:=next_left;
  memo1_2.top:=2.9*fr1cm;
  memo1_2.HAlign:=haCenter;
  memo1_2.VAlign:=vaCenter;
 // memo1_2.Font.Style:=[fsBold];
  memo1_2.Color:=$00D8D8D8;
  memo1_2.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  if grupp[0]=1 then memo1_2.Text:='Назва кошторису';
  if grupp[0]=2 then memo1_2.Text:='Назва розділу';
  if grupp[0]=3 then memo1_2.Text:='Назва статті';
  if grupp[0]=4 then memo1_2.Text:='Назва КЕКВ';

  next_left:=memo1_2.left+memo1_2.width;

  if k_>1 then
  begin
  memo1_3:=TfrxMemoView.Create(band_head);
  memo1_3.CreateUniqueName;
  memo1_3.Height:=1.5*fr1cm;
  memo1_3.Width:=1*fr1cm;
  memo1_3.Font.Size:=10;
  memo1_3.Left:=next_left;
  memo1_3.top:=2.9*fr1cm;
  memo1_3.HAlign:=haCenter;
  memo1_3.VAlign:=vaCenter;
 // memo1_3.Font.Style:=[fsBold];
  memo1_3.Color:=$00D8D8D8;
  memo1_3.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  if grupp[1]=1 then memo1_3.Text:='Кошторис';
  if grupp[1]=2 then memo1_3.Text:='Розділ';
  if grupp[1]=3 then memo1_3.Text:='Стаття';
  if grupp[1]=4 then memo1_3.Text:='КЕКВ';
  next_left:=memo1_3.left+memo1_3.width;
  end ;

  if k_>2 then
  begin
  memo1_4:=TfrxMemoView.Create(band_head);
  memo1_4.CreateUniqueName;
  memo1_4.Height:=1.5*fr1cm;
  memo1_4.Width:=1*fr1cm;
  memo1_4.Font.Size:=10;
  memo1_4.Left:=next_left;
  memo1_4.top:=2.9*fr1cm;
  memo1_4.HAlign:=haCenter;
  memo1_4.VAlign:=vaCenter;
 // memo1_4.Font.Style:=[fsBold];
  memo1_4.Color:=$00D8D8D8;
  memo1_4.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  if grupp[2]=1 then memo1_4.Text:='Кошторис';
  if grupp[2]=2 then memo1_4.Text:='Розділ';
  if grupp[2]=3 then memo1_4.Text:='Стаття';
  if grupp[2]=4 then memo1_4.Text:='КЕКВ';
  next_left:=memo1_4.left+memo1_4.width;
  end;

  if k_>3 then
  begin
  memo1_5:=TfrxMemoView.Create(band_head);
  memo1_5.CreateUniqueName;
  memo1_5.Height:=1.5*fr1cm;
  memo1_5.Width:=1*fr1cm;
  memo1_5.Font.Size:=10;
  memo1_5.Left:=next_left;
  memo1_5.top:=2.9*fr1cm;
  memo1_5.HAlign:=haCenter;
  memo1_5.VAlign:=vaCenter;
  //memo1_5.Font.Style:=[fsBold];
  memo1_5.Color:=$00D8D8D8;
  memo1_5.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  if grupp[3]=1 then memo1_5.Text:='Кошторис';
  if grupp[3]=2 then memo1_5.Text:='Розділу';
  if grupp[3]=3 then memo1_5.Text:='Стаття';
  if grupp[3]=4 then memo1_5.Text:='КЕКВ';
  next_left:=memo1_5.left+memo1_5.width;
  end;


  memo7:=TfrxMemoView.Create(band_head);
  memo7.CreateUniqueName;
  memo7.Height:=0.5*fr1cm;
  memo7.Width:=4.3*fr1cm;
  memo7.Font.Size:=10;
  memo7.Left:=next_left;
  memo7.top:=2.9*fr1cm;
  memo7.HAlign:=haCenter;
  memo7.VAlign:=vaCenter;
  memo7.Text:='Вхідні залишки';
  memo7.Font.Style:=[fsBold];
  memo7.Color:=$00D8D8D8;
  memo7.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo8:=TfrxMemoView.Create(band_head);
  memo8.CreateUniqueName;
  memo8.Height:=1*fr1cm;
  memo8.Width:=1.1*fr1cm;
  memo8.Font.Size:=10;
  memo8.Left:=next_left;
  memo8.top:=3.4*fr1cm;
  memo8.HAlign:=haCenter;
  memo8.VAlign:=vaCenter;
  memo8.Text:='Рах.';
  memo8.Color:=$00D8D8D8;
  memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo8.left+memo8.width;

  memo9:=TfrxMemoView.Create(band_head);
  memo9.CreateUniqueName;
  memo9.Height:=1*fr1cm;
  memo9.Width:=1.6*fr1cm;
  memo9.Font.Size:=10;
  memo9.Left:=next_left;
  memo9.top:=3.4*fr1cm;
  memo9.HAlign:=haCenter;
  memo9.VAlign:=vaCenter;
  memo9.Text:='Дб.сума';
  memo9.Color:=$00D8D8D8;
  memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo9.left+memo9.width;

  memo10:=TfrxMemoView.Create(band_head);
  memo10.CreateUniqueName;
  memo10.Height:=1*fr1cm;
  memo10.Width:=1.6*fr1cm;
  memo10.Font.Size:=10;
  memo10.Left:=next_left;
  memo10.top:=3.4*fr1cm;
  memo10.HAlign:=haCenter;
  memo10.VAlign:=vaCenter;
  memo10.Text:='Кр.сума';
  memo10.Color:=$00D8D8D8;
  memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo10.left+memo10.width;

  memo11:=TfrxMemoView.Create(band_head);
  memo11.CreateUniqueName;
  memo11.Height:=0.5*fr1cm;
  memo11.Width:=5.2*fr1cm;
  memo11.Font.Size:=10;
  memo11.Left:=next_left;
  memo11.top:=2.9*fr1cm;
  memo11.HAlign:=haCenter;
  memo11.VAlign:=vaCenter;
  memo11.Text:='Оборот по дебету';
  memo11.Font.Style:=[fsBold];
  memo11.Color:=$00D8D8D8;
  memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo12:=TfrxMemoView.Create(band_head);
  memo12.CreateUniqueName;
  memo12.Height:=0.5*fr1cm;
  memo12.Width:=3.6*fr1cm;
  memo12.Font.Size:=10;
  memo12.Left:=next_left;
  memo12.top:=3.4*fr1cm;
  memo12.HAlign:=haCenter;
  memo12.VAlign:=vaCenter;
  memo12.Text:='Кореспонденція';
  memo12.Color:=$00D8D8D8;
  memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo13:=TfrxMemoView.Create(band_head);
  memo13.CreateUniqueName;
  memo13.Height:=0.5*fr1cm;
  memo13.Width:=1.8*fr1cm;
  memo13.Font.Size:=10;
  memo13.Left:=next_left;
  memo13.top:=3.9*fr1cm;
  memo13.HAlign:=haCenter;
  memo13.VAlign:=vaCenter;
  memo13.Text:='Дб.рах.';
  memo13.Color:=$00D8D8D8;
  memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo13.left+memo13.width;

  memo14:=TfrxMemoView.Create(band_head);
  memo14.CreateUniqueName;
  memo14.Height:=0.5*fr1cm;
  memo14.Width:=1.8*fr1cm;
  memo14.Font.Size:=10;
  memo14.Left:=next_left;
  memo14.top:=3.9*fr1cm;
  memo14.HAlign:=haCenter;
  memo14.VAlign:=vaCenter;
  memo14.Text:='Кр.рах.';
  memo14.Color:=$00D8D8D8;
  memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo14.left+memo14.width;

  memo15:=TfrxMemoView.Create(band_head);
  memo15.CreateUniqueName;
  memo15.Height:=1*fr1cm;
  memo15.Width:=1.6*fr1cm;
  memo15.Font.Size:=10;
  memo15.Left:=next_left;
  memo15.top:=3.4*fr1cm;
  memo15.HAlign:=haCenter;
  memo15.VAlign:=vaCenter;
  memo15.Text:='Дб.сума';
  memo15.Color:=$00D8D8D8;
  memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo15.left+memo15.width;

  memo16:=TfrxMemoView.Create(band_head);
  memo16.CreateUniqueName;
  memo16.Height:=0.5*fr1cm;
  memo16.Width:=5.2*fr1cm;
  memo16.Font.Size:=10;
  memo16.Left:=next_left;
  memo16.top:=2.9*fr1cm;
  memo16.HAlign:=haCenter;
  memo16.VAlign:=vaCenter;
  memo16.Text:='Оборот по кредиту';
  memo16.Font.Style:=[fsBold];
  memo16.Color:=$00D8D8D8;
  memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo17:=TfrxMemoView.Create(band_head);
  memo17.CreateUniqueName;
  memo17.Height:=0.5*fr1cm;
  memo17.Width:=3.6*fr1cm;
  memo17.Font.Size:=10;
  memo17.Left:=next_left;
  memo17.top:=3.4*fr1cm;
  memo17.HAlign:=haCenter;
  memo17.VAlign:=vaCenter;
  memo17.Text:='Кореспонденція';
  memo17.Color:=$00D8D8D8;
  memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo18:=TfrxMemoView.Create(band_head);
  memo18.CreateUniqueName;
  memo18.Height:=0.5*fr1cm;
  memo18.Width:=1.8*fr1cm;
  memo18.Font.Size:=10;
  memo18.Left:=next_left;
  memo18.top:=3.9*fr1cm;
  memo18.HAlign:=haCenter;
  memo18.VAlign:=vaCenter;
  memo18.Text:='Дб.рах.';
  memo18.Color:=$00D8D8D8;
  memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo18.left+memo18.width;

  memo19:=TfrxMemoView.Create(band_head);
  memo19.CreateUniqueName;
  memo19.Height:=0.5*fr1cm;
  memo19.Width:=1.8*fr1cm;
  memo19.Font.Size:=10;
  memo19.Left:=next_left;
  memo19.top:=3.9*fr1cm;
  memo19.HAlign:=haCenter;
  memo19.VAlign:=vaCenter;
  memo19.Text:='Кр.рах.';
  memo19.Color:=$00D8D8D8;
  memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo19.left+memo19.width;

  memo20:=TfrxMemoView.Create(band_head);
  memo20.CreateUniqueName;
  memo20.Height:=1*fr1cm;
  memo20.Width:=1.6*fr1cm;
  memo20.Font.Size:=10;
  memo20.Left:=next_left;
  memo20.top:=3.4*fr1cm;
  memo20.HAlign:=haCenter;
  memo20.VAlign:=vaCenter;
  memo20.Text:='Кр.сума';
  memo20.Color:=$00D8D8D8;
  memo20.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo20.left+memo20.width;

  memo21:=TfrxMemoView.Create(band_head);
  memo21.CreateUniqueName;
  memo21.Height:=0.5*fr1cm;
  memo21.Width:=4.3*fr1cm;
  memo21.Font.Size:=10;
  memo21.Left:=next_left;
  memo21.top:=2.9*fr1cm;
  memo21.HAlign:=haCenter;
  memo21.VAlign:=vaCenter;
  memo21.Text:='Вихідні залишки';
  memo21.Font.Style:=[fsBold];
  memo21.Color:=$00D8D8D8;
  memo21.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo22:=TfrxMemoView.Create(band_head);
  memo22.CreateUniqueName;
  memo22.Height:=1*fr1cm;
  memo22.Width:=1.1*fr1cm;
  memo22.Font.Size:=10;
  memo22.Left:=next_left;
  memo22.top:=3.4*fr1cm;
  memo22.HAlign:=haCenter;
  memo22.VAlign:=vaCenter;
  memo22.Text:='Рах.';
  memo22.Color:=$00D8D8D8;
  memo22.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo22.left+memo22.width;

  memo23:=TfrxMemoView.Create(band_head);
  memo23.CreateUniqueName;
  memo23.Height:=1*fr1cm;
  memo23.Width:=1.6*fr1cm;
  memo23.Font.Size:=10;
  memo23.Left:=next_left;
  memo23.top:=3.4*fr1cm;
  memo23.HAlign:=haCenter;
  memo23.VAlign:=vaCenter;
  memo23.Text:='Дб.сума';
  memo23.Color:=$00D8D8D8;
  memo23.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  next_left:=memo23.left+memo23.width;

  memo24:=TfrxMemoView.Create(band_head);
  memo24.CreateUniqueName;
  memo24.Height:=1*fr1cm;
  memo24.Width:=1.6*fr1cm;
  memo24.Font.Size:=10;
  memo24.Left:=next_left;
  memo24.top:=3.4*fr1cm;
  memo24.HAlign:=haCenter;
  memo24.VAlign:=vaCenter;
  memo24.Text:='Кр.сума';
  memo24.Color:=$00D8D8D8;
  memo24.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  // группировки
  for i:=0 to 3 do
  begin
    if i=0 then
    if grupp[0] <> 0 then
    begin
      gh1:=TfrxGroupHeader.Create(page);
      gh1.CreateUniqueName;
      gh1.top:=top_next;
      gh1.Height:=0.001*fr1cm;

      top_next:=gh1.top + gh1.Height;

      if grupp[0]=1 then gh1.Condition:='frxDBDataset1."SM_KOD"' ;
      if grupp[0]=2 then gh1.Condition:='frxDBDataset1."RZ_KOD"' ;
      if grupp[0]=3 then gh1.Condition:='frxDBDataset1."ST_KOD"' ;
      if grupp[0]=4 then gh1.Condition:='frxDBDataset1."KEKV_KOD"' ;

      {memo1:=TfrxMemoView.Create(gh1);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      memo1.Width:=27.7*fr1cm;
      memo1.Font.Size:=8;
      memo1.Left:=0.1*fr1cm;;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

      if grupp[0]=1 then memo1.Text:='Кошторис [frxDBDataset1."SM_KOD"] [frxDBDataset1."SM_TITLE"]' ;
      if grupp[0]=2 then memo1.Text:='Розділ [frxDBDataset1."RZ_KOD"] [frxDBDataset1."RZ_TITLE"]' ;
      if grupp[0]=3 then memo1.Text:='Стаття [frxDBDataset1."ST_KOD"] [frxDBDataset1."ST_TITLE"]' ;
      if grupp[0]=4 then memo1.Text:='КЕКВ [frxDBDataset1."KEKV_KOD"] [frxDBDataset1."KEKV_TITLE"]' ; }
    end;

    if i=1 then
    if grupp[1] <> 0 then
    begin
      gh2:=TfrxGroupHeader.Create(page);
      gh2.CreateUniqueName;
      gh2.top:=top_next;
      gh2.Height:=0.001*fr1cm;

      top_next:=gh2.top + gh2.Height;

      if grupp[1]=1 then gh2.Condition:='frxDBDataset1."SM_KOD"' ;
      if grupp[1]=2 then gh2.Condition:='frxDBDataset1."RZ_KOD"' ;
      if grupp[1]=3 then gh2.Condition:='frxDBDataset1."ST_KOD"' ;
      if grupp[1]=4 then gh2.Condition:='frxDBDataset1."KEKV_KOD"' ;

     { memo1:=TfrxMemoView.Create(gh2);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      memo1.Width:=27.7*fr1cm;;
      memo1.Font.Size:=8;
      memo1.Left:=0.1*fr1cm;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

      if grupp[1]=1 then memo1.Text:='Кошторис [frxDBDataset1."SM_KOD"] [frxDBDataset1."SM_TITLE"]' ;
      if grupp[1]=2 then memo1.Text:='Розділ [frxDBDataset1."RZ_KOD"] [frxDBDataset1."RZ_TITLE"]' ;
      if grupp[1]=3 then memo1.Text:='Стаття [frxDBDataset1."ST_KOD"] [frxDBDataset1."ST_TITLE"]' ;
      if grupp[1]=4 then memo1.Text:='КЕКВ [frxDBDataset1."KEKV_KOD"] [frxDBDataset1."KEKV_TITLE"]' ; }
    end;

    if i=2 then
    if grupp[2] <> 0 then
    begin
      gh3:=TfrxGroupHeader.Create(page);
      gh3.CreateUniqueName;
      gh3.top:=top_next;
      gh3.Height:=0.001*fr1cm;

      top_next:=gh3.top + gh3.Height;

      if grupp[2]=1 then gh3.Condition:='frxDBDataset1."SM_KOD"' ;
      if grupp[2]=2 then gh3.Condition:='frxDBDataset1."RZ_KOD"' ;
      if grupp[2]=3 then gh3.Condition:='frxDBDataset1."ST_KOD"' ;
      if grupp[2]=4 then gh3.Condition:='frxDBDataset1."KEKV_KOD"' ;

     { memo1:=TfrxMemoView.Create(gh3);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      memo1.Width:=27.7*fr1cm;;
      memo1.Font.Size:=8;
      memo1.Left:=0.1*fr1cm;
      memo1.top:=0.1;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

      if grupp[2]=1 then memo1.Text:='Кошторис [frxDBDataset1."SM_KOD"] [frxDBDataset1."SM_TITLE"]' ;
      if grupp[2]=2 then memo1.Text:='Розділ [frxDBDataset1."RZ_KOD"] [frxDBDataset1."RZ_TITLE"]' ;
      if grupp[2]=3 then memo1.Text:='Стаття [frxDBDataset1."ST_KOD"] [frxDBDataset1."ST_TITLE"]' ;
      if grupp[2]=4 then memo1.Text:='КЕКВ [frxDBDataset1."KEKV_KOD"] [frxDBDataset1."KEKV_TITLE"]' ; }
    end;

    if i=3 then
    if grupp[3] <> 0 then
    begin
      gh4:=TfrxGroupHeader.Create(page);
      gh4.CreateUniqueName;
      gh4.top:=top_next;
      gh4.Height:=0.001*fr1cm;

      top_next:=gh4.top + gh4.Height;

      if grupp[3]=1 then gh4.Condition:='frxDBDataset1."SM_KOD"' ;
      if grupp[3]=2 then gh4.Condition:='frxDBDataset1."RZ_KOD"' ;
      if grupp[3]=3 then gh4.Condition:='frxDBDataset1."ST_KOD"' ;
      if grupp[3]=4 then gh4.Condition:='frxDBDataset1."KEKV_KOD"' ;

     { memo1:=TfrxMemoView.Create(gh4);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      memo1.Width:=27.7*fr1cm;;
      memo1.Font.Size:=8;
      memo1.Left:=0.1*fr1cm;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

      if grupp[3]=1 then memo1.Text:='Кошторис [frxDBDataset1."SM_KOD"] [frxDBDataset1."SM_TITLE"]' ;
      if grupp[3]=2 then memo1.Text:='Розділ [frxDBDataset1."RZ_KOD"] [frxDBDataset1."RZ_TITLE"]' ;
      if grupp[3]=3 then memo1.Text:='Стаття [frxDBDataset1."ST_KOD"] [frxDBDataset1."ST_TITLE"]' ;
      if grupp[3]=4 then memo1.Text:='КЕКВ [frxDBDataset1."KEKV_KOD"] [frxDBDataset1."KEKV_TITLE"]' ;  }
    end;
   end;
 // мастердата
  DataBand:=TfrxMasterData.Create(page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  DAtaBand.Stretched:=True;

  top_next:=DataBand.Top+DataBand.Height;

  memo1:=TfrxMemoView.Create(DataBand);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=0.7*fr1cm;
  memo1.Font.Size:=8;
  memo1.Left:=0.1*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:='[Line#]';
  memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1.StretchMode:=smMaxHeight;

  next_left:=memo1.left+memo1.width;

  memo1_1:=TfrxMemoView.Create(DataBand);
  memo1_1.CreateUniqueName;
  memo1_1.Height:=0.5*fr1cm;
  memo1_1.Width:=1*fr1cm;
  memo1_1.Font.Size:=8;
  memo1_1.Left:=next_left;
  memo1_1.top:=0*fr1cm;
  memo1_1.HAlign:=haCenter;
  memo1_1.VAlign:=vaCenter;
  memo1_1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1_1.StretchMode:=smMaxHeight;
  if grupp[0]=1 then memo1_1.Text:='[frxDBDataset1."SM_KOD"]';
  if grupp[0]=2 then memo1_1.Text:='[frxDBDataset1."RZ_KOD"]';
  if grupp[0]=3 then memo1_1.Text:='[frxDBDataset1."ST_KOD"]';
  if grupp[0]=4 then memo1_1.Text:='[frxDBDataset1."KEKV_KOD"]';

  next_left:=memo1_1.left+memo1_1.width;

  memo1_2:=TfrxMemoView.Create(DataBand);
  memo1_2.CreateUniqueName;
  memo1_2.Height:=0.5*fr1cm;
  memo1_2.Width:=width_name*fr1cm;
  memo1_2.Font.Size:=8;
  memo1_2.Left:=next_left;
  memo1_2.top:=0*fr1cm;
  memo1_2.HAlign:=haCenter;
  memo1_2.VAlign:=vaCenter;
  memo1_2.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1_2.StretchMode:=smMaxHeight;
  if grupp[0]=1 then memo1_2.Text:='[frxDBDataset1."SM_TITLE"]';
  if grupp[0]=2 then memo1_2.Text:='[frxDBDataset1."RZ_TITLE"]';
  if grupp[0]=3 then memo1_2.Text:='[frxDBDataset1."ST_TITLE"]';
  if grupp[0]=4 then memo1_2.Text:='[frxDBDataset1."KEKV_TITLE"]';

  next_left:=memo1_2.left+memo1_2.width;

  if k_>1 then
  begin
  memo1_3:=TfrxMemoView.Create(DataBand);
  memo1_3.CreateUniqueName;
  memo1_3.Height:=0.5*fr1cm;
  memo1_3.Width:=1*fr1cm;
  memo1_3.Font.Size:=8;
  memo1_3.Left:=next_left;
  memo1_3.top:=0*fr1cm;
  memo1_3.HAlign:=haCenter;
  memo1_3.VAlign:=vaCenter;
  memo1_3.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1_3.StretchMode:=smMaxHeight;
  if grupp[1]=1 then memo1_3.Text:='[frxDBDataset1."SM_KOD"]';
  if grupp[1]=2 then memo1_3.Text:='[frxDBDataset1."RZ_KOD"]';
  if grupp[1]=3 then memo1_3.Text:='[frxDBDataset1."ST_KOD"]';
  if grupp[1]=4 then memo1_3.Text:='[frxDBDataset1."KEKV_KOD"]';
  next_left:=memo1_3.left+memo1_3.width;
  end;

  if k_>2 then
  begin
  memo1_4:=TfrxMemoView.Create(DataBand);
  memo1_4.CreateUniqueName;
  memo1_4.Height:=0.5*fr1cm;
  memo1_4.Width:=1*fr1cm;
  memo1_4.Font.Size:=8;
  memo1_4.Left:=next_left;
  memo1_4.top:=0*fr1cm;
  memo1_4.HAlign:=haCenter;
  memo1_4.VAlign:=vaCenter;
  memo1_4.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1_4.StretchMode:=smMaxHeight;
  if grupp[2]=1 then memo1_4.Text:='[frxDBDataset1."SM_KOD"]';
  if grupp[2]=2 then memo1_4.Text:='[frxDBDataset1."RZ_KOD"]';
  if grupp[2]=3 then memo1_4.Text:='[frxDBDataset1."ST_KOD"]';
  if grupp[2]=4 then memo1_4.Text:='[frxDBDataset1."KEKV_KOD"]';
  next_left:=memo1_4.left+memo1_4.width;
  end;

  if k_>3 then
  begin
  memo1_5:=TfrxMemoView.Create(DataBand);
  memo1_5.CreateUniqueName;
  memo1_5.Height:=0.5*fr1cm;
  memo1_5.Width:=1*fr1cm;
  memo1_5.Font.Size:=8;
  memo1_5.Left:=next_left;
  memo1_5.top:=0*fr1cm;
  memo1_5.HAlign:=haCenter;
  memo1_5.VAlign:=vaCenter;
  memo1_5.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo1_5.StretchMode:=smMaxHeight;
  if grupp[3]=1 then memo1_5.Text:='[frxDBDataset1."SM_KOD"]';
  if grupp[3]=2 then memo1_5.Text:='[frxDBDataset1."RZ_KOD"]';
  if grupp[3]=3 then memo1_5.Text:='[frxDBDataset1."ST_KOD"]';
  if grupp[3]=4 then memo1_5.Text:='[frxDBDataset1."KEKV_KOD"]';
  next_left:=memo1_5.left+memo1_5.width;
  end;

  memo8:=TfrxMemoView.Create(DataBand);
  memo8.CreateUniqueName;
  memo8.Height:=0.5*fr1cm;
  memo8.Width:=1.1*fr1cm;
  memo8.Font.Size:=8;
  memo8.Left:=next_left;
  memo8.top:=0*fr1cm;
  memo8.HAlign:=haCenter;
  memo8.VAlign:=vaCenter;
  memo8.Text:='[frxDBDataset1."SCH_NUMBER"]';
  memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo8.StretchMode:=smMaxHeight;

  next_left:=memo8.left+memo8.width;

  memo9:=TfrxMemoView.Create(DataBand);
  memo9.CreateUniqueName;
  memo9.Height:=0.5*fr1cm;
  memo9.Width:=1.6*fr1cm;
  memo9.Font.Size:=8;
  memo9.Left:=next_left;
  memo9.top:=0*fr1cm;
  memo9.HAlign:=haRight;
  memo9.VAlign:=vaCenter;
  memo9.Text:='[frxDBDataset1."IN_D_S"]';
  memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo9.DisplayFormat.Kind:=fkNumeric;
  memo9.DisplayFormat.FormatStr:='%2.2n';
  memo9.StretchMode:=smMaxHeight;

  next_left:=memo9.left+memo9.width;

  memo10:=TfrxMemoView.Create(DataBand);
  memo10.CreateUniqueName;
  memo10.Height:=0.5*fr1cm;
  memo10.Width:=1.6*fr1cm;
  memo10.Font.Size:=8;
  memo10.Left:=next_left;
  memo10.top:=0*fr1cm;
  memo10.HAlign:=haRight;
  memo10.VAlign:=vaCenter;
  memo10.Text:='[frxDBDataset1."IN_K_S"]';
  memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo10.DisplayFormat.Kind:=fkNumeric;
  memo10.DisplayFormat.FormatStr:='%2.2n';
  memo10.StretchMode:=smMaxHeight;

  next_left:=memo10.left+memo10.width;

  memo11:=TfrxMemoView.Create(DataBand);
  memo11.CreateUniqueName;
  memo11.Height:=0.5*fr1cm;
  memo11.Width:=1.8*fr1cm;
  memo11.Font.Size:=8;
  memo11.Left:=next_left;
  memo11.top:=0*fr1cm;
  memo11.HAlign:=haCenter;
  memo11.VAlign:=vaCenter;
  memo11.Text:='[frxDBDataset1."DB_OSN_SCH_NUMBER"]';
  memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo11.StretchMode:=smMaxHeight;

  next_left:=memo11.left+memo11.width;

  memo12:=TfrxMemoView.Create(DataBand);
  memo12.CreateUniqueName;
  memo12.Height:=0.5*fr1cm;
  memo12.Width:=1.8*fr1cm;
  memo12.Font.Size:=8;
  memo12.Left:=next_left;
  memo12.top:=0*fr1cm;
  memo12.HAlign:=haCenter;
  memo12.VAlign:=vaCenter;
  memo12.Text:='[frxDBDataset1."COR_DB_SCH_NUMBER"]';
  memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo12.StretchMode:=smMaxHeight;

  next_left:=memo12.left+memo12.width;

  memo13:=TfrxMemoView.Create(DataBand);
  memo13.CreateUniqueName;
  memo13.Height:=0.5*fr1cm;
  memo13.Width:=1.6*fr1cm;
  memo13.Font.Size:=8;
  memo13.Left:=next_left;
  memo13.top:=0*fr1cm;
  memo13.HAlign:=haRight;
  memo13.VAlign:=vaCenter;
  memo13.Text:='[frxDBDataset1."D_S"]';
  memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo13.DisplayFormat.Kind:=fkNumeric;
  memo13.DisplayFormat.FormatStr:='%2.2n';
  memo13.StretchMode:=smMaxHeight;
  memo13.HideZeros:=True;

  next_left:=memo13.left+memo13.width;

  memo14:=TfrxMemoView.Create(DataBand);
  memo14.CreateUniqueName;
  memo14.Height:=0.5*fr1cm;
  memo14.Width:=1.8*fr1cm;
  memo14.Font.Size:=8;
  memo14.Left:=next_left;
  memo14.top:=0*fr1cm;
  memo14.HAlign:=haCenter;
  memo14.VAlign:=vaCenter;
  memo14.Text:='[frxDBDataset1."COR_KR_SCH_NUMBER"]';
  memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo14.StretchMode:=smMaxHeight;

  next_left:=memo14.left+memo14.width;

  memo15:=TfrxMemoView.Create(DataBand);
  memo15.CreateUniqueName;
  memo15.Height:=0.5*fr1cm;
  memo15.Width:=1.8*fr1cm;
  memo15.Font.Size:=8;
  memo15.Left:=next_left;
  memo15.top:=0*fr1cm;
  memo15.HAlign:=haCenter;
  memo15.VAlign:=vaCenter;
  memo15.Text:='[frxDBDataset1."KR_OSN_SCH_NUMBER"]';
  memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo15.StretchMode:=smMaxHeight;

  next_left:=memo15.left+memo15.width;

  memo16:=TfrxMemoView.Create(DataBand);
  memo16.CreateUniqueName;
  memo16.Height:=0.5*fr1cm;
  memo16.Width:=1.6*fr1cm;
  memo16.Font.Size:=8;
  memo16.Left:=next_left;
  memo16.top:=0*fr1cm;
  memo16.HAlign:=haRight;
  memo16.VAlign:=vaCenter;
  memo16.Text:='[frxDBDataset1."K_S"]';
  memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo16.DisplayFormat.Kind:=fkNumeric;
  memo16.DisplayFormat.FormatStr:='%2.2n';
  memo16.StretchMode:=smMaxHeight;
  memo16.HideZeros:=True;

  next_left:=memo16.left+memo16.width;

  memo17:=TfrxMemoView.Create(DataBand);
  memo17.CreateUniqueName;
  memo17.Height:=0.5*fr1cm;
  memo17.Width:=1.1*fr1cm;
  memo17.Font.Size:=8;
  memo17.Left:=next_left;
  memo17.top:=0*fr1cm;
  memo17.HAlign:=haCenter;
  memo17.VAlign:=vaCenter;
  memo17.Text:='[frxDBDataset1."SCH_NUMBER"]';
  memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo17.StretchMode:=smMaxHeight;

  next_left:=memo17.left+memo17.width;

  memo18:=TfrxMemoView.Create(DataBand);
  memo18.CreateUniqueName;
  memo18.Height:=0.5*fr1cm;
  memo18.Width:=1.6*fr1cm;
  memo18.Font.Size:=8;
  memo18.Left:=next_left;
  memo18.top:=0*fr1cm;
  memo18.HAlign:=haRight;
  memo18.VAlign:=vaCenter;
  memo18.Text:='[frxDBDataset1."OUT_D_S"]';
  memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo18.DisplayFormat.Kind:=fkNumeric;
  memo18.DisplayFormat.FormatStr:='%2.2n';
  memo18.StretchMode:=smMaxHeight;

  next_left:=memo18.left+memo18.width;

  memo19:=TfrxMemoView.Create(DataBand);
  memo19.CreateUniqueName;
  memo19.Height:=0.5*fr1cm;
  memo19.Width:=1.6*fr1cm;
  memo19.Font.Size:=8;
  memo19.Left:=next_left;
  memo19.top:=0*fr1cm;
  memo19.HAlign:=haRight;
  memo19.VAlign:=vaCenter;
  memo19.Text:='[frxDBDataset1."OUT_K_S"]';
  memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo19.DisplayFormat.Kind:=fkNumeric;
  memo19.DisplayFormat.FormatStr:='%2.2n';
  memo19.StretchMode:=smMaxHeight;

  // footers

  i:=4;
  while i<>0 do
  begin
    i:=i-1;
    if i=3 then
    if grupp[0] <> 0 then
    begin
      gf1:=TfrxGroupFooter.Create(page);
      gf1.CreateUniqueName;
      gf1.top:=top_next;
      gf1.Height:=0.5*fr1cm;
      gf1.Stretched:=True;

      top_next:=gf1.top + gf1.Height;

       memo1:=TfrxMemoView.Create(gf1);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=0.7*fr1cm;
  memo1.Font.Size:=8;
  memo1.Left:=0.1*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:='';
  memo1.Frame.Typ:=[ftLeft,ftRight];
  memo1.StretchMode:=smMaxHeight;

  next_left:=memo1.left+memo1.width;

  memo1_1:=TfrxMemoView.Create(gf1);
  memo1_1.CreateUniqueName;
  memo1_1.Height:=0.5*fr1cm;
  memo1_1.Width:=1*fr1cm;
  memo1_1.Font.Size:=8;
  memo1_1.Left:=next_left;
  memo1_1.top:=0*fr1cm;
  memo1_1.HAlign:=haCenter;
  memo1_1.VAlign:=vaCenter;
  memo1_1.Frame.Typ:=[ftLeft,ftRight];
  memo1_1.StretchMode:=smMaxHeight;

  next_left:=memo1_1.left+memo1_1.width;

  memo1_2:=TfrxMemoView.Create(gf1);
  memo1_2.CreateUniqueName;
  memo1_2.Height:=0.5*fr1cm;
  memo1_2.Width:=width_name*fr1cm;
  memo1_2.Font.Size:=8;
  memo1_2.Left:=next_left;
  memo1_2.top:=0*fr1cm;
  memo1_2.HAlign:=haCenter;
  memo1_2.VAlign:=vaCenter;
  memo1_2.Frame.Typ:=[ftLeft,ftRight];
  memo1_2.StretchMode:=smMaxHeight;

  next_left:=memo1_2.left+memo1_2.width;


  memo1_3:=TfrxMemoView.Create(gf1);
  memo1_3.CreateUniqueName;
  memo1_3.Height:=0.5*fr1cm;
  memo1_3.Width:=1*fr1cm;
  memo1_3.Font.Size:=8;
  memo1_3.Left:=next_left;
  memo1_3.top:=0*fr1cm;
  memo1_3.HAlign:=haCenter;
  memo1_3.VAlign:=vaCenter;
  memo1_3.Frame.Typ:=[ftLeft,ftRight];
  memo1_3.StretchMode:=smMaxHeight;

  next_left:=memo1_3.left+memo1_3.width;



  memo1_4:=TfrxMemoView.Create(gf1);
  memo1_4.CreateUniqueName;
  memo1_4.Height:=0.5*fr1cm;
  memo1_4.Width:=1*fr1cm;
  memo1_4.Font.Size:=8;
  memo1_4.Left:=next_left;
  memo1_4.top:=0*fr1cm;
  memo1_4.HAlign:=haCenter;
  memo1_4.VAlign:=vaCenter;
  memo1_4.Frame.Typ:=[ftLeft,ftRight];
  memo1_4.StretchMode:=smMaxHeight;
  next_left:=memo1_4.left+memo1_4.width;

      memo1:=TfrxMemoView.Create(gf1);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      if k_=1 then memo1.Width:= (1+width_name)*fr1cm else
      memo1.Width:=1*fr1cm;
      memo1.Font.Size:=8;
      if k_=1 then memo1.Left:=0.8*fr1cm else
      memo1.Left:=7.8*fr1cm;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo1.Color:=$00D8D8D8;
      memo1.Text:='Разом';
      memo1.StretchMode:=smMaxHeight;
     {if grupp[0]=1 then memo1.Text:='Разом за кошт.[frxDBDataset1."SM_KOD"]' ;
      if grupp[0]=2 then memo1.Text:='Разом за рз.[frxDBDataset1."RZ_KOD"]' ;
      if grupp[0]=3 then memo1.Text:='Разом за ст.[frxDBDataset1."ST_KOD"]' ;
      if grupp[0]=4 then memo1.Text:='Разом за КЕКВ [frxDBDataset1."KEKV_KOD"]' ; }

      next_left:=memo1.left+memo1.width;

      memo8:=TfrxMemoView.Create(gf1);
      memo8.CreateUniqueName;
      memo8.Height:=0.5*fr1cm;
      memo8.Width:=1.1*fr1cm;
      memo8.Font.Size:=8;
      memo8.Left:=next_left;
      memo8.top:=0*fr1cm;
      memo8.HAlign:=haCenter;
      memo8.VAlign:=vaCenter;
      memo8.Text:=' ';
      memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo8.StretchMode:=smMaxHeight;
      memo8.Color:=$00D8D8D8;

      next_left:=memo8.left+memo8.width;

      memo9:=TfrxMemoView.Create(gf1);
      memo9.CreateUniqueName;
      memo9.Height:=0.5*fr1cm;
      memo9.Width:=1.6*fr1cm;
      memo9.Font.Size:=8;
      memo9.Left:=next_left;
      memo9.top:=0*fr1cm;
      memo9.HAlign:=haRight;
      memo9.VAlign:=vaCenter;
      memo9.Text:='[SUM(<frxDBDataset1."IN_D_S">)]';
      memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo9.DisplayFormat.Kind:=fkNumeric;
      memo9.DisplayFormat.FormatStr:='%2.2n';
      memo9.StretchMode:=smMaxHeight;
      memo9.Color:=$00D8D8D8;

      next_left:=memo9.left+memo9.width;

      memo10:=TfrxMemoView.Create(gf1);
      memo10.CreateUniqueName;
      memo10.Height:=0.5*fr1cm;
      memo10.Width:=1.6*fr1cm;
      memo10.Font.Size:=8;
      memo10.Left:=next_left;
      memo10.top:=0*fr1cm;
      memo10.HAlign:=haRight;
      memo10.VAlign:=vaCenter;
      memo10.Text:='[SUM(<frxDBDataset1."IN_K_S">)]';
      memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo10.DisplayFormat.Kind:=fkNumeric;
      memo10.DisplayFormat.FormatStr:='%2.2n';
      memo10.StretchMode:=smMaxHeight;
      memo10.Color:=$00D8D8D8;

      next_left:=memo10.left+memo10.width;

      memo11:=TfrxMemoView.Create(gf1);
      memo11.CreateUniqueName;
      memo11.Height:=0.5*fr1cm;
      memo11.Width:=1.8*fr1cm;
      memo11.Font.Size:=8;
      memo11.Left:=next_left;
      memo11.top:=0*fr1cm;
      memo11.HAlign:=haCenter;
      memo11.VAlign:=vaCenter;
      memo11.Text:=' ';
      memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo11.StretchMode:=smMaxHeight;
      memo11.Color:=$00D8D8D8;

      next_left:=memo11.left+memo11.width;

      memo12:=TfrxMemoView.Create(gf1);
      memo12.CreateUniqueName;
      memo12.Height:=0.5*fr1cm;
      memo12.Width:=1.8*fr1cm;
      memo12.Font.Size:=8;
      memo12.Left:=next_left;
      memo12.top:=0*fr1cm;
      memo12.HAlign:=haCenter;
      memo12.VAlign:=vaCenter;
      memo12.Text:=' ';
      memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo12.StretchMode:=smMaxHeight;
      memo12.Color:=$00D8D8D8;

      next_left:=memo12.left+memo12.width;

      memo13:=TfrxMemoView.Create(gf1);
      memo13.CreateUniqueName;
      memo13.Height:=0.5*fr1cm;
      memo13.Width:=1.6*fr1cm;
      memo13.Font.Size:=8;
      memo13.Left:=next_left;
      memo13.top:=0*fr1cm;
      memo13.HAlign:=haRight;
      memo13.VAlign:=vaCenter;
      memo13.Text:='[SUM(<frxDBDataset1."D_S">)]';
      memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo13.DisplayFormat.Kind:=fkNumeric;
      memo13.DisplayFormat.FormatStr:='%2.2n';
      memo13.StretchMode:=smMaxHeight;
      memo13.Color:=$00D8D8D8;

      next_left:=memo13.left+memo13.width;

      memo14:=TfrxMemoView.Create(gf1);
      memo14.CreateUniqueName;
      memo14.Height:=0.5*fr1cm;
      memo14.Width:=1.8*fr1cm;
      memo14.Font.Size:=8;
      memo14.Left:=next_left;
      memo14.top:=0*fr1cm;
      memo14.HAlign:=haCenter;
      memo14.VAlign:=vaCenter;
      memo14.Text:=' ';
      memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo14.StretchMode:=smMaxHeight;
      memo14.Color:=$00D8D8D8;

      next_left:=memo14.left+memo14.width;

      memo15:=TfrxMemoView.Create(gf1);
      memo15.CreateUniqueName;
      memo15.Height:=0.5*fr1cm;
      memo15.Width:=1.8*fr1cm;
      memo15.Font.Size:=8;
      memo15.Left:=next_left;
      memo15.top:=0*fr1cm;
      memo15.HAlign:=haCenter;
      memo15.VAlign:=vaCenter;
      memo15.Text:=' ';
      memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo15.StretchMode:=smMaxHeight;
      memo15.Color:=$00D8D8D8;

      next_left:=memo15.left+memo15.width;

      memo16:=TfrxMemoView.Create(gf1);
      memo16.CreateUniqueName;
      memo16.Height:=0.5*fr1cm;
      memo16.Width:=1.6*fr1cm;
      memo16.Font.Size:=8;
      memo16.Left:=next_left;
      memo16.top:=0*fr1cm;
      memo16.HAlign:=haRight;
      memo16.VAlign:=vaCenter;
      memo16.Text:='[SUM(<frxDBDataset1."K_S">)]';
      memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo16.DisplayFormat.Kind:=fkNumeric;
      memo16.DisplayFormat.FormatStr:='%2.2n';
      memo16.StretchMode:=smMaxHeight;
      memo16.Color:=$00D8D8D8;

      next_left:=memo16.left+memo16.width;

      memo17:=TfrxMemoView.Create(gf1);
      memo17.CreateUniqueName;
      memo17.Height:=0.5*fr1cm;
      memo17.Width:=1.1*fr1cm;
      memo17.Font.Size:=8;
      memo17.Left:=next_left;
      memo17.top:=0*fr1cm;
      memo17.HAlign:=haCenter;
      memo17.VAlign:=vaCenter;
      memo17.Text:=' ';
      memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo17.StretchMode:=smMaxHeight;
      memo17.Color:=$00D8D8D8;

      next_left:=memo17.left+memo17.width;

      memo18:=TfrxMemoView.Create(gf1);
      memo18.CreateUniqueName;
      memo18.Height:=0.5*fr1cm;
      memo18.Width:=1.6*fr1cm;
      memo18.Font.Size:=8;
      memo18.Left:=next_left;
      memo18.top:=0*fr1cm;
      memo18.HAlign:=haRight;
      memo18.VAlign:=vaCenter;
      memo18.Text:='[SUM(<frxDBDataset1."OUT_D_S">)]';
      memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo18.DisplayFormat.Kind:=fkNumeric;
      memo18.DisplayFormat.FormatStr:='%2.2n';
      memo18.StretchMode:=smMaxHeight;
      memo18.Color:=$00D8D8D8;

      next_left:=memo18.left+memo18.width;

      memo19:=TfrxMemoView.Create(gf1);
      memo19.CreateUniqueName;
      memo19.Height:=0.5*fr1cm;
      memo19.Width:=1.6*fr1cm;
      memo19.Font.Size:=8;
      memo19.Left:=next_left;
      memo19.top:=0*fr1cm;
      memo19.HAlign:=haRight;
      memo19.VAlign:=vaCenter;
      memo19.Text:='[SUM(<frxDBDataset1."OUT_K_S">)]';
      memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo19.DisplayFormat.Kind:=fkNumeric;
      memo19.DisplayFormat.FormatStr:='%2.2n';
      memo19.StretchMode:=smMaxHeight;
      memo19.Color:=$00D8D8D8;
    end;

    if i=2 then
    if grupp[1] <> 0 then
    begin
      gf2:=TfrxGroupFooter.Create(page);
      gf2.CreateUniqueName;
      gf2.top:=top_next;
      gf2.Height:=0.5*fr1cm;
      gf2.Stretched:=True;

         memo1:=TfrxMemoView.Create(gf2);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=0.7*fr1cm;
  memo1.Font.Size:=8;
  memo1.Left:=0.1*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:='';
  memo1.Frame.Typ:=[ftLeft,ftRight];
  memo1.StretchMode:=smMaxHeight;

  next_left:=memo1.left+memo1.width;

  memo1_1:=TfrxMemoView.Create(gf2);
  memo1_1.CreateUniqueName;
  memo1_1.Height:=0.5*fr1cm;
  memo1_1.Width:=1*fr1cm;
  memo1_1.Font.Size:=8;
  memo1_1.Left:=next_left;
  memo1_1.top:=0*fr1cm;
  memo1_1.HAlign:=haCenter;
  memo1_1.VAlign:=vaCenter;
  memo1_1.Frame.Typ:=[ftLeft,ftRight];
  memo1_1.StretchMode:=smMaxHeight;

  next_left:=memo1_1.left+memo1_1.width;

  memo1_2:=TfrxMemoView.Create(gf2);
  memo1_2.CreateUniqueName;
  memo1_2.Height:=0.5*fr1cm;
  memo1_2.Width:=width_name*fr1cm;
  memo1_2.Font.Size:=8;
  memo1_2.Left:=next_left;
  memo1_2.top:=0*fr1cm;
  memo1_2.HAlign:=haCenter;
  memo1_2.VAlign:=vaCenter;
  memo1_2.Frame.Typ:=[ftLeft,ftRight];
  memo1_2.StretchMode:=smMaxHeight;

  next_left:=memo1_2.left+memo1_2.width;


  memo1_3:=TfrxMemoView.Create(gf2);
  memo1_3.CreateUniqueName;
  memo1_3.Height:=0.5*fr1cm;
  memo1_3.Width:=1*fr1cm;
  memo1_3.Font.Size:=8;
  memo1_3.Left:=next_left;
  memo1_3.top:=0*fr1cm;
  memo1_3.HAlign:=haCenter;
  memo1_3.VAlign:=vaCenter;
  memo1_3.Frame.Typ:=[ftLeft,ftRight];
  memo1_3.StretchMode:=smMaxHeight;

  next_left:=memo1_3.left+memo1_3.width;

      top_next:=gf2.top + gf2.Height;

      memo1:=TfrxMemoView.Create(gf2);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      if k_=2 then memo1.Width:= (2+width_name)*fr1cm else
      memo1.Width:=2*fr1cm;;
      memo1.Font.Size:=8;
      if k_=2 then memo1.Left:=0.8*fr1cm else
      memo1.Left:=6.8*fr1cm;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo1.Color:=$00D8D8D8;
      memo1.StretchMode:=smMaxHeight;

      memo1.Text:='Разом';
      {
      if grupp[1]=1 then memo1.Text:='Разом за кошт.[frxDBDataset1."SM_KOD"]' ;
      if grupp[1]=2 then memo1.Text:='Разом за рз.[frxDBDataset1."RZ_KOD"]' ;
      if grupp[1]=3 then memo1.Text:='Разом за ст.[frxDBDataset1."ST_KOD"]' ;
      if grupp[1]=4 then memo1.Text:='Разом за КЕКВ [frxDBDataset1."KEKV_KOD"]' ;
       }
      next_left:=memo1.left+memo1.width;

      memo8:=TfrxMemoView.Create(gf2);
      memo8.CreateUniqueName;
      memo8.Height:=0.5*fr1cm;
      memo8.Width:=1.1*fr1cm;
      memo8.Font.Size:=8;
      memo8.Left:=next_left;
      memo8.top:=0*fr1cm;
      memo8.HAlign:=haCenter;
      memo8.VAlign:=vaCenter;
      memo8.Text:=' ';
      memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo8.StretchMode:=smMaxHeight;
      memo8.Color:=$00D8D8D8;

      next_left:=memo8.left+memo8.width;

      memo9:=TfrxMemoView.Create(gf2);
      memo9.CreateUniqueName;
      memo9.Height:=0.5*fr1cm;
      memo9.Width:=1.6*fr1cm;
      memo9.Font.Size:=8;
      memo9.Left:=next_left;
      memo9.top:=0*fr1cm;
      memo9.HAlign:=haRight;
      memo9.VAlign:=vaCenter;
      memo9.Text:='[SUM(<frxDBDataset1."IN_D_S">)]';
      memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo9.DisplayFormat.Kind:=fkNumeric;
      memo9.DisplayFormat.FormatStr:='%2.2n';
      memo9.StretchMode:=smMaxHeight;
      memo9.Color:=$00D8D8D8;

      next_left:=memo9.left+memo9.width;

      memo10:=TfrxMemoView.Create(gf2);
      memo10.CreateUniqueName;
      memo10.Height:=0.5*fr1cm;
      memo10.Width:=1.6*fr1cm;
      memo10.Font.Size:=8;
      memo10.Left:=next_left;
      memo10.top:=0*fr1cm;
      memo10.HAlign:=haRight;
      memo10.VAlign:=vaCenter;
      memo10.Text:='[SUM(<frxDBDataset1."IN_K_S">)]';
      memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo10.DisplayFormat.Kind:=fkNumeric;
      memo10.DisplayFormat.FormatStr:='%2.2n';
      memo10.StretchMode:=smMaxHeight;
      memo10.Color:=$00D8D8D8;

      next_left:=memo10.left+memo10.width;

      memo11:=TfrxMemoView.Create(gf2);
      memo11.CreateUniqueName;
      memo11.Height:=0.5*fr1cm;
      memo11.Width:=1.8*fr1cm;
      memo11.Font.Size:=8;
      memo11.Left:=next_left;
      memo11.top:=0*fr1cm;
      memo11.HAlign:=haCenter;
      memo11.VAlign:=vaCenter;
      memo11.Text:=' ';
      memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo11.StretchMode:=smMaxHeight;
      memo11.Color:=$00D8D8D8;

      next_left:=memo11.left+memo11.width;

      memo12:=TfrxMemoView.Create(gf2);
      memo12.CreateUniqueName;
      memo12.Height:=0.5*fr1cm;
      memo12.Width:=1.8*fr1cm;
      memo12.Font.Size:=8;
      memo12.Left:=next_left;
      memo12.top:=0*fr1cm;
      memo12.HAlign:=haCenter;
      memo12.VAlign:=vaCenter;
      memo12.Text:=' ';
      memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo12.StretchMode:=smMaxHeight;
      memo12.Color:=$00D8D8D8;

      next_left:=memo12.left+memo12.width;

      memo13:=TfrxMemoView.Create(gf2);
      memo13.CreateUniqueName;
      memo13.Height:=0.5*fr1cm;
      memo13.Width:=1.6*fr1cm;
      memo13.Font.Size:=8;
      memo13.Left:=next_left;
      memo13.top:=0*fr1cm;
      memo13.HAlign:=haRight;
      memo13.VAlign:=vaCenter;
      memo13.Text:='[SUM(<frxDBDataset1."D_S">)]';
      memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo13.DisplayFormat.Kind:=fkNumeric;
      memo13.DisplayFormat.FormatStr:='%2.2n';
      memo13.StretchMode:=smMaxHeight;
      memo13.Color:=$00D8D8D8;

      next_left:=memo13.left+memo13.width;

      memo14:=TfrxMemoView.Create(gf2);
      memo14.CreateUniqueName;
      memo14.Height:=0.5*fr1cm;
      memo14.Width:=1.8*fr1cm;
      memo14.Font.Size:=8;
      memo14.Left:=next_left;
      memo14.top:=0*fr1cm;
      memo14.HAlign:=haCenter;
      memo14.VAlign:=vaCenter;
      memo14.Text:=' ';
      memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo14.StretchMode:=smMaxHeight;
      memo14.Color:=$00D8D8D8;

      next_left:=memo14.left+memo14.width;

      memo15:=TfrxMemoView.Create(gf2);
      memo15.CreateUniqueName;
      memo15.Height:=0.5*fr1cm;
      memo15.Width:=1.8*fr1cm;
      memo15.Font.Size:=8;
      memo15.Left:=next_left;
      memo15.top:=0*fr1cm;
      memo15.HAlign:=haCenter;
      memo15.VAlign:=vaCenter;
      memo15.Text:=' ';
      memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo15.StretchMode:=smMaxHeight;
      memo15.Color:=$00D8D8D8;

      next_left:=memo15.left+memo15.width;

      memo16:=TfrxMemoView.Create(gf2);
      memo16.CreateUniqueName;
      memo16.Height:=0.5*fr1cm;
      memo16.Width:=1.6*fr1cm;
      memo16.Font.Size:=8;
      memo16.Left:=next_left;
      memo16.top:=0*fr1cm;
      memo16.HAlign:=haRight;
      memo16.VAlign:=vaCenter;
      memo16.Text:='[SUM(<frxDBDataset1."K_S">)]';
      memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo16.DisplayFormat.Kind:=fkNumeric;
      memo16.DisplayFormat.FormatStr:='%2.2n';
      memo16.StretchMode:=smMaxHeight;
      memo16.Color:=$00D8D8D8;

      next_left:=memo16.left+memo16.width;

      memo17:=TfrxMemoView.Create(gf2);
      memo17.CreateUniqueName;
      memo17.Height:=0.5*fr1cm;
      memo17.Width:=1.1*fr1cm;
      memo17.Font.Size:=8;
      memo17.Left:=next_left;
      memo17.top:=0*fr1cm;
      memo17.HAlign:=haCenter;
      memo17.VAlign:=vaCenter;
      memo17.Text:=' ';
      memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo17.StretchMode:=smMaxHeight;
      memo17.Color:=$00D8D8D8;

      next_left:=memo17.left+memo17.width;

      memo18:=TfrxMemoView.Create(gf2);
      memo18.CreateUniqueName;
      memo18.Height:=0.5*fr1cm;
      memo18.Width:=1.6*fr1cm;
      memo18.Font.Size:=8;
      memo18.Left:=next_left;
      memo18.top:=0*fr1cm;
      memo18.HAlign:=haRight;
      memo18.VAlign:=vaCenter;
      memo18.Text:='[SUM(<frxDBDataset1."OUT_D_S">)]';
      memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo18.DisplayFormat.Kind:=fkNumeric;
      memo18.DisplayFormat.FormatStr:='%2.2n';
      memo18.StretchMode:=smMaxHeight;
      memo18.Color:=$00D8D8D8;

      next_left:=memo18.left+memo18.width;

      memo19:=TfrxMemoView.Create(gf2);
      memo19.CreateUniqueName;
      memo19.Height:=0.5*fr1cm;
      memo19.Width:=1.6*fr1cm;
      memo19.Font.Size:=8;
      memo19.Left:=next_left;
      memo19.top:=0*fr1cm;
      memo19.HAlign:=haRight;
      memo19.VAlign:=vaCenter;
      memo19.Text:='[SUM(<frxDBDataset1."OUT_K_S">)]';
      memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo19.DisplayFormat.Kind:=fkNumeric;
      memo19.DisplayFormat.FormatStr:='%2.2n';
      memo19.StretchMode:=smMaxHeight;
      memo19.Color:=$00D8D8D8;
    end;

    if i=1 then
    if grupp[2] <> 0 then
    begin
      gf3:=TfrxGroupFooter.Create(page);
      gf3.CreateUniqueName;
      gf3.top:=top_next;
      gf3.Height:=0.5*fr1cm;
      gf3.Stretched:=True;

      top_next:=gf3.top + gf3.Height;
         memo1:=TfrxMemoView.Create(gf3);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=0.7*fr1cm;
  memo1.Font.Size:=8;
  memo1.Left:=0.1*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:='';
  memo1.Frame.Typ:=[ftLeft,ftRight];
  memo1.StretchMode:=smMaxHeight;

  next_left:=memo1.left+memo1.width;

  memo1_1:=TfrxMemoView.Create(gf3);
  memo1_1.CreateUniqueName;
  memo1_1.Height:=0.5*fr1cm;
  memo1_1.Width:=1*fr1cm;
  memo1_1.Font.Size:=8;
  memo1_1.Left:=next_left;
  memo1_1.top:=0*fr1cm;
  memo1_1.HAlign:=haCenter;
  memo1_1.VAlign:=vaCenter;
  memo1_1.Frame.Typ:=[ftLeft,ftRight];
  memo1_1.StretchMode:=smMaxHeight;

  next_left:=memo1_1.left+memo1_1.width;

  memo1_2:=TfrxMemoView.Create(gf3);
  memo1_2.CreateUniqueName;
  memo1_2.Height:=0.5*fr1cm;
  memo1_2.Width:=width_name*fr1cm;
  memo1_2.Font.Size:=8;
  memo1_2.Left:=next_left;
  memo1_2.top:=0*fr1cm;
  memo1_2.HAlign:=haCenter;
  memo1_2.VAlign:=vaCenter;
  memo1_2.Frame.Typ:=[ftLeft,ftRight];
  memo1_2.StretchMode:=smMaxHeight;

  next_left:=memo1_2.left+memo1_2.width;
      memo1:=TfrxMemoView.Create(gf3);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      if k_=3 then memo1.Width:= (3+width_name)*fr1cm else
      memo1.Width:=3*fr1cm;;
      memo1.Font.Size:=8;
      if k_=3 then memo1.Left:=0.8*fr1cm else
      memo1.Left:=5.8*fr1cm;;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo1.Color:=$00D8D8D8;
       memo1.Text:='Разом';
       memo1.StretchMode:=smMaxHeight;
      {if grupp[2]=1 then memo1.Text:='Разом за кошт.[frxDBDataset1."SM_KOD"]' ;
      if grupp[2]=2 then memo1.Text:='Разом за рз.[frxDBDataset1."RZ_KOD"]' ;
      if grupp[2]=3 then memo1.Text:='Разом за ст.[frxDBDataset1."ST_KOD"]' ;
      if grupp[2]=4 then memo1.Text:='Разом за КЕКВ [frxDBDataset1."KEKV_KOD"]' ;
         }
      next_left:=memo1.left+memo1.width;

      memo8:=TfrxMemoView.Create(gf3);
      memo8.CreateUniqueName;
      memo8.Height:=0.5*fr1cm;
      memo8.Width:=1.1*fr1cm;
      memo8.Font.Size:=8;
      memo8.Left:=next_left;
      memo8.top:=0*fr1cm;
      memo8.HAlign:=haCenter;
      memo8.VAlign:=vaCenter;
      memo8.Text:=' ';
      memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo8.StretchMode:=smMaxHeight;
      memo8.Color:=$00D8D8D8;

      next_left:=memo8.left+memo8.width;

      memo9:=TfrxMemoView.Create(gf3);
      memo9.CreateUniqueName;
      memo9.Height:=0.5*fr1cm;
      memo9.Width:=1.6*fr1cm;
      memo9.Font.Size:=8;
      memo9.Left:=next_left;
      memo9.top:=0*fr1cm;
      memo9.HAlign:=haRight;
      memo9.VAlign:=vaCenter;
      memo9.Text:='[SUM(<frxDBDataset1."IN_D_S">)]';
      memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo9.DisplayFormat.Kind:=fkNumeric;
      memo9.DisplayFormat.FormatStr:='%2.2n';
      memo9.StretchMode:=smMaxHeight;
      memo9.Color:=$00D8D8D8;

      next_left:=memo9.left+memo9.width;

      memo10:=TfrxMemoView.Create(gf3);
      memo10.CreateUniqueName;
      memo10.Height:=0.5*fr1cm;
      memo10.Width:=1.6*fr1cm;
      memo10.Font.Size:=8;
      memo10.Left:=next_left;
      memo10.top:=0*fr1cm;
      memo10.HAlign:=haRight;
      memo10.VAlign:=vaCenter;
      memo10.Text:='[SUM(<frxDBDataset1."IN_K_S">)]';
      memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo10.DisplayFormat.Kind:=fkNumeric;
      memo10.DisplayFormat.FormatStr:='%2.2n';
      memo10.StretchMode:=smMaxHeight;
      memo10.Color:=$00D8D8D8;

      next_left:=memo10.left+memo10.width;

      memo11:=TfrxMemoView.Create(gf3);
      memo11.CreateUniqueName;
      memo11.Height:=0.5*fr1cm;
      memo11.Width:=1.8*fr1cm;
      memo11.Font.Size:=8;
      memo11.Left:=next_left;
      memo11.top:=0*fr1cm;
      memo11.HAlign:=haCenter;
      memo11.VAlign:=vaCenter;
      memo11.Text:=' ';
      memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo11.StretchMode:=smMaxHeight;
      memo11.Color:=$00D8D8D8;

      next_left:=memo11.left+memo11.width;

      memo12:=TfrxMemoView.Create(gf3);
      memo12.CreateUniqueName;
      memo12.Height:=0.5*fr1cm;
      memo12.Width:=1.8*fr1cm;
      memo12.Font.Size:=8;
      memo12.Left:=next_left;
      memo12.top:=0*fr1cm;
      memo12.HAlign:=haCenter;
      memo12.VAlign:=vaCenter;
      memo12.Text:=' ';
      memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo12.StretchMode:=smMaxHeight;
      memo12.Color:=$00D8D8D8;

      next_left:=memo12.left+memo12.width;

      memo13:=TfrxMemoView.Create(gf3);
      memo13.CreateUniqueName;
      memo13.Height:=0.5*fr1cm;
      memo13.Width:=1.6*fr1cm;
      memo13.Font.Size:=8;
      memo13.Left:=next_left;
      memo13.top:=0*fr1cm;
      memo13.HAlign:=haRight;
      memo13.VAlign:=vaCenter;
      memo13.Text:='[SUM(<frxDBDataset1."D_S">)]';
      memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo13.DisplayFormat.Kind:=fkNumeric;
      memo13.DisplayFormat.FormatStr:='%2.2n';
      memo13.StretchMode:=smMaxHeight;
      memo13.Color:=$00D8D8D8;

      next_left:=memo13.left+memo13.width;

      memo14:=TfrxMemoView.Create(gf3);
      memo14.CreateUniqueName;
      memo14.Height:=0.5*fr1cm;
      memo14.Width:=1.8*fr1cm;
      memo14.Font.Size:=8;
      memo14.Left:=next_left;
      memo14.top:=0*fr1cm;
      memo14.HAlign:=haCenter;
      memo14.VAlign:=vaCenter;
      memo14.Text:=' ';
      memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo14.StretchMode:=smMaxHeight;
      memo14.Color:=$00D8D8D8;

      next_left:=memo14.left+memo14.width;

      memo15:=TfrxMemoView.Create(gf3);
      memo15.CreateUniqueName;
      memo15.Height:=0.5*fr1cm;
      memo15.Width:=1.8*fr1cm;
      memo15.Font.Size:=8;
      memo15.Left:=next_left;
      memo15.top:=0*fr1cm;
      memo15.HAlign:=haCenter;
      memo15.VAlign:=vaCenter;
      memo15.Text:=' ';
      memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo15.StretchMode:=smMaxHeight;
      memo15.Color:=$00D8D8D8;

      next_left:=memo15.left+memo15.width;

      memo16:=TfrxMemoView.Create(gf3);
      memo16.CreateUniqueName;
      memo16.Height:=0.5*fr1cm;
      memo16.Width:=1.6*fr1cm;
      memo16.Font.Size:=8;
      memo16.Left:=next_left;
      memo16.top:=0*fr1cm;
      memo16.HAlign:=haRight;
      memo16.VAlign:=vaCenter;
      memo16.Text:='[SUM(<frxDBDataset1."K_S">)]';
      memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo16.DisplayFormat.Kind:=fkNumeric;
      memo16.DisplayFormat.FormatStr:='%2.2n';
      memo16.StretchMode:=smMaxHeight;
      memo16.Color:=$00D8D8D8;

      next_left:=memo16.left+memo16.width;

      memo17:=TfrxMemoView.Create(gf3);
      memo17.CreateUniqueName;
      memo17.Height:=0.5*fr1cm;
      memo17.Width:=1.1*fr1cm;
      memo17.Font.Size:=8;
      memo17.Left:=next_left;
      memo17.top:=0*fr1cm;
      memo17.HAlign:=haCenter;
      memo17.VAlign:=vaCenter;
      memo17.Text:=' ';
      memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo17.StretchMode:=smMaxHeight;
      memo17.Color:=$00D8D8D8;

      next_left:=memo17.left+memo17.width;

      memo18:=TfrxMemoView.Create(gf3);
      memo18.CreateUniqueName;
      memo18.Height:=0.5*fr1cm;
      memo18.Width:=1.6*fr1cm;
      memo18.Font.Size:=8;
      memo18.Left:=next_left;
      memo18.top:=0*fr1cm;
      memo18.HAlign:=haRight;
      memo18.VAlign:=vaCenter;
      memo18.Text:='[SUM(<frxDBDataset1."OUT_D_S">)]';
      memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo18.DisplayFormat.Kind:=fkNumeric;
      memo18.DisplayFormat.FormatStr:='%2.2n';
      memo18.StretchMode:=smMaxHeight;
      memo18.Color:=$00D8D8D8;

      next_left:=memo18.left+memo18.width;

      memo19:=TfrxMemoView.Create(gf3);
      memo19.CreateUniqueName;
      memo19.Height:=0.5*fr1cm;
      memo19.Width:=1.6*fr1cm;
      memo19.Font.Size:=8;
      memo19.Left:=next_left;
      memo19.top:=0*fr1cm;
      memo19.HAlign:=haRight;
      memo19.VAlign:=vaCenter;
      memo19.Text:='[SUM(<frxDBDataset1."OUT_K_S">)]';
      memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo19.DisplayFormat.Kind:=fkNumeric;
      memo19.DisplayFormat.FormatStr:='%2.2n';
      memo19.StretchMode:=smMaxHeight;
      memo19.Color:=$00D8D8D8;
    end;

    if i=0 then
    if grupp[3] <> 0 then
    begin
      gf4:=TfrxGroupFooter.Create(page);
      gf4.CreateUniqueName;
      gf4.top:=top_next;
      gf4.Height:=0.5*fr1cm;
      gf4.Stretched:=True;

      top_next:=gf4.top + gf4.Height;

       memo1:=TfrxMemoView.Create(gf4);
  memo1.CreateUniqueName;
  memo1.Height:=0.5*fr1cm;
  memo1.Width:=0.7*fr1cm;
  memo1.Font.Size:=8;
  memo1.Left:=0.1*fr1cm;
  memo1.top:=0*fr1cm;
  memo1.HAlign:=haLeft;
  memo1.VAlign:=vaCenter;
  memo1.Text:='';
  memo1.Frame.Typ:=[ftLeft,ftRight];
  memo1.StretchMode:=smMaxHeight;

      memo1:=TfrxMemoView.Create(gf4);
      memo1.CreateUniqueName;
      memo1.Height:=0.5*fr1cm;
      memo1.Width:=(4+width_name)*fr1cm;;
      memo1.Font.Size:=8;
      memo1.Left:=0.8*fr1cm;
      memo1.top:=0;
      memo1.HAlign:=haLeft;
      memo1.VAlign:=vaCenter;
      memo1.Font.Style:=[fsBold];
      memo1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo1.Color:=$00D8D8D8;
      memo1.Text:='Разом';
      memo1.StretchMode:=smMaxHeight;
       {
      if grupp[3]=1 then memo1.Text:='Разом за кошт.[frxDBDataset1."SM_KOD"]' ;
      if grupp[3]=2 then memo1.Text:='Разом за рз.[frxDBDataset1."RZ_KOD"]' ;
      if grupp[3]=3 then memo1.Text:='Разом за ст.[frxDBDataset1."ST_KOD"]' ;
      if grupp[3]=4 then memo1.Text:='Разом за КЕКВ [frxDBDataset1."KEKV_KOD"]' ;
       }
      next_left:=memo1.left+memo1.width;

      memo8:=TfrxMemoView.Create(gf4);
      memo8.CreateUniqueName;
      memo8.Height:=0.5*fr1cm;
      memo8.Width:=1.1*fr1cm;
      memo8.Font.Size:=8;
      memo8.Left:=next_left;
      memo8.top:=0*fr1cm;
      memo8.HAlign:=haCenter;
      memo8.VAlign:=vaCenter;
      memo8.Text:=' ';
      memo8.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo8.StretchMode:=smMaxHeight;
      memo8.Color:=$00D8D8D8;

      next_left:=memo8.left+memo8.width;

      memo9:=TfrxMemoView.Create(gf4);
      memo9.CreateUniqueName;
      memo9.Height:=0.5*fr1cm;
      memo9.Width:=1.6*fr1cm;
      memo9.Font.Size:=8;
      memo9.Left:=next_left;
      memo9.top:=0*fr1cm;
      memo9.HAlign:=haRight;
      memo9.VAlign:=vaCenter;
      memo9.Text:='[SUM(<frxDBDataset1."IN_D_S">)]';
      memo9.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo9.DisplayFormat.Kind:=fkNumeric;
      memo9.DisplayFormat.FormatStr:='%2.2n';
      memo9.StretchMode:=smMaxHeight;
      memo9.Color:=$00D8D8D8;

      next_left:=memo9.left+memo9.width;

      memo10:=TfrxMemoView.Create(gf4);
      memo10.CreateUniqueName;
      memo10.Height:=0.5*fr1cm;
      memo10.Width:=1.6*fr1cm;
      memo10.Font.Size:=8;
      memo10.Left:=next_left;
      memo10.top:=0*fr1cm;
      memo10.HAlign:=haRight;
      memo10.VAlign:=vaCenter;
      memo10.Text:='[SUM(<frxDBDataset1."IN_K_S">)]';
      memo10.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo10.DisplayFormat.Kind:=fkNumeric;
      memo10.DisplayFormat.FormatStr:='%2.2n';
      memo10.StretchMode:=smMaxHeight;
      memo10.Color:=$00D8D8D8;

      next_left:=memo10.left+memo10.width;

      memo11:=TfrxMemoView.Create(gf4);
      memo11.CreateUniqueName;
      memo11.Height:=0.5*fr1cm;
      memo11.Width:=1.8*fr1cm;
      memo11.Font.Size:=8;
      memo11.Left:=next_left;
      memo11.top:=0*fr1cm;
      memo11.HAlign:=haCenter;
      memo11.VAlign:=vaCenter;
      memo11.Text:=' ';
      memo11.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo11.StretchMode:=smMaxHeight;
      memo11.Color:=$00D8D8D8;

      next_left:=memo11.left+memo11.width;

      memo12:=TfrxMemoView.Create(gf4);
      memo12.CreateUniqueName;
      memo12.Height:=0.5*fr1cm;
      memo12.Width:=1.8*fr1cm;
      memo12.Font.Size:=8;
      memo12.Left:=next_left;
      memo12.top:=0*fr1cm;
      memo12.HAlign:=haCenter;
      memo12.VAlign:=vaCenter;
      memo12.Text:=' ';
      memo12.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo12.StretchMode:=smMaxHeight;
      memo12.Color:=$00D8D8D8;

      next_left:=memo12.left+memo12.width;

      memo13:=TfrxMemoView.Create(gf4);
      memo13.CreateUniqueName;
      memo13.Height:=0.5*fr1cm;
      memo13.Width:=1.6*fr1cm;
      memo13.Font.Size:=8;
      memo13.Left:=next_left;
      memo13.top:=0*fr1cm;
      memo13.HAlign:=haRight;
      memo13.VAlign:=vaCenter;
      memo13.Text:='[SUM(<frxDBDataset1."D_S">)]';
      memo13.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo13.DisplayFormat.Kind:=fkNumeric;
      memo13.DisplayFormat.FormatStr:='%2.2n';
      memo13.StretchMode:=smMaxHeight;
      memo13.Color:=$00D8D8D8;

      next_left:=memo13.left+memo13.width;

      memo14:=TfrxMemoView.Create(gf4);
      memo14.CreateUniqueName;
      memo14.Height:=0.5*fr1cm;
      memo14.Width:=1.8*fr1cm;
      memo14.Font.Size:=8;
      memo14.Left:=next_left;
      memo14.top:=0*fr1cm;
      memo14.HAlign:=haCenter;
      memo14.VAlign:=vaCenter;
      memo14.Text:=' ';
      memo14.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo14.StretchMode:=smMaxHeight;
      memo14.Color:=$00D8D8D8;

      next_left:=memo14.left+memo14.width;

      memo15:=TfrxMemoView.Create(gf4);
      memo15.CreateUniqueName;
      memo15.Height:=0.5*fr1cm;
      memo15.Width:=1.8*fr1cm;
      memo15.Font.Size:=8;
      memo15.Left:=next_left;
      memo15.top:=0*fr1cm;
      memo15.HAlign:=haCenter;
      memo15.VAlign:=vaCenter;
      memo15.Text:=' ';
      memo15.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo15.StretchMode:=smMaxHeight;
      memo15.Color:=$00D8D8D8;

      next_left:=memo15.left+memo15.width;

      memo16:=TfrxMemoView.Create(gf4);
      memo16.CreateUniqueName;
      memo16.Height:=0.5*fr1cm;
      memo16.Width:=1.6*fr1cm;
      memo16.Font.Size:=8;
      memo16.Left:=next_left;
      memo16.top:=0*fr1cm;
      memo16.HAlign:=haRight;
      memo16.VAlign:=vaCenter;
      memo16.Text:='[SUM(<frxDBDataset1."K_S">)]';
      memo16.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo16.DisplayFormat.Kind:=fkNumeric;
      memo16.DisplayFormat.FormatStr:='%2.2n';
      memo16.StretchMode:=smMaxHeight;
      memo16.Color:=$00D8D8D8;

      next_left:=memo16.left+memo16.width;

      memo17:=TfrxMemoView.Create(gf4);
      memo17.CreateUniqueName;
      memo17.Height:=0.5*fr1cm;
      memo17.Width:=1.1*fr1cm;
      memo17.Font.Size:=8;
      memo17.Left:=next_left;
      memo17.top:=0*fr1cm;
      memo17.HAlign:=haCenter;
      memo17.VAlign:=vaCenter;
      memo17.Text:=' ';
      memo17.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo17.StretchMode:=smMaxHeight;
      memo17.Color:=$00D8D8D8;

      next_left:=memo17.left+memo17.width;

      memo18:=TfrxMemoView.Create(gf4);
      memo18.CreateUniqueName;
      memo18.Height:=0.5*fr1cm;
      memo18.Width:=1.6*fr1cm;
      memo18.Font.Size:=8;
      memo18.Left:=next_left;
      memo18.top:=0*fr1cm;
      memo18.HAlign:=haRight;
      memo18.VAlign:=vaCenter;
      memo18.Text:='[SUM(<frxDBDataset1."OUT_D_S">)]';
      memo18.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo18.DisplayFormat.Kind:=fkNumeric;
      memo18.DisplayFormat.FormatStr:='%2.2n';
      memo18.StretchMode:=smMaxHeight;
      memo18.Color:=$00D8D8D8;

      next_left:=memo18.left+memo18.width;

      memo19:=TfrxMemoView.Create(gf4);
      memo19.CreateUniqueName;
      memo19.Height:=0.5*fr1cm;
      memo19.Width:=1.6*fr1cm;
      memo19.Font.Size:=8;
      memo19.Left:=next_left;
      memo19.top:=0*fr1cm;
      memo19.HAlign:=haRight;
      memo19.VAlign:=vaCenter;
      memo19.Text:='[SUM(<frxDBDataset1."OUT_K_S">)]';
      memo19.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
      memo19.DisplayFormat.Kind:=fkNumeric;
      memo19.DisplayFormat.FormatStr:='%2.2n';
      memo19.StretchMode:=smMaxHeight;
      memo19.Color:=$00D8D8D8;
    end;

  end;
end;

procedure TSchOborotForm.cx_1PropertiesChange(Sender: TObject);
var is_0, is_1, is_2, is_3:Integer;
begin
  is_0:=0;
  is_1:=0;
  is_2:=0;
  is_3:=0;
  
  if cx_1.itemindex=0 then is_0:=1;
  if cx_2.itemindex=0 then is_0:=1;
  if cx_3.itemindex=0 then is_0:=1;
  if cx_4.itemindex=0 then is_0:=1;

  if cx_1.itemindex=1 then is_1:=1;
  if cx_2.itemindex=1 then is_1:=1;
  if cx_3.itemindex=1 then is_1:=1;
  if cx_4.itemindex=1 then is_1:=1;

  if cx_1.itemindex=2 then is_2:=1;
  if cx_2.itemindex=2 then is_2:=1;
  if cx_3.itemindex=2 then is_2:=1;
  if cx_4.itemindex=2 then is_2:=1;

  if cx_1.itemindex=3 then is_3:=1;
  if cx_2.itemindex=3 then is_3:=1;
  if cx_3.itemindex=3 then is_3:=1;
  if cx_4.itemindex=3 then is_3:=1;

  if cx_1.itemindex=cx_2.itemindex then
  begin
    if is_0 = 0 then cx_2.itemindex:=0;
    if is_1 = 0 then cx_2.itemindex:=1;
    if is_2 = 0 then cx_2.itemindex:=2;
    if is_3 = 0 then cx_2.itemindex:=3;
  end;

  if cx_1.itemindex=cx_3.itemindex then
  begin
    if is_0 = 0 then cx_3.itemindex:=0;
    if is_1 = 0 then cx_3.itemindex:=1;
    if is_2 = 0 then cx_3.itemindex:=2;
    if is_3 = 0 then cx_3.itemindex:=3;
  end;

    if cx_1.itemindex=cx_4.itemindex then
  begin
    if is_0 = 0 then cx_4.itemindex:=0;
    if is_1 = 0 then cx_4.itemindex:=1;
    if is_2 = 0 then cx_4.itemindex:=2;
    if is_3 = 0 then cx_4.itemindex:=3;
  end;
end;

procedure TSchOborotForm.cx_2PropertiesChange(Sender: TObject);
var is_0, is_1, is_2, is_3:Integer;
begin
  is_0:=0;
  is_1:=0;
  is_2:=0;
  is_3:=0;
  
  if cx_1.itemindex=0 then is_0:=1;
  if cx_2.itemindex=0 then is_0:=1;
  if cx_3.itemindex=0 then is_0:=1;
  if cx_4.itemindex=0 then is_0:=1;

  if cx_1.itemindex=1 then is_1:=1;
  if cx_2.itemindex=1 then is_1:=1;
  if cx_3.itemindex=1 then is_1:=1;
  if cx_4.itemindex=1 then is_1:=1;

  if cx_1.itemindex=2 then is_2:=1;
  if cx_2.itemindex=2 then is_2:=1;
  if cx_3.itemindex=2 then is_2:=1;
  if cx_4.itemindex=2 then is_2:=1;

  if cx_1.itemindex=3 then is_3:=1;
  if cx_2.itemindex=3 then is_3:=1;
  if cx_3.itemindex=3 then is_3:=1;
  if cx_4.itemindex=3 then is_3:=1;

  if cx_2.itemindex=cx_1.itemindex then
  begin
    if is_0 = 0 then cx_1.itemindex:=0;
    if is_1 = 0 then cx_1.itemindex:=1;
    if is_2 = 0 then cx_1.itemindex:=2;
    if is_3 = 0 then cx_1.itemindex:=3;
  end;

  if cx_2.itemindex=cx_3.itemindex then
  begin
    if is_0 = 0 then cx_3.itemindex:=0;
    if is_1 = 0 then cx_3.itemindex:=1;
    if is_2 = 0 then cx_3.itemindex:=2;
    if is_3 = 0 then cx_3.itemindex:=3;
  end;

    if cx_2.itemindex=cx_4.itemindex then
  begin
    if is_0 = 0 then cx_4.itemindex:=0;
    if is_1 = 0 then cx_4.itemindex:=1;
    if is_2 = 0 then cx_4.itemindex:=2;
    if is_3 = 0 then cx_4.itemindex:=3;
  end;

end;

procedure TSchOborotForm.cx_3PropertiesChange(Sender: TObject);
var is_0, is_1, is_2, is_3:Integer;
begin
  is_0:=0;
  is_1:=0;
  is_2:=0;
  is_3:=0;
  
  if cx_1.itemindex=0 then is_0:=1;
  if cx_2.itemindex=0 then is_0:=1;
  if cx_3.itemindex=0 then is_0:=1;
  if cx_4.itemindex=0 then is_0:=1;

  if cx_1.itemindex=1 then is_1:=1;
  if cx_2.itemindex=1 then is_1:=1;
  if cx_3.itemindex=1 then is_1:=1;
  if cx_4.itemindex=1 then is_1:=1;

  if cx_1.itemindex=2 then is_2:=1;
  if cx_2.itemindex=2 then is_2:=1;
  if cx_3.itemindex=2 then is_2:=1;
  if cx_4.itemindex=2 then is_2:=1;

  if cx_1.itemindex=3 then is_3:=1;
  if cx_2.itemindex=3 then is_3:=1;
  if cx_3.itemindex=3 then is_3:=1;
  if cx_4.itemindex=3 then is_3:=1;

  if cx_3.itemindex=cx_2.itemindex then
  begin
    if is_0 = 0 then cx_2.itemindex:=0;
    if is_1 = 0 then cx_2.itemindex:=1;
    if is_2 = 0 then cx_2.itemindex:=2;
    if is_3 = 0 then cx_2.itemindex:=3;
  end;

  if cx_3.itemindex=cx_1.itemindex then
  begin
    if is_0 = 0 then cx_1.itemindex:=0;
    if is_1 = 0 then cx_1.itemindex:=1;
    if is_2 = 0 then cx_1.itemindex:=2;
    if is_3 = 0 then cx_1.itemindex:=3;
  end ;

    if cx_3.itemindex=cx_4.itemindex then
  begin
    if is_0 = 0 then cx_4.itemindex:=0;
    if is_1 = 0 then cx_4.itemindex:=1;
    if is_2 = 0 then cx_4.itemindex:=2;
    if is_3 = 0 then cx_4.itemindex:=3;
  end  ;

end;

procedure TSchOborotForm.cx_4PropertiesChange(Sender: TObject);
var is_0, is_1, is_2, is_3:Integer;
begin
  is_0:=0;
  is_1:=0;
  is_2:=0;
  is_3:=0;
  
  if cx_1.itemindex=0 then is_0:=1;
  if cx_2.itemindex=0 then is_0:=1;
  if cx_3.itemindex=0 then is_0:=1;
  if cx_4.itemindex=0 then is_0:=1;

  if cx_1.itemindex=1 then is_1:=1;
  if cx_2.itemindex=1 then is_1:=1;
  if cx_3.itemindex=1 then is_1:=1;
  if cx_4.itemindex=1 then is_1:=1;

  if cx_1.itemindex=2 then is_2:=1;
  if cx_2.itemindex=2 then is_2:=1;
  if cx_3.itemindex=2 then is_2:=1;
  if cx_4.itemindex=2 then is_2:=1;

  if cx_1.itemindex=3 then is_3:=1;
  if cx_2.itemindex=3 then is_3:=1;
  if cx_3.itemindex=3 then is_3:=1;
  if cx_4.itemindex=3 then is_3:=1;

  if cx_4.itemindex=cx_2.itemindex then
  begin
    if is_0 = 0 then cx_2.itemindex:=0;
    if is_1 = 0 then cx_2.itemindex:=1;
    if is_2 = 0 then cx_2.itemindex:=2;
    if is_3 = 0 then cx_2.itemindex:=3;
  end;

  if cx_4.itemindex=cx_3.itemindex then
  begin
    if is_0 = 0 then cx_3.itemindex:=0;
    if is_1 = 0 then cx_3.itemindex:=1;
    if is_2 = 0 then cx_3.itemindex:=2;
    if is_3 = 0 then cx_3.itemindex:=3;
  end;

    if cx_4.itemindex=cx_1.itemindex then
  begin
    if is_0 = 0 then cx_1.itemindex:=0;
    if is_1 = 0 then cx_1.itemindex:=1;
    if is_2 = 0 then cx_1.itemindex:=2;
    if is_3 = 0 then cx_1.itemindex:=3;
  end;

end;

end.
