unit UnitZAccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls,
  AccMGMT, Registry,
  ZMessages, ZTypes, ActnList,
  Buttons, jpeg,
  unit_zGlobal_Consts, zProc, iBase, Unit_Access_Consts, pFibDatabase,
  pFibDataSet, pFibStoredProc, uPwdDecrypt, uMD5;

type
  TFZAccess = class(TForm)
    Image4: TImage;
    Image5: TImage;
    CloseSpeedButton: TSpeedButton;
    SpeedButton1: TSpeedButton;
    UserEdit: TcxTextEdit;
    LoginEdit: TcxTextEdit;
    ActionList: TActionList;
    ActionYes: TAction;
    CancelBtn: TSpeedButton;
    YesBtn: TSpeedButton;
    ActionCancel: TAction;
    ActionAdmin: TAction;
    procedure UserEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionYesExecute(Sender: TObject);
    procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveUserData(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CloseSpeedButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionAdminExecute(Sender: TObject);
  private
    countoftry:byte;
    pIsAlready:boolean;
    pLanguageIndex:byte;
    pDBHandle:TISC_DB_HANDLE;
    pDB:TpFibDatabase;
    pTr:TpFibTransaction;
    pDS:TpFibDataSet;
    pSP:TpFibStoredProc;
    function  CheckAuthorizedUser(Id_user:Int64):Boolean;
    function  DoAuthorization(Id_user:Int64; OldHash:String; NewHash:String):Boolean;
  public
    constructor Create(AOwner:TComponent);override;
    Property DB:TISC_DB_HANDLE read pDBHandle;
    property IsAlready:Boolean read pIsAlready;
  end;

function AccessZarplata(AOwner:TComponent):TZAccessResult;stdcall;
  exports AccessZarplata;

implementation

uses UnitAuthForm;

{$R *.dfm}

function AccessZarplata(AOwner:TComponent):TZAccessResult;stdcall;
var FormAccess:TFZAccess;


begin
 FormAccess:=TFZAccess.Create(AOwner);
 //Result:=null;
 if (FormAccess.IsAlready) or (FormAccess.ShowModal=mrYes) then
 begin
    AccessZarplata.Name_user := FormAccess.UserEdit.Text;
    AccessZarplata.User_Fio  :=FormAccess.LoginEdit.Text;
    AccessZarplata.DB_Handle := FormAccess.pDBHandle;
 end;
 FormAccess.Free;
end;

constructor TFZAccess.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 countoftry := 0;
 pIsAlready:=False;
 pLanguageIndex:=LanguageIndex;
 YesBtn.Hint := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Hint := CancelBtn_Caption[pLanguageIndex];
end;

procedure TFZAccess.UserEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then LoginEdit.SetFocus;
end;

procedure TFZAccess.ActionYesExecute(Sender: TObject);
var
 ResultInfo:TResultInfo;
 is_Authorized:Boolean;
begin
	inc(countoftry);
  is_Authorized:=false;
  //******************************************************************************
  // соединиться с системой безопасности
  try
             ResultInfo := fibInitConnection(UserEdit.Text,LoginEdit.Text);
             if ResultInfo.ErrorCode <> ACCMGMT_OK
             then	begin
                       ZShowMessage(Error_Caption[pLanguageIndex],AcMgmtErrMsg(ResultInfo.ErrorCode),mtError,[mbOk]);
                       UserEdit.SetFocus;
             end
             else	begin
                       pDBHandle:=ResultInfo.DBHandle;
                       pIsAlready:=True;
                       SaveUserData(Sender);

                       if (fibCheckPermission(cAccZarplata,cBelong)=0)
                       then begin
                                 is_Authorized:=CheckAuthorizedUser(GetUserId);

                                 if is_Authorized
                                 then ModalResult:=mrYes
                                 else ModalResult:=mrNo;
                       end;

             end;
  except on e: Exception do
             begin
                	 MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
                   if CountOfTry>=3 then Application.Terminate
                   else Exit;
             end;
  end;
  //******************************************************************************
  if countoftry>3 then Application.Terminate;
end;

procedure TFZAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then ActionYesExecute(Sender);
end;

procedure TFZAccess.SaveUserData(Sender:TObject);
var
 reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\',True) then
  begin
   reg.WriteString('Login',UserEdit.Text);
   if reg.OpenKey('\Software\Zarplata\Login\Password\',False) then
      reg.WriteString('Password',LoginEdit.Text);
  end
 finally
  reg.Free;
 end;
end;

procedure TFZAccess.FormCreate(Sender: TObject);
var Reg:TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\',False) then
  begin
   UserEdit.Text:=reg.ReadString('Login');
   if reg.OpenKey('\Software\Zarplata\Login\PassWord',False) then
     begin
      LoginEdit.Text:=reg.ReadString('PassWord');
      if LoginEdit.Text<>'' then ActionYesExecute(Sender);
     end;
  end
 finally
  reg.Free;
 end;
end;

procedure TFZAccess.cxButton2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFZAccess.CloseSpeedButtonClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFZAccess.SpeedButton1Click(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
end;

procedure TFZAccess.ActionCancelExecute(Sender: TObject);
begin
Close;
end;

procedure TFZAccess.ActionAdminExecute(Sender: TObject);
var
 reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\PassWord',False) then
      reg.DeleteKey('\Software\Zarplata\Login\PassWord')
  else reg.CreateKey('\Software\Zarplata\Login\PassWord');
 finally
  reg.Free;
 end;
end;

function TFZAccess.CheckAuthorizedUser(Id_user: Int64): Boolean;
begin
     pDB:=TpFibDatabase.Create(self);
     pDB.SQLDialect:=3;
     pDB.Handle:=pDBHandle;

     pTr:=TpFibTransaction.Create(self);
     pTr.DefaultDatabase:=pDB;

     pDB.DefaultTransaction:=pTr;
     pDB.DefaultUpdateTransaction:=pTr;

     pTr.StartTransaction;

     pDS:=TpFibDataSet.Create(self);
     pDS.Database:=PDB;
     pDS.Transaction:=pTr;

     pDS.SelectSQL.Text:='SELECT * FROM Z_DO_AUTHENTIFICATION_GU AU WHERE par1='+IntToStr(id_user);
     pDS.Open;

     if (pDS.RecordCount>0)
     then begin
               if pDS.FieldByName('par2').AsString=pDS.FieldByName('par3').AsString
               then begin
                         Result:=true;
               end
               else begin
                         Result:=false;
                         ZShowMessage(Error_Caption[pLanguageIndex],'Ваш пароль дотупу в систему змінився. '+#13+'Виникла потреба в авторізації вас як користувача системи. ',mtError,[mbOk]);
               end;
     end
     else begin
               Result:=false;
               if ZShowMessage(Error_Caption[pLanguageIndex],'Виникла потреба в первинній авторізації вас як користувача системи. '+#13+' Зверніться до адміністратора системи?',mtError,[mbYes, mbNo])=mrYes
               then begin
                         Result:=false;
               end;
     end;

     PDS.Close;
     pDS.Free;

     pTr.Commit;
     pTr.Free;
     pDB.Free;
end;

function TFZAccess.DoAuthorization(Id_user: Int64; OldHash:String; NewHash:String): Boolean;
var EditSP:TpFibStoredProc;
    T:TfrmAUsers;
begin
     //Подтверждение изменного пароля и сохранение его под зарплатой
     T:=TfrmAUsers.Create(self);
     Result:=false;
     if T.ShowModal=mrYes
     then begin
              EditSP:=TpFibStoredProc.Create(self);
              EditSP.Database:=pDb;
              EditSP.Transaction:=pTr;
              EditSP.StoredProcName:='Z_DO_AUTHENTIFICATION';
              EditSP.Prepare;
              EditSP.ParamByName('id_user').AsInt64:=GetUserId;
              EditSP.ParamByName('old_hash_pwd').AsString:=uMD5.StrMD5(T.LoginEditOld.Text);
              EditSP.ParamByName('new_hash_pwd').AsString:=uMD5.StrMD5(T.LoginEditNew.Text);
              EditSP.ExecProc;

              if EditSP.ParamByName('process_result').Value=1
              then Result:=true;

              EditSP.Close;
              EditSP.Free;
     end;
     T.Free;
end;

end.
