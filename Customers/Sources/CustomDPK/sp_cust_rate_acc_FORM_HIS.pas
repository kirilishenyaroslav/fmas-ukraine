unit sp_cust_rate_acc_FORM_HIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, cxContainer,
  cxTextEdit, cxDBEdit, cxLabel;

type
  TfrmHistAcc = class(TForm)
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    HistoryDataSet: TpFIBDataSet;
    HistoryDataSource: TDataSource;
    cxGrid2DBTableView1DATE_HIS: TcxGridDBColumn;
    cxGrid2DBTableView1RATE_ACCOUNT: TcxGridDBColumn;
    cxGrid2DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid2DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid2DBTableView1MFO: TcxGridDBColumn;
    cxGrid2DBTableView1NAME_MFO: TcxGridDBColumn;
    cxGrid2DBTableView1NAME_TYPE_ACCOUNT: TcxGridDBColumn;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    id_rate_account : int64;
  end;

var
  frmHistAcc: TfrmHistAcc;

implementation
uses sp_customer_FORM;

{$R *.dfm}

procedure TfrmHistAcc.FormShow(Sender: TObject);
begin
 HistoryDataSet.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_rate_account;
 HistoryDataSet.Open;
end;

procedure TfrmHistAcc.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmHistAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 HistoryDataSet.Close;
end;

end.
