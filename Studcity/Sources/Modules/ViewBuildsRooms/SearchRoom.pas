unit SearchRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons,St_ser_function,StudcityConst;

type
  TfrmSearchRoom = class(TForm)
    N_Label: TLabel;
    Label1: TLabel;
    Find_Button: TcxButton;
    Cancel_Button: TcxButton;
    N_Build_TextEdit: TcxCurrencyEdit;
    N_komnat_TextEdit: TcxTextEdit;
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure Find_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure WMNCHitTest(var M: TWMNCHitTest); message wm_NCHitTest;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Language:Integer);
    { Public declarations }
  end;

var
  frmSearchRoom: TfrmSearchRoom;
  Lang:Integer;
implementation

{$R *.dfm}

constructor TfrmSearchRoom.Create(AOwner:TComponent;Language:Integer);
begin
  inherited Create(AOwner);
  Lang:=Language;
  Find_Button.Caption:=StudcityConst.Studcity_ACTION_FIND_CONST_EX[lang];
  Cancel_Button.Caption:=StudcityConst.Studcity_ACTION_CANCEL_CONST_EX[lang];
  N_Label.Caption:=StudcityConst.ST_Builds[lang];
  Label1.Caption:=StudcityConst.ST_Rooms[lang];
end;

function IntegerCheck(const s : string) : boolean;
var
  i : integer;
  k : char;
begin
  Result := false;
  if s = '' then exit;
  for i := 1 to Length(s) do
   begin
    k := s[i];
    if not (k in ['0'..'9',#8, #13]) then k := #0;
    if k = #0 then exit;
   end;

  Result := true;
end;

procedure TfrmSearchRoom.WMNCHitTest(var M: TWMNCHitTest);
begin
  inherited; { вызов унаследованного обработчика }
  if M.Result = htClient
   then{ Мышь сидит на окне? }
    M.Result := htCaption; { Если да - то пусть Windows думает, что мышь на caption bar }
end;

procedure TfrmSearchRoom.Cancel_ButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSearchRoom.Find_ButtonClick(Sender: TObject);
begin
  if not IntegerCheck(N_Build_TextEdit.Text)then
   begin
    ShowMessage('Номер здания введен неверно!');
    N_Build_TextEdit.SetFocus;
    exit;
   end;

  if N_komnat_TextEdit.Text = '' then
   begin
    ShowMessage('Номер комнаты введен неверно!');
    N_komnat_TextEdit.SetFocus;
    exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmSearchRoom.FormShow(Sender: TObject);
begin
  N_Build_TextEdit.SetFocus;
end;

end.
