unit sp_bank_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ExtCtrls;

type
  TFsp_bank_ADD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NameEdit: TcxTextEdit;
    CityEdit: TcxTextEdit;
    mfoEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MFOEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure CityEditKeyPress(Sender: TObject; var Key: Char);
    procedure mfoEditKeyPress(Sender: TObject; var Key: Char);
  public
    SkipChecks : boolean;
    id_bank : int64;
    MResult : string;
  end;



implementation
uses BaseTypes, sp_bank_form;
{$R *.DFM}

procedure TFsp_bank_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFsp_bank_ADD.OKButtonClick(Sender: TObject);
begin
 if SkipChecks then begin
  MResult := 'ok';
  ModalResult := mrOk;
  exit;
 end;
 if (NameEdit.Text = '') then begin
  agShowMessage('Необхідно ввести назву банку.');
  exit;
 end;
 if (MfoEdit.Text = '') then begin
  agShowMessage('Необхідно ввести МФО банку.');
  exit;
 end;
 (Owner as TFsp_bank).Query.Close;

 (Owner as TFsp_bank).Query.SQL.Text := 'SELECT * FROM PROC_PUB_SP_BANK_CHECK_DUB(' + IntToStr(id_bank) + ', ' + QuotedStr(MFOEdit.Text) + ')';
 (Owner as TFsp_bank).Query.ExecQuery;

 if (Owner as TFsp_bank).Query.FieldByName('IS_EXISTS').AsInteger = 1 then
 begin
  (Owner as TFsp_bank).Query.Close;
  agShowMessage('Введений МФО вже існує.');
  exit;
 end;
 (Owner as TFsp_bank).Query.Close;
 // ShowMessage(IntTostr((Owner as TFsp_bank).Query.FieldByName('IS_EXISTS').AsInteger));
 mResult := 'ok';
 ModalResult := mrOk;
 Close;
end;

procedure TFsp_bank_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
end;

procedure TFsp_bank_ADD.MFOEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then begin
  Key := 0;
  OkButton.SetFocus;
 end;
end;

procedure TFsp_bank_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

procedure TFsp_bank_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then MfoEdit.SetFocus;
end;

procedure TFsp_bank_ADD.CityEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

procedure TFsp_bank_ADD.mfoEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then CityEdit.SetFocus;
end;

end.
