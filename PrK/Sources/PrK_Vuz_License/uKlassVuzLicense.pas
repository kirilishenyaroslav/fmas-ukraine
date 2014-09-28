unit uKlassVuzLicense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt, dxBar,
  dxBarExtItems, ActnList, ImgList,AArray, ibase,uPrK_Resources,ib_externals,
  dxStatusBar;

type
  TFormKlassVuzLicense = class(TForm)
    ImageListVuzLicense: TImageList;
    ActionListVuzLicense: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    StyleRepositoryVuzLicense: TcxStyleRepository;
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
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    dxBarManagerVuzLicense: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    FormStorageVuzLicense: TFormStorage;
    TransactionWritePrKVuzLicense: TpFIBTransaction;
    StoredProcPrKVuzLicense: TpFIBStoredProc;
    DataSetPrKVuzLicense: TpFIBDataSet;
    TransactionReadPrKVuzLicense: TpFIBTransaction;
    DataBasePrKVuzLicense: TpFIBDatabase;
    DataSourcePrKVuzLicense: TDataSource;
    cxGridPrKVuzLicense: TcxGrid;
    cxGridPrKVuzLicenseDBTableView1: TcxGridDBTableView;
    cxGridPrKVuzLicenseLevel1: TcxGridLevel;
    dxStatusBarVL: TdxStatusBar;
    ActionPrint: TAction;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridPrKVuzLicenseDBTableView1DblClick(Sender: TObject);
  private
    FIndLangVL: integer;
    FCheckAccessChange: string;
    FCheckAccessAdd: string;
    FStoredProcDelName: string;
    FStoredProcChangeName: string;
    FCheckAccessDel: string;
    FSelectSQLText: String;
    FID_NAME: string;
    FInicFormCaption: string;
    FStoredProcAddName: string;
    FCheckAccessPrint: string;
    procedure CheckAccess(pObject, pAction: string;aAction: TAction);
    procedure SetCheckAccessAdd(const Value: string);
    procedure SetCheckAccessChange(const Value: string);
    procedure SetCheckAccessDel(const Value: string);
    procedure SetID_NAME(const Value: string);
    procedure SetIndLangVL(const Value: integer);
    procedure SetInicFormCaption(const Value: string);
    procedure SetSelectSQLText(const Value: String);
    procedure SetStoredProcAddName(const Value: string);
    procedure SetStoredProcChangeName(const Value: string);
    procedure SetStoredProcDelName(const Value: string);
    procedure SetCheckAccessPrint(const Value: string);
  public
     ID_SP_GOD_NABORA : Int64;
     ResultArray             :TAArray;
     DBHANDLE                :TISC_DB_HANDLE ;
     TextViewColor           :TColor; // используется для изменения цвета TextEdit'a при просмотре
     procedure InicCaption; virtual;
     procedure InicalisationDataSet;virtual;
     procedure Obnovit(id_obnovit: int64); 
     constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property IndLangVL      :integer read FIndLangVL write SetIndLangVL;
     Property ID_NAME        :string read FID_NAME write SetID_NAME;
     Property SelectSQLText  :String read FSelectSQLText write SetSelectSQLText;
     Property InicFormCaption:string read FInicFormCaption write SetInicFormCaption;
     Property CheckAccessAdd :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange   :string read FCheckAccessChange write SetCheckAccessChange;
     Property CheckAccessPrint    :string read FCheckAccessPrint write SetCheckAccessPrint;
     Property StoredProcAddName   :string read FStoredProcAddName write SetStoredProcAddName;
     Property StoredProcChangeName:string read FStoredProcChangeName write SetStoredProcChangeName;
     Property StoredProcDelName   :string read FStoredProcDelName write SetStoredProcDelName;

  end;

  procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowVuzLicense;

var
  FormKlassVuzLicense: TFormKlassVuzLicense;

implementation
uses
 AccMgmt,uConstants,//rptLoaderUnit,
 uPRK_SP_MIN_PERELIK_SHIFR , uPRK_SP_VUZ_LICENCE,
 uPRK_SP_PLAN_NABORA,        uPRK_SP_EDUCORG,     uPRK_SP_CEL_ZAMOVNIK,
 uPRK_SP_PLAN_CEL_NABOR,     uPRK_SP_EKZ_RASP;
{$R *.dfm}

procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);
var
 T :TFormKlassVuzLicense;
begin
  case TNamePrKVuzLicense(aParam['Input']['aNamePrKVuzLicense'].AsVariant) of
     PrK_SP_MIN_PERELIK_SHIFR    : T:=TFormPRK_SP_MIN_PERELIK_SHIFR.Create(aOwner,aParam);
     PrK_SP_VUZ_LICENCE          : T:=TFormPRK_SP_VUZ_LICENCE.Create(aOwner,aParam);
     PrK_SP_PLAN_NABORA          : T:=TFormPRK_SP_PLAN_NABORA.Create(aOwner,aParam);
     PrK_SP_EDUCORG              : T:=TFormPRK_SP_EDUCORG.Create(aOwner,aParam);
     PrK_SP_CEL_ZAMOVNIK         : T:=TFormPRK_SP_CEL_ZAMOVNIK.Create(aOwner,aParam);
     PrK_SP_PLAN_CEL_NABOR       : T:=TFormPRK_SP_PLAN_CEL_NABOR.Create(aOwner,aParam);
     PrK_SP_EKZ_RASP             : T:=TFormPRK_SP_EKZ_RASP.Create(aOwner,aParam);
  end;

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                  // ShowPrkSprav :=T.ResultArray; //сделать возвращение данных
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

constructor TFormKlassVuzLicense.Create(aOwner: TComponent;aParam :TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangVL     :=SelectLanguage;
      TextViewColor :=cl3DLight;

      if Assigned(PVoid(aParam['Input']['ID_SP_GOD_NABORA'])) then
        begin
          ID_SP_GOD_NABORA:=aParam['Input']['ID_SP_GOD_NABORA'].AsInt64;
        end;

      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color := $00EBC4A4;
          cxStyleInactive.Color           := $00F7EAD9;
       end;
      // ResultArray := @aParam;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormKlassVuzLicense.CheckAccess(pObject, pAction: string;
  aAction: TAction);
begin
   if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

procedure TFormKlassVuzLicense.InicCaption;
begin
    dxBarManagerVuzLicense.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerVuzLicense.Bars[0].ShowMark       :=false;
    dxBarManagerVuzLicense.CanCustomize           :=false;
    dxBarManagerVuzLicense.Bars[0].AllowClose       :=false;
    dxBarManagerVuzLicense.Bars[0].AllowCustomizing    :=false;
    dxBarManagerVuzLicense.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerVuzLicense.Bars[0].AllowReset                :=false;

    TFormKlassVuzLicense(self).Caption     :=InicFormCaption;
    ActionADD.Caption                    :=nAction_Add[IndLangVL];
    ActionChange.Caption                 :=nAction_Change[IndLangVL];
    ActionDEL.Caption                    :=nAction_Del[IndLangVL];
    ActionView.Caption                   :=nAction_View[IndLangVL];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLangVL];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLangVL];
    ActionOtmena.Caption                 :=nAction_Exit[IndLangVL];
    ActionPrint.Caption                  :=nActiontPrint[IndLangVL];


    ActionADD.Hint                       :=nHintAction_Add[IndLangVL];
    ActionChange.Hint                    :=nHintAction_Change[IndLangVL];
    ActionDEL.Hint                       :=nHintAction_Del[IndLangVL];
    ActionView.Hint                      :=nHintAction_View[IndLangVL];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLangVL];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLangVL];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLangVL];
    ActionPrint.Hint                     :=nHintActiontPrint[IndLangVL];

    dxStatusBarVL.Panels[0].Text          :=nStatBarAdd[IndLangVL];
    dxStatusBarVL.Panels[1].Text          :=nStatBarChange[IndLangVL];
    dxStatusBarVL.Panels[2].Text          :=nStatBarDel[IndLangVL];
    dxStatusBarVL.Panels[3].Text          :=nStatBarVibrat[IndLangVL];
    dxStatusBarVL.Panels[4].Text          :=nStatBarObnov[IndLangVL];
    dxStatusBarVL.Panels[5].Text          :=nStatBarExit[IndLangVL];
end;

procedure TFormKlassVuzLicense.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormKlassVuzLicense.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormKlassVuzLicense.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormKlassVuzLicense.SetCheckAccessPrint(const Value: string);
begin
  FCheckAccessPrint := Value;
  CheckAccess(FCheckAccessDel,'Ptint',ActionPrint);
end;

procedure TFormKlassVuzLicense.SetID_NAME(const Value: string);
begin
  FID_NAME := Value;
end;

procedure TFormKlassVuzLicense.SetIndLangVL(const Value: integer);
begin
  FIndLangVL := Value;
end;

procedure TFormKlassVuzLicense.SetInicFormCaption(const Value: string);
begin
  FInicFormCaption := Value;
  InicCaption;
end;

procedure TFormKlassVuzLicense.SetSelectSQLText(const Value: String);
begin
  FSelectSQLText := Value;
  InicalisationDataSet;
end;

procedure TFormKlassVuzLicense.SetStoredProcAddName(const Value: string);
begin
  FStoredProcAddName := Value;
end;

procedure TFormKlassVuzLicense.SetStoredProcChangeName(
  const Value: string);
begin
  FStoredProcChangeName := Value;
end;

procedure TFormKlassVuzLicense.SetStoredProcDelName(const Value: string);
begin
  FStoredProcDelName := Value;
end;

procedure TFormKlassVuzLicense.ActionADDExecute(Sender: TObject);
begin
   //
end;

procedure TFormKlassVuzLicense.ActionChangeExecute(Sender: TObject);
begin
//
end;

procedure TFormKlassVuzLicense.ActionViewExecute(Sender: TObject);
begin
//
end;

procedure TFormKlassVuzLicense.ActionDELExecute(Sender: TObject);
begin
    if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLangVL],nMsgDel[IndLangVL],
                        mtInformation,mbOKCancel,IndLangVL)=mrOK then
         begin
            StoredProcPrKVuzLicense.Transaction.StartTransaction;
            StoredProcPrKVuzLicense.StoredProcName:=StoredProcDelName;
            StoredProcPrKVuzLicense.Prepare;
            StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64:= DataSetPrKVuzLicense.FieldValues[ID_NAME];
            try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
              cxGridPrKVuzLicenseDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
     end;
end;

procedure TFormKlassVuzLicense.ActionVibratExecute(Sender: TObject);
begin
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>NULL then
    begin
      if DataSetPrKVuzLicense.FieldValues[ID_NAME]=-1 then exit;
      FillArrayFromDataSet(ResultArray['Output'],DataSetPrKVuzLicense);
      close;
    end;
end;

procedure TFormKlassVuzLicense.ActionObnovExecute(Sender: TObject);
var
  i:Int64;
begin
     if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>null
      then i:= StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]);
   Obnovit(i);
end;

procedure TFormKlassVuzLicense.Obnovit(id_obnovit: int64);
begin
   DataSetPrKVuzLicense.CloseOpen(false);
   DataSetPrKVuzLicense.Locate(ID_NAME,id_obnovit,[]);
end;

procedure TFormKlassVuzLicense.ActionOtmenaExecute(Sender: TObject);
begin
   Close;
end;

procedure TFormKlassVuzLicense.InicalisationDataSet;
begin
    DataBasePrKVuzLicense.close;
    DataSetPrKVuzLicense.Active                         :=false;
    DataBasePrKVuzLicense.Handle                        :=DBHANDLE;
    DataBasePrKVuzLicense.DefaultTransaction            := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.Database                       := DataBasePrKVuzLicense;
    DataSetPrKVuzLicense.Transaction                    := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.SelectSQL.Clear;
    DataSetPrKVuzLicense.SQLs.SelectSQL.Text            := FSelectSQLText;
    DataSetPrKVuzLicense.CloseOpen(false);
end;

procedure TFormKlassVuzLicense.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormKlassVuzLicense.cxGridPrKVuzLicenseDBTableView1DblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChange.Click;
end;

end.
