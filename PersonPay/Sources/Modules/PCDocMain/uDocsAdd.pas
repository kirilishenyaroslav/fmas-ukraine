unit uDocsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxHyperLinkEdit, cxDropDownEdit,
  cxButtonEdit, cxCurrencyEdit, cxCheckBox, cxLookAndFeelPainters,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, DB, FIBDataSet,
  pFIBDataSet, dxBar, cxGridBandedTableView, cxGridTableView, cxRadioGroup,
  StdCtrls, cxButtons, cxMemo, cxMaskEdit, cxCalendar, cxContainer,
  cxGridLevel, cxGridCustomTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, IBase,  Kernel, uDebKrDoc,
  cxSplitter, RxMemDS, frxClass, frxDBSet,
  cxEditRepositoryItems, uMainPerem, frxDesgn,  cn_Common_Types, cn_Common_Loader, ST_Loader_Unit;

type
  TProvRecord = packed record
   _IDD        : integer;
   _id_Prov    : variant;
   _id_Sch1    : variant;
   _id_Sch2    : variant;
   _Num_Sch1   : variant;
   _Num_Sch2   : variant;
   _Name_Sch1  : variant;
   _Name_Sch2  : variant;
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
  end;

  TProvArray = array of TProvRecord;

  TDocsAddForm = class(TForm)
    MainPanel: TPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    DogPanel: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    Name_Customer_Column: TcxGridColumn;
    id_Dog_Column: TcxGridColumn;
    Kod_Dog_Column: TcxGridColumn;
    Tip_Dog_Column: TcxGridColumn;
    Reg_Num_Column: TcxGridColumn;
    Summa_Column: TcxGridColumn;
    Name_Shablon_Column: TcxGridColumn;
    IDD_Column: TcxGridColumn;
    id_Customer_Column: TcxGridColumn;
    GridLevel: TcxGridLevel;
    NumDoc: TcxTextEdit;
    DateDoc: TcxDateEdit;
    NoteMemo: TcxMemo;
    Panel1: TPanel;
    Label3: TLabel;
    CancelButton: TcxButton;
    InfoMemo: TcxMemo;
    ApplyButton: TcxButton;
    InfoPanel: TPanel;
    St_Label: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Sch1_Label: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    Sch2_Label: TLabel;
    Label8: TLabel;
    Kekv_Label: TLabel;
    ProvPanel: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    ProvGrid: TcxGrid;
    ProvTableView: TcxGridTableView;
    id_Prov_Column: TcxGridColumn;
    id_Sch1_Column: TcxGridColumn;
    id_Sch2_Column: TcxGridColumn;
    Num_Sch1_Column: TcxGridColumn;
    Num_Sch2_Column: TcxGridColumn;
    Name_Sch1_Column: TcxGridColumn;
    Name_Sch2_Column: TcxGridColumn;
    id_S_Column: TcxGridColumn;
    id_R_Column: TcxGridColumn;
    id_St_Column: TcxGridColumn;
    Kod_S_Column: TcxGridColumn;
    Kod_R_Column: TcxGridColumn;
    Kod_St_Column: TcxGridColumn;
    kod_Kekv_Column: TcxGridColumn;
    Name_S_Column: TcxGridColumn;
    Name_R_Column: TcxGridColumn;
    Name_St_Column: TcxGridColumn;
    Prov_Summa_Column: TcxGridColumn;
    State_Prov_Column: TcxGridColumn;
    id_Kekv_Column: TcxGridColumn;
    Name_Kekv_Column: TcxGridColumn;
    ProvGridLevel: TcxGridLevel;
    SecGrid: TcxGrid;
    SecTableView: TcxGridTableView;
    id_Prov_Column1: TcxGridColumn;
    id_Sch1_Column1: TcxGridColumn;
    id_Sch2_Column1: TcxGridColumn;
    Num_Sch1_Column1: TcxGridColumn;
    Num_Sch2_Column1: TcxGridColumn;
    Name_Sch1_Column1: TcxGridColumn;
    Name_Sch2_Column1: TcxGridColumn;
    id_S_Column1: TcxGridColumn;
    id_R_Column1: TcxGridColumn;
    id_St_Column1: TcxGridColumn;
    Kod_S_Column1: TcxGridColumn;
    Kod_R_Column1: TcxGridColumn;
    Kod_St_Column1: TcxGridColumn;
    kod_Kekv_Column1: TcxGridColumn;
    Name_S_Column1: TcxGridColumn;
    Name_R_Column1: TcxGridColumn;
    Name_St_Column1: TcxGridColumn;
    Prov_Summa_Column1: TcxGridColumn;
    State_Prov_Column1: TcxGridColumn;
    id_Kekv_Column1: TcxGridColumn;
    Name_Kekv_Column1: TcxGridColumn;
    SecGridLevel: TcxGridLevel;
    SecSplitter: TcxSplitter;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    BarManager: TdxBarManager;
    AddDogButton: TdxBarButton;
    CloneButton: TdxBarButton;
    DelDogButton: TdxBarButton;
    dxBarButton1: TdxBarButton;
    Add_Prov_Button: TdxBarButton;
    Del_Prov_Button: TdxBarButton;
    EditProvButton: TdxBarButton;
    AddSecondButton: TdxBarButton;
    EditDogButton: TdxBarButton;
    DataSet: TpFIBDataSet;
    ActionList: TActionList;
    Action2: TAction;
    StoredProc: TpFIBStoredProc;
    Timer: TTimer;
    FlashTimer: TTimer;
    WQuery: TpFIBQuery;
    PMemoryData: TRxMemoryData;
    PrintButton: TcxButton;
    PDataset: TfrxDBDataset;
    EditRepository: TcxEditRepository;
    cxEditRepository1PopupItem1: TcxEditRepositoryPopupItem;
    cxEditRepository1ButtonItem1: TcxEditRepositoryButtonItem;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    ds_dog: TpFIBDataSet;
    AddFastDogButton: TdxBarButton;
    procedure Add_Prov_ButtonClick(Sender: TObject);
    procedure AddDogButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CloneButtonClick(Sender: TObject);
    procedure Del_Prov_ButtonClick(Sender: TObject);
    procedure DelDogButtonClick(Sender: TObject);
    procedure EditProvButtonClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure kod_Kekv_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kod_S_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Prov_Summa_ColumnPropertiesEditValueChanged(Sender: TObject);
    procedure ProvTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ProvTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Reg_Num_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SchTableViewDblClick(Sender: TObject);
    procedure SchTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TimerTimer(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProvTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action2Execute(Sender: TObject);
    procedure NumDocKeyPress(Sender: TObject; var Key: Char);
    procedure DateDocKeyPress(Sender: TObject; var Key: Char);
    procedure NoteMemoKeyPress(Sender: TObject; var Key: Char);
    procedure AddSecondButtonClick(Sender: TObject);
    procedure ProvGridEnter(Sender: TObject);
    procedure EditDogButtonClick(Sender: TObject);
    procedure MainPanelResize(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure Num_Sch1_ColumnGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure Num_Sch2_ColumnGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure cxEditRepository1PopupItem1PropertiesPopup(Sender: TObject);
    procedure cxEditRepository1PopupItem1PropertiesCloseUp(
      Sender: TObject);
    procedure cxEditRepository1ButtonItem1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure AddFastDogButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Database         : TISC_DB_HANDLE;
    ReadTransaction  : TISC_TR_HANDLE;
    WriteTransaction : TISC_TR_HANDLE;

    Apply        : boolean;

    State        : string;
    is_Native    : boolean;
//    Res          : TResProc;

    Expand       : boolean;
    MemoLines    : TStringList;

    FlashTime    : integer;
    FlashDate    : boolean;
    FlashNum     : boolean;
    FlashMemo    : boolean;

    PK_id        : int64;

    ID_TYPE_DOC  :Integer;

    Processing   : boolean;

    ProvArray    : TProvArray;
    is_Kredit    : boolean;

    ActualDate   : TDate;

    procedure  SetProv(idd, id_Prov : integer);
    procedure  SetLabels;
    function   SaveDoc : boolean;
    destructor Destroy; override;
    procedure  FlashInfoMemo;
    procedure  ExpandInfoMemo;
    procedure  CollapseInfoMemo;
    function   CheckBudget(Num : integer) : boolean;
  end;

var
  DocsAddForm  : TDocsAddForm;  // For add
  DocsAddForm2 : TDocsAddForm; //  For edt

implementation

uses  LoadDogManedger, DogLoaderUnit, GlobalSpr, Math, DateUtils, uSumDoc;
//Input_Sum,
{$R *.dfm}

procedure TDocsAddForm.FormShow(Sender: TObject);
var
 i, j     : integer;
 Flag     : boolean;
 Sum      : currency;
 idd      : integer;
 kr       : string;
 do_group : string;
 n_doc, length_     :Integer;
 num_doc, num_doc_proc :string;
begin
// if SYS_INFO^._Use_Sec_Provs then AddSecondButton.Visible := ivAlways
 AddSecondButton.Visible := ivNever;

 SecGrid.Visible     := False; //SYS_INFO^._Use_Sec_Provs;
 SecSplitter.Visible := False; //SYS_INFO^._Use_Sec_Provs;

// TagTypes.GetFormParams(Self);

 if State <> 'View' then begin
  with SchTableView.DataController do begin
   RecordCount := 0;

   for i := 0 to Length(SCH_ARRAY) - 1 do begin
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := SCH_ARRAY[i][0];
    Values[RecordCount - 1, 1] := SCH_ARRAY[i][1];
    Values[RecordCount - 1, 2] := SCH_ARRAY[i][2];
   end
  end;

 end;

 if State = 'Add' then begin
  DateDoc.Date := Now;
  if FORM_UCH = 20 then
  n_doc:= DataSet.Database.Gen_Id('PC_NUM_DOC_CN', 1);
  if FORM_UCH = 19 then
  n_doc:= DataSet.Database.Gen_Id('PC_NUM_DOC_ST', 1);
  num_doc:=IntToStr(n_doc);
  num_doc_proc:='';
  i:=Length(num_doc);
  while (i<LENGHT_NUM_DOC) do
  begin
  num_doc_proc:=num_doc_proc+'0';
  Inc(i);
  end;
  num_doc_proc:=num_doc_proc+num_doc;
  
  NumDoc.Text:= num_doc_proc;
  PK_id := -5;
 end;

 if State = 'View' then begin
  NumDoc.Style.Color   := $00D9EBE0;
  DateDoc.Style.Color  := $00D9EBE0;
  NoteMemo.Style.Color := $00D9EBE0;

  NumDoc.Properties.ReadOnly   := True;
  DateDoc.Properties.ReadOnly  := True;
  NoteMemo.Properties.ReadOnly := True;

  NumDoc.TabStop   := False;
  DateDoc.TabStop  := False;
  NoteMemo.TabStop := False;

  Summa_Column.Options.Focusing := False;
  ProvTableView.OptionsSelection.CellSelect := False;
  SecTableView.OptionsSelection.CellSelect  := False;
  ApplyButton.Visible := False;

  BarManager.BarByName('ToolBar').Visible := False;
  BarManager.BarByName('ProvBar').Visible := False;

  InfoMemo.Text := 'Документ відчинено для перегляду';
 end
 else if State = 'Edit' then InfoMemo.Text := 'Документ відчинено для редагування';

 if State = 'Add' then Exit;

 if is_Kredit then kr := '1' else kr := '0';
 if is_Native then do_group := '0' else do_group := '1';

 DataSet.Close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text := 'select * from PC_DT_ALL_PROV_SEL(' + IntToStr(PK_id) + ',' + IntToStr(ID_REG) + ',' + kr + ',' + do_group + ') ORDER BY NAME_CUSTOMER ';

 DataSet.Open;

 idd := 0;
 DataSet.FetchAll;
 DataSet.First;
 while not DataSet.Eof do begin
  with TableView.DataController do begin
   Flag := True;
   for i := 0 to RecordCount - 1 do
    if (Values[i, 1] = DataSet['ID_DOG']) and (Values[i, 2] = DataSet['KOD_DOG']) then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    Inc(idd);
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := DataSet['NAME_CUSTOMER'];
    Values[RecordCount - 1, 1] := DataSet['ID_DOG'];
    Values[RecordCount - 1, 2] := DataSet['KOD_DOG'];
    Values[RecordCount - 1, 4] := DataSet['REG_NUM'];
    Values[RecordCount - 1, 6] := DataSet['NAME_SHABLON'];
    Values[RecordCount - 1, 7] := idd;
    Values[RecordCount - 1, 8] := DataSet['ID_CUSTOMER'];
   end
   else idd := Values[i, 7];
  end;

  SetLength(ProvArray, Length(ProvArray) + 1);
  with ProvArray[Length(ProvArray) - 1] do begin
   if Flag then _IDD := idd
   else _IDD := TableView.DataController.Values[i, 7];

   _id_Prov    := DataSet['ID_PROV'];
   _id_Sch1    := DataSet['ID_SCH_DB'];
   _id_Sch2    := DataSet['ID_SCH_KR'];
   _Num_Sch1   := DataSet['NUM_SCH_DB'];
   _Num_Sch2   := DataSet['NUM_SCH_KR'];
   _Name_Sch1  := DataSet['NAME_SCH_DB'];
   _Name_Sch2  := DataSet['NAME_SCH_KR'];
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
//  showmessage(DataSet['NAME_CUSTOMER']+' '+FloatTostr(ProvArray[Length(ProvArray) - 1]._Prov_Summa)+' '+FloatToStr(DataSet['SUMMA']));
  DataSet.Next;
 end;

 DataSet.Close;

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   Sum := 0;

   for j := 0 to Length(ProvArray) - 1 do
    if (Values[i, 7] = ProvArray[j]._IDD) and not (is_Native and ProvArray[j]._is_Sec) then Sum := Sum + ProvArray[j]._Prov_Summa;

   Values[i, 5] := Sum;
  end;
 end;

 with TableView.DataController do if RecordCount > 0 then FocusedRecordIndex := 0;

 with ProvTableView.DataController do if RecordCount > 0 then FocusedRecordIndex := 0;
end;

procedure TDocsAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// TagTypes.SetFormParams(Self);
 if StoredProc.Transaction.Active then StoredProc.Transaction.Rollback;

 MemoLines.Free;
 Close;
// Action := caFree;
end;

procedure TDocsAddForm.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure TDocsAddForm.FormCreate(Sender: TObject);
begin
 MemoLines := TStringList.Create;

 Name_Customer_Column.DataBinding.ValueTypeClass := TcxStringValueType;
 id_Dog_Column.DataBinding.ValueTypeClass        := TcxVariantValueType;
 Kod_Dog_Column.DataBinding.ValueTypeClass       := TcxVariantValueType;
 Tip_Dog_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Reg_Num_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Summa_Column.DataBinding.ValueTypeClass         := TcxCurrencyValueType;
 Name_Shablon_Column.DataBinding.ValueTypeClass  := TcxStringValueType;
 IDD_Column.DataBinding.ValueTypeClass           := TcxIntegerValueType;
 id_Customer_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;

 id_Prov_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 id_Sch1_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 id_Sch2_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Num_Sch1_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 Num_Sch2_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Sch1_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 Name_Sch2_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 id_S_Column.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_R_Column.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_St_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_S_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_R_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 Kod_St_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Name_S_Column.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_R_Column.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_St_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Prov_Summa_Column.DataBinding.ValueTypeClass    := TcxCurrencyValueType;
 State_Prov_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 id_Kekv_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 kod_Kekv_Column.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 Name_Kekv_Column.DataBinding.ValueTypeClass     := TcxStringValueType;

 id_Prov_Column1.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 id_Sch1_Column1.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 id_Sch2_Column1.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 Num_Sch1_Column1.DataBinding.ValueTypeClass     := TcxStringValueType;
 Num_Sch2_Column1.DataBinding.ValueTypeClass     := TcxStringValueType;
 Name_Sch1_Column1.DataBinding.ValueTypeClass    := TcxStringValueType;
 Name_Sch2_Column1.DataBinding.ValueTypeClass    := TcxStringValueType;
 id_S_Column1.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_R_Column1.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_St_Column1.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Kod_S_Column1.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Kod_R_Column1.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Kod_St_Column1.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Name_S_Column1.DataBinding.ValueTypeClass       := TcxStringValueType;
 Name_R_Column1.DataBinding.ValueTypeClass       := TcxStringValueType;
 Name_St_Column1.DataBinding.ValueTypeClass      := TcxStringValueType;
 Prov_Summa_Column1.DataBinding.ValueTypeClass   := TcxCurrencyValueType;
 State_Prov_Column1.DataBinding.ValueTypeClass   := TcxStringValueType;
 id_Kekv_Column1.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 kod_Kekv_Column1.DataBinding.ValueTypeClass     := TcxIntegerValueType;
 Name_Kekv_Column1.DataBinding.ValueTypeClass    := TcxStringValueType;

 id_Sch_Column2.DataBinding.ValueTypeClass       := TcxStringValueType;
 Num_Sch_Column2.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Sch_Column2.DataBinding.ValueTypeClass     := TcxStringValueType;


 Sch1_Label.Caption := '';
 Sch2_Label.Caption := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';
end;

procedure TDocsAddForm.AddDogButtonClick(Sender: TObject);
var
 S        : TSumDocForm;
 Sum      : currency;
 Res      : TDogResult;
 input    : TDogInput;
 i        : integer;
 id_Dog   : int64;
 kod_Dog  : int64;
 id_Prov  : integer;
 idd      : integer;
 AParameter : TcnSimpleParamsEx;
 ResOpl, res_st     : Variant;
 fio, regest_num:string;
// docs     : TDocForm;
begin
 if Length(SCH_ARRAY) = 0 then begin
  ShowMessage('Доступні рахунки відсутні!');
  Exit;
 end;

 S := TSumDocForm.Create(Self);
// S.ShowExtras := True;
// S.Use_fSum   := True;

 if S.ShowModal <> mrOk then Exit;

 Sum := S.cxSumma.Value;

 SYS_ID_USER:=USER_ID;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database;
 input.ReadTrans    := ReadTransaction;
 input.WriteTrans   := WriteTransaction;
 input.FormStyle    := fsNormal;
 input.id_Group     := GROUP_DOG_SEL_COMMON;
 input.id_Group_add := GROUP_DOG_SEL_COMMON;//799; //GROUP_DOG_ADD_COMMON;
 input.Summa        := Sum;

 if State = 'Edit' then
  input.id_doc := PK_id
 else
  input.id_doc := -1;

 if is_Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 input.shablon_data.bUse := True;
 input.shablon_data.num  := NumDoc.Text;
 if DateDoc.Text <> '' then input.shablon_data.date_dog := DateDoc.Date;
 input.shablon_data.note  := NoteMemo.Text;
 input.shablon_data.summa := Sum;

 with input.filter do begin
  bUseFilter      := True;
  bShowFilterForm := False;

{ DateBeg         := StartOfTheMonth(ActualDate);
  DateEnd         := EndOfTheMonth(ActualDate);
  bDate           := True;}

//  if S.fSumCheckBox.Checked then begin
   SummaFrom       := Sum;
   SummaTo         := Sum;
   bSumma          := False;
{  end
  else bSumma      := False;  }

  ShowClosed      := 1;

{  if S.CustCheckBox.Checked then begin
   NameCust  := S.CustEdit.Text;
   bNameCust := True;
  end
  else bNameCust := False;

  if S.RegNumCheckBox.Checked then begin
   RegNum  := S.RegNumEdit.Text;
   bRegNum := True;
  end
  else bRegNum := False; }
 end;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

 with TableView.DataController do begin
  idd := 0;
  for i := 0 to RecordCount - 1 do
   if Values[i, 7] > idd then idd := Values[i, 7];

  inc(idd);

  RecordCount := RecordCount + 1;

 try
// StoredProc.Close;
// StoredProc.Transaction := DocForm.WriteTr;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName:='PC_SYSTEM_FIO';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_DOG').AsInt64:=id_dog;
 StoredProc.ParamByName('ID_SYSTEM').AsInteger:=ID_REG;
 StoredProc.ExecProc;
 fio:= StoredProc.ParamByName('FIO').AsString;
 StoredProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StoredProc.Transaction.Rollback;
  exit;
    end;

 end;
//  Values[RecordCount - 1, 0] := Res.name_customer;
  Values[RecordCount - 1, 0] := fio;
  Values[RecordCount - 1, 1] := id_dog;
  Values[RecordCount - 1, 2] := Kod_Dog;
  Values[RecordCount - 1, 3] := Res.name_tip_dog;
  Values[RecordCount - 1, 4] := Res.regest_num;
  Values[RecordCount - 1, 5] := Sum;
  Values[RecordCount - 1, 6] := Res.name_shablon;
  Values[RecordCount - 1, 7] := IDD;
  Values[RecordCount - 1, 8] := Res.id_customer;
 end;

 id_Prov := 0;
 for i := 0 to Length(ProvArray) - 1 do begin
  if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;
 end;

 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
   SetLength(ProvArray, Length(ProvArray) + 1);
   with ProvArray[Length(ProvArray) - 1] do begin
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

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
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

    // Selecting Budget automatically
    DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(res.Smets[i].NumSmeta)
    + ',' + IntToStr(res.Smets[i].NumRazd) + ',' + IntToStr(res.Smets[i].NumStat) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;

    if DataSet['RESULT'] = 0 then begin
     MemoLines.Add(DataSet['RESULT_MESSAGE']);
     FlashInfoMemo;
    end
    else begin
     if not is_Kredit then begin
      _id_Sch2    := DataSet['ID_FOND'];
      _Num_Sch2   := DataSet['FOND_NUM'];
      _Name_Sch2  := DataSet['FOND_TITLE'];
     end
     else begin
      _id_Sch1    := DataSet['ID_FOND'];
      _Num_Sch1   := DataSet['FOND_NUM'];
      _Name_Sch1  := DataSet['FOND_TITLE'];
     end;
    end;

    DataSet.Close;
   end;
  end;
 end
 else begin
  with TableView.DataController do begin
   SetLength(ProvArray, Length(ProvArray) + 1);
   with ProvArray[Length(ProvArray) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
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
 TableView.DataController.FocusedRecordIndex := TableView.DataController.RecordCount - 1;
 if ProvTableView.DataController.RecordCount > 0 then ProvTableView.DataController.FocusedRecordIndex := 0;
end;

procedure TDocsAddForm.SetProv(idd, id_Prov : integer);
var
 i, j : integer;
 Flag : boolean;
begin
 ProvTableView.DataController.RecordCount := 0;
 SecTableView.DataController.RecordCount  := 0;

 for i := 0 to Length(ProvArray) - 1 do begin
  if (ProvArray[i]._IDD <> idd) or (ProvArray[i]._State_Prov = 'DEL') then Continue;

  Flag := False;

  if ProvArray[i]._is_Sec then begin
   if is_Kredit then begin
    for j := 0 to Length(SCH_ARRAY) - 1 do
     if ProvArray[i]._id_Sch2 = SCH_ARRAY[j][0] then begin
      Flag := True;
      Break;
     end;
   end
   else begin
    for j := 0 to Length(SCH_ARRAY) - 1 do
     if ProvArray[i]._id_Sch1 = SCH_ARRAY[j][0] then begin
      Flag := True;
      Break;
     end;
   end;
  end
  else Flag := True;

  if Flag then with ProvTableView.DataController do begin
   RecordCount := RecordCount + 1;

   if ProvArray[i]._id_Prov = id_Prov then FocusedRecordIndex := RecordCount - 1;

   Values[RecordCount - 1, 0]  := ProvArray[i]._id_Prov;
   Values[RecordCount - 1, 1]  := ProvArray[i]._id_Sch1;
   Values[RecordCount - 1, 2]  := ProvArray[i]._id_Sch2;
   Values[RecordCount - 1, 3]  := ProvArray[i]._Num_Sch1;
   Values[RecordCount - 1, 4]  := ProvArray[i]._Num_Sch2;
   Values[RecordCount - 1, 5]  := ProvArray[i]._Name_Sch1;
   Values[RecordCount - 1, 6]  := ProvArray[i]._Name_Sch2;
   Values[RecordCount - 1, 7]  := ProvArray[i]._id_S;
   Values[RecordCount - 1, 8]  := ProvArray[i]._id_R;
   Values[RecordCount - 1, 9]  := ProvArray[i]._id_St;
   Values[RecordCount - 1, 10] := ProvArray[i]._Kod_S;
   Values[RecordCount - 1, 11] := ProvArray[i]._Kod_R;
   Values[RecordCount - 1, 12] := ProvArray[i]._Kod_St;
   Values[RecordCount - 1, 13] := ProvArray[i]._Kod_Kekv;
   Values[RecordCount - 1, 14] := ProvArray[i]._Name_S;
   Values[RecordCount - 1, 15] := ProvArray[i]._Name_R;
   Values[RecordCount - 1, 16] := ProvArray[i]._Name_St;
   Values[RecordCount - 1, 17] := ProvArray[i]._Prov_Summa;
   Values[RecordCount - 1, 18] := ProvArray[i]._State_Prov;
   Values[RecordCount - 1, 19] := ProvArray[i]._id_Kekv;
   Values[RecordCount - 1, 20] := ProvArray[i]._Name_Kekv;
  end
  else with SecTableView.DataController do begin
   RecordCount := RecordCount + 1;

   if ProvArray[i]._id_Prov = id_Prov then FocusedRecordIndex := RecordCount - 1;

   Values[RecordCount - 1, 0]  := ProvArray[i]._id_Prov;
   Values[RecordCount - 1, 1]  := ProvArray[i]._id_Sch1;
   Values[RecordCount - 1, 2]  := ProvArray[i]._id_Sch2;
   Values[RecordCount - 1, 3]  := ProvArray[i]._Num_Sch1;
   Values[RecordCount - 1, 4]  := ProvArray[i]._Num_Sch2;
   Values[RecordCount - 1, 5]  := ProvArray[i]._Name_Sch1;
   Values[RecordCount - 1, 6]  := ProvArray[i]._Name_Sch2;
   Values[RecordCount - 1, 7]  := ProvArray[i]._id_S;
   Values[RecordCount - 1, 8]  := ProvArray[i]._id_R;
   Values[RecordCount - 1, 9]  := ProvArray[i]._id_St;
   Values[RecordCount - 1, 10] := ProvArray[i]._Kod_S;
   Values[RecordCount - 1, 11] := ProvArray[i]._Kod_R;
   Values[RecordCount - 1, 12] := ProvArray[i]._Kod_St;
   Values[RecordCount - 1, 13] := ProvArray[i]._Kod_Kekv;
   Values[RecordCount - 1, 14] := ProvArray[i]._Name_S;
   Values[RecordCount - 1, 15] := ProvArray[i]._Name_R;
   Values[RecordCount - 1, 16] := ProvArray[i]._Name_St;
   Values[RecordCount - 1, 17] := ProvArray[i]._Prov_Summa;
   Values[RecordCount - 1, 18] := ProvArray[i]._State_Prov;
   Values[RecordCount - 1, 19] := ProvArray[i]._id_Kekv;
   Values[RecordCount - 1, 20] := ProvArray[i]._Name_Kekv;
  end

 end;

 with ProvTableView.DataController do if (FocusedRecordIndex < 0) and (RecordCount > 0) then FocusedRecordIndex := 0;
 with SecTableView.DataController do if (FocusedRecordIndex < 0) and (RecordCount > 0) then FocusedRecordIndex := 0;

 SetLabels;

// ProvGrid.SetFocus;
end;

procedure TDocsAddForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = nil then SetProv(-1, -1)
 else if not VarIsNull(AFocusedRecord.Values[1]) then SetProv(AFocusedRecord.Values[7], -1);
end;

procedure TDocsAddForm.Reg_Num_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := TableView.DataController.FocusedRecordIndex;

 ResProc := nil;

 with TableView.DataController do begin
  if VarIsNull(Values[k, 1]) then Exit;
  if VarIsNull(Values[k, 6]) then Exit;

  LoadDogManedger.LoadShablon(self, DataSet.Database.Handle, fsMDIChild, Values[k, 1], 'prosmotr', -1, PChar(String(Values[k, 6])), ResProc);
 end;
end;

procedure TDocsAddForm.ProvTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SetLabels;
end;

destructor TDocsAddForm.Destroy;
begin
  if State = 'Add' then DocsAddForm := nil
  else if State = 'Edit' then DocsAddForm2 := nil;
  inherited;
end;

procedure TDocsAddForm.Del_Prov_ButtonClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i, n    : integer;
 Flag    : boolean;
 id_Prov : integer;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 if ProvGrid.IsFocused then with ProvTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  Flag := False;
  for i := 0 to Length(ProvArray) - 1 do
   if ProvArray[i]._id_Prov = Values[k, 0] then begin
    if ProvArray[i]._State_Prov <> 'ADD' then ProvArray[i]._State_Prov := 'DEL'
    else Flag := True;
    Break;
   end;

  if Flag then begin
   for n := i + 1 to Length(ProvArray) - 1 do
    ProvArray[n - 1] := ProvArray[n];

   SetLength(ProvArray, Length(ProvArray) - 1);
  end;

  id_Prov := -1;

  if k + 1 < RecordCount then id_Prov := Values[k + 1, 0]
  else if k - 1 >= 0 then id_Prov := Values[k - 1, 0];

  SetProv(TableView.DataController.Values[Rec, 7], id_Prov);

  ProvGrid.SetFocus;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  Flag := False;
  for i := 0 to Length(ProvArray) - 1 do
   if ProvArray[i]._id_Prov = Values[k, 0] then begin
    if ProvArray[i]._State_Prov <> 'ADD' then ProvArray[i]._State_Prov := 'DEL'
    else Flag := True;
    Break;
   end;

  if Flag then begin
   for n := i + 1 to Length(ProvArray) - 1 do
    ProvArray[n - 1] := ProvArray[n];

   SetLength(ProvArray, Length(ProvArray) - 1);
  end;

  id_Prov := -1;

  if k + 1 < RecordCount then id_Prov := Values[k + 1, 0]
  else if k - 1 >= 0 then id_Prov := Values[k - 1, 0];

  SetProv(TableView.DataController.Values[Rec, 7], id_Prov);

  SecGrid.SetFocus;
 end;
end;

procedure TDocsAddForm.Add_Prov_ButtonClick(Sender: TObject);
var
 Rec     : integer;
 id_Prov : integer;
 i       : integer;
 STRU    : WIZARD_GET_PROV_INFO;
 Sum     : currency;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 STRU.DBHANDLE       := Database;
 STRU.AOWNER         := Self;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := ID_REG;
 STRU.NOT_DIF_BDG_FG := True;

 if is_Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

 STRU.ACTUAL_DATE    := ActualDate;
{ STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := SYS_INFO^._NOT_DIF_BDG_FG;  }
 STRU.ID_LANGUAGE    := 2;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 id_Prov := 0;
 Sum     := 0;
 for i := 0 to Length(ProvArray) - 1 do if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;

 with ProvTableView.DataController do begin
  for i := 0 to RecordCount - 1 do if not VarIsNull(Values[i, 17]) then Sum := Sum + Values[i, 17];

  inc(id_Prov);

  SetLength(ProvArray, Length(ProvArray) + 1);

  with ProvArray[Length(ProvArray) - 1] do begin
   _IDD       := TableView.DataController.Values[Rec, 7];
   _id_Prov   := id_Prov;
   _id_Sch1   := STRU.DB_ID_SCH;
   _id_Sch2   := STRU.KR_ID_SCH;
   _Num_Sch1  := STRU.DB_ID_SCH_KOD;
   _Num_Sch2  := STRU.KR_ID_SCH_KOD;
   _Name_Sch1 := STRU.DB_ID_SCH_TIT;
   _Name_Sch2 := STRU.KR_ID_SCH_TIT;


   if is_Kredit then begin
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
   end
   else begin
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
   end;

   if not VarIsNull(TableView.DataController.Values[Rec, 5]) then
    _Prov_Summa := TableView.DataController.Values[Rec, 5] - Sum
   else
    _Prov_Summa := 0;

   _State_Prov := 'ADD';
   _is_Sec     := False;

   SetProv(_IDD, _id_Prov);
  end;
 end;

 ProvGrid.SetFocus;
 ProvTableView.Controller.EditingController.EditingItem := ProvTableView.Items[17];
 SetLabels;
end;

procedure TDocsAddForm.AddSecondButtonClick(Sender: TObject);
var
 Rec     : integer;
 id_Prov : integer;
 i       : integer;
 STRU    : WIZARD_GET_PROV_INFO;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 STRU.DBHANDLE       := Database;
 STRU.AOWNER         := Self;
 STRU.MODE           := 11;
 STRU.ID_REG_UCH     := ID_REG;
// ?????? STRU.ID_REG_UCH     := SYS_INFO^._Main_Book_Reg_Uch;

 if is_Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

 STRU.ACTUAL_DATE    := ActualDate;
{ STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := SYS_INFO^._NOT_DIF_BDG_FG;  }
 STRU.ID_LANGUAGE    := 2;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 id_Prov := 0;
 for i := 0 to Length(ProvArray) - 1 do if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;

 with SecTableView.DataController do begin
  inc(id_Prov);

  SetLength(ProvArray, Length(ProvArray) + 1);

  with ProvArray[Length(ProvArray) - 1] do begin
   _IDD       := TableView.DataController.Values[Rec, 7];
   _id_Prov   := id_Prov;
   _id_Sch1   := STRU.DB_ID_SCH;
   _id_Sch2   := STRU.KR_ID_SCH;
   _Num_Sch1  := STRU.DB_ID_SCH_KOD;
   _Num_Sch2  := STRU.KR_ID_SCH_KOD;
   _Name_Sch1 := STRU.DB_ID_SCH_TIT;
   _Name_Sch2 := STRU.KR_ID_SCH_TIT;


   if is_Kredit then begin
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
   end
   else begin
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
   end;

   _Prov_Summa := 0;

   _State_Prov := 'ADD';
   _is_Sec     := True;

   SetProv(_IDD, _id_Prov);
  end;
 end;

 SecGrid.SetFocus;
 SecTableView.Controller.EditingController.EditingItem := ProvTableView.Items[17];
 SetLabels;
end;

procedure TDocsAddForm.SetLabels;
var
 k : integer;
begin
 Sch1_Label.Caption := '';
 Sch2_Label.Caption := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';


 if ProvGrid.IsFocused or not SecGrid.Focused then with ProvTableView.DataController do begin
  k := FocusedRecordIndex;
  if k >= 0 then begin
   if not VarIsNull(Values[k, 14]) then S_Label.Caption    := Values[k, 10];
   if not VarIsNull(Values[k, 15]) then R_Label.Caption    := Values[k, 11];
   if not VarIsNull(Values[k, 16]) then St_Label.Caption   := Values[k, 12];
   if not VarIsNull(Values[k, 20]) then Kekv_Label.Caption := Values[k, 13];
   if not VarIsNull(Values[k, 5])  then Sch1_Label.Caption := Values[k, 3];
   if not VarIsNull(Values[k, 6])  then Sch2_Label.Caption := Values[k, 4];

   if not VarIsNull(Values[k, 14]) then S_Label.Caption    := S_Label.Caption    + ' "' + Values[k, 14] + '"';
   if not VarIsNull(Values[k, 15]) then R_Label.Caption    := R_Label.Caption    + ' "' + Values[k, 15] + '"';
   if not VarIsNull(Values[k, 16]) then St_Label.Caption   := St_Label.Caption   + ' "' + Values[k, 16] + '"';
   if not VarIsNull(Values[k, 20]) then Kekv_Label.Caption := Kekv_Label.Caption + ' "' + Values[k, 20] + '"';
   if not VarIsNull(Values[k, 5])  then Sch1_Label.Caption := Sch1_Label.Caption + ' "' + Values[k, 5]  + '"';
   if not VarIsNull(Values[k, 6])  then Sch2_Label.Caption := Sch2_Label.Caption + ' "' + Values[k, 6]  + '"';
  end;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k := FocusedRecordIndex;
  if k >= 0 then begin
   if not VarIsNull(Values[k, 14]) then S_Label.Caption    := Values[k, 10];
   if not VarIsNull(Values[k, 15]) then R_Label.Caption    := Values[k, 11];
   if not VarIsNull(Values[k, 16]) then St_Label.Caption   := Values[k, 12];
   if not VarIsNull(Values[k, 20]) then Kekv_Label.Caption := Values[k, 13];
   if not VarIsNull(Values[k, 5])  then Sch1_Label.Caption := Values[k, 3];
   if not VarIsNull(Values[k, 6])  then Sch2_Label.Caption := Values[k, 4];

   if not VarIsNull(Values[k, 14]) then S_Label.Caption    := S_Label.Caption    + ' "' + Values[k, 14] + '"';
   if not VarIsNull(Values[k, 15]) then R_Label.Caption    := R_Label.Caption    + ' "' + Values[k, 15] + '"';
   if not VarIsNull(Values[k, 16]) then St_Label.Caption   := St_Label.Caption   + ' "' + Values[k, 16] + '"';
   if not VarIsNull(Values[k, 20]) then Kekv_Label.Caption := Kekv_Label.Caption + ' "' + Values[k, 20] + '"';
   if not VarIsNull(Values[k, 5])  then Sch1_Label.Caption := Sch1_Label.Caption + ' "' + Values[k, 5]  + '"';
   if not VarIsNull(Values[k, 6])  then Sch2_Label.Caption := Sch2_Label.Caption + ' "' + Values[k, 6]  + '"';
  end;
 end;

 Sch1_Label.Hint := Sch1_Label.Caption;
 Sch2_Label.Hint := Sch2_Label.Caption;
 S_Label.Hint    := S_Label.Caption;
 R_Label.Hint    := R_Label.Caption;
 St_Label.Hint   := St_Label.Caption;
 Kekv_Label.Hint := Kekv_Label.Caption;
end;

procedure TDocsAddForm.SchTableViewDblClick(Sender: TObject);
var
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 Apply := True;

 if Num_Sch1_Column.Editing or Num_Sch2_Column.Editing then
  ProvTableView.Controller.EditingController.HideEdit(True)
 else if Num_Sch1_Column1.Editing or Num_Sch2_Column1.Editing then
  SecTableView.Controller.EditingController.HideEdit(True);
end;

procedure TDocsAddForm.SchTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 {Esc} then ProvTableView.Controller.EditingController.HideEdit(False)
 else if Key = #13 {Enter} then begin
  if SchTableView.DataController.FocusedRecordIndex < 0 then Exit;
  Apply := True;
  ProvTableView.Controller.EditingController.HideEdit(True);
 end;
end;

procedure TDocsAddForm.ProvTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if ((AViewInfo.Item.Index = 3) and not is_Kredit) or ((AViewInfo.Item.Index = 4) and is_Kredit) then begin
  ACanvas.Brush.Color := clWhite;
  ACanvas.Font.Color  := clBlack;
 end;
end;

procedure TDocsAddForm.ApplyButtonClick(Sender: TObject);
var
 Flag : boolean;
 i, j : integer;
 k    : integer;
 Sum  : currency;
begin
 if Processing then Exit;

 Processing := True;

 FlashNum  := False;
 FlashMemo := False;
 FlashDate := False;

 with TableView do begin
  k := DataController.FocusedRecordIndex;
  if k >= 0 then TableViewFocusedRecordChanged(TableView, ViewData.Records[k], ViewData.Records[k], False);
 end;

 MemoLines.Text := '';

 Flag := False;

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

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if VarIsNull(Values[i, 5]) then begin
    MemoLines.Add('Ви не увели суму по договору!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;

   Sum := 0;
   for j := 0 to Length(ProvArray) - 1 do begin
    if ProvArray[j]._IDD <> Values[i, 7] then Continue;
    if ProvArray[j]._State_Prov = 'DEL' then Continue;
    
    if VarIsNull(ProvArray[j]._Prov_Summa) then begin
     MemoLines.Add('Ви не увели суму по проводці!');
     FocusedRecordIndex := i;
     Flag := True;
     Break;
    end;

    if not ProvArray[j]._is_Sec then Sum := Sum + ProvArray[j]._Prov_Summa;
   end;

   if Sum <> Values[i, 5] then begin
    MemoLines.Add('Сума по договору не збігається з сумою по проводкам!');
    FocusedRecordIndex := i;
    Flag := True;
    Break;
   end;
  end;
 end;

 if (State = 'Add') and (Length(ProvArray) = 0) then begin
  MemoLines.Add('Неможна зберегти порoжній документ!');
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

procedure TDocsAddForm.DelDogButtonClick(Sender: TObject);
var
 k    : integer;
 i, j : integer;
 b    : boolean;
 n    : integer;
begin
 with TableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити усі проводки по цьому договору?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  i := 0;
  while i <= ProvTableView.DataController.RecordCount - 1 do
   if ProvTableView.DataController.Values[i, 18] <> 'ADD' then begin
    ProvTableView.DataController.Values[i, 18] := 'DEL';

    for j := 0 to Length(ProvArray) - 1 do
     if ProvArray[j]._id_Prov = ProvTableView.DataController.Values[i, 0] then begin
      ProvArray[j]._State_Prov := 'DEL';
      Break;
     end;
    Inc(i);
   end
   else begin
    b := False;
    for j := 0 to Length(ProvArray) - 1 do
     if ProvArray[j]._id_Prov = ProvTableView.DataController.Values[i, 0] then begin
      b := True;
      Break;
     end;

    if b then begin
     for n := j + 1 to Length(ProvArray) - 1 do
      ProvArray[n - 1] := ProvArray[n];

     SetLength(ProvArray, Length(ProvArray) - 1);
    end; 

    ProvTableView.DataController.DeleteRecord(i);
   end;

  if k + 1 < RecordCount then FocusedRecordIndex := k + 1
  else if k - 1 >=0 then FocusedRecordIndex := k - 1;

  DeleteRecord(k);
 end;
end;

function TDocsAddForm.SaveDoc : boolean;
var
 Kredit      : word;
 i, j        : integer;
 Sum         : currency;
 id_Customer : integer;
 Flag        : boolean;

 KEY_SESSION : Int64;
 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 ErrorList   : TStringList;
 id_acc      : Integer;
begin
  Result := False;

 StoredProc.Transaction.StartTransaction;

 if State = 'Edit' then begin
  // Удаляю существующий документ
  KEY_SESSION := DataSet.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

  STRU.KEY_SESSION   := KEY_SESSION;
  STRU.WORKDATE      := ActualDate;
  STRU.DBHANDLE      := StoredProc.Database.Handle;
  STRU.TRHANDLE      := StoredProc.Transaction.Handle;
  STRU.KERNEL_ACTION := 2;
  STRU.PK_ID         := PK_id;
  STRU.ID_USER       := USER_ID;

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
  end
  else
  begin
    // удаляем счет из таблиц контрактов и студгородка
  StoredProc.StoredProcName := 'PC_DT_DEL_FROM_STUD_CONTR';
  StoredProc.Prepare;

  StoredProc.ParamByName('PK_ID').AsInt64         := PK_id;
  StoredProc.ParamByName('FORM_UCH').AsInteger    := FORM_UCH;

  StoredProc.ExecProc;
  StoredProc.Close;
  end;
 end
 else if (State = 'Add') and (PK_id < 0) then begin
  StoredProc.ExecProcedure('PUB_GET_ID_DOC', [10]);
  PK_id := StoredProc.FieldByName('RET_VALUE').AsInt64;
  StoredProc.Close;
 end;

 Sum := 0;
 for i := 0 to Length(ProvArray) - 1 do
  if (ProvArray[i]._State_Prov <> 'DEL') and (not ProvArray[i]._is_Sec) then  Sum := Sum + ProvArray[i]._Prov_Summa;

 with TableView.DataController do begin
  id_Customer := Values[0, 8];
  Flag := False;
  for i := 1 to RecordCount - 1 do
   if Values[i, 8] <> id_Customer then begin
    Flag := True;
    Break;
   end;

//  if Flag then id_Customer := SYS_INFO^._Undef_Contr;
 end;


 KEY_SESSION := DataSet.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 if is_Kredit then Kredit := 1 else Kredit := 0;

 StoredProc.StoredProcName := 'PC_DT_ALL_DOC_ADD';
 StoredProc.Prepare;

 StoredProc.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StoredProc.ParamByName('PK_ID').AsInt64         := PK_id;
// StoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;
 StoredProc.ParamByName('DATE_PROV').AsDate      := StartOfTheMonth(DateDoc.Date);
 StoredProc.ParamByName('DATE_DOC').AsDate       := DateDoc.Date;
 StoredProc.ParamByName('ID_TYPE_DOC').AsInteger := TYPE_DOC;
 StoredProc.ParamByName('REG_NUM').AsString      := NumDoc.Text;
 StoredProc.ParamByName('SUMMA').AsCurrency      := Sum;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64   := id_Customer;
 StoredProc.ParamByName('NOTE').AsString         := NoteMemo.Text;
 StoredProc.ParamByName('KREDIT').AsInteger      := Kredit;
 StoredProc.ParamByName('FORM_UCH').AsInteger    := FORM_UCH;

 StoredProc.ExecProc;
 id_acc:= StoredProc.FieldByNAme('ID_ACCOUNT').AsInt64;
 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   for j := 0 to Length(ProvArray) - 1 do begin
    if Values[i, 7] <> ProvArray[j]._IDD then Continue;
    if ProvArray[j]._State_Prov = 'DEL' then Continue;

    StoredProc.StoredProcName := 'PC_DT_ALL_PROV_ADD';
    StoredProc.Prepare;

    StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
    StoredProc.ParamByName('KREDIT').AsInteger    := Kredit;
    StoredProc.ParamByName('DATE_PROV').AsDate    := ActualDate;
    StoredProc.ParamByName('DB_ID_SCH').AsInteger := ProvArray[j]._id_Sch1;
    StoredProc.ParamByName('KR_ID_SCH').AsInteger := ProvArray[j]._id_Sch2;
    StoredProc.ParamByName('ID_S').AsInteger      := ProvArray[j]._id_S;
    StoredProc.ParamByName('ID_R').AsInteger      := ProvArray[j]._id_R;
    StoredProc.ParamByName('ID_ST').AsInteger     := ProvArray[j]._id_St;
    StoredProc.ParamByName('ID_KEKV').AsInteger   := ProvArray[j]._id_Kekv;
    StoredProc.ParamByName('SUMMA').AsCurrency    := ProvArray[j]._Prov_Summa;
    StoredProc.ParamByName('ID_DOG').AsInt64      := Values[i, 1];
    StoredProc.ParamByName('KOD_DOG').AsInt64     := Values[i, 2];
    StoredProc.ParamByName('FORM_UCH').AsInteger  := FORM_UCH;
    StoredProc.ParamByName('ID_ACCOUNT').AsInteger:= id_acc;
    
    if not ProvArray[j]._is_Sec then
     StoredProc.ParamByName('IS_MAIN').AsInteger  := 1
    else
     StoredProc.ParamByName('IS_MAIN').AsInteger  := 0;

    StoredProc.ExecProc;
   end;
  end;
 end;

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := ActualDate;
 STRU.DBHANDLE      := StoredProc.Database.Handle;
 STRU.TRHANDLE      := StoredProc.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StoredProc.Transaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;
  // проверяем, если документ созданный в контра или студгородке пустой, удаляем его из тех таблиц
  StoredProc.StoredProcName := 'PC_DT_PROVERKA_ST_CN';
  StoredProc.Prepare;

  StoredProc.ParamByName('PK_ID').AsInt64         := PK_id;
  StoredProc.ParamByName('FORM_UCH').AsInteger    := FORM_UCH;

  StoredProc.ExecProc;
 //

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines.AddStrings(ErrorList);
  StoredProc.Transaction.Rollback;
  Exit;
 end
 else begin
{  WQuery.SQL.Text := 'delete from PUB_DT_ALL_DOC_BUFFER where KEY_SESSION=' + IntToStr(KEY_SESSION);
  WQuery.ExecQuery;

  WQuery.SQL.Text := 'delete from PUB_DT_ALL_PROV_BUFFER where KEY_SESSION=' + IntToStr(KEY_SESSION);
  WQuery.ExecQuery;}

  StoredProc.Transaction.Commit;
 end;
    
 Result := True;

end;

procedure TDocsAddForm.CollapseInfoMemo;
begin
 if InfoMemo.Height > 0 then InfoMemo.Height := InfoMemo.Height - 1
 else begin
  InfoMemo.Lines.AddStrings(MemoLines);
  Expand := True;
 end;
// Timer.Enabled := False;
end;

procedure TDocsAddForm.ExpandInfoMemo;
begin
 if InfoMemo.Height < 56 then InfoMemo.Height := InfoMemo.Height + 1
 else Timer.Enabled := False;
end;

procedure TDocsAddForm.TimerTimer(Sender: TObject);
begin
 if Expand then ExpandInfoMemo
 else CollapseInfoMemo;
end;

procedure TDocsAddForm.FlashTimerTimer(Sender: TObject);
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

procedure TDocsAddForm.FlashInfoMemo;
begin
 InfoMemo.Text := '';
 Expand        := False;
 Timer.Enabled := True;
end;

function TDocsAddForm.CheckBudget(Num : integer): boolean;
begin
 Result := False;

 if Num >= Length(ProvArray) then Exit;

 with ProvArray[Num] do begin
  DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(_id_S)
  + ',' + IntToStr(_id_R) + ',' + IntToStr(_id_St) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
  DataSet.Open;

  if DataSet['RESULT'] = 0 then begin
   MemoLines.Add(DataSet['RESULT_MESSAGE']);
   FlashInfoMemo;
  end
  else begin
   Result := True;

   if not is_Kredit then begin
    _id_Sch2   := DataSet['ID_FOND'];
    _Num_Sch2  := DataSet['FOND_NUM'];
    _Name_Sch2 := DataSet['FOND_TITLE'];
   end
   else begin
    _id_Sch1   := DataSet['ID_FOND'];
    _Num_Sch1  := DataSet['FOND_NUM'];
    _Name_Sch1 := DataSet['FOND_TITLE'];
   end;
  end;

  DataSet.Close;
 end;
end;

procedure TDocsAddForm.Kod_S_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec : integer;
 k   : integer;
 id  : variant;
 i   : integer;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 if ProvGrid.IsFocused then with ProvTableView.DataController do begin
  k  := FocusedRecordIndex;

  id := GlobalSPR.GetSmets(Self, Database, ActualDate, psmRazdSt);

  if VarArrayDimCount(id) <= 0 then Exit;
  if id[0] = NULL then Exit;

  for i := 0 to Length(ProvArray) - 1 do
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0])
   and not ProvArray[i]._is_Sec
   then begin
    with ProvArray[i] do begin
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

    CheckBudget(i);
    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k  := FocusedRecordIndex;

  id := GlobalSPR.GetSmets(self, Database, ActualDate, psmRazdSt);

  if VarArrayDimCount(id) <= 0 then Exit;
  if id[0] = NULL then Exit;

  for i := 0 to Length(ProvArray) - 1 do
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0])
   and ProvArray[i]._is_Sec
   then begin
    with ProvArray[i] do begin
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

    CheckBudget(i);
    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end;
end;

procedure TDocsAddForm.EditProvButtonClick(Sender: TObject);
var
 Rec     : integer;
 k       : integer;
 i       : integer;
 Flag    : boolean;
 STRU    : WIZARD_GET_PROV_INFO;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 k := -1;
 if ProvGrid.IsFocused then
  k := ProvTableView.DataController.FocusedRecordIndex
 else if SecGrid.IsFocused then
  k := SecTableView.DataController.FocusedRecordIndex;

 if k < 0 then Exit;

 STRU.DBHANDLE       := Database;
 STRU.MODE           := 22;
 STRU.ID_REG_UCH     := ID_REG;
 STRU.NOT_DIF_BDG_FG :=True;

 if is_Kredit then STRU.CR_BY_DT := 0
 else STRU.CR_BY_DT := 1;

 STRU.ACTUAL_DATE    := ActualDate;
{ STRU.WIZARD_FORM_SH := SYS_INFO^._WIZARD_FORM_SH;
 STRU.INFO_PANEL_SH  := SYS_INFO^._INFO_PANEL_SH;
 STRU.NOT_DIF_BDG_FG := SYS_INFO^._NOT_DIF_BDG_FG;}
 STRU.ID_LANGUAGE    := 2;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 Flag := False;

 if ProvGrid.IsFocused then
  for i := 0 to Length(ProvArray) - 1 do begin
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = ProvTableView.DataController.Values[k, 0])
   and not ProvArray[i]._is_Sec
   then begin
    Flag := True;
    Break;
   end;
  end
 else 
  for i := 0 to Length(ProvArray) - 1 do begin
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = SecTableView.DataController.Values[k, 0])
   and ProvArray[i]._is_Sec
   then begin
    Flag := True;
    Break;
   end;
  end;

 if not Flag then Exit;

 with ProvArray[i] do begin
  _id_Sch1    := STRU.DB_ID_SCH;
  _id_Sch2    := STRU.KR_ID_SCH;
  _Num_Sch1   := STRU.DB_ID_SCH_KOD;
  _Num_Sch2   := STRU.KR_ID_SCH_KOD;
  _Name_Sch1  := STRU.DB_ID_SCH_TIT;
  _Name_Sch2  := STRU.KR_ID_SCH_TIT;

  if is_Kredit then begin
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
  end
  else begin
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
  end;

  if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

  SetProv(_IDD, _id_Prov);
 end;


 if ProvGrid.IsFocused then
  ProvTableView.Controller.EditingController.EditingItem := ProvTableView.Items[17]
 else if SecGrid.IsFocused then
  SecTableView.Controller.EditingController.EditingItem  := SecTableView.Items[17];


 SetLabels;
end;

procedure TDocsAddForm.kod_Kekv_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec  : integer;
 k, i : integer;
 id   : variant;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 if ProvGrid.IsFocused then with ProvTableView.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if  (ProvArray[i]._IDD = TableView.DataController.Values[Rec, 7])
   and (ProvArray[i]._id_Prov = Values[k, 0]) then begin
    id := GlobalSPR.GetKEKVSpr(self, Database, FSNormal, ActualDate, DEFAULT_ROOT_ID);

    if VarArrayDimCount(id) = 0 then Exit;

    if VarArrayDimCount(id) > 0 then begin
     if id[0][0] <> NULL then with ProvArray[i] do begin
      _id_Kekv   := id[0][0];
      _Name_Kekv := id[0][1];
      _Kod_Kekv  := id[0][2];
     end;
    end;

    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);

    SetLabels;

    Break;
   end;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if  (ProvArray[i]._IDD = TableView.DataController.Values[Rec, 7])
   and (ProvArray[i]._id_Prov = Values[k, 0]) then begin
    id := GlobalSPR.GetKEKVSpr(Self, Database, FSNormal, ActualDate, DEFAULT_ROOT_ID);

    if VarArrayDimCount(id) = 0 then Exit;

    if VarArrayDimCount(id) > 0 then begin
     if id[0][0] <> NULL then with ProvArray[i] do begin
      _id_Kekv   := id[0][0];
      _Name_Kekv := id[0][1];
      _Kod_Kekv  := id[0][2];
     end;
    end;

    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);

    SetLabels;

    Break;
   end;
 end
end;

procedure TDocsAddForm.CloneButtonClick(Sender: TObject);
var
 k        : integer;
 S        : TSumDocForm;
 Sum      : currency;
 CloneSum : currency;
 idd      : integer;
 i        : integer;
 id_Prov  : integer;

 Temp     : TProvArray;

 Max      : integer;
 Num      : integer;
 TotalSum : currency;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 CloneSum := TableView.DataController.Values[k, 5];

 S := TSumDocForm.Create(Self);

// S.ShowExtras   := False;
 S.cxSumma.Text := '0' + DecimalSeparator + '00';

 if S.ShowModal <> mrOk then Exit;

 Sum := S.cxSumma.Value;

 with TableView.DataController do begin
  idd := 0;
  for i := 0 to RecordCount - 1 do
   if Values[i, 7] > idd then idd := Values[i, 7];

  inc(idd);

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := Values[k, 0];
  Values[RecordCount - 1, 1] := Values[k, 1];
  Values[RecordCount - 1, 2] := Values[k, 2];
  Values[RecordCount - 1, 3] := Values[k, 3];
  Values[RecordCount - 1, 4] := Values[k, 4];
  Values[RecordCount - 1, 5] := Sum;
  Values[RecordCount - 1, 6] := Values[k, 6];
  Values[RecordCount - 1, 7] := IDD;
  Values[RecordCount - 1, 8] := Values[k, 8];

  FocusedRecordIndex := RecordCount - 1;
 end;

 id_Prov := 0;
 for i := 0 to Length(ProvArray) - 1 do
  if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;

 Max := 0;
 Num := 0;
 for i := 0 to Length(ProvArray) - 1 do begin
  if ProvArray[i]._IDD <> TableView.DataController.Values[k, 7] then Continue;

  Inc(id_Prov);

  SetLength(Temp, Length(Temp) + 1);
  Temp[Length(Temp) - 1]             := ProvArray[i];
  Temp[Length(Temp) - 1]._id_Prov    := id_Prov;
  Temp[Length(Temp) - 1]._IDD        := idd;
  Temp[Length(Temp) - 1]._State_Prov := 'ADD';

  if ProvArray[i]._Prov_Summa > Max then begin
   Num := i;
   Max := ProvArray[i]._Prov_Summa;
  end;

  if not VarIsNull(Temp[Length(Temp) - 1]._Prov_Summa) then Temp[Length(Temp) - 1]._Prov_Summa := Temp[Length(Temp) - 1]._Prov_Summa * RoundTo((Sum / CloneSum), -2);
 end;

 TotalSum := 0;

 for i := 0 to Length(Temp) - 1 do
  if i <> Num then TotalSum := TotalSum + Temp[i]._Prov_Summa;

 for i := 0 to Length(Temp) - 1 do begin
  SetLength(ProvArray, Length(ProvArray) + 1);

  ProvArray[Length(ProvArray) - 1] := Temp[i];

  if i = Num then ProvArray[Length(ProvArray) - 1]._Prov_Summa :=  Sum - TotalSum;
 end;

 SetProv(IDD, id_Prov);

 ProvGrid.SetFocus;
 ProvTableView.Controller.EditingController.EditingItem := ProvTableView.Items[17];

 SetLabels;
end;

procedure TDocsAddForm.Prov_Summa_ColumnPropertiesEditValueChanged(
  Sender: TObject);
var
 Rec : integer;
 k   : integer;
 i   : integer;
begin
 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 if ProvGrid.IsFocused then with ProvTableView.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0])
   and not ProvArray[i]._is_Sec
   then begin
    with ProvArray[i] do begin
     _Prov_Summa := ProvTableView.Controller.EditingController.Edit.EditValue;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k := FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0])
   and ProvArray[i]._is_Sec
   then begin
    with ProvArray[i] do begin
     _Prov_Summa := SecTableView.Controller.EditingController.Edit.EditValue;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';
    end;

    SetProv(TableView.DataController.Values[Rec, 7], Values[k, 0]);
    SetLabels;

    Break;
   end;
 end
end;

procedure TDocsAddForm.TableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 if Key = VK_INSERT then begin
  if ssCtrl in Shift then CloneButtonClick(Sender)
  else AddDogButtonClick(Sender);

  Exit;
 end;

 if Key = VK_DELETE then begin
  DelDogButtonClick(Sender);
  Exit;
 end;

 if Key = VK_F4 then begin
  EditDogButtonClick(Sender);
  Exit;
 end;

 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView.DataController do
//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
   id_Dog_Column.Visible      := True;
   IDD_Column.Visible         := True;
   id_Customer_Column.Visible := True;
  end;
end;

procedure TDocsAddForm.ProvTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
{ if Key = VK_INSERT then begin
  AddDogClick(Sender);
  Exit;
 end;

 if Key = VK_INSERT then begin
  AddDogClick(Sender);

  Exit;
 end;

 if Key = VK_DELETE then begin
  DelDogClick(Sender);
  Exit;
 end;}

 if ProvTableView.Focused then with ProvTableView.DataController do begin
  if Key = VK_INSERT then begin
   Add_Prov_ButtonClick(Sender);
   Exit;
  end;

  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if Key = VK_F4 then begin
   EditProvButtonClick(Sender);
   Exit;
  end;

  if Key = VK_DELETE then begin
   Del_Prov_ButtonClick(Sender);
   Exit;
  end;


//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_SCH_DB: ' + IntToStr(Values[k, 1]) + #13
             + 'ID_SCH_KR: ' + IntToStr(Values[k, 2]) + #13
             + 'ID_SM: '     + IntToStr(Values[k, 7]) + #13
             + 'ID_RZ: '     + IntToStr(Values[k, 8]) + #13
             + 'ID_ST: '     + IntToStr(Values[k, 9]) + #13
             + 'ID_KEKV: '   + IntToStr(Values[k, 19]));
  except
  end;
 end
 else if ProvTableView.Focused then with ProvTableView.DataController do begin
  if Key = VK_INSERT then begin
   AddSecondButtonClick(Sender);
   Exit;
  end;

  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if Key = VK_F4 then begin
   EditProvButtonClick(Sender);
   Exit;
  end;

  if Key = VK_DELETE then begin
   Del_Prov_ButtonClick(Sender);
   Exit;
  end;

//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_SCH_DB: ' + IntToStr(Values[k, 1]) + #13
             + 'ID_SCH_KR: ' + IntToStr(Values[k, 2]) + #13
             + 'ID_SM: '     + IntToStr(Values[k, 7]) + #13
             + 'ID_RZ: '     + IntToStr(Values[k, 8]) + #13
             + 'ID_ST: '     + IntToStr(Values[k, 9]) + #13
             + 'ID_KEKV: '   + IntToStr(Values[k, 19]));
  except
  end;
 end
end;

procedure TDocsAddForm.Action2Execute(Sender: TObject);
begin
 ApplyButtonClick(Sender);
end;

procedure TDocsAddForm.NumDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  DateDoc.SetFocus;
 end;
end;

procedure TDocsAddForm.DateDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  NoteMemo.SetFocus;
 end;
end;

procedure TDocsAddForm.NoteMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Grid.SetFocus;
 end;
end;

procedure TDocsAddForm.ProvGridEnter(Sender: TObject);
begin
 SetLabels;
end;

procedure TDocsAddForm.EditDogButtonClick(Sender: TObject);
var
 k : integer;
 Res      : TDogResult;
 input    : TDogInput;

 id_Dog   : int64;
 kod_Dog  : int64;
 AParameter : TcnSimpleParamsEx;
 ResOpl, res_st     : Variant;
 fio, regest_num:string;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database;
 input.ReadTrans    := ReadTransaction;
 input.WriteTrans   := WriteTransaction;
 input.FormStyle    := fsNormal;                              
 input.id_Group     := GROUP_DOG_SEL_COMMON;
 input.id_Group_add := GROUP_DOG_SEL_COMMON;//SYS_INFO^._id_Group_Dog_Add;
 input.Summa        := 0;

 if is_Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;
// if FLAG_FULL_DOG=0 then
// begin
 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_Dog      := Res.id_dog;
 Kod_Dog     := Res.kod_dog;

  try
// StoredProc.Close;
// StoredProc.Transaction := DocForm.WriteTr;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName:='PC_SYSTEM_FIO';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_DOG').AsInt64:=id_dog;
 StoredProc.ParamByName('ID_SYSTEM').AsInteger:=ID_REG;
 StoredProc.ExecProc;
 fio:= StoredProc.ParamByName('FIO').AsString;
 StoredProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StoredProc.Transaction.Rollback;
  exit;
    end;

 end;

 with TableView.DataController do begin
  Values[k, 0] := fio;
  Values[k, 1] := id_Dog;
  Values[k, 2] := Kod_Dog;
  Values[k, 3] := Res.name_tip_dog;
  Values[k, 4] := Res.regest_num;
  Values[k, 6] := Res.name_shablon;
  Values[k, 8] := Res.id_customer;
 end;
// end
{ else
 begin
  if ID_SYSTEM='CONTR' then
   begin
    ds_dog.Close;
    ds_dog.SelectSQL.Clear;
    ds_dog.SelectSQL.Add('select a.global_id_dog from cn_dt_accounts_ini a');
    ds_dog.CloseOpen(False);
    kod_dog:=ds_dog['GLOBAL_ID_DOG'];
    AParameter                              := TcnSimpleParamsEx.Create;
    AParameter.Owner                        := self;
    AParameter.Db_Handle                    := Database;
    AParameter.Formstyle                    := fsNormal;
    AParameter.cnParamsToPakage.Note        := '';
    AParameter.WaitPakageOwner              := self;
    AParameter.cnParamsToPakage.IsWithSumma := True;
    AParameter.cnParamsToPakage.Summa       := 0;
    ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
    ID_DOG:= ResOpl[0][2];
    //
    try
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='PC_SYSTEM_FIO';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_DOG').AsInt64:=id_dog;
     StoredProc.ParamByName('ID_SYSTEM').AsInteger:=ID_REG;
     StoredProc.ExecProc;
     fio:= StoredProc.ParamByName('FIO').AsString;
     regest_num:=StoredProc.ParamByName('NUM_DOG').AsString;
     StoredProc.Transaction.Commit;
     except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
      exit;
     end;
    end;
    with TableView.DataController do begin
     Values[k, 0] := fio;
     Values[k, 1] := id_Dog;
     Values[k, 2] := Kod_Dog;
     Values[k, 3] := 0;
     Values[k, 4] := regest_num;
     Values[k, 6] := '';
     Values[k, 8] := 0;
    end;
   end;
 end;}
end;

procedure TDocsAddForm.MainPanelResize(Sender: TObject);
begin
 DogPanel.Width := (MainPanel.Width - 15) div 2;

 ProvPanel.Left  := DogPanel.Width + 10;
 ProvPanel.Width := (MainPanel.Width - 15) div 2;

 InfoPanel.Left  := ProvPanel.Left;
 InfoPanel.Width := ProvPanel.Width;

 Bevel1.Width    := DogPanel.Width;
 NoteMemo.Width  := Bevel1.Width - 147 - 5;

 Sch1_Label.Width := InfoPanel.Width - 73;
 Sch2_Label.Width := InfoPanel.Width - 73;
 S_Label.Width    := InfoPanel.Width - 73;
 R_Label.Width    := InfoPanel.Width - 73;
 St_Label.Width   := InfoPanel.Width - 73;
 Kekv_Label.Width := InfoPanel.Width - 73;

 SecGrid.Height := ProvPanel.Height div 2;
end;

procedure TDocsAddForm.PrintButtonClick(Sender: TObject);
var
 i, j : integer;
begin
 if not FileExists('Reports\JO9\JO9_Cur_Doc.fr3') then begin
  ShowMessage('Файл звіту [Reports\JO9\JO9_Cur_Doc.fr3] не знайдено!');
  Exit;
 end;

 Report.LoadFromFile('Reports\JO9\JO9_Cur_Doc.fr3');

 PMemoryData.EmptyTable;

 with TableView.ViewData do begin
  for i := 0 to RowCount - 1 do begin
   for j := 0 to Length(ProvArray) - 1 do begin
    if ProvArray[j]._IDD <> Rows[i].Values[7] then Continue;

    PMemoryData.Append;
    PMemoryData.Edit;

    PMemoryData.FieldByName('id_Dog').Value    := Rows[i].Values[0];
    PMemoryData.FieldByName('Name_Cust').Value := Rows[i].Values[0];
    PMemoryData.FieldByName('Reg_Num').Value   := Rows[i].Values[4];
    PMemoryData.FieldByName('DSumma').Value    := Rows[i].Values[5];

    PMemoryData.FieldByName('Db_Sch').Value  := ProvArray[j]._Num_Sch1;
    PMemoryData.FieldByName('Kr_Sch').Value  := ProvArray[j]._Num_Sch2;
    PMemoryData.FieldByName('S').Value       := ProvArray[j]._Kod_S;
    PMemoryData.FieldByName('R').Value       := ProvArray[j]._Kod_R;
    PMemoryData.FieldByName('St').Value      := ProvArray[j]._Kod_St;
    PMemoryData.FieldByName('Kekv').Value    := ProvArray[j]._Kod_Kekv;
    PMemoryData.FieldByName('Summa').Value   := ProvArray[j]._Prov_Summa;

    PMemoryData.Post;
   end;
  end;
 end;

 Report.ShowReport;
end;

procedure TDocsAddForm.ReportGetValue(const VarName: String;
  var Value: Variant);
var
 i : integer;
 s : currency;
begin
 if VarName = 'Num_Doc' then Value := NumDoc.Text
 else if VarName = 'Date_Doc' then Value := DateDoc.Text
 else if VarName = 'Note' then Value := NoteMemo.Text
 else if VarName = 'Total_Count' then Value := TableView.DataController.RecordCount
 else if VarName = 'Total_Summa' then begin
  s := 0;

  with TableView.DataController do begin
   for i := 0 to RecordCount - 1 do s := s + Values[i, 5];
  end;

  Value := s;
 end
 else if VarName = 'Author' then begin
  if USER_NAME <> '' then Value := '/' + USER_NAME + '/'
  else Value := '';
 end; 
end;

procedure TDocsAddForm.Num_Sch1_ColumnGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
 if is_Kredit then AProperties := EditRepository.Items[1].Properties
 else AProperties := EditRepository.Items[0].Properties;
end;

procedure TDocsAddForm.Num_Sch2_ColumnGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
 if is_Kredit then AProperties := EditRepository.Items[0].Properties
 else AProperties := EditRepository.Items[1].Properties;
end;

procedure TDocsAddForm.cxEditRepository1PopupItem1PropertiesPopup(
  Sender: TObject);
var
 k   : integer;
 Key : string;
 Col : integer;
begin
 Apply := False;

 if ProvGrid.IsFocused then begin
  k := ProvTableView.DataController.FocusedRecordIndex;

  Col := ProvTableView.Controller.FocusedItem.Index;

  Key := '';
  if VarIsType(ProvTableView.DataController.Values[k, Col], varString) then Key := ProvTableView.DataController.Values[k, Col];
 end
 else if SecGrid.IsFocused then begin
  k := SecTableView.DataController.FocusedRecordIndex;

  Col := SecTableView.Controller.FocusedItem.Index;

  Key := '';
  if VarIsType(SecTableView.DataController.Values[k, Col], varString) then Key := SecTableView.DataController.Values[k, Col];
 end;

 SchTableView.DataController.FocusedRecordIndex := SchTableView.DataController.FindRecordIndexByText(0, 0, Key, False, False, True);
end;

procedure TDocsAddForm.cxEditRepository1PopupItem1PropertiesCloseUp(
  Sender: TObject);
var
 Rec : integer;
 k, t : integer;
 i   : integer;
begin
 if not Apply then Exit;

 Rec := TableView.DataController.FocusedRecordIndex;
 if Rec < 0 then Exit;

 if ProvGrid.IsFocused then with ProvTableView.DataController do begin
  k := FocusedRecordIndex;
  t := SchTableView.ViewData.DataController.FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if  (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0]) then begin
    with ProvArray[i] do begin
     if ProvTableView.Controller.FocusedItem.Index = 3 then begin
      if Integer(_id_Sch1) = SchTableView.DataController.Values[t, 0] then Exit;

      _id_Sch1   := SchTableView.DataController.Values[t, 0];
      _Num_Sch1  := SchTableView.DataController.Values[t, 1];
      _Name_Sch1 := SchTableView.DataController.Values[t, 2];
     end
     else if ProvTableView.Controller.FocusedItem.Index = 4 then begin
      if Integer(_id_Sch2) = SchTableView.DataController.Values[t, 0] then Exit;

       _id_Sch2   := SchTableView.DataController.Values[t, 0];
       _Num_Sch2  := SchTableView.DataController.Values[t, 1];
       _Name_Sch2 := SchTableView.DataController.Values[t, 2];
     end;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

     SetProv(_IDD, _id_Prov);
    end;
   end;
 end
 else if SecGrid.IsFocused then with SecTableView.DataController do begin
  k := FocusedRecordIndex;
  t := SchTableView.ViewData.DataController.FocusedRecordIndex;

  for i := 0 to Length(ProvArray) - 1 do
   if  (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[Rec, 7])
   and (Integer(ProvArray[i]._id_Prov) = Values[k, 0]) then begin
    with ProvArray[i] do begin
     if SecTableView.Controller.FocusedItem.Index = 3 then begin
      if Integer(_id_Sch1) = SchTableView.DataController.Values[t, 0] then Exit;

      _id_Sch1   := SchTableView.DataController.Values[t, 0];
      _Num_Sch1  := SchTableView.DataController.Values[t, 1];
      _Name_Sch1 := SchTableView.DataController.Values[t, 2];
     end
     else if SecTableView.Controller.FocusedItem.Index = 4 then begin
      if Integer(_id_Sch2) = SchTableView.DataController.Values[t, 0] then Exit;

       _id_Sch2   := SchTableView.DataController.Values[t, 0];
       _Num_Sch2  := SchTableView.DataController.Values[t, 1];
       _Name_Sch2 := SchTableView.DataController.Values[t, 2];
     end;

     if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

     SetProv(_IDD, _id_Prov);
    end;
   end;
 end;
end;

procedure TDocsAddForm.cxEditRepository1ButtonItem1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Rec     : TcxCustomGridRecord;
 k       : integer;
 i       : integer;
 Flag    : boolean;
 STRU    : WIZARD_GET_PROV_INFO;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if  k < 0 then Exit;

 Flag := False;

 if ProvGrid.IsFocused then begin
  Rec := ProvTableView.Controller.FocusedRecord;

  if Rec = nil then Exit;

  for i := 0 to Length(ProvArray) - 1 do begin
   if (Integer(ProvArray[i]._IDD) =  TableView.DataController.Values[k, 7])
   and (Integer(ProvArray[i]._id_Prov) = Rec.Values[0])
   and not ProvArray[i]._is_Sec then begin
    Flag := True;
    Break;
   end;
  end;
 end
 else begin
  Rec := SecTableView.Controller.FocusedRecord;

  if Rec = nil then Exit;

  for i := 0 to Length(ProvArray) - 1 do begin
   if (Integer(ProvArray[i]._IDD) = TableView.DataController.Values[k, 7])
   and (Integer(ProvArray[i]._id_Prov) = Rec.Values[0])
   and ProvArray[i]._is_Sec then begin
    Flag := True;
    Break;
   end;
  end;
 end;

 if not Flag then Exit;

 STRU.DBHANDLE       := Database;
 STRU.MODE           := 11;
 STRU.ID_REG_UCH     := 0; //ID_REG;
 STRU.ID_FORM_UCH    :=FORM_UCH;
 with ProvArray[i] do begin
  if is_Kredit then begin
   STRU.CR_BY_DT    := 0;
   STRU.DB_ID_SCH   := -1;
   STRU.KR_ID_SCH   := _id_Sch2;
   STRU.ID_SCH_IN   := _id_Sch2;
   STRU.SCH_SET_FLAG:=0;
  end
  else begin
   STRU.CR_BY_DT    := 1;
   STRU.DB_ID_SCH   := _id_Sch1;
   STRU.KR_ID_SCH   := -1;
   STRU.ID_SCH_IN   := _id_Sch1;
   STRU.SCH_SET_FLAG:=1;
  end;

  STRU.DB_ID_SMETA := _id_S;
  STRU.DB_ID_RAZD  := _id_R;
  STRU.DB_ID_STAT  := _id_St;
  STRU.DB_ID_KEKV  := _id_Kekv;

  STRU.KR_ID_SMETA := _id_S;
  STRU.KR_ID_RAZD  := _id_R;
  STRU.KR_ID_STAT  := _id_St;
  STRU.KR_ID_KEKV  := _id_Kekv;
//  SCH_SET_FLAG  : Integer;         // Флаг: какой из счетов присылается 0-кредитовый, 1- дебетовый
//  CR_BY_DT      : Integer;         // Флаг: какой частью создается проводка 0-кредитовой, 1-дебетовой
//  ID_SCH_IN     : Int64;           // Идентфикатор присылаемого счета
 end;

 STRU.ACTUAL_DATE    := ActualDate;
 STRU.WIZARD_FORM_SH := true;
 STRU.INFO_PANEL_SH  := true;
 STRU.NOT_DIF_BDG_FG := true;
 STRU.ID_LANGUAGE    := 1;

 if not Kernel.WizardGetProvInfo(@STRU) then Exit;

 with ProvArray[i] do begin
  _id_Sch1    := STRU.DB_ID_SCH;
  _id_Sch2    := STRU.KR_ID_SCH;
  _Num_Sch1   := STRU.DB_ID_SCH_KOD;
  _Num_Sch2   := STRU.KR_ID_SCH_KOD;
  _Name_Sch1  := STRU.DB_ID_SCH_TIT;
  _Name_Sch2  := STRU.KR_ID_SCH_TIT;

  if is_Kredit then
  begin
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
   end
   else
   begin
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
   end;

  if _State_Prov <> 'ADD' then _State_Prov := 'MOD';

  SetProv(_IDD, _id_Prov);
 end;

 if ProvGrid.IsFocused then
  ProvTableView.Controller.EditingController.EditingItem := ProvTableView.Items[17]
 else if SecGrid.IsFocused then
  SecTableView.Controller.EditingController.EditingItem  := SecTableView.Items[17];

 SetLabels;
end;

procedure TDocsAddForm.AddFastDogButtonClick(Sender: TObject);
var
 S        : TSumDocForm;
 Sum      : currency;
 Res      : TDogResult;
 input    : TDogInput;
 i        : integer;
 id_Dog   : int64;
 kod_Dog  : int64;
 id_Prov  : integer;
 idd      : integer;
 AParameter : TcnSimpleParamsEx;
 ResOpl, res_st     : Variant;
 fio, regest_num:string;
// docs     : TDocForm;
begin
 if Length(SCH_ARRAY) = 0 then begin
  ShowMessage('Доступні рахунки відсутні!');
  Exit;
 end;

 S := TSumDocForm.Create(Self);
// S.ShowExtras := True;
// S.Use_fSum   := True;

 if S.ShowModal <> mrOk then Exit;

 Sum := S.cxSumma.Value;

 SYS_ID_USER:=USER_ID;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := Database;
 input.ReadTrans    := ReadTransaction;
 input.WriteTrans   := WriteTransaction;
 input.FormStyle    := fsNormal;
 input.id_Group     := GROUP_DOG_SEL_COMMON;
 input.id_Group_add := GROUP_DOG_SEL_COMMON;//799; //GROUP_DOG_ADD_COMMON;
 input.Summa        := Sum;

 if State = 'Edit' then
  input.id_doc := PK_id
 else
  input.id_doc := -1;

 if is_Kredit then input.arndGetPay := 1
 else input.arndGetPay := 0;

 input.shablon_data.bUse := True;
 input.shablon_data.num  := NumDoc.Text;
 if DateDoc.Text <> '' then input.shablon_data.date_dog := DateDoc.Date;
 input.shablon_data.note  := NoteMemo.Text;
 input.shablon_data.summa := Sum;

 with input.filter do begin
  bUseFilter      := True;
  bShowFilterForm := False;

{ DateBeg         := StartOfTheMonth(ActualDate);
  DateEnd         := EndOfTheMonth(ActualDate);
  bDate           := True;}

//  if S.fSumCheckBox.Checked then begin
   SummaFrom       := Sum;
   SummaTo         := Sum;
   bSumma          := False;
{  end
  else bSumma      := False;  }

  ShowClosed      := 1;

{  if S.CustCheckBox.Checked then begin
   NameCust  := S.CustEdit.Text;
   bNameCust := True;
  end
  else bNameCust := False;

  if S.RegNumCheckBox.Checked then begin
   RegNum  := S.RegNumEdit.Text;
   bRegNum := True;
  end
  else bRegNum := False; }
 end;
if ID_SYSTEM='CONTR' then
   begin
     ds_dog.Close;
     ds_dog.SelectSQL.Clear;
     ds_dog.SelectSQL.Add('select a.global_id_dog from cn_dt_accounts_ini a');
     ds_dog.CloseOpen(False);
     kod_dog:=ds_dog['GLOBAL_ID_DOG'];
     AParameter                              := TcnSimpleParamsEx.Create;
     AParameter.Owner                        := self;
     AParameter.Db_Handle                    := Database;
     AParameter.Formstyle                    := fsNormal;
     AParameter.cnParamsToPakage.Note        := '';
     AParameter.WaitPakageOwner              := self;
     AParameter.cnParamsToPakage.IsWithSumma := True;
     AParameter.cnParamsToPakage.Summa       := Sum;
     ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
     ID_DOG:= ResOpl[0][2];
     //
      with TableView.DataController do begin
       idd := 0;
       for i := 0 to RecordCount - 1 do
       if Values[i, 7] > idd then idd := Values[i, 7];
       inc(idd);

       RecordCount := RecordCount + 1;

       try
       StoredProc.Transaction.StartTransaction;
       StoredProc.StoredProcName:='PC_SYSTEM_FIO';
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_DOG').AsInt64:=id_dog;
       StoredProc.ParamByName('ID_SYSTEM').AsInteger:=ID_REG;
       StoredProc.ExecProc;
       fio:= StoredProc.ParamByName('FIO').AsString;
       regest_num:=StoredProc.ParamByName('NUM_DOG').AsString;
       StoredProc.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        exit;
       end;
       end;
      //  Values[RecordCount - 1, 0] := Res.name_customer;
      Values[RecordCount - 1, 0] := fio;
      Values[RecordCount - 1, 1] := id_dog;
      Values[RecordCount - 1, 2] := Kod_Dog;
      Values[RecordCount - 1, 3] := 0;//Res.name_tip_dog;
      Values[RecordCount - 1, 4] := regest_num;
      Values[RecordCount - 1, 5] := Sum;
      Values[RecordCount - 1, 6] := '';//Res.name_shablon;
      Values[RecordCount - 1, 7] := IDD;
      Values[RecordCount - 1, 8] := 0;//Res.id_customer;
     end;

     id_Prov := 0;
     for i := 0 to Length(ProvArray) - 1 do begin
     if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;
     end;

     if ResOpl[0][11] > 0 then begin
     for i := 1 to ResOpl[0][11]  do begin
     SetLength(ProvArray, Length(ProvArray) + 1);
     with ProvArray[Length(ProvArray) - 1] do begin
     _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;
    _id_S       := StrToInt64(ResOpl[i][0]);//res.Smets[i].NumSmeta;
    _id_R       := StrToInt64(ResOpl[i][1]);//res.Smets[i].NumRazd;
    _id_St      := ResOpl[i][2];//res.Smets[i].NumStat;
    _id_Kekv    := ResOpl[i][3];//res.Smets[i].NumKekv;
    _Prov_Summa := ResOpl[i][4];//0;//res.Smets[i].NSumma;
    _State_Prov := 'ADD';

    _is_Sec     := False;

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
    end;

    DataSet.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(ResOpl[i][0]) + ')';
    DataSet.Open;
    _Kod_S  := DataSet['SMETA_KOD'];
    _Name_S := DataSet['SMETA_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(ResOpl[i][1]) + ')';
    DataSet.Open;
    _Kod_R  := DataSet['RAZD_ST_NUM'];
    _Name_R := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(ResOpl[i][2]) + ')';
    DataSet.Open;
    _Kod_St  := DataSet['RAZD_ST_NUM'];
    _Name_St := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(ResOpl[i][3])
    + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;
    _Kod_Kekv  := DataSet['KEKV_CODE'];
    _Name_Kekv := DataSet['KEKV_TITLE'];
    DataSet.Close;

    // Selecting Budget automatically
    DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + Inttostr(ResOpl[i][0])
    + ',' + IntToStr(ResOpl[i][1]) + ',' + IntToStr(ResOpl[i][2]) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;

    if DataSet['RESULT'] = 0 then begin
     MemoLines.Add(DataSet['RESULT_MESSAGE']);
     FlashInfoMemo;
    end
    else begin
     if not is_Kredit then begin
      _id_Sch2    := DataSet['ID_FOND'];
      _Num_Sch2   := DataSet['FOND_NUM'];
      _Name_Sch2  := DataSet['FOND_TITLE'];
     end
     else begin
      _id_Sch1    := DataSet['ID_FOND'];
      _Num_Sch1   := DataSet['FOND_NUM'];
      _Name_Sch1  := DataSet['FOND_TITLE'];
     end;
    end;

    DataSet.Close;
   end;
  end;
 end
 else begin
  with TableView.DataController do begin
   SetLength(ProvArray, Length(ProvArray) + 1);
   with ProvArray[Length(ProvArray) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
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
     //
   end;
   if ID_SYSTEM='STUD_CITY' then
   begin
     ds_dog.Close;
     ds_dog.SelectSQL.Clear;
     ds_dog.SelectSQL.Add('select a.global_id_dog from st_ini a');
     ds_dog.CloseOpen(False);
     kod_dog:=ds_dog['GLOBAL_ID_DOG'];
     Res_st := Load_st_BuildLivers(self, Database, True, '', '',Sum ,True);
     id_dog:=res_st[0][0];

      with TableView.DataController do begin
       idd := 0;
       for i := 0 to RecordCount - 1 do
       if Values[i, 7] > idd then idd := Values[i, 7];
       inc(idd);

       RecordCount := RecordCount + 1;

       try
       StoredProc.Transaction.StartTransaction;
       StoredProc.StoredProcName:='PC_SYSTEM_FIO';
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_DOG').AsInt64:=id_dog;
       StoredProc.ParamByName('ID_SYSTEM').AsInteger:=ID_REG;
       StoredProc.ExecProc;
       fio:= StoredProc.ParamByName('FIO').AsString;
       regest_num:=StoredProc.ParamByName('NUM_DOG').AsString;
       StoredProc.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        exit;
       end;
       end;
      //  Values[RecordCount - 1, 0] := Res.name_customer;
      Values[RecordCount - 1, 0] := fio;
      Values[RecordCount - 1, 1] := id_dog;
      Values[RecordCount - 1, 2] := Kod_Dog;
      Values[RecordCount - 1, 3] := 0;//Res.name_tip_dog;
      Values[RecordCount - 1, 4] := regest_num;
      Values[RecordCount - 1, 5] := Sum;
      Values[RecordCount - 1, 6] := '';//Res.name_shablon;
      Values[RecordCount - 1, 7] := IDD;
      Values[RecordCount - 1, 8] := 0;//Res.id_customer;
     end;

     id_Prov := 0;
     for i := 0 to Length(ProvArray) - 1 do begin
     if ProvArray[i]._id_Prov > id_Prov then id_Prov := ProvArray[i]._id_Prov;
     end;

     if VarArrayDimCount(Res_st)>0  then begin
     //for i := 1 to VarArrayDimCount(Res_st)  do begin
     for i := 1 to VarArrayHighBound(Res_st,1)-1  do begin   
     SetLength(ProvArray, Length(ProvArray) + 1);

     with ProvArray[Length(ProvArray) - 1] do begin
     _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;
    _id_S       := StrToInt64(Res_st[i][0]);//res.Smets[i].NumSmeta;
    _id_R       := StrToInt64(Res_st[i][1]);//res.Smets[i].NumRazd;
    _id_St      := Res_st[i][2];//res.Smets[i].NumStat;
    _id_Kekv    := Res_st[i][3];//res.Smets[i].NumKekv;
    _Prov_Summa := Res_st[i][4];
    _State_Prov := 'ADD';

    _is_Sec     := False;

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
    end;

    DataSet.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(Res_st[i][0]) + ')';
    DataSet.Open;
    _Kod_S  := DataSet['SMETA_KOD'];
    _Name_S := DataSet['SMETA_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(Res_st[i][1]) + ')';
    DataSet.Open;
    _Kod_R  := DataSet['RAZD_ST_NUM'];
    _Name_R := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(Res_st[i][2]) + ')';
    DataSet.Open;
    _Kod_St  := DataSet['RAZD_ST_NUM'];
    _Name_St := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(Res_st[i][3])
    + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;
    _Kod_Kekv  := DataSet['KEKV_CODE'];
    _Name_Kekv := DataSet['KEKV_TITLE'];
    DataSet.Close;

    // Selecting Budget automatically
    DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + Inttostr(Res_st[i][0])
    + ',' + IntToStr(Res_st[i][1]) + ',' + IntToStr(Res_st[i][2]) + ',' + QuotedStr(DateToStr(ActualDate)) + ')';
    DataSet.Open;

    if DataSet['RESULT'] = 0 then begin
     MemoLines.Add(DataSet['RESULT_MESSAGE']);
     FlashInfoMemo;
    end
    else begin
     if not is_Kredit then begin
      _id_Sch2    := DataSet['ID_FOND'];
      _Num_Sch2   := DataSet['FOND_NUM'];
      _Name_Sch2  := DataSet['FOND_TITLE'];
     end
     else begin
      _id_Sch1    := DataSet['ID_FOND'];
      _Num_Sch1   := DataSet['FOND_NUM'];
      _Name_Sch1  := DataSet['FOND_TITLE'];
     end;
    end;

    DataSet.Close;
   end;
  end;
 end
 else begin
  with TableView.DataController do begin
   SetLength(ProvArray, Length(ProvArray) + 1);
   with ProvArray[Length(ProvArray) - 1] do begin
    _IDD    := IDD;
     Inc(id_Prov);
    _id_Prov := id_Prov;

    if not is_Kredit then begin
     _id_Sch1    := SCH_ARRAY[0][0];
     _Num_Sch1   := SCH_ARRAY[0][1];
     _Name_Sch1  := SCH_ARRAY[0][2];
    end
    else begin
     _id_Sch2    := SCH_ARRAY[0][0];
     _Num_Sch2   := SCH_ARRAY[0][1];
     _Name_Sch2  := SCH_ARRAY[0][2];
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
   end;
   TableView.DataController.FocusedRecordIndex := TableView.DataController.RecordCount - 1;
 if ProvTableView.DataController.RecordCount > 0 then ProvTableView.DataController.FocusedRecordIndex := 0;

   end;

end.
