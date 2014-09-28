unit BankInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc,
  StdCtrls, cxButtons, cxClasses, cxStyles, cxGridTableView, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, BankDayForm, frxClass, frxDBSet;

type
  TfmBankInvoice = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxButton1: TcxButton;
    cnButtonPrintInv: TcxButton;
    cnButtonPrintReestr: TcxButton;
    cnButtonPrintReestrEr: TcxButton;
    StoredProc: TpFIBStoredProc;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    DataSetPrint: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetPrintNOTE: TFIBStringField;
    DataSetPrintR_DAY: TFIBDateField;
    DataSetPrintNUM_DOC: TFIBStringField;
    DataSetPrintNUM_RAS_NATIVE: TFIBStringField;
    DataSetPrintNUM_RAS_CUST: TFIBStringField;
    DataSetPrintNAME_CUST: TFIBStringField;
    DataSetPrintSCH_NUMBER: TFIBStringField;
    DataSetPrintTITLE_SCH: TFIBStringField;
    DataSetPrintMFO_CUST: TFIBStringField;
    DataSetPrintNAME_MFO_CUST: TFIBStringField;
    DataSetPrintNAME_RAS_CUST: TFIBStringField;
    DataSetPrintOKPO_CUST: TFIBStringField;
    DataSetPrintFULL_NAME_CUST: TFIBStringField;
    DataSetPrintDATE_REG: TFIBDateField;
    DataSetPrintSUMMA: TFIBBCDField;
    DataSetPrintDATE_DOC: TFIBDateField;
    DataSetPrintNUMB_INVOICE: TFIBStringField;
    cxButton2: TcxButton;
    StButtonPrintInv: TcxButton;
    StButtonPrintReestr: TcxButton;
    StButtonPrintReestrEr: TcxButton;
    StKButtonPrintInv: TcxButton;
    cxButton4: TcxButton;
    StKButtonPrintReestr: TcxButton;
    StKButtonPrintReestrEr: TcxButton;
    DataSetPrintMFO_N: TFIBStringField;
    DataSetPrintBANK_NAME_N: TFIBStringField;
    DataSetPrintRSCH_N: TFIBStringField;
    DataSetPrintNAME_CUST_N: TFIBStringField;
    DataSetPrintID_CUSTOMER_N: TFIBBCDField;
    DataSetPrintNNS_N: TFIBStringField;
    DataSetPrintNALOG_NOM_N: TFIBStringField;
    DataSetPrintADRESS_NATIVE: TFIBStringField;
    DataSetPrintPHONE_NATIVE: TFIBStringField;
    DataSetPrintARND_VISA: TFIBStringField;
    DataSetPrintARND_INVOICE_VISA: TFIBStringField;
    DataSetPrintSUM_ALL: TFIBBCDField;
    DataSetPrintTITLE: TFIBStringField;
    DataSetPrintCUSTOMER: TFIBStringField;
    DataSetPrintINN_CUST: TFIBStringField;
    DataSetPrintADR_CUST: TFIBStringField;
    DataSetPrintNUM_R_CUST: TFIBStringField;
    DataSetPrintTYPE_DOG_CUST: TFIBStringField;
    DataSetPrintFORM_DOG_CUST: TFIBStringField;
    DataSetPrintDATE_DOG_CUST: TFIBDateField;
    DataSetPrintNUM_DOG_CUST: TFIBStringField;
    DataSetPrintFIO: TFIBStringField;
    DataSetPrintDATE_STR: TFIBStringField;
    DataSetPrintDATE_DOG_STR: TFIBStringField;
    ReportPrintReestr: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cnButtonPrintReestrClick(Sender: TObject);
    procedure cnButtonPrintReestrErClick(Sender: TObject);
    procedure cnButtonPrintInvClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure StButtonPrintReestrClick(Sender: TObject);
    procedure StButtonPrintReestrErClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure StKButtonPrintReestrClick(Sender: TObject);
    procedure StKButtonPrintReestrErClick(Sender: TObject);
    procedure StButtonPrintInvClick(Sender: TObject);
    procedure StKButtonPrintInvClick(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  id_dt_day, id_sp_ras : int64;
    myform : TfmBankDayForm;
    constructor Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmBankDayForm);
  end;


 { fmBankInvoice: TfmBankInvoice; }

implementation
uses  Un_R_file_Alex, BankProgressClose,Math;

{$R *.dfm}

constructor TfmBankInvoice.Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmBankDayForm);
var
   i, j, days_ago_show : int64;
//    date_beg : string;
//    date_end : TDate;
begin
    inherited Create (AOwner);
    Database                      := DB;
    myform  := m;
    Transaction.DefaultDatabase   := Database;
    Database.DefaultTransaction   := Transaction;

    DataSet.Database              := Database;
    DataSet.Transaction           := Transaction;

    DataSetPrint.Database          := Database;
    DataSetPrint.Transaction       := Transaction;

    StoredProc.Database           := Database;
    StoredProc.Transaction        := Transaction;

    Caption                            := Un_R_file_Alex.BANK_INVOICE_FORM;
    cxButton1.Caption                  := Un_R_file_Alex.BANK_MO_TAKE_PEREFORM[1];
    cxButton2.Caption                  := Un_R_file_Alex.BANK_MO_TAKE_PEREFORM[1];
    cxButton4.Caption                  := Un_R_file_Alex.BANK_MO_TAKE_PEREFORM[1];
    cnButtonPrintInv.Caption           := Un_R_file_Alex.BANK_INVOICE_PRINT;
    StButtonPrintInv.Caption           := Un_R_file_Alex.BANK_INVOICE_PRINT;
    StKButtonPrintInv.Caption          := Un_R_file_Alex.BANK_INVOICE_PRINT;
    cnButtonPrintReestr.Caption        := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR;
    StButtonPrintReestr.Caption        := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR;
    StKButtonPrintReestr.Caption       := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR;
    cnButtonPrintReestrEr.Caption      := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR_ER;
    StButtonPrintReestrEr.Caption      := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR_ER;
    StKButtonPrintReestrEr.Caption     := Un_R_file_Alex.BANK_INVOICE_PRINT_REESTR_ER;
    cxLabel1.Caption                   := Un_R_file_Alex.CN_BANK_INVOICE;
    cxLabel4.Caption                   := Un_R_file_Alex.BANK_INVOICE_PRINT_USER;
    cxLabel6.Caption                   := Un_R_file_Alex.BANK_INVOICE_PRINT_DATE;
    cxLabel8.Caption                   := Un_R_file_Alex.BANK_INVOICE_PRINT_USER;
    cxLabel10.Caption                  := Un_R_file_Alex.BANK_INVOICE_PRINT_DATE;
    cxLabel12.Caption                  := Un_R_file_Alex.BANK_INVOICE_PRINT_USER;
    cxLabel14.Caption                  := Un_R_file_Alex.BANK_INVOICE_PRINT_DATE;

    id_dt_day      := myform.DataSetDayBank['ID_DT_DAY'];
    id_sp_ras      := myform.DataSetDayBank['ID_SP_RAS'];

    DataSet.Close;
    Dataset.SQLs.SelectSQL.Text :='select * from BANK_INVOICE_SELECT('+IntTostr(id_dt_day)+')';
    dataset.Open;

    cxLabel2.Caption                   := Un_R_file_Alex.ST_BANK_INVOICE+' ('+DataSet.FieldByName('SMETA_KOD_T2').AsString+' '+Un_R_file_Alex.BANK_BUDGET_SMALL+')';
    cxLabel3.Caption                   := Un_R_file_Alex.ST_BANK_INVOICE+' ('+DataSet.FieldByName('SMETA_KOD_T3').AsString+' '+Un_R_file_Alex.BANK_BUDGET_SMALL+')';

    if (DataSet['cn_number_invoice']<>null) then  cxTextEdit1.Text := DataSet['cn_number_invoice'];
    if (DataSet['stud_number_invoice']<>null) then  cxTextEdit2.Text := DataSet['stud_number_invoice'];
    if (DataSet['stud_k_number_invoice']<>null) then  cxTextEdit3.Text := DataSet['stud_k_number_invoice']
    else cxTextEdit3.Text := '';
    //if ((DataSet['cn_date_print']=null) and (DataSet['cn_id_user_print']=null)) then
    if (DataSet['cn_id_invoice']=null) then
    begin
        cnButtonPrintInv.Enabled      := false;
        cnButtonPrintReestr.Enabled   := false;
        cnButtonPrintReestrEr.Enabled := false;
    end
    else
    begin
        cnButtonPrintInv.Enabled      := true;
        cnButtonPrintReestr.Enabled   := true;
        cnButtonPrintReestrEr.Enabled := true;
        cxlabel5.Caption              := DataSet.FieldByName('cn_fio_user_print').AsString;
        cxlabel7.Caption              := DataSet.FieldByName('cn_date_print').AsString;
    end;

    if (DataSet['stud_id_invoice']=null) then
    begin
        stButtonPrintInv.Enabled      := false;
        stButtonPrintReestr.Enabled   := false;
        stButtonPrintReestrEr.Enabled := false;
    end
    else
    begin
        stButtonPrintInv.Enabled      := true;
        stButtonPrintReestr.Enabled   := true;
        stButtonPrintReestrEr.Enabled := true;
        cxlabel9.Caption              := DataSet.FieldByName('stud_fio_user_print').AsString;
        cxlabel11.Caption              := DataSet.FieldByName('stud_date_print').AsString;
    end;

    if (DataSet['stud_k_id_invoice']=null) then
    begin
        stKButtonPrintInv.Enabled      := false;
        stKButtonPrintReestr.Enabled   := false;
        stkButtonPrintReestrEr.Enabled := false;
    end
    else
    begin
        stkButtonPrintInv.Enabled      := true;
        stKButtonPrintReestr.Enabled   := true;
        stKButtonPrintReestrEr.Enabled := true;
        cxlabel13.Caption              := DataSet.FieldByName('stud_k_fio_user_print').AsString;
        cxlabel15.Caption              := DataSet.FieldByName('stud_k_date_print').AsString;
    end;

    //Transaction.StartTransaction;
end;

procedure TfmBankInvoice.cxButton1Click(Sender: TObject);
var
    T : TfmBankProgressClose;
begin
    if (cxTextEdit1.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit1.SetFocus;
        exit;
    end;
    T := TfmBankProgressClose.Create(self, Un_R_file_Alex.WAIT_FORM_D);
    T.Show;
    T.Update;
   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_CN_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_RAS').AsInt64         := id_sp_ras;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64      := id_dt_day;
        StoredProc.ParamByName('D_NUMB_INVOICE').AsString  := cxTextEdit1.Text;
        StoredProc.ExecProc;
        Transaction.Commit;

        T.Free;
        showmessage(Un_R_file_Alex.BANK_INVOICE_DONE);
        cnButtonPrintInv.Enabled      := true;
        cnButtonPrintReestr.Enabled   := true;
        cnButtonPrintReestrEr.Enabled := true;

   except
        begin
          Transaction.Rollback;
          T.Free;
          Showmessage(Un_R_file_Alex.BANK_INVOICE_UNDONE);
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.cnButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.cnButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.cnButtonPrintInvClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by num_doc';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\BankInvoice2011.fr3');

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    ReportPrintReestr.Variables['summa_all']         := QuotedStr(floattostr(sum_with_nds));
  

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
    Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_DT_INVOICES_UPD';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64           := id_dt_day;
        StoredProc.ParamByName('D_TYPE_INVOICE').AsInteger      := 1;
        StoredProc.ParamByName('D_ID_USER_PRINT').AsInt64       := myform.id_user;
        StoredProc.ParamByName('D_DATE_PRINT').AsDateTime       := now;

        StoredProc.ExecProc;
        Transaction.Commit;
        DataSet.CloseOpen(true);
        close;
   except
        begin
          Transaction.Rollback;
          Showmessage('При формуванні виникла помилка');
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.cxButton2Click(Sender: TObject);
var
    T : TfmBankProgressClose;
begin
    if (cxTextEdit2.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit2.SetFocus;
        exit;
    end;
   T := TfmBankProgressClose.Create(self, Un_R_file_Alex.WAIT_FORM_D);
   T.Show;
   T.Update;
   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_ST_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_RAS').AsInt64         := id_sp_ras;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64      := id_dt_day;
        StoredProc.ParamByName('D_NUMB_INVOICE').AsString  := cxTextEdit2.Text;
        StoredProc.ParamByName('D_TYPE_INVOICE').AsInteger  := 2;
        StoredProc.ExecProc;
        Transaction.Commit;
        T.Free;
        
        showmessage(Un_R_file_Alex.BANK_INVOICE_DONE);
        StButtonPrintInv.Enabled      := true;
        StButtonPrintReestr.Enabled   := true;
        StButtonPrintReestrEr.Enabled := true;

   except
        begin
          Transaction.Rollback;
          T.Free;
          Showmessage(Un_R_file_Alex.BANK_INVOICE_UNDONE);;
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.StButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.StButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.cxButton4Click(Sender: TObject);
var
    T : TfmBankProgressClose;
begin
    if (cxTextEdit3.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit3.SetFocus;
        exit;
    end;
   T := TfmBankProgressClose.Create(self, Un_R_file_Alex.WAIT_FORM_D);
   T.Show;
   T.Update;
   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_ST_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_RAS').AsInt64         := id_sp_ras;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64      := id_dt_day;
        StoredProc.ParamByName('D_NUMB_INVOICE').AsString  := cxTextEdit3.Text;
        StoredProc.ParamByName('D_TYPE_INVOICE').AsInteger  := 3;
        StoredProc.ExecProc;
        Transaction.Commit;
        T.Free;

        showmessage(Un_R_file_Alex.BANK_INVOICE_DONE);
        StKButtonPrintInv.Enabled      := true;
        StKButtonPrintReestr.Enabled   := true;
        StKButtonPrintReestrEr.Enabled := true;

   except
        begin
          Transaction.Rollback;
          T.Free;
          Showmessage(Un_R_file_Alex.BANK_INVOICE_UNDONE);
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.StKButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.StKButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmBankInvoice.StButtonPrintInvClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by num_doc';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;


    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\BankInvoice2011.fr3');

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    ReportPrintReestr.Variables['summa_all']     := QuotedStr(floattostr(sum_with_nds));


    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
    Transaction.StartTransaction;

   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_DT_INVOICES_UPD';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64           := id_dt_day;
        StoredProc.ParamByName('D_TYPE_INVOICE').AsInteger      := 2;
        StoredProc.ParamByName('D_ID_USER_PRINT').AsInt64       := myform.id_user;
        StoredProc.ParamByName('D_DATE_PRINT').AsDateTime       := now;

        StoredProc.ExecProc;
        Transaction.Commit;
        DataSet.CloseOpen(true);
        close;
   except
        begin
          Transaction.Rollback;
          Showmessage('При формуванні виникла помилка');
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.StKButtonPrintInvClick(Sender: TObject);
var
    type_invoice: integer;
    sum, nds, sum_with_nds : double;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELEC_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+') order by num_doc';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    nds          := RoundTo(((sum_with_nds)*20/(100+20)), -2);
    sum          := sum_with_nds-nds;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\BankInvoiceNDS2011.fr3');

    ReportPrintReestr.Variables['summa_all']     := QuotedStr(floattostr(sum_with_nds));
    ReportPrintReestr.Variables['sum_out_nds']     := QuotedStr(floattostr(sum));
    ReportPrintReestr.Variables['nds']             := QuotedStr(floattostr(nds));

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);

   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'BANK_DT_INVOICES_UPD';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_DT_DAY').AsInt64           := id_dt_day;
        StoredProc.ParamByName('D_TYPE_INVOICE').AsInteger      := 3;
        StoredProc.ParamByName('D_ID_USER_PRINT').AsInt64       := myform.id_user;
        StoredProc.ParamByName('D_DATE_PRINT').AsDateTime       := now;

        StoredProc.ExecProc;
        Transaction.Commit;
        DataSet.CloseOpen(true);
        close;
   except
        begin
          Transaction.Rollback;
          Showmessage('При формуванні виникла помилка');
          exit;
        end;
  end;
end;

procedure TfmBankInvoice.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
{   if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0);  }
end;

end.
