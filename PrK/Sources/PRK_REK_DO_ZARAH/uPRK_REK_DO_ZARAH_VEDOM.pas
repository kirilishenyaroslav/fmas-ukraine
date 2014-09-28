unit uPRK_REK_DO_ZARAH_VEDOM;

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
  cxDBLookupComboBox, cxCheckBox;

type
  TFormPrK_Rek_Do_Zarah_Vedom = class(TForm)
    MainGrid: TcxGrid;
    MainGridDBTableView1: TcxGridDBTableView;
    MainGridLevel1: TcxGridLevel;
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
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSet1: TpFIBDataSet;
    DSource1: TDataSource;
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
    cxEditStyleControllerEkzVedom: TcxEditStyleController;
    dxBarLargeButtonDel: TdxBarLargeButton;
    cmnSHORT_NAME_FAK: TcxGridDBColumn;
    cmnSHORT_NAME_SPEC: TcxGridDBColumn;
    cmnSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    cmnSHORT_NAME_DERG_ZAKAZ: TcxGridDBColumn;
    cmnSHORT_NAME_KAT_STUD: TcxGridDBColumn;
    cmnSHORT_NAME_POTOK: TcxGridDBColumn;
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
    constructor Create(aOwner: TComponent;aParam :TAArray);reintroduce;
     Property CheckAccessAdd :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange :string read FCheckAccessChange write SetCheckAccessChange;
     Property SelectSQLTextEV   :string read FSelectSQLTextEV write SetSelectSQLTextEV;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Rek_Do_Zarah_Vedom: TFormPrK_Rek_Do_Zarah_Vedom;

implementation
uses
  uPrK_Resources,uConstants,AccMgmt, uPRK_REK_DO_ZARAH;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Rek_Do_Zarah_Vedom;
begin
   T:=TFormPrK_Rek_Do_Zarah_Vedom.Create(aOwner,aParam);

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

constructor TFormPrK_Rek_Do_Zarah_Vedom.Create(aOwner: TComponent; aParam: TAArray);
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

procedure TFormPrK_Rek_Do_Zarah_Vedom.FormCreate(Sender: TObject);
begin

  // будет фильтр по типу как в ViewWithFilter
  SelectSQLTextEV          :='Select * from PRK_REK_DO_ZARAH_LIST_SEL(:ID_SP_GOD_NABORA) where 1=1';

  InicCaption; 
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.InicCaption;
begin
    dxBarManagerEkzVedom.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerEkzVedom.Bars[0].ShowMark       :=false;
    dxBarManagerEkzVedom.CanCustomize           :=false;
    dxBarManagerEkzVedom.Bars[0].AllowClose       :=false;
    dxBarManagerEkzVedom.Bars[0].AllowCustomizing    :=false;
    dxBarManagerEkzVedom.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerEkzVedom.Bars[0].AllowReset                :=false;

    TFormPrK_Rek_Do_Zarah_Vedom(self).Caption     :=nFormPRK_REK_DO_ZARAH_Caption[IndLangEV];
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

    cmnSHORT_NAME_FAK.Caption := ncolNAME_FAK[IndLangEV];
    cmnSHORT_NAME_SPEC.Caption := ncolNAME_SPEC[IndLangEV];
    cmnSHORT_NAME_FORM_STUD.Caption := ncolSHORT_NAME_CN_FORM_STUD[IndLangEV];
    cmnSHORT_NAME_DERG_ZAKAZ.Caption := ncolDERG_ZAKAZ[IndLangEV];
    cmnSHORT_NAME_KAT_STUD.Caption := ncolSHORT_NAME_CN_KAT_STUD[IndLangEV];
    cmnSHORT_NAME_POTOK.Caption := ncolPOTOK[IndLangEV];

    {    colSHIFR.Caption                     :=ncolSHIFR[IndLangEV];
    colEKZ_DATE.Caption                  :=ncolEKZ_DATE[IndLangEV];
    colNAME_PREDM.Caption                :=ncolPREDM[IndLangEV];
    colNAME_SPEC.Caption                 :=ncolNAME_SPEC[IndLangEV];
    colNAME_FORM_STUD.Caption            :=ncolSHORT_NAME_CN_FORM_STUD[IndLangEV];
    colNAME_KAT_STUD.Caption             :=ncolSHORT_NAME_CN_KAT_STUD[IndLangEV];
    colNAME_DERG_ZAKAZ.Caption           :=ncolDERG_ZAKAZ[IndLangEV];
}end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.CheckAccess(pObject, pAction: string;
  aAction: TAction);
begin
  if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.SetSelectSQLTextEV(const Value: string);
begin
  FSelectSQLTextEV := Value;
  DB.close;
    DSet1.Active                         :=false;
    DB.Handle                        :=DBHANDLE;
    DB.DefaultTransaction            := ReadTransaction;
    DSet1.Database                       := DB;
    DSet1.Transaction                    := ReadTransaction;
    DSet1.SelectSQL.Clear;
    DSet1.SQLs.SelectSQL.Text            := FSelectSQLTextEV;
    DSet1.ParamByName('ID_SP_GOD_NABORA').AsInt64:=ResultArray['Input']['GodNabora'].AsInt64;
    DSet1.CloseOpen(false);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionChangeExecute(Sender: TObject);
var ViewForm:TFormPRK_REK_DO_ZARAH;
  AParamArray:TAArray;
begin
    if VarIsNull(DSet1['ID_CN_SP_FAK']) then Exit;

    AParamArray:=TAArray.Create;
    AParamArray['Input']['aDBHANDLE'].AsInteger         := Integer(DB.Handle);
    AParamArray['Input']['GodNabora'].AsInt64           := ID_GOD_NABORA_GLOBAL;
    AParamArray['Input']['ID_USER_GLOBAL'].AsInt64      := ID_USER_GLOBAL;
    AParamArray['Input']['AMode'].AsVariant             := ChangePrK;

{    ShowMessage(DSet1['ID_CN_SP_FAK']);
    ShowMessage(DSet1['ID_CN_JN_FACUL_SPEC']);
    ShowMessage(DSet1['ID_CN_SP_FORM_STUD']);
    ShowMessage(DSet1['ID_CN_SP_KAT_STUD']);
    ShowMessage(DSet1['ID_SP_DERG_ZAKAZ']);
    ShowMessage(DSet1['ID_SP_POTOK']);
}

    AParamArray['Input']['ID_CN_SP_FAK'].AsInt64        := DSet1['ID_CN_SP_FAK'];
    AParamArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64 := DSet1['ID_CN_JN_FACUL_SPEC'];
    AParamArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64  := DSet1['ID_CN_SP_FORM_STUD'];
    AParamArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64   := DSet1['ID_CN_SP_KAT_STUD'];
    AParamArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64    := DSet1['ID_SP_DERG_ZAKAZ'];
    AParamArray['Input']['ID_SP_POTOK'].AsInt64         := DSet1['ID_SP_POTOK'];

    ViewForm:=TFormPRK_REK_DO_ZARAH.Create(Self,AParamArray);
    ViewForm.ShowModal;
    ViewForm.Free;
    ActionObnovExecute(Self);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionDELExecute(Sender: TObject);
{var
   DataEVDel :TAArray;
   T:TFormPRK_DT_ISPIT_OCENKA;}
begin
  if VarIsNull(DSet1['ID_CN_SP_FAK']) then Exit;

  if prkMessageDlg(nMsgBoxTitle[IndLangEV],nMsgDel[IndLangEV]+'?',mtConfirmation,[mbYes,mbNo],IndLangEV)<>mrYes then Exit;

  StoredProc.StoredProcName:='PRK_REK_DO_ZARAH_DEL';
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;

    StoredProc.ParamByName('ID_SP_GOD_NABORA').AsInt64    := ID_GOD_NABORA_GLOBAL;
    StoredProc.ParamByName('ID_CN_SP_FAK').AsInt64        := DSet1['ID_CN_SP_FAK'];
    StoredProc.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64 := DSet1['ID_CN_JN_FACUL_SPEC'];
    StoredProc.ParamByName('ID_CN_SP_FORM_STUD').AsInt64  := DSet1['ID_CN_SP_FORM_STUD'];
    StoredProc.ParamByName('ID_CN_SP_KAT_STUD').AsInt64   := DSet1['ID_CN_SP_KAT_STUD'];
    StoredProc.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64    := DSet1['ID_SP_DERG_ZAKAZ'];
    StoredProc.ParamByName('ID_SP_POTOK').AsInt64         := DSet1['ID_SP_POTOK'];

    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except
    on E:Exception do
      begin
        StoredProc.Transaction.Rollback;
        prkMessageDlg(nError[IndLangEV],E.Message,mtError,[mbOk],IndLangEV);
      end;
  end;

  ActionObnovExecute(Self);

{   if DSet1.FieldValues['ID_DT_ISPIT_VEDOM']=Null
    then exit;
   DataEVDel :=TAArray.Create;
   DataEVDel['input']['ID_DT_ISPIT_VEDOM'].AsInt64  :=DSet1.FieldValues['ID_DT_ISPIT_VEDOM'];
   DataEVDel['Input']['Rejim'].AsVariant            :=DelPrk;

   T := TFormPRK_DT_ISPIT_OCENKA.Create(self,DataEVDel);
   T.ShowModal;
   T.Free;

   DataEVDel.Free;
   DataEVDel:=Nil;

   ActionObnovExecute(sender);}
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionViewExecute(Sender: TObject);
var ViewForm:TFormPRK_REK_DO_ZARAH;
  AParamArray:TAArray;
begin
    if VarIsNull(DSet1['ID_CN_SP_FAK']) then Exit;

    AParamArray:=TAArray.Create;
    AParamArray['Input']['aDBHANDLE'].AsInteger         := Integer(DB.Handle);
    AParamArray['Input']['GodNabora'].AsInt64           := ID_GOD_NABORA_GLOBAL;
    AParamArray['Input']['ID_USER_GLOBAL'].AsInt64      := ID_USER_GLOBAL;
    AParamArray['Input']['AMode'].AsVariant             := ViewPrK;

{    ShowMessage(DSet1['ID_CN_SP_FAK']);
    ShowMessage(DSet1['ID_CN_JN_FACUL_SPEC']);
    ShowMessage(DSet1['ID_CN_SP_FORM_STUD']);
    ShowMessage(DSet1['ID_CN_SP_KAT_STUD']);
    ShowMessage(DSet1['ID_SP_DERG_ZAKAZ']);
    ShowMessage(DSet1['ID_SP_POTOK']);
}

    AParamArray['Input']['ID_CN_SP_FAK'].AsInt64        := DSet1['ID_CN_SP_FAK'];
    AParamArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64 := DSet1['ID_CN_JN_FACUL_SPEC'];
    AParamArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64  := DSet1['ID_CN_SP_FORM_STUD'];
    AParamArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64   := DSet1['ID_CN_SP_KAT_STUD'];
    AParamArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64    := DSet1['ID_SP_DERG_ZAKAZ'];
    AParamArray['Input']['ID_SP_POTOK'].AsInt64         := DSet1['ID_SP_POTOK'];

    ViewForm:=TFormPRK_REK_DO_ZARAH.Create(Self,AParamArray);
    ViewForm.ShowModal;
    ViewForm.Free;
    ActionObnovExecute(Self);
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionADDExecute(Sender: TObject);
var ViewForm:TFormPRK_REK_DO_ZARAH;
  AParamArray:TAArray;
{var
  T:TFormEKZ_VEDOM_ADD;
  id_Locate : int64;}
begin
    AParamArray:=TAArray.Create;
    AParamArray['Input']['aDBHANDLE'].AsInteger         := Integer(DB.Handle);
    AParamArray['Input']['GodNabora'].AsInt64           := ID_GOD_NABORA_GLOBAL;
    AParamArray['Input']['ID_USER_GLOBAL'].AsInt64      := ID_USER_GLOBAL;
    AParamArray['Input']['AMode'].AsVariant             := AddPrK;
    ViewForm:=TFormPRK_REK_DO_ZARAH.Create(Self,AParamArray);
    ViewForm.ShowModal;
    ViewForm.Free;
    ActionObnovExecute(Self);
{    AParamArray['Input']['ID_CN_SP_FAK'].AsInt64        := DSet1.ParamByName('ID_CN_SP_FAK').AsInt64;
    AParamArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64 := DSet1.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64;
    AParamArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64  := DSet1.ParamByName('ID_CN_SP_FORM_STUD').AsInt64;
    AParamArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64   := DSet1.ParamByName('ID_CN_SP_KAT_STUD').AsInt64;
    AParamArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64    := DSet1.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64;
    AParamArray['Input']['ID_SP_POTOK'].AsInt64         := DSet1.ParamByName('ID_SP_POTOK').AsInt64;
}
{    id_Locate:=-1;
    T:=TFormEKZ_VEDOM_ADD.Create(self);
    if T.ShowModal=MrOk
     then id_Locate:=T.ID_DT_ISPIT_VEDOM_OUT;
    T.Free;

    if id_Locate>0 then
     begin
      DSet1.CloseOpen(false);
      DSet1.Locate('ID_DT_ISPIT_VEDOM',id_Locate,[]);
     end; 
}end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionObnovExecute(Sender: TObject);
var pA:TAArray;
begin
  pA:=TAArray.Create;
  pA['ID_CN_SP_FAK'].AsInt64        := DSet1['ID_CN_SP_FAK'];
  pA['ID_CN_JN_FACUL_SPEC'].AsInt64 := DSet1['ID_CN_JN_FACUL_SPEC'];
  pA['ID_CN_SP_FORM_STUD'].AsInt64  := DSet1['ID_CN_SP_FORM_STUD'];
  pA['ID_CN_SP_KAT_STUD'].AsInt64   := DSet1['ID_CN_SP_KAT_STUD'];
  pA['ID_SP_DERG_ZAKAZ'].AsInt64    := DSet1['ID_SP_DERG_ZAKAZ'];
  pA['ID_SP_POTOK'].AsInt64         := DSet1['ID_SP_POTOK'];
  DSet1.CloseOpen(false);
  DSet1.Locate('ID_CN_SP_FAK;ID_CN_JN_FACUL_SPEC;ID_CN_SP_FORM_STUD;ID_CN_SP_KAT_STUD;ID_SP_DERG_ZAKAZ;ID_SP_POTOK',
               VarArrayOf([pA['ID_CN_SP_FAK'].AsInt64,pA['ID_CN_JN_FACUL_SPEC'].AsInt64,pA['ID_CN_SP_FORM_STUD'].AsInt64,pA['ID_CN_SP_KAT_STUD'].AsInt64,pA['ID_SP_DERG_ZAKAZ'].AsInt64,pA['ID_SP_POTOK'].AsInt64]),[]);
  pA.Free;
end;

procedure TFormPrK_Rek_Do_Zarah_Vedom.ActionOtmenaExecute(Sender: TObject);
begin
   Close;
end;

end.
