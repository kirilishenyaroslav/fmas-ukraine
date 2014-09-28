//******************************************************************************
// Проект "Контракты"
// Реестр контрактов
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 19/01/2010
//******************************************************************************
unit Contracts_Unit;

interface
                              
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, cn_Common_Funcs, cn_Common_Messages,
  cnConsts, StdCtrls, cxLabel, ExtCtrls, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxTextEdit, cxCalendar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCurrencyEdit, cxCheckBox, ActnList,
  cxRadioGroup, cxGroupBox, FIBDataSet, pFIBDataSet, DM, IBase, cn_Common_Types,
  cn_Common_Loader, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData,
  cn_Contracts_FilterEx, cn_Common_WaitForm, cn_History_Unit, Menus,
  cnConsts_Messages, cn_PayersInfo, AccMGMT, dogLoaderUnit, IB_Externals,
  Placemnt;

type
  TStudBasicInfo = record
   ID_STUD : int64;
   ID_MAN  : int64;
   FIO     : string;
   Entry_Rest : Currency;
   ID_MAN_PARENT: int64;
  end;

  TExtraInfo = record
   ID_DOG  : int64;
   ID_STUD : int64;
   IsModalOk: boolean;
  end;

  TfrmContracts = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    HotKey_StatusBarContainer: TdxStatusBarContainerControl;
    Progress: TcxProgressBar;
    StatusBarTop: TdxStatusBar;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    FIO_BarContainer: TdxBarControlContainerItem;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    FilterExecute_Button: TdxBarButton;
    Magic_DissToNotDiss_Action: TAction;
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
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    cxDBTreeList1: TcxDBTreeList;
    fio: TcxDBTreeListColumn;
    date_dog: TcxDBTreeListColumn;
    num_dog: TcxDBTreeListColumn;
    beg_date: TcxDBTreeListColumn;
    end_date: TcxDBTreeListColumn;
    isdiss: TcxDBTreeListColumn;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    DsetRecordCount: TdxBarButton;
    Footer_Panel: TPanel;
    Footer_Bevel: TBevel;
    Faculty_Footer_Label_1: TLabel;
    Spec_Footer_Label_1: TLabel;
    Group_Footer_Label_1: TLabel;
    Gragdanstvo_Footer_Label_1: TLabel;
    CategoryStudy_Footer_Label_1: TLabel;
    FormStudy_Footer_Label_1: TLabel;
    Kurs_Footer_Label_1: TLabel;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    UpLoad_Button: TdxBarLargeButton;
    cxStyle57: TcxStyle;
    BreakDown_Button: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    ISMAINDOG_col: TcxDBTreeListColumn;
    testColorStyle: TcxStyle;
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    N1: TMenuItem;
    BreakDownPop: TMenuItem;
    UploadPop: TMenuItem;
    N2: TMenuItem;
    PayPop: TMenuItem;
    LgotaPop: TMenuItem;
    EntryRestPop: TMenuItem;
    N3: TMenuItem;
    Dodatki_Button: TdxBarSubItem;
    Timer: TTimer;
    Timer1: TTimer;
    Log: TdxBarButton;
    ID_KEY_c: TcxDBTreeListColumn;
    ID_PARENT_c: TcxDBTreeListColumn;
    ApostrofAction: TAction;
    RecoveryBtn: TdxBarButton;
    OrdersBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    Erased_Btn: TdxBarButton;
    ExportDataBtn: TdxBarButton;
    SaveDialog: TSaveDialog;
    Dog_status_label: TdxBarStatic;
    id_dog_stat: TcxDBTreeListColumn;
    PopupMenu2: TPopupMenu;
    Add_cont: TMenuItem;
    add_cont_to_reg: TMenuItem;
    CnFormStorage: TFormStorage;
    ChangeStatus: TMenuItem;
    use_end: TcxDBTreeListColumn;
    ScanPop: TMenuItem;
    N4: TMenuItem;
    PrintPop: TMenuItem;
    N5: TMenuItem;
    ReestrPop: TMenuItem;
    Scan_button: TdxBarButton;
    id_reestr_in: TcxDBTreeListColumn;
    ver_dog_pop: TMenuItem;
    NNumReestr: TMenuItem;
    dxBarButton4: TdxBarButton;
    FiltrByKod_RadioButton: TcxRadioButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    NoteStatic: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure Dog_Filter_EditEnter(Sender: TObject);
    procedure Dog_Filter_EditKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EntryRestButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterExecute_ButtonClick(Sender: TObject);
    procedure DsetRecordCountClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure GlobalFilterButtonClick(Sender: TObject);
    procedure LgotaButtonClick(Sender: TObject);
    procedure HistoryButtonClick(Sender: TObject);
    procedure UpLoad_ButtonClick(Sender: TObject);
    procedure cxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure BreakDown_ButtonClick(Sender: TObject);
    procedure RastorgPri4ina_ButtonClick(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure cxDBTreeList1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBTreeList1Click(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure BreakDownPopClick(Sender: TObject);
    procedure UploadPopClick(Sender: TObject);
    procedure PayPopClick(Sender: TObject);
    procedure LgotaPopClick(Sender: TObject);
    procedure EntryRestPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure cxDBTreeList1Change(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure PayerData_ButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LogClick(Sender: TObject);
    procedure ApostrofActionExecute(Sender: TObject);
    procedure RecoveryBtnClick(Sender: TObject);
    procedure OrdersBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure Erased_BtnClick(Sender: TObject);
    procedure ExportDataBtnClick(Sender: TObject);
    procedure btnTwainClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure ChangeStatusClick(Sender: TObject);
    procedure ver_dog_popClick(Sender: TObject);
    procedure NNumReestrClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure Dog_Filter_EditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PLanguageIndex: byte;
    DM:TDM_Contracts;
    hwnd: THintWindow;
    wf:TForm;
    ExtraMode : boolean;
    ActionMode : string;
    cnParamsToAddContract :TcnParamsToAddContract;
    ExtraInfo : TExtraInfo;
    EraseMod: boolean;
    is_admin : boolean;
    CN_USE_EXT_COLOR : Integer;   
    can_change_num_dog : boolean;
    CN_USE_EDBO_FIZ_LIC : Integer;
    procedure FormIniLanguage;
    procedure CaptionsClear();
    procedure ViewMenuButtons(Showing: boolean);
  public
    ID_ROLE, ISADMIN, CN_VIEW, ID_User : int64;
    CN_DOG_STATUS_RASTORG : int64;
    CN_DOG_STATUS_DEYSTV  : int64;
    User_Name, TYPE_REESTR: string;    //тип договора реестр или оплата
    res:Variant;
    AccessMode:Boolean;
    FormFilter : TfrmFilterEx;
    BarCode : Int64;
    constructor  Create(AParameter:TcnSimpleParamsAbiturient);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;

  var frmContracts :TfrmContracts;

implementation

uses Contract_Add_Edit, FIBQuery, pFIBStoredProc, pFIBQuery, FIBDatabase,
     pFIBProps, uVer_dog, Contracts_ViewReestrData, uComments;


{$R *.dfm}
procedure TfrmContracts.ViewMenuButtons(Showing: boolean);
var State : TdxBarItemVisible;
begin
 if Showing then State:= ivAlways
            else State:= ivNever;
 AddButton.Visible := State;
 EditButton.Visible := State;
 DeleteButton.Visible := State;
 BreakDown_Button.Visible := State;
 UpLoad_Button.Visible := State;
 GlobalFilterButton.Visible := State;
// btnTwain.Visible := State;
 PrintButton.Visible := State;
 PayButton.Visible := State;
 LgotaButton.Visible := State;
 EntryRestButton.Visible := State;
 OrdersBtn.Visible := State;
 AddPop.Enabled := Showing;
 EditPop.Enabled := Showing;
 DeletePop.Enabled := Showing;
 BreakDownPop.Enabled := Showing;
 UploadPop.Enabled := Showing;
 PayPop.Enabled := Showing;
 LgotaPop.Enabled := Showing;
 EntryRestPop.Enabled := Showing;
 Dog_Filter_Edit.Enabled := Showing;
// Dodatki_Button.Enabled := Showing;
 PayerData_Button.Visible := State;
 RastorgPri4ina_Button.Visible := State;
 HistoryButton.Visible := State;
// RecoveryBtn.Visible := State;
// Erased_Btn.Enabled := Showing;
 FilterExecute_Button.Enabled := Showing;
 if not Showing then
  begin
   NoteStatic.Caption := cn_DeletedMode[PLanguageIndex];
   NoteStatic.Visible := ivAlways;
  end
   else
  begin
   NoteStatic.Caption := '';
   NoteStatic.Visible := ivNever;
  end;
end;

procedure TfrmContracts.CaptionsClear();
begin
 Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[PLanguageIndex];
 Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[PLanguageIndex];
 Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[PLanguageIndex];
 Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[PLanguageIndex];
 CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
 FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[PLanguageIndex];
 Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[PLanguageIndex];
 Dog_status_label.caption:=               'Статус';
end;

procedure TfrmContracts.DataSetAfterOpen(DataSet: TDataSet);
begin
CaptionsClear();
if DataSet.Active then
begin
if DataSet['NAME_FACUL']<> null then
Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DataSet['NAME_FACUL'];
if DataSet['NAME_SPEC']<> null then
Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DataSet['NAME_SPEC'];
if DataSet['NAME_GROUP']<> null then
Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DataSet['NAME_GROUP'];
if DataSet['KURS']<> null then
Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DataSet['KURS']);
if DataSet['NAME_KAT_STUD']<> null then
CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DataSet['NAME_KAT_STUD'];
if DataSet['NAME_FORM_STUD']<> null then
FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DataSet['NAME_FORM_STUD'];
if DataSet['NAME_NAZIONAL']<> null then
Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DataSet['NAME_NAZIONAL'];
If DM.DataSet['NAME_DOG_STATUS']<> null
    Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
    Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
end;
end;

procedure TfrmContracts.DataSetAfterScroll(DataSet: TDataSet);
begin
CaptionsClear();
if DataSet.Active then
begin
if DataSet['NAME_FACUL'] <> null then
Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DataSet['NAME_FACUL'];
if DataSet['NAME_SPEC']<> null then
Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DataSet['NAME_SPEC'];
if DataSet['NAME_GROUP']<> null then
Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DataSet['NAME_GROUP'];
if DataSet['KURS']<> null then
Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DataSet['KURS']);
if DataSet['NAME_KAT_STUD']<> null then
CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DataSet['NAME_KAT_STUD'];
if DataSet['NAME_FORM_STUD']<> null then
FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DataSet['NAME_FORM_STUD'];
if DataSet['NAME_NAZIONAL']<> null then
Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DataSet['NAME_NAZIONAL'];
If DM.DataSet['NAME_DOG_STATUS']<> null
    Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
    Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
end;
end;


constructor TfrmContracts.Create(AParameter:TcnSimpleParamsAbiturient);
var i: integer;
 ID_DOG_ROOT_as_int : int64;
begin
   Screen.Cursor := crHourGlass;

   inherited Create(AParameter.Owner);

   //индекс языка (1-укр, 2 - рус)
   PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();

   is_admin := AParameter.cnParamsToPakage.Is_Admin;

   DM := TDM_Contracts.Create(Self);

   EraseMod:=false;     // режим удаленных договоров
   ExtraMode := False;
   AccessMode:= False;

   TYPE_REESTR:='R';
   If not Is_Admin then
    if fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0 then
     Begin
      AccessMode := true;
      TYPE_REESTR:='O';
     End;

   CN_View:=1;
   If not is_admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','View') <> 0
     then Cn_View:=0;

   If AParameter.WorkMode = 'extra'
    then ExtraMode := true;

   ActionMode := '';

   If ExtraMode
    then  ActionMode := AParameter.ActionMode;

   DM.DB.Handle:=AParameter.Db_Handle;
   ID_User :=  AParameter.ID_User;
   User_Name := AParameter.User_Name;
   CN_USE_EDBO_FIZ_LIC := AParameter.CN_USE_EDBO_FIZ_LIC;
   cnParamsToAddContract := AParameter.cnParamsToAddContract;

   // инициализация статусов договора
   CN_DOG_STATUS_DEYSTV  := -1;
   CN_DOG_STATUS_RASTORG := -1;

   DM.ReadDataSet.SQLs.SelectSQL.clear;
   DM.ReadDataSet.SelectSQL.Text := 'select * from CN_PUB_SYS_DATA_GET_ALL';
   DM.ReadDataSet.Open;
   if DM.ReadDataSet['CN_DOG_STATUS_DEYSTV'] <> null then CN_DOG_STATUS_DEYSTV := DM.ReadDataSet['CN_DOG_STATUS_DEYSTV'];
   if DM.ReadDataSet['CN_DOG_STATUS_RASTORG'] <> null then CN_DOG_STATUS_RASTORG := DM.ReadDataSet['CN_DOG_STATUS_RASTORG'];
   if DM.ReadDataSet['CN_USE_EXT_COLOR'] <> null then CN_USE_EXT_COLOR := DM.ReadDataSet['CN_USE_EXT_COLOR'] else CN_USE_EXT_COLOR := 1;
   DM.ReadDataSet.Close;

   if not ExtraMode then
    begin
     wf:=ShowWaitForm(self,wfLoadPackage);
     DM.ReadDataSet.SQLs.SelectSQL.clear;
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ROLE_BY_USER(' + inttostr(AParameter.ID_User) + ')';
     DM.ReadDataSet.Open;
     DM.ReadDataSet.FetchAll;
     DM.ReadDataSet.First;
     for i:=0 to DM.ReadDataSet.RecordCount -1 do
      begin
       if  DM.ReadDataSet['ID_ROLE'] <> null then
        begin
         ID_ROLE := DM.ReadDataSet['ID_ROLE'];
         ISADMIN := DM.ReadDataSet['ISADMIN'];
         if bool(DM.ReadDataSet['ISADMIN']) then break;
         DM.ReadDataSet.Next;
        end
       else
        begin
         ID_ROLE := -1;
         ISADMIN := 0;
         break;
        end;
      end;


     //Запрос отбора договора
     DM.ReadDataSet.Close;
     DM.DataSet.SQLs.SelectSQL.clear;
     DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_SELECT_HS(' +
     inttostr(Cn_view) + ',' + inttostr(AParameter.ID_User) + ','+ ''''+ TYPE_REESTR + '''' + ') order by Use_Beg descending';
     DM.DataSet.AfterOpen   := DataSetAfterOpen;
     DM.DataSet.AfterScroll := DataSetAfterScroll;
     DM.DataSet.Open;

     cxDBTreeList1.PopupMenu:= PopupMenu1;
     CnFormStorage.RestoreFormPlacement;
    end;

  if ExtraMode then   // если справочник работает для абитуриента в режиме "редактирования"
   if ActionMode = 'edit' then
    begin
     DM.ReadDataSet.SQLs.SelectSQL.clear;
     DM.ReadDataSet.SelectSQL.Text := 'select ID_DOG_ROOT from CN_GET_ID_ROOT_BY_ID_DOG(' + inttostr(AParameter.cnParamsToPakage.ID_DOG) + ')';
     DM.ReadDataSet.Open;
     ID_DOG_ROOT_as_int := DM.ReadDataSet['ID_DOG_ROOT'];
     DM.ReadDataSet.Close;
     DM.DataSet.SelectSQL.Clear;
     DM.DataSet.SelectSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT_as_int)+')';
     DM.DataSet.Open;
    end;

  DM.DataSet.AfterOpen   := DataSetAfterOpen;
  DM.DataSet.AfterScroll := DataSetAfterScroll;

  cxDBTreeList1.DataController.DataSource := DM.DataSource;
  FormFilter := TfrmFilterEx.create(self, PLanguageIndex, DM.DB.Handle); //создаю форму фильтра, но не показываю ее
  Screen.Cursor:=crDefault;
end;

procedure TfrmContracts.FormIniLanguage;
begin
 //кэпшн формы
 Caption:=                      cnConsts.cn_ReestrContracts_Tiltle[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex] + ' (Del)';
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[PLanguageIndex];
 PrintPop.Caption:=             cnConsts.cn_Print_Caption[PLanguageIndex];
 PayButton.Caption:=            cnConsts.cn_Pay_Caption[PLanguageIndex];
 LgotaButton.Caption:=          cnConsts.cn_Lgota_Caption[PLanguageIndex];
 EntryRestButton.Caption:=      cnConsts.cn_EntryRestShort[PLanguageIndex];
 HistoryButton.Caption:=        cnConsts.cn_History[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 UpLoad_Button.Caption :=       cnConsts.cn_Upload_Caption[PLanguageIndex];
 BreakDown_Button.Caption :=    cnConsts.cn_BreakDown_Caption[PLanguageIndex];
 PayerData_Button.Caption :=    cnConsts.cn_PayerInfoData[PLanguageIndex];
 RastorgPri4ina_Button.Caption :=  cnConsts.cn_Pri4inaRastorg[PLanguageIndex];
 Log.Caption :=                 cnConsts.cn_Log[PLanguageIndex];
 RecoveryBtn.Caption :=         cnConsts.cn_Recovery[PLanguageIndex];
 SelectBtn.Caption :=           cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ScanPop.Caption :=             cnConsts.cn_TwainShort[PLanguageIndex];
 Scan_button.Caption :=         cnConsts.cn_TwainShort[PLanguageIndex];
 // попап
 AddPop.Caption :=              cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=             cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=          cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=             cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 BreakDownPop.Caption :=        cnConsts.cn_BreakDown_Caption[PLanguageIndex];
 UploadPop.Caption :=           cnConsts.cn_Upload_Caption[PLanguageIndex];
 PayPop.Caption:=               cnConsts.cn_Pay_Caption[PLanguageIndex];
 LgotaPop.Caption:=             cnConsts.cn_Lgota_Caption[PLanguageIndex];
 EntryRestPop.Caption:=         cnConsts.cn_EntryRest_Caption[PLanguageIndex];
 OrdersBtn.Caption:=            cnConsts.cn_Orders[PLanguageIndex];
 Erased_Btn.Caption:=           cnConsts.cn_DeletedShow[PLanguageIndex];
 ver_dog_pop.Caption:=          'Перевірка договіру';
 ver_dog_pop.Hint:=             'Перевірка договіру';

 //статусбар
 StatusBarTop.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[4].Text:=  cnConsts.cn_FilterBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 StatusBarTop.Hint:=            cnConsts.cn_HotKeys[PLanguageIndex];
 // Грид
 fio.Caption.Text:=                  cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 date_dog.Caption.Text:=             cnConsts.cn_grid_Date_Dog_Column[PLanguageIndex];
 num_dog.Caption.Text:=              cnConsts.cn_grid_Num_Dog_Column[PLanguageIndex];
 beg_date.Caption.Text:=             cnConsts.cn_grid_Date_Beg[PLanguageIndex];
 end_date.Caption.Text:=             cnConsts.cn_grid_Date_End[PLanguageIndex];
 isdiss.Caption.Text:=               cnConsts.cn_grid_IsDiss_Column[PLanguageIndex];

 // Футер
 Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[PLanguageIndex];
 Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[PLanguageIndex];
 Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[PLanguageIndex];
 Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[PLanguageIndex];
 CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
 FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[PLanguageIndex];
 Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[PLanguageIndex];
 Dog_status_label.Caption:=               'Cтатус';
 // Фильтр
 Dog_Filter_Edit.Caption:=                cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 FiltrByFIO_RadioButton.Caption:=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
 FiltrByNum_RadioButton.Caption:=         cnConsts.cn_FiltrByNum[PLanguageIndex];
 FiltrByKod_RadioButton.Caption:=         'Штрих-Код';
 FilterExecute_Button.Hint:=              cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

 GlobalFilterButton.Caption:=             cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
 GlobalFilterButton.Hint:=                cnConsts.cn_FilterBtn_Caption[PLanguageIndex];

 BarManager.Bars[1].Caption:=             cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 Dog_Filter_Edit.CurText:=                cnConsts.cn_FilterText[PLanguageIndex];
 DsetRecordCount.Caption:=                cnConsts.cn_DSetRecordCount[PLanguageIndex];
 Dodatki_Button.Caption:=                 cnConsts.cn_Dodatki[PLanguageIndex];
 ExportDataBtn.Caption:=                 cnConsts.cn_ExportData[PLanguageIndex];
end;

procedure TfrmContracts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;

  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName:='CN_TMP_VALUE_PARAMS_DEL_ALL';
  DM.StProc.ParamByName('ID_SESSION').AsInt64:=FormFilter.ID_SESSION_params_study;
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   DM.StProc.Close;
   Except
    DM.WriteTransaction.Rollback;
    DM.StProc.Close;
  End;  
  FormFilter.Free;
  
  If FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmContracts.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmContracts.FormCreate(Sender: TObject);
begin
  FormIniLanguage;
  LoadSysData(DM.ReadTransaction);
end;

procedure TfrmContracts.AddButtonClick(Sender: TObject);
var
 ViewForm          :Tfrm_Contracts_AE;
 i, j, k, w , flag : integer;
 ID_DOG_ROOT       : int64;
 ID_DOG            : int64;
 ID_STUD           : int64;
 CurrentServerDate : TDateTime;
 cnAcademicYear    : TcnAcademicYear;

 StudersCounter  : byte;
 Man_Fio         : array of TStudBasicInfo;
 cnGetFromBuffer : boolean;

 AParameter              : TcnSimpleParams;
 ResMes                  : integer;
 res                     : Variant;
 LoadFromBuffer          : boolean;
 ID_RATE_ACCOUNT_Convert : int64;
 ResultSQl               : byte;
 DM_local                : TDM_Contracts;
 IsGenerateNumDog        : Boolean;
begin
   If ((not Is_Admin)and(not ExtraMode)) then
    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Add') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

  ViewForm := Tfrm_Contracts_AE.create(frmContracts, PLanguageIndex, DM.DB.Handle, 0,is_admin);
  ViewForm.Caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  ViewForm.LgotaButton.Enabled := false;
  ViewForm.EntryRestButton.Enabled := false;
  ViewForm.ID_TYPE_DOG := -1;
  ViewForm.CN_USE_EDBO_FIZ_LIC := CN_USE_EDBO_FIZ_LIC;
  ViewForm.TypeDogEditPropertiesButtonClick(Self,1);

  //подготовка------------------------------------------------------------------
  DM.ReadDataSet.close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  DM.ReadDataSet.Open;
  CurrentServerDate := DM.ReadDataSet['CUR_DATE'];
  DM.ReadDataSet.close;

  cnAcademicYear := cn_Common_Funcs.AcademicYear(CurrentServerDate);

  ViewForm.Date_Beg_DateEdit.Date  := cnAcademicYear.Date_Beg;
  ViewForm.Date_Zakl_DateEdit.Date := CurrentServerDate;


  DM.StProc.StoredProcName := 'CN_INC_DATE';
  DM.StProc.Transaction.StartTransaction;
  DM.StProc.Prepare;
  DM.StProc.ParamByName('INDATE').AsDate := cnAcademicYear.Date_End;
  DM.StProc.ParamByName('CNT_YEAR').AsInteger := 3;
  DM.StProc.ExecProc;
  ViewForm.Date_End_DateEdit.Date := DM.StProc.ParamByName('OUTDATE').AsDate;
  DM.StProc.Transaction.Commit;

  // далее проверяем признак разбивки по 30-е число
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_END_MONTH';
  Dm.ReadDataSet.Open;
  if Dm.ReadDataSet['CN_END_MONTH'] <> null
   then ResultSQl:= Dm.ReadDataSet['CN_END_MONTH']
   else ResultSQl:= 0;
  Dm.ReadDataSet.Close;

  if bool(ResultSQl) then
   begin
    DM.StProc.StoredProcName := 'CN_INC_DATE';
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('INDATE').AsDate := ViewForm.Date_End_DateEdit.Date;
    DM.StProc.ParamByName('CNT_DAY').AsInteger := -1;
    DM.StProc.ParamByName('CNT_YEAR').AsVariant := null;
    DM.StProc.ParamByName('CNT_MONTH').AsVariant := null;
    DM.StProc.ExecProc;
    ViewForm.Date_End_DateEdit.Date := DM.StProc.ParamByName('OUTDATE').AsDate;
    DM.StProc.Transaction.Commit;
   end;

  cnGetFromBuffer := false; // запрос - загружать ли буфер
  DM.ReadDataSet.close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_IS_GET_DOG_FROM_BUFFER';
  DM.ReadDataSet.Open;
  cnGetFromBuffer:= bool(DM.ReadDataSet['CNGETFROMBUFFER']);
  DM.ReadDataSet.close;

  // для отладки
  // cnGetFromBuffer := true;
  // для отладки
  LoadFromBuffer := false;

  if cnGetFromBuffer then
   begin
    ResMes:= cn_Common_Messages.cnShowMessageBuffer(cnConsts.cn_Confirmation_Caption[PLanguageIndex],
                 cnConsts.cn_VCBuffer_or_Not[PLanguageIndex], mtConfirmation, [mbYes, mbNo, mbCancel]);
           {так     6}
           {ні      7}
           {відміна 2}
    if ResMes = 2 then exit;

    if ResMes = 6 then
     begin
      AParameter:= TcnSimpleParams.Create;
      AParameter.Owner:=self;
      AParameter.Db_Handle:= DM.DB.Handle;
      AParameter.Formstyle:=fsNormal;
      AParameter.WaitPakageOwner:=self;
      res := RunFunctionFromPackage(AParameter, 'Contracts\cn_dbfBuffer.bpl','ShowDbfBuffer');
      AParameter.Free;
      if VarArrayDimCount(Res)>0
       then
        begin
         LoadFromBuffer := True;

         DM.StProc.StoredProcName := 'CN_GET_NAMES_INFO_BUFFER_BY_IDS';
         DM.StProc.Transaction.StartTransaction;
         DM.StProc.Prepare;
         DM.StProc.ParamByName('ID_FACUL').AsInt64     := Res[11];
         DM.StProc.ParamByName('ID_SPEC').AsInt64      := Res[12];
         DM.StProc.ParamByName('ID_NATIONAL').AsInt64  := Res[13];
         DM.StProc.ParamByName('ID_FORM_STUD').AsInt64 := Res[14];
         DM.StProc.ParamByName('ID_KAT_STUD').AsInt64  := Res[15];
         DM.StProc.ExecProc;

         ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
         {факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.StProc.ParamByName('NAME_FACUL').AsString;
         {специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.StProc.ParamByName('NAME_SPEC').AsString;
         {форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.StProc.ParamByName('NAME_FORM_STUD').AsString;
         {категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.StProc.ParamByName('NAME_KAT_STUD').AsString;
         {национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.StProc.ParamByName('NAME_NAZIONAL').AsString;
         DM.StProc.Transaction.Commit;

         ViewForm.Num_Dog_Edit.Text := vartostr(Res[1]);
         ViewForm.Date_Zakl_DateEdit.Date := VarToDateTime(Res[2]);
         ViewForm.Date_Beg_DateEdit.Date :=  VarToDateTime(Res[3]);
         ViewForm.Date_End_DateEdit.Date :=  VarToDateTime(Res[4]);
         {курс}   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  vartostr(Res[16]);
         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := vartostr(Res[17]);
         {ид_ман} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := Res[0];
         {ид_факультета}   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := Res[11];
         {ид_спец}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := Res[12];
         {ид_формыобуч}    ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := Res[14];
         {ид_категоробуч}  ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := Res[15];
         {ид_национал}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := Res[13];
        end;
     end;
   end;


  // rate_account по-умолчанию
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DEF_ID_INT_ACCOUNT';
  DM.ReadDataSet.Open;
  if DM.ReadDataSet['ID_INT_ACCOUNT']<> null
   then
    begin
     ID_RATE_ACCOUNT_Convert := DM.ReadDataSet['ID_INT_ACCOUNT'];
     DM.ReadDataSet.Close;
     DM.ReadDataSet.SelectSQL.Clear;
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
     DM.ReadDataSet.Open;
     ViewForm.Accounts.Text  := DM.ReadDataSet['RATE_ACCOUNT'];
     ViewForm.ID_INT_Account := ID_RATE_ACCOUNT_Convert;
     //ViewForm.Account_Label.Caption :=DM.ReadDataSet['NAME_MFO'];
     DM.ReadDataSet.Close;
    end
   else DM.ReadDataSet.Close;

  ViewForm.ExtraMode := ExtraMode;
  ViewForm.cnParamsToAddContract := cnParamsToAddContract;

  if ExtraMode then
   begin
    ExtraInfo.ID_DOG := -1;
    ExtraInfo.ID_STUD := -1;
    ExtraInfo.IsModalOk := false;
   end;

  //---проверка прав на редактирование номера договора---
  can_change_num_dog := True;
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/cn_can_edit_num_dog','Belong') <> 0
    then can_change_num_dog := False;

  //установка возможности редактировать номер------------------------------
  // проверяем признак автогенерации
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select CN_IS_GENERATE_NUM_DOG from CN_CHECK_NUMDOG_GENERATION';
  DM.ReadDataSet.Open;
  IsGenerateNumDog := bool(DM.ReadDataSet['CN_IS_GENERATE_NUM_DOG']);
  DM.ReadDataSet.Close;

  If IsGenerateNumDog then
   If can_change_num_dog
    then ViewForm.Num_Dog_Edit.Properties.ReadOnly := False
    else ViewForm.Num_Dog_Edit.Properties.ReadOnly := True;

  // запуск формы-------------------------------------------------------------------------------
  if ViewForm.ShowModal = mrOk
   then
    begin
    // обновляю буфер
    if LoadFromBuffer then
     begin
      DM.StProc.StoredProcName := 'CN_VC_BUFFER_UPDATE_GET_REC';
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID_MEN').AsInt64     := Res[0];
      DM.StProc.ParamByName('NUM_DOG').AsString   := Res[1];
      DM.StProc.ParamByName('DATE_DOG').AsDate    := Res[2];
      DM.StProc.ParamByName('DATE_BEG').AsDate    := Res[3];
      DM.StProc.ParamByName('DATE_END').AsDate    := Res[4];
      DM.StProc.ExecProc;
      DM.StProc.Transaction.Commit;
     end;

     // определяю кол-во обучающихся по контракту
     StudersCounter:=1;
     SetLength(Man_Fio, 1);
     Man_Fio[0].ID_STUD:= -1;
     Man_Fio[0].ID_MAN:=  ViewForm.Grid_fioTableView.DataController.Values[0, 17];
     Man_Fio[0].FIO:=     ViewForm.Grid_fioTableView.DataController.Values[0, 0];
     Man_Fio[0].Entry_Rest:= 0;
     if ViewForm.Grid_fioTableView.DataController.Values[0, 20] <> null
      then Man_Fio[0].ID_MAN_PARENT:=  ViewForm.Grid_fioTableView.DataController.Values[0, 20]
      else Man_Fio[0].ID_MAN_PARENT:= -1;

     for i:=0 to ViewForm.Grid_fioTableView.DataController.RecordCount -1 do
     for j:=0 to Length(Man_Fio)-1 do
      begin
       for w:=0 to Length(Man_Fio)-1 do
        begin
         flag := 0;
         if ViewForm.Grid_fioTableView.DataController.Values[i, 17] = Man_Fio[w].ID_MAN then flag:=1;
        end;

       if flag =1 then Continue;

       StudersCounter:= StudersCounter+1;
       SetLength(Man_Fio, Length(Man_Fio)+1 );
       Man_Fio[Length(Man_Fio)-1].ID_STUD:= -1;
       Man_Fio[Length(Man_Fio)-1].ID_MAN:= ViewForm.Grid_fioTableView.DataController.Values[i, 17];
       Man_Fio[Length(Man_Fio)-1].FIO:= ViewForm.Grid_fioTableView.DataController.Values[i, 0];
       if ViewForm.Grid_fioTableView.DataController.Values[i, 20] <> null
        then Man_Fio[Length(Man_Fio)-1].ID_MAN_PARENT:=  ViewForm.Grid_fioTableView.DataController.Values[i, 20]
        else Man_Fio[Length(Man_Fio)-1].ID_MAN_PARENT:= -1;
       Man_Fio[Length(Man_Fio)-1].Entry_Rest:= 0;
      end;


     with DM.StProc do
      try
       Transaction.StartTransaction;

       //-------{добавление общей информации по договору в таблицу договоров и корень одной процедурой}
       //вызывается 1 раз //

       StoredProcName := 'CN_BARCODE_GENERATION';
       ExecProc;

       BarCode := FldByName['barcode'].AsInt64;

       //----------------------------------------------------------------------
       StoredProcName := 'CN_DT_DOG_INSERT_HS';
       Prepare;
       ParamByName('ID_TYPE_DOG').AsInt64 := ViewForm.ID_TYPE_DOG;
       ParamByName('barcode').AsInt64     := BarCode;
       ParambyName('id_valute').AsInt64   := ViewForm.id_valute;

       if ExtraMode or AccessMode
        Then ParamByName('ID_DOG_STATUS').Asint64  := ViewForm.id_dog_status //project //cnParamsToAddContract.ID_DOG_STATUS
        Else ParamByName('ID_DOG_STATUS').Asint64  := CN_DOG_STATUS_DEYSTV; //действующий

       ParamByName('ID_USER').AsInt64     := ID_User;
       ParamByName('ID_REESTR').AsVariant := null;
       paramByName('ID_TYPE_ACTION').AsInt64:=ViewForm.ID_TYPE_ACTION;

       ParamByName('ID_INT_ACCOUNT').AsInt64 := ViewForm.ID_INT_Account;
       ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
       ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
       ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
       ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
       ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
       ParamByName('ISOSTATOK').AsShort      := 0;
       ExecProc;

       ID_DOG_ROOT := ParamByName('ID_DOG_ROOT').AsInt64;
       ID_DOG      := ParamByName('ID_DOG').AsInt64;

       //-----------------------------------------------------------------------

       // всё в одном цикле по студенту(ам)
       // begin for
       for i := 0 to StudersCounter - 1 do
        begin
         ID_STUD := -1;
         {добавление информации о студенте}
         //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
         // CN_DT_STUD_INSERT (запускаю с параметром ID_DOG_ROOT и возвращаю идентификатор ID_STUD)
         StoredProcName := 'CN_DT_STUD_INSERT';                                                                 {Perchak}
         Prepare;
         ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
         ParamByName('ID_MAN').AsInt64             := Man_Fio[i].ID_MAN;
         ParamByName('SUM_ENTRY_REST').AsVariant   := null;
         if Man_Fio[i].ID_MAN_PARENT <> -1
          then ParamByName('ID_MAN_PARENT').AsInt64      := Man_Fio[i].ID_MAN_PARENT
          else ParamByName('ID_MAN_PARENT').AsVariant    := null;

         ExecProc;

         ID_STUD := ParamByName('ID_STUD').AsInt64;

         // -----------логирование добавления------------------------------------
         Dm.ReadDataSet.Close;
         Dm.ReadDataSet.SelectSQL.Clear;
         Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Add' + '''' + ')';
         Dm.ReadDataSet.Open;
         DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
         DM.StProc.Prepare;
         DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
         DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
         DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
         DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
         DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
         DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
         DM.StProc.ExecProc;
         Dm.ReadDataSet.Close;

         {добавление расширенной полной информации о студенте}
         //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
         // CN_DT_STUD_INF_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STUD)
         for j:=0 to  ViewForm.Grid_fioTableView.DataController.RecordCount-1 do
          if ViewForm.Grid_fioTableView.DataController.values[j, 17] = Man_Fio[i].ID_MAN
           then
            begin
             StoredProcName := 'CN_DT_STUD_INF_INSERT';                                                                    {perchak}
             Prepare;
             ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
             ParamByName('ID_DOG').AsInt64         := ID_DOG;
             ParamByName('ID_STUD').AsInt64        := ID_STUD;
             ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
             ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
             ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
             ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
             ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
             ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
             ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
             ParamByName('DATE_BEG').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 1];
             ParamByName('DATE_END').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 2];
             ExecProc;
            end;

         {добавляю корень }
         //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
         // CN_DT_DOG_ROOT_INSERT_HS (запускаю с параметром ID_DOG_ROOT)
         StoredProcName := 'CN_DT_DOG_ROOT_INSERT_HS';
         Prepare;
         if StudersCounter > 1 then
          begin
           ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
           ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
           ParamByName('ID_STUD').AsInt64        := ID_STUD;
           ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
           ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
           ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
           ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
           ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
           ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
           ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
           ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
           ParamByName('FIO').AsString           := Man_Fio[i].FIO;
           ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
           ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
           ParamByName('ISCOLLECT').AsShort      := 1;
           if ViewForm.Base_Dog_RadioButton.Checked
            then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
            else ParamByName('ISMAINDOG').AsInt64      := 0; //дополнительный договор
           ParamByName('ISDISSDOG').AsShort      := 0; //действующий
           ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
           ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
           ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
           if ExtraMode
            then ParamByName('IS_REAL_DOG').AsInteger  := 0
            else ParamByName('IS_REAL_DOG').AsInteger  := 1;
          end
          else
           begin
            ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
            ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
            ParamByName('ID_STUD').AsInt64        := ID_STUD;
            ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
            ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
            ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
            ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
            ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
            ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
            ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
            ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
            ParamByName('FIO').AsString           := Man_Fio[i].FIO;
            ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
            ParamByName('SUMMA').AsCurrency       := StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
            ParamByName('ISCOLLECT').AsShort      := 0;
            if ViewForm.Base_Dog_RadioButton.Checked
             then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
             else ParamByName('ISMAINDOG').AsInt64      := 0; //дополнительный договор
            ParamByName('ISDISSDOG').AsShort      := 0; //
            ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
            ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
            ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
            if ExtraMode
             then ParamByName('IS_REAL_DOG').AsInteger  := 0
             else ParamByName('IS_REAL_DOG').AsInteger  := 1;
           end;
         ParamByName('barcode').AsInt64        := BarCode;
         ExecProc;

         //-------
         {добавление информации о периодах оплаты внутри цикла по студенту}
         //кол-во вызовов зависит от кол-ва периодов оплаты по внесенному договору //
         // CN_DT_STAGE_OPL_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STAGE_OPL(не использую))
         for k := 0 to ViewForm.Grid_payTableView.DataController.RecordCount - 1 do
          begin
           {если значение id_man по студенту совпадает со значением id_man_stage_opl}
           if Man_Fio[i].ID_MAN = ViewForm.Grid_payTableView.DataController.values[k, 5]
            then
             begin
              StoredProcName := 'CN_DT_STAGE_OPL_INSERT';
              Prepare;
              ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
              ParamByName('ID_DOG').AsInt64         := ID_DOG;
              ParamByName('ID_STUD').AsInt64        := ID_STUD;
              ParamByName('ID_PAYER').AsInt64       := ViewForm.Grid_payTableView.DataController.values[k, 4];
              ParamByName('NUM_YEAR').AsString      := ViewForm.Grid_payTableView.DataController.values[k, 6];
              ParamByName('DATE_BEG').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 0]);
              ParamByName('DATE_END').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 1]);
              ParamByName('DATE_PAY').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 2]);
              ParamByName('SUMMA').AsCurrency       := ViewForm.Grid_payTableView.DataController.values[k, 3];
              ExecProc;
             end;
          end;

         //-------
         {добавление информации о сметах}
         //кол-во вызовов зависит от кол-ва периодов разбивки //
         // CN_DT_DOG_SMET_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_DOG_SMET)
         for k := 0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1 do
          begin
           {если значение id_man по студенту совпадает со значением id_man_istochniki}
           if Man_Fio[i].ID_MAN = ViewForm.Grid_istochnikiTableView.DataController.values[k, 9]
            then
             begin
              StoredProcName := 'CN_DT_DOG_SMET_INSERT';
              Prepare;
              ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
              ParamByName('ID_DOG').AsInt64         := ID_DOG;
              ParamByName('ID_STUD').AsInt64        := ID_STUD;
              ParamByName('ID_SMET').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 5];
              ParamByName('ID_RAZD').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 6];
              ParamByName('ID_STAT').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 7];
              ParamByName('ID_KEKV').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 8];
              ParamByName('PERSENT').AsCurrency     :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 4];
              ExecProc;
             end;
          end;

        end;
       // end for по студенту в целом

       //-------
       for i := 0 to ViewForm.Grid_payersTableView.DataController.RecordCount - 1 do
        begin
          {добавление информации о плательщике}
          //кол-во вызовов зависит от кол-ва плательщиков по внесенному договору //
          // CN_DT_PAYER_STAGE_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG и возвращаю идентификатор ID_PAYER_STAGE)
         StoredProcName := 'CN_DT_PAYER_STAGE_INSERT';
         Prepare;
         ParamByName('ID_DOG_ROOT').AsInt64      := ID_DOG_ROOT;
         ParamByName('ID_DOG').AsInt64           := ID_DOG;
         ParamByName('ID_PAYER').AsInt64         := ViewForm.Grid_payersTableView.DataController.values[i, 6];

         // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
         ParamByName('ID_TYPE_PAYER').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 3];

         ParamByName('ID_RATE_ACCOUNT').AsInt64  :=  ViewForm.Grid_payersTableView.DataController.values[i, 7];
         ParamByName('ID_TYPE_STAGE').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 4];

         if ViewForm.Grid_payersTableView.DataController.values[i, 10] <> null
          then ParamByName('ID_CUST_MEN').AsInt64    := ViewForm.Grid_payersTableView.DataController.values[i, 10]
          else ParamByName('ID_CUST_MEN').AsVariant  := null;

         if ViewForm.Grid_payersTableView.DataController.values[i, 5] = 1
          then
           begin
            ParamByName('PERSENT').AsCurrency       := ViewForm.Grid_payersTableView.DataController.values[i, 2];
            ParamByName('SUMMA').AsCurrency         := 0;
           end
         else
          begin
           ParamByName('SUMMA').AsCurrency         := ViewForm.Grid_payersTableView.DataController.values[i, 2];
           ParamByName('PERSENT').AsCurrency       := 0;
          end;
         ExecProc;
        end;
       Transaction.Commit;


       if ExtraMode then
        begin
         ExtraInfo.ID_DOG := ID_DOG;
         ExtraInfo.ID_STUD := ID_STUD;
         ExtraInfo.IsModalOk := true;
         DM.DataSet.AfterScroll := nil;
         DM.DataSet.SelectSQL.Clear;
         DM.DataSet.SelectSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT)+')';
         DM.DataSet.Open;

         CaptionsClear();
         if DM.DataSet['NAME_FACUL'] <> null
          then Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
         if DM.DataSet['NAME_SPEC']<> null
          then Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
         if DM.DataSet['NAME_GROUP']<> null
          then Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
         if DM.DataSet['KURS']<> null
          then Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
         if DM.DataSet['NAME_KAT_STUD']<> null
          then CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
         if DM.DataSet['NAME_FORM_STUD']<> null
          then FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
         if DM.DataSet['NAME_NAZIONAL']<> null
          then Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
         If DM.DataSet['NAME_DOG_STATUS']<> null
          Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
          Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';

         DM.DataSet.AfterScroll := DataSetAfterOpen;
        end;

       if not ExtraMode then
        begin
         // если контракт не коллективный, тогда обновляем датасет
         if StudersCounter = 1
          then
           begin
            DM.DataSet.AfterScroll := nil;
            cxDbTreeList1.DataController.DataSource := nil;

            DM.DataSet.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
            DM.DataSet.SQLs.RefreshSQL.Text := 'Select * from CN_DT_DOG_ROOT_SELECT_BY_ID_HS('+IntToStr(ID_DOG_ROOT)+')';
            DM.DataSet.Insert;
            DM.DataSet.Post;

            cxDbTreeList1.DataController.DataSource := DM.DataSource;
           end
          else // иначе перезабираем датасет
           begin
            wf:=ShowWaitForm(self,wfLoadPackage);
            DM.DataSet.AfterScroll := nil;
            DM.DataSet.Close;
            DM.DataSet.SelectSQL.Clear;
            DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                              ''''+ ViewForm.Num_Dog_Edit.Text+ ''''+ ',2';
            // права на сметы
            DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
            inttostr(Cn_View) + ',' + inttostr(ID_ROLE)+ ',' + ''''+ TYPE_REESTR + ''''+ ')';
            DM.DataSet.Open;
            CloseWaitForm(wf);
           end;

          ViewForm.Free;

         CaptionsClear();
         if DM.DataSet['NAME_FACUL'] <> null
          then Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
         if DM.DataSet['NAME_SPEC']<> null
          then Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
         if DM.DataSet['NAME_GROUP']<> null
          then Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
         if DM.DataSet['KURS']<> null
          then Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
         if DM.DataSet['NAME_KAT_STUD']<> null
          then CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
         if DM.DataSet['NAME_FORM_STUD']<> null
          then FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
         if DM.DataSet['NAME_NAZIONAL']<> null
          then Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
         If DM.DataSet['NAME_DOG_STATUS']<> null
          Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
          Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';

         DM.DataSet.AfterScroll := DataSetAfterOpen;
        end;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          raise;
         end;
      end;
     if ExtraMode then ExitButton.Visible := ivNever;
    end
   else
    if ExtraMode
     then SelectBtn.Visible := ivNever;
end;

procedure TfrmContracts.EditButtonClick(Sender: TObject);
var
ViewForm:Tfrm_Contracts_AE;
i, j, k, w, flag: integer;
 ID_DOG_ROOT : int64;
 ID_DOG      : int64;
 ID_STUD     : int64;

 ID_DOG_Convert : int64;
 ID_DOG_ROOT_Convert : int64;
 ID_RATE_ACCOUNT_Convert : int64;

 StudersCounter: byte;
 Man_Fio:array of TStudBasicInfo;

 year,month,day:Word;
 Date_beg_price, Date_End_price: TDate;
 EnableEditTipDog: boolean;
begin
   If not Is_Admin then
    //If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Edit') <> 0
    If ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0) or
        (fibCheckPermission('/ROOT/Contracts/Cn_Reg','Edit') <> 0))
    then
     if ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Edit') <> 0) or
         ((cxDBTreeList1.FocusedNode.Values[9] <> 2)and
         (cxDBTreeList1.FocusedNode.Values[9] <> 3))
        )
      then
       if ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Work') <> 0) and
           (ID_User <> DM.DataSet['ID_USER_ADD']))
        then
         Begin
          messagebox(handle,
          pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
          +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
          pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
          exit;
         End;

  if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  if not EditButton.VisibleForUser then exit;

  with DM.SetupDataSet do
  begin
    Close;
    SelectSQL.Clear;
    SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
    Open;
  end;

  if DM.SetupDataSet.FieldByName('CN_ENABLE_EDIT_TIP_DOG').AsInteger = 1 then EnableEditTipDog:=True
  else EnableEditTipDog:=false;

  if DM.DataSet['ISCOLLECT'] = 1 then   wf:=ShowWaitForm(self,wfLoadPackage);

  ViewForm:= Tfrm_Contracts_AE.create(frmContracts, PLanguageIndex, DM.DB.Handle, DM.Dataset['ISCOLLECT'],is_admin );
  ViewForm.Caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  ViewForm.TypeDogEdit.Enabled:=EnableEditTipDog;

  ViewForm.ID_DOG_ROOT                  := DM.DataSet['ID_DOG_ROOT'];
  ViewForm.ID_DOG                       := DM.DataSet['ID_DOG_LAST'];
  ViewForm.id_dog_status                := DM.DataSet['Id_dog_status'];
  If DM.DataSet['BARCODE'] <> null
   then
    Begin
     BarCode := DM.DataSet['BARCODE'];
     ViewForm.BarCode_Edit.EditValue := BarCode;
     If BarCode = -1 then ViewForm.BarCode_Edit.Text := '';
    End
   else
    Begin
     BarCode := -1;
     ViewForm.BarCode_Edit.Text := '';
    End;

  ViewForm.ID_VALUTE := -1;
  ViewForm.ButtonEdit_valute.Text := '';
  if DM.Dataset['id_valute'] <> null then
   Begin
    ViewForm.ID_VALUTE := DM.Dataset['id_valute'];
    ViewForm.ButtonEdit_valute.Text := DM.Dataset['NAME_VALUTE'];
   end;

  ViewForm.ID_STUD_in                   := DM.DataSet['ID_STUD'];
  ViewForm.Num_Dog_Edit.Text            :=  DM.Dataset['NUM_DOG'];
  ViewForm.Date_Zakl_DateEdit.Date      :=  strtodate(DM.Dataset['DATE_DOG']);
  if DM.Dataset['DATE_BEG'] <> null
   then ViewForm.Date_Beg_DateEdit.Date :=  strtodate(DM.Dataset['DATE_BEG']);
  if DM.Dataset['DATE_END'] <> null
   then ViewForm.Date_End_DateEdit.Date :=  strtodate(DM.Dataset['DATE_END']);
  if DM.DataSet['ID_TYPE_ACTION'] <> null
   then ViewForm.ID_TYPE_ACTION         :=DM.DataSet['ID_TYPE_ACTION'];

  if DM.Dataset['ISMAINDOG'] = 1
   then ViewForm.Base_Dog_RadioButton.Checked  := true
   else ViewForm.Addit_Dog_RadioButton.Checked :=  true;


 ViewForm.ID_TYPE_DOG := DM.Dataset['ID_TYPE_DOG'];

 DM.ReadDataSet.Close;
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEDOG_PARAMS_BY_ID(' + IntToStr(DM.Dataset['ID_TYPE_DOG']) + ')';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['CODENAME'] <> null then
   ViewForm.TypeDogEdit.Text := DM.ReadDataSet['CODENAME'];
 //if DM.ReadDataSet['NAME'] <> null then
 //  ViewForm.NameTypeDogLabel.Caption := DM.ReadDataSet['NAME'];
 DM.ReadDataSet.Close;



// работает DM.ReadDataSet - забиваем гриды информацией
// информация по студенту
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_ALL_STUDINFO_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PEOPLE'];
{ид_ман}
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := DM.ReadDataSet['ID_MAN'];
   if DM.ReadDataSet['ID_MAN_PARENT'] <> null then
    begin
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 20] := DM.ReadDataSet['ID_MAN_PARENT'];
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 21]  := DM.ReadDataSet['FIO_PORUCHITEL'];
    end;
{дата_начала}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 1] :=  DM.ReadDataSet['DATE_BEG'];
{дата_конца}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 2] :=  DM.ReadDataSet['DATE_END'];
{факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.ReadDataSet['NAME_FACUL'];
{специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.ReadDataSet['NAME_SPEC'];
{группа}             ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 5] :=  DM.ReadDataSet['NAME_GROUP'];
{форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.ReadDataSet['NAME_FORM_STUD'];
{категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.ReadDataSet['NAME_KAT_STUD'];
{национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.ReadDataSet['NAME_NAZIONAL'];
{курс}               ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  DM.ReadDataSet['KURS'];
{сумма}              ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 10] := DM.ReadDataSet['SUMMA_INF'];

{ид_факультета}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := DM.ReadDataSet['ID_FACUL'];
{ид_спец}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := DM.ReadDataSet['ID_SPEC'];
{ид_группы}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 13] := DM.ReadDataSet['ID_GROUP'];
{ид_формыобуч}       ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := DM.ReadDataSet['ID_FORM_STUD'];
{ид_категоробуч}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := DM.ReadDataSet['ID_KAT_STUD'];
{ид_национал}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := DM.ReadDataSet['ID_NATIONAL'];
{ид_студ}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 18] := DM.ReadDataSet['ID_STUD'];
{SUM_ENTRY_REST}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 19] := DM.ReadDataSet['SUM_ENTRY_REST'];
  DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

    //------------------------------------------------------------------------------
    DM.ReadDataSet.close;
    DM.ReadDataSet.SQLs.SelectSQL.Clear;
    DM.ReadDataSet.SQLs.SelectSQL.Add('SELECT * FROM CN_GET_SUMM_FROM_STAGE_OPL(:id_dog,:id_dog_root)');
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64:= ID_DOG_Convert;
    DM.ReadDataSet.ParamByName('ID_DOG_ROOT').AsInt64:=ID_DOG_ROOT_Convert;
    DM.readDataSet.open;

    If DM.ReadDataSet['Summ1'] <> null then ViewForm.Summ1:=DM.ReadDataSet['summ1'] else ViewForm.summ1:=0;
    If DM.ReadDataSet['Summ2'] <> null then ViewForm.Summ2:=DM.ReadDataSet['summ2'] else ViewForm.summ2:=0;
    If DM.ReadDataSet['Summ3'] <> null then ViewForm.Summ3:=DM.ReadDataSet['summ3'] else ViewForm.summ3:=0;
    If DM.ReadDataSet['Summ4'] <> null then ViewForm.Summ4:=DM.ReadDataSet['summ4'] else ViewForm.summ4:=0;
    If DM.ReadDataSet['Summ5'] <> null then ViewForm.Summ5:=DM.ReadDataSet['summ5'] else ViewForm.summ5:=0;
    If DM.ReadDataSet['Summ6'] <> null then ViewForm.Summ6:=DM.ReadDataSet['summ6'] else ViewForm.summ6:=0;
    If DM.ReadDataSet['Summ7'] <> null then ViewForm.Summ7:=DM.ReadDataSet['summ7'] else ViewForm.summ7:=0;
    If DM.ReadDataSet['Summ8'] <> null then ViewForm.Summ8:=DM.ReadDataSet['summ8'] else ViewForm.summ8:=0;

    If DM.ReadDataSet['term1'] <> null then ViewForm.term_stud1:=DM.ReadDataSet['term1'] else ViewForm.term_stud1:=0;
    If DM.ReadDataSet['term2'] <> null then ViewForm.term_stud2:=DM.ReadDataSet['term2'] else ViewForm.term_stud2:=0;
    If DM.ReadDataSet['term3'] <> null then ViewForm.term_stud3:=DM.ReadDataSet['term3'] else ViewForm.term_stud3:=0;
    If DM.ReadDataSet['term4'] <> null then ViewForm.term_stud4:=DM.ReadDataSet['term4'] else ViewForm.term_stud4:=0;
    If DM.ReadDataSet['term5'] <> null then ViewForm.term_stud5:=DM.ReadDataSet['term5'] else ViewForm.term_stud5:=0;
    If DM.ReadDataSet['term6'] <> null then ViewForm.term_stud6:=DM.ReadDataSet['term6'] else ViewForm.term_stud6:=0;
    If DM.ReadDataSet['term7'] <> null then ViewForm.term_stud7:=DM.ReadDataSet['term7'] else ViewForm.term_stud7:=0;
    If DM.ReadDataSet['term8'] <> null then ViewForm.term_stud8:=DM.ReadDataSet['term8'] else ViewForm.term_stud8:=0;

    If DM.ReadDataSet['Date_beg1'] <> null then  ViewForm.Date_beg_stud1 := DM.ReadDataSet['Date_beg1'];
    If DM.ReadDataSet['Date_end1'] <> null then  ViewForm.Date_end_stud1 := DM.ReadDataSet['Date_end1'];
    If DM.ReadDataSet['Date_beg2'] <> null then  ViewForm.Date_beg_stud2 := DM.ReadDataSet['Date_beg2'];
    If DM.ReadDataSet['Date_end2'] <> null then  ViewForm.Date_end_stud2 := DM.ReadDataSet['Date_end2'];
    If DM.ReadDataSet['Date_beg3'] <> null then  ViewForm.Date_beg_stud3 := DM.ReadDataSet['Date_beg3'];
    If DM.ReadDataSet['Date_end3'] <> null then  ViewForm.Date_end_stud3 := DM.ReadDataSet['Date_end3'];
    If DM.ReadDataSet['Date_beg4'] <> null then  ViewForm.Date_beg_stud4 := DM.ReadDataSet['Date_beg4'];
    If DM.ReadDataSet['Date_end4'] <> null then  ViewForm.Date_end_stud4 := DM.ReadDataSet['Date_end4'];
    If DM.ReadDataSet['Date_beg5'] <> null then  ViewForm.Date_beg_stud5 := DM.ReadDataSet['Date_beg5'];
    If DM.ReadDataSet['Date_end5'] <> null then  ViewForm.Date_end_stud5 := DM.ReadDataSet['Date_end5'];

    DM.readDataSet.Close;
//   End;

 // rate_account
 if DM.DataSet['ID_INT_ACCOUNT']<> null then
 begin
  DM.ReadDataSet.SelectSQL.Clear;
  ID_RATE_ACCOUNT_Convert := DM.DataSet['ID_INT_ACCOUNT'];
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
  DM.ReadDataSet.Open;
  ViewForm.Accounts.Text  := DM.ReadDataSet['RATE_ACCOUNT'];
  ViewForm.ID_INT_Account := DM.DataSet['ID_INT_ACCOUNT'];
  //ViewForm.Account_Label.Caption :=DM.ReadDataSet['NAME_MFO'];
  DM.ReadDataSet.Close;
 end;

 // информация по плательщикам
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payersTableView.DataController.RecordCount := ViewForm.Grid_payersTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
   if DM.ReadDataSet['ISPERCENT'] =1 then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
   else
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
   if DM.ReadDataSet['ID_PAYER'] <> null then
    ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
   if DM.ReadDataSet['ID_CUST_MEN']<> null then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 10]  := DM.ReadDataSet['ID_CUST_MEN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по сметам
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_SMET_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
   if DM.ReadDataSet['KOD_SM'] <> null then
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['KOD_SM'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['KOD_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['KOD_ST'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['KOD_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['PERSENT'];
   if DM.ReadDataSet['ID_SMET'] <> null then
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_SMET'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_STAT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['ID_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['ID_MAN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по периодам оплат
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ') order by DATE_BEG';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['DATE_BEG'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['DATE_END'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['DATE_PAY'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_MAN'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['NUM_YEAR'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 if DM.DataSet['ISCOLLECT'] = 1 then CloseWaitForm(wf);

  can_change_num_dog := True;
  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/cn_can_edit_num_dog', 'Belong') <> 0
    then can_change_num_dog := False;

  If can_change_num_dog
   then ViewForm.Num_Dog_Edit.Properties.ReadOnly := False
   else ViewForm.Num_Dog_Edit.Properties.ReadOnly := True;


 // --------------ЗАПУСК ФОРМЫ---------------
 if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
       try
       // удаляем все записи по договору и связанным таблицам путем закрытия use_enda
        Transaction.StartTransaction; // старт общей транзакции


        ID_DOG_ROOT :=  DM.DataSet['ID_DOG_ROOT'];
        ID_DOG      :=  DM.DataSet['ID_DOG_LAST'];
        StoredProcName := 'CN_DT_DOG_ROOT_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ExecProc;

        StoredProcName := 'CN_DT_DOG_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64         := ID_DOG;
        ExecProc;
        {perchak}
        StoredProcName := 'CN_DT_STUD_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ExecProc;

        StoredProcName := 'CN_DT_STUD_INF_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64         := ID_DOG;
        ExecProc;

        StoredProcName := 'CN_DT_PAYER_STAGE_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64         := ID_DOG;
        ExecProc;

        StoredProcName := 'CN_DT_DOG_SMET_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64         := ID_DOG;
        ExecProc;

        StoredProcName := 'CN_DT_STAGE_OPL_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64         := ID_DOG;
        ExecProc;


        // определяю кол-во обучающихся по контракту
        StudersCounter:=1;
        SetLength(Man_Fio, 1);
         if ViewForm.Grid_fioTableView.DataController.Values[0, 18] <> null then
        Man_Fio[0].ID_STUD:= ViewForm.Grid_fioTableView.DataController.Values[0, 18]
         else
        Man_Fio[0].ID_STUD:= -999;
        Man_Fio[0].ID_MAN:=  ViewForm.Grid_fioTableView.DataController.Values[0, 17];
        Man_Fio[0].FIO:=     ViewForm.Grid_fioTableView.DataController.Values[0, 0];
           if ViewForm.Grid_fioTableView.DataController.Values[0, 20] <> null then
            Man_Fio[0].ID_MAN_PARENT:=  ViewForm.Grid_fioTableView.DataController.Values[0, 20]
           else
            Man_Fio[0].ID_MAN_PARENT:= -1;

        if ViewForm.Grid_fioTableView.DataController.Values[0, 19] <> null then
           Man_Fio[0].Entry_Rest:= ViewForm.Grid_fioTableView.DataController.Values[0, 19]
        else
           Man_Fio[0].Entry_Rest:= 0;


        for i:=0 to ViewForm.Grid_fioTableView.DataController.RecordCount -1 do
        for j:=0 to Length(Man_Fio)-1 do
         begin
              for w:=0 to Length(Man_Fio)-1 do
                begin
                 flag := 0;
                 if ViewForm.Grid_fioTableView.DataController.Values[i, 17] = Man_Fio[w].ID_MAN then flag:=1;
                end;
               if flag =1 then Continue;
//         if ViewForm.Grid_fioTableView.DataController.Values[i, 17] <> Man_Fio[j].ID_MAN then
//          begin
           StudersCounter:= StudersCounter+1;
           SetLength(Man_Fio, Length(Man_Fio)+1 );
            if ViewForm.Grid_fioTableView.DataController.Values[i, 18] <> null then
           Man_Fio[Length(Man_Fio)-1].ID_STUD:= ViewForm.Grid_fioTableView.DataController.Values[i, 18]
            else
           Man_Fio[Length(Man_Fio)-1].ID_STUD:= -999;
           Man_Fio[Length(Man_Fio)-1].ID_MAN:= ViewForm.Grid_fioTableView.DataController.Values[i, 17];
           if ViewForm.Grid_fioTableView.DataController.Values[i, 20] <> null then
            Man_Fio[Length(Man_Fio)-1].ID_MAN_PARENT:=  ViewForm.Grid_fioTableView.DataController.Values[i, 20]
           else
            Man_Fio[Length(Man_Fio)-1].ID_MAN_PARENT:= -1;
           Man_Fio[Length(Man_Fio)-1].FIO:= ViewForm.Grid_fioTableView.DataController.Values[i, 0];
           if ViewForm.Grid_fioTableView.DataController.Values[i, 19] <> null then
            Man_Fio[Length(Man_Fio)-1].Entry_Rest:= ViewForm.Grid_fioTableView.DataController.Values[i, 19]
           else Man_Fio[Length(Man_Fio)-1].Entry_Rest:= 0;
          end;

        //-------
      {добавление общей информации по договору в таблицу договоров и корень одной процедурой}
      //вызывается 1 раз //
      // CN_DT_DOG_UPDATE
        StoredProcName := 'CN_DT_DOG_UPDATE_HS';
        Prepare;
        ParamByName('BarCode').AsInt64       := BarCode;
        ParamByName('id_valute').AsInt64     := ViewForm.ID_VALUTE;
        ParamByName('ID_DOG_ROOT').AsInt64   := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64        := ID_DOG;
        ParamByName('ID_TYPE_DOG').AsInt64   := ViewForm.ID_TYPE_DOG;
        if DM.DataSet['DATE_DISS']<> null
         then ParamByName('ID_DOG_STATUS').Asint64  := CN_DOG_STATUS_RASTORG
         else ParamByName('ID_DOG_STATUS').Asint64  := ViewForm.id_dog_status;
         {if ExtraMode or AccessMode
               Then ParamByName('ID_DOG_STATUS').Asint64  := ViewForm.id_dog_status //project //cnParamsToAddContract.ID_DOG_STATUS
               Else ParamByName('ID_DOG_STATUS').Asint64  := CN_DOG_STATUS_DEYSTV;
               }
        ParamByName('ID_USER').asint64   := ID_User;
        ParamByName('ID_REESTR').AsVariant := DM.DataSet['ID_REESTR'];
        ParamByName('ID_TYPE_ACTION').AsInt64:= ViewForm.ID_TYPE_ACTION;

        ParamByName('ID_INT_ACCOUNT').AsInt64 := ViewForm.ID_INT_Account;
        ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
        ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
        ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
        ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
        if DM.DataSet['DATE_DISS']<> null then
        ParamByName('DATE_DISS').AsDate       := DM.DataSet['DATE_DISS'];
        ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
        ParamByName('ISOSTATOK').AsShort      := 0;
        ExecProc;

        //----------------------------------------------------------------------

        // всё в одном цикле по студенту(ам)
        // begin for
          for i := 0 to StudersCounter - 1 do begin
           ID_STUD := -1;
      {добавление информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_UPDATE (запускаю с параметром ID_STUD, ID_DOG_ROOT )
         if Man_Fio[i].ID_STUD <> -999 then
          begin
            StoredProcName := 'CN_DT_STUD_UPDATE';                                                              {perchak}
            Prepare;
            ParamByName('ID_STUD').AsInt64            := Man_Fio[i].ID_STUD;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := Man_Fio[i].ID_MAN;
            ParamByName('SUM_ENTRY_REST').AsVariant   := Man_Fio[i].Entry_Rest;
            if Man_Fio[i].ID_MAN_PARENT <> -1 then
             ParamByName('ID_MAN_PARENT').AsInt64      := Man_Fio[i].ID_MAN_PARENT
            else
             ParamByName('ID_MAN_PARENT').AsVariant      := null;
            ExecProc;
           ID_STUD :=  Man_Fio[i].ID_STUD;
          end
          else
          begin
          // CN_DT_STUD_INSERT (запускаю с параметром ID_DOG_ROOT и возвращаю идентификатор ID_STUD)
            StoredProcName := 'CN_DT_STUD_INSERT';                                                                  {perchak}
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := Man_Fio[i].ID_MAN;
            ParamByName('SUM_ENTRY_REST').AsVariant   := null;
            if Man_Fio[i].ID_MAN_PARENT <> -1 then
             ParamByName('ID_MAN_PARENT').AsInt64      := Man_Fio[i].ID_MAN_PARENT
            else
             ParamByName('ID_MAN_PARENT').AsVariant      := null;

            ExecProc;
           ID_STUD := ParamByName('ID_STUD').AsInt64;
          end;

           // -----------логирование добавления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Edit' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;

         {добавляю корень }
        //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
        // CN_DT_DOG_ROOT_INSERT_HS (запускаю с параметром ID_DOG_ROOT)
              StoredProcName := 'CN_DT_DOG_ROOT_INSERT_HS';
              Prepare;
              if StudersCounter > 1 then
                begin
                 ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                 ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
                 ParamByName('ID_STUD').AsInt64        := ID_STUD;
                 ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
                 ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
                 ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
                 ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
                 ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
                 ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
                 ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
                 ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
                 ParamByName('FIO').AsString           := Man_Fio[i].FIO;
                 ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
                 ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
                 ParamByName('ISCOLLECT').AsShort      := 1;
                 if ViewForm.Base_Dog_RadioButton.Checked
                  then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
                  else ParamByName('ISMAINDOG').AsInt64      := 0; //дополнительный договор
                 ParamByName('ISDISSDOG').AsShort      := DM.DataSet['ISDISSDOG'];
                 ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
                 ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
                 ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
                 if DM.DataSet['DATE_DISS'] <> null then
                 ParamByName('DATE_DISS').AsDate        := DM.DataSet['DATE_DISS'];
                if ExtraMode then
                 ParamByName('IS_REAL_DOG').AsInteger  := 0
                else
                 ParamByName('IS_REAL_DOG').AsInteger  := 1;
                end
               else
                begin
                 ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                 ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
                 ParamByName('ID_STUD').AsInt64        := ID_STUD;
                 ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
                 ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
                 ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
                 ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
                 ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
                 ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
                 ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
                 ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
                 ParamByName('FIO').AsString           := Man_Fio[i].FIO;
                 ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
                 ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
                 ParamByName('ISCOLLECT').AsShort      := 0;
                 if ViewForm.Base_Dog_RadioButton.Checked
                  then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
                  else ParamByName('ISMAINDOG').AsInt64      := 0; //дополнительный договор
                 ParamByName('ISDISSDOG').AsShort      := DM.DataSet['ISDISSDOG'];
                 ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
                 ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
                 ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
                 if DM.DataSet['DATE_DISS'] <> null then
                 ParamByName('DATE_DISS').AsDate        := DM.DataSet['DATE_DISS'];
                if ExtraMode then
                 ParamByName('IS_REAL_DOG').AsInteger  := 0
                else
                 ParamByName('IS_REAL_DOG').AsInteger  := 1;
                end;
               ParamByName('BarCode').AsInt64 := BarCode; 
               ExecProc;

       //-------
                  {добавление информации о периодах оплаты внутри цикла по студенту}
                  //кол-во вызовов зависит от кол-ва периодов оплаты по внесенному договору //
                  // CN_DT_STAGE_OPL_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STAGE_OPL(не использую))
               for k := 0 to ViewForm.Grid_payTableView.DataController.RecordCount - 1 do begin
                if Man_Fio[i].ID_MAN = ViewForm.Grid_payTableView.DataController.values[k, 5]
                {если значение id_man по студенту совпадает со значением id_man_stage_opl}
                  then begin
                    StoredProcName := 'CN_DT_STAGE_OPL_INSERT';
                    Prepare;
                    ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                    ParamByName('ID_DOG').AsInt64         := ID_DOG;
                    ParamByName('ID_STUD').AsInt64        := ID_STUD;
                    ParamByName('ID_PAYER').AsInt64       := ViewForm.Grid_payTableView.DataController.values[k, 4];
                    ParamByName('NUM_YEAR').AsString      := ViewForm.Grid_payTableView.DataController.values[k, 6];
                    ParamByName('DATE_BEG').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 0]);
                    ParamByName('DATE_END').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 1]);
                    ParamByName('DATE_PAY').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 2]);
                    ParamByName('SUMMA').AsCurrency       := ViewForm.Grid_payTableView.DataController.values[k, 3];
                    ExecProc;
                 end;
                 // enf if
               end;

                //-------
                      {добавление информации о сметах}
                      //кол-во вызовов зависит от кол-ва периодов разбивки //
                      // CN_DT_DOG_SMET_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_DOG_SMET)
                       for k := 0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1 do begin
                        if Man_Fio[i].ID_MAN = ViewForm.Grid_istochnikiTableView.DataController.values[k, 9]
                         {если значение id_man по студенту совпадает со значением id_man_istochniki}
                        then begin
                        StoredProcName := 'CN_DT_DOG_SMET_INSERT';
                        Prepare;
                        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                        ParamByName('ID_DOG').AsInt64         := ID_DOG;
                        ParamByName('ID_STUD').AsInt64        := ID_STUD;
                        ParamByName('ID_SMET').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 5];
                        ParamByName('ID_RAZD').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 6];
                        ParamByName('ID_STAT').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 7];
                        ParamByName('ID_KEKV').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 8];
                        ParamByName('PERSENT').AsCurrency     :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 4];
                        ExecProc;
                         end;
                         // enf if
                       end;
                       // end for

          end;
           // end for по студенту в целом

//-------
       for i := 0 to ViewForm.Grid_payersTableView.DataController.RecordCount - 1 do begin
      {добавление информации о плательщике}
      //кол-во вызовов зависит от кол-ва плательщиков по внесенному договору //
      // CN_DT_PAYER_STAGE_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG и возвращаю идентификатор ID_PAYER_STAGE)
            StoredProcName := 'CN_DT_PAYER_STAGE_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64      := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64           := ID_DOG;
            ParamByName('ID_PAYER').AsInt64         := ViewForm.Grid_payersTableView.DataController.values[i, 6];

              // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
            ParamByName('ID_TYPE_PAYER').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 3];

            ParamByName('ID_RATE_ACCOUNT').AsInt64  :=  ViewForm.Grid_payersTableView.DataController.values[i, 7];
            ParamByName('ID_TYPE_STAGE').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 4];

             if ViewForm.Grid_payersTableView.DataController.values[i, 10] <> null
             then
               ParamByName('ID_CUST_MEN').AsInt64    := ViewForm.Grid_payersTableView.DataController.values[i, 10]
             else
               ParamByName('ID_CUST_MEN').AsVariant  := null;


             if ViewForm.Grid_payersTableView.DataController.values[i, 5] = 1
               then
                 begin
                  ParamByName('PERSENT').AsCurrency       := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('SUMMA').AsCurrency         := 0;
                 end
               else
                 begin
                  ParamByName('SUMMA').AsCurrency         := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('PERSENT').AsCurrency       := 0;
                 end;
            ExecProc;
       end;
       // end for

       {добавление расширенной полной информации о студенте}
           //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
           // CN_DT_STUD_INF_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, Man_Fio[i].ID_STUD)
           for j:=0 to  ViewForm.Grid_fioTableView.DataController.RecordCount-1 do
            if ViewForm.Grid_fioTableView.DataController.values[j, 17] = Man_Fio[0].ID_MAN then
             begin
              StoredProcName := 'CN_DT_STUD_INF_INSERT';
              Prepare;
              ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
              ParamByName('ID_DOG').AsInt64         := ID_DOG;
              ParamByName('ID_STUD').AsInt64        := ID_STUD;
              ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[j, 11];
              ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[j, 12];
              ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[j, 16];
              ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[j, 14];
              ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[j, 15];
              ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[j, 13];
              ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[j, 9];
              ParamByName('DATE_BEG').AsDate        := ViewForm.Grid_fioTableView.DataController.values[j, 1];
              ParamByName('DATE_END').AsDate        := ViewForm.Grid_fioTableView.DataController.values[j, 2];
              ExecProc;
             end;

           if ViewForm.cn_StudInfo then begin
           // -----------логирование работы с информацией о студенте------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_StudInfo' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
           end;

           if ViewForm.cn_Payers then begin
           // -----------логирование работы с информацией о плательщике------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Payers' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
           end;

           if ViewForm.cn_StageOpl then begin
           // -----------логирование работы с информацией о периодах оплат------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_StageOpl' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
           end;

           if ViewForm.cn_Finace then begin
           // -----------логирование работы с информацией об источниках финансирования------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Finace' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
           end;

        Transaction.Commit;     // коммит общей транзакции

   // если контракт не коллективный, тогда обновляем датасет
       if StudersCounter = 1 then
        begin
          DM.DataSet.AfterScroll := nil;
          DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
          DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT)+')';
          DM.DataSet.Edit;
          DM.DataSet.Post;
        end
       else
   // иначе перезабираем датасет
       begin
          wf:=ShowWaitForm(self,wfLoadPackage);
          DM.DataSet.AfterScroll := nil;
          DM.DataSet.Close;
          DM.DataSet.SelectSQL.Clear;
          DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                             ''''+ ViewForm.Num_Dog_Edit.Text+ ''''+ ',2';


          // права на сметы
          DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
          inttostr(Cn_view) + ',' + inttostr(ID_ROLE) + ',' + ''''+ TYPE_REESTR + ''''+ ')'; 
          DM.DataSet.Open;
          CloseWaitForm(wf);
       end;

        ViewForm.Free;
          CaptionsClear();
          if DM.DataSet['NAME_FACUL'] <> null then
          Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
          if DM.DataSet['NAME_SPEC']<> null then
          Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
          if DM.DataSet['NAME_GROUP']<> null then
          Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
          if DM.DataSet['KURS']<> null then
          Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
          if DM.DataSet['NAME_KAT_STUD']<> null then
          CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
          if DM.DataSet['NAME_FORM_STUD']<> null then
          FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
          if DM.DataSet['NAME_NAZIONAL']<> null then
          Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
          If DM.DataSet['NAME_DOG_STATUS']<> null
           Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
           Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
          DM.DataSet.AfterScroll := DataSetAfterOpen;
      except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
   end;
end;

procedure TfrmContracts.FilterActionExecute(Sender: TObject);
begin
Dog_Filter_Edit.Setfocus;
end;

procedure TfrmContracts.DeleteButtonClick(Sender: TObject);
var
  i: byte;
  cnUplSum : Currency;
  id_session_pay, id_stud_as_int : int64;
begin
  If not Is_Admin then
   If ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0) or
       (fibCheckPermission('/ROOT/Contracts/Cn_Reg','Del') <> 0))
    then
     if ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Del') <> 0) or
         ((cxDBTreeList1.FocusedNode.Values[9] <> 2)and
         (cxDBTreeList1.FocusedNode.Values[9] <> 3))
        )
      then
       if ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Work') <> 0) and
           (ID_User <> DM.DataSet['ID_USER_ADD']))
        then
    Begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    End;

  if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  id_stud_as_int:= Dm.DataSet['ID_STUD'];
  {проверяю контракт на возможность удаления - если запись есть в остатках по счетам}
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_CHECK_CONTRACT_ON_DEL(' + IntToStr(id_stud_as_int) + ')';
  DM.ReadDataSet.Open;
  if DM.ReadDataSet['CANDELETE'] = 0 then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex], cnConsts_Messages.cn_NoDeleteContract[PLanguageIndex], mtError, [mbYes]);
    DM.ReadDataSet.Close;
    exit;
   end;
  DM.ReadDataSet.Close;

  {проверяю контракт на возможность удаления - если были какие-либо оплаты - удалять нельзя}
  With DM.StProc do
   try
    // --------------запуск процедуры st_pay------------------------------
    // расчет уже уплаченной суммы

    StoredProcName := 'CN_PAY';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_STUD').AsInt64 := id_stud_as_int;
    ParamByName('DATE_PROV_CHECK').AsShort := 1;
    ParamByName('IS_DOC_GEN').AsShort := 1;
    ParamByName('IS_PROV_GEN').AsShort := 1;
    ParamByName('IS_SMET_GEN').AsShort := 1;
    ParamByName('NOFPROV').AsShort := 1;
    ParamByName('DIGNORDOCID').AsShort := 1;
    ExecProc;

    cnUplSum:=ParamByName('CNUPLSUM').AsCurrency;

    id_session_pay:= ParamByName('ID_SESSION').AsInt64;

    Transaction.Commit;
    Close;

    StoredProcName := 'CN_PAY_TMP_CLEAR';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64 := id_session_pay;
    ExecProc;
    Transaction.Commit;
    Close;

   except
    on E:Exception do
     begin
      cnShowMessage('Error in CN_PAY or CN_PAY_TMP_CLEAR',e.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;

  if cnUplSum > 0 then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex], cnConsts_Messages.cn_NoDeleteContract[PLanguageIndex], mtError, [mbYes]);
    exit;
   end;

  {если нормально - удаляю контракт (закрываю use_end-ы) }
  with DM.StProc do
   try
    // удаляем все записи по договору и связанным таблицам путем закрытия use_enda
    Transaction.StartTransaction; // старт общей транзакции

    StoredProcName := 'CN_DT_DOG_ROOT_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ExecProc;

    StoredProcName := 'CN_DT_DOG_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
    ExecProc;

    StoredProcName := 'CN_DT_STUD_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ExecProc;

    StoredProcName := 'CN_DT_STUD_INF_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
    ExecProc;

    StoredProcName := 'CN_DT_PAYER_STAGE_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
    ExecProc;

    StoredProcName := 'CN_DT_DOG_SMET_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
    ExecProc;

    StoredProcName := 'CN_DT_STAGE_OPL_DELETE';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
    ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
    ExecProc;

    // -----------логирование удаления------------------------------------
    Dm.ReadDataSet.Close;
    Dm.ReadDataSet.SelectSQL.Clear;
    Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Delete' + '''' + ')';
    Dm.ReadDataSet.Open;
    DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.DataSet['ID_DOG_ROOT'];
    DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.DataSet['ID_DOG_LAST'];
    DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.DataSet['ID_STUD'];
    DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
    DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
    DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
    DM.StProc.ExecProc;
    Dm.ReadDataSet.Close;

    Transaction.Commit;     // коммит общей транзакции
    if DM.DataSet['ISCOLLECT'] = 0
     then
      begin
       DM.DataSet.AfterScroll := nil;
       DM.DataSet.SQLs.DeleteSQL.Text:='execute procedure z_empty_proc';
       DM.DataSet.Delete;
       DM.DataSet.AfterScroll := DataSetAfterOpen;
      end
     else RefreshButtonClick(Self); // иначе перезабираем датасет

   except
    on E:Exception do
     begin
      cnShowMessage('Error',e.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;
  DsetRecordCount.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption := DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
end;

procedure TfrmContracts.GridDBViewDblClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmContracts.Dog_Filter_EditEnter(Sender: TObject);
begin
  if Dog_Filter_Edit.CurText = cnConsts.cn_FilterText[PLanguageIndex]
   then Dog_Filter_Edit.CurText := '';
end;

procedure TfrmContracts.Dog_Filter_EditKeyPress(Sender: TObject;
  var Key: Char);
  function CtrlPressed():boolean;
   begin
    result:= HiWord(GetAsyncKeyState(VK_CONTROL))>0;       //Зажат ли
   end;
begin
  if key = #13 then cxDBTreeList1.SetFocus;
{  if (CtrlPressed) then Exit;

  If ( ((key <> #8) and (key <> '/')) and (key <> '-')) then
   If not IntegerCheck(key)
    then FiltrByFIO_RadioButton.Checked := True
    else FiltrByNum_RadioButton.Checked := true;}
end;

procedure TfrmContracts.RefreshButtonClick(Sender: TObject);
 var
  wf:TForm;
begin
  screen.Cursor:= crHourGlass;

  wf:=ShowWaitForm(self,wfLoadPackage);

  //Запрос отбора договора
  DM.DataSet.close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_SELECT_HS(' +
                       inttostr(Cn_view) + ',' + inttostr(ID_ROLE) + ','+ ''''+ TYPE_REESTR + '''' + ') order by USE_BEG descending';
  EraseMod := False;
  DM.DataSet.AfterScroll := nil;
  DM.DataSet.CloseOpen(true);

   CloseWaitForm(wf);

  DM.DataSet.AfterScroll := DataSetAfterOpen;

  DsetRecordCount.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption := DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
  ViewMenuButtons(true);

  fio.SortOrder := soNone;

  screen.Cursor:= crDefault;
end;

procedure TfrmContracts.FormShow(Sender: TObject);
begin
  DataSetAfterOpen(DM.DataSet);
  if not ExtraMode then
   begin
    CloseWaitForm(wf);
    SelectBtn.Visible := ivNever;
   end;

  cxDBTreeList1.SetFocus;
  if DM.DataSet.RecordCount >0
   then cxDBTreeList1.DataController.FocusedRecordIndex :=0;

  DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);

  if ExtraMode then
   begin
    Caption:= Caption + ' --ABITURIENT--';
    AddButton.Visible := ivNever;
    if ActionMode = 'add'
     then EditButton.Visible := ivNever;
    DeleteButton.Visible := ivNever;
    BreakDown_Button.Visible := ivNever;
    UpLoad_Button.Visible := ivNever;
    ScanPop.Visible := false;
    RefreshButton.Visible := ivNever;
    GlobalFilterButton.Visible := ivNever;
    PrintButton.Visible := ivNever;
    PayButton.Visible := ivNever;
    LgotaButton.Visible := ivNever;
    EntryRestButton.Visible := ivNever;
    OrdersBtn.Visible := ivNever;
    BarManager.Bars[1].Visible:= false;
    StatusBarTop.Visible:= false;
    if ActionMode = 'edit'
     then SelectBtn.Visible := ivNever;
    if ActionMode = 'add'
     then AddButtonClick(Sender);
    if ActionMode = 'edit'
     then EditButtonClick(Sender);
    if ActionMode = 'add'
     then SelectBtnClick(Sender);
   end;
end;

procedure TfrmContracts.EntryRestButtonClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  If (not Is_Admin) then
   If fibCheckPermission('/ROOT/Contracts/cn_entryrest','Belong') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
  AParameter.cnParamsToPakage.ID_STUD    := DM.Dataset['ID_STUD'];
  AParameter.cnParamsToPakage.ID_DOG     := DM.Dataset['ID_DOG_LAST'];
  AParameter.ID_User := ID_User;
  AParameter.User_Name := User_Name;
  AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
  AParameter.WaitPakageOwner:= frmContracts;
  AParameter.is_admin := is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_EntryRest.bpl','ShowEntryRest');
  AParameter.Free;
  Screen.Cursor := crDefault;
end;

procedure TfrmContracts.PayButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
  // проверка прав
{  if not bool(IsAdmin) then
  if fibCheckPermission('/ROOT/Contracts/cn_OplataView','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;}

 if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:= frmContracts;
  AParameter.cnParamsToPakage.ID_STUD:=DM.DataSet['ID_STUD'];
  AParameter.cnParamsToPakage.ID_DOG_ROOT:=DM.DataSet['ID_DOG_ROOT'];
  RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_PaymentAnalysis.bpl','ShowPayment');
  AParameter.Free;
end;

procedure TfrmContracts.Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
                                               Shift: TShiftState);
var
  wf:TForm;
  Fam, Imya, Otch, FIO_Search: String;
  p, len_FIO :integer;
begin
  if Dog_Filter_Edit.CurText = '' then exit;

  if key = vk_return then
   begin
    FIO_Search:=Dog_Filter_Edit.CurText;
    if FiltrByFIO_RadioButton.Checked then
     Begin
      Len_FIO:=length(FIO_Search);
      p:=1;
      while p<=len_FIO do
       Begin
        If FIO_Search[p]=' '
         then
          Begin
           Insert('%',FIO_Search,p);
           p:=p+1;
           Len_fio:=len_fio+1;
          End;
        p:=p+1;
       End;
     End;

    Screen.Cursor := crHourGlass;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.Close;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                                ''''+
                                StringPrepareToApostrofText(UpperCaseRusUkr(FIO_Search))
                                + ''''+',';

    if FiltrByFIO_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '1';
    if FiltrByNum_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '2';
    if FiltrByKod_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '3';

    // права на сметы
    DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
    inttostr(Cn_View) + ',' + inttostr(ID_User) + ','+ ''''+ TYPE_REESTR + '''' + ') Order by FIO collate win1251_ua';

    DM.DataSet.Open;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);

    Fio.SortOrder := soNone;

    DM.DataSet.AfterScroll := DataSetAfterOpen;
   end;
end;

procedure TfrmContracts.FilterExecute_ButtonClick(Sender: TObject);
var
  ss: TShiftState;
  key : Word;
begin
  ss:=[ssShift] ;
  key :=13;
  Dog_Filter_EditKeyDown(self, key, ss);
end;

procedure TfrmContracts.DsetRecordCountClick(Sender: TObject);
begin
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
end;

procedure TfrmContracts.PrintButtonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
begin
{   If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Print') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;
 }
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  InParameter:= TcnSimpleParamsEx.Create;
  InParameter.Owner:=self;
  InParameter.Db_Handle:= DM.DB.Handle;
  InParameter.Formstyle:=fsNormal;
  InParameter.cnParamsToPakage.ID_DOG_ROOT := DM.Dataset['ID_DOG_ROOT'];
  InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
  InParameter.cnParamsToPakage.ID_STUD     := DM.Dataset['ID_STUD'];
  InParameter.cnParamsToPakage.ID_RATE_ACCOUNT := DM.Dataset['ID_INT_ACCOUNT'];
  InParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
  InParameter.cnParamsToPakage.Num_Doc := DM.DataSet['NUM_DOG'];
  InParameter.cnParamsToPakage.DATE_DOG := DM.DataSet['DATE_DOG'];
  InParameter.ID_User := ID_User;
  InParameter.User_Name := User_Name;
  InParameter.WaitPakageOwner:= frmContracts;

  RunFunctionFromPackage(InParameter, 'Contracts\cn_fr_PaymentAnalysis.bpl','frChooseReport');

  InParameter.Free;
  Screen.Cursor := crDefault;
end;


procedure TfrmContracts.GlobalFilterButtonClick(Sender: TObject);
 var
  //ViewForm : TfrmFilterEx;
  wf:TForm;
begin
  //поиск по параметрам
  if FormFilter.showmodal = 1000 then
   begin
    Screen.Cursor := crHourGlass;
    DM.DataSet.Close;
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_FILTER_STUDYPARAMS(:ID_SESSION, :VIEW, :ID_USER, :REESTR,:DATE_BEG_Z,:DATE_BEG_PO,:DATE_END_Z,:DATE_END_PO) Order by FIO collate win1251_ua';
    DM.DataSet.ParamByName('ID_SESSION').AsInt64:=FormFilter.ID_SESSION_params_study;
    DM.DataSet.ParamByName('VIEW').AsInteger := Cn_view;
    DM.DataSet.ParamByName('REESTR').AsString := TYPE_REESTR;
    DM.DataSet.ParamByName('ID_USER').Asint64 := ID_User;
    If FormFilter.Date_Beg_Check.Checked then
     Begin
      DM.DataSet.ParamByName('DATE_BEG_Z').AsDate := FormFilter.Date_beg_Z.EditValue;
      DM.DataSet.ParamByName('DATE_BEG_PO').AsDate := FormFilter.Date_beg_PO.EditValue;
     End
    Else
     Begin
      DM.DataSet.ParamByName('DATE_BEG_Z').AsVariant := null;
      DM.DataSet.ParamByName('DATE_BEG_PO').AsVariant := null;
     End;
    If FormFilter.Date_End_Check.Checked then
     Begin
      DM.DataSet.ParamByName('DATE_END_Z').AsDate := FormFilter.Date_End_Z.EditValue;
      DM.DataSet.ParamByName('DATE_END_PO').AsDate := FormFilter.Date_End_PO.EditValue;
     End
    Else
     Begin
      DM.DataSet.ParamByName('DATE_END_Z').AsVariant := null;
      DM.DataSet.ParamByName('DATE_END_PO').AsVariant := null;
     End;

    Refresh;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.Open;
    DM.DataSet.AfterScroll := DataSetAfterScroll;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=   DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);

    CloseWaitForm(wf);
    exit;
   end;

  //поиск по номеру
  if FormFilter.ModalResult = 10 then
   begin
    Screen.Cursor := crHourGlass;
    DM.DataSet.Close;
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_TIN(:TIN,:VIEW,:USER,:REESTR)';
    DM.DataSet.ParamByName('TIN').AsString    :=FormFilter.Edit.Text;
    DM.DataSet.ParamByName('VIEW').AsInteger  :=Cn_view;
    DM.DataSet.ParamByName('USER').AsInt64    :=ID_user;
    DM.DataSet.ParamByName('REESTR').AsString :=TYPE_REESTR;

    Refresh;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.Open;
    DM.DataSet.AfterScroll := DataSetAfterScroll;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);
    exit;
   end;

  if FormFilter.ModalResult = -1 then exit;

  //поиск плательщика физическое лицо
  if FormFilter.ModalResult = 11 then
   begin
    Screen.Cursor := crHourGlass;
    DM.DataSet.Close;
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_PAYER(:FIO,:VIEW,:USER,:REESTR)';
    DM.DataSet.ParamByName('FIO').AsString:=FormFilter.Edit.Text;
    DM.DataSet.ParamByName('VIEW').AsInteger:=Cn_view;
    DM.DataSet.ParamByName('USER').AsInt64:=ID_user;
    DM.DataSet.ParamByName('REESTR').AsString:=TYPE_REESTR;

    Refresh;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.Open;
    DM.DataSet.AfterScroll := DataSetAfterScroll;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);
    exit;
   end;

  //поиск плательщика юридическое лицо
  if ((FormFilter.ModalResult <> 11) and (FormFilter.ModalResult <> 10)) then
   begin
    Screen.Cursor := crHourGlass;
    DM.DataSet.Close;
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_PAYER_YUR(:MODE,:NAME,:RATE,:VIEW,:USER,:REESTR)';
    DM.DataSet.ParamByName('MODE').AsInteger := FormFilter.ModalResult;
    DM.DataSet.ParamByName('NAME').AsString := FormFilter.Edit.Text;
    DM.DataSet.ParamByName('RATE').AsString := FormFilter.Schet_Edit.Text;
    DM.DataSet.ParamByName('VIEW').AsInteger := Cn_view;
    DM.DataSet.ParamByName('USER').AsInt64 := ID_user;
    DM.DataSet.ParamByName('REESTR').AsString := TYPE_REESTR;

    Refresh;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.Open;
    DM.DataSet.AfterScroll := DataSetAfterScroll;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);
   end;
end;

procedure TfrmContracts.LgotaButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
 AParameter.cnParamsToPakage.ID_STUD:= DM.Dataset['ID_STUD'];
 AParameter.cnParamsToPakage.ID_DOG     := DM.Dataset['ID_DOG_LAST'];
 AParameter.ID_User := ID_User;
 AParameter.User_Name := User_Name;
 AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 AParameter.WaitPakageOwner:= frmContracts;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Lgots.bpl','ShowDTLgots');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContracts.HistoryButtonClick(Sender: TObject);
var ViewForm : TfrmHistory;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
ViewForm := TfrmHistory.create(self, PLanguageIndex, DM.DB.Handle, DM.Dataset['ID_DOG_ROOT'],is_admin);
ViewForm.ID_User := ID_User;
ViewForm.User_Name := User_Name;
ViewForm.ShowModal;
if ViewForm.LModalResult = 2225600 then
 begin
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.Close;
    DM.DataSet.SelectSQL.Clear;
    DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                       ''''+ ViewForm.num_dog+ ''''+ ',2';


    // права на сметы
    DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
    inttostr(cn_view) + ',' + inttostr(ID_ROLE) + ',' + ''''+ TYPE_REESTR + ''''+ ')';     
    DM.DataSet.Open;
    CloseWaitForm(wf);

          CaptionsClear();
          if DM.DataSet['NAME_FACUL'] <> null then
          Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
          if DM.DataSet['NAME_SPEC']<> null then
          Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
          if DM.DataSet['NAME_GROUP']<> null then
          Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
          if DM.DataSet['KURS']<> null then
          Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
          if DM.DataSet['NAME_KAT_STUD']<> null then
          CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
          if DM.DataSet['NAME_FORM_STUD']<> null then
          FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
          if DM.DataSet['NAME_NAZIONAL']<> null then
          Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
          If DM.DataSet['NAME_DOG_STATUS']<> null
           Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
           Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
          DM.DataSet.AfterScroll := DataSetAfterOpen;


 end;
end;

procedure TfrmContracts.UpLoad_ButtonClick(Sender: TObject);
var
    InParameter : TcnSimpleParamsEx;
    Result : TDissInfo;
    ID_DOG_ROOT_upt : int64;

 ViewForm:Tfrm_Contracts_AE;
 i, j, k, w, flag: integer;
 ID_DOG_ROOT : int64;
 ID_DOG      : int64;
 ID_STUD     : int64;

 ID_DOG_Convert : int64;
 ID_DOG_ROOT_Convert : int64;
 ID_RATE_ACCOUNT_Convert : int64;

 StudersCounter: byte;
 Man_Fio:array of TStudBasicInfo;
 DateDissVariant : TDate;
 TrHandle : TISC_TR_HANDLE;
 DmTr: TDM_Contracts;

 year,month,day:Word;
 Date_beg_price, Date_End_price: TDate;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  If not Is_Admin then
    If ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0) and
        (cxDBTreeList1.FocusedNode.Values[9] <> 2) and
        (cxDBTreeList1.FocusedNode.Values[9] <> 3))
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

  // если контракт действующий, то вызываем модуль расторжения
  // иначе используем старые данные расторжения
  DmTr :=  TDM_Contracts.Create(self);
  DmTr.DB.Handle := DM.DB.Handle;
  DmTr.StProc.Transaction.StartTransaction;

  if DM.DataSet['ISDISSDOG'] <> 1 then
   begin
    InParameter:= TcnSimpleParamsEx.Create;
    InParameter.Owner:=self;
    InParameter.Db_Handle:= DM.DB.Handle;
    InParameter.Formstyle:=fsNormal;
    InParameter.AMode := Edit;
    InParameter.cnParamsToPakage.ID_DOG_ROOT := DM.Dataset['ID_DOG_ROOT'];
    ID_DOG_ROOT_upt                          := DM.Dataset['ID_DOG_ROOT'];
    InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
    InParameter.cnParamsToPakage.FIO         := DM.DataSet['FIO'];
    InParameter.cnParamsToPakage.DissDownAllContract := true;
    InParameter.cnParamsToPakage.IsUpload :=true;
    InParameter.ID_User := ID_User;
    InParameter.User_Name := User_Name;
    InParameter.WaitPakageOwner:= frmContracts;

    InParameter.TR_Handle := DmTr.StProc.Transaction.Handle;
    Result :=RunDissInfoFromPackage(InParameter, 'Contracts\cn_dt_DissInfo.bpl','ShowDTDissInfo');
    InParameter.Free;
   end
  else
   begin
    Result.flag := 1;
    DmTr.StProc.StoredProcName := 'CN_DT_DOG_UPLOAD_CLOSE_USE_END';
    DmTr.StProc.ParamByName('ID_DOG_ROOT').AsInt64  := DM.Dataset['ID_DOG_ROOT'];
    DmTr.StProc.ParamByName('ID_DOG_LAST').AsInt64  := DM.Dataset['ID_DOG_LAST'];
    DmTr.StProc.Prepare;
    DmTr.StProc.ExecProc;
   end;

  if Result.flag = 1then
   begin
    // -----------логирование расторжения------------------------------------
    DmTr.ReadDataSet.Close;
    DmTr.ReadDataSet.SelectSQL.Clear;
    DmTr.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Rastorg' + '''' + ')';
    DmTr.ReadDataSet.Open;
    DmTr.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
    DmTr.StProc.Prepare;
    DmTr.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
    DmTr.StProc.ParamByName('ID_DOG').AsInt64          := DM.Dataset['ID_DOG_LAST'];
    DmTr.StProc.ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
    DmTr.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
    DmTr.StProc.ParamByName('USER_NAME').AsString      := User_Name;
    DmTr.StProc.ParamByName('ID_ACTION').AsInt64       := DmTr.ReadDataSet['ID_ACTION'];
    DmTr.StProc.ExecProc;
    DmTr.ReadDataSet.Close;


    // если контракт не коллективный - обновляем запись в датасет
    if  DM.Dataset['ISCOLLECT'] = 0 then
     begin
      DM.DataSet.AfterScroll := nil;
      DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
      DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT_upt)+')';
      DM.DataSet.Edit;
      DM.DataSet.Post;
     end
    else
     begin
      // иначе перезабираем датасет
      wf:=ShowWaitForm(self,wfLoadPackage);
      DM.DataSet.AfterScroll := nil;
      DM.DataSet.Close;
      DM.DataSet.SelectSQL.Clear;
      DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                             ''''+ DM.DataSet['NUM_DOG'] + ''''+ ',2';


      // права на сметы
      DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
           inttostr(cn_view) + ',' + inttostr(ID_ROLE)+ ','  + ''''+ TYPE_REESTR + ''''+ ')';
      DM.DataSet.Open;
      CloseWaitForm(wf);
     end;

    if DM.DataSet['ISCOLLECT'] = 1 then   wf:=ShowWaitForm(self,wfLoadPackage);

    ViewForm:= Tfrm_Contracts_AE.create(frmContracts, PLanguageIndex, DM.DB.Handle, DM.Dataset['ISCOLLECT'],is_admin );
    ViewForm.Caption:= cnConsts.cn_Upload_Caption[PLanguageIndex];

                ViewForm.PereofMode := 1;
                ViewForm.BarCode_Edit.Text := '';

                ViewForm.ID_VALUTE := -1;
                ViewForm.ButtonEdit_valute.Text := '';
                if DM.Dataset['ID_VALUTE'] <> null then
                 Begin
                  ViewForm.ID_VALUTE := DM.Dataset['ID_VALUTE'];
                  ViewForm.ButtonEdit_valute.Text := DM.Dataset['NAME_VALUTE'];
                 End;

                ViewForm.ID_DOG_ROOT := DM.DataSet['ID_DOG_ROOT'];
                ViewForm.Num_Dog_Edit.Text             :=  DM.Dataset['NUM_DOG'];
                ViewForm.Date_Zakl_DateEdit.Date       :=  strtodate(DM.Dataset['DATE_DOG']);
                if DM.Dataset['DATE_BEG'] <> null then
                ViewForm.Date_Beg_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_BEG']);
                if DM.Dataset['DATE_END'] <> null then
                ViewForm.Date_End_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_END']);

                if DM.DataSet['ID_TYPE_ACTION'] <> null then ViewForm.ID_TYPE_ACTION:=DM.DataSet['ID_TYPE_ACTION'];

                 if DM.Dataset['ISMAINDOG'] = 1 then
                   ViewForm.Base_Dog_RadioButton.Checked  := true
                 else
                   ViewForm.Addit_Dog_RadioButton.Checked :=  false;

                // работает DM.ReadDataSet - забиваем гриды информацией
                // информация по студенту
                 DM.ReadDataSet.SelectSQL.Clear;
                 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
                 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
                 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_ALL_STUDINFO_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
                 DM.ReadDataSet.Open;
                 DM.ReadDataSet.FetchAll;
                 DM.ReadDataSet.First;
                 for i:=0 to DM.ReadDataSet.RecordCount-1 do
                  begin
                   ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
                   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PEOPLE'];
                {ид_ман}
                   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := DM.ReadDataSet['ID_MAN'];
                {дата_начала}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 1] :=  DM.ReadDataSet['DATE_BEG'];
                {дата_конца}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 2] :=  DM.ReadDataSet['DATE_END'];
                {факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.ReadDataSet['NAME_FACUL'];
                {специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.ReadDataSet['NAME_SPEC'];
                {группа}             ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 5] :=  DM.ReadDataSet['NAME_GROUP'];
                {форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.ReadDataSet['NAME_FORM_STUD'];
                {категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.ReadDataSet['NAME_KAT_STUD'];
                {национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.ReadDataSet['NAME_NAZIONAL'];
                {курс}               ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  DM.ReadDataSet['KURS'];
                {сумма}              ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 10] := -1;//DM.ReadDataSet[''];

                {ид_факультета}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := DM.ReadDataSet['ID_FACUL'];
                {ид_спец}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := DM.ReadDataSet['ID_SPEC'];
                {ид_группы}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 13] := DM.ReadDataSet['ID_GROUP'];
                {ид_формыобуч}       ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := DM.ReadDataSet['ID_FORM_STUD'];
                {ид_категоробуч}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := DM.ReadDataSet['ID_KAT_STUD'];
                {ид_национал}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := DM.ReadDataSet['ID_NATIONAL'];
                {ид_студ}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 18] := DM.ReadDataSet['ID_STUD'];
                {SUM_ENTRY_REST}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 19] := DM.ReadDataSet['SUM_ENTRY_REST'];
                  DM.ReadDataSet.Next;
                  end;
                 DM.ReadDataSet.Close;

                 // rate_account
                 if DM.DataSet['ID_INT_ACCOUNT']<> null then
                 begin
                 DM.ReadDataSet.SelectSQL.Clear;
                 ID_RATE_ACCOUNT_Convert := DM.DataSet['ID_INT_ACCOUNT'];
                 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
                 DM.ReadDataSet.Open;
                 ViewForm.Accounts.Text  := DM.ReadDataSet['RATE_ACCOUNT'];
                 ViewForm.ID_INT_Account := DM.DataSet['ID_INT_ACCOUNT'];
                 //ViewForm.Account_Label.Caption :=DM.ReadDataSet['NAME_MFO'];
                 DM.ReadDataSet.Close;
                 end;

                 // информация по плательщикам
                 DM.ReadDataSet.SelectSQL.Clear;
                 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
                 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
                 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
                 DM.ReadDataSet.Open;
                 DM.ReadDataSet.FetchAll;
                 DM.ReadDataSet.First;
                 for i:=0 to DM.ReadDataSet.RecordCount-1 do
                  begin
                   ViewForm.Grid_payersTableView.DataController.RecordCount := ViewForm.Grid_payersTableView.DataController.RecordCount + 1;
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
                   if DM.ReadDataSet['ISPERCENT'] =1 then
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
                   else
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
                   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
                   DM.ReadDataSet.Next;
                  end;
                 DM.ReadDataSet.Close;

                 // информация по сметам
                 DM.ReadDataSet.SelectSQL.Clear;
                 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_SMET_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
                 DM.ReadDataSet.Open;
                 DM.ReadDataSet.FetchAll;
                 DM.ReadDataSet.First;
                 for i:=0 to DM.ReadDataSet.RecordCount-1 do
                  begin
                   ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['KOD_SM'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['KOD_RAZD'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['KOD_ST'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['KOD_KEKV'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['PERSENT'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_SMET'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_RAZD'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_STAT'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['ID_KEKV'];
                   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['ID_MAN'];
                   DM.ReadDataSet.Next;
                  end;
                 DM.ReadDataSet.Close;

                 // информация по периодам оплат
                 DM.ReadDataSet.SelectSQL.Clear;
                 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
                 DM.ReadDataSet.Open;
                 DM.ReadDataSet.FetchAll;
                 DM.ReadDataSet.First;
                 for i:=0 to DM.ReadDataSet.RecordCount-1 do
                  begin
                   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['DATE_BEG'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['DATE_END'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['DATE_PAY'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['SUMMA'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_PAYER'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_MAN'];
                   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['NUM_YEAR'];
                   DM.ReadDataSet.Next;
                  end;
                 DM.ReadDataSet.Close;


                // далее по дате расторжения контракта обрезаю сверху периоды оплаты
                 DM.ReadDataSet.Close;
                 if DM.DataSet['ISDISSDOG']<>1 then DateDissVariant := Result.Date_Diss
                 else
                  begin
                   DM.ReadDataSet.SelectSQL.Clear;
                   DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DATE_DISS(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
                   DM.ReadDataSet.Open;
                   DateDissVariant := DM.ReadDataSet['DATE_DISS'];
                   DM.ReadDataSet.Close;
                  end;

                 // далее удаляем лишние периоды
                   for j:= (ViewForm.Grid_payTableView.DataController.RecordCount-1) downto 0  do
                   begin
                    if (strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 1]) < DateDissVariant) then
                       begin
                        ViewForm.Grid_payTableView.DataController.DeleteRecord(j);
                        Continue;
                       end;

                      if ((strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 1]) >= DateDissVariant) and (strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 0]) <= DateDissVariant))
                      then
                       begin
                        ViewForm.Grid_payTableView.DataController.Values[j, 3]:=
                        ((strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 1]) - DateDissVariant)/
                         (strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 1])-strtodate(ViewForm.Grid_payTableView.DataController.Values[j, 0])))
                         * StrToCurr(ViewForm.Grid_payTableView.DataController.Values[j, 3]);
                        ViewForm.Grid_payTableView.DataController.Values[j, 0] := datetostr(DateDissVariant);
                       end;
                    end;
                  ViewForm.Date_Beg_DateEdit.Date := DateDissVariant;
                  DM.ReadDataSet.Close;

                  //ViewForm.CancelButton.Enabled:= false;


                 if DM.DataSet['ISCOLLECT'] = 1 then CloseWaitForm(wf);

    //------------------------------------------------------------------------------
    DM.ReadDataSet.close;
    DM.ReadDataSet.SQLs.SelectSQL.Clear;
    DM.ReadDataSet.SQLs.SelectSQL.Add('SELECT * FROM CN_GET_SUMM_FROM_STAGE_OPL(:id_dog,:id_dog_root)');
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64:= ID_DOG_Convert;
    DM.ReadDataSet.ParamByName('ID_DOG_ROOT').AsInt64:=ID_DOG_ROOT_Convert;
    DM.readDataSet.open;

    If DM.ReadDataSet['Summ1'] <> null then ViewForm.Summ1:=DM.ReadDataSet['summ1'] else ViewForm.summ1:=0;
    If DM.ReadDataSet['Summ2'] <> null then ViewForm.Summ2:=DM.ReadDataSet['summ2'] else ViewForm.summ2:=0;
    If DM.ReadDataSet['Summ3'] <> null then ViewForm.Summ3:=DM.ReadDataSet['summ3'] else ViewForm.summ3:=0;
    If DM.ReadDataSet['Summ4'] <> null then ViewForm.Summ4:=DM.ReadDataSet['summ4'] else ViewForm.summ4:=0;
    If DM.ReadDataSet['Summ5'] <> null then ViewForm.Summ5:=DM.ReadDataSet['summ5'] else ViewForm.summ5:=0;
    If DM.ReadDataSet['Summ6'] <> null then ViewForm.Summ6:=DM.ReadDataSet['summ6'] else ViewForm.summ6:=0;
    If DM.ReadDataSet['Summ7'] <> null then ViewForm.Summ7:=DM.ReadDataSet['summ7'] else ViewForm.summ7:=0;
    If DM.ReadDataSet['Summ8'] <> null then ViewForm.Summ8:=DM.ReadDataSet['summ8'] else ViewForm.summ8:=0;

    If DM.ReadDataSet['term1'] <> null then ViewForm.term_stud1:=DM.ReadDataSet['term1'] else ViewForm.term_stud1:=0;
    If DM.ReadDataSet['term2'] <> null then ViewForm.term_stud2:=DM.ReadDataSet['term2'] else ViewForm.term_stud2:=0;
    If DM.ReadDataSet['term3'] <> null then ViewForm.term_stud3:=DM.ReadDataSet['term3'] else ViewForm.term_stud3:=0;
    If DM.ReadDataSet['term4'] <> null then ViewForm.term_stud4:=DM.ReadDataSet['term4'] else ViewForm.term_stud4:=0;
    If DM.ReadDataSet['term5'] <> null then ViewForm.term_stud5:=DM.ReadDataSet['term5'] else ViewForm.term_stud5:=0;
    If DM.ReadDataSet['term6'] <> null then ViewForm.term_stud6:=DM.ReadDataSet['term6'] else ViewForm.term_stud6:=0;
    If DM.ReadDataSet['term7'] <> null then ViewForm.term_stud7:=DM.ReadDataSet['term7'] else ViewForm.term_stud7:=0;
    If DM.ReadDataSet['term8'] <> null then ViewForm.term_stud8:=DM.ReadDataSet['term8'] else ViewForm.term_stud8:=0;

    If DM.ReadDataSet['Date_beg1'] <> null then  ViewForm.Date_beg_stud1 := DM.ReadDataSet['Date_beg1'];
    If DM.ReadDataSet['Date_end1'] <> null then  ViewForm.Date_end_stud1 := DM.ReadDataSet['Date_end1'];
    If DM.ReadDataSet['Date_beg2'] <> null then  ViewForm.Date_beg_stud2 := DM.ReadDataSet['Date_beg2'];
    If DM.ReadDataSet['Date_end2'] <> null then  ViewForm.Date_end_stud2 := DM.ReadDataSet['Date_end2'];
    If DM.ReadDataSet['Date_beg3'] <> null then  ViewForm.Date_beg_stud3 := DM.ReadDataSet['Date_beg3'];
    If DM.ReadDataSet['Date_end3'] <> null then  ViewForm.Date_end_stud3 := DM.ReadDataSet['Date_end3'];
    If DM.ReadDataSet['Date_beg4'] <> null then  ViewForm.Date_beg_stud4 := DM.ReadDataSet['Date_beg4'];
    If DM.ReadDataSet['Date_end4'] <> null then  ViewForm.Date_end_stud4 := DM.ReadDataSet['Date_end4'];
    If DM.ReadDataSet['Date_beg5'] <> null then  ViewForm.Date_beg_stud5 := DM.ReadDataSet['Date_beg5'];
    If DM.ReadDataSet['Date_end5'] <> null then  ViewForm.Date_end_stud5 := DM.ReadDataSet['Date_end5'];

    DM.readDataSet.Close;
 //  End;

 if ViewForm.ShowModal = mrOk then
   begin
     DmTr.StProc.Transaction.Commit;

     with DM.StProc do
       try
        Transaction.StartTransaction; // старт общей транзакции

        StoredProcName := 'CN_DT_STUD_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ExecProc;

        ID_DOG_ROOT :=  DM.DataSet['ID_DOG_ROOT'];

        // определяю кол-во обучающихся по контракту
        StudersCounter:=1;
        SetLength(Man_Fio, 1);
         if ViewForm.Grid_fioTableView.DataController.Values[0, 18] <> null then
        Man_Fio[0].ID_STUD:= ViewForm.Grid_fioTableView.DataController.Values[0, 18]
         else
        Man_Fio[0].ID_STUD:= -999;
        Man_Fio[0].ID_MAN:=  ViewForm.Grid_fioTableView.DataController.Values[0, 17];
        Man_Fio[0].FIO:=     ViewForm.Grid_fioTableView.DataController.Values[0, 0];
        if ViewForm.Grid_fioTableView.DataController.Values[0, 19] <> null then
           Man_Fio[0].Entry_Rest:= ViewForm.Grid_fioTableView.DataController.Values[0, 19]
        else
           Man_Fio[0].Entry_Rest:= 0;

        for i:=0 to ViewForm.Grid_fioTableView.DataController.RecordCount -1 do
        for j:=0 to Length(Man_Fio)-1 do
         begin
              for w:=0 to Length(Man_Fio)-1 do
                begin
                 flag := 0;
                 if ViewForm.Grid_fioTableView.DataController.Values[i, 17] = Man_Fio[w].ID_MAN then flag:=1;
                end;
               if flag =1 then Continue;
//         if ViewForm.Grid_fioTableView.DataController.Values[i, 17] <> Man_Fio[j].ID_MAN then
//          begin
           StudersCounter:= StudersCounter+1;
           SetLength(Man_Fio, Length(Man_Fio)+1 );
            if ViewForm.Grid_fioTableView.DataController.Values[i, 18] <> null then
           Man_Fio[Length(Man_Fio)-1].ID_STUD:= ViewForm.Grid_fioTableView.DataController.Values[i, 18]
            else
           Man_Fio[Length(Man_Fio)-1].ID_STUD:= -999;
           Man_Fio[Length(Man_Fio)-1].ID_MAN:= ViewForm.Grid_fioTableView.DataController.Values[i, 17];
           Man_Fio[Length(Man_Fio)-1].FIO:= ViewForm.Grid_fioTableView.DataController.Values[i, 0];
           if ViewForm.Grid_fioTableView.DataController.Values[i, 19] <> null then
            Man_Fio[Length(Man_Fio)-1].Entry_Rest:= ViewForm.Grid_fioTableView.DataController.Values[i, 19]
           else Man_Fio[Length(Man_Fio)-1].Entry_Rest:= 0;
          end;

        //-------
      {добавление общей информации по договору в таблицу договоров и корень одной процедурой}
      //вызывается 1 раз //
      // CN_DT_DOG_UPLOAD
        StoredProcName := 'CN_BARCODE_GENERATION';
        ExecProc;

        BarCode := FldByName['BarCode'].AsInt64;
        //----------------------------------------------------------------------
        StoredProcName := 'CN_DT_DOG_UPLOAD';
        Prepare;
        ParamByName('BarCode').AsInt64       := BarCode;
        ParamByName('ID_DOG_ROOT').AsInt64   := ID_DOG_ROOT;
        ParamByName('ID_DOG').AsInt64        := ID_DOG;
        if ViewForm.Base_Dog_RadioButton.Checked then
        ParamByName('ID_TYPE_DOG').AsInt64    := 1  //основной договор
        else
        ParamByName('ID_TYPE_DOG').AsInt64    := 2; //дополнительный договор
        ParamByName('ID_DOG_STATUS').Asint64  := CN_DOG_STATUS_DEYSTV;

        ParamByName('ID_USER').AsInt64   := Id_user;
        if DM.DataSet.FieldByName('ID_REESTR').IsNull then
          ParamByName('ID_REESTR').AsInt64:=0
        else
          ParamByName('ID_REESTR').AsInt64 := DM.DataSet['ID_REESTR'];

        ParamByName('ID_TYPE_ACTION').AsInt64:= ViewForm.ID_TYPE_ACTION;

        ParamByName('ID_INT_ACCOUNT').AsInt64 := ViewForm.ID_INT_Account;
        ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
        ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
        ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
        ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
        ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
        ParamByName('ISOSTATOK').AsShort      := 0;
        ExecProc;
        ID_DOG      := ParamByName('ID_DOG').AsInt64;

//-------

        // всё в одном цикле по студенту(ам)
        // begin for
          for i := 0 to StudersCounter - 1 do begin
           ID_STUD := -1;
      {добавление информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_UPDATE (запускаю с параметром ID_STUD, ID_DOG_ROOT )
         if Man_Fio[i].ID_STUD <> -999 then
          begin
            StoredProcName := 'CN_DT_STUD_UPDATE';                                                                              {perchak}
            Prepare;
            ParamByName('ID_STUD').AsInt64            := Man_Fio[i].ID_STUD;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := Man_Fio[i].ID_MAN;
            ParamByName('SUM_ENTRY_REST').AsVariant   := Man_Fio[i].Entry_Rest;
            ExecProc;
           ID_STUD :=  Man_Fio[i].ID_STUD;
          end
          else
          begin
          // CN_DT_STUD_INSERT (запускаю с параметром ID_DOG_ROOT и возвращаю идентификатор ID_STUD)
            StoredProcName := 'CN_DT_STUD_INSERT';                                                                                {perchak}
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := Man_Fio[i].ID_MAN;
            ParamByName('SUM_ENTRY_REST').AsVariant   := null;
            ExecProc;
           ID_STUD := ParamByName('ID_STUD').AsInt64;
          end;

           // -----------логирование переоформления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Pereoform' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;

      {добавление расширенной полной информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_INF_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, Man_Fio[i].ID_STUD)
        for j:=0 to  ViewForm.Grid_fioTableView.DataController.RecordCount-1 do
         if ViewForm.Grid_fioTableView.DataController.values[j, 17] = Man_Fio[i].ID_MAN then
          begin
            StoredProcName := 'CN_DT_STUD_INF_INSERT';                                                                        {perchak}
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64         := ID_DOG;
            ParamByName('ID_STUD').AsInt64        := ID_STUD;
            ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[j, 11];
            ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[j, 12];
            ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[j, 16];
            ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[j, 14];
            ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[j, 15];
            ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[j, 13];
            ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[j, 9];
            ParamByName('DATE_BEG').AsDate        := ViewForm.Grid_fioTableView.DataController.values[j, 1];
            ParamByName('DATE_END').AsDate        := ViewForm.Grid_fioTableView.DataController.values[j, 2];
            ExecProc;
          end;

         {добавляю корень }
        //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
        // CN_DT_DOG_ROOT_INSERT_HS (запускаю с параметром ID_DOG_ROOT)
              StoredProcName := 'CN_DT_DOG_ROOT_INSERT_HS';
              Prepare;
              if StudersCounter > 1 then
                begin
                 ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                 ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
                 ParamByName('ID_STUD').AsInt64        := ID_STUD;
                 ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
                 ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
                 ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
                 ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
                 ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
                 ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
                 ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
                 ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
                 ParamByName('FIO').AsString           := Man_Fio[i].FIO;
                 ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
                 ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
                 ParamByName('ISCOLLECT').AsShort      := 1;
                 if ViewForm.Base_Dog_RadioButton.Checked
                  then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
                  else ParamByName('ISMAINDOG').AsInt64      := 2; //дополнительный договор
                 ParamByName('ISDISSDOG').AsShort      := 0;
                 ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
                 ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
                 ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
                 ParamByName('IS_REAL_DOG').AsInteger  := 1;
                end
               else
                begin
                 ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                 ParamByName('ID_DOG_LAST').AsInt64    := ID_DOG;
                 ParamByName('ID_STUD').AsInt64        := ID_STUD;
                 ParamByName('ID_SMET').AsInt64        := ViewForm.Grid_istochnikiTableView.DataController.values[0, 5];
                 ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
                 ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
                 ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
                 ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
                 ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
                 ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
                 ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
                 ParamByName('FIO').AsString           := Man_Fio[i].FIO;
                 ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
                 ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
                 ParamByName('ISCOLLECT').AsShort      := 0;
                 if ViewForm.Base_Dog_RadioButton.Checked
                  then ParamByName('ISMAINDOG').AsInt64      := 1  //основной договор
                  else ParamByName('ISMAINDOG').AsInt64      := 2; //дополнительный договор
                 ParamByName('ISDISSDOG').AsShort      := 0;
                 ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
                 ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
                 ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
                 ParamByName('IS_REAL_DOG').AsInteger  := 1;
                end;
               ParamByName('BarCode').AsInt64 := BarCode;
               ExecProc;

    //-------
                  {добавление информации о периодах оплаты внутри цикла по студенту}
                  //кол-во вызовов зависит от кол-ва периодов оплаты по внесенному договору //
                  // CN_DT_STAGE_OPL_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STAGE_OPL(не использую))
               for k := 0 to ViewForm.Grid_payTableView.DataController.RecordCount - 1 do begin
                if Man_Fio[i].ID_MAN = ViewForm.Grid_payTableView.DataController.values[k, 5]
                {если значение id_man по студенту совпадает со значением id_man_stage_opl}
                  then begin
                    StoredProcName := 'CN_DT_STAGE_OPL_INSERT';
                    Prepare;
                    ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                    ParamByName('ID_DOG').AsInt64         := ID_DOG;
                    ParamByName('ID_STUD').AsInt64        := ID_STUD;
                    ParamByName('ID_PAYER').AsInt64       := ViewForm.Grid_payTableView.DataController.values[k, 4];
                    ParamByName('NUM_YEAR').AsString      := ViewForm.Grid_payTableView.DataController.values[k, 6];
                    ParamByName('DATE_BEG').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 0]);
                    ParamByName('DATE_END').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 1]);
                    ParamByName('DATE_PAY').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 2]);
                    ParamByName('SUMMA').AsCurrency       := ViewForm.Grid_payTableView.DataController.values[k, 3];
                    ExecProc;
                 end;
                 // enf if
               end;
               // end for
                //-------
                      {добавление информации о сметах}
                      //кол-во вызовов зависит от кол-ва периодов разбивки //
                      // CN_DT_DOG_SMET_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_DOG_SMET)
                       for k := 0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1 do begin
                        if Man_Fio[i].ID_MAN = ViewForm.Grid_istochnikiTableView.DataController.values[k, 9]
                         {если значение id_man по студенту совпадает со значением id_man_istochniki}
                        then begin
                        StoredProcName := 'CN_DT_DOG_SMET_INSERT';
                        Prepare;
                        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                        ParamByName('ID_DOG').AsInt64         := ID_DOG;
                        ParamByName('ID_STUD').AsInt64        := ID_STUD;
                        ParamByName('ID_SMET').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 5];
                        ParamByName('ID_RAZD').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 6];
                        ParamByName('ID_STAT').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 7];
                        ParamByName('ID_KEKV').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 8];
                        ParamByName('PERSENT').AsCurrency     :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 4];
                        ExecProc;
                         end;
                         // enf if
                       end;
                       // end for

          end;
           // end for по студенту в целом

//-------
       for i := 0 to ViewForm.Grid_payersTableView.DataController.RecordCount - 1 do begin
      {добавление информации о плательщике}
      //кол-во вызовов зависит от кол-ва плательщиков по внесенному договору //
      // CN_DT_PAYER_STAGE_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG и возвращаю идентификатор ID_PAYER_STAGE)
            StoredProcName := 'CN_DT_PAYER_STAGE_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64      := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64           := ID_DOG;
            ParamByName('ID_PAYER').AsInt64         := ViewForm.Grid_payersTableView.DataController.values[i, 6];

              // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
            ParamByName('ID_TYPE_PAYER').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 3];

            ParamByName('ID_RATE_ACCOUNT').AsInt64  :=  ViewForm.Grid_payersTableView.DataController.values[i, 7];
            ParamByName('ID_TYPE_STAGE').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 4];

             if ViewForm.Grid_payersTableView.DataController.values[i, 5] = 1
               then
                 begin
                  ParamByName('PERSENT').AsCurrency       := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('SUMMA').AsCurrency         := 0;
                 end
               else
                 begin
                  ParamByName('SUMMA').AsCurrency         := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('PERSENT').AsCurrency       := 0;
                 end;
            ExecProc;
       end;
       // end for

        Transaction.Commit;     // коммит общей транзакции

   // если контракт не коллективный, тогда обновляем датасет
       if StudersCounter = 1 then
        begin
          DM.DataSet.AfterScroll := nil;
           // удаляю из датасета расторженный контракт
          DM.DataSet.SQLs.DeleteSQL.Text:='execute procedure z_empty_proc';
          DM.DataSet.Delete;
           // добавляю в датасет переоформленный контракт
          fio.SortOrder := soNone;
          DM.DataSet.SQLs.InsertSQL.Text:='execute procedure z_empty_proc';
          DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT)+')';
          DM.DataSet.Insert;
          DM.DataSet.Post;
        end
       else
   // иначе перезабираем датасет
       begin
          wf:=ShowWaitForm(self,wfLoadPackage);
          DM.DataSet.AfterScroll := nil;
          DM.DataSet.Close;
          DM.DataSet.SelectSQL.Clear;
          DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                             ''''+ ViewForm.Num_Dog_Edit.Text+ ''''+ ',2';


          // права на сметы
          DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
          inttostr(cn_view) + ',' + inttostr(ID_ROLE)  + ''''+ TYPE_REESTR + ''''+ ')';
          DM.DataSet.Open;
          CloseWaitForm(wf);
       end;

       ViewForm.Free;

      CaptionsClear();
        if DM.DataSet['NAME_FACUL'] <> null then
        Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
        if DM.DataSet['NAME_SPEC']<> null then
        Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
        if DM.DataSet['NAME_GROUP']<> null then
        Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
        if DM.DataSet['KURS']<> null then
        Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
        if DM.DataSet['NAME_KAT_STUD']<> null then
        CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
        if DM.DataSet['NAME_FORM_STUD']<> null then
        FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
        if DM.DataSet['NAME_NAZIONAL']<> null then
        Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
        If DM.DataSet['NAME_DOG_STATUS']<> null
         Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
         Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
        DM.DataSet.AfterScroll := DataSetAfterOpen;
      except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
   end;
   if DmTr.StProc.Transaction.Active then DmTr.StProc.Transaction.Rollback;
      DmTr.Free;
   end;
end;

procedure TfrmContracts.cxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  Arect:TRect;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.Node.Values[6]<> 1) and (not AViewInfo.Node.Focused ))
   then
    begin
     //Дополнительные
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:= clInfoBk;  //$00EBCBA0;//$00C0CFDC;
     ACanvas.Canvas.FillRect(Arect);
    end;

  if ((AViewInfo.Node.Values[6]<> 1) and (AViewInfo.Node.Focused ))
   then
    begin
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:= $00B3FFFF; //$00DCA356; //$0096AEC5;
     ACanvas.Font.Color:= clWindowText ;
     ACanvas.Canvas.FillRect(Arect);
    end;

  //----------------------------------------------------------------------------
  if ((AViewInfo.Node.Values[5]= 1) and  (not AViewInfo.Node.Focused ))
   then
    begin
     //недействующий
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:=$00F2EFEC;
     ACanvas.Canvas.FillRect(Arect);
    end;

  if ((AViewInfo.Node.Values[5]= 1) and (AViewInfo.Node.Focused ))
   then
    begin
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:=$00B7B7B7;
     ACanvas.Canvas.FillRect(Arect);
    end;

  //----------------------------------------------------------------------------
  if CN_USE_EXT_COLOR = 1 then
   begin
    if ((AViewInfo.Node.Values[4] < date) and (AViewInfo.Node.Values[5] = 0 )and (not AViewInfo.Node.Focused))
     then
      begin
       Arect:=AViewInfo.BoundsRect;
       ACanvas.Canvas.Brush.Color:=$00D3C6FD;
       ACanvas.Canvas.FillRect(Arect);
      end;
    if ((AViewInfo.Node.Values[4] < date) and (AViewInfo.Node.Values[5] = 0 )and (AViewInfo.Node.Focused))
     then
      begin
       Arect:=AViewInfo.BoundsRect;
       ACanvas.Canvas.Brush.Color:=$006F46F9;
       ACanvas.Canvas.FillRect(Arect);
      end;

    //--------------------------------------------------------------------------
    if ((AViewInfo.Node.Values[9] <> 0) and (AViewInfo.Node.Values[9] <> 1) and (not AViewInfo.Node.Focused))
     then
      begin
       Arect:=AViewInfo.BoundsRect;
       ACanvas.Canvas.Brush.Color:=$00CBF1C7;
       ACanvas.Canvas.FillRect(Arect);
      end;
    if ((AViewInfo.Node.Values[9] <> 0) and (AViewInfo.Node.Values[9] <> 1) and (AViewInfo.Node.Focused))
     then
      begin
       Arect:=AViewInfo.BoundsRect;
       ACanvas.Canvas.Brush.Color:=$0054D046;
       ACanvas.Canvas.FillRect(Arect);
      end;  
   end;
end;

procedure TfrmContracts.BreakDown_ButtonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
    Result : TDissInfo;
    ID_DOG_ROOT_upt : int64;
    ss: TShiftState;
    key : Word;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  If not Is_Admin then
    If ((fibCheckPermission('/ROOT/Contracts/Cn_Reg','Done') <> 0) and
        (cxDBTreeList1.FocusedNode.Values[9] <> 2) and
        (cxDBTreeList1.FocusedNode.Values[9] <> 3))
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

  InParameter:= TcnSimpleParamsEx.Create;
  InParameter.Owner:=self;
  InParameter.Db_Handle:= DM.DB.Handle;
  InParameter.Formstyle:=fsNormal;
  InParameter.AMode := Edit;
  InParameter.cnParamsToPakage.ID_DOG_ROOT := DM.Dataset['ID_DOG_ROOT'];
  ID_DOG_ROOT_upt                          := DM.Dataset['ID_DOG_ROOT'];
  InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
  InParameter.cnParamsToPakage.Is_collect  := DM.Dataset['ISCOLLECT'];
  InParameter.ID_User := ID_User;
  InParameter.User_Name := User_Name;
  InParameter.cnParamsToPakage.ID_STUD     :=DM.Dataset['ID_STUD'];
  InParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
  if DM.DataSet['FIO'] = 'КОЛЕКТИВНИЙ ДОГОВІР'
   then InParameter.cnParamsToPakage.DissDownAllContract := true;
  InParameter.WaitPakageOwner:= frmContracts;
  InParameter.is_admin := is_admin;
  Result :=RunDissInfoFromPackage(InParameter, 'Contracts\cn_dt_DissInfo.bpl','ShowDTDissInfo');
  InParameter.Free;

 if Result.flag = 1
  then
   begin
       // -----------логирование расторжения------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Rastorg' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
           DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.Dataset['ID_DOG_LAST'];
           DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
           DM.StProc.Transaction.Commit;
      // если контракт не коллективный - обновляем запись в датасет
      if  DM.Dataset['ISCOLLECT'] = 0 then
      begin
        DM.DataSet.AfterScroll := nil;
        DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
        DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(ID_DOG_ROOT_upt)+')';
        DM.DataSet.Edit;
        DM.DataSet.Post;
      end
      else
      // иначе перезабираем датасет
       begin
          ss:=[ssShift] ;
          key :=13;
          Dog_Filter_EditKeyDown(self, key, ss);
       end;

      CaptionsClear();
        if DM.DataSet['NAME_FACUL'] <> null then
        Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
        if DM.DataSet['NAME_SPEC']<> null then
        Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
        if DM.DataSet['NAME_GROUP']<> null then
        Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
        if DM.DataSet['KURS']<> null then
        Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
        if DM.DataSet['NAME_KAT_STUD']<> null then
        CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
        if DM.DataSet['NAME_FORM_STUD']<> null then
        FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
        if DM.DataSet['NAME_NAZIONAL']<> null then
        Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];
        If DM.DataSet['NAME_DOG_STATUS']<> null
         Then Dog_status_label.caption:=Dog_status_label.caption + ': '+ DM.DataSet['NAME_DOG_STATUS']
         Else Dog_status_label.caption:=Dog_status_label.caption + ' не визначенно';
        DM.DataSet.AfterScroll := DataSetAfterOpen;
   end;
 Screen.Cursor := crDefault;
end;

procedure TfrmContracts.RastorgPri4ina_ButtonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
if DM.DataSet['ISDISSDOG'] = 1 then
begin
 InParameter:= TcnSimpleParamsEx.Create;
 InParameter.Owner:=self;
 InParameter.Db_Handle:= DM.DB.Handle;
 InParameter.Formstyle:=fsNormal;
 InParameter.AMode := View;
 InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
 InParameter.cnParamsToPakage.ID_STUD     := DM.Dataset['ID_STUD'];
 InParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 InParameter.WaitPakageOwner:= frmContracts;
 RunFunctionFromPackage(InParameter, 'Contracts\cn_dt_DissInfo.bpl','ShowDTDissInfo');
 InParameter.Free;
 Screen.Cursor := crDefault;
end;
end;

procedure TfrmContracts.cxDBTreeList1DblClick(Sender: TObject);
begin
  if not ExtraMode
   then EditButtonClick(Sender);
end;

procedure TfrmContracts.cxDBTreeList1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_delete then DeleteButtonClick(Sender);
if key = vk_space  then PayButtonClick(Sender);
end;

procedure TfrmContracts.cxDBTreeList1Click(Sender: TObject);
begin
   cxDBTreeList1.SetFocus;
end;

procedure TfrmContracts.AddPopClick(Sender: TObject);
begin
AddButtonClick(Sender);
end;

procedure TfrmContracts.EditPopClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmContracts.DeletePopClick(Sender: TObject);
begin
DeleteButtonClick(Sender);
end;

procedure TfrmContracts.RefreshPopClick(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TfrmContracts.BreakDownPopClick(Sender: TObject);
begin
BreakDown_ButtonClick(Sender);
end;

procedure TfrmContracts.UploadPopClick(Sender: TObject);
begin
UpLoad_ButtonClick(Sender);
end;

procedure TfrmContracts.PayPopClick(Sender: TObject);
begin
PayButtonClick(Sender);
end;

procedure TfrmContracts.LgotaPopClick(Sender: TObject);
begin
LgotaButtonClick(Sender);
end;

procedure TfrmContracts.EntryRestPopClick(Sender: TObject);
begin
EntryRestButtonClick(Sender);
end;

procedure TfrmContracts.ExitPopClick(Sender: TObject);
begin
ExitButtonClick(Sender);
end;

procedure TfrmContracts.cxDBTreeList1Change(Sender: TObject);
  var str: string;
    rect:TRect;   HintPos: TPoint;
begin
  Timer.Enabled := False;

 if ExtraMode then exit;

  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  if hwnd<>nil then hwnd.ReleaseHandle;

  hwnd:=THintWindow.Create(cxDBTreeList1);

    if cxDBTreeList1.FocusedNode.Values[6]<> '1'
     then
      begin
       str:='Це додатковий контракт';
       hwnd.Color := clInfoBk;
      end
     else
      if cxDBTreeList1.FocusedNode.Values[5]= '0'
       then
        begin
         str:='Це основний контракт';
         hwnd.Color := $00F7EAD9;
        end;

  if cxDBTreeList1.FocusedNode.Values[5]= '1' then
  begin
   str:='Цей контракт розірваний';
   hwnd.Color := $00F2EFEC;
  end;

  rect:=hwnd.CalcHintRect(255,str,nil);
  HintPos := cxDBTreeList1.ClientOrigin;
  Inc(HintPos.Y, cxDBTreeList1.Height+20);
  Inc(HintPos.X, cxDBTreeList1.Width-100);
  OffsetRect(rect, HintPos.X, HintPos.Y);

  hwnd.ActivateHint(rect, str);
  Timer.Enabled := True;
end;

procedure TfrmContracts.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  hwnd.ReleaseHandle;
end;

procedure TfrmContracts.PayerData_ButtonClick(Sender: TObject);
var
   ID_DOG_ROOT_Convert: int64;
   ID_DOG_Convert     : int64;
   ViewForm : TfrmPayeres_Info;
   i : integer;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  ViewForm := TfrmPayeres_Info.Create(self);
  ViewForm.PLanguageIndex := PLanguageIndex;

 // информация по плательщикам
 DM.ReadDataSet.Close;
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.TableView.DataController.RecordCount := ViewForm.TableView.DataController.RecordCount + 1;
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
   if DM.ReadDataSet['ISPERCENT'] =1 then
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
   else
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
   ViewForm.TableView.DataController.Values[ViewForm.TableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 ViewForm.ShowModal;

end;

procedure TfrmContracts.Timer1Timer(Sender: TObject);
begin
FilterActionExecute(Sender);
Timer1.Enabled := false;
end;

procedure TfrmContracts.LogClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
 AParameter.cnParamsToPakage.ID_DOG:=      DM.Dataset['ID_DOG_LAST'];
 AParameter.cnParamsToPakage.ID_STUD:=     DM.Dataset['ID_STUD'];
 AParameter.WaitPakageOwner:= frmContracts;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_Log.bpl','ShowLog');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContracts.ApostrofActionExecute(Sender: TObject);
begin
// if Dog_Filter_Edit.focused then
// begin
   Dog_Filter_Edit.Text:= Dog_Filter_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
// end;
end;

procedure TfrmContracts.RecoveryBtnClick(Sender: TObject);
var i: byte;
id_dog_root_as_int : int64;
begin
if Dm.DataSet.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Execute[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

if not EraseMod then
 begin
  With DM.StProc do
  try
           DM.StProc.StoredProcName := 'CN_DT_CONTRACT_RECOVERY';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
           DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.Dataset['ID_DOG_LAST'];
           DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
           DM.StProc.ExecProc;
       // -----------логирование восстановления ------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Recovery' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.DataSet['ID_DOG_ROOT'];
           DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.DataSet['ID_DOG_LAST'];
           DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.DataSet['ID_STUD'];
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;

        Transaction.Commit;     // коммит общей транзакции

      except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CONTRACT_RECOVERY',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;

                 // если контракт не коллективный - обновляем запись в датасет
      if  DM.Dataset['ISCOLLECT'] = 0 then
      begin
        DM.DataSet.AfterScroll := nil;
        DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
        id_dog_root_as_int := DM.Dataset['ID_DOG_ROOT'];
        DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID_HS(' + IntToStr(id_dog_root_as_int)+')';
        DM.DataSet.Edit;
        DM.DataSet.Post;
      end
      else
      // иначе перезабираем датасет
       begin
          wf:=ShowWaitForm(self,wfLoadPackage);
          DM.DataSet.AfterScroll := nil;
          DM.DataSet.Close;
          DM.DataSet.SelectSQL.Clear;
          DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                             ''''+ DM.DataSet['NUM_DOG'] + ''''+ ',2';


          // права на сметы
          DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
          inttostr(cn_view) + ',' + inttostr(ID_ROLE)+ ',' + ''''+ TYPE_REESTR + ''''+ ')';   
          DM.DataSet.Open;
          CloseWaitForm(wf);
       end;
 end
 else
  begin
  With DM.StProc do
  try
           DM.StProc.StoredProcName := 'CN_DT_CONTRACT_UNERASE';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
           DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.Dataset['ID_DOG_LAST'];
           DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
           DM.StProc.ExecProc;
       // -----------логирование восстановления ------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_UnErase' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := DM.DataSet['ID_DOG_ROOT'];
           DM.StProc.ParamByName('ID_DOG').AsInt64          := DM.DataSet['ID_DOG_LAST'];
           DM.StProc.ParamByName('ID_STUD').AsInt64         := DM.DataSet['ID_STUD'];
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;

        Transaction.Commit;     // коммит общей транзакции

      except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CONTRACT_UNERASE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;

       if DM.DataSet['ISCOLLECT'] = 0 then
        begin
          DM.DataSet.AfterScroll := nil;
          DM.DataSet.SQLs.DeleteSQL.Text:='execute procedure z_empty_proc';
          DM.DataSet.Delete;
          DM.DataSet.AfterScroll := DataSetAfterOpen;
        end
        else
         // иначе перезабираем датасет
        RefreshButtonClick(Self);
  end;
end;

procedure TfrmContracts.OrdersBtnClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.cnParamsToPakage.ID_STUD    := DM.Dataset['ID_STUD'];
  AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
  AParameter.WaitPakageOwner:= frmContracts;
  AParameter.is_admin := is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Orders.bpl','ShowOrders');
  AParameter.Free;
  Screen.Cursor := crDefault;
end;

procedure TfrmContracts.SelectBtnClick(Sender: TObject);
begin
       // если режим Абитуриента
        if ExtraMode then
         begin
          Res:=VarArrayCreate([0,2],varVariant);
          Res[0]:= ExtraInfo.ID_DOG;
          Res[1]:= ExtraInfo.ID_STUD;
          ModalResult := mrOk;
         end;
end;


procedure TfrmContracts.Erased_BtnClick(Sender: TObject);
 var
  wf:TForm;
begin
  screen.Cursor:= crHourGlass;
  ViewMenuButtons(false);
   wf:=ShowWaitForm(self,wfLoadPackage);
  DM.DataSet.close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_GET_DELETED_FILTER(' +
  inttostr(cn_view) + ',' + inttostr(ID_ROLE)+')';
  EraseMod := True;
  DM.DataSet.AfterScroll := nil;
  DM.DataSet.CloseOpen(true);
  CloseWaitForm(wf);
  DM.DataSet.AfterScroll := DataSetAfterOpen;
   DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
   DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
  screen.Cursor:= crDefault;
end;

procedure TfrmContracts.ExportDataBtnClick(Sender: TObject);
 procedure ReadDataSet(TableName: string; Condition: string; Res:TStringList);
  var i: integer;
  begin
    Dm.ReadDataSet.Close;
    Dm.ReadDataSet.SelectSQL.Clear;
    Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_RDB_GEN_NAMES_FIELDS('
                                      + '''' + TableName + '''' + ',' + '''' + Condition + '''' + ')';
    Dm.ReadDataSet.Open;
    Dm.ReadDataSet.FetchAll;
    Dm.ReadDataSet.First;
    if Dm.ReadDataSet.RecordCount > 0 then
    begin
      Res.Add('');
      Res.Add('/* Current table ' + UpperCase(TableName) + ' */');
      Res.Add('DELETE FROM ' + UpperCase(TableName) + ' ' + UpperCase(Condition) + ';');
    end;
     for i:= 0 to Dm.ReadDataSet.RecordCount-1 do
     begin
      Res.Add(Dm.ReadDataSet['RESULT'] + ';');
      Dm.ReadDataSet.Next;
     end;
//      Res.Add('');
    if Dm.ReadDataSet.RecordCount > 0 then
      Res.Add('COMMIT WORK;');
      Dm.ReadDataSet.Close;
  end;

var StringList:TStringList;
ID_dog_root_as_int, ID_stud_as_int, ID_dog_as_int: int64;
begin
  if SaveDialog.Execute then
  if SaveDialog.FileName<>'' then
    begin
      Screen.Cursor := crHourGlass;
      StringList:= TStringList.Create();
      StringList.Add('/* ' + DateTimeToStr(now)+ ' Script generated by ContractsSystem. Copyright © 2006-2007 Chernyavsky A.E. All rights reserved */' );
      ID_dog_root_as_int := DM.DataSet['ID_DOG_ROOT'];
      ID_stud_as_int := DM.DataSet['ID_STUD'];
      ID_dog_as_int := DM.DataSet['ID_DOG_LAST'];
        ReadDataSet('CN_DT_DOG_ROOT', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      , StringList);
        ReadDataSet('CN_DT_DOG', 'where id_dog=' + inttostr(ID_dog_as_int), StringList);
        ReadDataSet('CN_DT_DOG_DISS', 'where id_dog=' + inttostr(ID_dog_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int), StringList);
        ReadDataSet('CN_DT_DOG_SMET', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      +' and id_dog=' + inttostr(ID_dog_as_int)
                                      , StringList);
        ReadDataSet('CN_DT_DOG_STATUS', 'where id_dog=' + inttostr(ID_dog_as_int), StringList);
        ReadDataSet('CN_DT_ENTRS_SMET', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      , StringList);
        ReadDataSet('CN_DT_LGOT', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      , StringList);
        ReadDataSet('CN_DT_ORDERS', 'where id_stud=' + inttostr(ID_stud_as_int), StringList);
        ReadDataSet('CN_DT_PAYER_STAGE', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_dog=' + inttostr(ID_dog_as_int)
                                      , StringList);
        ReadDataSet('CN_DT_STAGE_OPL', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      +' and id_dog=' + inttostr(ID_dog_as_int), StringList);
        ReadDataSet('CN_DT_STUD', 'where id_stud=' + inttostr(ID_stud_as_int), StringList);
        ReadDataSet('CN_DT_STUD_INF', 'where id_dog_root=' + inttostr(ID_dog_root_as_int)
                                      +' and id_stud=' + inttostr(ID_stud_as_int)
                                      +' and id_dog=' + inttostr(ID_dog_as_int), StringList);
        ReadDataSet('CN_DT_DOG_DISS', 'where id_stud=' + inttostr(ID_stud_as_int), StringList);
        ReadDataSet('PUB_DT_ALL_PROV', 'where KR_ID_DOG=' + inttostr(ID_stud_as_int), StringList);

      StringList.SaveToFile(SaveDialog.FileName); // Сохраняю результат
      StringList.Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TfrmContracts.btnTwainClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG     := DM.Dataset['ID_DOG_LAST'];
 AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 AParameter.WaitPakageOwner:= frmContracts;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_Scan.bpl','cnLoadTwain');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContracts.dxBarLargeButton2Click(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  If cxDBTreeList1.DataController.RecordCount = 0 then exit;
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.ID_User:=ID_user;
  AParameter.WaitPakageOwner:= frmContracts;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_reestr.bpl','ShowReg');
  AParameter.Free;
  RefreshButtonClick(self);
  Screen.Cursor := crDefault;
end;

procedure TfrmContracts.ChangeStatusClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
  id_dog, id_dog_root,id_status:int64;
  Sql,sid_dog_last,sid_dog_root,suse_end:String;
begin
  If not Is_Admin then
  If (fibCheckPermission('/ROOT/Contracts/Cn_Reg','Change') <> 0)
   then
     Begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   Begin
    Id_status:=res[0];
    id_dog:=Dm.DataSet['ID_DOG_LAST'];
    Id_dog_root:=DM.DataSet['ID_DOG_ROOT'];

    dm.WriteTransaction.StartTransaction;
    dm.StProc.StoredProcName:='CN_DT_DOG_STATUS_CHANGE';
    dm.StProc.Prepare;
    dm.StProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
    dm.StProc.ParamByName('ID_DOG_STATUS').AsInt64:=id_status;
    dm.StProc.ParamByName('NOTE').AsString:='Change status';
    dm.StProc.ExecProc;
    try
     dm.WriteTransaction.Commit;
     dm.StProc.Close;
    except
     dm.WriteTransaction.Rollback;
     dm.StProc.Close;
    End;

    DM.dataSet.SQLs.UpdateSQL.Text:='Update cn_dt_dog set id_dog_status='+IntToStr(res[0])+' Where id_dog_root='+IntToStr(id_dog_root)+' And id_dog='+IntToStr(Id_dog);
    DM.DataSet.Edit;
    DM.DataSet.FieldByName('NAME_DOG_STATUS').asString:=res[1];

    DM.DataSet.Locate('ID_DOG_LAST',id_dog,[]);
   End;
end;

procedure TfrmContracts.ver_dog_popClick(Sender: TObject);
var
  T:TfrmVer_dog;
begin
  T:=TfrmVer_dog.Create(Self);
  T.Button_ok.Caption:=     cnConsts.cn_Accept[PLanguageIndex];
  T.Button_cancel.Caption:= cnConsts.cn_Cancel[PLanguageIndex];
  T.aHandle:=Dm.DB.Handle;
  T.ShowModal;
  if T.ModalResult=mrOk then
   Begin
    Screen.Cursor := crHourGlass;
    wf:=ShowWaitForm(self,wfLoadPackage);
    DM.DataSet.AfterScroll := nil;
    DM.DataSet.Close;
    DM.DataSet.SelectSQL.Text:= 'select a.* from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                                ''''+
                                StringPrepareToApostrofText(UpperCaseRusUkr('%'))
                                + ''''+',2';
    DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' +
    inttostr(Cn_View) + ',' + inttostr(ID_User) + ','+ ''''+ TYPE_REESTR + '''' + ') a';

    if not T.All_work_dog_chek.Checked
     then DM.DataSet.SQLs.SelectSQL.Add(' inner join cn_verification_of_input(:date_beg_ver,:date_end_ver) b ')
     else DM.DataSet.SQLs.SelectSQL.Add(' inner join CN_VERIFICATION_ALL_DOGS b ');

      DM.DataSet.SQLs.SelectSQL.Add(' on a.num_dog=b.num_dog');

    if T.CheckBox_projects.Checked
       then DM.DataSet.SQLs.SelectSQL.Add('Where b.name_dog_status<>'+'''проект''');

    if not T.All_work_dog_chek.Checked then
     Begin
      DM.DataSet.ParamByName('date_beg_ver').AsDate:=T.Date_edit_Date_beg.EditValue;
      DM.DataSet.ParamByName('date_end_ver').AsDate:=T.Date_edit_Date_end.EditValue;
     end; 

    DM.DataSet.Open;
    Screen.Cursor := crDefault;
    DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);

    Fio.SortOrder := soNone;

    DM.DataSet.AfterScroll := DataSetAfterOpen;
   End;
  T.Free;
end;

procedure TfrmContracts.NNumReestrClick(Sender: TObject);
var
  T: TfmCnViewReestrData;
  id: Int64;
begin
  if (DM.DataSet.FieldByName('ID_REESTR').IsNull) then
    id:=0
  else
    id:=DM.DataSet['ID_REESTR'];
  T:=TfmCnViewReestrData.Create(self);
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_REESTR where ID_REESTR='+IntToStr(id);
  Dm.ReadDataSet.Open;
  Dm.ReadDataSet.FetchAll;
  if dm.ReadDataSet.RecordCount>0 then
  begin
    T.cxTextNum.Text:=DM.ReadDataSet.FieldbyName('NUM_REESTR').AsString;
    T.cxTextData.Text:=DM.ReadDataSet.FieldbyName('DATE_REESTR').AsString;
    T.cxTextNote.Text:=DM.ReadDataSet.FieldbyName('NOTE').AsString;
  end;
  DM.ReadDataSet.Close;
  T.ShowModal;
  T.Free;
end;

procedure TfrmContracts.dxBarButton4Click(Sender: TObject);
Var
  T:Tfrm_comments;
begin
  T:=Tfrm_comments.create(self,DM.DB.Handle,is_admin, DM.DataSet['ID_DOG_LAST'], DM.DataSet['ID_STUD']);
  T.ShowModal;
  T.Free;
end;

procedure TfrmContracts.Dog_Filter_EditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 flag_fio : boolean;
 i        : integer;
begin
  if Dog_Filter_Edit.CurText = '' then Exit;

  If ((IntegerCheck(Dog_Filter_Edit.CurText))and (Length(Dog_Filter_Edit.CurText) = 10))
   then FiltrByKod_RadioButton.Checked := True
   else
    Begin
     i:=1; flag_fio := True;
     While ((Length(Dog_Filter_Edit.CurText) >= i) and (flag_fio)) do
      Begin
       if Dog_Filter_Edit.CurText[i] in ['0'..'9'] then flag_fio := False;
       i := i + 1;
      end;

     If flag_fio
      then FiltrByFIO_RadioButton.Checked := True
      else FiltrByNum_RadioButton.Checked := True;
    end;
end;

end.

