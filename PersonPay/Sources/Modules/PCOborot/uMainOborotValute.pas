unit uMainOborotValute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, frxExportImage,
  frxExportPDF, frxExportRTF, frxExportXLS, frxExportHTML, frxClass,
  frxExportTXT, frxCross, Placemnt, ActnList, frxDesgn, frxDBSet,
  cxGridTableView, FIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxCheckBox, cxTextEdit,
  StdCtrls, cxButtons, cxSpinEdit, cxContainer, cxMaskEdit, cxDropDownEdit,
  ExtCtrls,ibase, uMainPerem, uWate,  uMainFanc, Menus, RxMemDS, frxChart, DateUtils,
  Kernel, UPCPackMan, cxButtonEdit;

type
  TOborotFormValute = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxButton1: TcxButton;
    OkButton: TcxButton;
    CancelBut: TcxButton;
    TextFIO: TcxTextEdit;
    cxButton2: TcxButton;
    cxTextEditSmeta: TcxTextEdit;
    cxTextEditSch: TcxTextEdit;
    cxRZ: TcxTextEdit;
    cxStat: TcxTextEdit;
    cxFiltr: TcxComboBox;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    cxCheckBoxDate: TcxCheckBox;
    cxNumDog: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGridFIO: TcxGridDBBandedColumn;
    cxGridIN_DB_SUMMA: TcxGridDBBandedColumn;
    cxGridIN_DB_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridIN_KR_SUMMA: TcxGridDBBandedColumn;
    cxGridIN_KR_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridDB_SUMMA: TcxGridDBBandedColumn;
    cxGridDB_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridSM_KOD: TcxGridDBBandedColumn;
    cxGridRZ_KOD: TcxGridDBBandedColumn;
    cxGridST_KOD: TcxGridDBBandedColumn;
    cxGridKEKV_KOD: TcxGridDBBandedColumn;
    cxGridKR_SUMMA: TcxGridDBBandedColumn;
    cxGridKR_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridOUT_DB_SUMMA: TcxGridDBBandedColumn;
    cxGridOUT_DB_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridOUT_KR_SUMMA: TcxGridDBBandedColumn;
    cxGridOUT_KR_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridSch: TcxGridDBBandedColumn;
    cxGridIS_Summa: TcxGridDBBandedColumn;
    cxGrid1DATE_EXEC_DOLG: TcxGridDBBandedColumn;
    cxGrid1DATE_OST_MOOVE: TcxGridDBBandedColumn;
    cxGrid1NUM_DOG: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    DatabaseWork: TpFIBDatabase;
    DataSetWork: TpFIBDataSet;
    dsSourseWork: TDataSource;
    ReadTr: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
    DataSetForGrid: TpFIBDataSet;
    dsForGrid: TDataSource;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    frxDBDataset1: TfrxDBDataset;
    frReport: TfrxReport;
    DataSetReport: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    actlst1: TActionList;
    actShow: TAction;
    actPrint: TAction;
    actClose: TAction;
    actFiltr: TAction;
    FormStorage1: TFormStorage;
    frxCrossObject1: TfrxCrossObject;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxBMPExport1: TfrxBMPExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxTIFFExport1: TfrxTIFFExport;
    cxGridVALUTE: TcxGridDBBandedColumn;
    StPr_CloseProv: TpFIBStoredProc;
    TR_VAL: TpFIBTransaction;
    DataSetForGridID_PC_TMP: TFIBBCDField;
    DataSetForGridID_DOG: TFIBBCDField;
    DataSetForGridKOD_DOG: TFIBBCDField;
    DataSetForGridIN_DB_SUMMA: TFIBBCDField;
    DataSetForGridIN_KR_SUMMA: TFIBBCDField;
    DataSetForGridOUT_DB_SUMMA: TFIBBCDField;
    DataSetForGridOUT_KR_SUMMA: TFIBBCDField;
    DataSetForGridDB_SUMMA: TFIBBCDField;
    DataSetForGridKR_SUMMA: TFIBBCDField;
    DataSetForGridID_SM: TFIBBCDField;
    DataSetForGridID_RZ: TFIBBCDField;
    DataSetForGridID_ST: TFIBBCDField;
    DataSetForGridID_KEKV: TFIBBCDField;
    DataSetForGridSM_TITLE: TFIBStringField;
    DataSetForGridSM_KOD: TFIBIntegerField;
    DataSetForGridRZ_TITLE: TFIBStringField;
    DataSetForGridRZ_KOD: TFIBIntegerField;
    DataSetForGridST_TITLE: TFIBStringField;
    DataSetForGridST_KOD: TFIBIntegerField;
    DataSetForGridKEKV_TITLE: TFIBStringField;
    DataSetForGridKEKV_KOD: TFIBIntegerField;
    DataSetForGridFIO: TFIBStringField;
    DataSetForGridID_SCH: TFIBBCDField;
    DataSetForGridSCH_NUMBER: TFIBStringField;
    DataSetForGridSCH_TITLE: TFIBStringField;
    DataSetForGridIS_SUMMA: TFIBIntegerField;
    DataSetForGridFIO_VIVOD: TFIBStringField;
    DataSetForGridDATE_OST_MOOVEE: TFIBDateField;
    DataSetForGridDATE_EXEC_DOLGG: TFIBDateField;
    DataSetForGridDATE_OST_MOOVE: TFIBStringField;
    DataSetForGridDATE_EXEC_DOLG: TFIBStringField;
    DataSetForGridNUM_DOG: TFIBStringField;
    DataSetForGridIN_DB_SUMMA_VAL: TFIBBCDField;
    DataSetForGridIN_KR_SUMMA_VAL: TFIBBCDField;
    DataSetForGridOUT_DB_SUMMA_VAL: TFIBBCDField;
    DataSetForGridOUT_KR_SUMMA_VAL: TFIBBCDField;
    DataSetForGridDB_SUMMA_VAL: TFIBBCDField;
    DataSetForGridKR_SUMMA_VAL: TFIBBCDField;
    DataSetForGridID_VALUTE: TFIBBCDField;
    DataSetForGridNAME_VALUTE: TFIBStringField;
    ds_utv: TpFIBDataSet;
    ds_utvRESULT: TFIBIntegerField;
    DataSetForGridDATE_OST: TStringField;
    DataSetForGridDATE_EXEC: TStringField;
    DataSetForGridN_DOG: TStringField;
    DataSetForGridSYMBOL: TFIBStringField;
    ds_tmp_valute: TpFIBDataSet;
    DataSetForGridFIO_1: TStringField;
    lbl8: TLabel;
    cxVal: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
   procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actShowExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actFiltrExecute(Sender: TObject);
    procedure cxCheckBoxFIOClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DataSetForGridCalcFields(DataSet: TDataSet);
    procedure cxCheckBoxDatePropertiesChange(Sender: TObject);
    procedure GlobalFiltr;
    procedure cxNumDogPropertiesChange(Sender: TObject);
    procedure DataSetForGridIN_DB_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetForGridIN_KR_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetForGridOUT_DB_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetForGridOUT_KR_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetForGridDB_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetForGridKR_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    global_filtr:string;
    fio: string;
    id_pc_tmp, id_session:integer;
    DBEG, DEND: TDateTime;
    is_come:Integer;
    is_filtr, rx_rec:Integer;
    fac_flag, spec_flag, nat_flag, f_stud_flag, k_stud_flag, kurs_flag, n_gr_flag, all_ok:Integer;
    obsh_flag, fac_st_flag, kurs_st_flag, kat_pay_flag, type_live_flag, cl_live_flag, grp_flag:Integer;
    print_ost:Boolean;
//    procedure MakeReport;
//    procedure MakeReport_ost;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowOborotValuteForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowOborotValuteForm;

var
  OborotFormValute: TOborotFormValute;

implementation

{$R *.dfm}
uses uProvodkiValute, uPrint, uChooseParam, uSelectAction, uCloseProv, uUtvDoc;

constructor TOborotFormValute.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
var DATE_REC:TDateTime;
    month, year:Word;
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
 Self.cxYearBeg.value:=year;
 Self.cxMonthEnd.ItemIndex:=month-1;
 Self.cxYearEnd.value:=year;
 is_come:=0;
 with FormStorage1 do
 begin
  RestoreFormPlacement;
  Self.cxGrid1DBBandedTableView1.Bands[1].Width:=StoredValue['Band1'];
  Self.cxGrid1DBBandedTableView1.Bands[2].Width:=StoredValue['Band2'];
  Self.cxGrid1DBBandedTableView1.Bands[3].Width:=StoredValue['Band3'];
  Self.cxGrid1DBBandedTableView1.Bands[4].Width:=StoredValue['Band4'];
  Self.cxGrid1DBBandedTableView1.Bands[5].Width:=StoredValue['Band5'];
  Self.cxGrid1DBBandedTableView1.Bands[6].Width:=StoredValue['Band6'];
 end;
 is_filtr:=0;
 Self.cxFiltr.ItemIndex:=0;
fio:='';
fac_flag:=0;
spec_flag:=0;
nat_flag:=0;
f_stud_flag:=0;
k_stud_flag:=0;
kurs_flag:=0;
n_gr_flag:=0;

obsh_flag:=0;
fac_st_flag:=0;
kurs_st_flag:=0;
kat_pay_flag:=0;
type_live_flag:=0;
cl_live_flag:=0;
grp_flag:=0;
all_ok:=0;

global_filtr:='';
//access
//actPrint.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_OBOROT/PC_MAIN_OBOROT','Print', false)=0;
actShow.Execute;
end;
end;

procedure ShowOborotValuteForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
var form : TOborotFormValute;
begin
form := TOborotFormValute.Create(AOwner, DBHANDLE);
Form.Caption:='Обороти (валюта)';
Form.Show;
//Form.Free;
end;


procedure TOborotFormValute.GlobalFiltr;
var prefix:string;
begin
global_filtr:='';
prefix:=' WHERE ';
if TextFIO.text<>''then
begin
 global_filtr:=global_filtr + prefix+ ' FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ';
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 global_filtr:= global_filtr + prefix+' SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ';
 prefix:=' AND ';
end;

if cxRZ.text<>''then
begin
 global_filtr:= global_filtr + prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ';
 prefix:=' AND ';
end;

if cxSTAT.text<>''then
begin
 global_filtr:= global_filtr + prefix+' ST_KOD LIKE '+''''+cxStat.text+'%'+''' ';
 prefix:=' AND ';
end;

if cxTextEditSch.text<>''then
begin
 global_filtr:= global_filtr + prefix+' SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ';
end;

if cxFiltr.ItemIndex = 1 then
begin
 global_filtr:= global_filtr + prefix+ ' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0 ';
 prefix:=' AND ';
end;

if cxFiltr.ItemIndex = 2 then
begin
 global_filtr:= global_filtr + prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0 ';
 prefix:=' AND ';
end;
end;

procedure TOborotFormValute.cxGrid1DBBandedTableView1DblClick(Sender: TObject);
var form:TProvodkiValuteForm;
begin
if DataSetForGrid.IsEmpty then exit;
if DataSetForGridIS_SUMMA.AsInteger = 2 then Exit;
id_pc_tmp:=DataSetForGridID_PC_TMP.AsInteger;
//showmessage(inttostr(id_session));
Form:=TProvodkiValuteForm.Create(Self, DBHANDLE, id_pc_tmp, id_session);
form.ShowModal;
end;

procedure TOborotFormValute.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FormStorage1.StoredValue['Band1']:=cxGrid1DBBandedTableView1.Bands[1].Width;
  FormStorage1.StoredValue['Band2']:=cxGrid1DBBandedTableView1.Bands[2].Width;
  FormStorage1.StoredValue['Band3']:=cxGrid1DBBandedTableView1.Bands[3].Width;
  FormStorage1.StoredValue['Band4']:=cxGrid1DBBandedTableView1.Bands[4].Width;
  FormStorage1.StoredValue['Band5']:=cxGrid1DBBandedTableView1.Bands[5].Width;
  FormStorage1.StoredValue['Band6']:=cxGrid1DBBandedTableView1.Bands[6].Width;
  FormStorage1.SaveFormPlacement;
// чистим временные таблицы
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
 end;
 Action:=caFree;
end;

procedure TOborotFormValute.actShowExecute(Sender: TObject);
var
// DBEG, DEND: TDateTime;
 Year, Month: Word;
 form:TWateForm;
 prefix: string;
 is_one:Integer;
 form_sel:TSelectActionForm;
 is_moove, IS_UTV:Integer;
 f_close:TCloseProvForm;
 STRU:KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 ErrorList   : TStringList;
 MemoLines   : TStringList;
 go_on,kol_valute, add_to_pc:Integer;
 f_docs: TDocValForm;
 kurs:Double;
 pk_id:Int64;
 date_end:TDateTime;
begin
  is_moove:=0;
  is_filtr:=0;
  is_one:=0;

is_come:=is_come+1;
Year:=cxYearBeg.Value;
Month:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(Year, Month);
Year:=cxYearEnd.Value;
Month:=cxMonthEnd.ItemIndex+1;
DEND:=EndOfAMonth(Year, Month);
// sobiraem vse doki

if all_ok = 0 then
begin
form:=TWateForm.Create(Self);
form.cxLabel1.Caption:='Триває збір документів системи...';
form.Show;
form.Update;
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_FROM_PUB_DOC_TO_PC_DOC';
 StorProc.Prepare;
 StorProc.ParamByName('DATE_BEG').AsDate:=DBEG;
 StorProc.ParamByName('DATE_END').AsDate:=DEND;
 StorProc.ParamByName('ID_REG').AsInteger:=ID_REG;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
form.Free;
// proveryaem est li neotrabotannie
IS_UTV:=StorProc.ParamByName('RESULT').AsInteger;
if IS_UTV = 1 then
begin
  form_sel:=TSelectActionForm.Create(Self);
  form_sel.ShowModal;
  if form_sel.ModalResult = mrCancel then Close;
  if form_sel.ModalResult = mrOk then
  begin
    go_on:=form_sel.go_on;
    if go_on = 0 then
    begin
     f_docs:=TDocValForm.Create(Self, DBHANDLE,0);
    // f_docs.FormStyle:=fsMDIChild;
    // f_docs.WindowState:=wsMinimized;
     f_docs.ShowModal;
     f_docs.Free; //UPCPackMan.ShowDocValForm(Self, DBHANDLE,1);
     go_on:=1;
    end;
  end;
  form_sel.Free;
end
else go_on:=1;
end
else go_on:=1;
//
if go_on=1 then
begin
form:=TWateForm.Create(Self);
form.Show;
form.Update;
// чистим временные таблицы
if is_come>1 then
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
// выбираем сессию
try
//  showmessage(inttostr(ID_REG));
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_TMP_OBOROT_INS_UPD_VALUTE';
 StorProc.Prepare;
 StorProc.ParamByName('DATE_BEG').Value:=DBEG;
 StorProc.ParamByName('DATE_END').Value:=DEND;
 StorProc.ParamByName('ID_REG').Value:=ID_REG;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
 end;
end;
id_session:=StorProc.ParamByName('ID_SESSION').Value;

DataSetForGrid.Close;
DataSetForGrid.SelectSQL.Clear;
DataSetForGrid.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT_VAL_2(:ID_SESSION, :DATE_REG, :ID_REG)' );
prefix:=' WHERE ';
if TextFIO.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxRZ.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxSTAT.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxTextEditSch.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 1 then
begin
  if is_one=1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0') else
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) and OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 2 then
begin
  if is_one = 1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0') else
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) and OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 3 then
begin
  if is_one=1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0')else
 DataSetForGrid.SelectSQL.Add(prefix+'is_summa = 2 and OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0');
  prefix:=' AND ';
 is_filtr:=1;
end;

if cxVal.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'NAME_VALUTE LIKE '+''''+AnsiUpperCase(cxVal.text)+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
end;
{if cxCheckBoxFIO.Checked = False then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'(IS_SUMMA = 0 OR IS_SUMMA = 2) ');
 prefix:=' AND ';
end; }
DataSetForGrid.SelectSQL.Add(' ORDER BY FIO, id_dog, IS_SUMMA ');
DataSetForGrid.Prepare;
DataSetForGrid.ParamByName('ID_SESSION').AsInteger:=id_session;
DataSetForGrid.ParamByName('DATE_REG').Value:=DBEG;
DataSetForGrid.ParamByName('ID_REG').Value:=ID_REG;
DataSetForGrid.CloseOpen(False);
//DataSetForGrid.Locate('IS_SUMMA',4,[]);
//kol_valute:=DataSetForGrid.FieldValues['KOL_VALUTE'];
DataSetForGrid.First;
form.Free;
cxGrid1DBBandedTableView1.ViewData.Expand(true);

ds_utv.close;
ds_utv.ParamByName('DATE_BEG').asDate:=DBEG;
ds_utv.ParamByName('DATE_END').asDate:=DEND;
ds_utv.closeopen(False);
is_utv:=ds_utvRESULT.AsInteger;
ds_utv.close;

IF ((IS_UTV<>1) and (all_ok=0)) then
begin
   f_close:=TCloseProvForm.Create(Self);
   f_close.cxDateEdit.Properties.MaxDate:=DEND;
   f_close.cxDateEdit.Properties.MinDate:=DBEG;
   f_close.cxDateEdit.EditValue:=DEND;
   f_close.ShowModal;
   if f_close.ModalResult=mrOk then
   begin
   all_ok:=1;
 //
   date_end:=f_close.cxDateEdit.EditValue;
   ds_tmp_valute.Close;
   ds_tmp_valute.SelectSQL.Clear;
   ds_tmp_valute.SelectSQL.Add('select id_valute, name_val from pc_tmp_valute  where id_session=:id_session');
   ds_tmp_valute.Prepare;
   ds_tmp_valute.ParamByName('ID_SESSION').AsInteger:=id_session;
   ds_tmp_valute.CloseOpen(False);
   ds_tmp_valute.First;
   while not ds_tmp_valute.Eof do
   begin
   form:=TWateForm.Create(Self);
   form.cxLabel1.Caption:='Триває створення документу індексації за валютою '+VarToStr(ds_tmp_valute.FieldValues['NAME_VAL']);
   form.Show;
   form.Update;
   try
   StPr_CloseProv.Close;
   StPr_CloseProv.Transaction := TR_VAL;
   StPr_CloseProv.Transaction.StartTransaction;
   StPr_CloseProv.StoredProcName:='PC_DT_CLOSE_RAZNICU_PO_VALUTE';
   StPr_CloseProv.Prepare;
   StPr_CloseProv.ParamByName('ID_REG').AsInteger:=ID_REG;
   StPr_CloseProv.ParamByName('DATE_END').AsDate:=date_end;
   StPr_CloseProv.ParamByName('ID_SESSION').AsInteger:=id_session;
   StPr_CloseProv.ParamByName('ID_VALUTE').AsInteger:=ds_tmp_valute.FieldValues['ID_VALUTE'];
   StPr_CloseProv.ExecProc;
   StPr_CloseProv.Transaction.Commit;
   except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_CloseProv.Transaction.Rollback;
    exit;
   end;
   end;
 form.Update;
 if StPr_CloseProv.ParamByName('RESULTING').Value = 1 then
 begin
 pk_id:= StPr_CloseProv.ParamByName('ID_DOC').AsInt64;
 kurs:=StPr_CloseProv.ParamByName('KURS').AsCurrency;
 TR_VAL.Active:=True;

 STRU.KEY_SESSION   := StPr_CloseProv.ParamByName('KEY_SESSION').Value;
 STRU.WORKDATE      := PERS_PAY_PERIOD;
 STRU.DBHANDLE      := StPr_CloseProv.Database.Handle;
 STRU.TRHANDLE      := StPr_CloseProv.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StPr_CloseProv.Transaction.Rollback;
   form.Free;
   ShowMessage(E.Message);
   Exit;
  end;
 end;

 if not DoResult then
 begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines:=TStringList.Create;
  MemoLines.AddStrings(ErrorList);
  ShowMessage(MemoLines.Text);
  StPr_CloseProv.Transaction.Rollback;
 end
 else
 begin
  StPr_CloseProv.Transaction.Commit;
  ShowMessage('Документ за валютою '+VarToStr(ds_tmp_valute.FieldValues['NAME_VAL'])+' проведено без помилок!');
  add_to_pc:=1;
 end;
 end
 else
 begin
 ShowMessage('Немає проводок для створення документу за валютою '+VarToStr(ds_tmp_valute.FieldValues['NAME_VAL']));
 add_to_pc:=0;
 end;
 // добавление в нашу таблицу
 if add_to_pc = 1 then
 try
   StPr_CloseProv.Close;
   StPr_CloseProv.Transaction := TR_VAL;
   StPr_CloseProv.Transaction.StartTransaction;
   StPr_CloseProv.StoredProcName:='PC_ADD_PUB_DOC_TO_PC_DOC';
   StPr_CloseProv.Prepare;
   StPr_CloseProv.ParamByName('PK_ID').AsInt64:=pk_id;
   StPr_CloseProv.ParamByName('KURS').AsCurrency:=kurs;
   StPr_CloseProv.ParamByName('ID_VALUTE').AsInteger:=ds_tmp_valute.FieldValues['ID_VALUTE'];
    StPr_CloseProv.ParamByName('IS_DB_KR').AsInteger:= 0;
   StPr_CloseProv.ExecProc;
   StPr_CloseProv.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_CloseProv.Transaction.Rollback;
    exit;
   end;
   end;
 //
 ds_tmp_valute.Next;
 form.Free;
 end;
 ds_tmp_valute.Close;
 //удалить из временной таблицы!!!
 actShow.Execute;
   end;
END;
end;
WindowState:=wsMaximized;
end;

procedure TOborotFormValute.actPrintExecute(Sender: TObject);
var form:TPrintForm;
    f:TWateForm;
    prefix: string;
    f_choose:TChooseForm;
    year, month:Word;
    k,i, group, flag:Integer;
    id_ses_cn:Integer;
    band:TfrxGroupHeader;
    comp:TfrxComponent;
    ex_filtr, filtr:integer;
     q:string;
begin
flag:=0;
//RxMemoryData.Close;

if DataSetForGrid.IsEmpty then Exit;
form:=TPrintForm.Create(Self);
form.ShowModal;
if form.ModalResult = mrOk then
begin
 flag:=1;
 if form.cxReport.ItemIndex <> 2 then
 begin
 f:=TWateForm.Create(Self);
 f.Show;
 f.Update;
 end;

 if ((form.cxReport.ItemIndex = 0) or (form.cxReport.ItemIndex = 5)) then
 begin
  ex_filtr:=0;
  DataSetReport.Close;
  DataSetReport.SelectSQL.Clear;
//  DataSetReport.SelectSQL.Text:=DataSetForGrid.SelectSQL.Text;
  DataSetReport.SelectSQL.Add(' SELECT * FROM PC_TMP_OBOROT_SELECT_VAL_2(:ID_SESSION, :DATE_REG, :ID_REG)');
  prefix:=' Where ';
  if TextFIO.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
    prefix:=' AND ';
    ex_filtr:=1;
  end;

  if cxTextEditSmeta.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
    ex_filtr:=1;
  end;

  if cxRZ.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
    ex_filtr:=1;
  end;

  if cxSTAT.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
    ex_filtr:=1;
  end;

  if cxTextEditSch.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
    ex_filtr:=1;
  end;

  if cxFiltr.ItemIndex = 1 then
  begin
    DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) and OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
    prefix:=' AND ';
    ex_filtr:=1;
  end;

  if cxFiltr.ItemIndex = 2 then
  begin
    DataSetReport.SelectSQL.Add(prefix+'   is_summa in(0,1) and OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
    ex_filtr:=1;
  end;

   if cxFiltr.ItemIndex = 3 then
  begin
    DataSetReport.SelectSQL.Add(prefix+'  is_summa = 2 and OUT_DB_SUMMA <> 0 and OUT_KR_SUMMA<>0');
    ex_filtr:=1;
  end;
  if ex_filtr=0 then DataSetReport.SelectSQL.Add(prefix+' is_summa in(0,1) ');

  DataSetReport.SelectSQL.Add(' ORDER BY SCH_NUMBER, FIO');
  DataSetReport.Prepare;
  DataSetReport.ParamByName('ID_SESSION').AsInteger:=id_session;
  DataSetReport.ParamByName('DATE_REG').Value:=DBEG;
  DataSetReport.ParamByName('ID_REG').Value:=ID_REG;
  DataSetReport.CloseOpen(False);

  if form.cxReport.ItemIndex = 0 then
  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frSokrReportVal.fr3');

  if form.cxReport.ItemIndex = 5 then
  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frSokrReportVal_without_dog.fr3');
 end;
 DataSetReport.Close;

 if form.cxReport.ItemIndex = 1 then
 begin
  DataSetReport.Close;
  DataSetReport.SelectSQL.Clear;
  DataSetReport.SelectSQL.Add(' SELECT * FROM PC_FULL_REPORT_VAL(:ID_SESSION, :DATE_REG, :ID_REG)');
  prefix:=' Where ';
  if TextFIO.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
    prefix:=' AND ';
  end;

  if cxTextEditSmeta.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
  end;

  if cxRZ.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
  end;

  if cxSTAT.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
  end;

  if cxTextEditSch.text<>''then
  begin
    DataSetReport.SelectSQL.Add(prefix+'SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
    prefix:=' AND ';
    is_filtr:=1;
  end;

  if cxFiltr.ItemIndex = 1 then
  begin
    DataSetReport.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
    prefix:=' AND ';
  end;

  if cxFiltr.ItemIndex = 2 then
  begin
    DataSetReport.SelectSQL.Add(prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
  end;

  if cxFiltr.ItemIndex = 3 then
  begin
    DataSetReport.SelectSQL.Add(prefix+' OUT_DB_SUMMA <> 0 and OUT_KR_SUMMA<>0');
  end;
  DataSetReport.SelectSQL.Add(' ORDER BY FIO');
  DataSetReport.Prepare;
  DataSetReport.ParamByName('ID_SESSION').AsInteger:=id_session;
  DataSetReport.ParamByName('DATE_REG').Value:=DBEG;
  DataSetReport.ParamByName('ID_REG').Value:=ID_REG;
  DataSetReport.CloseOpen(False);

  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frFullReportVal.fr3');
 end;

  if form.cxReport.ItemIndex = 2 then
  begin
    flag:=0;
    f_choose:=TChooseForm.Create(Self,DBHANDLE, cxMonthBeg.ItemIndex, cxMonthEnd.ItemIndex, cxYearBeg.Value, cxYearEnd.Value, id_session);
    GlobalFiltr;
    f_choose.gl_filtr:=global_filtr;
    f_choose.m_beg:=cxMonthBeg.ItemIndex+1;
    f_choose.m_end:=cxMonthEnd.ItemIndex+1;
    f_choose.y_beg:=cxYearBeg.Value;
    f_choose.y_end:=cxYearEnd.Value;
    f_choose.ShowModal;
    f_choose.Free;
  end;

 if form.cxReport.ItemIndex = 3 then
 begin
   DataSetReport.Close;
   DataSetReport.SelectSql.Clear;
   DataSetReport.SelectSQL.Add('SELECT * FROM PC_DOLG_FOR_YARS_VAL(:D_BEG, :D_END, :ID_REG)');
   DataSetReport.SelectSQL.Add(' ORDER BY YEAR_, ID_VALUTE, FIO');
   DataSetReport.Prepare;
   DataSetReport.ParamByName('D_BEG').AsInteger:=form.cxBeg.Value;
   DataSetReport.ParamByName('D_END').AsInteger:=form.cxEnd.Value;
   DataSetReport.ParamByName('ID_REG').AsInteger:=ID_REG;
   DataSetReport.CloseOpen(False);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frReportDolgVal.fr3');
 end;
  DataSetReport.Close;

   if form.cxReport.ItemIndex = 4 then
 begin
   DataSetReport.Close;
   DataSetReport.SelectSql.Clear;
   DataSetReport.SelectSQL.Add('SELECT * FROM PC_DOLG_FOR_MONTH_VAL(:D_MBEG, :D_MEND, :D_BEG, :D_END, :ID_REG)');
   DataSetReport.SelectSQL.Add(' ORDER BY DATE_, ID_VALUTE, FIO');
   DataSetReport.Prepare;
   DataSetReport.ParamByName('D_MBEG').AsInteger:=form.cxMonthBeg.ItemIndex+1;
   DataSetReport.ParamByName('D_MEND').AsInteger:=form.cxMonthEnd.ItemIndex+1;
   DataSetReport.ParamByName('D_BEG').AsInteger:=form.cxBeg.Value;
   DataSetReport.ParamByName('D_END').AsInteger:=form.cxEnd.Value;
   DataSetReport.ParamByName('ID_REG').AsInteger:=ID_REG;
   DataSetReport.CloseOpen(False);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frReportDolgMonth.fr3');
 end;
  DataSetReport.Close;

  if flag = 1 then
  begin

 // frReport.Variables['PERIOD']:=''''+AnsiUpperCase(cxMonthBeg.Text)+' '+' '+IntToStr(cxYearBeg.Value)+'''';
 frReport.Variables['DATE_BEG']:=''''+DateToStr(StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1))+'''';
 frReport.Variables['DATE_END']:=''''+DateToStr(EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1))+'''';
 frReport.Variables['ORG_NAME']:=''''+ORG_FULL_NAME+'''';
 frReport.Variables['ORG_SHORT_NAME']:=''''+ORG_SHORT_NAME+'''';
 frReport.Variables['ORG_KOD_OKPO']:=''''+ORG_KOD_OKPO+'''';
 frReport.Variables['YEAR_B']:=''''+IntToStr(form.cxBeg.Value)+'''';
 frReport.Variables['YEAR_E']:=''''+IntToStr(form.cxEnd.Value)+'''';
 frReport.Variables['SYSTEM_SCH']:=''''+SCH_SYSTEM+'''';
 frReport.Variables['USER']:=''''+USER_FIO+'''';
 frReport.Variables['FIO_FILTR']:=''''+TextFIO.Text+'''';
 frReport.Variables['SM_FILTR']:=''''+cxTextEditSmeta.Text+'''';
 frReport.Variables['RZ_FILTR']:=''''+cxRZ.Text+'''';
 frReport.Variables['ST_FILTR']:=''''+cxStat.Text+'''';
 frReport.Variables['SCH_FILTR']:=''''+cxTextEditSch.Text+'''';
 frReport.Variables['OST_FILTR']:=''''+cxFiltr.Text+'''';

 if ((form.cxReport.ItemIndex=0) or(form.cxReport.ItemIndex=5)) then
 begin
  filtr:=0;
 if TextFIO.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo49').Visible:=False;
 end;

 if cxTextEditSmeta.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo50').Visible:=False;
 end;

 if cxRZ.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo51').Visible:=False;
 end;

 if cxStat.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo52').Visible:=False;
 end;

 if cxTextEditSch.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo53').Visible:=False;
 end;

 if cxFiltr.Text='' then
 begin
   Inc(filtr);
   frReport.FindObject('Memo54').Visible:=False;
 end;
 if filtr = 6 then frReport.FindObject('Memo20').Visible:=False;
 end;
 frReport.PrepareReport;

 
 if form.cxCopies.Value>1 then
 frReport.PrintOptions.Copies:=form.cxCopies.Value;

 frReport.PrintOptions.ShowDialog:=form.chbChoosePrinter.Checked;

if NOT_PRINT_FIO_ISPOLN=1 then
begin
 if ((form.cxReport.ItemIndex = 0) or (form.cxReport.ItemIndex =5)) then
 begin
   frReport.FindObject('Memo4').Visible:=False;
   frReport.FindObject('Memo5').Visible:=False;
   frReport.FindObject('Memo6').Visible:=False;
 end;
  if form.cxReport.ItemIndex = 1 then
 begin
   frReport.FindObject('Memo55').Visible:=False;
   frReport.FindObject('Memo56').Visible:=False;
   frReport.FindObject('Memo57').Visible:=False;
 end;
end;

 if form.chbPrinter.Checked then  frReport.Print
else frReport.ShowReport;

 if form.cxCheckEdit.Checked then  frReport.DesignReport;
 end;
if form.cxReport.ItemIndex <> 2 then f.Free;
 Form.free;
 end;
end;

procedure TOborotFormValute.actCloseExecute(Sender: TObject);
begin
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
 Close;
end;

procedure TOborotFormValute.actFiltrExecute(Sender: TObject);
var  prefix: string;
     is_one:Integer;
     form:TWateForm;
begin
  is_filtr:=0;
  is_one:=0;

form:=TWateForm.Create(Self);
form.Show;
form.Update;

DataSetForGrid.Close;
DataSetForGrid.SelectSQL.Clear;
DataSetForGrid.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT_VAL_2(:ID_SESSION, :DATE_REG, :ID_REG)' );
prefix:=' WHERE ';
if TextFIO.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxRZ.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxSTAT.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
 is_one:=1;
end;

if cxTextEditSch.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 1 then
begin
  if is_one=1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0') else
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) and OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 2 then
begin
  if is_one=1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0') else
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) and OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxFiltr.ItemIndex = 3 then
begin
  if is_one = 1 then DataSetForGrid.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0')else
 DataSetForGrid.SelectSQL.Add(prefix+'is_summa = 2 and OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0');
 prefix:=' AND ';
 is_filtr:=1;
end;

if cxVal.text<>''then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'NAME_VALUTE LIKE '+''''+AnsiUpperCase(cxVal.text)+'%'+''' ');
 prefix:=' AND ';
 is_filtr:=1;
end;
{if cxCheckBoxFIO.Checked = False then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'(IS_SUMMA in (0,1,3))');
 prefix:=' AND ';
end;}
 //DataSetForGrid.SelectSQL.Add('');
 //showmessage(DataSetForGrid.SelectSQL.text);
DataSetForGrid.SelectSQL.Add(' ORDER BY FIO, IS_SUMMA ');
DataSetForGrid.Prepare;
DataSetForGrid.ParamByName('ID_SESSION').AsInteger:=id_session;
DataSetForGrid.ParamByName('DATE_REG').Value:=DBEG;
DataSetForGrid.ParamByName('ID_REG').Value:=ID_REG;
DataSetForGrid.CloseOpen(False);
DataSetForGrid.First;
form.free;
end;

procedure TOborotFormValute.cxCheckBoxFIOClick(Sender: TObject);
begin
//if cxCheckBoxFIO.Checked = True then cxGrid1DBBandedTableView1.OptionsView.GroupFooters:=gfVisibleWhenExpanded
//else cxGrid1DBBandedTableView1.OptionsView.GroupFooters:=gfInvisible;
end;

procedure TOborotFormValute.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
Arect:=AViewInfo.Bounds;
if is_filtr = 1 then
begin
  if (AViewInfo.GridRecord.Values[18]= 2)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00E1FFFF;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
end
else
 begin
  if (AViewInfo.GridRecord.Values[18]= 2)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00EFEFEF;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
    if (AViewInfo.GridRecord.Values[18]= 3)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
  if (AViewInfo.GridRecord.Values[18]= 4)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00F7EAD9;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
 end;
end;

procedure TOborotFormValute.DataSetForGridCalcFields(DataSet: TDataSet);
begin
{if DataSetForGridIN_DB_SUMMA_VAL.AsString<>'0' then
DataSetForGridIN_DB_VAL_S.Value:=DataSetForGridIN_DB_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridIN_DB_VAL_S.Value:=DataSetForGridIN_DB_SUMMA_VAL.AsString;

if DataSetForGridIN_KR_SUMMA_VAL.AsString<>'0' then
DataSetForGridIN_KR_VAL_S.Value:=DataSetForGridIN_KR_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridIN_KR_VAL_S.Value:=DataSetForGridIN_KR_SUMMA_VAL.AsString;

if DataSetForGridDB_SUMMA_VAL.AsString<>'0' then
DataSetForGridDB_VAL_S.Value:=DataSetForGridDB_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridDB_VAL_S.Value:=DataSetForGridDB_SUMMA_VAL.AsString;

if DataSetForGridKR_SUMMA_VAL.AsString<>'0' then
DataSetForGridKR_VAL_S.Value:=DataSetForGridKR_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridKR_VAL_S.Value:=DataSetForGridKR_SUMMA_VAL.AsString;

if DataSetForGridOUT_DB_SUMMA_VAL.AsString<>'0' then
DataSetForGridOUT_DB_VAL_S.Value:=DataSetForGridOUT_DB_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridOUT_DB_VAL_S.Value:=DataSetForGridOUT_DB_SUMMA_VAL.AsString;

if DataSetForGridOUT_KR_SUMMA_VAL.AsString<>'0' then
DataSetForGridOUT_KR_VAL_S.Value:=DataSetForGridOUT_KR_SUMMA_VAL.AsString+' '+DataSetForGridSYMBOL.AsString
else DataSetForGridOUT_KR_VAL_S.Value:=DataSetForGridOUT_KR_SUMMA_VAL.AsString;
 }
if is_filtr=0 then
begin
if (DataSetForGridIS_SUMMA.AsInteger = 0) then
begin
 DataSetForGridFIO_1.Value := DataSetForGridFIO.AsString;
 DataSetForGridDATE_OST.Value:=DataSetForGridDATE_OST_MOOVE.AsString;
 DataSetForGridDATE_EXEC.Value:=DataSetForGridDATE_EXEC_DOLG.AsString;
 DataSetForGridN_DOG.Value:=DataSetForGridNUM_DOG.AsString;
end;

if (DataSetForGridIS_SUMMA.AsInteger = 1) then
begin
 DataSetForGridFIO_1.Value := '';
 DataSetForGridDATE_OST.Value:= DataSetForGridDATE_OST_MOOVE.AsString;
 DataSetForGridDATE_EXEC.Value:=DataSetForGridDATE_EXEC_DOLG.AsString;
 DataSetForGridN_DOG.Value:=DataSetForGridNUM_DOG.AsString;
end;

if (DataSetForGridIS_SUMMA.AsInteger = 2)then
begin
 DataSetForGridFIO_1.Value := '';
 DataSetForGridDATE_OST.Value:= '';
 DataSetForGridDATE_EXEC.Value:='';
 DataSetForGridN_DOG.Value:= '';
end;


end
else DataSetForGridFIO_1.Value := DataSetForGridFIO.AsString;
if (DataSetForGridIS_SUMMA.AsInteger = 3) then
begin
 DataSetForGridFIO_1.Value := 'РАЗОМ ПО '+DataSetForGridNAME_VALUTE.AsString;
 DataSetForGridDATE_OST.Value:= '';
 DataSetForGridDATE_EXEC.Value:='';
 DataSetForGridN_DOG.Value:='';
end;

if (DataSetForGridIS_SUMMA.AsInteger = 4) then
begin
 DataSetForGridFIO_1.Value := 'РАЗОМ';
 DataSetForGridDATE_OST.Value:= '';
 DataSetForGridDATE_EXEC.Value:='';
 DataSetForGridN_DOG.Value:='';
end;
end;

procedure TOborotFormValute.cxCheckBoxDatePropertiesChange(Sender: TObject);
begin
cxGrid1DBBandedTableView1.Bands.Items[2].Visible:= cxCheckBoxDate.Checked;
end;

procedure TOborotFormValute.cxNumDogPropertiesChange(Sender: TObject);
begin
cxGrid1DBBandedTableView1.Bands.Items[1].Visible:= cxNumDog.Checked;
end;

procedure TOborotFormValute.FormCreate(Sender: TObject);
var DATE_REC:TDateTime;
    month, year:Word;
begin
Caption:='Обороти';

end;

procedure TOborotFormValute.DataSetForGridIN_DB_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{if DataSetForGridIN_DB_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridIN_DB_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridIN_DB_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridIN_DB_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString ;
if (( DataSetForGridIN_DB_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';}
if DataSetForGridis_summa.AsInteger = 4 then text:=''
else text:=FloatToStrF(DataSetForGridIN_DB_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

procedure TOborotFormValute.DataSetForGridIN_KR_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{if DataSetForGridIN_KR_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridIN_KR_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridIN_KR_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridIN_KR_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString ;
if (( DataSetForGridIN_KR_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';}
if DataSetForGridis_summa.AsInteger = 4 then text:=''
else
text:=FloatToStrF(DataSetForGridIN_KR_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

procedure TOborotFormValute.DataSetForGridOUT_DB_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{if DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString ;
if (( DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';}
if DataSetForGridis_summa.AsInteger =4 then text:=''
else text:=FloatToStrF(DataSetForGridOUT_DB_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

procedure TOborotFormValute.DataSetForGridOUT_KR_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{if DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString  ;
if (( DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';}
if DataSetForGridis_summa.AsInteger = 4 then text:=''
else
text:=FloatToStrF(DataSetForGridOUT_KR_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

procedure TOborotFormValute.DataSetForGridDB_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{if DataSetForGridDB_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridDB_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridDB_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridDB_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString   ;
if (( DataSetForGridDB_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';}
if DataSetForGridis_summa.AsInteger = 4 then text:=''
else
text:=FloatToStrF(DataSetForGridDB_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

procedure TOborotFormValute.DataSetForGridKR_SUMMA_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{(if DataSetForGridKR_SUMMA_VAL.AsCurrency=Trunc(DataSetForGridKR_SUMMA_VAL.AsCurrency) then
 text:=GetRazryad(FloatToStr(DataSetForGridKR_SUMMA_VAL.AsCurrency))+DecimalSeparator+'00 '+DataSetForGridSYMBOL.AsString
 else text:=GetRazryad(FloatToStr(DataSetForGridKR_SUMMA_VAL.AsCurrency))+' '+DataSetForGridSYMBOL.AsString
if (( DataSetForGridKR_SUMMA_VAL.AsCurrency=0)and(DatasetForGridIS_SUMMA.AsInteger=4))then text:='';  }
if DataSetForGridis_summa.AsInteger = 4 then text:=''
else text:=FloatToStrF(DataSetForGridKR_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DataSetForGridSYMBOL.AsString;
end;

end.

