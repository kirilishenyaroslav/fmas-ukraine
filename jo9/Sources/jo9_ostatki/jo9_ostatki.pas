unit jo9_ostatki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridBandedTableView,
  cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ExtCtrls, dxBar,
  dxBarExtItems, cxContainer, cxRadioGroup, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxCurrencyEdit, cxTextEdit, StdCtrls, cxMemo, IBase,
  cxDropDownEdit, FIBQuery, pFIBQuery, ActnList, cxButtonEdit,
  pFIBStoredProc, cxGroupBox, cxCheckBox, tagTypes, cxHyperLinkEdit,
  frxClass, cxSplitter;

type
  TResProc = procedure (id_Ost_Doc : int64; Kredit : boolean) of object;

  TPrintRecord = packed record
   _id_Sch   : integer;
   _Num_Sch  : string;
   _Name_Sch : string;
   _Kr_Summa : currency;
   _Db_Summa : currency;
  end;

  TPrintArray = array of TPrintRecord;

  Tjo9_ostatki_Form = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    BottomPanel: TPanel;
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
    NoteMemo: TcxMemo;
    Label5: TLabel;
    DateEdit: TcxTextEdit;
    Label6: TLabel;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    VGrid: TcxGrid;
    VGridLevel: TcxGridLevel;
    VTableView: TcxGridDBTableView;
    Reg_Num_Column: TcxGridDBColumn;
    Sch_Num_Column: TcxGridDBColumn;
    Kod_S_Column: TcxGridDBColumn;
    Kod_R_Column: TcxGridDBColumn;
    Kod_St_Column: TcxGridDBColumn;
    VDataSet: TpFIBDataSet;
    VDataSource: TDataSource;
    VSumma_Column: TcxGridDBColumn;
    MonthCombo: TdxBarCombo;
    dxBarStatic1: TdxBarStatic;
    YearCombo: TdxBarCombo;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    Name_Sch_Column: TcxGridDBColumn;
    Name_S_Column: TcxGridDBColumn;
    Name_R_Column: TcxGridDBColumn;
    Name_St_Column: TcxGridDBColumn;
    ActionList1: TActionList;
    Action1: TAction;
    HintPanel: TcxGroupBox;
    St_Label: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Sch_Label: TLabel;
    PrintButton: TdxBarLargeButton;
    DataSet_Rep: TpFIBDataSet;
    id_Kekv_Column: TcxGridDBColumn;
    Kod_Kekv_Column: TcxGridDBColumn;
    Name_Kekv_Column: TcxGridDBColumn;
    Label7: TLabel;
    Kekv_Label: TLabel;
    Splitter: TcxSplitter;
    MainPanel: TPanel;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewHAND_ADD: TcxGridDBColumn;
    TableViewKREDIT: TcxGridDBColumn;
    TableViewKOD_SYS: TcxGridDBColumn;
    TableViewDATE_REG: TcxGridDBColumn;
    TableViewID_OST_DOC: TcxGridDBColumn;
    TableViewID_CUSTOMER: TcxGridDBColumn;
    TableViewNAME_SYS: TcxGridDBColumn;
    TableViewNUM_DOC: TcxGridDBColumn;
    TableViewDATE_DOC: TcxGridDBColumn;
    TableViewOPL_DATE: TcxGridDBColumn;
    TableViewSUMMA1: TcxGridDBColumn;
    TableViewSUMMA2: TcxGridDBColumn;
    TableViewNOTE: TcxGridDBColumn;
    TableViewID_SERVER: TcxGridDBColumn;
    TableViewNAME_CUSTOMER: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    RadioGroup: TcxRadioGroup;
    Action2: TAction;
    RowDataSet: TfrxUserDataSet;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    UserEdit: TcxTextEdit;
    ChangesEdit: TcxTextEdit;
    CompEdit: TcxTextEdit;
    TableViewNAME_USER: TcxGridDBColumn;
    TableViewSYS_DATETIME: TcxGridDBColumn;
    TableViewCOMPUTER: TcxGridDBColumn;
    Report: TfrxReport;
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroupPropertiesChange(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure MonthComboChange(Sender: TObject);
    procedure YearComboChange(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure DelButtonClick(Sender: TObject);
    procedure TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormResize(Sender: TObject);
    procedure VTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure VTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure VTableViewDblClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    function  BeforePrint : boolean;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Show_Kredit : boolean;
    PrintArray : TPrintArray;
    procedure ShowHintPanel;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE);
    procedure SelectAll;
    procedure LocateRecord(Key : integer);
    procedure ResProc(id_Ost_Doc : int64; Kredit : boolean);
  end;

function Ostatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant; stdcall;
exports  Ostatki;

var
  Show_Kr : boolean;
  SYS_INFO : Pjo9_SYS_INFO;
  jo9_ostatki_Form: Tjo9_ostatki_Form;

implementation

uses jo9_ostatki_add, DateUtils, Input_Sum, Kernel, Wait, tagLibUnit;

{$R *.dfm}

{ Tjo9_ostatki_Form }

function Ostatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant; stdcall;
var
 F : Tjo9_ostatki_Form;
 i : integer;
begin
 SYS_INFO := Info;

 if FS = fsNormal then begin
  jo9_ostatki_Form := Tjo9_ostatki_Form.Create(AOwner);
  jo9_ostatki_Form.InitConnection(DBHandle, RTrans);

  if Kredit then jo9_ostatki_Form.RadioGroup.ItemIndex := 2
  else jo9_ostatki_Form.RadioGroup.ItemIndex := 1;

  for i := YearOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Year + Trunc((SYS_INFO^._Month + SYS_INFO^._Show_Months) / 12) do begin
   jo9_ostatki_Form.YearCombo.Items.Add(IntToStr(i));
   if i = SYS_INFO^._Year then jo9_ostatki_Form.YearCombo.ItemIndex := jo9_ostatki_Form.YearCombo.Items.Count - 1;
  end;

  jo9_ostatki_Form.Show_Kredit := Kredit;

  jo9_ostatki_Form.FormStyle  := FS;

  GetFormParams(jo9_ostatki_Form);
  Result := jo9_ostatki_Form.ShowModal;
  SetFormParams(jo9_ostatki_Form);

  jo9_ostatki_Form := nil;
 end
 else begin
  F := Tjo9_ostatki_Form.Create(AOwner);
  F.InitConnection(DBHandle, RTrans);

  GetFormParams(F);

  if Kredit then F.RadioGroup.ItemIndex := 2
  else F.RadioGroup.ItemIndex := 1;

  for i := YearOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Year + Trunc((SYS_INFO^._Month + SYS_INFO^._Show_Months) / 12) do begin
   F.YearCombo.Items.Add(IntToStr(i));
   if i = SYS_INFO^._Year then F.YearCombo.ItemIndex := F.YearCombo.Items.Count - 1;
  end;

  F.Show_Kredit := Kredit;

  F.FormStyle  := FS;
  GetFormParams(F);
  
  Result := F.Handle;
 end;
end;

procedure Tjo9_ostatki_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

procedure Tjo9_ostatki_Form.SelectAll;
var
 wf    : TForm;
 Month : string;
begin
 if YearCombo.ItemIndex < 0 then Exit;
 if YearCombo.Text = '' then Exit;
 if MonthCombo.ItemIndex < 0 then Exit;
 if MonthCombo.Text = '' then Exit;

 wf := ShowWaitForm(Self);

 DataSet.Close;

 month := Copy(MonthCombo.Text, 1, 2);

 if (StrToInt(YearCombo.Text) > SYS_INFO^._Year)
 or ((StrToInt(YearCombo.Text) = SYS_INFO^._Year)
 and (StrToInt(month) >= SYS_INFO^._Month)) then begin
  AddButton.Enabled  := True;
  EditButton.Enabled := True;
  DelButton.Enabled  := True;
 end
 else begin
  AddButton.Enabled  := False;
  EditButton.Enabled := False;
  DelButton.Enabled  := False;
 end;

 if RadioGroup.ItemIndex = 0 then begin
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch)
  + ',1,'  + Month + ',' + YearCombo.Text + ',1)';

  TableViewSUMMA1.Caption := 'Сума Дб';
  TableViewSUMMA2.Visible := True;
 end
 else if RadioGroup.ItemIndex = 2 then begin
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch)
  + ',1,' + Month + ',' + YearCombo.Text + ',0)';

  TableViewSUMMA1.Caption := 'Сума';
  TableViewSUMMA2.Visible := False;
 end
 else if RadioGroup.ItemIndex = 1 then begin
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch)
  + ',0,' + Month + ',' + YearCombo.Text + ',0)';

  TableViewSUMMA1.Caption := 'Сума';
  TableViewSUMMA2.Visible := False;
 end;

 DataSet.Open;

 CloseWaitForm(wf);

 if Visible then Grid.SetFocus;
end;

procedure Tjo9_ostatki_Form.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 id_Doc : integer;
begin
 NoteMemo.Text    := '';
 DateEdit.Text    := '';
 UserEdit.Text    := '';
 ChangesEdit.Text := '';
 CompEdit.Text    := '';

 HintPanel.Visible := False;

 VDataSet.Close;

 if AFocusedRecord = nil then Exit;

 if not VarIsNull(AFocusedRecord.Values[12]) then NoteMemo.Text    := AFocusedRecord.Values[12];//Note
 if not VarIsNull(AFocusedRecord.Values[9])  then DateEdit.Text    := DateToStr(AFocusedRecord.Values[9]);//Date_Opl
 if not VarIsNull(AFocusedRecord.Values[15]) then UserEdit.Text    := AFocusedRecord.Values[15];
 if not VarIsNull(AFocusedRecord.Values[16]) then ChangesEdit.Text := DateTimeToStr(AFocusedRecord.Values[16]);
 if not VarIsNull(AFocusedRecord.Values[17]) then CompEdit.Text    := AFocusedRecord.Values[17];

 id_Doc := AFocusedRecord.Values[4];

 VDataSet.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL(' + IntToStr(id_Doc)
 + ',' + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ')';
 VDataSet.Open;

 EditButton.Enabled   := (AFocusedRecord.Values[0] =  '1');
 DelButton.Enabled    := (AFocusedRecord.Values[0] =  '1');
end;

procedure Tjo9_ostatki_Form.CloseButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_ostatki_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if jo9_ostatki_add_Form  <> nil then jo9_ostatki_add_Form.Close;
 if jo9_ostatki_add_Form2 <> nil then jo9_ostatki_add_Form2.Close;

 if not (fsModal in FormState) then SetFormParams(Self);
 Action := caFree;
end;

procedure Tjo9_ostatki_Form.RadioGroupPropertiesChange(Sender: TObject);
begin
 SelectAll;
end;

procedure Tjo9_ostatki_Form.AddButtonClick(Sender: TObject);
var
 S   : TInput_Sum_Form;
 Sum : Currency;
begin
 if jo9_ostatki_add_Form <> nil then begin
  jo9_ostatki_add_Form.Show;
  Exit;
 end;

 S := TInput_Sum_Form.Create(Self);
 S.ShowExtras := False;
 if S.ShowModal <> mrOk then Exit;
 Sum := S.SumEdit.Value;
 S.Free;

 Application.CreateForm(Tjo9_ostatki_add_Form, jo9_ostatki_add_Form);
 jo9_ostatki_add_Form.SumDoc.Value := Sum;
 jo9_ostatki_add_Form.State        := 'Add';
 jo9_ostatki_add_Form.Caption      := 'Додавання залишків';
 jo9_ostatki_add_Form.SYS_INFO     := SYS_INFO;

 jo9_ostatki_add_Form.Database         := Database.Handle;
 jo9_ostatki_add_Form.ReadTransaction  := ReadTransaction.Handle;
 jo9_ostatki_add_Form.WriteTransaction := WriteTransaction.Handle;

 if RadioGroup.ItemIndex = 0 then jo9_ostatki_add_Form.RadioGroup.ItemIndex := 0
 else jo9_ostatki_add_Form.RadioGroup.ItemIndex := RadioGroup.ItemIndex - 1;

 jo9_ostatki_add_Form.DateDoc.Date  := Date;
 jo9_ostatki_add_Form.DateMove.Date := Date;

 jo9_ostatki_add_Form.Res       := ResProc;
 jo9_ostatki_add_Form.FormStyle := fsMDIChild;

 jo9_ostatki_add_Form.Show;
end;

procedure Tjo9_ostatki_Form.ViewButtonClick(Sender: TObject);
var
 k : integer;
 F : Tjo9_ostatki_add_Form;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 F := Tjo9_ostatki_add_Form.Create(Self);
 F.State    := 'View';
 F.Caption  := 'Перегляд залишків [' + TableView.DataController.Values[k, 14] + ']';
 F.SYS_INFO := SYS_INFO;

 F.Database         := Database.Handle;
 F.ReadTransaction  := ReadTransaction.Handle;
 F.WriteTransaction := WriteTransaction.Handle;

 F.RadioGroup.ItemIndex := TableView.DataController.Values[k, 1];
 F.RadioGroup.Enabled   := False;

 F.NumDoc.Text   := TableView.DataController.Values[k, 7];
 F.NoteMemo.Text := TableView.DataController.Values[k, 12];
 F.DateDoc.Date  := TableView.DataController.Values[k, 8];
 F.DateMove.Date := TableView.DataController.Values[k, 9];

 if not VarIsNull(TableView.DataController.Values[k, 10]) then F.SumDoc.Text   := CurrToStr(TableView.DataController.Values[k, 10])
 else if not VarIsNull(TableView.DataController.Values[k, 11]) then F.SumDoc.Text   := CurrToStr(TableView.DataController.Values[k, 11]);

 F.id_Doc      := TableView.DataController.Values[k, 4];
 F.id_Customer := TableView.DataController.Values[k, 5]; // id_Customer
 F.FormStyle   := fsMDIChild;
 F.Show;
end;

procedure Tjo9_ostatki_Form.TableViewDblClick(Sender: TObject);
var
 k : integer;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 ViewButtonClick(Sender);
end;

procedure Tjo9_ostatki_Form.RefreshButtonClick(Sender: TObject);
var
 k   : integer;
 Key : integer;
begin
 Key := -1;
 k := TableView.DataController.FocusedRecordIndex;
 if k >= 0 then Key := TableView.DataController.Values[k, 4];

 SelectAll;
 LocateRecord(Key);
end;

procedure Tjo9_ostatki_Form.LocateRecord(Key: integer);
begin
 DataSet.Locate('ID_OST_DOC', Key, []);
end;

procedure Tjo9_ostatki_Form.MonthComboChange(Sender: TObject);
begin
 SelectAll;
end;

procedure Tjo9_ostatki_Form.YearComboChange(Sender: TObject);
var
 i : integer;
 m : integer;
begin
 MonthCombo.Items.Clear;

 if (StrToInt(YearCombo.Text) = SYS_INFO^._Year) and (SYS_INFO^._Month <= 12) then begin
  m := 0;

  if StrToInt(YearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then begin
   for i := MonthOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then MonthCombo.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else MonthCombo.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := MonthCombo.Items.Count - 1;
   end;
  end
  else begin
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then MonthCombo.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else MonthCombo.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := MonthCombo.Items.Count - 1;
   end;
  end;

  MonthCombo.ItemIndex := m;
 end
 else begin
  if (StrToInt(YearCombo.Text) = SYS_INFO^._Year + 1) and (SYS_INFO^._Month + SYS_INFO^._Show_Months > 12) then
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months - 12 do
    if i < 10 then MonthCombo.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else MonthCombo.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else if StrToInt(YearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then
   for i := MonthOf(SYS_INFO^._Sys_Beg) to 12 do
    if i < 10 then MonthCombo.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else MonthCombo.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else
   for i := 1 to 12 do
    if i < 10 then MonthCombo.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else MonthCombo.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

  MonthCombo.ItemIndex := 0;
 end;
end;

procedure Tjo9_ostatki_Form.EditButtonClick(Sender: TObject);
var
 k          : integer;
 id_Doc     : integer;
 RecInfo    : RECORD_INFO_STRUCTURE;
 ResultInfo : RESULT_STRUCTURE;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if jo9_ostatki_add_Form2 <> nil then begin
  ShowMessage('Форма редагування зайнята іншим документом!');
  jo9_ostatki_add_Form2.Show;
  Exit;
 end;

 id_Doc := TableView.DataController.Values[k, 4];

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

 Application.CreateForm(Tjo9_ostatki_add_Form, jo9_ostatki_add_Form2);
 jo9_ostatki_add_Form2.State    := 'Edit';
 jo9_ostatki_add_Form2.Caption  := 'Зміна залишків [' + TableView.DataController.Values[k, 14] + ']';
 jo9_ostatki_add_Form2.SYS_INFO := SYS_INFO;

 jo9_ostatki_add_Form2.Database         := Database.Handle;
 jo9_ostatki_add_Form2.ReadTransaction  := ReadTransaction.Handle;
 jo9_ostatki_add_Form2.WriteTransaction := WriteTransaction.Handle;

 if RadioGroup.ItemIndex = 0 then jo9_ostatki_add_Form2.RadioGroup.ItemIndex := 0
 else jo9_ostatki_add_Form2.RadioGroup.ItemIndex := RadioGroup.ItemIndex - 1;

 jo9_ostatki_add_Form2.NumDoc.Text   := TableView.DataController.Values[k, 7];
 jo9_ostatki_add_Form2.NoteMemo.Text := TableView.DataController.Values[k, 12];
 jo9_ostatki_add_Form2.DateDoc.Date  := TableView.DataController.Values[k, 8];
 jo9_ostatki_add_Form2.DateMove.Date := TableView.DataController.Values[k, 9];

 if not VarIsNull(TableView.DataController.Values[k, 10]) then jo9_ostatki_add_Form2.SumDoc.Text   := CurrToStr(TableView.DataController.Values[k, 10])
 else if not VarIsNull(TableView.DataController.Values[k, 11]) then jo9_ostatki_add_Form2.SumDoc.Text   := CurrToStr(TableView.DataController.Values[k, 11]);

 jo9_ostatki_add_Form2.id_Doc      := id_Doc;
 jo9_ostatki_add_Form2.id_Customer := TableView.DataController.Values[k, 5]; // id_Customer

 jo9_ostatki_add_Form2.Res       := ResProc;
 jo9_ostatki_add_Form2.FormStyle := fsMDIChild;
 jo9_ostatki_add_Form2.Show;
end;

procedure Tjo9_ostatki_Form.FormShow(Sender: TObject);
begin
 if not SYS_INFO^._Admin_Mode then begin
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Add') <> 0 then AddButton.Visible := ivNever;
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Edit') <> 0 then EditButton.Visible := ivNever;
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Del') <> 0 then DelButton.Visible := ivNever;
//  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Print') <> 0 then PrintButton.Visible := ivNever;
 end;

 Grid.SetFocus;
end;

procedure Tjo9_ostatki_Form.TableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then ViewButtonClick(Sender);
end;

procedure Tjo9_ostatki_Form.DelButtonClick(Sender: TObject);
var
 k          : integer;
 Key        : integer;
 id_Doc     : integer;
 RecInfo    : RECORD_INFO_STRUCTURE;
 ResultInfo : RESULT_STRUCTURE;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;
 if TableView.DataController.Values[k, 14] = '0' then Exit;

 id_Doc := TableView.DataController.Values[k, 4];

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

 if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити даний залишок?', mtConfirmation, [mbYes, mbNo]) <> mrYes then begin
  WriteTransaction.Rollback;
  Exit;
 end;

 Key := -1;

 if k + 1 < TableView.DataController.RecordCount then Key := TableView.DataController.Values[k + 1, 4]
 else if k - 1 >= 0 then Key := TableView.DataController.Values[k - 1, 4];

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('JO9_DT_OST_DOC_DEL', [TableView.DataController.Values[k, 4]]);
 StoredProc.Transaction.Commit;

 SelectAll;
 if Key <> -1 then LocateRecord(Key);
end;

procedure Tjo9_ostatki_Form.TableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
// if AViewInfo.GridRecord.Focused then Exit;
// if AViewInfo.GridRecord.Values[0] = '1' then ACanvas.Font.Color := clRed;
end;

procedure Tjo9_ostatki_Form.FormResize(Sender: TObject);
begin
 if VGrid.Width - 10 > 385 then HintPanel.Width := 385 else HintPanel.Width := VGrid.Width - 10;
 HintPanel.Left  := VGrid.Left + 5;
end;

procedure Tjo9_ostatki_Form.VTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Key = #13) and not HintPanel.Visible then ShowHintPanel
 else HintPanel.Visible := False;
end;

procedure Tjo9_ostatki_Form.ShowHintPanel;
var
 k : integer;
begin
 k := VTableView.DataController.FocusedRecordIndex;
 if k < 0 then begin
  HintPanel.Visible := False;
  Exit;
 end;

 Sch_Label.Caption := '';
 S_Label.Caption   := '';
 R_Label.Caption   := '';
 St_Label.Caption  := '';

 with VTableView.DataController do begin
  if not VarIsNull(Values[k, 7])  then Sch_Label.Caption := Values[k, 7];
  if not VarIsNull(Values[k, 8])  then S_Label.Caption   := Values[k, 8];
  if not VarIsNull(Values[k, 9])  then R_Label.Caption   := Values[k, 9];
  if not VarIsNull(Values[k, 10]) then St_Label.Caption  := Values[k, 10];
  if not VarIsNull(Values[k, 12]) then Kekv_Label.Caption  := Values[k, 12];
 end;

 HintPanel.Visible := True;
end;

procedure Tjo9_ostatki_Form.Action1Execute(Sender: TObject);
begin
 if HintPanel.Visible then HintPanel.Visible := False;
end;

procedure Tjo9_ostatki_Form.VTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 HintPanel.Visible := False;
end;

procedure Tjo9_ostatki_Form.VTableViewDblClick(Sender: TObject);
begin
 ShowHintPanel;
end;

procedure Tjo9_ostatki_Form.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

function Tjo9_ostatki_Form.BeforePrint: boolean;
{var
 i : integer;
 Flag : boolean;}
begin
 Result := False;

{ DataSet_Rep.Close;
 PrintArray := nil;

 DataSet_Rep.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL_FOR_REP('
 + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ')';
 DataSet_Rep.Open;

 if DataSet_Rep.RecordCount = 0 then begin
  ShowMessage('Неможливо друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 while not DataSet_Rep.Eof do begin
  Flag := False;
  for i := 0 to Length(PrintArray) - 1 do
   if DataSet_Rep['ID_SCH'] = PrintArray[i]._id_Sch then begin
    Flag := True;
    Break;
   end;

  if Flag then begin
   if DataSet_Rep['KREDIT'] = 1 then PrintArray[i]._Kr_Summa := DataSet_Rep['SUMMA']
   else PrintArray[i]._Db_Summa := DataSet_Rep['SUMMA'];
  end
  else begin
   SetLength(PrintArray, Length(PrintArray) + 1);

   with PrintArray[Length(PrintArray) - 1] do begin
    _id_Sch := DataSet_Rep['ID_SCH'];
    _Num_Sch := DataSet_Rep['NUM_SCH'];
    _Name_Sch := DataSet_Rep['NAME_SCH'];

    if DataSet_Rep['KREDIT'] = 1 then _Kr_Summa := DataSet_Rep['SUMMA']
    else _Db_Summa := DataSet_Rep['SUMMA'];
   end;
  end;

  DataSet_Rep.Next;
 end;

 DataSet_Rep.Close;

 if not FileExists('Reports\JO9\JO9_Ost.fr3') then begin
  ShowMessage('Файл звіту ' + #39 + 'Reports\JO9\JO9_Ost.fr3' + #39 + ' не знайдено!');
  Exit;
 end
 else Report.LoadFromFile('Reports\JO9\JO9_Ost.fr3');

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := Length(PrintArray);

 Result := True;}
end;

procedure Tjo9_ostatki_Form.ReportGetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'Period_Name' then Value := MonthCombo.Text + ' ' + YearCombo.Text
 else if VarName = 'Num_Sch' then Value := PrintArray[RowDataSet.RecNo]._Num_Sch
 else if VarName = 'Name_Sch' then Value := PrintArray[RowDataSet.RecNo]._Name_Sch
 else if VarName = 'Kr_Summa' then Value := FloatToStrF(PrintArray[RowDataSet.RecNo]._Kr_Summa, ffFixed, 100, 2)
 else if VarName = 'Db_Summa' then Value := FloatToStrF(PrintArray[RowDataSet.RecNo]._Db_Summa, ffFixed, 100, 2);
end;

procedure Tjo9_ostatki_Form.ResProc(id_Ost_Doc: int64; Kredit: boolean);
begin
 if Kredit and (RadioGroup.ItemIndex = 1) then RadioGroup.ItemIndex := 1
 else if not Kredit and (RadioGroup.ItemIndex = 2) then RadioGroup.ItemIndex := 2
 else SelectAll;


 LocateRecord(id_Ost_Doc);
 Show;
end;

procedure Tjo9_ostatki_Form.TableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
begin
 if Key = VK_INSERT then begin
  AddButtonClick(Sender);
  Exit;
 end;

 if Key = VK_F5 then begin
  RefreshButtonClick(Sender);
  Exit;
 end;

 if Key = VK_F2 then begin
  EditButtonClick(Sender);
  Exit;
 end;

 if Key = VK_DELETE then begin
  DelButtonClick(Sender);
  Exit;
 end;

 if Key = VK_SPACE then begin
  ViewButtonClick(Sender);
  Exit;
 end;

 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 with TableView.DataController do begin
  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_OST_DOC: '  + IntToStr(Values[k, 4]) + #13
             + 'ID_CUSTOMER: ' + IntToStr(Values[k, 5]));
  except
  end;
 end;
end;

procedure Tjo9_ostatki_Form.Action2Execute(Sender: TObject);
begin
 PrintButtonClick(Sender);
end;

end.
