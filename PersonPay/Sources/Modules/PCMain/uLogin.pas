unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxImage, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls,
  jpeg, FIBDatabase, pFIBDatabase, DB, cxDBEdit, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, Registry, AccMgmt, uMainFanc, uPwdDeCrypt, IniFiles,
  uMainPerem;


type
  TuLoginForm = class(TForm)
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    cxUserPwd: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    dsDataSourse: TDataSource;
    ReadTr: TpFIBTransaction;
    ComboBox: TcxComboBox;
    WriteTr: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    cxUserName: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Count: Integer;
    USER_NAME: string;
    USER_ID: int64;
    USER_ID_PCARD: int64;
    USER_FIO: string;
    LResult: TResultInfo;
    ok, id, fu:Integer;
    ID_REG:Integer;
    name: string;
    reg_uch: array of array of Variant;
    PERIOD:TDateTime;
    SCH_ROOT:Integer;
  end;

var
  uLoginForm: TuLoginForm;

implementation

{$R *.dfm}
uses uMain;

// 1-контракты , 2- студгородок, 3 - контракты(валюта)

procedure TuLoginForm.FormCreate(Sender: TObject);
var
 i:Integer;
 reg: TRegistry;
 IniFile : TIniFile;
 pwd, APP_PATH, DB_PATH,DB_SERVER_NAME, DB_USER, DB_PASSWORD: string;
begin
  //достаем форму учета и период
  DataBase.Close;
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';
  if not FileExists(APP_PATH + 'CONFIG.INI') then exit;
  IniFile := TIniFile.Create(APP_PATH + 'CONFIG.INI');
  try
   DB_PATH        := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
   DB_SERVER_NAME := IniFile.ReadString('CONNECTION', 'Server', '');
   pwd            := IniFile.ReadString('CONNECTION', 'Password_Crypted', '');
   pwd            := PwdDeCrypt(pwd);
   DB_USER        := IniFile.ReadString('CONNECTION', 'User', '');
   DB_PASSWORD    := pwd;
  finally
  IniFile.Free;
  end;
  if DB_SERVER_NAME <> '' then DB_PATH := DB_SERVER_NAME + ':' + DB_PATH;

  DataBase.DBName := DB_PATH;
  DataBase.ConnectParams.UserName := DB_USER;
  DataBase.ConnectParams.Password := DB_PASSWORD;
  DataBase.Open;

  DataSet.Close;
  DataSet.SelectSQL.Clear;
  DataSet.SelectSQL.Add('Select A.ID_REG, A.REG_TITLE As TITLE, A.REG_TITLE AS SHORT_TITLE, A.ID_FORM_UCH, B.ID_SYS from PUB_SP_REG_UCH A INNER JOIN PC_INI_REG B on A.ID_REG=B.ID_REG');
  DataSet.SelectSQL.Add('where A.ID_FORM_UCH IN (19,20) order by 2');
  DataSet.Open;
  DataSet.FetchAll;
  SetLength(reg_uch, DataSet.RecordCount, 5);
  i:=0;
  DataSet.First;
  while not DataSet.Eof do
  begin
   ComboBox.Properties.Items.Add(DataSet.FieldValues['TITLE']);
   reg_uch[i][0]:= DataSet.FieldValues['ID_REG'];
   reg_uch[i][1]:= DataSet.FieldValues['ID_FORM_UCH'];
   reg_uch[i][2]:= DataSet.FieldValues['TITLE'];
   reg_uch[i][3]:= DataSet.FieldValues['SHORT_TITLE'];
   reg_uch[i][4]:= DataSet.FieldValues['ID_SYS'];
   i:=i+1;
   DataSet.Next;
  end;
 DataSet.First;
 ComboBox.ItemIndex:=0;
 DataSet.Close;
 Database.Close;
// а теперь вводим пароль и т.д.
 Count := 0;
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\PERSONPAY\Login\',False) then
  begin
   cxUserName.Text:=reg.ReadString('Login');
  end;
  if  reg.OpenKey('\Software\PERSONPAY\Sys\',False) then
  begin
   ComboBox.ItemIndex:=reg.ReadInteger('Sys');
  end
  finally
   reg.Free;
  end;

end;

procedure TuLoginForm.act1Execute(Sender: TObject);
var i, id_sys:Integer;
    title:string;
    form:TuMainForm;
    reg: TRegistry;
    CurrentLogin, CurrentPassword, CurrentFIO: string;
    CurrentID_USER, CurrentID_PCARD: int64;
    sys:string;
begin
 // увеличить число попыток входа
 inc(Count);
 // считать текущие логин и пароль
 CurrentLogin := cxUserName.Text;
 CurrentPassword := cxUserPwd.Text;
 reg := TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\PERSONPAY\Login\',True) then
  begin
   reg.WriteString('Login',CurrentLogin);
  end;
  if  reg.OpenKey('\Software\PERSONPAY\Sys\',True) then
  begin
   reg.WriteInteger('Sys',ComboBox.ItemIndex);
  end
 finally
   reg.Free;
 end; 
 // соединиться с системой безопасности
 try
	LResult := fibInitConnection(CurrentLogin, CurrentPassword);
 except on e: Exception do
  begin
   ShowMessage('Невдалося підключитися до системи безпеки!');
	 ModalResult := mrCancel;
   Exit;
  end;
 end;

 if LResult.ErrorCode <> ACCMGMT_OK then		// ошибка
 begin
 	// отобразить сообщение об ошибке
  ShowMessage('Невірний логін або пароль!');
  // если 3 раза неправильно, выйти
	if Count >= 3 then Application.Terminate
  else	ModalResult := mrNone;	// иначе дать попробовать еще
  cxUserName.SetFocus;
 end
 else		// все пучком
 begin
  CurrentID_PCARD := GetCurrentUserIDExt;
  CurrentID_USER:=GetUserId;
  CurrentFIO:=GetUserFIO;
	// на случай совсем злых багов
	if (CurrentID_USER = 0) or (CurrentID_PCARD=0) then
	begin
 	 ShowMessage('Помилка!');
	 ModalResult := mrCancel;
   Exit;
	end
  else
  begin
   ID_SYSTEM:=reg_uch[ComboBox.ItemIndex][4];
     if PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'','Belong', false)=0 then
     begin
     USER_NAME:=CurrentLogin;
     USER_ID:=CurrentID_USER;
     USER_ID_PCARD:=CurrentID_PCARD;
     USER_FIO:=CurrentFIO;
     id:=reg_uch[ComboBox.ItemIndex][0];
     fu:=reg_uch[ComboBox.ItemIndex][1];
     name:=reg_uch[ComboBox.ItemIndex][2];
     SHORT_TITLE:= reg_uch[ComboBox.ItemIndex][3];
     reg_uch:=nil;
     ModalResult:=mrOk;
     end
     else  begin ShowMessage('Немає прав доступу!'); Application.Terminate;end;


  { if id_sys=2 then
   begin
     if PCCheckAccess('/ROOT/PERSONPAY/PС_STUD_SITY','Belong', false)=0 then
     begin
     USER_NAME:=CurrentLogin;
     USER_ID:=CurrentID_USER;
     USER_ID_PCARD:=CurrentID_PCARD;
     USER_FIO:=CurrentFIO;
     id:=reg_uch[ComboBox.ItemIndex][0];
     fu:=reg_uch[ComboBox.ItemIndex][1];
     name:=reg_uch[ComboBox.ItemIndex][2];
     SHORT_TITLE:= reg_uch[ComboBox.ItemIndex][3];
     reg_uch:=nil;
     ModalResult:=mrOk;
    end
    else  begin ShowMessage('Немає прав доступу!'); Application.Terminate;end;
   end;

   if id_sys=3 then
   begin
     if PCCheckAccess('/ROOT/PERSONPAY/PС_CONTRACTS_VALUTE','Belong', false)=0 then
     begin
     USER_NAME:=CurrentLogin;
     USER_ID:=CurrentID_USER;
     USER_ID_PCARD:=CurrentID_PCARD;
     USER_FIO:=CurrentFIO;
     id:=reg_uch[ComboBox.ItemIndex][0];
     fu:=reg_uch[ComboBox.ItemIndex][1];
     name:=reg_uch[ComboBox.ItemIndex][2];
     SHORT_TITLE:= reg_uch[ComboBox.ItemIndex][3];
     reg_uch:=nil;
     ModalResult:=mrOk;
    end
    else  begin ShowMessage('Немає прав доступу!'); Application.Terminate;end;
   end;  }
 end;
end;
end;

procedure TuLoginForm.act2Execute(Sender: TObject);
begin
 ModalResult:=mrCancel;
 Close;
end;

procedure TuLoginForm.FormShow(Sender: TObject);
begin
 cxUserPwd.SetFocus;
end;

end.
