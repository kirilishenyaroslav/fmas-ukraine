unit PrintBankJo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, pFIBDataSet, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxLabel, BankMainForm, Un_R_file_Alex, cxSpinEdit, frxClass, frxDBSet, frxCross,
  frxExportXLS, frxExportXML, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmPrintBankJo = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DataSetSch: TpFIBDataSet;
    cxComboBoxSch: TcxComboBox;
    pFIBDataSet1: TpFIBDataSet;
    cxComboBoxMonth: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBoxShow: TcxCheckBox;
    pFIBDataSet2: TpFIBDataSet;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBoxEdit: TCheckBox;
    cxLabel3: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    pFIBDataSet1COL1: TFIBStringField;
    pFIBDataSet1COL2: TFIBStringField;
    pFIBDataSet1COL3: TFIBStringField;
    pFIBDataSet1COL4: TFIBStringField;
    pFIBDataSet1COL5: TFIBStringField;
    pFIBDataSet1COL6: TFIBStringField;
    pFIBDataSet1COL7: TFIBStringField;
    pFIBDataSet1COL8: TFIBStringField;
    pFIBDataSet1COL_3_SUM: TFIBBCDField;
    pFIBDataSet1COL_4_SUM: TFIBBCDField;
    pFIBDataSet1COL_5_SUM: TFIBBCDField;
    pFIBDataSet1COL_6_SUM: TFIBBCDField;
    pFIBDataSet1COL_7_SUM: TFIBBCDField;
    pFIBDataSet1COL_8_SUM: TFIBBCDField;
    pFIBDataSet1SALDO_BEGIN: TFIBBCDField;
    pFIBDataSet1SALDO_END: TFIBBCDField;
    pFIBDataSet1OBOROT_KREDIT: TFIBBCDField;
    DataSetVedom_3_15: TpFIBDataSet;
    DBDatasetved: TfrxDBDataset;
    DBDatasetJo: TfrxDBDataset;
    DataSetJo: TpFIBDataSet;
    pFIBDataSet2TITLE_SCH: TFIBStringField;
    pFIBDataSet2NUMBER_SCH: TFIBStringField;
    pFIBDataSet2SUMMA: TFIBBCDField;
    pFIBDataSet2ALL_SUM: TFIBBCDField;
    pFIBDataSet2SALDO_END: TFIBBCDField;
    pFIBDataSet2SALDO_BEGIN: TFIBBCDField;
    pFIBDataSet2OBOROT: TFIBBCDField;
    pFIBDataSet2NAME_PREDPR: TFIBStringField;
    DBDatasetRas: TfrxDBDataset;
    DBDatasetKr: TfrxDBDataset;
    DataSetKr: TpFIBDataSet;
    DataSetKrTITLE_SCH: TFIBStringField;
    DataSetKrNUMBER_SCH: TFIBStringField;
    DataSetKrSUMMA: TFIBBCDField;
    DataSetKrSALDO_END: TFIBBCDField;
    DataSetKrALL_SUM: TFIBBCDField;
    DataSetKrSALDO_BEGIN: TFIBBCDField;
    DataSetKrOBOROT: TFIBBCDField;
    DataSetKrNAME_PREDPR: TFIBStringField;
    DataSetLang: TpFIBDataSet;
    cxCheckBox5: TcxCheckBox;
    frxReport3: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Bevel3: TBevel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    frxXLSExport1: TfrxXLSExport;
    frxReport2: TfrxReport;
    frxReport1: TfrxReport;
    frxReport4: TfrxReport;
    frxReport5: TfrxReport;
    cxCheckBox8: TcxCheckBox;
    pFIBStoredProc1: TpFIBStoredProc;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxTextEditYearKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditYearClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxComboBoxSchClick(Sender: TObject);
  private
    myform : TfmBankMainForm;
    date_begin_inst, date_sch : TDate;
    IndKassa : array [1..7]  of array of Variant;
  public
    constructor Create(mform : TfmBankMainForm{; m : TPrint}); reintroduce; overload;
  end;

implementation

uses DateUtils, Un_Progress_form, GlobalSPR;

{$R *.dfm}

constructor TfmPrintBankJo.Create(mform: TfmBankMainForm);
var day_end :TDate;
begin
    inherited Create(nil);
    myform := mform;


    cxButtonPrint.Caption  := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption  := Un_R_file_Alex.n_AUTOKOD_FORM_CANCLE;

    Caption                                  := Un_R_file_Alex.KASSA_PRINT_CAPTION_MONTH;
    cxCheckBoxShow.Properties.Caption        := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
    cxLabel3.Caption                         := Un_R_file_Alex.BANK_PRINT_SCH_BALL;
    cxLabel1.Caption                         := Un_R_file_Alex.KASSA_PRINT_SELMONTH;
    cxLabel2.Caption                         := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxCheckBox1.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_J1;
    cxCheckBox2.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_V1;
    cxCheckBox3.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_R_D;
    cxCheckBox4.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_R_K;
    cxCheckBox5.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_MEMORIAL_ORDER;
    cxCheckBox6.Properties.Caption           := Un_R_file_Alex.BANK_EXPORT_EXCEL;
    cxCheckBox7.Properties.Caption           := Un_R_file_Alex.BANK_EXPORT_EXCEL;
    
    DataSetSch.Database    := myform.Database;
    DataSetJo.Database     := myform.Database;
    DataSetLang.Database   := myform.Database;
    date_sch               := date;

    day_end := IncMonth(date_sch,1);
    day_end := IncDay(day_end,-1);

    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    DataSetSch.Open;
    date_begin_inst := DataSetSch.FieldByName('BANK_INSTALL_SYSTEM').AsDateTime;
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+DateToStr(date_sch)+''','''+dateToStr(day_end)+''') order by SCH_NUM';
    DataSetSch.Open;
    DataSetSch.FetchAll;

    SetLength(IndKassa[1], DataSetSch.RecordCount);
    SetLength(IndKassa[2], DataSetSch.RecordCount);
    SetLength(IndKassa[3], DataSetSch.RecordCount);
    SetLength(IndKassa[4], DataSetSch.RecordCount);
    SetLength(IndKassa[5], DataSetSch.RecordCount);
    SetLength(IndKassa[6], DataSetSch.RecordCount);
    SetLength(IndKassa[7], DataSetSch.RecordCount);
    DataSetSch.First;

    cxComboBoxSch.Properties.Items.Clear;
    while not DataSetSch.Eof do
    begin
        IndKassa[1, DataSetSch.RecNo - 1] := DataSetSch['ID_SCH'];
        IndKassa[2, DataSetSch.RecNo - 1] := DataSetSch['SCH_NUM'];
        IndKassa[3, DataSetSch.RecNo - 1] := DataSetSch['SCH_TITLE'];
        IndKassa[4, DataSetSch.RecNo - 1] := DataSetSch['ID_RAS'];
        IndKassa[5, DataSetSch.RecNo - 1] := DataSetSch['RAS_NUM'];
        IndKassa[6, DataSetSch.RecNo - 1] := DataSetSch['MFO'];
        IndKassa[7, DataSetSch.RecNo - 1] := DataSetSch['REG_TITLE'];
        cxComboBoxSch.Properties.Items.Insert(DataSetSch.RecNo - 1, DataSetSch['SCH_NUM']);
        DataSetSch.Next;
    end;

    cxComboBoxSch.ItemIndex := 0;
    cxComboBoxMonth.ItemIndex := monthOf(date)-1;
    cxSpinEditYear.Value := YearOf(date);

    cxComboBoxMonth.Enabled     := true;
    cxSpinEditYear.Enabled      := true;

    cxComboBoxSch.Enabled       := false;
    cxCheckBox1.Enabled         := false;
    cxCheckBox2.Enabled         := false;
    cxCheckBox3.Enabled         := false;
    cxCheckBox4.Enabled         := false;
    cxCheckBox5.Enabled         := false;
    cxCheckBox8.Enabled         := false;
    cxCheckBox8.Checked         := false;
    cxCheckBoxShow.Enabled      := false;
    cxButton1.Enabled           := true;
    cxButton2.Enabled           := false;
    cxCheckBox6.Enabled         := false;
    cxCheckBox7.Enabled         := false;
end;

procedure TfmPrintBankJo.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmPrintBankJo.cxButtonPrintClick(Sender: TObject);
var
    day_begin : string; day_end : Tdate;
    T : TfmUn_Progress_form;
    i, id_lang : integer;
begin
    DataSetLang.Close;
    DataSetLang.Sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
    DataSetLang.Open;
    id_lang  := DataSetLang.FieldByName('ID_LANGUAGE').AsInteger;
    DataSetLang.Close;
    if cxCheckBox1.Checked then
    begin
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
//        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
{        pFibDataSet1.Close;
        pFibDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_REPORT(' +  QuotedStr(day_begin) + ','
                                                                         +  QuotedStr(DateToStr(day_end)) + ','
                                                                         +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ','
                                                                         +  IntToStr(IndKassa[4, cxComboBoxSch.ItemIndex]) + ')';
//        pFibDataSet1.ParamByName('').AsDate  := day_begin;
//        pFibDataSet1.ParamByName('').AsDate  := day_end;
//        pFibDataSet1.ParamByName('').AsInt64 := IndKassa[cxComboBoxSch.ItemIndex];
        pFibDataSet1.Open;
        pFibDataSet1.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['name_sch']   := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_jo_1_good.frf');
        frReport1.PrepareReport;

        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frReport1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                               1,
                                               true,
                                               frAll)
            end
            else frReport1.ShowReport
        end else

        frReport1.DesignReport;
 }
        day_end := IncDay(day_end,-1);
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.Repaint;
//    T.update;
        DataSetJo.Close;
        DataSetJo.SQLs.SelectSQL.Text := 'select * from BANK_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                           +  QuotedStr(DateToStr(day_end)) + ','
                                                                           +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetJo.Open;
    T.Free;
        DataSetJo.fetchAll;
        if id_lang = 1 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2001.fr3');
        if id_lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2001_ukr.fr3');
        frxReport2.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport2.Variables['date_end']   := QuotedStr(dateTostr(day_end));
//        frxReport2.Variables['name_sch']   := cxComboBoxSch.Text;
        frxReport2.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport2.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));

        i := cxComboBoxSch.ItemIndex;
        frxReport2.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport2.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport2.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));

        frxReport2.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReport2.Print;
            end
            else frxReport2.ShowReport(true);
        end else
        frxReport2.DesignReport;
    end;

    if cxCheckBox2.Checked then
    begin
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
//        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
{        pFibDataSet1.Close;
        pFibDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_VEDOMOST(' +  QuotedStr(day_begin) + ','
                                                                            +  QuotedStr(DateToStr(day_end)) + ','
                                                                            + IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ','
                                                                            + IntToStr(IndKassa[4, cxComboBoxSch.ItemIndex]) + ')';
        pFibDataSet1.Open;
        pFibDataSet1.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['number_sch'] := cxComboBoxSch.Text;

        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_vedom_1_good.frf');
        frReport1.PrepareReport;
//        if not cxCheckBoxEdit.Checked then
//        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frReport1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                               1,
                                               true,
                                               frAll)
            end
            else frReport1.ShowReport
//        end else

//        frReport1.DesignReport;
}
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.Repaint;
        day_end := IncDay(day_end,-1);
        DataSetVedom_3_15.Close;
        DataSetVedom_3_15.SQLs.SelectSQL.Text := 'select * from BANK_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                     +  QuotedStr(DateToStr(day_end)) + ','
                                                                                     +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetVedom_3_15.Open;
    T.Free;
        if id_lang = 1 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2002.fr3');
        if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2002_ukr.fr3');
        frxReport1.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport1.Variables['date_end']   := QuotedStr(DateToStr(IncDay(IncMonth(StrToDate(Day_begin), 1), -1)));
        frxReport1.Variables['name_sch']   := cxComboBoxSch.Text;
        frxReport1.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        i := cxComboBoxSch.ItemIndex;
        frxReport1.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport1.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport1.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport1.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frxReport1.Print;
            end
            else frxReport1.ShowReport(true);
        end else
        frxReport1.DesignReport;
    end;

    if cxCheckBox3.Checked then
    begin
      T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
      T.Show;
      T.Repaint;

        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
//        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        pFibDataSet2.Close;
        pFibDataSet2.SQLs.SelectSQL.Text := 'select * from BANK_RAS_DEBET_SCH(' + QuotedStr(day_begin) + ','
                                                                                + QuotedStr(DateToStr(day_end)) + ','
                                                                                + IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ','
                                                                                + IntToStr(IndKassa[4, cxComboBoxSch.ItemIndex]) + ')';
        pFibDataSet2.Open;
        pFibDataSet2.FetchAll;
      T.Free;
{        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['sch']   := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\BankRasDebet.frf');
        frReport1.PrepareReport;
        if not cxCheckBoxShow.Checked then
        begin
            frReport1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                          1,
                                          true,
                                          frAll)
        end
            else frReport1.ShowReport}
        if id_lang = 1 then frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2004.fr3');
        if id_lang = 0 then frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2004_ukr.fr3');
        frxReport3.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport3.Variables['date_end']   := QuotedStr(DateToStr(IncDay(IncMonth(StrToDate(Day_begin), 1), -1)));
        frxReport3.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport3.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        i := cxComboBoxSch.ItemIndex;
        frxReport3.Variables['SCH']        := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport3.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frxReport3.Print;
            end
            else frxReport3.ShowReport(true);
        end else
        frxReport3.DesignReport;
    end;

    if cxCheckBox4.Checked then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;

        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
//        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        DataSetKr.Close;
        DataSetKr.SQLs.SelectSQL.Text := 'select * from BANK_RAS_KREDIT_SCH(' + QuotedStr(day_begin) + ','
                                                                                 + QuotedStr(DateToStr(day_end)) + ','
                                                                                 + IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ','
                                                                                 + IntToStr(IndKassa[4, cxComboBoxSch.ItemIndex]) + ')';
        DataSetKr.Open;
        DataSetKr.FetchAll;
        T.Free;
{        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['sch']   := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\BankRasKredit.frf');
        frReport1.PrepareReport;
            if not cxCheckBoxShow.Checked then
            begin
                 frReport1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                               1,
                                               true,
                                               frAll)
            end
            else frReport1.ShowReport
}
        if id_lang = 1 then frxReport4.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2005.fr3');
        if id_lang = 0 then frxReport4.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2005_ukr.fr3');
        frxReport4.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport4.Variables['date_end']   := QuotedStr(DateToStr(IncDay(IncMonth(StrToDate(Day_begin), 1), -1)));
        frxReport4.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport4.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        i := cxComboBoxSch.ItemIndex;
        frxReport4.Variables['SCH']        := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport4.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frxReport4.Print;
            end
            else frxReport4.ShowReport(true);
        end else
        //frxReport4.DesignReport;
    end;

    if cxCheckBox5.Checked then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;

        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        DataSetJo.Close;
        DataSetJo.SQLs.SelectSQL.Text := 'select * from BANK_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                           +  QuotedStr(DateToStr(day_end)) + ','
                                                                           +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetJo.Open;


        day_end := IncDay(day_end,-1);
        DataSetVedom_3_15.Close;
        DataSetVedom_3_15.SQLs.SelectSQL.Text := 'select * from BANK_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                     +  QuotedStr(DateToStr(day_end)) + ','
                                                                                     +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetVedom_3_15.Open;

        DataSetLang.Close;
        DataSetLang.Sqls.SelectSql.Text := 'select PUB_SP_CUSTOMER.KOD_EDRPOU from PUB_SYS_DATA, PUB_SP_CUSTOMER where PUB_SP_CUSTOMER.ID_CUSTOMER=PUB_SYS_DATA.ORGANIZATION';
        DataSetLang.Open;


        T.Free;

        if id_lang = 1 then frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20011.fr3');
        if id_lang = 0 then frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20011_ukr.fr3');

        i := cxComboBoxSch.ItemIndex;

        frxReport5.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport5.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        frxReport5.Variables['kod_okpo']   := QuotedStr(DataSetLang.FieldByName('KOD_EDRPOU').AsString);
        frxReport5.Variables['name_sch']   := Quotedstr(VarToStr(IndKassa[3, i]));
        frxReport5.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport5.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport5.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport5.Variables['mon_year']   := Quotedstr(cxComboBoxMonth.Text + ' ' + cxSpinEditYear.Text);
        frxReport5.Variables['reg_title']  := Quotedstr(VarToStr(IndKassa[7, i]));

        //frxReport5.DesignReport;
        frxReport5.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReport5.Print;
            end
            else frxReport5.ShowReport(true);
        end else
        //frxReport5.DesignReport;
    end;

    if cxCheckBox6.Checked then
    begin
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;

        day_end := IncDay(day_end,-1);
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.Repaint;

        DataSetJo.Close;
        DataSetJo.SQLs.SelectSQL.Text := 'select * from BANK_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                           +  QuotedStr(DateToStr(day_end)) + ','
                                                                           +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetJo.Open;
    T.Free;
        DataSetJo.fetchAll;

        if id_lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2001_ukr_excel.fr3');
        frxReport2.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport2.Variables['date_end']   := QuotedStr(dateTostr(day_end));
        frxReport2.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport2.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));

        i := cxComboBoxSch.ItemIndex;
        frxReport2.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport2.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport2.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport2.Variables['temp']       := '1';

        frxReport2.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReport2.Print;
            end
            else frxReport2.ShowReport(true);
        end else
        //frxReport2.DesignReport;
    end;

    if cxCheckBox7.Checked then
    begin
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);

        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;

        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;
        day_end := IncDay(day_end,-1);
        DataSetVedom_3_15.Close;
        DataSetVedom_3_15.SQLs.SelectSQL.Text := 'select * from BANK_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                     +  QuotedStr(DateToStr(day_end)) + ','
                                                                                     +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetVedom_3_15.Open;
        T.Free;
        if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2002_ukr_excel.fr3');
        frxReport1.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport1.Variables['date_end']   := QuotedStr(DateToStr(IncDay(IncMonth(StrToDate(Day_begin), 1), -1)));
        frxReport1.Variables['name_sch']   := cxComboBoxSch.Text;
        frxReport1.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        i := cxComboBoxSch.ItemIndex;
        frxReport1.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport1.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport1.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport1.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                 frxReport1.Print;
            end
            else frxReport1.ShowReport(true);
        end else
        //frxReport1.DesignReport;
    end;
//-------------------------валюта-----------------------------------------------//
    if cxCheckBox8.Checked then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;

        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        DataSetJo.Close;
        DataSetJo.SQLs.SelectSQL.Text := 'select * from BANK_REPORT_3_15_VALUTA(' +  QuotedStr(day_begin) + ','
                                                                           +  QuotedStr(DateToStr(day_end)) + ','
                                                                           +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetJo.Open;


        day_end := IncDay(day_end,-1);
        DataSetVedom_3_15.Close;
        DataSetVedom_3_15.SQLs.SelectSQL.Text := 'select * from BANK_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                     +  QuotedStr(DateToStr(day_end)) + ','
                                                                                     +  IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]) + ')';
        DataSetVedom_3_15.Open;

        DataSetLang.Close;
        DataSetLang.Sqls.SelectSql.Text := 'select PUB_SP_CUSTOMER.KOD_EDRPOU from PUB_SYS_DATA, PUB_SP_CUSTOMER where PUB_SP_CUSTOMER.ID_CUSTOMER=PUB_SYS_DATA.ORGANIZATION';
        DataSetLang.Open;


        T.Free;

        if id_lang = 1 then frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_MO_Valuta.fr3');
        if id_lang = 0 then frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_MO_Valuta.fr3');

        i := cxComboBoxSch.ItemIndex;

        frxReport5.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport5.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        frxReport5.Variables['kod_okpo']   := QuotedStr(DataSetLang.FieldByName('KOD_EDRPOU').AsString);
        frxReport5.Variables['name_sch']   := Quotedstr(VarToStr(IndKassa[3, i]));
        frxReport5.Variables['mfo']        := Quotedstr(VarToStr(IndKassa[6, i]));
        frxReport5.Variables['ras_num']    := Quotedstr(VarToStr(IndKassa[5, i]));
        frxReport5.Variables['sch_num']    := Quotedstr(VarToStr(IndKassa[2, i]));
        frxReport5.Variables['mon_year']   := Quotedstr(cxComboBoxMonth.Text + ' ' + cxSpinEditYear.Text);
        frxReport5.Variables['reg_title']  := Quotedstr(VarToStr(IndKassa[7, i]));

        //frxReport5.DesignReport;
        frxReport5.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReport5.Print;
            end
            else frxReport5.ShowReport;
        end else
        //frxReport5.DesignReport;
    end;
//------------------------------------------------------------------------------//

end;

procedure TfmPrintBankJo.cxTextEditYearKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key < '0') or (key < '0') then key := chr(0);
end;

procedure TfmPrintBankJo.cxSpinEditYearClick(Sender: TObject);
begin
    cxSpinEditYear.Value := cxSpinEditYear.Text;
end;

procedure TfmPrintBankJo.cxButton1Click(Sender: TObject);
var
    id : int64;
    lll : integer;
    day_begin_str : string;
    day_end, day_begin : TDate;
begin
    try id := IndKassa[1, cxComboBoxSch.ItemIndex]; except id := -1; end;


    if cxComboBoxMonth.ItemIndex < 9
        then day_begin_str := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
        else day_begin_str := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
    day_begin := strtodate(day_begin_str);
    day_end := IncMonth(day_begin,1);
    day_end := IncDay(day_end,-1);

    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+DateToStr(day_begin)+''','''+dateToStr(day_end)+''')  order by SCH_NUM';
    DataSetSch.Open;
    DataSetSch.FetchAll;

    SetLength(IndKassa[1], DataSetSch.RecordCount);
    SetLength(IndKassa[2], DataSetSch.RecordCount);
    SetLength(IndKassa[3], DataSetSch.RecordCount);
    SetLength(IndKassa[4], DataSetSch.RecordCount);
    SetLength(IndKassa[5], DataSetSch.RecordCount);
    SetLength(IndKassa[6], DataSetSch.RecordCount);
    SetLength(IndKassa[7], DataSetSch.RecordCount);
    DataSetSch.First;
    lll := 0;
    cxComboBoxSch.Properties.Items.Clear;
    while not DataSetSch.Eof do
    begin
        IndKassa[1, DataSetSch.RecNo - 1] := DataSetSch['ID_SCH'];
        IndKassa[2, DataSetSch.RecNo - 1] := DataSetSch['SCH_NUM'];
        IndKassa[3, DataSetSch.RecNo - 1] := DataSetSch['SCH_TITLE'];
        IndKassa[4, DataSetSch.RecNo - 1] := DataSetSch['ID_RAS'];
        IndKassa[5, DataSetSch.RecNo - 1] := DataSetSch['RAS_NUM'];
        IndKassa[6, DataSetSch.RecNo - 1] := DataSetSch['MFO'];
        IndKassa[7, DataSetSch.RecNo - 1] := DataSetSch['REG_TITLE'];
        cxComboBoxSch.Properties.Items.Insert(DataSetSch.RecNo - 1, DataSetSch['SCH_NUM']+' - '+DataSetSch['SCH_TITLE']);
        if id = DataSetSch['ID_SCH'] then begin lll := DataSetSch.RecNo - 1;  end;
        DataSetSch.Next;
    end;

    try cxComboBoxSch.ItemIndex := lll except cxComboBoxSch.ItemIndex := 0; end;

    cxComboBoxMonth.Enabled     := false;
    cxSpinEditYear.Enabled      := false;
    cxButton1.Enabled           := false;

    cxComboBoxSch.Enabled       := true;
    cxCheckBox1.Enabled         := true;
    cxCheckBox2.Enabled         := true;
    cxCheckBox3.Enabled         := true;
    cxCheckBox4.Enabled         := true;
    cxCheckBox5.Enabled         := true;
    cxCheckBoxShow.Enabled      := true;
    cxCheckBox6.Enabled         := true;
    cxCheckBox7.Enabled         := true;

//    cxComboBoxMonth.ItemIndex := monthOf(date)-1;
//    cxSpinEditYear.Value := YearOf(date);
    cxButton2.Enabled           := true;
    fmBankMainForm.pFIBTransaction1.StartTransaction;
    pFIBStoredProc1.StoredProcName := 'BANK_BAL_SCH_VALUTE_PROVERKA';
    pFIBStoredProc1.ParamByName('ID_SCH').AsInt64 := IndKassa[1, cxComboBoxSch.ItemIndex];
    pFIBStoredProc1.ExecProc;
    fmBankMainForm.pFIBTransaction1.Commit;

    if (pFIBStoredProc1.ParamByName('OUT').AsInteger = 1)then
    begin
      cxCheckBox8.Enabled := True;
    end
    else
    begin
      cxCheckBox8.Enabled := False;
      cxCheckBox8.Checked := false;
    end;
end;

procedure TfmPrintBankJo.cxButton2Click(Sender: TObject);
begin

    cxComboBoxMonth.Enabled     := true;
    cxSpinEditYear.Enabled      := true;
    cxButton1.Enabled           := true;

    cxComboBoxSch.Enabled       := false;
    cxCheckBox1.Enabled         := false;
    cxCheckBox2.Enabled         := false;
    cxCheckBox3.Enabled         := false;
    cxCheckBox4.Enabled         := false;
    cxCheckBox5.Enabled         := false;
    cxCheckBox8.Enabled         := false;
    cxCheckBox8.Checked         := false;
    cxCheckBoxShow.Enabled      := false;
    cxButton2.Enabled           := false;
    cxCheckBox6.Enabled         := false;
    cxCheckBox7.Enabled         := false;
end;

procedure TfmPrintBankJo.cxComboBoxSchClick(Sender: TObject);
begin
  //ShowMessage(IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]));
  fmBankMainForm.pFIBTransaction1.StartTransaction;
  pFIBStoredProc1.StoredProcName := 'BANK_BAL_SCH_VALUTE_PROVERKA';
  pFIBStoredProc1.ParamByName('ID_SCH').AsInt64 := IndKassa[1, cxComboBoxSch.ItemIndex];
  pFIBStoredProc1.ExecProc;
  fmBankMainForm.pFIBTransaction1.Commit;

  if (pFIBStoredProc1.ParamByName('OUT').AsInteger = 1)then
  begin
    cxCheckBox8.Enabled := True;
  end
  else
  begin
    cxCheckBox8.Enabled := False;
    cxCheckBox8.Checked := false;
  end;

end;

end.
