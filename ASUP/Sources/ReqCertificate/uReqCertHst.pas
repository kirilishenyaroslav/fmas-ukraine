unit uReqCertHst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxImage, FIBDataSet,
  pFIBDataSet, ImgList, cxGridTableView, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxCheckBox;

type
  TfrmReqCertHst = class(TForm)
    Panel1: TPanel;
    ReqHstGrid: TcxGrid;
    ReqCertGridDBTableView: TcxGridDBTableView;
    cxGridDBDBColumn1: TcxGridDBColumn;
    cxGridDBDBColumn2: TcxGridDBColumn;
    cxGridDBDBColumn3: TcxGridDBColumn;
    cxGridDBDBColumn4: TcxGridDBColumn;
    cxGridDBDBColumn5: TcxGridDBColumn;
    ReqCertGridLevel: TcxGridLevel;
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
    HstSource: TDataSource;
    DSetHst: TpFIBDataSet;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
     constructor Create(AOwner:TComponent; IdReqCertificate:Integer);
    { Public declarations }
  end;

var
  frmReqCertHst: TfrmReqCertHst;

implementation

{$R *.dfm}

uses fmReqCertificateUnit;

constructor TfrmReqCertHst.Create(AOwner:TComponent; IdReqCertificate:Integer);
begin
   inherited Create(AOwner);
   try
     DSetHst.Close;
     DSetHst.SQLs.SelectSQL.Text:='select distinct * '+
                                  'from UP_REQUEST_CERT_HST_SEL(:ID_REQUEST_CERTIFICATE) '+
                                  'order by id_hst';
     DSetHst.ParamByName('ID_REQUEST_CERTIFICATE').AsInteger:=IdReqCertificate;
     DSetHst.Open;
   except on e:Exception
   do begin
         ShowMessage(e.Message);
      end;
   end;
end;

procedure TfrmReqCertHst.SpeedButton1Click(Sender: TObject);
begin
   Close
end;

end.
