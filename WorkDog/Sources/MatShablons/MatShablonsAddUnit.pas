unit MatShablonsAddUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMemo, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TfrmShablonAdd = class(TForm)
    NameEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    CommentEdit: TcxMemo;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShablonAdd: TfrmShablonAdd;

implementation

{$R *.dfm}

procedure TfrmShablonAdd.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmShablonAdd.cxButton1Click(Sender: TObject);
begin
 if NameEdit.Text = '' then
 begin
   ShowMessage('¬кажить назву');
   exit;
 end;
 ModalResult := mrOk;
end;

procedure TfrmShablonAdd.cxButton3Click(Sender: TObject);
begin
 if NameEdit.Text = '' then
 begin
   ShowMessage('¬кажить назву');
   exit;
 end;
 ModalResult := mrYes;
end;

end.
