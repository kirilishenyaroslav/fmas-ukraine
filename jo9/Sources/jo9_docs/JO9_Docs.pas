unit JO9_Docs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxGridBandedTableView,
  cxTextEdit, cxContainer, cxRadioGroup, IBase, cxCurrencyEdit, StdCtrls,
  cxMemo, tagTypes, cxCalendar, cxHyperLinkEdit, cxButtonEdit, frxClass,
  frxDBSet, cxDropDownEdit, cxGroupBox, DateUtils, FIBQuery, pFIBQuery,
  tagLibUnit, cxPC, Placemnt;

type
  TResProc = procedure(id_Doc : int64; Kredit : boolean) of object;

  TJO9_Docs_Form = class(TForm)
    Panel: TPanel;
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
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    Splitter: TSplitter;
    MainPanel: TPanel;
    RadioGroup: TcxRadioGroup;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewPK_ID: TcxGridDBColumn;
    TableViewID_DOC: TcxGridDBColumn;
    TableViewDATETIME: TcxGridDBColumn;
    TableViewDATE_REG: TcxGridDBColumn;
    TableViewDATE_PROV: TcxGridDBColumn;
    TableViewID_TYPE_DOC: TcxGridDBColumn;
    TableViewNAME_TYPE_DOC: TcxGridDBColumn;
    TableViewNUM_DOC: TcxGridDBColumn;
    TableViewDATE_DOC: TcxGridDBColumn;
    TableViewSUMMA_TOTAL: TcxGridDBColumn;
    TableViewID_CUSTOMER: TcxGridDBColumn;
    cxgrdbclmnTableViewNOTE_1: TcxGridDBColumn;
    TableViewFIO: TcxGridDBColumn;
    TableViewID_RATE_ACC: TcxGridDBColumn;
    TableViewID_RATE_ACC_NATIVE: TcxGridDBColumn;
    TableViewNAME_USER: TcxGridDBColumn;
    TableViewID_OUT_DOC: TcxGridDBColumn;
    TableViewIS_SPRAVKA: TcxGridDBColumn;
    TableViewID_SERVER: TcxGridDBColumn;
    TableViewCOMPUTER: TcxGridDBColumn;
    TableViewSUMMA_1: TcxGridDBColumn;
    TableViewSUMMA_2: TcxGridDBColumn;
    TableViewNAME_CUSTOMER: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    MonthCombo: TdxBarCombo;
    dxBarStatic1: TdxBarStatic;
    YearCombo: TdxBarCombo;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    FilterButton: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    PrintButton: TdxBarLargeButton;
    AddDocPopupMenu: TdxBarPopupMenu;
    AddDocButton: TdxBarButton;
    AddSpecOpButton: TdxBarButton;
    TableViewIS_SPEC_OPER: TcxGridDBColumn;
    WQuery: TpFIBQuery;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    SumEdit: TcxTextEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    DateEdit: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    UserEdit: TcxTextEdit;
    ChangesEdit: TcxTextEdit;
    CompEdit: TcxTextEdit;
    NoteMemo: TcxMemo;
    lbl6: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds1: TDataSource;
    ds_prov: TpFIBDataSet;
    FormStorage: TFormStorage;
    cxgrdbclmnTableViewNOTE: TcxGridDBColumn;
    ds_provID_PROV: TFIBBCDField;
    ds_provID_SCH_DB: TFIBIntegerField;
    ds_provID_SCH_KR: TFIBIntegerField;
    ds_provNUM_SCH_DB: TFIBStringField;
    ds_provNUM_SCH_KR: TFIBStringField;
    ds_provNAME_SCH_DB: TFIBStringField;
    ds_provNAME_SCH_KR: TFIBStringField;
    ds_provID_S: TFIBBCDField;
    ds_provID_R: TFIBBCDField;
    ds_provID_ST: TFIBBCDField;
    ds_provID_KEKV: TFIBBCDField;
    ds_provKOD_S: TFIBIntegerField;
    ds_provKOD_R: TFIBIntegerField;
    ds_provKOD_ST: TFIBIntegerField;
    ds_provKOD_KEKV: TFIBIntegerField;
    ds_provNAME_S: TFIBStringField;
    ds_provNAME_R: TFIBStringField;
    ds_provNAME_ST: TFIBStringField;
    ds_provNAME_KEKV: TFIBStringField;
    ds_provDATE_PROV: TFIBDateField;
    ds_provID_DOG: TFIBBCDField;
    ds_provKOD_DOG: TFIBBCDField;
    ds_provSUMMA: TFIBBCDField;
    ds_provID_MEN: TFIBBCDField;
    ds_provID_PAYER: TFIBBCDField;
    ds_provID_SERVER: TFIBBCDField;
    ds_provID_CUSTOMER: TFIBBCDField;
    ds_provNAME_CUSTOMER: TFIBStringField;
    ds_provNAME_SHABLON: TFIBStringField;
    ds_provREG_NUM: TFIBStringField;
    ds_provIS_MAIN: TFIBSmallIntField;
    ds_provID_TIP_DOG: TFIBBCDField;
    cxgrdbclmnNUM_SCH_DB: TcxGridDBColumn;
    cxgrdbclmnNUM_SCH_KR: TcxGridDBColumn;
    cxgrdbclmnSM: TcxGridDBColumn;
    cxgrdbclmnRZ: TcxGridDBColumn;
    cxgrdbclmnST: TcxGridDBColumn;
    cxgrdbclmnKEKV: TcxGridDBColumn;
    cxgrdbclmnREG_NUM: TcxGridDBColumn;
    cxgrdbclmnNAME_CUSTOMER: TcxGridDBColumn;
    cxgrdbclmnSUMMA: TcxGridDBColumn;
    DxClone: TdxBarLargeButton;
    procedure RadioGroupPropertiesChange(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure YearComboChange(Sender: TObject);
    procedure MonthComboChange(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddSpecOpButtonClick(Sender: TObject);
    procedure DxCloneClick(Sender: TObject);
  private
    { Private declarations }
  public
   Show_Kredit : boolean;
   is_clone:Integer;
   doc_name: string;
   procedure SelectAll;
   procedure LocateRecord(id : int64);
   procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);
   procedure ResProc(id_Doc : int64; Kredit : boolean);
  end;

function All_Doc(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; INFO : Pjo9_SYS_INFO): variant; stdcall;
exports  All_Doc;

var
  SYS_INFO       : Pjo9_SYS_INFO;
  JO9_Docs_Form  : TJO9_Docs_Form;

implementation

uses jo9_docs_add, SelectAddKind, Kernel, Wait, jo9_PackageLoader, jo9_question;

{$R *.dfm}

{ TDebet_Docs_Form }

function All_Doc(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; INFO : Pjo9_SYS_INFO): variant; stdcall;
var
 F  : TJO9_Docs_Form;
 i  : integer;
begin
 SYS_INFO := INFO;

 if FS = fsNormal then begin
  JO9_Docs_Form := TJO9_Docs_Form.Create(AOwner);

  JO9_Docs_Form.InitConnection(DBHandle, RTrans);

  if Kredit then JO9_Docs_Form.RadioGroup.ItemIndex := 2
  else JO9_Docs_Form.RadioGroup.ItemIndex := 1;

  for i := YearOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Year + Trunc((SYS_INFO^._Month + SYS_INFO^._Show_Months) / 12) do begin
   JO9_Docs_Form.YearCombo.Items.Add(IntToStr(i));
   if i = SYS_INFO^._Year then JO9_Docs_Form.YearCombo.ItemIndex := JO9_Docs_Form.YearCombo.Items.Count - 1;
  end;

  JO9_Docs_Form.Show_Kredit := Kredit;

  TagTypes.GetFormParams(JO9_Docs_Form);

  JO9_Docs_Form.FormStyle  := FS;
  Result := JO9_Docs_Form.ShowModal;
  TagTypes.SetFormParams(JO9_Docs_Form);

  JO9_Docs_Form := nil;
 end
 else begin
  F := TJO9_Docs_Form.Create(AOwner);
  F.InitConnection(DBHandle, RTrans);

  TagTypes.GetFormParams(F);  // Это чтобы разместить поплавок

  if Kredit then F.RadioGroup.ItemIndex := 2
  else F.RadioGroup.ItemIndex := 1;

  for i := YearOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Year + Trunc((SYS_INFO^._Month + SYS_INFO^._Show_Months) / 12) do begin
   F.YearCombo.Items.Add(IntToStr(i));
   if i = SYS_INFO^._Year then F.YearCombo.ItemIndex := F.YearCombo.Items.Count - 1;
  end;

  F.Show_Kredit := Kredit;

  F.FormStyle  := FS;

  TagTypes.GetFormParams(F);  // А это чтобы разместить саму форму

  Result := F.Handle;
 end;
end;

procedure TJO9_Docs_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

procedure TJO9_Docs_Form.SelectAll;
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

 Month := Copy(MonthCombo.Text, 1, 2);

 if (StrToInt(YearCombo.Text) > SYS_INFO^._Year)
 or ((StrToInt(YearCombo.Text) = SYS_INFO^._Year) and (StrToInt(Month) >= SYS_INFO^._Month)) then begin
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
  DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch) +  ',1,'
  + QuotedStr(DateToStr(StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ','
  + QuotedStr(DateToStr(EndOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ',1)';

  TableViewSUMMA_1.Visible := True;
  TableViewSUMMA_2.Visible := True;
 end
 else if RadioGroup.ItemIndex = 1 then begin
  DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch) +  ',1,'
  + QuotedStr(DateToStr(StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ','
  + QuotedStr(DateToStr(EndOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ',0)';

  TableViewSUMMA_1.Visible := True;
  TableViewSUMMA_2.Visible := False;
 end
 else if RadioGroup.ItemIndex = 2 then begin
  DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_DOC_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch) +  ',0,'
  + QuotedStr(DateToStr(StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ','
  + QuotedStr(DateToStr(EndOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month)))) + ',0)';

  TableViewSUMMA_1.Visible := False;
  TableViewSUMMA_2.Visible := True;
 end;

 DataSet.Open;

 CloseWaitForm(wf);

 if Visible then Grid.SetFocus;
end;

procedure TJO9_Docs_Form.RadioGroupPropertiesChange(Sender: TObject);
begin
 SelectAll;
end;

procedure TJO9_Docs_Form.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TJO9_Docs_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if jo9_docs_add_Form  <> nil then jo9_docs_add_Form.Close;
 if jo9_docs_add_Form2 <> nil then jo9_docs_add_Form2.Close;

 if not (fsModal in FormState) then TagTypes.SetFormParams(Self);
 FormStorage.SaveFormPlacement;
 Action := caFree;
end;

procedure TJO9_Docs_Form.RefreshButtonClick(Sender: TObject);
var
 k  : integer;
 id : int64;
begin
 id := -1;

 k := TableView.DataController.FocusedRecordIndex;
 if k >= 0 then id := TableView.DataController.Values[k, 0];

 SelectAll;
 LocateRecord(id);
end;

procedure TJO9_Docs_Form.YearComboChange(Sender: TObject);
var
 i : integer;
 m : integer;
begin
 MonthCombo.Items.Clear;

 if (StrToInt(YearCombo.Text) = SYS_INFO^._Year) and (SYS_INFO^._Month <= 12) then begin
  m := -1;

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

  MonthCombo.ItemIndex :=  m;
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

procedure TJO9_Docs_Form.MonthComboChange(Sender: TObject);
begin
 SelectAll;
end;

procedure TJO9_Docs_Form.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var is_native, is_kredit:Boolean;
begin
 DateEdit.Text    := '';
 SumEdit.Text     := '';
 NoteMemo.Text    := '';
 UserEdit.Text    := '';
 ChangesEdit.Text := '';
 CompEdit.Text    := '';
 // by Mardar 30.05.2012
 {DateEdit.Text    := VarToStr(DataSet.FieldValues['DATE_PROV']);
 SumEdit.Text     := FloatToStrF(DataSet.FieldValues['SUMMA_TOTAL'], ffFixed, 100, 2);
 NoteMemo.Text    := VarToStr(DataSet.FieldValues['NOTE']);
 ChangesEdit.Text := VarToStr(DataSet.FieldValues['DATETIME']);
 UserEdit.Text    := VarToStr(DataSet.FieldValues['NAME_USER']);
 CompEdit.Text    := VarToStr(DataSet.FieldValues['COMPUTER']);}
 if AFocusedRecord = nil then Exit;
 is_Native := (AFocusedRecord.Values[5]= SYS_INFO^._id_Type_Doc);
 if RadioGroup.ItemIndex = 0 then
   is_Kredit := VarIsNull(AFocusedRecord.Values[20])
  else is_Kredit := (RadioGroup.ItemIndex = 2);

 ds_prov.Close;
 ds_prov.SelectSql.Clear;
 ds_prov.SelectSql.Add(' select * from JO9_DT_ALL_PROV_SEL(:PK_ID,:ID_REG_UCH,:KREDIT,:DO_GROUP)');
 ds_prov.Prepare;
 ds_prov.ParamByName('PK_ID').AsInt64:=AFocusedRecord.Values[0];

 ds_prov.ParamByName('ID_REG_UCH').AsInteger:=SYS_INFO^._id_Reg_Uch;

 if is_kredit then
 ds_prov.ParamByName('KREDIT').AsInteger:=1
 else ds_prov.ParamByName('KREDIT').AsInteger:=0;

 if is_native then
 ds_prov.ParamByName('DO_GROUP').AsInteger:=0
 else ds_prov.ParamByName('DO_GROUP').AsInteger:=1;
 ds_prov.CloseOpen(False);
 ds_prov.First;



 if not VarIsNull(AFocusedRecord.Values[4])  then DateEdit.Text    := DateToStr(AFocusedRecord.Values[4]);
 if not VarIsNull(AFocusedRecord.Values[9])  then SumEdit.Text     := FloatToStrF(AFocusedRecord.Values[9], ffFixed, 100, 2);
 if not VarIsNull(AFocusedRecord.Values[11]) then NoteMemo.Text    := AFocusedRecord.Values[11];
 if not VarIsNull(AFocusedRecord.Values[2])  then ChangesEdit.Text := DateTimeToStr(AFocusedRecord.Values[2]);
 if not VarIsNull(AFocusedRecord.Values[15]) then UserEdit.Text    := AFocusedRecord.Values[15];
 if not VarIsNull(AFocusedRecord.Values[19]) then CompEdit.Text    := AFocusedRecord.Values[19];

 // end of Mardar 30.05.2012
 is_clone:=0;
 doc_name:='';
 //Mardar 21.01.2013
 end;

procedure TJO9_Docs_Form.AddButtonClick(Sender: TObject);
var
 D      : TSelectAddKind_Form;
 Kredit : boolean;
 Month  : string;
begin
 if jo9_docs_add_Form <> nil then begin
  jo9_docs_add_Form.Show;
  Exit;
 end;

 if RadioGroup.ItemIndex = 0 then begin
  D := TSelectAddKind_Form.Create(Self);
  D.RadioGroup.ItemIndex := 0;

  if D.ShowModal <> mrOk then Exit;

  Kredit := (D.RadioGroup.ItemIndex = 1);
  D.Free;
 end
 else Kredit := (RadioGroup.ItemIndex = 2);

 Application.CreateForm(Tjo9_docs_add_Form, jo9_docs_add_Form);
 jo9_docs_add_Form.State     := 'Add';

 if not Kredit then
  jo9_docs_add_Form.Caption   := 'Додавання дебетового документа'
 else
  jo9_docs_add_Form.Caption   := 'Додавання кредитового документа';

 jo9_docs_add_Form.is_Kredit := Kredit;

 jo9_docs_add_Form.Database         := Database.Handle;
 jo9_docs_add_Form.ReadTransaction  := ReadTransaction.Handle;
 jo9_docs_add_Form.WriteTransaction := WriteTransaction.Handle;

 jo9_docs_add_Form.Res        := ResProc;

 Month := Copy(MonthCombo.Text, 1, 2);

 jo9_docs_add_Form.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));
 jo9_docs_add_Form.is_Native := True;

 jo9_docs_add_Form.FormStyle  := fsMDIChild;

 jo9_docs_add_Form.Show;
end;

procedure TJO9_Docs_Form.ViewButtonClick(Sender: TObject);
var
 k     : integer;
 F     : Tjo9_docs_add_Form;
 o     : TSPEC_OPER_STRUCTURE;
 Month : string;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if TableView.DataController.Values[k, 23] = 1 then begin
  Month := Copy(MonthCombo.Text, 1, 2);

  o.AOwner     := Self;
  o.DBHandle   := Database.Handle;
  o.RTrans     := ReadTransaction.Handle;
  o.WTrans     := WriteTransaction.Handle;
  o.FS         := fsMDIChild;
  o.Mode       := somView;
  o.Info       := SYS_INFO;

  if RadioGroup.ItemIndex = 0 then
   o.Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else o.Kredit := (RadioGroup.ItemIndex = 2);

  o.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));

  if not VarIsNull(TableView.DataController.Values[k, 11]) then o.Note := TableView.DataController.Values[k, 11];
  o.DateDoc    := TableView.DataController.Values[k, 8];
  o.pk_id      := TableView.DataController.Values[k, 0];
  o.NumDoc     := TableView.DataController.Values[k, 7];
  o.id_out_doc := TableView.DataController.Values[k, 16];

  jo9_PackageLoader.SpecOperations(o);
 end
 else begin
  F := Tjo9_docs_add_Form.Create(Self);
  F.State := 'View';
  F.Caption := 'Перегляд документа';

  F.NumDoc.Text   := TableView.DataController.Values[k, 7];

  if not VarIsNull(TableView.DataController.Values[k, 11]) then F.NoteMemo.Text := TableView.DataController.Values[k, 11];
  F.DateDoc.Date  := TableView.DataController.Values[k, 8];
  F.PK_id         := TableView.DataController.Values[k, 0];

  if RadioGroup.ItemIndex = 0 then
   F.is_Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else F.is_Kredit := (RadioGroup.ItemIndex = 2);

  F.Database         := Database.Handle;
  F.ReadTransaction  := ReadTransaction.Handle;
  F.WriteTransaction := WriteTransaction.Handle;

  F.is_Native := (TableView.DataController.Values[k, 5] = SYS_INFO^._id_Type_Doc);

  F.FormStyle := fsMDIChild;
  F.Show;
 end;
end;

procedure TJO9_Docs_Form.TableViewDblClick(Sender: TObject);
begin
 ViewButtonClick(Sender);
end;

procedure TJO9_Docs_Form.EditButtonClick(Sender: TObject);
var
 k          : integer;
 PK_id      : int64;

 RecInfo    : RECORD_INFO_STRUCTURE;
 ResultInfo : RESULT_STRUCTURE;
 Month      : string;
 o          : TSPEC_OPER_STRUCTURE;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;
 if TableView.DataController.Values[k, 5] <> SYS_INFO^._id_Type_Doc then begin
  ShowMessage('Документ змінити не можна, тому що він створений в іншій системі!');
  if is_clone=1 then is_clone:=0;
  Exit;
 end;

 if jo9_docs_add_Form2 <> nil then begin
  ShowMessage('Форма редагування зайнята іншим документом!');
  jo9_docs_add_Form2.Show;
  if is_clone=1 then is_clone:=0;
  Exit;
 end;

 if TableView.DataController.Values[k, 23] = 1 then begin
  Month := Copy(MonthCombo.Text, 1, 2);

  o.AOwner     := Self;
  o.DBHandle   := Database.Handle;
  o.RTrans     := ReadTransaction.Handle;
  o.WTrans     := WriteTransaction.Handle;
  o.FS         := fsMDIChild;
  o.Mode       := somEdit;
  o.Info       := SYS_INFO;

  if RadioGroup.ItemIndex = 0 then
   o.Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else o.Kredit := (RadioGroup.ItemIndex = 2);

  o.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));

  if not VarIsNull(TableView.DataController.Values[k, 11]) then o.Note := TableView.DataController.Values[k, 11];
  o.DateDoc    := TableView.DataController.Values[k, 8];
  o.pk_id      := TableView.DataController.Values[k, 0];
  o.NumDoc     := TableView.DataController.Values[k, 7];
  o.id_out_doc := TableView.DataController.Values[k, 16];

  jo9_PackageLoader.SpecOperations(o);
 end
 else begin
  PK_id := TableView.DataController.Values[k, 0];

  if not WriteTransaction.Active then WriteTransaction.StartTransaction;

  RecInfo.TRHANDLE       := WriteTransaction.Handle;
  RecInfo.DBHANDLE       := Database.Handle;
  RecInfo.ID_RECORD      := VarArrayOf([PK_id]);
  RecInfo.PK_FIELD_NAME  := VarArrayOf(['PK_ID']);
  RecInfo.TABLE_NAME     := 'PUB_DT_ALL_DOC';
  RecInfo.RAISE_FLAG     := false;

  ResultInfo := Kernel.LockRecord(@RecInfo);
  if ResultInfo.RESULT_CODE = 0 then begin
   WriteTransaction.Rollback;
   ShowMessage(ResultInfo.RESULT_MESSAGE);
   Exit;
  end;

  Application.CreateForm(Tjo9_docs_add_Form, jo9_docs_add_Form2);
  jo9_docs_add_Form2.State   := 'Edit';
  jo9_docs_add_Form2.Caption := 'Редагування документа';
  //mardar 21.01.2013
  jo9_docs_add_Form2.State_clone   := '';
  if is_clone=1 then jo9_docs_add_Form2.State_clone   := 'Clone';
  //
  if RadioGroup.ItemIndex = 0 then
   jo9_docs_add_Form2.is_Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else jo9_docs_add_Form2.is_Kredit := (RadioGroup.ItemIndex = 2);

  jo9_docs_add_Form2.NumDoc.Text   := TableView.DataController.Values[k, 7];
  jo9_docs_add_Form2.NoteMemo.Text := TableView.DataController.Values[k, 11];
  jo9_docs_add_Form2.DateDoc.Date  := TableView.DataController.Values[k, 8];
  jo9_docs_add_Form2.PK_id         := PK_id;

  jo9_docs_add_Form2.Database         := Database.Handle;
  jo9_docs_add_Form2.ReadTransaction  := ReadTransaction.Handle;
  jo9_docs_add_Form2.WriteTransaction := WriteTransaction.Handle;

  Month := Copy(MonthCombo.Text, 1, 2);

  jo9_docs_add_Form2.Res        := ResProc;

  if is_clone=0 then
  jo9_docs_add_Form2.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));
  if is_clone=1 then
  jo9_docs_add_Form2.ActualDate := StartOfAMonth(SYS_YEAR, SYS_MONTH);

  jo9_docs_add_Form2.is_Native := True;
   if is_clone = 0 then
   begin
  jo9_docs_add_Form2.FormStyle  := fsMDIChild;

  jo9_docs_add_Form2.Show;
  end
  else
  begin
  jo9_docs_add_Form2.ShowModal;
  if jo9_docs_add_Form2.is_nothing = 0 then  is_clone:=1
  else  is_clone:=0;
  jo9_docs_add_Form2:=nil;

  end;
 end;
 // все с is_clone от Mardar 23-01-13
end;

procedure TJO9_Docs_Form.DelButtonClick(Sender: TObject);
var
 k           : integer;
 PK_id       : int64;

 RecInfo     : RECORD_INFO_STRUCTURE;
 ResultInfo  : RESULT_STRUCTURE;

 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 KEY_SESSION : integer;
 ErrorList   : TStringList;
 DocDate     : TDate;

 Key         : int64;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;
 if TableView.DataController.Values[k, 5] <> SYS_INFO^._id_Type_Doc then begin
  ShowMessage('Документ видалити не можна, тому що він створений в іншій системі!');
  Exit;
 end;

 PK_id   := TableView.DataController.Values[k, 0];
 DocDate := SYS_INFO^._Period_Beg; 

 if not WriteTransaction.Active then WriteTransaction.StartTransaction;

 RecInfo.TRHANDLE       := WriteTransaction.Handle;
 RecInfo.DBHANDLE       := Database.Handle;
 RecInfo.ID_RECORD      := VarArrayOf([PK_id]);
 RecInfo.PK_FIELD_NAME  := VarArrayOf(['PK_ID']);
 RecInfo.TABLE_NAME     := 'PUB_DT_ALL_DOC';
 RecInfo.RAISE_FLAG     := false;

 ResultInfo := Kernel.LockRecord(@RecInfo);
 if ResultInfo.RESULT_CODE = 0 then begin
  WriteTransaction.Rollback;
  ShowMessage(ResultInfo.RESULT_MESSAGE);
  Exit;
 end;

 Key := -1;
 with TableView.DataController do begin
  if k + 1 < RecordCount then Key := Values[k + 1, 0]
  else if k - 1 >= 0 then Key := Values[k - 1, 0];
 end;

 if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити обраний документ?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 if not VarIsNull(TableView.DataController.Values[k, 16]) then if MessageDlg('Увага!',
 'Обраний документ має документ з нарахуваннями!' + #13 + 'Видалення обраного документу призведе до видалення документу з нарахуваннями!'
 + #13 + #13 + 'Ви дійсно бажаєте продовжити?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 WriteTransaction.StartTransaction;

 // Удаляю выбранный документ

 KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := DocDate;
 STRU.DBHANDLE      := Database.Handle;
 STRU.TRHANDLE      := WriteTransaction.Handle;
 STRU.KERNEL_ACTION := 2;
 STRU.PK_ID         := PK_id;
 STRU.ID_USER       := SYS_INFO^._id_User;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   WriteTransaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  WriteTransaction.Rollback;
  ShowMessage(ErrorList.Text);
  Exit;
 end;

 // Удаляю документ с начислениями (если он есть!!!)

 if not VarIsNull(TableView.DataController.Values[k, 16]) then begin
  KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

  STRU.KEY_SESSION   := KEY_SESSION;
  STRU.WORKDATE      := DocDate;
  STRU.DBHANDLE      := Database.Handle;
  STRU.TRHANDLE      := WriteTransaction.Handle;
  STRU.KERNEL_ACTION := 2;
  STRU.PK_ID         := TableView.DataController.Values[k, 16];
  STRU.ID_USER       := SYS_INFO^._id_User;

  try
   DoResult:=Kernel.KernelDo(@STRU);
  except
   on E:Exception do begin
    WriteTransaction.Rollback;
    ShowMessage('Помилка ядра '+E.Message);
    Exit;
   end;
  end;

  if not DoResult then begin
   ErrorList := Kernel.GetDocErrorsList(@STRU);
   ShowMessage(ErrorList.Text);
   WriteTransaction.Rollback;
   Exit;
  end;
 end;

 WQuery.SQL.Text := 'delete from PUB_DT_ALL_DOC_BUFFER where KEY_SESSION=' + IntToStr(KEY_SESSION);
 WQuery.ExecQuery;

 WQuery.SQL.Text := 'delete from PUB_DT_ALL_PROV_BUFFER where KEY_SESSION=' + IntToStr(KEY_SESSION);
 WQuery.ExecQuery; 

 WriteTransaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure TJO9_Docs_Form.LocateRecord(id: int64);
begin
 if id = -1 then Exit;
 DataSet.Locate('PK_ID', id, []);
end;

procedure TJO9_Docs_Form.ResProc(id_Doc: int64; Kredit : boolean);
begin

 if Kredit and (RadioGroup.ItemIndex = 1) then RadioGroup.ItemIndex := 1
 else if not Kredit and (RadioGroup.ItemIndex = 2) then RadioGroup.ItemIndex := 2
 else SelectAll;
 LocateRecord(id_Doc);
 Show;

end;

procedure TJO9_Docs_Form.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
//  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('PK_ID: '       + Values[k, 0] + #13
             + 'ID_DOC: '      + Values[k, 1] + #13
             + 'ID_CUSTOMER: ' + IntToStr(Values[k, 10]));
  except
  end;
 end;
end;

procedure TJO9_Docs_Form.FilterButtonClick(Sender: TObject);
begin
 TableView.OptionsCustomize.ColumnFiltering := not TableView.OptionsCustomize.ColumnFiltering;
end;

procedure TJO9_Docs_Form.PrintButtonClick(Sender: TObject);
var
 k      : integer;
 Filter : TFilterRecord;
 Month  : string;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if SYS_INFO^._Use_MO then
  Filter._PrintKind := JO9_REPORT_MAIN_MO
 else
  Filter._PrintKind := JO9_REPORT_MAIN;

 Month := Copy(MonthCombo.Text, 1, 2);

 Filter._Date_Beg  := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));
 Filter._Date_End  := EndOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));

 SetLength(Filter._Customers, Length(Filter._Customers) + 1);
 Filter._Customers[Length(Filter._Customers) - 1]._id := TableView.DataController.Values[k, 10];
 Filter._Db_Cust        := False;
 Filter._Kr_Cust        := False;
 Filter._GroupByTypeDog := False;
 Filter._PaperFormat    := pfA4; // for Mardar 19.04.12 http://172.16.72.21/view.php?id=5517 был A3

 jo9_PackageLoader.PrintREx(Self, Filter, Database.Handle, ReadTransaction.Handle, SYS_INFO);
end;

procedure TJO9_Docs_Form.FormShow(Sender: TObject);
begin
 if not SYS_INFO^._Admin_Mode then begin
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Add') <> 0 then AddButton.Visible := ivNever;
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Edit') <> 0 then EditButton.Visible := ivNever;
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Del') <> 0 then DelButton.Visible := ivNever;
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO^._id_Reg_Uch) ,'Print') <> 0 then PrintButton.Visible := ivNever;
 end;
 // Mardar 30.05.2012
 FormStorage.RestoreFormPlacement;
 // end of Mardar 30.05.2012
 Grid.SetFocus;
end;

procedure TJO9_Docs_Form.AddSpecOpButtonClick(Sender: TObject);
var
 D      : TSelectAddKind_Form;
 o      : TSPEC_OPER_STRUCTURE;

 Kredit : boolean;
 Month  : string;
begin
 if RadioGroup.ItemIndex = 0 then begin
  D := TSelectAddKind_Form.Create(Self);
  D.RadioGroup.ItemIndex := 0;

  if D.ShowModal <> mrOk then Exit;

  Kredit := (D.RadioGroup.ItemIndex = 1);
  D.Free;
 end
 else Kredit := (RadioGroup.ItemIndex = 2);

 Month := Copy(MonthCombo.Text, 1, 2);

 o.AOwner     := Self;
 o.DBHandle   := Database.Handle;
 o.RTrans     := ReadTransaction.Handle;
 o.WTrans     := WriteTransaction.Handle;
 o.FS         := fsMDIChild;
 o.Mode       := somAdd;
 o.Info       := SYS_INFO;
 o.Kredit     := Kredit;
 o.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));

 jo9_PackageLoader.SpecOperations(o);
end;

procedure TJO9_Docs_Form.DxCloneClick(Sender: TObject);
var k:Integer;
    t:TQustionForm;
    month: string;
begin
  is_clone:=1;
  k := TableView.DataController.FocusedRecordIndex;
  doc_name:= TableView.DataController.Values[k, 7]+ ' від '+DateToStr(TableView.DataController.Values[k, 8]);
 EditButtonClick(Self);
 // mardar 23-01-13
  if is_clone=1 then
  begin
  month:=Copy(MonthCombo.Text, 1, 2);
  if ((StrToInt(YearCombo.Text)<>SYS_YEAR) or(StrToInt(Month)<>SYS_MONTH)) then
  begin
    t:=TQustionForm.Create(Self);
    t.Label1.Caption:='Документ '+doc_name+' клонован у періоді:';
    t.Label2.Caption:=GetMonthName(SYS_MONTH)+' '+IntTostr(SYS_YEAR);
    if t.Label1.Width > 281 then t.Width:=t.Label1.Width +92;
    t.ShowModal;
    if t.ModalResult=mrOk then
    begin
     YearCombo.Text:= SYS_YEAR;
     if sys_month<10 then month:='0'+inttostr(sys_month)+'-'+GetMonthName(SYS_MONTH)
     else month:=inttostr(sys_month)+'-'+GetMonthName(SYS_MONTH);
     MonthCombo.Text:= month;
     RefreshButtonClick(Self );
    end;
    t.Free;
   end;
   end;
   is_clone:=0;
 //
end;

end.

