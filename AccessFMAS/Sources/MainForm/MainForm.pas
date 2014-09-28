unit MainForm;
{|zxvcxcvcxvxcv
sdfdsfgsdfsdf}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ObjectActions, ActionsForm, RolesForm, UsersGroupForm, MainDM,
  UsersForm, AboutForm, IniFiles, dxBar, StdCtrls,
  pfibDataset, ExtCtrls, dxsbar, cxControls, cxContainer, cxEdit,
  cxCheckBox, dxBarExtItems;

type
  TFormMain = class(TForm)
    StatusBar: TStatusBar;
    dxBarManager1: TdxBarManager;
    N3: TdxBarButton;
    N7: TdxBarButton;
    SetCryptPAssword: TdxBarButton;
    N9: TdxBarButton;
    N1: TdxBarSubItem;
    N5: TdxBarButton;
    N6: TdxBarButton;
    N8: TdxBarButton;
    N4: TdxBarSubItem;
    N2: TdxBarButton;
    N11: TdxBarButton;
    N10: TdxBarSubItem;
    lbNativeCustomer: TLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SetCryptPAsswordClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    Login:String;
    Password:String;
    //PwdCrypt : function (s: ShortString): ShortString; stdcall;
    PwdCrypt :procedure (var buffer: PChar; var len:Integer); stdcall;
    StrMD5:function (Buffer : shortString): shortstring; stdcall;
    DLLInstance1, DLLInstance2:THandle;
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses SysAdmin, MDIChildFormsBar;

{$R *.DFM}

procedure TFormMain.FormCreate(Sender: TObject);
var     t : TzMDITool;
       Ini : TIniFile;
begin
     SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);
     t := TzMDITool.Create(dxBarManager1);

     Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'config.ini');
     if ini.ReadString('Params','ShowSetHashPswrd','0')<>'1'
     then begin
               N9.Visible:=TdxbarItemVisible(false);
     end;

     if ParamStr(1)='-z'
     then dxBarButton2.Visible:=ivAlways
     else dxBarButton2.Visible:=ivNever;

     Ini.Free;

     if FileExists('PwdCrypt.dll')
     then begin
              DLLInstance1 := LoadLibrary('PwdCrypt.dll');
              @PwdCrypt  :=GetProcAddress(DLLInstance1, 'PwdCrypt');
     end
     else ShowMessage('Не знайдено PwdCrypt.dll!');


     if FileExists('Md5dll.dll')
     then begin
              DLLInstance2 := LoadLibrary('Md5dll.dll');
              @StrMD5  :=GetProcAddress(DLLInstance2, 'StrMD5');
     end
     else begin
              ShowMessage('Не знайдено Md5dll.dll!');
     end;

end;

procedure TFormMain.N3Click(Sender: TObject);
var
   FormObjectAction: TFormObjectActions;
begin
     FormObjectAction := TFormObjectActions.Create(Self);
     FormObjectAction.Show;
end;

procedure TFormMain.N5Click(Sender: TObject);
var
   FormActions: TFormActions;
begin
     FormActions := TFormActions.Create(Self, fmWork,-1);
     FormActions.Show;
end;

procedure TFormMain.N6Click(Sender: TObject);
var
   FormRoles: TFormRoles;
begin
     FormRoles := TFormRoles.Create(Self, fmWork,-1,-1);
     FormRoles.Show;
end;

procedure TFormMain.N7Click(Sender: TObject);
var
   FormUsersGroup: TFormUsersGroup;
begin
     FormUsersGroup := TFormUsersGroup.Create(Self);
     FormUsersGroup.Show;
end;

procedure TFormMain.N8Click(Sender: TObject);
var
   FormUsers: TFormUsers;
begin
     FormUsers := TFormUsers.Create(Self, fmWork);
     FormUsers.Show;
end;

procedure TFormMain.N2Click(Sender: TObject);
var
   FormAbout: TFormAbout;
begin
     FormAbout := TFormAbout.Create(Self);
     FormAbout.ShowModal;
     FormAbout.Free;
end;

procedure TFormMain.SetCryptPAsswordClick(Sender: TObject);
var
    res : String;
    Ini : TIniFile;
    rec_pc:PChar;
    len:Integer;
begin
    if InputQuery('Змінення закриптованого пароля до БД', 'введіть новий пароль', res)
    then begin
              Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'config.ini');
              rec_pc:=PChar(res);
              len   := Length(res);
              PwdCrypt(rec_pc,Len);
              SetString(res,rec_pc,len);

              Ini.WriteString('CONNECTION', 'PASSWORD_CRYPTED', res);
              Ini.Free;
    end;
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
    if MessageDlg('Ви справді бажаєте перерахувати ХЕШ-значення для існуючих паролей?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

    with DMMain do begin
        InputQuery.Close;
        InputQuery.Open;
        InputQuery.First;

        WorkQuery.Transaction.StartTransaction;

        try
            while not InputQuery.Eof do begin
                WorkQuery.Close;
                WorkQuery.SQL.Text := 'UPDATE USERS SET PASSWD_MD5_HASH = ' +
                                QuotedStr(StrMD5(InputQueryPASSWD.Value)) +
                                ' where id_user = ' + InputQueryID_USER.AsString;
                WorkQuery.ExecSQL;

                InputQuery.Next;
            end;
        except on E:Exception do begin
                MessageDlg(e.Message, mtError, [mbOk], 0);
                WorkQuery.Transaction.Rollback;
                exit;
            end;
        end;

        WorkQuery.Transaction.Commit;
        MessageDlg('Генерацію завершено!', mtInformation, [mbOk], 0);

    end;
end;

procedure TFormMain.N11Click(Sender: TObject);
begin
     AdminShowUsers(Self);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var  i:integer;
begin
    if DMMain.WorkDatabase.Handle<>nil then FinalizeAdminSystem;
    for i:=0 to self.MDIChildCount-1 do
    begin
       if (MDIChildren[i].Owner as TForm).Handle=self.Handle then
          MDIChildren[i].Release;
    end;
end;

procedure TFormMain.FormShow(Sender: TObject);
var NativeCusiInfo:TpfibDataset;
begin
     if DMMain.WorkDatabase.Handle<>nil
     then InitializaAdminSystem(self, DMMain.WorkDatabase.Handle,
                                1000, -1, true);
     StatusBar.Panels[0].Text:='Підключення до '+DMMain.KruAccessDB.DatabaseName;

     NativeCusiInfo:=TpfibDataset.Create(self);
     NativeCusiInfo.Database:=dmMain.WorkDatabase;
     NativeCusiInfo.Transaction:=dmMain.FReadTransaction;
     NativeCusiInfo.SelectSQL.Text:='select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION ';
     NativeCusiInfo.Open;
     NativeCusiInfo.FetchAll;
     if (NativeCusiInfo.RecordCount>0)
     then begin
              lbNativeCustomer.Caption:=NativeCusiInfo.FieldByName('NAME').AsString;
              lbNativeCustomer.Update;
     end;
     NativeCusiInfo.Close;
     NativeCusiInfo.Free;
end;

procedure TFormMain.dxBarButton1Click(Sender: TObject);
var
    res : String;
    Ini : TIniFile;
    rec_pc:PChar;
    len:Integer;
begin
    if InputQuery('Змінення закриптованого пароля до БД зображень', 'введіть новий пароль', res)
    then begin
              Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'config.ini');
              rec_pc:=PChar(res);
              len   := Length(res);

              PwdCrypt(rec_pc,Len);
              
              SetString(res,rec_pc,len);

              Ini.WriteString('IMAGE_CONNECTION', 'PASSWORD_CRYPTED', res);
              Ini.Free;
    end;
end;

procedure TFormMain.dxBarButton2Click(Sender: TObject);
var res:string;
begin
        if InputQuery('Створення пароля для SuperUserа', 'введіть новий пароль', res)
        then begin
                  with DMMain do
                  begin
                        WorkQuery.Transaction.StartTransaction;
                        try
                                WorkQuery.Close;
                                WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Z_DO_AUTHENTIFICATION_I('+'''' +StrMD5(res)+''''+')';
                                WorkQuery.ExecSQL;
                        except on E:Exception do
                            begin
                                MessageDlg(e.Message, mtError, [mbOk], 0);
                                WorkQuery.Transaction.Rollback;
                                exit;
                            end;
                        end;
                        WorkQuery.Transaction.Commit;
                        MessageDlg('Генерацію завершено!', mtInformation, [mbOk], 0);

                  end;
          end;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
      FreeLibrary(DLLInstance1);
      FreeLibrary(DLLInstance2);
end;

end.
