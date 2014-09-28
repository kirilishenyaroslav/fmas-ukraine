unit uByScienceReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmScienceReport, StdCtrls, Buttons, frxDesgn, frxClass, frxDBSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TReportForm = class(TForm)
    Label3: TLabel;
    CurDateEdit: TcxDateEdit;
    FRDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    PropComboBox: TcxLookupComboBox;
    Report: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    DataModule:TScienceReportDM;
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
        ParamByName('ID_REGARD_PROP').Value:=PropComboBox.EditValue;

        Open;
    end;

    with DataModule.ConstsQuery do
    begin
        Close;
        Open;
    end;


    Report.LoadFromFile('Reports\Asup\AsupByScienceReport.fr3');
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(CurDateEdit.Date));
    Report.Variables['FIRM_NAME']:=
                    QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
    Report.Variables['PROPERTY_NAME']:=
                    QuotedStr(PropComboBox.EditText);

    if DesignReport=True then Report.DesignReport
        else Report.ShowReport;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin

    DataModule.RegardsPropertiesDataSet.Open;

end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule.RegardsPropertiesDataSet.Close;
end;

end.
