unit uNationalityReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmNationalityMain, StdCtrls, Buttons, frxDesgn, frxClass, frxDBSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar;

type
  TReportMainForm = class(TForm)
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    NationalityComboBox: TcxLookupComboBox;
    Label1: TLabel;
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    Report: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DesignReport    :Boolean;
    DataModule      :TMainDM;
  end;

var
  ReportMainForm: TReportMainForm;

implementation

{$R *.dfm}

procedure TReportMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModule.NationalityDataSet.Close;
end;

procedure TReportMainForm.FormShow(Sender: TObject);
begin
     DataModule.NationalityDataSet.Open;
end;

procedure TReportMainForm.OkButtonClick(Sender: TObject);
begin

    with DataModule.ReportDataSet do
    begin
        Close;
        ParamByName('ID_NATIONALITY').Value:=NationalityComboBox.EditValue;
        ParamByName('REPORT_DATE').Value:=CurDateEdit.Date;
        Open;
    end;

    with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;


    Report.LoadFromFile('Reports\Asup\AsupNationalityReport.fr3');
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
    Report.Variables['NATIONALITY']:=QuotedStr(NationalityComboBox.EditText);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;

end;

procedure TReportMainForm.FormCreate(Sender: TObject);
begin
    CurDateEdit.Date:=Date();
end;

end.
