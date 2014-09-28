unit fmHistSigns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit,
  cxGridTableView, Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, ImgList, FIBDataSet, pFIBDataSet, cxImage;

type
  THistSigns = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBDBColumn4: TcxGridDBColumn;
    cxGridDBDBColumn1: TcxGridDBColumn;
    cxGridDBDBColumn2: TcxGridDBColumn;
    cxGridDBDBColumn3: TcxGridDBColumn;
    cxGridDBDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
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
    cxGridDBTypeMove: TcxGridDBColumn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBColumn6CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
      Id_Req_Cert:Integer;
    { Public declarations }
  end;

var
  HistSigns: THistSigns;

implementation
uses  fmReqCertificateUnit;
{$R *.dfm}

procedure THistSigns.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure THistSigns.FormCreate(Sender: TObject);
begin
    {HistSignsDataSet.Close;
    HistSignsDataSet.SQLs.SelectSQL.Text:='select distinct * from UP_DT_CERT_PATH_SEL(:Id_Req_Cert) order by id_path asc , type_move desc';
    HistSignsDataSet.ParamByName('Id_Req_Cert').AsInteger:=Id_Req_Cert;
    HistSignsDataSet.Open;  }
end;

procedure THistSigns.cxGridDBColumn6CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
     ACanvas.FillRect(AViewInfo.Bounds);
     ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 18, AViewInfo.Bounds.Top+3, 1-AViewInfo.GridRecord.Values[cxGridDBTypeMove.Index]);
     ADone := True;
end;

end.
