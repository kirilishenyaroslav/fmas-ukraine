unit ReestrSignsHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxImage, FIBDataSet,
  pFIBDataSet, ImgList, cxGridTableView, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls;

type
  TfrmSignsHst = class(TForm)
    Panel1: TPanel;
    GridSignHst: TcxGrid;
    GridSignHstTableView: TcxGridDBTableView;
    cxGridDBDBColumn1: TcxGridDBColumn;
    cxGridDBDBColumn2: TcxGridDBColumn;
    cxGridDBDBColumn3: TcxGridDBColumn;
    cxGridDBDBColumn4: TcxGridDBColumn;
    cxGridDBDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTypeMove: TcxGridDBColumn;
    GridSignHstLevel: TcxGridLevel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
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
    ImageList: TImageList;
    HistSignsSource: TDataSource;
    HistSignsDataSet: TpFIBDataSet;
    procedure cxGridDBColumn6CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; IdDocument:Integer);
  end;

var
  frmSignsHst: TfrmSignsHst;

implementation

uses uReestrZajavok;

{$R *.dfm}

constructor TfrmSignsHst.Create(AOwner:TComponent; IdDocument:Integer);
begin
   inherited Create(AOwner);
   HistSignsDataSet.Close;
   HistSignsDataSet.SQLs.SelectSQL.Text:='select distinct * '+
                                         'from UP_PERSON_LEVEL_PATH_SEL(:ID_PERSON_DOCUMENT)';
   HistSignsDataSet.ParamByName('ID_PERSON_DOCUMENT').AsInteger:=IdDocument;
   HistSignsDataSet.Open;
end;

procedure TfrmSignsHst.cxGridDBColumn6CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
     ACanvas.FillRect(AViewInfo.Bounds);
     ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 18, AViewInfo.Bounds.Top+3, 1-AViewInfo.GridRecord.Values[cxGridDBTypeMove.Index]);
     ADone := True;
end;

procedure TfrmSignsHst.SpeedButton1Click(Sender: TObject);
begin
   Close
end;

end.
