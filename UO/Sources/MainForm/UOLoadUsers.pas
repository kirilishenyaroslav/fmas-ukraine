unit UOLoadUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, AccMGMT, DB, IBCustomDataSet, IBQuery,
  Registry, jpeg, ExtCtrls;

type
  TfmUOLoadUsers = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LogInEdit: TEdit;
    PasswordEdit: TEdit;
    Image1: TImage;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Count: Integer;     // количество попыток входа
    InitResult : TResultInfo;
  end;


implementation

uses UOMainForm, dogLoaderUnit, Un_R_file_Alex;

{$R *.DFM}

procedure TfmUOLoadUsers.FormCreate(Sender: TObject);
var
    reg:TRegistry;
begin
    Count := 0;
    Label1.Caption       := Un_R_file_Alex.MY_NAME;
    Label2.Caption       := Un_R_file_Alex.MY_PAROL;
    OkButton.Caption     := Un_R_file_Alex.MY_OTMENA;
    CancelButton.Caption := Un_R_file_Alex.MY_OK;
    CAPTION              := Un_R_file_Alex.MY_IDENTIFICATION+ ' ' + 'Учбовий відділ';

    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\UO\Data\',False) then
        begin
            LogInEdit.Text:=reg.ReadString('Login');
        end
    finally
        reg.Free;
    end;
end;

procedure TfmUOLoadUsers.OkButtonClick(Sender: TObject);
var
    reg:TRegistry;
    CurrentID_PCARD : Integer;
begin
            // увеличить число попыток входа
    inc(Count);
            // считать текущие логин и пароль
            // соединиться с системой безопасности
    InitResult.DBHandle := nil;
    InitResult.ErrorCode:=-1;
    try
        InitResult := FibInitConnection(LogInEdit.Text, PasswordEdit.Text);
    except on e: Exception do
        begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR +
                e.Message, mtError,[mbOk]);
                update;
            Application.Terminate;
        end;
    end;

    if InitResult.ErrorCode <> ACCMGMT_OK then        // ошибка
    begin
            // отобразить сообщение об ошибке
        MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, AcMgmtErrMsg(InitResult.ErrorCode),mtError,[mbOk]);
        update;
                        // если 3 раза неправильно, выйти
        if Count >= 3 then Application.Terminate
        else
        begin
            PasswordEdit.Text := '';
            ModalResult := 0;   // иначе дать попробовать еще
            exit;
        end;
    end
    else        // все пучком
    begin

        CurrentID_PCARD   := GetCurrentUserIDExt;  // забрать PCARD
        // на случай совсем злых багов
        if CurrentID_PCARD = 0 then
        begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR_SYS, mtError,[mbOk]);
            update;
            PasswordEdit.Text := '';
            ModalResult := mrNone;
            exit;
        end;
    end;
    if fibCheckPermission('/ROOT/UO', 'Belong') <> 0 then
    begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_ERROR_DONT_WORK, mtError,[mbOk]);
            update;
            ModalResult := mrNone;
            PasswordEdit.Text := '';
            aPPLICAtion.Terminate;
    end;
    // save login
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\UO\Data\',true) then
        begin
            reg.writeString('Login', LogInEdit.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmUOLoadUsers.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

procedure TfmUOLoadUsers.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNone;
    Close;
end;

end.
