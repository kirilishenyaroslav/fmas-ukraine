unit NeosnovnieAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLabel;

type
  TfmNeosnovnieAdd = class(TForm)
    cxTextEditKod: TcxTextEdit;
    cxTextEditName: TcxTextEdit;
    cxTextEditfull: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Add_neosnov(var kod, name, full_name : string) : integer;

implementation
USES Un_R_file_Alex;

{$R *.dfm}

function Add_neosnov(var kod, name, full_name : string) : integer;
var
    T : TfmNeosnovnieAdd;
begin
    T := TfmNeosnovnieAdd.Create(nil);
    T.Caption           := Un_R_file_Alex.J4_ADD_NEOSNOV_CAPTION;
    T.cxLabel1.Caption  := Un_R_file_Alex.J4_NEOSNOV_KOD;
    T.cxLabel2.Caption  := Un_R_file_Alex.J4_ADD_NEOSNOV_SHORT_NAME;
    T.cxLabel3.Caption  := Un_R_file_Alex.J4_NEOSNOV_FULL_NAME;
    T.cxButton1.Caption := Un_R_file_Alex.MY_GET;
    T.cxButton2.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.cxTextEditKod.Text  := kod;
    T.cxTextEditName.Text := name;
    T.cxTextEditfull.Text := full_name;
    if T.ShowModal = mrOk then
    begin
        kod       := T.cxTextEditKod.Text;
        name      := T.cxTextEditName.Text;
        full_name := T.cxTextEditfull.Text;
        Result := 1;
    end else
        Result := -1;
    T.Free

end;

procedure TfmNeosnovnieAdd.cxButton1Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmNeosnovnieAdd.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmNeosnovnieAdd.cxTextEditKodKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0);
end;

end.
