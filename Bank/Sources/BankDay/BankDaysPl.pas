unit BankDaysPl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BankShowRaschSch, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmDaysLast = class(TForm)
    cxComboBox2: TcxComboBox;
    cxComboBox1: TcxComboBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxButtonEdit: TcxButton;
    cxButtonClose: TcxButton;
    ActionList1: TActionList;
    DataSetDays_ago: TpFIBDataSet;
    Class_Transaction_Wr: TpFIBTransaction;
    Class_Database: TpFIBDatabase;
    TR: TpFIBTransaction;
    DS_SALDO: TpFIBDataSet;
    ActionClose: TAction;
    ActionEdit: TAction;
    StoredProc: TpFIBStoredProc;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);

  private
    { Private declarations }
  public
    myform : TfmBankShowRaschSch;
    constructor Create(AOwner: TComponent; mform : TfmBankShowRaschSch); reintroduce; overload;
  end;

  {TfmDaysLast; }

implementation
uses Un_R_file_Alex;

{$R *.dfm}
constructor TfmDaysLast.Create(AOwner: TComponent; mform : TfmBankShowRaschSch);
var
    days_ago_show, days_ago_do,i : Integer;
begin
    inherited Create (AOwner);
    myform  := mform;

    Caption               := Un_R_file_Alex.BANK_DAYS_AGO;
    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxButtonEdit.Caption  := Un_R_file_Alex.UPDATE_CONST[1];

    cxLabel6.Caption      := Un_R_file_Alex.BANK_COL_DAY_FOR_SHOW[1];
    cxLabel7.Caption      := Un_R_file_Alex.BANK_COL_DAY_FOR_FIND_RASH[1];

    Class_Database := myform.Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_Database.DefaultTransaction    := Class_Transaction_Wr;

    TR.DefaultDatabase                   := Class_Database;

    DataSetDays_ago.Database              := Class_Database;
    DataSetDays_ago.Transaction           := TR;

    DS_SALDO.Database                    := Class_Database;
    DS_SALDO.Transaction                 := TR;

    TR.StartTransaction;

    DataSetDays_ago.Close;
    DataSetDays_ago.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    DataSetDays_ago.Open;

    days_ago_show := DataSetDays_ago.fbn('DAY_AGO_SHOW').AsInteger;
    days_ago_do   := DataSetDays_ago.fbn('DAY_AGO_DO').AsInteger;

    cxComboBox1.Properties.Items.clear;
    for i:=0 to  days_ago_show do cxComboBox1.Properties.Items.Add(inttostr(i));
    cxComboBox1.itemindex:=0;

    cxComboBox2.Properties.Items.clear;
    for i:=0 to  days_ago_do do cxComboBox2.Properties.Items.Add(inttostr(i));
    cxComboBox2.itemindex:=0;

    DS_SALDO.close;
    DS_SALDO.sqls.selectSql.Text := 'select * from BANK_SP_SCH where ID_BANK_SP_SCH='+IntToStr(myform.id_svyaz);
    DS_SALDO.Open;
    if DS_SALDO.fbn('COL_FIND_PL').IsNull
            then cxComboBox2.ItemIndex := 0
            else cxComboBox2.ItemIndex := DS_SALDO.fbn('COL_FIND_PL').AsInteger;
    if DS_SALDO.fbn('COL_SHOW_PL').IsNull
            then cxComboBox1.ItemIndex := 0
            else cxComboBox1.ItemIndex := DS_SALDO.fbn('COL_SHOW_PL').AsInteger;
end;


procedure TfmDaysLast.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmDaysLast.ActionEditExecute(Sender: TObject);
begin
    try
        StoredProc.Database := Class_Database;
        StoredProc.Transaction := Class_Transaction_Wr;
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'BANK_UPDATE_DAY_AGO';
        StoredProc.Prepare;
        StoredProc.ParamByName('d_id_bank_sp_sch').AsInt64  := myform.id_svyaz;
        StoredProc.ParamByName('d_col_find_pl').AsInteger   := cxComboBox2.ItemIndex;
        StoredProc.ParamByName('d_col_show_pl').AsInteger   := cxComboBox1.ItemIndex;
        StoredProc.ExecProc;

        Class_Transaction_Wr.Commit;
      except on E:Exception do
      begin
          showmessage(E.Message);
          Class_Transaction_Wr.Rollback;
          exit;
      end;
    end;
    close;
end;

end.


