{***************************************************************
* Unit KassaSetup.					                                   *
*							                                                 *
* Описание предназначения (работы) модуля: настройка кассы     *
* Copyright ©  Год 2007, Автор: Нестеренко Николай             *
***************************************************************}
unit uKassaSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, Grids, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, RxMemDS,
  Buttons, cxGridCardView, cxGridDBCardView, cxCalendar, cxButtonEdit,
  cxCheckBox, cxBlobEdit, cxDropDownEdit, cxMaskEdit, cxCalc,
  cxCurrencyEdit, cxSpinEdit, DBGrids, FIBQuery, pFIBQuery, pFIBStoredProc, IBase;

type
  TfmKassaSetup = class(TForm)
    pnAction: TPanel;
    cbtOk: TcxButton;
    cbtOkClose: TcxButton;
    cbtClose: TcxButton;
    fdbFull: TpFIBDatabase;
    ftrRead: TpFIBTransaction;
    fdsFields: TpFIBDataSet;
    ftrFields: TpFIBTransaction;
    dsFields: TDataSource;
    rxmFields: TRxMemoryData;
    pnHeader: TPanel;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    fdsProcedure: TpFIBDataSet;
    ftrProcedure: TpFIBTransaction;
    fspKassaIniIstall: TpFIBStoredProc;
    trWrite: TpFIBTransaction;
    cxgKassaSetup: TcxGrid;
    cvKassaSetup: TcxGridDBCardView;
    DATE_INSTALL_KASSA: TcxGridDBCardViewRow;
    ID_KASSA_LOAD: TcxGridDBCardViewRow;
    ID_SM: TcxGridDBCardViewRow;
    ID_RAZD: TcxGridDBCardViewRow;
    ID_ST: TcxGridDBCardViewRow;
    PREDVARIT_PROV: TcxGridDBCardViewRow;
    KASSA_BEGIN_PERIOD: TcxGridDBCardViewRow;
    KASSA_DAY_SHOW_LAST: TcxGridDBCardViewRow;
    NDS: TcxGridDBCardViewRow;
    PRINT_PASPORT: TcxGridDBCardViewRow;
    ID_GROUP_DOG: TcxGridDBCardViewRow;
    ID_GROUP_ADD_PR: TcxGridDBCardViewRow;
    ID_GROUP_ADD_RAS: TcxGridDBCardViewRow;
    ID_TYPE_DOG_KOMANDIR: TcxGridDBCardViewRow;
    ID_TYPE_DOG_HOS: TcxGridDBCardViewRow;
    MAKE_PROVERKA_TO_BUFF: TcxGridDBCardViewRow;
    lvKassaSetup: TcxGridLevel;
    cxStyleContent: TcxStyle;
    cxStyleBackground: TcxStyle;
    cxStyleNullRow: TcxStyle;
    cbtNullRow: TcxButton;
    cxStyleCaption1: TcxStyle;
    cxStyleCaption2: TcxStyle;
    cxStyleContent1: TcxStyle;
    cxStyleContent2: TcxStyle;
    OTCHET_COMMENT_SHOW: TcxGridDBCardViewRow;
    USE_ACCESS: TcxGridDBCardViewRow;
    USE_BARCODE: TcxGridDBCardViewRow;
    BARCODE_PRIH: TcxGridDBCardViewRow;
    fdsFieldsDATE_INSTALL_KASSA_V: TFIBDateField;
    fdsFieldsID_KASSA_LOAD_V: TFIBBCDField;
    fdsFieldsID_SM_V: TFIBBCDField;
    fdsFieldsID_RAZD_V: TFIBBCDField;
    fdsFieldsID_ST_V: TFIBBCDField;
    fdsFieldsPREDVARIT_PROV_V: TFIBSmallIntField;
    fdsFieldsKASSA_BEGIN_PERIOD_V: TFIBDateField;
    fdsFieldsKASSA_DAY_SHOW_LAST_V: TFIBIntegerField;
    fdsFieldsNDS_V: TFIBBCDField;
    fdsFieldsPRINT_PASPORT_V: TFIBSmallIntField;
    fdsFieldsID_GROUP_DOG_V: TFIBBCDField;
    fdsFieldsID_GROUP_ADD_PR_V: TFIBBCDField;
    fdsFieldsID_GROUP_ADD_RAS_V: TFIBBCDField;
    fdsFieldsID_TYPE_DOG_KOMANDIR_V: TFIBBCDField;
    fdsFieldsID_TYPE_DOG_HOS_V: TFIBBCDField;
    fdsFieldsMAKE_PROVERKA_TO_BUFF_V: TFIBIntegerField;
    fdsFieldsDATE_INSTALL_KASSA_N: TFIBStringField;
    fdsFieldsID_KASSA_LOAD_N: TFIBStringField;
    fdsFieldsID_SM_N: TFIBStringField;
    fdsFieldsID_RAZD_N: TFIBStringField;
    fdsFieldsID_ST_N: TFIBStringField;
    fdsFieldsPREDVARIT_PROV_N: TFIBStringField;
    fdsFieldsKASSA_BEGIN_PERIOD_N: TFIBStringField;
    fdsFieldsKASSA_DAY_SHOW_LAST_N: TFIBStringField;
    fdsFieldsNDS_N: TFIBStringField;
    fdsFieldsPRINT_PASPORT_N: TFIBStringField;
    fdsFieldsID_GROUP_DOG_N: TFIBStringField;
    fdsFieldsID_GROUP_ADD_PR_N: TFIBStringField;
    fdsFieldsID_GROUP_ADD_RAS_N: TFIBStringField;
    fdsFieldsID_TYPE_DOG_KOMANDIR_N: TFIBStringField;
    fdsFieldsID_TYPE_DOG_HOS_N: TFIBStringField;
    fdsFieldsMAKE_PROVERKA_TO_BUFF_N: TFIBStringField;
    fdsFieldsID_KASSA_LOAD_STR: TFIBStringField;
    fdsFieldsID_SM_STR: TFIBStringField;
    fdsFieldsID_ST_STR: TFIBStringField;
    fdsFieldsID_RAZD_STR: TFIBStringField;
    fdsFieldsPREDVARIT_PROV_STR: TFIBStringField;
    fdsFieldsPRINT_PASPORT_STR: TFIBStringField;
    fdsFieldsID_GROUP_DOG_STR: TFIBStringField;
    fdsFieldsID_GROUP_ADD_PR_STR: TFIBStringField;
    fdsFieldsID_GROUP_ADD_RAS_STR: TFIBStringField;
    fdsFieldsID_TYPE_DOG_KOMANDIR_STR: TFIBStringField;
    fdsFieldsID_TYPE_DOG_HOS_STR: TFIBStringField;
    fdsFieldsMAKE_PROVERKA_TO_BUFF_STR: TFIBStringField;
    fdsFieldsOTCHET_COMMENT_SHOW_V: TFIBIntegerField;
    fdsFieldsUSE_ACCESS_V: TFIBIntegerField;
    fdsFieldsBARCODE_PRIH_V: TFIBIntegerField;
    fdsFieldsUSE_BARCODE_V: TFIBIntegerField;
    fdsFieldsOTCHET_COMMENT_SHOW_STR: TFIBStringField;
    fdsFieldsUSE_ACCESS_STR: TFIBStringField;
    fdsFieldsBARCODE_PRIH_STR: TFIBStringField;
    fdsFieldsUSE_BARCODE_STR: TFIBStringField;
    fdsFieldsOTCHET_COMMENT_SHOW_N: TFIBStringField;
    fdsFieldsUSE_ACCESS_N: TFIBStringField;
    fdsFieldsBARCODE_PRIH_N: TFIBStringField;
    fdsFieldsUSE_BARCODE_N: TFIBStringField;
    PRINT_DEFAULT: TcxGridDBCardViewRow;
    fdsFieldsPRINT_DEFAULT_V: TFIBIntegerField;
    fdsFieldsPRINT_DEFAULT_STR: TFIBStringField;
    fdsFieldsPRINT_DEFAULT_N: TFIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure cbtOkClick(Sender: TObject);
    procedure cbtCloseClick(Sender: TObject);
    procedure ID_KASSA_LOADPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NDSPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure ID_GROUP_DOGPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_GROUP_ADD_PRPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_GROUP_ADD_RASPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_SMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_RAZDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_STPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbtOkCloseClick(Sender: TObject);
    procedure ID_TYPE_DOG_KOMANDIRPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ID_TYPE_DOG_HOSPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbtNullRowClick(Sender: TObject);
    procedure ID_KASSA_LOADCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DATE_INSTALL_KASSACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ID_SMCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ID_RAZDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ID_STCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure KASSA_BEGIN_PERIODCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure KASSA_DAY_SHOW_LASTCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure NDSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ID_GROUP_DOGCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ID_GROUP_ADD_PRCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ID_GROUP_ADD_RASCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ID_TYPE_DOG_KOMANDIRCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ID_TYPE_DOG_HOSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PRINT_DEFAULTPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    // процедура для обнуления полей RX
    procedure NullField(FieldName: String; FieldValue: Variant);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE); reintroduce; overload;
  end;

  function Nastroyka(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE): Integer; stdcall;
  exports Nastroyka;



implementation
uses LoadDogManedger,
     GlobalSPR,
     Un_R_file_Alex,
     Un_lo_file_Alex, KassaOrderIni;

{$R *.dfm}
const
  // Запрос для динамического DataSet'a (короткое название кассы по идентификатору)
  strId_kassa_load: String = 'SELECT SHORT_NAME_KASS' + #13 +
                             'FROM KASSA_SP_KASS' + #13 +
                             'WHERE ID_SP_KASS = :Id_kassa_load_v';
  // Запрос для динамического DataSet'a (код и название раздела и статьи по идентификатору)
  strId_razd: String = 'SELECT RAZ_TITLE, RAZ_KOD, ST_TITLE, ST_KOD' + #13 +
                       'FROM KASSA_SELECT_SM_RA_ST_KEKV(null, :Id_razd_v, :Id_st_v, null)';

  strNoValue: String = 'Значення нема';
                       
function Nastroyka(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE): Integer; stdcall;
var
  T: TfmKassaSetup;
begin
  T := TfmKassaSetup.Create(AOwner, id_us, Handle);
  T.Show;
  result := -1;
end;

procedure TfmKassaSetup.NullField(FieldName: String; FieldValue: Variant);
begin
  rxmFields.Edit;
  rxmFields.FieldByName(FieldName).Value := FieldValue;
  rxmFields.Post;
end;

constructor TfmKassaSetup.Create(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  fdbFull.Handle := Handle;
  rxmFields.Active := true;
end;     

procedure TfmKassaSetup.FormCreate(Sender: TObject);
var
  i: Byte;
begin
  Caption := 'Настройка каси';

  // Открываем БД
  try
    fdbFull.Open;
  except
    ftrRead.Rollback;
    Application.MessageBox(PChar('Помилка при підключенні до Бази Даних!!!'),
                           'Помилка', mb_Ok);
    Application.Terminate;
  end;

  // Открываем запрос
  try
    fdsFields.Open;
  except
    ftrRead.Rollback;
    Application.MessageBox(PChar('Помилка при виконуванні запиту!!!'),
                           'Помилка', mb_Ok);
    exit;
  end;

  // заполняем поля rxmFields из DataSet
  with rxmFields do
  begin
    Insert;
    // названия полей
    FieldByName('DATE_INSTALL_KASSA_N').Value := fdsFields.FieldByName('DATE_INSTALL_KASSA_N').AsString;
    FieldByName('ID_KASSA_LOAD_N').Value := fdsFields.FieldByName('ID_KASSA_LOAD_N').AsString;
    FieldByName('ID_SM_N').Value := fdsFields.FieldByName('ID_SM_N').AsString;
    FieldByName('ID_RAZD_N').Value := fdsFields.FieldByName('ID_RAZD_N').AsString;
    FieldByName('ID_ST_N').Value := fdsFields.FieldByName('ID_ST_N').AsString;
    FieldByName('PREDVARIT_PROV_N').Value := fdsFields.FieldByName('PREDVARIT_PROV_N').AsString;
    FieldByName('KASSA_BEGIN_PERIOD_N').Value := fdsFields.FieldByName('KASSA_BEGIN_PERIOD_N').AsString;
    FieldByName('KASSA_DAY_SHOW_LAST_N').Value := fdsFields.FieldByName('KASSA_DAY_SHOW_LAST_N').AsString;
    FieldByName('NDS_N').Value := fdsFields.FieldByName('NDS_N').AsString;
    FieldByName('PRINT_PASPORT_N').Value := fdsFields.FieldByName('PRINT_PASPORT_N').AsString;
    FieldByName('ID_GROUP_DOG_N').Value := fdsFields.FieldByName('ID_GROUP_DOG_N').AsString;
    FieldByName('ID_GROUP_ADD_PR_N').Value := fdsFields.FieldByName('ID_GROUP_ADD_PR_N').AsString;
    FieldByName('ID_GROUP_ADD_RAS_N').Value := fdsFields.FieldByName('ID_GROUP_ADD_RAS_N').AsString;
    FieldByName('ID_TYPE_DOG_KOMANDIR_N').Value := fdsFields.FieldByName('ID_TYPE_DOG_KOMANDIR_N').AsString;
    FieldByName('ID_TYPE_DOG_HOS_N').Value := fdsFields.FieldByName('ID_TYPE_DOG_HOS_N').AsString;
    FieldByName('MAKE_PROVERKA_TO_BUFF_N').Value := fdsFields.FieldByName('MAKE_PROVERKA_TO_BUFF_N').AsString;
    FieldByName('OTCHET_COMMENT_SHOW_N').Value := fdsFields.FieldByName('OTCHET_COMMENT_SHOW_N').AsString;
    FieldByName('USE_ACCESS_N').Value := fdsFields.FieldByName('USE_ACCESS_N').AsString;
    FieldByName('USE_BARCODE_N').Value := fdsFields.FieldByName('USE_BARCODE_N').AsString;
    FieldByName('BARCODE_PRIH_N').Value := fdsFields.FieldByName('BARCODE_PRIH_N').AsString;
    FieldByName('PRINT_DEFAULT_N').Value := fdsFields.FieldByName('PRINT_DEFAULT_N').AsString;

    // значения полей
    FieldByName('DATE_INSTALL_KASSA_V').Value := fdsFields.FieldByName('DATE_INSTALL_KASSA_V').Value;
    FieldByName('ID_KASSA_LOAD_V').Value := fdsFields.FieldByName('ID_KASSA_LOAD_V').Value;
    FieldByName('ID_SM_V').Value := fdsFields.FieldByName('ID_SM_V').Value;
    FieldByName('ID_RAZD_V').Value := fdsFields.FieldByName('ID_RAZD_V').Value;
    FieldByName('ID_ST_V').Value := fdsFields.FieldByName('ID_ST_V').Value;
    FieldByName('PREDVARIT_PROV_V').Value := fdsFields.FieldByName('PREDVARIT_PROV_V').Value;
    FieldByName('KASSA_BEGIN_PERIOD_V').Value := fdsFields.FieldByName('KASSA_BEGIN_PERIOD_V').Value;
    FieldByName('KASSA_DAY_SHOW_LAST_V').Value := fdsFields.FieldByName('KASSA_DAY_SHOW_LAST_V').Value;
    FieldByName('NDS_V').Value := fdsFields.FieldByName('NDS_V').Value;
    FieldByName('PRINT_PASPORT_V').Value := fdsFields.FieldByName('PRINT_PASPORT_V').Value;
    FieldByName('ID_GROUP_DOG_V').Value := fdsFields.FieldByName('ID_GROUP_DOG_V').Value;
    FieldByName('ID_GROUP_ADD_PR_V').Value := fdsFields.FieldByName('ID_GROUP_ADD_PR_V').Value;
    FieldByName('ID_GROUP_ADD_RAS_V').Value := fdsFields.FieldByName('ID_GROUP_ADD_RAS_V').Value;
    FieldByName('ID_TYPE_DOG_KOMANDIR_V').Value := fdsFields.FieldByName('ID_TYPE_DOG_KOMANDIR_V').Value;
    FieldByName('ID_TYPE_DOG_HOS_V').Value := fdsFields.FieldByName('ID_TYPE_DOG_HOS_V').Value;
    FieldByName('MAKE_PROVERKA_TO_BUFF_V').Value := fdsFields.FieldByName('MAKE_PROVERKA_TO_BUFF_V').Value;
    FieldByName('OTCHET_COMMENT_SHOW_V').Value := fdsFields.FieldByName('OTCHET_COMMENT_SHOW_V').Value;
    FieldByName('USE_ACCESS_V').Value := fdsFields.FieldByName('USE_ACCESS_V').Value;
    FieldByName('USE_BARCODE_V').Value := fdsFields.FieldByName('USE_BARCODE_V').Value;
    FieldByName('BARCODE_PRIH_V').Value := fdsFields.FieldByName('BARCODE_PRIH_V').Value;
    FieldByName('PRINT_DEFAULT_V').Value := fdsFields.FieldByName('PRINT_DEFAULT_V').Value;

    // строковые представления полей
    if (FieldByName('DATE_INSTALL_KASSA_V').AsString = '01.01.1900') then
      FieldByName('DATE_INSTALL_KASSA_V').Value := strNoValue
    else
      FieldByName('DATE_INSTALL_KASSA_V').Value := fdsFields.FieldByName('DATE_INSTALL_KASSA_V').AsString;

    if (FieldByName('ID_KASSA_LOAD_V').Value = -1) then
      FieldByName('ID_KASSA_LOAD_STR').Value := strNoValue
    else
      FieldByName('ID_KASSA_LOAD_STR').Value := fdsFields.FieldByName('ID_KASSA_LOAD_STR').AsString;

    if (FieldByName('ID_SM_V').Value = null) then
      FieldByName('ID_SM_STR').Value := strNoValue
    else
      FieldByName('ID_SM_STR').Value := fdsFields.FieldByName('ID_SM_STR').AsString;

    if (FieldByName('ID_RAZD_V').Value = null) then
      FieldByName('ID_RAZD_STR').Value := strNoValue
    else
      FieldByName('ID_RAZD_STR').Value := fdsFields.FieldByName('ID_RAZD_STR').AsString;

    if (FieldByName('ID_ST_V').Value = null) then
      FieldByName('ID_ST_STR').Value := strNoValue
    else
      FieldByName('ID_ST_STR').Value := fdsFields.FieldByName('ID_ST_STR').AsString;

    if (FieldByName('KASSA_BEGIN_PERIOD_V').AsString = '01.01.1900') then
      FieldByName('KASSA_BEGIN_PERIOD_V').Value := strNoValue
    else
      FieldByName('KASSA_BEGIN_PERIOD_V').Value := fdsFields.FieldByName('KASSA_BEGIN_PERIOD_V').Value;

    if (FieldByName('KASSA_DAY_SHOW_LAST_V').AsInteger = 0) then
      FieldByName('KASSA_DAY_SHOW_LAST_V').Value := 0
    else
      FieldByName('KASSA_DAY_SHOW_LAST_V').Value := fdsFields.FieldByName('KASSA_DAY_SHOW_LAST_V').Value;

    if (FieldByName('NDS_V').AsInteger = 0) then
      FieldByName('NDS_V').Value := strNoValue
    else
      FieldByName('NDS_V').Value := fdsFields.FieldByName('NDS_V').Value;

    if (FieldByName('ID_GROUP_DOG_V').Value = null) then
      FieldByName('ID_GROUP_DOG_STR').Value := strNoValue
    else
      FieldByName('ID_GROUP_DOG_STR').Value := fdsFields.FieldByName('ID_GROUP_DOG_STR').AsString;

    if (FieldByName('ID_GROUP_ADD_PR_V').Value = null) then
      FieldByName('ID_GROUP_ADD_PR_STR').Value := strNoValue
    else
      FieldByName('ID_GROUP_ADD_PR_STR').Value := fdsFields.FieldByName('ID_GROUP_ADD_PR_STR').AsString;

    if (FieldByName('ID_GROUP_ADD_RAS_V').Value = null) then
      FieldByName('ID_GROUP_ADD_RAS_STR').Value := strNoValue
    else
      FieldByName('ID_GROUP_ADD_RAS_STR').Value := fdsFields.FieldByName('ID_GROUP_ADD_RAS_STR').AsString;

    FieldByName('PREDVARIT_PROV_STR').Value := fdsFields.FieldByName('PREDVARIT_PROV_STR').AsString;
    FieldByName('PRINT_PASPORT_STR').Value := fdsFields.FieldByName('PRINT_PASPORT_STR').AsString;
    FieldByName('MAKE_PROVERKA_TO_BUFF_STR').Value := fdsFields.FieldByName('MAKE_PROVERKA_TO_BUFF_STR').AsString;

    if (FieldByName('ID_TYPE_DOG_KOMANDIR_V').Value = null) then
      FieldByName('ID_TYPE_DOG_KOMANDIR_STR').Value := strNoValue
    else
      FieldByName('ID_TYPE_DOG_KOMANDIR_STR').Value := fdsFields.FieldByName('ID_TYPE_DOG_KOMANDIR_STR').AsString;

    if (FieldByName('ID_TYPE_DOG_HOS_V').Value = null) then
      FieldByName('ID_TYPE_DOG_HOS_STR').Value := strNoValue
    else
      FieldByName('ID_TYPE_DOG_HOS_STR').Value := fdsFields.FieldByName('ID_TYPE_DOG_HOS_STR').AsString;

    FieldByName('OTCHET_COMMENT_SHOW_STR').Value := fdsFields.FieldByName('OTCHET_COMMENT_SHOW_STR').AsString;
    FieldByName('USE_ACCESS_STR').Value := fdsFields.FieldByName('USE_ACCESS_STR').AsString;
    FieldByName('USE_BARCODE_STR').Value := fdsFields.FieldByName('USE_BARCODE_STR').AsString;
    FieldByName('BARCODE_PRIH_STR').Value := fdsFields.FieldByName('BARCODE_PRIH_STR').AsString;

    if (FieldByName('PRINT_DEFAULT_V').Value = null) then
      FieldByName('PRINT_DEFAULT_STR').Value := strNoValue
    else
      FieldByName('PRINT_DEFAULT_STR').Value := fdsFields.FieldByName('PRINT_DEFAULT_STR').AsString;
    Post;
  end;

  // загрузка стилей для CardView
  for i := 0 to cvKassaSetup.RowCount - 1 do
  begin
    if (i mod 2 = 0) then
    begin
      cvKassaSetup.Rows[i].Styles.Caption := cxStyleCaption2;
      cvKassaSetup.Rows[i].Styles.Content := cxStyleContent2;
    end
    else
    begin
      cvKassaSetup.Rows[i].Styles.Caption := cxStyleCaption1;
      cvKassaSetup.Rows[i].Styles.Content := cxStyleContent1;
    end;
  end;
  // заполняем надписи всех полей
  for i := 0 to 20 do
  begin
    cvKassaSetup.Rows[i].Caption :=
      rxmFields.Fields.Fields[i].AsString;
  end;

end;

procedure TfmKassaSetup.cbtOkClick(Sender: TObject);
var
  str_Result: String;
  type_Result: Smallint;
begin
  // Проверки значений обязательных полей
  if (rxmFields.FieldByName('ID_KASSA_LOAD_V').Value = null) then
  begin
    Application.MessageBox(PChar('Не введена ознака завантаження системи за умовчуванням!'),
                           'Помилка', mb_Ok);
    exit;
  end;

  if (rxmFields.FieldByName('PREDVARIT_PROV_STR').AsString = '-') then
  begin
    Application.MessageBox(PChar('Не введена ознака показу попередніх проводок!'),
                           'Помилка', mb_Ok);
    exit;
  end;

  if (rxmFields.FieldByName('KASSA_BEGIN_PERIOD_V').Value = null) then
  begin
    Application.MessageBox(PChar('Не введена дата, з якої відкрито касу!'),
                           'Помилка', mb_Ok);
    exit;
  end;

  if (rxmFields.FieldByName('NDS_V').Value = null) then
  begin
    Application.MessageBox(PChar('Не введено значення НДС за умовчуванням!'),
                           'Помилка', mb_Ok);
    exit;
  end;

  try
  // Работаем с хранимой процедурой KASSA_INI_ISTALL_INSERT_UPDATE
    with fspKassaIniIstall do
    begin
      Transaction.StartTransaction;
      StoredProcName := 'KASSA_INI_ISTALL_INSERT_UPDATE';
      Prepare;

      // Заполняем параметры процедуры
      if ((rxmFields.FieldByName('DATE_INSTALL_KASSA_V').AsString = strNoValue) or
          (rxmFields.FieldByName('DATE_INSTALL_KASSA_V').Value = null)) then
      begin
        ParamByName('DATE_INSTALL_KASSA').AsDate:= StrToDate('01.01.1900');
        NullField('DATE_INSTALL_KASSA_V', strNoValue);
      end
      else
        ParamByName('DATE_INSTALL_KASSA').Value := rxmFields.FieldByName('DATE_INSTALL_KASSA_V').Value;

      if (rxmFields.FieldByName('ID_KASSA_LOAD_STR').AsString = strNoValue) then
      // вызываем процедуру для обнуления полей RX
        NullField('ID_KASSA_LOAD_V', -1);
      ParamByName('ID_KASSA_LOAD').Value := rxmFields.FieldByName('ID_KASSA_LOAD_V').AsInteger;

      if (rxmFields.FieldByName('ID_SM_STR').AsString = strNoValue) then
        NullField('ID_SM_V', null);
      ParamByName('ID_SM').Value := rxmFields.FieldByName('ID_SM_V').Value;

      if (rxmFields.FieldByName('ID_RAZD_STR').AsString = strNoValue) then
        NullField('ID_RAZD_V', null);
      ParamByName('ID_RAZD').Value := rxmFields.FieldByName('ID_RAZD_V').Value;

      if (rxmFields.FieldByName('ID_ST_STR').AsString = strNoValue) then
        NullField('ID_ST_V', null);
      ParamByName('ID_ST').Value := rxmFields.FieldByName('ID_ST_V').Value;

      if (rxmFields.FieldByName('PREDVARIT_PROV_STR').AsString = 'Так') then
        ParamByName('PREDVARIT_PROV').Value := 1
      else
        ParamByName('PREDVARIT_PROV').Value := 0;

      if (rxmFields.FieldByName('KASSA_BEGIN_PERIOD_V').AsString = strNoValue) then
        ParamByName('KASSA_BEGIN_PERIOD').AsDate:= StrToDate('01.01.1900')
      else
        ParamByName('KASSA_BEGIN_PERIOD').Value := rxmFields.FieldByName('KASSA_BEGIN_PERIOD_V').Value;

      if (rxmFields.FieldByName('KASSA_DAY_SHOW_LAST_V').Value = 0) then
        ParamByName('KASSA_DAY_SHOW_LAST').Value := 0
      else
      begin
        try
          ParamByName('KASSA_DAY_SHOW_LAST').Value := StrToInt(Trim(rxmFields.FieldByName('KASSA_DAY_SHOW_LAST_V').AsString));
        except
          ParamByName('KASSA_DAY_SHOW_LAST').Value := 0;
        end;
      end;

      ParamByName('PREDPRIYATIE').Value := 0;

      if (rxmFields.FieldByName('NDS_V').AsString = strNoValue) then
        ParamByName('NDS').Value := 0
      else
        ParamByName('NDS').Value := rxmFields.FieldByName('NDS_V').AsCurrency;

      if (rxmFields.FieldByName('PRINT_PASPORT_STR').AsString = 'Так') then
        ParamByName('PRINT_PASPORT').Value := 1
      else
        if (rxmFields.FieldByName('PRINT_PASPORT_STR').AsString = 'Ні') then
          ParamByName('PRINT_PASPORT').Value := 0;

      if (rxmFields.FieldByName('ID_GROUP_DOG_STR').AsString = strNoValue) then
        NullField('ID_GROUP_DOG_V', null);
      ParamByName('ID_GROUP_DOG').Value := rxmFields.FieldByName('ID_GROUP_DOG_V').Value;

      if (rxmFields.FieldByName('ID_GROUP_ADD_PR_STR').AsString = strNoValue) then
        NullField('ID_GROUP_ADD_PR_V', null);
      ParamByName('ID_GROUP_ADD_PR').Value := rxmFields.FieldByName('ID_GROUP_ADD_PR_V').Value;

      if (rxmFields.FieldByName('ID_GROUP_ADD_RAS_STR').AsString = strNoValue) then
        NullField('ID_GROUP_ADD_RAS_V', null);
      ParamByName('ID_GROUP_ADD_RAS').Value := rxmFields.FieldByName('ID_GROUP_ADD_RAS_V').Value;

      if (rxmFields.FieldByName('ID_TYPE_DOG_KOMANDIR_STR').AsString = strNoValue) then
        NullField('ID_TYPE_DOG_KOMANDIR_V', null);
      ParamByName('ID_TYPE_DOG_KOMANDIR').Value := rxmFields.FieldByName('ID_TYPE_DOG_KOMANDIR_V').Value;

      if (rxmFields.FieldByName('ID_TYPE_DOG_HOS_STR').AsString = strNoValue) then
        NullField('ID_TYPE_DOG_HOS_V', null);
      ParamByName('ID_TYPE_DOG_HOS').Value := rxmFields.FieldByName('ID_TYPE_DOG_HOS_V').Value;

      if (rxmFields.FieldByName('MAKE_PROVERKA_TO_BUFF_STR').AsString = 'Так') then
        ParamByName('MAKE_PROVERKA_TO_BUFF').Value := 1
      else
        if (rxmFields.FieldByName('MAKE_PROVERKA_TO_BUFF_STR').AsString = 'Ні') then
          ParamByName('MAKE_PROVERKA_TO_BUFF').Value := 0;

      if (rxmFields.FieldByName('OTCHET_COMMENT_SHOW_STR').AsString = 'Звіт касира') then
        ParamByName('OTCHET_COMMENT_SHOW').Value := 1
      else
        if (rxmFields.FieldByName('OTCHET_COMMENT_SHOW_STR').AsString = 'Звіт касира (варіант 2)') then
          ParamByName('OTCHET_COMMENT_SHOW').Value := 2
      else
        if (rxmFields.FieldByName('OTCHET_COMMENT_SHOW_STR').AsString = 'Касова книга') then
          ParamByName('OTCHET_COMMENT_SHOW').Value := 3;

      if (rxmFields.FieldByName('USE_ACCESS_STR').AsString = 'Так') then
        ParamByName('USE_ACCESS').Value := 1
      else
        if (rxmFields.FieldByName('USE_ACCESS_STR').AsString = 'Ні') then
          ParamByName('USE_ACCESS').Value := 0;

      if (rxmFields.FieldByName('USE_BARCODE_STR').AsString = 'Так') then
        ParamByName('USE_BARCODE').Value := 1
      else
        if (rxmFields.FieldByName('USE_BARCODE_STR').AsString = 'Ні') then
          ParamByName('USE_BARCODE').Value := 0;

      if (rxmFields.FieldByName('BARCODE_PRIH_STR').AsString = 'Видаткові') then
        ParamByName('BARCODE_PRIH').Value := 0
      else
        if (rxmFields.FieldByName('BARCODE_PRIH_STR').AsString = 'Прибуткові') then
          ParamByName('BARCODE_PRIH').Value := 1
      else
        if (rxmFields.FieldByName('BARCODE_PRIH_STR').AsString = 'Прибуткові і видаткові') then
          ParamByName('BARCODE_PRIH').Value := 2;

      if (rxmFields.FieldByName('PRINT_DEFAULT_STR').AsString = strNoValue) then
        NullField('PRINT_DEFAULT_V', null);

      ParamByName('PRINT_DEFAULT').Value := rxmFields.FieldByName('PRINT_DEFAULT_V').Value;

      ExecProc;

      // Выходные параметры хранимой процедуры:
      // тип результата(0 - все ок, 1 - произошла ошибка) и строка результата
      type_Result := ParamByName('type_Result').AsInteger;
      str_Result := ParamByName('str_Result').AsString;

      if (type_Result = 0) then
      begin
        Application.MessageBox(PChar(str_Result), 'Підтвердження', mb_Ok);
        Transaction.Commit;
      end
      else
      begin
        Application.MessageBox(PChar(str_Result), 'Помилка!', mb_Ok);
        Transaction.Rollback;
      end;
    end;
  except
    Application.MessageBox(PChar('Помилка при виконуванні процедури!'), 'Помилка!', mb_Ok);
    fspKassaIniIstall.Transaction.Rollback;
  end;

  // Переоткрывыем DataSet, чотбы отобразились изменения
  fdsFields.Close;
  fdsFields.Open;
end;

procedure TfmKassaSetup.cbtCloseClick(Sender: TObject);
begin
  // Откатываем текущую транзакцию, чтобы не произошло никаких изменений
  if (ftrRead.Active) then
    ftrRead.Rollback;
  rxmFields.Close;
  Close;
end;

procedure TfmKassaSetup.ID_KASSA_LOADPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Id_kassa_load: Variant;
begin
  // Забираем идентификатор ID_KASSA_LOAD из справочника (вызываем из AlBPLMyLoad.bpl
  // функцию LoadKassaSys)

  Id_kassa_load := Un_lo_file_Alex.LoadKassaSys(Self, -1, fdbFull, 1, 1);

  if VarIsEmpty(Id_kassa_load) = false then
  begin
    rxmFields.Edit;
  // Записываем полученный идентификатор в соответствующее поле rxmFields
    rxmFields.FieldByName('ID_KASSA_LOAD_V').Value := Id_kassa_load;
  // По идентификатору забираем из таблицы KASSA_SP_KASS короткое название
    fdsProcedure.SelectSQL.Clear;
  // В поле SelectSQL записываем строковую константу(см. в определении const)
  // с запросом
    fdsProcedure.SelectSQL.Text := strId_kassa_load;

    try
      fdsProcedure.ParamByName('Id_kassa_load_v').AsInt64 := Id_kassa_load;
      fdsProcedure.Prepare;
      fdsProcedure.Open;
      rxmFields.FieldByName('ID_KASSA_LOAD_STR').Value :=
        fdsProcedure.FieldByName('SHORT_NAME_KASS').AsString;
      rxmFields.Post;
      ftrProcedure.Commit;
      fdsProcedure.Close;
    except
      ftrProcedure.Rollback;
      Application.MessageBox(PChar('Помилка при виконуванні запиту!!!'),
                           'Помилка', mb_Ok);
      exit;
    end;
  end;

end;

procedure TfmKassaSetup.NDSPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // Проверка,чтобы введенное значение было числовым
  try
    StrToFloat(DisplayValue);
  except
    Application.MessageBox(PChar('Введене значення повинно бути числовим!'),
                                 'Помилка!', mb_Ok);
    rxmFields.Edit;
    rxmFields.FieldByName('NDS_V').AsCurrency := 20.00;
    rxmFields.Post;
    exit;
  end;
  // Проверка,чтобы введенное значение % находилось в пределах от 0 до 100
  if (DisplayValue <= 0) or (DisplayValue > 100) then
  begin
    Application.MessageBox(PChar('Введене значення повинно бути більше ' +
                                 '0, але менше 100!'), 'Помилка!', mb_Ok);
    rxmFields.Edit;
    rxmFields.FieldByName('NDS_V').AsCurrency := 20.00;
    rxmFields.Post;

    exit;
  end;
end;

procedure TfmKassaSetup.ID_GROUP_DOGPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Group_Dog: Variant;
begin
  { Забираем идентификатор ID_GROUP_DOG из справочника (вызываем из Load_Dog.bpl
    функцию WorkGroupDoc) и записывем сам идентификатор и название в соответств
    ющие поля rxmFields}

  Group_Dog := LoadDogManedger.WorkGroupDoc(self, fdbFull.Handle, fsNormal, 'tip_dog');
  if (VarArrayDimCount(Group_Dog) > 0) then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_GROUP_DOG_V').Value := Group_Dog[0][0];
    rxmFields.FieldByName('ID_GROUP_DOG_STR').Value := string(Group_Dog[0][1]);
    rxmFields.Post;
  end;
end;

procedure TfmKassaSetup.ID_GROUP_ADD_PRPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Group_Add_Pr: Variant;
begin
  { Забираем идентификатор ID_GROUP_ADD_PR из справочника (вызываем из Load_Dog.bpl
    функцию WorkGroupDoc) и записывем сам идентификатор и название в соответств
    ющие поля rxmFields}

  Group_Add_Pr := LoadDogManedger.WorkGroupDoc(self, fdbFull.Handle, fsNormal, 'tip_dog');
  if (VarArrayDimCount(Group_Add_Pr) > 0) then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_GROUP_ADD_PR_V').Value := Group_Add_Pr[0][0];
    rxmFields.FieldByName('ID_GROUP_ADD_PR_STR').Value := string(Group_Add_Pr[0][1]);
    rxmFields.Post;
  end;
end;

procedure TfmKassaSetup.ID_GROUP_ADD_RASPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Group_Add_Ras: Variant;
begin
  { Забираем идентификатор ID_GROUP_ADD_RAS из справочника (вызываем из Load_Dog.bpl
    функцию WorkGroupDoc) и записывем сам идентификатор и название в соответств
    ющие поля rxmFields}

  Group_Add_Ras := LoadDogManedger.WorkGroupDoc(self, fdbFull.Handle, fsNormal, 'tip_dog');
  if (VarArrayDimCount(Group_Add_Ras) > 0) then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_GROUP_ADD_RAS_V').Value := Group_Add_Ras[0][0];
    rxmFields.FieldByName('ID_GROUP_ADD_RAS_STR').Value := string(Group_Add_Ras[0][1]);
    rxmFields.Post;
  end;
end;

procedure TfmKassaSetup.ID_SMPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Smeta: Variant;
begin
  { Забираем идентификатор ID_SM из справочника (вызываем из GlobalSPR.bpl
    функцию GetSmets) и записывем сам идентификатор и название в соответств
    ющие поля rxmFields}

  Smeta := GlobalSPR.GetSmets(Self, fdbFull.Handle, date, psmSmet);

  if VarArrayDimCount(Smeta) > 0 then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_SM_V').Value := Smeta[0];
    rxmFields.FieldByName('ID_SM_STR').Value := VarToStr(Smeta[3]) + ' - ' +
      VarToStr(Smeta[2]);
    rxmFields.Post;
  end;
end;

procedure TfmKassaSetup.ID_RAZDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Razd: Variant;
begin
  // Забираем идентификатор ID_RAZD из справочника (вызываем из GlobalSPR.bpl
  // функцию GetRazdStSpr)
  Razd := GlobalSPR.GetRazdStSpr(Self, fdbFull.Handle, fsNormal, date, 0, allEnable, cmRazd);

  if VarIsEmpty(Razd) = false then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_RAZD_V').Value := Razd;

    // По идентификатору забираем из хранимой процедуры kassa_select_sm_ra_st_kekv
    // код и название раздела
    fdsProcedure.SelectSQL.Clear;
    // В поле SelectSQL записываем строковую константу(см. в определении const)
    // с запросом
    fdsProcedure.SelectSQL.Text := strId_razd;

    try
      fdsProcedure.ParamByName('Id_razd_v').AsInt64 := Razd;
      fdsProcedure.ParamByName('Id_st_v').Value := null;
      fdsProcedure.Prepare;
      fdsProcedure.Open;
      rxmFields.FieldByName('ID_RAZD_STR').Value :=
        fdsProcedure.FieldByName('RAZ_KOD').AsString + ' - ' +
        fdsProcedure.FieldByName('RAZ_TITLE').AsString;
      rxmFields.Post;
      ftrProcedure.Commit;
      fdsProcedure.Close;
    except
      ftrProcedure.Rollback;
      Application.MessageBox(PChar('Помилка при виконуванні запиту!!!'),
                           'Помилка', mb_Ok);
      exit;
    end;
  end
end;

procedure TfmKassaSetup.ID_STPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  St: Variant;
begin
  // Забираем идентификатор ID_ST из справочника (вызываем из GlobalSPR.bpl
  // функцию GetRazdStSpr)
  St := GlobalSPR.GetRazdStSpr(Self, fdbFull.Handle, fsNormal, date, 0, allEnable, cmSt);

  if VarIsEmpty(St) = false then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_ST_V').Value := St;

    // По идентификатору забираем из хранимой процедуры kassa_select_sm_ra_st_kekv
    // код и название статьи
    fdsProcedure.SelectSQL.Clear;
    // В поле SelectSQL записываем строковую константу(см. в определении const)
    // с запросом
    fdsProcedure.SelectSQL.Text := strId_razd;

    try
      fdsProcedure.ParamByName('Id_razd_v').Value := null;
      fdsProcedure.ParamByName('Id_st_v').AsInt64 := St;
      fdsProcedure.Prepare;
      fdsProcedure.Open;
      rxmFields.FieldByName('ID_ST_STR').Value :=
        fdsProcedure.FieldByName('ST_KOD').AsString + ' - ' +
        fdsProcedure.FieldByName('ST_TITLE').AsString;
      rxmFields.Post;
      ftrProcedure.Commit;
      fdsProcedure.Close;
    except
      ftrProcedure.Rollback;
      Application.MessageBox(PChar('Помилка при виконуванні запиту!!!'),
                           'Помилка', mb_Ok);
      exit;
    end;
  end
end;

procedure TfmKassaSetup.cbtOkCloseClick(Sender: TObject);
begin
  // Вызываем обработчик события кнопки ОК
  cbtOkClick(Sender);

  rxmFields.Close;
  Close;
end;

procedure TfmKassaSetup.ID_TYPE_DOG_KOMANDIRPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
//var
  //Type_Dog_Komandir: Variant;
begin
  {if (VarArrayDimCount(Type_Dog_Komandir) > 0) then
  begin
    rxmFields.Edit;
    rxmFields.FieldByName('ID_TYPE_DOG_KOMANDIR_V').Value := Type_Dog_Komandir[0][0];
    rxmFields.FieldByName('ID_TYPE_DOG_KOMANDIR_STR').Value := string(Type_Dog_Komandir[0][1]);
    rxmFields.Post;
  end;        }
end;

procedure TfmKassaSetup.ID_TYPE_DOG_HOSPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
//var
  //Type_Dog_Hos: Variant;
  //ResProc : TResProc;
  //a : TShablonInputData;
begin
  {if rxmFields.FieldByName('ID_GROUP_DOG_V').Value > 0 then
  begin
    Type_Dog_Hos := LoadDogManedger.WorkTypeDogSPR(self, fdbFull.Handle, fsNormal, 'get', nil, rxmFields.FieldByName('ID_GROUP_DOG_V').Value, nil);
    if (VarArrayDimCount(Type_Dog_Hos) > 0) then
      begin
        rxmFields.Edit;
        rxmFields.FieldByName('ID_TYPE_DOG_HOS_V').Value   := Type_Dog_Hos[0][0];
        rxmFields.FieldByName('ID_TYPE_DOG_HOS_STR').Value := string(Type_Dog_Hos[0][1]);
        rxmFields.Post;
      end;
  end
  else
  begin
    ShowMessage('Выберите сначала группу на выбор');
  end;    }
end;

procedure TfmKassaSetup.cbtNullRowClick(Sender: TObject);
var
  index: Byte;
begin
  // присваиваем переменной индекс строки, имеющей фоку ввода
  index := cvKassaSetup.Controller.FocusedItemIndex;

  // если это строки со значением Да/Нет, то запрещаем обнуление
  if ((index = 5) or (index = 9) or (index = 15)) then
  begin
    Application.MessageBox(PChar('Не можна очистити цей запис!'),
                           'Попередження', mb_Ok);
    exit;
  end
  else
  begin
    if (index = 7) then
      cvKassaSetup.Controller.FocusedItem.EditValue := 0
    else
      cvKassaSetup.Controller.FocusedItem.EditValue := strNoValue;
  end;
end;

procedure TfmKassaSetup.ID_KASSA_LOADCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_KASSA_LOAD.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.DATE_INSTALL_KASSACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[DATE_INSTALL_KASSA.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_SMCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_SM.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_RAZDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_RAZD.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_STCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_ST.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.KASSA_BEGIN_PERIODCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[KASSA_BEGIN_PERIOD.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.KASSA_DAY_SHOW_LASTCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[KASSA_DAY_SHOW_LAST.Index]) = '0'  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.NDSCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[NDS.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_GROUP_DOGCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_GROUP_DOG.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_GROUP_ADD_PRCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_GROUP_ADD_PR.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_GROUP_ADD_RASCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_GROUP_ADD_RAS.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_TYPE_DOG_KOMANDIRCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_TYPE_DOG_KOMANDIR.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.ID_TYPE_DOG_HOSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if VarToStr(AViewInfo.GridRecord.Values[ID_TYPE_DOG_HOS.Index]) = strNoValue  then
  begin
    ACanvas.Canvas.Font.Color := clPurple;
    ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaSetup.PRINT_DEFAULTPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    T : TfmOrderIni;
begin
    T:=TfmOrderIni.Create(self,fdbFull);
    T.ShowModal;
    if T.ModalResult=mrOk then
    begin
          rxmFields.Edit;
          rxmFields.FieldByName('PRINT_DEFAULT_V').Value   := T.DataSetID_SHABLON_ORDER.AsInteger;
          rxmFields.FieldByName('PRINT_DEFAULT_STR').Value := T.DataSetSHABLON_NOTE.AsString;
          rxmFields.Post;
    end;

end;

end.
