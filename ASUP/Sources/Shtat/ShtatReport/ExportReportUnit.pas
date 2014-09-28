unit ExportReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FR_E_TXT, FR_E_RTF, frOLEExl,
  FR_Class, frRtfExp, FR_E_HTML2, frxExportHTML, frxExportXLS, frxClass,
  frxExportRTF;

type
  TExportReportForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    RadioGroup1: TRadioGroup;
    IsExcel: TRadioButton;
    IsRtf: TRadioButton;
    IsHtml: TRadioButton;
    RTFExport: TfrxRTFExport;
    ExcelExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Report : TFRxReport;
  end;

var
  ExportReportForm: TExportReportForm;

implementation

{$R *.dfm}

procedure TExportReportForm.OkButtonClick(Sender: TObject);
begin
        Report.PrepareReport;
  {      if IsWord.Checked
        then begin
                OpenDialog.Filter := 'Файл MsWord|*.doc';
                if OpenDialog.Execute
                then begin
                        Report.ExportTo(WordExport,OpenDialog.FileName);
                        ShowMessage('Експорт завершено!');
                        ModalResult := mrOk;
                end;
        end
        else}
        if IsExcel.Checked
        then begin
               Report.Export(ExcelExport);
               ShowMessage('Експорт завершено!');
               ModalResult := mrOk;
        end
        else
        if IsRtf.Checked
        then begin
               Report.Export(RtfExport);
               ShowMessage('Експорт завершено!');
               ModalResult := mrOk;
        end
        else
        if IsHtml.Checked
        then begin
               Report.Export(HtmlExport);
               ShowMessage('Експорт завершено!');
               ModalResult := mrOk;
        end;
end;

end.
