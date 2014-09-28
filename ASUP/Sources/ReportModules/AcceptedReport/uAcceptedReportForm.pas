unit uAcceptedReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmAcceptedMain, StdCtrls, Buttons, frxDesgn, frxClass, frxDBSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TReportForm = class(TForm)
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    DateBegEdit: TcxDateEdit;
    Label1: TLabel;
    DateEndEdit: TcxDateEdit;
    Label2: TLabel;
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Report: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DesignReport    :Boolean;
    DataModule      :TMainDM;
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormCreate(Sender: TObject);
begin
     CurDateEdit.Date:=Date();
end;

procedure TReportForm.OkButtonClick(Sender: TObject);
begin

 FRDataSet.DataSource:=DataModule.ReportDataSource;

 with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;

   DataModule.ReportDataSet.ParamByName('PERIOD_BEG').
                                            Value:=DateToStr(DateBegEdit.Date);
   DataModule.ReportDataSet.ParamByName('PERIOD_END').
                                            Value:=DateToStr(DateEndEdit.Date);
   DataModule.ReportDataSet.Open;


    Report.LoadFromFile('Reports\Asup\AsupAcceptedReport.fr3');
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
    Report.Variables['DATE_BEG']:=QuotedStr(DateToStr(DateBegEdit.Date));
    Report.Variables['DATE_END']:=QuotedStr(DateToStr(DateEndEdit.Date));

    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;
   DataModule.ReportDataSet.Close;

end;

end.
