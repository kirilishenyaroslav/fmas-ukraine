unit uLoginPrK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList;

type
  TFormLoginPrK = class(TForm)
    cxLabelLogin: TcxLabel;
    cxLabelPassword: TcxLabel;
    cxTextEditLogin: TcxTextEdit;
    cxTextEditPassword: TcxTextEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Id_LangLog :integer;
    procedure inicCaption;
  public
    { Public declarations }
  end;

var
  FormLoginPrK: TFormLoginPrK;
implementation
uses
    uConstants,uPrK_Resources,registry;
{$R *.dfm}

{ TFormLogin }

procedure TFormLoginPrK.FormCreate(Sender: TObject);
var
 reg               :TRegistry;
begin
   Id_LangLog:=SelectLanguage;
   inicCaption;
   cxTextEditLogin.Text    :='';
   cxTextEditPassword.Text :='';

   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\Data\',false) then
        begin
           cxTextEditLogin.Text :=reg.ReadString('Login');
        end;
     finally
         reg.Free;
     end;
end;

procedure TFormLoginPrK.inicCaption;
begin
   TFormLoginPrK(self).Caption := nFormLogin_Caption[Id_LangLog];

   cxLabelLogin.Caption     := nLabelLogin[Id_LangLog];
   cxLabelPassword.Caption  := nLabelPassword[Id_LangLog];

   ActionOK.Caption         :=nActiont_OK[Id_LangLog];
   ActionCansel.Caption     :=nActiont_Cansel[Id_LangLog]; 
   ActionOK.Hint            :=nHintActiont_OK[Id_LangLog];
   ActionCansel.Hint        :=nHintActiont_Cansel[Id_LangLog];
end;

procedure TFormLoginPrK.ActionOKExecute(Sender: TObject);
var
  reg       :TRegistry;
begin
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\Data\',true) then
        begin
           reg.WriteString('Login', cxTextEditLogin.Text);
        end;
     finally
         reg.Free;
     end;

   ModalResult:=mrOk;
end;

procedure TFormLoginPrK.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormLoginPrK.FormShow(Sender: TObject);
begin
   if Trim(cxTextEditLogin.Text)<>''
    then cxTextEditPassword.SetFocus;
end;

end.
