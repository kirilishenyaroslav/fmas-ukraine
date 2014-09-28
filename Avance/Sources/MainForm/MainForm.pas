unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, FIBDatabase, pFIBDatabase, IniFiles, DB,
  FIBDataSet, pFIBDataSet, Un_lo_file_Alex, Un_R_file_Alex, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls, GlobalSPR, jpeg, RxGIF,
  frxClass, frxDBSet, frxCross, ActnList, fib, AppEvnts;

type
    TfmAvanceMainForm = class(TForm)
    MainMenu1: TMainMenu;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N400: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    cxLabel1: TcxLabel;
    Image1: TImage;
    cxLabel2: TLabel;
    ImageList2: TImageList;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    N20: TMenuItem;
    N22: TMenuItem;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    N61: TMenuItem;
    N62: TMenuItem;
    N60: TMenuItem;
    N71: TMenuItem;
    N711: TMenuItem;
    DataSetNeos: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetLang: TpFIBDataSet;
    DataSetNeosPK_ID: TFIBBCDField;
    DataSetNeosNUM_DOC: TFIBStringField;
    DataSetNeosID_SCH: TFIBBCDField;
    DataSetNeosNUM_SCH_KOR: TFIBStringField;
    DataSetNeosTIT_KOR_SCH: TFIBStringField;
    DataSetNeosSUMM: TFIBBCDField;
    DataSetNeosNAME_PREDPR: TFIBStringField;
    DataSetNeosOSN_SCH: TFIBStringField;
    DataSetNeosOSN_TIT: TFIBStringField;
    frxReport1: TfrxReport;
    N72: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    N23: TMenuItem;
    N35: TMenuItem;
    N24: TMenuItem;
    N19: TMenuItem;
    N4: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Reestri: TMenuItem;
    N17: TMenuItem;
    DSetIni: TpFIBDataSet;
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N61Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N711Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ReestriClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
  private
    sf  : boolean;
  public
    id_user : int64;
    new_alg : integer;
    date_alg : TDate;
  end;

var
  fmAvanceMainForm: TfmAvanceMainForm;

implementation
uses Nastroyka,
     SplashForm,
     AvancePrintForm,
     LogInFormUnit,
     AvanceInfo,
     ClosePeriodAvance,
     ACCMGMT,
     AvancePrintFormNewAlg,
     SYSAdmin,
     uPwdDecrypt,
     Un_What_new,
     MainAvanceMonthSelect,
     AArray,
     UWLoaderUnit;

{$R *.dfm}


procedure TfmAvanceMainForm.N5Click(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceMainForm.FormCreate(Sender: TObject);
var
  reg : TIniFile;
  NagScreen : TfmSplashForm;
//  Form : TLogInForm;
  path : string;
  Layout: array[0.. KL_NAMELENGTH] of char;
//  v : integer;
begin
    sf           := false;
//    pFIBDatabase1.Connected := true;
    CAPTION      := Un_R_file_Alex.J4_MAIN_FORM_CAPTION;
    n1.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N1;
    n2.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N2;
    n3.caption   := Un_R_file_Alex.J4_MAIN_MENU_N3;
    n4.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N4;
    n5.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N5;
    n6.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N6;
    n7.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N7;
    n8.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N8;
    n9.Caption   := Un_R_file_Alex.J4_MAIN_MENU_N9;
    n10.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N10;


    n11.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N11;


    n12.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N12;
    n13.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N13;
    n14.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N14;
    n15.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N15;
    n16.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N16;
//    n17.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N17;
//    n18.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N18;
    n19.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N19;
    n20.Caption  := Un_R_file_Alex.J4_MAIN_MENU_N20;
    N22.Caption  := Un_R_file_Alex.J4_OBOROT_MAIN_CAPTION;
    N61.Caption  := Un_R_file_Alex.J4_MAIN_N61;
    N62.Caption  := Un_R_file_Alex.J4_MAIN_N62;
    N60.Caption  := Un_R_file_Alex.J4_N60;
    N71.Caption  := Un_R_file_Alex.J4_N71;
    N711.Caption := Un_R_file_Alex.J4_N711;
    N72.Caption  := Un_R_file_Alex.AVANCE_N72[1];
    Reestri.Caption  :=Un_R_file_Alex.J4_FORM_REESTR;

    cxLabel2.Caption := Un_R_file_Alex.Main_MAIN_CAPTION;
    Label2.Caption   := Un_R_file_Alex.MY_USER;
    // Запускаем логотип системы
    NagScreen := TfmSplashForm.Create(self);
    NagScreen.Label1.Caption := '';
    NagScreen.Show;
    NagScreen.Repaint;
    // Читаем настройки из файла настроек
    NagScreen.DrawText(Un_R_file_Alex.J4_READ_PARAMS);

    reg := TIniFile.Create('.\config.ini');

//    Database.DatabaseName := reg.ReadString('CONNECTION','Server','') + ':' + reg.ReadString('CONNECTION','Path','');
    cxLabel1.Caption := reg.ReadString('CONNECTION','Path','');
//    Database.DBParams.Clear;
//	Database.DBParams.Add('user_name=' + reg.ReadString('CONNECTION','USER',''));
//    Database.DBParams.Add('password='  + PwdDeCrypt(reg.ReadString('CONNECTION','Password_Crypted','')));
    // Считываем дополнительные параметры

//	Database.DBParams.Add('lc_ctype='  + reg.ReadString('Sklad_Params','CHARSET','WIN1251'));
    // Соединение с БД
    NagScreen.DrawText(Un_R_file_Alex.J4_CONNECTION_BASE);

{    try
        Database.Open;
    except on E:Exception
        do begin
            NagScreen.Close;
            MessageDlg(Un_R_file_Alex.J4_ERROR_CONNECTE + E.Message + '"',mtError,[mbOk],0);
            Application.Terminate;
        end;
    end;}
    //Поиск первого файла из каталога
    NagScreen.cxProgressBar1.Position := 20;
    NagScreen.Update;
    try
        path     := ExtractFilepath(Application.ExeName)+'Avance\AvanceOstatok.bpl';
        NagScreen.Label1.Caption := Un_R_file_Alex.MY_LOAD_BPL+'AvanceOstatok.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 20;
        NagScreen.Update;
        LoadPackage(path);

        path     := ExtractFilepath(Application.ExeName)+'Avance\AvanceOtchet.bpl';
        NagScreen.Label1.Caption := Un_R_file_Alex.MY_LOAD_BPL+'AvanceOtchet.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 20;
        NagScreen.Update;
        LoadPackage(path);

        path     := ExtractFilepath(Application.ExeName)+'Avance\SpRazdelenieBPL.bpl';
        NagScreen.Label1.Caption := Un_R_file_Alex.MY_LOAD_BPL+'SpRazdelenieBPL.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
        LoadPackage(path);

{       path     := ExtractFilepath(Application.ExeName)+'Public\SpAllPeople.bpl';
       NagScreen.Label1.Caption := 'Загрузка пакета '+'SpAllPeople.bpl';
       NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
       NagScreen.Update;
       LoadPackage(path);
 }
        NagScreen.cxProgressBar1.Position := 100;
        NagScreen.Update;
        //конец загрузки
    finally
        NagScreen.Free;
    end;
    id_user := GetUserID;
    Label1.Caption := GetUserFIO;

    {422-урк, 409-англ, 00000419 -RUS}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    sf := true;
end;

procedure TfmAvanceMainForm.N15Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Sprav_use_in_j4/Spr_razsh','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
      Un_lo_file_Alex.LoadEditSpRazdelAvanse(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N7Click(Sender: TObject);
Var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.AvanceShowLoad(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N16Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Sprav_use_in_j4/Spr_type_doc','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadSpRazdelAvanse(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N12Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Sprav_use_in_j4/Spr_fiz_lic','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.MY_GetManEx(self, Database.Handle, false, true, -1);
end;

procedure TfmAvanceMainForm.N14Click(Sender: TObject);
begin
//    LoadPackageBPL.GetSmets(self,Database.Handle,Date,psmRazdSt);
//    LoadBPLAvance.GetSmets(self,Database.Handle,Date,psmRazdSt);
end;

procedure TfmAvanceMainForm.N18Click(Sender: TObject);
begin
//    LoadPackageBPL.LoadSpEditSpTypeDoc(self, 1, Database);
//    LoadBPLAvance.LoadSpEditSpTypeDoc(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N8Click(Sender: TObject);
Var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Work_j4/Work_with_ost','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LShowOstatkiAvance(self, id_user, Database, MSingle, MGroup, 0);
end;

procedure TfmAvanceMainForm.N13Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Sprav_use_in_j4/Spr_schet','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    GlobalSPR.GetSch(self, Database.Handle, FSMDIChild, Date, 1, 0, 0);
end;

procedure TfmAvanceMainForm.N11Click(Sender: TObject);
var
    T : TfmPrintForm;
    TT : TAvancePrintFormNewAlg;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Reports_j4','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if (new_alg = 1) and (date_alg<=date) then
    begin
        TT := TAvancePrintFormNewAlg.Create(Jornal4New, Database, pFIBTransaction1, self);
        TT.ShowModal;
        TT.Free;
    end else
    begin
        T := TfmPrintForm.Create(Jornal4, Database, pFIBTransaction1, self);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmAvanceMainForm.N20Click(Sender: TObject);
begin
    Un_lo_file_Alex.LoadAvanceShowFindOrder(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N22Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Work_j4/Work_show_oborot','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if (new_alg = 1) and (date_alg<=date) then
    begin
        Un_lo_file_Alex.LAvanceShowOborotNew(self, id_user, Database);
    end else
    begin
        Un_lo_file_Alex.LAvanceShowOborot(self, id_user, Database);
    end;
end;

procedure TfmAvanceMainForm.N9Click(Sender: TObject);
begin
    ShowMessage(Un_R_file_Alex.FORMA_WORK);
end;

procedure TfmAvanceMainForm.N10Click(Sender: TObject);
var
    T : TfmClosePeriodAvance;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Work_j4/Work_uprj4','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T := TfmClosePeriodAvance.Create(self, self);
    T.ShowModal;
    T.Free;
end;

procedure TfmAvanceMainForm.FormShow(Sender: TObject);
begin
    InitializaAdminSystem(self, Database.Handle, 5, id_user);
end;

procedure TfmAvanceMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FinalizeAdminSystem;
end;

procedure TfmAvanceMainForm.N61Click(Sender: TObject);
var
    T : TfmAvanceInfo;
begin
    T := TfmAvanceInfo.Create(Self);
    T.Showmodal;
    T.free;
end;

procedure TfmAvanceMainForm.N62Click(Sender: TObject);
begin
    Show_What_New(self, 4);
end;

procedure TfmAvanceMainForm.N60Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Sprav_use_in_j4/Spr_neosn_prov','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LShow_Neosnov(Self, Database, fsMDIChild, date)
end;

procedure TfmAvanceMainForm.N711Click(Sender: TObject);
var
    Res : Variant;
    id_sch : int64;
    d : TDate;
    debet, id_lang : integer;
    s1, s2 : string;
begin
    Res := GetSch(Self, Database.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(Res) > 0 then
    begin
        id_sch := res[0][0];
        if SelectDay_avance(self, d, debet, s1, s2, self, id_sch, res[0][3]) then
        begin
            DataSetLang.Close;
            DataSetLang.Sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
            DataSetLang.Open;
            id_lang  := DataSetLang.FieldByName('ID_LANGUAGE').AsInteger;
            DataSetLang.Close;

            DataSetNeos.Close;
            DataSetNeos.Sqls.SelectSQL.Text := 'Select * from J4_SELECT_RAS_PO_NEOSNOVNIM_SCH('+IntToStr(id_sch)+', '''+DateToStr(d)+''', '+IntToStr(debet)+')';
            DataSetNeos.Open;
            if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40010_ukr.fr3');
            frxReport1.Variables['opis']    := QuotedStr(s1);
            frxReport1.Variables['dat']     := QuotedStr(s2);
            frxReport1.Variables['comp']    := QuotedStr(GetComputerNetName);
            frxReport1.Variables['id_user'] := QuotedStr(IntToStr(id_user));
            frxReport1.PrepareReport(true);
            frxReport1.ShowReport(true);
            DataSetNeos.Close;
        end;
    end;
end;

procedure TfmAvanceMainForm.N72Click(Sender: TObject);
begin
    Un_lo_file_Alex.LShowMemorialAvance(Self, Database, id_user);  
end;

procedure TfmAvanceMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    s1, s2 : string;
begin
    s1 := Un_R_file_Alex.M_CONST_MESSAGE_WARNING[1];
    s2 := Un_R_file_Alex.M_CONST_VIHOD[1];
    if sf then
        CanClose := MessageBox(Handle, Pchar(s2), Pchar(s1), mb_YesNO)=mrYes;
end;

procedure TfmAvanceMainForm.Action1Execute(Sender: TObject);
begin
    close;
end;

procedure TfmAvanceMainForm.N23Click(Sender: TObject);
begin
    Un_lo_file_Alex.LAvanceVedomost(Self, id_user, Database);
end;

procedure TfmAvanceMainForm.N35Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UwVedomost2.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    InputParam['Input']['id_user'].AsVariant        := id_user;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
end;

procedure TfmAvanceMainForm.N24Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UwVedomost2.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    InputParam['Input']['id_user'].AsVariant        := id_user;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
end;

procedure TfmAvanceMainForm.N4Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_all','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadJNastroyka(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N19Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadSpSchSystem(self, id_user, Database);
end;

procedure TfmAvanceMainForm.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
    temp_s:string;
begin
    if E is EFIBInterBaseError then
    begin
        if EFIBInterbaseError(E).SQLCode = -902 then
        begin
            temp_s:=EFIBInterbaseError(E).Message + 'Произошёл обрыв связи с сервером, обратитесь к администратору.';
            MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
            Application.Terminate;
        end
    end;
end;

procedure TfmAvanceMainForm.ReestriClick(Sender: TObject);
var
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Reestr_AO','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_NOT_ACCESS_FORM_REESTR), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    Un_lo_file_Alex.LoadAvanceShowReestr(self, id_user, Database);
end;

procedure TfmAvanceMainForm.N17Click(Sender: TObject);
begin
  Un_lo_file_Alex.LShowMemorialZvedAvance(Self, Database, id_user);
end;

end.
