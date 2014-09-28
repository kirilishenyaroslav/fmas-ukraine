unit sp_customer_FORM_HIST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters,
  StdCtrls, cxButtons;

type
  TfrmCustHist = class(TForm)
    HistoryDataSet: TpFIBDataSet;
    HistoryDataSource: TDataSource;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2DBTableView1DATE_HIS: TcxGridDBColumn;
    cxGrid2DBTableView1FULL_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1NAME_COMP: TcxGridDBColumn;
    cxGrid2DBTableView1COMP_IP: TcxGridDBColumn;
    cxGrid2DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid2DBTableView1KOD_EDRPOU: TcxGridDBColumn;
    cxButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_customer : int64;
  end;

var
  frmCustHist: TfrmCustHist;

implementation

{$R *.dfm}

procedure TfrmCustHist.FormShow(Sender: TObject);
begin
 HistoryDataSet.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
 HistoryDataSet.Open;
end;

procedure TfrmCustHist.cxButton1Click(Sender: TObject);
begin
 Close;
end;

end.
