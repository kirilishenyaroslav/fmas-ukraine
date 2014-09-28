unit uScincePensionReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls,dmScience, Buttons, frxDesgn,
  frxClass, frxDBSet;

type
  TReportForm = class(TForm)
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
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
   DataModule:TScienceDM;
   DesignReport:Boolean;
   
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

 with DataModule.ReportDataSet do
    begin
        Close;
        ParamByName('REPORT_DATE').Value:=CurDateEdit.Date;
        Open;
    end;

    with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;


    Report.LoadFromFile('Reports\Asup\AsupScincePensionReport.fr3 ');
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;
end;

end.
