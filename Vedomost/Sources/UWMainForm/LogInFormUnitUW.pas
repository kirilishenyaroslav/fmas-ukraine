unit LogInFormUnitUW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, AccMGMT, DB, IBCustomDataSet, IBQuery,
  Registry, jpeg, ExtCtrls, ActnList;

type
  TfmLogInFormUnitUW = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LogInEdit: TEdit;
    PasswordEdit: TEdit;
    Image1: TImage;
    ActionList1: TActionList;
    SelectLang: TAction;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure WmNcHitTest(var m: TMessage); message WM_NCHITTEST;
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
  private
    index_lang : integer;
  public
    Count: Integer;     // количество попыток входа
    InitResult : TResultInfo;
  end;


implementation

uses UWMainForm, UWResourcesUnit;

{$R *.DFM}

procedure TfmLogInFormUnitUW.FormCreate(Sender: TObject);
var
    reg:TRegistry;
//    r: HRGN;
begin
//    r := CreateEllipticRgn(0, 140, 350, 205);
//    r := CreateEllipticRgn(50, 0, 600, 100);
//    r := CreatePolygonRgn( 0, 300);
//    CombineRgn(r, r, CreateEllipticRgn(50, 195, 450, 300), RGN_OR);
//    SetWindowRgn(Handle, r, true);

    LoadCaption;

    Count := 0;

    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\Nigol\v\',False) then
        begin
            LogInEdit.Text:=reg.ReadString('Gol');
        end
    finally
        reg.Free;
    end;
end;

procedure TfmLogInFormUnitUW.OkButtonClick(Sender: TObject);
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
;//            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR + e.Message, mtError,[mbOk]);
                update;
            Application.Terminate;
        end;
    end;

    if InitResult.ErrorCode <> ACCMGMT_OK then        // ошибка
    begin
            // отобразить сообщение об ошибке
//        MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, AcMgmtErrMsg(InitResult.ErrorCode),mtError,[mbOk]);
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
//            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FATAL_ERROR_SYS, mtError,[mbOk]);
            update;
            PasswordEdit.Text := '';
            ModalResult := mrNone;
            exit;
        end;
    end;
    if fibCheckPermission('/ROOT/Bank', 'Belong') <> 0 then
    begin
//            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_ERROR_DONT_WORK, mtError,[mbOk]);
            update;
            ModalResult := mrNone;
            PasswordEdit.Text := '';
            aPPLICAtion.Terminate;
    end;
    // save login
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\Nigol\v\',true) then
        begin
            reg.writeString('Gol', LogInEdit.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmLogInFormUnitUW.FormShow(Sender: TObject);
begin
    if LogInEdit.Text<>'' then PasswordEdit.SetFocus;
end;

procedure TfmLogInFormUnitUW.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNone;
    Close;
end;

procedure TfmLogInFormUnitUW.WmNcHitTest(var m: TMessage);
begin
    m.Result:=HTCAPTION;
end;

procedure TfmLogInFormUnitUW.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    Label1.Caption       := UWResourcesUnit.MY_CONST_NAME[index_lang];
    Label2.Caption       := UWResourcesUnit.MY_CONST_PAROL[index_lang];
    OkButton.Caption     := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    CancelButton.Caption := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
//    CAPTION              := Un_R_file_Alex.MY_IDENTIFICATION+ ' ' + Un_R_file_Alex.BANK_SYSTEM;

end;

procedure TfmLogInFormUnitUW.SelectLangExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

end.
