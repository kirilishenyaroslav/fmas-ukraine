unit u_UO_SP_TYPE_DISC_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit;

type
  Tfm_UO_SP_TYPE_DISC_EDIT = class(TForm)
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
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinEditNPPKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_UO_SP_TYPE_DISC_EDIT: Tfm_UO_SP_TYPE_DISC_EDIT;

implementation

uses u_UO_SP_TYPE_DISC;

{$R *.dfm}


procedure Tfm_UO_SP_TYPE_DISC_EDIT.ActionOKExecute(Sender: TObject);
begin
    if trim(cxTextEditName.Text)='' then
    begin
        ShowMessage('Заповніть назву!');
        cxTextEditName.SetFocus;
        exit;
    end;

    if trim(cxTextEditShortName.Text)='' then
    begin
        ShowMessage('Заповніть коротку назву!');
        cxTextEditShortName.SetFocus;
        exit;
    end;
    if trim(cxSpinEditKod.Value)='' then
    begin
        ShowMessage('Заповніть код!');
        cxSpinEditKod.SetFocus;
        exit;
    end;

    if trim(cxSpinEditNPP.Value)='' then
    begin
        ShowMessage('Заповніть номер!');
        cxSpinEditNPP.SetFocus;
        exit;
    end;
    ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_TYPE_DISC_EDIT.ActionCanselExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_TYPE_DISC_EDIT.FormCreate(Sender: TObject);
begin
    if Tfm_UO_SP_TYPE_DISC(self.Owner).cap=0 then
        Caption:='Додати';
    if Tfm_UO_SP_TYPE_DISC(self.Owner).cap=1 then
        Caption:='Змінити';
    if Tfm_UO_SP_TYPE_DISC(self.Owner).cap=2 then
        Caption:='Перегляд';
        
    ActionOK.Caption:='Прийняти';
    ActionCansel.Caption:='Відміна';

    ActionOK.Hint:='Прийняти';
    ActionCansel.Hint:='Відміна';

    cxLabelName.Caption :='Назва';
    cxLabelShortName.Caption :='Коротка назва';
    cxLabelKod.Caption :='Код';
    cxLabelNPP.Caption :='Номер';
    cxLabel1.Caption   :='Кіл-ть годин';
end;

procedure Tfm_UO_SP_TYPE_DISC_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
    x: Integer;
begin
    if not (key in ['0'..'9', #8]) then
        key := #0;
    x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
    if ( x>9)then  key := #0;
end;

procedure Tfm_UO_SP_TYPE_DISC_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
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

procedure Tfm_UO_SP_TYPE_DISC_EDIT.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key < '0') or (key>'9') then key := chr(0);
end;

end.
