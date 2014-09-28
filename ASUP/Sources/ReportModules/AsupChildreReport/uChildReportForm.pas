unit uChildReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmChild, StdCtrls, Buttons, frxClass, frxDBSet, frxDesgn,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel;

type
  TReportForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    cxLabel3: TcxLabel;
    cxDateEditNow: TcxDateEdit;
    frxDesigner1: TfrxDesigner;
    FRDataSet: TfrxDBDataset;
    ZReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public

    DataModule:TChildDM;
    DesignReport: Boolean;

  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormCreate(Sender: TObject);
begin
    cxDateEditNow.Date:=Date();
    
end;

procedure TReportForm.OkButtonClick(Sender: TObject);
begin

    with DataModule do
    begin
        ConstsQuery.Open;
        ReportDataSet.ParamByName('Date_Report').Value:=cxDateEditNow.Date;
        ReportDataSet.CloseOpen(false);
    end;

     ZReport.LoadFromFile('Reports\ASUP\AsupChildReport.fr3');
     ZReport.Variables['NameV']:=QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
     ZReport.Variables['DateNow']:=cxDateEditNow.Date;


    if DesignReport=True then ZReport.DesignReport
    else ZReport.ShowReport;

    DataModule.ConstsQuery.Close;

end;

end.
