unit PrintBankGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxLabel, StdCtrls,
  cxButtons, cxCheckBox, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet,BankMainForm,Un_R_file_Alex,
  ExtCtrls;

type
  TfmPrintBankGr = class(TForm)
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxComboBoxSch: TcxComboBox;
    DataSetSch: TpFIBDataSet;
    DataSetPrint: TpFIBDataSet;
    DataSetPrintS_ID_SMETA: TFIBBCDField;
    DataSetPrintALL_P_SUMMA: TFIBBCDField;
    DataSetPrintALL_R_SUMMA: TFIBBCDField;
    DataSetPrintS_ID_KEKV: TFIBBCDField;
    DataSetPrintR_KEKV_KOD: TFIBIntegerField;
    DataSetPrintR_KEKV_TYTLE: TFIBStringField;
    DataSetPrintR_ID_SM_GR: TFIBBCDField;
    DataSetPrintR_GROUP_KOD: TFIBIntegerField;
    DataSetPrintR_GROUP_TITLE: TFIBStringField;
    DataSetPrintR_SMETA_TYTLE: TFIBStringField;
    DataSetPrintR_SMETA_KOD: TFIBIntegerField;
    DataSetPrintR_NAME_PRED: TFIBStringField;
    frxDBDataset1: TfrxDBDataset;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ReportGrSm: TfrxReport;
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
  private
    myforma : TfmBankMainForm;
    date_sch : TDate;
    IndKassa : array [1..7]  of array of Variant;
  public
    constructor Create(mform : TfmBankMainForm); reintroduce; overload;
  end;

//var
{  fmPrintBankGr: TfmPrintBankGr;  }

implementation

uses Un_Progress_form;

{$R *.dfm}

constructor TfmPrintBankGr.Create(mform: TfmBankMainForm);
begin
    inherited Create(nil);
    myforma := mform;


    cxButtonPrint.Caption  := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption  := Un_R_file_Alex.n_AUTOKOD_FORM_CANCLE;
    cxButton2.Caption  := Un_R_file_Alex.BANK_CHANGE_PERIOD;
    Caption                                  := Un_R_file_Alex.BANK_PRINT_PERIOD;

    cxLabel1.Caption                         := Un_R_file_Alex.BANK_PERIOD_MONTH_YEAR+' '+Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel2.Caption                         := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxCheckBox1.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_PERIOD_BY_GR;
    cxCheckBox2.Properties.Caption           := Un_R_file_Alex.BANK_PRINT_PERIOD_BY_GR_SM;
    cxLabel3.Caption                         := Un_R_file_Alex.BANK_PRINT_SCH_BALL;

    DataSetSch.Database    := myforma.Database;
    DataSetPrint.Database  := myforma.Database;
    
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    DataSetSch.Open;

    date_sch               := date;
    cxDateEditBegin.Date   := date;
    cxDateEditEnd.Date     := date;

    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+DateToStr(cxDateEditBegin.Date)+''','''+dateToStr(cxDateEditEnd.date)+''') order by SCH_NUM';
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

    cxDateEditBegin.Enabled     := true;
    cxDateEditEnd.Enabled      := true;

    cxComboBoxSch.Enabled       := false;
    cxCheckBox1.Enabled         := false;
    cxCheckBox2.Enabled         := false;
    cxLabel3.Enabled            := false;

    cxCheckBox1.Checked    := true;

    date_sch               := date;
    cxDateEditBegin.Date   := date;
    cxDateEditEnd.Date     := date;

end;


procedure TfmPrintBankGr.cxButtonPrintClick(Sender: TObject);
var
       day_beg, day_end, kor_sch, ras_sch  : string;
       i : integer;
       T : TfmUn_Progress_form;
begin
    if cxCheckBox1.Checked then
    begin
        day_beg := datetostr(cxDateEditBegin.Date);
        day_end := datetostr(cxDateEditEnd.Date);
        kor_sch := IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]);

        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;

        DataSetPrint.Close;
        DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SUMS_ONDATE_BY_GR(''' + day_beg +''', '''+day_end+''', '''+kor_sch+''') order by r_kekv_kod, r_group_kod';
        DataSetPrint.Open;
        DataSetPrint.FetchAll;
        T.Free;


        ReportGrSm.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_period_by_group.fr3');

        ReportGrSm.Variables['date_beg']     := QuotedStr(day_beg);
        ReportGrSm.Variables['date_end']     := QuotedStr(day_end);

        i := cxComboBoxSch.ItemIndex;
        ReportGrSm.Variables['korresp_sch']    := Quotedstr(VarToStr(IndKassa[5, i]));
        ReportGrSm.Variables['ras_sch']    := Quotedstr(VarToStr(IndKassa[2, i]));

        ReportGrSm.PrepareReport(true);
        ReportGrSm.ShowReport(true);
    end;

    if cxCheckBox2.Checked then
    begin
        day_beg := datetostr(cxDateEditBegin.Date);
        day_end := datetostr(cxDateEditEnd.Date);
        kor_sch := IntToStr(IndKassa[1, cxComboBoxSch.ItemIndex]);

        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
        T.Show;
        T.Repaint;

        DataSetPrint.Close;
        DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SUMS_ONDATE_BY_SM(''' + day_beg +''', '''+day_end+''', '''+kor_sch + ''') order by r_kekv_kod, r_group_kod, r_smeta_kod';
        DataSetPrint.Open;

        DataSetPrint.FetchAll;

        T.Free;

        ReportGrSm.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_period_by_group_sm.fr3');

        ReportGrSm.Variables['date_beg']     := QuotedStr(day_beg);
        ReportGrSm.Variables['date_end']    := QuotedStr(day_end);

        i := cxComboBoxSch.ItemIndex;
        ReportGrSm.Variables['korresp_sch']    := Quotedstr(VarToStr(IndKassa[5, i]));
        ReportGrSm.Variables['ras_sch']    := Quotedstr(VarToStr(IndKassa[2, i]));;

        ReportGrSm.PrepareReport(true);
        ReportGrSm.ShowReport(true);
    end;


end;

procedure TfmPrintBankGr.cxButton1Click(Sender: TObject);
var
    id : int64;
    lll : integer;
begin
    try id := IndKassa[1, cxComboBoxSch.ItemIndex]; except id := -1; end;
    date_sch := cxDateEditBegin.Date;
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+DateToStr(date_sch)+''','''+dateToStr(cxDateEditEnd.date)+''') order by SCH_NUM';
    DataSetSch.Open;
    DataSetSch.FetchAll;

    SetLength(IndKassa[1], DataSetSch.RecordCount);
    SetLength(IndKassa[2], DataSetSch.RecordCount);
    SetLength(IndKassa[3], DataSetSch.RecordCount);
    SetLength(IndKassa[4], DataSetSch.RecordCount);
    SetLength(IndKassa[5], DataSetSch.RecordCount);
    SetLength(IndKassa[6], DataSetSch.RecordCount);
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
        cxComboBoxSch.Properties.Items.Insert(DataSetSch.RecNo - 1, DataSetSch['SCH_NUM']+' - '+DataSetSch['SCH_TITLE']);
        if id = DataSetSch['ID_SCH'] then begin lll := DataSetSch.RecNo - 1;  end;
        DataSetSch.Next;
    end;

    try cxComboBoxSch.ItemIndex := lll except cxComboBoxSch.ItemIndex := 0; end;

    cxDateEditBegin.Enabled     := false;
    cxDateEditEnd.Enabled      := false;
    cxButton1.Enabled           := false;

    cxComboBoxSch.Enabled       := true;
    cxCheckBox1.Enabled         := true;
    cxCheckBox2.Enabled         := true;
    cxLabel3.Enabled            := true;

    cxCheckBox1.Checked         := true;

    cxButton2.Enabled           := true;

end;

procedure TfmPrintBankGr.cxButton2Click(Sender: TObject);
begin
    cxDateEditBegin.Enabled     := true;
    cxDateEditEnd.Enabled       := true;
    cxButton1.Enabled           := true;

    cxComboBoxSch.Enabled       := false;
    cxCheckBox1.Enabled         := false;
    cxCheckBox2.Enabled         := false;
    cxLabel3.Enabled            := false;
    cxButton2.Enabled           := false;
end;

procedure TfmPrintBankGr.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

end.
