unit uNewOkladWarnings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, StdCtrls, Buttons, ExtCtrls;

type
  TfmNewOkladsWarnings = class(TForm)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    WarningsGrid: TcxGrid;
    WarningsView: TcxGridDBTableView;
    WarningsGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    Label4: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    NAME_DEPARTMENTColumn: TcxGridDBColumn;
    NAME_POSTColumn: TcxGridDBColumn;
    ERR_MESSAGEColumn: TcxGridDBColumn;
    NAME_RAISEColumn: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewOkladsWarnings: TfmNewOkladsWarnings;

implementation

{$R *.dfm}

end.
