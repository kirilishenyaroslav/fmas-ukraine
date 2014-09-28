unit prodDateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dt_contract_FORM_ADD, FIBDataSet, pFIBDataSet,
  cxTextEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCalendar;

type
  TfrmProdDate = class(TForm)
    DBGrid3: TcxGrid;
    DBGrid3DBTableView1: TcxGridDBTableView;
    DBGrid3Level1: TcxGridLevel;
    pFIBDataSet1: TpFIBDataSet;
    DBGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    DBGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    DBGrid3DBTableView1DBColumn3: TcxGridDBColumn;
    cxButton1: TcxButton;
    DataSource1: TDataSource;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdDate: TfrmProdDate;

implementation

{$R *.dfm}

procedure TfrmProdDate.cxButton1Click(Sender: TObject);
begin
 Close;
end;

end.
