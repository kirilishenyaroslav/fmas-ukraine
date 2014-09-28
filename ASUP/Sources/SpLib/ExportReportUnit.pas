unit ExportReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FR_E_TXT, FR_E_RTF, frOLEExl,
  FR_Class, frRtfExp, FR_E_HTML2;

type
  TExportReportForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    RadioGroup1: TRadioGroup;
    IsWord: TRadioButton;
    IsExcel: TRadioButton;
    WordExport: TfrRtfAdvExport;
    ExcelExport: TfrOLEExcelExport;
    RTFExport: TfrRTFExport;
    IsRtf: TRadioButton;
    HTMLExport: TfrHTML2Export;
    IsHtml: TRadioButton;
    OpenDialog: TSaveDialog;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Report : TFRReport;
  end;

var
  ExportReportForm: TExportReportForm;

implementation

{$R *.dfm}

procedure TExportReportForm.OkButtonClick(Sender: TObject);
begin
//        Report.PrepareReport;
        if IsWord.Checked
        then begin
                OpenDialog.Filter := 'Файл MsWord|*.doc';
                OpenDialog.DefaultExt := 'doc';
                if OpenDialog.Execute
                then begin
                        Report.ExportTo(WordExport,OpenDialog.FileName);
                        ShowMessage('Експорт завершено!');
                        ModalResult := mrOk;
                end;
        end
        else
        if IsExcel.Checked
        then begin
                OpenDialog.Filter := 'Файл MsExcel|*.xls';
                OpenDialog.DefaultExt := 'xls';
                if OpenDialog.Execute
                then begin
                        Report.ExportTo(ExcelExport,OpenDialog.FileName);
                        ShowMessage('Експорт завершено!');
                        ModalResult := mrOk;
                end;
        end
        else
        if IsRtf.Checked
        then begin
                OpenDialog.Filter := 'Файл RTF|*.rtf';
                OpenDialog.DefaultExt := 'rtf';
                if OpenDialog.Execute
                then begin
                        Report.ExportTo(RtfExport,OpenDialog.FileName);
                        ShowMessage('Експорт завершено!');
                        ModalResult := mrOk;
                end;
        end
        else
        if IsHtml.Checked
        then begin
                OpenDialog.Filter := 'Файл HTML|*.html';
                OpenDialog.DefaultExt := 'html';
                if OpenDialog.Execute
                then begin
                        Report.ExportTo(HtmlExport,OpenDialog.FileName);
                        ShowMessage('Експорт завершено!');
                        ModalResult := mrOk;
                end;
        end;
end;

end.
