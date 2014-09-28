//******************************************************************************
// Проект "Контракты"
// Реестр контрактов
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_ContractsList_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, cn_Common_Funcs, cn_Common_Messages, cnConsts,
  StdCtrls, cxLabel, ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxTextEdit, cxCalendar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCurrencyEdit, cxCheckBox, ActnList,
  cxRadioGroup, cxGroupBox, FIBDataSet, pFIBDataSet, DM_ContractsList, IBase,
  cn_Common_Types, cn_Common_Loader, cxTL, cxMaskEdit, cxInplaceContainer,
  cxDBTL, cxTLData, cn_ContractsList_Oplata, cn_Common_WaitForm, cn_Select_Payer_Unit,
  Placemnt, cxLookAndFeelPainters, cxButtons;
  //PrintLoader;

type
  TStudBasicInfo = record
   ID_STUD : int64;
   ID_MAN  : int64;
   FIO     : string;
   Entry_Rest : Currency;
   ID_MAN_PARENT: int64;
  end;

type
  TfrmContractsList = class(TForm)
    PopupImageList: TImageList;
    DisabledLargeImages: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    StatusBarTop: TdxStatusBar;
    Footer_Panel: TPanel;
    Footer_Bevel: TBevel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    Faculty_Footer_Label: TLabel;
    Spec_Footer_Label: TLabel;
    Group_Footer_Label: TLabel;
    Gragdanstvo_Footer_Label: TLabel;
    CategoryStudy_Footer_Label: TLabel;
    FormStudy_Footer_Label: TLabel;
    Kurs_Footer_Label: TLabel;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
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
    LargeImages: TImageList;
    ID_TYPE_DOG: TcxDBTreeListColumn;
    Timer1: TTimer;
    ID_STUD_AS_TEXT_col: TcxDBTreeListColumn;
    ID_FACUL_AS_TEXT_col: TcxDBTreeListColumn;
    ID_DOG_AS_TEXT_col: TcxDBTreeListColumn;
    ID_GROUP_AS_TEXT_col: TcxDBTreeListColumn;
    KURS_col: TcxDBTreeListColumn;
    ismaindog_col: TcxDBTreeListColumn;
    id_dog_stat: TcxDBTreeListColumn;
    SelectAct: TAction;
    BarManager: TdxBarManager;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    DsetRecordCount: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    dxBarStatic4: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    dxBarStatic6: TdxBarStatic;
    dxBarStatic7: TdxBarStatic;
    Select_button: TdxBarLargeButton;
    RefreshButton: TdxBarButton;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    FiltrByKod_RadioButton: TcxRadioButton;
    lookButton: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
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
    procedure SelectButtonClick(Sender: TObject);
    procedure cxDBTreeList1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LgotaButtonClick(Sender: TObject);
    procedure cxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Dog_Filter_EditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FiltrByFIO_RadioButtonClick(Sender: TObject);
    procedure FiltrByNum_RadioButtonClick(Sender: TObject);
    procedure FiltrByKod_RadioButtonClick(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure lookButtonClick(Sender: TObject);
  private
    InSumma : Currency;
    IsSummaExist: boolean;
    CurrentConnect : TCurrentConnect;

    wf : TForm;

    ID_PAYER_fromPak : int64;
    ID_TYPE_PAYER_fromPak : int64;
    ID_MAN_fromPak : int64;
    FIO_PAYER_fromPak : string;
    BIRTH_DATE_fromPak : TDate;
    BEG_DATE_STUDY_fromPak :TDate;
    END_DATE_STUDY_fromPak :TDate;

    //is_admin : Int64;

    NameFak_FromPack      : string;
    NameSpec_FromPack     : string;
    NameNazional_FromPack : string;
    NameFormStud_FromPack : string;
    NameKatStud_FromPack  : string;
    Kurs_FromPack         : string;
    NameGroup_FromPack    : string;

    ReturnMode : string;
    BarCode    : int64;
    procedure FormIniLanguage;
    procedure CaptionsClear();
  public
    DM:TDM_CL;
    CN_USE_EXT_COLOR : Integer;
    constructor  Create(CParameter:TcnSimpleParamsEx);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;

  var frmContractsList :TfrmContractsList;
      res:Variant; kstr: string;
implementation

uses FIBQuery, pFIBStoredProc, pFIBQuery, cn_ContractsList_Look;


{$R *.dfm}
procedure TfrmContractsList.CaptionsClear();
begin
  Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[CurrentConnect.PLanguageIndex];
  Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[CurrentConnect.PLanguageIndex];
  Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[CurrentConnect.PLanguageIndex];
  Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[CurrentConnect.PLanguageIndex];
  CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[CurrentConnect.PLanguageIndex];
  FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[CurrentConnect.PLanguageIndex];
  Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[CurrentConnect.PLanguageIndex];
end;

procedure TfrmContractsList.DataSetAfterOpen(DataSet: TDataSet);
begin
  CaptionsClear();
  if DataSet['NAME_FACUL']<> null
   then Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DataSet['NAME_FACUL'];
  if DataSet['NAME_SPEC']<> null
   then Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DataSet['NAME_SPEC'];
  if DataSet['NAME_GROUP']<> null
   then Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DataSet['NAME_GROUP'];
  if DataSet['KURS']<> null
   then Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DataSet['KURS']);
  if DataSet['NAME_KAT_STUD']<> null
   then CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DataSet['NAME_KAT_STUD'];
  if DataSet['NAME_FORM_STUD']<> null
   then FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DataSet['NAME_FORM_STUD'];
  if DataSet['NAME_NAZIONAL']<> null
   then Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DataSet['NAME_NAZIONAL'];
end;

procedure TfrmContractsList.DataSetAfterScroll(DataSet: TDataSet);
begin
CaptionsClear();
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
end;

constructor TfrmContractsList.Create(CParameter:TcnSimpleParamsEx);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(CParameter.Owner);

  DM:=TDM_CL.Create(Self);
  DM.DB.Handle:=CParameter.Db_Handle;
  CurrentConnect.Db_Handle:= CParameter.Db_Handle;
  //is_admin := CParameter.cnParamsToPakage.is_admin;

  IsSummaExist := CParameter.cnParamsToPakage.IsWithSumma;
  if IsSummaExist then
     InSumma      := CParameter.cnParamsToPakage.Summa;
  DM.DataSet.SQLs.SelectSQL.clear;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_PUB_SYS_DATA_GET_ALL';
  DM.DataSet.Open;
  if DM.DataSet['CN_USE_EXT_COLOR'] <> null then CN_USE_EXT_COLOR := DM.DataSet['CN_USE_EXT_COLOR'] else CN_USE_EXT_COLOR := 1;
  DM.DataSet.Close;
  DM.DataSet.AfterOpen  :=  DataSetAfterOpen;
  DM.DataSet.AfterScroll:=  DataSetAfterScroll;
  cxDBTreeList1.DataController.DataSource := DM.DataSource;
  if CParameter.ReturnMode <> null then ReturnMode := CParameter.ReturnMode;
  if ReturnMode = 'Multy' then cxDBTreeList1.OptionsSelection.MultiSelect := true;
  FormIniLanguage;
  HotKey_StatusBar.Panels[0].Text := HotKey_StatusBar.Panels[0].Text + CParameter.cnParamsToPakage.Note;
  Screen.Cursor:=crDefault;
  RefreshButton.Click;
  if ((CParameter.cnParamsToPakage.BarCode <> '') and
      (CParameter.cnParamsToPakage.BarCode <> null) and
      (CParameter.cnParamsToPakage.BarCode <> '-1'))
   then BarCode := StrToInt64(CParameter.cnParamsToPakage.BarCode)
   else BarCode := -1;
end;

procedure TfrmContractsList.FormIniLanguage;
begin
 // индекс языка (1-укр, 2 - рус)
 CurrentConnect.PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_sp_ContractsList[CurrentConnect.PLanguageIndex];
 //названия кнопок
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[CurrentConnect.PLanguageIndex];
 Select_button.Caption :=       cnConsts.cn_SelectBtn_Caption[CurrentConnect.PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[CurrentConnect.PLanguageIndex];
 PayButton.Caption:=            cnConsts.cn_Pay_Caption[CurrentConnect.PLanguageIndex];
 LgotaButton.Caption:=          cnConsts.cn_Lgota_Caption[CurrentConnect.PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[CurrentConnect.PLanguageIndex];
 //SelectButton.Hint:=         cnConsts.cn_SelectBtn_Caption[CurrentConnect.PLanguageIndex];
 EntryRestButton.Caption:=      cnConsts.cn_EntryRest_Caption[CurrentConnect.PLanguageIndex];
 //статусбар
 StatusBarTop.Panels[0].Text:=  cnConsts.cn_RefreshBtn_ShortCut[CurrentConnect.PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[CurrentConnect.PLanguageIndex];
 StatusBarTop.Panels[1].Text:=  cnConsts.cn_FilterBtn_ShortCut[CurrentConnect.PLanguageIndex]  + cnConsts.cn_FilterBtn_Caption[CurrentConnect.PLanguageIndex];
 StatusBarTop.Panels[2].Text:=  cnConsts.cn_EnterBtn_ShortCut[CurrentConnect.PLanguageIndex]     + cnConsts.cn_SelectBtn_Caption[CurrentConnect.PLanguageIndex];
 StatusBarTop.Panels[3].Text:=  cnConsts.cn_ExitBtn_ShortCut[CurrentConnect.PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[CurrentConnect.PLanguageIndex];
 StatusBarTop.Hint:=            cnConsts.cn_HotKeys[CurrentConnect.PLanguageIndex];
 HotKey_StatusBar.Panels[0].Text:=cnConsts.cn_Osnovanie[CurrentConnect.PLanguageIndex]+ ': ';
 // Грид
 fio.Caption.Text:=             cnConsts.cn_grid_FIO_Column[CurrentConnect.PLanguageIndex];
 date_dog.Caption.Text:=        cnConsts.cn_grid_Date_Dog_Column[CurrentConnect.PLanguageIndex];
 num_dog.Caption.Text:=         cnConsts.cn_grid_Num_Dog_Column[CurrentConnect.PLanguageIndex];
 beg_date.Caption.Text:=        cnConsts.cn_grid_Date_Beg[CurrentConnect.PLanguageIndex];
 end_date.Caption.Text:=        cnConsts.cn_grid_Date_End[CurrentConnect.PLanguageIndex];
 isdiss.Caption.Text:=          cnConsts.cn_grid_IsDiss_Column[CurrentConnect.PLanguageIndex];

 // Футер
 Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[CurrentConnect.PLanguageIndex];
 Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[CurrentConnect.PLanguageIndex];
 Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[CurrentConnect.PLanguageIndex];
 Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[CurrentConnect.PLanguageIndex];
 CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[CurrentConnect.PLanguageIndex];
 FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[CurrentConnect.PLanguageIndex];
 Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[CurrentConnect.PLanguageIndex];
 // Фильтр
 Dog_Filter_Edit.Caption:=          cnConsts.cn_SearchBtn_Caption[CurrentConnect.PLanguageIndex];
 FiltrByFIO_RadioButton.Caption:=         cnConsts.cn_FiltrByFIO[CurrentConnect.PLanguageIndex];
 FiltrByNum_RadioButton.Caption:=         cnConsts.cn_FiltrByNum[CurrentConnect.PLanguageIndex];
 FiltrByKod_RadioButton.Caption:=         'Штрих-Код';

 //GlobalFilterButton.Caption:=             cnConsts.cn_FilterBtn_Caption[CurrentConnect.PLanguageIndex];
 //GlobalFilterButton.Hint:=                cnConsts.cn_FilterBtn_Caption[CurrentConnect.PLanguageIndex];

 //Dog_Filter_Edit.Text:=                   cnConsts.cn_FilterText[CurrentConnect.PLanguageIndex];
 DsetRecordCount.Caption:=                cnConsts.cn_DSetRecordCount[CurrentConnect.PLanguageIndex];
end;

procedure TfrmContractsList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmContractsList.ExitButtonClick(Sender: TObject);
begin
  res:=null;
  close;
end;

procedure TfrmContractsList.FilterActionExecute(Sender: TObject);
begin
  Dog_Filter_Edit.Setfocus;
end;

procedure TfrmContractsList.Dog_Filter_EditEnter(Sender: TObject);
begin
  if Dog_Filter_Edit.Text = cnConsts.cn_FilterText[CurrentConnect.PLanguageIndex]
   then Dog_Filter_Edit.Text:= '';
end;

procedure TfrmContractsList.Dog_Filter_EditKeyPress(Sender: TObject;
  var Key: Char);
  function CtrlPressed():boolean;
   begin
    result:= HiWord(GetAsyncKeyState(VK_CONTROL))>0;       //Зажат ли
   end;
begin
  If key = #13 then cxDBTreeList1.SetFocus;
 { If (CtrlPressed) then Exit;

  If ( ((key <> #8) and (key <> '/')) and (key <> '-')) then
   If not IntegerCheck(Key)
    then FiltrByFIO_RadioButton.Checked := True
    else FiltrByNum_RadioButton.Checked := true;}
end;

procedure TfrmContractsList.RefreshButtonClick(Sender: TObject);
begin
  screen.Cursor:= crHourGlass;
  DM.DataSet.close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_SELECT_HS(1, -1, null)';
  DM.DataSet.CloseOpen(true);
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[CurrentConnect.PLanguageIndex];
  DsetRecordCount.Caption:=   DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
  screen.Cursor:= crDefault;
end;

procedure TfrmContractsList.FormShow(Sender: TObject);
begin
  if DM.DataSet.Active then
   Begin
    DataSetAfterOpen(DM.DataSet);
    DM.DataSet.First;
    if DM.DataSet.RecordCount >0 then cxDBTreeList1.DataController.FocusedRecordIndex :=0;
    DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
   end;
  if BarCode <> -1
   then
    begin
      Dog_Filter_Edit.Text := IntToStr(BarCode);
      FiltrByKod_RadioButton.Checked := True;
      FilterExecute_ButtonClick(Self);
    end;
  cxDBTreeList1.SetFocus;  
end;

procedure TfrmContractsList.EntryRestButtonClick(Sender: TObject);
Var
 AParameter : TcnSimpleParamsEx;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
  AParameter.cnParamsToPakage.ID_STUD:= DM.Dataset['ID_STUD'];
  AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
  AParameter.WaitPakageOwner:= frmContractsList;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_EntryRest.bpl','ShowEntryRest');
  AParameter.Free;
  Screen.Cursor := crDefault;
end;

procedure TfrmContractsList.PayButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.WaitPakageOwner:= frmContractsList;
 AParameter.cnParamsToPakage.ID_STUD:=DM.DataSet['ID_STUD'];
 AParameter.cnParamsToPakage.ID_DOG_ROOT:=DM.DataSet['ID_DOG_ROOT'];
 RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_PaymentAnalysis.bpl','ShowPayment');
 end;

procedure TfrmContractsList.Dog_Filter_EditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  wf:TForm;
  Fam, Imya, Otch, FIO_Search: String;
  p, len_FIO :integer;
begin
  if Dog_Filter_Edit.Text = '' then exit;
  if key = vk_return then
   begin
    FIO_Search := Dog_Filter_Edit.CurText;
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

  DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' + '1, -1' + ','+ ''''+ 'O' + '''' + ')';
  DM.DataSet.Open;
  Screen.Cursor := crDefault;
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[CurrentConnect.PLanguageIndex];
  DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
  CloseWaitForm(wf);
  cxDBTreeList1.SetFocus;
 end;
end;

procedure TfrmContractsList.FilterExecute_ButtonClick(Sender: TObject);
var
  ss: TShiftState;
  key : Word;
begin
  Dog_Filter_Edit.SetFocus;
  ss:=[ssShift] ;
  key :=13;
  Dog_Filter_EditKeyDown(self, key, ss);
  cxDBTreeList1.SetFocus;
end;

procedure TfrmContractsList.DsetRecordCountClick(Sender: TObject);
begin
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[CurrentConnect.PLanguageIndex];
  DsetRecordCount.Caption:=   DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
end;

procedure TfrmContractsList.SelectButtonClick(Sender: TObject);
var
     frmContractsList_Oplata : TfrmContractsList_Oplata;
     frmSelectPayer: TfrmSelectPayer;
     id_session_smet,
     CN_CUR_SMET_record_count, cn_kod_dog: integer;
     ID_STUD_as_int, ID_DOG_as_int, ID_DOG_ROOT_as_int,
     ID_FACUL_as_int, ID_GROUP_as_int, id_dog_root : int64;
     i: integer;
     SMLINING : Smallint;
     RecMultiSelected : integer;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  if ReturnMode = 'Single' then
   begin
    //общие сведения о проживающем
    NameFak_FromPack      :=' ';
    NameSpec_FromPack     :=' ';
    NameNazional_FromPack :=' ';
    NameFormStud_FromPack :=' ';
    NameKatStud_FromPack  :=' ';
    Kurs_FromPack         :=' ';
    NameGroup_FromPack    :=' ';

    if DM.DataSet['NAME_FACUL']<> null then NameFak_FromPack       := DM.DataSet['NAME_FACUL'];
    if DM.DataSet['NAME_SPEC']<> null then NameSpec_FromPack          := DM.DataSet['NAME_SPEC'];
    if DM.DataSet['NAME_GROUP']<> null then NameGroup_FromPack         := DM.DataSet['NAME_GROUP'];
    if DM.DataSet['KURS']<> null then Kurs_FromPack          := inttostr(DM.DataSet['KURS']);
    if DM.DataSet['name_kat_stud']<> null then NameKatStud_FromPack := DM.DataSet['name_kat_stud'];
    if DM.DataSet['name_form_stud']<> null then NameFormStud_FromPack     := DM.DataSet['name_form_stud'];
    if DM.DataSet['name_nazional']<> null then NameNazional_FromPack   := DM.DataSet['name_nazional'];

    ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
    ID_STUD_as_int:= DM.Dataset['ID_STUD'];
    ID_DOG_as_int := DM.Dataset['ID_DOG_LAST'];

    ID_FACUL_as_int := DM.Dataset['ID_FACUL'];
    ID_GROUP_as_int := DM.Dataset['ID_GROUP'];

    Res:=VarArrayCreate([0,1],varVariant);
    res[0]:=VarArrayOf([ID_DOG_as_int, ID_STUD_as_int, ID_FACUL_as_int, ID_GROUP_as_int,
                                    DM.DataSet['FIO'],
                                    DM.DataSet['NUM_DOG'],
                                    NameFak_FromPack, // факультет
                                    NameSpec_FromPack, // специальность
                                    NameNazional_FromPack, // гражданство
                                    NameFormStud_FromPack, // форма обучения
                                    NameKatStud_FromPack, // категория обучения
                                    Kurs_FromPack, // курс
                                    NameGroup_FromPack,
                                    ID_DOG_ROOT // группа
                                     ]);
    close;
    exit;
   end;

  if ReturnMode = 'Multy' then
   begin
    RecMultiSelected:= cxDBTreeList1.SelectionCount;
    res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
    for i:=0 to cxDBTreeList1.SelectionCount-1 do
     begin
      ID_STUD_as_int:= cxDBTreeList1.Selections[i].Values[8];
      ID_DOG_as_int := cxDBTreeList1.Selections[i].Values[7];
      ID_FACUL_as_int := cxDBTreeList1.Selections[i].Values[9];
      ID_GROUP_as_int := cxDBTreeList1.Selections[i].Values[10];
      Kurs_FromPack   := cxDBTreeList1.Selections[i].Values[11];

      res[i]:=VarArrayOf([ID_DOG_as_int, ID_STUD_as_int, ID_FACUL_as_int, ID_GROUP_as_int,
                            Kurs_FromPack]);
     end;
    close;
    exit;
   end;

//----------------------------------------------------------------------------------------------------
//производим выбор плательщика по договору
  frmSelectPayer := TfrmSelectPayer.Create(CurrentConnect,
                                           DM.Dataset['ID_DOG_ROOT'],
                                           DM.Dataset['ID_DOG_LAST'],
                                           DM.Dataset['ID_STUD'] );
                                           
  if frmSelectPayer.DM_PS.DataSet.RecordCount = 1 then
   begin
    ID_PAYER_fromPak :=0;
    ID_TYPE_PAYER_fromPak :=0;
    FIO_PAYER_fromPak :='';
    ID_PAYER_fromPak :=      frmSelectPayer.DM_PS.DataSet['ID_PAYER'];
    ID_TYPE_PAYER_fromPak := frmSelectPayer.DM_PS.DataSet['ID_TYPE_PAYER'];
    If frmSelectPayer.DM_PS.DataSet['FIO_PAYER'] <> null
     then FIO_PAYER_fromPak :=     frmSelectPayer.DM_PS.DataSet['FIO_PAYER']
     else FIO_PAYER_fromPak:=' ';
    frmSelectPayer.Free;
   end
   else
    if frmSelectPayer.ShowModal = mrOk then
     begin
      ID_PAYER_fromPak :=0;
      ID_TYPE_PAYER_fromPak :=0;
      FIO_PAYER_fromPak :='';

      ID_PAYER_fromPak :=      frmSelectPayer.DM_PS.DataSet['ID_PAYER'];
      ID_TYPE_PAYER_fromPak := frmSelectPayer.DM_PS.DataSet['ID_TYPE_PAYER'];
      if frmSelectPayer.DM_PS.DataSet['FIO_PAYER'] <> null then
        FIO_PAYER_fromPak :=     frmSelectPayer.DM_PS.DataSet['FIO_PAYER']
       else FIO_PAYER_fromPak:=' ';
      frmSelectPayer.Free;
     end
    else
     begin
      frmSelectPayer.Free;
      exit;
     end;

////////
 if not IsSummaExist then
 begin
   frmContractsList_Oplata := TfrmContractsList_Oplata.Create(Self, CurrentConnect, DM.DataSet['ID_STUD']);

   frmContractsList_Oplata.ReportNeed.ID_DOG_LAST := DM.Dataset['ID_DOG_LAST'];
   frmContractsList_Oplata.ReportNeed.ID_STUD     := DM.Dataset['ID_STUD'];
   frmContractsList_Oplata.ReportNeed.FIO         := DM.Dataset['FIO'];
   frmContractsList_Oplata.ReportNeed.NUM_DOG     := DM.Dataset['NUM_DOG'];

   frmContractsList_Oplata.FIO_Edit.Text    := DM.DataSet['FIO'];
   frmContractsList_Oplata.DateBegEdit.Date := DM.DataSet['DATE_BEG'];
   frmContractsList_Oplata.DateEndEdit.Date := DM.DataSet['DATE_END'];
   if frmContractsList_Oplata.showmodal = mrOk then
     begin
     // --------------запуск процедуры st_smet------------------------------
              // проверка лининга
              DM.ReadDataSet.Close;
              DM.ReadDataSet.SelectSQL.Clear;
              DM.ReadDataSet.SelectSQL.Text:='select SMLINING from CN_SMLINING_CHECK';
              DM.ReadDataSet.Open;
              SMLINING := DM.ReadDataSet['SMLINING'];
              DM.ReadDataSet.Close;

                ID_STUD_as_int:= DM.Dataset['ID_STUD'];
                ID_DOG_as_int := DM.Dataset['ID_DOG_LAST'];
                ID_DOG_ROOT_as_int := DM.Dataset['ID_DOG_ROOT'];

              // cn_smet
              DM.StProc.StoredProcName := 'CN_SMET';
              DM.StProc.Transaction.StartTransaction;
              DM.StProc.Prepare;
              DM.StProc.ParamByName('ID_STUD').AsInt64 := DM.DataSet['ID_STUD'];
              DM.StProc.ParamByName('DSUM').AsFloat := frmContractsList_Oplata.SummaEdit.Value;
              DM.StProc.ParamByName('SMLINING').AsInteger:= SMLINING;
              DM.StProc.ParamByName('CNDONACH').AsShort :=  0;
              DM.StProc.ExecProc;
               id_session_smet:= DM.StProc.ParamByName('ID_SESSION').AsInt64;
               CN_CUR_SMET_record_count:= DM.StProc.ParamByName('TOTAL').AsInteger;
              try
               begin
                DM.StProc.Transaction.Commit;
                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.SelectSQL.Text:='select CN_KOD_DOG from PUB_SYS_DATA';
                DM.ReadDataSet.Open;
                 if (DM.ReadDataSet['CN_KOD_DOG'] = null)
                  then cn_kod_dog  := 23499
                  else cn_kod_dog:=DM.ReadDataSet['CN_KOD_DOG'];
                DM.ReadDataSet.close;


                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.SelectSQL.Text:='select * from CN_OPL_INFO_COMPLEX_SELECT('+
                                              inttostr(ID_STUD_as_int) + ','+ inttostr(ID_DOG_as_int)
                                       + ','+ inttostr(ID_DOG_ROOT_as_int)
                                       +')';
                DM.ReadDataSet.Open;

                // ID_PAYER_fromPak :=0;
               //  ID_TYPE_PAYER_fromPak :=0;
                 ID_MAN_fromPak :=0;
               //  FIO_PAYER_fromPak :='';
                 BIRTH_DATE_fromPak :=0;
                 BEG_DATE_STUDY_fromPak :=0;
                 END_DATE_STUDY_fromPak :=0;

                // ID_PAYER_fromPak :=      DM.ReadDataSet['ID_PAYER'];
                // ID_TYPE_PAYER_fromPak := DM.ReadDataSet['ID_TYPE_PAYER'];
                 ID_MAN_fromPak :=        DM.ReadDataSet['ID_MAN'];
                //  if DM.ReadDataSet['FIO_PAYER'] <> null then
                //    FIO_PAYER_fromPak :=     DM.ReadDataSet['FIO_PAYER']
                //  else
                //    FIO_PAYER_fromPak:=' ';

                 if DM.ReadDataSet['BIRTH_DATE'] <> null then
                    BIRTH_DATE_fromPak :=    DM.ReadDataSet['BIRTH_DATE']
                 else
                    BIRTH_DATE_fromPak := strtodate('01.01.1900');
                 if DM.ReadDataSet['BEG_DATE_STUDY'] <> null then
                 BEG_DATE_STUDY_fromPak :=DM.ReadDataSet['BEG_DATE_STUDY'];
                 if DM.ReadDataSet['END_DATE_STUDY'] <> null then
                 END_DATE_STUDY_fromPak :=DM.ReadDataSet['END_DATE_STUDY'];
                DM.ReadDataSet.Close;


                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.selectsql.text:='select * from CN_CUR_SMET_SELECT('+ IntToStr(id_session_smet)+')';
                DM.ReadDataSet.open;
                DM.ReadDataSet.fetchall;
                Res:=VarArrayCreate([0,CN_CUR_SMET_record_count+1],varVariant);
                // общие сведения о проживающем

                  NameFak_FromPack      :=' ';
                  NameSpec_FromPack     :=' ';
                  NameNazional_FromPack :=' ';
                  NameFormStud_FromPack :=' ';
                  NameKatStud_FromPack  :=' ';
                  Kurs_FromPack         :=' ';
                  NameGroup_FromPack    :=' ';

                if DM.DataSet['SHORT_FAC']<> null then
                NameFak_FromPack       := DM.DataSet['SHORT_FAC'];
                if DM.DataSet['NAME_SPEC']<> null then
                NameSpec_FromPack          := DM.DataSet['NAME_SPEC'];
                if DM.DataSet['NAME_GROUP']<> null then
                NameGroup_FromPack         := DM.DataSet['NAME_GROUP'];
                if DM.DataSet['KURS']<> null then
                Kurs_FromPack          := inttostr(DM.DataSet['KURS']);
                if DM.DataSet['SHORT_KS']<> null then
                NameKatStud_FromPack := DM.DataSet['SHORT_KS'];
                if DM.DataSet['SHORT_FS']<> null then
                NameFormStud_FromPack     := DM.DataSet['SHORT_FS'];
                if DM.DataSet['SHORT_NATIONAL']<> null then
                NameNazional_FromPack   := DM.DataSet['SHORT_NATIONAL'];

                res[0]:=VarArrayOf([ID_DOG_as_int, ID_MAN_fromPak, ID_STUD_as_int, DM.DataSet['FIO'],
                                    DM.DataSet['NUM_DOG'], ID_PAYER_fromPak, ID_TYPE_PAYER_fromPak, FIO_PAYER_fromPak,
                                    BIRTH_DATE_fromPak, BEG_DATE_STUDY_fromPak, END_DATE_STUDY_fromPak,
                                    CN_CUR_SMET_record_count,  cn_kod_dog,
                                    frmContractsList_Oplata.cn_SNeed_Edit.Value,// надо уплатить
                                    frmContractsList_Oplata.cn_UplSum_Edit.Value,// уже уплачено
                                    frmContractsList_Oplata.SummaEdit.Value, // сумма для разбивки
                                    NameFak_FromPack, // факультет
                                    NameSpec_FromPack, // специальность
                                    NameNazional_FromPack, // гражданство
                                    NameFormStud_FromPack, // форма обучения
                                    NameKatStud_FromPack, // категория обучения
                                    Kurs_FromPack, // курс
                                    NameGroup_FromPack, // группа
                                    DM.DataSet['DATE_DOG']
                                     ]);
                // разбивка внесенной суммы по сметам
                for i:=1 to CN_CUR_SMET_record_count do
                 begin
                  res[i]:=VarArrayOf([DM.ReadDataSet['KOD_SM'], DM.ReadDataSet['KOD_RAZD'], DM.ReadDataSet['KOD_ST'], DM.ReadDataSet['KOD_KEKV'], DM.ReadDataSet['SUMMA']]);
                  DM.ReadDataSet.next;
                 end;
              DM.ReadDataSet.close;
              end
              except
              DM.StProc.Transaction.Rollback;
              ShowMessage('Виникла несподівана помилка у процедурі розбивки !');
              raise;
            end;
        DM.StProc.StoredProcName := 'CN_SMET_TMP_CLEAR';
        DM.StProc.Transaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_SESSION').AsInt64 := id_session_smet;
        DM.StProc.ExecProc;
        DM.StProc.Transaction.Commit;
        DM.StProc.Close;

            Screen.Cursor:=crDefault;
            frmContractsList_Oplata.Free;
            Close;

  end; //showmodal
 end
  else // IsSummaExist = true
  begin
        // --------------запуск процедуры st_smet------------------------------
              // проверка лининга
              DM.ReadDataSet.Close;
              DM.ReadDataSet.SelectSQL.Clear;
              DM.ReadDataSet.SelectSQL.Text:='select SMLINING from CN_SMLINING_CHECK';
              DM.ReadDataSet.Open;
              SMLINING := DM.ReadDataSet['SMLINING'];
              DM.ReadDataSet.Close;

                ID_STUD_as_int:= DM.Dataset['ID_STUD'];
                ID_DOG_as_int := DM.Dataset['ID_DOG_LAST'];
                ID_DOG_ROOT_as_int := DM.Dataset['ID_DOG_ROOT'];

              // cn_smet
              DM.StProc.StoredProcName := 'CN_SMET';
              DM.StProc.Transaction.StartTransaction;
              DM.StProc.Prepare;
              DM.StProc.ParamByName('ID_STUD').AsInt64 := DM.DataSet['ID_STUD'];
              DM.StProc.ParamByName('DSUM').AsFloat := InSumma;
              DM.StProc.ParamByName('SMLINING').AsInteger:= SMLINING;
              DM.StProc.ParamByName('CNDONACH').AsShort :=  0;
              DM.StProc.ExecProc;
               id_session_smet:= DM.StProc.ParamByName('ID_SESSION').AsInt64;
               CN_CUR_SMET_record_count:= DM.StProc.ParamByName('TOTAL').AsInteger;
              try
               begin
                DM.StProc.Transaction.Commit;
                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.SelectSQL.Text:='select CN_KOD_DOG from PUB_SYS_DATA';
                DM.ReadDataSet.Open;
                 if (DM.ReadDataSet['CN_KOD_DOG'] = null)
                  then cn_kod_dog  := 23499
                  else cn_kod_dog:=DM.ReadDataSet['CN_KOD_DOG'];

                DM.ReadDataSet.Close;
                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.SelectSQL.Text:='select * from CN_OPL_INFO_COMPLEX_SELECT('+
                                              inttostr(ID_STUD_as_int) + ','+ inttostr(ID_DOG_as_int)
                                       + ','+ inttostr(ID_DOG_ROOT_as_int)
                                       +')';
                DM.ReadDataSet.Open;
               //  ID_PAYER_fromPak :=0;
               //  ID_TYPE_PAYER_fromPak :=0;
                 ID_MAN_fromPak :=0;
               //  FIO_PAYER_fromPak :='';
                 BIRTH_DATE_fromPak :=0;
                 BEG_DATE_STUDY_fromPak :=0;
                 END_DATE_STUDY_fromPak :=0;

                 ID_MAN_fromPak :=        DM.ReadDataSet['ID_MAN'];
                 if DM.ReadDataSet['BIRTH_DATE'] <> null then
                    BIRTH_DATE_fromPak :=    DM.ReadDataSet['BIRTH_DATE']
                 else
                    BIRTH_DATE_fromPak := strtodate('01.01.1900');
                 if DM.ReadDataSet['BEG_DATE_STUDY'] <> null then
                 BEG_DATE_STUDY_fromPak :=DM.ReadDataSet['BEG_DATE_STUDY'];
                 if DM.ReadDataSet['END_DATE_STUDY'] <> null then
                 END_DATE_STUDY_fromPak :=DM.ReadDataSet['END_DATE_STUDY'];
                DM.ReadDataSet.Close;

                DM.ReadDataSet.close;
                DM.ReadDataSet.SelectSQL.Clear;
                DM.ReadDataSet.selectsql.text:='select * from CN_CUR_SMET_SELECT('+ IntToStr(id_session_smet)+')';
                DM.ReadDataSet.open;
                DM.ReadDataSet.fetchall;
                Res:=VarArrayCreate([0,CN_CUR_SMET_record_count+1],varVariant);
                // общие сведения о проживающем
                  NameFak_FromPack      :=' ';
                  NameSpec_FromPack     :=' ';
                  NameNazional_FromPack :=' ';
                  NameFormStud_FromPack :=' ';
                  NameKatStud_FromPack  :=' ';
                  Kurs_FromPack         :=' ';
                  NameGroup_FromPack    :=' ';

                if DM.DataSet['NAME_FACUL']<> null then
                NameFak_FromPack       := DM.DataSet['NAME_FACUL'];
                if DM.DataSet['NAME_SPEC']<> null then
                NameSpec_FromPack          := DM.DataSet['NAME_SPEC'];
                if DM.DataSet['NAME_GROUP']<> null then
                NameGroup_FromPack         := DM.DataSet['NAME_GROUP'];
                if DM.DataSet['KURS']<> null then
                Kurs_FromPack          := inttostr(DM.DataSet['KURS']);
                if DM.DataSet['NAME_KAT_STUD']<> null then
                NameKatStud_FromPack := DM.DataSet['NAME_KAT_STUD'];
                if DM.DataSet['NAME_FORM_STUD']<> null then
                NameFormStud_FromPack     := DM.DataSet['NAME_FORM_STUD'];
                if DM.DataSet['NAME_NAZIONAL']<> null then
                NameNazional_FromPack   := DM.DataSet['NAME_NAZIONAL'];

                ID_STUD_as_int:= DM.Dataset['ID_STUD'];
                res[0]:=VarArrayOf([ID_DOG_as_int, ID_MAN_fromPak, ID_STUD_as_int, DM.DataSet['FIO'],
                                    DM.DataSet['NUM_DOG'], ID_PAYER_fromPak, ID_TYPE_PAYER_fromPak, FIO_PAYER_fromPak,
                                    BIRTH_DATE_fromPak, BEG_DATE_STUDY_fromPak, END_DATE_STUDY_fromPak,
                                    CN_CUR_SMET_record_count,  cn_kod_dog,
                                    InSumma, // сумма для разбивки
                                    NameFak_FromPack, // факультет
                                    NameSpec_FromPack, // специальность
                                    NameNazional_FromPack, // гражданство
                                    NameFormStud_FromPack, // форма обучения
                                    NameKatStud_FromPack, // категория обучения
                                    Kurs_FromPack, // курс
                                    NameGroup_FromPack, // группа
                                    DM.DataSet['DATE_DOG']
                                     ]);
                // разбивка внесенной суммы по сметам
                for i:=1 to CN_CUR_SMET_record_count do begin
                res[i]:=VarArrayOf([DM.ReadDataSet['KOD_SM'], DM.ReadDataSet['KOD_RAZD'], DM.ReadDataSet['KOD_ST'], DM.ReadDataSet['KOD_KEKV'], DM.ReadDataSet['SUMMA']]);
                DM.ReadDataSet.next;
               end;
              DM.ReadDataSet.close;
              end
              except
              DM.StProc.Transaction.Rollback;
              ShowMessage('Виникла несподівана помилка у процедурі розбивки!');
              raise;
            end;
        DM.StProc.StoredProcName := 'CN_SMET_TMP_CLEAR';
        DM.StProc.Transaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_SESSION').AsInt64 := id_session_smet;
        DM.StProc.ExecProc;
        DM.StProc.Transaction.Commit;
        DM.StProc.Close;

            Screen.Cursor:=crDefault;
            Close;

  end;
end;

procedure TfrmContractsList.cxDBTreeList1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then  SelectButtonClick(Sender);
  if not (key in [33,34,38,40]) then Dog_Filter_Edit.SetFocus;
end;

procedure TfrmContractsList.LgotaButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
 AParameter.cnParamsToPakage.ID_STUD:= DM.Dataset['ID_STUD'];
 AParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 AParameter.WaitPakageOwner:= frmContractsList;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Lgots.bpl','ShowDTLgots');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContractsList.cxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  Arect:TRect;
begin
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.Node.Values[12]<> 1) and (not AViewInfo.Node.Focused ))
   then
    begin
     //Дополнительные
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:= clInfoBk;  //$00EBCBA0;//$00C0CFDC;
     ACanvas.Canvas.FillRect(Arect);
    end;

  if ((AViewInfo.Node.Values[12]<> 1) and (AViewInfo.Node.Focused ))
   then
    begin
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:= $00B3FFFF; //$00DCA356; //$0096AEC5;
     ACanvas.Font.Color:= clWindowText ;
     ACanvas.Canvas.FillRect(Arect);
    end;
 
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
 if CN_USE_EXT_COLOR = 1 then
 begin
  if ((AViewInfo.Node.Values[4] < date) and (AViewInfo.Node.Values[5] = 0 ))
   then
    begin
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:=$00D3C6FD;
     ACanvas.Canvas.FillRect(Arect);
    end;

  if ((AViewInfo.Node.Values[13] <> 0) and (AViewInfo.Node.Values[13] <> 1))
   then
    begin
     Arect:=AViewInfo.BoundsRect;
     ACanvas.Canvas.Brush.Color:=$00CBF1C7;
     ACanvas.Canvas.FillRect(Arect);
    end;
  end;
end;

procedure TfrmContractsList.cxDBTreeList1DblClick(Sender: TObject);
begin
  SelectButtonClick(Sender);
end;

procedure TfrmContractsList.PrintButtonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 InParameter:= TcnSimpleParamsEx.Create;
 InParameter.Owner:=self;
 InParameter.Db_Handle:= DM.DB.Handle;
 InParameter.Formstyle:=fsNormal;
 InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
 InParameter.cnParamsToPakage.ID_STUD     := DM.Dataset['ID_STUD'];
 InParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 InParameter.cnParamsToPakage.Num_Doc := DM.DataSet['NUM_DOG'];
 InParameter.WaitPakageOwner:= frmContractsList;
 RunFunctionFromPackage(InParameter, 'Contracts\cn_fr_PaymentAnalysis.bpl','frChooseReport');
 InParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContractsList.Timer1Timer(Sender: TObject);
begin
FilterActionExecute(Sender);
Timer1.Enabled := false;
end;

procedure TfrmContractsList.Dog_Filter_EditKeyUp(Sender: TObject;
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
  if key = vk_return then cxDBTreeList1.SetFocus;
end;

procedure TfrmContractsList.FiltrByFIO_RadioButtonClick(Sender: TObject);
begin
  Dog_Filter_Edit.SetFocus;
end;

procedure TfrmContractsList.FiltrByNum_RadioButtonClick(Sender: TObject);
begin
  Dog_Filter_Edit.SetFocus;
end;

procedure TfrmContractsList.FiltrByKod_RadioButtonClick(Sender: TObject);
begin
  Dog_Filter_Edit.SetFocus;
end;

procedure TfrmContractsList.SelectActExecute(Sender: TObject);
begin
  SelectButtonClick(Self);
end;

procedure TfrmContractsList.lookButtonClick(Sender: TObject);
var
 ViewForm:Tfrm_ContractsList_look;
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
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;

  with DM.ReadDataSet do
  begin
    Close;
    SelectSQL.Clear;
    SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
    Open;
  end;

  if DM.ReadDataSet.FieldByName('CN_ENABLE_EDIT_TIP_DOG').AsInteger = 1 then EnableEditTipDog:=True
  else EnableEditTipDog:=false;

  if DM.DataSet['ISCOLLECT'] = 1 then   wf := ShowWaitForm(self,wfLoadPackage);

  ViewForm:= Tfrm_ContractsList_look.create(self, CurrentConnect.PLanguageIndex, DM.DB.Handle, DM.Dataset['ISCOLLECT'], true );
  ViewForm.Caption:= cnConsts.cn_EditBtn_Caption[CurrentConnect.PLanguageIndex];

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

  ViewForm.ShowModal;

  ViewForm.Free;
end;

end.

