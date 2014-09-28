unit uFrameDopolnVedomosti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxLabel, DB, RxMemDS, cxCheckBox, cxDropDownEdit, cxCalendar,uPrK_Resources,
  FIBDataSet, pFIBDataSet, cxDBLabel, cxDBEdit;

type
  TFrameDopolnVedomosti = class(TFrame)
    cxLabelCel_Zamovnik: TcxLabel;
    cxButtonEditCel_Zamovnik: TcxButtonEdit;
    RxMemoryDataCanUpdateDopolnVedomosti: TRxMemoryData;
    cxLabelUkr_Lang: TcxLabel;
    cxButtonEditUkr_Lang: TcxButtonEdit;
    cxLabelGurtog: TcxLabel;
    cxButtonEditGurtog: TcxButtonEdit;
    cxLabelCn_National: TcxLabel;
    cxButtonEditCn_National: TcxButtonEdit;
    cxCheckBoxIS_SB_OTKAZ: TcxCheckBox;
    cxLabelIS_SB_OTKAZ: TcxLabel;
    cxDateEditDateBeg: TcxDateEdit;
    cxLabelDateBegObuch: TcxLabel;
    cxDBTextEditKat_Pri_D: TcxDBTextEdit;
    cxLabelVID_DOG: TcxLabel;
    cxButtonEditVID_DOG: TcxButtonEdit;
    procedure cxButtonEditCel_ZamovnikPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditUkr_LangPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGurtogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCn_NationalPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCel_ZamovnikKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditVID_DOGPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
     procedure GetObnovDataSetDopVedom;
  public
    procedure InicCaptionFrame;
    procedure OnActiveSheetDopVedom;
    procedure InicDataFrame(rejim :RejimPrK);
    procedure SaveDopolnVedomosti;
    function  ProverkaOnExists: integer;
  end;

implementation
uses
   uConstants,uPrK_Loader,
   AArray,uPRK_DT_ABIT, uFrameVstup, cn_Common_Loader,cn_Common_Types;
{$R *.dfm}

procedure TFrameDopolnVedomosti.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    cxLabelCel_Zamovnik.Caption    :=nLabelCel_Zamovnik[i];
    cxLabelUkr_Lang.Caption        :=nLabelUkr_Lang[i];
    cxLabelGurtog.Caption          :=nLabelGurtog[i];
    cxLabelCn_National.Caption     :=nLabelCn_National[i];
    cxLabelVID_DOG.Caption         :=nLabelVID_DOG[i];
    cxLabelIS_SB_OTKAZ.Caption     :=nLabelIS_SB_OTKAZ[i];
    cxLabelDateBegObuch.Caption    :=nLabelDateBegObuch[i];

    cxDBTextEditKat_Pri_D.Text     :=nDBTextEditKat_Pri_D[i];// значение по умолчанию

    // »з-за этого будут ошибки при изменении данных абитуриента....
    cxButtonEditCel_Zamovnik.Text  := '';

    cxButtonEditUkr_Lang.Text      := '';
    cxButtonEditGurtog.Text        := '';
    cxButtonEditCn_National.Text   := '';
    cxButtonEditVID_DOG.text       := '';
    

  // в будущем переместить в другую процедуру
  RxMemoryDataCanUpdateDopolnVedomosti.Open;
    RxMemoryDataCanUpdateDopolnVedomosti.Insert;
    RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FAK').Value          :=0;
    RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_JN_FACUL_SPEC').Value   :=0;
    RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FORM_STUD').Value    :=0;
    RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_KAT_STUD').Value     :=0;
    RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_FAK_CENTER').Value         :=0;
  RxMemoryDataCanUpdateDopolnVedomosti.Post;
end;

procedure TFrameDopolnVedomosti.cxButtonEditCel_ZamovnikPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle);
    InOutParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_CEL_ZAMOVNIK;
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['CannotEdit'].AsInteger         := 1;
    InOutParam['Input']['ID_SP_GOD_NABORA'].AsInt64     := TFormPRK_DT_ABIT(self.Owner).ID_GOD_NABORA_GLOBAL;
    InOutParam['Input']['ID_CN_SP_FORM_STUD'].AsInt64   := RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FORM_STUD').Value;
    InOutParam['Input']['ID_CN_SP_KAT_STUD'].AsInt64    := RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_KAT_STUD').Value;
    InOutParam['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64  := RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_JN_FACUL_SPEC').Value;
    InOutParam['Input']['ID_CN_SP_FAK'].AsInt64         := RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FAK').Value;
    InOutParam['Input']['ID_FAK_CENTER'].AsInt64        := RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_FAK_CENTER').Value;
  uPrK_Loader.ShowVuzLicense(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_CEL_ZAMOVNIK'].AsVariant<>Null then
  begin
      TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_CEL_ZAMOVNIK'].AsInt64    :=InOutParam['OutPut']['ID_SP_CEL_ZAMOVNIK'].AsInt64;
      TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_ZAMOVNIK'].AsString  :=InOutParam['OutPut']['SHORT_NAME'].AsString;
      cxButtonEditCel_Zamovnik.Text    := TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_ZAMOVNIK'].AsString;
      cxButtonEditGurtog.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;
end;

procedure TFrameDopolnVedomosti.OnActiveSheetDopVedom;
begin
     // ѕроверка на то: ѕомен€лись ли во TFrameVstup1 парметры, если да то
    // происходит обновление DataSetOcenki
    // “ака€ организаци€ if'ов провер€ет сначала наиболее веро€тные возможности изменени€
    if RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FORM_STUD').Value <>
       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD']
       then GetObnovDataSetDopVedom
       else if RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_JN_FACUL_SPEC').Value <>
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC']
               then GetObnovDataSetDopVedom
               else if RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FAK').Value <>
                       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK']
                       then GetObnovDataSetDopVedom
                       else if RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_KAT_STUD').Value<>
                               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD']
                               then GetObnovDataSetDopVedom
                               else if RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_FAK_CENTER').Value<>
                                       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetTypeDepart.FieldValues['ID_FAK_CENTER']
                                       then GetObnovDataSetDopVedom;

end;

procedure TFrameDopolnVedomosti.GetObnovDataSetDopVedom;
begin
     RxMemoryDataCanUpdateDopolnVedomosti.Edit;
       RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FORM_STUD').Value  :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
       RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_JN_FACUL_SPEC').Value :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
       RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_FAK').Value        :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
       RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_CN_SP_KAT_STUD').Value   :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
       RxMemoryDataCanUpdateDopolnVedomosti.FieldByName('ID_FAK_CENTER').Value        :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetTypeDepart.FieldValues['ID_FAK_CENTER'];
    RxMemoryDataCanUpdateDopolnVedomosti.Post;

end;


procedure TFrameDopolnVedomosti.cxButtonEditUkr_LangPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle,PrK_SP_UKR_LANG,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_UKR_LANG'].AsInt64      := Res[0];
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_UKR_LANG'].AsString   := Res[2];
        cxButtonEditUkr_Lang.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_UKR_LANG'].AsString;
        cxButtonEditCn_National.SetFocus;
    end;
  end;
end;

procedure TFrameDopolnVedomosti.cxButtonEditGurtogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle,PrK_SP_GURTOG,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_GURTOG'].AsInt64      := Res[0];
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_GURTOG'].AsString   := Res[2];
        cxButtonEditGurtog.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_GURTOG'].AsString;
        cxButtonEditUkr_Lang.SetFocus;
    end;
  end;
end;

procedure TFrameDopolnVedomosti.cxButtonEditCn_NationalPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
    AParameter.Owner           :=self;
    AParameter.Db_Handle       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle;
    AParameter.Formstyle       :=fsNormal;
    //AParameter.WaitPakageOwner :=self;
    res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_National.bpl','ShowSPNational');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if  Res[0]<>Null then   // ѕроверить - точно не знаю что именно и где возвращаетс€
      begin
          TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_CN_SP_NATIONAL'].AsInt64       := Res[0];
          TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_NATIONAL'].AsString    := Res[2];
          cxButtonEditCn_National.Text  := TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_NATIONAL'].AsString;
          cxButtonEditVID_DOG.SetFocus;
      end;
  end;
end;

procedure TFrameDopolnVedomosti.cxButtonEditCel_ZamovnikKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key:=Chr(0);
end;

procedure TFrameDopolnVedomosti.InicDataFrame(rejim: RejimPrK);
begin

 if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_CEL_ZAMOVNIK']<> null then
 begin
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_CEL_ZAMOVNIK'].AsInt64   :=
               TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_CEL_ZAMOVNIK'];
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_ZAMOVNIK'].AsString :=
               TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SHORT_NAME_CEL_ZAMOVNIK'];
  cxButtonEditCel_Zamovnik.Text    := TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_ZAMOVNIK'].AsString;
 end;

 
 if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_SP_UKR_LANG']<>null then
 begin
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_UKR_LANG'].AsInt64       :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_SP_UKR_LANG'];
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_UKR_LANG'].AsString    :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['SHORT_NAME_UKR_LANG'];
  cxButtonEditUkr_Lang.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_UKR_LANG'].AsString;
 end;

 if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_SP_GURTOG']<>null then
 begin
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_GURTOG'].AsInt64         :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_SP_GURTOG'] ;
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_GURTOG'].AsString      :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['SHORT_NAME_GURTOG'];
  cxButtonEditGurtog.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_GURTOG'].AsString;
 end;

 if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_CN_SP_NATIONAL']<>null then
 begin
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_CN_SP_NATIONAL'].AsInt64    :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['ID_CN_SP_NATIONAL'];
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_NATIONAL'].AsString :=
               TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['SHORT_NAME_NATIONAL'];
  cxButtonEditCn_National.Text  := TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['SHORT_NAME_NATIONAL'].AsString;
 end;

 //************14.03.07********************
 if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_VID_DOG']<>null then
 begin
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_VID_DOG'].AsInt64         :=
               TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_VID_DOG'] ;
  TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_VID_DOG'].AsString      :=
               TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SHORT_NAME_VID_DOG'];
  cxButtonEditVID_DOG.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_VID_DOG'].AsString;
 end;
 //************14.03.07*******************

 if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['IS_SB_OTKAZ']=1
   then cxCheckBoxIS_SB_OTKAZ.Checked:=true;

 cxDateEditDateBeg.Date   := TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['DATE_BEG'];

 cxDBTextEditKat_Pri_D.DataBinding.DataSource :=TFormPRK_DT_ABIT(self.Owner).DataSourcePrK_ABIT;
 cxDBTextEditKat_Pri_D.DataBinding.DataField  :='SHORT_NAME_KAT_PRI_D';

  if rejim=ViewPrK then
   begin
       cxButtonEditCel_Zamovnik.Properties.ReadOnly  :=true;
       cxButtonEditCel_Zamovnik.Properties.Buttons[0].Visible :=false;
       cxButtonEditUkr_Lang.Properties.ReadOnly      :=true;
       cxButtonEditUkr_Lang.Properties.Buttons[0].Visible     :=false;
       cxButtonEditGurtog.Properties.ReadOnly        :=true;
       cxButtonEditGurtog.Properties.Buttons[0].Visible       :=false;
       cxButtonEditCn_National.Properties.ReadOnly   :=true;
       cxButtonEditCn_National.Properties.Buttons[0].Visible  :=false;
       cxButtonEditVID_DOG.Properties.ReadOnly       :=true;
       cxButtonEditVID_DOG.Properties.Buttons[0].Visible      :=false;

       cxCheckBoxIS_SB_OTKAZ.Properties.ReadOnly   :=true;
       cxDateEditDateBeg.Properties.ReadOnly       :=true;

       cxCheckBoxIS_SB_OTKAZ.Style.Color    :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
       cxDateEditDateBeg.Style.Color        :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
   end;
end;

function TFrameDopolnVedomosti.ProverkaOnExists: integer;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;


   if (trim(cxButtonEditUkr_Lang.Text)='') or
      (TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_UKR_LANG'].AsInt64=-1) then
   begin
     ShowMessage(nMsgEmptyUkr_Lang[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetDopolnVedomosti.Show;
     cxButtonEditUkr_Lang.SetFocus;
     result:=1;
     exit;
   end;

   if (trim(cxButtonEditGurtog.Text)='') or
      (TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_GURTOG'].AsInt64=-1) then
   begin
     ShowMessage(nMsgEmptyGurtog[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetDopolnVedomosti.Show;
     cxButtonEditGurtog.SetFocus;
     result:=1;
     exit;
   end;

   if (trim(cxButtonEditCn_National.Text)='') or
      (TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_CN_SP_NATIONAL'].AsInt64=-1) then
   begin
     ShowMessage(nMsgEmptyCn_National[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetDopolnVedomosti.Show;
     cxButtonEditCn_National.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxDateEditDateBeg.Text)='' then
   begin
     ShowMessage(nMsgEmptyDateBeg[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetDopolnVedomosti.Show;
     cxDateEditDateBeg.SetFocus;
     result:=1;
     exit;
   end;

   result:=0;
end;

procedure TFrameDopolnVedomosti.SaveDopolnVedomosti;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;

    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_KAT_PRI_D_CHANGE';
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64 :=TFormPRK_DT_ABIT(self.Owner).ID_ABIT_OUT;
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64    :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
     try
        TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
     except on e: Exception do
        begin
           MessageBox(Handle,Pchar(nMsgErrorTransaction[i]+chr(13)+
                      nMsgTryAgain[i]+nMsgOr[i]+nMsgToAdmin[i]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[i]),MB_OK or MB_ICONWARNING);
           TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
           TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
           Exit;
        end;
     end;
end;

procedure TFrameDopolnVedomosti.cxButtonEditVID_DOGPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle,PrK_SP_VID_DOG,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_VID_DOG'].AsInt64      := Res[0];
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_VID_DOG'].AsString      := Res[2];
        cxButtonEditVID_DOG.Text  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_VID_DOG'].AsString;
        cxCheckBoxIS_SB_OTKAZ.SetFocus;
    end;
  end;
end;

end.
