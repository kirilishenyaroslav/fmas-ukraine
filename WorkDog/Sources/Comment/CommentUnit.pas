unit CommentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, LoadDogManedger;

type
  TfrmComment = class(TForm)
    cxMemo: TcxMemo;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
  private
    { Private declarations }
  public
  comment_text: String;
    { Public declarations }
  end;

  function Comment(AOwner : TComponent; text: String; Mode: String):Variant; stdcall;
  exports Comment;
  
var
  frmComment: TfrmComment;

implementation

{$R *.dfm}

function Comment(AOwner : TComponent; text: String; Mode: String):Variant;
var
  F: TfrmComment;
begin
  F := TfrmComment.Create(Aowner);
  F.comment_text := text;
  f.cxMemo.Text := F.comment_text;
  if (mode = 'prosmotr') then  
  begin
    f.cxButton_ok.Visible := false;
    f.cxMemo.Properties.ReadOnly := true;
  end;  
  F.ShowModal;
  Comment := F.comment_text;
  F.Free;
end;

procedure TfrmComment.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmComment.cxButton_okClick(Sender: TObject);
begin
  comment_text :=  Trim(cxMemo.Text);
  Close;
end;

end.
