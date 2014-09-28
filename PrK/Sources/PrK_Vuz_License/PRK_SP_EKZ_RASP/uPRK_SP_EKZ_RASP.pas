unit uPRK_SP_EKZ_RASP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPRK_SP_PLAN_CEL_NABOR, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxDBEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGroupBox,
  dxStatusBar, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar;

type
  TFormPRK_SP_EKZ_RASP = class(TFormPRK_SP_PLAN_CEL_NABOR)
    colNAME_PREDM: TcxGridDBColumn;
    colEKZ_DATE: TcxGridDBColumn;
    dxBarControlContainerItemPotok: TdxBarControlContainerItem;
    cxLookupComboBoxPotok: TcxLookupComboBox;
    DataSetPotok: TpFIBDataSet;
    DataSourcePotok: TDataSource;
    ActionChangeEkzRasp: TAction;
    dxBarLargeButtonChangeEkzRasp: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxLabelPotok: TcxLabel;
    ActionAddEkzRasp: TAction;
    dxBarLargeButtonAddEkzRasp: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure cxLookupComboBoxPotokPropertiesChange(Sender: TObject);
    procedure ActionChangeEkzRaspExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionAddEkzRaspExecute(Sender: TObject);
  private
    FSelectSQLTextPotok: String;
    procedure InicCaption;
    procedure ReadIdPotok;
    procedure WriteIdPotok;
    procedure SetSelectSQLTextPotok(const Value: String);
  public
    Property SelectSQLTextPotok  :String read FSelectSQLTextPotok write SetSelectSQLTextPotok;
  end;

var
  FormPRK_SP_EKZ_RASP: TFormPRK_SP_EKZ_RASP;

implementation
uses
  uConstants,uPrK_SP_EKZ_RASP_Edit,AArray,
  registry, Math,uPrK_Resources;
{$R *.dfm}

procedure TFormPRK_SP_EKZ_RASP.FormCreate(Sender: TObject);
begin
 inherited;// возможно здесь надо вызвать по другому inherited
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
 ID_NAME_CEL_PN       :='ID_SP_EKZ_RASP';
 
    // Здесь ID_NAME и SelectSQLText не нужно потому что уже делается в inherited выше
         //  ID_NAME              :='ID_SP_PLAN_NABORA';
         //  SelectSQLText        :='Select * from PRK_SP_PLAN_NABORA_SELECT';

  SelectSQLTextPotok   :='Select * from PRK_SP_POTOK_SELECT';
  SelectSQLTextCelPN   :='Select * from PRK_SP_EKZ_RASP_SELECT(:ID_SP_POTOK) where ?Mas_ID_SP_PLAN_NABORA=ID_SP_PLAN_NABORA';

  StoredProcChangeNameCelPN       :='PRK_SP_EKZ_RASP_CHANGE';
  StoredProcDelNameCelPN          :='PRK_SP_EKZ_RASP_DEL';

  TFormPRK_SP_EKZ_RASP(self).Caption  :=nFormPRK_SP_EKZ_RASP_Caption[IndLangVL];

  InicCaption;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_EKZ_RASP.InicCaption;
begin
  colNAME_PREDM.Caption :=ncolPREDM[IndLangVL];
  colEKZ_DATE.Caption   :=ncolEKZ_DATE[IndLangVL];

  cxGroupBoxPlanSelNabor.Caption :=nGroupBoxEkzRasp[IndLangVL];
  cxLabelPotok.Caption           :=nLabelPotok[IndLangVL];

  ActionAddEkzRasp.Caption       :=nAction_AddEkzRasp[IndLangVL];
  ActionAddEkzRasp.Hint          :=nHintAction_Add[IndLangVL];
  ActionChangeEkzRasp.Caption    :=nAction_ChangeEkzRasp[IndLangVL];
  ActionChangeEkzRasp.Hint       :=nHintActionChangeEkzRasp[IndLangVL];

  if SelectShemaColor=1
   then cxLookupComboBoxPotok.Style.Color     :=$00EBC4A4;
end;

procedure TFormPRK_SP_EKZ_RASP.SetSelectSQLTextPotok(const Value: String);
begin
  FSelectSQLTextPotok := Value;
  DataSetPotok.Active :=false;
  DataSetPotok.Database             := DataBasePrKVuzLicense;
  DataSetPotok.Transaction          := TransactionReadPrKVuzLicense;
  DataSetPotok.SelectSQL.Clear;
  DataSetPotok.SQLs.SelectSQL.Text  :=FSelectSQLTextPotok;
  DataSetPotok.CloseOpen(false);
end;

procedure TFormPRK_SP_EKZ_RASP.cxLookupComboBoxPotokPropertiesChange(
  Sender: TObject);
begin
  DataSetCelPlanNabora.Active                           :=false;
  DataSetCelPlanNabora.ParamByName('ID_SP_POTOK').AsInt64:=DataSetPotok.fieldValues['ID_SP_POTOK'];
  DataSetCelPlanNabora.CloseOpen(false);
  WriteIdPotok;
  cxGridPrKCelPlanNabora.SetFocus;
end;

procedure TFormPRK_SP_EKZ_RASP.ActionAddEkzRaspExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_SP_EKZ_RASP_Edit;
   TryAgain :boolean;
begin
   {}if DataSetCelPlanNabora.FieldValues['ID_SP_PERELIK_ISPIT']=Null then
    begin
      ShowMessage(nMsgEmptyPerelik_EKZ[IndLangVL]);
      exit;
    end;{}
   TryAgain:=false;
   if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null then
    begin
       DataVLAdd :=TAArray.Create;
       DataVLAdd['NAME_PREDM'].AsString           := DataSetCelPlanNabora.FieldValues['NAME_PREDM'];
       DataVLAdd['EKZ_DATE'].AsVariant            := Null;
       T:=TFormPrK_SP_EKZ_RASP_Edit.Create(self,DataVLAdd);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeNameCelPN;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME_CEL_PN).AsInt64          :=-1;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_PERELIK_ISPIT').AsInt64   :=DataSetCelPlanNabora['ID_SP_PERELIK_ISPIT'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64  :=DataSetCelPlanNabora['ID_SP_DEPARTMENT_FAK'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64      :=DataSetCelPlanNabora['ID_SP_DERG_ZAKAZ'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA').AsInt64      :=DataSetPrKVuzLicense['ID_SP_GOD_NABORA'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_POTOK').AsInt64           :=DataSetPotok['ID_SP_POTOK'];

           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_FORM_STUD').AsInt64    :=DataSetPrKVuzLicense['ID_CN_SP_FORM_STUD'];
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_KAT_STUD').AsInt64     :=DataSetPrKVuzLicense['ID_CN_SP_KAT_STUD'];

           StoredProcPrKVuzLicense.ParamByName('EKZ_DATE').AsDate               :=DataVLAdd['EKZ_DATE'].AsVariant;
           try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
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
       DataVLAdd:=nil;
   end;
   if TryAgain=true
    then ActionAddEkzRaspExecute(sender);
end;

procedure TFormPRK_SP_EKZ_RASP.ActionChangeEkzRaspExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_SP_EKZ_RASP_Edit;
   TryAgain :boolean;
begin
   if DataSetCelPlanNabora.FieldValues['ID_SP_PERELIK_ISPIT']=Null then
    begin
      ShowMessage(nMsgEmptyPerelik_EKZ[IndLangVL]);
      exit;
    end;
   TryAgain:=false;
   if DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                    := DataSetCelPlanNabora.FieldValues[ID_NAME_CEL_PN];
       DataVLChange['NAME_PREDM'].AsString           := DataSetCelPlanNabora.FieldValues['NAME_PREDM'];
       DataVLChange['EKZ_DATE'].AsVariant            := DataSetCelPlanNabora.FieldValues['EKZ_DATE'];
       T:=TFormPrK_SP_EKZ_RASP_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeNameCelPN;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME_CEL_PN).AsInt64          :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_PERELIK_ISPIT').AsInt64   :=DataSetCelPlanNabora['ID_SP_PERELIK_ISPIT'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64  :=DataSetCelPlanNabora['ID_SP_DEPARTMENT_FAK'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64      :=DataSetCelPlanNabora['ID_SP_DERG_ZAKAZ'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA').AsInt64      :=DataSetPrKVuzLicense['ID_SP_GOD_NABORA'];
           StoredProcPrKVuzLicense.ParamByName('ID_SP_POTOK').AsInt64           :=DataSetPotok['ID_SP_POTOK'];

           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_FORM_STUD').AsInt64    :=DataSetPrKVuzLicense['ID_CN_SP_FORM_STUD'];
           StoredProcPrKVuzLicense.ParamByName('ID_CN_SP_KAT_STUD').AsInt64     :=DataSetPrKVuzLicense['ID_CN_SP_KAT_STUD'];

           StoredProcPrKVuzLicense.ParamByName('EKZ_DATE').AsDate               :=DataVLChange['EKZ_DATE'].AsVariant;
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
    then ActionChangeEkzRaspExecute(sender);
end;

procedure TFormPRK_SP_EKZ_RASP.ReadIdPotok;
var
  reg               :TRegistry;
  ReadRegistryValue :string;
begin
  reg:=TRegistry.Create;
 // если '', то брать первую попавшуюся запись
  ReadRegistryValue:='';
  try
    reg.RootKey :=HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\PrK\Data\',false) then
    begin
        ReadRegistryValue :=reg.ReadString('ID_POTOK_RaspEkz');
    end;
  finally
     reg.Free;
  end;

  If Trim(ReadRegistryValue)='' then
   begin
     DataSetPotok.First;
     cxLookupComboBoxPotok.Text :=DataSetPotok.FieldValues['SHORT_NAME'];
   end
   else begin
     DataSetPotok.Locate('ID_SP_POTOK',StrToInt64(ReadRegistryValue),[]);
     cxLookupComboBoxPotok.Text :=DataSetPotok.FieldValues['SHORT_NAME'];
   end;

  DataSetCelPlanNabora.Active                           :=false;
  DataSetCelPlanNabora.ParamByName('ID_SP_POTOK').AsInt64:=DataSetPotok.fieldValues['ID_SP_POTOK'];
  DataSetCelPlanNabora.CloseOpen(false);
  //cxLookupComboBoxPotokPropertiesChange(self);
end;

procedure TFormPRK_SP_EKZ_RASP.WriteIdPotok;
var
  reg:   TRegistry;
begin
  reg:=TRegistry.Create;
  try
      reg.RootKey :=HKEY_CURRENT_USER;
      if reg.OpenKey('\Software\PrK\DATA\',true) then
      begin
         reg.WriteString('ID_POTOK_RaspEkz', VarToStr(DataSetPotok.FieldValues['ID_SP_POTOK']));
      end;
   finally
       reg.Free;
   end;
end;

procedure TFormPRK_SP_EKZ_RASP.FormShow(Sender: TObject);
begin
  ReadIdPotok;
end;

end.
