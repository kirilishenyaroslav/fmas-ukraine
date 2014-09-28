unit Arnd_Contract_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxGroupBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, Buttons, ExtCtrls,
  cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  cxCurrencyEdit, FIBDatabase, pFIBDatabase, IBAse, FIBQuery, pFIBQuery,
  cxMemo, pFIBStoredProc, globalspr, LoadDogManedger, DB, FIBDataSet,
  pFIBDataSet, dxBar, ActnList, cxTL, dogLoaderUnit, Mask, ToolEdit,
  CurrEdit,uCommonSp, cxRadioGroup,AArray,LoaderUnit, Menus,
  cxCheckBox;

type
  TPeriodRecord = packed record
   _Per_State : string;
   _id_Period : integer;
   _Date_Beg  : TDate;
   _Date_End  : TDate;
   _Sum       : extended;
  end;

  TSmetaRecord = packed record
   _id_Period : integer;
   _SmetState : string;
   _kod_S     : variant;
   _kod_R     : variant;
   _kod_St    : variant;
   _kod_Kekv  : variant;
   _Sum       : extended;
   _S_Name    : variant;
   _R_Name    : variant;
   _St_Name   : variant;
   _Kekv_Name : variant;
   _id_S      : variant;
   _id_R      : variant;
   _id_St     : variant;
   _id_Kekv   : variant;
  end;

  TDelSmetsRecord = packed record
   _id_Period : integer;
   _id_S      : integer;
   _id_R      : integer;
   _id_St     : integer;
   _id_Kekv   : integer;
  end;

  TPeriodDataArray = array of TSmetaRecord;
  TPeriodArray = array of TPeriodRecord;

  TArnd_Contract_Add_Form = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    NameCust: TcxButtonEdit;
    MFO: TcxTextEdit;
    Rate_Acc: TcxTextEdit;
    Name_Bank: TcxTextEdit;
    Kod_EDRPOU: TcxTextEdit;
    BottomPanel: TPanel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox3: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    FIO_DonGU: TcxTextEdit;
    FIO_Postav: TcxTextEdit;
    Dog_Note_Memo: TcxMemo;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    St_Label: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Label15: TLabel;
    KEKV_Label: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label16: TLabel;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    LeftPanel: TPanel;
    PeriodGrid: TcxGrid;
    PeriodTableView: TcxGridTableView;
    State_Period_Column: TcxGridColumn;
    id_Per_Column: TcxGridColumn;
    Date_Beg_Column: TcxGridColumn;
    Date_End_Column: TcxGridColumn;
    Summa_Column: TcxGridColumn;
    PeriodGridLevel: TcxGridLevel;
    PeriodDockControl: TdxBarDockControl;
    RightPanel: TPanel;
    SmetaGrid: TcxGrid;
    SmetaTableView: TcxGridTableView;
    State_Smeta_Column: TcxGridColumn;
    S_Column: TcxGridColumn;
    R_Column: TcxGridColumn;
    St_Column: TcxGridColumn;
    Kekv_Column: TcxGridColumn;
    SSumma_Column: TcxGridColumn;
    S_Name_Column: TcxGridColumn;
    R_Name_Column: TcxGridColumn;
    St_Name_Column: TcxGridColumn;
    id_S_Column: TcxGridColumn;
    id_R_Column: TcxGridColumn;
    id_St_Column: TcxGridColumn;
    id_Kekv_Column: TcxGridColumn;
    Name_Kekv_Column: TcxGridColumn;
    SmetaGridLevel: TcxGridLevel;
    SmetDockControl: TdxBarDockControl;
    ArndNumEdit: TcxTextEdit;
    ArndDateEdit: TcxDateEdit;
    cxTextEdit_reg_number: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    DogDateBeg: TcxDateEdit;
    DogDateEnd: TcxDateEdit;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    DataSet: TpFIBDataSet;
    BarManager: TdxBarManager;
    AddPeriodButton: TdxBarButton;
    CloneButton: TdxBarButton;
    DelPeriodButton: TdxBarButton;
    EditPeriodButton: TdxBarButton;
    AddSmetButton: TdxBarButton;
    DelSmetButton: TdxBarButton;
    EditSmetButton: TdxBarButton;
    ActionList: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    Label26: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    HistoryButton: TcxButton;
    InflationButton: TcxButton;
    pFIBQuery2: TpFIBQuery;
    pFIBStoredProc2: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    Label17: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    ActionList1: TActionList;
    save: TAction;
    Cancel: TAction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure AddPeriodButtonClick(Sender: TObject);
    procedure NameCustPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPeriodButtonClick(Sender: TObject);
    procedure DelPeriodButtonClick(Sender: TObject);
    procedure AddSmetButtonClick(Sender: TObject);
    procedure DelSmetButtonClick(Sender: TObject);
    procedure PeriodTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ApplyButtonClick(Sender: TObject);
    procedure HistoryButtonClick(Sender: TObject);
    procedure SmetaTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SmetaTableViewEditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure CloneButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure S_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label16MouseLeave(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxButtonEdit_otdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PeriodTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmetaTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton1Click(Sender: TObject);
    procedure InflationButtonGetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure InflationButtonClick(Sender: TObject);
    procedure Summa_ColumnPropertiesEditValueChanged(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure saveExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    fProc : TResProc;
    { Private declarations }
  public
    id_otdel       : integer;
    Priznak_Vizova : string;
    id_Document    : int64;

    id_arnd_type : integer;
    id_Tip_Dog  : integer;
    id_Customer : Int64;
    id_Rate_Acc : Int64;
    rate_acc_un : Int64;
    PeriodData  : TPeriodDataArray;
    DelPeriods  : array of integer;
    DelSmets    : array of TDelSmetsRecord;
    constructor Create(AOwner:TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant); overload;
    destructor Destroy; override;
    procedure  SaveDog;
    procedure  SaveSmets(id_Period : integer);
    procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
    procedure  SetLabels;
    procedure  TempAddPeriod; 
  end;


function LoadShablon(AOwner: TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):variant;stdcall;
exports LoadShablon;

var
  Arnd_Contract_Add_Form: TArnd_Contract_Add_Form;
//  frmFavour: TfrmFavour;


implementation

uses Period_Add, Arnd_Dog_Hist, DateUtils, Math, Registry, sp_Inflation;

{$R *.dfm}

function LoadShablon(AOwner: TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):variant;stdcall;
var
 upd_arnd:string;
begin
// ShowMessage('Loaded!');
// Arnd_Contract_Add_Form := TArnd_Contract_Add_Form.Create(AOwner, DBHandle, frmStyle, id_dokument, Pr_vizova, Id_t_d);
// Arnd_Contract_Add_Form.fProc := proc;
// self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'prosmotr', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);

 upd_arnd :='add_arnd_favour.bpl';
 LoadDogManedger.LoadShablon(AOwner, DBHandle, fsMDIChild, id_dokument, Pr_vizova, Id_t_d, PChar(upd_arnd), proc);
end;

constructor TArnd_Contract_Add_Form.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; frmStyle: TFormStyle; id_dokument: Variant;
  Pr_vizova: String; Id_t_d: Variant);
begin
 inherited Create (Aowner);
 InitConnection(DBHandle);
 FormStyle  := frmStyle;

 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 KEKV_Label.Caption := '';

 id_Tip_Dog := Id_t_d;

 if Pr_vizova = 'add' then begin
  DataSet.SelectSQL.Text := 'select * from PUB_SP_TIP_DOG_INFO(' + IntToStr(id_Tip_Dog) + ')';
  DataSet.Open;

  if not VarIsNull(DataSet['DEF_NAME_CUSTOMER']) then cxButtonEdit_name_un.Text := DataSet['DEF_NAME_CUSTOMER'];
  if not VarIsNull(DataSet['DEF_MFO'])      then cxTextEdit_mfo_un.Text    := DataSet['DEF_MFO'];
  if not VarIsNull(DataSet['DEF_RSCHET'])   then cxTextEdit_rsch_un.Text   := DataSet['DEF_RSCHET'];
  if not VarIsNull(DataSet['DEF_BANK_NAME'])     then cxTextEdit_bank_un.Text   := DataSet['DEF_BANK_NAME'];
  if not VarIsNull(DataSet['DEF_ACCOUNT'])  then rate_acc_un               := DataSet['DEF_ACCOUNT'];

  DataSet.Close;
 end;

 Priznak_Vizova := Pr_vizova;
 id_Document    := id_dokument;
end;

procedure TArnd_Contract_Add_Form.FormCreate(Sender: TObject);
var
 i : integer;
 id_arnd : integer;
 reg       : TRegistry;
 DataSetDep: TpFIBDataSet;

begin
 State_Period_Column.DataBinding.ValueTypeClass := TcxStringValueType;
 id_Per_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Date_Beg_Column.DataBinding.ValueTypeClass     := TcxDateTimeValueType;
 Date_End_Column.DataBinding.ValueTypeClass     := TcxDateTimeValueType;
 Summa_Column.DataBinding.ValueTypeClass        := TcxCurrencyValueType;

 State_Smeta_Column.DataBinding.ValueTypeClass  := TcxStringValueType;
 S_Column.DataBinding.ValueTypeClass            := TcxIntegerValueType;
 R_Column.DataBinding.ValueTypeClass            := TcxIntegerValueType;
 St_Column.DataBinding.ValueTypeClass           := TcxIntegerValueType;
 Kekv_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;

 SSumma_Column.DataBinding.ValueTypeClass       := TcxCurrencyValueType;

 S_Name_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 R_Name_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 St_Name_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Kekv_Column.DataBinding.ValueTypeClass    := TcxStringValueType;

 id_S_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_R_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_St_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 id_Kekv_Column.DataBinding.ValueTypeClass      := TcxIntegerValueType;

 ArndDateEdit.Date := Now;

 if (Priznak_Vizova = 'red') or (Priznak_Vizova = 'prosmotr') then begin
  DataSet.SelectSQL.Text := 'select * from DOG_DT_DOCUMENT_INFO(' + IntToStr(id_Document) + ')';
  DataSet.Open;

  ArndNumEdit.Text   := DataSet.FieldValues['D_N_DOG'];
  ArndDateEdit.Date  := DataSet.FieldValues['D_D_DOG'];
  DogDateBeg.Date    := DataSet.FieldValues['D_DATE_BEG'];
  DogDateEnd.Date    := DataSet.FieldValues['D_DATE_END'];
  id_Customer        := DataSet['D_ID_CUSTOMER'];
  NameCust.Text      := DataSet.FieldValues['D_NAME_CUSTOMER_K'];
  MFO.Text           := DataSet.FieldValues['D_MFO_K'];
  Rate_Acc.Text      := DataSet.FieldValues['D_RSCH_K'];
  Name_Bank.Text     := DataSet.FieldValues['D_BANK_NAME_K'];
  Kod_EDRPOU.Text    := DataSet.FieldValues['D_OKPO_K'];
  FIO_DonGU.Text     := DataSet.FieldValues['D_FIO_DONGU'];
  FIO_Postav.Text    := DataSet.FieldValues['D_FIO_POSTAV'];
  Dog_Note_Memo.Text := DataSet.FieldValues['D_DOG_NOTE'];
  cxTextEdit_reg_number.Text := DataSet.FieldValues['D_REGEST_NUM'];
  cxButtonEdit_name_un.Text := DataSet.FieldValues['D_NAME_CUSTOMER_N'];
  cxTextEdit_mfo_un.Text := DataSet.FieldValues['D_MFO_N'];
  cxTextEdit_bank_un.Text := DataSet.FieldValues['D_BANK_NAME_N'];
  cxTextEdit_rsch_un.Text := DataSet.FieldValues['D_RSCH_N'];
  rate_acc_un := DataSet['D_ID_RATE_ACC_NATIVE'];
  id_Rate_Acc := DataSet['D_ID_RATE_ACCOUNT'];


  { Вставка адентификатора типов аренды}
  pFIBQuery2.Close;
  pFIBQuery2.SQL.Clear;
  pFIBQuery2.SQL.Add('SELECT ID_ARND_TYPE FROM DOG_DT_DOCUMENT WHERE id_dog = ' + IntToStr(id_Document));
  pFIBQuery2.ExecQuery;

  id_arnd:=pFIBQuery2.FldByName['ID_ARND_TYPE'].AsInteger;

  pFIBQuery2.Close;
  pFIBQuery2.SQL.Clear;
  pFIBQuery2.SQL.Add('SELECT ARND_TYPE FROM SP_ARND_TYPE WHERE ID_ARND_TYPE = ' + IntToStr(id_arnd));
  pFIBQuery2.ExecQuery;
  cxButtonEdit1.Text:=pFIBQuery2.FldByName['ARND_TYPE'].AsString;

  //id_dog

  if Priznak_Vizova <> 'add' then
  begin
    cxButtonEdit_otd.Text := DataSet['OTDEL_NAME_FULL'];
    id_otdel              := DataSet['ID_OTDEL'];
  end;
  CurrencyEdit_summa_pay.Value  := DataSet.FieldValues['D_SUM_PAY'];
  CurrencyEdit_sum_fulfil.Value := DataSet.FieldValues['D_SUM_FULFIL'];

  DataSet.Close;

  DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL(' + IntToStr(id_Document) + ')';
  DataSet.Open;

  while not DataSet.Eof do begin
   with PeriodTableView.DataController do begin
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := '';
    Values[RecordCount - 1, 1] := DataSet.Fields[0].AsInteger;
    Values[RecordCount - 1, 2] := DataSet.Fields[1].AsDateTime;
    Values[RecordCount - 1, 3] := DataSet.Fields[2].AsDateTime;
    Values[RecordCount - 1, 4] := DataSet.Fields[3].AsCurrency;
   end;

   DataSet.Next;
  end;

  DataSet.Close;

  for i := 0 to PeriodTableView.DataController.RecordCount - 1 do begin
   DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
   + IntToStr(PeriodTableView.DataController.Values[i, 1]) + ')';

   DataSet.Open;

   while not DataSet.Eof do begin
    SetLength(PeriodData, Length(PeriodData) + 1);

    with PeriodData[Length(PeriodData) - 1] do begin
     _id_Period := PeriodTableView.DataController.Values[i, 1];
     _SmetState := '';
     _id_S      := DataSet['ID_S'];
     _id_R      := DataSet['ID_R'];
     _id_St     := DataSet['ID_ST'];
     _id_Kekv   := DataSet['ID_KEKV'];
     _kod_S     := DataSet['KOD_S'];
     _kod_R     := DataSet['KOD_R'];
     _kod_St    := DataSet['KOD_ST'];
     _kod_Kekv  := DataSet['KOD_KEKV'];
     _S_Name    := DataSet['NAME_S'];
     _R_Name    := DataSet['NAME_R'];
     _St_Name   := DataSet['NAME_ST'];
     _Kekv_Name := DataSet['NAME_KEKV'];
     _Sum       := DataSet['SUMMA'];
    end;

    DataSet.Next;
   end;

   DataSet.Close;
  end;

  if PeriodTableView.DataController.RecordCount > 0 then PeriodTableView.DataController.FocusedRecordIndex := 0;
  if SmetaTableView.DataController.RecordCount > 0 then SmetaTableView.DataController.FocusedRecordIndex := 0;

  if Priznak_Vizova = 'red' then begin
   ArndNumEdit.Properties.ReadOnly := True;
   ArndNumEdit.Style.Color := $00D9EBE0;

   Caption := 'Зміна договору на оренду';
  end
  else begin
   ArndNumEdit.Properties.ReadOnly   := True;
   ArndDateEdit.Properties.ReadOnly  := True;
   DogDateBeg.Properties.ReadOnly    := True;
   DogDateEnd.Properties.ReadOnly    := True;
   MFO.Properties.ReadOnly           := True;
   Kod_EDRPOU.Properties.ReadOnly    := True;
   Rate_Acc.Properties.ReadOnly      := True;
   Name_Bank.Properties.ReadOnly     := True;
   FIO_DonGU.Properties.ReadOnly     := True;
   FIO_Postav.Properties.ReadOnly    := True;
   Dog_Note_Memo.Properties.ReadOnly := True;
   cxButtonEdit1.Properties.ReadOnly := True;
   PeriodTableView.OptionsSelection.CellSelect := False;

   ArndNumEdit.Style.Color   := $00D9EBE0;
   ArndDateEdit.Style.Color  := $00D9EBE0;
   DogDateBeg.Style.Color    := $00D9EBE0;
   DogDateEnd.Style.Color    := $00D9EBE0;
   NameCust.Style.Color      := $00D9EBE0;
   MFO.Style.Color           := $00D9EBE0;
   Kod_EDRPOU.Style.Color    := $00D9EBE0;
   Rate_Acc.Style.Color      := $00D9EBE0;
   Name_Bank.Style.Color     := $00D9EBE0;
   FIO_DonGU.Style.Color     := $00D9EBE0;
   FIO_Postav.Style.Color    := $00D9EBE0;
   Dog_Note_Memo.Style.Color := $00D9EBE0;
   cxButtonEdit_otd.Style.Color := $00D9EBE0;
   cxButtonEdit1.Style.Color := $00D9EBE0;

   NameCust.Properties.Buttons[0].Visible := False;

   ApplyButton.Visible                       := False;

   SmetaTableView.OptionsSelection.CellSelect := False;

   Caption := 'Перегляд договору на оренду';
  end;
 end
 else if Priznak_Vizova = 'add' then begin
  Query.SQL.Text := 'select * from DOG_SYS_OPTIONS';
  Query.ExecQuery;
  FIO_DonGU.Text := Query.FldByName['FIO_DONNU'].AsString;
  Query.Close;

  NameCustPropertiesButtonClick(nil, 0);
  Caption := 'Додавання договору на оренду';

  HistoryButton.Visible := False;

  //из реестра забираем отдел
  reg := TRegistry.Create;
  reg.OpenKey(REG_KEY + 'Otdel', true);
  try
    id_otdel := reg.ReadInteger('id_otdel');
  except
    id_otdel := 0;
  end;
  reg.Free;

  if id_otdel > 0 then
  begin
    DataSetDep := TpFIBDataSet.Create(Self);
    DataSetDep.Database    := Database;
    DataSetDep.Transaction := ReadTransaction;
    DataSetDep.SQLs.SelectSQL.Text := 'select * from sp_department d where d.id_department=:id_otdel AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
    DataSetDep.ParamByName('id_otdel').Value := id_otdel;
    DataSetDep.Open;
    cxButtonEdit_otd.Text := DataSetDep.FBN('name_full').AsString;
    DataSetDep.Close;
    DataSetDep.Free;
  end
  else
  begin
    DataSetDep := TpFIBDataSet.Create(Self);
    DataSetDep.Database    := Database;
    DataSetDep.Transaction := ReadTransaction;
    DataSetDep.SQLs.SelectSQL.Text := 'select d.*, s.local_department from ini_asup_consts s, sp_department d where  s.local_department=d.id_department AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
    DataSetDep.Open;
    cxButtonEdit_otd.Text := DataSetDep.FBN('name_full').AsString;
    id_otdel := DataSetDep.FBN('id_department').AsInteger;
    DataSetDep.Close;
    DataSetDep.Free;
  end;

 end;
end;

procedure TArnd_Contract_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TArnd_Contract_Add_Form.CancelButtonClick(Sender: TObject);
begin
 if Assigned(fProc) then fProc(-1, raClose);
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure TArnd_Contract_Add_Form.NameCustPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(Database.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selRateAccount;
 i['show_all']     := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

 if o['ModalResult'] = mrOk then begin
  id_Customer := o['ID_CUSTOMER'];

  if  not VarIsNull(o['ID_RATE_ACCOUNT']) then
   id_Rate_Acc := o['ID_RATE_ACCOUNT']
  else id_Rate_Acc := -1;

   if  not VarIsNull(o['RATE_ACCOUNT']) then
    Rate_Acc.Text := o['RATE_ACCOUNT']
   else Rate_Acc.Text := '';

   if  not VarIsNull(o['MFO']) then
    MFO.Text := o['MFO']
   else MFO.Text := '';

   if  not VarIsNull(o['NAME_BANK']) then
    Name_Bank.Text := o['NAME_BANK']
   else Name_Bank.Text  := '';

   NameCust.Text   := o['NAME_CUSTOMER'];
   Kod_EDRPOU.Text := o['KOD_EDRPOU'];
 end;
 
 i.Free;
 o.Free;

// Query.SQL.Text := 'select * from PUB_SP_CUST_MEN_SEL(' + VarToStr(id_Customer) + ')';
// Query.ExecQuery;
// FIO_Postav.Text := Query.FldByName['FIO'].AsString;
// Query.Close;
end;

procedure TArnd_Contract_Add_Form.AddPeriodButtonClick(Sender: TObject);
var
 id_Period : integer;
 i, j, t   : integer;
 Date_Beg  : TDate;
 Date_End  : TDate;
 Sum       : extended;
 k,cnt     : integer;

 Periods   : TPeriodArray;
 TempData  : TPeriodDataArray;

 id        : variant;
 Add       : variant;
 S, R, St  : integer;
 kekv      : integer;
 id_S      : integer;
 id_R      : integer;
 id_St     : integer;
 id_kekv   : integer;
 S_Name    : string;
 R_Name    : string;
 St_Name   : string;
 kekv_name : string;
 summa     : extended;

 Flag      : boolean;

 a : TcxCustomEditData;

 p : TPeriod_Add_Form;
begin
 if NameCust.Text = '' then begin
  ShowMessage('Ви не обрали постачальника!');
  Exit;
 end;

 if (DogDateBeg.Text = '') or (DogDateEnd.Text = '') then begin
  ShowMessage('Уведіть коректно дати початку і закінчення терміну дії договору!');
  Exit;
 end;

 if DogDateBeg.Date > DogDateEnd.Date then begin
  ShowMessage('Дата початку терміну дії договору не може бути більше дати його закінчення!');
  Exit;
 end;

 p := TPeriod_Add_Form.Create(Self);
 p.Caption      := 'Додавання періоду';
 p.UseInflation := False;

 Date_Beg := Now - 1;

 with PeriodTableView.DataController do begin
  if FocusedRecordIndex >= 0 then SaveSmets(Values[FocusedRecordIndex, 1]);
 end;

 for i := 0 to PeriodTableView.DataController.RecordCount - 1 do
  if i = 0 then Date_Beg := PeriodTableView.DataController.Values[0, 3]
  else if Date_Beg < PeriodTableView.DataController.Values[i, 3] then Date_Beg := PeriodTableView.DataController.Values[i, 3];

 if PeriodTableView.DataController.RecordCount > 0 then p.Date_Beg_Edit.Date := Date_Beg + 1
 else p.Date_Beg_Edit.Date := DogDateBeg.Date;

 p.Date_End_Edit.Date      := EndOfTheMonth(p.Date_Beg_Edit.Date);

 p.RadioGroup.ItemIndex := 1;
 p.RadioGroup.Enabled   := False;

 if p.ShowModal <> mrOk then Exit;

 Date_Beg := p.Date_Beg_Edit.Date;
 Date_End := p.Date_End_Edit.Date;
 Sum      := p.Summa_Edit.Value;

 id_Period := 0;

 with PeriodTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 1] > id_Period then id_Period := Values[i, 1];

   // Разбитие пересекающихся периодов
               //----- (0<->1)---------

  for i := 0 to RecordCount - 1 do begin
   if (Date_Beg > Values[i, 3]) or (Values[i, 2] > Date_End) then begin
    SetLength(Periods, Length(Periods) + 1);

    with Periods[Length(Periods) - 1] do begin
     _Per_State := Values[i, 0];
     _id_Period := Values[i, 1];
     _Date_Beg  := Values[i, 2];
     _Date_End  := Values[i, 3];
    end;
   end
   {0,0}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;
   end
   {1,0}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;
   end
   {1,1}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 2] <= Date_End) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);
    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end
   {0,1}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 2);

    Inc(id_Period);
    with Periods[Length(Periods) - 2] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end;
  end;


  SetLength(Periods, Length(Periods) + 1);

  Inc(id_Period);
  with Periods[Length(Periods) - 1] do begin
   _Per_State := 'ADD';
   _id_Period := id_Period;
   _Date_Beg  := Date_Beg;
   _Date_End  := Date_End;
  end;

  Date_Beg := p.Date_Beg_Edit.Date;
  Date_End := p.Date_End_Edit.Date;

   //вызов формы добавления см/з/ст/к

     Add := LoadDogManedger.AddKosht(self,Database.Handle,-1, 0, 0, 0, 0, 0, 0, Date);
     if VarArrayDimCount(Add) <= 0 then Exit;
     Cnt := VarArrayHighBound(Add, 1);
     for k := 0 to Cnt do
     begin
      id_S      := Add[k][7];
      id_R      := Add[k][8];
      id_St     := Add[k][9];
      S_Name    := Add[k][0];
      R_Name    := Add[k][1];
      St_Name   := Add[k][2];
      Summa     := Add[k][3];
      S         := Add[k][4];
      R         := Add[k][5];
      St        := Add[k][6];
      id_kekv   := Add[k][10];
      kekv      := Add[k][11];
      kekv_name := Add[k][12];
     end;
{      id := GlobalSPR.GetSmets(self, Database.Handle, Now, psmRazdSt);

      if VarArrayDimCount(id) <= 0 then Exit;
      if id[0] = NULL then Exit;

      id_S    := id[0];
      id_R    := id[1];
      id_St   := id[2];
      S_Name  := id[4];
      R_Name  := id[5];
      St_Name := id[6];
      S       := id[9];
      R       := id[7];
      St      := id[8];
}
  for i := 0 to Length(Periods) - 1 do begin
   for j := 0 to RecordCount - 1 do
    if (Periods[i]._Date_Beg >= Values[j, 2]) and (Periods[i]._Date_End <= Values[j, 3]) then begin
     if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) then Continue;

     Periods[i]._Sum := Values[j, 4];

     Flag := False;
     for t := 0 to Length(DelPeriods) - 1 do
      if DelPeriods[t] = Values[j, 1] then begin
       Flag := True;
       Break;
      end;

     for t := 0 to Length(PeriodData) - 1 do
      if PeriodData[t]._id_Period = Values[j, 1] then begin
       SetLength(TempData, Length(TempData) + 1);

       TempData[Length(TempData) - 1] := PeriodData[t];

       with TempData[Length(TempData) - 1] do begin
        _id_Period := Periods[i]._id_Period;

        if Flag then _SmetState := 'ADD';
       end;
      end;

     Break;
    end;

   if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) and (S >= 0) then begin
    Periods[i]._Sum := Periods[i]._Sum + Sum;
    SetLength(TempData, Length(TempData) + 1);

    Flag := False;
    for t := 0 to Length(TempData) - 1 do
     if (TempData[t]._id_Period = Periods[i]._id_Period) and (TempData[t]._kod_S = S)
     and (TempData[t]._kod_R = R) and (TempData[t]._kod_St = St) and (TempData[t]._kod_Kekv = Kekv) then begin
      TempData[t]._Sum := TempData[t]._Sum + Sum;
      Flag := True;
      Break;
     end;

    if not Flag then with TempData[Length(TempData) - 1] do begin
     _id_Period := Periods[i]._id_Period;
     _SmetState := 'ADD';
     _kod_S     := S;
     _kod_R     := R;
     _kod_St    := St;
     _kod_Kekv  := Kekv;
     _Sum       := Summa;
     _S_Name    := S_Name;
     _R_Name    := R_Name;
     _St_Name   := St_Name;
     _Kekv_Name := Kekv_name;
     _id_S      := id_S;
     _id_R      := id_R;
     _id_St     := id_St;
     _id_Kekv   := id_kekv;
    end;
   end;
  end;

  PeriodData := nil;
  PeriodData := Copy(TempData, 0, Length(TempData));

  RecordCount := 0;

  for i := 0 to Length(Periods) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := Periods[i]._Per_State;
   Values[RecordCount - 1, 1] := Periods[i]._id_Period;
   Values[RecordCount - 1, 2] := Periods[i]._Date_Beg;
   Values[RecordCount - 1, 3] := Periods[i]._Date_End;
   Values[RecordCount - 1, 4] := Periods[i]._Sum;
  end;

  PeriodGrid.SetFocus;
  FocusedRecordIndex := RecordCount - 1;
 end;

 SmetaGrid.SetFocus;
 SmetaTableView.Controller.EditingController.EditingItem := SmetaTableView.Items[5];
end;

procedure TArnd_Contract_Add_Form.EditPeriodButtonClick(Sender: TObject);
var
 id_Period : integer;
 i, j, t   : integer;
 Date_Beg  : TDate;
 Date_End  : TDate;

 Periods   : TPeriodArray;
 TempData  : TPeriodDataArray;

 Flag      : boolean;
 k         : integer;

 Per_State : string;
 id_Per    : integer;
 Per_Sum   : currency;

 p : TPeriod_Add_Form;
begin
 k := PeriodTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 id_Per := PeriodTableView.DataController.Values[k, 1];
 Per_State := PeriodTableView.DataController.Values[k, 0];
 if Per_State <> 'ADD' then Per_State := 'MOD';

 p := TPeriod_Add_Form.Create(Self);
 p.Caption      := 'Зміна періоду';
 p.UseInflation := False;

 with PeriodTableView.DataController do begin
  p.Date_Beg_Edit.Date := Values[k, 2];
  p.Date_End_Edit.Date := Values[k, 3];
  p.Summa_Edit.Value   := Values[k, 4];
 end;

 if p.ShowModal <> mrOk then Exit;

 Date_Beg := p.Date_Beg_Edit.Date;
 Date_End := p.Date_End_Edit.Date;
 Per_Sum  := p.Summa_Edit.Value;

 id_Period := 0;

 with PeriodTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 1] > id_Period then id_Period := Values[i, 1];

   // Разбитие пересекающихся периодов
               //----- (0<->1)---------

  for i := 0 to RecordCount - 1 do begin
   if (Date_Beg > Values[i, 3]) or (Values[i, 2] > Date_End) then begin
    SetLength(Periods, Length(Periods) + 1);

    with Periods[Length(Periods) - 1] do begin
     _Per_State := Values[i, 0];
     _id_Period := Values[i, 1];
     _Date_Beg  := Values[i, 2];
     _Date_End  := Values[i, 3];
    end;
   end
   {0,0}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;
   end
   {1,0}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
{    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;}
   end
   {1,1}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 2] <= Date_End) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);
    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end
   {0,1}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 2);

    Inc(id_Period);
    with Periods[Length(Periods) - 2] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end;
  end;


  SetLength(Periods, Length(Periods) + 1);

  with Periods[Length(Periods) - 1] do begin
   _Per_State := Per_State;
   _id_Period := id_Per;
   _Date_Beg  := Date_Beg;
   _Date_End  := Date_End;
   _Sum       := Per_Sum;
  end;


  for i := 0 to Length(Periods) - 1 do begin
   for j := 0 to RecordCount - 1 do
    if (Periods[i]._Date_Beg >= Values[j, 2]) and (Periods[i]._Date_End <= Values[j, 3]) then begin
     if Values[j, 1] = id_Per then Continue;
     Periods[i]._Sum := Values[j, 4];

     Flag := False;
     for t := 0 to Length(DelPeriods) - 1 do
      if DelPeriods[t] = Values[j, 1] then begin
       Flag := True;
       Break;
      end;

     for t := 0 to Length(PeriodData) - 1 do
      if PeriodData[t]._id_Period = Values[j, 1] then begin
       SetLength(TempData, Length(TempData) + 1);

       TempData[Length(TempData) - 1] := PeriodData[t];

       with TempData[Length(TempData) - 1] do begin
        _id_Period := Periods[i]._id_Period;

        if Flag then _SmetState := 'ADD';
       end;
      end;

     Break;
    end;
  end;

  for t := 0 to Length(PeriodData) - 1 do
   if PeriodData[t]._id_Period = id_Per then begin
    SetLength(TempData, Length(TempData) + 1);

    TempData[Length(TempData) - 1] := PeriodData[t];
   end;

  PeriodData := nil;
  PeriodData := Copy(TempData, 0, Length(TempData));

  RecordCount := 0;

  for i := 0 to Length(Periods) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := Periods[i]._Per_State;
   Values[RecordCount - 1, 1] := Periods[i]._id_Period;
   Values[RecordCount - 1, 2] := Periods[i]._Date_Beg;
   Values[RecordCount - 1, 3] := Periods[i]._Date_End;
   Values[RecordCount - 1, 4] := Periods[i]._Sum;
  end;

  PeriodGrid.SetFocus;
  FocusedRecordIndex := RecordCount - 1;
 end;

 text := inttostr(length(DelPeriods));
end;

procedure TArnd_Contract_Add_Form.DelPeriodButtonClick(Sender: TObject);
var
 k : integer;
 Periods   : TPeriodArray;
 TempData  : TPeriodDataArray;

begin

 k := PeriodTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити обраний період?'),
 'Підтвердження видалення',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;

// MessageBox(0,Pchar(IntToStr(k)),'Value',MB_OK);
 if PeriodTableView.DataController.Values[k, 0] <> 'ADD' then begin
  SetLength(DelPeriods, Length(DelPeriods)+1);
  DelPeriods[Length(DelPeriods) - 1] := PeriodTableView.DataController.Values[k, 1];
 end;
 TempAddPeriod;

 PeriodTableView.DataController.DeleteRecord(k);

 if PeriodTableView.DataController.Values[PeriodTableView.DataController.RecordCount-1, 0] <> 'ADD' then begin
  SetLength(DelPeriods, Length(DelPeriods)+1);
  DelPeriods[Length(DelPeriods) - 1] := PeriodTableView.DataController.Values[PeriodTableView.DataController.RecordCount-1, 1];
 end;

 PeriodTableView.DataController.DeleteRecord(PeriodTableView.DataController.RecordCount-1);

// if PeriodTableView.DataController.RecordCount <> 0 then
// begin
//   PeriodTableView.DataController.FocusedRecordIndex:=k;
//  end;


end;


procedure  TArnd_Contract_Add_Form.TempAddPeriod;
var
 id_Period : integer;
 i, j, t   : integer;
 Date_Beg  : TDate;
 Date_End  : TDate;
 Sum       : extended;
 k,cnt     : integer;

 Periods   : TPeriodArray;
 TempData  : TPeriodDataArray;

 id        : variant;
 Add       : variant;
 S, R, St  : integer;
 kekv      : integer;
 id_S      : integer;
 id_R      : integer;
 id_St     : integer;
 id_kekv   : integer;
 S_Name    : string;
 R_Name    : string;
 St_Name   : string;
 kekv_name : string;
 summa     : extended;

 Flag      : boolean;

 a : TcxCustomEditData;

 p : TPeriod_Add_Form;
begin
 if NameCust.Text = '' then begin
  ShowMessage('Ви не обрали постачальника!');
  Exit;
 end;

 if (DogDateBeg.Text = '') or (DogDateEnd.Text = '') then begin
  ShowMessage('Уведіть коректно дати початку і закінчення терміну дії договору!');
  Exit;
 end;

 if DogDateBeg.Date > DogDateEnd.Date then begin
  ShowMessage('Дата початку терміну дії договору не може бути більше дати його закінчення!');
  Exit;
 end;

 p := TPeriod_Add_Form.Create(Self);
 p.Caption      := 'Додавання періоду';
 p.UseInflation := False;

 Date_Beg := Now - 1;

 with PeriodTableView.DataController do begin
  if FocusedRecordIndex >= 0 then SaveSmets(Values[FocusedRecordIndex, 1]);
 end;

 for i := 0 to PeriodTableView.DataController.RecordCount - 1 do
  if i = 0 then Date_Beg := PeriodTableView.DataController.Values[0, 3]
  else if Date_Beg < PeriodTableView.DataController.Values[i, 3] then Date_Beg := PeriodTableView.DataController.Values[i, 3];

 if PeriodTableView.DataController.RecordCount > 0 then p.Date_Beg_Edit.Date := Date_Beg + 1
 else p.Date_Beg_Edit.Date := DogDateBeg.Date;

 p.Date_End_Edit.Date      := EndOfTheMonth(p.Date_Beg_Edit.Date);

 p.RadioGroup.ItemIndex := 1;
 p.RadioGroup.Enabled   := False;

// if p.ShowModal <> mrOk then Exit;

 Date_Beg := p.Date_Beg_Edit.Date;
 Date_End := p.Date_End_Edit.Date;
 Sum      := p.Summa_Edit.Value;

 id_Period := 0;

 with PeriodTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 1] > id_Period then id_Period := Values[i, 1];

   // Разбитие пересекающихся периодов
               //----- (0<->1)---------

  for i := 0 to RecordCount - 1 do begin
   if (Date_Beg > Values[i, 3]) or (Values[i, 2] > Date_End) then begin
    SetLength(Periods, Length(Periods) + 1);

    with Periods[Length(Periods) - 1] do begin
     _Per_State := Values[i, 0];
     _id_Period := Values[i, 1];
     _Date_Beg  := Values[i, 2];
     _Date_End  := Values[i, 3];
    end;
   end
   {0,0}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;
   end
   {1,0}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;
   end
   {1,1}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 2] <= Date_End) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);
    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end
   {0,1}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 2);

    Inc(id_Period);
    with Periods[Length(Periods) - 2] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end;
  end;


  SetLength(Periods, Length(Periods) + 1);

  Inc(id_Period);
  with Periods[Length(Periods) - 1] do begin
   _Per_State := 'ADD';
   _id_Period := id_Period;
   _Date_Beg  := Date_Beg;
   _Date_End  := Date_End;
  end;

  Date_Beg := p.Date_Beg_Edit.Date;
  Date_End := p.Date_End_Edit.Date;

   //вызов формы добавления см/з/ст/к

//     Add := LoadDogManedger.AddKosht(self,Database.Handle,-1, 0, 0, 0, 0, 0, 0, Date);
//     if VarArrayDimCount(Add) <= 0 then Exit;
     Cnt := 1;//VarArrayHighBound(Add, 1);
     for k := 0 to Cnt do
     begin
      id_S      := 0;
      id_R      := 0;
      id_St     := 0;
      S_Name    := ' ';
      R_Name    := ' ';
      St_Name   := ' ';
      Summa     := 0;
      S         := 0;
      R         := 0;
      St        := 0;
      id_kekv   := 0;
      kekv      := 0;
      kekv_name := ' ';
     end;
{      id := GlobalSPR.GetSmets(self, Database.Handle, Now, psmRazdSt);

      if VarArrayDimCount(id) <= 0 then Exit;
      if id[0] = NULL then Exit;

      id_S    := id[0];
      id_R    := id[1];
      id_St   := id[2];
      S_Name  := id[4];
      R_Name  := id[5];
      St_Name := id[6];
      S       := id[9];
      R       := id[7];
      St      := id[8];
}
  for i := 0 to Length(Periods) - 1 do begin
   for j := 0 to RecordCount - 1 do
    if (Periods[i]._Date_Beg >= Values[j, 2]) and (Periods[i]._Date_End <= Values[j, 3]) then begin
     if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) then Continue;

     Periods[i]._Sum := Values[j, 4];

     Flag := False;
     for t := 0 to Length(DelPeriods) - 1 do
      if DelPeriods[t] = Values[j, 1] then begin
       Flag := True;
       Break;
      end;

     for t := 0 to Length(PeriodData) - 1 do
      if PeriodData[t]._id_Period = Values[j, 1] then begin
       SetLength(TempData, Length(TempData) + 1);

       TempData[Length(TempData) - 1] := PeriodData[t];

       with TempData[Length(TempData) - 1] do begin
        _id_Period := Periods[i]._id_Period;

        if Flag then _SmetState := 'ADD';
       end;
      end;

     Break;
    end;

   if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) and (S >= 0) then begin
    Periods[i]._Sum := Periods[i]._Sum + Sum;
    SetLength(TempData, Length(TempData) + 1);

    Flag := False;
    for t := 0 to Length(TempData) - 1 do
     if (TempData[t]._id_Period = Periods[i]._id_Period) and (TempData[t]._kod_S = S)
     and (TempData[t]._kod_R = R) and (TempData[t]._kod_St = St) and (TempData[t]._kod_Kekv = Kekv) then begin
      TempData[t]._Sum := TempData[t]._Sum + Sum;
      Flag := True;
      Break;
     end;

    if not Flag then with TempData[Length(TempData) - 1] do begin
     _id_Period := Periods[i]._id_Period;
     _SmetState := 'ADD';
     _kod_S     := S;
     _kod_R     := R;
     _kod_St    := St;
     _kod_Kekv  := Kekv;
     _Sum       := Summa;
     _S_Name    := S_Name;
     _R_Name    := R_Name;
     _St_Name   := St_Name;
     _Kekv_Name := Kekv_name;
     _id_S      := id_S;
     _id_R      := id_R;
     _id_St     := id_St;
     _id_Kekv   := id_kekv;
    end;
   end;
  end;

  PeriodData := nil;
  PeriodData := Copy(TempData, 0, Length(TempData));

  RecordCount := 0;

  for i := 0 to Length(Periods) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := Periods[i]._Per_State;
   Values[RecordCount - 1, 1] := Periods[i]._id_Period;
   Values[RecordCount - 1, 2] := Periods[i]._Date_Beg;
   Values[RecordCount - 1, 3] := Periods[i]._Date_End;
   Values[RecordCount - 1, 4] := Periods[i]._Sum;
  end;

  PeriodGrid.SetFocus;
  FocusedRecordIndex := RecordCount - 1;
 end;

 SmetaGrid.SetFocus;
 SmetaTableView.Controller.EditingController.EditingItem := SmetaTableView.Items[5];
end;




procedure TArnd_Contract_Add_Form.AddSmetButtonClick(Sender: TObject);
var
 S, R, St : integer;
 Kekv     : integer;
 id_S     : integer;
 id_R     : integer;
 id_St    : integer;
 id_kekv  : integer;
 S_Name   : string;
 R_Name   : string;
 St_Name  : string;
 kekv_name: string;
 i        : integer;
 k        : integer;
 PSum     : extended;
 Sum      : extended;
 Add      : variant;
 cnt      : integer;
begin
 k := PeriodTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 //вызов формы добавления см/з/ст/к

 Add := LoadDogManedger.AddKosht(self,Database.Handle, -1, 0, 0, 0, 0, 0, 0, Date);
 if VarArrayDimCount(Add) <= 0 then Exit;
 Cnt := VarArrayHighBound(Add, 1);
 for k := 0 to Cnt do
 begin
  id_S      := Add[k][7];
  id_R      := Add[k][8];
  id_St     := Add[k][9];
  S_Name    := Add[k][0];
  R_Name    := Add[k][1];
  St_Name   := Add[k][2];
  S         := Add[k][4];
  R         := Add[k][5];
  St        := Add[k][6];
  id_kekv   := Add[k][10];
  kekv      := Add[k][11];
  kekv_name := Add[k][12];
  sum       := Add[k][3];
 end;

 with SmetaTableView.DataController do begin
  PSum := 0;

  for i := 0 to RecordCount - 1 do begin
   PSum := PSum + Values[i, 5];

   if (Values[i, 1] = S) and (Values[i, 2] = R) and (Values[i, 3] = St) and (Values[i, 4] = Kekv) then begin
    FocusedRecordIndex := i;
    Exit;
   end;
  end;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0]  := 'ADD';
  Values[RecordCount - 1, 1]  := S;
  Values[RecordCount - 1, 2]  := R;
  Values[RecordCount - 1, 3]  := St;
  Values[RecordCount - 1, 4]  := Kekv;
  Values[RecordCount - 1, 5]  := Sum;
  Values[RecordCount - 1, 6]  := S_Name;
  Values[RecordCount - 1, 7]  := R_Name;
  Values[RecordCount - 1, 8]  := St_Name;
  Values[RecordCount - 1, 9]  := id_S;
  Values[RecordCount - 1, 10] := id_R;
  Values[RecordCount - 1, 11] := id_St;
  Values[RecordCount - 1, 12]  := id_kekv;
  Values[RecordCount - 1, 13]  := kekv_name;


{  Sum := PeriodTableView.DataController.Values[k, 4] - PSum;
  if Sum < 0 then Sum := 0;

  Values[RecordCount - 1, 5] := Sum;

  SmetaGrid.SetFocus;
  FocusedRecordIndex := RecordCount - 1;}
 end;

 SmetaGrid.SetFocus;
 SmetaTableView.Controller.EditingController.EditingItem := SmetaTableView.Items[5];
end;

procedure TArnd_Contract_Add_Form.DelSmetButtonClick(Sender: TObject);
var
 k : integer;
begin
 k := SmetaTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити обраний кошторис?'),
 'Підтвердження видалення',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;

 if SmetaTableView.DataController.Values[k, 0] <> 'ADD' then begin
  SetLength(DelSmets, Length(DelSmets) + 1);

  DelSmets[Length(DelSmets) - 1]._id_Period := PeriodTableView.DataController.Values[PeriodTableView.DataController.FocusedRecordIndex, 1];
  DelSmets[Length(DelSmets) - 1]._id_S      := SmetaTableView.DataController.Values[k, 9];
  DelSmets[Length(DelSmets) - 1]._id_R      := SmetaTableView.DataController.Values[k, 10];
  DelSmets[Length(DelSmets) - 1]._id_St     := SmetaTableView.DataController.Values[k, 11];
  DelSmets[Length(DelSmets) - 1]._id_Kekv   := SmetaTableView.DataController.Values[k, 12];
 end;

 SmetaTableView.DataController.DeleteRecord(k);
end;

procedure TArnd_Contract_Add_Form.PeriodTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 id_Period : integer;
 i         : integer;
begin
 if AFocusedRecord = nil then begin
  SmetaTableView.DataController.RecordCount := 0;
  Exit;
 end;

 SmetaTableView.BeginUpdate;

 if APrevFocusedRecord <> nil then begin
  // Changes saving to array
  id_Period := APrevFocusedRecord.Values[1];

  SaveSmets(id_Period);

  SmetaTableView.DataController.RecordCount := 0;
 end;

 // Filling SmetaTableView

 id_Period := AFocusedRecord.Values[1];

 for i := 0 to Length(PeriodData) - 1 do
  if PeriodData[i]._id_Period = id_Period then
  with SmetaTableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0]   := PeriodData[i]._SmetState;
   Values[RecordCount - 1, 1]   := PeriodData[i]._kod_S;
   Values[RecordCount - 1, 2]   := PeriodData[i]._kod_R;
   Values[RecordCount - 1, 3]   := PeriodData[i]._kod_St;
   Values[RecordCount - 1, 4]   := PeriodData[i]._kod_Kekv;
   Values[RecordCount - 1, 5]   := PeriodData[i]._Sum;
   Values[RecordCount - 1, 6]   := PeriodData[i]._S_Name;
   Values[RecordCount - 1, 7]   := PeriodData[i]._R_Name;
   Values[RecordCount - 1, 8]   := PeriodData[i]._St_Name;
   Values[RecordCount - 1, 9]   := PeriodData[i]._id_S;
   Values[RecordCount - 1, 10]  := PeriodData[i]._id_R;
   Values[RecordCount - 1, 11]  := PeriodData[i]._id_St;
   Values[RecordCount - 1, 12]  := PeriodData[i]._id_Kekv;
   Values[RecordCount - 1, 13]  := PeriodData[i]._Kekv_Name;

   if RecordCount = 1 then FocusedRecordIndex := 0;
  end;
   SmetaTableView.EndUpdate;
end;

procedure TArnd_Contract_Add_Form.ApplyButtonClick(Sender: TObject);
var
 k    : integer;
 i, j : integer;
 Sum  : extended;
begin
 if ArndNumEdit.Text = '' then begin
  ShowMessage('Ви не ввели номер договору на оренду!');
  ArndNumEdit.SetFocus;
  Exit;
 end;

 if ArndDateEdit.Text = '' then begin
  ShowMessage('Ви не ввели дату договору на оренду!');
  ArndDateEdit.SetFocus;
  Exit;
 end;

 if DogDateBeg.Text = '' then begin
  ShowMessage('Коректно введіть дати початку і закінчення договору на оренду!');
  DogDateBeg.SetFocus;
  Exit;
 end;

 if DogDateEnd.Text = '' then begin
  ShowMessage('Коректно введіть дати початку і закінчення договору на оренду!');
  DogDateEnd.SetFocus;
  Exit;
 end;

 if DogDateBeg.Date > DogDateEnd.Date then begin
  ShowMessage('Дата початку терміну дії договори не може бути більше дати його закінчення!');
  Exit;
 end;

 if NameCust.Text = '' then begin
  ShowMessage('Ви не вибрали постачальника!');
  NameCust.SetFocus;
  Exit;
 end;

 if FIO_DonGU.Text = '' then begin
  ShowMessage('Ви не вказали ким укладений договір!');
  FIO_DonGU.SetFocus;
  Exit;
 end;

 if FIO_Postav.Text = '' then begin
  ShowMessage('Ви не вказали ким укладений договір!');
  FIO_Postav.SetFocus;
  Exit;
 end;

 if PeriodTableView.DataController.RecordCount = 0 then begin
  ShowMessage('Відсутні періоди договору на оренду!');
  Exit;
 end;

 if Dog_Note_Memo.Text = '' then begin
  ShowMessage('Ви не вказали предмет договору!');
  Dog_Note_Memo.SetFocus;
  Exit;
 end;

 with PeriodTableView.DataController do begin
  k := FocusedRecordIndex;
  if k >= 0 then SaveSmets(Values[k,1]);

  for i := 0 to RecordCount - 1 do begin
   Sum := 0;

   for j := 0 to Length(PeriodData) - 1 do
    if PeriodData[j]._id_Period = Values[i, 1] then Sum := Sum + PeriodData[j]._Sum;

   if Sum <> PeriodTableView.DataController.Values[i, 4] then begin
    ShowMessage('Сума ' + CurrToStr(Values[i, 4]) + ' періоду ' + DateToStr(Values[i, 2])
    + ' - ' + DateToStr(Values[i, 3]) + ' розбігається із сумою ' + FloatToStr(Sum) + ' по кошторисам!' );
    Exit;
   end;
  end;
 end;

 SaveDog;

 if fsModal in FormState then ModalResult := mrOk
 else Close;
end;

procedure TArnd_Contract_Add_Form.SaveSmets(id_Period: integer);
var
 k, i, j : integer;
begin
 k := Length(PeriodData);
 i := 0;
 while (i <= k) and (k > 0) do
  if PeriodData[i]._id_Period = id_Period then begin
   for j := i to Length(PeriodData) - 2 do
    PeriodData[j] := PeriodData[j + 1];

   SetLength(PeriodData, Length(PeriodData) - 1);
   Dec(k);
  end
  else Inc(i);

 with SmetaTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   SetLength(PeriodData, Length(PeriodData) + 1);

   PeriodData[Length(PeriodData) - 1]._id_Period := id_Period;
   PeriodData[Length(PeriodData) - 1]._SmetState := Values[i, 0];
   PeriodData[Length(PeriodData) - 1]._kod_S     := Values[i, 1];
   PeriodData[Length(PeriodData) - 1]._kod_R     := Values[i, 2];
   PeriodData[Length(PeriodData) - 1]._kod_St    := Values[i, 3];
   PeriodData[Length(PeriodData) - 1]._kod_Kekv  := Values[i, 4];
   PeriodData[Length(PeriodData) - 1]._Sum       := Values[i, 5];
   PeriodData[Length(PeriodData) - 1]._S_Name    := Values[i, 6];
   PeriodData[Length(PeriodData) - 1]._R_Name    := Values[i, 7];
   PeriodData[Length(PeriodData) - 1]._St_Name   := Values[i, 8];
   PeriodData[Length(PeriodData) - 1]._id_S      := Values[i, 9];
   PeriodData[Length(PeriodData) - 1]._id_R      := Values[i, 10];
   PeriodData[Length(PeriodData) - 1]._id_St     := Values[i, 11];
   PeriodData[Length(PeriodData) - 1]._id_Kekv   := Values[i, 12];
   PeriodData[Length(PeriodData) - 1]._Kekv_Name := Values[i, 13];
  end;
 end;
end;

procedure TArnd_Contract_Add_Form.InitConnection(DBhandle: TISC_DB_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.StartTransaction;
end;

procedure TArnd_Contract_Add_Form.HistoryButtonClick(Sender: TObject);
var
 HistForm : TArnd_Dog_Hist_Form;
begin

 HistForm           := TArnd_Dog_Hist_Form.Create(Self);
 HistForm.id_Dog    := id_Document;
 HistForm.FormStyle := fsMDIChild;
 HistForm.Caption   := 'Історія договору ';
 HistForm.Show;
end;

procedure TArnd_Contract_Add_Form.SaveDog;
var
 ID_DOG     : int64;
 ID_PER     : integer;

 i, j       : integer;

 N_Dog      : string;
 D_Dog      : TDate;
 Name_Cust  : string;
 Date_Beg   : TDate;
 Date_End   : TDate;
 Dog_Note   : string;
 FIO_Don    : string;
 FIO_Cust   : string;
 ip_comp    : string;
 name_comp  : string;

 action : TResAction;
 reg : TRegistry;

begin
 WriteTransaction.StartTransaction;

 N_Dog      := ArndNumEdit.Text;
 D_Dog      := ArndDateEdit.Date;
 Name_Cust  := NameCust.Text;
 Date_Beg   := DogDateBeg.Date;
 Date_End   := DogDateEnd.Date;
 Dog_Note   := Dog_Note_Memo.Text;
 FIO_Don    := FIO_DonGU.Text;
 FIO_Cust   := FIO_Postav.Text;
 ip_comp    := GetIPAddress;
 name_comp  := GetCompName;

 if Priznak_Vizova = 'add' then begin
  action := raAdd;

  StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_ARND_ADD';
  StoredProc.Prepare;

  StoredProc.ParamByName('ID_TIP_DOG').Value := id_Tip_Dog;
  StoredProc.ParamByName('N_DOG').Value := N_Dog;
  StoredProc.ParamByName('D_DOG').Value := D_Dog;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_Customer;
  StoredProc.ParamByName('NAME_CUSTOMER').Value := Name_Cust;
  StoredProc.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_Rate_Acc;
  StoredProc.ParamByName('DATE_BEG').Value := Date_Beg;
  StoredProc.ParamByName('DATE_END').Value := Date_End;
  StoredProc.ParamByName('DOG_NOTE').Value := Dog_Note;
  StoredProc.ParamByName('FIO_DONGU').Value := FIO_Don;
  StoredProc.ParamByName('FIO_POSTAV').Value := FIO_Cust;
  StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := rate_acc_un;
  StoredProc.ParamByName('IP_COMP').Value := ip_comp;
  StoredProc.ParamByName('NAME_COMP').Value := name_comp;
  StoredProc.ParamByName('ID_USER').Value := SYS_ID_USER;
//  StoredProc.ParamByName('summa').Value :=  PeriodTableView.DataController.Summary.FooterSummaryValues[1];
  StoredProc.ParamByName('sum_pay').Value := 0;
  StoredProc.ParamByName('sum_fulfil').Value := 0;
  StoredProc.ParamByName('ID_OTDEL').Value := id_otdel;
  StoredProc.ParamByName('ID_ARND_TYPE').Value := id_arnd_type;

  StoredProc.ExecProc;
{  StoredProc.ExecProcedure('DOG_DT_DOCUMENT_ARND_ADD', [id_Tip_Dog, N_Dog, D_Dog,
  id_Customer, Name_Cust, id_Rate_Acc, Date_Beg, Date_End, Dog_Note, FIO_Don, FIO_Cust,
  '31.12.9999', SYS_ID_USER, rate_acc_un, ip_comp]);
 }
  ID_DOG := StoredProc.FieldByName('ID_DOG').AsInt64;
 end
 else
 begin//начало обновления
  ID_DOG := id_Document;
  StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_ARND_UPD';
  StoredProc.Prepare;

  StoredProc.ParamByName('N_DOG').Value := N_Dog;
  StoredProc.ParamByName('D_DOG').Value := D_Dog;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_Customer;
  StoredProc.ParamByName('NAME_CUSTOMER').Value := Name_Cust;
  StoredProc.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_Rate_Acc;
  StoredProc.ParamByName('DATE_BEG').Value := Date_Beg;
  StoredProc.ParamByName('DATE_END').Value := Date_End;
  StoredProc.ParamByName('DOG_NOTE').Value := Dog_Note;
  StoredProc.ParamByName('FIO_DONGU').Value := FIO_Don;
  StoredProc.ParamByName('FIO_POSTAV').Value := FIO_Cust;
  StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := rate_acc_un;
  StoredProc.ParamByName('IP_COMP').Value := ip_comp;
  StoredProc.ParamByName('NAME_COMP').Value := name_comp;
  StoredProc.ParamByName('ID_USER').Value := SYS_ID_USER;
  StoredProc.ParamByName('ID_DOG').AsInt64 := ID_DOG;
  StoredProc.ParamByName('ID_OTDEL').Value := id_otdel;
  StoredProc.ParamByName('ID_ARND_TYPE').Value := id_arnd_type;

  StoredProc.ExecProc;

  ID_DOG := id_Document;
  StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_ARND_UPD';
  StoredProc.Prepare;



 end;//конец обновления

   with PeriodTableView.DataController do begin
    for i := 0 to RecordCount - 1 do begin
     if Values[i, 0] = 'ADD' then begin
      StoredProc.StoredProcName := 'DOG_DT_ARENDA_P_ADD';
      StoredProc.Prepare;

      StoredProc.ParamByName('ID_DOG').AsInt64   := ID_DOG;
      StoredProc.ParamByName('DATE_BEG').AsDate  := Values[i, 2];
      StoredProc.ParamByName('DATE_END').AsDate  := Values[i, 3];
      StoredProc.ParamByName('SUMMA').AsCurrency := Values[i, 4];

      StoredProc.ExecProc;

      ID_PER := StoredProc.FieldByName('ID_PERIOD').AsInteger;
     end
     else begin
      ID_PER := Values[i, 1];

      if Values[i, 0] = 'MOD' then begin
       StoredProc.StoredProcName := 'DOG_DT_ARENDA_P_MOD';
       StoredProc.Prepare;

       StoredProc.ParamByName('ID_PERIOD_PARAM').AsInteger := ID_PER;
       StoredProc.ParamByName('DATE_BEG_PARAM').AsDate  := Values[i, 2];
       StoredProc.ParamByName('DATE_END_PARAM').AsDate  := Values[i, 3];
       StoredProc.ParamByName('SUMMA_PARAM').AsCurrency := Values[i, 4];

       StoredProc.ExecProc;
      end;
     end;

     for j := 0 to Length(PeriodData) - 1 do begin
      if PeriodData[j]._id_Period <> Values[i, 1] then Continue;

      if PeriodData[j]._SmetState = 'ADD' then
       StoredProc.StoredProcName := 'DOG_DT_ARENDA_S_ADD'
      else
       StoredProc.StoredProcName := 'DOG_DT_ARENDA_S_MOD';

      StoredProc.Prepare;

      StoredProc.ParamByName('ID_PERIOD').AsInteger := ID_PER;
      StoredProc.ParamByName('ID_SMETA').AsInteger  := PeriodData[j]._id_S;
      StoredProc.ParamByName('ID_RAZD').AsInteger   := PeriodData[j]._id_R;
      StoredProc.ParamByName('ID_ST').AsInteger     := PeriodData[j]._id_St;
      StoredProc.ParamByName('ID_KEKV').AsInteger   := PeriodData[j]._id_Kekv;
      StoredProc.ParamByName('SUMMA').AsCurrency    := PeriodData[j]._Sum;

      StoredProc.ExecProc;
     end;
    end;
   end;

 for i := 0 to Length(DelPeriods) - 1 do
  StoredProc.ExecProcedure('DOG_DT_ARENDA_P_DEL', [DelPeriods[i]]);

 for i := 0 to Length(DelSmets) - 1 do
  StoredProc.ExecProcedure('DOG_DT_ARENDA_S_DEL', [DelSmets[i]._id_Period,
  DelSmets[i]._id_S, DelSmets[i]._id_R, DelSmets[i]._id_St, DelSmets[i]._id_Kekv]);

// id_dog
// dog_type
// pFIBStoredProc2.Transaction.StartTransaction;
// pFIBStoredProc2.StoredProcName:='ARND_AKT_PRIZN_INS';
// pFIBStoredProc2.Prepare;
// pFIBStoredProc2.ParamByName('id_dog').AsInteger:=id_dog;
// if CheckBox1.Checked=false then
// pFIBStoredProc2.ParamByName('dog_type').AsInteger:=0;
// if CheckBox1.Checked=true then
// pFIBStoredProc2.ParamByName('dog_type').AsInteger:=1;
// pFIBStoredProc2.ExecProc;
// pFIBStoredProc2.Transaction.Commit;

 WriteTransaction.Commit;

 //запись в реестр последнего id_department
 reg := TRegistry.Create;
 reg.OpenKey(REG_KEY + 'Otdel', true);
 try
  reg.WriteInteger('id_otdel', id_otdel);
 except
 end;
 reg.Free;

 if Assigned(fProc) then fProc(id_dog, action);
end;

destructor TArnd_Contract_Add_Form.Destroy;
begin
 Arnd_Contract_Add_Form := nil;
 inherited;
end;

procedure TArnd_Contract_Add_Form.SmetaTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SetLabels;
end;

procedure TArnd_Contract_Add_Form.SmetaTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
 k : integer;
begin
 if AItem.EditValue <> SmetaTableView.Controller.EditingController.Edit.EditValue then begin
  k := SmetaTableView.ViewData.DataController.FocusedRecordIndex;

  if SmetaTableView.ViewData.DataController.Values[k, 0] <> 'ADD' then SmetaTableView.ViewData.DataController.Values[k, 0] := 'MOD';
 end;
end;

procedure TArnd_Contract_Add_Form.CloneButtonClick(Sender: TObject);
var
 id_Period : integer;
 i, j, t   : integer;
 k         : integer;
 Date_Beg  : TDate;
 Date_End  : TDate;
 Sum       : extended;

 Periods   : TPeriodArray;
 TempData  : TPeriodDataArray;

 SelData   : TPeriodDataArray;
 SelPerSum : currency;
 MaxSum    : currency;
 PerSum    : currency;

 Flag      : boolean;

 a : TcxCustomEditData;
 p : TPeriod_Add_Form;

 InfIndex : variant;
 NewSum   : currency;
begin
 if NameCust.Text = '' then begin
  ShowMessage('Ви не вибрали постачальника!');
  Exit;
 end;

 k := PeriodTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 SaveSmets(PeriodTableView.DataController.Values[k, 1]);

 SelPerSum := PeriodTableView.DataController.Values[k, 4];

 for i := 0 to Length(PeriodData) - 1 do
  if PeriodData[i]._id_Period = PeriodTableView.DataController.Values[k, 1] then begin
   SetLength(SelData, Length(SelData) + 1);
   SelData[Length(SelData) - 1] := PeriodData[i];
  end;

 p := TPeriod_Add_Form.Create(Self);
 p.Caption := 'Додавання періоду';
 p.UseInflation := True;

 Date_Beg := Now - 1;

 with PeriodTableView.DataController do begin
  if FocusedRecordIndex >= 0 then SaveSmets(Values[FocusedRecordIndex, 1]);
 end;

 for i := 0 to PeriodTableView.DataController.RecordCount - 1 do
  if i = 0 then Date_Beg := PeriodTableView.DataController.Values[0, 3]
  else if Date_Beg < PeriodTableView.DataController.Values[i, 3] then Date_Beg := PeriodTableView.DataController.Values[i, 3];

 if PeriodTableView.DataController.RecordCount > 0 then p.Date_Beg_Edit.Date := Date_Beg + 1
 else p.Date_Beg_Edit.Date := DogDateBeg.Date;

 p.Date_End_Edit.Date := EndOfTheMonth(p.Date_Beg_Edit.Date);

 if p.ShowModal <> mrOk then Exit;

 with p do begin
  Date_Beg := Date_Beg_Edit.Date;
  Date_End := Date_End_Edit.Date;

  if RadioGroup.ItemIndex = 0 then begin
   InfIndex := index;
   Sum      := SelPerSum;
  end
  else begin
   InfIndex := null;
   Sum      := Summa_Edit.Value;
  end;
 end;

 id_Period := 0;

 with PeriodTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 1] > id_Period then id_Period := Values[i, 1];

   // Разбитие пересекающихся периодов
               //----- (0<->1)---------

  for i := 0 to RecordCount - 1 do begin
   if (Date_Beg > Values[i, 3]) or (Values[i, 2] > Date_End) then begin
    SetLength(Periods, Length(Periods) + 1);

    with Periods[Length(Periods) - 1] do begin
     _Per_State := Values[i, 0];
     _id_Period := Values[i, 1];
     _Date_Beg  := Values[i, 2];
     _Date_End  := Values[i, 3];
    end;
   end
   {0,0}
   else if (Values[i, 2] < Date_Beg) and (Values[i, 3] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;
   end
   {1,0}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 3] <= Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;
   end
   {1,1}
   else if (Values[i, 2] >= Date_Beg) and (Values[i, 2] <= Date_End) and (Values[i, 3] > Date_End) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 1);
    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end
   {0,1}
   else if (Date_Beg < Values[i, 2]) and (Date_End > Values[i, 3]) then begin
    if (Values[i, 0] = '') or (Values[i, 0] = 'MOD') then begin
     SetLength(DelPeriods, Length(DelPeriods) + 1);
     DelPeriods[Length(DelPeriods) - 1] := Values[i, 1];
    end;

    SetLength(Periods, Length(Periods) + 2);

    Inc(id_Period);
    with Periods[Length(Periods) - 2] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Values[i, 2];
     _Date_End  := Date_Beg - 1;
    end;

    Inc(id_Period);
    with Periods[Length(Periods) - 1] do begin
     _Per_State := 'ADD';
     _id_Period := id_Period;
     _Date_Beg  := Date_End + 1;
     _Date_End  := Values[i, 3];
    end;
   end;
  end;


  SetLength(Periods, Length(Periods) + 1);

  Inc(id_Period);
  with Periods[Length(Periods) - 1] do begin
   _Per_State := 'ADD';
   _id_Period := id_Period;
   _Date_Beg  := Date_Beg;
   _Date_End  := Date_End;
  end;

  Date_Beg := p.Date_Beg_Edit.Date;
  Date_End := p.Date_End_Edit.Date;

  PerSum   := 0;

  for i := 0 to Length(Periods) - 1 do begin
   for j := 0 to RecordCount - 1 do
    if (Periods[i]._Date_Beg >= Values[j, 2]) and (Periods[i]._Date_End <= Values[j, 3]) then begin
     if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) then Continue;

     Periods[i]._Sum := Values[j, 4];

     for t := 0 to Length(PeriodData) - 1 do
      if PeriodData[t]._id_Period = Values[j, 1] then begin
       SetLength(TempData, Length(TempData) + 1);

       TempData[Length(TempData) - 1] := PeriodData[t];

       with TempData[Length(TempData) - 1] do begin
        _id_Period := Periods[i]._id_Period;
        _SmetState := Periods[i]._Per_State;
       end;
      end;

     Break;
    end;

   if (Periods[i]._Date_Beg >= Date_Beg) and (Periods[i]._Date_End <= Date_End) then begin
    Periods[i]._Sum := Periods[i]._Sum + Sum;

    k := 0;
    MaxSum := SelData[0]._Sum;
    for j := 1 to Length(SelData) - 1 do
     if SelData[j]._Sum > MaxSum then begin
      k      := j;
      MaxSum := SelData[j]._Sum;
     end;

    for j := 0 to Length(SelData) - 1 do begin
     if j = k then Continue;

     SetLength(TempData, Length(TempData) + 1);

     TempData[Length(TempData) - 1] := SelData[j];

     with TempData[Length(TempData) - 1] do begin
      _id_Period := Periods[i]._id_Period;
      _SmetState := 'ADD';
      _Sum       := RoundTo(Sum * SelData[j]._Sum / SelPerSum, -2);

      PerSum     := PerSum + _Sum;
     end;
    end;

    SetLength(TempData, Length(TempData) + 1);

    TempData[Length(TempData) - 1] := SelData[k];

    with TempData[Length(TempData) - 1] do begin
     _id_Period := Periods[i]._id_Period;
     _SmetState := 'ADD';
     _Sum       := Sum - PerSum;
    end;
   end;
  end;

  PeriodData := nil;
  PeriodData := Copy(TempData, 0, Length(TempData));

  // Домножаю на индекс инфляции

  NewSum := 0;

  if not VarIsNull(InfIndex) then begin
   for i := 0 to Length(PeriodData) - 1 do begin
    if PeriodData[i]._id_Period <> id_Period then Continue;

    DataSet.Close;
    DataSet.SelectSQL.Text := 'select * from DOG_SP_INFLATION_SEL_ST(' + QuotedStr(DateToStr(Date_Beg))
    + ', ' + IntToStr(PeriodData[i]._id_St) + ')';

    DataSet.Open;

    if not VarIsNull(DataSet['RESULT']) then if DataSet['RESULT'] = 1 then PeriodData[i]._Sum := PeriodData[i]._Sum * InfIndex;

    NewSum := NewSum + PeriodData[i]._Sum;

    DataSet.Close;
   end;
  end
  else NewSum := Sum;

  RecordCount := 0;

  for i := 0 to Length(Periods) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := Periods[i]._Per_State;
   Values[RecordCount - 1, 1] := Periods[i]._id_Period;
   Values[RecordCount - 1, 2] := Periods[i]._Date_Beg;
   Values[RecordCount - 1, 3] := Periods[i]._Date_End;

   if Periods[i]._id_Period = id_Period then
    Values[RecordCount - 1, 4] := NewSum
   else
    Values[RecordCount - 1, 4] := Periods[i]._Sum;
  end;

  PeriodGrid.SetFocus;
  FocusedRecordIndex := RecordCount - 1;
 end;

 SmetaGrid.SetFocus;
 SmetaTableView.Controller.EditingController.EditingItem := SmetaTableView.Items[5];
end;

procedure TArnd_Contract_Add_Form.Action1Execute(Sender: TObject);
begin
 if BarManager.BarByName('PeriodBar').Visible then AddPeriodButtonClick(Sender);
end;

procedure TArnd_Contract_Add_Form.Action2Execute(Sender: TObject);
begin
 if BarManager.BarByName('SmetBar').Visible then AddSmetButtonClick(Sender);
end;

procedure TArnd_Contract_Add_Form.Action3Execute(Sender: TObject);
begin
 CancelButtonClick(Sender);
end;

procedure TArnd_Contract_Add_Form.S_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k        : integer;
 id       : variant;
 kod_S    : integer;
 kod_R    : integer;
 kod_St   : integer;
 id_S     : integer;
 id_R     : integer;
 id_St    : integer;
 Name_S   : string;
 Name_R   : string;
 Name_St  : string;
begin
 k := SmetaTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 id := GlobalSPR.GetSmets(self, Database.Handle, Now, psmRazdSt);

 if VarArrayDimCount(id) <= 0 then Exit;
 if id[0] = NULL then Exit;

 id_S    := id[0];
 id_R    := id[1];
 id_St   := id[2];
 Name_S  := id[6];
 Name_R  := id[4];
 Name_St := id[5];
 Kod_S   := id[9];
 Kod_R   := id[7];
 Kod_St  := id[8];

 with SmetaTableView.DataController do begin
  if Values[k, 0] <> 'ADD' then Values[k, 1] := 'MOD';

  Values[k, 1]  := kod_S;
  Values[k, 2]  := kod_R;
  Values[k, 3]  := kod_St;
  Values[k, 6]  := Name_R;
  Values[k, 7]  := Name_St;
  Values[k, 8]  := Name_S;
  Values[k, 9]  := id_S;
  Values[k, 10] := id_R;
  Values[k, 11] := id_St;
 end;

 SetLabels;
end;

procedure TArnd_Contract_Add_Form.Kekv_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k         : integer;
 id        : variant;

 id_Kekv   : variant;
 Kod_Kekv  : variant;
 Name_Kekv : variant;
begin
 k := SmetaTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 id := GlobalSPR.GetKEKVSpr(self, Database.Handle, FSNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id) = 0 then Exit;

 id_Kekv   := id[0][0];
 Name_Kekv := id[0][1];
 Kod_Kekv  := id[0][2];

 with SmetaTableView.DataController do begin
  Values[k, 4]  := Kod_Kekv;
  Values[k, 12] := id_Kekv;
  Values[k, 13] := Name_Kekv;
 end;

 SetLabels;
end;

procedure TArnd_Contract_Add_Form.SetLabels;
var
 k   : integer;
begin
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 KEKV_Label.Caption := '';

 k := SmetaTableView.ViewData.DataController.FocusedRecordIndex;

 if k >= 0 then begin
  with SmetaTableView.DataController do begin
   if not VarIsNull(Values[k, 6])  then S_Label.Caption    := Values[k, 6];
   if not VarIsNull(Values[k, 7])  then R_Label.Caption    := Values[k, 7];
   if not VarIsNull(Values[k, 8])  then St_Label.Caption   := Values[k, 8];
   if not VarIsNull(Values[k, 13]) then KEKV_Label.Caption := Values[k, 13];
  end;
 end;

 S_Label.Hint    := S_Label.Caption;
 R_Label.Hint    := R_Label.Caption;
 St_Label.Hint   := St_Label.Caption;
 KEKV_Label.Hint := KEKV_Label.Caption;
end;

procedure TArnd_Contract_Add_Form.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
  if VarIsClear(rate_acc_un) then rate_acc_un := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, Database.Handle, fsNormal, 'get', rate_acc_un);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      rate_acc_un := ret[0][0];
      cxButtonEdit_name_un.Text := ret[0][1];
      cxTextEdit_mfo_un.Text := ret[0][2];
      cxTextEdit_rsch_un.Text := ret[0][3];
      cxTextEdit_bank_un.Text := ret[0][4];
    end;
  end;
  end;
end;

procedure TArnd_Contract_Add_Form.Button1Click(Sender: TObject);
begin
  LoadDogManedger.ShowArndSch(Self,Database.Handle,ReadTransaction.Handle,WriteTransaction.Handle,fsMDIChild,1299,id_Document);
end;

procedure TArnd_Contract_Add_Form.Label3Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, Database.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsNormal, id_Document, -1);
end;

procedure TArnd_Contract_Add_Form.Label16Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, Database.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsNormal, id_Document, -1);
end;

procedure TArnd_Contract_Add_Form.Label3MouseLeave(Sender: TObject);
begin
  Label3.font.color := clBlack;
  Label3.font.Style := [fsBold];
end;

procedure TArnd_Contract_Add_Form.Label3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Label3.font.color := clBlue;
  Label3.font.Style := [fsUnderline];
end;

procedure TArnd_Contract_Add_Form.Label16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Label16.font.color := clBlue;
  Label16.font.Style := [fsUnderline];
end;

procedure TArnd_Contract_Add_Form.Label16MouseLeave(Sender: TObject);
begin
  Label16.font.color := clBlack;
  Label16.font.Style := [fsBold];
end;

procedure TArnd_Contract_Add_Form.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TArnd_Contract_Add_Form.cxButtonEdit_otdPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
  if (Priznak_vizova = 'prosmotr') or (Priznak_vizova = 'hist')  then Exit;
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Root_Department'] := DogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
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

procedure TArnd_Contract_Add_Form.PeriodTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_DELETE then if BarManager.BarByName('PeriodBar').Visible then DelPeriodButtonClick(Sender);
end;

procedure TArnd_Contract_Add_Form.SmetaTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 if Key = VK_DELETE then if BarManager.BarByName('SmetBar').Visible then DelSmetButtonClick(Sender)
 else with SmetaTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
     ShowMessage('ID_SM: '     + IntToStr(Values[k, 9]) + #13
               + 'ID_RZ: '     + IntToStr(Values[k, 10]) + #13
               + 'ID_ST: '     + IntToStr(Values[k, 11]) + #13
               + 'ID_KEKV: '   + IntToStr(Values[k, 12]));
  except
  end;
 end;
end;

procedure TArnd_Contract_Add_Form.dxBarButton1Click(Sender: TObject);
var
 i : integer;
 s : string;
begin
 s := '';
 for i := 0 to Length(PeriodData) - 1 do begin
  SaveSmets(PeriodData[i]._id_Period);

  s := s + #13 + inttostr(i) + ' [' + PeriodData[i]._SmetState + ']';
 end;

 ShowMessage(s);
end;

procedure TArnd_Contract_Add_Form.InflationButtonGetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);
begin
 AFont.Color := clRed;
end;

procedure TArnd_Contract_Add_Form.InflationButtonClick(Sender: TObject);
begin
 DoShowSP_Inflation(Self, Database.Handle, ReadTransaction.Handle, fsNormal);
end;

procedure TArnd_Contract_Add_Form.Summa_ColumnPropertiesEditValueChanged(
  Sender: TObject);
var
 k : integer;
begin
 k := PeriodTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with PeriodTableView.DataController do begin
  if Values[k, 0] <> 'ADD' then Values[k, 0] := 'MOD';
 end;
end;

procedure TArnd_Contract_Add_Form.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TAArray;
begin

  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Довiдник типiв оренди';
  i['CaptionEdit'].AsString := 'Тип аренды';
  i['TableName'].AsString := 'SP_ARND_TYPE';
  i['KEY_FIELD'].AsString := 'id_arnd_type';
  i['parent_field'].AsString := 'LINKTO';
  i['FIELDS'].AsString := 'arnd_type;kogo_predst;kto_predst;kem_uslugi;';
  i['FIELDS_caption'].AsString := 'Тип оренди;Представник;Заказник;Ким предоставлено;';
  i['SearchField'].AsString := 'arnd_type';
  i['AddProc'].AsString := 'SP_ARND_TYPE_INS';
  i['DelProc'].AsString := 'SP_ARND_TYPE_DEL';
  i['UpdProc'].AsString := 'SP_ARND_TYPE_UPD';
  i['DBHandle'].AsInteger := integer(Database.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

  cxButtonEdit1.Text := o['arnd_type'].AsString;
  id_arnd_type:=o['id_arnd_type'].AsInteger;
  end;
  i.Free;
  o.Free;

end;

procedure TArnd_Contract_Add_Form.saveExecute(Sender: TObject);
begin
 ApplyButtonClick(self);
end;

procedure TArnd_Contract_Add_Form.cxButton1Click(Sender: TObject);
// p : TfrmFavour;
begin
// p := TfrmFavour.Create(Self);
// p.Caption      := 'Справочник услуг аренді';
// if p.ShowModal <> mrOk then Exit;
end;

end.
