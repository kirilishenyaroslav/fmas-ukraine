
{ -$Id: LogInFormUnit.pas,v 1.2 2006/03/28 14:53:04 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                    Модуль "Идентификация пользователя"                       }
{  Запрос имени и пароля пользователя, связь с системой разграничения доступа  }
{                                                  ответственный: Олег Волков  }

unit LogInFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  DB, IBCustomDataSet,
  Registry, consts;

type
  TLogInForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LogInEdit: TEdit;
    PasswordEdit: TEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
	Count: Integer;		// количество попыток входа
  end;

var
  LogInForm: TLogInForm;

implementation

uses DMUnit, MainUnit, IBase, SysAdmin;

{$R *.DFM}

procedure TLogInForm.FormCreate(Sender: TObject);
var
 reg:TRegistry;
begin
  reg:=TRegistry.Create;

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

procedure TLogInForm.OkButtonClick(Sender: TObject);
var
    reg:TRegistry;
begin
    DM.MainDatabase.Close;
    DM.MainDatabase.Params.Clear;
    DM.MainDatabase.DatabaseName := DM.DBPath;
    DM.MainDatabase.Params.Add('user_name=' + LogInEdit.Text);
    DM.MainDatabase.Params.Add('password=' + PasswordEdit.Text);

    try

        Dm.MainDatabase.Open;

        Dm.ReadTransaction.DefaultDatabase := dm.MainDatabase;
        Dm.WriteTransaction.DefaultDatabase := dm.MainDatabase;


    except on E:Exception
        do begin
            MessageDlg('Ошибка: ' + e.Message + '"', mtError, [mbOk], 0);
            ModalResult := mrCancel;
            Application.Terminate;
            exit;
        end
    end;

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

    InitializaAdminSystem(Application.MainForm, TISC_DB_Handle(DM.MainDatabase.Handle), 555, -1, False);
    ModalResult := mrOk;
    //MainForm := TMainForm.Create(Self);
    Hide;

    MainForm.StatusBar.Panels[0].Text := 'БД: ' + DM.DBPath;
    MainForm.StatusBar.Panels[1].Text := 'ПО: ' + DM.ProgramPath;

    DM.CurrentLogin := LoginEdit.Text;
    DM.CurrentPassword := PasswordEdit.Text;

    MainForm.ShowModal;
    Close;
end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

procedure TLogInForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
