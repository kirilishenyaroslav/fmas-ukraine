//***********************************************************************
//* Проект "Студгородок"                                                *
//* Редактирование прописки - модуль для справочника регистрации        *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit Propiska;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxControls, ImgList, cxGraphics, cxSplitter, cxGroupBox,
  dxStatusBar, StdCtrls, cxMaskEdit, cxDropDownEdit, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, cxCheckBox, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Buttons, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, cxLookAndFeelPainters, cxButtons, dxBar, dxBarExtItems, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, cxButtonEdit,
  AccMGMT, St_Proc, st_ConstUnit;


  const kav = '''';
  type
  TfrmPropiska = class(TForm)
    prp_PageControl: TcxPageControl;
    prp_BornPlace_Sheet: TcxTabSheet;
    prp_Propiska_Sheet: TcxTabSheet;
    prp_Additional_Sheet: TcxTabSheet;
    prp_Warrior_Sheet: TcxTabSheet;
    prp_MultiPass_Sheet: TcxTabSheet;
    prp_Daddy_Sheet: TcxTabSheet;
    prp_Mummi_Sheet: TcxTabSheet;
    prp_FamilyStatus_Sheet: TcxTabSheet;
    prp_ImageList: TImageList;
    dxStatusBar2: TdxStatusBar;
    prp_SubMainFIO_GroupBox: TcxGroupBox;
    prp_Splitter1: TcxSplitter;
    prp_Splitter2: TcxSplitter;
    prp_FIO_Label: TLabel;
    prp_BornPlace_GroupBox: TcxGroupBox;
    prp_Propiska_GroupBox: TcxGroupBox;
    prp_Adittional_GroupBox: TcxGroupBox;
    prp_MultiPass_GroupBox: TcxGroupBox;
    prp_Daddy_GroupBox: TcxGroupBox;
    prp_Mummi_GroupBox: TcxGroupBox;
    prp_FamilyStatus_GroupBox: TcxGroupBox;
    prp_Warrior_GroupBox: TcxGroupBox;
    prp_Splitter3: TcxSplitter;
    prp_Country_Label: TLabel;
    prp_mg_Country_TextEdit: TcxTextEdit;
    prp_mg_Oblast_ComboBox: TcxComboBox;
    prp_mg_Oblast_TextEdit: TcxTextEdit;
    prp_mg_Rayon_TextEdit: TcxTextEdit;
    prp_Rayon_Label: TLabel;
    prp_mg_Selo_TextEdit: TcxTextEdit;
    prp_Selo_Label: TLabel;
    prp_Index_Label: TLabel;
    prp_mg_Index_TextEdit: TcxCurrencyEdit;
    prp_Strana_Label: TLabel;
    prp_prp_Country_TextEdit: TcxTextEdit;
    prp_prp_Oblast_ComboBox: TcxComboBox;
    prp_prp_Oblast_TextEdit: TcxTextEdit;
    IndexLabel: TLabel;
    prp_prp_Index_TextEdit: TcxCurrencyEdit;
    RayonLabel: TLabel;
    prp_prp_Rayon_TextEdit: TcxTextEdit;
    prp_prp_Gorod_TextEdit: TcxTextEdit;
    prp_Selo_Label2: TLabel;
    prp_prp_Selo_TextEdit: TcxTextEdit;
    Label10: TLabel;
    prp_prp_Street_TextEdit: TcxTextEdit;
    Home_Label2: TLabel;
    prp_prp_HouseNumber_TextEdit: TcxTextEdit;
    RoomLabel2: TLabel;
    prp_prp_KvartNumber_TextEdit: TcxTextEdit;
    Date_Income_Label: TLabel;
    prp_prp_DateIncome: TcxDateEdit;
    prp_prp_FromDonezk_CheckBox: TcxCheckBox;
    prp_CurrentPropiska_GroupBox: TcxGroupBox;
    BegPropiLabel: TLabel;
    prp_prp_DateBegPropi: TcxDateEdit;
    EndPropiLabel: TLabel;
    prp_prp_DateEndPropi: TcxDateEdit;
    MestoYbitiya_Label: TLabel;
    Label2: TLabel;
    BaseResonPriezd_Label: TLabel;
    Srok_Label: TLabel;
    prp_dp_Srok_ComboBox: TcxComboBox;
    BaseResonPereezd_Label: TLabel;
    GdeRabotal_Label: TLabel;
    prp_dp_Dolgnost_Label: TLabel;
    Obrazovanie_Label: TLabel;
    U4Stepen_Label: TLabel;
    Label20: TLabel;
    Gragdanstvo_Label: TLabel;
    Nazionalnost_Label: TLabel;
    DomPhone_Label: TLabel;
    prp_dp_ResonPereezd_ComboBox: TcxComboBox;
    prp_dp_Osvita_ComboBox: TcxComboBox;
    prp_dp_UchStepen_ComboBox: TcxComboBox;
    prp_dp_GdeRabotal_TextEdit: TcxTextEdit;
    prp_dp_Nazionalnost_TextEdit: TcxTextEdit;
    prp_dp_KemRabotal_TextEdit: TcxTextEdit;
    prp_dp_Specialnost_TextEdit: TcxTextEdit;
    prp_dp_Gragdanstvo_TextEdit: TcxTextEdit;
    FromRVK_Label: TLabel;
    prp_vu_FromRVK_TextEdit: TcxTextEdit;
    Postavlen_Label: TLabel;
    prp_vu_PostavlenDate: TcxDateEdit;
    Snyat_Label: TLabel;
    prp_vu_SnyatDate: TcxDateEdit;
    Notes_Label: TLabel;
    prp_vu_Notes: TcxTextEdit;
    f_Fam_Label: TLabel;
    prp_f_Familia_Edit: TcxTextEdit;
    f_Name_Label: TLabel;
    prp_f_Name_Edit: TcxTextEdit;
    f_Otch_Label: TLabel;
    prp_f_Otch_Edit: TcxTextEdit;
    prp_f_MestoRaboti_TextEdit: TcxTextEdit;
    f_Work_Label: TLabel;
    f_Posada_Label: TLabel;
    prp_f_Dolgnost_TextEdit: TcxTextEdit;
    f_Phone_Label: TLabel;
    prp_f_Oblast_TextEdit: TcxTextEdit;
    f_Oblast_Label: TLabel;
    prp_f_GorodSeloPGT_ComboBox: TcxComboBox;
    prp_f_GorodSeloPGT_TextEdit: TcxTextEdit;
    f_Street_Label: TLabel;
    prp_f_Street_TextEdit: TcxTextEdit;
    f_Home_Label: TLabel;
    prp_f_HouseNumber_TextEdit: TcxTextEdit;
    f_Room_Label: TLabel;
    prp_f_KvartNumber_TextEdit: TcxTextEdit;
    m_Fam_Label: TLabel;
    prp_m_Familia_Edit: TcxTextEdit;
    m_Name_Label: TLabel;
    prp_m_Name_Edit: TcxTextEdit;
    m_Otch_Label: TLabel;
    prp_m_Otch_Edit: TcxTextEdit;
    m_Work_Label: TLabel;
    prp_m_MestoRaboti_TextEdit: TcxTextEdit;
    m_Posada_Label: TLabel;
    prp_m_Dolgnost_TextEdit: TcxTextEdit;
    m_Phone_Label: TLabel;
    m_Oblast_Label: TLabel;
    prp_m_Oblast_TextEdit: TcxTextEdit;
    prp_m_GorodSeloPGT_ComboBox: TcxComboBox;
    prp_m_GorodSeloPGT_TextEdit: TcxTextEdit;
    m_Street_Label: TLabel;
    prp_m_Street_TextEdit: TcxTextEdit;
    m_Home_Label: TLabel;
    prp_m_HouseNumber_TextEdit: TcxTextEdit;
    m_Room_Label: TLabel;
    prp_m_KvartNumber_TextEdit: TcxTextEdit;
    Stan_Label: TLabel;
    prp_fs_SimStan_ComboBox: TcxComboBox;
    prp_fs_GroupBox: TcxGroupBox;
    prp_fs_Vmeste_CheckBox: TcxCheckBox;
    prp_Grid: TcxGrid;
    prp_GridTableView: TcxGridTableView;
    prp_GridLevel: TcxGridLevel;
    prp_fs_AddButton: TSpeedButton;
    prp_fs_DeleteButton: TSpeedButton;
    prp_fs_EditButton: TSpeedButton;
    prp_StyleRepository: TcxStyleRepository;
    prp_Style_Yellow1: TcxStyle;
    prp_Style_Yellow: TcxStyle;
    prp_Style_Blue: TcxStyle;
    prp_Style_Silver: TcxStyle;
    prp_Children_Column: TcxGridColumn;
    prp_Sex_Column: TcxGridColumn;
    prp_DateChildBorn_Column: TcxGridColumn;
    prp_DateOfBorn_Label: TLabel;
    prp_NameChild_Column: TcxGridColumn;
    prp_OtchChild_Column: TcxGridColumn;
    prp_FamiliyaChild_Column: TcxGridColumn;
    prp_mg_GroupBox: TcxGroupBox;
    prp_mg_OkButton: TcxButton;
    prp_prp_GroupBox: TcxGroupBox;
    prp_prp_OkButton: TcxButton;
    prp_dp_GroupBox: TcxGroupBox;
    prp_dp_OkButton: TcxButton;
    prp_vu_GroupBox: TcxGroupBox;
    prp_vu_OkButton: TcxButton;
    prp_f_GroupBox: TcxGroupBox;
    prp_f_OkButton: TcxButton;
    prp_m_GroupBox: TcxGroupBox;
    prp_m_OkButton: TcxButton;
    dxBarManager1: TdxBarManager;
    prp_SaveAll_LargeButton: TdxBarLargeButton;
    prp_CancelAll_LargeButton: TdxBarLargeButton;
    ImageList1: TImageList;
    prp_Vipiska_LargeButton: TdxBarLargeButton;
    prp_mg_Gorod_TextEdit: TcxTextEdit;
    prp_prp_GorodSeloPGT_ComboBox: TcxComboBox;
    prp_mg_GorodSeloPGT_ComboBox: TcxComboBox;
    WriteProc: TpFIBStoredProc;
    f_Rayon_Label: TLabel;
    prp_f_Rayon_TextEdit: TcxTextEdit;
    m_Rayon_Label: TLabel;
    prp_m_Rayon_TextEdit: TcxTextEdit;
    prp_dp_DateMestoUbitiya: TcxTextEdit;
    ReadDataSet: TpFIBDataSet;
    prp_dp_ResonPriezd_ComboBox: TcxComboBox;
    prp_PassGroupBox: TcxGroupBox;
    prp_pass_AddButton: TSpeedButton;
    prp_pass_DeleteButton: TSpeedButton;
    prp_pass_EditButton: TSpeedButton;
    prp_PaspGrid: TcxGrid;
    prp_PaspGridTableView: TcxGridTableView;
    cxGridLevel1: TcxGridLevel;
    prp_pass_GroupBox: TcxGroupBox;
    prp_pass_OkButton: TcxButton;
    prp_pass_Type_GridColumn: TcxGridColumn;
    prp_pass_Fio_GridColumn: TcxGridColumn;
    prp_pass_id_Type_GridColumn: TcxGridColumn;
    prp_pass_Familiya_GridColumn: TcxGridColumn;
    prp_pass_Name_GridColumn: TcxGridColumn;
    prp_pass_Otch_GridColumn: TcxGridColumn;
    prp_pass_PasVidan_GridColumn: TcxGridColumn;
    prp_pass_DateVidan_GridColumn: TcxGridColumn;
    prp_pass_Nomer_GridColumn: TcxGridColumn;
    prp_pass_Seriya_GridColumn: TcxGridColumn;
    prp_PasVidan_Label: TLabel;
    prp_DateVidan_Label: TLabel;
    PassVidan_Label: TLabel;
    DatePass_Label: TLabel;
    prp_pass_Osnovanie_GridColumn: TcxGridColumn;
    prp_History_LargeButton: TdxBarLargeButton;
    prp_Prodlenie_LargeButton: TdxBarLargeButton;
    prp_fs_GroupBox2: TcxGroupBox;
    prp_fs_OkButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    prp_Rodstv_Add_Button: TSpeedButton;
    prp_Rodstv_Delete_Button: TSpeedButton;
    prp_Rodstv_Edit_Button: TSpeedButton;
    prp_Rodstv_Grid: TcxGrid;
    prp_Rodstv_GridTableView: TcxGridTableView;
    cxGridLevel2: TcxGridLevel;
    fio: TcxGridColumn;
    name_rel: TcxGridColumn;
    id_type_pel: TcxGridColumn;
    id_rodstvennika: TcxGridColumn;
    AdresPropiLabel: TLabel;
    prp_AdresPropi_Edit: TcxButtonEdit;
    Donezk_GroupBox: TcxGroupBox;
    RayonDonLabel: TLabel;
    prp_prp_RAJ_D_TextEdit: TcxTextEdit;
    StrretDonLabel: TLabel;
    prp_prp_STREET_D_TextEdit: TcxTextEdit;
    HomeDonLabel: TLabel;
    prp_prp_HOUSE_D_TextEdit: TcxTextEdit;
    RoomDonLabel: TLabel;
    prp_prp_KVART_D_TextEdit: TcxTextEdit;
    DateIncomeDonLabel: TLabel;
    prp_prp_DATE_PRIB_DateEdit: TcxDateEdit;
    prp_Vipiska_Sheet: TcxTabSheet;
    prp_Vip_Dopolnenie_Sheet: TcxTabSheet;
    prp_vip_GroupBox: TcxGroupBox;
    vip_Strana_Label: TLabel;
    vip_Index_Label: TLabel;
    vip_Rayon_Label: TLabel;
    vip_Selo_Label: TLabel;
    vip_DateVip_Label: TLabel;
    prp_vip_Country_TextEdit: TcxTextEdit;
    prp_vip_Oblast_ComboBox: TcxComboBox;
    prp_vip_Oblast_TextEdit: TcxTextEdit;
    prp_vip_Index_TextEdit: TcxCurrencyEdit;
    prp_vip_Rayon_TextEdit: TcxTextEdit;
    prp_vip_Gorod_TextEdit: TcxTextEdit;
    prp_vip_Selo_TextEdit: TcxTextEdit;
    prp_vip_DateIncome: TcxDateEdit;
    prp_vip_ToDonezk_CheckBox: TcxCheckBox;
    cxGroupBox4: TcxGroupBox;
    prp_vip_OkButton: TcxButton;
    prp_vip_GorodSeloPGT_ComboBox: TcxComboBox;
    vip_Donezk_GroupBox: TcxGroupBox;
    vip_don_Rayon_Label: TLabel;
    vip_don_Street_Label: TLabel;
    vip_don_Home_Label: TLabel;
    vip_don_Room_Label: TLabel;
    prp_vip_RAJ_D_TextEdit: TcxTextEdit;
    prp_vip_STREET_D_TextEdit: TcxTextEdit;
    prp_vip_HOUSE_D_TextEdit: TcxTextEdit;
    prp_vip_KVART_D_TextEdit: TcxTextEdit;
    prp_vip_dp_GroupBox: TcxGroupBox;
    vip_add_BasePereezdReson_Label: TLabel;
    vip_add_GdeRabotal_Label: TLabel;
    vip_add_Dolgnost_Label: TLabel;
    vip_add_Obrazovanie_Label: TLabel;
    vip_add_U4Stepen_Label: TLabel;
    prp_vip_ResonPereezd_ComboBox: TcxComboBox;
    prp_vip_Osvita_ComboBox: TcxComboBox;
    prp_vip_UchStepen_ComboBox: TcxComboBox;
    prp_vip_GdeRabotal_TextEdit: TcxTextEdit;
    prp_vip_KemRabotal_TextEdit: TcxTextEdit;
    cxGroupBox6: TcxGroupBox;
    prp_vip_dp_OkButton: TcxButton;
    Mode_BarStatic: TdxBarStatic;
    prp_dp_DomTelefon_MaskEdit: TcxTextEdit;
    prp_f_WorkTelefon_MaskEdit: TcxTextEdit;
    prp_m_WorkTelefon_MaskEdit: TcxTextEdit;
    prp_dp_Dolgnost_ComboBox: TcxComboBox;
    IfNotWork_Label: TLabel;
    ckbxProdlitPropi: TcxCheckBox;
    prp_vipiska_street_label: TLabel;
    prp_vip_street_TextEdit: TcxTextEdit;
    prp_vipiska_house_label: TLabel;
    prp_vip_house_TextEdit: TcxTextEdit;
    Label4prp_vipiska_kvartira_label: TLabel;
    prp_vip_kvartira_TextEdit: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure prp_fs_AddButtonClick(Sender: TObject);
    procedure prp_fs_EditButtonClick(Sender: TObject);
    procedure prp_fs_DeleteButtonClick(Sender: TObject);
    procedure prp_CancelAll_LargeButtonClick(Sender: TObject);
    procedure prp_fs_OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prp_f_OkButtonClick(Sender: TObject);
    procedure prp_m_OkButtonClick(Sender: TObject);
    procedure prp_dp_OkButtonClick(Sender: TObject);
    procedure prp_prp_OkButtonClick(Sender: TObject);
    procedure prp_mg_Country_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Oblast_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Oblast_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Rayon_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Gorod_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Index_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_mg_Selo_TextEditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_prp_Country_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Oblast_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Oblast_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Rayon_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Gorod_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Selo_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Index_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_Street_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_HouseNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_KvartNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_DateIncomeKeyPress(Sender: TObject; var Key: Char);
    procedure prp_prp_FromDonezk_CheckBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_DateBegPropiKeyPress(Sender: TObject; var Key: Char);
    procedure prp_prp_DateEndPropiKeyPress(Sender: TObject; var Key: Char);
    procedure prp_dp_DateMestoUbitiyaKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_ResonPriezd_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Srok_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure prp_dp_ResonPereezd_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_GdeRabotal_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_KemRabotal_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Osvita_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_UchStepen_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Specialnost_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Gragdanstvo_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Nazionalnost_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure _prp_dp_DomTelefon_MaskEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vu_FromRVK_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vu_PostavlenDateKeyPress(Sender: TObject; var Key: Char);
    procedure prp_vu_SnyatDateKeyPress(Sender: TObject; var Key: Char);
    procedure prp_vu_NotesKeyPress(Sender: TObject; var Key: Char);
    procedure prp_f_Familia_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_f_Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_f_Otch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_f_MestoRaboti_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_Dolgnost_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_Oblast_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_Rayon_TextEditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_f_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_GorodSeloPGT_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_Street_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_HouseNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_KvartNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_Familia_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_m_Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_m_Otch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_m_MestoRaboti_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_Dolgnost_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_Oblast_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_Rayon_TextEditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_m_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_GorodSeloPGT_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_Street_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_HouseNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_KvartNumber_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_fs_SimStan_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_fs_Vmeste_CheckBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_GridTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure prp_PageControlChange(Sender: TObject);
    procedure prp_mg_OkButtonClick(Sender: TObject);
    procedure prp_vu_OkButtonClick(Sender: TObject);
    procedure prp_PaspGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure prp_pass_AddButtonClick(Sender: TObject);
    procedure prp_pass_EditButtonClick(Sender: TObject);
    procedure prp_pass_DeleteButtonClick(Sender: TObject);
    procedure prp_pass_OkButtonClick(Sender: TObject);
    procedure prp_SaveAll_LargeButtonClick(Sender: TObject);
    procedure prp_History_LargeButtonClick(Sender: TObject);
    procedure prp_Prodlenie_LargeButtonClick(Sender: TObject);
    procedure prp_Rodstv_Add_ButtonClick(Sender: TObject);
    procedure prp_Rodstv_Delete_ButtonClick(Sender: TObject);
    procedure prp_Rodstv_Edit_ButtonClick(Sender: TObject);
    procedure prp_AdresPropi_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure prp_prp_FromDonezk_CheckBoxClick(Sender: TObject);
    procedure prp_Vipiska_LargeButtonClick(Sender: TObject);
    procedure prp_vip_ToDonezk_CheckBoxClick(Sender: TObject);
    procedure prp_prp_RAJ_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_STREET_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_HOUSE_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_KVART_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_prp_DATE_PRIB_DateEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_Propiska_SheetExit(Sender: TObject);
    procedure prp_vip_OkButtonClick(Sender: TObject);
    procedure prp_vip_dp_OkButtonClick(Sender: TObject);
    procedure prp_vip_Country_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Oblast_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Oblast_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Rayon_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Gorod_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Index_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Selo_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_DateIncomeKeyPress(Sender: TObject; var Key: Char);
    procedure prp_vip_ToDonezk_CheckBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_RAJ_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_STREET_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_HOUSE_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_KVART_D_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_ResonPereezd_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_GdeRabotal_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_KemRabotal_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_Osvita_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_UchStepen_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_BornPlace_SheetExit(Sender: TObject);
    procedure prp_PaspGridTableViewDblClick(Sender: TObject);
    procedure prp_dp_DomTelefon_MaskEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_f_WorkTelefon_MaskEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_m_WorkTelefon_MaskEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_AdresPropi_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_PaspGridTableViewKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_GdeRabotal_TextEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure prp_dp_Dolgnost_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_dp_Dolgnost_ComboBoxKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ckbxProdlitPropiClick(Sender: TObject);
    procedure prp_vip_street_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_house_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_vip_kvartira_TextEditKeyPress(Sender: TObject;
      var Key: Char);
  private
    Comboflag: integer;
    ProdlenieMode: boolean;
    // переменные контроля умоумолчаний
    prp_Oblast_Control,
    prp_Rayon_Control,
    prp_Gorod_Control,
    prp_Uliza_Control,
    prp_Dom_Control,
    prp_Kvartira_Control : string;
    prp_vip_didSafe: boolean;

    prp_born_Rayon, prp_born_Gorod, prp_born_Selo: string;

    PLanguageIndex: byte;
    procedure FormIniLanguage();
    procedure FamilyStatus_Write;
    procedure prp_Father_Write;
    procedure prp_Muther_Write;
    procedure prp_Additional_Write;
    procedure prp_Propiska_Write;
    procedure prp_Born_Write;
    procedure prp_Warrior_Write;
    procedure prp_MultiPass_Write;
    procedure FamilyRelations_Write;

    procedure prp_vip_Propiska_Write;
    procedure prp_vip_Additional_Write;
    procedure prp_zz_DizzableAll(Mode: string);
    function  is_date(str_date: String):boolean;

  public
    edit_item_id: int64;

    // пункты родителей
    prp_prp_NOM_TOWN_HISTORY: Smallint;
    prp_prp_NOM_PUNKT_HISTORY : Smallint;
    prp_dp_BEFO_OSVITA_HISTORY : Smallint;
    prp_dp_BEFO_STUPEN_HISTORY : Smallint;
    prp_dp_BEFO_META_HISTORY : Smallint;
    prp_fs_BEFO_STAN_HISTORY : Smallint;

    prp_Kod_Build: integer;

    // по прописке
    prp_F_NOM_P: Smallint;
    prp_M_NOM_P: Smallint;
    prp_mg_NOM_PUNKT: Smallint;
    prp_mg_NOM_TOWN: Smallint;
    prp_prp_NOM_PUNKT: Smallint;
    prp_prp_NOM_TOWN: Smallint;
    prp_dp_BEFO_OSVITA: Smallint;
    prp_dp_BEFO_STUPEN: Smallint;
    prp_dp_BEFO_META: Smallint;
    prp_dp_BEFO_BUZY: Smallint;
    prp_fs_BEFO_STAN: Smallint;
    prp_BEG_PROPIS: TDate;
    prp_END_PROPIS: TDate;

    // по выписке
    prp_vip_NOM_PUNKT: Smallint;
    prp_vip_NOM_TOWN: Smallint;
    prp_vip_AFTE_VYP_OSVITA: Smallint;
    prp_vip_AFTE_VYP_STUPEN: Smallint;
    prp_vip_AFTE_VYP_RESON: Smallint;


    // признак продления прописки
    cont_propi: smallint;
 end;

var
  frmPropiska: TfrmPropiska;

implementation

uses Propiska_AddChildren, Propiska_Add_Pasport, Propiska_History, DataModule1_Unit,
  Propiska_Add_Fam_Relations, Propiska_Add_Fam, Propiska_Builds,
  St_Ptio_Registration;

{$R *.dfm}

procedure TfrmPropiska.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 Caption :=  st_ConstUnit.st_PropVipis[PLanguageIndex];
 //названия кнопок
 prp_SaveAll_LargeButton.Caption     :=  st_ConstUnit.st_SafeNExit[PLanguageIndex];
 prp_History_LargeButton.Caption     :=  st_ConstUnit.st_prp_History[PLanguageIndex];
 prp_Prodlenie_LargeButton.Caption   :=  st_ConstUnit.st_prp_Prodovg[PLanguageIndex];
 prp_Vipiska_LargeButton.Caption     :=  st_ConstUnit.st_prp_Vipisat[PLanguageIndex];
 prp_CancelAll_LargeButton.Caption   :=  st_ConstUnit.st_Cancel[PLanguageIndex];

 prp_SaveAll_LargeButton.Hint     :=  st_ConstUnit.st_SafeNExit[PLanguageIndex];
 prp_History_LargeButton.Hint     :=  st_ConstUnit.st_prp_History[PLanguageIndex];
 prp_Prodlenie_LargeButton.Hint   :=  st_ConstUnit.st_prp_Prodovg[PLanguageIndex];
 prp_Vipiska_LargeButton.Hint     :=  st_ConstUnit.st_prp_Vipisat[PLanguageIndex];
 prp_CancelAll_LargeButton.Hint   :=  st_ConstUnit.st_Cancel[PLanguageIndex];

 prp_Additional_Sheet.Caption        :=  st_ConstUnit.st_prp_Dopovnenn[PLanguageIndex];
 prp_BornPlace_Sheet.Caption         :=  st_ConstUnit.st_prp_MisceNarodgen[PLanguageIndex];
 prp_Daddy_Sheet.Caption             :=  st_ConstUnit.st_prp_Batko[PLanguageIndex];
 prp_FamilyStatus_Sheet.Caption      :=  st_ConstUnit.st_prp_SimStan[PLanguageIndex];
 prp_MultiPass_Sheet.Caption         :=  st_ConstUnit.st_prp_Pass[PLanguageIndex];
 prp_Mummi_Sheet.Caption             :=  st_ConstUnit.st_prp_Mati[PLanguageIndex];
 prp_Propiska_Sheet.Caption          :=  st_ConstUnit.st_prp_Propiska[PLanguageIndex];
 prp_Vip_Dopolnenie_Sheet.Caption    :=  st_ConstUnit.st_prp_Dopovnenn[PLanguageIndex];
 prp_Vipiska_Sheet.Caption           :=  st_ConstUnit.st_prp_Vipiska[PLanguageIndex];
 prp_Warrior_Sheet.Caption           :=  st_ConstUnit.st_prp_ViyskOblik[PLanguageIndex];

 prp_BornPlace_GroupBox.Caption      :=  st_ConstUnit.st_prp_MestoNarodg[PLanguageIndex];
 prp_Country_Label.Caption           :=  st_ConstUnit.st_prp_Kraina[PLanguageIndex];
 prp_Rayon_Label.Caption             :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];
 prp_Index_Label.Caption             :=  st_ConstUnit.st_prp_Index[PLanguageIndex];
 prp_Selo_Label.Caption              :=  st_ConstUnit.st_prp_Selo[PLanguageIndex];

 prp_Propiska_GroupBox.Caption        :=  st_ConstUnit.st_prp_WhosPropi[PLanguageIndex];
 prp_Strana_Label.Caption             :=  st_ConstUnit.st_prp_Kraina[PLanguageIndex];
 RayonLabel.Caption                   :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];
 IndexLabel.Caption                   :=  st_ConstUnit.st_prp_Index[PLanguageIndex];
 RayonDonLabel.Caption                :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];
 StrretDonLabel.Caption               :=  st_ConstUnit.st_prp_Vyliza[PLanguageIndex];
 HomeDonLabel.Caption                 :=  st_ConstUnit.st_prp_Bydinok[PLanguageIndex];
 RoomDonLabel.Caption                 :=  st_ConstUnit.st_prp_Kvartira[PLanguageIndex];
 DateIncomeDonLabel.Caption           :=  st_ConstUnit.st_prp_DataPribytiya[PLanguageIndex];
 prp_CurrentPropiska_GroupBox.Caption :=  st_ConstUnit.st_prp_Poto4naPropiska[PLanguageIndex];
 BegPropiLabel.Caption                :=  st_ConstUnit.st_prp_Po4atokPropiski[PLanguageIndex];
 EndPropiLabel.Caption                :=  st_ConstUnit.st_prp_Zakin4ennyaProp[PLanguageIndex];
 AdresPropiLabel.Caption              :=  st_ConstUnit.st_prp_AdresaPropiski[PLanguageIndex];
 prp_Selo_Label2.Caption              :=  st_ConstUnit.st_prp_Selo[PLanguageIndex];
 Home_Label2.Caption                  :=  st_ConstUnit.st_prp_Bydinok[PLanguageIndex];
 RoomLabel2.Caption                   :=  st_ConstUnit.st_prp_Kvartira[PLanguageIndex];
 Date_Income_Label.Caption            :=  st_ConstUnit.st_prp_DataPribytiya[PLanguageIndex];
 prp_DateOfBorn_Label.Caption         :=  st_ConstUnit.st_DateBorn[PLanguageIndex];

 prp_Adittional_GroupBox.Caption      :=  st_ConstUnit.st_prp_add_Info[PLanguageIndex];
 MestoYbitiya_Label.Caption           :=  st_ConstUnit.st_prp_add_ProgYMisti[PLanguageIndex];
 BaseResonPriezd_Label.Caption        :=  st_ConstUnit.st_prp_add_BasicResonPriizd[PLanguageIndex];
 Srok_Label.Caption                   :=  st_ConstUnit.st_prp_add_Strok[PLanguageIndex];
 BaseResonPereezd_Label.Caption       :=  st_ConstUnit.st_prp_add_BasicResonPereizd[PLanguageIndex];
 GdeRabotal_Label.Caption             :=  st_ConstUnit.st_prp_add_GdeRab[PLanguageIndex];
 prp_dp_Dolgnost_Label.Caption        :=  st_ConstUnit.st_prp_add_Posada[PLanguageIndex];
 Obrazovanie_Label.Caption            :=  st_ConstUnit.st_prp_add_Osvita[PLanguageIndex];
 U4Stepen_Label.Caption               :=  st_ConstUnit.st_prp_add_VchenStypin[PLanguageIndex];
 Gragdanstvo_Label.Caption            :=  st_ConstUnit.st_prp_add_Gromadyanstvo[PLanguageIndex];
 Nazionalnost_Label.Caption           :=  st_ConstUnit.st_prp_add_Nationality[PLanguageIndex];
 DomPhone_Label.Caption               :=  st_ConstUnit.st_prp_add_HomePhone[PLanguageIndex];

 prp_Warrior_GroupBox.Caption         :=  st_ConstUnit.st_prp_warrior_VO[PLanguageIndex];
 FromRVK_Label.Caption                :=  st_ConstUnit.st_prp_warrior_FromRVK[PLanguageIndex];
 Postavlen_Label.Caption              :=  st_ConstUnit.st_prp_warrior_Postavlen[PLanguageIndex];
 Snyat_Label.Caption                  :=  st_ConstUnit.st_prp_warrior_Snyat[PLanguageIndex];
 Notes_Label.Caption                  :=  st_ConstUnit.st_prp_warrior_Notes[PLanguageIndex];

 prp_MultiPass_GroupBox.Caption       :=  st_ConstUnit.st_prp_pass_Pass[PLanguageIndex];
 prp_PassGroupBox.Caption             :=  st_ConstUnit.st_prp_pass_History[PLanguageIndex];
 PassVidan_Label.Caption              :=  st_ConstUnit.st_prp_pass_Vidan[PLanguageIndex];
 DatePass_Label.Caption               :=  st_ConstUnit.st_prp_pass_Date[PLanguageIndex];
 prp_pass_Type_GridColumn.Caption     :=  st_ConstUnit.st_prp_pass_Type[PLanguageIndex];
 prp_pass_Fio_GridColumn.Caption      :=  st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 prp_pass_Seriya_GridColumn.Caption   :=  st_ConstUnit.st_prp_pass_Seriya[PLanguageIndex];
 prp_pass_Nomer_GridColumn.Caption    :=  st_ConstUnit.st_prp_pass_Nomer[PLanguageIndex];

 prp_Daddy_GroupBox.Caption    :=  st_ConstUnit.st_prp_Dad[PLanguageIndex];
 f_Fam_Label.Caption           :=  st_ConstUnit.st_Fam[PLanguageIndex];
 f_Name_Label.Caption          :=  st_ConstUnit.st_Name[PLanguageIndex];
 f_Otch_Label.Caption          :=  st_ConstUnit.st_Otch[PLanguageIndex];
 f_Work_Label.Caption          :=  st_ConstUnit.st_prp_WorkPlace[PLanguageIndex];
 f_Posada_Label.Caption        :=  st_ConstUnit.st_prp_add_Posada[PLanguageIndex];
 f_Phone_Label.Caption         :=  st_ConstUnit.st_prp_WorkPhone[PLanguageIndex];
 f_Oblast_Label.Caption        :=  st_ConstUnit.st_prp_Oblast[PLanguageIndex];
 f_Street_Label.Caption        :=  st_ConstUnit.st_prp_Vyliza[PLanguageIndex];
 f_Home_Label.Caption          :=  st_ConstUnit.st_prp_Bydinok[PLanguageIndex];
 f_Room_Label.Caption          :=  st_ConstUnit.st_prp_Kvartira[PLanguageIndex];
 f_Rayon_Label.Caption         :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];

 prp_Mummi_GroupBox.Caption    :=  st_ConstUnit.st_prp_Mom[PLanguageIndex];
 m_Fam_Label.Caption           :=  st_ConstUnit.st_Fam[PLanguageIndex];
 m_Name_Label.Caption          :=  st_ConstUnit.st_Name[PLanguageIndex];
 m_Otch_Label.Caption          :=  st_ConstUnit.st_Otch[PLanguageIndex];
 m_Work_Label.Caption          :=  st_ConstUnit.st_prp_WorkPlace[PLanguageIndex];
 m_Posada_Label.Caption        :=  st_ConstUnit.st_prp_add_Posada[PLanguageIndex];
 m_Phone_Label.Caption         :=  st_ConstUnit.st_prp_WorkPhone[PLanguageIndex];
 m_Oblast_Label.Caption        :=  st_ConstUnit.st_prp_Oblast[PLanguageIndex];
 m_Street_Label.Caption        :=  st_ConstUnit.st_prp_Vyliza[PLanguageIndex];
 m_Home_Label.Caption          :=  st_ConstUnit.st_prp_Bydinok[PLanguageIndex];
 m_Room_Label.Caption          :=  st_ConstUnit.st_prp_Kvartira[PLanguageIndex];
 m_Rayon_Label.Caption         :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];

 prp_FamilyStatus_GroupBox.Caption     :=  st_ConstUnit.st_prp_SimStanEx[PLanguageIndex];
 Stan_Label.Caption                    :=  st_ConstUnit.st_prp_SimStanEx[PLanguageIndex];
 prp_fs_Vmeste_CheckBox.Properties.Caption        :=  st_ConstUnit.st_prp_Both[PLanguageIndex];
 prp_fs_GroupBox.Caption               :=  st_ConstUnit.st_prp_Kinder[PLanguageIndex];
 cxGroupBox1.Caption                   :=  st_ConstUnit.st_prp_RodstvSvyaz[PLanguageIndex];
 prp_Children_Column.Caption           :=  st_ConstUnit.st_prp_KinderFIO[PLanguageIndex];
 prp_Sex_Column.Caption                :=  st_ConstUnit.st_prp_Sex[PLanguageIndex];
 prp_DateChildBorn_Column.Caption      :=  st_ConstUnit.st_DateBorn[PLanguageIndex];
 fio.Caption                           :=  st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 name_rel.Caption                      :=  st_ConstUnit.st_prp_TypeRS[PLanguageIndex];

 prp_vip_GroupBox.Caption              :=  st_ConstUnit.st_vip_Vip[PLanguageIndex];
 vip_Strana_Label.Caption              :=  st_ConstUnit.st_prp_Kraina[PLanguageIndex];
 vip_Rayon_Label.Caption               :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];
 vip_Index_Label.Caption               :=  st_ConstUnit.st_prp_Index[PLanguageIndex];
 vip_Selo_Label.Caption                :=  st_ConstUnit.st_prp_Selo[PLanguageIndex];
 vip_DateVip_Label.Caption             :=  st_ConstUnit.st_vip_DateVip[PLanguageIndex];
 prp_vip_ToDonezk_CheckBox.Properties.Caption :=  st_ConstUnit.st_vip_ToTown[PLanguageIndex];
 vip_don_Rayon_Label.Caption           :=  st_ConstUnit.st_prp_Rayon[PLanguageIndex];
 vip_don_Street_Label.Caption          :=  st_ConstUnit.st_prp_Vyliza[PLanguageIndex];
 vip_don_Home_Label.Caption            :=  st_ConstUnit.st_prp_Bydinok[PLanguageIndex];
 vip_don_Room_Label.Caption            :=  st_ConstUnit.st_prp_Kvartira[PLanguageIndex];

 prp_vip_dp_GroupBox.Caption               :=  st_ConstUnit.st_vip_AddInfo[PLanguageIndex];
 vip_add_BasePereezdReson_Label.Caption    :=  st_ConstUnit.st_vip_ResonPereezd[PLanguageIndex];
 vip_add_GdeRabotal_Label.Caption          :=  st_ConstUnit.st_prp_add_GdeRab[PLanguageIndex];
 vip_add_Dolgnost_Label.Caption            :=  st_ConstUnit.st_prp_add_Posada[PLanguageIndex];
 vip_add_Obrazovanie_Label.Caption         :=  st_ConstUnit.st_prp_add_Osvita[PLanguageIndex];
 vip_add_U4Stepen_Label.Caption            :=  st_ConstUnit.st_prp_add_VchenStypin[PLanguageIndex];
 IfNotWork_Label.Caption                   :=  st_ConstUnit.st_prp_EslinerabotalTo[PLanguageIndex];

 ckbxProdlitPropi.Properties.Caption                   :=  st_ConstUnit.st_PropProdleniePinudit[PLanguageIndex];


 // чтобы определить город для прописки
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:= 'SELECT * FROM ST_PRP_SYS_FROM_TOWN_SELECT';
 ReadDataSet.Open;
 prp_prp_FromDonezk_CheckBox.Properties.Caption := ReadDataSet.fieldbyName('TOWN').asString;
 Donezk_GroupBox.Caption :=  ReadDataSet.fieldbyName('FROM_TOWN').asString;
 vip_Donezk_GroupBox.Caption := ReadDataSet.fieldbyName('TOWN').asString;
 prp_vip_ToDonezk_CheckBox.Properties.Caption := prp_vip_ToDonezk_CheckBox.Properties.Caption + ReadDataSet.fieldbyName('TOWN').asString;
 ReadDataSet.Close;
end;




procedure TfrmPropiska.prp_zz_DizzableAll(Mode: string);
begin
 if mode = 'disable' then
      begin
       //  задизабленый
                              // изменение цвета прописки
                       prp_prp_Country_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Oblast_ComboBox.Style.Color:= clBtnFace;
                       prp_prp_Oblast_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Rayon_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_RAJ_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_DateIncome.Style.Color:= clBtnFace;
                       prp_prp_DateBegPropi.Style.Color:= clBtnFace;
                       prp_prp_DateEndPropi.Style.Color:= clBtnFace;
                       prp_AdresPropi_Edit.Style.Color:= clBtnFace;
                       prp_prp_HouseNumber_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_HOUSE_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Index_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_KvartNumber_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_KVART_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Selo_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Street_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_STREET_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Gorod_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                       prp_prp_DATE_PRIB_DateEdit.Style.Color:= clBtnFace;

                      // изменение цвета в дополнительно
                       prp_dp_DateMestoUbitiya.Style.Color:= clBtnFace;
                       prp_dp_ResonPriezd_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_Srok_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_ResonPereezd_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_GdeRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_KemRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_Dolgnost_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_Osvita_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_UchStepen_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_Gragdanstvo_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_Nazionalnost_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_DomTelefon_MaskEdit.Style.Color:= clBtnFace;

                      // место рождения
                      prp_mg_Country_TextEdit.Style.Color:= clBtnFace;
                      prp_mg_Oblast_ComboBox.Style.Color:= clBtnFace;
                      prp_mg_Oblast_TextEdit.Style.Color:= clBtnFace;
                      prp_mg_Rayon_TextEdit.Style.Color:= clBtnFace;
                      prp_mg_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                      prp_mg_Gorod_TextEdit.Style.Color:= clBtnFace;
                      prp_mg_Index_TextEdit.Style.Color:= clBtnFace;
                      prp_mg_Selo_TextEdit.Style.Color:= clBtnFace;

                      // воинский учет
                      prp_vu_FromRVK_TextEdit.Style.Color:= clBtnFace;
                      prp_vu_PostavlenDate.Style.Color:= clBtnFace;
                      prp_vu_SnyatDate.Style.Color:= clBtnFace;
                      prp_vu_Notes.Style.Color:= clBtnFace;

                      // паспорт
                      prp_PaspGridTableView.Styles.Background.Color:= clBtnFace;
                      prp_PaspGridTableView.Styles.Content.Color:= clBtnFace;

                      // отец
                      prp_f_Familia_Edit.Style.Color:= clBtnFace;
                      prp_f_Name_Edit.Style.Color:= clBtnFace;
                      prp_f_Otch_Edit.Style.Color:= clBtnFace;
                      prp_f_MestoRaboti_TextEdit.Style.Color:= clBtnFace;
                      prp_f_Dolgnost_TextEdit.Style.Color:= clBtnFace;
                      prp_f_WorkTelefon_MaskEdit.Style.Color:= clBtnFace;
                      prp_f_Oblast_TextEdit.Style.Color:= clBtnFace;
                      prp_f_Rayon_TextEdit.Style.Color:= clBtnFace;
                      prp_f_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                      prp_f_GorodSeloPGT_TextEdit.Style.Color:= clBtnFace;
                      prp_f_Street_TextEdit.Style.Color:= clBtnFace;
                      prp_f_HouseNumber_TextEdit.Style.Color:= clBtnFace;
                      prp_f_KvartNumber_TextEdit.Style.Color:= clBtnFace;

                      // мать
                      prp_m_Familia_Edit.Style.Color:= clBtnFace;
                      prp_m_Name_Edit.Style.Color:= clBtnFace;
                      prp_m_Otch_Edit.Style.Color:= clBtnFace;
                      prp_m_MestoRaboti_TextEdit.Style.Color:= clBtnFace;
                      prp_m_Dolgnost_TextEdit.Style.Color:= clBtnFace;
                      prp_m_WorkTelefon_MaskEdit.Style.Color:= clBtnFace;
                      prp_m_Oblast_TextEdit.Style.Color:= clBtnFace;
                      prp_m_Rayon_TextEdit.Style.Color:= clBtnFace;
                      prp_m_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                      prp_m_GorodSeloPGT_TextEdit.Style.Color:= clBtnFace;
                      prp_m_Street_TextEdit.Style.Color:= clBtnFace;
                      prp_m_HouseNumber_TextEdit.Style.Color:= clBtnFace;
                      prp_m_KvartNumber_TextEdit.Style.Color:= clBtnFace;

                      // семейное положение
                      prp_fs_SimStan_ComboBox.Style.Color:= clBtnFace;
                      prp_GridTableView.Styles.Background.Color:= clBtnFace;
                      prp_Rodstv_GridTableView.Styles.Content.Color:= clBtnFace;

                      // выписка
                      if prp_Vipiska_Sheet.TabVisible then
                      begin
                       prp_vip_Country_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_Oblast_ComboBox.Style.Color:= clBtnFace;
                       prp_vip_Oblast_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_Rayon_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                       prp_vip_Gorod_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_Index_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_Selo_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_STREET_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_HOUSE_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_KVARTIRA_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_DateIncome.Style.Color:= clBtnFace;
                       prp_vip_RAJ_D_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_STREET_D_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_HOUSE_D_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_KVART_D_TextEdit.Style.Color:= clBtnFace;
                      end;

                      // выписка - дополнительно
                      if prp_Vip_Dopolnenie_Sheet.TabVisible then
                      begin
                       prp_vip_ResonPereezd_ComboBox.Style.Color:= clBtnFace;
                       prp_vip_GdeRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_KemRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_vip_Osvita_ComboBox.Style.Color:= clBtnFace;
                       prp_vip_UchStepen_ComboBox.Style.Color:= clBtnFace;
                      end;
      end
      else
      begin
       //раздизабленый
                       // изменение цвета прописки
                       prp_prp_Country_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Oblast_ComboBox.Style.Color:= clInfoBk;
                       prp_prp_Oblast_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Rayon_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_RAJ_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_DateIncome.Style.Color:= clInfoBk;
                       prp_prp_DateBegPropi.Style.Color:= clInfoBk;
                       prp_prp_DateEndPropi.Style.Color:= clInfoBk;
                       prp_AdresPropi_Edit.Style.Color:= clInfoBk;
                       prp_prp_HouseNumber_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_HOUSE_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Index_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_KvartNumber_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_KVART_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Selo_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Street_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_STREET_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Gorod_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                       prp_prp_DATE_PRIB_DateEdit.Style.Color:= clInfoBk;
                      // изменение цвета в дополнительно

                       prp_dp_DateMestoUbitiya.Style.Color:= clInfoBk;
                       prp_dp_ResonPriezd_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_Srok_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_ResonPereezd_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_GdeRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_KemRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_Dolgnost_ComboBox.Style.Color:=   clInfoBk;
                       prp_dp_Osvita_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_UchStepen_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_Gragdanstvo_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_Nazionalnost_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_DomTelefon_MaskEdit.Style.Color:= clInfoBk;

                      // место рождения
                      prp_mg_Country_TextEdit.Style.Color:= clInfoBk;
                      prp_mg_Oblast_ComboBox.Style.Color:= clInfoBk;
                      prp_mg_Oblast_TextEdit.Style.Color:= clInfoBk;
                      prp_mg_Rayon_TextEdit.Style.Color:= clInfoBk;
                      prp_mg_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                      prp_mg_Gorod_TextEdit.Style.Color:= clInfoBk;
                      prp_mg_Index_TextEdit.Style.Color:= clInfoBk;
                      prp_mg_Selo_TextEdit.Style.Color:= clInfoBk;

                      // воинский учет
                      prp_vu_FromRVK_TextEdit.Style.Color:= clInfoBk;
                      prp_vu_PostavlenDate.Style.Color:= clInfoBk;
                      prp_vu_SnyatDate.Style.Color:= clInfoBk;
                      prp_vu_Notes.Style.Color:= clInfoBk;

                      // паспорт
                      prp_PaspGridTableView.Styles.Background.Color:= clInfoBk;
                      prp_PaspGridTableView.Styles.Content.Color:= clInfoBk;

                                            // отец
                      prp_f_Familia_Edit.Style.Color:= clInfoBk;
                      prp_f_Name_Edit.Style.Color:= clInfoBk;
                      prp_f_Otch_Edit.Style.Color:= clInfoBk;
                      prp_f_MestoRaboti_TextEdit.Style.Color:= clInfoBk;
                      prp_f_Dolgnost_TextEdit.Style.Color:= clInfoBk;
                      prp_f_WorkTelefon_MaskEdit.Style.Color:= clInfoBk;
                      prp_f_Oblast_TextEdit.Style.Color:= clInfoBk;
                      prp_f_Rayon_TextEdit.Style.Color:= clInfoBk;
                      prp_f_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                      prp_f_GorodSeloPGT_TextEdit.Style.Color:= clInfoBk;
                      prp_f_Street_TextEdit.Style.Color:= clInfoBk;
                      prp_f_HouseNumber_TextEdit.Style.Color:= clInfoBk;
                      prp_f_KvartNumber_TextEdit.Style.Color:= clInfoBk;

                      // мать
                      prp_m_Familia_Edit.Style.Color:= clInfoBk;
                      prp_m_Name_Edit.Style.Color:= clInfoBk;
                      prp_m_Otch_Edit.Style.Color:= clInfoBk;
                      prp_m_MestoRaboti_TextEdit.Style.Color:= clInfoBk;
                      prp_m_Dolgnost_TextEdit.Style.Color:= clInfoBk;
                      prp_m_WorkTelefon_MaskEdit.Style.Color:= clInfoBk;
                      prp_m_Oblast_TextEdit.Style.Color:= clInfoBk;
                      prp_m_Rayon_TextEdit.Style.Color:= clInfoBk;
                      prp_m_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                      prp_m_GorodSeloPGT_TextEdit.Style.Color:= clInfoBk;
                      prp_m_Street_TextEdit.Style.Color:= clInfoBk;
                      prp_m_HouseNumber_TextEdit.Style.Color:= clInfoBk;
                      prp_m_KvartNumber_TextEdit.Style.Color:= clInfoBk;


                      // семейное положение
                      prp_fs_SimStan_ComboBox.Style.Color:= clInfoBk;
                      prp_GridTableView.Styles.Background.Color:= clInfoBk;
                      prp_Rodstv_GridTableView.Styles.Content.Color:= clInfoBk;

                      // выписка
                      if prp_Vipiska_Sheet.TabVisible then
                      begin
                       prp_vip_Country_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_Oblast_ComboBox.Style.Color:= clInfoBk;
                       prp_vip_Oblast_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_Rayon_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                       prp_vip_Gorod_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_Index_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_Selo_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_STREET_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_HOUSE_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_KVARTIRA_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_DateIncome.Style.Color:= clInfoBk;
                       prp_vip_RAJ_D_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_STREET_D_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_HOUSE_D_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_KVART_D_TextEdit.Style.Color:= clInfoBk;
                      end;

                      // выписка - дополнительно
                      if prp_Vip_Dopolnenie_Sheet.TabVisible then
                      begin
                       prp_vip_ResonPereezd_ComboBox.Style.Color:= clInfoBk;
                       prp_vip_GdeRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_KemRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_vip_Osvita_ComboBox.Style.Color:= clInfoBk;
                       prp_vip_UchStepen_ComboBox.Style.Color:= clInfoBk;
                      end;

      end;
end;


procedure TfrmPropiska.FormCreate(Sender: TObject);
begin
  FormIniLanguage();

  with  prp_GridTableView do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with  prp_PaspGridTableView do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[2].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[7].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[10].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with  prp_Rodstv_GridTableView do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[2].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[3].DataBinding.ValueTypeClass := TcxLargeIntValueType;
   end;

  ProdlenieMode :=false;
end;

procedure TfrmPropiska.prp_fs_AddButtonClick(Sender: TObject);
begin
frm_Propiska_AddChildren:= Tfrm_Propiska_AddChildren.create(self);
frm_Propiska_AddChildren.Caption :=  st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
frm_Propiska_AddChildren.Fam_Label.Caption :=   st_ConstUnit.st_Fam[PLanguageIndex];
frm_Propiska_AddChildren.Name_Label.Caption :=  st_ConstUnit.st_Name[PLanguageIndex];
frm_Propiska_AddChildren.Otch_Label.Caption :=  st_ConstUnit.st_Otch[PLanguageIndex];
frm_Propiska_AddChildren.DateBorn_Label.Caption :=  st_ConstUnit.st_DateBorn[PLanguageIndex];
frm_Propiska_AddChildren.Sex_Label.Caption :=  st_ConstUnit.st_prp_Sex[PLanguageIndex];
frm_Propiska_AddChildren.OkButton.Caption :=    st_ConstUnit.st_Accept[PLanguageIndex];
frm_Propiska_AddChildren.CancelButton.Caption :=st_ConstUnit.st_Cancel[PLanguageIndex];

frm_Propiska_AddChildren.prp_PolChild_ComboBox.ItemIndex:=0;

if frm_Propiska_AddChildren.ShowModal = mrOk then begin
  prp_GridTableView.DataController.RecordCount := prp_GridTableView.DataController.RecordCount + 1;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 0] := frm_Propiska_AddChildren.prp_FamiliaChild_Edit.Text+' '+frm_Propiska_AddChildren.prp_NameChild_Edit.Text+ ' '+frm_Propiska_AddChildren.prp_OtchChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 1] := frm_Propiska_AddChildren.prp_PolChild_ComboBox.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 2] := frm_Propiska_AddChildren.prp_ChildBorn_Date.Date;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 3] := frm_Propiska_AddChildren.prp_NameChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 4] := frm_Propiska_AddChildren.prp_OtchChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.RecordCount - 1, 5] := frm_Propiska_AddChildren.prp_FamiliaChild_Edit.Text;

  prp_fs_EditButton.Enabled := true;
  prp_fs_DeleteButton.Enabled := true;
  prp_GridTableView.DataController.FocusedRecordIndex:=prp_GridTableView.DataController.RecordCount - 1;
end;

end;

procedure TfrmPropiska.prp_fs_EditButtonClick(Sender: TObject);
begin
 frm_Propiska_AddChildren:= Tfrm_Propiska_AddChildren.create(self);
frm_Propiska_AddChildren.Caption :=  st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
frm_Propiska_AddChildren.Fam_Label.Caption :=   st_ConstUnit.st_Fam[PLanguageIndex];
frm_Propiska_AddChildren.Name_Label.Caption :=  st_ConstUnit.st_Name[PLanguageIndex];
frm_Propiska_AddChildren.Otch_Label.Caption :=  st_ConstUnit.st_Otch[PLanguageIndex];
frm_Propiska_AddChildren.DateBorn_Label.Caption :=  st_ConstUnit.st_DateBorn[PLanguageIndex];
frm_Propiska_AddChildren.Sex_Label.Caption :=  st_ConstUnit.st_prp_Sex[PLanguageIndex];
frm_Propiska_AddChildren.OkButton.Caption :=    st_ConstUnit.st_Accept[PLanguageIndex];
frm_Propiska_AddChildren.CancelButton.Caption :=st_ConstUnit.st_Cancel[PLanguageIndex];

 frm_Propiska_AddChildren.prp_FamiliaChild_Edit.Text:=prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex, 5];
 frm_Propiska_AddChildren.prp_NameChild_Edit.Text:=prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex, 3];
 frm_Propiska_AddChildren.prp_OtchChild_Edit.Text:=prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex, 4];
 frm_Propiska_AddChildren.prp_ChildBorn_Date.date:=prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex, 2];
 if prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex, 1] = 'М' then
 frm_Propiska_AddChildren.prp_PolChild_ComboBox.ItemIndex:=0
 else frm_Propiska_AddChildren.prp_PolChild_ComboBox.ItemIndex:=1;

 if frm_Propiska_AddChildren.ShowModal = mrOK then begin
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 0] := frm_Propiska_AddChildren.prp_FamiliaChild_Edit.Text+' '+frm_Propiska_AddChildren.prp_NameChild_Edit.Text+ ' '+frm_Propiska_AddChildren.prp_OtchChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 1] := frm_Propiska_AddChildren.prp_PolChild_ComboBox.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 2] := frm_Propiska_AddChildren.prp_ChildBorn_Date.Date;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 5] := frm_Propiska_AddChildren.prp_FamiliaChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 3] := frm_Propiska_AddChildren.prp_NameChild_Edit.Text;
  prp_GridTableView.DataController.Values[prp_GridTableView.DataController.FocusedRecordIndex , 4] := frm_Propiska_AddChildren.prp_OtchChild_Edit.Text;
  end;
  end;

procedure TfrmPropiska.prp_fs_DeleteButtonClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
prp_GridTableView.DataController.DeleteFocused;
prp_GridTableView.DataController.FocusedRowIndex:=prp_GridTableView.DataController.RecordCount - 1;

if prp_GridTableView.DataController.RecordCount = 0 then
begin
prp_fs_DeleteButton.Enabled:=false;
prp_fs_EditButton.Enabled:=false;
end;
end;

procedure TfrmPropiska.prp_CancelAll_LargeButtonClick(Sender: TObject);
begin
close;
end;

// процедура записи СЕМЕЙНОГО ПОЛОЖЕНИЯ----------------------------------------------------------------------------------
procedure TfrmPropiska.FamilyStatus_Write; 
var i: Smallint;
begin
screen.Cursor:=crHourGlass;

  // работаем с таблицей прописки
  if  prp_fs_SimStan_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_STAN_BY_NAME('+ kav+prp_fs_SimStan_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_fs_BEFO_STAN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

if ((prp_END_PROPIS<> null) and (prp_END_PROPIS <> 0))  then
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_FS_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
 // ParamByName('BEG_PROPIS').AsDate:= prp_BEG_PROPIS;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;
  if prp_fs_BEFO_STAN <> null then
  ParamByName('BEFO_STAN').AsInteger:=prp_fs_BEFO_STAN;
  if prp_fs_Vmeste_CheckBox.Checked then
  ParamByName('BEFO_VMESTE').AsInteger:=1
  else ParamByName('BEFO_VMESTE').AsInteger:=0;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end
else
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_FS_BY_ID_KOD_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  if prp_fs_BEFO_STAN <> null then
  ParamByName('BEFO_STAN').AsInteger:=prp_fs_BEFO_STAN;
  if prp_fs_Vmeste_CheckBox.Checked then
  ParamByName('BEFO_VMESTE').AsInteger:=1
  else ParamByName('BEFO_VMESTE').AsInteger:=0;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end;
  // работаем с таблицей детей
  // сначала удаляем все записи про детей по данному ид.коду

if prp_GridTableView.DataController.RecordCount =0 then
begin
With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_PROPI_CHILD_DELETE';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
exit;
end;


With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_PROPI_CHILD_DELETE';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ExecProc;

  //после чего добавляем их заново
  for i := 0 to prp_GridTableView.DataController.RecordCount - 1 do begin
  StoredProcName := 'ST_PROPI_CHILD_INSERT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('FAMILIYA').AsString := prp_GridTableView.DataController.Values[i, 5];
  ParamByName('IMYA').AsString := prp_GridTableView.DataController.Values[i, 3];
  ParamByName('OTCHESTVO').AsString := prp_GridTableView.DataController.Values[i, 4];
  ParamByName('DATE_R').AsDate := prp_GridTableView.DataController.Values[i, 2];
  ParamByName('POL').AsString := prp_GridTableView.DataController.Values[i, 1];
  ExecProc;
  end;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
screen.Cursor:=crDefault;
end;
//----------------------------------------------------------------------------------------------------------------

procedure TfrmPropiska.FamilyRelations_Write;
var i: integer;
begin
  // сначала удаляем все записи по данному ид.коду
screen.Cursor:=crHourGlass;

if prp_Rodstv_GridTableView.DataController.RecordCount =0 then
begin
With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_FAMILY_DELETE';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
exit;
end;


With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_FAMILY_DELETE';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ExecProc;

  //после чего добавляем их заново
  for i := 0 to prp_Rodstv_GridTableView.DataController.RecordCount - 1 do begin
  StoredProcName := 'ST_DT_FAMILY_INSERT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('ID_TYPE_FEM_REL').AsInteger := prp_Rodstv_GridTableView.DataController.Values[i, 2];
  ParamByName('ID_FAMILY_KOD').AsInt64 := prp_Rodstv_GridTableView.DataController.Values[i, 3];
  //ParamByName('ID_STAN').AsInteger := inttostr(frmPropiska.prp_fs_BEFO_STAN); //prp_fs_BEFO_STAN;
  if prp_fs_Vmeste_CheckBox.Checked then
      ParamByName('ID_VMESTE').AsInteger:=1
  else
      ParamByName('ID_VMESTE').AsInteger:=0;
  ExecProc;
  end;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Father_Write;
begin
  screen.Cursor:=crHourGlass;

  if prp_f_GorodSeloPGT_ComboBox.Text <> '' then
   begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_TOWN_PARENTS_BY_NAME('+ kav+prp_f_GorodSeloPGT_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_F_NOM_P:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

  With WriteProc do
  begin
   Transaction.StartTransaction;
   //... мы провожаем ПААААПУ !!!!!!....... гыч :)
   StoredProcName := 'ST_PROPI_RODIT_F_INSUPD';
   Prepare;
   ParamByName('ID_KOD').AsInt64 := edit_item_id;
   ParamByName('F_PUNKT').AsString:= prp_f_GorodSeloPGT_TextEdit.Text;
   ParamByName('F_NOM_P').asinteger:= prp_F_NOM_P;
   ParamByName('F_RAJ').AsString:=prp_f_Rayon_TextEdit.Text;
   ParamByName('F_TEL').AsString:= prp_f_WorkTelefon_MaskEdit.Text;
   //ParamByName('F_INDEX').asinteger:=
   ParamByName('F_FAM').AsString:= prp_f_Familia_Edit.Text;
   ParamByName('F_IMYA').AsString:=prp_f_Name_Edit.Text;
   ParamByName('F_OT').AsString:= prp_f_Otch_Edit.Text;
   ParamByName('F_MESTO').AsString:=prp_f_MestoRaboti_TextEdit.Text;
   ParamByName('F_DOL').AsString:=prp_f_Dolgnost_TextEdit.Text;
   ParamByName('F_OBL').AsString:=prp_f_Oblast_TextEdit.Text;
   ParamByName('F_STREET').AsString:=prp_f_Street_TextEdit.Text;
   ParamByName('F_HOUSE').AsString:=prp_f_HouseNumber_TextEdit.Text;
   ParamByName('F_KVART').AsString:=prp_f_KvartNumber_TextEdit.Text;
   ExecProc;
   try
    Transaction.Commit;
    Close;
   except
    Transaction.Rollback;
    close;
   end;
  end;

  screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Muther_Write;
begin
screen.Cursor:=crHourGlass;
if  prp_m_GorodSeloPGT_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_TOWN_PARENTS_BY_NAME('+ kav+prp_m_GorodSeloPGT_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_M_NOM_P:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
  With WriteProc do
  begin
  Transaction.StartTransaction;
  //... мы провожаем МАМММММУ !!!!!!....... гыч :)
  StoredProcName := 'ST_PROPI_RODIT_M_INSUPD';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('M_PUNKT').AsString:= prp_m_GorodSeloPGT_TextEdit.Text;
  ParamByName('M_NOM_P').asinteger:= prp_M_NOM_P;
  ParamByName('M_RAJ').AsString:=prp_m_Rayon_TextEdit.Text;
  ParamByName('M_TEL').AsString:= prp_m_WorkTelefon_MaskEdit.Text;
//ParamByName('M_INDEX').asinteger:=
  ParamByName('M_FAM').AsString:= prp_m_Familia_Edit.Text;
  ParamByName('M_IMYA').AsString:=prp_m_Name_Edit.Text;
  ParamByName('M_OT').AsString:= prp_m_Otch_Edit.Text;
  ParamByName('M_MESTO').AsString:=prp_m_MestoRaboti_TextEdit.Text;
  ParamByName('M_DOL').AsString:=prp_m_Dolgnost_TextEdit.Text;
  ParamByName('M_OBL').AsString:=prp_m_Oblast_TextEdit.Text;
  ParamByName('M_STREET').AsString:=prp_m_Street_TextEdit.Text;
  ParamByName('M_HOUSE').AsString:=prp_m_HouseNumber_TextEdit.Text;
  ParamByName('M_KVART').AsString:=prp_m_KvartNumber_TextEdit.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Additional_Write;
begin
screen.Cursor:=crHourGlass;
if  prp_dp_ResonPereezd_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_RESON_BY_NAME('+ kav+prp_dp_ResonPereezd_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_dp_BEFO_META:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_dp_Osvita_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_OSVITA_BY_NAME('+ kav+prp_dp_Osvita_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_dp_BEFO_OSVITA:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_dp_UchStepen_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_STUPEN_BY_NAME('+ kav+prp_dp_UchStepen_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_dp_BEFO_STUPEN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

       prp_dp_BEFO_BUZY:=-1;

if  ((prp_dp_Dolgnost_ComboBox.Visible) and (prp_dp_Dolgnost_ComboBox.ItemIndex<> -1)) then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_BUSY_BY_NAME('+ kav+prp_dp_Dolgnost_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_dp_BEFO_BUZY:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if ((prp_END_PROPIS<> null) and (prp_END_PROPIS <> 0))  then
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_DP_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
 // ParamByName('BEG_PROPIS').AsDate:= prp_BEG_PROPIS;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;

 if (((prp_dp_BEFO_BUZY <>-1) and (prp_dp_BEFO_BUZY <> 0 )) and(prp_dp_BEFO_BUZY <> null)) then
  ParamByName('BEFO_BUZY').AsInteger:= prp_dp_BEFO_BUZY ;

  ParamByName('BEFO_POSADA').AsString:=prp_dp_KemRabotal_TextEdit.Text;
  ParamByName('BEFO_WHERE').AsString:= prp_dp_GdeRabotal_TextEdit.Text;
  ParamByName('GROMADYN').AsString:= prp_dp_Gragdanstvo_TextEdit.Text;
  ParamByName('PHONE').AsString:=prp_dp_DomTelefon_MaskEdit.Text;
  ParamByName('BEFO_OSVITA').AsInteger:= prp_dp_BEFO_OSVITA;
  ParamByName('BEFO_META').AsInteger:=prp_dp_BEFO_META;
  ParamByName('BEFO_STUPEN').AsInteger:=prp_dp_BEFO_STUPEN;
  if prp_dp_Srok_ComboBox.ItemIndex=0 then
  ParamByName('BEFO_STROK').AsInteger:=1;
  if prp_dp_Srok_ComboBox.ItemIndex=1 then
  ParamByName('BEFO_STROK').AsInteger:=2;
  ParamByName('NAZIONAL').AsString:=prp_dp_Nazionalnost_TextEdit.Text;
  if prp_dp_ResonPriezd_ComboBox.ItemIndex=0 then
  ParamByName('BEFO_RESON').AsInteger:=1;
  if prp_dp_ResonPriezd_ComboBox.ItemIndex=1 then
  ParamByName('BEFO_RESON').AsInteger:=2;
  ParamByName('BEFO_YEAR').AsString:=prp_dp_DateMestoUbitiya.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end
else
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_DP_BY_ID_KOD_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;

  if prp_dp_BEFO_BUZY <>-1 then
  ParamByName('BEFO_BUZY').AsInteger:= prp_dp_BEFO_BUZY
  else begin
  ParamByName('BEFO_POSADA').AsString:=prp_dp_KemRabotal_TextEdit.Text;
  ParamByName('BEFO_WHERE').AsString:= prp_dp_GdeRabotal_TextEdit.Text;
  end;

  ParamByName('GROMADYN').AsString:= prp_dp_Gragdanstvo_TextEdit.Text;
  ParamByName('PHONE').AsString:=prp_dp_DomTelefon_MaskEdit.Text;
  ParamByName('BEFO_OSVITA').AsInteger:= prp_dp_BEFO_OSVITA;
  ParamByName('BEFO_META').AsInteger:=prp_dp_BEFO_META;
  ParamByName('BEFO_STUPEN').AsInteger:=prp_dp_BEFO_STUPEN;
  if prp_dp_Srok_ComboBox.ItemIndex=0 then
  ParamByName('BEFO_STROK').AsInteger:=1;
  if prp_dp_Srok_ComboBox.ItemIndex=1 then
  ParamByName('BEFO_STROK').AsInteger:=2;
  ParamByName('NAZIONAL').AsString:=prp_dp_Nazionalnost_TextEdit.Text;
  if prp_dp_ResonPriezd_ComboBox.ItemIndex=0 then
  ParamByName('BEFO_RESON').AsInteger:=1;
  if prp_dp_ResonPriezd_ComboBox.ItemIndex=1 then
  ParamByName('BEFO_RESON').AsInteger:=2;
  ParamByName('BEFO_YEAR').AsString:=prp_dp_DateMestoUbitiya.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end;
screen.Cursor:=crDefault;
end;


//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_vip_Additional_Write;
begin
  screen.Cursor:=crHourGlass;
  if not prp_vip_didSafe then
   begin
     showmessage('Дополнительные данные о выписке не могут быть сохранены сейчас. ' + #13+
                 'Сначала внесите дату выписки и сохраните изменения !');
     prp_PageControl.ActivePageIndex:=0;
     prp_vip_DateIncome.SetFocus;
     screen.Cursor:=crDefault;
     exit;
   end;
if  prp_vip_ResonPereezd_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_RESON_BY_NAME('+ kav+prp_vip_ResonPereezd_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_vip_AFTE_VYP_RESON:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_vip_Osvita_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_OSVITA_BY_NAME('+ kav+prp_vip_Osvita_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_vip_AFTE_VYP_OSVITA:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_vip_UchStepen_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_STUPEN_BY_NAME('+ kav+prp_vip_UchStepen_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_vip_AFTE_VYP_STUPEN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

    With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_VIP_ADD_ID_KD_UPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;
  if prp_vip_GdeRabotal_TextEdit.Text<>'' then
  ParamByName('AFTE_VYP_WHERE').AsString:= prp_vip_GdeRabotal_TextEdit.Text;
  if prp_vip_KemRabotal_TextEdit.Text<>'' then
  ParamByName('AFTE_VYP_POSADA').AsString:= prp_vip_KemRabotal_TextEdit.Text;
  if ((prp_vip_AFTE_VYP_RESON <> null )or (prp_vip_AFTE_VYP_RESON <> 0) )then
  ParamByName('AFTE_VYP_RESON').AsInteger:= prp_vip_AFTE_VYP_RESON;
  if ((prp_vip_AFTE_VYP_OSVITA <> null )or (prp_vip_AFTE_VYP_OSVITA <> 0) )then
  ParamByName('AFTE_VYP_OSVITA').AsInteger:= prp_vip_AFTE_VYP_OSVITA;
  if ((prp_vip_AFTE_VYP_STUPEN <> null )or (prp_vip_AFTE_VYP_STUPEN <> 0) )then
  ParamByName('AFTE_VYP_STUPEN').AsInteger:= prp_vip_AFTE_VYP_STUPEN;

  WriteProc.ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  ShowMessage('Ошибка сохранения данных о дополнительной информации выписки');
  end;
end;

  screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_vip_Propiska_Write;
begin
screen.Cursor:=crHourGlass;


{if prp_vip_DateIncome.Text ='' then begin
showmessage('Необходимо заполнить дату выписки !');
prp_PageControl.ActivePageIndex:=0;
prp_vip_DateIncome.SetFocus;
screen.Cursor:=crDefault;
exit;
end;}

if  prp_vip_Oblast_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_PUNKT_BY_NAME('+ kav+prp_vip_Oblast_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_vip_NOM_PUNKT:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_vip_GorodSeloPGT_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_TOWN_BY_NAME('+ kav+prp_vip_GorodSeloPGT_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_vip_NOM_TOWN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_VIP_BY_ID_KD_UPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;
  if prp_vip_ToDonezk_CheckBox.Checked then
  ParamByName('TO_DON').AsInteger:=1
  else ParamByName('TO_DON').AsInteger:=0;

  ParamByName('AFTE_STAT').AsString:=prp_vip_Country_TextEdit.Text;
  ParamByName('AFTE_OBL').AsString:= prp_vip_Oblast_TextEdit.text;
  ParamByName('AFTE_SELO').AsString:=prp_vip_Selo_TextEdit.Text;
  ParamByName('AFTE_RAJ').AsString:=prp_vip_Rayon_TextEdit.Text;
  ParamByName('AFTE_TOWN').AsString:=prp_vip_Gorod_TextEdit.text;
  ParamByName('AFTE_STREET').AsString:=prp_vip_street_TextEdit.text;
  ParamByName('AFTE_HOUSE').AsString:=prp_vip_house_TextEdit.text;
  ParamByName('AFTE_KVARTIRA').AsString:=prp_vip_kvartira_TextEdit.text;
  if prp_vip_DateIncome.Text<>'' then
  ParamByName('DATE_VYPIS').AsDate:=prp_vip_DateIncome.Date;
  if   prp_vip_Index_TextEdit.Text ='' then  ParamByName('AFTE_IND').Asinteger:=0
  else ParamByName('AFTE_IND').AsString:=prp_prp_Index_TextEdit.Text;

  ParamByName('TYPE_AF_OB').AsInteger:=prp_vip_NOM_PUNKT;
  ParamByName('TYPE_AF_TO').AsInteger:=prp_vip_NOM_TOWN;

  // Донецк
 // ParamByName('DON').AsString:='У';
  if prp_vip_STREET_D_TextEdit.Text <> '' then
  ParamByName('STREET_D').AsString:=prp_vip_STREET_D_TextEdit.text;
  if prp_vip_HOUSE_D_TextEdit.Text <> '' then
  ParamByName('HOUSE_D').AsString:=prp_vip_HOUSE_D_TextEdit.text;
  if prp_vip_KVART_D_TextEdit.Text <> '' then
  ParamByName('KVART_D').AsString:=prp_vip_KVART_D_TextEdit.text;
  if prp_vip_RAJ_D_TextEdit.Text <> '' then
  ParamByName('RAJ_D').AsString:=prp_vip_RAJ_D_TextEdit.text;

  WriteProc.ExecProc;

  // обновление статуса
    if prp_prp_DateBegPropi.Text<>'' then
    begin
     WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
     WriteProc.Prepare;
     ParamByName('ID_KOD').AsInt64 := edit_item_id;
     ParamByName('TYPE_PROPI').AsInt64 := 4;
     WriteProc.ExecProc;
    end;
 try
  Transaction.Commit;
  Close;
  prp_vip_didSafe:=true;
  prp_END_PROPIS:= DataModule1.CURRENT_TIMESTAMP;
  except
  Transaction.Rollback;
  close;
  end;
end;
    screen.Cursor:=crDefault;
end;
//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Propiska_Write;
begin
screen.Cursor:=crHourGlass;
if prp_prp_DateEndPropi.Text ='' then begin
showmessage('Необходимо заполнить дату окончания прописки');
prp_PageControl.ActivePageIndex:=3;
prp_prp_DateEndPropi.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if prp_prp_DateEndPropi.date < datamodule1.CURRENT_TIMESTAMP then begin
showmessage('Дата окончания прописки должна быть больше текущей');
prp_PageControl.ActivePageIndex:=3;
prp_prp_DateEndPropi.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if prp_AdresPropi_Edit.Text = '' then begin
showmessage('Необходимо ввести адрес прописки');
prp_PageControl.ActivePageIndex:=3;
prp_AdresPropi_Edit.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if  prp_prp_Oblast_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_PUNKT_BY_NAME('+ kav+prp_prp_Oblast_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_prp_NOM_PUNKT:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_prp_GorodSeloPGT_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_TOWN_BY_NAME('+ kav+prp_prp_GorodSeloPGT_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_prp_NOM_TOWN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if ((prp_END_PROPIS<> null) and (prp_END_PROPIS <> 0))  then
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_PRP_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  if ((prp_BEG_PROPIS<> null) and (prp_BEG_PROPIS <> 0))  then
  ParamByName('BEG_PROPIS').AsDate:= prp_BEG_PROPIS;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;
  if prp_prp_DateBegPropi.Text<> '' then
  ParamByName('NEW_BEG_PROPIS').AsDate:= STRTODATE(DATETOSTR(prp_prp_DateBegPropi.Date));
  ParamByName('NEW_END_PROPIS').AsDate:= STRTODATE(DATETOSTR(prp_prp_DateEndPropi.Date));
  if prp_prp_FromDonezk_CheckBox.Checked then
  ParamByName('FROM_DON').AsInteger:=1
  else ParamByName('FROM_DON').AsInteger:=0;
  ParamByName('BEFOR_KV').AsString:= prp_prp_KvartNumber_TextEdit.Text;
  ParamByName('BEFOR_H').AsString:=prp_prp_HouseNumber_TextEdit.Text;
  ParamByName('BEFOR_STAT').AsString:=prp_prp_Country_TextEdit.Text;
  ParamByName('BEFO_PUNKT').AsString:= prp_prp_Oblast_TextEdit.text;
  ParamByName('BEFOR_STR').AsString:=prp_prp_Street_TextEdit.Text;
  ParamByName('BEFOR_SELO').AsString:=prp_prp_Selo_TextEdit.Text;
  ParamByName('BEFOR_RAJ').AsString:=prp_prp_Rayon_TextEdit.Text;
  ParamByName('BEFOR_TOWN').AsString:=prp_prp_Gorod_TextEdit.text;
  // Донецк
  ParamByName('DON').AsString:='П';
  if prp_prp_STREET_D_TextEdit.Text <> ''
   then ParamByName('STREET_D').AsString:=prp_prp_STREET_D_TextEdit.text;
  if prp_prp_HOUSE_D_TextEdit.Text <> ''
   then ParamByName('HOUSE_D').AsString:=prp_prp_HOUSE_D_TextEdit.text;
  if prp_prp_KVART_D_TextEdit.Text <> ''
   then ParamByName('KVART_D').AsString:=prp_prp_KVART_D_TextEdit.text;
  if prp_prp_RAJ_D_TextEdit.Text <> ''
   then ParamByName('RAJ_D').AsString:=prp_prp_RAJ_D_TextEdit.text;
  if prp_prp_DATE_PRIB_DateEdit.Text <> ''
   then ParamByName('DATE_PRIB').AsDate:=STRTODATE(DATETOSTR(prp_prp_DATE_PRIB_DateEdit.Date));

  if prp_prp_Index_TextEdit.Text = ''
   then ParamByName('BEFOR_IND').Asinteger := 0
   else ParamByName('BEFOR_IND').AsString  := prp_prp_Index_TextEdit.Text;

  ParamByName('NOM_PUNKT').AsInteger:=prp_prp_NOM_PUNKT;
  ParamByName('BEFOR_NOM').AsInteger:=prp_prp_NOM_TOWN;
if prp_prp_DateIncome.Text<>'' then
  ParamByName('BEF_D_PR').AsDate:=STRTODATE(DATETOSTR(prp_prp_DateIncome.Date));
 if  ((frmPropiska.prp_Kod_Build<> null) and (frmPropiska.prp_Kod_Build<>0))then
  ParamByName('KOD_BUILD').AsInteger:=prp_Kod_Build;

if ProdlenieMode then ParamByName('CONT_PROPI').AsInteger:=1
else
if cont_propi = 1 then ParamByName('CONT_PROPI').AsInteger:=1;

  ExecProc;

  // обновление статуса
    if prp_prp_DateBegPropi.Text<>'' then
    begin
     WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
     WriteProc.Prepare;
     ParamByName('ID_KOD').AsInt64 := edit_item_id;
     ParamByName('TYPE_PROPI').AsInt64 := 3;
     WriteProc.ExecProc;
    end
    else
    begin
 //   if ProdlenieMode then
  //        begin
                 WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
                 WriteProc.Prepare;
                 ParamByName('ID_KOD').AsInt64 := edit_item_id;
                 ParamByName('TYPE_PROPI').AsInt64 := 2;
                 WriteProc.ExecProc;
   //       end;
    end;
 try
  Transaction.Commit;
  Close;
  if prp_prp_DateBegPropi.Text<>'' then
  prp_BEG_PROPIS:= prp_prp_DateBegPropi.Date;
  prp_END_PROPIS:= prp_prp_DateEndPropi.Date;
  except
  Transaction.Rollback;
  close;
  end;
end;
end
else
begin
 With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_PRP_BY_ID_KD_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  if prp_prp_DateBegPropi.Text<>'' then
  ParamByName('BEG_PROPIS').AsDate:= prp_prp_DateBegPropi.Date;
  ParamByName('END_PROPIS').AsDate:= prp_prp_DateEndPropi.Date;
  if prp_prp_FromDonezk_CheckBox.Checked then
  ParamByName('FROM_DON').AsInteger:=1
  else ParamByName('FROM_DON').AsInteger:=0;
  ParamByName('BEFOR_KV').AsString:= prp_prp_KvartNumber_TextEdit.Text;
  ParamByName('BEFOR_H').AsString:=prp_prp_HouseNumber_TextEdit.Text;
  ParamByName('BEFOR_STAT').AsString:=prp_prp_Country_TextEdit.Text;
  ParamByName('BEFO_PUNKT').AsString:= prp_prp_Oblast_TextEdit.text;
  ParamByName('BEFOR_STR').AsString:=prp_prp_Street_TextEdit.Text;
  ParamByName('BEFOR_SELO').AsString:=prp_prp_Selo_TextEdit.Text;
  ParamByName('BEFOR_RAJ').AsString:=prp_prp_Rayon_TextEdit.Text;
  ParamByName('BEFOR_TOWN').AsString:=prp_prp_Gorod_TextEdit.text;
  ParamByName('BEFOR_IND').AsString:=prp_prp_Index_TextEdit.Text;
  ParamByName('NOM_PUNKT').AsInteger:=prp_prp_NOM_PUNKT;
  ParamByName('BEFOR_NOM').AsInteger:=prp_prp_NOM_TOWN;
  // Донецк
  ParamByName('DON').AsString:='П';
  ParamByName('STREET_D').AsString:=prp_prp_STREET_D_TextEdit.text;
  ParamByName('HOUSE_D').AsString:=prp_prp_HOUSE_D_TextEdit.text;
//  ParamByName('KORP_D').AsString:=prp_prp_Gorod_TextEdit.text;
  ParamByName('KVART_D').AsString:=prp_prp_KVART_D_TextEdit.text;
  ParamByName('RAJ_D').AsString:=prp_prp_RAJ_D_TextEdit.text;
   if prp_prp_DATE_PRIB_DateEdit.Text <> '' then
  ParamByName('DATE_PRIB').AsDate:=prp_prp_DATE_PRIB_DateEdit.Date;
   if  ((frmPropiska.prp_Kod_Build<> null) and (frmPropiska.prp_Kod_Build<>0))then 
  ParamByName('KOD_BUILD').AsInteger:=prp_Kod_Build;
if prp_prp_DateIncome.Text<>'' then
  ParamByName('BEF_D_PR').AsDate:=prp_prp_DateIncome.Date;

if ProdlenieMode then ParamByName('CONT_PROPI').AsInteger:=1
else
if cont_propi = 1 then ParamByName('CONT_PROPI').AsInteger:=1;
  ExecProc;

     // обновление статуса
    if prp_prp_DateBegPropi.Text<>'' then
    begin
     WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
     WriteProc.Prepare;
     ParamByName('ID_KOD').AsInt64 := edit_item_id;
     ParamByName('TYPE_PROPI').AsInt64 := 3;
     WriteProc.ExecProc;
    end
    else
    begin
 //   if ProdlenieMode then
     //     begin
                 WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
                 WriteProc.Prepare;
                 ParamByName('ID_KOD').AsInt64 := edit_item_id;
                 ParamByName('TYPE_PROPI').AsInt64 := 2;
                 WriteProc.ExecProc;
       //   end;
    end;
 try
  Transaction.Commit;
  Close;
  if prp_prp_DateBegPropi.Text <> '' then
  prp_BEG_PROPIS:= prp_prp_DateBegPropi.Date;
  prp_END_PROPIS:= prp_prp_DateEndPropi.Date;
  except
  Transaction.Rollback;
  close;
  end;
end;
end;
screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Born_Write;
begin
screen.Cursor:=crHourGlass;
if prp_mg_Index_TextEdit.Value > 999999 then begin
ShowMessage('Индекс введен неверно.'+#13+'Вы превысили количество возможных симолов.');
prp_PageControl.ActivePageIndex:=2;
prp_mg_Index_TextEdit.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if  prp_mg_Oblast_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_PUNKT_BY_NAME('+ kav+prp_mg_Oblast_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_mg_NOM_PUNKT:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;
if  prp_mg_GorodSeloPGT_ComboBox.Text <> '' then begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select NOM from ST_GET_ID_TOWN_BY_NAME('+ kav+prp_mg_GorodSeloPGT_ComboBox.Text+kav+ ')' ;
    ReadDataSet.Open;
    prp_mg_NOM_TOWN:=ReadDataSet['NOM'];
    ReadDataSet.Close;
    end;

With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PFIO_R_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  ParamByName('INDEX_R').AsDouble:= prp_mg_Index_TextEdit.value;
  ParamByName('KRAYNA_R').AsString:=  prp_mg_Country_TextEdit.Text;
  ParamByName('RAJON_R').AsString:= prp_mg_Rayon_TextEdit.Text;
  ParamByName('NAZV_PUNKT').AsString:= prp_mg_Oblast_TextEdit.Text ;
  ParamByName('NOM_PUNKT').AsInteger:=  prp_mg_NOM_PUNKT;
  ParamByName('NAZV_TOWN').AsString:= prp_mg_Gorod_TextEdit.Text;
  ParamByName('NOM_TOWN').AsInteger:=  prp_mg_NOM_TOWN;
  ParamByName('SELO_R').AsString:=  prp_mg_Selo_TextEdit.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_Warrior_Write;
begin
Screen.Cursor:=crHourGlass;
if ((prp_END_PROPIS<> null) and (prp_END_PROPIS <> 0))  then
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_VU_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
 // ParamByName('BEG_PROPIS').AsDate:= prp_BEG_PROPIS;
  ParamByName('END_PROPIS').AsDate:= prp_END_PROPIS;
  if prp_vu_PostavlenDate.text <>'' then
  ParamByName('VU_DATE_PR').AsDate:=STRTODATE(DATETOSTR(prp_vu_PostavlenDate.date));
  if prp_vu_SnyatDate.text <>'' then
  ParamByName('VU_DATE_SN').AsDate:=prp_vu_SnyatDate.date;
  ParamByName('VU_NOTE').asstring:= prp_vu_Notes.Text;
  ParamByName('FROM_RVK').asstring:= prp_vu_FromRVK_TextEdit.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end
else
begin
  With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_VU_BY_ID_KOD_INSUPT';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edit_item_id;
  if prp_vu_PostavlenDate.text <>'' then
  ParamByName('VU_DATE_PR').AsDate:=prp_vu_PostavlenDate.date;
  if prp_vu_SnyatDate.text <>'' then
  ParamByName('VU_DATE_SN').AsDate:=prp_vu_SnyatDate.date;
  ParamByName('VU_NOTE').asstring:= prp_vu_Notes.Text;
  ParamByName('FROM_RVK').asstring:= prp_vu_FromRVK_TextEdit.Text;
  ExecProc;
 try
  Transaction.Commit;
  Close;
  except
  Transaction.Rollback;
  close;
  end;
end;
end;
screen.Cursor:=crDefault;
end;
//----------------------------------------------------------------------------------------------------------------

procedure TfrmPropiska.prp_MultiPass_Write;
var
  i: integer;
begin
  if prp_PaspGridTableView.DataController.RecordCount = 0 then
   begin
    With WriteProc do
     begin
      Transaction.StartTransaction;
      StoredProcName := 'ST_DT_PASP_DELETE';
      Prepare;
      ParamByName('ID_KOD').AsInt64 := edit_item_id;
      ExecProc;
      try
       Transaction.Commit;
       Close;
       except
        Transaction.Rollback;
        close;
      end;
     end;
    exit;  //просто все удалили
   end;

  Screen.Cursor:=crHourGlass;
   // сначала удаляем все записи про паспорт по данному ид.коду
  With WriteProc do
   begin
    Transaction.StartTransaction;
    StoredProcName := 'ST_DT_PASP_DELETE';
    Prepare;
    ParamByName('ID_KOD').AsInt64 := edit_item_id;
    ExecProc;

    //после чего добавляем их заново
    for i := 0 to prp_PaspGridTableView.DataController.RecordCount - 1 do
     begin
      StoredProcName := 'ST_DT_PASP_INSERT';
      Prepare;
      ParamByName('ID_KOD').AsInt64 := edit_item_id;
      if prp_PaspGridTableView.DataController.Values[i,2]<> null
       then ParamByName('TYPE_UDOST').AsInteger := prp_PaspGridTableView.DataController.Values[i,2];
      if prp_PaspGridTableView.DataController.Values[i,3]<> null
       then ParamByName('P_FAM').AsString := prp_PaspGridTableView.DataController.Values[i, 3];
      if prp_PaspGridTableView.DataController.Values[i,4]<> null
       then ParamByName('P_IMYA').AsString := prp_PaspGridTableView.DataController.Values[i, 4];
      if prp_PaspGridTableView.DataController.Values[i,5]<> null
       then ParamByName('P_OT').AsString := prp_PaspGridTableView.DataController.Values[i, 5];
      if prp_PaspGridTableView.DataController.Values[i,8]<> null
       then ParamByName('SERYA').AsString := prp_PaspGridTableView.DataController.Values[i, 8];
      if prp_PaspGridTableView.DataController.Values[i,9]<> null
       then ParamByName('NOMER').AsString := prp_PaspGridTableView.DataController.Values[i, 9];
      if prp_PaspGridTableView.DataController.Values[i,6]<> null
       then ParamByName('PAS_VYDAN').AsString := prp_PaspGridTableView.DataController.Values[i, 6];
      if prp_PaspGridTableView.DataController.Values[i,7]<> null
       then ParamByName('DATE_VYDAN').Asdate := prp_PaspGridTableView.DataController.Values[i, 7];
      if prp_PaspGridTableView.DataController.Values[i,10]<> null
       then ParamByName('OSNOVANIE').AsString := prp_PaspGridTableView.DataController.Values[i,10];
      ExecProc;
     end;
    try
     Transaction.Commit;
     Close;
     except
      Transaction.Rollback;
      close;
    end;
   end;

  // проверка на изменение фамилии
  With WriteProc do
   begin
    Transaction.StartTransaction;
    StoredProcName := 'ST_DT_PASP_CHECK_PFIO';
    Prepare;
    ParamByName('ID_KOD').AsInt64 := edit_item_id;
    ExecProc;
    try
     Transaction.Commit;
     Close;
     except
      Transaction.Rollback;
      close;
    end;
   end;

  screen.Cursor:=crDefault;
end;

//----------------------------------------------------------------------------------------------------------------
procedure TfrmPropiska.prp_fs_OkButtonClick(Sender: TObject);
begin
FamilyStatus_Write;
FamilyRelations_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.FormShow(Sender: TObject);
begin
  prp_Oblast_Control:='';
  prp_Rayon_Control:='';
  prp_Gorod_Control:='';
  prp_Uliza_Control:='';
  prp_Dom_Control:='';
  prp_Kvartira_Control:='';
  prp_born_Rayon:='';
  prp_born_Gorod:='';
  prp_born_Selo:='';

  // первичная инициализация Control
  prp_Oblast_Control:=prp_prp_Oblast_TextEdit.Text ;
  prp_Rayon_Control:=prp_prp_Rayon_TextEdit.Text ;
  prp_Gorod_Control:=prp_prp_Gorod_TextEdit.Text ;
  prp_Uliza_Control:=prp_prp_Street_TextEdit.Text ;
  prp_Dom_Control:=prp_prp_HouseNumber_TextEdit.Text ;
  prp_Kvartira_Control:=prp_prp_KvartNumber_TextEdit.Text ;

  prp_born_Rayon:=prp_mg_Rayon_TextEdit.Text;
  prp_born_Gorod:=prp_mg_Gorod_TextEdit.Text;
  prp_born_Selo:=prp_mg_Selo_TextEdit.Text;

  if prp_fs_GroupBox.Enabled then
   if prp_GridTableView.DataController.RecordCount > 0 then
    begin
     prp_fs_EditButton.Enabled:=true;
     prp_fs_DeleteButton.Enabled:=true;
     prp_GridTableView.DataController.FocusedRecordIndex:=0;
    end;

  if prp_fs_GroupBox.Enabled then
   if prp_Rodstv_GridTableView.DataController.RecordCount > 0 then
    begin
     prp_Rodstv_Edit_Button.Enabled:=true;
     prp_Rodstv_Delete_Button.Enabled:=true;
     prp_Rodstv_GridTableView.DataController.FocusedRecordIndex:=0;
    end;

  if prp_PassGroupBox.Enabled then
   if prp_PaspGridTableView.DataController.RecordCount > 0 then
    begin
     prp_pass_DeleteButton.Enabled:=true;
     prp_pass_EditButton.Enabled:=true;
     prp_PaspGridTableView.DataController.FocusedRecordIndex:=0;
    end;

  if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] <> null
   then prp_PasVidan_Label.Caption:= prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6];

  if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] <> null
   then prp_DateVidan_Label.Caption := datetostr(prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7]);

  prp_PageControl.ActivePageIndex:=2;
  if prp_BornPlace_GroupBox.Enabled
   then prp_mg_Country_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_OkButtonClick(Sender: TObject);
begin
prp_Father_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_m_OkButtonClick(Sender: TObject);
begin
prp_Muther_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_dp_OkButtonClick(Sender: TObject);
begin
prp_Additional_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_prp_OkButtonClick(Sender: TObject);
begin
  prp_Propiska_Write;

  Registration_Form.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(edit_item_id)+')';
  Registration_Form.DataSet.Refresh;
  if Registration_Form.DataSet['UK_FIO_COMBO'] <> null then Registration_Form.PIB_Label.Text := Registration_Form.DataSet['UK_FIO_COMBO'];
  if Registration_Form.DataSet['SHORT_NAME_CATEGORY'] <> null then Registration_Form.Category_Label.Text := Registration_Form.DataSet['SHORT_NAME_CATEGORY'] ;
  if Registration_Form.DataSet['NUM_DOG'] <> null then Registration_Form.Dogovor_Label.Text:=Registration_Form.DataSet['NUM_DOG'] ;
  if Registration_Form.DataSet['STATUS'] <> null then Registration_Form.Status_Edit.Text:=Registration_Form.DataSet['STATUS'] ;


  Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_mg_Country_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_Oblast_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Oblast_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_Oblast_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Oblast_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_Rayon_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Rayon_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_GorodSeloPGT_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_mg_GorodSeloPGT_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_mg_Gorod_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Gorod_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_Index_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Index_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_mg_Selo_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_mg_Selo_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_PageControl.ActivePageIndex:=3;
end;

procedure TfrmPropiska.prp_prp_Country_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Oblast_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Oblast_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Oblast_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Oblast_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Rayon_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Rayon_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_GorodSeloPGT_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_prp_GorodSeloPGT_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_prp_Gorod_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Gorod_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Index_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Selo_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Street_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Index_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_Selo_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_Street_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_HouseNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_HouseNumber_TextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_prp_KvartNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_KvartNumber_TextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_prp_DateIncome.SetFocus;
end;

procedure TfrmPropiska.prp_prp_DateIncomeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_FromDonezk_CheckBox.SetFocus;
end;

procedure TfrmPropiska.prp_prp_FromDonezk_CheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_DateBegPropi.SetFocus;
end;

procedure TfrmPropiska.prp_prp_DateBegPropiKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_DateEndPropi.SetFocus;
end;

procedure TfrmPropiska.prp_prp_DateEndPropiKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_AdresPropi_Edit.SetFocus;
end;

procedure TfrmPropiska.prp_dp_DateMestoUbitiyaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_ResonPriezd_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_ResonPriezd_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Srok_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Srok_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_ResonPereezd_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_ResonPereezd_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_dp_GdeRabotal_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_dp_GdeRabotal_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
if prp_dp_KemRabotal_TextEdit.CanFocusEx then
prp_dp_KemRabotal_TextEdit.SetFocus
else
prp_dp_Dolgnost_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_KemRabotal_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Dolgnost_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Osvita_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_UchStepen_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_UchStepen_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Gragdanstvo_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Specialnost_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Gragdanstvo_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Gragdanstvo_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Nazionalnost_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Nazionalnost_TextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_dp_DomTelefon_MaskEdit.SetFocus;
end;

procedure TfrmPropiska._prp_dp_DomTelefon_MaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_OkButton.SetFocus;
end;

procedure TfrmPropiska.prp_vu_FromRVK_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vu_PostavlenDate.SetFocus;
end;

procedure TfrmPropiska.prp_vu_PostavlenDateKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vu_SnyatDate.SetFocus;
end;

procedure TfrmPropiska.prp_vu_SnyatDateKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vu_Notes.SetFocus;
end;

procedure TfrmPropiska.prp_vu_NotesKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_PageControl.ActivePageIndex:=6;
end;

procedure TfrmPropiska.prp_f_Familia_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Name_Edit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Otch_Edit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Otch_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_MestoRaboti_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_MestoRaboti_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Dolgnost_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Dolgnost_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_WorkTelefon_MaskEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Oblast_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Rayon_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Rayon_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_GorodSeloPGT_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_f_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_GorodSeloPGT_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_GorodSeloPGT_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Street_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_Street_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_HouseNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_HouseNumber_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_KvartNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_f_KvartNumber_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_PageControl.ActivePageIndex:=8;
end;

procedure TfrmPropiska.prp_m_Familia_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Name_Edit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Otch_Edit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Otch_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_MestoRaboti_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_MestoRaboti_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Dolgnost_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Dolgnost_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_WorkTelefon_MaskEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Oblast_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Rayon_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Rayon_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_GorodSeloPGT_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_m_GorodSeloPGT_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_GorodSeloPGT_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_GorodSeloPGT_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Street_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_Street_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_HouseNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_HouseNumber_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_KvartNumber_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_KvartNumber_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_PageControl.ActivePageIndex:=9;
end;

procedure TfrmPropiska.prp_fs_SimStan_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then prp_fs_Vmeste_CheckBox.SetFocus;
end;

procedure TfrmPropiska.prp_fs_Vmeste_CheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_Grid.SetFocus;
end;

procedure TfrmPropiska.prp_GridTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_Rodstv_Grid.SetFocus;
end;

procedure TfrmPropiska.prp_PageControlChange(Sender: TObject);
begin
if prp_PageControl.ActivePage = prp_Vipiska_Sheet then
if prp_vip_GroupBox.Enabled then
if prp_vip_Country_TextEdit.CanFocusEx then
prp_vip_Country_TextEdit.SetFocus;

if prp_PageControl.ActivePage = prp_Vip_Dopolnenie_Sheet then
if prp_vip_dp_GroupBox.Enabled then
if prp_vip_ResonPereezd_ComboBox.CanFocusEx then
prp_vip_ResonPereezd_ComboBox.SetFocus;

if prp_PageControl.ActivePage = prp_BornPlace_Sheet then
if prp_BornPlace_GroupBox.Enabled then
prp_mg_Country_TextEdit.SetFocus;
if prp_PageControl.ActivePage = prp_Propiska_Sheet then
if (prp_Propiska_GroupBox.Enabled and prp_Propiska_GroupBox.CanFocusEx)then
prp_prp_Country_TextEdit.SetFocus;
if prp_PageControl.ActivePage = prp_Additional_Sheet then
if prp_Adittional_GroupBox.Enabled then
prp_dp_DateMestoUbitiya.SetFocus;
if prp_PageControl.ActivePage = prp_Warrior_Sheet then
if prp_Warrior_GroupBox.Enabled then
prp_vu_FromRVK_TextEdit.SetFocus;
if prp_PageControl.ActivePage = prp_MultiPass_Sheet then
;
if prp_PageControl.ActivePage = prp_Daddy_Sheet then
if prp_Daddy_GroupBox.Enabled then
prp_f_Familia_Edit.SetFocus;
if prp_PageControl.ActivePage = prp_Mummi_Sheet then
if prp_Mummi_GroupBox.Enabled then
prp_m_Familia_Edit.SetFocus;
if prp_PageControl.ActivePage = prp_FamilyStatus_Sheet then
if prp_FamilyStatus_GroupBox.Enabled then
  prp_fs_SimStan_ComboBox.SetFocus;
end;


procedure TfrmPropiska.prp_mg_OkButtonClick(Sender: TObject);
begin
prp_Born_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_vu_OkButtonClick(Sender: TObject);
begin
TRY
if prp_vu_PostavlenDate.TEXT <> '' then
prp_vu_PostavlenDate.Date:=STRTODATE(prp_vu_PostavlenDate.TEXT);
EXCEPT
ShowMessage('Ошибка конвертации даты начала воинского учета. Неправильная дата.' +#13+
 'Данные по вкладке Воинского учета не будут сохранены. Обратитесь к Администратору.');
prp_vu_PostavlenDate.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

try
if prp_vu_SnyatDate.TEXT <> '' then
prp_vu_SnyatDate.Date:=STRTODATE(prp_vu_SnyatDate.TEXT);
EXCEPT
ShowMessage('Ошибка конвертации даты окончания воинского учета. Неправильная дата.' +#13+
 'Данные по вкладке Воинского учета не будут сохранены. Обратитесь к Администратору.');
prp_vu_SnyatDate.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

prp_Warrior_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_PaspGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] <> null then
prp_PasVidan_Label.Caption:=
prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6];

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] <> null then
prp_DateVidan_Label.Caption:=
datetostr(prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7]);
end;

procedure TfrmPropiska.prp_pass_AddButtonClick(Sender: TObject);
var i: integer;
begin
prp_frm_Pass_Add:=Tprp_frm_Pass_Add.create(self);
prp_frm_Pass_Add.Caption :=  st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
prp_frm_Pass_Add.Type_Label.Caption :=  st_ConstUnit.st_prp_TypeDoc[PLanguageIndex];
prp_frm_Pass_Add.Fam_Label.Caption :=   st_ConstUnit.st_Fam[PLanguageIndex];
prp_frm_Pass_Add.Name_Label.Caption :=  st_ConstUnit.st_Name[PLanguageIndex];
prp_frm_Pass_Add.Otch_Label.Caption :=  st_ConstUnit.st_Otch[PLanguageIndex];
prp_frm_Pass_Add.Seriya_Label.Caption :=st_ConstUnit.st_prp_pass_Seriya[PLanguageIndex];
prp_frm_Pass_Add.Nomer_Label.Caption := st_ConstUnit.st_prp_pass_Nomer[PLanguageIndex];
prp_frm_Pass_Add.Kem_Label.Caption :=   st_ConstUnit.st_prp_Kem[PLanguageIndex];
prp_frm_Pass_Add.Kogda_Label.Caption := st_ConstUnit.st_prp_Kogda[PLanguageIndex];
prp_frm_Pass_Add.Osnovanie_Label.Caption := st_ConstUnit.st_prp_Pidstava[PLanguageIndex];
prp_frm_Pass_Add.OkButton.Caption :=    st_ConstUnit.st_Accept[PLanguageIndex];
prp_frm_Pass_Add.CancelButton.Caption :=st_ConstUnit.st_Cancel[PLanguageIndex];

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select FAMILIA, IMYA, OTCHESTVO  from ST_GET_FIO_BY_ID('+ inttostr(edit_item_id)+')' ;
  ReadDataSet.Open;
  prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text:=ReadDataSet['FAMILIA'];
  prp_frm_Pass_Add.prp_NamePasp_Edit.Text:=ReadDataSet['IMYA'];
  prp_frm_Pass_Add.prp_OtchPasp_Edit.Text:=ReadDataSet['OTCHESTVO'];
  ReadDataSet.Close;


ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_INI_TYPE_UDOST_Select';
ReadDataSet.open;
ReadDataSet.FetchAll;
for i:=0 to ReadDataSet.RecordCount-1 do begin
prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Properties.Items.Add(ReadDataSet['NAME_UDOST'] );
ReadDataSet.Next;
end;
prp_frm_Pass_Add.prp_TypeUdost_ComboBox.ItemIndex:=0;
ReadDataSet.close;

if prp_PaspGridTableView.DataController.RecordCount<> 0 then
begin
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 4] <> '' then
prp_frm_Pass_Add.prp_NamePasp_Edit.Text:=
prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 4];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 5]<> '' then
prp_frm_Pass_Add.prp_OtchPasp_Edit.Text:=
prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 5];
end;

if prp_frm_Pass_Add.ShowModal = mrOk then
begin
//
  prp_PaspGridTableView.DataController.RecordCount := prp_PaspGridTableView.DataController.RecordCount + 1;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_GET_ID_UDOST_BY_NAME('+KAV+prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Text+KAV+')';
ReadDataSet.open;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 2] := ReadDataSet['TYPE_UDOST'];
ReadDataSet.Close;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 1] := prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text+' '+prp_frm_Pass_Add.prp_NamePasp_Edit.Text+ ' '+prp_frm_Pass_Add.prp_OtchPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 0] := prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 3] := prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 4] := prp_frm_Pass_Add.prp_NamePasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 5] := prp_frm_Pass_Add.prp_OtchPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 6] := prp_frm_Pass_Add.prp_Vidan_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 7] := prp_frm_Pass_Add.prp_DateVidan.Date;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 8] := prp_frm_Pass_Add.prp_Seriya_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 9] := prp_frm_Pass_Add.prp_Nomer_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.RecordCount - 1, 10]:= prp_frm_Pass_Add.prp_Osnovanie_Edit.Text;

  prp_pass_EditButton.Enabled := true;
  prp_pass_DeleteButton.Enabled := true;
  prp_PaspGridTableView.DataController.FocusedRecordIndex:=prp_PaspGridTableView.DataController.RecordCount - 1;

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] <> null then
prp_PasVidan_Label.Caption:=
prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6];

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] <> null then
prp_DateVidan_Label.Caption:=
datetostr(prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7]);
end;
end;

procedure TfrmPropiska.prp_pass_EditButtonClick(Sender: TObject);
var i: integer;
begin
prp_frm_Pass_Add:=Tprp_frm_Pass_Add.create(self);
prp_frm_Pass_Add.Caption :=  st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

prp_frm_Pass_Add.Type_Label.Caption :=  st_ConstUnit.st_prp_TypeDoc[PLanguageIndex];
prp_frm_Pass_Add.Fam_Label.Caption :=   st_ConstUnit.st_Fam[PLanguageIndex];
prp_frm_Pass_Add.Name_Label.Caption :=  st_ConstUnit.st_Name[PLanguageIndex];
prp_frm_Pass_Add.Otch_Label.Caption :=  st_ConstUnit.st_Otch[PLanguageIndex];
prp_frm_Pass_Add.Seriya_Label.Caption :=st_ConstUnit.st_prp_pass_Seriya[PLanguageIndex];
prp_frm_Pass_Add.Nomer_Label.Caption := st_ConstUnit.st_prp_pass_Nomer[PLanguageIndex];
prp_frm_Pass_Add.Kem_Label.Caption :=   st_ConstUnit.st_prp_Kem[PLanguageIndex];
prp_frm_Pass_Add.Kogda_Label.Caption := st_ConstUnit.st_prp_Kogda[PLanguageIndex];
prp_frm_Pass_Add.Osnovanie_Label.Caption := st_ConstUnit.st_prp_Pidstava[PLanguageIndex];
prp_frm_Pass_Add.OkButton.Caption :=    st_ConstUnit.st_Accept[PLanguageIndex];
prp_frm_Pass_Add.CancelButton.Caption :=st_ConstUnit.st_Cancel[PLanguageIndex];

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 3] <> null then
prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text:= prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 3];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 4] <> null then
prp_frm_Pass_Add.prp_NamePasp_Edit.Text:=    prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 4];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 5] <> null then
prp_frm_Pass_Add.prp_OtchPasp_Edit.Text:=    prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 5];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 8] <> null then
prp_frm_Pass_Add.prp_Seriya_Edit.Text:=      prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 8];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 9] <> null then
prp_frm_Pass_Add.prp_Nomer_Edit.Text:=       prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 9];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] <> null then
prp_frm_Pass_Add.prp_Vidan_Edit.Text:=       prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] <> null then
prp_frm_Pass_Add.prp_DateVidan.date:=        prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7];
if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 10] <> null then
prp_frm_Pass_Add.prp_Osnovanie_Edit.text:=   prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 10];

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_INI_TYPE_UDOST_Select';
ReadDataSet.open;
ReadDataSet.FetchAll;
for i:=0 to ReadDataSet.RecordCount-1 do begin
prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Properties.Items.Add(ReadDataSet['NAME_UDOST'] );
ReadDataSet.Next;
end;
prp_frm_Pass_Add.prp_TypeUdost_ComboBox.ItemIndex:=0;
ReadDataSet.close;

for i:=0 to prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Properties.Items.Count-1 do
begin
prp_frm_Pass_Add.prp_TypeUdost_ComboBox.ItemIndex:=i;
if prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Text = prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 0] then
break;
end;
if prp_frm_Pass_Add.ShowModal = mrOk then
begin
//
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_GET_ID_UDOST_BY_NAME('+KAV+prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Text+KAV+')';
ReadDataSet.open;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 2] := ReadDataSet['TYPE_UDOST'];
ReadDataSet.Close;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 1] := prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text+' '+prp_frm_Pass_Add.prp_NamePasp_Edit.Text+ ' '+prp_frm_Pass_Add.prp_OtchPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 0] := prp_frm_Pass_Add.prp_TypeUdost_ComboBox.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 3] := prp_frm_Pass_Add.prp_FamiliaPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 4] := prp_frm_Pass_Add.prp_NamePasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 5] := prp_frm_Pass_Add.prp_OtchPasp_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] := prp_frm_Pass_Add.prp_Vidan_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] := prp_frm_Pass_Add.prp_DateVidan.Date;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 8] := prp_frm_Pass_Add.prp_Seriya_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 9] := prp_frm_Pass_Add.prp_Nomer_Edit.Text;
  prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 10]:= prp_frm_Pass_Add.prp_Osnovanie_Edit.Text;
 end;

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6] <> null then
prp_PasVidan_Label.Caption:=
prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 6];

if prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7] <> null then
prp_DateVidan_Label.Caption:=
datetostr(prp_PaspGridTableView.DataController.Values[prp_PaspGridTableView.DataController.FocusedRecordIndex, 7]);
 end;

procedure TfrmPropiska.prp_pass_DeleteButtonClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
prp_PaspGridTableView.DataController.DeleteFocused;
prp_PaspGridTableView.DataController.FocusedRowIndex:=prp_PaspGridTableView.DataController.RecordCount - 1;

if prp_PaspGridTableView.DataController.RecordCount = 0 then
begin
prp_pass_DeleteButton.Enabled:=false;
prp_pass_EditButton.Enabled:=false;
prp_PasVidan_Label.Caption:='';
prp_DateVidan_Label.Caption:='';
end;
end;

procedure TfrmPropiska.prp_pass_OkButtonClick(Sender: TObject);
begin
prp_MultiPass_Write;
Screen.Cursor:=crDefault;
end;

procedure TfrmPropiska.prp_SaveAll_LargeButtonClick(Sender: TObject);
begin
if fibCheckPermission('/ROOT/Studcity/List_of_Propis','Edit') <> 0 then
begin
MessageDlg('                                 Действие запрещено!'
+#13+      'У Вас недостаточно прав для совершения данного действия.'
+#13+      'Для расширения Ваших полномочий обратитесь к Администратору.',
mtWarning, [mbOk], 0);
exit;
end;

prp_PageControl.ActivePage.SetFocus;

screen.Cursor:=crHourGlass;
if prp_Propiska_GroupBox.Enabled then
if prp_prp_DateEndPropi.Text ='' then begin
showmessage('Необходимо заполнить дату окончания прописки');
prp_PageControl.ActivePageIndex:=3;
prp_prp_DateEndPropi.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if prp_Propiska_GroupBox.Enabled then
if prp_prp_DateEndPropi.date < datamodule1.CURRENT_TIMESTAMP then begin
showmessage('Дата окончания прописки должна быть больше текущей');
prp_PageControl.ActivePageIndex:=3;
prp_prp_DateEndPropi.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if prp_Propiska_GroupBox.Enabled then
if prp_AdresPropi_Edit.Text = '' then begin
showmessage('Необходимо ввести адрес прописки');
prp_PageControl.ActivePageIndex:=3;
prp_AdresPropi_Edit.SetFocus;
screen.Cursor:=crDefault;
exit;
end;


if prp_PaspGridTableView.DataController.RecordCount = 0 then begin
showmessage('Необходимо ввести паспортные данные');
prp_PageControl.ActivePageIndex:=6;
prp_PaspGrid.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

if prp_mg_Index_TextEdit.Value > 999999 then begin
ShowMessage('Индекс введен неверно.'+#13+'Вы превысили количество возможных символов.');
prp_PageControl.ActivePageIndex:=2;
prp_mg_Index_TextEdit.SetFocus;
screen.Cursor:=crDefault;
exit;
end;

{if prp_Vipiska_Sheet.TabVisible then
if prp_vip_DateIncome.Text ='' then begin
showmessage('Необходимо заполнить дату выписки !');
prp_PageControl.ActivePageIndex:=0;
prp_vip_DateIncome.SetFocus;
screen.Cursor:=crDefault;
exit;
end;}

TRY
if prp_prp_DateBegPropi.TEXT <> '' then
prp_prp_DateBegPropi.Date:=STRTODATE(prp_prp_DateBegPropi.TEXT);
EXCEPT
ShowMessage('Ошибка конвертации даты начала прописки. Неправильная дата. Обратитесь к Администратору.');
prp_prp_DateBegPropi.SetFocus;
screen.Cursor:=crDefault;
exit;
end;
  if prp_Daddy_GroupBox.Enabled
   then prp_Father_Write;

  if prp_Mummi_GroupBox.Enabled
   then prp_Muther_Write;

  if prp_MultiPass_GroupBox.Enabled
   then prp_MultiPass_Write;

  if prp_BornPlace_GroupBox.Enabled
   then prp_Born_Write;

  if prp_Propiska_GroupBox.Enabled
   then prp_Propiska_Write;

  if prp_Adittional_GroupBox.Enabled
   then prp_Additional_Write;

  if prp_FamilyStatus_GroupBox.Enabled then
   begin
    FamilyStatus_Write;
    FamilyRelations_Write;
   end;

  if prp_Warrior_Sheet.Enabled
   then prp_Warrior_Write;

  if prp_Vipiska_Sheet.TabVisible
   then prp_vip_Propiska_Write;

  if prp_Vip_Dopolnenie_Sheet.TabVisible
   then prp_vip_Additional_Write;

  Registration_Form.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
  Registration_Form.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(frmPropiska.edit_item_id)+')';
  Registration_Form.DataSet.Edit;
  Registration_Form.DataSet.Post;
  if Registration_Form.DataSet['UK_FIO_COMBO'] <> null then Registration_Form.PIB_Label.Text := Registration_Form.DataSet['UK_FIO_COMBO'];
  if Registration_Form.DataSet['SHORT_NAME_CATEGORY'] <> null then Registration_Form.Category_Label.Text := Registration_Form.DataSet['SHORT_NAME_CATEGORY'] ;
  if Registration_Form.DataSet['NUM_DOG'] <> null then Registration_Form.Dogovor_Label.Text:=Registration_Form.DataSet['NUM_DOG'] ;
  if Registration_Form.DataSet['STATUS'] <> null then Registration_Form.Status_Edit.Text:=Registration_Form.DataSet['STATUS'] ;

  screen.Cursor:=crDefault;
  close;
end;

procedure TfrmPropiska.prp_History_LargeButtonClick(Sender: TObject);
var
  i:integer;
  date1:string;
  date2:string;
begin
frm_prp_History:=Tfrm_prp_History.create(Self);
frm_prp_History.Caption := st_ConstUnit.st_prp_his_History[PLanguageIndex];
frm_prp_History.prp_DateBeg_History_Column.Caption  :=  st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
frm_prp_History.prp_DateEnd_History_Column.Caption  :=  st_ConstUnit.st_grid_Date_End[PLanguageIndex];
frm_prp_History.prp_State_History_Column.Caption    :=  st_ConstUnit.st_prp_his_StanPeriody[PLanguageIndex];
frm_prp_History.prp_history_OkButton.Caption        :=  st_ConstUnit.st_prp_his_Choose[PLanguageIndex];
frm_prp_History.DeleteHistory_Button.Caption        :=  st_ConstUnit.st_prp_his_DelPeriod[PLanguageIndex];
frm_prp_History.prp_history_CancelButton.Caption    :=  st_ConstUnit.st_Cancel[PLanguageIndex];
frm_prp_History.prp_history_OkButton.Hint        :=  st_ConstUnit.st_prp_his_Choose[PLanguageIndex];
frm_prp_History.DeleteHistory_Button.Hint        :=  st_ConstUnit.st_prp_his_DelPeriod[PLanguageIndex];
frm_prp_History.prp_history_CancelButton.Hint    :=  st_ConstUnit.st_Cancel[PLanguageIndex];
          ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PROPI_HISTORY_SEL_FULL('+ inttostr(edit_item_id)+')' ;
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
              frm_prp_History.prp_History_GridTableView.DataController.RecordCount := ReadDataSet.RecordCount;

              for i := 0 to ReadDataSet.RecordCount-2  do begin
              frm_prp_History.prp_History_GridTableView.DataController.Values[i, 0] := ReadDataSet['BEG_PROPIS'];
              frm_prp_History.prp_History_GridTableView.DataController.Values[i, 1]:=ReadDataSet['END_PROPIS'];
              if ReadDataSet['DATE_VYPIS']<>null then begin
              frm_prp_History.prp_History_GridTableView.DataController.Values[i, 2]:= 'история' + ' (выписан)';
              frm_prp_History.prp_History_GridTableView.DataController.Values[i, 3]:= ReadDataSet['DATE_VYPIS'];
              end
              else
              frm_prp_History.prp_History_GridTableView.DataController.Values[i, 2]:= 'история';
              ReadDataSet.Next;
              end;
              ReadDataSet.Last;
         // добавляю в грид признак последней записи истории
              frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 4]:=1;

              if ReadDataSet['IS_NULL_PERIOD'] = 1 then  begin
                  if ReadDataSet['BEG_PROPIS'] <> null then
                      frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 0]:= ReadDataSet['BEG_PROPIS']
                  else
                      frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 0]:= 'нет даты начала';
                  frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 1]:= 'нет даты окончания';
                  frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 2]:= 'текущая прописка';
              end
              else
              begin
                  if ReadDataSet['BEG_PROPIS'] <> null then
                      frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 0]:= ReadDataSet['BEG_PROPIS']
                  else
                      frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 0]:= 'нет даты начала';
                  frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 1]:= ReadDataSet['END_PROPIS'];

                  if ReadDataSet['END_PROPIS'] < DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP then
                  begin
                      if Registration_Form.DataSet['STATUS'] = 'Прописан' then
                          frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 2]:= 'история' + ' (прописан)';

                      if Registration_Form.DataSet['STATUS'] = 'Выписан' then
                          frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 2]:= 'история' + ' (выписан)';
                  end
                  else
                      frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.RecordCount-1, 2]:= 'текущая прописка';
              end;
          ReadDataSet.Close;
//          if Registration_Form.DataSet['STATUS'] = 'Зарегистрированный' then  frm_prp_History.prp_history_OkButton.Visible:=false;

if frm_prp_History.ShowModal = mrOk then
begin
// чистка контролов - для правильного отображения истории
   prp_prp_Country_TextEdit.Text:='';
   prp_prp_Oblast_ComboBox.ItemIndex:=-1;
   prp_prp_Oblast_ComboBox.ItemIndex:=-1;
   prp_prp_Oblast_TextEdit.Text:='';
   prp_prp_Rayon_TextEdit.Text:='';
   prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=-1;
   prp_prp_Gorod_TextEdit.Text:='';
   prp_prp_Index_TextEdit.Text:='0';
   prp_prp_Selo_TextEdit.Text:='';
   prp_prp_Street_TextEdit.Text:='';
   prp_prp_HouseNumber_TextEdit.Text:='';
   prp_prp_KvartNumber_TextEdit.Text:='';
   prp_prp_RAJ_D_TextEdit.Text:='';
   prp_prp_STREET_D_TextEdit.Text:='';
   prp_prp_HOUSE_D_TextEdit.Text:='';
   prp_prp_KVART_D_TextEdit.Text:='';

   prp_prp_DATE_PRIB_DateEdit.date:=-700000;

   prp_prp_DateIncome.ClearSelection;
   prp_prp_DateBegPropi.date:=-700000;
   prp_prp_DateEndPropi.date:=-700000;
   prp_dp_DateMestoUbitiya.Text:='';
   prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
   prp_dp_Srok_ComboBox.ItemIndex:=-1;
   prp_dp_ResonPriezd_ComboBox.ItemIndex:=-1;
   prp_dp_GdeRabotal_TextEdit.Text:='';
   prp_dp_KemRabotal_TextEdit.Text:='';
   prp_dp_Osvita_ComboBox.ItemIndex:=-1;
   prp_dp_UchStepen_ComboBox.ItemIndex:=-1;
   prp_dp_Specialnost_TextEdit.Text:='';
   prp_dp_Gragdanstvo_TextEdit.Text:='';
   prp_dp_Nazionalnost_TextEdit.Text:='';
   prp_dp_DomTelefon_MaskEdit.Text:='';
   prp_fs_SimStan_ComboBox.ItemIndex:=-1;

   // чистка выписки
   prp_vip_Country_TextEdit.Text:='';
   prp_vip_Oblast_TextEdit.Text:='';
   prp_vip_Rayon_TextEdit.Text:='';
   prp_vip_Gorod_TextEdit.Text:='';
   prp_vip_Selo_TextEdit.Text:='';
   prp_vip_Street_TextEdit.Text:='';
   prp_vip_House_TextEdit.Text:='';
   prp_vip_kvartira_TextEdit.Text:='';
   prp_vip_DateIncome.Date:=-700000;
   prp_vip_Index_TextEdit.Text:='';
   prp_vip_RAJ_D_TextEdit.Text:='';
   prp_vip_STREET_D_TextEdit.Text:='';
   prp_vip_HOUSE_D_TextEdit.Text:='';
   prp_vip_KVART_D_TextEdit.Text:='';
   prp_vip_ToDonezk_CheckBox.Checked:=false;
   prp_vip_Oblast_ComboBox.ItemIndex:=-1;
   prp_vip_GorodSeloPGT_ComboBox.ItemIndex:=-1;
   prp_vip_ResonPereezd_ComboBox.ItemIndex:=-1;
   prp_vip_Osvita_ComboBox.ItemIndex:=-1;
   prp_vip_UchStepen_ComboBox.ItemIndex:=-1;
   prp_vip_GdeRabotal_TextEdit.Text:='';
   prp_vip_KemRabotal_TextEdit.Text:='';

              if frm_prp_History.prp_History_DeleteExec then
               begin
                prp_zz_DizzableAll('disable');
                                  prp_mg_Country_TextEdit.Text:='';
                                  prp_mg_Oblast_ComboBox.ItemIndex:=-1;
                                  prp_mg_Oblast_TextEdit.Text:='';
                                  prp_mg_Rayon_TextEdit.Text:='';
                                  prp_mg_Selo_TextEdit.Text:='';
                                  prp_mg_Index_TextEdit.Text:='';
                                  prp_mg_Gorod_TextEdit.Text:='';
                                  prp_mg_GorodSeloPGT_ComboBox.ItemIndex:=-1;

                                  prp_PaspGridTableView.DataController.RecordCount:=0;

                                  prp_vu_FromRVK_TextEdit.Text:='';
                                  prp_vu_PostavlenDate.Date:=-700000;
                                  prp_vu_Notes.Text:='';
                                  prp_vu_SnyatDate.Date:=-700000;

                                  prp_PasVidan_Label.Caption:='';
                                  prp_DateVidan_Label.Caption:='';

                                  prp_GridTableView.DataController.RecordCount:=0;
                                  prp_Rodstv_GridTableView.DataController.RecordCount:=0;

                                  prp_f_Familia_Edit.Text:='';
                                  prp_f_Name_Edit.Text:='';
                                  prp_f_Otch_Edit.Text:='';
                                  prp_f_MestoRaboti_TextEdit.Text:='';
                                  prp_f_Dolgnost_TextEdit.Text:='';
                                  prp_f_Oblast_TextEdit.Text:='';
                                  prp_f_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                                  prp_f_GorodSeloPGT_TextEdit.Text:='';
                                  prp_f_Street_TextEdit.Text:='';
                                  prp_f_KvartNumber_TextEdit.Text:='';
                                  prp_f_HouseNumber_TextEdit.Text:='';
                                  prp_f_Rayon_TextEdit.Text:='';
                                  prp_f_WorkTelefon_MaskEdit.Text:='';

                                  prp_m_Familia_Edit.Text:='';
                                  prp_m_Name_Edit.Text:='';
                                  prp_m_Otch_Edit.Text:='';
                                  prp_m_MestoRaboti_TextEdit.Text:='';
                                  prp_m_Dolgnost_TextEdit.Text:='';
                                  prp_m_Oblast_TextEdit.Text:='';
                                  prp_m_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                                  prp_m_GorodSeloPGT_TextEdit.Text:='';
                                  prp_m_Street_TextEdit.Text:='';
                                  prp_m_KvartNumber_TextEdit.Text:='';
                                  prp_m_HouseNumber_TextEdit.Text:='';
                                  prp_m_Rayon_TextEdit.Text:='';
                                  prp_m_WorkTelefon_MaskEdit.Text:='';

                                  prp_fs_SimStan_ComboBox.ItemIndex:=-1;

                                  prp_prp_DATE_PRIB_DateEdit.Date:=-700000;

                                  prp_SaveAll_LargeButton.Enabled:=False;
                                  prp_Prodlenie_LargeButton.Enabled:=False;
                                  prp_Vipiska_LargeButton.Enabled:=False;
                                  prp_History_LargeButton.Enabled:=False;
                                  exit;
               end;

   if (
       (frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 2] <> 'текущая прописка')
       and
       (frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 2] <> 'история' + ' (прописан)')
       and
       (frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 2] <> 'история' + ' (выписан)')
       )
       then
       begin
                      prp_zz_DizzableAll('disable');

                      frmPropiska.prp_SaveAll_LargeButton.Enabled:=false;
                      frmPropiska.prp_Prodlenie_LargeButton.Enabled:=False;
                      prp_Vipiska_LargeButton.Enabled:=False;
                      frmPropiska.prp_mg_OkButton.Enabled:=false;
                      frmPropiska.prp_prp_OkButton.Enabled:=false;
                      frmPropiska.prp_vu_OkButton.Enabled:=false;
                      frmPropiska.prp_dp_OkButton.Enabled:=false;
                      frmPropiska.prp_pass_OkButton.Enabled:=false;
                      frmPropiska.prp_f_OkButton.Enabled:=false;
                      frmPropiska.prp_m_OkButton.Enabled:=false;
                      frmPropiska.prp_fs_OkButton.Enabled:=false;

                      prp_FamilyStatus_GroupBox.Enabled:=false;
                      prp_BornPlace_GroupBox.Enabled:=false;
                      prp_Propiska_GroupBox.Enabled:=false;
                      prp_Adittional_GroupBox.Enabled:=false;
                      prp_Warrior_GroupBox.Enabled:=false;
                      prp_MultiPass_GroupBox.Enabled:=false;
                      prp_Daddy_GroupBox.Enabled:=false;
                      prp_Mummi_GroupBox.Enabled:=false;
                      prp_vip_GroupBox.Enabled:=false;
                      prp_vip_dp_GroupBox.Enabled:=false;

                  date1:=frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 0];
                  date2:=frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 1];
                  if not is_date(date1) then date1:='01.01.1900';
                  if not is_date(date2) then date2:='01.01.1900';

                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PROPI_SELECT_BY_DATES('+ inttostr(edit_item_id)
                                               +','+
                                               ''''+date1+''','+
                                               ''''+date2+''')';
       showmessage(ReadDataSet.SelectSQL.Text);
                  ReadDataSet.Open;
                   // про ВОЕНКОМАТ
                      if ReadDataSet['FROM_RVK']<>null then
                      frmPropiska.prp_vu_FromRVK_TextEdit.Text:=ReadDataSet['FROM_RVK'];
                      if ReadDataSet['VU_DATE_PR']<>null then
                      frmPropiska.prp_vu_PostavlenDate.Date:=ReadDataSet['VU_DATE_PR'];
                      if ReadDataSet['VU_DATE_SN']<>null then
                      frmPropiska.prp_vu_SnyatDate.Date:=ReadDataSet['VU_DATE_SN'];
                      if ReadDataSet['VU_NOTE']<>null then
                      frmPropiska.prp_vu_Notes.Text:=ReadDataSet['VU_NOTE'];


                  // про ПРОПИСКУ
                      if ReadDataSet['BEFOR_STAT']<>null then
                      frmPropiska.prp_prp_Country_TextEdit.Text:=ReadDataSet['BEFOR_STAT'];
                      if ReadDataSet['BEFO_PUNKT']<>null then
                      frmPropiska.prp_prp_Oblast_TextEdit.Text:= ReadDataSet['BEFO_PUNKT'];
                      if ReadDataSet['BEFOR_RAJ']<>null then
                      frmPropiska.prp_prp_Rayon_TextEdit.Text:= ReadDataSet['BEFOR_RAJ'];
                      if ReadDataSet['BEFOR_TOWN']<>null then
                      frmPropiska.prp_prp_Gorod_TextEdit.Text:= ReadDataSet['BEFOR_TOWN'];
                      if ReadDataSet['BEFOR_IND']<>null then
                      frmPropiska.prp_prp_Index_TextEdit.Text:= ReadDataSet['BEFOR_IND'];
                      if ReadDataSet['BEFOR_SELO']<>null then
                      frmPropiska.prp_prp_Selo_TextEdit.Text:= ReadDataSet['BEFOR_SELO'];
                      if ReadDataSet['BEFOR_STR']<>null then
                      frmPropiska.prp_prp_Street_TextEdit.Text:= ReadDataSet['BEFOR_STR'];
                      if ReadDataSet['BEFOR_H']<>null then
                      frmPropiska.prp_prp_HouseNumber_TextEdit.Text:= ReadDataSet['BEFOR_H'];
                      if ReadDataSet['BEFOR_KV']<>null then
                      frmPropiska.prp_prp_KvartNumber_TextEdit.Text:= ReadDataSet['BEFOR_KV'];
                      if ReadDataSet['BEF_D_PR']<>null then
                      frmPropiska.prp_prp_DateIncome.Date:= ReadDataSet['BEF_D_PR'];
                      if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                          frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=true
                          else frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=false;
                      if ReadDataSet['BEG_PROPIS']<>null then
                      BEGIN
                      //frmPropiska.prp_BEG_PROPIS:= ReadDataSet['BEG_PROPIS'];
                      frmPropiska.prp_prp_DateBegPropi.Date:= ReadDataSet['BEG_PROPIS'];
                      END;
                      if ReadDataSet['END_PROPIS']<>null then
                      BEGIN
                      //frmPropiska.prp_END_PROPIS:= ReadDataSet['END_PROPIS'];
                      frmPropiska.prp_prp_DateEndPropi.Date:= ReadDataSet['END_PROPIS'];
                      END;
                      if ReadDataSet['BEFOR_NOM']<>null then
                      frmPropiska.prp_prp_NOM_TOWN_HISTORY:= ReadDataSet['BEFOR_NOM'];
                      if ReadDataSet['NOM_PUNKT']<>null then
                      frmPropiska.prp_prp_NOM_PUNKT_HISTORY:= ReadDataSet['NOM_PUNKT'];

                       if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                            begin
                              if ReadDataSet['RAJ_D']<>null then
                              frmPropiska.prp_prp_RAJ_D_TextEdit.Text:= ReadDataSet['RAJ_D'];
                              if ReadDataSet['STREET_D']<>null then
                              frmPropiska.prp_prp_STREET_D_TextEdit.Text:= ReadDataSet['STREET_D'];
                              if ReadDataSet['HOUSE_D']<>null then
                              frmPropiska.prp_prp_HOUSE_D_TextEdit.Text:= ReadDataSet['HOUSE_D'];
                              if ReadDataSet['KVART_D']<>null then
                              frmPropiska.prp_prp_KVART_D_TextEdit.Text:= ReadDataSet['KVART_D'];
                              if ReadDataSet['DATE_PRIB']<>null then
                              frmPropiska.prp_prp_DATE_PRIB_DateEdit.date:= ReadDataSet['DATE_PRIB'] ;
                            end;

                    if ReadDataSet['TO_DON']<>null then
                        if ReadDataSet['TO_DON'] = 1 then
                          if frmPropiska.prp_Vipiska_Sheet.TabVisible then
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=0;
                          frmPropiska.prp_vip_ToDonezk_CheckBox.Checked:=true;
                          end
                        else
                          if frmPropiska.prp_Vipiska_Sheet.TabVisible then
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=0;
                          frmPropiska.prp_vip_ToDonezk_CheckBox.Checked:=false;
                          end;


                             if Registration_Form.DataSet['STATUS'] <> null then
                           if ((Registration_Form.DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vipiska_Sheet.TabVisible))
                             then begin
                              if ReadDataSet['AFTE_OBL']<>null then
                             frmPropiska.prp_vip_Oblast_TextEdit.Text:=ReadDataSet['AFTE_OBL'];
                             if ReadDataSet['AFTE_RAJ']<>null then
                             frmPropiska.prp_vip_Rayon_TextEdit.Text:=ReadDataSet['AFTE_RAJ'];
                             if ReadDataSet['AFTE_TOWN']<>null then
                             frmPropiska.prp_vip_Gorod_TextEdit.Text:=ReadDataSet['AFTE_TOWN'];

                             if ReadDataSet['AFTE_SELO']<>null then
                             frmPropiska.prp_vip_Selo_TextEdit.Text:=ReadDataSet['AFTE_SELO'];

                             if ReadDataSet['AFTE_STREET']<>null then
                             frmPropiska.prp_vip_street_TextEdit.Text:=ReadDataSet['AFTE_STREET'];
                             IF ReadDataSet['AFTE_HOUSE']<>null then
                             frmPropiska.prp_vip_house_TextEdit.Text:=ReadDataSet['AFTE_HOUSE'];
                             IF ReadDataSet['AFTE_KVARTIRA']<>null then
                             frmPropiska.prp_vip_kvartira_TextEdit.Text:=ReadDataSet['AFTE_KVARTIRA'];

                            { if ReadDataSet['TYPE_AF_TO']<>null then
                             frmPropiska.prp_vip
                             if ReadDataSet['TYPE_AF_OB']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_IND']<>null then
                             frmPropiska.prp_vip_Index_TextEdit.Text:= ReadDataSet['AFTE_IND'];
                             if ReadDataSet['AFTE_STAT']<>null then
                             frmPropiska.prp_vip_Country_TextEdit.Text:= ReadDataSet['AFTE_STAT'];
                            { if ReadDataSet['AFTE_N_PR']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_D_PR']<>null then
                             frmPropiska.prp_vip_DateIncome.Date:=ReadDataSet['AFTE_D_PR'];
                            { if ReadDataSet['TO_DON']<>null then
                             frmPropiska.prp_vip}

                          if ReadDataSet['TO_DON']<>null then
                          if ReadDataSet['TO_DON'] = 1 then
                            begin
                              if ReadDataSet['RAJ_D_U']<>null then
                              frmPropiska.prp_vip_RAJ_D_TextEdit.Text:= ReadDataSet['RAJ_D_U'];
                              if ReadDataSet['STREET_D_U']<>null then
                              frmPropiska.prp_vip_STREET_D_TextEdit.Text:= ReadDataSet['STREET_D_U'];
                              if ReadDataSet['HOUSE_D_U']<>null then
                              frmPropiska.prp_vip_HOUSE_D_TextEdit.Text:= ReadDataSet['HOUSE_D_U'];
                              if ReadDataSet['KVART_D_U']<>null then
                              frmPropiska.prp_vip_KVART_D_TextEdit.Text:= ReadDataSet['KVART_D_U'];
                            end;
                             end;


                   // про ДОПОЛНИТЕЛЬНО
                      if ReadDataSet['BEFO_YEAR']<>null then
                      frmPropiska.prp_dp_DateMestoUbitiya.text:= ReadDataSet['BEFO_YEAR'];
                      if ReadDataSet['BEFO_WHERE']<>null then
                      frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:=ReadDataSet['BEFO_WHERE'];
                      if ReadDataSet['BEFO_POSADA']<>null then
                      frmPropiska.prp_dp_KemRabotal_TextEdit.Text:=ReadDataSet['BEFO_POSADA'];
                      if ReadDataSet['GROMADYN']<>null then
                      frmPropiska.prp_dp_Gragdanstvo_TextEdit.Text:= ReadDataSet['GROMADYN'];
                      if ReadDataSet['NAZIONAL']<>null then
                      frmPropiska.prp_dp_Nazionalnost_TextEdit.Text:= ReadDataSet['NAZIONAL'];
                      if ReadDataSet['PHONE']<>null then
                      frmPropiska.prp_dp_DomTelefon_MaskEdit.Text:= ReadDataSet['PHONE'];
                      if ReadDataSet['BEFO_OSVITA']<>null then
                      frmPropiska.prp_dp_BEFO_OSVITA_HISTORY:=ReadDataSet['BEFO_OSVITA'];
                      if ReadDataSet['BEFO_STUPEN']<>null then
                      frmPropiska.prp_dp_BEFO_STUPEN_HISTORY:= ReadDataSet['BEFO_STUPEN'];
                      if ReadDataSet['BEFO_META']<>null then
                      frmPropiska.prp_dp_BEFO_META_HISTORY:=ReadDataSet['BEFO_META'];
                      if ReadDataSet['BEFO_STAN']<>null then
                      frmPropiska.prp_fs_BEFO_STAN_HISTORY:= ReadDataSet['BEFO_STAN'];

                      if ReadDataSet['BEFO_VMESTE']<>null then
                      if ReadDataSet['BEFO_VMESTE']=1 then
                      frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=true
                      else frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=false;

                      if ReadDataSet['BEFO_STROK']<>null then
                      if ReadDataSet['BEFO_STROK']=1 then
                      frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=1;

                      if ReadDataSet['BEFO_RESON']<>null then
                      if ReadDataSet['BEFO_RESON']=1 then
                      frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=1;

                  ReadDataSet.Close;

                  if  frmPropiska.prp_prp_NOM_TOWN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_TOWN_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                      end;



                      if  frmPropiska.prp_prp_NOM_PUNKT <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_GET_NAME_PUNKT_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_PUNKT_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_Oblast_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_Oblast_ComboBox.Text = ReadDataSet['N_PUNKT'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=-1;
                      end;


                      if  frmPropiska.prp_dp_BEFO_OSVITA <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_GET_NAME_OSVITA_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_OSVITA_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_Osvita_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_Osvita_ComboBox.Text = ReadDataSet['N_OSVITA'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_dp_BEFO_META <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_RESON from ST_GET_NAME_RESON_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_META_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_ResonPereezd_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_ResonPereezd_ComboBox.Text = ReadDataSet['N_RESON'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_dp_BEFO_STUPEN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_GET_NAME_STUPEN_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_STUPEN_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_UchStepen_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_UchStepen_ComboBox.Text = ReadDataSet['N_STUPEN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_fs_BEFO_STAN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STAN from ST_GET_NAME_STAN_BY_ID('+ inttostr(frmPropiska.prp_fs_BEFO_STAN_HISTORY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_fs_SimStan_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_fs_SimStan_ComboBox.Text = ReadDataSet['N_STAN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=-1;
                      end;

        end
        else
        begin
         if frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 2] <> 'история' + ' (выписан)'

           then begin
           prp_zz_DizzableAll('enable');

           frmPropiska.prp_SaveAll_LargeButton.Enabled:=true;
                      frmPropiska.prp_Prodlenie_LargeButton.Enabled:=False;

                         if Registration_Form.DataSet['STATUS'] <> 'Зарегистрированный' then
                           prp_Vipiska_LargeButton.Enabled:=True
                           else begin
                           prp_Vipiska_LargeButton.Enabled:=False;
                           prp_Prodlenie_LargeButton.Enabled:=False;
                           end;

                      frmPropiska.prp_mg_OkButton.Enabled:=true;
                      frmPropiska.prp_prp_OkButton.Enabled:=true;
                      frmPropiska.prp_vu_OkButton.Enabled:=true;
                      frmPropiska.prp_dp_OkButton.Enabled:=true;
                      frmPropiska.prp_pass_OkButton.Enabled:=true;
                      frmPropiska.prp_f_OkButton.Enabled:=true;
                      frmPropiska.prp_m_OkButton.Enabled:=true;
                      frmPropiska.prp_fs_OkButton.Enabled:=true;

                      prp_FamilyStatus_GroupBox.Enabled:=true;
                      prp_BornPlace_GroupBox.Enabled:=true;
                      prp_Propiska_GroupBox.Enabled:=true;
                      prp_Adittional_GroupBox.Enabled:=true;
                      prp_Warrior_GroupBox.Enabled:=true;
                      prp_MultiPass_GroupBox.Enabled:=true;
                      prp_Daddy_GroupBox.Enabled:=true;
                      prp_Mummi_GroupBox.Enabled:=true;
                      prp_vip_GroupBox.Enabled:=true;
                      prp_vip_dp_GroupBox.Enabled:=true;
          end;
         if frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 2] = 'история' + ' (выписан)'
         then begin
           prp_zz_DizzableAll('enable');
           if ((not prp_prp_FromDonezk_CheckBox.Checked) and (not prp_Vipiska_Sheet.TabVisible ))then
           frmPropiska.Height:=frmPropiska.Height+63;

           frmPropiska.prp_Vipiska_Sheet.TabVisible:=true;
           frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible:=true;

                      frmPropiska.prp_Prodlenie_LargeButton.Enabled:=True;
                      frmPropiska.prp_prp_OkButton.Enabled:=false;
                      frmPropiska.prp_dp_OkButton.Enabled:=false;
                      frmPropiska.prp_SaveAll_LargeButton.Enabled:=true;

                      prp_FamilyStatus_GroupBox.Enabled:=true;
                      prp_BornPlace_GroupBox.Enabled:=true;
                      prp_Propiska_GroupBox.Enabled:=true;
                      prp_Adittional_GroupBox.Enabled:=true;
                      prp_Warrior_GroupBox.Enabled:=true;
                      prp_MultiPass_GroupBox.Enabled:=true;
                      prp_Daddy_GroupBox.Enabled:=true;
                      prp_Mummi_GroupBox.Enabled:=true;
                      prp_vip_GroupBox.Enabled:=true;
                      prp_vip_dp_GroupBox.Enabled:=true;
                       // изменение цвета прописки
                       frmPropiska.prp_prp_Country_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Oblast_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Oblast_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Rayon_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_RAJ_D_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_DateIncome.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_DateBegPropi.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_DateEndPropi.Style.Color:= clBtnFace;
                       frmPropiska.prp_AdresPropi_Edit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_HouseNumber_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_HOUSE_D_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Index_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_KvartNumber_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_KVART_D_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Selo_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Street_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_STREET_D_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_Gorod_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_prp_DATE_PRIB_DateEdit.Style.Color:= clBtnFace;
                      // изменение цвета в дополнительно

                       frmPropiska.prp_dp_DateMestoUbitiya.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_ResonPriezd_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_Srok_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_ResonPereezd_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_GdeRabotal_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_KemRabotal_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_Osvita_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_UchStepen_ComboBox.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_Gragdanstvo_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_Nazionalnost_TextEdit.Style.Color:= clBtnFace;
                       frmPropiska.prp_dp_DomTelefon_MaskEdit.Style.Color:= clBtnFace;

                      frmPropiska.prp_Propiska_GroupBox.Enabled:=false;
                      frmPropiska.prp_Adittional_GroupBox.Enabled:=false;

                  end;


{ TODO 1 -oЧернявский -cВыписка :
Нужно написать процедуру. аналогичную st_propi_select вместо нее, но от
параметров по дате выписки и коду и по ней отбирать историю
для выписанного периода  
(проверка по Хоменко Д. id_kod = 1999110413484753)}


{ TODO 2 -oЧернявский -cВыписка : 
Прятать вкладки по выписке при переходе на текущий период, если 
этот период по статусу не выписан }


//-------------------------------------------- при любых условиях здесь начинается отбор данных--------------------------------

// нужно проверить, что период не последний - иначе - закрыть все нужно залочить

if frm_prp_History.prp_History_GridTableView.DataController.Values[frm_prp_History.prp_History_GridTableView.DataController.FocusedRecordIndex, 4]<>inttostr(1) then
  begin
    prp_zz_DizzableAll('disable');
    prp_BornPlace_GroupBox.Enabled:=false;
    prp_Daddy_GroupBox.Enabled:=false;
    prp_Mummi_GroupBox.Enabled:=false;
    prp_FamilyStatus_GroupBox.Enabled:=false;
    if prp_vip_dp_GroupBox.Visible then
    prp_vip_dp_GroupBox.Enabled:=false;
    prp_MultiPass_GroupBox.Enabled:=false;
    if prp_vip_GroupBox.Visible then
    prp_vip_GroupBox.Enabled:=false;
    prp_Warrior_GroupBox.Enabled:=false;
    prp_SaveAll_LargeButton.Enabled:=False;
    prp_Prodlenie_LargeButton.Enabled:=False;
    prp_Vipiska_LargeButton.Enabled:=False;
  end
  else
  begin
    prp_zz_DizzableAll('enable');
    prp_BornPlace_GroupBox.Enabled:=true;
    prp_Daddy_GroupBox.Enabled:=true;
    prp_Mummi_GroupBox.Enabled:=true;
    prp_FamilyStatus_GroupBox.Enabled:=true;
    prp_MultiPass_GroupBox.Enabled:=true;
    prp_Warrior_GroupBox.Enabled:=true;
    if prp_vip_dp_GroupBox.Visible then
    prp_vip_dp_GroupBox.Enabled:=true;
    prp_MultiPass_GroupBox.Enabled:=true;
    if prp_vip_GroupBox.Visible then
    prp_vip_GroupBox.Enabled:=true;
    prp_SaveAll_LargeButton.Enabled:=True;
  end;

                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PROPI_SELECT('+ inttostr(edit_item_id)+')' ;
                  ReadDataSet.Open;
                   // про ВОЕНКОМАТ
                      if ReadDataSet['FROM_RVK']<>null then
                      frmPropiska.prp_vu_FromRVK_TextEdit.Text:=ReadDataSet['FROM_RVK'];
                      if ReadDataSet['VU_DATE_PR']<>null then
                      frmPropiska.prp_vu_PostavlenDate.Date:=ReadDataSet['VU_DATE_PR'];
                      if ReadDataSet['VU_DATE_SN']<>null then
                      frmPropiska.prp_vu_SnyatDate.Date:=ReadDataSet['VU_DATE_SN'];
                      if ReadDataSet['VU_NOTE']<>null then
                      frmPropiska.prp_vu_Notes.Text:=ReadDataSet['VU_NOTE'];


                  // про ПРОПИСКУ
                      if ReadDataSet['BEFOR_STAT']<>null then
                      frmPropiska.prp_prp_Country_TextEdit.Text:=ReadDataSet['BEFOR_STAT'];
                      if ReadDataSet['BEFO_PUNKT']<>null then
                      frmPropiska.prp_prp_Oblast_TextEdit.Text:= ReadDataSet['BEFO_PUNKT'];
                      if ReadDataSet['BEFOR_RAJ']<>null then
                      frmPropiska.prp_prp_Rayon_TextEdit.Text:= ReadDataSet['BEFOR_RAJ'];
                      if ReadDataSet['BEFOR_TOWN']<>null then
                      frmPropiska.prp_prp_Gorod_TextEdit.Text:= ReadDataSet['BEFOR_TOWN'];
                      if ReadDataSet['BEFOR_IND']<>null then
                      frmPropiska.prp_prp_Index_TextEdit.Text:= ReadDataSet['BEFOR_IND'];
                      if ReadDataSet['BEFOR_SELO']<>null then
                      frmPropiska.prp_prp_Selo_TextEdit.Text:= ReadDataSet['BEFOR_SELO'];
                      if ReadDataSet['BEFOR_STR']<>null then
                      frmPropiska.prp_prp_Street_TextEdit.Text:= ReadDataSet['BEFOR_STR'];
                      if ReadDataSet['BEFOR_H']<>null then
                      frmPropiska.prp_prp_HouseNumber_TextEdit.Text:= ReadDataSet['BEFOR_H'];
                      if ReadDataSet['BEFOR_KV']<>null then
                      frmPropiska.prp_prp_KvartNumber_TextEdit.Text:= ReadDataSet['BEFOR_KV'];
                      if ReadDataSet['BEF_D_PR']<>null then
                      frmPropiska.prp_prp_DateIncome.Date:= ReadDataSet['BEF_D_PR'];
                      if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                          frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=true
                          else frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=false;
                      if ReadDataSet['BEG_PROPIS']<>null then
                      BEGIN
                      frmPropiska.prp_BEG_PROPIS:= ReadDataSet['BEG_PROPIS'];
                      frmPropiska.prp_prp_DateBegPropi.Date:= ReadDataSet['BEG_PROPIS'];
                      END;
                      if ReadDataSet['END_PROPIS']<>null then
                      BEGIN
                      frmPropiska.prp_END_PROPIS:= ReadDataSet['END_PROPIS'];
                      frmPropiska.prp_prp_DateEndPropi.Date:= ReadDataSet['END_PROPIS'];

                      if ReadDataSet['END_PROPIS']< DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP then
                      begin
                     // frmPropiska.prp_SaveAll_LargeButton.Enabled:=false;
                      frmPropiska.prp_Prodlenie_LargeButton.Enabled:=True;
                     // frmPropiska.prp_mg_OkButton.Enabled:=false;
                     // frmPropiska.prp_prp_OkButton.Enabled:=false;
                     // frmPropiska.prp_vu_OkButton.Enabled:=false;
                     // frmPropiska.prp_dp_OkButton.Enabled:=false;
                    //  frmPropiska.prp_pass_OkButton.Enabled:=false;
                     // frmPropiska.prp_f_OkButton.Enabled:=false;
                     // frmPropiska.prp_m_OkButton.Enabled:=false;
                     // frmPropiska.prp_fs_OkButton.Enabled:=false;
                      end;

                             if ReadDataSet['AFTE_OBL']<>null then
                             frmPropiska.prp_vip_Oblast_TextEdit.Text:=ReadDataSet['AFTE_OBL'];
                             if ReadDataSet['AFTE_RAJ']<>null then
                             frmPropiska.prp_vip_Rayon_TextEdit.Text:=ReadDataSet['AFTE_RAJ'];
                             if ReadDataSet['AFTE_TOWN']<>null then
                             frmPropiska.prp_vip_Gorod_TextEdit.Text:=ReadDataSet['AFTE_TOWN'];

                             if ReadDataSet['AFTE_SELO']<>null then
                             frmPropiska.prp_vip_Selo_TextEdit.Text:=ReadDataSet['AFTE_SELO'];

                             if ReadDataSet['AFTE_STREET']<>null then
                             frmPropiska.prp_vip_street_TextEdit.Text:=ReadDataSet['AFTE_STREET'];
                             IF ReadDataSet['AFTE_HOUSE']<>null then
                             frmPropiska.prp_vip_house_TextEdit.Text:=ReadDataSet['AFTE_HOUSE'];
                             IF ReadDataSet['AFTE_KVARTIRA']<>null then
                             frmPropiska.prp_vip_kvartira_TextEdit.Text:=ReadDataSet['AFTE_KVARTIRA'];
                             
                            { if ReadDataSet['TYPE_AF_TO']<>null then
                             frmPropiska.prp_vip
                             if ReadDataSet['TYPE_AF_OB']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_IND']<>null then
                             frmPropiska.prp_vip_Index_TextEdit.Text:= ReadDataSet['AFTE_IND'];
                             if ReadDataSet['AFTE_STAT']<>null then
                             frmPropiska.prp_vip_Country_TextEdit.Text:= ReadDataSet['AFTE_STAT'];
                            { if ReadDataSet['AFTE_N_PR']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_D_PR']<>null then
                             frmPropiska.prp_vip_DateIncome.Date:=ReadDataSet['AFTE_D_PR'];

                      END;
                      if ReadDataSet['BEFOR_NOM']<>null then
                      frmPropiska.prp_prp_NOM_TOWN:= ReadDataSet['BEFOR_NOM'];
                      if ReadDataSet['NOM_PUNKT']<>null then
                      frmPropiska.prp_prp_NOM_PUNKT:= ReadDataSet['NOM_PUNKT'];

                       if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                            begin
                              if ReadDataSet['RAJ_D']<>null then
                              frmPropiska.prp_prp_RAJ_D_TextEdit.Text:= ReadDataSet['RAJ_D'];
                              if ReadDataSet['STREET_D']<>null then
                              frmPropiska.prp_prp_STREET_D_TextEdit.Text:= ReadDataSet['STREET_D'];
                              if ReadDataSet['HOUSE_D']<>null then
                              frmPropiska.prp_prp_HOUSE_D_TextEdit.Text:= ReadDataSet['HOUSE_D'];
                              if ReadDataSet['KVART_D']<>null then
                              frmPropiska.prp_prp_KVART_D_TextEdit.Text:= ReadDataSet['KVART_D'];
                              if ReadDataSet['DATE_PRIB']<>null then
                              frmPropiska.prp_prp_DATE_PRIB_DateEdit.date:= ReadDataSet['DATE_PRIB'] ;
                            end;
                            
                   // про ДОПОЛНИТЕЛЬНО
                      if ReadDataSet['BEFO_YEAR']<>null then
                      frmPropiska.prp_dp_DateMestoUbitiya.text:= ReadDataSet['BEFO_YEAR'];
                      if ReadDataSet['BEFO_WHERE']<>null then
                      frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:=ReadDataSet['BEFO_WHERE'];
                      if ReadDataSet['BEFO_POSADA']<>null then
                      frmPropiska.prp_dp_KemRabotal_TextEdit.Text:=ReadDataSet['BEFO_POSADA'];
                      if ReadDataSet['GROMADYN']<>null then
                      frmPropiska.prp_dp_Gragdanstvo_TextEdit.Text:= ReadDataSet['GROMADYN'];
                      if ReadDataSet['NAZIONAL']<>null then
                      frmPropiska.prp_dp_Nazionalnost_TextEdit.Text:= ReadDataSet['NAZIONAL'];
                      if ReadDataSet['PHONE']<>null then
                      frmPropiska.prp_dp_DomTelefon_MaskEdit.Text:= ReadDataSet['PHONE'];
                      if ReadDataSet['BEFO_OSVITA']<>null then
                      frmPropiska.prp_dp_BEFO_OSVITA:=ReadDataSet['BEFO_OSVITA'];
                      if ReadDataSet['BEFO_STUPEN']<>null then
                      frmPropiska.prp_dp_BEFO_STUPEN:= ReadDataSet['BEFO_STUPEN'];
                      if ReadDataSet['BEFO_META']<>null then
                      frmPropiska.prp_dp_BEFO_META:=ReadDataSet['BEFO_META'];
                      if ReadDataSet['BEFO_STAN']<>null then
                      frmPropiska.prp_fs_BEFO_STAN:= ReadDataSet['BEFO_STAN'];

                      if ReadDataSet['BEFO_VMESTE']<>null then
                      if ReadDataSet['BEFO_VMESTE']=1 then
                      frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=true
                      else frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=false;

                      if ReadDataSet['BEFO_STROK']<>null then
                      if ReadDataSet['BEFO_STROK']=1 then
                      frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=1;

                      if ReadDataSet['BEFO_RESON']<>null then
                      if ReadDataSet['BEFO_RESON']=1 then
                      frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=1;

                  ReadDataSet.Close;

                  if  frmPropiska.prp_prp_NOM_TOWN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_TOWN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                      end;



                      if  frmPropiska.prp_prp_NOM_PUNKT <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_GET_NAME_PUNKT_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_PUNKT)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_Oblast_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_Oblast_ComboBox.Text = ReadDataSet['N_PUNKT'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=-1;
                      end;


                      if  frmPropiska.prp_dp_BEFO_OSVITA <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_GET_NAME_OSVITA_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_OSVITA)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_Osvita_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_Osvita_ComboBox.Text = ReadDataSet['N_OSVITA'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_dp_BEFO_META <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_RESON from ST_GET_NAME_RESON_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_META)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_ResonPereezd_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_ResonPereezd_ComboBox.Text = ReadDataSet['N_RESON'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_dp_BEFO_STUPEN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_GET_NAME_STUPEN_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_STUPEN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_UchStepen_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_UchStepen_ComboBox.Text = ReadDataSet['N_STUPEN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=-1;
                      end;

                      if  frmPropiska.prp_fs_BEFO_STAN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STAN from ST_GET_NAME_STAN_BY_ID('+ inttostr(frmPropiska.prp_fs_BEFO_STAN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_fs_SimStan_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_fs_SimStan_ComboBox.Text = ReadDataSet['N_STAN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=-1;
                      end;

        end;
end;
frm_prp_History.Free;
end;

procedure TfrmPropiska.prp_Prodlenie_LargeButtonClick(Sender: TObject);
begin
try
ProdlenieMode :=true;
//frmPropiska.Height:=frmPropiska.Height-63;
 {  prp_PageControl.ActivePageIndex:=3;
   prp_prp_Country_TextEdit.Text:='';
   prp_prp_Oblast_ComboBox.ItemIndex:=-1;
   prp_prp_Oblast_ComboBox.ItemIndex:=-1;
   prp_prp_Oblast_TextEdit.Text:='';
   prp_prp_Rayon_TextEdit.Text:='';
   prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=-1;
   prp_prp_Gorod_TextEdit.Text:='';
   prp_prp_Index_TextEdit.Text:='0';
   prp_prp_Selo_TextEdit.Text:='';
   prp_prp_Street_TextEdit.Text:='';
   prp_prp_HouseNumber_TextEdit.Text:='';
   prp_prp_KvartNumber_TextEdit.Text:='';
   prp_prp_DateIncome.date:=DataModule1.CURRENT_TIMESTAMP;}
   prp_prp_DateBegPropi.date:= -700000;
   prp_prp_DateEndPropi.date:=StrToDate('01.01.3333'); //DataModule1.CURRENT_TIMESTAMP+365;

  { prp_prp_RAJ_D_TextEdit.Text:='';
   prp_prp_STREET_D_TextEdit.Text:='';
   prp_prp_HOUSE_D_TextEdit.Text:='';
   prp_prp_KVART_D_TextEdit.Text:='';
   prp_prp_DATE_PRIB_DateEdit.Date:=-700000;}

 {  prp_dp_DateMestoUbitiya.Text:='';
   prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
   prp_dp_Srok_ComboBox.ItemIndex:=-1;
   prp_dp_ResonPriezd_ComboBox.ItemIndex:=-1;
   prp_dp_GdeRabotal_TextEdit.Text:='';
   prp_dp_KemRabotal_TextEdit.Text:='';
   prp_dp_Osvita_ComboBox.ItemIndex:=-1;
   prp_dp_UchStepen_ComboBox.ItemIndex:=-1;
   prp_dp_Specialnost_TextEdit.Text:='';
   prp_dp_Gragdanstvo_TextEdit.Text:='';
   prp_dp_Nazionalnost_TextEdit.Text:='';
   prp_dp_DomTelefon_MaskEdit.Text:='';
   prp_fs_SimStan_ComboBox.ItemIndex:=-1;}

                      prp_SaveAll_LargeButton.Enabled:=true;
                      frmPropiska.prp_mg_OkButton.Enabled:=true;
                      frmPropiska.prp_prp_OkButton.Enabled:=true;
                      frmPropiska.prp_vu_OkButton.Enabled:=true;
                      frmPropiska.prp_dp_OkButton.Enabled:=true;
                      frmPropiska.prp_pass_OkButton.Enabled:=true;
                      frmPropiska.prp_f_OkButton.Enabled:=true;
                      frmPropiska.prp_m_OkButton.Enabled:=true;
                      frmPropiska.prp_fs_OkButton.Enabled:=true;

                      Mode_BarStatic.Caption:=Mode_BarStatic.Caption + st_ConstUnit.st_LongPropi_Mode[PLanguageIndex];
                      Mode_BarStatic.Visible:=ivAlways;

                      prp_FamilyStatus_GroupBox.Enabled:=true;
                      prp_BornPlace_GroupBox.Enabled:=true;
                      prp_Propiska_GroupBox.Enabled:=true;
                      prp_Adittional_GroupBox.Enabled:=true;
                      prp_Warrior_GroupBox.Enabled:=true;
                      prp_MultiPass_GroupBox.Enabled:=true;
                      prp_Daddy_GroupBox.Enabled:=true;
                      prp_Mummi_GroupBox.Enabled:=true;

                      frmPropiska.prp_Vipiska_Sheet.TabVisible:=false;
                      frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible:=false;

  {  prp_prp_NOM_PUNKT:=-1;
    prp_prp_NOM_TOWN:= -1;
    prp_dp_BEFO_OSVITA:=-1;
    prp_dp_BEFO_STUPEN:= -1;
    prp_dp_BEFO_META:= -1;
    prp_fs_BEFO_STAN:= -1;}
    prp_BEG_PROPIS:= 0;
    prp_END_PROPIS:= 0;

                          // изменение цвета прописки
                       prp_prp_Country_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Oblast_ComboBox.Style.Color:= clInfoBk;
                       prp_prp_Oblast_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Rayon_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_RAJ_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_DateIncome.Style.Color:= clInfoBk;
                       prp_prp_DateBegPropi.Style.Color:= clInfoBk;
                       prp_prp_DateEndPropi.Style.Color:= clInfoBk;
                       prp_AdresPropi_Edit.Style.Color:= clInfoBk;
                       prp_prp_HouseNumber_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_HOUSE_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Index_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_KvartNumber_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_KVART_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Selo_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Street_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_STREET_D_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_Gorod_TextEdit.Style.Color:= clInfoBk;
                       prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clInfoBk;
                       prp_prp_DATE_PRIB_DateEdit.Style.Color:= clInfoBk;
                      // изменение цвета в дополнительно

                       prp_dp_DateMestoUbitiya.Style.Color:= clInfoBk;
                       prp_dp_ResonPriezd_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_Srok_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_ResonPereezd_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_GdeRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_KemRabotal_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_Osvita_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_Dolgnost_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_UchStepen_ComboBox.Style.Color:= clInfoBk;
                       prp_dp_Gragdanstvo_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_Nazionalnost_TextEdit.Style.Color:= clInfoBk;
                       prp_dp_DomTelefon_MaskEdit.Style.Color:= clInfoBk;

   if Registration_Form.DataSet['STATUS'] = 'Зарегистрированный' then
   begin
   prp_Vipiska_LargeButton.Enabled:=False;
   prp_Prodlenie_LargeButton.Enabled:=False;
   end;

   if prp_prp_Country_TextEdit.CanFocusEx then
   prp_prp_Country_TextEdit.SetFocus;
finally
 try
   prp_Vipiska_LargeButton.Enabled:=False;
   prp_History_LargeButton.Enabled:=False;
   prp_Prodlenie_LargeButton.Enabled:=False;
 except
  //
 end;
end;
   end;

procedure TfrmPropiska.prp_Rodstv_Add_ButtonClick(Sender: TObject);
var
i: integer;
begin
frm_FIO_Add:=Tfrm_FIO_Add.create(self);
frm_FIO_Add.Caption :=                 st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
frm_FIO_Add.OkButton.Caption :=        st_ConstUnit.st_Accept[PLanguageIndex];
frm_FIO_Add.CancelButton.Caption :=    st_ConstUnit.st_Cancel[PLanguageIndex];
frm_FIO_Add.FIO_Label.Caption :=       st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
frm_FIO_Add.Type_Label.Caption :=      st_ConstUnit.st_prp_TypeRS[PLanguageIndex];


                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select NAME_RELATIONS from ST_INI_TYPE_FAMILY_REL_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      frm_FIO_Add.Svyaz_Combo.Clear;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        frm_FIO_Add.Svyaz_Combo.Properties.Items.Add(ReadDataSet['NAME_RELATIONS'] );
                        ReadDataSet.Next;
                      end;
                      frm_FIO_Add.Svyaz_Combo.ItemIndex:=0;
                   ReadDataSet.Close;

if frm_FIO_Add.ShowModal = mrOk then
begin
prp_Rodstv_GridTableView.DataController.RecordCount := prp_Rodstv_GridTableView.DataController.RecordCount + 1;

      ReadDataSet.Close;
      ReadDataSet.SelectSQL.Clear;
      ReadDataSet.SelectSQL.Text:='select ID_TYPE_FEM_REL from ST_GET_ID_FAMILY_REL_BY_NAME(' + '''' + frm_FIO_Add.Svyaz_Combo.Text + '''' + ')';
      ReadDataSet.open;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.RecordCount - 1, 2] := ReadDataSet['ID_TYPE_FEM_REL'];
      ReadDataSet.Close;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.RecordCount - 1, 0] := frm_FIO_Add.Fio_Edit.Text;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.RecordCount - 1, 1] := frm_FIO_Add.Svyaz_Combo.Text;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.RecordCount - 1, 3] := frm_FIO_Add.id_kod_of_relation;

  prp_Rodstv_Edit_Button.Enabled := true;
  prp_Rodstv_Delete_Button.Enabled := true;
  prp_Rodstv_GridTableView.DataController.FocusedRecordIndex:=prp_Rodstv_GridTableView.DataController.RecordCount - 1;

frm_FIO_Add.Free;
end;
end;

procedure TfrmPropiska.prp_Rodstv_Delete_ButtonClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
prp_Rodstv_GridTableView.DataController.DeleteFocused;
prp_Rodstv_GridTableView.DataController.FocusedRowIndex:=prp_Rodstv_GridTableView.DataController.RecordCount - 1;
if prp_Rodstv_GridTableView.DataController.RecordCount = 0 then
begin
prp_Rodstv_Edit_Button.Enabled:=false;
prp_Rodstv_Delete_Button.Enabled:=false;
end;
end;

procedure TfrmPropiska.prp_Rodstv_Edit_ButtonClick(Sender: TObject);
var i: integer;
begin
frm_FIO_Add:=Tfrm_FIO_Add.create(self);
frm_FIO_Add.Caption :=                 st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
frm_FIO_Add.OkButton.Caption :=        st_ConstUnit.st_Accept[PLanguageIndex];
frm_FIO_Add.CancelButton.Caption :=    st_ConstUnit.st_Cancel[PLanguageIndex];
frm_FIO_Add.FIO_Label.Caption :=       st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
frm_FIO_Add.Type_Label.Caption :=      st_ConstUnit.st_prp_TypeRS[PLanguageIndex];

                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select NAME_RELATIONS from ST_INI_TYPE_FAMILY_REL_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      frm_FIO_Add.Svyaz_Combo.Clear;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        frm_FIO_Add.Svyaz_Combo.Properties.Items.Add(ReadDataSet['NAME_RELATIONS'] );
                        ReadDataSet.Next;
                      end;
                      frm_FIO_Add.Svyaz_Combo.ItemIndex:=0;
                   ReadDataSet.Close;

                    for i:=0 to frm_FIO_Add.Svyaz_Combo.Properties.Items.Count-1 do
                    begin
                     frm_FIO_Add.Svyaz_Combo.ItemIndex:=i;
                     if frm_FIO_Add.Svyaz_Combo.Text = prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex, 1]
                      then break;
                    end;
 frm_FIO_Add.Fio_Edit.Text:=prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex,0 ];
 frm_FIO_Add.id_kod_of_relation:=prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex,3 ];

 if frm_FIO_Add.ShowModal = mrOk then
 begin
       ReadDataSet.Close;
      ReadDataSet.SelectSQL.Clear;
      ReadDataSet.SelectSQL.Text:='select ID_TYPE_FEM_REL from ST_GET_ID_FAMILY_REL_BY_NAME(' + '''' + frm_FIO_Add.Svyaz_Combo.Text + '''' + ')';
      ReadDataSet.open;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex, 2] := ReadDataSet['ID_TYPE_FEM_REL'];
      ReadDataSet.Close;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex, 0] := frm_FIO_Add.Fio_Edit.Text;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex, 1] := frm_FIO_Add.Svyaz_Combo.Text;
   prp_Rodstv_GridTableView.DataController.Values[prp_Rodstv_GridTableView.DataController.FocusedRecordIndex, 3] := frm_FIO_Add.id_kod_of_relation;

 frm_FIO_Add.Free;
 end;

 end;

procedure TfrmPropiska.prp_AdresPropi_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
frm_AdresaPropiski:=Tfrm_AdresaPropiski.create(self);
if frm_AdresaPropiski.showmodal = mrOk then
begin
 prp_AdresPropi_Edit.Text := frm_AdresaPropiski.DataSet['TOWN'] + ', ' + frm_AdresaPropiski.DataSet['RAION'] + ' р-н, ул. ' + frm_AdresaPropiski.DataSet['STREET'] + ', дом ' + frm_AdresaPropiski.DataSet['HOUSE'];
 prp_Kod_Build:= frm_AdresaPropiski.DataSet['KOD_BUILD'];
 frm_AdresaPropiski.Free;
 end;
end;

procedure TfrmPropiska.prp_prp_FromDonezk_CheckBoxClick(Sender: TObject);
begin
if prp_prp_FromDonezk_CheckBox.Checked then begin

if frmPropiska.prp_Vipiska_Sheet.TabVisible = false then
frmPropiska.Height:=frmPropiska.Height+60;

frmPropiska.Donezk_GroupBox.Visible:=true;
if frmPropiska.prp_prp_RAJ_D_TextEdit.CanFocusEx then
frmPropiska.prp_prp_RAJ_D_TextEdit.SetFocus;
end
else
begin
if frmPropiska.prp_Vipiska_Sheet.TabVisible = false then
frmPropiska.Height:=frmPropiska.Height-60;
frmPropiska.Donezk_GroupBox.Visible:=false;
end;

end;

procedure TfrmPropiska.prp_Vipiska_LargeButtonClick(Sender: TObject);
var i: integer;
begin
try
prp_Vipiska_Sheet.TabVisible:=true;
prp_Vip_Dopolnenie_Sheet.TabVisible:=true;
if not prp_prp_FromDonezk_CheckBox.Checked then
frmPropiska.Height:=frmPropiska.Height+63;

                     Mode_BarStatic.Caption:=Mode_BarStatic.Caption + st_ConstUnit.st_Vip_Mode[PLanguageIndex];
                     Mode_BarStatic.Visible:=ivAlways;

                      prp_SaveAll_LargeButton.Enabled:=true;

                      prp_Prodlenie_LargeButton.Enabled:=False;
                      prp_History_LargeButton.Enabled:=False;
                      prp_mg_OkButton.Enabled:=true;
                      prp_prp_OkButton.Enabled:=false;
                      prp_vu_OkButton.Enabled:=true;
                      prp_dp_OkButton.Enabled:=false;
                      prp_pass_OkButton.Enabled:=true;
                      prp_f_OkButton.Enabled:=true;
                      prp_m_OkButton.Enabled:=true;
                      prp_fs_OkButton.Enabled:=true;

                      prp_FamilyStatus_GroupBox.Enabled:=true;
                      prp_BornPlace_GroupBox.Enabled:=true;
                      prp_Propiska_GroupBox.Enabled:=false;
                      prp_Adittional_GroupBox.Enabled:=false;
                      prp_Warrior_GroupBox.Enabled:=true;
                      prp_MultiPass_GroupBox.Enabled:=true;
                      prp_Daddy_GroupBox.Enabled:=true;
                      prp_Mummi_GroupBox.Enabled:=true;

                      // изменение цвета прописки
                       prp_prp_Country_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Oblast_ComboBox.Style.Color:= clBtnFace;
                       prp_prp_Oblast_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Rayon_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_RAJ_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_DateIncome.Style.Color:= clBtnFace;
                       prp_prp_DateBegPropi.Style.Color:= clBtnFace;
                       prp_prp_DateEndPropi.Style.Color:= clBtnFace;
                       prp_AdresPropi_Edit.Style.Color:= clBtnFace;
                       prp_prp_HouseNumber_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_HOUSE_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Index_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_KvartNumber_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_KVART_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Selo_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Street_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_STREET_D_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_Gorod_TextEdit.Style.Color:= clBtnFace;
                       prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
                       prp_prp_DATE_PRIB_DateEdit.Style.Color:= clBtnFace;
                      // изменение цвета в дополнительно

                       prp_dp_DateMestoUbitiya.Style.Color:= clBtnFace;
                       prp_dp_ResonPriezd_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_Srok_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_ResonPereezd_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_GdeRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_KemRabotal_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_Osvita_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_UchStepen_ComboBox.Style.Color:= clBtnFace;
                       prp_dp_Gragdanstvo_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_Nazionalnost_TextEdit.Style.Color:= clBtnFace;
                       prp_dp_DomTelefon_MaskEdit.Style.Color:= clBtnFace;

prp_PageControl.ActivePageIndex:=0;

                  // Выбор наименований образования
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_INI_PROPI_OSVITA_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;

                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        prp_vip_Osvita_ComboBox.Properties.Items.Add(ReadDataSet['N_OSVITA'] );
                        ReadDataSet.Next;
                      end;
                      ReadDataSet.Close;

                  //Выбор наименований региона
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_INI_PROPI_PUNKT_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                       prp_vip_Oblast_ComboBox.Properties.Items.Add(ReadDataSet['N_PUNKT'] );
                        ReadDataSet.Next;
                      end;
                  ReadDataSet.Close;

                  // Выбор наименований причин переезда\приезда
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_RESON from ST_INI_PROPI_RESON_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        prp_vip_ResonPereezd_ComboBox.Properties.Items.Add(ReadDataSet['N_RESON'] );
                        ReadDataSet.Next;
                      end;
                  ReadDataSet.Close;


                  //Выбор наименований научных званий
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_INI_PROPI_STUPEN_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        prp_vip_UchStepen_ComboBox.Properties.Items.Add(ReadDataSet['N_STUPEN'] );
                        ReadDataSet.Next;
                      end;
                  ReadDataSet.Close;

                  // Выбор наименований организационно-структурных единиц поселения
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_INI_PROPI_TOWN_SELECT';
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
                      for i:=0 to ReadDataSet.RecordCount-1 do begin
                        prp_vip_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
                        ReadDataSet.Next;
                      end;
                  ReadDataSet.Close;

                  prp_vip_didSafe:=false;
                  prp_vip_Oblast_TextEdit.SetFocus;

finally
 try
 prp_Vipiska_LargeButton.Enabled:=False;
                frmPropiska.prp_vip_Oblast_TextEdit.Text:='ДОНЕЦКАЯ';
                frmPropiska.prp_vip_Country_TextEdit.Text:='УКРАИНА';
                frmPropiska.prp_vip_ResonPereezd_ComboBox.ItemIndex:=2;
                frmPropiska.prp_vip_GdeRabotal_TextEdit.Text:='ДОННУ';
                frmPropiska.prp_vip_KemRabotal_TextEdit.Text:='СТУДЕНТ';
                frmPropiska.prp_vip_Osvita_ComboBox.ItemIndex:=4;
                frmPropiska.prp_vip_UchStepen_ComboBox.ItemIndex:=0;
                frmPropiska.prp_vip_Oblast_ComboBox.ItemIndex:=1;
                frmPropiska.prp_vip_GorodSeloPGT_ComboBox.ItemIndex:=0;
 except
  //
 end;
end;

end;

procedure TfrmPropiska.prp_vip_ToDonezk_CheckBoxClick(Sender: TObject);
begin
if prp_vip_ToDonezk_CheckBox.Checked then begin
frmPropiska.vip_Donezk_GroupBox.Visible:=true;
if frmPropiska.prp_vip_RAJ_D_TextEdit.CanFocusEx then
frmPropiska.prp_vip_RAJ_D_TextEdit.SetFocus;
end
else
frmPropiska.vip_Donezk_GroupBox.Visible:=false;
end;

procedure TfrmPropiska.prp_prp_RAJ_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_STREET_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_STREET_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_HOUSE_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_HOUSE_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_KVART_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_KVART_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_DATE_PRIB_DateEdit.SetFocus;
end;

procedure TfrmPropiska.prp_prp_DATE_PRIB_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_prp_DateBegPropi.SetFocus;
end;

procedure TfrmPropiska.prp_Propiska_SheetExit(Sender: TObject);
begin

      if (prp_Mummi_GroupBox.Enabled and prp_Daddy_GroupBox.Enabled)then
      begin
        if prp_prp_Oblast_TextEdit.Text <> prp_Oblast_Control then
        begin
          prp_m_Oblast_TextEdit.Text:= prp_prp_Oblast_TextEdit.Text;
          prp_f_Oblast_TextEdit.Text:= prp_prp_Oblast_TextEdit.Text;
        end ;
        if ( prp_prp_Rayon_TextEdit.Text <> prp_Rayon_Control) then
        begin
          prp_m_Rayon_TextEdit.Text:= prp_prp_Rayon_TextEdit.Text;
          prp_f_Rayon_TextEdit.Text:= prp_prp_Rayon_TextEdit.Text;
        end;
        if (prp_prp_Gorod_TextEdit.Text <> prp_Gorod_Control) then
        begin
          prp_m_GorodSeloPGT_TextEdit.Text:= prp_prp_Gorod_TextEdit.Text;
          prp_f_GorodSeloPGT_TextEdit.Text:= prp_prp_Gorod_TextEdit.Text;
        end;
        if (prp_prp_Street_TextEdit.Text <> prp_Uliza_Control) then
        begin
          prp_m_Street_TextEdit.Text:= prp_prp_Street_TextEdit.Text;
          prp_f_Street_TextEdit.Text:= prp_prp_Street_TextEdit.Text;
        end;
        if (prp_prp_HouseNumber_TextEdit.Text <> prp_Dom_Control) then
        begin
          prp_m_HouseNumber_TextEdit.Text:= prp_prp_HouseNumber_TextEdit.Text;
          prp_f_HouseNumber_TextEdit.Text:= prp_prp_HouseNumber_TextEdit.Text;
        end;
        if (prp_prp_KvartNumber_TextEdit.Text <> prp_Kvartira_Control) then
        begin
          prp_m_KvartNumber_TextEdit.Text:= prp_prp_KvartNumber_TextEdit.Text;
          prp_f_KvartNumber_TextEdit.Text:= prp_prp_KvartNumber_TextEdit.Text;
        end;

        prp_f_GorodSeloPGT_ComboBox.ItemIndex:=prp_prp_GorodSeloPGT_ComboBox.ItemIndex;
        prp_m_GorodSeloPGT_ComboBox.ItemIndex:=prp_prp_GorodSeloPGT_ComboBox.ItemIndex;
    end;
end;

procedure TfrmPropiska.prp_vip_OkButtonClick(Sender: TObject);
begin
  prp_vip_Propiska_Write;

  Registration_Form.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(edit_item_id)+')';
  Registration_Form.DataSet.Refresh;
  if Registration_Form.DataSet['UK_FIO_COMBO'] <> null then Registration_Form.PIB_Label.Text := Registration_Form.DataSet['UK_FIO_COMBO'];
  if Registration_Form.DataSet['SHORT_NAME_CATEGORY'] <> null then Registration_Form.Category_Label.Text := Registration_Form.DataSet['SHORT_NAME_CATEGORY'] ;
  if Registration_Form.DataSet['NUM_DOG'] <> null then Registration_Form.Dogovor_Label.Text:=Registration_Form.DataSet['NUM_DOG'] ;
  if Registration_Form.DataSet['STATUS'] <> null then Registration_Form.Status_Edit.Text:=Registration_Form.DataSet['STATUS'] ;

end;

procedure TfrmPropiska.prp_vip_dp_OkButtonClick(Sender: TObject);
begin
prp_vip_Additional_Write;
end;

procedure TfrmPropiska.prp_vip_Country_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_Oblast_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Oblast_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_Oblast_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Oblast_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_Rayon_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Rayon_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_GorodSeloPGT_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_vip_GorodSeloPGT_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key =#13 then prp_vip_Gorod_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Gorod_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_Index_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Index_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_Selo_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Selo_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_street_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_DateIncomeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then prp_vip_ToDonezk_CheckBox.SetFocus;
end;

procedure TfrmPropiska.prp_vip_ToDonezk_CheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
if frmPropiska.vip_Donezk_GroupBox.Visible then
if frmPropiska.prp_vip_RAJ_D_TextEdit.CanFocusEx then
frmPropiska.prp_vip_RAJ_D_TextEdit.SetFocus;

if key = #13 then
if not frmPropiska.vip_Donezk_GroupBox.Visible then
prp_PageControl.ActivePageIndex:=1;

end;

procedure TfrmPropiska.prp_vip_RAJ_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_STREET_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_STREET_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_HOUSE_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_HOUSE_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_KVART_D_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_KVART_D_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
prp_PageControl.ActivePageIndex:=1;
end;

procedure TfrmPropiska.prp_vip_ResonPereezd_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then prp_vip_GdeRabotal_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_GdeRabotal_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_KemRabotal_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_KemRabotal_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_Osvita_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_vip_Osvita_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_vip_UchStepen_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_vip_UchStepen_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
prp_PageControl.ActivePageIndex:=2;
end;

procedure TfrmPropiska.prp_BornPlace_SheetExit(Sender: TObject);
begin
         if prp_Propiska_GroupBox.Enabled  then
         begin

           if prp_mg_Rayon_TextEdit.Text <> prp_born_Rayon then
                prp_prp_Rayon_TextEdit.Text:= prp_mg_Rayon_TextEdit.Text;

           if prp_mg_Gorod_TextEdit.Text <> prp_born_Gorod then
                prp_prp_Gorod_TextEdit.Text:= prp_mg_Gorod_TextEdit.Text;

           if prp_mg_Selo_TextEdit.Text <> prp_born_Selo then
                prp_prp_Selo_TextEdit.Text:= prp_mg_Selo_TextEdit.Text;

         end;

    prp_born_Rayon:=prp_mg_Rayon_TextEdit.Text;
    prp_born_Gorod:=prp_mg_Gorod_TextEdit.Text;
    prp_born_Selo:=prp_mg_Selo_TextEdit.Text;

end;

procedure TfrmPropiska.prp_PaspGridTableViewDblClick(Sender: TObject);
begin
if prp_PaspGridTableView.DataController.RecordCount = 0 then exit;
frmPropiska.prp_pass_EditButtonClick(Sender);
end;

procedure TfrmPropiska.prp_dp_DomTelefon_MaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
if prp_Warrior_Sheet.Enabled then
prp_PageControl.ActivePageIndex:=5
else
prp_PageControl.ActivePageIndex:=6;
end;

procedure TfrmPropiska.prp_f_WorkTelefon_MaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_f_Oblast_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_m_WorkTelefon_MaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_m_Oblast_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_AdresPropi_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
prp_PageControl.ActivePageIndex:=4;
end;

procedure TfrmPropiska.prp_PaspGridTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_PageControl.ActivePageIndex:=7;
end;

procedure TfrmPropiska.prp_dp_GdeRabotal_TextEditExit(Sender: TObject);
begin
{ if prp_dp_GdeRabotal_TextEdit.Text = '' then
 begin
  Screen.Cursor:=crHourGlass;
  prp_dp_Dolgnost_ComboBox.Visible:=true;
  prp_dp_Dolgnost_ComboBox.ItemIndex:=1;
  prp_dp_KemRabotal_TextEdit.Visible:=false;
  prp_dp_Dolgnost_Label.Caption:='Если не работал, то:';
  prp_dp_Dolgnost_ComboBox.SetFocus;
{  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='SELECT * FROM ST_INI_PROPI_BUSY_SELECT';
  ReadDataSet.Open;

  ReadDataSet['N_BUZY'];
  ReadDataSet.close;}
  Screen.Cursor:=crDefault;
{ end
 else
 begin
  prp_dp_Dolgnost_ComboBox.Visible:=false;
  prp_dp_KemRabotal_TextEdit.Visible:=true;
  prp_dp_Dolgnost_Label.Caption:='Должность';
  prp_dp_KemRabotal_TextEdit.SetFocus;
 end
 }
end;

procedure TfrmPropiska.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
modalresult:=mrOk;
end;

procedure TfrmPropiska.prp_dp_Dolgnost_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then prp_dp_Osvita_ComboBox.SetFocus;
end;

procedure TfrmPropiska.prp_dp_Dolgnost_ComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE then prp_dp_Dolgnost_ComboBox.ItemIndex:=-1;
end;

procedure TfrmPropiska.ckbxProdlitPropiClick(Sender: TObject);
begin
 prp_Prodlenie_LargeButton.Enabled :=  ckbxProdlitPropi.Checked;
end;

procedure TfrmPropiska.prp_vip_street_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then prp_vip_house_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_house_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then prp_vip_kvartira_TextEdit.SetFocus;
end;

procedure TfrmPropiska.prp_vip_kvartira_TextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then prp_vip_DateIncome.SetFocus;
end;

function TfrmPropiska.is_date(str_date: String):boolean;
begin
    if (Length(str_date)<>10)
        or (str_date[3]<>'.')
        or (str_date[6]<>'.')
        or not (str_date[1] in ['0','3'])
        or not (str_date[2] in ['0','9'])
        or not (str_date[4] in ['0','1'])
        or not (str_date[5] in ['0','9'])
        or not (str_date[7] in ['0','9'])
        or not (str_date[8] in ['0','9'])
        or not (str_date[9] in ['0','9'])
        or not (str_date[10]in ['0','9']) then is_date:=False
                                          else is_date:=True;
end;

end.

