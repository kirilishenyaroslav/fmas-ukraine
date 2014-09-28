unit BankMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, FIBDatabase, pFIBDatabase, IniFiles, GlobalSPR,
  DB, FIBDataSet, pFIBDataSet, Un_lo_file_Alex, Un_R_file_Alex, StdCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, jpeg, ExtCtrls, cxGraphics,
  dxStatusBar, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, AppEvnts, fib;


type
  TfmBankMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N21: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    n5: TMenuItem;
    N11: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    ImageList1: TImageList;
    pFIBDataSet1: TpFIBDataSet;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    N6: TMenuItem;
    N12: TMenuItem;
    Image1: TImage;
    N61: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    cxLabel1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    dxStatusBar1: TdxStatusBar;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N22: TMenuItem;
    miAdmin: TMenuItem;
    N8: TMenuItem;
    N16: TMenuItem;
    N7: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N38: TMenuItem;
    N25: TMenuItem;
    N62: TMenuItem;
    Twr: TpFIBTransaction;
    St: TpFIBStoredProc;
    N39: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    ApplicationEvents1: TApplicationEvents;
    nastr_bank: TMenuItem;
    N9: TMenuItem;
    Report: TMenuItem;
    NASTR_TRANZ: TMenuItem;
    NASTR_Invoice: TMenuItem;
    AnalizeErProvs: TMenuItem;
    N10: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure Form_Show_Bank;
    procedure N16Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxLabel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N24Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure nastr_bankClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure NASTR_TRANZClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NASTR_InvoiceClick(Sender: TObject);
    procedure AnalizeErProvsClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
  private
    jj : integer;
    sf : boolean;
  public
    id_user : int64;
    id_pcard : int64;
  end;

var
  fmBankMainForm: TfmBankMainForm;

implementation
uses SplashFormBank,
     LogInFormUnitBank,
     BankInfo,
     PrintBankJo,
     LoaderClBank,
     dogLoaderUnit,
     AccMgmt,
     LoadDogManedger,
     SYSAdmin,
     SpravkaLoader,
     uPwdDecrypt,
     //BankServicePereschet,
     SpravkaUnitCaption,
     Un_What_new,
     Un_Progress_form,
     PrintBankGr;
     
{$R *.dfm}

procedure TfmBankMainForm.FormCreate(Sender: TObject);
begin
    sf := false;
    Caption       := Un_R_file_Alex.BANK_MAIN_FORM_CAPTION_A;
    N1.Caption    := Un_R_file_Alex.KASSA_N1;
    N2.Caption    := Un_R_file_Alex.KASSA_N2;
    N3.Caption    := Un_R_file_Alex.KASSA_N3;
    N4.Caption    := Un_R_file_Alex.KASSA_N5;
    N5.Caption    := Un_R_file_Alex.KASSA_N6;
    N6.Caption    := Un_R_file_Alex.KASSA_N4;
    N11.Caption   := Un_R_file_Alex.KASSA_N7;
    N12.Caption   := Un_R_file_Alex.BANK_N12;
    N21.Caption   := Un_R_file_Alex.BANK_N21;
    N31.Caption   := Un_R_file_Alex.KASSA_N13;//баллансов. счета
    N32.Caption   := Un_R_file_Alex.KASSA_N14;//сметы
    N34.Caption   := Un_R_file_Alex.KASSA_N8;//Справочник КЭКЗов;
    N61.Caption   := Un_R_file_Alex.BANK_N61;
    N62.Caption   := Un_R_file_Alex.BANK_N62[1];
    N14.Caption   := Un_R_file_Alex.BANK_N14;
    N15.Caption   := Un_R_file_Alex.BANK_N15;
    N35.Caption   := Un_R_file_Alex.BANK_N35;
    N36.Caption   := Un_R_file_Alex.BANK_N36;
    N37.Caption   := Un_R_file_Alex.BANK_N37;
    N16.Caption   := Un_R_file_Alex.BANK_N16;
    N22.Caption   := Un_R_file_Alex.BANK_N22;
    N23.Caption   := Un_R_file_Alex.BANK_N23;
    N24.Caption   := Un_R_file_Alex.BANK_N24;
    N38.Caption   := Un_R_file_Alex.BANK_N38;
    N51.Caption   := Un_R_file_Alex.J4_MAIN_N61;
    N52.Caption   := Un_R_file_Alex.BANK_CHANGES;
    N25.Caption   := Un_R_file_Alex.BANK_N25;
    N9.Caption    := Un_R_file_Alex.CLBANK_CHANGES;
    NASTR_TRANZ.Caption    := Un_R_file_Alex.BANK_NASTR_TRANZ_SCH;
    AnalizeErProvs.Caption := Un_R_file_Alex.BANK_ANALYZ_ER_Prov;
    Report.Caption    := Un_R_file_Alex.BANK_PRINT_PERIOD;
    nastr_bank.Caption   := Un_R_file_Alex.BANK_N38;
    Label2.Caption       := Un_R_file_Alex.MY_USER;
    cxLabel1.Caption     := Un_R_file_Alex.BANK_CAP;
    N38.Visible          := False;
    Form_Show_Bank;
end;

procedure TfmBankMainForm.Form_Show_Bank;
var
    reg : TIniFile;
    NagScreen : TfmSplashFormBank;
    //Form : TfmLogInFormUnitBank;
    //Res : WIN32_FIND_DATA;
    //Res_file : THandle;
    //name,
    path : string;
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
{  Form := TfmLogInFormUnitBank.Create(Self);
  if Form.ShowModal <> mrOk
  then begin
    jj := 0;
    close;
    Application.Terminate;
    Close;
  end else
  begin}
    jj := 1;
    // Запускаем логотип системы
    NagScreen := TfmSplashFormBank.Create(self);
    NagScreen.Label1.Caption := '';
    NagScreen.Show;
    NagScreen.Repaint;
    // Читаем настройки из файла настроек
    NagScreen.DrawText('Считываем настройки из файла "config.ini" ...');
    reg := TIniFile.Create('.\config.ini');
//    Database.DatabaseName := reg.ReadString('CONNECTION','Server','') + ':' + reg.ReadString('CONNECTION','Path','');
    dxStatusBar1.Panels[0].Text := 'База : ' + reg.ReadString('CONNECTION','Path','');
//    Database.DBParams.Clear;
//	  Database.DBParams.Add('user_name=' + reg.ReadString('CONNECTION','USER',''));
//    Database.DBParams.Add('password='  + PwdDeCrypt(reg.ReadString('CONNECTION','Password_Crypted','')));
//    Database.SQLDialect := StrToInt(reg.ReadString('CONNECTION','SQLDialect','3'));
    // Считываем дополнительные параметры

//	Database.DBParams.Add('lc_ctype='  + reg.ReadString('Sklad_Params','CHARSET','WIN1251'));
    // Соединение с БД
    NagScreen.DrawText(Un_R_file_Alex.FORM_DATABASE_OPEN);
{    try
        Database.Open;
    except on E:Exception
        do begin
//            MessageDlg('Увага', 'При соединении с БД возникла ошибка: "' + E.Message + '"',mtError,[mbOk]);
            Application.Terminate;
        end;
    end;
}
    NagScreen.cxProgressBar1.Position := 20;
    NagScreen.Update;
    try
        path     := ExtractFilepath(Application.ExeName)+'Bank\BankDay.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankDay.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
//       LoadPackage(path);
        path     := ExtractFilepath(Application.ExeName)+'Bank\BankDocument.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankDocument.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
//       LoadPackage(path);
        path     := ExtractFilepath(Application.ExeName)+'WorkDog\'+'dogMain.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'dogMain.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
        LoadPackage(path);

        path     := ExtractFilepath(Application.ExeName)+'Bank\BankFindDocument.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankFindDocument.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;

        NagScreen.cxProgressBar1.Position := 100;
        NagScreen.Update;
    finally
//        Form.Free;
        NagScreen.Free;
    end;
    id_user := GetUserID;
//   end;
    dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_USER + '  -  ' + GetUserFIO;
                                             {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    Label1.Caption   := GetUserFIO;

   //LoadSysData(pFIBTransaction1);
    sf := true;
end;

procedure TfmBankMainForm.N11Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    Un_lo_file_Alex.LBankDayEdit(self, id_user, database);
end;

procedure TfmBankMainForm.N4Click(Sender: TObject);
begin
    Close;
end;

procedure TfmBankMainForm.N12Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Find_documents','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    Un_lo_file_Alex.LBankShowFindOrder(self, id_user, database);
end;

procedure TfmBankMainForm.N21Click(Sender: TObject);
var
    T : TfmPrintBankJo;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Month','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    T := TfmPrintBankJo.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankMainForm.N31Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_sch','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSPR.GetSch(self, Database.Handle, FSMDIChild, Date, 1, 0, 0);
end;

procedure TfmBankMainForm.N32Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_smeta','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSPR.GetSmets(self, Database.Handle, Date, psmSmet);
end;

procedure TfmBankMainForm.N33Click(Sender: TObject);
begin
    GlobalSPR.GetSmets(self, Database.Handle, Date, psmRazdSt);
end;

procedure TfmBankMainForm.N34Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_Kekv','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSPR.GetKEKVSpr(self, Database.Handle, fsNormal, Date, 1);
end;

procedure TfmBankMainForm.N14Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Import','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoaderClBank.LoadRunClBank(self, Database.Handle)
end;

procedure TfmBankMainForm.N61Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoaderClBank.LoadconfigClBank(self, Database.Handle);
end;

procedure TfmBankMainForm.N15Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Show_import','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoaderClBank.LoadViewClBank(self, Database.Handle);
end;

procedure TfmBankMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i, j : integer;
begin
    //i := 0;
    i := Database.ActiveTransactionCount;
    for j := 0 to i do
    begin
        if Database.Transactions[j].Active then
        begin
            try
                Database.Transactions[j].Active := false;
            finally
//                showmessage(inttostr(j));
//                Database.Transactions[j].Rollback;
            end;
        end;
    end;
//    Database.Connected := false;

   for i:=0 to self.MDIChildCount-1 do
   begin
       if (MDIChildren[i].Owner as TForm).Handle=self.Handle
       then begin
           MDIChildren[i].Release;
       end;
   end;

  if jj = 1 then
     FinalizeAdminSystem;
end;

procedure TfmBankMainForm.N35Click(Sender: TObject);
var
    Res, REs1 : Variant;
    error : integer;
    i, o : TSpravParams;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_customer','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    Res := dogLoaderUnit.ShowCustomers(Self, Database.Handle, fsMDIChild, now, csmNone, -1, -1, false, -1);

end;

procedure TfmBankMainForm.N36Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_banks','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSPR.GetBanks(self, Database.Handle, fsmdichild, now);
end;

procedure TfmBankMainForm.N37Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_RS','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoadDogManedger.WorkSpMfoRsch(Self, Database.Handle, fsMDIChild, 'spr', -1);
end;

procedure TfmBankMainForm.N22Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Vip_ClBank','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoadPrintDocClBank(Self, Database.Handle, 0)
end;

procedure TfmBankMainForm.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Button = mbRight) and (ssAlt in Shift) and (ssCtrl in shift) and (ssShift in shift) then
    begin
        miAdmin.Visible := not miAdmin.Visible;
        N7.Visible      := not N7.Visible;
    end;
end;

procedure TfmBankMainForm.N8Click(Sender: TObject);
begin
    AdminShowUsers(Self);
end;


procedure TfmBankMainForm.N16Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Spravka','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    SpravkaLoader.Lspravka(Self, id_user, Database, 2);
end;

procedure TfmBankMainForm.N7Click(Sender: TObject);
var
    //T : TfmBankServicePereschet;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Service','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    Un_lo_file_Alex.LShowBankServicePereschet(Self, Database, id_user);
   { T := TfmBankService.Create(self);
    T.ShowModal;
    T.Free; }
end;

procedure TfmBankMainForm.N23Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Sch_po_Smetam','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSpr.GetOborAnalize(self, Database.Handle, id_user);
end;

procedure TfmBankMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if sf then
    CanClose := MessageBox(Handle,Pchar(SpravkaUnitCaption.MAIN_FORM_EXIT), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes;
end;

procedure TfmBankMainForm.cxLabel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Administration','Belong');
    if error = 0 then
    begin
        if (Button = mbRight) and (ssAlt in Shift) and (ssCtrl in shift) and (ssShift in shift) then
        begin
            miAdmin.Visible := not miAdmin.Visible;
            N7.Visible      := not N7.Visible;
        end;
    end;
end;

procedure TfmBankMainForm.N24Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Zvit_po_predpr','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    LoadPrintDocChP(Self, Database.Handle, 0)
end;

procedure TfmBankMainForm.N52Click(Sender: TObject);
begin
    Show_What_New(self, 2);
end;

procedure TfmBankMainForm.N51Click(Sender: TObject);
var
    T : TfmBankInfo;
begin
    T := TfmBankInfo.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankMainForm.N38Click(Sender: TObject);
begin
    Un_lo_file_Alex.LShow_Bank_nastroyka(Self, Database, id_user);
end;

procedure TfmBankMainForm.FormActivate(Sender: TObject);
begin
    try
       InitializaAdminSystem(self, Database.Handle, 3, id_user);
    except
    end;
end;

procedure TfmBankMainForm.N25Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Bank_print_MO','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    Un_lo_file_Alex.LShowMemorialBank(Self, Database, id_user);
end;

procedure TfmBankMainForm.N62Click(Sender: TObject);
var
    T : TfmUn_Progress_form;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;

    Twr.DefaultDatabase := Database;

    St.Database         := Database;
    St.Transaction      := Twr;
    Twr.StartTransaction;
    try
        T := TfmUn_Progress_form.Create(Self, wait_, Un_R_file_Alex.M_WAIT[1]);
        T.Show;
        T.Repaint;
        St.StoredProcName := 'BANK_INSERT_OBJ_OLD';
        St.Prepare;
        St.ExecProc;
        Twr.Commit;
        T.Free;
        showmessage(Un_R_file_Alex.BANK_ADD_OBJ_OK[1]);
    except on E:Exception
    do begin
        Twr.Rollback;
        T.Free;
        showmessage(Un_R_file_Alex.BANK_ADD_OBJ_NO[1]+' '+ E.Message);
    end;
    end;
end;

procedure TfmBankMainForm.N39Click(Sender: TObject);
begin
    Un_lo_file_Alex.LShowInsertOstatokBank(Self, id_user, Database);
end;

procedure TfmBankMainForm.Action1Execute(Sender: TObject);
begin
    close;
end;

procedure TfmBankMainForm.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
temp_s:string;
begin
    if E is EFIBInterBaseError
      then begin
          if EFIBInterbaseError(E).SQLCode = -902 then
             begin

               temp_s:=EFIBInterbaseError(E).Message + 'Произошёл обрыв связи с сервером, обратитесь к администратору.';
               MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
               Application.Terminate;
             end
       end;
end;

procedure TfmBankMainForm.nastr_bankClick(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LShow_Bank_nastroyka(Self, Database, id_user);
end;

procedure TfmBankMainForm.N9Click(Sender: TObject);
begin
    Show_What_New(self, 34);
end;

procedure TfmBankMainForm.ReportClick(Sender: TObject);
var
    T : TfmPrintBankGr;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Report/Bank_Period','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T := TfmPrintBankGr.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankMainForm.NASTR_TRANZClick(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
     Un_lo_file_Alex.LShow_Bank_nastroyka_tranz(Self, Database, id_user);
end;

procedure TfmBankMainForm.FormShow(Sender: TObject);
begin
     LoadSysData(pFIBTransaction1);
end;

procedure TfmBankMainForm.NASTR_InvoiceClick(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LShow_Bank_nastroyka_invoice(Self, Database, id_user);
end;

procedure TfmBankMainForm.AnalizeErProvsClick(Sender: TObject);
var
    error : integer;
begin
    Error := fibCheckPermission('/ROOT/Bank/Work/Bank_analyz_tranz','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LBankShowAnalyzErrorProvs(self, id_user, database);
end;

procedure TfmBankMainForm.N10Click(Sender: TObject);
var
    error : integer;
begin
    Error := fibCheckPermission('/ROOT/Bank/Work/Bank_er_vstrech','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

    Un_lo_file_Alex.LErVstrechProvs(Self, id_user, Database, 2, 0, date);
end;

procedure TfmBankMainForm.N17Click(Sender: TObject);
var
  Parameter:TBankSimpleParam;
  Valuta:Variant;
begin
  Parameter := TBankSimpleParam.Create;
  Parameter.DB_Handle := Database.Handle;
  Parameter.Owner := self;
  Parameter.Formstyle:=fsMDIChild;

  Valuta := DoFunctionFromPackage(Parameter,BankValuta_Const);
  Parameter.Free;
  {If VarArrayDimCount(Valuta)>0 then
  begin
    NoteButtonEdit.Text := Valuta[1];
    PParameter.id_note := Valuta[0];
    PParameter.article_note := Valuta[1];
  end; }
end;


procedure TfmBankMainForm.N18Click(Sender: TObject);
var
  Parameter:TBankSimpleParam;
  Valuta:Variant;
begin
  Parameter := TBankSimpleParam.Create;
  Parameter.DB_Handle := Database.Handle;
  Parameter.Owner := self;
  Valuta := DoFunctionFromPackage(Parameter,BankSchValuta_Const);
  Parameter.Destroy;
  {If VarArrayDimCount(Valuta)>0 then
  begin
    NoteButtonEdit.Text := Valuta[1];
    PParameter.id_note := Valuta[0];
    PParameter.article_note := Valuta[1];
  end; }
end;

end.
