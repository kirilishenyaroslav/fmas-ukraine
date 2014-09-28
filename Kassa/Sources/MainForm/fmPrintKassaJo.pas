unit fmPrintKassaJo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, pFIBDataSet, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxLabel, MainFormKassa, Un_R_file_Alex, cxSpinEdit, frxClass, frxDBSet,
  frxCross;

type
  TPrintKassaJo = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxCheckBox1: TcxCheckBox;
    DataSetSch: TpFIBDataSet;
    cxComboBoxSch: TcxComboBox;
    frReport1: TfrReport;
    frDBDataSet3: TfrDBDataSet;
    pFIBDataSet1: TpFIBDataSet;
    cxComboBoxMonth: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBoxShow: TcxCheckBox;
    pFIBDataSet2: TpFIBDataSet;
    frReport2: TfrReport;
    frDBDataSet1: TfrDBDataSet;
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
    frxDBDataset1: TfrxDBDataset;
    DataSetFRX_Report: TpFIBDataSet;
    DataSetFRX_ReportSALDO_BEGIN: TFIBBCDField;
    DataSetFRX_ReportSALDO_END: TFIBBCDField;
    DataSetFRX_ReportFLAG_SPRAVKA: TFIBIntegerField;
    DataSetFRX_ReportNAME_DATE: TFIBStringField;
    DataSetFRX_ReportSCH_KOD: TFIBStringField;
    DataSetFRX_ReportSUMMA_COLUMN: TFIBBCDField;
    DataSetFRX_ReportNAME_PREDPR: TFIBStringField;
    pFIBDataSetVedomost: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    pFIBDataSetVedomostSALDO_BEGIN: TFIBBCDField;
    pFIBDataSetVedomostSALDO_END: TFIBBCDField;
    pFIBDataSetVedomostFLAG_SPRAVKA: TFIBIntegerField;
    pFIBDataSetVedomostNAME_DATE: TFIBStringField;
    pFIBDataSetVedomostSCH_KOD: TFIBStringField;
    pFIBDataSetVedomostSUMMA_COLUMN: TFIBBCDField;
    pFIBDataSetVedomostNAME_PREDPR: TFIBStringField;
    pFIBDataSetVedomostDATE_DOC: TFIBDateField;
    pFIBDataSetVedomostOBOROT: TFIBBCDField;
    pFIBDataSetVedomostSUMMA_ALL: TFIBBCDField;
    pFIBDataSetVedomostNAME_SCH: TFIBStringField;
    DataSetFRX_ReportDATE_DOC: TFIBDateField;
    DataSetFRX_ReportOPER: TFIBBCDField;
    DataSetFRX_ReportNAME_SCH: TFIBStringField;
    cxCheckBox5: TcxCheckBox;
    DataSetSysData: TpFIBDataSet;
    frxReport1: TfrxReport;
    pFIBDataSetVedomostSUMMA_ALL_MO: TFIBBCDField;
    pFIBDataSetVedomostOBOROT_MO: TFIBBCDField;
    frxReport2: TfrxReport;
    cxCheckBoxRasMO: TcxCheckBox;
    pFIBDataSet2TITLE_SCH: TFIBStringField;
    pFIBDataSet2NUMBER_SCH: TFIBStringField;
    pFIBDataSet2SUMMA: TFIBBCDField;
    pFIBDataSet2SALDO_END: TFIBBCDField;
    pFIBDataSet2ALL_SUM: TFIBBCDField;
    pFIBDataSet2SALDO_BEGIN: TFIBBCDField;
    pFIBDataSet2OBOROT: TFIBBCDField;
    pFIBDataSet2NAME_PREDPR: TFIBStringField;
    pFIBDataSet2ID_SP_KASS: TFIBBCDField;
    DataSetDebetKredit: TpFIBDataSet;
    DBDatasetDbKr: TfrxDBDataset;
    DataSetDbKrnotMO: TpFIBDataSet;
    DBDatasetDbKrNotMO: TfrxDBDataset;
    DataSetDebetKreditTITLE_SCH_D_MO: TFIBStringField;
    DataSetDebetKreditNUMBER_SCH_D_MO: TFIBStringField;
    DataSetDebetKreditTITLE_SCH_K_MO: TFIBStringField;
    DataSetDebetKreditNUMBER_SCH_K_MO: TFIBStringField;
    DataSetDebetKreditSUMMA_D_MO: TFIBBCDField;
    DataSetDebetKreditSUMMA_K_MO: TFIBBCDField;
    DataSetDebetKreditOBOROT_D: TFIBBCDField;
    DataSetDebetKreditOBOROT_K: TFIBBCDField;
    DataSetDebetKreditNAME_PREDPR: TFIBStringField;
    DataSetDebetKreditID_SP_KASS: TFIBBCDField;
    DataSetDebetKreditID_REG_UCH: TFIBIntegerField;
    DataSetDebetKreditREG_KOD: TFIBIntegerField;
    DataSetDebetKreditREG_TITLE: TFIBStringField;
    DataSetDebetKreditREG_SHORT_D: TFIBStringField;
    DataSetDebetKreditREG_SHORT_K: TFIBStringField;
    DataSetDebetKreditSALDO_BEGIN: TFIBBCDField;
    DataSetDebetKreditSALDO_END: TFIBBCDField;
    DataSetDbKrnotMOTITLE_SCH_D: TFIBStringField;
    DataSetDbKrnotMONUMBER_SCH_D: TFIBStringField;
    DataSetDbKrnotMOTITLE_SCH_K: TFIBStringField;
    DataSetDbKrnotMONUMBER_SCH_K: TFIBStringField;
    DataSetDbKrnotMOSUMMA_D: TFIBBCDField;
    DataSetDbKrnotMOSUMMA_K: TFIBBCDField;
    DataSetDbKrnotMOOBOROT_D: TFIBBCDField;
    DataSetDbKrnotMOOBOROT_K: TFIBBCDField;
    DataSetDbKrnotMONAME_PREDPR: TFIBStringField;
    DataSetDbKrnotMOID_SP_KASS: TFIBBCDField;
    DataSetDbKrnotMOID_REG_UCH: TFIBBCDField;
    DataSetDbKrnotMOREG_SHORT: TFIBStringField;
    DataSetDbKrnotMOREG_SHORT_KR: TFIBStringField;
    DataSetDbKrnotMOREG_SHORT_DB: TFIBStringField;
    DataSetDbKrnotMOSALDO_BEGIN: TFIBBCDField;
    DataSetDbKrnotMOSALDO_END: TFIBBCDField;
    ReportRasDbKr: TfrxReport;
    ReportMemOrder: TfrxReport;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxTextEditYearKeyPress(Sender: TObject; var Key: Char);
  private
    myform : TfmMainForm;
    date_begin_inst : TDate;
    id_kassa_l,id_user : int64;
    IndKassa : array of Int64;
  public
    constructor Create(mform : TfmMainForm{; m : TPrint}); reintroduce; overload;
  end;

implementation

uses DateUtils, GlobalSPR, ProgressFormKassa;

{$R *.dfm}

constructor TPrintKassaJo.Create(mform: TfmMainForm);
var
    i : integer;
begin
    inherited Create(nil);
    myform := mform;

    cxButtonPrint.Caption  := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption  := Un_R_file_Alex.n_AUTOKOD_FORM_CANCLE;

    Caption                                  := Un_R_file_Alex.KASSA_PRINT_CAPTION_MONTH;
    cxCheckBoxShow.Properties.Caption        := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
    cxLabel3.Caption                         := Un_R_file_Alex.KASSA_PRINT_SCH_BALL;
    cxLabel1.Caption                         := Un_R_file_Alex.KASSA_PRINT_SELMONTH;
    cxLabel2.Caption                         := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxCheckBox1.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_J1;
    cxCheckBox2.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_V1;
    cxCheckBox3.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_R_D;
    cxCheckBox4.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_R_K;
    cxCheckBox5.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_MEMORIAL_ORDER;

    DataSetSch.Database                     := myform.Database;
    pFibDataSet1.Database                   := myform.Database;
    DataSetFRX_Report.Database              := myform.Database; 
    pFIBDataSetVedomost.Database            := myform.Database;
    DataSetSysData.Database                    := myform.Database;

//    DataSetSch.Transaction.DefaultDatabase  := DataSetSch.Database;
//    DataSetSch.Transaction.StartTransaction;
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetSch.Open;
    date_begin_inst := DataSetSch.FieldByName('DATE_INSTALL_KASSA').AsDateTime;
    id_kassa_l      := DataSetSch['ID_KASSA_LOAD'];
    {DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(id_kassa_l)+')';
    DataSetSch.Open;
    DataSetSch.FetchAll;


    SetLength(IndKassa, DataSetSch.RecordCount);
    DataSetSch.First;

    cxComboBoxSch.Properties.Items.Clear;
    while not DataSetSch.Eof do
    begin
        IndKassa[DataSetSch.RecNo - 1] := DataSetSch['ID_SCH'];
        cxComboBoxSch.Properties.Items.Insert(DataSetSch.RecNo - 1, DataSetSch['SCH_NUM']);
        DataSetSch.Next;
    end;

    cxComboBoxSch.ItemIndex := 0;
}

    id_user := myform.id_user;

    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(id_user)+')';
    DataSetSch.Open;
    DataSetSch.FetchAll;
    SetLength(IndKassa, DataSetSch.RecordCount);
    DataSetSch.First;
    cxComboBoxSch.Properties.Items.Clear;
    while not DataSetSch.Eof do
    begin
        IndKassa[DataSetSch.RecNo - 1] := DataSetSch['ID_SCH'];
        cxComboBoxSch.Properties.Items.Insert(DataSetSch.RecNo - 1, DataSetSch['SCH_NUM']);
        DataSetSch.Next;
    end;

    cxComboBoxSch.ItemIndex := 0;


    cxComboBoxMonth.ItemIndex := monthOf(date)-1;
    cxSpinEditYear.Value := YearOf(date);
end;

procedure TPrintKassaJo.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TPrintKassaJo.cxButtonPrintClick(Sender: TObject);
var
    day_begin : string; day_end : Tdate;
    T : TfmProgressFormKassa;
    i : integer;
begin
    if cxCheckBox1.Checked then
    begin
{        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
//        day_end := IncDay(day_end,-1);
        pFibDataSet1.Close;
        pFibDataSet1.SQLs.SelectSQL.Text := 'select * from KASSA_REPORT(' +  QuotedStr(day_begin) + ','
                                                                          +  QuotedStr(DateToStr(day_end)) + ','
                                                                          +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
//        pFibDataSet1.ParamByName('').AsDate  := day_begin;
//        pFibDataSet1.ParamByName('').AsDate  := day_end;
//        pFibDataSet1.ParamByName('').AsInt64 := IndKassa[cxComboBoxSch.ItemIndex];
        pFibDataSet1.Open;
        pFibDataSet1.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['name_sch']   := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_jo_1_good.frf');
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


    T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        day_end := IncDay(day_end,-1);
        DataSetFRX_Report.Close;
        DataSetFRX_Report.SQLs.SelectSQL.Text := 'select * from KASSA_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                               +  QuotedStr(DateToStr(day_end)) + ','
                                                                               +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
        DataSetFRX_Report.Open;
    T.Free;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10003.fr3');
        frxReport1.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport1.Variables['date_end']   := QuotedStr(dateTostr(day_end));
        frxReport1.Variables['name_sch']   := cxComboBoxSch.Text;
        frxReport1.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        frxReport1.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
{                 frxReport1.PrintOptions.PrintPages := (IntTostr(1)+'-'+IntTostr(1000),
                                               1,
                                               true,
                                               frAll)}
                  frxReport1.Print;
            end
            else frxReport1.ShowReport(true);
        end else
        frxReport1.DesignReport;
    end;


    if cxCheckBox2.Checked then
    begin
{        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
//        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        pFibDataSet1.Close;
        pFibDataSet1.SQLs.SelectSQL.Text := 'select * from KASSA_VEDOMOST(' +  QuotedStr(day_begin) + ','
                                                                               +  QuotedStr(DateToStr(day_end)) + ','
                                                                               + IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
        pFibDataSet1.Open;
        pFibDataSet1.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['sch']        := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_vedom_1_good.frf');
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

//        frReport1.DesignReport;}
    T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        day_end := IncDay(day_end,-1);
        pFIBDataSetVedomost.Close;
        pFIBDataSetVedomost.SQLs.SelectSQL.Text := 'select * from KASSA_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                        +  QuotedStr(DateToStr(day_end)) + ','
                                                                                        +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
        pFIBDataSetVedomost.Open;
    T.Free;
        frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10004.fr3');
        frxReport2.Variables['date_begin'] := QuotedStr(day_begin);
        frxReport2.Variables['date_end']   := QuotedStr(dateTostr(day_end));
        frxReport2.Variables['name_sch']   := cxComboBoxSch.Text;
        frxReport2.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport2.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
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

    if cxCheckBox3.Checked then
    begin
        T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        pFibDataSet2.Close;
        pFibDataSet2.SQLs.SelectSQL.Text := 'select * from KASSA_RAS_DEBET_SCH(' +  QuotedStr(day_begin) + ','
                                                                                 +  QuotedStr(DateToStr(day_end)) + ','
                                                                                 + IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
//        showmessage(pFibDataSet2.SQLs.SelectSQL.Text);
        pFibDataSet2.Open;
        T.Free;
        pFibDataSet2.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['sch']        := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaRasDebet.frf');
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
    end;

    if cxCheckBox4.Checked then
    begin
        T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        pFibDataSet2.Close;
        pFibDataSet2.SQLs.SelectSQL.Text := 'select * from KASSA_RAS_KREDIT_SCH(' +  QuotedStr(day_begin) + ','
                                                                                  +  QuotedStr(DateToStr(day_end)) + ','
                                                                                  + IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
//        showmessage(pFibDataSet2.SQLs.SelectSQL.Text);
        pFibDataSet2.Open;
        T.Free;
        pFibDataSet2.FetchAll;
        frVariables['date_begin'] := day_begin;
        frVariables['date_end']   := dateTostr(day_end);
        frVariables['sch']   := cxComboBoxSch.Text;
        frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaRasKredit.frf');
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
    end;

    DataSetSysData.Close;
    DataSetSysData.Sqls.SelectSql.Text := 'select PUB_SP_CUSTOMER.KOD_EDRPOU from PUB_SYS_DATA, PUB_SP_CUSTOMER where PUB_SP_CUSTOMER.ID_CUSTOMER= PUB_SYS_DATA.ORGANIZATION';
    DataSetSysData.Open;

    if cxCheckBox5.Checked then
    begin
    T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.update;

        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);

        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;

        day_end := IncDay(day_end,-1);

        DataSetFRX_Report.Close;
        DataSetFRX_Report.SQLs.SelectSQL.Text := 'select * from KASSA_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                               +  QuotedStr(DateToStr(day_end)) + ','
                                                                               +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';

        DataSetFRX_Report.Open;



        pFIBDataSetVedomost.Close;
        pFIBDataSetVedomost.SQLs.SelectSQL.Text := 'select * from KASSA_VEDOMOST_3_15(' +  QuotedStr(day_begin) + ','
                                                                                        +  QuotedStr(DateToStr(day_end)) + ','
                                                                                        +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
        pFIBDataSetVedomost.Open;

        ReportMemOrder.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10017_ukr.fr3');

        T.Free;

        ReportMemOrder.Variables['date_begin'] := QuotedStr(day_begin);
        ReportMemOrder.Variables['date_end']   := QuotedStr(dateTostr(day_end));
        ReportMemOrder.Variables['name_sch']   := QuotedStr(cxComboBoxSch.Text);
        ReportMemOrder.Variables['comp']       := QuotedStr(GetComputerNetName);
        ReportMemOrder.Variables['id_user']    := QuotedStr(IntToStr(myform.id_user));
        ReportMemOrder.Variables['mon_year']   := Quotedstr(cxComboBoxMonth.Text + ' ' + cxSpinEditYear.Text);
        ReportMemOrder.Variables['kod_okpo']   := QuotedStr(DataSetSysData.FieldByName('KOD_EDRPOU').AsString);

        ReportMemOrder.PrepareReport(true);
        
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  ReportMemOrder.Print;
            end
            else ReportMemOrder.ShowReport(true);
        end else
        ReportMemOrder.DesignReport;
    end;

    if cxCheckBoxRasMO.Checked then
    begin
        T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        day_end := IncDay(day_end,-1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        DataSetDebetKredit.Close;
        DataSetDebetKredit.SQLs.SelectSQL.Text := 'select * from KASSA_RAS_DEBET_KREDIT_MO(' +  QuotedStr(day_begin) + ','
                                                                                  +  QuotedStr(DateToStr(day_end)) + ','
                                                                                  + IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';// order by NUMBER_SCH_D_MO, NUMBER_SCH_K_MO asc';
        DataSetDebetKredit.Open;
        DataSetDebetKredit.FetchAll;


        DataSetDbKrnotMO.Close;
        DataSetDbKrnotMO.SQLs.SelectSQL.Text := 'select * from KASSA_RAS_DEBET_KREDIT_NOT_MO(' +  QuotedStr(day_begin) + ','
                                                                                  +  QuotedStr(DateToStr(day_end)) + ','
                                                                                  + IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';// order by NUMBER_SCH_D, NUMBER_SCH_K asc';
        DataSetDbKrnotMO.Open;
        DataSetDbKrnotMO.FetchAll;

        T.Free;

        //pFibDataSet2.FetchAll;
        //DataSetDebet.FetchAll;
        ReportRasDbKr.Variables['date_begin'] := QuotedStr(day_begin);
        ReportRasDbKr.Variables['date_end']   := QuotedStr(dateTostr(day_end));
        ReportRasDbKr.Variables['name_sch']   := QuotedStr(cxComboBoxSch.Text);
        ReportRasDbKr.Variables['mon_year']   := Quotedstr(cxComboBoxMonth.Text + ' ' + cxSpinEditYear.Text);
        //frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\KassaRasKredit.frf');
        //frReport1.PrepareReport;

        ReportRasDbKr.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  ReportRasDbKr.Print;
            end
            else
            ReportRasDbKr.ShowReport(true);
        end else
        ReportRasDbKr.DesignReport;
    end;

end;

procedure TPrintKassaJo.cxTextEditYearKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key < '0') or (key < '0') then key := chr(0);
end;

end.
