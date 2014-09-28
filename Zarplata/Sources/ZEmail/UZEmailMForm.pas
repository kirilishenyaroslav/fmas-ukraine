unit UZEmailMForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, UZEmailConf,
  pFibStoredProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdMessage, IdIMAP4, ComCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dates, zproc,
  ZSvodLoaderUnit, ZSvodTypesUnit, ztvRegister, ztvBase, ztvZip, ztvMakeSfx,
  IdException, IdEMailAddress, IdHeaderList,
  IdCoderHeader, IdExplicitTLSClientServerBase, IdSMTPBase, IdAttachmentFile,
  idText, cxMemo, accmgmt, cxRadioGroup, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxHyperLinkEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxClasses, RxMemDS, cxCheckBox, IdPOP3,
  IdAntiFreezeBase, IdAntiFreeze, cxSpinEdit, WinSock, Buttons, cxBlobEdit,
  cxButtonEdit, clTcpClient, clMC, clImap4, clMailMessage, clImapUtils;

type
  TSendRes=record
      res:Boolean;
      error_msg:string;
  end;

  TfrmEmailMForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ConfDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ContactsDataSet: TpFIBDataSet;
    SMTP: TIdSMTP;
    Label1: TLabel;
    IdMessage: TIdMessage;
    cxButton5: TcxButton;
    Zip1: TZip;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    Panel4: TPanel;
    cxButton4: TcxButton;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    fio: TcxGridDBColumn;
    email_adress: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ContactsDataSource: TDataSource;
    ContactsRxMemoryData: TRxMemoryData;
    is_select: TcxGridDBColumn;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    IdPOP31: TIdPOP3;
    IdAntiFreeze1: TIdAntiFreeze;
    TN: TcxGridDBColumn;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    cxMemo1: TListBox;
    cxButton1: TcxButton;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxButton10: TcxButton;
    IMAP: TclImap4;
    clMailMessage1: TclMailMessage;
    id_man: TcxGridDBColumn;
    u_password: TcxGridDBColumn;
    Panel5: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure IdMessageInitializeISO(var VHeaderEncoding: Char;
      var VCharSet: String);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton1GetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure cxGridDBTableView1DBColumn7PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButton10Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cxGridDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGridDBTableView1EditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
  private
    { Private declarations }
    Flag:Boolean;
    tmpdir:string;
    BreakFlag:Boolean;
    function GetAttachFile(id_man:Int64;kod_setup:Integer):TFileName;
    function ZipAttachFile(infile:TFileName; pass:String):TFileName;
    function RSpace(instr:String; num:Integer):string;
    procedure ClearLog;
    procedure SaveLog(id_log:Int64);
    function InitLog:Int64;
    procedure AddStrToLog(str, res:string);
    procedure MakeBody(send_value:string; fio:string; u_pass:String);
    procedure WriteProtocol(id_man:Int64;adate:TdateTime;res:Boolean;id_log:Int64;cvalue:string);
    procedure InitSMTPConnection;
    procedure CloseSMTPConnection;
    function SendSMTPMessage(send_value:string; id_man:Int64; adate:TDateTime; u_pass:String; fio:string):TSendRes;
    function SendInfoSMTPMessage(send_value:string; id_man:Int64; adate:TDateTime; fio:string; u_pass:string):TSendRes;
    function SendPswrdSMTPMessage(send_value:string; id_man:Int64; adate:TDateTime; fio:string; u_pass:string):TSendRes;
    function WeakPassword(len: integer): string;
    procedure DoMainMails;
  private
     CurrentBody:string;
     CurrentFrom:String;
     CurrentTo:String;
     CurrentSubject:String;
     curidman:Variant;
     function GetIPAddress : string;
     function GetCompName : string;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;

implementation

uses DateUtils, UZEmailHistory, Unit_ZGlobal_Consts, EmailProtEx,
  cxGridViewData;

{$R *.dfm}

function TfrmEmailMForm.GetCompName : string;
  var
    s : array [0..255] of Char;
    sLen : Longword;
  begin
       sLen := 255;
       GetHostName(s, sLen);
       Result := Trim(s);
  end;

function TfrmEmailMForm.GetIPAddress : string;
  var
    wVerReq: WORD;
    wsaData: TWSAData;
    i: pchar;
    h: PHostEnt;
    c: array[0..128] of char;
  begin
        wVerReq := MAKEWORD(1, 1);
        WSAStartup(wVerReq, wsaData);
        GetHostName(c, 128);
        h := GetHostByName(c);
        i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
        Result := i; //O
        WSACleanup;
  end;


constructor TfrmEmailMForm.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);
     PageControl1.ActivePageIndex:=0;
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     MonthesList.Properties.Items.Text := MonthesList_Text[1];
     self.MonthesList.ItemIndex   := YearMonthFromKodSetup(CurrentKodSetup(WorkDatabase.Handle)-1,False)-1;
     self.YearSpinEdit.Value      := YearMonthFromKodSetup(CurrentKodSetup(WorkDatabase.Handle)-1);

     tmpdir := GetEnvironmentVariable('HOMEDRIVE') + GetEnvironmentVariable('HOMEPATH')+'\';
     ConfDataSet.SelectSQL.Text:='SELECT * FROM Z_EMAIL_SETTINGS_SEL';
     ConfDataSet.Open;
     BreakFlag:=False;

     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailTabs','Belong')=0)
     then begin
               cxButton1.Caption:='Заборонено доступ';
               cxButton1.OnClick:=nil;
     end;

     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailTabsConfigure','Belong')=0)
     then begin
               cxButton3.Caption:='Заборонено доступ';
               cxButton3.OnClick:=nil;
     end;


end;

procedure TfrmEmailMForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmEmailMForm.cxButton3Click(Sender: TObject);
var T:TfrmZEmailConf;
    InsUpdStoredProc:TpFibStoredProc;
begin
     T:=TfrmZEmailConf.Create(self);

     if ConfDataSet.RecordCount>0
     then begin
               if ConfDataSet.FieldByName('server_addr').Value<>null
               then T.SMTP_server.Text:=ConfDataSet.FieldByName('server_addr').Value   ;

               if ConfDataSet.FieldByName('port').Value<>null
               then T.SMTP_port.Value :=ConfDataSet.FieldByName('port').Value          ;

               if ConfDataSet.FieldByName('IMAP_PORT').Value<>null
               then T.IMAP_port.Value :=ConfDataSet.FieldByName('IMAP_PORT').Value          ;

               if ConfDataSet.FieldByName('user_login').Value<>null
               then T.SMTP_user.Text:=ConfDataSet.FieldByName('user_login').Value    ;

               if ConfDataSet.FieldByName('user_pwd').Value<>null
               then T.SMTP_password.Text:=ConfDataSet.FieldByName('user_pwd').Value      ;

               if ConfDataSet.FieldByName('from_addr').Value<>null
               then T.SMTP_account.Text:=ConfDataSet.FieldByName('from_addr').Value     ;

               if ConfDataSet.FieldByName('proxy_type').Value<>null
               then T.Proxy_type.ItemIndex:=ConfDataSet.FieldByName('proxy_type').Value    ;

               if ConfDataSet.FieldByName('proxy_type_str').Value<>null
               then T.Proxy_type.Text:=ConfDataSet.FieldByName('proxy_type_str').Value;

               if ConfDataSet.FieldByName('proxy_server').Value<>null
               then T.Proxy_server.Text:=ConfDataSet.FieldByName('proxy_server').Value  ;

               if ConfDataSet.FieldByName('proxy_port').Value<>null
               then T.Proxy_port.Value:=ConfDataSet.FieldByName('proxy_port').Value    ;

               if ConfDataSet.FieldByName('proxy_user').Value<>null
               then T.Proxy_user.Text:=ConfDataSet.FieldByName('proxy_user').Value    ;

               if ConfDataSet.FieldByName('proxy_password').Value<>null
               then T.Proxy_password.Text:=ConfDataSet.FieldByName('proxy_password').Value;

               if ConfDataSet.FieldByName('use_proxy').Value<>null
               then T.cxCheckBox1.Checked:=ConfDataSet.FieldByName('use_proxy').AsBoolean;

               if ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value<>null
               then T.CheckHistoryMailBox.Checked:=ConfDataSet.FieldByName('USE_HISTORY_FOLDER').AsBoolean;

               if ConfDataSet.FieldByName('HISTORY_FOLDER').Value<>null
               then T.HistoryMailBox.Text:=ConfDataSet.FieldByName('HISTORY_FOLDER').Value;

               if ConfDataSet.FieldByName('Body_template').Value<>null
               then  T.Body_template.Text:=ConfDataSet.FieldByName('Body_template').Value;

               if ConfDataSet.FieldByName('SUBJECT_TEMPLATE').Value<>null
               then t.cxTextEdit1.Text:=ConfDataSet.FieldByName('SUBJECT_TEMPLATE').Value;

               if ConfDataSet.FieldByName('body_info_template').Value<>null
               then t.body_info_template.Text:=ConfDataSet.FieldByName('body_info_template').Value;

               if ConfDataSet.FieldByName('body_pswrd_template').Value<>null
               then t.body_pswrd_template.Text:=ConfDataSet.FieldByName('body_pswrd_template').Value;

               if ConfDataSet.FieldByName('INFO_SUBJECT_TEMPLATE').Value<>null
               then t.INFO_SUBJECT_TEMPLATE.Text:=ConfDataSet.FieldByName('INFO_SUBJECT_TEMPLATE').Value;

               if ConfDataSet.FieldByName('PSWRD_SUBJECT_TEMPLATE').Value<>null
               then t.PSWRD_SUBJECT_TEMPLATE.Text:=ConfDataSet.FieldByName('PSWRD_SUBJECT_TEMPLATE').Value;
     end;

     if T.ShowModal=mrYes
     then begin
               InsUpdStoredProc:=TpFibStoredProc.Create(self);
               InsUpdStoredProc.Database:=WorkDatabase;
               InsUpdStoredProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsUpdStoredProc.StoredProcName:='Z_EMAIL_SETTINGS_IU';
               InsUpdStoredProc.Prepare;
               InsUpdStoredProc.ParamByName('server_addr').Value   :=T.SMTP_server.Text;
               InsUpdStoredProc.ParamByName('port').Value          :=T.SMTP_port.Value;
               InsUpdStoredProc.ParamByName('user_login').Value    :=T.SMTP_user.Text;
               InsUpdStoredProc.ParamByName('user_pwd').Value      :=T.SMTP_password.Text;
               InsUpdStoredProc.ParamByName('from_addr').Value     :=T.SMTP_account.Text;
               InsUpdStoredProc.ParamByName('proxy_type').Value    :=T.Proxy_type.ItemIndex;
               InsUpdStoredProc.ParamByName('proxy_type_str').Value:=T.Proxy_type.Text;
               InsUpdStoredProc.ParamByName('proxy_server').Value  :=T.Proxy_server.Text;
               InsUpdStoredProc.ParamByName('proxy_port').Value    :=T.Proxy_port.Value;
               InsUpdStoredProc.ParamByName('proxy_user').Value    :=T.Proxy_user.Text;
               InsUpdStoredProc.ParamByName('proxy_password').Value:=T.Proxy_password.Text;
               InsUpdStoredProc.ParamByName('use_proxy').Value     :=Integer(T.cxCheckBox1.Checked);

               InsUpdStoredProc.ParamByName('IMAP_PORT').Value:=T.IMAP_port.EditValue;
               InsUpdStoredProc.ParamByName('HISTORY_FOLDER').Value:=T.HistoryMailBox.Text;
               InsUpdStoredProc.ParamByName('USE_HISTORY_FOLDER').Value     :=Integer(T.CheckHistoryMailBox.Checked);
               InsUpdStoredProc.ParamByName('Body_template').Value     :=T.Body_template.Text;
               InsUpdStoredProc.ParamByName('SUBJECT_TEMPLATE').Value  :=T.cxTextEdit1.Text;

               InsUpdStoredProc.ParamByName('body_info_template').Value        :=T.body_info_template.Text;
               InsUpdStoredProc.ParamByName('body_pswrd_template').Value       :=T.body_pswrd_template.text;
               InsUpdStoredProc.ParamByName('INFO_SUBJECT_TEMPLATE').Value     :=T.INFO_SUBJECT_TEMPLATE.Text;
               InsUpdStoredProc.ParamByName('PSWRD_SUBJECT_TEMPLATE').Value    :=T.PSWRD_SUBJECT_TEMPLATE.Text;

               InsUpdStoredProc.ExecProc;
               InsUpdStoredProc.Close;
               InsUpdStoredProc.Free;
               WriteTransaction.commit;
               ConfDataSet.CloseOpen(true);
     end;
     T.Free;
end;

procedure TfrmEmailMForm.cxButton1Click(Sender: TObject);
var ChKod:Integer;
begin
     ChKod:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
     if ChKod<CurrentKodSetup(WorkDatabase.Handle)
     then begin
               PageControl1.ActivePageIndex:=1;
               DoMainMails;
     end
     else ShowMessage('Період перевищує поточний період системи!');
end;

function TfrmEmailMForm.SendSMTPMessage(send_value:string; id_man: Int64; adate: TDateTime; u_pass:string; fio:string):TSendRes;
var attach_file, z_attach_file :TFileName;
    IdAttachmentFile:TIdAttachmentFile;
    Res:TSendRes;
begin

       //Формируем  заголовок и тело письма
       IdMessage.ClearBody;
       IdMessage.Clear;
       IdMessage.MessageParts.Clear;

       MakeBody(send_value, fio , u_pass);


       attach_file:='';

       //формирование табулеграммы по следующим параметрам
       attach_file:=GetAttachFile(id_man,
                                  PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1));

       if FileExists(attach_file)
       then begin
                 //Архивируем файл attach_file с паролем пользователя
                 z_attach_file:=ZipAttachFile(attach_file,u_pass);

                 if FileExists(z_attach_file)
                 then begin
                           //Прикрепляем к письму
                           IdAttachmentFile:=TIdAttachmentFile.Create(IdMessage.MessageParts, z_attach_file);

                           try
                                  SMTP.MailAgent:='FMAS System';

                                  try
                                            SMTP.Send(IdMessage);
                                            Res.res:=True;

                                            if (ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value=1)
                                            then begin
                                                      try
                                                            clMailMessage1.BuildMessage(CurrentBody,[z_attach_file]);
                                                            clMailMessage1.From:=CurrentFrom;
                                                            clMailMessage1.ToList.Add(CurrentTo);
                                                            clMailMessage1.Subject:=CurrentSubject;

                                                            IMAP.AppendMessage(ConfDataSet.FieldByName('HISTORY_FOLDER').AsString,
                                                            clMailMessage1,
                                                            []);

                                                            except on E:Exception do
                                                                   begin
                                                                   end;
                                                      end;
                                            end;
                                  except on E:Exception do
                                         begin
                                              CloseSMTPConnection;
                                              Res.res:=false;
                                              Res.error_msg:=e.Message;
                                              DeleteFile(z_attach_file);
                                              DeleteFile(attach_file);
                                         end;
                                  end;

                           finally
                                  CloseSMTPConnection;
                                  DeleteFile(z_attach_file);
                                  DeleteFile(attach_file);
                           end;
                           DeleteFile(z_attach_file);
                           DeleteFile(attach_file);
                 end;
                 DeleteFile(attach_file);
                 DeleteFile(attach_file);
       end
       else begin
                CloseSMTPConnection;
                Res.res:=False;
       end;

       Result:=Res;
end;

procedure TfrmEmailMForm.CloseSMTPConnection;
begin
       if SMTP.Connected
       then SMTP.Disconnect;

       if (ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value=1)
       then begin
                 if IMAP.Active
                 then begin
                           IMAP.close;
                 end;
       end;
end;

procedure TfrmEmailMForm.InitSMTPConnection;
begin
       SMTP.Host:=ConfDataSet.FieldByName('server_addr').AsString;
       SMTP.Port:=ConfDataSet.FieldByName('port').Value;
       SMTP.Username:=ConfDataSet.FieldByName('user_login').AsString;
       SMTP.Password:=ConfDataSet.FieldByName('user_pwd').AsString;

       try

       SMTP.Connect;
       except on E:Exception do
              begin
                   ShowMessage('Помилка SMTP');
              end
       end;

       if (ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value=1)
       then begin
                 Imap.Server  :=ConfDataSet.FieldByName('server_addr').AsString;
                 IMAP.Port    :=ConfDataSet.FieldByName('IMAP_PORT').Value;
                 IMAP.Username:=ConfDataSet.FieldByName('user_login').AsString;
                 IMAP.Password:=ConfDataSet.FieldByName('user_pwd').AsString;

                 try

                 IMAP.Open;
                 except on E:Exception
                 do
                      begin
                           ShowMessage('Помилка IMAP');
                      end;

                 end;
       end;
end;

procedure TfrmEmailMForm.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmEmailMForm.cxButton5Click(Sender: TObject);
begin
     BreakFlag:=True;
end;

procedure TfrmEmailMForm.IdMessageInitializeISO(var VHeaderEncoding: Char;
  var VCharSet: String);
begin
     VHeaderEncoding := 'Q';
     VCharSet := 'windows-1251';
end;

function TfrmEmailMForm.GetAttachFile(id_man: Int64;
  kod_setup: Integer): TFileName;
var parameter:TZAccListParameter;
    Res:string;
begin
     Res:='';
     try
             parameter.Kod_Setup:=kod_setup;
             parameter.Id_Department:=parameter.Kod_Setup;
             parameter.Id_Man:=id_man;
             parameter.Id_Group_Account:=-1;
             parameter.TypeData:=0;
             parameter.DB_Handle:=WorkDatabase.Handle;
             parameter.AOwner:=Self;
             parameter.path:=tmpdir;
             parameter.typeoper:=1;
             Res:=PrintRaschList(parameter);
     except on E:Exception do
     begin
            ShowMessage(E.Message);
     end;
     end;

     Result:=Res;
end;

function TfrmEmailMForm.ZipAttachFile(infile: TFileName; pass:String): TFileName;
var Res:string;
begin
     try
           Zip1.FileSpec.Add(infile);
           Zip1.Password:=pass;
           Zip1.ArchiveFile:=infile+'.zip';
           Zip1.Compress;
           Res:= Zip1.ArchiveFile;
           except on E:Exception do
           begin
                ShowMessage(E.Message);
                Res:='';
           end;
     end;
     Result:=Res;
end;

procedure TfrmEmailMForm.MakeBody(send_value:string; fio:string; u_pass:String);
 var idtTextPart :TIdText;
     tBOdy, tsubject:String;
begin
       //Формирование заголовка письма
       IdMessage.From.Name                :=ConfDataSet.FieldByName('from_addr').AsString;
       IdMessage.From.Address             :=ConfDataSet.FieldByName('from_addr').AsString;
       IdMessage.Recipients.EMailAddresses:=send_value;


       //clMailMessage1.Clear;
       //clMailMessage1.Bodies.Clear;


       CurrentFrom   :=ConfDataSet.FieldByName('from_addr').AsString;
       CurrentTo     :=send_value;



       //Обработка шаблона
       if cxRadioButton1.Checked then tsubject:=ConfDataSet.FieldByName('SUBJECT_TEMPLATE').AsString;
       if cxRadioButton2.Checked then tsubject:=ConfDataSet.FieldByName('INFO_SUBJECT_TEMPLATE').AsString;
       if cxRadioButton3.Checked then tsubject:=ConfDataSet.FieldByName('PSWRD_SUBJECT_TEMPLATE').AsString;

       //В будущем можно сделать через таблицу соответствий между названием шаблона и алгоритмом его получения в из БД
       tsubject:=StringReplace(tsubject, '%FIO%',   FIO, [rfReplaceAll, rfIgnoreCase]);
       tsubject:=StringReplace(tsubject, '%PSWRD%', u_pass, [rfReplaceAll, rfIgnoreCase]);
       tsubject:=StringReplace(tsubject, '%DATE%',  Dates.MonthNumToName(MonthesList.ItemIndex+1)+'   '+YearSpinEdit.Text, [rfReplaceAll, rfIgnoreCase]);

       IdMessage.Subject                  :=tsubject;
       CurrentSubject:=tsubject;


       //Формирование тела письма
       IdMessage.MessageParts.Clear;

       idtTextPart := TIdText.Create(IdMessage.MessageParts, nil);
       idtTextPart.ContentType := 'text/plain';
       idtTextPart.CharSet := 'windows-1251';

       //Обработка шаблона
       if cxRadioButton1.Checked then tBOdy:=ConfDataSet.FieldByName('body_template').AsString;
       if cxRadioButton2.Checked then tBOdy:=ConfDataSet.FieldByName('body_info_template').AsString;
       if cxRadioButton3.Checked then tBOdy:=ConfDataSet.FieldByName('body_pswrd_template').AsString;

       tBOdy:=StringReplace(tBOdy, '%FIO%',   fio, [rfReplaceAll, rfIgnoreCase]);
       tBOdy:=StringReplace(tbody, '%PSWRD%', u_pass, [rfReplaceAll, rfIgnoreCase]);
       tBOdy:=StringReplace(tbody, '%DATE%',  Dates.MonthNumToName(MonthesList.ItemIndex+1)+'   '+YearSpinEdit.Text, [rfReplaceAll, rfIgnoreCase]);

       CurrentBody:=tBOdy;

       idtTextPart.Body.Add(tBOdy);
end;

procedure TfrmEmailMForm.WriteProtocol(id_man:Int64;adate:TdateTime;res:Boolean;id_log:Int64;cvalue:string);
var PrSP:TpFIBStoredProc;
begin
     PrSP:=TpFIBStoredProc.Create(self);
     PrSP.Database:=WorkDatabase;
     PrSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     PrSP.StoredProcName:='Z_EMAIL_PROTOCOL_INS';
     PrSP.Prepare;
     PrSP.ParamByName('id_man').AsInt64:=id_man;
     PrSP.ParamByName('send_result').Value  :=Integer(res);
     PrSP.ParamByName('id_log').AsInt64     :=id_log;
     PrSP.ParamByName('contact_value').value     :=cvalue;
     PrSP.ParamByName('pwdissend').value     :=0;

     if cxRadioButton1.Checked then PrSP.ParamByName('message_type').Value:=1;
     if cxRadioButton2.Checked then PrSP.ParamByName('message_type').Value:=2;
     if cxRadioButton3.Checked
     then begin
               PrSP.ParamByName('message_type').Value  :=3;
               PrSP.ParamByName('pwdissend').value     :=1;
     end;

     PrSP.ExecProc;
     WriteTransaction.Commit;
     PrSP.Close;
     PrSP.Free;
end;

procedure TfrmEmailMForm.ClearLog;
begin
     cxMemo1.Items.Clear;
     cxMemo1.Clear;
end;

procedure TfrmEmailMForm.AddStrToLog(str, res: string);
begin
     cxMemo1.Items.Add(str) ;
     cxMemo1.Update;
end;

function TfrmEmailMForm.RSpace(instr: String; num: Integer): string;
var i:Integer;
    res:string;
begin
     res:=instr;
     for i:=1 to num do
     begin
          res:=res+#32;
     end;
     result:=res;
end;


procedure TfrmEmailMForm.DoMainMails;
var res:Boolean;
    res_:TSendRes;
    ostr:string;
    id_log:Int64;
    i:Integer;
    ManCount,EmailCount:Integer;
begin
     ManCount:=0;
     EmailCount:=0;

     ClearLog;
     ConfDataSet.CloseOpen(true);
     if (ConfDataSet.RecordCount>0)
     then begin
               if ContactsRxMemoryData.Active
               then begin
                         BreakFlag:=False;
                         id_log:=InitLog;

                         AddStrToLog('Користувач:   '+AccMgmt.GetUserFIO,'');
                         AddStrToLog('IP:  '+ GetIPAddress,'' );
                         AddStrToLog('Найменування комп''''ютера:  '+ GetCompName,'');
                         AddStrToLog('Час формування:  '+ DateTimeToStr(Date),'' );
                         AddStrToLog('Ініціалізація списку розсилання....','');

                         ProgressBar1.Position:=0;
                         ProgressBar1.Update;
                         ProgressBar1.Max:=cxGridDBTableView1.ViewData.RowCount;
                         ProgressBar1.Min:=0;
                         ProgressBar1.Step:=1;

                         curidman:=cxGridDBTableView1.ViewData.Rows[i].Values[id_man.Index];

                         Flag:=false;

                         cxButton2.Enabled:=False;
                         cxButton5.Visible:=True;
                         Panel5.Caption:='Оброблено 0 позицій з '+InttoStr(cxGridDBTableView1.ViewData.RowCount);
                         Panel5.Update;
                         Application.ProcessMessages;

                         for i:=0 to cxGridDBTableView1.ViewData.RowCount-1 do
                         begin
                              if cxGridDBTableView1.ViewData.Rows[i].Values[is_select.Index]=1
                              then begin
                                        ManCount:=ManCount+1;
                                        InitSMTPConnection;

                                        Label1.Caption:=VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[fio.Index]);
                                        Label1.Update;



                                        Application.ProcessMessages;

                                        try
                                               try
                                               res:=False;

                                                   if cxRadioButton1.Checked then res_:=SendSMTPMessage(VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[email_adress.Index]),
                                                                                                        cxGridDBTableView1.ViewData.Rows[i].Values[id_man.Index],
                                                                                                        ConvertKodToDate(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)),
                                                                                                        VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[u_password.Index]),
                                                                                                        VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[fio.Index]));
                                                   if cxRadioButton2.Checked then res_:=SendInfoSMTPMessage(VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[email_adress.Index]),
                                                                                                            cxGridDBTableView1.ViewData.Rows[i].Values[id_man.Index],
                                                                                                            ConvertKodToDate(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)),
                                                                                                            VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[fio.Index]),
                                                                                                            VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[u_password.Index]));
                                                   if cxRadioButton3.Checked then res_:=SendPswrdSMTPMessage(VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[email_adress.Index]),
                                                                                                             cxGridDBTableView1.ViewData.Rows[i].Values[id_man.Index],
                                                                                                             ConvertKodToDate(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)),
                                                                                                             VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[fio.Index]),
                                                                                                             VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[u_password.Index]));

                                                   res:=res_.res;

                                                   except on E:Exception do
                                                   begin
                                                        res:=False;
                                                   end;
                                               end;

                                               WriteProtocol(cxGridDBTableView1.ViewData.Rows[i].Values[id_man.Index],
                                                             ConvertKodToDate(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)),
                                                             res,
                                                             id_log,
                                                             VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[email_adress.Index]));

                                               ostr:=VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[TN.Index])+'  '+
                                                     VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[fio.Index]) +' '+
                                                     VarToStr(cxGridDBTableView1.ViewData.Rows[i].Values[email_adress.Index]);

                                               if res
                                               then begin
                                                         AddStrToLog(ostr+^I+'OK!','');
                                                         EmailCount:=EmailCount+1;
                                               end
                                               else AddStrToLog(ostr+^I+'Error!  '+res_.error_msg,'');

                                        finally
                                               ProgressBar1.StepIt;
                                               CloseSMTPConnection;
                                        end;




                              end;
                              Panel5.Caption:='Оброблено '+IntToStr(i+1)+' позицій з '+InttoStr(cxGridDBTableView1.ViewData.RowCount);
                              Panel5.Update;
                              Application.ProcessMessages;

                         end;

                         Panel5.Caption:='';
                         Panel5.Update;
                         Application.ProcessMessages;


                         Label1.Caption:='';
                         Label1.Update;

                         AddStrToLog(' Оброблено '+IntToStr(ManCount)+' фізичних осіб' ,'');
                         AddStrToLog(' Розіслано '+IntToStr(EmailCount)+' поштових повідомлень' ,'');

                         ShowMessage('Розсилку завершено!');

                         ProgressBar1.Position:=0;
                         ProgressBar1.Update;

                         cxButton2.Enabled:=true;
                         cxButton5.Visible:=false;

                         SaveLog(id_log);
                         ContactsRxMemoryData.Locate('id_man',curidman,[]);
               end
               else ShowMessage('Не сформований список адресатів!');
     end
     else ShowMessage('Розсилка не конфігурована!');
end;


function TfrmEmailMForm.SendInfoSMTPMessage(send_value: string; id_man: Int64; adate: TDateTime; fio:string; u_pass:string): TSendRes;
var attach_file, z_attach_file :TFileName;
    Res:TSendRes;
begin

       //Формируем  заголовок и тело письма
       MakeBody(send_value, fio, u_pass);

       try
              SMTP.MailAgent:='FMAS System';
              SMTP.Send(IdMessage);
              Res.res:=True;

              if (ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value=1)
              then begin
                        try
                                  try
                                        clMailMessage1.BuildMessage(CurrentBody,[]);
                                                            clMailMessage1.From:=CurrentFrom;
                                                            clMailMessage1.ToList.Add(CurrentTo);
                                                            clMailMessage1.Subject:=CurrentSubject;





                                        IMAP.AppendMessage(ConfDataSet.FieldByName('HISTORY_FOLDER').AsString,
                                        clMailMessage1,
                                        []);

                                        except on E:Exception do
                                               begin
                                                    res.res:=False;
                                                    Res.error_msg:=e.Message;
                                               end;
                                  end;
                              except on E:Exception do
                              begin
                                    Res.res:=false;
                                    Res.error_msg:=e.Message;
                              end;
                        end;
              end;
       finally
              CloseSMTPConnection;
       end;

       Result:=Res;
end;

function TfrmEmailMForm.SendPswrdSMTPMessage(send_value: string; id_man: Int64; adate: TDateTime; fio:string; u_pass:string): TSendRes;
var attach_file, z_attach_file :TFileName;
    Res:TSendRes;
begin

       //Формируем  заголовок и тело письма
       MakeBody(send_value, fio, u_pass);

       SMTP.MailAgent:='FMAS System';
       SMTP.Send(IdMessage);
       Res.res:=True;

       try
              if (ConfDataSet.FieldByName('USE_HISTORY_FOLDER').Value=1)
              then begin
                        try
                                              try
                                                    clMailMessage1.BuildMessage(CurrentBody,[]);
                                                            clMailMessage1.From:=CurrentFrom;
                                                            clMailMessage1.ToList.Add(CurrentTo);
                                                            clMailMessage1.Subject:=CurrentSubject;



                                                    IMAP.AppendMessage(ConfDataSet.FieldByName('HISTORY_FOLDER').AsString,
                                                    clMailMessage1,
                                                    []);

                                                    except on E:Exception do
                                                           begin
                                                                res.res:=false;
                                                                Res.error_msg:=e.Message;
                                                           end;
                                              end;
                              except on E:Exception do
                              begin
                                   Res.res:=false;
                                   Res.error_msg:=e.Message;
                              end;
                        end;
              end;
       finally
              CloseSMTPConnection;
       end;

       Result:=Res;
end;

procedure TfrmEmailMForm.cxButton4Click(Sender: TObject);
begin
     cxGrid1.BeginUpdate;

     ContactsRxMemoryData.EmptyTable;

     if ContactsDataSet.Active then ContactsDataSet.Close;
     ContactsDataSet.SelectSQL.Text:='SELECT * FROM Z_EMAIL_GET_CONTACTS('+IntToStr(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1))+',0)';
     ContactsDataSet.Open;
     ContactsDataSet.FetchAll;

     if ContactsRxMemoryData.Active then ContactsRxMemoryData.Close;
     ContactsRxMemoryData.CopyStructure(ContactsDataSet);
     ContactsRxMemoryData.LoadFromDataSet(ContactsDataSet,ContactsDataSet.RecordCount,lmCopy);

     cxGrid1.EndUpdate;
end;

procedure TfrmEmailMForm.cxButton6Click(Sender: TObject);
begin
     cxGrid1.BeginUpdate;

     ContactsRxMemoryData.EmptyTable;

     if ContactsDataSet.Active then ContactsDataSet.Close;
     ContactsDataSet.SelectSQL.Text:='SELECT * FROM Z_EMAIL_GET_CONTACTS('+IntToStr(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1))+',1)';
     ContactsDataSet.Open;
     ContactsDataSet.FetchAll;

     if ContactsRxMemoryData.Active then ContactsRxMemoryData.Close;
     ContactsRxMemoryData.CopyStructure(ContactsDataSet);
     ContactsRxMemoryData.LoadFromDataSet(ContactsDataSet,ContactsDataSet.RecordCount,lmCopy);

     cxGrid1.EndUpdate;
end;

procedure TfrmEmailMForm.cxButton7Click(Sender: TObject);
begin
     cxGrid1.BeginUpdate;

     ContactsRxMemoryData.EmptyTable;

     if ContactsDataSet.Active then ContactsDataSet.Close;
     ContactsDataSet.SelectSQL.Text:='SELECT * FROM Z_EMAIL_GET_CONTACTS('+IntToStr(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1))+',0)';
     ContactsDataSet.Open;
     ContactsDataSet.FetchAll;

     if ContactsRxMemoryData.Active then ContactsRxMemoryData.Close;
     ContactsRxMemoryData.CopyStructure(ContactsDataSet);
     ContactsRxMemoryData.LoadFromDataSet(ContactsDataSet,ContactsDataSet.RecordCount,lmCopy);

     cxGrid1.EndUpdate;
end;

procedure TfrmEmailMForm.cxButton8Click(Sender: TObject);
var i:Integer;
    ltn:Variant;
begin
     cxGrid1.BeginUpdate;
     ContactsRxMemoryData.First;

     while not ContactsRxMemoryData.Eof do
     begin

     if  (ContactsRxMemoryData.FieldByName('TN').Value<>NULL)
     then begin
               ContactsRxMemoryData.Edit;
               ContactsRxMemoryData.FieldByName('is_select').Value:=1-ContactsRxMemoryData.FieldByName('is_select').Value;
               ContactsRxMemoryData.Post;
     end;

     ContactsRxMemoryData.Next;
     end;
     cxGrid1.EndUpdate;
end;

procedure TfrmEmailMForm.SaveLog(id_log:Int64);
var PrSP:TpFIBStoredProc;
begin
     PrSP:=TpFIBStoredProc.Create(self);
     PrSP.Database:=WorkDatabase;
     PrSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     PrSP.StoredProcName:='Z_EMAIL_LOGS_INS';
     PrSP.Prepare;
     PrSP.ParamByName('LOG_VALUE').Value:=cxMemo1.Items.Text;
     PrSP.ParamByName('ID_LOG').AsInt64:=id_log;
     PrSP.ExecProc;
     WriteTransaction.Commit;
     PrSP.Close;
     PrSP.Free;
end;

function TfrmEmailMForm.InitLog: Int64;
var PrSP:TpFIBStoredProc;
    id_log:Int64;
begin
     PrSP:=TpFIBStoredProc.Create(self);
     PrSP.Database:=WorkDatabase;
     PrSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     PrSP.StoredProcName:='Z_EMAIL_LOGS_INIT';
     PrSP.Prepare;
     if cxRadioButton1.Checked then PrSP.ParamByName('LOG_TYPE').Value:=1;
     if cxRadioButton2.Checked then PrSP.ParamByName('LOG_TYPE').Value:=2;
     if cxRadioButton3.Checked then PrSP.ParamByName('LOG_TYPE').Value:=3;

     PrSP.ParamByName('COMPUTER_NAME').Value:=GetCompName;
     PrSP.ParamByName('USER_NAME').Value    :=accmgmt.GetUserFIO;
     PrSP.ParamByName('IP').Value           :=GetIPAddress;
     PrSP.ParamByName('Z_KOD_SETUP').Value  :={ConvertKodToDate(}PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1){)};

     PrSP.ExecProc;
     id_log:=PrSP.ParamByName('ID_LOG').AsInt64;

     WriteTransaction.Commit;
     PrSP.Close;
     PrSP.Free;

     Result:=id_log;
end;

procedure TfrmEmailMForm.cxButton9Click(Sender: TObject);
begin
     with TfrmZEmailHistory.Create(self, WorkDatabase.Handle) do
     begin
          ShowModal;
          Free;
     end;
end;

procedure TfrmEmailMForm.cxButton1GetDrawParams(Sender: TcxCustomButton;
  AState: TcxButtonState; var AColor: TColor; AFont: TFont);
begin
     AColor:=RGB(187,187,187);
     AFont.Color:=clREd;
end;


procedure TfrmEmailMForm.cxGridDBTableView1DBColumn7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
     with TfrmEmailProtokolEx.Create(Self,WorkDatabase.Handle,-1,ContactsRxMemoryData.FieldByName('id_man').value) do
     begin
          ShowModal;
          Free;
     end;
end;

procedure TfrmEmailMForm.cxButton10Click(Sender: TObject);
var res:Boolean;
    ostr:string;
    UpdateSP:TpFIBStoredProc;
begin
     if Application.MessageBox('Ви дійсно хочете переформувати паролі доступу у адресатів, які були виділені для розсилки?' 
       + #13#10 +
       'Це може привести до суттєвих проблем з отриманням адресатами результатів розсилки!', 
       'Увага!', MB_YESNO + MB_ICONWARNING) = IDYES
     then begin
               ClearLog;
               if ContactsRxMemoryData.Active
               then begin
                         BreakFlag:=False;
                         PageControl1.ActivePageIndex:=1;

                         AddStrToLog('Користувач:   '+AccMgmt.GetUserFIO,'');
                         AddStrToLog('IP:  '+ GetIPAddress,'' );
                         AddStrToLog('Найменування комп''''ютера:  '+ GetCompName,'' );
                         AddStrToLog('Час переформування паролів:  '+ DateTimeToStr(Date),'' );
                         AddStrToLog('Ініціалізація переформування паролів....','');

                         ProgressBar1.Position:=0;
                         ProgressBar1.Update;
                         ProgressBar1.Max:=ContactsRxMemoryData.RecordCount;
                         ProgressBar1.Min:=0;
                         ProgressBar1.Step:=1;

                         ContactsRxMemoryData.First;
                         Flag:=false;

                         cxButton2.Enabled:=False;
                         cxButton5.Visible:=True;

                         UpdateSP:=TpFIBStoredProc.Create(self);
                         UpdateSP.Database:=WorkDatabase;
                         UpdateSP.Transaction:=WriteTransaction;
                         UpdateSP.StoredProcName:='Z_EMAIL_DATES_UPD_PWD';

                         while (not ContactsRxMemoryData.Eof) and (not BreakFlag) do
                         begin
                              if ContactsRxMemoryData.FieldByName('is_select').Value=1
                              then begin

                                        Label1.Caption:=ContactsRxMemoryData.FieldByName('fio').AsString;
                                        Label1.Update;

                                        Application.ProcessMessages;

                                        try
                                               try
                                                   res:=False;

                                                   WriteTransaction.StartTransaction;
                                                   UpdateSP.Prepare;
                                                   UpdateSP.ParamByName('id_man').Value:=ContactsRxMemoryData.FieldByName('id_man').Value;
                                                   UpdateSP.ParamByName('actual_date').Value:=Date;
                                                   UpdateSP.ParamByName('u_password').Value:=WeakPassword(8);
                                                   UpdateSP.ExecProc;

                                                   WriteTransaction.Commit;
                                                   res:=true;
                                                   UpdateSP.Close;

                                                   except on E:Exception do
                                                   begin
                                                        res:=False;
                                                   end;
                                               end;


                                               ostr:=ContactsRxMemoryData.FieldByName('TN').AsString+'  '+ContactsRxMemoryData.FieldByName('FIO').AsString +' '+ContactsRxMemoryData.FieldByName('contact_value').AsString;

                                               if res
                                               then begin
                                                         AddStrToLog(ostr+^I+'OK!','');
                                               end
                                               else AddStrToLog(ostr+^I+'Error!','');

                                        finally
                                               ProgressBar1.StepIt;
                                        end;
                              end;
                              ContactsRxMemoryData.Next;

                         end;

                         Label1.Caption:='';
                         Label1.Update;

                         ShowMessage('Перегенерація паролів доступу завершено!');
                         cxButton4Click(Self);

                         ProgressBar1.Position:=0;
                         ProgressBar1.Update;

                         cxButton2.Enabled:=true;
                         cxButton5.Visible:=false;
               end
               else ShowMessage('Не сформований список адресатів для перегенерації паролів!');
     end;          
end;

function TfrmEmailMForm.WeakPassword(len: integer): string;
var
  c: integer;
  ch: AnsiChar;
  key: array [0 .. 7] of longint;
  a, b: longint;
  x: int64;
 
  procedure morph();
  var
    r: longint;
  begin
 
    r := -1;
    repeat
      Inc(r);
      Inc(b, a + ((a shl 6) xor (a shr 8)) + (key[r mod 8] + r));
      Inc(r);
      Inc(a, b + ((b shl 6) xor (b shr 8)) + (key[r mod 8] + r));
    until r = 63;
 
  end;
 
  function RND(): byte;
  begin
    morph();
    Result := (a + b) mod $100;
  end;
 
  function RND32(idx: integer): longint;
  begin
    morph();
    case idx of
      0:
        Result := a;
      1:
        Result := b;
    end;
 
  end;
 
begin
 
  Result := '';
 
  for c := 0 to 7 do
    key[c] := random($FFFFFFFF);
 
  b := 0;
  a := GetTickCount;
  a := RND32(0);
  if QueryPerformanceCounter(x) then
    b := (x {shr 0}) and $FFFFFF
  else
    b := 0;
  b := RND32(1);
 
{for c := 0 to $FFFF do Morph();}
 
 
  c := 0;
 
  while c < len do
  begin
 
    ch := AnsiChar(RND());
 
    if ch in ['a' .. 'z', 'A' .. 'Z', '0' .. '9'] then
    begin
      Result := Result + ch;
      Inc(c);
    end; {else morph();}
 
  end;
 
end;


procedure TfrmEmailMForm.PageControl1Change(Sender: TObject);
begin
     if PageControl1.ActivePageIndex=0
     then
     ;

end;

procedure TfrmEmailMForm.cxGridDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=null)
      then begin
                AStyle:=cxStyle3;
                {if AItem.Index=is_select.Index
                then begin
                          AItem.Options.Editing:=false;
                end;}
      end
      else begin
                AStyle:=cxStyle2;
                {if AItem.Index=is_select.Index
                then begin
                          AItem.Options.Editing:=true;
                end;}
      end;



end;

procedure TfrmEmailMForm.cxGridDBTableView1EditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
     if AItem.Index=is_select.Index
     then begin
                if sender.Controller.FocusedRecord.Values[0]=null
                then begin
                          AItem.EditValue:=0;  // Options.Editing:=false;
                end
                else begin
                          //AItem.Options.Editing:=true;
                end;

     end;
end;

end.
