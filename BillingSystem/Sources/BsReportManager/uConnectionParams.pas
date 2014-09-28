unit uConnectionParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit, cxMemo,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxRadioGroup, FIBDatabase, pFIBDatabase, uSys,
  uCommon_Messages;

type
  TfrmConnectionParams = class(TForm)
    rbLocalServer: TcxRadioButton;
    rbRemoteServer: TcxRadioButton;
    NameServerEdit: TcxTextEdit;
    lblNameServer: TcxLabel;
    AliasEdit: TcxTextEdit;
    lblAlias: TcxLabel;
    lblDBPath: TcxLabel;
    DBPathEdit: TcxTextEdit;
    btnBrowse: TcxButton;
    ServerBox: TGroupBox;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    btnTest: TcxButton;
    ConnectParamsBox: TGroupBox;
    MemoInfo: TcxMemo;
    UserNameEdit: TcxTextEdit;
    PassEdit: TcxTextEdit;
    RoleEdit: TcxTextEdit;
    CharSetBox: TcxComboBox;
    SqlDialectBox: TcxComboBox;
    lblUserName: TcxLabel;
    lblPass: TcxLabel;
    lblRole: TcxLabel;
    lblCharSet: TcxLabel;
    lblSqlDialect: TcxLabel;
    TestDB: TpFIBDatabase;
    dlgOpenDB: TOpenDialog;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure UserNameEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbLocalServerClick(Sender: TObject);
    procedure rbRemoteServerClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure PassEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RoleEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    //LocParams:TBDConParams;
    UserStr, PassStr, RoleStr:string;
    procedure SetDBParams;
    function CheckData:Boolean;
    procedure FillMemo(InputStr, MemStr:string; Edit:TcxTextEdit);
  public
    ResultDB:TBDConParams;
    constructor Create(AOwner:TComponent; LocParams:TBDConParams);reintroduce;
  end;

var
  frmConnectionParams: TfrmConnectionParams;

implementation

uses DateUtils;

{$R *.dfm}

constructor TfrmConnectionParams.Create(AOwner:TComponent; LocParams:TBDConParams);
begin
   inherited Create(AOwner);
   MemoInfo.Text:='';
   SqlDialectBox.Properties.Items.Add('1');
   SqlDialectBox.Properties.Items.Add('2');
   SqlDialectBox.Properties.Items.Add('3');
   SqlDialectBox.ItemIndex:=0;
   with CharSetBox.Properties.Items do
   begin
      Add('ASCII');
      Add('CYRL');
      Add('DOS437');
      Add('DOS850');
      Add('DOS852');
      Add('DOS857');
      Add('DOS860');
      Add('DOS861');
      Add('DOS863');
      Add('DOS865');
      Add('DOS866');
      Add('EUCJ_0208');
      Add('ISO885_1');
      Add('NEXT');
      Add('NONE');
      Add('OCTETS');
      Add('UNICODE_FSS');
      Add('WIN1250');
      Add('WIN1251');
      Add('WIN1252');
      Add('WIN1253');
      Add('WIN1254');
   end;
   rbLocalServer.Checked:=True;
   UserStr:=UserNameEdit.Text;
   PassStr:=PassEdit.Text;
   RoleStr:=RoleEdit.Text;
   with LocParams do
   begin

      if ((tdbServer='127.0.0.1') or (UpperCase(tdbServer)='LOCALHOST')) then rbLocalServer.Checked:=True
      else
      begin
         rbRemoteServer.Checked:=True;
         NameServerEdit.Text:=tdbServer;
      end;
      DBPathEdit.Text:=tdbPath;
      UserNameEdit.Text:=tdbUser;
      PassEdit.Text:=tdbPassword;
      CharSetBox.EditText:=tdbCharSet;
      SqlDialectBox.ItemIndex:=tdbSQLDialect-1;
   end;
end;

procedure TfrmConnectionParams.SetDBParams;
begin
  if CheckData then
  begin
     with ResultDB do
     begin
        tdbPath:=DBPathEdit.Text;
        if rbRemoteServer.Checked then tdbServer:=NameServerEdit.Text
        else tdbServer:='127.0.0.1';
        tdbUser:=UserNameEdit.Text;
        tdbPassword:=PassEdit.Text;
        tdbCharSet:=CharSetBox.EditText;
        tdbSQLDialect:=SqlDialectBox.ItemIndex+1;
     end;
  end;
end;

function TfrmConnectionParams.CheckData:Boolean;
begin
  Result:=True;

  if rbRemoteServer.Checked then
  begin
     if NameServerEdit.Text='' then
     begin
        bsShowMessage('Внимание', 'Вы не указали сервер!', mtInformation, [mbOK]);
        NameServerEdit.Style.Color:=$00DDBBFF;
        Result:=False;
     end;
  end;

  if DBPathEdit.Text='' then
  begin
     bsShowMessage('Внимание!', 'Вы не указали путь к базе!', mtInformation, [mbOK]);
     DBPathEdit.Style.Color:=$00DDBBFF;
     Result:=False;
  end;

  if UserNameEdit.Text='' then
  begin
     bsShowMessage('Внимание!', 'Вы не заполнили поле "Пользователь"!', mtInformation, [mbOK]);
     UserNameEdit.Style.Color:=$00DDBBFF;
     Result:=False;
  end;

  if PassEdit.Text='' then
  begin
     bsShowMessage('Внимание', 'Вы не заполнили поле "Пароль"!', mtInformation, [mbOK]);
     PassEdit.Style.Color:=$00DDBBFF;
     Result:=False;
  end;

  if CharSetBox.EditText='' then
  begin
     bsShowMessage('Внимание!', 'Вы не выбрали кодировку!', mtInformation, [mbOK]);
     CharSetBox.Style.Color:=$00DDBBFF;
     Result:=False;
  end;

  if SqlDialectBox.EditText='' then
  begin
     bsShowMessage('Внимание!', 'Вы не диалект базы!', mtInformation, [mbOK]);
     SqlDialectBox.Style.Color:=$00DDBBFF;
     Result:=False;
  end;
end;

procedure TfrmConnectionParams.btnOkClick(Sender: TObject);
begin
   SetDBParams;
   ModalResult:=mrOk;
end;

procedure TfrmConnectionParams.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmConnectionParams.btnBrowseClick(Sender: TObject);
begin
   if dlgOpenDB.Execute then
   begin
      DBPathEdit.Text:=dlgOpenDB.FileName;
   end;
end;

procedure TfrmConnectionParams.FillMemo(InputStr, MemStr:string; Edit:TcxTextEdit);
var i, l:Integer;
begin
   l:=MemoInfo.Lines.Count;
   if InputStr<>'' then
   begin
      i:=MemoInfo.Lines.IndexOf('User='+MemStr);
      if i=-1 then
      begin
         if l=0 then i:=l
         else i:=l+1;
      end
      else
      begin
         MemoInfo.Lines.Delete(i);
      end;
      MemoInfo.Lines.Insert(i, 'User='+Edit.Text);
      MemStr:=Edit.Text;
   end
   else
   begin

   end;
end;


procedure TfrmConnectionParams.UserNameEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   //FillMemo(UserNameEdit.Text, UserStr, UserNameEdit);
end;

procedure TfrmConnectionParams.rbLocalServerClick(Sender: TObject);
begin
   NameServerEdit.Enabled:=rbRemoteServer.Checked;
end;

procedure TfrmConnectionParams.rbRemoteServerClick(Sender: TObject);
begin
   NameServerEdit.Enabled:=rbRemoteServer.Checked;
end;

procedure TfrmConnectionParams.btnTestClick(Sender: TObject);
begin
   SetDBParams;
   With TestDB, ResultDB do
   begin
      if rbLocalServer.Checked then DBName:=tdbPath
      else DBName:=tdbServer+':'+tdbPath;
      ConnectParams.UserName:=tdbUser;
      ConnectParams.Password:=tdbPassword;
      ConnectParams.CharSet:=tdbCharSet;
      SQLDialect:=tdbSQLDialect;
   end;
   TestDB.Open;
   if TestDB.Connected then bsShowMessage('Внимание!', 'Соединение выполнено успешно!', mtInformation, [mbOK])
   else bsShowMessage('Внимание!', 'Соединение невозможно установить!', mtInformation, [mbOK]);
   TestDB.Close;
end;

procedure TfrmConnectionParams.PassEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   //FillMemo(PassEdit.Text, PassStr, PassEdit);
end;

procedure TfrmConnectionParams.RoleEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   //FillMemo(RoleEdit.Text, RoleStr, RoleEdit);
end;

end.
