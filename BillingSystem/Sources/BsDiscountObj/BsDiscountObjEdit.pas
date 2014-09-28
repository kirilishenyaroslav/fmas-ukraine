unit BsDiscountObjEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TfrmGroupObjEdit = class(TForm)
    chRootObject: TcxCheckBox;
    NameObjEdit: TcxTextEdit;
    NameComment: TcxTextEdit;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblNameObj: TcxLabel;
    lblComment: TcxLabel;
    lblKodObj: TcxLabel;
    KodEdit: TcxTextEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupObjEdit: TfrmGroupObjEdit;

implementation

{$R *.dfm}

procedure TfrmGroupObjEdit.btnOkClick(Sender: TObject);
begin
   if KodEdit.Text='' then
   begin
      KodEdit.Style.Color:=clRed;
      ShowMessage('Ви не заповнили поле "Код об''єкту"');
      Exit;
   end;
   if NameObjEdit.Text='' then
   begin
      NameObjEdit.Style.Color:=clRed;
      ShowMessage('Ви не заповнили поле "Назва об''єкту"');
      Exit;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmGroupObjEdit.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmGroupObjEdit.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
   if ((key in ['0'..'9']) or (Key=#8)) then KodEdit.Properties.ReadOnly:=False
   else KodEdit.Properties.ReadOnly:=True;
end;

end.
