unit MainVewSubs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, dxBarExtItems, dxBar,
  ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase;

type
  TfrmMainViewSubs = class(TForm)
    StatusBar1: TStatusBar;
    pFIBDataSetAllRooms: TpFIBDataSet;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
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
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGridPeopleT1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    FIOT1: TcxGridDBColumn;
    CAT_PAYT1: TcxGridDBColumn;
    KURST1: TcxGridDBColumn;
    FAKT1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ActionList1: TActionList;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    FindAction: TAction;
    ActionPrior: TAction;
    ActionNext: TAction;
    ActionList2: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddRoomButton: TdxBarLargeButton;
    DeleteRoomButton: TdxBarLargeButton;
    EditRoomButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarEditFIO: TdxBarEdit;
    dxBarStatic1: TdxBarStatic;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ViewSubs(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ViewSubs;

var
  frmMainViewSubs: TfrmMainViewSubs;

implementation

{$R *.dfm}

function ViewSubs(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Subs:TfrmMainViewSubs;
begin
  Subs:=TfrmMainViewSubs.create(AOwner,DB);
end;

Constructor TfrmMainViewSubs.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  Database.Handle:=DB;
end;  


end.
