unit uPRK_SP_PLAN_CEL_NABOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uKlassVuzLicense, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt,
  dxBar, dxBarExtItems, ActnList, ImgList, dxStatusBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLabel, cxContainer,
  cxTextEdit, cxDBEdit, cxGroupBox, cxSplitter;

type
  TFormPRK_SP_PLAN_CEL_NABOR = class(TFormKlassVuzLicense)
    cxGroupBoxPlanNabora: TcxGroupBox;
    cxGridPrKPlanNabora: TcxGrid;
    cxGridPrKPlanNaboraDBTableView1: TcxGridDBTableView;
    colNAME_CN_FACUL_SPEC: TcxGridDBColumn;
    colSHORT_NAME_CN_KAT_STUD: TcxGridDBColumn;
    colSHORT_NAME_CN_FORM_STUD: TcxGridDBColumn;
    cxGridPrKPlanNaboraLevel1: TcxGridLevel;
    cxGroupBoxPlanNaborDopData: TcxGroupBox;
    cxDBTextEditDateBegCodNab: TcxDBTextEdit;
    cxDBTextEditDateEndGodNab: TcxDBTextEdit;
    cxLabelDateBeg: TcxLabel;
    cxLabelDateEnd: TcxLabel;
    cxLabelGodNabora: TcxLabel;
    cxDBTextEditGodNabora: TcxDBTextEdit;
    cxLabelDergZakaz: TcxLabel;
    cxDBTextEditDergZakaz: TcxDBTextEdit;
    cxLabelPlanValue: TcxLabel;
    cxDBTextEditPlanValue: TcxDBTextEdit;
    cxLabelKurs: TcxLabel;
    cxDBTextEditKurs: TcxDBTextEdit;
    cxLabelSrokOb: TcxLabel;
    cxDBTextEditSrokOb: TcxDBTextEdit;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    cxGroupBoxPlanSelNabor: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    DataSourceCelPlanNabora: TDataSource;
    DataSetCelPlanNabora: TpFIBDataSet;
    cxGridPrKCelPlanNabora: TcxGrid;
    cxGridPrKCelPlanNaboraDBTableView1: TcxGridDBTableView;
    colSHORT_NAME_CEL_ZAMOV: TcxGridDBColumn;
    colPLAN_VALUE: TcxGridDBColumn;
    cxGridPrKCelPlanNaboraLevel1: TcxGridLevel;
    ActionAddCelPN: TAction;
    ActionChangeCelPN: TAction;
    ActionDelCelPN: TAction;
    ActionViewCelPN: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionAddCelPNExecute(Sender: TObject);
    procedure ActionChangeCelPNExecute(Sender: TObject);
    procedure ActionViewCelPNExecute(Sender: TObject);
    procedure ActionDelCelPNExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
  private
    FSelectSQLTextCelPN        :String;
    procedure InicCaption; override;
    procedure SetSelectSQLTextCelPN(const Value: String);
  public
    ID_NAME_CEL_PN             :String;
    StoredProcAddNameCelPN     :String;
    StoredProcChangeNameCelPN  :String;
    StoredProcDelNameCelPN     :String;
    procedure ObnovitSelPN(id_obnovit: int64);
    Property SelectSQLTextCelPN  :String read FSelectSQLTextCelPN write SetSelectSQLTextCelPN;
  end;

var
  FormPRK_SP_PLAN_CEL_NABOR: TFormPRK_SP_PLAN_CEL_NABOR;

implementation
uses uConstants,AArray,uPrK_Resources,
     uPRK_SP_PLAN_CEL_NABOR_Edit;
{$R *.dfm}

procedure TFormPRK_SP_PLAN_CEL_NABOR.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_PLAN_NABORA';
  ID_NAME_CEL_PN       :='ID_SP_PLAN_CEL_NABOR';
  SelectSQLText        :='Select * from PRK_SP_PLAN_NABORA_SELECT('+IntToStr(ID_SP_GOD_NABORA)+')';
  SelectSQLTextCelPN   :='Select * from PRK_SP_PLAN_CEL_NABOR_SELECT where ?Mas_ID_SP_PLAN_NABORA=ID_SP_PLAN_NABORA';

  StoredProcAddNameCelPN          :='PRK_SP_PLAN_CEL_NABOR_ADD';
  StoredProcChangeNameCelPN       :='PRK_SP_PLAN_CEL_NABOR_CHANGE';
  StoredProcDelNameCelPN          :='PRK_SP_PLAN_CEL_NABOR_DEL';

  InicFormCaption      :=nFormPRK_SP_PLAN_CEL_NABOR_Caption[IndLangVL];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.InicCaption;
begin
  inherited;
    colNAME_CN_FACUL_SPEC.Caption       :=ncolNAME_CN_FACUL_SPEC[IndLangVL];
    colSHORT_NAME_CN_KAT_STUD.Caption   :=ncolSHORT_NAME_CN_KAT_STUD[IndLangVL];
    colSHORT_NAME_CN_FORM_STUD.Caption  :=ncolSHORT_NAME_CN_FORM_STUD[IndLangVL];
    colSHORT_NAME_FAK.Caption           :=ncolNAME_FAK[IndLangVL];
    colSHORT_NAME_CEL_ZAMOV.Caption     :=ncolCEL_ZAMOV[IndLangVL];
    colPLAN_VALUE.Caption               :=ncolPLAN_VALUE[IndLangVL];

    cxLabelGodNabora.Caption        :=nLabelGodNabora[IndLangVL];
    cxLabelDateBeg.Caption          :=nLabelDateBeg[IndLangVL];
    cxLabelDateEnd.Caption          :=nLabelDateEnd[IndLangVL];
    cxLabelDergZakaz.Caption        :=nLabelDergZakaz[IndLangVL];
    cxLabelKurs.Caption             :=nLabelKurs[IndLangVL];
    cxLabelPlanValue.Caption        :=nLabelPlanValue[IndLangVL];
    cxLabelSrokOb.Caption           :=nLabelSrokOb[IndLangVL];

    ActionAddCelPN.Caption       :=nAction_Add[IndLangVL];
    ActionChangeCelPN.Caption    :=nAction_Change[IndLangVL];
    ActionDelCelPN.Caption       :=nAction_Del[IndLangVL];
    ActionViewCelPN.Caption      :=nAction_View[IndLangVL];

    ActionAddCelPN.Hint          :=nHintAction_Add[IndLangVL];
    ActionChangeCelPN.Hint       :=nHintAction_Change[IndLangVL];
    ActionDelCelPN.Hint          :=nHintAction_Del[IndLangVL];
    ActionViewCelPN.Hint         :=nHintAction_View[IndLangVL];

    cxGroupBoxPlanNabora.Caption      :=ncxGroupBoxPlanNabora[IndLangVL];
    cxGroupBoxPlanSelNabor.Caption    :=ncxGroupBoxPlanSelNabor[IndLangVL];
   if SelectShemaColor=1 then
   begin
    cxDBTextEditPlanValue.Style.Color     :=$00EBC4A4;
    cxDBTextEditDergZakaz.Style.Color     :=$00EBC4A4;
    cxDBTextEditKurs.Style.Color          :=$00EBC4A4;
    cxDBTextEditGodNabora.Style.Color     :=$00EBC4A4;
    cxDBTextEditSrokOb.Style.Color        :=$00EBC4A4;
    cxDBTextEditDateBegCodNab.Style.Color :=$00EBC4A4;
    cxDBTextEditDateEndGodNab.Style.Color :=$00EBC4A4;
   end;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.SetSelectSQLTextCelPN(
  const Value: String);
begin
  FSelectSQLTextCelPN := Value;
  DataSetCelPlanNabora.Active :=false;
  DataSetCelPlanNabora.Database             := DataBasePrKVuzLicense;
  DataSetCelPlanNabora.Transaction          := TransactionReadPrKVuzLicense;
  DataSetCelPlanNabora.SelectSQL.Clear;
  DataSetCelPlanNabora.SQLs.SelectSQL.Text  :=FSelectSQLTextCelPN;
  DataSetCelPlanNabora.CloseOpen(false);
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ActionAddCelPNExecute(
  Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_PLAN_CEL_NABOR_Edit;
   TryAgain :boolean;
begin
    if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>null then
    begin
       TryAgain:=false;
       DataVLAdd :=TAArray.Create;
       DataVLAdd['SHORT_NAME_ZAMOVNIK'].AsString   :='';
       DataVLAdd['PLAN_VALUE'].AsInteger           :=0;

       if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null
          then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]);

       T := TFormPRK_SP_PLAN_CEL_NABOR_Edit.Create(self,DataVLAdd);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddNameCelPN;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_PLAN_NABORA').AsInt64   :=DataSetPrKVuzLicense['ID_SP_PLAN_NABORA'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_CEL_ZAMOVNIK').AsInt64  :=DataVLAdd['ID_SP_CEL_ZAMOVNIK'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('PLAN_VALUE').AsInteger        :=DataVLAdd['PLAN_VALUE'].AsInteger;
           try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.commit;
              DataVLAdd['ID'].AsInt64:=StoredProcPrKVuzLicense.FieldByName('ID_OUT').AsInt64;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                            nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;
       T.Free;
       T:=nil;
       Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
       ObnovitSelPN(DataVLAdd['ID'].AsInt64);
       DataVLAdd.Free;
       DataVLAdd:=Nil;

       if TryAgain=true
          then ActionAddCelPNExecute(Sender);
    end;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ActionChangeCelPNExecute(
  Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_PLAN_CEL_NABOR_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                    := DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN];
       DataVLChange['ID_SP_CEL_ZAMOVNIK'].AsInt64    := DataSetCelPlanNabora.FieldValues['ID_SP_CEL_ZAMOVNIK'];
       DataVLChange['SHORT_NAME_ZAMOVNIK'].AsString  := DataSetCelPlanNabora.FieldValues['SHORT_NAME_ZAMOVNIK'];
       DataVLChange['PLAN_VALUE'].AsInteger          := DataSetCelPlanNabora.FieldValues['PLAN_VALUE'];
       T:=TFormPRK_SP_PLAN_CEL_NABOR_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeNameCelPN;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME_CEL_PN).AsInt64        :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_PLAN_NABORA').AsInt64   :=DataSetPrKVuzLicense['ID_SP_PLAN_NABORA'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_CEL_ZAMOVNIK').AsInt64  :=DataVLChange['ID_SP_CEL_ZAMOVNIK'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('PLAN_VALUE').AsInteger        :=DataVLChange['PLAN_VALUE'].AsInteger;
           try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
       ObnovitSelPN(DataVLChange['ID'].AsInt64);
       DataVLChange.Free;
       DataVLChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeCelPNExecute(sender);
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ActionViewCelPNExecute(
  Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_PLAN_CEL_NABOR_Edit;
begin
   if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['SHORT_NAME_ZAMOVNIK'].AsString   := DataSetCelPlanNabora.FieldValues['SHORT_NAME_ZAMOVNIK'];
       DataVLView['PLAN_VALUE'].AsInteger           := DataSetCelPlanNabora.FieldValues['PLAN_VALUE'];


       T:=TFormPRK_SP_PLAN_CEL_NABOR_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];

       T.cxButtonEditCel_Zamovnik.Properties.ReadOnly           :=true;
       T.cxButtonEditCel_Zamovnik.Properties.Buttons[0].Visible :=false;
       T.cxTextEditPlanValue.Properties.ReadOnly                :=true;

       T.cxButtonEditCel_Zamovnik.Style.Color     :=TextViewColor;
       T.cxTextEditPlanValue.Style.Color          :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ActionDelCelPNExecute(
  Sender: TObject);
var
   id_CelPNObnov : int64;
begin
   if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLangVL],nMsgDel[IndLangVL],
                        mtInformation,mbOKCancel,IndLangVL)=mrOK then
         begin
            StoredProcPrKVuzLicense.Transaction.StartTransaction;
            StoredProcPrKVuzLicense.StoredProcName:=StoredProcDelNameCelPN;
            StoredProcPrKVuzLicense.Prepare;
            StoredProcPrKVuzLicense.ParamByName(ID_NAME_CEL_PN).AsInt64:=DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN];
            try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
              cxGridPrKCelPlanNaboraDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
               end;
            end;
         end;
          id_CelPNObnov:=StrToInt64(DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]);
          Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
          ObnovitSelPN(id_CelPNObnov);
     end;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ObnovitSelPN(id_obnovit: int64);
begin
   DataSetCelPlanNabora.CloseOpen(false);
   DataSetCelPlanNabora.Locate(ID_NAME_CEL_PN,id_obnovit,[]);
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR.ActionObnovExecute(Sender: TObject);
var
  id_plan :int64;
begin
  if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<> null
   then id_plan := DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN];
  inherited;
  ObnovitSelPN(id_plan);
end;

end.
