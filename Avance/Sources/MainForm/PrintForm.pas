unit PrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, FR_DSet,
  FR_DBSet, FR_Class, ExtCtrls, StdCtrls, cxButtons, MainForm, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  frxClass, frxDBSet, cxSpinEdit, cxCheckBox, DateUtils, pFIBDatabase,
  cxLabel, Un_R_file_Alex;

type
  TfmMode = (Jornal4, Edit, Sp, SpEdit);

  TfmPrintForm = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    Bevel1: TBevel;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    PrintDialog1: TPrintDialog;
    cxCheckBox1: TcxCheckBox;
    cxSpinEdit1: TcxSpinEdit;
    cxComboBoxMonth: TcxComboBox;
    cxComboBoxJornal: TcxComboBox;
    DataSetJornal: TpFIBDataSet;
    DataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetSUMMA_DEBET: TFIBBCDField;
    DataSetSCH_TITLE: TFIBStringField;
    DataSetDATE_PROV_DEBET: TFIBDateField;
    DataSetNAME_RECVIZITI_DEBET: TFIBStringField;
    DataSetNAME_RECVIZITI_KREDIT: TFIBStringField;
    DataSetDATE_PROV_KREDIT: TFIBDateField;
    DataSetFAMILIA: TFIBStringField;
    DataSetIMYA: TFIBStringField;
    DataSetOTCHESTVO: TFIBStringField;
    DataSetBIRTHDAY: TFIBDateField;
    DataSetTIN: TFIBStringField;
    DataSetNUM_DOC_DEBET: TFIBStringField;
    DataSetNUM_DOC_KREDIT: TFIBStringField;
    DataSetDEBET_SCH: TFIBStringField;
    DataSetKREDIT_SCH: TFIBStringField;
    DataSetOST_ALL_DEBET: TFIBBCDField;
    DataSetOST_ALL_KREDIT: TFIBBCDField;
    DataSetOST_DEBET: TFIBBCDField;
    DataSetOST_KREDIT: TFIBBCDField;
    DataSetFLAG_FIO: TFIBIntegerField;
    DataSetFIO: TFIBStringField;
    DataSetOSN_SCH: TFIBStringField;
    DataSetSUMMA_KREDIT: TFIBBCDField;
    Report3: TfrxReport;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
  private
    n : TfmMode;
    Ind1 : array [1..2] of array of Variant;
  public
    id_jornal : int64;
    constructor Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction); reintroduce; overload;
    destructor Destroy; override;
  end;


implementation

{$R *.dfm}
constructor TfmPrintForm.Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction);
var
    i : integer;
begin
    inherited Create(nil);
    n := m;
    DataSetJornal.Database := db;
    DataSetJornal.Transaction := Tr;
    DataSetJornal.StartTransaction;
    DataSet.Database       := db;
    DataSet.Transaction    := Tr;
    DataSet.StartTransaction;
    if m = Jornal4 then
    begin
    {загрузка журнала}

    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := ' SELECT * FROM J4_SP_JO ';
    DataSetJornal.open;
    If DataSetJornal.IsEmpty then
    begin
        MessageBox(Handle, PChar('Не _снує журналу завантаження! Система автоматично закриється. Зверниться до системного адм_н_стратору.'), PChar('Увага!!!'), 16);
        close;
    end;
    DataSetSelectSystem.FetchAll;
    SetLength(Ind1[1], DataSetJornal.RecordCount);
    SetLength(Ind1[2], DataSetJornal.RecordCount);
    DataSetJornal.First;
    cxComboBoxJornal.Properties.Items.Clear;
    i := 0;
    While not DataSetJornal.Eof do
    begin
        Ind1[1, DataSetJornal.RecNo - 1] := DataSetJornal.FieldByName('ID_J4_SP_JO').AsVariant;
        Ind1[2, DataSetJornal.RecNo - 1] := DataSetJornal.FieldByName('DATA_OPEN').AsDateTime;
        if DataSetJornal.FieldByName('SYSTEM_OPEN').Asinteger = 1
        then
        begin
            i := DataSetJornal.RecNo - 1;
            id_jornal                       := DataSetJornal.FieldByName('ID_J4_SP_JO').AsVariant;
            cxSpinEdit1.Properties.MinValue := YearOf(DataSetJornal.FieldByName('DATA_OPEN').AsDateTime);
        end;
        cxComboBoxJornal.Properties.Items.Insert(DataSetJornal.RecNo - 1, DataSetJornal.FieldByName('SHORT_NAME').AsString);
        DataSetJornal.Next;
    end;
    DataSetJornal.Close;
    DataSetJornal.Transaction.Commit;
    cxSpinEdit1.Value          := YearOf(date);
    cxComboBoxMonth.ItemIndex  := MonthOf(date)-1;
    cxComboBoxJornal.ItemIndex := i;
    end;


    cxLabel1.Caption               := Un_R_file_Alex.J4_PRINT_SLECT_JORNAL;
    cxButtonClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxButtonPrint.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
    Caption                        := Un_R_file_Alex.KASSA_PRINT_CAPTION;
    cxCheckBox1.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_SELMONTH;
    cxLabel2.Caption               := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;


end;

destructor TfmPrintForm.Destroy;
begin

  inherited;
end;


procedure TfmPrintForm.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintForm.cxButtonPrintClick(Sender: TObject);
var
    d : TDate;
    i : integer;
begin
    if n = Jornal4 then
    begin


         if cxComboBoxMonth.ItemIndex < 10
             then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
             else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
         DataSet.Close;
         DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_MONTH('''+ DateToStr(d) +''', '+intToStr(id_jornal)+')';
         DataSet.Open;
//         DataSet.First;
//         While not DataSetSelectPap.Eof do
//         begin
//             frVariables['ini_ruk'] := Copy(DataSetSelectPap.FieldByName('I_RUKOVODITEL').AsString,1,1)+'.'+Copy(DataSetSelectPap.FieldByName('O_RUKOVODITEL').AsString,1,1)+'.';
//             frVariables['ini_pod'] := Copy(DataSetSelectPap.FieldByName('I_PODPISAL').AsString,1,1)+'.'+Copy(DataSetSelectPap.FieldByName('O_PODPISAL').AsString,1,1)+'.';
//             frVariables['fio_dog'] := fio;
//             frVariables['zarplata_pis'] := '('+AllChislo(FloatToStr(DataSetSelectPap.FieldByName('SUMMA_ZARABOTKA').AsFloat)) +')';
//             if DataSetSelectPap['YEAR_DOGOVOR'] <> null
{                                Report3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Avance\Otchet\j4_jo_4.fr3');
                                Report3.PrepareReport(true);
                                Report3.ShowReport;
//             else Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'BPL\Otchet\Work_dogovor_all_not_year.frf');
//             Report.PrepareReport;
//             if not cxCheckBoxEdit.Checked then
//             begin
//                if not cxCheckBoxShow.Checked then
//                     Report.PrintPreparedReport(IntToStr(PrintDialog1.FromPage) + '-' + IntTostr(PrintDialog1.ToPage),
//                                                PrintDialog1.Copies,
//                                                PrintDialog1.Collate,
 //                                               frAll)
                {else}
//             end else Report.DesignReport;

//            DataSetSelectPap.Next;
//         end;
             frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Avance\Otchet\№4.frf');
//             frReport1.PrepareReport;
             frReport1.ShowReport;

             DataSet.Close;
    end;
    DataSet.Transaction.Commit;
end;

end.
