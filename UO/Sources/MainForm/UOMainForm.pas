unit UOMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, FIBDatabase, pFIBDatabase, IniFiles,
  DB, FIBDataSet, pFIBDataSet, StdCtrls, uPrK_Resources, Registry,
  cxGraphics, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, cxControls,
  dxStatusBar, ExtCtrls;


type
  TfmUOMainForm = class(TForm)
    MainMenu1: TMainMenu;
    mnuUO_WORK: TMenuItem;
    mnuUO_Print: TMenuItem;
    mnuUO_Sprav: TMenuItem;
    N4: TMenuItem;
    n5: TMenuItem;
    smn_UO_UCH_PLAN: TMenuItem;
    smnUO_SP_CIKL_PIDG: TMenuItem;
    smnUO_SP_TYPE_DISC: TMenuItem;
    smnUO_SP_DISC: TMenuItem;
    ImageList1: TImageList;
    pFIBDataSet1: TpFIBDataSet;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    mnuUO_Setup: TMenuItem;
    N12: TMenuItem;
    N61: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    cxLabel1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    dxStatusBar1: TdxStatusBar;
    smnUO_SP_SEMESTR: TMenuItem;
    smnUO_SP_SPECIALIZATION: TMenuItem;
    smnUO_SP_TYPE_CONTROL: TMenuItem;
    miAdmin: TMenuItem;
    N8: TMenuItem;
    N16: TMenuItem;
    N7: TMenuItem;
    smnUO_SP_TYPE_DISC_LESSON: TMenuItem;
    N62: TMenuItem;
    Twr: TpFIBTransaction;
    St: TpFIBStoredProc;
    ActionList1: TActionList;
    Action1: TAction;
    N39: TMenuItem;
    N310: TMenuItem;
    N311: TMenuItem;
    smnUO_SP_TYPE_CIKL_PIDG: TMenuItem;
    smnUO_SP_TYPE_POTOK: TMenuItem;
    smnUO_SP_POTOK: TMenuItem;
    smnUO_SYS_TYPE_KONTINGENT: TMenuItem;
    smnUO_KAF_DISC_SPEC: TMenuItem;
    smnWorkOptions: TMenuItem;
    smnCN_FORM_STUD: TMenuItem;
    smnCN_KAT_STUDY: TMenuItem;
    smnPRK_SP_SROK_OB: TMenuItem;
    smnPRK_SP_KURS: TMenuItem;
    smnPRK_SP_GOD_NABORA: TMenuItem;
    smnWhatsNew: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N17: TMenuItem;
    smnPUB_SP_USPEC: TMenuItem;
    smnPUB_SP_SPEC: TMenuItem;
    smnPUB_JN_FAK_SPEC: TMenuItem;
    smnPUB_SP_MOVA: TMenuItem;
    smnUO_SpVidNavichRobit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure smn_UO_UCH_PLANClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure smnUO_SP_CIKL_PIDGClick(Sender: TObject);
    procedure smnUO_SP_TYPE_DISCClick(Sender: TObject);
    procedure smnUO_SP_DISCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure Form_Show_Bank;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxLabel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N52Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure smnUO_SP_SEMESTRClick(Sender: TObject);
    procedure smnUO_SP_SPECIALIZATIONClick(Sender: TObject);
    procedure smnUO_SP_TYPE_CONTROLClick(Sender: TObject);
    procedure smnUO_SP_TYPE_DISC_LESSONClick(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N310Click(Sender: TObject);
    procedure N311Click(Sender: TObject);
    procedure smnUO_SP_TYPE_CIKL_PIDGClick(Sender: TObject);
    procedure smnUO_SP_TYPE_POTOKClick(Sender: TObject);
    procedure smnUO_SP_POTOKClick(Sender: TObject);
    procedure smnUO_SYS_TYPE_KONTINGENTClick(Sender: TObject);
    procedure smnUO_KAF_DISC_SPECClick(Sender: TObject);
    procedure smnWorkOptionsClick(Sender: TObject);
    procedure smnCN_FORM_STUDClick(Sender: TObject);
    procedure smnCN_KAT_STUDYClick(Sender: TObject);
    procedure smnPRK_SP_SROK_OBClick(Sender: TObject);
    procedure smnPRK_SP_KURSClick(Sender: TObject);
    procedure smnPRK_SP_GOD_NABORAClick(Sender: TObject);
    procedure smnWhatsNewClick(Sender: TObject);
    procedure smnPUB_SP_MOVAClick(Sender: TObject);
    procedure smnPUB_SP_USPECClick(Sender: TObject);
    procedure smnPUB_SP_SPECClick(Sender: TObject);
    procedure smnPUB_JN_FAK_SPECClick(Sender: TObject);
    procedure smnUO_SpVidNavichRobitClick(Sender: TObject);
  private
    jj : integer;
    sf : boolean;
    procedure CheckAccessRights;
  public
    id_user : int64;
    id_pcard : int64;
    ID_GOD_NABORA_GLOBAL:Int64;
    NameGodNabora:string;
  end;

var
  fmUOMainForm: TfmUOMainForm;

implementation
uses UOLoadUsers,
//     BankInfo,
//     PrintBankJo,
     dogLoaderUnit,
     AccMgmt,
     LoadDogManedger,
 //    SYSAdmin,
     uPwdDecrypt,
     Un_What_new,
     Un_Progress_form,
     Un_R_file_Alex,
     uPRK_Loader,
     uUO_Loader,
     AArray,
     UoOptionWork,
     cn_Common_Loader,
     cn_Common_Types,
     uSpecKlassSprav;

{$R *.dfm}

procedure TfmUOMainForm.FormCreate(Sender: TObject);
var
  reg:TRegistry;
  RegisterValueId   :String;
  RegisterValueName :String;
begin
    sf := false;
    Caption          := 'Головне вікно автоматизованої системи "Управління освітньою діяльністю"';
    mnuUO_WORK.Caption       := Un_R_file_Alex.KASSA_N1;
    mnuUO_Print.Caption       := Un_R_file_Alex.KASSA_N2;
    mnuUO_Sprav.Caption       := Un_R_file_Alex.KASSA_N3;
    N4.Caption       := Un_R_file_Alex.KASSA_N5;
    N5.Caption       := Un_R_file_Alex.KASSA_N6;
    mnuUO_Setup.Caption       := Un_R_file_Alex.KASSA_N4;
    smn_UO_UCH_PLAN.Caption      :='Навчальні плани';
    N12.Caption      := Un_R_file_Alex.BANK_N12;
//    N21.Caption      := Un_R_file_Alex.BANK_N21;
{    N31.Caption      := 'Довідник циклів підготовки';
    N32.Caption      := 'Довідник типів дисциплін';
    N34.Caption      := 'Довідник дисциплін';       }
    N61.Caption      := Un_R_file_Alex.BANK_N61;
    N62.Caption      := Un_R_file_Alex.BANK_N62[1];
    N14.Caption      := Un_R_file_Alex.BANK_N14;
    N15.Caption      := Un_R_file_Alex.BANK_N15;
{    N35.Caption      := 'Довідник семестрів та установчих сесій(заочного відділення)';
    N36.Caption      := 'Довідник спеціалізацій';
    N37.Caption      := 'Довідник типів контроля';   }
    N16.Caption      := Un_R_file_Alex.BANK_N16;
{    N38.Caption      := 'Довідник типів занять по дисциплінам';    }
    Label2.Caption   := Un_R_file_Alex.MY_USER;
    cxLabel1.Caption := 'Автоматизована система "Управління освітньою діяльністю"';
    Form_Show_Bank;

  reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\UO\Data\',false) then
        begin
           RegisterValueId  :=reg.ReadString('ID_GOD_NABORA');
           RegisterValueName:=reg.ReadString('NAME_GOD_NABORA');
        end;
     finally
         reg.Free;
     end;
     ID_GOD_NABORA_GLOBAL:=-1;
     if trim(RegisterValueId)<>'' then
      begin
       ID_GOD_NABORA_GLOBAL              :=StrToInt(RegisterValueId);
       NameGodNabora                     :=RegisterValueName;
{       dxBarStaticLabelGodNabora.Caption :=
           dxBarStaticLabelGodNabora.Caption+': '+NameGodNabora;
}     end;
  CheckAccessRights;

end;

procedure TfmUOMainForm.Form_Show_Bank;
var
    reg : TIniFile;
//    NagScreen : TfmSplashFormBank;
//    Res : WIN32_FIND_DATA;
//    Res_file : THandle;
//    name, path : string;
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
    jj := 1;
    // Запускаем логотип системы
{    NagScreen := TfmSplashFormBank.Create(self);
    NagScreen.Label1.Caption := '';
    NagScreen.Show;
    NagScreen.Repaint;
 }   // Читаем настройки из файла настроек
//    NagScreen.DrawText('Считываем настройки из файла "config.ini" ...');
    reg := TIniFile.Create('.\config.ini');
    dxStatusBar1.Panels[0].Text := 'База : ' + reg.ReadString('CONNECTION','Path','');
    // Считываем дополнительные параметры

    // Соединение с БД
//    NagScreen.DrawText(Un_R_file_Alex.FORM_DATABASE_OPEN);
//    NagScreen.cxProgressBar1.Position := 20;
//    NagScreen.Update;
//        NagScreen.Free;
    id_user := GetUserID;
    dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_USER + '  -  ' + GetUserFIO;
                                             {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    Label1.Caption   := GetUserFIO;

    sf := true;
end;

procedure TfmUOMainForm.CheckAccessRights;
begin
  mnuUO_WORK.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Work','Belong')=0);
  smn_UO_UCH_PLAN.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Work/UO_Plans','Belong')=0);
  smnUO_KAF_DISC_SPEC.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Work/UO_Kaf_Disc','Belong')=0);
  smnUO_SYS_TYPE_KONTINGENT.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Work/UO_Kontingent','Belong')=0);
  mnuUO_Print.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Report','Belong')=0);
  mnuUO_Sprav.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Sprav','Belong')=0);
  mnuUO_Setup.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Setup','Belong')=0);
  smnWorkOptions.Visible:=(AccMgmt.fibCheckPermission('/ROOT/UO/UO_Setup/UO_Setup_Work','Belong')=0);
end;

procedure TfmUOMainForm.smn_UO_UCH_PLANClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin


    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sp_uch_plan.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    {
     id := InputParam['output']['ID_SP_CIKL_PIDG'].AsInt64;
     viewArray(Self.Inputparam);
    }

{    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_sch','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;}
end;

procedure TfmUOMainForm.N4Click(Sender: TObject);
begin
    Close;
end;

procedure TfmUOMainForm.N12Click(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Find_documents','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
//    Un_lo_file_Alex.LBankShowFindOrder(self, id_user, database);
end;

procedure TfmUOMainForm.smnUO_SP_CIKL_PIDGClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_CIKL_PIDG.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
//    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
//    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    {
     id := InputParam['output']['ID_SP_CIKL_PIDG'].AsInt64;
     viewArray(Self.Inputparam);
    }

{    error := fibCheckPermission('/ROOT/Bank/Sprav/Spr_sch','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;}
end;

procedure TfmUOMainForm.smnUO_SP_TYPE_DISCClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
//    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
//    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_DISCClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
//    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
//    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i, j : integer;
begin
    for j := 0 to Database.ActiveTransactionCount do
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

   for i := 0 to self.MDIChildCount-1 do
   begin
       if (MDIChildren[i].Owner as TForm).Handle=self.Handle
       then begin
           MDIChildren[i].Release;
       end;
   end;

  if jj = 1 then
//     FinalizeAdminSystem;
end;

procedure TfmUOMainForm.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Button = mbRight) and (ssAlt in Shift) and (ssCtrl in shift) and (ssShift in shift) then
    begin
        miAdmin.Visible := not miAdmin.Visible;
        N7.Visible      := not N7.Visible;
    end;
end;

procedure TfmUOMainForm.N8Click(Sender: TObject);
begin
//    AdminShowUsers(Self);
end;


procedure TfmUOMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if sf then
        CanClose := MessageBox(Handle, Pchar('Ви дійсно бажаєте вийти з системи?'), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes;
end;

procedure TfmUOMainForm.cxLabel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{var
    error : integer;}
begin
{    error := fibCheckPermission('/ROOT/Bank/Administration','Belong');
    if error = 0 then
    begin
        if (Button = mbRight) and (ssAlt in Shift) and (ssCtrl in shift) and (ssShift in shift) then
        begin
            miAdmin.Visible := not miAdmin.Visible;
            N7.Visible      := not N7.Visible;
        end;
    end;}
end;

procedure TfmUOMainForm.N52Click(Sender: TObject);
begin
    Show_What_New(self, 2);
end;

procedure TfmUOMainForm.FormActivate(Sender: TObject);
begin
    try
//       InitializaAdminSystem(self, Database.Handle, 3, id_user);
    except
    end;
end;

procedure TfmUOMainForm.Action1Execute(Sender: TObject);
begin
    close;
end;

procedure TfmUOMainForm.smnUO_SP_SEMESTRClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_SEMESTR.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_SPECIALIZATIONClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_SPECIALIZATION.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_TYPE_CONTROLClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_CONTROL.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_TYPE_DISC_LESSONClick(Sender: TObject);
var
    InputParam : TAArray;
//    error : integer;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_DISC_LESSON.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.N25Click(Sender: TObject);
begin
    uUO_Loader.LoadSimplePackage(Self,Database.Handle,'UO\UO_PrtUchPlan.bpl','View_UO_PrtUchPlan');
end;

procedure TfmUOMainForm.N39Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                                    := TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'uo_sp_norm_chisl_stud.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger     := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInt64                 := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant         := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.N310Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sp_norm_chisl_asp.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInt64          := 1;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.N311Click(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_VUZ_LICENCE;
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_TYPE_CIKL_PIDGClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_CIKL_PIDG.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_TYPE_POTOKClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sp_type_potok.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SP_POTOKClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sp_potok.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_SYS_TYPE_KONTINGENTClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sys_type_kontingent.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

procedure TfmUOMainForm.smnUO_KAF_DISC_SPECClick(Sender: TObject);
begin
    uUO_Loader.LoadSimplePackage(Self,Database.Handle,'UO\UO_KafDiscSpec.bpl','View_UO_KafDiscSpec');
end;

procedure TfmUOMainForm.smnWorkOptionsClick(Sender: TObject);
var
    T:TFormOptionWork;
    InputParam :TAArray;
    reg:   TRegistry;
    NameGN : string;
begin
    InputParam :=TAArray.Create;
    InputParam['Input']['GodNabora'].AsInt64      :=ID_GOD_NABORA_GLOBAL;
    InputParam['Input']['NameGodNabora'].AsString :=NameGodNabora;
    InputParam['Input']['id_user'].AsInteger      := id_user;

    T:=TFormOptionWork.Create(self,InputParam);
    if  T.ShowModal= MrOK then
     begin
       ID_GOD_NABORA_GLOBAL   :=T.DataSetGodNabora.FieldValues['ID_SP_GOD_NABORA'];
       NameGN       :=T.DataSetGodNabora.FieldValues['SHORT_NAME'];
{       dxBarStaticLabelGodNabora.Caption:=
       ndxBarStaticLabelGodNabora[IndexLanguage]+': '+NameGN;
}
       reg:=TRegistry.Create;
        try
            reg.RootKey :=HKEY_CURRENT_USER;
            if reg.OpenKey('\Software\UO\DATA\',true) then
            begin
               reg.WriteString('ID_GOD_NABORA', IntToStr(ID_GOD_NABORA_GLOBAL));
               reg.WriteString('NAME_GOD_NABORA',NameGN);
            end;
         finally
             reg.Free;
         end;  
     end;
    T.Free;


end;
procedure TfmUOMainForm.smnCN_FORM_STUDClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Database.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
end;

procedure TfmUOMainForm.smnCN_KAT_STUDYClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Database.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
end;

procedure TfmUOMainForm.smnPRK_SP_SROK_OBClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_SROK_OB,fsMDIChild);
end;

procedure TfmUOMainForm.smnPRK_SP_KURSClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_KURS,fsMDIChild);
end;

procedure TfmUOMainForm.smnPRK_SP_GOD_NABORAClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_GOD_NABORA,fsMDIChild);
end;

procedure TfmUOMainForm.smnWhatsNewClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_WhatsNew.bpl';
    InputParam['Input']['FileName'].AsString        := 'UO_Whats_New.txt';
  ShowAllUoBpl(Self,InputParam);
end;

procedure TfmUOMainForm.smnPUB_SP_MOVAClick(Sender: TObject);
begin
  uSpecKlassSprav.ShowSprav(Self,Database.Handle,PUB_SP_MOVA,fsMDIChild);
end;

procedure TfmUOMainForm.smnPUB_SP_USPECClick(Sender: TObject);
begin
  uSpecKlassSprav.ShowSprav(Self,Database.Handle,PUB_SP_USPEC,fsMDIChild);
end;

procedure TfmUOMainForm.smnPUB_SP_SPECClick(Sender: TObject);
begin
  uSpecKlassSprav.ShowSprav(Self,Database.Handle,PUB_SP_SPEC_OLD,fsMDIChild);
end;

procedure TfmUOMainForm.smnPUB_JN_FAK_SPECClick(Sender: TObject);
begin
  uSpecKlassSprav.ShowJnFakSpec(Self,Database.Handle);
end;

procedure TfmUOMainForm.smnUO_SpVidNavichRobitClick(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SpVidNavichRobit.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['id_user'].AsInteger      := id_user;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
end;

end.
