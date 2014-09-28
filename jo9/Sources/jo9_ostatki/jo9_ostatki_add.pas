unit jo9_ostatki_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridLevel, cxGrid, dxBar,
  ExtCtrls, cxGridBandedTableView, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxContainer, cxTextEdit, cxCurrencyEdit, cxMemo,
  cxLookAndFeelPainters, cxButtons, DB, FIBDataSet, pFIBDataSet, ActnList,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxButtonEdit, cxRadioGroup, cxCheckBox,
  cxHyperLinkEdit, tagTypes, IBase, jo9_ostatki;

type
  TSchRecord = packed record
   _id_Sch   : integer;
   _Num_Sch  : string;
   _Name_Sch : string;
  end;

  TSchArray  = array of TSchRecord;

  Tjo9_ostatki_add_Form = class(TForm)
    Panel: TPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    MainPanel: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    id_Ost_Smet_Column: TcxGridColumn;
    id_Dog_Column: TcxGridColumn;
    Tip_Dog_Column: TcxGridColumn;
    Reg_Num_Column: TcxGridColumn;
    Kod_Dog_Column: TcxGridColumn;
    Num_Sch_Column: TcxGridColumn;
    id_S_Column: TcxGridColumn;
    id_R_Column: TcxGridColumn;
    id_St_Column: TcxGridColumn;
    kod_S_Column: TcxGridColumn;
    kod_R_Column: TcxGridColumn;
    kod_St_Column: TcxGridColumn;
    kod_Kekv_Column: TcxGridColumn;
    Summa_Column: TcxGridColumn;
    Name_S_Column: TcxGridColumn;
    Name_R_Column: TcxGridColumn;
    Name_St_Column: TcxGridColumn;
    id_Sch_Column: TcxGridColumn;
    Name_Sch_Column: TcxGridColumn;
    State_Column: TcxGridColumn;
    Can_Edit_Column: TcxGridColumn;
    Edited_Column: TcxGridColumn;
    Name_Shablon_Column: TcxGridColumn;
    id_Kekv_Column: TcxGridColumn;
    Name_Kekv_Column: TcxGridColumn;
    id_CustomerColumn: TcxGridColumn;
    GridLevel: TcxGridLevel;
    NumDoc: TcxTextEdit;
    DateDoc: TcxDateEdit;
    NoteMemo: TcxMemo;
    Panel2: TPanel;
    St_Label: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Sch_Label: TLabel;
    Label7: TLabel;
    Kekv_Label: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    SchGrid: TcxGrid;
    SchTableView: TcxGridTableView;
    id_Sch_Column2: TcxGridColumn;
    Num_Sch_Column2: TcxGridColumn;
    Name_Sch_Column2: TcxGridColumn;
    SchGridLevel: TcxGridLevel;
    RadioGroup: TcxRadioGroup;
    DateMove: TcxDateEdit;
    SumDoc: TcxCurrencyEdit;
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
    AddDog: TdxBarButton;
    CloneButton: TdxBarButton;
    DelDog: TdxBarButton;
    dxBarButton1: TdxBarButton;
    DataSet: TpFIBDataSet;
    ActionList: TActionList;
    Action2: TAction;
    Action1: TAction;
    StoredProc: TpFIBStoredProc;
    procedure CancelButtonClick(Sender: TObject);
    procedure AddDogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SchTableViewDblClick(Sender: TObject);
    procedure Num_Sch_ColumnPropertiesCloseUp(Sender: TObject);
    procedure SchTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure Num_Sch_ColumnPropertiesPopup(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelDogClick(Sender: TObject);
    procedure TableViewEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure kod_S_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SumDocKeyPress(Sender: TObject; var Key: Char);
    procedure NumDocKeyPress(Sender: TObject; var Key: Char);
    procedure DateDocKeyPress(Sender: TObject; var Key: Char);
    procedure NoteMemoKeyPress(Sender: TObject; var Key: Char);
    procedure CloneButtonClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure DateMoveKeyPress(Sender: TObject; var Key: Char);
    procedure CheckCanMove;
    procedure TableViewFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Reg_Num_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure kod_Kekv_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    Database         : TISC_DB_HANDLE;
    ReadTransaction  : TISC_TR_HANDLE;
    WriteTransaction : TISC_TR_HANDLE;

    Apply        : boolean;
    State        : string;

    Res          : TResProc;
    id_Customer  : integer;

    id_Doc       : integer;
    Date_Doc     : TDate;
    DelArray     : TIntArray; // array of deleted records
    SYS_Info     : Pjo9_SYS_INFO;
    CanEditArray : TIntArray;
    procedure  SaveDoc;
    procedure  SetLabels;
    destructor Destroy; override;
  end;

var
  jo9_ostatki_add_Form  : Tjo9_ostatki_add_Form;   // For Add
  jo9_ostatki_add_Form2 : Tjo9_ostatki_add_Form; // For Edit

implementation

uses Input_Sum, globalspr, Math, DogLoaderUnit, LoadDogManedger, tagLibUnit;

{$R *.dfm}

procedure Tjo9_ostatki_add_Form.CheckCanMove;
var
 k : integer;
begin
 if State <> 'Move' then begin
  Num_Sch_Column.Options.Editing := True;
  Exit;
 end; 

 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 Num_Sch_Column.Options.Editing := TableView.DataController.Values[k, 20];
end;

function CheckExtended(s : string; Key : Char; Decimal : integer; Position : byte) : boolean;
var
 k : integer;
begin
 Result := False;

 if Key in [#8, #9, #13] then Result := True
 else if Key = #44 then Result := ((Pos(#44, s) = 0) and (Length(s) - Position <= Decimal))
 else if Key = #45 then Result := Position = 0
 else if Key in ['0'..'9'] then begin
  k := Pos(#44, s);

  if (k = 0) or (Position < k) then Result := True
  else Result := (Length(s) - k < 2);
 end;
end;

procedure Tjo9_ostatki_add_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_ostatki_add_Form.FormCreate(Sender: TObject);
begin
 id_Ost_Smet_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 id_Dog_Column.DataBinding.ValueTypeClass        := TcxStringValueType;
 Kod_Dog_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 id_S_Column.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 id_St_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_R_Column.DataBinding.ValueTypeClass          := TcxIntegerValueType;
 Summa_Column.DataBinding.ValueTypeClass         := TcxCurrencyValueType;
 kod_S_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 kod_R_Column.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 kod_St_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 kod_Kekv_Column.DataBinding.ValueTypeClass      := TcxIntegerValueType;
 Name_S_Column.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_R_Column.DataBinding.ValueTypeClass        := TcxStringValueType;
 Name_St_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Tip_Dog_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Reg_Num_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 id_Sch_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Num_Sch_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Name_Sch_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 id_Kekv_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Name_Kekv_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 id_CustomerColumn.DataBinding.ValueTypeClass    := TcxIntegerValueType;

 id_Sch_Column2.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Num_Sch_Column2.DataBinding.ValueTypeClass      := TcxStringValueType;
 Name_Sch_Column2.DataBinding.ValueTypeClass     := TcxStringValueType;

 State_Column.DataBinding.ValueTypeClass         := TcxStringValueType;
 Can_Edit_Column.DataBinding.ValueTypeClass      := TcxBooleanValueType;
 Edited_Column.DataBinding.ValueTypeClass        := TcxBooleanValueType;
 Name_Shablon_Column.DataBinding.ValueTypeClass  := TcxStringValueType;

 Sch_Label.Caption  := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';
end;

procedure Tjo9_ostatki_add_Form.AddDogClick(Sender: TObject);
var
 S        : TInput_Sum_Form;
 c        : currency;
 Sum      : currency;
 Res      : TDogResult;
 input    : TDogInput;
 i        : integer;
 FocusRec : integer;
begin
 if Length(SYS_INFO^._Native_Sch^) = 0 then begin
  ShowMessage('Відсутні доступні рахунки');
  Exit;
 end;

 c := 0;
 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do if not VarIsNull(Values[i, 13]) then c := c + Values[i, 13];
 end;

 S               := TInput_Sum_Form.Create(Self);
 S.ShowExtras    := False;
 S.SumEdit.Value := SumDoc.Value - c;

 if S.ShowModal <> mrOk then Exit;

 Sum := S.SumEdit.Value;

 input.Owner               := Self;
 input.DBHandle            := Database;
 input.ReadTrans           := ReadTransaction;
 input.WriteTrans          := WriteTransaction;
 input.FormStyle           := fsNormal;
 input.Summa               := Sum;
 input.id_Group            := TagTypes.SYS_ID_GROUP_DOG_V;
 input.id_Group_add        := TagTypes.SYS_ID_GROUP_DOG_A;

 input.shablon_data.bUse := True;
 input.shablon_data.num  := NumDoc.Text;
 if DateDoc.Text <> '' then input.shablon_data.date_dog := DateDoc.Date;
 input.shablon_data.note  := NoteMemo.Text;
 input.shablon_data.summa := Sum;

 input.filter.bUseFilter := True;

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 25] <> res.id_customer then begin
    ShowMessage('Неможливо додати договор!' + #13 + 'Документ повинен містити договори лише одного контрагента!');
    Exit;
   end;
 end;

 FocusRec := -1;

 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
   with TableView.DataController do begin
    FocusRec := RecordCount;

    RecordCount := RecordCount + 1;
    Values[RecordCount - 1, 0]  := -1;
    Values[RecordCount - 1, 1]  := res.id_dog;
    Values[RecordCount - 1, 2]  := res.name_tip_dog;
    Values[RecordCount - 1, 3]  := res.regest_num;
    Values[RecordCount - 1, 4]  := res.kod_dog;
    Values[RecordCount - 1, 5]  := SYS_INFO^._Native_Sch^[0]._Num_Sch;
    Values[RecordCount - 1, 6]  := res.Smets[i].NumSmeta;
    Values[RecordCount - 1, 7]  := res.Smets[i].NumRazd;
    Values[RecordCount - 1, 8]  := res.Smets[i].NumStat;
    Values[RecordCount - 1, 23] := res.Smets[i].NumKekv;
    Values[RecordCount - 1, 13] := res.Smets[i].NSumma;
    Values[RecordCount - 1, 17] := SYS_INFO^._Native_Sch^[0]._id_Sch;
    Values[RecordCount - 1, 18] := SYS_INFO^._Native_Sch^[0]._Name_Sch;
    Values[RecordCount - 1, 22] := res.name_shablon;
    Values[RecordCount - 1, 25] := res.id_customer;

    DataSet.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(res.Smets[i].NumSmeta) + ')';
    DataSet.Open;
    Values[RecordCount - 1, 9]  := DataSet['SMETA_KOD'];
    Values[RecordCount - 1, 14] := DataSet['SMETA_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumRazd) + ')';
    DataSet.Open;
    Values[RecordCount - 1, 10]  := DataSet['RAZD_ST_NUM'];
    Values[RecordCount - 1, 15] := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumStat) + ')';
    DataSet.Open;
    Values[RecordCount - 1, 11]  := DataSet['RAZD_ST_NUM'];
    Values[RecordCount - 1, 16] := DataSet['RAZD_ST_TITLE'];
    DataSet.Close;

    DataSet.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(res.Smets[i].NumKekv)
    + ',' + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ')';
    DataSet.Open;
    Values[RecordCount - 1, 12] := DataSet['KEKV_CODE'];
    Values[RecordCount - 1, 24] := DataSet['KEKV_TITLE'];
    DataSet.Close;

    Values[RecordCount - 1, 19] := 'ADD';
   end;
  end;
 end
 else begin
  with TableView.DataController do begin
   FocusRec := RecordCount;

   RecordCount := RecordCount + 1;
   Values[RecordCount - 1, 0]  := -1;
   Values[RecordCount - 1, 1]  := res.id_dog;
   Values[RecordCount - 1, 2]  := res.name_tip_dog;
   Values[RecordCount - 1, 3]  := res.regest_num;
   Values[RecordCount - 1, 4]  := res.kod_dog;
   Values[RecordCount - 1, 5]  := SYS_INFO^._Native_Sch^[0]._Num_Sch;
   Values[RecordCount - 1, 6]  := -1;
   Values[RecordCount - 1, 7]  := -1;
   Values[RecordCount - 1, 8]  := -1;
   Values[RecordCount - 1, 13] := Sum;
   Values[RecordCount - 1, 17] := SYS_INFO^._Native_Sch^[0]._id_Sch;
   Values[RecordCount - 1, 18] := SYS_INFO^._Native_Sch^[0]._Name_Sch;
   Values[RecordCount - 1, 22] := res.name_shablon;
   Values[RecordCount - 1, 25] := res.id_customer;

   Values[RecordCount - 1, 9]  := null;
   Values[RecordCount - 1, 14] := '';

   Values[RecordCount - 1, 10]  := null;
   Values[RecordCount - 1, 15] := '';

   Values[RecordCount - 1, 11] := null;
   Values[RecordCount - 1, 16] := '';

   Values[RecordCount - 1, 12] := null;
   Values[RecordCount - 1, 23] := -1;
   Values[RecordCount - 1, 24] := '';

   Values[RecordCount - 1, 19] := 'ADD';
  end;

  TableView.Controller.EditingController.EditingItem := TableView.Items[8];
 end;

 if FocusRec >= 0 then TableView.DataController.FocusedRecordIndex := FocusRec;
end;

procedure Tjo9_ostatki_add_Form.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SetLabels;

 CheckCanMove; 
end;

procedure Tjo9_ostatki_add_Form.SchTableViewDblClick(Sender: TObject);
var
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 Apply := True;
 TableView.Controller.EditingController.HideEdit(True);
end;

procedure Tjo9_ostatki_add_Form.Num_Sch_ColumnPropertiesCloseUp(
  Sender: TObject);
var
 k   : integer;
begin
 if not Apply then Exit;

 k := SchTableView.ViewData.DataController.FocusedRecordIndex;

 with TableView.DataController do begin
  if Values[FocusedRecordIndex, 17] = SchTableView.DataController.Values[k, 0] then Exit;

  Values[FocusedRecordIndex, 17] := SchTableView.DataController.Values[k, 0];
  Values[FocusedRecordIndex, 5]  := SchTableView.DataController.Values[k, 1];
  Values[FocusedRecordIndex, 18] := SchTableView.DataController.Values[k, 2];
  Values[FocusedRecordIndex, 21] := True;

  SetLabels;

  if Values[FocusedRecordIndex, 19] <> 'ADD' then begin
   SetLength(DelArray, Length(DelArray) + 1);
   DelArray[Length(DelArray) - 1] := Values[FocusedRecordIndex, 0];

   Values[FocusedRecordIndex, 19] := 'ADD';
  end;
 end;
end;

procedure Tjo9_ostatki_add_Form.SchTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 {Esc} then TableView.Controller.EditingController.HideEdit(False)
 else if Key = #13 {Enter} then begin
  if SchTableView.DataController.FocusedRecordIndex < 0 then Exit;
  Apply := True;
  TableView.Controller.EditingController.HideEdit(True);
 end;
end;

procedure Tjo9_ostatki_add_Form.Num_Sch_ColumnPropertiesPopup(
  Sender: TObject);
var
 k   : integer;
 Key : integer;
begin
 Apply := False;

 k   := TableView.DataController.FocusedRecordIndex;

 Key := -1;

 if not VarIsNull(TableView.DataController.Values[k, 17]) then Key := TableView.DataController.Values[k, 17];
 SchTableView.DataController.FocusedRecordIndex := SchTableView.DataController.FindRecordIndexByText(0, 0, IntToStr(Key), False, False, True);
end;

procedure Tjo9_ostatki_add_Form.ApplyButtonClick(Sender: TObject);
var
 i    : integer;
 Flag : boolean;
begin
 if TableView.DataController.RecordCount = 0 then begin
  ShowMessage('Неможливо зберегти порожній документ!');
  Exit;
 end;

 if NumDoc.Text = '' then begin
  ShowMessage('Ви не ввели номер документу!');
  NumDoc.SetFocus;
  Exit;
 end;

 if DateDoc.Text = '' then begin
  ShowMessage('Ви не ввели дату документу!');
  DateDoc.SetFocus;
  Exit;
 end;

 if NoteMemo.Text = '' then begin
  ShowMessage('Ви не ввели підставу документу!');
  NoteMemo.SetFocus;
  Exit;
 end;

 if TableView.DataController.Summary.FooterSummaryValues[1] <> SumDoc.Value then begin
  ShowMessage('Сума ' + QuotedStr(CurrToStr(TableView.DataController.Summary.FooterSummaryValues[1]))
  + ' не дорівнює сумі документа ' + QuotedStr(SumDoc.Text) + '!');
  SumDoc.SetFocus;
  Exit;
 end;

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if (Values[i, 6] < 0) or (Values[i, 7] < 0) or (Values[i, 8] < 0) or (Values[i, 23] < 0) then begin
    ShowMessage('Ви не обрали Кошторис/Розділ/Статтю/КЕКВ');
    Grid.SetFocus;
    FocusedRecordIndex := i;
    TableView.Controller.EditingController.EditingItem := TableView.Items[8];
    Exit;
   end;
 end;

 if State = 'Move' then with TableView.DataController do begin
  Flag := False;
  for i := 0 to RecordCount - 1 do begin
   if not Values[i, 20] then Continue;
   if not Values[i, 21] then begin
    Flag := True;
    Break;
   end;
  end;

  if Flag then begin
   ShowMessage('Ви не перекинули всі рахунки!');
   Grid.SetFocus;
   FocusedRecordIndex := i;
   Exit;
  end;
 end;

 SaveDoc;

 Res(id_Doc, (RadioGroup.ItemIndex = 1));

 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_ostatki_add_Form.SaveDoc;
var
 Kredit       : char;
 Summa        : currency;

 i            : integer;
begin
 if RadioGroup.ItemIndex = 1 then Kredit := '1' else Kredit := '0';

 Summa := TableView.DataController.Summary.FooterSummaryValues[1];

 id_Customer := TableView.DataController.Values[0, 25];

 StoredProc.Transaction.StartTransaction;

 if State = 'Add' then begin
  StoredProc.ExecProcedure('JO9_DT_OST_DOC_ADD', [Kredit, SYS_INFO^._id_Reg_Uch,
  SYS_INFO^._Period_Beg, id_Customer, NumDoc.Text, DateDoc.Date, DateMove.Date,
  Summa, NoteMemo.Text, SYS_INFO^._id_Server, '1', SYS_INFO^._id_User, SYS_INFO^._Comp_Name]);

  id_Doc := StoredProc.Fields[0].AsInteger;
 end
 else begin
  StoredProc.ExecProcedure('JO9_DT_OST_DOC_UPDATE', [id_Doc, id_Customer, NumDoc.Text,
  DateDoc.Date, DateMove.Date, Summa, NoteMemo.Text, SYS_INFO^._id_Server, SYS_INFO^._id_User,
  SYS_INFO^._Comp_Name]);
 end;

 for i := 0 to Length(DelArray) - 1 do
  StoredProc.ExecProcedure('JO9_DT_OST_SMET_DEL', [DelArray[i]]);

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if Values[i, 19] = 'ADD' then
    StoredProc.ExecProcedure('JO9_DT_OST_SMET_ADD', [id_Doc, Values[i, 1], Values[i, 4],
    Values[i, 17], Values[i, 6], Values[i, 7], Values[i, 8], Values[i, 23], Values[i, 13]])
  end;
 end;

 StoredProc.Transaction.Commit;
end;

procedure Tjo9_ostatki_add_Form.FormShow(Sender: TObject);
var
 i, j : integer;
begin
 GetFormParams(Self);

 Edited_Column.Visible := (State = 'Move');

 for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do with SchTableView.DataController do begin
  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := SYS_INFO^._Native_Sch^[i]._id_Sch;
  Values[RecordCount - 1, 1] := SYS_INFO^._Native_Sch^[i]._Num_Sch;
  Values[RecordCount - 1, 2] := SYS_INFO^._Native_Sch^[i]._Name_Sch;
 end;

 NumDoc.Properties.ReadOnly   := (State = 'View') or (State = 'Move');
 DateDoc.Properties.ReadOnly  := (State = 'View') or (State = 'Move');
 NoteMemo.Properties.ReadOnly := (State = 'View') or (State = 'Move');
 DateMove.Properties.ReadOnly := (State = 'View') or (State = 'Move');
 SumDoc.Properties.ReadOnly   := (State = 'View') or (State = 'Move');

 if (State = 'View') or (State = 'Move') then begin
  NumDoc.Style.Color   := $00D9EBE0;
  DateDoc.Style.Color  := $00D9EBE0;
  NoteMemo.Style.Color := $00D9EBE0;
  DateMove.Style.Color := $00D9EBE0;
  SumDoc.Style.Color   := $00D9EBE0;

  NumDoc.TabStop       := False;
  DateDoc.TabStop      := False;
  NoteMemo.TabStop     := False;
  DateMove.TabStop     := False;
  SumDoc.TabStop       := False;
 end;

 ApplyButton.Visible := not (State = 'View');

 BarManager.BarByName('ToolBar').Visible := not ((State = 'View') or (State = 'Move'));
// TableView.OptionsSelection.CellSelect := not (State = 'View');

 Num_Sch_Column.Options.Focusing  := not (State = 'View');
 kod_S_Column.Options.Focusing    := not (State = 'View');
 kod_Kekv_Column.Options.Focusing := not (State = 'View');
 Summa_Column.Options.Focusing    := not (State = 'View');

 if State = 'Move' then begin
  kod_S_Column.Options.Focusing    := False;
  kod_R_Column.Options.Focusing    := False;
  kod_St_Column.Options.Focusing   := False;
  kod_Kekv_Column.Options.Focusing := False;
  Summa_Column.Options.Focusing    := False;
 end;

 ////////////////////////

 if State = 'Add' then Exit;

 DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL(' + IntToStr(id_Doc)
 + ',' + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ') order by KOD_S, KOD_R, KOD_ST, KOD_KEKV';
 DataSet.Open;

 while not DataSet.Eof do begin
  with TableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0]  := DataSet['ID_OST_SMET'];
   Values[RecordCount - 1, 1]  := DataSet.FieldByName('ID_DOG').AsString;
   Values[RecordCount - 1, 2]  := DataSet['NAME_TIP_DOG'];
   Values[RecordCount - 1, 3]  := DataSet['REG_NUM'];
   Values[RecordCount - 1, 4]  := DataSet['KOD_DOG'];
   Values[RecordCount - 1, 5]  := DataSet['NUM_SCH'];
   Values[RecordCount - 1, 6]  := DataSet['ID_S'];
   Values[RecordCount - 1, 7]  := DataSet['ID_R'];
   Values[RecordCount - 1, 8]  := DataSet['ID_ST'];
   Values[RecordCount - 1, 9]  := DataSet['KOD_S'];
   Values[RecordCount - 1, 10] := DataSet['KOD_R'];
   Values[RecordCount - 1, 11] := DataSet['KOD_ST'];
   Values[RecordCount - 1, 12] := DataSet['KOD_KEKV'];
   Values[RecordCount - 1, 13] := DataSet['SUMMA'];
   Values[RecordCount - 1, 14] := DataSet['NAME_S'];
   Values[RecordCount - 1, 15] := DataSet['NAME_R'];
   Values[RecordCount - 1, 16] := DataSet['NAME_ST'];
   Values[RecordCount - 1, 17] := DataSet['ID_SCH'];
   Values[RecordCount - 1, 18] := DataSet['NAME_SCH'];
   Values[RecordCount - 1, 20] := False;
   Values[RecordCount - 1, 21] := False;
   Values[RecordCount - 1, 22] := DataSet['NAME_SHABLON'];
   Values[RecordCount - 1, 23] := DataSet['ID_KEKV'];
   Values[RecordCount - 1, 24] := DataSet['NAME_KEKV'];
   Values[RecordCount - 1, 25] := id_Customer;
  end;

  DataSet.Next;
 end;
 DataSet.Close;

 if TableView.DataController.RecordCount > 0 then TableView.DataController.FocusedRecordIndex := 0;

 if State <> 'Move' then Exit;

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   for j := 0 to Length(CanEditArray) - 1 do
    if Values[i, 0] = CanEditArray[j] then Values[i, 20] := True;
 end;
end;

procedure Tjo9_ostatki_add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //SetFormParams(Self); by Mardar 14.01.2013 
  if StoredProc.Transaction.Active then StoredProc.Transaction.Rollback;
 Action := caFree;
end;

procedure Tjo9_ostatki_add_Form.DelDogClick(Sender: TObject);
var
 k : integer;
 f : integer;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 f := -1;
 if k + 1 < TableView.DataController.RecordCount then f := k
 else if k - 1 >= 0 then f := k - 1;

 with TableView.DataController do begin
  if Values[k, 19] = 'ADD' then DeleteRecord(k)
  else begin
   SetLength(DelArray, Length(DelArray) + 1);
   DelArray[Length(DelArray) - 1] := Values[k, 0];

   DeleteRecord(k);
  end;
 end;

 TableView.DataController.FocusedRecordIndex := f;
end;

procedure Tjo9_ostatki_add_Form.TableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
 k : integer;
begin
 if AItem.EditValue <> TableView.Controller.EditingController.Edit.EditValue then begin
  k := TableView.ViewData.DataController.FocusedRecordIndex;

  with TableView.DataController do begin
   if Values[k, 19] <> 'ADD' then begin
    SetLength(DelArray, Length(DelArray) + 1);
    DelArray[Length(DelArray) - 1] := Values[k, 0];

    Values[k, 19] := 'ADD';
   end;
  end;
 end;
end;

procedure Tjo9_ostatki_add_Form.kod_S_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k  : integer;
 id : variant;
begin
 k := TableView.DataController.FocusedRecordIndex;

 id := GlobalSPR.GetSmets(self, Database, SYS_INFO^._Period_Beg, psmRazdSt);

 if VarArrayDimCount(id) <= 0 then Exit;
 if id[0] = NULL then Exit;

 with TableView.DataController do begin
  Values[k, 6]  := id[0];
  Values[k, 7]  := id[1];
  Values[k, 8]  := id[2];
  Values[k, 14] := id[4];
  Values[k, 15] := id[5];
  Values[k, 16] := id[6];
  Values[k, 9]  := id[9];
  Values[k, 10] := id[7];
  Values[k, 11] := id[8];

  S_Label.Caption  := Values[k, 14];
  R_Label.Caption  := Values[k, 15];
  St_Label.Caption := Values[k, 16];

  if Values[k, 19] <> 'ADD' then begin
   SetLength(DelArray, Length(DelArray) + 1);
   DelArray[Length(DelArray) - 1] := Values[k, 0];

   Values[k, 19] := 'ADD';
  end;
 end;
end;

procedure Tjo9_ostatki_add_Form.SumDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  NoteMemo.SetFocus;
  Key := #0;
 end;
end;

procedure Tjo9_ostatki_add_Form.NumDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  DateDoc.SetFocus;
  Key := #0;
 end;
end;

procedure Tjo9_ostatki_add_Form.DateDocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  DateMove.SetFocus;
  Key := #0;
 end;
end;

procedure Tjo9_ostatki_add_Form.NoteMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Grid.SetFocus;
  Key := #0;
 end;
end;

procedure Tjo9_ostatki_add_Form.CloneButtonClick(Sender: TObject);
var
 k : integer;
 i : integer;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView.DataController do begin
  RecordCount := RecordCount + 1;

  for i := 0 to 25 do begin
   if i = 13 then Continue;
   Values[RecordCount - 1, i] := Values[k, i];
  end;

  Values[RecordCount - 1, 19] := 'ADD';
  Values[RecordCount - 1, 13] := SumDoc.Value - TableView.DataController.Summary.FooterSummaryValues[1];

  FocusedRecordIndex := RecordCount - 1;
 end;

 TableView.Controller.EditingController.EditingItem := TableView.Items[13];
end;

procedure Tjo9_ostatki_add_Form.Action2Execute(Sender: TObject);
begin
 ApplyButtonClick(Sender);
end;

procedure Tjo9_ostatki_add_Form.DateMoveKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  SumDoc.SetFocus;
  Key := #0;
 end;
end;

procedure Tjo9_ostatki_add_Form.SetLabels;
var
 k : integer;
begin
 Sch_Label.Caption  := '';
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 Kekv_Label.Caption := '';

 k := TableView.DataController.FocusedRecordIndex;
 if k >= 0 then begin
  with TableView.DataController do begin
   if not VarIsNull(Values[k, 14]) then S_Label.Caption    := Values[k, 14];
   if not VarIsNull(Values[k, 15]) then R_Label.Caption    := Values[k, 15];
   if not VarIsNull(Values[k, 16]) then St_Label.Caption   := Values[k, 16];
   if not VarIsNull(Values[k, 18]) then Sch_Label.Caption  := Values[k, 18];
   if not VarIsNull(Values[k, 24]) then Kekv_Label.Caption := Values[k, 24];
  end;
 end;

 Sch_Label.Hint  := Sch_Label.Caption;
 S_Label.Hint    := S_Label.Caption;
 R_Label.Hint    := R_Label.Caption;
 St_Label.Hint   := St_Label.Caption;
 Kekv_Label.Hint := Kekv_Label.Caption;
end;

procedure Tjo9_ostatki_add_Form.TableViewFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
 CheckCanMove;
end;

procedure Tjo9_ostatki_add_Form.TableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if State <> 'Move' then Exit;

 if AViewInfo.Item.Index in [5, 21] then begin
  if AViewInfo.GridRecord.Values[20] then
   ACanvas.Brush.Color := $7799ff
  else
   ACanvas.Brush.Color := $00EBC4A4;
 end;
end;

destructor Tjo9_ostatki_add_Form.Destroy;
begin
 if State ='Add' then jo9_ostatki_add_Form := nil
 else if State = 'Edit' then jo9_ostatki_add_Form2 := nil;
 inherited;
end;

procedure Tjo9_ostatki_add_Form.Reg_Num_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := TableView.DataController.FocusedRecordIndex;

 ResProc := nil;

 with TableView.DataController do begin
  if VarIsNull(Values[k, 1]) then Exit;
  if VarIsNull(Values[k, 22]) then Exit;

  LoadDogManedger.LoadShablon(self, Database, fsMDIChild, Values[k, 4], 'prosmotr', -1, PChar(String(Values[k, 22])), ResProc);
 end;
end;

procedure Tjo9_ostatki_add_Form.kod_Kekv_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k  : integer;
 id : variant;
begin
 k := TableView.DataController.FocusedRecordIndex;

 id := GlobalSPR.GetKEKVSpr(self, Database, FSNormal, SYS_INFO^._Period_Beg, DEFAULT_ROOT_ID);

 if VarArrayDimCount(id) = 0 then Exit;

 if VarArrayDimCount(id) > 0 then begin
  if id[0][0] <> NULL then
   with TableView.DataController do begin
    Values[k, 23] := id[0][0];
    Values[k, 24] := id[0][1];
    Values[k, 12] := id[0][2];

    if Values[k, 19] <> 'ADD' then begin
     SetLength(DelArray, Length(DelArray) + 1);
     DelArray[Length(DelArray) - 1] := Values[k, 0];

     Values[k, 19] := 'ADD';
    end;
   end;
 end;

 SetLabels;
end;

procedure Tjo9_ostatki_add_Form.TableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 if Key = VK_DELETE then begin
  DelDogClick(Sender);
  Exit;
 end;

 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView.DataController do begin
  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_DOG: '       + IntToStr(Values[k, 1])  + #13
             + 'KOD_DOG: '      + IntToStr(Values[k, 4])  + #13
             + 'ID_SM: '        + IntToStr(Values[k, 6])  + #13
             + 'ID_RZ: '        + IntToStr(Values[k, 7])  + #13
             + 'ID_ST: '        + IntToStr(Values[k, 8])  + #13
             + 'ID_KEKV: '      + IntToStr(Values[k, 23]) + #13
             + 'ID_SCH: '       + IntToStr(Values[k, 17]) + #13
             + 'NAME_SHABLON: ' + Values[k, 22]);
  except
  end;
 end;
end;

procedure Tjo9_ostatki_add_Form.Action1Execute(Sender: TObject);
begin
 ApplyButtonClick(Sender);
end;

procedure Tjo9_ostatki_add_Form.FormResize(Sender: TObject);
begin
 Panel.Left := (Width - Panel.Width) div 2;
 Panel.Top  := (Height - Panel.Height) div 2;
end;

end.

