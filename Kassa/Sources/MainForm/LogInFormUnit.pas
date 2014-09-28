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
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Count: Integer;     // количество попыток входа
//    s : TResultInfo;
    InitResult : TResultInfo;
  end;

var
  LogInForm: TLogInForm;

implementation

uses MainFormKassa, dogLoaderUnit, Un_R_file_Alex;

{$R *.DFM}

procedure TLogInForm.FormCreate(Sender: TObject);
var
 reg:TRegistry;
begin
    Label1.Caption       := Un_R_file_Alex.MY_NAME;
    Label2.Caption       := Un_R_file_Alex.MY_PAROL;
    OkButton.Caption     := Un_R_file_Alex.MY_OTMENA;
    CancelButton.Caption := Un_R_file_Alex.MY_OK;
    cAPTION              := Un_R_file_Alex.MY_IDENTIFICATION;
    Count := 0;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\',False) then
        begin
            LogInEdit.Text:=reg.ReadString('Gol');
        end
    finally
        reg.Free;
    end;
end;

procedure TLogInForm.OkButtonClick(Sender: TObject);
var
//  InitResult:   Integer;
  reg:TRegistry;
  CurrentID_PCARD : Integer;
begin
            // увеличить число попыток входа
    inc(Count);
            // считать текущие логин и пароль
            // соединиться с системой безопасности
//    InitResult := -1;
    InitResult.DBHandle := nil;
    InitResult.ErrorCode:=-1;
    try
//        InitResult := InitConnection(LogInEdit.Text, PasswordEdit.Text);
        InitResult := fibInitConnection(LogInEdit.Text, PasswordEdit.Text);
    except on e: Exception do
        begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR, mtError,[mbOk]);
            Application.Terminate;
            Update;
        end;
    end;
//    if InitResult <> ACCMGMT_OK then        // ошибка
    if InitResult.ErrorCode <> ACCMGMT_OK then
    begin
            // отобразить сообщение об ошибке
        MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, AcMgmtErrMsg(InitResult.ErrorCode) ,mtError,[mbOk]);
        Update;
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
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR_SYS, mtError,[mbOk]);
            PasswordEdit.Text := '';
            ModalResult := mrNone;
            Update;
            exit;
        end;
    end;
    if fibCheckPermission('/ROOT/Kassa', 'Belong') <> 0 then
    begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_ERROR_DONT_WORK, mtError,[mbOk]);
            Update;
            ModalResult := mrNone;
            PasswordEdit.Text := '';
            aPPLICAtion.Terminate;
    end;
    // save login
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\',true) then
        begin
            reg.writeString('Gol', LogInEdit.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

procedure TLogInForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNone;
    Close;
end;

end.
