unit BankSchSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ImgList,
  ActnList, RxMemDS, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridTableView, StdCtrls, cxButtons, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmbankSchSelect = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
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
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1ID_SCH: TFIBBCDField;
    pFIBDataSet1DATE_BEG: TFIBDateField;
    pFIBDataSet1DATE_END: TFIBDateField;
    pFIBDataSet1SCH_TITLE: TFIBStringField;
    pFIBDataSet1SCH_NUM: TFIBStringField;
    pFIBDataSet1ID_RAS: TFIBBCDField;
    DataSource1: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    RxMemoryData1: TRxMemoryData;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionSel: TAction;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbankSchSelect: TfrmbankSchSelect;

implementation

{$R *.dfm}

end.
