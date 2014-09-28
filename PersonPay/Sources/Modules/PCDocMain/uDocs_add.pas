unit uDocs_add;

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
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cxUserName: TcxTextEdit;
    cxUserPwd: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    img1: TImage;
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
    procedure FormCreate(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
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
    reg_uch: array of array of Integer ;
    PERIOD:TDateTime;
    SCH_ROOT:Integer;
  end;

var
  uLoginForm: TuLoginForm;

implementation

{$R *.dfm}
uses uMain;

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
  DataSet.SelectSQL.Add('Select ID_REG, REG_TITLE As TITLE, ID_FORM_UCH from PUB_SP_REG_UCH ');
  DataSet.SelectSQL.Add('where ID_FORM_UCH IN (19,20)');
  DataSet.Open;
  DataSet.FetchAll;
  SetLength(reg_uch, DataSet.RecordCount, 2);
//  ShowMessage(IntToStr(DataSet.RecordCount));
  i:=0;
  DataSet.First;
  while not DataSet.Eof do
  begin
   ComboBox.Properties.Items.Add(DataSet.FieldValues['TITLE']);
   reg_uch[i][0]:= DataSet.FieldValues['ID_REG'];
   reg_uch[i][1]:= DataSet.FieldValues['ID_FORM_UCH'];
//   ShowMessage(DataSet.FieldValues['TITLE']+'  '+IntToStr(reg_uch[i])+'  '+inttostr(i));
   i:=i+1;
   DataSet.Next;
  end;
//  DataSet.FetchAll;
//   for i:=0 to DataSet.RecordCount-1 do  ShowMessage(IntToStr(reg_uch[i]));

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
  end
  finally
   reg.Free;
  end;
end;

procedure TuLoginForm.act1Execute(Sender: TObject);
var i:Integer;
    title:string;
    form:TuMainForm;
    reg: TRegistry;
    CurrentLogin, CurrentPassword, CurrentFIO: string;
    CurrentID_USER, CurrentID_PCARD: int64;
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
   if PersonPayCheckAccess('/ROOT/PERSONPAY','Belong', false)=0 then
   begin
    USER_NAME:=CurrentLogin;
    USER_ID:=CurrentID_USER;
    USER_ID_PCARD:=CurrentID_PCARD;
    USER_FIO:=CurrentFIO;
    id:=reg_uch[ComboBox.ItemIndex][0];
    fu:=reg_uch[ComboBox.ItemIndex][1];
    reg_uch:=nil;
    ModalResult:=mrOk;
   end;
  end;
 end;

//  ModalResult:=mrOk;
end;

procedure TuLoginForm.act2Execute(Sender: TObject);
begin
 ModalResult:=mrCancel;
 Close;
end;

end.
