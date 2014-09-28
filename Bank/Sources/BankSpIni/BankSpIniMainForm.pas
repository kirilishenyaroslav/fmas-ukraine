unit BankSpIniMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Placemnt, dxBar, dxBarExtItems, dxStatusBar,
  ActnList, ImgList, FIBDatabase, pFIBDatabase;

type
  TfmBankSpIniMainForm = class(TForm)
    dxBarManager1: TdxBarManager;
    dxStatusBar1: TdxStatusBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    FormStorage1: TFormStorage;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    ImageList: TImageList;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    ActionRefresh: TAction;
    ActionTake: TAction;
    ActionCancle: TAction;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    dxBarLargeButton6: TdxBarLargeButton;
    pFIBDatabase1: TpFIBDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Bank_Sp_Ini_Sch_Show(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):Integer;stdcall;
  function Bank_Sp_Ini_Sch_Select(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):Variant;stdcall;
     exports Bank_Sp_Ini_Sch_Show, Bank_Sp_Ini_Sch_Select;

implementation

{$R *.dfm}

function Bank_Sp_Ini_Sch_Show(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):Integer;stdcall;
begin
//
end;

function Bank_Sp_Ini_Sch_Select(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):Variant;stdcall;
begin
//
end;


end.
