unit uReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Spin, Buttons,dmMain, frxClass,
  frxDBSet, frxDesgn;

type
  TReportMainForm = class(TForm)
    Label1: TLabel;
    AgeSpinEdit: TSpinEdit;
    Label2: TLabel;
    YearSpinEdit: TSpinEdit;
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    Report: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DesignReport:Boolean;
    DataModule:TMainDM;
  end;

var
  ReportMainForm: TReportMainForm;

implementation

uses pFIBDataSet, DB;

{$R *.dfm}

procedure TReportMainForm.FormCreate(Sender: TObject);
var
    Year,Month,Day:Word;
begin

    DecodeDate(Date,Year,Month,Day);
    YearSpinEdit.Value:=Year;
    CurDateEdit.Date:=Date;

end;

procedure TReportMainForm.OkButtonClick(Sender: TObject);
begin

    with DataModule.ReportDataSet do
    begin
        Close;
        ParamByName('AGE').Value:=AgeSpinEdit.Value;
        ParamByName('IN_YEAR').Value:=YearSpinEdit.Value;
        ParamByName('REPORT_DATE').Value:=CurDateEdit.Date;
        Open;
    end;

    with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;


    Report.LoadFromFile('Reports\Asup\AsupLessAgeReport.fr3');
    Report.Variables['AGE']:=AgeSpinEdit.Value;
    Report.Variables['CUR_YEAR']:=YearSpinEdit.Value;
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;

end;

end.
