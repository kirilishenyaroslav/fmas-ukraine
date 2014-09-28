unit uPrK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGraphics,
  cxControls, dxStatusBar, dxBar,inifiles, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxBarExtItems, Menus, dxsbar, pFIBErrorHandler;

type
  TFormPrK = class(TForm)
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ImageListPrK: TImageList;
    FormStoragePrK: TFormStorage;
    dxStatusBarPrK: TdxStatusBar;
    BarManager: TdxBarManager;
    ItemWork: TdxBarSubItem;
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
    dxBarButtonPrK_SP_GOD_NABORA: TdxBarButton;
    dxBarButtonPrK_SP_OCENKA: TdxBarButton;
    dxBarButtonPrK_SP_PREIM: TdxBarButton;
    dxBarButtonPrK_SP_FORM_OBUCH_KATEGORY: TdxBarButton;
    dxBarButtonPrK_SP_VID_DOG: TdxBarButton;
    dxBarButtonSpDepartment: TdxBarButton;
    ItemConfiguraciya: TdxBarSubItem;
    dxBarButtonOptionInterfase: TdxBarButton;
    dxBarButtonFacultySpecGroup: TdxBarButton;
    dxBarButtonPrKAbitViewWithFilter: TdxBarButton;
    dxBarButtonPRK_SP_MIN_PERELIK_PRIM: TdxBarButton;
    dxBarButtonPrK_SP_MIN_PERELIK_SPEC: TdxBarButton;
    dxBarButtonPrK_SP_TYPE_KAT_STUD: TdxBarButton;
    dxBarButtonPrK_SP_MIN_PERELIK_SHIFR: TdxBarButton;
    dxBarButtonPrK_SP_VUZ_LICENCE: TdxBarButton;
    dxBarButtonPrK_SP_PLAN_NABORA: TdxBarButton;
    dxBarButtonPrK_SP_SROK_OB: TdxBarButton;
    dxBarButtonAbit: TdxBarButton;
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
    dxBarButtonCustomers: TdxBarButton;
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
    ItemReports: TdxBarSubItem;
    DataSetReportsSubItem: TpFIBDataSet;
    DataSetReportsBtnItem: TpFIBDataSet;
    dxBarButtonPrK_Filtr: TdxBarButton;
    dxBarButtonPrK_ProtDopusk: TdxBarButton;
    dxBarButtonPrK_SP_TYPE_ZACH: TdxBarButton;
    dxBarSubItemUO: TdxBarSubItem;
    dxBarButtonKAF_DISC_SPEC: TdxBarButton;
    dxBarButtonPRT_UCH_PLAN: TdxBarButton;
    procedure dxBarButtonFormStudyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButtonCategoryStudyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarButtonPeopleClick(Sender: TObject);
    procedure dxBarButtonPrKSpRishClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_DERG_ZAKAZClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_EXZFORMClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_GURTOGClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_IN_LANGClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_IS_COPYClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_KAT_PRI_XClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_KURSClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_LEVEL_VLADENClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_NPKClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_OLD_PRICHClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PREDMClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PRICHClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PRIZN_ZACHISLClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_RISH_TYPEClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_DOK_OBRClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_PEREKLClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_RAZNClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_UCHZClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_UKR_LANGClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_VID_DIIClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_ZABRClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_FOB_PROTClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButtonPrK_SP_GOD_NABORAClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_OCENKAClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PREIMClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_FORM_OBUCH_KATEGORYClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_VID_DOGClick(Sender: TObject);
    procedure dxBarButtonSpDepartmentClick(Sender: TObject);
    procedure dxBarButtonOptionInterfaseClick(Sender: TObject);
    procedure dxBarButtonFacultySpecGroupClick(Sender: TObject);
    procedure dxBarButtonPrKAbitViewWithFilterClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_MIN_PERELIK_PRIMClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_MIN_PERELIK_SPECClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_KAT_STUDClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_MIN_PERELIK_SHIFRClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_VUZ_LICENCEClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PLAN_NABORAClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_SROK_OBClick(Sender: TObject);
    procedure dxBarButtonAbitClick(Sender: TObject);
    procedure dxBarButtonuPrK_SP_EDUCORGClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_PERELIK_ISPITClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PREDM_uClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_CEL_ZAMOVNIKClick(Sender: TObject);
    procedure dxBarButtonOptionWorkClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_PLAN_CEL_NABORClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_POTOKClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_ISPIT_VEDOM_TYPEClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_TYPE_DOP_DOKClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_EKZ_RASPClick(Sender: TObject);
    procedure dxBarButtonCustomersClick(Sender: TObject);
    procedure dxBarButtonPrKEkzVedomClick(Sender: TObject);
    procedure dxBarButtonPRK_REK_DO_ZARAHClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_DOLGNOST_PKClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_SOSTAV_PKClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_FORM_STUD_FOB_PROTClick(Sender: TObject);
    procedure dxBarButtonPrK_PROT_ZACHClick(Sender: TObject);
    procedure dxBarButtonTempKBClick(Sender: TObject);
    procedure dxBarButtonPRK_SP_KAT_PRI_DClick(Sender: TObject);
    procedure ReportsBtnItemClick(Sender: TObject);
    procedure dxBarButtonPrK_FiltrClick(Sender: TObject);
    procedure dxBarButtonPrK_ProtDopuskClick(Sender: TObject);
    procedure dxBarButtonPrK_SP_TYPE_ZACHClick(Sender: TObject);
    procedure dxBarButtonKAF_DISC_SPECClick(Sender: TObject);
    procedure dxBarButtonPRT_UCH_PLANClick(Sender: TObject);
  private
    IndexLanguage     :Integer;
    God_Nabora        :Int64;  // используетс€ при записи в реестр и при передачи параметров
    NameGodNabora     :String; // используетс€ при записи в реестр и при при иницализации
    ID_USER_GLOBAL    :Int64;
    USER_NAME_GLOBAL  :String;
    ID_PEOPLE_GLOBAL  :Int64;
    NAME_PEOPLE_GLOBAL:String;
    FSelectSQLReportsSubItem: string;
    FSelectSQLReportsBtnItem: string;
    procedure InicCaption;
    function ConnectToBase: integer;
    procedure ItemReportsCreate;
    procedure SetSelectSQLReportsSubItem(const Value: string);
    procedure SetSelectSQLReportsBtnItem(const Value: string);
  public
    property SelectSQLReportsSubItem :string read FSelectSQLReportsSubItem write SetSelectSQLReportsSubItem;
    property SelectSQLReportsBtnItem :string read FSelectSQLReportsBtnItem write SetSelectSQLReportsBtnItem;

  end;

var
  FormPrK: TFormPrK;

implementation
uses
  cn_Common_Loader,cn_Common_Types,uPwdDecrypt,AllPeopleUnit,
  uPrK_Loader,  uPrK_Resources,registry,uConstants, MDIToolBar,
  uCommonSp,uOptionInterfase,AArray,uOptionWork,AccMgmt,DogLoaderUnit,
  uLoginPrK;

{$R *.dfm}

procedure TFormPrK.FormCreate(Sender: TObject);
var
  IniFile : TMemIniFile;
  DATABASE_PATH     : string;
  SERVER            : string;
  DB_USER           : string;
  DB_PASSWORD       : string;
  DB_CHARSET        : string;
  DB_SQL_DIALECT    : string;
  reg               :TRegistry;
  RegisterValueId   :String;
  RegisterValueName :String;
begin
  IndexLanguage:=SelectLanguage;
  InicCaption;
  if  ConnectToBase=0 then
   begin
     Application.Terminate;
     Exit;
   end;

 { IniFile        := TMemIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  DATABASE_PATH  := IniFile.ReadString('CONNECTION', 'Path', DATABASE_PATH);
              SERVER         := IniFile.ReadString('CONNECTION', 'Server', SERVER);
              DB_USER        := IniFile.ReadString('CONNECTION', 'User', DB_USER);
              DB_PASSWORD    := PwdDeCrypt(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));
              DATABASE_PATH  := SERVER + ':' + DATABASE_PATH;
              DB_CHARSET     := IniFile.ReadString('CONNECTION', 'CharSet',DB_CHARSET);
              DB_SQL_DIALECT := IniFile.ReadString('CONNECTION', 'SQLDialect',DB_SQL_DIALECT);
  IniFile.Free;

               Database.ConnectParams.UserName    := DB_USER;
               Database.ConnectParams.Password    := DB_PASSWORD;
               Database.DatabaseName              := DATABASE_PATH;
               Database.ConnectParams.CharSet     := DB_CHARSET;
               Database.SQLDialect                := StrToInt(DB_SQL_DIALECT);

  Database.Connected := true;
                   }
  reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\Data\',false) then
        begin
           RegisterValueId  :=reg.ReadString('ID_GOD_NABORA');
           RegisterValueName:=reg.ReadString('NAME_GOD_NABORA');
        end;
     finally
         reg.Free;
     end;
     God_Nabora:=-1;
     if trim(RegisterValueId)<>'' then
      begin
       God_Nabora                        :=StrToInt(RegisterValueId);
       NameGodNabora                     :=RegisterValueName;
       dxBarStaticLabelGodNabora.Caption :=
           dxBarStaticLabelGodNabora.Caption+': '+NameGodNabora;
     end;

  ItemReportsCreate;
end;

function TFormPrK.ConnectToBase :integer;
var
      //InitResult:	Integer;
    reg:TRegistry;
    CurrentID_PCARD: integer;
    CurrentLogin,CurrentPassword: string;
    Error: integer;
    InitResult : TResultInfo;
    T:TFormLoginPrK;
begin
  result:=1; // присваем 1 т.к. все хорошо, в случае боков далее присваем 0
  T:=TFormLoginPrK.Create(self);
  if T.ShowModal=MrOk then
    begin
     CurrentLogin    := T.cxTextEditLogin.Text;
	   CurrentPassword := T.cxTextEditPassword.Text;
    end
    else begin
      T.Free;
      T:=Nil;
      result:=0;
      exit;
    end;

    T.Free;
    T:=Nil;

  InitResult.DBHandle := nil;
  InitResult.ErrorCode:=-1;
	try
    InitResult := fibInitConnection(CurrentLogin, CurrentPassword);
	except on e: Exception do
		begin
			  Dialogs.MessageDlg('‘атальна помилка у систем≥ безпеки : ' +
				e.Message, mtError,[mbOk],0);
			  ModalResult := mrCancel;
        result:=0;
        Exit;
		end;
	end;
  
	if InitResult.ErrorCode <> ACCMGMT_OK then		// ошибка
	begin
  		Dialogs.MessageDlg(AcMgmtErrMsg(InitResult.ErrorCode),mtError,[mbOk],0);
      result:=0;
	end
	else begin	// все пучком

	 	  CurrentID_PCARD       := AccMgmt.GetCurrentUserIDExt;  // забрать PCARD
      ID_USER_GLOBAL        :=AccMgmt.GetUserId;
      ID_PEOPLE_GLOBAL      :=AccMgmt.GetUserIdMan;//  передача  Id_People в главную форму
{*}   Database.Handle       :=InitResult.DBHandle;
      LoadSysData(ReadTransaction); 
			// на случай совсем злых багов
		  if CurrentID_PCARD = 0 then
  		begin
	  	    Dialogs.MessageDlg('ѕомилка у систем≥ безпеки!',mtError,[mbOk],0);
		  	  ModalResult := mrCancel; // или  MrNone
          result:=0;
          Exit;
  		end
      else
      begin
          Error :=fibCheckPermission('/ROOT/PrK', 'Belong');
          if  Error <> 0 then
          begin
              MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('ѕомилка'), 16);
              ModalResult := mrCancel;
              result:=0;
          end;
      end;
	end;
end;

procedure TFormPrK.InicCaption;
begin
   TFormPrK(self).Caption    :=nFormPrK_Caption[IndexLanguage];
   ItemWork.Caption          :=nItemWork[IndexLanguage];
   ItemSpravochniki.Caption  :=nItemSpravochniki[IndexLanguage];
   ItemConfiguraciya.Caption :=nConfiguraciya[IndexLanguage];


   dxBarSubItemPlanNabora.Caption         :=ndxBarSubItemPlanNabora[IndexLanguage];
   dxBarSubItemIspit.Caption              :=ndxBarSubItemIspit[IndexLanguage];
   dxBarSubItemFacSpecForm.Caption        :=ndxBarSubItemFacSpecForm[IndexLanguage];
   dxBarSubItemPreim.Caption              :=ndxBarSubItemPreim[IndexLanguage];
   dxBarSubItemObuch.Caption              :=ndxBarSubItemObuch[IndexLanguage];
   dxBarSubItemHaraktWorkPrK.Caption      :=ndxBarSubItemHaraktWorkPrK[IndexLanguage];
   dxBarSubItemObrazov.Caption            :=ndxBarSubItemObrazov[IndexLanguage];
   dxBarSubItemPerelikNaprAndSpec.Caption :=ndxBarSubItemPerelikNaprAndSpec[IndexLanguage];
   dxBarSubItemOtherSprav.Caption         :=ndxBarSubItemOtherSprav[IndexLanguage];
   dxBarSubItemZarah.Caption              :=ndxBarSubItemZarah[IndexLanguage];

   dxBarStaticLabelGodNabora.Caption:=ndxBarStaticLabelGodNabora[IndexLanguage];

   dxBarButtonOptionInterfase.Caption  :=ndxBtnOptionInterfase[IndexLanguage];
   dxBarButtonOptionWork.Caption       :=ndxBtnOptionWork[IndexLanguage];

   dxBarButtonFormStudy.Caption     :=ndxBtnFormStudy[IndexLanguage];
   dxBarButtonCategoryStudy.Caption :=ndxBtnCategoryStudy[IndexLanguage];
   dxBarButtonPeople.Caption        :=ndxBtnPeople[IndexLanguage];
   dxBarButtonSpDepartment.Caption  :=ndxBtnSpDepartment[IndexLanguage];
   dxBarButtonFacultySpecGroup.Caption  :=ndxBtnFacultySpecGroup[IndexLanguage];

   dxBarButtonPrK_SP_DERG_ZAKAZ.Caption    := ndxBtnPrK_SP_DERG_ZAKAZ[IndexLanguage];
   dxBarButtonPrK_SP_EXZFORM.Caption       := ndxBtnPrK_SP_EXZFORM[IndexLanguage];
   dxBarButtonPrK_SP_FOB_PROT.Caption      := ndxBtnPRK_SP_FOB_PROT[IndexLanguage];
   dxBarButtonPrK_SP_FORM_OBUCH_KATEGORY.Caption      := ndxBtnPrK_SP_FORM_OBUCH_KATEGORY[IndexLanguage];
   dxBarButtonPrK_SP_GOD_NABORA.Caption    := ndxBtnPRK_SP_GOD_NABORA[IndexLanguage];
   dxBarButtonPrK_SP_POTOK.Caption         := ndxBtnPRK_SP_POTOK[IndexLanguage];
   dxBarButtonPrK_SP_GURTOG.Caption        := ndxBtnPrK_SP_GURTOG[IndexLanguage];
   dxBarButtonPrK_SP_IN_LANG.Caption       := ndxBtnPrK_SP_IN_LANG[IndexLanguage];
   dxBarButtonPrK_SP_IS_COPY.Caption       := ndxBtnPrK_SP_IS_COPY[IndexLanguage];
   dxBarButtonPrK_SP_KAT_PRI_X.Caption     := ndxBtnPrK_SP_KAT_PRI_X[IndexLanguage];
   dxBarButtonPrK_SP_KAT_PRI_D.Caption     := ndxBtnPrK_SP_KAT_PRI_D[IndexLanguage];
   dxBarButtonPrK_SP_KURS.Caption          := ndxBtnPrK_SP_KURS[IndexLanguage];
   dxBarButtonPrK_SP_LEVEL_VLADEN.Caption  := ndxBtnPrK_SP_LEVEL_VLADEN[IndexLanguage];
   dxBarButtonPrK_SP_NPK.Caption           := ndxBtnPrK_SP_NPK[IndexLanguage];
   dxBarButtonPrK_SP_OCENKA.Caption        := ndxBtnPRK_SP_OCENKA[IndexLanguage];
   dxBarButtonPrK_SP_OLD_PRICH.Caption     := ndxBtnPrK_SP_OLD_PRICH[IndexLanguage];
   dxBarButtonPrK_SP_PREDM_u.Caption       := ndxBtnPrK_SP_PREDM_u[IndexLanguage];
   dxBarButtonPrK_SP_PREDM.Caption         := ndxBtnPrK_SP_PREDM[IndexLanguage];
   dxBarButtonPrK_SP_PREIM.Caption         := ndxBtnPrK_SP_PREIM[IndexLanguage];
   dxBarButtonPrK_SP_PRICH.Caption         := ndxBtnPrK_SP_PRICH[IndexLanguage];
   dxBarButtonPrK_SP_PRIZN_ZACHISL.Caption := ndxBtnPrK_SP_PRIZN_ZACHISL[IndexLanguage];
   dxBarButtonPrK_SP_RISH_TYPE.Caption     := ndxBtnPrK_SP_RISH_TYPE[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_DOK_OBR .Caption := ndxBtnPrK_SP_TYPE_DOK_OBR[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_PEREKL.Caption   := ndxBtnPrK_SP_TYPE_PEREKL[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_RAZN.Caption     := ndxBtnPrK_SP_TYPE_RAZN[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_UCHZ.Caption     := ndxBtnPrK_SP_TYPE_UCHZ[IndexLanguage];
   dxBarButtonPrK_SP_UKR_LANG.Caption      := ndxBtnPrK_SP_UKR_LANG[IndexLanguage];
   dxBarButtonPrK_SP_VID_DII.Caption       := ndxBtnPrK_SP_VID_DII[IndexLanguage];
   dxBarButtonPrK_SP_VID_DOG.Caption       := ndxBtnPrK_SP_VID_DOG[IndexLanguage];
   dxBarButtonPrK_SP_ZABR.Caption          := ndxBtnPrK_SP_ZABR[IndexLanguage];
   dxBarButtonPRK_SP_MIN_PERELIK_PRIM.Caption  := ndxBtnPRK_SP_MIN_PERELIK_PRIM[IndexLanguage];
   dxBarButtonPRK_SP_MIN_PERELIK_SPEC.Caption  := ndxBtnPRK_SP_MIN_PERELIK_SPEC[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_KAT_STUD.Caption := ndxBtnPrK_SP_TYPE_KAT_STUD[IndexLanguage];
   dxBarButtonPrK_SP_SROK_OB.Caption       := ndxBtnPrK_SP_SROK_OB[IndexLanguage];
   dxBarButtonPrK_SP_MIN_PERELIK_SHIFR.Caption := ndxBtnPrK_SP_MIN_PERELIK_SHIFR[IndexLanguage];
   dxBarButtonPrK_SP_VUZ_LICENCE.Caption   := ndxBtnPrK_SP_VUZ_LICENCE[IndexLanguage];
   dxBarButtonPrK_SP_PLAN_NABORA.Caption   := ndxBtnPrK_SP_PLAN_NABORA[IndexLanguage];
   dxBarButtonuPrK_SP_EDUCORG.Caption      := ndxBtnPrK_SP_EDUCORG[IndexLanguage];
   dxBarButtonPRK_SP_PERELIK_ISPIT.Caption := ndxBtnPRK_SP_PERELIK_ISPIT[IndexLanguage];
   dxBarButtonPrK_SP_CEL_ZAMOVNIK.Caption  := ndxBtnPrK_SP_CEL_ZAMOVNIK[IndexLanguage];
   dxBarButtonPrK_SP_PLAN_CEL_NABOR.Caption:= ndxBtnPRK_SP_PLAN_CEL_NABOR[IndexLanguage];
   dxBarButtonPrKAbitViewWithFilter.Caption:=ndxBtnPrKKlassViewWithFilter[IndexLanguage];
   dxBarButtonAbit.Caption                 :=ndxBtnAbit[IndexLanguage];
   dxBarButtonPrK_SP_ISPIT_VEDOM_TYPE.Caption  := ndxBtnPRK_SP_ISPIT_VEDOM_TYPE[IndexLanguage];
   dxBarButtonPRK_SP_TYPE_DOP_DOK.Caption  := ndxBtnPRK_SP_TYPE_DOP_DOK[IndexLanguage];
   dxBarButtonPrK_SP_EKZ_RASP.Caption      := ndxBtnPRK_SP_EKZ_RASP[IndexLanguage];
   dxBarButtonCustomers.Caption            := ndxBtnCustomers[IndexLanguage];
   dxBarButtonPrKEkzVedom.Caption          := ndxBtnAbitPrK_Ekz_Vedom[IndexLanguage];
   dxBarButtonPRK_REK_DO_ZARAH.Caption     := ndxBtnPRK_REK_DO_ZARAH[IndexLanguage];
   dxBarButtonPrK_SP_DOLGNOST_PK.Caption   := ndxBtnPRK_SP_DOLGNOST_PK[IndexLanguage];
   dxBarButtonPRK_SP_SOSTAV_PK.Caption     := ndxBtnPRK_SP_SOSTAV_PK[IndexLanguage];
   dxBarButtonPRK_SP_FORM_STUD_FOB_PROT.Caption :=ndxBtnPRK_SP_FORM_STUD_FOB_PROT[IndexLanguage];
   dxBarButtonPrK_PROT_ZACH.Caption        := ndxBtnPrK_PROT_ZACH[IndexLanguage];
   dxBarButtonPrK_ProtDopusk.Caption       := ndxBtnPrK_PROT_DOPUSK[IndexLanguage];
   dxBarButtonPrK_Filtr.Caption            := ndxBtnPrK_Filtr[IndexLanguage];
   dxBarButtonPrK_SP_TYPE_ZACH.Caption     := ndxBtnPrK_SP_TYPE_ZACH_Caption[IndexLanguage];
   ItemReports.Caption                     := ndxBarSubItemReports[IndexLanguage];
end;

procedure TFormPrK.dxBarButtonFormStudyClick(Sender: TObject);
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



procedure TFormPrK.dxBarButtonCategoryStudyClick(Sender: TObject);
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

procedure TFormPrK.dxBarButtonFacultySpecGroupClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Database.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;

  AParameter.DontShowGroups := True;

  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
end;

procedure TFormPrK.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,j : integer;
  CountMDIChildForm : integer;
  CountActiveTrans  : integer;
begin
   CountMDIChildForm:=Application.MainForm.MDIChildCount;
   for i := 0 to CountMDIChildForm - 1 do
   begin
     Application.MainForm.MDIChildren[CountMDIChildForm-i-1].Close; // то есть будем начинать закрывать с последней
   end;
   ErrorHandlerPrK.Free;
   ErrorHandlerPrK:=nil;
{   CountActiveTrans := Database.TransactionCount;
   for j := 1 to CountActiveTrans do
    begin
        if Database.Transactions[j-1].Active then
        begin
            try
                Database.Transactions[j-1].Active := false;
            finally
//                showmessage(inttostr(j));
//                Database.Transactions[j].Rollback;
            end;
        end;
    end;
   Database.Close; }
end;

procedure TFormPrK.dxBarButtonPeopleClick(Sender: TObject);
begin
   AllPeopleUnit.GetMan(Self, Database.Handle, false, true);
end;

procedure TFormPrK.dxBarButtonPrKSpRishClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_RISH_TYPE,fsMDIChild) ;
end;

procedure TFormPrK.dxBarButtonPrK_SP_DERG_ZAKAZClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_DERG_ZAKAZ,fsMDIChild);
end;


procedure TFormPrK.dxBarButtonPrK_SP_EXZFORMClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_EXZFORM,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_GURTOGClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_GURTOG,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_POTOKClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_POTOK,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_IN_LANGClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_IN_LANG,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_IS_COPYClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_IS_COPY,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_KAT_PRI_XClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_KAT_PRI_X,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPRK_SP_KAT_PRI_DClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_KAT_PRI_D,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_KURSClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_KURS,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_LEVEL_VLADENClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_LEVEL_VLADEN,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_NPKClick(Sender: TObject);
var
  InputParam :TAArray;
begin
    InputParam :=TAArray.Create;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64    := ID_USER_GLOBAL;
    InputParam['Input']['God_Nabora'].AsInt64        := God_Nabora;
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_NPK,fsMDIChild,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_OLD_PRICHClick(Sender: TObject);
begin
    uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_OLD_PRICH,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PREDM_uClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_PREDM_u,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PREDMClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_PREDM,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PRICHClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_PRICH,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PRIZN_ZACHISLClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_PRIZN_ZACHISL,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_RISH_TYPEClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_RISH_TYPE,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_DOK_OBRClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_DOK_OBR,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_PEREKLClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_PEREKL,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_RAZNClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_RAZN,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_UCHZClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_UCHZ,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_UKR_LANGClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_UKR_LANG,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_VID_DIIClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_VID_DII,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_ZABRClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_ZABR,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_FOB_PROTClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_FOB_PROT,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_GOD_NABORAClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_GOD_NABORA,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_OCENKAClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_OCENKA,fsMDIChild);
end;


procedure TFormPrK.FormShow(Sender: TObject);
var
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PREIMClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_PREIM,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_FORM_OBUCH_KATEGORYClick(
  Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_FORM_OBUCH_KATEGORY,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_VID_DOGClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_VID_DOG,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPRK_SP_MIN_PERELIK_PRIMClick(
  Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_MIN_PERELIK_PRIM,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_MIN_PERELIK_SPECClick(
  Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_MIN_PERELIK_SPEC,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_SROK_OBClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_SROK_OB,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_DOLGNOST_PKClick(Sender: TObject);
begin
  uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_DOLGNOST_PK,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_MIN_PERELIK_SHIFRClick(
  Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_MIN_PERELIK_SHIFR;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_KAT_STUDClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_KAT_STUD,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPrK_SP_ISPIT_VEDOM_TYPEClick(
  Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_ISPIT_VEDOM_TYPE,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonPRK_SP_TYPE_DOP_DOKClick(Sender: TObject);
var
  InputParam :TAArray;
begin
   InputParam :=TAArray.Create;
   // -1 дл€ вызова всех данных существующих в справочнике...
    InputParam['Input']['ID_CN_SP_FORM_STUD'].AsInt64    := -1;
    InputParam['Input']['ID_CN_SP_KAT_STUD'].AsInt64     := -1;
    InputParam['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64   := -1;
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_DOP_DOK,fsMDIChild,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_VUZ_LICENCEClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_VUZ_LICENCE;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PLAN_NABORAClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_PLAN_NABORA;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['ID_SP_GOD_NABORA'].AsInt64     := God_Nabora;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_EKZ_RASPClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_EKZ_RASP;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_CEL_ZAMOVNIKClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_CEL_ZAMOVNIK;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['ID_SP_GOD_NABORA'].AsInt64     := -1;
    InputParam['Input']['ID_CN_SP_FORM_STUD'].AsInt64   := -1;
    InputParam['Input']['ID_CN_SP_KAT_STUD'].AsInt64    := -1;
    InputParam['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64  := -1;
    InputParam['Input']['ID_CN_SP_FAK'].AsInt64         := -1;
    InputParam['Input']['ID_FAK_CENTER'].AsInt64        := -1;

  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_PLAN_CEL_NABORClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_PLAN_CEL_NABOR;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['ID_SP_GOD_NABORA'].AsInt64     := God_Nabora;

  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonuPrK_SP_EDUCORGClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_EDUCORG;
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['ID_PLACE_IN'].AsInt64          := -1;
    InputParam['Input']['ID_TYPE_IN'].AsInt64           := -1;
  uPrK_Loader.ShowVuzLicense(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPRK_SP_PERELIK_ISPITClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_SP_PERELIK_ISPIT.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonSpDepartmentClick(Sender: TObject);
var
    sp: TSprav;
begin
// создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(Database.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
                // с возможностью редактировани€
            FieldValues['AllowEdit'] := True;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TFormPrK.dxBarButtonOptionInterfaseClick(Sender: TObject);
var
    T:TFormOptionInterfase;
begin
    T:=TFormOptionInterfase.Create(self);
    T.ShowModal;
    T.Free;
end;
procedure TFormPrK.dxBarButtonOptionWorkClick(Sender: TObject);
var
    T:TFormOptionWork;
    InputParam :TAArray;
    reg:   TRegistry;
    NameGN : string;
begin
    InputParam :=TAArray.Create;
    InputParam['Input']['GodNabora'].AsInt64      :=God_Nabora;
    InputParam['Input']['NameGodNabora'].AsString :=NameGodNabora;

    T:=TFormOptionWork.Create(self,InputParam);
    if  T.ShowModal= MrOK then
     begin
       God_Nabora   :=T.DataSetGodNabora.FieldValues['ID_SP_GOD_NABORA'];
       NameGN       :=T.DataSetGodNabora.FieldValues['SHORT_NAME'];
       dxBarStaticLabelGodNabora.Caption:=
       ndxBarStaticLabelGodNabora[IndexLanguage]+': '+NameGN;

       reg:=TRegistry.Create;
        try
            reg.RootKey :=HKEY_CURRENT_USER;
            if reg.OpenKey('\Software\PrK\DATA\',true) then
            begin
               reg.WriteString('ID_GOD_NABORA', IntToStr(God_Nabora));
               reg.WriteString('NAME_GOD_NABORA',NameGN);
            end;
         finally
             reg.Free;
         end;  
     end;
    T.Free;


end;



procedure TFormPrK.dxBarButtonAbitClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['Rejim'].AsVariant              := AddPrK;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAbit(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrKAbitViewWithFilterClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_ViewWithFilter.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;


procedure TFormPrK.dxBarButtonCustomersClick(Sender: TObject);
var
   i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelNone;// без возможности выбора контрагента либо договора
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    i.Free;
    o.Free;  
end;

procedure TFormPrK.dxBarButtonPrKEkzVedomClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Ekz_Vedom.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPRK_REK_DO_ZARAHClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_REK_DO_ZARAH.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPRK_SP_SOSTAV_PKClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_SP_SOSTAV_PK.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPRK_SP_FORM_STUD_FOB_PROTClick(
  Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_SP_FORM_STUD_FOB_PROT.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_PROT_ZACHClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_PROT_ZACH.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_ProtDopuskClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_PROT_DOPUSK.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonTempKBClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Kassa_Bank.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['ID_USER'].AsInt64              := ID_USER_GLOBAL;
    InputParam['Input']['Summa'].AsCurrency             := 30;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);

  InputParam.Free;
  InputParam:=Nil;
end;

procedure TFormPrK.SetSelectSQLReportsSubItem(const Value: string);
begin
  FSelectSQLReportsSubItem := Value;
    DataSetReportsSubItem.Active                         :=false;
    DataSetReportsSubItem.Database                       := Database;
    DataSetReportsSubItem.Transaction                    := ReadTransaction;
    DataSetReportsSubItem.SelectSQL.Clear;
    DataSetReportsSubItem.SQLs.SelectSQL.Text            := FSelectSQLReportsSubItem;
    DataSetReportsSubItem.CloseOpen(false);
end;

procedure TFormPrK.SetSelectSQLReportsBtnItem(const Value: string);
begin
  FSelectSQLReportsBtnItem := Value;
    DataSetReportsBtnItem.Active                         :=false;
    DataSetReportsBtnItem.Database                       := Database;
    DataSetReportsBtnItem.Transaction                    := ReadTransaction;
    DataSetReportsBtnItem.SelectSQL.Clear;
    DataSetReportsBtnItem.SQLs.SelectSQL.Text            := FSelectSQLReportsBtnItem;
    DataSetReportsBtnItem.CloseOpen(false);
end;

procedure TFormPrK.ItemReportsCreate;
var
  SubItemNew :TdxBarSubItem ;
  BtnItemNew :TdxBarButton ;
  i :integer;
begin
  SelectSQLReportsSubItem :='Select * from PRK_SP_TYPE_STAT_REPORTS_SELECT';
  SelectSQLReportsBtnItem :='Select * from PRK_SP_STAT_REPORTS_SELECT';

  DataSetReportsSubItem.First;
  while not DataSetReportsSubItem.Eof do
  begin
    with ItemReports.ItemLinks.Add do
    begin
       SubItemNew   :=TdxBarSubItem.Create(self);
       Item         :=SubItemNew;
       Item.Caption :=DataSetReportsSubItem.FBN('short_name').AsString;
       Item.Hint    :=DataSetReportsSubItem.FBN('name').AsString;

       DataSetReportsBtnItem.First;
       while not DataSetReportsBtnItem.Eof do
       begin
          with SubItemNew.ItemLinks.Add do
          begin
              if DataSetReportsBtnItem.FieldValues['id_sp_type_stat_reports']=
                 DataSetReportsSubItem.FieldValues['id_sp_type_stat_reports'] then
              begin
               BtnItemNew   :=TdxBarButton.Create(self);
               Item         :=BtnItemNew;
               Item.Caption :=DataSetReportsBtnItem.FBN('short_name').AsString;
               item.Tag     :=DataSetReportsBtnItem.FBN('id_sp_stat_reports').AsInteger; // может возникнуть ошибка, если сюда запихнуть int64

               item.OnClick :=ReportsBtnItemClick ;
              end;
          end;
          DataSetReportsBtnItem.Next;
       end;
    end;
    DataSetReportsSubItem.Next;
  end;

end;


procedure TFormPrK.ReportsBtnItemClick(Sender: TObject);
var
  InputParam :TAArray;
begin

  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Show_Reports.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['id_sp_stat_reports'].AsInt64   := TdxBarButton(sender).tag;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER'].AsInt64              := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_FiltrClick(Sender: TObject);
var
  InputParam :TAArray;
begin

  if God_Nabora=-1 then
   begin
     ShowMessage(nMsgEmptyGodNabora[IndexLanguage]);
     dxBarButtonOptionWorkClick(Sender);
     exit;
   end;

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Filtr.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
    InputParam['Input']['ID_USER'].AsInt64              := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPrK.dxBarButtonPrK_SP_TYPE_ZACHClick(Sender: TObject);
begin
   uPrK_Loader.ShowPrkSprav(self,Database.Handle,PrK_SP_TYPE_ZACH,fsMDIChild);
end;

procedure TFormPrK.dxBarButtonKAF_DISC_SPECClick(Sender: TObject);
begin
  uPrK_Loader.LoadSimplePackage(Self,Database.Handle,'UO\UO_KafDiscSpec.bpl','View_UO_KafDiscSpec');
end;

procedure TFormPrK.dxBarButtonPRT_UCH_PLANClick(Sender: TObject);
begin
  uPrK_Loader.LoadSimplePackage(Self,Database.Handle,'UO\UO_PrtUchPlan.bpl','View_UO_PrtUchPlan');
end;

end.
