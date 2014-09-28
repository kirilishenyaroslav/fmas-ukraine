unit uPRK_SP_SOSTAV_PK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, dxBar, dxBarExtItems,
  ActnList, ImgList, Placemnt, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,ibase,ib_externals,AArray,
  dxStatusBar;

type
  TFormPRK_SP_SOSTAV_PK = class(TForm)
    cxGridPrKSostPK: TcxGrid;
    cxGridPrKSostPKDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colNAME_DOLGNOST_PK: TcxGridDBColumn;
    colPRIM: TcxGridDBColumn;
    cxGridPrKSostPKLevel1: TcxGridLevel;
    StyleRepositorySostPK: TcxStyleRepository;
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
    DataBasePrKSostPK: TpFIBDatabase;
    TransactionReadPrKSostPK: TpFIBTransaction;
    TransactionWritePrKSostPK: TpFIBTransaction;
    StoredProcPrKSostPK: TpFIBStoredProc;
    DataSetPrKSostPK: TpFIBDataSet;
    DataSourcePrKSostPK: TDataSource;
    FormStorageSostPK: TFormStorage;
    ImageListSostPK: TImageList;
    ActionListSostPK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManagerSostPK: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    cxEditStyleControllerSostPK: TcxEditStyleController;
    dxStatusBarSP: TdxStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
  private
     DBHANDLE                :TISC_DB_HANDLE;
     ResultArray             :TAArray;
     TextViewColor           :TColor;
     ID_NAME                 :String;
     FCheckAccessAdd    :string;
     FCheckAccessDel    :string;
     FCheckAccessChange :string;
     FSelectSQLTextSP   :string;
     procedure Obnovit(id_obnovit: int64); 
     procedure InicCaption;
     procedure CheckAccess(pObject, pAction: string;aAction: TAction);
     procedure SetCheckAccessAdd(const Value: string);
     procedure SetCheckAccessChange(const Value: string);
     procedure SetCheckAccessDel(const Value: string);
     procedure SetSelectSQLTextSP(const Value: string);
  public
     ID_USER_GLOBAL       :Int64;
     ID_GOD_NABORA_GLOBAL :Int64;
     IndLangSP            :integer;
     constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property CheckAccessAdd :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange :string read FCheckAccessChange write SetCheckAccessChange;
     Property SelectSQLTextSP   :string read FSelectSQLTextSP write SetSelectSQLTextSP;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPRK_SP_SOSTAV_PK: TFormPRK_SP_SOSTAV_PK;

implementation
uses
  uPrK_Resources,uConstants,AccMgmt,uPRK_SP_SOSTAV_PK_Edit;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_SP_SOSTAV_PK;
begin
   T:=TFormPRK_SP_SOSTAV_PK.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

{ TFormPRK_SP_SOSTAV_PK }

procedure TFormPRK_SP_SOSTAV_PK.CheckAccess(pObject, pAction: string;
  aAction: TAction);
begin
   if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

constructor TFormPRK_SP_SOSTAV_PK.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangSP     :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerSostPK.Style.Color   := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_SP_SOSTAV_PK.SetCheckAccessAdd(const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormPRK_SP_SOSTAV_PK.SetCheckAccessChange(const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormPRK_SP_SOSTAV_PK.SetCheckAccessDel(const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormPRK_SP_SOSTAV_PK.FormCreate(Sender: TObject);
begin
  ID_NAME            :='ID_SP_SOSTAV_PK';
  SelectSQLTextSP    :='Select * from PRK_SP_SOSTAV_PK_SELECT(:ID_SP_GOD_NABORA)';

  InicCaption; 
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_SOSTAV_PK.SetSelectSQLTextSP(const Value: string);
begin
  FSelectSQLTextSP := Value;
    DataBasePrKSostPK.close;
    DataSetPrKSostPK.Active                         :=false;
    DataBasePrKSostPK.Handle                        :=DBHANDLE;
    DataBasePrKSostPK.DefaultTransaction            := TransactionReadPrKSostPK;
    DataSetPrKSostPK.Database                       := DataBasePrKSostPK;
    DataSetPrKSostPK.Transaction                    := TransactionReadPrKSostPK;
    DataSetPrKSostPK.SelectSQL.Clear;
    DataSetPrKSostPK.SQLs.SelectSQL.Text            := FSelectSQLTextSP;
    DataSetPrKSostPK.ParamByName('ID_SP_GOD_NABORA').AsInt64:=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetPrKSostPK.CloseOpen(false);
end;

procedure TFormPRK_SP_SOSTAV_PK.InicCaption;
begin
    dxBarManagerSostPK.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerSostPK.Bars[0].ShowMark       :=false;
    dxBarManagerSostPK.CanCustomize           :=false;
    dxBarManagerSostPK.Bars[0].AllowClose       :=false;
    dxBarManagerSostPK.Bars[0].AllowCustomizing    :=false;
    dxBarManagerSostPK.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerSostPK.Bars[0].AllowReset                :=false;

    TFormPRK_SP_SOSTAV_PK(self).Caption     :=nFormPRK_SP_SOSTAV_PK_Caption[IndLangSP];
    ActionADD.Caption                    :=nAction_Add[IndLangSP];
    ActionChange.Caption                 :=nAction_Change[IndLangSP];
    ActionDEL.Caption                    :=nAction_Del[IndLangSP];
    ActionView.Caption                   :=nAction_View[IndLangSP];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLangSP];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLangSP];
    ActionOtmena.Caption                 :=nAction_Exit[IndLangSP];

    ActionADD.Hint                       :=nHintAction_Add[IndLangSP];
    ActionChange.Hint                    :=nHintAction_Change[IndLangSP];
    ActionDEL.Hint                       :=nHintAction_Del[IndLangSP];
    ActionView.Hint                      :=nHintAction_View[IndLangSP];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLangSP];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLangSP];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLangSP];

    colFIO.Caption                       :=ncolFIO[IndLangSP];
    colNAME_DOLGNOST_PK.Caption          :=ncolDOLGNOST[IndLangSP];
    colPRIM.Caption                      :=ncolPRIM[IndLangSP];

    dxStatusBarSP.Panels[0].Text          :=nStatBarAdd[IndLangSP];
    dxStatusBarSP.Panels[1].Text          :=nStatBarChange[IndLangSP];
    dxStatusBarSP.Panels[2].Text          :=nStatBarDel[IndLangSP];
    dxStatusBarSP.Panels[3].Text          :=nStatBarVibrat[IndLangSP];
    dxStatusBarSP.Panels[4].Text          :=nStatBarObnov[IndLangSP];
    dxStatusBarSP.Panels[5].Text          :=nStatBarExit[IndLangSP];
end;

procedure TFormPRK_SP_SOSTAV_PK.Obnovit(id_obnovit: int64);
begin
    DataSetPrKSostPK.CloseOpen(false);
    DataSetPrKSostPK.Locate(ID_NAME,id_obnovit,[]);
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionADDExecute(Sender: TObject);
var
   DataSPAdd :TAArray;
   T:TFormPRK_SP_SOSTAV_PK_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataSPAdd :=TAArray.Create;
   DataSPAdd['FIO'].AsString                      :='';
   DataSPAdd['SHORT_NAME_DOLGNOST_PK'].AsString   :='';
   DataSPAdd['PRIM'].AsString                     :='';

   if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null
      then DataSPAdd['ID'].AsInt64:=StrToInt64(DataSetPrKSostPK.FieldValues[ID_NAME]);

   T := TFormPRK_SP_SOSTAV_PK_Edit.Create(self,DataSPAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangSP];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKSostPK.Transaction.StartTransaction;
       StoredProcPrKSostPK.StoredProcName:='PRK_SP_SOSTAV_PK_ADD';
       StoredProcPrKSostPK.Prepare;
       StoredProcPrKSostPK.ParamByName('ID_SP_DOLGNOST_PK').AsInt64  :=DataSPAdd['ID_SP_DOLGNOST_PK'].AsInt64;
       StoredProcPrKSostPK.ParamByName('ID_SP_GOD_NABORA').AsInt64   :=ID_GOD_NABORA_GLOBAL;
       StoredProcPrKSostPK.ParamByName('ID_MAN').AsInt64             :=DataSPAdd['ID_MAN'].AsInt64;
       StoredProcPrKSostPK.ParamByName('PRIM').AsString              :=DataSPAdd['PRIM'].AsString;
       try
          StoredProcPrKSostPK.ExecProc;
          StoredProcPrKSostPK.Transaction.commit;
          DataSPAdd['ID'].AsInt64:=StoredProcPrKSostPK.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
             StoredProcPrKSostPK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataSPAdd['ID'].AsInt64);
   DataSPAdd.Free;
   DataSPAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionChangeExecute(Sender: TObject);
var
   DataSPChange :TAArray;
   T:TFormPRK_SP_SOSTAV_PK_Edit;
   TryAgain :boolean;
begin

   TryAgain:=false;
   if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null then
    begin
       DataSPChange :=TAArray.Create;
       DataSPChange['ID'].AsInt64                      :=DataSetPrKSostPK.FieldValues[ID_NAME];
       DataSPChange['ID_MAN'].AsInt64                  :=DataSetPrKSostPK.FieldValues['ID_MAN'];
       DataSPChange['FIO'].AsString                    :=DataSetPrKSostPK.FieldValues['FIO'];
       DataSPChange['ID_SP_DOLGNOST_PK'].AsInt64       :=DataSetPrKSostPK.FieldValues['ID_SP_DOLGNOST_PK'];
       DataSPChange['SHORT_NAME_DOLGNOST_PK'].AsString :=DataSetPrKSostPK.FieldValues['SHORT_NAME_DOLGNOST_PK'];
       DataSPChange['PRIM'].AsString                   :=DataSetPrKSostPK.FieldValues['PRIM'];

       T:=TFormPRK_SP_SOSTAV_PK_Edit.Create(self,DataSPChange);
       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangSP];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSostPK.Transaction.StartTransaction;
           StoredProcPrKSostPK.StoredProcName:='PRK_SP_SOSTAV_PK_CHANGE';
           StoredProcPrKSostPK.Prepare;
           StoredProcPrKSostPK.ParamByName(ID_NAME).AsInt64          :=DataSPChange['ID'].AsInt64;
           StoredProcPrKSostPK.ParamByName('ID_SP_DOLGNOST_PK').AsInt64  :=DataSPChange['ID_SP_DOLGNOST_PK'].AsInt64;
           StoredProcPrKSostPK.ParamByName('ID_SP_GOD_NABORA').AsInt64   :=ID_GOD_NABORA_GLOBAL;
           StoredProcPrKSostPK.ParamByName('ID_MAN').AsInt64             :=DataSPChange['ID_MAN'].AsInt64;
           StoredProcPrKSostPK.ParamByName('PRIM').AsString              :=DataSPChange['PRIM'].AsString;
           try
              StoredProcPrKSostPK.ExecProc;
              StoredProcPrKSostPK.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSostPK.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(DataSPChange['ID'].AsInt64);
       DataSPChange.Free;
       DataSPChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionViewExecute(Sender: TObject);
var
   DataSPView :TAArray;
   T:TFormPRK_SP_SOSTAV_PK_Edit;
begin
   if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null then
    begin
       DataSPView :=TAArray.Create;
       DataSPView['FIO'].AsString                    :=DataSetPrKSostPK.FieldValues['FIO'];
       DataSPView['SHORT_NAME_DOLGNOST_PK'].AsString :=DataSetPrKSostPK.FieldValues['SHORT_NAME_DOLGNOST_PK'];
       DataSPView['PRIM'].AsString                   :=DataSetPrKSostPK.FieldValues['PRIM'];

       T:=TFormPRK_SP_SOSTAV_PK_Edit.Create(self,DataSPView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangSP];
       T.cxTextEditPRIM.Properties.ReadOnly       :=true;
       T.cxButtonEditFIO.Properties.ReadOnly      :=true;
       T.cxButtonEditFIO.Properties.Buttons[0].Visible  :=false;
       T.cxButtonEditDOLJNOST.Properties.ReadOnly :=true;
       T.cxButtonEditDOLJNOST.Properties.Buttons[0].Visible :=false;
       T.cxTextEditPRIM.Style.Color              :=TextViewColor;
       T.cxButtonEditFIO.Style.Color             :=TextViewColor;
       T.cxButtonEditDOLJNOST.Style.Color        :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataSPView.Free;
       DataSPView:=nil;
    end;
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionObnovExecute(Sender: TObject);
begin
  if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null
   then Obnovit(DataSetPrKSostPK.FieldValues[ID_NAME])
   else Obnovit(-1);
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSostPK.FieldValues[ID_NAME]<>NULL then
    begin
      if DataSetPrKSostPK.FieldValues[ID_NAME]=-1 then exit;
      FillArrayFromDataSet(ResultArray['Output'],DataSetPrKSostPK);
      close;
    end;
end;

procedure TFormPRK_SP_SOSTAV_PK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionDELExecute(Sender: TObject);
begin
     if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLangSP],nMsgDel[IndLangSP],
                        mtInformation,mbOKCancel,IndLangSP)=mrOK then
         begin
            StoredProcPrKSostPK.Transaction.StartTransaction;
            StoredProcPrKSostPK.StoredProcName:='PRK_SP_SOSTAV_PK_DEL';
            StoredProcPrKSostPK.Prepare;
            StoredProcPrKSostPK.ParamByName(ID_NAME).AsInt64:= DataSetPrKSostPK.FieldValues[ID_NAME];
            try
              StoredProcPrKSostPK.ExecProc;
              StoredProcPrKSostPK.Transaction.Commit;
              cxGridPrKSostPKDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSostPK.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKSostPK.FieldValues[ID_NAME]));
     end;
end;

procedure TFormPRK_SP_SOSTAV_PK.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

end.
