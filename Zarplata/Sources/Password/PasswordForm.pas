unit PasswordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_zGlobal_Consts, IBase,
  zMessages, zProc, Buttons, ExtCtrls;

type
  TFPassword = class(TForm)
    Actions: TActionList;
    ActionYes: TAction;
    Image5: TImage;
    pwdEdit: TcxTextEdit;
    YesBtn: TSpeedButton;
    CancelBtn: TSpeedButton;
    ActionCancel: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    pPassword:string;
  public
    constructor Create(AOwner: TComponent;APassword:string);
  end;

function ViewPassword(AOwner:TComponent;APassword:string):boolean;stdcall;
 exports ViewPassword;

implementation

{$R *.dfm}

function ViewPassword(AOwner:TComponent;APassword:string):boolean;stdcall;
var Form:TFPassword;
begin
 Form:=TFPassword.Create(Aowner,APassword);
 Result := (Form.ShowModal=mrYes);
 Form.Free;
end;

constructor TFPassword.Create(AOwner: TComponent;APassword:string);
begin
 inherited Create(AOwner);
 pPassword := APassword;
end;

procedure TFPassword.ActionYesExecute(Sender: TObject);
begin
   if pwdEdit.Text = pPassword then ModalResult := mrYes
   else ZShowMessage('Помилка','Невірний пароль',mtError,[mbOk]);
end;

procedure TFPassword.ActionCancelExecute(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

end.
