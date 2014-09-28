unit BankNastroikaInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, cxMemo,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmBankNastroikaInvoice = class(TForm)
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxTextEdit: TcxTextEdit;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit9: TcxTextEdit;
    cxTextEdit10: TcxTextEdit;
    cxTextEdit11: TcxTextEdit;
    cxTextEdit12: TcxTextEdit;
    cxTextEdit13: TcxTextEdit;
    cxTextEdit14: TcxTextEdit;
    cxTextEdit15: TcxTextEdit;
    cxTextEdit16: TcxTextEdit;
    cxTextEdit17: TcxTextEdit;
    cxTextEdit18: TcxTextEdit;
    cxTextEdit19: TcxTextEdit;
    cxTextEdit20: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit3: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxMemo1: TcxMemo;
    cxMemo2: TcxMemo;
    cxMemo3: TcxMemo;
    cxMemo4: TcxMemo;
    cxMemo5: TcxMemo;
    cxMemo6: TcxMemo;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_user : int64;
    constructor Create(AOwner: TComponent; d : Tpfibdatabase); reintroduce;
  end;


{  fmBankNastroikaInvoice: TfmBankNastroikaInvoice;   }

function Show_Bank_nastroyka_invoice(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
    exports Show_Bank_nastroyka_invoice;

implementation

{$R *.dfm}

function Show_Bank_nastroyka_invoice(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
var
    T : TfmBankNastroikaInvoice;
begin
    T := TfmBankNastroikaInvoice.Create(Ao, d);
    T.id_user := id_use;
    T.Show;
end;

constructor TfmBankNastroikaInvoice.Create(AOwner: TComponent; d: Tpfibdatabase);
begin
    inherited Create(AOwner);

   // Database := D;
    Database.Handle                          := D.Handle;
    TransactionRead.StartTransaction;

    DataSet.Database                         := Database;
    DataSet.Transaction                      := TransactionRead;

    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI_INVOICES_SEL';
    DataSet.Open;

    TransactionRead.StartTransaction;

    cxTextEdit.Text   :=   DataSet.fbn('cn_customer').AsString;
    cxTextEdit1.Text  :=   DataSet.fbn('st_customer').AsString;
    cxTextEdit2.Text  :=   DataSet.fbn('st_k_customer').AsString;
    cxTextEdit3.Text  :=   DataSet.fbn('cn_inn_cust').AsString;
    cxTextEdit4.Text  :=   DataSet.fbn('st_inn_cust').AsString;
    cxTextEdit5.Text  :=   DataSet.fbn('st_k_inn_cust').AsString;
    cxTextEdit9.Text  :=   DataSet.fbn('cn_num_r_cust').AsString;
    cxTextEdit10.Text :=   DataSet.fbn('st_num_r_cust').AsString;
    cxTextEdit11.Text :=   DataSet.fbn('st_k_num_r_cust').AsString;
    cxTextEdit12.Text :=   DataSet.fbn('cn_type_dog_cust').AsString;
    cxTextEdit13.Text :=   DataSet.fbn('st_type_dog_cust').AsString;
    cxTextEdit14.Text :=   DataSet.fbn('st_k_type_dog_cust').AsString;
    cxTextEdit15.Text :=   DataSet.fbn('cn_form_dog_cust').AsString;
    cxTextEdit16.Text :=   DataSet.fbn('st_form_dog_cust').AsString;
    cxTextEdit17.Text :=   DataSet.fbn('st_k_form_dog_cust').AsString;
    cxTextEdit18.Text :=   DataSet.fbn('cn_num_dog_cust').AsString;
    cxTextEdit19.Text :=   DataSet.fbn('st_num_dog_cust').AsString;
    cxTextEdit20.Text :=   DataSet.fbn('st_k_num_dog_cust').AsString;
    cxMemo4.Text      :=   DataSet.fbn('cn_adr_cust').AsString;
    cxMemo5.Text      :=   DataSet.fbn('st_adr_cust').AsString;
    cxMemo6.Text      :=   DataSet.fbn('st_k_adr_cust').AsString;
    cxMemo1.Text      :=   DataSet.fbn('cn_title').AsString;
    cxMemo2.Text      :=   DataSet.fbn('stud_title').AsString;
    cxMemo3.Text      :=   DataSet.fbn('st_k_nomenk_cust').AsString;
    cxDateEdit1.date  :=   DataSet.fbn('cn_date_dog_cust').AsDateTime;
    cxDateEdit2.date  :=   DataSet.fbn('st_date_dog_cust').AsDateTime;
    cxDateEdit3.date  :=   DataSet.fbn('st_k_date_dog_cust').AsDateTime;
end;

procedure TfmBankNastroikaInvoice.cxButton1Click(Sender: TObject);
begin
    TransactionRead.StartTransaction;
    try
      StoredProc.StoredProcName := 'BANK_INI_INVOICES_UPD';

      StoredProc.Prepare;
      StoredProc.ParamByName('cn_title').AsString           := cxMemo1.Text;
      StoredProc.ParamByName('stud_title').AsString         := cxMemo2.Text;
      StoredProc.ParamByName('cn_customer').AsString        :=cxTextEdit.Text;
      StoredProc.ParamByName('st_customer').AsString        := cxTextEdit1.Text;
      StoredProc.ParamByName('st_k_customer').AsString      := cxTextEdit2.Text;
      StoredProc.ParamByName('cn_inn_cust').AsString        := cxTextEdit3.Text;
      StoredProc.ParamByName('st_inn_cust').AsString        := cxTextEdit4.Text ;
      StoredProc.ParamByName('st_k_inn_cust').AsString      := cxTextEdit5.Text;
      StoredProc.ParamByName('cn_adr_cust').AsString        := cxMemo4.Text;
      StoredProc.ParamByName('st_adr_cust').AsString        := cxMemo5.Text ;
      StoredProc.ParamByName('st_k_adr_cust').AsString      := cxMemo6.Text;
      StoredProc.ParamByName('cn_num_r_cust').AsString      := cxTextEdit9.Text;
      StoredProc.ParamByName('st_num_r_cust').AsString      := cxTextEdit10.Text;
      StoredProc.ParamByName('st_k_num_r_cust').AsString    := cxTextEdit11.Text;
      StoredProc.ParamByName('cn_type_dog_cust').AsString   := cxTextEdit12.Text;
      StoredProc.ParamByName('st_type_dog_cust').AsString   :=cxTextEdit13.Text;
      StoredProc.ParamByName('st_k_type_dog_cust').AsString := cxTextEdit14.Text;
      StoredProc.ParamByName('cn_form_dog_cust').AsString:= cxTextEdit15.Text;
      StoredProc.ParamByName('st_form_dog_cust').AsString:= cxTextEdit16.Text;
      StoredProc.ParamByName('st_k_form_dog_cust').AsString:= cxTextEdit17.Text;
      StoredProc.ParamByName('cn_date_dog_cust').AsDateTime:= cxDateEdit1.date;
      StoredProc.ParamByName('st_date_dog_cust').AsDateTime:= cxDateEdit2.date;
      StoredProc.ParamByName('st_k_date_dog_cust').AsDateTime:= cxDateEdit3.date;
      StoredProc.ParamByName('st_k_nomenk_cust').AsString:= cxMemo3.Text;
      StoredProc.ParamByName('cn_num_dog_cust').AsString:= cxTextEdit18.Text;
      StoredProc.ParamByName('st_num_dog_cust').AsString:=cxTextEdit19.Text;
      StoredProc.ParamByName('st_k_num_dog_cust').AsString:= cxTextEdit20.Text;

      StoredProc.ExecProc;
      TransactionRead.Commit;

      close;
    except
      begin
        TransactionRead.Rollback;
        Showmessage('При редагуванні виникла помилка');
        exit;
      end;
end;

end;

procedure TfmBankNastroikaInvoice.cxButton2Click(Sender: TObject);
begin
     close;
end;

end.
