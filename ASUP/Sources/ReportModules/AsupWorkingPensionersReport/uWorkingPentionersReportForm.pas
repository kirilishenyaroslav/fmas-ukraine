unit uWorkingPentionersReportForm;

interface

uses   DateUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmWorkingPentionersMain, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Buttons, frxDesgn, frxClass,
  frxDBSet, cxButtonEdit;

type
  TReportMainForm = class(TForm)
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    Label1: TLabel;
    DateEndEdit: TcxDateEdit;
    Label2: TLabel;
    DateBegEdit: TcxDateEdit;
    Report: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DesignReport    :Boolean;
    DataModule      :TMainDM;
    IdUperrDepartment:Int64;
  end;

var
  ReportMainForm: TReportMainForm;

implementation

{$R *.dfm}

procedure TReportMainForm.FormCreate(Sender: TObject);
var
  Y:Word;
  M:Word ;
  D:Word;
  T:Word;
  str:String;
begin
  CurDateEdit.Date:=Date();

  DecodeDayOfWeekInMonth(Date(),Y,M,D,T);
  str:='01.01.'+IntToStr(Y);
  DateBegEdit.Date := StrToDate(str);
  str:='31.12.'+IntToStr(Y);
  DateEndEdit.Date := StrToDate(str);

  {
DateBegEdit.Date := Date();
DateEndEdit.Date := Date();
}
end;


procedure TReportMainForm.OkButtonClick(Sender: TObject);
begin
 FRDataSet.DataSource:=DataModule.ReportDataSource;
 with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;

 with  DataModule.ReportDataSet do
 begin
  Close;
  ParamByName('PERIOD_BEG').Value:=DateToStr(DateBegEdit.Date);
  ParamByName('PERIOD_END').Value:=DateToStr(DateEndEdit.Date);
  CloseOpen(false);
 end;

    Report.LoadFromFile('Reports\Asup\AsupReportPensionersWorking.fr3');
    Report.Variables['CURDATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
 //   Report.Variables['DATE_BEG']:=QuotedStr(DateToStr(DateBegEdit.Date));
//    Report.Variables['DATE_END']:=QuotedStr(DateToStr(DateEndEdit.Date));
  
    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;
   DataModule.ReportDataSet.Close;

end;




end.
