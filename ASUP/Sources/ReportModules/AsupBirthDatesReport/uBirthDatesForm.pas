unit uBirthDatesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxControls,
  cxContainer, cxEdit, cxLabel,dmBirthDates, frxClass, frxDBSet, frxDesgn,
  StdCtrls, Buttons;

type
  TReportForm = class(TForm)
    cxLabel1: TcxLabel;
    CBMonth: TcxComboBox;
    cxLabel3: TcxLabel;
    cxDateEditNow: TcxDateEdit;
    frxDesigner1: TfrxDesigner;
    FRDataSet: TfrxDBDataset;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ZReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DataModule:TBirthDatesDM;
    DesignReport:Boolean;
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormCreate(Sender: TObject);
begin
    cxDateEditNow.Date:=StrToDate(DateToStr(Now));
    CBMonth.ItemIndex :=0;

end;

procedure TReportForm.OkButtonClick(Sender: TObject);
begin

    with DataModule do
    begin
        ConstsQuery.Open;
        ReportDataSet.ParamByName('Date').Value:=cxDateEditNow.Date;
        ReportDataSet.ParamByName('month').Value:=CBMonth.ItemIndex+1;

        ReportDataSet.CloseOpen(false);
    end;

     ZReport.LoadFromFile('Reports\ASUP\AsupBirthDatesReport.fr3');

     ZReport.Variables['NameV']:=QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
     ZReport.Variables['DateNow']:=QuotedStr(DateToStr(cxDateEditNow.Date));
     ZReport.Variables['Month']:=QuotedStr(CBMonth.Text);

    if DesignReport=True then ZReport.DesignReport
    else ZReport.ShowReport;

    DataModule.ConstsQuery.Close;

end;

end.
