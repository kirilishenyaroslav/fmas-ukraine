unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, IniFiles, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxLabel, FIBDatabase, pFIBDatabase, uSys, Mask, ToolEdit, uCommon_Messages;

type
  TfrmOptions = class(TForm)
    beLocalBD: TcxButtonEdit;
    beReleaseBD: TcxButtonEdit;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblLocalDBPath: TcxLabel;
    lblLocalSource: TcxLabel;
    lblReleaseDBPath: TcxLabel;
    OptionsDB: TpFIBDatabase;
    dlgPath: TOpenDialog;
    beLocalSource: TDirectoryEdit;
    procedure beLocalBDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure beReleaseBDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure beLocalSourcePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
      LocalDB, ReleaseDB:TBDConParams;
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

uses uConnectionParams;

{$R *.dfm}

procedure TfrmOptions.beLocalBDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var frm:TfrmConnectionParams;
begin
   frm:=TfrmConnectionParams.Create(Self, LocalDB);
   if frm.ShowModal=mrOk then
   begin
       LocalDB:=frm.ResultDB;
       if LocalDB.tdbServer='' then beLocalBD.Text:=LocalDB.tdbPath
       else beLocalBD.Text:=LocalDB.tdbServer+':'+LocalDB.tdbPath;
   end;
   frm.Free;
end;

procedure TfrmOptions.btnOkClick(Sender: TObject);
var i:Integer;
begin
   i:=bsShowMessage('Внимание!', 'Вы действительно хотите сохранить настройки?', mtConfirmation, [mbYes, mbNo, mbCancel]);
   if i=mrYes then
   begin
      if beLocalBD.Text<>'' then DBSetParamsToIni('LOCAL_CONNECTION', LocalDB);
      if beReleaseBD.Text<>'' then DBSetParamsToIni('RELEASE_CONNECTION', ReleaseDB);
      if beLocalSource.Text<>'' then
         if not SourceSetParamsToIni('FR_SOURCE', beLocalSource.Text) then Exit;
      ModalResult:=mrOk
   end
   else if i=mrNo then ModalResult:=mrCancel;
end;

procedure TfrmOptions.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel
end;

procedure TfrmOptions.beReleaseBDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var frm:TfrmConnectionParams;
begin
   frm:=TfrmConnectionParams.Create(Self, ReleaseDB);
   if frm.ShowModal=mrOk then
   begin
       ReleaseDB:=frm.ResultDB;
       if ReleaseDB.tdbServer='' then beReleaseBD.Text:=ReleaseDB.tdbPath
       else beReleaseBD.Text:=ReleaseDB.tdbServer+':'+ReleaseDB.tdbPath;
   end;
   frm.Free;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  beLocalBD.Text:=DBGetConnectionStr('LOCAL_CONNECTION', True);
  if beLocalBD.Text='' then InitParams(LocalDB)
  else LocalDB:=DBGetParamsFromIni('LOCAL_CONNECTION');
  beReleaseBD.Text:=DBGetConnectionStr('RELEASE_CONNECTION', True);
  if beReleaseBD.Text='' then InitParams(ReleaseDB)
  else ReleaseDB:=DBGetParamsFromIni('RELEASE_CONNECTION');
  beLocalSource.Text:=DBGetConnectionStr('FR_SOURCE', False);
end;

procedure TfrmOptions.beLocalSourcePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
   if beLocalSource.Text<>'' then dlgPath.InitialDir:=beLocalSource.Text;
   if dlgPath.Execute then
   begin
      beLocalSource.Text:=GetCurrentDir;
   end;
end;

end.
