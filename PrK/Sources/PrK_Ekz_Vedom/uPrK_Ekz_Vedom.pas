unit uPrK_Ekz_Vedom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray,ibase,ib_externals, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ActnList,
  ImgList, dxBar, dxBarExtItems, Placemnt, cxSplitter, cxGroupBox,
  cxContainer, cxMaskEdit, cxLabel, cxDBExtLookupComboBox,
  cxDBLookupComboBox;

type
  TFormPrK_Ekz_Vedom = class(TForm)
    cxGridPrKEkzVedom: TcxGrid;
    cxGridPrKEkzVedomDBTableView1: TcxGridDBTableView;
    cxGridPrKEkzVedomLevel1: TcxGridLevel;
    StyleRepositoryEkzVedom: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    DataBasePrKEkzVedom: TpFIBDatabase;
    TransactionReadPrKEkzVedom: TpFIBTransaction;
    TransactionWritePrKEkzVedom: TpFIBTransaction;
    StoredProcPrKEkzVedom: TpFIBStoredProc;
    DataSetPrKEkzVedom: TpFIBDataSet;
    DataSourcePrKEkzVedom: TDataSource;
    FormStorageVuzLicense: TFormStorage;
    ImageListEkzVedom: TImageList;
    ActionListEkzVedom: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManagerEkzVedom: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    cxGroupBoxAllFilter: TcxGroupBox;
    cxSplitterAllFilter: TcxSplitter;
    colSHIFR: TcxGridDBColumn;
    colEKZ_DATE: TcxGridDBColumn;
    colNAME_PREDM: TcxGridDBColumn;
    colNAME_SPEC: TcxGridDBColumn;
    colNAME_FORM_STUD: TcxGridDBColumn;
    colNAME_KAT_STUD: TcxGridDBColumn;
    colNAME_DERG_ZAKAZ: TcxGridDBColumn;
    cxEditStyleControllerEkzVedom: TcxEditStyleController;
    dxBarLargeButtonDel: TdxBarLargeButton;
    colNAME_FAK: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    TextViewColor           :TColor;
    FCheckAccessAdd: string;
    FCheckAccessDel: string;
    FCheckAccessChange: string;
    FSelectSQLTextEV: string;
    procedure InicCaption;
    procedure CheckAccess(pObject, pAction: string;aAction: TAction);
    procedure SetCheckAccessAdd(const Value: string);
    procedure SetCheckAccessChange(const Value: string);
    procedure SetCheckAccessDel(const Value: string);
    procedure SetSelectSQLTextEV(const Value: string);
  public
    ID_USER_GLOBAL       :Int64;
    ID_GOD_NABORA_GLOBAL :Int64;
    IndLangEV      :integer;
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property CheckAccessAdd :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange :string read FCheckAccessChange write SetCheckAccessChange;
     Property SelectSQLTextEV   :string read FSelectSQLTextEV write SetSelectSQLTextEV;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Ekz_Vedom: TFormPrK_Ekz_Vedom;

implementation
uses
  uPrK_Resources,uConstants,AccMgmt,uPRK_DT_ISPIT_OCENKA,
  uEKZ_VEDOM_ADD;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Ekz_Vedom;
begin
   T:=TFormPrK_Ekz_Vedom.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   //T.ActionVibrat.Enabled:=true;
                   //T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                   //T.ActionVibrat.Enabled:=false;
                   //T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

{ TFormPrK_Ekz_Vedom }

constructor TFormPrK_Ekz_Vedom.Create(aOwner: TComponent; aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangEV     :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerEkzVedom.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Ekz_Vedom.FormCreate(Sender: TObject);
begin

  // будет фильтр по типу как в ViewWithFilter
  SelectSQLTextEV          :='Select * from PRK_DT_ISPIT_VEDOM_SELECT(:ID_SP_GOD_NABORA) where 1=1';

  InicCaption; 
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPrK_Ekz_Vedom.InicCaption;
begin
    dxBarManagerEkzVedom.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerEkzVedom.Bars[0].ShowMark       :=false;
    dxBarManagerEkzVedom.CanCustomize           :=false;
    dxBarManagerEkzVedom.Bars[0].AllowClose       :=false;
    dxBarManagerEkzVedom.Bars[0].AllowCustomizing    :=false;
    dxBarManagerEkzVedom.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerEkzVedom.Bars[0].AllowReset                :=false;

    TFormPrK_Ekz_Vedom(self).Caption     :=nFormPrK_Ekz_Vedom_Caption[IndLangEV];
    ActionADD.Caption                    :=nAction_Add[IndLangEV];
    ActionChange.Caption                 :=nAction_Change[IndLangEV];
    ActionDEL.Caption                    :=nAction_Del[IndLangEV];
    ActionView.Caption                   :=nAction_View[IndLangEV];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLangEV];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLangEV];
    ActionOtmena.Caption                 :=nAction_Exit[IndLangEV];

    ActionADD.Hint                       :=nHintAction_Add[IndLangEV];
    ActionChange.Hint                    :=nHintAction_Change[IndLangEV];
    ActionDEL.Hint                       :=nHintAction_Del[IndLangEV];
    ActionView.Hint                      :=nHintAction_View[IndLangEV];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLangEV];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLangEV];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLangEV];

    cxGroupBoxAllFilter.Caption            :=ncxGroupBoxFilter[IndLangEV];

    colSHIFR.Caption                     :=ncolSHIFR[IndLangEV];
    colEKZ_DATE.Caption                  :=ncolEKZ_DATE[IndLangEV];
    colNAME_PREDM.Caption                :=ncolPREDM[IndLangEV];
    colNAME_FAK.Caption                  :=ncolNAME_FAK[IndLangEV];
    colNAME_SPEC.Caption                 :=ncolNAME_SPEC[IndLangEV];
    colNAME_FORM_STUD.Caption            :=ncolSHORT_NAME_CN_FORM_STUD[IndLangEV];
    colNAME_KAT_STUD.Caption             :=ncolSHORT_NAME_CN_KAT_STUD[IndLangEV];
    colNAME_DERG_ZAKAZ.Caption           :=ncolDERG_ZAKAZ[IndLangEV];
end;

procedure TFormPrK_Ekz_Vedom.CheckAccess(pObject, pAction: string;
  aAction: TAction);
begin
  if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

procedure TFormPrK_Ekz_Vedom.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormPrK_Ekz_Vedom.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormPrK_Ekz_Vedom.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormPrK_Ekz_Vedom.SetSelectSQLTextEV(const Value: string);
begin
  FSelectSQLTextEV := Value;
  DataBasePrKEkzVedom.close;
    DataSetPrKEkzVedom.Active                         :=false;
    DataBasePrKEkzVedom.Handle                        :=DBHANDLE;
    DataBasePrKEkzVedom.DefaultTransaction            := TransactionReadPrKEkzVedom;
    DataSetPrKEkzVedom.Database                       := DataBasePrKEkzVedom;
    DataSetPrKEkzVedom.Transaction                    := TransactionReadPrKEkzVedom;
    DataSetPrKEkzVedom.SelectSQL.Clear;
    DataSetPrKEkzVedom.SQLs.SelectSQL.Text            := FSelectSQLTextEV;
    DataSetPrKEkzVedom.ParamByName('ID_SP_GOD_NABORA').AsInt64:=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetPrKEkzVedom.CloseOpen(false);
end;

procedure TFormPrK_Ekz_Vedom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_Ekz_Vedom.ActionChangeExecute(Sender: TObject);
var
   DataEVChange :TAArray;
   T:TFormPRK_DT_ISPIT_OCENKA;
begin
   if DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM']=Null
    then exit;
   DataEVChange :=TAArray.Create;
   DataEVChange['input']['ID_DT_ISPIT_VEDOM'].AsInt64  :=DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
   DataEVChange['Input']['Rejim'].AsVariant            :=ChangePrk;

   T := TFormPRK_DT_ISPIT_OCENKA.Create(self,DataEVChange);
   T.ShowModal;
   T.Free;

   DataEVChange.Free;
   DataEVChange:=Nil;
   ActionObnovExecute(sender);
end;

procedure TFormPrK_Ekz_Vedom.ActionDELExecute(Sender: TObject);
var
   DataEVDel :TAArray;
   T:TFormPRK_DT_ISPIT_OCENKA;
begin
   if DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM']=Null
    then exit;
   DataEVDel :=TAArray.Create;
   DataEVDel['input']['ID_DT_ISPIT_VEDOM'].AsInt64  :=DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
   DataEVDel['Input']['Rejim'].AsVariant            :=DelPrk;

   T := TFormPRK_DT_ISPIT_OCENKA.Create(self,DataEVDel);
   T.ShowModal;
   T.Free;

   DataEVDel.Free;
   DataEVDel:=Nil;

   ActionObnovExecute(sender);
end;

procedure TFormPrK_Ekz_Vedom.ActionViewExecute(Sender: TObject);
var
   DataEVView :TAArray;
   T:TFormPRK_DT_ISPIT_OCENKA;
begin
   if DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM']=Null
    then exit;
   DataEVView :=TAArray.Create;
   DataEVView['input']['ID_DT_ISPIT_VEDOM'].AsInt64  :=DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
   DataEVView['Input']['Rejim'].AsVariant            :=ViewPrK;

   T := TFormPRK_DT_ISPIT_OCENKA.Create(self,DataEVView);
   T.ShowModal;
   T.Free;

   DataEVView.Free;
   DataEVView:=Nil;
end;

procedure TFormPrK_Ekz_Vedom.ActionADDExecute(Sender: TObject);
var
  T:TFormEKZ_VEDOM_ADD;
  id_Locate : int64;
begin
    id_Locate:=-1;
    T:=TFormEKZ_VEDOM_ADD.Create(self);
    if T.ShowModal=MrOk
     then id_Locate:=T.ID_DT_ISPIT_VEDOM_OUT;
    T.Free;

    if id_Locate>0 then
     begin
      DataSetPrKEkzVedom.CloseOpen(false);
      DataSetPrKEkzVedom.Locate('ID_DT_ISPIT_VEDOM',id_Locate,[]);
     end; 
end;

procedure TFormPrK_Ekz_Vedom.ActionObnovExecute(Sender: TObject);
var
  id_Locate : int64;
begin
  if DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM']<>Null
   then id_Locate:= DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
  DataSetPrKEkzVedom.CloseOpen(false);
  DataSetPrKEkzVedom.Locate('ID_DT_ISPIT_VEDOM',id_Locate,[]);
end;

procedure TFormPrK_Ekz_Vedom.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

end.
