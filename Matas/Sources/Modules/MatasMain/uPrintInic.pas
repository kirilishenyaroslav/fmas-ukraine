unit uPrintInic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ComCtrls, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, FR_Class, FIBQuery, pFIBQuery, FR_DSet, FR_DBSet,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfmPrintInic = class(TForm)
    cxPrintInic: TcxButton;
    cxCancel: TcxButton;
    frReportInic: TfrReport;
    pFIBDataSetInic: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    frDBDataSetInic: TfrDBDataSet;
    pFIBQueryInic: TpFIBQuery;
    InvDatabase: TpFIBDatabase;
    SchDataSet: TpFIBDataSet;
    SchDataSetID_SCH: TFIBIntegerField;
    SchDataSetSCH_NUMBER: TFIBStringField;
    SchDataSetNAME_SCH: TFIBStringField;
    cxLookupComboBox1: TcxLookupComboBox;
    Label1: TLabel;
    SchDataSource: TDataSource;
    procedure cxCancelClick(Sender: TObject);
    procedure cxPrintInicClick(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
  public
     NAMEREPORT : string;
     nid_sch, nid_mo : integer;
     dDATE : TDateTime;
  end;

var
  fmPrintInic: TfmPrintInic;

implementation

{$R *.dfm}

procedure TfmPrintInic.cxCancelClick(Sender: TObject);
begin
  close;
end;


procedure TfmPrintInic.cxPrintInicClick(Sender: TObject);
begin
        frVariables['nachalo'] :=''; //cxDateStart.Text;
        frVariables['konec'] :=''; //cxDateEnd.Text;
        pFIBDataSetInic.Close;
        pFIBDataSetInic.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_SEL_MO_OST_BASE(:PID_MO, :PERIOD) WHERE ID_SCH=:NID_SCH';
        pFIBDataSetInic.ParamByName('PID_MO').Value:=nid_mo;
        pFIBDataSetInic.ParamByName('PERIOD').Value:=dDATE;
        pFIBDataSetInic.ParamByName('NID_SCH').Value:=nid_sch;
        pFIBDataSetInic.Open;
        frReportInic.LoadFromFile(ExtractFilePath(Application.ExeName)+ NAMEREPORT);
        frReportInic.PrepareReport;
        frReportInic.ShowReport;
        close;
end;

procedure TfmPrintInic.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
 nid_sch:=cxLookupComboBox1.EditValue;
end;

end.
