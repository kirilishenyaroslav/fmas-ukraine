unit uDeadReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmDeadMain, frxClass, frxDBSet, frxDesgn, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel,
  StdCtrls, Buttons;

type
  TReportForm = class(TForm)
    cxLabel1: TcxLabel;
    DateEditBeg: TcxDateEdit;
    cxLabel2: TcxLabel;
    DateEditEnd: TcxDateEdit;
    cxLabel3: TcxLabel;
    DateEditNow: TcxDateEdit;
    frxDesigner1: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    frxDBDataset1: TfrxDBDataset;
    ZReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DesignReport    :Boolean;
    DataModule      :TDeadMainDM;
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormCreate(Sender: TObject);
begin
DateEditBeg.Date:=StrToDate(DateToStr(Now));
DateEditEnd.Date:=StrToDate(DateToStr(Now));
DateEditNow.Date:=StrToDate(DateToStr(Now));
end;

procedure TReportForm.OkButtonClick(Sender: TObject);
begin

if DateEditBeg.Date > DateEditEnd.Date then
 begin
   ShowMessage('Дата початку мае бути меньше дати закінчення!');
   Exit;
 end;

 with DataModule.ReportDataSet do
    begin
        Close;

        ParamByName('DATE_BEG').Value:=DateEditBeg.Date;
        ParamByName('DATE_END').Value:=DateEditEnd.Date;

        Open;
    end;

    with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;


     ZReport.LoadFromFile('Reports\Asup\AsupDeadReport.fr3');
     ZReport.Variables['NameV']:=QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
     ZReport.Variables['DateNow']:=QuotedStr(DateToStr(DateEditNow.Date));
     ZReport.Variables['DateBeg']:=QuotedStr(DateToStr(DateEditBeg.Date));
     ZReport.Variables['DateEnd']:=QuotedStr(DateToStr(DateEditEnd.Date));

    if DesignReport=True then ZReport.DesignReport
        else ZReport.ShowReport;

end;

end.
