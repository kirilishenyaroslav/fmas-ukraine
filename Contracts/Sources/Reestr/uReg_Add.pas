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
  cxGroupBox, cnConsts, ActnList, ExtCtrls, cxCheckBox, cxTextEdit, uReestr_DM,
  iBase;

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
    cxButtonClose: TcxButton;
    cxButtonSave: TcxButton;
    StoredProc: TpFIBStoredProc;
    Tran_write: TpFIBTransaction;
    dxBarStatic3: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    MemoryDataNotMrFIO: TStringField;
    MemoryDataNotMrNUM: TStringField;
    MemoryDataNotMrID_DOG: TStringField;
    MemoryDataInMrFIO_IN: TStringField;
    MemoryDataInMrNUM_IN: TStringField;
    MemoryDataInMrID_DOG_IN: TStringField;
    ActionList1: TActionList;
    Action1: TAction;
    Timer1: TTimer;
    MemoryDataNotMrUse_End: TDateField;
    MemoryDataInMrUse_End_in: TDateField;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ExitButtonView: TdxBarLargeButton;
    MemoryDataFilter: TRxMemoryData;
    ActionFilter: TAction;
    Id_Dog_Status_in: TcxGridDBColumn;
    MemoryDataInMrId_Dog_Status_in: TStringField;
    MemoryDataInMrName_Dog_Status_in: TStringField;
    GridTableName_dog_status: TcxGridDBColumn;
    procedure cxButtonOneToListClick(Sender: TObject);
    procedure cxButtonAllToListClick(Sender: TObject);
    procedure cxButtonOneInListClick(Sender: TObject);
    procedure cxButtonAllInListClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FilterExecute_ButtonClick(Sender: TObject);
    procedure RefreshMemoryNot;
    Procedure RefreshMemoryIn;
    procedure Dog_Filter_EditEnter(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure ExitButtonViewClick(Sender: TObject);
    procedure FilterDogInReestr;
    procedure cxGrid2DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    DM : TfrmReestr_DM;
  public
    aHandle : TISC_DB_HANDLE;
    id_user:int64;
    id_reestr:int64;
    PLanguageIndex: Byte;
    view:Boolean;
    Sql_select:String;
    Name_prik, Name_facul, Name_spec, Name_Form, Name_kat:string;
    Date_beg_reg : Tdate;
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
      MemoryDataIn.FieldByName('MrID_DOG_in').AsString:=MemoryDataNot.FieldByName('MrID_DOG').AsString;
      MemoryDataIn.FieldByName('MrUse_End_in').AsDateTime:=MemoryDataNot.FieldByName('MrUse_End').AsDateTime;
      MemoryDataIn.Post;

      MemoryDataNot.Delete;
    end;
end;

procedure TfrReg_Add.cxButtonAllToListClick(Sender: TObject);
var
  i:Integer;
begin
  if MemoryDataNot.RecordCount-1 <0 then exit;
  refresh;
  cxGrid1DBTableView1.BeginUpdate;

  MemoryDataNot.First;

  for i:=0 to MemoryDataNot.RecordCount-1 do
    begin
      cxButtonOneToListClick(self);
      MemoryDataNot.Next;
    end;

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
      MemoryDataNot.FieldByName('MrID_DOG').AsString:=MemoryDataIn.FieldByName('MrID_DOG_in').AsString;
      MemoryDataNot.FieldByName('MrUse_End').AsString:=MemoryDataIn.FieldByName('MrUse_End_in').AsString;
      MemoryDataNot.Post;

      MemoryDataIn.Delete;
    end;
end;

procedure TfrReg_Add.cxButtonAllInListClick(Sender: TObject);
var
  i:Integer;
begin
  if MemoryDataIn.RecordCount-1 < 0 then exit;
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

  T:=TfrmAdd.Create(self, DM.DB.Handle);
  T.Caption := 'Информация о реестре';
  T.cxButton_ok.Caption     := cnConsts.cn_Accept[PLanguageIndex];
  T.cxButton_ok.Hint        := cnConsts.cn_Accept[PLanguageIndex];
  T.cxButton_cancel.Caption := cnConsts.cn_Cancel[PLanguageIndex];
  T.cxButton_cancel.hint    := cnConsts.cn_Cancel[PLanguageIndex];
  T.Note_memo.Text:= Name_prik+' '+Name_Facul+' '+Name_spec+' '+Name_Form+' '+Name_kat; 
  T.ShowModal;
  
  If (T.ModalResult = mrOk) then
   Begin
    //=====================================================
    Tran_write.StartTransaction;
    StoredProc.StoredProcName:='CN_DT_DOG_REESTR_INS';
    StoredProc.Prepare;
    StoredProc.ParamByName('NUM_REESTR').AsString:=T.Num_Edit.Text;
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
      StoredProc.ParamByName('ID_DOG').AsInt64:=StrToInt64(MemoryDataIn.FieldByName('MRID_DOG_IN').asString);
      StoredProc.ParamByName('USE_END').AsDate:=MemoryDataIn.FieldByName('MrUse_End_in').AsDateTime;
      StoredProc.ParamByName('ID_REESTR').AsInt64:=Id_reestr;
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
    ModalResult := mrOk;
   End;
  T.Free;
end;

procedure TfrReg_Add.FormShow(Sender: TObject);
begin
  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Tran_Read.StartTransaction;

  Dog_Filter_Edit.Caption          :=         cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  FiltrByFIO_RadioButton.Caption   :=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
  FiltrByNum_RadioButton.Caption   :=         cnConsts.cn_FiltrByNum[PLanguageIndex];
  FilterExecute_Button.Hint        :=         cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  GridTableName_dog_status.Caption :=         cn_Status[PLanguageIndex];

  If cxButtonSave.Enabled then
   begin
    DataSet_update.Close;
    DataSet_update.SQLs.SelectSQL.Text := Sql_select;
    DataSet_update.ParamByName('DATE_BEG_REG').AsDate := Date_beg_reg;
    DataSet_update.Open;
    DataSet_update.FetchAll;
    RefreshMemoryNot;
   End
  Else
   Begin
    DataSet_update.Close;
    DataSet_update.SQLs.SelectSQL.Clear;
    DataSet_update.SQLs.SelectSQL.Text:='Select * from cn_dt_dog_select_for_reestr('+IntToStr(ID_REESTR)+', null, null, null)';
    DataSet_update.Open;
    DataSet_update.FetchAll;
    GridTableName_dog_status.Visible:=true;
    RefreshMemoryIn;
   End;
end;

procedure TfrReg_Add.FilterExecute_ButtonClick(Sender: TObject);
begin
  if cxButtonOneToList.Enabled
  then
   Begin
    if Dog_Filter_Edit.text <> '' then
     Begin
      DataSet_update.Close;
      DataSet_update.SQLs.SelectSQL.Clear;
      if FiltrByFIO_RadioButton.Checked
       Then DataSet_update.SQLs.SelectSQL.add('Select * from cn_dt_dog_select_for_reestr(null, '''+Dog_Filter_Edit.Text+''', null, :date_beg_reg)')
       Else DataSet_update.SQLs.SelectSQL.add('Select * from cn_dt_dog_select_for_reestr(null, null, '''+Dog_Filter_Edit.Text+''', :date_beg_reg)');
      DataSet_update.ParamByName('Date_beg_reg').AsDate := Date_beg_reg;
      DataSet_update.Open;
      DataSet_update.FetchAll;
      RefreshMemoryNot;
     End
   End
  Else FilterDogInReestr;
end;

Procedure TfrReg_Add.RefreshMemoryIn;
Var
  i:integer;
Begin
  if DataSet_update.RecordCount-1 < 0 then exit;
  MemoryDataIn.EmptyTable;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDatain.Open;
    MemoryDatain.Insert;
    MemoryDatain.FieldByName('MrFIO_in').AsString:='';
    MemoryDatain.FieldByName('MrNum_in').AsString:='';
    MemoryDatain.FieldByName('MrID_DOG_in').AsString:='';
    MemoryDatain.FieldByName('MrUSE_END_IN').AsDateTime:=0;
    MemoryDatain.FieldByName('MrId_Dog_Status_in').AsString:='';
    MemoryDatain.FieldByName('MrName_Dog_Status_in').asString:='';
    MemoryDatain.Post;
    MemoryDatain.Next;
   End;
  MemoryDatain.First;
  DataSet_update.First;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDatain.Open;
    MemoryDatain.Edit;
    MemoryDatain.FieldByName('MrFIO_in').AsString:=DataSet_update['FIO_OUT'];
    MemoryDatain.FieldByName('MrNUM_in').AsString:=DataSet_update['NUM_DOG_OUT'];
    MemoryDatain.FieldByName('MrID_DOG_in').AsString:=DataSet_update['ID_DOG_OUT'];
    MemoryDatain.FieldByName('MrUSE_END_IN').AsDateTime:=DataSet_update['USE_END_OUT'];
    MemoryDatain.FieldByName('MrId_Dog_Status_in').AsString:=DataSet_update['ID_DOG_STATUS'];
    MemoryDatain.FieldByName('MrName_Dog_Status_in').asString:=DataSet_update['Name_dog_Status'];
    MemoryDatain.Post;
    DataSet_update.Next;
    MemoryDatain.Next;
   end;

  MemoryDatain.First;
//==============================================================================
  MemoryDataFilter.EmptyTable;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDataFilter.Open;
    MemoryDataFilter.Insert;
    MemoryDataFilter.FieldByName('MrFIO_fl').AsString:='';
    MemoryDataFilter.FieldByName('MrNum_fl').AsString:='';
    MemoryDataFilter.FieldByName('MrID_DOG_fl').AsString:='';
    MemoryDataFilter.FieldByName('MrUSE_END_fl').AsDateTime:=0;
    MemoryDataFilter.Post;
    MemoryDataFilter.Next;
   End;
  MemoryDataFilter.First;
  DataSet_update.First;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDataFilter.Open;
    MemoryDataFilter.Edit;
    MemoryDataFilter.FieldByName('MrFIO_fl').AsString:=DataSet_update['FIO_OUT'];
    MemoryDataFilter.FieldByName('MrNUM_fl').AsString:=DataSet_update['NUM_DOG_OUT'];
    MemoryDataFilter.FieldByName('MrID_DOG_fl').AsString:=DataSet_update['ID_DOG_OUT'];
    MemoryDataFilter.FieldByName('MrUSE_END_fl').AsDateTime:=DataSet_update['USE_END_OUT'];
    MemoryDataFilter.Post;
    DataSet_update.Next;
    MemoryDataFilter.Next;
   end;
  MemoryDataFilter.First;
End;

Procedure TfrReg_Add.RefreshMemoryNot;
Var
 i:integer;
Begin
  if DataSet_update.RecordCount-1 < 0 then exit;
  MemoryDataNot.EmptyTable;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDataNot.Open;
    MemoryDataNot.Insert;
    MemoryDataNot.FieldByName('MrFIO').AsString:='';
    MemoryDataNot.FieldByName('MrNum').AsString:='';
    MemoryDataNot.FieldByName('MrID_DOG').AsString:='';
    MemoryDataNot.FieldByName('MrUSE_END').AsDateTime:=0;
    MemoryDataNot.Post;
    MemoryDataNot.Next;
   End;
  MemoryDataNot.First;
  DataSet_update.First;
  For i:=0 to DataSet_update.RecordCount-1 do
   Begin
    MemoryDataNot.Open;
    MemoryDataNot.Edit;
    MemoryDataNot.FieldByName('MrFIO').AsString:=DataSet_update['FIO_OUT'];
    MemoryDataNot.FieldByName('MrNUM').AsString:=DataSet_update['NUM_DOG_OUT'];
    MemoryDataNot.FieldByName('MrID_DOG').AsString:=DataSet_update.FieldByName('ID_DOG_OUT').asString;
    MemoryDataNot.FieldByName('MrUSE_END').AsString:=DataSet_update['USE_END_OUT'];
    MemoryDataNot.Post;
    DataSet_update.Next;
    MemoryDataNot.Next;
   end;
   MemoryDataNot.First;
End;

procedure TfrReg_Add.Dog_Filter_EditEnter(Sender: TObject);
begin
//  FilterExecute_ButtonClick(Self);
end;

procedure TfrReg_Add.Action1Execute(Sender: TObject);
begin
  Dog_Filter_Edit.SetFocus;
end;

procedure TfrReg_Add.Timer1Timer(Sender: TObject);
begin
  Action1Execute(sender);
  Timer1.Enabled:=false;
end;

procedure TfrReg_Add.Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Dog_Filter_Edit.Text='' then exit;
  if key = vk_return then FilterExecute_ButtonClick(self);
end;

procedure TfrReg_Add.dxBarLargeButton3Click(Sender: TObject);
begin
  close;
end;

procedure TfrReg_Add.ExitButtonViewClick(Sender: TObject);
begin
  close;
end;

Procedure TfrReg_Add.FilterDogInReestr;
Var
 i,n:integer;
 S,S2:String;
 fio:boolean;
Begin
  S:=Dog_Filter_Edit.Text;
  Fio:=FiltrByFIO_RadioButton.Checked;
  If MemoryDataFilter.RecordCount>0 then
   Begin
    while MemoryDataIn.RecordCount>0 do
     Begin
      MemoryDataIn.Delete;
     End;

    MemoryDataFilter.First;
    For i:=0 to MemoryDataFilter.RecordCount-1 do
     begin
      MemoryDataIn.Open;
      MemoryDataIn.Insert;
      MemoryDataIn.FieldByName('MrFIO_in').AsString:=MemoryDataFilter.FieldByName('MrFIO_fl').AsString;
      MemoryDataIn.FieldByName('MrNUM_in').AsString:=MemoryDataFilter.FieldByName('MrNUM_fl').AsString;
      MemoryDataIn.FieldByName('MrID_DOG_in').AsString:=MemoryDataFilter.FieldByName('MrID_DOG_fl').AsString;
      MemoryDataIn.FieldByName('MrUse_End_in').AsDateTime:=MemoryDataFilter.FieldByName('MrUse_End_fl').AsDateTime;
      MemoryDataIn.Post;
      MemoryDataFilter.Next;
     end;
    MemoryDataIn.First;
   End;
  s:=AnsiUpperCase(S);
  if S<>'' then
   Begin
    If MemoryDataFilter.RecordCount>0 then
     Begin
      MemoryDataIn.First;
      For i:=0 to MemoryDataIn.RecordCount-1 do
       Begin
        MemoryDataIn.Open;
        MemoryDataIn.Edit;
        If fio then S2:=MemoryDataIn.FieldByName('MrFIO_in').AsString
               Else S2:=MemoryDataIn.FieldByName('MrNUM_in').AsString;
        MemoryDataIn.Post;
        n:=pos(s,s2);
        if n<>1 then MemoryDataIn.Delete
                else MemoryDataIn.Next;
       End;
      MemoryDataIn.First;
     End;
   End
End;

procedure TfrReg_Add.cxGrid2DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
   Arect:TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[2])) = '0' then
   Begin
    ACanvas.Canvas.Brush.Color := $00F7EAD9;
    ACanvas.Canvas.FillRect(Arect);
   End
  Else
   Begin
    ACanvas.Canvas.Brush.Color := $00F2EFEC;
    ACanvas.Canvas.FillRect(Arect);
   End;
end;

procedure TfrReg_Add.FormCreate(Sender: TObject);
begin
    sql_select := 'Select * from cn_dt_dog_select_for_reestr(null, null, null, :date_beg_reg)';
end;

end.
