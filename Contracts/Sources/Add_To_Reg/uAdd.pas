unit uAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMemo, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCurrencyEdit;

type
  TfrmAdd = class(TForm)
    Note_memo: TcxMemo;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Date_Edit: TcxDateEdit;
    cxLabel3: TcxLabel;
    Num_Edit: TcxCurrencyEdit;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation

{$R *.dfm}

procedure TfrmAdd.cxButton_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAdd.cxButton_okClick(Sender: TObject);
begin
  If Num_Edit.Text='' then
   Begin
    showmessage('Не заполнено поле с номером!');
    Num_Edit.SetFocus;
    Exit;
   End;

  If Date_Edit.Text='' then
   Begin
    showmessage('Не поставлена дата!');
    Date_Edit.SetFocus;
    Exit;
   End;
  ModalResult:=mrOk;
end;

procedure TfrmAdd.FormCreate(Sender: TObject);
begin
  Date_Edit.EditValue:=Date;
end;

end.
