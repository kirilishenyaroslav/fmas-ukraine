unit UpOrderDismission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, StdCtrls, Buttons,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TfmWarnDismission = class(TForm)
    WarningsGrid: TcxGrid;
    WarningsView: TcxGridDBTableView;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    NAME_DateColumn: TcxGridDBColumn;
    ORDERColumn: TcxGridDBColumn;
    WarningsGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
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
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWarnDismission: TfmWarnDismission;

implementation

{$R *.dfm}

procedure TfmWarnDismission.OkButtonClick(Sender: TObject);
begin
    ModalResult:=mrYes;
end;

procedure TfmWarnDismission.CancelButtonClick(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfmWarnDismission.FormResize(Sender: TObject);
var pos_ok : integer;
begin
    pos_ok := (round(Width/2))-OkButton.Width;
    OkButton.Left := pos_ok;
    CancelButton.Left := (round(Width/2))+5;

end;

end.
