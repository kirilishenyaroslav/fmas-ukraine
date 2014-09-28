unit uLoginPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, ExtCtrls, Buttons;

type
  TFormLoginPI = class(TForm)
    cxTextEditLogin: TcxTextEdit;
    cxTextEditPassword: TcxTextEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TSpeedButton;
    cxButtonCansel: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    CloseSpeedButton: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CloseSpeedButtonClick(Sender: TObject);
  private
    Id_LangLog :integer;
    procedure inicCaption;
  public
    { Public declarations }
  end;

var
  FormLoginPI: TFormLoginPI;
implementation
uses
    uPI_Constants,uPI_Resources,registry;
{$R *.dfm}

{ TFormLogin }

procedure TFormLoginPI.FormCreate(Sender: TObject);
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
        if reg.OpenKey('\Software\PI\Data\',false) then
        begin
           cxTextEditLogin.Text :=reg.ReadString('Login');
        end;
     finally
         reg.Free;
     end;
end;

procedure TFormLoginPI.inicCaption;
begin
   TFormLoginPI(self).Caption := nFormLogin_Caption[Id_LangLog];

   //cxLabelLogin.Caption     := nLabelLogin[Id_LangLog];
   //cxLabelPassword.Caption  := nLabelPassword[Id_LangLog];

   {ActionOK.Caption         :=nActiont_OK[Id_LangLog];
   ActionCansel.Caption     :=nActiont_Cansel[Id_LangLog]; 
   ActionOK.Hint            :=nHintActiont_OK[Id_LangLog];
   ActionCansel.Hint        :=nHintActiont_Cansel[Id_LangLog]; }
end;

procedure TFormLoginPI.ActionOKExecute(Sender: TObject);
var
  reg       :TRegistry;
begin
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PI\Data\',true) then
        begin
           reg.WriteString('Login', cxTextEditLogin.Text);
        end;
     finally
         reg.Free;
     end;

   ModalResult:=mrOk;
end;

procedure TFormLoginPI.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormLoginPI.FormShow(Sender: TObject);
begin
   if Trim(cxTextEditLogin.Text)<>''
    then cxTextEditPassword.SetFocus;
end;

procedure TFormLoginPI.SpeedButton1Click(Sender: TObject);
begin
    ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
end;

procedure TFormLoginPI.CloseSpeedButtonClick(Sender: TObject);
begin
    Close;
end;

end.
