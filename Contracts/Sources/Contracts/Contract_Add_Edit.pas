unit Contract_Add_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, cxStyles, cxGridTableView, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridLevel, cxControls, cxGridCustomView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ImgList, dxBar, cxGroupBox,
  cxCalendar, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxContainer,
  cnConsts, cn_Common_Messages , DM, ibase, cnConsts_Messages, cxButtonEdit,
  cn_Common_Types, cn_Common_Loader,cn_Common_Funcs, Menus, ExtCtrls,
  cxSplitter, AccMGMT, DateUtils, GlobalSpr, uselect_valute;


  type TStageOplGenInfo = record
   ID_MAN  : int64;
   FIO     : string;
  end;
type
  Tfrm_Contracts_AE = class(TForm)
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Study_GroupBox: TcxGroupBox;
    Payers_GroupBox: TcxGroupBox;
    BarManager: TdxBarManager;
    BarDockControl_fio: TdxBarDockControl;
    Add_fio_BarrButton: TdxBarButton;
    PopupImageList: TImageList;
    Grid_fio: TcxGrid;
    Grid_fioTableView: TcxGridTableView;
    fio: TcxGridColumn;
    Grid_fioLevel: TcxGridLevel;
    BarDockControl_payers: TdxBarDockControl;
    Grid_payers: TcxGrid;
    Grid_payersTableView: TcxGridTableView;
    payer: TcxGridColumn;
    period: TcxGridColumn;
    persent: TcxGridColumn;
    Grid_payersLevel: TcxGridLevel;
    Edit_fio_BarButton: TdxBarButton;
    Delete_fio_BarButton: TdxBarButton;
    Add_payers_BarButton: TdxBarButton;
    Edit_payers_BarButton: TdxBarButton;
    Delete_payers_BarButton: TdxBarButton;
    Edit_study_PopupMenu: TdxBarPopupMenu;
    fio_modify_popup: TdxBarButton;
    papams_study_modify_popup: TdxBarButton;
    Periods_GroupBox: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    Grid_pay: TcxGrid;
    Grid_payTableView: TcxGridTableView;
    date_beg: TcxGridColumn;
    Grid_payLevel: TcxGridLevel;
    Istochniki_GroupBox: TcxGroupBox;
    dxBarDockControl2: TdxBarDockControl;
    Grid_istochniki: TcxGrid;
    Grid_istochnikiTableView: TcxGridTableView;
    Grid_istochnikiLevel: TcxGridLevel;
    date_end: TcxGridColumn;
    date_pay: TcxGridColumn;
    summa: TcxGridColumn;
    Add_period_BarButton: TdxBarButton;
    Edit_period_BarButton: TdxBarButton;
    Delete_period_BarButton: TdxBarButton;
    Flash_period_BarButton: TdxBarButton;
    BasicInfo_GroupBox: TcxGroupBox;
    Num_Dog_Edit: TcxTextEdit;
    Num_Dog_Label: TLabel;
    Date_Zakl_Label: TLabel;
    Date_Zakl_DateEdit: TcxDateEdit;
    Date_Beg_Label: TLabel;
    Date_Beg_DateEdit: TcxDateEdit;
    Date_End_Label: TLabel;
    Date_End_DateEdit: TcxDateEdit;
    Type_Dog_Label: TLabel;
    Base_Dog_RadioButton: TcxRadioButton;
    Addit_Dog_RadioButton: TcxRadioButton;
    smeta: TcxGridColumn;
    razdel: TcxGridColumn;
    statya: TcxGridColumn;
    kekv: TcxGridColumn;
    persent_prov: TcxGridColumn;
    Add_istochniki_BarButton: TdxBarButton;
    Edit_istochniki_BarButton: TdxBarButton;
    Delete_istochniki_BarButton: TdxBarButton;
    type_payer: TcxGridColumn;
    footer: TcxStyle;
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
    DexExpress_Style_AE: TcxGridTableViewStyleSheet;
    id_type_stage: TcxGridColumn;
    RasShet_Label: TLabel;
    date_beg_stufinf: TcxGridColumn;
    date_end_stufinf: TcxGridColumn;
    faculty_stufinf: TcxGridColumn;
    spec_stufinf: TcxGridColumn;
    group_stufinf: TcxGridColumn;
    formstudy_stufinf: TcxGridColumn;
    categorystudy_stufinf: TcxGridColumn;
    nazional_stufinf: TcxGridColumn;
    kurs_stufinf: TcxGridColumn;
    summa_stufinf: TcxGridColumn;
    id_faculty_studinf: TcxGridColumn;
    id_spec_studinf: TcxGridColumn;
    id_group_studinf: TcxGridColumn;
    id_formstudy_studinf: TcxGridColumn;
    id_categorystudy_studinf: TcxGridColumn;
    id_nazional_studinf: TcxGridColumn;
    SuperStyling_Header: TcxStyle;
    id_man: TcxGridColumn;
    isPercent: TcxGridColumn;
    id_smeta: TcxGridColumn;
    id_razdel: TcxGridColumn;
    id_statya: TcxGridColumn;
    id_kekv: TcxGridColumn;
    id_payer: TcxGridColumn;
    id_payer_stage_opl: TcxGridColumn;
    id_man_stage_opl: TcxGridColumn;
    id_rate_account: TcxGridColumn;
    mfo: TcxGridColumn;
    rate: TcxGridColumn;
    id_man_istochniki: TcxGridColumn;
    id_stud: TcxGridColumn;
    sum_entry_rest: TcxGridColumn;
    Accounts: TcxButtonEdit;
    LgotaButton: TdxBarButton;
    EntryRestButton: TdxBarButton;
    TreeBranchCloseBtn: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    TreeBranchOpenBtn: TdxBarButton;
    TreeFullCloseBtn: TdxBarButton;
    TreeFullOpenBtn: TdxBarButton;
    FullScreenBtn: TdxBarButton;
    FullScreenBtn2: TdxBarButton;
    num_year: TcxGridColumn;
    TreeFullOpenBtn_pay: TdxBarButton;
    TreeFullCloseBtn_pay: TdxBarButton;
    TreeBranchOpenBtn_pay: TdxBarButton;
    TreeBranchCloseBtn_pay: TdxBarButton;
    Flash_Payers_Button: TdxBarButton;
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    PopupMenu2: TPopupMenu;
    AddPop2: TMenuItem;
    EditPop2: TMenuItem;
    DeletePop2: TMenuItem;
    PopupMenu3: TPopupMenu;
    AddPop3: TMenuItem;
    EditPop3: TMenuItem;
    DeletePop3: TMenuItem;
    PopupMenu4: TPopupMenu;
    AddPop4: TMenuItem;
    EditPop4: TMenuItem;
    DeletePop4: TMenuItem;
    NextCursButton: TdxBarButton;
    DeleteAllPeriodsButton: TdxBarButton;
    DeleteAllStudButton: TdxBarButton;
    DeleteAllPayersButton: TdxBarButton;
    DeleteAllIstochnikiButton: TdxBarButton;
    Flash_Istoch_BarButton: TdxBarButton;
    TypeDogEdit: TcxButtonEdit;
    id_man_parent: TcxGridColumn;
    fio_parent: TcxGridColumn;
    ID_CUST_MEN_col: TcxGridColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    ComboPayersFilter: TcxComboBox;
    popupMenuPayers: TdxBarPopupMenu;
    btnKillAll: TdxBarButton;
    btnKillOnlyOne: TdxBarButton;
    OsvitPoslEdit: TcxButtonEdit;
    OsvitPosl: TLabel;
    Label1: TLabel;
    BarCode_Edit: TcxTextEdit;
    term_stud: TcxGridColumn;
    ButtonEdit_valute: TcxButtonEdit;
    Label2: TLabel;
    BarPopupMenu_add_stud: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Add_payers_BarButtonClick(Sender: TObject);
    procedure Edit_payers_BarButtonClick(Sender: TObject);
    procedure Add_fio_BarrButtonClick(Sender: TObject);
    procedure Add_period_BarButtonClick(Sender: TObject);
    procedure Edit_period_BarButtonClick(Sender: TObject);
    procedure Edit_fio_BarButtonClick(Sender: TObject);
    procedure Add_istochniki_BarButtonClick(Sender: TObject);
    procedure Edit_istochniki_BarButtonClick(Sender: TObject);
    procedure Num_Dog_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Zakl_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Beg_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_End_DateEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure Base_Dog_RadioButtonKeyPress(Sender: TObject; var Key: Char);
    procedure Addit_Dog_RadioButtonKeyPress(Sender: TObject;
      var Key: Char);
    procedure Grid_fioTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_payersTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_payTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_istochnikiTableViewKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Delete_istochniki_BarButtonClick(Sender: TObject);
    procedure Delete_period_BarButtonClick(Sender: TObject);
    procedure Delete_fio_BarButtonClick(Sender: TObject);
    procedure Delete_payers_BarButtonClick(Sender: TObject);
    procedure Grid_payTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_istochnikiTableViewKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Grid_fioTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_payersTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_fioTableViewDblClick(Sender: TObject);
    procedure Grid_payersTableViewDblClick(Sender: TObject);
    procedure Grid_payTableViewDblClick(Sender: TObject);
    procedure Grid_istochnikiTableViewDblClick(Sender: TObject);
    procedure papams_study_modify_popupClick(Sender: TObject);
    procedure fio_modify_popupClick(Sender: TObject);
    procedure RasShet_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_fioEnter(Sender: TObject);
    procedure Grid_fioExit(Sender: TObject);
    procedure Grid_payersEnter(Sender: TObject);
    procedure Grid_payEnter(Sender: TObject);
    procedure Grid_istochnikiEnter(Sender: TObject);
    procedure Grid_payersExit(Sender: TObject);
    procedure Grid_payExit(Sender: TObject);
    procedure Grid_istochnikiExit(Sender: TObject);
    procedure AccountsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AccountsKeyPress(Sender: TObject; var Key: Char);
    procedure LgotaButtonClick(Sender: TObject);
    procedure EntryRestButtonClick(Sender: TObject);
    procedure TreeBranchCloseBtnClick(Sender: TObject);
    procedure TreeBranchOpenBtnClick(Sender: TObject);
    procedure TreeFullOpenBtnClick(Sender: TObject);
    procedure TreeFullCloseBtnClick(Sender: TObject);
    procedure FullScreenBtnClick(Sender: TObject);
    procedure FullScreenBtn2Click(Sender: TObject);
    procedure Flash_period_BarButtonClick(Sender: TObject);
    procedure TreeFullOpenBtn_payClick(Sender: TObject);
    procedure TreeFullCloseBtn_payClick(Sender: TObject);
    procedure TreeBranchOpenBtn_payClick(Sender: TObject);
    procedure TreeBranchCloseBtn_payClick(Sender: TObject);
    procedure Flash_Payers_ButtonClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure AddPop2Click(Sender: TObject);
    procedure AddPop3Click(Sender: TObject);
    procedure AddPop4Click(Sender: TObject);
    procedure EditPop2Click(Sender: TObject);
    procedure EditPop3Click(Sender: TObject);
    procedure EditPop4Click(Sender: TObject);
    procedure DeletePop2Click(Sender: TObject);
    procedure DeletePop3Click(Sender: TObject);
    procedure DeletePop4Click(Sender: TObject);
    procedure Num_Dog_EditPropertiesEditValueChanged(Sender: TObject);
    procedure NextCursButtonClick(Sender: TObject);
    procedure DeleteAllStudButtonClick(Sender: TObject);
    procedure DeleteAllPayersButtonClick(Sender: TObject);
    procedure DeleteAllPeriodsButtonClick(Sender: TObject);
    procedure DeleteAllIstochnikiButtonClick(Sender: TObject);
    procedure Flash_Istoch_BarButtonClick(Sender: TObject);
    procedure TypeDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDogEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeDogEditExit(Sender: TObject);
    procedure ComboPayersFilterPropertiesChange(Sender: TObject);
    procedure btnKillAllClick(Sender: TObject);
    procedure btnKillOnlyOneClick(Sender: TObject);
    procedure OsvitPoslEditKeyPress(Sender: TObject; var Key: Char);
    procedure OsvitPoslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_valutePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
  private
    DM:TDM_Contracts;
    cn_use_new_stage_opl, cn_end_month : Integer;
    Max_kol_month_study : Integer;
    now_date : TDateTime;
    use_old_hist_price : Boolean;
    IsGenerateNumDog : Boolean;

    procedure FormIniLanguage;
    procedure TableUpdateIndexValue(Grid: TcxGridTableView; old_value: variant; new_value: variant; columnindex: integer);
    procedure SetFilterPayers(Value: string);
    procedure BuildComboPayersFilter();
    function Check_Grid_fioTableView_on_Errors : boolean;
    function DeleteAllTableRecords(Sender: TcxGridTableView): boolean;
    function GetIDPayer (AValue: string) : string;
  public
    DB_Handle_ae: TISC_DB_HANDLE; //здесь храню хэндл базы
    is_collect : byte;
    ID_INT_Account : int64;
    ID_DOG_ROOT, ID_DOG, ID_STUD_in    : int64;
    ID_TYPE_DOG    : int64;
    ID_TYPE_ACTION : int64;
    ID_VALUTE : int64;
    PLanguageIndex:byte;
    cnParamsToAddContract :TcnParamsToAddContract;
    cn_StudInfo : boolean;
    cn_Payers   : boolean;
    cn_StageOpl : boolean;
    cn_Finace   : boolean;
    ExtraMode : boolean;
    PereofMode: Integer;
    CN_USE_EDBO_FIZ_LIC : Integer;

    Summ1, Summ2, Summ3, Summ4,
    Summ5, Summ6, Summ7, Summ8  : Double;

    term_stud1, term_stud2, term_stud3, term_stud4,
    term_stud5, term_stud6, term_stud7, term_stud8 : Integer;

    Date_beg_stud1, Date_beg_stud2, Date_beg_stud3, Date_beg_stud4, Date_beg_stud5, Date_beg_stud6, Date_beg_stud7, Date_beg_stud8,
    Date_end_stud1, Date_end_stud2, Date_end_stud3, Date_end_stud4, Date_end_stud5, Date_end_stud6, Date_end_stud7, Date_end_stud8 : TDate;

    kurs, kurs_beg : Integer;

    is_admin, change_stage_opl: Boolean;
    dont_make_change : Boolean;

    id_dog_status : int64;

    IS_DONGUET : Integer;

    constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle: TISC_DB_HANDLE; collect : byte; is_admin:boolean);reintroduce;
  end;

var
  frm_Contracts_AE: Tfrm_Contracts_AE;

implementation

uses Contracts_Payer_AE, Contracts_Study_AE, Contracts_Periods_AE,
  Contracts_Istochniki_AE, Contracts_StudInf_AE, FIBQuery,
  cxDBLookupComboBox, UGetParamValueforstud, FIBDataSet, DB, uSelected_param_edbo; 

{$R *.dfm}


constructor Tfrm_Contracts_AE.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle: TISC_DB_HANDLE; collect : byte;is_admin:Boolean);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 self.is_admin:=is_admin;
 PLanguageIndex:= LanguageIndex;
 ID_TYPE_ACTION:=-1;
 FormIniLanguage();
 DB_Handle_ae:= DB_Handle; //здесь храню хэндл базы
 is_collect := collect;

 cn_StudInfo := false;
 cn_Payers   := false;
 cn_StageOpl := false;
 cn_Finace   := false;

 dont_make_change:=True;

 Screen.Cursor:=crDefault;
end;


procedure Tfrm_Contracts_AE.FormIniLanguage;
begin
 // групбоксы формы
BasicInfo_GroupBox.Caption:=    cnConsts.cn_BasicInfo_GroupBox[PLanguageIndex];
Study_GroupBox.Caption:=        cnConsts.cn_Study_GroupBox[PLanguageIndex];
Payers_GroupBox.Caption:=       cnConsts.cn_Payers_GroupBox[PLanguageIndex];
Periods_GroupBox.Caption:=      cnConsts.cn_Periods_GroupBox[PLanguageIndex];
Istochniki_GroupBox.Caption:=   cnConsts.cn_Istochniki_GroupBox[PLanguageIndex];

 // попап
 AddPop.Caption :=              cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=             cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

 AddPop2.Caption :=              cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop2.Caption :=             cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop2.Caption :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

 AddPop3.Caption :=              cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop3.Caption :=             cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop3.Caption :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

 AddPop4.Caption :=              cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop4.Caption :=             cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop4.Caption :=           cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

// лейблы и кнопки
Num_Dog_Label.Caption:=         cnConsts.cn_Num_Dog_Label[PLanguageIndex];

Num_Dog_Label.Caption:=         cnConsts.cn_Num_Dog_Label[PLanguageIndex];
Date_Zakl_Label.Caption:=       cnConsts.cn_Date_Zakl_Label[PLanguageIndex];
Date_Beg_Label.Caption:=        cnConsts.cn_Date_Beg_Label[PLanguageIndex];
Date_End_Label.Caption:=        cnConsts.cn_Date_End_Label[PLanguageIndex];
Type_Dog_Label.Caption:=        cnConsts.cn_Type_Dog_Label[PLanguageIndex];
RasShet_Label.Caption:=         cnConsts.cn_RaschetSchet_Title[PLanguageIndex];

Base_Dog_RadioButton.Caption:=  cnConsts.cn_Basic_Dog_Label[PLanguageIndex];
Addit_Dog_RadioButton.Caption:= cnConsts.cn_Addit_Dog_Label[PLanguageIndex];

OkButton.Caption:=              cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=          cnConsts.cn_Cancel[PLanguageIndex];

// додати-змінити-видалити
Add_fio_BarrButton.Hint:=          cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
Edit_fio_BarButton.Hint:=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
Delete_fio_BarButton.Hint:=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

Add_payers_BarButton.Hint:=        cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
Edit_payers_BarButton.Hint:=       cnConsts.cn_EditBtn_Caption[PLanguageIndex];
Delete_payers_BarButton.Hint:=     cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

Add_period_BarButton.Hint:=        cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
Edit_period_BarButton.Hint:=       cnConsts.cn_EditBtn_Caption[PLanguageIndex];
Delete_period_BarButton.Hint:=     cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

LgotaButton.Hint:=          cnConsts.cn_Lgota_Caption[PLanguageIndex];
EntryRestButton.Hint:=      cnConsts.cn_EntryRest_Caption[PLanguageIndex];

Add_istochniki_BarButton.Hint:=    cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
Edit_istochniki_BarButton.Hint:=   cnConsts.cn_EditBtn_Caption[PLanguageIndex];
Delete_istochniki_BarButton.Hint:= cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];

btnKillAll.Caption:=    cnConsts.cn_KillAll[PLanguageIndex];
btnKillAll.Hint:=       cnConsts.cn_KillAll[PLanguageIndex];
btnKillOnlyOne.Caption:=cnConsts.cn_KillOnlyOne[PLanguageIndex];
btnKillOnlyOne.Hint:=   cnConsts.cn_KillOnlyOne[PLanguageIndex];

NextCursButton.Hint:= cnConsts.cn_NextCursAvto[PLanguageIndex];

// грид
Grid_fioTableView.Columns[0].Caption:=     cnConsts.cn_grid_FIO_Column[PLanguageIndex];

Grid_fioTableView.Columns[1].Caption:=     cnConsts.cn_BegDate_Short[PLanguageIndex];
Grid_fioTableView.Columns[2].Caption:=     cnConsts.cn_EndDate_Short[PLanguageIndex];
Grid_fioTableView.Columns[3].Caption:=     cnConsts.cn_footer_Faculty[PLanguageIndex];
Grid_fioTableView.Columns[4].Caption:=     cnConsts.cn_footer_Spec[PLanguageIndex];
Grid_fioTableView.Columns[5].Caption:=     cnConsts.cn_footer_Group[PLanguageIndex];
Grid_fioTableView.Columns[6].Caption:=     cnConsts.cn_footer_FormStudy[PLanguageIndex];
Grid_fioTableView.Columns[7].Caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
Grid_fioTableView.Columns[8].Caption:=     cnConsts.cn_Gragdanstvo[PLanguageIndex];
Grid_fioTableView.Columns[9].Caption:=     cnConsts.cn_footer_Kurs[PLanguageIndex];

Grid_payersTableView.Columns[0].Caption:=  cnConsts.cn_Payer_Column[PLanguageIndex];
Grid_payersTableView.Columns[1].Caption:=  cnConsts.cn_Period_Column[PLanguageIndex];

Grid_payTableView.Columns[0].Caption:=     cnConsts.cn_grid_Date_Beg[PLanguageIndex];
Grid_payTableView.Columns[1].Caption:=     cnConsts.cn_grid_Date_End[PLanguageIndex];
Grid_payTableView.Columns[2].Caption:=     cnConsts.cn_Date_Opl_Column[PLanguageIndex];
Grid_payTableView.Columns[3].Caption:=     cnConsts.cn_Summa_Column[PLanguageIndex];

Grid_istochnikiTableView.Columns[0].Caption:=     cnConsts.cn_Smeta[PLanguageIndex];
Grid_istochnikiTableView.Columns[1].Caption:=     cnConsts.cn_Razdel[PLanguageIndex];
Grid_istochnikiTableView.Columns[2].Caption:=     cnConsts.cn_Statya[PLanguageIndex];
Grid_istochnikiTableView.Columns[3].Caption:=     cnConsts.cn_Kekv[PLanguageIndex];
Grid_istochnikiTableView.Columns[4].Caption:=     cnConsts.cn_Persent_Column[PLanguageIndex];
num_year.Caption:=                                cnConsts.cn_AcademYear[PLanguageIndex];

//поп_ап грида
fio_modify_popup.Caption:=                 cnConsts.cn_FIOModify_Caption[PLanguageIndex];
papams_study_modify_popup.Caption:=        cnConsts.cn_ParamStudyModify_Caption[PLanguageIndex];

TreeBranchOpenBtn.Hint:=                 cnConsts.cn_tree_BranchOpen[PLanguageIndex];
TreeBranchCloseBtn.Hint:=                cnConsts.cn_tree_BranchClose[PLanguageIndex];
TreeFullOpenBtn.Hint:=                   cnConsts.cn_tree_FullOpen[PLanguageIndex];
TreeFullCloseBtn.Hint:=                  cnConsts.cn_tree_FullClose[PLanguageIndex];
TreeBranchOpenBtn_pay.Hint:=             cnConsts.cn_tree_BranchOpen[PLanguageIndex];
TreeBranchCloseBtn_pay.Hint:=            cnConsts.cn_tree_BranchClose[PLanguageIndex];
TreeFullOpenBtn_pay.Hint:=               cnConsts.cn_tree_FullOpen[PLanguageIndex];
TreeFullCloseBtn_pay.Hint:=              cnConsts.cn_tree_FullClose[PLanguageIndex];
FullScreenBtn.Caption:=                  cnConsts.cn_tree_FullScreen[PLanguageIndex];
FullScreenBtn2.Caption:=                 cnConsts.cn_tree_FullScreen[PLanguageIndex];

DeleteAllStudButton.Hint:=               cn_DelAll_Caption[PLanguageIndex];
DeleteAllPeriodsButton.Hint:=            cn_DelAll_Caption[PLanguageIndex];
DeleteAllPayersButton.Hint:=             cn_DelAll_Caption[PLanguageIndex];
DeleteAllIstochnikiButton.Hint:=         cn_DelAll_Caption[PLanguageIndex];
end;



procedure Tfrm_Contracts_AE.OkButtonClick(Sender: TObject);
var
  maxdate : TDate;
  i : byte;
  CN_CHECK_OSVIT_POSL : Integer;
begin
  If Num_Dog_Edit.text = '' then
  begin
   showmessage(cnConsts.cn_Num_Dog_Need[PLanguageIndex]);
   Num_Dog_Edit.SetFocus;
   exit;
  end;

  if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
   begin
     // проверяю на наличие такого же номера в системе
    DM := TDM_Contracts.Create(self);
    DM.DB.Handle := DB_Handle_ae;
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SelectSQL.Clear;
    DM.ReadDataSet.SelectSQL.Text := 'select * from CN_CHECK_NUM_DOG(' + ''''+Num_Dog_Edit.Text+ ''''+')';
    DM.ReadDataSet.Open;
    if DM.ReadDataSet['IS_EXISTS'] = 1 then
     begin
       cn_Common_Messages.cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex], cnConsts_Messages.cn_CheckNumDogFalse[PLanguageIndex], mtError, [mbYes]);
       Num_Dog_Edit.SetFocus;
       DM.ReadDataSet.Close;
       DM.Free;
       exit;
     end
     else
      begin
       DM.ReadDataSet.Close;
       DM.Free;
      end;
  end;

  if Date_Zakl_DateEdit.text = '' then
  begin
   showmessage(cnConsts.cn_Date_Dog_Need[PLanguageIndex]);
   Date_Zakl_DateEdit.SetFocus;
   exit;
  end;

    if Date_Beg_DateEdit.text = '' then
  begin
   showmessage(cnConsts.cn_Periods_Date_Beg_Need[PLanguageIndex]);
   Date_Beg_DateEdit.SetFocus;
   exit;
  end;

    if Date_End_DateEdit.text = '' then
  begin
   showmessage(cnConsts.cn_Periods_Date_End_Need[PLanguageIndex]);
   Date_End_DateEdit.SetFocus;
   exit;
  end;

   if TypeDogEdit.text = '' then
  begin
   showmessage(cn_Some_Need[PLanguageIndex]);
   TypeDogEdit.SetFocus;
   exit;
  end;

  if OsvitPoslEdit.Text = '' then
   Begin
    DM := TDM_Contracts.Create(self);
    DM.DB.Handle := DB_Handle_ae;
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SelectSQL.Clear;
    DM.ReadDataSet.SelectSQL.Text := 'select * from PUB_SYS_DATA';
    DM.ReadDataSet.Open;

    If DM.ReadDataSet['CN_CHECK_OSVIT_POSL'] <> null
     then CN_CHECK_OSVIT_POSL := DM.ReadDataSet['CN_CHECK_OSVIT_POSL']
     else CN_CHECK_OSVIT_POSL := 1;

    if CN_CHECK_OSVIT_POSL = 1 then
     Begin
      ShowMessage('Необхідно обрати тип послуги!');
      OsvitPoslEdit.SetFocus;
      Exit;
     end; 
   end;

  if Grid_payersTableView.DataController.RecordCount <>0 then
   if ((Persent.Properties as TcxCurrencyEditProperties).DisplayFormat = '0.0000 %') then
    if  StrToFloat(Grid_payersTableView.DataController.Summary.FooterSummaryValues[0]) <> 100 then
     begin
       showmessage('Сума вітсотків по сплаті не може бути відмінною від 100%');
       Grid_payers.SetFocus;
       exit;
     end;

    if (
       ((Grid_fioTableView.DataController.RecordCount = 0)
       or
        (Grid_payersTableView.DataController.RecordCount = 0))
       or
        ((Grid_payTableView.DataController.RecordCount = 0)
       or
        (Grid_istochnikiTableView.DataController.RecordCount = 0)))
    then
    begin
     ShowMessage(cnConsts_Messages.cn_AllData_Need[PLanguageIndex]);
     exit;
    end;

  for i := 0 to Grid_istochnikiTableView.DataController.RecordCount - 1 do
   if Grid_istochnikiTableView.DataController.Values[i, 0] = 0 then
    begin
     ShowMessage('Необхідно обрати бюджет!');
     Grid_istochniki.SetFocus;
     exit;
    end;

  if Date_Beg_DateEdit.Date >= Date_End_DateEdit.Date then
   begin
    ShowMessage(cnConsts_Messages.cn_DateBegNeedMoreDateEnd[PLanguageIndex]);
    Date_End_DateEdit.SetFocus;
    exit;
   end;

 maxdate:= strtodate(Grid_payTableView.DataController.Values[0, 1]);
 for i:=0 to Grid_payTableView.DataController.RecordCount - 1 do
 begin
  if strtodate(Grid_payTableView.DataController.Values[i, 1]) > maxdate then
  maxdate := strtodate(Grid_payTableView.DataController.Values[i, 1]);
 end;

  if Date_End_DateEdit.Date <> maxdate then
 begin
  ShowMessage(cnConsts_Messages.cn_NoDateEndVSEndRozbivka[PLanguageIndex]);
  Date_End_DateEdit.SetFocus;
  exit;
 end;

  if ((Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex]) and (not Addit_Dog_RadioButton.Checked)) then
   begin
    DM := TDM_Contracts.Create(self);
    DM.DB.Handle := DB_Handle_ae;
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_CHECK_EXIST_OF_CANDIDATE(:fio,:id_facul,:id_spec,:id_national,:id_form_stud,:id_kat_stud)';
    DM.ReadDataSet.ParamByName('FIO').AsString := Grid_fioTableView.DataController.Values[0, 0];
    DM.ReadDataSet.ParamByName('id_facul').asInt64 := StrToInt(Grid_fioTableView.DataController.Values[0, 11]);
    DM.ReadDataSet.ParamByName('id_spec').asInt64 := StrToInt(Grid_fioTableView.DataController.Values[0, 12]);
    DM.ReadDataSet.ParamByName('id_national').asInt64 := StrToInt(Grid_fioTableView.DataController.Values[0, 16]);
    DM.ReadDataSet.ParamByName('id_form_stud').asInt64 := StrToInt(Grid_fioTableView.DataController.Values[0, 14]);
    DM.ReadDataSet.ParamByName('id_kat_stud').asInt64 := StrToInt(Grid_fioTableView.DataController.Values[0, 15]);
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;

    id_dog_status := 3;
    if DM.ReadDataSet.RecordCount <> 0 then
     Begin
      i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Договір з такими параметрами навчання вже існує!'+#10#13+'Зберегти цей контракт в статусі кандидат?', mtConfirmation, [mbYes, mbNo]);
      If i = 6 then //YES
       begin
         DM.WriteTransaction.StartTransaction;
         DM.StProc.StoredProcName := 'CN_DT_UPDATE_DOG_STATUS';
         DM.StProc.ParamByName('ID_Dog_root').asInt64 := DM.ReadDataSet['ID_DOG_ROOT'];
         DM.StProc.ParamByName('ID_Dog').asInt64      := DM.ReadDataSet['ID_DOG'];
         DM.StProc.ExecProc;
         try
           DM.WriteTransaction.Commit;
         except
           DM.WriteTransaction.Rollback;
           raise;
         End;
       end;
      If i = 7 then id_dog_status := 2;
     End;
     DM.Free;
   End;
   
  ModalResult:=mrOk;
end;

procedure Tfrm_Contracts_AE.CancelButtonClick(Sender: TObject);
begin
 close;
end;

procedure Tfrm_Contracts_AE.FormShow(Sender: TObject);
var IsGenNumDog: boolean;
 DM2: TDM_Contracts;
 i: Integer;
 kav : string;
 year,month,day:Word;
 Date_beg_price, Date_end_price : TDate;
 id_price_param : Int64;
 date_beg_term, date_end_term : TDate;
 cnAcademicYear    : TcnAcademicYear;
begin
  DM:=TDM_Contracts.Create(Self);
  DM.DB.Handle:=DB_Handle_ae;
  DM.ReadTransaction.StartTransaction;

  //Текущая дата
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_SYS_CURRENT_DATE';
  DM.ReadDataSet.Open;
  If DM.ReadDataSet['currentdate'] <> null
   then now_date := DM.ReadDataSet['currentdate']
   else now_date := date;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from PUB_SYS_DATA';
  DM.ReadDataSet.Open;

  if DM.ReadDataSet['CN_END_MONTH']<> null
   then cn_end_month := DM.ReadDataSet.fieldByName('CN_END_MONTH').asinteger
   else cn_end_month := 0;

  If DM.ReadDataSet['CN_USE_NEW_STAGE_OPL'] <> null
   then cn_use_new_stage_opl := DM.ReadDataSet['CN_USE_NEW_STAGE_OPL']
   else cn_use_new_stage_opl := 1;

  use_old_hist_price := True;
  if DM.ReadDataSet['cn_use_old_hist_price'] <> null
   then if DM.ReadDataSet['cn_use_old_hist_price'] = 0 then use_old_hist_price := False;

  DM.ReadDataSet.Close;
  DM.Free;

  if TypeDogEdit.Text='' then
   begin
    //Заполняю тип договора по умолчанию------------------------------------------
    DM2:=TDM_Contracts.Create(Self);
    DM2.DB.Handle:=DB_Handle_ae;
    DM2.ReadDataSet.close;
    DM2.ReadDataSet.SQLs.SelectSQL.Text := 'SELECT FIRST(1) * FROM CN_INI_TYPE_DOG WHERE ISMAINDOG=1';
    DM2.ReadDataSet.Open;
    IF (not DM2.ReadDataSet.IsEmpty) then
     Begin
      ID_TYPE_DOG:=DM2.ReadDataSet['ID_TYPE_DOG'];
      TypeDogEdit.Text:=DM2.ReadDataSet['CODENAME'];
      //NameTypeDogLabel.Caption:=DM2.ReadDataSet['NAME'];
      Base_Dog_RadioButton.Checked := True;
     End;
    DM2.ReadDataSet.close;
    dm2.free;
   End;

 DM2:=TDM_Contracts.Create(Self);
 DM2.DB.Handle:=DB_Handle_ae;
 DM2.ReadDataSet.Close;
 DM2.ReadDataSet.SelectSQL.Clear;
 DM2.ReadDataSet.SelectSQL.add('select first(1) a.id_type_action as id, a.name_action as name from cn_dt_dog d');
 DM2.ReadDataSet.SelectSQL.add('inner join cn_ini_type_action a on d.id_type_action=a.id_type_action');
 DM2.ReadDataSet.SelectSQL.add('where id_dog_root=:id_dog_root and use_end=:use_end');
 DM2.ReadDataSet.SelectSQL.add('order by d.id_dog_root desc');
 DM2.ReadDataSet.ParamByName('ID_dog_root').AsInt64:=ID_DOG_ROOT;
 DM2.ReadDataSet.ParamByName('Use_end').AsDate:=StrToDate('01.01.3050');
 DM2.ReadDataSet.Open;
 if DM2.ReadDataSet['name']<>null then OsvitPoslEdit.Text:=DM2.ReadDataSet['name'];
 if DM2.ReadDataSet['id']<>null then ID_TYPE_ACTION:=DM2.ReadDataSet['ID'];
 DM2.ReadDataSet.Close;

  kav := '''';
if Grid_fioTableView.DataController.RecordCount>0 then
Grid_fioTableView.DataController.FocusedRecordIndex:=0;
if Grid_payersTableView.DataController.RecordCount>0 then
Grid_payersTableView.DataController.FocusedRecordIndex:=0;
if Grid_payTableView.DataController.RecordCount>0 then
Grid_payTableView.DataController.FocusedRecordIndex:=0;
if Grid_istochnikiTableView.DataController.RecordCount>0 then
Grid_istochnikiTableView.DataController.FocusedRecordIndex:=0;

if (Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 5] =1)
then
 begin
  Grid_payersTableView.Columns[2].Caption:=  cnConsts.cn_Persent_Column[PLanguageIndex];
 (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
 end
else
 begin
  Grid_payersTableView.Columns[2].Caption:=  cnConsts.cn_Summa_Column[PLanguageIndex];
  (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.00 грн.';
 end;
if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
 begin
  Grid_payersTableView.Columns[2].Caption:=  cnConsts.cn_Persent_Column[PLanguageIndex];
 (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
 end;

BuildComboPayersFilter;

 if is_collect = 1  then
 begin
 TreeFullCloseBtnClick(Sender);
 TreeFullCloseBtn_payClick(Sender);
 end
 else
 begin
 TreeFullOpenBtnClick(Sender);
 TreeFullOpenBtn_payClick(Sender);
 end;

  //---------------------------EXTRAMODE------------------------------------------
  if ExtraMode then // если режим для Абитуриента
   begin
    Add_fio_BarrButton.Enabled   := False;
    Delete_fio_BarButton.Enabled := False;
    DeleteAllStudButton.Enabled  := False;
    NextCursButton.Enabled       := False;

    // добавляю автоматом номер контракта в режиме ADD
    // авто-добавление номера контракта
    if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
     begin
      // проверяем признак автогенерации
      DM2:=TDM_Contracts.Create(Self);
      DM2.DB.Handle:=DB_Handle_ae;
      DM2.ReadDataSet.Close;
      DM2.ReadDataSet.SelectSQL.Clear;
      DM2.ReadDataSet.SelectSQL.Text := 'select CN_IS_GENERATE_NUM_DOG from CN_CHECK_NUMDOG_GENERATION';
      DM2.ReadDataSet.Open;
      IsGenNumDog := bool(DM2.ReadDataSet['CN_IS_GENERATE_NUM_DOG']);
      DM2.ReadDataSet.Close;
      if IsGenNumDog then
       begin
        DM2.StProc.StoredProcName := 'CN_GET_NUMDOG_AVTO';
        DM2.StProc.Transaction.StartTransaction;
        DM2.StProc.Prepare;
        DM2.StProc.ParamByName('ID_DEPARTMENT').AsInt64 := cnParamsToAddContract.ID_DEPARTMENT;
        DM2.StProc.ParamByName('IS_FACUL').AsInteger := 0;
        DM2.StProc.ParamByName('ID_FORM_STUD').AsInt64 := cnParamsToAddContract.ID_FORM_STUD;
        DM2.StProc.ParamByName('DATE_DOG').Value := cnParamsToAddContract.DATE_BEG;
        DM2.StProc.ExecProc;
        Num_Dog_Edit.Text := DM2.StProc.ParamByName('NUM_DOG').AsString;
        DM2.StProc.Transaction.Commit;
       end;
      DM2.Free;
     end;

    DM:=TDM_Contracts.Create(Self);
    DM.DB.Handle:=DB_Handle_ae;
    DM.StProc.StoredProcName := 'CN_GET_ABITUR_PARAM_NAMES_BY_ID';
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID_MAN').AsInt64        := cnParamsToAddContract.ID_MAN;
    DM.StProc.ParamByName('ID_DEPARTMENT').AsInt64 := cnParamsToAddContract.ID_DEPARTMENT;
    DM.StProc.ParamByName('ID_SPEC').AsInt64       := cnParamsToAddContract.ID_SPEC;
    DM.StProc.ParamByName('ID_GROUP').AsInt64      := cnParamsToAddContract.ID_GROUP;
    DM.StProc.ParamByName('ID_FORM_STUD').AsInt64  := cnParamsToAddContract.ID_FORM_STUD;
    DM.StProc.ParamByName('ID_KAT_STUD').AsInt64   := cnParamsToAddContract.ID_KAT_STUD;
    DM.StProc.ParamByName('ID_NATIONAL').AsInt64   := cnParamsToAddContract.ID_NATIONAL;
    DM.StProc.ExecProc;

    dont_make_change:=True;
    if ((DM.StProc.ParamByName('name_nazional').AsString ='') or (DM.StProc.ParamByName('name_nazional').AsVariant = null) or
        (DM.StProc.ParamByName('name_form_stud').AsVariant='') or (DM.StProc.ParamByName('name_form_stud').AsVariant = null) or
        (DM.StProc.ParamByName('name_kat_stud').AsVariant='') or (DM.StProc.ParamByName('name_kat_stud').AsVariant = null) or
        (DM.StProc.ParamByName('name_facul').AsVariant='') or (DM.StProc.ParamByName('name_facul').AsVariant = null) or
        (DM.StProc.ParamByName('name_spec').AsVariant='') or (DM.StProc.ParamByName('name_spec').AsVariant = null) or
        (DM.StProc.ParamByName('name_group').AsVariant='') or (DM.StProc.ParamByName('name_group').AsVariant = null) or
        (DM.StProc.ParamByName('fio_people').AsVariant='') or (DM.StProc.ParamByName('fio_people').AsVariant = null) or
        (DM.StProc.ParamByName('id_facul').AsVariant=null))
     then dont_make_change:=True;

    // !!!!!!!
    cnParamsToAddContract.ID_DEPARTMENT := DM.StProc.ParamByName('ID_FACUL').AsInt64;

    if((cnParamsToAddContract.ID_MAN<=0) or
       (cnParamsToAddContract.ID_DEPARTMENT<=0) or
       (cnParamsToAddContract.ID_SPEC<=0) or
       (cnParamsToAddContract.ID_GROUP<=0) or
       (cnParamsToAddContract.ID_FORM_STUD<=0) or
       (cnParamsToAddContract.ID_KAT_STUD<=0) or
       (cnParamsToAddContract.ID_NATIONAL<=0))
     then dont_make_change:=False;

    cnAcademicYear:=cn_Common_Funcs.AcademicYear(cnParamsToAddContract.DATE_BEG);
    Date_Beg_DateEdit.EditValue := cnParamsToAddContract.DATE_BEG;
    //ShowMessage(DateToStr(cnParamsToAddContract.DATE_BEG));
    //Date_End_DateEdit.EditValue := cnParamsToAddContract.DATE_END;

    Grid_fioTableView.DataController.RecordCount := Grid_fioTableView.DataController.RecordCount + 1;
    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 0]  := DM.StProc.ParamByName('FIO_PEOPLE').AsString;
    {ид_ман}  Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 17] := cnParamsToAddContract.ID_MAN;

    {дата_начала}        Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 1] :=  cnParamsToAddContract.DATE_BEG;
    {дата_конца}         Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 2] :=  cnAcademicYear.Date_End; //cnParamsToAddContract.DATE_END;
    {факультет}          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.StProc.ParamByName('NAME_FACUL').AsString;
    {специальность}      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.StProc.ParamByName('NAME_SPEC').AsString;
    {группа}             Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 5] :=  DM.StProc.ParamByName('NAME_GROUP').AsString;
    {форма_обучения}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.StProc.ParamByName('NAME_FORM_STUD').AsString;
    {категория_обучения} Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.StProc.ParamByName('NAME_KAT_STUD').AsString;
    {национальность}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.StProc.ParamByName('NAME_NAZIONAL').AsString;
    {курс}               Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 9] :=  cnParamsToAddContract.KURS;
    {сумма}              Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 10] := 0;

    {ид_факультета}      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 11] := cnParamsToAddContract.ID_DEPARTMENT;
    {ид_спец}            Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 12] := cnParamsToAddContract.ID_SPEC;
    {ид_группы}          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 13] := cnParamsToAddContract.ID_GROUP;
    {ид_формыобуч}       Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 14] := cnParamsToAddContract.ID_FORM_STUD;
    {ид_категоробуч}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 15] := cnParamsToAddContract.ID_KAT_STUD;
    {ид_национал}        Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 16] := cnParamsToAddContract.ID_NATIONAL;

    DM.StProc.Transaction.Commit;
    DM.StProc.Close;
    DM.Free;

    Grid_fioTableView.DataController.FocusedRecordIndex := 0;
    Flash_Payers_ButtonClick(Sender);

    //----------------------------далее-работаем-с-прейскурантом----------------
     {проверим наличие записи в прейскуранте с присланными
      параметрами обучения в присланном периоде действия прейскуранта}

    DM:=TDM_Contracts.Create(Self);
    DM.DB.Handle:=DB_Handle_ae;

    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Clear;
    DM.ReadDataSet.SQLs.SelectSQL.Add('SELECT * FROM CN_GET_TERM_STUD_BY_PARAM(:id_facul,');
    DM.ReadDataSet.SQLs.SelectSQL.Add(':id_spec,');
    DM.ReadDataSet.SQLs.SelectSQL.Add(':id_form_stud,');
    DM.ReadDataSet.SQLs.SelectSQL.Add(':id_kat_stud,');
    DM.ReadDataSet.SQLs.SelectSQL.Add(':id_national) order by term_stud');

    DM.ReadDataSet.ParamByName('id_facul').AsInt64     := cnParamsToAddContract.ID_DEPARTMENT;
    DM.ReadDataSet.ParamByName('id_spec').AsInt64      := cnParamsToAddContract.ID_SPEC;
    DM.ReadDataSet.ParamByName('id_form_stud').AsInt64 := cnParamsToAddContract.ID_FORM_STUD;
    DM.ReadDataSet.ParamByName('id_kat_stud').AsInt64  := cnParamsToAddContract.ID_KAT_STUD;
    DM.ReadDataSet.ParamByName('id_national').AsInt64  := cnParamsToAddContract.ID_NATIONAL;

    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    kurs_beg := 1;
    id_price_param := -1;

    while not DM.ReadDataSet.Eof do
     Begin
      if DM.ReadDataSet['Kurs'] <> null
       then kurs_beg := DM.ReadDataSet['Kurs']
       else kurs_beg := 1;

      Date_beg_price := cnParamsToAddContract.DATE_BEG;
      Date_end_price := cnAcademicYear.Date_End;

      if use_old_hist_price then
       Begin
        DecodeDate(cnAcademicYear.Date_Beg, year, month, day);
        Year := Year - (cnParamsToAddContract.KURS - kurs_beg);
        Date_beg_price := EncodeDate(Year, Month, Day);

        DecodeDate(cnAcademicYear.Date_End, year, month, day);
        Year := Year - (cnParamsToAddContract.KURS - kurs_beg);
        Date_end_price := EncodeDate(Year, Month, Day);
       End;

      Date_beg_term := DM.ReadDataSet['Date_beg'];
      Date_end_term := DM.ReadDataSet['Date_end'];

      if (((Date_beg_price >= Date_beg_term) and (Date_beg_price <= Date_end_term)) or
          ((Date_end_price >= Date_beg_term) and (Date_end_price <= Date_end_term)))
       then
       Begin
        if DM.ReadDataSet['id_price_param'] <> null
         then id_price_param := DM.ReadDataSet['id_price_param'];
       end;

      DM.ReadDataSet.Next;
     end;
    //------------------------------------------------------------------------------

    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Clear;
    DM.ReadDataSet.SQLs.SelectSQL.Add('SELECT * FROM CN_DT_PRICE_SELECT_BY_PARAM(:id_price_param)');
    DM.ReadDataSet.ParamByName('id_price_param').AsInt64 := id_price_param;

    DM.ReadDataSet.Open;

    If DM.ReadDataSet['Sum1'] <> null then Summ1:=DM.ReadDataSet['sum1'] else summ1:=0;
    If DM.ReadDataSet['Sum2'] <> null then Summ2:=DM.ReadDataSet['sum2'] else summ2:=0;
    If DM.ReadDataSet['Sum3'] <> null then Summ3:=DM.ReadDataSet['sum3'] else summ3:=0;
    If DM.ReadDataSet['Sum4'] <> null then Summ4:=DM.ReadDataSet['sum4'] else summ4:=0;
    If DM.ReadDataSet['Sum5'] <> null then Summ5:=DM.ReadDataSet['sum5'] else summ5:=0;

    If DM.ReadDataSet['term_stud1'] <> null then term_stud1:=DM.ReadDataSet['term_stud1'] else term_stud1:=0;
    If DM.ReadDataSet['term_stud2'] <> null then term_stud2:=DM.ReadDataSet['term_stud2'] else term_stud2:=0;
    If DM.ReadDataSet['term_stud3'] <> null then term_stud3:=DM.ReadDataSet['term_stud3'] else term_stud3:=0;
    If DM.ReadDataSet['term_stud4'] <> null then term_stud4:=DM.ReadDataSet['term_stud4'] else term_stud4:=0;
    If DM.ReadDataSet['term_stud5'] <> null then term_stud5:=DM.ReadDataSet['term_stud5'] else term_stud5:=0;

    If DM.ReadDataSet['Date_beg1'] <> null then  Date_beg_stud1 := DM.ReadDataSet['Date_beg1'] else Date_beg_stud1 := cnAcademicYear.Date_Beg;
    If DM.ReadDataSet['Date_end1'] <> null then  Date_end_stud1 := DM.ReadDataSet['Date_end1'] else Date_end_stud1 := cnAcademicYear.Date_End;
    If DM.ReadDataSet['Date_beg2'] <> null then  Date_beg_stud2 := DM.ReadDataSet['Date_beg2'] else Date_beg_stud2 := cnAcademicYear.Date_Beg;
    If DM.ReadDataSet['Date_end2'] <> null then  Date_end_stud2 := DM.ReadDataSet['Date_end2'] else Date_end_stud2 := cnAcademicYear.Date_End;
    If DM.ReadDataSet['Date_beg3'] <> null then  Date_beg_stud3 := DM.ReadDataSet['Date_beg3'] else Date_beg_stud3 := cnAcademicYear.Date_Beg;
    If DM.ReadDataSet['Date_end3'] <> null then  Date_end_stud3 := DM.ReadDataSet['Date_end3'] else Date_end_stud3 := cnAcademicYear.Date_End;
    If DM.ReadDataSet['Date_beg4'] <> null then  Date_beg_stud4 := DM.ReadDataSet['Date_beg4'] else Date_beg_stud4 := cnAcademicYear.Date_Beg;
    If DM.ReadDataSet['Date_end4'] <> null then  Date_end_stud4 := DM.ReadDataSet['Date_end4'] else Date_end_stud4 := cnAcademicYear.Date_End;
    If DM.ReadDataSet['Date_beg5'] <> null then  Date_beg_stud5 := DM.ReadDataSet['Date_beg5'] else Date_beg_stud5 := cnAcademicYear.Date_Beg;
    If DM.ReadDataSet['Date_end5'] <> null then  Date_end_stud5 := DM.ReadDataSet['Date_end5'] else Date_end_stud5 := cnAcademicYear.Date_End;

    Kurs := cnParamsToAddContract.KURS;

    Flash_period_BarButtonClick(Sender);

    if DM.ReadDataSet.RecordCount <> 0 then
     begin
      DM.ReadDataSet.close;
      DM.ReadDataSet.SQLs.SelectSQL.Text:='SELECT * FROM CN_GET_SMET_BY_PARAM(:ID_PRICE_PARAM)';
      DM.ReadDataSet.ParamByName('ID_PRICE_PARAM').AsInt64:= ID_PRICE_PARAM;
      DM.ReadDataSet.Open;
      DM.ReadDataSet.FetchAll;
      DM.ReadDataSet.First;

      if DM.ReadDataSet.RecordCount<>0 then
       // чистка всех записей таблицы источников
       for i:= Grid_istochnikiTableView.DataController.RecordCount - 1 downto 0 do
        Grid_istochnikiTableView.DataController.DeleteRecord(i);

      for i:= 0 to DM.ReadDataSet.RecordCount-1 do
       begin
        Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := DM.ReadDataSet['CODE_SM'];
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := DM.ReadDataSet['CODE_RZ'];
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := DM.ReadDataSet['CODE_ST'];
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := DM.ReadDataSet['CODE_KEKV'];
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := DM.ReadDataSet['PROCENT'];
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := inttostr(DM.ReadDataSet['ID_SM']);
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := inttostr(DM.ReadDataSet['ID_RZ']);
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := inttostr(DM.ReadDataSet['ID_ST']);
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := inttostr(DM.ReadDataSet['ID_KEKV']);
        Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount-1, 9]   := Grid_fioTableView.DataController.Values[0, 17];
        DM.ReadDataSet.Next;
       end;

      if Grid_istochnikiTableView.DataController.RecordCount = 0 then Flash_Istoch_BarButtonClick(Sender);

      DM.ReadDataSet.Close;
      DM.FREE;
     end;
   end;

  if Num_Dog_Edit.Enabled then Num_Dog_Edit.SetFocus;
end;

procedure Tfrm_Contracts_AE.Add_payers_BarButtonClick(Sender: TObject);
var
  frm_Contracts_Payer_AE : Tfrm_Contracts_Payer_AE;
  i : integer;
begin
  if Grid_payersTableView.DataController.RecordCount > 1 then
   begin
    ShowMessage('Неможливо додати ще один запис!');
    Exit;
   end;

  if Grid_payersTableView.DataController.RecordCount <>0 then
   if ((Persent.Properties as TcxCurrencyEditProperties).DisplayFormat = '0.0000 %') then
    if  StrToFloat(Grid_payersTableView.DataController.Summary.FooterSummaryValues[0]) >= 100 then
     begin
       showmessage('Неможниво додати платника. Сума вітсотків по сплаті дорівнює 100%');
       Grid_payers.SetFocus;
       exit;
     end;

  Grid_payers.SetFocus;
  frm_Contracts_Payer_AE:=Tfrm_Contracts_Payer_AE.create(self, PLanguageIndex, DB_Handle_ae);
  frm_Contracts_Payer_AE.caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  frm_Contracts_Payer_AE.PercentEdit.Value:=100;
  frm_Contracts_Payer_AE.ID_RATE_ACCOUNT:=-1;
  frm_Contracts_Payer_AE.ID_CUST_MEN := -1;
  frm_Contracts_Payer_AE.IS_ADMIN    := is_admin;

  // если уже есть запись в гриде, то значение сумма\процент выставляю по этой записи
  if Grid_payersTableView.DataController.RecordCount > 0 then
   if Grid_payersTableView.DataController.Values[0, 5] = 1 then
    begin
     frm_Contracts_Payer_AE.PercentEdit.Value := 100 - StrToFloat(Grid_payersTableView.DataController.Summary.FooterSummaryValues[0]);
     if frm_Contracts_Payer_AE.PercentEdit.Value < 0 then frm_Contracts_Payer_AE.PercentEdit.Value:=0;
    end;

// заполняю плательщика по-умолчанию
  if ((Grid_payersTableView.DataController.RecordCount =0) and (Grid_fioTableView.DataController.RecordCount > 0)) then
   begin
    frm_Contracts_Payer_AE.ID_PAYER :=  Grid_fioTableView.DataController.Values[0,17];
    frm_Contracts_Payer_AE.Payer_Edit.Text := Grid_fioTableView.DataController.Values[0,0];
   end;

  // заполняю периодичность оплаты по-умолчанию
  DM := TDM_Contracts.Create(self);
  DM.DB.Handle := DB_Handle_ae;
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DEF_ID_TYPE_STAGE';
  DM.ReadDataSet.Open;
  if DM.ReadDataSet['CN_DEF_ID_TYPE_STAGE']<> null then
   begin
    frm_Contracts_Payer_AE.ID_TYPE_STAGE           := DM.ReadDataSet['CN_DEF_ID_TYPE_STAGE'];
    frm_Contracts_Payer_AE.Periodichnost_Edit.Text := DM.ReadDataSet['NAME_STAGE'];
    DM.ReadDataSet.Close;
   end
  else
   DM.ReadDataSet.Close;
  DM.Free;

  if frm_Contracts_Payer_AE.showmodal = mrOk then
   begin
    i := 0;
    While i < Grid_payersTableView.DataController.RecordCount do
     begin
       If frm_Contracts_Payer_AE.FizPayer_RadioButton.Checked then
        if Grid_payersTableView.DataController.Values[i, 3] = 1 then
         begin
          ShowMessage('Платник фізична особа може бути тільки одна!');
          i := 2;
          exit;
         end;

       If frm_Contracts_Payer_AE.YurPayer_RadioButton.Checked then
        if Grid_payersTableView.DataController.Values[i, 3] = 2 then
         begin
          ShowMessage('Платник юридична особа може бути тільки одна!');
          i := 2;
          Exit;
         end;
      i := i + 1;
     end;
    cn_Payers := true; // логирование действий

    Grid_payersTableView.DataController.RecordCount := Grid_payersTableView.DataController.RecordCount + 1;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 0] := frm_Contracts_Payer_AE.Payer_Edit.Text;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 1] := frm_Contracts_Payer_AE.Periodichnost_Edit.Text;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 2] := frm_Contracts_Payer_AE.PercentEdit.text;
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 4] := frm_Contracts_Payer_AE.ID_TYPE_STAGE; //id_type_stage
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 6] := frm_Contracts_Payer_AE.ID_PAYER; //id_payer
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 7] := frm_Contracts_Payer_AE.ID_RATE_ACCOUNT; //id_rate_account

   // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
    if frm_Contracts_Payer_AE.FizPayer_RadioButton.Checked
     then Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 3] := 1
     else
      begin
       Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 3] := 2;
       if frm_Contracts_Payer_AE.MFO_Edit.Enabled then
        begin
        Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 8] := frm_Contracts_Payer_AE.MFO_Edit.text;
        Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 9] := frm_Contracts_Payer_AE.RasSchet_Edit.text;
        if frm_Contracts_Payer_AE.ID_CUST_MEN <> -1
         then Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 10] := frm_Contracts_Payer_AE.ID_CUST_MEN;
        end;
      end;


   Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 5] := 1;
   // заголовок столбца грида меняю на значение по значению радиобатона на процент
   Persent.Caption:= cnConsts.cn_Persent_Column[PLanguageIndex];
   // меняю маску отображения на процентную
   (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
   Grid_payersTableView.DataController.Summary.FooterSummaryItems[0].Format:= '= 0.0000 %';


   Grid_payers.setfocus;
   Grid_payersTableView.DataController.FocusedRecordIndex:=Grid_payersTableView.DataController.RecordCount-1;
   BuildComboPayersFilter;
   Flash_period_BarButtonClick(sender);
  end;

end;

procedure Tfrm_Contracts_AE.Edit_payers_BarButtonClick(Sender: TObject);
var
frm_Contracts_Payer_AE : Tfrm_Contracts_Payer_AE;
i: integer;
begin
  Grid_payers.SetFocus;
  if Grid_payersTableView.DataController.RecordCount = 0 then exit;

  frm_Contracts_Payer_AE:=Tfrm_Contracts_Payer_AE.create(self, PLanguageIndex , DB_Handle_ae);
  frm_Contracts_Payer_AE.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  frm_Contracts_Payer_AE.Payer_Edit.Text:=              vartostr(Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 0]);
  frm_Contracts_Payer_AE.Periodichnost_Edit.Text:=      Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 1];
  frm_Contracts_Payer_AE.PercentEdit.text:=             Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 2];
  if Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 6] <> null then
   frm_Contracts_Payer_AE.ID_PAYER :=                    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 6];
  frm_Contracts_Payer_AE.ID_TYPE_STAGE :=               Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 4];
  frm_Contracts_Payer_AE.ID_RATE_ACCOUNT :=             Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 7];
  if Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 8] <> null then
   frm_Contracts_Payer_AE.MFO_Edit.Text:=                Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 8];
  if Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 9] <> null then
   frm_Contracts_Payer_AE.RasSchet_Edit.Text:=           Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 9];

  if Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 10]<> null then
   frm_Contracts_Payer_AE.ID_CUST_MEN := Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 10]
  else
   frm_Contracts_Payer_AE.ID_CUST_MEN := -1;

  if Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 3] = 1
   then frm_Contracts_Payer_AE.FizPayer_RadioButton.Checked:=true
   else frm_Contracts_Payer_AE.YurPayer_RadioButton.Checked:=true;

//!!--------------!!
  if frm_Contracts_Payer_AE.showmodal = mrOk then
 begin
  cn_Payers := true; // логирование действий

  // выполняю обновление зависимых структур данных - сначала, обязательно зависимые
  // Периоды оплат
  TableUpdateIndexValue(Grid_payTableView, Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 6],
                        frm_Contracts_Payer_AE.ID_PAYER, 4);

  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 0] := frm_Contracts_Payer_AE.Payer_Edit.Text;
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 1] := frm_Contracts_Payer_AE.Periodichnost_Edit.Text;
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 2] := frm_Contracts_Payer_AE.PercentEdit.text;
 Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 4] := frm_Contracts_Payer_AE.ID_TYPE_STAGE; //id_type_stage
 Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 6] := frm_Contracts_Payer_AE.ID_PAYER; //id_payer
 Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 7] := frm_Contracts_Payer_AE.ID_RATE_ACCOUNT; //id_rate_account

  if frm_Contracts_Payer_AE.FizPayer_RadioButton.Checked then
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 3] := 1
  else begin
   Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 3] := 2;
   if frm_Contracts_Payer_AE.ID_CUST_MEN <> -1 then
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 10] := frm_Contracts_Payer_AE.ID_CUST_MEN;
  end;

  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 8] := frm_Contracts_Payer_AE.MFO_Edit.text;
  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 9] := frm_Contracts_Payer_AE.RasSchet_Edit.text;


  Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.FocusedRecordIndex, 5] := 1;

   // заголовок столбца грида меняю на значение по значению радиобатона на процент
  Persent.Caption:= cnConsts.cn_Persent_Column[PLanguageIndex];
   // меняю маску отображения на процентную
  (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
  Grid_payersTableView.DataController.Summary.FooterSummaryItems[0].Format:= '= 0.0000 %';
   // меняю в цикле все значения в гриде по значению радиобатона на процент
  for i:=1 to Grid_payersTableView.DataController.RecordCount -1 do Grid_payersTableView.DataController.Values[i, 5] := 1;  // процент

  Grid_payers.setfocus;
  BuildComboPayersFilter;
  Flash_period_BarButtonClick(sender);
 end;
end;

procedure Tfrm_Contracts_AE.Add_fio_BarrButtonClick(Sender: TObject);
var
  i : integer;
  cnAcademicYear    : TcnAcademicYear;
  DM_local: TDM_Contracts;
  Date_Dog:
  TDateTime;
  year,month,day:Word;
  AcademicYear_date_end:TDate;
  ViewForm_selected_param_edbo : Tfrm_selected_param_edbo;
begin
  if Grid_fioTableView.DataController.RecordCount <> 0 then
   begin
    ShowMessage('Неможливо додати ще один запис!');
    Exit;
   end;

  Grid_fio.SetFocus;
  frm_Contracts_Study_AE:=Tfrm_Contracts_Study_AE.create(self, PLanguageIndex, DB_Handle_ae);
  frm_Contracts_Study_AE.caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  frm_Contracts_Study_AE.ID_MAN:=-1;
  frm_Contracts_Study_AE.id_man_parent := -1;
  frm_Contracts_Study_AE.CN_USE_EDBO_FIZ_LIC := CN_USE_EDBO_FIZ_LIC;   //использовать физлица ЕДБО
  frm_Contracts_Study_AE.is_main_dog := Base_Dog_RadioButton.Checked;

  frm_Contracts_Study_AE.showmodal;

  if frm_Contracts_Study_AE.ModalResult = mrOk then
   begin
    frmStudInf:=TfrmStudInf.Create(self, PLanguageIndex, DB_Handle_ae,is_admin);
    frmStudInf.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex] + cnConsts.cn_StudyParams_Title[PLanguageIndex];
    frmStudInf.use_old_hist_price := use_old_hist_price;
    frmStudInf.Id_Sp_Nullification();

    cnAcademicYear:=cn_Common_Funcs.AcademicYear(Date_Beg_DateEdit.EditValue);
    frmStudInf.Date_Beg_DateEdit.Date := Date_Beg_DateEdit.EditValue;
    DecodeDate(cnAcademicYear.Date_Beg,year,month,day);
    AcademicYear_date_end:= EncodeDate(year+1,08,31);
    if AcademicYear_date_end>Date_End_DateEdit.EditValue then AcademicYear_date_end:=Date_End_DateEdit.EditValue;
    frmStudInf.Date_End_DateEdit.Date := AcademicYear_date_end;

    if CN_USE_EDBO_FIZ_LIC = 1 then
     Begin
      ViewForm_selected_param_edbo := Tfrm_selected_param_edbo.Create(self, DB_Handle_ae);
      ViewForm_selected_param_edbo.id_man := frm_Contracts_Study_AE.ID_MAN;
      ViewForm_selected_param_edbo.ShowModal;

      if ViewForm_selected_param_edbo.ModalResult = mrOk then
       Begin
        if ViewForm_selected_param_edbo.NAME_FACUL <> '' then
         begin
          frmStudInf.ID_FACULTY  := ViewForm_selected_param_edbo.ID_FACUL;
          frmStudInf.Faculty_Edit.Text := ViewForm_selected_param_edbo.NAME_FACUL;
         end;
        if ViewForm_selected_param_edbo.NAME_SPEC <> '' then
         begin
          frmStudInf.ID_SPEC  := ViewForm_selected_param_edbo.ID_SPEC;
          frmStudInf.Spec_Edit.Text := ViewForm_selected_param_edbo.NAME_SPEC;
         end;
        if ViewForm_selected_param_edbo.NAME_FORM_STUD <> '' then
         begin
          frmStudInf.ID_FORMSTUD  := ViewForm_selected_param_edbo.ID_FORM_STUD;
          frmStudInf.FormStud_Edit.Text := ViewForm_selected_param_edbo.NAME_FORM_STUD;
         end;
        if ViewForm_selected_param_edbo.NAME_KAT_STUD <> '' then
         begin
          frmStudInf.ID_CATEGORYSTUD  := ViewForm_selected_param_edbo.ID_KAT_STUD;
          frmStudInf.CategoryStudy_Edit.Text := ViewForm_selected_param_edbo.NAME_KAT_STUD;
         end;
        if ViewForm_selected_param_edbo.name_group <> '' then
         Begin
          frmStudInf.ID_GROUP := ViewForm_selected_param_edbo.id_group;
          frmStudInf.Group_Edit.Text := ViewForm_selected_param_edbo.name_group;
         end;
        if ViewForm_selected_param_edbo.name_national <> '' then
         Begin
          frmStudInf.ID_NATIONAL := ViewForm_selected_param_edbo.id_national;
          frmStudInf.Nazional_Edit.Text := ViewForm_selected_param_edbo.name_national;
         end;
        frmStudInf.Kurs_ComboBox.ItemIndex := ViewForm_selected_param_edbo.kurs - 1;
       end;

      if not IsGenerateNumDog
       then Num_Dog_Edit.Text := ViewForm_selected_param_edbo.num_dog;

      ViewForm_selected_param_edbo.Free;
     End
    else
     Begin   // заполняю параматры по-умолчанию
      DM := TDM_Contracts.Create(self);
      DM.DB.Handle := DB_Handle_ae;
      DM.ReadDataSet.Close;
      DM.ReadDataSet.SelectSQL.Clear;
      DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DEF_STUDINFOS';
      DM.ReadDataSet.Open;
      if DM.ReadDataSet['NAME_FACUL']<> null then
       begin
         frmStudInf.ID_FACULTY  := DM.ReadDataSet['CN_DEF_ID_FACUL'];
         frmStudInf.Faculty_Edit.Text := DM.ReadDataSet['NAME_FACUL'];
       end;
      if DM.ReadDataSet['NAME_SPEC']<> null then
       begin
         frmStudInf.ID_SPEC  := DM.ReadDataSet['CN_DEF_ID_SPEC'];
         frmStudInf.Spec_Edit.Text := DM.ReadDataSet['NAME_SPEC'];
       end;
      if DM.ReadDataSet['NAME_GROUP']<> null then
       begin
         frmStudInf.ID_GROUP  := DM.ReadDataSet['CN_DEF_ID_GROUP'];
         frmStudInf.Group_Edit.Text := DM.ReadDataSet['NAME_GROUP'];
       end;
      if DM.ReadDataSet['NAME_FORMSTUD']<> null then
       begin
         frmStudInf.ID_FORMSTUD  := DM.ReadDataSet['CN_DEF_ID_FORM_STUD'];
         frmStudInf.FormStud_Edit.Text := DM.ReadDataSet['NAME_FORMSTUD'];
       end;
      if DM.ReadDataSet['NAME_KATSTUD']<> null then
       begin
         frmStudInf.ID_CATEGORYSTUD  := DM.ReadDataSet['CN_DEF_ID_KAT_STUD'];
         frmStudInf.CategoryStudy_Edit.Text := DM.ReadDataSet['NAME_KATSTUD'];
       end;
       if DM.ReadDataSet['NAME_NAZIONAL']<> null then
       begin
         frmStudInf.ID_NATIONAL  := DM.ReadDataSet['CN_DEF_ID_NATIONAL'];
         frmStudInf.Nazional_Edit.Text := DM.ReadDataSet['NAME_NAZIONAL'];
       end;

      DM.ReadDataSet.Close;
      DM.Free;
     End; 

    frmStudInf.summ1_stage:=Summ1;
    frmStudInf.summ2_stage:=Summ2;
    frmStudInf.summ3_stage:=Summ3;
    frmStudInf.summ4_stage:=Summ4;
    frmStudInf.summ5_stage:=Summ5;
    frmStudInf.summ6_stage:=Summ6;
    frmStudInf.summ7_stage:=Summ7;
    frmStudInf.summ8_stage:=Summ8;

    frmStudInf.term_stud1_stage:=term_stud1;
    frmStudInf.term_stud2_stage:=term_stud2;
    frmStudInf.term_stud3_stage:=term_stud3;
    frmStudInf.term_stud4_stage:=term_stud4;
    frmStudInf.term_stud5_stage:=term_stud5;
    frmStudInf.term_stud6_stage:=term_stud6;
    frmStudInf.term_stud7_stage:=term_stud7;
    frmStudInf.term_stud8_stage:=term_stud8;

    frmStudInf.Date_beg_stud1 := Date_beg_stud1;
    frmStudInf.Date_end_stud1 := Date_end_stud1;
    frmStudInf.Date_beg_stud2 := Date_beg_stud2;
    frmStudInf.Date_end_stud2 := Date_end_stud2;
    frmStudInf.Date_beg_stud3 := Date_beg_stud3;
    frmStudInf.Date_end_stud3 := Date_end_stud3;
    frmStudInf.Date_beg_stud4 := Date_beg_stud4;
    frmStudInf.Date_end_stud4 := Date_end_stud4;
    frmStudInf.Date_beg_stud5 := Date_beg_stud5;
    frmStudInf.Date_end_stud5 := Date_end_stud5;
    frmStudInf.Date_beg_stud6 := Date_beg_stud6;
    frmStudInf.Date_end_stud6 := Date_end_stud6;
    frmStudInf.Date_beg_stud7 := Date_beg_stud7;
    frmStudInf.Date_end_stud7 := Date_end_stud7;
    frmStudInf.Date_beg_stud8 := Date_beg_stud8;
    frmStudInf.Date_end_stud8 := Date_end_stud8;

    frmStudInf.kurs_stage:=1;
    frmStudInf.kurs_beg_stage:=1;

    if frmStudInf.showmodal = mrOk then
     begin
        if frmStudInf.Date_End_DateEdit.Date>Date_End_DateEdit.Date
         then frmStudInf.Date_End_DateEdit.Date:=Date_End_DateEdit.Date;
      cn_StudInfo := true; // логирование действий

      summ1:=frmStudInf.Summ1;
      summ2:=frmStudInf.Summ2;
      summ3:=frmStudInf.Summ3;
      summ4:=frmStudInf.Summ4;
      summ5:=frmStudInf.Summ5;
      summ6:=frmStudInf.Summ6;
      summ7:=frmStudInf.Summ7;
      summ8:=frmStudInf.Summ8;

      term_stud1:=frmStudInf.term_stud1;
      term_stud2:=frmStudInf.term_stud2;
      term_stud3:=frmStudInf.term_stud3;
      term_stud4:=frmStudInf.term_stud4;
      term_stud5:=frmStudInf.term_stud5;
      term_stud6:=frmStudInf.term_stud6;
      term_stud7:=frmStudInf.term_stud7;
      term_stud8:=frmStudInf.term_stud8;

      Date_beg_stud1 := frmStudInf.Date_beg_stud1;
      Date_end_stud1 := frmStudInf.Date_end_stud1;
      Date_beg_stud2 := frmStudInf.Date_beg_stud2;
      Date_end_stud2 := frmStudInf.Date_end_stud2;
      Date_beg_stud3 := frmStudInf.Date_beg_stud3;
      Date_end_stud3 := frmStudInf.Date_end_stud3;
      Date_beg_stud4 := frmStudInf.Date_beg_stud4;
      Date_end_stud4 := frmStudInf.Date_end_stud4;
      Date_beg_stud5 := frmStudInf.Date_beg_stud5;
      Date_end_stud5 := frmStudInf.Date_end_stud5;
      Date_beg_stud6 := frmStudInf.Date_beg_stud6;
      Date_end_stud6 := frmStudInf.Date_end_stud6;
      Date_beg_stud7 := frmStudInf.Date_beg_stud7;
      Date_end_stud7 := frmStudInf.Date_end_stud7;
      Date_beg_stud8 := frmStudInf.Date_beg_stud8;
      Date_end_stud8 := frmStudInf.Date_end_stud8;

      kurs:=frmStudInf.kurs;
      kurs_beg:=frmStudInf.kurs_beg;

      id_valute := frmStudInf.id_valute;

      DM := TDM_Contracts.Create(self);
      DM.DB.Handle := DB_Handle_ae;
      DM.ReadDataSet.Close;
      DM.ReadDataSet.SQLs.SelectSQL.Text := 'select code_valute  from pub_sp_valute where id_valute = :id_valute';
      DM.ReadDataSet.ParamByName('ID_VALUTE').AsInt64 := ID_VALUTE;
      DM.ReadDataSet.Open;
      if DM.ReadDataSet['CODE_VALUTE'] <> null then ButtonEdit_valute.Text := DM.ReadDataSet['CODE_VALUTE'];
      DM.ReadDataSet.Close;
      DM.free;
      // авто-добавление номера контракта
      if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
       begin
        // проверяем признак автогенерации
        DM_local:=TDM_Contracts.Create(Self);
        DM_local.DB.Handle:=DB_Handle_ae;
        DM_local.ReadDataSet.Close;
        DM_local.ReadDataSet.SelectSQL.Clear;
        DM_local.ReadDataSet.SelectSQL.Text := 'select CN_IS_GENERATE_NUM_DOG from CN_CHECK_NUMDOG_GENERATION';
        DM_local.ReadDataSet.Open;
        IsGenerateNumDog := bool(DM_local.ReadDataSet['CN_IS_GENERATE_NUM_DOG']);
        DM_local.ReadDataSet.Close;

        if IsGenerateNumDog then
         begin
          DM_local.StProc.StoredProcName := 'CN_GET_NUMDOG_AVTO';
          DM_local.StProc.Transaction.StartTransaction;
          DM_local.StProc.Prepare;
          DM_local.StProc.ParamByName('ID_DEPARTMENT').AsInt64 := frmStudInf.ID_FACULTY;
          DM_local.StProc.ParamByName('IS_FACUL').AsInteger := 1;
          DM_local.StProc.ParamByName('ID_FORM_STUD').AsInt64 := frmStudInf.ID_FORMSTUD;
          Date_Dog:=frmStudInf.Date_Beg_DateEdit.EditValue;
          DM_local.StProc.ParamByName('DATE_DOG').Value:=Date_Dog;
          DM_local.StProc.ExecProc;
          Num_Dog_Edit.Text := DM_local.StProc.ParamByName('NUM_DOG').AsString;
          DM_local.StProc.Transaction.Commit;
         end;
        DM_local.Free;
       end;

      Grid_fioTableView.DataController.RecordCount := Grid_fioTableView.DataController.RecordCount + 1;
      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 0]  := frm_Contracts_Study_AE.Studer_Edit.Text;

  Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 17] := frm_Contracts_Study_AE.ID_MAN; //ид_ман
//ид_ман_парент
          if frm_Contracts_Study_AE.id_man_parent <> -1 then
          begin
           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 20] := frm_Contracts_Study_AE.id_man_parent;
           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 21] := frm_Contracts_Study_AE.LowSpecimen_Edit.Text;
          end;


              Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 1] :=  frmStudInf.Date_Beg_DateEdit.Date; //дата_начала
               Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 2] :=  frmStudInf.Date_End_DateEdit.Date; //дата_конца
                Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 3] :=  frmStudInf.Faculty_Edit.Text; //факультет
           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 4] :=  frmStudInf.Spec_Edit.Text;    //специальность
                   Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 5] :=  frmStudInf.Group_Edit.Text; //группа
           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 6] :=  frmStudInf.FormStud_Edit.Text; //форма_обучения
       Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 7] :=  frmStudInf.CategoryStudy_Edit.Text; //категория_обучения
           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 8] :=  frmStudInf.Nazional_Edit.Text; //национальность
                    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 9] :=  frmStudInf.Kurs_ComboBox.Text; //курс
                    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 10] := frmStudInf.Summa_Edit.Value; //сумма

            Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 11] := frmStudInf.ID_FACULTY;  //ид_факультета
                  Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 12] := frmStudInf.ID_SPEC; //ид_спец
               Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 13] := frmStudInf.ID_GROUP;  //ид_группы
         Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 14] := frmStudInf.ID_FORMSTUD;  //ид_формыобуч
          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 15] := frmStudInf.ID_CATEGORYSTUD; //ид_категоробуч
              Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.RecordCount - 1, 16] := frmStudInf.ID_NATIONAL;  //ид_национал
              
       if not frmStudInf.FinanceSource.isEmpty then //
        begin
         DM := TDM_Contracts.Create(self);
         DM.DB.Handle := DB_Handle_ae;
         DM.ReadDataSet.close;
         DM.ReadDataSet.SQLs.SelectSQL.Text:='SELECT * FROM CN_GET_SMET_BY_PARAM(:ID_PRICE_PARAM)';
         DM.ReadDataSet.ParamByName('ID_PRICE_PARAM').AsInt64:= frmStudInf.ID_PRICE_PARAM;
         DM.ReadDataSet.Open;
         DM.ReadDataSet.FetchAll;
         DM.ReadDataSet.First;

         if DM.ReadDataSet.RecordCount<>0 then
         // чистка всех записей таблицы источников
         for i:= Grid_istochnikiTableView.DataController.RecordCount -1 downto 0 do
          Grid_istochnikiTableView.DataController.DeleteRecord(i);

         for i:= 0 to DM.ReadDataSet.RecordCount-1 do
          begin
           Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := DM.ReadDataSet['CODE_SM'];
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := DM.ReadDataSet['CODE_RZ'];
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := DM.ReadDataSet['CODE_ST'];
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := DM.ReadDataSet['CODE_KEKV'];
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := DM.ReadDataSet['PROCENT'];;
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := inttostr(DM.ReadDataSet['ID_SM']);
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := inttostr(DM.ReadDataSet['ID_RZ']);
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := inttostr(DM.ReadDataSet['ID_ST']);
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := inttostr(DM.ReadDataSet['ID_KEKV']);
           Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount-1, 9]   := Grid_fioTableView.DataController.Values[0, 17];
           DM.ReadDataSet.Next;
          end;

          DM.ReadDataSet.Close;
          DM.Free;
        end;

       if Grid_istochnikiTableView.DataController.RecordCount=0 then Flash_Istoch_BarButtonClick(Sender);

       // если запись первая, то атоматом добавля. плательщика и периоды оплаты
       if Grid_fioTableView.DataController.RecordCount = 1 then
       begin
        Flash_Payers_ButtonClick(Sender);
        Flash_period_BarButtonClick(Sender);
       End;
     end;
  Grid_fio.setfocus;
  Grid_fioTableView.DataController.FocusedRecordIndex:=Grid_fioTableView.DataController.RecordCount-1;
   end;
end;

procedure Tfrm_Contracts_AE.Add_period_BarButtonClick(Sender: TObject);
 var
  frm_Contracts_Periods_AE : Tfrm_Contracts_Periods_AE;
  i,j, k, flag: byte;
  StudersCounter: byte;
  Man_Ids:array of int64;
  Man_Fio:array of string;
  cnAcademicYear:TcnAcademicYear;
  ACountMonth : integer;
  Coefficient, C_Coefficient : Currency;
  id_man_f: int64;
begin
  If not Is_Admin then
   if not Addit_Dog_RadioButton.Checked then
    if (Grid_fioTableView.DataController.Values[0, 14] <> 8199) then //временое разрешение на редактирования экстернов ДонНУ
     If fibCheckPermission('/ROOT/Contracts/Cn_stage_opl','Add') <> 0
      then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

  Grid_pay.SetFocus;
  if ((Grid_fioTableView.DataController.RecordCount = 0) or (Grid_payersTableView.DataController.RecordCount = 0))
   then
    begin
     showmessage(cnConsts_Messages.cn_warning_StageOpl[PLanguageIndex]);
     exit;
    end;

  if Check_Grid_fioTableView_on_Errors then
   begin
    Grid_fio.SetFocus;
    exit;
   end;

  frm_Contracts_Periods_AE:=Tfrm_Contracts_Periods_AE.create(self, PLanguageIndex, DB_Handle_ae);
  frm_Contracts_Periods_AE.caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];

  // заполнение комбобоксов
  // определяю кол-во обучающихся по контракту
  StudersCounter:=1;
  SetLength(Man_Ids, 1);
  SetLength(Man_Fio, 1);
  Man_Ids[0]:= Grid_fioTableView.DataController.Values[0, 17]; // id_man
  Man_Fio[0]:= Grid_fioTableView.DataController.Values[0, 0];  // fio

  for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
   for j:=0 to Length(Man_Ids)-1 do
    begin
     for k:=0 to Length(Man_Ids)-1 do
      begin
       flag := 0;
       if Grid_fioTableView.DataController.Values[i, 17] = Man_Ids[k] then flag:=1;
      end;
     if flag =1 then Continue;
     StudersCounter:= StudersCounter+1;
     SetLength(Man_Ids, Length(Man_Ids)+1 );
     Man_Ids[Length(Man_Ids)-1]:= Grid_fioTableView.DataController.Values[i, 17];
     SetLength(Man_Fio, Length(Man_Fio)+1 );
     Man_Fio[Length(Man_Fio)-1]:= Grid_fioTableView.DataController.Values[i, 0];
    end;

  // заполнение комбобоксов
  // обучающийся
  for i:= 0 to StudersCounter -1 do
   begin
    frm_Contracts_Periods_AE.id_stud_ComboBox.Properties.Items.Add(Man_Fio[i]);
   end;

  // плательщик
  for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    frm_Contracts_Periods_AE.id_payer_ComboBox.Properties.Items.Add(Grid_payersTableView.DataController.Values[i, 0]);
   end;

    frm_Contracts_Periods_AE.id_stud_ComboBox.ItemIndex:=0;
    frm_Contracts_Periods_AE.id_payer_ComboBox.ItemIndex:=0;

  // если плательщик один, то включаем механизм автоподстановки конечного периода и суммы в форме редактирования
  // иначе пусть сами вводят
  ACountMonth  := -1;
  Coefficient :=0;
  if Grid_payersTableView.DataController.RecordCount = 1 then
   begin
    DM:=TDM_Contracts.Create(Self);
    DM.ReadDataSet.SQLs.SelectSQL.Text :=
                      'select * from CN_GET_TYPE_STAGE_BY_ID('+ inttostr(Grid_payersTableView.DataController.Values[0, 4]) +')';
    DM.DB.Handle:=DB_Handle_ae;
    DM.ReadDataSet.Open;

    ACountMonth := DM.ReadDataSet['CNT_MONTH'];

    DM.ReadDataSet.close;
    DM.Free;
    if Grid_fioTableView.DataController.RecordCount = 1 then
     begin
      if ACountMonth = 0
       then C_Coefficient := 1
       else C_Coefficient := ACountMonth / 10;

      if Grid_fioTableView.DataController.Values[0, 10] = null
       then Grid_fioTableView.DataController.Values[0, 10] := 0;

      if Grid_payersTableView.DataController.Values[0, 5] = 1
       then Coefficient := C_Coefficient *Grid_payersTableView.DataController.Values[0, 2]/100
                           * Grid_fioTableView.DataController.Values[0, 10]{значение процент\сумма}
       else Coefficient:= C_Coefficient * Grid_payersTableView.DataController.Values[0, 2];
     end;
   end;
  frm_Contracts_Periods_AE.CountMonthAE := ACountMonth;
  frm_Contracts_Periods_AE.SummaAE := Coefficient;
    //------------------------------------------------
if frm_Contracts_Periods_AE.showmodal = mrOk then
begin
  // для обучающегося
  for i:= 0 to Grid_fioTableView.DataController.RecordCount -1 do
   begin
    if frm_Contracts_Periods_AE.id_stud_ComboBox.Text = Grid_fioTableView.DataController.Values[i, 0]
    then begin
    id_man_f:=
    Grid_fioTableView.DataController.Values[i, 17]; // присваиваю ид_ман по фио
    break;
    end;
   end;

  if Grid_payTableView.DataController.RecordCount <> 0 then
  for i:= 0 to Grid_payTableView.DataController.RecordCount-1
  do
  begin
   if ((frm_Contracts_Periods_AE.Date_Beg_DateEdit.Date = StrToDateTime(Grid_payTableView.DataController.Values[i, 0]))
   and (frm_Contracts_Periods_AE.Date_End_DateEdit.Date = StrToDateTime(Grid_payTableView.DataController.Values[i, 1]))
   and (id_man_f = Grid_payTableView.DataController.Values[i, 5])) then
    begin
     showmessage(cn_DatesExists[PLanguageIndex]);
     Grid_payTableView.DataController.FocusedRecordIndex := i;
     exit;
    end;
  end;

  cn_StageOpl := true; // логирование действий

    Grid_payTableView.DataController.RecordCount := Grid_payTableView.DataController.RecordCount + 1;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 0] := frm_Contracts_Periods_AE.Date_Beg_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 1] := frm_Contracts_Periods_AE.Date_End_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := frm_Contracts_Periods_AE.Date_Opl_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 3] := frm_Contracts_Periods_AE.Summa_Edit.Text;
    cnAcademicYear := AcademicYear(frm_Contracts_Periods_AE.Date_Beg_DateEdit.Date);
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 6] :=
    {num_year}ExtractNumYear(cnAcademicYear.Date_Beg, cnAcademicYear.Date_End, '/');

// ищу идентификаторы из гридов по комбобоксам
// для обучающегося
  for i:= 0 to StudersCounter -1 do
   begin
    if frm_Contracts_Periods_AE.id_stud_ComboBox.Text = Man_Fio[i]
    then begin
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 5] :=
    Man_Ids[i] ; // присваиваю ид_ман по фио
    break;
    end;
   end;

// для плательщика
  for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    if frm_Contracts_Periods_AE.id_payer_ComboBox.Text = Grid_payersTableView.DataController.Values[i, 0]
    then begin
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 4] :=
    Grid_payersTableView.DataController.Values[i, 6]; // присваиваю ид_ман по фио
    break;
    end;
   end;

 Grid_pay.setfocus;
 Grid_payTableView.DataController.FocusedRecordIndex:=Grid_payTableView.DataController.RecordCount-1;
 frm_Contracts_Periods_AE.free;
 end;
end;

procedure Tfrm_Contracts_AE.Edit_period_BarButtonClick(Sender: TObject);
 var
  frm_Contracts_Periods_AE : Tfrm_Contracts_Periods_AE;
  i, j, k, flag: byte;
  id_man_itemindex_fio, id_payer_itemindex_fio : string;
  StudersCounter: byte;
  Man_Ids:array of int64;
  Man_Fio:array of string;
  cnAcademicYear: TcnAcademicYear;
  id_man_f: Int64;
begin
  If not Is_Admin then
   if not Addit_Dog_RadioButton.Checked then
    if (Grid_fioTableView.DataController.Values[0, 14] <> 8199) then //временое разрешение на редактирования экстернов ДонНУ
     If fibCheckPermission('/ROOT/Contracts/Cn_stage_opl','Edit') <> 0
      then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;


  if Grid_payTableView.DataController.RecordCount = 0 then exit;

  if not Grid_pay.IsFocused then
   Begin
    Grid_pay.SetFocus;
    Grid_payTableView.DataController.FocusedRecordIndex := 0;
   end; 

  frm_Contracts_Periods_AE:=Tfrm_Contracts_Periods_AE.create(self, PLanguageIndex, DB_Handle_ae);
  frm_Contracts_Periods_AE.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  // определяю кол-во обучающихся по контракту
  StudersCounter:=1;
  SetLength(Man_Ids, 1);
  SetLength(Man_Fio, 1);
  Man_Ids[0]:= Grid_fioTableView.DataController.Values[0, 17]; // id_man
  Man_Fio[0]:= Grid_fioTableView.DataController.Values[0, 0];  // fio

  for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
  for j:=0 to Length(Man_Ids)-1 do
   begin
    for k:=0 to Length(Man_Ids)-1 do
     begin
      flag := 0;
      if Grid_fioTableView.DataController.Values[i, 17] = Man_Ids[k] then flag:=1;
     end;

    if flag = 1 then Continue;
    StudersCounter:= StudersCounter+1;
    SetLength(Man_Ids, Length(Man_Ids)+1 );
    Man_Ids[Length(Man_Ids)-1]:= Grid_fioTableView.DataController.Values[i, 17];
    SetLength(Man_Fio, Length(Man_Fio)+1 );
    Man_Fio[Length(Man_Fio)-1]:= Grid_fioTableView.DataController.Values[i, 0];
   end;

  // заполнение комбобоксов
  // обучающийся
  for i:= 0 to StudersCounter -1 do
   frm_Contracts_Periods_AE.id_stud_ComboBox.Properties.Items.Add(Man_Fio[i]);

  // плательщик
  for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    frm_Contracts_Periods_AE.id_payer_ComboBox.Properties.Items.Add
    (Grid_payersTableView.DataController.Values[i, 0]);
   end;

  // после заполнения комбо необходимо спозиционироваться на подходящем ииндексе
  // для этого по ид_ман и ид_пеер ищу их фио по гридам и по фио позиционируюсь

  // ид_ман
  for i:=0 to StudersCounter -1 do
   begin
    if Man_Ids[i] = Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 5] then
     begin
      id_man_itemindex_fio:= Man_Fio[i];
      break;
     end;
   end;

  // ид_пеер
  for i:=0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    if Grid_payersTableView.DataController.Values[i,6] = Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 4] then
     begin
      id_payer_itemindex_fio:= Grid_payersTableView.DataController.Values[i,0];
      break;
     end;
   end;

  // позиционируюсь
  // по ид_ман
  for i:=0 to frm_Contracts_Periods_AE.id_stud_ComboBox.Properties.Items.Count-1 do
   begin
    frm_Contracts_Periods_AE.id_stud_ComboBox.ItemIndex:=i;
    if frm_Contracts_Periods_AE.id_stud_ComboBox.Text = id_man_itemindex_fio
     then break;
   end;

  // по ид_пеер
  for i:=0 to frm_Contracts_Periods_AE.id_payer_ComboBox.Properties.Items.Count-1 do
   begin
    frm_Contracts_Periods_AE.id_payer_ComboBox.ItemIndex:=i;
    if frm_Contracts_Periods_AE.id_payer_ComboBox.Text = id_payer_itemindex_fio
     then break;
   end;

  frm_Contracts_Periods_AE.Date_Beg_DateEdit.date :=   strtodate(Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 0]);
  frm_Contracts_Periods_AE.Date_End_DateEdit.date :=   strtodate(Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 1]);
  if Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 2] <> null
   then frm_Contracts_Periods_AE.Date_Opl_DateEdit.date := strtodate(Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 2]);
  frm_Contracts_Periods_AE.Summa_Edit.Text := Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 3];

  //-----------------------------------------------
  if frm_Contracts_Periods_AE.showmodal = mrOk then
   begin
    // ищу идентификаторы из гридов по комбобоксам
    // для обучающегося
    for i:= 0 to Grid_fioTableView.DataController.RecordCount -1 do
     begin
      if frm_Contracts_Periods_AE.id_stud_ComboBox.Text = Grid_fioTableView.DataController.Values[i, 0] then
       begin
        id_man_f := Grid_fioTableView.DataController.Values[i, 17]; // присваиваю ид_ман по фио
        break;
       end;
     end;

    if Grid_payersTableView.DataController.RecordCount = 1 then
     for i:= 0 to Grid_payTableView.DataController.RecordCount-1 do
      begin
       if ((frm_Contracts_Periods_AE.Date_Beg_DateEdit.Date = StrToDateTime(Grid_payTableView.DataController.Values[i, 0]))
            and (frm_Contracts_Periods_AE.Date_End_DateEdit.Date = StrToDateTime(Grid_payTableView.DataController.Values[i, 1]))
            and (Grid_payTableView.DataController.FocusedRecordIndex <> i)
            and (id_man_f = Grid_payTableView.DataController.Values[i, 5]) ) then
       begin
        showmessage(cn_DatesExists[PLanguageIndex]);
        Grid_payTableView.DataController.FocusedRecordIndex := i;
        exit;
       end;
      end;

    cn_StageOpl := true; // логирование действий

    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 0] := frm_Contracts_Periods_AE.Date_Beg_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 1] := frm_Contracts_Periods_AE.Date_End_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 2] := frm_Contracts_Periods_AE.Date_Opl_DateEdit.Text;
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 3] := frm_Contracts_Periods_AE.Summa_Edit.EditValue;

    cnAcademicYear := AcademicYear(frm_Contracts_Periods_AE.Date_Beg_DateEdit.Date);
    Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 6] :=
    {num_year}ExtractNumYear(cnAcademicYear.Date_Beg, cnAcademicYear.Date_End, '/');


    // ищу идентификаторы из гридов по комбобоксам
    // для обучающегося
    for i:= 0 to Grid_fioTableView.DataController.RecordCount -1 do
     begin
      if frm_Contracts_Periods_AE.id_stud_ComboBox.Text = Grid_fioTableView.DataController.Values[i, 0] then
       begin
        Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 5] :=
        Grid_fioTableView.DataController.Values[i, 17]; // присваиваю ид_ман по фио
        break;
       end;
     end;

    // для плательщика
    for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
     begin
      if frm_Contracts_Periods_AE.id_payer_ComboBox.Text = Grid_payersTableView.DataController.Values[i, 0] then
       begin
        Grid_payTableView.DataController.Values[Grid_payTableView.DataController.FocusedRecordIndex, 4] :=
        Grid_payersTableView.DataController.Values[i, 6]; // присваиваю ид_ман по фио
        break;
       end;
     end;

    Grid_pay.setfocus;
    frm_Contracts_Periods_AE.free;
   end;
end;

procedure Tfrm_Contracts_AE.Edit_fio_BarButtonClick(Sender: TObject);
begin
  Grid_fio.SetFocus;
  if Grid_fioTableView.DataController.RecordCount = 0 then exit;

  if PereofMode = 1 then
   begin
     ShowMessage('Неможливо змінити записи. Транзакція активна!' + #13+ 'Спочатку треба завершити процес переоформлення!');
     exit;
   end;
  if ExtraMode then exit;

  frm_Contracts_Study_AE:=Tfrm_Contracts_Study_AE.create(self, PLanguageIndex, DB_Handle_ae);
  frm_Contracts_Study_AE.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  frm_Contracts_Study_AE.Studer_Edit.Text:=vartostr(Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 0]);
  frm_Contracts_Study_AE.ID_MAN := Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 17];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 20] <> null then
    begin
     frm_Contracts_Study_AE.id_man_parent := Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 20];
     frm_Contracts_Study_AE.LowSpecimen_Edit.Text:=vartostr(Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 21]);
    end
   else frm_Contracts_Study_AE.LowSpecimen_Edit.Enabled:= false;

  frm_Contracts_Study_AE.ID_DOG_ROOT := ID_DOG_ROOT;
  frm_Contracts_Study_AE.ID_STUD :=  ID_STUD_in;
  if frm_Contracts_Study_AE.showmodal = mrOk then
   begin
    cn_StudInfo := true; // логирование действий

    // выполняю обновление зависимых структур данных - сначала, обязательно зависимые
    // Периоды оплат
    TableUpdateIndexValue(Grid_payTableView, Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 17],
                          frm_Contracts_Study_AE.ID_MAN, 5);

    //источники финансирования
    TableUpdateIndexValue(Grid_istochnikiTableView, Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 17],
                          frm_Contracts_Study_AE.ID_MAN, 9);

    // инфостуд - индекс
    TableUpdateIndexValue(Grid_fioTableView, Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 17],
                          frm_Contracts_Study_AE.ID_MAN, 17);
    // инфостуд - фио
    TableUpdateIndexValue(Grid_fioTableView, Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 0],
                          frm_Contracts_Study_AE.Studer_Edit.Text, 0);

    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 0]:= frm_Contracts_Study_AE.Studer_Edit.Text;
    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 17] := frm_Contracts_Study_AE.ID_MAN; //ид_ман  
    Grid_fio.setfocus;
   end; 
end;

procedure Tfrm_Contracts_AE.TableUpdateIndexValue(Grid: TcxGridTableView; old_value: variant; new_value: variant; columnindex: integer);
var
  i: integer;
begin
  for i:=0 to Grid.DataController.RecordCount -1 do
   if Grid.DataController.Values[i, columnindex] =  old_value
    then Grid.DataController.Values[i, columnindex] := new_value;
end;

procedure Tfrm_Contracts_AE.Add_istochniki_BarButtonClick(Sender: TObject);
 var
  frm_Istochniki_AE:Tfrm_Istochniki_AE;
  i, j, k, flag: byte;
  buffer: int64;
  StudersCounter: byte;
  Man_Ids:array of int64;
  Man_Fio:array of string;
begin
Grid_istochniki.SetFocus;
if ((Grid_fioTableView.DataController.RecordCount = 0) or (Grid_payersTableView.DataController.RecordCount = 0))
then
 begin
 showmessage(cnConsts_Messages.cn_warning_StageOpl[PLanguageIndex]);
 exit;
 end;

if Check_Grid_fioTableView_on_Errors then
begin
 Grid_fio.SetFocus;
 exit;
end;

frm_Istochniki_AE:=Tfrm_Istochniki_AE.create(self, PLanguageIndex, DB_Handle_ae);
frm_Istochniki_AE.caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
if Grid_istochnikiTableView.DataController.RecordCount = 0 then frm_Istochniki_AE.Persent_Edit.Value := 100;
if frm_Istochniki_AE.Persent_Edit.Value < 0 then frm_Istochniki_AE.Persent_Edit.Value:=0;

 frm_Istochniki_AE.IS_AE:=True;

 // определяю кол-во обучающихся по контракту
 StudersCounter:=1;
 SetLength(Man_Ids, 1);
 SetLength(Man_Fio, 1);
 Man_Ids[0]:= Grid_fioTableView.DataController.Values[0, 17]; // id_man
 Man_Fio[0]:= Grid_fioTableView.DataController.Values[0, 0];  // fio

 for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
  for j:=0 to Length(Man_Ids)-1 do
    begin
     for k:=0 to Length(Man_Ids)-1 do
      begin
       flag := 0;
       if Grid_fioTableView.DataController.Values[i, 17] = Man_Ids[k] then flag:=1;
      end;
     if flag =1 then Continue;
     StudersCounter:= StudersCounter+1;
     SetLength(Man_Ids, Length(Man_Ids)+1 );
     Man_Ids[Length(Man_Ids)-1]:= Grid_fioTableView.DataController.Values[i, 17];
     SetLength(Man_Fio, Length(Man_Fio)+1 );
     Man_Fio[Length(Man_Fio)-1]:= Grid_fioTableView.DataController.Values[i, 0];
    end;


 // заполнение комбобоксов
 // обучающийся
  for i:= 0 to StudersCounter -1 do
   begin
    frm_Istochniki_AE.id_stud_ComboBox.Properties.Items.Add
    (Man_Fio[i]);
   end;

  frm_Istochniki_AE.id_stud_ComboBox.ItemIndex:=0;
//-------------------------
 if frm_Istochniki_AE.showmodal = mrOk then
  begin
    cn_Finace := true; // логирование действий

    Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := frm_Istochniki_AE.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := frm_Istochniki_AE.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := frm_Istochniki_AE.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := frm_Istochniki_AE.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := frm_Istochniki_AE.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := frm_Istochniki_AE.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := frm_Istochniki_AE.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := frm_Istochniki_AE.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := frm_Istochniki_AE.id_kekv;

  // ищу идентификаторы из гридов по комбобоксам
  // для обучающегося
  for i:= 0 to Grid_fioTableView.DataController.RecordCount -1 do
   begin
    if frm_Istochniki_AE.id_stud_ComboBox.Text = Grid_fioTableView.DataController.Values[i, 0]
    then begin
    buffer:= Grid_fioTableView.DataController.Values[i, 17];
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount-1, 9] :=
    buffer; // присваиваю ид_ман по фио
    break;
    end;
   end;

     Grid_istochniki.setfocus;
     Grid_istochnikiTableView.DataController.FocusedRecordIndex:=Grid_istochnikiTableView.DataController.RecordCount-1;
     frm_Istochniki_AE.free;
  end;
end;

procedure Tfrm_Contracts_AE.Edit_istochniki_BarButtonClick(
  Sender: TObject);
 var
  frm_Istochniki_AE:Tfrm_Istochniki_AE;
  id_man_itemindex_fio: string;
  i, j, k, flag: byte;
  StudersCounter: byte;
  Man_Ids:array of int64;
  Man_Fio:array of string;
begin
Grid_istochniki.SetFocus;
if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;

frm_Istochniki_AE:=Tfrm_Istochniki_AE.create(self, PLanguageIndex, DB_Handle_ae);
frm_Istochniki_AE.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  frm_Istochniki_AE.IS_AE:=true;
// определяю кол-во обучающихся по контракту
 StudersCounter:=1;
 SetLength(Man_Ids, 1);
 SetLength(Man_Fio, 1);
 Man_Ids[0]:= Grid_fioTableView.DataController.Values[0, 17]; // id_man
 Man_Fio[0]:= Grid_fioTableView.DataController.Values[0, 0];  // fio

 for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
  for j:=0 to Length(Man_Ids)-1 do
    begin
     for k:=0 to Length(Man_Ids)-1 do
      begin
       flag := 0;
       if Grid_fioTableView.DataController.Values[i, 17] = Man_Ids[k] then flag:=1;
      end;
     if flag =1 then Continue;
     StudersCounter:= StudersCounter+1;
     SetLength(Man_Ids, Length(Man_Ids)+1 );
     Man_Ids[Length(Man_Ids)-1]:= Grid_fioTableView.DataController.Values[i, 17];
     SetLength(Man_Fio, Length(Man_Fio)+1 );
     Man_Fio[Length(Man_Fio)-1]:= Grid_fioTableView.DataController.Values[i, 0];
    end;


 // заполнение комбобоксов
 // обучающийся
  for i:= 0 to StudersCounter -1 do
   begin
    frm_Istochniki_AE.id_stud_ComboBox.Properties.Items.Add
    (Man_Fio[i]);
   end;

 // после заполнения комбо необходимо спозиционироваться на подходящем ииндексе
 // для этого по ид_ман и ид_пеер ищу их фио по гридам и по фио позиционируюсь

 // ид_ман
 for i:=0 to StudersCounter -1 do
  begin
   if Man_Ids[i] =
   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 9] then
   begin
     id_man_itemindex_fio:= Man_Fio[i];
     break;
   end;
  end;
 // попозиционируюсь
 // по ид_ман
    for i:=0 to frm_Istochniki_AE.id_stud_ComboBox.Properties.Items.Count-1 do
    begin
    frm_Istochniki_AE.id_stud_ComboBox.ItemIndex:=i;
    if frm_Istochniki_AE.id_stud_ComboBox.Text = id_man_itemindex_fio then
    begin
    break;
    end;
    end;

if Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0]<> null then
frm_Istochniki_AE.Smeta_Edit.Text:=   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0];
frm_Istochniki_AE.Razdel_Edit.Text:=  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 1];
frm_Istochniki_AE.Stat_Edit.Text:=    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 2];
frm_Istochniki_AE.Kekv_Edit.Text:=    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 3];
frm_Istochniki_AE.Persent_Edit.Text:= Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4];

if Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5] <> null then
frm_Istochniki_AE.id_smeta:=  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5];
frm_Istochniki_AE.id_razdel:= Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6];
frm_Istochniki_AE.id_stat:=   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7];
frm_Istochniki_AE.id_kekv:=   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8];

//-------------------------------------------
 if frm_Istochniki_AE.showmodal = mrOk then
  begin
  cn_Finace := true; // логирование действий

  // ищу идентификаторы из гридов по комбобоксам
  // для обучающегося
  for i:= 0 to Grid_fioTableView.DataController.RecordCount -1 do
   begin
    if frm_Istochniki_AE.id_stud_ComboBox.Text = Grid_fioTableView.DataController.Values[i, 0]
    then begin
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 9] :=
    Grid_fioTableView.DataController.Values[i, 17]; // присваиваю ид_ман по фио
    break;
    end;
   end;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0] := frm_Istochniki_AE.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 1] := frm_Istochniki_AE.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 2] := frm_Istochniki_AE.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 3] := frm_Istochniki_AE.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4] := frm_Istochniki_AE.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5] := frm_Istochniki_AE.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6] := frm_Istochniki_AE.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7] := frm_Istochniki_AE.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8] := frm_Istochniki_AE.id_kekv;

    frm_Istochniki_AE.free;
  end;
end;

procedure Tfrm_Contracts_AE.Num_Dog_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Date_Zakl_DateEdit.SetFocus;
end;

procedure Tfrm_Contracts_AE.Date_Zakl_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Date_Beg_DateEdit.SetFocus;
end;

procedure Tfrm_Contracts_AE.Date_Beg_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Date_End_DateEdit.SetFocus;
end;

procedure Tfrm_Contracts_AE.Date_End_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then  Accounts.SetFocus;
end;

procedure Tfrm_Contracts_AE.Base_Dog_RadioButtonKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Accounts.SetFocus;
end;

procedure Tfrm_Contracts_AE.Addit_Dog_RadioButtonKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Accounts.SetFocus;
end;

procedure Tfrm_Contracts_AE.Grid_fioTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Grid_payers.SetFocus;
end;

procedure Tfrm_Contracts_AE.Grid_payersTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Grid_pay.SetFocus;
end;

procedure Tfrm_Contracts_AE.Grid_payTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Grid_istochniki.SetFocus;
end;

procedure Tfrm_Contracts_AE.Grid_istochnikiTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then  OkButton.SetFocus;
end;

procedure Tfrm_Contracts_AE.FormCreate(Sender: TObject);
begin
 Grid_istochnikiTableView.Items[0].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[5].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[8].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[9].DataBinding.ValueTypeClass := TcxLargeIntValueType;

 Grid_payTableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_payTableView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payTableView.Items[5].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payTableView.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;

Grid_fioTableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
Grid_fioTableView.Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
Grid_fioTableView.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
Grid_fioTableView.Items[10].DataBinding.ValueTypeClass := TcxCurrencyValueType;
Grid_fioTableView.Items[11].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[12].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[13].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[14].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[15].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[16].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[17].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[18].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[19].DataBinding.ValueTypeClass := TcxCurrencyValueType;
Grid_fioTableView.Items[20].DataBinding.ValueTypeClass := TcxLargeIntValueType;
Grid_fioTableView.Items[21].DataBinding.ValueTypeClass := TcxStringValueType;

 Grid_payersTableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payersTableView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payersTableView.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_payersTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_payersTableView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payersTableView.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
 Grid_payersTableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payersTableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payersTableView.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payersTableView.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payersTableView.Items[10].DataBinding.ValueTypeClass := TcxLargeIntValueType;
end;

procedure Tfrm_Contracts_AE.Delete_istochniki_BarButtonClick(
  Sender: TObject);
var i:byte;
begin
Grid_istochniki.SetFocus;
if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

 cn_Finace := true; // логирование действий
 Grid_istochnikiTableView.DataController.DeleteFocused;
end;

procedure Tfrm_Contracts_AE.Delete_period_BarButtonClick(Sender: TObject);
var i:byte;
begin
  If not Is_Admin then
   if not Addit_Dog_RadioButton.Checked then
    if (Grid_fioTableView.DataController.Values[0, 14] <> 8199) then //временое разрешение на редактирования экстернов ДонНУ
     If fibCheckPermission('/ROOT/Contracts/Cn_stage_opl','Del') <> 0
      then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;
Grid_pay.SetFocus;
if Grid_payTableView.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

 cn_StageOpl := true; // логирование действий
 Grid_payTableView.DataController.DeleteFocused;
end;

procedure Tfrm_Contracts_AE.Delete_fio_BarButtonClick(Sender: TObject);
var
i: byte;
j,n:integer;
ID_STUD: Variant;
cnt: integer;
begin
  Grid_fio.SetFocus;
  if Grid_fioTableView.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  cn_StudInfo := true; // логирование действий
  n:=Grid_fioTableView.DataController.FocusedRecordIndex;
  ID_STUD:=Grid_fioTableView.DataController.Values[n, 18];
  
  cnt:=0;
  for j:=0 to Grid_fioTableView.DataController.RecordCount-1 do
   if Grid_fioTableView.DataController.Values[j, 18]=ID_STUD then cnt:=cnt+1;

  if cnt>1 then Grid_fioTableView.DataController.DeleteFocused;

end;

procedure Tfrm_Contracts_AE.Delete_payers_BarButtonClick(Sender: TObject);
var i:byte;
begin
  Grid_payers.SetFocus;
  if Grid_payersTableView.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  cn_Payers := true; // логирование действий
  Grid_payersTableView.DataController.DeleteFocused;
  BuildComboPayersFilter;
  if Grid_payersTableView.DataController.RecordCount<>0 then Flash_period_BarButtonClick(sender);
end;

procedure Tfrm_Contracts_AE.Grid_payTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
     VK_INSERT : Add_period_BarButtonClick(sender);
     VK_F2     : Edit_period_BarButtonClick(Sender);
     VK_DELETE : Delete_period_BarButtonClick(sender);
    end;
end;

procedure Tfrm_Contracts_AE.Grid_istochnikiTableViewKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case key of
     VK_INSERT : Add_istochniki_BarButtonClick(Sender);
     VK_F2     : Edit_istochniki_BarButtonClick(Sender);
     VK_DELETE : Delete_istochniki_BarButtonClick(Sender);
    end;
end;

procedure Tfrm_Contracts_AE.Grid_fioTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
     VK_INSERT : Add_fio_BarrButtonClick(Sender);
     VK_F2     : Edit_fio_BarButtonClick(Sender);
     VK_DELETE : Delete_fio_BarButtonClick(Sender);
    end;
end;

procedure Tfrm_Contracts_AE.Grid_payersTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     case key of
     VK_INSERT : Add_payers_BarButtonClick(Sender);
     VK_F2     : Edit_payers_BarButtonClick(Sender);
     VK_DELETE : Delete_payers_BarButtonClick(Sender);
    end;
end;

procedure Tfrm_Contracts_AE.Grid_fioTableViewDblClick(Sender: TObject);
begin
Edit_fio_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.Grid_payersTableViewDblClick(Sender: TObject);
begin
Edit_payers_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.Grid_payTableViewDblClick(Sender: TObject);
begin
Edit_period_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.Grid_istochnikiTableViewDblClick(
  Sender: TObject);
begin
Edit_istochniki_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.papams_study_modify_popupClick(
  Sender: TObject);
var i: integer;
begin
  if Grid_fioTableView.DataController.RecordCount = 0 then exit;
  frmStudInf:=TfrmStudInf.Create(self, PLanguageIndex, DB_Handle_ae,is_admin);
  frmStudInf.caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex] + cnConsts.cn_StudyParams_Title[PLanguageIndex];
  frmStudInf.use_old_hist_price := use_old_hist_price;

  {проверяю одно из полей грида на не нулл}
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 1] <> null then
  {дата_начала}        frmStudInf.Date_Beg_DateEdit.Date :=     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 1];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 2] <> null then
  {дата_конца}         frmStudInf.Date_End_DateEdit.Date:=      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 2];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 3] <> null then
  {факультет}          frmStudInf.Faculty_Edit.Text:=           Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 3];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 4] <> null then
  {специальность}      frmStudInf.Spec_Edit.Text:=              Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 4];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 5] <> null then
  {группа}             frmStudInf.Group_Edit.Text:=             Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 5];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 6] <> null then
  {форма_обучения}     frmStudInf.FormStud_Edit.Text:=          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 6];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 7] <> null then
  {категория_обучения} frmStudInf.CategoryStudy_Edit.Text :=    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 7];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 8] <> null then
  {национальность}     frmStudInf.Nazional_Edit.Text:=          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 8];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 10] <> null then
  {сумма}              frmStudInf.Summa_Edit.Value:=            Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 10];

  {курс}
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 9] <> null then
   case strtoint(Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 9]) of
    1: frmStudInf.Kurs_ComboBox.ItemIndex:=0;
    2: frmStudInf.Kurs_ComboBox.ItemIndex:=1;
    3: frmStudInf.Kurs_ComboBox.ItemIndex:=2;
    4: frmStudInf.Kurs_ComboBox.ItemIndex:=3;
    5: frmStudInf.Kurs_ComboBox.ItemIndex:=4;
    6: frmStudInf.Kurs_ComboBox.ItemIndex:=5;
    7: frmStudInf.Kurs_ComboBox.ItemIndex:=6;
    8: frmStudInf.Kurs_ComboBox.ItemIndex:=7;
   end;

  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 11] <> null then
  {ид_факультета}      frmStudInf.ID_FACULTY:=                  Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 11];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 12] <> null then
  {ид_спец}            frmStudInf.ID_SPEC:=                     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 12];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 13] <> null then
  {ид_группы}          frmStudInf.ID_GROUP:=                    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 13];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 14] <> null then
  {ид_формыобуч}       frmStudInf.ID_FORMSTUD:=                 Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 14];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 15] <> null then
  {ид_категоробуч}     frmStudInf.ID_CATEGORYSTUD:=             Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 15];
  if Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 16] <> null then
  {ид_национал}        frmStudInf.ID_NATIONAL:=                 Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 16];

 {end;}

  if (ExtraMode) then frmStudInf.AddFromPreyskurant_Btn.Enabled:=false;
  if ((ExtraMode) and (dont_make_change)) then  // если Абитуриент - блокирую на изменение
   begin
    frmStudInf.Faculty_Edit.Enabled := false;
    frmStudInf.Spec_Edit.Enabled := false;
    frmStudInf.Group_Edit.Enabled := false;
    frmStudInf.FormStud_Edit.Enabled := false;
    frmStudInf.CategoryStudy_Edit.Enabled := false;
    frmStudInf.Nazional_Edit.Enabled := false;
    frmStudInf.Date_Beg_DateEdit.Enabled := false;
    frmStudInf.Kurs_ComboBox.Enabled := false;
   end;

  frmStudInf.summ1_stage:=Summ1;
  frmStudInf.summ2_stage:=Summ2;
  frmStudInf.summ3_stage:=Summ3;
  frmStudInf.summ4_stage:=Summ4;
  frmStudInf.summ5_stage:=Summ5;
  frmStudInf.summ6_stage:=Summ6;
  frmStudInf.summ7_stage:=Summ7;
  frmStudInf.summ8_stage:=Summ8;

  frmStudInf.term_stud1_stage:=term_stud1;
  frmStudInf.term_stud2_stage:=term_stud2;
  frmStudInf.term_stud3_stage:=term_stud3;
  frmStudInf.term_stud4_stage:=term_stud4;
  frmStudInf.term_stud5_stage:=term_stud5;
  frmStudInf.term_stud6_stage:=term_stud6;
  frmStudInf.term_stud7_stage:=term_stud7;
  frmStudInf.term_stud8_stage:=term_stud8;

  frmStudInf.Date_beg_stud1 := Date_beg_stud1;
  frmStudInf.Date_end_stud1 := Date_end_stud1;
  frmStudInf.Date_beg_stud2 := Date_beg_stud2;
  frmStudInf.Date_end_stud2 := Date_end_stud2;
  frmStudInf.Date_beg_stud3 := Date_beg_stud3;
  frmStudInf.Date_end_stud3 := Date_end_stud3;
  frmStudInf.Date_beg_stud4 := Date_beg_stud4;
  frmStudInf.Date_end_stud4 := Date_end_stud4;
  frmStudInf.Date_beg_stud5 := Date_beg_stud5;
  frmStudInf.Date_end_stud5 := Date_end_stud5;
  frmStudInf.Date_beg_stud6 := Date_beg_stud6;
  frmStudInf.Date_end_stud6 := Date_end_stud6;
  frmStudInf.Date_beg_stud7 := Date_beg_stud7;
  frmStudInf.Date_end_stud7 := Date_end_stud7;
  frmStudInf.Date_beg_stud8 := Date_beg_stud8;
  frmStudInf.Date_end_stud8 := Date_end_stud8;

  frmStudInf.kurs_stage:=1;
  frmStudInf.kurs_beg_stage:=1;

  change_stage_opl:=true;
  frmStudInf.change_stage_opl:=True;

  if frmStudInf.showmodal = mrOk then
   begin
    cn_StudInfo := true; // логирование действий
    summ1:=frmStudInf.Summ1;
    summ2:=frmStudInf.Summ2;
    summ3:=frmStudInf.Summ3;
    summ4:=frmStudInf.Summ4;
    summ5:=frmStudInf.Summ5;
    summ6:=frmStudInf.Summ6;
    summ7:=frmStudInf.Summ7;
    summ8:=frmStudInf.Summ8;

    term_stud1:=frmStudInf.term_stud1;
    term_stud2:=frmStudInf.term_stud2;
    term_stud3:=frmStudInf.term_stud3;
    term_stud4:=frmStudInf.term_stud4;
    term_stud5:=frmStudInf.term_stud5;
    term_stud6:=frmStudInf.term_stud6;
    term_stud7:=frmStudInf.term_stud7;
    term_stud8:=frmStudInf.term_stud8;

    Date_beg_stud1 := frmStudInf.Date_beg_stud1;
    Date_end_stud1 := frmStudInf.Date_end_stud1;
    Date_beg_stud2 := frmStudInf.Date_beg_stud2;
    Date_end_stud2 := frmStudInf.Date_end_stud2;
    Date_beg_stud3 := frmStudInf.Date_beg_stud3;
    Date_end_stud3 := frmStudInf.Date_end_stud3;
    Date_beg_stud4 := frmStudInf.Date_beg_stud4;
    Date_end_stud4 := frmStudInf.Date_end_stud4;
    Date_beg_stud5 := frmStudInf.Date_beg_stud5;
    Date_end_stud5 := frmStudInf.Date_end_stud5;
    Date_beg_stud6 := frmStudInf.Date_beg_stud6;
    Date_end_stud6 := frmStudInf.Date_end_stud6;
    Date_beg_stud7 := frmStudInf.Date_beg_stud7;
    Date_end_stud7 := frmStudInf.Date_end_stud7;
    Date_beg_stud8 := frmStudInf.Date_beg_stud8;
    Date_end_stud8 := frmStudInf.Date_end_stud8;

    kurs:=frmStudInf.kurs;
    kurs_beg:=frmStudInf.kurs_beg;

    change_stage_opl:=frmStudInf.change_stage_opl;

 {дата_начала}        Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 1] :=  frmStudInf.Date_Beg_DateEdit.Date;
{дата_конца}         Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 2] :=  frmStudInf.Date_End_DateEdit.Date;
{факультет}          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 3] :=  frmStudInf.Faculty_Edit.Text;
{специальность}      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 4] :=  frmStudInf.Spec_Edit.Text;
{группа}             Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 5] :=  frmStudInf.Group_Edit.Text;
{форма_обучения}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 6] :=  frmStudInf.FormStud_Edit.Text;
{категория_обучения} Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 7] :=  frmStudInf.CategoryStudy_Edit.Text;
{национальность}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 8] :=  frmStudInf.Nazional_Edit.Text;
{курс}               Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 9] :=  frmStudInf.Kurs_ComboBox.Text;
{сумма}              Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 10] := frmStudInf.Summa_Edit.Value;

{ид_факультета}      Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 11] := frmStudInf.ID_FACULTY;
{ид_спец}            Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 12] := frmStudInf.ID_SPEC;
{ид_группы}          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 13] := frmStudInf.ID_GROUP;
{ид_формыобуч}       Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 14] := frmStudInf.ID_FORMSTUD;
{ид_категоробуч}     Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 15] := frmStudInf.ID_CATEGORYSTUD;
{ид_национал}        Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 16] := frmStudInf.ID_NATIONAL;
{term_stud}          Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 22] := frmStudInf.term_stud_ComboBox.EditValue;

       if not frmStudInf.FinanceSource.isEmpty then
        begin
          DM := TDM_Contracts.Create(self);
          DM.DB.Handle := DB_Handle_ae;
          DM.ReadDataSet.close;
          DM.ReadDataSet.SQLs.SelectSQL.Text:='SELECT * FROM CN_GET_SMET_BY_PARAM(:ID_PRICE_PARAM)';
          DM.ReadDataSet.ParamByName('ID_PRICE_PARAM').AsInt64:= frmStudInf.ID_PRICE_PARAM;
          DM.ReadDataSet.Open;
          DM.ReadDataSet.FetchAll;
          DM.ReadDataSet.First;

          if DM.ReadDataSet.RecordCount<>0 then
          // чистка всех записей таблицы источников
          for i:= Grid_istochnikiTableView.DataController.RecordCount -1 downto 0 do
           Grid_istochnikiTableView.DataController.DeleteRecord(i);

          for i:= 0 to DM.ReadDataSet.RecordCount-1 do
           begin
            Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := DM.ReadDataSet['CODE_SM'];
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := DM.ReadDataSet['CODE_RZ'];
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := DM.ReadDataSet['CODE_ST'];
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := DM.ReadDataSet['CODE_KEKV'];
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := DM.ReadDataSet['PROCENT'];
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := inttostr(DM.ReadDataSet['ID_SM']);
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := inttostr(DM.ReadDataSet['ID_RZ']);
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := inttostr(DM.ReadDataSet['ID_ST']);
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := inttostr(DM.ReadDataSet['ID_KEKV']);
            Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount-1, 9]   := Grid_fioTableView.DataController.Values[0, 17];
            DM.ReadDataSet.Next;
           end;

           if Grid_istochnikiTableView.DataController.RecordCount=0 then Flash_Istoch_BarButtonClick(Sender);

           DM.ReadDataSet.Close;
           DM.Free;
         end;

  if change_stage_opl then Flash_period_BarButtonClick(Sender);
 end;
end;

procedure Tfrm_Contracts_AE.fio_modify_popupClick(Sender: TObject);
begin
  Edit_fio_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.RasShet_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key= #13 then  Grid_fio.SetFocus;
end;

procedure Tfrm_Contracts_AE.Grid_fioEnter(Sender: TObject);
begin
 Grid_fioTableView.Styles.Header:= SuperStyling_Header;
end;

procedure Tfrm_Contracts_AE.Grid_fioExit(Sender: TObject);
begin
 Grid_fioTableView.Styles.Header:= cxStyle9;
end;

procedure Tfrm_Contracts_AE.Grid_payersEnter(Sender: TObject);
begin
 Grid_payersTableView.Styles.Header:= SuperStyling_Header;
end;

procedure Tfrm_Contracts_AE.Grid_payEnter(Sender: TObject);
begin
 Grid_payTableView.Styles.Header:= SuperStyling_Header;
end;

procedure Tfrm_Contracts_AE.Grid_istochnikiEnter(Sender: TObject);
begin
 Grid_istochnikiTableView.Styles.Header:= SuperStyling_Header;
end;

procedure Tfrm_Contracts_AE.Grid_payersExit(Sender: TObject);
begin
 Grid_payersTableView.Styles.Header:= cxStyle9;
end;

procedure Tfrm_Contracts_AE.Grid_payExit(Sender: TObject);
begin
 Grid_payTableView.Styles.Header:= cxStyle9;
end;

procedure Tfrm_Contracts_AE.Grid_istochnikiExit(Sender: TObject);
begin
 Grid_istochnikiTableView.Styles.Header:= cxStyle9;
end;

procedure Tfrm_Contracts_AE.AccountsPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle_ae;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_DefaultAccounts.bpl','ShowDefaultAccounts');
  AParameter.Free;
  if VarArrayDimCount(res)>0 then
   begin
    ID_INT_Account := res[0];
    Accounts.Text  := vartostr(res[1]);
    //Account_Label.Caption:= vartostr(res[2]);
   end;
 end;

procedure Tfrm_Contracts_AE.AccountsKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OsvitPoslEdit.SetFocus;
end;

procedure Tfrm_Contracts_AE.LgotaButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
Grid_fio.SetFocus;
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DB_Handle_ae;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= ID_DOG_ROOT;
 AParameter.cnParamsToPakage.ID_STUD:= Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 18];
 AParameter.cnParamsToPakage.FIO := Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 0];
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Lgots.bpl','ShowDTLgots');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure Tfrm_Contracts_AE.EntryRestButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
Grid_fio.SetFocus;
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DB_Handle_ae;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= ID_DOG_ROOT;
 AParameter.cnParamsToPakage.ID_STUD:=  Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 18];
 AParameter.cnParamsToPakage.FIO :=    Grid_fioTableView.DataController.Values[Grid_fioTableView.DataController.FocusedRecordIndex, 0];
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_EntryRest.bpl','ShowEntryRest');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure Tfrm_Contracts_AE.TreeBranchCloseBtnClick(Sender: TObject);
begin
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
Grid_fioTableView.Controller.FocusedRecord.Collapse(true);
end;

procedure Tfrm_Contracts_AE.TreeBranchOpenBtnClick(Sender: TObject);
begin
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
Grid_fioTableView.Controller.FocusedRecord.Expand(true);
end;

procedure Tfrm_Contracts_AE.TreeFullOpenBtnClick(Sender: TObject);
begin
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
Grid_fioTableView.ViewData.Expand(True);
end;

procedure Tfrm_Contracts_AE.TreeFullCloseBtnClick(Sender: TObject);
begin
if Grid_fioTableView.DataController.RecordCount = 0 then exit;
Grid_fioTableView.ViewData.Collapse(True);
end;

procedure Tfrm_Contracts_AE.FullScreenBtnClick(Sender: TObject);
 procedure FullScreen(AParametr: boolean);
  begin
    if AParametr then
     begin
      Periods_GroupBox.Visible:=false;
      Payers_GroupBox.Visible:=false;
      Istochniki_GroupBox.Visible:=false;
      Study_GroupBox.Align := alClient;
     end
     else
     begin
      Periods_GroupBox.Visible:=true;
      Payers_GroupBox.Visible:=true;
      Istochniki_GroupBox.Visible:=true;
      Study_GroupBox.Align := alCustom;
      Study_GroupBox.Width := 404;
      Study_GroupBox.Height := 215;
      Study_GroupBox.Anchors:= [akLeft,akTop,akBottom];
     end;
  end;
begin
  FullScreen(FullScreenBtn.Down);
end;

procedure Tfrm_Contracts_AE.FullScreenBtn2Click(Sender: TObject);
 procedure FullScreen(AParametr: boolean);
  begin
    if AParametr then
     begin
      Payers_GroupBox.Visible:=false;
      Istochniki_GroupBox.Visible:=false;
      Study_GroupBox.Visible:=false;
      Periods_GroupBox.Align:=alClient;
     end
     else
     begin
      Payers_GroupBox.Visible:=true;
      Istochniki_GroupBox.Visible:=true;
      Study_GroupBox.Visible:=true;
      Periods_GroupBox.Align:=alCustom;
      Periods_GroupBox.Width := 377;
      Periods_GroupBox.Height := 215;
      Periods_GroupBox.Top := 81;
      Periods_GroupBox.Left:=408
     end;
  end;
begin
  FullScreen(FullScreenBtn2.Down);
end;

function DateDiffInMonth(DateEnd, DateBeg: TDateTime):Extended;
var
  day,month,year, day2,month2,year2:word;
  m1,m2:Integer;
  mme, mmb: Extended;
begin
  DecodeDate(DateBeg,year,month,day);
  DecodeDate(DateEnd,year2,month2,day2);

  m1:=year*12+month;
  m2:=year2*12+month2;
  mme:=0;
  mmb:=0;
  if day<>1 then
  begin
    mmb:=DaysInAMonth(year, month);
    mmb:=(mmb-day+1)/mmb;
    m1:=m1+1;
  end;

  if day2<>1 then
  begin
    mme:=DaysInAMonth(year2, month2);
    mme:=day2/mme;
  end;
  Result:=mmb+m2-m1+mme;
end;

procedure Tfrm_Contracts_AE.Flash_period_BarButtonClick(Sender: TObject);
 function ExtractNumYear2(date:TDateTime;separator:string):string;
  var
    day,month,year:Word;
  begin
   DecodeDate(date,year,month,day);
   if month<8 then year := year - 1;
   Result := IntToStr(year)+separator+intToStr(year+1);  
  end;
var
  w, i, cm, i_payer : integer;
  DM, DM2 : TDM_Contracts;
  summa_opl:Double;
  term_stud :Integer;
  now_AcademicYear_beg: TDate;
  change_all:boolean;
  ACountMonth:array of Integer;
  LengthCountMonth : Integer;
  Date_beg_stud, date_end_stud : TDate;
  kol_day_beg_end_stud, kol_day_beg_end_part, procent : Double;
  Date_beg_part, Date_end_part : TDate;
  Day, Month, Year : word;
  month_beg_part : Integer;
  

  //часть для Алчевска
  cnExAcademicYear: TcnExAcademicYear;
  StageOplGenInfo : array of TStageOplGenInfo;
  j, flag, k, CountMonth : Integer;
  whos_complete_man : int64;
  BegDateCurrentBreak, EndDateCurrentBreak : TDateTime;
  Now_Year,Now_Month,Now_Day : Word;
  DateOpl: TDate;
  Opl_Year,Opl_Month,Opl_Day : Word;
  Coefficient, C_Coefficient : Currency;
  ResultSQl: byte;
  cn_date_start : TDate;
begin
  //В данном месте организован бредовый метод, для нормальных и для Алчевских пользователей
  //его можно было бы оптимизировать и вынести одинаковые блоки, но мне не хочется заниматься ерундой
  if ((cn_use_new_stage_opl = 1) and (not Addit_Dog_RadioButton.Checked)) then
   Begin
    DM:=TDM_Contracts.Create(Self);
    DM.DB.Handle:=DB_Handle_ae;
    DM.ReadTransaction.StartTransaction;
    DM2:=TDM_Contracts.Create(Self);
    DM2.DB.Handle:=DB_Handle_ae;
    DM2.ReadTransaction.StartTransaction;

    //Признак изменения все периодов оплат
    change_all:=True;

    //проверка существования сведений о плательщики
    If Grid_payersTableView.DataController.RecordCount=0 then
     begin
      ShowMessage('Необхідно вибрати платника!');
      Grid_payers.SetFocus;
      exit;
     end;
    //Проверка существования сведений о студенте
    If Check_Grid_fioTableView_on_Errors then
     begin
      ShowMessage('Необхідно вибрати студента та його пареметри навчання!');
      Grid_fio.SetFocus;
      exit;
     end;
    // проверка дат на корректность. Дата начала меньше даты окончания договора
    If Date_Beg_DateEdit.Date > Date_End_DateEdit.Date then
     begin
      ShowMessage(cnConsts_Messages.cn_DateBegNeedMoreDateEnd[PLanguageIndex]);
      Date_End_DateEdit.SetFocus;
      exit;
     end;
    //начало текущего учебного года. На случай если нет дат в прейскуранте
    now_AcademicYear_beg := AcademicYear(now_date).Date_Beg;

    //Проверка на необходимость изминения всех начислений
    If Grid_payTableView.DataController.RecordCount<>0 then
     Begin
      i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Змінити усі періоди оплат?', mtConfirmation, [mbYes, mbNo, mbCancel]);
      case i of
       2:Begin exit; End; //cancel
       6:Begin change_all:= true;  End;//yes
       7:Begin change_all:= false; End;//no
      End;
     end;

    // чистка всех записей таблицы периодов оплат
    for i:= Grid_payTableView.DataController.RecordCount -1 downto 0 do
     begin
      //Проверка на необходимость удаления этой записи
      If change_all
       then Grid_payTableView.DataController.DeleteRecord(i)
       else if now_AcademicYear_beg <=(StrToDate(Grid_payTableView.DataController.Values[i,0])) then Grid_payTableView.DataController.DeleteRecord(i)
     End;

    //определение кол-ва частей и кол-во месяцев в части
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_TYPE_STAGE_BY_ID('+ inttostr(Grid_payersTableView.DataController.Values[0, 4]) + ')';
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;

    //кол-во частей
    LengthCountMonth:=DM.ReadDataSet.RecordCount;

    //массив из кол-ва месяцев в части
    SetLength(ACountMonth,LengthCountMonth);
    DM.ReadDataSet.First;
    cm:=0;
    while not DM.ReadDataSet.Eof do
     begin
      ACountMonth[cm] := DM.ReadDataSet['CNT_MONTH'];
      DM.ReadDataSet.Next;
      cm:=cm+1;
     end;
    DM.ReadDataSet.close;

    //Начало цикла по годам обучения
    w := 0;
    repeat
      //Определение суммы и периода обучения
      summa_opl := 0;
      case w+(kurs-kurs_beg+1) of
        1:Begin summa_opl:=Summ1; term_stud:=term_stud1; Date_beg_stud := Date_beg_stud1; date_end_stud := Date_end_stud1; End;
        2:begin summa_opl:=Summ2; term_stud:=term_stud2; Date_beg_stud := Date_beg_stud2; date_end_stud := Date_end_stud2; End;
        3:Begin summa_opl:=Summ3; term_stud:=term_stud3; Date_beg_stud := Date_beg_stud3; date_end_stud := Date_end_stud3; End;
        4:Begin summa_opl:=Summ4; term_stud:=term_stud4; Date_beg_stud := Date_beg_stud4; date_end_stud := Date_end_stud4; End;
        5:Begin summa_opl:=Summ5; term_stud:=term_stud5; Date_beg_stud := Date_beg_stud5; date_end_stud := Date_end_stud5; End;
        6:Begin summa_opl:=Summ6; term_stud:=term_stud6; Date_beg_stud := Date_beg_stud6; date_end_stud := Date_end_stud6; End;
        7:Begin summa_opl:=Summ7; term_stud:=term_stud7; Date_beg_stud := Date_beg_stud7; date_end_stud := Date_end_stud7; End;
        8:Begin summa_opl:=Summ8; term_stud:=term_stud8; Date_beg_stud := Date_beg_stud8; date_end_stud := Date_end_stud8; End;
      end;

      month_beg_part := MonthOf(Date_beg_stud); //дата месяца начала разбивки = месяц начала учебного года

      //если цикл проходит первый раз и дата прейскуранта больше чем указанная меняем на дату из прейскуранта
      if ((w=0) and (Date_Beg_DateEdit.EditValue < Date_beg_stud))
       then Date_Beg_DateEdit.EditValue := Date_beg_stud;

      //начинаем разбивку на периоды
      If (summa_opl<>0) or (w = 0) then
       If ((change_all) or (now_AcademicYear_beg <= Date_beg_stud)) then
       Begin
        //определяем кол-во дней в курсе
        kol_day_beg_end_stud := DateDiffInMonth(Date_end_stud + cn_end_month, date_beg_stud);

        //цикл по кол-ву частей разбивки
        for i:=0 to LengthCountMonth-1 do
         Begin
          If i = 0 then
           begin
            //определение даты для начала периода разбивки
            DecodeDate(Date_beg_stud, Year, Month, Day);
            if month < month_beg_part then year:= Year - 1;
            Date_beg_part := EncodeDate(Year, month_beg_part, 1);
           End;

          DecodeDate(Date_beg_part, Year, Month, Day);

          Month := Month + ACountMonth[i];
          if month > 12 then
           begin
            year := Year + 1;
            Month := Month - 12;
           end;

          //Дата окончания части периода
          Date_end_part := EncodeDate(Year, month, 1) - cn_end_month;

          If ((Date_end_part >= Date_beg_stud) and (Date_beg_part <> Date_end_Stud)) then
           begin
            Date_beg_part := Date_beg_stud;

            If date_end_part > date_end_stud then date_end_part := date_end_stud;

            kol_day_beg_end_part := DateDiffInMonth(Date_end_part + cn_end_month, Date_beg_part);

            //расбиваем еще на кол-во плательщиков
            for i_payer := 0 to Grid_payersTableView.DataController.RecordCount - 1 do
             begin
              procent := StrToFloat(Grid_payersTableView.DataController.Values[i_payer, 2]);
              Grid_payTableView.DataController.RecordCount := Grid_payTableView.DataController.RecordCount + 1;
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 0] := DateToStr(Date_beg_part);
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 1] := DateToStr(Date_end_part);
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DateToStr(Date_beg_part);
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 3] := FloatToStr((summa_opl*kol_day_beg_end_part*procent)/(100*kol_day_beg_end_stud));
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 4] := Grid_payersTableView.DataController.Values[i_payer, 6];
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 5] := Grid_fioTableView.DataController.Values[0, 17];
              Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 6] := ExtractNumYear2(Date_beg_stud,'/');
             end;

            Date_beg_stud := Date_end_part + cn_end_month;
            Date_beg_part := Date_end_part + cn_end_month;
           End
         End;

         if  Date_end_stud > Date_end_part then
          begin
           Date_beg_part := Date_beg_stud;

           kol_day_beg_end_part := DateDiffInMonth(Date_end_stud + cn_end_month, Date_beg_part);

           Date_end_part := Date_end_part - cn_end_month;
           Grid_payTableView.DataController.RecordCount := Grid_payTableView.DataController.RecordCount + 1;
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 0] := DateToStr(Date_beg_part);
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 1] := DateToStr(Date_end_stud);
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DateToStr(Date_beg_part);
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 3] := FloatToStr((summa_opl*kol_day_beg_end_part)/kol_day_beg_end_stud);
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 4] := Grid_payersTableView.DataController.Values[0, 6];
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 5] := Grid_fioTableView.DataController.Values[0, 17];
           Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 6] := ExtractNumYear2(Date_beg_stud,'/');
          end;
       end;
      w := w + 1;
    until ((summa_opl = 0) or (w>=8));

    if Grid_payTableView.DataController.RecordCount > 0 then
     Begin
      Date_End_DateEdit.EditValue := StrToDate(Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount-1, 1]);

      //Удаление записей выходящие за приделы периода
      for w := Grid_payTableView.DataController.RecordCount - 1 downto 0 do
       begin
        If StrToDate(Grid_payTableView.DataController.Values[w,1]) < Date_Beg_DateEdit.EditValue
         then Grid_payTableView.DataController.DeleteRecord(w)
         else If StrToDate(Grid_payTableView.DataController.Values[w,0]) >= Date_End_DateEdit.EditValue then Grid_payTableView.DataController.DeleteRecord(w);
       end;

      For w:=0 to Grid_payTableView.DataController.RecordCount-1 do
       begin
        If StrToDate(Grid_payTableView.DataController.Values[w,0]) < Date_Beg_DateEdit.EditValue then
         begin
          Date_beg_part := StrToDate(Grid_payTableView.DataController.Values[w, 0]);
          Date_end_part := StrToDate(Grid_payTableView.DataController.Values[w, 1]);

          kol_day_beg_end_stud := DateDiffInMonth(Date_end_part + cn_end_month, Date_beg_part);

          kol_day_beg_end_part := DateDiffInMonth(Date_Beg_DateEdit.EditValue, Date_beg_part);

          Grid_payTableView.DataController.Values[w, 0] := DateToStr(Date_Beg_DateEdit.EditValue);
          Grid_payTableView.DataController.Values[w, 2] := DateToStr(Date_Beg_DateEdit.EditValue);

          summa_opl := StrToFloat(Grid_payTableView.DataController.Values[w, 3]);
          Grid_payTableView.DataController.Values[w, 3] := FloatToStr(summa_opl - ((summa_opl*kol_day_beg_end_part)/kol_day_beg_end_stud));
         end;
       end;
     end
    else ShowMessage('Помилка при роботі с прейскурантом!');
    Grid_payTableView.ViewData.Expand(true);
   end

   else
    Begin
     //а теперь для гребанового Алчевска
     
     now_date:=date;
     change_all:=True;

     //проверка существования сведений о плательщики
     If Grid_payersTableView.DataController.RecordCount=0 then
      begin
       Grid_payers.SetFocus;
       exit;
      end;

     //проверка существования сведений о студенте
     If Check_Grid_fioTableView_on_Errors then
      begin
       Grid_fio.SetFocus;
       exit;
      end;

     // проверка дат на корректность
     If Date_Beg_DateEdit.Date >= Date_End_DateEdit.Date then
      begin
       ShowMessage(cnConsts_Messages.cn_DateBegNeedMoreDateEnd[PLanguageIndex]);
       Date_End_DateEdit.SetFocus;
       exit;
      end;

     now_AcademicYear_beg:=cn_Common_Funcs.AcademicYear(now_date).Date_Beg; //начало текущего учебного года
     if Grid_payTableView.DataController.RecordCount<>0 then
      Begin
       i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Змінити усі періоди оплат?', mtConfirmation, [mbYes, mbNo, mbCancel]);
       case i of
        2:Begin exit; End; //cancel
        6:Begin change_all:= true;  End;//yes
        7:Begin change_all:= false; End;//no
       End;
      end;

     // реализация автоматического генерирования периодов оплаты
     { 1)необходимо определить количество академических лет, входящих в период действия договора}
     Screen.Cursor := crHourGlass;

     Date_Beg_DateEdit.Date := VarToDateTime(Date_Beg_DateEdit.Text);
     Date_End_DateEdit.Date := VarToDateTime(Date_End_DateEdit.Text);
     cnExAcademicYear:= cn_Common_Funcs.ExtractAcademicYears(Date_Beg_DateEdit.Date, Date_End_DateEdit.Date);

     // определяю кол-во обучающихся по контракту
     // и формирую их реестр-массив
     SetLength(StageOplGenInfo, 1);
     StageOplGenInfo[0].ID_MAN:=  Grid_fioTableView.DataController.Values[0, 17];
     StageOplGenInfo[0].FIO:=     Grid_fioTableView.DataController.Values[0, 0];

     for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
     for j:=0 to Length(StageOplGenInfo)-1 do
      begin
       for w:=0 to Length(StageOplGenInfo)-1 do
        begin
         flag := 0;
         if Grid_fioTableView.DataController.Values[i, 17] = StageOplGenInfo[w].ID_MAN then flag:=1;
        end;
       if flag =1 then Continue;
       SetLength(StageOplGenInfo, Length(StageOplGenInfo)+1 );
       StageOplGenInfo[Length(StageOplGenInfo)-1].ID_MAN:= Grid_fioTableView.DataController.Values[i, 17];
       StageOplGenInfo[Length(StageOplGenInfo)-1].FIO:=    Grid_fioTableView.DataController.Values[i, 0];
      end;

     // чистка всех записей таблицы периодов оплат
     for i:= Grid_payTableView.DataController.RecordCount -1 downto 0 do
      begin
       If change_all
        then Grid_payTableView.DataController.DeleteRecord(i)
        else if now_AcademicYear_beg<=(StrToDate(Grid_payTableView.DataController.Values[i,0])) then Grid_payTableView.DataController.DeleteRecord(i)
      End;

     // заполнение периодов оплат
     DM:=TDM_Contracts.Create(Self);
     DM.DB.Handle:=DB_Handle_ae;
     DM.ReadTransaction.StartTransaction;
     DM2:=TDM_Contracts.Create(Self);
     DM2.DB.Handle:=DB_Handle_ae;
     DM2.ReadTransaction.StartTransaction;

     // определяю кол-во месяцев оплаты
     DM.ReadDataSet.Close;
     DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_TYPE_STAGE_BY_ID('+ inttostr(Grid_payersTableView.DataController.Values[k, 4]) +')';
     DM.ReadDataSet.Open;
     DM.ReadDataSet.FetchAll;
     LengthCountMonth:=DM.ReadDataSet.RecordCount;
     SetLength(ACountMonth,LengthCountMonth);
     DM.ReadDataSet.First;
     cm:=0;
     while not DM.ReadDataSet.Eof do
      begin
       ACountMonth[cm] := DM.ReadDataSet['CNT_MONTH'];
       DM.ReadDataSet.Next;
       cm:=cm+1;
      end;
     DM.ReadDataSet.close;

     flag:=0;
     whos_complete_man := -222;
     for i:=0 to Length(StageOplGenInfo)-1 do //кол-во академических лет
     for j:=0 to Grid_fioTableView.DataController.RecordCount -1 do //кол-во человек в договоре
      if ((StageOplGenInfo[i].ID_MAN = Grid_fioTableView.DataController.Values[j, 17]) and
          (StageOplGenInfo[i].ID_MAN <> whos_complete_man))
       then
        begin
         whos_complete_man := StageOplGenInfo[i].ID_MAN;

         //Цикл по кол-ву лет обучения
         for w:=0 to Length(cnExAcademicYear)-1 do
          begin
           if ((change_all) or (now_AcademicYear_beg<=cnExAcademicYear[w].Date_Beg)) then
            Begin
             case w+(kurs-kurs_beg+1) of
              1:Begin summa_opl:=Summ1; term_stud:=term_stud1; End;
              2:begin summa_opl:=Summ2; term_stud:=term_stud2; End;
              3:Begin summa_opl:=Summ3; term_stud:=term_stud3; End;
              4:Begin summa_opl:=Summ4; term_stud:=term_stud4; End;
              5:Begin summa_opl:=Summ5; term_stud:=term_stud5; End;
              6:Begin summa_opl:=Summ6; term_stud:=term_stud6; End;
              7:Begin summa_opl:=Summ7; term_stud:=term_stud7; End;
              8:Begin summa_opl:=Summ8; term_stud:=term_stud8; End;
             end;
             if term_stud=0 then term_stud:=10;

             flag := 0;
             for k:=0 to Grid_payersTableView.DataController.RecordCount -1 do
              begin
               //разбиваю текущий академ.год на периоды согласно CountMonth
               BegDateCurrentBreak := cnExAcademicYear[w].Date_Beg;
               EndDateCurrentBreak := cnExAcademicYear[w].Date_Beg;
               For cm:=0 to LengthCountMonth-1 do
                begin
                 CountMonth  := 0;
                 CountMonth  := ACountMonth[cm];
                 try
                  begin
                   DM.StProc.StoredProcName := 'CN_INC_DATE';
                   DM.StProc.Transaction.StartTransaction;
                   DM.StProc.Prepare;
                   DM.StProc.ParamByName('INDATE').AsDate := BegDateCurrentBreak;
                   DM.StProc.ParamByName('CNT_MONTH').AsInteger := CountMonth;
                   DM.StProc.ExecProc;

                   EndDateCurrentBreak := DM.StProc.ParamByName('OUTDATE').AsDate;

                   DM.StProc.Transaction.Commit;

                   if EndDateCurrentBreak  = cnExAcademicYear[w].Date_Beg
                    then EndDateCurrentBreak := cnExAcademicYear[w].Date_End;

                   Grid_payTableView.DataController.RecordCount := Grid_payTableView.DataController.RecordCount + 1;
                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 0] := DatetoStr(BegDateCurrentBreak);
                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 1] := DatetoStr(EndDateCurrentBreak);

                   // блок определения даты оплаты
                   if DM2.ReadDataSet.RecordCount = 1
                    then
                     begin
                      // экстракт даты
                      DecodeDate(BegDateCurrentBreak,Now_Year,Now_Month,Now_Day);

                      // проверка на null
                      if ((DM2.ReadDataSet['DAY_STAGE']<> '') and  (DM2.ReadDataSet['DAY_STAGE']<> null))
                       then Opl_Day := StrToInt(DM2.ReadDataSet['DAY_STAGE'])
                       else Opl_Day := Now_Day;

                      if ((DM2.ReadDataSet['MONTH_STAGE']<> '')and(DM2.ReadDataSet['MONTH_STAGE']<>null ))
                       then Opl_Month := StrToInt(DM2.ReadDataSet['MONTH_STAGE'])
                       else Opl_Month := Now_Month;

                      Opl_Year:=Now_Year;
                      DateOpl :=EncodeDate(Opl_Year,Opl_Month,Opl_Day);
                      Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DatetoStr(DateOpl);
                     end
                    else
                     if DM2.ReadDataSet.RecordCount>1
                      then
                       begin
                        // когда число записей больше 1, то, вероятно, это семестровая оплата
                        // экстракт даты
                        DecodeDate(BegDateCurrentBreak,Now_Year,Now_Month,Now_Day);
                        if Now_Month >=7
                         then DM2.ReadDataSet.First
                         else DM2.ReadDataSet.Last;

                        // проверка на null
                        if ((DM2.ReadDataSet['DAY_STAGE']<> '') and  (DM2.ReadDataSet['DAY_STAGE']<> null))
                         then Opl_Day := StrToInt(DM2.ReadDataSet['DAY_STAGE'])
                         else Opl_Day := Now_Day;

                        if ((DM2.ReadDataSet['MONTH_STAGE']<> '')and(DM2.ReadDataSet['MONTH_STAGE']<>null ))
                         then Opl_Month := StrToInt(DM2.ReadDataSet['MONTH_STAGE'])
                         else Opl_Month := Now_Month;

                        Opl_Year:=Now_Year;
                        DateOpl :=EncodeDate(Opl_Year,Opl_Month,Opl_Day);
                        Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DatetoStr(DateOpl);
                       end;

                   if DM2.ReadDataSet.RecordCount=0
                    then Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DatetoStr(EndDateCurrentBreak);

                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 6] :=
                     {num_year}ExtractNumYear(cnExAcademicYear[w].Date_Beg, cnExAcademicYear[w].Date_End, '/');

                   // предполагая, что в академ году всегда 10 месяцев(не хочется усложнять себе жизнь :) )
                   // хотя, можно написать запрос, который бы вернул кол-во акдем. месяцев, но влом

                   if CountMonth = 0
                    then C_Coefficient := 1
                    else C_Coefficient := CountMonth / term_stud; //10;

                   if Grid_payersTableView.DataController.Values[k, 5] = 1
                    then Coefficient := C_Coefficient * Grid_payersTableView.DataController.Values[k, 2]/100 * summa_opl
                    else Coefficient:= C_Coefficient * Grid_payersTableView.DataController.Values[k, 2];

                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 3] := Coefficient; // сумма
                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 4] := Grid_payersTableView.DataController.Values[k, 6]; //payer
                   Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 5] := StageOplGenInfo[i].ID_MAN;//man
                   BegDateCurrentBreak := EndDateCurrentBreak;
                   flag := 1;
                  end
                  except
                   DM.StProc.Transaction.Rollback;
                   DM.ReadDataSet.close;
                 end;
                end;
               DM2.ReadDataSet.close;
              end;
            end;
          end;
        end;

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
       for j:= (Grid_payTableView.DataController.RecordCount-1) downto 0  do
        begin
         DM.StProc.StoredProcName := 'CN_INC_DATE';
         DM.StProc.Transaction.StartTransaction;
         DM.StProc.Prepare;
         DM.StProc.ParamByName('INDATE').AsDate := strtodate(Grid_payTableView.DataController.Values[j, 1]);
         DM.StProc.ParamByName('CNT_DAY').AsInteger := -1;
         DM.StProc.ParamByName('CNT_YEAR').AsVariant := null;
         DM.StProc.ParamByName('CNT_MONTH').AsVariant := null;
         DM.StProc.ExecProc;
         Grid_payTableView.DataController.Values[j, 1] := datetostr(DM.StProc.ParamByName('OUTDATE').AsDate);
         DM.StProc.Transaction.Commit;
        end;
      end;

     // проверяем дату старта системы
     Dm.ReadDataSet.Close;
     Dm.ReadDataSet.SelectSQL.Clear;
     Dm.ReadDataSet.SelectSQL.Text := 'select CN_DATE_START from CN_PUB_SYS_DATA_GET_ALL';
     Dm.ReadDataSet.Open;
     
     if Dm.ReadDataSet['CN_DATE_START'] <> null
      then cn_date_start:= Dm.ReadDataSet['CN_DATE_START']
      else cn_date_start:= strtodate('01.01.1900');
     Dm.ReadDataSet.Close;

     // далее удаляем лишние периоды
     for j:= (Grid_payTableView.DataController.RecordCount-1) downto 0  do
      begin
       if (strtodate(Grid_payTableView.DataController.Values[j, 0]) < cn_date_start) then
        begin
         Grid_payTableView.DataController.DeleteRecord(j);
         Continue;
        end;

      if ((strtodate(Grid_payTableView.DataController.Values[j, 0]) < Date_Beg_DateEdit.Date) and
          (strtodate(Grid_payTableView.DataController.Values[j, 1]) <= Date_Beg_DateEdit.Date))
       then
        begin
         Grid_payTableView.DataController.DeleteRecord(j);
         Continue;
        end;

      if ((strtodate(Grid_payTableView.DataController.Values[j, 1]) > Date_Beg_DateEdit.Date) and
          (strtodate(Grid_payTableView.DataController.Values[j, 0]) < Date_Beg_DateEdit.Date) )
       then
        begin
         if not bool(ResultSQl)
          then
           Grid_payTableView.DataController.Values[j, 3]:=
             DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1]),Date_Beg_DateEdit.Date)/
             DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1]),strtodate(Grid_payTableView.DataController.Values[j, 0]))
             * StrToCurr(Grid_payTableView.DataController.Values[j, 3])


          else
           Grid_payTableView.DataController.Values[j, 3]:=
             DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1]),Date_Beg_DateEdit.Date)/
             DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1])+1,strtodate(Grid_payTableView.DataController.Values[j, 0]))
             * StrToCurr(Grid_payTableView.DataController.Values[j, 3]);


         Grid_payTableView.DataController.Values[j, 0] := datetostr(Date_Beg_DateEdit.Date);
        end;

      if ((strtodate(Grid_payTableView.DataController.Values[j, 1]) > Date_End_DateEdit.Date) and
            (strtodate(Grid_payTableView.DataController.Values[j, 0]) >= Date_End_DateEdit.Date))
       then Grid_payTableView.DataController.DeleteRecord(j)
       else
      if ((strtodate(Grid_payTableView.DataController.Values[j, 1]) > Date_End_DateEdit.Date) and
             (strtodate(Grid_payTableView.DataController.Values[j, 0]) < Date_End_DateEdit.Date))
       then
        begin
         if not bool(ResultSQl)
          then
           begin
{                  Grid_payTableView.DataController.Values[j, 3]:=
                    ((Date_End_DateEdit.Date - strtodate(Grid_payTableView.DataController.Values[j, 0]))/
                    (strtodate(Grid_payTableView.DataController.Values[j, 1])-strtodate(Grid_payTableView.DataController.Values[j, 0])))
                    * StrToCurr(Grid_payTableView.DataController.Values[j, 3]);
}
                  Grid_payTableView.DataController.Values[j, 3]:=
                    DateDiffInMonth(Date_End_DateEdit.Date, strtodate(Grid_payTableView.DataController.Values[j, 0]))/
                    DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1]),strtodate(Grid_payTableView.DataController.Values[j, 0]))
                    * StrToCurr(Grid_payTableView.DataController.Values[j, 3]);

                {  ShowMessage(DateToStr(Date_End_DateEdit.Date));
                  ShowMessage(Grid_payTableView.DataController.Values[j, 0]);
                  ShowMessage(Grid_payTableView.DataController.Values[j, 1]);}
           End
          else
                  Grid_payTableView.DataController.Values[j, 3]:=
                    DateDiffInMonth(Date_End_DateEdit.Date, strtodate(Grid_payTableView.DataController.Values[j, 0]))/
                    DateDiffInMonth(strtodate(Grid_payTableView.DataController.Values[j, 1])+1,strtodate(Grid_payTableView.DataController.Values[j, 0]))
                    * StrToCurr(Grid_payTableView.DataController.Values[j, 3]);


         Grid_payTableView.DataController.Values[j, 1] := datetostr(Date_End_DateEdit.Date);
        end;
      End;

     DM.Free;
     DM2.Free;

     Grid_payTableView.ViewData.Expand(True);

     if ((Grid_payTableView.DataController.RecordCount = 0) and (Date_Beg_DateEdit.Date > cn_date_start))then
      begin
       Grid_payTableView.DataController.RecordCount := Grid_payTableView.DataController.RecordCount + 1;
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 0] := DateToStr(Date_Beg_DateEdit.Date);
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 1] := DateToStr(Date_End_DateEdit.Date);
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 2] := DateToStr(Date_End_DateEdit.Date);
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 3] := Grid_fioTableView.DataController.Values[0, 10];
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 4] := Grid_payersTableView.DataController.Values[0, 6]; //payer
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 5] := Grid_fioTableView.DataController.Values[0, 17];//man
       Grid_payTableView.DataController.Values[Grid_payTableView.DataController.RecordCount - 1, 6] :=
       {num_year}ExtractNumYear(Date_Beg_DateEdit.Date, Date_End_DateEdit.Date, '/');
      end;

     if Grid_payTableView.DataController.RecordCount>0 then  Grid_payTableView.DataController.FocusedRecordIndex:=0;

    end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Contracts_AE.TreeFullOpenBtn_payClick(Sender: TObject);
begin
  if Grid_payTableView.DataController.RecordCount = 0
   then exit;
  Grid_payTableView.ViewData.Expand(True);
end;

procedure Tfrm_Contracts_AE.TreeFullCloseBtn_payClick(Sender: TObject);
begin
  if Grid_payTableView.DataController.RecordCount = 0
   then exit;
  Grid_payTableView.ViewData.Collapse(True);
end;

procedure Tfrm_Contracts_AE.TreeBranchOpenBtn_payClick(Sender: TObject);
begin
  if Grid_payTableView.DataController.RecordCount = 0
   then exit;
  Grid_payTableView.Controller.FocusedRecord.Expand(true);
end;

procedure Tfrm_Contracts_AE.TreeBranchCloseBtn_payClick(Sender: TObject);
begin
  if Grid_payTableView.DataController.RecordCount = 0
   then exit;
  Grid_payTableView.Controller.FocusedRecord.Collapse(true);
end;

function Tfrm_Contracts_AE.Check_Grid_fioTableView_on_Errors : boolean;
var
  i, j: integer;
begin
  Check_Grid_fioTableView_on_Errors := false;
  if Grid_fioTableView.DataController.RecordCount = 0 then
   begin
    Check_Grid_fioTableView_on_Errors :=true;
    exit;
   end;

  for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
  for j:=0 to 19 do
   if ((j <> 18) and (j <> 19) and (j<>10)) then
    if Grid_fioTableView.DataController.Values[i,j] = null then
     begin
      Check_Grid_fioTableView_on_Errors := True;
      showmessage(cnConsts.cn_StudInfWarning[PLanguageIndex]);
      break;
     end;
end;

procedure Tfrm_Contracts_AE.Flash_Payers_ButtonClick(Sender: TObject);
begin
  if Grid_payersTableView.DataController.RecordCount <>0 then
   if ((Persent.Properties as TcxCurrencyEditProperties).DisplayFormat = '0.0000 %') then
    if  StrToFloat(Grid_payersTableView.DataController.Summary.FooterSummaryValues[0]) >= 100 then
     begin
       showmessage('Неможниво додати платника. Сума вітсотків по сплаті дорівнює 100%');
       Grid_payers.SetFocus;
       exit;
     end;

  DM := TDM_Contracts.Create(self);
  DM.DB.Handle := DB_Handle_ae;
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DEF_ID_TYPE_STAGE';
  DM.ReadDataSet.Open;
  if DM.ReadDataSet['CN_DEF_ID_TYPE_STAGE']<> null then
   begin
    Grid_payersTableView.DataController.RecordCount := Grid_payersTableView.DataController.RecordCount + 1;
    {id_payer}
    if Grid_fioTableView.DataController.Values[0,20] <> null then
     begin
      Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 0] := Grid_fioTableView.DataController.Values[0,21];
      Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 6] := Grid_fioTableView.DataController.Values[0,20]
     end
    else
     begin
      Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 0] := Grid_fioTableView.DataController.Values[0,0];
      Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 6] := Grid_fioTableView.DataController.Values[0,17];
     end;
    {id_type_stage}
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 4] := DM.ReadDataSet['CN_DEF_ID_TYPE_STAGE'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 1] := DM.ReadDataSet['NAME_STAGE'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 2] := 100;
    {id_rate_account}
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 7] := -1;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 3] := 1;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 5] := 1;

    // заголовок столбца грида меняю на значение по значению радиобатона на процент
    Persent.Caption:= cnConsts.cn_Persent_Column[PLanguageIndex];

    // меняю маску отображения на процентную
    (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
    Grid_payersTableView.DataController.Summary.FooterSummaryItems[0].Format:= '= 0.0000 %';
    DM.ReadDataSet.Close;
   end
  else DM.ReadDataSet.Close;

  DM.Free;

  Grid_payers.setfocus;
  Grid_payersTableView.DataController.FocusedRecordIndex:=Grid_payersTableView.DataController.RecordCount-1;
  BuildComboPayersFilter;
end;

procedure Tfrm_Contracts_AE.AddPopClick(Sender: TObject);
begin
  Add_fio_BarrButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.EditPopClick(Sender: TObject);
begin
  Edit_fio_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.DeletePopClick(Sender: TObject);
begin
  Delete_fio_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.AddPop2Click(Sender: TObject);
begin
  Add_payers_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.AddPop3Click(Sender: TObject);
begin
   Add_period_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.AddPop4Click(Sender: TObject);
begin
   Add_istochniki_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.EditPop2Click(Sender: TObject);
begin
   Edit_payers_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.EditPop3Click(Sender: TObject);
begin
   Edit_period_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.EditPop4Click(Sender: TObject);
begin
   Edit_istochniki_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.DeletePop2Click(Sender: TObject);
begin
   Delete_payers_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.DeletePop3Click(Sender: TObject);
begin
    Delete_period_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.DeletePop4Click(Sender: TObject);
begin
 Delete_istochniki_BarButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.Num_Dog_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if not Showing then exit;
// проверяю на наличие такого же номера в системе
DM := TDM_Contracts.Create(self);
DM.DB.Handle := DB_Handle_ae;
DM.ReadDataSet.Close;
DM.ReadDataSet.SelectSQL.Clear;
DM.ReadDataSet.SelectSQL.Text := 'select * from CN_CHECK_NUM_DOG(' + ''''+Num_Dog_Edit.Text+ ''''+')';
DM.ReadDataSet.Open;
if DM.ReadDataSet['IS_EXISTS'] = 1 then
 begin
   cn_Common_Messages.cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex], cnConsts_Messages.cn_CheckNumDogFalse[PLanguageIndex], mtError, [mbYes]);
   Num_Dog_Edit.SetFocus;
   DM.ReadDataSet.Close;
 end
 else
   DM.ReadDataSet.Close;
DM.Free;
end;

procedure Tfrm_Contracts_AE.NextCursButtonClick(Sender: TObject);
var
   sort, i: integer;
   MaxDateEnd : TDate;
   cnAcademicYear : TcnAcademicYear;
   StageOplGenInfo : array of TStageOplGenInfo;
   j, flag, w : integer;
   year, month, day :Word;
   AcademicYear_date_end: Tdate;
begin
  if Grid_fioTableView.DataController.RecordCount = 0 then exit;
  Screen.Cursor := crHourGlass;

  // определяю кол-во обучающихся по контракту
  // и формирую их реестр-массив
  SetLength(StageOplGenInfo, 1);
  StageOplGenInfo[0].ID_MAN:=  Grid_fioTableView.DataController.Values[0, 17];
  StageOplGenInfo[0].FIO:=     Grid_fioTableView.DataController.Values[0, 0];

  for i:=0 to Grid_fioTableView.DataController.RecordCount -1 do
  for j:=0 to Length(StageOplGenInfo)-1 do
   begin
    for w:=0 to Length(StageOplGenInfo)-1 do
     begin
      flag := 0;
      if Grid_fioTableView.DataController.Values[i, 17] = StageOplGenInfo[w].ID_MAN then flag:=1;
     end;
    if flag =1 then Continue;
    SetLength(StageOplGenInfo, Length(StageOplGenInfo)+1 );
    StageOplGenInfo[Length(StageOplGenInfo)-1].ID_MAN:= Grid_fioTableView.DataController.Values[i, 17];
    StageOplGenInfo[Length(StageOplGenInfo)-1].FIO:=    Grid_fioTableView.DataController.Values[i, 0];
   end;

  // цикл по фамилиям - смотрим совпадение и каждому фио набавляем макс курс +1 по одному разу
  for i:=0 to Length(StageOplGenInfo)-1 do
   begin
    MaxDateEnd := strtodate('01.01.1900');
    for j:=0 to Grid_fioTableView.DataController.RecordCount -1 do
     if StageOplGenInfo[i].ID_MAN = Grid_fioTableView.DataController.Values[j, 17]
      then
       if Grid_fioTableView.DataController.Values[j, 2] > MaxDateEnd
        then MaxDateEnd     := Grid_fioTableView.DataController.Values[j, 2];

    cnAcademicYear := AcademicYear(MaxDateEnd + 1);
    Grid_fioTableView.DataController.RecordCount := Grid_fioTableView.DataController.RecordCount + 1;
    For sort:=Grid_fioTableView.DataController.RecordCount-1 downto 1 do
     Begin
      Grid_fioTableView.DataController.Values[sort, 0]  := Grid_fioTableView.DataController.Values[sort-1, 0];
      Grid_fioTableView.DataController.Values[sort, 1]  := Grid_fioTableView.DataController.Values[sort-1, 1];
      Grid_fioTableView.DataController.Values[sort, 2]  := Grid_fioTableView.DataController.Values[sort-1, 2];
      Grid_fioTableView.DataController.Values[sort, 3]  := Grid_fioTableView.DataController.Values[sort-1, 3];
      Grid_fioTableView.DataController.Values[sort, 4]  := Grid_fioTableView.DataController.Values[sort-1, 4];
      Grid_fioTableView.DataController.Values[sort, 5]  := Grid_fioTableView.DataController.Values[sort-1, 5];
      Grid_fioTableView.DataController.Values[sort, 6]  := Grid_fioTableView.DataController.Values[sort-1, 6];
      Grid_fioTableView.DataController.Values[sort, 7]  := Grid_fioTableView.DataController.Values[sort-1, 7];
      Grid_fioTableView.DataController.Values[sort, 8]  := Grid_fioTableView.DataController.Values[sort-1, 8];
      Grid_fioTableView.DataController.Values[sort, 9]  := Grid_fioTableView.DataController.Values[sort-1, 9];
      Grid_fioTableView.DataController.Values[sort, 10] := Grid_fioTableView.DataController.Values[sort-1, 10];
      Grid_fioTableView.DataController.Values[sort, 11] := Grid_fioTableView.DataController.Values[sort-1, 11];
      Grid_fioTableView.DataController.Values[sort, 12] := Grid_fioTableView.DataController.Values[sort-1, 12];
      Grid_fioTableView.DataController.Values[sort, 13] := Grid_fioTableView.DataController.Values[sort-1, 13];
      Grid_fioTableView.DataController.Values[sort, 14] := Grid_fioTableView.DataController.Values[sort-1, 14];
      Grid_fioTableView.DataController.Values[sort, 15] := Grid_fioTableView.DataController.Values[sort-1, 15];
      Grid_fioTableView.DataController.Values[sort, 16] := Grid_fioTableView.DataController.Values[sort-1, 16];
      Grid_fioTableView.DataController.Values[sort, 17] := Grid_fioTableView.DataController.Values[sort-1, 17];
     End;


                     Grid_fioTableView.DataController.Values[0, 0]  := Grid_fioTableView.DataController.Values[1, 0];
{ид_ман}             Grid_fioTableView.DataController.Values[0, 17] := Grid_fioTableView.DataController.Values[1, 17];
{дата_начала}        Grid_fioTableView.DataController.Values[0, 1] :=  cnAcademicYear.Date_Beg;
                     DecodeDate(cnAcademicYear.Date_Beg,year,month,day);
                     AcademicYear_date_end:= EncodeDate(year+1,08,31);
                     if AcademicYear_date_end>Date_End_DateEdit.Date then AcademicYear_date_end:=Date_End_DateEdit.date;
{дата_конца}         Grid_fioTableView.DataController.Values[0, 2] :=  AcademicYear_date_end;
{факультет}          Grid_fioTableView.DataController.Values[0, 3] :=  Grid_fioTableView.DataController.Values[1, 3];
{специальность}      Grid_fioTableView.DataController.Values[0, 4] :=  Grid_fioTableView.DataController.Values[1, 4];
{группа}             Grid_fioTableView.DataController.Values[0, 5] :=  Grid_fioTableView.DataController.Values[1, 5];
{форма_обучения}     Grid_fioTableView.DataController.Values[0, 6] :=  Grid_fioTableView.DataController.Values[1, 6];
{категория_обучения} Grid_fioTableView.DataController.Values[0, 7] :=  Grid_fioTableView.DataController.Values[1, 7];
{национальность}     Grid_fioTableView.DataController.Values[0, 8] :=  Grid_fioTableView.DataController.Values[1, 8];
{курс}               Grid_fioTableView.DataController.Values[0, 9] :=  Grid_fioTableView.DataController.Values[1, 9] + 1;
{сумма}              Grid_fioTableView.DataController.Values[0, 10] := Grid_fioTableView.DataController.Values[1, 10];

{ид_факультета}      Grid_fioTableView.DataController.Values[0, 11] := Grid_fioTableView.DataController.Values[1, 11];
{ид_спец}            Grid_fioTableView.DataController.Values[0, 12] := Grid_fioTableView.DataController.Values[1, 12];
{ид_группы}          Grid_fioTableView.DataController.Values[0, 13] := Grid_fioTableView.DataController.Values[1, 13];
{ид_формыобуч}       Grid_fioTableView.DataController.Values[0, 14] := Grid_fioTableView.DataController.Values[1, 14];
{ид_категоробуч}     Grid_fioTableView.DataController.Values[0, 15] := Grid_fioTableView.DataController.Values[1, 15];
{ид_национал}        Grid_fioTableView.DataController.Values[0, 16] := Grid_fioTableView.DataController.Values[1, 16];
   end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_Contracts_AE.DeleteAllStudButtonClick(Sender: TObject);
begin
Grid_fio.SetFocus;
if not DeleteAllTableRecords(Grid_fioTableView) then exit;
end;

procedure Tfrm_Contracts_AE.DeleteAllPayersButtonClick(Sender: TObject);
begin
Grid_payers.SetFocus;
if not DeleteAllTableRecords(Grid_payersTableView) then exit;
  BuildComboPayersFilter;
end;

procedure Tfrm_Contracts_AE.DeleteAllPeriodsButtonClick(Sender: TObject);
begin
Grid_pay.SetFocus;
if not DeleteAllTableRecords(Grid_payTableView) then exit;
end;

procedure Tfrm_Contracts_AE.DeleteAllIstochnikiButtonClick(
  Sender: TObject);
begin
Grid_istochniki.SetFocus;
if not DeleteAllTableRecords(Grid_istochnikiTableView) then exit;
end;

function Tfrm_Contracts_AE.DeleteAllTableRecords(Sender: TcxGridTableView): boolean;
 var i: integer;
begin
DeleteAllTableRecords:= false;
if Sender.DataController.RecordCount = 0 then exit;
  i:= cnShowMessage(cn_Confirmation_Caption[PLanguageIndex], cn_DelAll_Promt[PLanguageIndex], mtWarning, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then
  exit;
 // чистка всех записей таблицы 
 for i:= Sender.DataController.RecordCount -1 downto 0 do
 Sender.DataController.DeleteRecord(i);
 DeleteAllTableRecords:= true;
end;


procedure Tfrm_Contracts_AE.Flash_Istoch_BarButtonClick(Sender: TObject);
var kav: string;
     i: integer;
  Dm_i: TDM_Contracts;
begin
  kav := '''';
   // чистка всех записей таблицы периодов оплат
   for i:= Grid_istochnikiTableView.DataController.RecordCount -1 downto 0 do
   Grid_istochnikiTableView.DataController.DeleteRecord(i);

// источники по-умолчанию
DM_i := TDM_Contracts.Create(self);
DM_i.DB.Handle := DB_Handle_ae;
 DM_i.ReadDataSet.Close;
 DM_i.ReadDataSet.SelectSQL.Clear;
 DM_i.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DAEFAULT_ISTOCHNIKI';
 DM_i.ReadDataSet.Open;
   Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;

 if DM_i.ReadDataSet['KOD_SMETA']  <> null then
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0]:=  inttostr(DM_i.ReadDataSet['KOD_SMETA']);
 if DM_i.ReadDataSet['KOD_RAZDEL'] <> null
  then  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1]:= inttostr(DM_i.ReadDataSet['KOD_RAZDEL']);
 if DM_i.ReadDataSet['KOD_STAT']   <> null
  then  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2]:=   inttostr(DM_i.ReadDataSet['KOD_STAT']);
 if DM_i.ReadDataSet['KOD_KEKV']   <> null
  then  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3]:=   inttostr(DM_i.ReadDataSet['KOD_KEKV']);
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := 100;
 DM_i.ReadDataSet.Close;


 DM_i.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+vartostr(Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0]) +','+kav+ datetostr(now)+kav+',' +'1)';
 DM_i.ReadDataSet.Open;
 if DM_i.ReadDataSet['ID_OBJECT']<>null then
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := DM_i.ReadDataSet['ID_OBJECT']
 else
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := 0;
 DM_i.ReadDataSet.Close;

 DM_i.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+vartostr(Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1])+','+kav+datetostr(now)+kav+',' +'2)';
 DM_i.ReadDataSet.Open;
 if DM_i.ReadDataSet['ID_OBJECT']<>null then
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := DM_i.ReadDataSet['ID_OBJECT']
 else
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := 0;
 DM_i.ReadDataSet.Close;

 DM_i.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+vartostr(Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2])+','+kav+datetostr(now)+kav+',' +'3)';
 DM_i.ReadDataSet.Open;
 if DM_i.ReadDataSet['ID_OBJECT']<>null then
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := DM_i.ReadDataSet['ID_OBJECT']
 else
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := 0;
 DM_i.ReadDataSet.Close;

 DM_i.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+vartostr(Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3])+','+kav+datetostr(now)+kav+')';
 DM_i.ReadDataSet.Open;
 if DM_i.ReadDataSet['ID_KEKV']<>null then
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := DM_i.ReadDataSet['ID_KEKV']
 else
  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := 0;
 DM_i.ReadDataSet.Close;

 Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount-1, 9] :=
 Grid_fioTableView.DataController.Values[0, 17];

     Grid_istochniki.setfocus;
     Grid_istochnikiTableView.DataController.FocusedRecordIndex:=Grid_istochnikiTableView.DataController.RecordCount-1;
     DM_i.Free;

end;

procedure Tfrm_Contracts_AE.TypeDogEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle_ae;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  if ID_TYPE_DOG <> -1 then
  AParameter.ID_Locate := ID_TYPE_DOG;
  
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDog.bpl','ShowSPTypeDog');
  AParameter.Free;
    if VarArrayDimCount(res)>0 then
   begin
    ID_TYPE_DOG := res[0];
    TypeDogEdit.Text  := vartostr(res[1]);
    if res[3] = 1 then Base_Dog_RadioButton.Checked := True;
    if res[3] = 0 then Addit_Dog_RadioButton.Checked := True;
    //NameTypeDogLabel.Caption:= vartostr(res[2]);
   end;
 end;

procedure Tfrm_Contracts_AE.TypeDogEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Accounts.SetFocus;
end;

procedure Tfrm_Contracts_AE.TypeDogEditExit(Sender: TObject);
begin
if TypeDogEdit.Text <> '' then
 begin
   DM := TDM_Contracts.Create(self);
   DM.DB.Handle := DB_Handle_ae;
   DM.ReadDataSet.Close;
   DM.ReadDataSet.SelectSQL.Clear;
   DM.ReadDataSet.SelectSQL.Text := 'select first(1) * from CN_INI_TYPE_DOG_SELECT where CODENAME='+ ''''+TypeDogEdit.Text + '''';
   DM.ReadDataSet.Open;
   if DM.ReadDataSet.RecordCount > 0 then
   begin
    ID_TYPE_DOG:= DM.ReadDataSet['ID_TYPE_DOG'];
    if DM.ReadDataSet['ISMAINDOG'] = 1 then Base_Dog_RadioButton.Checked := True;
    if DM.ReadDataSet['ISMAINDOG'] = 0 then Addit_Dog_RadioButton.Checked := True;
    //NameTypeDogLabel.Caption:= DM.ReadDataSet['NAME'];
   end
   else
    begin
     showmessage('Номер типу не знайдено!');
     TypeDogEdit.Text := '';
     //NameTypeDogLabel.Caption:= '';
    end;

   DM.ReadDataSet.Close;
   DM.Free;
 end;
end;

procedure Tfrm_Contracts_AE.SetFilterPayers(Value: string);
begin
  try
  Screen.Cursor := crHourGlass;
    with Grid_payTableView.DataController.Filter.Root do
    begin
      Clear;
       if Value <> 'not' then
       AddItem(id_payer_stage_opl, foEqual, Value, Value);
    end;
    if Value <> 'not' then
    Grid_payTableView.DataController.Filter.Active := True
    else
    Grid_payTableView.DataController.Filter.Active := False;

  finally
   Screen.Cursor := crDefault;
   if (( Grid_payersTableView.DataController.RecordCount >0) and (Grid_payTableView.DataController.RecordCount >0))
    then
    Grid_payTableView.DataController.FocusedRecordIndex:=0;
  end;

end;

procedure Tfrm_Contracts_AE.BuildComboPayersFilter();
   var i: Integer;
begin
  with ComboPayersFilter do
  begin
   Clear;
   Properties.Items.Clear;
   Properties.Items.Add('НЕ ФІЛЬТРУВАТИ');
   for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do Properties.Items.Add(vartostr(Grid_payersTableView.DataController.Values[i, 0]));

   ItemIndex :=0;
  end;
end;

function Tfrm_Contracts_AE.GetIDPayer (AValue: string) : string;
  var i: integer;
  ID : string;
begin
    Id := 'not';
   for i:=0 to Grid_payersTableView.DataController.RecordCount -1 do
     if vartostr(Grid_payersTableView.DataController.Values[i, 0]) = AValue then
      begin
        ID := Grid_payersTableView.DataController.Values[i, 6];
        Break;
      end;
  Result:= ID;
end;

procedure Tfrm_Contracts_AE.ComboPayersFilterPropertiesChange(
  Sender: TObject);
  begin
    SetFilterPayers(GetIDPayer (ComboPayersFilter.Text));
  end;

procedure Tfrm_Contracts_AE.btnKillAllClick(Sender: TObject);
begin
DeleteAllPeriodsButtonClick(Sender);
end;

procedure Tfrm_Contracts_AE.btnKillOnlyOneClick(Sender: TObject);
var ID : string;
i: Integer;
begin
 if not Grid_payTableView.DataController.Filter.Active then Exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Execute[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

 Id:= GetIDPayer(ComboPayersFilter.Text);
   for i:=Grid_payTableView.DataController.RecordCount -1 downto 0 do
   begin
     if Grid_payTableView.DataController.Values[i, 4] = Id then
     Grid_payTableView.DataController.DeleteRecord(i);
   end;

end;

procedure Tfrm_Contracts_AE.OsvitPoslEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Grid_fio.SetFocus;
end;

procedure Tfrm_Contracts_AE.OsvitPoslEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
Var
  T:TfrmGetParamValueforstud;
begin
  T:=TfrmGetParamValueforstud.create(self,db_Handle_ae);
  T.ShowModal;
  if T.ModalResult=mrOk then
   Begin
    ID_TYPE_ACTION:=T.ResultId;
    OsvitPoslEdit.Text:=T.ResultText;
   End;
  T.Free;
end;

procedure Tfrm_Contracts_AE.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id_valut : Variant;
begin
  id_valut := GlobalSpr.GetValute(Self, db_Handle_ae, fsNormal, 0, -1);
end;

procedure Tfrm_Contracts_AE.ButtonEdit_valutePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
{var
  ViewForm : Tfrmselect_valute;
begin
  ViewForm := Tfrmselect_valute.create(Self, db_Handle_ae);
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   begin
    ID_VALUTE := ViewForm.id_valute;
    ButtonEdit_valute.Text := ViewForm.code_valute;
   end;
  ViewForm.Free;}
var
  Id_Val : Variant;
begin
  Id_Val := GlobalSpr.GetValute(Self, DB_Handle_ae, fsNormal, 0, -1);

  If VarArrayDimCount(id_val) > 0 then
   begin
    Id_Valute:= id_val[0];
    ButtonEdit_valute.Text := Id_Val[1];
   end;
end;

procedure Tfrm_Contracts_AE.dxBarButton1Click(Sender: TObject);
begin
  CN_USE_EDBO_FIZ_LIC := 1;
  Add_fio_BarrButtonClick(self);
end;

procedure Tfrm_Contracts_AE.dxBarButton2Click(Sender: TObject);
begin
  CN_USE_EDBO_FIZ_LIC := 0;
  Add_fio_BarrButtonClick(self);
end;

end.
