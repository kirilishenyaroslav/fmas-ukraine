unit uReg_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, cxStyles, cxTL, dxBarExtItems, dxBar, ImgList,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, RxMemDS, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxRadioGroup,
  cxGroupBox, cnConsts;

type
  TfrReg_Add = class(TForm)
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    DsetRecordCount: TdxBarButton;
    CreditButton: TdxBarLargeButton;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    UpLoad_Button: TdxBarLargeButton;
    BreakDown_Button: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    Dodatki_Button: TdxBarSubItem;
    Log: TdxBarButton;
    RecoveryBtn: TdxBarButton;
    OrdersBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    Erased_Btn: TdxBarButton;
    NoteStatic: TdxBarStatic;
    ExportDataBtn: TdxBarButton;
    btnTwain: TdxBarLargeButton;
    dxBarStatic2: TdxBarStatic;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Dog_status_label: TdxBarStatic;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    MemoryDataNot: TRxMemoryData;
    DataSource_Not: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    FIO_NOT: TcxGridDBColumn;
    cxGridNotInReg: TcxGridLevel;
    cxButtonOneToList: TcxButton;
    cxButtonAllToList: TcxButton;
    cxButtonOneInList: TcxButton;
    cxButtonAllInList: TcxButton;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    FIO_IN: TcxGridDBColumn;
    cxGridInReg: TcxGridLevel;
    DataSource_In: TDataSource;
    MemoryDataIn: TRxMemoryData;
    NUM_NOT: TcxGridDBColumn;
    NUM_IN: TcxGridDBColumn;
    DataSet_update: TpFIBDataSet;
    MemoryDataNotMrFIO: TStringField;
    MemoryDataNotMrNUM: TStringField;
    MemoryDataNotMrID_DOG: TIntegerField;
    MemoryDataInMrFIO_in: TStringField;
    MemoryDataInMrNUM_in: TStringField;
    MemoryDataInMrID_dog_in: TVariantField;
    cxButtonClose: TcxButton;
    cxButtonSave: TcxButton;
    StoredProc: TpFIBStoredProc;
    Tran_write: TpFIBTransaction;
    dxBarStatic3: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    Label1: TLabel;
    procedure cxButtonOneToListClick(Sender: TObject);
    procedure cxButtonAllToListClick(Sender: TObject);
    procedure cxButtonOneInListClick(Sender: TObject);
    procedure cxButtonAllInListClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FilterExecute_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   id_user:int64;
   id_reestr:int64;
   PLanguageIndex: Byte;
    { Public declarations }
  end;

var
  frReg_Add: TfrReg_Add;

implementation

uses uReg, uAdd;
{$R *.dfm}

procedure TfrReg_Add.cxButtonOneToListClick(Sender: TObject);
begin
    if MemoryDataNot.RecordCount>0 then
    begin
      MemoryDataIn.Open;
      MemoryDataIn.Insert;
      MemoryDataIn.FieldByName('MrFIO_in').AsString:=MemoryDataNot.FieldByName('MrFIO').AsString;
      MemoryDataIn.FieldByName('MrNUM_in').AsString:=MemoryDataNot.FieldByName('MrNUM').AsString;
      MemoryDataIn.FieldByName('MrID_DOG_in').AsVariant:=MemoryDataNot.FieldByName('MrID_DOG').AsVariant;
      MemoryDataIn.Post;

      MemoryDataNot.Delete;
    end;
end;

procedure TfrReg_Add.cxButtonAllToListClick(Sender: TObject);
var
  i:Integer;
begin
  refresh;
  cxGrid1DBTableView1.BeginUpdate;
//  cxGridNotInReg.BeginUpdate;

  MemoryDataNot.First;

  for i:=0 to MemoryDataNot.RecordCount-1 do
    begin
      cxButtonOneToListClick(self);
      MemoryDataNot.Next;
    end;

//  cxGridNotInReg.EndUpdate;
  cxGrid1DBTableView1.EndUpdate;
end;

procedure TfrReg_Add.cxButtonOneInListClick(Sender: TObject);
begin
    if MemoryDataIn.RecordCount>0 then
    begin
      MemoryDataNot.Open;
      MemoryDataNot.Insert;
      MemoryDataNot.FieldByName('MrFIO').AsString:=MemoryDataIn.FieldByName('MrFIO_in').AsString;
      MemoryDataNot.FieldByName('MrNUM').AsString:=MemoryDataIn.FieldByName('MrNUM_in').AsString;
      MemoryDataNot.FieldByName('MrID_DOG').AsVariant:=MemoryDataIn.FieldByName('MrID_DOG_in').AsVariant;
      MemoryDataNot.Post;

      MemoryDataIn.Delete;
    end;
end;

procedure TfrReg_Add.cxButtonAllInListClick(Sender: TObject);
var
  i:Integer;
begin
  refresh;
  MemoryDataIn.First;

  for i:=0 to MemoryDataIn.RecordCount-1 do
    begin
      cxButtonOneInListClick(self);
      MemoryDataIn.Next;
    end;
end;

procedure TfrReg_Add.cxButtonCloseClick(Sender: TObject);
begin
if MessageBox(Handle,PChar('Вы уверены, что хотите закрыть форму?'),'Подтверждение',MB_YESNO or MB_ICONQUESTION)= mrYes then
  begin
    close;
  end;
end;

procedure TfrReg_Add.cxButtonSaveClick(Sender: TObject);
Var
 i:integer;
 T:TfrmAdd;
 id_reestr:int64;
begin
  If MemoryDataIn.RecordCount<1 then
   Begin
    ShowMessage('Не выбрано ни одного контракта!');
    Exit;
   End;

  T:=TfrmAdd.Create(self);
  T.Caption := 'Информация о реестре';
  T.cxButton_ok.Caption     := cnConsts.cn_Accept[PLanguageIndex];
  T.cxButton_ok.Hint        := cnConsts.cn_Accept[PLanguageIndex];
  T.cxButton_cancel.Caption := cnConsts.cn_Cancel[PLanguageIndex];
  T.cxButton_cancel.hint    := cnConsts.cn_Cancel[PLanguageIndex];
  T.ShowModal;
  If (T.ModalResult=mrOk) then
   Begin
    Tran_write.StartTransaction;
    //=====================================================
    StoredProc.StoredProcName:='CN_DT_DOG_REESTR_INS';
    StoredProc.Prepare;
    StoredProc.ParamByName('NUM_REESTR').AsInteger:=T.Num_Edit.EditValue;
    StoredProc.ParamByName('DATE_REESTR').AsDate:=t.Date_Edit.EditValue;
    StoredProc.ParamByName('ID_USER').AsInteger:=id_user;
    StoredProc.ParamByName('NOTE').AsString:=T.Note_memo.Text;
    StoredProc.ExecProc;
    id_reestr:=StoredProc.FldByName['ID_REESTR'].Asint64;
    //=====================================================
    MemoryDataIn.First;
    For i:=0 to MemoryDataIn.RecordCount-1 do
     Begin
      StoredProc.StoredProcName:='CN_DT_DOG_UPD';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_DOG').AsInteger:=MemoryDataIn['MRID_DOG_IN'];
      StoredProc.ParamByName('ID_REESTR').AsInteger:=Id_reestr;
      StoredProc.ExecProc;
      MemoryDataIn.Next;
     End;
    //=====================================================
    try
     Tran_write.Commit;
     StoredProc.Close;
    except
     Tran_write.Rollback;
     StoredProc.Close;
    End;
    ModalResult:=mrOk;
   End;
  T.Free;
end;

procedure TfrReg_Add.FormShow(Sender: TObject);
Var
 i:integer;
begin
  Dog_Filter_Edit.Caption        :=         cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  FiltrByFIO_RadioButton.Caption :=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
  FiltrByNum_RadioButton.Caption :=         cnConsts.cn_FiltrByNum[PLanguageIndex];
  FilterExecute_Button.Hint      :=         cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  If cxButtonSave.Enabled then
   begin
    DataSet_update.Close;
    DataSet_update.SQLs.SelectSQL.Clear;
    DataSet_update.SQLs.SelectSQL.add('select first (30)');
    DataSet_update.SQLs.SelectSQL.add('dr.num_dog,');
    DataSet_update.SQLs.SelectSQL.add('dr.fio,');
    DataSet_update.SQLs.SelectSQL.add('d.ID_DOG');
    DataSet_update.SQLs.SelectSQL.add('from cn_dt_dog_root dr, cn_dt_dog d');
    DataSet_update.SQLs.SelectSQL.add('Where (d.id_reestr is null)');
    DataSet_update.SQLs.SelectSQL.add(' and (d.id_dog_root=dr.id_dog_root)');
    DataSet_update.SQLs.SelectSQL.add(' and (dr.use_end=''01.01.3050'')');

    DataSet_update.Open;

    DataSet_update.FetchAll;

    MemoryDataNot.EmptyTable;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDataNot.Open;
      MemoryDataNot.Insert;
      MemoryDataNot.FieldByName('MrFIO').AsString:='';
      MemoryDataNot.FieldByName('MrNum').AsVariant:=0;
      MemoryDataNot.FieldByName('MrID_DOG').AsVariant:=0;
      MemoryDataNot.Post;
      MemoryDataNot.Next;
     End;

    MemoryDataNot.First;
     DataSet_update.First;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDataNot.Open;
      MemoryDataNot.Edit;
      MemoryDataNot.FieldByName('MrFIO').AsVariant:=DataSet_update.FieldByName('FIO').AsVariant;
      MemoryDataNot.FieldByName('MrNUM').AsString:=DataSet_update.FieldByName('NUM_DOG').AsString;
      MemoryDataNot.FieldByName('MrID_DOG').AsVariant:=DataSet_update.FieldByName('ID_DOG').AsVariant;
      MemoryDataNot.Post;
      DataSet_update.Next;
      MemoryDataNot.Next;
     end;

     MemoryDataNot.First;
   End
  Else
   Begin
    DataSet_update.Close;
    DataSet_update.SQLs.SelectSQL.Clear;
    DataSet_update.SQLs.SelectSQL.add('select');
    DataSet_update.SQLs.SelectSQL.add('dr.num_dog,');
    DataSet_update.SQLs.SelectSQL.add('dr.fio,');
    DataSet_update.SQLs.SelectSQL.add('d.ID_DOG');
    DataSet_update.SQLs.SelectSQL.add('from cn_dt_dog_root dr, cn_dt_dog d');
    DataSet_update.SQLs.SelectSQL.add('Where (d.id_reestr ='+IntToStr(ID_REESTR)+')');
    DataSet_update.SQLs.SelectSQL.add(' and (d.id_dog_root=dr.id_dog_root)');
    DataSet_update.Open;

    DataSet_update.FetchAll;

    MemoryDataIn.EmptyTable;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDatain.Open;
      MemoryDatain.Insert;
      MemoryDatain.FieldByName('MrFIO_in').AsString:='';
      MemoryDatain.FieldByName('MrNum_in').AsVariant:=0;
      MemoryDatain.FieldByName('MrID_DOG_in').AsVariant:=0;
      MemoryDatain.Post;
      MemoryDatain.Next;
     End;

    MemoryDatain.First;

    DataSet_update.First;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDatain.Open;
      MemoryDatain.Edit;
      MemoryDatain.FieldByName('MrFIO_in').AsVariant:=DataSet_update.FieldByName('FIO').AsVariant;
      MemoryDatain.FieldByName('MrNUM_in').AsString:=DataSet_update.FieldByName('NUM_DOG').AsString;
      MemoryDatain.FieldByName('MrID_DOG_in').AsVariant:=DataSet_update.FieldByName('ID_DOG').AsVariant;
      MemoryDatain.Post;
      DataSet_update.Next;
      MemoryDatain.Next;
     end;

    MemoryDatain.First;
   End;
end;

procedure TfrReg_Add.FilterExecute_ButtonClick(Sender: TObject);
var
  i:integer;
  S:String;
begin
  if Dog_Filter_Edit.text<>'' then
   Begin
    DataSet_update.Close;
    DataSet_update.SQLs.SelectSQL.Clear;
    DataSet_update.SQLs.SelectSQL.add('select ');
    DataSet_update.SQLs.SelectSQL.add('dr.num_dog,');
    DataSet_update.SQLs.SelectSQL.add('dr.fio,');
    DataSet_update.SQLs.SelectSQL.add('d.ID_DOG');
    DataSet_update.SQLs.SelectSQL.add('from cn_dt_dog_root dr, cn_dt_dog d');
    DataSet_update.SQLs.SelectSQL.add('Where (d.id_reestr is null)');
    DataSet_update.SQLs.SelectSQL.add(' and (d.id_dog_root=dr.id_dog_root)');
    DataSet_update.SQLs.SelectSQL.add(' and (dr.use_end=''01.01.3050'')');
    if FiltrByFIO_RadioButton.Checked
     then S:='FIO'
     Else S:='NUM_DOG';
    DataSet_update.SQLs.SelectSQL.Add(' and (UPPER(dr.'+S+') LIKE UPPER('''+Dog_Filter_Edit.Text+''')||''%'')');
    DataSet_update.Open;
    DataSet_update.FetchAll;

    MemoryDataNot.EmptyTable;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDataNot.Open;
      MemoryDataNot.Insert;
      MemoryDataNot.FieldByName('MrFIO').AsString:='';
      MemoryDataNot.FieldByName('MrNum').AsString:='';
      MemoryDataNot.FieldByName('MrID_DOG').AsVariant:=0;
      MemoryDataNot.Post;
      MemoryDataNot.Next;
     End;
    MemoryDataNot.First;
    DataSet_update.First;
    For i:=0 to DataSet_update.RecordCount-1 do
     Begin
      MemoryDataNot.Open;
      MemoryDataNot.Edit;
      MemoryDataNot.FieldByName('MrFIO').AsVariant:=DataSet_update.FieldByName('FIO').AsVariant;
      MemoryDataNot.FieldByName('MrNUM').AsString:=DataSet_update.FieldByName('NUM_DOG').AsString;
      MemoryDataNot.FieldByName('MrID_DOG').AsVariant:=DataSet_update.FieldByName('ID_DOG').AsVariant;
      MemoryDataNot.Post;
      DataSet_update.Next;
      MemoryDataNot.Next;
     end;

     MemoryDataNot.First;
   End;  
end;

end.
