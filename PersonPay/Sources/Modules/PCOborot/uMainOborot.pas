unit uMainOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, DateUtils, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, frxClass, frxDBSet, frxDesgn, ActnList, ibase, uMainPerem,
  uWate, cxCheckBox, Placemnt, uMainFanc, Menus, RxMemDS, frxChart,
  frxCross, frxExportImage, frxExportPDF, frxExportRTF, frxExportXLS,
  frxExportHTML, frxExportTXT, cxMemo;

type
  TOborotForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    DatabaseWork: TpFIBDatabase;
    DataSetWork: TpFIBDataSet;
    dsSourseWork: TDataSource;
    ReadTr: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
    DataSetForGrid: TpFIBDataSet;
    dsForGrid: TDataSource;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGridFIO: TcxGridDBBandedColumn;
    cxGridIN_DB_SUMMA: TcxGridDBBandedColumn;
    cxGridIN_KR_SUMMA: TcxGridDBBandedColumn;
    cxGridDB_SUMMA: TcxGridDBBandedColumn;
    cxGridSM_KOD: TcxGridDBBandedColumn;
    cxGridRZ_KOD: TcxGridDBBandedColumn;
    cxGridST_KOD: TcxGridDBBandedColumn;
    cxGridKEKV_KOD: TcxGridDBBandedColumn;
    cxGridKR_SUMMA: TcxGridDBBandedColumn;
    cxGridOUT_DB_SUMMA: TcxGridDBBandedColumn;
    cxGridOUT_KR_SUMMA: TcxGridDBBandedColumn;
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
    cxButton1: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    OkButton: TcxButton;
    CancelBut: TcxButton;
    DataSetReport: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    cxGridSch: TcxGridDBBandedColumn;
    actlst1: TActionList;
    actShow: TAction;
    actPrint: TAction;
    actClose: TAction;
    TextFIO: TcxTextEdit;
    lbl2: TLabel;
    cxButton2: TcxButton;
    actFiltr: TAction;
    cxTextEditSmeta: TcxTextEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cxTextEditSch: TcxTextEdit;
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
    cxGridIS_Summa: TcxGridDBBandedColumn;
    DataSetForGridFIO_1: TFIBStringField;
    lbl5: TLabel;
    FormStorage1: TFormStorage;
    DataSetForGridFIO_VIVOD: TFIBStringField;
    lbl6: TLabel;
    cxRZ: TcxTextEdit;
    lbl7: TLabel;
    cxStat: TcxTextEdit;
    cxFiltr: TcxComboBox;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    cxGrid1DATE_EXEC_DOLG: TcxGridDBBandedColumn;
    cxGrid1DATE_OST_MOOVE: TcxGridDBBandedColumn;
    DataSetForGridDATE_OST_MOOVEE: TFIBDateField;
    DataSetForGridDATE_EXEC_DOLGG: TFIBDateField;
    frxCrossObject1: TfrxCrossObject;
    cxCheckBoxDate: TcxCheckBox;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxBMPExport1: TfrxBMPExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxTIFFExport1: TfrxTIFFExport;
    DataSetForGridNUM_DOG: TFIBStringField;
    cxGrid1NUM_DOG: TcxGridDBBandedColumn;
    DataSetForGridN_DOG: TStringField;
    frReport: TfrxReport;
    cxNumDog: TcxCheckBox;
    DataSetForGridDATE_EXEC: TDateField;
    DataSetForGridDATE_OST: TDateField;
    DataSetForGridDATE_OST_MOOVE: TFIBDateField;
    DataSetForGridDATE_EXEC_DOLG: TFIBDateField;
    cxNull: TcxCheckBox;
    cxAutoFiltr: TcxCheckBox;
    ds_for_grid_2: TpFIBDataSet;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    ds2: TDataSource;
    cxgrdbclmnGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    ds_for_grid_2ID_PC_TMP: TFIBBCDField;
    ds_for_grid_2ID_DOG: TFIBBCDField;
    ds_for_grid_2KOD_DOG: TFIBBCDField;
    ds_for_grid_2IN_DB_SUMMA: TFIBBCDField;
    ds_for_grid_2IN_KR_SUMMA: TFIBBCDField;
    ds_for_grid_2OUT_DB_SUMMA: TFIBBCDField;
    ds_for_grid_2OUT_KR_SUMMA: TFIBBCDField;
    ds_for_grid_2DB_SUMMA: TFIBBCDField;
    ds_for_grid_2KR_SUMMA: TFIBBCDField;
    ds_for_grid_2ID_SM: TFIBBCDField;
    ds_for_grid_2ID_RZ: TFIBBCDField;
    ds_for_grid_2ID_ST: TFIBBCDField;
    ds_for_grid_2ID_KEKV: TFIBBCDField;
    ds_for_grid_2SM_TITLE: TFIBStringField;
    ds_for_grid_2SM_KOD: TFIBIntegerField;
    ds_for_grid_2RZ_TITLE: TFIBStringField;
    ds_for_grid_2RZ_KOD: TFIBIntegerField;
    ds_for_grid_2ST_TITLE: TFIBStringField;
    ds_for_grid_2ST_KOD: TFIBIntegerField;
    ds_for_grid_2KEKV_TITLE: TFIBStringField;
    ds_for_grid_2KEKV_KOD: TFIBIntegerField;
    ds_for_grid_2FIO: TFIBStringField;
    ds_for_grid_2ID_SCH: TFIBBCDField;
    ds_for_grid_2SCH_NUMBER: TFIBStringField;
    ds_for_grid_2SCH_TITLE: TFIBStringField;
    ds_for_grid_2DATE_OST_MOOVE: TFIBDateField;
    ds_for_grid_2DATE_EXEC_DOLG: TFIBDateField;
    ds_for_grid_2NUM_DOG: TFIBStringField;
    ds_for_grid_2IN_DB_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2IN_KR_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2OUT_DB_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2OUT_KR_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2DB_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2KR_SUMMA_VAL: TFIBBCDField;
    ds_for_grid_2ID_VALUTE: TFIBBCDField;
    cxgrdbclmnGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn9: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn10: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn11: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn12: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn13: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn14: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn15: TcxGridDBColumn;
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
    procedure cxAutoFiltrPropertiesChange(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    global_filtr:string;
    fio: string;
    id_pc_tmp, id_session:integer;
    DBEG, DEND: TDateTime;
    is_come:Integer;
    is_filtr, rx_rec:Integer;
    fac_flag, spec_flag, nat_flag, f_stud_flag, k_stud_flag, kurs_flag, n_gr_flag:Integer;
    obsh_flag, fac_st_flag, kurs_st_flag, kat_pay_flag, type_live_flag, cl_live_flag, grp_flag:Integer;
    print_ost:Boolean;
//    procedure MakeReport;
//    procedure MakeReport_ost;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowOborotForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowOborotForm;

var
  OborotForm: TOborotForm;

implementation

{$R *.dfm}
uses uProvodki, uPrint, uChooseParam, uSelectAction;

constructor TOborotForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
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


global_filtr:='';

//access
//actShow.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_OBOROT/PC_MAIN_OBOROT','Print', false)=0;
//actShow.Execute;
end;
end;

procedure ShowOborotForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
var form : TOborotForm;
begin
form := TOborotForm.Create(AOwner, DBHANDLE);
Form.Caption:='Обороти';
Form.Show;
//Form.Free;
end;

procedure TOborotForm.FormCreate(Sender: TObject);
var DATE_REC:TDateTime;
    month, year:Word;
begin
Caption:='Обороти';
end;


procedure TOborotForm.GlobalFiltr;
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

procedure TOborotForm.cxGrid1DBBandedTableView1DblClick(Sender: TObject);
var form:TProvodkiForm;
begin
if DataSetForGrid.IsEmpty then exit;
if DataSetForGridIS_SUMMA.AsInteger = 2 then Exit;
id_pc_tmp:=DataSetForGridID_PC_TMP.AsInteger;
//showmessage(inttostr(id_session));
Form:=TProvodkiForm.Create(Self, DBHANDLE, id_pc_tmp, id_session);
form.ShowModal;
end;

procedure TOborotForm.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TOborotForm.actShowExecute(Sender: TObject);
var
// DBEG, DEND: TDateTime;
 Year, Month: Word;
 form:TWateForm;
 prefix: string;
 is_one:Integer;
 form_sel:TSelectActionForm;

begin
  is_filtr:=0;
  is_one:=0;

 {if cxAutoFiltr.Checked then
 begin
   cxGrid1DBBandedTableView1.DataController.DataModeController.GridMode:= False;
  cxGridFIO.Options.Filtering:=True;
  cxGridIN_DB_SUMMA.Options.Filtering:=True;
  cxGridIN_KR_SUMMA.Options.Filtering:=True;
  cxGridDB_SUMMA.Options.Filtering:=True;
  cxGridKR_SUMMA.Options.Filtering:=True;
  cxGridOUT_DB_SUMMA.Options.Filtering:=True;
  cxGridOUT_KR_SUMMA.Options.Filtering:=True;
  cxGridSM_KOD.Options.Filtering:=True;
  cxGridRZ_KOD.Options.Filtering:=True;
  cxGridST_KOD.Options.Filtering:=True;
  cxGridKEKV_KOD.Options.Filtering:=True;
  cxGridSch.Options.Filtering:=True;
  cxGrid1NUM_DOG.Options.Filtering:=True;
 end
 else
  begin
   cxGrid1DBBandedTableView1.DataController.DataModeController.GridMode:= True;
  cxGridFIO.Options.Filtering:=False;
  cxGridIN_DB_SUMMA.Options.Filtering:=False;
  cxGridIN_KR_SUMMA.Options.Filtering:=False;
  cxGridDB_SUMMA.Options.Filtering:=False;
  cxGridKR_SUMMA.Options.Filtering:=False;
  cxGridOUT_DB_SUMMA.Options.Filtering:=False;
  cxGridOUT_KR_SUMMA.Options.Filtering:=False;
  cxGridSM_KOD.Options.Filtering:=False;
  cxGridRZ_KOD.Options.Filtering:=False;
  cxGridST_KOD.Options.Filtering:=False;
  cxGridKEKV_KOD.Options.Filtering:=False;
  cxGridSch.Options.Filtering:=False;
  cxGrid1NUM_DOG.Options.Filtering:=False;
 end;    }
is_come:=is_come+1;
Year:=cxYearBeg.Value;
Month:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(Year, Month);
Year:=cxYearEnd.Value;
Month:=cxMonthEnd.ItemIndex+1;
DEND:=EndOfAMonth(Year, Month);
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
 StorProc.StoredProcName:='PC_TMP_OBOROT_INS_UPD';
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

//
if cxGrid1.Visible = True then
begin
DataSetForGrid.Close;
DataSetForGrid.SelectSQL.Clear;
DataSetForGrid.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT_2(:ID_SESSION, :DATE_REG, :ID_REG)' );
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

if cxNull.Checked = True then
begin
  DataSetForGrid.SelectSQL.Add(prefix+' not(in_db_summa=0 and in_kr_summa=0 and db_summa=0 and kr_summa=0 and out_db_summa=0 and out_kr_summa=0) ');
  prefix:=' AND ';
  is_filtr:=1;
end;
{if cxAutoFiltr.Checked then
begin
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) ');
 prefix:=' AND ';
 is_filtr:=1;
end; }
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
DataSetForGrid.First;
form.Free;
cxGrid1DBBandedTableView1.ViewData.Expand(true);
end;//
if cxGrid2.Visible = True then
begin
ds_for_grid_2.Close;
ds_for_grid_2.SelectSQL.Clear;
ds_for_grid_2.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT(:ID_SESSION, :DATE_REG, :ID_REG)' );
prefix:=' WHERE ';
if TextFIO.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxRZ.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxSTAT.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSch.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
end;

if cxFiltr.ItemIndex = 1 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
 prefix:=' AND ';
end;

if cxFiltr.ItemIndex = 2 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
 prefix:=' AND ';
end;

if cxFiltr.ItemIndex = 3 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0');
  prefix:=' AND ';
end;

if cxNull.Checked = True then
begin
  ds_for_grid_2.SelectSQL.Add(prefix+' not(in_db_summa=0 and in_kr_summa=0 and db_summa=0 and kr_summa=0 and out_db_summa=0 and out_kr_summa=0) ');
  prefix:=' AND ';
end;

{if cxCheckBoxFIO.Checked = False then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'(IS_SUMMA = 0 OR IS_SUMMA = 2) ');
 prefix:=' AND ';
end; }
ds_for_grid_2.SelectSQL.Add(' ORDER BY FIO, id_dog ');
ds_for_grid_2.Prepare;
ds_for_grid_2.ParamByName('ID_SESSION').AsInteger:=id_session;
ds_for_grid_2.ParamByName('DATE_REG').Value:=DBEG;
ds_for_grid_2.ParamByName('ID_REG').Value:=ID_REG;
ds_for_grid_2.CloseOpen(False);
ds_for_grid_2.First;
form.Free;
cxGrid2DBTableView1.ViewData.Expand(true);
end;

end;

procedure TOborotForm.actPrintExecute(Sender: TObject);
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
  DataSetReport.SelectSQL.Add(' SELECT * FROM PC_TMP_OBOROT_SELECT_2(:ID_SESSION, :DATE_REG, :ID_REG)');
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
  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frSokrReport.fr3');

  if form.cxReport.ItemIndex = 5 then
  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frSokrReport_without_dog.fr3');
 end;
 DataSetReport.Close;

 if form.cxReport.ItemIndex = 1 then
 begin
  DataSetReport.Close;
  DataSetReport.SelectSQL.Clear;
  DataSetReport.SelectSQL.Add(' SELECT * FROM PC_FULL_REPORT(:ID_SESSION, :DATE_REG, :ID_REG)');
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

  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frFullReport.fr3');
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
   DataSetReport.SelectSQL.Add('SELECT * FROM PC_DOLG_FOR_YARS(:D_BEG, :D_END, :ID_REG)');
   DataSetReport.SelectSQL.Add(' ORDER BY YEAR_, FIO');
   DataSetReport.Prepare;
   DataSetReport.ParamByName('D_BEG').AsInteger:=form.cxBeg.Value;
   DataSetReport.ParamByName('D_END').AsInteger:=form.cxEnd.Value;
   DataSetReport.ParamByName('ID_REG').AsInteger:=ID_REG;
   DataSetReport.CloseOpen(False);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frReportDolg.fr3');
 end;
  DataSetReport.Close;

   if form.cxReport.ItemIndex = 4 then
 begin
   DataSetReport.Close;
   DataSetReport.SelectSql.Clear;
   DataSetReport.SelectSQL.Add('SELECT * FROM PC_DOLG_FOR_MONTH(:D_MBEG, :D_MEND, :D_BEG, :D_END, :ID_REG)');
   DataSetReport.SelectSQL.Add(' ORDER BY DATE_, FIO');
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

  if form.cxReport.ItemIndex = 6 then
  begin
   DataSetReport.Close;
   DataSetReport.SelectSql.Clear;
   DataSetReport.SelectSQL.Add('SELECT * FROM PC_DOLG_FOR_MONTH_EX(:D_BEG, :D_END, :D_BEG_NOW, :ID_REG)');
   DataSetReport.SelectSQL.Add(' ORDER BY FIO');
   DataSetReport.Prepare;
   DataSetReport.ParamByName('D_BEG').AsDate:=StartOfAMonth(form.cxBeg.Value, form.cxMonthBeg.ItemIndex+1);
   DataSetReport.ParamByName('D_END').AsDate:=EndOfAMonth(form.cxEnd.Value, form.cxMonthEnd.ItemIndex+1);
   DataSetReport.ParamByName('D_BEG_NOW').AsDate:=Date();
   DataSetReport.ParamByName('ID_REG').AsInteger:=ID_REG;
   DataSetReport.CloseOpen(False);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\frReportDolgMonthEx.fr3');

  end;

  if flag = 1 then
  begin

 // frReport.Variables['PERIOD']:=''''+AnsiUpperCase(cxMonthBeg.Text)+' '+' '+IntToStr(cxYearBeg.Value)+'''';
 if (form.cxReport.ItemIndex = 6) or (form.cxReport.ItemIndex = 3) or (form.cxReport.ItemIndex = 4)  then
 begin
 frReport.Variables['DATE_BEG']:=''''+DateToStr(StartOfAMonth(form.cxBeg.Value, form.cxMonthBeg.ItemIndex+1))+'''';
 frReport.Variables['DATE_END']:=''''+DateToStr(EndOfAMonth(form.cxBeg.Value, form.cxMonthBeg.ItemIndex+1))+'''';
 end
 else
 begin
 frReport.Variables['DATE_BEG']:=''''+DateToStr(StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1))+'''';
 frReport.Variables['DATE_END']:=''''+DateToStr(EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1))+'''';
 end;
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

procedure TOborotForm.actCloseExecute(Sender: TObject);
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

procedure TOborotForm.actFiltrExecute(Sender: TObject);
var  prefix: string;
     is_one:Integer;
     form:TWateForm;
begin
  is_filtr:=0;
  is_one:=0;
 { if cxAutoFiltr.Checked then
 begin
      cxGrid1DBBandedTableView1.DataController.DataModeController.GridMode:= False;
  cxGridFIO.Options.Filtering:=True;
  cxGridIN_DB_SUMMA.Options.Filtering:=True;
  cxGridIN_KR_SUMMA.Options.Filtering:=True;
  cxGridDB_SUMMA.Options.Filtering:=True;
  cxGridKR_SUMMA.Options.Filtering:=True;
  cxGridOUT_DB_SUMMA.Options.Filtering:=True;
  cxGridOUT_KR_SUMMA.Options.Filtering:=True;
  cxGridSM_KOD.Options.Filtering:=True;
  cxGridRZ_KOD.Options.Filtering:=True;
  cxGridST_KOD.Options.Filtering:=True;
  cxGridKEKV_KOD.Options.Filtering:=True;
  cxGridSch.Options.Filtering:=True;
  cxGrid1NUM_DOG.Options.Filtering:=True;
 end
 else
  begin
       cxGrid1DBBandedTableView1.DataController.DataModeController.GridMode:= True;
  cxGridFIO.Options.Filtering:=False;
  cxGridIN_DB_SUMMA.Options.Filtering:=False;
  cxGridIN_KR_SUMMA.Options.Filtering:=False;
  cxGridDB_SUMMA.Options.Filtering:=False;
  cxGridKR_SUMMA.Options.Filtering:=False;
  cxGridOUT_DB_SUMMA.Options.Filtering:=False;
  cxGridOUT_KR_SUMMA.Options.Filtering:=False;
  cxGridSM_KOD.Options.Filtering:=False;
  cxGridRZ_KOD.Options.Filtering:=False;
  cxGridST_KOD.Options.Filtering:=False;
  cxGridKEKV_KOD.Options.Filtering:=False;
  cxGridSch.Options.Filtering:=False;
  cxGrid1NUM_DOG.Options.Filtering:=False;
 end;   }
form:=TWateForm.Create(Self);
form.Show;
form.Update;
if cxGrid1.Visible=True then
begin
DataSetForGrid.Close;
DataSetForGrid.SelectSQL.Clear;
DataSetForGrid.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT_2(:ID_SESSION, :DATE_REG, :ID_REG)' );
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
if cxNull.Checked = True then
begin
  DataSetForGrid.SelectSQL.Add(prefix+' not(in_db_summa=0 and in_kr_summa=0 and db_summa=0 and kr_summa=0 and out_db_summa=0 and out_kr_summa=0) ');
  prefix:=' AND ';
  is_filtr:=1;
end;
{if cxAutoFiltr.Checked then
begin
DataSetForGrid.SelectSQL.Add(prefix+'is_summa in(0,1) ');
 prefix:=' AND ';
 is_filtr:=1;
end; }
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
if cxGrid2.Visible = True then
begin
ds_for_grid_2.Close;
ds_for_grid_2.SelectSQL.Clear;
ds_for_grid_2.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT(:ID_SESSION, :DATE_REG, :ID_REG)' );
prefix:=' WHERE ';
if TextFIO.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxRZ.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxSTAT.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSch.text<>''then
begin
 ds_for_grid_2.SelectSQL.Add(prefix+'SCH_NUMBER LIKE '+''''+cxTextEditSch.text+'%'+''' ');
end;

if cxFiltr.ItemIndex = 1 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA = 0');
 prefix:=' AND ';
end;

if cxFiltr.ItemIndex = 2 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA = 0 and OUT_KR_SUMMA<>0');
 prefix:=' AND ';
end;

if cxFiltr.ItemIndex = 3 then
begin
ds_for_grid_2.SelectSQL.Add(prefix+' OUT_DB_SUMMA<>0 and OUT_KR_SUMMA<>0');
  prefix:=' AND ';
end;

if cxNull.Checked = True then
begin
  ds_for_grid_2.SelectSQL.Add(prefix+' not(in_db_summa=0 and in_kr_summa=0 and db_summa=0 and kr_summa=0 and out_db_summa=0 and out_kr_summa=0) ');
  prefix:=' AND ';
end;

{if cxCheckBoxFIO.Checked = False then
begin
 DataSetForGrid.SelectSQL.Add(prefix+'(IS_SUMMA = 0 OR IS_SUMMA = 2) ');
 prefix:=' AND ';
end; }
ds_for_grid_2.SelectSQL.Add(' ORDER BY FIO, id_dog ');
ds_for_grid_2.Prepare;
ds_for_grid_2.ParamByName('ID_SESSION').AsInteger:=id_session;
ds_for_grid_2.ParamByName('DATE_REG').Value:=DBEG;
ds_for_grid_2.ParamByName('ID_REG').Value:=ID_REG;
ds_for_grid_2.CloseOpen(False);
ds_for_grid_2.First;
form.Free;
cxGrid2DBTableView1.ViewData.Expand(true);
end;

end;

procedure TOborotForm.cxCheckBoxFIOClick(Sender: TObject);
begin
//if cxCheckBoxFIO.Checked = True then cxGrid1DBBandedTableView1.OptionsView.GroupFooters:=gfVisibleWhenExpanded
//else cxGrid1DBBandedTableView1.OptionsView.GroupFooters:=gfInvisible;
end;

procedure TOborotForm.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
Arect:=AViewInfo.Bounds;
if is_filtr = 1 then
begin
  if (AViewInfo.GridRecord.Values[12]= 2)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00E1FFFF;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
end
else
 begin
  if (AViewInfo.GridRecord.Values[12]= 2)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00EFEFEF;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
    if (AViewInfo.GridRecord.Values[12]= 3)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
 end;
end;

procedure TOborotForm.DataSetForGridCalcFields(DataSet: TDataSet);
begin
if is_filtr=0 then
begin

if (DataSetForGridIS_SUMMA.AsInteger = 0) then
begin
 DataSetForGridFIO_1.Value := DataSetForGridFIO.AsString;
 DataSetForGridDATE_OST.Value:=DataSetForGridDATE_OST_MOOVE.value;
 DataSetForGridDATE_EXEC.Value:=DataSetForGridDATE_EXEC_DOLG.value;
 DataSetForGridN_DOG.Value:=DataSetForGridNUM_DOG.AsString;
 if DataSetForGridDATE_OST_MOOVE.AsString='' then  DataSetForGridDATE_OST.Asstring:= '';
 if DataSetForGridDATE_EXEC_DOLG.AsString='' then DataSetForGridDATE_EXEC.AsString:='';
end;

if (DataSetForGridIS_SUMMA.AsInteger = 1) then
begin
 DataSetForGridFIO_1.Value := '';
 DataSetForGridDATE_OST.Value:= DataSetForGridDATE_OST_MOOVE.value;
 DataSetForGridDATE_EXEC.Value:=DataSetForGridDATE_EXEC_DOLG.value;
 DataSetForGridN_DOG.Value:=DataSetForGridNUM_DOG.AsString;
 if DataSetForGridDATE_OST_MOOVE.AsString='' then  DataSetForGridDATE_OST.Asstring:= '';
 if DataSetForGridDATE_EXEC_DOLG.AsString='' then DataSetForGridDATE_EXEC.AsString:='';
end;

if (DataSetForGridIS_SUMMA.AsInteger = 2)then
begin
 DataSetForGridFIO_1.Value := '';
 DataSetForGridDATE_OST.Asstring:= '';
 DataSetForGridDATE_EXEC.AsString:='';
 DataSetForGridN_DOG.Value:= '';
end;

if (DataSetForGridIS_SUMMA.AsInteger = 3) then
begin
 DataSetForGridFIO_1.Value := 'РАЗОМ';
 DataSetForGridDATE_OST.asstring:= '';
 DataSetForGridDATE_EXEC.asstring:='';
 DataSetForGridN_DOG.Value:='';
end;
end
else DataSetForGridFIO_1.Value := DataSetForGridFIO.AsString;


end;

procedure TOborotForm.cxCheckBoxDatePropertiesChange(Sender: TObject);
begin
if cxGrid1.Visible=True then
cxGrid1DBBandedTableView1.Bands.Items[2].Visible:= cxCheckBoxDate.Checked
else
begin
  cxgrdbclmnGrid2DBTableView1DBColumn14.Visible:= cxCheckBoxDate.Checked;
  cxgrdbclmnGrid2DBTableView1DBColumn15.Visible:= cxCheckBoxDate.Checked;
end;
end;

procedure TOborotForm.cxNumDogPropertiesChange(Sender: TObject);
begin
if cxGrid1.Visible=True then
cxGrid1DBBandedTableView1.Bands.Items[1].Visible:= cxNumDog.Checked
else
cxgrdbclmnGrid2DBTableView1DBColumn2.Visible:= cxNumDog.Checked;
end;

procedure TOborotForm.cxAutoFiltrPropertiesChange(Sender: TObject);
begin
if cxAutoFiltr.Checked=True then
begin
  cxGrid1.Visible:=False;
  cxGrid2.Visible:=True;
  cxGrid2.Align:=alClient;
  
end
else
begin
  cxGrid2.Visible:=False;
  cxGrid1.Visible:=True;
end;
cxNumDog.Properties.OnChange(Self);
cxCheckBoxDate.Properties.OnChange(Self);

end;

end.

