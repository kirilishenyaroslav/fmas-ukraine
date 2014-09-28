unit MoveOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridBandedTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridLevel, cxGrid,
  ExtCtrls, ComCtrls, StdCtrls, cxDropDownEdit, cxTextEdit, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, tagTypes, IBase, cxCurrencyEdit,
  cxButtonEdit, cxHyperLinkEdit, cxCheckComboBox, cxCheckBox,
  cxLookAndFeelPainters, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxContainer, cxMemo, dxBar, cxDBData, cxGridDBTableView;

type
  TOstRecord = packed record
   _id_Ost_Smet   : variant;
   _id_Doc        : variant;
   _Kredit        : variant;
   _Num_Doc       : variant;
   _Date_Doc      : variant;
   _Note          : variant;
   _Hand_Add      : variant;
   _Name_Tip_Dog  : variant;
   _Name_Customer : variant;
   _Doc_Summa     : variant;
   _id_Dog        : variant;
   _Kod_Dog       : variant;
   _id_Sch        : variant;
   _Num_Sch       : variant;
   _Name_Sch      : variant;
   _id_S          : variant;
   _id_R          : variant;
   _id_St         : variant;
   _Summa         : variant;
  end;

  TOstArray = array of TOstRecord;

  TMoveOst_Form = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Grid1Level: TcxGridLevel;
    Grid1: TcxGrid;
    TableView1: TcxGridTableView;
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
    Label4: TLabel;
    Sch_Label: TLabel;
    Sch_id_Sch_Column: TcxGridColumn;
    Sch_Sch_Num_Column: TcxGridColumn;
    Sch_Sch_Name_Column: TcxGridColumn;
    Sch_Db_Summa_Column: TcxGridColumn;
    Sch_Kr_Summa_Column: TcxGridColumn;
    Sch_New_id_Sch_Column: TcxGridColumn;
    Sch_New_Sch_Num_Column: TcxGridColumn;
    Sch_New_Sch_Name_Column: TcxGridColumn;
    Sch_Move_Btn_Column: TcxGridColumn;
    Label1: TLabel;
    New_Sch_Label: TLabel;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    MoveButton: TcxButton;
    CancelButton: TcxButton;
    StoredProc: TpFIBStoredProc;
    Grid2: TcxGrid;
    Grid2Level: TcxGridLevel;
    SchGrid: TcxGrid;
    SchTableView: TcxGridTableView;
    id_Sch_Column2: TcxGridColumn;
    Num_Sch_Column2: TcxGridColumn;
    Name_Sch_Column2: TcxGridColumn;
    SchGridLevel: TcxGridLevel;
    Panel2: TPanel;
    NoteMemo: TcxMemo;
    Label5: TLabel;
    TableView2: TcxGridTableView;
    Name_Sys_Column: TcxGridColumn;
    Num_Doc_Column: TcxGridColumn;
    Name_Customer_Column: TcxGridColumn;
    Summa1_Column: TcxGridColumn;
    Summa2_Column: TcxGridColumn;
    Note_Column: TcxGridColumn;
    Date_Doc_Column: TcxGridColumn;
    id_Ost_Doc_Column: TcxGridColumn;
    Edit_Doc_Button: TcxButton;
    CancelButton2: TcxButton;
    procedure Sch_New_Sch_Num_ColumnPropertiesPopup(Sender: TObject);
    procedure Sch_New_Sch_Num_ColumnPropertiesCloseUp(Sender: TObject);
    procedure TableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SchTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure SchTableViewDblClick(Sender: TObject);
    procedure CheckCanMove;
    procedure TableView1FocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure CancelButtonClick(Sender: TObject);
    procedure MoveButtonClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure TableView2FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Edit_Doc_ButtonClick(Sender: TObject);
    procedure TableView2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    ApplySch : boolean;
    InOst    : TOstArray;
    SYS_INFO : Pjo9_SYS_INFO;
    procedure SelectBadOst;
    function  CheckForBadOst : TModalResult;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE);
    procedure SetLabels;
    procedure SelBySch;
    procedure SelByDogs;
    procedure Refresh;
  end;

function CheckOstatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; Info : Pjo9_SYS_INFO): variant; stdcall;
exports  CheckOstatki;

var
  MoveOst_Form : TMoveOst_Form;

implementation

uses jo9_ostatki_add, Kernel;

{$R *.dfm}

function CheckOstatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; Info : Pjo9_SYS_INFO): variant; stdcall;
var
 Res : TModalResult;
 F   : TMoveOst_Form;
begin
 F := TMoveOst_Form.Create(AOwner);
 F.InitConnection(DBHandle, RTrans);

 F.SYS_INFO := Info;

 Res := F.CheckForBadOst;

 if Res = mrYes then begin
  Result := F.ShowModal;
 end
 else Result := Res;

 F.Free;
end;

procedure TMoveOst_Form.Sch_New_Sch_Num_ColumnPropertiesPopup(
  Sender: TObject);
var
 k   : integer;
 Key : integer;
begin
 ApplySch := False;

 k := TableView1.DataController.FocusedRecordIndex;

 Key := TableView1.DataController.Values[k, 5];
 SchTableView.DataController.FocusedRecordIndex := SchTableView.DataController.FindRecordIndexByText(0, 0, IntToStr(Key), False, False, True);
end;

procedure TMoveOst_Form.Sch_New_Sch_Num_ColumnPropertiesCloseUp(
  Sender: TObject);
var
 k : integer;
begin
 if not ApplySch then Exit;

 k := SchTableView.ViewData.DataController.FocusedRecordIndex;

 with TableView1.DataController do begin
  Values[FocusedRecordIndex, 5] := SchTableView.DataController.Values[k, 0];
  Values[FocusedRecordIndex, 6]  := SchTableView.DataController.Values[k, 1];
  Values[FocusedRecordIndex, 7] := SchTableView.DataController.Values[k, 2];
 end;

 SetLabels;
end;

procedure TMoveOst_Form.TableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 CheckCanMove;
 SetLabels;
end;

procedure TMoveOst_Form.SelectBadOst;
var
 Ost      : TOstArray;
 Temp     : TOstArray;
 i, j     : integer;

 Flag     : boolean;
begin
 InOst := nil;
 Temp  := nil;

 // Выбираю все остатки с закрытых счетов

 DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL_OST('
 + IntToStr(SYS_INFO^._id_Reg_Uch) + ',' + QuotedStr(DateToStr(SYS_INFO^._Period_Beg))
 + ',' + IntToStr(SYS_INFO^._id_Reg_Uch) + ')';
 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(Ost, Length(Ost) + 1);

  with Ost[Length(Ost) - 1] do begin
   _id_Doc        := DataSet['ID_DOC'];
   _Kredit        := DataSet['KREDIT'];
   _Num_Doc       := DataSet['NUM_DOC'];
   _Date_Doc      := DataSet['DATE_DOC'];
   _Note          := DataSet['NOTE'];
   _Hand_Add      := DataSet['HAND_ADD'];
   _Name_Tip_Dog  := DataSet['NAME_TIP_DOG'];
   _Name_Customer := DataSet['NAME_CUSTOMER'];
   _Doc_Summa     := DataSet['DOC_SUMMA'];
   _id_Ost_Smet   := DataSet['ID_OST_SMET'];
   _id_Dog        := DataSet['ID_DOG'];
   _Kod_Dog       := DataSet['KOD_DOG'];
   _id_Sch        := DataSet['ID_SCH'];
   _Num_Sch       := DataSet['NUM_SCH'];
   _Name_Sch      := DataSet['NAME_SCH'];
   _id_S          := DataSet['ID_S'];
   _id_R          := DataSet['ID_R'];
   _id_St         := DataSet['ID_ST'];
   _Summa         := DataSet['SUMMA'];
  end;

  DataSet.Next;
 end;
 DataSet.Close;

 // Формирую временный суммирующий массив остатков

 for i := 0 to Length(Ost) - 1 do begin
  Flag := True;

  for j := 0 to Length(Temp) - 1 do
   if (Ost[i]._Kredit = Temp[j]._Kredit) and (Ost[i]._id_Dog = Temp[j]._id_Dog)
   and (Ost[i]._id_Sch = Temp[j]._id_Sch) and (Ost[i]._id_S = Temp[j]._id_S)
   and (Ost[i]._id_R = Temp[j]._id_R) and (Ost[i]._id_St = Temp[j]._id_St)
   then begin
    Temp[j]._Summa := Temp[j]._Summa + Ost[i]._Summa;
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(Temp, Length(Temp) + 1);
   Temp[Length(Temp) - 1] := Ost[i];
  end;
 end;

 // Формирую массив входящих остатков

 for i := 0 to Length(Temp) - 1 do
  if Temp[i]._Summa <> 0 then begin
   SetLength(InOst, Length(InOst) + 1);
   InOst[Length(InOst) - 1] := Temp[i];
  end;
end;

function TMoveOst_Form.CheckForBadOst : TModalResult;
var
 Temp  : array of string;
 i, j  : integer;
 Flag  : boolean;

 s     : string;
begin
 Result := mrNo;

 SelectBadOst;

 if Length(InOst) = 0 then Exit;

 Temp := nil;
 for i := 0 to Length(InOst) - 1 do begin
  Flag := True;
  for j := 0 to Length(Temp) - 1 do
   if InOst[i]._Num_Sch = Temp[j] then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(Temp, Length(Temp) + 1);

   Temp[Length(Temp) - 1] := InOst[i]._Num_Sch;
  end;
 end;

 s := '';
 for i := 0 to Length(Temp) - 1 do begin
  if i > 0 then s := s + ',';

  s := s + QuotedStr(Temp[i]);
 end;

 Result := MessageDlg('Увага!', 'Рахунки ' + s + ' не знайдені в поточному періоді!' + #13
 + ' Чи бажаєте Ви перекинути залишок?', mtConfirmation, [mbYes, mbNo, mbAbort]);
end;

procedure TMoveOst_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

procedure TMoveOst_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TMoveOst_Form.FormShow(Sender: TObject);
var
 i : integer;
begin
 PageControlChange(Sender);

 for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do with SchTableView.DataController do begin
  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := SYS_INFO^._Native_Sch^[i]._id_Sch;
  Values[RecordCount - 1, 1] := SYS_INFO^._Native_Sch^[i]._Num_Sch;
  Values[RecordCount - 1, 2] := SYS_INFO^._Native_Sch^[i]._Name_Sch;
 end;
end;

procedure TMoveOst_Form.FormCreate(Sender: TObject);
begin
 Sch_id_Sch_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Sch_Sch_Num_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 Sch_Sch_Name_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 Sch_Db_Summa_Column.DataBinding.ValueTypeClass     := TcxCurrencyValueType;
 Sch_Kr_Summa_Column.DataBinding.ValueTypeClass     := TcxCurrencyValueType;
 Sch_New_id_Sch_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 Sch_New_Sch_Num_Column.DataBinding.ValueTypeClass  := TcxStringValueType;
 Sch_New_Sch_Name_Column.DataBinding.ValueTypeClass := TcxStringValueType;
 Sch_Move_Btn_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;

 id_Sch_Column2.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 Num_Sch_Column2.DataBinding.ValueTypeClass  := TcxStringValueType;
 Name_Sch_Column2.DataBinding.ValueTypeClass := TcxStringValueType;

 id_Ost_Doc_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 Name_Sys_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 Num_Doc_Column.DataBinding.ValueTypeClass       := TcxStringValueType;
 Date_Doc_Column.DataBinding.ValueTypeClass      := TcxDateTimeValueType;
 Summa1_Column.DataBinding.ValueTypeClass        := TcxCurrencyValueType;
 Summa2_Column.DataBinding.ValueTypeClass        := TcxCurrencyValueType;
 Note_Column.DataBinding.ValueTypeClass          := TcxStringValueType;
 Name_Customer_Column.DataBinding.ValueTypeClass := TcxStringValueType;

 PageControl.ActivePageIndex := 0;
end;

procedure TMoveOst_Form.SchTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 {Esc} then TableView1.Controller.EditingController.HideEdit(False)
 else if Key = #13 {Enter} then begin
  if SchTableView.DataController.FocusedRecordIndex < 0 then Exit;
  ApplySch := True;
  TableView1.Controller.EditingController.HideEdit(True);
 end;
end;

procedure TMoveOst_Form.SchTableViewDblClick(Sender: TObject);
var
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 ApplySch := True;
 TableView1.Controller.EditingController.HideEdit(True);
end;

procedure TMoveOst_Form.CheckCanMove;
var
 k : integer;
begin
 k := TableView1.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 Sch_Move_Btn_Column.Options.Editing := TableView1.DataController.Values[k, 6] <> '';
end;

procedure TMoveOst_Form.TableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
 CheckCanMove; 
end;

procedure TMoveOst_Form.SetLabels;
var
 k : integer;
begin
 Sch_Label.Caption     := '';
 New_Sch_Label.Caption := '';

 with TableView1.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if not VarIsNull(Values[k, 2]) then Sch_Label.Caption     := Values[k, 2];
  if not VarIsNull(Values[k, 7]) then New_Sch_Label.Caption := Values[k, 7];
 end;
end;

procedure TMoveOst_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TMoveOst_Form.MoveButtonClick(Sender: TObject);
var
 i, j    : integer;
 Flag    : boolean;
 Kr_Doc  : integer;
 Db_Doc  : integer;
 RegDate : TDate;
 k       : integer;
begin
 Flag := False;
 Kr_Doc := -1;
 Db_Doc := -1;

 with TableView1.DataController do begin

  StoredProc.Transaction.StartTransaction;
  for i := 0 to RecordCount - 1 do begin
   if Values[i, 8] = 1 then begin
    Flag   := True;

    for j := 0 to Length(InOst) - 1 do begin
     if InOst[j]._id_Sch <> Values[i, 0] then Continue;

     if InOst[j]._Kredit then begin
      if Kr_Doc < 0 then begin
       RegDate := SYS_INFO^._Period_Beg;

       StoredProc.ExecProcedure('JO9_DT_OST_DOC_ADD', [1, SYS_INFO^._id_Reg_Uch, RegDate,
       {id_Customer} 1, 'AutoKr', Date, Date, Values[i, 4], 'Перекидання рахунків',
       SYS_INFO^._id_Server, '1', SYS_INFO^._id_User, SYS_INFO^._Comp_Name]);

       Kr_Doc := StoredProc.Fields[0].AsInteger;
      end;

      StoredProc.ExecProcedure('JO9_DT_OST_SMET_ADD', [Kr_Doc, InOst[j]._id_Dog, InOst[j]._Kod_Dog,
      InOst[j]._id_Sch, InOst[j]._id_S, InOst[j]._id_R, InOst[j]._id_St, -1 * InOst[j]._Summa]);

      StoredProc.ExecProcedure('JO9_DT_OST_SMET_ADD', [Kr_Doc, InOst[j]._id_Dog, InOst[j]._Kod_Dog,
      Values[i, 5], InOst[j]._id_S, InOst[j]._id_R, InOst[j]._id_St, InOst[j]._Summa]);
     end
     else begin
      if Db_Doc < 0 then begin
       RegDate := SYS_INFO^._Period_Beg;

       StoredProc.ExecProcedure('JO9_DT_OST_DOC_ADD', [0, SYS_INFO^._id_Reg_Uch, RegDate,
       {id_Customer} 1, 'AutoDb', Date, Date, Values[i, 3], 'Перекидання рахунків',
       SYS_INFO^._id_Server, '1', SYS_INFO^._id_User, SYS_INFO^._Comp_Name]);

       Db_Doc := StoredProc.Fields[0].AsInteger;
      end;

      StoredProc.ExecProcedure('JO9_DT_OST_SMET_ADD', [Db_Doc, InOst[j]._id_Dog, InOst[j]._Kod_Dog,
      InOst[j]._id_Sch, InOst[j]._id_S, InOst[j]._id_R, InOst[j]._id_St, -1 * InOst[j]._Summa]);

      StoredProc.ExecProcedure('JO9_DT_OST_SMET_ADD', [Db_Doc, InOst[j]._id_Dog, InOst[j]._Kod_Dog,
      Values[i, 5], InOst[j]._id_S, InOst[j]._id_R, InOst[j]._id_St, InOst[j]._Summa]);
     end;
    end;
   end;
  end;

  StoredProc.Transaction.Commit;

  k := 0;
  while k < RecordCount do
   if Values[k, 8] = 1 then DeleteRecord(k)
   else Inc(k);
 end;

 if not Flag then ShowMessage('Ви не вибрали залишки для перекидання!');
end;

procedure TMoveOst_Form.SelByDogs;
var
 i, j : integer;
 Flag : boolean;
begin
 with TableView2.DataController do begin
  RecordCount := 0;

  for i := 0 to Length(InOst) - 1 do begin

   Flag := False;
   for j := 0 to RecordCount - 1 do
    if Values[j, 0] = InOst[i]._id_Doc then begin
     Flag := True;
     Break;
    end;

   if Flag then begin
    if VarIsNull(Values[j, 4]) then begin
     if InOst[i]._Kredit then Values[j, 5] := InOst[i]._Doc_Summa
     else Values[j, 4] := InOst[i]._Doc_Summa;
    end;
   end
   else begin
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := InOst[i]._id_Doc;
    Values[RecordCount - 1, 1] := InOst[i]._Name_Tip_Dog;
    Values[RecordCount - 1, 2] := InOst[i]._Num_Doc;
    Values[RecordCount - 1, 3] := InOst[i]._Date_Doc;

    if InOst[i]._Kredit then
     Values[RecordCount - 1, 5] := InOst[i]._Doc_Summa
    else
     Values[RecordCount - 1, 4] := InOst[i]._Doc_Summa;

    Values[RecordCount - 1, 6] := InOst[i]._Note;
    Values[RecordCount - 1, 7] := InOst[i]._Name_Customer;
   end;
  end;
 end;

 Grid2.SetFocus;
 if TableView2.DataController.RecordCount > 0 then TableView2.DataController.FocusedRecordIndex := 0;
end;

procedure TMoveOst_Form.SelBySch;
var
 i, j : integer;
 Flag : boolean;
begin
 with TableView1.DataController do begin
  RecordCount := 0;

  for i := 0 to Length(InOst) - 1 do begin

   Flag := False;
   for j := 0 to RecordCount - 1 do
    if Values[j, 0] = InOst[i]._id_Sch then begin
     Flag := True;
     Break;
    end;

   if Flag then begin
    if InOst[i]._Kredit then begin
     if VarIsNull(Values[j, 4]) then Values[j, 4] := 0;
     Values[j, 4] := Values[j, 4] + InOst[i]._Summa;
    end
    else begin
     if VarIsNull(Values[j, 3]) then Values[j, 3] := 0;
     Values[j, 3] := Values[j, 3] + InOst[i]._Summa;
    end;
   end
   else begin
    RecordCount := RecordCount + 1;

    Values[RecordCount - 1, 0] := InOst[i]._id_Sch;
    Values[RecordCount - 1, 1] := InOst[i]._Num_Sch;
    Values[RecordCount - 1, 2] := InOst[i]._Name_Sch;

    if InOst[i]._Kredit then
     Values[RecordCount - 1, 4] := InOst[i]._Summa
    else
     Values[RecordCount - 1, 3] := InOst[i]._Summa;

    Values[RecordCount - 1, 5] := -1;
    Values[RecordCount - 1, 6] := '';
    Values[RecordCount - 1, 7] := '';
    Values[RecordCount - 1, 8] := 0;
   end;
  end;
 end;

 Grid1.SetFocus;
 if TableView1.DataController.RecordCount > 0 then TableView1.DataController.FocusedRecordIndex := 0;
end;

procedure TMoveOst_Form.PageControlChange(Sender: TObject);
begin
 if PageControl.ActivePageIndex = 0 then begin
  Width  := 510;
  Height := 375;
  SelBySch;
 end
 else begin
  SelByDogs;
  Width  := 590;
  Height := 410
 end;
end;

procedure TMoveOst_Form.TableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 NoteMemo.Text := '';

 if AFocusedRecord = nil then Exit;

 if not VarIsNull(AFocusedRecord.Values[6]) then NoteMemo.Text := AFocusedRecord.Values[6];
end;

procedure TMoveOst_Form.Edit_Doc_ButtonClick(Sender: TObject);
var
 k          : integer;
 i          : integer;
 F          : Tjo9_ostatki_add_Form;

 id_Doc     : integer;
 MoveInfo   : TIntArray;

 RecInfo    : RECORD_INFO_STRUCTURE;
 ResultInfo : RESULT_STRUCTURE;
begin
 k := TableView2.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 id_Doc := TableView2.DataController.Values[k, 0];

 if not WriteTransaction.Active then WriteTransaction.StartTransaction;

 RecInfo.TRHANDLE       := WriteTransaction.Handle;
 RecInfo.DBHANDLE       := Database.Handle;
 RecInfo.ID_RECORD      := VarArrayOf([id_Doc]);
 RecInfo.PK_FIELD_NAME  := VarArrayOf(['ID_OST_DOC']);
 RecInfo.TABLE_NAME     := 'JO9_DT_OST_DOC';
 RecInfo.RAISE_FLAG     := false;

 ResultInfo := Kernel.LockRecord(@RecInfo);
 if ResultInfo.RESULT_CODE = 0 then begin
  WriteTransaction.Rollback;
  ShowMessage(ResultInfo.RESULT_MESSAGE);
  Exit;
 end;

 MoveInfo := nil;
 for i := 0 to Length(InOst) - 1 do
  if InOst[i]._id_Doc = id_Doc then begin
   SetLength(MoveInfo, Length(MoveInfo) + 1);
   MoveInfo[Length(MoveInfo) - 1] := InOst[i]._id_Ost_Smet;
  end;

 if Length(MoveInfo) = 0 then Exit;

 F := Tjo9_ostatki_add_Form.Create(Self);
 F.State    := 'Move';
 F.Caption  := 'Зміна залишків';
 F.SYS_INFO := SYS_INFO;
 F.CanEditArray := MoveInfo;

 if not VarIsNull(TableView2.DataController.Values[k, 4]) then F.RadioGroup.ItemIndex := 1
 else if not VarIsNull(TableView2.DataController.Values[k, 5]) then F.RadioGroup.ItemIndex := 0;

 F.RadioGroup.Enabled   := False;

 F.NumDoc.Text   := TableView2.DataController.Values[k, 2];
 F.NoteMemo.Text := TableView2.DataController.Values[k, 6];
 F.DateDoc.Date  := TableView2.DataController.Values[k, 3];

 F.DataSet.Database       := Database;
 F.DataSet.Transaction    := ReadTransaction;
 F.StoredProc.Database    := Database;
 F.StoredProc.Transaction := WriteTransaction;
// F.DateMove.Date := TableView.DataController.Values[k, 9];

 if not VarIsNull(TableView2.DataController.Values[k, 4]) then F.SumDoc.Text   := CurrToStr(TableView2.DataController.Values[k, 4])
 else if not VarIsNull(TableView2.DataController.Values[k, 5]) then F.SumDoc.Text   := CurrToStr(TableView2.DataController.Values[k, 5]);

 F.id_Doc := id_Doc;
 F.RadioGroup.Enabled   := False;

 if F.ShowModal <> mrOk then Exit;

 Refresh;
end;

procedure TMoveOst_Form.TableView2DblClick(Sender: TObject);
begin
 Edit_Doc_ButtonClick(Sender);
end;

procedure TMoveOst_Form.Refresh;
begin
 SelectBadOst;
 PageControlChange(nil);
end;

end.
