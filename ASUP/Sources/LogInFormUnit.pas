
{ -$Id: LogInFormUnit.pas,v 1.10 2009/10/27 15:31:23 mzagurskaya Exp $}
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
    StdCtrls, Buttons, PersonalCommon, AccMGMT, DB, IBCustomDataSet, IBQuery,
    Registry, ExtCtrls, SysAdmin;

type
    TLogInForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        Label2: TLabel;
        LogInEdit: TEdit;
        PasswordEdit: TEdit;
        Timer1: TTimer;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
    private
    { Private declarations }
    public
        Count: Integer; // количество попыток входа
        AccResult: TResultInfo;
    end;

var
    LogInForm: TLogInForm;

implementation

{$R *.DFM}

procedure TLogInForm.FormCreate(Sender: TObject);
var
    reg: TRegistry;
    i: Integer;
begin
    AdminMode := False;
    Count := 0;
    reg := TRegistry.Create;

    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\LogIn\', False) then
        begin
            LogInEdit.Text := reg.ReadString('Login');
            try
                PasswordEdit.Text := reg.ReadString('Password');
            except
            end;
        end
    finally
        reg.Free;
    end;

    for i := 1 to ParamCount do
    begin
        if Pos('login:', ParamStr(i)) = 1 then
            LogInEdit.Text := Copy(ParamStr(i), Length('login:') + 1, 200);
        if Pos('password:', ParamStr(i)) = 1 then
            PasswordEdit.Text := Copy(ParamStr(i), Length('password:') + 1, 200);
    end;
end;

procedure TLogInForm.OkButtonClick(Sender: TObject);
var
    reg: TRegistry;
begin
 // увеличить число попыток входа


    // считать текущие логин и пароль
    CurrentLogin := LoginEdit.Text;
    CurrentPassword := PasswordEdit.Text;

    reg := TRegistry.Create;

    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\LogIn\', True) then
        begin
            reg.WriteString('Login', CurrentLogin);
        end
    finally
        reg.Free;
    end;

    // соединиться с системой безопасности
    try
        AccResult := fibInitConnection(CurrentLogin, CurrentPassword);
    except on e: Exception do
        begin
            MessageDlg('Фатальна помилка у системі безпеки : ' +
                e.Message, mtError, [mbOk], 0);
            ModalResult := mrCancel;
            Exit;
        end;
    end;

    if AccResult.ErrorCode <> ACCMGMT_OK then // ошибка
    begin
   // отобразить сообщение об ошибке
        MessageDlg(AcMgmtErrMsg(AccResult.ErrorCode), mtError, [mbOk], 0);

            // если 3 раза неправильно, выйти
        if Count >= 3 then
            Application.Terminate
        else inc(Count);
        begin
            ModalResult := 0; // иначе дать попробовать еще
            Exit;
        end;
    end
    else // все пучком
    begin
        CurrentID_PCARD := fibGetCurrentUserInfo.UserIdExt; // забрать PCARD
        CurrentUserName := fibGetCurrentUserInfo.UserFullName + ' (' +
            fibGetCurrentUserInfo.UserName + ')';
   // на случай совсем злых багов
        if CurrentID_PCARD = 0 then
        begin
            MessageDlg('Помилка у системі безпеки!', mtError, [mbOk], 0);
            ModalResult := mrCancel;
            Exit;
        end;

   //Если у пользователя нет права на вход систему, выходим
        if fibCheckPermission('/ROOT/ASUP', 'Belong') <> 0 then
        begin
            MessageDlg('Ви не маєте прав доступу до цієї системи!', mtError, [mbOK], 0);
            Update;
            PasswordEdit.Text := '';
            ModalResult := mrCancel;
            Exit;
        end;

       // получаем группу пользователя

        if CheckAccess('/ROOT/Otdel_Kadrov', 'Belong') = 0 then Id_Otdel := 1;

        if CheckAccess('/ROOT/OTIZ', 'Belong') = 0 then Id_Otdel := 2;

        if CheckAccess('/ROOT/AdminGroup', 'Belong') = 0 then
            AdminMode := True
        else
            AdminMode := False;

         // установить украинскую раскладку
        LoadKeyboardLayout('00000422', KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
    end;
    ModalResult := mrOk;
end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
    if LogInEdit.Text <> '' then PasswordEdit.SetFocus;
    if PasswordEdit.Text <> '' then Timer1.Enabled := True;
end;

procedure TLogInForm.Timer1Timer(Sender: TObject);
begin
    if PasswordEdit.Text <> '' then
        OkButtonClick(OkButton);
    Timer1.Enabled := False;
end;

end.
