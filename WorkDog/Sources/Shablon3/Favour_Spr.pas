unit Favour_Spr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  cxGridTableView, cxTL, dxBarExtItems, dxBar, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ImgList, dxStatusBar, StdCtrls, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmFavour = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BottomPanel: TPanel;
    Label1: TLabel;
    SearchEdit: TEdit;
    dxStatusBar1: TdxStatusBar;
    ImageList1: TImageList;
    DataSource: TDataSource;
    pFIBDataSet_type_dog: TpFIBDataSet;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    ActionList: TActionList;
    add: TAction;
    red: TAction;
    del: TAction;
    up: TAction;
    cl: TAction;
    prosmotr: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pFIBStoredProc_tip_dog: TpFIBStoredProc;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_pr: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_get_group_doc: TdxBarLargeButton;
    dxBarLargeButton_close: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    pFIBDataSet_spr: TpFIBDataSet;
    pFIBTransaction_lock: TpFIBTransaction;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFavour: TfrmFavour;

implementation

{$R *.dfm}

end.
