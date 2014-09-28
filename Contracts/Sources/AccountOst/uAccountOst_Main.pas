unit uAccountOst_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, frxClass, frxDBSet,
  ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxTL, dxBarExtItems, dxBar, ImgList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cn_Common_Types,
  cn_Common_Funcs, cnConsts, cxTextEdit, cn_common_messages;

type
  TfrmAccountOst_main = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
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
    button_tosingin: TdxBarLargeButton;
    button_tosingout: TdxBarLargeButton;
    button_unsingin: TdxBarLargeButton;
    button_unsingout: TdxBarLargeButton;
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
    DB: TpFIBDatabase;
    DataSet_Ost: TpFIBDataSet;
    Tran_Read: TpFIBTransaction;
    Tran_write: TpFIBTransaction;
    StorProc_add: TpFIBStoredProc;
    Source_Ost: TDataSource;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionPrint: TAction;
    ActionExit: TAction;
    acDebug: TAction;
    DBDataset: TfrxDBDataset;
    Report: TfrxReport;
    DataSet_report: TpFIBDataSet;
    FIO: TcxGridDBColumn;
    Number: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    constructor Create(AParameter:TcnSimpleParams; D:TDate); overload;
    procedure ExitButtonClick(Sender: TObject);
    procedure Refresh;
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DateReg:TDate;
    PLanguageIndex:Byte;
    pParameter:TcnSimpleParams;
    ID_OST:int64;
    { Public declarations }
  end;

var
  frmAccountOst_main: TfrmAccountOst_main;

implementation

Uses uAdd_edit, cxCurrencyEdit;
{$R *.dfm}

Constructor TfrmAccountOst_main.Create(AParameter:TcnSimpleParams; D:TDate);
Begin
 Inherited create(AParameter.Owner);
 PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
 DB.Handle:=AParameter.Db_Handle;
 DB.Open;
 Tran_Read.StartTransaction;
 DateReg:=D;
 pParameter:=AParameter;
 Refresh;
End;

Procedure TfrmAccountOst_main.Refresh;
Begin
  DataSet_Ost.Close;
  DataSet_Ost.SQLs.SelectSQL.Clear;
  DataSet_Ost.SQLs.SelectSQL.Add('Select * From cn_dt_Account_ost_select(:DATE_R)');
  DataSet_Ost.ParamByName('DATE_R').AsDate:=DateReg;
  DataSet_Ost.Open;
End;

procedure TfrmAccountOst_main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAccountOst_main.DeleteButtonClick(Sender: TObject);
Var
  i:integer;
begin
  {If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;}

  if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  start_sql_monitor;
  Tran_write.StartTransaction;
  StorProc_add.StoredProcName:='CN_DT_ACCOUNT_OST_DELETE_BY_ID';
  StorProc_add.Prepare;
  StorProc_add.ParamByName('ID_OST').AsInt64:=DataSet_Ost['ID_OST'];
  StorProc_add.ExecProc;
  Try
   Tran_write.Commit;
  except
   on E:Exception do
    begin
     cnShowMessage('Error in CN_DT_ACCOUNT_OST_DELETE_BY_ID',e.Message,mtError,[mbOK]);
     Tran_write.Rollback;
    end;
  End;
  stop_sql_monitor;
  StorProc_add.Close;
  Refresh;
end;

procedure TfrmAccountOst_main.AddButtonClick(Sender: TObject);
Var
  T:TfrmAdd_edit;
begin
  T:=TfrmAdd_edit.Create(pParameter);
  T.Caption:=  cn_InsertBtn_Caption[PLanguageIndex]+' ...';
  T.ShowModal;
  If t.ModalResult=mrOk then
   Begin
    start_sql_monitor;
    Tran_write.StartTransaction;
    StorProc_add.StoredProcName:='CN_DT_ACCOUNT_OST_INSERT';
    StorProc_add.Prepare;
    StorProc_add.ParamByName('date_reg').AsDate:=DateReg;
    StorProc_add.ParamByName('id_stud').AsInt64:=T.ID_STUD;
    StorProc_add.ParamByName('id_sm').AsInt64:=T.ID_SMETA;
    StorProc_add.ParamByName('id_rz').AsInt64:=T.ID_RAZDEL;
    StorProc_add.ParamByName('id_st').AsInt64:=T.ID_STAT;
    StorProc_add.ParamByName('id_kekv').AsInt64:=T.ID_KEKV;
    StorProc_add.ParamByName('nach_summa').AsFloat:=T.Summa_Edit.EditValue;
    StorProc_add.ExecProc;
    id_ost:=StorProc_add.parambyName('ID_OST').AsInt64;
    Try
     Tran_write.Commit;
    except
     on E:Exception do
      begin
       cnShowMessage('Error in CN_DT_ACCOUNT_OST_INSERT',e.Message,mtError,[mbOK]);
       Tran_write.Rollback;
      end;
    End;
    stop_sql_monitor;
   End;
  T.Free;
  Refresh;
  DataSet_Ost.Locate('ID_OST',id_ost,[]);
end;

procedure TfrmAccountOst_main.EditButtonClick(Sender: TObject);
Var
  T:TfrmAdd_edit;
  id_ost:int64;
  smeta_kod,razdel_kod,stat_kod,kekv_kod:integer;
begin
  if cxGrid1DBTableView1.DataController.RecordCount=0 then exit;
  id_ost:=DataSet_Ost['ID_OST'];
  T:=TfrmAdd_edit.Create(pParameter);
  T.Caption:=  cn_EditBtn_Caption[PLanguageIndex]+' ...';
  T.Edit_FIO.EditText:=DataSet_Ost['FIO'];
  T.Edit_num_dog.Text:=DataSet_Ost['NUM_DOG'];
  T.Summa_Edit.EditValue:=DataSet_Ost['SUMMA'];

  T.DataSet_Add.Close;
  T.DataSet_Add.SQLs.SelectSQL.Clear;
  T.DataSet_Add.SQLs.SelectSQL.Add('SELECT * FROM CN_DT_DOG_SMET_KOD_BY_ID_OST(:ID_OST)');
  T.DataSet_Add.ParamByName('ID_OST').AsInt64:=id_ost;
  T.DataSet_Add.Open;
  If T.DataSet_Add['SMETA_KOD']<>null then Smeta_kod:=T.DataSet_Add['SMETA_KOD'];
  If T.DataSet_Add['razdel_kod']<>null then Razdel_kod:=T.DataSet_Add['razdel_kod'];
  If T.DataSet_Add['STAT_KOD']<>null then Stat_kod:=T.DataSet_Add['STAT_KOD'];
  If T.DataSet_Add['KEKV_KOD']<>null then Kekv_kod:=T.DataSet_Add['KEKV_KOD'];
  T.Smeta_Edit.Text:=IntToStr(smeta_kod);
  T.Razdel_Edit.Text:=IntToStr(razdel_kod);
  T.Stat_Edit.Text:=IntToStr(stat_kod);
  T.Kekv_Edit.text:=IntToStr(kekv_kod);
  
  T.ShowModal;
  If t.ModalResult=mrOk then
   Begin
    start_sql_monitor;
    Tran_write.StartTransaction;
    StorProc_add.StoredProcName:='CN_DT_ACCOUNT_OST_UPDATE_BY_ID';
    StorProc_add.Prepare;
    StorProc_add.ParamByName('ID_OST').AsInt64:=id_ost;
    StorProc_add.ParamByName('SUMMA').AsDouble:=T.Summa_Edit.EditValue;
    StorProc_add.ExecProc;
    Try
     Tran_write.Commit;
    except
     on E:Exception do
      begin
       cnShowMessage('Error in CN_DT_ACCOUNT_OST_UPDATE_BY_ID',e.Message,mtError,[mbOK]);
       Tran_write.Rollback;
      end;
    End;
    stop_sql_monitor;
   End;
  T.Free;
  Refresh;
  DataSet_Ost.Locate('ID_OST',id_ost,[]);
end;

procedure TfrmAccountOst_main.FormCreate(Sender: TObject);
begin
  Caption:=cn_EntryRest[PLanguageIndex]+' на '+DateToStr(DateReg);
  AddButton.Caption      := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Caption      := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption     := cn_EditBtn_Caption[PLanguageIndex];
  EditButton.Caption     := cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption   := cn_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Caption   := cn_DeleteBtn_Caption[PLanguageIndex];
  PrintButton.Caption    := cn_Print_Caption[PLanguageIndex];
  PrintButton.Caption    := cn_Print_Caption[PLanguageIndex];
  ExitButton.Caption     := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint        := cn_ExitBtn_Caption[PLanguageIndex];
  Fio.Caption            := cn_grid_FIO_Column[PLanguageIndex];
  Number.Caption         := cn_grid_Num_Dog_Column[PLanguageIndex];
  Summa.Caption          := cn_Summa_Column[PLanguageIndex];
end;

end.
