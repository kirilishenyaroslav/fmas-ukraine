
{ -$Id: LogInFormUnit.pas,v 1.5 2010/10/29 09:52:59 mzagurskaya Exp $}
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
    StdCtrls, Buttons, AccMGMT, DB, IBCustomDataSet, IBQuery,
    Registry, ExtCtrls;

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

uses qFTools, uFormControl;

procedure TLogInForm.FormCreate(Sender: TObject);
var
    reg: TRegistry;
    i: Integer;
begin
    Count := 0;
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\LogIn\', False) then
            LogInEdit.Text := reg.ReadString('Login');
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
    CurrentID_PCARD: Integer;
begin
 // увеличить число попыток входа
    inc(Count);

    reg := TRegistry.Create;

    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\LogIn\', True) then
        begin
            reg.WriteString('Login', LoginEdit.Text);
        end
    finally
        reg.Free;
    end;
    // соединиться с системой безопасности
    try
        AccResult := fibInitConnection(LogInEdit.Text, PasswordEdit.Text);
    except on e: Exception do
        begin
            qFErrorDialog('Фатальна помилка у системі безпеки : ' +
                e.Message);
            ModalResult := mrCancel;
            Exit;
        end;
    end;

    if AccResult.ErrorCode <> ACCMGMT_OK then // ошибка
    begin
   // отобразить сообщение об ошибке
        qFErrorDialog(AcMgmtErrMsg(AccResult.ErrorCode));

            // если 3 раза неправильно, выйти
        if Count >= 3 then
            Application.Terminate
        else
            ModalResult := 0; // иначе дать попробовать еще
    end
    else if (fibGetCurrentUserInfo.UserIdExt = 0) {// все пучком}
    then
        begin
            MessageDlg('Помилка у системі безпеки!', mtError, [mbOk], 0);
            ModalResult := mrCancel;
            Exit;
    end
    else if fibCheckPermission('/ROOT/Plan_Shtat_Ras', 'View') <> 0 then
    begin
        qFErrorDialog('У вас немає прав на перегляд штатного розкладу!');
        ModalResult := 0; // дать попробовать еще
    end
    else
    begin
        Acc_Id_User := GetUserId;
        ModalResult := mrOk;
    end;
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

