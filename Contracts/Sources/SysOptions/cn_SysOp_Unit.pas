//******************************************************************************
// Проект "Контракты"
// sys_options
// Чернявский А.Э. 2006г.
//******************************************************************************

unit cn_SysOp_Unit;                         

interface                         

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_SysOp, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, StdCtrls, cxGroupBox, cxMaskEdit, cxButtonEdit,
  cn_Common_Types, cn_Common_Loader, GlobalSPR, cxDropDownEdit, cxCalendar,
  RxGIF, ExtCtrls;

type
  TfrmSysOp = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    SelectButton: TdxBarLargeButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cn_def_id_customer_Edit: TcxTextEdit;
    cn_kod_dog_Edit: TcxTextEdit;
    cn_filterdoc_Edit: TcxTextEdit;
    cn_smlining_Edit: TcxTextEdit;
    cn_get_dog_from_buffer_Edit: TcxTextEdit;
    cn_nomenklat_nomer_Edit: TcxTextEdit;
    cn_def_id_type_stage_Edit: TcxButtonEdit;
    cn_def_smeta_Edit: TcxButtonEdit;
    cn_def_razdel_Edit: TcxButtonEdit;
    cn_def_stat_Edit: TcxButtonEdit;
    cn_def_kekv_Edit: TcxButtonEdit;
    cn_max_sys_timestamp_Edit: TcxDateEdit;
    cn_date_start_Edit: TcxDateEdit;
    cn_max_date_Edit: TcxDateEdit;
    cn_date_prov_Edit: TcxDateEdit;
    cn_id_rate_account_Edit: TcxButtonEdit;
    CN_DEF_ID_FACUL: TLabel;
    Faculty_Edit: TcxButtonEdit;
    Spec_Label: TLabel;
    Spec_Edit: TcxButtonEdit;
    Group_Label: TLabel;
    Group_Edit: TcxButtonEdit;
    FormStud_Label: TLabel;
    FormStud_Edit: TcxButtonEdit;
    CategoryStudy_Label: TLabel;
    CategoryStudy_Edit: TcxButtonEdit;
    Nazional_Edit_Label: TLabel;
    Nazional_Edit: TcxButtonEdit;
    cn_dep_group_property_Edit: TcxTextEdit;
    Label17: TLabel;
    Label18: TLabel;
    cn_id_dep_type_Edit: TcxTextEdit;
    Label19: TLabel;
    cn_show_fastgroups_Edit: TcxTextEdit;
    Label20: TLabel;
    cn_id_type_diss_avto_Edit: TcxTextEdit;
    Label21: TLabel;
    RapStatusProekt_Edit: TcxButtonEdit;
    Label22: TLabel;
    RapStatusVipolnen_Edit: TcxButtonEdit;
    Label23: TLabel;
    CN_GROUP_ABITUR_SYSTEM_Edit: TcxTextEdit;
    Label24: TLabel;
    TypeDocOtchisl_Edit: TcxButtonEdit;
    Label25: TLabel;
    TypeDocVosstanovl_Edit: TcxButtonEdit;
    Label26: TLabel;
    TypeDissRap_Edit: TcxTextEdit;
    cn_fr_univer_Edit: TcxTextEdit;
    cn_fr_rektor_Edit: TcxTextEdit;
    cn_fr_univer_name_Edit: TcxTextEdit;
    cn_end_month_Edit: TcxTextEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    cn_namezvit_rap_na_otchisl_Edit: TcxButtonEdit;
    Label32: TLabel;
    cn_namezvit_sch_yurliza_Edit: TcxButtonEdit;
    Label33: TLabel;
    cn_ordertype_lgota_Edit: TcxButtonEdit;
    Label34: TLabel;
    cn_ordertype_otchislenie_Edit: TcxButtonEdit;
    Label35: TLabel;
    cn_ordertype_tonextkurs_Edit: TcxButtonEdit;
    Label36: TLabel;
    cn_ordertype_vosstanovl_Edit: TcxButtonEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    cn_is_generate_num_dog_Edit: TcxTextEdit;
    Label40: TLabel;
    cn_calc_by_dateopl_Edit: TcxTextEdit;
    cn_abitur_status_candidate_Edit: TcxButtonEdit;
    cn_abitur_status_project_Edit: TcxButtonEdit;
    cn_id_type_dog_Edit: TcxButtonEdit;
    Label41: TLabel;
    Label42: TLabel;
    cn_dog_status_rastorg_Edit: TcxButtonEdit;
    Label43: TLabel;
    cn_dog_status_deystv_Edit: TcxButtonEdit;
    cn_image_in_other_db_Edit: TcxTextEdit;
    Label44: TLabel;
    Label45: TLabel;
    cn_pay_db_kr_Edit: TcxDateEdit;
    Label46: TLabel;
    cn_namezvit_credit_Edit: TcxButtonEdit;
    Label47: TLabel;
    cn_image_print_page_limit_edit: TcxTextEdit;
    Label48: TLabel;
    cn_check_periods_study_on_12_Edit: TcxTextEdit;
    Label49: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cn_def_id_type_stage_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_def_smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_def_razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_def_stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_def_kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_id_rate_account_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Faculty_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormStud_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CategoryStudy_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Nazional_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Spec_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Group_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RapStatusProekt_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RapStatusVipolnen_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocOtchisl_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocVosstanovl_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_namezvit_rap_na_otchisl_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_namezvit_sch_yurliza_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_ordertype_lgota_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_ordertype_tonextkurs_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_ordertype_vosstanovl_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_abitur_status_candidate_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_abitur_status_project_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_id_type_dog_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cn_dog_status_deystv_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_dog_status_rastorg_EditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cn_namezvit_credit_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex: byte;
    DM:TDM_SO;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmSysOp.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_SO.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_PUB_SYS_DATA_GET_ALL';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
 if DM.DataSet['CN_MAX_SYS_TIMESTAMP'] <> null then
 cn_max_sys_timestamp_Edit.Date := DM.DataSet['CN_MAX_SYS_TIMESTAMP'];
 if DM.DataSet['CN_ID_RATE_ACCOUNT'] <> null then
 cn_id_rate_account_Edit.Text   := inttostr(DM.DataSet['CN_ID_RATE_ACCOUNT']);
 if DM.DataSet['CN_DEF_ID_CUSTOMER'] <> null then
 cn_def_id_customer_Edit.Text   := inttostr(DM.DataSet['CN_DEF_ID_CUSTOMER']);
 if DM.DataSet['CN_DEF_SMETA'] <> null then
 cn_def_smeta_Edit.Text         := inttostr(DM.DataSet['CN_DEF_SMETA']);
 if DM.DataSet['CN_DEF_RAZDEL'] <> null then
 cn_def_razdel_Edit.Text        := inttostr(DM.DataSet['CN_DEF_RAZDEL']);
 if DM.DataSet['CN_DEF_STAT'] <> null then
 cn_def_stat_Edit.Text          := inttostr(DM.DataSet['CN_DEF_STAT']);
 if DM.DataSet['CN_DEF_KEKV'] <> null then
 cn_def_kekv_Edit.Text          := inttostr(DM.DataSet['CN_DEF_KEKV']);
 if DM.DataSet['CN_DEF_ID_TYPE_STAGE'] <> null then
 cn_def_id_type_stage_Edit.Text := inttostr(DM.DataSet['CN_DEF_ID_TYPE_STAGE']);
 if DM.DataSet['CN_DATE_START'] <> null then
 cn_date_start_Edit.Date        := DM.DataSet['CN_DATE_START'];
 if DM.DataSet['CN_KOD_DOG'] <> null then
 cn_kod_dog_Edit.Text           := inttostr(DM.DataSet['CN_KOD_DOG']);
 if DM.DataSet['CN_FILTERDOC'] <> null then
 cn_filterdoc_Edit.Text         := inttostr(DM.DataSet['CN_FILTERDOC']);
 if DM.DataSet['CN_MAX_DATE'] <> null then
 cn_max_date_Edit.Date          := DM.DataSet['CN_MAX_DATE'];
 if DM.DataSet['CN_DATE_PROV'] <> null then
 cn_date_prov_Edit.Date         := DM.DataSet['CN_DATE_PROV'];
 if DM.DataSet['CN_SMLINING'] <> null then
 cn_smlining_Edit.Text          := inttostr(DM.DataSet['CN_SMLINING']);
 if DM.DataSet['CN_GET_DOG_FROM_BUFFER'] <> null then
 cn_get_dog_from_buffer_Edit.Text := inttostr(DM.DataSet['CN_GET_DOG_FROM_BUFFER']);
 if DM.DataSet['CN_NOMENKLAT_NOMER'] <> null then
 cn_nomenklat_nomer_Edit.Text     := DM.DataSet['CN_NOMENKLAT_NOMER'];
 if DM.DataSet['CN_DEF_ID_FACUL'] <> null then
 Faculty_Edit.Text     := DM.DataSet['CN_DEF_ID_FACUL'];
  if DM.DataSet['CN_DEF_ID_SPEC'] <> null then
 Spec_Edit.Text     := DM.DataSet['CN_DEF_ID_SPEC'];
  if DM.DataSet['CN_DEF_ID_GROUP'] <> null then
 Group_Edit.Text     := DM.DataSet['CN_DEF_ID_GROUP'];
  if DM.DataSet['CN_DEF_ID_FORM_STUD'] <> null then
 FormStud_Edit.Text     := DM.DataSet['CN_DEF_ID_FORM_STUD'];
  if DM.DataSet['CN_DEF_ID_KAT_STUD'] <> null then
 CategoryStudy_Edit.Text     := DM.DataSet['CN_DEF_ID_KAT_STUD'];
  if DM.DataSet['CN_DEF_ID_NATIONAL'] <> null then
 Nazional_Edit.Text     := DM.DataSet['CN_DEF_ID_NATIONAL'];
  if DM.DataSet['CN_DEP_GROUP_PROPERTY'] <> null then
 cn_dep_group_property_Edit.Text     := DM.DataSet['CN_DEP_GROUP_PROPERTY'];
 if DM.DataSet['CN_ID_DEP_TYPE'] <> null then
 cn_id_dep_type_Edit.Text     := DM.DataSet['CN_ID_DEP_TYPE'];
 if DM.DataSet['CN_SHOW_FASTGROUPS']<> null then
 cn_show_fastgroups_Edit.Text:= DM.DataSet['CN_SHOW_FASTGROUPS'];
 if DM.DataSet['CN_ID_TYPE_DISS_AVTO']<> null then
 cn_id_type_diss_avto_Edit.Text:= DM.DataSet['CN_ID_TYPE_DISS_AVTO'];
 if DM.DataSet['CN_GROUP_ABITUR_SYSTEM']<> null then
 CN_GROUP_ABITUR_SYSTEM_Edit.Text:= DM.DataSet['CN_GROUP_ABITUR_SYSTEM'];
  if DM.DataSet['CN_ID_RAP_STATUS_PROEKT']<> null then
 RapStatusProekt_Edit.Text:= DM.DataSet['CN_ID_RAP_STATUS_PROEKT'];
  if DM.DataSet['CN_ID_RAP_STATUS_VIPOLNEN']<> null then
 RapStatusVipolnen_Edit.Text:= DM.DataSet['CN_ID_RAP_STATUS_VIPOLNEN'];
  if DM.DataSet['CN_ID_TYPEDOC_OTCHISLENIE']<> null then
 TypeDocOtchisl_Edit.Text:= DM.DataSet['CN_ID_TYPEDOC_OTCHISLENIE'];
  if DM.DataSet['CN_ID_TYPEDOC_VOSSTANOVL']<> null then
 TypeDocVosstanovl_Edit.Text:= DM.DataSet['CN_ID_TYPEDOC_VOSSTANOVL'];
  if DM.DataSet['CN_ID_TYPE_DISS_FOR_RAPORT']<> null then
 TypeDissRap_Edit.Text:= DM.DataSet['CN_ID_TYPE_DISS_FOR_RAPORT'];
   if DM.DataSet['CN_FR_REKTOR']<> null then
 cn_fr_rektor_Edit.Text:= DM.DataSet['CN_FR_REKTOR'];
   if DM.DataSet['CN_FR_UNIVER']<> null then
 cn_fr_univer_Edit.Text:= DM.DataSet['CN_FR_UNIVER'];
   if DM.DataSet['CN_FR_UNIVER_NAME']<> null then
 cn_fr_univer_name_Edit.Text:= DM.DataSet['CN_FR_UNIVER_NAME'];
   if DM.DataSet['CN_END_MONTH']<> null then
 cn_end_month_Edit.Text:= DM.DataSet['CN_END_MONTH'];
 if DM.DataSet['CN_NAMEZVIT_RAP_NA_OTCHISL'] <> null then
 cn_namezvit_rap_na_otchisl_Edit.Text          := inttostr(DM.DataSet['CN_NAMEZVIT_RAP_NA_OTCHISL']);
 if DM.DataSet['CN_NAMEZVIT_SCH_YURLIZA'] <> null then
 cn_namezvit_sch_yurliza_Edit.Text := inttostr(DM.DataSet['CN_NAMEZVIT_SCH_YURLIZA']);
 if DM.DataSet['CN_ORDERTYPE_LGOTA'] <> null then
 cn_ordertype_lgota_Edit.Text := inttostr(DM.DataSet['CN_ORDERTYPE_LGOTA']);
 if DM.DataSet['CN_ORDERTYPE_OTCHISLENIE'] <> null then
 CN_ORDERTYPE_OTCHISLENIE_Edit.Text := inttostr(DM.DataSet['CN_ORDERTYPE_OTCHISLENIE']);
 if DM.DataSet['CN_ORDERTYPE_TONEXTKURS'] <> null then
 CN_ORDERTYPE_TONEXTKURS_Edit.Text := inttostr(DM.DataSet['CN_ORDERTYPE_TONEXTKURS']);
 if DM.DataSet['CN_ORDERTYPE_VOSSTANOVL'] <> null then
 CN_ORDERTYPE_VOSSTANOVL_Edit.Text := inttostr(DM.DataSet['CN_ORDERTYPE_VOSSTANOVL']);
  if DM.DataSet['CN_ABITUR_STATUS_CANDIDATE'] <> null then
 CN_ABITUR_STATUS_CANDIDATE_Edit.Text := inttostr(DM.DataSet['CN_ABITUR_STATUS_CANDIDATE']);
  if DM.DataSet['CN_ABITUR_STATUS_PROJECT'] <> null then
 CN_ABITUR_STATUS_PROJECT_Edit.Text := inttostr(DM.DataSet['CN_ABITUR_STATUS_PROJECT']);
  if DM.DataSet['CN_IS_GENERATE_NUM_DOG'] <> null then
 CN_IS_GENERATE_NUM_DOG_Edit.Text := inttostr(DM.DataSet['CN_IS_GENERATE_NUM_DOG']);
  if DM.DataSet['CN_CALC_BY_DATEOPL'] <> null then
 cn_calc_by_dateopl_Edit.Text := inttostr(DM.DataSet['CN_CALC_BY_DATEOPL']);
  if DM.DataSet['CN_ID_TYPE_DOG'] <> null then
 CN_ID_TYPE_DOG_Edit.Text := inttostr(DM.DataSet['CN_ID_TYPE_DOG']);
  if DM.DataSet['CN_DOG_STATUS_DEYSTV'] <> null then
 cn_dog_status_deystv_Edit.Text := inttostr(DM.DataSet['CN_DOG_STATUS_DEYSTV']);
  if DM.DataSet['CN_DOG_STATUS_RASTORG'] <> null then
 cn_dog_status_rastorg_Edit.Text := inttostr(DM.DataSet['CN_DOG_STATUS_RASTORG']);
  if DM.DataSet['CN_IMAGE_IN_OTHER_DB'] <> null then
 cn_image_in_other_db_Edit.Text := inttostr(DM.DataSet['CN_IMAGE_IN_OTHER_DB']);
  if DM.DataSet['CN_PAY_DB_KR'] <> null then
 cn_pay_db_kr_Edit.Date := DM.DataSet['CN_PAY_DB_KR'];
   if DM.DataSet['CN_NAMEZVIT_CREDIT'] <> null then
 cn_namezvit_credit_Edit.Text := inttostr(DM.DataSet['CN_NAMEZVIT_CREDIT']);

   if DM.DataSet['CN_IMAGE_PRINT_PAGE_LIMIT'] <> null then
 cn_image_print_page_limit_edit.Text := inttostr(DM.DataSet['CN_IMAGE_PRINT_PAGE_LIMIT']);
    if DM.DataSet['CN_CHECK_PERIODS_STUDY_ON_12'] <> null then
 cn_check_periods_study_on_12_Edit.Text := inttostr(DM.DataSet['CN_CHECK_PERIODS_STUDY_ON_12']);

 FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmSysOp.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
  Caption :=                    cnConsts.cn_SysOptions[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmSysOp.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSysOp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmSysOp.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmSysOp.EditButtonClick(Sender: TObject);
begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_PUB_SYS_DATA_UPDATE_ALL';
        Prepare;
        if cn_max_sys_timestamp_Edit.Text <> '' then
        ParamByName('CN_MAX_SYS_TIMESTAMP').AsDateTime  := StrToDateTime(cn_max_sys_timestamp_Edit.Text);
        if cn_id_rate_account_Edit.Text <> '' then
        ParamByName('CN_ID_RATE_ACCOUNT').AsInt64  := StrToInt64(cn_id_rate_account_Edit.Text);
        if cn_def_id_customer_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_CUSTOMER').AsInt64  := StrToInt64(cn_def_id_customer_Edit.Text);
        if cn_def_smeta_Edit.Text <> '' then
        ParamByName('CN_DEF_SMETA').AsInt64  := StrToInt64(cn_def_smeta_Edit.Text);
        if cn_def_razdel_Edit.Text <> '' then
        ParamByName('CN_DEF_RAZDEL').AsInt64  := StrToInt64(cn_def_razdel_Edit.Text);
        if cn_def_stat_Edit.Text <> '' then
        ParamByName('CN_DEF_STAT').AsInt64  := StrToInt64(cn_def_stat_Edit.Text);
        if cn_def_kekv_Edit.Text <> '' then
        ParamByName('CN_DEF_KEKV').AsInt64  := StrToInt64(cn_def_kekv_Edit.Text);
        if cn_def_id_type_stage_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_TYPE_STAGE').AsInt64  := StrToInt64(cn_def_id_type_stage_Edit.Text);
        if cn_date_start_Edit.Text <> '' then
        ParamByName('CN_DATE_START').AsDateTime  := StrToDateTime(cn_date_start_Edit.Text);
        if cn_kod_dog_Edit.Text <> '' then
        ParamByName('CN_KOD_DOG').AsInt64  := StrToInt64(cn_kod_dog_Edit.Text);
        if cn_filterdoc_Edit.Text <> '' then
        ParamByName('CN_FILTERDOC').AsInt64  := StrToInt64(cn_filterdoc_Edit.Text);
        if cn_max_date_Edit.Text <> '' then
        ParamByName('CN_MAX_DATE').AsDateTime  := StrToDateTime(cn_max_date_Edit.Text);
        if cn_date_prov_Edit.Text <> '' then
        ParamByName('CN_DATE_PROV').AsDateTime  := StrToDateTime(cn_date_prov_Edit.Text);
        if cn_smlining_Edit.Text <> '' then
        ParamByName('CN_SMLINING').AsInt64  := StrToInt64(cn_smlining_Edit.Text);
        if cn_get_dog_from_buffer_Edit.Text <> '' then
        ParamByName('CN_GET_DOG_FROM_BUFFER').AsInt64  := StrToInt64(cn_get_dog_from_buffer_Edit.Text);
        if cn_nomenklat_nomer_Edit.Text <> '' then
        ParamByName('CN_NOMENKLAT_NOMER').AsInt64  := StrToInt64(cn_nomenklat_nomer_Edit.Text);
        if Faculty_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_FACUL').AsInt64  := StrToInt64(Faculty_Edit.Text);
        if Spec_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_SPEC').AsInt64  := StrToInt64(Spec_Edit.Text);
        if Group_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_GROUP').AsInt64  := StrToInt64(Group_Edit.Text);
        if FormStud_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_FORM_STUD').AsInt64  := StrToInt64(FormStud_Edit.Text);
        if CategoryStudy_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_KAT_STUD').AsInt64  := StrToInt64(CategoryStudy_Edit.Text);
        if Nazional_Edit.Text <> '' then
        ParamByName('CN_DEF_ID_NATIONAL').AsInt64  := StrToInt64(Nazional_Edit.Text);
        if cn_dep_group_property_Edit.Text <> '' then
        ParamByName('CN_dep_group_property').AsInt64  := StrToInt64(cn_dep_group_property_Edit.Text);
        if cn_id_dep_type_Edit.Text <> '' then
        ParamByName('CN_ID_DEP_TYPE').AsInt64  := StrToInt64(cn_id_dep_type_Edit.Text);
        if cn_show_fastgroups_Edit.Text <> '' then
        ParamByName('CN_SHOW_FASTGROUPS').AsInteger  := StrToInt(cn_show_fastgroups_Edit.Text);
        if cn_id_type_diss_avto_Edit.Text <> '' then
        ParamByName('CN_ID_TYPE_DISS_AVTO').AsInteger  := StrToInt(cn_id_type_diss_avto_Edit.Text);
        if CN_GROUP_ABITUR_SYSTEM_Edit.Text <> '' then
        ParamByName('CN_GROUP_ABITUR_SYSTEM').AsString  := CN_GROUP_ABITUR_SYSTEM_Edit.Text;
        if RapStatusProekt_Edit.Text <> '' then
        ParamByName('CN_ID_RAP_STATUS_PROEKT').AsInteger  := StrToInt(RapStatusProekt_Edit.Text);
        if RapStatusVipolnen_Edit.Text <> '' then
        ParamByName('CN_ID_RAP_STATUS_VIPOLNEN').AsInteger  := StrToInt(RapStatusVipolnen_Edit.Text);
        if TypeDocOtchisl_Edit.Text <> '' then
        ParamByName('CN_ID_TYPEDOC_OTCHISLENIE').AsInteger  := StrToInt(TypeDocOtchisl_Edit.Text);
        if TypeDocVosstanovl_Edit.Text <> '' then
        ParamByName('CN_ID_TYPEDOC_VOSSTANOVL').AsInteger  := StrToInt(TypeDocVosstanovl_Edit.Text);
        if TypeDissRap_Edit.Text <> '' then
        ParamByName('CN_ID_TYPE_DISS_FOR_RAPORT').AsInteger  := StrToInt(TypeDissRap_Edit.Text);
        if cn_fr_univer_Edit.Text <> '' then
        ParamByName('CN_FR_UNIVER').AsString  := cn_fr_univer_Edit.Text;
        if cn_fr_rektor_Edit.Text <> '' then
        ParamByName('CN_FR_REKTOR').AsString  := cn_fr_rektor_Edit.Text;
        if cn_fr_univer_name_Edit.Text <> '' then
        ParamByName('CN_FR_UNIVER_NAME').AsString  := cn_fr_univer_name_Edit.Text;
        if cn_end_month_Edit.Text <> '' then
        ParamByName('CN_END_MONTH').AsInteger  := StrToInt(cn_end_month_Edit.Text);
        if cn_namezvit_rap_na_otchisl_Edit.Text <> '' then
        ParamByName('CN_NAMEZVIT_RAP_NA_OTCHISL').AsInt64  := StrToInt64(cn_namezvit_rap_na_otchisl_Edit.Text);
        if cn_namezvit_sch_yurliza_Edit.Text <> '' then
        ParamByName('CN_NAMEZVIT_SCH_YURLIZA').AsInt64  := StrToInt64(cn_namezvit_sch_yurliza_Edit.Text);
        if cn_ordertype_lgota_Edit.Text <> '' then
        ParamByName('CN_ORDERTYPE_LGOTA').AsInt64  := StrToInt64(cn_ordertype_lgota_Edit.Text);
        if CN_ORDERTYPE_OTCHISLENIE_Edit.Text <> '' then
        ParamByName('CN_ORDERTYPE_OTCHISLENIE').AsInt64  := StrToInt64(CN_ORDERTYPE_OTCHISLENIE_Edit.Text);
        if CN_ORDERTYPE_TONEXTKURS_Edit.Text <> '' then
        ParamByName('CN_ORDERTYPE_TONEXTKURS').AsInt64  := StrToInt64(CN_ORDERTYPE_TONEXTKURS_Edit.Text);
        if CN_ORDERTYPE_VOSSTANOVL_Edit.Text <> '' then
        ParamByName('CN_ORDERTYPE_VOSSTANOVL').AsInt64  := StrToInt64(CN_ORDERTYPE_VOSSTANOVL_Edit.Text);
        if CN_ABITUR_STATUS_CANDIDATE_Edit.Text <> '' then
        ParamByName('CN_ABITUR_STATUS_CANDIDATE').AsInt64  := StrToInt64(CN_ABITUR_STATUS_CANDIDATE_Edit.Text);
        if CN_ABITUR_STATUS_PROJECT_Edit.Text <> '' then
        ParamByName('CN_ABITUR_STATUS_PROJECT').AsInt64  := StrToInt64(CN_ABITUR_STATUS_PROJECT_Edit.Text);
        if CN_IS_GENERATE_NUM_DOG_Edit.Text <> '' then
        ParamByName('CN_IS_GENERATE_NUM_DOG').AsInt64  := StrToInt64(CN_IS_GENERATE_NUM_DOG_Edit.Text);
        if CN_CALC_BY_DATEOPL_Edit.Text <> '' then
        ParamByName('CN_CALC_BY_DATEOPL').AsInt64  := StrToInt64(CN_CALC_BY_DATEOPL_Edit.Text);
        if CN_ID_TYPE_DOG_Edit.Text <> '' then
        ParamByName('CN_ID_TYPE_DOG').AsInt64  := StrToInt64(CN_ID_TYPE_DOG_Edit.Text);
        if cn_dog_status_deystv_Edit.Text <> '' then
        ParamByName('CN_DOG_STATUS_DEYSTV').AsInt64  := StrToInt64(cn_dog_status_deystv_Edit.Text);
        if cn_dog_status_rastorg_Edit.Text <> '' then
        ParamByName('CN_DOG_STATUS_RASTORG').AsInt64  := StrToInt64(cn_dog_status_rastorg_Edit.Text);
        if cn_image_in_other_db_Edit.Text <> '' then
        ParamByName('CN_IMAGE_IN_OTHER_DB').AsInt64  := StrToInt64(cn_image_in_other_db_Edit.Text);
        if cn_pay_db_kr_Edit.Text <> '' then
        ParamByName('CN_PAY_DB_KR').AsDate  := StrToDate(cn_pay_db_kr_Edit.Text);
        if cn_namezvit_credit_Edit.Text <> '' then
        ParamByName('CN_NAMEZVIT_CREDIT').AsInt64  := StrToInt64(cn_namezvit_credit_Edit.Text);
        if cn_image_print_page_limit_edit.Text <> '' then
        ParamByName('CN_IMAGE_PRINT_PAGE_LIMIT').AsInt64  := StrToInt64(cn_image_print_page_limit_edit.Text);
        if cn_check_periods_study_on_12_Edit.Text <> '' then
        ParamByName('CN_CHECK_PERIODS_STUDY_ON_12').AsInt64  := StrToInt64(cn_check_periods_study_on_12_Edit.Text);

        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          ShowMessage('Transaction Error');
          Transaction.Rollback;
         end;
       end;
close;
end;

procedure TfrmSysOp.cn_def_id_type_stage_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if cn_def_id_type_stage_Edit.Text <> '' then
  AParameter.ID_Locate :=  StrToInt64(cn_def_id_type_stage_Edit.Text);
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_ini_TypeStage.bpl','ShowIniTypeStage');
  AParameter.Free;
 if VarArrayDimCount(res)>0 then
 begin
  cn_def_id_type_stage_Edit.Text := vartostr(res[0]);
 end;
end;

procedure TfrmSysOp.cn_def_smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DM.DB.Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0
    then
     if id[0]<>NULL
     then begin
     cn_def_smeta_Edit.Text  := vartostr(id[9]);
     cn_def_razdel_Edit.Text := vartostr(id[7]);
     cn_def_stat_Edit.Text   := vartostr(id[8]);
     end;
end;


procedure TfrmSysOp.cn_def_razdel_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DM.DB.Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0
    then
     if id[0]<>NULL
     then begin
     cn_def_smeta_Edit.Text  := vartostr(id[9]);
     cn_def_razdel_Edit.Text := vartostr(id[7]);
     cn_def_stat_Edit.Text   := vartostr(id[8]);
     end;
end;

procedure TfrmSysOp.cn_def_stat_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DM.DB.Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0
    then
     if id[0]<>NULL
     then begin
     cn_def_smeta_Edit.Text  := vartostr(id[9]);
     cn_def_razdel_Edit.Text := vartostr(id[7]);
     cn_def_stat_Edit.Text   := vartostr(id[8]);
     end;
end;

procedure TfrmSysOp.cn_def_kekv_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetKEKVSpr
        (self, DM.DB.Handle, FSNormal,now,DEFAULT_ROOT_ID);

    if VarArrayDimCount(id)>0
    then
    if id[0][0]<>NULL
     then begin
      cn_def_kekv_Edit.Text:= vartostr(id[0][2]);
     end;
end;

procedure TfrmSysOp.cn_id_rate_account_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_DefaultAccounts.bpl','ShowDefaultAccounts');
  AParameter.Free;
  if VarArrayDimCount(res)>0 then
    cn_id_rate_account_Edit.Text := vartostr(res[0]);
 end;


procedure TfrmSysOp.Faculty_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if Faculty_Edit.Text <> '' then
  AParameter.ID_Locate := StrToInt64(Faculty_Edit.Text);
  if Spec_Edit.Text <> '' then
  AParameter.ID_Locate_1 := StrToInt64(Spec_Edit.Text);
  if Group_Edit.Text <> ''then
  AParameter.ID_Locate_2 := StrToInt64(Group_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  Faculty_Edit.Text:= vartostr(res[0]);
  Spec_Edit.Text:= vartostr(res[1]);
  Group_Edit.Text:= vartostr(res[2]);
 end;
end;

procedure TfrmSysOp.FormStud_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if FormStud_Edit.Text <> '' then
  AParameter.ID_Locate :=  strtoint64(FormStud_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  FormStud_Edit.Text:= vartostr(res[0]);
 end;
end;

procedure TfrmSysOp.CategoryStudy_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if CategoryStudy_Edit.Text <> '' then
  AParameter.ID_Locate :=  strtoint64(CategoryStudy_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  CategoryStudy_Edit.Text:= vartostr(res[0]);
 end;
end;
procedure TfrmSysOp.Nazional_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if Nazional_Edit.Text <> '' then
  AParameter.ID_Locate :=  strtoint64(Nazional_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_National.bpl','ShowSPNational');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  Nazional_Edit.Text:= vartostr(res[0]);
 end;
end;

procedure TfrmSysOp.Spec_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if Faculty_Edit.Text <> '' then
  AParameter.ID_Locate := StrToInt64(Faculty_Edit.Text);
  if Spec_Edit.Text <> '' then
  AParameter.ID_Locate_1 := StrToInt64(Spec_Edit.Text);
  if Group_Edit.Text <> ''then
  AParameter.ID_Locate_2 := StrToInt64(Group_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  Faculty_Edit.Text:= vartostr(res[0]);
  Spec_Edit.Text:= vartostr(res[1]);
  Group_Edit.Text:= vartostr(res[2]);
 end;
end;

procedure TfrmSysOp.Group_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  if Faculty_Edit.Text <> '' then
  AParameter.ID_Locate := StrToInt64(Faculty_Edit.Text);
  if Spec_Edit.Text <> '' then
  AParameter.ID_Locate_1 := StrToInt64(Spec_Edit.Text);
  if Group_Edit.Text <> ''then
  AParameter.ID_Locate_2 := StrToInt64(Group_Edit.Text);
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  Faculty_Edit.Text:= vartostr(res[0]);
  Spec_Edit.Text:= vartostr(res[1]);
  Group_Edit.Text:= vartostr(res[2]);
 end;
end;

procedure TfrmSysOp.RapStatusProekt_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_RaportStatus.bpl','ShowSPRapStatus');

  if VarArrayDimCount(Res)>0
   then begin
     RapStatusProekt_Edit.text:= res[0];
   end;
  AParameter.Free;
end;

procedure TfrmSysOp.RapStatusVipolnen_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_RaportStatus.bpl','ShowSPRapStatus');

  if VarArrayDimCount(Res)>0
   then begin
     RapStatusVipolnen_Edit.text:= res[0];
   end;
  AParameter.Free;
end;

procedure TfrmSysOp.TypeDocOtchisl_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDocum.bpl','ShowSPTypeDocum');
  if VarArrayDimCount(Res)>0
   then begin
   TypeDocOtchisl_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;


procedure TfrmSysOp.TypeDocVosstanovl_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDocum.bpl','ShowSPTypeDocum');
  if VarArrayDimCount(Res)>0
   then begin
   TypeDocVosstanovl_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;


procedure TfrmSysOp.cn_namezvit_rap_na_otchisl_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  if VarArrayDimCount(Res)>0
   then begin
   cn_namezvit_rap_na_otchisl_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;

procedure TfrmSysOp.cn_namezvit_sch_yurliza_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  if VarArrayDimCount(Res)>0
   then begin
   cn_namezvit_sch_yurliza_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;

procedure TfrmSysOp.cn_ordertype_lgota_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  if VarArrayDimCount(Res)>0
   then begin
   cn_ordertype_lgota_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  if VarArrayDimCount(Res)>0
   then begin
   cn_ordertype_otchislenie_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_ordertype_tonextkurs_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  if VarArrayDimCount(Res)>0
   then begin
   cn_ordertype_tonextkurs_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_ordertype_vosstanovl_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  if VarArrayDimCount(Res)>0
   then begin
   cn_ordertype_vosstanovl_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;

procedure TfrmSysOp.cn_abitur_status_candidate_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  if VarArrayDimCount(Res)>0
   then begin
   cn_abitur_status_candidate_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_abitur_status_project_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  if VarArrayDimCount(Res)>0
   then begin
   cn_abitur_status_project_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_id_type_dog_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDog.bpl','ShowSPTypeDog');
  if VarArrayDimCount(Res)>0
   then begin
   cn_id_type_dog_Edit.Text  := vartostr(res[1]);
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_dog_status_deystv_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  if VarArrayDimCount(Res)>0
   then begin
   cn_dog_status_deystv_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_dog_status_rastorg_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  if VarArrayDimCount(Res)>0
   then begin
   cn_dog_status_rastorg_Edit.Text  := res[0];
   end;
  AParameter.Free;
 end;

procedure TfrmSysOp.cn_namezvit_credit_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  if VarArrayDimCount(Res)>0
   then begin
   cn_namezvit_credit_Edit.Text  := res[0];
   end;
  AParameter.Free;
end;

end.
