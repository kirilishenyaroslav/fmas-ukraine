unit uPrKKlassSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, cxStyles, dxBar, dxBarExtItems, cxGraphics,
  cxControls, dxStatusBar, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,Ibase,uPrK_Resources,AArray, pFIBErrorHandler;

type
  TFormPrKKlassSprav = class(TForm)
    StyleRepository: TcxStyleRepository;
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
    ActionListKlassSprav: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ImageList: TImageList;
    dxStatusBar1: TdxStatusBar;
    DataBasePrKSprav: TpFIBDatabase;
    DataSetPrKSprav: TpFIBDataSet;
    TransactionReadPrKSprav: TpFIBTransaction;
    TransactionWritePrKSprav: TpFIBTransaction;
    StoredProcPrKSprav: TpFIBStoredProc;
    DataSourcePrKSprav: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    ActionPrint: TAction;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    dxBarLargeButtonOld: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
              // возможно нужно это в private описать
    procedure InicalisationDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject); overload;
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject); // возможно нужно это в private описать
    procedure Obnovit(id_obnovit: int64); 
    procedure DataSetPrKSpravAfterOpen(DataSet: TDataSet);
  private
    Layout   :array[0.. KL_NAMELENGTH] of char;
    DBHANDLE             :TISC_DB_HANDLE;
    FSelectSQLText       :String;
    FCheckAccessDel      :string;
    FCheckAccessAdd      :string;
    FCheckAccessChange   :string;
    FID_NAME             :string;
    FStoredProcChangeName:string;
    FStoredProcAddName   :string;
    FStoredProcDelName   :string;
    FIndexLanguage: integer;
    FInicFormCaption: string;
    FShowNpp: boolean;
    FShowShortName: boolean;
    FNamePrKSpravEdit: TNamePrKSpravEdit;
    FCaptionEditForm: string;
    procedure SetSelectSQLText(const Value: String);
    procedure CheckAccess(pObject, pAction: string;aAction: TAction);
    procedure SetCheckAccessAdd(const Value: string);
    procedure SetCheckAccessChange(const Value: string);
    procedure SetCheckAccessDel(const Value: string);
    procedure SetID_NAME(const Value: string);
    procedure SetStoredProcAddName(const Value: string);
    procedure SetStoredProcChangeName(const Value: string);
    procedure SetStoredProcDelName(const Value: string);
    procedure SetIndexLanguage(const Value: integer);
    procedure SetInicFormCaption(const Value: string);
    procedure SetShowNpp(const Value: boolean);
    procedure SetShowShortName(const Value: boolean);
    procedure SetNamePrKSpravEdit(const Value: TNamePrKSpravEdit);
    procedure SetCaptionEditForm(const Value: string);
  public
     ResultArray             :Variant;
     AllDataKods             :Variant;
     AllDataNpps             :Variant;
     TextViewColor           :TColor; // используется для изменения цвета TextEdit'a при просмотре
     ParamSprav              :TAArray;
     procedure InicCaption; virtual;
     procedure StoredAddPar;virtual;
     constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNamePrKSprav: TNamePrKSprav; aParam: TAArray);overload;
     Property IndexLanguage  :integer read FIndexLanguage write SetIndexLanguage;
     Property ID_NAME        :string read FID_NAME write SetID_NAME;
     Property SelectSQLText  :String read FSelectSQLText write SetSelectSQLText;
     Property ShowNpp        :boolean read FShowNpp write SetShowNpp;
//*****
     Property ShowShortName  :boolean read FShowShortName write SetShowShortName;
//*****
     Property InicFormCaption:string read FInicFormCaption write SetInicFormCaption;
     Property CheckAccessAdd :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange   :string read FCheckAccessChange write SetCheckAccessChange;
     Property StoredProcAddName   :string read FStoredProcAddName write SetStoredProcAddName;
     Property StoredProcChangeName:string read FStoredProcChangeName write SetStoredProcChangeName;
     Property StoredProcDelName   :string read FStoredProcDelName write SetStoredProcDelName;

     Property NamePrKSpravEdit    :TNamePrKSpravEdit read FNamePrKSpravEdit write SetNamePrKSpravEdit;
     Property CaptionEditForm :string read FCaptionEditForm write SetCaptionEditForm;
  end;

  function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;stdcall;
  exports  ShowPrkSprav;

var
  FormPrKKlassSprav: TFormPrKKlassSprav;

implementation
uses
 AccMgmt,uConstants,uPrKKlassSpravEdit,uPrKSpravEditStandart,
 uPRK_SP_DERG_ZAKAZ,  uPRK_SP_EXZFORM,       uPRK_SP_GURTOG,        uPRK_SP_IN_LANG,
 uPRK_SP_IS_COPY,     uPRK_SP_KAT_PRI_X,     uPRK_SP_KURS,          uPRK_SP_LEVEL_VLADEN,
 uPRK_SP_MOVA,        uPRK_SP_NPK,           uPRK_SP_OLD_PRICH,     uPRK_SP_PREDM,
 uPRK_SP_PRICH,       uPRK_SP_PRIZN_ZACHISL, uPRK_SP_RISH,          uPRK_SP_TYPE_DOK_OBR,
 uPRK_SP_TYPE_PEREKL, uPRK_SP_TYPE_RAZN,     uPRK_SP_TYPE_UCHZ,     uPRK_SP_UKR_LANG,
 uPRK_SP_VID_DII,     uPRK_SP_ZABR,
 uPRK_SP_FOB_PROT,    uPRK_SP_GOD_NABORA,    uPRK_SP_OCENKA,        uPRK_SP_PREIM,
 uPRK_SP_FORM_OBUCH_KATEGORY,                uPRK_SP_VID_DOG,       uPRK_SP_MIN_PERELIK_PRIM,
 uPRK_SP_MIN_PERELIK_SPEC,                   uPRK_SP_TYPE_KAT_STUD, uPRK_SP_SROK_OB,
 uPrK_SP_PREDM_u,     uPRK_SP_POTOK,         uPRK_SP_TYPE_DOP_DOK,  uPRK_SP_ISPIT_VEDOM_TYPE,
 uPRK_SP_DOLGNOST_PK, uPRK_SP_KAT_PRI_D,     uPRK_SP_TYPE_ZACH;

{$R *.dfm}

function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
   aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
var
   T: TFormPrKKlassSprav;
begin
   case aNamePrKSprav of
     PrK_SP_DERG_ZAKAZ          : T:=TFormPRK_SP_DERG_ZAKAZ.Create          (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_EXZFORM             : T:=TFormPRK_SP_EXZFORM.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_FOB_PROT            : T:=TFormPRK_SP_FOB_PROT.Create            (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_FORM_OBUCH_KATEGORY : T:=TFormPRK_SP_FORM_OBUCH_KATEGORY.Create (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_GOD_NABORA          : T:=TFormPRK_SP_GOD_NABORA.Create          (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_GURTOG              : T:=TFormPRK_SP_GURTOG.Create              (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_IN_LANG             : T:=TFormPRK_SP_IN_LANG.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_IS_COPY             : T:=TFormPRK_SP_IS_COPY.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_KAT_PRI_X           : T:=TFormPRK_SP_KAT_PRI_X.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_KURS                : T:=TFormPRK_SP_KURS.Create                (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_LEVEL_VLADEN        : T:=TFormPRK_SP_LEVEL_VLADEN.Create        (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_MOVA                : T:=TFormPRK_SP_MOVA.Create                (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_NPK                 : T:=TFormPRK_SP_NPK.Create                 (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_OCENKA              : T:=TFormPRK_SP_OCENKA.Create              (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_OLD_PRICH           : T:=TFormPRK_SP_OLD_PRICH.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_PREDM_u             : T:=TFormPrK_SP_PREDM_u.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_PREDM               : T:=TFormPRK_SP_PREDM.Create               (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_PRICH               : T:=TFormPRK_SP_PRICH.Create               (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_PRIZN_ZACHISL       : T:=TFormPRK_SP_PRIZN_ZACHISL.Create       (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_RISH_TYPE           : T:=TFormPRK_SP_RISH.Create                (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_DOK_OBR        : T:=TFormPRK_SP_TYPE_DOK_OBR.Create        (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_PEREKL         : T:=TFormPRK_SP_TYPE_PEREKL.Create         (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_RAZN           : T:=TFormPRK_SP_TYPE_RAZN.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_UCHZ           : T:=TFormPRK_SP_TYPE_UCHZ.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_UKR_LANG            : T:=TFormPRK_SP_UKR_LANG.Create            (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_VID_DII             : T:=TFormPRK_SP_VID_DII.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_ZABR                : T:=TFormPRK_SP_ZABR.Create                (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_VID_DOG             : T:=TFormPRK_SP_VID_DOG.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_PREIM               : T:=TFormPRK_SP_PREIM.Create               (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_MIN_PERELIK_PRIM    : T:=TFormPRK_SP_MIN_PERELIK_PRIM.Create    (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_MIN_PERELIK_SPEC    : T:=TFormPRK_SP_MIN_PERELIK_SPEC.Create    (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_KAT_STUD       : T:=TFormPRK_SP_TYPE_KAT_STUD.Create       (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_SROK_OB             : T:=TFormPRK_SP_SROK_OB.Create             (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PRK_SP_POTOK               : T:=TFormPRK_SP_POTOK.Create               (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_ISPIT_VEDOM_TYPE    : T:=TFormPRK_SP_ISPIT_VEDOM_TYPE.Create    (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_DOP_DOK        : T:=TFormPRK_SP_TYPE_DOP_DOK.Create        (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_DOLGNOST_PK         : T:=TFormPRK_SP_DOLGNOST_PK.Create         (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_KAT_PRI_D           : T:=TFormPRK_SP_KAT_PRI_D.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
     PrK_SP_TYPE_ZACH           : T:=TFormPRK_SP_TYPE_ZACH.Create           (aOwner,aDBHANDLE,aNamePrKSprav,aParam);
   end;

   T.FormStyle:=aFrmStyle;
   case aFrmStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                   ShowPrkSprav :=T.ResultArray; //сделать возвращение данных
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        //вывести сообщение об ошибке и проверить метод Free сработает(Проверил - Срабатывает)
        T.Free;
   end;


end;


procedure TFormPrKKlassSprav.CheckAccess(pObject, pAction: string;aAction: TAction);
begin
   if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

constructor TFormPrKKlassSprav.Create(aOwner: TComponent;
  aDBHANDLE: TISC_DB_HANDLE; aNamePrKSprav: TNamePrKSprav; aParam: TAArray);
begin
   ShowShortName := true;
   if Assigned(aDBHANDLE) then
   begin
      DBHANDLE      :=aDBHANDLE;
      IndexLanguage :=SelectLanguage;
      ParamSprav    :=aParam;
      TextViewColor :=cl3DLight;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color := $00EBC4A4;
          cxStyleInactive.Color           := $00F7EAD9;
       end;
   end;
end;

procedure TFormPrKKlassSprav.FormShow(Sender: TObject);
begin
                                        {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
end;

{ вызывается при иниц. SelectSQLText }
procedure TFormPrKKlassSprav.InicalisationDataSet;
begin
    DataBasePrKSprav.close;
    DataSetPrKSprav.Active                         := false;
    DataBasePrKSprav.Handle                        := DBHANDLE;
    DataBasePrKSprav.DefaultTransaction            := TransactionReadPrKSprav;
    DataSetPrKSprav.Database                       := DataBasePrKSprav;
    DataSetPrKSprav.Transaction                    := TransactionReadPrKSprav;
    DataSetPrKSprav.SelectSQL.Clear;
    DataSetPrKSprav.SQLs.SelectSQL.Text            := FSelectSQLText;
    DataSetPrKSprav.CloseOpen(false);

    ResultArray:=null;
end;

procedure TFormPrKKlassSprav.DataSetPrKSpravAfterOpen(DataSet: TDataSet);
var
   i,razmer: integer;
begin
   AllDataKods:=Null;
   AllDataNpps:=Null;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
    begin
      DataSetPrKSprav.FetchAll;  // Возвращает все записи с сервера на клиент, если без него то DataSetTipReestr.RecordCount вернет 1
      razmer :=DataSetPrKSprav.RecordCount;
      AllDataKods :=VarArrayCreate([0,razmer-1], varInteger);
      AllDataNpps :=VarArrayCreate([0,razmer-1], varInteger);
      i:=0;
      DataSetPrKSprav.First;
        while not DataSetPrKSprav.Eof do
        begin
            AllDataKods[i]:=StrToInt(DataSetPrKSprav.FieldValues['KOD']);
            AllDataNpps[i]:=StrToInt(DataSetPrKSprav.FieldValues['NPP']);
            DataSetPrKSprav.Next;
            i:=i+1;
        end;
      DataSetPrKSprav.First;
    end;
end;

{ вызывается при иниц. Caption формы}

procedure TFormPrKKlassSprav.InicCaption;
begin
    dxBarManager1.Bars[0].BorderStyle    :=bbsNone;
    dxBarManager1.Bars[0].ShowMark       :=false;
    dxBarManager1.CanCustomize           :=false;
    dxBarManager1.Bars[0].AllowClose       :=false;
    dxBarManager1.Bars[0].AllowCustomizing    :=false;
    dxBarManager1.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManager1.Bars[0].AllowReset                :=false;
    dxBarManager1.Bars[0].MultiLine                    :=True;

    TFormPrKKlassSprav(self).Caption     :=InicFormCaption;
    ActionADD.Caption                    :=nAction_Add[IndexLanguage];
    ActionChange.Caption                 :=nAction_Change[IndexLanguage];
    ActionDEL.Caption                    :=nAction_Del[IndexLanguage];
    ActionView.Caption                   :=nAction_View[IndexLanguage];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndexLanguage];
    ActionObnov.Caption                  :=nActiont_Obnov[IndexLanguage];
    ActionOtmena.Caption                 :=nAction_Exit[IndexLanguage];

    ActionADD.Hint                       :=nHintAction_Add[IndexLanguage];
    ActionChange.Hint                    :=nHintAction_Change[IndexLanguage];
    ActionDEL.Hint                       :=nHintAction_Del[IndexLanguage];
    ActionView.Hint                      :=nHintAction_View[IndexLanguage];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndexLanguage];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndexLanguage];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndexLanguage];

    dxStatusBar1.Panels[0].Text          :=nStatBarAdd[IndexLanguage];
    dxStatusBar1.Panels[1].Text          :=nStatBarChange[IndexLanguage];
    dxStatusBar1.Panels[2].Text          :=nStatBarDel[IndexLanguage];
    dxStatusBar1.Panels[3].Text          :=nStatBarVibrat[IndexLanguage];
    dxStatusBar1.Panels[4].Text          :=nStatBarObnov[IndexLanguage];
    dxStatusBar1.Panels[5].Text          :=nStatBarExit[IndexLanguage];
end;

procedure TFormPrKKlassSprav.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormPrKKlassSprav.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormPrKKlassSprav.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormPrKKlassSprav.SetSelectSQLText(const Value: String);
begin
  FSelectSQLText := Value;
  InicalisationDataSet;
end;

procedure TFormPrKKlassSprav.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then
    begin
     ParamSprav.Free;
     ParamSprav :=nil;
     Action:=caFree;
    end;
end;

procedure TFormPrKKlassSprav.ActionOtmenaExecute(Sender: TObject);
begin
   Close;
end;

procedure TFormPrKKlassSprav.Obnovit(id_obnovit: int64);
var
  ID_LOCATE_LOCAL_NAME: string;
begin
   ID_LOCATE_LOCAL_NAME:=ID_NAME;{В методе  AfterScroll (это в двухуровневых справочниках) имя ID_NAME будет другое}
   DataSetPrKSprav.CloseOpen(false);
   DataSetPrKSprav.Locate(ID_LOCATE_LOCAL_NAME,id_obnovit,[]);
end;

procedure TFormPrKKlassSprav.ActionObnovExecute(Sender: TObject);
var
  i:Int64;
begin
     if DataSetPrKSprav.FieldValues[ID_NAME]<>null
      then i:= StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);
   Obnovit(i);
end;

procedure TFormPrKKlassSprav.SetID_NAME(const Value: string);
begin
  if Trim(Value)='' then ShowMessage('Пустое имя id!!!'+CHR(13)+
                   'Дальнейшая работа программы будет неверной!');
  FID_NAME := Value;
end;

procedure TFormPrKKlassSprav.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSprav;
   T:TFormPrKKlassSpravEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSprav.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                         StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditStandart.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
   if ShowShortName = false then
   begin
       T.cxLabelShortName.Visible     :=false;
       T.cxTextEditShortName.Visible :=false;
   end;
   if ShowNpp=true then
    begin
      T.cxLabelNPP.Visible    :=true;
      T.cxTextEditNPP.Visible :=true;
    end;
   if T.ShowModal=MrOk then
    begin
       StoredProcPrKSprav.Transaction.StartTransaction;
       StoredProcPrKSprav.StoredProcName:=StoredProcAddName;
       StoredProcPrKSprav.Prepare;
       StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravAdd.Name;
       if ShowShortName = True then
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravAdd.Npp;
       StoredAddPar;
       try
          StoredProcPrKSprav.ExecProc;
          StoredProcPrKSprav.Transaction.commit;
          DataPrKSpravAdd.Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProcPrKSprav.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataPrKSpravAdd.Id);
   DataPrKSpravAdd.Free;
   DataPrKSpravAdd:=nil;
   if TryAgain=true
      then ActionADDExecute(Sender);

end;


procedure TFormPrKKlassSprav.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSprav;
   T:TFormPrKKlassSpravEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if ShowShortName = true then
       DataPrKSpravChange:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']))
       else DataPrKSpravChange:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              'short_name',
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']));

       T:=TFormPrKSpravEditStandart.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage]+CaptionEditForm;
       if ShowShortName = false then
       begin
          T.cxLabelShortName.Visible     :=false;
          T.cxTextEditShortName.Visible :=false;
       end;
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcChangeName;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64       :=DataPrKSpravChange.Id;
           StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravChange.Name;
           if showshortname = true then
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravChange.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravChange.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravChange.Npp;

           try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(DataPrKSpravChange.Id);
       DataPrKSpravChange.Free;
       DataPrKSpravChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPrKKlassSprav.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSprav;
   T:TFormPrKKlassSpravEdit;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if ShowShortName = true
       then DataPrKSpravView:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']))
       else DataPrKSpravView:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              'SHORT_NAME',
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']));


       T:=TFormPrKSpravEditStandart.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowShortName = false then
       begin
          T.cxLabelShortName.Visible     :=false;
          T.cxTextEditShortName.Visible :=false;
       end;
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage]+CaptionEditForm;
       T.cxTextEditName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly :=true;
       T.cxTextEditKod.Properties.ReadOnly       :=true;
       T.cxTextEditNpp.Properties.ReadOnly       :=true;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;

end;

procedure TFormPrKKlassSprav.ActionDELExecute(Sender: TObject);
begin
    // будет ДЕЛАТЬСЯ В uPrK_SpravOneLevel, так как нужно позицироваться по гриду вверх
end;

procedure TFormPrKKlassSprav.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,4], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    if ShowShortName = true
    then ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    close;
  end;
end;

procedure TFormPrKKlassSprav.SetStoredProcAddName(const Value: string);
begin
  FStoredProcAddName := Value;
end;

procedure TFormPrKKlassSprav.SetStoredProcChangeName(const Value: string);
begin
  FStoredProcChangeName := Value;
end;

procedure TFormPrKKlassSprav.SetStoredProcDelName(const Value: string);
begin
  FStoredProcDelName := Value;
end;

procedure TFormPrKKlassSprav.SetIndexLanguage(const Value: integer);
begin
  FIndexLanguage := Value;
end;


procedure TFormPrKKlassSprav.SetInicFormCaption(const Value: string);
begin
  FInicFormCaption := Value;
  InicCaption;
end;

procedure TFormPrKKlassSprav.SetShowNpp(const Value: boolean);
begin
  FShowNpp := Value;
end;

procedure TFormPrKKlassSprav.SetShowShortName(const Value: boolean);
begin
  FShowShortName := Value;
end;

procedure TFormPrKKlassSprav.SetNamePrKSpravEdit(
  const Value: TNamePrKSpravEdit);
begin
  FNamePrKSpravEdit := Value;
end;

procedure TFormPrKKlassSprav.SetCaptionEditForm(const Value: string);
begin
  FCaptionEditForm := Value;
end;

procedure TFormPrKKlassSprav.StoredAddPar;
begin
//  во главе пустая процедура должна быть...
//  в унаследованных перекрыть. и добавить параметры там где надо.
end;


end.
