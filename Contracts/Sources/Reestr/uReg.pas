unit uReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  dxBarExtItems, dxBar, ImgList, iBase, cn_Common_Funcs, cn_Common_Types,
  DB, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, uReg_Add, cn_Common_Messages,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  ActnList, frxClass, frxDBSet, cnConsts_Messages, AccMGMT, cnConsts,
  cxCheckBox, frxDesgn, cn_Common_WaitForm, dxBarExtDBItems, StdCtrls,
  ExtCtrls, dxStatusBar, uReestr_DM, AppEvnts, AppStruClasses, RxMemDS,
  uPrik_EDBO;

type
  TfrReg = class(TForm)
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    NUM_REESTR: TcxGridDBColumn;
    DATE_REESTR: TcxGridDBColumn;
    NOTE_REESTR: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionPrint: TAction;
    ActionExit: TAction;
    DBDataset: TfrxDBDataset;
    DataSet_report: TpFIBDataSet;
    acDebug: TAction;
    button_tosingin: TdxBarLargeButton;
    button_tosingout: TdxBarLargeButton;
    button_unsingin: TdxBarLargeButton;
    button_unsingout: TdxBarLargeButton;
    sign_in: TcxGridDBColumn;
    sign_out: TcxGridDBColumn;
    Report: TfrxReport;
    dxBarPopupMenu1: TdxBarPopupMenu;
    ADD_LargeButton: TdxBarLargeButton;
    PRIK_LargeButton: TdxBarLargeButton;
    add_prik_act: TAction;
    refresh_button: TdxBarLargeButton;
    refresh_act: TAction;
    BarEdit_search: TdxBarEdit;
    BarStatic_filter: TdxBarStatic;
    BarButton_search: TdxBarButton;
    BarStatic_period: TdxBarStatic;
    BarDateCombo_date: TdxBarDateCombo;
    dxBarStatic3: TdxBarStatic;
    dxBarCombo1: TdxBarCombo;
    dxBarContainerItem1: TdxBarContainerItem;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarSubItem1: TdxBarSubItem;
    dxBarListItem1: TdxBarListItem;
    dxBarContainerItem2: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarProgressItem1: TdxBarProgressItem;
    dxBarLookupCombo1: TdxBarLookupCombo;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarCombo2: TdxBarCombo;
    dxBarSubItem2: TdxBarSubItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarTreeViewCombo1: TdxBarTreeViewCombo;
    dxBarContainerItem3: TdxBarContainerItem;
    BarControlContainerItem_filter: TdxBarControlContainerItem;
    Panel1: TPanel;
    RadioButton_Nomber_reestr: TRadioButton;
    RadioButton_number_prik: TRadioButton;
    Action_filter: TAction;
    StatusBarTop: TdxStatusBar;
    dxBarLargeButton3: TdxBarLargeButton;
    MemoryData_edbo: TRxMemoryData;
    dxBarLargeButton4: TdxBarLargeButton;

    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure Refresh;
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure button_tosinginClick(Sender: TObject);
    procedure button_tosingoutClick(Sender: TObject);
    procedure button_unsinginClick(Sender: TObject);
    procedure button_unsingoutClick(Sender: TObject);
    procedure add_prik_actExecute(Sender: TObject);
    procedure refresh_actExecute(Sender: TObject);
    procedure BarButton_searchClick(Sender: TObject);
    procedure BarEdit_searchKeyPress(Sender: TObject; var Key: Char);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure Load_edbo_person;
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    DM : TfrmReestr_DM;
  public
    PLanguageIndex: byte;
    IsDebugMode: boolean;
    Id_User:integer;    //идентификатор пользователя
    Is_Admin:boolean;   //признак админа
    Is_Done:Boolean;    //признак действия выполнить
    Id_Reestr:int64;    //идентификатор реестра
    constructor Create(AParameter:TcnSimpleParams); overload;
  end;

  function ShowReg(AParameter:TcnSimpleParams):Variant;stdcall;
  exports ShowReg;

var
  frReg: TfrReg;

implementation

uses uPrik, DateUtils;

{$R *.dfm}
function ShowReg(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrReg;
begin
 ViewForm := TfrReg.Create(AParameter);
 ViewForm.ShowModal;
 ViewForm.Free;
end;

Constructor TfrReg.Create(AParameter:TcnSimpleParams);
Begin
  inherited create(AParameter.Owner);
  PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();

  DM := TfrmReestr_DM.Create(self);

  DM.DB.Handle:=AParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.Tran_Read.StartTransaction;

  cxGrid1DBTableView1.DataController.DataSource := DM.Source_Reg;

  id_user:=AParameter.ID_User;

  is_admin:=true;
  If FibCheckPermission('/ROOT/Contracts/Cn_admin','Belong') <> 0
   then is_admin:=false;

  Is_Done:=True;
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0 then Is_Done:=False;
End;

Procedure TfrReg.Refresh;
Begin
  DM.DataSet_Reg.Close;
  DM.DataSet_Reg.SQLs.SelectSQL.Text:='select * from CN_DT_DOG_REESTR_SELECT where DATE_REESTR >= :DATE_REESTR';
  DM.DataSet_Reg.ParamByName('DATE_REESTR').AsDate := BarDateCombo_date.Date;
  DM.DataSet_Reg.Open;
End;

procedure TfrReg.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrReg.AddButtonClick(Sender: TObject);
Var
  T:TfrReg_Add;
  wf:TForm;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Add') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;
  
  wf := ShowWaitForm(self,wfLoadPackage);

  T := TfrReg_Add.create(self);

  CloseWaitForm(wf);

  T.PLanguageIndex := PLanguageIndex;
  T.Caption := cn_InsertBtn_Caption[PLanguageIndex];
  T.id_user := Id_User;
  T.Date_beg_reg := BarDateCombo_date.Date;
  T.aHandle := DM.DB.Handle;
  T.showModal;
  If T.ModalResult = mrOk then Refresh;
  T.Free;
end;

procedure TfrReg.DeleteButtonClick(Sender: TObject);
var
  i:integer;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Del') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Done') <> 0 then
    If Id_User <> DM.DataSet_Reg['ID_USER']
     then
      Begin
       messagebox(handle,
       pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
       +#13+'Реєстр сформований іншим користувачем'
       +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
       pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
       exit;
      End;

  if ((DM.DataSet_Reg['SIGN_ID_IN']=1)or(DM.DataSet_Reg['SIGN_ID_OUT']=1)) then
   begin
    messagebox(handle,PChar(cn_Can_not_delete[PLanguageIndex]),
    PChar(cn_msg_info[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;
  if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.Tran_write.StartTransaction;
  DM.StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_DEL';
  DM.StorProc_add.Prepare;
  DM.StorProc_add.ParamByName('ID_REESTR').AsInt64 := DM.DataSet_Reg['ID_REESTR'];
  DM.StorProc_add.ExecProc;
  Try
   DM.Tran_write.Commit;
   DM.StorProc_add.Close;
  except
   DM.Tran_write.Rollback;
   DM.StorProc_add.Close;
  End;
  Refresh;
end;

procedure TfrReg.EditButtonClick(Sender: TObject);
Var
  T:TfrReg_Add;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Edit') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  If cxGrid1DBTableView1.DataController.RecordCount>0 then
   Begin
    T := TfrReg_Add.create(self,);
    T.Caption:=cn_Reestr[PLanguageIndex]+' '+DM.DataSet_Reg['NUM_REESTR']+' '+cn_Vid[PLanguageIndex]+' '
               +DateToStr(DM.DataSet_Reg['DATE_REESTR'])+' Сформований:'+DM.DataSet_Reg['NAME_ADD'] ;
    T.PLanguageIndex:=PLanguageIndex;
    T.cxButtonOneToList.Enabled:=false;
    T.cxButtonAllToList.Enabled:=false;
    T.cxButtonOneInList.Enabled:=false;
    T.cxButtonAllInList.Enabled:=false;
    T.cxButtonSave.Enabled:=False;
    T.cxButtonOneToList.Visible:=false;
    T.cxButtonAllToList.Visible:=false;
    T.cxButtonOneInList.Visible:=false;
    T.cxButtonAllInList.Visible:=false;
    T.cxButtonClose.Visible:=false;
    T.cxGrid1.Visible:=false;
    T.ExitButtonView.Visible:=ivAlways;
    t.ExitButtonView.Caption := cn_ExitBtn_Caption[PLanguageIndex];
//    T.cxGrid2.Left:=0;
    T.cxGrid2.Align:=alClient;
    T.cxButtonSave.Visible:=False;
    T.Id_reestr:=DM.DataSet_Reg['ID_REESTR'];
    T.Date_beg_reg := BarDateCombo_date.Date;
    T.View:=true;
    T.aHandle := DM.DB.Handle;
    T.showModal;
    T.Free;
  End;
end;

procedure TfrReg.FormCreate(Sender: TObject);
var
  year, month, day : Word;
begin
  Caption                           := cn_ReestrContracts_Tiltle[PLanguageIndex];
  AddButton.Caption                 := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint                    := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption                := cn_ViewShort_Caption[PLanguageIndex];
  EditButton.Hint                   := cn_ViewShort_Caption[PLanguageIndex];
  DeleteButton.Caption              := cn_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Hint                 := cn_DeleteBtn_Caption[PLanguageIndex];
  PrintButton.Caption               := cn_Print_Caption[PLanguageIndex];
  PrintButton.Hint                  := cn_Print_Caption[PLanguageIndex];
  ExitButton.Caption                := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint                   := cn_ExitBtn_Caption[PLanguageIndex];
  button_tosingin.Caption           := cn_Signature[PLanguageIndex]+' 1';
  button_tosingout.Caption          := cn_Signature[PLanguageIndex]+' 2';
  button_unsingin.Caption           := cn_Signature_off[PLanguageIndex]+' 1';
  button_unsingout.Caption          := cn_Signature_off[PLanguageIndex]+' 2';
  refresh_button.Caption            := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint                := cn_RefreshBtn_Caption[PLanguageIndex];
  BarStatic_filter.Caption          := cn_SearchBtn_Caption[PLanguageIndex];
  RadioButton_Nomber_reestr.Caption := cn_FiltrByNum[PLanguageIndex];
  RadioButton_number_prik.Caption   := cn_NomPrikaz[PLanguageIndex];

  DecodeDate(Now, year, month, day);

  BarDateCombo_date.Date := EncodeDate(year, 1, 1);
  
  RadioButton_Nomber_reestr.Checked := true;
  
  IsDebugMode := false;

  Refresh;
end;

procedure TfrReg.ActionAddExecute(Sender: TObject);
begin
  AddButtonClick(self);
end;

procedure TfrReg.ActionEditExecute(Sender: TObject);
begin
  EditButtonClick(self);
end;

procedure TfrReg.ActionDeleteExecute(Sender: TObject);
begin
  DeleteButtonClick(self);
end;

procedure TfrReg.ActionPrintExecute(Sender: TObject);
begin
  PrintButtonClick(self);
end;

procedure TfrReg.PrintButtonClick(Sender: TObject);
Var
  aName_File:string;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Print') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  if cxGrid1DBTableView1.DataController.RecordCount=0 then Exit;
  aName_File:='cn_DogInReestr.fr3';

  Report.Clear;
  report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+aName_File);
  report.Variables.Clear;
  DM.Tran_Read.StartTransaction;
  DataSet_report.Close;
  DataSet_report.SelectSQL.Clear;
  DataSet_report.SelectSQL.add('SELECT *');
  DataSet_report.SelectSQL.add('FROM CN_DT_DOG_SELECT_FOR_REESTR(:id_reestr, :fio, :num_dog, null) ');
  DataSet_report.SelectSQL.add('order by shot_name_facul_out, name_spec, name_form_stud, name_kat_stud, NUM_DOG_OUT');
  DataSet_report.ParamByName('Id_reestr').AsInt64:=DM.DataSet_Reg['ID_REESTR'];
  DataSet_report.Open;

  If DM.DataSet_Reg['NUM_REESTR'] <> null
   then Report.Variables['NUM_REESTR']  := ''''+ DM.DataSet_Reg['NUM_REESTR'] + ''''
   Else Report.Variables['NUM_REESTR']  := '';
  Report.PrepareReport;
  if IsDebugMode
   then Report.DesignReport
   else Report.ShowPreparedReport;

  Screen.Cursor:=crDefault;
end;

procedure TfrReg.ActionExitExecute(Sender: TObject);
begin
  ExitButtonClick(self);
end;

procedure TfrReg.acDebugExecute(Sender: TObject);
begin
 if not IsDebugMode
  then
   Begin
    IsDebugMode:=true;
    Caption:=Caption+' *debug';
   End
  Else
   Begin
    IsDebugMode:=false;
    Caption:=cn_ReestrContracts_Tiltle[PLanguageIndex];
   End;
end;

procedure TfrReg.button_tosinginClick(Sender: TObject);
begin
  If not Is_Admin then
   If Is_Done then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     Exit;
    End;

  If DM.DataSet_Reg['SIGN_ID_IN']=1 then
   begin
    messagebox(handle,'Уже подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;

   DM.Tran_write.StartTransaction;
   DM.StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_SIGNIN';
   DM.StorProc_add.Prepare;
   DM.StorProc_add.ParamByName('ID_REESTR').AsInt64:=DM.DataSet_Reg['ID_REESTR'];
   DM.StorProc_add.ParamByName('USER_IN').AsInt64:=Id_User;
   DM.StorProc_add.ParamByName('SIGN_IN').AsInteger:=1;
   DM.StorProc_add.ExecProc;
   Try
    DM.Tran_write.Commit;
    DM.StorProc_add.Close;
    messagebox(handle,'Подписанный!',
    PChar(cn_msg_INFO[PLanguageIndex]), MB_ICONINFORMATION or mb_Ok);
   Except
    DM.Tran_write.Rollback;
    DM.StorProc_add.Close;
    messagebox(handle,'Не подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   End;
   id_reestr:=DM.DataSet_Reg['ID_REESTR'];
   Refresh;
   DM.DataSet_Reg.Locate('Id_REESTR',id_reestr,[]);
end;

procedure TfrReg.button_tosingoutClick(Sender: TObject);
begin
  If not Is_Admin then
   If not Is_Done then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     Exit;
    End;

  If DM.DataSet_Reg['SIGN_ID_IN']<>1 then
   begin
    messagebox(handle,
    'Подписать нельзя!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;

  If DM.DataSet_Reg['SIGN_ID_OUT']=1 then
   begin
    messagebox(handle,
    'Уже подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;

   DM.Tran_write.StartTransaction;
   DM.StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_SIGNOUT';
   DM.StorProc_add.Prepare;
   DM.StorProc_add.ParamByName('ID_REESTR').AsInt64:=DM.DataSet_Reg['ID_REESTR'];
   DM.StorProc_add.ParamByName('USER_OUT').AsInt64:=Id_User;
   DM.StorProc_add.ParamByName('SIGN_OUT').AsInteger:=1;
   DM.StorProc_add.ExecProc;
   Try
    DM.Tran_write.Commit;
    DM.StorProc_add.Close;
    messagebox(handle,'Подписанный!',
    PChar(cn_msg_INFO[PLanguageIndex]), MB_ICONINFORMATION or mb_Ok);
   Except
    DM.Tran_write.Rollback;
    DM.StorProc_add.Close;
    messagebox(handle,'Не подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   End;
   id_reestr:=DM.DataSet_Reg['ID_REESTR'];
   Refresh;
   DM.DataSet_Reg.Locate('Id_REESTR',id_reestr,[]);
end;

procedure TfrReg.button_unsinginClick(Sender: TObject);
begin
  If not Is_Admin then
   if Is_Done then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     Exit;
    End;

  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Done') <> 0 then
    If Id_User<>DM.DataSet_Reg['ID_USER']
     then
      Begin
       messagebox(handle,
       pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
       +#13+'Реєстр підписаний іншим користувачем'
       +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
       pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
       exit;
      End;

  If (DM.DataSet_Reg['SIGN_ID_OUT']=1) then
   Begin
    messagebox(handle,'Снять подпись нельзя!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;

  if DM.DataSet_Reg['SIGN_ID_IN']<>1 then
   begin
    messagebox(handle,'Не подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;


  DM.Tran_write.StartTransaction;
  DM.StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_SIGNIN';
  DM.StorProc_add.Prepare;
  DM.StorProc_add.ParamByName('ID_REESTR').AsInt64:=DM.DataSet_Reg['ID_REESTR'];
  DM.StorProc_add.ParamByName('USER_IN').AsInt64:=Id_User;
  DM.StorProc_add.ParamByName('SIGN_IN').AsInteger:=0;
  DM.StorProc_add.ExecProc;
  Try
   DM.Tran_write.Commit;
   DM.StorProc_add.Close;
   messagebox(handle,'Подпись снята!',
   PChar(cn_msg_INFO[PLanguageIndex]), MB_ICONINFORMATION or mb_Ok);
  Except
   DM.Tran_write.Rollback;
   DM.StorProc_add.Close;
   messagebox(handle,'Подпись не снята!',
   PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  End;
  id_reestr:=DM.DataSet_Reg['ID_REESTR'];
  Refresh;
  DM.DataSet_Reg.Locate('Id_REESTR',id_reestr,[]);
end;

procedure TfrReg.button_unsingoutClick(Sender: TObject);
begin
  If not Is_Admin then
   If not Is_Done then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     Exit;
    End;

  If (DM.DataSet_Reg['SIGN_ID_OUT']<>1) then
   Begin
    messagebox(handle,'Не подписанный!',
    PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    Exit;
   End;

  DM.Tran_write.StartTransaction;
  DM.StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_SIGNOUT';
  DM.StorProc_add.Prepare;
  DM.StorProc_add.ParamByName('ID_REESTR').AsInt64:=DM.DataSet_Reg['ID_REESTR'];
  DM.StorProc_add.ParamByName('USER_OUT').AsInt64:=Id_User;
  DM.StorProc_add.ParamByName('SIGN_OUT').AsInteger:=0;
  DM.StorProc_add.ExecProc;
  Try
   DM.Tran_write.Commit;
   DM.StorProc_add.Close;
   messagebox(handle,'Подпись снята!',
   PChar(cn_msg_INFO[PLanguageIndex]), MB_ICONINFORMATION or mb_Ok);
  Except
   DM.Tran_write.Rollback;
   DM.StorProc_add.Close;
   messagebox(handle,'Подпись не снята!',
   PChar(cn_msg_WARNING[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  End;
  id_reestr:=DM.DataSet_Reg['ID_REESTR'];
  Refresh;
  DM.DataSet_Reg.Locate('Id_REESTR',id_reestr,[]);
end;

procedure TfrReg.add_prik_actExecute(Sender: TObject);
var
  T:TfrmPrik;
  wf:TForm;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Add') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  wf:=ShowWaitForm(self,wfLoadPackage);
  T:=TfrmPrik.Create(self);
  CloseWaitForm(wf);
  T.aHandle := DM.DB.Handle;
  T.PLanguageIndex:=PLanguageIndex;
  T.Id_user:=Id_User;
  T.Date_beg_reg := BarDateCombo_date.Date;
  T.ShowModal;
  If T.ModalResult=mrOk then Refresh;
  T.Free;
end;

procedure TfrReg.refresh_actExecute(Sender: TObject);
begin
  refresh;
end;

procedure TfrReg.BarButton_searchClick(Sender: TObject);
begin
  if BarEdit_search.Text = '' then Exit;

  DM.DataSet_Reg.Close;

  if RadioButton_Nomber_reestr.Checked then
   Begin
    DM.DataSet_Reg.SQLs.SelectSQL.Text:='select * from CN_DT_DOG_REESTR_SELECT where UPPER(NUM_REESTR) like :NUM_REESTR';
    DM.DataSet_Reg.ParamByName('NUM_REESTR').AsString := '%' + UpperCase(BarEdit_search.Text)+'%';
   End;

  if RadioButton_number_prik.Checked then
   Begin
    DM.DataSet_Reg.SQLs.SelectSQL.Text:='select * from CN_DT_DOG_RST_SEL_FOR_FILT_PRIK(:n_prik)';
    DM.DataSet_Reg.ParamByName('n_prik').AsString := BarEdit_search.Text;
   end;

  DM.DataSet_Reg.Open;
end;

procedure TfrReg.BarEdit_searchKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then BarButton_searchClick(self);
end;

procedure TfrReg.dxBarLargeButton3Click(Sender: TObject);
var
  now_stamp : TDateTime;
  ViewForm  : TfrmPrik_EDBO;
  wf : TForm;
begin
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Add') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from CN_WEB_INI_sel';
  DM.DataSet_read.Open;

  //проверяем и загружаем если время подошло
  now_stamp := now;
  If (DM.DataSet_read['date_time_synch_reestr'] <= now_stamp)
   then load_edbo_person;

  wf := ShowWaitForm(self,wfLoadPackage);
  ViewForm := TfrmPrik_EDBO.Create(self);
  CloseWaitForm(wf);

  ViewForm.aHandle := DM.DB.Handle;
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Id_user := Id_User;
  ViewForm.Date_beg_reg := BarDateCombo_date.Date;
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOk
   then Refresh;

  ViewForm.Free;
end;

procedure TfrReg.Load_edbo_person;
var
  EDBOPersonIntf : TFMASAppModule;
  path_str : string;
  UniversityKode : AnsiString;
  Id_PersonRequestSeasons : Integer;
  i : Integer;
  waitForm : TcnWaitForm;
begin
  with TFMASAppModuleCreator.Create do
   begin
    path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

    EDBOPersonIntf:= CreateFMASModule(path_str, 'EDBOIntf');

    If ((EDBOPersonIntf = nil) or (EDBOPersonIntf = nil))
     then MessageBox(application.Handle, 'Помилка при роботі з модулем взаємодії з ЄДЕБО', 'Увага!', MB_OK or MB_ICONWARNING)
     else
      begin
       if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle)
       then
        Begin
         try
          waitForm := TcnWaitForm.create(self);
          waitForm.Show;

          UniversityKode          := DM.DataSet_read['KOD_UNIVERSITY'];
          Id_PersonRequestSeasons := DM.DataSet_read['ID_SEASON'];

          EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);
          EDBOPersonIntf.InParams.Items['Id_PersonRequestSeasons']:=PInteger(@Id_PersonRequestSeasons);

          MemoryData_edbo.Open;
          (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationsFullGet',MemoryData_edbo);

          DM.StorProc_add.StoredProcName := 'CN_WEB_DT_REESTR_EDBO_INS';
          Dm.StorProc_add.Transaction.StartTransaction;
          MemoryData_edbo.Open;
          MemoryData_edbo.First;
          For i := 1 to memoryData_edbo.RecordCount do
           Begin
            if ((MemoryData_edbo['fid_personEducationPaymentType'] = 2) and
                (MemoryData_edbo['fid_personEducationHistoryType'] = 10)) then
             Begin
              DM.StorProc_add.Prepare;
              DM.StorProc_add.ParamByName('fPersonCodeU').AsVariant            := MemoryData_edbo['fPersonCodeU'];
              DM.StorProc_add.ParamByName('fid_education').AsVariant           := MemoryData_edbo['fid_education'];
              DM.StorProc_add.ParamByName('fid_PersonEducationForm').AsVariant := MemoryData_edbo['fid_PersonEducationForm'];
              DM.StorProc_add.ParamByName('fid_Qualification').AsVariant       := MemoryData_edbo['fid_Qualification'];
              DM.StorProc_add.ParamByName('fSpecCode').AsVariant               := MemoryData_edbo['fSpecCode'];
              If MemoryData_edbo['fPersonEducationHistoryOrdersNumber'] <> null
               then DM.StorProc_add.ParamByName('FNUMBERORDER').AsVariant      := MemoryData_edbo['fPersonEducationHistoryOrdersNumber']
               else DM.StorProc_add.ParamByName('FNUMBERORDER').AsVariant      := '-невизначено-';
              DM.StorProc_add.ParamByName('fid_Course').AsVariant              := MemoryData_edbo['fid_Course'];
              DM.StorProc_add.ParamByName('fid_UniversityGroup').AsVariant     := MemoryData_edbo['fid_UniversityGroup'];
              DM.StorProc_add.ParamByName('FUNIVERSITYFACULTETKODE').AsVariant := MemoryData_edbo['FUNIVERSITYFACULTETKODE'];
              DM.StorProc_add.ParamByName('FDATE_ORDER').AsVariant             := MemoryData_edbo['FPERSONEDUCATIONHISTORYORDERSDATE'];
              if  MemoryData_edbo['fPersonCodeU'] = '926f74cf-e269-4365-afb7-41bab09e5862' then showmessage('kod');
              DM.StorProc_add.ExecProc;
             end;
            MemoryData_edbo.Next; 
           end;

          waitForm.Free;
          DM.StorProc_add.Transaction.Commit;
          except
           on E:Exception do
            begin
             DM.StorProc_add.Transaction.Rollback;
             ShowMessage('Возникли ошибки при работе процедуры CN_WEB_DT_REESTR_EDBO_INS!' + #13#10 + E.Message);
            end;
         End;
        end;
      End;
   end;
end;

procedure TfrReg.dxBarLargeButton4Click(Sender: TObject);
var
  i : Byte;
begin
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте виконати цю дію? Вона займе де який час!', mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  load_edbo_person;
end;

end.
