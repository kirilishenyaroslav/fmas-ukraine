unit DogDataInputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons,
  cxCheckBox;

type
  TDateInputForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DateEdit: TcxDateEdit;
    Label1: TLabel;
    NumEdit: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateInputForm: TDateInputForm;

implementation
uses DogLoaderUnit, LangUnit;
{$R *.dfm}

procedure TDateInputForm.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TDateInputForm.cxButton1Click(Sender: TObject);
begin
 if DateEdit.Text = '' then begin
  ShowMessage('¬ведите дату.');
  exit;
 end;
 ModalResult := mrOk; 
end;

procedure TDateInputForm.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
 DateEdit.Date := now;
end;

procedure TDateInputForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
 NumEdit.Enabled := cxCheckBox1.Checked;
 if NumEdit.Enabled then NumEdit.Style.Color := clMoneyGreen else NumEdit.Style.Color := clSilver;
end;

end.
