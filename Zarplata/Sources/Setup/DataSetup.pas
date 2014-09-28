unit DataSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridCardView, cxGridLevel,
  cxGrid, cxDBData, cxGridDBCardView, IBase, Ztypes, ZProc, cxBlobEdit,
  cxButtonEdit, cxContainer, cxTextEdit, cxMaskEdit, cxGroupBox, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCheckListBox, Unit_ZGlobal_Consts, ComCtrls, ActnList, ZMessages,
  PackageLoad, cxDropDownEdit, cxSpinEdit, dates, Up_Sys_Level,
  GlobalSpr, Unit_NumericConsts, Z_StProc_DM, cxCheckBox, PropFaculty,
  cxCalc;

type TzCurrentId = record
  Id_BudgetGrant:integer;
  Id_Current:integer;
  Id_Dopnach:integer;
  Id_Dedconst:integer;
  Id_Nonspisok:integer;
  Id_OrderLevel:integer;      
  Id_PropFaculty:integer;
end;

type
  TFZSetup = class(TForm)
    DataSource: TDataSource;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    PanelControlButtonGroup: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    Pages: TPageControl;
    PageNameFirm: TTabSheet;
    LabelShortName: TcxLabel;
    MaskEditShortName: TcxMaskEdit;
    LabelOkpo: TcxLabel;
    MaskEditOkpo: TcxMaskEdit;
    MaskEditFullName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    LabelCommonTel: TcxLabel;
    MaskEditCommonTel: TcxMaskEdit;
    PagePosadoviOsobu: TTabSheet;
    LabelDirector: TcxLabel;
    LabelDirectorTin: TcxLabel;
    MaskEditDirectorTel: TcxMaskEdit;
    LabelDirectorTel: TcxLabel;
    LabelDirectorPost: TcxLabel;
    MaskEditNameManeg: TcxMaskEdit;
    ButtonEditDirectorTin: TcxButtonEdit;
    Other: TTabSheet;
    System: TTabSheet;
    LabelZSystem: TcxLabel;
    MaskEditZSystem: TcxMaskEdit;
    LabelGrSystem: TcxLabel;
    MaskEditGrSystem: TcxMaskEdit;
    LabelCurrentKod: TcxLabel;
    SpinEditYear: TcxSpinEdit;
    ComboBoxMonth: TcxComboBox;
    LabelDateBeg: TcxLabel;
    DateBeg: TcxLabel;
    EditDirector: TcxLabel;
    CheckBoxRmoving: TcxCheckBox;
    CheckBoxVirtual: TcxCheckBox;
    CheckBoxIsFss: TcxCheckBox;
    LabelOrderLevel: TcxLabel;
    ButtonEditOrderLevel: TcxButtonEdit;
    LabelTown: TLabel;
    MaskEditTown: TcxMaskEdit;
    MaskEditAddress: TcxMaskEdit;
    LabelAddress: TcxLabel;
    LabelGlBuhgTin: TcxLabel;
    ButtonEditGlBuhgTin: TcxButtonEdit;
    MaskEditGlBuhgTel: TcxMaskEdit;
    LabelGlBuhgTel: TcxLabel;
    LabelglBuhg: TcxLabel;
    LabelGlavBuhgPost: TcxLabel;
    EditGlBuhg: TcxLabel;
    MaskEditGlavBuhgPost: TcxMaskEdit;
    LabelNachOk: TcxLabel;
    ButtonEditNachOk: TcxButtonEdit;
    PageFond: TTabSheet;
    MaskEditRegKodStraxNetrud: TcxMaskEdit;
    LabelDPI: TcxLabel;
    MaskEditDPI: TcxMaskEdit;
    MaskEditKodDPI: TcxMaskEdit;
    LabelKodDPI: TcxLabel;
    LabelCurrent: TcxLabel;
    LabelDedconst: TcxLabel;
    LabelDopnach: TcxLabel;
    LabelNonspisok: TcxLabel;
    ButtonEditCurrent: TcxButtonEdit;
    ButtonEditDedconst: TcxButtonEdit;
    ButtonEditDopnach: TcxButtonEdit;
    ButtonEditNonspisok: TcxButtonEdit;
    LabelForwHol: TcxLabel;
    MaskEditForwHol: TcxMaskEdit;
    LabelKodSetup: TcxLabel;
    ComboBoxGrantMonth: TcxComboBox;
    LabelIndexKodSetup: TcxLabel;
    ComboBoxIndexMonth: TcxComboBox;
    SpinEditGrantYear: TcxSpinEdit;
    SpinEditIndexYear: TcxSpinEdit;
    LabelDefaultSmeta: TcxLabel;
    ButtonEditDefaultSmeta: TcxButtonEdit;
    EditDefaultSmeta: TcxLabel;
    LabelPropFaculty: TcxLabel;
    ButtonEditPropFaculty: TcxButtonEdit;
    LabelBudgetGrant: TcxLabel;
    ButtonEditBudgetGrant: TcxButtonEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Panel7: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    MaskEditRahunokNetrud: TcxMaskEdit;
    MaskEditBankNetrud: TcxMaskEdit;
    MaskEditRegKodStraxNSluch: TcxMaskEdit;
    MaskEditRahunokNSluch: TcxMaskEdit;
    Label_Director: TcxLabel;
    Label_Buh: TcxLabel;
    Label_Nach_OK: TcxLabel;
    LabelRegKodStrax: TcxLabel;
    LabelNameFondNepacezd: TcxLabel;
    LabelName: TcxLabel;
    LabelNameDirectorFondNepracezd: TcxLabel;
    LabelRahunokNepracezd: TcxLabel;
    LabelRegKod: TcxLabel;
    LabelBankNepracezd: TcxLabel;
    LabelMFO_Nepracezd: TcxLabel;
    LabelNameFondNSluch: TcxLabel;
    MaskEditMFONetrud: TcxMaskEdit;
    LabelRahunokNSluch: TcxLabel;
    LabelBankNSluch: TcxLabel;
    LabelMFO_NSluch: TcxLabel;
    MaskEditMFONSluch: TcxMaskEdit;
    MaskEditBankNSluch: TcxMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    LabelNameDPI: TcxLabel;
    LabelMaska: TcxLabel;
    MaskEditMaska: TcxMaskEdit;
    Panel9: TPanel;
    LabelNameFond: TcxLabel;
    MaskEditNameFondNSluch: TcxMaskEdit;
    MaskEditNameFondNetrud: TcxMaskEdit;
    MaskEditFIODirector: TcxMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ButtonEditDirectorTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditGlBuhgTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonEditOrderLevelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditBudgetGrantPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditDefaultSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditNachOkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditCurrentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditDopnachPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditDedconstPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditNonspisokPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditDefaultSmeta_Exit(Sender: TObject);
    procedure ButtonEditPropFacultyPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Id:TzCurrentId;
    PLanguageIndex:byte;
    //flag:Boolean;
  public
    constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZ_Setup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
 exports View_FZ_Setup;

implementation

uses StrUtils;

{$R *.dfm}
const
  Grant_Caption                     :array[1..2] of string = ('Стипендія','Стипендия');
  LabelKodSetup_Caption             :array[1..2] of string = ('Період стипендії','Период стипендии');
  LabelDefaultSmeta_Caption         :array[1..2] of string = ('Кошторис за умовчанням','Смета по умолчанию');
  LabelBudgetGrant_Caption          :array[1..2] of string = ('Властивість бюджетної стипендії','Свойство бюджетной стипендии');
  LabelPropFaculty_Caption          :array[1..2] of string = ('Факультети для стипендії','Факультеты для стипендии');
  VidOpl_Caption                    :array[1..2] of string = ('Види операцій','Виды операций');
  Other_Caption                     :array[1..2] of string = ('Інше','Другое');
  LabelCurrentKod_Caption           :array[1..2] of string = ('Поточний період','Текущий период');
  LabelDateBeg_Caption              :array[1..2] of string = ('Старт системи','Старт системы');
  LabelNachOk_Caption               :array[1..2] of string = ('Начальник відділа кадрів','Начальник отдела кадров');
  LabelDPI_Caption                  :array[1..2] of string = ('ДПІ','ДПИ');
  LabelKodDPI_Caption               :array[1..2] of string = ('Код ДПІ','Код ДПИ');
  LabelForwHol_Caption              :array[1..2] of string = ('Кіл-ть днів відпустки','Количество дней отпуска');
  LabelOrderLevel_Caption           :array[1..2] of string = ('Рівень','Уровень');
  System_Caption                    :array[1..2] of string = ('Система','Система');
  LabelZSystem_Caption              :array[1..2] of string = ('ІД системи','ИД система');
  LabelGrSystem_Caption             :array[1..2] of string = ('ІД стипендії','ИД стипендии');
  LabelRmoving_Caption              :array[1..2] of string = ('Виняткові періоди','Исключительные периоды');
  LabelIsFss_Caption                :array[1..2] of string = ('Утримувати податок соц. захисту','Удеривать налог социальной защиты');
  Labelvirtual_Caption              :array[1..2] of string = ('Віртуальний табель','Виртуальный табель');
  LabelPosadoviOsobu_Caption        :array[1..2] of string = ('Посадові особи', 'Должностные лица');
  LabelBuh_Caption                  :array[1..2] of string = ('Головний бухгалтер', 'Главный бухгалтер');
  Label_Nach_OK_Caption             :array[1..2] of string = ('Начальник відділа кадрів', 'Начальник отдела кадров');

  PageFond_Caption                       :array[1..2] of string = ('Фонди', 'Фонды');
  LabelNameFondNepacezd_Caption          :array[1..2] of string = ('Фонд соціального страхування з тимчасової непрацездатності ', 'Фонд социального страхования по временной нетрудоспособности');
  LabelName_Caption                      :array[1..2] of string = ('найменування', 'наименование');
  LabelNameDirectorFondNepracezd_Caption :array[1..2] of string = ('П.І.Б. директора фонду', 'ФИО директора фонда');
  LabelRegKodStrax_Caption               :array[1..2] of string = ('№ реєстрації страхувальника', '№ регистрации страхователя');
  LabelBank_Caption                      :array[1..2] of string = ('у банку', 'в банке');
  LabelNameFondNSluch_Caption            :array[1..2] of string = ('Фонд соціального страхування від нещасних випадків на виробництві', 'Фонд социального страхования от несчастных случаев на производстве');
  LabelRahunokNepracezd_Caption          :array[1..2] of string = ('поточний рахунок', 'текущий счет');
  LabelMaska_Caption                     :array[1..2] of string = ('маска для форми 1ДФ', 'маска для форми 1ДФ');
  LabelNameDPI_Caption                   :array[1..2] of string = ('Державна податкова інспекція', 'Государственная налоговая инспекция');

  function View_FZ_Setup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZSetup;
begin
  ViewForm:=TFZSetup.Create(AOwner, DB);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

constructor TFZSetup.Create(AOwner:TComponent;DB:TISC_DB_HANDLE);
var KodSetup,KodSetupIndex: integer;
begin
 inherited Create(AOwner);
 PLanguageIndex := LanguageIndex;
//******************************************************************************
 ComboBoxGrantMonth.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 ComboBoxMonth.Properties.Items.Text      := MonthesList_Text[PLanguageIndex];
 ComboBoxIndexMonth.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
//******************************************************************************
 Caption                   := ZSetup_Caption[PLanguageIndex];
 LabelShortName.Caption    := LabelNameShort_Caption[PLanguageIndex];
 LabelFullName.Caption     := LabelNameFull_Caption[PLanguageIndex];
 LabelOkpo.Caption         := LabelOkpo_Caption[PLanguageIndex];
 LabelTown.Caption         := LabelCity_Caption[PLanguageIndex];
 LabelAddress.Caption      := LabelAdress_Caption[PLanguageIndex];

 PagePosadoviOsobu.Caption := LabelPosadoviOsobu_Caption[PLanguageIndex];
 LabelDirector.Caption     := LabelFIO_Caption[PLanguageIndex];
 LabelDirectorTin.Caption  := LabelTin_Caption[PLanguageIndex];
 LabelDirectorTel.Caption  := LabelTel_Caption[PLanguageIndex];
 LabelDirectorPost.Caption := LabelPost_Caption[PLanguageIndex];
 LabelglBuhg.Caption       := LabelFIO_Caption[PLanguageIndex];
 LabelGlBuhgTin.Caption    := LabelTin_Caption[PLanguageIndex];
 LabelGlBuhgTel.Caption    := LabelTel_Caption[PLanguageIndex];
 Label_Buh.Caption         := LabelBuh_Caption[PLanguageIndex];
 Label_Nach_OK.Caption     := Label_Nach_OK_Caption[PLanguageIndex];
 LabelGlavBuhgPost.Caption := LabelPost_Caption[PLanguageIndex];
 LabelCommonTel.Caption    := LabelTel_Caption[PLanguageIndex];

 PageNameFirm.Caption       := LabelFirm_Caption[PLanguageIndex];
 LabelKodSetup.Caption      := LabelKodSetup_Caption[PLanguageIndex];
 LabelIndexKodSetup.Caption := GetConst('KodSetupIndex ','Label');
 LabelDefaultSmeta.Caption  := LabelDefaultSmeta_Caption[PLanguageIndex];
 LabelBudgetGrant.Caption   := LabelBudgetGrant_Caption[PLanguageIndex];
 LabelPropFaculty.Caption   := LabelPropFaculty_Caption[PLanguageIndex];
 LabelCurrent.Caption       := ZCurrent_Caption[PLanguageIndex];
 LabelDopnach.Caption       := ZDopNach_Caption[PLanguageIndex];
 LabelDedconst.Caption      := ZDedConst_Caption[PLanguageIndex];
 LabelNonspisok.Caption     := ZNonSpisok_Caption[PLanguageIndex];
 LabelCurrentKod.Caption    := LabelCurrentKod_Caption[PLanguageIndex];
 LabelDateBeg.Caption       := LabelDateBeg_Caption[PLanguageIndex];
 LabelNachOk.Caption        := LabelFIO_Caption[PLanguageIndex];
 LabelForwHol.Caption       := LabelForwHol_Caption[PLanguageIndex];

 LabelDPI.Caption         := LabelDPI_Caption[PLanguageIndex];
 LabelKodDPI.Caption      := LabelKodDPI_Caption[PLanguageIndex];
 LabelOrderLevel.Caption  := LabelOrderLevel_Caption[PLanguageIndex];

 System.Caption                     := System_Caption[PLanguageIndex];
 LabelZSystem.Caption               := LabelZSystem_Caption[PLanguageIndex];
 LabelGrSystem.Caption              := LabelGrSystem_Caption[PLanguageIndex];
 CheckBoxRmoving.Properties.Caption := LabelRmoving_Caption[PLanguageIndex];
 CheckBoxIsFss.Properties.Caption   := LabelIsFss_Caption[PLanguageIndex];
 CheckBoxVirtual.Properties.Caption := LabelVirtual_Caption[PLanguageIndex];

 PageFond.Caption                       := PageFond_Caption[PLanguageIndex];
 LabelNameFondNepacezd.Caption          := LabelNameFondNepacezd_Caption[PLanguageIndex];
 LabelName.Caption                      := LabelName_Caption[PLanguageIndex];
 LabelNameFond.Caption                  := LabelName_Caption[PLanguageIndex];
 LabelRegKodStrax.Caption               := LabelRegKodStrax_Caption[PLanguageIndex];
 LabelNameDirectorFondNepracezd.Caption := LabelNameDirectorFondNepracezd_Caption[PLanguageIndex];
 LabelBankNepracezd.Caption             := LabelBank_Caption[PLanguageIndex];
 LabelNameFondNSluch.Caption            := LabelNameFondNSluch_Caption[PLanguageIndex];
 LabelRegKod.Caption                    := LabelRegKodStrax_Caption[PLanguageIndex];
 LabelRahunokNepracezd.Caption          := LabelRahunokNepracezd_Caption[PLanguageIndex];
 LabelRahunokNSluch.Caption             := LabelRahunokNepracezd_Caption[PLanguageIndex];
 LabelBankNSluch.Caption                := LabelBank_Caption[PLanguageIndex];
 LabelMaska.Caption                     := LabelMaska_Caption[PLanguageIndex];
 LabelNameDPI.Caption                   := LabelNameDPI_Caption[PLanguageIndex];

 YesBtn.Caption           := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption        := CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint              := YesBtn.Caption;
 CancelBtn.Hint           := CancelBtn.Caption;
//******************************************************************************
 DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SETUP_S';
 Database.Handle := DB;
 DataSet.Open;
//******************************************************************************
 MaskEditShortName.Text      := VarToStrDef(DataSet['SHORT_NAME'],'');
 MaskEditFullName.Text       := VarToStrDef(DataSet['FIRM_NAME_FULL'],'');
 MaskEditOkpo.Text           := VarToStrDef(DataSet['OKPO'],'');
 MaskEditCommonTel.Text      := VarToStrDef(DataSet['TELEFON'],'');
//******************************************************************************
 MaskEditTown.Text           := VarToStrDef(DataSet['TOWN'],'');
 MaskEditAddress.Text        := VarToStrDef(DataSet['ADDRESS'],'');
//******************************************************************************
 EditDirector.Caption        := VarToStrDef(DataSet['DIRECTOR'],'');
 ButtonEditDirectorTin.Text  := VarToStrDef(DataSet['TIN_DIRECTOR'],'');
 MaskEditDirectorTel.Text    := VarToStrDef(DataSet['TEL_DIRECTOR'],'');
 MaskEditNameManeg.Text      := VarToStrDef(DataSet['NAME_MANEG'],'');
//******************************************************************************
 EditGlBuhg.Caption          := VarToStrDef(DataSet['GLAV_BUHG'],'');
 MaskEditGlavBuhgPost.Text   := VarToStrDef(DataSet['GLBUHG_POST'],'');
 ButtonEditGlBuhgTin.Text    := VarToStrDef(DataSet['TIN_GLBUHG'],'');
 MaskEditGlBuhgTel.Text      := VarToStrDef(DataSet['TEL_GLBUHG'],'');
//******************************************************************************
 if DataSet['GR_KOD_SETUP']<>null then
      KodSetup                    := DataSet['GR_KOD_SETUP']
 else KodSetup                    := 1;
 if DataSet['GR_KOD_INDEX_START']<>null then
      KodSetupIndex               := DataSet['GR_KOD_INDEX_START']
 else KodSetupIndex               := 1;
 ComboBoxGrantMonth.ItemIndex:= YearMonthFromKodSetup(KodSetup,False)-1;
 SpinEditGrantYear.Value     := YearMonthFromKodSetup(KodSetup);
 ComboBoxIndexMonth.ItemIndex:= YearMonthFromKodSetup(KodSetupIndex,False)-1;
 SpinEditIndexYear.Value     := YearMonthFromKodSetup(KodSetupIndex);
 if KodSetup<>0 then
 begin
   ComboBoxGrantMonth.Properties.ReadOnly:=true;
   SpinEditGrantYear.Properties.ReadOnly:=true;
 end;
 if KodSetupIndex<>0 then
 begin
   ComboBoxIndexMonth.Properties.ReadOnly:=true;
   SpinEditIndexYear.Properties.ReadOnly:=true;
 end;
 ButtonEditDefaultSmeta.Text := VarToStrDef(DataSet['GR_DEFAULT_SMETA'],'');
 if DataSet['ID_P_BUDGET_GRANT']<>null then
 begin
   Id.Id_BudgetGrant           := DataSet['ID_P_BUDGET_GRANT'];
   ButtonEditBudgetGrant.Text  := IntToStr(Id.Id_BudgetGrant)+' - '+VarToStrDef(DataSet['NAME_P_BUDGET_GRANT'],'');
 end
 else ButtonEditBudgetGrant.Text  := '';
 if(DataSet['ID_PROP_FACULTY']<>null)then
 begin
   Id.Id_PropFaculty           := DataSet['ID_PROP_FACULTY'];
   ButtonEditPropFaculty.Text  := IntToStr(Id.Id_PropFaculty)+' - '+VarToStrDef(DataSet['NAME_PROPERTY'],'');
 end
 else ButtonEditPropFaculty.Text  := '';
//******************************************************************************
 if DataSet['ID_VO_PROP_CURRENT']<>null then
 begin
   Id.Id_Current               := DataSet['ID_VO_PROP_CURRENT'];
   ButtonEditCurrent.Text      := IntToStr(Id.Id_Current)+' - '+VarToStrDef(DataSet['NAME_VO_PROP_CURRENT'],'');
 end
 else ButtonEditCurrent.Text      := '';
 if DataSet['ID_VO_PROP_DOPNACH']<>null then
 begin
   Id.Id_Dopnach               := DataSet['ID_VO_PROP_DOPNACH'];
   ButtonEditDopnach.Text      := IntToStr(Id.Id_Dopnach)+' - '+VarToStrDef(DataSet['NAME_VO_PROP_DOPNACH'],'');
 end
 else ButtonEditDopnach.Text      := '';
 if DataSet['ID_VO_PROP_DEDCONST']<>null then
 begin
   Id.Id_Dedconst              := DataSet['ID_VO_PROP_DEDCONST'];
   ButtonEditDedconst.Text     := IntToStr(Id.Id_Dedconst)+' - '+VarToStrDef(DataSet['NAME_VO_PROP_DEDCONST'],'');
 end
 else ButtonEditDedconst.Text     := '';
 if DataSet['ID_VO_PROP_NONSPISOK']<>null then
 begin
   Id.Id_Nonspisok             := DataSet['ID_VO_PROP_NONSPISOK'];
   ButtonEditNonspisok.Text    := IntToStr(Id.Id_Nonspisok)+' - '+VarToStrDef(DataSet['NAME_VO_PROP_NONSPISOK'],'');
 end
 else ButtonEditNonspisok.Text    := '';
//******************************************************************************
 if ((DataSet['YEAR_BEG']<>null)and(DataSet['MONTH_BEG']<>null)) then
      KodSetup                    := PeriodToKodSetup(DataSet['YEAR_BEG'],DataSet['MONTH_BEG'])
 else KodSetup                    := 1;
 DateBeg.Caption             := KodSetupToLitFormat(KodSetup,pImenitelny);
 if DataSet['CURRENT_KOD']<>null then
      KodSetup                    := DataSet['CURRENT_KOD']
 else KodSetup                    := 1;
 ComboBoxMonth.ItemIndex     := YearMonthFromKodSetup(KodSetup,False)-1;
 SpinEditYear.Value          := YearMonthFromKodSetup(KodSetup);
 if KodSetup<>0 then
 begin
   ComboBoxMonth.Properties.ReadOnly:=true;
   SpinEditYear.Properties.ReadOnly:=true;
 end;
 ButtonEditNachOk.Text       := VarToStrDef(DataSet['NACH_OK'],'');
 MaskEditDPI.Text            := VarToStrDef(DataSet['DPI'],'');
 MaskEditKodDPI.Text         := VarToStrDef(DataSet['KOD_DPI'],'');
 MaskEditForwHol.Text        := VarToStrDef(DataSet['FORWARD_HOLIDAYS'],'');
 if DataSet['ID_ORDER_LEVEL']<>null then
 begin
   Id.Id_OrderLevel            := DataSet['ID_ORDER_LEVEL'];
   ButtonEditOrderLevel.Text   := IntToStr(Id.Id_OrderLevel)+' - '+VarToStrDef(DataSet['LEVEL_NAME'],'');
 end
 else ButtonEditOrderLevel.Text   := '';
//******************************************************************************
 MaskEditZSystem.Text        := VarToStrDef(DataSet['Z_ID_SYSTEM'],'');
 MaskEditGrSystem.Text       := VarToStrDef(DataSet['GR_ID_SYSTEM'],'');
 CheckBoxRmoving.EditValue   := VarToStrDef(DataSet['SHOW_RMOVING_EXC'],'');
 CheckBoxIsFss.EditValue     := VarToStrDef(DataSet['IS_FSS'],'');
 CheckBoxVirtual.EditValue   := VarToStrDef(DataSet['VIRTUAL_TABLE'],'');
//*******************************************************************************************
 MaskEditNameFondNetrud.Text    := VarToStrDef(DataSet['NAME_FOND_NETRUD'],'');
 MaskEditRegKodStraxNetrud.Text := VarToStrDef(DataSet['REG_KOD_STRAH_NETRUD'],'');
 MaskEditFIODirector.Text       := VarToStrDef(DataSet['FIO_DIRECTOR_FOND'],'');
 MaskEditRahunokNetrud.Text     := VarToStrDef(DataSet['RAHUNOK_NETRUD'],'');
 MaskEditBankNetrud.Text        := VarToStrDef(DataSet['BANK_NETRUD'],'');
 MaskEditMFONetrud.Text         := VarToStrDef(DataSet['MFO_NETRUD'],'');
 MaskEditNameFondNSluch.Text    := VarToStrDef(DataSet['NAME_FOND_NSLUCH'],'');
 MaskEditRegKodStraxNSluch.Text := VarToStrDef(DataSet['REG_KOD_STRAH_NSLUCH'],'');
 MaskEditRahunokNSluch.Text     := VarToStrDef(DataSet['RAXUNOK_NSLUCH'],'');
 MaskEditBankNSluch.Text        := VarToStrDef(DataSet['BANK_NSLUCH'],'');
 MaskEditMFONSluch.Text         := VarToStrDef(DataSet['MFO_NSLUCH'],'');
 MaskEditMaska.Text             := VarToStrDef(DataSet['FILE_DA'],'');
//******************************************************************************
 ButtonEditDefaultSmeta.OnExit(self);
//******************************************************************************
 System.TabVisible:=false;
// if(DataSet['IS_UNIVER']='T')then Grant.TabVisible:=true
// else Grant.TabVisible:=false;

//************************************************************************
{ flag := False;
 ButtonEditDirectorTin.Properties.onButtonClick := nil;
 ButtonEditDirectorTin.Properties.onButtonClick  := nil;
 ButtonEditGlBuhgTin.Properties.onButtonClick    := nil;
 ButtonEditNachOk.Properties.onButtonClick       := nil;
 ButtonEditDefaultSmeta.Properties.onButtonClick := nil;
 ButtonEditPropFaculty.Properties.onButtonClick  := nil;
 ButtonEditBudgetGrant.Properties.onButtonClick  := nil;
 ButtonEditCurrent.Properties.onButtonClick      := nil;
 ButtonEditDedconst.Properties.onButtonClick     := nil;
 ButtonEditDopnach.Properties.onButtonClick      := nil;
 ButtonEditNonspisok.Properties.onButtonClick    := nil;   }
end;

procedure TFZSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ReadTransaction.Active then ReadTransaction.Commit;
Action:=caFree;
end;

procedure TFZSetup.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=False;
end;

procedure TFZSetup.ActionCancelExecute(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFZSetup.ActionYesExecute(Sender: TObject);
var KodSetup,KodSetupIndex: integer;
begin
with StoredProc do
 try

  Transaction.StartTransaction;
  StoredProcName := 'Z_SETUP_U';
  Prepare;

  ParamByName('ID').AsInteger := 1;

  ParamByName('NAME_MANEG').AsString := MaskEditNameManeg.Text;
  ParamByName('DIRECTOR').AsString := EditDirector.Caption;
  ParamByName('TIN_DIRECTOR').AsString := ButtonEditDirectorTin.Text;
  if MaskEditDirectorTel.Text<>'' then
       ParamByName('TEL_DIRECTOR').AsInteger := StrToInt(MaskEditDirectorTel.Text)
  else ParamByName('TEL_DIRECTOR').AsVariant := NULL;

  ParamByName('SHORT_NAME').AsString := MaskEditShortName.Text;
  ParamByName('FIRM_NAME_FULL').AsString := MaskEditFullName.Text;
  ParamByName('TELEFON').AsString := MaskEditCommonTel.Text;
  ParamByName('OKPO').AsString := MaskEditOkpo.Text;
  ParamByName('TOWN').AsString := MaskEditTown.Text;
  ParamByName('ADDRESS').AsString := MaskEditAddress.Text;

  ParamByName('GLAV_BUHG').AsString := EditGlBuhg.Caption;
  ParamByName('GLBUHG_POST').AsString := MaskEditGlavBuhgPost.Text;
  ParamByName('TIN_GLBUHG').AsString := ButtonEditGlBuhgTin.Text;
  if MaskEditGlBuhgTel.Text<>'' then
       ParamByName('TEL_GLBUHG').AsInteger := StrToInt(MaskEditGlBuhgTel.Text)
  else ParamByName('TEL_GLBUHG').AsVariant := NULL;

 // if Grant.TabVisible=true then
 // begin
    KodSetup      := PeriodToKodSetup(SpinEditGrantYear.Value,ComboBoxGrantMonth.ItemIndex+1);
    KodSetupIndex := PeriodToKodSetup(SpinEditIndexYear.Value,ComboBoxIndexMonth.ItemIndex+1);
    ParamByName('GR_KOD_SETUP').AsInteger       := KodSetup;
    ParamByName('GR_KOD_INDEX_START').AsInteger       := KodSetupIndex;
    if ButtonEditDefaultSmeta.Text<>'' then
         ParamByName('GR_DEFAULT_SMETA').AsInteger   := StrToInt(ButtonEditDefaultSmeta.Text)
    else ParamByName('GR_DEFAULT_SMETA').AsVariant   := NULL;
    ParamByName('ID_P_BUDGET_GRANT').AsInteger  := Id.Id_BudgetGrant;
    ParamByName('ID_PROP_FACULTY').AsInteger    := Id.Id_PropFaculty;
 // end;

  ParamByName('ID_VO_PROP_CURRENT').AsInteger   := Id.Id_Current;
  ParamByName('ID_VO_PROP_DOPNACH').AsInteger   := Id.Id_Dopnach;
  ParamByName('ID_VO_PROP_DEDCONST').AsInteger  := Id.Id_Dedconst;
  ParamByName('ID_VO_PROP_NONSPISOK').AsInteger := Id.Id_Nonspisok;

  KodSetup := PeriodToKodSetup(SpinEditYear.Value,ComboBoxMonth.ItemIndex+1);
  ParamByName('CURRENT_KOD').AsInteger          := KodSetup;
  ParamByName('YEAR_SET').AsInteger             := YearMonthFromKodSetup(KodSetup);
  ParamByName('MONTH_SET').AsInteger            := YearMonthFromKodSetup(KodSetup,false);
  ParamByName('NACH_OK').AsString               := ButtonEditNachOk.Text;
  ParamByName('DPI').AsString                   := MaskEditDPI.Text;
  ParamByName('KOD_DPI').AsString               := MaskEditKodDPI.Text;
  if MaskEditForwHol.Text<>'' then
       ParamByName('FORWARD_HOLIDAYS').AsInteger     := StrToInt(MaskEditForwHol.Text)
  else ParamByName('FORWARD_HOLIDAYS').AsVariant     :=NULL;

  if MaskEditZSystem.Text<>'' then
       ParamByName('Z_ID_SYSTEM').AsInteger          := StrToInt(MaskEditZSystem.Text)
  else ParamByName('Z_ID_SYSTEM').AsVariant          :=NULL;
  if MaskEditGrSystem.Text<>'' then
       ParamByName('GR_ID_SYSTEM').AsInteger         := StrToInt(MaskEditGrSystem.Text)
  else ParamByName('GR_ID_SYSTEM').AsVariant         :=NULL;
  ParamByName('ID_ORDER_LEVEL').AsInteger       := Id.Id_OrderLevel;
  ParamByName('SHOW_RMOVING_EXC').AsString      := CheckBoxRmoving.EditValue;
  ParamByName('IS_FSS').AsString                := CheckBoxIsFss.EditValue;
  ParamByName('VIRTUAL_TABLE').AsString         := CheckBoxVirtual.EditValue;

 //***********************************************************************************
  ParamByName('NAME_FOND_NETRUD').value     := MaskEditNameFondNetrud.Text;
  ParamByName('REG_KOD_STRAH_NETRUD').value := MaskEditRegKodStraxNetrud.Text;
  ParamByName('FIO_DIRECTOR_FOND').value    := MaskEditFIODirector.Text;
  ParamByName('RAHUNOK_NETRUD').value       := MaskEditRahunokNetrud.Text;
  ParamByName('BANK_NETRUD').value          := MaskEditBankNetrud.Text;
  ParamByName('MFO_NETRUD').value           := MaskEditMFONetrud.Text;
  ParamByName('NAME_FOND_NSLUCH').value     := MaskEditNameFondNSluch.Text;
  ParamByName('REG_KOD_STRAH_NSLUCH').value := MaskEditRegKodStraxNSluch.Text;
  ParamByName('RAXUNOK_NSLUCH').value       := MaskEditRahunokNSluch.Text;
  ParamByName('BANK_NSLUCH').value          := MaskEditBankNSluch.Text;
  ParamByName('MFO_NSLUCH').value           := MaskEditMFONSluch.Text;
  ParamByName('FILE_DA').value              := MaskEditMaska.Text;
 //***********************************************************************************


  ExecProc;
  Transaction.Commit;
 except
  on E:Exception do
   begin
    Transaction.Rollback;
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   end;
 end;
 ModalResult := mrYes;
end;

procedure TFZSetup.ButtonEditDirectorTinPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadPeopleModal(Self,Database.Handle);
  if VarArrayDimCount(ResultView)> 0 then
  begin
    EditDirector.Caption  := VarToStr(ResultView[1])+' '+
                             VarToStr(ResultView[2])+' '+
                             VarToStr(ResultView[3]);
    ButtonEditDirectorTin.Text := VarToStr(ResultView[5]);
  end;
end;

procedure TFZSetup.ButtonEditGlBuhgTinPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadPeopleModal(Self,Database.Handle);
  if VarArrayDimCount(ResultView)> 0 then
  begin
    EditGlBuhg.Caption    := VarToStr(ResultView[1])+' '+
                             VarToStr(ResultView[2])+' '+
                             VarToStr(ResultView[3]);
    ButtonEditGlBuhgTin.Text := VarToStr(ResultView[5]);
  end;
end;



procedure TFZSetup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if( (Key=Ord('S')) and (Shift=[ssAlt,ssCtrl]))then
  begin
  {  flag := not(flag);
    //*********************************************************
    if System.TabVisible=true then System.TabVisible:=false
    else System.TabVisible:=true;

    if ComboBoxGrantMonth.Properties.ReadOnly=true then
      ComboBoxGrantMonth.Properties.ReadOnly:=false
    else ComboBoxGrantMonth.Properties.ReadOnly:=true;

    if SpinEditGrantYear.Properties.ReadOnly=true then
      SpinEditGrantYear.Properties.ReadOnly:=false
    else SpinEditGrantYear.Properties.ReadOnly:=true;

    if ComboBoxIndexMonth.Properties.ReadOnly=true then
      ComboBoxIndexMonth.Properties.ReadOnly:=false
    else ComboBoxIndexMonth.Properties.ReadOnly:=true;

    if SpinEditIndexYear.Properties.ReadOnly=true then
      SpinEditIndexYear.Properties.ReadOnly:=false
    else SpinEditIndexYear.Properties.ReadOnly:=true;
    //********************************************************
    if ComboBoxMonth.Properties.ReadOnly=true then
      ComboBoxMonth.Properties.ReadOnly:=false
    else ComboBoxMonth.Properties.ReadOnly:=true;

    if SpinEditYear.Properties.ReadOnly=true then
      SpinEditYear.Properties.ReadOnly:=false
    else SpinEditYear.Properties.ReadOnly:=true;
   //*********************************************************
    if MaskEditOkpo.Properties.ReadOnly=true then
      MaskEditOkpo.Properties.ReadOnly:=false
    else MaskEditOkpo.Properties.ReadOnly:=true;

    if MaskEditShortName.Properties.ReadOnly=true then
      MaskEditShortName.Properties.ReadOnly:=false
    else MaskEditShortName.Properties.ReadOnly:=true;

    if MaskEditFullName.Properties.ReadOnly=true then
      MaskEditFullName.Properties.ReadOnly:=false
    else MaskEditFullName.Properties.ReadOnly:=true;

    if MaskEditTown.Properties.ReadOnly=true then
      MaskEditTown.Properties.ReadOnly:=false
    else MaskEditTown.Properties.ReadOnly:=true;

    if MaskEditAddress.Properties.ReadOnly=true then
      MaskEditAddress.Properties.ReadOnly:=false
    else MaskEditAddress.Properties.ReadOnly:=true;

    if MaskEditCommonTel.Properties.ReadOnly=true then
      MaskEditCommonTel.Properties.ReadOnly:=false
    else MaskEditCommonTel.Properties.ReadOnly:=true;
    //**********************************************************
    if MaskEditDirectorTel.Properties.ReadOnly=true then
      MaskEditDirectorTel.Properties.ReadOnly:=false
    else MaskEditDirectorTel.Properties.ReadOnly:=true;

    if MaskEditNameManeg.Properties.ReadOnly then
      MaskEditNameManeg.Properties.ReadOnly:=false
    else MaskEditNameManeg.Properties.ReadOnly:=true;

    if MaskEditGlavBuhgPost.Properties.ReadOnly then
      MaskEditGlavBuhgPost.Properties.ReadOnly:=false
    else MaskEditGlavBuhgPost.Properties.ReadOnly:=true;

    if MaskEditNameFondNetrud.Properties.ReadOnly then
      MaskEditNameFondNetrud.Properties.ReadOnly:=false
    else MaskEditNameFondNetrud.Properties.ReadOnly:=true;

    if MaskEditRegKodStraxNetrud.Properties.ReadOnly then
      MaskEditRegKodStraxNetrud.Properties.ReadOnly:=false
    else MaskEditRegKodStraxNetrud.Properties.ReadOnly:=true;

    if MaskEditRahunokNetrud.Properties.ReadOnly then
      MaskEditRahunokNetrud.Properties.ReadOnly:=false
    else MaskEditRahunokNetrud.Properties.ReadOnly:=true;

    if MaskEditBankNetrud.Properties.ReadOnly then
      MaskEditBankNetrud.Properties.ReadOnly:=false
    else MaskEditBankNetrud.Properties.ReadOnly:=true;

    if MaskEditMFONetrud.Properties.ReadOnly then
      MaskEditMFONetrud.Properties.ReadOnly:=false
    else MaskEditMFONetrud.Properties.ReadOnly:=true;

    if MaskEditNameFondNSluch.Properties.ReadOnly then
      MaskEditNameFondNSluch.Properties.ReadOnly:=false
    else MaskEditNameFondNSluch.Properties.ReadOnly:=true;

    if MaskEditRegKodStraxNSluch.Properties.ReadOnly then
      MaskEditRegKodStraxNSluch.Properties.ReadOnly:=false
    else MaskEditRegKodStraxNSluch.Properties.ReadOnly:=true;

    if MaskEditRahunokNSluch.Properties.ReadOnly then
      MaskEditRahunokNSluch.Properties.ReadOnly:=false
    else MaskEditRahunokNSluch.Properties.ReadOnly:=true;

    if MaskEditBankNSluch.Properties.ReadOnly then
      MaskEditBankNSluch.Properties.ReadOnly:=false
    else MaskEditBankNSluch.Properties.ReadOnly:=true;

    if MaskEditMFONSluch.Properties.ReadOnly then
      MaskEditMFONSluch.Properties.ReadOnly:=false
    else MaskEditMFONSluch.Properties.ReadOnly:=true;

    if MaskEditDPI.Properties.ReadOnly then
      MaskEditDPI.Properties.ReadOnly:=false
    else MaskEditDPI.Properties.ReadOnly:=true;


    if MaskEditKodDPI.Properties.ReadOnly then
      MaskEditKodDPI.Properties.ReadOnly:=false
    else MaskEditKodDPI.Properties.ReadOnly:=true;

    if MaskEditMaska.Properties.ReadOnly then
      MaskEditMaska.Properties.ReadOnly:=false
    else MaskEditMaska.Properties.ReadOnly:=true;

    if MaskEditFIODirector.Properties.ReadOnly then
      MaskEditFIODirector.Properties.ReadOnly:=false
    else MaskEditFIODirector.Properties.ReadOnly:=true;
   //******************************************************************
   if flag then
     begin
       ButtonEditDirectorTin.Properties.onButtonClick  := ButtonEditDirectorTinPropertiesButtonClick;
       ButtonEditGlBuhgTin.Properties.onButtonClick    := ButtonEditGlBuhgTinPropertiesButtonClick;
       ButtonEditNachOk.Properties.onButtonClick       := ButtonEditNachOkPropertiesButtonClick;
       ButtonEditDefaultSmeta.Properties.onButtonClick := ButtonEditDefaultSmetaPropertiesButtonClick;
       ButtonEditPropFaculty.Properties.onButtonClick  := ButtonEditPropFacultyPropertiesButtonClick;
       ButtonEditBudgetGrant.Properties.onButtonClick  := ButtonEditBudgetGrantPropertiesButtonClick;
       ButtonEditCurrent.Properties.onButtonClick      := ButtonEditCurrentPropertiesButtonClick;
       ButtonEditDedconst.Properties.onButtonClick     := ButtonEditDedconstPropertiesButtonClick;
       ButtonEditDopnach.Properties.onButtonClick      := ButtonEditDopnachPropertiesButtonClick;
       ButtonEditNonspisok.Properties.onButtonClick    := ButtonEditNonspisokPropertiesButtonClick;
     end
   else
     begin
       ButtonEditDirectorTin.Properties.onButtonClick  := nil;
       ButtonEditGlBuhgTin.Properties.onButtonClick    := nil;
       ButtonEditNachOk.Properties.onButtonClick       := nil;
       ButtonEditDefaultSmeta.Properties.onButtonClick := nil;
       ButtonEditPropFaculty.Properties.onButtonClick  := nil;
       ButtonEditBudgetGrant.Properties.onButtonClick  := nil;
       ButtonEditCurrent.Properties.onButtonClick      := nil;
       ButtonEditDedconst.Properties.onButtonClick     := nil;
       ButtonEditDopnach.Properties.onButtonClick      := nil;
       ButtonEditNonspisok.Properties.onButtonClick    := nil;
     end; }

    if System.TabVisible=true then System.TabVisible:=false
    else System.TabVisible:=true;
    if ComboBoxGrantMonth.Properties.ReadOnly=true then
      ComboBoxGrantMonth.Properties.ReadOnly:=false
    else ComboBoxGrantMonth.Properties.ReadOnly:=true;
    if SpinEditGrantYear.Properties.ReadOnly=true then
      SpinEditGrantYear.Properties.ReadOnly:=false
    else SpinEditGrantYear.Properties.ReadOnly:=true;
    if ComboBoxIndexMonth.Properties.ReadOnly=true then
      ComboBoxIndexMonth.Properties.ReadOnly:=false
    else ComboBoxIndexMonth.Properties.ReadOnly:=true;
    if SpinEditIndexYear.Properties.ReadOnly=true then
      SpinEditIndexYear.Properties.ReadOnly:=false
    else SpinEditIndexYear.Properties.ReadOnly:=true;

    if ComboBoxMonth.Properties.ReadOnly=true then
      ComboBoxMonth.Properties.ReadOnly:=false
    else ComboBoxMonth.Properties.ReadOnly:=true;
    if SpinEditYear.Properties.ReadOnly=true then
      SpinEditYear.Properties.ReadOnly:=false
    else SpinEditYear.Properties.ReadOnly:=true;

  end;


end;


procedure TFZSetup.ButtonEditOrderLevelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var level:variant;
    ViewForm: TZFUpSysLevel;
begin
  ViewForm:=TZFUpSysLevel.Create(self,Database.Handle);
  if(ViewForm.ShowModal=mrYes)then
    level:=ViewForm.Result
  else level:=NULL;
  if VarArrayDimCount(level)>0 then
  begin
    Id.Id_OrderLevel           :=level[0];
    ButtonEditOrderLevel.Text  :=IntToStr(level[0])+' - '+level[1];
  end;
  ViewForm.Free;
end;

procedure TFZSetup.ButtonEditBudgetGrantPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res: variant;
begin
  res:=LoadVOplProp(self,Database.Handle,zfsModal,1);
  if VarArrayDimCount(res)>0 then
  begin
    Id.Id_BudgetGrant           :=res[0];
    ButtonEditBudgetGrant.Text  :=IntToStr(res[0])+' - '+res[1];
  end;
end;

procedure TFZSetup.ButtonEditDefaultSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,Database.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
  If Smeta[0]<>NULL then
  begin
    ButtonEditDefaultSmeta.Text   := Smeta[3];
    EditDefaultSmeta.Caption      := Smeta[2];
  end;
end;

procedure TFZSetup.ButtonEditNachOkPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadPeopleModal(Self,Database.Handle);
  if VarArrayDimCount(ResultView)> 0 then
  begin
    ButtonEditNachOk.Text := VarToStr(ResultView[1])+' '+
                             VarToStr(ResultView[2])+' '+
                             VarToStr(ResultView[3]);
  end;
end;

procedure TFZSetup.ButtonEditCurrentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVOplProp(self,Database.Handle,zfsModal,1);
 if VarArrayDimCount(VidOpl)>0 then
  begin
    Id.Id_Current           :=VidOpl[0];
    ButtonEditCurrent.Text  :=IntToStr(VidOpl[0])+' - '+VidOpl[1];
  end
 else
 ButtonEditCurrent.SetFocus;
end;

procedure TFZSetup.ButtonEditDopnachPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVOplProp(self,Database.Handle,zfsModal,1);
 if VarArrayDimCount(VidOpl)>0 then
  begin
   Id.Id_Dopnach           :=VidOpl[0];
   ButtonEditDopnach.Text  :=IntToStr(VidOpl[0])+' - '+VidOpl[1];
  end
 else
 ButtonEditDopnach.SetFocus;
end;

procedure TFZSetup.ButtonEditDedconstPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVOplProp(self,Database.Handle,zfsModal,1);
 if VarArrayDimCount(VidOpl)>0 then
  begin
    Id.Id_Dedconst           :=VidOpl[0];
    ButtonEditDedconst.Text  :=IntToStr(VidOpl[0])+' - '+VidOpl[1];
  end
 else
 ButtonEditDedconst.SetFocus;
end;

procedure TFZSetup.ButtonEditNonspisokPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVOplProp(self,Database.Handle,zfsModal,1);
 if VarArrayDimCount(VidOpl)>0 then
  begin
    Id.Id_Nonspisok           :=VidOpl[0];
    ButtonEditNonspisok.Text  :=IntToStr(VidOpl[0])+' - '+VidOpl[1];
  end
 else
 ButtonEditNonspisok.SetFocus;
end;

procedure TFZSetup.ButtonEditDefaultSmeta_Exit(Sender: TObject);
var Smeta:Variant;
begin
if ButtonEditDefaultSmeta.Text<>'' then
 begin
  Smeta:=SmetaByKod(StrToInt(ButtonEditDefaultSmeta.Text),Database.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    ButtonEditDefaultSmeta.Text :=Smeta[1];
    EditDefaultSmeta.Caption    :=Smeta[2];
   end
  else
   ButtonEditDefaultSmeta.SetFocus;
 end;
end;

procedure TFZSetup.ButtonEditPropFacultyPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res:variant;
    ViewForm: TZFPropFaculty;
begin
  ViewForm:=TZFPropFaculty.Create(self,Database.Handle);
  if(ViewForm.ShowModal=mrYes)then
    res:=ViewForm.Result
  else res:=NULL;
  if VarArrayDimCount(res)>0 then
  begin
    Id.Id_PropFaculty           :=res[0];
    ButtonEditPropFaculty.Text  :=IntToStr(res[0])+' - '+res[1];
  end;
  ViewForm.Free;
end;

end.
