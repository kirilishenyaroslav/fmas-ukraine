unit DateReeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxGroupBox,
  cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TDateReeForm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ReeDateEdit: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReeDateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateReeForm: TDateReeForm;

implementation
uses DogLoaderUnit, LangUnit;
{$R *.dfm}

procedure TDateReeForm.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
end;

procedure TDateReeForm.OKButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TDateReeForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDateReeForm.FormShow(Sender: TObject);
begin
 ReeDateEdit.Date := now;
 ReeDateEdit.SetFocus;
end;

procedure TDateReeForm.ReeDateEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then OkButton.SetFocus;
end;

end.
