unit ImportBankDataOtrNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  ExtCtrls,ImportBank_DM, TiMessages;

type
  TImportBankDataOtrNaklForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    DateOtrNaklDateEdit: TcxDateEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure YesButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportBankDataOtrNaklForm: TImportBankDataOtrNaklForm;

implementation

{$R *.dfm}

procedure TImportBankDataOtrNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TImportBankDataOtrNaklForm.YesButtonClick(Sender: TObject);
begin
  if (DateOtrNaklDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер за порядком!',mtWarning,[mbOK]);
   DateOtrNaklDateEdit.SetFocus;
   Exit;
  end;
  ModalResult := mrOk;
end;

end.
