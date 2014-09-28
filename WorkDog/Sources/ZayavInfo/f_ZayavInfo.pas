unit f_ZayavInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, LoadDogManedger, FIBDatabase, pFIBDatabase, iBase, DB,
  cxDropDownEdit, cxCalendar, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, cxCurrencyEdit, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxTL, cxRadioGroup, cxGroupBox;

type
  TfrmZayavInfo = class(TForm)
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSet: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    Bevel1: TBevel;
    cxButton_ok: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource: TDataSource;
    rate_acc_native: TcxGridDBColumn;
    sum: TcxGridDBColumn;
    mfo: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGroupBox1: TcxGroupBox;
    cxRadioButton_fltr: TcxRadioButton;
    cxRadioButton_period: TcxRadioButton;
    cxDateEdit_beg: TcxDateEdit;
    cxDateEdit_end: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxRadioButton_periodClick(Sender: TObject);
    procedure cxRadioButton_fltrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxDateEdit_endExit(Sender: TObject);
    procedure cxDateEdit_begExit(Sender: TObject);
  public
    sqltext : string;
    procedure SelectByPer();
    procedure SelectByFltr();
  end;

  function ZayavInfo(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sql : String; id_rate_acc_native: Variant):Variant; stdcall;
  exports ZayavInfo;


var
  frmZayavInfo: TfrmZayavInfo;
  s: String;

implementation

{$R *.dfm}

function ZayavInfo(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sql : String; id_rate_acc_native: Variant):Variant;
var
  F: TfrmZayavInfo;
  i : integer;
begin
  F := TfrmZayavInfo.Create(Aowner);
  F.pFIBDatabase.Handle := DBHANDLE;
  f.sqltext := sql;
  f.sqltext := f.sqltext + ' group by RATE_ACC_DONNU, MFO_DONNU';
  i := pos('*',f.sqltext);
  Delete(f.sqltext, i, 1);
  Insert(' RATE_ACC_DONNU, MFO_DONNU, sum(summa) ', f.sqltext, i);

  s := f.sqltext;

  F.pFIBDataSet.Active := false;
  F.pFIBDataSet.SQLs.SelectSQL.Text  := s;
  F.pFIBDataSet.Active := true;


  F.ShowModal;
  F.Free;
end;


procedure TfrmZayavInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmZayavInfo.SelectByPer();
begin
  pFIBDataSet.Active := false;
  pFIBDataSet.SQLs.SelectSQL.Text :=
  'select rate_account as RATE_ACC_DONNU , mfo as MFO_DONNU, sum(dog_dt_pl_doc.summa)' +
  'from   dog_dt_pl_doc, pub_sp_cust_rate_acc, pub_sp_bank '+
  'where  dog_dt_pl_doc.id_rate_account_native=pub_sp_cust_rate_acc.id_rate_account '+
  'and    pub_sp_cust_rate_acc.id_bank=pub_sp_bank.id_bank ' +
  'and    dog_dt_pl_doc.export_day >=' + '''' + cxDateEdit_beg.Text + '''' + ' ' +
  'and    dog_dt_pl_doc.export_day <=' + '''' + cxDateEdit_end.Text + '''' + ' ' +
  'and    dog_dt_pl_doc.deleted_system <> 3 '+
  'group by mfo, rate_account';
  pFIBDataSet.Active := true;
end;

procedure TfrmZayavInfo.SelectByFltr();
begin
  pFIBDataSet.Active := false;
  pFIBDataSet.SQLs.SelectSQL.Text := s;
  pFIBDataSet.Active := true;
end;

procedure TfrmZayavInfo.cxButton_okClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmZayavInfo.cxRadioButton_periodClick(Sender: TObject);
begin
  cxDateEdit_beg.Enabled := true;
  cxDateEdit_end.Enabled := true;
  cxDateEdit_beg.SetFocus;
  SelectByPer();
end;

procedure TfrmZayavInfo.cxRadioButton_fltrClick(Sender: TObject);
begin
  cxDateEdit_beg.Enabled := false;
  cxDateEdit_end.Enabled := false;
  SelectByFltr();
end;

procedure TfrmZayavInfo.FormShow(Sender: TObject);
begin
  cxDateEdit_beg.Date    := Date;
  cxDateEdit_end.Date    := Date;
end;

procedure TfrmZayavInfo.cxButton1Click(Sender: TObject);
begin
  if cxRadioButton_fltr.Checked then SelectByFltr();
  if cxRadioButton_period.Checked then SelectByPer();
end;

procedure TfrmZayavInfo.cxDateEdit_endExit(Sender: TObject);
begin
  SelectByPer();
end;

procedure TfrmZayavInfo.cxDateEdit_begExit(Sender: TObject);
begin
  SelectByPer();
end;

end.

