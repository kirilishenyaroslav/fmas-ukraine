unit uExportReport3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_Class, FR_E_HTML2, StdCtrls, ExtCtrls, Buttons, frxExportXLS,
  frxExportRTF, frxClass, frxExportHTML;

type
  TfmExportReport3 = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    RadioGroup1: TRadioGroup;
    IsWord: TRadioButton;
    IsExcel: TRadioButton;
    IsRtf: TRadioButton;
    IsHtml: TRadioButton;
    OpenDialog: TSaveDialog;
    HTMLExport: TfrxHTMLExport;
    RTFExport: TfrxRTFExport;
    ExcelExport: TfrxXLSExport;
    WordExport: TfrxRTFExport;
    procedure OkButtonClick(Sender: TObject);
  private
    Report: TfrxReport;
  public
    constructor Create(AOwner: TComponent; Report: TfrxReport); reintroduce;
  end;

var
  fmExportReport3: TfmExportReport3;

implementation

{$R *.dfm}

uses qFTools;

constructor TfmExportReport3.Create(AOwner: TComponent; Report: TfrxReport);
begin
    inherited Create(AOwner);

    Self.Report := Report;
end;

procedure TfmExportReport3.OkButtonClick(Sender: TObject);
begin
    //Report.PrepareReport;
        if IsWord.Checked then
        begin
            try
                Report.Export(WordExport);
                ShowMessage('Експорт завершено!');
            except
                qFErrorDialog('Даний звіт не сумісний з встановленою версією MS Word. Спробуйте экспортувати у HTML.');
            end;
        end
        else
        if IsExcel.Checked then
        begin
            try
                Report.Export(ExcelExport);
                ShowMessage('Експорт завершено!');
            except
                qFErrorDialog('Даний звіт не сумісний з встановленою версією MS Excel. Спробуйте экспортувати у HTML.');
            end;
        end
        else
        if IsRtf.Checked then
        begin
            try
                Report.Export(RTFExport);
                ShowMessage('Експорт завершено!');
            except
                qFErrorDialog('Не вдалося експортувати звіт!');
            end;
        end
        else
        if IsHtml.Checked then
        begin
            try
                Report.Export(HTMLExport);
                ShowMessage('Експорт завершено!');
            except
                qFErrorDialog('Не вдалося експортувати звіт!');
            end;
        end;
end;

end.
