unit SysUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, FIBDatabase, pFIBDatabase,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, cxDBData, cxGridDBTableView, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxContainer, cxLabel, IB_EXTERNALS, cxListBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBCtrls, ToolWin, ComCtrls, cxTL,
  SysAdmin;
                     
type

  TfrmSysUsers = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Timer1: TTimer;
    UsersDataSet: TpFIBDataSet;
    UsersDataSource: TDataSource;
    SystemsDataSet: TpFIBDataSet;
    SystemsDataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_USER: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_USER: TcxGridDBColumn;
    cxGrid1DBTableView1COMPUTER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1COMPUTER_IP: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    WaitPanel: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Query1: TpFIBQuery;
    Image1: TImage;
    Timer2: TTimer;
    pFIBDataSet1: TpFIBDataSet;
    Panel1: TPanel;
    BlockButton: TcxButton;
    GetUserListButton: TcxButton;
    cxLabel1: TcxLabel;
    cbSystems: TcxLookupComboBox;
    UnBlockButton: TcxButton;
    SendButton: TcxButton;
    GetScrButton: TcxButton;
    SendAllButton: TcxButton;
    SendUserButton: TcxButton;
    CloseButton: TcxButton;
    CloseUserButton: TcxButton;
    pFIBDataSet2: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGridDBTableView1COUNT: TcxGridDBColumn;
    procedure GetUserListButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDBLookupComboBox1Click(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
    procedure UsersDataSetAfterOpen(DataSet: TDataSet);
    procedure GetScrButtonClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BlockButtonClick(Sender: TObject);
    procedure UnBlockButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloseButtonClick(Sender: TObject);
    procedure CloseUserButtonClick(Sender: TObject);
    procedure cbSystemsPropertiesCloseUp(Sender: TObject);
  public
    SendMode : TSendMode;
  end;

implementation
uses WinSock, sysSendMessageUnit, msgUnit, Clipbrd, SysScrViewUnit, JPEG;

{$R *.dfm}

procedure TfrmSysUsers.GetUserListButtonClick(Sender: TObject);
begin
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_USERS_LOCATE');
 StoredProc.Transaction.Commit;
 StoredProc.Close;
 WaitPanel.Left := cxGrid1.Left +  cxGrid1.Width div 2 - WaitPanel.Width div 2;
 WaitPanel.Top  := cxGrid1.Top +  cxGrid1.Height div 2 - WaitPanel.Height div 2;
 WaitPanel.Visible := True;
 Timer1.Enabled    := True;
end;

procedure TfrmSysUsers.Timer1Timer(Sender: TObject);
begin
 UsersDataSet.Close;
 UsersDataSet.Open;
 WaitPanel.Visible := False;
 Timer1.Enabled := False;
end;

procedure TfrmSysUsers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
 pFIBDataSet2.Close;
 UsersDataSet.Close;
 SystemsDataSet.Close;
 WorkDatabase.Close;
end;

procedure TfrmSysUsers.cxDBLookupComboBox1Click(Sender: TObject);
begin
// cxDBLookupComboBox1.Text := SystemsDataSet
end;

procedure TfrmSysUsers.SendButtonClick(Sender: TObject);
begin
 frmSendMessage := TfrmSendMessage.Create(Self);
 frmSendMessage.id_user := -1;
 if UsersDataSet.RecordCount <> 0 then if not VarIsNull(UsersDataSet['ID_USER']) then frmSendMessage.id_user := UsersDataSet['ID_USER'];
 frmSendMessage.id_system := -1;
 if TComponent(Sender).Tag = 1 then
 begin
   frmSendMessage.Caption := frmSendMessage.Caption + ' усім системам';
   SendMode := smAllSystems;
 end;
 if TComponent(Sender).Tag = 2 then
 begin
   frmSendMessage.id_system := ADMIN_VAR_ID_SYSTEM;
   frmSendMessage.Caption := frmSendMessage.Caption + ' обраной системі';
   SendMode := smSystem;
 end;
 if TComponent(Sender).Tag = 3 then
 begin
   frmSendMessage.id_system := UsersDataSet['ID_SYSTEM'];
   frmSendMessage.Caption := frmSendMessage.Caption + ' користувачу ' + UsersDataSet['NAME_USER'];
   SendMode := smUser;
 end;
 frmSendMessage.ShowModal;
 frmSendMessage.Free;
end;


procedure TfrmSysUsers.UsersDataSetAfterOpen(DataSet: TDataSet);
begin
  SendUserButton.Enabled := UsersDataSet.RecordCount <> 0;
  GetScrButton.Enabled := UsersDataSet.RecordCount <> 0;
  CloseUserButton.Enabled := UsersDataSet.RecordCount <> 0;
  pFIBDataSet2.Close;
  pFIBDataSet2.Open;
end;

procedure TfrmSysUsers.GetScrButtonClick(Sender: TObject);
begin
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_GET_SCREENSHOT', [UsersDataSet['ID_USER']]);
 StoredProc.Transaction.Commit;
 StoredProc.Close;
 WaitPanel.Left := cxGrid1.Left +  cxGrid1.Width div 2 - WaitPanel.Width div 2;
 WaitPanel.Top  := cxGrid1.Top +  cxGrid1.Height div 2 - WaitPanel.Height div 2;
 WaitPanel.Visible := True;
 Timer2.Enabled := True;
end;

procedure TfrmSysUsers.Timer2Timer(Sender: TObject);
var
 st : TMemoryStream;
 jpg : TJPEGImage;
begin
 WaitPanel.Visible := false;
 Timer2.Enabled := False;
try
 pFIBDataSet1.Close;
 pFIBDataSet1.Open;
 st := TMemoryStream.Create;
 if not VarIsNull(pFIBDataSet1['SCREENSHOT']) then
 begin
   TBlobField(pFIBDataSet1.FieldByName('SCREENSHOT')).SaveToStream(st);
   st.Seek(0, soBeginning);
   jpg := TJPEGImage.Create;
   jpg.LoadFromStream(st);
   frmScrView := TfrmScrView.Create(Self);
   frmScrView.Image1.Width :=  jpg.Width;
   frmScrView.Image1.Height := jpg.Height;
  // frmScrView.Image1.Picture.Bitmap := TBitmap.Create;
   frmScrView.Image1.Picture.Bitmap.Width :=  jpg.Width;
   frmScrView.Image1.Picture.Bitmap.Height :=  jpg.Height;
   frmScrView.Image1.Picture.Bitmap.Canvas.Draw(0, 0, jpg);
   frmScrView.ShowModal;
   frmScrView.Free;
   jpg.Free;
   st.Free;
 end;
except
  ShowMessage('Не возможно снять копию экрана.');
end;
 pFIBDataSet1.Close;
end;

procedure TfrmSysUsers.BlockButtonClick(Sender: TObject);
var
 note, tt : string;
begin
 if MessageDlg('Ви дійсно бажаєте заблокувати систему?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
 AdminObject.isActivateBlock := True;
 note := '';
 tt := '';
 if not InputQuery('Блокування системи', 'Уведіть причину блокування', note) then Exit;
 if not InputQuery('Блокування системи', 'Уведіть час розблокування', tt) then Exit;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_SYSTEMS_BLOCK', [SystemsDataSet['ID_SYSTEM'], 1, note, tt]);
 StoredProc.Transaction.Commit;
end;

procedure TfrmSysUsers.UnBlockButtonClick(Sender: TObject);
begin
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_SYSTEMS_BLOCK', [SystemsDataSet['ID_SYSTEM'], 0, null, null]);
 StoredProc.Transaction.Commit;
end;

procedure TfrmSysUsers.FormShow(Sender: TObject);
begin
  GetUserListButtonClick(Self);
  pFIBDataSet2.Open;
  cxGrid1.SetFocus;
end;

procedure TfrmSysUsers.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_ESCAPE then Close;
end;


procedure TfrmSysUsers.CloseButtonClick(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте закрити всі програми системи?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
 AdminObject.isActivateBlock := True;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_CLOSE', [SystemsDataSet['ID_SYSTEM'], -1]);
 StoredProc.Transaction.Commit;
end;

procedure TfrmSysUsers.CloseUserButtonClick(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте закрити програму користувача?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
 AdminObject.isActivateBlock := True;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_CLOSE', [SystemsDataSet['ID_SYSTEM'], UsersDataSet['ID_USER']]);
 StoredProc.Transaction.Commit;
end;

procedure TfrmSysUsers.cbSystemsPropertiesCloseUp(Sender: TObject);
begin
// cbSystems.Properties.DataController.
 SystemsDataSet.Locate('NAME_SYSTEM', cbSystems.Text, [loCaseInsensitive]);
end;

end.
