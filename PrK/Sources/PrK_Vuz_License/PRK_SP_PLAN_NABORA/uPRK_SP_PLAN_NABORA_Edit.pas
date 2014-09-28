unit uPRK_SP_PLAN_NABORA_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxCalendar;

type
  TFormPRK_SP_PLAN_NABORA_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelCnFaculSpec: TcxLabel;
    cxButtonEditCnFaculSpec: TcxButtonEdit;
    cxLabelCnKatStud: TcxLabel;
    cxButtonEditCnKatStud: TcxButtonEdit;
    cxLabelPlanValue: TcxLabel;
    cxTextEditPlanValue: TcxTextEdit;
    cxLabelCnFormStud: TcxLabel;
    cxButtonEditCnFormStud: TcxButtonEdit;
    cxLabelGodNabora: TcxLabel;
    cxButtonEditGodNabora: TcxButtonEdit;
    cxLabelDergZakaz: TcxLabel;
    cxButtonEditDergZakaz: TcxButtonEdit;
    cxLabelKurs: TcxLabel;
    cxButtonEditKurs: TcxButtonEdit;
    cxButtonEditSrokOb: TcxButtonEdit;
    cxLabelSrokOb: TcxLabel;
    cxLabelVID_DII: TcxLabel;
    cxButtonEditVID_DII: TcxButtonEdit;
    cxLabelNPK: TcxLabel;
    cxButtonEditNPK: TcxButtonEdit;
    cxLabelDateBeg: TcxLabel;
    cxDateEditDateBeg: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditCnFaculSpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCnKatStudPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCnFormStudPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGodNaboraPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditDergZakazPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCnFaculSpecKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditCnKatStudKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditCnFormStudKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditGodNaboraKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditDergZakazKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditPlanValueKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditKursKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditKursPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSrokObPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSrokObKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditNPKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditVID_DIIPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_PLAN_NABORA_Edit: TFormPRK_SP_PLAN_NABORA_Edit;

implementation
uses uConstants,uPrK_Resources,uPrK_Loader,
     uPRK_SP_PLAN_NABORA, AArray, cn_Common_Loader,cn_Common_Types;
{$R *.dfm}

procedure TFormPRK_SP_PLAN_NABORA_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxButtonEditCnFaculSpec.Text  :=DataVL['SHORT_NAME_SPEC'].asString;
  cxButtonEditCnKatStud.Text    :=DataVL['SHORT_NAME_KAT_STUD'].AsString;
  cxButtonEditCnFormStud.Text   :=DataVL['SHORT_NAME_FORM_STUD'].asString;
  cxButtonEditGodNabora.Text    :=DataVL['SHORT_NAME_GOD'].AsString;
  cxButtonEditDergZakaz.Text    :=DataVL['SHORT_NAME_ZAKAZ'].AsString;
  cxButtonEditKurs.Text         :=DataVL['SHORT_NAME_KURS'].AsString;
  cxButtonEditSrokOb.Text       :=DataVL['SHORT_NAME_SROK_OB'].AsString;
  cxButtonEditNPK.Text          :=DataVL['SHORT_NAME_NPK'].AsString;
  cxButtonEditVID_DII.Text      :=DataVL['SHORT_NAME_VID_DII'].AsString;
  cxDateEditDateBeg.Date        :=DataVL['DATE_BEG'].AsVariant;
  cxTextEditPlanValue.Text      :=DataVL['PLAN_VALUE'].AsString;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.inicCaption;
begin
  inherited;
  cxLabelCnFaculSpec.Caption  :=nLabelCnFaculSpec[VLLangEdit];
  cxLabelCnKatStud.Caption    :=nLabelCnKatStud[VLLangEdit];
  cxLabelCnFormStud.Caption   :=nLabelCnFormStud[VLLangEdit];
  cxLabelGodNabora.Caption    :=nLabelGodNabora[VLLangEdit];
  cxLabelDergZakaz.Caption    :=nLabelDergZakaz[VLLangEdit];
  cxLabelKurs.Caption         :=nLabelKurs[VLLangEdit];
  cxLabelSrokOb.Caption       :=nLabelSrokOb[VLLangEdit];
  cxLabelNPK.Caption          :=nLabelNPK[VLLangEdit];
  cxLabelVID_DII.Caption      :=nLabelVID_DII[VLLangEdit];
  cxLabelDateBeg.Caption      :=nLabelDateBeg[VLLangEdit];
  cxLabelPlanValue.Caption    :=nLabelPlanValue[VLLangEdit];
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.ActionOKExecute(Sender: TObject);
begin
  if trim(cxButtonEditCnFaculSpec.Text)='' then
   begin
     ShowMessage(nMsgEmptyCnFaculSpec[VLLangEdit]);
     cxButtonEditCnFaculSpec.SetFocus;
     exit;
   end;

   if trim(cxButtonEditCnKatStud.Text)='' then
   begin
     ShowMessage(nMsgEmptyNameCnKatStud[VLLangEdit]);
     cxButtonEditCnKatStud.SetFocus;
     exit;
   end;


  if trim(cxButtonEditCnFormStud.Text)='' then
   begin
     ShowMessage(nMsgEmptyCnFormStud[VLLangEdit]);
     cxButtonEditCnFormStud.SetFocus;
     exit;
   end;

   if trim(cxButtonEditGodNabora.Text)='' then
    begin
      ShowMessage(nMsgEmptyGodNabora[VLLangEdit]);
      cxButtonEditGodNabora.SetFocus;
      exit;
    end;

    if trim(cxButtonEditDergZakaz.Text)='' then
    begin
      ShowMessage(nMsgEmptyDergZakaz[VLLangEdit]);
      cxButtonEditDergZakaz.SetFocus;
      exit;
    end;

    if trim(cxButtonEditKurs.Text)='' then
    begin
      ShowMessage(nMsgEmptyKurs[VLLangEdit]);
      cxButtonEditKurs.SetFocus;
      exit;
    end;

    if trim(cxButtonEditNPK.Text)='' then
    begin
      ShowMessage(nMsgEmptyNPK[VLLangEdit]);
      cxButtonEditNPK.SetFocus;
      exit;
    end;

    if trim(cxButtonEditVID_DII.Text)='' then
    begin
      ShowMessage(nMsgEmptyVID_DII[VLLangEdit]);
      cxButtonEditVID_DII.SetFocus;
      exit;
    end;

    if trim(cxButtonEditSrokOb.Text)='' then
    begin
      ShowMessage(nMsgEmptySrokOb[VLLangEdit]);
      cxButtonEditSrokOb.SetFocus;
      exit;
    end;

    if trim(cxDateEditDateBeg.Text)='' then
     begin
       ShowMessage(nMsgEmptyDateBeg[VLLangEdit]);
       cxDateEditDateBeg.SetFocus;
       exit;
     end;

    if trim(cxTextEditPlanValue.Text)='' then
    begin
      ShowMessage(nMsgEmptyPlanValue[VLLangEdit]);
      cxTextEditPlanValue.SetFocus;
      exit;
    end;      
   DataVL['DATE_BEG'].AsVariant      :=cxDateEditDateBeg.Date;
   DataVL['PLAN_VALUE'].AsInteger    :=StrToInt(cxTextEditPlanValue.Text);

   ModalResult:=mrOk;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnFaculSpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;

  AParameter.DontShowGroups := True;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          DataVL['ID_CN_SP_FAK'].AsInt64        := Res[0];   // id_faculty;
          DataVL['ID_CN_SP_SPEC'].AsInt64       := Res[1];   // id_spec;
          DataVL['SHORT_NAME_FAK'].AsString     := Res[3];   //DM.DataSet['NAME'];
          DataVL['SHORT_NAME_SPEC'].AsString    := Res[4];   //DM_Detail_1.DataSet['NAME'];
          DataVL['ID_CN_JN_FACUL_SPEC'].AsInt64 := Res[6];
          cxButtonEditCnFaculSpec.Text        := DataVL['SHORT_NAME_FAK'].AsString+'/'+DataVL['SHORT_NAME_SPEC'].AsString;
          cxButtonEditCnKatStud.SetFocus;
      end;
  end;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnKatStudPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;
  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if  Res[0]<>Null then   // Проверить - точно не знаю что именно и где возвращается
      begin
          DataVL['ID_CN_SP_KAT_STUD'].AsInt64      := Res[0];
          DataVL['SHORT_NAME_KAT_STUD'].AsString   := Res[1];
          cxButtonEditCnKatStud.Text              := DataVL['SHORT_NAME_KAT_STUD'].AsString;
          cxButtonEditCnFormStud.SetFocus;
      end;
  end;
end;


procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnFormStudPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;
  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if  Res[0]<>Null then   // Проверить - точно не знаю что именно и где возвращается
      begin
          DataVL['ID_CN_SP_FORM_STUD'].AsInt64      := Res[0];
          DataVL['SHORT_NAME_FORM_STUD'].AsString   := Res[1];
          cxButtonEditCnFormStud.Text               := DataVL['SHORT_NAME_FORM_STUD'].AsString;
          cxButtonEditGodNabora.SetFocus;
      end;
  end;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditGodNaboraPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_GOD_NABORA,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_GOD_NABORA'].AsInt64   := Res[0];
              DataVL['SHORT_NAME_GOD'].AsString    := Res[2];
              cxButtonEditGodNabora.Text           := DataVL['SHORT_NAME_GOD'].AsString;
              cxButtonEditDergZakaz.SetFocus;
          end;
    end; 
end;


procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditDergZakazPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_DERG_ZAKAZ,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_DERG_ZAKAZ'].AsInt64     := Res[0];
              DataVL['SHORT_NAME_ZAKAZ'].AsString    := Res[2];
              cxButtonEditDergZakaz.Text             := DataVL['SHORT_NAME_ZAKAZ'].AsString;
              cxButtonEditKurs.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditKursPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_KURS,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_KURS'].AsInt64          := Res[0];
              DataVL['SHORT_NAME_KURS'].AsString    := Res[2];
              cxButtonEditKurs.Text            := DataVL['SHORT_NAME_KURS'].AsString;
              cxButtonEditSrokOb.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditSrokObPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_SROK_OB,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_SROK_OB'].AsInt64          := Res[0];
              DataVL['SHORT_NAME_SROK_OB'].AsString    := Res[2];
              cxButtonEditSrokOb.Text                  := DataVL['SHORT_NAME_SROK_OB'].AsString;
              cxButtonEditNPK.SetFocus;
          end;
    end;

end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnFaculSpecKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnKatStudKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditCnFormStudKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditGodNaboraKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditDergZakazKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;     

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditKursKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;
procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditSrokObKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxTextEditPlanValueKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditNPKPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin  
   res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_NPK,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_NPK'].AsInt64          := Res[0];
              DataVL['SHORT_NAME_NPK'].AsString    := Res[2];
              cxButtonEditNPK.Text           := DataVL['SHORT_NAME_NPK'].AsString;
              cxButtonEditVID_DII.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PLAN_NABORA_Edit.cxButtonEditVID_DIIPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
   res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PLAN_NABORA(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_VID_DII,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_VID_DII'].AsInt64          := Res[0];
              DataVL['SHORT_NAME_VID_DII'].AsString    := Res[2];
              cxButtonEditVID_DII.Text               := DataVL['SHORT_NAME_VID_DII'].AsString;
              cxDateEditDateBeg.SetFocus;
          end;
    end;
end;

end.
