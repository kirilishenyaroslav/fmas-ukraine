unit Nomer_Search_Build;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCurrencyEdit;

type
  TNomer_Search_BuildForm = class(TForm)
    N_Label: TLabel;
    Find_Button: TcxButton;
    Cancel_Button: TcxButton;
    Label1: TLabel;
    N_Build_TextEdit: TcxCurrencyEdit;
    N_komnat_TextEdit: TcxCurrencyEdit;
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure Find_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N_Build_TextEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_komnat_TextEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure WMNCHitTest(var M: TWMNCHitTest); message wm_NCHitTest;
  public
    { Public declarations }
  end;

var
  Nomer_Search_BuildForm: TNomer_Search_BuildForm;

implementation

uses Math;

{$R *.dfm}

function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

procedure TNomer_Search_BuildForm.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited; { вызов унаследованного обработчика }
if M.Result = htClient then{ Мышь сидит на окне? }
M.Result := htCaption; { Если да - то пусть Windows думает, что мышь на caption bar }
end;

procedure TNomer_Search_BuildForm.Cancel_ButtonClick(Sender: TObject);
begin
close;
end;

procedure TNomer_Search_BuildForm.Find_ButtonClick(Sender: TObject);
begin
if IntegerCheck(N_Build_TextEdit.Text)=false then begin
ShowMessage('Номер здания введен неверно');
N_Build_TextEdit.SetFocus;
exit;
end;
if IntegerCheck(N_komnat_TextEdit.Text)=false then begin
ShowMessage('Номер комнаты введен неверно');
N_komnat_TextEdit.SetFocus;
exit;
end;
ModalResult:=mrOk;
end;

procedure TNomer_Search_BuildForm.FormShow(Sender: TObject);
begin
 Nomer_Search_BuildForm.N_Build_TextEdit.SetFocus;
end;

procedure TNomer_Search_BuildForm.N_Build_TextEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//If N_Build_TextEdit.GetTextLen = 1 then
 N_komnat_TextEdit.SetFocus;
end;

procedure TNomer_Search_BuildForm.N_komnat_TextEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
If N_komnat_TextEdit.GetTextLen = 3 then  Find_Button.SetFocus;
end;

end.
