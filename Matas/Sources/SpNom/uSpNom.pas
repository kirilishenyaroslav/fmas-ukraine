{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, StdCtrls, Buttons,
  Grids, DBGrids, ExtCtrls, ComCtrls, ibase, Registry,
  FIBQuery, pFIBQuery, Placemnt, FIBDatabase,  pFIBDatabase,
  cxControls, cxSplitter, ImgList, Menus, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, cxClasses, pFIBStoredProc,
  ToolWin, cxTL, cxInplaceContainer, cxTLData, cxDBTL,
  cxCurrencyEdit, cxMaskEdit, cxCheckBox, cxContainer, cxTextEdit, cxDBEdit,
  uSpNomLang, uSpNomLib, cxRadioGroup, cxLookAndFeelPainters, cxButtons, cxGroupBox,
  pFIBErrorHandler, RxMemDS, ActnList, FR_DSet, FR_DBSet, FR_Class, uMatasUtils;

type
  TSpNomForm = class(TForm)
    PanelNomMain: TPanel;
    NomDataSource: TDataSource;
    TreeDataSet: TpFIBDataSet;
    NomDataSet: TpFIBDataSet;
    SpNomDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pmTree: TPopupMenu;
    NTreeAdd: TMenuItem;
    NTreeEdit: TMenuItem;
    NTreeDel: TMenuItem;
    N4: TMenuItem;
    NTreeRefresh: TMenuItem;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pmNomGrid: TPopupMenu;
    NNomAdd: TMenuItem;
    NNomEdit: TMenuItem;
    NNomDel: TMenuItem;
    N8: TMenuItem;
    NNomRefresh: TMenuItem;
    NNomFind: TMenuItem;
    N7: TMenuItem;
    StoredProc: TpFIBStoredProc;
    WorkDataSet: TpFIBDataSet;
    TreeDataSetLINKTO: TFIBBCDField;
    TreeDataSetNOMN: TFIBStringField;
    TreeDataSetNAME: TFIBStringField;
    TreeDataSetID_UNIT: TFIBBCDField;
    TreeDataSetPRICE: TFIBBCDField;
    TreeDataSetTIP: TFIBBooleanField;
    TreeDataSetID_SCH: TFIBBCDField;
    TreeDataSetNAME_SCH: TFIBStringField;
    NomDataSetLINKTO: TFIBBCDField;
    NomDataSetNOMN: TFIBStringField;
    NomDataSetNAME: TFIBStringField;
    NomDataSetID_UNIT: TFIBBCDField;
    NomDataSetPRICE: TFIBBCDField;
    NomDataSetTIP: TFIBBooleanField;
    NomDataSetID_SCH: TFIBBCDField;
    NomDataSetUNIT: TFIBStringField;
    WorkDataSetLINKTO: TFIBBCDField;
    WorkDataSetNOMN: TFIBStringField;
    WorkDataSetNAME: TFIBStringField;
    WorkDataSetID_UNIT: TFIBBCDField;
    WorkDataSetPRICE: TFIBBCDField;
    WorkDataSetTIP: TFIBBooleanField;
    WorkDataSetID_SCH: TFIBBCDField;
    WorkDataSetID_NOMN: TFIBBCDField;
    NomDataSetID_NOMN: TFIBBCDField;
    TreeDataSetID_NOMN: TFIBBCDField;
    cxNomGrid: TcxGrid;
    cxNomGridDBTableView1: TcxGridDBTableView;
    cxNomGridLevel1: TcxGridLevel;
    PanelTreeMain: TPanel;
    pnlButtons: TPanel;
    AddGrpButton: TSpeedButton;
    EditGrpButton: TSpeedButton;
    DelGrpButton: TSpeedButton;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    FindButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    ExpandButton: TSpeedButton;
    CollapseButton: TSpeedButton;
    SpNomFormStorage: TFormStorage;
    Splitter1: TSplitter;
    NomDragDataSet: TpFIBDataSet;
    TreeDataSetSCH_NUMBER: TFIBStringField;
    SearchDataSet: TpFIBDataSet;
    SearchDataSource: TDataSource;
    SearchDataSetID_NOMN: TFIBBCDField;
    SearchDataSetLINKTO: TFIBBCDField;
    SearchDataSetNAME_GROUP: TFIBStringField;
    SearchDataSetNAME: TFIBStringField;
    SearchDataSetNOMN: TFIBStringField;
    SearchDataSetID_UNIT: TFIBBCDField;
    SearchDataSetUNIT: TFIBStringField;
    SearchDataSetPRICE: TFIBBCDField;
    cxSplitter1: TcxSplitter;
    cxNomTree: TcxDBTreeList;
    TreeDataSource: TDataSource;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
    N3: TMenuItem;
    NNomSetup: TMenuItem;
    SpNomImages: TImageList;
    cxNomGridDBTableView1LINKTO: TcxGridDBColumn;
    cxNomGridDBTableView1NOMN: TcxGridDBColumn;
    cxNomGridDBTableView1NAME: TcxGridDBColumn;
    cxNomGridDBTableView1ID_UNIT: TcxGridDBColumn;
    cxNomGridDBTableView1PRICE: TcxGridDBColumn;
    cxNomGridDBTableView1TIP: TcxGridDBColumn;
    cxNomGridDBTableView1ID_SCH: TcxGridDBColumn;
    cxNomGridDBTableView1UNIT: TcxGridDBColumn;
    cxNomGridDBTableView1ID_NOMN: TcxGridDBColumn;
    N1: TMenuItem;
    NTreeSetup: TMenuItem;
    PanelSetup: TPanel;
    cxSplitter2: TcxSplitter;
    ApplyButton: TcxButton;
    cxGroupBoxNomn: TcxGroupBox;
    cxShowColNomnNomn: TcxCheckBox;
    cxShowColNomnName: TcxCheckBox;
    cxShowColNomnUnit: TcxCheckBox;
    cxShowColNomnPrice: TcxCheckBox;
    cxGroupBoxTree: TcxGroupBox;
    cxShowColTreeNomn: TcxCheckBox;
    cxShowColTreeName: TcxCheckBox;
    cxGroupBoxOpt: TcxGroupBox;
    cxStorePosition: TcxCheckBox;
    cxDBTreeList1NOMN: TcxDBTreeListColumn;
    cxShowPathPanel: TcxCheckBox;
    cxTreePath: TcxDBTreeList;
    cxSplitter3: TcxSplitter;
    PathDataSet: TpFIBDataSet;
    PathDataSource: TDataSource;
    PathDataSetID_NOMN: TFIBBCDField;
    PathDataSetLINKTO: TFIBBCDField;
    PathDataSetNOMN: TFIBStringField;
    PathDataSetNAME: TFIBStringField;
    cxPathTreeList1NOMN: TcxDBTreeListColumn;
    cxPathTreeList1NAME: TcxDBTreeListColumn;
    TreeDataSetNTYPE: TFIBSmallIntField;
    NomDataSetNTYPE: TFIBSmallIntField;
    UnitDataSet: TpFIBDataSet;
    UnitDataSetID_UNIT_MEAS: TFIBBCDField;
    UnitDataSetID_GROUP_UNIT: TFIBBCDField;
    UnitDataSetNAME_UNIT_MEAS: TFIBStringField;
    UnitDataSetSHORT_NAME: TFIBStringField;
    UnitDataSetCOEFF: TFIBBCDField;
    UnitDataSetID_SERVER: TFIBIntegerField;
    UnitDataSetUSE_BEG: TFIBDateTimeField;
    UnitDataSource: TDataSource;
    PanelWork: TPanel;
    cxSearchGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID_NOMN: TcxGridDBColumn;
    cxGridDBTableView1LINKTO: TcxGridDBColumn;
    cxGridDBTableView1NAME_GROUP: TcxGridDBColumn;
    cxGridDBTableView1NAME: TcxGridDBColumn;
    cxGridDBTableView1NOMN: TcxGridDBColumn;
    cxGridDBTableView1ID_UNIT: TcxGridDBColumn;
    cxGridDBTableView1UNIT: TcxGridDBColumn;
    cxGridDBTableView1PRICE: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    MemoryDataSet: TRxMemoryData;
    MemoryDataSource: TDataSource;
    cxMemoryGrid: TcxGrid;
    cxMemoryGridDBTableView2: TcxGridDBTableView;
    cxMemoryGridDBColumn1LINKTO: TcxGridDBColumn;
    cxMemoryGridDBColumnNOMN: TcxGridDBColumn;
    cxMemoryGridDBColumnNAME: TcxGridDBColumn;
    cxMemoryGridDBColumnID_UNIT: TcxGridDBColumn;
    cxMemoryGridDBColumnUNIT: TcxGridDBColumn;
    cxMemoryGridDBColumnPrice: TcxGridDBColumn;
    cxMemoryGridDBColumnTIP: TcxGridDBColumn;
    cxMemoryGridDBColumnID_SCH: TcxGridDBColumn;
    cxMemoryGridDBColumnID_NOMN: TcxGridDBColumn;
    cxMemoryGridLevel2: TcxGridLevel;
    pmMemory: TPopupMenu;
    NDel: TMenuItem;
    NDelAll: TMenuItem;
    N6: TMenuItem;
    NExit: TMenuItem;
    cxSetUpperName: TcxCheckBox;
    cxShowKod: TcxCheckBox;
    cxAutoNomn: TcxCheckBox;
    PathDataSetKOD: TFIBStringField;
    cxPathTreeList1KOD: TcxDBTreeListColumn;
    TreeDataSetKOD: TFIBStringField;
    cxDBTreeList1KOD: TcxDBTreeListColumn;
    NomDataSetKOD: TFIBStringField;
    cxNomGridDBTableView1KOD: TcxGridDBColumn;
    PrintButton: TSpeedButton;
    cxDBTreeList1SCH: TcxDBTreeListColumn;
    cxShowColSchNum: TcxCheckBox;
    NNomLineSel: TMenuItem;
    NNomViewSel: TMenuItem;
    N2: TMenuItem;
    NHideSel: TMenuItem;
    ActionList1: TActionList;
    acFind: TAction;
    acEditNomn: TAction;
    NTreeEditNomn: TMenuItem;
    frReport: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    PrintDataSet: TpFIBDataSet;
    frDBDataSet2: TfrDBDataSet;
    NNomAddInGroup: TMenuItem;
    actShowHistory: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure NTreeAddClick(Sender: TObject);
    procedure NTreeEditClick(Sender: TObject);
    procedure NTreeDelClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ExpandButtonClick(Sender: TObject);
    procedure CollapseButtonClick(Sender: TObject);
    procedure NTreeRefreshClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxNomGridDBTableView1DblClick(Sender: TObject);
    procedure cxNomGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplyButtonClick(Sender: TObject);
    procedure NNomSetupClick(Sender: TObject);
    procedure NTreeSetupClick(Sender: TObject);
    procedure cxNomTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure NDelAllClick(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNomTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cxNomTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNomGridDBTableView1PRICEHeaderClick(Sender: TObject);
    procedure cxNomGridDBTableView1NAMEHeaderClick(Sender: TObject);
    procedure cxNomGridDBTableView1NOMNHeaderClick(Sender: TObject);
    procedure NNomViewSelClick(Sender: TObject);
    procedure NHideSelClick(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure acEditNomnExecute(Sender: TObject);
    procedure NNomAddInGroupClick(Sender: TObject);
    procedure actShowHistoryExecute(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
  //  id:Integer;
   ModeView: integer;
   ModeSelect: integer;
   F_NTYPE: smallint;
   ResultArray: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aLANG: smallint; aID_PROP: int64; aNType: integer);overload;
  end;

  function GetNomn(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_NOMN: integer):Variant;stdcall;
  function GetNomnEx(aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {=0, пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;

  function GetNomnEx2(aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     TR_HANDLE: TISC_TR_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {=0, пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;

  procedure ShowSpNom(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports GetNomn, GetNomnEx, GetNomnEx2, ShowSpNom;

var
  SpNomForm: TSpNomForm;

implementation

{$R *.dfm}

uses uSpNomTreeEdit, uSpNomItemEdit, uSpNomSearchForm, uSpNomEditNomn, uSpNomWaitWindow, uSpNomPrint, uSpNomAddInGroup, uSpNomHistory;

constructor TSpNomForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aLANG: smallint; aID_PROP: int64; aNType: integer);
var
 w: TForm;
begin
 inherited Create(AOwner);
 // aLangague:=aLANG;
 // устанавливаем украинский язык, пока не допишем головную прогрмамму!
 aLangague:=1;
 SetLangague;
 w:=ShowWaitWindow(self);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.SpNomDatabase.Close;
  Self.SpNomDatabase.Handle := DBHANDLE;
  if aNType>0 then
   TreeDataSet.SelectSQL.Add(' and NTYPE='+IntToStr(aNType));
  TreeDataSet.SelectSQL.Add('ORDER BY LINKTO, NAME');
  TreeDataSet.Prepare;
  TreeDataSet.CloseOpen(false);
  NomDataSet.CloseOpen(false);
  PathDataSet.CloseOpen(true);
 end;
 // подписи к кнопкам
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
 Self.Caption:=NOM_STR_FORMCAP_SP_NOMN;
 Self.AddButton.Caption:=NOM_STR_ACTION_ADD_CONST;
 Self.DeleteButton.Caption:=NOM_STR_ACTION_DELETE_CONST;
 Self.ModifyButton.Caption:=NOM_STR_ACTION_UPDATE_CONST;
 Self.FindButton.Caption:=NOM_STR_ACTION_FIND_CONST;
 Self.RefreshButton.Caption:=NOM_STR_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=NOM_STR_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=NOM_STR_ACTION_CLOSE_CONST;
 Self.AddGrpButton.Caption:=NOM_STR_ACTION_ADD_CONST;
 Self.EditGrpButton.Caption:=NOM_STR_ACTION_UPDATE_CONST;
 Self.DelGrpButton.Caption:=NOM_STR_ACTION_DELETE_CONST;
 Self.ApplyButton.Caption:=NOM_STR_ACTION_SET_CONST;
 Self.PrintButton.Caption:=NOM_STR_ACTION_PRINT_CONST;

 // подписи к конт.меню
 Self.NTreeAdd.Caption:=NOM_STR_ACTION_ADD_CONST;
 Self.NTreeEdit.Caption:=NOM_STR_ACTION_UPDATE_CONST;
 Self.NTreeDel.Caption:=NOM_STR_ACTION_DELETE_CONST;
 Self.NTreeRefresh.Caption:=NOM_STR_ACTION_REFRESH_CONST;
 Self.NTreeSetup.Caption:=NOM_STR_ACTION_SETUP_CONST;

 Self.NNomAdd.Caption:=NOM_STR_ACTION_ADD_CONST;
 Self.NNomEdit.Caption:=NOM_STR_ACTION_UPDATE_CONST;
 Self.NNomDel.Caption:=NOM_STR_ACTION_DELETE_CONST;
 Self.NNomRefresh.Caption:=NOM_STR_ACTION_REFRESH_CONST;
 Self.NNomFind.Caption:=NOM_STR_ACTION_FIND_CONST;
 Self.NNomSetup.Caption:=NOM_STR_ACTION_SETUP_CONST;
 Self.NNomViewSel.Caption:=NOM_STR_ACTION_SHOW_SEL_CONST;

 Self.NDel.Caption:=NOM_STR_ACTION_DELETE_CONST;
 Self.NDelAll.Caption:=NOM_STR_ACTION_DELETE_All_CONST;
 Self.NExit.Caption:=NOM_STR_ACTION_CLOSE_CONST;
 Self.NHideSel.Caption:=NOM_STR_ACTION_HIDE_SEL_CONST;

 // подписи к гридам
 Self.cxDBTreeList1NAME.Caption.Text :=NOM_STR_GRID_CAP_NAME;
 Self.cxNomGridDBTableView1NOMN.Caption:=NOM_STR_GRID_CAP_NOMN;
 Self.cxNomGridDBTableView1NAME.Caption:=NOM_STR_GRID_CAP_NAME;
 Self.cxNomGridDBTableView1UNIT.Caption:=NOM_STR_GRID_CAP_UNIT;
 Self.cxNomGridDBTableView1PRICE.Caption:=NOM_STR_GRID_CAP_PRICE;
 Self.cxMemoryGridDBColumnNOMN.Caption:=NOM_STR_GRID_CAP_NOMN;
 Self.cxMemoryGridDBColumnNAME.Caption:=NOM_STR_GRID_CAP_NAME;
 Self.cxMemoryGridDBColumnUNIT.Caption:=NOM_STR_GRID_CAP_UNIT;
 Self.cxMemoryGridDBColumnPrice.Caption:=NOM_STR_GRID_CAP_PRICE;
 Self.cxGridDBTableView1NAME_GROUP.Caption:=NOM_STR_GRID_CAP_NAME_GROUP;
 Self.cxGridDBTableView1NAME.Caption:=NOM_STR_GRID_CAP_NAME;
 Self.cxGridDBTableView1NOMN.Caption:=NOM_STR_GRID_CAP_NOMN;
 Self.cxGridDBTableView1PRICE.Caption:=NOM_STR_GRID_CAP_PRICE;
 Self.cxGridDBTableView1UNIT.Caption:=NOM_STR_GRID_CAP_UNIT;
 Self.cxPathTreeList1NOMN.Caption.Text:=NOM_STR_GRID_CAP_NOMN;
 Self.cxPathTreeList1NAME.Caption.Text:=NOM_STR_GRID_CAP_NAME;
 Self.cxDBTreeList1SCH.Caption.Text:=NOM_STR_LABEL_SCH;
 //подписи с CheckBox'ам
 Self.cxGroupBoxTree.Caption:=NOM_STR_SETUP_CAP_GROUP1;
 Self.cxGroupBoxNomn.Caption:=NOM_STR_SETUP_CAP_GROUP2;
 Self.cxGroupBoxOpt.Caption:=NOM_STR_SETUP_CAP_GROUP3;
 Self.cxStorePosition.Properties.Caption:=NOM_STR_SETUP_STORED_POS;
 Self.cxShowPathPanel.Properties.Caption:=NOM_STR_SETUP_SHOW_PATH;
 Self.cxShowColNomnNomn.Properties.Caption:=NOM_STR_GRID_CAP_NOMN;
 Self.cxShowColNomnName.Properties.Caption:=NOM_STR_GRID_CAP_NAME;
 Self.cxShowColNomnUnit.Properties.Caption:=NOM_STR_GRID_CAP_UNIT;
 Self.cxShowColNomnPrice.Properties.Caption:=NOM_STR_GRID_CAP_PRICE;
 Self.cxShowColTreeNomn.Properties.Caption:=NOM_STR_GRID_CAP_NOMN;
 Self.cxShowColTreeName.Properties.Caption:=NOM_STR_GRID_CAP_NAME;
 Self.cxSetUpperName.Properties.Caption:=NOM_STR_UPPER_NAME;
 Self.cxShowKod.Properties.Caption:=NOM_STR_SHOW_KOD;
 Self.cxAutoNomn.Properties.Caption:=NOM_STR_AUTO_KOD;
 Self.cxShowColSchNum.Properties.Caption:=NOM_STR_LABEL_SCH;

 Self.acEditNomn.Caption:=NOM_STR_EDIT_NOMN;

 // восстанавливаем настройки
 with SpNomFormStorage do
 begin
  RestoreFormPlacement;
  Self.Width:=StoredValue['FormWidth'];
  Self.Height:=StoredValue['FormHeight'];
 end;
 Self.cxSplitter1.CloseSplitter;
 Self.cxSplitter2.CloseSplitter;
 if not Self.cxShowPathPanel.Checked then
  Self.cxSplitter3.CloseSplitter;
 Self.ApplyButtonClick(self);
 // расставляем права
 if (MatasCheckAccess('/ROOT/MATAS/SPRAV/NOMN','Edit', false)=0)=false then
    begin
      AddGrpButton.Enabled:=False;
      EditGrpButton.Enabled:=False;
      DelGrpButton.Enabled:=False;
      AddButton.Enabled:=False;
      ModifyButton.Enabled:=False;
      DeleteButton.Enabled:=False;
      PrintButton.Enabled:=False;
      NNomAdd.Enabled:=False;
      NNomEdit.Enabled:=False;
      NNomDel.Enabled:=False;
      NNomAddInGroup.Enabled:=False;
      NNomRefresh.Enabled:=False;
      NNomSetup.Enabled:=False;
    end;
 CloseWaitWindow(w);
end;

function GetNomnEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aFS:TFormStyle; aID_USER : INT64; aID_NOMN: int64; aID_PROP: int64; aNType: integer; aMView: integer; aMSelect:integer; aLang: integer =0):Variant;stdcall;
var
 form : TSpNomForm;
 linkto: integer;
 ID_NOMN, S_ID_NOMN: integer;
begin
 form := TSpNomForm.Create(AOwner, DBHANDLE, aLang, aID_PROP, aNTYPE);
 form.ID_USER := aID_USER;
 form.ModeView:=aMView;
 form.ModeSelect:=aMSelect;
 form.F_NTYPE:=aNType;
 if aMSelect=1 then
 begin
//   form.cxMemoryGrid.Visible:=true;
   form.NNomViewSel.Visible:=true;
   form.NNomLineSel.Visible:=true;
   form.MemoryDataSet.Open;
 end;
 ID_NOMN:=aID_NOMN;
 if form.cxStorePosition.Checked then
  S_ID_NOMN:=form.SpNomFormStorage.StoredValue['ID_NOMN']
 else
  S_ID_NOMN:=-1;
 if ID_NOMN<1 then ID_NOMN:=S_ID_NOMN;
 if ID_NOMN>0 then
 begin
  form.WorkDataSet.ParamByName('ID_NOMN').Value:=ID_NOMN;
  form.WorkDataSet.CloseOpen(True);
  if not form.WorkDataSet.IsEmpty then
   begin
    linkto:=form.WorkDataSet.FieldByName('LINKTO').AsInteger;
    if form.TreeDataSet.Locate('ID_NOMN',linkto,[]) then
    begin
     form.cxNomTree.FocusedNode.Expand(false);
     form.NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
    end;
   end
  else
   form.WorkDataSet.Close;
 end
 else begin
//  form.cxNomTree.SetFocus;
  form.cxNomTree.FocusedNode.Expand(false);
 end;
 form.FormStyle := aFS;
 if aFS=fsMDIChild then
 begin
  form.OkButton.Visible := False;
 end
 else
 begin
  form.ShowModal;
  GetNomnEx := form.ResultArray;
  form.Free;
 end;
end;

function GetNomnEx2(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; TR_HANDLE: TISC_TR_HANDLE; aFS:TFormStyle; aID_USER : INT64; aID_NOMN: int64; aID_PROP: int64; aNType: integer; aMView: integer; aMSelect:integer; aLang: integer =0):Variant;stdcall;
var
 form : TSpNomForm;
 linkto: integer;
 ID_NOMN, S_ID_NOMN: integer;
begin
 form := TSpNomForm.Create(AOwner, DBHANDLE, aLang, aID_PROP, aNTYPE);
 form.WriteTransaction.Handle:=TR_HANDLE;
 form.ID_USER := aID_USER;
 form.ModeView:=aMView;
 form.ModeSelect:=aMSelect;
 form.F_NTYPE:=aNType;
 if aMSelect=1 then
 begin
//   form.cxMemoryGrid.Visible:=true;
   form.NNomViewSel.Visible:=true;
   form.NNomLineSel.Visible:=true;
   form.MemoryDataSet.Open;
 end;
 ID_NOMN:=aID_NOMN;
 if form.cxStorePosition.Checked then
  S_ID_NOMN:=form.SpNomFormStorage.StoredValue['ID_NOMN']
 else
  S_ID_NOMN:=-1;
 if ID_NOMN<1 then ID_NOMN:=S_ID_NOMN;
 if ID_NOMN>0 then
 begin
  form.WorkDataSet.ParamByName('ID_NOMN').Value:=ID_NOMN;
  form.WorkDataSet.CloseOpen(True);
  if not form.WorkDataSet.IsEmpty then
   begin
    linkto:=form.WorkDataSet.FieldByName('LINKTO').AsInteger;
    if form.TreeDataSet.Locate('ID_NOMN',linkto,[]) then
    begin
     form.cxNomTree.FocusedNode.Expand(false);
     form.NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
    end;
   end
  else
   form.WorkDataSet.Close;
 end
 else begin
//  form.cxNomTree.SetFocus;
  form.cxNomTree.FocusedNode.Expand(false);
 end;
 form.FormStyle := aFS;
 if aFS=fsMDIChild then
 begin
  form.OkButton.Visible := False;
 end
 else
 begin
  form.ShowModal;
  GetNomnEx2 := form.ResultArray;
  form.Free;
 end;
end;

function GetNomn(AOwner:TComponent; DBHANDLE:TISC_DB_HANDLE; aID_USER : INT64; ID_NOMN: integer):Variant;
var
 form : TSpNomForm;
 linkto: integer;
 S_ID_NOMN: integer;
begin
 form := TSpNomForm.Create(AOwner, DBHANDLE, 0, 0, 0);
 form.ID_USER := aID_USER;
 if form.cxStorePosition.Checked then
  S_ID_NOMN:=form.SpNomFormStorage.StoredValue['ID_NOMN']
 else
  S_ID_NOMN:=-1;
 if ID_NOMN<1 then ID_NOMN:=S_ID_NOMN;
 if ID_NOMN>0 then
 begin
  form.WorkDataSet.ParamByName('ID_NOMN').Value:=ID_NOMN;
  form.WorkDataSet.CloseOpen(True);
  if not form.WorkDataSet.IsEmpty then
   begin
    linkto:=form.WorkDataSet.FieldByName('LINKTO').AsInteger;
    if form.TreeDataSet.Locate('ID_NOMN',linkto,[]) then
    begin
     form.cxNomTree.FocusedNode.Expand(false);
     form.NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
    end;
   end
  else
   form.WorkDataSet.Close;
 end;
 form.ShowModal;
 GetNomn := form.ResultArray;
 form.Free;
end;

procedure ShowSpNom(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : int64);stdcall;
var
 form : TSpNomForm;
 ID_NOMN: integer;
 linkto: integer;
begin
 form := TSpNomForm.Create(AOwner,DBHANDLE, 0, 0, 0);
 form.ID_USER := aID_USER;
 form.FormStyle := fsMDIChild;
 form.OkButton.Visible := False;
 if form.cxStorePosition.Checked then
  ID_NOMN:=form.SpNomFormStorage.StoredValue['ID_NOMN']
 else
  ID_NOMN:=-1;
 if ID_NOMN>0 then
 begin
  form.WorkDataSet.ParamByName('ID_NOMN').Value:=ID_NOMN;
  form.WorkDataSet.CloseOpen(True);
  if not form.WorkDataSet.IsEmpty then
   begin
    linkto:=form.WorkDataSet.FieldByName('LINKTO').AsInteger;
    if form.TreeDataSet.Locate('ID_NOMN',linkto,[]) then
    begin
     form.cxNomTree.FocusedNode.Expand(false);
     form.NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
    end;
   end
  else
   form.WorkDataSet.Close;
 end
 else begin
  form.cxNomTree.SetFocus;
  form.cxNomTree.FocusedNode.Expand(false);
 end;
end;

procedure TSpNomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SpNomFormStorage.StoredValue['ID_NOMN']:=NomDataSetID_NOMN.Asinteger;
 SpNomFormStorage.StoredValue['FormWidth']:=Width;
 SpNomFormStorage.StoredValue['FormHeight']:=Height;
 SpNomFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSpNomForm.CancelButtonClick(Sender: TObject);
var
 i: integer;
 rIdNomn, rIdUnit, rLinkTo, rIdSch: integer;
 rName, rNomn, rUnit, rNameSch, rSchNumber: string;
 rTip, rNType: integer;
 rPrice: real;
begin
 if not MemoryDataSet.IsEmpty then
 begin
 // создаем массив записей
  ResultArray := VarArrayCreate([0,MemoryDataSet.RecordCount-1], varVariant);
  MemoryDataSet.First;
  i:=0;
  while not MemoryDataSet.Eof do
  begin
   rIdNomn := MemoryDataSet.FieldByName('ID_NOMN').AsInteger;
   rName:=MemoryDataSet.FieldByName('NAME').AsString;
   if MemoryDataSet.FieldByName('ID_UNIT').IsNull then
    rIdUnit := 0
   else
    rIdUnit := MemoryDataSet.FieldByName('ID_UNIT').AsInteger;
   if MemoryDataSet.FieldByName('UNIT').IsNull then
    rUnit := ''
   else
    rUnit:= MemoryDataSet.FieldByName('UNIT').AsString;
   if MemoryDataSet.FieldByName('PRICE').IsNull then
    rPrice := 0.00
   else
    rPrice := MemoryDataSet.FieldByName('PRICE').AsFloat;
   rIdSch := MemoryDataSet.FieldByName('ID_SCH').AsInteger;
   rNameSch := MemoryDataSet.FieldByName('NAME_SCH').AsString;
   rSchNumber := MemoryDataSet.FieldByName('SCH_NUMBER').AsString;
   rLinkTo := MemoryDataSet.FieldByName('LINKTO').AsInteger;
   if MemoryDataSet.FieldByName('TIP').AsBoolean then
    rTip := 1
   else
    rTip := 0;
   rNType := MemoryDataSet.FieldByName('NTYPE').AsInteger;
   rNomn := MemoryDataSet.FieldByName('NOMN').AsString;
   ResultArray[i]:=VarArrayOf([rIdNomn, rName, rIdUnit, rUnit, rPrice, rIdSch, rNameSch, rSchNumber, rLinkTo, rTip, rNType, rNomn]);
   i:=i+1;
   MemoryDataSet.Next;
  end;
  MemoryDataSet.Close;
 end;
 Close;
end;

procedure TSpNomForm.OkButtonClick(Sender: TObject);
begin
 if ModeSelect=2 then begin
   ResultArray := VarArrayCreate([0,11], varVariant);
   ResultArray[0] := Self.TreeDataSet['ID_NOMN'];
   ResultArray[1] := Self.TreeDataSet['NAME'];
   ResultArray[2] := 0;
   ResultArray[3] := '';
   ResultArray[4] := 0.00;
   ResultArray[5] := Self.TreeDataSetID_SCH.AsInteger;
   ResultArray[6] := Self.TreeDataSetNAME_SCH.AsString;
   ResultArray[7] := Self.TreeDataSetSCH_NUMBER.AsString;
   ResultArray[8] := Self.TreeDataSetLINKTO.AsInteger;
   ResultArray[9] := Self.TreeDataSetTIP.AsInteger;
   ResultArray[10]:= Self.TreeDataSetNTYPE.AsInteger;
   ResultArray[11]:= Self.TreeDataSetNOMN.AsString;
   Close;
 end;
 if ModeSelect=0 then
 begin
  if Not Self.NomDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,11], varVariant);
   ResultArray[0] := Self.NomDataSet['ID_NOMN'];
   ResultArray[1] := Self.NomDataSet['NAME'];
   if Self.NomDataSet.FieldByName('ID_UNIT').IsNull then
    ResultArray[2] := 0
   else
    ResultArray[2] := Self.NomDataSet['ID_UNIT'];
   if Self.NomDataSet.FieldByName('UNIT').IsNull then
    ResultArray[3] := ''
   else
    ResultArray[3] := Self.NomDataSet['UNIT'];
   if Self.NomDataSet.FieldByName('PRICE').IsNull then
    ResultArray[4] := 0.00
   else
    ResultArray[4] := Self.NomDataSet['PRICE'];
   ResultArray[5] := Self.TreeDataSetID_SCH.AsInteger;
   ResultArray[6] := Self.TreeDataSetNAME_SCH.AsString;
   ResultArray[7] := Self.TreeDataSetSCH_NUMBER.AsString;
   ResultArray[8] := Self.NomDataSetLINKTO.AsInteger;
   ResultArray[9] := Self.NomDataSetTIP.AsInteger;
   ResultArray[10]:= Self.NomDataSetNTYPE.AsInteger;
   ResultArray[11]:= Self.NomDataSetNOMN.AsString;
   Close;
  end;
 end;
 if ModeSelect=1 then
 begin
  if Not Self.NomDataSet.IsEmpty
  then begin
//   cxSplitter1.OpenSplitter;
   MemoryDataSet.InsertRecord([NomDataSetID_NOMN.AsInteger, NomDataSetLINKTO.AsInteger, NomDataSetNOMN.AsString, NomDataSetNAME.AsString, NomDataSetID_UNIT.AsInteger, NomDataSetPRICE.AsFloat, NomDataSetTIP.AsBoolean, TreeDataSetID_SCH.AsInteger, NomDataSetUNIT.AsString, NomDataSetNTYPE.AsInteger, TreeDataSetNAME_SCH.AsString, TreeDataSetSCH_NUMBER.AsString]);
  end;
 end;
end;

procedure TSpNomForm.FormShow(Sender: TObject);
begin
 OKButton.Visible := not (Self.FormStyle = fsMDIChild);
 if Width<200 then Width:=750;
 if Height<100 then Height:=550;
// ShowMessage('W='+IntToStr(Width)+' H='+Inttostr(Height));
end;

procedure TSpNomForm.RefreshButtonClick(Sender: TObject);
begin
 RefreshDataSet(TreeDataSet, 'ID_NOMN');
 RefreshDataSet(NomDataSet, 'ID_NOMN');
 RefreshDataSet(PathDataSet, 'ID_NOMN');
end;

procedure TSpNomForm.NTreeAddClick(Sender: TObject);
var
 name : string;
 linkto: integer;
 id_sch: integer;
 id: integer;
 nomn: string;
 form: TSpNomTreeEditForm;
 vals : array of Variant;
begin
 if not Self.NomDataSet.IsEmpty then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_ADD_TREE, mtError, [mbOk]);
  exit;
 end;
 id:=-1;
 form:=TSpNomTreeEditForm.Create(self, DBHANDLE);
 form.Caption:=NOM_STR_FORMCAP_SP_NOMN+' :: '+NOM_STR_ACTION_ADD_CONST;
 form.NTYPE:=TreeDataSet.FieldByName('NTYPE').AsInteger;
 form.ID_SCH:=TreeDataSet.FieldByName('ID_SCH').AsInteger;
 form.cxSchEdit.EditText:=TreeDataSet.FieldByName('SCH_NUMBER').AsString;
 if cxAutoNomn.Checked then form.cxKodEdit.Enabled:=false;
 if form.ShowModal=mrOk then
 begin
  linkto:=TreeDataSet.FieldByName('ID_NOMN').AsInteger;
  name := form.cxNameEdit.Text;
  if cxSetUpperName.Checked then
    name:=AnsiUpperCase(name);
  nomn:= form.cxKodEdit.Text;
  ID_SCH:=form.ID_SCH;
  SetLength(Vals, 6);
  Vals[0] := linkto;
  Vals[1] := nomn;
  Vals[2] := name;
  Vals[3] := form.NTYPE;
  Vals[4] := ID_SCH;
  if cxAutoNomn.Checked then
   Vals[5] := 1
  else
   Vals[5] := 0;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_TREE_INSERT', vals);
   StoredProc.Transaction.Commit;
   ID:=StoredProc.ParamByName('ID_NOMN').AsInteger;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 form.Free;
 if id>0 then begin
  TreeDataSet.CloseOpen(false);
  NomDataSet.CloseOpen(false);
  PathDataSet.CloseOpen(false);
  TreeDataSet.Locate('ID_NOMN', ID, []);
 end;
end;

procedure TSpNomForm.NTreeEditClick(Sender: TObject);
var
 form: TSpNomTreeEditForm;
 cur_id: integer;
 vals : array of Variant;
 name: string;
begin
 cur_id:=TreeDataSetID_NOMN.AsInteger;
 form:=TSpNomTreeEditForm.Create(self, DBHANDLE);
 form.Caption:=NOM_STR_FORMCAP_SP_NOMN+' :: '+NOM_STR_ACTION_UPDATE_CONST;
 form.cxNameEdit.Text:=TreeDataSetNAME.AsString;
 form.cxSchEdit.Text:=TreeDataSetSCH_NUMBER.AsString;
 form.ID_SCH:=TreeDataSetID_SCH.AsInteger;
 form.NTYPE:=TreeDataSetNTYPE.AsInteger;
 form.cxComboBoxNType.Enabled:=false;
 form.cxSchEdit.Properties.ReadOnly:=false;
 form.cxKodEdit.Text:=TreeDataSetNOMN.AsString;
 if cxAutoNomn.Checked then form.cxKodEdit.Enabled:=false;
 if form.ShowModal=mrOk then
 begin
  name:=form.cxNameEdit.Text;
  if cxSetUpperName.Checked then
    name:=AnsiUpperCase(name);
  SetLength(Vals, 5);
  Vals[0] := cur_id;
  Vals[1] := TreeDataSetLINKTO.AsInteger;
  Vals[2] := form.cxKodEdit.Text;
  Vals[3] := name;
  Vals[4] := form.ID_SCH;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_TREE_UPDATE', vals);
   StoredProc.Transaction.Commit;
   TreeDataSet.CloseOpen(false);
   TreeDataSet.Locate('ID_NOMN', cur_id, []);
   NomDataSet.CloseOpen(false);
   PathDataSet.CloseOpen(false);
   cxNomTree.FocusedNode.Expand(false);
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 form.Free;
end;

procedure TSpNomForm.NTreeDelClick(Sender: TObject);
var
 vals : array of Variant;
begin
 if agMessageDlg(NOM_STR_ACTION_DELETE_CONST, NOM_STR_MSG_DEL_STRING, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  SetLength(Vals, 1);
  Vals[0] := TreeDataSetID_NOMN.AsInteger;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_TREE_DELETE', vals);
   StoredProc.Transaction.Commit;
   TreeDataSet.CloseOpen(false);
   NomDataSet.CloseOpen(false);
   PathDataSet.CloseOpen(false);
   cxNomTree.FocusedNode.Expand(false);
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
end;

procedure TSpNomForm.AddButtonClick(Sender: TObject);
var
 form: TSpNomItemEditForm;
 ID_NOMN: integer;
 LINKTO: integer;
 NOMN: string;
 NAME: string;
 ID_UNIT: integer;
 PRICE: real;
 ID_SCH: integer;
 NTYPE: integer;
 vals : array of Variant;
 SaveAndSelect: boolean;
begin
 if cxNomTree.FocusedNode.HasChildren then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_ADD_TREE, mtError, [mbOk]);
  exit;
 end;
 UnitDataSet.CloseOpen(true);
 SaveAndSelect:=false;
 ID_SCH:=TreeDataSetID_SCH.AsInteger;
 LINKTO:=TreeDataSetID_NOMN.AsInteger;
 form:=TSpNomItemEditForm.Create(self, DBHANDLE);
 form.Caption:=NOM_STR_FORMCAP_SP_NOMN+' :: '+NOM_STR_ACTION_ADD_CONST;
 form.ID_UNIT:=0;
 form.SelButton.Visible:=not (Self.FormStyle = fsMDIChild);
 NTYPE:=TreeDataSetNTYPE.AsInteger;
 form.NTYPE:=NTYPE;
 if cxAutoNomn.Checked then form.cxNomnEdit.Enabled:=false;
 if form.ShowModal=mrOk then
  begin
   NOMN:=form.cxNomnEdit.Text;
   NAME:=form.cxNameEdit.Text;
   if cxSetUpperName.Checked then
    NAME:=AnsiUpperCase(NAME);
   ID_UNIT:=form.ID_UNIT;
   PRICE:=form.cxPriceEdit.EditValue;
   SetLength(Vals, 8);
   Vals[0]  := LINKTO;
   Vals[1]  := NOMN;
   Vals[2]  := NAME;
   Vals[3]  := ID_UNIT;
   if form.cxPriceEdit.Text='' then
    Vals[4]:=0.00
   else
    Vals[4]  := PRICE;
   Vals[5]  := ID_SCH;
   Vals[6]  := NTYPE;
   if cxAutoNomn.Checked then Vals[7]:=1
    else Vals[7]:=0;
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_INSERT', vals);
    ID_NOMN:=StoredProc.ParamByName('ID_NOMN').AsInteger;
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   NomDataSet.CloseOpen(False);
   NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
   SaveAndSelect:=form.SaveAndSelect;
  end;
  form.Free;
  if SaveAndSelect then
   OkButton.Click;
end;

procedure TSpNomForm.ModifyButtonClick(Sender: TObject);
var
 form: TSpNomItemEditForm;
 ID_NOMN: integer;
 LINKTO: integer;
 NOMN: string;
 NAME: string;
 ID_UNIT: integer;
 PRICE: real;
 ID_SCH: integer;
 vals : array of Variant;
begin
 if NomDataSet.IsEmpty then
  exit;
 UnitDataSet.CloseOpen(true);
 form:=TSpNomItemEditForm.Create(self, DBHANDLE);
 form.Caption:=NOM_STR_FORMCAP_SP_NOMN+' :: '+NOM_STR_ACTION_UPDATE_CONST;
 ID_NOMN:=NomDataSet.FieldByName('ID_NOMN').AsInteger;
 ID_SCH:=TreeDataSetID_SCH.AsInteger;
 LINKTO:=TreeDataSetID_NOMN.AsInteger;
 form.ID_UNIT:=NomDataSet.FieldByName('ID_UNIT').AsInteger;
 form.cxNomnEdit.Text:=NomDataSet.FieldByName('NOMN').AsString;
 form.cxNameEdit.Text:=NomDataSet.FieldByName('NAME').AsString;
 form.cxPriceEdit.EditValue:=NomDataSet.FieldByName('PRICE').AsFloat;
 form.cxUnit.Text:=NomDataSet.FieldByName('UNIT').AsString;
 form.NTYPE:=NomDataSetNTYPE.AsInteger;
 if cxAutoNomn.Checked then form.cxNomnEdit.Enabled:=false;
 if form.ShowModal=mrOk then
 begin
   NOMN:=form.cxNomnEdit.Text;
   NAME:=form.cxNameEdit.Text;
   if cxSetUpperName.Checked then
    NAME:=AnsiUpperCase(NAME);
   ID_UNIT:=form.ID_UNIT;
   PRICE:=form.cxPriceEdit.EditValue;
   SetLength(Vals, 7);
   Vals[0]  := ID_NOMN;
   Vals[1]  := LINKTO;
   Vals[2]  := NOMN;
   Vals[3]  := NAME;
   Vals[4]  := ID_UNIT;
   Vals[5]  := PRICE;
   Vals[6]  := ID_SCH;
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_UPDATE', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
 end;
 form.Free;
 RefreshDataSet(NomDataSet, 'ID_NOMN');
end;

procedure TSpNomForm.DeleteButtonClick(Sender: TObject);
var
 vals : array of Variant;
begin
 if agMessageDlg(NOM_STR_ACTION_DELETE_CONST, NOM_STR_MSG_DEL_STRING, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  SetLength(Vals, 1);
  Vals[0] := NomDataSet.FieldByName('ID_NOMN').AsInteger;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_DELETE', vals);
   StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 NomDataSet.CloseOpen(False);
end;

procedure TSpNomForm.ExpandButtonClick(Sender: TObject);
begin
 cxNomTree.FullExpand;
end;

procedure TSpNomForm.CollapseButtonClick(Sender: TObject);
begin
 cxNomTree.FullCollapse;
end;

procedure TSpNomForm.NTreeRefreshClick(Sender: TObject);
begin
 RefreshButton.Click;
end;

{procedure TSpNomForm.tvNomTreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
 id_nomn: integer;
 AnItem: TTreeNode;
begin
 Accept:=false;
 if (Source is TcxDragControlObject) then
 begin
  AnItem := (Sender as TTreeView).GetNodeAt(X, Y);
  try
   id_nomn:=P_ID(AnItem.Data)^.ID;
  except
   Accept:=false;
   exit;
  end;
  if id_nomn>0 then
   begin
    NomDragDataSet.Close;
    NomDragDataSet.SelectSQL.Clear;
    NomDragDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_NOM_BASE WHERE LINKTO=:LINKTO AND TIP=0');
    NomDragDataSet.ParamByName('LINKTO').Value:=id_nomn;
    NomDragDataSet.CloseOpen(false);
    if NomDragDataSet.IsEmpty then
      Accept:=true;
   end
 end;
 if (Source is TTreeView) then
 begin
  if P_ID((Sender as TTreeView).Selected.Data)^.ID>0 then
  begin
   AnItem := (Sender as TTreeView).GetNodeAt(X, Y);
   id_nomn:=P_ID(AnItem.Data)^.ID;
   if id_nomn>0 then
    begin
     NomDragDataSet.Close;
     NomDragDataSet.SelectSQL.Clear;
     NomDragDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_NOM_BASE WHERE LINKTO=:LINKTO');
     NomDragDataSet.ParamByName('LINKTO').Value:=id_nomn;
     NomDragDataSet.CloseOpen(false);
     if NomDragDataSet.IsEmpty then
      Accept:=true;
    end
   else
    Accept:=true;
  end;
 end;
end;

procedure TSpNomForm.tvNomTreeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
 id_nomn, linkto: integer;
 AnItem: TTreeNode;
 vals: array of Variant;
begin
 if (Sender is TTreeView) and (Source is TcxDragControlObject) then
 begin
  AnItem := (Sender as TTreeView).GetNodeAt(X, Y);
  id_nomn:=NomDataSet.FieldValues['ID_NOMN'];
  linkto:=P_ID(AnItem.Data)^.ID;
//  ShowMessage('LINKTO='+IntToStr(linkto)+' ID='+Inttostr(id_nomn)+' NAME='+NomDataSet.FieldValues['NAME']);
  SetLength(Vals, 2);
  Vals[0] := id_nomn;
  Vals[1] := linkto;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_MOVE', vals);
   StoredProc.Transaction.Commit;
   NomDataSet.CloseOpen(false);
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 if (Sender is TTreeView) and (Source is TTreeView) then
 begin
  AnItem := (Sender as TTreeView).GetNodeAt(X, Y);
  id_nomn:=P_ID((Source as TTreeView).Selected.Data)^.ID;
  linkto:=P_ID(AnItem.Data)^.ID;
  SetLength(Vals, 4);
  Vals[0] := P_ID((Sender as TTreeView).Selected.Data)^.ID;
  Vals[1] := linkto;
  Vals[2] := P_ID((Sender as TTreeView).Selected.Data)^.Name;
  Vals[3] := P_ID((Sender as TTreeView).Selected.Data)^.ID_SCH;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_TREE_UPDATE', vals);
   StoredProc.Transaction.Commit;
   (Sender as TTreeView).Selected.MoveTo(AnItem, naAddChild);
   P_ID((Sender as TTreeView).Selected.Data)^.R_ID:=linkto;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
  NTreeRefreshClick(Self);
 end;
end;
}

procedure TSpNomForm.cxGridDBTableView1DblClick(Sender: TObject);
var
 linkto, id_nomn: integer;
begin
 if SearchDataSet.IsEmpty then
  Exit;
 id_nomn:=SearchDataSet.FieldByName('ID_NOMN').AsInteger;
 linkto:=SearchDataSet.FieldByName('LINKTO').AsInteger;
 if id_nomn>0 then
 begin
  if TreeDataSet.Locate('ID_NOMN',linkto,[]) then
  begin
   cxNomTree.FocusedNode.Expand(false);
   NomDataSet.Locate('ID_NOMN', ID_NOMN, []);
   cxNomGrid.SetFocus;
  end;
 end;
end;

procedure TSpNomForm.cxNomGridDBTableView1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButtonClick(self);
end;

procedure TSpNomForm.cxNomGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButtonClick(self);
end;

procedure TSpNomForm.ApplyButtonClick(Sender: TObject);
begin
 cxDBTreeList1NOMN.Visible:=cxShowColTreeNomn.Checked;
 cxDBTreeList1KOD.Visible:=cxShowColTreeNomn.Checked;
 cxDBTreeList1NAME.Visible:=cxShowColTreeName.Checked;
 cxDBTreeList1SCH.Visible:=cxShowColSchNum.Checked;
 cxNomGridDBTableView1KOD.Visible:=cxShowColNomnNomn.Checked;
 cxNomGridDBTableView1NOMN.Visible:=cxShowColNomnNomn.Checked;
 cxNomGridDBTableView1NAME.Visible:=cxShowColNomnName.Checked;
 cxNomGridDBTableView1UNIT.Visible:=cxShowColNomnUnit.Checked;
 cxNomGridDBTableView1PRICE.Visible:=cxShowColNomnPrice.Checked;
 if cxShowKod.Checked then begin
  cxPathTreeList1NOMN.Visible:=false;
  cxPathTreeList1KOD.Visible:=true;
  if cxShowColTreeNomn.Checked then
  begin
   cxDBTreeList1KOD.Visible:=true;
   cxDBTreeList1NOMN.Visible:=false;
  end;
  if cxShowColNomnNomn.Checked then
  begin
   cxNomGridDBTableView1KOD.Visible:=true;
   cxNomGridDBTableView1NOMN.Visible:=false;
  end;
 end
 else begin
  if cxShowColTreeNomn.Checked then
  begin
   cxDBTreeList1KOD.Visible:=false;
   cxDBTreeList1NOMN.Visible:=true;
  end;
  if cxShowColNomnNomn.Checked then
  begin
   cxNomGridDBTableView1KOD.Visible:=false;
   cxNomGridDBTableView1NOMN.Visible:=true;
  end;
  cxPathTreeList1NOMN.Visible:=true;
  cxPathTreeList1KOD.Visible:=false;
 end;
 if cxShowPathPanel.Checked then
  cxSplitter3.OpenSplitter
 else
  cxSplitter3.CloseSplitter;
 cxSplitter2.CloseSplitter;
end;

procedure TSpNomForm.NNomSetupClick(Sender: TObject);
begin
 cxSplitter2.OpenSplitter;
end;

procedure TSpNomForm.NTreeSetupClick(Sender: TObject);
begin
 cxSplitter2.OpenSplitter;
end;

procedure TSpNomForm.cxNomTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxNomGrid.SetFocus;
end;

procedure TSpNomForm.cxSplitter1AfterOpen(Sender: TObject);
begin
// ShowMessage('MSelect='+inttostr(ModeSelect));
end;

procedure TSpNomForm.NDelClick(Sender: TObject);
begin
 if not MemoryDataSet.IsEmpty then
  MemoryDataSet.Delete;
end;

procedure TSpNomForm.NDelAllClick(Sender: TObject);
begin
 MemoryDataSet.EmptyTable;
end;

procedure TSpNomForm.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxGridDBTableView1DblClick(Self);
end;

procedure TSpNomForm.cxNomTreeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
 AHitNode: TcxTreeListDataNode;
 id_nomn, linkto: integer;
 vals: array of Variant;
begin
 if (Sender = Source) then Exit;
 if (Sender is TcxDBTreeList) and (Source is TcxDragControlObject) then
 begin
  AHitNode := TcxTreeListDataNode(TcxDBTreeList(Sender).HitTest.HitNode);
  id_nomn:=NomDataSet.FieldValues['ID_NOMN'];
  linkto:=AHitNode.KeyValue;
  SetLength(Vals, 2);
  Vals[0] := id_nomn;
  Vals[1] := linkto;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_MOVE', vals);
   StoredProc.Transaction.Commit;
   NomDataSet.CloseOpen(false);
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
end;

procedure TSpNomForm.cxNomTreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
 id_nomn: integer;
 AHitNode: TcxTreeListDataNode;
begin
 Accept:=false;
 AHitNode := TcxTreeListDataNode(TcxDBTreeList(Sender).HitTest.HitNode);
 try
  id_nomn:=AHitNode.KeyValue;
 except
  Accept:=false;
  exit;
 end;
 if (Source is TcxDragControlObject) then
 begin
  if id_nomn>0 then
   begin
    NomDragDataSet.Close;
    NomDragDataSet.SelectSQL.Clear;
    NomDragDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_NOM_BASE WHERE LINKTO=:LINKTO AND TIP=0');
    NomDragDataSet.Prepare;
    NomDragDataSet.ParamByName('LINKTO').Value:=id_nomn;
    NomDragDataSet.CloseOpen(false);
    if NomDragDataSet.IsEmpty then
      Accept:=true;
   end
 end;
{ if (Source is TcxDBTreeList) then
 begin
  if TreeDataSetID_NOMN.AsInteger>0 then
  begin
   if id_nomn>0 then
    begin
     NomDragDataSet.Close;
     NomDragDataSet.SelectSQL.Clear;
     NomDragDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_NOM_BASE WHERE LINKTO=:LINKTO');
     NomDragDataSet.ParamByName('LINKTO').Value:=id_nomn;
     NomDragDataSet.CloseOpen(false);
     if NomDragDataSet.IsEmpty then
      Accept:=true;
    end
   else
    Accept:=true;
  end;
 end;
}
end;
{
 if (Sender is TTreeView) and (Source is TTreeView) then
 begin
  AnItem := (Sender as TTreeView).GetNodeAt(X, Y);
  id_nomn:=P_ID((Source as TTreeView).Selected.Data)^.ID;
  linkto:=P_ID(AnItem.Data)^.ID;
  SetLength(Vals, 4);
  Vals[0] := P_ID((Sender as TTreeView).Selected.Data)^.ID;
  Vals[1] := linkto;
  Vals[2] := P_ID((Sender as TTreeView).Selected.Data)^.Name;
  Vals[3] := P_ID((Sender as TTreeView).Selected.Data)^.ID_SCH;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_SP_NOMN_TREE_UPDATE', vals);
   StoredProc.Transaction.Commit;
   (Sender as TTreeView).Selected.MoveTo(AnItem, naAddChild);
   P_ID((Sender as TTreeView).Selected.Data)^.R_ID:=linkto;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
  NTreeRefreshClick(Self);
 end;
}
procedure TSpNomForm.PrintButtonClick(Sender: TObject);
var
 T: TSpNomPrintForm;
begin
 T:=TSpNomPrintForm.Create(self);
 if T.ShowModal=mrOk then
 begin
  PrintDataSet.Close;
  if T.cxReports.ItemIndex=0 then
  begin
   with PrintDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_SP_NOMN_TREE_SELECT(:R_ID_NOMN, NULL, 0)');
   end;
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Reports\Matas\NomnGroup.frf');
  end;
  if T.cxReports.ItemIndex=1 then
  begin
   with PrintDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT M.NOMN, M.NAME, M.PRICE, M.TIP, U.SHORT_NAME, M.KOD');
    Add('FROM MAT_SP_NOM_BASE M LEFT OUTER JOIN PUB_SP_UNIT_MEAS U ON M.ID_UNIT=U.ID_UNIT_MEAS');
    Add('WHERE LINKTO=:R_ID_NOMN AND M.TIP=1 ORDER BY M.NAME');
   end;
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Reports\Matas\NomnList.frf');
  end;
  PrintDataSet.Prepare;
  PrintDataSet.ParamByName('R_ID_NOMN').Value:=TreeDataSet.FieldByName('ID_NOMN').AsInteger;
  PrintDataSet.CloseOpen(false);
  frReport.PrepareReport;
  if T.cxCopies.Value>1 then
   frReport.DefaultCopies:=T.cxCopies.Value;
  if T.cxCheckOnPrinter.Checked then
  begin
   if T.cxSelectPrinter.Checked then
    frReport.PrintPreparedReportDlg
   else
    frReport.PrintPreparedReport('', T.cxCopies.Value, false, frAll);
  end
  else
   frReport.ShowReport;
  frReport.DesignReport;
  PrintDataSet.Close;
 end;
 T.Free;
end;

procedure TSpNomForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE then
  CancelButtonClick(self);
end;

procedure TSpNomForm.cxNomGridDBTableView1PRICEHeaderClick(
  Sender: TObject);
begin
 cxNomGridDBTableView1.OptionsBehavior.IncSearchItem:=cxNomGridDBTableView1PRICE;
end;

procedure TSpNomForm.cxNomGridDBTableView1NAMEHeaderClick(Sender: TObject);
begin
 cxNomGridDBTableView1.OptionsBehavior.IncSearchItem:=cxNomGridDBTableView1NAME;
end;

procedure TSpNomForm.cxNomGridDBTableView1NOMNHeaderClick(Sender: TObject);
begin
 cxNomGridDBTableView1.OptionsBehavior.IncSearchItem:=cxNomGridDBTableView1NOMN;
end;

procedure TSpNomForm.NNomViewSelClick(Sender: TObject);
begin
 cxSearchGrid.Visible:=false;
 cxMemoryGrid.Visible:=true;
 cxSplitter1.OpenSplitter;
end;

procedure TSpNomForm.NHideSelClick(Sender: TObject);
begin
 cxSearchGrid.Visible:=true;
 cxMemoryGrid.Visible:=false;
 cxSplitter1.CloseSplitter;
end;

procedure TSpNomForm.acFindExecute(Sender: TObject);
var
 T: TSpNomSearchForm;
begin
 T:=TSpNomSearchForm.Create(self);
 T.Caption:=NOM_STR_FORMCAP_SP_NOMN+' :: '+NOM_STR_ACTION_FIND_CONST;
 if (T.ShowModal=mrOk) and (trim(T.cxSearchEdit.Text)<>'') then
 begin
  SearchDataSet.Close;
  SearchDataSet.ParamByName('PART_NAME').Value:=trim(T.cxSearchEdit.Text)+'%';
  SearchDataSet.CloseOpen(true);
  if not SearchDataSet.IsEmpty then
  begin
   cxSplitter1.OpenSplitter;
   cxSearchGrid.Visible:=true;
   cxSearchGrid.SetFocus;
   cxMemoryGrid.Visible:=false;
  end;
//  else
//   ShowMessage('Nothing found!');
 end;
 T.Free;
end;

procedure TSpNomForm.acEditNomnExecute(Sender: TObject);
var
 T: TfmEditNomn;
 id_nomn: integer;
 Vals: array of variant;
 w: TWaitForm;
begin
 if cxNomTree.IsFocused then
 begin
  T:=TfmEditNomn.Create(self);
  id_nomn:=TreeDataSet.FieldByName('ID_NOMN').AsInteger;
  T.cxNomn.Text:=TreeDataSet.FieldByName('NOMN').AsString;
  if T.ShowModal=mrOk then
  begin
   Refresh;
   w:=TWaitForm.Create(self);
   w.Show;
   w.Refresh;
   SetLength(Vals, 4);
   Vals[0] := id_nomn;
   Vals[1] := T.cxNomn.Text;
   if T.cxCheckRecurse.Checked then
    Vals[2] := 1
   else
    Vals[2] := 0;
   Vals[3]:=1;
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_SP_NOMN_UPDATE_NOMN', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
      exit;
     end;
   end;
   w.Free;
   NTreeRefreshClick(Self);
  end;
  T.Free;
 end
end;

procedure TSpNomForm.NNomAddInGroupClick(Sender: TObject);
var FM:TAddInGroupForm;
    id_nomn, linkto: integer;
    vals: array of Variant;
begin
 id_nomn:=NomDataSet.FieldValues['ID_NOMN'];
 linkto:=NomDataSet.FieldValues['LINKTO'];
 FM:=TAddInGroupForm.Create(self);
 FM.ShowModal;
 if FM.ModalResult=mrOk then
  if not(FM.proverka=0) then ShowMessage('Переміщати можна тільки в групи нижнього рівня')
  else
    begin
      if linkto=FM.linkto then
        ShowMessage('Переміщати в цю ж групу не має сенсу')
      else
        begin
          linkto:=FM.linkto;
          SetLength(Vals, 2);
          Vals[0] := id_nomn;
          Vals[1] := linkto;
          try
          StoredProc.Transaction := WriteTransaction;
          StoredProc.Transaction.StartTransaction;
          StoredProc.ExecProcedure('MAT_SP_NOMN_BASE_MOVE', vals);
          StoredProc.Transaction.Commit;
          NomDataSet.CloseOpen(false);
          except on E : Exception
            do begin
            ShowMessage(E.Message);
            StoredProc.Transaction.Rollback;
            exit;
            end;
          end;
        end;
    end;
end;

procedure TSpNomForm.actShowHistoryExecute(Sender: TObject);
var form:TSpNomHistoryForm;
begin
 if NomDataSet.IsEmpty then Exit;
 Form:=TSpNomHistoryForm.Create(Self);
 Form.id:=NomDataSet.FieldValues['ID_NOMN'];
 Form.ShowModal;
 Form.Free;
end;

procedure TSpNomForm.N10Click(Sender: TObject);
begin
 try
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_SP_NOMN_SET_DISENABLE';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_NOMN').AsInteger:= TreeDataSetID_NOMN.AsInteger;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
//  NomDataSet.CloseOpen(false);
  except on E : Exception
   do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
   end;
  end;
  RefreshDataSet(TreeDataSet, 'ID_NOMN');
 RefreshDataSet(NomDataSet, 'ID_NOMN');
 RefreshDataSet(PathDataSet, 'ID_NOMN');
end;

end.
