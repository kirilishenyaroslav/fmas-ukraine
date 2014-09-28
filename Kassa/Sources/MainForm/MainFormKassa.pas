unit MainFormKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, FIBDatabase, pFIBDatabase, IniFiles, GlobalSPR,
  DB, FIBDataSet, pFIBDataSet, Un_lo_file_Alex, Un_R_file_Alex, StdCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, jpeg, ExtCtrls, AccMgmt,
  cxGraphics, dxStatusBar, fib, AppEvnts;

type
  TfmMainForm = class(TForm)
    MainMenu1: TMainMenu;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N8: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    Find1: TMenuItem;
    Image1: TImage;
    cxLabel1: TLabel;
    Label1: TLabel;
    N16: TMenuItem;
    dxStatusBar1: TdxStatusBar;
    N81: TMenuItem;
    N82: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    Label2: TLabel;
    N22: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    N17: TMenuItem;
    WorkwithVstrech: TMenuItem;
    DataSetIni: TpFIBDataSet;
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N20Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure FormShow_Kassa;
    procedure N82Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxLabel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure N17Click(Sender: TObject);
    procedure WorkwithVstrechClick(Sender: TObject);
  private
    jj : integer;
  public
    id_user : int64;
    id_pcard : int64;
    id_system : integer;
  end;

var
  fmMainForm: TfmMainForm;

implementation
uses SplashFormKassa,
     NastroykaKassa,
     LogInFormUnit,
     fmPrintKassaJo,
     ClosePeriodKassa,
     KassaInfo,
     dogLoaderUnit,
     SYSAdmin,
     SpravkaLoader,
     uPwdDecrypt,
     Un_What_new,
     KassaService;

{$R *.dfm}

procedure TfmMainForm.N5Click(Sender: TObject);
begin
    Close;
end;

{********************************************
* Процедура обработки ошибок по коду.       *
* IN  : ErrorCode - код ошибки              *
* OUT : none                                *
* RET : none                                *
* NOTE: Показывает ошибку по её номеру      *
*       если ошибка фатальная, то завершает *
*       программу.                          *
********************************************}
procedure TfmMainForm.FormCreate(Sender: TObject);
begin
    Caption       := Un_R_file_Alex.KASSA_MAIN_FORM_CAPTION_A;
    N1.Caption    := Un_R_file_Alex.KASSA_N1;
    N2.Caption    := Un_R_file_Alex.KASSA_N2;
    N3.Caption    := Un_R_file_Alex.KASSA_N3;
    N4.Caption    := Un_R_file_Alex.KASSA_N4;
    N5.Caption    := Un_R_file_Alex.KASSA_N5;
    N6.Caption    := Un_R_file_Alex.KASSA_N6;
    N7.Caption    := Un_R_file_Alex.KASSA_N7;
    N8.Caption    := Un_R_file_Alex.KASSA_N8;
    N9.Caption    := Un_R_file_Alex.KASSA_N9;
    N10.Caption   := Un_R_file_Alex.KASSA_N10;
    N11.Caption   := Un_R_file_Alex.KASSA_N11;
    N12.Caption   := Un_R_file_Alex.KASSA_N12;
    N13.Caption   := Un_R_file_Alex.KASSA_N13;
    N14.Caption   := Un_R_file_Alex.KASSA_N14;
    N15.Caption   := Un_R_file_Alex.KASSA_N15;
    N16.Caption   := Un_R_file_Alex.KASSA_N16;
    N19.Caption   := Un_R_file_Alex.KASSA_N19;
    N20.Caption   := Un_R_file_Alex.KASSA_N20;
    N22.Caption   := Un_R_file_Alex.KASSA_ANALIT_NAME;
    N61.Caption   := Un_R_file_Alex.J4_MAIN_N61;
    N62.Caption   := Un_R_file_Alex.J4_MAIN_N62;
    N81.Visible   := false;
    Find1.Caption := Un_R_file_Alex.KASSA_N21;
    cxLabel1.Caption := Un_R_file_Alex.KASSA_CAPTION_A;
    Label2.Caption   := Un_R_file_Alex.MY_USER;
//    visible := false;

    FormShow_Kassa;

end;

procedure TfmMainForm.FormShow_Kassa;
var
    reg : TIniFile;
    NagScreen : TfmSplashForm;
    path : string;
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
{  Form := TLogInForm.Create(Self);
  if Form.ShowModal <> mrOk
  then begin
    visible := false;
    jj := 0;
    close;
    Application.Terminate;
    Close;
  end else
  begin}
    jj := 1;
//    pFIBDatabase1.Connected := true;

    // Запускаем логотип системы
    NagScreen := TfmSplashForm.Create(self);
    NagScreen.Label1.Caption := '';
    NagScreen.Show;
    NagScreen.Repaint;
    // Читаем настройки из файла настроек
    NagScreen.DrawText(Un_R_file_Alex.FORM_READ_CONFIG);

    reg := TIniFile.Create('.\config.ini');

//    Database.DatabaseName := reg.ReadString('CONNECTION','Server','') + ':' + reg.ReadString('CONNECTION','Path','');
    dxStatusBar1.Panels[0].Text := reg.ReadString('CONNECTION','Path','');

//    Database.DBParams.Clear;
 //	Database.DBParams.Add('user_name=' + reg.ReadString('CONNECTION','USER',''));
//    Database.DBParams.Add('password='  + PwdDeCrypt(reg.ReadString('CONNECTION','Password_Crypted','')));
//    Database.SQLDialect := StrToInt(reg.ReadString('CONNECTION','SQLDialect','3'));
    // Считываем дополнительные параметры

//	Database.DBParams.Add('lc_ctype='  + reg.ReadString('Sklad_Params','CHARSET','WIN1251'));
    // Соединение с БД
//   NagScreen.DrawText(Un_R_file_Alex.FORM_DATABASE_OPEN);
{    try
        Database.Open;
    except on E:Exception
        do begin
            MessageDlg(Un_R_file_Alex.MY_MESSAGE_WARNING, Un_R_file_Alex.MY_FORM_FORM + E.Message + '"',mtError,[mbOk]);
            Application.Terminate;
        end;
    end;
 }
    NagScreen.cxProgressBar1.Position := 10;
    NagScreen.Update;
    try
       path     := ExtractFilepath(Application.ExeName)+'Kassa\KassaDayBPL.bpl';
       NagScreen.Label1.Caption := Un_R_file_Alex.MY_LOAD_BPL+'KassaDayBPL.bpl';
       NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
       NagScreen.Update;
       LoadPackage(path);

       path     := ExtractFilepath(Application.ExeName)+'Kassa\KassaDocBPL.bpl';
       NagScreen.Label1.Caption := Un_R_file_Alex.MY_LOAD_BPL+'KassaDocBPL.bpl';
       NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
       NagScreen.Update;
       LoadPackage(path);


       NagScreen.cxProgressBar1.Position := 100;
       NagScreen.Update;
//конец загрузки
    finally
       NagScreen.Free;
    end;


    id_pcard := CurrentID_PCARD;
    Label1.Caption := GetUserFIO;
    id_user        := GetUserID;
    dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_USER + '  -  ' + GetUserFIO;
                                             {422-урк, 409-англ, 00000419-rus}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);

end;

procedure TfmMainForm.N15Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_razd_st','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    GlobalSPR.GetSmets(self, Database.Handle, Date, psmRazdSt);
end;

procedure TfmMainForm.N7Click(Sender: TObject);
Var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LKassaDayEdit(self, id_user, Database);
end;

procedure TfmMainForm.N4Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Setup','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadNastroyka(Self, id_user, Database.Handle);
end;

procedure TfmMainForm.N16Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/View_dko','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LKassaShowDelete(self, id_user, Database);
end;

procedure TfmMainForm.N12Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_fl','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.my_GetManEx(self, Database.Handle, False, True, -1);
end;

procedure TfmMainForm.N14Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_smet','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    GlobalSPR.GetSmets(self, Database.Handle, Date, psmSmet);
end;

procedure TfmMainForm.N22Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Report/Kassa_Card_analit','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LShowKassaAnalitRes(Self, id_user, Database);
end;

procedure TfmMainForm.N19Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
//old      Un_lo_file_Alex.LSpSchSystemKassa(self, id_user, Database);
    Un_lo_file_Alex.LoadKassaSys(Self, id_user, Database, 2, 0);
end;

procedure TfmMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  if jj = 1 then
     FinalizeAdminSystem;
  except
  end;
end;

procedure TfmMainForm.N20Click(Sender: TObject);
//var
//    error : integer;
begin
{    error := CheckAccess('/ROOT/KASSA/Menu/Sp','View');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
 }   Un_lo_file_Alex.LEditOperetionKassa(self, id_user, Database);
end;

procedure TfmMainForm.N9Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/Work_spd','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    SpravkaLoader.Lspravka(Self, id_user, Database, 1);
end;

procedure TfmMainForm.N10Click(Sender: TObject);
var
    T : TfmClosePeriodKassa;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/Upr_sch','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T := TfmClosePeriodKassa.Create(self, self);
    T.ShowModal;
    T.Free;
end;

procedure TfmMainForm.N11Click(Sender: TObject);
var
    T : TPrintKassaJo;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Report/JO','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T  := TPrintKassaJo.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmMainForm.N8Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kekv','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    GlobalSPR.GetKEKVSpr(self, Database.Handle, FSMDIChild, Date, 1);
end;

procedure TfmMainForm.N13Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Sprav/Spr_bal_sch','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    GlobalSPR.GetSch(self, Database.Handle, FSMDIChild, Date, 1, 0, 0);
end;

procedure TfmMainForm.Find1Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/View_ko','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadKassaShowFindOrder(self, id_user, Database);
end;

procedure TfmMainForm.N82Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Kas_administration','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    AdminShowUsers(Self);
end;

procedure TfmMainForm.N61Click(Sender: TObject);
var
    T : TfmKassaInfo;
begin
    T := TfmKassaInfo.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmMainForm.N62Click(Sender: TObject);
begin
    Show_What_New(self, 1);
end;

procedure TfmMainForm.FormActivate(Sender: TObject);
begin
    try
        InitializaAdminSystem(self, fmMainForm.Database.Handle, 2, id_user);
    except
    end;
end;

procedure TfmMainForm.cxLabel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Button = mbRight) and (ssAlt in Shift) and (ssCtrl in shift) and (ssShift in shift) then
    begin
//        miAdmin.Visible := not miAdmin.Visible;
        N81.Visible := not N81.Visible;
        N17.Visible := not N17.Visible;
    end;
end;

procedure TfmMainForm.ApplicationEvents1Exception(Sender: TObject;
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

procedure TfmMainForm.N17Click(Sender: TObject);
var
    T : TfmKassaService;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Kassa_service','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    T := TfmKassaService.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfmMainForm.WorkwithVstrechClick(Sender: TObject);
var
    error : integer;
begin
   error := fibCheckPermission('/ROOT/Kassa/Work/Kassa_er_vstrech','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

    Un_lo_file_Alex.LErVstrechProvs(Self, id_user, Database, 1, 0, date);
end;

end.
