unit uPRK_SP_FORM_STUD_FOB_PROT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, dxBar, dxBarExtItems,
  ActnList, ImgList, Placemnt, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,ibase,ib_externals,AArray,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TFormPRK_SP_FORM_STUD_FOB_PROT = class(TForm)
    dxStatusBarFSFP: TdxStatusBar;
    StyleRepositoryFSFP: TcxStyleRepository;
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
    DataBasePrKFSFP: TpFIBDatabase;
    TransactionReadPrKFSFP: TpFIBTransaction;
    TransactionWritePrKFSFP: TpFIBTransaction;
    StoredProcPrKFSFP: TpFIBStoredProc;
    DataSetPrKFSFP: TpFIBDataSet;
    DataSourcePrKFSFP: TDataSource;
    FormStorageFSFP: TFormStorage;
    ImageListFSFP: TImageList;
    ActionListFSFP: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManagerFSFP: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    cxEditStyleControllerFSFP: TcxEditStyleController;
    cxGridPrKFSFP: TcxGrid;
    cxGridPrKFSFPDBTableView1: TcxGridDBTableView;
    colNAME_FORM_STUD: TcxGridDBColumn;
    colNAME_FOB_PROT: TcxGridDBColumn;
    cxGridPrKFSFPLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
  private
     DBHANDLE                :TISC_DB_HANDLE;
     ResultArray             :TAArray;
     TextViewColor           :TColor;
     ID_NAME                 :String;
     IndLangFSFP             :integer;
     FCheckAccessDel: string;
     FSelectSQLTextFSFP: string;
     FCheckAccessAdd: string;
     FCheckAccessChange: string;
     procedure InicCaption;
     procedure Obnovit(id_obnovit: int64); 
     procedure CheckAccess(pObject, pAction: string;aAction: TAction);
     procedure SetCheckAccessAdd(const Value: string);
     procedure SetCheckAccessChange(const Value: string);
     procedure SetCheckAccessDel(const Value: string);
     procedure SetSelectSQLTextFSFP(const Value: string);
  public
     ID_USER_GLOBAL       :Int64;
     ID_GOD_NABORA_GLOBAL :Int64;
     constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property CheckAccessAdd    :string read FCheckAccessAdd write SetCheckAccessAdd;
     Property CheckAccessDel    :string read FCheckAccessDel write SetCheckAccessDel;
     Property CheckAccessChange :string read FCheckAccessChange write SetCheckAccessChange;
     Property SelectSQLTextFSFP :string read FSelectSQLTextFSFP write SetSelectSQLTextFSFP;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPRK_SP_FORM_STUD_FOB_PROT: TFormPRK_SP_FORM_STUD_FOB_PROT;

implementation
uses
  uPrK_Resources,uConstants,AccMgmt,uPRK_SP_FORM_STUD_FOB_PROT_Edit;
{$R *.dfm}
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_SP_FORM_STUD_FOB_PROT;
begin
   T:=TFormPRK_SP_FORM_STUD_FOB_PROT.Create(aOwner,aParam);

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

{ TFormPRK_SP_FORM_STUD_FOB_PROT }

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.CheckAccess(pObject,
  pAction: string; aAction: TAction);
begin
   if fibCheckPermission(pObject,pAction)<>0 then aAction.Enabled:=false;
end;

constructor TFormPRK_SP_FORM_STUD_FOB_PROT.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangFSFP   :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerFSFP.Style.Color   := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.SetCheckAccessAdd(
  const Value: string);
begin
  FCheckAccessAdd := Value;
  CheckAccess(FCheckAccessAdd,'Add',ActionADD);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.SetCheckAccessChange(
  const Value: string);
begin
  FCheckAccessChange := Value;
  CheckAccess(FCheckAccessChange,'Change',ActionChange);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.SetCheckAccessDel(
  const Value: string);
begin
  FCheckAccessDel := Value;
  CheckAccess(FCheckAccessDel,'Del',ActionDEL);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.SetSelectSQLTextFSFP(
  const Value: string);
begin
  FSelectSQLTextFSFP := Value;
    DataBasePrKFSFP.close;
    DataSetPrKFSFP.Active                         :=false;
    DataBasePrKFSFP.Handle                        :=DBHANDLE;
    DataBasePrKFSFP.DefaultTransaction            := TransactionReadPrKFSFP;
    DataSetPrKFSFP.Database                       := DataBasePrKFSFP;
    DataSetPrKFSFP.Transaction                    := TransactionReadPrKFSFP;
    DataSetPrKFSFP.SelectSQL.Clear;
    DataSetPrKFSFP.SQLs.SelectSQL.Text            := FSelectSQLTextFSFP;
    DataSetPrKFSFP.CloseOpen(false);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.FormCreate(Sender: TObject);
begin
  ID_NAME              :='ID_SP_FORM_STUD_FOB_PROT';
  SelectSQLTextFSFP    :='Select * from PRK_SP_FRM_STUD_FOB_PROT_SELECT';

  InicCaption;
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.InicCaption;
var
   i: integer;
begin
    i:=IndLangFSFP;

    dxBarManagerFSFP.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerFSFP.Bars[0].ShowMark       :=false;
    dxBarManagerFSFP.CanCustomize           :=false;
    dxBarManagerFSFP.Bars[0].AllowClose       :=false;
    dxBarManagerFSFP.Bars[0].AllowCustomizing    :=false;
    dxBarManagerFSFP.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerFSFP.Bars[0].AllowReset                :=false;

    TFormPRK_SP_FORM_STUD_FOB_PROT(self).Caption     :=nFormPRK_SP_FORM_STUD_FOB_PROT_Caption[i];
    ActionADD.Caption                    :=nAction_Add[i];
    ActionChange.Caption                 :=nAction_Change[i];
    ActionDEL.Caption                    :=nAction_Del[i];
    ActionView.Caption                   :=nAction_View[i];
    ActionVibrat.Caption                 :=nAction_Vibrat[i];
    ActionObnov.Caption                  :=nActiont_Obnov[i];
    ActionOtmena.Caption                 :=nAction_Exit[i];

    ActionADD.Hint                       :=nHintAction_Add[i];
    ActionChange.Hint                    :=nHintAction_Change[i];
    ActionDEL.Hint                       :=nHintAction_Del[i];
    ActionView.Hint                      :=nHintAction_View[i];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[i];
    ActionObnov.Hint                     :=nHintAction_Obnov[i];
    ActionOtmena.Hint                    :=nHintAction_Exit[i];

    colNAME_FORM_STUD.Caption            :=ncolSHORT_NAME_CN_FORM_STUD[i];
    colNAME_FOB_PROT.Caption             :=ncolNAME_FOB_PROT[i];   

    dxStatusBarFSFP.Panels[0].Text          :=nStatBarAdd[i];
    dxStatusBarFSFP.Panels[1].Text          :=nStatBarChange[i];
    dxStatusBarFSFP.Panels[2].Text          :=nStatBarDel[i];
    dxStatusBarFSFP.Panels[3].Text          :=nStatBarVibrat[i];
    dxStatusBarFSFP.Panels[4].Text          :=nStatBarObnov[i];
    dxStatusBarFSFP.Panels[5].Text          :=nStatBarExit[i];
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.Obnovit(id_obnovit: int64);
begin
    DataSourcePrKFSFP.Enabled:=false;
    DataSetPrKFSFP.CloseOpen(false);
    DataSetPrKFSFP.Locate(ID_NAME,id_obnovit,[]);
    DataSourcePrKFSFP.Enabled:=true;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionOtmenaExecute(
  Sender: TObject);
begin
   close;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionObnovExecute(
  Sender: TObject);
begin
   Obnovit(DataSetPrKFSFP.FieldValues[ID_NAME]);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionADDExecute(Sender: TObject);
var
   DataFPAdd :TAArray;
   T:TFormPRK_SP_FORM_STUD_FOB_PROT_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataFPAdd :=TAArray.Create;
   DataFPAdd['SHORT_NAME_FORM_STUD'].AsString   :='';
   DataFPAdd['SHORT_NAME_FOB_PROT'].AsString    :='';

   if DataSetPrKFSFP.FieldValues[ID_NAME]<>Null
      then DataFPAdd['ID'].AsInt64:=StrToInt64(DataSetPrKFSFP.FieldValues[ID_NAME]);

   T := TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.Create(self,DataFPAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangFSFP];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKFSFP.Transaction.StartTransaction;
       StoredProcPrKFSFP.StoredProcName:='PRK_SP_FORM_STUD_FOB_PROT_ADD';
       StoredProcPrKFSFP.Prepare;
       StoredProcPrKFSFP.ParamByName('ID_SP_FOB_PROT').AsInt64       :=DataFPAdd['ID_SP_FOB_PROT'].AsInt64;
       StoredProcPrKFSFP.ParamByName('ID_CN_SP_FORM_STUD').AsInt64   :=DataFPAdd['ID_CN_SP_FORM_STUD'].AsInt64;
       try
          StoredProcPrKFSFP.ExecProc;
          StoredProcPrKFSFP.Transaction.commit;
          DataFPAdd['ID'].AsInt64:=StoredProcPrKFSFP.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangFSFP]+chr(13)+
                        nMsgTryAgain[IndLangFSFP]+nMsgOr[IndLangFSFP]+nMsgToAdmin[IndLangFSFP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangFSFP]),MB_OK or MB_ICONWARNING);
             StoredProcPrKFSFP.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataFPAdd['ID'].AsInt64);
   DataFPAdd.Free;
   DataFPAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionChangeExecute(
  Sender: TObject);
var
   DataFPChange :TAArray;
   T:TFormPRK_SP_FORM_STUD_FOB_PROT_Edit;
   TryAgain :boolean;
begin

   TryAgain:=false;
   if DataSetPrKFSFP.FieldValues[ID_NAME]<>Null then
    begin
       DataFPChange :=TAArray.Create;
       DataFPChange['ID'].AsInt64                     :=DataSetPrKFSFP.FieldValues[ID_NAME];
       DataFPChange['ID_CN_SP_FORM_STUD'].AsInt64     :=DataSetPrKFSFP.FieldValues['ID_CN_SP_FORM_STUD'];
       DataFPChange['SHORT_NAME_FORM_STUD'].AsString  :=DataSetPrKFSFP.FieldValues['SHORT_NAME_FORM_STUD'];
       DataFPChange['ID_SP_FOB_PROT'].AsInt64         :=DataSetPrKFSFP.FieldValues['ID_SP_FOB_PROT'];
       DataFPChange['SHORT_NAME_FOB_PROT'].AsString   :=DataSetPrKFSFP.FieldValues['SHORT_NAME_FOB_PROT'];

       T:=TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.Create(self,DataFPChange);
       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangFSFP];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKFSFP.Transaction.StartTransaction;
           StoredProcPrKFSFP.StoredProcName:='PRK_SP_FRM_STUD_FOB_PROT_CHANGE';
           StoredProcPrKFSFP.Prepare;
           StoredProcPrKFSFP.ParamByName(ID_NAME).AsInt64                :=DataFPChange['ID'].AsInt64;
           StoredProcPrKFSFP.ParamByName('ID_SP_FOB_PROT').AsInt64       :=DataFPChange['ID_SP_FOB_PROT'].AsInt64;
           StoredProcPrKFSFP.ParamByName('ID_CN_SP_FORM_STUD').AsInt64   :=DataFPChange['ID_CN_SP_FORM_STUD'].AsInt64;
           try
              StoredProcPrKFSFP.ExecProc;
              StoredProcPrKFSFP.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangFSFP]+chr(13)+
                        nMsgTryAgain[IndLangFSFP]+nMsgOr[IndLangFSFP]+nMsgToAdmin[IndLangFSFP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangFSFP]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKFSFP.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(DataFPChange['ID'].AsInt64);
       DataFPChange.Free;
       DataFPChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionViewExecute(
  Sender: TObject);
var
   DataFPView :TAArray;
   T:TFormPRK_SP_FORM_STUD_FOB_PROT_Edit;
begin
   if DataSetPrKFSFP.FieldValues[ID_NAME]<>Null then
    begin
       DataFPView :=TAArray.Create;
       DataFPView['SHORT_NAME_FORM_STUD'].AsString  :=DataSetPrKFSFP.FieldValues['SHORT_NAME_FORM_STUD'];
       DataFPView['SHORT_NAME_FOB_PROT'].AsString   :=DataSetPrKFSFP.FieldValues['SHORT_NAME_FOB_PROT'];

       T:=TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.Create(self,DataFPView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangFSFP];
       T.cxButtonEditCn_FORM_STUD.Properties.ReadOnly   :=true;
       T.cxButtonEditCn_FORM_STUD.Properties.Buttons[0].Visible  :=false;
       T.cxButtonEditFOB_PROT.Properties.ReadOnly       :=true;
       T.cxButtonEditFOB_PROT.Properties.Buttons[0].Visible      :=false;
       T.cxButtonEditCn_FORM_STUD.Style.Color     :=TextViewColor;
       T.cxButtonEditFOB_PROT.Style.Color         :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataFPView.Free;
       DataFPView:=nil;
    end;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT.ActionDELExecute(Sender: TObject);
begin
     if DataSetPrKFSFP.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLangFSFP],nMsgDel[IndLangFSFP],
                        mtInformation,mbOKCancel,IndLangFSFP)=mrOK then
         begin
            StoredProcPrKFSFP.Transaction.StartTransaction;
            StoredProcPrKFSFP.StoredProcName:='PRK_SP_FORM_STUD_FOB_PROT_DEL';
            StoredProcPrKFSFP.Prepare;
            StoredProcPrKFSFP.ParamByName(ID_NAME).AsInt64:= DataSetPrKFSFP.FieldValues[ID_NAME];
            try
              StoredProcPrKFSFP.ExecProc;
              StoredProcPrKFSFP.Transaction.Commit;
              cxGridPrKFSFPDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangFSFP]+chr(13)+
                        nMsgTryAgain[IndLangFSFP]+nMsgOr[IndLangFSFP]+nMsgToAdmin[IndLangFSFP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangFSFP]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKFSFP.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKFSFP.FieldValues[ID_NAME]));
     end;
end;

end.
