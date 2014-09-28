unit LogInFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, AccMGMT, DB, IBCustomDataSet, IBQuery,
  Registry;

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
  private
    { Private declarations }
  public
	Count: Integer;		// количество попыток входа
    InitResult:	TResultInfo;
  end;

implementation

uses MainForm, DogLoaderUnit, Un_R_file_Alex;

{$R *.DFM}

procedure TLogInForm.FormCreate(Sender: TObject);
var
    reg:TRegistry;
begin
    Caption              := Un_R_file_Alex.MAIN_CAPTION;
    Label1.Caption       := Un_R_file_Alex.MAIN_NAME;
    Label2.Caption       := Un_R_file_Alex.MAIN_PAROL;
    OkButton.Caption     := Un_R_file_Alex.MAIN_OK;
    CancelButton.Caption := Un_R_file_Alex.MAIN_CANCLE;

    Count := 0;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\4\',False) then
        begin
            LogInEdit.Text:=reg.ReadString('Gol');
        end
    finally
        reg.Free;
    end;
end;

procedure TLogInForm.OkButtonClick(Sender: TObject);
var
    reg:TRegistry;
    CurrentID_PCARD : Integer;
begin
            // увеличить число попыток входа
    inc(Count);
            // считать текущие логин и пароль
            // соединиться с системой безопасности
    try
        InitResult := fibInitConnection(LogInEdit.Text, PasswordEdit.Text);
    except on e: Exception do
        begin
            MessageBox(Handle, PChar(Un_R_file_Alex.MY_FATAL_ERROR +
                e.Message), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
            Application.Terminate;
        end;
    end;

    if InitResult.ErrorCode <> ACCMGMT_OK then        // ошибка
    begin
            // отобразить сообщение об ошибке
        MessageBox(Handle, PChar(AcMgmtErrMsg(InitResult.ErrorCode)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);

                        // если 3 раза неправильно, выйти
        if Count >= 3 then Application.Terminate
        else
        begin
            ModalResult := 0;   // иначе дать попробовать еще
            PasswordEdit.Text := '';
            exit;
        end;
    end
    else        // все пучком
    begin
        CurrentID_PCARD := GetCurrentUserIDExt;  // забрать PCARD
            // на случай совсем злых багов
        if CurrentID_PCARD = 0 then
        begin
            MessageBox(Handle, PChar(Un_R_file_Alex.MY_FATAL_ERROR_SYS), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
            PasswordEdit.Text := '';
            ModalResult := mrNone;
            exit;
        end;
    end;
    if fibCheckPermission('/ROOT/JO4', 'Belong') <> 0 then
    begin
            MessageBox(Handle, PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
            ModalResult := mrNone;
            PasswordEdit.Text := '';
            aPPLICAtion.Terminate;
    end;
    // save login
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\4\',true) then
        begin
            reg.writeString('Gol', LogInEdit.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
//    accmgmt.AcMgmtErrMsg(CheckPermission('/ROOT/JO4', 'Belong'));  показывает сообщение об ошибки
end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

end.
