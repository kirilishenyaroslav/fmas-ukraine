unit uSpecKlassSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, cxStyles, dxBar, dxBarExtItems, cxGraphics,
  cxControls, dxStatusBar, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,Ibase,uPrK_Resources,AArray, pFIBErrorHandler;

Type TNameSprav    =(PUB_SP_MOVA, PUB_SP_USPEC, PUB_SP_SPEC, PUB_SP_SPEC_OLD,
                     PEOPLE_TYPE_BANKCARD);

type
  TFormSpecKlassSprav = class(TForm)
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
    procedure FormShow(Sender: TObject);
              // возможно нужно это в private описать
    procedure InicalisationDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
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
     constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNameSprav: TNameSprav; aParam: TAArray);overload;
     Property IndexLanguage  :integer read FIndexLanguage write SetIndexLanguage;
     Property ID_NAME        :string read FID_NAME write SetID_NAME;
     Property SelectSQLText  :String read FSelectSQLText write SetSelectSQLText;
     Property ShowNpp        :boolean read FShowNpp write SetShowNpp;
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

  function ShowSprav(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNameSprav: TNameSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;stdcall;

  procedure ShowJnFakSpec(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
  function ViewPubSpMova(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;stdcall;
  function ViewPubSpUspec(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;stdcall;
  function ViewPubSpSpec(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;stdcall;

  function ViewPeopleTypeBankCard(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;stdcall;

  exports ShowSprav,ShowJnFakSpec,ViewPubSpMova, ViewPubSpUspec, ViewPubSpSpec, ViewPeopleTypeBankCard;

implementation
uses
 AccMgmt,uConstants,uSpecKlassSpravEdit,uSpecSpravEditStandart,uPUB_SP_MOVA,
 uPUB_SP_USPEC,uPUB_SP_SPEC, uPrK_JN_FAK_SPEC, uPEOPLE_TYPE_BANKCARD;

{$R *.dfm}

procedure ShowJnFakSpec(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var T:TfrmJnFakSpec;
begin
  T:=TfrmJnFakSpec.Create(aOwner,aDBHANDLE);
  T.Show;
end;

function ShowSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
   aNameSprav: TNameSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
var
   T: TFormSpecKlassSprav;
begin
   case aNameSprav of
     PUB_SP_MOVA                : T:=TFormPUB_SP_MOVA.Create(aOwner,aDBHANDLE,aNameSprav,aParam);
     PUB_SP_USPEC               : T:=TFormPUB_SP_USPEC.Create(aOwner,aDBHANDLE,aNameSprav,aParam);
     PUB_SP_SPEC                : T:=TFormPUB_SP_SPEC.Create(aOwner,aDBHANDLE,aNameSprav,aParam);
     PUB_SP_SPEC_OLD            : begin
                                    if not Assigned(aParam) then
                                      aParam:=TAArray.Create;
                                    aParam['Input']['ShowOld'].AsVariant:=True;
                                    T:=TFormPUB_SP_SPEC.Create(aOwner,aDBHANDLE,aNameSprav,aParam);
                                  end;
     PEOPLE_TYPE_BANKCARD       : T:=TFormPEOPLE_TYPE_BANKCARD.Create(aOwner,aDBHANDLE,aNameSprav,aParam);
   end;

   T.FormStyle:=aFrmStyle;
   case aFrmStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                   ShowSprav :=T.ResultArray; //сделать возвращение данных
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

function ViewPeopleTypeBankCard(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;
begin
  Result:=ShowSprav(AOwner,ADB_HANDLE,PEOPLE_TYPE_BANKCARD,AFrmStyle);
end;

function ViewPubSpMova(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;
begin
  Result:=ShowSprav(AOwner,ADB_HANDLE,PUB_SP_MOVA,AFrmStyle);
end;

function ViewPubSpUspec(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;
begin
  Result:=ShowSprav(AOwner,ADB_HANDLE,PUB_SP_USPEC,AFrmStyle);
end;

function ViewPubSpSpec(AOwner:TComponent; ADB_HANDLE:TISC_DB_HANDLE; AFrmStyle:TFormStyle):Variant;
begin
  Result:=ShowSprav(AOwner,ADB_HANDLE,PUB_SP_SPEC,AFrmStyle);
end;

procedure TFormSpecKlassSprav.CheckAccess(pObject, pAction: string;aAction: TAction);
begin
   if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

constructor TFormSpecKlassSprav.Create(aOwner: TComponent;
  aDBHANDLE: TISC_DB_HANDLE; aNameSprav: TNameSprav; aParam: TAArray);
begin

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

procedure TFormSpecKlassSprav.FormShow(Sender: TObject);
begin
                                        {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
end;

{ вызывается при иниц. SelectSQLText }
procedure TFormSpecKlassSprav.InicalisationDataSet;
begin
    DataBasePrKSprav.close;
    DataSetPrKSprav.Active                         :=false;
    DataBasePrKSprav.Handle                        :=DBHANDLE;
    DataBasePrKSprav.DefaultTransaction            := TransactionReadPrKSprav;
    DataSetPrKSprav.Database                       := DataBasePrKSprav;
    DataSetPrKSprav.Transaction                    := TransactionReadPrKSprav;
    DataSetPrKSprav.SelectSQL.Clear;
    DataSetPrKSprav.SQLs.SelectSQL.Text            :=FSelectSQLText;
    DataSetPrKSprav.CloseOpen(false);

    ResultArray:=null;
end;

procedure TFormSpecKlassSprav.DataSetPrKSpravAfterOpen(DataSet: TDataSet);
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

procedure TFormSpecKlassSprav.InicCaption;
begin
    dxBarManager1.Bars[0].BorderStyle    :=bbsNone;
    dxBarManager1.Bars[0].ShowMark       :=false;
    dxBarManager1.CanCustomize           :=false;
    dxBarManager1.Bars[0].AllowClose       :=false;
    dxBarManager1.Bars[0].AllowCustomizing    :=false;
    dxBarManager1.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManager1.Bars[0].AllowReset                :=false;
    dxBarManager1.Bars[0].MultiLine                   :=True;

    TFormSpecKlassSprav(self).Caption     :=InicFormCaption;
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

procedure TFormSpecKlassSprav.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormSpecKlassSprav.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormSpecKlassSprav.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormSpecKlassSprav.SetSelectSQLText(const Value: String);
begin
  FSelectSQLText := Value;
  InicalisationDataSet;
end;

procedure TFormSpecKlassSprav.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then
    begin
     ParamSprav.Free;
     ParamSprav :=nil;
     Action:=caFree;
    end;
end;

procedure TFormSpecKlassSprav.ActionOtmenaExecute(Sender: TObject);
begin
   Close;
end;

procedure TFormSpecKlassSprav.Obnovit(id_obnovit: int64);
var
  ID_LOCATE_LOCAL_NAME: string;
begin
   ID_LOCATE_LOCAL_NAME:=ID_NAME;{В методе  AfterScroll (это в двухуровневых справочниках) имя ID_NAME будет другое}
   DataSetPrKSprav.CloseOpen(false);
   DataSetPrKSprav.Locate(ID_LOCATE_LOCAL_NAME,id_obnovit,[]);
end;

procedure TFormSpecKlassSprav.ActionObnovExecute(Sender: TObject);
var
  i:Int64;
begin
     if DataSetPrKSprav.FieldValues[ID_NAME]<>null
      then i:= StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);
   Obnovit(i);
end;

procedure TFormSpecKlassSprav.SetID_NAME(const Value: string);
begin
  if Trim(Value)='' then ShowMessage('Пустое имя id!!!'+CHR(13)+
                   'Дальнейшая работа программы будет неверной!');
  FID_NAME := Value;
end;

procedure TFormSpecKlassSprav.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSprav;
   T:TFormSpecKlassSpravEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSprav.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                         StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormSpecSpravEditStandart.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
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


procedure TFormSpecKlassSprav.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSprav;
   T:TFormSpecKlassSpravEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']));

       T:=TFormSpecSpravEditStandart.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage]+CaptionEditForm;
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

procedure TFormSpecKlassSprav.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSprav;
   T:TFormSpecKlassSpravEdit;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSprav.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']));


       T:=TFormSpecSpravEditStandart.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);

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

procedure TFormSpecKlassSprav.ActionDELExecute(Sender: TObject);
begin
    // будет ДЕЛАТЬСЯ В uPrK_SpravOneLevel, так как нужно позицироваться по гриду вверх
end;

procedure TFormSpecKlassSprav.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,4], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    close;
  end;
end;

procedure TFormSpecKlassSprav.SetStoredProcAddName(const Value: string);
begin
  FStoredProcAddName := Value;
end;

procedure TFormSpecKlassSprav.SetStoredProcChangeName(const Value: string);
begin
  FStoredProcChangeName := Value;
end;

procedure TFormSpecKlassSprav.SetStoredProcDelName(const Value: string);
begin
  FStoredProcDelName := Value;
end;

procedure TFormSpecKlassSprav.SetIndexLanguage(const Value: integer);
begin
  FIndexLanguage := Value;
end;


procedure TFormSpecKlassSprav.SetInicFormCaption(const Value: string);
begin
  FInicFormCaption := Value;
  InicCaption;
end;

procedure TFormSpecKlassSprav.SetShowNpp(const Value: boolean);
begin
  FShowNpp := Value;
end;

procedure TFormSpecKlassSprav.SetNamePrKSpravEdit(
  const Value: TNamePrKSpravEdit);
begin
  FNamePrKSpravEdit := Value;
end;

procedure TFormSpecKlassSprav.SetCaptionEditForm(const Value: string);
begin
  FCaptionEditForm := Value;
end;

procedure TFormSpecKlassSprav.StoredAddPar;
begin
//  во главе пустая процедура должна быть...
//  в унаследованных перекрыть. и добавить параметры там где надо.
end;

end.
