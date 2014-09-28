unit uReportByNationalityForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmNationalityMain, StdCtrls, Buttons, frxDesgn, frxClass,
  frxDBSet, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TReportForm = class(TForm)
    Label1: TLabel;
    NationalityComboBox: TcxLookupComboBox;
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Report: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    DataModule:TMainDM;
    DesignReport:Boolean;

  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule.NationalityDataSet.Close;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
    DataModule.NationalityDataSet.Open;
    FRDataSet.DataSource:=DataModule.ReportDataSource;
    NationalityComboBox.Properties.ListSource:=DataModule.NationalityDataSource;
end;

procedure TReportForm.OkButtonClick(Sender: TObject);
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

procedure TReportForm.FormCreate(Sender: TObject);
begin
    CurDateEdit.Date:=Date();
end;

end.
