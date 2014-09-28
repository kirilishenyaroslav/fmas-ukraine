unit UPremiaSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, Buttons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  cxTextEdit, cxCheckBox;

type
  TfrmPremiaSum = class(TForm)
    SumPremiaGridDBTableView1: TcxGridDBTableView;
    SumPremiaGridLevel1: TcxGridLevel;
    SumPremiaGrid: TcxGrid;
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
    colNameSmet: TcxGridDBColumn;
    colSuma: TcxGridDBColumn;
    OkButton: TBitBtn;
    DSetPremiaSum: TpFIBDataSet;
    DSourcePremiaSum: TDataSource;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
     //
  public
    { Public declarations }
  end;

var
    frmPremiaSum: TfrmPremiaSum;

implementation

uses UpOrderList;
{$R *.dfm}

procedure TfrmPremiaSum.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmPremiaSum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Close;
end;

procedure TfrmPremiaSum.FormCreate(Sender: TObject);
begin
    DSetPremiaSum.Database := TUpOrderListForm(Owner).WorkDatabase;
    DSetPremiaSum.Transaction := TUpOrderListForm(Owner).ReadTransaction;
    DSetPremiaSum.SelectSQL.Text := 'SELECT * FROM UP_GET_PREMIA_SUM(' + TUpOrderListForm(Owner).OrderList.FieldByName('ID_ORDER').AsString + ')';
    DSetPremiaSum.Open;
end;

end.
