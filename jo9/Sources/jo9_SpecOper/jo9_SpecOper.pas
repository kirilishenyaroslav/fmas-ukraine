unit jo9_SpecOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxGroupBox, cxControls, cxContainer, cxEdit, cxMemo,
  StdCtrls, cxButtons, ExtCtrls, cxGridBandedTableView, cxClasses,
  cxStyles, cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxCurrencyEdit, cxButtonEdit, dxBar, cxSplitter,
  cxGridLevel, cxGridCustomTableView, cxGridCustomView, cxGrid, tagTypes,
  IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxLabel,
  cxCheckBox, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, RxMemDS,
  frxClass, frxDBSet;

type
  TProvRecord = packed record
   _IDD        : integer;
   _id_Prov    : variant;
   _id_Sch     : variant;
   _Num_Sch    : variant;
   _Name_Sch   : variant;
   _id_S       : variant;
   _id_R       : variant;
   _id_St      : variant;
   _id_Kekv    : variant;
   _Kod_S      : variant;
   _Kod_R      : variant;
   _Kod_St     : variant;
   _Kod_Kekv   : variant;
   _Name_S     : variant;
   _Name_R     : variant;
   _Name_St    : variant;
   _Name_Kekv  : variant;
   _Prov_Summa : variant;
   _State_Prov : variant;

   _is_Sec     : boolean;

   _Done_Sum   : currency;
   _Done       : boolean;
  end;

  TResProvRecord = packed record
   _DB_id_Dog       : variant;
   _DB_Name_Cust    : string;
   _DB_Name_Sh      : string;
   _DB_kod_Dog      : variant;
   _DB_id_Sch       : variant;
   _DB_id_S         : variant;
   _DB_id_R         : variant;
   _DB_id_St        : variant;
   _DB_id_Kekv      : variant;

   _KR_id_Dog       : variant;
   _KR_Name_Cust    : string;
   _KR_Name_Sh      : string;
   _KR_kod_Dog      : variant;
   _KR_id_Sch       : variant;
   _KR_id_S         : variant;
   _KR_id_R         : variant;
   _KR_id_St        : variant;
   _KR_id_Kekv      : variant;
   _KR_is_Active    : boolean;
   _KR_Need_Out_Doc : boolean;
   _KR_id_Cust      : integer;

   _DB_Reg_Num      : string;
   _DB_kod_Sch      : Variant;
   _DB_kod_S        : Variant;
   _DB_kod_R        : Variant;
   _DB_kod_St       : Variant;
   _DB_kod_Kekv     : Variant;

   _KR_Reg_Num      : string;
   _KR_kod_Sch      : Variant;
   _KR_kod_S        : Variant;
   _KR_kod_R        : Variant;
   _KR_kod_St       : Variant;
   _KR_kod_Kekv     : Variant;

   _DB_Name_Sch     : string;
   _DB_Name_S       : string;
   _DB_Name_R       : string;
   _DB_Name_St      : string;
   _DB_Name_Kekv    : string;

   _KR_Name_Sch     : string;
   _KR_Name_S       : string;
   _KR_Name_R       : string;
   _KR_Name_St      : string;
   _KR_Name_Kekv    : string;

   _Prov_Summa      : variant;

   _is_Sec          : boolean;
  end;

  TProvArray = array of TProvRecord;
  TResProvArray = array of TResProvRecord;

  PResProvArray = ^TResProvArray;

  Tjo9_SpecOper_Form = class(TForm)
    MainPanel: TPanel;
    Shape2: TShape;
    Shape1: TShape;
    DbDescrLabel: TLabel;
    KrDescrLabel: TLabel;
    KrNameLabel: TLabel;
    DbNameLabel: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    InfoMemo: TcxMemo;
    ViewButton: TcxButton;
    DocGroupBox: TcxGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    NumDoc: TcxTextEdit;
    DateDoc: TcxDateEdit;
    NoteMemo: TcxMemo;
    DbPanel: TPanel;
    Splitter_Db: TcxSplitter;
    Grid_Db: TcxGrid;
    TableView_Db: TcxGridTableView;
    Name_Customer_Column_Db: TcxGridColumn;
    id_Dog_Column_Db: TcxGridColumn;
    Kod_Dog_Column_Db: TcxGridColumn;
    Tip_Dog_Column_Db: TcxGridColumn;
    Reg_Num_Column_Db: TcxGridColumn;
    Summa_Column_Db: TcxGridColumn;
    Name_Shablon_Column_Db: TcxGridColumn;
    IDD_Column_Db: TcxGridColumn;
    id_Customer_Column_Db: TcxGridColumn;
    Grid_DbLevel: TcxGridLevel;
    DogDockControl_Db: TdxBarDockControl;
    BottomPanel_Db: TPanel;
    ProvGrid_Db: TcxGrid;
    ProvTableView_Db: TcxGridTableView;
    id_Prov_Column_Db: TcxGridColumn;
    id_Sch_Column_Db: TcxGridColumn;
    Num_Sch_Column_Db: TcxGridColumn;
    Name_Sch_Column_Db: TcxGridColumn;
    id_S_Column_Db: TcxGridColumn;
    id_R_Column_Db: TcxGridColumn;
    id_St_Column_Db: TcxGridColumn;
    Kod_S_Column_Db: TcxGridColumn;
    Kod_R_Column_Db: TcxGridColumn;
    Kod_St_Column_Db: TcxGridColumn;
    kod_Kekv_Column_Db: TcxGridColumn;
    Name_S_Column_Db: TcxGridColumn;
    Name_R_Column_Db: TcxGridColumn;
    Name_St_Column_Db: TcxGridColumn;
    Prov_Summa_Column_Db: TcxGridColumn;
    State_Prov_Column_Db: TcxGridColumn;
    id_Kekv_Column_Db: TcxGridColumn;
    Name_Kekv_Column_Db: TcxGridColumn;
    ProvGrid_DbLevel: TcxGridLevel;
    ProvDockControl_Db: TdxBarDockControl;
    KrPanel: TPanel;
    Splitter_Kr: TcxSplitter;
    Grid_Kr: TcxGrid;
    TableView_Kr: TcxGridTableView;
    Name_Customer_Column_Kr: TcxGridColumn;
    id_Dog_Column_Kr: TcxGridColumn;
    Kod_Dog_Column_Kr: TcxGridColumn;
    Tip_Dog_Column_Kr: TcxGridColumn;
    Reg_Num_Column_Kr: TcxGridColumn;
    Summa_Column_Kr: TcxGridColumn;
    Name_Shablon_Column_Kr: TcxGridColumn;
    IDD_Column_Kr: TcxGridColumn;
    id_Customer_Column_Kr: TcxGridColumn;
    is_Active_ColumnKr: TcxGridColumn;
    Need_Out_Doc_ColumnKr: TcxGridColumn;
    Grid_KrLevel: TcxGridLevel;
    DogDockControl_Kr: TdxBarDockControl;
    BottomPanel_Kr: TPanel;
    ProvGrid_Kr: TcxGrid;
    ProvTableView_Kr: TcxGridTableView;
    id_Prov_Column_Kr: TcxGridColumn;
    id_Sch_Column_Kr: TcxGridColumn;
    Num_Sch_Column_Kr: TcxGridColumn;
    Name_Sch_Column_Kr: TcxGridColumn;
    id_S_Column_Kr: TcxGridColumn;
    id_R_Column_Kr: TcxGridColumn;
    id_St_Column_Kr: TcxGridColumn;
    Kod_S_Column_Kr: TcxGridColumn;
    Kod_R_Column_Kr: TcxGridColumn;
    Kod_St_Column_Kr: TcxGridColumn;
    kod_Kekv_Column_Kr: TcxGridColumn;
    Name_S_Column_Kr: TcxGridColumn;
    Name_R_Column_Kr: TcxGridColumn;
    Name_St_Column_Kr: TcxGridColumn;
    Prov_Summa_Column_Kr: TcxGridColumn;
    State_Prov_Column_Kr: TcxGridColumn;
    id_Kekv_Column_Kr: TcxGridColumn;
    Name_Kekv_Column_Kr: TcxGridColumn;
    ProvGrid_KrLevel: TcxGridLevel;
    ProvDockControl_Kr: TdxBarDockControl;
    InfoPanel: TPanel;
    Shape: TShape;
    St_Label: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    Sch_Label: TLabel;
    Label8: TLabel;
    Kekv_Label: TLabel;
    SchGrid: TcxGrid;
    SchTableView: TcxGridTableView;
    id_Sch_Column2: TcxGridColumn;
    Num_Sch_Column2: TcxGridColumn;
    Name_Sch_Column2: TcxGridColumn;
    SchGridLevel: TcxGridLevel;
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
    N_StyleSheet: TcxGridTableViewStyleSheet;
    Cor_StyleSheet: TcxGridTableViewStyleSheet;
    BarManager: TdxBarManager;
    AddDogButton_Db: TdxBarButton;
    DelDogButton_Db: TdxBarButton;
    AddDogButton_Kr: TdxBarButton;
    DelDogButton_Kr: TdxBarButton;
    AddProvButton_Db: TdxBarButton;
    EditProvButton_Db: TdxBarButton;
    DelProvButton_Db: TdxBarButton;
    AddProvButton_Kr: TdxBarButton;
    EditProvButton_Kr: TdxBarButton;
    DelProvButton_Kr: TdxBarButton;
    EditDogButton_Db: TdxBarButton;
    EditDogButton_Kr: TdxBarButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    Timer: TTimer;
    FlashTimer: TTimer;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    PrintButton: TcxButton;
    PDataset: TfrxDBDataset;
    PMemoryData: TRxMemoryData;
    Report: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NumDocKeyPress(Sender: TObject; var Key: Char);
    procedure DateDocKeyPress(Sender: TObject; var Key: Char);
    procedure NoteMemoKeyPress(Sender: TObject; var Key: Char);
    procedure AddDogButton_DbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableView_DbFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AddDogButton_KrClick(Sender: TObject);
    procedure TableView_KrFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DelDogButton_DbClick(Sender: TObject);
    procedure DelProvButton_DbClick(Sender: TObject);
    procedure DelDogButton_KrClick(Sender: TObject);
    procedure DelProvButton_KrClick(Sender: TObject);
    procedure Reg_Num_Column_DbPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Reg_Num_Column_KrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kod_S_Column_DbPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kod_S_Column_KrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure Num_Sch_Column_DbPropertiesCloseUp(Sender: TObject);
    procedure Num_Sch_Column_DbPropertiesPopup(Sender: TObject);
    procedure Num_Sch_Column_KrPropertiesCloseUp(Sender: TObject);
    procedure Num_Sch_Column_KrPropertiesPopup(Sender: TObject);
    procedure SchTableViewDblClick(Sender: TObject);
    procedure kod_Kekv_Column_DbPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure kod_Kekv_Column_KrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditProvButton_DbClick(Sender: TObject);
    procedure EditProvButton_KrClick(Sender: TObject);
    procedure AddProvButton_DbClick(Sender: TObject);
    procedure AddProvButton_KrClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure Prov_Summa_Column_DbPropertiesEditValueChanged(
      Sender: TObject);
    procedure Prov_Summa_Column_KrPropertiesEditValueChanged(
      Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure ProvTableView_DbFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure TableView_DbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableView_KrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProvTableView_DbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProvTableView_KrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProvGrid_KrEnter(Sender: TObject);
    procedure ProvGrid_KrExit(Sender: TObject);
    procedure ProvGrid_DbExit(Sender: TObject);
    procedure ProvGrid_DbEnter(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure EditDogButton_DbClick(Sender: TObject);
    procedure EditDogButton_KrClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    { Private declarations }
  public
    SYS_INFO : Pjo9_SYS_INFO;
    Mode     : TSpecOperMode;
    Kredit   : boolean;

    ProvArray_Db : TProvArray;
    ProvArray_Kr : TProvArray;

    ResProv      : TResProvArray;

    Expand       : boolean;
    MemoLines    : TStringList;

    FlashTime    : integer;
    FlashDate    : boolean;
    FlashNum     : boolean;
    FlashMemo    : boolean;

    Processing   : boolean;

    ActualDate   : TDate;

    Apply        : boolean;

    PK_id        : variant;
    id_Out_Doc   : variant;

    procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
    procedure FlashInfoMemo;
    procedure ExpandInfoMemo;
    procedure CollapseInfoMemo;

    procedure SetLabels;

    procedure SelectAll(pk_id : int64);

    procedure SetProv_Db(idd, id_Prov : integer);
    procedure SetProv_Kr(idd, id_Prov : integer);
    function  CheckBudget_Db(Num : integer) : boolean;
    function  CheckBudget_Kr(Num : integer) : boolean;

    function  CheckCorrect(View : boolean) : boolean;
    function  FillResProv : boolean;
    function  SaveDoc : boolean;
    function  SaveOutDoc : boolean;
  end;

var
  jo9_SpecOper_Form: Tjo9_SpecOper_Form;

function SpecOp(SPEC_OPER_STRUCTURE : TSPEC_OPER_STRUCTURE): variant; stdcall;
exports  SpecOp;

implementation

uses Input_Sum, LoadDogManedger, DogLoaderUnit, GlobalSpr, Math, DateUtils, Kernel,
     jo9_SpecOper_View, tagLibUnit;

{$R *.dfm}

function SpecOp(SPEC_OPER_STRUCTURE : TSPEC_OPER_STRUCTURE): variant; stdcall;
var
 f : Tjo9_SpecOper_Form;
begin
 if SPEC_OPER_STRUCTURE.FS = fsNormal then begin
  jo9_SpecOper_Form := Tjo9_SpecOper_Form.Create(SPEC_OPER_STRUCTURE.AOwner);

  jo9_SpecOper_Form.SYS_INFO := SPEC_OPER_STRUCTURE.Info;
  jo9_SpecOper_Form.InitConnection(SPEC_OPER_STRUCTURE.DBHandle, SPEC_OPER_STRUCTURE.RTrans, SPEC_OPER_STRUCTURE.WTrans);

  jo9_SpecOper_Form.Mode       := SPEC_OPER_STRUCTURE.Mode;
  jo9_SpecOper_Form.Kredit     := SPEC_OPER_STRUCTURE.Kredit;
  jo9_SpecOper_Form.ActualDate := SPEC_OPER_STRUCTURE.ActualDate;

  if SPEC_OPER_STRUCTURE.Mode <> somAdd then begin
   jo9_SpecOper_Form.DateDoc.Date  := SPEC_OPER_STRUCTURE.DateDoc;
   jo9_SpecOper_Form.NoteMemo.Text := SPEC_OPER_STRUCTURE.Note;
   jo9_SpecOper_Form.NumDoc.Text   := SPEC_OPER_STRUCTURE.NumDoc;
   jo9_SpecOper_Form.PK_id         := SPEC_OPER_STRUCTURE.pk_id;
   jo9_SpecOper_Form.id_Out_Doc    := SPEC_OPER_STRUCTURE.id_out_doc;
  end
  else begin
   jo9_SpecOper_Form.DateDoc.Date := Now;
   jo9_SpecOper_Form.PK_id        := null;
   jo9_SpecOper_Form.id_Out_Doc   := null;
  end;

  GetFormParams(jo9_SpecOper_Form);

  jo9_SpecOper_Form.FormStyle := SPEC_OPER_STRUCTURE.FS;
  Result := jo9_SpecOper_Form.ShowModal;

  SetFormParams(jo9_SpecOper_Form);

  jo9_SpecOper_Form := nil;
 end
 else begin
  F := Tjo9_SpecOper_Form.Create(SPEC_OPER_STRUCTURE.AOwner);

  F.SYS_INFO := SPEC_OPER_STRUCTURE.Info;
  F.InitConnection(SPEC_OPER_STRUCTURE.DBHandle, SPEC_OPER_STRUCTURE.RTrans, SPEC_OPER_STRUCTURE.WTrans);

  F.Mode       := SPEC_OPER_STRUCTURE.Mode;
  F.Kredit     := SPEC_OPER_STRUCTURE.Kredit;
  F.ActualDate := SPEC_OPER_STRUCTURE.ActualDate;

  if SPEC_OPER_STRUCTURE.Mode <> somAdd then begin
   F.DateDoc.Date  := SPEC_OPER_STRUCTURE.DateDoc;
   F.NoteMemo.Text := SPEC_OPER_STRUCTURE.Note;
   F.NumDoc.Text   := SPEC_OPER_STRUCTURE.NumDoc;
   F.PK_id         := SPEC_OPER_STRUCTURE.pk_id;
   F.id_Out_Doc    := SPEC_OPER_STRUCTURE.id_out_doc;
  end
  else begin
   F.DateDoc.Date := Now;
   F.PK_id        := null;
   F.id_Out_Doc   := null;
  end;

  F.FormStyle := SPEC_OPER_STRUCTURE.FS;
  
  GetFormParams(F);

  F.Show;
 end;
end;

procedure Tjo9_SpecOper_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

procedure Tjo9_SpecOper_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

procedure Tjo9_SpecOper_Form.CancelButtonClick(Sender: TObject);
begin
 if (fsModal in FormState) then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_SpecOper_Form.FormShow(Sender: TObject);
var
 s : string;
 i : integer;
begin
 DataSet.SelectSQL.Text := 'select * from pub_sys_data';
 DataSet.Open;
 DataSet.Close;

 ApplyButton.Visible := (Mode <> somView);

 if Mode <> somAdd then SelectAll(pk_id);

 if Kredit then begin
  EditProvButton_Kr.Visible := ivNever;
  s := 'кредитового';
 end
 else begin
  EditProvButton_Db.Visible := ivNever;
  s := 'дебетового';
 end;

 if Mode = somView then begin
  Summa_Column_Db.Options.Focusing             := False;
  ProvTableView_Db.OptionsSelection.CellSelect := False;

  Summa_Column_Kr.Options.Focusing             := False;
  ProvTableView_Kr.OptionsSelection.CellSelect := False;

  BarManager.BarByName('DbProvToolBar').Visible := False;
  BarManager.BarByName('KrProvToolBar').Visible := False;
  BarManager.BarByName('DbDogToolBar').Visible  := False;
  BarManager.BarByName('KrDogToolBar').Visible  := False;

  NumDoc.Properties.ReadOnly   := True;
  DateDoc.Properties.ReadOnly  := True;
  NoteMemo.Properties.ReadOnly := True;

  NumDoc.Style.Color   := $00D9EBE0;
  DateDoc.Style.Color  := $00D9EBE0;
  NoteMemo.Style.Color := $00D9EBE0;
 end;

 Num_Sch_Column_Db.Options.Focusing  := not Kredit;
 Num_Sch_Column_Kr.Options.Focusing  := Kredit;

 if Mode = somAdd then Caption := 'Додавання ' + s + ' документа (Спеціальні операції)'
 else if Mode = somEdit then begin
  Caption := 'Редагування ' + s + ' документа (Спеціальні операції)';
  InfoMemo.Text := 'Документ відчинено для редагування';
 end
 else if Mode = somView then begin
  Caption := 'Перегляд ' + s + ' документа (Спеціальні операції)';
  InfoMemo.Text := 'Документ відчинено для перегляду';
 end;

 if Kredit then begin
  DbNameLabel.Caption := 'У дебет рахунків';
  KrNameLabel.Caption := 'Кредит ' + SYS_INFO^._Name_Sys;

  DbNameLabel.Font.Color := clWindowText;
  KrNameLabel.Font.Color := $009F0B0F;
 end
 else begin
  DbNameLabel.Caption := 'Дебет ' + SYS_INFO^._Name_Sys;
  KrNameLabel.Caption := 'У кредит рахунків';

  DbNameLabel.Font.Color := $009F0B0F;
  KrNameLabel.Font.Color := clWindowText;
 end;

 if Mode <> somView then begin
  with SchTableView.DataController do begin
   RecordCount := 0;

   for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do begin
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := SYS_INFO^._Native_Sch^[i]._id_Sch;
    Values[RecordCount - 1, 1] := SYS_INFO^._Native_Sch^[i]._Num_Sch;
    Values[RecordCount - 1, 2] := SYS_INFO^._Native_Sch^[i]._Name_Sch;
   end
  end;
 end;

 NumDoc.SetFocus;
end;

procedure Tjo9_SpecOper_Form.NumDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  DateDoc.SetFocus;
 end; 
end;

procedure Tjo9_SpecOper_Form.DateDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  NoteMemo.SetFocus;
 end;
end;

procedure Tjo9_SpecOper_Form.NoteMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Grid_Db.SetFocus;
 end;
end;

procedure Tjo9_SpecOper_Form.AddDogButton_DbClick(Sender: TObject);
var
 S        : TInput_Sum_Form;
 Sum      : currency;
 Res      : TDogResult;
 input    : TDogInput;
 i        : integer;
 id_Dog   : int64;
 kod_Dog  : int64;
 id_Prov  : integer;
 idd      : integer;

 Name_Cust : string;
 Reg_Num   : string;
begin
 if not Kredit then if Length(SYS_INFO^._Native_Sch^) = 0 then begin
  ShowMessage('Доступні рахунки відсутні!');
  Exit;
 end;

 S := TInput_Sum_Form.Create(Self);
 S.ShowExtras := True;
 S.Use_fSum := True;

 if S.ShowModal <> mrOk then Exit;

 Sum := S.SumEdit.Value;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := SYS_INFO^._id_Group_Dog_View;
 input.id_Group_add := SYS_INFO^._id_Group_Dog_Add;
 input.Summa        := Sum;

 if Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 with input.filter do begin
  bUseFilter      := True;
  bShowFilterForm := False;

  if S.fSumCheckBox.Checked then begin
   SummaFrom       := Sum;
   SummaTo         := Sum;
   bSumma          := True;
  end
  else bSumma      := False;

  ShowClosed      := 1;

  if S.CustCheckBox.Checked then begin
   NameCust  := S.CustEdit.Text;
   bNameCust := True;
  end
  else bNameCust := False;

  if S.RegNumCheckBox.Checked then begin
   RegNum  := S.RegNumEdit.Text;
   bRegNum := True;
  end
  else bRegNum := False;
 end;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

 with TableView_Db.DataController do begin
  idd := 0;
  for i := 0 to RecordCount - 1 do
   if Values[i, 7] > idd then idd := Values[i, 7];

  inc(idd);

  Name_Cust := Res.name_customer;

  DataSet.SelectSQL.Text := 'select FIO_COMBO, REGEST_NUM from PROC_DOG_DT_DOCUMENT_GET_INFO('
  + IntToStr(id_Dog) + ', ' + IntToStr(kod_Dog) + ')';
  DataSet.Open;

  if not VarIsNull(DataSet['FIO_COMBO']) then Name_Cust := DataSet['FIO_COMBO'];
  Reg_Num := DataSet.FieldByName('REGEST_NUM').AsString;

  DataSet.Close;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := Name_Cust;
  Values[RecordCount - 1, 1] := id_Dog;
  Values[RecordCount - 1, 2] := Kod_Dog;
  Values[RecordCount - 1, 3] := Res.name_tip_dog;
  Values[RecordCount - 1, 4] := Reg_Num;
  Values[RecordCount - 1, 5] := Sum;
  Values[RecordCount - 1, 6] := Res.name_shablon;
  Values[RecordCount - 1, 7] := IDD;
  Values[RecordCount - 1, 8] := Res.id_customer;
 end;

 id_Prov := 0;
 for i := 0 to Length(ProvArray_Db) - 1 do begin
  if ProvArray_Db[i]._id_Prov > id_Prov then id_Prov := ProvArray_Db[i]._id_Prov;
 end;

 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
   SetLength(ProvArray_Db, Length(ProvArray_Db) + 1);
   with ProvArray_Db[Length(ProvArray_Db) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    _id_S       := res.Smets[i].NumSmeta;
    _id_R       := res.Smets[i].NumRazd;
    _id_St      := res.Smets[i].NumStat;
    _id_Kekv    := res.Smets[i].NumKekv;
    _Prov_Summa := res.Smets[i].NSumma;
    _State_Prov := 'ADD';

    _is_Sec     := False;

    if not Kredit then begin
     _id_Sch    := SYS_INFO^._Native_Sch^[0]._id_Sch;
     _Num_Sch   := SYS_INFO^._Native_Sch^[0]._Num_Sch;
     _Name_Sch  := SYS_INFO^._Native_Sch^[0]._Name_Sch;
    end;

    DataSet.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(res.Smets[i].NumSmeta) + ')';
    DataSet.Open;
    _Kod_S  := DataSet['SMETA_KOD'];
    _Name_S := DataSet['SMETA_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumRazd) + ')';
    DataSet.Open;
    _Kod_R  := DataSet['RAZD_ST_NUM'];
    _Name_R := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumStat) + ')';
    DataSet.Open;
    _Kod_St  := DataSet['RAZD_ST_NUM'];
    _Name_St := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(res.Smets[i].NumKekv)
    + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;
    _Kod_Kekv  := DataSet['KEKV_CODE'];
    _Name_Kekv := DataSet['KEKV_TITLE'];
    DataSet.Close;

    if Kredit then CheckBudget_Db(Length(ProvArray_Db) - 1); // Selecting Budget automatically
   end;
  end;
 end
 else begin
  with TableView_Db.DataController do begin
   SetLength(ProvArray_Db, Length(ProvArray_Db) + 1);
   with ProvArray_Db[Length(ProvArray_Db) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    if not Kredit then begin
     _id_Sch    := SYS_INFO^._Native_Sch^[0]._id_Sch;
     _Num_Sch   := SYS_INFO^._Native_Sch^[0]._Num_Sch;
     _Name_Sch  := SYS_INFO^._Native_Sch^[0]._Name_Sch;
    end;

    _id_S       := -1;
    _id_R       := -1;
    _id_St      := -1;
    _Prov_Summa := Sum;
    _State_Prov := 'ADD';

    _Kod_S  := null;
    _Name_S := '';

    _Kod_R  := null;
    _Name_R := '';

    _Kod_St  := null;
    _Name_St := '';

    _Kod_Kekv   := null;

    _is_Sec     := False;
   end;
  end;
 end;

 TableView_Db.DataController.FocusedRecordIndex := TableView_Db.DataController.RecordCount - 1;
 if ProvTableView_Db.DataController.RecordCount > 0 then ProvTableView_Db.DataController.FocusedRecordIndex := 0;
end;

procedure Tjo9_SpecOper_Form.FlashInfoMemo;
begin
 InfoMemo.Text := '';
 Expand        := False;
 Timer.Enabled := True;
end;

procedure Tjo9_SpecOper_Form.FormCreate(Sender: TObject);
begin
 MemoLines := TStringList.Create;

 // Дебетовая часть

 Name_Customer_Column_Db.DataBinding.ValueTypeClass := TcxStringValueType;
 id_Dog_Column_Db.DataBinding.ValueTypeClass        := TcxVariantValueType;
 Kod_Dog_Column_Db.DataBinding.ValueTypeClass       := TcxVariantValueType;
 Tip_Dog_Column_Db.DataBinding.ValueTypeClass       := TcxStringValueType;
 Reg_Num_Column_Db.DataBinding.ValueTypeClass       := TcxStringValueType;
 Summa_Column_Db.DataBinding.ValueTypeClass         := TcxCurrencyValueType;
 Name_Shablon_Column_Db.DataBinding.ValueTypeClass  := TcxStringValueType;
 IDD_Column_Db.DataBinding.ValueTypeClass           := TcxIntegerValueType;
 id_Customer_Column_Db.DataBinding.ValueTypeClass   := TcxIntegerValueType;

 id_Prov_Column_Db.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 id_Sch_Column_Db.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Num_Sch_Column_Db.DataBinding.ValueTypeClass       := TcxStringValueType;
 Name_Sch_Column_Db.DataBinding.ValueTypeClass      := TcxStringValueType;
 id_S_Column_Db.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_R_Column_Db.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_St_Column_Db.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_S_Column_Db.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_R_Column_Db.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_St_Column_Db.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Name_S_Column_Db.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_R_Column_Db.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_St_Column_Db.DataBinding.ValueTypeClass       := TcxStringValueType;
 Prov_Summa_Column_Db.DataBinding.ValueTypeClass    := TcxCurrencyValueType;
 State_Prov_Column_Db.DataBinding.ValueTypeClass    := TcxStringValueType;
 id_Kekv_Column_Db.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 kod_Kekv_Column_Db.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 Name_Kekv_Column_Db.DataBinding.ValueTypeClass     := TcxStringValueType;

// Кредитовая часть

 Name_Customer_Column_Kr.DataBinding.ValueTypeClass := TcxStringValueType;
 id_Dog_Column_Kr.DataBinding.ValueTypeClass        := TcxVariantValueType;
 Kod_Dog_Column_Kr.DataBinding.ValueTypeClass       := TcxVariantValueType;
 Tip_Dog_Column_Kr.DataBinding.ValueTypeClass       := TcxStringValueType;
 Reg_Num_Column_Kr.DataBinding.ValueTypeClass       := TcxStringValueType;
 Summa_Column_Kr.DataBinding.ValueTypeClass         := TcxCurrencyValueType;
 Name_Shablon_Column_Kr.DataBinding.ValueTypeClass  := TcxStringValueType;
 IDD_Column_Kr.DataBinding.ValueTypeClass           := TcxIntegerValueType;
 id_Customer_Column_Kr.DataBinding.ValueTypeClass   := TcxIntegerValueType;

 id_Prov_Column_Kr.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 id_Sch_Column_Kr.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Num_Sch_Column_Kr.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Sch_Column_Kr.DataBinding.ValueTypeClass     := TcxStringValueType;
 id_S_Column_Kr.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_R_Column_Kr.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_St_Column_Kr.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_S_Column_Kr.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_R_Column_Kr.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_St_Column_Kr.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Name_S_Column_Kr.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_R_Column_Kr.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_St_Column_Kr.DataBinding.ValueTypeClass       := TcxStringValueType;
 Prov_Summa_Column_Kr.DataBinding.ValueTypeClass    := TcxCurrencyValueType;
 State_Prov_Column_Kr.DataBinding.ValueTypeClass    := TcxStringValueType;
 id_Kekv_Column_Kr.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 kod_Kekv_Column_Kr.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 Name_Kekv_Column_Kr.DataBinding.ValueTypeClass     := TcxStringValueType;
 is_Active_ColumnKr.DataBinding.ValueTypeClass      := TcxBooleanValueType;
 Need_Out_Doc_ColumnKr.DataBinding.ValueTypeClass   := TcxBooleanValueType;

 id_Sch_Column2.DataBinding.ValueTypeClass       := TcxStringValueType;
 Num_Sch_Column2.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Sch_Column2.DataBinding.ValueTypeClass     := TcxStringValueType;


 Sch_Label.Caption := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';
end;

procedure Tjo9_SpecOper_Form.TableView_DbFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = nil then SetProv_Db(-1, -1)
 else begin
  if not VarIsNull(AFocusedRecord.Values[1]) then SetProv_Db(AFocusedRecord.Values[7], -1);

  Reg_Num_Column_Db.Options.Focusing := VarAsType(AFocusedRecord.Values[6], varString) <> '';
 end;
end;

procedure Tjo9_SpecOper_Form.SetProv_Db(idd, id_Prov: integer);
var
 i : integer;
begin
 ProvTableView_Db.DataController.RecordCount := 0;

 for i := 0 to Length(ProvArray_Db) - 1 do begin
  if (ProvArray_Db[i]._IDD <> idd) or (ProvArray_Db[i]._State_Prov = 'DEL') then Continue;

  with ProvTableView_Db.DataController do begin
   RecordCount := RecordCount + 1;

   if ProvArray_Db[i]._id_Prov = id_Prov then FocusedRecordIndex := RecordCount - 1;

   Values[RecordCount - 1, 0]  := ProvArray_Db[i]._id_Prov;
   Values[RecordCount - 1, 1]  := ProvArray_Db[i]._id_Sch;
   Values[RecordCount - 1, 2]  := ProvArray_Db[i]._Num_Sch;
   Values[RecordCount - 1, 3]  := ProvArray_Db[i]._Name_Sch;
   Values[RecordCount - 1, 4]  := ProvArray_Db[i]._id_S;
   Values[RecordCount - 1, 5]  := ProvArray_Db[i]._id_R;
   Values[RecordCount - 1, 6]  := ProvArray_Db[i]._id_St;
   Values[RecordCount - 1, 7]  := ProvArray_Db[i]._Kod_S;
   Values[RecordCount - 1, 8]  := ProvArray_Db[i]._Kod_R;
   Values[RecordCount - 1, 9]  := ProvArray_Db[i]._Kod_St;
   Values[RecordCount - 1, 10] := ProvArray_Db[i]._Kod_Kekv;
   Values[RecordCount - 1, 11] := ProvArray_Db[i]._Name_S;
   Values[RecordCount - 1, 12] := ProvArray_Db[i]._Name_R;
   Values[RecordCount - 1, 13] := ProvArray_Db[i]._Name_St;
   Values[RecordCount - 1, 14] := ProvArray_Db[i]._Prov_Summa;
   Values[RecordCount - 1, 15] := ProvArray_Db[i]._State_Prov;
   Values[RecordCount - 1, 16] := ProvArray_Db[i]._id_Kekv;
   Values[RecordCount - 1, 17] := ProvArray_Db[i]._Name_Kekv;
  end;
 end;

 with ProvTableView_Db.DataController do if (FocusedRecordIndex < 0) and (RecordCount > 0) then FocusedRecordIndex := 0;

 SetLabels;
end;

procedure Tjo9_SpecOper_Form.AddDogButton_KrClick(Sender: TObject);
var
 S        : TInput_Sum_Form;
 Sum      : currency;
 Res      : TDogResult;
 input    : TDogInput;
 i        : integer;
 id_Dog   : int64;
 kod_Dog  : int64;
 id_Prov  : integer;
 idd      : integer;

 Need_Out_Doc : boolean;
 is_Acttive   : boolean;

 Name_Cust    : string;
 Reg_Num      : string;
begin
 if Kredit then if Length(SYS_INFO^._Native_Sch^) = 0 then begin
  ShowMessage('Доступні рахунки відсутні!');
  Exit;
 end;

 S := TInput_Sum_Form.Create(Self);
 S.ShowExtras := True;
 S.Use_fSum := True;

 if S.ShowModal <> mrOk then Exit;

 Sum := S.SumEdit.Value;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := SYS_INFO^._id_Group_Dog_View;
 input.id_Group_add := SYS_INFO^._id_Group_Dog_Add;
 input.Summa        := Sum;

 if Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 with input.filter do begin
  bUseFilter      := True;
  bShowFilterForm := False;

  if S.fSumCheckBox.Checked then begin
   SummaFrom       := Sum;
   SummaTo         := Sum;
   bSumma          := True;
  end
  else bSumma      := False;

  ShowClosed      := 1;

  if S.CustCheckBox.Checked then begin
   NameCust  := S.CustEdit.Text;
   bNameCust := True;
  end
  else bNameCust := False;

  if S.RegNumCheckBox.Checked then begin
   RegNum  := S.RegNumEdit.Text;
   bRegNum := True;
  end
  else bRegNum := False;
 end;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

 DataSet.SelectSQL.Text := 'select result from PUB_SP_TIP_DOG_BELONG_GROUP('
 + IntToStr(res.id_tip_dog) + ', 32)';
 DataSet.Open;

 Need_Out_Doc := (DataSet.Fields[0].AsInteger = 1);

 DataSet.Close;

 DataSet.SelectSQL.Text := 'select TIP_ACTIVE from DOG_GET_ACTIVE_BY_ID_DOG('
 + IntToStr(kod_dog) + ')';
 DataSet.Open;

 is_Acttive := (DataSet.Fields[0].AsInteger = -1);

 DataSet.Close;

 with TableView_Kr.DataController do begin
  idd := 0;
  for i := 0 to RecordCount - 1 do
   if Values[i, 7] > idd then idd := Values[i, 7];

  inc(idd);

  Name_Cust := Res.name_customer;

  DataSet.SelectSQL.Text := 'select FIO_COMBO, REGEST_NUM from PROC_DOG_DT_DOCUMENT_GET_INFO('
  + IntToStr(id_Dog) + ', ' + IntToStr(kod_Dog) + ')';
  DataSet.Open;

  if not VarIsNull(DataSet['FIO_COMBO']) then Name_Cust := DataSet['FIO_COMBO'];
  Reg_Num := DataSet.FieldByName('REGEST_NUM').AsString;

  DataSet.Close;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0]  := Name_Cust;
  Values[RecordCount - 1, 1]  := id_Dog;
  Values[RecordCount - 1, 2]  := Kod_Dog;
  Values[RecordCount - 1, 3]  := Res.name_tip_dog;
  Values[RecordCount - 1, 4]  := Reg_Num;
  Values[RecordCount - 1, 5]  := Sum;
  Values[RecordCount - 1, 6]  := Res.name_shablon;
  Values[RecordCount - 1, 7]  := IDD;
  Values[RecordCount - 1, 8]  := Res.id_customer;
  Values[RecordCount - 1, 9]  := is_Acttive;
  Values[RecordCount - 1, 10] := Need_Out_Doc;
 end;

 id_Prov := 0;
 for i := 0 to Length(ProvArray_Kr) - 1 do begin
  if ProvArray_Kr[i]._id_Prov > id_Prov then id_Prov := ProvArray_Kr[i]._id_Prov;
 end;

 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
   SetLength(ProvArray_Kr, Length(ProvArray_Kr) + 1);
   with ProvArray_Kr[Length(ProvArray_Kr) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    _id_S       := res.Smets[i].NumSmeta;
    _id_R       := res.Smets[i].NumRazd;
    _id_St      := res.Smets[i].NumStat;
    _id_Kekv    := res.Smets[i].NumKekv;
    _Prov_Summa := res.Smets[i].NSumma;
    _State_Prov := 'ADD';

    _is_Sec     := False;

    if Kredit then begin
     _id_Sch    := SYS_INFO^._Native_Sch^[0]._id_Sch;
     _Num_Sch   := SYS_INFO^._Native_Sch^[0]._Num_Sch;
     _Name_Sch  := SYS_INFO^._Native_Sch^[0]._Name_Sch;
    end;

    DataSet.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(res.Smets[i].NumSmeta) + ')';
    DataSet.Open;
    _Kod_S  := DataSet['SMETA_KOD'];
    _Name_S := DataSet['SMETA_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumRazd) + ')';
    DataSet.Open;
    _Kod_R  := DataSet['RAZD_ST_NUM'];
    _Name_R := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumStat) + ')';
    DataSet.Open;
    _Kod_St  := DataSet['RAZD_ST_NUM'];
    _Name_St := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(res.Smets[i].NumKekv)
    + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;
    _Kod_Kekv  := DataSet['KEKV_CODE'];
    _Name_Kekv := DataSet['KEKV_TITLE'];
    DataSet.Close;

    if not Kredit then CheckBudget_Kr(Length(ProvArray_Kr) - 1); // Selecting Budget automatically
   end;
  end;
 end
 else begin
  with TableView_Kr.DataController do begin
   SetLength(ProvArray_Kr, Length(ProvArray_Kr) + 1);
   with ProvArray_Kr[Length(ProvArray_Kr) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    if not Kredit then begin
     _id_Sch    := SYS_INFO^._Native_Sch^[0]._id_Sch;
     _Num_Sch   := SYS_INFO^._Native_Sch^[0]._Num_Sch;
     _Name_Sch  := SYS_INFO^._Native_Sch^[0]._Name_Sch;
    end;

    _id_S       := -1;
    _id_R       := -1;
    _id_St      := -1;
    _Prov_Summa := Sum;
    _State_Prov := 'ADD';

    _Kod_S  := null;
    _Name_S := '';

    _Kod_R  := null;
    _Name_R := '';

    _Kod_St  := null;
    _Name_St := '';

    _Kod_Kekv   := null;

    _is_Sec     := False;
   end;
  end;
 end;

 TableView_Kr.DataController.FocusedRecordIndex := TableView_Kr.DataController.RecordCount - 1;
 if ProvTableView_Kr.DataController.RecordCount > 0 then ProvTableView_Kr.DataController.FocusedRecordIndex := 0;
end;

procedure Tjo9_SpecOper_Form.TableView_KrFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = nil then SetProv_Kr(-1, -1)
 else begin
  if not VarIsNull(AFocusedRecord.Values[1]) then SetProv_Kr(AFocusedRecord.Values[7], -1);

  Reg_Num_Column_Kr.Options.Focusing := VarAsType(AFocusedRecord.Values[6], varString) <> '';
 end;
end;

procedure Tjo9_SpecOper_Form.SetProv_Kr(idd, id_Prov: integer);
var
 i : integer;
begin
 ProvTableView_Kr.DataController.RecordCount := 0;

 for i := 0 to Length(ProvArray_Kr) - 1 do begin
  if (ProvArray_Kr[i]._IDD <> idd) or (ProvArray_Kr[i]._State_Prov = 'DEL') then Continue;

  with ProvTableView_Kr.DataController do begin
   RecordCount := RecordCount + 1;

   if ProvArray_Kr[i]._id_Prov = id_Prov then FocusedRecordIndex := RecordCount - 1;

   Values[RecordCount - 1, 0]  := ProvArray_Kr[i]._id_Prov;
   Values[RecordCount - 1, 1]  := ProvArray_Kr[i]._id_Sch;
   Values[RecordCount - 1, 2]  := ProvArray_Kr[i]._Num_Sch;
   Values[RecordCount - 1, 3]  := ProvArray_Kr[i]._Name_Sch;
   Values[RecordCount - 1, 4]  := ProvArray_Kr[i]._id_S;
   Values[RecordCount - 1, 5]  := ProvArray_Kr[i]._id_R;
   Values[RecordCount - 1, 6]  := ProvArray_Kr[i]._id_St;
   Values[RecordCount - 1, 7]  := ProvArray_Kr[i]._Kod_S;
   Values[RecordCount - 1, 8]  := ProvArray_Kr[i]._Kod_R;
   Values[RecordCount - 1, 9]  := ProvArray_Kr[i]._Kod_St;
   Values[RecordCount - 1, 10] := ProvArray_Kr[i]._Kod_Kekv;
   Values[RecordCount - 1, 11] := ProvArray_Kr[i]._Name_S;
   Values[RecordCount - 1, 12] := ProvArray_Kr[i]._Name_R;
   Values[RecordCount - 1, 13] := ProvArray_Kr[i]._Name_St;
   Values[RecordCount - 1, 14] := ProvArray_Kr[i]._Prov_Summa;
   Values[RecordCount - 1, 15] := ProvArray_Kr[i]._State_Prov;
   Values[RecordCount - 1, 16] := ProvArray_Kr[i]._id_Kekv;
   Values[RecordCount - 1, 17] := ProvArray_Kr[i]._Name_Kekv;
  end;
 end;

 with ProvTableView_Kr.DataController do if (FocusedRecordIndex < 0) and (RecordCount > 0) then FocusedRecordIndex := 0;

 SetLabels;
end;

procedure Tjo9_SpecOper_Form.DelDogButton_DbClick(Sender: TObject);
var
 k    : integer;
 i, j : integer;
 b    : boolean;
 n    : integer;
begin
 with TableView_Db.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити усі проводки по цьому договору?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;


  i := 0;
  while i <= ProvTableView_Db.DataController.RecordCount - 1 do
   if ProvTableView_Db.DataController.Values[i, 15] <> 'ADD' then begin
    ProvTableView_Db.DataController.Values[i, 15] := 'DEL';
    Inc(i);
   end
   else begin
    b := False;
    for j := 0 to Length(ProvArray_Db) - 1 do
     if ProvArray_Db[j]._id_Prov = ProvTableView_Db.DataController.Values[i, 0] then begin
      b := True;
      Break;
     end;

    if b then begin
     for n := j + 1 to Length(ProvArray_Db) - 1 do
      ProvArray_Db[n - 1] := ProvArray_Db[n];

     SetLength(ProvArray_Db, Length(ProvArray_Db) - 1);
    end;

    ProvTableView_Db.DataController.DeleteRecord(i);
   end;

  if k + 1 < RecordCount then FocusedRecordIndex := k + 1
  else if k - 1 >=0 then FocusedRecordIndex := k - 1;

  DeleteRecord(k);
 end;
end;

procedure Tjo9_SpecOper_Form.DelProvButton_DbClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i, n    : integer;
 Flag    : boolean;
 id_Prov : integer;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити цю проводку?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  Flag := False;
  for i := 0 to Length(ProvArray_Db) - 1 do
   if ProvArray_Db[i]._id_Prov = Values[k, 0] then begin
    if ProvArray_Db[i]._State_Prov <> 'ADD' then ProvArray_Db[i]._State_Prov := 'DEL'
    else Flag := True;
    Break;
   end;

  if Flag then begin
   for n := i + 1 to Length(ProvArray_Db) - 1 do
    ProvArray_Db[n - 1] := ProvArray_Db[n];

   SetLength(ProvArray_Db, Length(ProvArray_Db) - 1);
  end;

  id_Prov := -1;

  if k + 1 < RecordCount then id_Prov := Values[k + 1, 0]
  else if k - 1 >= 0 then id_Prov := Values[k - 1, 0];

  SetProv_Db(TableView_Db.DataController.Values[Rec, 7], id_Prov);

  ProvGrid_Db.SetFocus;
 end;
end;

procedure Tjo9_SpecOper_Form.DelDogButton_KrClick(Sender: TObject);
var
 k    : integer;
 i, j : integer;
 b    : boolean;
 n    : integer;
begin
 with TableView_Kr.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити усі проводки по цьому договору?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;


  i := 0;
  while i <= ProvTableView_Kr.DataController.RecordCount - 1 do
   if ProvTableView_Kr.DataController.Values[i, 15] <> 'ADD' then begin
    ProvTableView_Kr.DataController.Values[i, 15] := 'DEL';
    Inc(i);
   end
   else begin
    b := False;
    for j := 0 to Length(ProvArray_Kr) - 1 do
     if ProvArray_Kr[j]._id_Prov = ProvTableView_Kr.DataController.Values[i, 0] then begin
      b := True;
      Break;
     end;

    if b then begin
     for n := j + 1 to Length(ProvArray_Kr) - 1 do
      ProvArray_Kr[n - 1] := ProvArray_Kr[n];

     SetLength(ProvArray_Kr, Length(ProvArray_Kr) - 1);
    end;

    ProvTableView_Kr.DataController.DeleteRecord(i);
   end;

  if k + 1 < RecordCount then FocusedRecordIndex := k + 1
  else if k - 1 >=0 then FocusedRecordIndex := k - 1;

  DeleteRecord(k);
 end;
end;

procedure Tjo9_SpecOper_Form.DelProvButton_KrClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i, n    : integer;
 Flag    : boolean;
 id_Prov : integer;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити цю проводку?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  Flag := False;
  for i := 0 to Length(ProvArray_Kr) - 1 do
   if ProvArray_Kr[i]._id_Prov = Values[k, 0] then begin
    if ProvArray_Kr[i]._State_Prov <> 'ADD' then ProvArray_Kr[i]._State_Prov := 'DEL'
    else Flag := True;
    Break;
   end;

  if Flag then begin
   for n := i + 1 to Length(ProvArray_Kr) - 1 do
    ProvArray_Kr[n - 1] := ProvArray_Kr[n];

   SetLength(ProvArray_Kr, Length(ProvArray_Kr) - 1);
  end;

  id_Prov := -1;

  if k + 1 < RecordCount then id_Prov := Values[k + 1, 0]
  else if k - 1 >= 0 then id_Prov := Values[k - 1, 0];

  SetProv_Kr(TableView_Db.DataController.Values[Rec, 7], id_Prov);

  ProvGrid_Db.SetFocus;
 end;
end;

procedure Tjo9_SpecOper_Form.Reg_Num_Column_DbPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := TableView_Db.DataController.FocusedRecordIndex;

 ResProc := nil;

 with TableView_Db.DataController do begin
  if VarIsNull(Values[k, 1]) then Exit;
  if VarIsNull(Values[k, 6]) then Exit;
  if Values[k, 6] = '' then Exit;

  LoadDogManedger.LoadShablon(self, Database.Handle, fsMDIChild, Values[k, 1], 'prosmotr', -1, PChar(String(Values[k, 6])), ResProc);
 end;
end;

procedure Tjo9_SpecOper_Form.Reg_Num_Column_KrPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := TableView_Kr.DataController.FocusedRecordIndex;

 ResProc := nil;

 with TableView_Kr.DataController do begin
  if VarIsNull(Values[k, 1]) then Exit;
  if VarIsNull(Values[k, 6]) then Exit;
  if Values[k, 6] = '' then Exit;

  LoadDogManedger.LoadShablon(self, Database.Handle, fsMDIChild, Values[k, 1], 'prosmotr', -1, PChar(String(Values[k, 6])), ResProc);
 end;
end;

procedure Tjo9_SpecOper_Form.Kod_S_Column_DbPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec : integer;
 k   : integer;
 id  : variant;
 i   : integer;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Db.DataController do begin
  k  := FocusedRecordIndex;

  id := GlobalSPR.GetSmets(Self, Database.Handle, ActualDate, psmRazdSt);

  if VarArrayDimCount(id) <= 0 then Exit;
  if id[0] = NULL then Exit;

  for i := 0 to Length(ProvArray_Db) - 1 do
   if (Integer(ProvArray_Db[i]._IDD) = TableView_Db.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Db[i]._id_Prov) = Values[k, 0])
   and not ProvArray_Db[i]._is_Sec
   then begin
    with ProvArray_Db[i] do begin
     _id_S    := id[0];
     _id_R    := id[1];
     _id_St   := id[2];
     _Name_S  := id[6];
     _Name_R  := id[4];
     _Name_St := id[5];
     _Kod_S   := id[9];
     _Kod_R   := id[7];
     _Kod_St  := id[8];

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    if Kredit then CheckBudget_Db(i);
    SetProv_Db(TableView_Db.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end;
end;

function Tjo9_SpecOper_Form.CheckBudget_Db(Num: integer): boolean;
begin
 Result := False;

 if Num >= Length(ProvArray_Db) then Exit;

 with ProvArray_Db[Num] do begin
  DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(_id_S)
  + ',' + IntToStr(_id_R) + ',' + IntToStr(_id_St) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
  DataSet.Open;

  if DataSet['RESULT'] = 0 then begin
   MemoLines.Add(DataSet['RESULT_MESSAGE']);
   FlashInfoMemo;
  end
  else begin
   Result := True;

   _id_Sch   := DataSet['ID_FOND'];
   _Num_Sch  := DataSet['FOND_NUM'];
   _Name_Sch := DataSet['FOND_TITLE'];
  end;

  DataSet.Close;
 end;
end;

function Tjo9_SpecOper_Form.CheckBudget_Kr(Num: integer): boolean;
begin
 Result := False;

 if Num >= Length(ProvArray_Kr) then Exit;

 with ProvArray_Kr[Num] do begin
  DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(_id_S)
  + ',' + IntToStr(_id_R) + ',' + IntToStr(_id_St) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
  DataSet.Open;

  if DataSet['RESULT'] = 0 then begin
   MemoLines.Add(DataSet['RESULT_MESSAGE']);
   FlashInfoMemo;
  end
  else begin
   Result := True;

   _id_Sch   := DataSet['ID_FOND'];
   _Num_Sch  := DataSet['FOND_NUM'];
   _Name_Sch := DataSet['FOND_TITLE'];
  end;

  DataSet.Close;
 end;
end;

procedure Tjo9_SpecOper_Form.Kod_S_Column_KrPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec : integer;
 k   : integer;
 id  : variant;
 i   : integer;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Kr.DataController do begin
  k  := FocusedRecordIndex;

  id := GlobalSPR.GetSmets(Self, Database.Handle, ActualDate, psmRazdSt);

  if VarArrayDimCount(id) <= 0 then Exit;
  if id[0] = NULL then Exit;

  for i := 0 to Length(ProvArray_Kr) - 1 do
   if (Integer(ProvArray_Kr[i]._IDD) = TableView_Kr.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Kr[i]._id_Prov) = Values[k, 0])
   and not ProvArray_Kr[i]._is_Sec
   then begin
    with ProvArray_Kr[i] do begin
     _id_S    := id[0];
     _id_R    := id[1];
     _id_St   := id[2];
     _Name_S  := id[6];
     _Name_R  := id[4];
     _Name_St := id[5];
     _Kod_S   := id[9];
     _Kod_R   := id[7];
     _Kod_St  := id[8];

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    if not Kredit then CheckBudget_Kr(i);
    SetProv_Kr(TableView_Kr.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end;
end;

procedure Tjo9_SpecOper_Form.TimerTimer(Sender: TObject);
begin
 if Expand then ExpandInfoMemo
 else CollapseInfoMemo;
end;

procedure Tjo9_SpecOper_Form.FlashTimerTimer(Sender: TObject);
begin
 if FlashNum then begin
  if NumDoc.Style.Color = clInfoBk then NumDoc.Style.Color := $00F7EAD9 else NumDoc.Style.Color := clInfoBk;
 end;

 if FlashDate then begin
  if DateDoc.Style.Color = clRed then DateDoc.Style.Color := $00F7EAD9 else DateDoc.Style.Color := clInfoBk;
 end;

 if FlashMemo then begin
  if NoteMemo.Style.Color = clInfoBk then NoteMemo.Style.Color := $00F7EAD9 else NoteMemo.Style.Color := clInfoBk;
 end;

 Dec(FlashTime);

 if (FlashTime < 0) or not (FlashDate or FlashMemo or FlashNum) then begin
  NumDoc.Style.Color   := $00F7EAD9;
  DateDoc.Style.Color  := $00F7EAD9;
  NoteMemo.Style.Color := $00F7EAD9;

  FlashNum  := False;
  FlashMemo := False;
  FlashDate := False;

  FlashTimer.Enabled := False;
 end;
end;

procedure Tjo9_SpecOper_Form.CollapseInfoMemo;
begin
 if InfoMemo.Height > 0 then InfoMemo.Height := InfoMemo.Height - 1
 else begin
  InfoMemo.Lines.AddStrings(MemoLines);
  Expand := True;
 end;
end;

procedure Tjo9_SpecOper_Form.ExpandInfoMemo;
begin
 if InfoMemo.Height < 56 then InfoMemo.Height := InfoMemo.Height + 1
 else Timer.Enabled := False;
end;

procedure Tjo9_SpecOper_Form.Num_Sch_Column_DbPropertiesCloseUp(
  Sender: TObject);
var
 Rec : integer;
 k, t : integer;
 i   : integer;
begin
 if not Apply then Exit;

 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;
  t := SchTableView.ViewData.DataController.FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Db) - 1 do
   if  (Integer(ProvArray_Db[i]._IDD) = TableView_Db.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Db[i]._id_Prov) = Values[k, 0]) then begin
    with ProvArray_Db[i] do begin
     if Integer(_id_Sch) = SchTableView.DataController.Values[t, 0] then Exit;

     _id_Sch   := SchTableView.DataController.Values[t, 0];
     _Num_Sch  := SchTableView.DataController.Values[t, 1];
     _Name_Sch := SchTableView.DataController.Values[t, 2];

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

     SetProv_Db(_IDD, _id_Prov);
    end;
   end;
 end;
end;

procedure Tjo9_SpecOper_Form.Num_Sch_Column_DbPropertiesPopup(
  Sender: TObject);
var
 k   : integer;
 Key : string;
begin
 Apply := False;

 k := ProvTableView_Db.DataController.FocusedRecordIndex;

 Key := '';
 if VarIsType(ProvTableView_Db.DataController.Values[k, 2], varString) then Key := ProvTableView_Db.DataController.Values[k, 2];

 SchTableView.DataController.FocusedRecordIndex := SchTableView.DataController.FindRecordIndexByText(0, 0, Key, False, False, True);
end;

procedure Tjo9_SpecOper_Form.Num_Sch_Column_KrPropertiesCloseUp(
  Sender: TObject);
var
 Rec : integer;
 k, t : integer;
 i   : integer;
begin
 if not Apply then Exit;

 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;
  t := SchTableView.ViewData.DataController.FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Kr) - 1 do
   if  (Integer(ProvArray_Kr[i]._IDD) = TableView_Kr.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Kr[i]._id_Prov) = Values[k, 0]) then begin
    with ProvArray_Kr[i] do begin
     if Integer(_id_Sch) = SchTableView.DataController.Values[t, 0] then Exit;

     _id_Sch   := SchTableView.DataController.Values[t, 0];
     _Num_Sch  := SchTableView.DataController.Values[t, 1];
     _Name_Sch := SchTableView.DataController.Values[t, 2];

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

     SetProv_Kr(_IDD, _id_Prov);
    end;
   end;
 end;

end;

procedure Tjo9_SpecOper_Form.Num_Sch_Column_KrPropertiesPopup(
  Sender: TObject);
var
 k   : integer;
 Key : string;
begin
 Apply := False;

 k := ProvTableView_Kr.DataController.FocusedRecordIndex;

 Key := '';
 if VarIsType(ProvTableView_Kr.DataController.Values[k, 2], varString) then Key := ProvTableView_Kr.DataController.Values[k, 2];

 SchTableView.DataController.FocusedRecordIndex := SchTableView.DataController.FindRecordIndexByText(0, 0, Key, False, False, True);
end;

procedure Tjo9_SpecOper_Form.SchTableViewDblClick(Sender: TObject);
var
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 Apply := True;

 if Num_Sch_Column_Db.Editing then
  ProvTableView_Db.Controller.EditingController.HideEdit(True)
 else if Num_Sch_Column_Kr.Editing then
  ProvTableView_Kr.Controller.EditingController.HideEdit(True);
end;

procedure Tjo9_SpecOper_Form.kod_Kekv_Column_DbPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec  : integer;
 k, i : integer;
 id   : variant;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Db) - 1 do
   if  (ProvArray_Db[i]._IDD = TableView_Db.DataController.Values[Rec, 7])
   and (ProvArray_Db[i]._id_Prov = Values[k, 0]) then begin
    id := GlobalSPR.GetKEKVSpr(self, Database.Handle, FSNormal, ActualDate, DEFAULT_ROOT_ID);

    if VarArrayDimCount(id) = 0 then Exit;

    if VarArrayDimCount(id) > 0 then begin
     if id[0][0] <> NULL then with ProvArray_Db[i] do begin
      _id_Kekv   := id[0][0];
      _Name_Kekv := id[0][1];
      _Kod_Kekv  := id[0][2];
     end;
    end;

    SetProv_Db(TableView_Db.DataController.Values[Rec, 7], Values[k, 0]);

    SetLabels;

    Break;
   end;
 end;
end;

procedure Tjo9_SpecOper_Form.kod_Kekv_Column_KrPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec  : integer;
 k, i : integer;
 id   : variant;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Kr) - 1 do
   if  (ProvArray_Kr[i]._IDD = TableView_Kr.DataController.Values[Rec, 7])
   and (ProvArray_Kr[i]._id_Prov = Values[k, 0]) then begin
    id := GlobalSPR.GetKEKVSpr(self, Database.Handle, FSNormal, ActualDate, DEFAULT_ROOT_ID);

    if VarArrayDimCount(id) = 0 then Exit;

    if VarArrayDimCount(id) > 0 then begin
     if id[0][0] <> NULL then with ProvArray_Kr[i] do begin
      _id_Kekv   := id[0][0];
      _Name_Kekv := id[0][1];
      _Kod_Kekv  := id[0][2];
     end;
    end;

    SetProv_Kr(TableView_Kr.DataController.Values[Rec, 7], Values[k, 0]);

    SetLabels;

    Break;
   end;
 end;
end;

procedure Tjo9_SpecOper_Form.EditProvButton_DbClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i       : integer;
 Flag    : boolean;
 STRU    : WIZARD_GET_PROV_INFO;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 k := ProvTableView_Db.DataController.FocusedRecordIndex;

 if k < 0 then Exit;

 STRU.DBHANDLE       := Database.Handle;
// STRU.MODE           := 1;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := SYS_INFO^._id_Reg_Uch;

 if Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

// STRU.SCH_SET_FLAG   := 0;

 STRU.ACTUAL_DATE    := ActualDate;
 STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := True;
 STRU.ID_LANGUAGE    := 2;

// STRU.ID_SCH_IN      := SYS_INFO^._Native_Sch^[0]._id_Sch;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 Flag := False;

 for i := 0 to Length(ProvArray_Db) - 1 do begin
  if (Integer(ProvArray_Db[i]._IDD) = TableView_Db.DataController.Values[Rec, 7])
  and (Integer(ProvArray_Db[i]._id_Prov) = ProvTableView_Db.DataController.Values[k, 0])
  and not ProvArray_Db[i]._is_Sec
  then begin
   Flag := True;
   Break;
  end;
 end;

 if not Flag then Exit;

 with ProvArray_Db[i] do begin
  _id_Sch   := STRU.DB_ID_SCH;
  _Num_Sch  := STRU.DB_ID_SCH_KOD;
  _Name_Sch := STRU.DB_ID_SCH_TIT;

  _id_S    := STRU.DB_ID_SMETA;
  _id_R    := STRU.DB_ID_RAZD;
  _id_St   := STRU.DB_ID_STAT;
  _id_Kekv := STRU.DB_ID_KEKV;

  _Kod_S    := STRU.DB_KOD_SMETA;
  _Kod_R    := STRU.DB_KOD_RAZD;
  _Kod_St   := STRU.DB_KOD_STAT;
  _Kod_Kekv := STRU.DB_KOD_KEKV;

  _Name_S    := STRU.DB_TITLE_SMETA;
  _Name_R    := STRU.DB_TITLE_RAZD;
  _Name_St   := STRU.DB_TITLE_STAT;
  _Name_Kekv := STRU.DB_KEKV_TITLE;

  if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

  SetProv_Db(_IDD, _id_Prov);
 end;


 if ProvGrid_Db.IsFocused then ProvTableView_Db.Controller.EditingController.EditingItem := ProvTableView_Db.Items[14];
end;

procedure Tjo9_SpecOper_Form.EditProvButton_KrClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i       : integer;
 Flag    : boolean;
 STRU    : WIZARD_GET_PROV_INFO;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 k := ProvTableView_Kr.DataController.FocusedRecordIndex;

 if k < 0 then Exit;

 STRU.DBHANDLE       := Database.Handle;
// STRU.MODE           := 1;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := SYS_INFO^._id_Reg_Uch;

 if Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

// STRU.SCH_SET_FLAG   := 1;

 STRU.ACTUAL_DATE    := ActualDate;
 STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := True;
 STRU.ID_LANGUAGE    := 2;

// STRU.ID_SCH_IN      := SYS_INFO^._Native_Sch^[0]._id_Sch;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 Flag := False;

 for i := 0 to Length(ProvArray_Kr) - 1 do begin
  if (Integer(ProvArray_Kr[i]._IDD) = TableView_Kr.DataController.Values[Rec, 7])
  and (Integer(ProvArray_Kr[i]._id_Prov) = ProvTableView_Kr.DataController.Values[k, 0])
  and not ProvArray_Kr[i]._is_Sec
  then begin
   Flag := True;
   Break;
  end;
 end;

 if not Flag then Exit;

 with ProvArray_Kr[i] do begin
  _id_Sch   := STRU.KR_ID_SCH;
  _Num_Sch  := STRU.KR_ID_SCH_KOD;
  _Name_Sch := STRU.KR_ID_SCH_TIT;

  _id_S    := STRU.KR_ID_SMETA;
  _id_R    := STRU.KR_ID_RAZD;
  _id_St   := STRU.KR_ID_STAT;
  _id_Kekv := STRU.KR_ID_KEKV;

  _Kod_S    := STRU.KR_KOD_SMETA;
  _Kod_R    := STRU.KR_KOD_RAZD;
  _Kod_St   := STRU.KR_KOD_STAT;
  _Kod_Kekv := STRU.KR_KOD_KEKV;

  _Name_S    := STRU.KR_TITLE_SMETA;
  _Name_R    := STRU.KR_TITLE_RAZD;
  _Name_St   := STRU.KR_TITLE_STAT;
  _Name_Kekv := STRU.KR_KEKV_TITLE;

  if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

  SetProv_Kr(_IDD, _id_Prov);
 end;


 if ProvGrid_Kr.IsFocused then ProvTableView_Kr.Controller.EditingController.EditingItem := ProvTableView_Kr.Items[14];
end;

procedure Tjo9_SpecOper_Form.AddProvButton_DbClick(Sender: TObject);
var
 Rec     : integer;
 id_Prov : integer;
 i       : integer;
 STRU    : WIZARD_GET_PROV_INFO;
 Sum     : currency;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 STRU.DBHANDLE       := Database.Handle;
 STRU.AOWNER         := Self;
// STRU.MODE           := 1;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := SYS_INFO^._id_Reg_Uch;

 if Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

// STRU.SCH_SET_FLAG   := 1;

 STRU.ACTUAL_DATE    := ActualDate;
 STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := True;
 STRU.ID_LANGUAGE    := 2;

// STRU.ID_SCH_IN      := SYS_INFO^._Native_Sch^[0]._id_Sch;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 id_Prov := 0;
 Sum     := 0;
 for i := 0 to Length(ProvArray_Db) - 1 do if ProvArray_Db[i]._id_Prov > id_Prov then id_Prov := ProvArray_Db[i]._id_Prov;

 with ProvTableView_Db.DataController do begin
  for i := 0 to RecordCount - 1 do if not VarIsNull(Values[i, 14]) then Sum := Sum + Values[i, 14];

  inc(id_Prov);

  SetLength(ProvArray_Db, Length(ProvArray_Db) + 1);

  with ProvArray_Db[Length(ProvArray_Db) - 1] do begin
   _IDD      := TableView_Db.DataController.Values[Rec, 7];
   _id_Prov  := id_Prov;
   _id_Sch   := STRU.DB_ID_SCH;
   _Num_Sch  := STRU.DB_ID_SCH_KOD;
   _Name_Sch := STRU.DB_ID_SCH_TIT;

   _id_S    := STRU.DB_ID_SMETA;
   _id_R    := STRU.DB_ID_RAZD;
   _id_St   := STRU.DB_ID_STAT;
   _id_Kekv := STRU.DB_ID_KEKV;

   _Kod_S    := STRU.DB_KOD_SMETA;
   _Kod_R    := STRU.DB_KOD_RAZD;
   _Kod_St   := STRU.DB_KOD_STAT;
   _Kod_Kekv := STRU.DB_KOD_KEKV;

   _Name_S    := STRU.DB_TITLE_SMETA;
   _Name_R    := STRU.DB_TITLE_RAZD;
   _Name_St   := STRU.DB_TITLE_STAT;
   _Name_Kekv := STRU.DB_KEKV_TITLE;

   if not VarIsNull(TableView_Db.DataController.Values[Rec, 5]) then
    _Prov_Summa := TableView_Db.DataController.Values[Rec, 5] - Sum
   else
    _Prov_Summa := 0;

   _State_Prov := 'ADD';
   _is_Sec     := False;

   SetProv_Db(_IDD, _id_Prov);
  end;
 end;

 ProvGrid_Db.SetFocus;
 ProvTableView_Db.Controller.EditingController.EditingItem := ProvTableView_Db.Items[14];
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.AddProvButton_KrClick(Sender: TObject);
var
 Rec     : integer;
 id_Prov : integer;
 i       : integer;
 STRU    : WIZARD_GET_PROV_INFO;
 Sum     : currency;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 STRU.DBHANDLE       := Database.Handle;
 STRU.AOWNER         := Self;
// STRU.MODE           := 1;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := SYS_INFO^._id_Reg_Uch;

 if Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

// STRU.SCH_SET_FLAG   := 1;

 STRU.ACTUAL_DATE    := ActualDate;
 STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := True;
 STRU.ID_LANGUAGE    := 2;

// STRU.ID_SCH_IN      := SYS_INFO^._Native_Sch^[0]._id_Sch;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 id_Prov := 0;
 Sum     := 0;
 for i := 0 to Length(ProvArray_Kr) - 1 do if ProvArray_Kr[i]._id_Prov > id_Prov then id_Prov := ProvArray_Kr[i]._id_Prov;

 with ProvTableView_Kr.DataController do begin
  for i := 0 to RecordCount - 1 do if not VarIsNull(Values[i, 14]) then Sum := Sum + Values[i, 14];

  inc(id_Prov);

  SetLength(ProvArray_Kr, Length(ProvArray_Kr) + 1);

  with ProvArray_Kr[Length(ProvArray_Kr) - 1] do begin
   _IDD      := TableView_Kr.DataController.Values[Rec, 7];
   _id_Prov  := id_Prov;
   _id_Sch   := STRU.KR_ID_SCH;
   _Num_Sch  := STRU.KR_ID_SCH_KOD;
   _Name_Sch := STRU.KR_ID_SCH_TIT;

   _id_S    := STRU.KR_ID_SMETA;
   _id_R    := STRU.KR_ID_RAZD;
   _id_St   := STRU.KR_ID_STAT;
   _id_Kekv := STRU.KR_ID_KEKV;

   _Kod_S    := STRU.KR_KOD_SMETA;
   _Kod_R    := STRU.KR_KOD_RAZD;
   _Kod_St   := STRU.KR_KOD_STAT;
   _Kod_Kekv := STRU.KR_KOD_KEKV;

   _Name_S    := STRU.KR_TITLE_SMETA;
   _Name_R    := STRU.KR_TITLE_RAZD;
   _Name_St   := STRU.KR_TITLE_STAT;
   _Name_Kekv := STRU.KR_KEKV_TITLE;

   if not VarIsNull(TableView_Kr.DataController.Values[Rec, 5]) then
    _Prov_Summa := TableView_Kr.DataController.Values[Rec, 5] - Sum
   else
    _Prov_Summa := 0;

   _State_Prov := 'ADD';
   _is_Sec     := False;

   SetProv_Kr(_IDD, _id_Prov);
  end;
 end;

 ProvGrid_Kr.SetFocus;
 ProvTableView_Kr.Controller.EditingController.EditingItem := ProvTableView_Kr.Items[14];
 SetLabels;
end;

function Tjo9_SpecOper_Form.FillResProv: boolean;
var
 i, j : integer;
 r, t : integer;

 Sum  : currency;
begin
 ResProv := nil;

 for i := 0 to Length(ProvArray_Db) - 1 do begin
  ProvArray_Db[i]._Done_Sum := 0;
  ProvArray_Db[i]._Done     := False;
 end;

 for i := 0 to Length(ProvArray_Kr) - 1 do begin
  ProvArray_Kr[i]._Done_Sum := 0;
  ProvArray_Kr[i]._Done     := False;
 end;

 for i := 0 to TableView_Db.DataController.RecordCount - 1 do begin
  for j := 0 to Length(ProvArray_Db) - 1 do begin
   if ProvArray_Db[j]._State_Prov = 'DEL' then Continue;
   if ProvArray_Db[j]._Done then Continue;

   for r := 0 to TableView_Kr.DataController.RecordCount - 1 do begin
    if ProvArray_Db[j]._Done then Break;

    for t := 0 to Length(ProvArray_Kr) - 1 do begin
     if ProvArray_Kr[t]._State_Prov = 'DEL' then Continue;
     if ProvArray_Kr[t]._Done then Continue;

     if (ProvArray_Db[j]._Prov_Summa - ProvArray_Db[j]._Done_Sum) >= (ProvArray_Kr[t]._Prov_Summa - ProvArray_Kr[t]._Done_Sum) then begin
      ProvArray_Db[j]._Done_Sum := ProvArray_Db[j]._Done_Sum + ProvArray_Kr[t]._Prov_Summa - ProvArray_Kr[t]._Done_Sum;
      Sum                       := ProvArray_Kr[t]._Prov_Summa - ProvArray_Kr[t]._Done_Sum;
      ProvArray_Kr[t]._Done_Sum := ProvArray_Kr[t]._Done_Sum + Sum;
      ProvArray_Kr[t]._Done     := True;
     end
     else begin
      ProvArray_Kr[t]._Done_Sum := ProvArray_Kr[t]._Done_Sum + ProvArray_Db[j]._Prov_Summa - ProvArray_Db[j]._Done_Sum;
      Sum                       := ProvArray_Db[j]._Prov_Summa - ProvArray_Db[j]._Done_Sum;
      ProvArray_Db[j]._Done_Sum := ProvArray_Db[j]._Done_Sum + Sum;
     end;

     SetLength(ResProv, Length(ResProv) + 1);
     with ResProv[Length(ResProv) - 1] do begin
      _DB_Name_Cust := TableView_Db.DataController.Values[i, 0];
      _DB_id_Dog    := TableView_Db.DataController.Values[i, 1];
      _DB_kod_Dog   := TableView_Db.DataController.Values[i, 2];
      _DB_Name_Sh   := TableView_Db.DataController.Values[i, 6];
      _DB_id_Sch    := ProvArray_Db[j]._id_Sch;
      _DB_id_S      := ProvArray_Db[j]._id_S;
      _DB_id_R      := ProvArray_Db[j]._id_R;
      _DB_id_St     := ProvArray_Db[j]._id_St;
      _DB_id_Kekv   := ProvArray_Db[j]._id_Kekv;

      _DB_Name_Cust    := TableView_Kr.DataController.Values[r, 0];
      _KR_id_Dog       := TableView_Kr.DataController.Values[r, 1];
      _KR_kod_Dog      := TableView_Kr.DataController.Values[r, 2];
      _KR_id_Cust      := TableView_Kr.DataController.Values[r, 8];
      _KR_is_Active    := TableView_Kr.DataController.Values[r, 9];
      _KR_Need_Out_Doc := TableView_Kr.DataController.Values[r, 10];
      _KR_Name_Sh      := TableView_Kr.DataController.Values[r, 6];
      _KR_id_Sch       := ProvArray_Kr[t]._id_Sch;
      _KR_id_S         := ProvArray_Kr[t]._id_S;
      _KR_id_R         := ProvArray_Kr[t]._id_R;
      _KR_id_St        := ProvArray_Kr[t]._id_St;
      _KR_id_Kekv      := ProvArray_Kr[t]._id_Kekv;

      _DB_Reg_Num  := TableView_Db.DataController.Values[i, 4];
      _DB_kod_Sch  := ProvArray_Db[j]._Num_Sch;
      _DB_kod_S    := ProvArray_Db[j]._Kod_S;
      _DB_kod_R    := ProvArray_Db[j]._Kod_R;
      _DB_kod_St   := ProvArray_Db[j]._Kod_St;
      _DB_kod_Kekv := ProvArray_Db[j]._Kod_Kekv;

      _KR_Reg_Num  := TableView_Kr.DataController.Values[r, 4];
      _KR_kod_Sch  := ProvArray_Kr[t]._Num_Sch;
      _KR_kod_S    := ProvArray_Kr[t]._Kod_S;
      _KR_kod_R    := ProvArray_Kr[t]._Kod_R;
      _KR_kod_St   := ProvArray_Kr[t]._Kod_St;
      _KR_kod_Kekv := ProvArray_Kr[t]._Kod_Kekv;

      _DB_Name_Sch  := ProvArray_Db[j]._Name_Sch;
      _DB_Name_S    := ProvArray_Db[j]._Name_S;
      _DB_Name_R    := ProvArray_Db[j]._Name_R;
      _DB_Name_St   := ProvArray_Db[j]._Name_St;
      _DB_Name_Kekv := ProvArray_Db[j]._Name_Kekv;

      _KR_Name_Sch  := ProvArray_Kr[t]._Name_Sch;
      _KR_Name_S    := ProvArray_Kr[t]._Name_S;
      _KR_Name_R    := ProvArray_Kr[t]._Name_R;
      _KR_Name_St   := ProvArray_Kr[t]._Name_St;
      _KR_Name_Kekv := ProvArray_Kr[t]._Name_Kekv;

      _Prov_Summa := Sum;

      _is_Sec     := False;
     end;

     if ProvArray_Db[j]._Done_Sum = ProvArray_Db[j]._Prov_Summa then begin
      ProvArray_Db[j]._Done := True;
      Break;
     end;
    end;
   end;
  end;
 end;

 Result  := True;
end;

function Tjo9_SpecOper_Form.SaveDoc: boolean;
var
 _Kredit     : word;
 i           : integer;
 Sum         : currency;
 id_Customer : integer;
 Flag        : boolean;

 KEY_SESSION : Int64;
 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 ErrorList   : TStringList;
begin
 Result := False;

 if not FillResProv then Exit;

 StoredProc.Transaction.StartTransaction;

 if Mode = somEdit then begin
  // Удаляю существующий документ со спец. операциями
  KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

  STRU.KEY_SESSION   := KEY_SESSION;
  STRU.WORKDATE      := ActualDate;
  STRU.DBHANDLE      := StoredProc.Database.Handle;
  STRU.TRHANDLE      := StoredProc.Transaction.Handle;
  STRU.KERNEL_ACTION := 2;
  STRU.PK_ID         := PK_id;
  STRU.ID_USER       := SYS_INFO^._id_User;

  try
   DoResult:=Kernel.KernelDo(@STRU);
  except
   on E:Exception do begin
    StoredProc.Transaction.Rollback;
    ShowMessage('Помилка ядра '+E.Message);
    Exit;
   end;
  end;

  if not DoResult then begin
   ErrorList := Kernel.GetDocErrorsList(@STRU);
   MemoLines.AddStrings(ErrorList);
   StoredProc.Transaction.Rollback;
   Exit;
  end;

  // Удаляю существующий документ с начислениями (если он есть!!!)

  if not VarIsNull(id_Out_Doc) then begin
   KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

   STRU.KEY_SESSION   := KEY_SESSION;
   STRU.WORKDATE      := ActualDate;
   STRU.DBHANDLE      := StoredProc.Database.Handle;
   STRU.TRHANDLE      := StoredProc.Transaction.Handle;
   STRU.KERNEL_ACTION := 2;
   STRU.PK_ID         := id_Out_Doc;
   STRU.ID_USER       := SYS_INFO^._id_User;

   try
    DoResult:=Kernel.KernelDo(@STRU);
   except
    on E:Exception do begin
     StoredProc.Transaction.Rollback;
     ShowMessage('Помилка ядра '+E.Message);
     Exit;
    end;
   end;

   if not DoResult then begin
    ErrorList := Kernel.GetDocErrorsList(@STRU);
    MemoLines.AddStrings(ErrorList);
    StoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
 end
 else if (Mode = somAdd) and VarIsNull(PK_id) then begin
  StoredProc.ExecProcedure('PUB_GET_ID_DOC', [10]);
  PK_id := StoredProc.FieldByName('RET_VALUE').AsInt64;
  StoredProc.Close;
 end;

 // Сохраняю документ начислений-->>>>>>>>>>
 if not SaveOutDoc then Exit;
 ///////////////////--------------<<<<<<<<<<

 Sum := 0;
 for i := 0 to Length(ProvArray_Db) - 1 do
  if ProvArray_Db[i]._State_Prov <> 'DEL' then Sum := Sum + ProvArray_Db[i]._Prov_Summa;

 with TableView_Db.DataController do begin
  id_Customer := Values[0, 8];
  Flag := False;
  for i := 1 to RecordCount - 1 do
   if Values[i, 8] <> id_Customer then begin
    Flag := True;
    Break;
   end;
 end;

 if not Flag then with TableView_Kr.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 8] <> id_Customer then begin
    Flag := True;
    Break;
   end;
 end;

 if Flag then id_Customer := SYS_INFO^._Undef_Contr;

 KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 if Kredit then _Kredit := 1 else _Kredit := 0;

 StoredProc.StoredProcName := 'JO9_DT_ALL_DOC_ADD';
 StoredProc.Prepare;

 StoredProc.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StoredProc.ParamByName('PK_ID').AsInt64         := PK_id;
 StoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;
 StoredProc.ParamByName('DATE_PROV').AsDate      := ActualDate;
 StoredProc.ParamByName('DATE_DOC').AsDate       := DateDoc.Date;
 StoredProc.ParamByName('ID_TYPE_DOC').AsInteger := SYS_INFO^._id_Type_Doc;
 StoredProc.ParamByName('REG_NUM').AsString      := NumDoc.Text;
 StoredProc.ParamByName('SUMMA').AsCurrency      := Sum;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64   := id_Customer;
 StoredProc.ParamByName('NOTE').AsString         := NoteMemo.Text;
 StoredProc.ParamByName('KREDIT').AsInteger      := _Kredit;

 if not VarIsNull(id_Out_Doc) then StoredProc.ParamByName('ID_OUT_DOC').AsInt64 := id_Out_Doc;

 StoredProc.ExecProc;

 for i := 0 to Length(ResProv) - 1 do begin
  StoredProc.StoredProcName := 'JO9_DT_ALL_PROV_ADD_DIF';
  StoredProc.Prepare;

  StoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
  StoredProc.ParamByName('KREDIT').AsInteger     := _Kredit;
  StoredProc.ParamByName('DATE_PROV').AsDate     := ActualDate;

  StoredProc.ParamByName('DB_ID_DOG').AsInt64    := ResProv[i]._DB_id_Dog;
  StoredProc.ParamByName('DB_KOD_DOG').AsInt64   := ResProv[i]._DB_kod_Dog;
  StoredProc.ParamByName('DB_ID_SCH').AsInteger  := ResProv[i]._DB_id_Sch;
  StoredProc.ParamByName('DB_ID_S').AsInteger    := ResProv[i]._DB_id_S;
  StoredProc.ParamByName('DB_ID_R').AsInteger    := ResProv[i]._DB_id_R;
  StoredProc.ParamByName('DB_ID_ST').AsInteger   := ResProv[i]._DB_id_St;
  StoredProc.ParamByName('DB_ID_KEKV').AsInteger := ResProv[i]._DB_id_KEKV;

  StoredProc.ParamByName('KR_ID_DOG').AsInt64    := ResProv[i]._KR_id_Dog;
  StoredProc.ParamByName('KR_KOD_DOG').AsInt64   := ResProv[i]._KR_kod_Dog;
  StoredProc.ParamByName('KR_ID_SCH').AsInteger  := ResProv[i]._KR_id_Sch;
  StoredProc.ParamByName('KR_ID_S').AsInteger    := ResProv[i]._KR_id_S;
  StoredProc.ParamByName('KR_ID_R').AsInteger    := ResProv[i]._KR_id_R;
  StoredProc.ParamByName('KR_ID_ST').AsInteger   := ResProv[i]._KR_id_St;
  StoredProc.ParamByName('KR_ID_KEKV').AsInteger := ResProv[i]._KR_id_KEKV;

  StoredProc.ParamByName('SUMMA').asCurrency     := ResProv[i]._Prov_Summa;

  StoredProc.ParamByName('IS_MAIN').AsInteger    := 1;

  StoredProc.ExecProc;
 end;

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := ActualDate;
 STRU.DBHANDLE      := StoredProc.Database.Handle;
 STRU.TRHANDLE      := StoredProc.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := SYS_INFO^._id_User;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StoredProc.Transaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines.AddStrings(ErrorList);
  StoredProc.Transaction.Rollback;
  Exit;
 end
 else StoredProc.Transaction.Commit;

 Result := True;
end;

procedure Tjo9_SpecOper_Form.ApplyButtonClick(Sender: TObject);
begin
 if Processing then Exit;

 Processing := True;

 FlashNum  := False;
 FlashMemo := False;
 FlashDate := False;

 if not CheckCorrect(False) then Exit;

 if not SaveDoc then begin
  Processing := False;
  FlashInfoMemo;
  Exit;
 end;

// Res(PK_id, is_Kredit);

 Processing := False;

 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_SpecOper_Form.Prov_Summa_Column_DbPropertiesEditValueChanged(
  Sender: TObject);
var
 Rec : integer;
 k   : integer;
 i   : integer;
begin
 Rec := TableView_Db.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Db) - 1 do
   if (Integer(ProvArray_Db[i]._IDD) = TableView_Db.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Db[i]._id_Prov) = Values[k, 0])
   and not ProvArray_Db[i]._is_Sec
   then begin
    with ProvArray_Db[i] do begin
     _Prov_Summa := ProvTableView_Db.Controller.EditingController.Edit.EditValue;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    SetProv_Db(TableView_Db.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end;
end;

procedure Tjo9_SpecOper_Form.Prov_Summa_Column_KrPropertiesEditValueChanged(
  Sender: TObject);
var
 Rec : integer;
 k   : integer;
 i   : integer;
begin
 Rec := TableView_Kr.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray_Kr) - 1 do
   if (Integer(ProvArray_Kr[i]._IDD) = TableView_Kr.DataController.Values[Rec, 7])
   and (Integer(ProvArray_Kr[i]._id_Prov) = Values[k, 0])
   and not ProvArray_Kr[i]._is_Sec
   then begin
    with ProvArray_Kr[i] do begin
     _Prov_Summa := ProvTableView_Kr.Controller.EditingController.Edit.EditValue;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    SetProv_Kr(TableView_Kr.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end;
end;

function Tjo9_SpecOper_Form.CheckCorrect(View : boolean): boolean;
var
 Flag   : boolean;
 i, j   : integer;
 k      : integer;
 Sum_Db : currency;
 Sum_Kr : currency;
 Sum    : currency;
begin
 Result := False;

 with TableView_Db do begin
  k := DataController.FocusedRecordIndex;
  if k >= 0 then TableView_DbFocusedRecordChanged(TableView_Db, ViewData.Records[k], ViewData.Records[k], False);
 end;

 with TableView_Kr do begin
  k := DataController.FocusedRecordIndex;
  if k >= 0 then TableView_KrFocusedRecordChanged(TableView_Kr, ViewData.Records[k], ViewData.Records[k], False);
 end;

 MemoLines.Text := '';

 Flag := False;

 if not View then begin
  if NumDoc.Text = '' then begin
   MemoLines.Add('Ви не увели номер документу');
   FlashNum := True;
   NumDoc.SetFocus;
   Flag := True;
  end;

  if DateDoc.Text = '' then begin
   MemoLines.Add('Ви не увели дату документу');
   FlashDate := True;
   if not Flag then DateDoc.SetFocus;
   Flag := True;
  end;

  if NoteMemo.Text = '' then begin
   MemoLines.Add('Ви не увели підставу документу');
   FlashMemo := True;
   if not Flag then NoteMemo.SetFocus;
   Flag := True;
  end;
 end;

 Sum_Kr := 0;
 Sum_Db := 0;

 with TableView_Db.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if VarIsNull(Values[i, 5]) then begin
    MemoLines.Add('Ви не увели суму по договору!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;

   Sum := 0;
   for j := 0 to Length(ProvArray_Db) - 1 do begin
    if ProvArray_Db[j]._IDD <> Values[i, 7] then Continue;

    if VarIsNull(ProvArray_Db[j]._Prov_Summa) then begin
     MemoLines.Add('Ви не увели суму по проводці!');
     FocusedRecordIndex := i;
     Flag := True;
     Break;
    end;

    Sum    := Sum + ProvArray_Db[j]._Prov_Summa;
    Sum_Db := Sum_Db + ProvArray_Db[j]._Prov_Summa;
   end;

   if Sum <> Values[i, 5] then begin
    MemoLines.Add('Сума по договору не збігається з сумою по проводкам!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;
  end;
 end;

 with TableView_Kr.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if VarIsNull(Values[i, 5]) then begin
    MemoLines.Add('Ви не увели суму по договору!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;

   Sum := 0;
   for j := 0 to Length(ProvArray_Kr) - 1 do begin
    if ProvArray_Kr[j]._IDD <> Values[i, 7] then Continue;

    if VarIsNull(ProvArray_Kr[j]._Prov_Summa) then begin
     MemoLines.Add('Ви не увели суму по проводці!');
     FocusedRecordIndex := i;
     Flag := True;
     Break;
    end;

    Sum    := Sum + ProvArray_Kr[j]._Prov_Summa;
    Sum_Kr := Sum_Kr + ProvArray_Kr[j]._Prov_Summa;
   end;

   if Sum <> Values[i, 5] then begin
    MemoLines.Add('Сума по договору не збігається з сумою по проводкам!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;
  end;
 end;

 if Sum_Db <> Sum_Kr then begin
  MemoLines.Add('Сума дебетової частини документу повина збігатися із сумою його кредитової частини!');
  Flag := True;
 end;

 if Flag then begin
  if FlashNum or FlashMemo or FlashDate then begin
   FlashTime          := 30;
   FlashTimer.Enabled := True;
  end;

  Processing := False;
  FlashInfoMemo;
  Exit;
 end;

 Result := True;
end;

procedure Tjo9_SpecOper_Form.ViewButtonClick(Sender: TObject);
var
 f : Tjo9_SpecOper_View_Form;
begin
 if Processing then Exit;

 Processing := True;

 FlashNum  := False;
 FlashMemo := False;
 FlashDate := False;

 if not CheckCorrect(True) then Exit;

 if not FillResProv then Exit;

 f := Tjo9_SpecOper_View_Form.Create(Self);
 f.res := @ResProv;

 f.FormStyle := fsMDIChild;
 f.Show;

 Processing := False;
end;

procedure Tjo9_SpecOper_Form.SelectAll(pk_id: int64);
var
 i, j : integer;
 Flag : boolean;
 idd  : integer;
 Sum  : currency;
begin
 // Debet selecting

 DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_PROV_SEL(' + IntToStr(PK_id) + ',' + IntToStr(SYS_INFO^._id_Reg_Uch) + ',0 , 1)';
 DataSet.Open;

 idd := 0;

 while not DataSet.Eof do begin
  with TableView_Db.DataController do begin
   Flag := True;
   for i := 0 to RecordCount - 1 do
    if Values[i, 1] = DataSet.FieldByName('ID_DOG').AsInteger then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    inc(idd);
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := DataSet.FieldByName('NAME_CUSTOMER').AsString;
    Values[RecordCount - 1, 1] := DataSet.FieldByName('ID_DOG').AsString;
    Values[RecordCount - 1, 2] := DataSet.FieldByName('KOD_DOG').AsString;
    Values[RecordCount - 1, 3] := DataSet.FieldByName('ID_TIP_DOG').AsInteger;
    Values[RecordCount - 1, 4] := DataSet.FieldByName('REG_NUM').AsString;
    Values[RecordCount - 1, 6] := DataSet.FieldByName('NAME_SHABLON').AsString;
    Values[RecordCount - 1, 7] := idd;
    Values[RecordCount - 1, 8] := DataSet.FieldByName('ID_CUSTOMER').AsInteger;
   end;
  end;

  SetLength(ProvArray_Db, Length(ProvArray_Db) + 1);
  with ProvArray_Db[Length(ProvArray_Db) - 1] do begin
   if Flag then _IDD := idd
   else _IDD := TableView_Db.DataController.Values[i, 7];

   _id_Prov    := DataSet['ID_PROV'];
   _id_Sch     := DataSet['ID_SCH_DB'];
   _Num_Sch    := DataSet['NUM_SCH_DB'];
   _Name_Sch   := DataSet['NAME_SCH_DB'];
   _id_S       := DataSet['ID_S'];
   _id_R       := DataSet['ID_R'];
   _id_St      := DataSet['ID_ST'];
   _id_Kekv    := DataSet['ID_KEKV'];
   _Kod_S      := DataSet['KOD_S'];
   _Kod_R      := DataSet['KOD_R'];
   _Kod_St     := DataSet['KOD_ST'];
   _Kod_Kekv   := DataSet['KOD_KEKV'];
   _Name_S     := DataSet['NAME_S'];
   _Name_R     := DataSet['NAME_R'];
   _Name_St    := DataSet['NAME_ST'];
   _Name_Kekv  := DataSet['NAME_KEKV'];
   _Prov_Summa := DataSet['SUMMA'];
   _State_Prov := '';

   _is_Sec     := (DataSet['IS_MAIN'] = 0);
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 with TableView_Db.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   Sum := 0;

   for j := 0 to Length(ProvArray_Db) - 1 do
    if Values[i, 7] = ProvArray_Db[j]._IDD then Sum := Sum + ProvArray_Db[j]._Prov_Summa;

   Values[i, 5] := Sum;
  end;
 end;

 /// Kredit Selecting

 DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_PROV_SEL(' + IntToStr(PK_id) + ',' + IntToStr(SYS_INFO^._id_Reg_Uch) + ',1 , 1)';
 DataSet.Open;

 idd := 0;

 while not DataSet.Eof do begin
  with TableView_Kr.DataController do begin
   Flag := True;
   for i := 0 to RecordCount - 1 do
    if Values[i, 1] = DataSet['ID_DOG'] then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    inc(idd);
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := DataSet.FieldByName('NAME_CUSTOMER').AsString;
    Values[RecordCount - 1, 1] := DataSet.FieldByName('ID_DOG').AsString;
    Values[RecordCount - 1, 2] := DataSet.FieldByName('KOD_DOG').AsString;
    Values[RecordCount - 1, 3] := DataSet.FieldByName('ID_TIP_DOG').AsInteger;
    Values[RecordCount - 1, 4] := DataSet.FieldByName('REG_NUM').AsString;
    Values[RecordCount - 1, 6] := DataSet.FieldByName('NAME_SHABLON').AsString;
    Values[RecordCount - 1, 7] := idd;
    Values[RecordCount - 1, 8] := DataSet.FieldByName('ID_CUSTOMER').AsInteger;
   end;
  end;

  SetLength(ProvArray_Kr, Length(ProvArray_Kr) + 1);
  with ProvArray_Kr[Length(ProvArray_Kr) - 1] do begin
   if Flag then _IDD := idd
   else _IDD := TableView_Kr.DataController.Values[i, 7];

   _id_Prov    := DataSet['ID_PROV'];
   _id_Sch     := DataSet['ID_SCH_KR'];
   _Num_Sch    := DataSet['NUM_SCH_KR'];
   _Name_Sch   := DataSet['NAME_SCH_KR'];
   _id_S       := DataSet['ID_S'];
   _id_R       := DataSet['ID_R'];
   _id_St      := DataSet['ID_ST'];
   _id_Kekv    := DataSet['ID_KEKV'];
   _Kod_S      := DataSet['KOD_S'];
   _Kod_R      := DataSet['KOD_R'];
   _Kod_St     := DataSet['KOD_ST'];
   _Kod_Kekv   := DataSet['KOD_KEKV'];
   _Name_S     := DataSet['NAME_S'];
   _Name_R     := DataSet['NAME_R'];
   _Name_St    := DataSet['NAME_ST'];
   _Name_Kekv  := DataSet['NAME_KEKV'];
   _Prov_Summa := DataSet['SUMMA'];
   _State_Prov := '';

   _is_Sec     := (DataSet['IS_MAIN'] = 0);
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 with TableView_Kr.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   Sum := 0;

   for j := 0 to Length(ProvArray_Kr) - 1 do
    if Values[i, 7] = ProvArray_Kr[j]._IDD then Sum := Sum + ProvArray_Kr[j]._Prov_Summa;

   Values[i, 5] := Sum;
  end;
 end;


 with TableView_Db do
  if DataController.RecordCount >= 0 then begin
   DataController.FocusedRecordIndex := 0;
   TableView_DbFocusedRecordChanged(TableView_Db, ViewData.Records[0], ViewData.Records[0], False);
  end;


 with TableView_Kr do
  if DataController.RecordCount >= 0 then begin
   DataController.FocusedRecordIndex := 0;
   TableView_KrFocusedRecordChanged(TableView_Kr, ViewData.Records[0], ViewData.Records[0], False);
  end;

 with TableView_Kr.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   DataSet.SelectSQL.Text := 'select result from PUB_SP_TIP_DOG_BELONG_GROUP('
   + IntToStr(Values[i, 3]) + ', 32)';
   DataSet.Open;

   Values[i, 10] := (DataSet.Fields[0].AsInteger = 1);

   DataSet.Close;

   DataSet.SelectSQL.Text := 'select TIP_ACTIVE from DOG_GET_ACTIVE_BY_ID_DOG('
   + Values[i, 2] + ')';
   DataSet.Open;

   Values[i, 9] := (DataSet.Fields[0].AsInteger = -1);

   DataSet.Close;
  end;
 end;
end;

procedure Tjo9_SpecOper_Form.SetLabels;
var
 k : integer;
begin
 Sch_Label.Caption  := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';

 if ProvGrid_Db.IsFocused then with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;
  if k >= 0 then begin
   if not VarIsNull(Values[k, 11]) then S_Label.Caption    := Values[k, 11];
   if not VarIsNull(Values[k, 12]) then R_Label.Caption    := Values[k, 12];
   if not VarIsNull(Values[k, 13]) then St_Label.Caption   := Values[k, 13];
   if not VarIsNull(Values[k, 3])  then Sch_Label.Caption  := Values[k, 3];
   if not VarIsNull(Values[k, 17]) then Kekv_Label.Caption := Values[k, 17];
  end;
 end
 else if ProvGrid_Kr.IsFocused then with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;
  if k >= 0 then begin
   if not VarIsNull(Values[k, 11]) then S_Label.Caption    := Values[k, 11];
   if not VarIsNull(Values[k, 12]) then R_Label.Caption    := Values[k, 12];
   if not VarIsNull(Values[k, 13]) then St_Label.Caption   := Values[k, 13];
   if not VarIsNull(Values[k, 3])  then Sch_Label.Caption  := Values[k, 3];
   if not VarIsNull(Values[k, 17]) then Kekv_Label.Caption := Values[k, 17];
  end;
 end;

 Sch_Label.Hint  := Sch_Label.Caption;
 S_Label.Hint    := S_Label.Caption;
 R_Label.Hint    := R_Label.Caption;
 St_Label.Hint   := St_Label.Caption;
 Kekv_Label.Hint := Kekv_Label.Caption;
end;

procedure Tjo9_SpecOper_Form.ProvTableView_DbFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.Action1Execute(Sender: TObject);
begin
 ViewButtonClick(Sender);
end;

procedure Tjo9_SpecOper_Form.TableView_DbKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 k := TableView_Db.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView_Db.DataController do begin
//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_DOG: '       + IntToStr(Values[k, 1]) + #13
             + 'ID_CUSTOMER: '  + IntToStr(Values[k, 8]) + #13
             + 'NAME_SHABLON: ' + Values[k, 6]);
  except
  end;
 end;
end;

procedure Tjo9_SpecOper_Form.TableView_KrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 k := TableView_Kr.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView_Kr.DataController do begin
//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_DOG: '       + IntToStr(Values[k, 1]) + #13
             + 'ID_CUSTOMER: '  + IntToStr(Values[k, 8]) + #13
             + 'NAME_SHABLON: ' + Values[k, 6]);
  except
  end;
 end;
end;

procedure Tjo9_SpecOper_Form.ProvTableView_DbKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 with ProvTableView_Db.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_PROV: '   + IntToStr(Values[k, 0]) + #13
             + 'ID_SCH_DB: ' + IntToStr(Values[k, 1]) + #13
             + 'ID_SM: '     + IntToStr(Values[k, 4]) + #13
             + 'ID_RZ: '     + IntToStr(Values[k, 5]) + #13
             + 'ID_ST: '     + IntToStr(Values[k, 6]) + #13
             + 'ID_KEKV: '   + IntToStr(Values[k, 16]));
  except
  end;
 end;
end;

procedure Tjo9_SpecOper_Form.ProvTableView_KrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 with ProvTableView_Kr.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_PROV: '   + IntToStr(Values[k, 0]) + #13
             + 'ID_SCH_DB: ' + IntToStr(Values[k, 1]) + #13
             + 'ID_SM: '     + IntToStr(Values[k, 4]) + #13
             + 'ID_RZ: '     + IntToStr(Values[k, 5]) + #13
             + 'ID_ST: '     + IntToStr(Values[k, 6]) + #13
             + 'ID_KEKV: '   + IntToStr(Values[k, 16]));
  except
  end;
 end;
end;

function Tjo9_SpecOper_Form.SaveOutDoc: boolean;
var
 i       : integer;
 Flag    : boolean;
 Doc_Sum : currency;

 KEY_SESSION : Int64;
 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 ErrorList   : TStringList;

 id_Customer : integer;
 Cust_Flag   : boolean;
begin
 Result := False;

 Flag      := False;
 Cust_Flag := False;

 Doc_Sum     := 0;
 id_Customer := -738745634;

 KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 for i := 0 to Length(ResProv) - 1 do begin
  if not (ResProv[i]._KR_is_Active and ResProv[i]._KR_Need_Out_Doc) then Continue;

  Flag := True;

  if not Cust_Flag then begin
   if id_Customer = -738745634 then id_Customer := ResProv[i]._KR_id_Cust
   else if id_Customer <> ResProv[i]._KR_id_Cust then Cust_Flag := True;
  end;

  StoredProc.StoredProcName := 'JO9_DT_ALL_PROV_ADD';
  StoredProc.Prepare;

  StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
  StoredProc.ParamByName('KREDIT').AsInteger    := 0;
  StoredProc.ParamByName('DATE_PROV').AsDate    := ActualDate;
  StoredProc.ParamByName('DB_ID_SCH').AsInteger := ResProv[i]._KR_id_Sch;
  StoredProc.ParamByName('KR_ID_SCH').AsInteger := ResProv[i]._DB_id_Sch;
  StoredProc.ParamByName('ID_S').AsInteger      := ResProv[i]._KR_id_S;
  StoredProc.ParamByName('ID_R').AsInteger      := ResProv[i]._KR_id_R;
  StoredProc.ParamByName('ID_ST').AsInteger     := ResProv[i]._KR_id_St;
  StoredProc.ParamByName('ID_KEKV').AsInteger   := ResProv[i]._KR_id_Kekv;
  StoredProc.ParamByName('SUMMA').AsCurrency    := ResProv[i]._Prov_Summa;
  StoredProc.ParamByName('ID_DOG').AsInt64      := ResProv[i]._KR_id_Dog;
  StoredProc.ParamByName('KOD_DOG').AsInt64     := ResProv[i]._KR_kod_Dog;
  StoredProc.ParamByName('IS_MAIN').AsInteger   := 1;

  StoredProc.ExecProc;

  Doc_Sum := Doc_Sum + ResProv[i]._Prov_Summa;
 end;

 if not Flag then begin
  Result := True;
  Exit;
 end;

 if Cust_Flag then id_Customer := SYS_INFO^._Undef_Contr;

 if (Mode = somAdd) and VarIsNull(id_Out_Doc) then begin
  StoredProc.ExecProcedure('PUB_GET_ID_DOC', [10]);
  id_Out_Doc := StoredProc.FieldByName('RET_VALUE').AsInt64;
  StoredProc.Close;
 end;

 StoredProc.StoredProcName := 'JO9_DT_ALL_DOC_ADD';
 StoredProc.Prepare;

 StoredProc.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StoredProc.ParamByName('PK_ID').AsInt64         := id_Out_Doc;
 StoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;
 StoredProc.ParamByName('DATE_PROV').AsDate      := ActualDate;
 StoredProc.ParamByName('DATE_DOC').AsDate       := DateDoc.Date;
 StoredProc.ParamByName('ID_TYPE_DOC').AsInteger := SYS_INFO^._id_Tip_Doc_Auto;
 StoredProc.ParamByName('REG_NUM').AsString      := NumDoc.Text;
 StoredProc.ParamByName('SUMMA').AsCurrency      := Doc_Sum;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64   := id_Customer;
 StoredProc.ParamByName('NOTE').AsString         := NoteMemo.Text + #13 + '(Автогенерація документу)';
 StoredProc.ParamByName('KREDIT').AsInteger      := 0;

 StoredProc.ExecProc;

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := ActualDate;
 STRU.DBHANDLE      := StoredProc.Database.Handle;
 STRU.TRHANDLE      := StoredProc.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := SYS_INFO^._id_User;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StoredProc.Transaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines.AddStrings(ErrorList);
  StoredProc.Transaction.Rollback;
  Exit;
 end;

 Result := True;
end;

procedure Tjo9_SpecOper_Form.ProvGrid_KrEnter(Sender: TObject);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.ProvGrid_KrExit(Sender: TObject);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.ProvGrid_DbExit(Sender: TObject);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.ProvGrid_DbEnter(Sender: TObject);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_Form.Action2Execute(Sender: TObject);
begin
 ApplyButtonClick(Sender);
end;

procedure Tjo9_SpecOper_Form.EditDogButton_DbClick(Sender: TObject);
var
 k : integer;
 Res      : TDogResult;
 input    : TDogInput;

 id_Dog   : int64;
 kod_Dog  : int64;
begin
 k := TableView_Db.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := SYS_INFO^._id_Group_Dog_View;
 input.id_Group_add := SYS_INFO^._id_Group_Dog_Add;
 input.Summa        := 0;

 if Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

 with TableView_Db.DataController do begin
  Values[k, 0] := Res.name_customer;
  Values[k, 1] := id_Dog;
  Values[k, 2] := Kod_Dog;
  Values[k, 3] := Res.name_tip_dog;
  Values[k, 4] := Res.regest_num;
  Values[k, 6] := Res.name_shablon;
  Values[k, 8] := Res.id_customer;
 end;
end;

procedure Tjo9_SpecOper_Form.EditDogButton_KrClick(Sender: TObject);
var
 k : integer;
 Res      : TDogResult;
 input    : TDogInput;

 id_Dog   : int64;
 kod_Dog  : int64;
begin
 k := TableView_Kr.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := SYS_INFO^._id_Group_Dog_View;
 input.id_Group_add := SYS_INFO^._id_Group_Dog_Add;
 input.Summa        := 0;

 if Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

 with TableView_Kr.DataController do begin
  Values[k, 0] := Res.name_customer;
  Values[k, 1] := id_Dog;
  Values[k, 2] := Kod_Dog;
  Values[k, 3] := Res.name_tip_dog;
  Values[k, 4] := Res.regest_num;
  Values[k, 6] := Res.name_shablon;
  Values[k, 8] := Res.id_customer;
 end;
end;

procedure Tjo9_SpecOper_Form.FormResize(Sender: TObject);
begin
 DbPanel.Width := (MainPanel.Width - 15) div 2;

 KrPanel.Left  := DbPanel.Width + 10;
 KrPanel.Width := (MainPanel.Width - 15) div 2;

 InfoPanel.Left  := KrPanel.Left;
 InfoPanel.Width := KrPanel.Width;

 DocGroupBox.Width := DbPanel.Width;
 NoteMemo.Width    := DocGroupBox.Width - 140 - 5;

 Shape1.Width := DbPanel.Width - 2;;
 Shape2.Width := KrPanel.Width;
 Shape2.Left  := KrPanel.Left;

 DbNameLabel.Left := DocGroupBox.Left + (DocGroupBox.Width - DbNameLabel.Width) div 2;
 KrNameLabel.Left := InfoPanel.Left   + (InfoPanel.Width   - KrNameLabel.Width) div 2;

 DbDescrLabel.Left := DocGroupBox.Left + (DocGroupBox.Width - DbDescrLabel.Width) div 2;
 KrDescrLabel.Left := InfoPanel.Left   + (InfoPanel.Width   - KrDescrLabel.Width) div 2;

 Sch_Label.Width  := InfoPanel.Width - 73;
 S_Label.Width    := InfoPanel.Width - 73;
 R_Label.Width    := InfoPanel.Width - 73;
 St_Label.Width   := InfoPanel.Width - 73;
 Kekv_Label.Width := InfoPanel.Width - 73;

 BottomPanel_Db.Height := DbPanel.Height div 2;
 BottomPanel_Kr.Height := KrPanel.Height div 2;
end;

procedure Tjo9_SpecOper_Form.PrintButtonClick(Sender: TObject);
var
 i, j : integer;
begin
 if Processing then Exit;

 Processing := True;

 FlashNum  := False;
 FlashMemo := False;
 FlashDate := False;

 if not CheckCorrect(True) then Exit;

 if not FillResProv then Exit;

 if not FileExists('Reports\JO9\JO9_Cur_Doc_Dif.fr3') then begin
  ShowMessage('Файл звіту [Reports\JO9\JO9_Cur_Doc_Dif.fr3] не знайдено!');
  Exit;
 end;

 Report.LoadFromFile('Reports\JO9\JO9_Cur_Doc_Dif.fr3');



 PMemoryData.EmptyTable;

 with PMemoryData do begin
  for i := 0 to Length(ResProv) - 1 do begin
   Append;
   Edit;

   FieldByName('Db_Name_Cust').AsString := ResProv[i]._DB_Name_Cust;
   FieldByName('Db_Reg_Num').AsString   := ResProv[i]._DB_Reg_Num;
   FieldByName('Db_Sch').AsString       := ResProv[i]._DB_kod_Sch;
   FieldByName('Db_S').AsString         := ResProv[i]._DB_kod_S;
   FieldByName('Db_R').AsString         := ResProv[i]._DB_kod_R;
   FieldByName('Db_St').AsString        := ResProv[i]._DB_kod_St;
   FieldByName('Db_Kekv').AsString      := ResProv[i]._DB_kod_Kekv;

   FieldByName('Kr_Name_Cust').AsString := ResProv[i]._KR_Name_Cust;
   FieldByName('Kr_Reg_Num').AsString   := ResProv[i]._KR_Reg_Num;
   FieldByName('Kr_Sch').AsString       := ResProv[i]._KR_kod_Sch;
   FieldByName('Kr_S').AsString         := ResProv[i]._KR_kod_S;
   FieldByName('Kr_R').AsString         := ResProv[i]._KR_kod_R;
   FieldByName('Kr_St').AsString        := ResProv[i]._KR_kod_St;
   FieldByName('Kr_Kekv').AsString      := ResProv[i]._KR_kod_Kekv;

   FieldByName('Summa').AsString        := ResProv[i]._Prov_Summa;

   Post;
  end;
 end;

 Processing := False;
 Report.ShowReport;
end;

procedure Tjo9_SpecOper_Form.ReportGetValue(const VarName: String;
  var Value: Variant);
var
 i : integer;
 s : currency;
begin
 if VarName = 'Num_Doc' then Value := NumDoc.Text
 else if VarName = 'Date_Doc' then Value := DateDoc.Text
 else if VarName = 'Note' then Value := NoteMemo.Text
 else if VarName = 'Total_Count' then Value := Length(ResProv)
 else if VarName = 'Total_Summa' then begin
  s := 0;

  for i := 0 to Length(ResProv) - 1 do s := s + ResProv[i]._Prov_Summa;

  Value := DoCurrFormat(FloatToStrF(s, ffFixed, 100, 2));
 end
 else if VarName = 'Author' then begin
  if SYS_INFO^._Name_User <> '' then Value := '/' + SYS_INFO^._Name_User + '/'
  else Value := '';
 end;
end;

end.
