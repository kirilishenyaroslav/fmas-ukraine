 {******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                   Модуль "Добавление(изменение) договора на ВЦВ"             }
{ Содержит необходимые данные для добавления(изменения) договора на ВЦВ.       }
{ Позволяет указать: основные данные договора, данные потребителя, данные      }
{ поставщика, сведенья о тачках подключения и периодах поставки и выполнения.  }
{                                                 ответственный: Гнибеда Антон }

unit dt_contract_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, Buttons, FIBQuery, pFIBQuery, pFIBStoredProc, Db,
  FIBDataSet, pFIBDataSet, Grids,
  DBGrids, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookAndFeelPainters,
  cxButtons, cxCheckBox, ExtCtrls, cxLabel, Variants, FIBDatabase,
  pFIBDatabase, uCommonSp, AllPeopleUnit, GlobalSpr, cxCurrencyEdit, iBase,
  LoadDogManedger, cxTL, {CRC32,} Halcn6db, Registry;
{const
 TABLE_STAGE    = 'DT_CONTRACT_STAGE';
 SEL_PROC_STAGE = 'SPDT_CONTRACT_STAGE_SEL';
 ADD_PROC_STAGE = 'SP_DT_CONTRACT_STAGE_ADD';
 DEL_PROC_STAGE = 'SP_DT_CONTRACT_STAGE_DEL';
 MOD_PROC_STAGE = 'SP_DT_CONTRACT_STAGE_MOD';
 GENERATOR_PROC_STAGE = 'SP_GEN_DT_CONTRACT_STAGE';
 PK_FIELD_STAGE = 'ID_STAGE';
}
const
// sys_SERVER = 12;
 SYSTEM_F   = 1;
type
   TPeriod = record
    date_beg : TDate;
    date_end : TDate;
    cost     : currency;
   end;
   TPeriods = array of TPeriod;
   
   TContractPayInfo = packed record
   date_beg  : TDate;
   date_end  : TDate;
   pay_beg   : TDate;
   pay_end   : TDate;
   summa     : currency;
   summa_nds : currency;
//   count     :
  end;
  TContractPayInfos = array of TContractPayInfo;
  TSchedDeliverInfo = packed record
   cost : Currency;
   summa : currency;
   summa_nds : currency;
   plan_summa: currency;
   plan_summa_nds : currency;
   deliver_count : currency;
   name_product : string;
   name_cat_cust : string;
   id_product : integer;
   id_cat_cust : integer;
   plan_count : currency;
   volume_pay : currency;
   volume_fulfil : currency;
   id_unit_meas : integer;
   id_unit_meas_sum : integer;
   name_unit_meas : string;
   name_unit_meas_sum : string;
//   name_unit_meas2 : string;
   unit_meas_koef : integer;// for count
   unit_meas_koef_sum : integer;// for summa
//   unit_meas_koef2 : integer;//for plan count
   id_point        : integer;
   name_point      : string;
{   summa_pay : currency;
   summa_fulfil : currency;
   summa_pay_nds : currency;
   summa_fulfil_nds : currency;}
   cnt_prod : integer;
   str_cost : string;
  end;
  TSchedDeliverInfos = array of TSchedDeliverInfo;
  TFdt_contract_ADD = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    SupplGroupBox: TGroupBox;
    Label11: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    CustGroupBox: TGroupBox;
    Label12: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    SupplDS: TpFIBDataSet;
    SupplDataSource: TDataSource;
    Label4: TLabel;
    CustDS: TpFIBDataSet;
    CustDataSource: TDataSource;
    Label5: TLabel;
    CustMenDataSource: TDataSource;
    CustMenDS: TpFIBDataSet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    pFIBQuery1: TpFIBQuery;
    RSumLabel: TLabel;
    CustomerEdit: TcxButtonEdit;
    DepartmentEdit: TcxButtonEdit;
    AccCustEdit: TcxPopupEdit;
    AccSupplEdit: TcxPopupEdit;
    MenCustEdit: TcxPopupEdit;
    MenSupplEdit: TcxButtonEdit;
    SummaEdit: TcxTextEdit;
    SummaPayEdit: TcxTextEdit;
    SummaNdsEdit: TcxTextEdit;
    SummaPayNdsEdit: TcxTextEdit;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    RegNumberEdit: TcxTextEdit;
    RegNumberCustEdit: TcxTextEdit;
    RegNumberSupplEdit: TcxTextEdit;
    RSumEdit: TcxTextEdit;
    DBGrid2DBTableView1: TcxGridDBTableView;
    DBGrid2Level1: TcxGridLevel;
    DBGrid2: TcxGrid;
    DBGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    DBGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    DBGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    DBGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DBGrid3DBTableView1: TcxGridDBTableView;
    DBGrid3Level1: TcxGridLevel;
    DBGrid3: TcxGrid;
    DBGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    DBGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    DBGrid3DBTableView1DBColumn3: TcxGridDBColumn;
    DateConclusionEdit: TcxDateEdit;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    StoredProc: TpFIBStoredProc;
    HalcyonDataSet2: THalcyonDataSet;
    HalcyonDataSet1: THalcyonDataSet;
    DogInfoDS: TpFIBDataSet;
    Query: TpFIBQuery;
    cxButtonEdit_otd: TcxButtonEdit;
    Label26: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    cxGrid2: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    Panel2: TPanel;
    AddButtonPeriods: TSpeedButton;
    MakeStagesButton: TSpeedButton;
    DelButton1: TSpeedButton;
    EditButton1: TSpeedButton;
    AddButton1: TSpeedButton;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    cxGrid3: TcxGrid;
    cxGridTableView3: TcxGridTableView;
    cxGridTableView3Column14: TcxGridColumn;
    cxGridTableView3Column15: TcxGridColumn;
    cxGridTableView3Column5: TcxGridColumn;
    cxGridTableView3Column9: TcxGridColumn;
    cxGridTableView3Column1: TcxGridColumn;
    cxGridTableView3Column4: TcxGridColumn;
    cxGridTableView3Column16: TcxGridColumn;
    cxGridTableView3Column17: TcxGridColumn;
    cxGridTableView3Column2: TcxGridColumn;
    cxGridTableView3Column3: TcxGridColumn;
    cxGridTableView3Column18: TcxGridColumn;
    cxGridTableView3Column19: TcxGridColumn;
    cxGridTableView3Column6: TcxGridColumn;
    cxGridTableView3Column7: TcxGridColumn;
    cxGridTableView3Column8: TcxGridColumn;
    cxGridTableView3Column11: TcxGridColumn;
    cxGridTableView3Column12: TcxGridColumn;
    cxGridTableView3Column10: TcxGridColumn;
    cxGridTableView3Column13: TcxGridColumn;
    cxGridLevel3: TcxGridLevel;
    GroupBox5: TGroupBox;
    cxGrid4: TcxGrid;
    cxGridTableView2: TcxGridTableView;
    cxGridTableView2Column1: TcxGridColumn;
    cxGridTableView2Column2: TcxGridColumn;
    cxGridTableView2Column3: TcxGridColumn;
    cxGridTableView2Column4: TcxGridColumn;
    cxGridTableView2Column5: TcxGridColumn;
    cxGridTableView2Column6: TcxGridColumn;
    cxGridTableView2Column7: TcxGridColumn;
    cxGridLevel4: TcxGridLevel;
    Panel4: TPanel;
    RefreshCheck: TcxCheckBox;
    SplitButton: TSpeedButton;
    DelButton3: TSpeedButton;
    EditButton3: TSpeedButton;
    AddButton3: TSpeedButton;
    Panel5: TPanel;
    DelButton2: TSpeedButton;
    EditButton2: TSpeedButton;
    AddButton2: TSpeedButton;
    Panel6: TPanel;
    OkButton2: TcxButton;
    CancelButton: TcxButton;
    PSumEdit: TcxTextEdit;
    StaticText4: TStaticText;
    PCountEdit: TcxTextEdit;
    StaticText3: TStaticText;
    SumEdit: TcxTextEdit;
    StaticText2: TStaticText;
    CountEdit: TcxTextEdit;
    StaticText1: TStaticText;
    StaticText5: TStaticText;
    NDSEdit: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure OkButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButton1Click(Sender: TObject);
    procedure DelButton1Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure AddButton3Click(Sender: TObject);
    procedure DelButton3Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure AddButton2Click(Sender: TObject);
    procedure DelButton2Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure DepartmentEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure MenSupplEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CustomerEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure SplitButtonClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RefreshCheckClick(Sender: TObject);
    procedure DateConclusionEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonPeriodsClick(Sender: TObject);
    procedure MakeStagesButtonClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DBGrid2DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DBGrid3DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button1Click(Sender: TObject);
    procedure cxGridTableView3CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  public
    fProc : TResProc;
    Pr_vizova        : string;
    id_type_contract : integer;
    id_department    : integer;
    id_acc_suppl     : int64;
    id_acc_cust      : int64;
    id_men_suppl     : integer;
    id_men_cust      : integer;
    id_customer      : int64;
    period_count     : integer;
    dep_number       : string;
    delta_beg, delta_end : integer;
    summa, summa_nds : Currency;
    Data_ContractPay  : array of TContractPayInfos;
    Data_SchedDeliver : array of TSchedDeliverInfos;
    isModify          : boolean;
    isViewRecord      : Boolean;
    TypeDog           : Integer;
    in_id_dog         : Int64;
    new_id_dog        : Int64;
    summa_pay         : Int64;
    id_otdel          : int64;
    function CheckDates : boolean; //Проверка правильности введенных периодов оплаты.
    procedure MakePayPeriods(const count : integer; const recIndex : integer; const CheckPrev : boolean = true);
    procedure MakeContractStages;
    procedure SelectCustomerInfo(const id_rate_account : int64);
    procedure SelectDepartmentInfo(in_id_rate_account : int64);
    procedure CalcSummary;
    procedure AddRecord;
    procedure ModRecord;
    procedure LoadInfo;
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;


implementation
uses DogLoaderUnit, dt_contract_stage_FORM_ADD, dt_contract_pay_FORM_ADD,
  dt_sched_deliver_FORM_ADD, dt_sched_deliver_FORM_ADD2, prodDateUnit;
{uses BaseTypes, dt_contract_FORM, sp_type_contract_UNIT,
 dt_contract_stage_FORM_ADD, dt_contract_pay_FORM_ADD, dt_sched_deliver_FORM_ADD,
 dt_sched_deliver_FORM_ADD2, dt_contract_point_FORM_ADD, uDepartmentsMain,
 PCardsViewUnit;}
{$R *.DFM}

const
 //Продукция
 IDX_ID_POINT    = 0;
 IDX_NAME_POINT  = 1;
 IDX_PRODUCT     = 2;
 IDX_CAT_CUST    = 3;
 IDX_COST        = 4;
 IDX_COUNT       = 5;
 IDX_ID_UNIT_MEAS  = 6;
 IDX_NAME_UNIT_MEAS  = 7;
 IDX_SUMMA       = 8;
 IDX_NDS         = 9;
 IDX_ID_UNIT_MEAS_SUM  = 10;
 IDX_NAME_UNIT_MEAS_SUM  = 11;
 IDX_PLAN_COUNT  = 12;
 IDX_VOL_PAY     = 13;
 IDX_VOL_FULFIL  = 14;
 IDX_ID_PRODUCT  = 15;
 IDX_ID_CAT_CUST = 16;
 IDX_PLAN_SUMMA  = 17;
 IDX_PLAN_SUMMA_NDS  = 18;
 //Периоды оплаты
 IDX_DATE_BEG = 0;
 IDX_DATE_END = 1;
 IDX_PAY_BEG  = 2;
 IDX_PAY_END  = 3;
 IDX_SUMMA2   = 4;
 IDX_NDS2     = 5;
 IDX_COUNT2   = 6;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh1: TFdt_contract_ADD;
begin
//  if data <> NIL then def_number := data^.num;
  sh1 := TFdt_contract_ADD.Create(AOwner);
  sh1.in_id_dog := id_dokument;
  sh1.WorkDatabase.Handle := DBHANDLE;
  sh1.pr_vizova := pr_vizova;
  sh1.TypeDog := Id_t_d;
  sh1.FormStyle := frmStyle;
  Sh1.Pr_vizova := Pr_vizova;
  sh1.fProc := proc;
  if (sh1.Pr_vizova = 'red') or (sh1.Pr_vizova = 'prosmotr') or (sh1.Pr_vizova = 'red2') then sh1.LoadInfo;
  if (sh1.Pr_vizova = 'prosmotr') then sh1.isViewRecord := true;


  if sh1.isViewRecord then begin
   sh1.OkButton2.Visible := false;
   sh1.MakeStagesButton.Enabled := false;
   sh1.AddButtonPeriods.Enabled := false;
   sh1.SplitButton.Enabled := false;
   sh1.RefreshCheck.Enabled := false;
   sh1.AddButton1.Enabled := false;
   sh1.AddButton2.Enabled := false;
   sh1.AddButton3.Enabled := false;
   sh1.cxButtonEdit_otd.Enabled := false;
 //  AddButton4.Enabled := false;
   sh1.EditButton1.Enabled := false;
   sh1.EditButton2.Enabled := false;
   sh1.EditButton3.Enabled := false;
 //  EditButton4.Enabled := false;
   sh1.DelButton1.Enabled := false;
   sh1.DelButton2.Enabled := false;
   sh1.DelButton3.Enabled := false;
   sh1.MakeStagesButton.Enabled := false;
   sh1.AddButtonPeriods.Enabled := false;
   sh1.EditButton2.Enabled := false;
   sh1.DateBegEdit.Enabled := false;
   sh1.DateEndEdit.Enabled := false;
   sh1.DateConclusionEdit.Enabled := false;
   sh1.RegNumberEdit.Enabled := false;
   sh1.CustomerEdit.Enabled := false;
   sh1.RegNumberCustEdit.Enabled := false;
   sh1.AccCustEdit.Enabled := false;
   sh1.MenCustEdit.Enabled := false;
   sh1.DepartmentEdit.Enabled := false;
   sh1.RegNumberSupplEdit.Enabled := false;
   sh1.AccSupplEdit.Enabled := false;
   sh1.MenSupplEdit.Enabled := false;
   sh1.cxButtonEdit_otd.Enabled := false;
   //  DelButton4.Enabled := false;
  end;
  if Pr_vizova = 'red2' then
  begin
    sh1.OkButton2Click(sh1);
  end;
  if sh1.FormStyle = fsNormal then
  begin
    sh1.ShowModal;
    sh1.Free;
  end;
end;


function CalcCost(dbeg, dend : TDate; periods : TPeriods) : currency;
var
 costs : array of currency;
 i : integer;
begin
 if length(periods) = 1 then
 begin
   Result := periods[0].cost;
   exit;
 end;
 SetLength(costs, Length(periods));
 costs[0] := periods[0].date_end - dbeg;
 for i := 1 to Length(periods) - 1 do
 begin
   Costs[i] := periods[i].date_end - periods[i - 1].date_end;
 end;
 for i := 0 to Length(costs) - 1 do Costs[i] := (Costs[i] / (dend - dbeg)) * Periods[i].cost;
 for i := 0 to Length(costs) - 1 do Result := Result + Costs[i];
end;


procedure GetNewPrimaryKey(StoredProc : TpFIBStoredProc; const TableName : string; var NewID : int64);
var
 id : int64;
begin
// StoredProc.Transaction.StartTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_GEN_'+ TableName, []);
// StoredProc.Transaction.Commit;
 id := StoredProc['NEW_ID'].AsInt64;
 StoredProc.Transaction.Commit;
 StoredProc.Close;
 NewID := StrToInt(IntToStr(id) + IntToStr(sys_SERVER));
end;

{procedure GetNewPrimaryKey2(DS : TpFIBDataSet; const TableName : string; var NewID : integer);
var
 id : integer;
begin
 DS.SelectSQL.Text := 'select * from PROC_GEN_'+ TableName;
 DS.Open;
 id := DS['NEW_ID'];
 DS.Close;
 NewID := StrToInt(IntToStr(id) + IntToStr(SYS_SERVER));
end;}

procedure TFdt_contract_ADD.MakeContractStages;
var
 date_beg : TDate;
 date_end : TDate;
 k        : TDate;
 y, m, d  : word;
 Row      : integer;
begin
 if isModify then exit;
 date_beg := DateBegEdit.Date;
 date_end := DateEndEdit.Date;
 if cxGridTableView1.DataController.RecordCount = 0 then begin
   k := date_beg;
   SetLength(Data_ContractPay, 0);
   SetLength(Data_SchedDeliver, 0);
   cxGridTableView1.DataController.RecordCount := 0;
   while k < date_end do begin
    cxGridTableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount + 1;
    row := cxGridTableView1.DataController.RecordCount - 1;
    SetLength(Data_ContractPay, Length(Data_ContractPay) + 1);
    SetLength(Data_SchedDeliver, Length(Data_SchedDeliver) + 1);
    cxGridTableView1.DataController.Values[Row, 2] := IntToStr(Length(Data_ContractPay) - 1);
    cxGridTableView1.DataController.Values[Row, 0] := {DateToStr(}k{)};
    k := incMonth(k, 1);
    DecodeDate(k, y, m, d);
    k := EncodeDate(y, m, 1) - 1;
    if k > date_end then k := date_end;
    cxGridTableView1.DataController.Values[Row, 1] := {DateToStr(}k{)};
    MakePayPeriods(period_count, Row);
    k := k + 1;
   end;
   cxGridTableView1.DataController.FocusedRecordIndex := 0;
 end else begin
   k := StrToDate(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 1]) + 1;
   while k < date_end do begin
    cxGridTableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount + 1;
    row := cxGridTableView1.DataController.RecordCount - 1;
    SetLength(Data_ContractPay, Length(Data_ContractPay) + 1);
    SetLength(Data_SchedDeliver, Length(Data_SchedDeliver) + 1);
    cxGridTableView1.DataController.Values[Row, 2] := IntToStr(Length(Data_ContractPay) - 1);
    cxGridTableView1.DataController.Values[Row, 0] := {DateToStr(}k{)};
    k := incMonth(k, 1);
    DecodeDate(k, y, m, d);
    k := EncodeDate(y, m, 1) - 1;
    if k > date_end then k := date_end;
    cxGridTableView1.DataController.Values[Row, 1] := {DateToStr(}k{)};
    MakePayPeriods(period_count, Row);
    k := k + 1;
   end;
   cxGridTableView1.DataController.FocusedRecordIndex := 0;
 end;
 DelButton1.Enabled  := true;
 EditButton1.Enabled := true;
// MakeStagesButton.Enabled := false;
 AddButtonPeriods.Enabled := true;
 AddButton2.Enabled := true;
 AddButton3.Enabled := true;
 SplitButton.Enabled := true;
end;

procedure TFdt_contract_ADD.MakePayPeriods(const count : integer; const recIndex : integer; const CheckPrev : boolean = true);
var
 summa_all, summa_nds_all : currency;
 sum, sum_nds, s, s_n : currency;
 i : integer;
 date_beg : TDate;
 date_end : TDate;
 date_step : TDate;
 idx : integer;
 Row : integer;
 prev_selected : integer;
 old_SYS_DIGITS_AFTER_DOT : integer;
begin
 if CheckPrev then prev_selected := cxGridTableView3.DataController.FocusedRecordIndex;

 old_SYS_DIGITS_AFTER_DOT := SYS_DIGITS_AFTER_DOT;
 SYS_DIGITS_AFTER_DOT := 2;

 summa_all := 0;
 summa_nds_all := 0;
 if cxGridTableView3.DataController.RecordCount <> 0 then
 for i := 0 to cxGridTableView3.DataController.RecordCount - 1 do begin
  summa_all := summa_all + StrToFloat(cxGridTableView3.DataController.Values[i, IDX_SUMMA] * Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex, i].unit_meas_koef_sum);
  summa_nds_all := summa_nds_all + StrToFloat(cxGridTableView3.DataController.Values[i, IDX_NDS] * Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex, i].unit_meas_koef_sum);
 end;
// Showmessage(FormatFloat('0.00', summa_all) + ', ' + IntToStr(count));
// Showmessage(FloatToStr(summa_all));
 sum := summa_all / count;
 sum_nds := summa_nds_all / count;
 Row := RecIndex{cxGridTableView1.DataController.FocusedRecordIndex};
 date_beg := cxGridTableView1.DataController.Values[Row, 0];
 date_end := cxGridTableView1.DataController.Values[Row, 1];
 if (date_end - date_beg) = 30 then date_step := (date_end - date_beg) / count - 1 else date_step := (date_end - date_beg) / count;
 idx      := StrToInt(cxGridTableView1.DataController.Values[Row, 2]);
 SetLength(Data_ContractPay[idx], 0);
 for i := 0 to count - 1 do begin
  SetLength(Data_ContractPay[idx], Length(Data_ContractPay[idx]) + 1);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].date_beg := date_beg;
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].date_end := date_beg + date_step;
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].pay_beg := date_beg + delta_beg;
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].pay_end := date_beg + date_step + delta_end ;
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa := sum;
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa_nds := sum_nds;
  date_beg := date_beg + date_step + 1;
 end;
 Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].date_end := date_end;
 Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].pay_end := date_end;
 s := 0;
 s_n := 0;
 for i := 0 to Length(Data_ContractPay[idx]) - 1 do begin
  s := StrToCurr(agCurrToStr(s + StrToCurr(agCurrToStr(Data_ContractPay[idx][i].summa))));
  s_n := StrToCurr(agCurrToStr(s_n + StrToCurr(agCurrToStr(Data_ContractPay[idx][i].summa_nds))));
 end;
 if summa_all - s <> 0 then Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa := Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa + (summa_all - s);
 if summa_nds_all - s_n <> 0 then Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa_nds := Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa_nds + (summa_nds_all - s_n);
 SYS_DIGITS_AFTER_DOT := old_SYS_DIGITS_AFTER_DOT;
 EditButton3.Enabled := true;
 DelButton3.Enabled := true;
 if CheckPrev then begin
  cxGridTableView1FocusedRecordChanged(cxGridTableView1, Nil, Nil, false);
  cxGridTableView3.DataController.FocusedRecordIndex := prev_selected;
 end;
end;


function TFdt_contract_ADD.CheckDates : boolean; //Проверка правильности введенных периодов оплаты.
var
 k   : integer;
 idx : integer;
begin
 Result := false;
 if cxGridTableView1.DataController.RecordCount = 0 then exit;
 Result := true;
 for k := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  idx := StrToInt(cxGridTableView1.DataController.Values[k, 2]);
  if Length(Data_ContractPay[idx]) = 0 then begin
   Result := false;
   exit;
  end;
 end;
end;

procedure TFdt_contract_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFdt_contract_ADD.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton2.SetFocus;
 end;
end;

procedure TFdt_contract_ADD.OkButton2Click(Sender: TObject);
var
 reg : TRegistry;
begin
 if DateConclusionEdit.Text = '' then
 begin
  agShowMessage('Необхідно ввести дату договору.');
  exit;
 end;

 if CustomerEdit.text = '' then begin
  agShowMessage('Необхідно ввести споживача.');
  exit;
 end;
 if AccCustEdit.text = '' then begin
  agShowMessage('Необхідно ввести рахунок споживача.');
  exit;
 end;
 if DepartmentEdit.text = '' then begin
  agShowMessage('Необхідно ввести постачальника.');
  exit;
 end;
 if AccSupplEdit.text = '' then begin
  agShowMessage('Необхідно ввести рахунок постачальника.');
  exit;
 end;
 if VarIsNull(SupplDS.FieldByName('MFO').AsVariant) then
 begin
  agShowMessage('Необхідно ввести рахунок постачальника з МФО');
  exit;
 end;
 if SupplDS.FieldByName('MFO').AsString = '' then
 begin
  agShowMessage('Необхідно ввести рахунок постачальника з МФО');
  exit;
 end;
 if VarIsNull(CustDS.FieldByName('MFO').AsVariant) then
 begin
  agShowMessage('Необхідно ввести рахунок споживоча з МФО');
  exit;
 end;
 if CustDS.FieldByName('MFO').AsString = '' then
 begin
  agShowMessage('Необхідно ввести рахунок споживоча з МФО');
  exit;
 end;

 if cxGridTableView1.DataController.RecordCount = 0 then MakeContractStages;
 if (pr_vizova = 'red') or (pr_vizova = 'red2') then ModRecord;
 if pr_vizova = 'add' then AddRecord;

  reg := TRegistry.Create;
  reg.OpenKey(REG_KEY + 'Department', true);
  try
   reg.WriteInteger('id_department', id_otdel);
  except
  end;
  reg.Free;

 if Assigned(fProc) then fProc(new_id_dog, raAdd);


 ModalResult := mrOK;
 Close;
end;

procedure TFdt_contract_ADD.FormShow(Sender: TObject);
begin
 if not isModify then begin
  DateConclusionEdit.Date := StrToDate(DateToStr(now));
  if pr_vizova = 'add' then
  begin
    DepartmentEdit.Text := DogLoaderUnit.SYS_DEF_NAME_DEPARTMENT;
    id_department := DogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
    SelectDepartmentInfo(-999);
  end;  
  Query.Close;
  Query.Sql.Text := 'select NAME_FULL from SP_DEPARTMENT WHERE ID_DEPARTMENT = ' + IntToStr(id_otdel) + ' and use_end > ''01.01.2050''';
  Query.ExecQuery;
  cxButtonEdit_otd.Text := Query.FieldByName('NAME_FULL').AsString;
  Query.Close;
 end else CalcSummary; 

 /////
// MakeContractStages;
 /////

{ AddButton4.Glyph.LoadFromResourceName(HInstance, 'add_s');
 DelButton4.Glyph.LoadFromResourceName(HInstance, 'no_s');
 EditButton4.Glyph.LoadFromResourceName(HInstance, 'edit_s');}

 if cxGridTableView1.DataController.RecordCount <> 0 then begin
  cxGridTableView1.DataController.FocusedRecordIndex := 0;
  DelButton1.Enabled  := true;
  EditButton1.Enabled := true;
//  MakeStagesButton.Enabled := false;
  AddButtonPeriods.Enabled := true;
 end else begin
  DelButton1.Enabled  := false;
  EditButton1.Enabled := false;
  MakeStagesButton.Enabled := true;
  AddButtonPeriods.Enabled := false;
 end;
// if cxGrid1TableView4.DataController.RecordCount <> 0 then cxGrid1TableView4.DataController.FocusedRecordIndex := 0;
end;

procedure TFdt_contract_ADD.AddButton1Click(Sender: TObject);
var
 mr  : integer;
 Row : integer;
begin
 fdt_contract_stage_add := Tfdt_contract_stage_add.Create(Self);
 fdt_contract_stage_add.Caption := 'Додати';
 fdt_contract_stage_add.OKButton.Caption := 'Додати';
 if cxGridTableView1.DataController.RecordCount <> 0 then fdt_contract_stage_add.DateBegEdit.Date := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 1] + 1;
 mr := fdt_contract_stage_add.ShowModal;
 if mr = mrOK then begin
  SetLength(Data_ContractPay, Length(Data_ContractPay) + 1);
  SetLength(Data_SchedDeliver, Length(Data_SchedDeliver) + 1);
  cxGridTableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount + 1;
  Row := cxGridTableView1.DataController.RecordCount - 1;
  cxGridTableView1.DataController.Values[Row, 0] := fdt_contract_stage_add.DateBegEdit.Date;
  cxGridTableView1.DataController.Values[Row, 1] := fdt_contract_stage_add.DateEndEdit.Date;
  cxGridTableView1.DataController.Values[Row, 2] := IntToStr(Length(Data_ContractPay) - 1);
  cxGridTableView1.DataController.FocusedRecordIndex := Row;
  DelButton1.Enabled := true;
  EditButton1.Enabled := true;
//  MakeStagesButton.Enabled := false;
  AddButtonPeriods.Enabled := true;
  AddButton2.Enabled := true;
  AddButton3.Enabled := true;
  SplitButton.Enabled := true;
 end;
 fdt_contract_stage_add.Free;
 //cxGridTableView1FocusedRecordChanged(cxGridTableView1, cxGridTableView1.Controller.FocusedRow, cxGridTableView1.Controller.FocusedRow, false);
end;

procedure TFdt_contract_ADD.DelButton1Click(Sender: TObject);
var
 i   : integer;
 id  : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 cxGridTableView1.DataController.DeleteFocused;
 if cxGridTableView1.DataController.RecordCount = 0 then begin
  DelButton1.Enabled := false;
  EditButton1.Enabled := false;
  MakeStagesButton.Enabled := true;
  AddButtonPeriods.Enabled := false;
  AddButton2.Enabled := false;
  AddButton3.Enabled := false;
  SplitButton.Enabled := false;
  EditButton2.Enabled := false;
  DelButton2.Enabled := false;
  DelButton3.Enabled := false;
  EditButton3.Enabled := false;
 end;
// if StringGrid1.Cells[0, StringGrid1.Row] = '' then exit;
{Row := cxGridTableView1.DataController.FocusedRecordIndex;
 id := StrToInt(cxGridTableView1.DataController.Values[Row, 2]);
 if Length(Data_ContractPay[id]) <> 0 then SetLength(Data_ContractPay[id], 0);
 if Length(Data_SchedDeliver[id]) <> 0 then SetLength(Data_SchedDeliver[id], 0);
 if StringGrid1.RowCount = 2 then begin
  StringGrid1.Cells[0, 1] := '';
  StringGrid1.Cells[1, 1] := '';
  StringGrid1.Cells[2, 1] := '';
  first1 := true;
  DelButton1.Enabled  := false;
  EditButton1.Enabled := false;
  AddButton3.Enabled  := false;
  SplitButton.Enabled := false;
  DelButton3.Enabled  := false;
  EditButton3.Enabled := false;
  AddButton2.Enabled  := false;
  DelButton2.Enabled  := false;
  EditButton2.Enabled := false;
  StringGrid1Click(StringGrid1);
  exit;
 end;
 if StringGrid1.Row = StringGrid1.RowCount - 1 then begin
  StringGrid1.RowCount := StringGrid1.RowCount - 1;
  StringGrid1Click(StringGrid1);
  exit;
 end;
 for i := StringGrid1.row to StringGrid1.RowCount - 2 do begin
  StringGrid1.Cells[0, i] := StringGrid1.Cells[0, i + 1];
  StringGrid1.Cells[1, i] := StringGrid1.Cells[1, i + 1];
  StringGrid1.Cells[2, i] := StringGrid1.Cells[2, i + 1];
 end;
 StringGrid1.RowCount := StringGrid1.RowCount - 1;
 StringGrid1Click(StringGrid1);}
end;

procedure TFdt_contract_ADD.EditButton1Click(Sender: TObject);
var
 mr  : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 Row := cxGridTableView1.DataController.FocusedRecordIndex;
 fdt_contract_stage_add := Tfdt_contract_stage_add.Create(Self);
 fdt_contract_stage_add.Caption := 'Змінити';
 fdt_contract_stage_add.OKButton.Caption := 'Змінити';
 fdt_contract_stage_add.DateBegEdit.Date := cxGridTableView1.DataController.Values[Row, 0];
 fdt_contract_stage_add.DateEndEdit.Date := cxGridTableView1.DataController.Values[Row, 1];
 mr := fdt_contract_stage_add.ShowModal;
 if mr = mrOK then begin
  cxGridTableView1.DataController.Values[Row, 0] := fdt_contract_stage_add.DateBegEdit.Date;
  cxGridTableView1.DataController.Values[Row, 1] := fdt_contract_stage_add.DateEndEdit.Date;
 end;
// StringGrid1Click(StringGrid1);
 fdt_contract_stage_add.Free;
end;

procedure TFdt_contract_ADD.AddButton3Click(Sender: TObject);
var
 mr  : integer;
 idx : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 fdt_contract_pay_add := Tfdt_contract_pay_add.Create(Self);
 fdt_contract_pay_add.Caption := 'Додати';
 fdt_contract_pay_add.OKButton.Caption := 'Додати';
 mr := fdt_contract_pay_add.ShowModal;
 if mr = mrOK then begin
  SetLength(Data_ContractPay[idx], Length(Data_ContractPay[idx]) + 1);
  cxGridTableView2.DataController.RecordCount := cxGridTableView2.DataController.RecordCount + 1;
  Row := cxGridTableView2.DataController.RecordCount - 1;
  cxGridTableView2.DataController.Values[Row, IDX_DATE_BEG] := fdt_contract_pay_add.DateBegEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_DATE_END] := fdt_contract_pay_add.DateEndEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_PAY_BEG] := fdt_contract_pay_add.DateBegPayEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_PAY_END] := fdt_contract_pay_add.DateEndPayEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_SUMMA2] := fdt_contract_pay_add.SummaEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_NDS2] := fdt_contract_pay_add.SummaNDSEdit.Text;

  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].date_beg := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_BEG]);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].date_end := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_END]);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].pay_beg := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_BEG]);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].pay_end := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_END]);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa := StrToCurr(cxGridTableView2.DataController.Values[Row, IDX_SUMMA2]);
  Data_ContractPay[idx][Length(Data_ContractPay[idx]) - 1].summa_nds := StrToCurr(cxGridTableView2.DataController.Values[Row, IDX_NDS2]);

  cxGridTableView2.DataController.FocusedRecordIndex := Row;
  DelButton3.Enabled := true;
  EditButton3.Enabled := true;
 end;
end;

procedure TFdt_contract_ADD.DelButton3Click(Sender: TObject);
var
 i, j : integer;
 idx  : integer;
 deleted_id : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if cxGridTableView2.DataController.FocusedRecordIndex = -1 then exit;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);

 deleted_id := cxGridTableView2.DataController.FocusedRecordIndex;
 cxGridTableView2.DataController.DeleteFocused;
 for i := deleted_id to Length(Data_ContractPay[idx]) - 2 do Data_ContractPay[idx][i] := Data_ContractPay[idx][i + 1];
 SetLength(Data_ContractPay[idx], Length(Data_ContractPay[idx]) - 1);
 if cxGridTableView2.DataController.RecordCount = 0 then begin
  DelButton3.Enabled := false;
  EditButton3.Enabled := false;
 end; 
(*
// if StringGrid2.Cells[0, StringGrid2.Row] = '' then exit;

 if StringGrid2.RowCount = 2 then begin
  for i := 0 to StringGrid2.ColCount - 1 do StringGrid2.Cells[i, 1] := '';
{  StringGrid2.Cells[0, 1] := '';
  StringGrid2.Cells[1, 1] := '';
  StringGrid2.Cells[2, 1] := '';
  StringGrid2.Cells[3, 1] := '';
  StringGrid2.Cells[4, 1] := '';
  StringGrid2.Cells[5, 1] := '';}
  SetLength(Data_ContractPay[idx], 0);
  first2 := true;
  DelButton3.Enabled := false;
  EditButton3.Enabled := false;
  exit;
 end;
 if StringGrid2.Row = StringGrid2.RowCount - 1 then begin
  StringGrid2.RowCount := StringGrid2.RowCount - 1;
  SetLength(Data_ContractPay[idx], Length(Data_ContractPay[idx]) - 1);
  exit;
 end;
 for i := StringGrid2.row to StringGrid2.RowCount - 2 do begin
  Data_ContractPay[idx][i - 1] := Data_ContractPay[idx][i + 1 - 1];
  for j := 0 to StringGrid2.ColCount - 1 do StringGrid2.Cells[j, i] := StringGrid2.Cells[j, i + 1];
{  StringGrid2.Cells[0, i] := StringGrid2.Cells[0, i + 1];
  StringGrid2.Cells[1, i] := StringGrid2.Cells[1, i + 1];
  StringGrid2.Cells[2, i] := StringGrid2.Cells[2, i + 1];
  StringGrid2.Cells[3, i] := StringGrid2.Cells[3, i + 1];
  StringGrid2.Cells[4, i] := StringGrid2.Cells[4, i + 1];
  StringGrid2.Cells[5, i] := StringGrid2.Cells[5, i + 1];}
 end;
 StringGrid2.RowCount := StringGrid2.RowCount - 1;
 SetLength(Data_ContractPay[idx], Length(Data_ContractPay[idx]) - 1);*)
end;

procedure TFdt_contract_ADD.EditButton3Click(Sender: TObject);
var
 mr  : integer;
 idx : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if cxGridTableView2.DataController.FocusedRecordIndex = -1 then exit;
 Row := cxGridTableView2.DataController.FocusedRecordIndex;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 fdt_contract_pay_add := Tfdt_contract_pay_add.Create(Self);
 fdt_contract_pay_add.Caption := 'Змінити';
 fdt_contract_pay_add.OKButton.Caption := 'Змінити';

 fdt_contract_pay_add.DateBegEdit.Date := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_BEG]);
 fdt_contract_pay_add.DateEndEdit.Date := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_END]);
 fdt_contract_pay_add.DateBegPayEdit.Date := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_BEG]);
 fdt_contract_pay_add.DateEndPayEdit.Date := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_END]);
 fdt_contract_pay_add.SummaEdit.Text := cxGridTableView2.DataController.Values[Row, IDX_SUMMA2];
 fdt_contract_pay_add.SummaNDSEdit.Text := cxGridTableView2.DataController.Values[Row, IDX_NDS2];

 mr := fdt_contract_pay_add.ShowModal;
 if mr = mrOK then begin

  cxGridTableView2.DataController.Values[Row, IDX_DATE_BEG] := fdt_contract_pay_add.DateBegEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_DATE_END] := fdt_contract_pay_add.DateEndEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_PAY_BEG] := fdt_contract_pay_add.DateBegPayEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_PAY_END] := fdt_contract_pay_add.DateEndPayEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_SUMMA2] := fdt_contract_pay_add.SummaEdit.Text;
  cxGridTableView2.DataController.Values[Row, IDX_NDS2] := fdt_contract_pay_add.SummaNDSEdit.Text;

  Data_ContractPay[idx][Row].date_beg  := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_BEG]);
  Data_ContractPay[idx][Row].date_end  := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_DATE_END]);
  Data_ContractPay[idx][Row].pay_beg   := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_BEG]);
  Data_ContractPay[idx][Row].pay_end   := StrToDate(cxGridTableView2.DataController.Values[Row, IDX_PAY_END]);
  Data_ContractPay[idx][Row].summa     := StrToCurr(cxGridTableView2.DataController.Values[Row, IDX_SUMMA2]);
  Data_ContractPay[idx][Row].summa_nds := StrToCurr(cxGridTableView2.DataController.Values[Row, IDX_NDS2]);

  cxGridTableView2.DataController.FocusedRecordIndex := Row;
 end;
end;

procedure TFdt_contract_ADD.AddButton2Click(Sender: TObject);
var
 mr  : integer;
 idx : integer;
 i   : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 fdt_sched_deliver_add := Tfdt_sched_deliver_add.Create(Self);
 fdt_sched_deliver_add.Caption := 'Додати';
 fdt_sched_deliver_add.OKButton.Caption := 'Додати';
 fdt_sched_deliver_add.DateBeg := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 0];
 fdt_sched_deliver_add.DateEnd := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 1];
 fdt_sched_deliver_add._nds  := dog_get_nds(fdt_sched_deliver_add.DateBeg, ReadTransaction);

 if cxGridTableView3.DataController.FocusedRecordIndex <> -1 then begin
  fdt_sched_deliver_add.id_point := cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, IDX_ID_POINT];
  fdt_sched_deliver_add.PointEdit.Text := cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, IDX_NAME_POINT];
 end;

 mr := fdt_sched_deliver_add.ShowModal;
 if mr = mrOK then begin
  SetLength(Data_SchedDeliver[idx], Length(Data_SchedDeliver[idx]) + 1);
  cxGridTableView3.DataController.RecordCount := cxGridTableView3.DataController.RecordCount + 1;
  Row := cxGridTableView3.DataController.RecordCount - 1;

  cxGridTableView3.DataController.Values[Row, IDX_ID_POINT] := fdt_sched_deliver_add.id_point;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_POINT] := fdt_sched_deliver_add.PointEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_COST] := fdt_sched_deliver_add.StrCostEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_SUMMA] := fdt_sched_deliver_add.SummaEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_NDS] := fdt_sched_deliver_add.SummaNdsEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA] := fdt_sched_deliver_add.SummaEdit2.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA_NDS] := fdt_sched_deliver_add.SummaNdsEdit2.Text;
  cxGridTableView3.DataController.Values[Row, IDX_COUNT] := fdt_sched_deliver_add.CountEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PRODUCT] := fdt_sched_deliver_add.ProductEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_PRODUCT] := IntToStr(fdt_sched_deliver_add.id_product);
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_COUNT] := fdt_sched_deliver_add.PlanCountEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_VOL_PAY] := fdt_sched_deliver_add.VolPayEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_VOL_FULFIL] := fdt_sched_deliver_add.VolFulfilEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_CAT_CUST] := IntToStr(fdt_sched_deliver_add.id_cat_cust);
  cxGridTableView3.DataController.Values[Row, IDX_CAT_CUST] := fdt_sched_deliver_add.CatEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_UNIT_MEAS] := fdt_sched_deliver_add.id_unit_meas;
  cxGridTableView3.DataController.Values[Row, IDX_ID_UNIT_MEAS_SUM] := fdt_sched_deliver_add.id_unit_meas_sum;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_UNIT_MEAS] := fdt_sched_deliver_add.UMeasEdit1.Text;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_UNIT_MEAS_SUM] := fdt_sched_deliver_add.UMeasEditS.Text;
  cxGridTableView3.DataController.Values[Row, IDX_COST] := fdt_sched_deliver_add.CostCount;
//  cxGridTableView3.DataController.Values[Row, idx_c]

  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_point := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_POINT]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_point := cxGridTableView3.DataController.Values[Row, IDX_NAME_POINT];
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].cost := StrToFloat(fdt_sched_deliver_add.CostEdit.Text);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].str_cost := fdt_sched_deliver_add.StrCostEdit.Text;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].summa := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_SUMMA]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].summa_nds := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_NDS]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_summa := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_summa_nds := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA_NDS]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].deliver_count := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_COUNT]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_product := cxGridTableView3.DataController.Values[Row, IDX_PRODUCT];
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_product := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_PRODUCT]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_count := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_COUNT]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].volume_pay := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_VOL_PAY]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].volume_fulfil := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_VOL_FULFIL]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_cat_cust := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_CAT_CUST]);
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_cat_cust := cxGridTableView3.DataController.Values[Row, IDX_CAT_CUST];
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_unit_meas := fdt_sched_deliver_add.UMeasEdit1.Text;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_unit_meas_sum := fdt_sched_deliver_add.UMeasEditS.Text;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].unit_meas_koef := fdt_sched_deliver_add.koef1;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].unit_meas_koef_sum := fdt_sched_deliver_add.koef_sum;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_unit_meas := fdt_sched_deliver_add.id_unit_meas;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_unit_meas_sum := fdt_sched_deliver_add.id_unit_meas_sum;
  Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].cnt_prod := cxGridTableView3.DataController.Values[Row, IDX_COST];

//  cxGridTableView3.DataController.FocusedRecordIndex := Row;
  EditButton2.Enabled := True;
  DelButton2.Enabled := True;
  MakePayPeriods(period_count, cxGridTableView1.DataController.FocusedRowIndex);
  CalcSummary;
  cxGridTableView3.DataController.FocusedRecordIndex := cxGridTableView3.DataController.RecordCount - 1;
 end;
end;

procedure TFdt_contract_ADD.DelButton2Click(Sender: TObject);
var
 i, j : integer;
 idx  : integer;
 deleted_id : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if cxGridTableView3.DataController.FocusedRecordIndex = -1 then exit;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 deleted_id := cxGridTableView3.DataController.FocusedRecordIndex;
 cxGridTableView3.DataController.DeleteFocused;
 for i := deleted_id to Length(Data_SchedDeliver[idx]) - 2 do Data_SchedDeliver[idx][i] := Data_SchedDeliver[idx][i + 1];
 SetLength(Data_SchedDeliver[idx], Length(Data_SchedDeliver[idx]) - 1);
 if cxGridTableView3.DataController.RecordCount = 0 then begin
  EditButton2.Enabled := false;
  DelButton2.Enabled := false;
 end;
 if RefreshCheck.Checked then MakePayPeriods(period_count, cxGridTableView1.DataController.FocusedRecordIndex);
 CalcSummary;
(*
 if cxGridTableView3.DataController.RecordCount = 1 then begin
  for i := 0 to StringGrid3.ColCount - 1 do StringGrid3.Cells[i, 1] := '';
{  StringGrid3.Cells[0, 1] := '';
  StringGrid3.Cells[1, 1] := '';
  StringGrid3.Cells[2, 1] := '';
  StringGrid3.Cells[3, 1] := '';
  StringGrid3.Cells[4, 1] := '';
  StringGrid3.Cells[5, 1] := '';}
  SetLength(Data_SchedDeliver[idx], 0);
  first3 := true;
  DelButton2.Enabled := false;
  EditButton2.Enabled := false;
  if RefreshCheck.Checked then MakePayPeriods(period_count);
  exit;
 end;
 if StringGrid3.Row = StringGrid3.RowCount - 1 then begin
  StringGrid3.RowCount := StringGrid3.RowCount - 1;
  SetLength(Data_SchedDeliver[idx], Length(Data_SchedDeliver[idx]) - 1);
  if RefreshCheck.Checked then MakePayPeriods(period_count);
  exit;
 end;
 for i := StringGrid3.row to StringGrid3.RowCount - 2 do begin
  Data_SchedDeliver[idx][i - 1] := Data_SchedDeliver[idx][i + 1 - 1];
  for j := 0 to StringGrid3.ColCount - 1 do StringGrid3.Cells[j, i] := StringGrid3.Cells[j, i + 1];
{  StringGrid3.Cells[0, i] := StringGrid3.Cells[0, i + 1];
  StringGrid3.Cells[1, i] := StringGrid3.Cells[1, i + 1];
  StringGrid3.Cells[2, i] := StringGrid3.Cells[2, i + 1];
  StringGrid3.Cells[3, i] := StringGrid3.Cells[3, i + 1];
  StringGrid3.Cells[4, i] := StringGrid3.Cells[4, i + 1];
  StringGrid3.Cells[5, i] := StringGrid3.Cells[5, i + 1];}
 end;
 StringGrid3.RowCount := StringGrid3.RowCount - 1;
 SetLength(Data_SchedDeliver[idx], Length(Data_SchedDeliver[idx]) - 1);
 if RefreshCheck.Checked then MakePayPeriods(period_count);
 *)
end;

procedure TFdt_contract_ADD.EditButton2Click(Sender: TObject);
var
 mr  : integer;
 idx : integer;
 Row : integer;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if cxGridTableView3.DataController.FocusedRecordIndex = -1 then exit;
 Row := cxGridTableView3.DataController.FocusedRecordIndex;
 
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 fdt_sched_deliver_add := Tfdt_sched_deliver_add.Create(Self);
 fdt_sched_deliver_add.Caption := 'Змінити';
 fdt_sched_deliver_add.OKButton.Caption := 'Змінити';

 fdt_sched_deliver_add.id_point := cxGridTableView3.DataController.Values[Row, IDX_ID_POINT];
 fdt_sched_deliver_add.PointEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_NAME_POINT];
 fdt_sched_deliver_add.CostEdit.Text := agCurrToStr(Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][Row].cost);
 fdt_sched_deliver_add.CostEdit2.Text := agCurrToStr(Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][Row].cost);
 fdt_sched_deliver_add.StrCostEdit.Text := Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][Row].str_cost;
 fdt_sched_deliver_add.StrCostEdit2.Text := Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][Row].str_cost;
 fdt_sched_deliver_add.SummaEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_SUMMA];
 fdt_sched_deliver_add.SummaNdsEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_NDS];
 fdt_sched_deliver_add.SummaEdit2.Text := cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA];
 fdt_sched_deliver_add.SummaNdsEdit2.Text := cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA_NDS];
 fdt_sched_deliver_add.CountEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_COUNT];
 fdt_sched_deliver_add.ProductEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_PRODUCT];
 fdt_sched_deliver_add.id_product := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_PRODUCT]);
 fdt_sched_deliver_add.PlanCountEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_PLAN_COUNT];
 fdt_sched_deliver_add.VolPayEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_VOL_PAY];
 fdt_sched_deliver_add.VolFulFilEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_VOL_FULFIL];
 fdt_sched_deliver_add.id_cat_cust := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_CAT_CUST]);
 fdt_sched_deliver_add.CatEdit.Text := cxGridTableView3.DataController.Values[Row, IDX_CAT_CUST];
 fdt_sched_deliver_add.UMeasEdit1.Text := Data_SchedDeliver[idx][Row].name_unit_meas;
 fdt_sched_deliver_add.UMeasEditS.Text := Data_SchedDeliver[idx][Row].name_unit_meas_sum;
 fdt_sched_deliver_add.koef1 := Data_SchedDeliver[idx][Row].unit_meas_koef;
 fdt_sched_deliver_add.koef_sum := Data_SchedDeliver[idx][Row].unit_meas_koef_sum;
 fdt_sched_deliver_add.id_unit_meas := Data_SchedDeliver[idx][Row].id_unit_meas;
 fdt_sched_deliver_add.id_unit_meas_sum := Data_SchedDeliver[idx][Row].id_unit_meas_sum;
 fdt_sched_deliver_add.CostCount := Data_SchedDeliver[idx][Row].cnt_prod;

 fdt_sched_deliver_add.DateBeg := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 0];
 fdt_sched_deliver_add.DateEnd := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 1];
 fdt_sched_deliver_add._nds  := dog_get_nds(fdt_sched_deliver_add.DateBeg, ReadTransaction);


 mr := fdt_sched_deliver_add.ShowModal;
 if mr = mrOK then begin
  cxGridTableView3.DataController.Values[Row, IDX_ID_POINT] := fdt_sched_deliver_add.id_point;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_POINT] := fdt_sched_deliver_add.PointEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_COST] := fdt_sched_deliver_add.StrCostEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_SUMMA] := fdt_sched_deliver_add.SummaEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_NDS] := fdt_sched_deliver_add.SummaNdsEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA] := fdt_sched_deliver_add.SummaEdit2.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA_NDS] := fdt_sched_deliver_add.SummaNdsEdit2.Text;
  cxGridTableView3.DataController.Values[Row, IDX_COUNT] := fdt_sched_deliver_add.CountEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_PRODUCT] := fdt_sched_deliver_add.ProductEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_PRODUCT] := IntToStr(fdt_sched_deliver_add.id_product);
  cxGridTableView3.DataController.Values[Row, IDX_PLAN_COUNT] := fdt_sched_deliver_add.PlanCountEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_VOL_PAY] := fdt_sched_deliver_add.VolPayEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_VOL_FULFIL] := fdt_sched_deliver_add.VolFulfilEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_CAT_CUST] := IntToStr(fdt_sched_deliver_add.id_cat_cust);
  cxGridTableView3.DataController.Values[Row, IDX_CAT_CUST] := fdt_sched_deliver_add.CatEdit.Text;
  cxGridTableView3.DataController.Values[Row, IDX_ID_UNIT_MEAS] := fdt_sched_deliver_add.id_unit_meas;
  cxGridTableView3.DataController.Values[Row, IDX_ID_UNIT_MEAS_SUM] := fdt_sched_deliver_add.id_unit_meas_sum;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_UNIT_MEAS] := fdt_sched_deliver_add.UMeasEdit1.Text;
  cxGridTableView3.DataController.Values[Row, IDX_NAME_UNIT_MEAS_SUM] := fdt_sched_deliver_add.UMeasEditS.Text;
//  cxGridTableView3.DataController.Values[Row, idx_cost_count] := fdt_sched_deliver_add.CostCount;

  Data_SchedDeliver[idx][Row].id_point := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_POINT]);
  Data_SchedDeliver[idx][Row].name_point := cxGridTableView3.DataController.Values[Row, IDX_NAME_POINT];
  Data_SchedDeliver[idx][Row].cost := StrToCurr(fdt_sched_deliver_add.CostEdit.Text);
//  Data_SchedDeliver[idx][Row].str_cost := fdt_sched_deliver_add.StrCostEdit.Text;
  Data_SchedDeliver[idx][Row].summa := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_SUMMA]);
  Data_SchedDeliver[idx][Row].summa_nds := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_NDS]);
  Data_SchedDeliver[idx][Row].plan_summa := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA]);
  Data_SchedDeliver[idx][Row].plan_summa_nds := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_SUMMA_NDS]);
  Data_SchedDeliver[idx][Row].deliver_count := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_COUNT]);
  Data_SchedDeliver[idx][Row].name_product := cxGridTableView3.DataController.Values[Row, IDX_PRODUCT];
  Data_SchedDeliver[idx][Row].id_product := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_PRODUCT]);
  Data_SchedDeliver[idx][Row].plan_count := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_PLAN_COUNT]);
  Data_SchedDeliver[idx][Row].volume_pay := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_VOL_PAY]);
  Data_SchedDeliver[idx][Row].volume_fulfil := StrToCurr(cxGridTableView3.DataController.Values[Row, IDX_VOL_FULFIL]);
  Data_SchedDeliver[idx][Row].id_cat_cust := StrToInt(cxGridTableView3.DataController.Values[Row, IDX_ID_CAT_CUST]);
  Data_SchedDeliver[idx][Row].name_cat_cust := cxGridTableView3.DataController.Values[Row, IDX_CAT_CUST];
  Data_SchedDeliver[idx][Row].name_unit_meas := fdt_sched_deliver_add.UMeasEdit1.Text;
  Data_SchedDeliver[idx][Row].name_unit_meas_sum := fdt_sched_deliver_add.UMeasEditS.Text;
  Data_SchedDeliver[idx][Row].unit_meas_koef := fdt_sched_deliver_add.koef1;
  Data_SchedDeliver[idx][Row].unit_meas_koef_sum := fdt_sched_deliver_add.koef_sum;
  Data_SchedDeliver[idx][Row].id_unit_meas := fdt_sched_deliver_add.id_unit_meas;
  Data_SchedDeliver[idx][Row].id_unit_meas_sum := fdt_sched_deliver_add.id_unit_meas_sum;
  Data_SchedDeliver[idx][Row].cnt_prod := fdt_sched_deliver_add.CostCount;
  Data_SchedDeliver[idx][Row].str_cost := fdt_sched_deliver_add.StrCostEdit.Text;

  if RefreshCheck.Checked then MakePayPeriods(period_count, cxGridTableView1.DataController.FocusedRecordIndex);
  CalcSummary;
 end;
end;

procedure TFdt_contract_ADD.DepartmentEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
    sp: TSprav;
begin
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
            FieldValues['Actual_Date'] := now;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Id_Department := sp.Output['Id_Department'];
            if not VarIsNull(sp.Output['Name_Short']) then DepartmentEdit.Text := sp.Output['Name_Short'];
        end;
        sp.Free;
    end;
(*
     // создать справочник
 sp :=  TDepartmentsSprav.Create;
 if sp <> nil then begin
         // заполнить входные параметры
  with sp.Input do begin
   Append;
   FieldValues['DBHandle'] := Integer(DM.Database.Handle);
       // модальный показ
   FieldValues['ShowStyle'] := 0;
       // единичная выборка
   FieldValues['Select'] := 1;

   FieldValues['Root_Department'] := 2612;
   FieldValues['Actual_Date'] := Date;
   Post;
  end;
 end;
     // показать справочник и проанализировать результат (выбор одного подр.)
 sp.Show;

 if sp.Output = nil then ShowMessage('Ошибка!: Выходные параметры пусты!!!')
 else
 if not sp.Output.IsEmpty then begin
  id_department := sp.Output['Id_Department'];
  if not VarIsNull(sp.Output['Name_Short']) then DepartmentEdit.Text := sp.Output['Name_Short'];
 end;

 sp.Free;*)
 SelectDepartmentInfo(-999);
end;

procedure TFdt_contract_ADD.MenSupplEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
 res : Variant;
begin
 res := AllPeopleUnit.GetMan(Self, WorkDatabase.Handle);
 if VarArrayDimCount(res) <> 0 then
 begin
  id_men_suppl := Res[0];
  MenSupplEdit.Text := Res[1];
 end;
end;

procedure TFdt_contract_ADD.SelectDepartmentInfo(in_id_rate_account : int64);
begin
// ShowMessage(IntToStr(in_id_rate_account));
 SupplDS.Active := false;
 SupplDS.sqls.SelectSQL.Text := 'select * from PROC_SP_DEPARTMENT_GET_ACCOUNTS(' + IntToStr(ID_DEPARTMENT) + ')';
 SupplDS.Active := true;
 AccSupplEdit.Text := '';
 if ((isModify) or (isViewRecord)) and (in_id_rate_account <> -999) then
 begin
   SupplDS.Locate('ID_RATE_ACCOUNT', in_id_rate_account, []);
 end;

 if SupplDS.RecordCount <> 0 then AccSupplEdit.Text := SupplDS['RATE_ACCOUNT'];
end;

procedure TFdt_contract_ADD.SelectCustomerInfo(const id_rate_account : int64);
begin
 CustDS.Active := false;
 CustDS.SQLS.SelectSQL.Text := 'select * from PROC_SP_CUSTOMER_GET_ACCOUNTS(' + IntToStr(id_customer) + ')';
 CustDS.Active := true;

 AccCustEdit.Text := '';
 if id_rate_account <> -1 then CustDS.Locate('ID_RATE_ACCOUNT', id_rate_account, [loCaseInsensitive]);
 if CustDS.RecordCount <> 0 then AccCustEdit.Text := CustDS['RATE_ACCOUNT'];

 CustMenDS.Active := false;
 CustMenDS.SQLs.SelectSQL.Text := 'select * from PUB_SP_CUST_MEN_SEL(' + IntToStr(id_customer) + ')';
 CustMenDS.Active := true;
 if CustMenDS.RecordCount <> 0 then MenCustEdit.Text := CustMenDS['FIO'];
end;

procedure TFdt_contract_ADD.CustomerEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
 i, o : TSpravParams;
// sprav : Tsp_customer;
// opt    : TSpravOptions;
// Result : TResultArray;
 id_rate_acc : int64;
 res : Variant;
begin
 if CustDS.RecordCount = 0 then id_rate_acc := -1 else id_rate_acc := CustDS['ID_RATE_ACCOUNT'];
 if id_customer = 0 then id_customer := -1;

  i := TSpravParams.Create;
  o := TSpravParams.Create;
    i['DataBase']     := Integer(WorkDatabase.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['id_customer'] := id_customer;
    i['id_rate_account'] := id_rate_acc;
    i['SHOW_ALL'] := 1;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
     id_customer := o['ID_CUSTOMER'];
     CustomerEdit.Text := o['NAME_CUSTOMER'];
     Caption := 'Реєстрація договору - [' + CustomerEdit.Text + ']';
     id_rate_acc := -1;
     id_rate_acc := O['ID_RATE_ACCOUNT'];
    end;
    i.Free;
    o.Free;
//  Res := ShowCustomersSprav(Self, DBHandle, FormStyle, ActualDate, SelectionMode, id_customer, id_rate_account, isMultiSelect, id_session);
 { post := ShowCustomers(Self, pFIBDatabase.Handle, fsNormal, Date, csmRateAcc,id_p,rate_acc_p);

  if VarArrayDimCount(post) > 0 then
  begin
    if post[0] > 0 then
        begin
          id_p := post[0];
          rate_acc_p := post[1];
          cxTextEdit_rsch_p.Text := post[2];
          cxTextEdit_mfo_p.Text := post[5];
          cxTextEdit_bank_p.Text := post[6];
          pFIBDataSet_post.Active := false;
          pFIBDataSet_post.ParamByName('param_cust').Value := id_p;
          pFIBDataSet_post.Active := true;
          name_p := pFIBDataSet_post.FieldByName('name_customer').AsString;
          cxButtonEdit_name_p.Text := name_p;
        end;}

{ if id_customer = 0 then id_customer := -1;
 Res := ShowCustomers(Self, WorkDatabase.Handle, fsNormal, now, csmRateAcc, id_customer, id_rate_acc);
 if VarArrayDimCount(res) <> 0 then
 begin
   id_customer := Res[0];
   CustomerEdit.Text := Res[1];
   Caption := 'Реєстрація договору - [' + CustomerEdit.Text + ']';
   id_rate_acc := -1;
   if VarArrayDimCount(Res) = 3 then id_rate_acc := Res[2];
 end;          }
{ opt.canAdd     := true;
 opt.canEdit    := true;
 opt.canDelete  := true;
 opt.canSelect  := true;
 opt.canSelect2 := false;
 opt.HideButtons := false;
 opt.isModal    := true;
 sprav  := Tsp_customer.Create(Self, TFdt_contract(Owner).DB, TFdt_contract(Owner).RTransaction, TFdt_contract(Owner).WTransaction, opt, id_customer, id_rate_acc);
 Result := sprav.Show;
 if Length(Result) <> 0 then begin
  id_customer := Result[0];
  CustomerEdit.Text := Result[1];
  Caption := 'Реєстрація договору - [' + CustomerEdit.Text + ']';
  id_rate_acc := -1;
  if Length(Result) = 3 then id_rate_acc := Result[2];
 end else exit;}

 SelectCustomerInfo(id_rate_acc);
end;

procedure TFdt_contract_ADD.SplitButtonClick(Sender: TObject);
var
 value : string;
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 value := IntToStr(period_count);
 if inputQuery('Розбити на періоди', 'Кількість періодів', value) then begin
  period_count := StrToInt(value);
  MakePayPeriods(period_count, cxGridTableView1.DataController.FocusedRecordIndex);
 end; 
end;

procedure TFdt_contract_ADD.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePageIndex = 1 then Begin
  if (not isViewRecord) and (Pr_vizova <> 'red') and (Pr_vizova <> 'red2') then MakeContractStages;
//  Width := 794;
//  Height := 535;
//  PageControl1.Height := 441;
//  Left := Screen.Width div 2 - Width div 2;
//  Top := Screen.Height div 2 - Height div 2 + 16;
 end else begin
//  Width := 737;
//  Height := 403;
//  PageControl1.Height := 313;
 end;
end;

procedure TFdt_contract_ADD.RefreshCheckClick(Sender: TObject);
begin
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if RefreshCheck.Checked then MakePayPeriods(period_count, cxGridTableView1.DataController.FocusedRecordIndex);
end;

procedure TFdt_contract_ADD.DateConclusionEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
 end;
end;

procedure TFdt_contract_ADD.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 i, j, idx : integer;
 reg : TRegistry;
begin

 Summa := 0;
 summa_nds := 0;
 if cxGridTableView1.DataController.RecordCount <> 0 then begin
  for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
   idx := StrToInt(cxGridTableView1.DataController.Values[i, 2]);
   if Length(Data_SchedDeliver[idx]) <>  0 then for j := 0 to Length(Data_SchedDeliver[idx]) - 1 do begin
    Summa := Summa + Data_SchedDeliver[idx][j].summa;
    Summa_nds := Summa_nds + Data_SchedDeliver[idx][j].summa_nds;
   end;
  end;
 end;
 Action := caFree;
end;

procedure TFdt_contract_ADD.FormCreate(Sender: TObject);
var
 year  : word;
 month : word;
 day   : word;
 reg   : TRegistry; 
begin
 PageControl1.ActivePageIndex := 0;

    reg := TRegistry.Create;
    reg.OpenKey(REG_KEY + 'Department', true);
    try
      id_otdel := reg.ReadInteger('id_department');
    except
      id_otdel := -1;
    end;
    reg.Free;
// Width := 737;
// Height := 403;
// PageControl1.Height := 313;
{ cxGrid1TableView4.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView4.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;}
 cxGridTableView1.Items[0].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGridTableView1.Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGridTableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;

 cxGridTableView3.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[10].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[11].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[12].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[13].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[14].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[15].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[16].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[17].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView3.Items[18].DataBinding.ValueTypeClass := TcxStringValueType;
// cxGridTableView3.Items[19].DataBinding.ValueTypeClass := TcxStringValueType;

 cxGridTableView2.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGridTableView2.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;

 isModify := false;
 dep_number := '0';
 period_count := 3;

 pFIBQuery1.Database := WorkDatabase;
 pFIBQuery1.Transaction := WriteTransaction;
 SupplDS.Database := WorkDatabase;
 SupplDS.Transaction := ReadTransaction;
 CustDS.Database := WorkDatabase;
 CustDS.Transaction := ReadTransaction;
 CustMenDS.Database := WorkDatabase;
 CustMenDS.Transaction := ReadTransaction;

 SetLength(Data_ContractPay, 0);
 SetLength(Data_SchedDeliver, 0);
 DecodeDate(date, year, month, day);
 DateBegEdit.Date := EncodeDate(year, 1, 1);
 DateEndEdit.Date := EncodeDate(year, 12, 31);
end;

function RemoveSpaces(const s : string) : string;
var
 i : Integer;
begin
 Result := '';
 if s = '' then Exit;
 for i := 1 to Length(s) do if (s[i] <> ' ') and (s[i] <> #160) then Result := Result + s[i];
end;

procedure TFdt_contract_ADD.AddButtonPeriodsClick(Sender: TObject);
var
 i, idx : integer;
 j, id : integer;
 d1, d2, s : string;
 Fdt_sched_deliver_ADD2 : TFdt_sched_deliver_ADD2;
 dat : TDate;
 nds : Currency;
begin
 fdt_sched_deliver_add2 := Tfdt_sched_deliver_add2.Create(Self);
 Fdt_sched_deliver_ADD2.pFIBQuery1.Database := WorkDatabase;
 Fdt_sched_deliver_ADD2.pFIBQuery1.Transaction := ReadTransaction;
 Fdt_sched_deliver_ADD2.pFIBQuery2.Database := WorkDatabase;
 Fdt_sched_deliver_ADD2.pFIBQuery2.Transaction := ReadTransaction;
 if not fdt_sched_deliver_add2.ShowProductForm then exit;

 fdt_sched_deliver_add2.cxGrid1TableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount;
 for i := 0 to fdt_sched_deliver_add2.cxGrid1TableView1.DataController.RecordCount - 1 do begin
  fdt_sched_deliver_add2.cxGrid1TableView1.DataController.Values[i, dt_sched_deliver_FORM_ADD2.IDX_DATE_BEG] := cxGridTableView1.DataController.Values[i, 0];
  fdt_sched_deliver_add2.cxGrid1TableView1.DataController.Values[i, dt_sched_deliver_FORM_ADD2.IDX_DATE_END] := cxGridTableView1.DataController.Values[i, 1];
 end;

 if fdt_sched_deliver_add2.ShowModal = mrOK then begin
  for i := 0 to fdt_sched_deliver_add2.cxGrid1TableView1.DataController.RecordCount - 1 do begin

   if (fdt_sched_deliver_add2.cxGrid1TableView1.DataController.Values[i, IDX_COUNT] = 0) and (fdt_sched_deliver_add2.cxGrid1TableView1.DataController.Values[i, IDX_P_COUNT] = 0) then continue;

   j := i;
   s := fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[j, IDX_DATE_BEG];
   while s = '' do begin
    dec(j);
    s := fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[j, IDX_DATE_BEG];
   end;
   d1 := s;
   d2:= fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[j, IDX_DATE_END];
   for j := 0 to cxGridTableView1.DataController.RecordCount - 1 do
       if (cxGridTableView1.DataController.Values[j, 0] = d1) and
          (cxGridTableView1.DataController.Values[j, 1] = d2) then begin
            idx := cxGridTableView1.DataController.Values[j, 2];
            break;
          end;

//   idx := StrToInt(cxGridTableView1.DataController.Values[i, 2]);
   SetLength(Data_SchedDeliver[idx], Length(Data_SchedDeliver[idx]) + 1);

   dat := StrToDate(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_DATE_BEG]);
   NDS := dog_get_nds(dat, ReadTransaction);

   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_point := fdt_sched_deliver_add2.id_point;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_point := fdt_sched_deliver_add2.PointEdit.Text;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].cost := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_REAL_COST]));
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].str_cost := fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_COST];
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].summa := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_SUMMA]));
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].summa_nds := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_SUMMA])) * NDS;

   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_summa := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_P_SUMMA]));
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_summa_nds := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_P_SUMMA])) * NDS;

   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].deliver_count := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_COUNT]));
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_product := fdt_sched_deliver_add2.ProductEdit.Text;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_product := fdt_sched_deliver_add2.id_product;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].plan_count := StrToCurr(RemoveSpaces(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, dt_sched_deliver_FORM_ADD2.IDX_P_COUNT]));
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].volume_pay := 0;//StrToCurr(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[dt_sched_deliver_FORM_ADD2.IDX_VOL_PAY, i]);
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].volume_fulfil := 0;//StrToCurr(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[dt_sched_deliver_FORM_ADD2.IDX_VOL_FULFIL, i]);
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_cat_cust := fdt_sched_deliver_add2.id_cat_cust;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_cat_cust := fdt_sched_deliver_add2.CatEdit.Text;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_unit_meas := fdt_sched_deliver_add2.UMeasEdit1.Text;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].name_unit_meas_sum := fdt_sched_deliver_add2.UMeasEditS.Text;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_unit_meas := fdt_sched_deliver_add2.id_unit_meas;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].id_unit_meas_sum := fdt_sched_deliver_add2.id_unit_meas_sum;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].unit_meas_koef := fdt_sched_deliver_add2.koef;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].unit_meas_koef_sum := fdt_sched_deliver_add2.koef_sum;
   Data_SchedDeliver[idx][Length(Data_SchedDeliver[idx]) - 1].cnt_prod := StrToInt(fdt_sched_deliver_add2.cxGrid1TableView1.DataController.DisplayTexts[i, 8]);

//   cxGridTableView1.DataController.FocusedRecordIndex := i;
//   MakePayPeriods(period_count, i);
  end;

  for i := 0 to fdt_sched_deliver_add2.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   cxGridTableView1.DataController.FocusedRecordIndex := i;
   cxGridTableView1FocusedRecordChanged(cxGridTableView1, Nil, Nil, false);
   MakePayPeriods(period_count, i, false);
  end;
  CalcSummary;
 end;

// cxGridTableView1.DataController.FocusedRecordIndex := 0;

 fdt_sched_deliver_add2.Free;
 cxGridTableView1.DataController.FocusedRecordIndex := 1;
 cxGridTableView1.DataController.FocusedRecordIndex := 0;
 // StringGrid1Click(Self);
end;

procedure TFdt_contract_ADD.MakeStagesButtonClick(Sender: TObject);
var
 isMod : boolean;
begin
// if cxGridTableView1.DataController.RecordCount = 0 then begin
  isMod := isModify;
  isModify := false;
  MakeContractStages;
  isModify := isMod;
// end;
end;

procedure TFdt_contract_ADD.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if SupplDS.RecordCount <> 0 then AccSupplEdit.Text := SupplDS['RATE_ACCOUNT'];
 AccSupplEdit.DroppedDown := false;
end;

procedure TFdt_contract_ADD.DBGrid2DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if CustDS.RecordCount <> 0 then AccCustEdit.Text := CustDS['RATE_ACCOUNT'];
 AccCustEdit.DroppedDown := false;
end;

procedure TFdt_contract_ADD.DBGrid3DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if CustMenDS.RecordCount <> 0 then MenCustEdit.Text := CustMenDS['FIO'];
 MenCustEdit.DroppedDown := false;
end;

procedure TFdt_contract_ADD.cxGridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 idx : integer;
 i   : integer;
 Row : integer;
 old_SYS_DIGITS_AFTER_DOT : integer;
begin
 cxGridTableView2.DataController.RecordCount := 0;
 cxGridTableView3.DataController.RecordCount := 0;
 if cxGridTableView1.DataController.FocusedRecordIndex = -1 then exit;
 if cxGridTableView1.DataController.RecordCount = 0 then exit;
 idx := StrToInt(cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2]);
 if Length(Data_ContractPay[idx]) <> 0 then begin
  for i := 0 to Length(Data_ContractPay[idx]) - 1 do begin
   cxGridTableView2.DataController.RecordCount := cxGridTableView2.DataController.RecordCount + 1;
   cxGridTableView2.DataController.Values[i, IDX_DATE_BEG] := DateToStr(Data_ContractPay[idx][i].date_beg);
   cxGridTableView2.DataController.Values[i, IDX_DATE_END] := DateToStr(Data_ContractPay[idx][i].date_end);
   cxGridTableView2.DataController.Values[i, IDX_PAY_BEG] := DateToStr(Data_ContractPay[idx][i].pay_beg);
   cxGridTableView2.DataController.Values[i, IDX_PAY_END] := DateToStr(Data_ContractPay[idx][i].pay_end);
   old_SYS_DIGITS_AFTER_DOT := SYS_DIGITS_AFTER_DOT;
   SYS_DIGITS_AFTER_DOT := 2;
   cxGridTableView2.DataController.Values[i, IDX_SUMMA2] := agCurrToStr(Data_ContractPay[idx][i].summa);
   cxGridTableView2.DataController.Values[i, IDX_NDS2] := agCurrToStr(Data_ContractPay[idx][i].summa_nds);
   SYS_DIGITS_AFTER_DOT := old_SYS_DIGITS_AFTER_DOT;
  end;
 end;
 if Length(Data_SchedDeliver[idx]) <> 0 then begin
  for i := 0 to Length(Data_SchedDeliver[idx]) - 1 do begin
   cxGridTableView3.DataController.RecordCount := cxGridTableView3.DataController.RecordCount + 1;
   Row := cxGridTableView3.DataController.RecordCount - 1;
   cxGridTableView3.DataController.Values[i, IDX_ID_POINT] := Data_SchedDeliver[idx][i].id_point;
   cxGridTableView3.DataController.Values[i, IDX_NAME_POINT] := Data_SchedDeliver[idx][i].name_point;
   cxGridTableView3.DataController.Values[i, IDX_COST] := Data_SchedDeliver[idx][i].str_cost; //agCurrToStr(Data_SchedDeliver[idx][i].cost);
   cxGridTableView3.DataController.Values[i, IDX_SUMMA] := agCurrToStr(Data_SchedDeliver[idx][i].summa);
   cxGridTableView3.DataController.Values[i, IDX_NDS] := agCurrToStr(Data_SchedDeliver[idx][i].summa_nds);
   cxGridTableView3.DataController.Values[i, IDX_PLAN_SUMMA] := agCurrToStr(Data_SchedDeliver[idx][i].plan_summa);
   cxGridTableView3.DataController.Values[i, IDX_PLAN_SUMMA_NDS] := agCurrToStr(Data_SchedDeliver[idx][i].plan_summa_nds);
   cxGridTableView3.DataController.Values[i, IDX_COUNT] := agCurrToStr(Data_SchedDeliver[idx][i].deliver_count);
   cxGridTableView3.DataController.Values[i, IDX_PLAN_COUNT] := agCurrToStr(Data_SchedDeliver[idx][i].plan_count);
   cxGridTableView3.DataController.Values[i, IDX_ID_PRODUCT] := IntToStr(Data_SchedDeliver[idx][i].id_product);
   cxGridTableView3.DataController.Values[i, IDX_PRODUCT] := Data_SchedDeliver[idx][i].name_product;
   cxGridTableView3.DataController.Values[i, IDX_CAT_CUST] := Data_SchedDeliver[idx][i].name_cat_cust;
   cxGridTableView3.DataController.Values[i, IDX_VOL_PAY] := agCurrToStr(Data_SchedDeliver[idx][i].volume_pay);
   cxGridTableView3.DataController.Values[i, IDX_VOL_FULFIL] := agCurrToStr(Data_SchedDeliver[idx][i].volume_fulfil);
   cxGridTableView3.DataController.Values[i, IDX_ID_CAT_CUST] := IntToStr(Data_SchedDeliver[idx][i].id_cat_cust);
   cxGridTableView3.DataController.Values[i, IDX_ID_UNIT_MEAS] := Data_SchedDeliver[idx][i].id_unit_meas;
   cxGridTableView3.DataController.Values[i, IDX_ID_UNIT_MEAS_SUM] := Data_SchedDeliver[idx][i].id_unit_meas_sum;
   cxGridTableView3.DataController.Values[i, IDX_NAME_UNIT_MEAS] := Data_SchedDeliver[idx][i].name_unit_meas;
   cxGridTableView3.DataController.Values[i, IDX_NAME_UNIT_MEAS_SUM] := Data_SchedDeliver[idx][i].name_unit_meas_sum;
  end;
 end;

 if cxGridTableView3.DataController.RecordCount = 0 then begin
  EditButton2.Enabled := false;
  DelButton2.Enabled := false;
 end else begin
  cxGridTableView3.DataController.FocusedRecordIndex := 0;
  EditButton2.Enabled := True;
  DelButton2.Enabled := True;
 end;
 if cxGridTableView2.DataController.RecordCount = 0 then begin
  EditButton3.Enabled := false;
  DelButton3.Enabled := false;
 end else begin
  cxGridTableView2.DataController.FocusedRecordIndex := 0;
  EditButton3.Enabled := true;
  DelButton3.Enabled := true;
 end;

 if isViewRecord then begin
  OkButton2.Visible := false;
  MakeStagesButton.Enabled := false;
  AddButtonPeriods.Enabled := false;
  SplitButton.Enabled := false;
  RefreshCheck.Enabled := false;
  AddButton1.Enabled := false;
  AddButton2.Enabled := false;
  AddButton3.Enabled := false;
//  AddButton4.Enabled := false;
  EditButton1.Enabled := false;
  EditButton2.Enabled := false;
  EditButton3.Enabled := false;
//  EditButton4.Enabled := false;
  DelButton1.Enabled := false;
  DelButton2.Enabled := false;
  DelButton3.Enabled := false;
//  DelButton4.Enabled := false;
 end;
end;

procedure TFdt_contract_ADD.CalcSummary;
var
 i, j   : integer;
 count  : currency;
 pcount : currency;
 summa  : currency;
 psumma : currency;
 nds    : currency;
 pnds   : currency;
begin
 count  := 0;
 pcount := 0;
 summa  := 0;
 psumma := 0;
 nds    := 0;
 pnds   := 0;
 if Length(Data_SchedDeliver) <> 0 then
 for i := 0 to Length(Data_SchedDeliver) - 1 do if Length(Data_SchedDeliver[i]) <> 0 then for j := 0 to Length(Data_SchedDeliver[i]) - 1 do begin
   count  := count + Data_SchedDeliver[i][j].deliver_count;
  pcount := pcount + Data_SchedDeliver[i][j].plan_count;
  summa  := summa + Data_SchedDeliver[i][j].summa * Data_SchedDeliver[i][j].unit_meas_koef_sum;
  psumma := psumma + Data_SchedDeliver[i][j].plan_summa * Data_SchedDeliver[i][j].unit_meas_koef_sum;
  nds    := nds + Data_SchedDeliver[i][j].summa_nds * Data_SchedDeliver[i][j].unit_meas_koef_sum;
  pnds   := pnds + Data_SchedDeliver[i][j].plan_summa_nds * Data_SchedDeliver[i][j].unit_meas_koef_sum;
 end;
 CountEdit.Text := agCurrToStr(count);
 PCountEdit.Text := agCurrToStr(pcount);
 SumEdit.Text := agCurrToStr(summa);
 PSumEdit.Text := agCurrToStr(psumma);
end;

procedure TFdt_contract_ADD.AddRecord;
var
 id_type_contract : integer;
 linkto           : integer;
 date_reg         : TDateTime;
// id_department    : integer;
 date_beg         : TDateTime;
 date_end         : TDateTime;
 date_conclusion  : TDateTime;
 id_acc_suppl     : int64;
 id_acc_cust      : int64;
 reg_number       : string;
 reg_number_suppl : string;
 reg_number_cust  : string;
 id_men_suppl     : integer;
 id_men_cust      : integer;
 summa            : currency;
 summa_nds        : currency;
 summa_pay        : currency;
 summa_pay_nds    : currency;
 summa_fulfil     : currency;
 summa_fulfil_nds : currency;
 use_beg          : TDateTime;
 use_end          : TDateTime;
 vals             : array of Variant;
 r                : integer;
 i, j             : integer;
 id_stage         : int64;
 id               : integer;
 delta_beg, delta_end : integer;
// opt    : TSpravOptions;
// Result : TResultArray;
 period_count : integer;
 name_side1, name_side2 : string;
 SearchNode : TcxTreeListNode;
 stage_summa : currency;
 stage_summa_pay : currency;
 stage_summa_fulfil : currency;
 name_type_contract_short : string;
 crc_str, crc : string;
 asParent : Boolean;
 isWriteToDbf : Boolean;
begin
  isWriteToDbf  := False;
  period_count := 3;
  delta_beg    := 0;
  delta_end    := 0;
  name_side1   := 'Споживач';
  name_side2   := 'Постачальник';
  name_type_contract_short := 'ВЦВ';
 //--------------------------
 linkto := -1;

 id_type_contract := id_type_contract;
 period_count := period_count;
 delta_beg := delta_beg;
 delta_end := delta_end;
 CustGroupBox.Caption := name_side1;
 SupplGroupBox.Caption := name_side2;
 RSumLabel.Visible := false;
 RSumEdit.Visible := false;
 id_men_suppl := -1;
 id_men_cust := -1;
// id_department := -1;
// Caption := 'Добавить запись';
// OKButton.Caption := 'Додати у корень';
// if dxDBTreeList2.FocusedNode = NIL then OKButton2.Enabled := false;
 asParent := False;
 id_acc_cust := -1;
 linkto := -1;
 (*if asParent then begin
  if dxDBTreeList2.FocusedNode.Level = 0 then begin
   id_customer := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'ID_CUSTOMER').ItemIndex];
   CustomerEdit.Text := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'NAME_CUSTOMER').ItemIndex];
   SelectCustomerInfo(-1);
   Caption := 'Реєстрація договору - [' + CustomerEdit.Text + ']';
  end else begin
   id_acc_cust := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'ID_ACC_CUST').ItemIndex];
   SearchNode := dxDBTreeList2.FocusedNode.Parent;
   while SearchNode.Level <> 0 do SearchNode := SearchNode.Parent;
   id_customer := {dxDBTreeList2.FocusedNode.Parent.}SearchNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'ID_CUSTOMER').ItemIndex];
   CustomerEdit.Text := {dxDBTreeList2.FocusedNode.Parent.}SearchNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'NAME_CUSTOMER').ItemIndex];
   SelectCustomerInfo(id_acc_cust);
  end;
 end;*)
// if asParent then linkto := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('cxDBTreeList1' + 'ID_CONTRACT').ItemIndex] else linkto := -1;
// if nullLinkTo then linkto := -1;
{ if (dxDBTreeList2.FocusedNode = NIL) then linkto := NULL_VALUE else if dxDBTreeList2.FocusedNode.level = 0 then linkto := NULL_VALUE else begin
  if r = mrOK then linkto := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('LINKTO').index];
  if r = mrYes then linkto := dxDBTreeList2.FocusedNode.Values[dxDBTreeList2.ColumnByName('ID_CONTRACT').index];
 end;}



 id_type_contract := id_type_contract;
// id_contract      := GetMaxID;
// linkto           := -1;//!!!!!!!!!!!! WARNING REMOVE THIS!!!!!!
 date_reg         := date;
// id_department    := id_department;
 date_beg         := DateBegEdit.Date;
 date_end         := DateEndEdit.Date;
 date_conclusion  := DateConclusionEdit.Date;
 id_acc_suppl     := SupplDS['ID_RATE_ACCOUNT'];
 id_acc_cust      := CustDS['ID_RATE_ACCOUNT'];
// reg_number       := MakeRegNumber(dep_number, dep_number, name_type_contract_short);
 reg_number_suppl := RegNumberSupplEdit.Text;
 reg_number_cust  := RegNumberCustEdit.Text;
 id_men_suppl     := id_men_suppl;
 if CustMenDS.RecordCount <> 0 then id_men_cust := CustMenDS['ID_CUST_MEN'] else id_men_cust := -1;
 summa            := StrToCurr(SumEdit.Text);
 summa_nds        := StrToCurr(NDSEdit.Text);{ * SYS_NDS};
 summa_pay        := 0;
 summa_pay_nds    := 0;
 summa_fulfil     := 0;//StrToInt(SummaFulFilEdit.Text);
 summa_fulfil_nds := 0;//StrToInt(SummaFulFilNdsEdit.Text);
 use_beg          := now;
 use_end          := SYS_MAX_TIMESTAMP;

{ SetLength(Vals, 23);
 vals[0]  := id_type_contract;
 vals[1]  := id_contract;
 vals[2]  := linkto;
 vals[3]  := date_reg;
 vals[4]  := id_department;
 vals[5]  := date_beg;
 vals[6]  := date_end;
 vals[7]  := date_conclusion;
 vals[8]  := id_acc_suppl;
 vals[9]  := id_acc_cust;
 vals[10] := reg_number;
 vals[11] := reg_number_suppl;
 vals[12] := reg_number_cust;
 vals[13] := id_men_suppl;
 vals[14] := id_men_cust;
 vals[15] := summa;
 vals[16] := summa_nds;
 vals[17] := summa_pay;
 vals[18] := summa_pay_nds;
 vals[19] := summa_fulfil;
 vals[20] := summa_fulfil_nds;
 vals[21] := use_beg;
 vals[22] := use_end;}

{ StoredProc.Transaction := WTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, vals);
 StoredProc.Transaction.Commit;}

// StoredProc.Transaction := WTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
 StoredProc.Prepare;

 StoredProc.ParamByName('D_N_DOG').AsString := reg_number_suppl;
 StoredProc.ParamByName('D_D_DOG').AsDate := date_conclusion;
 StoredProc.ParamByName('D_SUMMA').AsCurrency := summa;
 StoredProc.ParamByName('D_DOG_NOTE').AsString := '';
 StoredProc.ParamByName('D_KRIT_DAT').AsVariant := null;
 StoredProc.ParamByName('D_NDS_SUM').AsCurrency := summa_nds;
 StoredProc.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := id_acc_cust;
 StoredProc.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := id_acc_suppl;
 StoredProc.ParamByName('D_ID_CUSTOMER').AsInt64 := id_customer;
 StoredProc.ParamByName('D_NAME_CUSTOMER').AsString := CustomerEdit.Text;
 if reg_number_cust = '' then reg_number_cust := '0';
 StoredProc.ParamByName('D_NOMN_DOG').AsString := reg_number_cust;
 StoredProc.ParamByName('D_NOMD_DOG').AsVariant := null;
 StoredProc.ParamByName('D_DATE_BEG').AsDate := date_beg;
 StoredProc.ParamByName('D_DATE_END').AsDate := date_end;
 StoredProc.ParamByName('D_NOT_SUMMA').AsInteger := 0;
 StoredProc.ParamByName('D_FIO_DONGU').AsString := MenSupplEdit.Text;
 StoredProc.ParamByName('D_FIO_POSTAV').AsString := MenCustEdit.Text;
 StoredProc.ParamByName('D_ID_TIP_DOG').AsInteger := TypeDog;
 StoredProc.ParamByName('D_CONTINUE').AsInteger := 0;
 StoredProc.ParamByName('D_CLOSE').AsInteger := 0;
 StoredProc.ParamByName('D_KOD_DOG').AsInteger := 0;
 StoredProc.ParamByName('D_SUM_FULFIL').AsInteger := 0;
 StoredProc.ParamByName('D_SUM_OPL').AsInteger := 0;
 StoredProc.ParamByName('D_SUM_PAY').AsInteger := 0;
 StoredProc.ParamByName('D_NDS_PAY').AsInteger := 0;
 StoredProc.ParamByName('D_ID_MAN').AsVariant := null;
 StoredProc.ParamByName('D_ID_USER').AsInteger  := SYS_ID_USER;
 StoredProc.ParamByName('D_IP_COMP').AsString := GetIPAddress;
 StoredProc.ParamByName('D_NAME_COMP').AsString := GetCompName;
 StoredProc.ParamByName('D_ID_MAN_SUPPL').AsInteger  := id_men_suppl;
 StoredProc.ParamByName('D_ID_MAN_CUST').AsInteger  := id_men_cust;
 StoredProc.ParamByName('D_ID_OTDEL').AsInt64  := id_otdel;
 StoredProc.ParamByName('D_IS_PROJECT').AsInteger  := 0;
 StoredProc.ParamByName('D_COMMENT').AsString := '';

(* StoredProc.ExecProcedure('DOG_DT_DOCUMENT_INSERT', [
   reg_number_suppl, date_conclusion, summa, '', null, summa_nds,
   id_acc_cust, id_acc_suppl, id_customer, CustomerEdit.Text,
   id_men_cust, null, date_beg, date_end, 0, MenSupplEdit.Text,
   MenCustEdit.Text, TypeDog, 0, 0, 0, 0,
   0, 0, 0, null, SYS_ID_USER, GetIPAddress, GetCompName, id_men_suppl, id_men_cust, id_department, 0, '']);
   new_id_dog := StoredProc['VIX_ID_DOG'].AsInt64;*)
 StoredProc.ExecProc;
 new_id_dog := StoredProc['VIX_ID_DOG'].AsInt64;
// ShowMessage(IntToStr(new_id_dog));
 StoredProc.Transaction.Commit;
 StoredProc.Close;

 //Запись периодов договора
 if cxGridTableView1.DataController.RecordCount <> 0 then for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  GetNewPrimaryKey(StoredProc, 'DT_CONTRACT_STAGE', id_stage);
  StoredProc.Close;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PROC_DT_CONTRACT_STAGE_ADD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
  StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
  StoredProc.ParamByName('DATE_BEG').AsDate := cxGridTableView1.DataController.Values[i, 0];
  StoredProc.ParamByName('DATE_END').AsDate := cxGridTableView1.DataController.Values[i, 1];
  StoredProc.ParamByName('USE_BEG').AsDate := now;
  StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  StoredProc.Close;

  stage_summa := 0;
  stage_summa_fulfil := 0;
  stage_summa_pay := 0;
  if Length(Data_SchedDeliver[id]) <> 0 then for j := 0 to Length(Data_SchedDeliver[id]) - 1 do begin
   stage_summa := stage_summa + Data_SchedDeliver[id][j].summa;
   stage_summa_pay := stage_summa_pay + Data_SchedDeliver[id][j].volume_pay;
   stage_summa_fulfil := stage_summa_fulfil + Data_SchedDeliver[id][j].volume_fulfil;
  end;

  //---------Запись в DBF
  crc_str := IntToStr(new_id_dog) +
             IntToStr(id_stage) +
             DateToStr(cxGridTableView1.DataController.Values[i, 0]) +
             DateToStr(cxGridTableView1.DataController.Values[i, 1]) +
             agCurrToStr(stage_summa) +
             agCurrToStr(stage_summa_pay) +
             agCurrToStr(stage_summa_fulfil);
//  crc := CRCToString(CalculateCRC32(crc_str));

  if  isWriteToDbf then
  begin
    HalcyonDataSet2.TableName := 'STAGE_DG';
    HalcyonDataSet2.Open;
    HalcyonDataSet2.InsertRecord([
    {ID_CONTR}new_id_dog,
    {ID_STAGE}id_stage,
    {STAGE_BEG}cxGridTableView1.DataController.Values[i, 0],
    {STAGE_END}cxGridTableView1.DataController.Values[i, 1],
    {SUMMA}stage_summa,
    {SUM_PAY}stage_summa_pay,
    {SUM_FULFIL}stage_summa_fulfil,
    {CRC32}crc,
    {SYSTEM_F}SYSTEM_F
    ]);
    HalcyonDataSet2.Close;
  end;
  //--------Конец записи в DBF

  //Запись периодов оплаты
  id := StrToInt(cxGridTableView1.DataController.Values[i, 2]);
  if Length(Data_ContractPay[id]) <>0 then for j := 0 to Length(Data_ContractPay[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'PROC_DT_CONTRACT_PAY_ADD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
   StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
   StoredProc.ParamByName('SUMMA').AsCurrency := Data_ContractPay[id][j].summa;
   StoredProc.ParamByName('SUMMA_NDS').AsCurrency := Data_ContractPay[id][j].summa_nds;
   StoredProc.ParamByName('DATE_BEG').AsDATE := Data_ContractPay[id][j].date_beg;
   StoredProc.ParamByName('DATE_END').AsDate := data_ContractPay[id][j].date_end;
   StoredProc.ParamByName('PAY_BEG').AsDate := Data_ContractPay[id][j].pay_beg;
   StoredProc.ParamByName('PAY_END').AsDate := Data_ContractPay[id][j].pay_end;
   StoredProc.ParamByName('USE_BEG').AsDate := now;
   StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
  end;
  //SchedDeliver
  if Length(Data_SchedDeliver[id]) <> 0 then for j := 0 to Length(Data_SchedDeliver[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'PROC_DT_SCHED_DELIVER_ADD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
   StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
   StoredProc.ParamByName('ID_PRODUCT').AsInteger := Data_SchedDeliver[id][j].id_product;
   StoredProc.ParamByName('COST').AsCurrency := Data_SchedDeliver[id][j].cost;
   StoredProc.ParamByName('SUMMA').AsCurrency := Data_SchedDeliver[id][j].summa;
   StoredProc.ParamByName('SUMMA_NDS').AsCurrency := Data_SchedDeliver[id][j].summa_nds;
   StoredProc.ParamByName('DELIVER_COUNT').AsCurrency := Data_SchedDeliver[id][j].deliver_count;
   StoredProc.ParamByName('USE_BEG').AsDate := now;
   StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
   StoredProc.ParamByName('SUMMA_PAY').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_FULFIL').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_PAY_NDS').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_FULFIL_NDS').AsCurrency := 0;
   StoredProc.ParamByName('PLAN_COUNT').AsCurrency := Data_SchedDeliver[id][j].plan_count;
   StoredProc.ParamByName('VOLUME_PAY').AsCurrency := Data_SchedDeliver[id][j].volume_pay;
   StoredProc.ParamByName('VOLUME_FULFIL').AsCurrency := Data_SchedDeliver[id][j].volume_fulfil;
   StoredProc.ParamByName('ID_CAT_CUST').AsInteger := Data_SchedDeliver[id][j].id_cat_cust;
   StoredProc.ParamByName('PLAN_SUMMA').AsCurrency := Data_SchedDeliver[id][j].plan_summa;
   StoredProc.ParamByName('PLAN_SUMMA_NDS').AsCurrency := Data_SchedDeliver[id][j].plan_summa_nds;
   StoredProc.ParamByName('ID_OBJECT').AsInteger := Data_SchedDeliver[id][j].id_point;
   StoredProc.ParamByName('ID_UNIT_MEAS').AsInteger := Data_SchedDeliver[id][j].id_unit_meas;
   StoredProc.ParamByName('ID_UNIT_MEAS_SUM').AsInteger := Data_SchedDeliver[id][j].id_unit_meas_sum;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
  end;
 end;
 //Точки подключения
{ if cxGrid1TableView4.DataController.RecordCount <> 0 then
 for i := 0 to cxGrid1TableView4.DataController.RecordCount - 1 do begin
  StoredProc.Transaction := WTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_CONTRACT_POINT_ADD', [id_contract, cxGrid1TableView4.DataController.Values[i, 3], cxGrid1TableView4.DataController.Values[i, 0], cxGrid1TableView4.DataController.Values[i, 1], now, SYS_MAX_TIMESTAMP, cxGrid1TableView4.DataController.Values[i, 4], cxGrid1TableView4.DataController.Values[i, 5]]);
  StoredProc.Transaction.Commit;
 end;}

// Sprav.Free;

// SavedCustomerID := id_customer;
// SavedContractID := id_contract;

  //---------Запись в DBF
  crc_str := IntToStr(id_type_contract) +
             IntToStr(new_id_dog) +
             reg_number +
             reg_number_suppl +
             DateToStr(date_conclusion) +
             IntToStr(id_department) +
             DateToStr(date_beg) +
             DateToStr(date_end) +
             IntToStr(id_customer) +
             DateToStr(use_end) +
             agCurrToStr(summa) +
             agCurrToStr(summa_pay) +
             agCurrToStr(summa_fulfil);
//  crc := CRCToString(CalculateCRC32(crc_str));
  if isWriteToDbf then
  begin
    HalcyonDataSet1.TableName := 'ACTV_DOG';
    HalcyonDataSet1.Open;
    HalcyonDataSet1.InsertRecord([
    {ID_TP_CNTR}id_type_contract,
    {ID_CONTR}new_id_dog,
    {REG_NUMB}reg_number,
    {REG_NUMB_S}reg_number_suppl,
    {DATE_CONCL}date_conclusion,
    {ID_DEP}id_department,
    {DATE_BEG}date_beg,
    {DATE_END}date_end,
    {ID_CUST}id_customer,
    {USE_END}use_end,
    {SUMMA}summa,
    {SUM_PAY}summa_pay,
    {SUM_FULFIL}summa_fulfil,
    {CRC32}crc,
    {SYSTEM_F}SYSTEM_F
    ]);
    HalcyonDataSet1.Close;
   end;
  //--------Конец записи в DBF
// SelectAll;
// FindContract(SavedCustomerID, SavedContractID);

end;

{function RemoveZeros(s : string) : string;
var
 i : integer;
 bz : boolean;
begin
 Result := '';
 bz := false;
 for i := 1 to Length(s) do
 begin
   if not bz then Result := Result + s[i] else if s[i] <>
   if s[i] = '.' then bz := true;
 end;
end;  }

procedure TFdt_contract_ADD.LoadInfo;
var
 StageExists : boolean;
 Row : integer;
 i, j, id : integer;
begin
 DogInfoDS.Close;
 DogInfoDS.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_GET_INFO(' + IntToStr(in_id_dog) + ', ' + IntToStr(in_id_dog) + ')';
 DogInfoDS.Open;
 summa_pay := DogInfoDS['SUM_PAY'];
 //Select contract stages
 StageExists := false;
 Query.Close;
 Query.Sql.Text := 'select * from PROC_DT_CONTRACT_STAGE_SEL(' + IntToStr(in_id_dog) + ', ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then begin
  StageExists := true;
  cxGridTableView1.DataController.RecordCount := 0;
  while not Query.Eof do begin
   cxGridTableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount + 1;
   Row := cxGridTableView1.DataController.RecordCount - 1;
   cxGridTableView1.DataController.Values[Row, 0] := Query['DATE_BEG'].AsDate;
   cxGridTableView1.DataController.Values[Row, 1] := Query['DATE_END'].AsDate;
   cxGridTableView1.DataController.Values[Row, 2] := Query['ID_STAGE'].AsString;
   Query.Next;
//   if not Query.eof then StringGrid1.RowCount := StringGrid1.RowCount + 1;
  end;
  SetLength(Data_SchedDeliver, cxGridTableView1.DataController.RecordCount);
  SetLength(Data_ContractPay, cxGridTableView1.DataController.RecordCount);
 end;
 Query.Close;
 if cxGridTableView1.DataController.RecordCount <> 0 then begin
//  first1 := false;
  EditButton1.Enabled := true;
  DelButton1.Enabled := true;
 end else begin
//  first1 := true;
  EditButton1.Enabled := false;
  DelButton1.Enabled := false;
 end;

 //Select dt_shced_deliver
 if StageExists then for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  Query.Close;
  Query.Sql.Text := 'select * from PROC_DT_SCHED_DELIVER_SEL(' + IntToStr(in_id_dog) + ', ' + cxGridTableView1.DataController.Values[i, 2] + ', ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''', 1)';
  Query.ExecQuery;
  if Query.RecordCount <> 0 then begin
   while not Query.Eof do begin
    SetLength(Data_SchedDeliver[i], Length(Data_SchedDeliver[i]) + 1);
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].cost := Query['COST'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].summa := Query['SUMMA'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].summa_nds := Query['SUMMA_NDS'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].plan_summa := Query['PLAN_SUMMA'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].plan_summa_nds := Query['PLAN_SUMMA_NDS'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].deliver_count := Query['DELIVER_COUNT'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].name_product := Query['NAME_PRODUCT'].AsString;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].name_cat_cust := Query['NAME_CAT_CUST'].AsString;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].id_product := Query['ID_PRODUCT'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].id_cat_cust := Query['ID_CAT_CUST'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].plan_count := Query['PLAN_COUNT'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].volume_pay := Query['VOLUME_PAY'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].volume_fulfil := Query['VOLUME_FULFIL'].AsCurrency;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].name_unit_meas := Query['NAME_UNIT_MEAS'].AsString;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].id_unit_meas := Query['ID_UNIT_MEAS'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].name_unit_meas_sum := Query['NAME_UNIT_MEAS_SUM'].AsString;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].id_unit_meas_sum := Query['ID_UNIT_MEAS_SUM'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].unit_meas_koef := Query['COEF'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].unit_meas_koef_sum := Query['COEF_SUM'].AsInteger;

    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].id_point := Query['ID_OBJECT'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].name_point := Query['NAME_OBJECT'].asString;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].cnt_prod := Query['COST_COUNT'].AsInteger;
    Data_SchedDeliver[i][Length(Data_SchedDeliver[i]) - 1].str_cost := Query['STR_COST'].AsString;
    Query.Next;
   end;
   EditButton3.Enabled := true;
   DelButton3.Enabled := true;
  end;
 end;

 //Select Contract pay periods
 if StageExists then for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  Query.Close;
  Query.Sql.Text := 'select * from PROC_DT_CONTRACT_PAY_SEL(' + IntToStr(in_id_dog) + ', ' + cxGridTableView1.DataController.Values[i, 2] + ', ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')';
  Query.ExecQuery;
  cxGridTableView1.DataController.Values[i, 2] := IntToStr(i);
  if Query.RecordCount <> 0 then begin
   while not Query.Eof do begin
    SetLength(Data_ContractPay[i], Length(Data_ContractPay[i]) + 1);
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].date_beg := Query['DATE_BEG'].AsDate;
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].date_end := Query['DATE_END'].AsDate;
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].pay_beg := Query['PAY_BEG'].AsDate;
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].pay_end := Query['PAY_END'].AsDate;
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].summa := Query['SUMMA'].AsCurrency;
    Data_ContractPay[i][Length(Data_ContractPay[i]) - 1].summa_nds := Query['SUMMA_NDS'].AsCurrency;
    Query.Next;
   end;
   EditButton2.Enabled := true;
   DelButton2.Enabled := true;
  end;
 end;
// StringGrid1Click(StringGrid1);


// RSumEdit.Text := agCurrToStr(rsum_Summa_Pay);

 id_customer := DogInfoDS['ID_CUSTOMER'];
 id_type_contract := TypeDog;
 id_men_suppl := DogInfoDS['ID_MAN_SUPPL'];
 SelectCustomerInfo(-1);
 id_department := DogInfoDS['ID_DEPARTMENT'];

// ShowMessage('loadinfo');
 SelectDepartmentInfo(DogInfoDS['ID_RATE_ACC_NATIVE']);
 if SupplDS.RecordCount <> 0 then begin
  SupplDS.Locate('ID_RATE_ACCOUNT', DogInfoDS['ID_RATE_ACC_NATIVE'], [loCaseInsensitive]);
  AccSupplEdit.Text := SupplDS['RATE_ACCOUNT'];
  id_acc_suppl := SupplDS['ID_RATE_ACCOUNT'];
 end;
 if CustDS.RecordCount <> 0 then begin
  CustDS.Locate('ID_RATE_ACCOUNT', DogInfoDS['ID_RATE_ACCOUNT'], [loCaseInsensitive]);
  AccCustEdit.Text := CustDS['RATE_ACCOUNT'];
  id_acc_cust := CustDS['ID_RATE_ACCOUNT'];
 end;
 if CustMenDS.RecordCount <> 0 then begin
  CustMenDS.Locate('ID_CUST_MEN', DogInfoDS['ID_MAN_CUST'], [loCaseInsensitive]);
  MenCustEdit.Text := CustMenDS['FIO'];
  id_men_cust := CustMenDS['ID_CUST_MEN'];
 end;

 id_otdel := IfNull(DogInfoDS['ID_OTDEL'], -1);

  Query.Close;
  Query.Sql.Text := 'select NAME_FULL from SP_DEPARTMENT WHERE ID_DEPARTMENT = ' + IntToStr(id_otdel) + ' and use_end > ''01.01.2050''';
  Query.ExecQuery;
  cxButtonEdit_otd.Text := Query.FieldByName('NAME_FULL').AsString;
  Query.Close;

 CustomerEdit.Text := IfNull(DogInfoDS['NAME_CUSTOMER'], '');
 DateBegEdit.Text := IfNull(DogInfoDS['DATE_BEG'], '');
 DateEndEdit.Text := IfNull(DogInfoDS['DATE_END'], '');
 DateConclusionEdit.Date := IfNull(DogInfoDS['D_DOG'], '');
 RegNumberSupplEdit.Text := IfNull(DogInfoDS['N_DOG'], '');
 RegNumberCustEdit.Text := IfNull(DogInfoDS['NOMN_DOG'], '');
//!!!!!!!!! RegNumberCustEdit.Text := DogInfoDS[''];
 DepartmentEdit.Text := IfNull(DogInfoDS['NAME_DEPARTMENT'], '');
 MenSupplEdit.Text := IfNull(DogInfoDS['FIO_DONGU'], '');
 Caption := 'Змінити договір - [' + CustomerEdit.Text + ']';
 OKButton2.Caption := 'Змінити';
 id_type_contract := IfNull(DogInfoDS['ID_TIP_DOG'], '');
 DateBegEdit.Date := IfNull(DogInfoDS['DATE_BEG'], '');
 DateEndEdit.Date := IfNull(DogInfoDS['DATE_END'], '');
 DateConclusionEdit.Date := IfNull(DogInfoDS['D_DOG'], '');
 id_department := IfNull(DogInfoDS['ID_DEPARTMENT'], '');
 id_acc_suppl := IfNull(DogInfoDS['ID_RATE_ACC_NATIVE'], '');
 id_acc_cust := IfNull(DogInfoDS['ID_RATE_ACCOUNT'], '');
 RegNumberEdit.Text := IfNull(DogInfoDS['REGEST_NUM'], '');
// RegNumberSupplEdit.Text := IfNull(DogInfoDS[''], '');
// RegNumberCustEdit.Text := DogInfoDS['REG_NUMBER_CUST'];
 id_men_suppl := IfNull(DogInfoDS['ID_MAN_SUPPL'], '');
 id_men_cust := IfNull(DogInfoDS['ID_MaN_CUST'], '');
 summaEdit.Text := IfNull(DogInfoDS['SUMMA'], '');
 summaNdsEdit.Text := IfNull(DogInfoDS['NDS_SUM'], '');
 summaPayEdit.Text := IfNull(DogInfoDS['SUM_PAY'], '');
 summaPayNdsEdit.Text := IfNull(DogInfoDS['NDS_PAY'], '');

 if pr_vizova = 'prosmotr' then begin
  Caption := 'Перегляд договору - [' + CustomerEdit.Text + ']';
  DateConclusionEdit.Properties.ReadOnly := true;
  DateBegEdit.Properties.ReadOnly := true;
  DateEndEdit.Properties.ReadOnly := true;
  CustomerEdit.Properties.ReadOnly := true;
  CustomerEdit.Properties.OnButtonClick := Nil;
  RegNumberCustEdit.Properties.ReadOnly := true;
  AccCustEdit.Properties.ReadOnly := true;
  AccCustEdit.Properties.PopupControl := Nil;
  MenCustEdit.Properties.ReadOnly := true;
  MenCustEdit.Properties.PopupControl := Nil;
  DepartmentEdit.Properties.ReadOnly := true;
  DepartmentEdit.Properties.OnButtonClick := Nil;
  RegNumberSupplEdit.Properties.ReadOnly := true;
  AccSupplEdit.Properties.ReadOnly := true;
  AccSupplEdit.Properties.PopupControl := Nil;
  MenSupplEdit.Properties.ReadOnly := true;
  MenSupplEdit.Properties.OnButtonClick := Nil;
 end;
 DogInfoDS.Close;
 CalcSummary;
end;

procedure TFdt_contract_ADD.ModRecord;
var
 node, par : TcxTreeListNode;
 linkto : integer;
 date_reg : TDate;
 vals : array of variant;
 i, j, id : integer;
 id_stage : int64;
 rsum_Summa_Pay : currency;
// SearchNode : TcxTreeListNode;
// id_customer : integer;
// row : integer;
 stage_summa : currency;
 stage_summa_fulfil : Currency;
 stage_summa_pay : Currency;
 crc_str : string;
 crc : string;
 isWriteToDbf : Boolean;
begin
 isWriteToDbf := False;
 if CustMenDS.RecordCount <> 0 then id_men_cust := CustMenDS['ID_CUST_MEN'] else id_men_cust := -1;
 id_acc_suppl     := SupplDS['ID_RATE_ACCOUNT'];
 id_acc_cust      := CustDS['ID_RATE_ACCOUNT'];
 summa            := StrToCurr(SumEdit.Text);
 summa_nds        := StrToCurr(NDSEdit.Text);
 summa_pay        := 0;

 {vals[0]  := id_type_contract;
 vals[1]  := id_contract;
 vals[2]  := linkto;
 vals[3]  := date_reg;
 vals[4]  := id_department;
 vals[5]  := date_beg;
 vals[6]  := date_end;
 vals[7]  := date_conclusion;
 vals[8]  := id_acc_suppl;
 vals[9]  := id_acc_cust;
 vals[10] := reg_number;
 vals[11] := reg_number_suppl;
 vals[12] := reg_number_cust;
 vals[13] := id_men_suppl;
 vals[14] := id_men_cust;
 vals[15] := summa;
 vals[16] := summa_nds;
 vals[17] := summa_pay;
 vals[18] := summa_pay_nds;
 vals[19] := summa_fulfil;
 vals[20] := summa_fulfil_nds;
 vals[21] := use_beg;
 vals[22] := use_end;   }
 new_id_dog := in_id_dog;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
 StoredProc.Prepare;
 StoredProc.ParamByName('D_DATE_BEG').AsDate := StrToDate(DateBegEdit.Text);
 StoredProc.ParamByName('D_ID_DOG').AsInt64 := in_id_dog;
 StoredProc.ParamByName('D_N_DOG').AsString := RegNumberSupplEdit.Text;
 StoredProc.ParamByName('D_D_DOG').AsDate := StrToDate(DateConclusionEdit.Text);
 StoredProc.ParamByName('D_SUMMA').AsCurrency := summa;
 StoredProc.ParamByName('D_DOG_NOTE').AsString := '';
 StoredProc.ParamByName('D_KRIT_DATE').AsVariant := null;
 StoredProc.ParamByName('D_NDS_SUM').AsCurrency := summa_nds;
 StoredProc.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := id_acc_cust;
 StoredProc.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := id_acc_suppl;
 StoredProc.ParamByName('D_ID_CUSTOMER').AsInt64 := id_customer;
 StoredProc.ParamByName('D_NAME_CUSTOMER').AsString := CustomerEdit.Text;
 StoredProc.ParamByName('D_FIO_DONGU').AsString := MenSupplEdit.Text;
 StoredProc.ParamByName('D_DATE_END').AsDate := StrToDate(DateEndEdit.Text);
 StoredProc.ParamByName('D_FIO_POSTAV').AsString := MenCustEdit.Text;
 if RegNumberCustEdit.Text = '' then RegNumberCustEdit.Text := '0'; 
 StoredProc.ParamByName('D_NOMN_DOG').AsString := RegNumberCustEdit.Text;
 StoredProc.ParamByName('D_NOMD_DOG').AsVariant := null;
 StoredProc.ParamByName('D_CONTINUE').AsInteger := 0;
 StoredProc.ParamByName('D_NOT_SUMMA').AsInteger := 0;
 StoredProc.ParamByName('D_SUM_OPL').AsCurrency := summa_pay;
 StoredProc.ParamByName('D_ID_MAN').AsVariant := null;
 StoredProc.ParamByName('D_ID_USER').AsInteger := SYS_ID_USER;
 StoredProc.ParamByName('D_IP_COMP').AsString := GetIPAddress;
 StoredProc.ParamByName('D_NAME_COMP').AsString := GetCompName;
 StoredProc.ParamByName('D_ID_MAN_SUPPL').AsInteger := id_men_suppl;
 StoredProc.ParamByName('D_ID_MAN_CUST').AsInteger := id_men_cust;
 StoredProc.ParamByName('D_ID_OTDEL').AsInteger := id_otdel;
 StoredProc.ParamByName('D_IS_PROJECT').AsInteger := 0;
 StoredProc.ParamByName('D_COMMENT').AsString := '';


 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;

 //Закрытие старых данных
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PROC_DT_CONTRACT_PAY_CLOSE';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CONTRACT').AsInt64 := in_id_dog;
 StoredProc.ParamByName('MAX_TIMESTAMP').AsDateTime := SYS_MAX_TIMESTAMP;
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PROC_DT_SCHED_DELIVER_CLOSE';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CONTRACT').AsInt64 := in_id_dog;
 StoredProc.ParamByName('MAX_TIMESTAMP').AsDateTime := SYS_MAX_TIMESTAMP;
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PROC_DT_CONTRACT_STAGE_CLOSE';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CONTRACT').AsInt64 := in_id_dog;
 StoredProc.ParamByName('MAX_TIMESTAMP').AsDateTime := SYS_MAX_TIMESTAMP;
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;

 //Запись периодов договора
 if cxGridTableView1.DataController.RecordCount <> 0 then for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  GetNewPrimaryKey(StoredProc, 'DT_CONTRACT_STAGE', id_stage);
  StoredProc.Close;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PROC_DT_CONTRACT_STAGE_ADD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
  StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
  StoredProc.ParamByName('DATE_BEG').AsDate := cxGridTableView1.DataController.Values[i, 0];
  StoredProc.ParamByName('DATE_END').AsDate := cxGridTableView1.DataController.Values[i, 1];
  StoredProc.ParamByName('USE_BEG').AsDate := now;
  StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  StoredProc.Close;

  stage_summa := 0;
  stage_summa_fulfil := 0;
  stage_summa_pay := 0;
  if Length(Data_SchedDeliver[id]) <> 0 then for j := 0 to Length(Data_SchedDeliver[id]) - 1 do begin
   stage_summa := stage_summa + Data_SchedDeliver[id][j].summa;
   stage_summa_pay := stage_summa_pay + Data_SchedDeliver[id][j].volume_pay;
   stage_summa_fulfil := stage_summa_fulfil + Data_SchedDeliver[id][j].volume_fulfil;
  end;

  //---------Запись в DBF
  crc_str := IntToStr(new_id_dog) +
             IntToStr(id_stage) +
             DateToStr(cxGridTableView1.DataController.Values[i, 0]) +
             DateToStr(cxGridTableView1.DataController.Values[i, 1]) +
             agCurrToStr(stage_summa) +
             agCurrToStr(stage_summa_pay) +
             agCurrToStr(stage_summa_fulfil);
//  crc := CRCToString(CalculateCRC32(crc_str));

  if  isWriteToDbf then
  begin
    HalcyonDataSet2.TableName := 'STAGE_DG';
    HalcyonDataSet2.Open;
    HalcyonDataSet2.InsertRecord([
    {ID_CONTR}new_id_dog,
    {ID_STAGE}id_stage,
    {STAGE_BEG}cxGridTableView1.DataController.Values[i, 0],
    {STAGE_END}cxGridTableView1.DataController.Values[i, 1],
    {SUMMA}stage_summa,
    {SUM_PAY}stage_summa_pay,
    {SUM_FULFIL}stage_summa_fulfil,
    {CRC32}crc,
    {SYSTEM_F}SYSTEM_F
    ]);
    HalcyonDataSet2.Close;
  end;
  //--------Конец записи в DBF

  //Запись периодов оплаты
  id := StrToInt(cxGridTableView1.DataController.Values[i, 2]);
  if Length(Data_ContractPay[id]) <>0 then for j := 0 to Length(Data_ContractPay[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'PROC_DT_CONTRACT_PAY_ADD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
   StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
   StoredProc.ParamByName('SUMMA').AsCurrency := Data_ContractPay[id][j].summa;
   StoredProc.ParamByName('SUMMA_NDS').AsCurrency := Data_ContractPay[id][j].summa_nds;
   StoredProc.ParamByName('DATE_BEG').AsDATE := Data_ContractPay[id][j].date_beg;
   StoredProc.ParamByName('DATE_END').AsDate := data_ContractPay[id][j].date_end;
   StoredProc.ParamByName('PAY_BEG').AsDate := Data_ContractPay[id][j].pay_beg;
   StoredProc.ParamByName('PAY_END').AsDate := Data_ContractPay[id][j].pay_end;
   StoredProc.ParamByName('USE_BEG').AsDate := now;
   StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
  end;
  //SchedDeliver
  if Length(Data_SchedDeliver[id]) <> 0 then for j := 0 to Length(Data_SchedDeliver[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'PROC_DT_SCHED_DELIVER_ADD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_CONTRACT').AsInt64 := new_id_dog;
   StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
   StoredProc.ParamByName('ID_PRODUCT').AsInteger := Data_SchedDeliver[id][j].id_product;
   StoredProc.ParamByName('COST').AsCurrency := Data_SchedDeliver[id][j].cost;
   StoredProc.ParamByName('SUMMA').AsCurrency := Data_SchedDeliver[id][j].summa;
   StoredProc.ParamByName('SUMMA_NDS').AsCurrency := Data_SchedDeliver[id][j].summa_nds;
   StoredProc.ParamByName('DELIVER_COUNT').AsCurrency := Data_SchedDeliver[id][j].deliver_count;
   StoredProc.ParamByName('USE_BEG').AsDate := now;
   StoredProc.ParamByName('USE_END').AsDate := SYS_MAX_TIMESTAMP;
   StoredProc.ParamByName('SUMMA_PAY').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_FULFIL').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_PAY_NDS').AsCurrency := 0;
   StoredProc.ParamByName('SUMMA_FULFIL_NDS').AsCurrency := 0;
   StoredProc.ParamByName('PLAN_COUNT').AsCurrency := Data_SchedDeliver[id][j].plan_count;
   StoredProc.ParamByName('VOLUME_PAY').AsCurrency := Data_SchedDeliver[id][j].volume_pay;
   StoredProc.ParamByName('VOLUME_FULFIL').AsCurrency := Data_SchedDeliver[id][j].volume_fulfil;
   StoredProc.ParamByName('ID_CAT_CUST').AsInteger := Data_SchedDeliver[id][j].id_cat_cust;
   StoredProc.ParamByName('PLAN_SUMMA').AsCurrency := Data_SchedDeliver[id][j].plan_summa;
   StoredProc.ParamByName('PLAN_SUMMA_NDS').AsCurrency := Data_SchedDeliver[id][j].plan_summa_nds;
   StoredProc.ParamByName('ID_OBJECT').AsInteger := Data_SchedDeliver[id][j].id_point;
   StoredProc.ParamByName('ID_UNIT_MEAS').AsInteger := Data_SchedDeliver[id][j].id_unit_meas;
   StoredProc.ParamByName('ID_UNIT_MEAS_SUM').AsInteger := Data_SchedDeliver[id][j].id_unit_meas_sum;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
  end;
 end;
 //Точки подключения
{ if cxGrid1TableView4.DataController.RecordCount <> 0 then
 for i := 0 to cxGrid1TableView4.DataController.RecordCount - 1 do begin
  StoredProc.Transaction := WTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_CONTRACT_POINT_ADD', [id_contract, cxGrid1TableView4.DataController.Values[i, 3], cxGrid1TableView4.DataController.Values[i, 0], cxGrid1TableView4.DataController.Values[i, 1], now, SYS_MAX_TIMESTAMP, cxGrid1TableView4.DataController.Values[i, 4], cxGrid1TableView4.DataController.Values[i, 5]]);
  StoredProc.Transaction.Commit;
 end;}

// Sprav.Free;

// SavedCustomerID := id_customer;
// SavedContractID := id_contract;

  //---------Запись в DBF
{  crc_str := IntToStr(id_type_contract) +
             IntToStr(new_id_dog) +
             reg_number +
             reg_number_suppl +
             DateToStr(date_conclusion) +
             IntToStr(id_department) +
             DateToStr(date_beg) +
             DateToStr(date_end) +
             IntToStr(id_customer) +
             DateToStr(use_end) +
             agCurrToStr(summa) +
             agCurrToStr(summa_pay) +
             agCurrToStr(summa_fulfil);
  crc := CRCToString(CalculateCRC32(crc_str));}
  if isWriteToDbf then
  begin
(*    HalcyonDataSet1.TableName := 'ACTV_DOG';
    HalcyonDataSet1.Open;
    HalcyonDataSet1.InsertRecord([
    {ID_TP_CNTR}id_type_contract,
    {ID_CONTR}new_id_dog,
    {REG_NUMB}reg_number,
    {REG_NUMB_S}reg_number_suppl,
    {DATE_CONCL}date_conclusion,
    {ID_DEP}id_department,
    {DATE_BEG}date_beg,
    {DATE_END}date_end,
    {ID_CUST}id_customer,
    {USE_END}use_end,
    {SUMMA}summa,
    {SUM_PAY}summa_pay,
    {SUM_FULFIL}summa_fulfil,
    {CRC32}crc,
    {SYSTEM_F}SYSTEM_F
    ]);
    HalcyonDataSet1.Close;*)
   end;
  //--------Конец записи в DBF
// SelectAll;
// FindContract(SavedCustomerID, SavedContractID);


 { StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_DT_CONTRACT_POINT_CLOSE', [in_id_dog, SYS_MAX_TIMESTAMP]);
 StoredProc.Transaction.Commit;}

 //Запись периодов договора
(* if (cxGridTableView1.DataController.RecordCount <> 0) then for i := 0 to cxGridTableView1.DataController.RecordCount - 1 do begin
  GetNewPrimaryKey(StoredProc, 'DT_CONTRACT_STAGE', id_stage);
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_CONTRACT_STAGE_ADD', [in_id_dog, id_stage, cxGridTableView1.DataController.Values[i, 0], cxGridTableView1.DataController.Values[i, 1], now, SYS_MAX_TIMESTAMP]);
  StoredProc.Transaction.Commit;
  //Запись периодов оплаты
  id := StrToInt(cxGridTableView1.DataController.Values[i, 2]);
  if Length(Data_ContractPay[id]) <>0 then for j := 0 to Length(Data_ContractPay[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PROC_DT_CONTRACT_PAY_ADD', [in_id_dog, id_stage, Data_ContractPay[id][j].summa, Data_ContractPay[id][j].summa_nds,
     Data_ContractPay[id][j].date_beg, Data_ContractPay[id][j].date_end,
     Data_ContractPay[id][j].pay_beg, Data_ContractPay[id][j].pay_end,
     now, SYS_MAX_TIMESTAMP]);
   StoredProc.Transaction.Commit;
  end;
  //SchedDeliver
  if Length(Data_SchedDeliver[id]) <> 0 then for j := 0 to Length(Data_SchedDeliver[id]) - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PROC_DT_SCHED_DELIVER_ADD', [in_id_dog, id_stage, Data_SchedDeliver[id][j].id_product,
     Data_SchedDeliver[id][j].cost, Data_SchedDeliver[id][j].summa,
     Data_SchedDeliver[id][j].summa_nds, Data_SchedDeliver[id][j].deliver_count,
     now, SYS_MAX_TIMESTAMP, 0, 0, 0, 0, Data_SchedDeliver[id][j].plan_count,
     Data_SchedDeliver[id][j].volume_pay, Data_SchedDeliver[id][j].volume_fulfil,
     Data_SchedDeliver[id][j].id_cat_cust, Data_SchedDeliver[id][j].plan_summa, Data_SchedDeliver[id][j].plan_summa_nds, Data_SchedDeliver[id][j].id_point,
     Data_SchedDeliver[id][j].id_unit_meas, Data_SchedDeliver[id][j].id_unit_meas_sum]);
   StoredProc.Transaction.Commit;
  end;
 end;*)
 //Точки подключения
{ if cxGrid1TableView4.DataController.RecordCount <> 0 then for i := 0 to cxGrid1TableView4.DataController.RecordCount  - 1 do begin
  StoredProc.Transaction := WTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_CONTRACT_POINT_ADD', [id_contract, cxGrid1TableView4.DataController.Values[i, 3], cxGrid1TableView4.DataController.Values[i, 0], cxGrid1TableView4.DataController.Values[i, 1], now, SYS_MAX_TIMESTAMP, cxGrid1TableView4.DataController.Values[i, 4], cxGrid1TableView4.DataController.Values[i, 5]]);
  StoredProc.Transaction.Commit;
 end;}
end;

procedure TFdt_contract_ADD.cxButtonEdit_depPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

//            FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
    begin
        cxButtonEdit_otd.Text := sp.Output['Name_Full'];
        id_otdel := sp.Output['Id_Department'];
    end;
    sp.Free;
 end;

procedure TFdt_contract_ADD.Button1Click(Sender: TObject);
var
  p : TPeriods;
  c : Currency;
begin
 SetLength(p, 2);
 p[0].date_beg := StrToDate('01.01.2006');
 p[0].date_end := StrToDate('10.01.2006');
 p[0].cost := 100;
 p[1].date_beg := StrToDate('10.01.2006');
 p[1].date_end := StrToDate('31.01.2006');
 p[1].cost := 110;
 c := CalcCost(StrToDate('01.01.2006'), StrToDate('31.12.2006'), p);
 ShowMessage(FormatFloat('0.0000', c));
end;

procedure TFdt_contract_ADD.cxGridTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ADone := false;
 if (AViewInfo.Item.Index = IDX_COST) AND (Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][AViewInfo.RecordViewInfo.Index].cnt_prod > 1) then begin
  ACanvas.Font.Color := clBlue;
  ACanvas.Font.Style := [fsUnderline];
 end;
end;

procedure TFdt_contract_ADD.cxGridTableView3CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
 frm : TfrmProdDate;
begin
 if {cxGrid1TableView1Column4.Focused } ACellViewInfo.Item.Index = IDX_COST then if Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][cxGridTableView3.DataController.FocusedRecordIndex].cnt_prod > 1 then
 begin
   frm := TfrmProdDate.Create(Self);
   frm.pFIBDataSet1.ParamByName('ID_PRODUCT').AsInt64  := Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][cxGridTableView3.DataController.FocusedRecordIndex].id_product;
   frm.pFIBDataSet1.ParamByName('ID_CAT_CUST').AsInt64 := Data_SchedDeliver[cxGridTableView1.DataController.FocusedRecordIndex][cxGridTableView3.DataController.FocusedRecordIndex].id_cat_cust;
   frm.pFIBDataSet1.ParamByName('STAGE_BEG').AsDate := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 0];
   frm.pFIBDataSet1.ParamByName('STAGE_END').AsDate := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 1];
   frm.pFIBDataSet1.Active := true;
   frm.ShowModal;
   frm.pFIBDataSet1.Close;
   frm.Free;
 end;
end;

end.

