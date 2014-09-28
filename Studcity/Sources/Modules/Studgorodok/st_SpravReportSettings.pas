unit st_SpravReportSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cxRadioGroup, cxControls, cxGroupBox;

type
  TfrmSpravReportSettings = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Payers_RadioButton: TcxRadioButton;
    Livers_RadioButton: TcxRadioButton;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxDateEdit1: TcxDateEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Payers_RadioButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSpravReportSettings.OkButtonClick(Sender: TObject);
begin
ModalResult :=mrOk;
end;

procedure TfrmSpravReportSettings.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSpravReportSettings.Payers_RadioButtonClick(Sender: TObject);
begin
cxDateEdit1.SetFocus;
end;

end.
