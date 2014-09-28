unit uPersonal_income;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Placemnt, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc,
    FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGraphics,
    cxControls, dxStatusBar, dxBar, inifiles, StdCtrls, cxContainer, cxEdit,
    cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox, dxBarExtItems, Menus, dxsbar, pFIBErrorHandler, ib_externals, ibase,
    PackageLoad, Ztypes;

type
    TFormPI = class(TForm)
        Database: TpFIBDatabase;
        DataSet: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        StoredProc: TpFIBStoredProc;
        FormStoragePrK: TFormStorage;
    dxPIStatusBar: TdxStatusBar;
        BarManager: TdxBarManager;
    ItemReports: TdxBarSubItem;
        ItemSpravochniki: TdxBarSubItem;
        dxBarButtonFormStudy: TdxBarButton;
        dxBarButtonCategoryStudy: TdxBarButton;
        dxBarButtonPeople: TdxBarButton;
        dxBarButtonPrK_SP_DERG_ZAKAZ: TdxBarButton;
        dxBarButtonPrK_SP_EXZFORM: TdxBarButton;
        dxBarButtonPrK_SP_GURTOG: TdxBarButton;
        dxBarButtonPrK_SP_IN_LANG: TdxBarButton;
        dxBarButtonPrK_SP_IS_COPY: TdxBarButton;
        dxBarButtonPrK_SP_KAT_PRI_X: TdxBarButton;
        dxBarButtonPrK_SP_KURS: TdxBarButton;
        dxBarButtonPrK_SP_LEVEL_VLADEN: TdxBarButton;
        dxBarButtonPrK_SP_NPK: TdxBarButton;
        dxBarButtonPrK_SP_OLD_PRICH: TdxBarButton;
        dxBarButtonPrK_SP_PREDM: TdxBarButton;
        dxBarButtonPrK_SP_PRICH: TdxBarButton;
        dxBarButtonPrK_SP_PRIZN_ZACHISL: TdxBarButton;
        dxBarButtonPrK_SP_RISH_TYPE: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_DOK_OBR: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_PEREKL: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_RAZN: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_UCHZ: TdxBarButton;
        dxBarButtonPrK_SP_UKR_LANG: TdxBarButton;
        dxBarButtonPrK_SP_VID_DII: TdxBarButton;
        dxBarButtonPrK_SP_ZABR: TdxBarButton;
        dxBarButtonPrK_SP_FOB_PROT: TdxBarButton;
    dxBarButtonVidOper: TdxBarButton;
        dxBarButtonPrK_SP_OCENKA: TdxBarButton;
        dxBarButtonPrK_SP_PREIM: TdxBarButton;
        dxBarButtonPrK_SP_FORM_OBUCH_KATEGORY: TdxBarButton;
        dxBarButtonPrK_SP_VID_DOG: TdxBarButton;
        dxBarButtonSpDepartment: TdxBarButton;
        ItemService: TdxBarSubItem;
        dxBarButtonOptionInterfase: TdxBarButton;
        dxBarButtonFacultySpecGroup: TdxBarButton;
    dxBarButtonPrepareDoc: TdxBarButton;
        dxBarButtonPRK_SP_MIN_PERELIK_PRIM: TdxBarButton;
        dxBarButtonPrK_SP_MIN_PERELIK_SPEC: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_KAT_STUD: TdxBarButton;
        dxBarButtonPrK_SP_MIN_PERELIK_SHIFR: TdxBarButton;
        dxBarButtonPrK_SP_VUZ_LICENCE: TdxBarButton;
        dxBarButtonPrK_SP_PLAN_NABORA: TdxBarButton;
        dxBarButtonPrK_SP_SROK_OB: TdxBarButton;
    dxBarButton1dfReports: TdxBarButton;
        dxBarButtonuPrK_SP_EDUCORG: TdxBarButton;
        dxBarButtonPRK_SP_PERELIK_ISPIT: TdxBarButton;
        dxBarButtonPrK_SP_PREDM_u: TdxBarButton;
        dxBarButtonPrK_SP_CEL_ZAMOVNIK: TdxBarButton;
        dxBarButtonOptionWork: TdxBarButton;
        dxBarStaticLabelGodNabora: TdxBarStatic;
        dxBarButtonPrK_SP_PLAN_CEL_NABOR: TdxBarButton;
        dxBarButtonPrK_SP_POTOK: TdxBarButton;
        dxBarSubItemPlanNabora: TdxBarSubItem;
        dxBarSubItemIspit: TdxBarSubItem;
        dxBarSubItemFacSpecForm: TdxBarSubItem;
        dxBarSubItemPreim: TdxBarSubItem;
        dxBarSubItemObuch: TdxBarSubItem;
        dxBarSubItemHaraktWorkPrK: TdxBarSubItem;
        dxBarSubItemObrazov: TdxBarSubItem;
        dxBarSubItemPerelikNaprAndSpec: TdxBarSubItem;
        dxBarSubItemOtherSprav: TdxBarSubItem;
        dxBarSubItemNotActive: TdxBarSubItem;
        dxBarButtonPrK_SP_ISPIT_VEDOM_TYPE: TdxBarButton;
        dxBarButtonPRK_SP_TYPE_DOP_DOK: TdxBarButton;
        dxBarButtonPrK_SP_EKZ_RASP: TdxBarButton;
    dxBarButtonDocType: TdxBarButton;
        dxBarButtonPrKEkzVedom: TdxBarButton;
        dxBarButtonPRK_REK_DO_ZARAH: TdxBarButton;
        dxBarSubItemZarah: TdxBarSubItem;
        dxBarButtonPrK_SP_DOLGNOST_PK: TdxBarButton;
        dxBarButtonPRK_SP_SOSTAV_PK: TdxBarButton;
        dxBarButtonPRK_SP_FORM_STUD_FOB_PROT: TdxBarButton;
        dxBarButtonPrK_PROT_ZACH: TdxBarButton;
        dxBarButtonTempKB: TdxBarButton;
        ErrorHandlerPrK: TpFibErrorHandler;
        dxBarButtonPRK_SP_KAT_PRI_D: TdxBarButton;
        DataSetReportsSubItem: TpFIBDataSet;
        DataSetReportsBtnItem: TpFIBDataSet;
        dxBarButtonPrK_Filtr: TdxBarButton;
        dxBarButtonPrK_SP_TYPE_ZACH: TdxBarButton;
        dxBarSubItemSpecSprav: TdxBarSubItem;
        dxBarButtonPUB_SP_MOVA: TdxBarButton;
        dxBarButtonPUB_SP_USPEC: TdxBarButton;
        dxBarButtonPUB_SP_SPEC: TdxBarButton;
        dxBarButtonPUB_JN_FAK_SPEC: TdxBarButton;
    dxBarButtonOznDohod: TdxBarButton;
    dxBarButtonFilial: TdxBarButton;
        ItemHelp: TdxBarSubItem;
        dxBarButtonWhatsNew: TdxBarButton;
        Images: TImageList;
    dxBarButtonAbout: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure dxBarButtonPeopleClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure dxBarButtonOptionInterfaseClick(Sender: TObject);
        procedure dxBarButton1dfReportsClick(Sender: TObject);
        procedure dxBarButtonPrepareDocClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure dxPIStatusBarResize(Sender: TObject);
        procedure dxBarButtonFilialClick(Sender: TObject);
    procedure dxBarButtonVidOperClick(Sender: TObject);
    procedure dxBarButtonOznDohodClick(Sender: TObject);
    procedure dxBarButtonDocTypeClick(Sender: TObject);
    procedure dxBarButtonWhatsNewClick(Sender: TObject);
    procedure dxBarButtonAboutClick(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    private
        IndexLanguage: Integer;
        God_Nabora: Int64; // используется при записи в реестр и при передачи параметров
        NameGodNabora: string; // используется при записи в реестр и при при иницализации
        ID_USER_GLOBAL: Int64;
        USER_NAME_GLOBAL: string;
        ID_PEOPLE_GLOBAL: Int64;
        NAME_PEOPLE_GLOBAL: string;
        FSelectSQLReportsSubItem: string;
        FSelectSQLReportsBtnItem: string;
        procedure InicCaption;
        function ConnectToBase: integer;
     //   function ValueFieldPISetup(DB_Handle:TISC_DB_HANDLE;NameField:string):variant;
    end;

var
    FormPI: TFormPI;

implementation
uses
    uPwdDecrypt, AllPeopleUnit,
    uPI_Loader,  registry, uPI_Constants, MDIToolBar,
    uCommonSp, uPIOptionInterfase, AArray, uPiOptionWork, AccMgmt, DogLoaderUnit,
    uLoginPI, uPI_Resources;

{$R *.dfm}

procedure TFormPI.FormCreate(Sender: TObject);
var
    IniFile: TMemIniFile;
    DATABASE_PATH: string;
    SERVER: string;
    DB_USER: string;
    DB_PASSWORD: string;
    DB_CHARSET: string;
    DB_SQL_DIALECT: string;
    reg: TRegistry;
    RegisterValueId: string;
    RegisterValueName: string;
begin
    IndexLanguage := SelectLanguage;
    InicCaption;
    if ConnectToBase = 0 then
    begin
        Application.Terminate;
        Exit;
    end;
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PI\Data\', false) then
        begin
            RegisterValueId := reg.ReadString('ID_GOD_NABORA');
            RegisterValueName := reg.ReadString('NAME_GOD_NABORA');
        end;
    finally
        reg.Free;
    end;
    God_Nabora := -1;
    if trim(RegisterValueId) <> '' then
    begin
        God_Nabora := StrToInt(RegisterValueId);
        NameGodNabora := RegisterValueName;
        dxBarStaticLabelGodNabora.Caption :=
            dxBarStaticLabelGodNabora.Caption + ': ' + NameGodNabora;
    end;

end;


function TFormPI.ConnectToBase: integer;
var
    reg: TRegistry;
    CurrentID_PCARD: integer;
    CurrentLogin, CurrentPassword: string;
    Error: integer;
    InitResult: TResultInfo;
    T: TFormLoginPI;
    password,login,context: string;
begin
    result := 1; // присваем 1 т.к. все хорошо, в случае боков далее присваем 0
    login := ParamStr(1);
    password := ParamStr(2);
    if (login<>'')and(password<>'') then
    begin
        CurrentLogin := login;
        CurrentPassword := password;
    end else
    begin
    T := TFormLoginPI.Create(self);
    if T.ShowModal = MrOk then
    begin
        CurrentLogin := T.cxTextEditLogin.Text;
        CurrentPassword := T.cxTextEditPassword.Text;
    end
    else begin
        T.Free;
        T := nil;
        result := 0;
        exit;
    end;

    T.Free;
    T := nil;
    end;
    InitResult.DBHandle := nil;
    InitResult.ErrorCode := -1;
    try
        InitResult := fibInitConnection(CurrentLogin, CurrentPassword);
    except on e: Exception do
        begin
            Dialogs.MessageDlg('Фатальна помилка у системі безпеки : ' +
                e.Message, mtError, [mbOk], 0);
            ModalResult := mrCancel;
            result := 0;
            Exit;
        end;
    end;

    if InitResult.ErrorCode <> ACCMGMT_OK then // ошибка
    begin
        Dialogs.MessageDlg(AcMgmtErrMsg(InitResult.ErrorCode), mtError, [mbOk], 0);
        result := 0;
    end
    else begin // все пучком
        CurrentID_PCARD := AccMgmt.GetCurrentUserIDExt; // забрать PCARD
        ID_USER_GLOBAL := AccMgmt.GetUserId;
        ID_PEOPLE_GLOBAL := AccMgmt.GetUserIdMan; //  передача  Id_People в главную форму
  {*}Database.Handle := InitResult.DBHandle;
        LoadSysData(ReadTransaction);
   // на случай совсем злых багов
        if CurrentID_PCARD = 0 then
        begin
            Dialogs.MessageDlg('Помилка у системі безпеки!', mtError, [mbOk], 0);
            ModalResult := mrCancel; // или  MrNone
            result := 0;
            Exit;
        end
        else
        begin
            Error := fibCheckPermission('/ROOT/PersonalIncome', 'Belong');
            if Error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('Помилка'), 16);
                ModalResult := mrCancel;
                result := 0;
            end;
        end;
    end;
end;

procedure TFormPI.InicCaption;
begin
    TFormPI(self).Caption := nFormPI_Caption[IndexLanguage];
    ItemSpravochniki.Caption := nItemSpravochniki[IndexLanguage];
    ItemReports.Caption := nReports[IndexLanguage];
    ItemHelp.Caption := nHelp[IndexLanguage];

    dxBarButtonAbout.Caption := ndxAbout[IndexLanguage];
    dxBarButtonWhatsNew.Caption := ndxWhatsNew[IndexLanguage];

    dxBarButtonDocType.Caption := ndxBtnDocType[IndexLanguage];
    dxBarButtonOznDohod.Caption := ndxBtnOznDohod[IndexLanguage];
    dxBarButtonVidOper.Caption := ndxBtnVidOper[IndexLanguage];
    dxBarButtonPeople.Caption      := ndxBtnPeople[IndexLanguage];
    dxBarButtonFilial.Caption := ndxBtnFilial[IndexLanguage];

    dxBarButton1dfReports.Caption  := ndxBtn1dfReports[IndexLanguage];
    dxBarButtonPrepareDoc.Caption := ndxBtnPrepareDoc[IndexLanguage];
end;

procedure TFormPI.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i, j: integer;
    CountMDIChildForm: integer;
    CountActiveTrans: integer;
begin
    CountMDIChildForm := Application.MainForm.MDIChildCount;
    for i := 0 to CountMDIChildForm - 2 do begin
        Application.MainForm.MDIChildren[0].Close;
        Application.MainForm.MDIChildren[0].Free;

    end;
{    CountMDIChildForm := Application.MainForm.MDIChildCount;
    for i := 0 to CountMDIChildForm - 1 do
    begin
        Application.MainForm.MDIChildren[CountMDIChildForm - i - 1].Close; // то есть будем начинать закрывать с последней
    end;}
    ErrorHandlerPrK.Free;
    ErrorHandlerPrK := nil;
end;

procedure TFormPI.dxBarButtonPeopleClick(Sender: TObject);
begin
  if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav/PI_Menu_People','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav','Belong')=0 )
        then begin
        AllPeopleUnit.GetMan(Self, Database.Handle, false, true);
    end
    else begin
        MessageDlg('Увага!', 'Ви не маєте прав доступу до цієї інформації!', mtWarning, [mbOk]);
    end;
end;

procedure TFormPI.FormShow(Sender: TObject);
var
    p: TMDITool;
begin
    p := TMDITool.Create;
    p.AddMDIToolBar(Self);

    dxPIStatusBar.Panels[1].Text := AccMGMT.fibGetCurrentDBPath;
    dxPIStatusBar.Panels[2].Text := AccMGMT.GetUserFIO;
    dxPIStatusBar.Panels[3].Text := DateToStr(Date);
end;

procedure TFormPI.dxBarButtonOptionInterfaseClick(Sender: TObject);
var
    T: TFormOptionInterfase;
begin
    T := TFormOptionInterfase.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TFormPI.dxBarButton1dfReportsClick(Sender: TObject);
var PI1dfReportsParam:TPIVidOplParam;
 dfReports:Variant;
begin
  if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Reports/PI_Menu_1dfReports','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Reports','Belong')=0 )
  then begin //yes
        PI1dfReportsParam:=TPIVidOplParam.create;
        PI1dfReportsParam.Owner:=self;
        PI1dfReportsParam.Db_HANDLE:=Database.Handle;
        PI1dfReportsParam.PIFormStyle := zfsChild;
        dfReports:=LoadVidOpl(PI1dfReportsParam, PI1dfReports);
    end
    else begin
        MessageDlg('Увага!', 'Ви не маєте прав доступу до цієї інформації!', mtWarning, [mbOk]);
    end;
end;

procedure TFormPI.dxBarButtonPrepareDocClick(Sender: TObject);
var AParameter: TPiParamPacks;
begin
    if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Reports/PI_Menu_PrepareDoc','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Reports','Belong')=0 )
        then begin //yes
          AParameter := TpiParamPacks.Create;
          AParameter.Owner := self;
          AParameter.Db_Handle := Database.Handle;
          AParameter.Formstyle := fsMDIChild;
          DoFunctionFromPackage(AParameter, ['Personal_income\Pi_PrepareDoc1df.bpl', 'ShowPiPrepareDoc1df']);
          AParameter.Free;
    end
    else begin
        MessageDlg('Увага!', 'Ви не маєте прав доступу до цієї інформації!', mtWarning, [mbOk]);
    end;
end;

procedure TFormPI.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageDlg('Увага', 'Ви дійсно бажаєте вийти?', mtConfirmation, [mbYes, mbNo]) = mrNo then CanClose := false;
end;

procedure TFormPI.dxPIStatusBarResize(Sender: TObject);
begin
    dxPIStatusBar.Panels[1].Width := Round(dxPIStatusBar.Width / 3);

    dxPIStatusBar.Panels[2].Width := Round(dxPIStatusBar.Width / 5);
    dxPIStatusBar.Panels[3].Width := Round(dxPIStatusBar.Width / 10);
    dxPIStatusBar.Panels[4].Width := Round(dxPIStatusBar.Width / 10);
    dxPIStatusBar.Panels[0].Width := dxPIStatusBar.Width - dxPIStatusBar.Panels[1].Width - dxPIStatusBar.Panels[2].Width - dxPIStatusBar.Panels[3].Width - dxPIStatusBar.Panels[4].Width - 10;

end;

procedure TFormPI.dxBarButtonFilialClick(Sender: TObject);
var //PIFilialParam:TZSimpleParamFull;
 AParameter:TZSimpleParamFull;
 Filial:Variant;
begin
  if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav/PI_Menu_Filial','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav','Belong')=0 )
     then
     begin //yes
         AParameter := TZSimpleParamFull.Create;
         AParameter.Owner := self;
         AParameter.Db_Handle :=Database.Handle;
         AParameter.Formstyle := fsMDIChild;
         ZLoadFromPackage(AParameter, ['Zarplata\f1dfFirm.bpl', 'View_FZ_F1dfFirm_Sp']);
         AParameter.Free;
     end
     else begin
              MessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації!',mtWarning,[mbOk]);
     end;
end;

procedure TFormPI.dxBarButtonVidOperClick(Sender: TObject);
var PIVidOplParam:TPIVidOplParam;
 VidOpl:Variant;
begin
  if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav/PI_Menu_VidOper','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav','Belong')=0 )

     then begin //yes
          PIVidOplParam:=TPIVidOplParam.create;
          PIVidOplParam.Owner:=self;
          PIVidOplParam.Db_HANDLE:=Database.Handle;
          PIVidOplParam.PIFormStyle := zfsChild;
          VidOPl:=LoadVidOpl(PIVidOplParam, PIVidOpl);
          PIVidOplParam.Free;
  end
     else begin
              MessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації!',mtWarning,[mbOk]);
     end;
end;

procedure TFormPI.dxBarButtonOznDohodClick(Sender: TObject);
var
AParameter: TPiParamPacks;
begin
      if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav/PI_Menu_OznDohod','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav','Belong')=0 )

     then begin //yes
          AParameter := TpiParamPacks.Create;
          AParameter.Owner := self;
          AParameter.Db_Handle := Database.Handle;
          AParameter.Formstyle := fsMDIChild;
          DoFunctionFromPackage(AParameter, ['Personal_income\Pi_SpPropIncome.bpl', 'ShowPiPropIncome']);
          AParameter.Free;
       end
     else begin
              MessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації!',mtWarning,[mbOk]);
     end;
end;

procedure TFormPI.dxBarButtonDocTypeClick(Sender: TObject);
var
AParameter: TPiParamPacks;
begin
      if (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav/PI_Menu_DocType','Belong')=0 )
     or (fibCheckPermission('/ROOT/PersonalIncome/PI_Menu/PI_Menu_Sprav','Belong')=0 )
     then begin //yes
          AParameter := TPiParamPacks.Create;
          AParameter.Owner := self;
          AParameter.Db_Handle := Database.Handle;
          AParameter.Formstyle := fsMDIChild;
          DoFunctionFromPackage(AParameter, ['Personal_income\PiTypeDoc.bpl', 'ShowPiTypeDoc']);
          AParameter.Free;
       end
     else begin
              MessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації!',mtWarning,[mbOk]);
     end;
end;


procedure TFormPI.dxBarButtonWhatsNewClick(Sender: TObject);
begin
    LoadWhatsNew(self,'PI_Whats_New.txt')
end;

procedure TFormPI.dxBarButtonAboutClick(Sender: TObject);
begin
    LoadAuthors(self);
end;

procedure TFormPI.dxBarButton3Click(Sender: TObject);
begin
   close;
end;

end.

