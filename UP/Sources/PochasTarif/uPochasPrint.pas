unit uPochasPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, frxExportRTF, frxExportXML,
  frxClass, frxExportPDF, frxDBSet, cxLookAndFeelPainters, cxLabel,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons;

type
  TfrmPochasTarifPrint = class(TForm)
    PochasPrintDSet: TpFIBDataSet;
    PochasDBDSet: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    btnPrint: TcxButton;
    btnCancel: TcxButton;
    PeriodBeg: TcxDateEdit;
    PeriodEnd: TcxDateEdit;
    isCheckPeriod: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    PochasReport: TfrxReport;
    procedure btnPrintClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure isCheckPeriodPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPochasTarifPrint: TfrmPochasTarifPrint;

implementation

{$R *.dfm}

uses uPochasTarif, BaseTypes;

procedure TfrmPochasTarifPrint.btnPrintClick(Sender: TObject);
begin
   try
     if PeriodBeg.Date>PeriodEnd.Date then
     begin
       agMessageDlg('”вага!', 'ƒата початку не може бути б≥льше дати к≥нц€!', mtInformation, [mbOK]);
       Exit;
     end;
     if PochasPrintDSet.Active then PochasPrintDSet.Close;
     PochasPrintDSet.SQLs.SelectSQL.Text:='Select * From Up_Sp_Pochas_Tarif_Print(:Period_Beg, :Period_End)';
     if isCheckPeriod.Checked then
     begin
        PochasPrintDSet.ParamByName('Period_Beg').AsDate:=PeriodBeg.Date;
        PochasPrintDSet.ParamByName('Period_End').AsDate:=PeriodEnd.Date;
     end
     else
     begin
        PochasPrintDSet.ParamByName('Period_Beg').Value:=null;
        PochasPrintDSet.ParamByName('Period_End').Value:=null;
     end;
     PochasPrintDSet.Open;
     PochasReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\UP\UpPochasTarif.fr3', True);
     if isCheckPeriod.Checked then PochasReport.Variables['isCheckPeriod']:=QuotedStr('T')
     else PochasReport.Variables['isCheckPeriod']:=QuotedStr('F');
     PochasReport.Variables['Period_Beg']:=QuotedStr(PeriodBeg.Text);
     PochasReport.Variables['Period_End']:=QuotedStr(PeriodEnd.Text);
     PochasReport.ShowReport;
   except on E:Exception do
          begin
             agMessageDlg(Application.Title, E.Message, mtInformation, [mbOK]);
             PochasPrintDSet.Close;
          end;
   end;
end;

procedure TfrmPochasTarifPrint.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmPochasTarifPrint.isCheckPeriodPropertiesChange(
  Sender: TObject);
begin
   PeriodBeg.Enabled:=isCheckPeriod.Checked;
   PeriodEnd.Enabled:=isCheckPeriod.Checked;
end;

procedure TfrmPochasTarifPrint.FormCreate(Sender: TObject);
begin
   PeriodBeg.Date:=Date;
   PeriodEnd.Date:=Date;
end;

end.
