unit LogInFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  DB, IBCustomDataSet,
  Registry, cxLookAndFeelPainters, cxButtons, ExtCtrls, ActnList, jpeg,
  FIBDataSet, pFIBDataSet, FibDatabase, pFibDatabase;

type
  TLogInForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LogInEdit: TEdit;
    PasswordEdit: TEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Image1: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    function CheckSystemUser:boolean;
  public
	Count: Integer;		// количество попыток входа
  end;

var
  LogInForm: TLogInForm;

implementation

{$R *.DFM}

procedure TLogInForm.FormCreate(Sender: TObject);
var
 reg:TRegistry;
begin
  SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
  reg := TRegistry.Create;

try
  reg.RootKey:=HKEY_CURRENT_USER;

if  reg.OpenKey('\Software\ASUP\AccessLogIn\',False) then
begin
      LogInEdit.Text:=reg.ReadString('Login');
    
end
finally
reg.Free;
end;

end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

procedure TLogInForm.cxButton1Click(Sender: TObject);
var  reg:TRegistry;
begin
     reg := TRegistry.Create;
     try
        reg.RootKey:=HKEY_CURRENT_USER;

        if  reg.OpenKey('\Software\ASUP\AccessLogIn\',True) then
        begin
            reg.WriteString('Login',LoginEdit.Text);
        end
     finally
        reg.Free;
     end;

     ModalResult:=mrOk;
end;

procedure TLogInForm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrcancel;
end;

function TLogInForm.CheckSystemUser: boolean;
 {var tmpdb:TpFibDatabase;
     tmptr:TpFibTransaction;}
begin
     {tmpdb                         :=TpFibDatabase.Create(nil);
     tmpdb.SQLDialect              :=3;

     tmptr                         :=TpFibTransaction.Create(nil);
     tmptr.DefaultDatabase         :=tmpdb;
     tmpdb.DefaultTransaction      :=tmptr;
     tmpdb.DefaultUpdateTransaction:=tmptr;

     tmptr.}
end;

end.
