unit sp_bank_FORM_HIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmBankHis = class(TForm)
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_BANK: TcxGridDBColumn;
    cxGrid1DBTableView1MFO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_MFO: TcxGridDBColumn;
    cxGrid1DBTableView1CITY: TcxGridDBColumn;
    cxGrid1DBTableView1USE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1USE_END: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBankHis: TfrmBankHis;

implementation
uses sp_bank_FORM;

{$R *.dfm}

procedure TfrmBankHis.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmBankHis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DataSet.Close;
end;

procedure TfrmBankHis.FormShow(Sender: TObject);
begin
 DataSet.Active := true;
end;

end.

select b.*, u.name as name_user from pub_sp_bank_his b, users u where b.id_bank = :ID_BANK and b.id_user = u.id_user
