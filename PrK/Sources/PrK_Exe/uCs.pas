unit uCs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGraphics,
  cxControls, dxStatusBar, dxBar,inifiles, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxBarExtItems, Menus, dxsbar, pFIBErrorHandler;

type
  TFormCS = class(TForm)
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
    dxBarButtonCsGrantType: TdxBarButton;
    dxBarButtonPrK_SP_OCENKA: TdxBarButton;
    dxBarButtonPrK_SP_PREIM: TdxBarButton;
    dxBarButtonPrK_SP_FORM_OBUCH_KATEGORY: TdxBarButton;
    dxBarButtonPrK_SP_VID_DOG: TdxBarButton;
    dxBarButtonSpDepartment: TdxBarButton;
    ItemService: TdxBarSubItem;
    dxBarButtonOptionInterfase: TdxBarButton;
    dxBarButtonFacultySpecGroup: TdxBarButton;
    dxBarButtonCsOrders: TdxBarButton;
    dxBarButtonPRK_SP_MIN_PERELIK_PRIM: TdxBarButton;
    dxBarButtonPrK_SP_MIN_PERELIK_SPEC: TdxBarButton;
    dxBarButtonPrK_SP_TYPE_KAT_STUD: TdxBarButton;
    dxBarButtonPrK_SP_MIN_PERELIK_SHIFR: TdxBarButton;
    dxBarButtonPrK_SP_VUZ_LICENCE: TdxBarButton;
    dxBarButtonPrK_SP_PLAN_NABORA: TdxBarButton;
    dxBarButtonPrK_SP_SROK_OB: TdxBarButton;
    dxBarButtonCsKont: TdxBarButton;
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
    dxBarButtonCsGrantSize: TdxBarButton;
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
    dxBarButtonCsReports: TdxBarButton;
    dxBarButtonPrK_SP_TYPE_ZACH: TdxBarButton;
    dxBarSubItemSpecSprav: TdxBarSubItem;
    dxBarButtonPUB_SP_MOVA: TdxBarButton;
    dxBarButtonPUB_SP_USPEC: TdxBarButton;
    dxBarButtonPUB_SP_SPEC: TdxBarButton;
    dxBarButtonPUB_JN_FAK_SPEC: TdxBarButton;
    dxBarButtonCsMinGrant: TdxBarButton;
    dxBarButtonCsOrderType: TdxBarButton;
    dxBarButtonCsStreetType: TdxBarButton;
    dxBarButton1: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarButtonPeopleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButtonOptionInterfaseClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
  private
    IndexLanguage     :Integer;
    God_Nabora        :Int64;  // используется при записи в реестр и при передачи параметров
    NameGodNabora     :String; // используется при записи в реестр и при при иницализации
    ID_USER_GLOBAL    :Int64;
    USER_NAME_GLOBAL  :String;
    ID_PEOPLE_GLOBAL  :Int64;
    NAME_PEOPLE_GLOBAL:String;
    FSelectSQLReportsSubItem: string;
    FSelectSQLReportsBtnItem: string;
    procedure InicCaption;
    function ConnectToBase: integer;

  end;

var
  FormCS: TFormCS;

implementation
uses
  cn_Common_Loader,cn_Common_Types,uPwdDecrypt,AllPeopleUnit,
  uCS_Loader,uCS_Resources,registry,uCS_Constants, MDIToolBar,
  uCommonSp,uOptionInterfase,AArray,uOptionWork,AccMgmt,DogLoaderUnit,
  uLoginCS;

{$R *.dfm}

procedure TFormCS.FormCreate(Sender: TObject);
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
  reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\CS\Data\',false) then
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

end;

function TFormCS.ConnectToBase :integer;
var
    reg:TRegistry;
    CurrentID_PCARD: integer;
    CurrentLogin,CurrentPassword: string;
    Error: integer;
    InitResult : TResultInfo;
    T:TFormLoginCS;
begin
  result:=1; // присваем 1 т.к. все хорошо, в случае боков далее присваем 0

  T:=TFormLoginCS.Create(self);
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
			  Dialogs.MessageDlg('Фатальна помилка у системі безпеки : ' +
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
	  	    Dialogs.MessageDlg('Помилка у системі безпеки!',mtError,[mbOk],0);
		  	  ModalResult := mrCancel; // или  MrNone
          result:=0;
          Exit;
  		end
      else
      begin
          Error :=fibCheckPermission('/ROOT/CS', 'Belong');
          if  Error <> 0 then
          begin
              MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('Помилка'), 16);
              ModalResult := mrCancel;
              result:=0;
          end;
      end;
	end;
end;

procedure TFormCS.InicCaption;
begin
   TFormCS(self).Caption    :=nFormCS_Caption[IndexLanguage];
   ItemWork.Caption          :=nItemWork[IndexLanguage];
   ItemSpravochniki.Caption  :=nItemSpravochniki[IndexLanguage];
   ItemService.Caption :=nService[IndexLanguage];

   dxBarButtonCsKont.Caption                 :=ndxBtnKont[IndexLanguage];
   dxBarButtonCsOrders.Caption             :=ndxBtnOrderds[IndexLanguage];
   dxBarButtonCsReports.Caption            :=ndxBtnReports[IndexLanguage];

   dxBarButtonCsGrantSize.Caption          :=ndxBtnGrantSize[IndexLanguage];
   dxBarButtonCsMinGrant.Caption           :=ndxBtnMinGrant[IndexLanguage];
   dxBarButtonCsGrantType.Caption          :=ndxBtnGrantType[IndexLanguage];
   dxBarButtonCsOrderType.Caption          :=ndxBtnOrderType[IndexLanguage];
   dxBarButtonPeople.Caption               :=ndxBtnPeople[IndexLanguage];

   dxBarButtonCsStreetType.Caption         :=ndxBtnStreetType[IndexLanguage];
end;

procedure TFormCS.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFormCS.dxBarButtonPeopleClick(Sender: TObject);
begin
   AllPeopleUnit.GetMan(Self, Database.Handle, false, true);
end;

procedure TFormCS.FormShow(Sender: TObject);
var
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);
end;

procedure TFormCS.dxBarButtonOptionInterfaseClick(Sender: TObject);
var
    T:TFormOptionInterfase;
begin
    T:=TFormOptionInterfase.Create(self);
    T.ShowModal;
    T.Free;
end;
procedure TFormCS.dxBarButton1Click(Sender: TObject);
var
AParameter : TcnSimpleParams;
 is_admin: boolean;
begin
  //признак админ не админ, если админ права не праверять
  is_admin:=False;
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := Database.Handle;
  AParameter.Formstyle := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_SynchEDBO.bpl','ShowSynchEDBO');
  AParameter.Free;

end;

end.
