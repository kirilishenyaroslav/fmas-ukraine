unit KassaInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, frxClass, frxDBSet, DB, FIBDataSet,
  FIBDatabase, pFIBDatabase, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxClasses, cxStyles, cxGridTableView, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, KassaDayForm;

type
  TfmKassaInvoice = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxButton1: TcxButton;
    cnButtonPrintInv: TcxButton;
    cnButtonPrintReestr: TcxButton;
    cnButtonPrintReestrEr: TcxButton;
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
    cxButton2: TcxButton;
    StButtonPrintInv: TcxButton;
    StButtonPrintReestr: TcxButton;
    StButtonPrintReestrEr: TcxButton;
    StKButtonPrintInv: TcxButton;
    cxButton4: TcxButton;
    StKButtonPrintReestr: TcxButton;
    StKButtonPrintReestrEr: TcxButton;
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
    StoredProc: TpFIBStoredProc;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
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
    DataSetPrintFIO_DOC: TFIBStringField;
    ReportPrintReestr: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cnButtonPrintInvClick(Sender: TObject);
    procedure cnButtonPrintReestrClick(Sender: TObject);
    procedure cnButtonPrintReestrErClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure StButtonPrintInvClick(Sender: TObject);
    procedure StButtonPrintReestrClick(Sender: TObject);
    procedure StButtonPrintReestrErClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure StKButtonPrintInvClick(Sender: TObject);
    procedure StKButtonPrintReestrClick(Sender: TObject);
    procedure StKButtonPrintReestrErClick(Sender: TObject);
  private
    { Private declarations }
  public
      id_dt_day, id_sp_kas : int64;
    myform : TfmKassaDayForm;
    constructor Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmKassaDayForm);
  end;

{fmKassaInvoice: TfmKassaInvoice;}

implementation
uses  Un_R_file_Alex,Un_Progress_form,Math;

{$R *.dfm}

constructor TfmKassaInvoice.Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmKassaDayForm);
var
   i, j : int64;

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

    id_dt_day      := myform.DataSetDay['ID_DT_DAY'];
    id_sp_kas      := myform.DataSetDay['ID_SP_KASS'];

    DataSet.Close;
    Dataset.SQLs.SelectSQL.Text :='select * from KASSA_INVOICE_SELECT('+IntTostr(id_dt_day)+', '+IntToStr(id_sp_kas)+')';
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

procedure TfmKassaInvoice.cxButton1Click(Sender: TObject);
var
    T : TfmUn_Progress_form;
begin
    if (cxTextEdit1.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit1.SetFocus;
        exit;
    end;
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_FORM_D);
    T.show;
    T.Repaint;
   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_CN_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_SP_KASS').AsInt64     := id_sp_kas;
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

procedure TfmKassaInvoice.cnButtonPrintInvClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaInvoice2011.fr3');

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    ReportPrintReestr.Variables['summa_all']         := QuotedStr(floattostr(sum_with_nds));


    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
    Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_DT_INVOICES_UPD';

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

procedure TfmKassaInvoice.cnButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmKassaInvoice.cnButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=1;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);

end;

procedure TfmKassaInvoice.cxButton2Click(Sender: TObject);
var
    T : TfmUn_Progress_form;
begin
    if (cxTextEdit2.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit2.SetFocus;
        exit;
    end;
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_FORM_D);
    T.show;
    T.Repaint;

   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_ST_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_SP_KASS').AsInt64     := id_sp_kas;
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
          Showmessage(Un_R_file_Alex.BANK_INVOICE_UNDONE);
          exit;
        end;
  end;
end;

procedure TfmKassaInvoice.StButtonPrintInvClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaInvoice2011.fr3');

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    ReportPrintReestr.Variables['summa_all']         := QuotedStr(floattostr(sum_with_nds));


    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
    Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_DT_INVOICES_UPD';

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

procedure TfmKassaInvoice.StButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmKassaInvoice.StButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : integer;
    sum_with_nds : double;
begin
    type_invoice :=2;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);

end;

procedure TfmKassaInvoice.cxButton4Click(Sender: TObject);
var
    T : TfmUn_Progress_form;
begin
    if (cxTextEdit3.Text='') then
    begin
        Showmessage(Un_R_file_Alex.BANK_INVOICE_NO_NUMB);
        cxTextEdit3.SetFocus;
        exit;
    end;
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_FORM_D);
    T.show;
    T.Repaint;

   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_ST_FORM_DOC_INVOICE';

        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_SP_KASS').AsInt64     := id_sp_kas;
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

procedure TfmKassaInvoice.StKButtonPrintInvClick(Sender: TObject);
var
    type_invoice: integer;
    sum, nds, sum_with_nds : double;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    sum_with_nds := DataSetPrint.FieldByName('sum_all').AsFloat;
    nds          := RoundTo(((sum_with_nds)*20/(100+20)), -2);
    sum          := sum_with_nds-nds;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaInvoiceNDS2011.fr3');

    ReportPrintReestr.Variables['summa_all']     := QuotedStr(floattostr(sum_with_nds));
    ReportPrintReestr.Variables['sum_out_nds']     := QuotedStr(floattostr(sum));
    ReportPrintReestr.Variables['nds']             := QuotedStr(floattostr(nds));

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);

   Transaction.StartTransaction;
   try
        StoredProc.StoredProcName := 'KASSA_DT_INVOICES_UPD';

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

procedure TfmKassaInvoice.StKButtonPrintReestrClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(0)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

procedure TfmKassaInvoice.StKButtonPrintReestrErClick(Sender: TObject);
var
    type_invoice : smallint;
begin
    type_invoice :=3;
    DataSetPrint.Close;
    DataSetPrint.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_REESTR_INVOICE('+IntTostr(1)+', '+IntToStr(id_dt_day)+', '+IntToStr(type_invoice)+', '+IntToStr(myform.id_user)+', '+IntToStr(id_sp_kas)+') order by summa';
    DataSetPrint.Open;
    DataSetPrint.FetchAll;

    ReportPrintReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_reestr_doc_invoices_er.fr3');

    ReportPrintReestr.PrepareReport(true);
    ReportPrintReestr.ShowReport(true);
end;

end.
