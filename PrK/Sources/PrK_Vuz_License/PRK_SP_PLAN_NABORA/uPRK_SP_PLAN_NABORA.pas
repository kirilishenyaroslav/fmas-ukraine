unit uPRK_SP_PLAN_NABORA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPRK_SP_VUZ_LICENCE, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
  dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxLabel, cxContainer, cxTextEdit, cxDBEdit, cxGroupBox, cxSplitter, AArray;

type
  TFormPRK_SP_PLAN_NABORA = class(TFormPRK_SP_VUZ_LICENCE)
    cxSplitterNapr: TcxSplitter;
    cxGroupBoxPlanNabora: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKPlanNabora: TcxGrid;
    cxGridPrKPlanNaboraDBTableView1: TcxGridDBTableView;
    colNAME_CN_FACUL_SPEC: TcxGridDBColumn;
    colSHORT_NAME_CN_KAT_STUD: TcxGridDBColumn;
    colSHORT_NAME_CN_FORM_STUD: TcxGridDBColumn;
    colPLAN_VALUE: TcxGridDBColumn;
    cxGridPrKPlanNaboraLevel1: TcxGridLevel;
    cxGroupBoxPlanNaborDopData: TcxGroupBox;
    cxDBTextEditDateBeg: TcxDBTextEdit;
    cxLabelDateBeg: TcxLabel;
    cxLabelGodNabora: TcxLabel;
    cxDBTextEditGodNabora: TcxDBTextEdit;
    DataSetPlanNabora: TpFIBDataSet;
    DataSourcePlanNabora: TDataSource;
    DataSetPlanNaboraForAdd: TpFIBDataSet;
    ActionAddPlanNabora: TAction;
    ActionChangePlanNabora: TAction;
    ActionDelPlanNabora: TAction;
    ActionViewPlanNabora: TAction;
    dxBarLargeButtonAddPlanNabora: TdxBarLargeButton;
    dxBarLargeButtonChangePlanNabora: TdxBarLargeButton;
    dxBarLargeButtonDelPlanNabora: TdxBarLargeButton;
    dxBarLargeButtonViewPlanNabora: TdxBarLargeButton;
    cxLabelDergZakaz: TcxLabel;
    cxDBTextEditDergZakaz: TcxDBTextEdit;
    cxLabelNameCnFak: TcxLabel;
    cxDBTextEditNameCnFak: TcxDBTextEdit;
    cxLabelKurs: TcxLabel;
    cxDBTextEditKurs: TcxDBTextEdit;
    cxLabelSrokOb: TcxLabel;
    cxDBTextEditSrokOb: TcxDBTextEdit;
    cxLabelNPK: TcxLabel;
    cxDBTextEditNPK: TcxDBTextEdit;
    cxLabelVID_DII: TcxLabel;
    cxDBTextEditVID_DII: TcxDBTextEdit;
    dxBarLargeButtonCopy: TdxBarLargeButton;
    ActionCopy: TAction;
    StoredProcPlanNabora: TpFIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure ActionAddPlanNaboraExecute(Sender: TObject);
    procedure ActionChangePlanNaboraExecute(Sender: TObject);
    procedure ActionDelPlanNaboraExecute(Sender: TObject);
    procedure ActionViewPlanNaboraExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCopyExecute(Sender: TObject);
  private
    StoredProcAddNamePlanNABORA     : String;
    StoredProcChangeNamePlanNABORA  : String;
    StoredProcDelNamePlanNABORA     : String;
    StoredProcCopyNamePlanNABORA    : String;
    ID_NAME_PLAN_NABORA             : String;
    FSelectSQLTextPlanNABORA: String;
    procedure InicCaption; override;
    procedure ObnovitPlanNabora(id_obnovit: int64);
    procedure CheckActionCopy;
    procedure SetSelectSQLTextPlanNABORA(const Value: String);
  public
    Property SelectSQLTextPlanNABORA  :String read FSelectSQLTextPlanNABORA write SetSelectSQLTextPlanNABORA;
  end;

var
  FormPRK_SP_PLAN_NABORA: TFormPRK_SP_PLAN_NABORA;

implementation
uses uConstants,uPRK_SP_PLAN_NABORA_Edit, uKlassVuzLicense,
     uPrK_Resources,uPrK_Loader, StdCtrls;
{$R *.dfm}

procedure TFormPRK_SP_PLAN_NABORA.FormCreate(Sender: TObject);
begin
  inherited;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME_PLAN_NABORA :='ID_SP_PLAN_NABORA';

  StoredProcAddNamePlanNABORA          :='PRK_SP_PLAN_NABORA_ADD';
  StoredProcChangeNamePlanNABORA       :='PRK_SP_PLAN_NABORA_CHANGE';
  StoredProcDelNamePlanNABORA          :='PRK_SP_PLAN_NABORA_DEL';
  StoredProcCopyNamePlanNABORA         :='PRK_SP_PLAN_NABORA_COPY';

  SelectSQLTextPlanNABORA    :='Select * from PRK_SP_PLAN_NABORA_SELECT(:ID_SP_GOD_NABORA) where ?Mas_ID_SP_VUZ_LICENCE=ID_SP_VUZ_LICENCE';

  TFormPRK_SP_PLAN_NABORA(self).Caption := nFormPRK_SP_PLAN_NABORA_Caption[IndLangVL];

  dxBarLargeButtonPrint.Visible:=ivAlways;
  ActionPrint.Enabled          :=true;
  ActionPrint.Visible          :=true;
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_PLAN_NABORA.InicCaption;
begin
    inherited;
    colNAME_CN_FACUL_SPEC.Caption       :=ncolNAME_CN_FACUL_SPEC[IndLangVL];
    colSHORT_NAME_CN_KAT_STUD.Caption   :=ncolSHORT_NAME_CN_KAT_STUD[IndLangVL];
    colSHORT_NAME_CN_FORM_STUD.Caption  :=ncolSHORT_NAME_CN_FORM_STUD[IndLangVL];
    colPLAN_VALUE.Caption               :=ncolPLAN_VALUE[IndLangVL];

    cxLabelGodNabora.Caption        :=nLabelGodNabora[IndLangVL];
    cxLabelDateBeg.Caption          :=nLabelDateBeg[IndLangVL];
    cxLabelDergZakaz.Caption        :=nLabelDergZakaz[IndLangVL];
    cxLabelKurs.Caption             :=nLabelKurs[IndLangVL];
    cxLabelNameCnFak.Caption        :=nLabelNameCnFak[IndLangVL];
    cxLabelSrokOb.Caption           :=nLabelSrokOb[IndLangVL];
    cxLabelNPK.Caption              :=nLabelNPK_Short[IndLangVL];
    cxLabelVID_DII.Caption          :=nLabelVID_DII[IndLangVL];

    ActionAddPlanNabora.Caption       :=nAction_Add[IndLangVL];
    ActionChangePlanNabora.Caption    :=nAction_Change[IndLangVL];
    ActionDelPlanNabora.Caption       :=nAction_Del[IndLangVL];
    ActionViewPlanNabora.Caption      :=nAction_View[IndLangVL];
    ActionCopy.Caption                :=nActionCopyPlanNabora[IndLangVL];

    ActionAddPlanNabora.Hint          :=nHintAction_Add[IndLangVL];
    ActionChangePlanNabora.Hint       :=nHintAction_Change[IndLangVL];
    ActionDelPlanNabora.Hint          :=nHintAction_Del[IndLangVL];
    ActionViewPlanNabora.Hint         :=nHintAction_View[IndLangVL];
    ActionCopy.Hint                   :=nHintActionCopyPlanNabora[IndLangVL];

    cxGroupBoxPlanNabora.Caption      :=ncxGroupBoxPlanNabora[IndLangVL];
   if SelectShemaColor=1 then
   begin
    cxDBTextEditNameCnFak.Style.Color     :=$00EBC4A4;
    cxDBTextEditDergZakaz.Style.Color     :=$00EBC4A4;
    cxDBTextEditKurs.Style.Color          :=$00EBC4A4;
    cxDBTextEditGodNabora.Style.Color     :=$00EBC4A4;
    cxDBTextEditSrokOb.Style.Color        :=$00EBC4A4;
    cxDBTextEditNPK.Style.Color           :=$00EBC4A4;
    cxDBTextEditVID_DII.Style.Color       :=$00EBC4A4;
    cxDBTextEditDateBeg.Style.Color       :=$00EBC4A4;
   end;

end;

procedure TFormPRK_SP_PLAN_NABORA.ObnovitPlanNabora(id_obnovit: int64);
begin
  DataSetPlanNabora.CloseOpen(false);
  DataSetPlanNabora.Locate(ID_NAME_PLAN_NABORA,id_obnovit,[]);
  CheckActionCopy;
end;

procedure TFormPRK_SP_PLAN_NABORA.SetSelectSQLTextPlanNABORA(
  const Value: String);
begin
  FSelectSQLTextPlanNABORA := Value;
  DataSetPlanNabora.Active :=false;
  DataSetPlanNabora.Database             := DataBasePrKVuzLicense;
  DataSetPlanNabora.Transaction          := TransactionReadPrKVuzLicense;
  DataSetPlanNabora.SelectSQL.Clear;
  DataSetPlanNabora.SQLs.SelectSQL.Text  :=FSelectSQLTextPlanNABORA;
  DataSetPlanNabora.ParamByName('ID_SP_GOD_NABORA').AsInt64 := ID_SP_GOD_NABORA;
  DataSetPlanNabora.CloseOpen(False);

  CheckActionCopy;
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionAddPlanNaboraExecute(
  Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_PLAN_NABORA_Edit;
   TryAgain :boolean;
begin
    if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>null then
    begin
       TryAgain:=false;
       DataVLAdd :=TAArray.Create;
       DataVLAdd['SHORT_NAME_SPEC'].asString      :='';
       DataVLAdd['SHORT_NAME_KAT_STUD'].AsString  :='';
       DataVLAdd['SHORT_NAME_FORM_STUD'].asString :='';
       DataVLAdd['SHORT_NAME_GOD'].AsString       :='';
       DataVLAdd['SHORT_NAME_ZAKAZ'].AsString     :='';
       DataVLAdd['SHORT_NAME_KURS'].AsString      :='';
       DataVLAdd['SHORT_NAME_SROK_OB'].AsString   :='';
       DataVLAdd['SHORT_NAME_NPK'].AsString       :='';
       DataVLAdd['SHORT_NAME_VID_DII'].AsString   :='';
       DataVLAdd['DATE_BEG'].AsVariant            :=Date;
       DataVLAdd['PLAN_VALUE'].AsInteger          :=0;

       if DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]<>Null
          then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]);

       T := TFormPRK_SP_PLAN_NABORA_Edit.Create(self,DataVLAdd);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddNamePlanNABORA;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_VUZ_LICENCE').AsInt64   :=DataSetPrKVuzLicense['ID_SP_VUZ_LICENCE'];
           StoredProcPrKVuzLicense.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64 :=DataVLAdd['ID_CN_JN_FACUL_SPEC'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_KAT_STUD').AsInt64   :=DataVLAdd['ID_CN_SP_KAT_STUD'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_FORM_STUD').AsInt64  :=DataVLAdd['ID_CN_SP_FORM_STUD'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA').AsInt64    :=DataVLAdd['ID_SP_GOD_NABORA'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64    :=DataVLAdd['ID_SP_DERG_ZAKAZ'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_KURS').AsInt64          :=DataVLAdd['ID_SP_KURS'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_SROK_OB').AsInt64       :=DataVLAdd['ID_SP_SROK_OB'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_NPK').AsInt64           :=DataVLAdd['ID_SP_NPK'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_VID_DII').AsInt64       :=DataVLAdd['ID_SP_VID_DII'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('DATE_BEG').AsDate             :=DataVLAdd['DATE_BEG'].AsVariant;
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
       ObnovitPlanNabora(DataVLAdd['ID'].AsInt64);
       DataVLAdd.Free;
       DataVLAdd:=Nil;

       if TryAgain=true
          then ActionAddPlanNaboraExecute(Sender);
    end;
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionChangePlanNaboraExecute(
  Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_PLAN_NABORA_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                    := DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA];
       DataVLChange['ID_CN_JN_FACUL_SPEC'].AsInt64   := DataSetPlanNabora.FieldValues['ID_CN_JN_FACUL_SPEC'];
       DataVLChange['SHORT_NAME_SPEC'].asString      := DataSetPlanNabora.FieldValues['SHORT_NAME_SPEC'];
       DataVLChange['ID_CN_SP_KAT_STUD'].AsInt64     := DataSetPlanNabora.FieldValues['ID_CN_SP_KAT_STUD'];
       DataVLChange['SHORT_NAME_KAT_STUD'].AsString  := DataSetPlanNabora.FieldValues['SHORT_NAME_KAT_STUD'];
       DataVLChange['ID_CN_SP_FORM_STUD'].AsInt64    := DataSetPlanNabora.FieldValues['ID_CN_SP_FORM_STUD'];
       DataVLChange['SHORT_NAME_FORM_STUD'].asString := DataSetPlanNabora.FieldValues['SHORT_NAME_FORM_STUD'];
       DataVLChange['ID_SP_GOD_NABORA'].AsInt64      := DataSetPlanNabora.FieldValues['ID_SP_GOD_NABORA'];
       DataVLChange['SHORT_NAME_GOD'].AsString       := DataSetPlanNabora.FieldValues['SHORT_NAME_GOD'];
       DataVLChange['ID_SP_DERG_ZAKAZ'].AsInt64      := DataSetPlanNabora.FieldValues['ID_SP_DERG_ZAKAZ'];
       DataVLChange['SHORT_NAME_ZAKAZ'].AsString     := DataSetPlanNabora.FieldValues['SHORT_NAME_ZAKAZ'];
       DataVLChange['ID_SP_KURS'].AsInt64            := DataSetPlanNabora.FieldValues['ID_SP_KURS'];
       DataVLChange['SHORT_NAME_KURS'].AsString      := DataSetPlanNabora.FieldValues['SHORT_NAME_KURS'];
       DataVLChange['ID_SP_SROK_OB'].AsInt64         := DataSetPlanNabora.FieldValues['ID_SP_SROK_OB'];
       DataVLChange['SHORT_NAME_SROK_OB'].AsString   := DataSetPlanNabora.FieldValues['SHORT_NAME_SROK_OB'];
       DataVLChange['ID_SP_NPK'].AsInt64             := DataSetPlanNabora.FieldValues['ID_SP_NPK'];
       DataVLChange['SHORT_NAME_NPK'].AsString       := DataSetPlanNabora.FieldValues['SHORT_NAME_NPK'];
       DataVLChange['ID_SP_VID_DII'].AsInt64         := DataSetPlanNabora.FieldValues['ID_SP_VID_DII'];
       DataVLChange['SHORT_NAME_VID_DII'].AsString   := DataSetPlanNabora.FieldValues['SHORT_NAME_VID_DII'];
       DataVLChange['DATE_BEG'].AsVariant            := DataSetPlanNabora.FieldValues['DATE_BEG'];
       DataVLChange['PLAN_VALUE'].AsInteger          := DataSetPlanNabora.FieldValues['PLAN_VALUE'];
       T:=TFormPRK_SP_PLAN_NABORA_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeNamePlanNABORA;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME_PLAN_NABORA).AsInt64   :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_VUZ_LICENCE').AsInt64   :=DataSetPrKVuzLicense['ID_SP_VUZ_LICENCE'];
           StoredProcPrKVuzLicense.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64 :=DataVLChange['ID_CN_JN_FACUL_SPEC'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_KAT_STUD').AsInt64   :=DataVLChange['ID_CN_SP_KAT_STUD'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_FORM_STUD').AsInt64  :=DataVLChange['ID_CN_SP_FORM_STUD'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA').AsInt64    :=DataVLChange['ID_SP_GOD_NABORA'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64    :=DataVLChange['ID_SP_DERG_ZAKAZ'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_KURS').AsInt64          :=DataVLChange['ID_SP_KURS'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_SROK_OB').AsInt64       :=DataVLChange['ID_SP_SROK_OB'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_NPK').AsInt64           :=DataVLChange['ID_SP_NPK'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_VID_DII').AsInt64       :=DataVLChange['ID_SP_VID_DII'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('DATE_BEG').AsDate             :=DataVLChange['DATE_BEG'].AsVariant;
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
       ObnovitPlanNabora(DataVLChange['ID'].AsInt64);
       DataVLChange.Free;
       DataVLChange:=nil;
   end;
   if TryAgain=true
    then ActionChangePlanNaboraExecute(sender);
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionViewPlanNaboraExecute(
  Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_PLAN_NABORA_Edit;
begin
   if DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['SHORT_NAME_SPEC'].asString      := DataSetPlanNabora.FieldValues['SHORT_NAME_SPEC'];
       DataVLView['SHORT_NAME_KAT_STUD'].AsString  := DataSetPlanNabora.FieldValues['SHORT_NAME_KAT_STUD'];
       DataVLView['SHORT_NAME_FORM_STUD'].asString := DataSetPlanNabora.FieldValues['SHORT_NAME_FORM_STUD'];
       DataVLView['SHORT_NAME_GOD'].AsString       := DataSetPlanNabora.FieldValues['SHORT_NAME_GOD'];
       DataVLView['SHORT_NAME_ZAKAZ'].AsString     := DataSetPlanNabora.FieldValues['SHORT_NAME_ZAKAZ'];
       DataVLView['SHORT_NAME_KURS'].AsString      := DataSetPlanNabora.FieldValues['SHORT_NAME_KURS'];
       DataVLView['SHORT_NAME_SROK_OB'].AsString   := DataSetPlanNabora.FieldValues['SHORT_NAME_SROK_OB'];
       DataVLView['SHORT_NAME_NPK'].AsString       := DataSetPlanNabora.FieldValues['SHORT_NAME_NPK'];
       DataVLView['SHORT_NAME_VID_DII'].AsString   := DataSetPlanNabora.FieldValues['SHORT_NAME_VID_DII'];
       DataVLView['DATE_BEG'].AsVariant            := DataSetPlanNabora.FieldValues['DATE_BEG'];
       DataVLView['PLAN_VALUE'].AsInteger          := DataSetPlanNabora.FieldValues['PLAN_VALUE'];


       T:=TFormPRK_SP_PLAN_NABORA_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];

       T.cxButtonEditCnFaculSpec.Properties.ReadOnly           :=true;
       T.cxButtonEditCnFaculSpec.Properties.Buttons[0].Visible :=false;
       T.cxButtonEditCnKatStud.Properties.ReadOnly             :=true;
       T.cxButtonEditCnKatStud.Properties.Buttons[0].Visible   :=false;
       T.cxButtonEditCnFormStud.Properties.ReadOnly            :=true;
       T.cxButtonEditCnFormStud.Properties.Buttons[0].Visible  :=false;
       T.cxButtonEditGodNabora.Properties.ReadOnly             :=true;
       T.cxButtonEditGodNabora.Properties.Buttons[0].Visible   :=false;
       T.cxButtonEditDergZakaz.Properties.ReadOnly             :=true;
       T.cxButtonEditDergZakaz.Properties.Buttons[0].Visible   :=false;
       T.cxButtonEditKurs.Properties.ReadOnly                  :=true;
       T.cxButtonEditKurs.Properties.Buttons[0].Visible        :=false;
       T.cxButtonEditSrokOb.Properties.ReadOnly                :=true;
       T.cxButtonEditSrokOb.Properties.Buttons[0].Visible      :=false;
       T.cxButtonEditNPK.Properties.ReadOnly                   :=true;
       T.cxButtonEditNPK.Properties.Buttons[0].Visible         :=false;
       T.cxButtonEditVID_DII.Properties.ReadOnly               :=true;
       T.cxButtonEditVID_DII.Properties.Buttons[0].Visible     :=false;

       T.cxDateEditDateBeg.Properties.ReadOnly                 :=true;
       T.cxTextEditPlanValue.Properties.ReadOnly               :=true;

       T.cxButtonEditCnFaculSpec.Style.Color     :=TextViewColor;
       T.cxButtonEditCnKatStud.Style.Color       :=TextViewColor;
       T.cxButtonEditCnFormStud.Style.Color      :=TextViewColor;
       T.cxButtonEditGodNabora.Style.Color       :=TextViewColor;
       T.cxButtonEditDergZakaz.Style.Color       :=TextViewColor;
       T.cxButtonEditKurs.Style.Color            :=TextViewColor;
       T.cxButtonEditSrokOb.Style.Color          :=TextViewColor;
       T.cxButtonEditNPK.Style.Color             :=TextViewColor;
       T.cxButtonEditVID_DII.Style.Color         :=TextViewColor;
       T.cxDateEditDateBeg.Style.Color           :=TextViewColor;
       T.cxTextEditPlanValue.Style.Color         :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionDelPlanNaboraExecute(
  Sender: TObject);
var
   id_PlanNaboraObnov : int64;
begin
   if DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLangVL],nMsgDel[IndLangVL],
                        mtInformation,mbOKCancel,IndLangVL)=mrOK then
         begin
            StoredProcPrKVuzLicense.Transaction.StartTransaction;
            StoredProcPrKVuzLicense.StoredProcName:=StoredProcDelNamePlanNABORA;
            StoredProcPrKVuzLicense.Prepare;
            StoredProcPrKVuzLicense.ParamByName(ID_NAME_PLAN_NABORA).AsInt64:=DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA];
            try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
              cxGridPrKPlanNaboraDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
               end;
            end;
         end;
          id_PlanNaboraObnov:=StrToInt64(DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]);
          Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
          ObnovitPlanNabora(id_PlanNaboraObnov);
     end;
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionObnovExecute(Sender: TObject);
var
  id_plan :int64;
begin
  if DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA]<> null
   then id_plan := DataSetPlanNabora.FieldValues[ID_NAME_PLAN_NABORA];
  inherited;
  ObnovitPlanNabora(id_plan);
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionPrintExecute(Sender: TObject);
var
  InputParam :TAArray;
  i:Integer;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKVuzLicense.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'PLAN_NABORA';

    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_SP_GOD_NABORA;
    InputParam['Input']['Count_Param'].AsInteger        :=  1;

  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPRK_SP_PLAN_NABORA.ActionCopyExecute(Sender: TObject);
var Res:Variant;
    ID_SP_GOD_NABORA_FROM:Int64;
    ViewMessageForm:TForm;
    WITH_CEL, i:Integer;
begin
  inherited;
//******************************************************************************
  ViewMessageForm:=CreateMessageDialog(nMsgCopyPlanNabora[IndLangVL],mtConfirmation,[mbYes,mbNo,mbCancel]);
  with ViewMessageForm do
   begin
   for i:=0 to ComponentCount-1 do
    if (Components[i].ClassType=TButton) then
     begin
      if UpperCase((Components[i] as TButton).Caption)='&YES' then
        begin
         (Components[i] as TButton).Left:=100;
         (Components[i] as TButton).Top:=50;
         (Components[i] as TButton).Caption := nMsgCopyPlanNaboraWOCel[IndLangVL];
         (Components[i] as TButton).Width:=200;
        end;
      if UpperCase((Components[i] as TButton).Caption)='&NO' then
        begin
         (Components[i] as TButton).Left:=100;
         (Components[i] as TButton).Top:=80;
         (Components[i] as TButton).Caption := nMsgCopyPlanNaboraWCel[IndLangVL];;
         (Components[i] as TButton).Width:=200;
        end;
      if UpperCase((Components[i] as TButton).Caption)='CANCEL' then
        begin
         (Components[i] as TButton).Left:=100;
         (Components[i] as TButton).Top:=110;
         (Components[i] as TButton).Caption := nMsgCopyPlanNaboraCancel[IndLangVL];;
         (Components[i] as TButton).Width:=200;
        end;
     end;
   Caption:=nMsgBoxTitle[IndLangVL];
   Width:=400;
   Height:=165;
   Position:=poScreenCenter;
   i:=ShowModal;
   Free;
  end;
  case i of
    mrYes:begin
            WITH_CEL:=0;
          end;
    mrNo:begin
            WITH_CEL:=1;
          end;
    mrCancel:begin
               Exit;
             end;
  end;
//******************************************************************************
    Res:=uPrK_Loader.ShowPrkSprav(self,DataBasePrKVuzLicense.Handle,PrK_SP_GOD_NABORA,fsNormal);
    if not(VarIsNull(Res)) then
      if VarIsArray(Res) then
        begin
          ID_SP_GOD_NABORA_FROM:=Res[0];

           if ID_SP_GOD_NABORA_FROM = ID_SP_GOD_NABORA then Exit;

           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcCopyNamePlanNABORA;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA_FROM').AsInt64 :=ID_SP_GOD_NABORA_FROM;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA_TO').AsInt64   := ID_SP_GOD_NABORA;
           StoredProcPrKVuzLicense.ParamByName('WITH_CEL').AsInteger   := WITH_CEL;
           try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                            nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
              end;
           end;
          ActionObnovExecute(Self);
        end;

end;

procedure TFormPRK_SP_PLAN_NABORA.CheckActionCopy;
begin
  StoredProcPlanNabora.StoredProcName:='PRK_SP_PLAN_NABORA_COUNT_BY_GOD';
  StoredProcPlanNabora.Prepare;
  StoredProcPlanNabora.ParamByName('ID_SP_GOD_NABORA').AsInt64:=ID_SP_GOD_NABORA;
  StoredProcPlanNabora.ExecProc;

  if StoredProcPlanNabora.FN('REC_COUNT').AsInt64=0 then
    ActionCopy.Enabled:=True
  else
    ActionCopy.Enabled:=False;
end;


end.
