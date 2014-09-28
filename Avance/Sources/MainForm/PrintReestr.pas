unit PrintReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mainAvanceOtchet, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, Placemnt, frxClass, frxDBSet, GlobalSPR, Un_R_file_Alex;

type
  TfrmPrintReestr = class(TForm)
    Database: TpFIBDatabase;
    DataSetReestr: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    LabelNameReport: TcxLabel;
    TextEditName: TcxTextEdit;
    LabelPeriodFrom: TcxLabel;
    LabelPeriodTo: TcxLabel;
    DateEditFrom: TcxDateEdit;
    DateEditTo: TcxDateEdit;
    Bevel1: TBevel;
    ButtonPrint: TcxButton;
    ButtonClose: TcxButton;
    FormStorage1: TFormStorage;
    DBDatasetReestr: TfrxDBDataset;
    DataSetReestrNAME_PRED: TFIBStringField;
    DataSetReestrDATE_DOC: TFIBDateField;
    DataSetReestrNUM_DOC: TFIBStringField;
    DataSetReestrSUMMA: TFIBBCDField;
    DataSetReestrFIO_DOC: TFIBStringField;
    DataSetReestrTIN: TFIBStringField;
    DataSetReestrTN: TFIBIntegerField;
    ReportReestr: TfrxReport;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    myform : TfmAvanceOtchet;
  public
       constructor Create(AOwner: TComponent; mform: TfmAvanceOtchet; DB: TpFIBDatabase);
  end;

{var
  frmPrintReestr: TfrmPrintReestr;  }

implementation
uses ACCMGMT;

{$R *.dfm}

constructor TfrmPrintReestr.Create(AOwner: TComponent; mform: TfmAvanceOtchet; DB: TpFIBDatabase);
begin
    inherited Create (AOwner);

    myform                       := mform;

    Database                     := DB;
    Transaction.DefaultDatabase  := Database;

    DataSetReestr.Database       := Database;
    DataSetReestr.Transaction    := Transaction;

    DateEditFrom.Date            := myform.cxDateBegin.date;
    DateEditTo.Date              := myform.cxDateEnd.date;

    Caption                      := Un_R_file_Alex.KASSA_PRINT_CAPTION;
    LabelNameReport.Caption      := Un_R_file_Alex.J4_NAME_OTCHET;
    LabelPeriodFrom.Caption      := Un_R_file_Alex.J4_Period_from;
    LabelPeriodTo.Caption        := Un_R_file_Alex.KASSA_FIND_CAP_3;
    ButtonPrint.Caption          := Un_R_file_Alex.BANK_MO_PRINT[1];
    ButtonClose.Caption          := Un_R_file_Alex.CLOSE_CONST[1];

    FormStorage1.RestoreFormPlacement;
    if TextEditName.Text='' then TextEditName.Text := Un_R_file_Alex.J4_APP_TO;
end;

procedure TfrmPrintReestr.ButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfrmPrintReestr.ButtonPrintClick(Sender: TObject);
begin
    DataSetReestr.Close;
    DataSetReestr.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_AVANCE_DOCS('''+DateToStr(DateEditFrom.Date)+''', '''+DateToStr(DateEditTo.Date)+''', '+IntToStr(myform.id_system) + ') ORDER BY fio_doc, date_doc';
    DataSetReestr.Open;

    ReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_reestr_period.fr3');
    ReportReestr.Variables['name_machine']        := QuotedStr(GetComputerNetName);
    ReportReestr.Variables['fio']                 := QuotedStr(GetUserFIO);
    ReportReestr.Variables['id_us']               := IntToStr(GetUserId);
    ReportReestr.Variables['name_report']         := QuotedStr(TextEditName.Text);
    ReportReestr.Variables['date_beg']            := QuotedStr(DateEditFrom.Text);
    ReportReestr.Variables['date_end']            := QuotedStr(DateEditTo.Text);

    ReportReestr.PrepareReport(true);
    ReportReestr.ShowReport(true);
end;

procedure TfrmPrintReestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
