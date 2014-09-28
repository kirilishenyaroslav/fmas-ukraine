unit u_UO_SP_SEMESTR_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit;

type
  Tfm_UO_SP_SEMESTR_EDIT = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelKod: TcxLabel;
    cxSpinEditKod: TcxSpinEdit;
    cxLabelNPP: TcxLabel;
    cxSpinEditNPP: TcxSpinEdit;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinEditNPPKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditKodKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_UO_SP_SEMESTR_EDIT: Tfm_UO_SP_SEMESTR_EDIT;

implementation

uses u_UO_SP_SEMESTR;

{$R *.dfm}


procedure Tfm_UO_SP_SEMESTR_EDIT.ActionOKExecute(Sender: TObject);
begin

   if trim(cxTextEditName.Text)='' then
   begin
     ShowMessage('Çàïîâí³òü íàçâó!');
     cxTextEditName.SetFocus;
     exit;
   end;

   if trim(cxTextEditShortName.Text)='' then
   begin
     ShowMessage('Çàïîâí³òü êîğîòêó íàçâó!');
     cxTextEditShortName.SetFocus;
     exit;
   end;
   if trim(cxSpinEditKod.Value)='' then
   begin
     ShowMessage('Çàïîâí³òü êîä!');
     cxSpinEditKod.SetFocus;
     exit;
   end;

   if trim(cxSpinEditNPP.Value)='' then
   begin
     ShowMessage('Çàïîâí³òü íîìåğ!');
     cxSpinEditNPP.SetFocus;
     exit;
   end;
  ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_SEMESTR_EDIT.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_SEMESTR_EDIT.FormCreate(Sender: TObject);
begin
    if Tfm_UO_SP_SEMESTR(self.Owner).cap=0 then
        Caption:='Äîäàòè';
    if Tfm_UO_SP_SEMESTR(self.Owner).cap=1 then
        Caption:='Çì³íèòè';
    if Tfm_UO_SP_SEMESTR(self.Owner).cap=2 then
        Caption:='Ïåğåãëÿä';

    ActionOK.Caption:='Ïğèéíÿòè';
    ActionCansel.Caption:='Â³äì³íà';

    ActionOK.Hint:='Ïğèéíÿòè';
    ActionCansel.Hint:='Â³äì³íà';

    cxLabelName.Caption :='Íàçâà';
    cxLabelShortName.Caption :='Êîğîòêà íàçâà';
    cxLabelKod.Caption :='Êîä';
    cxLabelNPP.Caption :='Íîìåğ';
end;

procedure Tfm_UO_SP_SEMESTR_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
x: Integer;
begin
  if not (key in ['0'..'9', #8]) then
    key := #0;
  x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
  if ( x>9)then  key := #0;
end;

procedure Tfm_UO_SP_SEMESTR_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
  var Key: Char);
var
x : Integer;
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
  x:=Length(IntToSTR(cxSpinEditKod.Value))+1;
  if (x>9)then
            key := #0;
end;

end.
