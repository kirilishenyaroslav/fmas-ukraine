unit UpStyleContainer;

interface

uses
  SysUtils, Classes, cxGridBandedTableView, cxClasses, cxStyles,
  cxGridTableView, cxGridCardView;

type
  TStyleContainer = class(TDataModule)
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
    TableViewSheet: TcxGridTableViewStyleSheet;
    BandedTableViewSheet: TcxGridBandedTableViewStyleSheet;
    stBandBackgroup: TcxStyle;
    stBandHeader: TcxStyle;
    CardViewSheet: TcxGridCardViewStyleSheet;
    stCaptionRow: TcxStyle;
    stCardBorder: TcxStyle;
    stRowCaption: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StyleContainer: TStyleContainer;

implementation

{$R *.dfm}

end.
